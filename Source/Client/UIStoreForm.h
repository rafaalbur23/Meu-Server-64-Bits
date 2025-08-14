
#pragma once

#include "uiglobalvar.h"
#include "uiguidata.h"
#include "uiform.h"
#include "uilabel.h"
#include "uimemo.h"
#include "uiboxform.h"
#include "uifastcommand.h"
#include "uitreeview.h"
#include "uiprogressbar.h"
#include "UI3DCompent.h"
#include "NetProtocol.h"
#include "uipage.h"

#include <map>


namespace GUI
{

	// Information about a single item in a single product
	struct stItemInfo
	{
		short       itemID;         //	item number
		int         itemNum;        //	number of props
		int         itemFlute;      //	Number of grooves
		short       itemAttrID[5];  //	Five attribute numbers
		short       itemAttrVal[5]; //	five attribute values

		stItemInfo() { memset(this, 0, sizeof(stItemInfo)); }
		void Clear() { memset(this, 0, sizeof(stItemInfo)); }
	};

	// single product information
	struct stStoreInfo
	{
		long        comID;          //	Product Number
		char        comName[21];    //	product name
		long        comClass;       //	Categories
		long        comTime;        //	Product launch time
		long        comPrice;       //	price
		char        comRemark[129]; //	Product Notes
		int         comNumber;      //  The remaining number of items. -1 unlimited, 0 removed
		time_t      comExpire;      //  The expiry time of the item.
		int         itemNum;        //  number of props
		int         isHot;          //  Is it hot?
		stItemInfo  comItemInfo[6]; //  Up to six props

		stStoreInfo() { memset(this, 0, sizeof(stStoreInfo)); }
		void Clear()  { memset(this, 0, sizeof(stStoreInfo)); }
	};

	//  Single item GUI
	struct stStoreGui
	{
		CLabelEx*		labName;			// Product name
		CLabelEx*		labPrice;			// commodity price
		CLabelEx*		labLeftTime;		// Product remaining time
		CLabelEx*		labLeftNum;			// The remaining number of items
		CLabelEx*		labRemark;			// product description
		CLabelEx*		labRightClickView;	// Right click to view details
		CImage*			imgCutLine;			// Dividing line
		CImage*			imgHot;				// hot selling chart
		CImage*			imgNew;				// New product map
		CImage*			imgBlue;			// Highlight the selected product
		CImage*			imgSquare;			// tool lattice
		COneCommand*	cmdStore;			// product form
		CTextButton*	btnBlue;			// Highlight button
		
		//CImage*			imgMoney;
		//CImage*			imgWhite;

		void SetIsShow(bool v)
		{
			labName->SetIsShow(v);
			labPrice->SetIsShow(v);
			labRemark->SetIsShow(v);
			labLeftTime->SetIsShow(v);
			labLeftNum->SetIsShow(v);
			labRightClickView->SetIsShow(v);
			imgCutLine->SetIsShow(v);
			imgHot->SetIsShow(v);
			imgNew->SetIsShow(v);
			imgBlue->SetIsShow(v);
			imgSquare->SetIsShow(v);
			cmdStore->SetIsShow(v);
			btnBlue->SetIsShow(v);
			//imgWhite->SetIsShow(v);
			//imgMoney->SetIsShow(v);

			if(!v) cmdStore->DelCommand();
		}
	};


	class CStoreMgr : public CUIInterface
	{
	public:
		CStoreMgr();

		void ShowTempKitbag(bool bShow = true);
		void ShowStoreForm(bool bShow = true);
		void ShowStoreLoad(bool bShow = true);
		void ShowViewAllForm(bool bShow = true);
		void ShowTryonForm(bool bShow = true);
		void ShowAlphaMatteForm(bool bShow = true);
		void ShowStoreWebPage();
		int CalculateRemainTime(int time);
		void SetRemainTime();

