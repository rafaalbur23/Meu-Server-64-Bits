#define _CRTDBG_MAP_ALLOC
#include <stdlib.h>
#include <crtdbg.h>

#include "AccountServer2.h"
#include <gamecommon.h>
#include <inifile.h>
#include <util.h>
#include "GlobalVariable.h"
#include <conformity.h>

#include <botan/botan.h>
#include <botan/bcrypt.h>

#pragma warning(disable : 4800)

//TLSIndex g_TlsIndex;
AuthQueue g_Auth; // ��֤�������

LoginTmpList tmpLogin; //   ��½��ʱ�б�

uLong NetBuffer[] =
	{400, 300, 200, 100, 50, 40, 30, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 30, 0};
bool  g_logautobak = true;

volatile long AccountServer2::m_nMembersCount = 0;

// Tcp Server
AccountServer2::AccountServer2(ThreadPool* proc, ThreadPool* comm) :
	TcpServerApp(this, proc, comm, false),
	RPCMGR(this), m_GsHeap(1, 100), m_GsList(NULL), m_GsNumber(0)
{
  //Add by sunny.sun 20090201
  //m_mmsproc = ThreadPool::CreatePool(4, 8, 1024, THREAD_PRIORITY_ABOVE_NORMAL);
  //m_mmscomm = ThreadPool::CreatePool(12, 24, 2048, THREAD_PRIORITY_ABOVE_NORMAL);
  m_GsHeap.Init();

  IniFile		 inf(g_strCfgFile.c_str());
  IniSection&	 is	  = inf["net"];
  char const*	 ip	  = is["listen_ip"];
  unsigned short port = atoi(is["listen_port"]);
  //Add by sunny.sun 20090201
  try
  {
	//m_ToMMS = new ToMMS(g_strCfgFile.c_str(), m_mmsproc, m_mmscomm);
	//m_mmsproc->AddTask(new ConnectMMS(m_ToMMS));
  } catch(...)
  {
	//m_mmsproc->DestroyPool();
	//m_mmscomm->DestroyPool();

	//if(m_ToMMS)
	//{
	//	delete m_ToMMS;
	//	m_ToMMS = NULL;
	//}
  }

  // the offset of "packet length" is 0
  // the field of "packet length" is 2 bytes
  // the max length of packet is 4K bytes
  // the max length of send queue is 100
  SetPKParse(0, 2, 4 * 1024, 100);

#ifdef _DEBUG
  BeginWork(200);
#else
  BeginWork(30);
#endif

  OpenListenSocket(port, ip);

  ResetMembersCount();
}
AccountServer2::~AccountServer2()
{
  ShutDown(12 * 1000);
  //Add by sunny.sun 20090201
  //m_mmsproc->DestroyPool();
  //m_mmscomm->DestroyPool();

  //delete m_ToMMS;
}

void AccountServer2::IncreaseMembers(long nCount)
{
  InterlockedExchangeAdd(&m_nMembersCount, nCount);
}

void AccountServer2::DecreaseMembers(long nCount)
{
  InterlockedExchangeAdd(&m_nMembersCount, -nCount);
}

void AccountServer2::ResetMembersCount()
{
  InterlockedExchange(&m_nMembersCount, 0);
}

long AccountServer2::GetMembersCount()
{
  return m_nMembersCount;
}

bool AccountServer2::OnConnect(DataSocket* datasock)
{
  return true;
}
void AccountServer2::OnProcessData(DataSocket* datasock, RPacket& rpkt)
{
  unsigned short usCmd = rpkt.ReadCmd();

  switch(usCmd)
  {
	// GroupServerЭ��
  case CMD_PA_LOGOUT:
  {
	g_Auth.AddPK(datasock, rpkt);
	break;
  }
	// ��֤��Э��
  case CMD_PA_USER_LOGOUT:
  {
	g_Auth.AddPK(datasock, rpkt);
	break;
  }
  case CMD_PA_GMBANACCOUNT:
  {
	string actName = rpkt.ReadString();
	g_MainDBHandle.OperAccountBan(actName, 3);
	break;
  }
	// ����δ֪Э��
  default:
	LG("As2Excp", "Unknown usCmd=[%d]\n", usCmd);
  }
}
WPacket AccountServer2::OnServeCall(DataSocket* datasock, RPacket& rpkt)
{
  unsigned short usCmd = rpkt.ReadCmd();

  switch(usCmd)
  {
	// GroupServerЭ��
  case CMD_PA_LOGIN:
	return Gs_Login(datasock, rpkt);

	// ��֤��Э��
  case CMD_PA_USER_LOGIN:
	return g_Auth.SyncPK(datasock, rpkt, 20 * 1000);

	// ����δ֪Э��
  default:
	LG("As2Excp", "Unknown usCmd=[%d]\n", usCmd);
	return ProcessUnknownCmd(rpkt);
  }
}
WPacket AccountServer2::ProcessUnknownCmd(RPacket rpkt)
{
  WPacket wpkt = GetWPacket();
  wpkt.WriteShort(ERR_AP_UNKNOWNCMD);
  return wpkt;
}
void AccountServer2::OnDisconnect(DataSocket* datasock, int reason)
{
  Gs_Logout(datasock);
}

