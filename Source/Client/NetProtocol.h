#pragma once
#include "GameCommon.h"
#include "Point.h"
#include "Kitbag.h"
#include "SkillStateType.h"
#include "Tools.h"
#include "Shipset.h"

class CActor;
class CCharacter;
class CSceneItem;
struct xShipBuildInfo;
struct BOAT_BERTH_DATA;

#define defMOVE_LIST_POINT_NUM 32
struct SMoveList
{
  POINT SPos[defMOVE_LIST_POINT_NUM];
  int	nPointNum;
  DWORD dwState;

  SMoveList() :
	  nPointNum(0), dwState(0){};
};

#define defMAX_POS_NUM 32

struct stNetMoveInfo // enumACTION_MOVE
{
  DWORD dwAveragePing;			 // ???????? NetIF::GetAveragePing() ?????????????????
  POINT pos_buf[defMAX_POS_NUM]; // ??????????????
  DWORD pos_num;				 // ??????

  stNetMoveInfo() :
	  dwAveragePing(0), pos_num(0){};
};

struct stNetSkillInfo // enumACTION_SKILL
{
  BYTE byFightID;
  char chMove; // 1????????2???????????

  long lSkillID; // 0??????>0?????

  // ????????????WorldID,Handle????????????????x,y
  struct
  {
	long lTarInfo1;
	long lTarInfo2;
  };

  stNetMoveInfo SMove;

  stNetSkillInfo() :
	  byFightID(0), chMove(0), lSkillID(0), lTarInfo1(0), lTarInfo2(0){};
};

struct stNetNotiMove // enumACTION_MOVE
{
  short sState;				  // ?????CompCommand.h EMoveState??
  short sStopState;			  // ????enumEXISTS_WAITING?enumEXISTS_SLEEPING
  POINT SPos[defMAX_POS_NUM]; // ??????????????
  long	nPointNum;			  // ??????

  stNetNotiMove() :
	  sState(0), sStopState(0), nPointNum(0){};
};

struct stEffect
{
  long	 lAttrID; // ?????ID
  LONG64 lVal;	  // ?????

  stEffect() :
	  lAttrID(0), lVal(0) {}
};

struct stSkillState
{
  BYTE			chID;
  BYTE			chLv; // ????????,?????????
  unsigned long lTimeRemaining{0};
  stSkillState() :
	  chID(0), chLv(0){};
};

struct stAreaSkillState
{
  BYTE			chID;
  BYTE			chLv;
  long			lWorldID; // ????????
  unsigned char uchFightID;

  stAreaSkillState() :
	  chID(0), chLv(0), lWorldID(0), uchFightID(0){};
};

struct stNetNotiSkillRepresent //???? enumACTION_SKILL_SRC
{
  BYTE	byFightID;
  short sAngle;		// ???server??
  short sState;		// ?????CompCommand.h EFightState?
  short sStopState; // ????enumEXISTS_WAITING?enumEXISTS_SLEEPING
  char	chCrt;		// 0??????1?????

  long	lSkillID;	  // ????
  long	lSkillSpeed;  // ??????????
  char	chObjType;	  // ?????0????1???
  long	lTargetID;	  // ??ID
  POINT STargetPoint; // ???
  short sExecTime;	  // ????,?????

  CSizeArray<stEffect>	   SEffect; // ???????
  CSizeArray<stSkillState> SState;	// ????

  stNetNotiSkillRepresent() :
	  byFightID(0), sAngle(0), sState(0), sStopState(0), chCrt(0), lSkillID(0), lSkillSpeed(0), chObjType(0),
	  lTargetID(0), sExecTime(0)
  {
  }
};

struct stNetNotiSkillEffect // ??????? enumACTION_SKILL_TAR
{
  BYTE	byFightID;
  short sState;		   // ?????CompCommand.h EFightState?
  bool	bDoubleAttack; // ????
  bool	bMiss;		   // Miss;
  bool	bBeatBack;	   // ????
  Point SPos;		   // ??????
  long	lSkillID;	   // ?????ID
  char	chObjType;	   // ?????0????1???
  long	lSrcID;		   // ??????ID
  Point SSrcPos;	   // ??????
  Point SSkillTPos;	   // ????
  short sExecTime;	   // ????,??

  // ??
  CSizeArray<stEffect>	   SEffect; // ???????
  CSizeArray<stSkillState> SState;	// ????

  // ???
  short					   sSrcState;  // ?????CompCommand.h EFightState?
  CSizeArray<stEffect>	   SSrcEffect; // ???????
  CSizeArray<stSkillState> SSrcState;  // ????

