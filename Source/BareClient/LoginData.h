#pragma once

class CLoginData
{
public:
	CLoginData(void);
	~CLoginData(void);

	void	SetServiceName(CString serviceName);
	void	SetAccountName(CString accountName);
	void	SetPassword(CString password);

	CString	GetServiceName();
	CString	GetServiceIP();
	CString	GetAccountName();
	CString	GetPassword();
	CString GetPassport();
	BOOL	IsTomServer();

private:
	CString m_strServiceName;
	CString m_strServiceIP;
	CString m_strAccountName;
	CString m_strPassword;
	BOOL m_bServerVerify;							//ʹ��Billingϵͳ
	BOOL m_bTomServer;								//��½Tom������
};