// GroupServer��ط���
void AccountServer2::Gs_Init()
{
  m_GsNumber = 0;
  m_GsList	 = NULL;
  m_GsHeap.Init();
  m_GsListLock.Create(false);
}
GroupServer2* AccountServer2::Gs_Find(char const* szGroupName)
{
  GroupServer2* curr = m_GsList;
  GroupServer2* prev = NULL;

  while(curr != NULL)
  {
	if(curr->m_strName.compare(szGroupName) == 0) break;

	prev = curr;
	curr = curr->m_next;
  }

  return curr;
}
bool AccountServer2::Gs_Auth(char const* szGroupName, char const* szGroupPwd)
{
  char const* pwd = NULL;
  IniFile	  inf(g_strCfgFile.c_str());

  try
  {
	pwd = inf["gs"][szGroupName];
  } catch(...)
  {
	return false;
  }

  return (strcmp(pwd, szGroupPwd) == 0) ? true : false;
}
void AccountServer2::Gs_ListAdd(GroupServer2* Gs)
{
  Gs->m_next = m_GsList;
  m_GsList	 = Gs;
  ++m_GsNumber;
}
void AccountServer2::Gs_ListDel(GroupServer2* Gs)
{
  GroupServer2* curr = m_GsList;
  GroupServer2* prev = NULL;

  while(curr)
  {
	if(curr == Gs) break;

	prev = curr;
	curr = curr->m_next;
  }

  if(curr)
  {
	if(prev)
	{
	  prev->m_next = curr->m_next;
	} else
	{
	  m_GsList = curr->m_next;
	}

	--m_GsNumber;
  }
}
void	AccountServer2::Gs_Exit() {}
WPacket AccountServer2::Gs_Login(DataSocket* datasock, RPacket& rpkt)
{
  /*
2005-4-14 add by Arcol: 
���ִ˺������������̵߳���,������Ҫһ���߳�ͬ����
���ִ˺�����Gs_Logout���ܴ��ڶ��߳�ͬ�����е����,�˺�����Ҫ��Gs_Logout����һ���߳�ͬ����
���˺����ܸ��ٷ���(���������ݿ����),�����߳�ͬ��������ʺܵ�
ʹ�ô�Χ�߳�ͬ�������Խ��ͬһ�����ڲ���Դ��ͻ����,���޷�������溯�����õĳ�ͻ(��Ȼ��������ּ��ʸ��ӵ�)
����Ч�ķ����ǰ�Gs_Login��Gs_Logout֮��ĺ�������̵߳���ת���ɶ�����Ϣ����,��ṹ�Ķ��Ƚϴ�,Ŀǰδ���ô˷���
*/

  bool		  bAuthSuccess	= false;
  bool		  bAlreadyLogin = false;
  char const* szGroupName	= rpkt.ReadString();
  char const* szGroupPwd	= rpkt.ReadString();

  if(FindGroup(szGroupName) != NULL)
  {
	bAlreadyLogin = true;
  } else
  {
	bAuthSuccess = Gs_Auth(szGroupName, szGroupPwd);
  }

  WPacket wpkt = GetWPacket();
  if(bAlreadyLogin)
  {
	wpkt.WriteShort(ERR_AP_GPSLOGGED);
  } else
  {
	if(bAuthSuccess)
	{
	  GroupServer2* pGs = m_GsHeap.Get();
	  pGs->m_strName	= szGroupName;
	  pGs->m_strAddr	= datasock->GetPeerIP();
	  pGs->m_datasock	= datasock;

	  if(AddGroup(pGs))
	  {
		// ���뵽List�ɹ�
		datasock->SetPointer(pGs);
		wpkt.WriteShort(ERR_SUCCESS);
		//cout << "[" << szGroupName << "] Add Successfully!" << endl;
		LG("GroupServer", "[%s] Add Successfully!\n", szGroupName);
	  } else
	  {
		// ���뵽Listʧ�ܣ�˵����ͬ��GroupServer�ոյ�¼��������쳣
		pGs->Free();
		bAlreadyLogin = true;
		wpkt.WriteShort(ERR_AP_GPSAUTHFAIL);
	  }
	} else
	{
	  wpkt.WriteShort(ERR_AP_GPSAUTHFAIL);
	}
  }

  if(bAlreadyLogin) Disconnect(datasock, 1000);
  return wpkt;
}
void AccountServer2::Gs_Logout(DataSocket* datasock)
{
  /*
2005-4-14 add by Arcol: 
���ִ˺������������̵߳���,������Ҫһ���߳�ͬ����
���ִ˺�����Gs_Login���ܴ��ڶ��߳�ͬ�����е����,�˺�����Ҫ��Gs_Login����һ���߳�ͬ����
���˺����ܸ��ٷ���(���������ݿ����),�����߳�ͬ��������ʺܵ�
ʹ�ô�Χ�߳�ͬ�������Խ��ͬһ�����ڲ���Դ��ͻ����,���޷�������溯�����õĳ�ͻ(��Ȼ��������ּ��ʸ��ӵ�)
����Ч�ķ����ǰ�Gs_Login��Gs_Logout֮��ĺ�������̵߳���ת���ɶ�����Ϣ����,��ṹ�Ķ��Ƚϴ�,Ŀǰδ���ô˷���
����GroupServer�Ͽ����Ӻ����״̬,����AccountServerҲ��Ӧ������û�״̬,�ڵȴ��Զ������Ӻ���ָܻ�����,��Ҫ��GroupServer������AccountServerҲ��������
*/
  std::string strGroupName;

  GroupServer2* pGs = (GroupServer2*)datasock->GetPointer();
  if((pGs == NULL) || (pGs->m_datasock != datasock)) return;

  strGroupName = pGs->m_strName;
  LG("GroupServer", "[%s] disconnected!\n", strGroupName.c_str());

  if(DelGroup(datasock))
  {
	WPacket wpkt = GetWPacket();
	wpkt.WriteCmd(CMD_PA_LOGOUT);
	wpkt.WriteString(strGroupName.c_str());
	OnProcessData(datasock, RPacket(wpkt));
  }
}
GroupServer2* AccountServer2::FindGroup(char const* szGroup)
{
  GroupServer2* pGs = NULL;

  m_GsListLock.lock();
  try
  {
	pGs = Gs_Find(szGroup);
  } catch(...)
  {
	LG("As2Excp", "Exception raised from KickAccount when find GroupServer: [%s]\n", szGroup);
  }
  m_GsListLock.unlock();

  return pGs;
}
void AccountServer2::DisplayGroup()
{
  extern void ClearGroupList();
  extern BOOL AddGroupToList(char const* strName, char const* strAddr, char const* strStatus);

  GroupServer2* pGs = m_GsList;
  ClearGroupList();
  m_GsListLock.lock();
  try
  {
	while(pGs != NULL)
	{
	  //AddGroupToList(pGs->GetName(), pGs->GetAddr(), "������");
	  AddGroupToList(pGs->GetName(), pGs->GetAddr(), RES_STRING(AS_ACCOUNTSERVER2_CPP_00001));
	  pGs = pGs->m_next;
	}
  } catch(...)
  {}
  m_GsListLock.unlock();
}
bool AccountServer2::AddGroup(GroupServer2* pGs)
{
  bool bAlreadyLogin = false;

  m_GsListLock.lock();
  try
  {
	if(Gs_Find(pGs->m_strName.c_str()) != NULL)
	{
	  bAlreadyLogin = true;
	}

	if(!bAlreadyLogin)
	{
	  Gs_ListAdd(pGs);
	}
  } catch(...)
  {
	LG("As2Excp", "Exception raised from AddGroup() when add [%s]\n", pGs->m_strName.c_str());
	bAlreadyLogin = true; // �������GroupServer��¼
  }
  m_GsListLock.unlock();

  return !bAlreadyLogin;
}
bool AccountServer2::DelGroup(DataSocket* datasock)
{
  bool			bDel = false;
  GroupServer2* pGs	 = NULL;

  m_GsListLock.lock();
  try
  {
	// ����һ�μ��!
	pGs = (GroupServer2*)datasock->GetPointer();
	if((pGs != NULL) && (pGs->m_datasock == datasock))
	{
	  Gs_ListDel(pGs);
	  datasock->SetPointer(NULL);
	  bDel = true;
	  pGs->Free();
	}
  } catch(...)
  {
	LG("As2Excp", "Exception raised from AddGroup() when add [%s]\n", pGs->m_strName.c_str());
  }
  m_GsListLock.unlock();

  return bDel;
}

