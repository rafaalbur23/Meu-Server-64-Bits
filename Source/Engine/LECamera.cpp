#include "Stdafx.h"
#include "LECamera.h"

#ifdef _SKYBOX_
#include "..\src\Heightmap.h"
extern LIGHTENGINE_API CHeightmap g_Hmap;
#endif

LECamera::LECamera()
{
	m_fRoll = 0.0f;
	
	InitPosition(0.0f, 100.0f , 100.0f , 0.0f , 0.0f , 0.0f);
	_snprintf_s(strCameraInfo ,64 ,_TRUNCATE,"camera : (%4.02f %4.02f %4.02f)__(%4.02f %4.02f %4.02f)" , 
				m_EyePos.x , m_EyePos.y , m_EyePos.z , 
				m_RefPos.x , m_RefPos.y , m_RefPos.z); 
}

LECamera::~LECamera() {}    
 
VOID LECamera::Move(DWORD dwMoveType) 
{
	float fStep = 0.2f;	
	D3DXVECTOR3 Move(0, 0, 0);
	
	switch(dwMoveType)
	{
		case MOVE_LEFT:
		{
			D3DXVec3Cross(&Move , &(m_RefPos - m_EyePos) , &D3DXVECTOR3(0.0f , 0.0f , 1.0f));
			D3DXVec3Normalize(&Move , &Move);
			Move*=fStep;
			m_RefPos+=Move;
			m_EyePos+=Move;
			break;
		}
		case MOVE_RIGHT:
		{
			D3DXVec3Cross(&Move , &(m_RefPos - m_EyePos) , &D3DXVECTOR3(0.0f , 0.0f , 1.0f));
			D3DXVec3Normalize(&Move , &Move);
			Move*=fStep;
			m_RefPos-=Move;
			m_EyePos-=Move;
			break;
		}
		case MOVE_FORWARD:
		{
		    D3DXVec3Normalize(&Move , &(m_RefPos - m_EyePos));
			Move*=fStep;
			m_RefPos+=Move;
			m_EyePos+=Move;
			break;
		}
		case MOVE_BACKWARD:
		{
			D3DXVec3Normalize(&Move , &(m_RefPos - m_EyePos));
			Move*=fStep;
			m_RefPos-=Move;
			m_EyePos-=Move;
			break;
		}
		case MOVE_UP:
		{
			Move = D3DXVECTOR3(0.0f , 0.0f , 1.0f);
			Move*=fStep;
			m_RefPos+=Move;
			m_EyePos+=Move;
			break;
		}
		case MOVE_DOWN:
		{
			Move = D3DXVECTOR3(0.0f , 0.0f , 1.0f);
			Move*=fStep;
			m_RefPos-=Move;
			m_EyePos-=Move;
			break;
		}
		case ROTATE_VEER:
		{
			 break;
		}
		case ROTATE_REVERSE:
		{
			 break;
		}
		case ROLL1:
		{
			 m_fRoll+=5.0f;
			 break;
		}
		case ROLL2:
		{
			 m_fRoll-=5.0f;
			 break;
		}
  }
  _snprintf_s(strCameraInfo ,64 ,_TRUNCATE,"camera : (%4.02f %4.02f %4.02f)__(%4.02f %4.02f %4.02f)" , 
				m_EyePos.x , m_EyePos.y , m_EyePos.z , 
				m_RefPos.x , m_RefPos.y , m_RefPos.z); 
}

// ǰ���ƶ���ͷ, Hang��ʾ�Ƿ������ƶ�
void LECamera::MoveForward(float fStep, BOOL bHang)
{
	D3DXVECTOR3 Move(0 , 0 , 0);
	if(bHang)
	{
		D3DXVec3Normalize(&Move , &(D3DXVECTOR3(m_RefPos.x, m_RefPos.y, 0.0f) - D3DXVECTOR3(m_EyePos.x, m_EyePos.y, 0.0f)));
	}
	else
	{
		D3DXVec3Normalize(&Move , &(m_RefPos - m_EyePos));
	}
	Move*=fStep;
	m_RefPos+=Move;
	m_EyePos+=Move;

#ifdef _SKYBOX_
	D3DXVECTOR3 vDir;
	D3DXVec3Normalize(&vDir, &(m_RefPos - m_EyePos));
	g_Hmap.UpdateFrustum(&m_EyePos, &vDir);
#endif
}