		CGoodsGrid* GetTempKitbagGrid()		{  return grdTempBag;	}
		CForm*		GetStoreForm()			{  return frmStore;		}
		static int	GetPageSize()			{  return STORE_PAGE_SIZE;  }

		// scene goes black
		void DarkScene(bool bDark);

		// Remove from makeshift backpack
		bool PopFromTempKitbag(CGoodsGrid& rkDrag, CGoodsGrid& rkSelf, int nGridID, CCommandObj& rkItem);

		// Open the store and ask
		void OpenStoreAsk();

		// Add a mall tree node (the parent node is zero to represent the root node)
		void AddStoreTreeNode(long nParentID, long nID, const char* szCaption);

		// Add store product information
		void AddStoreItemInfo(long nSeq, long nID, const char* szName, long nPrice, const char* szRemark, int isHot, long nTime, long nRemainNum, long nRemainTime);

		// Add store product details
		void AddStoreItemDetail(long nSeq, long nSubSeq, short sItemID, short sItemNum, short sFlute, short pItemAttrID[], short pItemAttrVal[]);

		// Add user settings node
		void AddStoreUserTreeNode(void);

		// Set up the store listing page
		void SetStoreItemPage(long nCurPage, long nMaxPage);

		// Set the number of magic beans
		void SetStoreMoney(long nMoBean, long nRplMoney);

		// Definir valor VIP
		void SetStoreVip(long nVip);

		// Add store announcement
		//void AddStoreCommunique(long nID, const char* szTitle, 

		// Refresh the mall tree
		void StoreTreeRefresh();

		// Clear all mall tree nodes
		void ClearStoreTreeNode();

		// Clear all shop items list
		void ClearStoreItemList();

		// Set whether the mall button is available
		void SetStoreBuyButtonEnable(bool b);

		// Get the currently selected ID
		int GetCurSelItemID();

		// Reset last operation time, 10 second interval processing
		bool ResetLastOperate(bool bSilent = false);

		// User information node
		static const long USER_NODEID = 0x7FFFFFFE;
		static const long HELP_NODEID = 0x7FFFFFFF;
		
		CPage*			pgeIGSList;

	protected:
		virtual bool Init();
		virtual void CloseForm();
		virtual void SwitchMap();
		virtual void FrameMove(DWORD dwTime);

	private:

		// makeshift backpack
		CForm*			frmTempBag;			// Temporary backpack interface
		CGoodsGrid*		grdTempBag;			// Temporary Backpack Form
  stNumBox*		  m_pkNumberBox;   // 询问个数
		stNetTempKitbag m_NetTempKitbag;	// Temporary backpack network protocol data

		static void _evtDragItemsEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);

	public:
		
		// mall
		CForm*			frmStore;			// Mall interface
		
		
		CTreeView*		trvStore;			// tree list
		CLabelEx*		labMoneyLeft;		// money surplus
		CLabelEx*		labBeanLeft;		// Tokens remaining
		//CLabelEx*		labMemberStyle;		// Type of membership

		CLabelEx*		labNameTitle;
		CLabelEx*		labPriceTitle;
		CLabelEx*		labLeftTimeTitle;
		CLabelEx*		labLeftNumTitle;

		CLabelEx*		labListPage;		// Page tab
		CTextButton*	btnLeftPage;		// left button
		CTextButton*	btnRightPage;		// right button
		CTextButton*	btnTrade;			// trade button
		CTextButton*	btnTryon;			// try on button
		CTextButton*	btnViewAll;			// View all products button
		CLabelEx*		labTrade;			// trade button word
		CLabelEx*		labTryon;			// Try on button word
		CLabelEx*		labViewAll;			// View All Product Button Words
		CMemo*			memStoreHelp;		// personal information help
		CImage*			imgBackGround10;	// White bezel (displayed when the product is purchased, not displayed when customizing the information)
		stNumBox*		m_pkExchangeNum;	// Exchange tokens input box
	
		static const int STORE_PAGE_SIZE = 9;		  // The product list can be up to 9 items per page
		
