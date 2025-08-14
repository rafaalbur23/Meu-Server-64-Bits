#include "stdafx.h"
#include "BKop.h"
#include "NetModule.h"
#include "threadpool.h"
#include "ItemDataMgr.h"
#include "MainFrm.h"
#include "ServerMgr.h"
#include ".\bkop.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// CBKopApp

BEGIN_MESSAGE_MAP(CBKopApp, CWinApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
END_MESSAGE_MAP()


// CBKopApp ����

CBKopApp::CBKopApp()
{
	EnableHtmlHelp();
}


// Ψһ��һ�� CBKopApp ����

CBKopApp theApp;

// CBKopApp ��ʼ��

BOOL CBKopApp::InitInstance()
{
	// ���һ�������� Windows XP �ϵ�Ӧ�ó����嵥ָ��Ҫ
	// ʹ�� ComCtl32.dll �汾 6 ����߰汾�����ÿ��ӻ���ʽ��
	//����Ҫ InitCommonControls()�����򣬽��޷��������ڡ�
	
	InitCommonControls();
	AfxInitRichEdit();

	CWinApp::InitInstance();
	srand((unsigned)time( NULL ));
	//if (!AfxSocketInit())
	//{
	//	AfxMessageBox(IDP_SOCKETS_INIT_FAILED);
	//	return FALSE;
	//}

	// ��ʼ�� OLE ��
	if (!AfxOleInit())
	{
		AfxMessageBox(IDP_OLE_INIT_FAILED);
		return FALSE;
	}
	AfxEnableControlContainer();
	// ��׼��ʼ��
	// ���δʹ����Щ���ܲ�ϣ����С
	// ���տ�ִ���ļ��Ĵ�С����Ӧ�Ƴ�����
	// ����Ҫ���ض���ʼ������
	// �������ڴ洢���õ�ע�����
	// TODO: Ӧ�ʵ��޸ĸ��ַ�����
	// �����޸�Ϊ��˾����֯��
	SetRegistryKey(_T("Ӧ�ó��������ɵı���Ӧ�ó���"));
	// ��Ҫ���������ڣ��˴��뽫�����µĿ�ܴ���
	// ����Ȼ��������ΪӦ�ó���������ڶ���


	//NOTE(Ogge): Its in clients system folder, piggybacking on client resource for now
	CResourceBundleManage::Instance("Game.loc");

//TODO: Disabled to be able to start - need fix or replace with alternative
/* if(!CItemDataMgr::LoadItemsInfo())
	{
		MessageBox(NULL,"Failed to read props data! Please check whether the file and path are correct","Error",MB_OK);
	}
*/
	if (!CServerMgr::LoadServerInfo())
	{
		MessageBox(NULL,"Failed to read server list data! Please check whether the file and path are correct","Error",MB_OK);
		return FALSE;
	}


	g_pNet=new CNetModule(ThreadPool::CreatePool(10,ACCOUNT_MAXNUM,2048));

	CMainFrame* pFrame = new CMainFrame;
	if (!pFrame)
		return FALSE;
	m_pMainWnd = pFrame;
	// ���������ش�������Դ�Ŀ��
	pFrame->LoadFrame(IDR_MAINFRAME,
		WS_OVERLAPPEDWINDOW | FWS_ADDTOTITLE, NULL,
		NULL);
	// Ψһ��һ�������ѳ�ʼ���������ʾ����������и���
	pFrame->ShowWindow(SW_SHOW);
	pFrame->UpdateWindow();
	// �������ں�׺ʱ�ŵ��� DragAcceptFiles��
	//  �� SDI Ӧ�ó����У���Ӧ�� ProcessShellCommand  ֮����
	return TRUE;
}









// CBKopApp ��Ϣ�������



// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// �Ի�������
	enum { IDD = IDD_ABOUTBOX };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

// ʵ��
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()

// �������жԻ����Ӧ�ó�������
void CBKopApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}


// CBKopApp ��Ϣ�������

