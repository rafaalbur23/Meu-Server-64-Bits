// RolePage.cpp : implementation file
//

#include "stdafx.h"
#include "BKop.h"
#include "CommonHeader.h"
#include "SelfObject.h"
#include "PlayerMgr.h"
#include "RolePage.h"
#include "GameThread.h"
#include "NetIF.h"
#include ".\rolepage.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif








const static CString m_AttribName[]=
{
	"��ɫ�ȼ�",							// 0
	"��ǰHP",							// 1
	"��ǰSP",							// 2
	"�л�ID",							// 3
	"��ɫ�ƺ�",							// 4
	"��ɫְҵ",							// 5
	"��ǰ����",							// 6
	"��һ�����辭��",					// 7
	"����",								// 8
	"���Ե�",							// 9
	"���ܵ�",							// 10
	"��Ǯ",								// 11
	"�ڵ������ٶ�",						// 12
	"��ɫ��������(��ң�NPC�������)",	// 13
	"��ǰ�ȼ��ľ���",					// 14
	"�����ȼ�",							// 15
	"��ǰʣ�ຽ������",					// 16
	"�ۻ���������(��ǰ��������)",		// 17
	"��ǰ�ȼ���������",					// 18
	"��һ�ȼ��ȼ���������",				// 19
	"����ȼ�",							// 20
	"��ǰ�����",						// 21
	"��ǰ�ȼ������",					// 22
	"��һ�ȼ������",					// 23
	"����ܵ�",						// 24
	"��ֻͣ���ۿ�",						// 25
	"�л�״̬",							// 26
	"����(����)����",					// 27
	"�л�����",							// 28
	"δ����Ĳ���",						// 29
	"δ����Ĳ���",						// 30
	"����",								// 31
	"����",								// 32
	"����",								// 33
	"����",								// 34
	"����",								// 35
	"����",								// 36
	"���HP",							// 37
	"���SP",							// 38
	"��С������",						// 39
	"��󹥻���",						// 40
	"������",							// 41
	"������",							// 42
	"������",							// 43
	"Ѱ����",							// 44
	"������",							// 45
	"hp�ָ��ٶ�",						// 46
	"sp�ָ��ٶ�",						// 47
	"�������",							// 48
	"��������",							// 49
	"�ƶ��ٶ�",							// 50
	"��Դ�ɼ��ٶ�",						// 51
	"����ֿ�",							// 52
	"��ֻ�ڵ���ը��Χ",					// 53
	"��ֻ�ڵ������ٶ�",					// 54
	"���ļ�ֵ",							// 55
	"��������",							// 56
	"��������",							// 57
	"��������",							// 58
	"��������",							// 59
	"��������",							// 60
	"��������",							// 61
	"��������",							// 62
	"�������SP",						// 63
	"������С������",					// 64
	"������󹥻���",					// 65
	"����������",						// 66
	"����������",						// 67
	"����������",						// 68
	"����Ѱ����",						// 69
	"����������",						// 70
	"����hp�ָ��ٶ�",					// 71
	"������ɫSP�ָ��ٶ�(��ֻΪ�����ٶ�)",// 72
	"�����������",						// 73
	"������������",						// 74
	"�����ƶ��ٶ�",						// 75
	"������Դ�ɼ��ٶ�",					// 76
	"��������ֿ�",						// 77
	"��ֻ�����ڵ���ը��Χ",				// 78
	"��ֻ�����ڵ������ٶ�",				// 79
	"δ����Ĳ���",						// 80
	"��������ϵ���ӳ�"					// 81
};



CString GetAttribName(WORD index)
{
	int nTotal=sizeof(m_AttribName)/sizeof(CString);
	if (index>=nTotal)
	{
		return "δ����Ĳ���";
	}
	return m_AttribName[index];
}













// CRolePage dialog

IMPLEMENT_DYNAMIC(CRolePage, CPropertyPage)
CRolePage::CRolePage()
	: CPropertyPage(CRolePage::IDD)
{
}

CRolePage::~CRolePage()
{
}