// Auth
AuthQueue::AuthQueue() :
	PKQueue(false) {}
AuthQueue::~AuthQueue() {}
void AuthQueue::ProcessData(DataSocket* datasock, RPacket& rpkt)
{
  bool			 bRetry = true;
  unsigned short usCmd	= rpkt.ReadCmd();

  // �õ���ǰ�̶߳���
  AuthThread* pThis = (AuthThread*)(g_TlsIndex.GetPointer());
  if(pThis == NULL) return;

  while(bRetry)
  {
	try
	{
	  switch(usCmd)
	  {
	  case CMD_PA_LOGOUT:
	  {
		pThis->LogoutGroup(datasock, rpkt);
	  }
	  break;

	  case CMD_PA_USER_LOGOUT:
	  {
		pThis->AccountLogout(rpkt);
	  }
	  break;
	  default:
		LG("AuthProcessData", "Unknown usCmd=[%d], Skipped...\n", usCmd);
		break;
	  }
	  bRetry = false;
	} catch(CSQLException* se)
	{
	  LG("AuthProcessDataExcp", "SQL Exception: %s\n", se->m_strError.c_str());

	  // ����
	  pThis->Reconnt();
	} catch(...)
	{
	  LG("AuthProcessDataExcp", "unknown exception raised from AuthQueue::ProcessData()\n");
	  bRetry = false; // �����ݿ���ɵ��쳣�Ź�
	}
  }
}

WPacket AuthQueue::ServeCall(DataSocket* datasock, RPacket& rpkt)
{
  bool			 bRetry = true;
  unsigned short usCmd	= rpkt.ReadCmd();
  WPacket		 wpkt	= datasock->GetWPacket();

  // �õ���ǰ�̶߳���
  AuthThread* pThis = (AuthThread*)(g_TlsIndex.GetPointer());
  if(pThis == NULL)
  {
	LG("AuthExcp", "pThis = NULL\n");
	wpkt.WriteShort(ERR_AP_TLSWRONG);
	return wpkt;
  }

  while(bRetry)
  {
	try
	{
	  switch(usCmd)
	  {
	  case CMD_PA_USER_LOGIN:
	  {
		pThis->QueryAccount(datasock, rpkt);
		return pThis->AccountLogin(datasock);
	  }

	  default:
	  {
		LG("AuthServeCall", "Unknown usCmd=[%d], Skipped...\n", usCmd);
		wpkt.WriteShort(ERR_AP_UNKNOWNCMD);
		return wpkt;
	  }
	  }
	} catch(CSQLException* se)
	{
	  LG("AuthServeCallExcp", "SQL Exception: %s\n", se->m_strError.c_str());

	  // ����
	  pThis->Reconnt();
	} catch(...)
	{
	  LG("AuthServeCallExcp", "unknown exception raised from AuthQueue::ServerCall()\n");
	  bRetry = false; // �����ݿ���ɵ��쳣�Ź�
	}
  }

  wpkt.WriteShort(ERR_AP_UNKNOWN);
  return wpkt;
}

//  LoginTmpList
LoginTmpList::LoginTmpList()
{
  InitializeCriticalSection(&m_cs);
}

LoginTmpList::~LoginTmpList()
{
  DeleteCriticalSection(&m_cs);
}

bool LoginTmpList::Insert(const std::string& name)
{
  bool ret = false;
  Lock();
  if(!Query(name, false))
  {
	m_list.push_back(name);
	ret = true;
  }
  UnLock();
  return ret;
}

bool LoginTmpList::Remove(const std::string& name)
{
  bool					ret = false;
  TmpNameList::iterator it;
  Lock();
  for(it = m_list.begin(); it != m_list.end(); it++)
  {
	if((*it) == name)
	{
	  ret = true;
	  m_list.erase(it);
	  break;
	}
  }
  UnLock();
  return ret;
}