  stNetNotiSkillEffect() :
	  byFightID(0), sState(0), bDoubleAttack(false), bMiss(false), bBeatBack(false),
	  lSkillID(0), chObjType(0), lSrcID(0), sExecTime(0), sSrcState(0)
  {
  }
};

struct stNetPKCtrl
{
  bool bInGymkhana; // ????????????bInPK
  bool bInPK;		// ?PK

  void Exec(CCharacter* pCha);
  void Exec(unsigned long ulWorldID);

  stNetPKCtrl() :
	  bInGymkhana(false), bInPK(false){};
};

struct stNetChaSideInfo
{
  char chSideID;

  stNetChaSideInfo() :
	  chSideID(0){};
};

struct stNetAppendLook
{
  short sLookID[defESPE_KBGRID_NUM];
  bool	bValid[defESPE_KBGRID_NUM];

  void Exec(unsigned long ulWorldID);
  void Exec(CCharacter* pCha);

  stNetAppendLook()
  {
	memset(sLookID, 0, sizeof(sLookID));
	memset(bValid, 0, sizeof(bValid));
  }
};

class CSceneNode;
class CEvent;
struct stNetEvent
{
  long			 lEntityID;
  char			 chEntityType; // 1-??,2-??
  unsigned short usEventID;
  const char*	 cszEventName;

  CEvent* ChangeEvent(); // ??????

  CEvent* Exec(CSceneNode* pNode); // ????

  stNetEvent() :
	  lEntityID(0), chEntityType(0), usEventID(0), cszEventName(NULL){};
};

struct stNetLookInfo
{
  char				 chSynType; // ?? ESynLookType????enumSYN_LOOK_CHANGE????SLook.sID????0???????
  stNetChangeChaPart SLook;

  stNetLookInfo() :
	  chSynType(0){};
};

struct stNetActorCreate // ???????
{
  stNetActorCreate() :
	  ulWorldID(0), lHandle(0), ulChaID(0), chCtrlType(0), sAngle(0), ulTLeaderID(0), sState(0), sIcon(0), chSeeType(enumENTITY_SEEN_NEW), szCommName(NULL), strGuildName(""), strMottoName(""), strGuildMotto(""),
	  strStallName(""), szName(NULL) {}

  unsigned long ulWorldID;
  unsigned long ulCommID;	// ??ID
  const char*	szCommName; // ?????
  long			lHandle;	// ???????????
  unsigned long ulChaID;
  char			chCtrlType; // ????????NPC???????CompCommand.h EChaCtrlType?
  Circle		SArea;
  short			sAngle;		 // ???server??
  unsigned long ulTLeaderID; // ??ID????0
  short			sState;		 // ?? 0x00?????0x01?????0x02????
  string		strMottoName;
  short			sIcon;
  long			lGuildID;
  string		strGuildName;
  string		strGuildMotto;
  string		strStallName;
  char*			szName;
  char			chSeeType; // ?????,EEntitySeenType
  char			chGMLv;	   // GM??

  stNetChaSideInfo SSideInfo; // ????
  stNetLookInfo	   SLookInfo;
  stNetPKCtrl	   SPKCtrl;
  stNetEvent	   SEvent;
  stNetAppendLook  SAppendLook;

  char chMainCha; // 0-????,1-???,2-?????

  CCharacter* CreateCha();
  void		  SetValue(CCharacter* pCha);
};

struct stNetNPCShow
{
  BYTE byNpcType;  // ?????
  BYTE byNpcState; // ???NPC,???NPC??

  void SetNpcShow(CCharacter* pCha);

  stNetNPCShow() :
	  byNpcType(0), byNpcState(0){};
};

struct stNetLeanInfo // ??
{
  char chState;

  long lPose;
  long lAngle;
  long lPosX, lPosY;
  long lHeight;

  stNetLeanInfo() :
	  chState(0), lPose(0), lAngle(0), lPosX(0), lPosY(0), lHeight(0){};
};

struct stNetSwitchMap // ???????
{
  short sEnterRet;
  char* szMapName;
  char	chEnterType;
  bool	bIsNewCha;
  bool	bCanTeam; // ?????????

  stNetSwitchMap() :
	  sEnterRet(0), szMapName(NULL), chEnterType(0), bCanTeam(false), bIsNewCha(false){};
};

// ??
struct stNetSysInfo // ??????????????
{
  const char* m_sysinfo; // ??????
  stNetSysInfo() :
	  m_sysinfo(NULL){};
};

struct stNetSay // ?????
{
  unsigned long m_srcid;   // ????ID
  const char*	m_content; // ??

  stNetSay() :
	  m_srcid(0), m_content(NULL){};
};