void CRolePage::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_STATIC_NAME, m_strName);
	DDX_Control(pDX, IDC_STATIC_LEVEL, m_strLevel);
	DDX_Control(pDX, IDC_STATIC_HP, m_strHP);
	DDX_Control(pDX, IDC_STATIC_SP, m_strSP);
	DDX_Control(pDX, IDC_PROGRESS_HP, m_prgHP);
	DDX_Control(pDX, IDC_PROGRESS_SP, m_prgSP);
	DDX_Control(pDX, IDC_STATIC_EXP, m_strEXP);
	DDX_Control(pDX, IDC_PROGRESS_EXP, m_prgEXP);
	DDX_Control(pDX, IDC_STATIC_EXP_PERCENT, m_strEXPPercent);
	DDX_Control(pDX, IDC_STATIC_STR, m_strSTR);
	DDX_Control(pDX, IDC_STATIC_DEX, m_strDEX);
	DDX_Control(pDX, IDC_STATIC_AGI, m_strAGI);
	DDX_Control(pDX, IDC_STATIC_VIT, m_strVIT);
	DDX_Control(pDX, IDC_STATIC_STA, m_strSTA);
	DDX_Control(pDX, IDC_STATIC_LUK, m_strLUK);
	DDX_Control(pDX, IDC_STATIC_ATTRIBUTE_POINT, m_strAttributePoint);
	DDX_Control(pDX, IDC_STATIC_SKILL_POINT, m_strSkillPoint);
	DDX_Control(pDX, IDC_LIST_STATE, m_StateList);
	DDX_Control(pDX, IDC_STATIC_MONEY, m_strMoney);
	DDX_Control(pDX, IDC_STATIC_MAP_NAME, m_strMapName);
	DDX_Control(pDX, IDC_STATIC_MAP_POSITION, m_strMapPosition);
}


BEGIN_MESSAGE_MAP(CRolePage, CPropertyPage)
	ON_BN_CLICKED(IDC_BUTTON_ADD_STR, OnBnClickedButtonAddStr)
	ON_BN_CLICKED(IDC_BUTTON_ADD_DEX, OnBnClickedButtonAddDex)
	ON_BN_CLICKED(IDC_BUTTON_ADD_AGI, OnBnClickedButtonAddAgi)
	ON_BN_CLICKED(IDC_BUTTON_ADD_VIT, OnBnClickedButtonAddVit)
	ON_BN_CLICKED(IDC_BUTTON_ADD_STA, OnBnClickedButtonAddSta)
	ON_BN_CLICKED(IDC_BUTTON_ADD_LUK, OnBnClickedButtonAddLuk)
END_MESSAGE_MAP()


// CRolePage message handlers

BOOL CRolePage::OnInitDialog()
{
	UpdateData(FALSE);
	m_StateList.InsertColumn(0,"ID",LVCFMT_LEFT,25);
	m_StateList.InsertColumn(1,"����˵��",LVCFMT_LEFT,100);
	m_StateList.InsertColumn(2,"����ֵ",LVCFMT_LEFT,100);
	m_StateList.SetExtendedStyle(LVS_EX_GRIDLINES|LVS_EX_FULLROWSELECT|LVS_EX_ONECLICKACTIVATE|LVS_EX_FLATSB);
	return TRUE;
}

void CRolePage::ResetPage()
{
	m_strName.SetWindowText("����:");
	m_strLevel.SetWindowText("�ȼ�");
	m_strHP.SetWindowText("0/0");
	m_prgHP.SetRange32(0,0);
	m_prgHP.SetPos(0);
	m_strSP.SetWindowText("0/0");
	m_prgSP.SetRange32(0,0);
	m_prgSP.SetPos(0);
	m_strEXP.SetWindowText("0/0");
	m_prgEXP.SetRange32(0,0);
	m_prgEXP.SetPos(0);
	m_strEXPPercent.SetWindowText("0.00%");
	m_strMoney.SetWindowText("Money:0");
	m_strSTR.SetWindowText("����(STR):");
	m_strDEX.SetWindowText("����(DEX):");
	m_strAGI.SetWindowText("����(AGI):");
	m_strVIT.SetWindowText("����(VIT):");
	m_strSTA.SetWindowText("����(STA):");
	m_strLUK.SetWindowText("����(LUK):");
	m_strAttributePoint.SetWindowText("ʣ�����Ե�:");
	m_strSkillPoint.SetWindowText("ʣ�༼�ܵ�:");
	m_strMapName.SetWindowText("��ǰ��ͼ��δ֪");
	m_strMapPosition.SetWindowText("��ǰ���꣺");
	m_StateList.DeleteAllItems();
}