bool LoginTmpList::Query(const std::string& name, bool lock /* = true*/)
{
  bool					ret = false;
  TmpNameList::iterator it;
  if(lock)
  {
	Lock();
  }
  for(it = m_list.begin(); it != m_list.end(); it++)
  {
	if((*it) == name)
	{
	  ret = true;
	  break;
	}
  }
  if(lock)
  {
	UnLock();
  }
  return ret;
}

void LoginTmpList::Lock()
{
  EnterCriticalSection(&m_cs);
}

void LoginTmpList::UnLock()
{
  LeaveCriticalSection(&m_cs);
}

// AuthThread
Sema		AuthThread::m_Sema(0, AuthThreadPool::AT_MAXNUM);
std::string AuthThread::m_strSrvip			  = "";
std::string AuthThread::m_strSrvdb			  = "";
std::string AuthThread::m_strUserId			  = "";
std::string AuthThread::m_strUserPwd		  = "";
std::string AuthThread::m_strAccountTableName = "account_login";
AuthThread::AuthThread(int nIndex) :
	m_nIndex(nIndex) {}
AuthThread::~AuthThread() { Exit(); }
void AuthThread::Init()
{
  g_TlsIndex.SetPointer(NULL);

  SetRunLabel(-1);

  while(!Connect())
  {
	if(GetExitFlag()) return;
	Sleep(5000);
  }
  g_TlsIndex.SetPointer(this);
  ResetAccount();

  SetRunLabel(0);
}
void AuthThread::Exit()
{
  Disconn();
  g_TlsIndex.SetPointer(NULL);
}
bool AuthThread::Connect()
{
  string err_info;
  const bool r = db_connection.connect(m_strSrvip.c_str(), m_strSrvdb.c_str(), m_strUserId.c_str(), m_strUserPwd.c_str(), err_info);
  if (r)
  {
	db_mutator = std::make_unique<cfl_rs>(&db_connection);
  }
  return r;
}
void AuthThread::Disconn()
{
  db_connection.disconn();
}
void AuthThread::Reconnt()
{
  Disconn();
  while(!Connect())
  {
	LG("As2", RES_STRING(AS_ACCOUNTSERVER2_CPP_00002));
	if(GetExitFlag()) return;

	Sleep(5000);
  }
}
void AuthThread::LoadConfig()
{
  IniFile	  inf(g_strCfgFile.c_str());
  IniSection& is	 = inf["db"];
  std::string strTmp = "";

  try
  {
	m_strSrvip = is["dbserver"].c_str();
	m_strSrvdb = is["db"].c_str();
	m_strUserId = is["userid"].c_str();
	strTmp = is["passwd"].c_str();

  } catch(std::exception const& e)
  {
	cout << e.what() << endl;
	getchar();
	ExitProcess(-1);
  }
  dbpswd_out(strTmp.c_str(), (int)strTmp.length(), m_strUserPwd);
}

void AuthThread::LogUserLogin(int nUserID, string strUserName, string strIP)
{
  sUserLog* pUserLog	= new sUserLog;
  pUserLog->bLogin		= true;
  pUserLog->nUserID		= nUserID;
  pUserLog->strUserName = strUserName;
  pUserLog->strLoginIP	= strIP;
  if(!PostMessage(g_hMainWnd, WM_USER_LOG, 0, (LPARAM)pUserLog))
  {
	LG("AccountServer", "AuthThread::LogUserLogin: PostMessage WM_USER_LOG failed!\n");
	delete pUserLog;
  }
}

void AuthThread::LogUserLogout(int nUserID)
{
  sUserLog* pUserLog = new sUserLog;
  pUserLog->bLogin	 = false;
  pUserLog->nUserID	 = nUserID;
  if(!PostMessage(g_hMainWnd, WM_USER_LOG, 0, (LPARAM)pUserLog))
  {
	LG("AccountServer", "AuthThread::LogUserLogout: PostMessage WM_USER_LOG failed!\n");
	delete pUserLog;
  }
}