		stStoreGui		m_stStoreGui [STORE_PAGE_SIZE];
		int 			RemainTime[STORE_PAGE_SIZE];

	private:	
		stStoreInfo		m_stStoreInfo[STORE_PAGE_SIZE];

		long			m_nCurClass;		// current type
		long			m_nCurSel;			// current selection
		long			m_nCurPage;			// current page
		long			m_nMaxPage;			// maximum page
		long			m_nExchangeNum;		// Exchange number
		long			m_nVip;				// Is it a VIP


		typedef std::map<long, string> MapNode;
		typedef std::map<long, string>::iterator MapNodeIter;
		MapNode			m_mapNode;		// tree node

		void _SetIsShowUserInfo(bool bShow);
		void _SetIsShowHelpInfo(bool bShow);
		void _SetIsShowCozeForm(bool bShow);
		void _RefreshStoreListHighLight();
		void _ShowTradeSelectBox();
		void _LoadStoreHelpInfo();
		void _ChangeChaPart(stNetLookInfo& SLookInfo);
		bool _IsCurSelVipNode(void);

		static void	_evtStoreTreeMouseClick(CGuiData *pSender, int x, int y, DWORD key);
		static void	_evtStoreOpenCheckEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);
		static void	_evtStoreToVipEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);
		static void _evtExchangeEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);
		static void	_evtExchangeCheckEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);
		static void	_evtTradeCheckEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);
		static void _evtStoreFormClose(CForm* pForm, bool& IsClose);

		static void _evtStoreFormMouseEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);
		static void	_evtStoreListMouseRClick(CGuiData *pSender, int x, int y, DWORD key);
		static void	_evtStoreListMouseDBClick(CGuiData *pSender, int x, int y, DWORD key);
		
		static void _evtPageChange(CGuiData* pSender); //add by Shadow

	private:

		// 商城读取界面
		CForm*			frmStoreLoad;
		CProgressBar*	proStoreLoad;
		static void _evtStoreLoadFormClose(CForm* pForm, bool& IsClose);
		static void _evtProTimeArriveEvt(CGuiData *pSender);
		DWORD			_dwDarkScene;

		static const int STORE_OPEN_TIMEOUT = 15;	// Mall opening timeout (unit: seconds)

	private:

		// 查看祥细
		static const int STORE_ITEM_COUNT = 6;	// Goods up to six props
		CForm*			frmViewAll;
		CMemo*			memViewAll;
		CImage*			imgSquareViewAll[STORE_ITEM_COUNT];
		COneCommand*	cmdSquareIcon[STORE_ITEM_COUNT];

		static void _evtStoreViewAllMouseEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey);
		static void _evtStoreViewAllLostEvent(CGuiData *pSender);

  private:
  // 试穿(Avata)
  CForm*	  frmTryon;	  // 试穿界面
  C3DCompent* ui3dplayer; // 3D试穿

  int			m_nChaRotate; // 角色旋转
  CCharacter*	m_pCurrMainCha;
  bool			m_isFight;
  stNetLookInfo m_sLookInfo;
  stNetLookInfo m_sCurLookInfo;

  void ChaEquipClearAll();
  void ChaLeftRotate();
  void ChaRightRotate();
  void RenderChaTryon(int x, int y); // 绘制 3D 角色

  static void _evtChaTryonRenderEvent(C3DCompent* pSender, int x, int y);
  static void _evtChaEquipClearAll(CGuiData* sender, int x, int y, DWORD key);
  static void _evtChaLeftRotate(CGuiData* sender, int x, int y, DWORD key);
  static void _evtChaRightRotate(CGuiData* sender, int x, int y, DWORD key);
  static void _evtChaLeftContinueRotate(CGuiData* sender);
  static void _evtChaRightContinueRotate(CGuiData* sender);
  static void _evtTryonFormClose(CForm* pForm, bool& IsClose);
};

} // namespace GUI
