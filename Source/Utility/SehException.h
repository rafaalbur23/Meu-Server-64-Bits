#ifndef __SEH_EXCEPTION_H
#define __SEH_EXCEPTION_H
#include <windows.h>
#include <string>
using namespace std;
////////////////////////////////////////////////////////////////////////////////
class SehExceptionBase : public std::exception
{
  // ��ʼ������
  public:
  static void InitializeSehTranslator();

};


#endif