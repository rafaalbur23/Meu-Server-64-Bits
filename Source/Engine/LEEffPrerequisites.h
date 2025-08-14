#ifndef LEEffPrerequisites_H
#define LEEffPrerequisites_H

//=============================================================================
// ͷ�ļ�
//=============================================================================
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <cstring>
#include <cstdarg>
#include <cmath>

// STL ����
#include <vector>
#include <map>
#include <string>
#include <set>
#include <list>
#include <deque>
#include <queue>

// STL algorithms & functions
#include <algorithm>
#include <functional>
#include <limits>

// C++ Stream stuff
#include <fstream>
#include <iostream>
#include <iomanip>
#include <sstream>

#include "LightEngineAPI.h"

//=============================================================================
// ���Ͷ���
//=============================================================================
typedef unsigned char uchar;
typedef unsigned short ushort;
typedef unsigned int uint;  
typedef unsigned long ulong;  
typedef std::string String;


//=============================================================================
// ���߳�
//=============================================================================
#define LE_AUTO_MUTEX_NAME mpMutex
#if LE_THREAD_SUPPORT
#define LE_AUTO_MUTEX mutable boost::recursive_mutex LE_AUTO_MUTEX_NAME;
#define LE_LOCK_AUTO_MUTEX boost::recursive_mutex::scoped_lock mpAutoMutexLock(LE_AUTO_MUTEX_NAME);
#define LE_MUTEX(name) mutable boost::recursive_mutex name;
#define LE_LOCK_MUTEX(name) boost::recursive_mutex::scoped_lock mpNameLock(name);
// ��LE_AUTO_MUTEX���ƣ���mpMutex��ָ�����
#define LE_AUTO_SHARED_MUTEX mutable boost::recursive_mutex *LE_AUTO_MUTEX_NAME;
#define LE_LOCK_AUTO_SHARED_MUTEX boost::recursive_mutex::scoped_lock mpAutoMutexLock(*OGRE_AUTO_MUTEX_NAME);
#define LE_NEW_AUTO_SHARED_MUTEX LE_AUTO_MUTEX_NAME = new boost::recursive_mutex();
#define LE_DELETE_AUTO_SHARED_MUTEX delete LE_AUTO_MUTEX_NAME;
#define LE_COPY_AUTO_SHARED_MUTEX(from) LE_AUTO_MUTEX_NAME = from;
#else
#define LE_AUTO_MUTEX 
#define LE_LOCK_AUTO_MUTEX 
#define LE_MUTEX(name)
#define LE_LOCK_MUTEX(name)
#define LE_AUTO_SHARED_MUTEX 
#define LE_LOCK_AUTO_SHARED_MUTEX
#define LE_NEW_AUTO_SHARED_MUTEX 
#define LE_DELETE_AUTO_SHARED_MUTEX 
#define LE_COPY_AUTO_SHARED_MUTEX(from) 
#endif

//=============================================================================
// ǰ������
//=============================================================================
class LEColorValue;
class LEEffectMath;
class LEEffQuaternion;
class LEEffVector3;
class LEParticle;
class LEParticleVisualData;
class LEParticleAffector;
class LEParticleAffectorFactory;
class LEParticleEmitter;
class LEParticleEmitterFactory;
class LEParticleSystem;
class LEParticleSystemManager;
class LEParticleSystemRenderer;
class LEParticleSystemRendererFactory;
class LERenderQueue;
class LEMaterialPtr;
class LECamera;
class LENode;
class LEStringUtil;
template <class T> class LEMapIterator;
class LEScriptLoader;
class LEParameterInterface;

#endif