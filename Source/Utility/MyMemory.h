//=============================================================================
// FileName: MyMemory.h
// Creater: Waiting
// Date: 2009.06.18
//=============================================================================
#ifndef __MY_MEMORY_H
#define __MY_MEMORY_H

#include <windows.h>
#include <tchar.h>
#include "MyAlloc.h"

#ifdef __cplusplus
#ifdef __MEM_DEBUG__
/*--------------------------------------------------------------------------------------------------------------
  ����ȫ�� new, ������Ȼ��Щ�ط�û�е��õ�����, �����Щ���������ע��,�뷨���������ͷ�ļ�,������ȷ���Ƿ����
--------------------------------------------------------------------------------------------------------------*/
inline void * __cdecl operator new(size_t size, const char *file, int line) 
{
	void *ptr = (void *)malloc(size); 
	AddTrack(ptr, size, file, line); 
	return(ptr); 
}; 
inline void __cdecl operator delete(void* p, LPCSTR /* lpszFileName */, int /* nLine */)
{
	RemoveTrack(p); 
	free(p);
}; 

inline void __cdecl operator delete[](void* p, LPCSTR /* lpszFileName */, int /* nLine */)
{
	RemoveTrack(p); 
	free(p);
}; 

inline void __cdecl operator delete(void* p)
{
	::operator delete(p,__FILE__,__LINE__);
}

inline void __cdecl operator delete[](void* p)
{
	::operator delete(p,__FILE__,__LINE__);
}

#define DEBUG_NEW new(__FILE__, __LINE__) 
//----------------------------------------
#else//!__MEM_DEBUG__ -> Release Ver.
#define DEBUG_NEW new
#endif//Release
//----------------------------------------
#define new		DEBUG_NEW 
#endif  /* __cplusplus */

/*--------------------------------------------------------------------------------------------------------------
            ��ʼ���ڴ����
--------------------------------------------------------------------------------------------------------------*/
extern void InitMemoryCheck();
/*--------------------------------------------------------------------------------------------------------------
            �����ڴ����,����ʼ���δ�ͷŵ��ڴ�
            ������̡�DLL��Ҫ�ֱ����
--------------------------------------------------------------------------------------------------------------*/
extern void EndMemoryCheck();
/*--------------------------------------------------------------------------------------------------------------
            ��ʽ���������, ʹ��ǧ�ֺ�, ���ڴ�ӡ�ڴ���
--------------------------------------------------------------------------------------------------------------*/
extern void FormatDollorString(char* szBuf, size_t dwBufSize, size_t dwDollor);

#endif//__MY_MEMORY_H