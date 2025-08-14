#pragma once

class CAutoPublishData
{
public:
	enum eState
	{
		eRunning=0,			//ִ����
		eInexist=1,			//������
		ePlayerChanged=2,	//��ɫ�ı�
		eServerChanged=3,	//�������ı�
		eInterrupt=4,		//��ʱ�ж�
		eComplete=5			//���
	};
	CAutoPublishData(CPlayer *pPlayer, CTime ctStartTime, int nIntervalTime, int nRepeatCount, CString strText);
	~CAutoPublishData(void);

	CPlayer *GetPlayer();
	CString GetPlayerName();
	CString GetServerName();
	CTime GetStartTime();
	int GetIntervalTime();
	int GetRepeatCount();
	int GetExecuteCount();
	CString GetText();

	bool SetStateInfo(eState state);
	CString GetStateInfo();

	void Execute();

private:
	CPlayer *m_pPlayer;
	CString m_strPlayerName;
	CString m_strServerName;
	CTime m_ctStartTime;
	int m_nIntervalTime;
	int m_nRepeatCount;
	int m_nExecuteCount;
	CString m_strText;
	eState m_eState;
};