// ??????
// 1.????????,??????????
// 2.?????????,???????
// 3.??????????,???????
//
//
// ????
// 1.??????????????,??????
//    ??:1.?????????????,?????????????
//         2.?????????????

struct stNetItemCreate // ???????
{
  long	lWorldID;
  long	lHandle;	 // ??????????
  long	lEntityAddr; // ????????
  long	lID;
  Point SPos;
  short sAngle;
  short sNum;		// ????
  char	chAppeType; // ???????CompCommand.h EItemAppearType?
  long	lFromID;	// ????ID????0????????

  stNetEvent SEvent;

  stNetItemCreate() :
	  lWorldID(0), lHandle(0), lEntityAddr(0), lID(0), sAngle(0), sNum(0), chAppeType(0), lFromID(0){};
};

struct stNetItemUnfix // ????
{
  char	chLinkID; // Link?
  short sGridID;  // ?????,?????????,-1,??????,?????,-2,?????
  long	lPosX;	  // ????????
  long	lPosY;

  stNetItemUnfix() :
	  chLinkID(0), sGridID(0), lPosX(0), lPosY(0){};
};

struct stNetItemPick // ?????
{
  long lWorldID;
  long lHandle;
};

struct stNetItemThrow // ?????
{
  short sGridID; // ?????
  long	lNum;	 // ???????
  long	lPosX;	 // ????????
  long	lPosY;
};

struct stNetItemPos // ??????????
{
  short sSrcGridID; // ?????
  short sSrcNum;	// ??????,?????????????
  short sTarGridID; // ?????
};

struct stNetBank // ????
{
  char	chSrcType; // ???? 0???? 1???
  short sSrcID;	   // ?????
  short sSrcNum;   // ?????
  char	chTarType; // ?????
  short sTarID;	   // ?????
};

struct stNetTempKitbag // ????????
{
  short sSrcGridID; // ??????
  short sSrcNum;	// ????
  short sTarGridID; // ????
};

struct stNetUseItem // ????
{
  stNetUseItem() { sTarGridID = -1; }
  short sGridID;	// ?????
  short sTarGridID; // ????????????????
};

struct stNetDelItem // ????
{
  short sGridID; // ?????
};

struct stNetItemInfo // ????
{
  char	chType;
  short sGridID; // ?????
};

struct stTempChangeChaPart
{
  DWORD dwPartID;
  DWORD dwItemID;
};

struct stNetKitbag // ???????
{
  char chBagType;  // 0???? 1???
  char chType;	   // ???????CompCommand.h?ESynKitbagType?
  int  nKeybagNum; // ??????
  struct stGrid
  {
	short	  sGridID; // ??ID
	SItemGrid SGridContent;
  };
  int	 nGridNum; // ??????
  stGrid Grid[defMAX_KBITEM_NUM_PER_TYPE];
};

struct stNetSkillBag // ?????
{
  char					   chType; // ???????CompCommand.h?ESynSkillBagType?
  CSizeArray<SSkillGridEx> SBag;   // ????
};

struct stNetDefaultSkill
{
  short sSkillID;

  void Exec(void);
};

struct stNetSkillState // ??????
{
  char					   chType{}; // ?????????
  CSizeArray<stSkillState> SState;
};

struct stNetChangeCha // ??????
{
  unsigned long ulMainChaID; // ??ID
};

struct stNetActivateEvent
{
  long	lTargetID;
  long	lHandle;
  short sEventID;
};

struct stNetFace // ??????,??enumACTION_FACE
{
  short sPose;
  short sAngle;
};

struct stLookEnergy
{
  short sEnergy[enumEQUIP_NUM];
};

// ??????
typedef struct _NET_FUNCITEM
{
  char szFunc[ROLE_MAXNUM_FUNCITEMSIZE];
} NET_FUNCITEM, *PNET_FUNCITEM;

typedef struct _NET_MISITEM
{
  char szMis[ROLE_MAXNUM_FUNCITEMSIZE];
  BYTE byState;

} NET_MISITEM, *PNET_MISITEM;

typedef struct _NET_FUNCPAGE
{
  char		   szTalk[ROLE_MAXNUM_DESPSIZE];
  NET_FUNCITEM FuncItem[ROLE_MAXNUM_FUNCITEM];
  NET_MISITEM  MisItem[ROLE_MAXNUM_CAPACITY];

} NET_FUNCPAGE, *PNET_FUNCPAGE;

// ??????
typedef struct _NET_MISSIONLIST
{
  BYTE		   byListType;
  BYTE		   byPrev;
  BYTE		   byNext;
  BYTE		   byPrevCmd;
  BYTE		   byNextCmd;
  BYTE		   byItemCount;
  NET_FUNCPAGE FuncPage;

} NET_MISSIONLIST, *PNET_MISSIONLIST;