void AuthThread::QueryAccount(DataSocket* datasock, RPacket rpkt)
{
  unsigned short usNameLen;
  const char const*	 pName		= NULL;
  char			 szSql[512] = {0};
  SetRunLabel(11);

  // ȡ���е���Ϣ����һ����������Ϣ������(shit!)
  //LG("AuthThread", ",%d\n", ::GetCurrentThreadId());

  // Read this stuff but ignore it, as the packet was duplicated.
  //@to-do: add ReverseReadSequence/ReverseReadString.
  uShort cipherlen;
  uShort ivlen;
  rpkt.ReadSequence(cipherlen);
  rpkt.ReadSequence(ivlen);

  //Add by sunny.sun 20081223
  string szLocale = "";
  szLocale		  = rpkt.ReadString();
  pName			  = rpkt.ReadString();

  // �ڶ������ʺ�����Ϣ
  pName = rpkt.ReadString(&usNameLen);

  LG("PASSWD", "From GroupServer [%s] = [%d]\n", pName, strlen(pName));
  if((pName == NULL) || (!common::conformity::login::name::is_valid(pName, usNameLen)))
  {
	LG("AuthExcp", "NULL or INVALID Name field\n");
	m_AcctInfo.bExist = false;
	return;
  }


  constexpr unsigned long  MAGIC_NUMBER_BLOCKINTERVAL = 120 * 1000;
  constexpr unsigned short MAGIC_NUMBER_BLOCKNUM	  = 5;
  auto					   this_tick				  = GetTickCount64();
  // Limit number of connection attempts
  std::unique_lock<std::mutex> lock(g_As2->mutex_attempt);
  AccountServer2::AttemptInfo& info = g_As2->attempt_info[datasock->GetPeerIP()];

  if(!info.canAttemptToLogin && this_tick - info.last_block_timestamp > MAGIC_NUMBER_BLOCKINTERVAL)
  {
	info.canAttemptToLogin				 = true;
  }
  if(this_tick - info.first_attempt_timestamp > MAGIC_NUMBER_BLOCKINTERVAL)
  {
	info.first_attempt_timestamp		 = this_tick;
	info.login_attempts_in_last_interval = 0;
  }
  
  if(info.canAttemptToLogin)
  {
	if(++info.login_attempts_in_last_interval > MAGIC_NUMBER_BLOCKNUM)
	{
	  info.canAttemptToLogin	= false;
	  info.last_block_timestamp = this_tick;
	}
  }
  else {
	lock.unlock();
	return;
  }
  lock.unlock();

  // -- // -- // -- // -- //
  m_AcctInfo.strName	   = pName;

  m_AcctInfo.strMAC		   = rpkt.ReadString();
  uShort plainlen;
  cChar* plainptr				= rpkt.ReadSequence(plainlen);
  m_AcctInfo.plaintext_password = std::string(plainptr, plainptr + plainlen);


  in_addr ipAddr;
  ipAddr.S_un.S_addr = rpkt.ReadLong();
  m_AcctInfo.strIP	 = inet_ntoa(ipAddr);

  // ��ѯ����
  SetRunLabel(12);

  std::string buf[7];
  int		  affect_rows = 0;

  db_mutator->_get_row_stored_procedure(buf, std::size(buf), "{CALL dbo.QueryAccount(?)}", "dbo", "QueryAccount", &affect_rows, 1, pName );
  /*CSQLRecordset rs(*m_pAuth);*/

  // ��֯SQL��ѯ���
  //sprintf(szSql, "select id, password, sid, login_status, login_group, ban, datediff(s, enable_login_time, getdate()) as protect_time from account_login where name='%s'",
  //_snprintf_s(szSql, sizeof(szSql), _TRUNCATE, "select id, password, sid, login_status, login_group, ban, datediff(s, enable_login_time, getdate()) as protect_time from account_login where name='%s'",
		//	  m_AcctInfo.strName.c_str());
  //rs << szSql; //account_login����name�ֶ�һ��Ҫ��ΨһԼ��

  // ִ�в�ѯ
  //rs.SQLExecDirect();
  SetRunLabel(13);


  if(affect_rows == 1)
  {
	m_AcctInfo.bExist		= true;
	m_AcctInfo.nId			= atoi(buf[0].c_str());
	m_AcctInfo.strBcryptHash = buf[1];
	m_AcctInfo.nSid			= atoi(buf[2].c_str());
	m_AcctInfo.nStatus		= atoi(buf[3].c_str());
	m_AcctInfo.strGroup		= buf[4];
	m_AcctInfo.nBan			= atoi(buf[5].c_str());
	m_AcctInfo.nProtectTime = atoi(buf[6].c_str());

	if(!tmpLogin.Insert(m_AcctInfo.strName))
	{
	  m_AcctInfo.nStatus = ACCOUNT_ONLINE;
	  LG("AuthExcp", "Account %s multilogin at same times.\n", m_AcctInfo.strName.c_str());
	}
  }
  else
  {
	m_AcctInfo.bExist = false;
  }

  // ������ѯ���
 // if(rs.SQLFetch())
 // {
	//int n					= 1;
	//m_AcctInfo.bExist		= true;
	//m_AcctInfo.nId			= rs.nSQLGetData(n++);
	//m_AcctInfo.strPwdDigest = rs.SQLGetData(n++);
	//m_AcctInfo.nSid			= rs.nSQLGetData(n++);
	//m_AcctInfo.nStatus		= rs.nSQLGetData(n++);
	//m_AcctInfo.strGroup		= rs.SQLGetData(n++);
	//// Modify by lark.li 20080825 begin
	////m_AcctInfo.bBan=rs.bSQLGetData(n++);
	//m_AcctInfo.nBan = rs.nSQLGetData(n++);
	//// End
	//m_AcctInfo.nProtectTime = rs.nSQLGetData(n++);

	////static bool flag = true; // �����ظ���½�ô���
	////if(flag)
	////{
	////	::Sleep(5000);
	////}
	////flag = !flag;

	//if(!tmpLogin.Insert(m_AcctInfo.strName))
	//{
	//  m_AcctInfo.nStatus = ACCOUNT_ONLINE;
	//  LG("AuthExcp", "Account %s multilogin at same times.\n", m_AcctInfo.strName.c_str());
	//}
 // } else
 // {
	//m_AcctInfo.bExist = false;
 // }
}

