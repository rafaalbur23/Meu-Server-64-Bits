#pragma once

#include "ServerHeader.h"

class CRoleObject
{
public:
	enum eState{eAlive=0,eDead=1,eRelive=2};				//0:������ 1:���� 2:������
	enum eObjectType{eSelf=0,ePlayer=1,eNPC=2,eMonster=3};	//0:�Լ�   1:���   1:NPC  2:����
	CRoleObject(void);
	virtual ~CRoleObject(void);

	static CRoleObject* CreateObject(dbc::RPacket& pk);
	static CSelfObject* CreateSelfObject(dbc::RPacket& pk);
	void SetCharID(DWORD id);
	void SetWorldID(DWORD id);
	void SetCommID(DWORD id);
	void SetHandle(DWORD handle);
	void SetName(CString name);
	void SetType(eObjectType type);
	void SetPosition(DWORD x, DWORD y);
	void SetRadiusBulk(DWORD radius);
	void SetAngle(WORD angle);
	void SetState(eState state);
	//void SetLook(const LOOK *sLook);
	//void SetCharHandle(DWORD handle);
	//void SetCharType(EChaCtrlType type);
	//void SetState(eState state);
	//void SetRadius(long radius);


	DWORD GetCharID();
	DWORD GetWorldID();
	DWORD GetCommID();
	DWORD GetHandle();
	CString GetName();
	eObjectType GetType();
	DWORD GetPositionX();
	DWORD GetPositionY();
	float GetPositionFloatX();
	float GetPositionFloatY();
	DWORD GetRadiusBulk();
	WORD GetAngle();
	eState GetState();
	DWORD GetDistanceTo(DWORD x,DWORD y);
	float GetDistanceInFloatTo(DWORD x,DWORD y);
	//DWORD GetCharHandle();
	//EChaCtrlType GetCharType();
	//eState GetState();
	//long GetRadius();

private:
	static void CreateEvent(CRoleObject *pRoleOjbect, dbc::RPacket& pk);


	DWORD m_dwCharID;
	DWORD m_dwWorldID;
	DWORD m_dwCommID;
	DWORD m_dwHandle;
	CString m_strName;
	eObjectType m_eObjectType;
	CPoint m_cPosition;
	DWORD m_dwPosX;
	DWORD m_dwPosY;
	DWORD m_dwRadiusBulk;
	WORD m_nAngle;
	eState m_eState;

	//δΪ�����¼����ݴ�����ȡ�ӿ�
	DWORD m_dwEventEntityID;				//�¼������ID	- ��ʱ������
	EChaCtrlType m_eEventEntityType;		//�¼����������(����/����..)	- ��ʱ������
	DWORD m_dwEventID;						//�¼�ID
	CString m_strEventName;					//�¼�����

	//LOOK *m_psLook;
	//DWORD m_dwCharHandle;
	//EChaCtrlType m_eType;
	//eState m_eState;
	//long m_lRadius;

};
