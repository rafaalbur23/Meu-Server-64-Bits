//// stdafx.cpp : ֻ������׼�����ļ���Դ�ļ�
// BKop.pch ����Ԥ����ͷ
// stdafx.obj ������Ԥ����������Ϣ

#include "stdafx.h"
#include "threadpool.h"
#include "AutoPublishMgr.h"


// ���������Ӧ�İ汾��
short g_nClientVersion = 110;


CNetModule *g_pNet=NULL;
dbc::ThreadPool *g_ThreadPool=NULL;
CAutoPublishMgr g_AutoPublishMgr;
CString g_strPassport="nobill";		//���ڷ��շѷ�����,��½ʱĬ�ϵ�passport�ַ���
CString g_strDBPassword=";PWD=zxcvbnm";

