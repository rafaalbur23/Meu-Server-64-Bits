#pragma once

#include "TableData.h"

#define PORTAL_MAP_NAME_SIZE		64		
#define OPEN_PORTAL_MAX				24		

class CMapTimeInfo : public CRawDataInfo
{
public:    
	CMapTimeInfo()
		:nDuration(0),MapDuration(0)
	{
		memset( szPortalMapName, 0, sizeof(szPortalMapName) );
		memset( szPortalLocation, 0, sizeof(szPortalLocation) );
		memset( nPortalHour, 0, sizeof(nPortalHour) );
		
	}

    char 	szPortalMapName[PORTAL_MAP_NAME_SIZE];
    char 	szPortalLocation[PORTAL_MAP_NAME_SIZE];
	int		nPortalHour[OPEN_PORTAL_MAX];
	int		nDuration;						// Duration
	int		MapDuration;					// Map Duration
	

};


class CMapTimerSet : public CRawDataSet
{
public:	
	static CMapTimerSet* I() { return _Instance; }
	
	CMapTimerSet(int nIDStart, int nIDCnt)
	:CRawDataSet(nIDStart, nIDCnt)
	{
		_Instance = this;
		_Init();
	}

protected:

	static CMapTimerSet* _Instance; // 相当于单键, 把自己记住
   
	virtual CRawDataInfo* _CreateRawDataArray(int nCnt)
	{
       return new CMapTimeInfo[nCnt];
	}
	
	virtual void _DeleteRawDataArray()
	{
		delete[] (CMapTimeInfo*)_RawDataArray;
	}
	
	virtual int _GetRawDataInfoSize()
	{
		return sizeof(CMapTimeInfo);
	}

	virtual void*	_CreateNewRawData(CRawDataInfo *pInfo)
	{
		return NULL;
	}

	virtual void  _DeleteRawData(CRawDataInfo *pInfo)
	{
		SAFE_DELETE(pInfo->pData);
	}
	
	virtual BOOL _ReadRawDataInfo(CRawDataInfo *pRawDataInfo, std::vector<std::string> &ParamList)
	{   
       CMapTimeInfo *pInfo = (CMapTimeInfo*)pRawDataInfo;

		int n, m=0;
		std::string strList[OPEN_PORTAL_MAX], strLine;

        _tcsncpy(pInfo->szPortalMapName, pInfo->szDataName, PORTAL_MAP_NAME_SIZE);
		pInfo->szPortalMapName[PORTAL_MAP_NAME_SIZE - 1] = _TEXT('\0');
		
        
		strncpy( pInfo->szPortalLocation, ParamList[m++].c_str(), sizeof(pInfo->szPortalLocation) );

		strLine = ParamList[m++];
		n = Util_ResolveTextLine(strLine.c_str(), strList, OPEN_PORTAL_MAX, ',');
		n = n > OPEN_PORTAL_MAX ? OPEN_PORTAL_MAX : n;
		for( int i=0; i<n; i++ )
			pInfo->nPortalHour[i] = Str2Int( strList[i] );

        pInfo->nDuration = Str2Int(ParamList[m++]);

		pInfo->MapDuration = Str2Int(ParamList[m++]);

		
        return TRUE;
    }
};

inline CMapTimeInfo* GetMapTimerInfo(int nTypeID)
{
	return (CMapTimeInfo*)CMapTimerSet::I()->GetRawDataInfo(nTypeID);
}


