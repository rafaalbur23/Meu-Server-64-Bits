#ifndef LEParticleAffector_H
#define LEParticleAffector_H

#include "LightEngineAPI.h"

class LEParticleSystem;
class LEParticle;

/** ʵ������Ӱ�����ӽӿڳ�����.
@remarks
����Ӱ��������������ϵͳ�������ӵ����������޸����ӡ����Ǵ����
���ͣ����确����vector force����Ӱ�����ӣ���˥������fader����Ӱ�����ӣ�ÿ
�������Բ�ͬ�ķ�ʽ���޸����ӣ�ʹ�ò�ͬ�Ĳ�����
@par
��Ϊ�����ʹ�úܶ����͵�Ӱ�����ӣ�����û�й涨��Щ�������ӡ���
�ṩ��һЩ���ڵ����ӣ�����Ҳ��������Ӧ�ó�����չӰ�����ӡ������
ͨ������ParticleAffector������������չ����Ҫ�ķ�����Ϊ����Ȼͬʱ��Ҫ
����ParticleAffectorFactory�������������������Ӱ�����ӵĶ�������
ParticleSystemManager����addAffectorFactoryע���������,�����Ϳ����ڴ�
���ű��ļ���ͨ�����ִ�������µ�Ӱ������
@par
���ӷ�����Ҳ������ͬ�ķ�ʽ.�ڴ���������Чʱ,��������ϵͳ�кܴ�
����չ��,���������������Ӱ���������ͺ����ǵĲ���.
*/
class LIGHTENGINE_API LEParticleAffector
{
public:
	LEParticleAffector(LEParticleSystem* mParticleSystem): m_ParticleSystem(mParticleSystem) {}

	virtual ~LEParticleAffector();

	/** ��Ӱ�����ӳ�ʼ�������´���������
	@remarks
	������Ӱ�������л��Ὣ������Ч��ʼ������.����ϣ����ʼ��һЩ
	����������,������Ӱ�����ӱ���
	@param
	pParticle ��Ҫ��ʼ�����ӵ�ָ��.
	*/
	virtual void _initParticle(LEParticle* pParticle) { /* by default do nothing */ }

	/** ����Ӱ�����ӵ��������������л������
	@remarks
	����ʹӰ�������л��Ὣ���ǵ��������õ�ϵͳ�е�����.Ӱ������
	ϣ�������ǵ���Ч���õ�һЩ����������,��Щ�����������ӵķ���
	@param
	pSystem �����õ�����ϵͳ��ָ��.
	@param
	timeElapsed ���ϴε��õ�����������ʱ��(��).
	*/
	virtual void _affectParticles(LEParticleSystem* pSystem, float timeElapsed) = 0;

	/** ����Ӱ�����ӵ�����. 
	@remarks
	�������������Ӱ�����ӵ�����,���������ͨ���������������Ӱ
	������
	*/
	const String &getType(void) const { return m_Type; }
protected:
	/** �ڲ���������Ϊ�������û�����������
	@remarks
	��ΪStringInterface����ÿ����Ĳ����ֵ�,������Ҫ������������
	����Ҳ�����Ĳ������뵽�ֵ���.��Ҫ�ڹ��캯�����������,��Ϊ����
	�����������麯������,��û���麯����������
	@par
	��������ڵ����������֮ǰ���������Լ���createParamDictionary
	����
	*/
	void addBaseParameters(void) { /* ʵ����û�����κ��� - �������ܻ���һЩ�� */ }

protected:
	/// ����Ӱ�����ӵ�����, �����������ʼ��
	string m_Type;

	LEParticleSystem* m_ParticleSystem;

};
#endif