#pragma once


class CNetIF;
class CLoginData;


class CSender
{
public:
	CSender(CNetIF *pNet,CPlayer *player);
	~CSender(void);

	//��½�ʺŷ�����
	void LoginAccountService(CLoginData *pdata);
	//��½��Ϸ������
	void LoginGameService();
	//������ɫ
	void CreateCharacter();
	//ɾ����ɫ
	void DeleteCharacter(CString strName);
	//��������
	void EndAction();
	//��ɫ�ƶ�
	void MoveTo(DWORD x,DWORD y);
	//�������Ե�
	void AddAttribute(WORD attrID);
	//��ɫ˲��
	void TeleCommand(CString strCommand);
	//ʰȡ����
	void PickupItem(DWORD worldID,DWORD handle);
	//��������
	void DropItem(int nIndex,WORD nNum);
	//ʹ��(װ��)��Ʒ
	void UseItem(int nIndex);
	//ж��װ��
	void UnEquip(int nIndex);

	//������� - ��ҰƵ��
	void Chat_Channel_Sight(CString strText);
	//������� - ����Ƶ��
	void Chat_Channel_World(CString strText);
	//������� - ����Ƶ��
	void Chat_Channel_Trade(CString strText);
	//������� - ����Ƶ��
	void Chat_Channel_Team(CString strText);
	//������� - ����Ƶ��
	//void Chat_Channel_Guild(CString strText);
	//������� - ����Ƶ��
	void Chat_Channel_Publish(CString strText);
	//������� - ˽��Ƶ��
	void Chat_Channel_Private(CString strTargetName,CString strText);


	void SendClientRSAPrivateKey();
	void CreateSecondaryPassword();

private:
	CNetIF *m_pNet;
	CPlayer *m_pPlayer;
	DWORD m_dwMoveCount;
};