WPacket AuthThread::AccountLogin(DataSocket* datasock)
{
  DWORD dwStartCount = GetTickCount();

  SetRunLabel(14);
  WPacket		wpkt			 = datasock->GetWPacket();
  GroupServer2* pFromGroupServer = (GroupServer2*)datasock->GetPointer();
  if(pFromGroupServer == NULL)
  {
	// ��GroupServer�Ѷϵ�
	LG("AuthExcp", "pFromGroupServer = NULL\n");
	wpkt.WriteShort(ERR_AP_DISCONN);
	return wpkt;
  }
  SetRunLabel(15);

  wpkt.WriteCmd(0); //added by andor.zhang,���⻺������ԭ��GroupServer����CMD_AP_KICKUSER������

  // Modify by lark.li 20080825 begin
  std::unique_lock<std::mutex> lock(g_As2->mutex_attempt);
  if (!g_As2->attempt_info[datasock->GetPeerIP()].canAttemptToLogin) {
	wpkt.WriteShort(ERR_AP_TOO_MANY_ATTEMPTS);
	return wpkt;
	lock.unlock();
  }
  lock.unlock();
  if(!m_AcctInfo.bExist)
  {
	// �����ڴ��û�
	wpkt.WriteShort(ERR_AP_INVALIDUSER);
	return wpkt;
  }
  if(m_AcctInfo.nBan == 2)
  {
	tmpLogin.Remove(m_AcctInfo.strName);
	wpkt.WriteShort(ERR_AP_BANUSER);
	return wpkt;
  } else if(m_AcctInfo.nBan == 1)
  {
	tmpLogin.Remove(m_AcctInfo.strName);
	wpkt.WriteShort(ERR_AP_PBANUSER);
	return wpkt;
  }
  //Add by sunny.sun 20090827
  else if(m_AcctInfo.nBan == 3)
  {
	tmpLogin.Remove(m_AcctInfo.strName);
	wpkt.WriteShort(ERR_AP_SBANUSER);
	return wpkt;
  }
  // End

  SetRunLabel(16);

  bool bVerify = Botan::check_bcrypt(m_AcctInfo.plaintext_password, m_AcctInfo.strBcryptHash);


  if(!bVerify)
  { // ��֤ʧ��
	wpkt.WriteShort(ERR_AP_INVALIDPWD);
	LG("AccountAuth", "Thread#%d Auth [%s] (id=%d) failed: invalid password!\n", m_nIndex, m_AcctInfo.strName.c_str(), m_AcctInfo.nId);
	tmpLogin.Remove(m_AcctInfo.strName);
	return wpkt;
  }
  SetRunLabel(17);

  int  nKeyLen		 = 0;
  char szKey[1024]	 = {0};
  char lpszSQL[2048] = {0};
  int  nSid			 = GenSid(m_AcctInfo.strName.c_str());
  if(m_AcctInfo.nStatus == ACCOUNT_OFFLINE)
  {
	const int new_status = ACCOUNT_ONLINE;
	const auto ret = db_mutator->stored_procedure("{CALL AccountLogin(?, ?, ?, ?, ?)}", "dbo", "AccountLogin", 5, &new_status, pFromGroupServer->GetName(), m_AcctInfo.strMAC.c_str(), m_AcctInfo.strIP.c_str(), &m_AcctInfo.nId);
	//��½ǰ״̬�ǲ�����(������½)
	//sprintf(lpszSQL, "update account_login set login_status=%d, login_group='%s', enable_login_time=getdate(), last_login_time=getdate(), last_login_mac='%s', last_login_ip='%s' where id=%d",
	//_snprintf_s(lpszSQL, sizeof(lpszSQL), _TRUNCATE, "update account_login set login_status=%d, login_group='%s', enable_login_time=getdate(), last_login_time=getdate(), last_login_mac='%s', last_login_ip='%s' where id=%d",
	//			ACCOUNT_ONLINE, pFromGroupServer->GetName(), m_AcctInfo.strMAC.c_str(), m_AcctInfo.strIP.c_str(), m_AcctInfo.nId);
	//if(m_pAuth->ExecuteSQL(lpszSQL))
	if(DBOK(ret))
	{
	  //Add by sunny.sun 20090205 for album
	  //Win32Guid id;
	  //id.Generate();
	  //std::string SessionKey = id.AsString();
	  //char albumSQL[2048] = {0};
	  //_snprintf_s( albumSQL, sizeof(albumSQL), _TRUNCATE,"IF EXISTS(SELECT act_name FROM act_album WHERE act_name= '%s')UPDATE act_album SET SessionKey='%s', update_time = getdate() WHERE act_name= '%s' ELSE INSERT INTO act_album(act_name,SessionKey,act_id,create_time,update_time) VALUES('%s','%s',%d,getdate(),getdate())"
	  //	,m_AcctInfo.strName.c_str(), SessionKey.c_str(), m_AcctInfo.strName.c_str(), m_AcctInfo.strName.c_str(), SessionKey.c_str(), m_AcctInfo.nId);
	  //if(m_pAuth->ExecuteSQL(albumSQL))
	  {
		SetRunLabel(18);
		wpkt.WriteShort(ERR_SUCCESS);
		wpkt.WriteLong(m_AcctInfo.nId);
		wpkt.WriteLong(nSid);
		//Add by sunny.sun 20090205
		//wpkt.WriteString( SessionKey.c_str() );
		wpkt.WriteString("temp");
		LogUserLogin(m_AcctInfo.nId, m_AcctInfo.strName.c_str(), m_AcctInfo.strIP.c_str());
	  }
	  //else
	  {
		//	wpkt.WriteShort(ERR_AP_UNKNOWN);
		//	LG("AccountAuth", "Thread#%d Auth [%s] (id=%d) failed: update database error where normal login!\n", m_nIndex, m_AcctInfo.strName.c_str(), m_AcctInfo.nId);
		//	SetRunLabel(19);
		//	goto login_over;
	  }
	} else
	{
	  wpkt.WriteShort(ERR_AP_UNKNOWN);
	  LG("AccountAuth", "Thread#%d Auth [%s] (id=%d) failed: update database error where normal login!\n", m_nIndex, m_AcctInfo.strName.c_str(), m_AcctInfo.nId);
	  SetRunLabel(19);
	  goto login_over;
	}
  } else if(m_AcctInfo.nStatus == ACCOUNT_ONLINE)
  {
	const int  new_status = ACCOUNT_SAVING;
	const auto ret = db_mutator->stored_procedure("{CALL AccountLogin(?, ?, ?, ?, ?)}", "dbo", "AccountLogin", 5, &new_status, pFromGroupServer->GetName(), m_AcctInfo.strMAC.c_str(), m_AcctInfo.strIP.c_str(), &m_AcctInfo.nId);
	//��½ǰ״̬��������(�ظ���½)
	//sprintf(lpszSQL, "update account_login set login_status=%d, login_group='%s', last_login_time=getdate(), last_login_mac='%s', last_login_ip='%s' where id=%d",
	//_snprintf_s(lpszSQL, sizeof(lpszSQL), _TRUNCATE, "update account_login set login_status=%d, login_group='%s', last_login_time=getdate(), last_login_mac='%s', last_login_ip='%s' where id=%d",
	//			ACCOUNT_SAVING, pFromGroupServer->GetName(), m_AcctInfo.strMAC.c_str(), m_AcctInfo.strIP.c_str(), m_AcctInfo.nId);
	//if(m_pAuth->ExecuteSQL(lpszSQL))
	if(DBOK(ret))
	{
	  if(pFromGroupServer->IsSame(m_AcctInfo.strGroup))
	  {
		wpkt.WriteCmd(CMD_AP_KICKUSER);
		wpkt.WriteShort(ERR_AP_ONLINE);
		wpkt.WriteLong(m_AcctInfo.nId);
	  } else
	  {
		KickAccount(m_AcctInfo.strGroup, m_AcctInfo.nId);
	  }
	  SetRunLabel(20);
	  goto login_over;
	} else
	{
	  wpkt.WriteShort(ERR_AP_UNKNOWN);
	  LG("AccountAuth", "Thread#%d Auth [%s] (id=%d) failed: update database error when relogin!\n", m_nIndex, m_AcctInfo.strName.c_str(), m_AcctInfo.nId);
	  SetRunLabel(21);
	  goto login_over;
	}
  } else if(m_AcctInfo.nStatus == ACCOUNT_SAVING)
  {
	//�ʺ�������״̬(�����ɫ)
	if(m_AcctInfo.nProtectTime >= 0 && m_AcctInfo.nProtectTime < SAVING_TIME)
	{
	  wpkt.WriteShort(ERR_AP_SAVING);
	  SetRunLabel(22);
	  goto login_over;
	} else
	{
	  const int	 new_status = ACCOUNT_ONLINE;
	  const auto ret		= db_mutator->stored_procedure("{CALL AccountLogin(?, ?, ?, ?, ?)}", "dbo", "AccountLogin", 5, &new_status, pFromGroupServer->GetName(), m_AcctInfo.strMAC.c_str(), m_AcctInfo.strIP.c_str(), &m_AcctInfo.nId);
	  //sprintf(lpszSQL, "update account_login set login_status=%d, login_group='%s', enable_login_time=getdate(), last_login_time=getdate(), last_login_mac='%s', last_login_ip='%s' where id=%d",
	  //_snprintf_s(lpszSQL, sizeof(lpszSQL), _TRUNCATE, "update account_login set login_status=%d, login_group='%s', enable_login_time=getdate(), last_login_time=getdate(), last_login_mac='%s', last_login_ip='%s' where id=%d",
			//	  ACCOUNT_ONLINE, pFromGroupServer->GetName(), m_AcctInfo.strMAC.c_str(), m_AcctInfo.strIP.c_str(), m_AcctInfo.nId);
	  //if(m_pAuth->ExecuteSQL(lpszSQL))
	  if(DBOK(ret))
	  {
		//Win32Guid id;
		//id.Generate();
		//std::string SessionKey = id.AsString();
		//char albumSQL[2048] = {0};
		//_snprintf_s( albumSQL, sizeof(albumSQL), _TRUNCATE,"IF EXISTS(SELECT act_name FROM act_album WHERE act_name= '%s')UPDATE act_album SET SessionKey='%s', update_time = getdate() WHERE act_name= '%s' ELSE INSERT INTO act_album(act_name,SessionKey,act_id,create_time,update_time) VALUES('%s','%s',%d,getdate(),getdate())"
		//	,m_AcctInfo.strName.c_str(), SessionKey.c_str(), m_AcctInfo.strName.c_str(), m_AcctInfo.strName.c_str(), SessionKey.c_str(), m_AcctInfo.nId);
		//if(m_pAuth->ExecuteSQL(albumSQL))
		{
		  SetRunLabel(23);
		  wpkt.WriteShort(ERR_SUCCESS);
		  wpkt.WriteLong(m_AcctInfo.nId);
		  wpkt.WriteLong(nSid);
		  //wpkt.WriteString( SessionKey.c_str() );
		  wpkt.WriteString("temp");
		  LogUserLogin(m_AcctInfo.nId, m_AcctInfo.strName.c_str(), m_AcctInfo.strIP.c_str());
		}
		//else
		//{
		//	wpkt.WriteShort(ERR_AP_UNKNOWN);
		//	LG("AccountAuth", "Thread#%d Auth [%s] (id=%d) failed: update database error when login without locked!\n", m_nIndex, m_AcctInfo.strName.c_str(), m_AcctInfo.nId);
		//	SetRunLabel(24);
		//	goto login_over;
		//}
	  } else
	  {
		wpkt.WriteShort(ERR_AP_UNKNOWN);
		LG("AccountAuth", "Thread#%d Auth [%s] (id=%d) failed: update database error when login without locked!\n", m_nIndex, m_AcctInfo.strName.c_str(), m_AcctInfo.nId);
		SetRunLabel(24);
		goto login_over;
	  }
	}
  } else
  {
	//��½ǰ״̬�ǲ�ȷ��
	wpkt.WriteShort(ERR_AP_UNKNOWN);
	LG("AccountAuth", "Thread#%d Auth [%s] (id=%d) failed: unknown last login status!\n", m_nIndex, m_AcctInfo.strName.c_str(), m_AcctInfo.nId);
	SetRunLabel(25);
	goto login_over;
  }
  SetRunLabel(0);

login_over:

  DWORD dwEndCount					= GetTickCount() - dwStartCount;
  AuthThreadPool::RunLast[m_nIndex] = dwEndCount;
  if(dwEndCount > AuthThreadPool::RunConsume[m_nIndex])
  {
	AuthThreadPool::RunConsume[m_nIndex] = dwEndCount;
  }
  tmpLogin.Remove(m_AcctInfo.strName);
  return wpkt;
}

