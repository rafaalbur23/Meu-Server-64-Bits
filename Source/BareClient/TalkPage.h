#pragma once

#include "ChannelChatMgr.h"
//#include "TalkSessionPage.h"
#include "TalkSessionBase.h"
#include "afxwin.h"

class CPlayerMessage;
class CChannelControl;

// CTalkPage dialog

class CTalkPage : public CPropertyPage
{
	DECLARE_DYNAMIC(CTalkPage)

public:
	CTalkPage();
	virtual ~CTalkPage();

// Dialog Data
	enum { IDD = IDD_DIALOG_TALK };

	LRESULT OnRefreshChannel(WPARAM wParam,LPARAM lParam);
	void OnPlayerSwitch(CPlayer *pLastPlayer,CPlayer *pNowPlayer);


protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
	virtual BOOL OnInitDialog();

private:
	CChannelChatMgr::eChannel GetCurChannel();
	void RefreshCurChannel();										//ˢ�µ�ǰƵ������(����ˢ��)
	void RefreshChannel(CChannelChatMgr::eChannel channel);			//ˢ��Ƶ������(����ˢ��,ֻ�Ե�ǰ��ʾƵ����Ч)
	void RenewChannel(CChannelChatMgr::eChannel channel);			//��ˢ��Ƶ������(������������ˢ��,ֻ�Ե�ǰ��ʾƵ����Ч)
	void ClearChannel(CChannelChatMgr::eChannel channel);			//���Ƶ������(���κ�Ƶ������Ч)


private:
	//CTalkSessionPage m_ChannelPage[CChannelChatMgr::CHANNEL_MAX_LIMIT];
	CTalkSessionBase *m_pChannelPage[CChannelChatMgr::CHANNEL_MAX_LIMIT];
	CChannelControl *m_pReleaseArray[20];

public:
	CPropertySheet m_SheetControl;
	CComboBox m_CombChannelSel;
	afx_msg void OnBnClickedButtonSend();
	CComboBox m_CombText;
	afx_msg void OnCbnSelchangeComboChannel();
	afx_msg void OnChar(UINT nChar,UINT nRepCnt,UINT nFlags); 
	BOOL PreTranslateMessage ( LPMSG  lpMsg );


	CComboBox m_CombTarget;
	CComboBox m_CombCommand;
	CButton m_BtnNameList;
	afx_msg void OnCbnSelchangeComboCommand();
	CButton m_BtnSend;
	afx_msg void OnCbnSelendokComboText();
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnBnClickedButtonAutoPublishMgr();
};