// �����ƶ���ͷ, Hang��ʾ�Ƿ������ƶ�
void LECamera::MoveRight(float fStep, BOOL bHang)
{
	D3DXVECTOR3 Move(0 , 0 , 0);
	    
	
	D3DXVec3Cross(&Move , &(m_RefPos - m_EyePos) , &D3DXVECTOR3(0.0f , 0.0f , 1.0f));
	D3DXVec3Normalize(&Move , &Move);
	Move*=fStep;
	if(bHang)
	{
		Move.z = 0;
	}
	m_RefPos+=Move;
	m_EyePos+=Move;

#ifdef _SKYBOX_
	D3DXVECTOR3 vDir;
	D3DXVec3Normalize(&vDir, &(m_RefPos - m_EyePos));
	g_Hmap.UpdateFrustum(&m_EyePos, &vDir);
#endif
}

void LECamera::Turn(float fStep, D3DXVECTOR3 *pFocusVec)
{
	// float fDis = DistanceFrom(m_RefPos, m_EyePos);
	// float fAngle = (m_RefPos.y - m_EyePos.y) / (m_RefPos.x - m_EyePos.x);
	D3DXVECTOR3 Move(0, 0, 0);
	
	if(!pFocusVec)
	{
		D3DXVec3Cross(&Move , &(m_RefPos - m_EyePos) , &D3DXVECTOR3(0.0f , 0.0f , 1.0f));
		D3DXVec3Normalize(&Move , &Move);
		Move*=fStep;
		m_RefPos+=Move;
	}
	else
	{
		m_RefPos = *pFocusVec;
		D3DXVECTOR3 vv = m_EyePos - *pFocusVec;
		D3DXVec3Normalize(&vv, &vv);
		D3DXVec3Cross(&Move , &D3DXVECTOR3(vv.x, vv.y, 0.0f) , &D3DXVECTOR3(0.0f, 0.0f, 1.0f));
		D3DXVec3Normalize(&Move , &Move);
		Move*=fStep;
		m_EyePos+=Move;
	}

#ifdef _SKYBOX_
	D3DXVECTOR3 vDir;
	D3DXVec3Normalize(&vDir, &(m_RefPos - m_EyePos));
	g_Hmap.UpdateFrustum(&m_EyePos, &vDir);
#endif
}

void		LECamera::FrameMove(DWORD	dwTailTime)
{
}
//lemon add@2004.8.4////////////////////////////////////////////////////////////////////////