void AuthThread::AccountLogout(RPacket rpkt)
{
  SetRunLabel(99);
  //char lpszSQL[2048] = {0};
  const int nID = rpkt.ReadLong();
  //sprintf(lpszSQL, "update account_login set login_status=%d, login_group='', enable_login_time=getdate(), last_logout_time=getdate() where id=%d", ACCOUNT_OFFLINE, nID);
  //sprintf(lpszSQL, "update account_login set login_status=%d, login_group='', enable_login_time=getdate(), last_logout_time=getdate(), total_live_time=total_live_time+datediff(second, last_login_time, getdate()) where id=%d", ACCOUNT_OFFLINE, nID);  //  ��������ʱ�� by jampe
  const int	 new_status = ACCOUNT_OFFLINE;
  const auto ret = db_mutator->stored_procedure("{CALL AccountLogout(?, ?)}", "dbo", "AccountLogout", 2, &new_status, &nID);
  //_snprintf_s(lpszSQL, sizeof(lpszSQL), _TRUNCATE, "update account_login set login_status=%d, login_group='', enable_login_time=getdate(), last_logout_time=getdate(), total_live_time=total_live_time+datediff(second, last_login_time, getdate()) where id=%d", ACCOUNT_OFFLINE, nID); //  ��������ʱ�� by jampe
  //if(m_pAuth->ExecuteSQL(lpszSQL))
  if(DBOK(ret))
  {
	SetRunLabel(0);
  }
  LogUserLogout(nID);
}

