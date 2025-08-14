
#include "stdafx.h"
#include "uistoreform.h"
#include "uidoublepwdform.h"

#include "GameApp.h"
#include "uiItem.h"
#include "uilabel.h"
#include "uiformmgr.h"
#include "uigoodsgrid.h"
#include "uiboxform.h"
#include "uigraph.h"
#include "uilist.h"
#include "uiEquipForm.h"
#include "UIGoodsGrid.h"
#include "uiItemCommand.h"
#include "uiBoatForm.h"
#include "packetcmd.h"
#include "Character.h"
#include "StringLib.h"
#include "SceneItem.h"

#include <time.h>
#include <shellapi.h>

#ifdef NEW_STORE
#include "uiwebbrowser.h"
#endif

namespace GUI
{

	CStoreMgr::CStoreMgr()
	{
		frmStore = NULL;

		m_nCurClass = 0;
		m_nCurSel   = -1;
		m_nVip      = 0;

		_dwDarkScene = 0;

		m_pCurrMainCha = NULL;
	}

	bool CStoreMgr::Init()
	{
		CFormMgr &mgr = CFormMgr::s_Mgr;

		//
		// ��ʱ��������
		//
		frmTempBag = mgr.Find("frmTempBag");
		if (!frmTempBag)
		{
			LG("gui", "frmTempBag not found.\n");
			return false;
		}
		frmTempBag->SetIsDrag(true);	// Ĭ�Ͽ����϶�
		frmTempBag->SetIsEscClose(true);

		grdTempBag = dynamic_cast<CGoodsGrid*>(frmTempBag->Find("grdTempBag"));
		if (!grdTempBag)
		{
			LG("gui", "frmTempBag:grdTempBag not found.\n");
			return false;
		}
		grdTempBag->evtBeforeAccept = CUIInterface::_evtDragToGoodsEvent;

		//
		// �̳ǽ���
		//
		frmStore = mgr.Find("frmStore");
		if(!frmStore)
		{
			LG("gui", "frmStore not found.\n");
			return false;
		}
		frmStore->evtEntrustMouseEvent = _evtStoreFormMouseEvent;
		frmStore->evtClose             = _evtStoreFormClose;

		// �̳���
		trvStore = dynamic_cast<CTreeView*>(frmStore->Find("trvStore"));
		if(!trvStore)
		{
			LG("gui", "frmStore:trvStore not found. \n");
			return false;
		}
		trvStore->SetSelectColor( 0 );
		trvStore->evtMouseDown = _evtStoreTreeMouseClick;

		// ��Ǯʣ��
		labMoneyLeft = dynamic_cast<CLabelEx*>(frmStore->Find("labMoneyLeft"));
		if(!labMoneyLeft)
		{
			LG("gui", "frmStore:labMoneyLeft not found. \n");
			return false;
		}

		// ����ʣ��
		labBeanLeft = dynamic_cast<CLabelEx*>(frmStore->Find("labBeanLeft"));
		if(!labBeanLeft)
		{
			LG("gui", "frmStore:labBeanLeft not found. \n");
			return false;
		}

		// ��Ա����
		/* labMemberStyle = dynamic_cast<CLabelEx*>(frmStore->Find("labMemberStyle"));
		if(! labMemberStyle)
		{
			LG("gui", "frmStore:labMemberStyle not found. \n");
			return false;
		} */


		labNameTitle = dynamic_cast<CLabelEx*>(frmStore->Find("labNameTitle0"));
		if(!labNameTitle)
		{
			LG("gui", "frmStore:labNameTitle0 not found. \n");
			return false;
		}

		labPriceTitle = dynamic_cast<CLabelEx*>(frmStore->Find("labPriceTitle"));
		if(!labPriceTitle)
		{
			LG("gui", "frmStore:labPriceTitle not found. \n");
			return false;
		}

		labLeftTimeTitle = dynamic_cast<CLabelEx*>(frmStore->Find("labLeftTimeTitle"));
		if(!labLeftTimeTitle)
		{
			LG("gui", "frmStore:labLeftTimeTitle not found. \n");
			return false;
		}

		labLeftNumTitle = dynamic_cast<CLabelEx*>(frmStore->Find("labLeftNumTitle"));
		if(!labLeftNumTitle)
		{
			LG("gui", "frmStore:labLeftNumTitle not found. \n");
			return false;
		}

		pgeIGSList = dynamic_cast<CPage*>(frmStore->Find("pgeIGSList"));
		assert(pgeIGSList != NULL);
		pgeIGSList->evtSelectPage = _evtPageChange;


		// �̳�ҳ��ǩ
		labListPage = dynamic_cast<CLabelEx*>(frmStore->Find("labListPage"));
		if(!labListPage)
		{
			LG("gui", "frmStore:labListPage not found. \n");
			return false;
		}

		// �̳�ҳ��Ŧ
		btnLeftPage = dynamic_cast<CTextButton*>(frmStore->Find("btnLeftPage"));
		if(! btnLeftPage)
		{
			LG("gui", "frmStore:btnLeftPage not found. \n");
			return false;
		}

		// �̳�ҳ�Ұ�Ŧ
		btnRightPage = dynamic_cast<CTextButton*>(frmStore->Find("btnRightPage"));
		if(! btnRightPage)
		{
			LG("gui", "frmStore:btnRightPage not found. \n");
			return false;
		}

		// ���װ�Ŧ
		btnTrade = dynamic_cast<CTextButton*>(frmStore->Find("btnTrade"));
		if(! btnTrade)
		{
			LG("gui", "frmStore:btnTrade not found. \n");
			return false;
		}
		btnTrade->SetIsEnabled(false);

		// �Դ���ť
		btnTryon = dynamic_cast<CTextButton*>(frmStore->Find("btnTryon"));
		if(! btnTryon)
		{
			LG("gui", "frmStore:btnTryon not found. \n");
			return false;
		}
		btnTryon->SetIsEnabled(false);

		btnViewAll = dynamic_cast<CTextButton*>(frmStore->Find("btnViewAll"));
		if(! btnViewAll)
		{
			LG("gui", "frmStore:btnViewAll not found. \n");
			return false;
		}
		btnViewAll->SetIsEnabled(false);

		// ���װ�ť��
		labTrade = dynamic_cast<CLabelEx*>(frmStore->Find("labTrade"));
		if(! labTrade)
		{
			LG("gui", "frmStore:labTrade not found. \n");
			return false;
		}

		// �Դ���ť��
		labTryon = dynamic_cast<CLabelEx*>(frmStore->Find("labTryon"));
		if(! labTryon)
		{
			LG("gui", "frmStore:labTryon not found. \n");
			return false;
		}

		// ȫ����ʾ��ť��
		labViewAll = dynamic_cast<CLabelEx*>(frmStore->Find("labViewAll"));
		if(! labViewAll)
		{
			LG("gui", "frmStore:labViewAll not found. \n");
			return false;
		}

		// ������Ϣ����
		memStoreHelp = dynamic_cast<CMemo*>(frmStore->Find("memStoreHelp"));
		if(! memStoreHelp)
		{
			LG("gui", "frmStore:memStoreHelp not found. \n");
			return false;
		}


		// ��ʾ���֣�������
		//CLabelEx* labNotice = dynamic_cast<CLabelEx*>(frmStore->Find("labNotice"));
		//if(labNotice)
		//{
		//	labNotice->SetIsFlash(true);
		//}

		// ���壨��Ʒ����ʱ��ʾ���Զ�����Ϣʱ����ʾ��
		imgBackGround10 = dynamic_cast<CImage*>(frmStore->Find("imgBackGround10"));
		if(! imgBackGround10)
		{
			LG("gui", "frmStore:imgBackGround10 not found. \n");
			return false;
		}

		// Mall product list
		char szName[32] = {0};
		for(int i = 0; i < STORE_PAGE_SIZE; ++i)
		{
			_snprintf_s(szName, _countof(szName), _TRUNCATE, "labName_%d", i);
			m_stStoreGui[i].labName = dynamic_cast<CLabelEx*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].labName)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "labPrice_%d", i);
			m_stStoreGui[i].labPrice = dynamic_cast<CLabelEx*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].labPrice)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "labLeftTime_%d", i);
			m_stStoreGui[i].labLeftTime = dynamic_cast<CLabelEx*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].labLeftTime)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "labLeftNum_%d", i);
			m_stStoreGui[i].labLeftNum = dynamic_cast<CLabelEx*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].labLeftNum)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "labRemark_%d", i);
			m_stStoreGui[i].labRemark = dynamic_cast<CLabelEx*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].labRemark)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "labRightClickView_%d", i);
			m_stStoreGui[i].labRightClickView = dynamic_cast<CLabelEx*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].labRightClickView)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "cmdStore_%d", i);
			m_stStoreGui[i].cmdStore = dynamic_cast<COneCommand*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].cmdStore)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}
			m_stStoreGui[i].cmdStore->SetIsDrag(false);	// �������϶�

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "imgSquare_%d", i);
			m_stStoreGui[i].imgSquare = dynamic_cast<CImage*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].imgSquare)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "btnBlue_%d", i);
			m_stStoreGui[i].btnBlue = dynamic_cast<CTextButton*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].btnBlue)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}
			m_stStoreGui[i].btnBlue->evtMouseRClick  = _evtStoreListMouseRClick;
			m_stStoreGui[i].btnBlue->evtMouseDBClick = _evtStoreListMouseDBClick;

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "imgCutLine_%d", i);
			m_stStoreGui[i].imgCutLine = dynamic_cast<CImage*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].imgCutLine)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "imgHot_%d", i);
			m_stStoreGui[i].imgHot = dynamic_cast<CImage*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].imgHot)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "imgNew_%d", i);
			m_stStoreGui[i].imgNew = dynamic_cast<CImage*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].imgNew)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "imgBlue_%d", i);
			m_stStoreGui[i].imgBlue = dynamic_cast<CImage*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].imgBlue)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}
			
			/*sprintf(szName, "imgWhite_%d", i);
			m_stStoreGui[i].imgWhite = dynamic_cast<CImage*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].imgWhite)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}
			
			sprintf(szName, "imgMoney_%d", i);
			m_stStoreGui[i].imgMoney = dynamic_cast<CImage*>(frmStore->Find(szName));
			if(! m_stStoreGui[i].imgMoney)
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}*/
		} // end for(0..4)
		ClearStoreTreeNode();
		ClearStoreItemList();


		//
		// �̳ǽ�����
		//
		frmStoreLoad = CFormMgr::s_Mgr.Find("frmStoreLoad");
		if(!frmStoreLoad) return false;
		frmStoreLoad->evtClose = _evtStoreLoadFormClose;

		proStoreLoad = dynamic_cast<CProgressBar*>(frmStoreLoad->Find("proStoreLoad"));
		if(!proStoreLoad) return false;
		proStoreLoad->evtTimeArrive = _evtProTimeArriveEvt;


		//
		// �鿴��ϸ
		//
		frmViewAll = CFormMgr::s_Mgr.Find("frmViewAll");
		if(! frmViewAll)
		{
			LG("gui", "frmViewAll not found.\n");
			return false;
		}
		frmViewAll->evtLost = _evtStoreViewAllLostEvent;

		memViewAll = dynamic_cast<CMemo*>(frmViewAll->Find("memViewAll"));
		if(! memViewAll)
		{
			LG("gui", "frmViewAll:memViewAll not found.\n");
			return false;
		}

		for(int i = 0; i < STORE_ITEM_COUNT; ++i)
		{
			_snprintf_s(szName, _countof(szName), _TRUNCATE, "imgSquareViewAll_%d", i);
			imgSquareViewAll[i] = dynamic_cast<CImage*>(frmViewAll->Find(szName));
			if(! imgSquareViewAll[i])
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			_snprintf_s(szName, _countof(szName), _TRUNCATE, "cmdSquareIcon_%d", i);
			cmdSquareIcon[i] = dynamic_cast<COneCommand*>(frmViewAll->Find(szName));
			if(! cmdSquareIcon[i])
			{
				LG("gui", "frmStore:%s not found. \n", szName);
				return false;
			}

			cmdSquareIcon[i]->SetIsDrag(false);
		}


		//
		// �Դ�����
		//
		frmTryon = mgr.Find("frmTryon");
		if(!frmTryon)
		{
			LG("gui", "frmTryon not found.\n");
			return false;
		}
		frmTryon->evtClose = _evtTryonFormClose;

		// ���ƽ�ɫ3D�ؼ�
		ui3dplayer = dynamic_cast<C3DCompent*>(frmTryon->Find("ui3dplayer"));
		if(! ui3dplayer)
		{
			LG("gui", "frmStore:ui3dplayer not found. \n");
			return false;
		}
		ui3dplayer->SetRenderEvent(_evtChaTryonRenderEvent);

		CTextButton* btnClearAll = dynamic_cast<CTextButton*>(frmTryon->Find("btnClearAll"));
		if(btnClearAll)
		{
			btnClearAll->evtMouseClick	= _evtChaEquipClearAll;
		}

		CTextButton* btnTurnleft3d = dynamic_cast<CTextButton*>(frmTryon->Find("btnTurnleft3d"));
		if(btnTurnleft3d)
		{
			btnTurnleft3d->evtMouseClick        = _evtChaLeftRotate;
			btnTurnleft3d->evtMouseDownContinue = _evtChaLeftContinueRotate;
		}

		CTextButton* btnTurnright3d = dynamic_cast<CTextButton*>(frmTryon->Find("btnTurnright3d"));
		if(btnTurnright3d)
		{
			btnTurnright3d->evtMouseClick        = _evtChaRightRotate;
			btnTurnright3d->evtMouseDownContinue = _evtChaRightContinueRotate;
		}

		return true;
	}


	void CStoreMgr::CloseForm()
	{
		//if(frmStore)
		//{
		//	frmStore->SetIsShow(false);
		//}
	}


	void CStoreMgr::SwitchMap()
	{
		ShowStoreForm(false);
	}


	void CStoreMgr::FrameMove(DWORD dwTime)
	{
		if(frmStoreLoad->GetIsShow())
		{
			if(GetTickCount() - _dwDarkScene > STORE_OPEN_TIMEOUT * 1000)
			{
				DarkScene(false);
				_dwDarkScene = 0;

				ShowStoreLoad(false);
			}
		}
	}


	void CStoreMgr::ShowTempKitbag(bool bShow)
	{
		if(bShow)
		{
			if(frmStore->GetIsShow())
			{
				frmTempBag->SetPos(frmStore->GetX2(), frmStore->GetHeight() - frmTempBag->GetHeight());
				frmTempBag->SetIsDrag(false);
				frmTempBag->Refresh();
				frmTempBag->SetIsShow(true);
			}
			else
			{
				CForm* frmEquip = g_stUIEquip.GetItemForm();
				frmEquip->SetPos(100, 100);
				frmEquip->Refresh();
				frmEquip->SetIsShow(true);

				frmTempBag->SetPos(frmEquip->GetX2(), frmEquip->GetY());
				frmTempBag->Refresh();
				frmTempBag->SetIsShow(true);
			}
		}
		else
		{
			frmTempBag->SetIsShow(false);
		}
	}


	// ���̳�ѯ��
	void CStoreMgr::OpenStoreAsk()
	{
		CBoxMgr::ShowSelectBox(_evtStoreOpenCheckEvent, RES_STRING(CL_LANGUAGE_MATCH_858), true);
	}


	void CStoreMgr::ShowStoreForm(bool bShow)
	{
		g_stUIDoublePwd.CloseAllForm();
		CFormMgr::s_Mgr.SetEnableHotKey(HOTKEY_STORE, ! bShow);		// �����ĵ��޸�
		_SetIsShowCozeForm(! bShow);

		// �ر�Loading...
		ShowStoreLoad(false);

		if(bShow)
		{
			
			
			StoreTreeRefresh();
			_SetIsShowUserInfo(false);

			// ������ʱ���� ESC ����
			frmTempBag->SetIsEscClose(false);

			frmStore->SetPos(0, 0);
			frmStore->Refresh();
			frmStore->SetIsShow(true);

			if(! frmTryon->GetIsShow())
			{
				// ��ʾ�Դ�����
				ShowTryonForm(true);
			}

			// ��ʾ��ʱ����
			ShowTempKitbag(true);

			CUIInterface::MainChaMove();
		}
		else
		{
			frmStore->SetIsShow(false);

			ClearStoreTreeNode();
			ClearStoreItemList();
		}
	}


	void CStoreMgr::ShowStoreLoad(bool bShow)
	{
		if(bShow)
		{
			proStoreLoad->SetRange(0.0f, STORE_OPEN_TIMEOUT * 1.0f);
			proStoreLoad->SetPosition(0.0f);

			frmStoreLoad->SetPos((g_pGameApp->GetWindowWidth()  - frmStoreLoad->GetWidth())  >> 1,
								 (g_pGameApp->GetWindowHeight() - frmStoreLoad->GetHeight()) >> 1);
			frmStoreLoad->Refresh();
			frmStoreLoad->ShowModal();

			_dwDarkScene = GetTickCount();
		}
		else
		{
			frmStoreLoad->SetIsShow(false);
		}

		DarkScene(bShow);
	}


	void CStoreMgr::ShowViewAllForm(bool bShow)
	{
		if(! bShow)
		{
			frmViewAll->SetIsShow(false);
			return;
		}

		if(m_nCurSel < 0 || m_nCurSel >= STORE_PAGE_SIZE)
		{
			return;
		}

		for(int i = 0; i < STORE_ITEM_COUNT; ++i)
		{
			imgSquareViewAll[i]->SetIsShow(false);
			cmdSquareIcon[i]->SetIsShow(false);
			cmdSquareIcon[i]->DelCommand();

			if(m_stStoreInfo[m_nCurSel].comItemInfo[i].itemID > 0)
			{
				CItemRecord* pInfo = GetItemRecordInfo(m_stStoreInfo[m_nCurSel].comItemInfo[i].itemID);
				if(! pInfo) continue;

				CItemCommand* pItem = new CItemCommand(pInfo);
				SItemGrid& oItemGrid = pItem->GetData();

				oItemGrid.sNum = m_stStoreInfo[m_nCurSel].comItemInfo[i].itemNum;
				for(int j = 0; j < defITEM_INSTANCE_ATTR_NUM; ++j)
				{
					oItemGrid.sInstAttr[j][0] = m_stStoreInfo[m_nCurSel].comItemInfo[i].itemAttrID[j];
					oItemGrid.sInstAttr[j][1] = m_stStoreInfo[m_nCurSel].comItemInfo[i].itemAttrVal[j];
				}

				// ��Ʒ����
				unsigned long ulForgeP = oItemGrid.GetDBParam(enumITEMDBP_FORGE);
				short sFlute = (short)(m_stStoreInfo[m_nCurSel].comItemInfo[i].itemFlute);
				short sHole  = (short)(ulForgeP / 1000000000);
				ulForgeP = ulForgeP + (sFlute - sHole) * 1000000000;
				oItemGrid.SetDBParam(enumITEMDBP_FORGE, (long)ulForgeP);

				cmdSquareIcon[i]->AddCommand(pItem);
				cmdSquareIcon[i]->SetIsShow(true);
				imgSquareViewAll[i]->SetIsShow(true);
			}
		}

		memViewAll->SetCaption(m_stStoreInfo[m_nCurSel].comRemark);
		memViewAll->ProcessCaption();
		memViewAll->Refresh();

		// ������ʾ
		frmViewAll->SetPos((g_pGameApp->GetWindowWidth()  - frmViewAll->GetWidth())  >> 1 , 
						   (g_pGameApp->GetWindowHeight() - frmViewAll->GetHeight()) >> 1);
		frmViewAll->Refresh();
		frmViewAll->SetIsShow(true);
	}


	// ��ʾ��ҳ�̳�
	void CStoreMgr::ShowStoreWebPage()
	{
		//ShellExecute(0, "open",
		//			 RES_STRING(CL_LANGUAGE_MATCH_938), // "http://cache.moliyo.com/shop_77/",
		//			 NULL, NULL, SW_SHOW);
	}


	// ��ʾ�Դ�
	void CStoreMgr::ShowTryonForm(bool bShow)
	{
		if(bShow)
		{
			CCharacter* pMainCha = g_stUIBoat.GetHuman();
			if(! pMainCha)
				return;

			if(false == frmTryon->GetIsShow())
			{
				// ��һ����ʾʱ������������
				m_nChaRotate = 0;

				m_pCurrMainCha = pMainCha;

				m_sLookInfo.SLook = pMainCha->GetPart();
				m_sLookInfo.chSynType = enumSYN_LOOK_SWITCH;

				m_sCurLookInfo = m_sLookInfo;

				m_isFight = m_pCurrMainCha->GetIsFight();
				m_pCurrMainCha->FightSwitch(true);	// ǿ�ƴ򿪵�ǰ��ɫս��״̬

				frmTryon->SetIsEscClose(false);
				frmTryon->SetPos(frmStore->GetX2(), frmStore->GetY());
				frmTryon->Refresh();
				frmTryon->SetIsShow(true);
				return;
			}

			//
			// װ���Դ�
			bool bAllowEquip = false;
			DWORD dwBodyType = m_pCurrMainCha->GetDefaultChaInfo()->lID;

			if(0 <= m_nCurSel && m_nCurSel < STORE_PAGE_SIZE)
			{
				//bool leftHand = true;
				for(int i = enumEQUIP_PART_NUM; i >= 0; --i){
					if(m_stStoreInfo[m_nCurSel].comItemInfo[i].itemID <= 0)
						continue;

					//CItemRecord* pItem = pItemCmd->GetItemInfo();
					CItemRecord* pItem = GetItemRecordInfo(m_stStoreInfo[m_nCurSel].comItemInfo[i].itemID);
					if(! pItem)
						continue;

					short sType = pItem->sType;
					if(1 <= sType && sType <= 11)	// ����
					{
						if( pItem->szAbleLink[0] < enumEQUIP_NUM )
						{
							if(! pItem->IsAllowEquip(dwBodyType))
							{
								continue;
							}

							m_sCurLookInfo.SLook.SLink[pItem->szAbleLink[0]].sID  = (short)pItem->lID;
							m_sCurLookInfo.SLook.SLink[pItem->szAbleLink[0]].sNum = 1;
							bAllowEquip = true;
						}
						
					}
					else if(sType == 20)	// Hat
					{
						if(! pItem->IsAllowEquip(dwBodyType))
						{
							continue;
						}
						m_sCurLookInfo.SLook.SLink[enumEQUIP_HEAD] = (short)pItem->lID;
						m_sCurLookInfo.SLook.SLink[enumEQUIP_HEAD].sNum = 1;
						bAllowEquip = true;
					}
					else if(sType == 44)	// Wings
					{
						if(! pItem->IsAllowEquip(dwBodyType))
						{
							continue;
						}
						m_sCurLookInfo.SLook.SLink[enumEQUIP_WING] = (short)pItem->lID;
						m_sCurLookInfo.SLook.SLink[enumEQUIP_WING].sNum = 1;
						bAllowEquip = true;
					}
					else if(sType == 88)	// Cloak
					{
						if(! pItem->IsAllowEquip(dwBodyType))
						{
							continue;
						}
						m_sCurLookInfo.SLook.SLink[enumEQUIP_CLOAK] = (short)pItem->lID;
						m_sCurLookInfo.SLook.SLink[enumEQUIP_CLOAK].sNum = 1;
						bAllowEquip = true;
					}
					else if(sType == 15)	// Cloak
					{
						if(! pItem->IsAllowEquip(dwBodyType))
						{
							continue;
						}
						m_sCurLookInfo.SLook.SLink[enumEQUIP_MOUNT] = (short)pItem->lID;
						m_sCurLookInfo.SLook.SLink[enumEQUIP_MOUNT].sNum = 1;
						bAllowEquip = true;
					}
					else if (sType == 22 || sType == 27) // �·�
					{
						if (!pItem->IsAllowEquip(dwBodyType)) {
							continue;
						}
						m_sCurLookInfo.SLook.SLink[enumEQUIP_BODY] = (short)pItem->lID;
						m_sCurLookInfo.SLook.SLink[enumEQUIP_BODY].sNum = 1;
						bAllowEquip = true;
					} else if (sType == 23) // ����
					{
						if (!pItem->IsAllowEquip(dwBodyType)) {
							continue;
						}
						m_sCurLookInfo.SLook.SLink[enumEQUIP_GLOVE] = (short)pItem->lID;
						m_sCurLookInfo.SLook.SLink[enumEQUIP_GLOVE].sNum = 1;
						bAllowEquip = true;
					} else if (sType == 24) // Ь��
					{
						if (!pItem->IsAllowEquip(dwBodyType)) {
							continue;
						}
						m_sCurLookInfo.SLook.SLink[enumEQUIP_SHOES] = (short)pItem->lID;
						m_sCurLookInfo.SLook.SLink[enumEQUIP_SHOES].sNum = 1;
						bAllowEquip = true;
					}
					
				}
			}

			if(bAllowEquip)
			{
				//NetChangeChaPart(m_pCurrMainCha, m_sCurLookInfo);
				_ChangeChaPart(g_stUIStore.m_sCurLookInfo);

				m_pCurrMainCha->PlayPose(POSE_WAITING, PLAY_LOOP_SMOOTH );
				m_pCurrMainCha->FightSwitch(true);	// ǿ�ƽ�ɫս��״̬
			}
			else
			{
				g_pGameApp->MsgBox(RES_STRING(CL_LANGUAGE_MATCH_882));
			}
		}
		else
		{
			frmTryon->SetIsEscClose(true);
			frmTryon->SetIsShow(false);
		}
	}


	// ��ʾ͸������
	void CStoreMgr::ShowAlphaMatteForm(bool bShow)
	{
		CForm* frmAlphaMatte = CFormMgr::s_Mgr.Find("frmAlphaMatte");
		if(frmAlphaMatte)
		{
			frmAlphaMatte->SetSize(g_pGameApp->GetWindowWidth(), g_pGameApp->GetWindowHeight());
			frmAlphaMatte->SetPos(0, 0);
			frmAlphaMatte->Refresh();

			frmAlphaMatte->SetIsShow(bShow);
		}
	}


	// �������
	void CStoreMgr::DarkScene(bool bDark)
	{
		CForm* frmStoreDark = CFormMgr::s_Mgr.Find("frmStoreDark");
		if(frmStoreDark) frmStoreDark->SetIsShow(bDark);

		_dwDarkScene = bDark ? GetTickCount() : 0;
	}

	// ����ʱ����ȡ��
	bool CStoreMgr::PopFromTempKitbag(CGoodsGrid& rkDrag, CGoodsGrid& rkSelf, int nGridID, CCommandObj& rkItem)
	{
		g_stUIStore.m_NetTempKitbag.sSrcGridID = rkDrag.GetDragIndex();
		g_stUIStore.m_NetTempKitbag.sTarGridID = nGridID;

		// �ж���Ʒ�Ƿ��ǿ��ص�����Ʒ
		CItemCommand* pkItemCmd = dynamic_cast<CItemCommand*>(&rkItem);
		if (!pkItemCmd)	return false;

  if(pkItemCmd->GetItemInfo()->GetIsPile() && pkItemCmd->GetTotalNum() > 1)
  {
	// ȡ�����Ե��ŵ���Ʒ
	m_pkNumberBox =
		g_stUIBox.ShowNumberBox(_evtDragItemsEvent, pkItemCmd->GetTotalNum(), RES_STRING(CL_LANGUAGE_MATCH_442), false);

			if (m_pkNumberBox->GetNumber() < pkItemCmd->GetTotalNum())
				return false;
			else
				return true;
		}
		else
		{
			// ȡ��������Ʒ
			g_stUIStore.m_NetTempKitbag.sSrcNum = 1;
			CS_BeginAction(g_stUIBoat.GetHuman(), enumACTION_KITBAGTMP_DRAG, (void*)&(g_stUIStore.m_NetTempKitbag));
			return true;
		}

		return true;
	}


	void CStoreMgr::_evtDragItemsEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		if(nMsgType != CForm::mrYes) 
			return;

		int num =  g_stUIStore.m_pkNumberBox->GetNumber();
		if ( num > 0 )
		{
			g_stUIStore.m_NetTempKitbag.sSrcNum = num;
			CS_BeginAction(g_stUIBoat.GetHuman(), enumACTION_KITBAGTMP_DRAG, (void*)&(g_stUIStore.m_NetTempKitbag));
		}
	}


	// ����̳�����㣨�����Ϊ���ʾ����㣩
	void CStoreMgr::AddStoreTreeNode(long nParentID, long nID, const char* szCaption)
	{
		static const char file[] = "texture/ui/store6.tga";
		static const int w = 127;
		static const int h = 20;
		static const int sx = 30;
		static const int sy = 114;
		static const int frame = 0;
		static const int TextX = 5;
		static const int TextY = 5;
		static const int maxcol = 1;
		static const int uw = 32;
		static const int uh = 32;
		static const int nWidth  = trvStore->GetWidth() - trvStore->GetScroll()->GetWidth()-28;
		static const int nHeight = 16 + 3;

		m_mapNode[nID] = string(szCaption);

		if(0 == nParentID)
		{
			// �����
			CNoteGraph* item =  new CNoteGraph( frame );
			item->GetImage()->LoadAllImage( file, w, h, sx, sy );
			item->GetImage()->SetScale( w, h );
			item->SetString( szCaption );
			item->SetTextX( TextX );
			item->SetTextY( TextY );

			CTreeGridNode* obj = new CTreeGridNode(trvStore, item);
			obj->SetIsExpand(false);
			obj->SetColMaxNum(maxcol);
			obj->SetUnitSize(uw, uh);

			CTreeNodeObj* pRootNode = trvStore->GetRootNode();
			pRootNode->AddNode(obj);

			obj->GetItem()->SetColor( COLOR_BLACK );
			obj->GetUpImage()->UnLoadImage();
			obj->GetDownImage()->UnLoadImage();
			obj->SetUnitSize(nWidth, nHeight );
			obj->SetColMaxNum(1);
		}
		else
		{
			// Ҷ�ӽ��
			MapNodeIter iterNode = m_mapNode.find(nParentID);

			if(iterNode != m_mapNode.end())
			{
				CTreeGridNode* pGridNode = dynamic_cast<GUI::CTreeGridNode*>(trvStore->GetRootNode()->FindNode(iterNode->second.c_str()));
				if(pGridNode)
				{
					CItem* pItem = new CItem();
					pItem->SetColor( COLOR_BLACK );
					pItem->SetString( szCaption );

					pGridNode->AddItem(pItem);
				}
			}
		}
	}


	// ����̳���Ʒ��Ϣ
	void CStoreMgr::AddStoreItemInfo(long nSeq, long nID, const char* szName, long nPrice, const char* szRemark, int isHot, long nTime, long nRemainNum, long nRemainTime)
	{
		if(0 > nSeq || nSeq >= STORE_PAGE_SIZE)
		{
			return;
		}

		char szTemp[128] = {0};
		//_snprintf_s( szTemp, _countof( szTemp ), _TRUNCATE,  "%s:%s", RES_STRING(CL_LANGUAGE_MATCH_845), szName);
		m_stStoreGui[nSeq].labName->SetCaption(szName);		// ��Ʒ��
		m_stStoreGui[nSeq].labName->SetIsShow(true);

		//_snprintf_s( szTemp, _countof( szTemp ), _TRUNCATE,  "%s:%s", RES_STRING(CL_LANGUAGE_MATCH_846), StringSplitNum(nPrice, 3, ','));
		m_stStoreGui[nSeq].labPrice->SetCaption(StringSplitNum(nPrice, 3, ','));	// ��Ʒ�۸�
		m_stStoreGui[nSeq].labPrice->SetIsShow(true);

		_snprintf_s(szTemp, _countof(szTemp), _TRUNCATE, "%s:%s", RES_STRING(CL_LANGUAGE_MATCH_847), StringLimit(szRemark, 25).c_str());
		m_stStoreGui[nSeq].labRemark->SetCaption(strlen(szRemark) > 0 ? szTemp : szRemark);  // ��Ʒ����
		m_stStoreGui[nSeq].labRemark->SetIsShow(true);

		
		
		if (nRemainNum > 0) 
		{
			sprintf(szTemp, "Quantity: %d", nRemainNum);
		}
		else if (nRemainNum == 0)
		{
			sprintf(szTemp, "Sold Off");
		}
		else 
		{
			sprintf(szTemp, "No Limit");
		}
		m_stStoreGui[nSeq].labLeftNum->SetCaption(szTemp);
		m_stStoreGui[nSeq].labLeftNum->SetIsShow(true);
		
		
		RemainTime[nSeq] = nRemainTime;
		
		

		m_stStoreGui[nSeq].btnBlue->SetIsShow(true);			// ��ѡ��ť
		m_stStoreGui[nSeq].labRightClickView->SetIsShow(true);
		
		//m_stStoreGui[nSeq].labLeftNum->SetIsShow(false);
		//m_stStoreGui[nSeq].labLeftTime->SetIsShow(false);

		//m_stStoreGui[nSeq].imgWhite->SetIsShow(true);
		//m_stStoreGui[nSeq].imgMoney->SetIsShow(true);
		if(isHot == -1)
		{
			// ������Ʒ
			m_stStoreGui[nSeq].imgHot->SetIsShow(false);
			m_stStoreGui[nSeq].imgNew->SetIsShow(false);
		}
		else if (isHot == 0)
		{
			m_stStoreGui[nSeq].imgHot->SetIsShow(false);
			m_stStoreGui[nSeq].imgNew->SetIsShow(true);
		}
		else if (isHot == 1)
		{
			m_stStoreGui[nSeq].imgHot->SetIsShow(true);
			m_stStoreGui[nSeq].imgNew->SetIsShow(false);
		}
		

		m_stStoreInfo[nSeq].comID     = nID;
		m_stStoreInfo[nSeq].comExpire = nTime;
		m_stStoreInfo[nSeq].comPrice  = nPrice;
		m_stStoreInfo[nSeq].comTime   = nTime;
		m_stStoreInfo[nSeq].isHot     = isHot;

		m_stStoreInfo[nSeq].comExpire = nRemainNum;	// ��ʱ
		m_stStoreInfo[nSeq].itemNum   = nRemainTime;// ����

		strncpy(m_stStoreInfo[nSeq].comName, szName, 20);	// ��Ʒ��
		m_stStoreInfo[nSeq].comName[21] = 0;

		strncpy(m_stStoreInfo[nSeq].comRemark, szRemark, 128);	// ��Ʒ��ע
		m_stStoreInfo[nSeq].comRemark[129] = 0;
	}


	// ����̳���Ʒϸ����Ϣ
	void CStoreMgr::AddStoreItemDetail(long nSeq, long nSubSeq, short sItemID, short sItemNum, short sFlute, short pItemAttrID[], short pItemAttrVal[])
	{
		if(0 > nSeq || nSeq >= STORE_PAGE_SIZE)
		{
			return;
		}

		if(0 > nSubSeq || nSubSeq >= 6)
		{
			return;
		}

		CItemRecord*  pInfo(NULL);
		CItemCommand* pItem(NULL);

		pInfo = GetItemRecordInfo(sItemID);
		if (!pInfo) return;

		// ���̳��ڲ�Ҳ����һ����Ʒ����ϸ����
		m_stStoreInfo[nSeq].comItemInfo[nSubSeq].itemID = sItemID;
		m_stStoreInfo[nSeq].comItemInfo[nSubSeq].itemNum = sItemNum;
		m_stStoreInfo[nSeq].comItemInfo[nSubSeq].itemFlute = sFlute;
		memcpy(m_stStoreInfo[nSeq].comItemInfo[nSubSeq].itemAttrID,  pItemAttrID,  sizeof(short) * 5);
		memcpy(m_stStoreInfo[nSeq].comItemInfo[nSubSeq].itemAttrVal, pItemAttrVal, sizeof(short) * 5);

		if(nSubSeq != 0)	// ֻ��ӵ�һ�������ǵ�һ�������
		{
			return;
		}

		pItem = new CItemCommand(pInfo);
		//pItem->GetData().sNum = sItemNum;	// The number of a single grid of the current product
		pItem->SetOwnDefText("");			// Don't show any custom content

		// ����
		SItemGrid& oItemGrid = pItem->GetData();
		for(int i = 0; i < defITEM_INSTANCE_ATTR_NUM; ++i)
		{
			oItemGrid.sInstAttr[i][0] = pItemAttrID[i];
			oItemGrid.sInstAttr[i][1] = pItemAttrVal[i];
		}

		// ��Ʒ����
		unsigned long ulForgeP = oItemGrid.GetDBParam(enumITEMDBP_FORGE);
		short sHole = (short)(ulForgeP / 1000000000);
		ulForgeP = ulForgeP + (sFlute - sHole) * 1000000000;
		oItemGrid.SetDBParam(enumITEMDBP_FORGE, (long)ulForgeP);

		m_stStoreGui[nSeq].cmdStore->AddCommand(pItem);
		m_stStoreGui[nSeq].cmdStore->SetIsShow(true);
		m_stStoreGui[nSeq].imgSquare->SetIsShow(true);
	}


	// ����û����ý��
	void CStoreMgr::AddStoreUserTreeNode(void)
	{
		//disabled help / management
		//AddStoreTreeNode(0, USER_NODEID, RES_STRING(CL_LANGUAGE_MATCH_906));
		//AddStoreTreeNode(0, HELP_NODEID, RES_STRING(CL_LANGUAGE_MATCH_921));
	}


	// �����̳��б�ҳ
	void CStoreMgr::SetStoreItemPage(long nCurPage, long nMaxPage)
	{
		m_nCurPage = nCurPage;
		m_nMaxPage = nMaxPage;

		if(m_nMaxPage > 0)
		{
			char szBuffer[32] = {0};
			_snprintf_s(szBuffer, _countof(szBuffer), _TRUNCATE, "%d/%d", nCurPage, nMaxPage);
			labListPage->SetCaption(szBuffer);

			btnLeftPage->SetIsShow(true);
			btnRightPage->SetIsShow(true);
			labListPage->SetIsShow(true);
		}
		else
		{
			btnLeftPage->SetIsShow(false);
			btnRightPage->SetIsShow(false);
			labListPage->SetIsShow(false);
		}
	}


	// ����ħ������
	void CStoreMgr::SetStoreMoney(long nMoBean, long nRplMoney)
	{
		char szBuffer[32] = {0};

		if(nMoBean >= 0)
		{
			_snprintf_s(szBuffer, _countof(szBuffer), _TRUNCATE, "%ld", nMoBean);
			labBeanLeft->SetCaption(szBuffer);
		}

		if(nRplMoney >= 0)
		{
			_snprintf_s(szBuffer, _countof(szBuffer), _TRUNCATE, "%ld", nRplMoney);
			labMoneyLeft->SetCaption(szBuffer);
		}
	}


	// ����VIPֵ
	void CStoreMgr::SetStoreVip(long nVip)
	{
		//CTextButton* btnToVip = dynamic_cast<CTextButton*>(frmStore->Find("btnToVIP"));
		if(nVip)
		{
			//if(btnToVip) btnToVip->SetIsEnabled(false);
			//labMemberStyle->SetCaption(RES_STRING(CL_LANGUAGE_MATCH_902)); // �׽��Ա
		}
		else
		{
			//if(btnToVip) btnToVip->SetIsEnabled(true);
			//labMemberStyle->SetCaption(RES_STRING(CL_LANGUAGE_MATCH_903)); // ��ͨ��Ա
		}

		m_nVip = nVip;
	}


	// ���ȫ�����̳������
	void CStoreMgr::ClearStoreTreeNode()
	{
		m_mapNode.clear();
		trvStore->ClearAllNode();

		m_nCurClass = -1;
	}


	// ���ȫ���̳���Ʒ�б�
	void CStoreMgr::ClearStoreItemList()
	{
		for(int i = 0; i < STORE_PAGE_SIZE; ++i)
		{
			m_stStoreGui[i].SetIsShow(false);
			m_stStoreInfo[i].Clear();
			RemainTime[i] = NULL;
		}

		btnTrade->SetIsEnabled(false);
		btnTryon->SetIsEnabled(false);
		btnViewAll->SetIsEnabled(false);

		this->_SetIsShowUserInfo(false);

		m_nCurSel = -1;
	}


	// �����̳ǰ�ť�Ƿ����
	void CStoreMgr::SetStoreBuyButtonEnable(bool b)
	{
		btnTrade->SetIsEnabled(b);
	}


	// ��õ�ǰѡ��ID
	int CStoreMgr::GetCurSelItemID()
	{
		if(0 <= m_nCurSel && m_nCurSel < STORE_PAGE_SIZE)
		{
			return m_stStoreInfo[m_nCurSel].comID;
		}

		return -1;
	}


	// ����������ʱ�䣬10 ��������
	bool CStoreMgr::ResetLastOperate(bool bSilent)
	{
		static DWORD dwLast = 0;
		DWORD dwCurr = GetTickCount();
		if(dwCurr - dwLast < 10000)
		{
			if(! bSilent)
			{
				g_pGameApp->MsgBox(RES_STRING(CL_LANGUAGE_MATCH_895));	// �̳ǲ�������Ƶ�������Ժ����ԣ�
			}

			return false;
		}

		dwLast = dwCurr;
		return true;
	}


	// ˢ���̳���
	void CStoreMgr::StoreTreeRefresh()
	{
		static const char imagefile[] = "texture/ui/store6.tga";
		static const int w = 30;
		static const int h = 20;
		static const int sx = 0;//88;
		static const int sy_a = 114;//76;
		static const int sy_s = 134;//96;
		static const int itemw = 30;
		static const int itemh = 20;

		trvStore->GetAddImage()->LoadImage(imagefile, w, h, 0, sx, sy_a);
		trvStore->GetAddImage()->SetScale( itemw, itemh );

		trvStore->GetSubImage()->LoadImage(imagefile, w, h, 0, sx, sy_s);
		trvStore->GetSubImage()->SetScale( itemw, itemh );

		trvStore->Refresh();
	}


	// �Ƿ���ʾ�û���Ϣ
	void CStoreMgr::_SetIsShowUserInfo(bool bShow)
	{
		if(bShow)
		{
			labListPage->SetIsShow(! bShow);	// �̳�ҳ��ǩ
			btnLeftPage->SetIsShow(! bShow);	// �̳�ҳ��Ŧ
			btnRightPage->SetIsShow(! bShow);	// �̳�ҳ�Ұ�Ŧ

			for(int i = 0; i < STORE_PAGE_SIZE; ++i)
			{
				m_stStoreGui[i].SetIsShow(! bShow);
			}
		}

		btnTrade->SetIsShow(! bShow);		// ���װ�Ŧ
		btnTryon->SetIsShow(! bShow);		// �Դ���ť
		btnViewAll->SetIsShow(! bShow);
		labTrade->SetIsShow(! bShow);		// ���װ�ť��
		labTryon->SetIsShow(! bShow);		// �Դ���ť��
		labViewAll->SetIsShow(! bShow);

		labNameTitle->SetIsShow(! bShow);
		labPriceTitle->SetIsShow(! bShow);
		labLeftTimeTitle->SetIsShow(! bShow);
		labLeftNumTitle->SetIsShow(! bShow);

		memStoreHelp->SetIsShow(false);

		imgBackGround10->SetIsShow(! bShow);	// �ؼ��İ�ɫ����
	}

	void CStoreMgr::_SetIsShowHelpInfo(bool bShow)
	{
		if(bShow)
		{
			labListPage->SetIsShow(! bShow);	// �̳�ҳ��ǩ
			btnLeftPage->SetIsShow(! bShow);	// �̳�ҳ��Ŧ
			btnRightPage->SetIsShow(! bShow);	// �̳�ҳ�Ұ�Ŧ

			for(int i = 0; i < STORE_PAGE_SIZE; ++i)
			{
				m_stStoreGui[i].SetIsShow(! bShow);
			}
		}

		btnTrade->SetIsShow(! bShow);		// ���װ�Ŧ
		btnTryon->SetIsShow(! bShow);		// �Դ���ť
		btnViewAll->SetIsShow(! bShow);
		labTrade->SetIsShow(! bShow);		// ���װ�ť��
		labTryon->SetIsShow(! bShow);		// �Դ���ť��
		labViewAll->SetIsShow(! bShow);

		labNameTitle->SetIsShow(! bShow);
		labPriceTitle->SetIsShow(! bShow);
		labLeftTimeTitle->SetIsShow(! bShow);
		labLeftNumTitle->SetIsShow(! bShow);

		_LoadStoreHelpInfo();
		memStoreHelp->SetIsShow(bShow);

		imgBackGround10->SetIsShow(bShow);	// �ؼ��İ�ɫ����
	}

	void CStoreMgr::_SetIsShowCozeForm(bool bShow)
	{
		CForm* frmMainChat = _FindForm("frmMain800");
		if( !frmMainChat ) return;

		CList* lstOnSay = dynamic_cast<CList*>(frmMainChat->Find("lstOnSay"));
		if(lstOnSay) lstOnSay->SetIsShow(bShow);

		CList* lstOnSaySystem = dynamic_cast<CList*>(frmMainChat->Find("lstOnSaySystem"));
		if(lstOnSaySystem) lstOnSaySystem->SetIsShow(bShow);

		CDragTitle* drpTitle = dynamic_cast<CDragTitle*>(frmMainChat->Find("drpTitle"));
		if(drpTitle) drpTitle->SetIsShow(bShow);

		CDragTitle* drpTitleSystem = dynamic_cast<CDragTitle*>(frmMainChat->Find("drpTitleSystem"));
		if(drpTitleSystem) drpTitleSystem->SetIsShow(bShow);
	}

	void CStoreMgr::_RefreshStoreListHighLight()
	{
		for(int i = 0; i < CStoreMgr::STORE_PAGE_SIZE; ++i)
		{
			g_stUIStore.m_stStoreGui[i].imgBlue->SetIsShow(i == g_stUIStore.m_nCurSel ? true : false);
		}

		if(0 <= m_nCurSel && m_nCurSel < STORE_PAGE_SIZE)
		{
			g_stUIStore.btnTrade->SetIsEnabled(true);
			g_stUIStore.btnTryon->SetIsEnabled(true);
			g_stUIStore.btnViewAll->SetIsEnabled(true);
		}
		else
		{
			g_stUIStore.btnTrade->SetIsEnabled(false);
			g_stUIStore.btnTryon->SetIsEnabled(false);
			g_stUIStore.btnViewAll->SetIsEnabled(false);
		}
	}


	void CStoreMgr::_ShowTradeSelectBox()
	{
		if(0 <= m_nCurSel && m_nCurSel < STORE_PAGE_SIZE &&
			GetCurSelItemID() > 0)
		{
			if(0 == m_nVip && _IsCurSelVipNode())
			{
				g_pGameApp->MsgBox(RES_STRING(CL_LANGUAGE_MATCH_913)); // VIPר������VIP�߼��û�����
				return;
			}

	char szTitle[256] = {0};
	_snprintf_s(szTitle, _countof(szTitle), _TRUNCATE, "%s%s: %s\n%s: %s",
				RES_STRING(CL_LANGUAGE_MATCH_857),
				RES_STRING(CL_LANGUAGE_MATCH_845), g_stUIStore.m_stStoreGui[g_stUIStore.m_nCurSel].labName->GetCaption(),
				RES_STRING(CL_LANGUAGE_MATCH_846), g_stUIStore.m_stStoreGui[g_stUIStore.m_nCurSel].labPrice->GetCaption());

	CBoxMgr::ShowSelectBox(_evtTradeCheckEvent, szTitle, true);
  }
}

	void CStoreMgr::_LoadStoreHelpInfo()
	{
		// ����
		static bool IsFirst = true;
		if( IsFirst )
		{
			IsFirst = false;
			FILE* fp = fopen( "./scripts/txt/StoreHelp.tx", "rt" );
			if( fp )
			{
				if( fseek(fp, 0, SEEK_END) == 0 )
				{
					long size = ftell( fp );
					fseek(fp, 0, SEEK_SET);

					NET_HELPINFO Info;
					memset( &Info, 0, sizeof(NET_HELPINFO) );
					fread(Info.szDesp, size > HELPINFO_DESPSIZE - 1 ? HELPINFO_DESPSIZE - 1 : size, 1, fp);

					memStoreHelp->SetCaption(Info.szDesp);
					memStoreHelp->ProcessCaption();
					memStoreHelp->Refresh();
				}
				fclose( fp );
			}
			return;
		}
	}

	void CStoreMgr::_ChangeChaPart(stNetLookInfo& SLookInfo)
	{
		if( m_pCurrMainCha && SLookInfo.chSynType==enumSYN_LOOK_SWITCH )
		{
			if ( SLookInfo.SLook.sTypeID!=0 && m_pCurrMainCha->getTypeID()!=SLookInfo.SLook.sTypeID )
			{		
				if( SLookInfo.SLook.sTypeID!=0 && SLookInfo.SLook.sTypeID!=m_pCurrMainCha->getTypeID() ) 
					m_pCurrMainCha->ReCreate( SLookInfo.SLook.sTypeID );
			}

			m_pCurrMainCha->UpdataFace( SLookInfo.SLook );
		}
	}

	bool CStoreMgr::_IsCurSelVipNode(void)
	{
		MapNodeIter it = g_stUIStore.m_mapNode.find(m_nCurClass);
		if(it != m_mapNode.end())
		{
			string strName = it->second;
			if(strName.size() > 3)
			{
				strName = strName.substr(0, 3);
				if(0 == _stricmp(strName.c_str(), RES_STRING(CL_LANGUAGE_MATCH_902))) // �׽��Ա
				{
					return true;
				}
			}
		}

		return false;
	}


	// �̳�����������¼�
	void CStoreMgr::_evtStoreTreeMouseClick(CGuiData *pSender, int x, int y, DWORD key)
	{
		CItemObj* pSelItem = g_stUIStore.trvStore->GetHitItem(x, y);
		if(pSelItem)
		{
			string strItem = pSelItem->GetString();
			for(MapNodeIter it = g_stUIStore.m_mapNode.begin(); it != g_stUIStore.m_mapNode.end(); ++it)
			{
				if(it->second == strItem)
				{
					g_stUIStore.m_nCurClass = it->first;
					g_stUIStore.m_nCurPage  = 1;

					if(strItem == RES_STRING(CL_LANGUAGE_MATCH_906))	// ���˹���
					{
						g_stUIStore._SetIsShowUserInfo(true);
					}
					else if(strItem == RES_STRING(CL_LANGUAGE_MATCH_921))	// �̳ǰ���
					{
						g_stUIStore._SetIsShowHelpInfo(true);
					}
					else	// ��Ʒ����
					{
						g_stUIStore._SetIsShowUserInfo(false);
						CS_StoreListAsk(g_stUIStore.m_nCurClass, (short)g_stUIStore.m_nCurPage, STORE_PAGE_SIZE);
					}
					break;
				}
			}

			bool bRootNode = false;
			CTreeNodeRoot* pRoot = g_stUIStore.trvStore->GetRootNode();
			if(pRoot)
			{
				for(int i = 0; i < pRoot->GetChildCount(); ++i)
				{
					CTreeNodeObj* pChild = pRoot->GetChildNode(i);
					if(0 == strcmp(pChild->GetCaption(), strItem.c_str()))
					{
						bRootNode = true;
						break;
					}
				}

				if(bRootNode)
				{
					for(int i = 0; i < pRoot->GetChildCount(); ++i)
					{
						CTreeNodeObj* pChild = pRoot->GetChildNode(i);
						if(strcmp(pChild->GetCaption(), strItem.c_str()))
						{
							pChild->SetIsExpand(false);	// �����Ѵ򿪵Ľ��
						}
						else
						{
							pChild->SetIsExpand(true);
						}
					}
					g_stUIStore.trvStore->Refresh();
				}
			}
		}
	}


	// �̳ǰ�ť����¼�
	void CStoreMgr::_evtStoreFormMouseEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		string strName = pSender->GetName();
		if(strName == "btnLeftPage")	// ǰһҳ
		{
			if(g_stUIStore.m_nCurPage > 1 && g_stUIStore.m_nCurClass > 0)
			{
				CS_StoreListAsk(g_stUIStore.m_nCurClass, (short)g_stUIStore.m_nCurPage - 1, STORE_PAGE_SIZE);
			}
		}
		else if(strName == "btnRightPage")	// ��һҳ
		{
			if(g_stUIStore.m_nCurPage < g_stUIStore.m_nMaxPage && g_stUIStore.m_nCurClass > 0)
			{
				CS_StoreListAsk(g_stUIStore.m_nCurClass, (short)g_stUIStore.m_nCurPage + 1, STORE_PAGE_SIZE);
			}
		}
		else if(strName == "btnTrade")	// ������
		{
			g_stUIStore._ShowTradeSelectBox();
		}
		else if(strName == "btnTryon")	// �Դ�
		{
			g_stUIStore.ShowTryonForm(true);
		}
		else if(strName == "btnViewAll")	// ��ʾȫ������
		{
			g_stUIStore.ShowViewAllForm(true);
		}
		else if(strName == "btnReceiveMoney")	// �һ���ť
		{
			if(g_stUIStore.imgBackGround10->GetIsShow()) return;
			g_stUIStore.m_pkExchangeNum = 
				g_stUIBox.ShowNumberBox( _evtExchangeEvent, -1, RES_STRING(CL_LANGUAGE_MATCH_904), false); // ������һ�����
		}
		//else if(strName == "btnToVIP")	// ��ΪVIP
		//{
		//	if(g_stUIStore.imgBackGround10->GetIsShow()) return;
		//	CBoxMgr::ShowSelectBox(_evtStoreToVipEvent, RES_STRING(CL_LANGUAGE_MATCH_915), true); // ȷ��Ҫ��ΪVIP�߼���Ա��
		//}
		else if(strName == "btnReceiveMoDou") // �һ�Ħ��
		{
			if(g_stUIStore.imgBackGround10->GetIsShow()) return;

				
		}
		else if(strName.size() > 0 && strName.substr(0, 8) == "btnBlue_" &&
				'0' <= strName[strName.size() - 1] && strName[strName.size() - 1] <= '0' + CStoreMgr::STORE_PAGE_SIZE)	// ѡ����Ʒ
		{
			g_stUIStore.m_nCurSel = strName[strName.size() - 1] - '0';
			g_stUIStore._RefreshStoreListHighLight();
		}
	}
	
	