#define HELPINFO_DESPSIZE 4096

// ????????????
typedef struct _NET_HELPINFO
{
  BYTE byType;
  union
  {
	char   szDesp[HELPINFO_DESPSIZE]; //[ROLE_MAXNUM_DESPSIZE];
	USHORT sID;
  };

} NET_HELPINFO, *PNET_HELPINFO;

// ?????
typedef struct _NET_MISNEED
{
  BYTE byType;
  union
  {
	struct
	{
	  WORD wParam1;
	  WORD wParam2;
	  WORD wParam3;
	};
	char szNeed[ROLE_MAXNUM_NEEDDESPSIZE];
  };

} NET_MISNEED, *PNET_MISNEED;

typedef struct _NET_MISPRIZE
{
  BYTE byType;
  WORD wParam1;
  WORD wParam2;

} NET_MISPRIZE, *PNET_MISPRIZE;

typedef struct _NET_MISPAGE
{
  BYTE		  byNeedNum;
  NET_MISNEED MisNeed[ROLE_MAXNUM_MISNEED];

  BYTE		   byPrizeSelType;
  BYTE		   byPrizeNum;
  NET_MISPRIZE MisPrize[ROLE_MAXNUM_MISPRIZE];

  //
  char szName[ROLE_MAXSIZE_MISNAME];
  char szDesp[ROLE_MAXNUM_DESPSIZE];

} NET_MISPAGE, *PNET_MISPAGE;

typedef struct _NET_MISLOG
{
  BYTE byType;
  BYTE byState;
  WORD wMisID;

} NET_MISLOG, *PNET_MISLOG;

typedef struct _NET_MISLOG_LIST
{
  BYTE		 byNumLog;
  NET_MISLOG MisLog[ROLE_MAXNUM_MISSION];

} NET_MISLOG_LIST, *PNET_MISLOG_LIST;

// ??????
typedef struct _NET_TRADEPAGE
{
  BYTE	 byCount;
  USHORT sItemID[ROLE_MAXNUM_TRADEITEM];
  USHORT sCount[ROLE_MAXNUM_TRADEITEM];
  DWORD	 dwPrice[ROLE_MAXNUM_TRADEITEM];
  BYTE	 byLevel[ROLE_MAXNUM_TRADEITEM];

} NET_TRADEPAGE, *PNET_TRADEPAGE;

typedef struct _NET_TRADEINFO
{
  NET_TRADEPAGE TradePage[mission::MAXTRADE_ITEMTYPE];

  _NET_TRADEINFO()
  {
	Clear();
  }

  void Clear()
  {
	memset(TradePage, 0, sizeof(NET_TRADEPAGE) * mission::MAXTRADE_ITEMTYPE);
  }

} NET_TRADEINFO, *PNETTRADEINFO;

struct NET_CHARTRADE_BOATDATA
{
  char	 szName[BOAT_MAXSIZE_BOATNAME];
  USHORT sBoatID;
  USHORT sLevel;
  DWORD	 dwExp;
  DWORD	 dwHp;
  DWORD	 dwMaxHp;
  DWORD	 dwSp;
  DWORD	 dwMaxSp;
  DWORD	 dwMinAttack;
  DWORD	 dwMaxAttack;
  DWORD	 dwDef;
  DWORD	 dwSpeed;
  DWORD	 dwShootSpeed;
  BYTE	 byHasItem;
  BYTE	 byCapacity;
  DWORD	 dwPrice;
};

// ????????????
typedef struct _NET_CHARTRADE_ITEMDATA
{
  BYTE byForgeLv;
  BYTE byHasAttr;

  short sInstAttr[defITEM_INSTANCE_ATTR_NUM][2]; // ????
  short sEndure[2];								 // ???????/????
  short sEnergy[2];								 // ??????/????

  long lDBParam[enumITEMDBP_MAXNUM]; // ?????
  bool bValid;

} NET_CHARTRADE_ITEMDATA, *PNET_CHARTRADE_ITEMDATA;

// ????????
#define MAX_GUILD_CHALLLEVEL 3 // ???????
typedef struct _NET_GUILD_CHALLINFO
{
  BYTE	byIsLeader;
  BYTE	byLevel[MAX_GUILD_CHALLLEVEL];
  BYTE	byStart[MAX_GUILD_CHALLLEVEL];
  char	szGuild[MAX_GUILD_CHALLLEVEL][64];
  char	szChall[MAX_GUILD_CHALLLEVEL][64];
  DWORD dwMoney[MAX_GUILD_CHALLLEVEL];

} NET_GUILD_CHALLINFO, *PNET_GUILD_CHALLINFO;
struct NetChaBehave
{
  const char* sCharName; //???
  const char* sJob;		 //??
  short		  iDegree;	 //????
  const LOOK* sLook;	 //????
};

