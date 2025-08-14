#ifndef NETIF_H
#define NETIF_H

#include "CommRPC.h"
#include "PacketQueue.h"
#include "Connection.h"
#include <PacketEncryption.h>

class CProCirculate;

_DBC_USING

// ����Э�� (���ݰ�->��Ϸ����)
typedef RPacket& LPRPACKET;
typedef WPacket& LPWPACKET;

// ���ڼ�¼Log
// class CLogName
// {
// public:
// 	CLogName();
// 	void	Init();
//
// 	char*	SetLogName( DWORD dwWorlID, const char* szName );	// ����Log����
// 	char*	GetLogName( DWORD dwWorlID );		// Ҫ��ID�õ�log����
// 	char*	GetMainLogName();					// �õ����ǵ�log����
//
// 	bool	IsMainCha( DWORD dwWorlID );
//
// private:
// 	enum
// 	{
// 		LOG_NAME = 256,
// 		LOG_MAX = 1000,
// 	};
//
// 	DWORD	_dwWorldArray[LOG_MAX];
// 	char	_szLogName[LOG_MAX][LOG_NAME];
// 	char	_szNoFind[LOG_NAME];
// };

class NetIF : public TcpClientApp, public RPCMGR, public PKQueue
{
  public:
  // Packet��Ϣ������ Server -> Client ��Ϣ����ܿ�
  BOOL HandlePacketMessage(dbc::DataSocket* datasock, LPRPACKET pk);
  // Packet���ͺ���     Client -> Server ��Ϣ�����ܿ�
  void		   SendPacketMessage(LPWPACKET pk);
  dbc::RPacket NetIF::SyncSendPacketMessage(LPWPACKET pk, unsigned long timeout = 30 * 1000);

  //===============================================================================================
  NetIF(dbc::ThreadPool* comm = 0);
  virtual ~NetIF();
  virtual void OnProcessData(dbc::DataSocket* datasock, dbc::RPacket& recvbuf);
  virtual bool OnConnect(dbc::DataSocket* datasock);				//����ֵ:true-��������,false-����������
  virtual void OnDisconnect(dbc::DataSocket* datasock, int reason); //reasonֵ:0-���س��������˳���-1-Socket����-3-���类�Է��رգ�-5-�����ȳ������ơ�

  bool		   IsConnected() { return m_connect.IsConnected(); }
  int		   GetConnStat() { return m_connect.GetConnStat(); }
  virtual void ProcessData(dbc::DataSocket* datasock, dbc::RPacket& recvbuf);

  unsigned long	 GetAveragePing();
  CProCirculate* GetProCir(void) { return m_pCProCir; }
  void			 SwitchNet(bool isConnected);

  Connection m_connect;
  struct
  {
	dbc::uLong m_pingid;
	dbc::uLong m_maxdelay, m_curdelay, m_mindelay;
	DWORD	   dwLatencyTime[20];

	// ȡ����ļ���ƽ��pingֵ������client,server ��Ԥ�ƶ� xuedong 2004.09.01
	dbc::uLong m_ulCurStatistic;
	dbc::uLong m_ulDelayTime[4];
	// end
  };
  unsigned long m_ulPacketCount; // ��¼���ĸ��������ڲ��ԡ�xuedong 2004.09.10
  long			m_framedelay;	 // ֡�ӳ�

  CProCirculate* m_pCProCir;
  dbc::Mutex	 m_mutmov;
  char			 m_accounts[100];
  char			 m_passwd[100];

  Botan::RSA_PrivateKey* m_clientPrivateKey;
  Botan::RSA_PrivateKey* m_serverPrivateKey;
  Botan::Public_Key*	 m_srvPublicKey;
  AES_KEY				 m_AESKey;
  AES_IV				 m_IV;




  bool		   _enc;	  // �Ƿ����
  int		   _comm_enc; // �����㷨����
  virtual void OnEncrypt(dbc::DataSocket* datasock, char* ciphertext, const char* text, unsigned long& len);
  virtual void OnDecrypt(dbc::DataSocket* datasock, char* ciphertext, unsigned long& len);
};

extern NetIF* g_NetIF;
//extern CLogName	 g_LogName;

#endif