void AuthThread::LogoutGroup(DataSocket* datasock, RPacket rpkt)
{
  /*
2005-4-14 added by arcol:
�������Ͽ���������Զ�����,��˲�����ʺ�״̬,Ҫ��GroupServer������AccountServerҲ��Ҫ����
*/

  SetRunLabel(0);
}

long AuthThread::GenSid(char const* szName)
{
#define SHA1_DIGEST_LEN 20
  char md[SHA1_DIGEST_LEN];

  // ������ϢԴ
  char buf[256];
  //int buf_len = sprintf(buf, "%s%d", szName, GetTickCount());
  int buf_len = _snprintf_s(buf, sizeof(buf), _TRUNCATE, "%s%d", szName, GetTickCount());
  if(buf_len >= sizeof buf)
	throw std::out_of_range("buffer overflow in GenSid()\n");

  // ����ժҪ
  sha1((unsigned char*)buf, buf_len, (unsigned char*)md);

  // ȡ��ǰ4���ֽ�
  long* ptr = (long*)md;
  return ptr[0];
}
void AuthThread::ResetAccount()
{
  /*
2005-4-17 added by Arcol:
������뿴����ͷ��,��������������д,Ŀǰ�ⲿ���߳���CDataBaseCtrl������Գ�ʼ�������ڻ����ݿ�
ע��:�����m_nIndexΪ0ʱ������һ�����״�ִ��,���,���ܳ���һ�����,�������߳��Ѿ���չ��֤������,����ʱ0�������̲߳Ž�����ʼ��������ɱ����Դ���ʳ�ͻ,���³�ʼ��ʧ��
*/
  return; //����ʹ�ú���Ĵ��� 2005-4-17
}
void AuthThread::KickAccount(std::string& strGroup, int nId)
{
  GroupServer2* pGs = g_As2->FindGroup(strGroup.c_str());
  if(pGs != NULL)
  {
	WPacket wpkt = pGs->GetWPacket();
	wpkt.WriteCmd(CMD_AP_KICKUSER);
	wpkt.WriteShort(ERR_AP_LOGINTWICE);
	wpkt.WriteLong(nId);
	pGs->SendData(wpkt);
  }
}
int AuthThread::Run()
{
  Init();
  while(!GetExitFlag())
  {
	g_Auth.PeekPacket(1000); // ����1���ʱ�����ɼ������е������
  }
  Exit();

  ExitThread();
  return 0;
}
void AuthThread::SetRunLabel(int nRunLabel)
{
  AuthThreadPool::RunLabel[m_nIndex] = nRunLabel;
}

//
int volatile AuthThreadPool::RunLabel[AT_MAXNUM]	 = {0};
DWORD volatile AuthThreadPool::RunLast[AT_MAXNUM]	 = {0};
DWORD volatile AuthThreadPool::RunConsume[AT_MAXNUM] = {0};
unsigned int volatile AuthThreadPool::uiAuthCount	 = 0;
void		 AuthThreadPool::IncAuthCount() { ++uiAuthCount; }
unsigned int AuthThreadPool::GetAuthCount() { return uiAuthCount; }
AuthThreadPool::AuthThreadPool()
{
  for(int i = 0; i < AT_MAXNUM; ++i)
  {
	m_Pool[i] = new AuthThread(i);
  }
  AuthThread::LoadConfig();
}
AuthThreadPool::~AuthThreadPool()
{
  for(int i = 0; i < AT_MAXNUM; ++i)
  {
	if(m_Pool[i] != NULL)
	{
	  delete m_Pool[i];
	  m_Pool[i] = NULL;
	}
  }
}
void AuthThreadPool::Launch()
{
  for(int i = 0; i < AT_MAXNUM; ++i)
  {
	m_Pool[i]->Launch();
  }
}
void AuthThreadPool::NotifyToExit()
{
  for(int i = 0; i < AT_MAXNUM; ++i)
  {
	m_Pool[i]->NotifyToExit();
  }
}
void AuthThreadPool::WaitForExit()
{
  //printf("���ڵȴ��̳߳��ڵ����߳��˳������Ժ�\n");
  printf(RES_STRING(AS_ACCOUNTSERVER2_CPP_00006));
  for(int i = 0; i < AT_MAXNUM; ++i)
  {
	m_Pool[i]->WaitForExit(-1);
  }
}

// �����ܶ���
AccountServer2* g_As2 = NULL;
