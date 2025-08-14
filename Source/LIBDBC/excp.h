#pragma once

#include <exception>
#include <stdexcept>
#include <string>

class excpSync : public std::runtime_error
{
  public:
  excpSync(const char* message) :
	  std::runtime_error(message){};
};

class excpMem : public std::runtime_error
{
  public:
  excpMem(const char* message) :
	  std::runtime_error(message){};
};

class excpThrd : public std::runtime_error
{
  public:
  excpThrd(const char* message) :
	  std::runtime_error(message){};
};

class excpIniF : public std::runtime_error
{
  public:
  excpIniF(const char* message) :
	  std::runtime_error(message){};

  excpIniF(std::string const& message) :
	  std::runtime_error(message){};
};

class excpFile : public std::runtime_error
{
  public:
  excpFile(const char* message) :
	  std::runtime_error(message){};

  excpFile(std::string const& message) :
	  std::runtime_error(message){};
};






//------------------------------------------------------------------------------------------------------------------
//common exception define
//class excp:public std::exception			//���쳣��
//{
//public:
//	excp(cChar * desc):std::exception((_mPtr=new char[strlen(desc)+1])?strcpy(_mPtr,desc):""){}
//	excp(excp &e):std::exception(_mPtr=e._mPtr){e.setZero();}
//	virtual ~excp(){delete[]_mPtr;}
//	virtual cChar *what() const{return _mPtr;}
//private:
//	excp &operator=(excp &e){
//		delete[]_mPtr;
//		exception::operator =(e);
//		_mPtr=e._mPtr;
//		e.setZero();
//		return *this;
//	};
//	void setZero(){exception::operator=(exception());_mPtr =0;}
//
//	char *_mPtr;
//};
//------------------------------------------------------------------------------------------------------------------
//class excpMem:public excp				//�ڴ������ͷ��쳣
//{
//public:
//	excpMem(cChar * desc):excp(desc){};
//};
//------------------------------------------------------------------------------------------------------------------
//class excpArr:public excp				//����Խ�������������ش����쳣
//{
//public:
//	excpArr(cChar * desc):excp(desc){};
//};
//------------------------------------------------------------------------------------------------------------------
//class excpSync:public excp				//����ϵͳͬ����������쳣
//{
//public:
//	excpSync(cChar * desc):excp(desc){};
//};
//------------------------------------------------------------------------------------------------------------------
//class excpThrd:public excp				//����ϵͳ�̲߳����쳣
//{
//public:
//	excpThrd(cChar * desc):excp(desc){};
//};
//class excpSock:public excp				//����ϵͳ�̲߳����쳣
//{
//public:
//	excpSock(cChar * desc):excp(desc){};
//};
////------------------------------------------------------------------------------------------------------------------
//class excpCOM:public excp				//COM�����쳣
//{
//public:
//	excpCOM(cChar * desc):excp(desc){};
//};
////------------------------------------------------------------------------------------------------------------------
//class excpDB:public excp				//���ݿ�����쳣
//{
//public:
//	excpDB(cChar * desc):excp(desc){};
//};
////------------------------------------------------------------------------------------------------------------------
//class excpIniF:public excp				//�ļ������쳣
//{
//public:
//	excpIniF(cChar * desc):excp(desc){};
//};
////------------------------------------------------------------------------------------------------------------------
//class excpFile:public excp				//�ļ������쳣
//{
//public:
//	excpFile(cChar * desc):excp(desc){};
//};
////------------------------------------------------------------------------------------------------------------------
//class excpXML:public excp				//�ļ������쳣
//{
//public:
//	excpXML(cChar * desc):excp(desc){};
//};



