#pragma once

#include <utility>
#include <vector>
#include <map>
#include <fstream>

using namespace std;

class PrivilegeCheck
{
private:
	PrivilegeCheck(void);
public:
	~PrivilegeCheck(void);

public:
	static PrivilegeCheck* Instance();	// Ψһʵ��
	bool	Init(const char* configFileName);
	bool	HasPrivilege(int level, const char* command, const char* accountName = "", const char* ip = "");
private:
	typedef vector<string> CommandV;			// ��������
	typedef map<int, CommandV> PrivilegeMap;	// Ȩ�޼���

	typedef CommandV::iterator CommandIt;		// ����
	typedef PrivilegeMap::iterator PrivilegeIt;	// Ȩ��

	static PrivilegeCheck* _instance;
	PrivilegeMap m_mapPrivilege;
};