struct stNetShortCutChange
{
  char	chIndex;
  char	chType;
  short shyGrid;
};

struct stNetNpcMission
{
  BYTE	 byType; // ??
  USHORT sNum;	 // ?????????
  USHORT sID;	 // ???????ID
  USHORT sCount; // ?????
};

struct stNetAreaState
{
  short			   sAreaX; // ?
  short			   sAreaY;
  char			   chStateNum;
  stAreaSkillState State[AREA_STATE_NUM];
};

struct stNetChaAttr
{
  char	   chType;
  short	   sNum;
  stEffect SEff[MAX_ATTR_CLIENT];
};

struct stNetQueryRelive
{
  char		  chType; // ?CompCommand?EPlayerReliveType
  const char* szSrcChaName;
};

// ???????????
struct stNetOpenHair
{
  void Exec();
};

// ??????
struct stNetUpdateHair
{
  short sScriptID;	 // ???Hair??ID,???0?????????
  short sGridLoc[4]; // ???????
};

// ????????
struct stNetUpdateHairRes
{
  unsigned long ulWorldID; // ????
  int			nScriptID; // ??????ID
  const char*	szReason;  // ??????,?????:ok,?????????fail,?????:????

  void Exec();
};

// ???????????
struct stNetTeamFightAsk
{
  struct
  {
	const char*	   szName;
	const char*	   szJob;
	char		   chLv;
	unsigned short usVictoryNum;
	unsigned short usFightNum;
  } Info[10];
  char chSideNum1;
  char chSideNum2;

  void Exec();
};

struct stNetItemRepairAsk
{
  const char* cszItemName;
  long		  lRepairMoney;

  void Exec();
};

struct stSCNetItemForgeAsk
{
  char chType;
  long lMoney;

  void Exec();
};

struct stNetItemForgeAnswer
{
  long lChaID;
  char chType;
  char chResult;
  void Exec();
};

#define defMAX_FORGE_GROUP_NUM defMAX_ITEM_FORGE_GROUP

struct SForgeCell
{
  SForgeCell() :
	  sCellNum(0), pCell(0) {}
  ~SForgeCell()
  {
	delete[] pCell;
  }

  short sCellNum;
  struct SCell
  {
	short sPosID;
	short sNum;
  }* pCell;
};

struct stNetItemForgeAsk
{
  char		 chType; // 1????2???
  SForgeCell SGroup[defMAX_FORGE_GROUP_NUM];
};

struct stNetEspeItem
{
  char chNum;
  struct
  {
	short sPos;
	short sEndure;
	short sEnergy;
  } SContent[4];
};

// ???????
struct stBlackTrade
{
  short sIndex;	  //
  short sSrcID;	  // ????ID
  short sSrcNum;  // ??????
  short sTarID;	  // ????ID
  short sTarNum;  // ??????
  short sTimeNum; // time?
};

struct stChurchChallenge
{
  short sChurchID;	   // id
  char	szName[32];	   // name
  char	szChaName[32]; // ?????
  short sCount;		   // ??
  long	nBasePrice;	   // ??
  long	nMinbid;	   // ????
  long	nCurPrice;	   // ?????

  stChurchChallenge() { memset(this, 0, sizeof(stChurchChallenge)); }
};

// Add by lark.li 20080807
struct stPersonInfo
{
  char	szMotto[40];		 // ??
  bool	bShowMotto;			 // ??????
  char	szSex[10];			 // ??
  short sAge;				 // ??
  char	szName[50];			 // ??
  char	szAnimalZodiac[50];	 // ??
  char	szBloodType[50];	 // ??
  int	iBirthday;			 // ????
  char	szState[50];		 // ????
  char	szCity[50];			 // ?????
  char	szConstellation[50]; // ??
  char	szCareer[50];		 // ??
  int	iSize;				 // ????([8 * 1024])
  char	pAvatar[8096];		 // ??
  bool	bPprevent;			 // ??????
  int	iSupport;			 // ???
  int	iOppose;			 // ????