void CRolePage::RefreshPage()
{
	CSelfObject* pSelf=CPlayerMgr::GetMainPlayer()->GetRoleMgr().GetSelfObject();
	CString str;
	m_strName.SetWindowText("����:"+pSelf->GetName());
	str.Format("�ȼ�:%d",pSelf->GetLevel());
	m_strLevel.SetWindowText(str);
	str.Format("%d/%d",pSelf->GetHP(),pSelf->GetMaxHP());
	m_strHP.SetWindowText(str);
	m_prgHP.SetRange32(0,pSelf->GetMaxHP());
	m_prgHP.SetPos(pSelf->GetHP());
	str.Format("%d/%d",pSelf->GetSP(),pSelf->GetMaxSP());
	m_strSP.SetWindowText(str);
	m_prgSP.SetRange32(0,pSelf->GetMaxSP());
	m_prgSP.SetPos(pSelf->GetSP());
	__int64 lEXP=pSelf->GetLevelEXP();
	__int64 lMaxEXP=pSelf->GetLevelMaxEXP();

	char v1[32];
	char v2[32];
	_i64toa(lEXP, v1, 10);
	_i64toa(lMaxEXP, v2, 10);

	str.Format("%s/%s",v1,v2);
	m_strEXP.SetWindowText(str);

	double maxV = pow(2, 32);

	if(lMaxEXP > maxV || lEXP > maxV)
	{
		lMaxEXP -= maxV;
		lEXP -= maxV;
	}

	m_prgEXP.SetRange32(0,(int)lMaxEXP);
	m_prgEXP.SetPos((int)lEXP);

	if (lMaxEXP==0) lMaxEXP=1;
	str.Format("%.2f%%",(((float)lEXP)/lMaxEXP)*100);
	m_strEXPPercent.SetWindowText(str);
	str.Format("Money:%d",pSelf->GetMoney());
	m_strMoney.SetWindowText(str);

	str.Format("����(STR):%3d",pSelf->GetSTR());
	m_strSTR.SetWindowText(str);
	str.Format("����(DEX):%3d",pSelf->GetDEX());
	m_strDEX.SetWindowText(str);
	str.Format("����(AGI):%3d",pSelf->GetAGI());
	m_strAGI.SetWindowText(str);
	str.Format("����(VIT):%3d",pSelf->GetVIT());
	m_strVIT.SetWindowText(str);
	str.Format("����(STA):%3d",pSelf->GetSTA());
	m_strSTA.SetWindowText(str);
	str.Format("����(LUK):%3d",pSelf->GetLUK());
	m_strLUK.SetWindowText(str);

	str.Format("ʣ�����Ե�:%d",pSelf->GetAttributePoint());
	m_strAttributePoint.SetWindowText(str);
	str.Format("ʣ�༼�ܵ�:%d",pSelf->GetSkillPoint());
	m_strSkillPoint.SetWindowText(str);


	for (int i=0;i<pSelf->GetMaxAvailableAttribNum();i++)
	{
		str.Format("%d",i);
		m_StateList.InsertItem(i,str);
		m_StateList.SetItem(i,1,LVIF_TEXT|LVIF_STATE,GetAttribName(i),0,0,0,NULL);
		str.Format("%d",pSelf->GetAttribute(i));
		m_StateList.SetItem(i,2,LVIF_TEXT|LVIF_STATE,str,0,0,0,NULL);
	}

	m_strMapName.SetWindowText("��ǰ��ͼ��"+pSelf->GetMapName());
	str.Format("��ǰ���꣺%.2f��%.2f",pSelf->GetPositionFloatX(),pSelf->GetPositionFloatY());
	m_strMapPosition.SetWindowText(str);
}

void CRolePage::RefreshMapPosition()
{
	CString str;
	CSelfObject* pSelf=CPlayerMgr::GetMainPlayer()->GetRoleMgr().GetSelfObject();
	str.Format("��ǰ���꣺%.2f��%.2f",pSelf->GetPositionFloatX(),pSelf->GetPositionFloatY());
	m_strMapPosition.SetWindowText(str);
}
void CRolePage::OnBnClickedButtonAddStr()
{
	// TODO: Add your control notification handler code here
	AddAttribute(ATTR_STR);
}

void CRolePage::OnBnClickedButtonAddDex()
{
	// TODO: Add your control notification handler code here
	AddAttribute(ATTR_DEX);
}

void CRolePage::OnBnClickedButtonAddAgi()
{
	// TODO: Add your control notification handler code here
	AddAttribute(ATTR_AGI);
}

void CRolePage::OnBnClickedButtonAddVit()
{
	// TODO: Add your control notification handler code here
	AddAttribute(ATTR_CON);
}

void CRolePage::OnBnClickedButtonAddSta()
{
	// TODO: Add your control notification handler code here
	AddAttribute(ATTR_STA);
}

void CRolePage::OnBnClickedButtonAddLuk()
{
	// TODO: Add your control notification handler code here
	AddAttribute(ATTR_LUK);
}

void CRolePage::AddAttribute(WORD attrID)
{
	CPlayer* pPlayer=CPlayerMgr::GetMainPlayer();
	if (!pPlayer)
	{
		return;
	}
	CGameThread* pGameThread=pPlayer->GetPlayerGameThread();
	if (!pGameThread)
	{
		return;
	}
	CNetIF *pNet=pGameThread->GetNetIF();
	if (!pNet)
	{
		return;
	}
	pNet->GetSender().AddAttribute(attrID);
}
