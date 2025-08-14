// stdafx.h : ��׼ϵͳ�����ļ��İ����ļ���
// ���Ǿ���ʹ�õ��������ĵ�
// ��Ŀ�ض��İ����ļ�

#pragma once

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN		// �� Windows ��ͷ���ų�����ʹ�õ�����
#endif

// ���������ʹ��������ָ����ƽ̨֮ǰ��ƽ̨�����޸�����Ķ��塣
// �йز�ͬƽ̨����Ӧֵ��������Ϣ����ο� MSDN��
#ifndef WINVER				// ����ʹ�� Windows 95 �� Windows NT 4 ����߰汾���ض����ܡ�
#define WINVER 0x0501		//Ϊ Windows98 �� Windows 2000 �����°汾�ı�Ϊ�ʵ���ֵ��
#endif

#ifndef _WIN32_WINNT		// ����ʹ�� Windows NT 4 ����߰汾���ض����ܡ�
#define _WIN32_WINNT 0x0501	//Ϊ Windows98 �� Windows 2000 �����°汾�ı�Ϊ�ʵ���ֵ��
#endif						

#ifndef _WIN32_WINDOWS		// ����ʹ�� Windows 98 ����߰汾���ض����ܡ�
#define _WIN32_WINDOWS 0x0501 //Ϊ Windows Me �����°汾�ı�Ϊ�ʵ���ֵ��
#endif

#ifndef _WIN32_IE			// ����ʹ�� IE 4.0 ����߰汾���ض����ܡ�
#define _WIN32_IE 0x0501	//Ϊ IE 5.0 �����°汾�ı�Ϊ�ʵ���ֵ��
#endif

#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS	// ĳЩ CString ���캯��������ʽ��

// �ر� MFC ��ĳЩ��������������ȫ���Եľ�����Ϣ������
#define _AFX_ALL_WARNINGS

#include <afxwin.h>         // MFC ���ĺͱ�׼���
#include <afxext.h>         // MFC ��չ
#include <afxdisp.h>        // MFC �Զ�����

#include <afxdtctl.h>		// Internet Explorer 4 �����ؼ��� MFC ֧��
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>			// Windows �����ؼ��� MFC ֧��
#endif // _AFX_NO_AFXCMN_SUPPORT

//#include <afxsock.h>		// MFC �׽�����չ


//------------------------------------------------------------------------
//	�������û��Զ�������
//------------------------------------------------------------------------

#ifndef SAFE_DELETE
	#define SAFE_DELETE(p)			{ if((p) != NULL) { delete (p);     (p)=NULL; } }
	#define SAFE_DELETE_ARRAY(p)	{ if((p) != NULL) { delete[] (p);   (p)=NULL; } }
	#define SAFE_RELEASE(p)			{ if((p) != NULL) { (p)->Release(); (p)=NULL; } }
#endif


//��Ϣ�����ʾ���������
#define EDIT_MAX_VISIBLE_LINE 19
//��ɫ��������
#define ROLE_LIST_MAXNUM 3
//�ʺ���������
#define ACCOUNT_MAXNUM 1000
//��Ϣ��¼����-����
#define SYSTEM_INFORMATION_MAXNUM 100
//��Ϣ��ʾ���������
#define MESSAGE_VISIBLE_MAXNUM 4000
//��Ϣ��¼����
#define MESSAGE_INFORMATION_MAXNUM 1000
//�Զ��ƶ������б��С����
#define AUTO_TELE_TABLE_MAXNUM 200
//ÿһ�������¼���������>100
#define CHAT_CHANNEL_INFORMATION_MAXNUM 1000
//ÿ�������¼��ʾ�б���������>100
#define CHAT_CHANNEL_LIST_MAXNUM 1000

#include "afxtempl.h"
#include <afxdlgs.h>

#include "SystemInfo.h"
#include "Player.h"

class CPlayerMgr;
class CNetModule;
class CAutoPublishMgr;

extern CPlayerMgr g_PlayerMgr;
extern CNetModule *g_pNet;
extern short g_nClientVersion;
extern CAutoPublishMgr g_AutoPublishMgr;
extern CString g_strPassport;
extern CString g_strDBPassword;

namespace dbc
{
	class ThreadPool;
}
extern dbc::ThreadPool *g_ThreadPool;


//֪ͨ��������Ϣ�Ѹ���
#define THREAD_MSG_REFRESH_INFO				WM_USER+101
//֪ͨ�ʺ��б�ˢ���ʺ�״̬
#define THREAD_MSG_REFRESH_STATE			WM_USER+102
//�������߳�֪ͨ��Ϸ�߳��л���ǰ���
#define MAIN_PLAYER_SELECT_CHANGE			WM_USER+103
//֪ͨ������ˢ������ӵ�ϵͳ��Ϣ
#define THREAD_MSG_ADD_SYSTEM_MESSAGE		WM_USER+104


//------------------------------------------------------------------------
//	����ص��¼�
//------------------------------------------------------------------------
//����Ͽ�
#define NETIF_DISCONNECT			WM_USER+1001
//���յ���������
#define NETIF_RECEIVE_DATA			WM_USER+1002


//------------------------------------------------------------------------
//	��Ϸ�̻߳ص��¼�
//------------------------------------------------------------------------
//�����ͼ���ʼ��������Ϣ
#define GAME_THREAD_RESET_ALL				WM_USER+2001
//�����ͼ��ˢ��������Ϣ
#define GAME_THREAD_FRESH_ALL				WM_USER+2002
//ˢ���Լ��ĵ�ͼ����
#define GAME_THREAD_FRESH_MAP_POSITION		WM_USER+2003
//ˢ������ҳ
#define GAME_THREAD_FRESH_PAGE				WM_USER+2004	//wParam������ҳ��ţ���0��
//��ɫ��������ʧ
#define GAME_THREAD_FRESH_ROLE				WM_USER+2005	//wParam������0Ϊ��ʧ 1Ϊ����  lParamΪ��ɫCRoleObjectָ��
//��ɫλ�ñ��
#define GAME_THREAD_FRESH_ROLE_POSITION		WM_USER+2006	//lParamΪ��ɫCRoleObjectָ��
//������Ʒ��������ʧ
#define GAME_THREAD_FRESH_GROUND_ITEM		WM_USER+2007	//wParam������0Ϊ��ʧ 1Ϊ����  lParamΪ������ƷCGroundObjectָ��
//������������
#define GAME_THREAD_FRESH_CHAT				WM_USER+2008	//wParam����ΪƵ������

#define NET_PROTOCOL_ENCRYPT   1	// ����Э���Ƿ���ܣ������ҵ��޸ģ�
