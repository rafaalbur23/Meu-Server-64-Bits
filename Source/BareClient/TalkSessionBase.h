#pragma once

#include "ChannelChatMgr.h"

class CTalkSessionBase
{
public:
	CTalkSessionBase(CChannelChatMgr::eChannel channel);
	virtual ~CTalkSessionBase(void);

	virtual void Renew()=0;				//ȫ��ˢ��
	virtual void Clear()=0;				//���Ƶ��
	virtual LPVOID GetThisPage()=0;		//ȡʵ����ַ

	CString GetChannelName();			//ȡƵ������

	virtual void RefreshSelfChannel()=0;	//����ˢ���Լ���Ƶ��
	virtual void RefreshTotalChannel()=0;	//����ˢ��ȫ��Ƶ��

protected:
	CChannelChatMgr::eChannel m_eChannel;
};
