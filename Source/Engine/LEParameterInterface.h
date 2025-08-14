#ifndef LEParameterInterface_H
#define LEParameterInterface_H

#include "LEEffPrerequisites.h"

/// ���õĲ����б�
enum LEParameterType
{
	PT_BOOL,
	PT_REAL,
	PT_INT,
	PT_UNSIGNED_INT,
	PT_SHORT,
	PT_UNSIGNED_SHORT,
	PT_LONG,
	PT_UNSIGNED_LONG,
	PT_STRING,
	PT_VECTOR3,
	PT_MATRIX3,
	PT_MATRIX4,
	PT_QUATERNION,
	PT_COLOURVALUE
};

/// ��������,����֧��LEParameterInteface�ķ������
class LIGHTENGINE_API LEParameterDef
{
public:
	String name;
	String description;
	LEParameterType paramType;
	LEParameterDef(const String& newName, const String& newDescription, LEParameterType newType)
		: name(newName), description(newDescription), paramType(newType) {}
};
typedef std::vector<LEParameterDef> LEParameterList;

/** ��������õ�/���ò����ĳ�����.*/
class LIGHTENGINE_API LEParamCommand
{
public:
	virtual String doGet(const void* target) const = 0;
	virtual void doSet(void* target, const String& val) = 0;

	virtual ~LEParamCommand() { }
};
typedef std::map<String, LEParamCommand* > ParamCommandMap;

class LIGHTENGINE_API LEParamDictionary
{
	friend class LEParameterInterface;
protected:
	/// ��������
	LEParameterList m_ParamDefs;

	/// ����get/set�Ĳ�������
	ParamCommandMap m_ParamCommands;

	/** �������������Ĳ�������. */
	LEParamCommand* getParamCommand(const String& name)
	{
		ParamCommandMap::iterator i = m_ParamCommands.find(name);
		if (i != m_ParamCommands.end())
		{
			return i->second;
		}
		else
		{
			return 0;
		}
	}

	const LEParamCommand* getParamCommand(const String& name) const
	{
		ParamCommandMap::const_iterator i = m_ParamCommands.find(name);
		if (i != m_ParamCommands.end())
		{
			return i->second;
		}
		else
		{
			return 0;
		}
	}
public:
	LEParamDictionary()  {}

	/** ���������Ĳ�������. 
	@param paramDef ������LEParameterDef����
	@param paramCmd ������������������ָ�����ڴ���getting/setting.
	NB: ����಻�������ָ��

	*/
	void addParameter(const LEParameterDef& paramDef, LEParamCommand* paramCmd)
	{
		m_ParamDefs.push_back(paramDef);
		m_ParamCommands[paramDef.name] = paramCmd;
	}

	const LEParameterList& getParameters(void) const
	{
		return m_ParamDefs;
	}
};

typedef std::map<String, LEParamDictionary> LEParamDictionaryMap;

/** ����ʹ�÷����������Զ�������Ĺ����ӿ�.
@remarks
	����ౣ���˹�����ʹ�õ��ྲ̬����-����map�ֵ䡣����ϸ����鿴LEParamDictionary. 
@remarks
	Ҫʹ������࣬ÿ����������ڹ��캯���е���createParamDictionary������
	���Ǹ���Ĳ����ֵ�.
*/
class LIGHTENGINE_API LEParameterInterface
{
public:

	virtual ~StringInterface() {}

	LEParamDictionary* getParamDictionary(void)
	{
		LEParamDictionaryMap::iterator i = m_sDictionary.find(m_ParamDictName);
		if (i != m_sDictionary.end())
		{
			return &(i->second);
		}
		else
		{
			return 0;
		}
	}

	const LEParamDictionary* getParamDictionary(void) const
	{
		LEParamDictionaryMap::const_iterator i = m_sDictionary.find(m_ParamDictName);
		if (i != m_sDictionary.end())
		{
			return &(i->second);
		}
		else
		{
			return 0;
		}
	}

	const LEParameterList& getParameters(void) const;

	virtual bool setParameter(const String& name, const String& value);
	
	virtual void setParameterList(const NameValuePairList& paramList);

	virtual String getParameter(const String& name) const
	{
		// �õ��ֵ�
		const LEParamDictionary* dict = getParamDictionary();

		if (dict)
		{
			// ���Ҳ�������
			const LEParamCommand* cmd = dict->getParamCommand(name);

			if (cmd)
			{
				return cmd->doGet(this);
			}
		}

		// ʧ��
		return "";
	}

	virtual void copyParametersTo(LEParameterInterface* dest) const
	{
		// �õ��ֵ�
		const LEParamDictionary* dict = getParamDictionary();

		if (dict)
		{
			// �����Լ��Ĳ���
			ParameterList::const_iterator i;

			for (i = dict->mParamDefs.begin(); 
				i != dict->mParamDefs.end(); ++i)
			{
				dest->setParameter(i->name, getParameter(i->name));
			}
		}


	}

	static void cleanupDictionary () ;

protected:
	/** �ڲ��������ڴ�����Ĳ����ֵ�.
	@remarks
		������������������Ĳ����ֵ�,����������򴴽�һ��.NB:������
	���������(RTTIû��ʹ��)
	@param
	className ����(�ֵ���)
	@returns
		true ����ֵ䱻����, false ����ֵ��Ѿ�����
	*/
	bool createParamDictionary(const String& className)
	{
		m_ParamDictName = className;
		if (m_sDictionary.find(className) == m_sDictionary.end())
		{
			m_sDictionary[className] = ParamDictionary();
			return true;
		}
		return false;

	}

protected:

	/// �����ֵ�
	static LEParamDictionaryMap m_sDictionary;
	/// ���ڲ��ҵ����� (�����������ʼ��)
	String m_ParamDictName;

};

#endif