#ifdef NEW_STORE
void CStoreMgr::_webFrmShow(CGuiData* pSender)
{
  CForm*	   f		= (CForm*)pSender;
  CWebBrowser* pBrowser = (CWebBrowser*)f->Find("webBrowser");
  if(pBrowser)
  {
	pBrowser->setUrlHtml("http://shop.moliyo.com/Iframe/Hdw/InnerShopBillboard.aspx");
	pBrowser->FrmActive();
  }
}

void CStoreMgr::_webFrmHide(CGuiData* pSender)
{
  CForm*	   f		= (CForm*)pSender;
  CWebBrowser* pBrowser = (CWebBrowser*)f->Find("webBrowser");
  if(pBrowser)
  {
	pBrowser->closeUrlHtml();
	pBrowser->Hide();
  }
}
#endif

	void CStoreMgr::_evtStoreListMouseRClick(CGuiData *pSender, int x, int y, DWORD key)
	{
		string strName = pSender->GetName();
		if(strName.size() > 0 && strName.substr(0, 8) == "btnBlue_" &&
				'0' <= strName[strName.size() - 1] && strName[strName.size() - 1] <= '0' + CStoreMgr::STORE_PAGE_SIZE)	// ѡ����Ʒ
		{
			g_stUIStore.m_nCurSel = strName[strName.size() - 1] - '0';
			g_stUIStore._RefreshStoreListHighLight();

			g_stUIStore.ShowViewAllForm();		// ��ʾȫ��
		}
	}


	void CStoreMgr::_evtStoreListMouseDBClick(CGuiData *pSender, int x, int y, DWORD key)
	{
		string strName = pSender->GetName();
		if(strName.size() > 0 && strName.substr(0, 8) == "btnBlue_" &&
				'0' <= strName[strName.size() - 1] && strName[strName.size() - 1] <= '0' + CStoreMgr::STORE_PAGE_SIZE)	// ѡ����Ʒ
		{
			g_stUIStore.m_nCurSel = strName[strName.size() - 1] - '0';
			g_stUIStore._RefreshStoreListHighLight();

			//g_stUIStore.ShowTryonForm();		// �Դ�
			g_stUIStore._ShowTradeSelectBox();	// ����
		}
	}


	// �̳Ǵ�ѯ�ʴ��������ϣ����ö����������֮��
	void CStoreMgr::_evtStoreOpenCheckEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		if(nMsgType != CForm::mrYes)
		{
			return;
		}

		g_stUIDoublePwd.SetType(CDoublePwdMgr::STORE_OPEN_ASK);
		g_stUIDoublePwd.ShowDoublePwdForm();
	}


	// ��ΪVIP ȷ��
	void CStoreMgr::_evtStoreToVipEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		//if(nMsgType != CForm::mrYes)
		//{
		//	return;
		//}

		//if(! g_stUIStore.ResetLastOperate())
		//	return;

		//CS_StoreVIP(20, 1);
	}


	// ���Ҷһ��¼�����
	void CStoreMgr::_evtExchangeEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		if(nMsgType != CForm::mrYes)
		{
			return;
		}

		g_stUIStore.m_nExchangeNum = 0;
		int num =  g_stUIStore.m_pkExchangeNum->GetNumber();
		if ( num > 0 )
		{
			g_stUIStore.m_nExchangeNum = num;

			char szBuffer[MAX_PATH] ={0};
			_snprintf_s(szBuffer, _countof(szBuffer), _TRUNCATE, RES_STRING(CL_LANGUAGE_MATCH_905), g_stUIStore.m_nExchangeNum); // ȷ�϶һ�����: %d
			CBoxMgr::ShowSelectBox(_evtExchangeCheckEvent, szBuffer, true);
		}
	}

	// ���Ҷһ�ȷ��
	void CStoreMgr::_evtExchangeCheckEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		if(nMsgType != CForm::mrYes)
		{
			return;
		}

		if(! g_stUIStore.ResetLastOperate())
			return;

		CS_StoreChangeAsk(g_stUIStore.m_nExchangeNum);	// ֪ͨ������
	}

	// ȷ�Ϲ�����
	void CStoreMgr::_evtTradeCheckEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		if(nMsgType != CForm::mrYes)
		{
			return;
		}

		if(0 <= g_stUIStore.m_nCurSel && g_stUIStore.m_nCurSel < CStoreMgr::STORE_PAGE_SIZE &&
			g_stUIStore.GetCurSelItemID() > 0)
		{
			g_stUIStore.SetStoreBuyButtonEnable(false);
			CS_StoreBuyAsk(g_stUIStore.GetCurSelItemID());
		}
	}


	void CStoreMgr::_evtStoreFormClose(CForm* pForm, bool& IsClose)
	{
		// ���ȼ�����
		CFormMgr::s_Mgr.SetEnableHotKey(HOTKEY_STORE, true);	// �����ĵ��޸�

		// ������ʱ���� ESC ����
		g_stUIStore.frmTempBag->SetIsEscClose(true);

		// δѡ��
		g_stUIStore.m_nCurSel = -1;

		// �ر��Դ�����
		g_stUIStore.ShowTryonForm(false);

		// ��ʱ�������̳ǹرպ�����϶�
		g_stUIStore.frmTempBag->SetIsDrag(true);

		// ��ʾ���½�������Ϣ
		g_stUIStore._SetIsShowCozeForm(true);

		// �ر���ʱ����
		if(! g_stUIEquip.GetItemForm()->GetIsShow())
		{
			g_stUIStore.ShowTempKitbag(false);
		}

		CS_StoreClose();
	}


