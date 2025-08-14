#pragma once

#include "afxmt.h"
//class CList;

class CSystemInfo
{
	enum eInfoLevel
	{//�����Ϣ�ļ���ģʽ
		eLeast=0,			//��С����
		eNormal=1,			//��ͨ����
		eSystem=2,			//ϵͳ����
		eDebug=3,			//���Լ���
		eDetailDebug=4		//��ϸ�ĵ��Լ���
	};
	enum eColor
	{
		eLeastColor=RGB(255,255,255),
		eNormalColor=RGB(197,197,197),
		eSystemColor=RGB(255,255,128),
		eDebugColor=RGB(255,255,127),
		eDetailDebugColor=RGB(192,192,255)
	};
public:
	CSystemInfo(void);
	~CSystemInfo(void);
	static void InitArraySize(DWORD dwSize);

	//��С����
	static void Add(int nPlayerIndex,CString str,...);
	//��ͨ����
	static void AddInfo(int nPlayerIndex,CString str,...);
	//ϵͳ����
	static void AddSystemInfo(int nPlayerIndex,CString str,...);
	//���Լ���
	static void AddDebugInfo(int nPlayerIndex,CString str,...);
	//��ϸ�ĵ��Լ���
	static void AddDetailDebugInfo(int nPlayerIndex,CString str,...);

	static void Open();
    static void Close();
	static void ResetAllPosition();
	static void ResetPosition(int index);
	static void DeleteInfo(int nPlayerIndex);
	static void DeleteAllInfos();
	static DWORD GetNextInfoOrder(int nPlayerIndex);
	static CString GetNowLine(int nPlayerIndex);
	static COLORREF GetNowLineColor(int nPlayerIndex);
	static eInfoLevel GetNowLineLevel(int nPlayerIndex);
	static bool MoveNext(int nPlayerIndex);

	//static CString GetNowLine();
	//static COLORREF GetNowLineColor();
	//static bool MoveNext();

private:
	struct sInfo
	{
		DWORD nIndex;
		DWORD dwMsgCounts;
		eInfoLevel eLevel;
		COLORREF dwColor;
		CString strInfo;
	};
	static DWORD m_TotalMsg;
	typedef CList<sInfo,sInfo&> LInfo;
	static CArray<LInfo,LInfo&> m_InfoArray;
	static CArray<int,int&> m_IndexArray;
	static CArray<POSITION,POSITION&> m_dwArrayPos;
	static LInfo m_Infos;
	static CCriticalSection m_CriticalSection;
	static bool volatile m_bClose;
};