  stPersonInfo& operator=(const stPersonInfo& _info)
  {
	//	strcpy(str1,str2) was modified to strncpy_s(str1,str2)
	strncpy_s(szMotto, sizeof(szMotto), _info.szMotto, _TRUNCATE);
	bShowMotto = _info.bShowMotto;
	strncpy_s(szSex, sizeof(szSex), _info.szSex, _TRUNCATE);
	sAge = _info.sAge;
	strncpy_s(szName, sizeof(szName), _info.szName, _TRUNCATE);
	strncpy_s(szAnimalZodiac, sizeof(szAnimalZodiac), _info.szAnimalZodiac, _TRUNCATE);
	strncpy_s(szBloodType, sizeof(szBloodType), _info.szBloodType, _TRUNCATE);
	iBirthday = _info.iBirthday;
	strncpy_s(szState, sizeof(szState), _info.szState, _TRUNCATE);
	strncpy_s(szCity, sizeof(szCity), _info.szCity, _TRUNCATE);
	strncpy_s(szConstellation, sizeof(szConstellation), _info.szConstellation, _TRUNCATE);
	strncpy_s(szCareer, sizeof(szCareer), _info.szCareer, _TRUNCATE);
	iSize = _info.iSize;
	strncpy_s(pAvatar, sizeof(pAvatar), _info.pAvatar, _TRUNCATE);
	bPprevent = _info.bPprevent;
	iSupport  = _info.iSupport;
	iOppose	  = _info.iOppose;
	return *this;
  }
  stPersonInfo()
  {
	memset(this, 0, sizeof(stPersonInfo));
	/*memset(szMotto, 0, sizeof(szMotto));
		bShowMotto = false;
		memset(szSex, 0, sizeof(szSex);
		sAge = 0;
		memset(szName, 0, sizeof(szName));
		memset(szAnimalZodiac, 0, sizeof(szAnimalZodiac));
		memset(szBloodType, 0, sizeof(szBloodType));
		memset(szBirthday, 0, sizeof(szBirthday));
		memset(szState, 0, sizeof(szState));
		memset(szCity, 0, sizeof(szCity));
		memset(szConstellation, 0, sizeof(szConstellation));
		memset(szCareer, 0, sizeof(szCareer));
		iSize = 0;
		memset(szAvatar, 0, sizeof(szAvatar));
		bPprevent = false;
		iSupport = 0;
		iOppose = 0;*/
  }
};

struct stQueryPersonInfo
{
  char sChaName[64];		// ??
  bool bHavePic;			// ??????
  char cSex[4];				// ??	  1?? 0???
  int  nMinAge[2];			// ?????m_nMinAge[1]???m_nMinAge[0]???
  char szAnimalZodiac[4];	// ??
  int  iBirthday[2];		// ??????m_nBirth[1]???m_nBirth[0]???
							// 0xffff0000&month   0xffff&day
  char szState[32];			// ??
  char szCity[32];			// ??
  char szConstellation[16]; // ??
  char szCareer[32];		// ??
  int  nPageItemNum;		// ???????
  int  nCurPage;			// ????

  stQueryPersonInfo()
  {
	memset(this, 0, sizeof(stQueryPersonInfo));
  }

  stQueryPersonInfo& operator=(const stQueryPersonInfo& _info)
  {
	//	strcpy was modified to strncpy_s
	strncpy_s(sChaName, sizeof(sChaName), _info.sChaName, _TRUNCATE);
	bHavePic = _info.bHavePic;
	strncpy_s(cSex, sizeof(cSex), _info.cSex, _TRUNCATE);
	nMinAge[0] = _info.nMinAge[0];
	nMinAge[1] = _info.nMinAge[1];
	strncpy_s(szAnimalZodiac, sizeof(szAnimalZodiac), _info.szAnimalZodiac, _TRUNCATE);
	iBirthday[0] = _info.iBirthday[0];
	iBirthday[1] = _info.iBirthday[1];
	strncpy_s(szState, sizeof(szState), _info.szState, _TRUNCATE);
	strncpy_s(szCity, sizeof(szCity), _info.szCity, _TRUNCATE);
	strncpy_s(szConstellation, sizeof(szConstellation), _info.szConstellation, _TRUNCATE);
	strncpy_s(szCareer, sizeof(szCareer), _info.szCareer, _TRUNCATE);
	nCurPage = _info.nCurPage;
	return *this;
  }
};
struct stQueryResoultPersonInfo
{
  char sChaName[64];  // ??
  int  nMinAge;		  // ??
  char cSex[4];		  // ??	  1?? 0???
  char szState[32];	  // ??
  char nCity[32];	  // ??
  char pAvatar[8096]; // ????

  stQueryResoultPersonInfo()
  {
	memset(this, 0, sizeof(stQueryResoultPersonInfo));
  }