////////////////////////////////////////////////////////////////////////////////////////////////////


	void CStoreMgr::_evtStoreLoadFormClose(CForm* pForm, bool& IsClose)
	{
		g_stUIStore.DarkScene(false);
	}

	void CStoreMgr::_evtProTimeArriveEvt(CGuiData *pSender)
	{
		g_stUIStore.DarkScene(false);
	}


////////////////////////////////////////////////////////////////////////////////////////////////////


	void CStoreMgr::_evtStoreViewAllMouseEvent(CCompent *pSender, int nMsgType, int x, int y, DWORD dwKey)
	{
		string strName = pSender->GetName();

		if(strName == "btnReBack")
		{
			g_stUIStore.ShowViewAllForm(false);
		}
	}

	
	void CStoreMgr::_evtStoreViewAllLostEvent(CGuiData *pSender)
	{
		g_stUIStore.frmViewAll->SetIsShow(false);
	}


////////////////////////////////////////////////////////////////////////////////////////////////////


	// ��ԭ�Դ�
	void CStoreMgr::ChaEquipClearAll()
	{
		m_sCurLookInfo = m_sLookInfo;
		_ChangeChaPart(m_sCurLookInfo);
		m_pCurrMainCha->FightSwitch(true);	// ǿ�ƽ�ɫս��״̬
	}

	// �Դ� 3D ��ɫ������ת
	void CStoreMgr::ChaLeftRotate()
	{
		m_nChaRotate += 180;
		m_nChaRotate += -(-1) * 15;
		m_nChaRotate = (g_stUIStore.m_nChaRotate + 360) % 360;
		m_nChaRotate -= 180;
	}

	// �Դ� 3D ��ɫ������ת
	void CStoreMgr::ChaRightRotate()
	{
		m_nChaRotate += 180;
		m_nChaRotate += -(1) * 15;
		m_nChaRotate = (g_stUIStore.m_nChaRotate + 360) % 360;
		m_nChaRotate -= 180;
	}

	// �����Դ� 3D ��ɫ
	void CStoreMgr::RenderChaTryon(int x,int y)
	{
		if( !m_pCurrMainCha ) return;

		g_Render.LookAt( D3DXVECTOR3( 11.0f, 36.0f, 10.0f ), D3DXVECTOR3( 8.70f, 12.0f, 8.0f ), LERender::VIEW_3DUI );
		y += 100;

		MPMatrix44 matCha = *m_pCurrMainCha->GetMatrix();	// �����ɫ����

  m_pCurrMainCha->SetScale(D3DXVECTOR3(0.8f, 0.8f, 0.8f));
  m_pCurrMainCha->SetUIYaw(180 + m_nChaRotate);
  m_pCurrMainCha->SetUIScaleDis(9.0f * g_Render.GetScrWidth() / 800);
  m_pCurrMainCha->RenderForUI(x, y, true);

		m_pCurrMainCha->SetMatrix(& matCha);	// �ָ���ɫ����

		g_Render.SetTransformView(&g_Render.GetWorldViewMatrix());
	}


	// ����3D��ɫ���ص���
	void CStoreMgr::_evtChaTryonRenderEvent(C3DCompent *pSender, int x, int y)
	{
		g_stUIStore.RenderChaTryon(x, y);
	}

	void CStoreMgr::_evtChaEquipClearAll(CGuiData *sender, int x, int y, DWORD key)
	{
		g_stUIStore.ChaEquipClearAll();
	}

	void CStoreMgr::_evtChaLeftRotate(CGuiData *sender, int x, int y, DWORD key )
	{
		g_stUIStore.ChaLeftRotate();
	}

	void CStoreMgr::_evtChaRightRotate(CGuiData *sender, int x, int y, DWORD key )
	{
		g_stUIStore.ChaRightRotate();
	}

	void CStoreMgr::_evtChaLeftContinueRotate(CGuiData *sender)
	{
		g_stUIStore.ChaLeftRotate();
	}

	void CStoreMgr::_evtChaRightContinueRotate(CGuiData *sender)
	{
		g_stUIStore.ChaRightRotate();
	}