//void		LECamera::InitAngle(float	fAngle)
//{
//	m_cameractrl.m_InitAngle = fAngle;
//	m_cameractrl.m_vDir = D3DXVECTOR3(0,1,0);
//	m_cameractrl.m_fAngle = fAngle;
//	D3DXMATRIX		mat;
//	D3DXVECTOR4		ver;
//	D3DXMatrixRotationZ(&mat,m_cameractrl.m_fAngle);
//	D3DXVec3Transform(&ver, &m_cameractrl.m_vDir, &mat);
//	m_cameractrl.m_vDir.x = ver.x;
//	m_cameractrl.m_vDir.y = ver.y;
//	m_cameractrl.m_vDir.z = ver.z;
//
//	m_cameractrl.GetEyePos(m_EyePos,m_RefPos);
//	vDistFrom = m_EyePos - m_RefPos;
//	D3DXVec3Normalize(&m_cameractrl.m_vDir, &vDistFrom);
//	m_cameractrl.m_vDir.z = 0;
//}
//
//void		LECamera::ResetCamera(float fAngle)
//{
//	m_cameractrl.m_InitAngle = fAngle;
//	m_cameractrl.m_bReset = true;
//}
//
//void		LECamera::FrameMove(DWORD	dwTailTime)
//{
//	static DWORD	dwTime = dwTailTime;
//
//	dwTime = dwTailTime - dwTime;
//	if(m_cameractrl.m_bFB)
//	{
//		if(m_cameractrl.ScroolFB(m_cameractrl.m_fvel * m_cameractrl.m_fasscs))
//		{
//			//D3DXVECTOR3		tv;
//			//m_cameractrl.GetEyePos(tv,m_RefPos);
//
//			//vDistFrom = tv - m_RefPos;
//			m_cameractrl.m_fasscs -= (float)dwTime * 0.0005f;
//			if(m_cameractrl.m_fasscs <= 0)
//			{
//				m_cameractrl.m_bFB = false;
//				m_cameractrl.m_fvel = 0;
//			}
//		}
//		else
//		{
//			m_cameractrl.m_bFB = false;
//			m_cameractrl.m_fvel = 0;
//
//		}
//
//	}
//	if(m_cameractrl.m_bRota)
//	{
//		m_cameractrl.ScroolLR(m_cameractrl.m_fRotaVel * m_cameractrl.m_fRotaAss);
//
//			m_cameractrl.m_fRotaAss -= (float)dwTime * m_cameractrl.m_fResetRotatAccl;
//			if(m_cameractrl.m_fRotaAss <= 0)
//			{
//				m_cameractrl.m_bRota = false;
//				m_cameractrl.m_fRotaVel = 0;
//			}
//	
//
//	}
//	if(m_cameractrl.m_bReset)
//	{
//		RotationCameraLR(0.1f);
//		MoveForwardBack(0.1f);
//	}
//	//m_EyePos = m_RefPos + vDistFrom;
//	m_cameractrl.GetEyePos(m_EyePos,m_RefPos);
//
//	D3DXVec3Normalize(&m_cameractrl.m_vDir, &(m_EyePos - m_RefPos));
//	m_cameractrl.m_vDir.z = 0;
//
//	D3DXVec3Cross( &m_cameractrl.m_vCross, &m_cameractrl.m_vDir, &D3DXVECTOR3(0.0f , 0.0f , 1.0f) );
//
//
//
//	dwTime = dwTailTime;
//}
//
//
//
//
////������ת
//void LECamera::RotationCameraLR(float Angle)
//{
//	//m_fRotaVel = 0.000001f;
//	//m_fRotaAss = 0;
//	//m_bRota    = false;
//
//	m_cameractrl.m_bReset = false;
//
//	m_cameractrl.m_fRotaVel = Angle/10;
//
//	if(!m_cameractrl.m_bRota)
//	{
//		m_cameractrl.m_bRota = true;
//
//		m_cameractrl.m_fRotaAss = m_cameractrl.m_fResetRotatVel;
//
//	}else
//	{
//		if((Angle < 0 && m_cameractrl.m_fRotaVel >0) || (Angle > 0 && m_cameractrl.m_fRotaVel <0))
//		{
//			//m_cameractrl.m_fRotaVel = -m_cameractrl.m_fRotaVel;
//		}
//		m_cameractrl.m_fRotaAss = m_cameractrl.m_fResetRotatVel;
//
//	}
//
//	//m_cameractrl.ScroolLR(Angle);
//	//D3DXVECTOR3		tv;
//
//	//m_cameractrl.GetEyePos(tv,m_RefPos);
//
//	//vDistFrom = tv - m_RefPos;
//}
////������ת
//void LECamera::RotationCameraUD(float Angle)
//{
//	//m_cameractrl.ScrollUD(Angle);
//
//	//m_cameractrl.GetEyePos(m_EyePos,m_RefPos);
//
//	//vDistFrom = m_EyePos - m_RefPos;
//
//}
//
//void	LECamera::MoveForwardBack(float	fDist)
//{
//	m_cameractrl.m_bReset = false;
//
//	if(!m_cameractrl.m_bFB )
//	{
//		m_cameractrl.m_bFB = true;
//		m_cameractrl.m_fvel = fDist;
//
//		m_cameractrl.m_fasscs = 1;
//	}
//	else
//	{
//		if((fDist < 0 && m_cameractrl.m_fvel >0) || (fDist > 0 && m_cameractrl.m_fvel <0))
//		{
//			m_cameractrl.m_fvel = -m_cameractrl.m_fvel;
//		}
//		m_cameractrl.m_fasscs = 1;
//
//	}
//}