  stQueryResoultPersonInfo& operator=(const stQueryResoultPersonInfo& _info)
  {
	//	strcpy was modified to strncpy_s for safe
	strncpy_s(sChaName, sizeof(sChaName), _info.sChaName, _TRUNCATE);
	nMinAge = _info.nMinAge;
	strncpy_s(cSex, sizeof(cSex), _info.cSex, _TRUNCATE);
	strncpy_s(szState, sizeof(szState), _info.szState, _TRUNCATE);
	strncpy_s(nCity, sizeof(nCity), _info.nCity, _TRUNCATE);
	strncpy_s(pAvatar, sizeof(pAvatar), _info.pAvatar, _TRUNCATE);
	return *this;
  }
};

// End

extern void NetLoginSuccess(char byPassword, char iCharNum, NetChaBehave chabehave[]); //??Key//????//????
extern void NetLoginFailure(unsigned short Errno);									   //??????
extern void NetBeginPlay(unsigned short Errno);
extern void NetEndPlay(char iCharNum, NetChaBehave chabehave[]);
extern void NetNewCha(unsigned short Errno);
extern void NetDelCha(unsigned short Errno);
extern void NetCreatePassword2(unsigned short Errno);
extern void NetUpdatePassword2(unsigned short Errno);

extern void		   NetActorDestroy(unsigned int nID, char chSeeType);
extern void		   NetActorMove(unsigned int nID, stNetNotiMove& list);
extern void		   NetActorSkillRep(unsigned int nID, stNetNotiSkillRepresent& skill);
extern void		   NetActorSkillEff(unsigned int nID, stNetNotiSkillEffect& skill);
extern void		   NetActorLean(unsigned int nID, stNetLeanInfo& lean);
extern void		   NetSwitchMap(stNetSwitchMap& switchmap);
extern void		   NetSysInfo(stNetSysInfo& sysinfo);
extern void		   NetSideInfo(const char szName[], const char szInfo[]);
extern void		   NetBickerInfo(const char szData[]);
extern void		   NetSay(stNetSay& netsay);
extern CSceneItem* NetCreateItem(stNetItemCreate& pSCreateInfo);
extern void		   NetItemDisappear(unsigned int nID);
extern void		   NetChangeChaPart(CCharacter* pCha, stNetLookInfo& SLookInfo);
extern void		   NetChangeChaPart(unsigned int nID, stNetLookInfo& SLookInfo);
extern void		   NetTempChangeChaPart(unsigned int nID, stTempChangeChaPart& SPart);
extern void		   NetActorChangeCha(unsigned int nID, stNetChangeCha& SChangeCha);
extern void		   NetShowTalk(const char szTalk[], BYTE byCmd, DWORD dwNpcID);
extern void		   NetShowHelp(const NET_HELPINFO& Info);
extern void		   NetShowMapCrash(const char szTalk[]);
extern void		   NetShowFunction(BYTE byFuncPage, BYTE byItemNum, BYTE byMisNum, const NET_FUNCPAGE& FuncArray, DWORD dwNpcID);
extern void		   NetShowMissionList(DWORD dwNpcID, const NET_MISSIONLIST& MisList);
extern void		   NetShowMisPage(DWORD dwNpcID, BYTE byCmd, const NET_MISPAGE& page);
extern void		   NetMisLogList(NET_MISLOG_LIST& List);
extern void		   NetShowMisLog(WORD wMisID, const NET_MISPAGE& page);
extern void		   NetMisLogClear(WORD wMisID);
extern void		   NetMisLogAdd(WORD wMisID, BYTE byState);
extern void		   NetMisLogState(WORD wID, BYTE byState);
extern void		   NetCloseTalk(DWORD dwNpcID);
extern void		   NetCreateBoat(const xShipBuildInfo& Info);
extern void		   NetUpdateBoat(const xShipBuildInfo& Info);
extern void		   NetBoatInfo(DWORD dwBoatID, const char szName[], const xShipBuildInfo& Info);
extern void		   NetShowBoatList(DWORD dwNpcID, BYTE byNumBoat, const BOAT_BERTH_DATA& Data, BYTE byType = mission::BERTH_LUANCH_LIST);
extern void		   NetChangeChaLookEnergy(unsigned int nID, stLookEnergy& SLookEnergy);
extern void		   NetQueryRelive(unsigned int nID, stNetQueryRelive& SQueryRelive);
extern void		   NetPreMoveTime(unsigned long ulTime);
extern void		   NetMapMask(unsigned int nID, BYTE* pMask, long lLen);

