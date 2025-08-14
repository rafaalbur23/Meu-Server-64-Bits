#ifndef LEParticleAffectorFactory_H
#define LEParticleAffectorFactory_H

#include "LEEffPrerequisites.h"

class LIGHTENGINE_API LEParticleAffectorFactory
{
protected:
	std::vector<LEParticleAffector*> m_Affectors;
public:
	LEParticleAffectorFactory() {};
	virtual ~LEParticleAffectorFactory();
	/** ���ع���������, ������ֱ�ʶ�������������������Ӱ�����ӵ����� */
	virtual string getName() const = 0;

	/** ����һ���µ�Ӱ�����Ӷ���.*/
	virtual LEParticleAffector* createAffector(LEParticleSystem* psys) = 0;

	/** ����Ӱ�����Ӷ���. */
	virtual void destroyAffector(LEParticleAffector* e);
};
#endif