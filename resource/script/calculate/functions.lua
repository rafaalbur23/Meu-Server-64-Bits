--------------------------------------------------------------------------
--									--
--									--
--				functions.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Functions.lua" )


MFRADIX=100 
CRTRADIX=100 
ATKER=0 
DEFER=1 
haveNSD=0
ServerTime = 0		-----ˮ���һ���������¼
KopHonor = 0			-----ˮ���һ����ߵ���

--------------ʥսר�ò���----------------------------------------
count_haidao = 0
count_haijun = 0
five_seconds = 0
second_five_seconds = 0
time_can_setmonster = 0
time_can_setnvsheng = 0
check_need_show = 0 
create_boss_hj = 0
create_boss_hd = 0
--create_two_side_lose = 0
--CLOSENotice = 0


count_haijun2 = 0
count_haidao2 = 0
five_seconds2 = 0
second_five_seconds2 = 0
time_can_setmonster2 = 0
time_can_setnvsheng2 = 0
check_need_show2 = 0
create_boss_hj2 = 0
create_boss_hd2 = 0
--create_two_side_lose2 = 0
--CLOSENotice2 = 0
ASK_RAND=2 ---�������
ASK_LINE=1 ---˳������
QUIT_COUNT=1	---����������
QUIT_OUT=2	---������ʾ�˳�
ZTLprice = 5000
ZTLBprice = 5000
ZTLChanged = 0
ZTLcChanged = 100
ZTLBuyList = {}
tempZTLPrice={}
ZTLRaise = 10
JNJZ = {}
BoxNum = 5
function Quse01()
	CALCULATE_FUNCTIONS_LUA_000001 = GetResString("CALCULATE_FUNCTIONS_LUA_000001")
	AddQues(CALCULATE_FUNCTIONS_LUA_000001,ASK_LINE,QUIT_OUT)
	AddNextQues()
	Ques("1+1=?")
	InitChoose()
	choose ("1")
	choose ("2")
	choose ("3")
	choose ("4")
	answer("2")
	AddNextQues()
	Ques("1+2=?")
	InitChoose()
	choose ("1")
	choose ("2")
	choose ("3")
	choose ("4")
	answer("3")
		AddNextQues()
	Ques("1+3=?")
	InitChoose()
	choose ("1")
	choose ("2")
	choose ("3")
	choose ("4")
	answer("4")
		AddNextQues()
	Ques("1+0=?")
	InitChoose()
	choose ("1")
	choose ("2")
	choose ("3")
	choose ("4")
	answer("1")

end
function InitQuse()
	Quse01()
	Ques2()
	Ques3()
end

function get_repatriate_city_guildwar(role)

  local map_name_role_guildwar = GetChaMapName ( role )
  return map_name_role_guildwar

end

function get_repatriate_city_guildwar2(role)

  local map_name_role_guildwar2 = GetChaMapName ( role )
  return map_name_role_guildwar2

end
---------------------------------------------------	
---------------------------------------------------



atk_statecheck = {} 
def_statecheck = {} 

function Reset_Statecheck () 
	for i = 1 , 100 , 1 do 
		atk_statecheck[i] = 0 
		def_statecheck[i] = 0 
	end 
end 



function EightyLv_ExpAdd ( cha , expadd ) 

	if ValidCha (cha) ==1   then					--ָ�����
		if ChaIsBoat ( cha ) == 0   then			--����Ӿ��������⴦��
			if Lv ( cha ) >= 80   then 
				expadd = math.floor ( expadd / 50 ) 
			end 
			if expadd == 0   then 
				CALCULATE_FUNCTIONS_LUA_000002 = GetResString("CALCULATE_FUNCTIONS_LUA_000002")
				SystemNotice ( TurnToCha(cha) , CALCULATE_FUNCTIONS_LUA_000002 )
			end 
		end 
		exp = GetChaAttr ( cha , ATTR_CEXP ) 
		exp = exp + expadd 
		SetCharaAttr ( exp , cha , ATTR_CEXP ) 
	end 
end 


function Check_State ( atk_role , def_role ) 
	Reset_Statecheck() 
	--����״̬�ж�
--	atk_statecheck[STATE_ZMYJ] = GetChaStateLv ( ATKER , STATE_ZMYJ ) 
--	atk_statecheck[STATE_SMYB] = GetChaStateLv ( ATKER , STATE_SMYB ) 
	atk_statecheck[STATE_YS] = GetChaStateLv ( atk_role , STATE_YS ) 
	--�ܻ�״̬�ж�
--	def_statecheck[STATE_ZJFT] = GetChaStateLv ( DEFER , STATE_ZJFT ) 
--	def_statecheck[STATE_BSHD] = GetChaStateLv ( DEFER , STATE_BSHD ) 
end 

function CreatChaSkill ( role ) 
end 


function CheckJobLegal ( job ) 
	local check_job = 1 
	if job < JOB_TYPE_XINSHOU or job > JOB_TYPE_GONGCHENGSHI   then 
		check_job = 0 
	end 
	return check_job 
end 

function RemoveYS( role )
	--SystemNotice ( role , "come here" )
	RemoveState( role , STATE_YS )					
	return 1 
end

function Rem_State_Unnormal ( role ) 
	RemoveState( role , STATE_ZD )					--�ж�
	RemoveState( role , STATE_MB )					--���
	RemoveState( role , STATE_ZZZH )				--����֮��
	RemoveState( role , STATE_SYNZ)				--��Ԩ����
	RemoveState( role , STATE_SDBZ )				--�������
	RemoveState( role , STATE_TJ )					--�Ⱦ�
	RemoveState( role , STATE_SJ )					--�־�
--	RemoveState( role , STATE_XY )					--ѣ��
	RemoveState( role , STATE_JNJZ )				--���ܽ�ֹ
	RemoveState( role , STATE_GJJZ )				--������ֹ
	RemoveState( role , STATE_BDJ )					--������
	RemoveState( role , STATE_XN )					--Ѫŭ
	RemoveState( role , STATE_NT )					--��̶
	RemoveState( role , STATE_DIZ )					--����
	RemoveState( role , STATE_SWCX )				--������Ц
	RemoveState( role , STATE_JSDD )				--��ʬ����
	RemoveState( role , STATE_HYMH )				--����ħ��-�Ȼ�
	RemoveState( role , STATE_HLKJ )				--����-�־�
	RemoveState( role , STATE_HLLM )				--����-����
	RemoveState( role , STATE_CRXSF )				--����з-����
	RemoveState( role , STATE_BlackHX )				--������Х
	RemoveState( role , STATE_HLKJ )				--�����׻�
end 
------------------------------------------REMOVEս��״̬
function Rem_State_StarUnnormal ( role ) 
	RemoveState( role , STATE_KUANGZ )					--��ս��     
	RemoveState( role , STATE_QUANS )					--ȫ��װ��  
	RemoveState( role , STATE_QINGZ )					--��װҩˮ  
end 
function Rem_State_NOSEA ( role ) ------------------�º�ʱ�Ƴ�״̬
	RemoveState( role , STATE_KB )					
	RemoveState( role , STATE_XLZH )					
	RemoveState( role , STATE_PKJSYS )				
	RemoveState( role , STATE_PKSFYS)				
	RemoveState( role , STATE_TSHD )				
	RemoveState( role , STATE_FZLZ )					
	RemoveState( role , STATE_PKZDYS )					
	RemoveState( role , STATE_PKKBYS )					
	RemoveState( role , STATE_YSLLQH )				
	RemoveState( role , STATE_YSMJQH )				
	RemoveState( role , STATE_YSLQQH )					
	RemoveState( role , STATE_YSTZQH )					
	RemoveState( role , STATE_YSJSQH )					
	RemoveState( role , STATE_DENGLONG )					
	RemoveState( role , STATE_YSMspd )				
	RemoveState( role , STATE_PKSBYS )				
	RemoveState( role , STATE_KUANGZ )				
	RemoveState( role , STATE_QUANS )				
	RemoveState( role , STATE_QINGZ )				
	RemoveState( role , STATE_CJBBT )				
	RemoveState( role , STATE_JRQKL )				
	RemoveState( role , STATE_KALA )	
	RemoveState( role , STATE_CZZX )
	RemoveState( role , STATE_JLFT1 )				
	RemoveState( role , STATE_JLFT2 )				
	RemoveState( role , STATE_JLFT3 )				
	RemoveState( role , STATE_JLFT4 )				
	RemoveState( role , STATE_JLFT5 )				
	RemoveState( role , STATE_JLFT6 )				
	RemoveState( role , STATE_JLFT7 )				
	RemoveState( role , STATE_JLFT8 )
	RemoveState( role , STATE_HPHMHF )
	RemoveState( role , STATE_SPHMHF )
	RemoveState( role , STATE_LANTERN )
	RemoveState( role , STATE_RAPIDDRUG )
	RemoveState( role , STATE_WARSIT )
	RemoveState( role , STATE_DARKDRESS )
	RemoveState( role , STATE_DEMON )
	RemoveState( role , STATE_GREATSH )
	RemoveState( role , STATE_MIRAGE )
	RemoveState( role , STATE_DEVOTE )
	RemoveState( role , STATE_VIGOUR )
end 
function SetCharaAttr(a,b,c) --[[���ý�ɫ����ת���ӿ�:����ֵ����ɫ���ͣ����Ա��]]--
	local x,y=b,c 
	local z=math.floor(a) 
--	LuaPrint("���ý�ɫ"..b) 
	--LuaPrint("����"..c) 
	--LuaPrint(a.."\n") 
	--LG("setchaattr","����"..c, "������", "= ", a ,"\n") 
	SetChaAttr(x,y,z) 
end 

function Attr_ap(a) --[[ȡ��ɫʣ��ɷ������]]--
	--LuaPrint("ȡ��ɫ����remain_ap") 
	local attr_ap=GetChaAttr(a,ATTR_AP) 
	return attr_ap 
end 

function Attr_tp(a) 
	--LuaPrint("ȡ��ɫ����remain_tp") 
	local attr_tp=GetChaAttr(a,ATTR_TP) 
	return attr_tp 
end 

function CheckCha_Job(a) --[[ȡ��ɫְҵ]]-- 
	--LuaPrint("ȡ��ɫ����job") 
	local role_attr_job=GetChaAttr(a,ATTR_JOB) 
	return role_attr_job 
end 

function Exp(a) 
	--LuaPrint("ȡ��ɫ��ǰexp�����Я��exp") 
	local exp=GetChaAttr(a,ATTR_CEXP) --[[ȡexp]]--
	return exp 
end 

function Lv(a)
	--LuaPrint("ȡ��ɫ����lv") 
	local b = TurnToCha ( a ) 
	local lv=GetChaAttr( b , ATTR_LV ) --[[ȡlv]]--
	return lv 
end 

function Hp(a)
	--LuaPrint("ȡ��ɫ����hp") 
	local hp=GetChaAttr(a,ATTR_HP) --[[ȡhp]]--
	return hp 
end 

function Mxhp(a)
	--LuaPrint("ȡ��ɫ����mxhp") 
	local mxhp=GetChaAttr(a,ATTR_MXHP) --[[ȡmxhp]]--
	return mxhp 
end 

function MxhpSa(a)
	--LuaPrint("ȡ��ɫ����mxhp_sa") 
	local mxhpsa= GetChaAttr(a, ATTR_STATEC_MXHP)/ATTR_RADIX   --[[ȡmxhp״̬�ٷֱ�]]--
	return mxhpsa 
end 

function MxhpSb(a)
	--LuaPrint("ȡ��ɫ����mxhp_sb") 
	local mxhpsb=GetChaAttr(a, ATTR_STATEV_MXHP) --[[ȡmxhp״̬����]]--
	return mxhpsb 
end 

function MxhpIa(a)
	--LuaPrint("ȡ��ɫ����mxhp_ia") 
	local mxhpia=GetChaAttr(a, ATTR_ITEMC_MXHP)/ATTR_RADIX --[[ȡmxhp���߰ٷֱ�]]--
	return mxhpia 
end 

function MxhpIb(a)
	--LuaPrint("ȡ��ɫ����mshp_ib") 
	local mxhpib=GetChaAttr(a, ATTR_ITEMV_MXHP) --[[ȡmxhp���߳���]]--
	return mxhpib 
end 

function Sp(a)
	--LuaPrint("ȡ��ɫ����sp") 
	local sp=GetChaAttr(a,ATTR_SP) --[[ȡsp]]--
	return sp 
end 

function Mxsp(a)
	--LuaPrint("ȡ��ɫ����mxsp") 
	local mxsp=GetChaAttr(a,ATTR_MXSP) --[[ȡmxsp]]--
	return mxsp 
end 

function MxspSa(a)
	--LuaPrint("ȡ��ɫ����mxsp_sa") 
	local mxspsa=GetChaAttr(a, ATTR_STATEC_MXSP)/ATTR_RADIX  --[[ȡmxsp״̬�ٷֱ�]]--
	return mxspsa 
end 

function MxspSb(a)
	--LuaPrint("ȡ��ɫ����mxsp_sb") 
	local mxspsb=GetChaAttr(a, ATTR_STATEV_MXSP) --[[ȡmxsp״̬����]]--
	return mxspsb 
end 

function MxspIa(a)
	--LuaPrint("ȡ��ɫ����mxsp_ia") 
	local mxspia=GetChaAttr(a, ATTR_ITEMC_MXSP)/ATTR_RADIX --[[ȡmxsp���߰ٷֱ�]]--
	return mxspia 
end 

function MxspIb(a)
	--LuaPrint("ȡ��ɫ����mxsp_ib") 
	local mxspib=GetChaAttr(a, ATTR_ITEMV_MXSP) --[[ȡmxsp���߳���]]--
	return mxspib 
end 

function Mnatk(a)
	--LuaPrint("ȡ��ɫ����mnatk") 
	local mnatk=GetChaAttr(a,ATTR_MNATK) --[[ȡmnatk]]--
	return mnatk 
end 

function MnatkSa(a)
	--LuaPrint("ȡ��ɫ����mnatk_sa") 
	local mnatksa= GetChaAttr(a, ATTR_STATEC_MNATK)/ATTR_RADIX --[[ȡmnatk״̬�ٷֱ�]]--
	return mnatksa 
end 

function MnatkSb(a)
	--LuaPrint("ȡ��ɫ����mnatk_sb") 
	local mnatksb=GetChaAttr(a, ATTR_STATEV_MNATK) --[[ȡmnatk״̬����]]--
	return mnatksb 
end 

function MnatkIa(a)
	--LuaPrint("ȡ��ɫ����mnatk_ia") 
	local mnatkia=GetChaAttr(a, ATTR_ITEMC_MNATK)/ATTR_RADIX --[[ȡmnatk���߰ٷֱ�]]--
	return mnatkia 
end 

function MnatkIb(a)
	--LuaPrint("ȡ��ɫ����mnatk_ib") 
	local mnatkib=GetChaAttr(a, ATTR_ITEMV_MNATK) --[[ȡmnatk���߳���]]--
	return mnatkib 
end 

function Mxatk(a)
	--LuaPrint("ȡ��ɫ����mxatk") 
	local mxatk=GetChaAttr(a,ATTR_MXATK) --[[ȡmxatk]]--
	return mxatk 
end 

function MxatkSa(a)
	--LuaPrint("ȡ��ɫ����mxatk_sa") 
	local mxatksa= GetChaAttr(a, ATTR_STATEC_MXATK)/ATTR_RADIX  --[[ȡmxatk״̬�ٷֱ�]]--
	return mxatksa 
end 

function MxatkSb(a)
	--LuaPrint("ȡ��ɫ����mxatk_sb") 
	local mxatksb=GetChaAttr(a, ATTR_STATEV_MXATK) --[[ȡmxatk״̬����]]--
	return mxatksb 
end 

function MxatkIa(a)
	--LuaPrint("ȡ��ɫ����mxatk_ia") 
	local mxatkia=GetChaAttr(a, ATTR_ITEMC_MXATK)/ATTR_RADIX --[[ȡmxatk���߰ٷֱ�]]--
	return mxatkia 
end 

function MxatkIb(a)
	--LuaPrint("ȡ��ɫ����mxatk_ib") 
	local mxatkib=GetChaAttr(a, ATTR_ITEMV_MXATK) --[[ȡmxatk���߳���]]--
	return mxatkib 
end 

function Def(a)
	--LuaPrint("ȡ��ɫ����def") 
	local def=GetChaAttr(a,ATTR_DEF) --[[ȡdef]]--
	return def 
end 

function DefSa(a)
	--LuaPrint("ȡ��ɫ����def_sa") 
	local defsa= GetChaAttr(a, ATTR_STATEC_DEF)/ATTR_RADIX  --[[ȡdef״̬�ٷֱ�]]--
	return defsa 
end 

function DefSb(a)
	--LuaPrint("ȡ��ɫ����def_sb") 
	local defsb=GetChaAttr(a, ATTR_STATEV_DEF) --[[ȡdef״̬����]]--
	--LG("setchaattr","ȡ��ɫ",ATTR_STATEV_DEF,"������ = ", defsb,"\n" ) 
	return defsb 
end 

function DefIa(a)
	--LuaPrint("ȡ��ɫ����def_ia") 
	local defia=GetChaAttr(a, ATTR_ITEMC_DEF)/ATTR_RADIX --[[ȡdef���߰ٷֱ�]]--
	return defia 
end 

function DefIb(a)
	--LuaPrint("ȡ��ɫ����def_ib") 
	local defib=GetChaAttr(a, ATTR_ITEMV_DEF) --[[ȡdef���߳���]]--
	return defib 
end 

function Resist(a)
	--LuaPrint("ȡ��ɫ����def") 
	local def=GetChaAttr(a,ATTR_PDEF) --[[ȡdef]]--
	return def 
end 

function ResistSa(a)
	--LuaPrint("ȡ��ɫ����def_sa") 
	local defsa= GetChaAttr(a, ATTR_STATEC_PDEF)/ATTR_RADIX  --[[ȡdef״̬�ٷֱ�]]--
	return defsa 
end 

function ResistSb(a)
	--LuaPrint("ȡ��ɫ����def_sb") 
	local defsb=GetChaAttr(a, ATTR_STATEV_PDEF) --[[ȡdef״̬����]]--
	return defsb 
end 

function ResistIa(a)
	--LuaPrint("ȡ��ɫ����def_ia") 
	local defia=GetChaAttr(a, ATTR_ITEMC_PDEF)/ATTR_RADIX --[[ȡdef���߰ٷֱ�]]--
	return defia 
end 

function ResistIb(a)
	--LuaPrint("ȡ��ɫ����def_ib") 
	local defib=GetChaAttr(a, ATTR_ITEMV_PDEF) --[[ȡdef���߳���]]--
	return defib 
end 

function Hit(a)
	--LuaPrint("ȡ��ɫ����hit") 
	local hit=GetChaAttr(a,ATTR_HIT) --[[ȡhit]]--
	return hit 
end 

function HitSa(a)
	--LuaPrint("ȡ��ɫ����hit_sa") 
	local hitsa= GetChaAttr(a, ATTR_STATEC_HIT)/ATTR_RADIX   --[[ȡhit״̬�ٷֱ�]]--
	return hitsa 
end 

function HitSb(a)
	--LuaPrint("ȡ��ɫ����hit_sb") 
	local hitsb=GetChaAttr(a, ATTR_STATEV_HIT) --[[ȡhit״̬����]]--
	return hitsb 
end 

function HitIa(a)
	--LuaPrint("ȡ��ɫ����hit_ia") 
	local hitia=GetChaAttr(a, ATTR_ITEMC_HIT)/ATTR_RADIX --[[ȡhit���߰ٷֱ�]]--
	return hitia 
end 

function HitIb(a)
	--LuaPrint("ȡ��ɫ����hit_ib") 
	local hitib=GetChaAttr(a, ATTR_ITEMV_HIT) --[[ȡhit���߳���]]--
	return hitib 
end 

function Flee(a)
	--LuaPrint("ȡ��ɫ����flee") 
	local flee=GetChaAttr(a,ATTR_FLEE) --[[ȡflee]]--
	return flee 
end 

function FleeSa(a)
	--LuaPrint("ȡ��ɫ����flee_sa") 
	local fleesa=  GetChaAttr(a, ATTR_STATEC_FLEE)/ATTR_RADIX  --[[ȡflee״̬�ٷֱ�]]--
	return fleesa 
end 

function FleeSb(a)
	--LuaPrint("ȡ��ɫ����flee_sb") 
	local fleesb=GetChaAttr(a, ATTR_STATEV_FLEE) --[[ȡflee״̬����]]--
	return fleesb 
end 

function FleeIa(a)
	--LuaPrint("ȡ��ɫ����flee_ia") 
	local fleeia=GetChaAttr(a, ATTR_ITEMC_FLEE)/ATTR_RADIX --[[ȡflee���߰ٷֱ�]]--
	return fleeia 
end 

function FleeIb(a)
	--LuaPrint("ȡ��ɫ����flee_ib") 
	local fleeib=GetChaAttr(a, ATTR_ITEMV_FLEE) --[[ȡflee���߳���]]--
	return fleeib 
end 

function Mf(a)
	--LuaPrint("ȡ��ɫ����mf") 
	local mf=GetChaAttr(a,ATTR_MF)/MFRADIX --[[ȡmf]]--
	return mf 
end 

function MfSa(a)
	--LuaPrint("ȡ��ɫ����mf_sa") 
	local mfsa= GetChaAttr(a, ATTR_STATEC_MF)/ATTR_RADIX  --[[ȡmf״̬�ٷֱ�]]--
	return mfsa 
end 

function MfSb(a)
	--LuaPrint("ȡ��ɫ����mf_sb") 
	local mfsb=GetChaAttr(a, ATTR_STATEV_MF) --[[ȡmf״̬����]]--
	return mfsb 
end 

function MfIa(a)
	--LuaPrint("ȡ��ɫ����mf_ia") 
	local mfia=GetChaAttr(a, ATTR_ITEMC_MF)/ATTR_RADIX --[[ȡmf���߰ٷֱ�]]--
	return mfia 
end 

function MfIb(a)
	--LuaPrint("ȡ��ɫ����mf_ib") 
	local mfib=GetChaAttr(a, ATTR_ITEMV_MF) --[[ȡmf���߳���]]--
	return mfib 
end 

function Crt(a)
	--LuaPrint("ȡ��ɫ����crt") 
	local crt=GetChaAttr(a,ATTR_CRT)/CRTRADIX --[[ȡcrt]]--
	return crt 
end 

function CrtSa(a)
	--LuaPrint("ȡ��ɫ����crt_sa") 
	local crtsa= GetChaAttr(a, ATTR_STATEC_CRT)/ATTR_RADIX  --[[ȡcrt״̬�ٷֱ�]]--
	return crtsa 
end 

function CrtSb(a)
	--LuaPrint("ȡ��ɫ����crt_sb") 
	local crtsb=GetChaAttr(a, ATTR_STATEV_CRT) --[[ȡcrt״̬����]]--
	return crtsb 
end 

function CrtIa(a)
	--LuaPrint("ȡ��ɫ����crt_ia") 
	local crtia=GetChaAttr(a, ATTR_ITEMC_CRT)/ATTR_RADIX --[[ȡcrt���߰ٷֱ�]]--
	return crtia 
end 

function CrtIb(a)
	--LuaPrint("ȡ��ɫ����crt_ib") 
	local crtib=GetChaAttr(a, ATTR_ITEMV_CRT) --[[ȡcrt���߳���]]--
	return crtib 
end 

function Hrec(a)
	--LuaPrint("ȡ��ɫ����hrec") 
	local hrec=GetChaAttr(a,ATTR_HREC) --[[ȡhrec]]--
	return hrec 
end 

function HrecSa(a)
	--LuaPrint("ȡ��ɫ����hrec_sa") 
	local hrecsa=  GetChaAttr(a, ATTR_STATEC_HREC)/ATTR_RADIX  --[[ȡhrec״̬�ٷֱ�]]--
	return hrecsa 
end 

function HrecSb(a)
	--LuaPrint("ȡ��ɫ����hrec_sb") 
	local hrecsb=GetChaAttr(a, ATTR_STATEV_HREC) --[[ȡhrec״̬����]]--
	return hrecsb 
end 

function HrecIa(a)
	--LuaPrint("ȡ��ɫ����hrec_ia") 
	local hrecia=GetChaAttr(a, ATTR_ITEMC_HREC)/ATTR_RADIX --[[ȡhrec���߰ٷֱ�]]--
	return hrecia 
end 

function HrecIb(a)
	--LuaPrint("ȡ��ɫ����hrec_ib") 
	local hrecib=GetChaAttr(a, ATTR_ITEMV_HREC) --[[ȡhrec���߳���]]--
	return hrecib 
end 

function Srec(a)
	--LuaPrint("ȡ��ɫ����srec") 
	local srec=GetChaAttr(a,ATTR_SREC) --[[ȡsrec]]--
	return srec 
end 

function SrecSa(a)
	--LuaPrint("ȡ��ɫ����srec_sa") 
	local srecsa= GetChaAttr(a, ATTR_STATEC_SREC)/ATTR_RADIX  --[[ȡsrec״̬�ٷֱ�]]--
	return srecsa 
end 

function SrecSb(a)
	--LuaPrint("ȡ��ɫ����srec_sb") 
	local srecsb=GetChaAttr(a, ATTR_STATEV_SREC) --[[ȡsrec״̬����]]--
	return srecsb 
end 

function SrecIa(a)
	--LuaPrint("ȡ��ɫ����srec_ia") 
	local srecia=GetChaAttr(a, ATTR_ITEMC_SREC)/ATTR_RADIX --[[ȡsrec���߰ٷֱ�]]--
	return srecia 
end 

function SrecIb(a)
	--LuaPrint("ȡ��ɫ����srec_ib") 
	local srecib=GetChaAttr(a, ATTR_ITEMV_SREC) --[[ȡsrec���߳���]]--
	return srecib 
end 

function Aspd(a)
	--LuaPrint("ȡ��ɫ����aspd") 
	local aspd=math.floor ( 100000 / GetChaAttr(a,ATTR_ASPD) )  --[[ȡaspd]]--
	return aspd 
end 

function AspdSa(a)
	--LuaPrint("ȡ��ɫ����aspd_sa") 
	local aspdsa=  GetChaAttr(a, ATTR_STATEC_ASPD)/ATTR_RADIX    --[[ȡaspd״̬�ٷֱ�]]--
	return aspdsa 
end 

function AspdSb(a)
	--LuaPrint("ȡ��ɫ����aspd_sb") 
	local aspdsb=GetChaAttr(a, ATTR_STATEV_ASPD) --[[ȡaspd״̬����]]--
	return aspdsb 
end 

function AspdIa(a)
	--LuaPrint("ȡ��ɫ����aspd_ia") 
	local aspdia=GetChaAttr(a, ATTR_ITEMC_ASPD)/ATTR_RADIX --[[ȡaspd���߰ٷֱ�]]--
	return aspdia 
end 

function AspdIb(a)
	--LuaPrint("ȡ��ɫ����aspd_ib") 
	local aspdib=GetChaAttr(a, ATTR_ITEMV_ASPD) --[[ȡaspd���߳���]]--
	return aspdib 
end 

function Adis(a)
	--LuaPrint("ȡ��ɫ����adis") 
	local adis=GetChaAttr(a,ATTR_ADIS) --[[ȡadis]]--
	return adis 
end 

function AdisSa(a)
	--LuaPrint("ȡ��ɫ����adis_sa") 
	local adissa=  GetChaAttr(a, ATTR_STATEC_ADIS)/ATTR_RADIX   --[[ȡadis״̬�ٷֱ�]]--
	return adissa 
end 

function AdisSb(a)
	--LuaPrint("ȡ��ɫ����adis_sb") 
	local adissb=GetChaAttr(a, ATTR_STATEV_ADIS) --[[ȡadis״̬����]]--
	return adissb 
end 

function AdisIa(a)
	--LuaPrint("ȡ��ɫ����aids_ia") 
	local adisia=GetChaAttr(a, ATTR_ITEMC_ADIS)/ATTR_RADIX --[[ȡadis���߰ٷֱ�]]--
	return adisia 
end 

function AdisIb(a)
	--LuaPrint("ȡ��ɫ����adis_ib") 
	local adisib=GetChaAttr(a, ATTR_ITEMV_ADIS) --[[ȡadis���߳���]]--
	return adisib 
end 

function Mspd(a)
	--LuaPrint("ȡ��ɫ����mspd") 
	local mspd=GetChaAttr(a,ATTR_MSPD) --[[ȡmspd]]--
	return mspd 
end 

function MspdSa(a)
	--LuaPrint("ȡ��ɫ����mspd_sa") 
	local mspdsa=  GetChaAttr(a, ATTR_STATEC_MSPD)/ATTR_RADIX   --[[ȡmspd״̬�ٷֱ�]]--
	return mspdsa 
end 
function MspdSb(a)
	--LuaPrint("ȡ��ɫ����mspd_sb") 
	local mspdsb=GetChaAttr(a, ATTR_STATEV_MSPD) --[[ȡmspd״̬����]]--
	return mspdsb 
end 
function MspdIa(a)
	--LuaPrint("ȡ��ɫ����mspd_ia") 
	local mspdia=GetChaAttr(a, ATTR_ITEMC_MSPD)/ATTR_RADIX --[[ȡmspd���߰ٷֱ�]]--
	return mspdia 
end 

function MspdIb(a)
	--LuaPrint("ȡ��ɫ����Mspd_ib") 
	local mspdib=GetChaAttr(a, ATTR_ITEMV_MSPD) --[[ȡmspd���߳���]]--
	return mspdib 
end 

function Col(a)
	--LuaPrint("ȡ��ɫ����col") 
	local col=GetChaAttr(a,ATTR_COL) --[[ȡcol]]--
	return col 
end 

function ColSa(a) 
	--LuaPrint("ȡ��ɫ����col_sa") 
	local colsa= GetChaAttr(a, ATTR_STATEC_COL)/ATTR_RADIX  --[[ȡcol״̬�ٷֱ�]]--
	return colsa 
end 

function ColSb(a) 
	--LuaPrint("ȡ��ɫ����col_sb") 
	local colsb=GetChaAttr(a, ATTR_STATEV_COL) --[[ȡcol״̬����]]--
	return colsb 
end 

function ColIa(a) 
	--LuaPrint("ȡ��ɫ����col_ia") 
	local colia=GetChaAttr(a, ATTR_ITEMC_COL)/ATTR_RADIX --[[ȡcol���߰ٷֱ�]]--
	return colia 
end 

function ColIb(a) 
	--LuaPrint("ȡ��ɫ����col_ib") 
	local colib=GetChaAttr(a, ATTR_ITEMV_COL) --[[ȡcol���߳���]]--
	return colib 
end 

function Str(a) 
	--LuaPrint("ȡ��ɫ����str") 
	local str=GetChaAttr(a,ATTR_STR) --[[ȡstr]]--
	return str 
end 

function StrSa(a) 
	--LuaPrint("ȡ��ɫ����str_sa") 
	local strsa= GetChaAttr(a, ATTR_STATEC_STR)/ATTR_RADIX   --[[ȡstr״̬�ٷֱ�]]--
	return strsa 
end 

function StrSb(a) 
	--LuaPrint("ȡ��ɫ����str_sb") 
	local strsb=GetChaAttr(a, ATTR_STATEV_STR) --[[ȡstr״̬����]]--
	return strsb 
end 

function StrIa(a)
	--LuaPrint("ȡ��ɫ����str_ia") 
	local stria=GetChaAttr(a,ATTR_ITEMC_STR)/ATTR_RADIX --[[ȡstr���߰ٷֱ�]]--
	return stria 
end 

function StrIb(a)
	--LuaPrint("ȡ��ɫ����str_ib") 
	local strib=GetChaAttr(a,ATTR_ITEMV_STR) --[[ȡstr���߳���]]--
	return strib 
end 

function Dex(a)
	--LuaPrint("ȡ��ɫ����dex") 
	local dex=GetChaAttr(a,ATTR_DEX) --[[ȡdex]]--
	return dex 
end 

function DexSa(a)
	--LuaPrint("ȡ��ɫ����dex_sa") 
	local dexsa= GetChaAttr(a, ATTR_STATEC_DEX)/ATTR_RADIX  --[[ȡdex״̬�ٷֱ�]]--
	return dexsa 
end 

function DexSb(a)
	--LuaPrint("ȡ��ɫ����dex_sb") 
	local dexsb=GetChaAttr(a, ATTR_STATEV_DEX) --[[ȡdex״̬����]]--
	return dexsb 
end 

function DexIa(a)
	--LuaPrint("ȡ��ɫ����dex_ia") 
	local dexia=GetChaAttr(a,ATTR_ITEMC_DEX)/ATTR_RADIX --[[ȡdex���߰ٷֱ�]]--
	return dexia 
end 

function DexIb(a)
	--LuaPrint("ȡ��ɫ����dex_ib") 
	local dexib=GetChaAttr(a,ATTR_ITEMV_DEX) --[[ȡdex���߳���]]--
	return dexib 
end 

function Agi(a) 
	--LuaPrint("ȡ��ɫ����agi") 
	local agi=GetChaAttr(a,ATTR_AGI) --[[ȡagi]]--
	return agi 
end 

function AgiSa(a)
	--LuaPrint("ȡ��ɫ����agi_sa") 
	local agisa= GetChaAttr(a, ATTR_STATEC_AGI)/ATTR_RADIX  --[[ȡagi״̬�ٷֱ�]]--
	return agisa 
end 

function AgiSb(a)
	--LuaPrint("ȡ��ɫ����agi_sb") 
	local agisb=GetChaAttr(a, ATTR_STATEV_AGI) --[[ȡagi״̬����]]--
	return agisb 
end 

function AgiIa(a)
	--LuaPrint("ȡ��ɫ����agi_ia") 
	local agiia=GetChaAttr(a,ATTR_ITEMC_AGI)/ATTR_RADIX --[[ȡagi���߰ٷֱ�]]--
	return agiia 
end 

function AgiIb(a)
	--LuaPrint("ȡ��ɫ����agi_ib") 
	local agiib=GetChaAttr(a,ATTR_ITEMV_AGI) --[[ȡagi���߳���]]--
	return agiib 
end 

function Con(a)
	--LuaPrint("ȡ��ɫ����con") 
	local con=GetChaAttr(a,ATTR_CON) --[[ȡcon]]--
	return con 
end 

function ConSa(a)
	--LuaPrint("ȡ��ɫ����con_sa") 
	local consa= GetChaAttr(a, ATTR_STATEC_CON)/ATTR_RADIX  --[[ȡcon״̬�ٷֱ�]]--
	return consa 
end 

function ConSb(a)
	--LuaPrint("ȡ��ɫ����con_sb") 
	local consb=GetChaAttr(a, ATTR_STATEV_CON) --[[ȡcon״̬����]]--
	return consb 
end 

function ConIa(a)
	--LuaPrint("ȡ��ɫ����con_ia") 
	local conia=GetChaAttr(a, ATTR_ITEMC_CON)/ATTR_RADIX --[[ȡcon���߰ٷֱ�]]--
	return conia 
end 

function ConIb(a)
	--LuaPrint("ȡ��ɫ����con_ib") 
	local conib=GetChaAttr(a, ATTR_ITEMV_CON) --[[ȡcon���߳���]]--
	return conib 
end 

function Sta(a)
	--LuaPrint("ȡ��ɫ����sta") 
	local sta=GetChaAttr(a,ATTR_STA) --[[ȡsta]]--
	return sta 
end 

function StaSa(a)
	--LuaPrint("ȡ��ɫ����sta_sa") 
	local stasa= GetChaAttr(a, ATTR_STATEC_STA)/ATTR_RADIX  --[[ȡsta״̬�ٷֱ�]]--
	return stasa 
end 

function StaSb(a)
	--LuaPrint("ȡ��ɫ����sta_sb") 
	local stasb=GetChaAttr(a, ATTR_STATEV_STA) --[[ȡsta״̬����]]--
	return stasb 
end 

function StaIa(a)
	--LuaPrint("ȡ��ɫ����sta_ia") 
	local staia=GetChaAttr(a, ATTR_ITEMC_STA)/ATTR_RADIX --[[ȡsta���߰ٷֱ�]]--
	return staia 
end 

function StaIb(a)
	--LuaPrint("ȡ��ɫ����sta_ib") 
	local staib=GetChaAttr(a, ATTR_ITEMV_STA) --[[ȡsta���߳���]]--
	return staib 
end 

function Luk(a)
	--LuaPrint("ȡ��ɫ����luk") 
	local luk=GetChaAttr(a,ATTR_LUK) --[[ȡluk]]--
	return luk 
end 

function LukSa(a)
	--LuaPrint("ȡ��ɫ����luk_sa") 
	local luksa= GetChaAttr(a, ATTR_STATEC_LUK)/ATTR_RADIX   --[[ȡluk״̬�ٷֱ�]]--
	return luksa 
end 

function LukSb(a)
	--LuaPrint("ȡ��ɫ����luk_sb") 
	local luksb=GetChaAttr(a, ATTR_STATEV_LUK) --[[ȡluk״̬����]]--
	return luksb 
end 

function LukIa(a)
	--LuaPrint("ȡ��ɫ����luk_ia") 
	local lukia=GetChaAttr(a, ATTR_ITEMC_LUK)/ATTR_RADIX --[[ȡluk���߰ٷֱ�]]--
	return lukia 
end 

function LukIb(a)
	--LuaPrint("ȡ��ɫ����luk_ib") 
	local lukib = GetChaAttr(a, ATTR_ITEMV_LUK) --[[ȡluk���߳���]]--
	return lukib 
end 




function BSMxhp(a) --[[ȡ����mxhp]]--
	--LuaPrint("ȡ��ɫ����bsmxhp") 
	local bsmxhp=GetChaAttr(a,ATTR_BMXHP) 
	return bsmxhp 
end 

function Mxhp_final(a) 
	local mxhp_final=(BSMxhp(a) * MxhpIa(a) + MxhpIb(a) ) * math.max(0, MxhpSa(a))  + MxhpSb(a) --[[ȡ��ʱʵ��mxhp]]--
	--LG("chaattr_set", " BSMxhp = " , BSMxhp(a) , "MxhpIa = " , MxhpIa(a) , " MxhpIb = " , MxhpIb(a) , "MxhpSa = " , MxhpSa(a) , "MxhpSb = ", MxhpSb(a) , "\n" ) 
	--LG("chaattr_set", "mxhp_final = ", mxhp_final , "\n" ) 
	return mxhp_final 
end 


function Sp_final(a)
	local sp_final=(BSSp(a) * SpIa(a) + SpIb(a) ) * math.max(0 , SpSa(a)) + SpSb(a) --[[ȡ��ʱʵ��sp]]--
	--LG("chaattr_set", " BSMxhp = " , BSmxhp(a) , "MxhpIa = " , MxhpIa(a) , " MxhpIb = " , MxhpIb(a) , "MxhpSa = " , MxhpSa(a) , "MxhpSb = ", MxhpSb(a) , "\n" ) 
	--LG("chaattr_set", "mxhp_final = ", mxhp_final , "\n" ) 
	return sp_final 
end 

function BSMxsp(a) --[[ȡ����mxsp]]--
	--LuaPrint("ȡ��ɫ����bsmxsp") 
	local bsmxsp=GetChaAttr(a,ATTR_BMXSP) 
	return bsmxsp 
end 

function Mxsp_final(a)
	local mxsp_final=(BSMxsp(a) * MxspIa(a) + MxspIb(a) ) * math.max ( 0 , MxspSa(a) ) + MxspSb(a) --[[ȡ��ʱʵ��mxsp]]--
	--LG("chaattr_set", " BSMxsp = " , BSMxsp(a) , "MxspIa = " , MxspIa(a) , " MxspIb = " , MxspIb(a) , "MxspSa = " , MxspSa(a) , "MxspSb = ", MxspSb(a) , "\n" ) 
	--LG("chaattr_set", "mxsp_final = ", mxsp_final , "\n" ) 
	return mxsp_final 
end 

function BSMnatk(a) --[[ȡ����mnatk]]--
	--LuaPrint("ȡ��ɫ����bsmnatk") 
	local bsmnatk=GetChaAttr(a,ATTR_BMNATK) 
	return bsmnatk 
end

function Mnatk_final(a)
	local mnatk_final=math.max ( (BSMnatk(a) * MnatkIa(a) + MnatkIb(a) ) * math.max ( 0 , MnatkSa(a)) + MnatkSb(a) , 1 ) --[[ȡ��ʱʵ��mnatk]]--
	--LG("chaattr_set", " BSMnatk = " , BSMnatk(a) , "MnatkIa = " , MnatkIa(a) , " MnatkIb = " , MnatkIb(a) , "MnatkSa = " , MnatkSa(a) , "MnatkSb = ", MnatkSb(a) , "\n" ) 
	--LG("chaattr_set", "mnatk_final = ", mnatk_final , "\n" ) 
	return mnatk_final 
end 

function BSMxatk(a) --[[ȡ����mxatk]]--
	--LuaPrint("ȡ��ɫ����bsmxatk") 
	local bsmxatk=GetChaAttr(a,ATTR_BMXATK) 
	return bsmxatk 
end

function Mxatk_final(a)
	local mxatk_final=math.max ( (BSMxatk(a) * MxatkIa(a) + MxatkIb(a) ) * math.max ( 0 , MxatkSa(a) ) + MxatkSb(a) , 1 ) --[[ȡ��ʱʵ��mxatk]]--
	return mxatk_final 
end 

function BSDef(a) --[[ȡ����def]]--
	--LuaPrint("ȡ��ɫ����bsdef") 
	local bsdef=GetChaAttr(a,ATTR_BDEF) 
	return bsdef 
end


function Def_final(a)
	local def_final=math.max ( (BSDef(a) * DefIa(a) + DefIb(a) ) * math.max ( 0 , DefSa(a) ) + DefSb(a) , 0 ) --[[ȡ��ʱʵ��def]]--
	--LG("chaattr_set", " BSDef = " , BSDef(a) , "DefIa = " , DefIa(a) , " DefIb = " , DefIb(a) , "DefSa = " , DefSa(a) , "DefSb = ", DefSb(a) , "\n" ) 
	--LG("chaattr_set", "def_final = ", def_final , "\n" ) 
	return def_final 
end 

function BSResist(a) --[[ȡ��������]]--
   --LuaPrint("ȡ��ɫ����bsresist") 
   local bsresist = GetChaAttr(a, ATTR_BPDEF) 
   return bsresist 
end 

function Resist_final(a) 
   local resist_final=(BSResist(a) * ResistIa(a) + ResistIb(a) ) * math.max ( 0 , ResistSa(a) ) + ResistSb(a) --[[ȡʵ��resist]]--
   return resist_final 
end 


function BSHit(a) --[[ȡ����hit]]--
	--LuaPrint("ȡ��ɫ����bshit") 
	local bshit=GetChaAttr(a,ATTR_BHIT) 
	return bshit 
end

function Hit_final(a)
	local hit_final = (BSHit(a) * HitIa(a) + HitIb(a) ) * math.max ( 0 , HitSa(a) ) + HitSb(a) --[[ȡ��ʱʵ��hit]]--
	return hit_final 
end 

function BSFlee(a) --[[ȡ����flee]]--
	--LuaPrint("ȡ��ɫ����bsflee") 
	local bsflee=GetChaAttr(a,ATTR_BFLEE) 
	return bsflee 
end

function Flee_final(a) 
	local flee_final=(BSFlee(a) * FleeIa(a) + FleeIb(a) ) * math.max ( 0 , FleeSa(a) ) + FleeSb(a)  --[[ȡ��ʱʵ��flee]]--
	return flee_final 
end 

function BSMf(a) --[[ȡ����mf]]--
	--LuaPrint("ȡ��ɫ����bsmf") 
	local bsmf=GetChaAttr(a,ATTR_BMF) 
	return bsmf 
end

function Mf_final(a)
	local mf_final=(BSMf(a) * MfIa(a) + MfIb(a) )* math.max ( 0 , MfSa(a) ) + MfSb(a) --[[ȡ��ʱʵ��mf]]--
	return mf_final 
end 

function BSCrt(a) --[[ȡ����crt]]--
	--LuaPrint("ȡ��ɫ����bscrt") 
	local bscrt=GetChaAttr(a,ATTR_BCRT) 
	return bscrt 
end

function Crt_final(a)
	local crt_final=(BSCrt(a) * CrtIa(a) + CrtIb(a) ) * math.max ( 0 , CrtSa(a) )  + CrtSb(a) --[[ȡ��ʱʵ��crt]]--
	return crt_final 
end 

function BSHrec(a) --[[ȡ����hrec]]--
	--LuaPrint("ȡ��ɫ����bshrec") 
	local bshrec=GetChaAttr(a,ATTR_BHREC) 
	return bshrec 
end

function Hrec_final(a)
	local hrec_final=( BSHrec(a) * HrecIa(a) + HrecIb(a) ) * math.max ( 0 , HrecSa(a) ) + HrecSb(a) --[[ȡ��ʱʵ��hrec]]--
	return hrec_final 
end 

function BSSrec(a) --[[ȡ����srec]]--
	--LuaPrint("ȡ��ɫ����bssrec") 
	local bssrec=GetChaAttr(a,ATTR_BSREC) 
	return bssrec 
end

function Srec_final(a)
	local srec_final=(BSSrec(a) * SrecIa(a) + SrecIb(a) ) * math.max ( 0 , SrecSa(a) ) + SrecSb(a) --[[ȡ��ʱʵ��srec]]--
	return srec_final 
end 

function BSAspd(a) --[[ȡ����aspd]]--
	--LuaPrint("ȡ��ɫ����bsaspd") 
	local bsaspd=math.floor ( 100000 / GetChaAttr(a,ATTR_BASPD) ) 
	return bsaspd 
end

function Aspd_final(a)
	local aspd_final=( BSAspd(a)  * AspdIa(a) + AspdIb(a) ) * math.max ( 0 , AspdSa(a) ) + AspdSb(a) --[[ȡ��ʱʵ��aspd]]--
	--LG("aspd", "baspd = " , BSAspd(a),"aspdia= " , AspdIa(a) , " AspdIb = ", AspdIb(a), "AspdSa = " , AspdSa(a) , "AspdSb = " , AspdSb(a) ) 
	return aspd_final 
end 

function BSAdis(a) --[[ȡ����adis]]--
	--LuaPrint("ȡ��ɫ����bsadis") 
	local bsadis=GetChaAttr(a,ATTR_BADIS) 
	return bsadis 
end

function Adis_final(a)
	local adis_final=(BSAdis(a) * AdisIa(a) + AdisIb(a) ) * math.max ( 0 , AdisSa(a) ) + AdisSb(a) --[[ȡ��ʱʵ��adis]]--
	return adis_final 
end 

function BSMspd(a) --[[ȡ����mspd]]--
	--LuaPrint("ȡ��ɫ����bsmspd") 
	local bsmspd=GetChaAttr(a,ATTR_BMSPD) 
	return bsmspd 
end

function Mspd_final(a)
	local mspd_final=math.max ( BSMspd(a) * 0.3 , ( (BSMspd(a) * MspdIa(a) + MspdIb(a) ) * math.max ( 0.3 , MspdSa(a))  + MspdSb(a) )  )  --[[ȡ��ʱʵ��mspd]]--
	return mspd_final 
end 

function BSCol(a) --[[ȡ����col]]--
	--LuaPrint("ȡ��ɫ����bscol") 
	local bscol=GetChaAttr(a,ATTR_BCOL) 
	return bscol 
end

function Col_final(a)
	local col_final=(BSCol(a) * ColIa(a) + ColIb(a) ) * math.max ( 0 , ColSa(a) ) + ColSb(a) --[[ȡ��ʱʵ��col]]--
	return col_final 
end 

function BSStr(a) --[[ȡ����str]]--
	--LuaPrint("ȡ��ɫ����bsstr") 
	local bsstr=GetChaAttr(a,ATTR_BSTR) 
	return bsstr 
end

function Str_final(a)
	local str_final=(BSStr(a) * StrIa(a) + StrIb(a) ) * math.max ( 0 , StrSa(a) ) + StrSb(a) --[[ȡ��ʱʵ��str]]--
	return str_final 
end 

function BSDex(a) --[[ȡ����dex]]--
	--LuaPrint("ȡ��ɫ����bsdex") 
	local bsdex=GetChaAttr(a,ATTR_BDEX) 
	return bsdex 
end

function Dex_final(a)
	local dex_final=(BSDex(a) * DexIa(a) + DexIb(a) ) * math.max ( 0 , DexSa(a) ) + DexSb(a) --[[ȡ��ʱʵ��dex]]--
	return dex_final 
end 

function BSAgi(a) --[[ȡ����agi]]--
	--LuaPrint("ȡ��ɫ����bsagi") 
	local bsagi=GetChaAttr(a,ATTR_BAGI) 
	return bsagi 
end

function Agi_final(a)
	local agi_final=(BSAgi(a) * AgiIa(a) + AgiIb(a) ) * math.max ( 0 , AgiSa(a) ) + AgiSb(a) --[[ȡ��ʱʵ��agi]]--
	return agi_final 
end 

function BSCon(a) --[[ȡ����con]]--
	--LuaPrint("ȡ��ɫ����bscon") 
	local bscon=GetChaAttr(a,ATTR_BCON) 
	return bscon 
end

function Con_final(a)
	local con_final=(BSCon(a) * ConIa(a) + ConIb(a)) * math.max ( 0 , ConSa(a) ) + ConSb(a) --[[ȡ��ʱʵ��con]]--
	return con_final 
end 

function BSSta(a) --[[ȡ����sta]]--
	--LuaPrint("ȡ��ɫ����bssta") 
	local bssta=GetChaAttr(a,ATTR_BSTA) 
	return bssta 
end

function Sta_final(a)
	local sta_final=(BSSta(a) * StaIa(a) + StaIb(a) ) * math.max ( 0 , StaSa(a) ) + StaSb(a) --[[ȡ��ʱʵ��sta]]--
	return sta_final 
end 

function BSLuk(a) --[[ȡ����luk]]--
	--LuaPrint("ȡ��ɫ����bsluk") 
	local bsluk=GetChaAttr(a,ATTR_BLUK) 
	return bsluk 
end

function Luk_final(a)
	local luk_final=(BSLuk(a)  *LukIa(a) + LukIb(a) ) * math.max ( 0 , LukSa(a) ) + LukSb(a) --[[ȡ��ʱʵ��luk]]--
	return luk_final 
end 



--ȡ��ֻ�������Ժ���-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Ship_BSMnatk ( ship_role )						--��ֻ������С����
	local ship_bsmnatk=GetChaAttr( ship_role , ATTR_BMNATK ) 
	return ship_bsmnatk 
end 

function Ship_BSMxatk ( ship_role )						--��ֻ������󹥻�
	local ship_bsmxatk=GetChaAttr( ship_role , ATTR_BMXATK ) 
	return ship_bsmxatk 
end 
	
function Ship_BSAdis ( ship_role )							--��ֻ������������
	local ship_bsadis=GetChaAttr( ship_role , ATTR_BADIS ) 
	return ship_bsadis  
end 

function Ship_BSCspd ( ship_role )							--�ڵ����������ٶ�
	local ship_bscspd=GetChaAttr( ship_role , ATTR_BOAT_BCSPD ) 
	return ship_bscspd  
end 

function Ship_BSAspd ( ship_role ) 						--�ڵ������������
	local ship_bsaspd=GetChaAttr( ship_role , ATTR_BASPD ) 
	return ship_bsaspd  
end 

function Ship_BSCrange ( ship_role ) 						--�ڵ�������ը��Χ
	local ship_bscrange=GetChaAttr( ship_role , ATTR_BOAT_BCRANGE ) 
	return ship_bscrange  
end 


function Ship_BSDef ( ship_role ) 							--��ֻ��������
	local ship_bsdef=GetChaAttr( ship_role , ATTR_BDEF ) 
	return ship_bsdef   
end 


function Ship_BSResist ( ship_role ) 						--��ֻ�����ֿ�
	local ship_bsresist=GetChaAttr( ship_role , ATTR_BPDEF ) 
	return ship_bsresist   
end 

function Ship_BSMxhp ( ship_role ) 						--��ֻ��������;�
	local ship_bsmxhp=GetChaAttr( ship_role , ATTR_BMXHP ) 
	return ship_bsmxhp    
end 

function Ship_BSHrec ( ship_role ) 						--��ֻ�����;ûظ��ٶ�
	local ship_bshrec=GetChaAttr( ship_role , ATTR_BHREC ) 
	return ship_bshrec 
end 

function Ship_BSSrec ( ship_role ) 							--��ֻ�������������ٶ�
	local ship_bssrec=GetChaAttr( ship_role , ATTR_BSREC ) 
	return ship_bssrec 
end 

function Ship_BSMspd ( ship_role ) 						--��ֻ�����ƶ��ٶ�
	local ship_bsmspd=GetChaAttr( ship_role , ATTR_BMSPD ) 
	return ship_bsmspd 
end 

function Ship_BSMxsp ( ship_role ) 						--��ֻ������󲹸�ֵ
	local ship_bsmxsp=GetChaAttr( ship_role , ATTR_BMXSP ) 
	return ship_bsmxsp 
end 


--ȡ���ﴬֻ���Եļ���Ӱ��--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Ship_MnatkSa ( cha_role )						--��ֻ������С������ɫ����ϵ��Ӱ��
	local ship_mnatksa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MNATK ) / ATTR_RADIX
	return ship_mnatksa 
end 

function Ship_MnatkSb ( cha_role )						--��ֻ������С������ɫ���ܳ���Ӱ��
	local ship_mnatksb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MNATK ) 
	return ship_mnatksb 
end 

function Ship_MxatkSa ( cha_role )						--��ֻ������󹥻���ɫ����ϵ��Ӱ��
	local ship_mxatksa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MXATK ) / ATTR_RADIX
	return ship_mxatksa 
end 

function Ship_MxatkSb ( cha_role )						--��ֻ������󹥻���ɫ���ܳ���Ӱ��
	local ship_mxatksb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MXATK ) 
	return ship_mxatksb 
end 
	
function Ship_AdisSa ( cha_role )							--��ֻ�������������ɫ����ϵ��Ӱ��
	local ship_adissa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_ADIS ) / ATTR_RADIX
	return ship_adissa  
end 

function Ship_AdisSb ( cha_role )							--��ֻ�������������ɫ���ܳ���Ӱ��
	local ship_adissb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_ADIS ) 
	return ship_adissb  
end 



function Ship_CspdSa ( cha_role )							--�ڵ����������ٶȽ�ɫ����ϵ��Ӱ��
	local ship_cspdsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_CSPD ) / ATTR_RADIX
	return ship_cspdsa  
end 

function Ship_CspdSb ( cha_role )							--�ڵ����������ٶȽ�ɫ���ܳ���Ӱ��
	local ship_cspdsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_CSPD ) 
	return ship_cspdsb  
end 



function Ship_AspdSa ( cha_role ) 						--�ڵ��������������ɫ����ϵ��Ӱ��
	local ship_aspdsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_ASPD ) / ATTR_RADIX
	return ship_aspdsa  
end 


function Ship_AspdSb ( cha_role ) 						--�ڵ��������������ɫ���ܳ���Ӱ��
	local ship_aspdsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_ASPD ) 
	return ship_aspdsb  
end 




function Ship_CrangeSa ( cha_role ) 						--�ڵ�������ը��Χ��ɫ����ϵ��Ӱ��
	local ship_crangesa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_CRANGE ) / ATTR_RADIX
	return ship_crangesa  
end 

function Ship_CrangeSb ( cha_role ) 						--�ڵ�������ը��Χ��ɫ���ܳ���Ӱ��
	local ship_crangesb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_CRANGE ) 
	return ship_crangesb  
end 




function Ship_DefSa ( cha_role ) 							--��ֻ����������ɫ����ϵ��Ӱ��
	local ship_defsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_DEF ) / ATTR_RADIX
	return ship_defsa   
end 

function Ship_DefSb ( cha_role ) 							--��ֻ����������ɫ���ܳ���Ӱ��
	local ship_defsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_DEF ) 
	return ship_defsb   
end 



function Ship_ResistSa ( cha_role ) 						--��ֻ�����ֿ���ɫ����ϵ��Ӱ��
	local ship_resistsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_RESIST ) / ATTR_RADIX
	return ship_resistsa   
end 

function Ship_ResistSb ( cha_role ) 						--��ֻ�����ֿ���ɫ���ܳ���Ӱ��
	local ship_resistsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_RESIST ) 
	return ship_resistsb   
end 



function Ship_MxhpSa ( cha_role ) 						--��ֻ��������;ý�ɫ����ϵ��Ӱ��
	local ship_mxhpsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MXUSE ) / ATTR_RADIX
	return ship_mxhpsa    
end 

function Ship_MxhpSb ( cha_role ) 						--��ֻ��������;ý�ɫ���ܳ���Ӱ��
	local ship_mxhpsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MXUSE ) 
	return ship_mxhpsb    
end 



function Ship_HrecSa ( cha_role ) 							--��ֻ�����;ûظ��ٶȽ�ɫ����ϵ��Ӱ��
	local ship_hrecsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_USEREC ) / ATTR_RADIX
	return ship_hrecsa 
end 

function Ship_HrecSb ( cha_role ) 						--��ֻ�����;ûظ��ٶȽ�ɫ���ܳ���Ӱ��
	local ship_hrecsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_USEREC ) 
	return ship_hrecsb 
end 



function Ship_SrecSa ( cha_role ) 							--��ֻ�������������ٶȽ�ɫ����ϵ��Ӱ��
	local ship_srecsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_EXP ) / ATTR_RADIX
	return ship_srecsa 
end 

function Ship_SrecSb ( cha_role ) 									--��ֻ�������������ٶȽ�ɫ���ܳ���Ӱ��
	local ship_srecsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_EXP ) 
	return ship_srecsb 
end 



function Ship_MspdSa ( cha_role ) 								--��ֻ�����ƶ��ٶȽ�ɫ����ϵ��Ӱ��
	local ship_mspdsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MSPD ) / ATTR_RADIX
	return ship_mspdsa 
end 

function Ship_MspdSb ( cha_role ) 								--��ֻ�����ƶ��ٶȽ�ɫ���ܳ���Ӱ��
	local ship_mspdsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MSPD ) 
	return ship_mspdsb 
end 



function Ship_MxspSa ( cha_role ) 									--��ֻ������󲹸�ֵ��ɫ����ϵ��Ӱ��
	local ship_mxspsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MXSPLY ) / ATTR_RADIX
	return ship_mxspsa 
end 

function Ship_MxspSb ( cha_role ) 								--��ֻ������󲹸�ֵ��ɫ���ܳ���Ӱ��
	local ship_mxspsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MXSPLY ) 
	return ship_mxspsb 
end 

--��ֻ�������Լ���--------------------------------------------------------------------------------------------------------------------------------------------------

function Ship_Mnatk_final ( cha_role , ship_role )							--���㴬ֻ��С����
	local ship_mnatk=  math.floor ( ( Ship_BSMnatk ( ship_role ) * Ship_MnatkSa ( cha_role ) + Ship_MnatkSb ( cha_role ) ) * MnatkSa ( ship_role ) + MnatkSb ( ship_role ) )
	return ship_mnatk 
end 

function Ship_Mnatk ( ship_role )										--��ֻ��С����
	local ship_mnatk=GetChaAttr( ship_role , ATTR_MNATK ) 
	return ship_mnatk 
end 

function Ship_Mxatk_final ( cha_role , ship_role )							--���㴬ֻ��󹥻�
	local ship_mxatk= math.floor ( ( Ship_BSMxatk ( ship_role ) * Ship_MxatkSa ( cha_role ) + Ship_MxatkSb ( cha_role ) ) * MxatkSa ( ship_role ) + MxatkSb ( ship_role ) )
	return ship_mxatk 
end 

function Ship_Mxatk ( ship_role )										--��ֻ��󹥻�
	local ship_mxatk=GetChaAttr( ship_role , ATTR_MXATK ) 
	return ship_mxatk 
end 


	
function Ship_Adis_final ( cha_role , ship_role )							--���㴬ֻ��������
	local ship_adis= math.floor ( ( Ship_BSAdis ( ship_role ) * Ship_AdisSa ( cha_role ) + Ship_AdisSb ( cha_role ) )  ) 
	return ship_adis 
end 

function Ship_Adis ( ship_role )										--��ֻ��������
	local ship_adis=GetChaAttr( ship_role , ATTR_ADIS ) 
	return ship_adis 
end 




function Ship_Cspd_final ( cha_role , ship_role )							--���㴬ֻ�ڵ������ٶ�
	local ship_cspd= math.floor ( ( Ship_BSCspd ( ship_role ) * Ship_CspdSa ( cha_role ) + Ship_CspdSb ( cha_role ) )  )
	return ship_cspd 
end 

function Ship_Cspd ( ship_role )										--��ֻ�ڵ������ٶ�
	local ship_cspd=GetChaAttr( ship_role , ATTR_BOAT_CSPD ) 
	return ship_cspd 
end 



function Ship_Aspd_final ( cha_role , ship_role ) 							--�����ڵ��������
	local ship_aspd= math.floor ((  Ship_BSAspd ( ship_role ) * Ship_AspdSa ( cha_role ) + Ship_AspdSb ( cha_role ) ) * AspdSa ( ship_role ) + AspdSb ( ship_role ) )
	return ship_aspd  
end 

function Ship_Aspd ( ship_role ) 										--�ڵ��������
	local ship_aspd=GetChaAttr( ship_role , ATTR_ASPD ) 
	return ship_aspd  
end 



function Ship_Crange_final (  cha_role , ship_role ) 							--�����ڵ���ը��Χ
	local ship_crange= math.floor ( ( Ship_BSCrange ( ship_role ) * Ship_CrangeSa ( cha_role ) + Ship_CrangeSb ( cha_role ) )  ) 
	return ship_crange  
end 

function Ship_Crange ( ship_role ) 										--�ڵ���ը��Χ
	local ship_crange=GetChaAttr( ship_role , ATTR_CRANGE ) 
	return ship_crange  
end 




function Ship_Def_final ( cha_role , ship_role ) 							--���㴬ֻ����
	local ship_def= math.floor ( ( Ship_BSDef ( ship_role ) * Ship_DefSa ( cha_role ) + Ship_DefSb ( cha_role ) ) * DefSa ( ship_role ) + DefSb ( ship_role ) ) 
	return ship_def  
end 

function Ship_Def ( ship_role ) 										--��ֻ����
	local ship_def=GetChaAttr( ship_role , ATTR_DEF ) 
	return ship_def  
end 



function Ship_Resist_final (  cha_role ,ship_role ) 							--���㴬ֻ�ֿ�
	local ship_resist= math.floor ( ( Ship_BSResist ( ship_role ) * Ship_ResistSa ( cha_role ) + Ship_ResistSb ( cha_role ) ) * ResistSa ( ship_role ) + ResistSb ( ship_role ) ) 
	return ship_resist  
end 

function Ship_Resistl ( ship_role ) 										--��ֻ�ֿ�
	local ship_resist=GetChaAttr( ship_role , ATTR_PDEF ) 
	return ship_resist  
end 



function Ship_Mxhp_final (  cha_role ,ship_role ) 							--���㴬ֻ����;�
	local ship_mxhp= math.floor ( ( Ship_BSMxhp ( ship_role ) * Ship_MxhpSa ( cha_role ) + Ship_MxhpSb ( cha_role ) ) * MxhpSa ( ship_role ) + MxhpSb ( ship_role ) ) 
	return ship_mxhp  
end 

function Ship_Mxhp ( ship_role ) 										--��ֻ����;�
	local ship_mxhp=GetChaAttr( ship_role , ATTR_MXHP ) 
	return ship_mxhp  
end 

function Ship_Hp ( ship_role )										--��ֻ��ǰ�;�
	local ship_hp=GetChaAttr( ship_role , ATTR_HP ) 
	return ship_hp  
end 

function Ship_Hrec_final (  cha_role ,ship_role ) 							--���㴬ֻ�;ûظ��ٶ�
	local ship_hrec= math.floor ( ( Ship_BSHrec ( ship_role ) * Ship_HrecSa ( cha_role ) + Ship_HrecSb ( cha_role ) ) * HrecSa ( ship_role ) + HrecSb ( ship_role )  ) 
	return ship_hrec  
end 

function Ship_Hrec (  ship_role ) 										--��ֻ�;ûظ��ٶ�
	local ship_hrec=GetChaAttr( ship_role , ATTR_HREC ) 
	return ship_hrec  
end 


function Ship_Srec_final (  cha_role ,ship_role ) 							--���㴬ֻ���������ٶ�
	local ship_srec= math.floor ( ( Ship_BSSrec ( ship_role ) * Ship_SrecSa ( cha_role ) + Ship_SrecSb ( cha_role ) ) * SrecSa ( ship_role ) + SrecSb ( ship_role ) ) 
	return ship_srec  
end 

function Ship_Srec ( ship_role ) 										--��ֻ���������ٶ�
	local ship_srec=GetChaAttr( ship_role , ATTR_SREC ) 
	return ship_srec  
end 




function Ship_Mspd_final (  cha_role ,ship_role ) 							--���㴬ֻ�ƶ��ٶ�
	local ship_mspd= math.floor ( ( Ship_BSMspd ( ship_role ) * Ship_MspdSa ( cha_role ) + Ship_MspdSb ( cha_role ) ) * MspdSa ( ship_role ) + MspdSb ( ship_role ) ) 
	return ship_mspd  
end 

function Ship_Mspd ( ship_role ) 										--��ֻ�ƶ��ٶ�
	local ship_mspd=GetChaAttr( ship_role , ATTR_MSPD ) 
	return ship_mspd  
end 



function Ship_Mxsp_final (  cha_role ,ship_role ) 									--��ֻ��󲹸�ֵ
	local ship_mxsp= math.floor ( ( Ship_BSMxsp ( ship_role ) * Ship_MxspSa ( cha_role ) + Ship_MxspSb ( cha_role ) ) * MxspSa ( ship_role ) + MxspSb ( ship_role ) ) 
	return ship_mxsp  
end 

function Ship_Mxsp ( ship_role ) 										--��ֻ��󲹸�ֵ
	local ship_mxsp=GetChaAttr( ship_role , ATTR_MXSP ) 
	return ship_mxsp  
end 

function Ship_Sp ( ship_role )										--��ֻ��ǰ����ֵ
	local ship_sp=GetChaAttr( ship_role , ATTR_SP ) 
	return ship_sp  
end 







function Percentage_Random(a) 
	local x,y=a*1000000000,math.random(0,1000000000) 
	local z 
	if y<=x   then 
		z=1 
		else z=0 
	end 
	return z 
end 



function Dis(a,b,c,d) --[[��(a,b)��(c,d)����]]--
	local x1,y1,x2,y2=a,b,c,d 
	local dis=math.pow( math.pow(x1-x2, 2) + math.pow(y1-y2, 2), 0.5) 
	return dis 
end 

function Check_Direction(a) --�ж���ɫ������,x���������Ϊ1�������ߣ���ʱ������Ϊ2��3��4��5��6��7��8
	--LuaPrint("Enter function Check_Direction(a) --�ж���ɫ������,x���������Ϊ1�������ߣ���ʱ������Ϊ2��3��4��5��6��7��8") 
	local direction=GetChaAttr(a, ATTR_DIREC) 
	local division 
	if ((direction>=337.5) and (direction<360)) or ((direction>=0) and (direction<22.5))   then 
		division=1 
	elseif (direction>=22.5) and (direction<67.5)   then 
		division=2 
	elseif (direction>=67.5) and (direction<112.5)   then 
		division=1 
	elseif (direction>=112.5) and (direction<157.5)   then 
		division=8 
	elseif (direction>=157.5) and (direction<202.5)   then 
		division=7 
	elseif (direction>=202.5) and (direction<247.5)   then 
		division=6 
	elseif (direction>=247.5) and (direction<292.5)   then 
		division=5 
	elseif (direction>=292.5) and (direction<337.5)   then 
		division=4 
	else --LuaPrint("�����ɫ������Ƕ�".."\n" ) 
      return 
   end 

	--LuaPrint("Out function Check_Direction(a) --[[�ж���ɫ������,x���������Ϊ1�������ߣ���ʱ������Ϊ2��3��4��5��6��7��8�]]--") 
	return division 
end 


function Hp_Dmg(role,dmg) --[[����hp���Ĵ���ʽ]]--

	local map_name_DEFER = GetChaMapName ( role )
	local Can_Pk_Garner2 = Is_NormalMonster (role)
	local T=0.25	
	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2"   then
		if Can_Pk_Garner2 == 0   then
			dmg = dmg * T
		end
	end	
	
	--LuaPrint("Enter function Hp_Dmg(role,dmg) --[[hp���Ĵ���ʽ]]--") 
	--Notice("dmg3="..dmg)
	local statelv_mfd = GetChaStateLv ( role , STATE_MFD ) 
	local hp = Hp(role) 
	local sp = Sp(role) 
	if dmg <= 0   then 
		hp = hp - dmg 
		SetCharaAttr(hp, role, ATTR_HP )  
		return 
	end 
	
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0   then
		local Elf_Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Elf_Num , 0 , 1 )
		local PowerSheild = 0
		if CheckElfSkill == 2   then
			PowerSheild = ElfSKill_PowerSheild ( role , Elf_Item , Elf_Num , dmg )
			if PowerSheild ~= 0   then
				CALCULATE_FUNCTIONS_LUA_000003 = GetResString("CALCULATE_FUNCTIONS_LUA_000003")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000003 )
			end
			dmg = dmg - PowerSheild
		end
	end

	if statelv_mfd >= 1   then 
		sp_change = statelv_mfd * 0.25 + 0.5
	--local map_name_ATKER = GetChaMapName ( a )
	local map_name_DEFER = GetChaMapName ( role )
	local Can_Pk_Garner2 = Is_NormalMonster (role)
		
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2"   then
	--	Notice("22")
			if Can_Pk_Garner2 == 0   then
				sp_change = statelv_mfd * 0.25 + 0.5
			end
		end
		local Check_Heilong  = CheckItem_Heilong ( role )
		if Check_Heilong == 1   then
			local Percentage = Percentage_Random ( 0.5 )
			if Percentage == 1   then
				  sp_change =  sp_change*1.5
				CALCULATE_FUNCTIONS_LUA_000004 = GetResString("CALCULATE_FUNCTIONS_LUA_000004")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000004)
			end
		end
		local CheckItem_fighting = CheckItem_fighting ( role )
		local IsGarnerWiner = IsGarnerWiner(role)
		if CheckItem_fighting == 1   then
			if IsGarnerWiner == 1    then 
				local Percentage_1 = Percentage_Random ( 0.5 )
				if Percentage_1 == 1   then
					dmg = dmg*0.5
					CALCULATE_FUNCTIONS_LUA_000005 = GetResString("CALCULATE_FUNCTIONS_LUA_000005")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000005 )
				end
			elseif IsGarnerWiner == 2    then
				local Percentage_2 = Percentage_Random ( 0.5 )
				if Percentage_2 == 1   then
					dmg = dmg*0.6
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
			
				end
			elseif IsGarnerWiner == 3    then
				local Percentage_3 = Percentage_Random ( 0.5 )
				if Percentage_3 == 1   then
					dmg = dmg*0.7
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
			
				end
			elseif IsGarnerWiner == 4    then
				local Percentage_4 = Percentage_Random ( 0.5 )
				if Percentage_4 == 1   then
					dmg = dmg*0.8
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
			
				end
			elseif IsGarnerWiner == 5   then
				local Percentage_5 = Percentage_Random ( 0.3 )
				if Percentage_5 == 1   then
					dmg = dmg*0.8
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
		
				end
			end	
		end
		if dmg / sp_change <= sp   then 
			sp = math.floor ( sp - dmg/sp_change ) 
		else 
			hp =math.floor ( hp - ( dmg/sp_change - sp ) ) 
			sp = 0 
			RemoveState ( role , STATE_MFD ) 
		end 
		else
		local Check_Nianshou = CheckItem_Nianshou ( role )
		local CheckItem_fighting = CheckItem_fighting ( role )
		local IsGarnerWiner = IsGarnerWiner(role)
		local Check_lufei = CheckItem_lufei ( role )
		if Check_lufei == 1   then
			local Percentage = Percentage_Random ( 0.25 )
			if Percentage == 1   then
				dmg = dmg * -1
				CALCULATE_FUNCTIONS_LUA_000007 = GetResString("CALCULATE_FUNCTIONS_LUA_000007")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000007)
			end
		end
		if Check_Nianshou == 1   then
			local Percentage = Percentage_Random ( 0.1 )
			if Percentage == 1   then
				dmg = dmg * -1
				CALCULATE_FUNCTIONS_LUA_000008 = GetResString("CALCULATE_FUNCTIONS_LUA_000008")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000008)
			end
		end

		
		if CheckItem_fighting == 1   then
			if IsGarnerWiner == 1    then 
				local Percentage_1 = Percentage_Random ( 0.5 )
				if Percentage_1 == 1   then
					dmg = dmg*0.5
					CALCULATE_FUNCTIONS_LUA_000005 = GetResString("CALCULATE_FUNCTIONS_LUA_000005")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000005 )
				end
			elseif IsGarnerWiner == 2    then
				local Percentage_2 = Percentage_Random ( 0.5 )
				if Percentage_2 == 1   then
					dmg = dmg*0.6
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
			
				end
			elseif IsGarnerWiner == 3    then
				local Percentage_3 = Percentage_Random ( 0.5 )
				if Percentage_3 == 1   then
					dmg = dmg*0.7
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
			
				end
			elseif IsGarnerWiner == 4    then
				local Percentage_4 = Percentage_Random ( 0.5 )
				if Percentage_4 == 1   then
					dmg = dmg*0.8
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
			
				end
			elseif IsGarnerWiner == 5   then
				local Percentage_5 = Percentage_Random ( 0.3 )
				if Percentage_5 == 1   then
					dmg = dmg*0.8
					CALCULATE_FUNCTIONS_LUA_000006 = GetResString("CALCULATE_FUNCTIONS_LUA_000006")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000006 )
		
				end
			end	
		end
	
	--local map_name_ATKER = GetChaMapName ( role )
		local ZSExp = GetChaAttr( role , ATTR_CSAILEXP )
		if ZSExp > 0 and ZSExp < 100   then
			dmg = dmg * 0.945
		end
		if ZSExp >= 100 and ZSExp < 12100   then
			dmg = dmg * ( 0.95 - math.floor( math.pow( (ZSExp / 100) , 0.5 )) * 0.005)
		end
		hp = Hp(role) - dmg 
	end 
	SetCharaAttr(sp, role, ATTR_SP ) 
	SetCharaAttr(hp, role, ATTR_HP )  
	--LuaPrint("Out function Hp_Dmg(role,dmg) --[[hp���Ĵ���ʽ]]--") 
end 


function Endure_Dmg ( role , dmg ) 
	local hp = Hp ( role ) - dmg 
	SetCharaAttr(hp, role, ATTR_HP ) 
end 
	

function Sp_Red(role,sp_reduce) --[[sp���Ĵ���ʽ]]--
	--LuaPrint("Enter function Sp_Red(role,spreduce) --[[sp���Ĵ���ʽ]]--") 
	local sp = Sp(role) - sp_reduce 
	--LG("sp_red", "before_sp = " , Sp(role) , " sp_reduce = " , sp_reduce , "final_sp = " , sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP ) 
	--LuaPrint("Out function Sp_Red(role,spreduce) --[[sp���Ĵ���ʽ]]--") 
end 

function Coefficientadjust_Steady_atk()	--[[�����ȶ�����ϵ��]]--
	--LuaPrint("Enter function Coefficientadjust_Steady_atk()	--[[�����ȶ�����ϵ��]]--") 
	local steady_atk_maxreduce = 0.9 
	local steady_atk_maxreducepoint = 0.99 
	local steady_atk_maxluk=1500 
	local a = steady_atk_maxreduce / steady_atk_maxluk 
	local b = steady_atk_maxreducepoint / steady_atk_maxluk 
	--LuaPrint("Out function Coefficientadjust_Steady_atk()	--[[�����ȶ�����ϵ��]]--") 
	return a,b,steady_atk_maxreduce,steady_atk_maxreducepoint 
end 

function SetSteady_atk(a) --[[�趨�������ȶ���]]--
	--LuaPrint("Enter function SetSteady_atk(a) --[[�趨�������ȶ���]]--") 
	local x,y,m,n = Coefficientadjust_Steady_atk() --[[�����ȶ�����ϵ��]]--
	local sum=1 
	local atkstep={} --[[ÿ��������ռ����]]--
	local atk={} --[[ÿ������ռ�������ֵ��Χ]]--
	atk[Mnatk_final(a) - 1 ] = 0 
	for i = Mnatk_final(a),  Mxatk_final(a), 1 do 
		atkstep[i] = 1 
	end 
	local maxreduce = math.min(m, Luk_final(a) * x ) 
	local reducepoint = math.min(n, Luk_final(a) * y ) * (Mxatk_final(a) - Mnatk_final(a) ) 
	if reducepoint==0   then 
		--LuaPrint("�޹�������".."\n") 
		atk[Mnatk_final(a)] = 1 
	return atk,sum 
	end --[[�����޹�����������������С������ȡ�ø���Ϊ1]]--
	local steady_step = maxreduce / reducepoint 
	for i = 0, Mxatk_final(a) - Mnatk_final(a), 1 do 
		atkstep[ i + Mnatk_final(a) ] = atkstep [ i + Mnatk_final(a) ] - math.max(0, (maxreduce-i * steady_step) ) 
		sum = sum + atkstep[ i + Mnatk_final(a) ]  
		atk[ i + Mnatk_final(a) ] = sum 
	end 
	--local gatk = 0 
	--for i = Mnatk_final(a), Mxatk_final(a), 1 do 
	--ccc = (atk[i]-atk[i-1]) / sum 
	--gatk = gatk + i * ccc --[[ƽ��������]]--
	--end 
	--LuaPrint("Out function SetSteady_atk(a) --[[�趨�������ȶ���]]--") 
	return atk,sum 
end 
	
	
function CheckSteady_atk(a) --[[�ȶ������ж�]]--
	--LuaPrint("Enter function CheckSteady_atk(a) --[[�ȶ������ж�]]--") 
	local atk,sum = SetSteady_atk(a) 
	local x = math.random( 0, 10000 ) 
	local y = x * sum/10000 
	for i = Mnatk_final(a), Mxatk_final(a), 1 do 
      if y<=atk[i]   then 
         return i 
      end 
   end 
	--LuaPrint ("���������е���������������С������".."\n") 
	--LuaPrint("Out function CheckSteady_atk(a) --[[�ȶ������ж�]]--") 
	return Mnatk_fianl(a) 
end 
	

--	function  Skadd_Check( job , lv , tp , form_sklv)									--ѧϰ�����ж�
--		LG( "Skadd", "enter function  Skadd_Check :" ) 
--		local itemuse = 0 
--		local cha_job = GetChaAttr( ATKER , ATTR_JOB ) 
--		if  cha_job ~= job   then 
--			LG( "Skadd", "function Skadd:", "�޷�ʹ�ã�ְҵ����" ) 
--			itemuse = 1 
--		end 
--		local cha_lv = GetChaAttr( ATKER , ATTR_LV ) 
--		if cha_lv < lv   then 
--			LG( "Skadd", "function Skadd:", "�޷�ʹ�ã�����ȼ�����" ) 
--			itemuse = 2 
--		end 
--		local cha_tp = GetChaAttr( ATKER , ATTR_TP ) 
--		if cha_tp < tp   then 
--			LG( "Skadd", "function Skadd:", "�޷�ʹ�ã����ܵ㲻��" ) 
--			itemuse = 3 
--		end 
--		if form_sklv > 0   then 
--			LG( "Skadd", "function Skadd:", "�޷�ʹ�ã���ϰ�øü���" ) 
--			itemuse = 4 
--		end 
--		LG( "Skadd", "out function  Skadd_Check :" ) 
--		return itemuse 
--	end 
	
	
	
	
function Lefthand_Atk ( role , atk )												--˫������״̬                        
	local sklv = GetSkillLv ( role , STATE_FSZ ) 
	add_atk = math.floor ( atk * ( 1.2 + sklv * 0.08 ) ) 
	return add_atk 
end 

function Check_Zmyj ( role , dmg_mul )												--�������һ��״̬
	local statelv = GetChaStateLv ( role , STATE_ZMYJ ) 
	local crt_rad = 0.2 + statelv * 0.02 
	if dmg_mul == 2 or dmg_mul == 1   then 
		a = Percentage_Random ( crt_rad ) 
		if a== 1   then 
			dmg_mul = 2 + statelv/2 
		end 
	end 
	return dmg_mul 
end 
	
function Check_Smyb ( role )													--�������һ��״̬
	local statelv = GetChaStateLv (role , STATE_SMYB ) 
	local hp = Hp ( role ) 
	local mxhp = Mxhp ( role ) 
	local atk_sa = 1 
	if hp <= mxhp * 0.2 and hp > 0   then 
		atk_sa = 1 + statelv * 0.1 
	end 
	local mnatk = Mnatk ( role ) * atk_sa 
	local mxatk = Mxatk ( role ) * atk_sa 
	return mnatk , mxatk 
end 


--����ɫ����״̬���Ƴ������ߵ�����״̬��������������������������������������������������������������������

function Check_Ys_Rem ( role_atk , role_def )	
	Check_State ( role_atk , role_def ) 
	if atk_statecheck[STATE_YS] >= 1   then 
		RemoveState ( role_atk , STATE_YS ) 
	end 
end 

function Check_Bshd (statelv) 
	local statetime = 3 + statelv * 1 
	return statetime 
end 

function Atk_Raise ( rad , atker , defer )			--���ܹ�������
	local atk = rad * math.random ( Mnatk( atker ) , Mxatk ( atker ) ) 
	local defer_def = Def ( defer ) 
	local defer_resist = Resist ( defer ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist ) 
	return dmg 
end 

function TurnToCha ( role ) 
	local x_role = role 
	if ChaIsBoat ( role ) == 1   then 
		x_role = GetMainCha ( role ) 
	end 
	return x_role 
end 

function TurnToShip ( role ) 
	local x_role = role 
	if ChaIsBoat ( role ) == 0   then 
		x_role = GetCtrlBoat ( role ) 
		if x_role == nil   then 
			LG ( "getshipid_err" , " get a nil shipid " ) 
		end 
	end 
	return x_role 
end 

function ALLExAttrSet ( role )				--���ݽ�ɫ��̬�ֱ�ˢ�µ�ǰ����
	if IsPlayer ( role ) == 0   then				--��ɫΪ����
		ExAttrSet ( role ) 
		return 
	end 
	if ChaIsBoat ( role ) == 0   then			--��ɫ��̬Ϊ����
		AttrRecheck ( role ) 
	else								--��ɫ��̬Ϊ��ֻ
		cha_role = GetMainCha ( role ) 
		ShipAttrRecheck ( cha_role , role ) 
	end 
end 

function Hp_Endure_Dmg ( role , dmg ) 
	if ChaIsBoat ( role ) == 0   then 
		Hp_Dmg ( role , dmg ) 
		local state_ys_lv =  GetChaStateLv (role , STATE_YS ) 
		if state_ys_lv >= 1   then 
			RemoveState ( role , STATE_YS ) 
		end 
	else 
		Endure_Dmg ( role , dmg ) 
	end 
end 

----���㴬ֻ�ɳ�����------------------------------------------------------------------------------
function Boat_plus_MNATk( Lv , mnatk)
	local mnatk_new = 0
	
	if Lv < 1   then
		CALCULATE_FUNCTIONS_LUA_000009 = GetResString("CALCULATE_FUNCTIONS_LUA_000009")
		LG("Boat_plus_MNatk",CALCULATE_FUNCTIONS_LUA_000009)
		LG("Boat_plus_MNatk","1")
		return mnatk
	end
	
	if Lv > 100   then
		CALCULATE_FUNCTIONS_LUA_000010 = GetResString("CALCULATE_FUNCTIONS_LUA_000010")
		LG("Boat_plus_MNatk",CALCULATE_FUNCTIONS_LUA_000010)
		CALCULATE_FUNCTIONS_LUA_000011 = GetResString("CALCULATE_FUNCTIONS_LUA_000011")
		LG("Boat_plus_MNatk",CALCULATE_FUNCTIONS_LUA_000011)

		return mnatk
	end
	
	if Lv < 60   then
		LG ( "Boat_plus_MNatk" , mnatk ) 
		mnatk_new = ( 1 + ( Lv - 20 ) / 120 ) * mnatk
		CALCULATE_FUNCTIONS_LUA_000012 = GetResString("CALCULATE_FUNCTIONS_LUA_000012")
		LG("Boat_plus_MNatk",CALCULATE_FUNCTIONS_LUA_000012)

		return mnatk_new
	end
	
	if Lv >=60   then
		mnatk_new = ( 1 + ( 60 - 20 ) / 120 ) * mnatk + ( Lv - 60 ) * 5
		CALCULATE_FUNCTIONS_LUA_000013 = GetResString("CALCULATE_FUNCTIONS_LUA_000013")
		LG("Boat_plus_MNatk",CALCULATE_FUNCTIONS_LUA_000013)

		return mnatk_new
	end
	

end

function Boat_plus_MXATk( Lv , mxatk)
	local mxatk_new = 0
	
	if Lv < 1   then
		CALCULATE_FUNCTIONS_LUA_000009 = GetResString("CALCULATE_FUNCTIONS_LUA_000009")
		LG("Boat_plus_MXatk",CALCULATE_FUNCTIONS_LUA_000009)
		return mxatk_new
	end
	
	if Lv > 100   then
		CALCULATE_FUNCTIONS_LUA_000010 = GetResString("CALCULATE_FUNCTIONS_LUA_000010")
		LG("Boat_plus_MXatk",CALCULATE_FUNCTIONS_LUA_000010)
		return mxatk_new
	end
	
	if Lv < 60   then
		mxatk_new = ( 1 + ( Lv - 20 ) / 120 ) * mxatk
		return mxatk_new
	end
	
	if Lv >=60   then
		mxatk_new = ( 1 + ( 60 - 20 ) / 120 ) * mxatk + ( Lv - 60 ) * 5
		return mxatk_new
	end
	

end

function Boat_plus_def ( Lv , def )
	local def_new = 0
	
	if  Lv < 1   then
		CALCULATE_FUNCTIONS_LUA_000009 = GetResString("CALCULATE_FUNCTIONS_LUA_000009")
		LG("Boat_plus_def",CALCULATE_FUNCTIONS_LUA_000009)
		return def
	end
	
	if Lv > 100   then
		CALCULATE_FUNCTIONS_LUA_000010 = GetResString("CALCULATE_FUNCTIONS_LUA_000010")
		LG("Boat_plus_def",CALCULATE_FUNCTIONS_LUA_000010)
		return def
	end
	
	if Lv < 60   then
		def_new = ( 1 + ( Lv - 20 ) / 120 ) * def
		LG ( "Boat_plus_def","def_new1 = " ,  def_new ) 
		return def_new

	end
	
	if Lv >= 60   then
		def_new = ( 1 + ( 60 - 20 ) / 120 ) * def + ( Lv - 60 ) * 3
		LG ( "Boat_plus_def","def_new2 = " ,  def_new ) 
		return def_new
	end
	

end

function Boat_plus_Mxhp ( Lv , Mxhp )
	local Mxhp_new = 0
	
	if Lv < 1   then
		CALCULATE_FUNCTIONS_LUA_000009 = GetResString("CALCULATE_FUNCTIONS_LUA_000009")
		LG("Boat_plus_Mxhp",CALCULATE_FUNCTIONS_LUA_000009)
		return Mxhp
	end
	
	if Lv > 100   then
		CALCULATE_FUNCTIONS_LUA_000010 = GetResString("CALCULATE_FUNCTIONS_LUA_000010")
		LG("Boat_plus_Mxhp",CALCULATE_FUNCTIONS_LUA_000010)
		return Mxhp
	end
	
	if Lv < 60   then
		Mxhp_new = ( 1 + ( Lv - 20 ) / 120 ) * Mxhp
		LG ( "Boat_plus_def","def_new2 = " ,  Mxhp_new ) 
		return Mxhp_new
	end
	
	if Lv >= 60   then
		Mxhp_new = ( 1 + ( 60 - 20 ) / 120 ) * Mxhp + (Lv - 60 )  * 20
		LG ( "Boat_plus_def","def_new2 = " ,  Mxhp_new ) 
		return Mxhp_new
	end
end

function Boat_plus_Mspd ( Lv , Mspd )
	local Mspd_new = 0

	if Lv < 1   then
		CALCULATE_FUNCTIONS_LUA_000009 = GetResString("CALCULATE_FUNCTIONS_LUA_000009")
		LG("Boat_plus_Mspd",CALCULATE_FUNCTIONS_LUA_000009)
		return Mspd
	end
	
	if Lv >100   then
		CALCULATE_FUNCTIONS_LUA_000014 = GetResString("CALCULATE_FUNCTIONS_LUA_000014")
		LG("Boat_plus_Mspd",CALCULATE_FUNCTIONS_LUA_000014)
		return Mspd
	end
	
	if Lv < 60   then
		Mspd_new = ( 1 + ( Lv -30) / 300 ) * Mspd
		return Mspd_new
	end

	if Lv >=60   then
		Mspd_new = ( 1 + ( 60 -30) / 300 ) * Mspd
		return Mspd_new
	end

end

--ȡ��ɫ������
function get_cha_guild_id(cha) 
    local ply_cha = CheckChaRole(cha) 
    if ply_cha == 1   then --��ҽ�ɫ
        return GetChaGuildID(cha) 
    else 
        local map_copy = GetChaMapCopy(cha)
        local side_id = GetChaSideID(cha) 
		if side_id == 1   then
			return GetMapCopyParam2(map_copy, 4 ) 
		elseif side_id == 2   then
			return GetMapCopyParam2(map_copy, 3 ) 
		end
    end 

end

--�жϽ�ɫcha1��cha2�Ƿ����ڶ��ѡ�
--�Ƕ����򷵻�1�����򷵻�0
function is_teammate(cha1, cha2) 
    if cha1 == 0 or cha2 == 0   then 
        return 0 
    end 
    if cha1 == cha2   then 
        return 1 
    end
    local ply1 = GetChaPlayer(cha1) 
    local ply2 = GetChaPlayer(cha2) 
    if ply1 ~= 0 and ply2 ~= 0   then 
        if ply1 == ply2   then 
            return 1 
        end 
        local team_id1, team_id2 
        team_id1 = GetChaTeamID(cha1) 
        team_id2 = GetChaTeamID(cha2) 
        if team_id1 ~= 0 and team_id2 ~= 0 and team_id1 == team_id2   then 
            return 1 
        end 
    end 

    return 0 
end 

--�жϽ�ɫcha2�Ƿ���cha1���ѷ���
--���ѷ��򷵻�1�����򷵻�0
function is_friend(cha1, cha2) 
--	SystemNotice ( cha1, "����is_friend" ) 
    local friend_target = 1 
    local Map_type = GetChaMapType( cha1 )
    if CheckChaRole( cha1 ) == 0 and Map_type ~= 2   then			--���cha1Ϊ�����Ҳ��ڹ����ͼ�У���cha2Ϊ����Ϊ�ѷ���cha2Ϊ��Ϊ�з�
	if CheckChaRole( cha2 ) == 0   then							
		return 1 
	else 
		return 0 
	end 

    end
	   
--		SystemNotice ( cha1 , "1" ) 
--		SystemNotice ( cha1 , "Map_type ="..Map_type ) 
--	    if Map_type == 4   then									--�Թ�PK��ͼ�ѷ��ж�
--		local team = is_teammate(cha1, cha2) 
--		if team == 1   then 
--			return 1 
--		end 
--	    else
--		return 0
--	    end
		if Map_type == 1   then 
			if CheckChaRole ( cha1 ) == 1   then 
					if CheckChaRole( cha2 ) == 0   then							
						return 0 
					else 
						return 1 
					end 

			end 
		end

		if Map_type == 4   then									--�Թ�PK��ͼ�ѷ��ж�
			if Is_NormalMonster (cha1) == 1   then						--�������ͨ��������������ѷ�
				if Is_NormalMonster (cha2) == 1   then 
					return 1 
				end 
			end 
			local team = is_teammate(cha1,cha2) 
			if team == 1   then 
				return 1 
			else 
				local guild_id1, guild_id2 
				guild_id1 = get_cha_guild_id(cha1) 
				guild_id2 = get_cha_guild_id(cha2) 
				if guild_id1 ~= 0 and guild_id2 ~= 0 and guild_id1 == guild_id2   then 
					return 1  
				else
					return 0 
				end
			end
			--local team = is_teammate(cha1,cha2) 
			--		if team == 1   then 
			--			return 1 
			--		else 
			--			return 0 
			--		end 
		end 

--	        SystemNotice ( cha1 , "2" ) 

	    if  Map_type ==3   then									--�Ƕ���ս��ͼ�����Ϊ�ѷ�
--		SystemNotice ( cha1 , "1" ) 
		    local team = is_teammate(cha1, cha2) 
--		    		SystemNotice ( cha1 , "2" ) 

		    if team == 1   then 
--		    		SystemNotice ( cha1 , "3" ) 
		        return 1 
		    else 
			return 0 
		    end
		   
	    end

	    if cha1 == 0 or cha2 == 0   then							--ָ��Ϊ��
	        return 0 
	    end 
--		SystemNotice ( cha1 , "3" ) 
	    if Map_type == 2   then									--����PK��ͼ�ж�
		if Is_NormalMonster (cha1) == 1   then						--�������ͨ��������������ѷ�
			if Is_NormalMonster (cha2) == 1   then 
				return 1 
			end 
		end 
		local guild_id1, guild_id2 
		guild_id1 = get_cha_guild_id(cha1) 
		guild_id2 = get_cha_guild_id(cha2) 
		if guild_id1 ~= 0 and guild_id2 ~= 0 and guild_id1 == guild_id2   then 
			return 1 
		else 
			return 0 
		end

	    end 

 	  if Map_type == 10   then
		if Is_NormalMonster (cha1) == 1   then						--�������ͨ��������������ѷ�
			if Is_NormalMonster (cha2) == 1   then 
					return 1 
			end 
		end 

		--if CheckChaRole(cha1) == 1 and CheckChaRole(cha2) == 1   then
			 ---local lv1 = GetChaAttr(cha1, ATTR_LV)
			 --local lv2 = GetChaAttr(cha2, ATTR_LV)
			-- if math.abs(lv1 - lv2)>9   then
				--return 1
			--end
		--end

		local team = is_teammate(cha1,cha2) 

		if team == 1   then 
			return 1 
		else 
			local guild_id1, guild_id2 
			guild_id1 = get_cha_guild_id(cha1) 
			guild_id2 = get_cha_guild_id(cha2) 
			if guild_id1 ~= 0 and guild_id2 ~= 0 and guild_id1 == guild_id2   then 
				SystemNotice ( role , " PK are not allow if you are 9 levels above the other player." )

				return 1  
			else
				return 0 
			end
		end
	    end

	    if Map_type == 5   then									--����PK��ͼ�ж�
--		if Is_NormalMonster (cha1) == 1   then						--�������ͨ��������������ѷ�
--			if Is_NormalMonster (cha2) == 1   then 
--				return 1 
--			end 
--		end 
		local guild_side_1, guild_side_2 
		guild_side_1 = GetChaSideID(cha1) 
		guild_side_2 = GetChaSideID(cha2) 
		--if guild_side_1 <= 100 and guild_side_1 > 0 and guild_side_2 <= 100 and guild_side_2 > 0   then
		if guild_side_1 == guild_side_2   then
			return 1 
		--elseif
		   --guild_side_1 > 100 and guild_side_1 <= 200 and guild_side_2 > 100 and guild_side_2 <= 200   then
			--return 1
	        else
		        return 0
		end

	    end 
--		SystemNotice ( cha1 , "4" ) 

	    return friend_target 
 end 
--	    local is_plycha1 = CheckChaRole(cha1) 
--	    local is_plycha2 = CheckChaRole(cha2) 
--	    local can_PK1 = CheckChaPKState(cha1) 
--	    if can_PK1 == 0   then 
--	        if is_plycha1 ~= 0 and is_plycha2 ~= 0   then 
--	            return 1 
--	        end 
--	        if is_plycha1 == 0 and is_plycha2 == 0   then 
--	            return 1 
--	        end 
--	    end 
  --  end
--    return 0
-- end 

--��ͨ���ж�
function Is_NormalMonster ( role )
  local cha = TurnToCha ( role )
  local Cha_Num = GetChaTypeID( cha )
  
  for i = 0 , UnNormalMonster_Num , 1 do
	if Cha_Num == UnNormalMonster_ID [i]   then
		return 0
	end
  end
  

  return 1
  
end

--�������Ƿ��������Ѳ�����
function CheckMonsterDead ( role )
	if role == nil   then
		return 1
	end
	if Hp(role) <= 0   then
		return 1
	end
	return 0
end
-----------------------------��ڻ���---------------��С��---------------------
function CheckWXHDead ( role,id )
	--local cha = TurnToCha ( role )
	--local id = GetRoleID(role)
	local hp = Hp(role)
	--local hp_hd = GetChaAttr( haidaoSide_BaseRole , ATTR_HP )
	if role == nil   then
		return 2
	end
	if id == 1281 and hp <=0   then
	   if wangxiaohuflag == 1   then
	   ScrollNotice ( "Wang Xiao Hu was defeated with all your power combined! What will this guy drop?",1)
	   SetChaTarget(role, 0)
       SetChaPatrolState(role, 0)
	   wangxiaohuflag = 0
	   end
	   return 1
	end
	return 0
end

function checkWXHtime(role)
    local Now_Time = tonumber(os.date("%H"))
	local Now_Minite = tonumber(os.date("%M"))
	local Now_Scend =  tonumber(os.date("%S"))
	if Now_Time == 19   then
		if Now_Minite >=10    then
			return LUA_TRUE
		end
	end
	if Now_Time > 19 and Now_Time < 22   then
		--if Now_Minite <=30   then
			return LUA_TRUE	
		--end
	end
	if Now_Time == 22   then
		if Now_Minite <= 30   then
			return LUA_TRUE	
		end
	end
	return LUA_FALSE
end
----------------------------��ڻ���--------------------------------------


--��⼼�����г̶�
function ReCheck_Skill_Dmg ( MaxDmg , MinDmg , Ran )

	local a = 0
	a = Percentage_Random ( Ran / 100)
	if a == 1   then
	
		return MaxDmg
	else
	
		return MinDmg
	end
end

--���PK˫���ȼ����
function ReCheck_PK_Lv ( ATKER , DEFER )
	local Lv_atker = Lv ( ATKER )
	local Lv_defer = Lv ( DEFER )
	return Lv_atker - Lv_defer
end



--PK�����������
function after_player_kill_player( ATKER, DEFER )
	SetCharaAttr(0, DEFER, ATTR_SP)
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local MGPK_MapNameNum = 11
	local MGPK_MapName = {}
	
	MGPK_MapName[0] = "puzzleworld"
	MGPK_MapName[1] = "puzzleworld2"
	MGPK_MapName[2] = "abandonedcity"
	MGPK_MapName[3] = "abandonedcity2"
	MGPK_MapName[4] = "abandonedcity3"
	MGPK_MapName[5] = "darkswamp"
	MGPK_MapName[6] = "hell"
	MGPK_MapName[7] = "hell2"
	MGPK_MapName[8] = "hell3"
	MGPK_MapName[9] = "hell4"
	MGPK_MapName[10] = "hell5"
	MGPK_MapName[11] = "eastgoaf"


	
	local ATKER_Get_Ry = 0
	local DEFER_Get_Ry = 0
	
	local ATKER_Get1_LD = 0
	local DEFER_Get1_Ry = 0
	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2"   then
		
		local Lv_ATKER = Lv( ATKER )
		local Lv_DEFER = Lv( DEFER )
		local Lv_dif = Lv_ATKER - Lv_DEFER
		if Lv_dif < 15 and Lv_dif > -15   then
			ATKER_Get1_LD = 1
			DEFER_Get1_Ry = -1
			SystemNotice ( ATKER ,"Received 1 Chaos Point for killing enemy." )
			SystemNotice ( DEFER ,"Killed by opponent, reduced honor points by 1")
		end
		
		if Lv_dif >= 15   then
			ATKER_Get1_LD = 0
			DEFER_Get1_Ry = 0
			SystemNotice ( ATKER , "Defeated low level opponent. No Chaos point obtained" )
			SystemNotice ( DEFER , "No honor points will be deducted when defeated by a higher level opponent." )
		end
		
		if Lv_dif <= -14   then
			ATKER_Get1_LD = 2
			DEFER_Get1_Ry = -2
			SystemNotice ( ATKER ,"Defeated high level opponent. Obtained 2 additional Honor points" )
			SystemNotice ( DEFER ,"Defeated by low level opponent. Lost 2 additional Honor points")
		end

		
--		local RongyuTpye = ITEMATTR_VAL_STR
--		local Kill_Num = 1
--		local Kill_attr = ITEMATTR_VAL_AGI
--		local Killed_attr = ITEMATTR_VAL_DEX
		local ATKER_LD = GetChaItem2 ( ATKER , 2 , 3849 )
		local DEFER_RYZ1 = GetChaItem2 ( DEFER , 2 , 3849 )
		local FightingPoint=GetItemAttr ( ATKER_LD , ITEMATTR_MAXENERGY)
		local HonorPoint = GetItemAttr ( DEFER_RYZ1 , ITEMATTR_VAL_STR)
		local	FightingPoint = FightingPoint + ATKER_Get1_LD
		local	HonorPoint = HonorPoint + DEFER_Get1_Ry
			if ATKER == DEFER   then
				ATKER_Get1_LD = ATKER_Get1_LD-1
			end
		SetItemAttr ( ATKER_LD , ITEMATTR_MAXENERGY,FightingPoint)
		SetItemAttr ( DEFER_RYZ1 , ITEMATTR_VAL_STR,HonorPoint)
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local map_copy = GetChaMapCopy ( ATKER )

		MapCopyNotice ( map_copy , Notice_map )
	
	end
	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was assassinated by <"..atk_name.."> in Chaos Argent"
		Notice ( Notice_all )
	end
	
	if map_name_ATKER == "garner3" or map_name_DEFER == "garner3"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was assassinated by <"..atk_name.."> in Nightmare Argent"
		Notice ( Notice_all )
	end	
	
	if map_name_ATKER == "chaosicicle" or map_name_DEFER == "chaosicicle"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was defeated by <"..atk_name.."> in Nightmare Icicle"
		Notice ( Notice_all )
	end	
	
	
			if map_name_ATKER == "puzzleworld" or map_name_DEFER == "puzzleworld"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was defeated by <"..atk_name.."> in DW 1"
		Notice ( Notice_all )
	end
	
			if map_name_ATKER == "puzzleworld2" or map_name_DEFER == "puzzleworld2"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was defeated by <"..atk_name.."> in DW 2"
		Notice ( Notice_all )
	end
			if map_name_ATKER == "puzzleworld3" or map_name_DEFER == "puzzleworld3"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was defeated by <"..atk_name.."> in DW 3"
		Notice ( Notice_all )
	end	
	
		if map_name_ATKER == "darkswamp" or map_name_DEFER == "darkswamp"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was slayed by <"..atk_name.."> in Dark Swamp"
		Notice ( Notice_all )
	end	
	
		if map_name_ATKER == "abandonedcity" or map_name_DEFER == "abandonedcity"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was executed by <"..atk_name.."> in FC 1"
		Notice ( Notice_all )
	end		
	

		if map_name_ATKER == "abandonedcity2" or map_name_DEFER == "abandonedcity2"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was executed by <"..atk_name.."> in FC 2"
		Notice ( Notice_all )
	end		
	
	
		if map_name_ATKER == "abandonedcity3" or map_name_DEFER == "abandonedcity3"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was executed by <"..atk_name.."> in FC 3"
		Notice ( Notice_all )
	end		
			if map_name_ATKER == "DreamIsland" or map_name_DEFER == "DreamIsland"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "<"..def_name.."> was defeated by <"..atk_name.."> in Dream City"
		Notice ( Notice_all )
	end
	
	if map_name_ATKER == "teampk" or map_name_DEFER == "teampk"   then
		local ATKER_RYZ = GetChaItem2 ( ATKER , 2 , 3849 )
		local DEFER_RYZ = GetChaItem2 ( DEFER , 2 , 3849 )
		local Lv_ATKER = Lv( ATKER )
		local Lv_DEFER = Lv( DEFER )
		local Lv_dif = Lv_ATKER - Lv_DEFER
		if Lv_dif < 10 and Lv_dif > -5   then
			ATKER_Get_Ry = 1
			DEFER_Get_Ry = -1
			SystemNotice ( ATKER ,"Defeat opponent and obtained Honor"..ATKER_Get_Ry )
			SystemNotice ( DEFER ,"Defeat!. Honor points lost:"..ATKER_Get_Ry )
		end
		
		if Lv_dif >= 10   then
			ATKER_Get_Ry = 0
			DEFER_Get_Ry = 0
			SystemNotice ( ATKER , "Defeated low level opponent. No Honor points obtained" )

		end
		
		if Lv_dif < -5   then
			ATKER_Get_Ry = 2
			DEFER_Get_Ry = -2
			SystemNotice ( ATKER ,"Defeated high level opponent, obtained extra Honor reward. Received Honor points:"..ATKER_Get_Ry )
			SystemNotice ( DEFER ,"Defeated by low level opponent. Extra penalty Honor lost:"..ATKER_Get_Ry )
		end

		local RongyuTpye = ITEMATTR_VAL_STR
		local Kill_Num = 1
		local Kill_attr = ITEMATTR_VAL_AGI
		local Killed_attr = ITEMATTR_VAL_DEX
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local map_copy = GetChaMapCopy ( ATKER )
		local Notice_map = def_name.." was defeated by "..atk_name..""
--		SystemNotice( ATKER ,"Honor point gained")
		Add_ItemAttr_RYZ ( ATKER , ATKER_RYZ , RongyuTpye , ATKER_Get_Ry )
--		SystemNotice( ATKER , "Increases Kill count by")
		Add_ItemAttr_RYZ ( ATKER , ATKER_RYZ , Kill_attr , Kill_Num )
--		SystemNotice( DEFER ,"was killed. Honor points deducted by")
		Add_ItemAttr_RYZ ( DEFER ,DEFER_RYZ , RongyuTpye , DEFER_Get_Ry )
--		SystemNotice( DEFER , "Defeat Count increases by")	
		Add_ItemAttr_RYZ ( DEFER ,DEFER_RYZ , Killed_attr , Kill_Num )
		MapCopyNotice ( map_copy , Notice_map )


	end
	if map_name_ATKER == "secretgarden" or map_name_DEFER == "secretgarden"   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "["..def_name.."] was defeated by ["..atk_name.."]"
		Notice ( Notice_all )
	end




if map_name_ATKER == "guildwar" or map_name_DEFER == "guildwar"   then

		local ATKER = TurnToCha ( ATKER )
		local DEFER = TurnToCha ( DEFER )
		--local Cha = TurnToCha(role) 
		local Num_shengsi_1= CheckBagItem(DEFER,2382)
                --Notice("Num_shengsi"..Num_shengsi)
	if Num_shengsi_1 >=1   then
		TakeItem( DEFER, 0,2382, 1 )    
                GiveItem ( ATKER , 0 , 2383  , 1 , 4 )
	
        else
	   if GetChaGuildID(DEFER) <= 100 and GetChaGuildID(DEFER) > 0   then
              GiveItem ( ATKER , 0 , 2858  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) > 100 and GetChaGuildID(DEFER) <= 200   then
	      GiveItem ( ATKER , 0 , 2859  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) == 0   then
	      SystemNotice ( ATKER , "Target does not belong to Navy nor Pirates, you did not manage to find anything!" )
	   end
	end
     end

     if map_name_ATKER == "guildwar2" or map_name_DEFER == "guildwar2"   then

		local ATKER = TurnToCha ( ATKER )
		local DEFER = TurnToCha ( DEFER )
		--local Cha = TurnToCha(role) 
		local Num_shengsi_2= CheckBagItem(DEFER,2382)
                --Notice("Num_shengsi"..Num_shengsi)
	if Num_shengsi_2 >=1   then
		TakeItem( DEFER, 0,2382, 1 )   
                GiveItem ( ATKER , 0 , 2383  , 1 , 4 )
	
        else
	   if GetChaGuildID(DEFER) <= 100 and GetChaGuildID(DEFER) > 0   then
              GiveItem ( ATKER , 0 , 2858  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) > 100 and GetChaGuildID(DEFER) <= 200   then
	      GiveItem ( ATKER , 0 , 2859  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) == 0   then
	      SystemNotice ( ATKER , "Target does not belong to Navy nor Pirates, you did not manage to find anything!" )
	   end
	end
     end

     




        local C_Map = 0
	for C_Map = 0 , MGPK_MapNameNum , 1 do
	    if  map_name_ATKER == MGPK_MapName[C_Map]   then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local map_copy = GetChaMapCopy ( ATKER )
		local Notice_map = def_name.." was defeated by "..atk_name.." Defeat"
		MapCopyNotice ( map_copy , Notice_map )
		ATKER = TurnToCha ( ATKER )
		DEFER = TurnToCha ( DEFER )
		local Have_TSWW = CheckBagItem( DEFER , 3846 )
		if Have_TSWW <= 0   then
			Dead_Punish_ItemURE ( DEFER )
			MGPK_Dead_Punish_Exp ( DEFER )
		else
			local j = DelBagItem( DEFER , 3846 , 1 )
			if j == 0   then
				LG ( "NewItem" , "Voodoo Doll deletion failed" )
			else
				SystemNotice ( DEFER , "Voodoo Doll replace death penalty" )
			end
		end

	    end
	end
	
--	PK_Dead_Punish_ItemURE ( DEFER )
end

--�Թ�PK��������ͷ�
function MGPK_Dead_Punish_Exp ( dead )
	local dead_lv=GetChaAttr(dead, ATTR_LV)							--100������״̬�������۾���	
	if dead_lv>=100   then
		CALCULATE_EXP_AND_LEVEL_LUA_000054 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000054")
		SystemNotice (dead , CALCULATE_EXP_AND_LEVEL_LUA_000054 )
		return
	end	
	local map_name = GetChaMapName ( dead )
	dead = TurnToCha ( dead ) 
	local lv = GetChaAttr( dead, ATTR_LV ) 
	local exp_red 
	local exp = Exp(dead) 
	local nlexp = GetChaAttrI ( dead , ATTR_NLEXP ) 
	local clexp = GetChaAttrI ( dead , ATTR_CLEXP ) 
	local exp_per = math.min ( math.floor ( math.abs( nlexp - clexp ) * 0.02 ) , math.max ( exp - clexp , 0 ) )	---���հٷֱȼ�����ʧ
	if  exp <= clexp   then 
		exp_red = 0 
	else 
		exp_red = math.pow( lv , 2 ) * 20								---���յȼ�������ʧ
	end 
	
	if exp_red > exp_per   then										---ȡ�����㷨�н�С�Ŀ۳�
		exp_red = exp_per
	end

	if Lv ( dead ) >= 80   then 
		exp_red = math.floor ( exp_red / 50 )
		exp_red_80 = exp_red * 50 
		CALCULATE_EXP_AND_LEVEL_LUA_000060 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000060")
		SystemNotice (dead , CALCULATE_EXP_AND_LEVEL_LUA_000060..exp_red_80 ) 
	else 
		CALCULATE_EXP_AND_LEVEL_LUA_000060 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000060")
		SystemNotice (dead , CALCULATE_EXP_AND_LEVEL_LUA_000060..exp_red ) 
	end
	
	exp = Exp(dead) - exp_red

	SetChaAttrI( dead , ATTR_CEXP , exp ) 
	
	local name = GetChaDefaultName ( dead )
	
	CALCULATE_EXP_AND_LEVEL_LUA_000067 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000067")
	CALCULATE_EXP_AND_LEVEL_LUA_000068 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000068")
	CALCULATE_EXP_AND_LEVEL_LUA_000069 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000069")
	LG ( "PKdie_exp" , CALCULATE_EXP_AND_LEVEL_LUA_000069 , name , CALCULATE_EXP_AND_LEVEL_LUA_000068, lv , CALCULATE_EXP_AND_LEVEL_LUA_000067 , exp_red )
end 



--��������֤����
function Add_ItemAttr_RYZ ( Cha_role ,role , attrtype , Num )
	local i = 0
	local attr_num = GetItemAttr ( role , attrtype )
--	SystemNotice ( Cha_role , "����ǰ��ֵ"..attr_num )
--	SystemNotice ( Cha_role , "����ֵ"..Num )
--	SystemNotice ( Cha_role , "��������"..attrtype )
	attr_num = attr_num + Num
	i = SetItemAttr ( role ,attrtype , attr_num )
	local attr_num_1 = GetItemAttr ( role , attrtype )
--	SystemNotice ( Cha_role , "������ֵ"..attr_num_1 )
	if i == 0   then
		CALCULATE_FUNCTIONS_LUA_000033 = GetResString("CALCULATE_FUNCTIONS_LUA_000033")
		LG("RYZ_PK",CALCULATE_FUNCTIONS_LUA_000033)
	end
	
end


--��ȡ����֤����

--�μӳ���
--��������ɫָ��
--����ֵ����������
function Get_ItemAttr_Join ( Cha_role )

	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( Cha_role,3849 )

	if RYZ_Num <= 0   then
		return 0
	end

	local role_RYZ = GetChaItem2 ( Cha_role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_CON
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	return attr_num
	
end

--��ȡ��ν֤֮����
--ɱ����
function Get_ItemAttr_Join ( Cha_role )

	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( Cha_role,3849 )

	if RYZ_Num <= 0   then
		return 0
	end

	local role_WWZ = GetChaItem2 ( Cha_role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_AGI
	local attr_num = GetItemAttr ( role_WWZ , attrtype )
	return attr_num
	
end

--ʤ������
--��������ɫָ��
--����ֵ��ʤ������
function Get_ItemAttr_Win ( Cha_role )

	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( Cha_role,3849 )

	if RYZ_Num <= 0   then
		return 0
	end	

	local role_RYZ = GetChaItem2 ( Cha_role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_STA
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	return attr_num
	
end

--�������ֵ

function AddYongYuZhi( role ,  value )
	
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0   then
		CALCULATE_FUNCTIONS_LUA_000034 = GetResString("CALCULATE_FUNCTIONS_LUA_000034")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000034 )
		return 0
	
	end
	
	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_STR
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	local attr_num = attr_num + value
	local i = 0
	SetChaKitbagChange ( role , 0 )
	i = SetItemAttr ( role_RYZ ,attrtype , attr_num )
	
	if i == 0   then 
		return 0
	end
	if value > 0   then
		CALCULATE_FUNCTIONS_LUA_000035 = GetResString("CALCULATE_FUNCTIONS_LUA_000035")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000035..value )
	end
	if value < 0   then
		local a = -1 * value
		CALCULATE_FUNCTIONS_LUA_000036 = GetResString("CALCULATE_FUNCTIONS_LUA_000036")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000036..a )
	end

	SynChaKitbag ( role , 7 )
	return 1
end



--�ı���ӹ��׵���
function TakeZuDuiGongXianDu( role , value )
	
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0   then
		CALCULATE_FUNCTIONS_LUA_000034 = GetResString("CALCULATE_FUNCTIONS_LUA_000034")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000034 )
		return 0
	
	end
	
	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_MAXURE
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	local attr_num = attr_num - value
	local i = 0
	SetChaKitbagChange ( role , 0 )
	i = SetItemAttr ( role_RYZ ,attrtype , attr_num )
	
	if i == 0   then 
		return 0
	end
	if value < 0   then
		local a = value * -1
		CALCULATE_FUNCTIONS_LUA_000037 = GetResString("CALCULATE_FUNCTIONS_LUA_000037")
		SystemNotice ( role ,CALCULATE_FUNCTIONS_LUA_000037..a )
	end
	if value > 0   then
		CALCULATE_FUNCTIONS_LUA_000038 = GetResString("CALCULATE_FUNCTIONS_LUA_000038")
		SystemNotice ( role ,CALCULATE_FUNCTIONS_LUA_000038..value )
		CALCULATE_FUNCTIONS_LUA_000039 = GetResString("CALCULATE_FUNCTIONS_LUA_000039")
		CALCULATE_FUNCTIONS_LUA_000040 = GetResString("CALCULATE_FUNCTIONS_LUA_000040")
		LG("RYZ_Take_Zdgx" , CALCULATE_FUNCTIONS_LUA_000040..value..CALCULATE_FUNCTIONS_LUA_000039)
	end
	SynChaKitbag ( role , 7 )
	return 1
end



--�ж��Ƿ����㹻����ӹ��׵���
function HasZuDuiGongXianDu ( role ,value )
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0   then
		return 0
	end

	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_MAXURE
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	if attr_num >= value   then
		return 1
	else
		return 0
	end
end

--�ж�����ֵ�Ƿ��������
function LessYongYuZhi( role , str , value )
		local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0   then
		return 0
	end

	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_STR
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	if str == ">"   then
		if attr_num > value   then
			return 1
		end
	elseif str == "<"   then
		if attr_num < value   then
			return 1
		end
	elseif str == "="   then
		if attr_num == value   then
			return 1
		end
	else
		CALCULATE_FUNCTIONS_LUA_000041 = GetResString("CALCULATE_FUNCTIONS_LUA_000041")
		LG("RYZ_PK",CALCULATE_FUNCTIONS_LUA_000041)
	end


end

--���ʱ�����ӹ��׵���
function Add_RYZ_TeamPoint ( role ,count_num , add_num )
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0   then
		return
	end
	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_MAXURE
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	if attr_num >= 1000   then
		return
	end
	attr_num = attr_num + add_num
	local a = math.min ( 1 , ( count_num - 2 ) * 0.3 )
	local b = 0
	b = Percentage_Random ( a )
	local i = 0
	if b == 1   then

		SetChaKitbagChange ( role , 0 )
		i = SetItemAttr ( role_RYZ ,attrtype , attr_num )

		if i == 0   then
			CALCULATE_FUNCTIONS_LUA_000042 = GetResString("CALCULATE_FUNCTIONS_LUA_000042")
			LG("RYZ_PK",CALCULATE_FUNCTIONS_LUA_000042)
			return
		end
		SynChaKitbag ( role , 7 )
	
		CALCULATE_FUNCTIONS_LUA_000043 = GetResString("CALCULATE_FUNCTIONS_LUA_000043")
		CALCULATE_FUNCTIONS_LUA_000044 = GetResString("CALCULATE_FUNCTIONS_LUA_000044")
		SystemNotice ( role ,CALCULATE_FUNCTIONS_LUA_000044..add_num..CALCULATE_FUNCTIONS_LUA_000043)
	end
end

	

--�;�ϵͳ--------------------------------------------

--�۳������������;�

function Take_Atk_ItemURE ( role )
--	SystemNotice( role ,"�۳������������;�")
	local Atk = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if Atk == 1 and boat == 0   then					---�ֺʹ�����
--		SystemNotice ( role ,"��ʼ����")
		local Item_1 = 0
		local Item_2 = 0
		Item_1 = GetChaItem ( role , 1 , 6 )
		Item_2 = GetChaItem ( role , 1 , 9 )
		local itemSX = {GetChaItem ( role , 1 , 5),GetChaItem ( role , 1 , 7),GetChaItem ( role , 1 , 8)}
		local Item_URE = 0
		local Take_Num = 1
		local i = 0
		local Item1_Type = Check_Repair_ItemType ( Item_1 )    --�ж��Ƿ������
		local Item2_Type = Check_Repair_ItemType ( Item_2 )
		
		if Item_1 ~= 0 and Item_1 ~= nil   then
--			SystemNotice (role , "����")
			local a = 0.03
			local b = Percentage_Random (a)
			
			if b == 1 and Item1_Type == 1   then
--				SystemNotice (role , "��ʼ������")
				Item_URE = GetItemAttr ( Item_1 , ITEMATTR_URE )
				if Item_URE < 50   then
					Take_Num = 0
				end

				Item_URE = Item_URE - Take_Num
				
				

				i = SetItemAttr ( Item_1 , ITEMATTR_URE , Item_URE )
				if i == 0   then
					CALCULATE_FUNCTIONS_LUA_000045 = GetResString("CALCULATE_FUNCTIONS_LUA_000045")
					LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000045)
				end
				if Item_URE < 50 and Take_Num ~= 0   then
					SetChaEquipValid ( role , 6 , 0 )
				end
			end
		end
		
		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_2 ~= 0 and Item_2 ~= nil   then
--			SystemNotice ( role ,"����")
			local a = 0.03
			local b = Percentage_Random (a)
			if b == 1 and Item2_Type == 1   then
--				SystemNotice(role ,"��ʼ������")
				Item_URE = GetItemAttr ( Item_2 , ITEMATTR_URE )

				if Item_URE < 50   then
					Take_Num = 0
				end

				Item_URE = Item_URE - Take_Num
				
				

				i = SetItemAttr ( Item_2 , ITEMATTR_URE , Item_URE )
				if i == 0   then
					CALCULATE_FUNCTIONS_LUA_000045 = GetResString("CALCULATE_FUNCTIONS_LUA_000045")
					LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000045)
				end
				if Item_URE < 50 and Take_Num ~= 0   then
					SetChaEquipValid ( role , 9 , 0 )
				end
			end
		end
		local j = 1
		for j = 1,3,1 do 
			if itemSX[j]~= 0 and itemSX[j]~=nil   then 
				local a = 0.02
				local b = Percentage_Random (a)
				local itemCanRepair = Check_Repair_ItemType(itemSX[j])
				if b == 1 and Item2_Type == 1   then
					Item_URE = GetItemAttr ( itemSX[j] , ITEMATTR_URE )

					if Item_URE < 50   then
						Take_Num = 0
					end

					Item_URE = Item_URE - Take_Num
					
					

						i = SetItemAttr ( itemSX[j] , ITEMATTR_URE , Item_URE )
					if i == 0   then
						CALCULATE_FUNCTIONS_LUA_000045 = GetResString("CALCULATE_FUNCTIONS_LUA_000045")
						LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000045)
					end
					if Item_URE < 50 and Take_Num ~= 0   then
						SetChaEquipValid ( role , 4+j+math.floor(j/2) , 0 )
					end
				end
			end
		end
	end
end

--�۳��ܻ��߷����;�

function Take_Def_ItemURE ( role )
	local def = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if def == 1 and boat == 0   then						--�ֺʹ�����
		local Item_1 = 0
		local Item_2 = 0
		local Item_3 = 0
		local Item_4 = 0

		Item_1 = GetChaItem ( role , 1 , 0 )
		Item_2 = GetChaItem ( role , 1 , 2 )
		Item_3 = GetChaItem ( role , 1 , 3 )
		Item_4 = GetChaItem ( role , 1 , 4 )
		
		local Item_URE = 0
		local Take_Num = 1
		local i = 0
		local equipLoc={5,7,8}
		local itemNew = {}
		local j = 0 
		for j =1 ,3, 1 do 
			
			itemNew[j] = GetChaItem(role , 1,equipLoc[j])
			if itemNew[j] ~= 0 and itemNew[j] ~=nil   then 
				local a = 0.01
				local b = Percentage_Random ( a )
				if b == 1   then
					Item_URE = GetItemAttr ( itemNew[j] , ITEMATTR_URE )

					if Item_URE < 50   then
						Take_Num = 0
					end
					
					Item_URE = Item_URE - Take_Num
					
					
					i = SetItemAttr (  itemNew[j] , ITEMATTR_URE , Item_URE )
					if i == 0   then
						CALCULATE_FUNCTIONS_LUA_000046 = GetResString("CALCULATE_FUNCTIONS_LUA_000046")
						LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000046)
					end
					
					if Item_URE < 50 and Take_Num ~= 0   then
						SetChaEquipValid ( role , equipLoc[j] , 0 )
					end
				end
			end
		end
		if Item_1 ~= 0 and Item_1 ~= nil   then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1   then
				Item_URE = GetItemAttr ( Item_1 , ITEMATTR_URE )

				if Item_URE < 50   then
					Take_Num = 0
				end
				
				Item_URE = Item_URE - Take_Num
				
				

				i = SetItemAttr ( Item_1 , ITEMATTR_URE , Item_URE )
				if i == 0   then
					CALCULATE_FUNCTIONS_LUA_000046 = GetResString("CALCULATE_FUNCTIONS_LUA_000046")
					LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000046)
				end
				
				if Item_URE < 50 and Take_Num ~= 0   then
					SetChaEquipValid ( role , 0 , 0 )
				end
			end
		end
		
		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_2 ~= 0 and Item_2 ~= nil   then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1   then
				Item_URE = GetItemAttr ( Item_2 , ITEMATTR_URE )

				if Item_URE < 50   then
					Take_Num = 0
				end
				
				Item_URE = Item_URE - Take_Num
				
				
				i = SetItemAttr ( Item_2 , ITEMATTR_URE , Item_URE )
				if i == 0   then
					CALCULATE_FUNCTIONS_LUA_000046 = GetResString("CALCULATE_FUNCTIONS_LUA_000046")
					LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000046)
				end
				
				if Item_URE < 50 and Take_Num ~= 0   then
					SetChaEquipValid ( role , 2 , 0 )
				end
			end
		end

		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_3 ~= 0 and Item_3 ~= nil   then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1   then
				Item_URE = GetItemAttr ( Item_3 , ITEMATTR_URE )

				if Item_URE < 50   then
					Take_Num = 0
				end
				
				Item_URE = Item_URE - Take_Num
				
				
				i = SetItemAttr ( Item_3 , ITEMATTR_URE , Item_URE )
				if i == 0   then
					CALCULATE_FUNCTIONS_LUA_000046 = GetResString("CALCULATE_FUNCTIONS_LUA_000046")
					LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000046)
				end

				if Item_URE < 50 and Take_Num ~= 0   then
					SetChaEquipValid ( role , 3 , 0 )
				end
			end
		end

		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_4 ~= 0 and Item_4 ~= nil   then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1   then
				Item_URE = GetItemAttr ( Item_4 , ITEMATTR_URE )
				
				if Item_URE < 50   then
					Take_Num = 0
				end

				Item_URE = Item_URE - Take_Num
				

				i = SetItemAttr ( Item_4 , ITEMATTR_URE , Item_URE )
				if i == 0   then
					CALCULATE_FUNCTIONS_LUA_000046 = GetResString("CALCULATE_FUNCTIONS_LUA_000046")
					LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000046)
				end
				
				if Item_URE < 50 and Take_Num ~= 0   then
					SetChaEquipValid ( role , 4 , 0 )
				end
			end
		end
	end
end

--��������ʱ�۳��;�
function Dead_Punish_ItemURE ( role )
	local Player = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	local Punish = 0.05
	
	Dead_Punish_Item_Num = 8							--Ҫ�۳���װ��λ��
	
	local Dead_Punish_Item_WZ = { }
	Dead_Punish_Item_WZ [0] = 0
	Dead_Punish_Item_WZ [1] = 2
	Dead_Punish_Item_WZ [2] = 3
	Dead_Punish_Item_WZ [3] = 4
	Dead_Punish_Item_WZ [4] = 6
	Dead_Punish_Item_WZ [5] = 9
	Dead_Punish_Item_WZ [6] = 5
	Dead_Punish_Item_WZ [7] = 7
	Dead_Punish_Item_WZ [8] = 8

	local Dead_Punish_Item = { }
	Dead_Punish_Item [0] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [0] )
	Dead_Punish_Item [1] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [1] )
	Dead_Punish_Item [2] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [2] )
	Dead_Punish_Item [3] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [3] )
	Dead_Punish_Item [4] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [4] )
	Dead_Punish_Item [5] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [5] )
	Dead_Punish_Item [6] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [6] )
	Dead_Punish_Item [7] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [7] )
	Dead_Punish_Item [8] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [8] )

	if Player == 1 and boat == 0   then						--�ֺʹ�����
		local Item_URE = 0
		local Item_MAXURE = 0
		local Take_Num = 0
		local i = 0
		local j = 0
		local k = 0								--װ����Ч���
		for j = 0 , Dead_Punish_Item_Num , 1 do
				
			if Dead_Punish_Item[j] ~= 0 and Dead_Punish_Item[j] ~= nil   then
				local ItemType_Check = Check_Repair_ItemType ( Dead_Punish_Item[j] )
				if ItemType_Check == 1   then
					Item_URE = GetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_URE )
					Item_MAXURE = GetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_MAXURE )
					Take_Num = math.floor ( Item_MAXURE * Punish )
					
					if Item_URE >= 50   then
						k = 1
					end

					Item_URE = Item_URE - Take_Num
					
					if Item_URE < 50   then
						Item_URE = 49
						
					end
					
					i = SetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_URE , Item_URE )
					if i == 0   then
						CALCULATE_FUNCTIONS_LUA_000047 = GetResString("CALCULATE_FUNCTIONS_LUA_000047")
						LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000047..j)
					end
					
					
					
					if k == 1 and Item_URE == 49   then
							SetChaEquipValid ( role , Dead_Punish_Item_WZ [j] , 0 )
					end


				end
				
			end
		end
		CALCULATE_FUNCTIONS_LUA_000048 = GetResString("CALCULATE_FUNCTIONS_LUA_000048")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000048 )
	end

end

--PKʱ�����۳��;�

function PK_Dead_Punish_ItemURE ( role )
	local Player = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	local Punish = 0.05
	PK_Dead_Punish_Item_Num = 8							--Ҫ�۳���װ��λ��
	
	local PK_Dead_Punish_Item_WZ = { }
	PK_Dead_Punish_Item_WZ [0] = 0
	PK_Dead_Punish_Item_WZ [1] = 2
	PK_Dead_Punish_Item_WZ [2] = 3
	PK_Dead_Punish_Item_WZ [3] = 4
	PK_Dead_Punish_Item_WZ [4] = 6
	PK_Dead_Punish_Item_WZ [5] = 9
	PK_Dead_Punish_Item_WZ [6] = 5
	PK_Dead_Punish_Item_WZ [7] = 7
	PK_Dead_Punish_Item_WZ [8] = 8

	local PK_Dead_Punish_Item = { }
	PK_Dead_Punish_Item [0] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [0] )
	PK_Dead_Punish_Item [1] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [1] )
	PK_Dead_Punish_Item [2] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [2] )
	PK_Dead_Punish_Item [3] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [3] )
	PK_Dead_Punish_Item [4] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [4] )
	PK_Dead_Punish_Item [5] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [5] )
	PK_Dead_Punish_Item [6] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [6] )
	PK_Dead_Punish_Item [7] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [7] )
	PK_Dead_Punish_Item [8] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [8] )
	if Player == 1 and boat == 0   then						--�ֺʹ�����
		local Item_URE = 0
		local Item_MAXURE = 0
		local Take_Num = 0
		local i = 0
		local j = 0
		local k = 0								--װ����Ч���
		for j = 0 , PK_Dead_Punish_Item_Num , 1 do
				
			if PK_Dead_Punish_Item[j] ~= 0 and PK_Dead_Punish_Item[j] ~= nil   then
				local ItemType_Check = Check_Repair_ItemType ( PK_Dead_Punish_Item[j] )
				
				if ItemType_Check == 1   then

					Item_URE = GetItemAttr ( PK_Dead_Punish_Item[j] , ITEMATTR_URE )
					Item_MAXURE = GetItemAttr ( PK_Dead_Punish_Item[j] , ITEMATTR_MAXURE )
					Take_Num = math.floor ( Item_MAXURE * Punish )
					
					if Item_URE >= 50   then
						k = 1
					end

					Item_URE = Item_URE - Take_Num
					if Item_URE < 50   then
						Item_URE = 49
						
					end

					i = SetItemAttr ( PK_Dead_Punish_Item[j] , ITEMATTR_URE , Item_URE )
					if i == 0   then
						CALCULATE_FUNCTIONS_LUA_000047 = GetResString("CALCULATE_FUNCTIONS_LUA_000047")
						LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000047..j)
					end
					
					
					
					if k == 1 and Item_URE == 49   then
							SetChaEquipValid ( role , Dead_Punish_Item_WZ [j] , 0 )
					end
				end
				
			end
		end
		CALCULATE_FUNCTIONS_LUA_000049 = GetResString("CALCULATE_FUNCTIONS_LUA_000049")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000049 )
	end
end
------------------------������ת˫�������ж�
function TurnToJob( character, p )
	local cha_type=GetChaTypeID(character)
	if p==1 and (cha_type==1 or cha_type==2 or cha_type==3)   then
		return LUA_TRUE
	end
	if p==2 and (cha_type==1 or cha_type==3)   then
		return LUA_TRUE
	end
end
--ת���ж�
function CheckZsExp (role)
	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if Zs_Exp > 0   then
		return LUA_FALSE
	end
	return LUA_TRUE
end


--�������Ƿ������
function can_repair_item ( role_repair , role_want_repair , Item )
	local Check = 0
	local Sklv = 1
	Check = can_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
	return Check

end

--����Ƿ������������

function can_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
	--	SystemNotice( role_want_repair , "����can_repair_item ")
	local re_type = IsPlayer ( role_repair )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Money_Need = get_item_repair_money ( role_want_repair,Item )
	local Money_Have = GetChaAttr ( role_want_repair , ATTR_GD )
	local itemId =GetItemID ( Item )
	
--	SystemNotice ( role_want_repair , "Item_MAXURE= "..Item_MAXURE)
--	SystemNotice ( role_want_repair , "Item_URE= "..Item_URE)

--	SystemNotice ( role_want_repair , "ҪǮ"..Money_Need )
	if itemId == 1121 or itemId == 1122 or itemId ==1034   then
		CALCULATE_FUNCTIONS_LUA_000050 = GetResString("CALCULATE_FUNCTIONS_LUA_000050")
		SystemNotice( role_want_repair , CALCULATE_FUNCTIONS_LUA_000050 )
		return 0
	end
	if Item_MAXURE <= 2500   then
		CALCULATE_FUNCTIONS_LUA_000051 = GetResString("CALCULATE_FUNCTIONS_LUA_000051")
		SystemNotice( role_want_repair , CALCULATE_FUNCTIONS_LUA_000051 )
		return 0
	end
	if Item_MAXURE == Item_URE   then								--�;�̫�ͣ��;�δ���Ĳ�����
		CALCULATE_FUNCTIONS_LUA_000052 = GetResString("CALCULATE_FUNCTIONS_LUA_000052")
		SystemNotice( role_want_repair , CALCULATE_FUNCTIONS_LUA_000052)
		return 0
	end

	if Money_Have < Money_Need   then								--ûǮ������
		CALCULATE_FUNCTIONS_LUA_000053 = GetResString("CALCULATE_FUNCTIONS_LUA_000053")
		SystemNotice( role_want_repair , CALCULATE_FUNCTIONS_LUA_000053)
		return 0
	end

--	if re_type == 1   then
--		LG("Item_URE","��������ˣ�")
--		return 0
--	end
	
	local i = 0
	i = Check_Repair_ItemType ( Item )
	if i == 1   then
		return 1
	end
	CALCULATE_FUNCTIONS_LUA_000054 = GetResString("CALCULATE_FUNCTIONS_LUA_000054")
	SystemNotice( role_want_repair , CALCULATE_FUNCTIONS_LUA_000054)

	return 0
end


--ȡ�����������
function get_item_repair_money ( role_want_repair,Item )
	local Money = 0
	local Sklv = 1
	Money = get_item_repair_moneyLua ( Item , Sklv )
	
	if Money < 1   then
		Money = 1
	end
	local ZBMain= GetChaAttr(role_want_repair,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)      ---�ڼ���ռ��
	local ZBNMain= math.fmod(ZBMain,10 )			---BUFF OR DEBUFF
	local ZBday = GetChaAttr(role_want_repair,ATTR_EXTEND2)		--ռ������
	local ZBstate=GetChaAttr(role_want_repair, ATTR_EXTEND1)	--
	local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
	local ZBstate2=math.fmod(ZBstate,10)				--ռ������
	local now_day=os.date("%d")
	now_day=tonumber(now_day)
	if now_day==ZBday and ZBstate2==8   then
		Money=math.max(1,math.floor(Money/2))
	end

	return Money
	
end

--ȡ�����������������
function get_item_repair_moneyLua ( Item , Sklv )
	local Item_Lv = GetItemLv ( Item )
	local itemName=GetItemName(GetItemID(Item))
	CALCULATE_FUNCTIONS_LUA_000055 = GetResString("CALCULATE_FUNCTIONS_LUA_000055")
	CALCULATE_FUNCTIONS_LUA_000056 = GetResString("CALCULATE_FUNCTIONS_LUA_000056")
	CALCULATE_FUNCTIONS_LUA_000057 = GetResString("CALCULATE_FUNCTIONS_LUA_000057")
	if string.find(itemName,CALCULATE_FUNCTIONS_LUA_000055)~=nil   then 
		Item_Lv = 70 
	elseif string.find(itemName,CALCULATE_FUNCTIONS_LUA_000056)~=nil   then
		Item_Lv = 70
	elseif string.find(itemName,CALCULATE_FUNCTIONS_LUA_000057)~=nil   then
		Item_Lv = 70
	end
	local LVarg1 = math.floor ( math.pow(( Item_Lv / 5 ) , 2.4 )*0.45) 
	local LVarg2=200
	local LVarg=LVarg2*LVarg1
	local itemEnergy = GetItemAttr (Item,ITEMATTR_ENERGY)
	local energyArg = GetRepairEArg(itemEnergy)
	local itemForge = GetItem_JinglianLv (Item)
	local forgeArg = GetRepairFArg(itemForge)
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local itemRHLV = GetItemAttr (Item,ITEMATTR_VAL_LEVEL)
	local RHLVArg =1
	if itemRHLV~= 0   then 
		RHLVArg =1+(itemRHLV-10)*0.02
	end
	local URE_repair =1-Item_URE/Item_MAXURE
	local Money_Need = math.floor(LVarg*(energyArg+forgeArg+RHLVArg)*URE_repair)
	return Money_Need
end
function GetRepairEArg(itemEnergy)
	if itemEnergy<7000   then 
		return itemEnergy/10000
	else
		return 0.5
	end
end
function GetRepairFArg(itemForge)
	
		return itemForge*1.5/100

end
--��ʼ�������
function begin_repair_item ( role_repair , role_want_repair , Item )
	local Sklv = 1
	begin_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
end

--��ʼ����������
function begin_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
--	SystemNotice( role_want_repair , "��ʼ�������")
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Money_Need = get_item_repair_money ( role_want_repair,Item )
	local Money_Have = GetChaAttr ( role_want_repair , ATTR_GD )
--	SystemNotice ( role_want_repair , "Money_Have = "..Money_Have)
--	SystemNotice ( role_want_repair , "��Ǯ "..Money_Need)
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role_want_repair , ATTR_GD )
	ALLExAttrSet( role_want_repair )
--	SystemNotice ( role_want_repair , "����Ǯ��" )
--	local a = 1
--	local b = 1
	local i = 0
	local j = 0
	
	
--	local URE_NeedRepair = ( Item_MAXURE - Item_URE ) - ( Item_MAXURE * 0.05 )
	
--	if URE_NeedRepair <= 0   then
--		b = 1
--	end

--	if b == 1   then
	Item_URE = Item_MAXURE
	i = SetItemAttr ( Item , ITEMATTR_URE , Item_URE )

	if i == 0   then 
		CALCULATE_FUNCTIONS_LUA_000058 = GetResString("CALCULATE_FUNCTIONS_LUA_000058")
		LG("Item_URE",CALCULATE_FUNCTIONS_LUA_000058)
	end
	CALCULATE_FUNCTIONS_LUA_000059 = GetResString("CALCULATE_FUNCTIONS_LUA_000059")
	SystemNotice( role_want_repair ,CALCULATE_FUNCTIONS_LUA_000059 )
--	else
--		local New_Item_MAXURE = math.floor ( Item_MAXURE * 0.95 )
--		i = SetItemAttr ( Item , ITEMATTR_URE , New_Item_MAXURE )
--		j = SetItemAttr ( Item , ITEMATTR_MAXURE , New_Item_MAXURE )
--		SystemNotice ( role_want_repair , "�������" )
--		SystemNotice ( role_want_repair , "���ź��������;��޷��ָ�������;öȽ���" )
--		if i == 0   then
--			LG("Item_URE","����ʧ�ܺ������;�ʧ��")
--		end
--		if j == 0   then
--			LG("Item_URE","����ʧ�ܺ��޸�����;�ʧ��")
--		end
--	end
	return 1
end


--�ж��Ƿ�Ϊ�������װ������
function Check_Repair_ItemType ( Item )
	local Item_ID = GetItemID ( Item )
	if Item_ID==5872 or Item_ID == 1034   then
		return 0
	end
	if Item_ID < 3243 or Item_ID > 3278    then
		if Item_ID ~= 3669 and Item_ID ~=5825   then
			local Item_Type = GetItemType ( Item )
--			SystemNotice ( role_want_repair , "��������="..Item_Type )
			local i = 0
			for i = 0 , Item_CanRepair_Num , 1 do
				if Item_CanRepair_ID [i] == Item_Type   then
					return 1
				end
			end
		end
	end
	return 0
end


-----����ϵͳ32λ���ֲ��----------------

--��ȡ����
function GetNum_Part1 ( Num )
	local a = 0
	a = math.floor ( Num / 1000000000 )
	return a
end

function GetNum_Part2 ( Num )
	local a = 0
	local b = 0
	a = Num - GetNum_Part1 ( Num ) * 1000000000
	b = math.floor ( a / 10000000 )
	return b
end

function GetNum_Part3 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 10000000 ) * 10000000
	b = math.floor ( a / 1000000 )
	return b
end

function GetNum_Part4 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 1000000 ) *1000000
	b = math.floor ( a / 10000 )
	return b
end

function GetNum_Part5 ( Num )
	local a = 0
	local b = 0
	a = Num -  math.floor ( Num / 10000 ) * 10000
	b = math.floor ( a / 1000 )
	return b
end

function GetNum_Part6 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 1000 ) *1000
	b = math.floor ( a / 10 )
	return b
end

function GetNum_Part7 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 10 ) *10
	b = math.floor ( a / 1 )
	return b
end

-- function GetNum_Test ( Num )
--	local a = 0
--	Notice ( "������Mars�������ݣ��뱣����" )
--	Notice ( "��������Ϊ"..Num )
--	a = GetNum_Part1( Num )
--	Notice ( " �������ֵ�һ���� = "..a)
--	a = GetNum_Part2( Num )
--	Notice ( " �������ֵڶ����� = "..a)
--	a = GetNum_Part3( Num )
--	Notice ( " �������ֵ������� = "..a)
--	a = GetNum_Part4( Num )
--	Notice ( " �������ֵ��Ĳ��� = "..a)
--	a = GetNum_Part5( Num )
--	Notice ( " �������ֵ��岿�� = "..a)
--	a = GetNum_Part6( Num )
--	Notice ( " �������ֵ������� = "..a)
--	a = GetNum_Part7( Num )
--	Notice ( " �������ֵ��߲��� = "..a)
-- end


--д�벿��

function SetNum_Part1 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part1 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000000000
	return Num
end

function SetNum_Part2 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part2 ( Num )
	b = Part_Num - a
	Num = Num + b * 10000000
	return Num
end

function SetNum_Part3 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part3 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000000
	return Num
end

function SetNum_Part4 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part4 ( Num )
	b = Part_Num - a
	Num = Num + b * 10000
	return Num
end

function SetNum_Part5 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part5 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000
	return Num
end

function SetNum_Part6 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part6 ( Num )
	b = Part_Num - a
	Num = Num + b * 10
	return Num
end

function SetNum_Part7 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part7 ( Num )
	b = Part_Num - a
	Num = Num + b * 1
	return Num
end


--function SetNum_Test ( Num )
--	local a = 0
--	Notice ( "������Mars�������ݣ����ұ�����" )
--	Notice ( "��������Ϊ"..Num)
--	Num = SetNum_Part1 ( Num , 0 )
--	Notice ( "�ı��һ����֮��Ϊ"..Num )
--	Num = SetNum_Part2 ( Num , 12 )
--	Notice ( "�ı�ڶ�����֮��Ϊ"..Num )
--	Num = SetNum_Part3 ( Num , 3 )
--	Notice ( "�ı��������֮��Ϊ"..Num )
--	Num = SetNum_Part4 ( Num , 45 )
--	Notice ( "�ı���Ĳ���֮��Ϊ"..Num )
--	Num = SetNum_Part5 ( Num , 6 )
--	Notice ( "�ı���岿��֮��Ϊ"..Num )
--	Num = SetNum_Part6 ( Num , 78 )
--	Notice ( "�ı��������֮��Ϊ"..Num )
--	Num = SetNum_Part7 ( Num , 9 )
--	Notice ( "�ı���߲���֮��Ϊ"..Num )
--end



--�������ݳ�ʼ��--

function SetItemForgeParam_MonsterBaoliao ( item , Num )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
	local ItemID = GetItemID ( item )
	local MaxHole = GetItemHoleNum ( ItemID )
	local Item_Type = GetItemType ( item )

	for j = 0 , 3 , 1 do 
		if a <= Item_HoleNum_Monster [j]   then 
			k = j
			a = 200
		end
	end

	if k > MaxHole   then
		k = MaxHole
	end
	
--	if k <= 1   then
--		k = 1
--	end

	if Item_Type == 49 or Item_Type == 50   then
		k = 0
	end

	Num = SetNum_Part1 ( Num , k )
	  
--	Notice(Num)
	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0   then
		CALCULATE_FORGE_LUA_000033 = GetResString("CALCULATE_FORGE_LUA_000033")
		LG( "Creat_Item" , CALCULATE_FORGE_LUA_000033 )
	end
end

function SetItemForgeParam_PlayerHecheng ( item , Num )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
	local ItemID = GetItemID ( item )
	local MaxHole = GetItemHoleNum ( ItemID )
	local Item_Type = GetItemType ( item )

	
	for j = 0 , 3 , 1 do 
		if a <= Item_HoleNum_Hecheng [j]   then 
			k = j
			a = 200
		end 
	end 
	
 	if k > MaxHole   then
		k = MaxHole
	end

	if Item_Type == 49 or Item_Type == 50   then
		k = 0
	end


	Num = SetNum_Part1 ( Num , k ) 
	 
	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0   then
		CALCULATE_FORGE_LUA_000033 = GetResString("CALCULATE_FORGE_LUA_000033")
		LG( "Creat_Item" , CALCULATE_FORGE_LUA_000033 )
	end
end

function SetItemForgeParam_QuestAward ( item , Num , item_event )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
	local ItemID = GetItemID ( item )
	local MaxHole = GetItemHoleNum ( ItemID )
	local Item_Type = GetItemType ( item )

	
	for j = 0 , 3 , 1 do 
		if a <= Item_HoleNum_Mission_1 [j]   then 
			k = j
			a = 200
		end 
	end 
	
  	if k > MaxHole   then
		k = MaxHole
	end

	if item_event == QUEST_AWARD_SDJ   then
		if k == 0   then
			k = 1
		end
	end

	if item_event == QUEST_AWARD_SCBOX   then
		k = 2
	end

	if Item_Type == 49 or Item_Type == 50   then
		k = 0
	end

	Num = SetNum_Part1 ( Num , k ) 

	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0   then
		CALCULATE_FORGE_LUA_000033 = GetResString("CALCULATE_FORGE_LUA_000033")
		LG( "Creat_Item" , CALCULATE_FORGE_LUA_000033 )
	end
end

function SetItemForgeParam_Npc_Sale ( item , Num )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
--	local ItemID = GetItemID ( Item )
--	local MaxHole = GetItemHoleNum ( ItemID )

--	for j = 0 , 3 , 1 do 
--		if a <= Item_HoleNum_Monster [i]   then 
--			k = i
--			a = 200
--		end
--	end

--	if k > MaxHole   then
--		k = MaxHole
--	end

	Num = SetNum_Part1 ( Num , k )
	  
--	Num = 2011000000
	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0   then
		CALCULATE_FORGE_LUA_000033 = GetResString("CALCULATE_FORGE_LUA_000033")
		LG( "Creat_Item" , CALCULATE_FORGE_LUA_000033 )
	end

end


--���Ὰ���������

--ȡĿǰ��ս��������

function GetFightGuildLevel()
--	�Ƚ�ʱ�䣬����level
--	�ڴ˲���ʱ��Ƚϣ�ȷ��GuildLevel
	local Lv = 0
	local Now_Week = GetNowWeek()
	local Now_Time = GetNowTime()
	local CheckNum = Now_Week * 100 + Now_Time
	if CheckNum >= 422 and CheckNum < 522   then
		Lv = 2
	elseif CheckNum >= 522 and CheckNum < 622   then
		Lv = 1
	elseif CheckNum >= 622 and CheckNum < 700   then
		Lv = 3
	elseif CheckNum >= 0 and CheckNum < 22   then
		Lv = 3
	end

	return Lv
end


--ȡ��ս˫���Ĺ�����
--��������ս�ȼ�
--����ֵ�����������ţ���ս���᷽������
function GetFightGuildID( GuildLevel )
	local RedSide = 0
	local BlueSide = 0
	RedSide , BlueSide = GetChallengeGuildID ( GuildLevel )
	return RedSide,BlueSide
end

--ȡ�������ڼ�
function GetNowWeek ( )
	local Now_Week = os.date("%w")
	local Now_WeekNum = tonumber(Now_Week)
	return Now_WeekNum
end

--ȡ�����Ǽ���
function GetNowTime ( )
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	return NowTimeNum
end


--������װ�ж�

function CheckItem_Nianshou ( role )
	local Atk = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if Atk == 0 or boat == 1   then		
		return 0
	end

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	local head = GetChaItem ( role , 1 , 0 )
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	local Head_ID = GetItemID ( head )
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )

	if Body_ID ~= 0825  and Body_ID ~= 2549   then
		return 0
	end

	if Hand_ID ~= 0826  and Hand_ID ~= 2550   then
		return 0
	end

	if Foot_ID ~= 0827  and Foot_ID ~= 2551   then
		return 0
	end

	if Cha_Num == 4   then
		if Head_ID ~= 0828  and Head_ID ~= 2552   then
			return 0
		end
	end

	return 1
	

end

--������װ�ж�

function CheckItem_Heilong ( role )
	local Atk = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if Atk == 0 or boat == 1   then		
		return 0
	end

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )

	if Body_ID ~= 0845 and Body_ID ~= 2367   then
		return 0
	end

	if Hand_ID ~= 0846 and Hand_ID ~= 2368   then
		return 0
	end

	if Foot_ID ~= 0847 and Foot_ID ~= 2369   then
		return 0
	end

	return 1
end

---��⺣����װ
function CheckItem_pirate ( role )

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
        if  Body_ID<5000 or Hand_ID<5000 or Foot_ID<5000   then
	   return 0
	end
        if body_gem_id ~= 2530 and body_gem_id ~= 2533 and body_gem_id ~= 2536 and body_gem_id ~= 2539 and body_gem_id ~= 2542 and body_gem_id ~= 2545   then
	   return 0
        end
	if hand_gem_id ~= 2531 and hand_gem_id ~= 2534 and hand_gem_id ~= 2537 and hand_gem_id ~= 2540 and hand_gem_id ~= 2543 and hand_gem_id ~= 2546   then
	   return 0
	end
	if foot_gem_id ~= 2532 and foot_gem_id ~= 2535 and foot_gem_id ~= 2538 and foot_gem_id ~= 2541 and foot_gem_id ~= 2544 and foot_gem_id ~= 2547   then 
           return 0
	end	
	return 1
end
---���75BOSS
function CheckItem_Death ( role )

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
       if  Body_ID<5000 or Hand_ID<5000 or Foot_ID<5000   then
		body_gem_id=Body_ID
		hand_gem_id=Hand_ID
		foot_gem_id=Foot_ID
		if body_gem_id ~= 2817 and body_gem_id ~= 2820 and body_gem_id ~= 2823 and body_gem_id ~= 2826 and body_gem_id ~= 2829 and body_gem_id ~= 2832   then
		   return 0
		end
		if hand_gem_id ~= 2818 and hand_gem_id ~= 2821 and hand_gem_id ~= 2824 and hand_gem_id ~= 2827 and hand_gem_id ~= 2830 and hand_gem_id ~= 2833   then
		   return 0
		end
		if foot_gem_id ~= 2819 and foot_gem_id ~= 2822 and foot_gem_id ~= 2825 and foot_gem_id ~= 2828 and foot_gem_id ~= 2831 and foot_gem_id ~= 2834   then 
		   return 0
		end
	else
		if body_gem_id ~= 2817 and body_gem_id ~= 2820 and body_gem_id ~= 2823 and body_gem_id ~= 2826 and body_gem_id ~= 2829 and body_gem_id ~= 2832   then
		   return 0
		end
		if hand_gem_id ~= 2818 and hand_gem_id ~= 2821 and hand_gem_id ~= 2824 and hand_gem_id ~= 2827 and hand_gem_id ~= 2830 and hand_gem_id ~= 2833   then
		   return 0
		end
		if foot_gem_id ~= 2819 and foot_gem_id ~= 2822 and foot_gem_id ~= 2825 and foot_gem_id ~= 2828 and foot_gem_id ~= 2831 and foot_gem_id ~= 2834   then 
		   return 0
		end	 
	end
	return 1
end
--�Ҷ�֮װ

function CheckItem_fighting ( role )
	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
        if  Body_ID<5000 or Hand_ID<5000 or Foot_ID<5000   then
	   return 0
	end
        if body_gem_id ~= 1124   then
	   return 0
        end
	if hand_gem_id ~= 1125   then
	   return 0
	end
	if foot_gem_id ~= 1126    then 
           return 0
	end
	 
	return 1
end
---����ϵͳ-------------------------------------------------

---���---------------------

function Suanming_Money ( role )
	local a = CheckSuanmingType ( role )			--����õ�ʲôǩ
	if a == 1   then
		CALCULATE_FUNCTIONS_LUA_000060 = GetResString("CALCULATE_FUNCTIONS_LUA_000060")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000060 )
		ShangShangQian_Money ( role )
	elseif a == 2   then
		CALCULATE_FUNCTIONS_LUA_000061 = GetResString("CALCULATE_FUNCTIONS_LUA_000061")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000061 )
		ShangQian_Money ( role )
	elseif a == 3   then
		ZhongQian_Money ( role )
--		SystemNotice ( role , "������������...����ʲô��û����" )
	elseif a == 4   then
		CALCULATE_FUNCTIONS_LUA_000062 = GetResString("CALCULATE_FUNCTIONS_LUA_000062")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000062 )
		XiaQian_Money ( role )
	elseif a == 5   then
		CALCULATE_FUNCTIONS_LUA_000063 = GetResString("CALCULATE_FUNCTIONS_LUA_000063")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000063 )
		XiaXiaQian_Money ( role )
	end
end

---����ҵ-------------------

function Suanming_Work ( role )
	local a = CheckSuanmingType ( role )
	if a == 1   then
		CALCULATE_FUNCTIONS_LUA_000060 = GetResString("CALCULATE_FUNCTIONS_LUA_000060")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000060 )
		ShangShangQian_Work ( role )
	elseif a == 2   then
		CALCULATE_FUNCTIONS_LUA_000061 = GetResString("CALCULATE_FUNCTIONS_LUA_000061")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000061 )
		ShangQian_Work ( role )
	elseif a == 3   then
		ZhongQian_Work ( role )
--		SystemNotice ( role , "������������...����ʲô��û����" )
	elseif a == 4   then
		CALCULATE_FUNCTIONS_LUA_000062 = GetResString("CALCULATE_FUNCTIONS_LUA_000062")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000062 )
		XiaQian_Work ( role )
	elseif a == 5   then
		CALCULATE_FUNCTIONS_LUA_000063 = GetResString("CALCULATE_FUNCTIONS_LUA_000063")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000063 )
		XiaXiaQian_Work ( role )
	end
end


--����õ�ʲôǩ

function CheckSuanmingType ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 10
	qian [1] = 35
	qian [2] = 55
	qian [3] = 85
	qian [4] = 100

	for i = 0 , 4 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	return b

end

--��������ǩ

function ShangShangQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 10
	qian [1] = 50
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local GiveMoneyNum = 0.01 * math.random ( 1 , 5 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		CALCULATE_FUNCTIONS_LUA_000064 = GetResString("CALCULATE_FUNCTIONS_LUA_000064")
		CALCULATE_FUNCTIONS_LUA_000065 = GetResString("CALCULATE_FUNCTIONS_LUA_000065")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000065..GiveMoneyNum_Notice..CALCULATE_FUNCTIONS_LUA_000064 )
		QianAddMoney ( role , 1 , GiveMoneyNum )							----��Ǯ��1Ϊ��������2Ϊ���̶���ֵ
	elseif b == 2   then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		-- AddState( role , role , STATE_SBBLGZ , statelv , statetime )
		CALCULATE_FUNCTIONS_LUA_000066 = GetResString("CALCULATE_FUNCTIONS_LUA_000066")
		CALCULATE_FUNCTIONS_LUA_000067 = GetResString("CALCULATE_FUNCTIONS_LUA_000067")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000067..time_Bei..CALCULATE_FUNCTIONS_LUA_000066 )
		TrigASBBL(role,statelv,statetime)
	elseif b == 3   then
		GiveItem ( role , 0 , 1092 , 1 , 0 )							---����ͼ
	end
end

--������ǩ

function ShangQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 20
	qian [1] = 60
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end
	
	if b == 1   then
		local GiveMoneyNum = 0.001 * math.random ( 1 , 9 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		CALCULATE_FUNCTIONS_LUA_000064 = GetResString("CALCULATE_FUNCTIONS_LUA_000064")
		CALCULATE_FUNCTIONS_LUA_000065 = GetResString("CALCULATE_FUNCTIONS_LUA_000065")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000065..GiveMoneyNum_Notice..CALCULATE_FUNCTIONS_LUA_000064 )
		QianAddMoney ( role , 1 , GiveMoneyNum )
	elseif b == 2   then
		local Give_Money = 1000 * math.random ( 1 , 15 )
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 3   then
		local hp_role = Hp( role )
		local hp_dmg = math.floor ( hp_role * 0.9 )
		local Give_Money = math.random ( 10000 , 20000 )
		Hp_Endure_Dmg ( role , hp_dmg )
		QianAddMoney ( role , 2 , Give_Money )
		CALCULATE_FUNCTIONS_LUA_000068 = GetResString("CALCULATE_FUNCTIONS_LUA_000068")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000068 )
	end
end

--������ǩ

function ZhongQian_Money ( role )
	CALCULATE_FUNCTIONS_LUA_000069 = GetResString("CALCULATE_FUNCTIONS_LUA_000069")
	SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000069 )
end


--������ǩ

function XiaQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 20
	qian [1] = 100
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local Give_Money = math.random ( 100 , 5000 )
		Give_Money = Give_Money * -1
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 2   then
		local GiveMoneyNum = 0.001 * math.random ( 1 , 9 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		CALCULATE_FUNCTIONS_LUA_000070 = GetResString("CALCULATE_FUNCTIONS_LUA_000070")
		CALCULATE_FUNCTIONS_LUA_000071 = GetResString("CALCULATE_FUNCTIONS_LUA_000071")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000071..GiveMoneyNum_Notice..CALCULATE_FUNCTIONS_LUA_000070 )
		GiveMoneyNum = GiveMoneyNum * -1
		QianAddMoney ( role , 1 , GiveMoneyNum )
	end
	
end

--��������ǩ

function XiaXiaQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 20
	qian [1] = 100
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local Give_Money = math.random ( 10000 , 30000 )
		Give_Money = Give_Money * -1
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 2   then
		local GiveMoneyNum = 0.01 * math.random ( 1 , 2 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		CALCULATE_FUNCTIONS_LUA_000070 = GetResString("CALCULATE_FUNCTIONS_LUA_000070")
		CALCULATE_FUNCTIONS_LUA_000071 = GetResString("CALCULATE_FUNCTIONS_LUA_000071")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000071..GiveMoneyNum_Notice..CALCULATE_FUNCTIONS_LUA_000070 )
		GiveMoneyNum = GiveMoneyNum * -1
		QianAddMoney ( role , 1 , GiveMoneyNum )
	end
end

--��ҵ����ǩ

function ShangShangQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 15
	qian [1] = 45
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local GiveExpNum = 0.01 * math.random ( 1 , 4 )
		local GiveExpNum_Notice = GiveExpNum * 100
		CALCULATE_FUNCTIONS_LUA_000072 = GetResString("CALCULATE_FUNCTIONS_LUA_000072")
		CALCULATE_FUNCTIONS_LUA_000073 = GetResString("CALCULATE_FUNCTIONS_LUA_000073")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000073..GiveExpNum_Notice..CALCULATE_FUNCTIONS_LUA_000072 )
		QianAddExp ( role , GiveExpNum , 1 )							----�����飬����2Ϊ��ǰ�ȼ�����İٷֱȻ�������֣�����3Ϊ����(1Ϊ������,2Ϊ������)
	elseif b == 2   then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		-- AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		CALCULATE_FUNCTIONS_LUA_000074 = GetResString("CALCULATE_FUNCTIONS_LUA_000074")
		CALCULATE_FUNCTIONS_LUA_000067 = GetResString("CALCULATE_FUNCTIONS_LUA_000067")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000067..time_Bei..CALCULATE_FUNCTIONS_LUA_000074 )
		TrigASBJY(role,statelv,statetime)
	elseif b == 3   then
		QianAddState ( role , 1 )								-----��״̬��1 Ϊ����ǩ״̬��2Ϊ��ǩ״̬
	end
end

--��ҵ��ǩ

function ShangQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 100
--	qian [1] = 40
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 0 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 50 , 500 )
		QianAddExp ( role , GiveExpNum , 2 )
	end
end

--��ҵ��ǩ

function ZhongQian_Work ( role )
	CALCULATE_FUNCTIONS_LUA_000069 = GetResString("CALCULATE_FUNCTIONS_LUA_000069")
	SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000069 )
end

--��ҵ��ǩ

function XiaQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 100
--	qian [1] = 40
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 0 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 50 , 500 )
		GiveExpNum = GiveExpNum * -1
		QianAddExp ( role , GiveExpNum , 2 )
	end
end

--��ҵ����ǩ

function XiaXiaQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 35
	qian [1] = 75
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local GiveExpNum = 0.01 * math.random ( 1 , 3 )
		local GiveExpNum_Notice = GiveExpNum * 100
		CALCULATE_FUNCTIONS_LUA_000072 = GetResString("CALCULATE_FUNCTIONS_LUA_000072")
		CALCULATE_FUNCTIONS_LUA_000075 = GetResString("CALCULATE_FUNCTIONS_LUA_000075")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000075..GiveExpNum_Notice..CALCULATE_FUNCTIONS_LUA_000072 )
		GiveExpNum = GiveExpNum * -1
		QianAddExp ( role , GiveExpNum , 1 )							----�����飬����2Ϊ��ǰ�ȼ�����İٷֱȻ�������֣�����3Ϊ����(1Ϊ������,2Ϊ������)
	elseif b == 2   then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 100 , 1000 )
		GiveExpNum = GiveExpNum * -1
		QianAddExp ( role , GiveExpNum , 2 )
	elseif b == 3   then
		AddState ( role , role , STATE_CUSI , 10 , 2 )
		RemoveState ( role , STATE_CUSI ) 
		CALCULATE_FUNCTIONS_LUA_000076 = GetResString("CALCULATE_FUNCTIONS_LUA_000076")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000076 )
	end
end

--�鵽Ǯ

function QianAddMoney ( role , Type , Num )
	if Type == 1   then
		local Money_Have = GetChaAttr ( role , ATTR_GD )
		local Money_Add = Money_Have * Num

		Money_Have = Money_Have + Money_Add
		Money_Add = math.floor( Money_Add )

		Money_Have = math.floor ( Money_Have )

		SetCharaAttr ( Money_Have , role , ATTR_GD )
		ALLExAttrSet( role )
		
		if Money_Add > 0   then
			Num = Num * 100
			CALCULATE_FUNCTIONS_LUA_000077 = GetResString("CALCULATE_FUNCTIONS_LUA_000077")
			CALCULATE_FUNCTIONS_LUA_000078 = GetResString("CALCULATE_FUNCTIONS_LUA_000078")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000078..Num..CALCULATE_FUNCTIONS_LUA_000077 )
			if Money_Add >= 200000   then
				local cha_name = GetChaDefaultName ( role )
				CALCULATE_FUNCTIONS_LUA_000079 = GetResString("CALCULATE_FUNCTIONS_LUA_000079")
				CALCULATE_FUNCTIONS_LUA_000080 = GetResString("CALCULATE_FUNCTIONS_LUA_000080")
				Notice ( cha_name..CALCULATE_FUNCTIONS_LUA_000080..Money_Add..CALCULATE_FUNCTIONS_LUA_000079 )
			end
		elseif Money_Add < 0   then
			Num = Num * -100
			CALCULATE_FUNCTIONS_LUA_000081 = GetResString("CALCULATE_FUNCTIONS_LUA_000081")
			CALCULATE_FUNCTIONS_LUA_000082 = GetResString("CALCULATE_FUNCTIONS_LUA_000082")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000082..Num..CALCULATE_FUNCTIONS_LUA_000081 )
		end
	
	elseif Type == 2   then
		local Money_Have = GetChaAttr ( role , ATTR_GD )
		local Money_Add = Num

		Money_Have = Money_Have + Money_Add

		if Money_Have < 0   then
			Money_Have = 0
		end

		SetCharaAttr ( Money_Have , role , ATTR_GD )
		ALLExAttrSet( role )
		if Num > 0   then
			CALCULATE_FUNCTIONS_LUA_000079 = GetResString("CALCULATE_FUNCTIONS_LUA_000079")
			CALCULATE_FUNCTIONS_LUA_000083 = GetResString("CALCULATE_FUNCTIONS_LUA_000083")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000083..Num..CALCULATE_FUNCTIONS_LUA_000079 )
			if Num >= 200000   then
				local cha_name = GetChaDefaultName ( role )
				CALCULATE_FUNCTIONS_LUA_000079 = GetResString("CALCULATE_FUNCTIONS_LUA_000079")
				CALCULATE_FUNCTIONS_LUA_000080 = GetResString("CALCULATE_FUNCTIONS_LUA_000080")
				Notice ( cha_name..CALCULATE_FUNCTIONS_LUA_000080..Num..CALCULATE_FUNCTIONS_LUA_000079 )
			end
		elseif Num < 0   then
			Num = Num * -1
			CALCULATE_FUNCTIONS_LUA_000079 = GetResString("CALCULATE_FUNCTIONS_LUA_000079")
			CALCULATE_FUNCTIONS_LUA_000084 = GetResString("CALCULATE_FUNCTIONS_LUA_000084")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000084..Num..CALCULATE_FUNCTIONS_LUA_000079 )
		end
	end
end

--�鵽����

function QianAddExp ( role , Num , type )
	local lv = GetChaAttr( role, ATTR_LV )
	local exp = Exp(role) 
	local nlexp = GetChaAttrI ( role , ATTR_NLEXP ) 
	local clexp = GetChaAttrI ( role , ATTR_CLEXP )
	local ThisLvexp = nlexp - clexp
	local ExpGet = ThisLvexp * Num
	
	if type == 2   then
		ExpGet = Num
		if lv >= 80   then
			ExpGet = math.floor ( ExpGet / 50 )
		end
	end

	ExpGet = math.floor ( ExpGet )

	exp = exp + ExpGet
	
	if exp > nlexp   then
		exp = nlexp + math.floor ( ( exp - nlexp ) / 50 )
	end
	
	if exp < clexp   then
		local exp1 = Exp(role)
		ExpGet=clexp-exp1
		exp = clexp
	end

	
	SetChaAttrI( role , ATTR_CEXP , exp )

	if lv >= 80   then
			ExpGet = ExpGet * 50
	end

	if ExpGet > 0   then
		
		CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
		CALCULATE_FUNCTIONS_LUA_000085 = GetResString("CALCULATE_FUNCTIONS_LUA_000085")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000085..ExpGet..CALCULATE_EXP_AND_LEVEL_LUA_000047 )
		if ExpGet >= 200000   then
				local cha_name = GetChaDefaultName ( role )
				CALCULATE_FUNCTIONS_LUA_000086 = GetResString("CALCULATE_FUNCTIONS_LUA_000086")
				CALCULATE_FUNCTIONS_LUA_000080 = GetResString("CALCULATE_FUNCTIONS_LUA_000080")
				Notice ( cha_name..CALCULATE_FUNCTIONS_LUA_000080..ExpGet..CALCULATE_FUNCTIONS_LUA_000086 )
		end
	elseif ExpGet < 0   then
		ExpGet = ExpGet * -1
		CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
		CALCULATE_FUNCTIONS_LUA_000087 = GetResString("CALCULATE_FUNCTIONS_LUA_000087")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000087..ExpGet..CALCULATE_EXP_AND_LEVEL_LUA_000047 )
	end

end

--�鵽״̬

function QianAddState ( role , Type )

	local State = { }
	local StateName = { }

	State [0] = STATE_PKZDYS
	State [1] = STATE_PKSFYS
	State [2] = STATE_PKMNYS
	State [3] = STATE_PKJZYS
	State [4] = STATE_PKKBYS
	
	CALCULATE_FUNCTIONS_LUA_000088 = GetResString("CALCULATE_FUNCTIONS_LUA_000088")
	StateName [0] = CALCULATE_FUNCTIONS_LUA_000088
	CALCULATE_FUNCTIONS_LUA_000089 = GetResString("CALCULATE_FUNCTIONS_LUA_000089")
	StateName [1] = CALCULATE_FUNCTIONS_LUA_000089
	CALCULATE_FUNCTIONS_LUA_000090 = GetResString("CALCULATE_FUNCTIONS_LUA_000090")
	StateName [2] = CALCULATE_FUNCTIONS_LUA_000090
	CALCULATE_FUNCTIONS_LUA_000091 = GetResString("CALCULATE_FUNCTIONS_LUA_000091")
	StateName [3] = CALCULATE_FUNCTIONS_LUA_000091
	CALCULATE_FUNCTIONS_LUA_000092 = GetResString("CALCULATE_FUNCTIONS_LUA_000092")
	StateName [4] = CALCULATE_FUNCTIONS_LUA_000092

	local i = math.random ( 0 , 4 )
	local statelv = 0
	local TimeRange = 0
	if Type == 1   then
		TimeRange = 60
	elseif Type == 2   then
		TimeRange = 30
	end
	local statetime = math.random ( 1 , TimeRange )
	statetime = statetime * 60
	
	statelv = 10
	AddState ( role , role , State[i] , statelv , statetime ) 
	CALCULATE_FUNCTIONS_LUA_000093 = GetResString("CALCULATE_FUNCTIONS_LUA_000093")
	CALCULATE_FUNCTIONS_LUA_000094 = GetResString("CALCULATE_FUNCTIONS_LUA_000094")
	SystemNotice ( 	role , CALCULATE_FUNCTIONS_LUA_000094..StateName[i]..CALCULATE_FUNCTIONS_LUA_000093 )
	
end


--��ͼ������

function GiveGoldenMapItem ( role )
	local CheckRandom = math.random ( 1,100 )
	if CheckRandom >= 1 and CheckRandom <= 23   then
		local GiveMoney = 1000 * math.random ( 1, 20 )
		CALCULATE_FUNCTIONS_LUA_000095 = GetResString("CALCULATE_FUNCTIONS_LUA_000095")
		CALCULATE_FUNCTIONS_LUA_000096 = GetResString("CALCULATE_FUNCTIONS_LUA_000096")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000096..GiveMoney..CALCULATE_FUNCTIONS_LUA_000095 )
		AddMoney ( role , 0 , GiveMoney )
	elseif CheckRandom > 23 and CheckRandom <= 28   then
		XianJing ( role , 1 )
	elseif CheckRandom > 28 and CheckRandom <= 33   then
		XianJing ( role , 2 )
	elseif CheckRandom > 33 and CheckRandom <= 40   then
		CALCULATE_FUNCTIONS_LUA_000097 = GetResString("CALCULATE_FUNCTIONS_LUA_000097")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000097 )
		MapRandomtele ( role )
	else
		CALCULATE_FUNCTIONS_LUA_000098 = GetResString("CALCULATE_FUNCTIONS_LUA_000098")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000098 )
		local item_type = BaoXiang_CBTBOX
		local item_type_rad = BaoXiang_CBTBOX_Rad 
		local item_type_count = BaoXiang_CBTBOX_Count 
		local maxitem = BaoXiang_CBTBOX_Mxcount						-- �ս���
		local item_quality = BaoXiang_CBTBOX_Qua
		local General = 0  
		local ItemId = 0 
		local Item_CanGet = GetChaFreeBagGridNum ( role )
	
		for i = 1 , maxitem , 1 do 
			General = item_type_rad [ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local c = -1							--������Ʒ���
		for k = 1 , maxitem , 1 do				-- �������ӵ�ǰ׺���

			d = item_type_rad [ k ] + b

			 if a <= d and a > b   then
				c = k
				break 
			end 
			b = d 

		end 
		if c == -1   then 
			ItemId = 3124 
		else 
			ItemId = item_type [c]  
			ItemCount = item_type_count [c] 
		end 
		GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
		local GoodItem = {}
		GoodItem[0]	=	0110
		GoodItem[1]	=	0112
		GoodItem[2]	=	0114
		GoodItem[3]	=	0116
		GoodItem[4]	=	0118
		GoodItem[5]	=	0120
		GoodItem[6]	=	0151
		GoodItem[7]	=	0396
		GoodItem[8]	=	0398
		GoodItem[9]	=	0400
		GoodItem[10]	=	0402
		GoodItem[11]	=	0404
		GoodItem[12]	=	0406
		GoodItem[13]	=	0408
		GoodItem[14]	=	0411
		GoodItem[15]	=	0413
		GoodItem[16]	=	0588
		GoodItem[17]	=	0590
		GoodItem[18]	=	0592
		GoodItem[19]	=	0594
		GoodItem[20]	=	0596
		GoodItem[21]	=	0598
		GoodItem[22]	=	0600
		GoodItem[23]	=	0602
		GoodItem[24]	=	0748
		GoodItem[25]	=	0750
		GoodItem[26]	=	0752
		GoodItem[27]	=	0754
		GoodItem[28]	=	0756
		GoodItem[29]	=	0758
		GoodItem[30]	=	0760
		GoodItem[31]	=	0824
		GoodItem[32]	=	0860
		GoodItem[33]	=	0861
		GoodItem[34]	=	0862
		GoodItem[35]	=	0863

		local Good_C = 0
		for Good_C = 0 , 35 , 1 do
			if ItemId == GoodItem[Good_C]   then
				local itemname = GetItemName ( ItemId ) 
				local cha_name = GetChaDefaultName ( role ) 
				CALCULATE_FUNCTIONS_LUA_000099 = GetResString("CALCULATE_FUNCTIONS_LUA_000099")
				local message = cha_name..CALCULATE_FUNCTIONS_LUA_000099..itemname  
				Notice ( message )
			end
		end
	end
				

end
------���ձȺ����ر�ͼ������
function GiveGoldenMapItem_JLB ( role )
	local CheckRandom = math.random ( 1,100 )
	local x, y = GetChaPos(role)
	local lv= GetChaAttr(role, ATTR_LV) 
	local a=math.floor ( lv / 5 ) + 826
	local b=math.floor ( lv / 5 ) + 828
	local monserID=math.random(a,b)				--------����ر�ͼ��829��836
	if CheckRandom >= 1 and CheckRandom <= 20   then
		local GiveMoney = 10000 * math.random ( 1, 20 )
		CALCULATE_FUNCTIONS_LUA_000095 = GetResString("CALCULATE_FUNCTIONS_LUA_000095")
		CALCULATE_FUNCTIONS_LUA_000100 = GetResString("CALCULATE_FUNCTIONS_LUA_000100")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000100..GiveMoney..CALCULATE_FUNCTIONS_LUA_000095 )
		AddMoney ( role , 0 , GiveMoney )
	elseif CheckRandom > 20 and CheckRandom <= 24   then
		XianJing ( role , 1 )
	elseif CheckRandom > 24 and CheckRandom <= 28   then
		XianJing ( role , 2 )
	elseif CheckRandom > 28 and CheckRandom <= 33   then
		CALCULATE_FUNCTIONS_LUA_000097 = GetResString("CALCULATE_FUNCTIONS_LUA_000097")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000097 )
		MapRandomtele ( role )
	elseif CheckRandom > 33 and CheckRandom <= 40   then
		CALCULATE_FUNCTIONS_LUA_000101 = GetResString("CALCULATE_FUNCTIONS_LUA_000101")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000101 )
		local new1 = CreateCha(monserID, x, y, 145, 30)
		SetChaLifeTime(new1, 90000)
	else
		CALCULATE_FUNCTIONS_LUA_000098 = GetResString("CALCULATE_FUNCTIONS_LUA_000098")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000098 )
		local item_type = BaoXiang_JLBCBTBOX
		local item_type_rad = BaoXiang_JLBCBTBOX_Rad 
		local item_type_count = BaoXiang_JLBCBTBOX_Count 
		local maxitem = BaoXiang_JLBCBTBOX_Mxcount						-- �ս���
		local item_quality = BaoXiang_JLBCBTBOX_Qua
		local General = 0  
		local ItemId = 0 
		local Item_CanGet = GetChaFreeBagGridNum ( role )
	
		for i = 1 , maxitem , 1 do 
			General = item_type_rad [ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local c = -1							--������Ʒ���
		for k = 1 , maxitem , 1 do				-- �������ӵ�ǰ׺���

			d = item_type_rad [ k ] + b

			 if a <= d and a > b   then
				c = k
				break 
			end 
			b = d 
		end 
		if c == -1   then 
			ItemId = 3124 
		else 
			ItemId = item_type [c]  
			ItemCount = item_type_count [c] 
		end 
		GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
		local GoodItem = {}
		GoodItem[0]	=	0110
		GoodItem[1]	=	0112
		GoodItem[2]	=	0114
		GoodItem[3]	=	0116
		GoodItem[4]	=	0118
		GoodItem[5]	=	0120
		GoodItem[6]	=	0151
		GoodItem[7]	=	0396
		GoodItem[8]	=	0398
		GoodItem[9]	=	0400
		GoodItem[10]	=	0402
		GoodItem[11]	=	0404
		GoodItem[12]	=	0406
		GoodItem[13]	=	0408
		GoodItem[14]	=	0411
		GoodItem[15]	=	0413
		GoodItem[16]	=	0588
		GoodItem[17]	=	0590
		GoodItem[18]	=	0592
		GoodItem[19]	=	0594
		GoodItem[20]	=	0596
		GoodItem[21]	=	0598
		GoodItem[22]	=	0600
		GoodItem[23]	=	0602
		GoodItem[24]	=	0748
		GoodItem[25]	=	0750
		GoodItem[26]	=	0752
		GoodItem[27]	=	0754
		GoodItem[28]	=	0756
		GoodItem[29]	=	0758
		GoodItem[30]	=	0760
		GoodItem[31]	=	0824
		GoodItem[32]	=	0860
		GoodItem[33]	=	0861
		GoodItem[34]	=	0862
		GoodItem[35]	=	0863

		local Good_C = 0
		for Good_C = 0 , 35 , 1 do
			if ItemId == GoodItem[Good_C]   then
				local itemname = GetItemName ( ItemId ) 
				local cha_name = GetChaDefaultName ( role ) 
				CALCULATE_FUNCTIONS_LUA_000099 = GetResString("CALCULATE_FUNCTIONS_LUA_000099")
				local message = cha_name..CALCULATE_FUNCTIONS_LUA_000099..itemname  
				Notice ( message )
			end
		end
	end
				

end

--�������

function CheckGetMapPos ( role , pos_x , pos_y , MapName )
--	SystemNotice ( role , "CheckPos" )
	local Cha_Boat = GetCtrlBoat ( role )
	local ChaIsBoat = 0
	if Cha_Boat ~= nil   then
		role = Cha_Boat
	end

	local Cha_pos_x , Cha_pos_y = GetChaPos ( role )
	local map_name = GetChaMapName ( role )

	local Cha_x_min = pos_x * 100 - 400
	local Cha_x_max = pos_x * 100 + 400
	local Cha_y_min = pos_y * 100 - 400
	local Cha_y_max = pos_y * 100 + 400

	if map_name ~= MapName   then
--		SystemNotice ( role , "map_name"..map_name)
--		SystemNotice ( role , "MapName"..MapName )
--		SystemNotice ( role , "mapname Error" )
		return 0 
	end 

	if Cha_pos_x < Cha_x_min or Cha_pos_x > Cha_x_max   then
	
		return 0
	end

	if Cha_pos_y < Cha_y_min or Cha_pos_y > Cha_y_max   then
		return 0
	end

	return 1
end
	
--��������

---���---------------------

function SuanmingTeshu_Money ( role )
	local a = CheckSuanmingTypeTeshu ( role )			--����õ�ʲôǩ
	if a == 1   then
		CALCULATE_FUNCTIONS_LUA_000060 = GetResString("CALCULATE_FUNCTIONS_LUA_000060")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000060 )
		ShangShangQianTeshu_Money ( role )
	elseif a == 2   then
		CALCULATE_FUNCTIONS_LUA_000061 = GetResString("CALCULATE_FUNCTIONS_LUA_000061")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000061 )
		ShangQianTeshu_Money ( role )
	elseif a == 3   then
		ZhongQian_Money ( role )
--		SystemNotice ( role , "������������...����ʲô��û����" )

	end
end

---����ҵ-------------------

function SuanmingTeshu_Work ( role )
	local a = CheckSuanmingTypeTeshu ( role )
	if a == 1   then
		CALCULATE_FUNCTIONS_LUA_000060 = GetResString("CALCULATE_FUNCTIONS_LUA_000060")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000060 )
		ShangShangQianTeshu_Work ( role )
	elseif a == 2   then
		CALCULATE_FUNCTIONS_LUA_000061 = GetResString("CALCULATE_FUNCTIONS_LUA_000061")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000061 )
		ShangQianTeshu_Work ( role )
	elseif a == 3   then
		ZhongQian_Work ( role )
--		SystemNotice ( role , "������������...����ʲô��û����" )
	end
end

--������
function CheckSuanmingTypeTeshu ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 30
	qian [1] = 80
	qian [2] = 100
	
	for i = 0 , 2 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	return b

end

--�����������ǩ

function ShangShangQianTeshu_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 5
	qian [1] = 60
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local GiveMoneyNum = 10000 * math.random ( 10 , 100 )
		QianAddMoney ( role , 2 , GiveMoneyNum )							----��Ǯ��1Ϊ��������2Ϊ���̶���ֵ
	elseif b == 2   then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		-- AddState( role , role , STATE_SBBLGZ , statelv , statetime )
		CALCULATE_FUNCTIONS_LUA_000066 = GetResString("CALCULATE_FUNCTIONS_LUA_000066")
		CALCULATE_FUNCTIONS_LUA_000067 = GetResString("CALCULATE_FUNCTIONS_LUA_000067")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000067..time_Bei..CALCULATE_FUNCTIONS_LUA_000066 )
		TrigASBBL(role,statelv,statetime)
	elseif b == 3   then
		GiveItem ( role , 0 , 1092 , 1 , 0 )							---����ͼ
	end
end

--���������ǩ

function ShangQianTeshu_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 60
	qian [1] = 100
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end
	
	if b == 1   then
		local Give_Money = 1000 * math.random ( 1 , 20 )
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 2   then
		local hp = Hp ( role )
		local hp_dmg = math.floor ( hp * 0.9 )
		local Give_Money = math.random ( 10000 , 30000 )
		Hp_Endure_Dmg ( role , hp_dmg )
		QianAddMoney ( role , 2 , Give_Money )
		CALCULATE_FUNCTIONS_LUA_000068 = GetResString("CALCULATE_FUNCTIONS_LUA_000068")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000068 )
	end
end


--������ҵ����ǩ

function ShangShangQianTeshu_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 30
	qian [1] = 60
	qian [2] = 90
	qian [3] = 100
--	qian [4] = 100

	for i = 0 , 3 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local Lv_role = Lv ( role )
		local GiveExpNum = ( Lv_role * Lv_role * math.random ( 10 , 100 ) ) * ( 1 / math.max ( 1 , ( 50 - Lv_role ) ) )
		QianAddExp ( role , GiveExpNum , 2 )							
	elseif b == 2   then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		-- AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		CALCULATE_FUNCTIONS_LUA_000074 = GetResString("CALCULATE_FUNCTIONS_LUA_000074")
		CALCULATE_FUNCTIONS_LUA_000067 = GetResString("CALCULATE_FUNCTIONS_LUA_000067")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000067..time_Bei..CALCULATE_FUNCTIONS_LUA_000074 )
		TrigASBJY(role,statelv,statetime)
	elseif b == 3   then
		QianAddState ( role , 1 )								-----��״̬��1 ����ǩ״̬��2��ǩ״̬
	elseif b == 4   then
		QianAddState ( role , 1 )								-----��״̬��1 ����ǩ״̬��2��ǩ״̬
		--QianAddStatePoint ( role , 1 )
	end
end

--������ҵ��ǩ

function ShangQianTeshu_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 50
	qian [1] = 100
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a   then
			b = i + 1
			break
		end
	end

	if b == 1   then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * Lv_role * math.random ( 5 , 50 ) * ( 1 / math.max ( 1 , ( 50 - Lv_role ) ) )
		QianAddExp ( role , GiveExpNum , 2 )
	elseif b == 2   then
		QianAddState ( role , 2 )
	end
end

--�������Ե�
function QianAddStatePoint ( role , Num )
	local CheckNum = CheckStatePointHasGet ( role )
	local a = 1 / math.pow ( 2 , ( CheckNum - 1 ) )
	local check = Percentage_Random ( a )
	if check == 1   then
		local attr_ap = Attr_ap( role )
		local ap_extre = Num
		attr_ap = attr_ap + ap_extre 
		SetCharaAttr( attr_ap, role, ATTR_AP )
		local cha_name = GetChaDefaultName ( role )
		CALCULATE_FUNCTIONS_LUA_000102 = GetResString("CALCULATE_FUNCTIONS_LUA_000102")
		Notice ( cha_name..CALCULATE_FUNCTIONS_LUA_000102 )
		CALCULATE_FUNCTIONS_LUA_000039 = GetResString("CALCULATE_FUNCTIONS_LUA_000039")
		CALCULATE_FUNCTIONS_LUA_000103 = GetResString("CALCULATE_FUNCTIONS_LUA_000103")
		LG ( "Add_StatePoint" , cha_name..CALCULATE_FUNCTIONS_LUA_000103..Num..CALCULATE_FUNCTIONS_LUA_000039 )
	else
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 100 , 1000 )
		QianAddExp ( role , GiveExpNum , 2 )
	end
end

--�������ɫ���Ե�
function CheckStatePointHasGet ( role )
	local str = GetChaAttr( role , ATTR_BSTR )
	local con = GetChaAttr( role , ATTR_BCON )
	local agi = GetChaAttr( role , ATTR_BAGI )
	local dex = GetChaAttr( role , ATTR_BDEX )
	local sta = GetChaAttr( role , ATTR_BSTA )
	local ap = GetChaAttr( role , ATTR_AP )
	local StatePointTotal_Have = str + con + agi + dex + sta + ap - 25
	local Lv_role = Lv ( role )
	local StatePointTotal = 3 + Lv_role + math.floor ( Lv_role / 10 ) * 4 + math.max ( 0 , ( Lv_role - 59 ) )
	local Check = StatePointTotal_Have - StatePointTotal
	return Check
end

--ȡ��ͼ����

function GetTheMapPos ( role , type )
--	SystemNotice( role ,"GetTheMapPos" )
	local MapList = { }
	
	MapList [0] = "NoMap"
	MapList [1] = "garner"
	MapList [2] = "magicsea"
	MapList [3] = "darkblue"

	local PosDateNum = 8
	local PosDateMap = {}
	local PosDateMax_X = {}
	local PosDateMin_X = {}
	local PosDateMax_Y = {}
	local PosDateMin_Y = {}
	
	PosDateMap [0]	=	1
	PosDateMap [1]	=	1
	PosDateMap [2]	=	1
	PosDateMap [3]	=	1
	PosDateMap [4]	=	2
	PosDateMap [5]	=	3
	PosDateMap [6]	=	1
	PosDateMap [7]	=	2
	PosDateMap [8]	=	1

	PosDateMax_X [0]	=	800
	PosDateMax_X [1]	=	940
	PosDateMax_X [2]	=	1023
	PosDateMax_X [3]	=	1012
	PosDateMax_X [4]	=	850
	PosDateMax_X [5]	=	2810
	PosDateMax_X [6]	=	380
	PosDateMax_X [7]	=	1420
	PosDateMax_X [8]	=	1614

	PosDateMin_X [0]	=	700
	PosDateMin_X [1]	=	840
	PosDateMin_X [2]	=	919
	PosDateMin_X [3]	=	912
	PosDateMin_X [4]	=	750
	PosDateMin_X [5]	=	2710
	PosDateMin_X [6]	=	280
	PosDateMin_X [7]	=	1320
	PosDateMin_X [8]	=	1514

	PosDateMax_Y [0]	=	1766
	PosDateMax_Y [1]	=	1350
	PosDateMax_Y [2]	=	1054
	PosDateMax_Y [3]	=	2950
	PosDateMax_Y [4]	=	3083
	PosDateMax_Y [5]	=	691
	PosDateMax_Y [6]	=	1725
	PosDateMax_Y [7]	=	3000
	PosDateMax_Y [8]	=	2695

	PosDateMin_Y [0]	=	1666
	PosDateMin_Y [1]	=	1250
	PosDateMin_Y [2]	=	1017
	PosDateMin_Y [3]	=	2850
	PosDateMin_Y [4]	=	2982
	PosDateMin_Y [5]	=	591
	PosDateMin_Y [6]	=	1675
	PosDateMin_Y [7]	=	2900
	PosDateMin_Y [8]	=	2615


	local PosDateGet = math.random ( 0 , PosDateNum )
--	SystemNotice ( role , "PosDateGet"..PosDateGet )

	local Pos_Map = PosDateMap[ PosDateGet ]
--	SystemNotice ( role , "Pos_Map"..Pos_Map )

	local Pos_X = math.random ( PosDateMin_X [PosDateGet] , PosDateMax_X [PosDateGet] )
--	SystemNotice ( role , "Pos_X"..Pos_X )
	local Pos_Y = math.random ( PosDateMin_Y [PosDateGet] , PosDateMax_Y [PosDateGet] )
--	SystemNotice ( role , "Pos_Y"..Pos_Y )
	
	return Pos_X , Pos_Y , Pos_Map
end
--ȡ���ձȵ�ͼ��ͼ����
function GetTheMapPos_JLB ( role , type )
	local MapList = { }
	MapList [0] = "NoMap"
	MapList [1] = "jialebi"

	local PosDateNum = 3
	local PosDateMap = {}
	local PosDateMax_X = {}
	local PosDateMin_X = {}
	local PosDateMax_Y = {}
	local PosDateMin_Y = {}
	
	PosDateMap [0]	=	1
	PosDateMap [1]	=	1
	PosDateMap [2]	=	1
	PosDateMap [3]	=	1

	PosDateMax_X [0]	=	476 
	PosDateMax_X [1]	=	460 
	PosDateMax_X [2]	=	469 
	PosDateMax_X [3]	=	477 

	PosDateMin_X [0]	=	466
	PosDateMin_X [1]	=	452
	PosDateMin_X [2]	=	462
	PosDateMin_X [3]	=	470

	PosDateMax_Y [0]	=	1052
	PosDateMax_Y [1]	=	980
	PosDateMax_Y [2]	=	1000
	PosDateMax_Y [3]	=	1048

	PosDateMin_Y [0]	=	1000 
	PosDateMin_Y [1]	=	954  
	PosDateMin_Y [2]	=	980  
	PosDateMin_Y [3]	=	1036 

----596,609
----629,953
	local PosDateGet = math.random ( 0 , PosDateNum )
	local Pos_Map = PosDateMap[ PosDateGet ]
	local Pos_X = math.random ( PosDateMin_X [PosDateGet] , PosDateMax_X [PosDateGet] )
	local Pos_Y = math.random ( PosDateMin_Y [PosDateGet] , PosDateMax_Y [PosDateGet] )
	return Pos_X , Pos_Y , Pos_Map
end



--����

function XianJing ( role ,type )
	if type == 1   then
		local hp = Hp ( role )
		local hp_dmg = math.floor ( hp * 0.9 )
		Hp_Endure_Dmg ( role , hp_dmg )
		CALCULATE_FUNCTIONS_LUA_000104 = GetResString("CALCULATE_FUNCTIONS_LUA_000104")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000104 ) 
	elseif type == 2   then
		local hp = Hp ( role )
		local hp_dmg = math.floor ( hp * 0.3 )
		Hp_Endure_Dmg ( role , hp_dmg )
		CALCULATE_FUNCTIONS_LUA_000105 = GetResString("CALCULATE_FUNCTIONS_LUA_000105")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000105 )
	end
end

function MapRandomtele ( role )

	local Birth ={}
	Birth[0]	=	"Argent City"
	Birth[1]	=	"Thundoria Castle"
	Birth[2]	=	"Shaitan City"
	Birth[3]	=	"Icicle Castle"
	Birth[4]	=	"Chaldea Haven"
	Birth[5]	=	"Andes Forest Haven"
	Birth[6]	=	"Abandon Mine Haven"
	Birth[7]	=	"Rockery Haven"
	Birth[8]	=	"Valhalla Haven"
	Birth[9]	=	"Solace Haven"
	Birth[10]	=	"Oasis Haven"
	Birth[11]	=	"Babul Haven"
	Birth[12]	=	"Icicle Haven"
	Birth[13]	=	"Atlantis Haven"
	Birth[14]	=	"Skeleton Haven"
	Birth[15]	=	"Icespire Haven"
	Birth[16]	=	"Zephyr Isle"
	Birth[17]	=	"Glacier Isle"
	Birth[18]	=	"Outlaw Isle"
	Birth[19]	=	"Isle of Chill"
	Birth[20]	=	"Canary Isle"
	Birth[21]	=	"Cupid Isle"
	Birth[22]	=	"Isle of Fortune"
	Birth[23]	=	"Thundoria Castle"
	Birth[23]	=	"Thundoria Harbor"
	Birth[24]	=	"Sacred Snow Mountain"
	Birth[25]	=	"Andes Forest Haven"
	Birth[26]	=	"Oasis Haven"
	Birth[27]	=	"Icespire Haven"
	Birth[28]	=	"Lone Tower Entrace"
	Birth[29]	=	"Barren Cavern Entrance"
	Birth[30]	=	"Abandon Mine 2"
	Birth[31]	=	"Silver Mine 2"
	Birth[32]	=	"Silver Mine 3"
	Birth[33]	=	"Abandon Mine 1"
	Birth[34]	=	"Lone Tower 2"
	Birth[35]	=	"Lone Tower 3"
	Birth[36]	=	"Lone Tower 4"
	Birth[37]	=	"Lone Tower 5"
	Birth[38]	=	"Lone Tower 6"
	Birth[39]	=	"Argent Bar"

	local PosRandom = math.random ( 0 , 39 )
	DelBagItem ( role , 1093 , 1 )
	MoveCity(role, Birth[PosRandom] )

end


--�����ߵ���Ч��

function check_item_valid ( role , Item )
	local Item_type = GetItemType ( Item )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	if Item_type <= 29 or (Item_type==59 and GetElfLV(Item)<JLMAXLV)   then
		if Item_URE~=0 and Item_URE <= 49   then
			return 0
		else
			return 1
		end
	end
	if Item_type==59 and GetElfLV(Item)>=JLMAXLV   then 
		if Item_URE <= 49   then
			return 0
		else
			return 1
		end
	end
	return 1
end
--��ɫ��ʱ��
--��������ɫ���󣬵���Ƶ�ʣ��룩�����ô���
--����ֵ����
--function HLxingnang_timer(role, freq, time) 
--	local resume_freq = 30 
--	local now_tick = GetChaParam(role, 1) 

--	SetChaParam(role, 1, now_tick + freq * time) 
	
	--hp�ظ�
--	if math.fmod(now_tick, resume_freq) == 0 and now_tick > 0   then 
--		local xingnang = GetChaItem ( role , 3 , 0  )
--		local heilong = GetItemID (xingnang)
--		if heilong == 5872   then 
--			local hp = GetChaAttr( role , ATTR_HP )
--			local mxhp = GetChaAttr( role , ATTR_MXHP) 
--			if hp < mxhp*0.5   then
--				hp = mxhp
--				SetCharaAttr(hp, role, ATTR_HP) 
--			local ure = GetItemAttr(xingnang, ITEMATTR_URE)
--			local ure_resume = 2000 
--				ure = ure - ure_resume 
--			SetItemAttr(xingnang, ITEMATTR_URE, ure )
--				if ure <1000   then 
--					RemoveChaItem ( role , 5872 , 1 , 2 , 3, 2 , 1  )
--				end 
--			end
--		end
--	end
--end

function GiveGold(role,amount)
	local Gold			= GetChaAttr(role,ATTR_GD)
	local Gold_MaxLimit	= 2000000000
	local Gold_MinLimit	= 0
	local Gold_Add		= amount
	local Gold_Total	= Gold + Gold_Add
	if Gold_Total >= Gold_MaxLimit then
		SetChaAttrI(role,ATTR_GD,Gold_MaxLimit)
	elseif Gold_Total <= Gold_MinLimit then
		SetChaAttrI(role,ATTR_GD,Gold_MinLimit)
	else
		SetChaAttrI(role,ATTR_GD,Gold_Total)
	end
	RefreshCha(role)
end

function GiveReputation(role,num)
	local Fame			= GetChaAttr(role, ATTR_FAME)
	local FameAdd		= num
	local FameMinLimit	= 0
	local FameMaxLimit	= 100000000
	local FinalFame		= Fame + FameAdd

	if FinalFame >= FameMaxLimit then
		SetCharaAttr(FameMaxLimit, role, ATTR_FAME)
	elseif FinalFame <= FameMinLimit then
		SetCharaAttr(FameMinLimit, role, ATTR_FAME)
	else
		SetCharaAttr(FinalFame, role, ATTR_FAME)
	end
	RefreshCha(role)
end

--��ɫ��ʱ��
--��������ɫ���󣬵���Ƶ�ʣ��룩�����ô���
--����ֵ����
GMSendNotice_SNum=1
function GMSendNotice()
	local mini=tonumber(os.date("%M"))
	local mini0=math.fmod(mini,5)
	local minis=tonumber(os.date("%S"))
	if mini0==0 and minis<5   then
	-- if 1   then
		GMNotice(GMSendANotice[GMSendNotice_SNum])
		GMSendNotice_SNum=GMSendNotice_SNum+1
		if GMSendNotice_SNum>GMSendANotice_Num   then 
			GMSendNotice_SNum=1
		end 
	end 
end

playerbyname = {}

function cha_timer(role, freq, time) 

	local resume_freq = 5
	local now_tick = GetChaParam(role, 1) 
	local is_role_living = -1
	SetChaParam(role, 1, now_tick + freq * time) 
	
	
	if (IsPlayer(role) == 1)   then
		PIO_Effect_Cloak(role,now_tick)
		--Swings_Effect(role,now_tick)
		--AmpSys.Timer(role)
		--PIO_Effect_Zodiac(role,now_tick)
		--marriage_effect(role, freq, time)
		--TransformationTick(role)
		--TimeROSO(role, freq, time)
		JLXiaoHao(role,now_tick)
		FreeLunch:UpdateOnlineTime(role, now_tick)
		--CTF_Timer(role)				
		---CI.Timer(role)				
	end
	--Helm_Timer(role,now_tick)
	--VIP.AddState(role,now_tick)
	--PKO_VIP_Necklace(role, now_tick)
	--Helm_Timer(role,now_tick)	
	if now_tick==1   then
		--ZodiacEffect(role,now_tick)
		--VIP_Necklace(Player)
		BB85_6473_Inhand(role,now_tick)
		BB85_6473_Inbag(role,now_tick)
		--BB85_6473_Inhand9(role,now_tick)
		--BB85_6473_Inhand6(role,now_tick)
		BB85_6474_Inbag(role,now_tick)
		BB85_6474_Inhand(role,now_tick)
		BB85_6475_Inbag(role,now_tick)
		BB85_6475_Inhand(role,now_tick)
		BB85_6476_Inbag(role,now_tick)
		BB85_6476_Inhand(role,now_tick)
		BB85_6477_Inbag(role,now_tick)
		BB85_6477_Inhand(role,now_tick)
		BB85_6478_Inbag(role,now_tick)
		BB85_6478_Inhand(role,now_tick)
		BB85_6479_Inbag(role,now_tick)
		BB85_6479_Inhand(role,now_tick)
		ZBbuffState(role,now_tick)
		ZBNSDstate(role,now_tick)
		ZB8ItemX(role,now_tick)
		ZB8Item(role,now_tick)
		NewMGH(role,now_tick)
	end
	if now_tick==2   then
		SBTime(role,now_tick)
		ZB8ItemCharge(role,now_tick)
	end
	if now_tick==3   then
		ZBDebuffStateRS(role,now_tick)
		WLface(role,now_tick)
	end

	local mxhp=GetChaAttr (role , ATTR_MXHP)
	if math.fmod(now_tick, resume_freq) == 0 and now_tick > 0   then
		ZB8ItemCharge(role,now_tick)
		ZB8Item(role,now_tick)
		MGHZKouTime(role,now_tick)
		TGiveMGHZ(role,now_tick)
		KouMoHeTime(role,now_tick)
		KouYuRenTime(role,now_tick)
		MSG_TEST("1")
		CHYLD(role, now_tick)---��C����һ����
		CHTLD(role, now_tick)--̫����
		MSG_TEST("2")
-------------------ħ��
		MoJianBag(role,now_tick)-------ħ�����Ұ�
		MoJianHand(role,now_tick)--------ħ��������
		MSG_TEST("3")
		HeiLong(role,now_tick)
		HPresume(role,now_tick,is_role_living)
		XZDLL_jzzwx(role,now_tick)
		MSG_TEST("4")
		SBTime(role,now_tick)
		QingBaoWenJian(role,now_tick)
		ZhongShenTaoZhuang(role,now_tick)
		MSG_TEST("5")
		XiangLian(role,now_tick)
		MoonBox(role,now_tick)
		JianYuKa(role ,now_tick)
		MSG_TEST("6")
		XSJYPeiYangPing(role,now_tick)
		XingZuoKaTX(role,now_tick)
		MSG_TEST("7")
		KouWaWa (role,now_tick)
		ZBDebuffState(role,now_tick)
		ZBDebuffStateRS(role,now_tick)
		ZBbuffState(role,now_tick)
		ZBNSDstate(role,now_tick)
		MSG_TEST("8")
		MFDbox(role,now_tick)	
		HaiDaoQi(role ,now_tick)
		MSG_TEST("9")
		DelKWKG(role ,now_tick)
		--DelKWKGbag(role,now_tick)
		DelJingLing (role,now_tick)
	end	
local DEArmor = GetEquipItemP(role, 2)
local DEArmorID = GetItemID(DEArmor)
local DEGloves = GetEquipItemP(role, 3)
local DEGlovesID = GetItemID(DEGloves)
local DEBoots = GetEquipItemP(role, 4)
local DEBootsID = GetItemID(DEBoots)
local DEHelm = GetEquipItemP(role, 0)
local DEHelmID = GetItemID(DEHelm)

local validSets = {
    {9469, 9468, 9470, 9471},
    {6124, 6125, 6126, 6127},
    {6120, 6121, 6122, 6123},
    {6116, 6117, 6118, 6119},
    {6112, 6113, 6114, 6115},
    {6108, 6109, 6110, 6111},
    {6104, 6105, 6106, 6107}
}

local function isSetComplete(helmID, armorID, glovesID, bootsID)
    for _, set in ipairs(validSets) do
        if helmID == set[1] and armorID == set[2] and glovesID == set[3] and bootsID == set[4] then
            return true
        end
    end
    return false
end

if isSetComplete(DEHelmID, DEArmorID, DEGlovesID, DEBootsID) then
    local statelv = 1
    local statetime = 3600
    AddState(role, role, DEATHSETAPP, statelv, statetime)
else
    local state_sarg = GetChaStateLv(role, DEATHSETAPP)
    if state_sarg ~= 0 then
        RemoveState(role, DEATHSETAPP)
    end
end

		local Necklace = GetEquipItemP( role, 5 )
		local Necklace_ID = GetItemID ( Necklace )
		if(Necklace_ID == 7287 or Necklace_ID== 7286 or Necklace_ID== 7285 or Necklace_ID== 6578)  then
			local statelv = 1
			local statetime = 3600
			AddState ( role , role , VIPNECKY , statelv , statetime ) 
		else
			local state_vipnecky = GetChaStateLv ( role , VIPNECKY )
			if state_vipnecky ~= 0   then
				SystemNotice( role , "You've took off your VIP Necklace. Effect Removed!")
				RemoveState ( role , VIPNECKY )
			end
		end
		
	local Necklace = GetEquipItemP( role, 5 )
		local Necklace_ID = GetItemID ( Necklace )
		if(Necklace_ID == 6999)  then
			local statelv = 1
			local statetime = 3600
			AddState ( role , role , NECK1 , statelv , statetime ) 
		else
			local state_neck1 = GetChaStateLv ( role , NECK1 )
			if state_neck1 ~= 0   then
				SystemNotice( role , "You've took off your Necklace App 1. Effect Removed!")
				RemoveState ( role , NECK1 )
			end
		end
		
	local Ring = GetEquipItemP( role, 8 )
		local Ring_ID = GetItemID ( Ring )
		if(Ring_ID == 7631)  then
			local statelv = 1
			local statetime = 3600
			AddState ( role , role , STATE_BDH , statelv , statetime ) 
		else
			local state_bdh = GetChaStateLv ( role , STATE_BDH )
			if state_bdh ~= 0   then
				SystemNotice( role , "You've took off your Frozen Ring. Effect Removed!")
				RemoveState ( role , STATE_BDH )
			end
		end
	if math.fmod(now_tick, 6) == 0 and now_tick > 0   then
		TakePetEndure( role , now_tick)	
		TakeUreItemHTXD (role,now_tick)		
	end
	if math.fmod(now_tick, 30) == 0 and now_tick > 0   then  --2008��ʥ�����鼰�Ϲ����   �������ͷ�;�30��1��
		WLface(role,now_tick)             --2008��ʥ�����鼰�Ϲ����   �������ͷ ��buff5��1ˢ	
	end
	if math.fmod(now_tick, 12) == 0 and now_tick > 0   then
		NewMGH(role,now_tick)
	end


           local playerCurrentMap = GetChaMapName(role)
		if playerCurrentMap == "garner"   then
  	local Item_Revive = CheckBagItem(role, 8066)
  		if(Item_Revive > 0)  then -- if has the item
    		if(IsChaLiving(role) ~= 1)  then -- check if player is dead
      		SetRelive(role,role,1,"Hey! Do you wish to be revived?") -- revive the player
		TakeItem(  role,0,8066,1)
    		end
  	end
end
	-- if math.fmod(now_tick, 30) == 0 and now_tick > 0   then--ÿ30����ж�һ��
			-- jsqbijiao( role , now_tick)
	-- end

	if math.fmod(now_tick, 60 ) == 0 and now_tick > 0   then 
	Rwine_freq(role,now_tick)
		DelReturnStone(role,now_tick)
	end
	local playerCurrentMap = GetChaMapName(role)
  	local Item_Revive = CheckBagItem(role, 8066)
  		if(Item_Revive > 0)  then -- if has the item
    		if(IsChaLiving(role) ~= 1)  then -- check if player is dead
      		SetRelive(role,role,1,"Hey! Do you wish to be revived?") -- revive the player
			TakeItem(  role,0,8066,1)
    		end
  	end
end


do
	PkoPlayerVariable = {}
	Timer = cha_timer
	cha_timer = function(r,f,t)
		Timer(r,f,t)
		if(IsPlayer(r) == 1)   then
			local characterID = GetPlayerID(GetChaPlayer(r))
			playerbyname[GetChaDefaultName(r)] = r
			PkoPlayerVariable[characterID] = r
		end
	end
	PKOPLAYER = function(id)
		if(PkoPlayerVariable[id] ~= nil)   then
			if IsPlayer(PkoPlayerVariable[id]) == 1   then
				PkoPlayerVariable[id] = PkoPlayerVariable[id]
			else
				PkoPlayerVariable[id] = nil
			end
		else
			PkoPlayerVariable[id] = nil
		end
		return PkoPlayerVariable[id]
	end
end
function GetElfSkillLv(Param,Skill)
	local Skid2 = GetNum_Part2(Param)
	local Sklv3 = GetNum_Part3(Param)
	local Skid4 = GetNum_Part4(Param)
	local Sklv5 = GetNum_Part5(Param)
	local Skid6 = GetNum_Part6(Param)
	local Sklv7 = GetNum_Part7(Param)
	if Skill == Skid2 then
		return Sklv3
	elseif Skill == Skid4 then
		return Sklv5
	elseif Skill == Skid6 then
		return Sklv7
	end
	return 0
end
-------------------��������
function HeiLong(role,now_tick)
	local item = GetChaItem(role, 2, 2)                               --- ȡ��ɫ��������3�����
	if item ==nil   then
		return
	end
	local heilong = GetItemID (item)

	if heilong == 5872   then 
		local sencend_30 = 30
		if math.fmod(now_tick, sencend_30) == 0 and now_tick > 0   then
			local hp = GetChaAttr( role , ATTR_HP )
			local mxhp = GetChaAttr( role , ATTR_MXHP) 
			if hp < mxhp*0.5 and hp > 1   then
				hp = mxhp
				SetCharaAttr(hp, role, ATTR_HP) 
				RefreshCha(role)
				local ure = GetItemAttr(item, ITEMATTR_URE)
				local ure_resume = 100 
					ure = ure - ure_resume 
				SetItemAttr(item, ITEMATTR_URE, ure )
				if ure <50   then 
					RemoveChaItem ( role , 5872 , 1 , 2 , 2, 2 , 1  )
					CALCULATE_FUNCTIONS_LUA_000106 = GetResString("CALCULATE_FUNCTIONS_LUA_000106")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000106 )
				end
			end
		end
	end	
end
	--hp�ظ�
function HPresume(role,now_tick,is_role_living)
	if is_role_living == -1   then
		is_role_living = IsChaLiving(role)
	end
	if is_role_living == 1   then 
		Resume(role)
	end
	----�̻��;�
	local el_nj = GetEquipItemP(role,9)
	local el_nj_ID= GetItemID (el_nj)
	--SystemNotice ( role , "el_nj_ID=="..el_nj_ID )
	if el_nj_ID==3669   then
		local ure = GetItemAttr(el_nj, ITEMATTR_URE)
		--SystemNotice ( role , "ure=="..ure )
		local ure_resume = 1000 
		ure = ure - ure_resume 
		--SystemNotice ( role , "ure1=="..ure )
		SetItemAttr(el_nj, ITEMATTR_URE, ure )
		SynChaKitbag(role,13)
		if ure <1000   then 
		RemoveChaItem ( role , 3669 , 1 , 1 , -1, 2 , 1  )
		end 
	end
	local Max_xl = GetEquipItemP(role,5)
	local Max_xl_ID= GetItemID (Max_xl)
	--SystemNotice ( role , "Max_xl_ID=="..Max_xl_ID )
	if Max_xl_ID==2980   then
		local statelv = 1
		local statetime = 1
		AddState ( role , role , STATE_ILOVEDAD , statelv , statetime ) 
--			SystemNotice ( role , "��ܰ����ף���Ҳ�ܰ���" )
	end
	local Dina_xl = GetEquipItemP(role,8)
	local Dina_xl_ID= GetItemID (Dina_xl)
	local Dina_x2 = GetEquipItemP(role,2)
	local Dina_x2_ID= GetItemID (Dina_x2)
	if Dina_xl_ID==2577 and Dina_x2_ID==2817   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_BBRING1 , statelv , statetime ) 
	elseif Dina_xl_ID==2578 and Dina_x2_ID==2820   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_BBRING2 , statelv , statetime ) 
	elseif Dina_xl_ID==2579 and Dina_x2_ID==2823   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_BBRING3 , statelv , statetime ) 
	elseif Dina_xl_ID==2580 and Dina_x2_ID==2826   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_BBRING4 , statelv , statetime ) 
	elseif Dina_xl_ID==2581 and Dina_x2_ID==2832   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_BBRING5 , statelv , statetime ) 
	elseif Dina_xl_ID==2582 and Dina_x2_ID==2829   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_BBRING6 , statelv , statetime ) 
	else
		local statelv_bbring1 = GetChaStateLv ( role , STATE_BBRING1 )
		if statelv_bbring1~=0   then
			RemoveState ( role , STATE_BBRING1 ) 
		end
		local statelv_bbring2 = GetChaStateLv ( role , STATE_BBRING2 )
		if statelv_bbring2~=0   then
			RemoveState ( role , STATE_BBRING2 ) 
		end
		local statelv_bbring3 = GetChaStateLv ( role , STATE_BBRING3 )
		if statelv_bbring3~=0   then
			RemoveState ( role , STATE_BBRING3 ) 
		end
		local statelv_bbring4 = GetChaStateLv ( role , STATE_BBRING4 )
		if statelv_bbring4~=0   then
			RemoveState ( role , STATE_BBRING4 ) 
		end
		local statelv_bbring5 = GetChaStateLv ( role , STATE_BBRING5 )
		if statelv_bbring5~=0   then
			RemoveState ( role , STATE_BBRING5 ) 
		end
		local statelv_bbring6 = GetChaStateLv ( role , STATE_BBRING6 )
		if statelv_bbring6~=0   then
			RemoveState ( role , STATE_BBRING6 ) 
		end	
	end
end
		
		
-----------------------���е�����+��ָ������
function XZDLL_jzzwx(role,now_tick)

	local Eric_XZDLL = GetEquipItemP(role,8)
	local Eric_XZDLL_ID = GetItemID (Eric_XZDLL)
	if Eric_XZDLL_ID == 5827  or Eric_XZDLL_ID == 5871   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_XZDLL , statelv , statetime )
	else
		local statelv_XZDLL = GetChaStateLv ( role , STATE_XZDLL )
			if statelv_XZDLL~=0   then
				RemoveState ( role , STATE_XZDLL ) 
			end
	end
end
-----------------------���е�����
----------------------˫��
function SBTime(role,now_tick)
	local Item_SBNum = CheckBagItem( role, 6370 )
	local Item_SBNum2 = CheckBagItem( role, 6371 )
	local statelv_SB = GetChaStateLv ( role , STATE_SBJYGZ )
	local statelv_SBBL = GetChaStateLv ( role , STATE_SBBLGZ )
	local NTC=0
	if Item_SBNum == 1   then
		local Have_SBItem = GetChaItem2 (role , 2, 6370 )
		local SB_Type = GetItemAttr (Have_SBItem,ITEMATTR_VAL_AGI)
		local SB_Open = GetItemAttr (Have_SBItem,ITEMATTR_VAL_STR)
		local SB_LV = GetItemAttr (Have_SBItem,ITEMATTR_VAL_DEX)
		local Now_Time = GetItemAttr (Have_SBItem,ITEMATTR_VAL_CON)
		local Buff_Lv = GetItemAttr (Have_SBItem,ITEMATTR_VAL_STA)
		local statelv=0
		local statetime = 0
		if SB_Type == 1 and SB_Open == 0   then
			local SB_Time = SB_LV * 3600
			if Now_Time >= SB_Time   then
				DelBagItem ( role , 6370 , 1 )
				DelBagItem ( role , 6371 , 1 ) 
				CALCULATE_FUNCTIONS_LUA_000107 = GetResString("CALCULATE_FUNCTIONS_LUA_000107")
				SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000107)
				if statelv_SB==11   then
					RemoveState ( role , STATE_SBJYGZ ) 
				end
				return	
			else
				statelv = 11
				statetime = SB_Time - Now_Time
				--SystemNotice(role,"���ԣ�Now_Time==="..Now_Time)	
				if Now_Time == 0 or now_tick == 5   then
					NTC= 1
					Now_Time = Now_Time+5
					SetItemAttr (Have_SBItem,ITEMATTR_VAL_CON,Now_Time)
				end
				local  ret = AddexpItem(role,Have_SBItem,statelv,statetime,NTC) 
				if ret == 1 and Now_Time ~= 0 and now_tick ~= 5   then
					Now_Time = Now_Time+5
					SetItemAttr (Have_SBItem,ITEMATTR_VAL_CON,Now_Time)
				end
				return
			end
		elseif statelv_SB==11   then
			--SystemNotice(role,"���ԣ��Ƴ�˫��")
			RemoveState ( role , STATE_SBJYGZ )
			return
		end
		if SB_Type == 3 and SB_Open == 0   then
			local SB_Time = SB_LV*3600
			if Now_Time >= SB_Time   then
				DelBagItem ( role , 6370 , 1 )
				CALCULATE_FUNCTIONS_LUA_000107 = GetResString("CALCULATE_FUNCTIONS_LUA_000107")
				SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000107)
			else
				local statelv = 2
				local statetime = SB_Time-Now_Time
				if Now_Time == 0 or now_tick == 5   then
					NTC= 1
					Now_Time = Now_Time+5
					SetItemAttr (Have_SBItem,ITEMATTR_VAL_CON,Now_Time)
				end
				local  ret = AddBLItem(role,Have_SBItem,statelv,statetime,NTC) 
				if ret == 1 and Now_Time ~= 0   then
					Now_Time = Now_Time+5
					SetItemAttr (Have_SBItem,ITEMATTR_VAL_CON,Now_Time)
				end
			end
		elseif statelv_SBBL ==2   then
			RemoveState ( role , STATE_SBBLGZ ) 
		end
	elseif Item_SBNum2 == 1   then
		local Have_SBItem = GetChaItem2 (role , 2, 6371 )
		local SB_Type = GetItemAttr (Have_SBItem,ITEMATTR_VAL_AGI)
		local SB_Open = GetItemAttr (Have_SBItem,ITEMATTR_VAL_STR)
		local SB_LV = GetItemAttr (Have_SBItem,ITEMATTR_VAL_DEX)
		local Now_Time = GetItemAttr (Have_SBItem,ITEMATTR_VAL_CON)         
		local Buff_Lv = GetItemAttr (Have_SBItem,ITEMATTR_VAL_STA)
		local SB_Temp = 0
		local NTC = 0 
		if SB_Type == 1 and SB_Open == 0   then
			local SB_Time =  3600
			if Now_Time >= SB_Time   then
				DelBagItem ( role , 6371 , 1 ) 
				CALCULATE_FUNCTIONS_LUA_000107 = GetResString("CALCULATE_FUNCTIONS_LUA_000107")
				SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000107)
			else
				local statelv = 0
				if Buff_Lv == 4   then
					statelv = 6
				elseif Buff_Lv == 7   then
					statelv = 8
				end
				local statetime = SB_Time-Now_Time
				if Now_Time == 0 or now_tick == 5   then
					NTC= 1
					Now_Time = Now_Time+5
					SetItemAttr (Have_SBItem,ITEMATTR_VAL_CON,Now_Time)
				end
				local  ret = AddexpItem(role,Have_SBItem,statelv,statetime,NTC) 
				if ret == 1 and Now_Time ~= 0   then
					Now_Time = Now_Time+5
					SetItemAttr (Have_SBItem,ITEMATTR_VAL_CON,Now_Time)
				end
			end
		else
			if statelv_SB==6 or statelv_SB== 8   then
				RemoveState ( role , STATE_SBJYGZ ) 
			end
		end
	end
	if  Item_SBNum == 0   then
				if  statelv_SB ==11   then
			RemoveState ( role , STATE_SBJYGZ ) 
		end
		if statelv_SBBL ==2   then
			RemoveState ( role , STATE_SBBLGZ ) 
		end
	end
	if Item_SBNum2~= 1   then 
		if statelv_SB==6 or statelv_SB== 8   then
			RemoveState ( role , STATE_SBJYGZ ) 
		end
	end
end
-----------------------�鱨�ļ�
function QingBaoWenJian(role,now_tick)
	local qingbao = CheckBagItem(role,6322)
	if qingbao ~= 0   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_QB , statelv , statetime )
	else
		local statelv_QB = GetChaStateLv ( role , STATE_QB )
			if statelv_QB~=0   then
				RemoveState ( role , STATE_QB ) 
			end
	end
end
-----------------------�鱨�ļ�
-----------------------������װ
function ZhongShenTaoZhuang(role,now_tick)
	local ZhongShen_Value = CheckItem_ZHONGSHEN (role)
	if ZhongShen_Value ~= 0   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_zhongshen , statelv , statetime )
		return
	else
		local statelv_ZhongShen = GetChaStateLv ( role , STATE_zhongshen )
		if statelv_ZhongShen~=0   then
				RemoveState ( role ,STATE_zhongshen ) 
			return
			end
		return
	end
end
-----------------------������װ

----------------------�����ħ����ʱ���ж�
	--	local time_now = 0
	--	time_now = time_now + 5
	--	if time_now > 300   then
	--		return 300
	--	else
	--		return 99
	--	end
-----------------------����������
function XiangLian(role,now_tick)
	local xianglian = GetEquipItemP(role,5)
	local xianglian_id = GetItemID (xianglian)	
	if xianglian_id == 5870   then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_XLTX , statelv , statetime )
	else
		local statelv_XLZWS = GetChaStateLv ( role , STATE_XLTX )
		if statelv_XLZWS~=0   then
			RemoveState ( role , STATE_XLTX ) 
		end
	end	
end
--	-----------------------------------------------------����ʮ�´�բз�
-- function XieXieHa(role,now_tick)
	-- local crab = GetChaItem ( role , 2 , 1  ) --ȡ��ɫ�����ڶ�����ָ��
	-- local crab_ID= GetItemID (crab)				--ȡ��ָ��ĵ���ID		
	-- if crab_ID==58   then				--�������IDΪ58 ��ô
		-- local ENERGY = GetItemAttr(crab, ITEMATTR_ENERGY)			--ȡ�õ��ߵĵ�ǰ�;�
		-- local ENERGY_resume = 1			--����ÿ���ӿ�ȡֵΪ1
		-- if ENERGY <= 0   then
			-- ENERGY = 0
		-- end
				-- if ENERGY ==0   then			--����;�Ϊ0
			-- SystemNotice ( role , "з���;���Ϊ0���뾡�쵽�����������̡���������ȡз����" )
			-- else 					--����;ò�Ϊ0
			-- ENERGY = ENERGY - ENERGY_resume  		--�ó��۳����ʵ��ֵ
			-- SetItemAttr(crab, ITEMATTR_ENERGY, ENERGY )			--��ô���õ��ߵĵ�ǰ�;�Ϊ�۳����ʵ��ֵ  URE
		-- end		
	-- end
-- end
------------------------------------kokora------------------------------------------
	--local Limit_HeiLong_freq = 3600*24*7 ---------�ϻ�����������
	--if math.fmod(now_tick, Limit_HeiLong_freq) == 0 and now_tick > 0   then 
	--	Heilong_Star_Count=0
	--end	
	--local Limit_TeDengJiang_freq = 3600*24 ---------�ϻ����صȽ�����
	--if math.fmod(now_tick, Limit_TeDengJiang_freq) == 0 and now_tick > 0   then 
	--	TeDengJiang_Star_Count=0
	--end
	--local Limit_YiDengJiang_freq = 3600 ---------�ϻ����صȽ�����
	--if math.fmod(now_tick, Limit_YiDengJiang_freq) == 0 and now_tick > 0   then 
	--	YiDengJiang_Star_Count=0
	--end

	-----------------------------------------------------������
	--local Rwine_freq = 60
	
	--if math.fmod(now_tick, Rwine_freq) == 0 and now_tick > 0   then 
		--local Rwine = GetChaItem ( role , 2 , 1  ) --ȡ��ɫ�����ڶ�����ָ��
		--local Rwine_ID= GetItemID (Rwine)				--ȡ��ָ��ĵ���ID
		
		--if Rwine_ID==2967   then				--�������IDΪ2967 ��ô
			--local ENERGY = GetItemAttr(Rwine, ITEMATTR_ENERGY)			--ȡ�õ��ߵĵ�ǰ�;�
			--local ENERGY_resume = 1			--����ÿ���ӿ�ȡֵΪ1
			--if ENERGY <= 0   then
				--ENERGY = 0
			--end
	
			--if ENERGY ==0   then			--����;�Ϊ0
				--SystemNotice ( role , "�������;���Ϊ0,���Ǿ���Ũ��ʱ,���õ��ϰ塤Լɪ���ǻ������." )
	 		--else 					--����;ò�Ϊ0
				--ENERGY = ENERGY - ENERGY_resume  		--�ó��۳����ʵ��ֵ
				--SetItemAttr(Rwine, ITEMATTR_ENERGY, ENERGY )			--��ô���õ��ߵĵ�ǰ�;�Ϊ�۳����ʵ��ֵ  URE
			--end		
		--end
--end

---------------------------------------------------------------------------------���200
	--[[local one_minite=60														--�趨one_miniteΪ60��
	if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
		local num_huoju=0                                          --
		local item_huoju=0	
		num_huoju = CheckBagItem( role, 5825 )
		if num_huoju==1   then
			item_huoju = GetChaItem2 ( role , 2 , 5825 )
			local item_huoju_ure=GetItemAttr(item_huoju,ITEMATTR_URE)							
			if item_huoju_ure>=50   then
				item_huoju_ure=item_huoju_ure-50
				SetItemAttr(item_huoju,ITEMATTR_URE,item_huoju_ure)
			end
		end		
	end]]
function MoonBox(role,now_tick)
	local one_minite=60														--�趨one_miniteΪ60��
	if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
		local num_moonbox_feijiu=0                                          --
		local item_moonbox=0	
		local i=5786
		for i=5786,5790,1 do 
			local num_moonbox_feijiu=0
			num_moonbox_feijiu = CheckBagItem( role, i)
			if num_moonbox_feijiu==1   then
					item_moonbox = GetChaItem2 ( role , 2 , i )
				local item_moonbox_ure=GetItemAttr(item_moonbox,ITEMATTR_URE)
						--SystemNotice ( role , "�Ͼɵ��¹ⱦ�еĵ�ǰ����Ϊ"..item_moonbox_ure )			
				if item_moonbox_ure>=50   then
					item_moonbox_ure=item_moonbox_ure-50
					SetItemAttr(item_moonbox,ITEMATTR_URE,item_moonbox_ure)
				end
			end	
		end
	end
end
---------------------------------------------------------------------------------�Ͼɵ��¹ⱦ��60
		--[[local one_minite=60														--�趨one_miniteΪ60��
		if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
			local num_moonbox_feijiu=0                                          --
			local item_moonbox=0	
			num_moonbox_feijiu = CheckBagItem( role, 5786 )
			if num_moonbox_feijiu==1   then
				item_moonbox = GetChaItem2 ( role , 2 , 5786 )
				local item_moonbox_ure=GetItemAttr(item_moonbox,ITEMATTR_URE)
						--SystemNotice ( role , "�Ͼɵ��¹ⱦ�еĵ�ǰ����Ϊ"..item_moonbox_ure )			
				if item_moonbox_ure>=50   then
					item_moonbox_ure=item_moonbox_ure-50
					SetItemAttr(item_moonbox,ITEMATTR_URE,item_moonbox_ure)
				end
			end		
		end
	if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
		local num_moonbox_chenjiu=0                                          --
		local item_moonbox=0	
		num_moonbox_chenjiu = CheckBagItem( role, 5787 )
		if num_moonbox_chenjiu==1   then
			item_moonbox = GetChaItem2 ( role , 2 , 5787 )
			local item_moonbox_ure=GetItemAttr(item_moonbox,ITEMATTR_URE)
					--SystemNotice ( role , "�¾ɵ��¹ⱦ�еĵ�ǰ����Ϊ"..item_moonbox_ure )			
			if item_moonbox_ure>=50   then
				item_moonbox_ure=item_moonbox_ure-50
				SetItemAttr(item_moonbox,ITEMATTR_URE,item_moonbox_ure)
			end
		end		
	end
	
	---------------------------------------------------------------------------------ո�µ��¹ⱦ��180
	local one_minite=60													--�趨one_miniteΪ60��
	if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
		local num_moonbox_zhanxin=0                                          --
		local item_moonbox=0	
		num_moonbox_zhanxin = CheckBagItem( role, 5788 )
		if num_moonbox_zhanxin==1   then
			item_moonbox = GetChaItem2 ( role , 2 , 5788 )
			local item_moonbox_ure=GetItemAttr(item_moonbox,ITEMATTR_URE)
					--SystemNotice ( role , "ո�µ��¹ⱦ�еĵ�ǰ����Ϊ"..item_moonbox_ure )			
			if item_moonbox_ure>=50   then
				item_moonbox_ure=item_moonbox_ure-50
				SetItemAttr(item_moonbox,ITEMATTR_URE,item_moonbox_ure)
			end
		end		
	end
	
	---------------------------------------------------------------------------------���µ��¹ⱦ��240
	local one_minite=60														--�趨one_miniteΪ60��
	if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
		local num_moonbox_jingzhi=0                                          --
		local item_moonbox=0	
		num_moonbox_jingzhi = CheckBagItem( role, 5789 )
		if num_moonbox_jingzhi==1   then
			item_moonbox = GetChaItem2 ( role , 2 , 5789 )
			local item_moonbox_ure=GetItemAttr(item_moonbox,ITEMATTR_URE)
					--SystemNotice ( role , "���µ��¹ⱦ�еĵ�ǰ����Ϊ"..item_moonbox_ure )			
			if item_moonbox_ure>=50   then
				item_moonbox_ure=item_moonbox_ure-50
				SetItemAttr(item_moonbox,ITEMATTR_URE,item_moonbox_ure)
			end
		end		
	end
	---------------------------------------------------------------------------------׿Խ���¹ⱦ��360
	local one_minite=60														--�趨one_miniteΪ60��
	if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
		local num_moonbox_zhuoyue=0                                          --
		local item_moonbox=0	
		num_moonbox_zhuoyue = CheckBagItem( role, 5790 )
		if num_moonbox_zhuoyue==1   then
			item_moonbox = GetChaItem2 ( role , 2 , 5790 )
			local item_moonbox_ure=GetItemAttr(item_moonbox,ITEMATTR_URE)
					--SystemNotice ( role , "׿Խ���¹ⱦ�еĵ�ǰ����Ϊ"..item_moonbox_ure )			
			if item_moonbox_ure>=50   then
				item_moonbox_ure=item_moonbox_ure-50
				SetItemAttr(item_moonbox,ITEMATTR_URE,item_moonbox_ure)
			end
		end		
		end]]
	
----------------------------------------------------------------------------------������֮������¼����ʱ
function JianYuKa(role ,now_tick)
	local juluka_freq = 60
	local energy_resume = 60
	if math.fmod(now_tick, juluka_freq) == 0 and now_tick > 0   then 
		local map_name = GetChaMapName ( role )
		if map_name == "prisonisland"   then
			local item_jiluka = GetChaItem( role, 2, 2)
			local item_id = GetItemID( item_jiluka )
			if item_id == 5724   then			----�ж��Ƿ�Ϊ������¼��
				local energy = GetItemAttr(item_jiluka, ITEMATTR_ENERGY)			--ȡ�õ��ߵĵ�ǰ�;�
				if energy < 0   then
					energy = 0
				elseif energy ==0   then			--����;�Ϊ0
					CALCULATE_FUNCTIONS_LUA_000108 = GetResString("CALCULATE_FUNCTIONS_LUA_000108")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000108 )
				else 					--����;ò�Ϊ0
					energy = energy - energy_resume  		--�ó��۳����ʵ��ֵ
					SetItemAttr(item_jiluka, ITEMATTR_ENERGY, energy )			--��ô���õ��ߵĵ�ǰ�;�Ϊ�۳����ʵ��ֵ  URE
				end
			end
		end
	end	
end
JLMAXLV = 63   ---�ֶ��趨�ľ�������
JLMINLV = 4    ---�ֶ��趨�ľ����������
function GetElfLV(item)
	local str = GetItemAttr( item,ITEMATTR_VAL_STR )       --����
	local con = GetItemAttr( item ,ITEMATTR_VAL_CON )       --����
	local agi = GetItemAttr( item ,ITEMATTR_VAL_AGI )       --רע
	local dex = GetItemAttr( item ,ITEMATTR_VAL_DEX )       --����
	local sta = GetItemAttr( item ,ITEMATTR_VAL_STA )       --����
	local lv = str + agi + dex + con + sta
	return lv
end
function GetElfFreqbyLV(lv)
	local freq = 20	
	if lv >=4 and lv <= 9   then 
		freq =30
	elseif lv >= 10 and lv <= 30   then 
		freq =40
	elseif  lv>= JLMAXLV   then 
		freq = 10
	elseif lv>30 and lv <JLMAXLV   then
		freq = math.floor(lv*10/3-60)
	end
	return freq
end
function JLXiaoHao(role,now_tick)
	local live = IsChaLiving(role)
	if live == -1   then 
		return 
	end
	local elf = GetChaItem ( role , 2 , 1  )
	if elf == nil   then 
		return 
	end
	local elfType = GetItemType ( elf )
	if elfType== 59   then
		--LG("JLTest","���뾫���ж�")
		local lv = GetElfLV(elf)
		--LG("JLTest","�������ĵȼ�Ϊ��"..lv )
		local elfFreq = GetElfFreqbyLV(lv)
		--LG("JLTest","��������Ƶ��Ϊ��"..elfFreq )
		local sklv = GetChaStateLv ( role , STATE_JLJSGZ ) ----------------������ٹ���˫���ɳ�˫������
		--LG("JLTest","˫���ɳ����ж�"..sklv )
		if  sklv~=0   then
			elfFreq =math.floor( elfFreq*0.5 )
		end
		if math.fmod(now_tick, elfFreq) == 0 and now_tick > 0   then 
			local ure = GetItemAttr( elf ,ITEMATTR_URE )       --����
			if ure<=49   then
				SetChaKbItemValid2(role , elf , 0 , 1)	
			else
				SetChaKbItemValid2(role , elf , 1 , 1)			
			end
			-- NSTATE_JYCC=1---������ٲ���
			-- NSTATE_JYCZ=2---������ٳɳ�
			-- NSTATE_JYNOXH = 3     ---����û�ж�ʱ������
			local noXHLV=GetNewStateLV(role,NSTATE_JYNOXH,lv)
			local CCLV=GetNewStateLV(role,NSTATE_JYCC,lv)
			local CZLV=GetNewStateLV(role,NSTATE_JYCZ,lv)
			--LG("JLTest","�����ж�"..noXHLV..CCLV..CZLV)
			JLAutoSpeed(role,elf)
			--LG("JLTest","�������")
			AutoSiLiao(role,elf)
			--LG("JLTest","�Զ�����")
			local coinNum =  CCLV+1
			GiveJLCoins(role,elf,coinNum)
			--LG("JLTest","��Ӳ��")
			if noXHLV==0   then
				Take_ElfURE ( role , elf , 1 , 0 )
				--LG("JLTest","������")
			end
			Give_ElfEXP ( role , elf , 1 )
			--LG("JLTest","���ɳ�")
			if CZLV~= 0   then 
				local i = 0 
				for i = 1,CZLV,1 do
					Give_ElfEXP ( role , elf , 1 )
					--LG("JLTest","���ɳ�")
				end
			end
		end
	end
end
autoSiLiaoID = {}  autoSiLiaoXG={} autoSiLiaoLow={}
autoSiLiaoID[1]=2312 autoSiLiaoXG[1] = 2500 autoSiLiaoLow[1]=2550
autoSiLiaoID[2]=5645 autoSiLiaoXG[2] = 5000 autoSiLiaoLow[2]=5000
function AutoSiLiao(role,elf)
	local lv = GetElfLV(elf)
	local autoSL = GetChaItem ( role , 2 , 2  ) --ȡ��ɫ������������ָ��
	if autoSL~=nil and lv<JLMAXLV   then 
		local ure = GetItemAttr( elf ,ITEMATTR_URE )
		local autoSLID = GetItemID ( autoSL )
		local i = 1 
		while autoSiLiaoID[i]~=nil do
			if autoSiLiaoID[i] == autoSLID and ure<=autoSiLiaoLow[i]   then 
				local j = TakeItem(  role,0,autoSiLiaoID[i],1)
				if j==0   then
					CALCULATE_FUNCTIONS_LUA_000109 = GetResString("CALCULATE_FUNCTIONS_LUA_000109")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000109 )
				else
					ure = ure + autoSiLiaoXG[i]
					CALCULATE_FUNCTIONS_LUA_000110 = GetResString("CALCULATE_FUNCTIONS_LUA_000110")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000110 )
					SetItemAttr ( elf , ITEMATTR_URE , ure )
				end
				return 
			end
			i= i+1 
		end
	end
end
function JLAutoSpeed(role,elf)
	local autoSpeed = GetChaItem ( role , 2 , 2  ) --ȡ��ɫ������������ָ��
	if elf==nil or autoSpeed == nil   then 
		return
	end
	local autoSpeedID = GetItemID ( autoSpeed )
	local autoSpeedStateLv = GetChaStateLv ( role , STATE_JLJSGZ)
	if autoSpeedStateLv == 0 and autoSpeedID ==5643   then
		local elfLV = GetElfLV(elf)
		if elfLV >= JLMAXLV   then
			CALCULATE_FUNCTIONS_LUA_000111 = GetResString("CALCULATE_FUNCTIONS_LUA_000111")
			CALCULATE_FUNCTIONS_LUA_000112 = GetResString("CALCULATE_FUNCTIONS_LUA_000112")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000112..JLMAXLV..CALCULATE_FUNCTIONS_LUA_000111)
			return
		else
			if autoSpeedStateLv > 1   then
				CALCULATE_FUNCTIONS_LUA_000113 = GetResString("CALCULATE_FUNCTIONS_LUA_000113")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000113 )
				UseItemFailed ( role )
				return
			end	
			local k = TakeItem(  role,0,5643,1)
			if k==0   then
				CALCULATE_FUNCTIONS_LUA_000109 = GetResString("CALCULATE_FUNCTIONS_LUA_000109")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000109 )
			else
				local statetime = 900
				local statelv =1
				AddState( role , role , STATE_JLJSGZ , statelv , statetime )		
				CALCULATE_FUNCTIONS_LUA_000114 = GetResString("CALCULATE_FUNCTIONS_LUA_000114")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000114 )
			end
		end
	end
end
function GiveJLCoins(role,elf,num1)
	local lv = GetElfLV(elf)
	if lv >=JLMINLV and lv <JLMAXLV   then 
		local num = GetItemAttr( elf ,ITEMATTR_VAL_FUSIONID )       --���߾�����Ϣ���Լ�¼����һ�ʵ�����
		local ure = GetItemAttr( elf ,ITEMATTR_URE )       --����
		local is2 = GetItemForgeParam ( elf , 1 )
		is2 = GetNum_Part1 ( is2 )
		num=num+1
		if math.fmod( num , 1) == 0 and ure>=50 and is2==1   then
			GiveItemX ( role , 0 , 855 , num1 , 4 )										-------�ɳ�1���һ����Ӳ��
		end
		if math.fmod( num , 2) == 0 and ure>=50 and is2~=1   then
			GiveItemX ( role , 0 , 855 , num1 , 4 )										-------�ɳ�2���һ����Ӳ��
		end
		-- if math.fmod( num , 30) == 0  and ure>=50 and is2==1   then			-------�ɳ�30���һ�����ӡһ��
			-- GiveItemX ( role , 0 , 2588 , 1 , 4 )						
		-- end
		-- if math.fmod( num , 60) == 0  and ure>=50 and is2~=1   then			-------�ɳ�60���һ�����ӡһ��
			-- GiveItemX ( role , 0 , 2588 , 1 , 4 )						
		-- end
		-- if math.fmod( num , 120) == 0  and ure>=50    then						-------�ɳ�120���һ�����ӡһ��
			-- GiveItemX ( role , 0 , 2588 , 1 , 4 )						
		-- end
		-- if math.fmod( num , 1200) == 0  and ure>=50   then						-------�ɳ�1200�����������ӡһ��
			-- GiveItemX ( role , 0 , 2589 , 1 , 4 )						
		-- end
		if num==1200   then
			num=0
		end	
		SetItemAttr ( elf , ITEMATTR_VAL_FUSIONID , num )
	end
end




function BB85_6473_Inhand(role,now_tick)
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	--SystemNotice( role , "CheckDateNum111"..CheckDateNum )
	if CheckDateNum > 8121416   then
				
			local pos = 6 
			
			--SystemNotice( role , "pos"..pos )
			local bb85_6473_Inhand = GetChaItem ( role , 1 , pos)
			if bb85_6473_Inhand ~= nil   then 
				local bb85_6473_InhandId = GetItemID( bb85_6473_Inhand )
				
				if bb85_6473_InhandId == 6473   then
					--SystemNotice( role , "pos"..pos )
					local bb85_6473_JinglianLevel = GetItem_JinglianLv ( bb85_6473_Inhand )
					--SystemNotice( role , "bb85_6473_JinglianLevel"..bb85_6473_JinglianLevel )
					if bb85_6473_JinglianLevel < 15   then
						RemoveChaItem( role , 6473 , 1 , 1 , pos , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000115 = GetResString("CALCULATE_FUNCTIONS_LUA_000115")
						CALCULATE_FUNCTIONS_LUA_000116 = GetResString("CALCULATE_FUNCTIONS_LUA_000116")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000116,bb85_6473_JinglianLevel,CALCULATE_FUNCTIONS_LUA_000115,pos,"\n")					
					else
						return
					end
				end
				pos = 9
				--SystemNotice( role , "pos"..pos )
				local bb85_6473_Inhand = GetChaItem ( role , 1 , pos)
				if bb85_6473_Inhand ~= nil   then 
					local bb85_6473_InhandId = GetItemID( bb85_6473_Inhand )
					if bb85_6473_InhandId == 6473   then
						--SystemNotice( role , "pos"..pos )
						local bb85_6473_JinglianLevel = GetItem_JinglianLv ( bb85_6473_Inhand )
						--SystemNotice( role , "bb85_6473_JinglianLevel"..bb85_6473_JinglianLevel )
						if bb85_6473_JinglianLevel < 15   then
							RemoveChaItem( role , 6473 , 1 , 1 , pos , 2 , 1 )
							CALCULATE_FUNCTIONS_LUA_000115 = GetResString("CALCULATE_FUNCTIONS_LUA_000115")
							CALCULATE_FUNCTIONS_LUA_000116 = GetResString("CALCULATE_FUNCTIONS_LUA_000116")
							LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000116,bb85_6473_JinglianLevel,CALCULATE_FUNCTIONS_LUA_000115,pos,"\n")					
						end
					end
				else
				
				end	
			else 
				pos = 9
				--SystemNotice( role , "pos"..pos )
				local bb85_6473_Inhand = GetChaItem ( role , 1 , pos)
				if bb85_6473_Inhand ~= nil   then 
					local bb85_6473_InhandId = GetItemID( bb85_6473_Inhand )
					if bb85_6473_InhandId == 6473   then
					--SystemNotice( role , "pos"..pos )
					local bb85_6473_JinglianLevel = GetItem_JinglianLv ( bb85_6473_Inhand )
					--SystemNotice( role , "bb85_6473_JinglianLevel"..bb85_6473_JinglianLevel )
					if bb85_6473_JinglianLevel < 15   then
						RemoveChaItem( role , 6473 , 1 , 1 , pos , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000115 = GetResString("CALCULATE_FUNCTIONS_LUA_000115")
						CALCULATE_FUNCTIONS_LUA_000116 = GetResString("CALCULATE_FUNCTIONS_LUA_000116")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000116,bb85_6473_JinglianLevel,CALCULATE_FUNCTIONS_LUA_000115,pos,"\n")				
					end
				else
				
				end	
				
			end
		end	
	end
end


-- function BB85_6473_Inhand9(role,now_tick)
	-- local Now_Day = os.date("%d")
	-- local Now_Month = os.date("%m")
	-- local Now_Time = os.date("%H")
	-- local Now_Year = os.date("%y")
	-- local NowTimeNum = tonumber(Now_Time)
	-- local NowDayNum = tonumber(Now_Day)
	-- local NowMonthNum = tonumber(Now_Month)
	-- local NowYearNum = tonumber(Now_Year)
	-- local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	-- if CheckDateNum > 8121416   then
		-- local bb85_6473_Inhand = GetChaItem ( role , 1 , 9 )
		-- if bb85_6473_Inhand == nil   then 
			-- return
		-- end
		-- local bb85_6473_InhandId = GetItemID( bb85_6473_Inhand )
		-- if bb85_6473_InhandId == 6473   then
			-- local bb85_6473_JinglianLevel = GetItem_JinglianLv ( bb85_6473_Inhand )
			--SystemNotice( role , "hand"..bb85_6473_JinglianLevel )
			-- if bb85_6473_JinglianLevel < 15   then
				-- RemoveChaItem( role , 6473 , 1 , 0 , -1 , 2 , 1 )
				-- return
			-- end
		-- end
	-- end
-- end

-- function BB85_6473_Inhand6(role,now_tick)
	-- local ChaName = GetChaDefaultName ( role )
	-- local Now_Day = os.date("%d")
	-- local Now_Month = os.date("%m")
	-- local Now_Time = os.date("%H")
	-- local Now_Year = os.date("%y")
	-- local NowTimeNum = tonumber(Now_Time)
	-- local NowDayNum = tonumber(Now_Day)
	-- local NowMonthNum = tonumber(Now_Month)
	-- local NowYearNum = tonumber(Now_Year)
	-- local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	-- if CheckDateNum > 8121416   then
		-- local bb85_6473_Inhand = GetChaItem ( role , 1 , 6 )
		-- if bb85_6473_Inhand == nil   then 
			-- return
		-- end
		-- local bb85_6473_InhandId = GetItemID( bb85_6473_Inhand )
		-- if bb85_6473_InhandId == 6473   then
			-- local bb85_6473_JinglianLevel = GetItem_JinglianLv ( bb85_6473_Inhand )
			--SystemNotice( role , "hand"..bb85_6473_JinglianLevel )
			-- if bb85_6473_JinglianLevel < 15   then
				-- RemoveChaItem( role , 6473 , 1 , 0 , 6 , 2 , 1 )
				-- LG("lianzhonghuodong",ChaName,"����ID=6473�������ȼ�=",bb85_6473_JinglianLevel,"\n")
				-- return
			-- end
		-- end
	-- end
-- end


function BB85_6473_Inbag(role,now_tick)	 
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum

	if CheckDateNum > 8121416   then
		local i = 0
		for i = 1, 48 ,1 do 
			local bb85_6473_Inbag = GetChaItem( role , 2 , i-1 )
			if ValidCha(bb85_6473_Inbag) ~= 0   then 
				local bb85_6473_InbagId = GetItemID ( bb85_6473_Inbag )
				if bb85_6473_InbagId ~= 6473   then
					
				elseif bb85_6473_InbagId == 6473   then 
					local bb85_6473_JinglianLevel = GetItem_JinglianLv ( bb85_6473_Inbag )
				
					if bb85_6473_JinglianLevel < 15   then
						RemoveChaItem( role , bb85_6473_InbagId , 1 , 2 , i-1 , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000116 = GetResString("CALCULATE_FUNCTIONS_LUA_000116")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000116,bb85_6473_JinglianLevel,"\n")
					end
				end
			end
		end	
	end
end




function BB85_6474_Inhand(role,now_tick)
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 8121416   then
		local bb85_6474_Inhand = GetChaItem ( role , 1 , 9 )
		if bb85_6474_Inhand == nil   then 
			return
		end
		local bb85_6474_InhandId = GetItemID( bb85_6474_Inhand )
		if bb85_6474_InhandId == 6474   then
			local bb85_6474_JinglianLevel = GetItem_JinglianLv ( bb85_6474_Inhand )
			--SystemNotice( role , "hand"..bb85_6474_JinglianLevel )
			if bb85_6474_JinglianLevel < 15   then
				RemoveChaItem( role , 6474 , 1 , 0 , 9 , 2 , 1 )
				CALCULATE_FUNCTIONS_LUA_000117 = GetResString("CALCULATE_FUNCTIONS_LUA_000117")
				LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000117,bb85_6474_JinglianLevel,"\n")
				return
			end
		end
	end
end


function BB85_6474_Inbag(role,now_tick)	 
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum

	if CheckDateNum > 8121416   then
		local i = 0
		for i = 1, 48 ,1 do 
			local bb85_6474_Inbag = GetChaItem( role , 2 , i-1 )
			if ValidCha(bb85_6474_Inbag) ~= 0   then 
				local bb85_6474_InbagId = GetItemID ( bb85_6474_Inbag )
				if bb85_6474_InbagId ~= 6474   then
					
				elseif bb85_6474_InbagId == 6474   then 
					local bb85_6474_JinglianLevel = GetItem_JinglianLv ( bb85_6474_Inbag )
				
					if bb85_6474_JinglianLevel < 15   then
						RemoveChaItem( role , bb85_6474_InbagId , 1 , 2 , i-1 , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000117 = GetResString("CALCULATE_FUNCTIONS_LUA_000117")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000117,bb85_6474_JinglianLevel,"\n")
					end
				end
			end
		end	
	end
end




function BB85_6475_Inhand(role,now_tick)
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 8121416   then
		local bb85_6475_Inhand = GetChaItem ( role , 1 , 9 )
		if bb85_6475_Inhand == nil   then 
			return
		end
		local bb85_6475_InhandId = GetItemID( bb85_6475_Inhand )
		if bb85_6475_InhandId == 6475   then
			local bb85_6475_JinglianLevel = GetItem_JinglianLv ( bb85_6475_Inhand )
			--SystemNotice( role , "hand"..bb85_6475_JinglianLevel )
			if bb85_6475_JinglianLevel < 15   then
				RemoveChaItem( role , 6475 , 1 , 0 , 9 , 2 , 1 )
				CALCULATE_FUNCTIONS_LUA_000118 = GetResString("CALCULATE_FUNCTIONS_LUA_000118")
				LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000118,bb85_6475_JinglianLevel,"\n")
				return
			end
		end
	end
end


function BB85_6475_Inbag(role,now_tick)	 
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum

	if CheckDateNum > 8121416   then
		local i = 0
		for i = 1, 48 ,1 do 
			local bb85_6475_Inbag = GetChaItem( role , 2 , i-1 )
			if ValidCha(bb85_6475_Inbag) ~= 0   then 
				local bb85_6475_InbagId = GetItemID ( bb85_6475_Inbag )
				if bb85_6475_InbagId ~= 6475   then
					
				elseif bb85_6475_InbagId == 6475   then 
					local bb85_6475_JinglianLevel = GetItem_JinglianLv ( bb85_6475_Inbag )
				
					if bb85_6475_JinglianLevel < 15   then
						RemoveChaItem( role , bb85_6475_InbagId , 1 , 2 , i-1 , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000118 = GetResString("CALCULATE_FUNCTIONS_LUA_000118")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000118,bb85_6475_JinglianLevel,"\n")
					end
				end
			end
		end	
	end
end




function BB85_6476_Inhand(role,now_tick)
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 8121416   then
		local bb85_6476_Inhand = GetChaItem ( role , 1 , 9 )
		if bb85_6476_Inhand == nil   then 
			return
		end
		local bb85_6476_InhandId = GetItemID( bb85_6476_Inhand )
		if bb85_6476_InhandId == 6476   then
			local bb85_6476_JinglianLevel = GetItem_JinglianLv ( bb85_6476_Inhand )
			--SystemNotice( role , "hand"..bb85_6476_JinglianLevel )
			if bb85_6476_JinglianLevel < 15   then
				RemoveChaItem( role , 6476 , 1 , 0 , 9 , 2 , 1 )
				CALCULATE_FUNCTIONS_LUA_000119 = GetResString("CALCULATE_FUNCTIONS_LUA_000119")
				LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000119,bb85_6476_JinglianLevel,"\n")
				return
			end
		end
	end
end


function BB85_6476_Inbag(role,now_tick)	 
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum

	if CheckDateNum > 8121416   then
		local i = 0
		for i = 1, 48 ,1 do 
			local bb85_6476_Inbag = GetChaItem( role , 2 , i-1 )
			if ValidCha(bb85_6476_Inbag) ~= 0   then 
				local bb85_6476_InbagId = GetItemID ( bb85_6476_Inbag )
				if bb85_6476_InbagId ~= 6476   then
					
				elseif bb85_6476_InbagId == 6476   then 
					local bb85_6476_JinglianLevel = GetItem_JinglianLv ( bb85_6476_Inbag )
				
					if bb85_6476_JinglianLevel < 15   then
						RemoveChaItem( role , bb85_6476_InbagId , 1 , 2 , i-1 , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000119 = GetResString("CALCULATE_FUNCTIONS_LUA_000119")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000119,bb85_6476_JinglianLevel,"\n")
					end
				end
			end
		end	
	end
end




function BB85_6477_Inhand(role,now_tick)
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 8121416   then
		local bb85_6477_Inhand = GetChaItem ( role , 1 , 9 )
		if bb85_6477_Inhand == nil   then 
			return
		end
		local bb85_6477_InhandId = GetItemID( bb85_6477_Inhand )
		if bb85_6477_InhandId == 6477   then
			local bb85_6477_JinglianLevel = GetItem_JinglianLv ( bb85_6477_Inhand )
			--SystemNotice( role , "hand"..bb85_6477_JinglianLevel )
			if bb85_6477_JinglianLevel < 15   then
				RemoveChaItem( role , 6477 , 1 , 0 , 9 , 2 , 1 )
				CALCULATE_FUNCTIONS_LUA_000120 = GetResString("CALCULATE_FUNCTIONS_LUA_000120")
				LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000120,bb85_6477_JinglianLevel,"\n")
				return
			end
		end
	end
end

function BB85_6477_Inbag(role,now_tick)	 
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	--SystemNotice( role,"CheckDateNum"..CheckDateNum)
	if CheckDateNum > 8121416   then
		local i = 0
		for i = 1, 48 ,1 do 
			local bb85_6477_Inbag = GetChaItem( role , 2 , i-1 )
			if ValidCha(bb85_6477_Inbag) ~= 0   then 
				local bb85_6477_InbagId = GetItemID ( bb85_6477_Inbag )
				if bb85_6477_InbagId ~= 6477   then
					--SystemNotice( role,"i="..i)
					--SystemNotice( role,"bb85_6477_InbagId="..bb85_6477_InbagId)
					-- break
				elseif bb85_6477_InbagId == 6477   then 
					local bb85_6477_JinglianLevel = GetItem_JinglianLv ( bb85_6477_Inbag )
					--SystemNotice( role , "bag"..bb85_6477_JinglianLevel )
					if bb85_6477_JinglianLevel < 15   then
						RemoveChaItem( role , bb85_6477_InbagId , 1 , 2 , i-1 , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000120 = GetResString("CALCULATE_FUNCTIONS_LUA_000120")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000120,bb85_6477_JinglianLevel,"\n")
					end
				end
			end
		end	
	end
end


function BB85_6478_Inhand(role,now_tick)
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 8121416   then
		local bb85_6478_Inhand = GetChaItem ( role , 1 , 9 )
		if bb85_6478_Inhand == nil   then 
			return
		end
		local bb85_6478_InhandId = GetItemID( bb85_6478_Inhand )
		if bb85_6478_InhandId == 6478   then
			local bb85_6478_JinglianLevel = GetItem_JinglianLv ( bb85_6478_Inhand )
			--SystemNotice( role , "hand"..bb85_6478_JinglianLevel )
			if bb85_6478_JinglianLevel < 15   then
				RemoveChaItem( role , 6478 , 1 , 0 , 9 , 2 , 1 )
				CALCULATE_FUNCTIONS_LUA_000121 = GetResString("CALCULATE_FUNCTIONS_LUA_000121")
				LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000121,bb85_6478_JinglianLevel,"\n")
				return
			end
		end
	end
end


function BB85_6478_Inbag(role,now_tick)	 
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum

	if CheckDateNum > 8121416   then
		local i = 0
		for i = 1, 48 ,1 do 
			local bb85_6478_Inbag = GetChaItem( role , 2 , i-1 )
			if ValidCha(bb85_6478_Inbag) ~= 0   then 
				local bb85_6478_InbagId = GetItemID ( bb85_6478_Inbag )
				if bb85_6478_InbagId ~= 6478   then
					
				elseif bb85_6478_InbagId == 6478   then 
					local bb85_6478_JinglianLevel = GetItem_JinglianLv ( bb85_6478_Inbag )
				
					if bb85_6478_JinglianLevel < 15   then
						RemoveChaItem( role , bb85_6478_InbagId , 1 , 2 , i-1 , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000121 = GetResString("CALCULATE_FUNCTIONS_LUA_000121")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000121,bb85_6478_JinglianLevel,"\n")
					end
				end
			end
		end	
	end
end





function BB85_6479_Inhand(role,now_tick)
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 8121416   then
		local bb85_6479_Inhand = GetChaItem ( role , 1 , 9 )
		if bb85_6479_Inhand == nil   then 
			return
		end
		local bb85_6479_InhandId = GetItemID( bb85_6479_Inhand )
		if bb85_6479_InhandId == 6479   then
			local bb85_6479_JinglianLevel = GetItem_JinglianLv ( bb85_6479_Inhand )
			--SystemNotice( role , "hand"..bb85_6479_JinglianLevel )
			if bb85_6479_JinglianLevel < 15   then
				RemoveChaItem( role , 6479 , 1 , 0 , 9 , 2 , 1 )
				CALCULATE_FUNCTIONS_LUA_000122 = GetResString("CALCULATE_FUNCTIONS_LUA_000122")
				LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000122,bb85_6479_JinglianLevel,"\n")
				return
			end
		end
	end
end


function BB85_6479_Inbag(role,now_tick)	 
	local ChaName = GetChaDefaultName ( role )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum

	if CheckDateNum > 8121416   then
		local i = 0
		for i = 1, 48 ,1 do 
			local bb85_6479_Inbag = GetChaItem( role , 2 , i-1 )
			if ValidCha(bb85_6479_Inbag) ~= 0   then 
				local bb85_6479_InbagId = GetItemID ( bb85_6479_Inbag )
				if bb85_6479_InbagId ~= 6479   then
					--SystemNotice( role,"i="..i)
					--SystemNotice( role,"bb85_6479_InbagId="..bb85_6479_InbagId)
				elseif bb85_6479_InbagId == 6479   then 
					local bb85_6479_JinglianLevel = GetItem_JinglianLv ( bb85_6479_Inbag )
					--SystemNotice( role , "bag"..bb85_6479_JinglianLevel )
					if bb85_6479_JinglianLevel < 15   then
						RemoveChaItem( role , bb85_6479_InbagId , 1 , 2 , i-1 , 2 , 1 )
						CALCULATE_FUNCTIONS_LUA_000122 = GetResString("CALCULATE_FUNCTIONS_LUA_000122")
						LG("lianzhonghuodong",ChaName,CALCULATE_FUNCTIONS_LUA_000122,bb85_6479_JinglianLevel,"\n")
					end
				end
			end
		end	
	end
end


function MoJianBag(role,now_tick)--------------ħ�����Ұ�
	--�ж�ħ���ڰ�̯״̬�²��۳־�(op)	-------------------------------����ɳ��ڴ�ţ������
	-- local State_baitan = GetChaStateLv ( DEFER, STATE_BAT )
	-- if State_baitan >= 1   then
		-- return
	-- end
	--�ж�ħ���ڰ�̯״̬�²��۳־�(ed)
	local mojiancha = GetChaItem2( role , 2 , 6347 )
	if mojiancha==nil   then
		return
	end
	
	local mojiantime = GetItemAttr( mojiancha , ITEMATTR_URE )
		mojiantime = mojiantime - 1
	local b = GetItemAttr(mojiancha, ITEMATTR_URE)
	local name = GetChaDefaultName(role)
	if b > 0   then
		SetItemAttr(mojiancha,ITEMATTR_URE,mojiantime)	
	else	
		-- ScrollNotice(name.." ��ɱ¾��ħ���ɻ������˻��ǣ�ħ���������������ˣ���ʧ��ãã�ڰ�֮�С�", 1 )	---��Ϊ��̯BUG��ʱȥ������
		CALCULATE_FUNCTIONS_LUA_000123 = GetResString("CALCULATE_FUNCTIONS_LUA_000123")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000123 )
		RemoveChaItem( role , 6347 , 1 , 0 , -1 , 2 , 1 )
		return
	end
	-- SystemNotice(role,"InnnnnnBAOBAO2222222ʱ��"..mojiantime)
	if math.fmod( b , 180 ) == 0 and b < 1440 and b > 0   then 
		CALCULATE_FUNCTIONS_LUA_000124 = GetResString("CALCULATE_FUNCTIONS_LUA_000124")
		CALCULATE_FUNCTIONS_LUA_000125 = GetResString("CALCULATE_FUNCTIONS_LUA_000125")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000125..math.floor(b/50)..CALCULATE_FUNCTIONS_LUA_000124 )
		local x, y = GetChaPos(role)
		local map_role = ChargeMapETC ( role )
		CALCULATE_FUNCTIONS_LUA_000126 = GetResString("CALCULATE_FUNCTIONS_LUA_000126")
		CALCULATE_EXP_AND_LEVEL_LUA_000013 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000013")
		CALCULATE_FUNCTIONS_LUA_000127 = GetResString("CALCULATE_FUNCTIONS_LUA_000127")
		ScrollNotice(name..CALCULATE_FUNCTIONS_LUA_000127..map_role..CALCULATE_EXP_AND_LEVEL_LUA_000013..math.floor(x/100)..","..math.floor(y/100)..CALCULATE_FUNCTIONS_LUA_000126, 1 )
		return
	end
end

function MoJianHand(role,now_tick)-----------------------ħ��������
	--�ж�ħ���ڰ�̯״̬�²��۳־�(op)	-------------------------------����ɳ��ڴ�ţ������
	-- local State_baitan = GetChaStateLv ( DEFER, STATE_BAT )
	-- if State_baitan >= 1   then
		-- return
	-- end
	--�ж�ħ���ڰ�̯״̬�²��۳־�(ed)
	local weapon = GetChaItem ( role , 1 , 9 )
	if weapon==nil   then 
		return
	end
	local weapon_id = GetItemID( weapon )
	if weapon_id == 6347   then
		local Item_URE = GetItemAttr( weapon , ITEMATTR_URE )
		Item_URE = Item_URE - 1
		local a = GetItemAttr( weapon , ITEMATTR_URE )
		local name = GetChaDefaultName(role)
				
		if a > 0   then				
			SetItemAttr( weapon , ITEMATTR_URE , Item_URE )
		else 
			-- ScrollNotice(name.." ��ɱ¾��ħ���ɻ������˻��ǣ�ħ���������������ˣ���ʧ��ãã�ڰ�֮�С�", 1 )	---��Ϊ������BUG��ʱȥ������
			CALCULATE_FUNCTIONS_LUA_000123 = GetResString("CALCULATE_FUNCTIONS_LUA_000123")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000123 )
			RemoveChaItem( role , 6347 , 1 , 0 , -1 , 2 , 1 )	
			return
		end
		if math.fmod( a , 180 ) == 0 and a < 1440 and a > 0   then
			CALCULATE_FUNCTIONS_LUA_000124 = GetResString("CALCULATE_FUNCTIONS_LUA_000124")
			CALCULATE_FUNCTIONS_LUA_000125 = GetResString("CALCULATE_FUNCTIONS_LUA_000125")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000125..math.floor(a/50)..CALCULATE_FUNCTIONS_LUA_000124 )
			local x, y = GetChaPos(role)
			local map_role = ChargeMapETC ( role )
			CALCULATE_FUNCTIONS_LUA_000126 = GetResString("CALCULATE_FUNCTIONS_LUA_000126")
			CALCULATE_EXP_AND_LEVEL_LUA_000013 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000013")
			CALCULATE_FUNCTIONS_LUA_000127 = GetResString("CALCULATE_FUNCTIONS_LUA_000127")
			ScrollNotice(name..CALCULATE_FUNCTIONS_LUA_000127..map_role..CALCULATE_EXP_AND_LEVEL_LUA_000013..math.floor(x/100)..","..math.floor(y/100)..CALCULATE_FUNCTIONS_LUA_000126, 1 )
			return
		end	
	end
end


function KouMoHeTime(role,now_tick)
	if math.fmod(now_tick, 30) == 0 and now_tick > 0   then	
		-- SystemNotice(role,"mohetime=======now_tick====="..now_tick)
		local mohecha=GetChaItem2(role,2,6378)
		if mohecha==nil   then
			return
		end
		local now_day= os.date("%d")
		now_day= tonumber(now_day)
		local IsNew=GetItemAttr(mohecha, ITEMATTR_VAL_CON)
		if IsNew~=now_day   then 
			CALCULATE_FUNCTIONS_LUA_000128 = GetResString("CALCULATE_FUNCTIONS_LUA_000128")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000128)
			SetItemAttr(mohecha,ITEMATTR_VAL_AGI,0)
			SetItemAttr(mohecha, ITEMATTR_VAL_CON,now_day)
		end
		-- SystemNotice(role,"mohetime=======")
		local mohetime=GetItemAttr(mohecha,ITEMATTR_VAL_AGI)
		-- SystemNotice(role,"mohetime======="..mohetime)
		mohetime = mohetime+1
		-- SystemNotice(role,"mohetime======="..mohetime)
		if mohetime < 241   then
			local IDay = 0
			IDay=GetItemAttr(mohecha, ITEMATTR_VAL_STR)			
			if now_day~=IDay   then--����û�п���MAXENERGY�ͼ�1
				-- SystemNotice(role,"mohetime======="..mohetime)
				SetItemAttr(mohecha,ITEMATTR_VAL_AGI,mohetime)	
				-- SystemNotice(role,"mohetime======="..mohetime)
			end
		else
			return
		end
	end
end 

-------�۳����������������ֵ-------------------------------------
function Take_ElfURE ( role , Item , Type , Num )
	local ure = GetItemAttr( Item ,ITEMATTR_URE ) 
	if Type == 1   then
		if ure >49   then
			local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
			local ZBNType= math.floor(ZBMain/10)      ---�ڼ���ռ��
			local ZBNMain= math.fmod(ZBMain,10 )			---BUFF OR DEBUFF
			local ZBday = GetChaAttr(role,ATTR_EXTEND2)		--ռ������
			local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
			local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
			local ZBstate2=math.fmod(ZBstate,10)				--ռ������
			local now_day=os.date("%d")
			now_day=tonumber(now_day)
			local a=0
			if now_day==ZBday and ZBstate2==9   then
				a=2
			end
			ure = math.max ( ( ure - 50+a ) , 49 )
			local reSetStone = CheckBagItem(role,6869)
			ure = math.max ( ( ure - reSetStone ) , 49 )
			SetItemAttr ( Item , ITEMATTR_URE , ure )
		else 
			SetChaKbItemValid2(role , Item , 0 , 1)
		end

	end
	if Type == 2   then
		if ure > 49   then
			 ure = math.max ( ( ure - Num ) , 49 )
			 SetItemAttr ( Item , ITEMATTR_URE , ure )
		else
			SetChaKbItemValid2(role , Item , 0 , 1)
		end
	end
end


-------���뾫��ɳ�--------------------------------------------------
function Give_ElfEXP(Player, Fairy, Num)
    local FairyLv        = GetFairyLevel(Fairy)
    local FairyName        = GetItemName(GetItemID(Fairy))
    local Elf_EXP        = GetItemAttr(Fairy, ITEMATTR_ENERGY)
    local Elf_MaxEXP    = GetItemAttr(Fairy, ITEMATTR_MAXENERGY)
    local Elf_URE        = GetItemAttr(Fairy, ITEMATTR_URE)
    local FruitGrowth    = {}
    FruitGrowth[0]        = 1
    FruitGrowth[1]        = 1
    FruitGrowth[2]        = 2
    FruitGrowth[3]        = 3
    FruitGrowth[4]        = 4
    FruitGrowth[5]        = 5
    FruitGrowth[6]        = 6
    FruitGrowth[7]        = 7
    FruitGrowth[8]        = 8
    FruitGrowth[9]        = 9
    FruitGrowth[10]        = 10
    local FairyGrowth    = ELEEXP_GETRAD
				if GetItemID(Fairy) == 500 then
            FairyGrowth = 10 -- 10x rate pra Angela Junior.
            end
    local StateLv        = GetChaStateLv(Player, STATE_JLJSGZ)
    if Elf_URE > 49 then
        if (FruitGrowth[StateLv] ~= nil) then
            Elf_EXP             = Elf_EXP + FairyGrowth * FruitGrowth[StateLv]
            if Elf_EXP >= Elf_MaxEXP then
                Elf_EXP         = Elf_MaxEXP
            else
                local EXP_Gained = FairyGrowth * FruitGrowth[StateLv]
                SystemNotice(Player, FairyName.." EXP Gained: "..EXP_Gained)
            end
            SetItemAttr(Fairy, ITEMATTR_ENERGY, Elf_EXP)
            RefreshCha(Player)
        end
    end
end

function GetFairyLevel(Fairy)
    local STR = GetItemAttr(Fairy, ITEMATTR_VAL_STR)
    local CON = GetItemAttr(Fairy, ITEMATTR_VAL_CON)
    local AGI = GetItemAttr(Fairy, ITEMATTR_VAL_AGI)
    local ACC = GetItemAttr(Fairy, ITEMATTR_VAL_DEX)
    local SPR = GetItemAttr(Fairy, ITEMATTR_VAL_STA)
    local FairyLv = STR + CON + AGI + ACC + SPR
    return FairyLv
end


--------------------------�������Ӿ�������ֵ--------------------------------------------
function Give_ElfURE ( role , Item  , Num )
	local ure =  GetItemAttr( Item ,ITEMATTR_URE )
	local Elf_MaxURE = GetItemAttr( Item ,ITEMATTR_MAXURE )
	--local Num = 10
	if ure<=49   then
		SetChaKbItemValid2(role , Item , 1 , 0)
	end
	--SystemNotice ( role , ure )
	ure = ure + Num

	if ure >= Elf_MaxURE    then
		ure = Elf_MaxURE
	end
	SetItemAttr ( Item , ITEMATTR_URE , ure )


end


--��⾫���Ƿ�ӵ���㹻�ĳɳ�������
function CheckElf_EXP ( role , Item )
	local Elf_EXP =  GetItemAttr( Item ,ITEMATTR_ENERGY )
	local Elf_MaxEXP =  GetItemAttr( Item ,ITEMATTR_MAXENERGY )


	if Elf_EXP >= Elf_MaxEXP   then
	        return 1
	else
		return 0
	end
end

--�����ɳ�
function Lvup_Str ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_STR
	--SystemNotice(role ,attr_type )
	ElfLVUP(role,Item_Traget,attr_type,1,0) 
end 
--���ʳɳ�
function Lvup_Con ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_CON 
	ElfLVUP(role,Item_Traget,attr_type,1,0)
end 
--���ݳɳ�
function Lvup_Agi ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_AGI 
	ElfLVUP(role,Item_Traget,attr_type,1,0) 
end 
--רע�ɳ�
function Lvup_Dex ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_DEX
	ElfLVUP(role,Item_Traget,attr_type,1,0)
end 
--����ɳ�
function Lvup_Sta ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_STA 
	ElfLVUP(role,Item_Traget,attr_type,1,0)  
end 
--����˫���ɳ�
function Lvup_Str_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_STR
	--SystemNotice(role ,attr_type )
	ElfLVUP(role,Item_Traget,attr_type,2,0)  
end 
--����˫���ɳ�
function Lvup_Con_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_CON 
	ElfLVUP(role,Item_Traget,attr_type,2,0) 
end 
--����˫���ɳ�
function Lvup_Agi_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_AGI 
	ElfLVUP(role,Item_Traget,attr_type,2,0) 
end 
--רע˫���ɳ�
function Lvup_Dex_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_DEX
	ElfLVUP(role,Item_Traget,attr_type,2,0)  
end 
--����˫���ɳ�
function Lvup_Sta_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_STA 
	ElfLVUP(role,Item_Traget,attr_type,2,0) 
end 



--������������(����)
function ElfLVUP(role,item,attrType,lvupType,falseType)
	local elfLV=GetElfLV(item)
	local elfMaxEXP = GetItemAttr(item,ITEMATTR_MAXENERGY) 
	local elfMaxURE = GetItemAttr(item,ITEMATTR_MAXURE)

	local attrNum = GetItemAttr( item ,attrType )

	local a = 1 / ( math.floor ( ( 1 + ( math.pow ( ( elfLV / 10 ) , 3 ) ) ) * 10 ) / 10 * math.max ( 0.01 ,( 1 - attrNum * 0.05 ) ) )
	if elfLV >= 40 and elfLV<60   then
		a=a*0.75 
	end
	if elfLV >= 60   then
		a = 1 / ( math.floor ( ( 1 + ( math.pow ( ( elfLV / 10 ) , 3 ) ) ) * 10 ) / 10 ) * math.max ( 0.01 ,( 1 - attrNum * 0.05 ) )
	end
	local b = Percentage_Random ( a )
	local elfEXP = GetItemAttr( item ,ITEMATTR_ENERGY ) --ȡ����ɳ���
	if b == 1   then						--�ɳ����������ԣ��۳����гɳ�ֵ -- ITEMATTR_ENERGY
		AddItemEffect(role , item , 0  )
		elfEXP = 0
		CALCULATE_FUNCTIONS_LUA_000129 = GetResString("CALCULATE_FUNCTIONS_LUA_000129")
		SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000129)	
		attrNum = attrNum + lvupType
		SetItemAttr ( item , attrType , attrNum )

		local Item_MAXENERGY = 240 * ( elfLV+ lvupType )
		if Item_MAXENERGY > 6480   then
			Item_MAXENERGY = 6480
		end


		local Item_MAXURE_NUM = elfMaxURE + 1000*lvupType

		if Item_MAXURE_NUM > 32000   then
			Item_MAXURE_NUM = 32000
		end
		if Item_MAXURE_NUM ==25000    then
			Item_MAXURE_NUM = 25000+1
		end
		SetItemAttr ( item , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( item , ITEMATTR_MAXURE , Item_MAXURE_NUM )
		
		ResetItemFinalAttr(item)
		AddItemEffect(role , item , 1  )
	else							--δ��ɳ�����۳�һ��ĳɳ�ֵ







		if falseType == 1   then 
			elfEXP = 0
			CALCULATE_FUNCTIONS_LUA_000130 = GetResString("CALCULATE_FUNCTIONS_LUA_000130")
			SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000130)
		else

			elfEXP = 0.5 * elfEXP 
			CALCULATE_FUNCTIONS_LUA_000131 = GetResString("CALCULATE_FUNCTIONS_LUA_000131")
			SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000131)
		end



	end
	if falseType == 1   then 
		SetItemAttr ( item , ITEMATTR_URE , 0 )
	end		
	SetItemAttr ( item , ITEMATTR_ENERGY , elfEXP )
end
----------------------------------------
function Give_ElfEXP_MISSION ( role , num )						--�������ӳ��ﾭ��ű�

	local Item = GetChaItem ( role , 2 ,  2  ) 
	local Elf_EXP =  GetItemAttr( Item ,ITEMATTR_ENERGY )		--ȡ���ﵱǰ�ɳ���
	local Elf_MaxEXP = GetItemAttr( Item ,ITEMATTR_MAXENERGY )	--ȡ�������ɳ���
	local ure = GetItemAttr( Item ,ITEMATTR_URE )			--ȡ���ﵱǰ����ֵ
	if ure <= 50   then									
		CALCULATE_FUNCTIONS_LUA_000132 = GetResString("CALCULATE_FUNCTIONS_LUA_000132")
		SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000132)			--��������50ʱ�޷���ó���exp
		return 0 
	else 
		ure = ure - 40								--��������ʱ���۳�����40�����������ӳ���EXP
		SetItemAttr ( Item , ITEMATTR_URE , ure ) 
		num = math.min ( num , Elf_MaxEXP - Elf_EXP ) 
		SetItemAttr ( Item , ITEMATTR_ENERGY , num ) 
	end 
	return 1 
end 


-----------------------------------------------
function CheckElfHaveSkill ( Num , SkillType , SkillNum )
	--Notice( "BEGINCheckElfHaveSkill" )

	local Part2 = GetNum_Part2 ( Num )	--Get Num Part 1 �� Part 7
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )


	if Part3 == SkillType and Part2 == SkillNum   then
		return 1

	elseif Part2 == SkillNum   then
		return 2
	end
	
	if Part5 == SkillType and Part4 == SkillNum   then
		return 1
	elseif Part4 == SkillNum   then
		return 2
	end
	
	if Part7 == SkillType and Part6 == SkillNum   then
		return 1
	elseif Part6 == SkillNum   then
		return 2
	end
	
	return 0

end

----------------------------------------------------------

function AddElfSkill ( Item , SkillType , SkillNum )
	--Notice( "BEGINAddElfSkill" )
	

	local Num = GetItemForgeParam ( Item , 1 ) --����32λ������Ϣ����	
	--Notice ( "Num= "..Num)
	local Part1 = GetNum_Part1 ( Num )	--Get Num Part 1 �� Part 7
	local Part2 = GetNum_Part2 ( Num )
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )

	if Part2 == SkillNum   then
		Part3 = SkillType
		Num = SetNum_Part3 ( Num , Part3 )
		Num = SetNum_Part2 ( Num , Part2 )
		SetItemForgeParam ( Item , 1 , Num )
		return 
	end
	
	if Part4 == SkillNum   then
		Part5 = SkillType
		Num = SetNum_Part5 ( Num , Part5 )
		Num = SetNum_Part4 ( Num , Part4 )
		SetItemForgeParam ( Item , 1 , Num )
		return 
	end

	if Part6 == SkillNum   then
		 Part7 = SkillType
		Num = SetNum_Part7 ( Num , Part7 )
		Num = SetNum_Part6 ( Num , Part6 )
		SetItemForgeParam ( Item , 1 , Num )
		return 
	end

	local rad = math.random( 1 , 100 )   --��� 1��100                            
	if Part2 == 0 and Part3 == 0   then
		Part2 = SkillNum
		Part3 = SkillType
		Num = SetNum_Part3 ( Num , Part3 )
		Num = SetNum_Part2 ( Num , Part2 )
		SetItemForgeParam ( Item , 1 , Num )
		return
	else
		if rad<= 30   then	
			Part2 = SkillNum
			Part3 = SkillType
			Num = SetNum_Part3 ( Num , Part3 )
			Num = SetNum_Part2 ( Num , Part2 )
			SetItemForgeParam ( Item , 1 , Num )
			return
		--��
		--�޲���
		end
	end
	if Part4 == 0 and Part5 == 0   then
		Part4 = SkillNum
		Part5 = SkillType
		Num = SetNum_Part5 ( Num , Part5 )
		Num = SetNum_Part4 ( Num , Part4 )
		SetItemForgeParam ( Item , 1 , Num )
		return
	else
		if rad> 30 and rad < 60   then
			Part4 = SkillNum
			Part5 = SkillType
			Num = SetNum_Part5 ( Num , Part5 )
			Num = SetNum_Part4 ( Num , Part4 )
			SetItemForgeParam ( Item , 1 , Num )
			return
			--��
			--�޲���
		end
	end
	if Part6 == 0 and Part7 == 0   then
		Part6 = SkillNum
		Part7 = SkillType
		Num = SetNum_Part7 ( Num , Part7 )
		Num = SetNum_Part6 ( Num , Part6 )
		SetItemForgeParam ( Item , 1 , Num )
		return
	else
			Part6 = SkillNum
			Part7 = SkillType
			Num = SetNum_Part7 ( Num , Part7 )
			Num = SetNum_Part6 ( Num , Part6 )	
			SetItemForgeParam ( Item , 1 , Num )
		return
	end
end

------------------------------------------------------------------

function CheckHaveElf ( role )
	local Item = GetChaItem ( role , 2 , 1  ) --ȡ��ɫ�����ڶ�����ָ��
	if Item == nil   then              --?Item == 0 ʲô��˼
		return 0
	end
	
	local Item_Type =  GetItemType ( Item ) --Item �ĵ�������
	
	if Item_Type ~= 59   then
		return 0
	else
		local ure = GetItemAttr( Item ,ITEMATTR_URE )  --��������

		if ure <= 49   then
			return 0
		end
	end
	--Notice("CheckHaveElf��ִ��" )
	return Item

end

--���鼼��

--������
function ElfSKill_PowerSheild ( role , Elf_Item , Num , dmg )
	if dmg <= 0   then
		return 0
	end
	local role_hp = Hp ( role )
	local role_maxhp = Mxhp ( role )
	local havehp = role_maxhp / role_hp
	if havehp < 5   then
		return 0
	end
	local Elf_SheildLv = GetElfSkill_Lv ( Num , 1 )
	dmg = math.floor ( dmg * ( 0.3 + Elf_SheildLv * 0.15 )  ) 

	local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
	local Dmg_Take_rad = 10 
	local Elf_Dmg_CanTake = ( Item_URE - 50 ) / Dmg_Take_rad
	
	if Elf_Dmg_CanTake >= dmg   then
		local Elf_URE_Take = math.floor ( dmg * Dmg_Take_rad )
		local Elf_URE_Notice = math.floor ( Elf_URE_Take / 50 )
		Take_ElfURE ( role , Elf_Item , 2 , Elf_URE_Take )
		CALCULATE_FUNCTIONS_LUA_000133 = GetResString("CALCULATE_FUNCTIONS_LUA_000133")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000133..dmg)
		return dmg
	else
		CALCULATE_FUNCTIONS_LUA_000134 = GetResString("CALCULATE_FUNCTIONS_LUA_000134")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000134 )
		return 0
	end
end

--��þ���ָ�����ܵȼ�
function GetElfSkill_Lv ( Num , SkillNum )
	local Part2 = GetNum_Part2 ( Num )
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )
	
	if SkillNum == Part2   then
		return Part3
	elseif SkillNum == Part4   then
		return Part5
	elseif SkillNum == Part6   then
		return Part7
	end
	return 0
end

--����

function ElfSKill_ElfCrt ( role , Elf_Item , Num )
	local Elf_SkillLv = GetElfSkill_Lv ( Num , 2 )
	local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
	if Item_URE < 50   then
		CALCULATE_FUNCTIONS_LUA_000135 = GetResString("CALCULATE_FUNCTIONS_LUA_000135")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000135 )
		return 0
	end
	local b = ( Elf_SkillLv * 2 + 1 )  * 0.01
	local a = Percentage_Random ( b )
	if a == 1   then
		
		Take_ElfURE ( role , Elf_Item , 2 , Elf_SkillLv )
		return 1
		
	else
		return 0
	end
end

--ħ��

function ElfSkill_MagicAtk ( dmg , role )
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0   then
		local Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 3 )
		if CheckElfSkill == 2   then
			local Elf_SkillLv = GetElfSkill_Lv ( Num , 3 )
			local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
			if Item_URE <= 50   then
				CALCULATE_FUNCTIONS_LUA_000136 = GetResString("CALCULATE_FUNCTIONS_LUA_000136")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000136 )
				return 0
			else
				if Elf_SkillLv == 1   then	
					Take_ElfURE ( role , Elf_Item , 2 , 1 )
					return dmg * 0.05 + 5 
				elseif Elf_SkillLv == 2   then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return dmg * 0.08 + 8
				elseif Elf_SkillLv == 3   then
					Take_ElfURE ( role , Elf_Item , 2 , 3 )
					return dmg * 0.1 + 10
				end
			end
		end
	end
	return 0
end


--�ظ�
function ElfSkill_HpResume ( role )
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0   then
		local Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 4 )
		if CheckElfSkill == 2   then
			local Elf_SkillLv = GetElfSkill_Lv ( Num , 4 )
			local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
			if Item_URE <= 50   then
				CALCULATE_FUNCTIONS_LUA_000136 = GetResString("CALCULATE_FUNCTIONS_LUA_000136")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000136 )
				return 0
			else
				if Elf_SkillLv == 1   then	
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 10
				elseif Elf_SkillLv == 2   then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 20
				elseif Elf_SkillLv == 3   then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 35
				end
			end
		end
	end
	return 0
end


--��˼

function ElfSkill_SpResume ( role )
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0   then
		local Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 5 )
		if CheckElfSkill == 2   then
			local Elf_SkillLv = GetElfSkill_Lv ( Num , 5 )
			local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
			if Item_URE <= 50   then
				CALCULATE_FUNCTIONS_LUA_000136 = GetResString("CALCULATE_FUNCTIONS_LUA_000136")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000136 )
				return 0
			else
				if Elf_SkillLv == 1   then	
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 10
				elseif Elf_SkillLv == 2   then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 20
				elseif Elf_SkillLv == 3   then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 35
				end
			end
		end
	end
	return 0
end
--------------------------------����ֵѡ�񽻻�
function CreditExchangeImpl( role, tp )
	local i = CheckBagItem( role,3849 )
	if i==1   then
		local Item = GetChaItem2 ( role , 2 , 3849 )
		local rongyu_num=GetItemAttr ( Item , ITEMATTR_VAL_STR )
		if rongyu_num<=0   then
			CALCULATE_FUNCTIONS_LUA_000137 = GetResString("CALCULATE_FUNCTIONS_LUA_000137")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000137)
			return
		end
		local middle=0
		if rongyu_num<30000   then
			middle=30000 - rongyu_num
		end
		middle= math.floor ( middle / 2 )
		local exp_star=GetChaAttr (  role , ATTR_CEXP )----------��ǰ����
		local job = GetChaAttr(role, ATTR_JOB)
		local lv=GetChaAttr(role, ATTR_LV) 
		local money_num=rongyu_num*100
		local exp_num=rongyu_num*5+exp_star
		local rad=math.random(1,30000)
		local cha_type = GetChaTypeID ( role )
		local cha_namea = GetChaDefaultName ( role )
		LG( "star_rongyuzhichange_lg" ,cha_namea, tp , lv , exp_star , job , cha_type)
		if tp==0 or tp==1 or tp==2   then ----����ֵ��Ǯ
			if lv>=15 and lv<=40   then
				money_num=rongyu_num*200
			elseif lv>=41 and lv<=60   then
				money_num=rongyu_num*250
			elseif lv>=61   then
				money_num=rongyu_num*300
			end
			AddMoney ( role , 0 , money_num ) 
		CALCULATE_FUNCTIONS_LUA_000138 = GetResString("CALCULATE_FUNCTIONS_LUA_000138")
		LG( "star_rongyuzhichange_lg" ,cha_namea..CALCULATE_FUNCTIONS_LUA_000138..money_num)
		elseif tp==3 or tp==4 or tp==5   then -----����ֵ������
			local dif_exp = rongyu_num*20+exp_star - DEXP[lv+1]
			if lv>=15 and lv<=30   then
				exp_num=rongyu_num*10+exp_star
				local a1= math.floor (rongyu_num*10 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv>=31 and lv<=40   then
				exp_num=rongyu_num*13+exp_star
				local a1= math.floor (rongyu_num*13 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv>=41 and lv<=50   then
				exp_num=rongyu_num*22+exp_star
				local a1= math.floor (rongyu_num*22 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv>=51 and lv<=60   then
				exp_num=rongyu_num*44+exp_star
				local a1= math.floor (rongyu_num*44 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv>=61 and lv<=70   then
				exp_num=rongyu_num*102+exp_star
				local a1= math.floor (rongyu_num*102 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv>=71 and  lv<=78   then
				exp_num=rongyu_num*270+exp_star
				local a1= math.floor (rongyu_num*270 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv==79 and dif_exp<=0   then 
				exp_num=rongyu_num*270+exp_star
				local a1= math.floor (rongyu_num*270 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv==79 and dif_exp>0   then 
				exp_num = dif_exp*0.02 + DEXP[lv+1]
				local a1= math.floor (rongyu_num*270)
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			elseif lv>=80    then
				exp_num=rongyu_num*270*0.02+exp_star
				local a1= math.floor (rongyu_num*270 )
				CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
			end
			SetChaAttrI( role , ATTR_CEXP , exp_num )
			local lg_exp=exp_num-exp_star
			CALCULATE_FUNCTIONS_LUA_000140 = GetResString("CALCULATE_FUNCTIONS_LUA_000140")
			LG( "star_rongyuzhichange_lg" ,cha_namea..CALCULATE_FUNCTIONS_LUA_000140..lg_exp)
		elseif tp==6 or tp==7 or tp==8   then -----����ֵ��װ��
			if lv>=15 and lv<=40   then
				if rad<=rongyu_num or rongyu_num>=30000   then
					GiveItem ( role , 0 , 3458  , 1 , 4 ) 
					CALCULATE_FUNCTIONS_LUA_000141 = GetResString("CALCULATE_FUNCTIONS_LUA_000141")
					LG( "star_rongyuzhichange_lg" ,cha_namea..CALCULATE_FUNCTIONS_LUA_000141..3458)
				elseif rad>rongyu_num and rad<=middle   then
					AddMoney ( role , 0 , money_num ) 
				elseif rad>middle and rad<=30000   then
					SetChaAttrI( role , ATTR_CEXP , exp_num )
					local a1= math.floor (rongyu_num*5 )
					CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
				end
			elseif lv>=41 and lv<=60   then
				if rad<=rongyu_num or rongyu_num>=30000   then
					local rad1=math.random(1,12)
					local Lg_ID=787
					if rad1==1   then
						Lg_ID=787
					elseif rad1==2   then
						Lg_ID=791
					elseif rad1==3   then
						Lg_ID=794
					elseif rad1==4   then
						Lg_ID=801
					elseif rad1==5   then
						Lg_ID=805
					elseif rad1==6   then
						Lg_ID=797
					elseif rad1==7   then
						Lg_ID=765
					elseif rad1==8   then
						Lg_ID=768
					elseif rad1==9   then
						Lg_ID=772
					elseif rad1==10   then
						Lg_ID=775
					elseif rad1==11   then
						Lg_ID=779
					elseif rad1==12   then
						Lg_ID=783
					end
					GiveItem ( role , 0 , Lg_ID  , 1 , 4 ) 
					CALCULATE_FUNCTIONS_LUA_000142 = GetResString("CALCULATE_FUNCTIONS_LUA_000142")
					LG( "star_rongyuzhichange_lg" ,cha_namea..CALCULATE_FUNCTIONS_LUA_000142..Lg_ID)
				elseif rad>rongyu_num and rad<=middle   then
					AddMoney ( role , 0 , money_num ) 
				elseif rad>middle and rad<=30000   then
					SetChaAttrI( role , ATTR_CEXP , exp_num )
					local a1= math.floor (rongyu_num*5 )
					CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
				end
			elseif lv>=61   then
				if rad<=rongyu_num or rongyu_num>=30000   then
				local rad2=math.random(1,3)
				local rad3=math.random(1,4)
					local Lg_ID=2530
					if job == 8   then --�޽�
						if rad2==1   then
							Lg_ID=2530
						elseif rad2==2   then
							Lg_ID=2531
						elseif rad2==3   then
							Lg_ID=2532
						end
					elseif job == 9   then   --˫��
						if rad2==1   then
							Lg_ID=2533
						elseif rad2==2   then
							Lg_ID=2534
						elseif rad2==3   then
							Lg_ID=2535
						end
					elseif job == 12   then --�ѻ���
						if rad2==1   then
							Lg_ID=2536
						elseif rad2==2   then
							Lg_ID=2537
						elseif rad2==3   then
							Lg_ID=2538
						end
					elseif job == 16   then ---- "����ʿ"
						if cha_type~=4   then
							if rad2==1   then
								Lg_ID=2539
							elseif rad2==2   then
								Lg_ID=2540
							elseif rad2==3   then
								Lg_ID=2541
							end
						else
							if rad3==1   then
								Lg_ID=2539
							elseif rad3==2   then
								Lg_ID=2540
							elseif rad3==3   then
								Lg_ID=2541
							elseif rad3==4   then
								Lg_ID=2548
							end
						end
					elseif job == 13   then    ---- "ʥְ��"
						if cha_type~=4   then
							if rad2==1   then
								Lg_ID=2542
							elseif rad2==2   then
								Lg_ID=2543
							elseif rad2==3   then
								Lg_ID=2544
							end
						else
							if rad3==1   then
								Lg_ID=2542
							elseif rad3==2   then
								Lg_ID=2543
							elseif rad3==3   then
								Lg_ID=2544
							elseif rad3==4   then
								Lg_ID=2548
							end
						end
					elseif job == 14   then    ---- "��ӡʦ"
						if cha_type~=4   then
							if rad2==1   then
								Lg_ID=2545
							elseif rad2==2   then
								Lg_ID=2546
							elseif rad2==3   then
								Lg_ID=2547
							end
						else
							if rad3==1   then
								Lg_ID=2545
							elseif rad3==2   then
								Lg_ID=2546
							elseif rad3==3   then
								Lg_ID=2547
							elseif rad3==4   then
								Lg_ID=2548
							end
						end
					end
					GiveItem ( role , 0 , Lg_ID  , 1 , 4 ) 
					CALCULATE_FUNCTIONS_LUA_000143 = GetResString("CALCULATE_FUNCTIONS_LUA_000143")
					LG( "star_rongyuzhichange_lg" ,cha_namea..CALCULATE_FUNCTIONS_LUA_000143..Lg_ID)
				elseif rad>rongyu_num and rad<=middle   then
					AddMoney ( role , 0 , money_num ) 
				elseif rad>middle and rad<=30000   then
					SetChaAttrI( role , ATTR_CEXP , exp_num )
					local a1= math.floor (rongyu_num*5 )
					CALCULATE_FUNCTIONS_LUA_000139 = GetResString("CALCULATE_FUNCTIONS_LUA_000139")
					SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000139..a1 )
				end
			end			
		end
	SetItemAttr ( Item ,ITEMATTR_VAL_STR , 0 )
	end
end
-----------------------------
-----------------------------���辫��ȼ�
function Elf_Attr_cs ( role , Item_JLone , Item_JLother )
	local Item_JLone_num={}
	local Item_JLother_num={}
	---ȡһ��������������
	Item_JLone_num[1] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )	-- ���������ӳ� 26
	Item_JLone_num[2] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )	-- ���ݳ����ӳ� 27
	Item_JLone_num[3] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )	-- רע�����ӳ� 28
	Item_JLone_num[4] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )	-- ���ʳ����ӳ� 29
	Item_JLone_num[5] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )	-- ���������ӳ� 30
	Item_JLone_num[6] = GetItemAttr( Item_JLone ,ITEMATTR_URE )			--���� 
	Item_JLone_num[7] = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )		 --�������
	Item_JLone_num[8] = Item_JLone_num[1] + Item_JLone_num[2] + Item_JLone_num[3] + Item_JLone_num[4] + Item_JLone_num[5]	----һ������ĵȼ�
	---ȡ��һ��������������
	Item_JLother_num[1] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )	-- ���������ӳ�  
	Item_JLother_num[2] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )	-- ���ݳ����ӳ�  
	Item_JLother_num[3] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )	-- רע�����ӳ�  
	Item_JLother_num[4] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )	-- ���ʳ����ӳ�  
	Item_JLother_num[5] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )	-- ���������ӳ�  
	Item_JLother_num[6] = GetItemAttr( Item_JLother ,ITEMATTR_URE )			--���� 
	Item_JLother_num[7] = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )		 --�������
	Item_JLother_num[8] = Item_JLother_num[1] + Item_JLother_num[2] + Item_JLother_num[3] + Item_JLother_num[4] + Item_JLother_num[5]	----һ������ĵȼ�

	local m=0
	local n = 0
	local num_jlone=26
	local num_jlother=26
	local max_JLone_temp=Item_JLone_num[1]
	local max_JLother_temp=Item_JLother_num[1]
	for m=1,4,1 do
		if Item_JLone_num[m+1] >max_JLone_temp   then
			max_JLone_temp=Item_JLone_num[m+1]
			num_jlone=m+26
		end
	end
	for n=1,4,1 do
		if Item_JLother_num[n+1] >max_JLother_temp   then
			max_JLother_temp=Item_JLother_num[n+1]
			num_jlother=n+26
		end
	end

	max_JLone_temp = max_JLone_temp - 4
	max_JLother_temp = max_JLother_temp - 4
	local new_JLone_MAXENERGY = 240 * (Item_JLone_num[8] + 1 - 4 )
	if new_JLone_MAXENERGY > 6480   then
		new_JLone_MAXENERGY = 6480
	end
	local new_JLone_MAXURE = 5000 + 1000*(Item_JLone_num[8] - 4 )
	if new_JLone_MAXURE > 32000   then
		new_JLone_MAXURE = 32000
	end
	local new_JLother_MAXENERGY = 240 * (Item_JLother_num[8] + 1 - 4 )
	if new_JLother_MAXENERGY > 6480   then
		new_JLother_MAXENERGY = 6480
	end
	local new_JLother_MAXURE = 5000 + 1000*(Item_JLother_num[8] - 4 )
	if new_JLother_MAXURE > 32000   then
		new_JLother_MAXURE = 32000
	end
	----����һֻ���������
	SetItemAttr ( Item_JLone , num_jlone , max_JLone_temp )
	SetItemAttr ( Item_JLone , ITEMATTR_ENERGY , 240) 	
	SetItemAttr ( Item_JLone , ITEMATTR_MAXENERGY , new_JLone_MAXENERGY )
	SetItemAttr ( Item_JLone , ITEMATTR_URE , 5000 ) 	
	SetItemAttr ( Item_JLone , ITEMATTR_MAXURE , new_JLone_MAXURE ) 	
	----������һֻ���������
	SetItemAttr ( Item_JLother , num_jlother , max_JLother_temp )
	SetItemAttr ( Item_JLother , ITEMATTR_ENERGY , 240 ) 	
	SetItemAttr ( Item_JLother , ITEMATTR_MAXENERGY , new_JLother_MAXENERGY )
	SetItemAttr ( Item_JLother , ITEMATTR_URE , 5000 ) 	
	SetItemAttr ( Item_JLother , ITEMATTR_MAXURE , new_JLother_MAXURE )  	
end
-- function  TigerStart( ... )
	--Notice("TigerStart...................")
	-- if arg.n ~= 4   then
		-- CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		-- SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..arg.n )
		-- return 
	-- end	
	-- local num = {}
	-- local Item_type = {}
	-- local num_star = 0
	-- local n  = 0
	-- local m = 0
	-- local i = 0
	-- local q=0
	-- for n=1,9,1 do --------------��ʼ��9����ƷID
		-- local star = math.random ( 1 , 4700 )
		-- local ret1 = IsItemValid(star)
		-- if ret1 ~= LUA_TRUE   then
			-- for m=1,300,1 do
				-- local ret2 = IsItemValid(star+m)
				-- if ret2 ~=LUA_TRUE   then
				-- else
					-- num[n] = star+m
				-- end
			-- end
		-- else 
			-- num [n]=star
		-- end
	-- end
	-- for i=1,9,1 do
		-- Item_type[i] = GetItemType2( num [i] )
	-- end
	-- local NocLock =	KitbagLock(arg[1], 0 )
	-- if NocLock == LUA_FALSE   then
		-- CALCULATE_FUNCTIONS_LUA_000144 = GetResString("CALCULATE_FUNCTIONS_LUA_000144")
		-- SystemNotice( arg[1] , CALCULATE_FUNCTIONS_LUA_000144)
		-- return 0
	-- end
	-- local Item_CanGet = GetChaFreeBagGridNum ( arg[1] )	
	-- if Item_CanGet < 5   then
		-- CALCULATE_FUNCTIONS_LUA_000145 = GetResString("CALCULATE_FUNCTIONS_LUA_000145")
		-- SystemNotice( arg[1] ,CALCULATE_FUNCTIONS_LUA_000145)
		-- return 0
	-- end
	-- local Money_Have = GetChaAttr ( arg[1]  , ATTR_GD )
	-- if Money_Have>1900000000   then
		-- CALCULATE_FUNCTIONS_LUA_000146 = GetResString("CALCULATE_FUNCTIONS_LUA_000146")
		-- SystemNotice (arg[1], CALCULATE_FUNCTIONS_LUA_000146)
		-- return	
	-- end
	-- if arg[2]==1   then
		-- local j1 = TakeItem(  arg[1], 0,855, 5 )			        
		-- if j1==0   then
			-- CALCULATE_FORGE_LUA_000163 = GetResString("CALCULATE_FORGE_LUA_000163")
			-- SystemNotice ( arg[1] ,CALCULATE_FORGE_LUA_000163)
			-- return
		-- end
	-- end
	-- if arg[3]==1   then
		-- local j2 = TakeItem(  arg[1], 0,855, 5 )			            
		-- if j2==0   then
			-- CALCULATE_FORGE_LUA_000163 = GetResString("CALCULATE_FORGE_LUA_000163")
			-- SystemNotice ( arg[1] ,CALCULATE_FORGE_LUA_000163)
			-- return
		-- end		
	-- end
	-- if arg[4]==1   then
		-- local j3 = TakeItem(  arg[1], 0,855, 5 )			            
		-- if j3==0   then
			-- CALCULATE_FORGE_LUA_000163 = GetResString("CALCULATE_FORGE_LUA_000163")
			-- SystemNotice ( arg[1] ,CALCULATE_FORGE_LUA_000163)
			-- return
		-- end		
	-- end
	-- local lhj_te_flg=0
	-- local lhj_yi_flg=0
	-- local lhj_hei_flg=0
	-- local now_day= os.date("%d")		-------------��          
	-- local now_hour= os.date("%H")		-------------ʱ          
	-- local now_miniute= os.date("%M")	-------------��          
	-- local now_scend=  os.date("%S")		-------------��   
	-- now_day= tonumber(now_day)		-------------��  
	-- now_hour= tonumber(now_hour)		-------------ʱ  
	-- now_miniute= tonumber(now_miniute)	 -------------��  
	-- now_scend= tonumber(now_scend)	-------------�� 
	-- local CheckTimeNum = now_day*86400 + now_hour*3600+now_miniute*60+now_scend
	-- if CheckTimeNum>NOWTIME_TE+86400   then
		-- NOWTIME_TE=CheckTimeNum
		-- lhj_te_flg=1
	-- end
	-- if CheckTimeNum>NOWTIME_YI+3600   then
		-- NOWTIME_YI=CheckTimeNum
		-- lhj_yi_flg=1
	-- end
	-- if CheckTimeNum>NOWTIME_HEI+518400   then
		-- NOWTIME_HEI=CheckTimeNum
		-- lhj_hei_flg=1
	-- end
	-- local num_s=0
	-- for num_s=1,3,1 do 
		-- if Item_type[num_s]>=1 and Item_type[num_s]<=11   then
			-- if Item_type[num_s+3] >=1 and Item_type[num_s+3]<=11   then
				-- num[num_s+3] = num[num_s]
			-- end
			-- if Item_type[num_s+6] >=1 and Item_type[num_s+6]<=11   then
				-- num[num_s+6] = num[num_s]
			-- end
		-- end
		-- if Item_type[num_s]>=22 and Item_type[num_s]<=29   then
			-- if Item_type[num_s+3] >=22 and Item_type[num_s+3]<=29   then
				-- num[num_s+3] = num[num_s]
			-- end
			-- if Item_type[num_s+6] >=22 and Item_type[num_s+6]<=29   then
				-- num[num_s+6] = num[num_s]
			-- end
		-- end
		-- if Item_type[num_s]>=36 and Item_type[num_s]<=66   then
			-- if Item_type[num_s+3] >=36 and Item_type[num_s+3]<=66   then
				-- num[num_s+3] = num[num_s]
			-- end
			-- if Item_type[num_s+6] >=36 and Item_type[num_s+6]<=66   then
				-- num[num_s+6] = num[num_s]
			-- end
		-- end
	-- end
	-- local j=0
	-- for j=1,9,1 do
		-- Item_type[j] = GetItemType2( num [j] )----------��������
		-- if num[j]==822 or num[j]==823 or num[j]==825 or num[j]==826 or num[j]==827 or num[j]==1116 or num[j]==1117 or num[j]==1118 or num[j]==46  or num[j]==1124  or num[j]==1125  or num[j]==1126  or num[j]==1127 or  num[j]==1057  or  num[j]==1060   or  num[j]==1063    or  num[j]==1066   or  num[j]==1034  or  num[j]==586  or  num[j]==762  or  num[j]==3061  or  num[j]==410   or  num[j]==2885    then--------CABAL�Խ�ȯ�����޺ͻԻ�,�Ҷ�����
			-- num[j]=3360 ---------��ʯ		
		-- end
		-- if num[j]>=845 and num[j]<=847   then--------��������
			-- local rad_s= math.random ( 1 , 40 )
			-- if rad_s>=3 or lhj_hei_flg==0   then
				-- num[j]=3360 ---------��ʯ		
			-- end
		-- end
		------------fei�����⼸�����͵���Ʒ����
		-- if Item_type[j]~=1 and Item_type[j]~=2 and Item_type[j] ~=3 and Item_type[j] ~=4 and Item_type[j] ~=7 and Item_type[j] ~=9 and Item_type[j] ~=11 and Item_type[j] ~=22 and Item_type[j] ~=23 and Item_type[j] ~=24 and Item_type[j] ~=25 and Item_type[j] ~=26 and Item_type[j] ~=27 and Item_type[j] ~=29 and Item_type[j] ~=36 and Item_type[j] ~=47 and Item_type[j] ~=50 and Item_type[j] ~=57 and Item_type[j] ~=58 and Item_type[j] ~=60 and Item_type[j] ~=65 and Item_type[j] ~=66   then
			-- local eleven = math.random ( 1 , 1000 )	
			-- local new_id = math.random ( 3850 , 3875 )
			-- if eleven <= 328   then
				-- num[j]= new_id ----------��Ƭ
			-- elseif eleven >=329 and  eleven<=999   then
				-- num[j]=3360 ---------��ʯ
			-- else
				-- num[j]=194 ---------��Ǯ
			-- end
		-- end
	-- end
	-- local rad1= 0
	-- local rad2= 0
	-- local rad3= 0
	-- local rad4= 0
	-- local rad5= 0
	-- local rad6= 0
	-- local rad7= 0
	-- local rad8= 0
	-- local rad9= 0
	-- local rad10= 0
	-- local rad11= 0
	-- local p=0
	-- local p=0
	-- for p=1,9,1 do
		-- if num[p]>=831 and num[p]<=842   then
			-- rad1=1
		-- end
		-- if num[p]>=2300 and num[p]<=2344   then
			-- rad2=1
		-- end
		-- if num[p]>=2367 and num[p]<=2407   then
			-- rad3=1
		-- end
		-- if num[p]>=2549 and num[p]<=2553   then
			-- rad4=1
		-- end
		-- if num[p]>=2588 and num[p]<=3061   then
			-- rad5=1
		-- end
		-- if num[p]>=3936 and num[p]<=3942   then
			-- rad6=1
		-- end
		-- if num[p]>=4311 and num[p]<=4313   then
			-- rad7=1
		-- end
		-- if num[p]>=28 and num[p]<=31   then
			-- rad8=1
		-- end
		-- if num[p]>=194 and num[p]<=227   then
			-- rad9=1
		-- end
		-- if num[p]>=276 and num[p]<=280   then
			-- rad10=1
		-- end
		-- local h=0
		-- for h=1,252,1 do
			-- if num[p]==LHJ_ID[h]   then
				-- rad11=1
			-- end
		-- end
		-- if rad1==1 or  rad2==1 or rad3==1 or  rad4==1 or rad5==1 or rad6==1 or  rad7==1  or  rad8==1  or  rad9==1 or  rad10==1  or rad11==1 or  num[p]==457 or num[p]==458 or num[p]==459 or num[p]==464 or num[p]==640 or num[p]==816  or num[p]==822 or num[p]==823 or num[p]==3115 or num[p]==18 or num[p]==19 or num[p]==43 or num[p]==109 or num[p]==111 or num[p]==113 or num[p]==115 or num[p]==117 or num[p]==119  or num[p]==127 or num[p]==150 or num[p]==308 or num[p]==309 or num[p]==348 or num[p]==349   then
			-- local new_id1 = math.random ( 3850 , 3875 )
			-- num[p]= new_id1 ----------��Ƭ		
		-- end
	-- end
	--------------------���ƴ󽱳��ֻ���
	-- local reset_rad=math.random ( 1 , 100 )
	-- local kapian_rad=math.random ( 3850 , 3875 )
	-- if reset_rad>=47 and num[1]==num[3] and num[1]==num[5] and num[1]==num[7]  and num[1]==num[9]    then-------�帣ͬ�ٽ���39%
		-- num[9]=kapian_rad
	-- end
	-- if reset_rad>=24 and num[2]==num[4] and num[2]==num[5] and num[2]==num[6]  and num[2]==num[8]    then-------ʮȫʮ������66%
		-- num[8]=kapian_rad
	-- end
	-- if  num[1]==num[2] and num[1]==num[3] and num[1]==num[4]  and num[1]==num[6] and num[1]==num[7] and num[1]==num[8]  and num[1]==num[9]   then-------����ͬ�콵��66%
		-- if lhj_yi_flg==0 or reset_rad>=10   then
			-- num[9]=kapian_rad
		-- end
	-- end
	-- if  num[1]==num[2] and num[1]==num[3] and num[1]==num[4] and num[1]==num[5] and num[1]==num[6] and num[1]==num[7] and num[1]==num[8]  and num[1]==num[9]   then-------�����޽�����89%
		-- if lhj_te_flg==0 or reset_rad>=2   then
			-- num[9]=kapian_rad
		-- end
	-- end
	-- return num[1] , num[2] , num[3] , num[4] , num[5] , num[6] , num[7] , num[8] , num[9] 
-- end

-- function TigerStop(...)
	--Notice("TigerStop...................")
	-- if arg.n ~= 13   then
		-- CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		-- SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..arg.n )
		-- return 
	-- end	
	-- local flag=0
	-- if arg[11]==1 and arg[12]==1 and arg[13]==1   then
		-- flag=1
	-- end
	-- local flag_myp=1
	-- if arg[2]==0 or arg[3]==0 or arg[4]==0 or arg[5]==0 or arg[6]==0 or arg[7]==0 or arg[8]==0 or  arg[9]==0 or arg[10]==0 or arg[2]==nil or arg[3]==nil or arg[4]==nil or arg[5]==nil or arg[6]==nil or arg[7]==nil or arg[8]==nil or  arg[9]==0 or arg[10]==nil   then
		 -- flag_myp=0
		-- CALCULATE_FUNCTIONS_LUA_000147 = GetResString("CALCULATE_FUNCTIONS_LUA_000147")
		-- SystemNotice ( arg[1] , CALCULATE_FUNCTIONS_LUA_000147 )
		-- return 	
	-- end
	-- local new_id = math.random ( 3850 , 3875 )
	-- if arg[2] == arg[3] and arg[3] == arg[4] and arg[4] == arg[5]  and arg[5] == arg[6] and arg[6] == arg[7] and arg[7] == arg[8] and arg[8] == arg[9] and arg[9] == arg[10]  and arg[2]~=new_id and flag==1 and flag_myp==1   then ---------------------����˹�Ļſ֡�
		-- local cha_name4 = GetChaDefaultName ( arg[1] ) 
		-- local item_rad = math.random ( 1 , 9 )
		-- if item_rad==1   then
			-- item_rad_id=862
		-- elseif item_rad==2   then
			-- item_rad_id=863
		-- elseif item_rad>=3 or  item_rad<=8   then
			-- item_rad_id=271
		-- else
			-- item_rad_id=1012
		-- end
		-- local itemname12 = GetItemName ( item_rad_id ) 
		-- CALCULATE_FUNCTIONS_LUA_000148 = GetResString("CALCULATE_FUNCTIONS_LUA_000148")
		-- local message4 = cha_name4..CALCULATE_FUNCTIONS_LUA_000148..itemname12
		-- Notice ( message4 )
		-- CALCULATE_FUNCTIONS_LUA_000149 = GetResString("CALCULATE_FUNCTIONS_LUA_000149")
		-- SynTigerString ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000149..itemname12)
		-- AddMoney ( arg[1] , 0 , 10000000 )--------1000W����
		-- GiveItem ( arg[1] , 0 ,2665  , 1 , 4  )----------------�صȽ�ȯ
		-- GiveItem ( arg[1] , 0 , item_rad_id  , 1 , 4  )
		-- if arg[2] ~= 3360   then --------��ʯ
			-- if arg[2] == 845 or arg[2] == 846 or arg[2] == 847   then
				-- local s12=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , s12  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			-- end
		-- end
		-- LG( "LHJ_wanshou_lg" ,cha_name4,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
		--TeDengJiang_Star_Count=1
	-- end
	-- if arg[2] == arg[3] and arg[3] == arg[4] and arg[4] == arg[5] and arg[5] == arg[7] and arg[7] == arg[8] and arg[8] == arg[9] and arg[9] == arg[10]  and arg[2]~=new_id and flag==1  and flag_myp==1    then ---------------------������ͬ�족
		--local itemname3 = GetItemName ( arg[3] ) 
		-- local item_rad = math.random ( 1 , 8 )
		-- if item_rad==1   then
			-- item_rad_id=878
		-- elseif item_rad==2   then
			-- item_rad_id=879
		-- elseif item_rad==3   then
			-- item_rad_id=880
		-- elseif item_rad==4   then
			-- item_rad_id=881
		-- elseif item_rad==5   then
			-- item_rad_id=882
		-- elseif item_rad==6   then
			-- item_rad_id=883
		-- elseif item_rad==7   then
			-- item_rad_id=884
		-- else
			-- item_rad_id=887
		-- end
		-- local itemname11 = GetItemName ( item_rad_id ) 
		-- local cha_name3 = GetChaDefaultName ( arg[1] ) 
		-- CALCULATE_FUNCTIONS_LUA_000150 = GetResString("CALCULATE_FUNCTIONS_LUA_000150")
		-- local message3 = cha_name3..CALCULATE_FUNCTIONS_LUA_000150..itemname11
		-- Notice ( message3 )
		-- CALCULATE_FUNCTIONS_LUA_000151 = GetResString("CALCULATE_FUNCTIONS_LUA_000151")
		-- SynTigerString ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000151..itemname11)
		-- AddMoney ( arg[1] , 0 , 3000000 )--------300W����
		-- GiveItem ( arg[1] , 0 ,2666  , 1 , 4  )----------------һ�Ƚ�
		--GiveItem ( arg[1] , 0 , 271  , 1 , 4  )
		-- GiveItem ( arg[1] , 0 , item_rad_id  , 1 , 4  )
		-- if arg[2] ~= 3360   then --------��ʯ
			-- if arg[2] == 845 or arg[2] == 846 or arg[2] == 847   then
				-- local s11=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , s11  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			-- end
		-- end
		-- LG( "LHJ_putian_lg" ,cha_name3,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
		--YiDengJiang_Star_Count=1
	-- end
	-- if arg[3] == arg[5] and arg[5] == arg[6] and arg[6] == arg[7] and arg[7] == arg[9] and arg[3]~=new_id and flag==1  and flag_myp==1   then ---------------------��ʮȫʮ����
		-- local itemname2 = GetItemName ( arg[3] ) 
		-- local cha_name2 = GetChaDefaultName ( arg[1] ) 
		-- CALCULATE_FUNCTIONS_LUA_000152 = GetResString("CALCULATE_FUNCTIONS_LUA_000152")
		-- local message2 = cha_name2..CALCULATE_FUNCTIONS_LUA_000152  
		-- Notice ( message2 )
		-- CALCULATE_FUNCTIONS_LUA_000153 = GetResString("CALCULATE_FUNCTIONS_LUA_000153")
		-- SynTigerString( arg[1] ,CALCULATE_FUNCTIONS_LUA_000153)
		-- AddMoney ( arg[1] , 0 , 500000 )--------50W����
		-- GiveItem ( arg[1] , 0 ,2666  , 1 , 4  )----------------һ�Ƚ�
		-- GiveItem ( arg[1] , 0 , 1095  , 1 , 4  )
		-- if arg[3] ~= 3360   then --------��ʯ
			-- if arg[3] == 845 or arg[3] == 846 or arg[3] == 847   then
				-- local s10=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[3]  , 1 , s10  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[3]  , 1 , 23  )
			-- end
		-- end
		-- LG( "LHJ_shiquan_lg" ,cha_name2,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[2] == arg[4] and arg[4] == arg[6] and arg[6] == arg[8] and arg[8] == arg[10] and arg[2]~=new_id and flag==1 and flag_myp==1    then ---------------------���帣ͬ�١�
		--local itemname1 = GetItemName ( arg[2] ) 
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- CALCULATE_FUNCTIONS_LUA_000154 = GetResString("CALCULATE_FUNCTIONS_LUA_000154")
		-- local message1 = cha_name1..CALCULATE_FUNCTIONS_LUA_000154 
		-- Notice ( message1 )
		-- CALCULATE_FUNCTIONS_LUA_000155 = GetResString("CALCULATE_FUNCTIONS_LUA_000155")
		-- SynTigerString  ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000155)
		-- AddMoney ( arg[1] , 0 , 300000 )--------30W����
		-- GiveItem ( arg[1] , 0 ,2667  , 1 , 4  )----------------���Ƚ�
		-- if arg[2] ~= 3360   then --------��ʯ
			-- if arg[2] == 845 or arg[2] == 846 or arg[2] == 847   then
				-- local s9=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , s9  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			-- end
		-- end
		-- LG( "LHJ_wufu_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[2] == arg[4] and arg[4] == arg[8] and arg[8] == arg[10] and arg[2]~=new_id and flag==1 and flag_myp==1   then ---------------------���ļ�ƽ����
		-- CALCULATE_FUNCTIONS_LUA_000156 = GetResString("CALCULATE_FUNCTIONS_LUA_000156")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000156)
		-- CALCULATE_FUNCTIONS_LUA_000157 = GetResString("CALCULATE_FUNCTIONS_LUA_000157")
		-- SynTigerString  ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000157)
		-- AddMoney ( arg[1] , 0 , 50000 )--------5W����
		-- GiveItem ( arg[1] , 0 ,2668  , 1 , 4  )----------------���Ƚ�
		-- GiveItem ( arg[1] , 0 , 3323  , 1 , 4  )
		-- if arg[2] ~= 3360   then --------��ʯ
			-- if arg[2] == 845 or arg[2] == 846 or arg[2] == 847   then
				-- local s8=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , s8  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			-- end
		-- end
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_siji_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[3] == arg[5] and arg[5] == arg[7] and arg[7] == arg[9] and arg[3]~=new_id and flag==1 and flag_myp==1   then ---------------------��С���Ĳˡ�
		-- CALCULATE_FUNCTIONS_LUA_000158 = GetResString("CALCULATE_FUNCTIONS_LUA_000158")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000158)
		-- CALCULATE_FUNCTIONS_LUA_000159 = GetResString("CALCULATE_FUNCTIONS_LUA_000159")
		-- SynTigerString  ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000159)
		-- AddMoney ( arg[1] , 0 , 30000 )--------3W����
		-- GiveItem ( arg[1] , 0 ,2668  , 1 , 4  )----------------���Ƚ�
		-- local rad_heishi=math.random ( 1 , 2 )
		-- if rad_heishi==1   then
			-- GiveItem ( arg[1] , 0 , 3326  , 1 , 4  )
		-- else
			-- GiveItem ( arg[1] , 0 , 3328  , 1 , 4  )			
		-- end
		-- if arg[3] ~= 3360   then --------��ʯ
			-- if arg[3] == 845 or arg[3] == 846 or arg[3] == 847   then
				-- local s7=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[3]  , 1 , s7  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[3]  , 1 , 23  )
			-- end
		-- end
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_xiaokong_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[4] == arg[6] and arg[6] == arg[8] and arg[4]~=new_id and flag==1 and flag_myp==1   then ---------------------���ƽ�Խ��ߡ�
		-- CALCULATE_FUNCTIONS_LUA_000160 = GetResString("CALCULATE_FUNCTIONS_LUA_000160")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000160)
		-- CALCULATE_FUNCTIONS_LUA_000160 = GetResString("CALCULATE_FUNCTIONS_LUA_000160")
		-- SynTigerString ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000160)
		-- AddMoney ( arg[1] , 0 , 10000 )--------1W����
		-- GiveItem ( arg[1] , 0 , 3096  , 1 , 4  )
		-- if arg[4] ~= 3360   then --------��ʯ
			-- if arg[4] == 845 or arg[4] == 846 or arg[4] == 847   then
				-- local s5=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[4]  , 1 , s5  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[4]  , 1 , 23  )
			-- end
		-- end
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[2] == arg[6] and arg[6] == arg[10] and arg[2]~=new_id and flag==1 and flag_myp==1   then ---------------------���׽�Խ��ߡ�
		-- CALCULATE_FUNCTIONS_LUA_000161 = GetResString("CALCULATE_FUNCTIONS_LUA_000161")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000161)
		-- CALCULATE_FUNCTIONS_LUA_000161 = GetResString("CALCULATE_FUNCTIONS_LUA_000161")
		-- SynTigerString  ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000161)
		-- AddMoney ( arg[1] , 0 , 10000 )--------1W����
		-- GiveItem ( arg[1] , 0 , 3094  , 1 , 4  )
		-- if arg[2] ~= 3360   then --------��ʯ
			-- if arg[2] == 845 or arg[2] == 846 or arg[2] == 847   then
				-- local s6=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , s6  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			-- end
		-- end
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[5] == arg[6] and arg[6] == arg[7] and arg[5]~=new_id and flag==1 and flag_myp==1   then ---------------------��һ�����족
		-- CALCULATE_FUNCTIONS_LUA_000162 = GetResString("CALCULATE_FUNCTIONS_LUA_000162")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000162)
		-- CALCULATE_FUNCTIONS_LUA_000162 = GetResString("CALCULATE_FUNCTIONS_LUA_000162")
		-- SynTigerString ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000162)
		-- AddMoney ( arg[1] , 0 , 8000 )--------8k����
		-- if arg[5] ~= 3360   then --------��ʯ
			-- if arg[5] == 845 or arg[5] == 846 or arg[5] == 847   then
				-- local s4=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[5]  , 1 , s4  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[5]  , 1 , 23  )
			-- end
		-- end
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[2] == arg[5] and arg[5] == arg[8] and arg[11]==1 and arg[2]~=new_id and flag_myp==1   then ---------------------��һ����˳��
		-- CALCULATE_FUNCTIONS_LUA_000163 = GetResString("CALCULATE_FUNCTIONS_LUA_000163")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000163)
		-- CALCULATE_FUNCTIONS_LUA_000163 = GetResString("CALCULATE_FUNCTIONS_LUA_000163")
		-- SynTigerString( arg[1] ,CALCULATE_FUNCTIONS_LUA_000163)
		-- AddMoney ( arg[1] , 0 , 2000 )--------2k����
		-- if arg[2] ~= 3360   then --------��ʯ
			-- if arg[2] == 845 or arg[2] == 846 or arg[2] == 847   then
				-- local s1=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 ,arg[2]  , 1 , s1  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			-- end
		-- end
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[3] == arg[6] and arg[6] == arg[9] and arg[12]==1 and arg[3]~=new_id and flag_myp==1   then
		-- CALCULATE_FUNCTIONS_LUA_000163 = GetResString("CALCULATE_FUNCTIONS_LUA_000163")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000163)
		-- CALCULATE_FUNCTIONS_LUA_000163 = GetResString("CALCULATE_FUNCTIONS_LUA_000163")
		-- SynTigerString( arg[1] ,CALCULATE_FUNCTIONS_LUA_000163)
		-- AddMoney ( arg[1] , 0 , 2000 )--------2k����
		-- if arg[3] ~= 3360   then --------��ʯ
			-- if arg[3] == 845 or arg[3] == 846 or arg[3] == 847   then
				-- local s2=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[3]  , 1 , s2  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[3]  , 1 , 23  )
			-- end
		-- end	
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- if arg[4] == arg[7] and arg[7] == arg[10] and arg[13]==1 and arg[4]~=new_id and flag_myp==1   then
		-- CALCULATE_FUNCTIONS_LUA_000163 = GetResString("CALCULATE_FUNCTIONS_LUA_000163")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000163)
		-- CALCULATE_FUNCTIONS_LUA_000163 = GetResString("CALCULATE_FUNCTIONS_LUA_000163")
		-- SynTigerString( arg[1] ,CALCULATE_FUNCTIONS_LUA_000163)
		-- AddMoney ( arg[1] , 0 , 2000 )--------2k����
		-- if arg[4] ~= 3360   then --------��ʯ
			-- if arg[4] == 845 or arg[4] == 846 or arg[4] == 847   then
				-- local s3=math.random ( 12 , 18 )
				-- GiveItem ( arg[1] , 0 , arg[4]  , 1 , s3  )
				--Heilong_Star_Count=1
			-- else 
				-- GiveItem ( arg[1] , 0 , arg[4]  , 1 , 23  )
			-- end
		-- end
		-- local cha_name1 = GetChaDefaultName ( arg[1] ) 
		-- LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	-- end
	-- local star = 0
	-- local eleven = 0
	-- for star=2,8,3 do
		-- if arg[star] ==194 and arg[11] == 1 and flag_myp==1   then
			-- eleven =eleven +1
		-- end
	-- end
	-- for star=3,9,3 do
		-- if arg[star] ==194 and arg[12] == 1 and flag_myp==1   then
			-- eleven =eleven +1
		-- end
	-- end
	-- for star=4,10,3 do
		-- if arg[star] ==194 and arg[13] == 1 and flag_myp==1   then
			-- eleven =eleven +1
		-- end
	-- end
	-- if eleven==0   then
		-- CALCULATE_FUNCTIONS_LUA_000164 = GetResString("CALCULATE_FUNCTIONS_LUA_000164")
		-- SynTigerString( arg[1] ,CALCULATE_FUNCTIONS_LUA_000164)
	-- else 
		-- CALCULATE_FUNCTIONS_LUA_000165 = GetResString("CALCULATE_FUNCTIONS_LUA_000165")
		-- CALCULATE_FUNCTIONS_LUA_000166 = GetResString("CALCULATE_FUNCTIONS_LUA_000166")
		-- CALCULATE_FUNCTIONS_LUA_000167 = GetResString("CALCULATE_FUNCTIONS_LUA_000167")
		-- SystemNotice ( arg[1] ,CALCULATE_FUNCTIONS_LUA_000167..eleven..CALCULATE_FUNCTIONS_LUA_000166..eleven..CALCULATE_FUNCTIONS_LUA_000165)
		-- CALCULATE_FUNCTIONS_LUA_000165 = GetResString("CALCULATE_FUNCTIONS_LUA_000165")
		-- CALCULATE_FUNCTIONS_LUA_000168 = GetResString("CALCULATE_FUNCTIONS_LUA_000168")
		-- SynTigerString( arg[1] ,CALCULATE_FUNCTIONS_LUA_000168..eleven..CALCULATE_FUNCTIONS_LUA_000165)
		-- GiveItem ( arg[1] , 0 , 854  , eleven , 4  )
	-- end
-- end
--function Change_FightingBook (character, npc)
--	local HonorBook_Num = 0
--	local HonorBook_Num = CheckBagItem( character,3849 )
--	local FightingBook_Num = 0
--	local FightingBook_Num = CheckBagItem( character,3849 )
--	local retbag = HasLeaveBagGrid( character, 1)
--	if retbag ~= LUA_TRUE   then
--		SystemNotice(character,"�����ո�����1���޷�����Ҷ�����")
--		return 
--	end	
--	if FightingBook_Num> 0   then
--		SystemNotice( character , "���Ѿ����Ҷ�������")
--		return 0
--	end
--	
--	
--	
--	if	 HonorBook_Num <= 0   then
--		GiveItem ( character , 0 , 3849  , 1 , 97 )
--	else
--		GiveItem ( character , 0 , 3849  , 1 , 97 )
--		local Book2 =  GetChaItem2 ( character , 2 , 3849 )
--		local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
--		local KillNum=GetItemAttr ( Book2 , ITEMATTR_VAL_AGI)
--		local KilledNum=GetItemAttr ( Book2 , ITEMATTR_VAL_DEX)
--		local JionNum=GetItemAttr ( Book2 , ITEMATTR_VAL_CON)
--		local VictoryNum=GetItemAttr ( Book2 , ITEMATTR_VAL_STA)
--		local PartyContributeNum=GetItemAttr ( Book2 , ITEMATTR_MAXURE)
--		local Book = GetChaItem2 ( character , 2 , 3849 )
--		SetItemAttr ( Book , ITEMATTR_VAL_STR,HonorPoint)
--		SetItemAttr ( Book , ITEMATTR_VAL_AGI,KillNum)
--		SetItemAttr ( Book , ITEMATTR_VAL_DEX,KilledNum)
--		SetItemAttr ( Book , ITEMATTR_VAL_CON,JionNum)
--		SetItemAttr ( Book , ITEMATTR_VAL_STA,VictoryNum)
--		SetItemAttr ( Book , ITEMATTR_MAXURE,PartyContributeNum)
----		SetItemAttr ( Book2 , ITEMATTR_MAXENERGY,FightingPoint)
--		RemoveChaItem ( character , 3849 , 1 , 2 , -1, 2 , 1  )	
--		
--	end
--end

function Change_shanyao (character, npc)
	local NocLock =	KitbagLock( character, 0 )
		if NocLock == LUA_FALSE   then
		CALCULATE_FUNCTIONS_LUA_000144 = GetResString("CALCULATE_FUNCTIONS_LUA_000144")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000144)
		return 0
	end
		 
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( character,3849 )
		if HonorBook_Num < 1   then
		CALCULATE_FUNCTIONS_LUA_000169 = GetResString("CALCULATE_FUNCTIONS_LUA_000169")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000169)
		return 0
		end
	local Book2 =  GetChaItem2 ( character , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
		if HonorPoint < 200   then
			CALCULATE_FUNCTIONS_LUA_000170 = GetResString("CALCULATE_FUNCTIONS_LUA_000170")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000170)
			return 0
		end
	local HonorPoint_X=HonorPoint-200
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	local Item_CanGet = GetChaFreeBagGridNum ( character )
		
		if Item_CanGet <= 0   then
			CALCULATE_FUNCTIONS_LUA_000171 = GetResString("CALCULATE_FUNCTIONS_LUA_000171")
			SystemNotice(character ,CALCULATE_FUNCTIONS_LUA_000171)
			UseItemFailed ( character )
			return
		end
	GiveItem ( character , 0 , 2614  , 1 , 4 ) 
end

function Change_rongyao (character, npc)
local NocLock =	KitbagLock( character, 0 )
		if NocLock == LUA_FALSE   then
		CALCULATE_FUNCTIONS_LUA_000144 = GetResString("CALCULATE_FUNCTIONS_LUA_000144")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000144)
		return 0
	end
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( character,3849 )
		if HonorBook_Num < 1   then
		CALCULATE_FUNCTIONS_LUA_000169 = GetResString("CALCULATE_FUNCTIONS_LUA_000169")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000169)
		return 0
		end
	local Book2 =  GetChaItem2 ( character , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
		if HonorPoint < 2000   then
			CALCULATE_FUNCTIONS_LUA_000170 = GetResString("CALCULATE_FUNCTIONS_LUA_000170")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000170)
			return 0
		end
	local HonorPoint_X=HonorPoint-2000
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	local Item_CanGet = GetChaFreeBagGridNum ( character )
		
		if Item_CanGet <= 0   then
			CALCULATE_FUNCTIONS_LUA_000171 = GetResString("CALCULATE_FUNCTIONS_LUA_000171")
			SystemNotice(character ,CALCULATE_FUNCTIONS_LUA_000171)
			UseItemFailed ( character )
			return
		end
	GiveItem ( character , 0 , 2615  , 1 , 4 )
end

function Change_huihuang (character, npc)
	local NocLock =	KitbagLock( character, 0 )
		if NocLock == LUA_FALSE   then
		CALCULATE_FUNCTIONS_LUA_000144 = GetResString("CALCULATE_FUNCTIONS_LUA_000144")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000144)
		return 0
	end
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( character,3849 )
		if HonorBook_Num < 1   then
		CALCULATE_FUNCTIONS_LUA_000169 = GetResString("CALCULATE_FUNCTIONS_LUA_000169")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000169)
		return 0
		end
	local Book2 =  GetChaItem2 ( character , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
		if HonorPoint < 20000   then
			CALCULATE_FUNCTIONS_LUA_000170 = GetResString("CALCULATE_FUNCTIONS_LUA_000170")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000170)
			return 0
		end
	local HonorPoint_X=HonorPoint-20000
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	local Item_CanGet = GetChaFreeBagGridNum ( character )
		
		if Item_CanGet <= 0   then
			CALCULATE_FUNCTIONS_LUA_000171 = GetResString("CALCULATE_FUNCTIONS_LUA_000171")
			SystemNotice(character ,CALCULATE_FUNCTIONS_LUA_000171)
			UseItemFailed ( character )
			return
		end
	GiveItem ( character , 0 , 2616  , 1 , 4 )
end
function Eleven_Log_0( role ) 
	local cha_name = GetChaDefaultName ( role ) 
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	LG( "Eleven_Log_0" ,cha_name,lv,job)
end
function Eleven_Log( role,typ ) 
	local cha_name = GetChaDefaultName ( role ) 
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	LG( "Eleven_Log" ,cha_name,lv,job,typ)
end
-------------------------------------------------------------------------------------
--				Leo�ķ���Ҵ��⽱��
-------------------------------------------------------------------------------------
function WGPrizeBegin( role , rightCount)
	local rightCountTemp = rightCount
	if rightCountTemp > 6   then
		rightCountTemp = 6
	end
	
	local isPrizeRandom = math.random(rightCountTemp,10)
	local retRandom = math.random ( 1 , 100 )
	local ret  = 1
	
	if isPrizeRandom > 5    then
		if math.fmod ( retRandom , 6 ) == 0   then
			 ret = WGprize_1(role)
		end
		
		if math.fmod ( retRandom , 6 ) == 1    then
			 ret = WGprize_2(role)
		end
		
		if math.fmod ( retRandom , 6 ) == 2    then
			 ret = WGprize_3(role)
		end
		
		if math.fmod ( retRandom , 6 ) == 3    then
			 ret = WGprize_4(role)
		end
		
		if math.fmod ( retRandom , 6 ) == 4    then
			 ret = WGprize_5(role)
		end
		
		if math.fmod ( retRandom , 6 ) == 5    then
			 ret = WGprize_6(role)
		end
		
		if ret ==1   then
			CALCULATE_FUNCTIONS_LUA_000172 = GetResString("CALCULATE_FUNCTIONS_LUA_000172")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000172)
		end
	else
		CALCULATE_FUNCTIONS_LUA_000173 = GetResString("CALCULATE_FUNCTIONS_LUA_000173")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000173 )
	end
end
function WGprize_1( role ) --�Ӿ��� LV * 10
	local expNow = GetChaAttr( role , ATTR_CEXP )
	local lvNow = GetChaAttr( role , ATTR_LV)
	
	CALCULATE_FUNCTIONS_LUA_000174 = GetResString("CALCULATE_FUNCTIONS_LUA_000174")
	CALCULATE_FUNCTIONS_LUA_000175 = GetResString("CALCULATE_FUNCTIONS_LUA_000175")
	SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000175 .. lvNow*10 .. CALCULATE_FUNCTIONS_LUA_000174)
	SetChaAttrI(  role , ATTR_CEXP ,expNow+lvNow*10  )
	RefreshCha(role)
	return 0
end

function WGprize_2( role ) --����ǰѪ����
	local bloodMaxNow = GetChaAttr( role , ATTR_MXHP)
	CALCULATE_FUNCTIONS_LUA_000176 = GetResString("CALCULATE_FUNCTIONS_LUA_000176")
	SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000176)
	SetChaAttrI( role , ATTR_HP ,bloodMaxNow  )
	RefreshCha(role)
	return 0
end

function WGprize_3(role) --����ǰ������
	local SPMaxNow = GetChaAttr( role , ATTR_MXSP)
	CALCULATE_FUNCTIONS_LUA_000177 = GetResString("CALCULATE_FUNCTIONS_LUA_000177")
	SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000177)
	SetChaAttrI( role , ATTR_SP, SPMaxNow  )
	RefreshCha(role)
	return 0
end

function WGprize_4(role) --����LV*1������
	local lvNow = GetChaAttr( role , ATTR_LV)
	CALCULATE_FUNCTIONS_LUA_000178 = GetResString("CALCULATE_FUNCTIONS_LUA_000178")
	CALCULATE_FUNCTIONS_LUA_000175 = GetResString("CALCULATE_FUNCTIONS_LUA_000175")
	SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000175 .. lvNow .. CALCULATE_FUNCTIONS_LUA_000178)
	
	GiveItem( role , 0 , 1849  , lvNow , 4 )	
	return 0
end

function WGprize_5(role) --���ɽ���1��
	CALCULATE_FUNCTIONS_LUA_000179 = GetResString("CALCULATE_FUNCTIONS_LUA_000179")
	SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000179)
	
	GiveItem( role , 0 , 3141  , 1 , 4 )	
	return 0
end

function WGprize_6(role) --Ѫ��ȫ��
	local bloodMaxNow = GetChaAttr( role , ATTR_MXHP)
	local SPMaxNow = GetChaAttr( role , ATTR_MXSP)
	
	CALCULATE_FUNCTIONS_LUA_000180 = GetResString("CALCULATE_FUNCTIONS_LUA_000180")
	SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000180)
	
	SetChaAttrI( role , ATTR_HP ,bloodMaxNow  )
	SetChaAttrI( role , ATTR_SP ,SPMaxNow  )
	RefreshCha(role)
	return 0
end

--Leo�Ķһ����
function Can_Exchange(sSrcItem,sSrcNum,sTagItem,sTagNum)
	local Data
	for Data in pairs(ChangeItemList) do
		 if ChangeItemList[Data][1] == sSrcItem and  ChangeItemList[Data][2] == sSrcNum and ChangeItemList[Data][3] == sTagItem and ChangeItemList[Data][4] == sTagNum then
			return LUA_TRUE
		 end
	end
	return LUA_FALSE
end


function CheckTeam1 ( role , value )
	local player = {}
	player[1] = role
	player[2] = GetTeamCha( role , 0 )
	player[3] = GetTeamCha( role , 1 )
	player[4] = GetTeamCha( role , 2 )
	player[5] = GetTeamCha( role , 3 )

	local n = 0

	for j = 0 , 5 , 1 do	
		if ValidCha( player[j] )== 1    then					--��������Ӿ������Ľ�ɫ�������
			n = n+1
		end
	end
	if n >= value   then
		return LUA_TRUE
	end
end

function SetTestTime ( role )
	local i = CheckBagItem( role,579 )
	local now_month= os.date("%m")		-------------��
	local now_day= os.date("%d")		-------------��
	local now_hour= os.date("%H")		-------------ʱ
	local now_miniute= os.date("%M")	-------------��
	local now_second=  os.date("%S")		-------------��
	now_month= tonumber(now_month)		-------------��     
	now_day= tonumber(now_day)			-------------��     
	now_hour= tonumber(now_hour)			-------------ʱ     
	now_miniute= tonumber(now_miniute)	 	-------------��     
	now_second= tonumber(now_second)		-------------��
--	SystemNotice( role , "֤������Ϊ"..i)
--	SystemNotice( role , "����ʱ��Ϊ"..now_month.."��"..now_day.."��"..now_hour.."ʱ"..now_miniute.."��"..now_second.."��")
	if i==1   then
		local Item = GetChaItem2 ( role , 2 , 579 )
		SetItemAttr(Item, ITEMATTR_VAL_STA, now_month )		-------------�� 	
		SetItemAttr(Item, ITEMATTR_VAL_STR, now_day )		-------------��  
		SetItemAttr(Item, ITEMATTR_VAL_CON, now_hour )		-------------ʱ   
		SetItemAttr(Item, ITEMATTR_VAL_DEX, now_miniute )		-------------��   
		SetItemAttr(Item, ITEMATTR_VAL_AGI, now_second )		-------------��
		SetItemAttr(Item, ITEMATTR_MAXENERGY, 0)
		SynChaKitbag(role,13)
		return LUA_TRUE
	end
end

function RenewTestTime1 ( role )
	local i = CheckBagItem( role,579 )
	local now_month= os.date("%m")		-------------��
	local now_day= os.date("%d")		-------------��
	local now_hour= os.date("%H")		-------------ʱ
	local now_miniute= os.date("%M")	-------------��
	local now_second=  os.date("%S")		-------------��
	now_month= tonumber(now_month)		-------------��     
	now_day= tonumber(now_day)			-------------��     
	now_hour= tonumber(now_hour)			-------------ʱ     
	now_miniute= tonumber(now_miniute)	 	-------------��     
	now_second= tonumber(now_second)		-------------�� 
--	SystemNotice( role , "֤������Ϊ"..i)
--	SystemNotice( role , "����ʱ��Ϊ"..now_month.."��"..now_day.."��"..now_hour.."ʱ"..now_miniute.."��"..now_second.."��")
	if i==1   then
		local Item = GetChaItem2 ( role , 2 , 579 )
--		SystemNotice( role , "1")
		local n = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
--		SystemNotice( role , "ԭn="..n)
		local old_month = GetItemAttr ( Item, ITEMATTR_VAL_STA )
		local old_day = GetItemAttr ( Item, ITEMATTR_VAL_STR )
		local old_hour = GetItemAttr ( Item, ITEMATTR_VAL_CON )
--		SystemNotice( role , "ԭmonth="..old_month)
--		SystemNotice( role , "ԭday="..old_day)
--		SystemNotice( role , "ԭhour="..old_hour)
		local old_miniute = GetItemAttr ( Item, ITEMATTR_VAL_DEX )
		local old_second = GetItemAttr ( Item, ITEMATTR_VAL_AGI )
--		SystemNotice( role , "ԭminiute="..old_miniute)
--		SystemNotice( role , "ԭsecond="..old_second)
		local used_time=(now_second - old_second)+(now_miniute - old_miniute)*60+(now_hour - old_hour)*3600+(now_day - old_day)*86400+(now_month - old_month)*259200
--		SystemNotice( role , "����ʱ��Ϊ"..used_time)
		if used_time <= 30   then
			n = n + 1
		end
--		SystemNotice( role , "��Դ���Ϊ"..n)
		SetItemAttr(Item, ITEMATTR_VAL_STA, now_month )		-------------�� 	
		SetItemAttr(Item, ITEMATTR_VAL_STR, now_day )		-------------��  
		SetItemAttr(Item, ITEMATTR_VAL_CON, now_hour )		-------------ʱ   
		SetItemAttr(Item, ITEMATTR_VAL_DEX, now_miniute )		-------------��   
		SetItemAttr(Item, ITEMATTR_VAL_AGI, now_second )		-------------��
		SetItemAttr(Item, ITEMATTR_MAXENERGY, n)
		SynChaKitbag(role,13)
		return LUA_TRUE
	end
end

function RenewTestTime2 ( role )
	local i = CheckBagItem( role,579 )
	local now_month= os.date("%m")		-------------��
	local now_day= os.date("%d")		-------------��
	local now_hour= os.date("%H")		-------------ʱ
	local now_miniute= os.date("%M")	-------------��
	local now_second=  os.date("%S")		-------------��
	now_month= tonumber(now_month)		-------------��     
	now_day= tonumber(now_day)			-------------��     
	now_hour= tonumber(now_hour)			-------------ʱ     
	now_miniute= tonumber(now_miniute)	 	-------------��     
	now_second= tonumber(now_second)		-------------��     
	if i==1   then
		local Item = GetChaItem2 ( role , 2 , 579 )
		SetItemAttr(Item, ITEMATTR_VAL_STA, now_month )		-------------�� 	
		SetItemAttr(Item, ITEMATTR_VAL_STR, now_day )		-------------��  
		SetItemAttr(Item, ITEMATTR_VAL_CON, now_hour )		-------------ʱ   
		SetItemAttr(Item, ITEMATTR_VAL_DEX, now_miniute )		-------------��   
		SetItemAttr(Item, ITEMATTR_VAL_AGI, now_second )		-------------��
		return LUA_TRUE
	end
end


function CheckRightNum ( role )
	local i = CheckBagItem( role,579 )
	if i==1   then
		local Item = GetChaItem2 ( role , 2 , 579 )
		local n = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
		if n == 8   then
			return LUA_TRUE
		end
	end
end

function CheckErroNum ( role )
	local i = CheckBagItem( role,579 )
	if i==1   then
		local Item = GetChaItem2 ( role , 2 , 579 )
		local n = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
		if n < 8   then
			return LUA_TRUE
		end
	end
end

function CheckRealNpc ( role , value )
	local now_hour= os.date("%H")		-------------ʱ
	now_hour= tonumber(now_hour)			-------------ʱ 
	local n = ( now_hour/4 - math.floor ( now_hour/4 )) * 4
	if n == value   then
		return LUA_TRUE
	else
		CALCULATE_FUNCTIONS_LUA_000181 = GetResString("CALCULATE_FUNCTIONS_LUA_000181")
		SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000181)
	end
end

---------------------------------------------------kokora--------------------------------------------------

---------------------------------------------------����ʮ�´�բз�֮����7200�;�ֵ��з��
function Givecrab( character  )	
	local c1=0
	local c2=0
	c1,c2 =MakeItem(character, 58, 1, 4)			--value���ǵ���ID   C2�Ƿ��صĴ�������λ�ñ��
	local Item_CRAB = GetChaItem ( character , 2 , c2 )			--�ӽ�ɫ�ı���λ 2 ȡλ�� C2�ĵ��ߵ�ָ��
	
	local CRAB_NOW = 7200                                                                              
	
	SetItemAttr(Item_CRAB, ITEMATTR_MAXENERGY, CRAB_NOW)						--��������;�
	SetItemAttr(Item_CRAB, ITEMATTR_ENERGY, CRAB_NOW)								 --���õ�ǰ�;ã���ֵ��ÿ���Ӻ���һ��
	RefreshCha( character )
	CALCULATE_FUNCTIONS_LUA_000182 = GetResString("CALCULATE_FUNCTIONS_LUA_000182")
	SystemNotice (character , CALCULATE_FUNCTIONS_LUA_000182 )
end


---------------------------------------------------����ʮ�´�բз�֮�ж�з���;��Ƿ�Ϊ0
function crablife( character )
	local Crab_Num = 0
	Crab_Num = CheckBagItem(  character , 58 )		--��鱳����58�ŵ��ߵ�����
	
	if Crab_Num == 1   then				--���58�ŵ��ߵ��������ڵ���1
		local crab = GetChaItem2 (  character , 2 , 58 )			--ȡ����ɫ�����ڵ���IDΪ58�ĵ��ߵ�ָ��
		local ENERGY = GetItemAttr(crab, ITEMATTR_ENERGY)
		if ENERGY ==0   then
			return LUA_TRUE
		end
	else
		CALCULATE_FUNCTIONS_LUA_000183 = GetResString("CALCULATE_FUNCTIONS_LUA_000183")
		SystemNotice( character, CALCULATE_FUNCTIONS_LUA_000183)
	end

end

---------------------------------------------------kokora--------------------------------------------------

--�������̸�����

function GiveZNZItem ( role )
		CALCULATE_FUNCTIONS_LUA_000184 = GetResString("CALCULATE_FUNCTIONS_LUA_000184")
		SystemNotice(role ,CALCULATE_FUNCTIONS_LUA_000184)
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 10000 )
	--SystemNotice(role ,"star=="..star)
	if star<=8900   then
		GiveItem ( role , 0 , 2999  , 1 , 4  )
	elseif star>=8901 and star<=9500   then
		local el = math.random ( 1, 6 )
		if el==1   then
			GiveItem ( role , 0 , 3111  , 1 , 4 )
		elseif el==2   then
			GiveItem ( role , 0 , 3109  , 1 , 4 )
		elseif el==3   then
			GiveItem ( role , 0 , 3110  , 1 , 4 )
		elseif el==4   then
			GiveItem ( role , 0 , 3112  , 1 , 4 )
		elseif el==5   then
			GiveItem ( role , 0 , 3113  , 1 , 4 )
		elseif el==6    then
			GiveItem ( role , 0 , 0992  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000185 = GetResString("CALCULATE_FUNCTIONS_LUA_000185")
			local message5 = cha_name..CALCULATE_FUNCTIONS_LUA_000185 
			Notice ( message5 )
		end


	elseif star>=9501 and star<=9920   then
		local el1= math.random ( 1, 7 )
		if el1==1    then
			GiveItem ( role , 0 , 0863  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000186 = GetResString("CALCULATE_FUNCTIONS_LUA_000186")
			local message = cha_name..CALCULATE_FUNCTIONS_LUA_000186 
			Notice ( message )
		elseif el1==2   then
			GiveItem ( role , 0 , 0860  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000187 = GetResString("CALCULATE_FUNCTIONS_LUA_000187")
			local message1 = cha_name..CALCULATE_FUNCTIONS_LUA_000187 
			Notice ( message1 )
		elseif el1==3   then
			GiveItem ( role , 0 , 0861  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000188 = GetResString("CALCULATE_FUNCTIONS_LUA_000188")
			local message2 = cha_name..CALCULATE_FUNCTIONS_LUA_000188 
			Notice ( message2 )
		elseif el1==4   then
			GiveItem ( role , 0 , 0862  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000189 = GetResString("CALCULATE_FUNCTIONS_LUA_000189")
			local message3 = cha_name..CALCULATE_FUNCTIONS_LUA_000189 
			Notice ( message3 )
		elseif el1==5   then
			GiveItem ( role , 0 , 3457  , 3 , 4 )
			CALCULATE_FUNCTIONS_LUA_000190 = GetResString("CALCULATE_FUNCTIONS_LUA_000190")
			local message4 = cha_name..CALCULATE_FUNCTIONS_LUA_000190 
			Notice ( message4 )
		elseif el1==6   then
			GiveItem ( role , 0 , 0853  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000191 = GetResString("CALCULATE_FUNCTIONS_LUA_000191")
			local message6 = cha_name..CALCULATE_FUNCTIONS_LUA_000191 
			Notice ( message6 )
		elseif el1==7   then
			GiveItem ( role , 0 , 1012  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000192 = GetResString("CALCULATE_FUNCTIONS_LUA_000192")
			local message7 = cha_name..CALCULATE_FUNCTIONS_LUA_000192 
			Notice ( message7 )
		end
	
	

	elseif star>=9920 and star<=10000   then
		local el3= math.random ( 1, 2 )
		if el3==1    then
			GiveItem ( role , 0 , 0096  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000193 = GetResString("CALCULATE_FUNCTIONS_LUA_000193")
			local message8= cha_name..CALCULATE_FUNCTIONS_LUA_000193 
			Notice ( message8 )
		elseif el3==2    then
			GiveItem ( role , 0 , 0094  , 1 , 4 )
			CALCULATE_FUNCTIONS_LUA_000194 = GetResString("CALCULATE_FUNCTIONS_LUA_000194")
			local message9 = cha_name..CALCULATE_FUNCTIONS_LUA_000194 
			Notice ( message9 )
		end
	end
end

-------------------------------------------------------------------------------------
--				Leo�Ķ���ϵͳ����   
-------------------------------------------------------------------------------------
--ѧ��֤���Զ�Ӧ
--ITEMATTR_FORGE                 ѧ�� ֵ��0��1��2��3��4 ��Ӧ   �׶�԰��Сѧ�����У����У���ѧ
--ITEMATTR_MAXENERGY            �����
--ITEMATTR_MAXURE          ���ѧ��
--ITEMATTR_ENERGY                     ��ǰ����
--ITEMATTR_URE                  ��ǰѧ��

--�鱾���Զ�Ӧ
--ITEMATTR_URE                          ��ǰ�;�
--ITEMATTR_MAXURE                  ����;�
---------------------------------------------------------------------------------
-- �����б�
-- Check_Skill_Rad( Skill_Level )                                              --ͨ�����ܵȼ�ȡ�ü��ܵľ���ӳ�ֵ
-- Check_Equip_Rad( Buff_Equip_ID )		                              --ͨ������ƷIDȡ�ø���Ʒ�ľ���ӳ�ֵ
--  Check_Item_Rad(role)															  --ͨ����ɫȡ�ӳɾ����״̬
-- Check_Exp_Increase( Book_ID )	                                          --ͨ����IDȡ���鱾�ľ�������ֵ
-- Add_BookEXP(role , Certificate , Book_ID , Skill_Level)    --��ѧ��֤����Ӿ���ĺ�������Reading_Book�е���
-- Take_BookDurability(role , Book)                                           --�۳�����װ��������;ú�������Reading_Book�е���
-- Reading_Book(role,Skill_Level)											   --             ������               ���麯�����������ڽ�ɫ�������״̬ʱ�ɷ�����ÿ��һ���ӵ���һ��
function Check_Skill_Rad( Skill_Level )			--ȡ�ü��ܵľ���ӳ�ֵ	
		local Skill_Rad												--LuaΪʲôû��switch!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		if Skill_Level == 2   then
			Skill_Rad = 0.05
		elseif Skill_Level == 3   then
			Skill_Rad = 0.10
		elseif Skill_Level == 4   then
			Skill_Rad = 0.15
		elseif Skill_Level == 5   then
			Skill_Rad = 0.2
		else
			Skill_Rad = 0
		end

		return Skill_Rad
end

function Check_Equip_Rad( Buff_Equip_ID )		--ȡ�ø���Ʒ�ľ���ӳ�ֵ
		local Equip_Rad
		if Buff_Equip_ID == 3285 then
			Equip_Rad = 0.05
		elseif Buff_Equip_ID == 3287   then
			Equip_Rad = 0.1
		else
			Equip_Rad = 0
		end
		
		return Equip_Rad
end

function Check_Item_Rad(role)							--ͨ����ɫȡ�ӳɾ����״̬
	local stateLV_Apple
	local Item_Rad
	
	stateLV_Apple = GetChaStateLv ( role , STATE_APPLE )		--ȡ�ǻ۹�״̬�ȼ�
	
	if stateLV_Apple == 1   then
		Item_Rad = 0.3

	elseif stateLV_Apple == 2   then
		Item_Rad = 0.5
	else
		Item_Rad = 0
	end
	
	return Item_Rad
end

function Check_Exp_Increase( Book_ID )		--ͨ��IDȡ���鱾�ľ�������ֵ
		local Book_ID_mod
		local Book_Exp_Increase
		
		--���ű���
		if Book_ID >= 3243 and Book_ID <= 3246   then            --δתְ   ����
				Book_Exp_Increase = 1
		elseif Book_ID >= 3247 and Book_ID <= 3250   then     --�м�
				Book_Exp_Increase = 3
		elseif Book_ID >= 3251 and Book_ID <= 3254   then     --�߼�
				Book_Exp_Increase =5
		elseif Book_ID >= 3255 and Book_ID <= 3260   then		--תְ  ����
				Book_Exp_Increase = 9
		elseif Book_ID >= 3261 and Book_ID <= 3266   then      --�м�
				Book_Exp_Increase = 13
		elseif Book_ID >= 3267 and Book_ID <= 3272   then       --�߼�
				Book_Exp_Increase = 18
		elseif Book_ID >= 3273 and Book_ID <= 3278   then       --ʵ�ü��ɴ�ȫ
				Book_Exp_Increase = 24
		else
				Book_Exp_Increase = 0
		end
		
		return Book_Exp_Increase
end

function Add_BookEXP(role , Certificate , Book_ID , Skill_Level)    --����������Ӿ���ĺ�������Reading_Book�е���
		
		local Role_Level
		local Buff_Equip
		local Buff_Equip_ID
		local Exp_Increase				--����ɳ���
		local Skill_Rad
		local Equip_Rad
		local Item_Rad
		local DoubleEffect
		
		Role_Level = Lv( role )
		Buff_Equip= GetChaItem ( role , 1 , 6 )                        --ȡ����װ��ָ��
		Buff_Equip_ID = GetItemID( Buff_Equip )
		
		Skill_Rad = Check_Skill_Rad(Skill_Level)					--ȡ���ܶԾ���ļӳ�ֵ
		Equip_Rad = Check_Equip_Rad(Buff_Equip_ID)		--ȡװ���Ծ���ļӳ�ֵ
		Item_Rad = Check_Item_Rad(role)								--ȡ��ɫ״̬�Ծ���ļӳ�ֵ
		Exp_Increase = Check_Exp_Increase( Book_ID )		--ȡ��������ֵ

		Exp_Increase = Exp_Increase * ( 1 + Skill_Rad + Equip_Rad + Item_Rad )		--��������
		
		--��ʼ�Ӿ���
		local Book_Exp_Now = GetItemAttr( Certificate , ITEMATTR_ENERGY )			--ȡ��ǰ����
		local Book_Exp_Max =  GetItemAttr( Certificate , ITEMATTR_MAXENERGY )	--ȡ���;���
		
		Book_Exp_Now = Book_Exp_Now + Exp_Increase
		
		if Book_Exp_Now >= Book_Exp_Max   then
			Book_Exp_Now = Book_Exp_Max
		end
		
		SetItemAttr ( Certificate , ITEMATTR_ENERGY , Book_Exp_Now )
end

function  Take_BookDurability(role , Book , Certificate)  --�۳�����װ�����;ú�������Reading_Book�е���
--		SystemNotice(role , "��ʼ�۳��鱾�;�")		
		
		local Durability_Reduce = 250					--�;ü�����
		local Book_Dur_Now = GetItemAttr( Book , ITEMATTR_URE )
		local Book_Dur_Max = GetItemAttr( Book , ITEMATTR_MAXURE )
		
		local Certificate_Exp_Now = GetItemAttr( Certificate , ITEMATTR_ENERGY )			--ȡѧ��֤��ǰ����
		local Certificate_Exp_Max =  GetItemAttr( Certificate , ITEMATTR_MAXENERGY )	--ȡѧ��֤���;���
		
		if Certificate_Exp_Now == Certificate_Exp_Max   then
			CALCULATE_FUNCTIONS_LUA_000195 = GetResString("CALCULATE_FUNCTIONS_LUA_000195")
			SystemNotice(role, CALCULATE_FUNCTIONS_LUA_000195)
			return 0
		end
		CALCULATE_FUNCTIONS_LUA_000196 = GetResString("CALCULATE_FUNCTIONS_LUA_000196")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000196)
		Book_Dur_Now =  Book_Dur_Now - Durability_Reduce
		
		if Book_Dur_Now <=0   then
			Book_Dur_Now = 0
		end
		
		SetItemAttr ( Book , ITEMATTR_URE , Book_Dur_Now )
end

function Reading_Book(role,Skill_Level)			--���麯�����������ڽ�ɫ�������״̬ʱ����
		--1������Ƿ���Զ��飬���ɶ����˳�����
		--2����Ƕ��鿪��Ϊ����״̬
		--3����ʼ�����������ۼƾ���
		--4����ʼ�����۳�����;�
--		SystemNotice( role , "��ʼ����" )
		
		local Book
		local Book_ID

		local Certificate
		local Certificate_ID
		
		Book = GetChaItem ( role , 1 , 9 )                        --ȡס��װ��ָ��
		Book_ID =  GetItemID( Book )           								   --ȡ��װ��ID

		Certificate = GetChaItem ( role , 1 , 5 )                --ȡ����װ��ָ��
		Certificate_ID = GetItemID( Certificate )                 --ȡ��װ��ID
		local Book_Dur = GetItemAttr( Book , ITEMATTR_URE )
		if Book_Dur > 0   then
			if  Certificate_ID == 3289   then							             	--���ID����ѧ��֤
				if  Book_ID >= 3243 and  Book_ID <= 3278   then
					Take_BookDurability( role , Book , Certificate)     --�۳����;�
					Add_BookEXP( role , Certificate , Book_ID,Skill_Level )	    --��ѧ��֤����Ӿ���
					Refreshcha( role )
				else
					CALCULATE_FUNCTIONS_LUA_000197 = GetResString("CALCULATE_FUNCTIONS_LUA_000197")
					SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000197)
				end
			else
				CALCULATE_FUNCTIONS_LUA_000198 = GetResString("CALCULATE_FUNCTIONS_LUA_000198")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000198)
			end
		else
			CALCULATE_FUNCTIONS_LUA_000199 = GetResString("CALCULATE_FUNCTIONS_LUA_000199")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000199)
		end
end

----ѧ�����ֵ
	Reading_Credit = {}
	Reading_Credit[0] = 150
	Reading_Credit[1] = 250
	Reading_Credit[2] = 400
	Reading_Credit[3] = 800
	Reading_Credit[4] = 4500	
	
----�������ֵ
	Reading_EXP = {}
	Reading_EXP[0] = 120
	Reading_EXP[1] = 700
	Reading_EXP[2] = 1700
	Reading_EXP[3] = 3000
	Reading_EXP[4] = 5000
	


-------���ѧ��֤�о����Ƿ����          --������
function CheckXSZExp( character )
	local xsz_num = 0
	xsz_num = CheckBagItem( character, 3289 )
	if xsz_num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000200 = GetResString("CALCULATE_FUNCTIONS_LUA_000200")
		SystemNotice ( character , CALCULATE_FUNCTIONS_LUA_000200)
		return 0
	end
	local role_xsz = GetChaItem2 ( character , 2 , 3289 )
	local exp_xsz = GetItemAttr ( role_xsz , ITEMATTR_ENERGY )
	local mexp_xsz = GetItemAttr ( role_xsz, ITEMATTR_MAXENERGY)
	-- SystemNotice( character , ""..exp_xsz)
	-- SystemNotice( character , ""..mexp_xsz)
	if exp_xsz == mexp_xsz   then
		return LUA_TRUE
	end

	return LUA_FALSE
end

------���ѧ��֤��ѧ���Ƿ����
function CheckXSZCh( character )
	local xsz_num = 0
	xsz_num = CheckBagItem( character, 3289 )
	if xsz_num ~= 1   then
			CALCULATE_FUNCTIONS_LUA_000200 = GetResString("CALCULATE_FUNCTIONS_LUA_000200")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000200)
			return 0
	end
	local role_xsz = GetChaItem2 ( character , 2 , 3289 )
	local ch_xsz = GetItemAttr ( role_xsz , ITEMATTR_URE )
	local mch_xsz = GetItemAttr ( role_xsz , ITEMATTR_MAXURE )
	if ch_xsz == mch_xsz   then
		return LUA_TRUE
	end
	
	return	LUA_FALSE
end

function ReadBookTime()					---------------�趨READINGBOOK�������ü��
--	Notice( "ʱ���趨")
	return 600*1000
end

function ReadBookSkillId()				--------------�趨READINGBOOK�������ܱ��
--	Notice( "���ܱ���趨")
	return 461
end

-------------------------------------------------------------------------------------
--				Leo  end
-------------------------------------------------------------------------------------
--������ʹ��֤�鲢��עʹ��ʱ��--------function


function AuctionEnd (role)
	local sc = CheckBagItem( role, 3025 )	                    -------------080317kokora change	
	if sc <=0   then
		CALCULATE_FUNCTIONS_LUA_000201 = GetResString("CALCULATE_FUNCTIONS_LUA_000201")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000201)
		return 0
	end
	--local s = DelBagItem ( role , 3025 , 1 ) 
	local item_number = CheckBagItem( role, 3066 )		
	if item_number >=1   then
		CALCULATE_FUNCTIONS_LUA_000202 = GetResString("CALCULATE_FUNCTIONS_LUA_000202")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000202)
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <2   then
		CALCULATE_FUNCTIONS_LUA_000203 = GetResString("CALCULATE_FUNCTIONS_LUA_000203")
		SystemNotice(role ,CALCULATE_FUNCTIONS_LUA_000203)
		return 0
	end
	GiveItem ( role , 0 , 3666 , 10 , 4) ---------------�α�����
	DelBagItem(role,3025,1)
	local r1=0
	local r2=0
	r1,r2 =MakeItem ( role , 3066  , 1 , 4 )
	local Item_new = GetChaItem ( role , 2 , r2 )
	
	----------��¼ʱ��
	
	local now_month= os.date("%m")		-------------��
	local now_day= os.date("%d")		-------------��
	local now_hour= os.date("%H")		-------------ʱ 
	local now_miniute= os.date("%M")	-------------��
	local now_day1= 0
	local now_month1= 0
	local now_hour1= 0
	local now_miniute1= 0
	    
	now_month= tonumber(now_month)		-------------��     
	now_day= tonumber(now_day)			-------------��    
	now_hour= tonumber(now_hour)		
	now_miniute= tonumber(now_miniute)
	local CheckDateNum = now_hour*100 +now_miniute

if CheckDateNum==1830    then 

	now_hour1= 18
	now_miniute1= 0
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12   then 
		 if now_day<=26   then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>26   then 
		    now_day1=(now_day+5)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11   then 
		 if now_day<=25   then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>25   then 
		    now_day1=(now_day+5)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2   then 
		 if now_day<=23   then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>23   then 
		    now_day1=(now_day+5)-28
		    now_month1=now_month+1
		    	
	         end 

	end
	
elseif CheckDateNum==1910    then 
	now_hour1= 20
	now_miniute1= 10	
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12   then 
		 if now_day<=26   then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>26   then 
		    now_day1=(now_day+5)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11   then 
		 if now_day<=25   then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>25   then 
		    now_day1=(now_day+5)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2   then 
		 if now_day<=23   then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>23   then 
		    now_day1=(now_day+5)-28
		    now_month1=now_month+1
	         end 
	end

elseif CheckDateNum==1950    then 
	now_hour1= 18
	now_miniute1= 0  
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12   then 
		 if now_day<=25   then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>25   then 
		    now_day1=(now_day+6)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11   then 
		 if now_day<=24   then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>24   then 
		    now_day1=(now_day+6)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2   then 
		 if now_day<=22   then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>22   then 
		    now_day1=(now_day+6)-28
		    now_month1=now_month+1
	         end 
	end

elseif CheckDateNum==2030    then 

	 now_hour1= 20
	 now_miniute1= 10
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12   then 
		 if now_day<=25   then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>25   then 
		    now_day1=(now_day+6)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11   then 
		 if now_day<=24   then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>24   then 
		    now_day1=(now_day+6)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2   then 
		 if now_day<=22   then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>22   then 
		    now_day1=(now_day+6)-28
		    now_month1=now_month+1
	         end 
	end

end
	--SystemNotice ( role , "now_month1=="..now_month1 )
	--SystemNotice ( role , "now_day1=="..now_day1 )
	--SystemNotice ( role , "now_hour1=="..now_hour1 )
	--SystemNotice ( role , "now_miniute1=="..now_miniute1 )
---------------------��עʱ��
	SetItemAttr(Item_new, ITEMATTR_VAL_STA, now_month1 )		-------------�� 	
	SetItemAttr(Item_new, ITEMATTR_VAL_STR, now_day1 )		-------------��  
	SetItemAttr(Item_new, ITEMATTR_VAL_CON, now_hour1 )		-------------ʱ 
	SetItemAttr(Item_new, ITEMATTR_VAL_DEX, now_miniute1 )		-------------��
	SynChaKitbag(role,13)
end

--------------�����ʸ�
function YORN (role)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <2   then
		CALCULATE_FUNCTIONS_LUA_000203 = GetResString("CALCULATE_FUNCTIONS_LUA_000203")
		SystemNotice(role ,CALCULATE_FUNCTIONS_LUA_000203)
		return  0
	end

	local item_number1 = CheckBagItem( role, 3066 )		
	if item_number1 >=1   then
		CALCULATE_FUNCTIONS_LUA_000202 = GetResString("CALCULATE_FUNCTIONS_LUA_000202")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000202)
		return 0
	end
	
	local item_number2 = CheckBagItem( role, 3078 )		
	if item_number2 >=1   then
		CALCULATE_FUNCTIONS_LUA_000204 = GetResString("CALCULATE_FUNCTIONS_LUA_000204")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000204)
		return  0
	end
	
	local item_number3 = CheckBagItem( role, 3025 )		
	if item_number3 <1   then
		CALCULATE_FUNCTIONS_LUA_000205 = GetResString("CALCULATE_FUNCTIONS_LUA_000205")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000205)
		return  0
	end
	 return  1
end

----���ѧ��֤����������0
function HasReadExp( role )
		local xsz_num = 0
	xsz_num = CheckBagItem(  role, 3289 )
	if xsz_num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000200 = GetResString("CALCULATE_FUNCTIONS_LUA_000200")
		SystemNotice (  role , CALCULATE_FUNCTIONS_LUA_000200)
		return 0
	end
	local role_xsz = GetChaItem2 (  role , 2 , 3289 )
	local exp_xsz = GetItemAttr ( role_xsz , ITEMATTR_ENERGY )
	
	if exp_xsz > 0   then
		return LUA_TRUE
	end
	
	return LUA_FALSE
end

---------------����Ӳ�ұ���
function GiveBragiItem ( role , value )
	local pinzhi = 0
	local ChaName = GetChaDefaultName ( role )
	local a = math.random ( 1 , 100000000 )
	--SystemNotice ( role , "RP="..a)
--	if a >= 1 and a <= 14   then							----��75BOSSװ
--		local Item_Id = a + 2330
--		local Item_Name = GetItemName ( Item_Id )
--		GiveItem ( role , 0 , Item_Id , 1 , 4 )
--		Notice ( "��ϲ"..ChaName.."�򿪾���Ӳ�ұ��䣬��Ʒ���������"..Item_Name)
--		LG ( "JLYBBOX" , "���"..ChaName.."��������Ӳ�ұ���õ�"..Item_Name)
--	elseif a >= 15 and a <= 33   then							-----��75BOSSװ
--		local Item_Id = a + 2802
--		local Item_Name = GetItemName ( Item_Id )
--		GiveItem ( role , 0 , Item_Id , 1 , 4 )
--		Notice ( "��ϲ"..ChaName.."�򿪾���Ӳ�ұ��䣬��Ʒ���������"..Item_Name)
--		LG ( "JLYBBOX" , "���"..ChaName.."��������Ӳ�ұ���õ�"..Item_Name)
	if a >= 1 and a <= 10000000   then						------��0.1%����
		XSAddExpAll ( role , 1, 1, 2 )
	elseif a >= 10000001 and a <= 12200000   then					------��0.2%����
		XSAddExpAll ( role , 2, 2, 2 )
	elseif a >= 12200001 and a <= 42200000   then					------��Ǯ
		--SystemNotice ( role , "����")
--		local minval = value 
--		local maxval = value * 10
--		--SystemNotice ( role , "��СΪ"..minval.."���Ϊ"..maxval)
--		local b = math.random ( minval , maxval )
--		--SystemNotice ( role , "��Ǯ"..b)
--		local Money_Add = b * 10000
--		AddMoney ( role , 0 , Money_Add )
	
		AddMoney ( role , 0 , 30000 )
		
	elseif a >= 42200001 and a <= 62200000   then					------10�������ָ�ҩ��
		GiveItem ( role , 0 , 3848 , 10 , 4 )
	elseif a >= 62200001 and a <= 65500000   then					------������װ��
		local c = math.random ( 1 , 35 )
		if c >= 1 and c <= 33   then
			local Item_Id = c + 3301
			GiveItem ( role , 0 , Item_Id , 1 , 4 )
		else
			local Item_Id = c + 54
			GiveItem ( role , 0 , Item_Id , 1 , 4 )
		end
	elseif a >= 65500001 and a <= 67500000   then					------3��ǿЧ�����ָ���3��SP����ˮ
		GiveItem ( role , 0 , 3098 , 3 , 4 )
		GiveItem ( role , 0 , 3099 , 3 , 4 )
	elseif a >= 67500001 and a <= 87500000   then					------��Ʊ
		local d = math.random ( 1 , 16 )
		if d == 1   then 
			GiveItem ( role , 0 , 3056 , 3 , 4 )
		elseif d == 2   then
			GiveItem ( role , 0 , 3057 , 3 , 4 )
		elseif d == 3   then
			GiveItem ( role , 0 , 3058 , 3 , 4 )
		elseif d == 4   then
			GiveItem ( role , 0 , 3059 , 3 , 4 )
		elseif d == 5   then
			GiveItem ( role , 0 , 3060 , 3 , 4 )
		elseif d == 6   then
			GiveItem ( role , 0 , 3050 , 3 , 4 )
		elseif d == 7   then
			GiveItem ( role , 0 , 3051 , 3 , 4 )
		elseif d == 8   then
			GiveItem ( role , 0 , 3052 , 3 , 4 )
		elseif d == 9   then
			GiveItem ( role , 0 , 3053 , 3 , 4 )
		elseif d == 10   then
			GiveItem ( role , 0 , 3048 , 3 , 4 )
		elseif d == 11   then
			GiveItem ( role , 0 , 332 , 3 , 4 )
		elseif d == 12   then
			GiveItem ( role , 0 , 563 , 3 , 4 )
		elseif d == 13   then
			GiveItem ( role , 0 , 583 , 3 , 4 )
		elseif d == 14   then
			GiveItem ( role , 0 , 2447 , 3 , 4 )
		elseif d == 15   then
			GiveItem ( role , 0 , 2491 , 3 , 4 )
		elseif d == 16   then
			GiveItem ( role , 0 , 2844 , 3 , 4 )
		end
	elseif a >= 87500001 and a <= 93500000   then					----����ʯ
		GiveItem ( role , 0 , 885 , 1 , 4 )
	elseif a >= 93500001 and a <= 94500000   then					----��ʯ
		local e = math.random ( 1 , 7 )
		--if e >= 1 and e <= 4   then
		local Item_Id = e + 877
		GiveItem ( role , 0 , Item_Id , 1 , 4 )
		-- else
			-- local Item_Id = e + 877
			-- GiveItem ( role , 0 , Item_Id , 1 , 4 )
		--end
	else		
		local f = math.random ( 1 , 58 )
		if value == 1   then
			pinzhi = 4
		elseif value == 2   then
			pinzhi = 16
		elseif value == 3   then
			pinzhi = 22
		else
			CALCULATE_FUNCTIONS_LUA_000206 = GetResString("CALCULATE_FUNCTIONS_LUA_000206")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000206)
		end
		if f == 1   then
			GiveItem ( role , 0 , 0299 , 1 , pinzhi) 
		elseif f == 2   then
			GiveItem ( role , 0 , 0475 , 1 , pinzhi) 
		elseif f == 3   then
			GiveItem ( role , 0 , 0651 , 1 , pinzhi) 
		elseif f == 4   then
			GiveItem ( role , 0 , 0304 , 1 , pinzhi) 
		elseif f == 5   then
			GiveItem ( role , 0 , 0480 , 1 , pinzhi) 
		elseif f == 6   then
			GiveItem ( role , 0 , 0656 , 1 , pinzhi) 
		elseif f == 7   then
			GiveItem ( role , 0 , 0229 , 1 , pinzhi) 
		elseif f == 8   then
			GiveItem ( role , 0 , 653 , 1 , pinzhi)  
		elseif f == 9   then
			GiveItem ( role , 0 , 0230 , 1 , pinzhi) 
		elseif f == 10   then
			GiveItem ( role , 0 , 477 , 1 , pinzhi)  
		elseif f == 11   then
			GiveItem ( role , 0 , 0371 , 1 , pinzhi) 
		elseif f == 12   then
			GiveItem ( role , 0 , 0547 , 1 , pinzhi)  
		elseif f == 13   then
			GiveItem ( role , 0 , 0723 , 1 , pinzhi) 
		elseif f == 14   then
			GiveItem ( role , 0 , 0394 , 1 , pinzhi) 
		elseif f == 15   then
			GiveItem ( role , 0 , 0570 , 1 , pinzhi)  
		elseif f == 16   then
			GiveItem ( role , 0 , 0746 , 1 , pinzhi) 
		elseif f == 17   then
			GiveItem ( role , 0 , 0382 , 1 , pinzhi) 
		elseif f == 18   then
			GiveItem ( role , 0 , 0558 , 1 , pinzhi)  
		elseif f == 19   then
			GiveItem ( role , 0 , 0734 , 1 , pinzhi) 
		elseif f == 20   then
			GiveItem ( role , 0 , 2204 , 1 , pinzhi) 
		elseif f == 21   then
			GiveItem ( role , 0 , 0393 , 1 , pinzhi) 
		elseif f == 22   then
			GiveItem ( role , 0 , 0569 , 1 , pinzhi)  
		elseif f == 23   then
			GiveItem ( role , 0 , 0745 , 1 , pinzhi) 
		elseif f == 24   then
			GiveItem ( role , 0 , 2215 , 1 , pinzhi) 
		elseif f == 25   then
			GiveItem ( role , 0 , 0385 , 1 , pinzhi) 
		elseif f == 26   then
			GiveItem ( role , 0 , 0561 , 1 , pinzhi)  
		elseif f == 27   then
			GiveItem ( role , 0 , 0737 , 1 , pinzhi) 
		elseif f == 28   then
			GiveItem ( role , 0 , 2207 , 1 , pinzhi) 
		elseif f == 29   then
			GiveItem ( role , 0 , 0364 , 1 , pinzhi) 
		elseif f == 30   then
			GiveItem ( role , 0 , 0540 , 1 , pinzhi)  
		elseif f == 31   then
			GiveItem ( role , 0 , 0716 , 1 , pinzhi) 
		elseif f == 32   then
			GiveItem ( role , 0 , 2201 , 1 , pinzhi) 
		elseif f == 33   then
			GiveItem ( role , 0 , 0355 , 1 , pinzhi) 
		elseif f == 34   then
			GiveItem ( role , 0 , 0531 , 1 , pinzhi)  
		elseif f == 35   then
			GiveItem ( role , 0 , 0707 , 1 , pinzhi) 
		elseif f == 36   then
			GiveItem ( role , 0 , 2192 , 1 , pinzhi) 
		elseif f == 37   then
			GiveItem ( role , 0 , 0358 , 1 , pinzhi) 
		elseif f == 38   then
			GiveItem ( role , 0 , 0534 , 1 , pinzhi)  
		elseif f == 39   then
			GiveItem ( role , 0 , 0710 , 1 , pinzhi) 
		elseif f == 40   then
			GiveItem ( role , 0 , 2195 , 1 , pinzhi) 
		elseif f == 41   then
			GiveItem ( role , 0 , 0312 , 1 , pinzhi) 
		elseif f == 42   then
			GiveItem ( role , 0 , 0488 , 1 , pinzhi)  
		elseif f == 43   then
			GiveItem ( role , 0 , 0664 , 1 , pinzhi) 
		elseif f == 44   then
			GiveItem ( role , 0 , 0317 , 1 , pinzhi) 
		elseif f == 45   then
			GiveItem ( role , 0 , 0493 , 1 , pinzhi)  
		elseif f == 46   then
			GiveItem ( role , 0 , 0669 , 1 , pinzhi) 
		elseif f == 47   then
			GiveItem ( role , 0 , 0345 , 1 , pinzhi) 
		elseif f == 48   then
			GiveItem ( role , 0 , 0521 , 1 , pinzhi)  
		elseif f == 49   then
			GiveItem ( role , 0 , 0697 , 1 , pinzhi) 
		elseif f == 50   then
			GiveItem ( role , 0 , 0344 , 1 , pinzhi) 
		elseif f == 51   then
			GiveItem ( role , 0 , 0520 , 1 , pinzhi)  
		elseif f == 52   then
			GiveItem ( role , 0 , 0696 , 1 , pinzhi) 
		elseif f == 53   then
			GiveItem ( role , 0 , 0369 , 1 , pinzhi) 
		elseif f == 54   then
			GiveItem ( role , 0 , 0545 , 1 , pinzhi)  
		elseif f == 55   then
			GiveItem ( role , 0 , 0721 , 1 , pinzhi) 
		elseif f == 56   then
			GiveItem ( role , 0 , 0377 , 1 , pinzhi) 
		elseif f == 57   then
			GiveItem ( role , 0 , 0553 , 1 , pinzhi)  
		elseif f == 58   then
			GiveItem ( role , 0 , 0729 , 1 , pinzhi) 
		end
	end
end


	GetExp	=	{}		------------ȡ�ȼ���Ӧ�ܾ���
	GetExp[1]	=	0
	GetExp[2]	=	5
	GetExp[3]	=	15
	GetExp[4]	=	35
	GetExp[5]	=	101
	GetExp[6]	=	250
	GetExp[7]	=	500
	GetExp[8]	=	1000
	GetExp[9]	=	1974
	GetExp[10]	=	3208
	GetExp[11]	=	4986
	GetExp[12]	=	7468
	GetExp[13]	=	10844
	GetExp[14]	=	15338
	GetExp[15]	=	21210
	GetExp[16]	=	28766
	GetExp[17]	=	38356
	GetExp[18]	=	50382
	GetExp[19]	=	65306
	GetExp[20]	=	83656
	GetExp[21]	=	106032
	GetExp[22]	=	133112
	GetExp[23]	=	165668
	GetExp[24]	=	204564
	GetExp[25]	=	250780
	GetExp[26]	=	305412
	GetExp[27]	=	369692
	GetExp[28]	=	444998
	GetExp[29]	=	532870
	GetExp[30]	=	635026
	GetExp[31]	=	753378
	GetExp[32]	=	890062
	GetExp[33]	=	1047438
	GetExp[34]	=	1228138
	GetExp[35]	=	1435074
	GetExp[36]	=	1671470
	GetExp[37]	=	1940892
	GetExp[38]	=	2247288
	GetExp[39]	=	2595010
	GetExp[40]	=	2988860
	GetExp[41]	=	3434132
	GetExp[42]	=	3936658
	GetExp[43]	=	4502856
	GetExp[44]	=	5139778
	GetExp[45]	=	5855180
	GetExp[46]	=	6657576
	GetExp[47]	=	7556310
	GetExp[48]	=	8561630
	GetExp[49]	=	9684764
	GetExp[50]	=	10938016
	GetExp[51]	=	12334856
	GetExp[52]	=	13890020
	GetExp[53]	=	15619622
	GetExp[54]	=	17541282
	GetExp[55]	=	19674240
	GetExp[56]	=	22039516
	GetExp[57]	=	24660044
	GetExp[58]	=	27560852
	GetExp[59]	=	30769230
	GetExp[60]	=	37746418
	GetExp[61]	=	45876427
	GetExp[62]	=	59571153
	GetExp[63]	=	75703638
	GetExp[64]	=	94615279
	GetExp[65]	=	116688304
	GetExp[66]	=	155291059
	GetExp[67]	=	186418013
	GetExp[68]	=	238159614
	GetExp[69]	=	298622278
	GetExp[70]	=	368975850
	GetExp[71]	=	450525549
	GetExp[72]	=	568409779
	GetExp[73]	=	679324744
	GetExp[74]	=	806544569
	GetExp[75]	=	952091724
	GetExp[76]	=	1188099236
	GetExp[77]	=	1480429211
	GetExp[78]	=	1776125584
	GetExp[79]	=	2091634902
	GetExp[80]	=	2425349810
	GetExp[81]	=	2440895086
	GetExp[82]	=	2458896515
	GetExp[83]	=	2479742169
	GetExp[84]	=	2503881436
	GetExp[85]	=	2531834707
	-- GetExp[86]	=	2564204594
	-- GetExp[87]	=	2601688923
	-- GetExp[88]	=	2645095775
	-- GetExp[89]	=	2695360909
	-- GetExp[90]	=	2753567934
	-- GetExp[91]	=	2820971668
	-- GetExp[92]	=	2899025191
	-- GetExp[93]	=	2989411170
	-- GetExp[94]	=	3094078133
	-- GetExp[95]	=	3215282476
	-- GetExp[96]	=	3355637105
	-- GetExp[97]	=	3518167765
	-- GetExp[98]	=	3706378269
	-- GetExp[99]	=	3924326032
	-- GetExp[100]	=	4176709541
	-- GetExp[101]					=		4454331401
	-- GetExp[102]					=		4759715447
	-- GetExp[103]					=		5095637898
	-- GetExp[104]					=		5465152594
	-- GetExp[105]					=		5871618760
	-- GetExp[106]					=		6318731542
	-- GetExp[107]					=		6780864562
	-- GetExp[108]					=		7259017820
	-- GetExp[109]					=		7754191316
	-- GetExp[110]					=		8267385050
	-- GetExp[111]					=		8799599022
	-- GetExp[112]					=		9351833232
	-- GetExp[113]					=		9925087680
	-- GetExp[114]					=		10520362366
	-- GetExp[115]					=		11138657290
	-- GetExp[116]					=		11780972452
	-- GetExp[117]					=		12448307852
	-- GetExp[118]					=		13141663490
	-- GetExp[119]					=		13862039366
	-- GetExp[120]					=		14610435480
	-- -- GetExp[121]					=		14610435480		
	-- GetExp[121]	                =		15433671205


    -- GetExp[122]	                =	    16339230502


    -- GetExp[123]	                =		17335345728


    -- GetExp[124]	                =   	18431072476


	-- GetExp[125]					=		19636371899


	-- GetExp[126]					=		20962201264


	-- GetExp[127]					=		22420613566


	-- GetExp[128]					=		24024867098


	-- GetExp[129]					=		25789545983


	-- GetExp[130]					=		27730692757


	-- GetExp[131]					=		29865954208




	
	


function AddReadingBook ( role )
	local job = GetChaAttr( role, ATTR_JOB)
	local Book_Id = 0
	if job == 1   then
		Book_Id = 3243
	elseif job == 2   then
		Book_Id = 3244
	elseif job == 4   then
		Book_Id = 3246
	elseif job == 5   then
		Book_Id = 3245
	elseif job == 8   then
		Book_Id = 3256
	elseif job == 9   then
		Book_Id = 3255
	elseif job == 12   then
		Book_Id = 3257
	elseif job == 13   then
		Book_Id = 3258
	elseif job == 14   then
		Book_Id = 3259
	elseif job == 16   then
		Book_Id = 3260
	else
		Book_Id = 3288
	end
	GiveItem( role , 0, Book_Id, 1, 4 )
	return LUA_TRUE
end

--function AddExpPer(role ,value)
function AddExpPer ( role , value,value2 )			----------������ҵ�ǰ�ȼ���������ٷֱȵľ���
	if value2 == nil   then
		value2 =  value
	--	SystemNotice (role , "���ԣ� value2===="..value2)
	end
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	value= (math.random((value*100),(value2*100)))/100 
	local exp_add = math.floor ( exp_up * value / 100 )
	local now_exp = GetChaAttr ( role , ATTR_CEXP )
	local new_exp = now_exp + exp_add
	local cha_name = GetChaDefaultName ( role )
	SetChaAttrI( role , ATTR_CEXP , new_exp )
	CALCULATE_FORGE_LUA_000165 = GetResString("CALCULATE_FORGE_LUA_000165")
	CALCULATE_FUNCTIONS_LUA_000207 = GetResString("CALCULATE_FUNCTIONS_LUA_000207")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	SystemNotice( role , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FUNCTIONS_LUA_000207..exp_add..CALCULATE_FORGE_LUA_000165)
	return LUA_TRUE
end
function AddExpAll ( role, value1, value2, type)	------------------��Ӿ���
--	SystemNotice( role , "value1="..value1.."value2="..value2.."type="..type)
	local exp_now = GetChaAttr ( role, ATTR_CEXP )
	if type == 1   then							--------�����ּӾ���
		local exp_add = math.random ( value1, value2)
		local lv = GetChaAttr ( role, ATTR_LV )
		if lv < 80   then
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		else
			exp_add = exp_add/50
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		end
	elseif type == 2   then							----------���ٷֱȼӾ���
		local per_exp = math.random ( value1, value2)
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv < 80   then
			local lv_next = lv + 1
			local exp_up = GetExp[lv_next] - GetExp[lv]
			local exp_add = math.floor( ( exp_up * per_exp ) / 100 )
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		elseif lv >= 80 and lv < 100   then
			local lv_next = lv + 1
			local exp_up = GetExp[lv_next] - GetExp[lv]
			local exp_add =  math.floor ( ( exp_up * per_exp ) / 5000 )
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		else
			exp_new = exp_now + 10000
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		end
	end
end


function AddExpNextLv1( role ) -----------------����ҵȼ�����һ��
	local exp_add = GetChaAttr ( role, ATTR_NLEXP )
	local cha_name = GetChaDefaultName ( role )
	SetChaAttrI( role , ATTR_CEXP , exp_add )	
	RefreshCha( role )
	CALCULATE_FUNCTIONS_LUA_000208 = GetResString("CALCULATE_FUNCTIONS_LUA_000208")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	Notice ( CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FUNCTIONS_LUA_000208)
	return LUA_TRUE
end

function AddExpNextLv2( role ) -----------------����ҵȼ�����һ��
	local exp_add = GetChaAttr ( role, ATTR_NLEXP )
	local cha_name = GetChaDefaultName ( role )
	SetChaAttrI( role , ATTR_CEXP , exp_add )
	RefreshCha( role )
	CALCULATE_FUNCTIONS_LUA_000209 = GetResString("CALCULATE_FUNCTIONS_LUA_000209")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	Notice ( CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FUNCTIONS_LUA_000209)
	return LUA_TRUE
end


---------------------------------------------------����1440�;�ֵ�ĳ�����
function AddChaHJ( character  )	
	local c1=0
	local c2=0
	c1,c2 =MakeItem(character, 2967, 1, 4)			--value���ǵ���ID   C2�Ƿ��صĴ�������λ�ñ��
	local Item_Rwine = GetChaItem ( character , 2 , c2 )			--�ӽ�ɫ�ı���λ 2 ȡλ�� C2�ĵ��ߵ�ָ��
	
	local Rwine_NOW = 1440                                                                              
	
	SetItemAttr(Item_Rwine, ITEMATTR_MAXENERGY, Rwine_NOW)						--��������;�
	SetItemAttr(Item_Rwine, ITEMATTR_ENERGY, Rwine_NOW)								 --���õ�ǰ�;ã���ֵ��ÿ���Ӻ���һ��
	RefreshCha( character )
	CALCULATE_FUNCTIONS_LUA_000210 = GetResString("CALCULATE_FUNCTIONS_LUA_000210")
	SystemNotice (character , CALCULATE_FUNCTIONS_LUA_000210 )
end


---------------------------------------------------�жϳ������;��Ƿ�Ϊ0
function CheckHJ ( character )
	local Rwine_Num = 0
	Rwine_Num = CheckBagItem(  character , 2967 )		--��鱳����2977�ŵ��ߵ�����
	if Rwine_Num == 1   then				--���2977�ŵ��ߵ��������ڵ���1
		local Rwine = GetChaItem2 (  character , 2 , 2967 )			--ȡ����ɫ�����ڵ���IDΪ2977�ĵ��ߵ�ָ��
		local ENERGY = GetItemAttr(Rwine, ITEMATTR_ENERGY)
		if ENERGY ==0   then
			return LUA_TRUE
		end
	else
		CALCULATE_FUNCTIONS_LUA_000211 = GetResString("CALCULATE_FUNCTIONS_LUA_000211")
		SystemNotice( character, CALCULATE_FUNCTIONS_LUA_000211)
	end

end

function CreatBBBB( role , MonsterID )
	local x , y = GetChaPos(role)
	x = x + 10
	y = y + 10
	local Refresh = 3600
	local life = 3600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	local Role_ID = GetRoleID(role)	---------�µ�
	BBBB[ Role_ID ] = new
	local hit = GetChaAttr( new , ATTR_HIT )
	--SystemNotice( role , "hit=="..hit )
	hit = 225
	SetCharaAttr ( hit , new , ATTR_HIT )
	--SystemNotice( role , "hit00=="..hit )



	return LUA_TRUE
end
function killBBBB(role)
	local Role_ID = GetRoleID(role)	
	local BBBB = BBBB[ Role_ID ]
	KillCha( BBBB )
	return LUA_TRUE
end

function CheckBBBB( role )
	local Role_ID = GetRoleID(role)	
	local BBBB = BBBB[ Role_ID ]
	if BBBB~= nil and BBBB~= 0   then 
		local ISLive = ValidCha( BBBB )
		--SystemNotice( role , "ISLive==" ..ISLive)
		local hit = GetChaAttr( BBBB , ATTR_HIT )
		--SystemNotice( role , "hit00==" ..hit)
		if hit== 225   then
			local x01 , y01 = GetChaPos(role)
			local x02 , y02 = GetChaPos(BBBB)
			local X_red = math.abs( x01 - x02 )
			local Y_red = math.abs( y01 - y02 )
			if X_red <= 2000 and Y_red <= 2000   then
				KillCha( BBBB )-------�µ�
				return LUA_TRUE
			else
				CALCULATE_FUNCTIONS_LUA_000212 = GetResString("CALCULATE_FUNCTIONS_LUA_000212")
				SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000212 )
				return LUA_FALSE
			end
		else
			CALCULATE_FUNCTIONS_LUA_000213 = GetResString("CALCULATE_FUNCTIONS_LUA_000213")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000213 )
			return LUA_FALSE
		end
	
	else
		CALCULATE_FUNCTIONS_LUA_000214 = GetResString("CALCULATE_FUNCTIONS_LUA_000214")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000214 )
		return LUA_FALSE
	end
end

-----Valentine's Day to determine conditions for exchange rings-----
function ValentinesRingJudge(role)
	local Ring_Num = 0
	local t = {}			-- Calling all teammates pointers
		t[0] = role
		t[1] = GetTeamCha(role, 0 )
		t[2] = GetTeamCha(role, 1 )
		t[3] = GetTeamCha(role, 2 )
		t[4] = GetTeamCha(role, 3 )
	local t_Num = {}		--Record the number of all teammates who have ring
	t_Num[0]	= 0
	t_Num[1]	= 0
	t_Num[2]	= 0
	t_Num[3]	= 0
	t_Num[4]	= 0
	local i = 1
	for i = 1 , 4, 1 do
		if t[i] ~= nil   then
			local Ring_Num_Add = CheckBagItem(  t[i] , 2521 )
			if Ring_Num_Add == 1   then

             local retbag = HasLeaveBagGrid(  t[i], 1) 
              if retbag ~= LUA_TRUE   then 
                BickerNotice(role,"Your partners Inventory is full!")
                BickerNotice(t[i],"You need at least 1 free Slot!") 
                 return LUA_FALSE 
              end      
             local NocLock =KitbagLock( t[i], 0 ) 
              if NocLock == LUA_FALSE   then 
                BickerNotice( role , "Your partners Inventory is locked!") 
                BickerNotice( t[i] , "You need to make sure your inventory is unlocked") 
                 return LUA_FALSE 
               end 
								
			 if CheckWeddingDress(role) == 0   then
			    BickerNotice(role, "You are not dressed up!")
				BickerNotice(t[i], "Your partner is not dressed up")		
				 return 0
			end
	
			 if CheckWeddingDress(t[i]) == 0   then
			  BickerNotice (role, "Your partner is not dressed up!")
			  BickerNotice (t[i], "You are not dressed up!")
				return 0
			end

				t_Num[i] = 1		--If there are rings, the value is set to 1, for the judge to do with the back
				Ring_Num = Ring_Num + Ring_Num_Add	--The team recorded the total number of rings for the judge to do with the back
				local USED_Ring_Num = CheckBagItem(  t[i] , 2520 )	--To determine whether this team-mate who has been bound ring
				if USED_Ring_Num >= 1   then
					SystemNotice(role,"Your Team mate is already married!")
					SystemNotice(t[i],"You can only marry once! Get divorced!")
					return LUA_FALSE
				end
			end
		end
	end

	if Ring_Num == 1   then				--If the team a total of a ring on the task of this man and   then the person with
		return LUA_TRUE
	elseif Ring_Num > 1   then
		SystemNotice(role,"You need one Valentines Day Ring!")
		return LUA_FALSE
	else
		SystemNotice(role,"Please find someone to marry first!")
		return LUA_FALSE
	end
end
-----Valentine's Day ring record information
function ValentinesRing(role)
	local Ring_Num = 0
	local t = {}			--Pointer to call the various teammates
		t[0] = role
		t[1] = GetTeamCha(role, 0 )
		t[2] = GetTeamCha(role, 1 )
		t[3] = GetTeamCha(role, 2 )
		t[4] = GetTeamCha(role, 3 )
	local t_Num = {}		--Record the number of all teammates who ring
		t_Num[0]	= 0
		t_Num[1]	= 0
		t_Num[2]	= 0
		t_Num[3]	= 0
		t_Num[4]	= 0
	local i = 1
	for i = 1 , 4, 1 do
		if t[i] ~= nil   then
			local Ring_Num_Add = CheckBagItem(  t[i] , 2521 )
			if Ring_Num_Add == 1   then
				t_Num[i] = 1		--If there are rings, the value is set to 1, for the judge to do with the back
				Ring_Num = Ring_Num + Ring_Num_Add	--The team recorded the total number of rings for the judge to do with the back
				local USED_Ring_Num = CheckBagItem(  t[i] , 2520 )	--To determine whether this team-mate who has been bound ring
				if USED_Ring_Num >= 1   then
					SystemNotice(role,"Your team-mate is already married!")
					SystemNotice(t[i],"You can marry only once! Get divorced!")
					return LUA_FALSE
				end
			end
		end
	end

	if Ring_Num == 1   then				--If the team a total of a ring on the task of this man and   then the person with
		local i = 1
		for i = 1 , 4 ,1 do
			if t_Num[i] == 1   then

				local RoleType = GetChaID(role)
				local TeamerType = GetChaID(t[i])
				if (RoleType<=2 and TeamerType>=3) or (RoleType>=3 and TeamerType<=2)   then		--Sex determination
					--Players will take over the task of information recorded in the other ring in the
					local ID_Num = GetRoleID(role)	--Then the task to obtain the player's ID number, and record in the ring in the

					GiveItem ( t[i] , 0 , 2520  , 1 , 4  )
					local a = DelBagItem ( t[i] , 2521 , 1)

					local Item = GetChaItem2 ( t[i] , 2 , 2520 )	--Valentine's teammates made the right ring pointer

					local Num_JZ = GetItemForgeParam ( Item , 1 )
					Num_JZ = TansferNum ( Num_JZ )
					Num_JZ = ID_Num	---Scouring the role of ID numbers of information bits recorded
					SetItemForgeParam ( Item , 1 , Num_JZ )
					AddChaSkill ( t[i] , SK_QLZX, 1 , 1 , 0 )
					--The information recorded will be the right team-mate in the next task of the player's rings
					local ID_Num1 = GetRoleID(t[i])	--Get the right team-mate's ID number, and record in the ring in the

					GiveItem ( role , 0 , 2520  , 1 , 4  )
					local b = DelBagItem ( role , 2521 , 1)

					local Item1 = GetChaItem2 ( role , 2 , 2520 )	--Then the task to obtain the player's Valentine's Day ring pointer

					local Num_JZ1 = GetItemForgeParam ( Item1 , 1 )
					Num_JZ1 = TansferNum ( Num_JZ1 )
					Num_JZ1 = ID_Num1	---Scouring the role of ID numbers of information bits recorded

					SetItemForgeParam ( Item1 , 1 , Num_JZ1 )
					AddChaSkill ( role , SK_QLZX, 1 , 1 , 0 )
				--	Notice("Get away")
				else
					SystemNotice(role,"Please note about your gender!")
				end
			end
		end
		return LUA_TRUE
	elseif Ring_Num > 1   then
		SystemNotice(role,"You can only marry one!")
		return LUA_FALSE
	else
		SystemNotice(role,"Please find someone to marry first!")
		return LUA_FALSE
	end
end

function CheckWeddingDress (role)
	local ChaType = GetChaTypeID(role) -- Character Race
	local Body = GetItemID (GetEquipItemP(role, 2)) -- Body
	local Glove = GetItemID (GetEquipItemP(role, 3)) -- Gloves
	local Shoes = GetItemID (GetEquipItemP(role, 4)) -- Boots
	local Hat = GetItemID(GetEquipItemP(role, 0))-- Hat
	-- Lance
	if ChaType == 1   then
		if Body ~= 5221 or Glove ~= 5222 or Shoes ~= 5223   then	   
			return 0
		end
	-- Carsise
	elseif ChaType == 2   then
		if Body ~= 5238 or Glove ~= 5239 or Shoes ~= 5240   then	   
			return 0
		end	
	-- Phyllis
	elseif ChaType == 3   then
		if Body ~= 5245 or Glove ~= 5246 or Shoes ~= 5247 or Hat ~= 5244   then	   
			return 0
		end		
	-- Amy
	elseif ChaType == 4   then
		if Body ~= 5253 or  Glove ~= 5254 or Shoes ~= 5255 or Hat ~= 5252   then	   
			return 0
		end
	end

end

function Checksailexpless ( role , value )
	local sail_role = GetChaAttr ( role , ATTR_CSAILEXP )
	if sail_role < value   then
		return LUA_TRUE
	end
end

function Checksailexpmore ( role , value )
	local sail_role = GetChaAttr ( role , ATTR_CSAILEXP )
	if sail_role >= value   then
		return LUA_TRUE
	end
end

----------------------------------�뿪������
function Leaveprison ( role )
	AddState( role, role, STATE_BKDB, 10, 3600)
	local br = math.random ( 1, 3)
	if br==1   then
		BIRTH_BIRTH_CONF_LUA_000001 = GetResString("BIRTH_BIRTH_CONF_LUA_000001")
		SetSpawnPos ( role, BIRTH_BIRTH_CONF_LUA_000001)
		BIRTH_BIRTH_CONF_LUA_000001 = GetResString("BIRTH_BIRTH_CONF_LUA_000001")
		MoveCity ( role, BIRTH_BIRTH_CONF_LUA_000001)
	elseif br == 2   then
		BIRTH_BIRTH_CONF_LUA_000003 = GetResString("BIRTH_BIRTH_CONF_LUA_000003")
		SetSpawnPos ( role, BIRTH_BIRTH_CONF_LUA_000003)
		BIRTH_BIRTH_CONF_LUA_000003 = GetResString("BIRTH_BIRTH_CONF_LUA_000003")
		MoveCity ( role, BIRTH_BIRTH_CONF_LUA_000003)
	else
		BIRTH_BIRTH_CONF_LUA_000004 = GetResString("BIRTH_BIRTH_CONF_LUA_000004")
		SetSpawnPos ( role, BIRTH_BIRTH_CONF_LUA_000004)
		BIRTH_BIRTH_CONF_LUA_000004 = GetResString("BIRTH_BIRTH_CONF_LUA_000004")
		MoveCity ( role, BIRTH_BIRTH_CONF_LUA_000004)
	end
	return LUA_TRUE
end

---------����������ʱ��
function Checkjlktime ( role )
	local jiluka_num = CheckBagItem ( role, 5724)
	if jiluka_num == 1   then
		local jiluka = GetChaItem2 (  role , 2 , 5724 )			--ȡ����ɫ�����ڵ���IDΪ5724�ĵ��ߵ�ָ��
		local ENERGY = GetItemAttr(jiluka, ITEMATTR_ENERGY)
		if ENERGY ==0   then
			return LUA_TRUE
		end
	else
		CALCULATE_FUNCTIONS_LUA_000223 = GetResString("CALCULATE_FUNCTIONS_LUA_000223")
		SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000223)
	end

end

---------���������¼��
function Givejiluka ( role )
	local r1=0
	local r2=0
	r1,r2 =MakeItem ( role , 5724  , 1 , 4 )
	local Item_new = GetChaItem ( role , 2 , r2 )
	SetItemAttr( Item_new, ITEMATTR_ENERGY, 3600)
	SetItemAttr( Item_new, ITEMATTR_MAXENERGY, 3600)
	return LUA_TRUE
end

---------------------------------------------------ʥ���ı���֮�ж��¹ⱦ���;��Ƿ�Ϊ0
function ItemAttrNum( role ,p1,p2,p3,p4)----p1�����߱�ţ�p2������ĳ�����ԣ�p3��Ҫ�������ֵ��p4�����ڣ�1����С�ڣ�2�������ڣ�0�������ڵ��ڣ�3����С�ڵ��ڣ�4��
	local ItemAttr={}
	ItemAttr[1]=ITEMATTR_VAL_STR
	ItemAttr[2]=ITEMATTR_VAL_AGI
	ItemAttr[3]=ITEMATTR_VAL_DEX
	ItemAttr[4]=ITEMATTR_VAL_CON
	ItemAttr[5]=ITEMATTR_VAL_STA
	ItemAttr[6]=ITEMATTR_URE
	ItemAttr[7]=ITEMATTR_ENERGY
	local item_num = 0
	local item=0	
	item_num = CheckBagItem(  role , p1  )		--��鱳����p1�ŵ��ߵ�����-+
	
	if item_num~=1   then
		CALCULATE_FUNCTIONS_LUA_000224 = GetResString("CALCULATE_FUNCTIONS_LUA_000224")
		SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000224)
		return LUA_FALSE
	else
		item=GetChaItem2 (  role , 2 , p1 )-----------------ȡ����ָ��
		local itemattrnum=GetItemAttr(item,ItemAttr[p2])--------ȡ���ߵ�p2����
		if p4==0 and itemattrnum==p3   then ------------Ҫ�����Ե���p3
			return LUA_TRUE
		elseif p4==1 and itemattrnum>p3   then ------------Ҫ�����Դ���p3
			return LUA_TRUE
		elseif  p4==2 and itemattrnum<p3   then ------------Ҫ������С��p3
			return LUA_TRUE
		elseif  p4==3 and itemattrnum>=p3   then ------------Ҫ�����Դ��ڵ���p3
			return LUA_TRUE
		elseif  p4==4 and itemattrnum<=p3   then ------------Ҫ������С�ڵ���p3
			return LUA_TRUE			
		else
			return LUA_FALSE			
		end
	end
end

---------------------------------------------------�жϽ�ɫ������Ʒ�Ƿ�Ϸ�--���˻
function CheckChaItem( role )
	local ItemBag = 2									
	local item = GetChaItem(role, 2, 2)                               --- ȡ��ɫ��������3����� 
	local itemattrnum = GetItemAttr(item, ITEMATTR_ENERGY)            ---ȡ��ɫ��������3����� ������ֵ
	local itemtypenum = GetItemType(item)                             ---ȡ��ɫ��������3����� ������
	local item_ID = GetItemID(item)	
	--local R1 = 0	
	if  item == nil   then
		CALCULATE_FUNCTIONS_LUA_000225 = GetResString("CALCULATE_FUNCTIONS_LUA_000225")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000225)
		return LUA_FALSE
	elseif item_ID == 5842    then
		CALCULATE_FUNCTIONS_LUA_000226 = GetResString("CALCULATE_FUNCTIONS_LUA_000226")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000226)
		return LUA_FALSE		
	elseif itemattrnum<3000   then
		CALCULATE_FUNCTIONS_LUA_000227 = GetResString("CALCULATE_FUNCTIONS_LUA_000227")
		SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000227)
		return LUA_FALSE
	elseif itemtypenum~=1 and itemtypenum~=2 and itemtypenum~=3 and itemtypenum~=4 and itemtypenum~=5 and itemtypenum~=6 and itemtypenum~=7 and itemtypenum~=9 and itemtypenum~=10 and itemtypenum~=11 and itemtypenum~=22 and itemtypenum~=23 and itemtypenum~=24   then	 
		CALCULATE_FUNCTIONS_LUA_000228 = GetResString("CALCULATE_FUNCTIONS_LUA_000228")
		SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000228)
		return LUA_FALSE
	--elseif R1 == 0   then
		--SystemNotice( role, "�Ƴ�����ʧ��")
		--return LUA_FALSE
	else		
		--RemoveChaItem ( role , item_ID , 1 , 2 , -1 , 2 , 0  )
		--RemoveChaItem ( role , 3669    , 1 , 1 , -1 , 2 , 1  )
		SystemNotice(role ,"Item_ID======"..item_ID)
		return LUA_TRUE
	end	
end


function ClearItemNum2( role )
	local ItemBag = 2									
	local item = GetChaItem(role, 2, 2)                               --- ȡ��ɫ��������3����� 
	local itemattrnum = GetItemAttr(item, ITEMATTR_ENERGY)            ---ȡ��ɫ��������3����� ������ֵ
	local itemtypenum = GetItemType(item)                             ---ȡ��ɫ��������3����� ������
	local item_ID = GetItemID(item)	
	--local R1 = 0	
	if  item == nil   then
		--SystemNotice(role,"�뽫��Ҫ�����ĵ��߷��ڱ���������")
		return LUA_FALSE
	elseif item_ID == 5842    then
		--SystemNotice(role,"���ɲ�����������Ŷ")
		return LUA_FALSE		
	elseif itemattrnum<3000   then
		--SystemNotice( role, "��ȷ����Ҫ�����ĵ���Ʒ��Ϊ��ɫ���ϵ�װ��")
		return LUA_FALSE
	elseif itemtypenum~=1 and itemtypenum~=2 and itemtypenum~=3 and itemtypenum~=4 and itemtypenum~=5 and itemtypenum~=6 and itemtypenum~=7 and itemtypenum~=9 and itemtypenum~=10 and itemtypenum~=11 and itemtypenum~=22 and itemtypenum~=23 and itemtypenum~=24   then	 
		--SystemNotice( role, "��ȷ����Ҫ��������Ʒ��װ��������")
		return LUA_FALSE
	else		
		SystemNotice(role ,"Item_ID======"..item_ID)
		return item_ID
	end
end


-----------������Ʊ�Խ� by Lee
--[[ ��Ʊϵͳ����
function CheckTime_cpopen ( role )
	local now_week= os.date("%w")		-------------���ڼ���ʮ���ƣ� 
	local now_hour= os.date("%H")		-------------ʱ 
	now_week= tonumber(now_week)
	now_hour= tonumber(now_hour)
--	SystemNotice( role, "����"..now_week.."ʱ��"..now_hour)
	if now_week == 7 or now_week == 1 or  now_week == 2 or  now_week == 5 or  now_week == 3 or  now_week == 4    then
		if now_week == 6   then
			if now_hour <19 and now_hour > 20   then
				return LUA_TRUE
			end
	
		end
        end
end
-----------------�رղ�Ʊ��д by eric
function CheckTime_cpcolse ( role )
	local now_week= os.date("%w")		-------------���ڼ���ʮ���ƣ� 
	local now_hour= os.date("%H")		-------------ʱ 
	now_week= tonumber(now_week)
	now_hour= tonumber(now_hour)
--	SystemNotice( role, "����"..now_week.."ʱ��"..now_hour)
	if now_week == 7 or now_week == 1 or  now_week == 2 or  now_week == 5 or  now_week == 3 or  now_week == 4    then
		if now_week == 6   then
			if now_hour <19 and now_hour > 22   then
				return LUA_TRUE
			end
		end
	end
end

------------�һ���Ʊһ�Ƚ�  by Peter
function DuiHhuan1( role )
--		SystemNotice( role, "come here!11")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0   then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU     then   --�жϲ�Ʊ�ں�             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --�н������λ
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --�н�����ʮλ
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --�н������λ
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --�н�����ǧλ
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --�н�������λ
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --�н�����ʮ��λ
			 local  Nom1 =GetTicketItemno(crab, 1)         --��Ʊ�����λ
			local  Nom2 =GetTicketItemno(crab, 2)          --��Ʊ����ʮλ
			local  Nom3 =GetTicketItemno(crab, 3)          --��Ʊ�����λ
			local  Nom4 =GetTicketItemno(crab, 4)          --��Ʊ����ǧλ
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --��Ʊ������λ
			local  Nom6 =GetTicketItemno(crab, 6)          --��Ʊ����ʮ��λ
			if  Nom1=="X"   then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X"   then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X"   then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X"   then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X"   then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X"   then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

			if  no1==Nom1 and  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5 and no6==Nom6	  then
				  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
--				SystemNotice( role, "return LUA_TRUE")
				return LUA_TRUE
			 else
--				SystemNotice( role, "return LUA_FALSE")
				return LUA_FALSE
			 end
		 end
end
     
---------------�һ���Ʊ���Ƚ� by Peter
function DuiHhuan2( role )
--		SystemNotice( role, "come here!22")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0   then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU    then   --�жϲ�Ʊ�ں�             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --�н������λ
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --�н�����ʮλ
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --�н������λ
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --�н�����ǧλ
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --�н�������λ
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --�н�����ʮ��λ
			 local  Nom1 =GetTicketItemno(crab, 1)         --��Ʊ�����λ
			local  Nom2 =GetTicketItemno(crab, 2)          --��Ʊ����ʮλ
			local  Nom3 =GetTicketItemno(crab, 3)          --��Ʊ�����λ
			local  Nom4 =GetTicketItemno(crab, 4)          --��Ʊ����ǧλ
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --��Ʊ������λ
			local  Nom6 =GetTicketItemno(crab, 6)          --��Ʊ����ʮ��λ
			if  Nom1=="X"   then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X"   then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X"   then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X"   then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X"   then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X"   then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		if  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5 and no6==Nom6   then
			 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
---			SystemNotice( role, "return LUA_TRUE1")
			return LUA_TRUE
		elseif  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5 and no1==Nom1   then
		 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
---			SystemNotice( role, "return LUA_TRUE2")
			return LUA_TRUE
		else
---			SystemNotice( role, "return LUA_FALSE")
			return LUA_FALSE
		end

	end

end
-------------�һ���Ʊ���Ƚ� by Peter
function DuiHhuan3( role )
--		SystemNotice( role, "come here!33")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0   then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU    then   --�жϲ�Ʊ�ں�             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --�н������λ
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --�н�����ʮλ
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --�н������λ
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --�н�����ǧλ
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --�н�������λ
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --�н�����ʮ��λ
			 local  Nom1 =GetTicketItemno(crab, 1)         --��Ʊ�����λ
			local  Nom2 =GetTicketItemno(crab, 2)          --��Ʊ����ʮλ
			local  Nom3 =GetTicketItemno(crab, 3)          --��Ʊ�����λ
			local  Nom4 =GetTicketItemno(crab, 4)          --��Ʊ����ǧλ
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --��Ʊ������λ
			local  Nom6 =GetTicketItemno(crab, 6)          --��Ʊ����ʮ��λ
			if  Nom1=="X"   then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X"   then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X"   then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X"   then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X"   then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X"   then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		
		if  no1==Nom1 and no2==Nom2 and no3==Nom3 and no4==Nom4    then
			  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
--			SystemNotice( role, "return LUA_TRUE1")
			return LUA_TRUE
		elseif  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5   then
			  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
--			SystemNotice( role, "return LUA_TRUE2")
			return LUA_TRUE
                elseif  no3==Nom3 and no4==Nom4 and no5==Nom5 and no6==Nom6   then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
---			SystemNotice( role, "return LUA_TRUE2")
			return LUA_TRUE
		 else
---			SystemNotice( role, "return LUA_FALSE")
			return LUA_FALSE
	       end
	end
end
----------�һ���Ʊ�ĵȽ� by Peter
function DuiHhuan4( role )
--		SystemNotice( role, "come here!44")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0   then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU    then   --�жϲ�Ʊ�ں�             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --�н������λ
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --�н�����ʮλ
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --�н������λ
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --�н�����ǧλ
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --�н�������λ
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --�н�����ʮ��λ
			 local  Nom1 =GetTicketItemno(crab, 1)         --��Ʊ�����λ
			local  Nom2 =GetTicketItemno(crab, 2)          --��Ʊ����ʮλ
			local  Nom3 =GetTicketItemno(crab, 3)          --��Ʊ�����λ
			local  Nom4 =GetTicketItemno(crab, 4)          --��Ʊ����ǧλ
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --��Ʊ������λ
			local  Nom6 =GetTicketItemno(crab, 6)          --��Ʊ����ʮ��λ
			if  Nom1=="X"   then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X"   then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X"   then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X"   then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X"   then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X"   then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		 if  no1==Nom1 and  no2==Nom2 and no3==Nom3    then 
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			return LUA_TRUE
		  elseif no2==Nom2 and no3==Nom3 and no4==Nom4   then
		   RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		elseif no3==Nom3 and no4==Nom4 and no5==Nom5    then
		 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		 elseif no4==Nom4 and no5 == Nom5 and no6 == Nom6    then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		 else
			return LUA_FALSE
		end
	 end
end
-------------�һ���Ʊ��Ƚ� by Peter
function DuiHhuan5( role )
--		SystemNotice( role, "come here!55")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0   then 
		return LUA_FALSE
		 end
--		SystemNotice( role, "caipiaoU=="..caipiaoU)
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU    then   --�жϲ�Ʊ�ں�             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --�н������λ
--			SystemNotice( role, "no1=="..no1)
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --�н�����ʮλ
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --�н������λ
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --�н�����ǧλ
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --�н�������λ
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --�н�����ʮ��λ
			 local  Nom1 =GetTicketItemno(crab, 1)         --��Ʊ�����λ
			local  Nom2 =GetTicketItemno(crab, 2)          --��Ʊ����ʮλ
			local  Nom3 =GetTicketItemno(crab, 3)          --��Ʊ�����λ
			local  Nom4 =GetTicketItemno(crab, 4)          --��Ʊ����ǧλ
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --��Ʊ������λ
--			SystemNotice( role, "Nom5=="..Nom5)
			local  Nom6 =GetTicketItemno(crab, 6)          --��Ʊ����ʮ��λ
--			SystemNotice( role, "Nom6=="..Nom6)
			if  Nom1=="X"   then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X"   then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X"   then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X"   then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X"   then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X"   then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		 if  no1==Nom1 and  no2==Nom2   then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		elseif no2==Nom2 and no3==Nom3    then
		 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		 elseif no3==Nom3 and no4==Nom4   then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		 elseif no4==Nom4 and no5==Nom5    then 
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		 elseif  no5==Nom5 and no6==Nom6   then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --ǿ���Ƴ�������һ�����Ʒ
			 return LUA_TRUE
		else
			return LUA_FALSE
		end
	end
end
]]
function goto_mj1_time(role)
	local Now_Time = GetNowTime()
	if Now_Time >= 9 and Now_Time < 10   then
		CALCULATE_FUNCTIONS_LUA_000229 = GetResString("CALCULATE_FUNCTIONS_LUA_000229")
		SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000229)
		return LUA_TRUE
	else
		CALCULATE_FUNCTIONS_LUA_000230 = GetResString("CALCULATE_FUNCTIONS_LUA_000230")
		SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000230)
		return LUA_FALSE
	end
end

function goto_mj2_time(role)
	local Now_Time = GetNowTime()
	if Now_Time >= 19 and Now_Time < 20   then
		CALCULATE_FUNCTIONS_LUA_000231 = GetResString("CALCULATE_FUNCTIONS_LUA_000231")
		SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000231)
		return LUA_TRUE
	else
		CALCULATE_FUNCTIONS_LUA_000232 = GetResString("CALCULATE_FUNCTIONS_LUA_000232")
		SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000232)
		return LUA_FALSE
	end
end

--����֮����װ�ж�

function CheckItem_Wumian ( role )
--	SystemNotice ( role , "����CheckItem_Wumian����")
	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	local head = GetChaItem ( role , 1 , 0 )
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	local Head_ID = GetItemID ( head )
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local head_gem_id = GetItemAttr ( head , ITEMATTR_VAL_FUSIONID )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
		local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
--		SystemNotice ( role , "Head_ID=="..Head_ID)
--		SystemNotice ( role , "Body_ID=="..Body_ID)
--		SystemNotice ( role , "Hand_ID=="..Hand_ID)
--		SystemNotice ( role , "Foot_ID=="..Foot_ID)
--		SystemNotice ( role , "head_gem_id=="..head_gem_id)
--		SystemNotice ( role , "body_gem_id=="..body_gem_id)
--		SystemNotice ( role , "hand_gem_id=="..hand_gem_id)
--		SystemNotice ( role , "foot_gem_id=="..foot_gem_id)
       	if   Body_ID==1506 and Hand_ID==1507 and Foot_ID==1508 and Head_ID==1509   then
			   return 1
		elseif body_gem_id==1506 and hand_gem_id==1507 and foot_gem_id==1508 and head_gem_id==1509   then
			   return 1
		else
			   return 0
		end
end
--������װ�����ж�

function CheckItem_namei ( role )

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	local head = GetChaItem ( role , 1 , 0 )
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	local Head_ID = GetItemID ( head )
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local head_gem_id = GetItemAttr ( head , ITEMATTR_VAL_FUSIONID )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
		local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
		
		if   Body_ID==1510 and Hand_ID==1511 and Foot_ID==1512 and Head_ID==1513   then
			   return 1
		elseif body_gem_id==1510 and hand_gem_id==1511 and foot_gem_id==1512 and head_gem_id==1513   then
			   return 1
		else
			   return 0
		end
end



--·����װ�����ж�

function CheckItem_lufei ( role )
	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	local head = GetChaItem ( role , 1 , 0 )
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	local Head_ID = GetItemID ( head )
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local head_gem_id = GetItemAttr ( head , ITEMATTR_VAL_FUSIONID )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
		local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
		if   Body_ID==1514 and Hand_ID==1515 and Foot_ID==1516 and Head_ID==1517   then
			   return 1
		elseif body_gem_id==1514 and hand_gem_id==1515 and foot_gem_id==1516 and head_gem_id==1517   then
			   return 1
		else
			   return 0
		end

end

---�����˹��װ       by peter 2008.7.2
function CheckItem_ZHOUSI ( role )

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	local head = GetChaItem ( role , 1 , 0 )
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	local Head_ID = GetItemID ( head )
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
	
	local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
	local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
	local head_gem_id = GetItemAttr ( head , ITEMATTR_VAL_FUSIONID )

		if   Body_ID==1518 and Hand_ID==1519 and Foot_ID==1520    then
			   return 1
		elseif body_gem_id==1518 and hand_gem_id==1519 and foot_gem_id==1520    then
			   return 1
		else
			   return 0
		end
	
end

-----�����ؾ�������ͽű�

function mj3sjc (role)
	local X = {}
	local Y = {}
	X [ 1 ] = 374
	X [ 2 ] = 119
	X [ 3 ] = 281
	X [ 4 ] = 94
	X [ 5 ] = 174
	X [ 6 ] = 343
	Y [ 1 ] =  417
	Y [ 2 ] =  460
	Y [ 3 ] =  377
	Y [ 4 ] =  231
	Y [ 5 ] =  67
	Y [ 6 ] =  183
	local i = math.random(1,6)
	MoveTo ( role, X[i] , Y[i] , "mjing3" )
end

function Winterland_MisTime ( role )
	local now_month= os.date("%m")		-------------��
	local now_day= os.date("%d")		-------------��
	now_month= tonumber(now_month)		-------------��     
	now_day= tonumber(now_day)		-------------��     

	local All_Day = JNSTime_Flag_Num[now_month] + now_day
	local Cha_Day = GetChaAttr ( role , ATTR_EXTEND7 )
	if All_Day ~= Cha_Day   then
		return LUA_TRUE
	else
		return LUA_FALSE
	end
end


function Winterland_SetMisTime ( role )			----------������ҵ�ǰ�ȼ���������ٷֱȵľ���
	local now_month= os.date("%m")		-------------��
	local now_day= os.date("%d")		-------------��
	now_month= tonumber(now_month)		-------------��     
	now_day= tonumber(now_day)		-------------��     

	local All_Day = JNSTime_Flag_Num[now_month] + now_day

	SetChaAttr ( role , ATTR_EXTEND7 , All_Day )
end



---������װ
function CheckItem_ZHONGSHEN ( role )

	
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )
	local head = GetChaItem ( role , 1 , 0 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
	local Head_ID = GetItemID ( head )

    local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
    local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
	local head_gem_id = GetItemAttr ( head , ITEMATTR_VAL_FUSIONID )

		body_gem_id=Body_ID
		hand_gem_id=Hand_ID
		foot_gem_id=Foot_ID
		head_gem_id=Head_ID
	if body_gem_id ~= 6105 and body_gem_id ~= 6109 and body_gem_id ~= 6113 and body_gem_id ~= 6117 and body_gem_id ~= 6121 and body_gem_id ~= 6125   then
	   return 0
	end
	if hand_gem_id ~= 6106 and hand_gem_id ~= 6110 and hand_gem_id ~= 6114 and hand_gem_id ~= 6118 and hand_gem_id ~= 6122 and hand_gem_id ~= 6126   then
	   return 0
	end
	if foot_gem_id ~= 6107 and foot_gem_id ~= 6111 and foot_gem_id ~= 6115 and foot_gem_id ~= 6119 and foot_gem_id ~= 6123 and foot_gem_id ~= 6127   then 
	   return 0
	end
	if head_gem_id ~= 6104 and head_gem_id ~= 6108 and head_gem_id ~= 6112 and head_gem_id ~= 6116 and head_gem_id ~= 6120 and head_gem_id ~= 6124   then
	   return 0
	end
	return 1
end

---------�ճ�����

function Day_Mission_Time ()
	local now_day= os.date("%d")		-------------�жϷ�������ǰ�� 
	local now_month= os.date("%m")		-------------�жϷ�������ǰ�� 
	local now_day_num = tonumber(now_day)		-------------��ֵ��
	local now_month_num= tonumber(now_month)	-------------��ֵ��
	local All_Day = JNSTime_Flag[now_month_num] + now_day_num	----��ǰ����

	return All_Day
end

function Reg_Player_Event_Name ( Event_Name )			--ע���¼���  ����1 �ɹ�  0ʧ��
	if Event_Name == "Test"   then
		return 0
	end
	local i = 0
	local Array_Length = table.getn(Player_Can_Do)			--ȡ���鳤
	local Now_Time = Day_Mission_Time()
	for i=1 , Array_Length ,1 do
		if Player_Can_Do[i].Event_Name == Event_Name   then		--������ڸü�¼��������
			return 0
		elseif Player_Can_Do[i].Event_Name ~= Event_Name and i == Array_Length   then		--�����ڸü�¼�����
			table.insert( Player_Can_Do , { Event_Name = Event_Name , Value = {Player_Name = "GMEric" , Do_Day = Now_Time , Has_Record = true } } )
			return 1
		end
	end
	return 0
end

function Add_Player_Event_Value( Event_Name , Role , Do_Day ,Has_Record )			--���Ѿ�ע����¼��������Ϣ
    if Event_Name == "Test"   then
		return 0
	end
	local i = 0
	local Now_Time = Day_Mission_Time()
	local Array_Length = table.getn(Player_Can_Do)			--ȡ���鳤
	for i=1 , Array_Length ,1 do
		if Player_Can_Do[i].Event_Name == Event_Name   then		--������ڸü�¼�����������
			local Role_Name = GetChaDefaultName(Role)
			local Now_Time = Day_Mission_Time()
			table.insert( Player_Can_Do , { Event_Name = Event_Name ,  Value = { Player_Name = Role_Name , Do_Day = Now_Time , Has_Record = Has_Record } } )
			return 1
		elseif Player_Can_Do[i].Event_Name ~= Event_Name and i == Array_Length   then
			return 0
		end
	end
end

function Get_Index_By_Event_And_PlayerName(Event_Name , Role)				--ͨ���¼����ƺ����ָ����ȡ���ü�¼�ı�ţ��Ӷ�֪��������Ƿ����  ����0Ϊδ�ҵ���¼��ĸý�ɫ ����ֵΪ�����������index ��
	   local Role_Name = GetChaDefaultName(Role)
	   local Array_Length = table.getn(Player_Can_Do)
	   for i =1 , Array_Length , 1 do
	   		if Player_Can_Do[i].Event_Name == Event_Name   then
			   if Player_Can_Do[i].Value.Player_Name  == Role_Name   then
			   		return i
				elseif Player_Can_Do[i].Value.Player_Name  ~= Role_Name and i==Array_Length   then
					return 0          --�ҵ��˼�¼û�ҵ��� 
			   end
			elseif  Player_Can_Do[i].Event_Name ~= Event_Name and i==Array_Length   then		--û�ҵ���¼
				Reg_Player_Event_Name(Event_Name)			--ע��һ����¼
				return 0
			end 
	   end
end

function Clear_Event_Record_By_Event_Name( Event_Name )									--���ĳ���¼��������ɵļ�¼Ϊfalse
	local Array_Length = table.getn(Player_Can_Do)
	local Now_Time = Day_Mission_Time()
	for i =1 , Array_Length , 1 do
   		if Player_Can_Do[i].Event_Name == Event_Name   then
			Player_Can_Do[i].Value.Has_Record  = false 
		end 
	end
	return 1
end
function clear()
	Player_Can_Do=nil
	Player_Can_Do={}
	CALCULATE_FUNCTIONS_LUA_000233 = GetResString("CALCULATE_FUNCTIONS_LUA_000233")
	Player_Can_Do[1] = {Event_Name = CALCULATE_FUNCTIONS_LUA_000233 , Value = { Player_Name = "GMEric" , Do_Day = 152 , Has_Record = true } }
	CALCULATE_FUNCTIONS_LUA_000234 = GetResString("CALCULATE_FUNCTIONS_LUA_000234")
	Notice(CALCULATE_FUNCTIONS_LUA_000234)
end


--�ж���ҵ�����ȡ��������ɱ��Ĵ���
function Judge_Mission_Times (character)
	local now_day= os.date("%d")
	local now_month= os.date("%m")
	local now_month_num= tonumber(now_month)		-------------��     
	local now_day_num = tonumber(now_day)	
	local All_Day = JNSTime_Flag[now_month_num] + now_day_num
	local Cha_Day = GetChaAttr (character , ATTR_EXTEND4)
	local Cha_Time = GetChaAttr (character , ATTR_EXTEND3)
	if Cha_Day ~= All_Day   then
		Cha_Day = All_Day
		SetChaAttr (character ,ATTR_EXTEND3 , 1 )
		SetChaAttr (character ,ATTR_EXTEND4 , Cha_Day )
		--GiveItem (character , 0 , 1 , 1 , 4)
		return LUA_TRUE
	elseif Cha_Day == All_Day and Cha_Time < 5   then
		Cha_Time = Cha_Time + 1
		SetChaAttr (character ,ATTR_EXTEND3,Cha_Time)
		--GiveItem (character , 0 , 1 , 1 , 4)
		return LUA_TRUE
	else
		--SystemNotice (character,"��JJ")
		return LUA_FALSE
	end
	--SystemNotice (character,"С�ܵܳ���������")
end


function JL_lv (role)-------------------------�жϾ���ȼ��Ƿ�Ϊ1��
	local Item_bg = GetChaItem ( role , 2 , 1  ) --ȡ��ɫ�����ڶ�����ָ��
	local Get_Item_Type = GetItemType ( Item_bg )
	if  Get_Item_Type ~= 59   then
		return LUA_FALSE	
	else
		local str_Traget = GetItemAttr( Item_bg ,ITEMATTR_VAL_STR )		 --����
		local con_Traget = GetItemAttr( Item_bg ,ITEMATTR_VAL_CON )		--����
		local agi_Traget = GetItemAttr( Item_bg ,ITEMATTR_VAL_AGI )		--רע
		local dex_Traget = GetItemAttr( Item_bg ,ITEMATTR_VAL_DEX )		--����
		local sta_Traget = GetItemAttr( Item_bg ,ITEMATTR_VAL_STA )		--����
		local lv_Traget = str_Traget + con_Traget + agi_Traget + dex_Traget + sta_Traget  ----һ������ĵȼ�
		if lv_Traget >=1   then
			return LUA_TRUE
		else
			return LUA_FALSE
		end
	end
end


function AddExp1(role) ----30���������ӵȼ�1
	local exp_star=GetChaAttr (  role , ATTR_CEXP )----------��ǰ����
	local cha_lv = Lv(role)
	if cha_lv > 0 and cha_lv <= 30   then
	local cha_nlv = cha_lv+1
	local exp_add= GetExp[cha_nlv]-GetExp[cha_lv]
		AddExp ( role, npc, exp_add, exp_add)
	elseif cha_lv>30   then
		CALCULATE_FUNCTIONS_LUA_000235 = GetResString("CALCULATE_FUNCTIONS_LUA_000235")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000235)
		return LUA_FALSE
	end

end


----�жϱ�ʯ�ȼ��Ƿ�Ϊ2��----
function HasDiamondId(role)
	local Diamond = 0
	Item_Diamond = CheckBagItem( role , 6016)
	if Item_Diamond ~= 1   then
		return LUA_FALSE
	elseif Item_Diamond == 1   then
	local Item_attr = 0
	role_Diamond = GetChaItem2(role,2,6016)
	local forge_lv = GetItemAttr ( role_Diamond , ITEMATTR_VAL_BaoshiLV )
		if forge_lv == 2   then
				return LUA_TRUE
			else
				return LUA_FALSE
		end
	end
end	


function  Get_ItemAttr_Join1(role)----�ж�����֤֮�Ĳμӳ������Ƿ����1
	local RYZ_Num = 0
	RYZ_Num =  CheckBagItem( role,3849 )
	if RYZ_Num ~= 1   then
		--SystemNotice(role ,"����ȷ����ı������Ƿ�������֤֮")
		return LUA_FALSE
	elseif RYZ_Num == 1   then
		local item_attr = 0
		role_ryz = GetChaItem2(role,2,3849)
		item_attr = GetItemAttr ( role_ryz , ITEMATTR_VAL_CON )
		if item_attr <= 0   then
			return LUA_FALSE
		else 
			return LUA_TRUE
		end
	end
end 


function  Get_ItemAttr_Join20(role)----�ж�����֤֮�Ĳμӳ������Ƿ����5
	local RYZ_Num = 0
	RYZ_Num =  CheckBagItem( role,3849 )
	if RYZ_Num ~= 1   then
		return LUA_FALSE
	elseif RYZ_Num == 1   then
		local item_attr = 0
		role_ryz = GetChaItem2(role,2,3849)
		item_attr = GetItemAttr ( role_ryz , ITEMATTR_VAL_CON )
		if item_attr < 5   then
			return LUA_FALSE
		else 
			return LUA_TRUE
		end
	end
end 


function JLTLZM (role)    ---------�жϾ�������ֵ�Ƿ���
	local Item_bg = GetChaItem ( role , 2 , 1  ) --ȡ��ɫ�����ڶ�����ָ��
	local Get_Item_Type = GetItemType ( Item_bg )

	if  Get_Item_Type ~= 59   then
		return LUA_FALSE	
	else
		local ure_type = GetItemAttr( Item_bg ,ITEMATTR_URE )       --����
		local Item_Traget_MAXURE=GetItemAttr(Item_bg,ITEMATTR_MAXURE)   --ȡ����;�
		if Item_Traget_MAXURE > ure_type and Item_Traget_MAXURE < ure_type   then 
			return LUA_FALSE
		elseif Item_Traget_MAXURE == ure_type   then
			return LUA_TRUE 
		end
	end
end 





function TeamZd( role ) -----------�ж�����Ƿ���� 

	local Teamplayer = {}
		Teamplayer[1] = GetTeamCha( role, 0 )
		Teamplayer[2] = GetTeamCha( role, 1 )
		Teamplayer[3] = GetTeamCha( role, 2 )
		Teamplayer[4] = GetTeamCha( role, 3 )
	local i = 1
	for i = 1 , 4 , 1 do
		if Teamplayer[i] ~= nil   then
			return LUA_TRUE
		else				
			return LUA_FALSE
		end	
	end
end




function TeamZdJl( role )    ------���������˫������
	local player = {}
	player[1] = GetTeamCha( role , 0 )  
	player[2] = GetTeamCha( role , 1 )
	player[3] = GetTeamCha( role , 2 )
	player[4] = GetTeamCha( role , 3 )
	player[5] = role
	TrigASBJY(role,1,1800)
	local i = 0
	for i = 1, 4 , 1 do
		if ValidCha(player[i])~= 0   then 
			TrigASBJY(player[i],1,900)
		end
	end 
	local cha_name = GetChaDefaultName ( role )
	CALCULATE_FUNCTIONS_LUA_000236 = GetResString("CALCULATE_FUNCTIONS_LUA_000236")
	Notice(cha_name..CALCULATE_FUNCTIONS_LUA_000236)
	CALCULATE_FUNCTIONS_LUA_000237 = GetResString("CALCULATE_FUNCTIONS_LUA_000237")
	SystemNotice(role ,CALCULATE_FUNCTIONS_LUA_000237)
end





function GHPD (role)    ------�ж�����Ƿ��й���
	local GuildID = GetChaGuildID( role )
	if GuildID == 0   then
		return LUA_FALSE
	else
		return LUA_TRUE
	end

end
--------------------------------------------ħ��ˮ�� ����
	----local count=GetItemAttr(Item, ITEMATTR_VAL_STA)	
function MoHeGiveItem(role,count,LVtype)
-- *ħ�и�����Ʒ��ID��
--[[local moheItem={}
			moheItem[1]={}			--1 ��10~45�ĵȼ��׶�
			moheItem[2]={}			--2 ��45��60���ĵȼ��׶�
			moheItem[1][1]={}		 --��10~45�ĵȼ��׶ο�����Ʒ��1~7��
			moheItem[1][2]={}
			moheItem[1][3]={}
			moheItem[1][4]={}
			moheItem[1][5]={}
			moheItem[1][6]={}
			moheItem[1][7]={}
			
			moheItem[2][1]={}		--��45~60�ĵȼ��׶ο�����Ʒ��1~7��
			moheItem[2][2]={}
			moheItem[2][3]={}
			moheItem[2][4]={}
			moheItem[2][5]={}
			moheItem[2][6]={}
			moheItem[2][7]={}
			------------------------------------------------------------------------------------------- LV10-45 
			--����1-2
			moheItem[1][1][0]=15		--0�̶�Ϊ����
			moheItem[1][1][1]=1848		--����Ϊ��Ʒ
			moheItem[1][1][2]=3141
			moheItem[1][1][3]=1128
			moheItem[1][1][4]=3844
			moheItem[1][1][5]=3077
			--3~4
			moheItem[1][2][0]=20
			moheItem[1][2][1]=1848
			moheItem[1][2][2]=4602
			moheItem[1][2][3]=4603
			moheItem[1][2][4]=4604
			moheItem[1][2][5]=3844
			moheItem[1][2][6]=3077
			
			--5~6
			moheItem[1][3][0]=25
			moheItem[1][3][1]=1849	
			moheItem[1][3][2]=3051
			moheItem[1][3][3]=3053	
			moheItem[1][3][4]=3052	
			moheItem[1][3][5]=3096	
			moheItem[1][3][6]=6017	
			moheItem[1][3][7]=6379
			--7
			moheItem[1][4][0]=30
			moheItem[1][4][1]=6379
			moheItem[1][4][2]=6342
			moheItem[1][4][3]=6017
			moheItem[1][4][4]=6016
			moheItem[1][4][5]=332
			moheItem[1][4][6]=332
			moheItem[1][4][7]=563
			--8
			moheItem[1][5][0]=35
			moheItem[1][5][1]=6016
			moheItem[1][5][2]=3089
			moheItem[1][5][3]=935
			moheItem[1][5][4]=6379
			moheItem[1][5][5]=6342	
			--9
			moheItem[1][6][0]=40
			moheItem[1][6][1]=6019  --�����Ŷӹ�
			moheItem[1][6][2]=935
			moheItem[1][6][3]=6379
			moheItem[1][6][4]=6342		
			--10
			moheItem[1][7][0]=80
			moheItem[1][7][1]=0799   ----bb�������һ��
			moheItem[1][7][2]=6380
			moheItem[1][7][3]=6342
			moheItem[1][7][4]=6379
			
		-----------------------------------------------------------------------------------------	LV45~LV60
			
			
			
			
			--����1~2
			moheItem[2][1][0]=3
			moheItem[2][1][1]=1849
			moheItem[2][1][2]=3141
			moheItem[2][1][3]=3844          
			moheItem[2][1][4]=6379
			
			--����34
			moheItem[2][2][0]=5
			moheItem[2][2][1]=6203	
			moheItem[2][2][2]=332			  
			moheItem[2][2][3]=332
			moheItem[2][2][4]=563
			moheItem[2][2][5]=1849
			moheItem[2][2][6]=1849
			moheItem[2][2][7]=6342
			moheItem[2][2][8]=6379
			--  ����56
			moheItem[2][3][0]=10
			moheItem[2][3][1]=6379			
			moheItem[2][3][2]=6019            --BB�������һ��
			moheItem[2][3][3]=6017
			moheItem[2][3][4]=3096
			moheItem[2][3][5]=6342
			moheItem[2][3][6]=6379
			-- ����7
			moheItem[2][4][0]=15	
			moheItem[2][4][1]=6380
			moheItem[2][4][2]=6016
			moheItem[2][4][3]=3089
			moheItem[2][4][4]=6342
			-- ����8
			moheItem[2][5][0]=20
			moheItem[2][5][1]=0227
			moheItem[2][5][2]=6016
			moheItem[2][5][3]=222
			moheItem[2][5][4]=0227
			
			-- ����9
			moheItem[2][6][0]=25
			moheItem[2][6][1]=6380
			moheItem[2][6][2]=6342
			moheItem[2][6][3]=222
			moheItem[2][6][4]=227
			-- ����10
			moheItem[2][7][0]=30
			moheItem[2][7][1]=5276
			moheItem[2][7][2]=222
			moheItem[2][7][3]=6380
			moheItem[2][7][4]=6379
			moheItem[2][7][5]=935
			
--** ����==============
	  local moheItemGL = {}
			moheItemGL[1]={}
			moheItemGL[2]={}
			--moheItemGL[3]={}
			moheItemGL[1][1]={}
			moheItemGL[1][2]={}
			moheItemGL[1][3]={}
			moheItemGL[1][4]={}
			moheItemGL[1][5]={}
			moheItemGL[1][6]={}
			moheItemGL[1][7]={}
			
			moheItemGL[2][1]={}
			moheItemGL[2][2]={}
			moheItemGL[2][3]={}
			moheItemGL[2][4]={}
			moheItemGL[2][5]={}
			moheItemGL[2][6]={}
			moheItemGL[2][7]={}
			
			-- moheItemGL[3][1]={}
			-- moheItemGL[3][2]={}
			-- moheItemGL[3][3]={}
			-- moheItemGL[3][4]={}
			-- moheItemGL[3][5]={}
			
			-- LV10-45 ����1-2
			moheItemGL[1][1][0]=20 --��Ӧ�ĸ���
			moheItemGL[1][1][1]=40
			moheItemGL[1][1][2]=60
			moheItemGL[1][1][3]=70
			moheItemGL[1][1][4]=80
			moheItemGL[1][1][5]=100
			-- LV10-45 ����3-4
			moheItemGL[1][2][0]=20			
			moheItemGL[1][2][1]=30
			moheItemGL[1][2][2]=45
			moheItemGL[1][2][3]=60
			moheItemGL[1][2][4]=75
			moheItemGL[1][2][5]=85
			moheItemGL[1][2][6]=100
			-- LV10-45 ����5-6
			moheItemGL[1][3][0]=20
			moheItemGL[1][3][1]=30
			moheItemGL[1][3][2]=40
			moheItemGL[1][3][3]=50
			moheItemGL[1][3][4]=60
			moheItemGL[1][3][5]=70
			moheItemGL[1][3][6]=80
			moheItemGL[1][3][7]=100
			-- LV10-45 ����7
			moheItemGL[1][4][0]=20
			moheItemGL[1][4][1]=30
			moheItemGL[1][4][2]=50
			moheItemGL[1][4][3]=60
			moheItemGL[1][4][4]=70
			moheItemGL[1][4][5]=80
			moheItemGL[1][4][6]=90
			moheItemGL[1][4][7]=100
			
			-- LV10-45 ����8	
			moheItemGL[1][5][0]=20
			moheItemGL[1][5][1]=30
			moheItemGL[1][5][2]=40
			moheItemGL[1][5][3]=50
			moheItemGL[1][5][4]=70
			moheItemGL[1][5][5]=100
			
			-- LV10-45����9
			moheItemGL[1][6][0]=30
			moheItemGL[1][6][1]=40
			moheItemGL[1][6][2]=50
			moheItemGL[1][6][3]=70
			moheItemGL[1][6][4]=100
			-- LV10-45����10
			moheItemGL[1][7][0]=20
			moheItemGL[1][7][1]=40
			moheItemGL[1][7][2]=60
			moheItemGL[1][7][3]=80
			moheItemGL[1][7][4]=100
			
--------------------------------------------------45--60
			
			-- LV45-60����1-2
			moheItemGL[2][1][0]=20
			moheItemGL[2][1][1]=40
			moheItemGL[2][1][2]=80
			moheItemGL[2][1][3]=90
			moheItemGL[2][1][4]=100
			
			-- LV45--60����34
			moheItemGL[2][2][0]=10
			moheItemGL[2][2][1]=20
			moheItemGL[2][2][2]=30
			moheItemGL[2][2][3]=40
			moheItemGL[2][2][4]=50
			moheItemGL[2][2][5]=60
			moheItemGL[2][2][6]=70
			moheItemGL[2][2][7]=90
			moheItemGL[2][2][8]=100
			-- LV45--60����56
			moheItemGL[2][3][0]=10
			moheItemGL[2][3][1]=20
			moheItemGL[2][3][2]=30
			moheItemGL[2][3][3]=45
			moheItemGL[2][3][4]=60
			moheItemGL[2][3][5]=80
			moheItemGL[2][3][6]=100
			-- LV45-60����7
			moheItemGL[2][4][0]=20
			moheItemGL[2][4][1]=40
			moheItemGL[2][4][2]=60
			moheItemGL[2][4][3]=80
			moheItemGL[2][4][4]=100
			-- LV45-60����8
			moheItemGL[2][5][0]=15
			moheItemGL[2][5][1]=35
			moheItemGL[2][5][2]=50
			moheItemGL[2][5][3]=75
			moheItemGL[2][5][4]=100
			-- LV45-60����9
			moheItemGL[2][6][0]=15
			moheItemGL[2][6][1]=30
			moheItemGL[2][6][2]=80
			moheItemGL[2][6][3]=95
			moheItemGL[2][6][4]=100
			
			-- LV45-60����10
			moheItemGL[2][7][0]=10
			moheItemGL[2][7][1]=30
			moheItemGL[2][7][2]=50
			moheItemGL[2][7][3]=60
			moheItemGL[2][7][4]=80
			moheItemGL[2][7][5]=100 -- **			
--*** ����Ʒ��Ŀ==============
			local moheItemNUM = {}
			moheItemNUM[1]={}
			moheItemNUM[2]={}
			-- moheItemNUM[3]={}
			moheItemNUM[1][1]={}
			moheItemNUM[1][2]={}
			moheItemNUM[1][3]={}
			moheItemNUM[1][4]={}
			moheItemNUM[1][5]={}
			moheItemNUM[1][6]={}
			moheItemNUM[1][7]={}
			
			moheItemNUM[2][1]={}
			moheItemNUM[2][2]={}
			moheItemNUM[2][3]={}
			moheItemNUM[2][4]={}
			moheItemNUM[2][5]={}
			moheItemNUM[2][6]={}
			moheItemNUM[2][7]={}
			-- moheItemNUM[3][1]={}
			-- moheItemNUM[3][2]={}
			-- moheItemNUM[3][3]={}
			-- moheItemNUM[3][4]={}
			-- moheItemNUM[3][5]={}
			-- LV10-45 ����1-2
										--��Ӧ������������Ϊ��ǰ�����x%
			moheItemNUM[1][1][1]=20
			moheItemNUM[1][1][2]=3
			moheItemNUM[1][1][3]=3
			moheItemNUM[1][1][4]=2
			moheItemNUM[1][1][5]=5
			
			-- LV10-25 ����34	
			
			moheItemNUM[1][2][1]=40
			moheItemNUM[1][2][2]=3
			moheItemNUM[1][2][3]=3
			moheItemNUM[1][2][4]=3
			moheItemNUM[1][2][5]=3
			moheItemNUM[1][2][6]=5
			
			-- LV10-25 ����56
			
			moheItemNUM[1][3][1]=20
			moheItemNUM[1][3][2]=3
			moheItemNUM[1][3][3]=3
			moheItemNUM[1][3][4]=3
			moheItemNUM[1][3][5]=1
			moheItemNUM[1][3][6]=3
			moheItemNUM[1][3][7]=1
			-- LV10-25 ����7
			
			moheItemNUM[1][4][1]=1
			moheItemNUM[1][4][2]=1
			moheItemNUM[1][4][3]=3
			moheItemNUM[1][4][4]=1
			moheItemNUM[1][4][5]=3
			moheItemNUM[1][4][6]=3
			moheItemNUM[1][4][7]=3
			-- LV10-25 ����8
			
			moheItemNUM[1][5][1]=1
			moheItemNUM[1][5][2]=1
			moheItemNUM[1][5][3]=1
			moheItemNUM[1][5][4]=1
			moheItemNUM[1][5][5]=1
			
			-- LV10-25 ����9
			
			moheItemNUM[1][6][1]=3
			moheItemNUM[1][6][2]=1
			moheItemNUM[1][6][3]=1
			moheItemNUM[1][6][4]=1
			
			-- LV10-25 ����10			
			
			moheItemNUM[1][7][1]=1
			moheItemNUM[1][7][2]=1
			moheItemNUM[1][7][3]=1
			moheItemNUM[1][7][4]=1
			
			---------------------------------------------------- LV45--60����1-2			
			moheItemNUM[2][1][1]=30
			moheItemNUM[2][1][2]=5
			moheItemNUM[2][1][3]=3
			moheItemNUM[2][1][4]=1
			-- LV45--60����3-4
			moheItemNUM[2][2][1]=10
			moheItemNUM[2][2][2]=3
			moheItemNUM[2][2][3]=3
			moheItemNUM[2][2][4]=3
			moheItemNUM[2][2][5]=50
			moheItemNUM[2][2][6]=3
			moheItemNUM[2][2][7]=1
			moheItemNUM[2][2][8]=1
			
			-- LV45--60����5-6
			moheItemNUM[2][3][1]=1
			moheItemNUM[2][3][2]=3
			moheItemNUM[2][3][3]=3
			moheItemNUM[2][3][4]=3
			moheItemNUM[2][3][5]=1
			moheItemNUM[2][3][6]=1
			-- LV45--60����7
		
			moheItemNUM[2][4][1]=1
			moheItemNUM[2][4][2]=3
			moheItemNUM[2][4][3]=1
			moheItemNUM[2][4][4]=2
			-- LV45--60����8
			
			moheItemNUM[2][5][1]=5
			moheItemNUM[2][5][2]=3
			moheItemNUM[2][5][3]=1
			moheItemNUM[2][5][4]=10
			-- LV45--60����9
			
			moheItemNUM[2][6][1]=1
			moheItemNUM[2][6][2]=2
			moheItemNUM[2][6][3]=2
			moheItemNUM[2][6][4]=20
			
			-- LV45--60����10
			
			moheItemNUM[2][7][1]=1
			moheItemNUM[2][7][2]=1
			moheItemNUM[2][7][3]=1
			moheItemNUM[2][7][4]=2
			moheItemNUM[2][7][5]=1
			--LV45-60����8
			-- moheItemNUM[3][3][1]=5
			-- moheItemNUM[3][3][2]=1
			-- moheItemNUM[3][3][3]=1
			-- moheItemNUM[3][3][4]=10
			--LV45-60����9
			-- moheItemNUM[3][4][1]=1
			-- moheItemNUM[3][4][2]=1
			-- moheItemNUM[3][4][3]=2
			-- moheItemNUM[3][4][4]=20
			-- moheItemNUM[3][4][5]=1
			--LV45-60����10
			-- moheItemNUM[3][5][1]=1
			-- moheItemNUM[3][5][2]=1
			-- moheItemNUM[3][5][3]=1]]
--***
	local moheItem={}
	local moheItemNum={}
	local moheItemGL = {}
	local a ,b,c =0,0,0
	for a = 1,2,1 do 
		moheItem[a]={}
		moheItemNum[a]={}
		moheItemGL [a]= {}
		for b = 1,10,1 do 	
			moheItem[a][b]={}
			moheItemNum[a][b]={}
			moheItemGL [a][b]= {}
			for c = 1 , 6,1 do 
				moheItem[a][b][c]=0
				moheItemNum[a][b][c]=0
				moheItemGL [a][b][c]=0
			end
		end
	end
	--�������ݴӱ��и���
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	moheItem[1][1][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][1][1]=0.05	moheItemGL[1][1][1]=0.2	moheItem[1][2][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][2][1]=0.1	moheItemGL[1][2][1]=0.25	moheItem[1][3][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][3][1]=0.15	moheItemGL[1][3][1]=0.28	moheItem[1][4][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][4][1]=0.2	moheItemGL[1][4][1]=0.34	moheItem[1][5][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][5][1]=0.25	moheItemGL[1][5][1]=0.34	moheItem[1][6][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][6][1]=0.3	moheItemGL[1][6][1]=0.35	moheItem[1][7][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][7][1]=0.35	moheItemGL[1][7][1]=0.35	moheItem[1][8][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][8][1]=0.4	moheItemGL[1][8][1]=0.37	moheItem[1][9][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][9][1]=0.45	moheItemGL[1][9][1]=0.35	moheItem[1][10][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[1][10][1]=0.8	moheItemGL[1][10][1]=0.3
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	moheItem[1][1][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][1][2]=2	moheItemGL[1][1][2]=0.5	moheItem[1][2][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][2][2]=2	moheItemGL[1][2][2]=0.45	moheItem[1][3][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][3][2]=2	moheItemGL[1][3][2]=0.4	moheItem[1][4][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][4][2]=3	moheItemGL[1][4][2]=0.35	moheItem[1][5][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][5][2]=3	moheItemGL[1][5][2]=0.3	moheItem[1][6][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][6][2]=3	moheItemGL[1][6][2]=0.2	moheItem[1][7][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][7][2]=4	moheItemGL[1][7][2]=0.15	moheItem[1][8][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][8][2]=4	moheItemGL[1][8][2]=0.1	moheItem[1][9][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[1][9][2]=5	moheItemGL[1][9][2]=0.05			
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	moheItem[1][1][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][1][3]=1	moheItemGL[1][1][3]=0.3	moheItem[1][2][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][2][3]=1	moheItemGL[1][2][3]=0.3	moheItem[1][3][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][3][3]=1	moheItemGL[1][3][3]=0.3	moheItem[1][4][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][4][3]=1	moheItemGL[1][4][3]=0.27	moheItem[1][5][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][5][3]=1	moheItemGL[1][5][3]=0.25	moheItem[1][6][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][6][3]=1	moheItemGL[1][6][3]=0.2	moheItem[1][7][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][7][3]=1	moheItemGL[1][7][3]=0.2	moheItem[1][8][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][8][3]=1	moheItemGL[1][8][3]=0.15	moheItem[1][9][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][9][3]=1	moheItemGL[1][9][3]=0.1	moheItem[1][10][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[1][10][3]=1	moheItemGL[1][10][3]=0.05
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
							moheItem[1][3][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][3][4]=1	moheItemGL[1][3][4]=0.02	moheItem[1][4][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][4][4]=1	moheItemGL[1][4][4]=0.04	moheItem[1][5][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][5][4]=1	moheItemGL[1][5][4]=0.06	moheItem[1][6][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][6][4]=1	moheItemGL[1][6][4]=0.1	moheItem[1][7][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][7][4]=1	moheItemGL[1][7][4]=0.12	moheItem[1][8][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][8][4]=1	moheItemGL[1][8][4]=0.15	moheItem[1][9][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][9][4]=1	moheItemGL[1][9][4]=0.2	moheItem[1][10][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[1][10][4]=1	moheItemGL[1][10][4]=0.2
													CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
													CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
													CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
													CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
													CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
													CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
													moheItem[1][5][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[1][5][5]=1	moheItemGL[1][5][5]=0.05	moheItem[1][6][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[1][6][5]=1	moheItemGL[1][6][5]=0.15	moheItem[1][7][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[1][7][5]=1	moheItemGL[1][7][5]=0.18	moheItem[1][8][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[1][8][5]=1	moheItemGL[1][8][5]=0.23	moheItem[1][9][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[1][9][5]=1	moheItemGL[1][9][5]=0.25	moheItem[1][10][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[1][10][5]=1	moheItemGL[1][10][5]=0.3
																									CALCULATE_FUNCTIONS_LUA_000242 = GetResString("CALCULATE_FUNCTIONS_LUA_000242")
																									CALCULATE_FUNCTIONS_LUA_000243 = GetResString("CALCULATE_FUNCTIONS_LUA_000243")
																									moheItem[1][9][6]=CALCULATE_FUNCTIONS_LUA_000243	moheItemNum[1][9][6]=1	moheItemGL[1][9][6]=0.05	moheItem[1][10][6]=CALCULATE_FUNCTIONS_LUA_000242	moheItemNum[1][10][6]=1	moheItemGL[1][10][6]=0.1
																												moheItem[2][10][7]="35bb"	moheItemNum[2][10][7]=1	moheItemGL[2][10][7]=0.05
																														
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
	moheItem[2][1][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][1][1]=0.03	moheItemGL[2][1][1]=0.15	moheItem[2][2][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][2][1]=0.05	moheItemGL[2][2][1]=0.2	moheItem[2][3][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][3][1]=0.07	moheItemGL[2][3][1]=0.25	moheItem[2][4][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][4][1]=0.1	moheItemGL[2][4][1]=0.3	moheItem[2][5][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][5][1]=0.12	moheItemGL[2][5][1]=0.3	moheItem[2][6][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][6][1]=0.15	moheItemGL[2][6][1]=0.3	moheItem[2][7][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][7][1]=0.2	moheItemGL[2][7][1]=0.3	moheItem[2][8][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][8][1]=0.25	moheItemGL[2][8][1]=0.3	moheItem[2][9][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][9][1]=0.3	moheItemGL[2][9][1]=0.25	moheItem[2][10][1]=CALCULATE_EXP_AND_LEVEL_LUA_000047	moheItemNum[2][10][1]=0.35	moheItemGL[2][10][1]=0.2
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
	moheItem[2][1][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][1][2]=1	moheItemGL[2][1][2]=0.5	moheItem[2][2][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][2][2]=2	moheItemGL[2][2][2]=0.45	moheItem[2][3][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][3][2]=2	moheItemGL[2][3][2]=0.4	moheItem[2][4][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][4][2]=3	moheItemGL[2][4][2]=0.35	moheItem[2][5][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][5][2]=3	moheItemGL[2][5][2]=0.3	moheItem[2][6][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][6][2]=3	moheItemGL[2][6][2]=0.2	moheItem[2][7][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][7][2]=4	moheItemGL[2][7][2]=0.15	moheItem[2][8][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][8][2]=4	moheItemGL[2][8][2]=0.1	moheItem[2][9][2]=CALCULATE_FUNCTIONS_LUA_000238	moheItemNum[2][9][2]=5	moheItemGL[2][9][2]=0.05			
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
	moheItem[2][1][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][1][3]=1	moheItemGL[2][1][3]=0.3	moheItem[2][2][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][2][3]=1	moheItemGL[2][2][3]=0.3	moheItem[2][3][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][3][3]=1	moheItemGL[2][3][3]=0.3	moheItem[2][4][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][4][3]=1	moheItemGL[2][4][3]=0.27	moheItem[2][5][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][5][3]=1	moheItemGL[2][5][3]=0.25	moheItem[2][6][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][6][3]=1	moheItemGL[2][6][3]=0.2	moheItem[2][7][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][7][3]=1	moheItemGL[2][7][3]=0.2	moheItem[2][8][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][8][3]=1	moheItemGL[2][8][3]=0.1	moheItem[2][9][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][9][3]=1	moheItemGL[2][9][3]=0.1	moheItem[2][10][3]=CALCULATE_FUNCTIONS_LUA_000239	moheItemNum[2][10][3]=1	moheItemGL[2][10][3]=0.05
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
	moheItem[2][1][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][1][4]=1	moheItemGL[2][1][4]=0.05	moheItem[2][2][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][2][4]=1	moheItemGL[2][2][4]=0.05	moheItem[2][3][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][3][4]=1	moheItemGL[2][3][4]=0.05	moheItem[2][4][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][4][4]=1	moheItemGL[2][4][4]=0.08	moheItem[2][5][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][5][4]=1	moheItemGL[2][5][4]=0.1	moheItem[2][6][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][6][4]=1	moheItemGL[2][6][4]=0.15	moheItem[2][7][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][7][4]=1	moheItemGL[2][7][4]=0.15	moheItem[2][8][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][8][4]=1	moheItemGL[2][8][4]=0.2	moheItem[2][9][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][9][4]=1	moheItemGL[2][9][4]=0.25	moheItem[2][10][4]=CALCULATE_FUNCTIONS_LUA_000240	moheItemNum[2][10][4]=1	moheItemGL[2][10][4]=0.3
												CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
												CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
												CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
												CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
												CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
												CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
												moheItem[2][5][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[2][5][5]=1	moheItemGL[2][5][5]=0.05	moheItem[2][6][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[2][6][5]=1	moheItemGL[2][6][5]=0.15	moheItem[2][7][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[2][7][5]=1	moheItemGL[2][7][5]=0.15	moheItem[2][8][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[2][8][5]=1	moheItemGL[2][8][5]=0.2	moheItem[2][9][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[2][9][5]=1	moheItemGL[2][9][5]=0.25	moheItem[2][10][5]=CALCULATE_FUNCTIONS_LUA_000241	moheItemNum[2][10][5]=1	moheItemGL[2][10][5]=0.35
												CALCULATE_FUNCTIONS_LUA_000244 = GetResString("CALCULATE_FUNCTIONS_LUA_000244")
												CALCULATE_FUNCTIONS_LUA_000242 = GetResString("CALCULATE_FUNCTIONS_LUA_000242")
												CALCULATE_FUNCTIONS_LUA_000245 = GetResString("CALCULATE_FUNCTIONS_LUA_000245")
												CALCULATE_FUNCTIONS_LUA_000243 = GetResString("CALCULATE_FUNCTIONS_LUA_000243")
												moheItem[2][7][6]=CALCULATE_FUNCTIONS_LUA_000243	moheItemNum[2][7][6]=1	moheItemGL[2][7][6]=0.05	moheItem[2][8][6]=CALCULATE_FUNCTIONS_LUA_000245	moheItemNum[2][8][6]=1	moheItemGL[2][8][6]=0.1	moheItem[2][9][6]=CALCULATE_FUNCTIONS_LUA_000242	moheItemNum[2][9][6]=1	moheItemGL[2][9][6]=0.1	moheItem[2][10][6]=CALCULATE_FUNCTIONS_LUA_000244	moheItemNum[2][10][6]=1	moheItemGL[2][10][6]=0.1

	--�������
--**** ħ�п�Ǯ
	local moheMoney={}
	moheMoney[1]={}
	moheMoney[2]={}
	-- moheMoney[3]={}
	-- LV10-45
	moheMoney[1][1]=600	--��Ӧ�Ĵ�������Ҫ�Ľ�Ǯ
	moheMoney[1][2]=700
	moheMoney[1][3]=1100
	moheMoney[1][4]=1200
	moheMoney[1][5]=2000
	moheMoney[1][6]=2800
	moheMoney[1][7]=3600
	moheMoney[1][8]=5000
	moheMoney[1][9]=6000
	moheMoney[1][10]=7000
	-- LV45-60
	moheMoney[2][1]=2000
	moheMoney[2][2]=2200
	moheMoney[2][3]=2500
	moheMoney[2][4]=3000
	moheMoney[2][5]=3500
	moheMoney[2][6]=4000
	moheMoney[2][7]=4500
	moheMoney[2][8]=7000
	moheMoney[2][9]=8500
	moheMoney[2][10]=10000 
			
--STA��¼�ѿ�������
-- *****��Ʒ���������1-3��Ϊ1 ��4-7��Ϊ2 ��8��9��10�ηֱ�Ϊ3��4��5	
	local count1=count+1		--��Ӧ�Ĵ���ת����ʽ
	-- if count<=1   then 
		-- count1=1
	-- elseif count<=3   then 
		-- count1=2
	-- elseif count<=5   then
		-- count1=3
	-- elseif count==6   then 
		-- count1=4
	-- elseif count==7   then
		-- count1=5
	-- elseif count==8   then
		-- count1=6
	-- elseif count==9   then
		-- count1=7
	-- end	
-- *****
-- ******��Ǯ�ж���û�з��� 0����Ʒʹ��ʧ�ܣ��п۳���Ӧ��Ǯ
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if moheMoney[LVtype][count+1]>Money_Have   then
		CALCULATE_FUNCTIONS_LUA_000246 = GetResString("CALCULATE_FUNCTIONS_LUA_000246")
		CALCULATE_FUNCTIONS_LUA_000247 = GetResString("CALCULATE_FUNCTIONS_LUA_000247")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000247..moheMoney[LVtype][count+1]..CALCULATE_FUNCTIONS_LUA_000246)
		return 0
	end
	TakeMoney(role,nil,moheMoney[LVtype][count+1])
-- ******
-- *******���ݸ��ʸ�����Ʒ	
	local a=math.random( 1,100000)/100000
	local i=0
	local itemID= 1
	for i = 1,6,1 do
		if a <= moheItemGL[LVtype][count1][i]   then
			CALCULATE_EXP_AND_LEVEL_LUA_000047 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000047")
			if moheItem[LVtype][count1][i] ==CALCULATE_EXP_AND_LEVEL_LUA_000047   then
				itemID = GiveMoHeExp (role,moheItemNum[LVtype][count1][i])
			CALCULATE_FUNCTIONS_LUA_000238 = GetResString("CALCULATE_FUNCTIONS_LUA_000238")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000238   then
				itemID = GiveMoHeHF (role,moheItemNum[LVtype][count1][i])
			CALCULATE_FUNCTIONS_LUA_000239 = GetResString("CALCULATE_FUNCTIONS_LUA_000239")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000239   then
				itemID = GiveMoHeJiPiao (role)
			CALCULATE_FUNCTIONS_LUA_000240 = GetResString("CALCULATE_FUNCTIONS_LUA_000240")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000240   then
				itemID=  GiveMoHeEquip (role)
			CALCULATE_FUNCTIONS_LUA_000241 = GetResString("CALCULATE_FUNCTIONS_LUA_000241")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000241   then
				itemID = GiveMoHeSP(role)
			CALCULATE_FUNCTIONS_LUA_000242 = GetResString("CALCULATE_FUNCTIONS_LUA_000242")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000242   then
				GiveItem(role , 0, 6379 ,1, 4)
				itemID = 6379
			elseif moheItem[LVtype][count1][i] =="35bb"   then
				local roleJob=GetChaAttr(role, ATTR_JOB)
				local Cha_Num = GetChaTypeID( role )
				if roleJob==JOB_TYPE_JIANSHI and  Cha_Num ==1   then 
					moheItem[LVtype][count1][i]=3799
				elseif roleJob==JOB_TYPE_JIANSHI and  Cha_Num ==2   then 
					moheItem[LVtype][count1][i]=0770
				elseif roleJob==JOB_TYPE_JIANSHI and  Cha_Num ==3   then 
					moheItem[LVtype][count1][i]=3799
				elseif roleJob==JOB_TYPE_SHUANGJS   then
					moheItem[LVtype][count1][i]=3799
				elseif roleJob==JOB_TYPE_JUJS   then
					moheItem[LVtype][count1][i]=0770
				elseif roleJob==JOB_TYPE_QIYUANSHI or roleJob==JOB_TYPE_SHENGZHIZHE or roleJob==JOB_TYPE_FENGYINSHI   then
					moheItem[LVtype][count1][i]=0785
				elseif  roleJob==JOB_TYPE_LIEREN or roleJob==JOB_TYPE_JUJISHOU   then
					moheItem[LVtype][count1][i]=0781
				elseif roleJob==JOB_TYPE_MAOXIANZHE or roleJob==JOB_TYPE_HANGHAISHI    then
					moheItem[LVtype][count1][i]=0799
				else 
					moheItem[LVtype][count1][i]=0799
				end
				GiveItem(role , 0, moheItem[LVtype][count1][i] ,1, 4)
				itemID = moheItem[LVtype][count1][i]
			CALCULATE_FUNCTIONS_LUA_000244 = GetResString("CALCULATE_FUNCTIONS_LUA_000244")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000244   then
				GiveItem(role , 0, 1814 ,1, 4)
				itemID = 1814
			CALCULATE_FUNCTIONS_LUA_000243 = GetResString("CALCULATE_FUNCTIONS_LUA_000243")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000243   then
				GiveItem(role , 0, 6394 ,1, 4)
				itemID = 6394
			CALCULATE_FUNCTIONS_LUA_000245 = GetResString("CALCULATE_FUNCTIONS_LUA_000245")
			elseif moheItem[LVtype][count1][i] ==CALCULATE_FUNCTIONS_LUA_000245   then
				local b=math.random(1,5)
				itemID=221+b
				GiveItem(role , 0, itemID,1, 4)
			end
			break
		end
		moheItemGL[LVtype][count1][i+1]= moheItemGL[LVtype][count1][i]+moheItemGL[LVtype][count1][i+1]
	end			
	local scrollID={}
	scrollID[1]=0799
	scrollID[2]=0781
	scrollID[3]=0785
	scrollID[4]=0770
	scrollID[5]=3799
	scrollID[6]=3088
	scrollID[7]=222
	scrollID[8]=223
	scrollID[9]=224
	scrollID[10]=225
	scrollID[11]=226
	scrollID[12]=6394
	scrollID[13]=1814
	scrollID[14]=6379
	local scrolli=0
	for scrolli=1,14,1 do
		if itemID==scrollID[scrolli]   then
			local itemname = GetItemName ( itemID ) 
			local name = GetChaDefaultName(role)
			CALCULATE_FUNCTIONS_LUA_000248 = GetResString("CALCULATE_FUNCTIONS_LUA_000248")
			ScrollNotice(name..CALCULATE_FUNCTIONS_LUA_000248..itemname.." .", 1 )
		end
		return
	end
end


function Give_Box ( role )
	--local Now_Month = os.date ("%m")
 	local now_day= os.date("%d")
	local now_day_num = tonumber(now_day)
	--local now_month_num = tonumber(Now_Month)
	--local day = 0
	--day = now_month_num*100+now_day_num
	
	GiveItem ( role , 0 , 6378 , 1 , 4 )
	Box_Attr = GetChaItem2 (  role , 2 , 6378 )
	SetItemAttr(Box_Attr, ITEMATTR_VAL_STR, 0)	--��������
	SetItemAttr(Box_Attr, ITEMATTR_VAL_AGI, 0)	--�;�
	SetItemAttr(Box_Attr, ITEMATTR_VAL_STA, 0)	--��������
end

-----------------------------------------------�����߲����õ�������
function GiveItem_SetAttr (character,p1,p2,p3,p4,p5,p6)		--p1������ID,p2=����,p3=BUFF����,p4=BUFF����ʱ��,p5=��ʱ��,p6=BUFF�ȼ�
	local haveItem1= CheckBagItem(character,6370)
	if haveItem1 ~=0   then
		CALCULATE_FUNCTIONS_LUA_000249 = GetResString("CALCULATE_FUNCTIONS_LUA_000249")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000249)
		return LUA_FALSE
	end
	local Item_SBNum2 = CheckBagItem( character, 6371 )
	if Item_SBNum2 ~=0   then
		CALCULATE_FUNCTIONS_LUA_000249 = GetResString("CALCULATE_FUNCTIONS_LUA_000249")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000249)
		return LUA_FALSE
	end
	
	 -- local p = GetChaAttr ( character ,ATTR_EXTEND6 )
	

	

	
	-- if p < p3*p4   then
		-- SystemNotice ( character ,"TMTMTMTMTMTMTTM��" )
		-- return LUA_FALSE
	-- end
	-- p = p - p3*p2
	local p = GetChaAttr ( character ,ATTR_EXTEND6 )
	local pp = GetChaAttr ( character ,ATTR_EXTEND6 )
	pp = pp + p4*p3
	SetChaAttr( character , ATTR_EXTEND6 , pp )
	if p3 == 1 and p6==1   then 
		CALCULATE_FUNCTIONS_LUA_000250 = GetResString("CALCULATE_FUNCTIONS_LUA_000250")
		CALCULATE_FUNCTIONS_LUA_000251 = GetResString("CALCULATE_FUNCTIONS_LUA_000251")
		SystemNotice (character ,CALCULATE_FUNCTIONS_LUA_000251..p4..CALCULATE_FUNCTIONS_LUA_000250)
	elseif p3 == 3   then
		CALCULATE_FUNCTIONS_LUA_000252 = GetResString("CALCULATE_FUNCTIONS_LUA_000252")
		CALCULATE_FUNCTIONS_LUA_000251 = GetResString("CALCULATE_FUNCTIONS_LUA_000251")
		SystemNotice ( character ,CALCULATE_FUNCTIONS_LUA_000251..p4..CALCULATE_FUNCTIONS_LUA_000252)
	end
	-- SystemNotice (character ,"�ҽ����񣡣�����")
	GiveItem ( character , 0 , p1  , 1 , 4 )
	item = GetChaItem2 (  character , 2 , p1 )
	SetItemAttr(item, ITEMATTR_VAL_STR, p2)
	SetItemAttr(item, ITEMATTR_VAL_AGI, p3)
	SetItemAttr(item, ITEMATTR_VAL_DEX, p4)
	SetItemAttr(item, ITEMATTR_VAL_CON, p5)
	SetItemAttr(item, ITEMATTR_VAL_STA, p6)
	-- SystemNotice (character , " p1 =="..p1.." p2 =="..p2.." p3 =="..p3.." p4 =="..p4.." p5 =="..p5.." p6 =="..p6)
	
	
	
	if p6 == 4   then											--Ũ��4��
		p = p + 5
		CALCULATE_FUNCTIONS_LUA_000253 = GetResString("CALCULATE_FUNCTIONS_LUA_000253")
		CALCULATE_FUNCTIONS_LUA_000254 = GetResString("CALCULATE_FUNCTIONS_LUA_000254")
		SystemNotice (character ,CALCULATE_FUNCTIONS_LUA_000254..p4..CALCULATE_FUNCTIONS_LUA_000253)
		SetChaAttr( character , ATTR_EXTEND6 , p )
		return LUA_TRUE
	end
	if p6 == 7   then		--Ũ��7��
		CALCULATE_FUNCTIONS_LUA_000255 = GetResString("CALCULATE_FUNCTIONS_LUA_000255")
		CALCULATE_FUNCTIONS_LUA_000254 = GetResString("CALCULATE_FUNCTIONS_LUA_000254")
		SystemNotice (character ,CALCULATE_FUNCTIONS_LUA_000254..p4..CALCULATE_FUNCTIONS_LUA_000255)
		p = 10
		SetChaAttr( character , ATTR_EXTEND6 , 10 )
	end
	return LUA_TRUE
	
end
function ShuangBei_TimeChaxun (role)       -----��ѯʣ��˫��ʱ��
	local ppp = GetChaAttr (role ,ATTR_EXTEND6)
	local ppp=10-ppp
	CALCULATE_FUNCTIONS_LUA_000256 = GetResString("CALCULATE_FUNCTIONS_LUA_000256")
	CALCULATE_FUNCTIONS_LUA_000257 = GetResString("CALCULATE_FUNCTIONS_LUA_000257")
	SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000257..ppp..CALCULATE_FUNCTIONS_LUA_000256)
	
end

------------------------------------------------------------ʣ��˫��ʱ��
function ShuangBei_Time (role , p1 ,p2 )			--p1 ʱ��
	local p = GetChaAttr (role ,ATTR_EXTEND6)    ----------ϵͳʣ��˫��ʱ��ӿ�
	p = 10 - p
	if p < p1*p2   then
		CALCULATE_FUNCTIONS_LUA_000258 = GetResString("CALCULATE_FUNCTIONS_LUA_000258")
		SystemNotice (role , CALCULATE_FUNCTIONS_LUA_000258)
		return LUA_FALSE
	end
	if p ~= 0   then
		return LUA_TRUE
	else
		CALCULATE_FUNCTIONS_LUA_000259 = GetResString("CALCULATE_FUNCTIONS_LUA_000259")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000259)
		return LUA_FALSE
	end
end

------------------------------ʱ��洢
function ShuangBei_ChunChu (role)
	-- SystemNotice (role ,"��NND������")
	local p = GetChaAttr (role ,ATTR_EXTEND6)
	-- SystemNotice ( role , " �洢ǰʱ��=========".. p)
	GiveItem ( role , 0 , 6373  , 1 , 4 )
	local Have_pingzi = GetChaItem2 (  role , 2 , 6373)
	p = 10 - p
	-- SystemNotice ( role , " p=========".. p)
	SetItemAttr(Have_pingzi, ITEMATTR_VAL_STR, p  )	--ʣ��ʱ��
	-- local pp=GetItemAttr( Have_pingzi, ITEMATTR_VAL_STR)
	-- SystemNotice ( role , " p========="..pp)
	SynChaKitbag(role,13)
	SetChaAttr ( role , ATTR_EXTEND6 , 10 )
	-- SystemNotice (role ,"��TMMD��ȥ��")
end


function zhouRi(role) 
	local now_month= os.date("%m")		-------------��
	local now_day= os.date("%d")		-------------��
	local now_week= os.date("%w")
	local now_year= os.date("%y")	-------------��
	local now_year_num=tonumber(now_year)
	local now_month_num= tonumber(now_month)		-------------��
	local now_day_num= tonumber(now_day)			-------------��
	local now_week_num= tonumber(now_week)
	local zhouRi = now_day_num + 7 - now_week_num  
	if now_month_num==1 or now_month_num==3 or now_month_num==5 or now_month_num==7 or now_month_num==8 or now_month_num==10 or now_month_num==12   then	
		if zhouRi >31   then
		zhouRi=zhouRi-31
		end 
	end
		

	if now_month_num==4 or now_month_num==6 or now_month_num==9 or now_month_num==11   then
		if zhouRi >30   then
			zhouRi=zhouRi-30
		end
	end

	if now_month_num==2   then
		if (math.fmod(now_year_num,4)==0 and math.fmod(now_year_num,100)~=0) or (math.fmod(now_year_num,400)==0)   then
			if zhouRi>29   then
				zhouRi=zhouRi-29
			end
		else 
			if zhouRi >28   then
				zhouRi=zhouRi-28
			end
		end
	end
	return zhouRi
end


function CanZhanBu(role,p1)
	if ValidCha(p1)==0   then 
		p1 = JParg[1]
	end
	JParg[1] = p1
	if p1 ==1   then 
	elseif p1==2   then 
		local ret = HasMoney(role , 20000)
		if ret== 0   then 
			CALCULATE_FUNCTIONS_LUA_000260 = GetResString("CALCULATE_FUNCTIONS_LUA_000260")
			return CALCULATE_FUNCTIONS_LUA_000260
		end
	elseif p1==3   then 
		local ret = HasMoney(role , 100000)
		local ret1 = HasMoney(role , 20000)
		if ret == 0    then 
			if ret1 == 1   then 
				CALCULATE_FUNCTIONS_LUA_000261 = GetResString("CALCULATE_FUNCTIONS_LUA_000261")
				return CALCULATE_FUNCTIONS_LUA_000261
			else 
				CALCULATE_FUNCTIONS_LUA_000262 = GetResString("CALCULATE_FUNCTIONS_LUA_000262")
				return CALCULATE_FUNCTIONS_LUA_000262
			end
		end	
	elseif p1==4   then
		local ret =CheckBagItem(role ,6379)
		if ret== 0   then 
			CALCULATE_FUNCTIONS_LUA_000263 = GetResString("CALCULATE_FUNCTIONS_LUA_000263")
			return CALCULATE_FUNCTIONS_LUA_000263
		end
	elseif p1==5   then	
		local ret =CheckBagItem(role ,6379)
		if ret== 0   then 
			CALCULATE_FUNCTIONS_LUA_000263 = GetResString("CALCULATE_FUNCTIONS_LUA_000263")
			return CALCULATE_FUNCTIONS_LUA_000263
		end
	elseif p1==6   then
		local ret =CheckBagItem(role ,6379)
		if ret== 0   then 
			CALCULATE_FUNCTIONS_LUA_000263 = GetResString("CALCULATE_FUNCTIONS_LUA_000263")
			return CALCULATE_FUNCTIONS_LUA_000263
		end
	else	
		CALCULATE_FUNCTIONS_LUA_000264 = GetResString("CALCULATE_FUNCTIONS_LUA_000264")
		return CALCULATE_FUNCTIONS_LUA_000264
	end
	local now_day= os.date("%d")
	now_day= tonumber(now_day)
	local ZBday = GetChaAttr(role,ATTR_EXTEND2)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)
	local ZBNMain= math.fmod(ZBMain,10 )
	if now_day==ZBday and (ZBMain==-1 or ZBMain==-2 )  then
		CALCULATE_FUNCTIONS_LUA_000265 = GetResString("CALCULATE_FUNCTIONS_LUA_000265")
		return CALCULATE_FUNCTIONS_LUA_000265
	end
	if p1==4   then 
		p1= 6
	end
	if now_day==ZBday and p1 <= ZBNType   then
		local zhanBuFalse={}
			CALCULATE_FUNCTIONS_LUA_000266 = GetResString("CALCULATE_FUNCTIONS_LUA_000266")
			zhanBuFalse[1]=CALCULATE_FUNCTIONS_LUA_000266
			CALCULATE_FUNCTIONS_LUA_000267 = GetResString("CALCULATE_FUNCTIONS_LUA_000267")
			zhanBuFalse[2]=CALCULATE_FUNCTIONS_LUA_000267
			CALCULATE_FUNCTIONS_LUA_000268 = GetResString("CALCULATE_FUNCTIONS_LUA_000268")
			zhanBuFalse[3]=CALCULATE_FUNCTIONS_LUA_000268
			CALCULATE_FUNCTIONS_LUA_000268 = GetResString("CALCULATE_FUNCTIONS_LUA_000268")
			zhanBuFalse[4]=CALCULATE_FUNCTIONS_LUA_000268
			CALCULATE_FUNCTIONS_LUA_000268 = GetResString("CALCULATE_FUNCTIONS_LUA_000268")
			zhanBuFalse[5]=CALCULATE_FUNCTIONS_LUA_000268
			CALCULATE_FUNCTIONS_LUA_000269 = GetResString("CALCULATE_FUNCTIONS_LUA_000269")
			zhanBuFalse[6]=CALCULATE_FUNCTIONS_LUA_000269
		return zhanBuFalse[ZBNType]
	end
	return 1
end
function CanZhanBubyRole(role)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)
	local ZBNMain= math.fmod(ZBMain,10 )
	local p1 = ZBNType+1
	if p1 >6   then 
		p1= 6
	end
	local ret = CanZhanBu (role,p1)
	return ret
	
end
function ZhanBubyRole(role)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)
	local ZBNMain= math.fmod(ZBMain,10 )
	local p1 = ZBNType+1
	if p1 >6   then 
		p1= 6
	end
	ZhanBu (role,p1)
	return 1
end
function GetZhanBuInfo(role)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)
	if ZBNType== 0   then 
		CALCULATE_FUNCTIONS_LUA_000270 = GetResString("CALCULATE_FUNCTIONS_LUA_000270")
		return CALCULATE_FUNCTIONS_LUA_000270
	elseif ZBNType==1   then 
		CALCULATE_FUNCTIONS_LUA_000271 = GetResString("CALCULATE_FUNCTIONS_LUA_000271")
		return CALCULATE_FUNCTIONS_LUA_000271
	elseif ZBNType==2   then 
		CALCULATE_FUNCTIONS_LUA_000272 = GetResString("CALCULATE_FUNCTIONS_LUA_000272")
		return CALCULATE_FUNCTIONS_LUA_000272
	elseif ZBNType==3   then
		CALCULATE_FUNCTIONS_LUA_000273 = GetResString("CALCULATE_FUNCTIONS_LUA_000273")
		return CALCULATE_FUNCTIONS_LUA_000273
	elseif ZBNType==4   then	
		CALCULATE_FUNCTIONS_LUA_000274 = GetResString("CALCULATE_FUNCTIONS_LUA_000274")
		return CALCULATE_FUNCTIONS_LUA_000274
	elseif ZBNType==5   then
		CALCULATE_FUNCTIONS_LUA_000275 = GetResString("CALCULATE_FUNCTIONS_LUA_000275")
		return CALCULATE_FUNCTIONS_LUA_000275
	else 
		CALCULATE_FUNCTIONS_LUA_000276 = GetResString("CALCULATE_FUNCTIONS_LUA_000276")
		return CALCULATE_FUNCTIONS_LUA_000276
	end
end

function ZhanBu (role,p1)    -------p1 1������ͨռ�� 2��������ռ�� 3����RMBռ��
	if p1==2   then 
		TakeMoney(role ,CurNpc,20000)
	elseif p1==3   then 
		TakeMoney(role ,CurNpc,100000)
	elseif p1==4   then
		RemoveChaItem(role ,6379,1,0,-1,2,1)
	elseif p1==5   then	
		RemoveChaItem(role ,6379,1,0,-1,2,1)
	elseif p1==6   then
		RemoveChaItem(role ,6379,1,0,-1,2,1)
	elseif p1==1   then
	else
		CALCULATE_FUNCTIONS_LUA_000264 = GetResString("CALCULATE_FUNCTIONS_LUA_000264")
		return CALCULATE_FUNCTIONS_LUA_000264
	end
	local ZBStateBGL = {}
		ZBStateBGL[1] = {}
		ZBStateBGL[2] = {}
		ZBStateBGL[3] = {}
		ZBStateBGL[4] = {}
		ZBStateBGL[5] = {}
		ZBStateBGL[6] = {}
ZBStateBGL[1][1] = 50	ZBStateBGL[2][1] = 50	ZBStateBGL[3][1] = 50	ZBStateBGL[4][1] = 55	ZBStateBGL[5][1] = 55	ZBStateBGL[6][1] = 55
ZBStateBGL[1][2] = 80	ZBStateBGL[2][2] = 80	ZBStateBGL[3][2] = 80	ZBStateBGL[4][2] = 85	ZBStateBGL[5][2] = 95	ZBStateBGL[6][2] = 105
ZBStateBGL[1][3] = 240	ZBStateBGL[2][3] = 240	ZBStateBGL[3][3] = 240	ZBStateBGL[4][3] = 240	ZBStateBGL[5][3] = 230	ZBStateBGL[6][3] = 230
ZBStateBGL[1][4] = 400	ZBStateBGL[2][4] = 400	ZBStateBGL[3][4] = 390	ZBStateBGL[4][4] = 380	ZBStateBGL[5][4] = 365	ZBStateBGL[6][4] = 355
ZBStateBGL[1][5] = 450	ZBStateBGL[2][5] = 450	ZBStateBGL[3][5] = 440	ZBStateBGL[4][5] = 430	ZBStateBGL[5][5] = 415	ZBStateBGL[6][5] = 415
ZBStateBGL[1][6] = 610	ZBStateBGL[2][6] = 610	ZBStateBGL[3][6] = 590	ZBStateBGL[4][6] = 570	ZBStateBGL[5][6] = 550	ZBStateBGL[6][6] = 540
ZBStateBGL[1][7] = 650	ZBStateBGL[2][7] = 650	ZBStateBGL[3][7] = 670	ZBStateBGL[4][7] = 690	ZBStateBGL[5][7] = 690	ZBStateBGL[6][7] = 700
ZBStateBGL[1][8] = 810	ZBStateBGL[2][8] = 810	ZBStateBGL[3][8] = 820	ZBStateBGL[4][8] = 830	ZBStateBGL[5][8] = 825	ZBStateBGL[6][8] = 825
ZBStateBGL[1][9] = 970	ZBStateBGL[2][9] = 970	ZBStateBGL[3][9] = 970	ZBStateBGL[4][9] = 970	ZBStateBGL[5][9] = 960	ZBStateBGL[6][9] = 950
ZBStateBGL[1][10] = 1000	ZBStateBGL[2][10] = 1000	ZBStateBGL[3][10] = 1000	ZBStateBGL[4][10] = 1000	ZBStateBGL[5][10] = 1000	ZBStateBGL[6][10] = 1000		
	local ZBStateLVGL = {}
		ZBStateLVGL[1] = {}
		ZBStateLVGL[1][0] = 0
		ZBStateLVGL[1][1] = 15											
		ZBStateLVGL[1][2] = 25												
		ZBStateLVGL[1][3] = 30												
		ZBStateLVGL[1][4] = 32												
		ZBStateLVGL[1][5] = 33												
		ZBStateLVGL[2] = {}
		ZBStateLVGL[2][0] = 0
		ZBStateLVGL[2][1] = 30								
		ZBStateLVGL[2][2] = 68												
		ZBStateLVGL[2][3] = 104												
		ZBStateLVGL[2][4] = 194												
		ZBStateLVGL[2][5] = 1000
		ZBStateLVGL[3] = {}
		ZBStateLVGL[3][0] = 0
		ZBStateLVGL[3][1] = 100								
		ZBStateLVGL[3][2] = 100												
		ZBStateLVGL[3][3] = 100												
		ZBStateLVGL[3][4] = 100												
		ZBStateLVGL[3][5] = 100
		ZBStateLVGL[4] = {}
		ZBStateLVGL[4][0] = 0
		ZBStateLVGL[4][1] = 1								
		ZBStateLVGL[4][2] = 2												
		ZBStateLVGL[4][3] = 4												
		ZBStateLVGL[4][4] = 10												
		ZBStateLVGL[4][5] = 20									
		ZBStateLVGL[5] = {}
		ZBStateLVGL[5][0] = 0
		ZBStateLVGL[5][1] = 50								
		ZBStateLVGL[5][2] = 80												
		ZBStateLVGL[5][3] = 95												
		ZBStateLVGL[5][4] = 100												
		ZBStateLVGL[5][5] = 100	
		ZBStateLVGL[6] = {}
		ZBStateLVGL[6][0] = 0
		ZBStateLVGL[6][1] = 20								
		ZBStateLVGL[6][2] = 65												
		ZBStateLVGL[6][3] = 90												
		ZBStateLVGL[6][4] = 100												
		ZBStateLVGL[6][5] = 100
		ZBStateLVGL[7] = {}
		ZBStateLVGL[7][0] = 0
		ZBStateLVGL[7][1] = 100								
		ZBStateLVGL[7][2] = 100												
		ZBStateLVGL[7][3] = 100												
		ZBStateLVGL[7][4] = 100												
		ZBStateLVGL[7][5] = 100
		ZBStateLVGL[8] = {}
		ZBStateLVGL[8][0] = 0
		ZBStateLVGL[8][1] = 100								
		ZBStateLVGL[8][2] = 100												
		ZBStateLVGL[8][3] = 100												
		ZBStateLVGL[8][4] = 100												
		ZBStateLVGL[8][5] = 100											
		ZBStateLVGL[9] = {}
		ZBStateLVGL[9][0] = 0
		ZBStateLVGL[9][1] = 100								
		ZBStateLVGL[9][2] = 100												
		ZBStateLVGL[9][3] = 100												
		ZBStateLVGL[9][4] = 100												
		ZBStateLVGL[9][5] = 100
		ZBStateLVGL[10] = {}
		ZBStateLVGL[10][0] = 0
		ZBStateLVGL[10][1] = 100								
		ZBStateLVGL[10][2] = 100												
		ZBStateLVGL[10][3] = 100												
		ZBStateLVGL[10][4] = 100												
		ZBStateLVGL[10][5] = 1
	local now_day= os.date("%d")
	now_day= tonumber(now_day)
	local ZBday = GetChaAttr(role,ATTR_EXTEND2)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)
	local ZBNMain= math.fmod(ZBMain,10 )
	local RDa= math.random (1,100)
	if p1 <=  ZBNType and p1 ==4   then  
		 p1 = ZBNType+1
	end
	if p1>=4 and p1<=6   then   --��4��6�� �ܹ���5%��������EXP���Ӻ�Ŭ��ʹ��Ч������
		if RDa>70 and RDa<75   then
			local a = math.random (1,3)
			if a == 1   then 
				RDa = ZBStateBGL[p1][1]
			else 
				RDa = ZBStateBGL[p1][7]
			end
		end
	end		
	local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
	local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
	local ZBstate2=math.fmod(ZBstate,10)
	local state= 0
	local statelv=0
	SetChaAttr(role,ATTR_EXTEND0,0)
	SetChaAttr(role, ATTR_EXTEND1,0)
	SetChaAttr(role, ATTR_EXTEND2,0)
 	if RDa<=70   then 
		if ZBday==now_day and ZBMain~=0   then	
			if ZBstate2==4 and ZBNMain== 0    then
				local statelv_ZBMAXHP = GetChaStateLv ( role , STATE_ZBMOVE )
				if statelv_ZBMAXHP ~=0   then	
					RemoveState ( role , STATE_ZBMOVE )			
				end
			end
			if ZBstate2==5 and ZBNMain== 0   then		
				local statelv_ZBMAXHP = GetChaStateLv ( role , STATE_ZBHP )
				if statelv_ZBMAXHP ~=0   then
					RemoveState ( role , STATE_ZBHP ) 
				end
			end
			if ZBstate2==6 and ZBNMain== 0   then
				local statelv_ZBMAXHP = GetChaStateLv ( role , STATE_ZBSP )
				if statelv_ZBMAXHP ~=0   then
					RemoveState ( role , STATE_ZBSP ) 
				end
			end	
		end
		local RDb= math.random(1,ZBStateBGL[p1][10])
		local zhanbuBN={}
			CALCULATE_FUNCTIONS_LUA_000277 = GetResString("CALCULATE_FUNCTIONS_LUA_000277")
			zhanbuBN[1]=CALCULATE_FUNCTIONS_LUA_000277
			CALCULATE_FUNCTIONS_LUA_000278 = GetResString("CALCULATE_FUNCTIONS_LUA_000278")
			zhanbuBN[2]=CALCULATE_FUNCTIONS_LUA_000278
			CALCULATE_FUNCTIONS_LUA_000279 = GetResString("CALCULATE_FUNCTIONS_LUA_000279")
			zhanbuBN[3]=CALCULATE_FUNCTIONS_LUA_000279
			CALCULATE_FUNCTIONS_LUA_000280 = GetResString("CALCULATE_FUNCTIONS_LUA_000280")
			zhanbuBN[4]=CALCULATE_FUNCTIONS_LUA_000280
			CALCULATE_FUNCTIONS_LUA_000281 = GetResString("CALCULATE_FUNCTIONS_LUA_000281")
			zhanbuBN[5]=CALCULATE_FUNCTIONS_LUA_000281
			CALCULATE_FUNCTIONS_LUA_000282 = GetResString("CALCULATE_FUNCTIONS_LUA_000282")
			zhanbuBN[6]=CALCULATE_FUNCTIONS_LUA_000282
			CALCULATE_FUNCTIONS_LUA_000283 = GetResString("CALCULATE_FUNCTIONS_LUA_000283")
			zhanbuBN[7]=CALCULATE_FUNCTIONS_LUA_000283
			CALCULATE_FUNCTIONS_LUA_000284 = GetResString("CALCULATE_FUNCTIONS_LUA_000284")
			zhanbuBN[8]=CALCULATE_FUNCTIONS_LUA_000284
			CALCULATE_FUNCTIONS_LUA_000285 = GetResString("CALCULATE_FUNCTIONS_LUA_000285")
			zhanbuBN[9]=CALCULATE_FUNCTIONS_LUA_000285
			CALCULATE_FUNCTIONS_LUA_000286 = GetResString("CALCULATE_FUNCTIONS_LUA_000286")
			zhanbuBN[10]=CALCULATE_FUNCTIONS_LUA_000286
		local i=0
		for i=1,10,1 do
			if RDb<= ZBStateBGL[p1][i]   then
				if i==7   then
					local lv=GetChaAttr(role,ATTR_LV)
					if lv<15    then
						ZhanBu (role,p1)
						return
					end
				end 
				SystemNotice(role,zhanbuBN[i])
				state = i
				break
			end
		end
		local RDc = math.random (1,ZBStateLVGL[state][5])
		local j=0
		for j=1,5,1 do
			if RDc<= ZBStateLVGL[state][j]   then
				statelv = j
				break
			end	
		end
		state=statelv*10+state
		SetChaAttr(role, ATTR_EXTEND1,state)
		ZBMain=p1*10
		SetChaAttr(role, ATTR_EXTEND0,ZBMain)
		SetChaAttr(role,ATTR_EXTEND2,now_day)
		SetChaAttr(role,ATTR_EXTEND7,2880)
		return LUA_TRUE
	end
	if RDa==100 and haveNSD==0   then
		local Now_hour = os.date("%H") 
		local now_day=os.date("%d")  
		now_hour=tonumber(now_hour)  
		now_day=tonumber(now_day)  
		SetChaAttr(role, ATTR_EXTEND0,-1) 
		SetChaAttr(role,ATTR_EXTEND2,now_day)
		SetChaAttr(role,ATTR_EXTEND1,0)
		SetChaAttr(role,ATTR_EXTEND7,2880)
		CALCULATE_FUNCTIONS_LUA_000287 = GetResString("CALCULATE_FUNCTIONS_LUA_000287")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000287)
		local retbag = HasLeaveBagGrid( role, 1)
		if retbag ~= LUA_TRUE   then
			CALCULATE_FUNCTIONS_LUA_000288 = GetResString("CALCULATE_FUNCTIONS_LUA_000288")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000288)
			return LUA_TRUE
		end
		GiveItem(role,0,6376,1,22)
		local name = GetChaDefaultName(role)
		CALCULATE_FUNCTIONS_LUA_000289 = GetResString("CALCULATE_FUNCTIONS_LUA_000289")
		ScrollNotice(name..CALCULATE_FUNCTIONS_LUA_000289, 1 )
		CALCULATE_FUNCTIONS_LUA_000290 = GetResString("CALCULATE_FUNCTIONS_LUA_000290")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000290)		 
		local dunpai=GetChaItem2(role,2,6376)  
		SetItemAttr(dunpai,ITEMATTR_VAL_AGI,now_day) 
		SetItemAttr(dunpai,ITEMATTR_VAL_CON,240)
		haveNSD=1
		return 1
	end	
		----��Ů�����
	if RDa<=100   then
		CALCULATE_FUNCTIONS_LUA_000291 = GetResString("CALCULATE_FUNCTIONS_LUA_000291")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000291 )
		ZBMain=p1*10+1
		SetChaAttr(role, ATTR_EXTEND0,ZBMain)
		SetChaAttr(role,ATTR_EXTEND2,now_day)
		SetChaAttr(role,ATTR_EXTEND1,0)
		
	end	
	SetChaAttr(role,ATTR_EXTEND7,2880)  --24*60*2
	return LUA_TRUE
end
	


---------------------------------------------------���������������ж�
function CheckItemAttr( role , p1, p2)----item_csk�����߱��
	local ItemAttr={}
	ItemAttr[1]=ITEMATTR_VAL_STR    ----  ս�ӱ��
	ItemAttr[2]=ITEMATTR_VAL_AGI    ----  �������
	ItemAttr[3]=ITEMATTR_VAL_DEX    ----  �ִα��
	local item_num = 0
	local item = 0	
	item_num = CheckBagItem(  role , p1  )		--��鱳����p1�ŵ��ߵ�����
	
	if item_num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000292 = GetResString("CALCULATE_FUNCTIONS_LUA_000292")
		SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000292)
		return LUA_FALSE
	else
		item = GetChaItem2 (  role , 2 , p1 )-----------------ȡ����ָ��
		local itemattr = GetItemAttr(item, ItemAttr[3])--------ȡ���ߵ�p2����
		if p2 == 3 and itemattr == 3   then
			return LUA_TRUE
		elseif p2 == 4 and itemattr == 4   then
			return LUA_TRUE
		elseif p2 == 5 and itemattr == 5   then
			return LUA_TRUE
		end
		if itemattr >= 0 and itemattr < 3   then
			CALCULATE_FUNCTIONS_LUA_000293 = GetResString("CALCULATE_FUNCTIONS_LUA_000293")
			SystemNotice(role, CALCULATE_FUNCTIONS_LUA_000293)
			return LUA_FALSE			
		end
	end
end
--------------׷���ִ�	by eric 2008.7.15

local temp33 = 0
local temp34 = 0
function Refresh_Round ()
	local i = 8							--��
	local Now_Day = GetNowDay()		--��
	local Now_Time = GetNowTime()	--Сʱ
	local Now_Round = GetAmphitheaterRound()
	local Now_Season = GetAmphitheaterSeason()

	for i = 8,31,3 do
		if Now_Day == i and Now_Time ==22 and temp33 ~= 1   then
			Now_Round = Now_Round + 1
			UpdateAmphitheaterRound(Now_Season,Now_Round)
			temp33 = 1
			return
		end
		if Now_Day >= i and Now_Time >=23 and temp33 == 1   then
			temp33 = 0
		end
	end
end

--------------�������������ʱ���ж�		by eric 2008.7.15

function Can_Match ()
	local Now_Day = GetNowDay()	--��
	local Now_Time = GetNowTime()	--Сʱ
	local i = 8						--��
	--Notice ("Now_Day===="..Now_Day)
	--Notice ("Now_Time===="..Now_Time)
	for i = 8 , 31 , 3  do
		if Now_Day == i   then
			if Now_Time >= 19 and Now_Time <= 22   then			
				return 1
			else
				return 3
			end
		elseif Now_Day == i + 1   then
			return 2
		elseif Now_Day == i + 2   then
			if Now_Time <= 22   then			
				return 2
			elseif Now_Time == 23   then			
				return 3
			end
		end
	end
end
--׷�Ӿ����������ź��ִ�
function AddSeasonNumatArena()
	
	local Now_Season_Num = GetAmphitheaterSeason()	
	local Set_Season_Num = Now_Season_Num+1	
	local Now_Day = GetNowDay()	--��
	local Now_Time = GetNowTime()	--Сʱ	
	if Now_Day == 1 and Now_Time == 0 and temp34 == 0   then		
		DisuseAmphitheaterSeason(Now_Season_Num,1,nil)		
		AddAmphitheaterSeason(Set_Season_Num)
		temp34 = 1		
		return	
	elseif Now_Day == 1 and Now_Time > 0 and temp34 ~= 0   then
		temp34 = 0			
		return
	end	
end
-----------������
function Get_Can_Rebirth (character)
	local Get_Match = Can_Match()
	local ReliveStateNum = CloseReliveByState()
	if ReliveStateNum == 4   then		
		CALCULATE_FUNCTIONS_LUA_000294 = GetResString("CALCULATE_FUNCTIONS_LUA_000294")
		SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000294)
		return	LUA_FALSE
	elseif Get_Match == 2   then
		CALCULATE_FUNCTIONS_LUA_000295 = GetResString("CALCULATE_FUNCTIONS_LUA_000295")
		SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000295)
		return LUA_TRUE
	elseif Get_Match == 3   then		
		CALCULATE_FUNCTIONS_LUA_000296 = GetResString("CALCULATE_FUNCTIONS_LUA_000296")
		SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000296)
		return LUA_FALSE		
	end
end
----ȡ�������������ʱ��

function Get_Can_Match (character)
	local Get_Match = Can_Match()
	if Get_Match == 1   then
		return LUA_TRUE
	else
		CALCULATE_FUNCTIONS_LUA_000297 = GetResString("CALCULATE_FUNCTIONS_LUA_000297")
		SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000297)
		return LUA_FALSE
	end
end


------------------ȡ����	by eric 2008.7.15
function GetNowDay ( )
	local now_day= os.date("%d")
	local Now_DayNum = tonumber(now_day)
	return Now_DayNum
end

-----------------����������ʱ���ж�	by eric 2008.7.15
function Can_Sign_Up ()
	local Now_Day = GetNowDay ()	--��
	if Now_Day >= 1 and Now_Day <= 7   then
		return 1
	else
		return 0
	end	
end

--[   ������      �жϵ�ǰ��ɫ�Ƿ�Ϊ���״̬   ]--     NpcSdk , MissionSdkע��  by - dean
function CheckIsTeamor(character)
	local Teamplayer = {}
		Teamplayer[1] = GetTeamCha( character, 0 )
		Teamplayer[2] = GetTeamCha( character, 1 )
		Teamplayer[3] = GetTeamCha( character, 2 )
		Teamplayer[4] = GetTeamCha( character, 3 )
	local i = 1
	for i = 1 , 4 , 1 do
		if Teamplayer[i] ~= nil   then
			CALCULATE_FUNCTIONS_LUA_000298 = GetResString("CALCULATE_FUNCTIONS_LUA_000298")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000298)
			return LUA_FALSE
		else				
			return LUA_TRUE
		end	
	end
end
--[   ������     �жϵ�ǰ��ͼ�Ƿ�ɴ����������   ]-- NpcSdk , MissionSdkע�� by - dean
function CheckIsMapFull(character)
	local Mapstate = {}
		Mapstate[1] = IsMapFull(1)		
		Mapstate[2] = IsMapFull(2)
		Mapstate[3] = IsMapFull(3)
	local X = {}
		X[1] = 80
		X[2] = 50
		X[3] = 65
	local Y = {}
		Y[1] = 44
		Y[2] = 60
		Y[3] = 88
	local MapName = {}
		MapName[1] = "starena1"
		MapName[2] = "starena2"
		MapName[3] = "starena3"
		local p1,p2 = 0
		local i = 1
		for i = 1,3,1 do
		if Mapstate[i] == 0   then
			--local p1 = character
			local role_csk = CheckBagItem( character, 6066 )
			local csk = GetChaItem2 ( character , 2 , 6066 )
			local csk_teamid = GetItemAttr(csk,ITEMATTR_VAL_STR)
			CALCULATE_FUNCTIONS_LUA_000299 = GetResString("CALCULATE_FUNCTIONS_LUA_000299")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000299)			
			UpdateMapAfterEnter(character , i)
			CALCULATE_FUNCTIONS_LUA_000300 = GetResString("CALCULATE_FUNCTIONS_LUA_000300")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000300)
			UpdateMapNum(csk_teamid ,i, 0 )			
			CALCULATE_FUNCTIONS_LUA_000301 = GetResString("CALCULATE_FUNCTIONS_LUA_000301")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000301..i)			
			local player2 = GetTeamCha(character,0)
			GoTo(player2,X[i],Y[i],MapName[i])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000302 = GetResString("CALCULATE_FUNCTIONS_LUA_000302")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000302..MapName[i]..CALCULATE_FORGE_LUA_000334)	
			local player3 = GetTeamCha(character,1)	
			GoTo(player3,X[i],Y[i],MapName[i])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000303 = GetResString("CALCULATE_FUNCTIONS_LUA_000303")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000303..MapName[i]..CALCULATE_FORGE_LUA_000334)			
			GoTo(character,X[i],Y[i],MapName[i])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000304 = GetResString("CALCULATE_FUNCTIONS_LUA_000304")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000304..MapName[i]..CALCULATE_FORGE_LUA_000334)				
			CALCULATE_FUNCTIONS_LUA_000305 = GetResString("CALCULATE_FUNCTIONS_LUA_000305")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000305..csk_teamid)
			--CaptainConfirm(character, csk_teamid )
			--CaptainConfirmAsk(p1, csk_teamid)
			--CaptainConfirmAsk(character, csk_teamid)
			--SystemNotice(character,"CaptainConfirm�Ѿ�ִ��")	
			--SystemNotice(character,"CaptainConfirm == 1212121")	
		elseif 	Mapstate[i] == 1   then
			CALCULATE_FUNCTIONS_LUA_000306 = GetResString("CALCULATE_FUNCTIONS_LUA_000306")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000306)
			--local p2 = character
			local role_csk = CheckBagItem( character, 6066 )
			local csk = GetChaItem2 ( character , 2 , 6066 )
			local csk_teamid = GetItemAttr(csk,ITEMATTR_VAL_STR)			
			local MapID = MapName[i]
			--local MapFlagNum = 1
			--local Player_ID = GetPlayerID( character )
			UpdateMapAfterEnter(character , i)
			UpdateMapNum(csk_teamid ,i, 1 )				
			local player2 = GetTeamCha(character,0)
			GoTo(player2,X[i],Y[i],MapName[i])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000302 = GetResString("CALCULATE_FUNCTIONS_LUA_000302")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000302..MapName[i]..CALCULATE_FORGE_LUA_000334)
			local player3 = GetTeamCha(character,1)
			GoTo(player3,X[i],Y[i],MapName[i])			
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000303 = GetResString("CALCULATE_FUNCTIONS_LUA_000303")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000303..MapName[i]..CALCULATE_FORGE_LUA_000334)
			GoTo(character,X[i],Y[i],MapName[i])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000307 = GetResString("CALCULATE_FUNCTIONS_LUA_000307")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000307..MapName[i]..CALCULATE_FORGE_LUA_000334)
			--SystemNotice(character,"csk_teamid - �ɹ�="..csk_teamid)
			--CaptainConfirm(character, csk_teamid )
			--CaptainConfirmAsk(p1, csk_teamid)
			--CaptainConfirmAsk(character, csk_teamid)
			--SystemNotice(character,"CaptainConfirm�Ѿ�ִ��")	
		--elseif	Mapstate[i] == 2   then
			--SystemNotice(character,"��ǰ��ͼ�������=2����ͼ�����������ͼʧ��")			
			--return
		elseif Mapstate[i] == 2 and i < 3   then
			local k = i + 1
			local role_csk = CheckBagItem( character, 6066 )
			local csk = GetChaItem2 ( character , 2 , 6066 )
			local csk_teamid = GetItemAttr(csk,ITEMATTR_VAL_STR)
			CALCULATE_FUNCTIONS_LUA_000299 = GetResString("CALCULATE_FUNCTIONS_LUA_000299")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000299)			
			UpdateMapAfterEnter(character , k)
			CALCULATE_FUNCTIONS_LUA_000300 = GetResString("CALCULATE_FUNCTIONS_LUA_000300")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000300)
			UpdateMapNum(csk_teamid ,k, 0 )			
			CALCULATE_FUNCTIONS_LUA_000301 = GetResString("CALCULATE_FUNCTIONS_LUA_000301")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000301..k)			
			local player2 = GetTeamCha(character,0)
			GoTo(player2,X[k],Y[k],MapName[k])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000302 = GetResString("CALCULATE_FUNCTIONS_LUA_000302")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000302..MapName[k]..CALCULATE_FORGE_LUA_000334)	
			local player3 = GetTeamCha(character,1)	
			GoTo(player3,X[k],Y[k],MapName[k])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000303 = GetResString("CALCULATE_FUNCTIONS_LUA_000303")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000303..MapName[k]..CALCULATE_FORGE_LUA_000334)			
			GoTo(character,X[k],Y[k],MapName[k])
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FUNCTIONS_LUA_000304 = GetResString("CALCULATE_FUNCTIONS_LUA_000304")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000304..MapName[k]..CALCULATE_FORGE_LUA_000334)				
			CALCULATE_FUNCTIONS_LUA_000305 = GetResString("CALCULATE_FUNCTIONS_LUA_000305")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000305..csk_teamid)
			if Mapstate[k] == 1   then
				
				CALCULATE_FUNCTIONS_LUA_000306 = GetResString("CALCULATE_FUNCTIONS_LUA_000306")
				SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000306)
				--local p2 = character
				local role_csk = CheckBagItem( character, 6066 )
				local csk = GetChaItem2 ( character , 2 , 6066 )
				local csk_teamid = GetItemAttr(csk,ITEMATTR_VAL_STR)			
				local MapID = MapName[k]
				--local MapFlagNum = 1
				--local Player_ID = GetPlayerID( character )
				UpdateMapAfterEnter(character , k)
				UpdateMapNum(csk_teamid ,k, 1 )				
				local player2 = GetTeamCha(character,0)
				GoTo(player2,X[k],Y[k],MapName[k])
				CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
				CALCULATE_FUNCTIONS_LUA_000302 = GetResString("CALCULATE_FUNCTIONS_LUA_000302")
				SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000302..MapName[k]..CALCULATE_FORGE_LUA_000334)
				local player3 = GetTeamCha(character,1)
				GoTo(player3,X[k],Y[k],MapName[k])			
				CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
				CALCULATE_FUNCTIONS_LUA_000303 = GetResString("CALCULATE_FUNCTIONS_LUA_000303")
				SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000303..MapName[k]..CALCULATE_FORGE_LUA_000334)
				GoTo(character,X[k],Y[k],MapName[k])
				CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
				CALCULATE_FUNCTIONS_LUA_000307 = GetResString("CALCULATE_FUNCTIONS_LUA_000307")
				SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000307..MapName[k]..CALCULATE_FORGE_LUA_000334)
			end
		end	
	end	
end	

--[   ������     �жϵ�ǰ��ɫ�Ƿ��Ѿ������ݿ�����ע����Ϣ   ]-- NpcSdk , MissionSdkע�� by - dean
function CheckIsAmphitheaterLogin(character)
	local ChaCanGo = IsAmphitheaterLogin(character)
	SystemNotice(character,"ChaCanGo1 == ")
	local player2 = GetTeamCha(character,0)
	
	local player3 = GetTeamCha(character,1)
	local ChaCanGo2 = IsAmphitheaterLogin(player2)
	SystemNotice(character,"ChaCanGo2 == ")
	local ChaCanGo3 = IsAmphitheaterLogin(player3)
	SystemNotice(character,"ChaCanGo3 == ")
	if ChaCanGo == 1 or ChaCanGo2 == 1 or ChaCanGo3 == 1   then
		CALCULATE_FUNCTIONS_LUA_000308 = GetResString("CALCULATE_FUNCTIONS_LUA_000308")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000308)		
		return LUA_FALSE
	else
		SystemNotice(character,"Yes Yes YEs")
		return LUA_TRUE
	end
end
--[   ������     �ж��Ƿ���Ч����   ]--	����NPC�ű� ��⴫���ͼ�����Ƿ���Ч NpcSdk , MissionSdkע�� by - dean
function CheckTeamCanGo(character) 
	local csk_num = CheckBagItem( character, 6066 )
	local csk = GetChaItem2 ( character , 2 , 6066 )
	local csk_teamid = GetItemAttr(csk,ITEMATTR_VAL_STR)
	local TeamPlayer1 = GetTeamCha(character,0)
	local TeamPlayer2 = GetTeamCha(character,1)
	local TeamPlayer3 = GetTeamCha(character,2)
	local TeamPlayer4 = GetTeamCha(character,3)	
	if csk_num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000309 = GetResString("CALCULATE_FUNCTIONS_LUA_000309")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000309)
		return LUA_FALSE
	elseif TeamPlayer1 == nil or TeamPlayer2 == nil   then
		CALCULATE_FUNCTIONS_LUA_000310 = GetResString("CALCULATE_FUNCTIONS_LUA_000310")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000310)
		return LUA_FALSE
	elseif TeamPlayer3 ~= nil or TeamPlayer4 ~= nil   then
		CALCULATE_FUNCTIONS_LUA_000311 = GetResString("CALCULATE_FUNCTIONS_LUA_000311")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000311)
		return LUA_FALSE
	else
		CheckIsValidRegTeam = IsValidRegTeam(csk_teamid,character,TeamPlayer1,TeamPlayer2)
		if CheckIsValidRegTeam == 1   then
			CALCULATE_FUNCTIONS_LUA_000312 = GetResString("CALCULATE_FUNCTIONS_LUA_000312")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000312)
			return LUA_TRUE
		else
			CALCULATE_FUNCTIONS_LUA_000313 = GetResString("CALCULATE_FUNCTIONS_LUA_000313")
			SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000313)
			return LUA_FALSE
		end
	end
end

--[   ������   �����ɢ  ]--	by - dean					  
function ArenaTeamCancel(character)
	local ValidTeam = IsValidTeam(character)		
	local csk_num = CheckBagItem( character, 6066 )	
	if csk_num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000314 = GetResString("CALCULATE_FUNCTIONS_LUA_000314")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000314)
		return LUA_FALSE
	end
	if ValidTeam == -1   then
		CALCULATE_FUNCTIONS_LUA_000315 = GetResString("CALCULATE_FUNCTIONS_LUA_000315")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000315)
		return LUA_FALSE
	end
	if ValidTeam == -2   then
		CALCULATE_FUNCTIONS_LUA_000315 = GetResString("CALCULATE_FUNCTIONS_LUA_000315")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000315)
		return LUA_FALSE
	end
	if ValidTeam == -3   then
		CALCULATE_FUNCTIONS_LUA_000315 = GetResString("CALCULATE_FUNCTIONS_LUA_000315")
		SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000315)
		return LUA_FALSE	
	elseif ValidTeam == 1 and csk_num ==1   then
			role_csk = GetChaItem2 ( character , 2 , 6066 )
			csk_teamid = GetItemAttr( role_csk , ITEMATTR_VAL_STR )
			--SystemNotice(character,"��ȡ�����ųɹ�")	
			AmphitheaterTeamCancel(csk_teamid)
			--SystemNotice(character,"��ɢ����ɹ�")	
			return LUA_TRUE		
	end	
end	

--[   ������   ����ע��  ]--   by - dean
function ArenaTeamSignUP(character)         --�ӳ�
	local retbag = HasLeaveBagGrid( character, 1)         --Ҫ�󱳰���1��λ����������ʧ��
	if retbag ~= LUA_TRUE   then
		CALCULATE_FUNCTIONS_LUA_000316 = GetResString("CALCULATE_FUNCTIONS_LUA_000316")
		SystemNotice(character,CALCULATE_FUNCTIONS_LUA_000316)
		return LUA_FALSE
	end	
		--SystemNotice (character,"������������Ҫ��")
	local teamid =  GetAmphitheaterNoUseTeamID()           --��ȡ���ݿ��еĿն�����
	local seasonid =  GetAmphitheaterSeason()
			--SystemNotice (character,"seasonid = "..seasonid)
	local roundid =  GetAmphitheaterRound()
			--SystemNotice (character,"roundid = "..roundid)
		--SystemNotice (character,"��ȡ�����ųɹ�")    
	local player1 = GetTeamCha( character , 0 )				--ȡ�ö�����2�Ŷ�Ա����Ϣ
		--SystemNotice (character,"��ȡ��Ա��Ϣ1�ųɹ�")
	local player2 = GetTeamCha( character , 1 )				--ȡ�ö�����3�Ŷ�Ա����Ϣ
		--SystemNotice (character,"��ȡ��Ա��Ϣ2�ųɹ�")
	AmphitheaterTeamSignUP(teamid,character,player1,player2)	--�������ż���Ա��Ϣע�������ݿ�
		--SystemNotice(character,"�󶨶�����Ϣ�ɹ�")
	local r1=0
	local r2=0
		r1,r2 =MakeItem ( character , 6066  , 1 , 4 )		--������Ҳ���������õ���ָ��
		--SystemNotice(character,"NPC������߳ɹ�")
	local csk_num = GetChaItem ( character , 2 , r2 )
		SetItemAttr(csk_num , ITEMATTR_VAL_STR , teamid)	--����������Ϣ���������
		SetItemAttr(csk_num , ITEMATTR_VAL_AGI , seasonid)	--��������Ϣ���������
		--SystemNotice(character,"���season���Գɹ�")
		SetItemAttr(csk_num , ITEMATTR_VAL_DEX , roundid)	--���ִ���Ϣ���������
		--SystemNotice(character,"���round���Գɹ�")
		SynChaKitbag(character , 41)                             --�������߼�ʱˢ��
		return LUA_TRUE			
end

------------����������[[ �жϽ�ɫ�Ƿ���ӡ��Ƿ�Ϊ�ӳ����Ƿ�Ϊʦͽ ]]  by - dean
function CheckIsValidTeam(character) --     -1 ���Ƕӳ�, -2 ���鲻��3����, -3  ����ʦͽ
	local Sing_Time = Can_Sign_Up()
	if Sing_Time ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000317 = GetResString("CALCULATE_FUNCTIONS_LUA_000317")
		SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000317)
		return LUA_FALSE
	else
		local ValidTeam = IsValidTeam(character)                 ---����Ƿ�������ӣ�ʦͽ���ӳ������ĳ���ӿں���
			--SystemNotice(character , "��ǰֵ="..ValidTeam)
		local team_num_now = GetAmphitheaterTeamCount()          ---������ [[  ȡ��ǰ����������� ]] 
			--SystemNotice( character , "��ǰ����="..team_num_now)
		local csk_num = CheckBagItem( character, 6066 )	
		if csk_num ~= 0   then
			CALCULATE_FUNCTIONS_LUA_000318 = GetResString("CALCULATE_FUNCTIONS_LUA_000318")
			SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000318)
			return LUA_FALSE
		end	
		if ValidTeam == -1   then
			CALCULATE_FUNCTIONS_LUA_000319 = GetResString("CALCULATE_FUNCTIONS_LUA_000319")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000319)
			return LUA_FALSE
		end
		if ValidTeam == -2   then
			CALCULATE_FUNCTIONS_LUA_000320 = GetResString("CALCULATE_FUNCTIONS_LUA_000320")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000320)
			return LUA_FALSE
		end
		if ValidTeam == -3   then
			CALCULATE_FUNCTIONS_LUA_000321 = GetResString("CALCULATE_FUNCTIONS_LUA_000321")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000321)
			return LUA_FALSE
		end
		if team_num_now >= 64   then
			CALCULATE_FUNCTIONS_LUA_000322 = GetResString("CALCULATE_FUNCTIONS_LUA_000322")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000322)
			return LUA_FALSE
		end
		if ValidTeam == 1 and team_num_now < 64   then
			CALCULATE_FUNCTIONS_LUA_000323 = GetResString("CALCULATE_FUNCTIONS_LUA_000323")
			SystemNotice( character , CALCULATE_FUNCTIONS_LUA_000323)		
			return LUA_TRUE
		end		
	end	
end

--[������   ����ȷ�Ϻ�ķ�����Ϣ]--
function CaptainConfirm(character, teamID )
	--SystemNotice(character,"come CaptainConfirm ")
	--Notice("��ʼ���Ϳ���������")
	
	local Team_Map_Name = GetChaMapName(character)
	
	if Team_Map_Name == "starena1"   then
		local player1 = 0
		local player2 = 0
		player1, player2 = GetCaptainByMapId(1)
		local Cha_csk1 = GetChaItem2(player1, 2, 6066)
		local Cha_csk2 = GetChaItem2(player2, 2, 6066)
		local csk_teamid1 = GetItemAttr(Cha_csk1, ITEMATTR_VAL_STR)
		local csk_teamid2 = GetItemAttr(Cha_csk2, ITEMATTR_VAL_STR)
		local MapFlag1 = GetMapFlag(csk_teamid1)
		local MapFlag2 = GetMapFlag(csk_teamid2)
		local player3 = 0
		local player4 = 0
		local player5 = 0
		local player6 = 0
		player3 = GetTeamCha(player1, 0)
		player4 = GetTeamCha(player1, 1)
		player5 = GetTeamCha(player2, 0)
		player6 = GetTeamCha(player2, 1)
	--	SystemNotice(character,"Team_Map_Name == 44444")
		if MapFlag1 == 0   then
			--Notice("��ͼ��ȡ����MapFlag111111111111ֵ")
			GoTo( player1,  44, 64,  "starena1" )
			GoTo( player2,  82, 64,  "starena1" )
			GoTo( player3,  44, 64,  "starena1" )
			GoTo( player4,  44, 64,  "starena1" )
			GoTo( player5,  82, 64,  "starena1" )
			GoTo( player6,  82, 64,  "starena1" )
		elseif MapFlag2 == 0   then
			--Notice("��ͼ��ȡ����MapFlag2222222222222ֵ")
			GoTo( player1,  82, 64,  "starena1" )
			GoTo( player2,  44, 64,  "starena1" )
			GoTo( player3,  82, 64,  "starena1" )
			GoTo( player4,  82, 64,  "starena1" )
			GoTo( player5,  44, 64,  "starena1" )
			GoTo( player6,  44, 64,  "starena1" )
		end	
	elseif Team_Map_Name == "starena2"   then
		local player1 = 0
		local player2 = 0
		player1, player2 = GetCaptainByMapId(2)
		local Cha_csk1 = GetChaItem2(player1, 2, 6066)
		local Cha_csk2 = GetChaItem2(player2, 2, 6066)
		local csk_teamid1 = GetItemAttr(Cha_csk1, ITEMATTR_VAL_STR)
		local csk_teamid2 = GetItemAttr(Cha_csk2, ITEMATTR_VAL_STR)
		local MapFlag1 = GetMapFlag(csk_teamid1)
		local MapFlag2 = GetMapFlag(csk_teamid2)
		local MapFlag2 = GetMapFlag(Team2_ID)
		local player3 = 0
		local player4 = 0
		local player5 = 0
		local player6 = 0
		player3 = GetTeamCha(player1, 0)
		player4 = GetTeamCha(player1, 1)
		player5 = GetTeamCha(player2, 0)
		player6 = GetTeamCha(player2, 1)
		if MapFlag1 == 0   then			
			GoTo( player1,  64, 36,  "starena2" )
			GoTo( player2,  64, 83,  "starena2" )
			GoTo( player3,  64, 36,  "starena2" )
			GoTo( player4,  64, 36,  "starena2" )
			GoTo( player5,  64, 83,  "starena2" )
			GoTo( player6,  64, 83,  "starena2" )
		elseif MapFlag2 == 0   then			
			GoTo( player1,  64, 83,  "starena2" )
			GoTo( player2,  64, 36,  "starena2" )
			GoTo( player3,  64, 83,  "starena2" )
			GoTo( player4,  64, 83,  "starena2" )
			GoTo( player5,  64, 36,  "starena2" )
			GoTo( player6,  64, 36,  "starena2" )
		end
	elseif Team_Map_Name == "starena3"   then
		local player1 = 0
		local player2 = 0
		player1, player2 = GetCaptainByMapId(3)
		local Cha_csk1 = GetChaItem2(player1, 2, 6066)
		local Cha_csk2 = GetChaItem2(player2, 2, 6066)
		local csk_teamid1 = GetItemAttr(Cha_csk1, ITEMATTR_VAL_STR)
		local csk_teamid2 = GetItemAttr(Cha_csk2, ITEMATTR_VAL_STR)
		local MapFlag1 = GetMapFlag(csk_teamid1)
		local MapFlag2 = GetMapFlag(csk_teamid2)
		local player3 = 0
		local player4 = 0
		local player5 = 0
		local player6 = 0
		player3 = GetTeamCha(player1, 0)
		player4 = GetTeamCha(player1, 1)
		player5 = GetTeamCha(player2, 0)
		player6 = GetTeamCha(player2, 1)
		if MapFlag1 == 0   then			
			GoTo( player1,  48, 63,  "starena3" )
			GoTo( player2,  81, 63,  "starena3" )
			GoTo( player3,  48, 63,  "starena3" )
			GoTo( player4,  48, 63,  "starena3" )
			GoTo( player5,  81, 63,  "starena3" )
			GoTo( player6,  81, 63,  "starena3" )
		elseif MapFlag2 == 0   then			
			GoTo( player1,  81, 63,  "starena3" )
			GoTo( player2,  48, 63,  "starena3" )
			GoTo( player3,  81, 63,  "starena3" )
			GoTo( player4,  81, 63,  "starena3" )
			GoTo( player5,  48, 63,  "starena3" )
			GoTo( player6,  48, 63,  "starena3" )
		end	
	end
end

--������ �жϵ�ǰ��ɫ���ڶ����Ƿ������������������ͼ
function CheckStateNumCanGo(character)
	local csk = CheckBagItem( character, 6066 )
	if csk == 0   then
	CALCULATE_FUNCTIONS_LUA_000324 = GetResString("CALCULATE_FUNCTIONS_LUA_000324")
	SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000324)
		return LUA_FALSE
	else	
		local Csk_num = GetChaItem2(character ,2 ,6066)
		local teamid = GetItemAttr(Csk_num,ITEMATTR_VAL_STR)
		--SystemNotice(character,"teamid = "..teamid)
		local GetStateNum = GetStateByTeamid(teamid)
		--SystemNotice(character,"GetStateNum = "..GetStateNum)
		if GetStateNum == 1   then
			--SystemNotice(character , "OKOKOKOKOKOK")
			return LUA_TRUE
		else 
			--SystemNotice(character , "no..............")
			return LUA_FALSE
		end	
	end
end
--ȡ�������������ھ�
function GetWinnerOfArena(character)
	
	local winnerid = GetUniqueMaxWinnum()
	local csk = CheckBagItem(character ,6066 )
	if csk ~= 1   then 
		return LUA_FALSE
	else
		local role_csk = GetChaItem2 ( character , 2 , 6066 )
		local csk_teamid = GetItemAttr( role_csk , ITEMATTR_VAL_STR )
		if csk_teamid == winnerid   then
		CALCULATE_FUNCTIONS_LUA_000325 = GetResString("CALCULATE_FUNCTIONS_LUA_000325")
		SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000325)
			return LUA_TRUE
		else
			CALCULATE_FUNCTIONS_LUA_000326 = GetResString("CALCULATE_FUNCTIONS_LUA_000326")
			SystemNotice(character , CALCULATE_FUNCTIONS_LUA_000326)
			return LUA_FALSE
		end	
	end		
end

function ChargeMapETC(role)
	local map_role = GetChaMapName ( role )
	local map_role_e={}
	map_role_e[1] = "garner" 
	map_role_e[2] = "magicsea"
	map_role_e[3] = "darkblue"
	map_role_e[4] = "eastgoaf"
	map_role_e[5] = "lonetower"
	map_role_e[6] = "secretgarden"
	map_role_e[7] = "darkswamp"
	map_role_e[8] = "abandonedcity"
	map_role_e[9] = "abandonedcity2"
	map_role_e[10] = "abandonedcity3"
	map_role_e[11] = "puzzleworld"
	map_role_e[12] = "puzzleworld2"
	map_role_e[13] = "teampk"
	map_role_e[14] = "jialebi"
	map_role_e[15] = "garner2"
	map_role_e[16] = "hell"
	map_role_e[17] = "hell2"
	map_role_e[18] = "hell3"
	map_role_e[19] = "hell4"
	map_role_e[20] = "hell5"
	map_role_e[21] = "guildwar"
	map_role_e[22] = "leiting2" 
	map_role_e[23] = "shalan2"
	map_role_e[24] = "binglang2" 
	map_role_e[25] = "guildwar2"
	map_role_e[26] = "yschurch"
	map_role_e[27] = "07xmas"
	map_role_e[28] = "sdBoss"
	map_role_e[29] = "07xmas2"
	map_role_e[30] = "prisonisland"
	map_role_e[31] = "starena13" 
	map_role_e[32] = "starena23" 
	map_role_e[33] = "starena33" 
	map_role_e[34] = "winterland"
	map_role_e[35] = "mjing1"
	map_role_e[36] = "mjing2"
	map_role_e[37] = "mjing3"
	map_role_e[38] = "mjing4"
	map_role_e[39] = "mingyun"
	map_role_e[40] = "starena14" 
	map_role_e[41] = "starena24" 
	map_role_e[42] = "starena34" 
	map_role_e[43] = "starena15" 
	map_role_e[44] = "starena25" 
	map_role_e[45] = "starena35" 
	local map_role_name={}
	CALCULATE_EXP_AND_LEVEL_LUA_000011 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000011")
	map_role_name[1] = CALCULATE_EXP_AND_LEVEL_LUA_000011
	CALCULATE_EXP_AND_LEVEL_LUA_000016 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000016")
	map_role_name[2] = CALCULATE_EXP_AND_LEVEL_LUA_000016
	CALCULATE_EXP_AND_LEVEL_LUA_000017 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000017")
	map_role_name[3] = CALCULATE_EXP_AND_LEVEL_LUA_000017
	CALCULATE_EXP_AND_LEVEL_LUA_000018 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000018")
	map_role_name[4] = CALCULATE_EXP_AND_LEVEL_LUA_000018
	CALCULATE_EXP_AND_LEVEL_LUA_000019 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000019")
	map_role_name[5] = CALCULATE_EXP_AND_LEVEL_LUA_000019	
	CALCULATE_EXP_AND_LEVEL_LUA_000020 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000020")
	map_role_name[6] = CALCULATE_EXP_AND_LEVEL_LUA_000020
	DARKSWAMP_ENTRY_LUA_000004 = GetResString("DARKSWAMP_ENTRY_LUA_000004")
	map_role_name[7] = DARKSWAMP_ENTRY_LUA_000004
	ABANDONEDCITY_ENTRY_LUA_000006 = GetResString("ABANDONEDCITY_ENTRY_LUA_000006")
	map_role_name[8] = ABANDONEDCITY_ENTRY_LUA_000006
	ABANDONEDCITY2_ENTRY_LUA_000001 = GetResString("ABANDONEDCITY2_ENTRY_LUA_000001")
	map_role_name[9] = ABANDONEDCITY2_ENTRY_LUA_000001
	ABANDONEDCITY3_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY3_ENTRY_LUA_000002")
	map_role_name[10] = ABANDONEDCITY3_ENTRY_LUA_000002
	PUZZLEWORLD_ENTRY_LUA_000007 = GetResString("PUZZLEWORLD_ENTRY_LUA_000007")
	map_role_name[11] = PUZZLEWORLD_ENTRY_LUA_000007
	PUZZLEWORLD2_ENTRY_LUA_000002 = GetResString("PUZZLEWORLD2_ENTRY_LUA_000002")
	map_role_name[12] = PUZZLEWORLD2_ENTRY_LUA_000002
	CALCULATE_EXP_AND_LEVEL_LUA_000021 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000021")
	map_role_name[13] = CALCULATE_EXP_AND_LEVEL_LUA_000021
	BIRTH_BIRTH_CONF_LUA_000048 = GetResString("BIRTH_BIRTH_CONF_LUA_000048")
	map_role_name[14] = BIRTH_BIRTH_CONF_LUA_000048	
	GARNER2_ENTRY_LUA_000014 = GetResString("GARNER2_ENTRY_LUA_000014")
	map_role_name[15] = GARNER2_ENTRY_LUA_000014
	CALCULATE_EXP_AND_LEVEL_LUA_000022 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000022")
	map_role_name[16] = CALCULATE_EXP_AND_LEVEL_LUA_000022
	CALCULATE_EXP_AND_LEVEL_LUA_000023 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000023")
	map_role_name[17] = CALCULATE_EXP_AND_LEVEL_LUA_000023
	CALCULATE_EXP_AND_LEVEL_LUA_000024 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000024")
	map_role_name[18] = CALCULATE_EXP_AND_LEVEL_LUA_000024
	CALCULATE_EXP_AND_LEVEL_LUA_000025 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000025")
	map_role_name[19] = CALCULATE_EXP_AND_LEVEL_LUA_000025
	CALCULATE_EXP_AND_LEVEL_LUA_000026 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000026")
	map_role_name[20] = CALCULATE_EXP_AND_LEVEL_LUA_000026
	CALCULATE_EXP_AND_LEVEL_LUA_000027 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000027")
	map_role_name[21] = CALCULATE_EXP_AND_LEVEL_LUA_000027
	LEITING2_ENTRY_LUA_000008 = GetResString("LEITING2_ENTRY_LUA_000008")
	map_role_name[22] = LEITING2_ENTRY_LUA_000008
	BIRTH_BIRTH_CONF_LUA_000050 = GetResString("BIRTH_BIRTH_CONF_LUA_000050")
	map_role_name[23] = BIRTH_BIRTH_CONF_LUA_000050
	BINGLANG2_ENTRY_LUA_000010 = GetResString("BINGLANG2_ENTRY_LUA_000010")
	map_role_name[24] = BINGLANG2_ENTRY_LUA_000010
	CALCULATE_EXP_AND_LEVEL_LUA_000028 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000028")
	map_role_name[25] = CALCULATE_EXP_AND_LEVEL_LUA_000028
	BIRTH_BIRTH_CONF_LUA_000051 = GetResString("BIRTH_BIRTH_CONF_LUA_000051")
	map_role_name[26] = BIRTH_BIRTH_CONF_LUA_000051 
	A07XMAS_ENTRY_LUA_000005 = GetResString("A07XMAS_ENTRY_LUA_000005")
	map_role_name[27] = A07XMAS_ENTRY_LUA_000005
	CALCULATE_EXP_AND_LEVEL_LUA_000029 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000029")
	map_role_name[28] = CALCULATE_EXP_AND_LEVEL_LUA_000029
	A07XMAS2_ENTRY_LUA_000005 = GetResString("A07XMAS2_ENTRY_LUA_000005")
	map_role_name[29] = A07XMAS2_ENTRY_LUA_000005	
	BIRTH_BIRTH_CONF_LUA_000052 = GetResString("BIRTH_BIRTH_CONF_LUA_000052")
	map_role_name[30] = BIRTH_BIRTH_CONF_LUA_000052
	CALCULATE_FUNCTIONS_LUA_000327 = GetResString("CALCULATE_FUNCTIONS_LUA_000327")
	map_role_name[31] = CALCULATE_FUNCTIONS_LUA_000327
	CALCULATE_FUNCTIONS_LUA_000328 = GetResString("CALCULATE_FUNCTIONS_LUA_000328")
	map_role_name[32] = CALCULATE_FUNCTIONS_LUA_000328	
	CALCULATE_FUNCTIONS_LUA_000329 = GetResString("CALCULATE_FUNCTIONS_LUA_000329")
	map_role_name[33] = CALCULATE_FUNCTIONS_LUA_000329
	BIRTH_BIRTH_CONF_LUA_000053 = GetResString("BIRTH_BIRTH_CONF_LUA_000053")
	map_role_name[34] = BIRTH_BIRTH_CONF_LUA_000053
	CALCULATE_EXP_AND_LEVEL_LUA_000033 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000033")
	map_role_name[35] = CALCULATE_EXP_AND_LEVEL_LUA_000033
	CALCULATE_EXP_AND_LEVEL_LUA_000034 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000034")
	map_role_name[36] = CALCULATE_EXP_AND_LEVEL_LUA_000034
	CALCULATE_EXP_AND_LEVEL_LUA_000035 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000035")
	map_role_name[37] = CALCULATE_EXP_AND_LEVEL_LUA_000035
	CALCULATE_EXP_AND_LEVEL_LUA_000036 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000036")
	map_role_name[38] = CALCULATE_EXP_AND_LEVEL_LUA_000036
	CALCULATE_EXP_AND_LEVEL_LUA_000037 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000037")
	map_role_name[39] = CALCULATE_EXP_AND_LEVEL_LUA_000037
	CALCULATE_FUNCTIONS_LUA_000330 = GetResString("CALCULATE_FUNCTIONS_LUA_000330")
	map_role_name[40] = CALCULATE_FUNCTIONS_LUA_000330
	CALCULATE_FUNCTIONS_LUA_000331 = GetResString("CALCULATE_FUNCTIONS_LUA_000331")
	map_role_name[41] = CALCULATE_FUNCTIONS_LUA_000331	
	CALCULATE_FUNCTIONS_LUA_000332 = GetResString("CALCULATE_FUNCTIONS_LUA_000332")
	map_role_name[42] = CALCULATE_FUNCTIONS_LUA_000332
	CALCULATE_FUNCTIONS_LUA_000333 = GetResString("CALCULATE_FUNCTIONS_LUA_000333")
	map_role_name[43] = CALCULATE_FUNCTIONS_LUA_000333
	CALCULATE_FUNCTIONS_LUA_000334 = GetResString("CALCULATE_FUNCTIONS_LUA_000334")
	map_role_name[44] = CALCULATE_FUNCTIONS_LUA_000334	
	CALCULATE_FUNCTIONS_LUA_000335 = GetResString("CALCULATE_FUNCTIONS_LUA_000335")
	map_role_name[45] = CALCULATE_FUNCTIONS_LUA_000335
	
	local i=1	
	while map_role_name[i] ~=nil do
		if	map_role==map_role_e[i]   then
			map_role=map_role_name[i]
			return map_role
		end
		i=i+1
	end
	CALCULATE_FUNCTIONS_LUA_000336 = GetResString("CALCULATE_FUNCTIONS_LUA_000336")
	return CALCULATE_FUNCTIONS_LUA_000336
end 


function IsWaBao(role)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)      ---�ڼ���ռ��
	local ZBNMain= math.fmod(ZBMain,10 )			---BUFF OR DEBUFF
	local ZBday = GetChaAttr(role,ATTR_EXTEND2)		--ռ������
	local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
	local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
	local ZBstate2=math.fmod(ZBstate,10)				--ռ������
	local now_day=os.date("%d")
	now_day=tonumber(now_day)
	if now_day==ZBday and ZBstate2==3 and ZBNMain==0   then 
		return 1
	else
		return 0
	end
end 
function XingZuoKaTX(role,now_tick)
	local i=1
	local state=239
	local item_XZK = GetChaItem(role , 2, 3)
	local Item_Id = GetItemID ( item_XZK )
	local ID =0
	for i=1,12,1 do
		ID =5881+i
		if Item_Id==ID   then
			AddState(role,role,state+i,1,6)			
			return
		end
	end	
end
function IsGiveXZItem(role)
	local NeedId=HasXingZuoKa(role)
	local needItemName=GetItemName ( NeedId )
	local haveXingZuoka=CheckBagItem(role,NeedId)
	if haveXingZuoka == 0   then 
		CALCULATE_FUNCTIONS_LUA_000337 = GetResString("CALCULATE_FUNCTIONS_LUA_000337")
		CALCULATE_FUNCTIONS_LUA_000338 = GetResString("CALCULATE_FUNCTIONS_LUA_000338")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000338..needItemName..CALCULATE_FUNCTIONS_LUA_000337)
		return LUA_FALSE
	end
	local ItemCha=GetChaItem2(role,2,NeedId)
	local IsGet=GetItemAttr( ItemCha , ITEMATTR_VAL_AGI  )
	if IsGet==1   then
		CALCULATE_FUNCTIONS_LUA_000339 = GetResString("CALCULATE_FUNCTIONS_LUA_000339")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000339)
		return LUA_FALSE
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 7   then
		CALCULATE_FUNCTIONS_LUA_000340 = GetResString("CALCULATE_FUNCTIONS_LUA_000340")
		SystemNotice(role ,CALCULATE_FUNCTIONS_LUA_000340)
		return LUA_FALSE
	end
	return LUA_TRUE
end	
function GiveXZItem(role)
	local NeedId=HasXingZuoKa(role)
	local ItemCha=GetChaItem2(role,2,NeedId)
	GiveItem(role,0,2440,10,4)
	GiveItem(role,0,5609,10,4)
	GiveItem(role,0,227,10,4)
	GiveItem(role,0,5638,10,4)
	GiveItem(role,0,5617,10,4)
	GiveItem(role,0,3077,10,4)
	SetItemAttr( ItemCha , ITEMATTR_VAL_AGI ,1 )
	return LUA_TRUE
end
function HasXingZuoKa(role)
	local ID =5881+XingZuoXt()
	return ID	
end
function XingZuo(datexz)
	local i=0
	for i=1,11,1 do
		if datexz>=xingZuoTime[i] and datexz<xingZuoTime[i+1]   then
			return i
		end
	end
	return 12
end
function XingZuoXt()
	local month=tonumber(os.date("%m"))
	local day=tonumber(os.date("%d"))
	local datexz=month*100+day
	return XingZuo(datexz)
end
function JTNeedXZ()
	local week=tonumber(os.date("%w"))
	if week==1   then
		return 3,4
	elseif	week==2   then
		return 1,5
	elseif	week==3   then
		return 2,6
	elseif	week==4   then
		return 7,11
	elseif	week==5   then
		return 8,9
	elseif	week==6   then
		return 10,12
	elseif	week==0   then
		return 0,0
	end		
end
function InXZJT(role)
	local hour=tonumber(os.date("%H"))
	if hour~=19   then
		CALCULATE_FUNCTIONS_LUA_000341 = GetResString("CALCULATE_FUNCTIONS_LUA_000341")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000341)
		return LUA_FALSE
	end
	local a,b=JTNeedXZ()
	local needId1=5881+a
	local needId2=5881+b
	local hasNeedXZK=0
	if needId1==5881 and needId2==5881   then
		local i=0
		for i=1,12,1 do 
			needId1=needId1+i
			hasNeedXZK=CheckBagItem(role,needId1)
			if hasNeedXZK==1   then
				return LUA_TRUE
			end
		end
		CALCULATE_FUNCTIONS_LUA_000342 = GetResString("CALCULATE_FUNCTIONS_LUA_000342")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000342)
		return LUA_FALSE
	end
	local j=0
	for j= 1,6,1 do
		hasNeedXZK=hasNeedXZK+CheckBagItem(role,needId1)
		hasNeedXZK=hasNeedXZK+CheckBagItem(role,needId2)
		if hasNeedXZK~=0   then
			return 1
		end
	end
	local needItemName1=GetItemName ( needId1 )
	local needItemName2=GetItemName ( needId2)
	CALCULATE_FUNCTIONS_LUA_000337 = GetResString("CALCULATE_FUNCTIONS_LUA_000337")
	CALCULATE_FUNCTIONS_LUA_000343 = GetResString("CALCULATE_FUNCTIONS_LUA_000343")
	CALCULATE_FUNCTIONS_LUA_000344 = GetResString("CALCULATE_FUNCTIONS_LUA_000344")
	SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000344..needItemName1..CALCULATE_FUNCTIONS_LUA_000343..needItemName2..CALCULATE_FUNCTIONS_LUA_000337)
	return LUA_FALSE
end

--==============================���־���洢ƿ
--=========���־���ƿ�洢
function XSJYCunChu(role,expnum)
	local item_XSJYCunChu = GetChaItem(role , 2, 4)
	local Item_Id = GetItemID ( item_XSJYCunChu )
	if item_XSJYCunChu==nil or Item_Id~=5895   then
		return
	end
	local expnumLow=GetItemAttr( item_XSJYCunChu , ITEMATTR_VAL_AGI  )
	local expnumHigh=GetItemAttr( item_XSJYCunChu , ITEMATTR_VAL_STR  )
	expnumLow=math.fmod(expnum,1000)+expnumLow
	expnumHigh=math.floor(expnum/1000)+expnumHigh+math.floor(expnumLow/1000)
	expnumLow=math.fmod(expnumLow,1000)
	expnum=expnumHigh*1000+expnumLow
	if expnum>100000   then
		expnumHigh=100
		expnumLow=0
	end
	SetItemAttr( item_XSJYCunChu , ITEMATTR_VAL_AGI , expnumLow )
	SetItemAttr( item_XSJYCunChu , ITEMATTR_VAL_STR , expnumHigh )
end --========================�ͷž���
function XSJYShiFang(role,Item)
	local expnumLow=GetItemAttr( Item , ITEMATTR_VAL_AGI  )
	local expnumHigh=GetItemAttr( Item , ITEMATTR_VAL_STR  )
	expnum=expnumHigh*1000+expnumLow
	if expnum ==0   then
		CALCULATE_FUNCTIONS_LUA_000345 = GetResString("CALCULATE_FUNCTIONS_LUA_000345")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000345)
		return expnum
	end
	AddExpAll(role,expnum,expnum,1)
	CALCULATE_FUNCTIONS_LUA_000346 = GetResString("CALCULATE_FUNCTIONS_LUA_000346")
	CALCULATE_FUNCTIONS_LUA_000347 = GetResString("CALCULATE_FUNCTIONS_LUA_000347")
	SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000347..expnum..CALCULATE_FUNCTIONS_LUA_000346)
	SetItemAttr( Item , ITEMATTR_VAL_AGI , 0 )
	SetItemAttr( Item , ITEMATTR_VAL_STR , 0 )
end 
function XSJYPeiYangPing(role,now_tick)
	if math.fmod(now_tick, 600) == 0 and now_tick > 0   then
		local ItemXSJYCCP=GetChaItem2 ( role , 2 , 5897 )
		if ItemXSJYCCP==nil   then
			return
		end
		ReduseXSJYCCP(ItemXSJYCCP)
	end	
end
function ReduseXSJYCCP(Item)
	local IsOpen=GetItemAttr( Item , ITEMATTR_VAL_AGI  )
	if IsOpen==60   then
		CALCULATE_FUNCTIONS_LUA_000348 = GetResString("CALCULATE_FUNCTIONS_LUA_000348")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000348)
		return
	end
	IsOpen=IsOpen+1
	SetItemAttr( Item , ITEMATTR_VAL_AGI ,IsOpen )
end 
function YBHS(role)
	local a=math.random(1,100)
	if a>0 and a<=30   then
		GiveItem ( role	, 0 ,1038,1, 4 )
			return LUA_TRUE
	elseif a>30 and a<=40   then
		GiveItem ( role	, 0 ,1037,1, 4 )
			return LUA_TRUE
	elseif a>40 and a<=50   then
		GiveItem ( role	, 0 ,1039,1, 4 )
			return LUA_TRUE
	elseif a>50 and a<=60   then
		GiveItem ( role	, 0 ,1129,1, 4 )
			return LUA_TRUE
	elseif a>60 and a<=70   then
		GiveItem ( role	, 0 ,1130,1, 4 )
			return LUA_TRUE
	elseif a>70 and a<=80   then
		GiveItem ( role	, 0 ,1131,1, 4 )
			return LUA_TRUE
	elseif a>80 and a<=90   then
		GiveItem ( role	, 0 ,1132,1, 4 )	
			return LUA_TRUE
	elseif a>90 and a<=100   then
		GiveItem ( role	, 0 ,1133,1, 4 )
			return LUA_TRUE
	end
	return LUA_FALSE
	
end

function HasBag(role,num,Item)
	local bagNum=GetChaFreeBagGridNum(role)
	local itemId=GetItemID ( Item )
	local itemName=GetItemName ( itemId ) 
	if bagNum<num   then 
		CALCULATE_FUNCTIONS_LUA_000349 = GetResString("CALCULATE_FUNCTIONS_LUA_000349")
		CALCULATE_FUNCTIONS_LUA_000350 = GetResString("CALCULATE_FUNCTIONS_LUA_000350")
		CALCULATE_FUNCTIONS_LUA_000351 = GetResString("CALCULATE_FUNCTIONS_LUA_000351")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000351..itemName..CALCULATE_FUNCTIONS_LUA_000350..num..CALCULATE_FUNCTIONS_LUA_000349)
		return 0
	else
		return 1
	end
end

function Ismm(role)
	local roleType=GetChaTypeID(role)
	if roleType<3   then
		return LUA_FALSE
	else
		return LUA_TRUE
	end	
end 
function HasYiZuHua(role)
	local has99Hua = CheckBagItem (role,6381)
	if has99Hua< 99   then 
		return LUA_FALSE
	else
		return LUA_TRUE
	end
end
function RemoveHua(role,type)
		local huaNum=CheckBagItem (role,6381)
		local num=math.floor(huaNum/99)
		if type==1   then
			num=1
		end
		RemoveChaItem(role,6381,num*99,0,-1,2,1)
		GiveHuaCu(role,num)
	return LUA_TRUE
end
function GiveHuaCu(role,num)
	GiveItem(role,0,6382,num,4)
end
function GiveItemNew(role,id,num,qua)
	
	GiveItem(role,0,id,num,qua)
end
function GiveMGHZ(role,PTa,DYb,GGc)
	local male=Ismm(role)
	if male==1   then 
		return	LUA_TRUE
	end
	local PTa1,DYb1,GGc1=GetMGHZAttr(role)
	PTa=PTa+PTa1
	DYb=DYb+DYb1
	GGc=GGc+GGc1
	SetMGHZAttr(role,PTa,DYb,GGc)
	local needBag=NeedMGHZBag(role)
	local bagNum=GetChaFreeBagGridNum(role)
	if bagNum<needBag   then
		CALCULATE_FUNCTIONS_LUA_000352 = GetResString("CALCULATE_FUNCTIONS_LUA_000352")
		CALCULATE_FUNCTIONS_LUA_000353 = GetResString("CALCULATE_FUNCTIONS_LUA_000353")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000353..needBag..CALCULATE_FUNCTIONS_LUA_000352)
		return	LUA_TRUE
	else 
		if PTa~=0   then 
			GiveItem(role,0,6383,PTa,4)
		end 
		if DYb~=0   then 
			GiveItem(role,0,6384,DYb,4)
		end 
		if GGc~=0   then 
			GiveItem(role,0,6385,GGc,4)
		end 
		CALCULATE_FUNCTIONS_LUA_000354 = GetResString("CALCULATE_FUNCTIONS_LUA_000354")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000354)
		SetMGHZAttr(role,0,0,0)
		return	LUA_TRUE
	end
end		
function SetMGHZAttr(role,PTa,DYb,GGc)
	local attr=PTa*238+GGc*34+DYb
	SetChaAttr(role,ATTR_EXTEND8,attr)
end 
function GetMGHZAttr(role)
	local attr=GetChaAttr(role,ATTR_EXTEND8)
	local PTa=math.floor(attr/238)
	local DYbGGc=math.fmod(attr,238)
	local GGc=math.floor(DYbGGc/34)
	local DYb=math.fmod(DYbGGc,34)
	return PTa,DYb,GGc
end 
function NeedMGHZBag(role)
	local a={}
	a[1],a[2],a[3]=GetMGHZAttr(role)
	local b=0
	local i=0
	for i=1,3,1 do
		if a[i]~=0   then
			b=b+1
		end
	end
	return b
end

function NeedMGHZBag(role)
	local a={}
	a[1],a[2],a[3]=GetMGHZAttr(role)
	local b=0
	local i=0
	for i=1,3,1 do
		if a[i]~=0   then
			b=b+1
		end
	end
	return b
end

function TGiveMGHZ(role,now_tick)
	if math.fmod(now_tick,600)==0 and now_tick>0   then
		local male=Ismm(role)
		local P=GetChaAttr(role,ATTR_EXTEND8)
		if male==1 or P==0   then 
			return 
		end
		local PTa1,DYb1,GGc1=GetMGHZAttr(role)
		local needBag=NeedMGHZBag(role)
		local bagNum=GetChaFreeBagGridNum(role)
		if bagNum<needBag   then
			CALCULATE_FUNCTIONS_LUA_000355 = GetResString("CALCULATE_FUNCTIONS_LUA_000355")
			CALCULATE_FUNCTIONS_LUA_000353 = GetResString("CALCULATE_FUNCTIONS_LUA_000353")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000353..needBag..CALCULATE_FUNCTIONS_LUA_000355)
		else 
			if PTa1~=0   then 
				GiveItem(role,0,6383,PTa1,4)
			end 
			if DYb1~=0   then 
				GiveItem(role,0,6384,DYb1,4)
			end 
			if GGc1~=0   then 
				GiveItem(role,0,6385,GGc1,4)
			end 
			SetMGHZAttr(role,0,0,0)
			CALCULATE_FUNCTIONS_LUA_000354 = GetResString("CALCULATE_FUNCTIONS_LUA_000354")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000354)
			return
		end
	end
end	
function MGHZKouTime(role,now_tick)
	local i=0
	for i=1,3,1 do 
		local chaMGHZ=GetChaItem2(role,2,6382+i)
		local itemName=GetItemName ( 6382+i ) 
			
		if chaMGHZ~=nil   then 
			local MGHZTime=GetItemAttr(chaMGHZ,ITEMATTR_VAL_STR)
			if math.fmod ((120-MGHZTime),24)==0 and MGHZTime<120   then
				local daoJiShi=(120-MGHZTime)/12
				CALCULATE_FUNCTIONS_LUA_000356 = GetResString("CALCULATE_FUNCTIONS_LUA_000356")
				CALCULATE_FUNCTIONS_LUA_000357 = GetResString("CALCULATE_FUNCTIONS_LUA_000357")
				SystemNotice(role,itemName..CALCULATE_FUNCTIONS_LUA_000357..daoJiShi..CALCULATE_FUNCTIONS_LUA_000356)
			end
			if MGHZTime==108   then
				CALCULATE_FUNCTIONS_LUA_000358 = GetResString("CALCULATE_FUNCTIONS_LUA_000358")
				SystemNotice(role,itemName..CALCULATE_FUNCTIONS_LUA_000358)
			end 
			if MGHZTime==114   then
				CALCULATE_FUNCTIONS_LUA_000359 = GetResString("CALCULATE_FUNCTIONS_LUA_000359")
				SystemNotice(role,itemName..CALCULATE_FUNCTIONS_LUA_000359)
			end
			if MGHZTime==116   then
				CALCULATE_FUNCTIONS_LUA_000360 = GetResString("CALCULATE_FUNCTIONS_LUA_000360")
				SystemNotice(role,itemName..CALCULATE_FUNCTIONS_LUA_000360)
			end
			if MGHZTime==118   then
				CALCULATE_FUNCTIONS_LUA_000361 = GetResString("CALCULATE_FUNCTIONS_LUA_000361")
				SystemNotice(role,itemName..CALCULATE_FUNCTIONS_LUA_000361)
			end
			if MGHZTime==119   then
				CALCULATE_FUNCTIONS_LUA_000362 = GetResString("CALCULATE_FUNCTIONS_LUA_000362")
				SystemNotice(role,itemName..CALCULATE_FUNCTIONS_LUA_000362)
			end
			if MGHZTime==120   then
				CALCULATE_FUNCTIONS_LUA_000363 = GetResString("CALCULATE_FUNCTIONS_LUA_000363")
				SystemNotice(role,itemName..CALCULATE_FUNCTIONS_LUA_000363)
			end 	
			MGHZTime=MGHZTime+1
			if MGHZTime>120   then 
				RemoveChaItem(role,6382+i,99,0,-1,2,1)
				return
			end
			SetItemAttr(chaMGHZ,ITEMATTR_VAL_STR,MGHZTime)
		end
	end
end
function TakeAndGiveItem(role,Item1,num1,Item2,num2)
		RemoveChaItem(role,Item1,num1,0,-1,2,1)
		GiveItemAfterTake(role,Item2,num2)
	return LUA_TRUE
end
function GiveItemAfterTake(role,Item2,num2)
	GiveItem(role,0,Item2,num2,4)
end
function XZKHDJianLiN(role)
	local name = GetChaDefaultName(role)
	CALCULATE_FUNCTIONS_LUA_000364 = GetResString("CALCULATE_FUNCTIONS_LUA_000364")
	CALCULATE_FUNCTIONS_LUA_000365 = GetResString("CALCULATE_FUNCTIONS_LUA_000365")
	ScrollNotice(CALCULATE_FUNCTIONS_LUA_000365..name..CALCULATE_FUNCTIONS_LUA_000364,1)
	return	LUA_TRUE
end

function XingZuoKaHuoDong(role,itemXZKID,type)
	local itemXZK = GetChaItem2 ( role , 2 , itemXZKID )
	local hasGet5000 = GetItemAttr( itemXZK ,ITEMATTR_VAL_STA )
	if type==1   then 
		if hasGet5000== 0   then 
			return	LUA_TRUE
		else 
			return	LUA_FALSE
		end
	end
	if type==2   then
		if hasGet5000== 1   then 
			return	LUA_TRUE
		else 
			return	LUA_FALSE
		end
	end
end
function XZKHDBuZhou(role)
	local i= 0
	for i=1,12,1 do	
		local hasItem=CheckBagItem(role,5881+i)
		if hasItem==1   then 
			local itemXZK = GetChaItem2 ( role , 2 , 5881+i )
			local hasGet5000 = GetItemAttr( itemXZK ,ITEMATTR_VAL_STA )
			if hasGet5000==0   then 
				SetItemAttr( itemXZK ,ITEMATTR_VAL_STA,1 ) 
				return	LUA_TRUE
			elseif hasGet5000==1	  then
				SetItemAttr( itemXZK ,ITEMATTR_VAL_STA,0 ) 
				return	LUA_TRUE
			end
		end
	end
	return	LUA_FALSE
end
function Zhuanzts ( role,npc  )
	PlayEffect( npc, 944 )
end
function GetAndSetWaWa(role,num)
	local i=GetChaFreeBagGridNum(role)
	if i==0   then 
		CALCULATE_FUNCTIONS_LUA_000366 = GetResString("CALCULATE_FUNCTIONS_LUA_000366")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000366)
		return	
	end
	GiveItem(role,0,6377,1,4)
	local item=GetChaItem2(role,2,6377)
	SetWaWaAttr(item, num,0)
end 
function KouWaWa (role,now_tick)
	local item=GetChaItem2(role,2,6377)
	if item==nil   then 
		return
	end
	local wawatype=0
	local wawaTime=0
	 wawatype,wawaTime=GetWaWaAttr(item)
	if wawaTime==120   then 
		RemoveChaItem(role,6377,1,0,-1,2,1)
		return
	end
	
	if  wawaTime==72 or wawaTime==96 or  wawaTime==108   then 
		CALCULATE_FUNCTIONS_LUA_000367 = GetResString("CALCULATE_FUNCTIONS_LUA_000367")
		CALCULATE_FUNCTIONS_LUA_000368 = GetResString("CALCULATE_FUNCTIONS_LUA_000368")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000368..((120-wawaTime)/12)..CALCULATE_FUNCTIONS_LUA_000367)
	end
	wawaTime=wawaTime+1
	SetWaWaAttr(item,wawatype,wawaTime)
end
function SetWaWaAttr(item,num1,num2)
	local num=num1*121+num2
	SetItemAttr(item, ITEMATTR_VAL_STR,num)
end 
function GetWaWaAttr(item)
	local num=GetItemAttr(item, ITEMATTR_VAL_STR)
	local num1=math.floor(num/121)
	local num2=math.fmod(num,121)
	return num1,num2
end
function NSDXIsFull(role)
	local role_NSDX = GetChaItem2 ( ATKER , 2 , 3010)
	local Energy_NSDX = GetItemAttr ( role_NSDX , ITEMATTR_ENERGY )
	if Energy_NSDX ==999   then
		return LUA_TRUE
	end
	return LUA_FALSE
end
function GetChaPerHp(role)
	local hp= GetChaAttr (role , ATTR_HP)
	local mxhp=GetChaAttr (role , ATTR_MXHP)
	return hp/mxhp
end 
function GetChaPerSp(role)
	local sp= GetChaAttr (role , ATTR_SP)
	local mxsp=GetChaAttr (role , ATTR_MXSP)
	return sp/mxsp
end 
function SetChaPerSp(role,per)
	local mxsp=GetChaAttr (role , ATTR_MXSP)
	sp=math.floor(mxsp*per)
	SetChaAttr (role , ATTR_SP,sp)
end 
function SetChaPerHp(role,per)
	local mxhp=GetChaAttr (role , ATTR_MXHP)
	hp=math.floor(mxhp*per)
	SetChaAttr (role , ATTR_HP,hp)
end 
function ZBStateTime(role)     
	local now_hour= os.date("%H")		-------------ʱ          
	local now_miniute= os.date("%M")	-------------��          
	local now_scend=  os.date("%S")		-------------��   
	now_hour= tonumber(now_hour)		-------------ʱ  
	now_miniute= tonumber(now_miniute)	 -------------��  
	now_scend= tonumber(now_scend)	-------------�� 
	local zbStateTime= 24*3600-(now_hour*3600+now_miniute*60+now_scend)
	return zbStateTime
end 
function ZBNSDstate(role,now_tick)-------------Ů���
	local now_day=os.date("%d")
	now_day=tonumber(now_day)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local statelv_ZBMAXHP = GetChaStateLv ( role , STATE_ZBMAXHP )
	local Have_Item = CheckBagItem (role,6376)
	if Have_Item == 1   then 
		haveNSD = 1
		local nvshendun=GetChaItem2(role ,2 ,6376) 
		local NSDDay = GetItemAttr(nvshendun,ITEMATTR_VAL_AGI)
		local dunTime = GetItemAttr(nvshendun,ITEMATTR_VAL_CON)
		if dunTime == 0 or NSDDay ~= now_day    then 
			RemoveChaItem ( role , 6376 , 1 , 0 , -1, 2 , 1  )
			haveNSD=0
			SetChaAttr(role,ATTR_EXTEND0,-2)
			return
		end
		local sklv = 1
		local statetime = ZBStateTime(role) 
		if statelv_ZBMAXHP == 0   then
			AddState ( role , role , STATE_ZBMAXHP , sklv , statetime )	
		end
		if math.fmod(now_tick, 900) == 0 and now_tick>0   then
			local name = GetChaDefaultName(role)
			CALCULATE_FUNCTIONS_LUA_000289 = GetResString("CALCULATE_FUNCTIONS_LUA_000289")
			ScrollNotice(name..CALCULATE_FUNCTIONS_LUA_000289, 1 )
		end
		if math.fmod(now_tick, 30) == 0 and now_tick>0   then
			dunTime=dunTime-1
			SetItemAttr(nvshendun,ITEMATTR_VAL_CON,dunTime)
			return
		end
	else
		if statelv_ZBMAXHP ~=0   then
			RemoveState ( role , STATE_ZBMAXHP ) 
		end
		if ZBMain==-1   then 
			haveNSD=0
			SetChaAttr(role,ATTR_EXTEND0,-2)
		end
	end
end
function ZBbuffState(role,now_tick)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)      ---�ڼ���ռ��
	local ZBNMain= math.fmod(ZBMain,10 )			---BUFF OR DEBUFF
	local ZBday = GetChaAttr(role,ATTR_EXTEND2)		--ռ������
	local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
	local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
	local ZBstate2=math.fmod(ZBstate,10)				--ռ������
	local now_day=os.date("%d")
	now_day=tonumber(now_day)
	local ZBStateLV={}
	ZBStateLV[0]={}
	ZBStateLV[0][0]=0
	ZBStateLV[1] = {}
	ZBStateLV[1][1] = 2												
	ZBStateLV[1][2] = 4												
	ZBStateLV[1][3] = 6												
	ZBStateLV[1][4] = 8												
	ZBStateLV[1][5] = 10											
	ZBStateLV[2] = {}
	ZBStateLV[2][1] = 10								
	ZBStateLV[2][2] = 8												
	ZBStateLV[2][3] = 6												
	ZBStateLV[2][4] = 4												
	ZBStateLV[2][5] = 2
	ZBStateLV[3] = {}
	ZBStateLV[3][1] = 1								
	ZBStateLV[3][2] = 1												
	ZBStateLV[3][3] = 1												
	ZBStateLV[3][4] = 1												
	ZBStateLV[3][5] = 1
	ZBStateLV[4] = {}
	ZBStateLV[4][1] = 10								
	ZBStateLV[4][2] = 8												
	ZBStateLV[4][3] = 6												
	ZBStateLV[4][4] = 4
	ZBStateLV[4][5] = 2									
	ZBStateLV[5] = {}
	ZBStateLV[5][1] = 1								
	ZBStateLV[5][2] = 2												
	ZBStateLV[5][3] = 3												
	ZBStateLV[5][4] = 4												
	ZBStateLV[5][5] = 4		
	ZBStateLV[6] = {}
	ZBStateLV[6][1] = 2
	ZBStateLV[6][2] = 4									
	ZBStateLV[6][3] = 6												
	ZBStateLV[6][4] = 8												
	ZBStateLV[6][5] = 8
	local statelv_ZBMOVE= GetChaStateLv ( role , STATE_ZBMOVE )
	local statelv_ZBHP = GetChaStateLv ( role , STATE_ZBHP )
	local statelv_ZBSP = GetChaStateLv ( role , STATE_ZBSP )
	local statetime=ZBStateTime(role) 
	if ZBstate2<=6 and ZBstate2>=0 and ZBstate1>=1 and ZBstate1<=5   then 
		if ZBstate2==4 and ZBNMain== 0 and now_day==ZBday and statelv_ZBMOVE~= ZBStateLV[ZBstate2][ZBstate1]  and ZBStateLV[ZBstate2][ZBstate1]>0   then
			AddState(role,role,STATE_ZBMOVE,ZBStateLV[ZBstate2][ZBstate1],statetime)
		elseif statelv_ZBMOVE~= ZBStateLV[ZBstate2][ZBstate1] and statelv_ZBMOVE~= 0   then
			RemoveState ( role , STATE_ZBMOVE )
		end
		if ZBstate2==5 and ZBNMain== 0 and now_day==ZBday and statelv_ZBHP~= ZBStateLV[ZBstate2][ZBstate1]   then
			AddState(role,role,STATE_ZBHP,ZBStateLV[ZBstate2][ZBstate1],statetime)
		elseif statelv_ZBHP~= ZBStateLV[ZBstate2][ZBstate1] and statelv_ZBHP~= 0   then
			RemoveState ( role , STATE_ZBHP )
		end
		if ZBstate2==6 and ZBNMain== 0 and now_day==ZBday and statelv_ZBSP~= ZBStateLV[ZBstate2][ZBstate1]   then
			AddState(role,role,STATE_ZBSP,ZBStateLV[ZBstate2][ZBstate1],statetime)
		elseif statelv_ZBSP~= ZBStateLV[ZBstate2][ZBstate1] and statelv_ZBSP~= 0   then
			RemoveState ( role , STATE_ZBSP )
		end
	end
	if ZBday~=now_day and ZBMain~=0   then
		if ZBstate2==4 and ZBNMain== 0   then
			if statelv_ZBMAXHP ~=0   then
				RemoveState ( role , STATE_ZBMOVE ) 
			end
		end
		if ZBstate2==5 and ZBNMain== 0   then
			if statelv_ZBMAXHP ~=0   then
				RemoveState ( role , STATE_ZBHP ) 
			end
		end
		if ZBstate2==6 and ZBNMain== 0   then
			if statelv_ZBMAXHP ~=0   then
				RemoveState ( role , STATE_ZBSP ) 
			end
		end	
		SetChaAttr(role,ATTR_EXTEND0,0)
		SetChaAttr(role, ATTR_EXTEND1,0)
		SetChaAttr(role, ATTR_EXTEND2,0)
		return
	end
end
function ZBDebuffStateRS(role,now_tick)
	local statelv_STATE_GANMAO= GetChaStateLv ( role , STATE_GANMAO )
	if ZBstate==1 and ZBNMain==1 and statelv_STATE_GANMAO ==0   then 
		AddState ( role , role , STATE_GANMAO , 1 , 1800 )	
	end
end
function ZBDebuffState(role,now_tick)
	if math.fmod(now_tick, 30) == 0 and now_tick>0   then
		local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
		local ZBNType= math.floor(ZBMain/10)      ---�ڼ���ռ��
		local ZBNMain= math.fmod(ZBMain,10 )			---BUFF OR DEBUFF
		local ZBday = GetChaAttr(role,ATTR_EXTEND2)		--ռ������
		local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
		local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
		local ZBstate2=math.fmod(ZBstate,10)				--ռ������
		local now_day=os.date("%d")
		now_day=tonumber(now_day)
		local IsDeb=1
		local DebTime = GetChaAttr( role , ATTR_EXTEND7)
		IsDeb = math.fmod ( DebTime ,60)
		if DebTime>=0   then 
			DebTime=DebTime-1
		end
		SetChaAttr( role , ATTR_EXTEND7,DebTime)
		if DebTime<=2820 and ZBstate2==2 and ZBstate1~=0  and ZBNMain== 0   then
			local abc=ZBNType*10+3
			SetChaAttr(role, ATTR_EXTEND0,abc)
		end
		if IsDeb==0 and ZBstate2==0 and ZBstate1 ~=0 and ZBNMain== 0   then
			GiveItemX(role,0,6374,1,4)
		end
		if IsDeb==0 and ZBNMain==1   then
			SetChaAttr(role, ATTR_EXTEND1,0)
			local statelv_STATE_GANMAO= GetChaStateLv ( role , STATE_GANMAO )
			if statelv_STATE_GANMAO ~=0   then
				RemoveState ( role , STATE_GANMAO ) 
			end
			local	ZBStateDEBGL={}
			ZBStateDEBGL[1] = 5									--����
			ZBStateDEBGL[2] = 10									-- ����
			ZBStateDEBGL[3] = 15									-- ���˽�
			ZBStateDEBGL[4] = 18									-- ����
			ZBStateDEBGL[5] = 21									-- ����
			ZBStateDEBGL[6] = 23									-- ����
			ZBStateDEBGL[7] = 24		-- ����
			-- ZBStateDEBGL[8] = 26			--���˿�
			local RDa=math.random(1,24)
			CALCULATE_FUNCTIONS_LUA_000369 = GetResString("CALCULATE_FUNCTIONS_LUA_000369")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000369)
			local roleHp=GetChaAttr(role,ATTR_HP)
			if roleHp<1   then 
				return
			end 
			if RDa<=ZBStateDEBGL[1]   then 
				AddState ( role , role , STATE_GANMAO , 1 , 30 )
				CALCULATE_FUNCTIONS_LUA_000370 = GetResString("CALCULATE_FUNCTIONS_LUA_000370")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000370)
				GetAndSetWaWa(role,1)
				SetChaAttr(role, ATTR_EXTEND1,1)
				return
			end	
			if RDa<=ZBStateDEBGL[2] and RDa > ZBStateDEBGL[1]   then 
				CALCULATE_FUNCTIONS_LUA_000371 = GetResString("CALCULATE_FUNCTIONS_LUA_000371")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000371)
					AddState ( role , role , STATE_LST , 1 ,30 )
				GetAndSetWaWa(role,2)
				SetChaAttr(role, ATTR_EXTEND1,2)
				return
			end	
			if RDa<=ZBStateDEBGL[3] and RDa > ZBStateDEBGL[2]   then 
				CALCULATE_FUNCTIONS_LUA_000372 = GetResString("CALCULATE_FUNCTIONS_LUA_000372")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000372)
				local statelv = 1
				local statetime = 25
				AddState ( role , role , STATE_XIANRENJIAO , statelv , statetime )
				AddState ( role , role , STATE_XY , statelv , statetime )				
				GetAndSetWaWa(role,3)
				SetChaAttr(role, ATTR_EXTEND1,3)
				
				return
			end	
			if RDa<=ZBStateDEBGL[4] and RDa > ZBStateDEBGL[3]   then 
				CALCULATE_FUNCTIONS_LUA_000373 = GetResString("CALCULATE_FUNCTIONS_LUA_000373")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000373)
				local statelv = 1
				local statetime = 20
				AddState ( role , role , STATE_JF , statelv , statetime )
				GetAndSetWaWa(role,4)
				SetChaAttr(role, ATTR_EXTEND1,4)
				return
			end	
			if RDa<=ZBStateDEBGL[5] and RDa > ZBStateDEBGL[4]   then 
				CALCULATE_FUNCTIONS_LUA_000374 = GetResString("CALCULATE_FUNCTIONS_LUA_000374")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000374)
				local statelv = 1
				local statetime = 30
				AddState ( role , role , STATE_BIW , statelv , statetime )
				GetAndSetWaWa(role,5)
				SetChaAttr(role, ATTR_EXTEND1,5)
				return
			end	
			if RDa<=ZBStateDEBGL[6] and RDa > ZBStateDEBGL[5]   then
				local statelv = 1
				local statetime = 2			
				AddState ( role , role , STATE_LEIPI , statelv , statetime )
				CALCULATE_FUNCTIONS_LUA_000375 = GetResString("CALCULATE_FUNCTIONS_LUA_000375")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000375)
				GetAndSetWaWa(role,6)
				SetChaAttr(role, ATTR_EXTEND1,6)
				return
			end	
			if RDa<=ZBStateDEBGL[7] and RDa > ZBStateDEBGL[6]   then 
				local statelv = 1
				local statetime = 1 
				AddState ( role , role , STATE_CUSI , statelv , statetime )
				local role_mxhp = GetChaAttr(role, ATTR_MXHP)
				CALCULATE_FUNCTIONS_LUA_000376 = GetResString("CALCULATE_FUNCTIONS_LUA_000376")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000376)
				GetAndSetWaWa(role,7)
				SetChaAttr(role, ATTR_EXTEND1,7)
				return
			end	
			-- if RDa<=ZBStateDEBGL[8] and RDa > ZBStateDEBGL[7]   then 
				-- local a = Ismm(role)
				-- local sex={}
				-- sex[0]="Ů��"
				-- sex[1]="����"
				-- local bagNum=GetChaFreeBagGridNum ( role )
				-- if bagNum == 0   then
					-- SetChaAttr(role, ATTR_EXTEND1,81)
					-- SystemNotice(role,"���е���"..sex[a].."��Թ��е���������ϡ���Ϊ�㱳���������޷���ý����ǰ����ġ���ʵ�����ۡ��������Ĵ�ֵľ���ֵΪƽʱ��90%%")
					-- return
				-- end
				
				-- local id=6441-a
				-- local r1,r2 =MakeItem ( role , id  , 1 , 4 )		--������Ҳ���������õ���ָ��
				-- local item_PJ = GetChaItem ( role , 2 , r2 )
				-- local itemName = GetItemName(id)
				-- local roleID=GetRoleID(role)
				-- local num1,num2 = Attr1To2(roleID)
				-- SetItemAttr(item_PJ,ITEMATTR_VAL_AGI,num1)
				-- SetItemAttr(item_PJ,ITEMATTR_VAL_DEX,num2)
				-- local a1 = GetItemAttr(item_PJ,ITEMATTR_VAL_AGI)
				-- local a2 = GetItemAttr(item_PJ,ITEMATTR_VAL_DEX)
				-- SetChaAttr(role, ATTR_EXTEND1,82)
				-- local b=1-a	
				-- SystemNotice(role,"���е���"..sex[a].."��Թ��е���������ϡ��Ͽ�����ǵ�"..sex[b].."����ʵ�����ۡ��ɣ������ûظ�����Ĵ�ֵľ���ֵ���ƽʱ��20%%Ŷ��")
				-- return
			-- end					
		end
	end
end 
function GiveSB(role)
	local sbday=GetChaAttr(role, ATTR_EXTEND5)
	local SBday=zhouRi(role)
	if SBday~=sbday   then 
		SetChaAttr(role, ATTR_EXTEND5,SBday)
		SetChaAttr(role, ATTR_EXTEND6,0)
		return LUA_TRUE
	end 
	return LUA_TRUE
end 
function ZBNowState(role)
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)      ---�ڼ���ռ��
	local ZBNMain= math.fmod(ZBMain,10 )			---BUFF OR DEBUFF
	local ZBday = GetChaAttr(role,ATTR_EXTEND2)		--ռ������
	local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
	local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
	local ZBstate2=math.fmod(ZBstate,10)				--ռ������
	local now_day=os.date("%d")
	now_day=tonumber(now_day)
	if now_day~=ZBday   then
		return "no"
	end 
	if ZBMain == -1   then 
		return 11
	end
	if ZBMain == -2   then 
		return 12
	end
	if ZBNMain==0   then
		if ZBstate2==0   then 
			return 10
		else
			return ZBstate2
		end
	end
	if ZBNMain==1   then
		return -ZBstate
	end 
	if ZBNMain==3   then 
		return 13
	end
end  
function ZBChaXun(role)
	local zbNowState=ZBNowState(role)
	if zbNowState=="no"   then
		CALCULATE_FUNCTIONS_LUA_000377 = GetResString("CALCULATE_FUNCTIONS_LUA_000377")
		return CALCULATE_FUNCTIONS_LUA_000377
	end
	if zbNowState==11 or zbNowState==12   then
		CALCULATE_FUNCTIONS_LUA_000378 = GetResString("CALCULATE_FUNCTIONS_LUA_000378")
		return CALCULATE_FUNCTIONS_LUA_000378
	end
	local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)
	local zhanBuFalse={}
	CALCULATE_FUNCTIONS_LUA_000379 = GetResString("CALCULATE_FUNCTIONS_LUA_000379")
	zhanBuFalse[1]=CALCULATE_FUNCTIONS_LUA_000379
	CALCULATE_FUNCTIONS_LUA_000380 = GetResString("CALCULATE_FUNCTIONS_LUA_000380")
	zhanBuFalse[2]=CALCULATE_FUNCTIONS_LUA_000380
	CALCULATE_FUNCTIONS_LUA_000381 = GetResString("CALCULATE_FUNCTIONS_LUA_000381")
	zhanBuFalse[3]=CALCULATE_FUNCTIONS_LUA_000381
	CALCULATE_FUNCTIONS_LUA_000382 = GetResString("CALCULATE_FUNCTIONS_LUA_000382")
	zhanBuFalse[4]=CALCULATE_FUNCTIONS_LUA_000382
	CALCULATE_FUNCTIONS_LUA_000383 = GetResString("CALCULATE_FUNCTIONS_LUA_000383")
	zhanBuFalse[5]=CALCULATE_FUNCTIONS_LUA_000383
	CALCULATE_FUNCTIONS_LUA_000384 = GetResString("CALCULATE_FUNCTIONS_LUA_000384")
	zhanBuFalse[6]=CALCULATE_FUNCTIONS_LUA_000384
	local Notice1 = zhanBuFalse[ZBNType]
	local ZBNowTime=math.floor(math.fmod(GetChaAttr(role,ATTR_EXTEND7),60)/2)+1
	if zbNowState<=0   then 
		CALCULATE_FUNCTIONS_LUA_000385 = GetResString("CALCULATE_FUNCTIONS_LUA_000385")
		CALCULATE_FUNCTIONS_LUA_000386 = GetResString("CALCULATE_FUNCTIONS_LUA_000386")
		local Notice2 =CALCULATE_FUNCTIONS_LUA_000386..ZBNowTime..CALCULATE_FUNCTIONS_LUA_000385
		local zbraid=math.floor((ZB8Debuff(role,1))*1000)/10
		if zbNowState== -81   then 
			CALCULATE_FUNCTIONS_LUA_000387 = GetResString("CALCULATE_FUNCTIONS_LUA_000387")
			return  Notice1.."_"..Notice2.."_"..CALCULATE_FUNCTIONS_LUA_000387	
		end
		if zbNowState== -82   then 
			CALCULATE_FUNCTIONS_LUA_000388 = GetResString("CALCULATE_FUNCTIONS_LUA_000388")
			CALCULATE_FUNCTIONS_LUA_000389 = GetResString("CALCULATE_FUNCTIONS_LUA_000389")
			return Notice1.."_"..Notice2.."_"..CALCULATE_FUNCTIONS_LUA_000389..zbraid..CALCULATE_FUNCTIONS_LUA_000388
		end
		if zbNowState== -83   then
			CALCULATE_FUNCTIONS_LUA_000390 = GetResString("CALCULATE_FUNCTIONS_LUA_000390")
			return Notice1.."_"..Notice2.."_"..CALCULATE_FUNCTIONS_LUA_000390
		end
		return Notice1.."_"..Notice2
	end 
	if zbNowState==13   then
		CALCULATE_FUNCTIONS_LUA_000391 = GetResString("CALCULATE_FUNCTIONS_LUA_000391")
		return Notice1.."_"..CALCULATE_FUNCTIONS_LUA_000391
	end 
	local zhanbuBN={}
	CALCULATE_FUNCTIONS_LUA_000392 = GetResString("CALCULATE_FUNCTIONS_LUA_000392")
	zhanbuBN[1]=CALCULATE_FUNCTIONS_LUA_000392
	CALCULATE_FUNCTIONS_LUA_000393 = GetResString("CALCULATE_FUNCTIONS_LUA_000393")
	zhanbuBN[2]=CALCULATE_FUNCTIONS_LUA_000393
	CALCULATE_FUNCTIONS_LUA_000394 = GetResString("CALCULATE_FUNCTIONS_LUA_000394")
	zhanbuBN[3]=CALCULATE_FUNCTIONS_LUA_000394
	CALCULATE_FUNCTIONS_LUA_000395 = GetResString("CALCULATE_FUNCTIONS_LUA_000395")
	zhanbuBN[4]=CALCULATE_FUNCTIONS_LUA_000395
	CALCULATE_FUNCTIONS_LUA_000396 = GetResString("CALCULATE_FUNCTIONS_LUA_000396")
	zhanbuBN[5]=CALCULATE_FUNCTIONS_LUA_000396
	CALCULATE_FUNCTIONS_LUA_000397 = GetResString("CALCULATE_FUNCTIONS_LUA_000397")
	zhanbuBN[6]=CALCULATE_FUNCTIONS_LUA_000397
	CALCULATE_FUNCTIONS_LUA_000398 = GetResString("CALCULATE_FUNCTIONS_LUA_000398")
	zhanbuBN[7]=CALCULATE_FUNCTIONS_LUA_000398
	CALCULATE_FUNCTIONS_LUA_000399 = GetResString("CALCULATE_FUNCTIONS_LUA_000399")
	zhanbuBN[8]=CALCULATE_FUNCTIONS_LUA_000399
	CALCULATE_FUNCTIONS_LUA_000400 = GetResString("CALCULATE_FUNCTIONS_LUA_000400")
	zhanbuBN[9]=CALCULATE_FUNCTIONS_LUA_000400
	CALCULATE_FUNCTIONS_LUA_000401 = GetResString("CALCULATE_FUNCTIONS_LUA_000401")
	zhanbuBN[10]=CALCULATE_FUNCTIONS_LUA_000401
	local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
	local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
	local ZBstate2=math.fmod(ZBstate,10)
	local ZBStateLV={}
	ZBStateLV[0]={}
	ZBStateLV[0][0]=0
	ZBStateLV[1] = {}
	ZBStateLV[1][1] = 2												
	ZBStateLV[1][2] = 4												
	ZBStateLV[1][3] = 6												
	ZBStateLV[1][4] = 8												
	ZBStateLV[1][5] = 10											
	ZBStateLV[2] = {}
	ZBStateLV[2][1] = 10								
	ZBStateLV[2][2] = 8												
	ZBStateLV[2][3] = 6												
	ZBStateLV[2][4] = 4												
	ZBStateLV[2][5] = 2
	ZBStateLV[3] = {}
	ZBStateLV[3][1] = 1								
	ZBStateLV[3][2] = 1												
	ZBStateLV[3][3] = 1												
	ZBStateLV[3][4] = 1												
	ZBStateLV[3][5] = 1
	ZBStateLV[4] = {}
	ZBStateLV[4][1] = 10								
	ZBStateLV[4][2] = 8												
	ZBStateLV[4][3] = 6												
	ZBStateLV[4][4] = 4
	ZBStateLV[4][5] = 2									
	ZBStateLV[5] = {}
	ZBStateLV[5][1] = 1								
	ZBStateLV[5][2] = 2												
	ZBStateLV[5][3] = 3												
	ZBStateLV[5][4] = 4												
	ZBStateLV[5][5] = 4		
	ZBStateLV[6] = {}
	ZBStateLV[6][1] = 1
	ZBStateLV[6][2] = 2									
	ZBStateLV[6][3] = 3												
	ZBStateLV[6][4] = 4												
	ZBStateLV[6][5] = 4
	local zhanbuXG=""
	local ZBJLTime=math.floor((GetChaAttr(role,ATTR_EXTEND7)-2819)/2)
	if zbNowState==2   then
		CALCULATE_FUNCTIONS_LUA_000402 = GetResString("CALCULATE_FUNCTIONS_LUA_000402")
		CALCULATE_FUNCTIONS_LUA_000403 = GetResString("CALCULATE_FUNCTIONS_LUA_000403")
		zhanbuXG=CALCULATE_FUNCTIONS_LUA_000403..ZBJLTime..CALCULATE_FUNCTIONS_LUA_000402
	elseif zbNowState==1 or zbNowState==4   then  
		CALCULATE_FUNCTIONS_LUA_000388 = GetResString("CALCULATE_FUNCTIONS_LUA_000388")
		CALCULATE_FUNCTIONS_LUA_000404 = GetResString("CALCULATE_FUNCTIONS_LUA_000404")
		zhanbuXG=CALCULATE_FUNCTIONS_LUA_000404..ZBStateLV[ZBstate2][ZBstate1]..CALCULATE_FUNCTIONS_LUA_000388
	elseif zbNowState==5 or zbNowState==6   then
		CALCULATE_FUNCTIONS_LUA_000405 = GetResString("CALCULATE_FUNCTIONS_LUA_000405")
		CALCULATE_FUNCTIONS_LUA_000406 = GetResString("CALCULATE_FUNCTIONS_LUA_000406")
		zhanbuXG=CALCULATE_FUNCTIONS_LUA_000406..(ZBStateLV[ZBstate2][ZBstate1]*200)..CALCULATE_FUNCTIONS_LUA_000405
	end	
	CALCULATE_FUNCTIONS_LUA_000407 = GetResString("CALCULATE_FUNCTIONS_LUA_000407")
	return Notice1.."_"..CALCULATE_FUNCTIONS_LUA_000407..zhanbuBN[zbNowState].." "..zhanbuXG
end 
function ZB8Item(role,now_tick)
	local i=0
	for i=1,4,1 do 
		local chaMGHZ=GetChaItem2(role,2,6439+i)
		local itemName=GetItemName ( 6439+i ) 
		if chaMGHZ~=nil   then 
			local MGHZTime=GetItemAttr(chaMGHZ,ITEMATTR_VAL_STR)
			MGHZTime=MGHZTime+1
			if MGHZTime>360 and i <3   then 
				RemoveChaItem(role,6439+i,99,0,-1,2,1)
			elseif MGHZTime>360 and i >=3   then
				if GetItemAttr(chaMGHZ,ITEMATTR_VAL_CON)~= 1   then 
					SetItemAttr(chaMGHZ,ITEMATTR_VAL_CON,1)
				end
			else
				SetItemAttr(chaMGHZ,ITEMATTR_VAL_STR,MGHZTime)
			end
			SetItemAttr(chaMGHZ,ITEMATTR_VAL_STR,MGHZTime)
		end
	end
end 
function ZB8ItemX(role,now_tick)
	local i=0
	for i=1,2,1 do 
		local chaMGHZ=GetChaItem2(role,2,6439+i)
		if chaMGHZ~=nil   then 
			RemoveChaItem(role,6439+i,99,0,-1,2,1)
		end
	end
end 
function ZB8ItemCharge(role,now_tick)
	local zbState=ZBNowState(role)
	if zbState==-82   then
		local i=0
		for i=1,2,1 do 
			local chaMGHZ=GetChaItem2(role,2,6441+i)
			if chaMGHZ~=nil   then 
				local num1 = GetItemAttr(chaMGHZ,ITEMATTR_VAL_AGI)
				local num2 = GetItemAttr(chaMGHZ,ITEMATTR_VAL_DEX)
				local con = GetItemAttr(chaMGHZ,ITEMATTR_VAL_CON)
				local roleID = GetRoleID(role)
				local num = Attr2To1 (num1,num2)
				if num == roleID and con == 0   then 
					SetChaAttr(role,ATTR_EXTEND1,83)
					SetItemAttr(chaMGHZ,ITEMATTR_VAL_CON,1)
				elseif math.fmod (now_tick,300) == 0   then 	
					local itemName = GetItemName(6441+i)
					CALCULATE_FUNCTIONS_LUA_000408 = GetResString("CALCULATE_FUNCTIONS_LUA_000408")
					CALCULATE_FUNCTIONS_LUA_000409 = GetResString("CALCULATE_FUNCTIONS_LUA_000409")
					SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000409..itemName..CALCULATE_FUNCTIONS_LUA_000408)
				end
			end
		end
	end
end
function XSAddExpAll ( role, value1, value2, type)	------------------��Ӿ��飨С���棩valu1=1,value2=1��Ϊ0.1%
--	SystemNotice( role , "value1="..value1.."value2="..value2.."type="..type)
	local exp_now = GetChaAttr ( role, ATTR_CEXP )
	if type == 1   then							--------�����ּӾ���
		local exp_add = math.random ( value1, value2)
		local lv = GetChaAttr ( role, ATTR_LV )
		if lv < 80   then
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		else
			exp_add = exp_add/50
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		end
	elseif type == 2   then							----------���ٷֱȼӾ���
		local per_exp1 = math.random ( value1, value2)
		local per_exp = per_exp1/10
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv < 80   then
			local lv_next = lv + 1
			local exp_up = GetExp[lv_next] - GetExp[lv]
			local exp_add = math.floor( ( exp_up * per_exp ) / 100 )
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		elseif lv >= 80 and lv < 100   then
			local lv_next = lv + 1
			local exp_up = GetExp[lv_next] - GetExp[lv]
			local exp_add =  math.floor ( ( exp_up * per_exp ) / 5000 )
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		else
			exp_new = exp_now + 10000
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		end
	end
end
function UseAexpItem(role,Item,statelv,statetime)
	local ret = CheckCanUseSB(role,Item,statelv,statetime)
	if ret== 0   then 
		return 0
	end
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	if SBstate~=0   then
		RemoveState( role , STATE_SBJYGZ )
	end
	AddState(role,role,STATE_SBJYGZ,statelv,statetime)
	--SystemNotice(role,"���ԣ���Ӿ���ȼ�Ϊ"..statelv.."����ӳ�ʱ��Ϊ"..statetime)
	return 1
end
function CheckCanUseSB(role,Item,statelv,statetime)
	if statelv > SBStateNUM   then
		CALCULATE_FUNCTIONS_LUA_000410 = GetResString("CALCULATE_FUNCTIONS_LUA_000410")
		CALCULATE_FUNCTIONS_LUA_000411 = GetResString("CALCULATE_FUNCTIONS_LUA_000411")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000411..statelv..CALCULATE_FUNCTIONS_LUA_000410)
		return 0
	end
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	local ItemID = GetItemID (Item)
	local itemName = GetItemName (ItemID)
	--SystemNotice(role,"���ԣ����о���ȼ�Ϊ"..SBstate)
	--SystemNotice(role,"���ԣ����о������ȼ�Ϊ"..SBStateYXJ[SBstate])
	--SystemNotice(role,"���ԣ���Ӿ������ȼ�Ϊ"..SBStateYXJ[statelv])
	if SBStateYXJ[statelv] < SBStateYXJ[SBstate]   then
		if SBStateYXJ[SBstate] > 50   then 
			CALCULATE_FUNCTIONS_LUA_000412 = GetResString("CALCULATE_FUNCTIONS_LUA_000412")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000412..itemName..".")
			return 0
		else
			CALCULATE_FUNCTIONS_LUA_000413 = GetResString("CALCULATE_FUNCTIONS_LUA_000413")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000413)
			return 0
		end
	end
	if SBStateYXJ[statelv] == SBStateYXJ[SBstate]   then
		CALCULATE_FUNCTIONS_LUA_000414 = GetResString("CALCULATE_FUNCTIONS_LUA_000414")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000414)
		return 0
	end	
	return 1
end 
function CheckCanAddSB(role,Item,statelv,statetime,NTC)
	if statelv > SBStateNUM   then
		if NTC== 1   then 
			CALCULATE_FUNCTIONS_LUA_000410 = GetResString("CALCULATE_FUNCTIONS_LUA_000410")
			CALCULATE_FUNCTIONS_LUA_000411 = GetResString("CALCULATE_FUNCTIONS_LUA_000411")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000411..statelv..CALCULATE_FUNCTIONS_LUA_000410)
		end 
		return 0
	end
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	local ItemID = GetItemID (Item)
	local itemName = GetItemName (ItemID)
	--SystemNotice(role,"���ԣ����о���ȼ�Ϊ"..SBstate)
	--SystemNotice(role,"���ԣ����о������ȼ�Ϊ"..SBStateYXJ[statelv])
	--SystemNotice(role,"���ԣ���Ӿ������ȼ�Ϊ"..SBStateYXJ[SBstate])
	if SBstate ~= 0   then
		if SBStateYXJ[SBstate] < 50    then
			if NTC== 1   then 
				CALCULATE_FUNCTIONS_LUA_000415 = GetResString("CALCULATE_FUNCTIONS_LUA_000415")
				CALCULATE_FUNCTIONS_LUA_000416 = GetResString("CALCULATE_FUNCTIONS_LUA_000416")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000416..itemName..CALCULATE_FUNCTIONS_LUA_000415)
			end
			return 0
		end
		if SBStateYXJ[statelv] > SBStateYXJ[SBstate]   then
			if NTC== 1   then 
				CALCULATE_FUNCTIONS_LUA_000415 = GetResString("CALCULATE_FUNCTIONS_LUA_000415")
				CALCULATE_FUNCTIONS_LUA_000417 = GetResString("CALCULATE_FUNCTIONS_LUA_000417")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000417..itemName..CALCULATE_FUNCTIONS_LUA_000415)
			end 
			return 0
		end
	end
	return 1
end
function AddexpItem(role,Item,statelv,statetime,NTC) --ntC: NTCΪ1���Ͳ��ӳɵ�NOTICE��Ϊ0�򲻷��͸��ݹ�������Ƿ����BUFF�Ϳ۳���Ʒʱ�䣬����0�򲻼�BUFF������1 ���BUFF
	local ret = CheckCanAddSB(role,Item,statelv,statetime,NTC)
	if ret== 0   then
		return 0
	end
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	if SBstate ~= 0   then
		if SBstate == statelv   then
			--SystemNotice(role,"���ԣ����о���ȼ�Ϊ"..SBstate.."�ľ��鷵��1")
			return 1
		end
		RemoveState( role , STATE_SBJYGZ )
	end
	AddState(role,role,STATE_SBJYGZ,statelv,statetime)
	--SystemNotice(role,"���ԣ���Ӿ���ȼ�Ϊ"..statelv.."����ӳ�ʱ��Ϊ"..statetime)
	return ret	
end
function CheckCanAddBL(role,Item,statelv,statetime,NTC)
	if statelv > BLStateNUM   then
		if NTC== 1   then 
			CALCULATE_FUNCTIONS_LUA_000418 = GetResString("CALCULATE_FUNCTIONS_LUA_000418")
			CALCULATE_FUNCTIONS_LUA_000411 = GetResString("CALCULATE_FUNCTIONS_LUA_000411")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000411..statelv..CALCULATE_FUNCTIONS_LUA_000418)
		end
		return 0
	end
	local BLstate = GetChaStateLv(role,STATE_SBBLGZ)
	local ItemID = GetItemID (Item)
	local itemName = GetItemName (ItemID)
	--SystemNotice(role,"���ԣ����е��ϵȼ�Ϊ"..BLstate)
	--SystemNotice(role,"���ԣ����е������ȼ�Ϊ"..BLStateYXJ[BLstate])
	--SystemNotice(role,"���ԣ���ӵ������ȼ�Ϊ"..BLStateYXJ[statelv])
	if BLstate ~= 0   then
		if BLStateYXJ[BLstate] < 50    then
			if NTC== 1   then 
				CALCULATE_FUNCTIONS_LUA_000415 = GetResString("CALCULATE_FUNCTIONS_LUA_000415")
				CALCULATE_FUNCTIONS_LUA_000419 = GetResString("CALCULATE_FUNCTIONS_LUA_000419")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000419..itemName..CALCULATE_FUNCTIONS_LUA_000415)
			end
			return 0
		end
		if BLStateYXJ[statelv] > BLStateYXJ[BLstate]   then
			if NTC== 1   then 
				CALCULATE_FUNCTIONS_LUA_000415 = GetResString("CALCULATE_FUNCTIONS_LUA_000415")
				CALCULATE_FUNCTIONS_LUA_000420 = GetResString("CALCULATE_FUNCTIONS_LUA_000420")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000420..itemName..CALCULATE_FUNCTIONS_LUA_000415)
			end 
			return 0
		end
	end
	return 1
	
end
function AddBLItem(role,Item,statelv,statetime,NTC) --ntC: NTCΪ1���Ͳ��ӳɵ�NOTICE��Ϊ0�򲻷��͡����ݹ�������Ƿ����BUFF�Ϳ۳���Ʒʱ�䣬����0�򲻼�BUFF������1 ���BUFF
	local ret = CheckCanAddBL(role,Item,statelv,statetime,NTC)
	if ret== 0   then
		return 0
	end
	local BLstate = GetChaStateLv(role,STATE_SBBLGZ)
	if BLstate ~= 0   then
		if BLstate == statelv   then
			--SystemNotice(role,"���ԣ����е��ϵȼ�Ϊ"..statelv.."�ĵ��Ϸ���1")
			return 1
		end
		RemoveState( role , STATE_SBBLGZ )
	end
	AddState(role,role,STATE_SBBLGZ,statelv,statetime)
	--SystemNotice(role,"���ԣ���ӵ��ϵȼ�Ϊ"..statelv.."���ϼӳ�ʱ��Ϊ"..statetime)
	return ret	
end
function CheckCanUseBL(role,Item,statelv,statetime)
	if statelv > BLStateNUM   then
		CALCULATE_FUNCTIONS_LUA_000418 = GetResString("CALCULATE_FUNCTIONS_LUA_000418")
		CALCULATE_FUNCTIONS_LUA_000411 = GetResString("CALCULATE_FUNCTIONS_LUA_000411")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000411..statelv..CALCULATE_FUNCTIONS_LUA_000418)
		return 0
	end
	local BLstate = GetChaStateLv(role,STATE_SBBLGZ)
	local ItemID = GetItemID (Item)
	local itemName = GetItemName (ItemID)
	--SystemNotice(role,"���ԣ����е��ϵȼ�Ϊ"..BLstate)
	--SystemNotice(role,"���ԣ����е������ȼ�Ϊ"..BLStateYXJ[BLstate])
	--SystemNotice(role,"���ԣ���ӵ������ȼ�Ϊ"..BLStateYXJ[statelv])
	if BLStateYXJ[statelv] < BLStateYXJ[BLstate]   then
		if BLStateYXJ[BLstate] > 50   then 
			CALCULATE_FUNCTIONS_LUA_000421 = GetResString("CALCULATE_FUNCTIONS_LUA_000421")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000421..itemName..".")
			return 0
		else
			CALCULATE_FUNCTIONS_LUA_000422 = GetResString("CALCULATE_FUNCTIONS_LUA_000422")
			SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000422)
			return 0
		end
	end
	if BLStateYXJ[statelv] == BLStateYXJ[BLstate]   then
		CALCULATE_FUNCTIONS_LUA_000423 = GetResString("CALCULATE_FUNCTIONS_LUA_000423")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000423)
		return 0
	end
	return 1
end 
function UseABLItem(role,Item,statelv,statetime)
	local ret = CheckCanUseBL(role,Item,statelv,statetime)
	if ret== 0   then
		return 0
	end
	local BLstate = GetChaStateLv(role,STATE_SBBLGZ)
	if BLstate~=0   then
		RemoveState( role , STATE_SBBLGZ )
	end
	AddState(role,role,STATE_SBBLGZ,statelv,statetime)
	--SystemNotice(role,"���ԣ���ӵ��ϵȼ�Ϊ"..statelv.."���ϼӳ�ʱ��Ϊ"..statetime)
	return ret
end
function CheckCanUseBLandSB(role,Item,statelvSB,statelvBL,statetime)
	return CheckCanUseBL(role,Item,statelvBL,statetime)*CheckCanUseSB(role,Item,statelvSB,statetime,NTC)
end 
function CheckCanAddBLandSB(role,Item,statelvSB,statelvBL,statetime,NTC)
	return CheckCanAddSB(role,Item,statelvSB,statetime,NTC)*CheckCanAddBL(role,Item,statelvBL,statetime,NTC)
end 
function AddBLandSBItem(role,Item,statelvSB,statelvBL,statetime,NTC)
	local ret = CheckCanAddBLandSB(role,Item,statelvSB,statelvBL,statetime,NTC)
	--SystemNotice(role,"���ԣ�ret==="..ret)
	if ret== 0   then
		return 0
	end
	local BLstate = GetChaStateLv(role,STATE_SBBLGZ)
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	if BLstate == statelvBL and SBstate == statelvSB   then
		--SystemNotice(role,"���ԣ����о���ȼ�Ϊ"..statelvSB.."�ľ��鷵��1")
		--SystemNotice(role,"���ԣ����е��ϵȼ�Ϊ"..statelvBL.."�ĵ��Ϸ���1")
		return 1
	end
	if BLstate ~= 0   then
		RemoveState( role , STATE_SBBLGZ )
	end
	if SBstate ~= 0   then	
		RemoveState( role , STATE_SBJYGZ )
	end
	AddState(role,role,STATE_SBBLGZ,statelvBL,statetime)
	AddState(role,role,STATE_SBJYGZ,statelvSB,statetime)
	--SystemNotice(role,"���ԣ���ӵ��ϵȼ�Ϊ"..statelvBL.."���ϼӳ�ʱ��Ϊ"..statetime)
	--SystemNotice(role,"���ԣ���ӵ��ϵȼ�Ϊ"..statelvSB.."���ϼӳ�ʱ��Ϊ"..statetime)
	return ret
end 
function UseABLandSBItem(role,Item,statelvSB,statelvBL,statetime)
	local ret = CheckCanUseBLandSB(role,Item,statelvSB,statelvBL,statetime)
	if ret== 0   then
		return 0
	end
	local BLstate = GetChaStateLv(role,STATE_SBBLGZ)
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	if BLstate ~= 0   then
		RemoveState( role , STATE_SBBLGZ )
	end
	if SBstate ~= 0   then	
		RemoveState( role , STATE_SBJYGZ )
	end
	AddState(role,role,STATE_SBBLGZ,statelvBL,statetime)
	AddState(role,role,STATE_SBJYGZ,statelvSB,statetime)
	--SystemNotice(role,"���ԣ���ӵ��ϵȼ�Ϊ"..statelvBL.."���ϼӳ�ʱ��Ϊ"..statetime)
	--SystemNotice(role,"���ԣ���ӵ��ϵȼ�Ϊ"..statelvSB.."���ϼӳ�ʱ��Ϊ"..statetime)
	return ret
end 
function CheckCanTrigSB(role,statelv,statetime)
	if statelv > SBStateNUM   then
		CALCULATE_FUNCTIONS_LUA_000410 = GetResString("CALCULATE_FUNCTIONS_LUA_000410")
		CALCULATE_FUNCTIONS_LUA_000411 = GetResString("CALCULATE_FUNCTIONS_LUA_000411")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000411..statelv..CALCULATE_FUNCTIONS_LUA_000410)
		return 0
	end
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	--SystemNotice(role,"���ԣ����о���ȼ�Ϊ"..SBstate)
	--SystemNotice(role,"���ԣ����о������ȼ�Ϊ"..SBStateYXJ[SBstate])
	--SystemNotice(role,"���ԣ���Ӿ������ȼ�Ϊ"..SBStateYXJ[statelv])
	if SBStateYXJ[statelv] < SBStateYXJ[SBstate]   then
		local mini = math.floor(statetime/60)
		CALCULATE_FUNCTIONS_LUA_000424 = GetResString("CALCULATE_FUNCTIONS_LUA_000424")
		CALCULATE_FUNCTIONS_LUA_000425 = GetResString("CALCULATE_FUNCTIONS_LUA_000425")
		CALCULATE_FUNCTIONS_LUA_000426 = GetResString("CALCULATE_FUNCTIONS_LUA_000426")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000426..mini..CALCULATE_FUNCTIONS_LUA_000425..SBStateBS[statelv]..CALCULATE_FUNCTIONS_LUA_000424)
		return 0
	end
	if SBStateYXJ[statelv] == SBStateYXJ[SBstate]   then
		CALCULATE_FUNCTIONS_LUA_000414 = GetResString("CALCULATE_FUNCTIONS_LUA_000414")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000414)
		return 0
	end	
	return 1
end
TrigSb={}
TrigSb.id={}
TrigSb.lv={}
TrigSb.statetime={}
TrigSb.count=0
Trigbl={}
Trigbl.count=0
Trigbl.id={}
Trigbl.lv={}
Trigbl.statetime={}
function TrigASBJY(role,statelv,statetime)
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	if SBstate~=0   then
		local mini= math.floor(statetime/60)
		CALCULATE_FUNCTIONS_LUA_000424 = GetResString("CALCULATE_FUNCTIONS_LUA_000424")
		CALCULATE_FUNCTIONS_LUA_000425 = GetResString("CALCULATE_FUNCTIONS_LUA_000425")
		CALCULATE_FUNCTIONS_LUA_000426 = GetResString("CALCULATE_FUNCTIONS_LUA_000426")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000426..mini..CALCULATE_FUNCTIONS_LUA_000425..SBStateBS[statelv]..CALCULATE_FUNCTIONS_LUA_000424)
		TrigSb.count=TrigSb.count+1
		-- SystemNotice(role,"���ԣ�	TrigSb.count"..TrigSb.count)
		TrigSb.id[TrigSb.count]=GetChaDefaultName(role)
			-- SystemNotice(role,"���ԣ�	TrigSb.id[TrigSb.count]"..TrigSb.id[TrigSb.count])
		TrigSb.lv[TrigSb.count]= statelv
		-- SystemNotice(role,"���ԣ�	statelv"..statelv)
		TrigSb.statetime[TrigSb.count] = statetime
		-- SystemNotice(role,"���ԣ�	TrigSb.statetime[TrigSb.count]"..TrigSb.statetime[TrigSb.count])
		
	else
		AddState(role,role,STATE_SBJYGZ,statelv,statetime)
	end
end
function TrigASBBL(role,statelv,statetime)
	local blstate = GetChaStateLv(role,STATE_SBBLGZ)
	if blstate~=0   then
		local mini= math.floor(statetime/60)
		CALCULATE_FUNCTIONS_LUA_000427 = GetResString("CALCULATE_FUNCTIONS_LUA_000427")
		CALCULATE_FUNCTIONS_LUA_000425 = GetResString("CALCULATE_FUNCTIONS_LUA_000425")
		CALCULATE_FUNCTIONS_LUA_000428 = GetResString("CALCULATE_FUNCTIONS_LUA_000428")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000428..mini..CALCULATE_FUNCTIONS_LUA_000425..BLStateBS[statelv]..CALCULATE_FUNCTIONS_LUA_000427)
	
		Trigbl.count=Trigbl.count+1
		Trigbl.id[Trigbl.count]=GetChaDefaultName(role)
		Trigbl.lv[Trigbl.count]= statelv
		Trigbl.statetime[Trigbl.count] = statetime
	else
		AddState(role,role,STATE_SBBLGZ,statelv,statetime)
	end
end

function bulingSB(role)
	local roleid=GetChaDefaultName(role)
	local i=0
	for i=1,TrigSb.count,1 do
		-- SystemNotice(role,"���ԣ�.roleid"..roleid)
		
		-- SystemNotice(role,"���ԣ�.TrigSb.id[TrigSb.count]"..TrigSb.id[TrigSb.count])
		if TrigSb.id[TrigSb.count]== roleid   then
			-- SystemNotice(role,"���ԣ�.TrigSb.lv[TrigSb.count]"..TrigSb.lv[TrigSb.count])
			-- SystemNotice(role,"���ԣ�TrigSb.statetime[TrigSb.count]"..TrigSb.statetime[TrigSb.count])
			AddState(role,role,STATE_SBJYGZ,TrigSb.lv[TrigSb.count],TrigSb.statetime[TrigSb.count])
			
			return LUA_TRUE
		end
	end
end
function bulingBL(role)
	local roleid=GetChaDefaultName(role)
	local i=0
	for i=1,Trigbl.count,1 do
		if Trigbl.id[Trigbl.count]== roleid   then
			AddState(role,role,STATE_SBBLGZ,TrigSb.lv[TrigSb.count],TrigSb.statetime[TrigSb.count])
			return LUA_TRUE
		end
	end
end
function buling(role)
	local roleid=GetChaDefaultName(role)
	local i=0
	for i=1,Trigbl.count,1 do
		if Trigbl.id[Trigbl.count]== roleid   then
			return LUA_TRUE
		end
	end	
	for i=1,TrigSb.count,1 do
		
		if TrigSb.id[TrigSb.count]== roleid   then	
			return LUA_TRUE
		end
	end
	return LUA_FALSE
end
function CanbulingSB(role)
	-- SystemNotice(role,"���ԣ�CanbulingSB innnn")
	local SBstate = GetChaStateLv(role,STATE_SBJYGZ)
	if SBstate~=0   then 
		CALCULATE_FUNCTIONS_LUA_000429 = GetResString("CALCULATE_FUNCTIONS_LUA_000429")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000429)
		return LUA_FALSE
	end
	local roleid=GetChaDefaultName(role)
	local i = 0
-- SystemNotice(role,"���ԣ�TrigSb.count"..TrigSb.count)
	for i=1,TrigSb.count,1 do
		-- SystemNotice(role,"���ԣ�TrigSb.id[TrigSb.count]"..TrigSb.id[TrigSb.count])
		if TrigSb.id[TrigSb.count]== roleid   then
		-- SystemNotice(role,"���ԣ�CanbulingSB LUA_TRUE")
	
			return LUA_TRUE
		end
	end
	return LUA_FALSE
end	
function CanbulingBL(role)
	local BLstate = GetChaStateLv(role,STATE_SBBLGZ)
	if BLstate~=0   then 
		CALCULATE_FUNCTIONS_LUA_000430 = GetResString("CALCULATE_FUNCTIONS_LUA_000430")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000430)
		return LUA_FALSE
	end
	local roleid=GetChaDefaultName(role)
	local i=0
	for i=1,Trigbl.count,1 do
		if Trigbl.id[Trigbl.count]== roleid   then
			return LUA_TRUE
		end
	end	
	return LUA_FALSE
end		
		
function NewMGH(role,now_tick)
	local bag=4										--��������
	bag=bag-1
	local pNewMGH = GetChaItem ( role , 2 , bag )
	if ValidCha(pNewMGH) == 0   then
		return
	end
	local MGHID=6444								--õ�廨ID
	pNewMGHID=GetItemID(pNewMGH)
	local MGHure= GetItemAttr(pNewMGH,ITEMATTR_URE)
		MGHure= MGHure-49
	if pNewMGHID==MGHID and MGHure>0   then
		
		local statetime = MGHure
		
		local statelvBL=3
		local statelvSB=12
		local NTC=0
		if math.fmod(now_tick,600) == 0   then
			NTC=1
		end
		local ret = AddBLandSBItem(role,pNewMGH,statelvSB,statelvBL,statetime,NTC)
		if now_tick~=1 and MGHure~=0 and ret == 1   then
			MGHure=MGHure-10
			MGHure=MGHure+49
			SetItemAttr(pNewMGH,ITEMATTR_URE,MGHure)
			MGHure=GetItemAttr(pNewMGH,ITEMATTR_URE)
		end
		local statelv = 2
		local MEIGUIstate= GetChaStateLv ( role , STATE_MEIGUI ) 
		if MEIGUIstate==0 and ret == 1   then
			AddState( role , role , STATE_MEIGUI , statelv , statetime ) --õ�廨��Ч
		end
	end
	--SystemNotice(role,"���ԣ�pNewMGHID==="..pNewMGHID)
	--SystemNotice(role,"���ԣ�MGHID==="..MGHID)
	--SystemNotice(role,"���ԣ�MGHure==="..MGHure)
	if  pNewMGHID~=MGHID or MGHure<=0   then
		local SBBLGZstate= GetChaStateLv ( role , STATE_SBBLGZ )
		if SBBLGZstate==3   then 
			RemoveState( role , STATE_SBBLGZ )
		end
		local SBBLGZstate= GetChaStateLv ( role , STATE_MEIGUI )
		if SBBLGZstate==2   then 
			RemoveState( role , STATE_MEIGUI )
		end 
		local SBBLGZstate= GetChaStateLv ( role , STATE_SBJYGZ )
		if SBBLGZstate==12   then 
			RemoveState( role , STATE_SBJYGZ )
		end	
	end
end	
function DuiHuanJQHMG(role)
	local MGHID= 6381
	local MGHSID=6382
	local MGHnum=CheckBagItem(  role , MGHID )
	local MGHSnum=CheckBagItem(  role , MGHSID )
	local num=MGHSnum*99+MGHnum
	if num<999   then
		CALCULATE_FUNCTIONS_LUA_000431 = GetResString("CALCULATE_FUNCTIONS_LUA_000431")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000431)
		return LUA_FALSE
	end
	local bagNuma1=math.floor((MGHnum-1)/99)+1
	local bagNuma2=math.floor((MGHSnum-1)/99)+1
	local bagNuma=bagNuma1+bagNuma2
	local num2=num-999
	local MGHnum1=math.fmod(num2,99)
	local MGHSnum1=math.floor((num2-1)/99)+1
	local bagNumb1=math.floor((MGHnum1-1)/99)+1
	local bagNumb2=math.floor((MGHSnum1-1)/99)+1
	local bagNumb=bagNumb1+bagNumb2+1
	local needBagNum=bagNumb-bagNuma
	local hasBagNum=GetChaFreeBagGridNum ( role )		
	if hasBagNum<needBagNum   then
		CALCULATE_FUNCTIONS_LUA_000432 = GetResString("CALCULATE_FUNCTIONS_LUA_000432")
		CALCULATE_FUNCTIONS_LUA_000433 = GetResString("CALCULATE_FUNCTIONS_LUA_000433")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000433..needBagNum..CALCULATE_FUNCTIONS_LUA_000432)
		return LUA_FALSE
	end
	RemoveChaItem(role,MGHID,MGHnum,0,-1,2,1)
	RemoveChaItem(role,MGHSID,MGHSnum,0,-1,2,1)
	GiveItem ( role ,0,MGHID , MGHnum1   , 4 )
	GiveItem ( role ,0,MGHSID , MGHSnum1   , 4 )
	local JQMGHid=6444
	local JQMGHnum= 1
	GiveItem ( role ,0,JQMGHid , JQMGHnum   , 4 )
	return LUA_TRUE
end 
--2008��ʥ����-------------------
function WLface(role,now_tick) 
	local maozi = GetChaItem ( role , 1 , 0 )   --ȡװ����ͷ����ָ��   1��װ���� 0��λ����ͷ��
	if maozi == nil    then
		local statelvJY= GetChaStateLv(role,STATE_SBJYGZ)
		local statelvBL= GetChaStateLv(role,STATE_SBBLGZ)
		if statelvJY== 13   then
			RemoveState( role , STATE_SBJYGZ )
		end
		if statelvBL== 6   then
			RemoveState( role , STATE_SBBLGZ )
		end
		return
	end
	local maozi_id = GetItemID( maozi )
	if maozi_id == 1121   then          --�Ϲ�ͷ˫������
		--SystemNotice( role ,"�Ϲ�ͷ˫������")
		local a = GetItemAttr( maozi , ITEMATTR_URE )	
		if a > 0   then
			local NTC=0
			if math.fmod(now_tick,600) == 0   then
				NTC= 1
			end
			local statelv=6
			local statetime= 0.6*a
			local ret=AddBLItem(role,Item,statelv,statetime,NTC)
			if ret == 1   then
				a = a-50
				SetItemAttr( maozi , ITEMATTR_URE , a )
			end
		else 
			CALCULATE_FUNCTIONS_LUA_000434 = GetResString("CALCULATE_FUNCTIONS_LUA_000434")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000434 )
			RemoveChaItem( role , 1121 , 1 , 0 , -1 , 2 , 1 )
			local statelvBL= GetChaStateLv(role,STATE_SBBLGZ)
			if statelvBL== 6   then
				RemoveState( role , STATE_SBBLGZ )
			end
		end
	elseif maozi_id == 1122   then          --�������˫������
		--SystemNotice( role ,"�������˫������")
		local a = GetItemAttr( maozi , ITEMATTR_URE )	
		if a > 0   then
			local NTC=0
			if math.fmod(a,1000) == 0   then
				NTC= 1
			end
			local statelv=13
			local statetime= 0.6*a
			local ret=AddexpItem(role,Item,statelv,statetime,NTC)
			if ret == 1   then
				a = a-50
				SetItemAttr( maozi , ITEMATTR_URE , a )
			end
		else 
			CALCULATE_FUNCTIONS_LUA_000435 = GetResString("CALCULATE_FUNCTIONS_LUA_000435")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000435 )
			RemoveChaItem( role , 1122 , 1 , 0 , -1 , 2 , 1 )
			local statelvJY= GetChaStateLv(role,STATE_SBJYGZ)
			if statelvJY== 13   then
				RemoveState( role , STATE_SBJYGZ )
			end
		end
	else
		local statelvJY= GetChaStateLv(role,STATE_SBJYGZ)
		local statelvBL= GetChaStateLv(role,STATE_SBBLGZ)
		if statelvJY== 13   then
			RemoveState( role , STATE_SBJYGZ )
		end
		if statelvBL== 6   then
			RemoveState( role , STATE_SBBLGZ )
		end
	end
end

--[[function WLface(role,now_tick)                     -----------------------������� ���Ϲ����buff5��1ˢ �;�30��1��
	local maozi = GetChaItem ( role , 1 , 0 )   --ȡװ����ͷ����ָ��   1��װ���� 0��λ����ͷ��
	if maozi == nil   then 
		return
	end
	--SystemNotice( role ,"������ʼ")	
	local maozi_id = GetItemID( maozi )

	if maozi_id == 1121   then          --�Ϲ�ͷ˫������
		--SystemNotice( role ,"�Ϲ�ͷ˫������")
		local a = GetItemAttr( maozi , ITEMATTR_URE )	
		if a > 0   then				
			local bufftime = 15             --5��춨һ�Σ�û�о�ˢ15���BUFF		
			AddState(role , role ,  STATE_SBBLGZ, 1 , bufftime ) --˫������
			--SystemNotice( role ,"ˢBUFF˫������")
		else 	
			CALCULATE_FUNCTIONS_LUA_000434 = GetResString("CALCULATE_FUNCTIONS_LUA_000434")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000434 )
			RemoveChaItem( role , 1121 , 1 , 0 , -1 , 2 , 1 )	
			return
		end
	elseif maozi_id == 1122   then     --�������˫������
		--SystemNotice( role ,"�������˫������")
		local a = GetItemAttr( maozi , ITEMATTR_URE )	
		if a > 0   then				
			local bufftime = 15             --5��춨һ�Σ�û�о�ˢ15���BUFF			
			AddState(role , role , STATE_SBJYGZ , 1 , bufftime )   --˫������
			--SystemNotice( role ,"ˢBUFF˫������")
		else 
			CALCULATE_FUNCTIONS_LUA_000435 = GetResString("CALCULATE_FUNCTIONS_LUA_000435")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000435 )
			RemoveChaItem( role , 1122 , 1 , 0 , -1 , 2 , 1 )
			return
		end		
	end
end
function WLface_KILL(role,now_tick)  --��ʢ��߿��;�
	--SystemNotice( role ,"30�뵽�˿�ʼ�۳�1���;�")
	local maozi = GetChaItem ( role , 1 , 0 )   --ȡװ����ͷ����ָ��   1��װ���� 0��λ����ͷ��
	if maozi == nil   then 
		return
	end
	local maozi_id = GetItemID( maozi ) 
	if maozi_id == 1121  or maozi_id == 1122   then
		local a = GetItemAttr( maozi , ITEMATTR_URE )
		a = a-50
		local mm = a/50
		--SystemNotice( role ,"ʣ���;�"..mm)
		SetItemAttr( maozi , ITEMATTR_URE , a )

	end
end]]

function MFDbox(role,now_tick) ------------��ѵ�������;�
	local one_minite=60														--�趨one_miniteΪ60��
	if math.fmod(now_tick, one_minite) == 0 and now_tick > 0   then            --���one_minite��now_tick��������now_tick����0
		local num_MFDbox=0                                          --
		local item_MFDbox=0	
		num_MFDbox = CheckBagItem( role, 6470 )
		if num_MFDbox ~= 1   then
		-- SystemNotice( role ,"����="..num_MFDbox)
			return
		elseif num_MFDbox == 1   then
			item_MFDbox = GetChaItem2 ( role , 2 , 6470 )
			local item_MFDbox_ure=GetItemAttr(item_MFDbox,ITEMATTR_URE)
			if item_MFDbox_ure>=50   then
				item_MFDbox_ure=item_MFDbox_ure-50
				SetItemAttr(item_MFDbox,ITEMATTR_URE,item_MFDbox_ure)
				local tesat= GetItemAttr(item_MFDbox,ITEMATTR_URE)
				-- SystemNotice(role,"sdsdsadsa.."..tesat)
			elseif item_MFDbox_ure <= 0   then
				return
			end
		end
	end
end

-----------------------------��C����by L.li--------------------
function CHYLD(role, now_tick)--------------��C���ߡ�
----------��Ѫ
	local hp_now = GetChaAttr(role, ATTR_HP)
	if hp_now <= 0   then 
		return 
	else 
	local item_yld = GetChaItem(role, 2, 2)
		if item_yld==nil   then 
			return
		end	
		local item1_id = GetItemID(item_yld)
		if item1_id == 6535   then
			local mxhp=GetChaAttr(role , ATTR_MXHP)
			local addhp=1500+hp_now
			-- local addhp=mxhp*0.3+hp_now
			local a = GetChaPerHp(role)
			if a < 0.35   then
				SetChaAttr(role , ATTR_HP, addhp)
				local yldtime = GetItemAttr(item_yld, ITEMATTR_URE)		
				yldtime = yldtime - 50
				local b = GetItemAttr(item_yld, ITEMATTR_URE)
				if b > 0   then
					SetItemAttr(item_yld, ITEMATTR_URE, yldtime)	
				else	
					RemoveChaItem ( role , 6535 , 1 , 2 , 2, 2 , 1  )
					return
				end
			end
		end	
	end
end

function CHTLD(role, now_tick)--------------��C���ߡ�
---------------------���{		
	local hp_now = GetChaAttr(role, ATTR_HP)
	local sp_now = GetChaAttr(role,ATTR_SP)
	if hp_now <= 0   then 
		return 
	else 
	local item_tld = GetChaItem(role, 2, 3)
		if item_tld==nil   then 
			return
		end
		local item2_id = GetItemID(item_tld)
		if item2_id == 6536   then
			local mxsp=GetChaAttr(role , ATTR_MXSP)
			local addsp=2000+sp_now
			-- local addsp=mxsp*0.3+sp_now
			local c = GetChaPerSp(role)
			if c < 0.4   then
				SetChaAttr(role , ATTR_SP, addsp)
				local tldtime = GetItemAttr(item_tld, ITEMATTR_URE)		
				tldtime = tldtime - 50
				local d = GetItemAttr(item_tld, ITEMATTR_URE)
				if d > 0   then
					SetItemAttr(item_tld, ITEMATTR_URE, tldtime)	
				else	
					RemoveChaItem ( role , 6536 , 1 , 2 , 3, 2 , 1  )
					return
				end
			end
		end
	end
end 
function HaiDaoQi(role , now_tick)
	local HAIDAOQIstatelv =GetChaStateLv(role ,STATE_HAIDAOQI )
	local item = GetChaItem(role , 1 , 3)
	if ValidCha(item) == 0   then 
		if HAIDAOQIstatelv~=0   then 
			RemoveState(role,STATE_HAIDAOQI)
		end
		return
	end
	local itemID= GetItemID(item)
	if itemID <6554 or itemID>6565   then 
		if HAIDAOQIstatelv~=0   then 
			RemoveState(role,STATE_HAIDAOQI)
		end
		return
	end
	if HAIDAOQIstatelv== 0   then
		AddState(role ,role ,STATE_HAIDAOQI,1,18000 )
	end
end

function DelKWKG( role, now_tick )
	local Item_Use = GetChaItem ( role , 1 , 9 )			----ȡ����װ���ĵ���
	if Item_Use == nil   then
		return
	end 
	local ItemID_Use = GetItemID ( Item_Use )			----ȡID
	if ItemID_Use == 6538 or ItemID_Use == 6539 or ItemID_Use == 6585 or ItemID_Use == 6613   then
	local  Item_Ure = GetItemAttr( Item_Use , ITEMATTR_URE )
		if Item_Ure ~= 0   then 
			return
		elseif Item_Ure <= 0   then
			RemoveChaItem ( role , 6538 , 1 , 1 , 9, 2 , 1  )
			RemoveChaItem ( role , 6539 , 1 , 1 , 9, 2 , 1  )
			RemoveChaItem ( role , 6585 , 1 , 1 , 9, 2 , 1  )
			RemoveChaItem ( role , 6585 , 1 , 1 , 9, 2 , 1  )
			RemoveChaItem ( role , 6613 , 1 , 1 , 9, 2 , 1  )
		end
	end
end

function ItemUse_sword1 ( role , Item )------ Armor Magic
	
	 GiveItem(role,0,9162,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,9162)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 11 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 14 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 27 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end


function ItemUse_sword2 ( role , Item )------ Armor Cruz
	
	 GiveItem(role,0,9162,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,9162)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 11 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 14 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 26 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword3 ( role , Item )------ Gloves SS
	
	 GiveItem(role,0,9161,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,9161)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 10 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 51 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 28 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword4 ( role , Item )------ Gloves Cruz
	
	 GiveItem(role,0,9161,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,9161)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 21 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 51 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 28 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword5 ( role , Item )------ Bots Melle Class
	
	 GiveItem(role,0,9163,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,9163)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 15 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 29 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 53 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end


function ItemUse_sword6 ( role , Item )------ Gloves Magic
	
	 GiveItem(role,0,9161,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,9161)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 55 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 58 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 15 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end


function ItemUse_sword7 ( role , Item )------ Boots Magic
	
	 GiveItem(role,0,9163,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,9163)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 15 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 8 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 9 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword8 ( role , Item )------ Shield
	
	 GiveItem(role,0,7762,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7762)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 11 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 14 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 52 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end


function ItemUse_sword9 ( role , Item )------ Shield
	
	 GiveItem(role,0,7763,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7763)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 25 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 12 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 49 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword10 ( role , Item )------ Shield
	
	 GiveItem(role,0,7764,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7764)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 25 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 12 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 49 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword11 ( role , Item )------ Dagger
	
	 GiveItem(role,0,7765,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7765)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 27 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 16 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 50 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword12 ( role , Item )------ Bow
	
	 GiveItem(role,0,7766,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7766)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 13 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 28 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 64 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword13 ( role , Item )------ SM STAFF
	
	 GiveItem(role,0,7767,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7767)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 16 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 27 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 50 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword14 ( role , Item )------ CL STAFF
	
	 GiveItem(role,0,7768,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7768)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 16 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 27 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 50 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function ItemUse_sword15 ( role , Item )------ SS GUN
	
	 GiveItem(role,0,7769,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,7769)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {9}
        local Item_StoneLv = {9}
        local GemIDSlot01 = 13 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 28 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 64 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 9 -- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 9 -- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
	 
end

function GiveMoHeEquip (role)
	local lv = GetChaAttr (role , ATTR_LV)
	local job = GetChaAttr (role , ATTR_JOB)
	local type = GetChaTypeID (role)
	if lv >=50 and type == 2   then 
		local a = math.random (1,2)
		GiveItem(role ,0, 1124+a ,1,4)
		return 1124+a
	end
	if lv >=40 and job<=7   then 
		lv = 35
	end
	lv = math.floor(lv/5)*5
	local MoHeZBID={} 
	local MoHeZBType={}
	local MoHeZBLV={}
	local MoHeZBJob={}
	local allCount = InItMoHeEquip (MoHeZBID,MoHeZBType,MoHeZBLV,MoHeZBJob)
	local equip = {}
	equip[1]= 0466
	local equipCount = 0 
	local i = 0 
	for i = 1 ,allCount ,1 do 

		if job == MoHeZBJob[i] and lv == MoHeZBLV[i] and CheckType(type,MoHeZBType[i])== 1   then 
			equipCount= equipCount+1
			equip[equipCount] = MoHeZBID[i]
		end
	end
	local b = 1 
	if equipCount> 0   then
		b = math.random (1,equipCount )
	end
	GiveItem(role , 0 ,equip[b],1, 4 )
	return equip[b]
end
function CheckType(type,mohetype)
	if type == mohetype   then 	
		return 1 
	end 
	if mohetype == 5 and type <= 3   then 
		return 1
	end
	if mohetype == 1 and type== 3   then 
		return 1 
	end
	return 0 
end
	
function InItMoHeEquip (MoHeZBID,MoHeZBType,MoHeZBLV,MoHeZBJob)
	MoHeZBID[1]= 0466	MoHeZBType[1]= 5	MoHeZBLV[1]= 10	MoHeZBJob[1]= 1
	MoHeZBID[2]= 0481	MoHeZBType[2]= 1	MoHeZBLV[2]= 10	MoHeZBJob[2]= 2
	MoHeZBID[3]= 0511	MoHeZBType[3]= 1	MoHeZBLV[3]= 10	MoHeZBJob[3]= 4
	MoHeZBID[4]= 0541	MoHeZBType[4]= 3	MoHeZBLV[4]= 10	MoHeZBJob[4]= 5
	MoHeZBID[5]= 0556	MoHeZBType[5]= 4	MoHeZBLV[5]= 10	MoHeZBJob[5]= 4
	MoHeZBID[6]= 0559	MoHeZBType[6]= 4	MoHeZBLV[6]= 10	MoHeZBJob[6]= 5
	MoHeZBID[7]= 0642	MoHeZBType[7]= 5	MoHeZBLV[7]= 10	MoHeZBJob[7]= 1
	MoHeZBID[8]= 0657	MoHeZBType[8]= 1	MoHeZBLV[8]= 10	MoHeZBJob[8]= 2
	MoHeZBID[9]= 0687	MoHeZBType[9]= 1	MoHeZBLV[9]= 10	MoHeZBJob[9]= 4
	MoHeZBID[10]= 0717	MoHeZBType[10]= 3	MoHeZBLV[10]= 10	MoHeZBJob[10]= 5
	MoHeZBID[11]= 0732	MoHeZBType[11]= 4	MoHeZBLV[11]= 10	MoHeZBJob[11]= 4
	MoHeZBID[12]= 0735	MoHeZBType[12]= 4	MoHeZBLV[12]= 10	MoHeZBJob[12]= 5
	MoHeZBID[13]= 0472	MoHeZBType[13]= 5	MoHeZBLV[13]= 15	MoHeZBJob[13]= 1
	MoHeZBID[14]= 0489	MoHeZBType[14]= 1	MoHeZBLV[14]= 15	MoHeZBJob[14]= 2
	MoHeZBID[15]= 0512	MoHeZBType[15]= 1	MoHeZBLV[15]= 15	MoHeZBJob[15]= 4
	MoHeZBID[16]= 0527	MoHeZBType[16]= 4	MoHeZBLV[16]= 15	MoHeZBJob[16]= 4
	MoHeZBID[17]= 0535	MoHeZBType[17]= 4	MoHeZBLV[17]= 15	MoHeZBJob[17]= 5
	MoHeZBID[18]= 0548	MoHeZBType[18]= 3	MoHeZBLV[18]= 15	MoHeZBJob[18]= 5
	MoHeZBID[19]= 0648	MoHeZBType[19]= 5	MoHeZBLV[19]= 15	MoHeZBJob[19]= 1
	MoHeZBID[20]= 0663	MoHeZBType[20]= 1	MoHeZBLV[20]= 15	MoHeZBJob[20]= 2
	MoHeZBID[21]= 0688	MoHeZBType[21]= 1	MoHeZBLV[21]= 15	MoHeZBJob[21]= 4
	MoHeZBID[22]= 0703	MoHeZBType[22]= 4	MoHeZBLV[22]= 15	MoHeZBJob[22]= 4
	MoHeZBID[23]= 0711	MoHeZBType[23]= 4	MoHeZBLV[23]= 15	MoHeZBJob[23]= 5
	MoHeZBID[24]= 0724	MoHeZBType[24]= 3	MoHeZBLV[24]= 15	MoHeZBJob[24]= 5
	MoHeZBID[25]= 0467	MoHeZBType[25]= 5	MoHeZBLV[25]= 20	MoHeZBJob[25]= 1
	MoHeZBID[26]= 0482	MoHeZBType[26]= 1	MoHeZBLV[26]= 20	MoHeZBJob[26]= 2
	MoHeZBID[27]= 0514	MoHeZBType[27]= 1	MoHeZBLV[27]= 20	MoHeZBJob[27]= 4
	MoHeZBID[28]= 0542	MoHeZBType[28]= 3	MoHeZBLV[28]= 20	MoHeZBJob[28]= 5
	MoHeZBID[29]= 0557	MoHeZBType[29]= 4	MoHeZBLV[29]= 20	MoHeZBJob[29]= 5
	MoHeZBID[30]= 0562	MoHeZBType[30]= 4	MoHeZBLV[30]= 20	MoHeZBJob[30]= 4
	MoHeZBID[31]= 0643	MoHeZBType[31]= 5	MoHeZBLV[31]= 20	MoHeZBJob[31]= 1
	MoHeZBID[32]= 0658	MoHeZBType[32]= 1	MoHeZBLV[32]= 20	MoHeZBJob[32]= 2
	MoHeZBID[33]= 0690	MoHeZBType[33]= 1	MoHeZBLV[33]= 20	MoHeZBJob[33]= 4
	MoHeZBID[34]= 0718	MoHeZBType[34]= 3	MoHeZBLV[34]= 20	MoHeZBJob[34]= 5
	MoHeZBID[35]= 0733	MoHeZBType[35]= 4	MoHeZBLV[35]= 20	MoHeZBJob[35]= 5
	MoHeZBID[36]= 0738	MoHeZBType[36]= 4	MoHeZBLV[36]= 20	MoHeZBJob[36]= 4
	MoHeZBID[37]= 0473	MoHeZBType[37]= 5	MoHeZBLV[37]= 25	MoHeZBJob[37]= 1
	MoHeZBID[38]= 0487	MoHeZBType[38]= 1	MoHeZBLV[38]= 25	MoHeZBJob[38]= 2
	MoHeZBID[39]= 0513	MoHeZBType[39]= 1	MoHeZBLV[39]= 25	MoHeZBJob[39]= 4
	MoHeZBID[40]= 0528	MoHeZBType[40]= 4	MoHeZBLV[40]= 25	MoHeZBJob[40]= 4
	MoHeZBID[41]= 0536	MoHeZBType[41]= 4	MoHeZBLV[41]= 25	MoHeZBJob[41]= 5
	MoHeZBID[42]= 0549	MoHeZBType[42]= 3	MoHeZBLV[42]= 25	MoHeZBJob[42]= 5
	MoHeZBID[43]= 0649	MoHeZBType[43]= 5	MoHeZBLV[43]= 25	MoHeZBJob[43]= 1
	MoHeZBID[44]= 0665	MoHeZBType[44]= 1	MoHeZBLV[44]= 25	MoHeZBJob[44]= 2
	MoHeZBID[45]= 0689	MoHeZBType[45]= 1	MoHeZBLV[45]= 25	MoHeZBJob[45]= 4
	MoHeZBID[46]= 0704	MoHeZBType[46]= 4	MoHeZBLV[46]= 25	MoHeZBJob[46]= 4
	MoHeZBID[47]= 0712	MoHeZBType[47]= 4	MoHeZBLV[47]= 25	MoHeZBJob[47]= 5
	MoHeZBID[48]= 0725	MoHeZBType[48]= 3	MoHeZBLV[48]= 25	MoHeZBJob[48]= 5
	MoHeZBID[49]= 0469	MoHeZBType[49]= 5	MoHeZBLV[49]= 30	MoHeZBJob[49]= 1
	MoHeZBID[50]= 0483	MoHeZBType[50]= 1	MoHeZBLV[50]= 30	MoHeZBJob[50]= 2
	MoHeZBID[51]= 0516	MoHeZBType[51]= 1	MoHeZBLV[51]= 30	MoHeZBJob[51]= 4
	MoHeZBID[52]= 0526	MoHeZBType[52]= 4	MoHeZBLV[52]= 30	MoHeZBJob[52]= 4
	MoHeZBID[53]= 0544	MoHeZBType[53]= 3	MoHeZBLV[53]= 30	MoHeZBJob[53]= 5
	MoHeZBID[54]= 0565	MoHeZBType[54]= 4	MoHeZBLV[54]= 30	MoHeZBJob[54]= 5
	MoHeZBID[55]= 0645	MoHeZBType[55]= 5	MoHeZBLV[55]= 30	MoHeZBJob[55]= 1
	MoHeZBID[56]= 0659	MoHeZBType[56]= 1	MoHeZBLV[56]= 30	MoHeZBJob[56]= 2
	MoHeZBID[57]= 0692	MoHeZBType[57]= 1	MoHeZBLV[57]= 30	MoHeZBJob[57]= 4
	MoHeZBID[58]= 0702	MoHeZBType[58]= 4	MoHeZBLV[58]= 30	MoHeZBJob[58]= 4
	MoHeZBID[59]= 0720	MoHeZBType[59]= 3	MoHeZBLV[59]= 30	MoHeZBJob[59]= 5
	MoHeZBID[60]= 0741	MoHeZBType[60]= 4	MoHeZBLV[60]= 30	MoHeZBJob[60]= 5
	MoHeZBID[61]= 0474	MoHeZBType[61]= 5	MoHeZBLV[61]= 35	MoHeZBJob[61]= 1
	MoHeZBID[62]= 0490	MoHeZBType[62]= 1	MoHeZBLV[62]= 35	MoHeZBJob[62]= 2
	MoHeZBID[63]= 0515	MoHeZBType[63]= 1	MoHeZBLV[63]= 35	MoHeZBJob[63]= 4
	MoHeZBID[64]= 0530	MoHeZBType[64]= 4	MoHeZBLV[64]= 35	MoHeZBJob[64]= 4
	MoHeZBID[65]= 0537	MoHeZBType[65]= 4	MoHeZBLV[65]= 35	MoHeZBJob[65]= 5
	MoHeZBID[66]= 0550	MoHeZBType[66]= 3	MoHeZBLV[66]= 35	MoHeZBJob[66]= 5
	MoHeZBID[67]= 0650	MoHeZBType[67]= 5	MoHeZBLV[67]= 35	MoHeZBJob[67]= 1
	MoHeZBID[68]= 0666	MoHeZBType[68]= 1	MoHeZBLV[68]= 35	MoHeZBJob[68]= 2
	MoHeZBID[69]= 0691	MoHeZBType[69]= 1	MoHeZBLV[69]= 35	MoHeZBJob[69]= 4
	MoHeZBID[70]= 0706	MoHeZBType[70]= 4	MoHeZBLV[70]= 35	MoHeZBJob[70]= 4
	MoHeZBID[71]= 0713	MoHeZBType[71]= 4	MoHeZBLV[71]= 35	MoHeZBJob[71]= 5
	MoHeZBID[72]= 0726	MoHeZBType[72]= 3	MoHeZBLV[72]= 35	MoHeZBJob[72]= 5
	MoHeZBID[73]= 0471	MoHeZBType[73]= 1	MoHeZBLV[73]= 40	MoHeZBJob[73]= 9
	MoHeZBID[74]= 0476	MoHeZBType[74]= 2	MoHeZBLV[74]= 40	MoHeZBJob[74]= 8
	MoHeZBID[75]= 0486	MoHeZBType[75]= 1	MoHeZBLV[75]= 40	MoHeZBJob[75]= 12
	MoHeZBID[76]= 0517	MoHeZBType[76]= 1	MoHeZBLV[76]= 40	MoHeZBJob[76]= 16
	MoHeZBID[77]= 0529	MoHeZBType[77]= 4	MoHeZBLV[77]= 40	MoHeZBJob[77]= 16
	MoHeZBID[78]= 0543	MoHeZBType[78]= 3	MoHeZBLV[78]= 40	MoHeZBJob[78]= 14
	MoHeZBID[79]= 0546	MoHeZBType[79]= 3	MoHeZBLV[79]= 40	MoHeZBJob[79]= 13
	MoHeZBID[80]= 0566	MoHeZBType[80]= 4	MoHeZBLV[80]= 40	MoHeZBJob[80]= 14
	MoHeZBID[81]= 0568	MoHeZBType[81]= 4	MoHeZBLV[81]= 40	MoHeZBJob[81]= 13
	MoHeZBID[82]= 0647	MoHeZBType[82]= 1	MoHeZBLV[82]= 40	MoHeZBJob[82]= 9
	MoHeZBID[83]= 0652	MoHeZBType[83]= 2	MoHeZBLV[83]= 40	MoHeZBJob[83]= 8
	MoHeZBID[84]= 0662	MoHeZBType[84]= 1	MoHeZBLV[84]= 40	MoHeZBJob[84]= 12
	MoHeZBID[85]= 0693	MoHeZBType[85]= 1	MoHeZBLV[85]= 40	MoHeZBJob[85]= 16
	MoHeZBID[86]= 0705	MoHeZBType[86]= 4	MoHeZBLV[86]= 40	MoHeZBJob[86]= 16
	MoHeZBID[87]= 0719	MoHeZBType[87]= 3	MoHeZBLV[87]= 40	MoHeZBJob[87]= 14
	MoHeZBID[88]= 0722	MoHeZBType[88]= 3	MoHeZBLV[88]= 40	MoHeZBJob[88]= 13
	MoHeZBID[89]= 0742	MoHeZBType[89]= 4	MoHeZBLV[89]= 40	MoHeZBJob[89]= 14
	MoHeZBID[90]= 0744	MoHeZBType[90]= 4	MoHeZBLV[90]= 40	MoHeZBJob[90]= 13
	MoHeZBID[91]= 0477	MoHeZBType[91]= 2	MoHeZBLV[91]= 45	MoHeZBJob[91]= 8
	MoHeZBID[92]= 0478	MoHeZBType[92]= 1	MoHeZBLV[92]= 45	MoHeZBJob[92]= 9
	MoHeZBID[93]= 0491	MoHeZBType[93]= 1	MoHeZBLV[93]= 45	MoHeZBJob[93]= 12
	MoHeZBID[94]= 0518	MoHeZBType[94]= 1	MoHeZBLV[94]= 45	MoHeZBJob[94]= 16
	MoHeZBID[95]= 0532	MoHeZBType[95]= 4	MoHeZBLV[95]= 45	MoHeZBJob[95]= 16
	MoHeZBID[96]= 0538	MoHeZBType[96]= 4	MoHeZBLV[96]= 45	MoHeZBJob[96]= 14
	MoHeZBID[97]= 0551	MoHeZBType[97]= 3	MoHeZBLV[97]= 45	MoHeZBJob[97]= 14
	MoHeZBID[98]= 0554	MoHeZBType[98]= 3	MoHeZBLV[98]= 45	MoHeZBJob[98]= 13
	MoHeZBID[99]= 0564	MoHeZBType[99]= 4	MoHeZBLV[99]= 45	MoHeZBJob[99]= 13
	MoHeZBID[100]= 0653	MoHeZBType[100]= 2	MoHeZBLV[100]= 45	MoHeZBJob[100]= 8
	MoHeZBID[101]= 0654	MoHeZBType[101]= 1	MoHeZBLV[101]= 45	MoHeZBJob[101]= 9
	MoHeZBID[102]= 0667	MoHeZBType[102]= 1	MoHeZBLV[102]= 45	MoHeZBJob[102]= 12
	MoHeZBID[103]= 0694	MoHeZBType[103]= 1	MoHeZBLV[103]= 45	MoHeZBJob[103]= 16
	MoHeZBID[104]= 0708	MoHeZBType[104]= 4	MoHeZBLV[104]= 45	MoHeZBJob[104]= 16
	MoHeZBID[105]= 0714	MoHeZBType[105]= 4	MoHeZBLV[105]= 45	MoHeZBJob[105]= 14
	MoHeZBID[106]= 0727	MoHeZBType[106]= 3	MoHeZBLV[106]= 45	MoHeZBJob[106]= 14
	MoHeZBID[107]= 0730	MoHeZBType[107]= 3	MoHeZBLV[107]= 45	MoHeZBJob[107]= 13
	MoHeZBID[108]= 0740	MoHeZBType[108]= 4	MoHeZBLV[108]= 45	MoHeZBJob[108]= 13
	MoHeZBID[109]= 0475	MoHeZBType[109]= 1	MoHeZBLV[109]= 50	MoHeZBJob[109]= 9
	MoHeZBID[110]= 0488	MoHeZBType[110]= 1	MoHeZBLV[110]= 50	MoHeZBJob[110]= 12
	MoHeZBID[111]= 0521	MoHeZBType[111]= 1	MoHeZBLV[111]= 50	MoHeZBJob[111]= 16
	MoHeZBID[112]= 0531	MoHeZBType[112]= 4	MoHeZBLV[112]= 50	MoHeZBJob[112]= 16
	MoHeZBID[113]= 0545	MoHeZBType[113]= 3	MoHeZBLV[113]= 50	MoHeZBJob[113]= 14
	MoHeZBID[114]= 0547	MoHeZBType[114]= 3	MoHeZBLV[114]= 50	MoHeZBJob[114]= 13
	MoHeZBID[115]= 0558	MoHeZBType[115]= 4	MoHeZBLV[115]= 50	MoHeZBJob[115]= 13
	MoHeZBID[116]= 0561	MoHeZBType[116]= 4	MoHeZBLV[116]= 50	MoHeZBJob[116]= 14
	MoHeZBID[117]= 0651	MoHeZBType[117]= 1	MoHeZBLV[117]= 50	MoHeZBJob[117]= 9
	MoHeZBID[118]= 0664	MoHeZBType[118]= 1	MoHeZBLV[118]= 50	MoHeZBJob[118]= 12
	MoHeZBID[119]= 0697	MoHeZBType[119]= 1	MoHeZBLV[119]= 50	MoHeZBJob[119]= 16
	MoHeZBID[120]= 0707	MoHeZBType[120]= 4	MoHeZBLV[120]= 50	MoHeZBJob[120]= 16
	MoHeZBID[121]= 0721	MoHeZBType[121]= 3	MoHeZBLV[121]= 50	MoHeZBJob[121]= 14
	MoHeZBID[122]= 0723	MoHeZBType[122]= 3	MoHeZBLV[122]= 50	MoHeZBJob[122]= 13
	MoHeZBID[123]= 0734	MoHeZBType[123]= 4	MoHeZBLV[123]= 50	MoHeZBJob[123]= 13
	MoHeZBID[124]= 0737	MoHeZBType[124]= 4	MoHeZBLV[124]= 50	MoHeZBJob[124]= 14
	MoHeZBID[125]= 0479	MoHeZBType[125]= 1	MoHeZBLV[125]= 55	MoHeZBJob[125]= 9
	MoHeZBID[126]= 0492	MoHeZBType[126]= 1	MoHeZBLV[126]= 55	MoHeZBJob[126]= 12
	MoHeZBID[127]= 0519	MoHeZBType[127]= 1	MoHeZBLV[127]= 55	MoHeZBJob[127]= 16
	MoHeZBID[128]= 0533	MoHeZBType[128]= 4	MoHeZBLV[128]= 55	MoHeZBJob[128]= 16
	MoHeZBID[129]= 0539	MoHeZBType[129]= 4	MoHeZBLV[129]= 55	MoHeZBJob[129]= 14
	MoHeZBID[130]= 0552	MoHeZBType[130]= 3	MoHeZBLV[130]= 55	MoHeZBJob[130]= 14
	MoHeZBID[131]= 0555	MoHeZBType[131]= 3	MoHeZBLV[131]= 55	MoHeZBJob[131]= 13
	MoHeZBID[132]= 0567	MoHeZBType[132]= 4	MoHeZBLV[132]= 55	MoHeZBJob[132]= 13
	MoHeZBID[133]= 0655	MoHeZBType[133]= 1	MoHeZBLV[133]= 55	MoHeZBJob[133]= 9
	MoHeZBID[134]= 0668	MoHeZBType[134]= 1	MoHeZBLV[134]= 55	MoHeZBJob[134]= 12
	MoHeZBID[135]= 0695	MoHeZBType[135]= 1	MoHeZBLV[135]= 55	MoHeZBJob[135]= 16
	MoHeZBID[136]= 0709	MoHeZBType[136]= 4	MoHeZBLV[136]= 55	MoHeZBJob[136]= 16
	MoHeZBID[137]= 0715	MoHeZBType[137]= 4	MoHeZBLV[137]= 55	MoHeZBJob[137]= 14
	MoHeZBID[138]= 0728	MoHeZBType[138]= 3	MoHeZBLV[138]= 55	MoHeZBJob[138]= 14
	MoHeZBID[139]= 0731	MoHeZBType[139]= 3	MoHeZBLV[139]= 55	MoHeZBJob[139]= 13
	MoHeZBID[140]= 0743	MoHeZBType[140]= 4	MoHeZBLV[140]= 55	MoHeZBJob[140]= 13
	MoHeZBID[141]= 0480	MoHeZBType[141]= 1	MoHeZBLV[141]= 60	MoHeZBJob[141]= 9
	MoHeZBID[142]= 0493	MoHeZBType[142]= 1	MoHeZBLV[142]= 60	MoHeZBJob[142]= 12
	MoHeZBID[143]= 0520	MoHeZBType[143]= 1	MoHeZBLV[143]= 60	MoHeZBJob[143]= 16
	MoHeZBID[144]= 0534	MoHeZBType[144]= 4	MoHeZBLV[144]= 60	MoHeZBJob[144]= 16
	MoHeZBID[145]= 0540	MoHeZBType[145]= 4	MoHeZBLV[145]= 60	MoHeZBJob[145]= 14
	MoHeZBID[146]= 0553	MoHeZBType[146]= 3	MoHeZBLV[146]= 60	MoHeZBJob[146]= 14
	MoHeZBID[147]= 0569	MoHeZBType[147]= 4	MoHeZBLV[147]= 60	MoHeZBJob[147]= 13
	MoHeZBID[148]= 0570	MoHeZBType[148]= 3	MoHeZBLV[148]= 60	MoHeZBJob[148]= 13
	MoHeZBID[149]= 0656	MoHeZBType[149]= 1	MoHeZBLV[149]= 60	MoHeZBJob[149]= 9
	MoHeZBID[150]= 0669	MoHeZBType[150]= 1	MoHeZBLV[150]= 60	MoHeZBJob[150]= 12
	MoHeZBID[151]= 0696	MoHeZBType[151]= 1	MoHeZBLV[151]= 60	MoHeZBJob[151]= 16
	MoHeZBID[152]= 0710	MoHeZBType[152]= 4	MoHeZBLV[152]= 60	MoHeZBJob[152]= 16
	MoHeZBID[153]= 0716	MoHeZBType[153]= 4	MoHeZBLV[153]= 60	MoHeZBJob[153]= 14
	MoHeZBID[154]= 0729	MoHeZBType[154]= 3	MoHeZBLV[154]= 60	MoHeZBJob[154]= 14
	MoHeZBID[155]= 0745	MoHeZBType[155]= 4	MoHeZBLV[155]= 60	MoHeZBJob[155]= 13
	MoHeZBID[156]= 0746	MoHeZBType[156]= 3	MoHeZBLV[156]= 60	MoHeZBJob[156]= 13
	return 156
end
function GiveMoHeJiPiao (role)
	local MoHeJPID = {}
	MoHeJPID[1]=0332
	MoHeJPID[2]=0563
	MoHeJPID[3]=0583
	MoHeJPID[4]=3831
	MoHeJPID[5]=3832
	MoHeJPID[6]=3833
	MoHeJPID[7]=4602
	MoHeJPID[8]=4603
	MoHeJPID[9]=4604
	local a = math.random(1,9)
	GiveItem(role , 0,MoHeJPID[a],math.floor((a-1)/3)+1,4 )
	return MoHeJPID[a]
end


function GiveMoHeExp (role,per)
	local a = math.random(1,2)
	if a == 2   then 	
		AddExpRealPer(role,per)
	elseif a == 1   then 
		local lv =GetChaAttr (role , ATTR_LV)
		lv = math.floor(lv/10)
		if lv >= 6   then 
			lv = 5
		end
		if lv <=0   then 
			return 
		end
		local MoHeExp ={}
		MoHeExp[1]=7000				
		MoHeExp[2]=50000
		MoHeExp[3]=220000
		MoHeExp[4]=750000
		MoHeExp[5]=2550000
		AddExp(role,0,per*MoHeExp[lv],per*MoHeExp[lv])
	end
	return "exp"
end

function GiveMoHeHF (role,num)
	local MoHeHFID ={}
	local MoHeHFNum = {}
	MoHeHFID[1]=1848	MoHeHFNum[1]=12
	MoHeHFID[2]=1849	MoHeHFNum[2]=4
	MoHeHFID[3]=6203	MoHeHFNum[3]=2
	local lv = GetChaAttr (role , ATTR_LV)
	lv = math.floor((lv-1 )/ 15)
	if lv <1 or lv>3   then 
		lv =1 
	end
	GiveItem(role , 0 ,MoHeHFID[lv],MoHeHFNum[lv]*num,4)
	return MoHeHFID[lv]
end

function GiveMoHeSP(role)
	local 	MoHeSPID = {}
	MoHeSPID[1]=6342
	MoHeSPID[2]=3077
	MoHeSPID[3]=935
	local ran = 1
	local a = math.random(1,10)
	if a > 5 and a <= 9   then
		ran = 2
	elseif a > 9   then
		ran = 3
	end	
	GiveItem(role , 0 ,MoHeSPID[ran],1,4)
	return	MoHeSPID[ran]
end 

function AddExpRealPer ( role , per,exp )
	if exp == nil   then 
		exp = 0 
	end
	local lv = GetChaAttr (role ,ATTR_LV)
	local cexp = GetChaAttr (role ,ATTR_CEXP)
	local cper = (cexp- GetExp[lv] )/(GetExp[lv+1] - GetExp[lv] )
	local nper = cper+per
	local nper1 = math.floor (nper)
	local nper2 = nper-math.floor (nper)
	local nexp = cexp
	if lv+nper1 >= 120   then 
		nper1 = 120- lv
	end
	-- if lv+nper1 >= 80 and lv <80   then
		-- nexp = GetExp[80]+(GetExp[lv+nper1]-GetExp[80]+nper2*(GetExp[lv+nper1+1]-GetExp[lv+nper1]))*50
	-- else
	if lv+nper1 >= 80 and lv >=80   then 
		nexp = ( GetExp[lv+nper1]+nper2*(GetExp[lv+nper1+1]-GetExp[lv+nper1])) *50-cexp*49
	else 
		nexp = GetExp[lv+nper1]+nper2*(GetExp[lv+nper1+1]-GetExp[lv+nper1])
	end
	local addexp = nexp- cexp
	if addexp >= 4294967296   then 
		local name = GetChaDefaultName (role )
		CALCULATE_FUNCTIONS_LUA_000436 = GetResString("CALCULATE_FUNCTIONS_LUA_000436")
		CALCULATE_FUNCTIONS_LUA_000437 = GetResString("CALCULATE_FUNCTIONS_LUA_000437")
		LG ("exp_error",CALCULATE_FUNCTIONS_LUA_000437,name,CALCULATE_FUNCTIONS_LUA_000436, addexp-4294967296)
		CALCULATE_FUNCTIONS_LUA_000438 = GetResString("CALCULATE_FUNCTIONS_LUA_000438")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000438)
		addexp = 4294967295
	end
	AddExp(role , 0 ,addexp,addexp )
end
function Attr1To2(num)
	local num1 =math.floor( num/32768)
	local num2 = math.fmod(num,32768)
	return num1,num2
end
function Attr2To1(num1,num2)
	return num1*32768+num2
end

function XZKcheck(role, now_tick)--------------����Ƿ���������
	local item_xzk = GetChaItem(role, 2, 3)
		if item_xzk == nil   then 
			return 0
		end	
		local xzk_id = GetItemID(item_xzk)
		if xzk_id >= 5882 and xzk_id <= 5893   then
			return 1
			else
			CALCULATE_FUNCTIONS_LUA_000439 = GetResString("CALCULATE_FUNCTIONS_LUA_000439")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000439)
			return 0
		end
end

--����ˮ�ȶһ�1
function JZcheck1(role)
	local JZMJ_Num = CheckBagItem( role,6593 )
	if JZMJ_Num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000440 = GetResString("CALCULATE_FUNCTIONS_LUA_000440")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000440)
		return 0
	end
	local JZMJ_Num1 = GetChaItem2( role , 2 , 6593 )
	local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
	if JZPoint > 494   then
		CALCULATE_FUNCTIONS_LUA_000441 = GetResString("CALCULATE_FUNCTIONS_LUA_000441")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000441)
		return 0
	else
		return 1
	end
end

--����ˮ�ȶһ�2
function JZcheck2(role)
	local JZMJ_Num = CheckBagItem( role,6593 )
	if JZMJ_Num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000440 = GetResString("CALCULATE_FUNCTIONS_LUA_000440")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000440)
		return 0
	end
	local JZMJ_Num1 = GetChaItem2( role , 2 , 6593 )
	local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
	if  JZPoint > 2474    then
		CALCULATE_FUNCTIONS_LUA_000441 = GetResString("CALCULATE_FUNCTIONS_LUA_000441")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000441)
		return 0
	elseif JZPoint < 494   then
		CALCULATE_FUNCTIONS_LUA_000442 = GetResString("CALCULATE_FUNCTIONS_LUA_000442")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000442)
		return 0		
	else
		return 1
	end
end

--����ˮ�ȶһ�3
function JZcheck3(role)
	local JZMJ_Num = CheckBagItem( role,6593 )
	if JZMJ_Num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000440 = GetResString("CALCULATE_FUNCTIONS_LUA_000440")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000440)
		return 0
	end
	local JZMJ_Num1 = GetChaItem2( role , 2 , 6593 )
	local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
	if JZPoint > 7523   then
		CALCULATE_FUNCTIONS_LUA_000441 = GetResString("CALCULATE_FUNCTIONS_LUA_000441")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000441)
		return 0
	elseif JZPoint < 2474   then
		CALCULATE_FUNCTIONS_LUA_000442 = GetResString("CALCULATE_FUNCTIONS_LUA_000442")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000442)
		return 0	
	else
		return 1
	end
end

--����ˮ�ȶһ�4
function JZcheck4(role)
	local JZMJ_Num = CheckBagItem( role,6593 )
	if JZMJ_Num ~= 1   then
		CALCULATE_FUNCTIONS_LUA_000440 = GetResString("CALCULATE_FUNCTIONS_LUA_000440")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000440)
		return 0
	end
	local JZMJ_Num1 = GetChaItem2( role , 2 , 6593 )
	local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
	if JZPoint > 17324   then
		local JZPoint_X = 17325
		SetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR,JZPoint_X)
		return 1
	elseif JZPoint < 7523   then
		CALCULATE_FUNCTIONS_LUA_000442 = GetResString("CALCULATE_FUNCTIONS_LUA_000442")
		SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000442)
		return 0	
	else
		return 1
	end
end

--���Ӷһ��ɹ�
function JZAction1(role)
	local JZMJ_Num1 =  GetChaItem2 ( role , 2 , 6593 )
	local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
	local JZPoint_X=JZPoint+99
	SetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR,JZPoint_X)
	SynChaKitbag(role,13)
	return 1
end

function JZAction2(role)
	local JZMJ_Num1 =  GetChaItem2 ( role , 2 , 6593 )
	local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
	local JZPoint_X=JZPoint+198
	SetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR,JZPoint_X)
	SynChaKitbag(role,13)
	return 1
end

function JZAction3(role)
	local JZMJ_Num1 =  GetChaItem2 ( role , 2 , 6593 )
	local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
	local JZPoint_X=JZPoint+297
	SetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR,JZPoint_X)
	SynChaKitbag(role,13)
	return 1
end

function JZAction4(role)
	if JZPoint_X == 17325   then
		return 1
	else
		local JZMJ_Num1 =  GetChaItem2 ( role , 2 , 6593 )
		local JZPoint = GetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR)
		local JZPoint_X=JZPoint+396
		SetItemAttr ( JZMJ_Num1 , ITEMATTR_VAL_STR,JZPoint_X)
		SynChaKitbag(role,13)
	end
	return 1
end

-----------------------�Ƽ��
function Jiu_Check(role)
	local Jiu = GetChaItem(role, 2, 1)
	local Jiu_ID = GetItemID (Jiu)
		if Jiu_ID == 2967   then
		local ENERGY = GetItemAttr(Jiu, ITEMATTR_ENERGY)
			if ENERGY == 0   then
				return 1
			end
		elseif	Jiu_ID == 6379   then 
		return 1
		else
		CALCULATE_FUNCTIONS_LUA_000443 = GetResString("CALCULATE_FUNCTIONS_LUA_000443")
		SystemNotice ( role, CALCULATE_FUNCTIONS_LUA_000443 ) 
		return 0
	end	
end

function Jiu_Action(role)
	local Jiu = GetChaItem(role, 2, 1)
	local Jiu_ID = GetItemID (Jiu)
	if Jiu_ID == 2967   then
		TakeItem ( role, 0, 2967 ,1 )
	local a = math.random(1,100)
		if a <= 10   then
			SetRecord( role, 1861 )
			ClearMission( role, 1861 )
			CALCULATE_FUNCTIONS_LUA_000444 = GetResString("CALCULATE_FUNCTIONS_LUA_000444")
			SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000444)
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000445 = GetResString("CALCULATE_FUNCTIONS_LUA_000445")
			SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000445)
			return 1
		end
	elseif Jiu_ID == 6379   then
		TakeItem ( role, 0, 6379, 1 )
	local b = math.random(1,100)
		if b <= 20   then
			SetRecord( role, 1861 )
			ClearMission( role, 1861 )
			CALCULATE_FUNCTIONS_LUA_000446 = GetResString("CALCULATE_FUNCTIONS_LUA_000446")
			SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000446)
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000447 = GetResString("CALCULATE_FUNCTIONS_LUA_000447")
			SystemNotice( role, CALCULATE_FUNCTIONS_LUA_000447)
			return 1
		end
	end
end

------------��Ƽ�ʱ��
function Rwine_freq(role,now_tick)
	local Rwine_Num = CheckBagItem( role, 2967 )
	if Rwine_Num < 1   then
		return
	else
	local Rwine = GetChaItem ( role , 2 , 1  ) --ȡ��ɫ�����ڶ�����ָ��
	local Rwine_ID= GetItemID (Rwine)				--ȡ��ָ��ĵ���ID		
	if Rwine_ID == 2967   then				--�������IDΪ2967��ô
		local ENERGY = GetItemAttr(Rwine, ITEMATTR_ENERGY)			--ȡ�õ��ߵĵ�ǰ�;�
		local ENERGY_resume = 1			--����ÿ���ӿ�ȡֵΪ1
			if ENERGY <= 0   then
				ENERGY = 0
			end
			if ENERGY ==0   then			--����;�Ϊ0
				CALCULATE_FUNCTIONS_LUA_000448 = GetResString("CALCULATE_FUNCTIONS_LUA_000448")
				SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000448 )
	 		else 					--����;ò�Ϊ0
				ENERGY = ENERGY - ENERGY_resume  		--�ó��۳����ʵ��ֵ
				SetItemAttr(Rwine, ITEMATTR_ENERGY, ENERGY )			--��ô���õ��ߵĵ�ǰ�;�Ϊ�۳����ʵ��ֵ  URE
			end		
		end
	end
end
---�¾��������ݽṹ
--�ŶӶ���
function GetJJCInfoRole(role)
	local teamlv = GetTeamLV(role)
	local i =0 
	local PeoperNum= 1 
	local teamrole = {}
	teamrole[0]= role 
	for i = 0, 3, 1 do 
		teamrole[i+1] = GetTeamCha(role, i)
		if ValidCha(teamrole[i+1]) == 1   then
			PeoperNum= PeoperNum+1
		end
	end
	local roleID = GetRoleID(role)
	local teamNum = 0 
	local a = 0 
	local b = 0 
	local c = 0 
	for a = 1 , 3 , 1 do	
		for b = 1 ,JJCteam[a].lv[teamlv].count ,1  do 
			for  c = 1 , JJCteam[a].players ,1 do
				if ValidCha(JJCteam[a].lv[teamlv].team[b].teamment[c-1])~=0 and JJCteam[a].lv[teamlv].team[b].teamment[c-1]== roleID   then
					teamNum = a
				end
			end
		end
	end
	for a = 1 , 3 , 1 do	
		for b = 1 ,2 ,1  do 
			for  c = 1 , JJCteam[a].players ,1 do
				if JJCteam[a].lv[teamlv].InTeam[b].InTeamment[c-1]== roleID   then
					teamNum = a
				end
			end
		end
	end
	if teamNum == 0   then 
		for a = 1,3,1 do 
			if JJCteam[a].players  == PeoperNum   then 
				teamNum = a 
			end
		end
	end
	return teamNum,teamlv,PeoperNum
end

function CheckTeam(role)  --����ŶӵĶ����Ƿ��������
	local TeamLeadName = GetChaDefaultName (role)
	local teamlv = GetTeamLV(role)

	if teamlv == 0   then
		CALCULATE_FUNCTIONS_LUA_000449 = GetResString("CALCULATE_FUNCTIONS_LUA_000449")
		return CALCULATE_FUNCTIONS_LUA_000449
	end
	local i =0 
	local PeoperNum= 1 
	local teamrole = {}
	teamrole[0]= role 
	local teammentNum = 1 
	for i = 0, 3, 1 do 
		teamrole[i+1] = GetTeamCha(role, i)
		if ValidCha(teamrole[i+1]) == 1   then
			PeoperNum= PeoperNum+1
		end
		if ValidCha(teamrole[i+1]) == 1   then 
			teammentNum = i+2
		end
		if teammentNum ~= PeoperNum   then 
		CALCULATE_FUNCTIONS_LUA_000450 = GetResString("CALCULATE_FUNCTIONS_LUA_000450")
		return CALCULATE_FUNCTIONS_LUA_000450 
		end
	end

	if PeoperNum ~=  JJCteam[1].players and PeoperNum~=JJCteam[2].players and  PeoperNum~=JJCteam[3].players   then
		
		CALCULATE_FUNCTIONS_LUA_000451 = GetResString("CALCULATE_FUNCTIONS_LUA_000451")
		CALCULATE_FUNCTIONS_LUA_000452 = GetResString("CALCULATE_FUNCTIONS_LUA_000452")
		CALCULATE_FUNCTIONS_LUA_000453 = GetResString("CALCULATE_FUNCTIONS_LUA_000453")
		CALCULATE_FUNCTIONS_LUA_000454 = GetResString("CALCULATE_FUNCTIONS_LUA_000454")
		return CALCULATE_FUNCTIONS_LUA_000454..JJCteam[1].players..CALCULATE_FUNCTIONS_LUA_000453..JJCteam[2].players..CALCULATE_FUNCTIONS_LUA_000452..JJCteam[3].players..CALCULATE_FUNCTIONS_LUA_000451
	end

	local job= {}
	for i = 0, PeoperNum -1, 1 do
		local TeammentName = GetChaDefaultName (teamrole[i])
		local TeamLeadName = GetChaDefaultName (role)
		CALCULATE_FUNCTIONS_LUA_000455 = GetResString("CALCULATE_FUNCTIONS_LUA_000455")
		local TeamNotice = CALCULATE_FUNCTIONS_LUA_000455..TeammentName
		if TeammentName == TeamLeadName   then
			CALCULATE_FUNCTIONS_LUA_000456 = GetResString("CALCULATE_FUNCTIONS_LUA_000456")
			TeamNotice = CALCULATE_FUNCTIONS_LUA_000456
		end
		local	role_lv = GetTeamLV(teamrole[i])
		if role_lv~= teamlv   then
			CALCULATE_FUNCTIONS_LUA_000457 = GetResString("CALCULATE_FUNCTIONS_LUA_000457")
			CALCULATE_FUNCTIONS_LUA_000455 = GetResString("CALCULATE_FUNCTIONS_LUA_000455")
			return CALCULATE_FUNCTIONS_LUA_000455..TeammentName..CALCULATE_FUNCTIONS_LUA_000457 
		end
		if CheckJJCItem(teamrole[i]) == 0   then
			CALCULATE_FUNCTIONS_LUA_000458 = GetResString("CALCULATE_FUNCTIONS_LUA_000458")
			return TeamNotice..CALCULATE_FUNCTIONS_LUA_000458 
		end	
		job[i] = GetChaAttr ( teamrole[i] , ATTR_JOB)
		if job[i] < 8   then
			CALCULATE_FUNCTIONS_LUA_000459 = GetResString("CALCULATE_FUNCTIONS_LUA_000459")
			return TeamNotice..CALCULATE_FUNCTIONS_LUA_000459 
		end
	end
	local JobCheck = 1 
	local JobArg = math.floor (PeoperNum /5)
	local j = 0 
	local reJob = 0
	for i = 0 , PeoperNum -2, 1  do 
		for j = i+1, PeoperNum -1 , 1 do
			if job[i] == job[j]   then
				reJob = reJob+1 
			end
		end
	end
	if reJob > JobArg   then
		local falsenum = PeoperNum - JobArg 
		CALCULATE_FUNCTIONS_LUA_000460 = GetResString("CALCULATE_FUNCTIONS_LUA_000460")
		CALCULATE_FUNCTIONS_LUA_000461 = GetResString("CALCULATE_FUNCTIONS_LUA_000461")
		CALCULATE_FUNCTIONS_LUA_000462 = GetResString("CALCULATE_FUNCTIONS_LUA_000462")
		return CALCULATE_FUNCTIONS_LUA_000462..falsenum..CALCULATE_FUNCTIONS_LUA_000461..PeoperNum..CALCULATE_FUNCTIONS_LUA_000460  
	end	
	local ret = CanPaiDui(role,PeoperNum)

	return ret 
end
function JJCiSReady(role)
	local teamNum,teamlv,PeoperNum = GetJJCInfoRole(role)
	JJCPaiDui(role,teamNum)
	JJCReady(teamNum,teamlv)
	return LUA_TRUE
end
function CheckJJCItem(role)		--�������Ƿ��в�����
	local JJCItem = CheckBagItem (role , 6066)
	if JJCItem~= 1   then
		return 0 
	end
	return 1
end
function GetTeamLV(role)  				--3 :40-59;4:60-79;5:80���ϣ�0 ���ܲμӾ�����
	local	role_lv = GetChaAttr (role , ATTR_LV)
	if role_lv>= 40 and role_lv<60   then
		return 3
	elseif role_lv>= 50 and role_lv<80   then
		return 4
	elseif role_lv>= 80   then
		return 5
	else
		return 0 
	end
end 	
function JJCPaiDui(role,teamNum) -- �Ŷ�ʱ�ɶ�����ӵ���Ӧ��������
	local teamlv = GetTeamLV(role)
	JJCteam[teamNum].lv[teamlv].count=JJCteam[teamNum].lv[teamlv].count+1
	JJCteam[teamNum].lv[teamlv].team[JJCteam[teamNum].lv[teamlv].count]={}
	JJCteam[teamNum].lv[teamlv].team[JJCteam[teamNum].lv[teamlv].count].teamment={}
	JJCteam[teamNum].lv[teamlv].team[JJCteam[teamNum].lv[teamlv].count].teamment[0]= GetRoleID(role)
	CALCULATE_FUNCTIONS_LUA_000463 = GetResString("CALCULATE_FUNCTIONS_LUA_000463")
	CALCULATE_FUNCTIONS_LUA_000464 = GetResString("CALCULATE_FUNCTIONS_LUA_000464")
	SystemNotice(role, CALCULATE_FUNCTIONS_LUA_000464..(JJCteam[teamNum].lv[teamlv].count-1)..CALCULATE_FUNCTIONS_LUA_000463)
	for i = 1 , JJCteam[teamNum].players- 1  , 1 do 
		JJCteam[teamNum].lv[teamlv].team[JJCteam[teamNum].lv[teamlv].count].teamment[i]= GetRoleID(GetTeamCha(role, i-1))
		CALCULATE_FUNCTIONS_LUA_000463 = GetResString("CALCULATE_FUNCTIONS_LUA_000463")
		CALCULATE_FUNCTIONS_LUA_000464 = GetResString("CALCULATE_FUNCTIONS_LUA_000464")
		SystemNotice(GetTeamCha(role, i-1), CALCULATE_FUNCTIONS_LUA_000464..(JJCteam[teamNum].lv[teamlv].count-1)..CALCULATE_FUNCTIONS_LUA_000463)
	end
end 
function CheckATeamTreeAll(teamlv)
	CheckATeamTree(1,teamlv)
	CheckATeamTree(2,teamlv)
	CheckATeamTree(3,teamlv)
end
function CanPaiDui(role,Playerments) --����Ƿ��Ѿ��Ŷ�
	local teamlv = GetTeamLV(role)
	local teamNum = 0 
	local i = 0 
	for i = 1 , 3 , 1 do 
		if JJCteam[i].players == Playerments   then
			teamNum = i 
		end
	end
	CheckATeamTreeAll(teamlv)
	local roleid= GetRoleID(role)
	if JJCteam[teamNum].lv[teamlv].open == 0   then
		local a ={}
		CALCULATE_FUNCTIONS_LUA_000465 = GetResString("CALCULATE_FUNCTIONS_LUA_000465")
		a[1]= CALCULATE_FUNCTIONS_LUA_000465
		CALCULATE_FUNCTIONS_LUA_000466 = GetResString("CALCULATE_FUNCTIONS_LUA_000466")
		a[2]=CALCULATE_FUNCTIONS_LUA_000466
		CALCULATE_FUNCTIONS_LUA_000467 = GetResString("CALCULATE_FUNCTIONS_LUA_000467")
		a[3]=CALCULATE_FUNCTIONS_LUA_000467
		local b ={}
		CALCULATE_FUNCTIONS_LUA_000468 = GetResString("CALCULATE_FUNCTIONS_LUA_000468")
		b[3]=CALCULATE_FUNCTIONS_LUA_000468
		CALCULATE_FUNCTIONS_LUA_000469 = GetResString("CALCULATE_FUNCTIONS_LUA_000469")
		b[4]=CALCULATE_FUNCTIONS_LUA_000469
		CALCULATE_FUNCTIONS_LUA_000470 = GetResString("CALCULATE_FUNCTIONS_LUA_000470")
		b[5]=CALCULATE_FUNCTIONS_LUA_000470
		CALCULATE_FUNCTIONS_LUA_000471 = GetResString("CALCULATE_FUNCTIONS_LUA_000471")
		CALCULATE_FUNCTIONS_LUA_000472 = GetResString("CALCULATE_FUNCTIONS_LUA_000472")
		CALCULATE_FUNCTIONS_LUA_000473 = GetResString("CALCULATE_FUNCTIONS_LUA_000473")
		return CALCULATE_FUNCTIONS_LUA_000473..b[teamlv]..a[teamNum]..CALCULATE_FUNCTIONS_LUA_000472..b[teamlv]..a[teamNum]..CALCULATE_FUNCTIONS_LUA_000471
	end
	if JJCteam[teamNum].lv[teamlv].count == 0   then
		return LUA_TRUE
		
	end
	for i = 1,JJCteam[teamNum].lv[teamlv].count,1 do
		local j = 0 
		for j = 0 , Playerments- 1 ,1 do 
			if roleid == JJCteam[teamNum].lv[teamlv].team[i].teamment[j]   then
				CALCULATE_FUNCTIONS_LUA_000474 = GetResString("CALCULATE_FUNCTIONS_LUA_000474")
				return CALCULATE_FUNCTIONS_LUA_000474
			end
		end
	end
	return LUA_TRUE
end
function CheckAJJCDate(teamNum,teamlv,Becount) --���������Ƿ�����Ч����
	CALCULATE_FUNCTIONS_LUA_000475 = GetResString("CALCULATE_FUNCTIONS_LUA_000475")
	CALCULATE_FUNCTIONS_LUA_000476 = GetResString("CALCULATE_FUNCTIONS_LUA_000476")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000476,Becount,CALCULATE_FUNCTIONS_LUA_000475..teamNum..teamlv)
	local isValue = 1 
	local j = 0
	if JJCteam[teamNum].lv[teamlv].count == 0   then 
		CALCULATE_FUNCTIONS_LUA_000477 = GetResString("CALCULATE_FUNCTIONS_LUA_000477")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000477..teamNum..teamlv)
		return 1
	end	
	local i =0 
	local PeoperNum= 1 
	local teamrole = {}
	teamrole[0]= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[Becount].teamment[0]) 
	local teammentNum = 1 
	for i = 0, 3, 1 do 
		teamrole[i+1] = GetTeamCha(teamrole[0], i)
		if ValidCha(teamrole[i+1]) == 1   then
			PeoperNum= PeoperNum+1
		end
		if ValidCha(teamrole[i+1]) == 1   then 
			teammentNum = i+2
		end
		if teammentNum ~= PeoperNum    then
			CALCULATE_FUNCTIONS_LUA_000478 = GetResString("CALCULATE_FUNCTIONS_LUA_000478")
			CALCULATE_FUNCTIONS_LUA_000479 = GetResString("CALCULATE_FUNCTIONS_LUA_000479")
			LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000479,i+1, CALCULATE_FUNCTIONS_LUA_000478..teamNum..teamlv)
			return 0
		end
	end
	if PeoperNum~=JJCteam[teamNum].players   then
		CALCULATE_FUNCTIONS_LUA_000480 = GetResString("CALCULATE_FUNCTIONS_LUA_000480")
		CALCULATE_FUNCTIONS_LUA_000481 = GetResString("CALCULATE_FUNCTIONS_LUA_000481")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000481..PeoperNum..CALCULATE_FUNCTIONS_LUA_000480..teamNum..teamlv)
		return 0
	end
	for j = 1 , JJCteam[teamNum].players ,1 do 
		if JJCteam[teamNum].lv[teamlv].team[Becount].teamment[j-1]== 0   then
			CALCULATE_FUNCTIONS_LUA_000482 = GetResString("CALCULATE_FUNCTIONS_LUA_000482")
			CALCULATE_FUNCTIONS_LUA_000483 = GetResString("CALCULATE_FUNCTIONS_LUA_000483")
			LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000483,j, CALCULATE_FUNCTIONS_LUA_000482..teamNum..teamlv)
			return 0  
		end
		local role = GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[Becount].teamment[j-1])
		if ValidCha(role)== 0   then
			CALCULATE_FUNCTIONS_LUA_000484 = GetResString("CALCULATE_FUNCTIONS_LUA_000484")
			CALCULATE_FUNCTIONS_LUA_000483 = GetResString("CALCULATE_FUNCTIONS_LUA_000483")
			LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000483,j, CALCULATE_FUNCTIONS_LUA_000484..teamNum..teamlv)
			return 0 
		end
	end
	if isValue == 1   then
		local role = GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[Becount].teamment[0])
		local teamrole = {}
		teamrole[0]= role
		local i = 0 
		for i = 0 ,JJCteam[teamNum].players-2 ,1 do
			teamrole [i+1] = GetTeamCha(role, i)
			if JJCteam[teamNum].lv[teamlv].team[Becount].teamment[i+1]~= GetRoleID(teamrole[i+1])   then
				CALCULATE_FUNCTIONS_LUA_000485 = GetResString("CALCULATE_FUNCTIONS_LUA_000485")
				CALCULATE_FUNCTIONS_LUA_000483 = GetResString("CALCULATE_FUNCTIONS_LUA_000483")
				LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000483,i+1, CALCULATE_FUNCTIONS_LUA_000485..teamNum..teamlv)
				return 0
			end
		end
	end
	CALCULATE_FUNCTIONS_LUA_000486 = GetResString("CALCULATE_FUNCTIONS_LUA_000486")
	CALCULATE_FUNCTIONS_LUA_000487 = GetResString("CALCULATE_FUNCTIONS_LUA_000487")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000487,isValue,CALCULATE_FUNCTIONS_LUA_000486..teamNum..teamlv)
	return isValue
end
function RemoveATeam(teamNum,teamlv,Becount)	--�Ƴ�������һ�����飬����������
	CALCULATE_FUNCTIONS_LUA_000475 = GetResString("CALCULATE_FUNCTIONS_LUA_000475")
	CALCULATE_FUNCTIONS_LUA_000488 = GetResString("CALCULATE_FUNCTIONS_LUA_000488")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000488,Becount,CALCULATE_FUNCTIONS_LUA_000475..teamNum..teamlv)
	local i = 0 
	if JJCteam[teamNum].lv[teamlv].count==Becount   then
		CALCULATE_FUNCTIONS_LUA_000489 = GetResString("CALCULATE_FUNCTIONS_LUA_000489")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000489..teamNum..teamlv)
		local j = 0 
		for j = 1 , JJCteam[teamNum].players , 1 do 
			CALCULATE_FUNCTIONS_LUA_000490 = GetResString("CALCULATE_FUNCTIONS_LUA_000490")
			CALCULATE_FUNCTIONS_LUA_000491 = GetResString("CALCULATE_FUNCTIONS_LUA_000491")
			LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000491,j,CALCULATE_FUNCTIONS_LUA_000490..teamNum..teamlv)
			JJCteam[teamNum].lv[teamlv].team[Becount].teamment[j-1] = 0
		end
	else
		for i= Becount  ,  JJCteam[teamNum].lv[teamlv].count-1 , 1 do 
			CALCULATE_FUNCTIONS_LUA_000492 = GetResString("CALCULATE_FUNCTIONS_LUA_000492")
			CALCULATE_FUNCTIONS_LUA_000493 = GetResString("CALCULATE_FUNCTIONS_LUA_000493")
			CALCULATE_FUNCTIONS_LUA_000494 = GetResString("CALCULATE_FUNCTIONS_LUA_000494")
			LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000494,i+1,CALCULATE_FUNCTIONS_LUA_000493,i,CALCULATE_FUNCTIONS_LUA_000492..teamNum..teamlv)
			local j = 0 
			for j = 1 , JJCteam[teamNum].players , 1 do 
					CALCULATE_FUNCTIONS_LUA_000495 = GetResString("CALCULATE_FUNCTIONS_LUA_000495")
					CALCULATE_FUNCTIONS_LUA_000496 = GetResString("CALCULATE_FUNCTIONS_LUA_000496")
					LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000496,j,CALCULATE_FUNCTIONS_LUA_000495..teamNum..teamlv)
				JJCteam[teamNum].lv[teamlv].team[i].teamment[j-1] =  JJCteam[teamNum].lv[teamlv].team[i+1].teamment[j-1]
			end
		end
	end
	JJCteam[teamNum].lv[teamlv].count= JJCteam[teamNum].lv[teamlv].count -1 
		CALCULATE_FUNCTIONS_LUA_000486 = GetResString("CALCULATE_FUNCTIONS_LUA_000486")
		CALCULATE_FUNCTIONS_LUA_000497 = GetResString("CALCULATE_FUNCTIONS_LUA_000497")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000497,JJCteam[teamNum].lv[teamlv].count,CALCULATE_FUNCTIONS_LUA_000486..teamNum..teamlv)
end
function CheckATeamTreeRound1(teamNum,teamlv,pTemp) --�������е�һ�������Ƿ���Ч�������Ч��ɾ�����飬�������У�ֱ�������иö��б�ŵĶ���Ϊ��Ч����
	CALCULATE_FUNCTIONS_LUA_000498 = GetResString("CALCULATE_FUNCTIONS_LUA_000498")
	CALCULATE_FUNCTIONS_LUA_000499 = GetResString("CALCULATE_FUNCTIONS_LUA_000499")
	CALCULATE_FUNCTIONS_LUA_000500 = GetResString("CALCULATE_FUNCTIONS_LUA_000500")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000500,pTemp,CALCULATE_FUNCTIONS_LUA_000499,CALCULATE_FUNCTIONS_LUA_000498..teamNum..teamlv)
	local IsValue= CheckAJJCDate(teamNum,teamlv,pTemp)
	CALCULATE_FUNCTIONS_LUA_000501 = GetResString("CALCULATE_FUNCTIONS_LUA_000501")
	CALCULATE_FUNCTIONS_LUA_000502 = GetResString("CALCULATE_FUNCTIONS_LUA_000502")
	CALCULATE_FUNCTIONS_LUA_000503 = GetResString("CALCULATE_FUNCTIONS_LUA_000503")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000503,pTemp,CALCULATE_FUNCTIONS_LUA_000502,IsValue,CALCULATE_FUNCTIONS_LUA_000501..teamNum..teamlv)
	if IsValue == 0   then 
		CALCULATE_FUNCTIONS_LUA_000504 = GetResString("CALCULATE_FUNCTIONS_LUA_000504")
		CALCULATE_FUNCTIONS_LUA_000503 = GetResString("CALCULATE_FUNCTIONS_LUA_000503")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000503,pTemp,CALCULATE_FUNCTIONS_LUA_000504..teamNum..teamlv)
		RemoveATeam(teamNum,teamlv,pTemp)
		CheckATeamTreeRound1(teamNum,teamlv,pTemp) 
	end
	CALCULATE_FUNCTIONS_LUA_000505 = GetResString("CALCULATE_FUNCTIONS_LUA_000505")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000505)
end
function CheckATeamTreeRound2(teamNum,teamlv,pTemp)
	if pTemp <= JJCteam[teamNum].lv[teamlv].count   then
	CALCULATE_FUNCTIONS_LUA_000498 = GetResString("CALCULATE_FUNCTIONS_LUA_000498")
	CALCULATE_FUNCTIONS_LUA_000506 = GetResString("CALCULATE_FUNCTIONS_LUA_000506")
	CALCULATE_FUNCTIONS_LUA_000507 = GetResString("CALCULATE_FUNCTIONS_LUA_000507")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000507,pTemp,CALCULATE_FUNCTIONS_LUA_000506,CALCULATE_FUNCTIONS_LUA_000498..teamNum..teamlv)
		CALCULATE_FUNCTIONS_LUA_000508 = GetResString("CALCULATE_FUNCTIONS_LUA_000508")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000508)
		CheckATeamTreeRound1(teamNum,teamlv,pTemp)
		pTemp = pTemp+1
		CheckATeamTreeRound2(teamNum,teamlv,pTemp)
	end
end
function CheckATeamTree(teamNum,teamlv) --�����������ж����Ƿ���Ч���������Ч������ɾ������������֪�������ж���ȫ������Ч����
	LG("JJCLLOGG","----------------------starena"..teamNum..teamlv,"----------------------------------------------")
	CALCULATE_FUNCTIONS_LUA_000498 = GetResString("CALCULATE_FUNCTIONS_LUA_000498")
	CALCULATE_FUNCTIONS_LUA_000509 = GetResString("CALCULATE_FUNCTIONS_LUA_000509")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000509,CALCULATE_FUNCTIONS_LUA_000498..teamNum..teamlv)
	local pTemp = 1 
	CheckATeamTreeRound2(teamNum,teamlv,pTemp)
	CALCULATE_FUNCTIONS_LUA_000498 = GetResString("CALCULATE_FUNCTIONS_LUA_000498")
	CALCULATE_FUNCTIONS_LUA_000510 = GetResString("CALCULATE_FUNCTIONS_LUA_000510")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000510,CALCULATE_FUNCTIONS_LUA_000498..teamNum..teamlv)
end
function CanEntryAJJC(teamNum,teamlv)		--����Ƿ��ܰ�ǰ2֧���鴫���뾺����
	
	CheckATeamTree(teamNum,teamlv)
	local IsValue = 0 
	if JJCteam[teamNum].lv[teamlv].count>= 2 and JJCteam[teamNum].lv[teamlv].state== 0   then
		IsValue = 1
	end
	return IsValue
end
function JJCReady(teamNum,teamlv)		--������׼��
	
	
	local ret = CanEntryAJJC(teamNum,teamlv)
	
	if ret == 0   then
		return 
	end

	JJCteam[teamNum].lv[teamlv].notice = 5
end	
function CanInAJJC(teamNum,teamlv)			--����1δ׼���÷���-1 ����2δ׼���÷��� -2 ��û׼���÷���-3 ��׼�����˷���1
	local ret1= CheckAJJCDate(teamNum,teamlv,1)*CheckCanMove(teamNum,teamlv,1)
	local ret2=CheckAJJCDate(teamNum,teamlv,2)*CheckCanMove(teamNum,teamlv,2)
	if ret1 ==0 and  ret2== 0   then 
		return -3
	end
	if ret1 ==0    then 
		return -1
	end
	if ret2 ==0    then 
		return -2
	end
	return 1
end
function NoEntryJJC(teamNum,teamlv,ret)  --����ʱ����ʱ���ܽ��뾺�����Ĳ���
	CALCULATE_FUNCTIONS_LUA_000511 = GetResString("CALCULATE_FUNCTIONS_LUA_000511")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000511..teamNum..teamlv)
	CALCULATE_FUNCTIONS_LUA_000486 = GetResString("CALCULATE_FUNCTIONS_LUA_000486")
	CALCULATE_FUNCTIONS_LUA_000512 = GetResString("CALCULATE_FUNCTIONS_LUA_000512")
	LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000512,ret,CALCULATE_FUNCTIONS_LUA_000486..teamNum..teamlv)
	local role 
	if ret == -1 or  ret == -2   then 
		local Becount = -ret
		local j = 0 
		for j = 1 , JJCteam[teamNum].players  , 1 do 
			role = GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[Becount].teamment[j-1])
			if ValidCha(role) ~= 0   then
				CALCULATE_FUNCTIONS_LUA_000513 = GetResString("CALCULATE_FUNCTIONS_LUA_000513")
				SystemNotice(role, CALCULATE_FUNCTIONS_LUA_000513)	
			end
		end
		CALCULATE_FUNCTIONS_LUA_000514 = GetResString("CALCULATE_FUNCTIONS_LUA_000514")
		CALCULATE_FUNCTIONS_LUA_000515 = GetResString("CALCULATE_FUNCTIONS_LUA_000515")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000515,Becount,CALCULATE_FUNCTIONS_LUA_000514..teamNum..teamlv)
		RemoveATeam(teamNum,teamlv,Becount)
		CALCULATE_FUNCTIONS_LUA_000516 = GetResString("CALCULATE_FUNCTIONS_LUA_000516")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000516..teamNum..teamlv)
		local i = 0 
		for i = 1 , JJCteam[teamNum].players , 1 do 
			role = GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[1].teamment[i-1])
			if ValidCha(role) ~= 0   then
				CALCULATE_FUNCTIONS_LUA_000517 = GetResString("CALCULATE_FUNCTIONS_LUA_000517")
				SystemNotice(role, CALCULATE_FUNCTIONS_LUA_000517)
			end
		end
	end
	if ret == -3   then
		local i = 0 
		local j = 0 
		for i =1, 2, 1 do
			for j = 1 , JJCteam[teamNum].players  , 1 do 
				role = GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[i].teamment[j-1])
				if ValidCha(role) ~= 0   then
					CALCULATE_FUNCTIONS_LUA_000513 = GetResString("CALCULATE_FUNCTIONS_LUA_000513")
					SystemNotice(role, CALCULATE_FUNCTIONS_LUA_000513)
				end
			end
		end
		CALCULATE_FUNCTIONS_LUA_000518 = GetResString("CALCULATE_FUNCTIONS_LUA_000518")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000518..teamNum..teamlv)		
		RemoveATeam(teamNum,teamlv,2)
		CALCULATE_FUNCTIONS_LUA_000519 = GetResString("CALCULATE_FUNCTIONS_LUA_000519")
		LG("JJCLLOGG",CALCULATE_FUNCTIONS_LUA_000519..teamNum..teamlv)		
		RemoveATeam(teamNum,teamlv,1)
	end
	JJCReady(teamNum,teamlv)
end
function CheckCanMove(teamNum,teamlv,Becount) --5�뵹��ʱ����ʱ������ܷ���뾺����
	local j = 0
	local valua = 1 
	local teamrole=  GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[Becount].teamment[0])
	for j = 0, JJCteam[teamNum].players-1 ,1 do 
		local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[Becount].teamment[j])
		if ValidCha(role)== 0   then
			valua =0  
		else
			local TeammentName = GetChaDefaultName (role)
			local TeamLeadName = GetChaDefaultName (teamrole)
			CALCULATE_FUNCTIONS_LUA_000520 = GetResString("CALCULATE_FUNCTIONS_LUA_000520")
			local TeamNotice = CALCULATE_FUNCTIONS_LUA_000520..TeammentName
			if TeammentName == TeamLeadName   then
				CALCULATE_FUNCTIONS_LUA_000456 = GetResString("CALCULATE_FUNCTIONS_LUA_000456")
				TeamNotice = CALCULATE_FUNCTIONS_LUA_000456
			end
			local State_baitan = GetChaStateLv ( role, STATE_BAT )
			local State_jiaoyi = GetChaStateLv ( role, STATE_JY )
			if State_baitan >= 1   then
				CALCULATE_FUNCTIONS_LUA_000521 = GetResString("CALCULATE_FUNCTIONS_LUA_000521")
				SystemNotice ( teamrole, TeamNotice..CALCULATE_FUNCTIONS_LUA_000521)
				valua =0
			end
			if State_jiaoyi >= 1   then
				CALCULATE_FUNCTIONS_LUA_000522 = GetResString("CALCULATE_FUNCTIONS_LUA_000522")
				SystemNotice ( teamrole, TeamNotice..CALCULATE_FUNCTIONS_LUA_000522)
				valua =0
			end
			if valua == 1   then
				AddAMiaoTui (role,-1)
			end
		end
	end
	return valua
end
function EntryJJC(teamNum,teamlv,map_copy)	--���뾺������������ݲ���
	local c = 0 
	local d = 0 
	for c = 1 , 2 , 1 do 
		for d = 1 , JJCteam[teamNum].players , 1 do 
			JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = JJCteam[teamNum].lv[teamlv].team[c].teamment[d-1]
		end
	end
	local i= 0
	local j = 0
	for i = 3 ,JJCteam[teamNum].lv[teamlv].count ,1  do 
		for  j = 1 , JJCteam[teamNum].players ,1 do
			if ValidCha(JJCteam[teamNum].lv[teamlv].team[i].teamment[j-1])~=0   then
				local role = GetRolebyID(JJCteam[teamNum].lv[teamlv].team[i].teamment[j-1])
				CALCULATE_FUNCTIONS_LUA_000523 = GetResString("CALCULATE_FUNCTIONS_LUA_000523")
				CALCULATE_FUNCTIONS_LUA_000524 = GetResString("CALCULATE_FUNCTIONS_LUA_000524")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000524..(i-2)..CALCULATE_FUNCTIONS_LUA_000523)
			end
		end
	end
	RemoveATeam(teamNum,teamlv,2)
	RemoveATeam(teamNum,teamlv,1)
	SendPlayer(teamNum,teamlv,map_copy)
end
function SendPlayer(teamNum,teamlv,map_copy)  --�������
	local c
	local d
	for c = 1 , 2 , 1 do 
		for d = 1 , JJCteam[teamNum].players , 1 do 
			local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] )
			if ValidCha(role) ~= 0   then 
				GoTo( role, JJCteam[teamNum].lv[teamlv].InTeam[c].x, JJCteam[teamNum].lv[teamlv].InTeam[c].y, JJCteam[teamNum].lv[teamlv].InTeam[c].map)
				AddAll (role)
				AddADiaoXian (role, 1)
				RemoveJJCItem(role)
			end
		end
	end
	JJCstart(teamNum,teamlv,map_copy)
	JJCteam[teamNum].lv[teamlv].state = 1
	JJCteam[teamNum].lv[teamlv].starttime = JJCChangeTimeToNumber() 
end
function JJCChangeTimeToNumber()
	local now_hour= os.date("%H")			-------------ʱ
	local now_miniute= os.date("%M")		-------------��
	local now_scend=  os.date("%S")			-------------��
	now_hour= tonumber(now_hour)			-------------ʱ     
	now_miniute= tonumber(now_miniute)	 	-------------��     
	now_scend= tonumber(now_scend)		-------------��
	local num = now_hour*3600+now_miniute*60+now_scend
	return num
end
function JJCPendTime (starttime,endtime)
	local PendTime  = endtime- starttime
	if PendTime<0   then
		PendTime = 24*3600+PendTime
	end
	return PendTime
end

function NoticePlayer(teamNum,teamlv,map_copy)		--��ʾ���5�뵹��ʱ
	if JJCteam[teamNum].lv[teamlv].notice > 0   then
		local c = 0 
		local d = 0 
		for c = 1 , 2 , 1 do 
			for d = 1 , JJCteam[teamNum].players , 1 do 
				local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].team[c].teamment[d-1])
				if ValidCha(role) ~= 0   then  
					if  JJCteam[teamNum].lv[teamlv].notice == 5   then
						AddAMiaoTui(role,1)
						CALCULATE_FUNCTIONS_LUA_000525 = GetResString("CALCULATE_FUNCTIONS_LUA_000525")
						SystemNotice(role, CALCULATE_FUNCTIONS_LUA_000525)
					end
					SystemNotice(role, "  "..JJCteam[teamNum].lv[teamlv].notice.."!")
				end
			end
		end	
		JJCteam[teamNum].lv[teamlv].notice= JJCteam[teamNum].lv[teamlv].notice -1
		if  JJCteam[teamNum].lv[teamlv].notice == 0   then 
			local ret = CanInAJJC(teamNum,teamlv)
			if ret < 0   then 
				NoEntryJJC(teamNum,teamlv,ret)
			else
				EntryJJC(teamNum,teamlv,map_copy)
			end	
		end
	end
end
----��û���
function GivePointGS(teamNum,teamlv,point,Retime)  --���ž��������������ȼ�������ʱ���֣�����ʱ��(s)
	CALCULATE_FUNCTIONS_LUA_000526 = GetResString("CALCULATE_FUNCTIONS_LUA_000526")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000526)
	CALCULATE_FUNCTIONS_LUA_000527 = GetResString("CALCULATE_FUNCTIONS_LUA_000527")
	CALCULATE_FUNCTIONS_LUA_000528 = GetResString("CALCULATE_FUNCTIONS_LUA_000528")
	CALCULATE_FUNCTIONS_LUA_000529 = GetResString("CALCULATE_FUNCTIONS_LUA_000529")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000529..teamNum..teamlv..CALCULATE_FUNCTIONS_LUA_000528..point..CALCULATE_FUNCTIONS_LUA_000527..Retime)
	local dotime = math.floor(Retime/30)*30
	CALCULATE_FUNCTIONS_LUA_000530 = GetResString("CALCULATE_FUNCTIONS_LUA_000530")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000530..dotime)
	local LVper= math.min((40+(teamlv-3)*30),100)
	CALCULATE_FUNCTIONS_LUA_000531 = GetResString("CALCULATE_FUNCTIONS_LUA_000531")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000531..LVper)
	local timeper =math.min( math.floor(dotime/JJCarg[teamNum].NorTime*100),100)
	CALCULATE_FUNCTIONS_LUA_000532 = GetResString("CALCULATE_FUNCTIONS_LUA_000532")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000532..timeper)
	local GivePoint = point*LVper*timeper/10000
	CALCULATE_FUNCTIONS_LUA_000533 = GetResString("CALCULATE_FUNCTIONS_LUA_000533")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000533..GivePoint)
	CALCULATE_FUNCTIONS_LUA_000534 = GetResString("CALCULATE_FUNCTIONS_LUA_000534")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000534,GivePoint)
	return GivePoint
end 
function GivePoint(teamNum,teamlv,Becount)  --���ž��������������ȼ�������
	CALCULATE_FUNCTIONS_LUA_000535 = GetResString("CALCULATE_FUNCTIONS_LUA_000535")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000535)
	CALCULATE_FUNCTIONS_LUA_000536 = GetResString("CALCULATE_FUNCTIONS_LUA_000536")
	CALCULATE_FUNCTIONS_LUA_000529 = GetResString("CALCULATE_FUNCTIONS_LUA_000529")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000529..teamNum..teamlv..CALCULATE_FUNCTIONS_LUA_000536..Becount)
	local Retime = JJCPendTime (JJCteam[teamNum].lv[teamlv].starttime,JJCteam[teamNum].lv[teamlv].endtime)
	CALCULATE_FUNCTIONS_LUA_000537 = GetResString("CALCULATE_FUNCTIONS_LUA_000537")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000537..Retime)
	local point1 = 	JJCarg[teamNum].NorSucPoint*JJCteam[teamNum].lv[teamlv].InTeam[Becount].win+JJCarg[teamNum].NorFalPoint*(1-JJCteam[teamNum].lv[teamlv].InTeam[Becount].win) 
	CALCULATE_FUNCTIONS_LUA_000538 = GetResString("CALCULATE_FUNCTIONS_LUA_000538")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000538..point1)
	local point2 = CheckExPointPer(teamNum,teamlv,Becount)*JJCarg[teamNum].ExPoint/100
	CALCULATE_FUNCTIONS_LUA_000539 = GetResString("CALCULATE_FUNCTIONS_LUA_000539")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000539..point2)
	local point = point1+point2
	CALCULATE_FUNCTIONS_LUA_000540 = GetResString("CALCULATE_FUNCTIONS_LUA_000540")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000540..point)
	local realpoint = GivePointGS(teamNum,teamlv,point,Retime)
	CALCULATE_FUNCTIONS_LUA_000541 = GetResString("CALCULATE_FUNCTIONS_LUA_000541")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000541..realpoint)
	realpoint = math.floor(realpoint)
	CALCULATE_FUNCTIONS_LUA_000542 = GetResString("CALCULATE_FUNCTIONS_LUA_000542")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000542..realpoint)
	return  realpoint
end 
function CheckExPointPer(teamNum,teamlv,Becount)   --�������Ӧ�û�õĶ������
	CALCULATE_FUNCTIONS_LUA_000543 = GetResString("CALCULATE_FUNCTIONS_LUA_000543")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000543)
	CALCULATE_FUNCTIONS_LUA_000536 = GetResString("CALCULATE_FUNCTIONS_LUA_000536")
	CALCULATE_FUNCTIONS_LUA_000529 = GetResString("CALCULATE_FUNCTIONS_LUA_000529")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000529..teamNum..teamlv..CALCULATE_FUNCTIONS_LUA_000536..Becount)
	local pointPer = 0 
	if teamNum == 3   then 
		CALCULATE_FUNCTIONS_LUA_000544 = GetResString("CALCULATE_FUNCTIONS_LUA_000544")
		LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000544)
		CALCULATE_FUNCTIONS_LUA_000545 = GetResString("CALCULATE_FUNCTIONS_LUA_000545")
		LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000545..JJCteam[teamNum].lv[teamlv].InTeam[Becount].num)
		pointPer = JJCteam[teamNum].lv[teamlv].InTeam[Becount].num*100
		CALCULATE_FUNCTIONS_LUA_000546 = GetResString("CALCULATE_FUNCTIONS_LUA_000546")
		LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000546..pointPer)
	else
		local AllPoint=JJCteam[teamNum].lv[teamlv].InTeam[Becount].num+JJCteam[teamNum].lv[teamlv].InTeam[3-Becount].num
		CALCULATE_FUNCTIONS_LUA_000547 = GetResString("CALCULATE_FUNCTIONS_LUA_000547")
		LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000547..AllPoint)
		if AllPoint == 0   then 
			return 0 
		end
		pointPer = math.floor(JJCteam[teamNum].lv[teamlv].InTeam[Becount].num*100/AllPoint)
		CALCULATE_FUNCTIONS_LUA_000548 = GetResString("CALCULATE_FUNCTIONS_LUA_000548")
		LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000548..pointPer)
	end
	CALCULATE_FUNCTIONS_LUA_000549 = GetResString("CALCULATE_FUNCTIONS_LUA_000549")
	LG("JJCJF",CALCULATE_FUNCTIONS_LUA_000549..pointPer)
	return pointPer
end

function AddAWin (role)
	local zhzz = GetChaItem2 (role,2,6066)
	if zhzz == nil   then
		CALCULATE_FUNCTIONS_LUA_000550 = GetResString("CALCULATE_FUNCTIONS_LUA_000550")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000550)
		return 0
	end
	local winBef = GetItemAttr(zhzz ,ITEMATTR_VAL_AGI )
	local winAft =  winBef+ 1
	SetItemAttr(zhzz ,ITEMATTR_VAL_AGI ,winAft)
end
function AddAFalse (role)
	local zhzz = GetChaItem2 (role,2,6066)
	if zhzz == nil   then
		CALCULATE_FUNCTIONS_LUA_000551 = GetResString("CALCULATE_FUNCTIONS_LUA_000551")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000551)
		return 0
	end
	local winBef = GetItemAttr(zhzz ,ITEMATTR_VAL_DEX )
	local winAft =  winBef+ 1
	SetItemAttr(zhzz ,ITEMATTR_VAL_DEX ,winAft)
end
function AddADiaoXian (role,point)
	local mt,dx = GetJJCMTDX(role)
	dx = dx+point
	SetJJCMTDX(role,mt,dx)
end
function GetJJCMTDX(role)
	local zhzz = GetChaItem2 (role,2,6066)
	if zhzz == nil   then
		CALCULATE_FUNCTIONS_LUA_000552 = GetResString("CALCULATE_FUNCTIONS_LUA_000552")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000552)
		return 0,0
	end
	local num = GetItemAttr(zhzz ,ITEMATTR_VAL_STA )
	local mt = 0
	local dx = 0
	mt = math.floor(num/180)
	dx = math.fmod(num,180)
	local name = GetChaDefaultName(role)
	CALCULATE_FUNCTIONS_LUA_000553 = GetResString("CALCULATE_FUNCTIONS_LUA_000553")
	CALCULATE_FUNCTIONS_LUA_000554 = GetResString("CALCULATE_FUNCTIONS_LUA_000554")
	CALCULATE_FUNCTIONS_LUA_000555 = GetResString("CALCULATE_FUNCTIONS_LUA_000555")
	LG("JJCDXMT",CALCULATE_FUNCTIONS_LUA_000555..name..CALCULATE_FUNCTIONS_LUA_000554..dx..CALCULATE_FUNCTIONS_LUA_000553..mt)
	return mt,dx
end
function SetJJCMTDX(role,mt,dx)
	local name = GetChaDefaultName(role)
	CALCULATE_FUNCTIONS_LUA_000553 = GetResString("CALCULATE_FUNCTIONS_LUA_000553")
	CALCULATE_FUNCTIONS_LUA_000554 = GetResString("CALCULATE_FUNCTIONS_LUA_000554")
	CALCULATE_FUNCTIONS_LUA_000556 = GetResString("CALCULATE_FUNCTIONS_LUA_000556")
	LG("JJCDXMT",CALCULATE_FUNCTIONS_LUA_000556..name..CALCULATE_FUNCTIONS_LUA_000554..dx..CALCULATE_FUNCTIONS_LUA_000553..mt)
	local zhzz = GetChaItem2 (role,2,6066)
	if zhzz == nil   then
		CALCULATE_FUNCTIONS_LUA_000557 = GetResString("CALCULATE_FUNCTIONS_LUA_000557")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000557)
		return 0
	end
    if mt >=180   then
		mt = 179
	end
	if dx >=180   then
		dx = 179
	end
	local num = mt*180+dx
	SetItemAttr(zhzz ,ITEMATTR_VAL_STA,num )
end
function AddAMiaoTui (role,point)
	local mt,dx = GetJJCMTDX(role)
	mt = mt+point
	SetJJCMTDX(role,mt,dx)
end
function AddAll (role)
	local zhzz = GetChaItem2 (role,2,6066)
	if zhzz == nil   then
		CALCULATE_FUNCTIONS_LUA_000558 = GetResString("CALCULATE_FUNCTIONS_LUA_000558")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000558)
		return 0
	end
	local winBef = GetItemAttr(zhzz ,ITEMATTR_MAXURE )
	local winAft =  winBef+ 1
	SetItemAttr(zhzz ,ITEMATTR_MAXURE ,winAft)
end
function Checkstate(teamNum,teamlv)
	return JJCteam[teamNum].lv[teamlv].state
end
function Addwin(role , win)
	if win == 1   then 
		AddAWin (role)
	elseif win == 0   then
		AddAFalse (role)
	else 
		AddAFalse (role)
	end
end
function GetRolebyIDX(roleID )
	if roleID>0   then 
		local role = GetRolebyID(roleID)
		return role
	else
		return 0 
	end
end
function CheckPlayerIsIn(teamNum,teamlv)
	local c = 0 
	local d = 0 
	local pos ={}
	pos[1] = 0
	pos[2]= 0
	for c = 1 , 2 , 1 do 
		for d = 1 , JJCteam[teamNum].players , 1 do 
			local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
			if ValidCha(role) == 0   then
				if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
					JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
				end
			elseif  pos[c]  == 0   then
				pos[c] =CheckPlayerIsInJJC(role,teamNum,teamlv )
			end
			-- local PosX= 0
			-- local PosY= 0 
			-- PosX, PosY = GetChaPos(role)
			-- PosX = math.floor(PosX/100)
			-- PosY = math.floor(PosY/100)
			-- local map = GetChaMapName(role)
			-- if map == "starena2"..teamlv   then
				-- if pos[c] == 0 and PosX >= 52 and PosY >= 50 and PosX<=76 and PosY<= 77   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 76 and PosY >= 59 and PosX<=83 and PosY<= 68   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 46 and PosY >= 58 and PosX<=52 and PosY<= 67   then
					-- pos[c] = 1
				-- end
			-- end
			-- if map == "starena1"..teamlv   then
				-- if pos[c] == 0 and PosX >= 57 and PosY >= 34 and PosX<=70 and PosY<= 52   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 62 and PosY >= 53 and PosX<=65 and PosY<= 65   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 57 and PosY >= 66 and PosX<=70 and PosY<= 83   then
					-- pos[c] = 1
				-- end
			-- end
			-- if map == "starena3"..teamlv   then
				-- if pos[c] == 0 and PosX >= 57 and PosY >= 46 and PosX<= 69 and PosY<= 49   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 62 and PosY >= 50 and PosX<= 64 and PosY<= 56   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 56 and PosY >= 56 and PosX<= 70 and PosY<= 70   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 46 and PosY >= 62 and PosX<= 56 and PosY<= 65   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 42 and PosY >= 56 and PosX<= 45 and PosY<= 69   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 61 and PosY >= 70 and PosX<= 63 and PosY<= 77   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 56 and PosY >= 78 and PosX<= 68 and PosY<= 83   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 70 and PosY >= 61 and PosX<= 78 and PosY<= 65   then
					-- pos[c] = 1
				-- elseif pos[c] == 0 and PosX >= 79 and PosY >= 57 and PosX<= 83 and PosY<= 69   then
					-- pos[c] = 1
				-- end
			-- end
		end
	end	
	return pos[1],pos[2]
end
function GetPosPlayerNum(teamNum,teamlv,team)
	local d = 0 
	local pos =0
	for d = 1 , JJCteam[teamNum].players , 1 do 
		local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[team].InTeamment[d-1])
		if ValidCha(role) == 0   then
			if JJCteam[teamNum].lv[teamlv].InTeam[team].InTeamment[d-1]~= 0   then
				JJCteam[teamNum].lv[teamlv].InTeam[team].InTeamment[d-1] = 0 
			end 
		else
			local PosX= 0
			local PosY= 0 
			PosX, PosY = GetChaPos(role)
			PosX = math.floor(PosX/100)
			PosY = math.floor(PosY/100)
			if PosX >= 56 and PosY >= 56 and PosX<=72 and PosY<=72   then
				pos = pos+1
			end
		end
	end
	return pos
end
function CheckPlayerPos(teamNum,teamlv)
	local c = 0 
	local d = 0 
	local pos ={}
	pos[1] = 0
	pos[2]= 0
	for c = 1 , 2 , 1 do 
		for d = 1 , JJCteam[teamNum].players , 1 do 
			local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
			if ValidCha(role) == 0   then
				if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
					JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
				end 
				return
			end
			local PosX= 0
			local PosY= 0 
			PosX, PosY = GetChaPos(role)
			if pos[c] == 0 and PosX >= 5500 and PosY >= 5600 and PosX<=7100 and PosY<=7100   then
				pos[c] = 1
			end
		end
	end
	return pos[1],pos[2]
end
function SystemNoticeAll(Notice,teamNum,teamlv)
	local c = 0 
	local d = 0 
	for c = 1 , 2 , 1 do 
		for d = 1 , JJCteam[teamNum].players , 1 do 
			local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
			if ValidCha(role) == 0   then
				if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
					JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
				end
				return
			end
			SystemNotice( role , Notice)
		end	
	end
end
function SystemNoticeEnd(teamNum,teamlv)
	JJCteam[teamNum].lv[teamlv].endnotice = 1
	CALCULATE_FUNCTIONS_LUA_000467 = GetResString("CALCULATE_FUNCTIONS_LUA_000467")
	CALCULATE_FUNCTIONS_LUA_000466 = GetResString("CALCULATE_FUNCTIONS_LUA_000466")
	CALCULATE_FUNCTIONS_LUA_000465 = GetResString("CALCULATE_FUNCTIONS_LUA_000465")
	nameNum={CALCULATE_FUNCTIONS_LUA_000465,CALCULATE_FUNCTIONS_LUA_000466,CALCULATE_FUNCTIONS_LUA_000467}
	CALCULATE_FUNCTIONS_LUA_000470 = GetResString("CALCULATE_FUNCTIONS_LUA_000470")
	CALCULATE_FUNCTIONS_LUA_000469 = GetResString("CALCULATE_FUNCTIONS_LUA_000469")
	CALCULATE_FUNCTIONS_LUA_000468 = GetResString("CALCULATE_FUNCTIONS_LUA_000468")
	nameLV={"","",CALCULATE_FUNCTIONS_LUA_000468,CALCULATE_FUNCTIONS_LUA_000469,CALCULATE_FUNCTIONS_LUA_000470}	
	CALCULATE_FUNCTIONS_LUA_000559 = GetResString("CALCULATE_FUNCTIONS_LUA_000559")
	Notice(nameLV[teamlv]..nameNum[teamNum]..CALCULATE_FUNCTIONS_LUA_000559)
	local c = 0 
	local d = 0 
	local namelist=""
	for c = 1 , 2 , 1 do 
		for d = 1 , JJCteam[teamNum].players , 1 do 
			local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
			if ValidCha(role) == 0   then
				if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
					JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
				end
				return
			end
			CALCULATE_FUNCTIONS_LUA_000560 = GetResString("CALCULATE_FUNCTIONS_LUA_000560")
			SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000560)
			AddState(role,role,96,1,1)
			if JJCteam[teamNum].lv[teamlv].InTeam[c].win==0   then
				CALCULATE_FUNCTIONS_LUA_000561 = GetResString("CALCULATE_FUNCTIONS_LUA_000561")
				SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000561)
			elseif JJCteam[teamNum].lv[teamlv].InTeam[c].win==1   then
				if namelist~=""   then 
					CALCULATE_FUNCTIONS_LUA_000453 = GetResString("CALCULATE_FUNCTIONS_LUA_000453")
					namelist=namelist..CALCULATE_FUNCTIONS_LUA_000453..GetChaDefaultName (role)
				else
					namelist = GetChaDefaultName (role)
				end
				CALCULATE_FUNCTIONS_LUA_000562 = GetResString("CALCULATE_FUNCTIONS_LUA_000562")
				SystemNotice( role , CALCULATE_FUNCTIONS_LUA_000562)
			end	
		end	
	end
	if namelist ==""   then
		CALCULATE_FUNCTIONS_LUA_000563 = GetResString("CALCULATE_FUNCTIONS_LUA_000563")
		CALCULATE_FUNCTIONS_LUA_000564 = GetResString("CALCULATE_FUNCTIONS_LUA_000564")
		Notice(CALCULATE_FUNCTIONS_LUA_000564..nameLV[teamlv]..nameNum[teamNum]..CALCULATE_FUNCTIONS_LUA_000563)
	else
		CALCULATE_FUNCTIONS_LUA_000565 = GetResString("CALCULATE_FUNCTIONS_LUA_000565")
		CALCULATE_FUNCTIONS_LUA_000207 = GetResString("CALCULATE_FUNCTIONS_LUA_000207")
		Notice(namelist..CALCULATE_FUNCTIONS_LUA_000207..nameLV[teamlv]..nameNum[teamNum]..CALCULATE_FUNCTIONS_LUA_000565)
	end
end
function CheckPlayerTeam(role,teamNum,teamlv)
	local roleID = GetRoleID(role)
	local c = 0 
	local d = 0 
	for c = 1 , 2 , 1 do 
		for d = 1 , JJCteam[teamNum].players , 1 do 
			if roleID == JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]   then
				return c , d-1
			end
		end	
	end
	return 0
end
function IsPlayerInJJCMap(role)
	local map = GetChaMapName(role)
	local teamNum = 0 
	local teamlv = 0 
	local a = 0
	local b = 0 
	local c = 0 
	local d = 0 
	if string.find(map, "starena") ~= nil   then
		local team = string.gsub(map,"starena","")
		teamNum= math.floor(tonumber(team)/10 )
		teamlv = math.fmod(tonumber(team),10 )
	end
	if teamNum == 0   then 
		return 0 
	end
	return teamNum,teamlv
end
function IsPlayerInJJC(role)
	if  IsPlayerInJJCMap(role) == 0   then 
		return 0 
	end
	local teamNum,teamlv = IsPlayerInJJCMap(role)
	if CheckPlayerTeam(role,teamNum,teamlv) == 0   then 
		return 0 
	end
	local inTeam,inTeamment = CheckPlayerTeam(role,teamNum,teamlv)
	return teamNum,teamlv,inTeam,inTeamment	
end
function ReliveInJJC(teamNum,teamlv)
	local a = 0 
	local i = 0 
	for a = 1 ,2, 1 do 
		for i = 0 , JJCteam[teamNum].players-1 do  
			local role = JJCteam[teamNum].lv[teamlv].InTeam[a].deadthCha[i]
			if ValidCha(role) ~=0   then 
				if JJCteam[teamNum].lv[teamlv].InTeam[a].deadth[i]== 1   then
					local pos = math.random(1,2)
					GoTo( role, JJCteam[teamNum].lv[teamlv].InTeam[pos].x, JJCteam[teamNum].lv[teamlv].InTeam[pos].y, JJCteam[teamNum].lv[teamlv].InTeam[pos].map)
					SetChaPerHp(role,0.8)
					SetChaPerSp(role,0.8)
					GoTo( role, JJCteam[teamNum].lv[teamlv].InTeam[pos].x, JJCteam[teamNum].lv[teamlv].InTeam[pos].y, JJCteam[teamNum].lv[teamlv].InTeam[pos].map)
				end
			end
			if JJCteam[teamNum].lv[teamlv].InTeam[a].deadth[i]~=0   then
				JJCteam[teamNum].lv[teamlv].InTeam[a].deadth[i] = JJCteam[teamNum].lv[teamlv].InTeam[a].deadth[i]-1
			end
		end
	end
end

function IsJJCAreaItem(role)
	local x,y = GetChaPos(role)
	x = math.floor(x/100)
	y = math.floor(y/100)
	if  IsPlayerInJJCMap(role) == 0   then 
		return 0 
	end
	local teamNum,teamlv = IsPlayerInJJCMap(role)
	local areaNum= 0
	for areaNum = 1 , JJCArea[teamNum].areaNum , 1 do 
		local ret = IsInArea(x,y,JJCArea[teamNum].area[areaNum].minx,JJCArea[teamNum].area[areaNum].maxx,JJCArea[teamNum].area[areaNum].miny,JJCArea[teamNum].area[areaNum].maxy)
		if ret == 1   then 
			return 0
		end
	end
	return 1
end
function IsInArea(x,y,minx,maxx,miny,maxy)
	if x>=minx and x<= maxx and y >=miny and y<= maxy   then
		return 1
	else 
		return 0 
	end
end
--�ǻ�֤���Զ�Ӧ
-- ITEMATTR_VAL_STR  ����������LOW
-- ITEMATTR_VAL_CON  jingjichang dianshu Hig
-- ITEMATTR_VAL_AGI  ʤ����
-- ITEMATTR_VAL_DEX  ʧ����
  
-- ITEMATTR_VAL_STA  ������=������
-- ITEMATTR_MAXURE   �ܳ���
--��ʼ��������
JJCteam={}
JJCteamIn = 0 
function InItJJC()
	if JJCteamIn == 1   then 
		return
	end
	local a= 0 
	local b = 0
	local c = 0 
	local d = 0
	local e = 0
	for a = 1 , 3 , 1 do
		JJCteam[a]= {}
	end
	JJCteam[1].players=2
	JJCteam[2].players=3
	JJCteam[3].players=5
	for a = 1 , 3 , 1 do  
		JJCteam[a].lv={}
		for b = 1,	6 ,	1 do 
			JJCteam[a].lv[b]={}
			JJCteam[a].lv[b].count = 0
			JJCteam[a].lv[b].team={}   --�Ŷӵ����ݽṹ
			JJCteam[a].lv[b].team[0]={}
			JJCteam[a].lv[b].team[0].teamment={}
			for d = 1 , JJCteam[a].players , 1 do 
				JJCteam[a].lv[b].team[0].teamment[d-1]=0
			end
			JJCteam[a].lv[b].notice = 0
			JJCteam[a].lv[b].open = 0
			JJCteam[a].lv[b].state = 0
			JJCteam[a].lv[b].starttime = 0 
			JJCteam[a].lv[b].endtime = 0 
			JJCteam[a].lv[b].InTeam={}	--���뾺�����Ķ������ݽṹ
			JJCteam[a].lv[b].JJCMons = {}
			JJCteam[a].lv[b].JJCMonsCha = {}
			JJCteam[a].lv[b].endnotice = 0
			if a == 1   then 
				JJCteam[a].lv[b].JJCMons.count = 4
			elseif a == 2   then
				JJCteam[a].lv[b].JJCMons.count = 0
			elseif a == 3   then 
				JJCteam[a].lv[b].JJCMons.count = 1
			end
			for e = 1 , JJCteam[a].lv[b].JJCMons.count  do 
				JJCteam[a].lv[b].JJCMons[e] = 0
			end
			for c = 1 , 2 , 1 do 
				JJCteam[a].lv[b].InTeam[c]={}
				JJCteam[a].lv[b].InTeam[c].win= 0 
				JJCteam[a].lv[b].InTeam[c].InTeamment ={}
				JJCteam[a].lv[b].InTeam[c].deadth ={}
				JJCteam[a].lv[b].InTeam[c].deadthCha ={}
				JJCteam[a].lv[b].InTeam[c].num = 0  --�ö�����Ͻ�������/ɱ��shu
				JJCteam[a].lv[b].InTeam[c].x = 0 			--�ö����x����
				JJCteam[a].lv[b].InTeam[c].y = 0 			--�ö����y����
				JJCteam[a].lv[b].InTeam[c].map = "starena"..a..b --�ö���ĵ�ͼ��
				if a == 3   then 
					if c == 1   then
						JJCteam[a].lv[b].InTeam[c].x = 62
						JJCteam[a].lv[b].InTeam[c].y = 48
					else 
						JJCteam[a].lv[b].InTeam[c].x = 63
						JJCteam[a].lv[b].InTeam[c].y = 81
					end
				elseif a == 1   then
					if c == 1   then
						JJCteam[a].lv[b].InTeam[c].x = 64
						JJCteam[a].lv[b].InTeam[c].y = 36
					else 
						JJCteam[a].lv[b].InTeam[c].x = 64
						JJCteam[a].lv[b].InTeam[c].y = 80
					end
				elseif a == 2   then
					if c == 1   then
						JJCteam[a].lv[b].InTeam[c].x = 46 
						JJCteam[a].lv[b].InTeam[c].y = 63
					else 
						JJCteam[a].lv[b].InTeam[c].x = 82
						JJCteam[a].lv[b].InTeam[c].y = 63
					end
				end
				for d = 1 , JJCteam[a].players , 1 do 
					JJCteam[a].lv[b].InTeam[c].InTeamment[d-1] = 0
					JJCteam[a].lv[b].InTeam[c].deadth[d-1] = 0
				end
			end
		end
	end 
	JJCteamIn = 1
end
JJC2stay={}
JJC2stay[1]=0
JJC2stay[2]=0
--����������
JJCarg={}
InitJJCargIn = 0 
function InitJJCarg()
	if InitJJCargIn == 1   then
		return
	end
	local a
	local b  
	for a = 1 , 3 , 1 do 
		JJCarg[a]={}
		JJCarg[a].MaxTime =0	--���ʱ��
		JJCarg[a].NorTime =0	--����ʱ��
		JJCarg[a].NorSucPoint = 0 --Ӯ�ñ������Ļ�������
		JJCarg[a].NorFalPoint = 0 --lose�������Ļ�������
		JJCarg[a].ExPoint = 0		--���ձ������̵Ļ���
	end
	--�������
	JJCarg[1].MaxTime = 1*60	
	JJCarg[1].NorTime = 1*60		
	JJCarg[1].NorSucPoint = 100 
	JJCarg[1].NorFalPoint = 50 
	JJCarg[1].ExPoint = 200	
	
	JJCarg[2].MaxTime = 1*60	
	JJCarg[2].NorTime = 1*60	
	JJCarg[2].NorSucPoint = 150 
	JJCarg[2].NorFalPoint = 50 
	JJCarg[2].ExPoint = 150
	
	JJCarg[3].MaxTime = 30*60	
	JJCarg[3].NorTime = 10*60	
	JJCarg[3].NorSucPoint = 300 
	JJCarg[3].NorFalPoint = 60 
	JJCarg[3].ExPoint = 40
	InitJJCargIn =1
	--װ����Ҫ�ĵ���3467 
	JJC50ZByifu = 3467 
	JJC70ZByifu = 8493
	JJC90ZByifu = 24267
	JJC50ZBqita = 2080
	JJC70ZBqita = 6067
	JJC90ZBqita = 17333
end 
needTime = {}
needTime[1]= {}
needTime[2]= {}
needTime[1][1]= 30
needTime[1][2]= 30
needTime[1][3]= 30 
needTime[1][4]= 30 
needTime[1][5]= 30 
needTime[2][1]= 30 
needTime[2][2]= 30
needTime[2][3]= 30 
needTime[2][4]= 30
needTime[2][5]= 30 
beginstateJJC2={}
beginstateJJC2[1]= 0 
beginstateJJC2[2]= 0
beginstateJJC2[3]= 0 
beginstateJJC2[4]= 0 
beginstateJJC2[5]= 0  
function JJC13(map_copy)
	local teamNum = 1 
	local teamlv = 3 
	JJC1(map_copy,teamNum,teamlv)
end
function JJC14(map_copy)
	local teamNum = 1 
	local teamlv = 4
	JJC1(map_copy,teamNum,teamlv)
end
function JJC15(map_copy)
	local teamNum = 1 
	local teamlv = 5 
	JJC1(map_copy,teamNum,teamlv)
end


function JJC1(map_copy,teamNum,teamlv)
	JJCteam[teamNum].lv[teamlv].open = 1
	if JJCteam[teamNum].lv[teamlv].state == 0 and JJCteam[teamNum].lv[teamlv].notice ~= 0   then
		NoticePlayer(teamNum,teamlv,map_copy)
	elseif JJCteam[teamNum].lv[teamlv].state == 1   then	
		ReliveInJJC(teamNum,teamlv)
		local Refresh = 180000
		local life = 1800000
		local monslife={}
		local i = 0
		for i = 1, 4,1 do 
			if JJCteam[teamNum].lv[teamlv].JJCMonsCha[i]~=nil   then 
				monslife[i] = GetChaAttr(JJCteam[teamNum].lv[teamlv].JJCMonsCha[i],ATTR_HP)
				if monslife[i]<= 0   then
					KillCha(JJCteam[teamNum].lv[teamlv].JJCMons[i])
					JJCteam[teamNum].lv[teamlv].JJCMonsCha[i] = nil
				end
			elseif JJCteam[teamNum].lv[teamlv].JJCMons[i]>0   then 
				JJCteam[teamNum].lv[teamlv].JJCMons[i]=JJCteam[teamNum].lv[teamlv].JJCMons[i]-1
			end
		end
		if JJCteam[teamNum].lv[teamlv].JJCMons[1]==0 and  JJCteam[teamNum].lv[teamlv].JJCMons[2]== 0   then
			SetCurMap("starena"..teamNum..teamlv)
			local x = 0
			local y = 0
			x = math.random(5700,6500)
			y = math.random(3600,5000)
			local new = CreateCha( 1176 , x , y , 145 , Refresh )
			SetChaLifeTime( new, life )
			JJCteam[teamNum].lv[teamlv].JJCMonsCha[1] = new
			JJCteam[teamNum].lv[teamlv].JJCMons[1] = 3
			x = math.random(6200,7000)
			y = math.random(3600,5000)
			new =  CreateCha( 1176 , x , y , 145 , Refresh )
			SetChaLifeTime( new, life )
			JJCteam[teamNum].lv[teamlv].JJCMonsCha[2] = new
			JJCteam[teamNum].lv[teamlv].JJCMons[2] = 3
		end
		if ValidCha(JJCteam[teamNum].lv[teamlv].JJCMons[3])==0 and  ValidCha(JJCteam[teamNum].lv[teamlv].JJCMons[4])== 0   then
			SetCurMap("starena"..teamNum..teamlv)
			local x = 0
			local y = 0
			x = math.random(5700,6500)
			y = math.random(6800,8100)
			local new = CreateCha( 1177 , x , y , 145 , Refresh )
			SetChaLifeTime( new, life )
			JJCteam[teamNum].lv[teamlv].JJCMonsCha[3] = new
			JJCteam[teamNum].lv[teamlv].JJCMons[3] = 3
			x = math.random(6200,7000)
			y = math.random(6800,8100)
			new =  CreateCha( 1177 , x , y , 145 , Refresh )
			SetChaLifeTime( new, life )
			JJCteam[teamNum].lv[teamlv].JJCMonsCha[4] = new
			JJCteam[teamNum].lv[teamlv].JJCMons[4] = 3
		end
		local Notice={}
		CALCULATE_FUNCTIONS_LUA_000566 = GetResString("CALCULATE_FUNCTIONS_LUA_000566")
		Notice[1]= CALCULATE_FUNCTIONS_LUA_000566
		CALCULATE_FUNCTIONS_LUA_000567 = GetResString("CALCULATE_FUNCTIONS_LUA_000567")
		Notice[2]= CALCULATE_FUNCTIONS_LUA_000567
		local isIn= {}
		isIn[1] ,isIn[2] = CheckPlayerIsIn(teamNum,teamlv)
		local i = 0 
		for i = 1, 2, 1 do 
			if isIn[i] == 0 and isIn[3-i] ~= 0   then
				CALCULATE_FUNCTIONS_LUA_000568 = GetResString("CALCULATE_FUNCTIONS_LUA_000568")
				SystemNoticeAll(Notice[i]..CALCULATE_FUNCTIONS_LUA_000568,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
				SystemNoticeAll(Notice[3-i]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
				JJCteam[teamNum].lv[teamlv].InTeam[i].win = 0 
				JJCteam[teamNum].lv[teamlv].InTeam[3-i].win = 1
				JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
			elseif  isIn[i] == 0 and isIn[3-i] == 0   then
				JJCteam[teamNum].lv[teamlv].InTeam[i].win = 0 
				JJCteam[teamNum].lv[teamlv].InTeam[3-i].win = 0
				JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
			end
		end	
		if JJCPendTime (JJCteam[teamNum].lv[teamlv].starttime,JJCChangeTimeToNumber())== JJCarg[1].MaxTime		  then
			JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()  
			if  JJCteam[teamNum].lv[teamlv].InTeam[1].num > JJCteam[teamNum].lv[teamlv].InTeam[2].num   then
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 1
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
				SystemNoticeAll(Notice[1]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
			elseif JJCteam[teamNum].lv[teamlv].InTeam[1].num <  JJCteam[teamNum].lv[teamlv].InTeam[2].num   then
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 1
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
				SystemNoticeAll(Notice[2]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
			else 
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000571 = GetResString("CALCULATE_FUNCTIONS_LUA_000571")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000571,teamNum,teamlv)
			end
		end
		if JJCteam[teamNum].lv[teamlv].endtime ~= 0   then
			if JJCteam[teamNum].lv[teamlv].endnotice == 0   then 
				SystemNoticeEnd(teamNum,teamlv)
			else 
				JJCteam[teamNum].lv[teamlv].endnotice = 0 
				local c = 0 
				local d = 0 
				for c = 1 , 2 , 1 do
					local point = GivePoint(teamNum,teamlv,c) + 300
					for d = 1 , JJCteam[teamNum].players , 1 do 
						local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
						if ValidCha(role) == 0   then
							if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
								JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
							end
						else
							local zhzz = GetChaItem2 (role,2,6066)
							if ValidCha(zhzz) == nil   then
							else 	
								CALCULATE_FUNCTIONS_LUA_000572 = GetResString("CALCULATE_FUNCTIONS_LUA_000572")
								SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000572..point)
								AddPoint(role,point)
								Addwin(role , JJCteam[teamNum].lv[teamlv].InTeam[c].win)
								AddADiaoXian(role, -1)
								GoTo(role , 80, 47 ,JJCteam[teamNum].lv[teamlv].InTeam[c].map )
								GoTo(role , 80, 47 ,JJCteam[teamNum].lv[teamlv].InTeam[c].map )
								JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0
							end
						end
					end	
				end	
				DelJJCDate(teamNum,teamlv)
				local i = 0
				for i = 1 , 4, 1 do 
				local mons= JJCteam[teamNum].lv[teamlv].JJCMonsCha[i]
					if JJCteam[teamNum].lv[teamlv].JJCMons[i]~=0   then
						KillCha(mons)
					end
				JJCteam[teamNum].lv[teamlv].JJCMons[i]= 0 
				end
				JJCReady(teamNum,teamlv)
			end
		end
	end
end
function DelJJCDate(teamNum,teamlv)
	JJCteam[teamNum].lv[teamlv].InTeam[1].num = 0
	JJCteam[teamNum].lv[teamlv].InTeam[1].win= 0
	JJCteam[teamNum].lv[teamlv].InTeam[2].num = 0
	JJCteam[teamNum].lv[teamlv].InTeam[2].win= 0
	JJCteam[teamNum].lv[teamlv].state = 0
	JJCteam[teamNum].lv[teamlv].starttime = 0 
	JJCteam[teamNum].lv[teamlv].endtime = 0
end
function JJC2(map_copy,teamNum,teamlv)
	JJCteam[teamNum].lv[teamlv].open = 1
	if JJCteam[teamNum].lv[teamlv].state == 0 and JJCteam[teamNum].lv[teamlv].notice ~= 0   then
		NoticePlayer(teamNum,teamlv,map_copy)
	elseif JJCteam[teamNum].lv[teamlv].state == 1   then
		ReliveInJJC(teamNum,teamlv)
		local Notice={}
		CALCULATE_FUNCTIONS_LUA_000573 = GetResString("CALCULATE_FUNCTIONS_LUA_000573")
		Notice[1]= CALCULATE_FUNCTIONS_LUA_000573
		CALCULATE_FUNCTIONS_LUA_000574 = GetResString("CALCULATE_FUNCTIONS_LUA_000574")
		Notice[2]= CALCULATE_FUNCTIONS_LUA_000574
		local isIn= {}
		isIn[1] ,isIn[2] = CheckPlayerIsIn(teamNum,teamlv)
		local i = 0 
		for i = 1, 2, 1 do 
			if isIn[i] == 0 and isIn[3-i] ~= 0   then
				CALCULATE_FUNCTIONS_LUA_000568 = GetResString("CALCULATE_FUNCTIONS_LUA_000568")
				SystemNoticeAll(Notice[i]..CALCULATE_FUNCTIONS_LUA_000568,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
				SystemNoticeAll(Notice[3-i]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
				JJCteam[teamNum].lv[teamlv].InTeam[i].win = 0 
				JJCteam[teamNum].lv[teamlv].InTeam[3-i].win = 1
				JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
			elseif  isIn[i] == 0 and isIn[3-i] == 0   then
				JJCteam[teamNum].lv[teamlv].InTeam[i].win = 0 
				JJCteam[teamNum].lv[teamlv].InTeam[3-i].win = 0
				JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
			end
		end	
		local pos = {}
		pos[1],pos[2] = CheckPlayerPos(teamNum,teamlv)
		if  beginstateJJC2[teamlv] == 0   then 
			if pos[1]== 0 and pos[2] == 0   then 
				if needTime[1][teamlv]> 9 and math.fmod(needTime[1][teamlv],5)== 0   then 
					CALCULATE_FUNCTIONS_LUA_000575 = GetResString("CALCULATE_FUNCTIONS_LUA_000575")
					CALCULATE_FUNCTIONS_LUA_000576 = GetResString("CALCULATE_FUNCTIONS_LUA_000576")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000576..needTime[1][teamlv]..CALCULATE_FUNCTIONS_LUA_000575,teamNum,teamlv)
				elseif needTime[1][teamlv]< 10 and needTime[1][teamlv]> 0   then 
					CALCULATE_FUNCTIONS_LUA_000575 = GetResString("CALCULATE_FUNCTIONS_LUA_000575")
					CALCULATE_FUNCTIONS_LUA_000576 = GetResString("CALCULATE_FUNCTIONS_LUA_000576")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000576..needTime[1][teamlv]..CALCULATE_FUNCTIONS_LUA_000575,teamNum,teamlv)
				end	
				needTime[1][teamlv] =  needTime[1][teamlv]-1
				needTime[2][teamlv] =  needTime[2][teamlv]-1
				if needTime[2][teamlv]<0   then 
					needTime[2][teamlv] = 0 
				end
				if needTime[1][teamlv]<0   then 
					needTime[1][teamlv] = 0 
				end
				if needTime[1][teamlv] == 0   then
					JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0 
					JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
					JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
					CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
					CALCULATE_FUNCTIONS_LUA_000577 = GetResString("CALCULATE_FUNCTIONS_LUA_000577")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000577,teamNum,teamlv)
				end
			elseif pos[1]== 1 or pos[2] == 1   then
				needTime[1][teamlv] = 9
				needTime[2][teamlv] = 9
				CALCULATE_FUNCTIONS_LUA_000578 = GetResString("CALCULATE_FUNCTIONS_LUA_000578")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000578,teamNum,teamlv)
				beginstateJJC2[teamlv] = 1
			end
		elseif beginstateJJC2[teamlv] == 1   then
			local a = 0 
			local InJJC2={}
			for a = 1 ,2 ,1 do 
				if pos[a]== 1  and needTime[a][teamlv]< 9    then 
					local p =GetPosPlayerNum(teamNum,teamlv,a)
					if JJC2stay[a] < 2*JJCteam[teamNum].players   then 
						JJC2stay[a] = JJC2stay[a]+p
					elseif JJC2stay[a] >= 2*JJCteam[teamNum].players   then 
						needTime[a][teamlv]=needTime[a][teamlv]+1
						GUILDWAR2_CTRL_LUA_000001 = GetResString("GUILDWAR2_CTRL_LUA_000001")
						CALCULATE_FUNCTIONS_LUA_000579 = GetResString("CALCULATE_FUNCTIONS_LUA_000579")
						SystemNoticeAll(Notice[a]..CALCULATE_FUNCTIONS_LUA_000579..needTime[a][teamlv]..GUILDWAR2_CTRL_LUA_000001,teamNum,teamlv)
					end
				elseif pos[a] == 0  or JJC2stay[a] < 2*JJCteam[teamNum].players   then
					if pos[a] == 0 and JJC2stay[a]~= 0   then 
						JJC2stay[a] = 0
					end
					needTime[a][teamlv]=needTime[a][teamlv]-1
					if needTime[a][teamlv]>0   then 
						GUILDWAR2_CTRL_LUA_000001 = GetResString("GUILDWAR2_CTRL_LUA_000001")
						CALCULATE_FUNCTIONS_LUA_000579 = GetResString("CALCULATE_FUNCTIONS_LUA_000579")
						SystemNoticeAll(Notice[a]..CALCULATE_FUNCTIONS_LUA_000579..needTime[a][teamlv]..GUILDWAR2_CTRL_LUA_000001,teamNum,teamlv)
					else
						needTime[a][teamlv]= 0 
					end
					if needTime[a][teamlv]== 0 and needTime[3-a]~= 0   then
						CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
						SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
						CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
						SystemNoticeAll(Notice[3-a]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
						JJCteam[teamNum].lv[teamlv].InTeam[a].win = 0 
						JJCteam[teamNum].lv[teamlv].InTeam[3-a].win = 1
						JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
					elseif needTime[a][teamlv]== 0 and needTime[3-a]== 0   then 
						JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0 
						JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
						JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
						CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
						SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
						CALCULATE_FUNCTIONS_LUA_000580 = GetResString("CALCULATE_FUNCTIONS_LUA_000580")
						SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000580,teamNum,teamlv)
					end
				end
			end
		end
		if JJCPendTime (JJCteam[teamNum].lv[teamlv].starttime,JJCChangeTimeToNumber())== JJCarg[2].MaxTime		  then
			JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
			local p1=GetPosPlayerNum(teamNum,teamlv,1)
			local p2=GetPosPlayerNum(teamNum,teamlv,2)
			if  p1 > p2   then
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 1
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
				SystemNoticeAll(Notice[1]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
			elseif p1 < p2   then
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 1
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
				SystemNoticeAll(Notice[2]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
			else 
				if needTime[1][teamlv]> needTime[2][teamlv]   then 
					JJCteam[teamNum].lv[teamlv].InTeam[1].win = 1
					JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
					CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
					CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
					SystemNoticeAll(Notice[1]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
				elseif needTime[1][teamlv]< needTime[2][teamlv]   then 
					JJCteam[teamNum].lv[teamlv].InTeam[2].win = 1
					JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0
					CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
					CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
					SystemNoticeAll(Notice[2]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
				else
					JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
					JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0
					CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
					CALCULATE_FUNCTIONS_LUA_000581 = GetResString("CALCULATE_FUNCTIONS_LUA_000581")
					SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000581,teamNum,teamlv)
				end
			end
		end
		if JJCteam[teamNum].lv[teamlv].endtime ~= 0   then
			if JJCteam[teamNum].lv[teamlv].endnotice == 0   then 
				SystemNoticeEnd(teamNum,teamlv)
			else 
				JJCteam[teamNum].lv[teamlv].endnotice = 0 
				local c = 0 
				local d = 0 
				for c = 1 , 2 , 1 do
					local point = GivePoint(teamNum,teamlv,c) + 300
					for d = 1 , JJCteam[teamNum].players , 1 do 
						local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
						if ValidCha(role) == 0   then
							if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
								JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
							end
						else
							local zhzz = GetChaItem2 (role,2,6066)
							if ValidCha(zhzz) == nil   then
								CALCULATE_FUNCTIONS_LUA_000582 = GetResString("CALCULATE_FUNCTIONS_LUA_000582")
								SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000582)
							else 
								local point = GivePoint(teamNum,teamlv,c) + 300
								CALCULATE_FUNCTIONS_LUA_000572 = GetResString("CALCULATE_FUNCTIONS_LUA_000572")
								SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000572..point)
								AddPoint(role,point)
								Addwin(role , JJCteam[teamNum].lv[teamlv].InTeam[c].win)
								AddADiaoXian(role, -1)
								GoTo(role , 80, 47 ,JJCteam[teamNum].lv[teamlv].InTeam[c].map )
								GoTo(role , 80, 47 ,JJCteam[teamNum].lv[teamlv].InTeam[c].map )
								JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0
							end
						end
					end	
				end	
				DelJJCDate(teamNum,teamlv)
				needTime[1][teamlv] = 30
				needTime[2][teamlv] = 30
				JJCReady(teamNum,teamlv)
				beginstateJJC2[teamlv] = 0
			end
		end
	end
	
end
function JJC23(map_copy)
	local teamNum = 2 
	local teamlv = 3 
	JJC2(map_copy,teamNum,teamlv)
end
function JJC24(map_copy)
	local teamNum = 2 
	local teamlv = 4 
	JJC2(map_copy,teamNum,teamlv)
end
function JJC25(map_copy)
	local teamNum = 2 
	local teamlv = 5 
	JJC2(map_copy,teamNum,teamlv)
end
function JJC33(map_copy)
	local teamNum = 3 
	local teamlv = 3 
	JJC3(map_copy,teamNum,teamlv)
end
function JJC34(map_copy)
	local teamNum = 3 
	local teamlv = 4 
	JJC3(map_copy,teamNum,teamlv)
end
function JJC35(map_copy)
	local teamNum = 3 
	local teamlv = 5 
	JJC3(map_copy,teamNum,teamlv)
end
function JJC3(map_copy,teamNum,teamlv)
	JJCteam[teamNum].lv[teamlv].open = 1
	if JJCteam[teamNum].lv[teamlv].state == 0 and JJCteam[teamNum].lv[teamlv].notice ~= 0   then
		NoticePlayer(teamNum,teamlv,map_copy)
	elseif JJCteam[teamNum].lv[teamlv].state == 1   then
		ReliveInJJC(teamNum,teamlv)
		local monslife = 0
		if ValidCha(JJCteam[teamNum].lv[teamlv].JJCMonsCha[1])~=0   then
			monslife = GetChaAttr(JJCteam[teamNum].lv[teamlv].JJCMonsCha[1],ATTR_HP)
			if monslife <= 0   then
				KillCha(JJCteam[teamNum].lv[teamlv].JJCMonsCha[1])
				JJCteam[teamNum].lv[teamlv].JJCMonsCha[1] = nil
			end
		elseif JJCteam[teamNum].lv[teamlv].JJCMons[1]>0   then
			JJCteam[teamNum].lv[teamlv].JJCMons[1] = JJCteam[teamNum].lv[teamlv].JJCMons[1] -1
		end
		if ValidCha(JJCteam[teamNum].lv[teamlv].JJCMons[1])==0 and  CheckJJC3Item(teamlv)== 0   then
			SetCurMap("starena"..teamNum..teamlv)
			local new = CreateCha( 1178 , 8500 , 6300 , 145 , 1800 )
			SetChaLifeTime( new, 1800000 )
			JJCteam[teamNum].lv[teamlv].JJCMonsCha[1] = new
			JJCteam[teamNum].lv[teamlv].JJCMons[1]= 3
		end
		local Notice={}
		CALCULATE_FUNCTIONS_LUA_000566 = GetResString("CALCULATE_FUNCTIONS_LUA_000566")
		Notice[1]= CALCULATE_FUNCTIONS_LUA_000566
		CALCULATE_FUNCTIONS_LUA_000567 = GetResString("CALCULATE_FUNCTIONS_LUA_000567")
		Notice[2]= CALCULATE_FUNCTIONS_LUA_000567
		local isIn= {}
		isIn[1] ,isIn[2] = CheckPlayerIsIn(teamNum,teamlv)
		local i = 0 
		for i = 1, 2, 1 do 
			if isIn[i] == 0 and isIn[3-i] ~= 0   then
				CALCULATE_FUNCTIONS_LUA_000568 = GetResString("CALCULATE_FUNCTIONS_LUA_000568")
				SystemNoticeAll(Notice[i]..CALCULATE_FUNCTIONS_LUA_000568,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000569 = GetResString("CALCULATE_FUNCTIONS_LUA_000569")
				SystemNoticeAll(CALCULATE_FUNCTIONS_LUA_000569,teamNum,teamlv)
				CALCULATE_FUNCTIONS_LUA_000570 = GetResString("CALCULATE_FUNCTIONS_LUA_000570")
				SystemNoticeAll(Notice[3-i]..CALCULATE_FUNCTIONS_LUA_000570,teamNum,teamlv)
				JJCteam[teamNum].lv[teamlv].InTeam[i].win = 0 
				JJCteam[teamNum].lv[teamlv].InTeam[3-i].win = 1
				JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
			elseif  isIn[i] == 0 and isIn[3-i] == 0   then
				JJCteam[teamNum].lv[teamlv].InTeam[i].win = 0 
				JJCteam[teamNum].lv[teamlv].InTeam[3-i].win = 0
				JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()
			end
		end	
		local a = 0 
		for a = 1 ,2,1 do 
			if JJCteam[teamNum].lv[teamlv].InTeam[a].num== 5   then 
				JJCteam[teamNum].lv[teamlv].InTeam[a].win = 1
				JJCteam[teamNum].lv[teamlv].InTeam[3-a].win = 0
				JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber() 
			end
		end
		if JJCPendTime (JJCteam[teamNum].lv[teamlv].starttime,JJCChangeTimeToNumber())== JJCarg[3].MaxTime   then
			JJCteam[teamNum].lv[teamlv].endtime = JJCChangeTimeToNumber()  
			if  JJCteam[teamNum].lv[teamlv].InTeam[1].num > JJCteam[teamNum].lv[teamlv].InTeam[2].num   then
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 1
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
			elseif JJCteam[teamNum].lv[teamlv].InTeam[1].num <  JJCteam[teamNum].lv[teamlv].InTeam[2].num   then
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 1
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0
			else 
				JJCteam[teamNum].lv[teamlv].InTeam[2].win = 0
				JJCteam[teamNum].lv[teamlv].InTeam[1].win = 0
			end
		end
		if JJCteam[teamNum].lv[teamlv].endtime ~= 0   then
			if JJCteam[teamNum].lv[teamlv].endnotice == 0   then 
				SystemNoticeEnd(teamNum,teamlv)
			else 
				JJCteam[teamNum].lv[teamlv].endnotice = 0 
				local c = 0 
				local d = 0 
				for c = 1 , 2 , 1 do
					for d = 1 , JJCteam[teamNum].players , 1 do 
						local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
						if ValidCha(role) == 0   then
							if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
								JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
							end
						else
							local zhzz = GetChaItem2 (role,2,6066)
							if ValidCha(zhzz) == nil   then
								CALCULATE_FUNCTIONS_LUA_000582 = GetResString("CALCULATE_FUNCTIONS_LUA_000582")
								SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000582,teamNum,teamlv)
							else 
								local point = GivePoint(teamNum,teamlv,c) + 300
								CALCULATE_FUNCTIONS_LUA_000572 = GetResString("CALCULATE_FUNCTIONS_LUA_000572")
								SystemNotice(role , CALCULATE_FUNCTIONS_LUA_000572..point)
								AddPoint(role,point)
								Addwin(role , JJCteam[teamNum].lv[teamlv].InTeam[c].win)
								AddADiaoXian(role, -1)
								GoTo(role , 80, 47 ,JJCteam[teamNum].lv[teamlv].InTeam[c].map )
								GoTo(role , 80, 47 ,JJCteam[teamNum].lv[teamlv].InTeam[c].map )
								JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0
							end
						end
					end	
				end	
				DelJJCDate(teamNum,teamlv)
				KillCha(JJCteam[teamNum].lv[teamlv].JJCMonsCha[1])
				JJCteam[teamNum].lv[teamlv].JJCMonsCha[1] = nil
				JJCReady(teamNum,teamlv)
			end
		end
	end
	
end
function CheckJJC3Item(teamlv)
	local num = 0
	local c = 0 
	local d = 0 
	local teamNum =  3
	for c = 1 , 2 , 1 do
		for d = 1 , JJCteam[teamNum].players , 1 do 
			local role= GetRolebyIDX(JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1])
			if ValidCha(role) == 0   then
				if JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1]~= 0   then
					JJCteam[teamNum].lv[teamlv].InTeam[c].InTeamment[d-1] = 0 
				end
			else
				local itemNum = CheckBagItem (role ,5963 )
				if itemNum == 1   then 
					num = 1 
				end
			end
		end	
	end	
	return num
end
-- 5961	��Ҷ
-- 5962	��Ҷ
-- 5963	�������ص�β��


-- 1176	�������黨
-- 1177	���������
-- 1178	��������
-- ���˾�����   57,34    70,52  
             -- 62,53    65,65
             -- 70,66    57,83
-- 5�˾�����
-- 57,46    69,49
-- 62,50    64,56
-- 56,56    70,70
-- 56,62    46,65
-- 42,56    45,69
-- 61,70    63,77
-- 56,78    68,83
-- 70,61    78,65
-- 79,57    83,69

function RemoveJJCItem(role)
	local JJCItem={}
	JJCItem[1]= 5961
	JJCItem[2]= 5962
	JJCItem[3]= 5963
	local itemNum={}
	local i = 0 
	for i = 1 ,3 ,1 do
		itemNum[i] = CheckBagItem(role,JJCItem[i])
		if itemNum[i] ~= 0   then 
			DelBagItem(role, JJCItem[i], itemNum[i])
		end
	end
end
	
function JJCstart(teamNum,teamlv)

	CALCULATE_FUNCTIONS_LUA_000583 = GetResString("CALCULATE_FUNCTIONS_LUA_000583")
	CALCULATE_FUNCTIONS_LUA_000584 = GetResString("CALCULATE_FUNCTIONS_LUA_000584")
	CALCULATE_FUNCTIONS_LUA_000585 = GetResString("CALCULATE_FUNCTIONS_LUA_000585")
	LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000585,teamNum,CALCULATE_FUNCTIONS_LUA_000584,teamlv,CALCULATE_FUNCTIONS_LUA_000583)
	if teamNum == 2   then 
		return 
	end
	local Refresh = 1800					--����ʱ�䣬�뵥λ
	local life = 1800000					--����ʱ�䣬���뵥λ
	if teamNum == 1   then 
		SetCurMap("starena"..teamNum..teamlv)
		CALCULATE_FUNCTIONS_LUA_000586 = GetResString("CALCULATE_FUNCTIONS_LUA_000586")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000586)
		local x = 0
		local y = 0
		x = math.random(5700,6500)
		y = math.random(3600,5000)
		CALCULATE_FUNCTIONS_LUA_000587 = GetResString("CALCULATE_FUNCTIONS_LUA_000587")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000587,x,"y: ",y,"Refresh: ",Refresh)
		local new = CreateCha( 1176 , x , y , 145 , Refresh )
		SetChaLifeTime( new, life )
		JJCteam[teamNum].lv[teamlv].JJCMonsCha[1] = new
		CALCULATE_FUNCTIONS_LUA_000588 = GetResString("CALCULATE_FUNCTIONS_LUA_000588")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000588)
		JJCteam[teamNum].lv[teamlv].JJCMons[1] = 3
		CALCULATE_FUNCTIONS_LUA_000589 = GetResString("CALCULATE_FUNCTIONS_LUA_000589")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000589,JJCteam[teamNum].lv[teamlv].JJCMons[1])
		x = math.random(6200,7000)
		y = math.random(3600,5000)
		CALCULATE_FUNCTIONS_LUA_000590 = GetResString("CALCULATE_FUNCTIONS_LUA_000590")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000590,x,"y: ",y,"Refresh: ",Refresh)
		new =  CreateCha( 1176 , x , y , 145 , Refresh )
		SetChaLifeTime( new, life )
		JJCteam[teamNum].lv[teamlv].JJCMonsCha[2] = new
		CALCULATE_FUNCTIONS_LUA_000591 = GetResString("CALCULATE_FUNCTIONS_LUA_000591")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000591)
		JJCteam[teamNum].lv[teamlv].JJCMons[2] = 3
		CALCULATE_FUNCTIONS_LUA_000592 = GetResString("CALCULATE_FUNCTIONS_LUA_000592")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000592,JJCteam[teamNum].lv[teamlv].JJCMons[2])		
		x = math.random(5700,6500)
		y = math.random(6800,8100)
		CALCULATE_FUNCTIONS_LUA_000593 = GetResString("CALCULATE_FUNCTIONS_LUA_000593")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000593,x,"y: ",y,"Refresh: ",Refresh)
		new = CreateCha( 1177 , x , y , 145 , Refresh )
		SetChaLifeTime( new, life )
		JJCteam[teamNum].lv[teamlv].JJCMonsCha[3] = new
		CALCULATE_FUNCTIONS_LUA_000594 = GetResString("CALCULATE_FUNCTIONS_LUA_000594")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000594)
		JJCteam[teamNum].lv[teamlv].JJCMons[3] = 3
		CALCULATE_FUNCTIONS_LUA_000595 = GetResString("CALCULATE_FUNCTIONS_LUA_000595")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000595,JJCteam[teamNum].lv[teamlv].JJCMons[3])			
		x = math.random(6200,7000)
		y = math.random(6800,8100)
		CALCULATE_FUNCTIONS_LUA_000596 = GetResString("CALCULATE_FUNCTIONS_LUA_000596")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000596,x,"y: ",y,"Refresh: ",Refresh)
		new =  CreateCha( 1177 , x , y , 145 , Refresh )
		SetChaLifeTime( new, life )
		JJCteam[teamNum].lv[teamlv].JJCMonsCha[4] = new	
		CALCULATE_FUNCTIONS_LUA_000597 = GetResString("CALCULATE_FUNCTIONS_LUA_000597")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000597)
		JJCteam[teamNum].lv[teamlv].JJCMons[4] = 3
		CALCULATE_FUNCTIONS_LUA_000598 = GetResString("CALCULATE_FUNCTIONS_LUA_000598")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000598,JJCteam[teamNum].lv[teamlv].JJCMons[4])			
	end
	if teamNum == 3   then
		SetCurMap("starena"..teamNum..teamlv)
		CALCULATE_FUNCTIONS_LUA_000599 = GetResString("CALCULATE_FUNCTIONS_LUA_000599")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000599)
		local new = CreateCha( 1178 , 8500 , 6300 , 145 , Refresh )
		CALCULATE_FUNCTIONS_LUA_000587 = GetResString("CALCULATE_FUNCTIONS_LUA_000587")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000587,x,"y: ",y,"Refresh: ",Refresh)
		SetChaLifeTime( new, life )
		JJCteam[teamNum].lv[teamlv].JJCMonsCha[1] = new
		CALCULATE_FUNCTIONS_LUA_000588 = GetResString("CALCULATE_FUNCTIONS_LUA_000588")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000588)
		JJCteam[teamNum].lv[teamlv].JJCMons[1] = 3	
		CALCULATE_FUNCTIONS_LUA_000589 = GetResString("CALCULATE_FUNCTIONS_LUA_000589")
		LG("JJCMON",CALCULATE_FUNCTIONS_LUA_000589,JJCteam[teamNum].lv[teamlv].JJCMons[1])
	end
end
function JJC1TakeItem(role)
	local Notice={}
	CALCULATE_FUNCTIONS_LUA_000566 = GetResString("CALCULATE_FUNCTIONS_LUA_000566")
	Notice[1]= CALCULATE_FUNCTIONS_LUA_000566
	CALCULATE_FUNCTIONS_LUA_000567 = GetResString("CALCULATE_FUNCTIONS_LUA_000567")
	Notice[2]= CALCULATE_FUNCTIONS_LUA_000567
	local teamNum = 1
	local teamlv = GetTeamLV(role)
	local JJCItem={}
	JJCItem[1]= 5961
	JJCItem[2]= 5962
	local itemNum={}
	local i = 0 
	for i = 1 ,2 ,1 do
		itemNum[i] = CheckBagItem(role,JJCItem[i])
	end
	if  CheckPlayerTeam(role,teamNum,teamlv)~= 0   then
		local team ,teamment = CheckPlayerTeam(role,teamNum,teamlv)
		if itemNum[1] == 0 and itemNum[2] == 0   then 
			CALCULATE_FUNCTIONS_LUA_000540 = GetResString("CALCULATE_FUNCTIONS_LUA_000540")
			SystemNoticeAll(Notice[1]..CALCULATE_FUNCTIONS_LUA_000540..JJCteam[teamNum].lv[teamlv].InTeam[1].num,teamNum,teamlv)				
			CALCULATE_FUNCTIONS_LUA_000540 = GetResString("CALCULATE_FUNCTIONS_LUA_000540")
			SystemNoticeAll(Notice[2]..CALCULATE_FUNCTIONS_LUA_000540..JJCteam[teamNum].lv[teamlv].InTeam[2].num,teamNum,teamlv)					
		end			
		for i =  1 ,2 ,1 do 
			if itemNum[i]~= 0   then
				if i+ team == 3   then 
					JJCteam[teamNum].lv[teamlv].InTeam[team].num = JJCteam[teamNum].lv[teamlv].InTeam[team].num+3
					CALCULATE_FUNCTIONS_LUA_000600 = GetResString("CALCULATE_FUNCTIONS_LUA_000600")
					SystemNoticeAll(Notice[3-i]..CALCULATE_FUNCTIONS_LUA_000600..JJCteam[teamNum].lv[teamlv].InTeam[team].num,teamNum,teamlv)				
				else 
					JJCteam[teamNum].lv[teamlv].InTeam[team].num = JJCteam[teamNum].lv[teamlv].InTeam[team].num+1
					CALCULATE_FUNCTIONS_LUA_000601 = GetResString("CALCULATE_FUNCTIONS_LUA_000601")
					SystemNoticeAll(Notice[i]..CALCULATE_FUNCTIONS_LUA_000601..JJCteam[teamNum].lv[teamlv].InTeam[team].num,teamNum,teamlv)				
				end
				DelBagItem(role, JJCItem[i], 1)
			end
		end
	end				
end
function JJC3TakeItem(role)
	local Notice={}
	CALCULATE_FUNCTIONS_LUA_000566 = GetResString("CALCULATE_FUNCTIONS_LUA_000566")
	Notice[1]= CALCULATE_FUNCTIONS_LUA_000566
	CALCULATE_FUNCTIONS_LUA_000567 = GetResString("CALCULATE_FUNCTIONS_LUA_000567")
	Notice[2]= CALCULATE_FUNCTIONS_LUA_000567
	local teamNum = 3
	local teamlv = GetTeamLV(role)
	local JJCItem= 5963
	local itemName = GetItemName(JJCItem)
	local itemNum=0
		itemNum = CheckBagItem(role,JJCItem)
	if  CheckPlayerTeam(role,teamNum,teamlv)~= 0   then
		local team ,teamment = CheckPlayerTeam(role,teamNum,teamlv)
		if itemNum == 0   then
			CALCULATE_FUNCTIONS_LUA_000540 = GetResString("CALCULATE_FUNCTIONS_LUA_000540")
			SystemNoticeAll(Notice[1]..CALCULATE_FUNCTIONS_LUA_000540..JJCteam[teamNum].lv[teamlv].InTeam[1].num,teamNum,teamlv)				
			CALCULATE_FUNCTIONS_LUA_000540 = GetResString("CALCULATE_FUNCTIONS_LUA_000540")
			SystemNoticeAll(Notice[2]..CALCULATE_FUNCTIONS_LUA_000540..JJCteam[teamNum].lv[teamlv].InTeam[2].num,teamNum,teamlv)					
		end			
		if itemNum~= 0   then
			JJCteam[teamNum].lv[teamlv].InTeam[team].num = JJCteam[teamNum].lv[teamlv].InTeam[team].num+1
			CALCULATE_FUNCTIONS_LUA_000602 = GetResString("CALCULATE_FUNCTIONS_LUA_000602")
			CALCULATE_FUNCTIONS_LUA_000603 = GetResString("CALCULATE_FUNCTIONS_LUA_000603")
			SystemNoticeAll(Notice[team]..CALCULATE_FUNCTIONS_LUA_000603..itemName..CALCULATE_FUNCTIONS_LUA_000602..JJCteam[teamNum].lv[teamlv].InTeam[team].num,teamNum,teamlv)				
			DelBagItem(role,JJCItem, 1)
		end
	end				
end


function CheckJJCXiangLian(item)
	if ValidCha (item) == 0   then 
		return 0
	end
	local itemID = GetItemID(item)
	if itemID == 5870   then
		return itemID
	end
	if itemID>=3936 and itemID<=3942   then 
		return itemID
	end
	local i = 0
	for i =1 , 19 , 1 do 
		if itemID >=6480 and  itemID <=6498   then
			return 1
		end
	end
	local itemtype = GetItemType(item)
	if itemtype~= 25   then 
		return 1 
	end
	return 0 
end	

function GetJJCXLNeedPoint (role)
	local jjcItem = GetChaItem(role ,2, 2)
	if ValidCha(jjcItem) == 0 or CheckJJCXiangLian(jjcItem) == 0   then 
		CALCULATE_FUNCTIONS_LUA_000604 = GetResString("CALCULATE_FUNCTIONS_LUA_000604")
		return CALCULATE_FUNCTIONS_LUA_000604
	end
	local JJCItemID = GetItemID(jjcItem) 
	local needPoint =math.floor( math.pow((math.floor((JJCItemID- 6480 )/4)+1),3.5)*1000)
	CALCULATE_FUNCTIONS_LUA_000605 = GetResString("CALCULATE_FUNCTIONS_LUA_000605")
	CALCULATE_FUNCTIONS_LUA_000606 = GetResString("CALCULATE_FUNCTIONS_LUA_000606")
	return CALCULATE_FUNCTIONS_LUA_000606..needPoint..CALCULATE_FUNCTIONS_LUA_000605
end
	
function CanChargeJJCXianglian(role)
	local jjcItem = GetChaItem(role ,2, 2)
	local jieZhi = GetChaItem(role , 2, 3)
	local jhzz = GetChaItem2(role , 2, 6066)
	if ValidCha(jieZhi)== 0 or CheckJJCXiangLian(jieZhi) == 1   then
		CALCULATE_FUNCTIONS_LUA_000607 = GetResString("CALCULATE_FUNCTIONS_LUA_000607")
		return CALCULATE_FUNCTIONS_LUA_000607
	end
	if ValidCha(jieZhi)== 0 or CheckJJCXiangLian(jieZhi) > 1   then
		local name = GetItemName(CheckJJCXiangLian(jieZhi))
		CALCULATE_FUNCTIONS_LUA_000608 = GetResString("CALCULATE_FUNCTIONS_LUA_000608")
		return  name..CALCULATE_FUNCTIONS_LUA_000608
	end
	if ValidCha(jjcItem) == 0 or CheckJJCXiangLian(jjcItem) == 0   then 
		CALCULATE_FUNCTIONS_LUA_000604 = GetResString("CALCULATE_FUNCTIONS_LUA_000604")
		return CALCULATE_FUNCTIONS_LUA_000604
	end
	if ValidCha(jhzz) == 0   then 
		CALCULATE_FUNCTIONS_LUA_000609 = GetResString("CALCULATE_FUNCTIONS_LUA_000609")
		return CALCULATE_FUNCTIONS_LUA_000609
	end
	local JJCJiFen = GetJJCItemPoint(role)
	local JJCItemID = GetItemID(jjcItem) 
	local needPoint =math.floor( math.pow((math.floor((JJCItemID- 6480 )/4)+1),3.5)*1000)
	if JJCJiFen < needPoint   then 
		CALCULATE_FUNCTIONS_LUA_000610 = GetResString("CALCULATE_FUNCTIONS_LUA_000610")
		CALCULATE_FUNCTIONS_LUA_000611 = GetResString("CALCULATE_FUNCTIONS_LUA_000611")
		return CALCULATE_FUNCTIONS_LUA_000611..needPoint..CALCULATE_FUNCTIONS_LUA_000610
	end
	return LUA_TRUE	
end
function ChargeJJCXianglian(role)
	local jjcItem = GetChaItem(role ,2, 2)
	local jieZhi = GetChaItem(role , 2, 3)
	local jhzz = GetChaItem2(role , 2, 6066)
	local JJCJiFen = GetJJCItemPoint(role)
	local jiezhiAttr = 0 
	jiezhiAttr = GetItemAttr (jieZhi ,ITEMATTR_VAL_MXHP )
	SetItemAttr(jjcItem,ITEMATTR_VAL_MXHP,jiezhiAttr)
	jiezhiAttr = GetItemAttr (jieZhi ,ITEMATTR_VAL_MXSP )
	SetItemAttr(jjcItem,ITEMATTR_VAL_MXSP,jiezhiAttr)
	jiezhiAttr = GetItemAttr (jieZhi ,ITEMATTR_VAL_HREC )
	SetItemAttr(jjcItem,ITEMATTR_VAL_HREC,jiezhiAttr)
	jiezhiAttr = GetItemAttr (jieZhi ,ITEMATTR_VAL_SREC )
	SetItemAttr(jjcItem,ITEMATTR_VAL_SREC,jiezhiAttr)
	jiezhiAttr = GetItemAttr (jieZhi ,ITEMATTR_VAL_PDEF )
	SetItemAttr(jjcItem,ITEMATTR_VAL_PDEF,jiezhiAttr)
	JJCJiFen = JJCJiFen -10000
	SetJJCItemPoint(role,JJCJiFen)
	local jieZhiID= GetItemID(jieZhi )
	RemoveChaItem(role , jieZhiID , 1,2,3,2,1)
	SynChaKitbag(role,13)
	return LUA_TRUE	
end
function GetJJCItemPoint(role)
	local zhzz = GetChaItem2 (role,2,6066)
	if zhzz == nil   then
		CALCULATE_FUNCTIONS_LUA_000552 = GetResString("CALCULATE_FUNCTIONS_LUA_000552")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000552)
		return 0
	end
	local point = 0
	local Sta =GetItemAttr(zhzz,ITEMATTR_VAL_STR)
	local con = GetItemAttr(zhzz,ITEMATTR_VAL_CON)
    point = Sta*32768+con
	return point
end
function  SetJJCItemPoint(role,point)
	local zhzz = GetChaItem2 (role,2,6066)
	if zhzz == nil   then
		CALCULATE_FUNCTIONS_LUA_000612 = GetResString("CALCULATE_FUNCTIONS_LUA_000612")
		SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000612)
		return
	end
	local Sta = math.floor(point/32768)
	local con = math.fmod(point,32768)
	if Sta>=32768   then
		Sta = 32768-1 
	end
	SetItemAttr(zhzz,ITEMATTR_VAL_STR, Sta)
	SetItemAttr(zhzz,ITEMATTR_VAL_CON,con)
	SynChaKitbag(role,13 )
end	
function GetItemPos(role,item)
	local bagnum = GetKbCap(role) 
	local i = 0 
	for i = 0 , bagnum-1,1 do 
		local item2 = GetChaItem(role,2,i)
		if item == item2   then 
			return i 
		end
	end 
end	
function AddPoint (role,point)
	local pointBef = GetJJCItemPoint(role)
	local pointAft =  point+ pointBef
	SetJJCItemPoint(role,pointAft)
end
function GetJJCXLReturnPoint (role)
	local jjcItem = GetChaItem(role ,2, 2)
	if ValidCha(jjcItem) == 0 or CheckJJCXiangLian(jjcItem) == 0   then 
		CALCULATE_FUNCTIONS_LUA_000604 = GetResString("CALCULATE_FUNCTIONS_LUA_000604")
		return CALCULATE_FUNCTIONS_LUA_000604
	end
	local JJCItemID = GetItemID(jjcItem) 
	local returnPoint = 0
	if math.floor((JJCItemID- 6480 )/4)+1 == 1   then
		returnPoint = 9600*0.8
	elseif math.floor((JJCItemID- 6480 )/4)+1 == 2   then
		returnPoint = 48000*0.8
	elseif math.floor((JJCItemID- 6480 )/4)+1== 3   then
		returnPoint = 100800*0.8
	elseif math.floor((JJCItemID- 6480 )/4)+1 == 4   then
		returnPoint = 504000*0.8
	elseif math.floor((JJCItemID- 6480 )/4)+1== 5 then
		returnPoint = 3504000*0.8
	end
	CALCULATE_FUNCTIONS_LUA_000605 = GetResString("CALCULATE_FUNCTIONS_LUA_000605")
	CALCULATE_FUNCTIONS_LUA_000613 = GetResString("CALCULATE_FUNCTIONS_LUA_000613")
	return CALCULATE_FUNCTIONS_LUA_000613..returnPoint..CALCULATE_FUNCTIONS_LUA_000605
end
	
function CanReturnJJCXianglian(role)
	local jjcItem = GetChaItem(role ,2, 2)
	local jhzz = GetChaItem2(role , 2, 6066)
	if ValidCha(jjcItem) == 0 or CheckJJCXiangLian(jjcItem) == 0   then 
		CALCULATE_FUNCTIONS_LUA_000604 = GetResString("CALCULATE_FUNCTIONS_LUA_000604")
		return CALCULATE_FUNCTIONS_LUA_000604
	end
	if ValidCha(jhzz) == 0   then 
		CALCULATE_FUNCTIONS_LUA_000609 = GetResString("CALCULATE_FUNCTIONS_LUA_000609")
		return CALCULATE_FUNCTIONS_LUA_000609
	end
	return LUA_TRUE	
end
function ReturnJJCXianglian(role)
	local jjcItem = GetChaItem(role ,2, 2)
	local jhzz = GetChaItem2(role , 2, 6066)
	local jjcItemID= GetItemID(jjcItem )
	local JJCJiFen = GetJJCItemPoint(role)
	local returnPoint =0
	if math.floor((jjcItemID- 6480 )/4)+1 == 1   then
		returnPoint = 9600*0.8
	elseif math.floor((jjcItemID- 6480 )/4)+1 == 2   then
		returnPoint = 48000*0.8
	elseif math.floor((jjcItemID- 6480 )/4)+1== 3   then
		returnPoint = 100800*0.8
	elseif math.floor((jjcItemID- 6480 )/4)+1 ==4   then
		returnPoint = 504000*0.8
	elseif math.floor((jjcItemID- 6480 )/4)+1== 5   then
		returnPoint = 3504000*0.8
	end
	JJCJiFen =JJCJiFen+returnPoint
	SetJJCItemPoint(role,JJCJiFen)
	RemoveChaItem(role , jjcItemID , 1,2,2,2,1)
	return LUA_TRUE	
end
function CheckPlayerIsInJJC(role,teamNum,teamlv )
	local PosX= 0
	local PosY= 0 
	PosX, PosY = GetChaPos(role)
	--SystemNotice(role,PosX..","..PosY)
	if teamNum == 2   then
		if  PosX >= 5200 and PosY >= 5000 and PosX<=7625 and PosY<= 7725   then
			return 1
		elseif  PosX >= 7600 and PosY >= 5900 and PosX<=8325 and PosY<= 6825   then
			return 1
		elseif  PosX >= 4500 and PosY >= 5800 and PosX<=5200 and PosY<= 6725   then
			return 1
		end
	elseif teamNum ==1   then
		if  PosX >= 5700 and PosY >= 3400 and PosX<=7075 and PosY<= 5275   then
			return 1
		elseif  PosX >= 6200 and PosY >= 5300 and PosX<=6675 and PosY<= 6600   then
			return 1
		elseif  PosX >= 5700 and PosY >= 6600 and PosX<=7075 and PosY<= 8475   then
			return 1
		end
	elseif teamNum == 3   then
		if  PosX >= 5675 and PosY >= 4525 and PosX<= 7025 and PosY<= 5025   then
			return 1
		elseif  PosX >= 6175 and PosY >= 5000 and PosX<= 6525 and PosY<= 5600   then
			return 1
		elseif  PosX >= 5575 and PosY >= 5525 and PosX<= 7175 and PosY<= 7175   then
			return 1
		elseif  PosX >= 4600 and PosY >= 6175 and PosX<= 5600 and PosY<= 6525   then
			return 1
		elseif  PosX >= 4175 and PosY >= 5575 and PosX<= 4625 and PosY<= 7025   then
			return 1
		elseif  PosX >= 6050 and PosY >= 7000 and PosX<= 6425 and PosY<= 7725   then
			return 1
		elseif  PosX >= 5575 and PosY >= 7775 and PosX<= 6875 and PosY<= 8325   then
			return 1
		elseif  PosX >= 7000 and PosY >= 6100 and PosX<= 7800 and PosY<= 6525   then
			return 1
		elseif  PosX >= 7800 and PosY >= 5675 and PosX<= 8425 and PosY<= 7025   then
			return 1
		end
	end
	return 0
end

itemCanUseInJJC= {}
	itemCanUseInJJC[1]=1078
itemCanUseInJJC[2]=1079
itemCanUseInJJC[3]=1080
itemCanUseInJJC[4]=1081
itemCanUseInJJC[5]=1082
itemCanUseInJJC[6]=1083
itemCanUseInJJC[7]=1084
itemCanUseInJJC[8]=1085
itemCanUseInJJC[9]=1087
itemCanUseInJJC[10]=1088
itemCanUseInJJC[11]=1089
itemCanUseInJJC[12]=1090
itemCanUseInJJC[13]=893
itemCanUseInJJC[14]=894
itemCanUseInJJC[15]=895
itemCanUseInJJC[16]=896
itemCanUseInJJC[17]=897
itemCanUseInJJC[18]=5628
itemCanUseInJJC[19]=3342

function CheckItemCanUseInJJC(role,item)
	local itemType = GetItemType(item)
	if itemType<30   then
		if itemType==11   then 
			CALCULATE_FUNCTIONS_LUA_000614 = GetResString("CALCULATE_FUNCTIONS_LUA_000614")
			return CALCULATE_FUNCTIONS_LUA_000614
		end
		return 1
	end
	local i = 1
	local itemNo = GetItemID(item)	
	while itemCanUseInJJC[i]~=nil do 
		if itemNo ==itemCanUseInJJC[i]   then 
			return 1 
		end
		i=i+1
	end
	CALCULATE_FUNCTIONS_LUA_000615 = GetResString("CALCULATE_FUNCTIONS_LUA_000615")
	return CALCULATE_FUNCTIONS_LUA_000615 
end
----����ֵΪ 1 ��ʹ�ü���,0Ϊ����ʹ��
function CanUseItem(role ,Item)
	local ret = 1
	local teamNum,teamlv = IsPlayerInJJCMap(role)   -- IsPlayerInJJCMap(role) ���жϽ�ɫ�Ƿ��ھ�������ͼ��������򷵻�2�����ִ����ڼ��ž���������������򷵻�0��0
	if teamNum ~= 0 and teamlv~= 0   then
		ret = CheckItemCanUseInJJC(role,Item)
		if ret~= 1   then 
			SystemNotice(role,ret)
			return 0
		end
	end
	return 1
end
--���м���ʹ��ʱ���ã��������ʱ����������������   ����ֵΪ 1 ��ʹ�ü���,0Ϊ����ʹ��
function CanUseSkill(atk ,skillNo,skillLV)
	local ret = 1
	local posIn = 1
	local teamNum,teamlv = IsPlayerInJJCMap(atk)   -- IsPlayerInJJCMap(role) ���жϽ�ɫ�Ƿ��ھ�������ͼ��������򷵻�2�����ִ����ڼ��ž���������������򷵻�0��0
	if teamNum == 1 or teamNum == 3   then
		posIn= CheckPlayerIsInJJC(atk,teamNum,teamlv ) -- IsPlayerInJJCMap(role) ���жϽ�ɫ�Ƿ��ھ�������ͼ�ľ���������������򷵻�0�����򷵻�1		
	elseif  teamNum == 2   then 
		local PosX= 0
		local PosY= 0 
		PosX, PosY = GetChaPos(atk)
		PosX = math.floor(PosX/100)
		PosY = math.floor(PosY/100)
		if PosX < 55 or PosY < 55 or PosX>71 or PosY>71   then
			posIn = 0
		end
	end
	if posIn == 0    then 
		ret = 0 
		if skillNo~= 25 and (skillNo<28 or skillNo>38)   then
			CALCULATE_FUNCTIONS_LUA_000616 = GetResString("CALCULATE_FUNCTIONS_LUA_000616")
			SystemNotice(atk,CALCULATE_FUNCTIONS_LUA_000616)
		end
	end 
	return ret
end
function JobNumToName(num)
	CALCULATE_FUNCTIONS_LUA_000617 = GetResString("CALCULATE_FUNCTIONS_LUA_000617")
	CALCULATE_FUNCTIONS_LUA_000618 = GetResString("CALCULATE_FUNCTIONS_LUA_000618")
	CALCULATE_FUNCTIONS_LUA_000619 = GetResString("CALCULATE_FUNCTIONS_LUA_000619")
	CALCULATE_FUNCTIONS_LUA_000620 = GetResString("CALCULATE_FUNCTIONS_LUA_000620")
	CALCULATE_FUNCTIONS_LUA_000621 = GetResString("CALCULATE_FUNCTIONS_LUA_000621")
	CALCULATE_FUNCTIONS_LUA_000622 = GetResString("CALCULATE_FUNCTIONS_LUA_000622")
	CALCULATE_FUNCTIONS_LUA_000623 = GetResString("CALCULATE_FUNCTIONS_LUA_000623")
	CALCULATE_FUNCTIONS_LUA_000624 = GetResString("CALCULATE_FUNCTIONS_LUA_000624")
	CALCULATE_FUNCTIONS_LUA_000625 = GetResString("CALCULATE_FUNCTIONS_LUA_000625")
	CALCULATE_FUNCTIONS_LUA_000626 = GetResString("CALCULATE_FUNCTIONS_LUA_000626")
	CALCULATE_FUNCTIONS_LUA_000627 = GetResString("CALCULATE_FUNCTIONS_LUA_000627")
	CALCULATE_FUNCTIONS_LUA_000628 = GetResString("CALCULATE_FUNCTIONS_LUA_000628")
	CALCULATE_FUNCTIONS_LUA_000629 = GetResString("CALCULATE_FUNCTIONS_LUA_000629")
	CALCULATE_FUNCTIONS_LUA_000630 = GetResString("CALCULATE_FUNCTIONS_LUA_000630")
	CALCULATE_FUNCTIONS_LUA_000631 = GetResString("CALCULATE_FUNCTIONS_LUA_000631")
	CALCULATE_FUNCTIONS_LUA_000632 = GetResString("CALCULATE_FUNCTIONS_LUA_000632")
	CALCULATE_FUNCTIONS_LUA_000633 = GetResString("CALCULATE_FUNCTIONS_LUA_000633")
	CALCULATE_FUNCTIONS_LUA_000634 = GetResString("CALCULATE_FUNCTIONS_LUA_000634")
	CALCULATE_FUNCTIONS_LUA_000635 = GetResString("CALCULATE_FUNCTIONS_LUA_000635")
	local job={ CALCULATE_FUNCTIONS_LUA_000635,CALCULATE_FUNCTIONS_LUA_000634,CALCULATE_FUNCTIONS_LUA_000633,CALCULATE_FUNCTIONS_LUA_000632,CALCULATE_FUNCTIONS_LUA_000631,CALCULATE_FUNCTIONS_LUA_000630,CALCULATE_FUNCTIONS_LUA_000629,CALCULATE_FUNCTIONS_LUA_000628,CALCULATE_FUNCTIONS_LUA_000627,CALCULATE_FUNCTIONS_LUA_000626,CALCULATE_FUNCTIONS_LUA_000625,CALCULATE_FUNCTIONS_LUA_000624,CALCULATE_FUNCTIONS_LUA_000623,CALCULATE_FUNCTIONS_LUA_000622,CALCULATE_FUNCTIONS_LUA_000621,CALCULATE_FUNCTIONS_LUA_000620,CALCULATE_FUNCTIONS_LUA_000619,CALCULATE_FUNCTIONS_LUA_000618,CALCULATE_FUNCTIONS_LUA_000617}
	if ValidCha(job[num+1])~= 0   then 
		return job[num+1]
	else 
		CALCULATE_FUNCTIONS_LUA_000636 = GetResString("CALCULATE_FUNCTIONS_LUA_000636")
		return CALCULATE_FUNCTIONS_LUA_000636
	end
end
function CanChargeZHZZ(role)
	local ret = BankNoItem(role , 6066,1)
	if ret == 0   then 
		CALCULATE_FUNCTIONS_LUA_000637 = GetResString("CALCULATE_FUNCTIONS_LUA_000637")
		return CALCULATE_FUNCTIONS_LUA_000637
	end
	ret = NoItem(role , 6066,1 )
	if ret == 0   then 
		CALCULATE_FUNCTIONS_LUA_000638 = GetResString("CALCULATE_FUNCTIONS_LUA_000638")
		return CALCULATE_FUNCTIONS_LUA_000638
	end 
	ret = HasMoney(role , 50000)
	if ret == 0   then 
		CALCULATE_FUNCTIONS_LUA_000639 = GetResString("CALCULATE_FUNCTIONS_LUA_000639")
		return CALCULATE_FUNCTIONS_LUA_000639
	end 
	ret = HasLeaveBagGrid(role , 1 )
	if ret == 0   then 
		CALCULATE_FUNCTIONS_LUA_000640 = GetResString("CALCULATE_FUNCTIONS_LUA_000640")
		return CALCULATE_FUNCTIONS_LUA_000640
	end 
	return 1
end
function CheckJobIsNew ( role )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	if lv >= 10 and job ~= 0   then
		return 1
	else
		return 0 
	end
end 



function CheckSHSkill ( role )
	local sk_add = SK_BAT
	local skillLv = GetSkillLv( role , sk_add )
	if  ValidCha(skillLv) == 0   then
		return 0
	else
		return 1
	end	
end 


function AddExpRealPer2 ( role , per, exp )
	local lv = GetChaAttr(role, ATTR_LV) 
	if lv <= 50   then
		AddExpRealPer ( role , per, exp )
	else
		AddExp ( role, npc, 100000, 100000)
	end
	return 1
end 


function CheckAttrRole(role)
	local str = GetChaAttr ( role , ATTR_STR ) 
	local dex = GetChaAttr ( role , ATTR_DEX ) 
	local agi = GetChaAttr ( role , ATTR_AGI ) 
	local con = GetChaAttr ( role , ATTR_CON ) 
	local sta = GetChaAttr ( role , ATTR_STA ) 
	if str > 5 or dex > 5 or agi > 5 or con > 5 or sta > 5   then
		return 1
	else
		return 0
	end
end 


function CheckFirstSkill(role)
	local skills = {0066,0242,0074,0210,0079,0097,0099}
	local i = 0
	for i = 1,7,1 do 
		local skilllv =  GetSkillLv( role , skills[i] )
		--SystemNotice ( role , "skills=="..skills[i])
		if	skilllv ~=0   then 
			return 1						
		end
	end
	return 0
end 
-------------------Сѧ��ҵ------------------	
function Ques2()	
	CALCULATE_FUNCTIONS_LUA_000641 = GetResString("CALCULATE_FUNCTIONS_LUA_000641")
	AddQues (CALCULATE_FUNCTIONS_LUA_000641,ASK_RAND,QUIT_COUNT)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000642 = GetResString("CALCULATE_FUNCTIONS_LUA_000642")
	 Ques (CALCULATE_FUNCTIONS_LUA_000642)
	 InitChoose()
	 choose ( "3")
	 choose ( "4")
	 choose ( "5")
	 choose ( "6")
	 answer ("5")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000643 = GetResString("CALCULATE_FUNCTIONS_LUA_000643")
	 Ques (CALCULATE_FUNCTIONS_LUA_000643)
	 InitChoose()
	 choose ( "80")
	 choose ( "100")
	 choose ( "120")
	 choose ( "150")
	 answer ("120")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000644 = GetResString("CALCULATE_FUNCTIONS_LUA_000644")
	 Ques (CALCULATE_FUNCTIONS_LUA_000644)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 choose ( CALCULATE_FUNCTIONS_LUA_000645)
	 CALCULATE_FUNCTIONS_LUA_000646 = GetResString("CALCULATE_FUNCTIONS_LUA_000646")
	 choose ( CALCULATE_FUNCTIONS_LUA_000646)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 choose ( CALCULATE_FUNCTIONS_LUA_000648)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 answer (CALCULATE_FUNCTIONS_LUA_000648)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000649 = GetResString("CALCULATE_FUNCTIONS_LUA_000649")
	 Ques (CALCULATE_FUNCTIONS_LUA_000649)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 choose ( CALCULATE_FUNCTIONS_LUA_000645)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 choose ( CALCULATE_FUNCTIONS_LUA_000648)
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 answer (CALCULATE_FUNCTIONS_LUA_000645)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000650 = GetResString("CALCULATE_FUNCTIONS_LUA_000650")
	 Ques (CALCULATE_FUNCTIONS_LUA_000650)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 choose ( CALCULATE_FUNCTIONS_LUA_000645)
	 CALCULATE_FUNCTIONS_LUA_000646 = GetResString("CALCULATE_FUNCTIONS_LUA_000646")
	 choose ( CALCULATE_FUNCTIONS_LUA_000646)
	 CALCULATE_FUNCTIONS_LUA_000651 = GetResString("CALCULATE_FUNCTIONS_LUA_000651")
	 choose ( CALCULATE_FUNCTIONS_LUA_000651)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 answer (CALCULATE_FUNCTIONS_LUA_000645)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000652 = GetResString("CALCULATE_FUNCTIONS_LUA_000652")
	 Ques (CALCULATE_FUNCTIONS_LUA_000652)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000651 = GetResString("CALCULATE_FUNCTIONS_LUA_000651")
	 choose ( CALCULATE_FUNCTIONS_LUA_000651)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 choose ( CALCULATE_FUNCTIONS_LUA_000648)
	 CALCULATE_FUNCTIONS_LUA_000651 = GetResString("CALCULATE_FUNCTIONS_LUA_000651")
	 answer (CALCULATE_FUNCTIONS_LUA_000651)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000653 = GetResString("CALCULATE_FUNCTIONS_LUA_000653")
	 Ques (CALCULATE_FUNCTIONS_LUA_000653)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000654 = GetResString("CALCULATE_FUNCTIONS_LUA_000654")
	 choose ( CALCULATE_FUNCTIONS_LUA_000654)
	 CALCULATE_FUNCTIONS_LUA_000655 = GetResString("CALCULATE_FUNCTIONS_LUA_000655")
	 choose ( CALCULATE_FUNCTIONS_LUA_000655)
	 CALCULATE_FUNCTIONS_LUA_000656 = GetResString("CALCULATE_FUNCTIONS_LUA_000656")
	 choose ( CALCULATE_FUNCTIONS_LUA_000656)
	 CALCULATE_FUNCTIONS_LUA_000656 = GetResString("CALCULATE_FUNCTIONS_LUA_000656")
	 answer (CALCULATE_FUNCTIONS_LUA_000656)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000657 = GetResString("CALCULATE_FUNCTIONS_LUA_000657")
	 Ques (CALCULATE_FUNCTIONS_LUA_000657)
	 InitChoose()
	 choose ( "2")
	 choose ( "5")
	 choose ( "10")
	 choose ( "15")
	 answer ("10")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000658 = GetResString("CALCULATE_FUNCTIONS_LUA_000658")
	 Ques (CALCULATE_FUNCTIONS_LUA_000658)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000659 = GetResString("CALCULATE_FUNCTIONS_LUA_000659")
	 choose ( CALCULATE_FUNCTIONS_LUA_000659)
	 CALCULATE_FUNCTIONS_LUA_000660 = GetResString("CALCULATE_FUNCTIONS_LUA_000660")
	 choose ( CALCULATE_FUNCTIONS_LUA_000660)
	 CALCULATE_FUNCTIONS_LUA_000661 = GetResString("CALCULATE_FUNCTIONS_LUA_000661")
	 choose ( CALCULATE_FUNCTIONS_LUA_000661)
	 CALCULATE_FUNCTIONS_LUA_000662 = GetResString("CALCULATE_FUNCTIONS_LUA_000662")
	 choose ( CALCULATE_FUNCTIONS_LUA_000662)
	 CALCULATE_FUNCTIONS_LUA_000663 = GetResString("CALCULATE_FUNCTIONS_LUA_000663")
	 choose ( CALCULATE_FUNCTIONS_LUA_000663)
	 CALCULATE_FUNCTIONS_LUA_000663 = GetResString("CALCULATE_FUNCTIONS_LUA_000663")
	 answer (CALCULATE_FUNCTIONS_LUA_000663)
 end
 
-------------------�ڶ��ο���------------------	
function Ques3()	
	CALCULATE_FUNCTIONS_LUA_000664 = GetResString("CALCULATE_FUNCTIONS_LUA_000664")
	AddQues (CALCULATE_FUNCTIONS_LUA_000664,ASK_RAND,QUIT_COUNT)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000642 = GetResString("CALCULATE_FUNCTIONS_LUA_000642")
	 Ques (CALCULATE_FUNCTIONS_LUA_000642)
	 InitChoose()
	 choose ( "3")
	 choose ( "4")
	 choose ( "5")
	 choose ( "6")
	 answer ("5")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000643 = GetResString("CALCULATE_FUNCTIONS_LUA_000643")
	 Ques (CALCULATE_FUNCTIONS_LUA_000643)
	 InitChoose()
	 choose ( "80")
	 choose ( "100")
	 choose ( "120")
	 choose ( "150")
	 answer ("120")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000644 = GetResString("CALCULATE_FUNCTIONS_LUA_000644")
	 Ques (CALCULATE_FUNCTIONS_LUA_000644)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 choose ( CALCULATE_FUNCTIONS_LUA_000645)
	 CALCULATE_FUNCTIONS_LUA_000646 = GetResString("CALCULATE_FUNCTIONS_LUA_000646")
	 choose ( CALCULATE_FUNCTIONS_LUA_000646)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 choose ( CALCULATE_FUNCTIONS_LUA_000648)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 answer (CALCULATE_FUNCTIONS_LUA_000648)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000649 = GetResString("CALCULATE_FUNCTIONS_LUA_000649")
	 Ques (CALCULATE_FUNCTIONS_LUA_000649)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 choose ( CALCULATE_FUNCTIONS_LUA_000645)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 choose ( CALCULATE_FUNCTIONS_LUA_000648)
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 answer (CALCULATE_FUNCTIONS_LUA_000645)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000650 = GetResString("CALCULATE_FUNCTIONS_LUA_000650")
	 Ques (CALCULATE_FUNCTIONS_LUA_000650)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 choose ( CALCULATE_FUNCTIONS_LUA_000645)
	 CALCULATE_FUNCTIONS_LUA_000646 = GetResString("CALCULATE_FUNCTIONS_LUA_000646")
	 choose ( CALCULATE_FUNCTIONS_LUA_000646)
	 CALCULATE_FUNCTIONS_LUA_000651 = GetResString("CALCULATE_FUNCTIONS_LUA_000651")
	 choose ( CALCULATE_FUNCTIONS_LUA_000651)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000645 = GetResString("CALCULATE_FUNCTIONS_LUA_000645")
	 answer (CALCULATE_FUNCTIONS_LUA_000645)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000652 = GetResString("CALCULATE_FUNCTIONS_LUA_000652")
	 Ques (CALCULATE_FUNCTIONS_LUA_000652)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000651 = GetResString("CALCULATE_FUNCTIONS_LUA_000651")
	 choose ( CALCULATE_FUNCTIONS_LUA_000651)
	 CALCULATE_FUNCTIONS_LUA_000647 = GetResString("CALCULATE_FUNCTIONS_LUA_000647")
	 choose ( CALCULATE_FUNCTIONS_LUA_000647)
	 CALCULATE_FUNCTIONS_LUA_000648 = GetResString("CALCULATE_FUNCTIONS_LUA_000648")
	 choose ( CALCULATE_FUNCTIONS_LUA_000648)
	 CALCULATE_FUNCTIONS_LUA_000651 = GetResString("CALCULATE_FUNCTIONS_LUA_000651")
	 answer (CALCULATE_FUNCTIONS_LUA_000651)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000653 = GetResString("CALCULATE_FUNCTIONS_LUA_000653")
	 Ques (CALCULATE_FUNCTIONS_LUA_000653)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000654 = GetResString("CALCULATE_FUNCTIONS_LUA_000654")
	 choose ( CALCULATE_FUNCTIONS_LUA_000654)
	 CALCULATE_FUNCTIONS_LUA_000655 = GetResString("CALCULATE_FUNCTIONS_LUA_000655")
	 choose ( CALCULATE_FUNCTIONS_LUA_000655)
	 CALCULATE_FUNCTIONS_LUA_000656 = GetResString("CALCULATE_FUNCTIONS_LUA_000656")
	 choose ( CALCULATE_FUNCTIONS_LUA_000656)
	 CALCULATE_FUNCTIONS_LUA_000656 = GetResString("CALCULATE_FUNCTIONS_LUA_000656")
	 answer (CALCULATE_FUNCTIONS_LUA_000656)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000657 = GetResString("CALCULATE_FUNCTIONS_LUA_000657")
	 Ques (CALCULATE_FUNCTIONS_LUA_000657)
	 InitChoose()
	 choose ( "2")
	 choose ( "5")
	 choose ( "10")
	 choose ( "15")
	 answer ("10")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000658 = GetResString("CALCULATE_FUNCTIONS_LUA_000658")
	 Ques (CALCULATE_FUNCTIONS_LUA_000658)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000659 = GetResString("CALCULATE_FUNCTIONS_LUA_000659")
	 choose ( CALCULATE_FUNCTIONS_LUA_000659)
	 CALCULATE_FUNCTIONS_LUA_000660 = GetResString("CALCULATE_FUNCTIONS_LUA_000660")
	 choose ( CALCULATE_FUNCTIONS_LUA_000660)
	 CALCULATE_FUNCTIONS_LUA_000661 = GetResString("CALCULATE_FUNCTIONS_LUA_000661")
	 choose ( CALCULATE_FUNCTIONS_LUA_000661)
	 CALCULATE_FUNCTIONS_LUA_000662 = GetResString("CALCULATE_FUNCTIONS_LUA_000662")
	 choose ( CALCULATE_FUNCTIONS_LUA_000662)
	 CALCULATE_FUNCTIONS_LUA_000663 = GetResString("CALCULATE_FUNCTIONS_LUA_000663")
	 choose ( CALCULATE_FUNCTIONS_LUA_000663)
	 CALCULATE_FUNCTIONS_LUA_000663 = GetResString("CALCULATE_FUNCTIONS_LUA_000663")
	 answer (CALCULATE_FUNCTIONS_LUA_000663)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000665 = GetResString("CALCULATE_FUNCTIONS_LUA_000665")
	 Ques (CALCULATE_FUNCTIONS_LUA_000665)
	 InitChoose()
	 choose ( "5")
	 choose ( "10")
	 choose ( "15")
	 choose ( "20")
	 answer ("10")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000666 = GetResString("CALCULATE_FUNCTIONS_LUA_000666")
	 Ques (CALCULATE_FUNCTIONS_LUA_000666)
	 InitChoose()
	 choose ( "10")
	 choose ( "20")
	 choose ( "30")
	 choose ( "40")
	 answer ("40")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000667 = GetResString("CALCULATE_FUNCTIONS_LUA_000667")
	 Ques (CALCULATE_FUNCTIONS_LUA_000667)
	 InitChoose()
	 choose ( "ALT+Z")
	 choose ( "ALT+H")
	 choose ( "ALT+A")
	 choose ( "ALT+S")
	 answer ("ALT+H")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000668 = GetResString("CALCULATE_FUNCTIONS_LUA_000668")
	 Ques (CALCULATE_FUNCTIONS_LUA_000668)
	 InitChoose()
	 choose ( "ALT+Z")
	 choose ( "ALT+H")
	 choose ( "ALT+A")
	 choose ( "ALT+S")
	 answer ("ALT+Z")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000669 = GetResString("CALCULATE_FUNCTIONS_LUA_000669")
	 Ques (CALCULATE_FUNCTIONS_LUA_000669)
	 InitChoose()
	 choose ( "38")
	 choose ( "39")
	 choose ( "40")
	 choose ( "41")
	 answer ("41")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000670 = GetResString("CALCULATE_FUNCTIONS_LUA_000670")
	 Ques (CALCULATE_FUNCTIONS_LUA_000670)
	 InitChoose()
	 BIRTH_BIRTH_CONF_LUA_000001 = GetResString("BIRTH_BIRTH_CONF_LUA_000001")
	 choose ( BIRTH_BIRTH_CONF_LUA_000001)
	 BIRTH_BIRTH_CONF_LUA_000003 = GetResString("BIRTH_BIRTH_CONF_LUA_000003")
	 choose ( BIRTH_BIRTH_CONF_LUA_000003)
	 BIRTH_BIRTH_CONF_LUA_000004 = GetResString("BIRTH_BIRTH_CONF_LUA_000004")
	 choose ( BIRTH_BIRTH_CONF_LUA_000004)
	 BIRTH_BIRTH_CONF_LUA_000002 = GetResString("BIRTH_BIRTH_CONF_LUA_000002")
	 choose ( BIRTH_BIRTH_CONF_LUA_000002)
	 BIRTH_BIRTH_CONF_LUA_000003 = GetResString("BIRTH_BIRTH_CONF_LUA_000003")
	 answer (BIRTH_BIRTH_CONF_LUA_000003)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000671 = GetResString("CALCULATE_FUNCTIONS_LUA_000671")
	 Ques (CALCULATE_FUNCTIONS_LUA_000671)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000672 = GetResString("CALCULATE_FUNCTIONS_LUA_000672")
	 choose ( CALCULATE_FUNCTIONS_LUA_000672)
	 CALCULATE_FUNCTIONS_LUA_000673 = GetResString("CALCULATE_FUNCTIONS_LUA_000673")
	 choose ( CALCULATE_FUNCTIONS_LUA_000673)
	 CALCULATE_FUNCTIONS_LUA_000674 = GetResString("CALCULATE_FUNCTIONS_LUA_000674")
	 choose ( CALCULATE_FUNCTIONS_LUA_000674)
	 CALCULATE_FUNCTIONS_LUA_000675 = GetResString("CALCULATE_FUNCTIONS_LUA_000675")
	 choose ( CALCULATE_FUNCTIONS_LUA_000675)
	 CALCULATE_FUNCTIONS_LUA_000674 = GetResString("CALCULATE_FUNCTIONS_LUA_000674")
	 answer (CALCULATE_FUNCTIONS_LUA_000674)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000676 = GetResString("CALCULATE_FUNCTIONS_LUA_000676")
	 Ques (CALCULATE_FUNCTIONS_LUA_000676)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000634 = GetResString("CALCULATE_FUNCTIONS_LUA_000634")
	 choose ( CALCULATE_FUNCTIONS_LUA_000634)
	 CALCULATE_FUNCTIONS_LUA_000633 = GetResString("CALCULATE_FUNCTIONS_LUA_000633")
	 choose ( CALCULATE_FUNCTIONS_LUA_000633)
	 CALCULATE_FUNCTIONS_LUA_000631 = GetResString("CALCULATE_FUNCTIONS_LUA_000631")
	 choose ( CALCULATE_FUNCTIONS_LUA_000631)
	 CALCULATE_FUNCTIONS_LUA_000677 = GetResString("CALCULATE_FUNCTIONS_LUA_000677")
	 choose ( CALCULATE_FUNCTIONS_LUA_000677)
	 CALCULATE_FUNCTIONS_LUA_000634 = GetResString("CALCULATE_FUNCTIONS_LUA_000634")
	 answer (CALCULATE_FUNCTIONS_LUA_000634)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000678 = GetResString("CALCULATE_FUNCTIONS_LUA_000678")
	 Ques (CALCULATE_FUNCTIONS_LUA_000678)
	 InitChoose()
	 choose ( "ALT+W")
	 choose ( "ALT+H")
	 choose ( "ALT+A")
	 choose ( "ALT+S")
	 answer ("ALT+W")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000679 = GetResString("CALCULATE_FUNCTIONS_LUA_000679")
	 Ques (CALCULATE_FUNCTIONS_LUA_000679)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000680 = GetResString("CALCULATE_FUNCTIONS_LUA_000680")
	 choose ( CALCULATE_FUNCTIONS_LUA_000680)
	 CALCULATE_FUNCTIONS_LUA_000681 = GetResString("CALCULATE_FUNCTIONS_LUA_000681")
	 choose ( CALCULATE_FUNCTIONS_LUA_000681)
	 CALCULATE_FUNCTIONS_LUA_000682 = GetResString("CALCULATE_FUNCTIONS_LUA_000682")
	 choose ( CALCULATE_FUNCTIONS_LUA_000682)
	 CALCULATE_FUNCTIONS_LUA_000683 = GetResString("CALCULATE_FUNCTIONS_LUA_000683")
	 choose ( CALCULATE_FUNCTIONS_LUA_000683)
	 CALCULATE_FUNCTIONS_LUA_000680 = GetResString("CALCULATE_FUNCTIONS_LUA_000680")
	 answer (CALCULATE_FUNCTIONS_LUA_000680)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000684 = GetResString("CALCULATE_FUNCTIONS_LUA_000684")
	 Ques (CALCULATE_FUNCTIONS_LUA_000684)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000634 = GetResString("CALCULATE_FUNCTIONS_LUA_000634")
	 choose ( CALCULATE_FUNCTIONS_LUA_000634)
	 CALCULATE_FUNCTIONS_LUA_000633 = GetResString("CALCULATE_FUNCTIONS_LUA_000633")
	 choose ( CALCULATE_FUNCTIONS_LUA_000633)
	 CALCULATE_FUNCTIONS_LUA_000631 = GetResString("CALCULATE_FUNCTIONS_LUA_000631")
	 choose ( CALCULATE_FUNCTIONS_LUA_000631)
	 CALCULATE_FUNCTIONS_LUA_000677 = GetResString("CALCULATE_FUNCTIONS_LUA_000677")
	 choose ( CALCULATE_FUNCTIONS_LUA_000677)
	 CALCULATE_FUNCTIONS_LUA_000631 = GetResString("CALCULATE_FUNCTIONS_LUA_000631")
	 answer (CALCULATE_FUNCTIONS_LUA_000631)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000685 = GetResString("CALCULATE_FUNCTIONS_LUA_000685")
	 Ques (CALCULATE_FUNCTIONS_LUA_000685)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000686 = GetResString("CALCULATE_FUNCTIONS_LUA_000686")
	 choose ( CALCULATE_FUNCTIONS_LUA_000686)
	 CALCULATE_FUNCTIONS_LUA_000687 = GetResString("CALCULATE_FUNCTIONS_LUA_000687")
	 choose ( CALCULATE_FUNCTIONS_LUA_000687)
	 CALCULATE_FUNCTIONS_LUA_000688 = GetResString("CALCULATE_FUNCTIONS_LUA_000688")
	 choose ( CALCULATE_FUNCTIONS_LUA_000688)
	 CALCULATE_FUNCTIONS_LUA_000689 = GetResString("CALCULATE_FUNCTIONS_LUA_000689")
	 choose ( CALCULATE_FUNCTIONS_LUA_000689)
	 CALCULATE_FUNCTIONS_LUA_000687 = GetResString("CALCULATE_FUNCTIONS_LUA_000687")
	 answer (CALCULATE_FUNCTIONS_LUA_000687)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000690 = GetResString("CALCULATE_FUNCTIONS_LUA_000690")
	 Ques (CALCULATE_FUNCTIONS_LUA_000690)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000691 = GetResString("CALCULATE_FUNCTIONS_LUA_000691")
	 choose ( CALCULATE_FUNCTIONS_LUA_000691)
	 CALCULATE_FUNCTIONS_LUA_000692 = GetResString("CALCULATE_FUNCTIONS_LUA_000692")
	 choose ( CALCULATE_FUNCTIONS_LUA_000692)
	 CALCULATE_FUNCTIONS_LUA_000693 = GetResString("CALCULATE_FUNCTIONS_LUA_000693")
	 choose ( CALCULATE_FUNCTIONS_LUA_000693)
	 CALCULATE_FUNCTIONS_LUA_000694 = GetResString("CALCULATE_FUNCTIONS_LUA_000694")
	 choose ( CALCULATE_FUNCTIONS_LUA_000694)
	 CALCULATE_FUNCTIONS_LUA_000691 = GetResString("CALCULATE_FUNCTIONS_LUA_000691")
	 answer (CALCULATE_FUNCTIONS_LUA_000691)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000695 = GetResString("CALCULATE_FUNCTIONS_LUA_000695")
	 Ques (CALCULATE_FUNCTIONS_LUA_000695)
	 InitChoose()
	 choose ( "5")
	 choose ( "10")
	 choose ( "15")
	 choose ( "30")
	 answer ("10")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000696 = GetResString("CALCULATE_FUNCTIONS_LUA_000696")
	 Ques (CALCULATE_FUNCTIONS_LUA_000696)
	 InitChoose()
	 choose ( "1")
	 choose ( "2")
	 choose ( "3")
	 choose ( "4")
	 answer ("1")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000697 = GetResString("CALCULATE_FUNCTIONS_LUA_000697")
	 Ques (CALCULATE_FUNCTIONS_LUA_000697)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000698 = GetResString("CALCULATE_FUNCTIONS_LUA_000698")
	 choose ( CALCULATE_FUNCTIONS_LUA_000698)
	 CALCULATE_FUNCTIONS_LUA_000699 = GetResString("CALCULATE_FUNCTIONS_LUA_000699")
	 choose ( CALCULATE_FUNCTIONS_LUA_000699)
	 CALCULATE_FUNCTIONS_LUA_000700 = GetResString("CALCULATE_FUNCTIONS_LUA_000700")
	 choose ( CALCULATE_FUNCTIONS_LUA_000700)
	 CALCULATE_FUNCTIONS_LUA_000701 = GetResString("CALCULATE_FUNCTIONS_LUA_000701")
	 choose ( CALCULATE_FUNCTIONS_LUA_000701)
	 CALCULATE_FUNCTIONS_LUA_000699 = GetResString("CALCULATE_FUNCTIONS_LUA_000699")
	 answer (CALCULATE_FUNCTIONS_LUA_000699)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000702 = GetResString("CALCULATE_FUNCTIONS_LUA_000702")
	 Ques (CALCULATE_FUNCTIONS_LUA_000702)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000703 = GetResString("CALCULATE_FUNCTIONS_LUA_000703")
	 choose ( CALCULATE_FUNCTIONS_LUA_000703)
	 CALCULATE_FUNCTIONS_LUA_000704 = GetResString("CALCULATE_FUNCTIONS_LUA_000704")
	 choose ( CALCULATE_FUNCTIONS_LUA_000704)
	 CALCULATE_FUNCTIONS_LUA_000705 = GetResString("CALCULATE_FUNCTIONS_LUA_000705")
	 choose ( CALCULATE_FUNCTIONS_LUA_000705)
	 CALCULATE_FUNCTIONS_LUA_000705 = GetResString("CALCULATE_FUNCTIONS_LUA_000705")
	 answer (CALCULATE_FUNCTIONS_LUA_000705)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000706 = GetResString("CALCULATE_FUNCTIONS_LUA_000706")
	 Ques (CALCULATE_FUNCTIONS_LUA_000706)
	 InitChoose()
	 choose ( "ALT+Z")
	 choose ( "ALT+H")
	 choose ( "ALT+A")
	 choose ( "ALT+S")
	 answer ("ALT+Z")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000707 = GetResString("CALCULATE_FUNCTIONS_LUA_000707")
	 Ques (CALCULATE_FUNCTIONS_LUA_000707)
	 InitChoose()
	 choose ( "ALT+Q")
	 choose ( "ALT+H")
	 choose ( "ALT+A")
	 choose ( "ALT+S")
	 answer ("ALT+Q")
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000708 = GetResString("CALCULATE_FUNCTIONS_LUA_000708")
	 Ques (CALCULATE_FUNCTIONS_LUA_000708)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000709 = GetResString("CALCULATE_FUNCTIONS_LUA_000709")
	 choose ( CALCULATE_FUNCTIONS_LUA_000709)
	 CALCULATE_FUNCTIONS_LUA_000710 = GetResString("CALCULATE_FUNCTIONS_LUA_000710")
	 choose ( CALCULATE_FUNCTIONS_LUA_000710)
	 CALCULATE_FUNCTIONS_LUA_000711 = GetResString("CALCULATE_FUNCTIONS_LUA_000711")
	 choose ( CALCULATE_FUNCTIONS_LUA_000711)
	 CALCULATE_FUNCTIONS_LUA_000712 = GetResString("CALCULATE_FUNCTIONS_LUA_000712")
	 choose ( CALCULATE_FUNCTIONS_LUA_000712)
	 CALCULATE_FUNCTIONS_LUA_000711 = GetResString("CALCULATE_FUNCTIONS_LUA_000711")
	 answer (CALCULATE_FUNCTIONS_LUA_000711)
	 AddNextQues()
	 CALCULATE_FUNCTIONS_LUA_000713 = GetResString("CALCULATE_FUNCTIONS_LUA_000713")
	 Ques (CALCULATE_FUNCTIONS_LUA_000713)
	 InitChoose()
	 CALCULATE_FUNCTIONS_LUA_000714 = GetResString("CALCULATE_FUNCTIONS_LUA_000714")
	 choose ( CALCULATE_FUNCTIONS_LUA_000714)
	 CALCULATE_FUNCTIONS_LUA_000715 = GetResString("CALCULATE_FUNCTIONS_LUA_000715")
	 choose ( CALCULATE_FUNCTIONS_LUA_000715)
	 CALCULATE_FUNCTIONS_LUA_000716 = GetResString("CALCULATE_FUNCTIONS_LUA_000716")
	 choose ( CALCULATE_FUNCTIONS_LUA_000716)
	 CALCULATE_FUNCTIONS_LUA_000717 = GetResString("CALCULATE_FUNCTIONS_LUA_000717")
	 choose ( CALCULATE_FUNCTIONS_LUA_000717)
	 CALCULATE_FUNCTIONS_LUA_000715 = GetResString("CALCULATE_FUNCTIONS_LUA_000715")
	 answer (CALCULATE_FUNCTIONS_LUA_000715)
 end	





function CheckXXBYPoint(role,ope,num)
	local XXBYid  = GetChaDefaultName ( role ) 
	if ValidCha(XXBYpoint[XXBYid]) == 0   then 
		return 0 
	end
	if ope ==">"   then 
		if XXBYpoint[XXBYid] > num   then 
			return 1
		end
	elseif ope ==">="   then 
		if XXBYpoint[XXBYid] >= num   then 
			return 1
		end
	elseif ope =="=="   then 
		if XXBYpoint[XXBYid] == num   then 
			return 1
		end
	elseif ope =="~="   then 
		if XXBYpoint[XXBYid] ~= num   then 
			return 1
		end
	elseif ope =="<="   then 
		if XXBYpoint[XXBYid] <= num   then 
			return 1
		end
	elseif ope =="<"   then 
		if XXBYpoint[XXBYid] < num   then 
			return 1
		end
	else
		return 0 
	end
	return 0
end

	
function GiveXXBYRewards(role)
	local XXBYid  = GetChaDefaultName ( role ) 
	if ValidCha(XXBYpoint[XXBYid]) == 0   then 
		return 0 
	end
	if XXBYpoint[XXBYid] >=60   then 
		TrigASBJY(role,1,20*60)	
	end
	if XXBYpoint[XXBYid] >=70   then
		Give20Hand(role)
	end
	if XXBYpoint[XXBYid] >=80   then 
		Give20Leg(role)
	end
	if XXBYpoint[XXBYid] >=90   then
		GiveItem(role,0,4617,1,4)
	end
	if XXBYpoint[XXBYid] >=100   then 
		GiveItem(role,0,4673,1,4)
	end
	AddExp( role , npc , 22376 , 22376)
	return 1
end
function Give20Hand(role)
	local zblv = 20
	local zbtype = 23
	local count,equip = SearchZBbyTable(role,InIt20Hand,zblv,zbtype)
	if count>0   then 
		local i = math.random(1,count)
		GiveItem(role,0,equip[i],1,4)
	else
		local name = GetChaDefaultName(role)
		CALCULATE_FUNCTIONS_LUA_000718 = GetResString("CALCULATE_FUNCTIONS_LUA_000718")
		CALCULATE_FUNCTIONS_LUA_000719 = GetResString("CALCULATE_FUNCTIONS_LUA_000719")
		LG("Search_err",CALCULATE_FUNCTIONS_LUA_000719,name,CALCULATE_FUNCTIONS_LUA_000718)
	end
end
function Give20Leg(role)
	local zblv = 20
	local zbtype = 24
	local count,equip = SearchZBbyTable(role,InIt20Leg,zblv,zbtype)
	if count>0   then 
		local i = math.random(1,count)
		GiveItem(role,0,equip[i],1,4)
	else
		local name = GetChaDefaultName(role)
		CALCULATE_FUNCTIONS_LUA_000718 = GetResString("CALCULATE_FUNCTIONS_LUA_000718")
		CALCULATE_FUNCTIONS_LUA_000720 = GetResString("CALCULATE_FUNCTIONS_LUA_000720")
		LG("Search_err",CALCULATE_FUNCTIONS_LUA_000720,name,CALCULATE_FUNCTIONS_LUA_000718)
	end
end
function InIt20Leg()
ZBID[1]="0643"	RoleType[1]="3,2,1"	ZBLV[1]="20"	RoleJob[1]="1,8,9,10"	ZBType[1]="24"
ZBID[2]="0658"	RoleType[2]="1,3"	ZBLV[2]="20"	RoleJob[2]="2,11,12"	ZBType[2]="24"
ZBID[3]="0690"	RoleType[3]="1,3"	ZBLV[3]="20"	RoleJob[3]="4,16"	ZBType[3]="24"
ZBID[4]="0718"	RoleType[4]="3"	ZBLV[4]="20"	RoleJob[4]="5,13,14"	ZBType[4]="24"
ZBID[5]="0733"	RoleType[5]="4"	ZBLV[5]="20"	RoleJob[5]="5,13,14"	ZBType[5]="24"
ZBID[6]="0738"	RoleType[6]="4"	ZBLV[6]="20"	RoleJob[6]="4,16"	ZBType[6]="24"
	ZBcount = 6
end
function InIt20Hand ()--type: 1,2,3---5;1,3----1;3----3;4---4	
	ZBID[1]="0467"	RoleType[1]="3,2,1"	ZBLV[1]="20"	RoleJob[1]="1,8,9,10"	ZBType[1]="23"
	ZBID[2]="0482"	RoleType[2]="1,3"	ZBLV[2]="20"	RoleJob[2]="2,11,12"	ZBType[2]="23"
	ZBID[3]="0514"	RoleType[3]="1,3"	ZBLV[3]="20"	RoleJob[3]="4,16"	ZBType[3]="23"
	ZBID[4]="0542"	RoleType[4]="3"	ZBLV[4]="20"	RoleJob[4]="5,13,14"	ZBType[4]="23"
	ZBID[5]="0557"	RoleType[5]="4"	ZBLV[5]="20"	RoleJob[5]="5,13,14"	ZBType[5]="23"
	ZBID[6]="0562"	RoleType[6]="4"	ZBLV[6]="20"	RoleJob[6]="4,16"	ZBType[6]="23"
	ZBcount = 6
end
function CheckZBbyString(job,jobtest)
	local list = Split(jobtest, ",")
	local i = 1 
	while list[i]~=nil do
		if job == tonumber(list[i]) or tonumber(list[i])== -1   then 
			return 1
		end
		i=i+1
	end
end
function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex   then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
		break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end

 

function SearchZBbyTable(role,Table,zblv,zbtype)
	ZBID={} 
	RoleType={}
	ZBLV={}
	RoleJob={}
	ZBType={}
	ZBcount = 0
	if Table == InIt20Hand   then 
		InIt20Hand ()
	elseif Table == InIt20Leg   then 
		InIt20Leg ()
	elseif Table == ZBlist25To30HL   then 
		ZBlist25To30HL ()
	elseif Table == InitZXBY   then 
		InitZXBY ()
	end
	local job = GetChaAttr(role,ATTR_JOB)
	local roletype = GetChaTypeID(role)
	local equip = {}
	equip[1]= 0466
	local equipCount = 0 
	local i = 0 
	for i = 1 ,ZBcount ,1 do 
		if CheckZBbyString(job,RoleJob[i])==1 and zblv == tonumber(ZBLV[i]) and CheckZBbyString(roletype,RoleType[i])== 1 and zbtype == tonumber(ZBType[i])   then 
			equipCount= equipCount+1
			equip[equipCount] = ZBID[i]
		end
	end
	ZBID=nil
	RoleType=nil
	ZBLV=nil
	RoleJob=nil
	ZBType=nil
	ZBcount = nil
	return equipCount,equip
end
function ZBlist25To30HL()
ZBID[1]="0286"	RoleType[1]="-1"	ZBLV[1]="30"	RoleJob[1]="-1"	ZBType[1]="26"
ZBID[2]="0287"	RoleType[2]="-1"	ZBLV[2]="30"	RoleJob[2]="-1"	ZBType[2]="26"
ZBID[3]="0288"	RoleType[3]="-1"	ZBLV[3]="30"	RoleJob[3]="-1"	ZBType[3]="26"
ZBID[4]="0321"	RoleType[4]="-1"	ZBLV[4]="30"	RoleJob[4]="-1"	ZBType[4]="26"
ZBID[5]="0468"	RoleType[5]="3,2,1"	ZBLV[5]="25"	RoleJob[5]="1,8,9,10"	ZBType[5]="23"
ZBID[6]="0469"	RoleType[6]="3,2,1"	ZBLV[6]="30"	RoleJob[6]="1,8,9,10"	ZBType[6]="23"
ZBID[7]="0473"	RoleType[7]="3,2,1"	ZBLV[7]="25"	RoleJob[7]="1,8,9,10"	ZBType[7]="23"
ZBID[8]="0483"	RoleType[8]="1,3"	ZBLV[8]="30"	RoleJob[8]="2,11,12"	ZBType[8]="23"
ZBID[9]="0487"	RoleType[9]="1,3"	ZBLV[9]="25"	RoleJob[9]="2,11,12"	ZBType[9]="23"
ZBID[10]="0513"	RoleType[10]="1,3"	ZBLV[10]="25"	RoleJob[10]="4,16"	ZBType[10]="23"
ZBID[11]="0516"	RoleType[11]="1,3"	ZBLV[11]="30"	RoleJob[11]="4,16"	ZBType[11]="23"
ZBID[12]="0524"	RoleType[12]="-1"	ZBLV[12]="30"	RoleJob[12]="-1"	ZBType[12]="26"
ZBID[13]="0526"	RoleType[13]="4"	ZBLV[13]="30"	RoleJob[13]="4,16"	ZBType[13]="23"
ZBID[14]="0528"	RoleType[14]="4"	ZBLV[14]="25"	RoleJob[14]="4,16"	ZBType[14]="23"
ZBID[15]="0536"	RoleType[15]="4"	ZBLV[15]="25"	RoleJob[15]="5,13,14"	ZBType[15]="23"
ZBID[16]="0544"	RoleType[16]="3"	ZBLV[16]="30"	RoleJob[16]="5,13,14"	ZBType[16]="23"
ZBID[17]="0549"	RoleType[17]="3"	ZBLV[17]="25"	RoleJob[17]="5,13,14"	ZBType[17]="23"
ZBID[18]="0565"	RoleType[18]="4"	ZBLV[18]="30"	RoleJob[18]="5,13,14"	ZBType[18]="23"
ZBID[19]="0645"	RoleType[19]="3,2,1"	ZBLV[19]="30"	RoleJob[19]="1,8,9,10"	ZBType[19]="24"
ZBID[20]="0649"	RoleType[20]="3,2,1"	ZBLV[20]="25"	RoleJob[20]="1,8,9,10"	ZBType[20]="24"
ZBID[21]="0659"	RoleType[21]="1,3"	ZBLV[21]="30"	RoleJob[21]="2,11,12"	ZBType[21]="24"
ZBID[22]="0665"	RoleType[22]="1,3"	ZBLV[22]="25"	RoleJob[22]="2,11,12"	ZBType[22]="24"
ZBID[23]="0689"	RoleType[23]="1,3"	ZBLV[23]="25"	RoleJob[23]="4,16"	ZBType[23]="24"
ZBID[24]="0692"	RoleType[24]="1,3"	ZBLV[24]="30"	RoleJob[24]="4,16"	ZBType[24]="24"
ZBID[25]="0702"	RoleType[25]="4"	ZBLV[25]="30"	RoleJob[25]="4,16"	ZBType[25]="24"
ZBID[26]="0704"	RoleType[26]="4"	ZBLV[26]="25"	RoleJob[26]="4,16"	ZBType[26]="24"
ZBID[27]="0712"	RoleType[27]="4"	ZBLV[27]="25"	RoleJob[27]="5,13,14"	ZBType[27]="24"
ZBID[28]="0720"	RoleType[28]="3"	ZBLV[28]="30"	RoleJob[28]="5,13,14"	ZBType[28]="24"
ZBID[29]="0725"	RoleType[29]="3"	ZBLV[29]="25"	RoleJob[29]="5,13,14"	ZBType[29]="24"
ZBID[30]="0741"	RoleType[30]="4"	ZBLV[30]="30"	RoleJob[30]="5,13,14"	ZBType[30]="24"
ZBID[31]="1935"	RoleType[31]="3,2,1"	ZBLV[31]="30"	RoleJob[31]="1,8,9,10"	ZBType[31]="23"
ZBID[32]="1939"	RoleType[32]="3,2,1"	ZBLV[32]="30"	RoleJob[32]="1,8,9,10"	ZBType[32]="24"
ZBID[33]="1947"	RoleType[33]="1,3"	ZBLV[33]="30"	RoleJob[33]="2,11,12"	ZBType[33]="23"
ZBID[34]="1951"	RoleType[34]="1,3"	ZBLV[34]="30"	RoleJob[34]="2,11,12"	ZBType[34]="24"
ZBID[35]="1962"	RoleType[35]="3,4"	ZBLV[35]="30"	RoleJob[35]="5,13,14"	ZBType[35]="23"
ZBID[36]="1969"	RoleType[36]="3,4"	ZBLV[36]="30"	RoleJob[36]="5,13,14"	ZBType[36]="24"
ZBID[37]="1980"	RoleType[37]="1,3,4"	ZBLV[37]="30"	RoleJob[37]="4,16"	ZBType[37]="23"
ZBID[38]="1984"	RoleType[38]="1,3,4"	ZBLV[38]="30"	RoleJob[38]="4,16"	ZBType[38]="24"
ZBID[39]="3667"	RoleType[39]="-1"	ZBLV[39]="30"	RoleJob[39]="-1"	ZBType[39]="26"
ZBID[40]="3668"	RoleType[40]="-1"	ZBLV[40]="30"	RoleJob[40]="-1"	ZBType[40]="26"
ZBID[41]="4621"	RoleType[41]="-1"	ZBLV[41]="25"	RoleJob[41]="-1"	ZBType[41]="26"
ZBID[42]="4622"	RoleType[42]="-1"	ZBLV[42]="25"	RoleJob[42]="-1"	ZBType[42]="26"
ZBID[43]="4623"	RoleType[43]="-1"	ZBLV[43]="25"	RoleJob[43]="-1"	ZBType[43]="26"
ZBID[44]="4624"	RoleType[44]="-1"	ZBLV[44]="25"	RoleJob[44]="-1"	ZBType[44]="26"
ZBID[45]="4625"	RoleType[45]="-1"	ZBLV[45]="25"	RoleJob[45]="-1"	ZBType[45]="26"
ZBID[46]="4626"	RoleType[46]="-1"	ZBLV[46]="30"	RoleJob[46]="-1"	ZBType[46]="26"
ZBID[47]="4627"	RoleType[47]="-1"	ZBLV[47]="30"	RoleJob[47]="-1"	ZBType[47]="26"
ZBID[48]="4628"	RoleType[48]="-1"	ZBLV[48]="30"	RoleJob[48]="-1"	ZBType[48]="26"
ZBID[49]="4629"	RoleType[49]="-1"	ZBLV[49]="30"	RoleJob[49]="-1"	ZBType[49]="26"
ZBID[50]="4630"	RoleType[50]="-1"	ZBLV[50]="30"	RoleJob[50]="-1"	ZBType[50]="26"

ZBcount = 50
end
function GiveLiLianPrize(role,zblv,zbtype)
	local count,equip = SearchZBbyTable(role,ZBlist25To30HL,zblv,zbtype)
	if count > 0   then
		local i = math.random(1,count)
		GiveItem(role,0,equip[i],1,4)
	else 
		local name = GetChaDefaultName(role)
		CALCULATE_FUNCTIONS_LUA_000718 = GetResString("CALCULATE_FUNCTIONS_LUA_000718")
		CALCULATE_FUNCTIONS_LUA_000720 = GetResString("CALCULATE_FUNCTIONS_LUA_000720")
		LG("Search_err",CALCULATE_FUNCTIONS_LUA_000720,name,CALCULATE_FUNCTIONS_LUA_000718)
	end
end
function BaBuPrize(role)
	local itemNum=CheckBagItem(role ,6710)
	local expGive= 3500
	
	if itemNum<5   then 
	local temp = 0
	local temp2 = 0 
		while itemNum>0 do 
			temp = 1/ math.pow(2,itemNum)
			itemNum=itemNum-1
			temp2=temp2+temp			
		end
		expGive= math.floor(expGive+expGive*temp2)
	else 
		expGive = math.floor(expGive+expGive*1/2+expGive*1/4+expGive*1/8+expGive*1/16)
	end
	AddExp(role,0,expGive,expGive)
	if itemNum>= 6   then 
		GiveLiLianPrize(role,25,23)
	end
	if  itemNum>= 8   then 
		GiveLiLianPrize(role,30,24)
	end
	if  itemNum>= 11   then 
		GiveLiLianPrize(role,30,26)
	end
	if  itemNum>= 13   then 
		GiveItem(role,0,6714,1,4)
		
	end
	RemoveChaItem(role,6710,13,2,-1,2,1)
	return 1
end

function ALBSPrize(role)
	local itemNum=CheckBagItem(role ,6711)
	local expGive= 3500
	
		if itemNum<5   then 
	local temp = 0
	local temp2 = 0 
		while itemNum>0 do 
			temp = 1/ math.pow(2,itemNum)
			itemNum=itemNum-1
			temp2=temp2+temp			
		end
		expGive= math.floor(expGive+expGive*temp2)
	else 
		expGive = math.floor(expGive+expGive*1/2+expGive*1/4+expGive*1/8+expGive*1/16)
	end
	-----GiveEXp
	AddExp(role,0,expGive,expGive)
	if itemNum>= 6   then 
		GiveLiLianPrize(role,25,24)
	end
	if  itemNum>= 8   then 
		GiveLiLianPrize(role,30,26)
	end
	if  itemNum>= 11   then 
		GiveLiLianPrize(role,30,23)
	end
	if  itemNum>= 13   then 
		GiveItem(role,0,6715,1,4)
	end
	RemoveChaItem(role,6711,13,2,-1,2,1)
	return 1
end

function BLGLPrize(role)
	local itemNum=CheckBagItem(role ,6709)
	local expGive= 3500
		if itemNum<5   then 
	local temp = 0
	local temp2 = 0 
		while itemNum>0 do 
			temp = 1/ math.pow(2,itemNum)
			itemNum=itemNum-1
			temp2=temp2+temp			
		end
		expGive= math.floor(expGive+expGive*temp2)
	else 
		expGive = math.floor(expGive+expGive*1/2+expGive*1/4+expGive*1/8+expGive*1/16)
	end
	-----GiveEXp
	AddExp(role,0,expGive,expGive)
	if itemNum>= 6   then 
		GiveLiLianPrize(role,25,26)
	end
	if  itemNum>= 8   then 
		GiveLiLianPrize(role,30,23)
	end
	if  itemNum>= 11   then 
		GiveLiLianPrize(role,30,24)
	end
	if  itemNum>= 13   then 
		GiveItem(role,0,6716,1,4)
	end
	RemoveChaItem(role,6709,13,2,-1,2,1)
	return 1
end
function CheckItemHasForge(item)
	local Jinglianxinxi = GetItemForgeParam ( item , 1 )
	Jinglianxinxi = TansferNum ( Jinglianxinxi )
	local Item_Stone={}
	Item_Stone[0] = GetNum_Part2 ( Jinglianxinxi )
	Item_Stone[1] = GetNum_Part4 ( Jinglianxinxi )
	Item_Stone[2] = GetNum_Part6 ( Jinglianxinxi )
	
	if Item_Stone[0]==0 and Item_Stone[1]==0 and Item_Stone[2]==0   then
		return 0		
	end
	return 1
end
function CheckRoleLearnedForge(role)
	local item = GetChaItem(role,1,2)
	local ret = CheckItemHasForge(item)
	if ret == 1   then 
		return 1
	end
	local i = 0
	local bagnum = GetKbCap(role) 
	for i= 0,bagnum-1,1 do 
		item = GetChaItem(role,2,i)
		local itemType=GetItemType(item)
		if itemType == 22 or itemType == 27   then 
			local ret = CheckItemHasForge(item)
			if ret == 1   then 
				return 1
			end
		end
	end
	return 0 
end
function HasCleckLevel(role)
	local name = GetChaDefaultName(role)
	if ComplBoatLevel[name] ==nil   then 
		return 0 
	end
	return 1
end
function HasCleckSupply(role)
	local name = GetChaDefaultName(role)
	if ComplBoatSupply[name] ==nil   then 
		return 0 
	end
	return 1
end
function InitZXBY()
ZBID[1]="0764"	RoleType[1]="2"	ZBLV[1]="45"	RoleJob[1]="8"	ZBType[1]="22"	
ZBID[2]="0767"	RoleType[2]="3,1"	ZBLV[2]="45"	RoleJob[2]="9"	ZBType[2]="22"	
ZBID[3]="0778"	RoleType[3]="1,3"	ZBLV[3]="45"	RoleJob[3]="12"	ZBType[3]="22"	
ZBID[4]="0790"	RoleType[4]="3,4"	ZBLV[4]="45"	RoleJob[4]="13"	ZBType[4]="22"	
ZBID[5]="0796"	RoleType[5]="3,4"	ZBLV[5]="45"	RoleJob[5]="14"	ZBType[5]="22"	
ZBID[6]="0804"	RoleType[6]="1,3,4"	ZBLV[6]="45"	RoleJob[6]="16"	ZBType[6]="22"	
ZBID[7]="4641"	RoleType[7]="-1"	ZBLV[7]="45"	RoleJob[7]="-1"	ZBType[7]="26"	
ZBID[8]="4642"	RoleType[8]="-1"	ZBLV[8]="45"	RoleJob[8]="-1"	ZBType[8]="26"	
ZBID[9]="4643"	RoleType[9]="-1"	ZBLV[9]="45"	RoleJob[9]="-1"	ZBType[9]="26"	
ZBID[10]="4644"	RoleType[10]="-1"	ZBLV[10]="45"	RoleJob[10]="-1"	ZBType[10]="26"	
ZBID[11]="4645"	RoleType[11]="-1"	ZBLV[11]="45"	RoleJob[11]="-1"	ZBType[11]="26"	
ZBID[12]="4696"	RoleType[12]="-1"	ZBLV[12]="45"	RoleJob[12]="-1"	ZBType[12]="25"	
ZBID[13]="4697"	RoleType[13]="-1"	ZBLV[13]="45"	RoleJob[13]="-1"	ZBType[13]="25"	
ZBID[14]="4698"	RoleType[14]="-1"	ZBLV[14]="45"	RoleJob[14]="-1"	ZBType[14]="25"	
ZBID[15]="4699"	RoleType[15]="-1"	ZBLV[15]="45"	RoleJob[15]="-1"	ZBType[15]="25"	
ZBID[16]="0763"	RoleType[16]="1,2,3"	ZBLV[16]="35"	RoleJob[16]="1,8,9"	ZBType[16]="22"
ZBID[17]="0777"	RoleType[17]="1,3"	ZBLV[17]="35"	RoleJob[17]="2,12"	ZBType[17]="22"
ZBID[18]="0789"	RoleType[18]="3,4"	ZBLV[18]="35"	RoleJob[18]="5,13,14"	ZBType[18]="22"
ZBID[19]="0803"	RoleType[19]="1,3,4"	ZBLV[19]="35"	RoleJob[19]="4,16"	ZBType[19]="22"

ZBcount=19
end

function GiveZXBYRewards(role)
	local ZXBYid  = GetChaDefaultName ( role ) 
	if ValidCha(ZXBYpoint[ZXBYid]) == 0   then 
		return 0 
	end
	if ZXBYpoint[ZXBYid] >=60   then 
		TrigASBJY(role,1,40*60)	
	end
	if ZXBYpoint[ZXBYid] >=70   then
		GiveZhongXuePrize(role,45,26)
	end
	if ZXBYpoint[ZXBYid] >=80   then 
		GiveZhongXuePrize(role,45,25)
	end
	if ZXBYpoint[ZXBYid] <100 and ZXBYpoint[ZXBYid] >80   then
		GiveZhongXuePrize(role,35,22)
	elseif ZXBYpoint[ZXBYid] >=100   then 
		if CheckCha_Job(role) >=8   then 
			GiveZhongXuePrize(role,45,22)
		else
			GiveZhongXuePrize(role,35,22)
		end
	end
	return 1
end

function GiveZhongXuePrize(role,zblv,zbtype)
	local count,equip = SearchZBbyTable(role,InitZXBY,zblv,zbtype)
	if count > 0   then
		local i = math.random(1,count)
		GiveItem(role,0,equip[i],1,4)
	else 
		local name = GetChaDefaultName(role)
		CALCULATE_FUNCTIONS_LUA_000718 = GetResString("CALCULATE_FUNCTIONS_LUA_000718")
		CALCULATE_FUNCTIONS_LUA_000721 = GetResString("CALCULATE_FUNCTIONS_LUA_000721")
		LG("Search_err",CALCULATE_FUNCTIONS_LUA_000721,name,CALCULATE_FUNCTIONS_LUA_000718)
	end
end


function CheckZXBYPoint(role,ope,num)
	local ZXBYid  = GetChaDefaultName ( role ) 
	if ValidCha(ZXBYpoint[ZXBYid]) == 0   then 
		return 0 
	end
	if ope ==">"   then 
		if ZXBYpoint[ZXBYid] > num   then 
			return 1
		end
	elseif ope ==">="   then 
		if ZXBYpoint[ZXBYid] >= num   then 
			return 1
		end
	elseif ope =="=="   then 
		if ZXBYpoint[ZXBYid] == num   then 
			return 1
		end
	elseif ope =="~="   then 
		if ZXBYpoint[ZXBYid] ~= num   then 
			return 1
		end
	elseif ope =="<="   then 
		if ZXBYpoint[ZXBYid] <= num   then 
			return 1
		end
	elseif ope =="<"   then 
		if ZXBYpoint[ZXBYid] < num   then 
			return 1
		end
	else
		return 0 
	end
	return 0
end
function DelJingLing ( role , now_tick)
	local elf = GetChaItem ( role , 2 , 1  )
	if elf ~= nil   then
		local elfType = GetItemType ( elf )
		if elfType == 59   then
			local lv= GetElfLV(elf)
			if lv > JLMAXLV   then
				SetItemAttr ( elf , ITEMATTR_URE , 0 )
			end
		end
	end
end


function CheckJingLingLv ( role , Item_Traget)
		local str_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )		--����
		local con_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )		--����
		local agi_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )		--רע
		local dex_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )		--����
		local sta_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )		--����
		local lv_Traget = str_Traget + con_Traget + agi_Traget + dex_Traget + sta_Traget  ----һ������ĵȼ�
		if lv_Traget > JLMAXLV   then
			return 0
		else
			return 1
		
		end
end



function CheckJingLingLv1 ( role , Item_Traget)
		local str_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )		--����
		local con_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )		--����
		local agi_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )		--רע
		local dex_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )		--����
		local sta_Traget = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )		--����
		local lv_Traget = str_Traget + con_Traget + agi_Traget + dex_Traget + sta_Traget  ----һ������ĵȼ�
		if lv_Traget >= JLMAXLV   then
			return 0
		else
			return 1
		
		end
end

function InitNewState()
	NSTATE_JYCC=1---������ٲ���
	NSTATE_JYCZ=2---������ٳɳ�
	NSTATE_JYNOXH = 3     ---����û�ж�ʱ������
	
	NSTATEMAXCOUNT= 3
	NewState = {}
	NewStateLV={}
	NewStateTime={}
	NewStateExtra ={}
	NewStateStartTime={}
	for i = 1 ,NSTATEMAXCOUNT ,1 do 
		NewState[i] = {}
		NewStateLV[i]={}
		NewStateStartTime[i]={}
		NewStateTime[i]={}
		NewStateExtra[i] ={}
	end	
end
InitNewState()
function GetNowTimeW()
	local week=tonumber(os.date("%w"))
	local hour = tonumber(os.date("%H"))
	local minu = tonumber(os.date("%M"))
	local sec = tonumber(os.date("%S"))
	local timeW= ((week*24+hour)*60+minu)*60+sec
	return timeW
end
function  AddNewState(role,state,statelv,statetime,stateExtra)
	NewState[state][role]=1
	NewStateLV[state][role]=statelv
	NewStateStartTime[state][role]=GetNowTimeW()
	NewStateTime[state][role]=statetime
	NewStateExtra[state][role] =stateExtra
end
function GetNewStateLV(role,state,extra)
	if NewState[state][role]~= nil   then 
		local nowTime = GetNowTimeW()
		while nowTime<NewStateStartTime[state][role] do
			nowTime = nowTime+7*24*60*60
		end
		local pendTime = nowTime-NewStateStartTime[state][role]
		if pendTime>NewStateTime[state][role]   then 
			NewState[state][role]=nil
			return 0 
		else
			if NewStateExtra[state][role]~=nil   then 
				if NewStateExtra[state][role]~= extra   then 
					return 0
				end
			end
			return NewStateLV[state][role]
		end
	else
		return 0 
	end	
end 
function TakePetEndure( role , now_tick)			----6���ж�һ��
	local State_Gbhl = GetChaStateLv ( role, STATE_Gbhl )
	local State_Lbhl = GetChaStateLv ( role, STATE_Lbhl )
	local State_Lbhl = GetChaStateLv ( role, STATE_BHLHP )
	if State_Gbhl ~= 0   then
		return
	end
	if State_Lbhl ~= 0   then
		return
	end
	if State_Lbhl == 10   then
		return
	end
	local Item = GetChaItem ( role , 2 , 3 )
	local Item_type = GetItemType(Item)
	local Item_ID = GetItemID ( Item )
	if Item_type == 77   then
		local Item_ure = GetItemAttr( Item ,ITEMATTR_URE )       --����
		if Item_ure > 0   then
			Num = Item_ure - 5
			SetItemAttr ( Item , ITEMATTR_URE , Num )
		elseif Item_ure <= 0   then
			local ItemName = GetItemName ( Item_ID ) 
			RemoveChaItem( role , Item_ID , 0 , 2 , 3 , 2 , 1 )	
			CALCULATE_FUNCTIONS_LUA_000722 = GetResString("CALCULATE_FUNCTIONS_LUA_000722")
			SystemNotice (role,ItemName..CALCULATE_FUNCTIONS_LUA_000722)
		end
	else
		return
	end
end 
function begin_AttrReSet_item(...)
	local arg = {...}
--	Notice("��ʼ�ж�")
	if #arg ~= 12 then
--		Notice("���������Ƿ�"..#arg)
		return 0
	end
	local ret = CanAttrReSet(arg)
	if ret == 0   then 
		return 0 
	elseif ret == 1   then  
		AttrReSet(arg)
	elseif ret == 2   then 
		AttrReturn(arg)
	end
end
function AttrReturn(arg)
	local role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( arg )
	local name = GetChaDefaultName(role)
	CALCULATE_FUNCTIONS_LUA_000723 = GetResString("CALCULATE_FUNCTIONS_LUA_000723")
	LG("attrreset","-------------"..name..CALCULATE_FUNCTIONS_LUA_000723)
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]
	local Item1 = GetChaItem ( role , 2 , BagItem1 )			--ȡ����ָ��
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	local ItemID1 = GetItemID ( Item1 )					--ȡ���߱��
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )
	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )
	local ItemType3 = GetItemType ( Item3 )
	local itemLV=GetItemAttr(Item3,ITEMATTR_VAL_LEVEL)
	local ure =GetItemAttr(Item2,ITEMATTR_URE)
	FusionItem(Item2,Item3)
	CALCULATE_FUNCTIONS_LUA_000724 = GetResString("CALCULATE_FUNCTIONS_LUA_000724")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000724)
	SetItemAttr(Item2,ITEMATTR_URE,ure)
	if itemLV~=0   then
		SetItemAttr(Item2,ITEMATTR_VAL_LEVEL,itemLV)
		CALCULATE_FUNCTIONS_LUA_000725 = GetResString("CALCULATE_FUNCTIONS_LUA_000725")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000725..itemLV)
	end
	local i= 0 
	for i=1,47,1 do
	    local item3attr=GetItemAttr ( Item3 , i )
		local item2attr=GetItemAttr ( Item2 , i )
		if item2attr~=  item3attr   then 
			SetItemAttr(Item2,i,item3attr)
			CALCULATE_FUNCTIONS_LUA_000726 = GetResString("CALCULATE_FUNCTIONS_LUA_000726")
			CALCULATE_FUNCTIONS_LUA_000727 = GetResString("CALCULATE_FUNCTIONS_LUA_000727")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000727..STAR_ATTR[i]..CALCULATE_FUNCTIONS_LUA_000726..item3attr)
		end
	end
	SynChaKitbag(role,13)
	CALCULATE_FUNCTIONS_LUA_000728 = GetResString("CALCULATE_FUNCTIONS_LUA_000728")
	SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000728)
	RemoveChaItem(role,ItemID3,1,2,BagItem3,2,1)
	Take_ElfURE ( role , Item1 , 2 , 2500 )
	local Money_Need = getitem_attrreset_money(arg)
	TakeMoney(role,nil,Money_Need)
	CALCULATE_FUNCTIONS_LUA_000729 = GetResString("CALCULATE_FUNCTIONS_LUA_000729")
	HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000729)
end
function AttrReSet(arg)
	local role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( arg )
	local name = GetChaDefaultName(role)
	CALCULATE_FUNCTIONS_LUA_000730 = GetResString("CALCULATE_FUNCTIONS_LUA_000730")
	LG("attrreset","-------------"..name..CALCULATE_FUNCTIONS_LUA_000730)
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]
	local Item1 = GetChaItem ( role , 2 , BagItem1 )			--ȡ����ָ��
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	local ItemID1 = GetItemID ( Item1 )					--ȡ���߱��
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )
	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )
	local ItemType3 = GetItemType ( Item3 )
	CALCULATE_FUNCTIONS_LUA_000731 = GetResString("CALCULATE_FUNCTIONS_LUA_000731")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000731)
	RemoveChaItem(role,ItemID3,1,2,BagItem3,2,1)
	CALCULATE_FUNCTIONS_LUA_000732 = GetResString("CALCULATE_FUNCTIONS_LUA_000732")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000732)
	local r1,r2 = MakeItem(role,6869,1,4)
	local stone = GetChaItem(role,2,r2)
	local isCZ= IsCoolEquip(Item2)
	CALCULATE_FUNCTIONS_LUA_000733 = GetResString("CALCULATE_FUNCTIONS_LUA_000733")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000733)
	local attrID = ItemID2
	local forgeMes = GetItemForgeParam(Item2,1)
	local ure=GetItemAttr ( Item2 , ITEMATTR_URE )
	CALCULATE_FUNCTIONS_LUA_000734 = GetResString("CALCULATE_FUNCTIONS_LUA_000734")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000734..forgeMes)
	local itemlv = GetItemAttr ( Item2 , ITEMATTR_VAL_LEVEL )
	CALCULATE_FUNCTIONS_LUA_000735 = GetResString("CALCULATE_FUNCTIONS_LUA_000735")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000735..itemlv)	
	if isCZ==1   then
		CALCULATE_FUNCTIONS_LUA_000736 = GetResString("CALCULATE_FUNCTIONS_LUA_000736")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000736)
		attrID = GetItemAttr(Item2,ITEMATTR_VAL_FUSIONID)
		CALCULATE_FUNCTIONS_LUA_000737 = GetResString("CALCULATE_FUNCTIONS_LUA_000737")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000737..attrID)
		SetItemAttr( stone , ITEMATTR_VAL_FUSIONID, attrID)
		CALCULATE_FUNCTIONS_LUA_000738 = GetResString("CALCULATE_FUNCTIONS_LUA_000738")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000738..attrID)
		FusionItem(stone,Item2)
		CALCULATE_FUNCTIONS_LUA_000739 = GetResString("CALCULATE_FUNCTIONS_LUA_000739")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000739)
		SetItemAttr( stone , ITEMATTR_VAL_LEVEL, itemlv)
		CALCULATE_FUNCTIONS_LUA_000740 = GetResString("CALCULATE_FUNCTIONS_LUA_000740")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000740.. 25000)
		SetItemAttr ( stone , ITEMATTR_URE , ItemID2 )
		CALCULATE_FUNCTIONS_LUA_000741 = GetResString("CALCULATE_FUNCTIONS_LUA_000741")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000741..itemlv)
		SetItemAttr ( stone , ITEMATTR_MAXURE , ItemID2 )
	else
		CALCULATE_FUNCTIONS_LUA_000742 = GetResString("CALCULATE_FUNCTIONS_LUA_000742")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000742)
		SetItemAttr( stone , ITEMATTR_VAL_FUSIONID, ItemID2)
		CALCULATE_FUNCTIONS_LUA_000738 = GetResString("CALCULATE_FUNCTIONS_LUA_000738")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000738..ItemID2)
		FusionItem(stone,Item2)
		local maxUre=GetItemAttr ( Item2 , ITEMATTR_MAXURE )
		SetItemAttr ( stone , ITEMATTR_URE , ure )
		CALCULATE_FUNCTIONS_LUA_000743 = GetResString("CALCULATE_FUNCTIONS_LUA_000743")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000743.. maxUre)
		SetItemAttr ( stone , ITEMATTR_MAXURE , maxUre )
		CALCULATE_FUNCTIONS_LUA_000740 = GetResString("CALCULATE_FUNCTIONS_LUA_000740")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000740.. maxUre)
	end
	SynChaKitbag(role,13)
	local num={}
	local numAttr={}
	local b = 0
	local a = {}
	for b=1,5,1 do
		num [b]=0
		numAttr [b]=0
	end
	b = 0
	for i=1,47,1 do
	    a [i]=GetItemAttr ( Item2 , i )
		if a [i]~=0   then
			b = b + 1
			num [b]=i
			numAttr [b]=a[i]
		end
	end
	CALCULATE_FUNCTIONS_LUA_000744 = GetResString("CALCULATE_FUNCTIONS_LUA_000744")
	CALCULATE_FUNCTIONS_LUA_000745 = GetResString("CALCULATE_FUNCTIONS_LUA_000745")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000745,STAR_ATTR[num [1]],STAR_ATTR[num [2]],STAR_ATTR[num [3]],STAR_ATTR[num [4]],STAR_ATTR[num [5]],CALCULATE_FUNCTIONS_LUA_000744,numAttr[1],numAttr[2],numAttr[3],numAttr[4],numAttr[5])
	SetItemForgeParam( stone , 1 , forgeMes )
	CALCULATE_FUNCTIONS_LUA_000746 = GetResString("CALCULATE_FUNCTIONS_LUA_000746")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000746..forgeMes)
	RemoveChaItem(role,ItemID2,1,2,BagItem2,2,1)
	CALCULATE_FUNCTIONS_LUA_000747 = GetResString("CALCULATE_FUNCTIONS_LUA_000747")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000747)
	local r3,r4 = MakeItem(role,attrID,1,ATTRRESET) 
	CALCULATE_FUNCTIONS_LUA_000748 = GetResString("CALCULATE_FUNCTIONS_LUA_000748")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000748..attrID)
	local newItem = GetChaItem(role,2,r4)
	local qua = GetItemAttr(newItem,ITEMATTR_MAXENERGY)
	Notice(qua)
	if qua>=5000 and qua<7000   then
		CALCULATE_FUNCTIONS_LUA_000749 = GetResString("CALCULATE_FUNCTIONS_LUA_000749")
		CALCULATE_FUNCTIONS_LUA_000750 = GetResString("CALCULATE_FUNCTIONS_LUA_000750")
		ScrollNotice(GetChaDefaultName ( role )..CALCULATE_FUNCTIONS_LUA_000750..GetItemName(attrID)..CALCULATE_FUNCTIONS_LUA_000749,1)
	end
	for b = 1,5,1 do 
		SetItemAttr(stone,num [b],numAttr [b])
	end
	if isCZ==1   then
		CALCULATE_FUNCTIONS_LUA_000751 = GetResString("CALCULATE_FUNCTIONS_LUA_000751")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000751)
		local r5,r6 = MakeItem(role,ItemID2,1,4)
		CALCULATE_FUNCTIONS_LUA_000752 = GetResString("CALCULATE_FUNCTIONS_LUA_000752")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000752..ItemID2)
		local newCool= GetChaItem(role,2,r6)
		SetItemAttr( newCool , ITEMATTR_VAL_FUSIONID, attrID)
		CALCULATE_FUNCTIONS_LUA_000753 = GetResString("CALCULATE_FUNCTIONS_LUA_000753")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000753..attrID)
		FusionItem(newCool,newItem)
		CALCULATE_FUNCTIONS_LUA_000739 = GetResString("CALCULATE_FUNCTIONS_LUA_000739")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000739)
		SetItemAttr( newCool , ITEMATTR_VAL_LEVEL, itemlv)
		CALCULATE_FUNCTIONS_LUA_000754 = GetResString("CALCULATE_FUNCTIONS_LUA_000754")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000754..itemlv)
		SetItemAttr ( newCool , ITEMATTR_MAXURE , 25000 )
		CALCULATE_FUNCTIONS_LUA_000755 = GetResString("CALCULATE_FUNCTIONS_LUA_000755")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000755.. 25000)
		SetItemAttr ( newCool , ITEMATTR_URE , ure )
		for b=1,5,1 do
			num [b]=0
			numAttr [b]=0
		end
		b = 0
		for i=1,47,1 do
			a [i]=GetItemAttr ( newItem , i )
			if a [i]~=0   then
				b = b + 1
				num [b]=i
				numAttr [b]=a[i]
			end
		end
		for b = 1,5,1 do 
			SetItemAttr(newCool,num [b],numAttr [b])
		end
		CALCULATE_FUNCTIONS_LUA_000744 = GetResString("CALCULATE_FUNCTIONS_LUA_000744")
		CALCULATE_FUNCTIONS_LUA_000745 = GetResString("CALCULATE_FUNCTIONS_LUA_000745")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000745,STAR_ATTR[num [1]],STAR_ATTR[num [2]],STAR_ATTR[num [3]],STAR_ATTR[num [4]],STAR_ATTR[num [5]],CALCULATE_FUNCTIONS_LUA_000744,numAttr[1],numAttr[2],numAttr[3],numAttr[4],numAttr[5])
		newItem = newCool
		RemoveChaItem(role,ItemID2,1,2,r4 ,2,1)
		CALCULATE_FUNCTIONS_LUA_000747 = GetResString("CALCULATE_FUNCTIONS_LUA_000747")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000747)
	end
	SetItemForgeParam( newItem , 1 , forgeMes )
	CALCULATE_FUNCTIONS_LUA_000756 = GetResString("CALCULATE_FUNCTIONS_LUA_000756")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000756..forgeMes)
	SetItemAttr ( newItem , ITEMATTR_URE , ure )
	CALCULATE_FUNCTIONS_LUA_000757 = GetResString("CALCULATE_FUNCTIONS_LUA_000757")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000757..ure)
	Take_ElfURE ( role , Item1 , 2 , 50 )
	CALCULATE_FUNCTIONS_LUA_000758 = GetResString("CALCULATE_FUNCTIONS_LUA_000758")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000758)
	CALCULATE_FUNCTIONS_LUA_000759 = GetResString("CALCULATE_FUNCTIONS_LUA_000759")
	LG("attrreset",CALCULATE_FUNCTIONS_LUA_000759)
	local Money_Need = getitem_attrreset_money(arg)
	TakeMoney(role,nil,Money_Need)
	CALCULATE_FUNCTIONS_LUA_000760 = GetResString("CALCULATE_FUNCTIONS_LUA_000760")
	HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000760)
	
end
function can_AttrReSet_item(...)
	local arg = {...}
--	Notice("��ʼ�ж�")
	if #arg ~= 12 then
--		Notice("���������Ƿ�"..#arg)
		return 0
	end
	local ret = CanAttrReSet(arg)
	if ret == 0   then 
		return 0 
	else
		return 1
	end
end 
function CanAttrReSet(arg)
	local role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( arg )
	local name = GetChaDefaultName(role)
	CALCULATE_FUNCTIONS_LUA_000761 = GetResString("CALCULATE_FUNCTIONS_LUA_000761")
	LG("attrreset","-------------"..name..CALCULATE_FUNCTIONS_LUA_000761)
	local i = 0
	for i = 0 , 2 , 1 do							--�жϵ��߶�������͵��߸����Ƿ�ͷ�
		if ItemBagCount[i] ~= 1 or ItemCount[i] ~= 1   then
			CALCULATE_FORGE_LUA_000001 = GetResString("CALCULATE_FORGE_LUA_000001")
			SystemNotice( role , CALCULATE_FORGE_LUA_000001)
			CALCULATE_FUNCTIONS_LUA_000762 = GetResString("CALCULATE_FUNCTIONS_LUA_000762")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000762)
			CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
			return 0
		end
	end
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]
	local Item1 = GetChaItem ( role , 2 , BagItem1 )			--ȡ����ָ��
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	local ItemID1 = GetItemID ( Item1 )					--ȡ���߱��
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )
	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )
	local ItemType3 = GetItemType ( Item3 )
	local bagNum = GetChaFreeBagGridNum (role)
	local god = GetChaAttr(role,ATTR_GD)
	local Money_Need = getitem_attrreset_money(arg)
	if god<Money_Need   then 
		CALCULATE_FUNCTIONS_LUA_000764 = GetResString("CALCULATE_FUNCTIONS_LUA_000764")
		CALCULATE_FUNCTIONS_LUA_000765 = GetResString("CALCULATE_FUNCTIONS_LUA_000765")
		HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000765..Money_Need..CALCULATE_FUNCTIONS_LUA_000764)
		CALCULATE_FUNCTIONS_LUA_000766 = GetResString("CALCULATE_FUNCTIONS_LUA_000766")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000766)
		CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
		return 0
	end
	if bagNum<1   then 
		CALCULATE_FUNCTIONS_LUA_000767 = GetResString("CALCULATE_FUNCTIONS_LUA_000767")
		HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000767)
		CALCULATE_FUNCTIONS_LUA_000768 = GetResString("CALCULATE_FUNCTIONS_LUA_000768")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000768)
		CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
		return 0
	end
	if ItemType1 ~=59    then					--�жϾ����Ƿ���ȷ
		CALCULATE_FUNCTIONS_LUA_000769 = GetResString("CALCULATE_FUNCTIONS_LUA_000769")
		HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000769)
		CALCULATE_FUNCTIONS_LUA_000768 = GetResString("CALCULATE_FUNCTIONS_LUA_000768")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000768)
		CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
		return 0
	end
	local equipType={1,2,3,4,7,9,11,20,22,23,24,27}
	if ItemType2 > 27 or IsInITable(ItemType2, equipType)==0   then			--�ж��Ƿ��Ǳ�ʯ
		CALCULATE_FUNCTIONS_LUA_000770 = GetResString("CALCULATE_FUNCTIONS_LUA_000770")
		HelpInfo( role ,0, CALCULATE_FUNCTIONS_LUA_000770)
		CALCULATE_FUNCTIONS_LUA_000771 = GetResString("CALCULATE_FUNCTIONS_LUA_000771")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000771)
		CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
		return 0
	end
	if ItemType3 ~=80   then							--�ж�������ʯ�Ƿ�ͬ��
		CALCULATE_FUNCTIONS_LUA_000772 = GetResString("CALCULATE_FUNCTIONS_LUA_000772")
		HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000772)
		return 0
	end
	local elfUre= GetItemAttr(Item1,ITEMATTR_URE)
	if ItemID3 == 6868   then 
		CALCULATE_FUNCTIONS_LUA_000773 = GetResString("CALCULATE_FUNCTIONS_LUA_000773")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000773)
		if elfUre< 50   then 
			CALCULATE_FUNCTIONS_LUA_000774 = GetResString("CALCULATE_FUNCTIONS_LUA_000774")
			HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000774)
			CALCULATE_FUNCTIONS_LUA_000775 = GetResString("CALCULATE_FUNCTIONS_LUA_000775")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000775)
			CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
			return 0 
		end
		local isCZ= IsCoolEquip(Item2)
		if isCZ==1    then 
			local attrID= GetItemAttr( Item2, ITEMATTR_VAL_FUSIONID )
			if attrID == 0   then 
				CALCULATE_FUNCTIONS_LUA_000776 = GetResString("CALCULATE_FUNCTIONS_LUA_000776")
				HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000776)
				CALCULATE_FUNCTIONS_LUA_000777 = GetResString("CALCULATE_FUNCTIONS_LUA_000777")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000777)
				CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
				return 0
			end
		end
		CALCULATE_FUNCTIONS_LUA_000778 = GetResString("CALCULATE_FUNCTIONS_LUA_000778")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000778)
		return 1
	elseif ItemID3 == 6869   then
		CALCULATE_FUNCTIONS_LUA_000779 = GetResString("CALCULATE_FUNCTIONS_LUA_000779")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000779)
		if elfUre< 2500   then 
			CALCULATE_FUNCTIONS_LUA_000780 = GetResString("CALCULATE_FUNCTIONS_LUA_000780")
			HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000780)
			CALCULATE_FUNCTIONS_LUA_000781 = GetResString("CALCULATE_FUNCTIONS_LUA_000781")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000781)
			CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
			return 0 
		end
		local stForge = GetItemForgeParam(Item3,1)
		local zbForge = GetItemForgeParam(Item2,1)
		if stForge~= zbForge   then 
			CALCULATE_FUNCTIONS_LUA_000782 = GetResString("CALCULATE_FUNCTIONS_LUA_000782")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000782)
			CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
			CALCULATE_FUNCTIONS_LUA_000783 = GetResString("CALCULATE_FUNCTIONS_LUA_000783")
			HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000783)
			return 0 
		end
		local ure = GetItemAttr(Item3,ITEMATTR_URE)
		local  maxUre = GetItemAttr(Item3,ITEMATTR_MAXURE)
		local needID = GetItemAttr( Item3 , ITEMATTR_VAL_FUSIONID )
		local isCZ= IsCoolEquip(Item2)
		if isCZ==1    then 
			CALCULATE_FUNCTIONS_LUA_000784 = GetResString("CALCULATE_FUNCTIONS_LUA_000784")
			LG("attrreset",CALCULATE_FUNCTIONS_LUA_000784)
			local attrID= GetItemAttr( Item2, ITEMATTR_VAL_FUSIONID )
			if attrID == 0   then 
				CALCULATE_FUNCTIONS_LUA_000785 = GetResString("CALCULATE_FUNCTIONS_LUA_000785")
				HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000785)
				CALCULATE_FUNCTIONS_LUA_000777 = GetResString("CALCULATE_FUNCTIONS_LUA_000777")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000777)
				CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
				return 0
			end
			if ure~=ItemID2   then 
				CALCULATE_FUNCTIONS_LUA_000786 = GetResString("CALCULATE_FUNCTIONS_LUA_000786")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000786)
				CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
				CALCULATE_FUNCTIONS_LUA_000787 = GetResString("CALCULATE_FUNCTIONS_LUA_000787")
				HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000787)
				return 0
			end
			if needID ~= attrID   then 
				CALCULATE_FUNCTIONS_LUA_000788 = GetResString("CALCULATE_FUNCTIONS_LUA_000788")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000788)
				CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
				CALCULATE_FUNCTIONS_LUA_000789 = GetResString("CALCULATE_FUNCTIONS_LUA_000789")
				HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000789)
				return 0 
			end
		else
			if needID~= ItemID2   then 
				CALCULATE_FUNCTIONS_LUA_000790 = GetResString("CALCULATE_FUNCTIONS_LUA_000790")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000790)
				CALCULATE_FUNCTIONS_LUA_000763 = GetResString("CALCULATE_FUNCTIONS_LUA_000763")
				LG("attrreset",CALCULATE_FUNCTIONS_LUA_000763)
				CALCULATE_FUNCTIONS_LUA_000791 = GetResString("CALCULATE_FUNCTIONS_LUA_000791")
				HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000791)
				return 0 
			end
		end
		CALCULATE_FUNCTIONS_LUA_000792 = GetResString("CALCULATE_FUNCTIONS_LUA_000792")
		LG("attrreset",CALCULATE_FUNCTIONS_LUA_000792)
		return 2
	end
end
function IsCoolEquip(item)
	local maxUre = GetItemAttr(item,ITEMATTR_MAXURE)
	if maxUre== 25000   then 
		return 1
	else
		return 0
	end
end
function IsInITable(value, tbl)
	for k,v in ipairs(tbl) do
	   if v == value   then
		return k;
	   end
	end
	return 0;
end
function IsInTables(value, tbl)
	for k,v in pairs(tbl) do
	   if v == value   then
		return k;
	   end
	end
	return 0;
end
function GetElfUre(role)
	local item =GetChaItem(role,2,1)
	if item == nil   then 
		return 0
	end
	local itemType = GetItemType(item)
	if itemType ~= 59   then 
		return 0 
	end
	local ure = GetItemAttr(item,ITEMATTR_URE)
	return ure
end
delReStone={}
function DelReturnStone(role,now_tick)
	local returnStone = CheckBagItem(role,6869)
	if returnStone>0   then 
		local elfUre = GetElfUre(role)	
		if elfUre <=49   then 
			if delReStone[role]==nil   then 
				delReStone[role] =1 
				CALCULATE_FUNCTIONS_LUA_000793 = GetResString("CALCULATE_FUNCTIONS_LUA_000793")
				HelpInfo(role,0,CALCULATE_FUNCTIONS_LUA_000793)
			else
				CALCULATE_FUNCTIONS_LUA_000794 = GetResString("CALCULATE_FUNCTIONS_LUA_000794")
				SystemNotice(role,CALCULATE_FUNCTIONS_LUA_000794)
				RemoveChaItem(role,6869,1,2,-1,2,1)
			end
		else
			delReStone[role]=nil
		end
	end
end
function get_item_attrreset_money(...)
	local moneyNeed = getitem_attrreset_money(arg)
	return moneyNeed
end
function getitem_attrreset_money(arg)
	return 10000
end
function CanZTLCharge(role,npc)
	local now_day= os.date("%d")
	local now_month= os.date("%m")
	local now_month_num= tonumber(now_month)		-------------��     
	local now_day_num = tonumber(now_day)	
	local All_Day = JNSTime_Flag[now_month_num] + now_day_num
	local Cha_Day = GetChaAttr (role , ATTR_EXTEND4)
	local Cha_Time = GetChaAttr (role , ATTR_EXTEND3)
	local bagNum = GetChaFreeBagGridNum (role)
	if bagNum<1   then 
		CALCULATE_FUNCTIONS_LUA_000795 = GetResString("CALCULATE_FUNCTIONS_LUA_000795")
		HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000795)
		return 0
	end
	if Cha_Day ~= All_Day or Cha_Time < 5   then
		CALCULATE_FUNCTIONS_LUA_000796 = GetResString("CALCULATE_FUNCTIONS_LUA_000796")
		HelpInfo(role,0,CALCULATE_FUNCTIONS_LUA_000796)
		return LUA_FALSE
	else
		local ztlNum = CheckBagItem(role,6889)
		local needNum = Cha_Time-3
		if ztlNum< needNum   then 
			CALCULATE_FUNCTIONS_LUA_000797 = GetResString("CALCULATE_FUNCTIONS_LUA_000797")
			CALCULATE_FUNCTIONS_LUA_000798 = GetResString("CALCULATE_FUNCTIONS_LUA_000798")
			CALCULATE_FUNCTIONS_LUA_000799 = GetResString("CALCULATE_FUNCTIONS_LUA_000799")
			HelpInfo(role,0,CALCULATE_FUNCTIONS_LUA_000799..(Cha_Time-5)..CALCULATE_FUNCTIONS_LUA_000798..needNum..CALCULATE_FUNCTIONS_LUA_000797)
			return LUA_FALSE
		else
			return LUA_TRUE
		end
	end 
end
function ZTLCharge(role,npc)
	local now_day= os.date("%d")
	local now_month= os.date("%m")
	local now_month_num= tonumber(now_month)		-------------��     
	local now_day_num = tonumber(now_day)	
	local All_Day = JNSTime_Flag[now_month_num] + now_day_num
	local Cha_Day = GetChaAttr (role , ATTR_EXTEND4)
	local Cha_Time = GetChaAttr (role , ATTR_EXTEND3)
	DelBagItem(role,6889,Cha_Time-3)
	GiveItem(role,0,6341,1,4)
	SetChaAttr(role , ATTR_EXTEND3,Cha_Time+1)
	return LUA_TRUE
end
function CanBuyZTL(role,npc)
	local bagNum = GetChaFreeBagGridNum (role)
	if bagNum<1   then 
		CALCULATE_FUNCTIONS_LUA_000800 = GetResString("CALCULATE_FUNCTIONS_LUA_000800")
		HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000800)
		return 0
	end
	local god =GetChaAttr(role,ATTR_GD)
	if god<ZTLprice+ZTLChange()   then 
		CALCULATE_FUNCTIONS_LUA_000801 = GetResString("CALCULATE_FUNCTIONS_LUA_000801")
		CALCULATE_FUNCTIONS_LUA_000802 = GetResString("CALCULATE_FUNCTIONS_LUA_000802")
		HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000802..ZTLprice+ZTLChange()..CALCULATE_FUNCTIONS_LUA_000801)
		return 0
	end
	if tempZTLPrice[name] ~= nil   then 
		if tempZTLPrice[name]~=ZTLprice+ZTLChange()   then 
			CALCULATE_FUNCTIONS_LUA_000803 = GetResString("CALCULATE_FUNCTIONS_LUA_000803")
			CALCULATE_FUNCTIONS_LUA_000802 = GetResString("CALCULATE_FUNCTIONS_LUA_000802")
			HelpInfo( role ,0,CALCULATE_FUNCTIONS_LUA_000802..ZTLprice+ZTLChange()..CALCULATE_FUNCTIONS_LUA_000803)
			return 0
		end
	end
	return 1
end
function BuyZTL(role,npc)
	local god =GetChaAttr(role,ATTR_GD)
	local ret =ZTLprice+ZTLChange()
	if ret>god   then 
		TakeMoney(role,nil,god)
		CALCULATE_FUNCTIONS_LUA_000804 = GetResString("CALCULATE_FUNCTIONS_LUA_000804")
		CALCULATE_FUNCTIONS_LUA_000805 = GetResString("CALCULATE_FUNCTIONS_LUA_000805")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000805..god..CALCULATE_FUNCTIONS_LUA_000804)
	else
		TakeMoney(role,nil,ret)
		CALCULATE_FUNCTIONS_LUA_000804 = GetResString("CALCULATE_FUNCTIONS_LUA_000804")
		CALCULATE_FUNCTIONS_LUA_000805 = GetResString("CALCULATE_FUNCTIONS_LUA_000805")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000805..ret..CALCULATE_FUNCTIONS_LUA_000804)
	end
	local name = GetChaDefaultName(role)
	ZTLBuyList[name] = ret
	ZTLprice = ret
	GiveItem(role,0,6889,1,4)
	CALCULATE_FUNCTIONS_LUA_000806 = GetResString("CALCULATE_FUNCTIONS_LUA_000806")
	Notice(name..CALCULATE_FUNCTIONS_LUA_000806..ZTLprice+ZTLChange())
	CALCULATE_FUNCTIONS_LUA_000807 = GetResString("CALCULATE_FUNCTIONS_LUA_000807")
	CALCULATE_FUNCTIONS_LUA_000808 = GetResString("CALCULATE_FUNCTIONS_LUA_000808")
	LG("ZTLLOG",name..CALCULATE_FUNCTIONS_LUA_000808..ret..CALCULATE_FUNCTIONS_LUA_000807)
	return 1
end
function GetZTLCharge(role)
	local now_day= os.date("%d")
	local now_month= os.date("%m")
	local now_month_num= tonumber(now_month)		-------------��     
	local now_day_num = tonumber(now_day)	
	local All_Day = JNSTime_Flag[now_month_num] + now_day_num
	local Cha_Day = GetChaAttr (role , ATTR_EXTEND4)
	local Cha_Time = GetChaAttr (role , ATTR_EXTEND3)
	if Cha_Day ~= All_Day or Cha_Time < 5   then
		CALCULATE_FUNCTIONS_LUA_000809 = GetResString("CALCULATE_FUNCTIONS_LUA_000809")
		return CALCULATE_FUNCTIONS_LUA_000809
	else
		CALCULATE_FUNCTIONS_LUA_000810 = GetResString("CALCULATE_FUNCTIONS_LUA_000810")
		CALCULATE_FUNCTIONS_LUA_000811 = GetResString("CALCULATE_FUNCTIONS_LUA_000811")
		return CALCULATE_FUNCTIONS_LUA_000811..(Cha_Time-3)..CALCULATE_FUNCTIONS_LUA_000810
	end 
end
function ZTLBalance()
	local nowTime = GetNowTimeW()
	if math.fmod(nowTime,600)<5   then 
		local i,v
		local n = 0 
		local x = 0 
		for i,v in pairs(ZTLBuyList) do 
			n=n+1
			x = x +v 	
		end
		if n~=0   then 
			ZTLBprice = math.floor(ZTLBprice*0.25+x/n*0.75)
			ZTLBuyList=nil
			ZTLBuyList={}
		else
			ZTLprice = math.floor(ZTLprice*0.9) 
			ZTLBprice = math.floor(ZTLBprice*0.75+ZTLprice*0.25)
		end
		CALCULATE_FUNCTIONS_LUA_000812 = GetResString("CALCULATE_FUNCTIONS_LUA_000812")
		Notice(CALCULATE_FUNCTIONS_LUA_000812..ZTLprice+ZTLChange())
	end
end

function ZTLChange()
	local per = 2
	if ZTLBprice<1   then 
			ZTLBprice = 1 
		end 
	if ZTLprice<1   then 
		ZTLprice = 1 
	end 
	if ZTLprice>=  ZTLBprice   then 	
		per = math.log(ZTLprice/ZTLBprice)/math.log(2)
	elseif 	ZTLprice<  ZTLBprice   then 
		per = math.log(ZTLBprice/ZTLprice)/math.log(2)
	end
	if per >2   then 
		per =2
	end
	return math.floor(ZTLcChanged*math.pow(ZTLRaise,per))
end

function GetZTLMessage(role)
	local price = (ZTLprice+ZTLChange())
	local name = GetChaDefaultName(role)
	tempZTLPrice[name] = price
	if price >=10000   then 
		local a = math.floor(price/10000)
		local b = math.fmod (price,10000)
		CALCULATE_FUNCTIONS_LUA_000813 = GetResString("CALCULATE_FUNCTIONS_LUA_000813")
		price = a..CALCULATE_FUNCTIONS_LUA_000813.. b
	end
	CALCULATE_FUNCTIONS_LUA_000814 = GetResString("CALCULATE_FUNCTIONS_LUA_000814")
	CALCULATE_FUNCTIONS_LUA_000815 = GetResString("CALCULATE_FUNCTIONS_LUA_000815")
	return CALCULATE_FUNCTIONS_LUA_000815..price..CALCULATE_FUNCTIONS_LUA_000814
end
function GetNPCLoc(name)
	if AutoNpc[name]==nil   then 
		return "","",""
	else
		return AutoNpc[name][1],AutoNpc[name][2], AutoNpc[name][3] 
	end
end
function GetMonLoc(name)
	if AutoMon[name]==nil   then 
		return "","",""
	else
		return AutoMon[name][1],AutoMon[name][2],AutoMon[name][3] 
	end
end
function GetItemLoc(name)
	if AutoItem[name]==nil   then 
		return "","","","",""
	else
		return AutoItem[name][1],AutoItem[name][2],AutoItem[name][3] ,AutoItem[name][4],AutoItem[name][5]
	end
end
function GetMapEbyC( mapCName )
	local i = 1
	for i = 1, MapList.count,1 do 
		if MapList.mapname[i] == mapCName   then 
			return MapList.idname[i]
		end
	end
	CALCULATE_FUNCTIONS_LUA_000816 = GetResString("CALCULATE_FUNCTIONS_LUA_000816")
	LG("mapName","mapCName=="..mapCName..CALCULATE_FUNCTIONS_LUA_000816)
	return ""
end
function GetMapID(mapCName)	
	local i = 1
	for i = 1, MapList.count,1 do 
		if MapList.mapname[i] == mapCName   then 
			return i
		end
	end
	CALCULATE_FUNCTIONS_LUA_000816 = GetResString("CALCULATE_FUNCTIONS_LUA_000816")
	LG("mapName","mapCName=="..mapCName..CALCULATE_FUNCTIONS_LUA_000816)
	return ""
end
function GetMapCbyE( mapEName )
	local i = 1
	for i = 1, MapList.count,1 do 
		if MapList.idname[i] == mapEName   then 
			return MapList.mapname[i]
		end
	end
	CALCULATE_FUNCTIONS_LUA_000816 = GetResString("CALCULATE_FUNCTIONS_LUA_000816")
	LG("mapName","mapEName=="..mapEName..CALCULATE_FUNCTIONS_LUA_000816)
	return ""
end
function GetAutoFind (name )
	local autoFindX,autoFindY,autoFindMap=GetNPCLoc(name)
	if autoFindX~="" and autoFindY~="" and  autoFindMap~=""   then 
		return "<j"..autoFindMap.."("..autoFindX..","..autoFindY..")>"
	end
	autoFindX,autoFindY,autoFindMap=GetMonLoc(name)
	if autoFindX~="" and autoFindY~="" and  autoFindMap~=""   then 
		return "<j"..autoFindMap.."("..autoFindX..","..autoFindY..")>"
	end
	local npc=""
	local mon=""
	autoFindX,autoFindY,autoFindMap,npc,mon=GetItemLoc(name)
	if autoFindX~="" and autoFindY~="" and  autoFindMap~=""   then 
		if npc == ""   then 
			return "<j"..autoFindMap.."("..autoFindX..","..autoFindY..")>"
		else
			return "<j"..npc.."("..autoFindX..","..autoFindY..")>"
		end
	end
	return ""
end
function SendbyRandLoc(role,missID)
	MoveTo(role,randMissingLocX,randMissingLocY,GetMapEbyC(GetMap(randMissingLocMap )))
	randMissingLocX,randMissingLocY,randMissingLocMap=0,0,0
	return 1
end


---�ٱ�ƺ�����������

function BBXLcheck(role)
	local Item_BBXL =  GetChaItem(role, 1, 5)
	local Itemid_BBXL = GetItemID(Item_BBXL)
	local ItemEngry_BBXL1 = GetItemAttr(Item_BBXL,ITEMATTR_ENERGY)
	if Itemid_BBXL ==6947   then 
			return 1
	else 
		CALCULATE_FUNCTIONS_LUA_000817 = GetResString("CALCULATE_FUNCTIONS_LUA_000817")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000817)
		return 0
	end
end


function BBXLChangeColor(role)
	local Item_BBXL =  GetChaItem(role, 1, 5)
	local Itemid_BBXL = GetItemID(Item_BBXL)
	local ItemEngry_BBXL1 = GetItemAttr(Item_BBXL,ITEMATTR_ENERGY)
	if Itemid_BBXL ==6947   then 
		local a = math.random ( 6001, 6015 )
			if a == ItemEngry_BBXL1   then
				a= a+1
			end 
			SetItemAttr ( Item_BBXL , ITEMATTR_ENERGY,a )
			local c = math.random ( 1, 5 )
				if c ==5   then
				local f = math.random (1,8)
				local spsp = GetItemAttr(Item_BBXL,ITEMATTR_VAL_SREC)
				local iMXSPSP=GetChaAttr(role,ATTR_ITEMV_SREC )
					SetChaAttr(role,ATTR_ITEMV_SREC  ,iMXSPSP-spsp)
					SetItemAttr ( Item_BBXL , ITEMATTR_VAL_SREC,f )
					iMXSPSP=GetChaAttr(role,ATTR_ITEMV_SREC )
					SetChaAttr(role,ATTR_ITEMV_SREC  ,iMXSPSP+f)
					iMXSPSP=GetChaAttr(role,ATTR_ITEMV_SREC )
					AttrRecheck ( role )
					SyncChar( role, 4 )
					CALCULATE_FUNCTIONS_LUA_000818 = GetResString("CALCULATE_FUNCTIONS_LUA_000818")
					CALCULATE_FUNCTIONS_LUA_000819 = GetResString("CALCULATE_FUNCTIONS_LUA_000819")
					SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000819..f..CALCULATE_FUNCTIONS_LUA_000818 )
				end		
			SyncCharLook( role, 0 )
			ReSetForgeAttr(Item_BBXL)
			CALCULATE_FUNCTIONS_LUA_000820 = GetResString("CALCULATE_FUNCTIONS_LUA_000820")
			SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000820)
			return 1
	else 
		CALCULATE_FUNCTIONS_LUA_000817 = GetResString("CALCULATE_FUNCTIONS_LUA_000817")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000817)
		return 0
	end
end


function BBXLChangeName(role)
	local Item_BBXL =  GetChaItem(role, 1, 5)
	local Itemid_BBXL = GetItemID(Item_BBXL)
	ItemEngry_BBXL2 = GetItemAttr(Item_BBXL,ITEMATTR_MAXENERGY)
		if Itemid_BBXL ==6947   then 
		local b = math.random ( 6100, 6200 )
			if b== ItemEngry_BBXL2   then 
			local b = math.random ( 6100, 6200 )
			end
		SetItemAttr ( Item_BBXL , ITEMATTR_MAXENERGY,b )
		local e = math.random ( 1, 5 )
			if e ==5   then
				local d = math.random (400,1000)
				local hp = GetItemAttr(Item_BBXL,ITEMATTR_VAL_MXHP)
				local iMXHP=GetChaAttr(role,ATTR_ITEMV_MXHP )
					SetChaAttr(role,ATTR_ITEMV_MXHP  ,iMXHP-hp)
					SetItemAttr ( Item_BBXL , ITEMATTR_VAL_MXHP,d )
					iMXHP=GetChaAttr(role,ATTR_ITEMV_MXHP )
					SetChaAttr(role,ATTR_ITEMV_MXHP  ,iMXHP+d)
					iMXHP=GetChaAttr(role,ATTR_ITEMV_MXHP )
					AttrRecheck ( role )
					SyncChar( role, 4 )
					CALCULATE_FUNCTIONS_LUA_000821 = GetResString("CALCULATE_FUNCTIONS_LUA_000821")
					CALCULATE_FUNCTIONS_LUA_000819 = GetResString("CALCULATE_FUNCTIONS_LUA_000819")
					SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000819..d..CALCULATE_FUNCTIONS_LUA_000821 )
				end
		SyncCharLook( role, 0 )
		ReSetForgeAttr(Item_BBXL)
		CALCULATE_FUNCTIONS_LUA_000822 = GetResString("CALCULATE_FUNCTIONS_LUA_000822")
		SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000822)
		return 1
	else 
	CALCULATE_FUNCTIONS_LUA_000817 = GetResString("CALCULATE_FUNCTIONS_LUA_000817")
	SystemNotice( role ,CALCULATE_FUNCTIONS_LUA_000817)
	return 0
	end
end
function CheckBookTo(role,level)

	local LoveBook_Id = 6959
	LoveBook = GetChaItem2 ( role , 2 , 6959 )
	LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
	
	if level == 2   then
		local ret = HasMoney(role , 100000)
		if ret == 1   then
			return 1
		else 
			CALCULATE_FUNCTIONS_LUA_000823 = GetResString("CALCULATE_FUNCTIONS_LUA_000823")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000823 )
			return 0
		end	
	elseif level == 3   then
		local ret = HasMoney(role , 400000)
		if ret == 1   then
			return 1
		else 
			CALCULATE_FUNCTIONS_LUA_000824 = GetResString("CALCULATE_FUNCTIONS_LUA_000824")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000824 )		
			return 0
		end	
	elseif level == 4   then
		local ret = HasMoney(role , 2000000)
		if ret == 1   then
			return 1
		else 
			CALCULATE_FUNCTIONS_LUA_000825 = GetResString("CALCULATE_FUNCTIONS_LUA_000825")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000825 )		
			return 0
		end	
	elseif level == 5   then
		if LoveBook_Energy >= 1   then			
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000826 = GetResString("CALCULATE_FUNCTIONS_LUA_000826")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000826 )		
			return 0
		end			
	elseif level == 6   then
		if LoveBook_Energy >= 3   then			
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000827 = GetResString("CALCULATE_FUNCTIONS_LUA_000827")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000827 )		
			return 0
		end	
	elseif level == 7   then
		if LoveBook_Energy >= 10   then			
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000828 = GetResString("CALCULATE_FUNCTIONS_LUA_000828")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000828 )		
			return 0
		end		
	elseif level == 8   then
		if LoveBook_Energy >= 50   then			
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000829 = GetResString("CALCULATE_FUNCTIONS_LUA_000829")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000829 )		
			return 0
		end
	elseif level == 9   then
		if LoveBook_Energy >= 100   then			
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000830 = GetResString("CALCULATE_FUNCTIONS_LUA_000830")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000830 )		
			return 0
		end	
	elseif level == 10   then
		if LoveBook_Energy >= 300   then			
			return 1
		else
			CALCULATE_FUNCTIONS_LUA_000831 = GetResString("CALCULATE_FUNCTIONS_LUA_000831")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000831 )		
			return 0
		end	
	else
		return 0	
	end	
	
end

function LoveRingTo(role,level)

	if level == 2   then
		local k = TakeMoney(role,nil,100000)
		
		if k == 0   then
			CALCULATE_FUNCTIONS_LUA_000832 = GetResString("CALCULATE_FUNCTIONS_LUA_000832")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000832 )
			return 0
		else
			CALCULATE_FUNCTIONS_LUA_000833 = GetResString("CALCULATE_FUNCTIONS_LUA_000833")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000833 )
			TakeItem(role , 0 , 6949 , 1 )
			GiveItem ( role , 0 , 6950 , 1 , 0 )
			CALCULATE_FUNCTIONS_LUA_000834 = GetResString("CALCULATE_FUNCTIONS_LUA_000834")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000834 )
			return 1
		end
	elseif level == 3   then	
		local k = TakeMoney(role,nil,400000)
		if k == 0   then
			CALCULATE_FUNCTIONS_LUA_000835 = GetResString("CALCULATE_FUNCTIONS_LUA_000835")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000835 )
			return 0
		else			
			CALCULATE_FUNCTIONS_LUA_000836 = GetResString("CALCULATE_FUNCTIONS_LUA_000836")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000836 )
			TakeItem( role , 0 , 6950 , 1 )
			GiveItem ( role , 0 , 6951 , 1 , 0 )
			CALCULATE_FUNCTIONS_LUA_000837 = GetResString("CALCULATE_FUNCTIONS_LUA_000837")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000837 )
			return 1
		end	
	elseif level == 4   then	
		local k = TakeMoney(role,nil,2000000)
		if k == 0   then
			CALCULATE_FUNCTIONS_LUA_000838 = GetResString("CALCULATE_FUNCTIONS_LUA_000838")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000838 )
			return 0
		else			
			CALCULATE_FUNCTIONS_LUA_000839 = GetResString("CALCULATE_FUNCTIONS_LUA_000839")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000839 )
			TakeItem( role , 0 , 6951 , 1 )	
			GiveItem ( role , 0 , 6952 , 1 , 0 )
			CALCULATE_FUNCTIONS_LUA_000840 = GetResString("CALCULATE_FUNCTIONS_LUA_000840")
			SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000840 )
			return 1
		end	
	elseif level == 5   then	
		LoveBook = GetChaItem2 ( role , 2 , 6959 )
		LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
		--SystemNotice ( role , "��ǰ����֤֮�û�����"..LoveBook_Energy )
		LoveBook_Energy = LoveBook_Energy - 1
		SetItemAttr(LoveBook,ITEMATTR_VAL_STR,LoveBook_Energy)
		SynChaKitbag(role,13)
		CALCULATE_FUNCTIONS_LUA_000841 = GetResString("CALCULATE_FUNCTIONS_LUA_000841")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000841 )
		--LoveBook_Energy1 = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )	
		--SystemNotice ( role , "���ڰ���֤֮�û�����"..LoveBook_Energy1 )	
		TakeItem( role , 0 , 6952 , 1 )			
		GiveItem ( role , 0 , 6953 , 1 , 0 )
		CALCULATE_FUNCTIONS_LUA_000842 = GetResString("CALCULATE_FUNCTIONS_LUA_000842")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000842 )
		return 1	
	elseif level == 6   then	
		LoveBook = GetChaItem2 ( role , 2 , 6959 )
		LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
		LoveBook_Energy = LoveBook_Energy - 3
		SetItemAttr(LoveBook,ITEMATTR_VAL_STR,LoveBook_Energy)
		SynChaKitbag(role,13)
		CALCULATE_FUNCTIONS_LUA_000843 = GetResString("CALCULATE_FUNCTIONS_LUA_000843")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000843 )
		TakeItem( role , 0 , 6953 , 1 )
		GiveItem ( role , 0 , 6954 , 1 , 0 )
		CALCULATE_FUNCTIONS_LUA_000844 = GetResString("CALCULATE_FUNCTIONS_LUA_000844")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000844 )
		return 1
	elseif level == 7   then	
		LoveBook = GetChaItem2 ( role , 2 , 6959 )
		LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
		LoveBook_Energy = LoveBook_Energy - 10
		SetItemAttr(LoveBook,ITEMATTR_VAL_STR,LoveBook_Energy)
		SynChaKitbag(role,13)
		CALCULATE_FUNCTIONS_LUA_000845 = GetResString("CALCULATE_FUNCTIONS_LUA_000845")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000845 )
		TakeItem( role , 0 , 6954 , 1 )
		GiveItem ( role , 0 , 6955 , 1 , 0 )
		CALCULATE_FUNCTIONS_LUA_000846 = GetResString("CALCULATE_FUNCTIONS_LUA_000846")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000846 )
		return 1
	elseif level == 8   then	
		LoveBook = GetChaItem2 ( role , 2 , 6959 )
		LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
		LoveBook_Energy = LoveBook_Energy - 50
		SetItemAttr(LoveBook,ITEMATTR_VAL_STR,LoveBook_Energy)
		SynChaKitbag(role,13)
		CALCULATE_FUNCTIONS_LUA_000847 = GetResString("CALCULATE_FUNCTIONS_LUA_000847")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000847 )
		TakeItem( role , 0 , 6955 , 1 )			
		GiveItem ( role , 0 , 6956 , 1 , 0 )
		CALCULATE_FUNCTIONS_LUA_000848 = GetResString("CALCULATE_FUNCTIONS_LUA_000848")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000848 )
		return 1
	elseif level == 9   then	
		LoveBook = GetChaItem2 ( role , 2 , 6959 )
		LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
		LoveBook_Energy = LoveBook_Energy - 100
		SetItemAttr(LoveBook,ITEMATTR_VAL_STR,LoveBook_Energy)
		SynChaKitbag(role,13)		
		CALCULATE_FUNCTIONS_LUA_000849 = GetResString("CALCULATE_FUNCTIONS_LUA_000849")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000849 )
		TakeItem( role , 0 , 6956 , 1 )
		GiveItem ( role , 0 , 6957 , 1 , 0 )
		CALCULATE_FUNCTIONS_LUA_000850 = GetResString("CALCULATE_FUNCTIONS_LUA_000850")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000850 )
		return 1
	elseif level == 10   then	
		LoveBook = GetChaItem2 ( role , 2 , 6959 )
		LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
		LoveBook_Energy = LoveBook_Energy - 300
		SetItemAttr(LoveBook,ITEMATTR_VAL_STR,LoveBook_Energy)
		SynChaKitbag(role,13)
		CALCULATE_FUNCTIONS_LUA_000851 = GetResString("CALCULATE_FUNCTIONS_LUA_000851")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000851 )
		TakeItem( role , 0 , 6957 , 1 )
		GiveItem ( role , 0 , 6958 , 1 , 0 )
		CALCULATE_FUNCTIONS_LUA_000852 = GetResString("CALCULATE_FUNCTIONS_LUA_000852")
		SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000852 )
		return 1		
	end

end

function AddLovePoint(role,point)

	LoveBook = GetChaItem2 ( role , 2 , 6959 )
	LoveBook_Energy = GetItemAttr( LoveBook , ITEMATTR_VAL_STR )
	LoveBook_Energy = LoveBook_Energy + point
	SetItemAttr(LoveBook,ITEMATTR_VAL_STR,LoveBook_Energy)
	SynChaKitbag(role,13)
	CALCULATE_FUNCTIONS_LUA_000853 = GetResString("CALCULATE_FUNCTIONS_LUA_000853")
	CALCULATE_FUNCTIONS_LUA_000854 = GetResString("CALCULATE_FUNCTIONS_LUA_000854")
	SystemNotice ( role , CALCULATE_FUNCTIONS_LUA_000854..point..CALCULATE_FUNCTIONS_LUA_000853 )

	return 1
end 

function yanhuaGive(role)
		local b = math.random ( 3345, 3359 )
		GiveItem ( role , 0 , b  , 1 , 4 ) 
		return 1
end
function TakeUreItemHTXD (role,now_tick)
	local Lv = Lv(role)
	if Lv >= 20 and Lv < 51   then
		local ItemHTXD = GetChaItem2( role , 2 , 7050 )
		if ItemHTXD == nil   then
			return 
		else
			ItemHTXD_URE = GetItemAttr( ItemHTXD , ITEMATTR_URE )
			local ItemHTXD_URE = GetItemAttr( ItemHTXD , ITEMATTR_URE )
			local SetItemHTXD_URE = ItemHTXD_URE - BoxNum
			if ItemHTXD_URE >= 49   then
				SetItemAttr(ItemHTXD,ITEMATTR_URE,SetItemHTXD_URE)	
			else
				return
			end
		end
	elseif Lv >= 51 and Lv < 61   then 
		local ItemHTXD = GetChaItem2( role , 2 , 7051 )
		if ItemHTXD == nil   then
			return 
		else
			ItemHTXD_URE = GetItemAttr( ItemHTXD , ITEMATTR_URE )
			local ItemHTXD_URE = GetItemAttr( ItemHTXD , ITEMATTR_URE )
			local SetItemHTXD_URE = ItemHTXD_URE - BoxNum
			if ItemHTXD_URE >= 49   then
				SetItemAttr(ItemHTXD,ITEMATTR_URE,SetItemHTXD_URE)	
			else
				return
			end
		end
	elseif Lv >= 61 and Lv < 71   then 
		local ItemHTXD = GetChaItem2( role , 2 , 7052 )
		if ItemHTXD == nil   then
			return 
		else
			ItemHTXD_URE = GetItemAttr( ItemHTXD , ITEMATTR_URE )
			local ItemHTXD_URE = GetItemAttr( ItemHTXD , ITEMATTR_URE )
			local SetItemHTXD_URE = ItemHTXD_URE - BoxNum
			if ItemHTXD_URE >= 49   then
				SetItemAttr(ItemHTXD,ITEMATTR_URE,SetItemHTXD_URE)	
			else
				return
			end
		end
	else
		return
	end

end 
XZNeedItem={}
XZNeedItem[1]={1779,8}
XZNeedItem[2]={4513,1,4551,3}
XZNeedItem[3]={4410,4,4489,4}
XZNeedItem[4]={4386,2,4717,2,1690,2,4319,2}
XZNeedItem[5]={1839,4,1840,4}
XZNeedItem[6]={4490,3,4426,3,4890,2}
XZNeedItem[7]={3963,2,4411,1,1478,1}
XZNeedItem[8]={4431,3,4444,3,4447,2}
XZNeedItem[9]={4890,2,4754,2,4410,4}
XZNeedItem[10]={4329,4,4320,4}
XZNeedItem[11]={4911,3,4718,3,4754,2}
XZNeedItem[12]={4384,4,4423,4}
function IsGiveXZNewItem(role)
	local NeedId=HasXingZuoKa(role)
	local needItemName=GetItemName ( NeedId )
	local haveXingZuoka=CheckBagItem(role,NeedId)
	local year = tonumber(os.date("%y"))
	local mon =  tonumber(os.date("%m"))
	local day =  tonumber(os.date("%d"))
	local nowDays=year*10000+mon*100+day
	local needItemNameAll = needItemName
	if nowDays >=90723 and nowDays<=90822 and haveXingZuoka == 0   then    -- 09��������⴦��
		local needID1={5881+XingZuo(421),5881+XingZuo(521),5881+XingZuo(622)}
		local i =1 
		while needID1[i]~=nil 
		do 
			CALCULATE_FUNCTIONS_LUA_000452 = GetResString("CALCULATE_FUNCTIONS_LUA_000452")
			needItemNameAll=needItemNameAll..CALCULATE_FUNCTIONS_LUA_000452..GetItemName ( needID1[i] )
			haveXingZuoka=CheckBagItem(role,needID1[i])
			if haveXingZuoka == 1   then 
				NeedId = needID1[i]
				break
			end
			i=i+1
		end
	end
	if haveXingZuoka == 0   then
		CALCULATE_FUNCTIONS_LUA_000337 = GetResString("CALCULATE_FUNCTIONS_LUA_000337")
		CALCULATE_FUNCTIONS_LUA_000338 = GetResString("CALCULATE_FUNCTIONS_LUA_000338")
		return CALCULATE_FUNCTIONS_LUA_000338..needItemNameAll..CALCULATE_FUNCTIONS_LUA_000337
	end
	if XZNeedItem[NeedId-5881] == nil   then 
		CALCULATE_FUNCTIONS_LUA_000855 = GetResString("CALCULATE_FUNCTIONS_LUA_000855")
		return CALCULATE_FUNCTIONS_LUA_000855
	end
	local ItemCha=GetChaItem2(role,2,NeedId)
	local IsGet=GetItemAttr( ItemCha , ITEMATTR_VAL_STR  )
	local isYear = GetItemAttr( ItemCha , ITEMATTR_VAL_STA  )
	if IsGet==1 and year== isYear   then
		CALCULATE_FUNCTIONS_LUA_000856 = GetResString("CALCULATE_FUNCTIONS_LUA_000856")
		return CALCULATE_FUNCTIONS_LUA_000856
	end
	local num = 0 
	local i = 1 
	while XZNeedItem[NeedId-5881][2*i-1]~= nil do
		local XZNeedItemNum = XZNeedItem[NeedId-5881][2*i]*99
		if XZNeedItem[NeedId-5881][2*i-1]==4551 or XZNeedItem[NeedId-5881][2*i-1]==1478   then --����Ƭ������15��1��
			XZNeedItemNum = XZNeedItem[NeedId-5881][2*i]*15
		end
		local hasXZItemNum= CheckBagItem(role,XZNeedItem[NeedId-5881][2*i-1])
		if hasXZItemNum<XZNeedItemNum   then 
			CALCULATE_FUNCTIONS_LUA_000857 = GetResString("CALCULATE_FUNCTIONS_LUA_000857")
			CALCULATE_FUNCTIONS_LUA_000858 = GetResString("CALCULATE_FUNCTIONS_LUA_000858")
			return GetItemName ( XZNeedItem[NeedId-5881][2*i-1] )..CALCULATE_FUNCTIONS_LUA_000858..XZNeedItem[NeedId-5881][2*i]..CALCULATE_FUNCTIONS_LUA_000857
		end
		num=num+XZNeedItem[NeedId-5881][2*i] 
		i=i+1
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 12-num   then
		CALCULATE_FUNCTIONS_LUA_000859 = GetResString("CALCULATE_FUNCTIONS_LUA_000859")
		CALCULATE_FUNCTIONS_LUA_000860 = GetResString("CALCULATE_FUNCTIONS_LUA_000860")
		return CALCULATE_FUNCTIONS_LUA_000860..12-num..CALCULATE_FUNCTIONS_LUA_000859
	end
	return LUA_TRUE
end	
function GiveXZNewItem(role,npc)
	local NeedId=HasXingZuoKa(role)
	local ItemCha=GetChaItem2(role,2,NeedId) 
	local haveXingZuoka=CheckBagItem(role,NeedId)
	local year = tonumber(os.date("%y"))
	local mon =  tonumber(os.date("%m"))
	local day =  tonumber(os.date("%d"))
	local nowDays=year*10000+mon*100+day
	if nowDays >=90723 and nowDays<=90822 and haveXingZuoka == 0   then    -- 09��������⴦��
		local needID1={5881+XingZuo(421),5881+XingZuo(521),5881+XingZuo(622)}
		local i =1 
		while needID1[i]~=nil 
		do 
			haveXingZuoka=CheckBagItem(role,needID1[i])
			if haveXingZuoka == 1   then 
				NeedId = needID1[i]
				break
			end
			i=i+1
		end
	end
	local i = 1
	while XZNeedItem[NeedId-5881][2*i]~= nil do
		local XZNeedItemNum = XZNeedItem[NeedId-5881][2*i]*99
		if XZNeedItem[NeedId-5881][2*i-1]==4551 or XZNeedItem[NeedId-5881][2*i-1]==1478   then --����Ƭ������15��1��
			XZNeedItemNum = XZNeedItem[NeedId-5881][2*i]*15
		end
		DelBagItem(role,XZNeedItem[NeedId-5881][2*i-1],XZNeedItemNum)
		i=i+1
	end
	local XZItem={}
	XZItem[1]= {6874,1}
	XZItem[2]={6875,1}
	XZItem[3]={6876,1}
	XZItem[4]={0319,5}
	XZItem[5]={1102,10}
	XZItem[6]={3083,10}
	XZItem[7]={1014,1}
	XZItem[8]={6612,3}
	XZItem[9]={6462,1}
	XZItem[10]={6295,3}
	XZItem[11]={6296,3}
	XZItem[12]={6297,3}
	local i= 1
	while XZItem[i]~=nil 
	do 
		GiveItem(role,npc,XZItem[i][1],XZItem[i][2],4)
		i=i+1
	end
	-- ��Ʒ��������
-- (6874)������������*1 
-- (6875)�ڰ���������*1 
-- (6876)���ܼ�������*1 
-- (0319)�����ٻ���*5 
-- (1102)��į��ٻ�ȯ*10 
-- (3083)������Ϸȯ*10 
-- (1014)Ů��������ʽ*1 
-- (6612)�ż�����ͼ*3 
-- (6462)���鼼����-���*1 
-- (6295)���������ٻ�ȯ*3 
-- (6296)�ɰ������ٻ�ȯ*3 
-- (6297)����С���ٻ�*3
	local year = tonumber(os.date("%y"))
	ItemCha=GetChaItem2(role,2,NeedId) 
	SetItemAttr( ItemCha , ITEMATTR_VAL_STA ,year )
	SetItemAttr( ItemCha , ITEMATTR_VAL_STR ,1 )
	return LUA_TRUE
end
function GetNewXingZuoKaNeed(role)
	local i=0
	local id = 5881
	local XZKID = 5881
	for i=1,12,1 do 
		id=id+1
		local hasNeedXZK=CheckBagItem(role,id)
		if hasNeedXZK==1   then
			XZKID = id 
			break
		end
	end
	if XZKID == 5881   then 
		CALCULATE_FUNCTIONS_LUA_000861 = GetResString("CALCULATE_FUNCTIONS_LUA_000861")
		return CALCULATE_FUNCTIONS_LUA_000861
	end
	CALCULATE_FUNCTIONS_LUA_000862 = GetResString("CALCULATE_FUNCTIONS_LUA_000862")
	local XZKMission = GetItemName(XZKID)..CALCULATE_FUNCTIONS_LUA_000862
	i = 1 
	while XZNeedItem[XZKID-5881][2*i]~= nil do
		local XZNeedItemNum = CheckBagItem(role,XZNeedItem[XZKID-5881][2*i-1])
		CALCULATE_FUNCTIONS_LUA_000863 = GetResString("CALCULATE_FUNCTIONS_LUA_000863")
		XZKMission = XZKMission.."_"..i..":"..GetItemName ( XZNeedItem[XZKID-5881][2*i-1] ).."*"..XZNeedItem[XZKID-5881][2*i]..CALCULATE_FUNCTIONS_LUA_000863
		i=i+1
	end
	return XZKMission
end
--------------------------------------------------------------zhangliang-------------------�¼���------��鱳���Ƿ���������Ʒ-----------
function CheckFuShenItem(role,itemid1)
    local num = CheckBagItem( role , itemid1)
	if num == 0   then 
		GiveItem ( role , 0 , itemid1 , 1 , 0 )
	end
	return LUA_TRUE
end
-------------------------------------------------------------zhangliang--------------------�¼���-----��������Ʒ����ͬʱ������----------		
function GivePointsAndMoney(role,itemid1)
	local a = GetChaItem2(role,2,itemid1) --ȡ��ұ����ĵ���ָ��
	local b = GetItemAttr(a,ITEMATTR_VAL_STR)--GetItemAttr (Item,ITEMATTR_ENERGY)--ȡ���ߵ���������ֵ
	SetItemAttr(a,ITEMATTR_VAL_STR,b+1)--��������1
	SynChaKitbag(role,13)
	local num =b+1 --����
	local p = GetChaAttr ( role , ATTR_FAME )
	if itemid1 == 7142   then
		if num == 1   then 
			p = p+300
			SetChaAttrI( role , ATTR_FAME , p )
		elseif num==2   then
			p = p+300
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 3047  , 5 , 0 )
		elseif num == 3   then 
			p = p+300
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 3845  , 5 , 0 )
		elseif num == 4   then
			p = p+300
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 3097  , 5 , 0 )
		elseif num == 5   then
			p = p+1000
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 6848  , 1 , 0 )
			GiveItem ( role , 0 , 6854  , 1 , 0 )
			GiveItem ( role , 0 , 6851  , 1 , 0 )
			TakeItem( role, 0,itemid1, 1 ) --���������κ������������
			SetRecord(role,2034)--���������ǩ
		else
			Notice("����7142�����ˣ�")
		end
	elseif itemid1 == 7143   then
		if num == 1   then 
			p = p+500
			SetChaAttrI( role , ATTR_FAME , p )
		elseif num== 2   then
			p = p+500
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 6848  , 1 , 0 )
		elseif num == 3   then 
			p = p+500
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 6854  , 1 , 0 )
		elseif num == 4   then
			p = p+500
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 6851  , 1 , 0 )
		elseif num == 5   then
			p = p+1500
			SetChaAttrI( role , ATTR_FAME , p )
			GiveItem ( role , 0 , 6379  , 5 , 0 )
			TakeItem( role, 0,itemid1, 1 ) --���������κ������������
			SetRecord(role,2035)--���������ǩ
		else
			Notice("����7143�����ˣ�")
		end
	else
		Notice("�����ˣ�")
	end
	return LUA_TRUE
end
function GiveXinZhuangBei(role,Record)
	local rolejob = GetChaAttr( role, ATTR_JOB)
	if rolejob<8   then 
		return LUA_FALSE
	end
	if Record==2093 or Record==2094   then  
		if rolejob==8   then 
			GiveItem ( role , 0 , 7295 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==9   then
			GiveItem ( role , 0 , 7298 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==12   then
			GiveItem ( role , 0 , 7310 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==13   then
			GiveItem ( role , 0 , 7301 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==14   then
			GiveItem ( role , 0 , 7304 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==16   then
			GiveItem ( role , 0 , 7307 ,1 , 4 )
			return LUA_TRUE
		end
	elseif Record==2095   then
		if rolejob==8   then 
			GiveItem ( role , 0 , 7296 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==9   then
			GiveItem ( role , 0 , 7299 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==12   then
			GiveItem ( role , 0 , 7311 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==13   then
			GiveItem ( role , 0 , 7302 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==14   then
			GiveItem ( role , 0 , 7305 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==16   then
			GiveItem ( role , 0 , 7308 ,1 , 4 )
			return LUA_TRUE
		end
	elseif Record==2096 or Record==2097   then
		if rolejob==8   then 
			GiveItem ( role , 0 , 7313 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==9   then
			GiveItem ( role , 0 , 7316 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==12   then
			GiveItem ( role , 0 , 7328 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==13   then
			GiveItem ( role , 0 , 7319 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==14   then
			GiveItem ( role , 0 , 7322 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==16   then
			GiveItem ( role , 0 , 7325 ,1 , 4 )
			return LUA_TRUE
		end
	elseif Record==2098   then
		if rolejob==8   then 
			GiveItem ( role , 0 , 7314 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==9   then
			GiveItem ( role , 0 , 7317 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==12   then
			GiveItem ( role , 0 , 7329 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==13   then
			GiveItem ( role , 0 , 7320 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==14   then
			GiveItem ( role , 0 , 7323 ,1 , 4 )
			return LUA_TRUE
		elseif rolejob==16   then
			GiveItem ( role , 0 , 7326 ,1 , 4 )
			return LUA_TRUE
		end
	end
		
	return LUA_TRUE
end
function check_yourjob(role)
	local rolejob = GetChaAttr( role, ATTR_JOB)
	if LV~=0 and rolejob<8   then 
		return LUA_FALSE
	end
	return LUA_TRUE
end


function Addsafe_exp ( role,decimal,constant,step)	------------------ͨ�õ���Ӿ���ĺ���by.��ڻ���
	if (decimal~=nil and constant ==nil and step == nil) or (decimal==nil and constant ~=nil and step == nil) or(decimal==nil and constant ==nil and step ~= nil)    then
	else
		SystemNotice ( role , "Parameter Error:I have to say you are really not smart enough! Don't tell me you are innocent!" )
		return LUA_FALSE
	end	
	
	local exp_now = GetChaAttr ( role, ATTR_CEXP )---��������е��ܾ���
	local lv = GetChaAttr ( role , ATTR_LV )
	local exp_set = 0
	local maxlv = 120
	 
	
	if step ~= nil   then  --��������
		if lv + step < maxlv   then 
			exp_set = GetExp[lv + step] +(exp_now-GetExp[lv])
		elseif lv +step == maxlv   then
			exp_set = GetExp[maxlv] 
		-- else
			-- return LUA_FALSE --�쳣
		end
	elseif decimal ~= nil   then 
		local exp_up = GetExp[lv + 1] - GetExp[lv]---��һ������һ���ľ���
		exp_set = math.floor( exp_up * decimal )+exp_now
		if exp_set >=GetExp[maxlv]   then
			exp_set = GetExp[maxlv]
		-- else
			-- return LUA_FALSE --�쳣
		end
	elseif constant ~= nil   then
		exp_set = constant + exp_now
		if exp_set >=GetExp[maxlv]   then
			exp_set = GetExp[maxlv]
		-- else
			-- return LUA_FALSE --�쳣
		end
	end

	SetChaAttrI( role , ATTR_CEXP , exp_set )
	RefreshCha( role )
	return LUA_TRUE
end
--------------------------------X1---------------------------------------
function Yurenjie1(role)
    --GiveItem ( role , 0 , 0005 , 1 , 4 )
    AddState ( role , role , STATE_CUSI , 10 , 1 ) --���
	RemoveState(role,STATE_CUSI)
    SystemNotice ( role ,"Argh, you exposed me! Now I cannot let you live!" )
    return"Argh, you exposed me! Now I cannot let you live!"
end
function Yurenjie2(role)
    GiveItem ( role , 0 , 7376 , 1 , 4 )
    AddState ( role , role , STATE_CUSI , 10 , 1 ) --���
	RemoveState(role,STATE_CUSI)
    SystemNotice ( role ,"In order to make you believe, you shall die once!" )
    return"In order to make you believe, you shall die once!"
end
function Yurenjie3(role)
    --GiveItem ( role , 0 , 0005 , 1 , 4 )
    AddState ( role , role , STATE_CUSI , 10 , 1 ) --���
	RemoveState(role,STATE_CUSI)
    SystemNotice ( role ,"Please go and die.. You have no ambition! Haha!" )
    return"Please go and die.. You have no ambition! Haha!"
end
function KouYuRenTime(role,now_tick)
	if math.fmod(now_tick, 30) == 0 and now_tick > 0   then	
		
		local yurencha=GetChaItem2(role,2,7372)
		if yurencha==nil   then
			return
		end
	
		local yurentime=GetItemAttr(yurencha,ITEMATTR_VAL_AGI)
		if yurentime < 121   then
		yurentime = yurentime+1	
				SetItemAttr(yurencha,ITEMATTR_VAL_AGI,yurentime)				
		end
	end
end 
-----���Giveʥ����������

function GiveSDSMLW (role)
	local zhzbx = math.random ( 1, 6 )
	if zhzbx==1   then
	GiveItem ( role , 0 , 2801  , 1 , 4 )
	elseif zhzbx==2   then
	GiveItem ( role , 0 , 3909  , 10 , 4 )
	elseif zhzbx==3   then
	GiveItem ( role , 0 , 1101  , 1 , 4 )
	elseif zhzbx==4   then
	GiveItem ( role , 0 , 4312  , 1 , 4 )
	elseif zhzbx==5   then
	GiveItem ( role , 0 , 6918  , 1 , 4 )
	else
	GiveItem ( role , 0 , 5644 , 1 , 4 )
	end
end 
-- function jsqbijiao(role,now_tick)
    -- --ȡ���ڵ�ʱ�� 
	-- local now_month= os.date("%m")        -------------��
	-- local now_day= os.date("%d")	    -------------��
	-- local now_hour= (os.date("%H")	)	-------------ʱ
	-- local now_miniute= (os.date("%M"))	-------------��
 	-- local now_second= (os.date("%S"))	-------------��
	----��ʽ��
	-- local now_month_num= tonumber(now_month)     -------------��	
	-- local now_day_num= tonumber(now_day)	     -------------��
	-- local now_hour_a= tonumber(now_hour)	     -------------ʱ
	-- local now_miniute_b= tonumber(now_miniute)	 -------------��
 	-- local now_second_c=  tonumber(now_second)    -------------��
	-- local  zbiaomapa=now_hour_a*60+now_miniute_b

	-- local chaitem  = GetChaItem2(role,2,8736)	
	-- local  a= GetItemAttr(chaitem,ITEMATTR_VAL_PARAM1)------���շ���
    -- local  b= math.floor(a/100)          ---  --��
    -- local  c= math.fmod(a,100)	         ---  --��
    -- local fzsj     = GetItemAttr(chaitem,ITEMATTR_VAL_PARAM2)
	-- if	now_month_num~=b   then
   -- SystemNotice(role,"The Xmas Card quest is out of time��would you please complete it? :(")
		-- return
		
		
   -- elseif now_day_num~=c   then	
		 -- SystemNotice(role,"The Xmas Card quest is out of time��would you please complete it? :(")
		 
		-- return
   -- elseif  zbiaomapa~=fzsj   then
	-- SystemNotice(role,"The time for Xmas Card quest is"..zbiaomapa-fzsj.."minutes, please hurry up!")

		
		
   	-- return
   
	-- end

	
-- end


    
 function jsq(role)
    --ȡ���ڵ�ʱ�� 
	local now_month= os.date("%m")        -------------��
	local now_day= os.date("%d")	    -------------��
	local now_hour= (os.date("%H")	)	-------------ʱ
	local now_miniute= (os.date("%M"))	-------------��
 	local now_second= (os.date("%S"))	-------------��
	--��ʽ��
	local now_month_num= tonumber(now_month)     -------------��	
	local now_day_num= tonumber(now_day)	     -------------��
	local now_hour_a= tonumber(now_hour)	     -------------ʱ
	local now_miniute_b= tonumber(now_miniute)	 -------------��
    local now_second_c=  tonumber(now_second)    -------------��
    local zbiaomap=now_hour_a*60+now_miniute_b
    local a=now_month_num*100+now_day_num
	    GiveItem ( role , 0 , 8736, 1 , 4 )
		--SystemNotice(role,"���������ʱ����"..now_month_num.."��"..now_day_num.."��"..now_hour_a.."ʱ"..now_miniute_b.."��")
	local chaitem = GetChaItem2(role,2,8736)
		SetItemAttr(chaitem,ITEMATTR_VAL_PARAM1,a)---��¼����	
        SetItemAttr(chaitem,ITEMATTR_VAL_PARAM2,zbiaomap)--��¼����
	return LUA_TRUE
end


 function wcjsq(role)--qq
    ---------------ȡ���ڵ�ʱ�� 
	local now_month= os.date("%m")        -------------��
	local now_day= os.date("%d")	    -------------��
	local now_hour= (os.date("%H")	)	-------------ʱ
	local now_miniute= (os.date("%M"))	-------------��
 	-- local now_second= (os.date("%S"))	-------------��
	-----��ʽ��
	local now_month_num= tonumber(now_month)     -------------��	
	local now_day_num= tonumber(now_day)	     -------------��
	local now_hour_a= tonumber(now_hour)	     -------------ʱ
	local now_miniute_b= tonumber(now_miniute)	 -------------��
 	-- local now_second_c=  tonumber(now_second)    -------------��
	local  zbiaomapa=now_hour_a*60+now_miniute_b
    --SystemNotice(role,"��������ʱ����"..now_month_num.."��"..now_day_num.."��"..now_hour_a.."ʱ"..now_miniute_b.."��")
	
	local chaitem  = GetChaItem2(role,2,8736)
	local a = GetItemAttr(chaitem,ITEMATTR_VAL_PARAM1)
    local  b= math.floor(a/100) --��
    local  c= math.fmod(a,100)	--��
    local fzsj = GetItemAttr(chaitem,ITEMATTR_VAL_PARAM2)
	
	if  now_month_num ~= b   then
		GiveItem ( role , 0 , 2891, 3, 4 ) 
		SystemNotice(role,"I am sorry that the time you used was too long, I could only provide you a little gift.")
		DelBagItem ( role, 8736, 1)
	elseif now_day_num ~= c   then
		GiveItem ( role , 0 , 2891, 3, 4 ) 
		SystemNotice(role,"I am sorry that the time you used was too long, I could only provide you a little gift.")
		DelBagItem ( role, 8736, 1)
		
	elseif zbiaomapa-fzsj <= 3   then   --------------------------С�ڵ���3����
		GiveItem ( role , 0 , 5639, 3 , 4 )   -------------------�����߼����������*3
		SystemNotice(role,"Time for finishing the quest is"..zbiaomapa-fzsj.."minutes.")
		DelBagItem ( role, 8736, 1)
		
	elseif  zbiaomapa-fzsj == 4    then -------------------------=4����
		GiveItem ( role , 0 , 849, 3, 4 )    -------------------������Ӿ����*3
		SystemNotice(role,"Time for finishing the quest is"..zbiaomapa-fzsj.."minutes.")
		DelBagItem ( role, 8736, 1)
		
	elseif  zbiaomapa-fzsj == 5    then -------------------------=5����
		GiveItem ( role , 0 , 5644, 3, 4 )   -------------------�����߼���������*3
		SystemNotice(role,"Time for finishing the quest is"..zbiaomapa-fzsj.."minutes.��")
		
		DelBagItem ( role, 8736, 1)
	elseif  zbiaomapa-fzsj == 6    then -------------------------=6����
		GiveItem ( role , 0 , 2890, 3, 4 )   -------------------����ʥ�������ٻ���*3
		SystemNotice(role,"Time for finishing the quest is"..zbiaomapa-fzsj.."minutes.��")
		DelBagItem ( role, 8736, 1)
		
	elseif  zbiaomapa-fzsj >= 7    then -------------------------==7����
		GiveItem ( role , 0 , 2891, 3, 4 )   -------------------����ѩ���ٻ���*3
		SystemNotice(role,"Time for finishing the quest is"..zbiaomapa-fzsj.."minutes��minutes. It is too late, you can only get a little gift.")
		DelBagItem ( role, 8736, 1)
		
		
		
	end
end
-----------------------------����4��---����
function CheckLLDead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1380 and hp <=0   then
		if lanlongflag == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lanlongflag = 0
		end
		return 1
	end
	return 0
end

-------------------------����-----------------
function CheckHLDead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1381 and hp <=0   then
		if honglongflag == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		honglongflag = 0
		end
		return 1
	end
	return 0
end


-----------------------------����-------
function CheckLvLDead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1382 and hp <=0   then
		if lvlongflag == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lvlongflag = 0
		end
		return 1
	end
	return 0
end

------------------------��̨----------
function CheckLLPD1Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1383 and hp <=0   then
		if lanlongpaotai1 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lanlongpaotai1 = 0
		end
		return 1
	end
	return 0
end

function CheckLLPD2Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1384 and hp <=0   then
		if lanlongpaotai2 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lanlongpaotai2 = 0
		end
		return 1
	end
	return 0
end

function CheckLLPD3Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1385 and hp <=0   then
		if lanlongpaotai3 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lanlongpaotai3 = 0
		end
		return 1
	end
	return 0
end

function CheckLLPD4Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1386 and hp <=0   then
		if lanlongpaotai4 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lanlongpaotai14 = 0
		end
		return 1
	end
	return 0
end

function CheckHLPD1Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1387 and hp <=0   then
		if honglongpaotai1 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		honglongpaotai1 = 0
		end
		return 1
	end
	return 0
end

function CheckHLPD2Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1388 and hp <=0   then
		if honglongpaotai2 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		honglongpaotai2 = 0
		end
		return 1
	end
	return 0
end

function CheckHLPD3Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1389 and hp <=0   then
		if honglongpaotai3 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		honglongpaotai3 = 0
		end
		return 1
	end
	return 0
end

function CheckHLPD4Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1390 and hp <=0   then
		if honglongpaotai4 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		honglongpaotai4 = 0
		end
		return 1
	end
	return 0
end

function CheckLvLPD1Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1391 and hp <=0   then
		if lvlongpaotai1 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lvlongpaotai1 = 0
		end
		return 1
	end
	return 0
end

function CheckLvLPD2Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1392 and hp <=0   then
		if lvlongpaotai2 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lvlongpaotai2 = 0
		end
		return 1
	end
	return 0
end

function CheckLvLPD3Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1393 and hp <=0   then
		if lvlongpaotai3 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lvlongpaotai3 = 0
		end
		return 1
	end
	return 0
end

function CheckLvLPD4Dead ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1394 and hp <=0   then
		if lvlongpaotai4 == 1   then
		SetChaTarget(role, 0)
		SetChaPatrolState(role, 0)
		lvlongpaotai4 = 0
		end
		return 1
	end
	return 0
end
function CheckSZLLive ( role,id )

	local hp = Hp(role)

	if role == nil   then
		return 2
	end
	if id == 1376 and hp >0   then
		return 1
	end
	return 0
end

function ZodiacEffect(role)
	local Slot = GetChaItem(role,2,5)
 	local SlotID = GetItemID(Slot)
	
	if SlotID == 5884   then --Aries Card
		AddState( role , role , STATE_ZODI1 , 1 , 3600)
	else
		local SignAries = GetChaStateLv(role,STATE_ZODI1)
		if SignAries ~= 0   then
			RemoveState(role,STATE_ZODI1)
		end
	end
	
	if SlotID == 5885   then --Taurus Cardv
		AddState( role , role , STATE_ZODI2 , 1 , 3600)
	else
		local SignTauru = GetChaStateLv(role,STATE_ZODI2)
		if SignTauru ~= 0   then
			RemoveState(role,STATE_ZODI2)
		end
	end
	
	if SlotID == 5886   then --Gemini Card
		AddState( role , role , STATE_ZODI3 , 1 , 3600)	
	else
		local SignGemin = GetChaStateLv(role,STATE_ZODI3)
		if SignGemin ~= 0   then
			RemoveState(role,STATE_ZODI3)
		end
	end
	
	if SlotID == 5887   then --Cancer Card
		AddState( role , role , STATE_ZODI4 , 1 , 3600)	
	else
		local SignGemin = GetChaStateLv(role,STATE_ZODI4)
		if SignGemin ~= 0   then
			RemoveState(role,STATE_ZODI4)
		end
	end	
	
	if SlotID == 5888   then --Leo Card
		AddState( role , role , STATE_ZODI5 , 1 , 3600)	
	else
		local SignCance = GetChaStateLv(role,STATE_ZODI5)
		if SignCance ~= 0   then
			RemoveState(role,STATE_ZODI5)
		end
	end		

	if SlotID == 5889   then --Virgo Card
		AddState( role , role , STATE_ZODI6 , 1 , 3600)	
	else
		local SignLeo = GetChaStateLv(role,STATE_ZODI6)
		if SignLeo ~= 0   then
			RemoveState(role,STATE_ZODI6)
		end
	end	

	if SlotID == 5990   then --Libra Card
		AddState( role , role , STATE_ZODI7 , 1 , 3600)	
	else
		local SignVirgo = GetChaStateLv(role,STATE_ZODI7)
		if SignVirgo ~= 0   then
			RemoveState(role,STATE_ZODI7)
		end
	end	

	if SlotID == 5891   then --Scorpio Card
		AddState( role , role , STATE_ZODI8 , 1 , 3600)	
	else
		local SignLibra = GetChaStateLv(role,STATE_ZODI8)
		if SignLibra ~= 0   then
			RemoveState(role,STATE_ZODI8)
		end
	end	

	if SlotID == 5892   then --Sagittarius Card
		AddState( role , role , STATE_ZODI9 , 1 , 3600)	
	else
		local SignScorp = GetChaStateLv(role,STATE_ZODI9)
		if SignScorp ~= 0   then
			RemoveState(role,STATE_ZODI9)
		end
	end	

	if SlotID == 5893   then --Capricorn Card
		AddState( role , role , STATE_ZODI10 , 1 , 3600)	
	else
		local SignSaggi = GetChaStateLv(role,STATE_ZODI10)
		if SignSaggi ~= 0   then
			RemoveState(role,STATE_ZODI10)
		end
	end	

	if SlotID == 5882   then --Aquarius Card
		AddState( role , role , STATE_ZODI11 , 1 , 3600)	
	else
		local SignCapri = GetChaStateLv(role,STATE_ZODI11)
		if SignCapri ~= 0   then
			RemoveState(role,STATE_ZODI11)
		end
	end	

	if SlotID == 5883   then --Pisces Card
		AddState( role , role , STATE_ZODI12 , 1 , 3600)	
	else
		local SignAquar = GetChaStateLv(role,STATE_ZODI12)
		if SignAquar ~= 0   then
			RemoveState(role,STATE_ZODI12)
		end
	end			
end

function PKO_VIP_Necklace(role)
	local Neck		= GetEquipItemP(role,5)
	local NeckID	= GetItemID(Neck)
	if NeckID == 6999   then
		AddState(role, role, VIPNECKY, 1, 3600)
	else
		if GetChaStateLv(role, VIPNECKY) ~= 0   then
			RemoveState(role, VIPNECKY)
		end
	end
end

function Check_Item_DevilSet(role)
	local Bracelet_1 		= GetEquipItemP(role,10)
	local Bracelet_2 		= GetEquipItemP(role,11)
	local Belt 				= GetEquipItemP(role,12)	
	local Handguard 		= GetEquipItemP(role,13)
	local Bracelet_1_ID		= GetItemID(Bracelet_1)
	local Bracelet_2_ID		= GetItemID(Bracelet_2)
	local Belt_ID			= GetItemID(Belt)
	local Handguard_ID		= GetItemID(Handguard)
	if Bracelet_1 == nil or Bracelet_2 == nil or Belt == nil or Handguard == nil   then
		return 0
	end
	if Bracelet_1_ID == 7380 and Bracelet_2_ID == 7380 and Belt_ID == 7381 and Handguard_ID == 7392   then
		return 1	
	end
	if Bracelet_1_ID == 7384 and Bracelet_2_ID == 7384 and Belt_ID == 7392 and Handguard_ID == 7385   then
		return 1
	end
	if Bracelet_1_ID == 7386 and Bracelet_2_ID == 7386 and Belt_ID == 7392 and Handguard_ID == 7387   then
		return 1
	end
		if Bracelet_1_ID == 7388 and Bracelet_2_ID == 7388 and Belt_ID == 7392 and Handguard_ID == 7389   then
		return 1
	end
			if Bracelet_1_ID == 7390 and Bracelet_2_ID == 7390 and Belt_ID == 7392 and Handguard_ID == 7391   then
		return 1
	end
				if Bracelet_1_ID == 7380 and Bracelet_2_ID == 7380 and Belt_ID == 7392 and Handguard_ID == 7381   then
		return 1
	end
	if Bracelet_1_ID == 7382 and Bracelet_2_ID == 7382 and Belt_ID == 7392 and Handguard_ID == 7383   then
		return 1
	end	
	return 0
end
function GiveGold(role,amount)
	local Gold			= GetChaAttr(role,ATTR_GD)
	local Gold_MaxLimit	= 2000000000
	local Gold_MinLimit	= 0
	local Gold_Add		= amount
	local Gold_Total	= Gold + Gold_Add
	if Gold_Total >= Gold_MaxLimit   then
		SetChaAttrI(role,ATTR_GD,Gold_MaxLimit)
	elseif Gold_Total <= Gold_MinLimit   then
		SetChaAttrI(role,ATTR_GD,Gold_MinLimit)
	else
		SetChaAttrI(role,ATTR_GD,Gold_Total)
	end
	RefreshCha(role)
end

function GiveReputation(role,num)
	local Fame			= GetChaAttr(role, ATTR_FAME)
	local FameAdd		= num
	local FameMinLimit	= 0
	local FameMaxLimit	= 100000000
	local FinalFame		= Fame + FameAdd

	if FinalFame >= FameMaxLimit   then
		SetCharaAttr(FameMaxLimit, role, ATTR_FAME)
	elseif FinalFame <= FameMinLimit   then
		SetCharaAttr(FameMinLimit, role, ATTR_FAME)
	else
		SetCharaAttr(FinalFame, role, ATTR_FAME)
	end
	RefreshCha(role)
end


function GetOsTime()
    local Hour = tonumber(os.date("%H"))
    local Minute = tonumber(os.date("%M"))
    local Second = tonumber(os.date("%S"))
    return Hour,Minute,Second
end


function AddImpsPoints(Player, Amount)
	local AccountName = GetActName(Player)
	local String = "UPDATE "..SQL.GameDB.Name..".dbo.account SET mall_points = mall_points + "..Amount.." WHERE act_name = '"..AccountName.."'"
	local Connect, CID = LuaSQL("connect", SQL.GameDB.Host, SQL.GameDB.User, SQL.GameDB.Password)
	if Connect == SQL_SUCCESS_WITH_INFO   then
		local Success, Query = LuaSQL("query", CID, String)
		if Success == SQL_SUCCESS_WITH_INFO   then
			local Data = LuaSQL("fetch", CID, Query)
			LuaSQL("freehandle", CID, Query)
			LuaSQL("close", CID)
		elseif Success == SQL_SUCCESS   then
			LuaSQL("freehandle", CID, Query)
			LuaSQL("close", CID)
			return -9999
		end
	end
end

CUSTOM_RETURN_POINTS         = {
                ['puzzleworld']            = 'Sacred Snow Mountain',
                ['puzzleworld2']        = 'Sacred Snow Mountain',
                ['garner2']        = 'Chaos Portal',
                ['abandonedcity']        = 'Forsaken City Nurse',
                ['abandonedcity2']        = 'Forsaken City Nurse',
                ['abandonedcity3']        = 'Forsaken City Nurse',
                ['darkswamp']        = 'Dark Swamp Nurse',
            }
			
			function MapRespawnOnDeath(Player, mapname)
				local ret 				= ""
				for i,v in pairs(CUSTOM_RETURN_POINTS) do
					if(i == mapname)   then
						if mapname == "puzzleworld" or  mapname == "puzzleworld2"   then
							ReAll(Player)
						end
						ret 			= v
					end
				end
				local SideID				= GetChaSideID(Player)
				if (mapname == "chaosicicle")   then
					if (SideID == 1)   then
						return CI.Spawns[2].Spawn
					elseif (SideID == 2)   then
						return CI.Spawns[1].Spawn
					end
				end
				return ret
			end				
			

--Buddy Ring
function BuddyRingJudge(role)
	local Ring_Num = 0
	local t = {}			-- Calling all teammates pointers
		t[0] = role
		t[1] = GetTeamCha(role, 0 )
		t[2] = GetTeamCha(role, 1 )
		t[3] = GetTeamCha(role, 2 )
		t[4] = GetTeamCha(role, 3 )
	local t_Num = {}		--Record the number of all teammates who have ring
	t_Num[0]	= 0
	t_Num[1]	= 0
	t_Num[2]	= 0
	t_Num[3]	= 0
	t_Num[4]	= 0
	local i = 1
	for i = 1 , 4, 1 do
		if t[i] ~= nil   then
			local Ring_Num_Add = CheckBagItem(  t[i] , 9167 )
			if Ring_Num_Add == 1   then

             local retbag = HasLeaveBagGrid(  t[i], 1) 
              if retbag ~= LUA_TRUE   then 
                BickerNotice(role,"Your partners Inventory is full!")
                BickerNotice(t[i],"You need at least 1 free Slot!") 
                 return LUA_FALSE 
              end      
             local NocLock =KitbagLock( t[i], 0 ) 
              if NocLock == LUA_FALSE   then 
                BickerNotice( role , "Your partners Inventory is locked!") 
                BickerNotice( t[i] , "You need to make sure your inventory is unlocked") 
                 return LUA_FALSE 
               end 
								
				t_Num[i] = 1		--If there are rings, the value is set to 1, for the judge to do with the back
				Ring_Num = Ring_Num + Ring_Num_Add	--The team recorded the total number of rings for the judge to do with the back
			end
		end
	end

	if Ring_Num == 1   then				--If the team a total of a ring on the task of this man and   then the person with
		return LUA_TRUE
	elseif Ring_Num > 1   then
		SystemNotice(role,"You need one Sealed Buddy Ring!")
		return LUA_FALSE
	else
		SystemNotice(role,"Please find someone to Buddy first!")
		return LUA_FALSE
	end
end
-----Valentine's Day ring record information
function BuddyRing(role)
	local Ring_Num = 0
	local t = {}			--Pointer to call the various teammates
		t[0] = role
		t[1] = GetTeamCha(role, 0 )
		t[2] = GetTeamCha(role, 1 )
		t[3] = GetTeamCha(role, 2 )
		t[4] = GetTeamCha(role, 3 )
	local t_Num = {}		--Record the number of all teammates who ring
		t_Num[0]	= 0
		t_Num[1]	= 0
		t_Num[2]	= 0
		t_Num[3]	= 0
		t_Num[4]	= 0
	local i = 1
	for i = 1 , 4, 1 do
		if t[i] ~= nil   then
			local Ring_Num_Add = CheckBagItem(  t[i] , 9167 )
			if Ring_Num_Add == 1   then
				t_Num[i] = 1		--If there are rings, the value is set to 1, for the judge to do with the back
				Ring_Num = Ring_Num + Ring_Num_Add	--The team recorded the total number of rings for the judge to do with the back
			end
		end
	end

	if Ring_Num == 1   then				--If the team a total of a ring on the task of this man and   then the person with
		local i = 1
		for i = 1 , 4 ,1 do
			if t_Num[i] == 1   then

				--Players will take over the task of information recorded in the other ring in the
				local ID_Num = GetRoleID(role)	--Then the task to obtain the player's ID number, and record in the ring in the

				GiveItem ( t[i] , 0 , 9166  , 1 , 4  )
				local a = DelBagItem ( t[i] , 9167 , 1)

				local Item = GetChaItem2 ( t[i] , 2 , 9166 )	--Valentine's teammates made the right ring pointer

				local Num_JZ = GetItemForgeParam ( Item , 1 )
				Num_JZ = TansferNum ( Num_JZ )
				Num_JZ = ID_Num	---Scouring the role of ID numbers of information bits recorded
				SetItemForgeParam ( Item , 1 , Num_JZ )
				AddChaSkill ( t[i] , 538, 1 , 1 , 0 )
				--The information recorded will be the right team-mate in the next task of the player's rings
				local ID_Num1 = GetRoleID(t[i])	--Get the right team-mate's ID number, and record in the ring in the

				GiveItem ( role , 0 , 9166  , 1 , 4  )
				local b = DelBagItem ( role , 9167 , 1)

				local Item1 = GetChaItem2 ( role , 2 , 9166 )	--Then the task to obtain the player's Valentine's Day ring pointer

				local Num_JZ1 = GetItemForgeParam ( Item1 , 1 )
				Num_JZ1 = TansferNum ( Num_JZ1 )
				Num_JZ1 = ID_Num1	---Scouring the role of ID numbers of information bits recorded

				SetItemForgeParam ( Item1 , 1 , Num_JZ1 )
				AddChaSkill ( role , 538, 1 , 1 , 0 )
			--	Notice("Get away")

			end
		end
		return LUA_TRUE
	elseif Ring_Num > 1   then
		SystemNotice(role,"You can only Buddy one!")
		return LUA_FALSE
	else
		SystemNotice(role,"Please find someone to Buddy first!")
		return LUA_FALSE
	end
end

-- The function checks if skill can be learned or upgraded
function CheckCanUpgradeSkill(role, skill_id) 

       local skill = GetSkillLv(role, skill_id) 
       if (skill > 10)   then ---the orginial is 0 , changed for test the bug ---
           
          local Data 

          for Data in SkillList do 
          
				if SkillList [Data] == skill_id   then
					SystemNotice(role, "Unable to increase the level of this skill!") 
					return 0 
				end 
              
			end 
              
          return 1 
           
		end 
            
		SystemNotice(role, "You have not learned this skill. Unable to increase level!") 
		return 0 

end


function AddSkillNPC ( role )
local job = GetChaAttr(role, ATTR_JOB)
---Swordsman
if job == 1   then
AddChaSkill ( role , SK_CHF , 10 , 0 , 0 )
AddChaSkill ( role , SK_JDZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_GTYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_HYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_KB , 10 , 0 , 0 )
AddChaSkill ( role , SK_HX , 10 , 0 , 0 )

elseif job == 9   then ---Crusader
AddChaSkill ( role , SK_CHF , 10 , 0 , 0 )
AddChaSkill ( role , SK_JDZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_GTYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_HYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_KB , 10 , 0 , 0 )
AddChaSkill ( role , SK_HX , 10 , 0 , 0 )
AddChaSkill ( role , SK_FSZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PXKG , 10 , 0 , 0 )
AddChaSkill ( role , SK_LQHB , 10 , 0 , 0 )
AddChaSkill ( role , SK_YS , 10 , 0 , 0 )
AddChaSkill ( role , SK_GWZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_DB , 10 , 0 , 0 )
elseif job == 8   then---champion
AddChaSkill ( role , SK_CHF , 10 , 0 , 0 )
AddChaSkill ( role , SK_JDZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_GTYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_HYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_KB , 10 , 0 , 0 )
AddChaSkill ( role , SK_HX , 10 , 0 , 0 )
AddChaSkill ( role , SK_JJSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_MNRX , 10 , 0 , 0 )
AddChaSkill ( role , SK_SWZQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_QHTZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_ZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_LH , 10 , 0 , 0 )
AddChaSkill ( role , SK_PAX , 10 , 0 , 0 )
elseif job == 4   then ---Explorer
AddChaSkill ( role , SK_JR , 10 , 0 , 0 )
AddChaSkill ( role , SK_LJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SL , 10 , 0 , 0 )
AddChaSkill ( role , SK_BKZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JF , 10 , 0 , 0 )
AddChaSkill ( role , SK_HZCR , 10 , 0 , 0 )
elseif job == 16   then ---Voyager
AddChaSkill ( role , SK_JR , 10 , 0 , 0 )
AddChaSkill ( role , SK_LJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SL , 10 , 0 , 0 )
AddChaSkill ( role , SK_BKZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JF , 10 , 0 , 0 )
AddChaSkill ( role , SK_HZCR , 10 , 0 , 0 )
AddChaSkill ( role , SK_BKCJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XW , 10 , 0 , 0 )
AddChaSkill ( role , SK_MW , 10 , 0 , 0 )
AddChaSkill ( role , SK_LM , 10 , 0 , 0 )
elseif job == 2   then ---Hunter
AddChaSkill ( role , SK_GJSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_JFB , 10 , 0 , 0 )
AddChaSkill ( role , SK_LZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_FNQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_DJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_BDJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_LXJY , 10 , 0 , 0 )
elseif job == 12   then ---Sharpshooter
AddChaSkill ( role , SK_GJSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_JFB , 10 , 0 , 0 )
AddChaSkill ( role , SK_LZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_FNQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_DJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_BDJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_LXJY , 10 , 0 , 0 )
AddChaSkill ( role , SK_HQSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_RSD , 10 , 0 , 0 )
AddChaSkill ( role , SK_TJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_BT , 10 , 0 , 0 )
elseif job == 5   then ---Herbalist
AddChaSkill ( role , SK_XZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSJC , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLCZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SHPF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_FZLZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFS , 10 , 0 , 0 )
AddChaSkill ( role , SK_FH , 10 , 0 , 0 )
elseif job == 13   then ---Cleric
AddChaSkill ( role , SK_XZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSJC , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLCZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SHPF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_FZLZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFS , 10 , 0 , 0 )
AddChaSkill ( role , SK_FH , 10 , 0 , 0 )
AddChaSkill ( role , SK_SY , 10 , 0 , 0 )
AddChaSkill ( role , SK_SYZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSFB , 10 , 0 , 0 )
AddChaSkill ( role , SK_TSHD , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFWQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLPZ , 10 , 0 , 0 )
elseif job == 14   then ---SealMaster
AddChaSkill ( role , SK_XZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSJC , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLCZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SHPF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_FZLZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFS , 10 , 0 , 0 )
AddChaSkill ( role , SK_FH , 10 , 0 , 0 )
AddChaSkill ( role , SK_SY , 10 , 0 , 0 )
AddChaSkill ( role , SK_SYZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_ZZZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_SYNZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_AYZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_XZFY , 10 , 0 , 0 )
end
end
function TimeROSO(role, freq, time)
	local now_ticking = GetChaParam(role, 1)
	if math.fmod(now_ticking, 305) == 0 and now_ticking > 0   then	
		local Hour	 = os.date("%H")	-- Hour Scripts
		local Minute = os.date("%M")	-- Minute Scripts
		local Second = os.date("%S")	-- Seconds Scripts
		BickerNotice ( role, "<ADM>:The time in Server is now "..Hour..":"..Minute..":"..Second.." ")
	end
end


function ToClockFormat(seconds)
  local num = tonumber(seconds)
  if(num == 0)  then return "00:00:00" else
    now_hour = string.format("%02.f",math.floor(num / 3600 ))
    now_minute = string.format("%02.f",math.floor(num / 60 - (now_hour*60)))
    now_second = string.format("%02.f",math.floor(num - now_hour*3600 - now_minute*60))
    return now_hour..":"..now_minute..":"..now_second
  end
end
function SecondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0   then
    return "00:00:00";
  else
 now_hour = string.format("%02.f",math.floor(num / 3600 ))
    now_minute = string.format("%02.f",math.floor(num / 60 - (now_hour*60)))
    now_second = string.format("%02.f",math.floor(num - now_hour*3600 - now_minute*60))
    return now_hour..":"..now_minute..":"..now_second
  end
end


function EquipmentISGemmed(item)
        local param = GetItemForgeParam(item, 1)
        local Item_Stone = { }
        local Item_StoneLv = { }
        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_Stone[2] = GetNum_Part4(param)
        Item_Stone[3] = GetNum_Part6(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_StoneLv[2] = GetNum_Part5(param)
        Item_StoneLv[3] = GetNum_Part7(param)
if Item_StoneLv[1] > 0 or Item_StoneLv[2] > 0 or Item_StoneLv[3] > 0   then
return 1
else return 0
end
end
function VerifyStat(role)
    --SystemNotice(role, "Voc�� ")
    local str = GetChaAttr( role , ATTR_STR )
    local acc = GetChaAttr( role , ATTR_DEX )
    local agi = GetChaAttr( role , ATTR_AGI )
    local con = GetChaAttr( role , ATTR_CON )
    local spr = GetChaAttr( role , ATTR_STA )
  --  SystemNotice(role, "STR: " ..str.. " ACC: " ..acc.." AGI: "..agi.. " CON: " ..con.. " SPR: "..spr)
    if str > 650 or acc > 650 or agi > 650 or con > 650 or spr > 650   then
       -- SystemNotice(role, "Retorna 1")
        return 1
    end
   -- SystemNotice(role, "Retorna 0")
    return 0
end
BTH = {}
function AddSkillNPC ( role )
local job = GetChaAttr(role, ATTR_JOB)
---Swordsman
if job == 1 then
AddChaSkill ( role , SK_CHF , 10 , 0 , 0 )
AddChaSkill ( role , SK_JDZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_GTYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_HYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_KB , 10 , 0 , 0 )
AddChaSkill ( role , SK_HX , 10 , 0 , 0 )

elseif job == 9 then ---Crusader
AddChaSkill ( role , SK_CHF , 10 , 0 , 0 )
AddChaSkill ( role , SK_JDZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_GTYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_HYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_KB , 10 , 0 , 0 )
AddChaSkill ( role , SK_HX , 10 , 0 , 0 )
AddChaSkill ( role , SK_FSZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PXKG , 10 , 0 , 0 )
AddChaSkill ( role , SK_LQHB , 10 , 0 , 0 )
AddChaSkill ( role , SK_YS , 10 , 0 , 0 )
AddChaSkill ( role , SK_GWZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_DB , 10 , 0 , 0 )
elseif job == 8 then---champion
AddChaSkill ( role , SK_CHF , 10 , 0 , 0 )
AddChaSkill ( role , SK_JDZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_GTYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_HYZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_PJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_KB , 10 , 0 , 0 )
AddChaSkill ( role , SK_HX , 10 , 0 , 0 )
AddChaSkill ( role , SK_JJSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_MNRX , 10 , 0 , 0 )
AddChaSkill ( role , SK_SWZQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_QHTZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_ZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_LH , 10 , 0 , 0 )
AddChaSkill ( role , SK_PAX , 10 , 0 , 0 )
elseif job == 4 then ---Explorer
AddChaSkill ( role , SK_JR , 10 , 0 , 0 )
AddChaSkill ( role , SK_LJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SL , 10 , 0 , 0 )
AddChaSkill ( role , SK_BKZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JF , 10 , 0 , 0 )
AddChaSkill ( role , SK_HZCR , 10 , 0 , 0 )
elseif job == 16 then ---Voyager
AddChaSkill ( role , SK_JR , 10 , 0 , 0 )
AddChaSkill ( role , SK_LJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SL , 10 , 0 , 0 )
AddChaSkill ( role , SK_BKZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_JF , 10 , 0 , 0 )
AddChaSkill ( role , SK_HZCR , 10 , 0 , 0 )
AddChaSkill ( role , SK_BKCJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XW , 10 , 0 , 0 )
AddChaSkill ( role , SK_MW , 10 , 0 , 0 )
AddChaSkill ( role , SK_LM , 10 , 0 , 0 )
elseif job == 2 then ---Hunter
AddChaSkill ( role , SK_GJSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_JFB , 10 , 0 , 0 )
AddChaSkill ( role , SK_LZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_FNQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_DJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_BDJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_LXJY , 10 , 0 , 0 )
elseif job == 12 then ---Sharpshooter
AddChaSkill ( role , SK_GJSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_JFB , 10 , 0 , 0 )
AddChaSkill ( role , SK_LZJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_FNQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_DJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_BDJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_LXJY , 10 , 0 , 0 )
AddChaSkill ( role , SK_HQSL , 10 , 0 , 0 )
AddChaSkill ( role , SK_RSD , 10 , 0 , 0 )
AddChaSkill ( role , SK_TJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SJ , 10 , 0 , 0 )
AddChaSkill ( role , SK_BT , 10 , 0 , 0 )
elseif job == 5 then ---Herbalist
AddChaSkill ( role , SK_XZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSJC , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLCZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SHPF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_FZLZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFS , 10 , 0 , 0 )
AddChaSkill ( role , SK_FH , 10 , 0 , 0 )
elseif job == 13 then ---Cleric
AddChaSkill ( role , SK_XZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSJC , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLCZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SHPF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_FZLZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFS , 10 , 0 , 0 )
AddChaSkill ( role , SK_FH , 10 , 0 , 0 )
AddChaSkill ( role , SK_SY , 10 , 0 , 0 )
AddChaSkill ( role , SK_SYZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSFB , 10 , 0 , 0 )
AddChaSkill ( role , SK_TSHD , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFWQ , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLPZ , 10 , 0 , 0 )
elseif job == 14 then ---SealMaster
AddChaSkill ( role , SK_XZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_JSJC , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLCZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_SHPF , 10 , 0 , 0 )
AddChaSkill ( role , SK_XLZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_FZLZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_HFS , 10 , 0 , 0 )
AddChaSkill ( role , SK_FH , 10 , 0 , 0 )
AddChaSkill ( role , SK_SY , 10 , 0 , 0 )
AddChaSkill ( role , SK_SYZY , 10 , 0 , 0 )
AddChaSkill ( role , SK_ZZZH , 10 , 0 , 0 )
AddChaSkill ( role , SK_SYNZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_AYZZ , 10 , 0 , 0 )
AddChaSkill ( role , SK_XZFY , 10 , 0 , 0 )
end
end