// ??npc??????
extern void NetShowTrade(const NET_TRADEINFO& TradeInfo, BYTE byCmd, DWORD dwNpcID, DWORD dwParam);
extern void NetUpdateTradeAllData(const NET_TRADEINFO& TradeInfo, BYTE byCmd, DWORD dwNpcID, DWORD dwParam);
extern void NetUpdateTradeData(DWORD dwNpcID, BYTE byPage, BYTE byIndex, USHORT sItemID, USHORT sCount, DWORD dwPrice);

// ?npc????
extern void NetTradeResult(BYTE byCmd, BYTE byIndex, BYTE byCount, USHORT sItemID, DWORD dwMoney);

// ????????
extern void NetShowCharTradeRequest(BYTE byType, DWORD dwRequestID);

// ????????
extern void NetShowCharTradeInfo(BYTE byType, DWORD dwAcceptID, DWORD dwRequestID);

// ??????
extern void NetCancelCharTrade(DWORD dwCharID);

// ????????????
extern void NetValidateTradeData(DWORD dwCharID);

// ????????
extern void NetValidateTrade(DWORD dwCharID);

// ????????????
extern void NetTradeAddBoat(DWORD dwCharID, BYTE byOpType, USHORT sItemID, BYTE byIndex,
							BYTE byCount, BYTE byItemIndex, const NET_CHARTRADE_BOATDATA& Data);

// ????????
extern void NetTradeAddItem(DWORD dwCharID, BYTE byOpType, USHORT sItemID, BYTE byIndex,
							BYTE byCount, BYTE byItemIndex, const NET_CHARTRADE_ITEMDATA& Data);

// ????????????
extern void NetTradeShowMoney(DWORD dwCharID, DWORD dwMoney);

// ??????
extern void NetTradeSuccess();
extern void NetTradeFailed();

// ??
extern void NetStallInfo(DWORD dwCharID, BYTE byNum, const char szName[]);
extern void NetStallAddBoat(BYTE byGrid, USHORT sItemID, BYTE byCount, DWORD dwMoney, NET_CHARTRADE_BOATDATA& Data);
extern void NetStallAddItem(BYTE byGrid, USHORT sItemID, BYTE byCount, DWORD dwMoney, NET_CHARTRADE_ITEMDATA& Data);
extern void NetStallDelGoods(DWORD dwCharID, BYTE byGrid, BYTE byCount);
extern void NetStallClose(DWORD dwCharID);
extern void NetStallSuccess(DWORD dwCharID);
extern void NetStallName(DWORD dwCharID, const char* szStallName);
extern void NetStartExit(DWORD dwExitTime);
extern void NetCancelExit();
extern void NetSynAttr(DWORD dwWorldID, char chType, short sNum, stEffect* pEffect);
extern void NetFace(DWORD dwCharID, stNetFace& netface, char chType);
extern void NetChangeKitbag(DWORD dwChaID, stNetKitbag& SKitbag);
extern void NetNpcStateChange(DWORD dwChaID, BYTE byState);
extern void NetEntityStateChange(DWORD dwEntityID, BYTE byState);
extern void NetShortCut(DWORD dwChaID, stNetShortCut& stShortCut);
extern void NetTriggerAction(stNetNpcMission& info);
extern void NetShowForge();
extern void NetShowUnite();
extern void NetShowMilling();
extern void NetShowFusion();
extern void NetShowUpgrade();
extern void NetShowEidolonMetempsychosis();
extern void NetShowEidolonFusion();
extern void NetShowPurify();
extern void NetShowGetStone();
extern void NetShowRepairOven();
extern void NetShowEnergy();
extern void NetShowTiger();

extern void NetSynSkillBag(DWORD dwCharID, stNetSkillBag* pSSkillBag);
extern void NetSynSkillState(DWORD dwCharID, stNetSkillState* pSSkillState);
extern void NetAreaStateBeginSee(stNetAreaState* pState);
extern void NetAreaStateEndSee(stNetAreaState* pState);
extern void NetFailedAction(char chState);
extern void NetShowMessage(long lMes);
extern void NetChaTLeaderID(long lID, long lLeaderID);
extern void NetChaEmotion(long lID, short sEmotion);

extern void NetChaSideInfo(long lID, stNetChaSideInfo& SNetSideInfo);
extern void NetBeginRepairItem(void);

extern void NetItemUseSuccess(unsigned int nID, short sItemID);
extern void NetKitbagCapacity(unsigned int nID, short sKbCap);
extern void NetEspeItem(unsigned int nID, stNetEspeItem& SEspeItem);

extern void NetKitbagCheckAnswer(bool bLock);
extern void NetChaPlayEffect(unsigned int uiWorldID, int nEffectID);

extern void NetChurchChallenge(const stChurchChallenge* pInfo);

extern void NetClose(); //????????? by Waiting 2009-06-18