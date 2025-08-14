#pragma once

#include "TalkSessionBase.h"

// CTotalTalkSessionPage dialog

class CTotalTalkSessionPage : public CPropertyPage , public CTalkSessionBase
{
	DECLARE_DYNAMIC(CTotalTalkSessionPage)

public:
	CTotalTalkSessionPage(CChannelChatMgr::eChannel channel);
	virtual ~CTotalTalkSessionPage();

// Dialog Data
	enum { IDD = IDD_DIALOG_TOTAL_TALK_SESSION };

	void Renew();			//ȫ��ˢ��
	void Clear();			//���Ƶ��
	LPVOID GetThisPage();	//ȡʵ����ַ

	void RefreshSelfChannel();	//����ˢ���Լ���Ƶ��
	void RefreshTotalChannel();	//����ˢ��ȫ��Ƶ��


protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
	virtual BOOL OnInitDialog();
	virtual BOOL OnSetActive();


private:
	CRichEditCtrl m_RichEditInformation;
};