void CStoreMgr::_evtTryonFormClose(CForm* pForm, bool& IsClose)
{
  if(g_stUIStore.m_pCurrMainCha)
  {
	//NetChangeChaPart(g_stUIStore.m_pCurrMainCha, g_stUIStore.m_sLookInfo);
	g_stUIStore._ChangeChaPart(g_stUIStore.m_sLookInfo);
	g_stUIStore.m_pCurrMainCha->FightSwitch(g_stUIStore.m_isFight);

	g_stUIStore.m_pCurrMainCha->SetScale(D3DXVECTOR3(1.f, 1.f, 1.f));
	g_stUIStore.m_pCurrMainCha = NULL;
  }
}

	void CStoreMgr::_evtPageChange(CGuiData *pSender)
	{
		
		int index = g_stUIStore.pgeIGSList->GetIndex();
		if(index == 0) 
		{
			CS_StoreMode(1);
			
		}
		else if(index == 1)
		{
			CS_StoreMode(2);
		
		}
	}
	int CStoreMgr::CalculateRemainTime(int time)
	{
		std::time_t rawtime = std::time(NULL);
		int Time = time - rawtime;
		int timefinal;
		
		if (Time > 0)
		{	
			timefinal = Time;
		}
		else if(Time < 0) 
		{
			timefinal = 0;
		}
		return timefinal;
	}
	void CStoreMgr::SetRemainTime()
	{
		for(int i = 0; i < STORE_PAGE_SIZE; ++i)
		{
			char szTemp[128] = {0};
			if(RemainTime[i])
			
			if (RemainTime[i] == -1)
			{
				sprintf(szTemp, "No Limit");
				
			}
			else
			{
				int Time = CalculateRemainTime(RemainTime[i]);
				if (Time == 0)
				{
					sprintf(szTemp, "Expired");
				}
				else
				{
					int day = Time / (24 * 3600);
		  
					Time = Time % (24 * 3600);
					int hour = Time / 3600;
				  
					Time %= 3600;
					int minutes = Time / 60 ;
				  
					Time %= 60;
					int seconds = Time;
					
					if (day > 0)
					{
						if (day == 1)
						{
							if(hour == 1)
							{
								sprintf(szTemp,"%d Day %d Hr",day,hour);
							}
							else
							{
								sprintf(szTemp,"%d Day %d Hrs",day,hour);
							}
						}
						else
						{
							if(hour == 1)
							{
								sprintf(szTemp,"%d Days %d Hr",day,hour);
							}
							else
							{
								sprintf(szTemp,"%d Days %d Hrs",day,hour);
							}
						}
					}
					else
					{
						if(hour > 0)
						{
							if (hour == 1)
							{
								if(minutes == 1)
								{
									sprintf(szTemp,"%d Hr %d Min",hour,minutes);
								}
								else
								{
									sprintf(szTemp,"%d Hr %d Mins",hour,minutes);
								}
							}
							else
							{
								if(minutes == 1)
								{
									sprintf(szTemp,"%d Hrs %d Min",hour,minutes);
								}
								else
								{
									sprintf(szTemp,"%d Hrs %d Mins",hour,minutes);
								}
							}
							
						}
						else
						{
							if(minutes > 0)
							{
								if (minutes == 1)
								{
									if(seconds == 1)
									{
										sprintf(szTemp,"%d Min %d Sec",minutes,seconds);
									}
									else
									{
										sprintf(szTemp,"%d Min %d Secs",minutes,seconds);
									}
								}
								else
								{
									if(seconds == 1)
									{
										sprintf(szTemp,"%d Mins %d Sec",minutes,seconds);
									}
									else
									{
										sprintf(szTemp,"%d Mins %d Secs",minutes,seconds);
									}
								}
								
							}
						}
						
					}
				}
			}
			
			m_stStoreGui[i].labLeftTime->SetCaption(szTemp);
			m_stStoreGui[i].labLeftTime->SetIsShow(true);
			
		}
	}
} // namespace GUI
