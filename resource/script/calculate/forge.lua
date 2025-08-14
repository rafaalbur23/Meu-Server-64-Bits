--------------------------------------------------------------------------
--									--
--									--
--				forge.lua  				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Forge.lua" )


Checkfusion={}		---ˮ�������ж��ۺ�
Checkunite={}		---ˮ�������жϱ�ʯ�ϳ�
CheckShipExp = {}    -----��ֻ���
----��ʯ�ϳ�

---����Ƿ��ܹ��ϳ�
function can_unite_item (...)
	local arg = {...}
--	Notice("��ʼ�ж�")
	if #arg ~= 12 then
--		Notice("���������Ƿ�"..#arg)
		return 0
	end
	
	local kkk = 0
	
--	for kkk = 2 , #arg ,1 do
--		SystemNotice ( arg[1] , arg[kkk])
--	end
	
	local Check = 0
--	SystemNotice( arg[1] , "���úϳɼ��������")
	Check = can_unite_item_main ( arg )
	if Check == 1 then
		
--		SystemNotice (arg[1] , "����1 ")
		return 1
	else
--		SystemNotice (arg[1] , "����0 ")
		return 0
	end
end

--����Ƿ���Ժϳ�������

function can_unite_item_main ( Table )
--	SystemNotice ( Table[1] , "����ϳ�������")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

--	SystemNotice( arg[1] , "��ʼ���ò�������")

	
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

--	for kkk = 0 , 2 , 1 do
--		SystemNotice ( role , ItemBagCount[kkk])
--		SystemNotice ( role , ItemBag[kkk])
--		SystemNotice ( role , ItemCount[kkk])
--	end
	
--	Notice(role , "11111")
	local i = 0
	for i = 0 , 2 , 1 do							--�жϵ��߶�������͵��߸����Ƿ�ͷ�
		if ItemBagCount[i] ~= 1 or ItemCount[i] ~= 1 then
--			SystemNotice( role , "ItemBagCount[i] = "..ItemBagCount[i])
--			SystemNotice( role , "ItemCount[i] = "..ItemCount[i])
			CALCULATE_FORGE_LUA_000001 = GetResString("CALCULATE_FORGE_LUA_000001")
			SystemNotice( role , CALCULATE_FORGE_LUA_000001)
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

	if ItemType1 ~= 47 then					--�жϾ����Ƿ���ȷ
		
		CALCULATE_FORGE_LUA_000002 = GetResString("CALCULATE_FORGE_LUA_000002")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000002)
		return 0
	end

	if ItemType2 ~= 49 or ItemType3 ~= 49 then			--�ж��Ƿ��Ǳ�ʯ
		if ItemType2 ~= 50 or ItemType3 ~= 50 then
			CALCULATE_FORGE_LUA_000003 = GetResString("CALCULATE_FORGE_LUA_000003")
			SystemNotice( role , CALCULATE_FORGE_LUA_000003)
			return 0
		end
	end

	if ItemID2 ~= ItemID3 then						--�ж�������ʯ�Ƿ�ͬ��
		CALCULATE_FORGE_LUA_000004 = GetResString("CALCULATE_FORGE_LUA_000004")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000004)

		return 0
	end

	local Item2_Lv = Get_StoneLv ( Item2 )					--ȡ��ʯ�ȼ�
	local Item3_Lv = Get_StoneLv ( Item3 )
	if ItemID2 == 6718 or ItemID2 == 6717 then 
		if Item2_Lv>=2 or Item3_Lv >= 2 then 
			CALCULATE_FORGE_LUA_000005 = GetResString("CALCULATE_FORGE_LUA_000005")
			SystemNotice ( role , CALCULATE_FORGE_LUA_000005)
			return 0
		end
	end	
	if ItemType2 == 49 and ItemType3 == 49 then
		if Item2_Lv >= 9 or Item3_Lv >= 9 then
			CALCULATE_FORGE_LUA_000006 = GetResString("CALCULATE_FORGE_LUA_000006")
			SystemNotice ( role , CALCULATE_FORGE_LUA_000006)
			return 0
		end
	end

	if Item2_Lv ~= Item3_Lv then 
		
		CALCULATE_FORGE_LUA_000007 = GetResString("CALCULATE_FORGE_LUA_000007")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000007)
		return 0
	end
--	SystemNotice ( role , "�жϳɹ�")
	local Money_Need = getunite_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000008 = GetResString("CALCULATE_FORGE_LUA_000008")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000008)
		return 0
	end
	

	return 1
end


--��ʼ�ϳ�
function begin_unite_item (...)
	local arg = {...}
--	Notice("��ʼ�ϳ�")
	
	local Check_CanUnite = 0
--	SystemNotice ( arg[1] , "���ü���ܷ�ϳ�������")
	Check_CanUnite = can_unite_item_main ( arg )
	if Check_CanUnite == 0 then
		return 0
	end
	
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( arg )

	
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]
	
	local BagItem1 = arg [3]						--ȡ���߱���λ��
	local BagItem2 = arg [6]
	local BagItem3 = arg [9]

	local Item1 = GetChaItem ( role , 2 , BagItem1 )			--ȡ����ָ��
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	
	local ItemID1 = GetItemID ( Item1 )					--ȡ���߱��
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )

	local ItemType2 = GetItemType ( Item2 )

	local Item2_Lv = Get_StoneLv ( Item2 )					--ȡ��ʯ�ȼ�
	local Item3_Lv = Get_StoneLv ( Item3 )

	local i = 0
	local j = 0

	i = RemoveChaItem ( role , ItemID1 , 1 , 2 , BagItem1 , 2 , 1 , 0)		--�Ƴ�����
	j = RemoveChaItem ( role , ItemID3 , 1 , 2 , BagItem3 , 2 , 1 , 0)		--�Ƴ�һ�ű�ʯ

	if i == 0 or j == 0 then
		CALCULATE_FORGE_LUA_000009 = GetResString("CALCULATE_FORGE_LUA_000009")
		LG( "Hecheng_BS" , CALCULATE_FORGE_LUA_000009 )
	end
	
	Item2_Lv =Item2_Lv + 1
	
	Set_StoneLv ( Item2 , Item2_Lv )
	
	local Money_Need = getunite_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Ŀǰ��"..Money_Have.."��ô���Ǯ")
--	Notice ("Ҫ�۳�"..Money_Need.."��ô���Ǯ")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )
	
	local Sklv = 1
	local StateLv = GetChaStateLv ( role , STATE_HCGLJB )
	local State100 = GetChaStateLv ( role , STATE_HCBYS )	------ȡҩˮ״̬
	
	Sklv = Sklv + StateLv


	local b = Check_CG_HechengBS ( Item2_Lv , ItemType2 , Sklv )
	if Item2_Lv < 8 and Item3_Lv < 8 then 
		if State100 == 11 then
			b = 1
		CALCULATE_FORGE_LUA_000010 = GetResString("CALCULATE_FORGE_LUA_000010")
		SystemNotice( role , CALCULATE_FORGE_LUA_000010)	   		
		end
	end
	
	if Item2_Lv > 6 and Item3_Lv > 6 then 
		if State100 == 10 then
			b = 1
		CALCULATE_FORGE_LUA_000010 = GetResString("CALCULATE_FORGE_LUA_000010")
		SystemNotice( role , CALCULATE_FORGE_LUA_000010)	   		
		end
	end	
	
	if b == 0 then
		i = RemoveChaItem ( role , ItemID2 , 1 , 2 , BagItem2 , 2 , 1 , 0)		--�Ƴ���ʯ	
		if i == 0 then
			CALCULATE_FORGE_LUA_000009 = GetResString("CALCULATE_FORGE_LUA_000009")
			LG( "Hecheng_BS" , CALCULATE_FORGE_LUA_000009 )
		end
		local cha_name = GetChaDefaultName ( role )
		CALCULATE_FORGE_LUA_000011 = GetResString("CALCULATE_FORGE_LUA_000011")
		CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
		LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000011 )
		CALCULATE_FORGE_LUA_000012 = GetResString("CALCULATE_FORGE_LUA_000012")
		SystemNotice( role , CALCULATE_FORGE_LUA_000012)

		return 2	
	end
	local cha_name = GetChaDefaultName ( role )
	CALCULATE_FORGE_LUA_000013 = GetResString("CALCULATE_FORGE_LUA_000013")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000013 )
	local ret = HasMission(role,1989)
	if ret == 1	then 
		local name = GetChaDefaultName(role)
		Checkunite[name]=1
	end
	return 1
end
--������Ҫ��Ǯ
function get_item_unite_money (...)
	local arg = {...}
--	SystemNotice ( arg[1] , "��ʼ����Ǯ" )
	local Money = getunite_money_main ( arg )
--	SystemNotice ( arg[1] , "�������"..Money )
	return 0
end

--������Ҫ��Ǯ������

function getunite_money_main ( Table )
--	SystemNotice ( Table[1] , "��Ŀ�ʼ����Ǯ��" )
	return 5000
end





--����

--�ж��Ƿ��ܹ�����

function can_forge_item(...)
	local arg = {...}
--	Notice ( "�ж��Ƿ���Ծ���")
	if #arg ~= 12 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end

--	local kkk = 0
	
--	for kkk = 2 , #arg ,1 do
--		SystemNotice ( arg[1] , arg[kkk])
--	end

	local Check = 0
	
	Check = can_forge_item_main ( arg )
	
	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ���Ծ���������
	
function can_forge_item_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )


	local ItemBagCount_Jinglian = ItemBagCount [0]
	local ItemBag_Jinglian = ItemBag [0]
	local ItemNum_Jinglian = ItemCount [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Check = 0

	

	if ItemBagCount_Jinglian ~= 1 then
		CALCULATE_FORGE_LUA_000015 = GetResString("CALCULATE_FORGE_LUA_000015")
		SystemNotice( role , CALCULATE_FORGE_LUA_000015)
		return 0
	end
	
	if ItemNum_Jinglian ~= 1 then
		CALCULATE_FORGE_LUA_000016 = GetResString("CALCULATE_FORGE_LUA_000016")
		SystemNotice( role , CALCULATE_FORGE_LUA_000016)
		return 0
	end

	Check = CheckItem_CanJinglian ( Item_Jinglian )

	if Check == 0 then
		CALCULATE_FORGE_LUA_000017 = GetResString("CALCULATE_FORGE_LUA_000017")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000017)
		return 0
	end
	

	
	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		CALCULATE_FORGE_LUA_000018 = GetResString("CALCULATE_FORGE_LUA_000018")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000018)
		return 0
	end

	local Item_Stone1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Stone2 = GetChaItem ( role , 2 , ItemBag [2] )

	local Check_Hole = 0

	Check_Hole = CheckItem_HaveHole ( Item_Jinglian , Item_Stone1 , Item_Stone2)

	if Check_Hole == 0 then
		CALCULATE_FORGE_LUA_000019 = GetResString("CALCULATE_FORGE_LUA_000019")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000019 )
		return 0
	end
	

	local Check_Stone = 0

	Check_Stone = Check_StoneLv ( Item_Jinglian , Item_Stone1 , Item_Stone2 )

	if Check_Stone == 0 then
		CALCULATE_FORGE_LUA_000020 = GetResString("CALCULATE_FORGE_LUA_000020")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000020 )
		return 0
	end
	if Check_Stone == -1 then
		CALCULATE_FORGE_LUA_000021 = GetResString("CALCULATE_FORGE_LUA_000021")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000021 )
		return 0
	end

	local Check_StoneItem = 0

	Check_StoneItem = Check_StoneItemType ( Item_Jinglian , Item_Stone1 , Item_Stone2 )

	if Check_StoneItem == 0 then
		CALCULATE_FORGE_LUA_000022 = GetResString("CALCULATE_FORGE_LUA_000022")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000022 )
		return 0
	end
	if Check_StoneItem==-1 then 
		CALCULATE_FORGE_LUA_000023 = GetResString("CALCULATE_FORGE_LUA_000023")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000023 )
		return 0
	end
	
	local Money_Need = getforge_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000024 = GetResString("CALCULATE_FORGE_LUA_000024")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000024)
		return 0
	end

	
--SystemNotice(role ,"�жϽ��� ")
	return 1
end
function ZBforge(role )
local ZBMain= GetChaAttr(role,ATTR_EXTEND0)
	local ZBNType= math.floor(ZBMain/10)      ---�ڼ���ռ��
	local ZBNMain= math.fmod(ZBMain,10 )			---BUFF OR DEBUFF
	local ZBday = GetChaAttr(role,ATTR_EXTEND2)		--ռ������
	local ZBstate=GetChaAttr(role, ATTR_EXTEND1)	--
	local ZBstate1=math.floor(ZBstate/10)			--ռ��Ч��ע��
	local ZBstate2=math.fmod(ZBstate,10)				--ռ������
	local now_day=os.date("%d")
	now_day=tonumber(now_day)
	local ZBforgeXG=0
	local ZBStateLV={}
	ZBStateLV[1] = {}
			ZBStateLV[1][1] = 10								
			ZBStateLV[1][2] = 8												
			ZBStateLV[1][3] = 6												
			ZBStateLV[1][4] = 4												
			ZBStateLV[1][5] = 2
	if now_day==ZBday and ZBstate2==2 and ZBstate1>= 1 and ZBstate1<=5 then
		ZBforgeXG=ZBStateLV[1][ZBstate1]/100
	end
	return ZBforgeXG
end		
--��ʼ����

function begin_forge_item(...)
	local arg = {...}
--	Notice("���뾫��")

	local Check_CanForge = 0
	Check_CanForge = can_forge_item_main ( arg )

	if Check_CanForge == 0 then
		return 0
	end


	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local ItemBag_Jinglian = ItemBag [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Item_Stone1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Stone2 = GetChaItem ( role , 2 , ItemBag [2] )

	local Check_Jinglian_Item = 0

	local Money_Need = getforge_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Ŀǰ��"..Money_Have.."��ô���Ǯ")
--	Notice ("Ҫ�۳�"..Money_Need.."��ô���Ǯ")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	local ItemID_Jinglian = GetItemID ( Item_Jinglian )
----------------	
	local Jinglian_Lv_Now = GetItem_JinglianLv ( Item_Jinglian )
----------------
	local Num = GetItemForgeParam ( Item_Jinglian , 1 )
	Num = TansferNum ( Num )

	local Stone1Type = GetItemType ( Item_Stone1 )
	local Stone2Type = GetItemType ( Item_Stone2 )

	local Baoshi = 0

	if Stone1Type == 49 then
		Baoshi = Item_Stone1
	elseif Stone2Type == 49 then
		Baoshi = Item_Stone2
	end
	
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Baoshi_NeedLv = 1

	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	BaoshiType = GetStone_TypeID ( Baoshi )

	for i = 0 , 2 ,1 do
		if BaoshiType == Item_Stone[i] then
			Baoshi_NeedLv = Item_StoneLv[i] + 1
		end
	end
----------------
	local Sklv = 1
	local StateLv = GetChaStateLv ( role , STATE_JLGLJB )
	local State100 = GetChaStateLv ( role , STATE_JLBYS )
	
	Sklv = Sklv + StateLv
	local ZBforgeXG=ZBforge(role )

	local Check_A = math.max ( 0.02 , math.min ( 1 , ( 1.1 - Baoshi_NeedLv * 0.1 + Sklv * 0.15 +ZBforgeXG ) ) )
		--Notice("Check_A"..Check_A)
		if Baoshi_NeedLv == 3 or Baoshi_NeedLv == 4 or Baoshi_NeedLv == 5 or Baoshi_NeedLv == 6 or Baoshi_NeedLv ==7 or Baoshi_NeedLv == 8 or Baoshi_NeedLv== 9 then  ---------�������Ͱٷ�֮ʮ
	
			Check_A=Check_A - 0.33
		end
		--Notice("Check_A"..Check_A)
	local CheckFaild = Percentage_Random ( Check_A )
	if State100 == 10 then 
		if Baoshi_NeedLv < 8 then
			CheckFaild = 1	
		CALCULATE_FORGE_LUA_000025 = GetResString("CALCULATE_FORGE_LUA_000025")
		SystemNotice( role , CALCULATE_FORGE_LUA_000025)	
		end
	end
	
	if State100 == 11 then 
		if Baoshi_NeedLv > 7 then
			CheckFaild = 1	
		CALCULATE_FORGE_LUA_000025 = GetResString("CALCULATE_FORGE_LUA_000025")
		SystemNotice( role , CALCULATE_FORGE_LUA_000025)	
		end
	end	
	
	if Baoshi_NeedLv < 6 then
		CheckFaild = 1
	end
	
	local ItemID_Stone1 = GetItemID ( Item_Stone1 )
	local ItemID_Stone2 = GetItemID ( Item_Stone2 )

	local Stone1_Lv = Get_StoneLv ( Item_Stone1 )
	local Stone2_Lv = Get_StoneLv ( Item_Stone2 )
	local Jinglianshi_Lv = 0
	local Jinglian_Lv = GetItem_JinglianLv ( Item_Jinglian )
	if Stone1_Lv > Stone2_Lv then
		Jinglianshi_Lv = Stone1_Lv
	else
		Jinglianshi_Lv = Stone2_Lv
	end



	local R1 = 0
	local R2 = 0
	
	
	if CheckFaild == 1 then
		Check_Jinglian_Item = Jinglian_Item ( Item_Jinglian , Item_Stone1 , Item_Stone2 )
		SynChaKitbag(role,13)
		R1 = RemoveChaItem ( role , ItemID_Stone1 , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )		--�Ƴ���ʯ1
		R2 = RemoveChaItem ( role , ItemID_Stone2 , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		--�Ƴ���ʯ2
		if R1 == 0 or R2 == 0 then
			CALCULATE_FORGE_LUA_000026 = GetResString("CALCULATE_FORGE_LUA_000026")
			LG( "Jinglian" , CALCULATE_FORGE_LUA_000026 )
		end		
		ReSetForgeAttr ( Item_Jinglian )	
		--	Notice("��������")
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
		CALCULATE_FORGE_LUA_000027 = GetResString("CALCULATE_FORGE_LUA_000027")
		CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
		LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000027..Item_Jinglian_name )
		return 1
	else
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
		CALCULATE_FORGE_LUA_000028 = GetResString("CALCULATE_FORGE_LUA_000028")
		CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
		LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000028..Item_Jinglian_name )
		CALCULATE_FORGE_LUA_000029 = GetResString("CALCULATE_FORGE_LUA_000029")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000029 )
		R1 = RemoveChaItem ( role , ItemID_Stone1 , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )		--�Ƴ���ʯ1
		R2 = RemoveChaItem ( role , ItemID_Stone2 , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		--�Ƴ���ʯ2
		if R2 == 0 then
			CALCULATE_FORGE_LUA_000026 = GetResString("CALCULATE_FORGE_LUA_000026")
			LG( "Jinglian" , CALCULATE_FORGE_LUA_000026 )
		end
		ReSetForgeAttr ( Item_Jinglian )		
		return 2
	end
------------------

	

	
--	SystemNotice(role , "����ʧ��")
	
	


--	local a = 0.75
	local b = Check_CG_Jinglian ( Jinglian_Lv , Jinglianshi_Lv , Sklv )
	if b == 0 then
		i = RemoveChaItem ( role , ItemID_Jinglian , 1 , 2 , ItemBag [0] , 2 , 1 , 0)		--�Ƴ���ʯ	
		if i == 0 then
			CALCULATE_FORGE_LUA_000009 = GetResString("CALCULATE_FORGE_LUA_000009")
			LG( "Hecheng_BS" , CALCULATE_FORGE_LUA_000009 )
		end
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
		CALCULATE_FORGE_LUA_000030 = GetResString("CALCULATE_FORGE_LUA_000030")
		CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
		LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000030..Item_Jinglian_name )
		CALCULATE_FORGE_LUA_000031 = GetResString("CALCULATE_FORGE_LUA_000031")
		SystemNotice( role , CALCULATE_FORGE_LUA_000031)
		return 2	
	end

end

--���㾫������

function get_item_forge_money(...)
	local arg = {...}
--	Notice("�������")
	local Money = getforge_money_main ( arg )
	return Money
end


--���㾫������������

function getforge_money_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_Jinglian = ItemBag [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Jinglian_Lv = 0

	Jinglian_Lv =  GetItem_JinglianLv ( Item_Jinglian )
	Jinglian_Lv = Jinglian_Lv + 1

	local Money_Need
	if Jinglian_Lv == 1 then
	Money_Need = 10000
	end
	if Jinglian_Lv > 1 then
	Money_Need = Jinglian_Lv * 10000
	end
	
	--local Money_Need = Jinglian_Lv * 100000
--	Notice("�������")
	return Money_Need
end



----��غ���--------------------------------------------------------------------------------------------------------



function Get_StoneLv ( Item )								--��ȡ��ʯ�ȼ�
	local Lv = GetItemAttr ( Item , ITEMATTR_VAL_BaoshiLV )
	return Lv
end


function Set_StoneLv ( Item , Item_Lv )							--���ñ�ʯ�ȼ�
	local i = 0
	i = SetItemAttr ( Item , ITEMATTR_VAL_BaoshiLV , Item_Lv )
	if i == 0 then
		CALCULATE_FORGE_LUA_000032 = GetResString("CALCULATE_FORGE_LUA_000032")
		LG( "Hecheng_BS",CALCULATE_FORGE_LUA_000032 )
	end
end


--���װ���Ƿ�ɱ�����

function CheckItem_CanJinglian ( Item )
--	Notice ("CheckItem_CanJinglian ")

	local Item_Type = GetItemType ( Item )
	local XZB_ItemID = GetItemID ( Item )
	
	if XZB_ItemID >= 7294 and XZB_ItemID <= 7329 then
		SystemNotice( role ,"I am sorry but this equipment is not suit for refining!")
		return 0
	end
	local i = 0
	for i = 0 , Item_CanJinglian_Num  , 1 do
		if Item_Type == Item_CanJinglian_ID [i] then
			return 1
		end
	end
	
	return 0
	
end


---����Ƿ����㹻�Ķ�����

function CheckItem_HaveHole ( Item , Stone1 , Stone2)
--	Notice ("CheckItem_HaveHole")
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
	local Hole = GetNum_Part1 ( Num )
	local Item_Stone = {} 
	local Stone1TypeID = 0
	local Stone2TypeID = 0
	
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	local i = 0
	local Hole_empty = 0
	
	for i = 0 , 2 , 1 do
		if Item_Stone[i] == 0 then
			Hole_empty = Hole_empty + 1
		end

		Stone1TypeID = GetStone_TypeID ( Stone1 )
		Stone2TypeID = GetStone_TypeID ( Stone2 )


		if Item_Stone[i] == Stone1TypeID or Item_Stone[i] == Stone2TypeID then

			return 1
		end
	end
	
	local Hole_Used = 3 - Hole_empty
	
	if Hole_Used >= Hole then
		return 0
	else
		return 1
	end

	
end

--��鱦ʯ�ȼ��Ƿ��㹻

function Check_StoneLv ( Item , Stone1 , Stone2 )
--	Notice ("Check_StoneLv")
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
--	Notice ( Num )
	local Jinglian_Lv =  GetItem_JinglianLv ( Item )
--	Notice ( Jinglian_Lv )
	local Stone1Type = GetItemType ( Stone1 )
	local Stone2Type = GetItemType ( Stone2 )
--	Notice (Stone1Type)
--	Notice (Stone2Type)
	local Jinglianshi = 0
	local Jinglianshi_Lv = 0
	local Baoshi = 0
	local Baoshi_Lv = 0
	local Baoshi_NeedLv = 0

	if Stone1Type == 50 then
		Jinglianshi = Stone1
	elseif 	Stone2Type == 50 then
		Jinglianshi = Stone2
	end
	
	if Stone1Type == 49 then
		Baoshi = Stone1
	elseif Stone2Type == 49 then
		Baoshi = Stone2
	end
	
	Jinglianshi_Lv = Get_StoneLv ( Jinglianshi )
	Baoshi_Lv = Get_StoneLv ( Baoshi )
	local baoShiID = GetItemID(Baoshi)
	local jingLianShiID = GetItemID(Jinglianshi)
	if jingLianShiID== 6717 and baoShiID~=6718 then 
		return -1 
	end

--	Notice("Jinglianshi_Lv= "..Jinglianshi_Lv)
--	Notice("Baoshi_Lv= "..Baoshi_Lv)

	local Item_Stone = {}
	local Item_StoneLv = {}
	
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	BaoshiType = GetStone_TypeID ( Baoshi )

--	Notice("BaoshiType= "..BaoshiType)
	local i = 0

	for i = 0 , 2 ,1 do
		if BaoshiType == Item_Stone[i] then
			Baoshi_NeedLv = Item_StoneLv[i] + 1
		end
	end
	if Baoshi_NeedLv>=10 then 
		return 0 
	end
	local Jinglianshi_NeedLv = Baoshi_NeedLv	
	
	if Baoshi_Lv < Baoshi_NeedLv then
--		Notice("��ʯ�ȼ�����")
		return 0
	end

	if Jinglianshi_Lv < Jinglianshi_NeedLv then
--		Notice("����ʯ�ȼ�����")
		return 0
	end
--	Notice("���سɹ�")
	return 1

end


---��ʼ����

function Jinglian_Item ( Item , Stone1 , Stone2 )
--	Notice("Jinglian_Item")
	
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
	local Jinglian_Lv =  GetItem_JinglianLv ( Item )
	local Stone1Type = GetItemType ( Stone1 )
	local Stone2Type = GetItemType ( Stone2 )
	local Baoshi = 0
	local Num_New = Num

	if Stone1Type == 49 then
		Baoshi = Stone1
	elseif Stone2Type == 49 then
		Baoshi = Stone2
	end
	

	
	Num_New = SetJinglian_Lv ( Baoshi , Baoshi_Lv , Num )

--	Notice(Num_New)
	local i = 0
	
	i = SetItemForgeParam ( Item , 1 , Num_New )
	
	if i == 0 then
		CALCULATE_FORGE_LUA_000033 = GetResString("CALCULATE_FORGE_LUA_000033")
		LG( "Jinglian" , CALCULATE_FORGE_LUA_000033 )
	end

	local Item_URE_Add = 0
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	if Item_MAXURE < 600 then
		Item_MAXURE = math.min ( ( Item_MAXURE + Item_URE_Add ) , 600 )
	end
	
	local j = 0
	j = SetItemAttr ( Item , ITEMATTR_MAXURE , Item_MAXURE )
	
	if j == 0 then
		CALCULATE_FORGE_LUA_000034 = GetResString("CALCULATE_FORGE_LUA_000034")
		LG( "Jinglian" , CALCULATE_FORGE_LUA_000034)
	end
	

	if Num_New == Num then
--		Notice("��������δ�ı�")
	end

		
	return 1	

end


--���������ϱ�ʯ������


function SetJinglian_Lv ( Baoshi , Baoshi_Lv , Num )
	
--	Notice ("SetJinglian_Lv")
--	Notice (Num)
	local Baoshi_Lv = 0
	Baoshi_Lv = Get_StoneLv ( Baoshi )
	
	local Item_Stone = {}
	local Item_StoneLv = {}
		
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )



	BaoshiType = GetStone_TypeID ( Baoshi )

--	Notice("BaoshiType= "..BaoshiType)
	
	local i = 0
	local Stone_Check = 0

	for i = 0 , 2 , 1 do
		if BaoshiType == Item_Stone [i] then
			Item_StoneLv [i] = Item_StoneLv [i] + 1
			Stone_Check = i + 1
			if Item_StoneLv [i]>=10 then 
				Item_StoneLv [i]=9 
			end
		end
	end

	if Stone_Check == 1 then
		Num = SetNum_Part3 ( Num , Item_StoneLv[0] )
	elseif Stone_Check == 2 then
		Num = SetNum_Part5 ( Num , Item_StoneLv[1] )
	elseif Stone_Check == 3 then
		Num = SetNum_Part7 ( Num , Item_StoneLv[2] )
	elseif Stone_Check == 0 then
		local Check_empty = 0
		for i = 2 , 0 , -1 do
			if Item_Stone[i] == 0 then
				Check_empty = i + 1
			end
		end

		if Check_empty == 1 then
			Num = SetNum_Part2 ( Num , BaoshiType )
			Num = SetNum_Part3 ( Num , 1 )
		elseif Check_empty == 2 then
			Num = SetNum_Part4 ( Num , BaoshiType )
			Num = SetNum_Part5 ( Num , 1 )
		elseif Check_empty == 3 then
			Num = SetNum_Part6 ( Num , BaoshiType )
			Num = SetNum_Part7 ( Num , 1 )
		end
	end
	
--	Notice("SetJinglian_Lv����")
	return Num
end

--ȡ��ʯ����ID

function GetStone_TypeID ( Stone )
--	Notice ("GetStone_TypeID")


	local StoneID = GetItemID ( Stone )
	local i = 0
	for i = 1 , StoneTpye_ID_Num , 1 do
--		Notice ( StoneTpye_ID[i] )
		if StoneTpye_ID[i] == StoneID then
			return i
		end
	end
	return -1
end


----������ݽ���

function Read_Table ( Table )
--	Notice("Read_Table")
	local role = Table [1]										--???
--	Notice(role)
--	Notice(Table.n)
	local ItemBag = {}										--???????��??
	local ItemCount = {}										--????????
	local ItemBagCount = {}										--???????????
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 2
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_New = 0
	local i = 0
	local j = 0
	

	for i = 0 , Get_Count , 1 do
		
		if ItemReadNow <= #Table then
			ItemBagCount [i] = Table [ItemReadNow]
--			SystemNotice ( role , "aaa  "..ItemBagCount [i] )
			ItemBagCount_New = ItemBagCount_New + 1
--			Notice("ItemBagCount= "..ItemBagCount [i])
			ItemReadNow = ItemReadNow + 1
			ItemReadNext = ItemReadNow + 2 * ( ItemBagCount [i] - 1 )
			ItemReadCount = ItemReadNow
			if ItemBagCount [i] ~= 0  then
				for j = ItemReadCount , ItemReadNext , 2 do
					ItemBag [ItemBag_Now] = Table [j]
--					SystemNotice(role , "aaa  "..ItemBag [ItemBag_Now])
--					Notice("ItemBag= "..ItemBag [ItemBag_Now])
					ItemBag_Now = ItemBag_Now + 1
					ItemCount [ItemCount_Now] = Table [ j+1 ]
--					SystemNotice(role , "aaa  "..ItemCount[ItemCount_Now])
--					Notice("ItemCount= "..ItemCount [ItemCount_Now])
					ItemCount_Now = ItemCount_Now + 1
					ItemReadNow = ItemReadNow + 2
				end
			end
		else
			ItemBagCount [i] = 0
--			SystemNotice ( role , "aaa  "..ItemBagCount [i] )
--			Notice(ItemBagCount [i])
		end
	end
--	Notice("1111")
	return role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_New
end


--���߾�����������
function ReSetForgeAttr(Item)
		local Item_TypeCheck = GetItemType ( Item )

	if Item_TypeCheck == 59 then
		return
	end
	ResetItemFinalAttr( Item )
--	Notice ("check_item_final_data")
	local Num = GetItemForgeParam ( Item , 1 )
	if Num== 0 then 
		return 
	end
	Num = TansferNum ( Num )

--	Notice(Num)
	local StoneInfo = {}
	local StoneLv = {}
	--local ResetCheck = 0
	--ResetCheck = ResetItemFinalAttr( Item )
	
	--if ResetCheck == 0 then
		---Notice("ResetCheckʧ��")
		--LG("check_item_final","ResetCheckʧ��")
		--return
	--end 
	StoneInfo[0]=0
	StoneInfo[1]=0
	StoneInfo[2]=0
	StoneLv[0]=0
	StoneLv[1]=0
	StoneLv[2]=0
	StoneInfo[0],StoneInfo[1],StoneInfo[2],StoneLv[0],StoneLv[1],StoneLv[2] = CheckStoneInfo ( Num )

	local AddCheck = 0

	local i = 0
	local j = 0
	for i = 0 , 2 , 1 do
		if StoneInfo [i] ~= nil and StoneInfo [i] ~=0  then
--			Notice("StoneInfo"..i.."= "..StoneInfo [i])
			if StoneAttrType[StoneInfo [i]] == ITEMATTR_VAL_MNATK then
--				Notice("�ӹ�����")
				local Itemattr_Type1 = StoneAttrType[StoneInfo [i]]
				local Itemattr_Type2 = Itemattr_Type1 + 1
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
--				local Item_attr1 = GetItemAttr ( Item , Itemattr_Type1 )
--				local Item_attr2 = GetItemAttr ( Item , Itemattr_Type2 )

--				local Item_Newattr1 = Item_attr1 + ItemAttrEff
--				local Item_Newattr2 = Item_attr2 + ItemAttrEff
				
--				Notice ( "Itemattr_Type1= "..Itemattr_Type1.." Itemattr_Type2= "..Itemattr_Type2)
--				Notice ( "ItemAttrEff= "..ItemAttrEff)
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type1 , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type2 , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end
			else
				local Itemattr_Type = StoneAttrType[StoneInfo [i]]
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
				--local ItemAttrEff = StoneEff[StoneInfo [i]] * StoneLv[i]

--				local Item_attr = GetItemAttr ( Item , Itemattr_Type )
--				local Item_Newattr = Item_attr + ItemAttrEff

				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end

			end
		end
	end
end
function check_item_final_data ( Item )
	local Item_TypeCheck = GetItemType ( Item )
	if Item_TypeCheck == 59 then
		return
	end
--	Notice ("check_item_final_data")
	local Num = GetItemForgeParam ( Item , 1 )
	if Num== 0 then 
		return 
	end
	Num = TansferNum ( Num )
--	Notice(Num)
	local StoneInfo = {}
	local StoneLv = {}
	--local ResetCheck = 0
	--ResetCheck = ResetItemFinalAttr( Item )
	
	--if ResetCheck == 0 then
		---Notice("ResetCheckʧ��")
		--LG("check_item_final","ResetCheckʧ��")
		--return
	--end 
	StoneInfo[0]=0
	StoneInfo[1]=0
	StoneInfo[2]=0
	StoneLv[0]=0
	StoneLv[1]=0
	StoneLv[2]=0
	StoneInfo[0],StoneInfo[1],StoneInfo[2],StoneLv[0],StoneLv[1],StoneLv[2] = CheckStoneInfo ( Num )

	local AddCheck = 0

	local i = 0
	local j = 0
	for i = 0 , 2 , 1 do
		if StoneInfo [i] ~= nil and StoneInfo [i] ~=0  then
--			Notice("StoneInfo"..i.."= "..StoneInfo [i])
			if StoneAttrType[StoneInfo [i]] == ITEMATTR_VAL_MNATK then
--				Notice("�ӹ�����")
				local Itemattr_Type1 = StoneAttrType[StoneInfo [i]]
				local Itemattr_Type2 = Itemattr_Type1 + 1
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
--				local Item_attr1 = GetItemAttr ( Item , Itemattr_Type1 )
--				local Item_attr2 = GetItemAttr ( Item , Itemattr_Type2 )

--				local Item_Newattr1 = Item_attr1 + ItemAttrEff
--				local Item_Newattr2 = Item_attr2 + ItemAttrEff
				
--				Notice ( "Itemattr_Type1= "..Itemattr_Type1.." Itemattr_Type2= "..Itemattr_Type2)
--				Notice ( "ItemAttrEff= "..ItemAttrEff)
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type1 , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type2 , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end
			else
				local Itemattr_Type = StoneAttrType[StoneInfo [i]]
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
				--local ItemAttrEff = StoneEff[StoneInfo [i]] * StoneLv[i]

--				local Item_attr = GetItemAttr ( Item , Itemattr_Type )
--				local Item_Newattr = Item_attr + ItemAttrEff

				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end

			end
		end
	end
end

--��鱦ʯ�ɾ�����������

function Check_StoneItemType ( Item , Stone1 , Stone2 )
--	Notice ("Check_StoneItemType")
	local Stone1Type = GetItemType ( Stone1 )
	local Stone2Type = GetItemType ( Stone2 )
	local Baoshi = 0
	local ItemType = GetItemType ( Item )
	
	if Stone1Type == 49 then
		Baoshi = Stone1
	elseif Stone2Type == 49 then
		Baoshi = Stone2
	end

	local Baoshi_ID = GetItemID ( Baoshi )
	local i = 0
	local Baoshi_TypeID = 0
	
	for i = 1 , StoneAttrType_Num , 1 do
		if Baoshi_ID == StoneTpye_ID[i] then
			Baoshi_TypeID = i
		end
	end
	if Baoshi_ID == 6718 then
		local itemLV=GetItemLv(Item)
		if itemLV>40 then 
			return -1
		end
	end

	for i = 0 , 15 , 1 do
		if ItemType == StoneItemType[Baoshi_TypeID][i] then
			return 1
		end
		if StoneItemType[Baoshi_TypeID][i] == 0 then
--			Notice ("����ʧ��")
			return 0
		end
	end
--	Notice ("����ʧ��")
	return 0
end

--ȡ�����ȼ�

function GetItem_JinglianLv ( Item )
--	Notice ("GetItem_JinglianLv")
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
	local Item_StoneLv = {}
	local JinglianLv = 0
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	JinglianLv = Item_StoneLv[0] + Item_StoneLv[1] + Item_StoneLv[2]

	return JinglianLv
end


--��ȡ�����ϱ�ʯ��Ϣ
function CheckStoneInfo( Num )

	local Item_Stone = {}
	local Item_StoneLv = {}
		
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	return Item_Stone[0],Item_Stone[1],Item_Stone[2],Item_StoneLv[0],Item_StoneLv[1],Item_StoneLv[2]
end



function Check_CG_HechengBS ( Item_Lv , Item_Type , Sklv )
	local a = 0
	local b = 0
	Item_Lv = Item_Lv - 1
	if Item_Type == 49 then
		a = math.max ( 0 , math.min ( 1 , ( 0.9 - Item_Lv * 0.05 + Sklv * 0.1) ) )
				--Notice("Percentage_Random ( a )"..a)
			if Item_Lv == 3 or Item_Lv == 4 or Item_Lv == 5 or Item_Lv == 6 or Item_Lv ==7 or Item_Lv == 8 or Item_Lv== 9 then
				a = a - 0.3
			end
				--Notice("Percentage_Random ( a )"..a)		
		b = Percentage_Random ( a )
		
		if Item_Lv < 5 then
			b = 1
		end
		return b
	elseif Item_Type == 50 then
		a = math.max ( 0 , math.min ( 1 , ( 0.9 - Item_Lv * 0.05 + Sklv * 0.1 ) ) )
				--Notice("Percentage_Random ( a )"..a)
			if Item_Lv == 6 or Item_Lv ==7 or Item_Lv == 8 or Item_Lv== 9 then
				a = a - 0.3
			end
				--Notice("Percentage_Random ( a )"..a)
		b = Percentage_Random ( a )
		if Item_Lv < 5 then
			b = 1
		end
		return b
	else
		CALCULATE_FORGE_LUA_000036 = GetResString("CALCULATE_FORGE_LUA_000036")
		LG( "Hecheng_BS",CALCULATE_FORGE_LUA_000036 )
		return 0
	end
end
------------------------by Chaos
function Check_CG_Jinglian ( Jinglian_Lv , Stone_Lv , Sklv )
--	local a = 0
	local b = 0

--	a = math.max ( 0.02 , math.min ( 1 , ( 1 - Jinglian_Lv  * 0.05 + Sklv * 0.15 - 0.3 ) ) )
--	b = Percentage_Random ( a )
--	if Jinglian_Lv <= 8 then
		b = 1
--	end
	return b
end


--�����ʯ���ࡪ��������������������������������������������������������������������������
function Roll_DiamondId ( cha ) 
	local a = math.random ( 1 , 8 ) 
	local DiamondId = StoneTpye_ID [ a ] 
	return DiamondId  
end 


--1����ʯ�һ���������������������������������������������������������������������������������������������������������
function Transfer_DiamondScript_Lv1 ( role )			
	local cha = TurnToCha ( role ) 
	local x_give = 0 
	local y_give = 0 
	local script_count = CheckBagItem ( cha , 3877 )					--��鱳���жһ�ȯ����
	
	local DiamondId = Roll_DiamondId ( cha )						--����һ���ʯ������
	if script_count >= 1  then 
		x_del = DelBagItem ( cha , 3877 , 1 ) 
		if x_del == 1 then 
			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 101 )				--�һ���ʯ
			y_give = GiveItem ( cha , 0 , 885 , 1 , 101 )					--�һ�����ʯ
		else 
			CALCULATE_FORGE_LUA_000037 = GetResString("CALCULATE_FORGE_LUA_000037")
			SystemNotice ( cha , CALCULATE_FORGE_LUA_000037 ) 
		end 
	else 
		CALCULATE_FORGE_LUA_000038 = GetResString("CALCULATE_FORGE_LUA_000038")
		SystemNotice ( cha , CALCULATE_FORGE_LUA_000038  ) 
	end 
	if x_give == 1 and y_give ==1 then 
		return 1 
	else 
		return 0 
	end 
end 


--2����ʯ�һ���������������������������������������������������������������������������������������������������������
function Transfer_DiamondScript_Lv2 ( role )			
	local cha = TurnToCha ( role ) 
	local x_give = 0 
	local y_give = 0 
	local script_count = CheckBagItem ( cha , 3878 )					--��鱳���жһ�ȯ����
	local DiamondId = Roll_DiamondId ( cha )						--����һ���ʯ������
	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 3878 , 1 ) 
		if x_del == 1 then 
			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 102 )				--�һ���ʯ

			y_give = GiveItem ( cha , 0 , 885 , 1 , 102 )					--�һ�����ʯ


		else 
			CALCULATE_FORGE_LUA_000037 = GetResString("CALCULATE_FORGE_LUA_000037")
			SystemNotice ( cha , CALCULATE_FORGE_LUA_000037 ) 
		end 
	else 
		CALCULATE_FORGE_LUA_000039 = GetResString("CALCULATE_FORGE_LUA_000039")
		SystemNotice ( cha , CALCULATE_FORGE_LUA_000039  ) 
	end 
	if x_give == 1 and y_give ==1 then 
		return 1 
	else 
		return 0 
	end 
end 
-------------------------------ʥ��ף��
function GetChaName_0 ( role,npc  )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local item_num = CheckBagItem( role, 2887 )
	if Money_Need > Money_Have or item_num <=0 then
		CALCULATE_FORGE_LUA_000040 = GetResString("CALCULATE_FORGE_LUA_000040")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000040)
	else

	end
	if Money_Have >= Money_Need and item_num >0 then
		TakeMoney(role,nil,Money_Need)
		TakeItem( role, 0,2887, 1 )
		PlayEffect( npc, 361 )
		CALCULATE_FORGE_LUA_000041 = GetResString("CALCULATE_FORGE_LUA_000041")
		CALCULATE_FORGE_LUA_000042 = GetResString("CALCULATE_FORGE_LUA_000042")
		ScrollNotice(CALCULATE_FORGE_LUA_000042..cha_name..CALCULATE_FORGE_LUA_000041,1)
	else
	end
end
-------------------------------------------
function GetChaName_1 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local item_num = CheckBagItem( role, 2887 )
	if Money_Need > Money_Have or item_num <=0 then
		CALCULATE_FORGE_LUA_000040 = GetResString("CALCULATE_FORGE_LUA_000040")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000040)
	else

	end
	if Money_Have >= Money_Need and item_num >0 then
		TakeMoney(role,nil,Money_Need)
		TakeItem( role, 0,2887, 1 )
		PlayEffect( npc, 361 )
		CALCULATE_FORGE_LUA_000043 = GetResString("CALCULATE_FORGE_LUA_000043")
		CALCULATE_FORGE_LUA_000042 = GetResString("CALCULATE_FORGE_LUA_000042")
		ScrollNotice(CALCULATE_FORGE_LUA_000042..cha_name..CALCULATE_FORGE_LUA_000043,1)
	else
	end
end
---------------------------------------
function GetChaName_2 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local item_num = CheckBagItem( role, 2887 )
	if Money_Need > Money_Have or item_num <=0 then
		CALCULATE_FORGE_LUA_000040 = GetResString("CALCULATE_FORGE_LUA_000040")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000040)
	else

	end
	if Money_Have >= Money_Need and item_num >0 then
		TakeMoney(role,nil,Money_Need)
		TakeItem( role, 0,2887, 1 )
		PlayEffect( npc, 361 )
		CALCULATE_FORGE_LUA_000044 = GetResString("CALCULATE_FORGE_LUA_000044")
		CALCULATE_FORGE_LUA_000042 = GetResString("CALCULATE_FORGE_LUA_000042")
		ScrollNotice(CALCULATE_FORGE_LUA_000042..cha_name..CALCULATE_FORGE_LUA_000044,1)
	else
	end
end
-----------------------------------------
function GetChaName_3 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local item_num = CheckBagItem( role, 2887 )
	if Money_Need > Money_Have or item_num <=0 then
		CALCULATE_FORGE_LUA_000040 = GetResString("CALCULATE_FORGE_LUA_000040")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000040)
	else

	end
	if Money_Have >= Money_Need and item_num >0 then
		TakeMoney(role,nil,Money_Need)
		TakeItem( role, 0,2887, 1 )
		PlayEffect( npc, 361 )
		CALCULATE_FORGE_LUA_000045 = GetResString("CALCULATE_FORGE_LUA_000045")
		CALCULATE_FORGE_LUA_000042 = GetResString("CALCULATE_FORGE_LUA_000042")
		ScrollNotice(CALCULATE_FORGE_LUA_000042..cha_name..CALCULATE_FORGE_LUA_000045,1)
		else
	end
end

-----------------------------------------
function GetChaName_26 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local item_num = CheckBagItem( role, 2887 )
	if Money_Need > Money_Have or item_num <=0 then
		CALCULATE_FORGE_LUA_000040 = GetResString("CALCULATE_FORGE_LUA_000040")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000040)
	else

	end
	if Money_Have >= Money_Need and item_num >0 then
		TakeMoney(role,nil,Money_Need)
		TakeItem( role, 0,2887, 1 )
		PlayEffect( npc, 361 )
		CALCULATE_FORGE_LUA_000046 = GetResString("CALCULATE_FORGE_LUA_000046")
		ScrollNotice(""..cha_name..CALCULATE_FORGE_LUA_000046,1)
		else
	end
end

-----------------------------------------
function GetChaName_27 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local item_num = CheckBagItem( role, 2887 )
	if Money_Need > Money_Have or item_num <=0 then
		CALCULATE_FORGE_LUA_000040 = GetResString("CALCULATE_FORGE_LUA_000040")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000040)
	else

	end
	if Money_Have >= Money_Need and item_num >0 then
		TakeMoney(role,nil,Money_Need)
		TakeItem( role, 0,2887, 1 )
		PlayEffect( npc, 361 )
		CALCULATE_FORGE_LUA_000047 = GetResString("CALCULATE_FORGE_LUA_000047")
		ScrollNotice(""..cha_name..CALCULATE_FORGE_LUA_000047,1)
		else
	end
end

-----------------------------------------
function GetChaName_28 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local item_num = CheckBagItem( role, 2887 )
	if Money_Need > Money_Have or item_num <=0 then
		CALCULATE_FORGE_LUA_000040 = GetResString("CALCULATE_FORGE_LUA_000040")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000040)
	else

	end
	if Money_Have >= Money_Need and item_num >0 then
		TakeMoney(role,nil,Money_Need)
		TakeItem( role, 0,2887, 1 )
		PlayEffect( npc, 361 )
		CALCULATE_FORGE_LUA_000048 = GetResString("CALCULATE_FORGE_LUA_000048")
		ScrollNotice(""..cha_name..CALCULATE_FORGE_LUA_000048,1)
		else
	end
end

---------------------------------Leo���Ŷ�֮�Ƕһ�
function Transfer_TeamStar( role , level )
	local cha = TurnToCha ( role )  
	local script_count = CheckBagItem ( cha , 1034 )--ȡ��������			
	local chaLV =  GetChaAttr( cha , ATTR_LV)--ȡ�ȼ�
	local job = GetChaAttr( role, ATTR_JOB) --ȡְҵ

	if script_count >= 1 then
		if chaLV < 41 then
			CALCULATE_FORGE_LUA_000049 = GetResString("CALCULATE_FORGE_LUA_000049")
			SystemNotice(role,CALCULATE_FORGE_LUA_000049)
		else
			if job ~= 12 and job ~= 9 and job ~= 16 and job ~= 8 and job ~= 13 and job ~=14 then
				CALCULATE_FORGE_LUA_000050 = GetResString("CALCULATE_FORGE_LUA_000050")
				SystemNotice(role,CALCULATE_FORGE_LUA_000050)
			else
				local x_del = DelBagItem ( cha , 1034 , 1 ) 
				if x_del == 1 then 
					if job == 12 then	--�ѻ�
						GiveItem( role , 0 , 1409  , 1 , 22 )
					elseif job == 9	then --˫��
						GiveItem( role , 0 , 1392  , 1 , 22 )
					elseif job == 16 then	--����
						GiveItem( role , 0 , 1419  , 1 , 22 )
					elseif job == 8	then --�޽�
						GiveItem( role , 0 , 1382  , 1 , 22 )
					elseif job == 13 then	--ʥְ
						GiveItem( role , 0 ,1433  , 1 , 22 )
					elseif job == 14 then	--��ӡ
						GiveItem( role , 0 , 1467  , 1 , 22 )
					end
				else 
					CALCULATE_FORGE_LUA_000051 = GetResString("CALCULATE_FORGE_LUA_000051")
					SystemNotice ( cha , CALCULATE_FORGE_LUA_000051 ) 
				end 
			end
		end
	else 
		CALCULATE_FORGE_LUA_000052 = GetResString("CALCULATE_FORGE_LUA_000052")
		SystemNotice ( cha , CALCULATE_FORGE_LUA_000052  ) 
	end 
end

--��ʯ�һ���
--Lv1 һ����ʯ�һ�ȯ
--Lv2 ������ʯ�һ�ȯ
--Lv3 ����ʯ�һ�ȯ
--Lv4 ��ʯ�һ�ȯ
function TransferDiamond( role , level )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag

	if level == 1 then
		retbag = HasLeaveBagGrid( role, 2)
			if retbag ~= LUA_TRUE then
				CALCULATE_FORGE_LUA_000054 = GetResString("CALCULATE_FORGE_LUA_000054")
				SystemNotice(role,CALCULATE_FORGE_LUA_000054)
				return 
			end	
		Transfer_DiamondScript_Lv1 ( role )
	elseif level == 5 then 
		retbag = HasLeaveBagGrid( role, 2)
			if retbag ~= LUA_TRUE then
				SystemNotice(role,"You could not exchange it at least you get 2 slots in the inventory.")
				return 
			end
        TransferDiamondScript_Lv1 ( role )
	elseif level == 2 then 
		retbag = HasLeaveBagGrid( role, 2)
			if retbag ~= LUA_TRUE then
				CALCULATE_FORGE_LUA_000054 = GetResString("CALCULATE_FORGE_LUA_000054")
				SystemNotice(role,CALCULATE_FORGE_LUA_000054)
				return 
			end	
		Transfer_DiamondScript_Lv2 ( role )
	elseif level == 3 then
		retbag = HasLeaveBagGrid( role, 1)
			if retbag ~= LUA_TRUE then
				CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
				SystemNotice(role,CALCULATE_FORGE_LUA_000055)
				return 
			end	
		Transfer_OneStoneScript ( role )
	elseif level == 4 then
		retbag = HasLeaveBagGrid( role, 1)
			if retbag ~= LUA_TRUE then
				CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
				SystemNotice(role,CALCULATE_FORGE_LUA_000055)
				return 
			end	
		Transfer_OneDiamondScript ( role )
	else
		CALCULATE_FORGE_LUA_000056 = GetResString("CALCULATE_FORGE_LUA_000056")
		LG( "BSduihuan",CALCULATE_FORGE_LUA_000056 )
	end
end

--����ʯ�һ���

function Transfer_OneStoneScript ( role )
	local cha = TurnToCha ( role ) 
	local y_give = 0 
	
	local script_count = CheckBagItem ( cha , 3885 )					--��鱳���жһ�ȯ����

	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 3885 , 1 ) 
		if x_del == 1 then 
			y_give = GiveItem ( cha , 0 , 885 , 1 , 101 )					--�һ�����ʯ
		else 
			CALCULATE_FORGE_LUA_000037 = GetResString("CALCULATE_FORGE_LUA_000037")
			SystemNotice ( cha , CALCULATE_FORGE_LUA_000037 ) 
		end 
	else 
		CALCULATE_FORGE_LUA_000057 = GetResString("CALCULATE_FORGE_LUA_000057")
		SystemNotice ( cha , CALCULATE_FORGE_LUA_000057  ) 
	end 
	if y_give ==1 then 
		return 1 
	else 
		return 0 
	end
end

--һ����ʯ�һ�ȯ

function Transfer_OneDiamondScript ( role )
	local cha = TurnToCha ( role ) 
	local x_give = 0 
	local y_give = 0 
	local script_count = CheckBagItem ( cha , 3886 )					--��鱳���жһ�ȯ����
	local DiamondId = Roll_DiamondId ( cha )						--����һ���ʯ������
	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 3886 , 1 ) 
		if x_del == 1 then 
			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 101 )				--�һ���ʯ


		else 
			CALCULATE_FORGE_LUA_000037 = GetResString("CALCULATE_FORGE_LUA_000037")
			SystemNotice ( cha , CALCULATE_FORGE_LUA_000037 ) 
		end 
	else 
		CALCULATE_FORGE_LUA_000058 = GetResString("CALCULATE_FORGE_LUA_000058")
		SystemNotice ( cha , CALCULATE_FORGE_LUA_000058  ) 
	end 
	if x_give == 1 then 
		return 1 
	else 
		return 0 
	end 
end 


--�������ݸ�ֵת��
function TansferNum ( Num )
	if Num < 0 then
		Num = Num + 4294967296
	end
	return Num
end


--��ĥ������ؽű�

--�Ƿ���Դ�ĥ
function can_milling_item (...)
	local arg = {...}
--	Notice("��ʼ�ж�")
	if #arg ~= 12 then
--		Notice("���������Ƿ�"..#arg)
		return 0
	end
	
	local kkk = 0
	
--	for kkk = 2 , #arg ,1 do
--		SystemNotice ( arg[1] , arg[kkk])
--	end
	
	local Check = 0
--	SystemNotice( arg[1] , "���úϳɼ��������")
	Check = can_milling_item_main ( arg )
	if Check == 1 then
		
--		SystemNotice (arg[1] , "����1 ")
		return 1
	else
--		SystemNotice (arg[1] , "����0 ")
		return 0
	end
end

--�Ƿ���Դ�ĥ������

function can_milling_item_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

--	SystemNotice( arg[1] , "��ʼ���ò�������")

	
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_damo = ItemBag [0]
	local Item_damo = GetChaItem ( role , 2 , ItemBag_damo )					--��ȡ��ĥ���ߵ�ָ��
	local Item_Cailiao1 = GetChaItem ( role , 2 , ItemBag [1] )					--��ȡ��ĥ����1��ָ��
	local Item_Cailiao2 = GetChaItem ( role , 2 , ItemBag [2] )					--��ȡ��ĥ����2��ָ��

	local Check_Cailiao1 = 0
	local Check_Cailiao2 = 0

	Check_Cailiao1 = Check_Jiaguji ( Item_Cailiao1 , Item_Cailiao2 )
	Check_Cailiao2 = Check_Cuihuafen ( Item_Cailiao1 , Item_Cailiao2 )

	if Check_Cailiao1 == 0 then
		CALCULATE_FORGE_LUA_000059 = GetResString("CALCULATE_FORGE_LUA_000059")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000059 )
		return 0
	end

	if Check_Cailiao2 == 0 then
		CALCULATE_FORGE_LUA_000060 = GetResString("CALCULATE_FORGE_LUA_000060")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000060 )
		return 0
	end
	
	local MJdamo_ItemID = GetItemID (Item_damo)--------����װ���Ƿ���ħ��
	if MJdamo_ItemID >= 7294 and MJdamo_ItemID <= 7329 then
		SystemNotice( role ,"The gear cannot be forged!")
		return 0
	end
	if	MJdamo_ItemID == 6347 then
		CALCULATE_FORGE_LUA_000061 = GetResString("CALCULATE_FORGE_LUA_000061")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000061)
		return 0
	end

	
	local BB95_qiecaidaoId = GetItemID (Item_damo)--------����װ���Ƿ����в˵�
	if	BB95_qiecaidaoId == 6473 then
		CALCULATE_FORGE_LUA_000062 = GetResString("CALCULATE_FORGE_LUA_000062")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000062)
		return 0
	end
	
	local BB95_sheriId = GetItemID (Item_damo)--------����װ���Ƿ�������ר��
	if	BB95_sheriId == 6474 then
		CALCULATE_FORGE_LUA_000063 = GetResString("CALCULATE_FORGE_LUA_000063")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000063)
		return 0
	end
	
	local BB95_ak47Id = GetItemID (Item_damo)--------����װ���Ƿ���AK47
	if	BB95_ak47Id == 6475 then
		CALCULATE_FORGE_LUA_000064 = GetResString("CALCULATE_FORGE_LUA_000064")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000064)
		return 0
	end

	local BB95_shoushudaoId = GetItemID (Item_damo)--------����װ���Ƿ���������
	if	BB95_shoushudaoId == 6476 then
		CALCULATE_FORGE_LUA_000065 = GetResString("CALCULATE_FORGE_LUA_000065")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000065)
		return 0
	end
	
	local BB95_dakandaoId = GetItemID (Item_damo)--------����װ���Ƿ��Ǵ󿳵�
	if	BB95_dakandaoId == 6477 then
		CALCULATE_FORGE_LUA_000066 = GetResString("CALCULATE_FORGE_LUA_000066")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000066)
		return 0
	end
	
	local BB95_laonainaiId = GetItemID (Item_damo)--------����װ���Ƿ��������̵Ĺ���
	if	BB95_laonainaiId == 6478 then
		CALCULATE_FORGE_LUA_000067 = GetResString("CALCULATE_FORGE_LUA_000067")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000067)
		return 0
	end
	
	local BB95_yadiannaId = GetItemID (Item_damo)--------����װ���Ƿ����ŵ��ȵ���
	if	BB95_yadiannaId == 6479 then
		CALCULATE_FORGE_LUA_000068 = GetResString("CALCULATE_FORGE_LUA_000068")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000068)
		return 0
	end
	
	local MianJu = GetItemID (Item_damo)--------����װ���Ƿ���ħ��
	if	MianJu == 1122 or MianJu==1121 then
		CALCULATE_FORGE_LUA_000069 = GetResString("CALCULATE_FORGE_LUA_000069")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000069)
		return 0
	end
	
	local Check_Hole = 0

	Check_Hole = Check_HasHole ( Item_damo )
	
	if Check_Hole >= 3 then
		CALCULATE_FORGE_LUA_000070 = GetResString("CALCULATE_FORGE_LUA_000070")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000070 )
		return 0
	end

	local Money_Need = get_milling_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000071 = GetResString("CALCULATE_FORGE_LUA_000071")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000071)
		return 0
	end

	return 1
end


--�����ĥ����

function get_item_milling_money(...)
	local arg = {...}
--	Notice("�������")
	local Money = get_milling_money_main ( arg )
	return Money
end


--�����ĥ����������

function get_milling_money_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_damo = ItemBag [0]
	local Item_damo = GetChaItem ( role , 2 , ItemBag_damo )
	local Hole_Num = 0

	local Num = GetItemForgeParam ( Item_damo , 1 )
	Num = TansferNum ( Num )
	Hole_Num = GetNum_Part1 ( Num )

	local Money_Need = ( Hole_Num + 1 ) * 50000
	
--	Notice("�������")
	return Money_Need
end

--��ʼ��ĥ

function begin_milling_item (...)
	local arg = {...}
--	Notice("���뾫��")

	local Check_CanMilling = 0
	Check_CanMilling = can_milling_item_main ( arg )

	if Check_CanMilling == 0 then
		return 0
	end


	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local ItemBag_damo = ItemBag [0]
	local Item_damo = GetChaItem ( role , 2 , ItemBag_damo )
	local Item_cailiao1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_cailiao2 = GetChaItem ( role , 2 , ItemBag [2] )


	local Money_Need = get_milling_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Ŀǰ��"..Money_Have.."��ô���Ǯ")
--	Notice ("Ҫ�۳�"..Money_Need.."��ô���Ǯ")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	local ItemID_Cailiao1 = GetItemID ( Item_cailiao1 )
	local ItemID_Cailiao2 = GetItemID ( Item_cailiao2 )

	local R1 = 0
	local R2 = 0

	R1 = RemoveChaItem ( role , ItemID_Cailiao1 , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )		--�Ƴ�����1
	R2 = RemoveChaItem ( role , ItemID_Cailiao2 , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		--�Ƴ�����2

	if R1 == 0 or R2 == 0 then
		CALCULATE_FORGE_LUA_000072 = GetResString("CALCULATE_FORGE_LUA_000072")
		LG( "Damo" , CALCULATE_FORGE_LUA_000072 )
	end
	
	
	local Sklv = 1
	

	local b = Check_CG_damo ( Item_damo , Sklv )
	if b == 0 then
		Damo_Shibai ( role , Item_damo )
		return 2
	end

--	Notice("��������")
	
	Damo_ChengGong ( role , Item_damo )
	local cha_name = GetChaDefaultName ( role )
	CALCULATE_FORGE_LUA_000073 = GetResString("CALCULATE_FORGE_LUA_000073")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000073 )

	return 1

end

--��ĥ��غ���

--����Ƿ��мӹ̼�
function Check_Jiaguji ( Item_Cailiao1 , Item_Cailiao2 )

	local ItemID_Cailiao1 = GetItemID ( Item_Cailiao1 )
	local ItemID_Cailiao2 = GetItemID ( Item_Cailiao2 )

	if ItemID_Cailiao1 == 890 then
		return 1
	elseif ItemID_Cailiao2 == 890 then
		return 1
	end
	
	return 0
end

--����Ƿ��д߻���
function Check_Cuihuafen ( Item_Cailiao1 , Item_Cailiao2 )

	local ItemID_Cailiao1 = GetItemID ( Item_Cailiao1 )
	local ItemID_Cailiao2 = GetItemID ( Item_Cailiao2 )

	if ItemID_Cailiao1 == 891 then
		return 1
	elseif ItemID_Cailiao2 == 891 then
		return 1
	end
	
	return 0
end

--������

function  Check_HasHole ( Item_damo )

	local Num = GetItemForgeParam ( Item_damo , 1 )
	Num = TansferNum ( Num )
	local Hole_Num = GetNum_Part1 ( Num )
	return Hole_Num
end


--�жϴ�ĥ�Ƿ�ɹ�

function Check_CG_damo ( Item_damo , Sklv )

	local a = 0
	local Hole_Num = Check_HasHole ( Item_damo )
	
	if Hole_Num == 0 then
		a = 1
	end

	if Hole_Num == 1 then
		a = 1
	end

	if Hole_Num == 2 then
		a = 0.1
	end

	local b = Percentage_Random ( a )
	
	return b
end

--��ĥʧ��
function Damo_Shibai ( role , Item_damo )
--	local Num = GetItemForgeParam ( Item_damo , 1 )
--	local i = 0
--	Num = TansferNum ( Num )
--	local Hole_Num = GetNum_Part1 ( Num )
	
--	if Hole_Num >= 1 then
--		local a = 0.7
--		local b = Percentage_Random ( a )
--		if b == 0 then
--			SystemNotice ( role , "��ĥʧ���ˣ�װ����ԭ�е�һ������ʧ��" )
--			Hole_Num = Hole_Num - 1
--			Delete_Forge_Eff ( role , Item_damo )
--		else
--			SystemNotice ( role , "��ĥʧ���ˣ�����װ��û����" )
--		end

--	else
		local cha_name = GetChaDefaultName ( role )
		CALCULATE_FORGE_LUA_000074 = GetResString("CALCULATE_FORGE_LUA_000074")
		CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
		LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000074 )
		CALCULATE_FORGE_LUA_000075 = GetResString("CALCULATE_FORGE_LUA_000075")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000075 )
--	end

--	Num = SetNum_Part1 ( Num , Hole_Num )
	
--	i = SetItemForgeParam ( Item_damo , 1 , Num )
--	if i == 0 then
--		LG( "Damo" , "���þ�������ʧ��" )
--	end
end

--��ĥ�ɹ�
function Damo_ChengGong ( role , Item_damo )
	
	local Num = GetItemForgeParam ( Item_damo , 1 )
	local i = 0
	Num = TansferNum ( Num )
	local Hole_Num = GetNum_Part1 ( Num )
	
	if Hole_Num <= 3 then
		CALCULATE_FORGE_LUA_000076 = GetResString("CALCULATE_FORGE_LUA_000076")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000076 )
		Hole_Num = Hole_Num + 1
	else
		CALCULATE_FORGE_LUA_000077 = GetResString("CALCULATE_FORGE_LUA_000077")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000077 )
	end

	Num = SetNum_Part1 ( Num , Hole_Num )
	
	i = SetItemForgeParam ( Item_damo , 1 , Num )
	if i == 0 then
		CALCULATE_FORGE_LUA_000033 = GetResString("CALCULATE_FORGE_LUA_000033")
		LG( "Damo" , CALCULATE_FORGE_LUA_000033 )
	end
end

--ȥ��װ����һ������Ч��
function Delete_Forge_Eff ( role , Item_damo )
	local Jinglian_Lv = GetItem_JinglianLv ( Item_damo )
	if Jinglian_Lv == 0 then
		return
	end
	
	local Num = GetItemForgeParam ( Item_damo , 1 )

	local Item_Stone = {}
	local Item_StoneLv = {}
		
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	local j = 0
	local Del = 0
	for j = 2 , 0 , -1 do
		if Del == 0 then
			if Item_Stone [j] ~= 0 or Item_StoneLv[j] ~= 0 then
				Item_Stone[j] = 0
				Item_StoneLv[j] = 0
				Del = 1
			end
		end
	end
	
	Num = SetNum_Part2( Num , Item_Stone[0] )
	Num = SetNum_Part4( Num , Item_Stone[1] )
	Num = SetNum_Part6( Num , Item_Stone[2] )

	Num = SetNum_Part3( Num , Item_StoneLv[0] )
	Num = SetNum_Part5( Num , Item_StoneLv[1] )
	Num = SetNum_Part7( Num , Item_StoneLv[2] )

	local i = 0
	i = SetItemForgeParam ( Item_damo , 1 , Num )
	if i == 0 then
		CALCULATE_FORGE_LUA_000033 = GetResString("CALCULATE_FORGE_LUA_000033")
		LG( "Damo" , CALCULATE_FORGE_LUA_000033 )
	end

	CALCULATE_FORGE_LUA_000078 = GetResString("CALCULATE_FORGE_LUA_000078")
	SystemNotice ( role , CALCULATE_FORGE_LUA_000078 )
end


--�ۺ�

--�ж��Ƿ��ܹ��ۺϣ��ۺϺ������

function can_fusion_item(...)
	local arg = {...}
--	Notice ( "�ж��Ƿ�����ۺ�")
	if #arg ~= 12 and #arg ~= 14 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end

--	local kkk = 0

--	for kkk = 2 , #arg ,1 do
--		SystemNotice ( arg[1] , arg[kkk])
--	end

	local Check = 0

	Check = can_fusion_item_main ( arg )

	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ�����ۺ�������

function can_fusion_item_main ( Table )
	
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
--------���������ж�
	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		CALCULATE_FORGE_LUA_000079 = GetResString("CALCULATE_FORGE_LUA_000079")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000079)
		return 0
	end
--------ȡ������ָ��
	local Item_Juanzhou = GetChaItem ( role , 2 , ItemBag [0] )	--����ָ��
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag [1] )	--��۵���ָ��
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag [2] )	--���Ե���ָ��


--------���������ж�

	local  ItemType_Juanzhou = GetItemType ( Item_Juanzhou )
	if ItemType_Juanzhou ~= 60 then
		CALCULATE_FORGE_LUA_000080 = GetResString("CALCULATE_FORGE_LUA_000080")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000080)
		return 0
	end
--------��۵���ID�ж�

    local ItemID_Waiguan = GetItemAttr ( Item_Waiguan , ITEMATTR_MAXURE )
	if ItemID_Waiguan ~= 25000 then
		CALCULATE_FORGE_LUA_000081 = GetResString("CALCULATE_FORGE_LUA_000081")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000081)
		return 0
	end

--------��۵����;��ж�
  	local Item_URE = GetItemAttr ( Item_Waiguan , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item_Waiguan , ITEMATTR_MAXURE )
	if	Item_URE < Item_MAXENERGY then
		CALCULATE_FORGE_LUA_000082 = GetResString("CALCULATE_FORGE_LUA_000082")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000082)
		return 0		
	end
--------�����۵����ж�
  	local Item_FUSIONID_star = GetItemAttr ( Item_Shuxing , ITEMATTR_VAL_FUSIONID )
	local ItemID_shuxing_star =  GetItemAttr ( Item_Shuxing ,ITEMATTR_MAXURE )
	if	Item_FUSIONID_star ==0  and ItemID_shuxing_star == 25000 then
		CALCULATE_FORGE_LUA_000083 = GetResString("CALCULATE_FORGE_LUA_000083")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000083)
		return 0		
	end
--------���Ե���ID�ж�
	local ShuXing_ItemID = GetItemID (Item_Shuxing)
	if ShuXing_ItemID >= 7294 and ShuXing_ItemID <= 7329 then
		SystemNotice( role ,"The gear cannot be forged!")
		return 0
	elseif ShuXing_ItemID >= 6165 and ShuXing_ItemID <= 6196 then
		CALCULATE_FORGE_LUA_000084 = GetResString("CALCULATE_FORGE_LUA_000084")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000084)
		return 0
	elseif ShuXing_ItemID >= 6270 and ShuXing_ItemID <= 6293 then
		CALCULATE_FORGE_LUA_000085 = GetResString("CALCULATE_FORGE_LUA_000085")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000085)
		return 0
	elseif ShuXing_ItemID == 6347 then
		CALCULATE_FORGE_LUA_000086 = GetResString("CALCULATE_FORGE_LUA_000086")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000086)
		return 0
	elseif ShuXing_ItemID == 1122 or ShuXing_ItemID == 1121 then
		CALCULATE_FORGE_LUA_000087 = GetResString("CALCULATE_FORGE_LUA_000087")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000087)
		return 0
	elseif ShuXing_ItemID == 6473 then
		CALCULATE_FORGE_LUA_000088 = GetResString("CALCULATE_FORGE_LUA_000088")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000088)
		return 0
	elseif ShuXing_ItemID == 6474 then
		CALCULATE_FORGE_LUA_000089 = GetResString("CALCULATE_FORGE_LUA_000089")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000089)
		return 0
	elseif ShuXing_ItemID == 6475 then
		CALCULATE_FORGE_LUA_000090 = GetResString("CALCULATE_FORGE_LUA_000090")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000090)
		return 0
	elseif ShuXing_ItemID == 6476 then
		CALCULATE_FORGE_LUA_000091 = GetResString("CALCULATE_FORGE_LUA_000091")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000091)
		return 0
	elseif ShuXing_ItemID == 6477 then
		CALCULATE_FORGE_LUA_000092 = GetResString("CALCULATE_FORGE_LUA_000092")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000092)
		return 0
	elseif ShuXing_ItemID == 6478 then
		CALCULATE_FORGE_LUA_000093 = GetResString("CALCULATE_FORGE_LUA_000093")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000093)
		return 0
	elseif ShuXing_ItemID == 6479 then
		CALCULATE_FORGE_LUA_000094 = GetResString("CALCULATE_FORGE_LUA_000094")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000094)
		return 0
	elseif ShuXing_ItemID == 6479 then
		CALCULATE_FORGE_LUA_000094 = GetResString("CALCULATE_FORGE_LUA_000094")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000094)
		return 0	
	elseif ShuXing_ItemID >= 7573 and ShuXing_ItemID <= 7579 then
		CALCULATE_FORGE_LUA_000085 = GetResString("CALCULATE_FORGE_LUA_000085")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000085)
		return 0
		
		
	end	
--------���Ե��������ж�

	local ItemType_Shuxing = GetItemType (Item_Shuxing)
	if  ItemType_Shuxing < 1  then
		CALCULATE_FORGE_LUA_000095 = GetResString("CALCULATE_FORGE_LUA_000095")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000095)
		return 0
	elseif ItemType_Shuxing > 11 and  ItemType_Shuxing < 20 then
		CALCULATE_FORGE_LUA_000095 = GetResString("CALCULATE_FORGE_LUA_000095")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000095)
		return 0
	elseif ItemType_Shuxing > 24  and ItemType_Shuxing ~= 27 then
		CALCULATE_FORGE_LUA_000095 = GetResString("CALCULATE_FORGE_LUA_000095")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000095)
		return 0
	end
--------��ۺ����Ե����Ƿ�Ϊͬһ����
	local ItemType_Shuxing = GetItemType ( Item_Shuxing )
	local ItemType_Waiguan = GetItemType ( Item_Waiguan )
	local star=0
	if ItemType_Shuxing ~= 22 and ItemType_Shuxing ~=27 then ----�Ȳ�������Ҳ�����·�
	star = 1
	end
	if ItemType_Waiguan~=27  then
		if ItemType_Shuxing ~= ItemType_Waiguan then
		CALCULATE_FORGE_LUA_000096 = GetResString("CALCULATE_FORGE_LUA_000096")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000096 )
		return 0
		end 
	elseif ItemType_Waiguan==27 and star == 1 then
		CALCULATE_FORGE_LUA_000096 = GetResString("CALCULATE_FORGE_LUA_000096")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000096 )
		return 0
	end
--------��ۺ����Ե����Ƿ�Ϊͬһ���ͺ�ְҵ����
	local Check_RongHe = 0
	Check_RongHe = CheckFusionItem( Item_Waiguan , Item_Shuxing )
	if Check_RongHe == LUA_FALSE then
		CALCULATE_FORGE_LUA_000097 = GetResString("CALCULATE_FORGE_LUA_000097")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000097 )
		return 0
	end
--------�Ƿ�ŵ��Ǵ߻���
	if ItemBagCount[3] == 0 then

	local Item_Waiguan_name = GetItemName ( ItemID_Waiguan )
	CALCULATE_FORGE_LUA_000098 = GetResString("CALCULATE_FORGE_LUA_000098")
	CALCULATE_FORGE_LUA_000099 = GetResString("CALCULATE_FORGE_LUA_000099")
	LG("Ronghe_CuiHuaJi",CALCULATE_FORGE_LUA_000099,Item_Waiguan_name,CALCULATE_FORGE_LUA_000098)
	end
	if ItemBagCount[3] ~= 0 then
	local Item_Cuihuaji =  GetChaItem ( role , 2 , ItemBag [3] )
	local ItemType_Cuihuaji =  GetItemType ( Item_Cuihuaji )
		if  ItemType_Cuihuaji ~= 61 then
			CALCULATE_FORGE_LUA_000100 = GetResString("CALCULATE_FORGE_LUA_000100")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000100 )
			return 0
		end
	end

--------���Ͻ�Ǯ�ж�
	local Money_Need = getfusion_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000101 = GetResString("CALCULATE_FORGE_LUA_000101")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000101)
		return 0
	end
--SystemNotice(role ,"�жϽ��� ")
	return 1
end


--��ʼ�ۺϣ��ۺ����������

function begin_fusion_item(...)
	local arg = {...}
--	Notice("�����ۺ�")
--------�Ƿ�����ںϼ��
	
	local Check_Canfusion = 0
	Check_Canfusion = can_fusion_item_main ( arg )
	if Check_Canfusion == 0 then
		return 0
	end
--------ȡ������

	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0


	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_Juanzhou = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag [2] )
	local ItemID_Waiguan = GetItemID ( Item_Waiguan )

--------�۳���Ǯ

	local Money_Need = getfusion_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Ŀǰ��"..Money_Have.."��ô���Ǯ")
--	Notice ("Ҫ�۳�"..Money_Need.."��ô���Ǯ")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

--------�ۺϹ���

	Check_Ronghe_Item = ronghe_item ( arg )

	if Check_Ronghe_Item == 0  then
		CALCULATE_FORGE_LUA_000102 = GetResString("CALCULATE_FORGE_LUA_000102")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000102)
	end
	--check_item_final_data ( Item_Waiguan )
	SynChaKitbag(role,13)

--------Notice("�ۺϽ���")


	local cha_name = GetChaDefaultName ( role )
	CALCULATE_FORGE_LUA_000103 = GetResString("CALCULATE_FORGE_LUA_000103")
	SystemNotice ( role ,CALCULATE_FORGE_LUA_000103)
	local Item_Waiguan_name = GetItemName ( ItemID_Waiguan )
	CALCULATE_FORGE_LUA_000103 = GetResString("CALCULATE_FORGE_LUA_000103")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	LG( "Ronghe_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000103..Item_Waiguan_name )
	local ret = HasMission(role,1994)
	if ret == 1	then 
		local name = GetChaDefaultName(role)
		Checkfusion[name]=1
	end
	return 1

end

--�����ۺϷ���

function get_item_fusion_money(...)
	local arg = {...}
--	Notice("�������")
	local Money = getfusion_money_main ( arg )
	return Money
end


--���㾫������������

function getfusion_money_main ( Table )
	
	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_Shuxing = ItemBag [2]
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag_Shuxing )
	local Shuxing_Lv = 0

	local Shuxing_Lv =  GetItemLv ( Item_Shuxing )
	local Money_Need = Shuxing_Lv * 1000

--	Notice("�������")
	return Money_Need
end



----��غ���--------------------------------------------------------------------------------------------------------


---��ʼ�ۺ�

function ronghe_item ( Table )
--	Notice("Ronghe_Item")
	

	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0


	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_Juanzhou = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag [2] )

	local ItemID_Juanzhou = GetItemID ( Item_Juanzhou )
	local ItemID_Waiguan = GetItemID ( Item_Waiguan )
	local ItemID_Shuxing = GetItemID ( Item_Shuxing )
----------------==============
	local ItemID_shuxing_maxure =  GetItemAttr ( Item_Shuxing ,ITEMATTR_MAXURE )

	local ItemID_star = ItemID_Shuxing

	local ItemID_star_maxure = ItemID_shuxing_maxure
	local flg=0
	if ItemBagCount[3] ~= 0 then
		local Item_Cuihuaji = GetChaItem ( role , 2 , ItemBag [3] )
		ItemID_Cuihuaji = GetItemID ( Item_Cuihuaji )
		flg=1
	end
		
	local Jinglianxinxi = GetItemForgeParam ( Item_Shuxing , 1 )
	--------�����ۺϵ��߼�¼ID
----------------==============
	if ItemID_shuxing_maxure == 25000 then
		ItemID_Shuxing = GetItemAttr( Item_Shuxing , ITEMATTR_VAL_FUSIONID )

		SetItemAttr( Item_Waiguan , ITEMATTR_VAL_FUSIONID , ItemID_Shuxing )
	else
		SetItemAttr( Item_Waiguan , ITEMATTR_VAL_FUSIONID , ItemID_Shuxing )
	end

 --------�ۺϵ���

	local Check_FusionItem = FusionItem ( Item_Waiguan, Item_Shuxing )
	---SystemNotice(role,"����;�="..ItemID_shuxing_maxure)

--------�����ۺϵ��ߵȼ�
	local star_lv=0
	if flg==1 then
		if ItemID_shuxing_maxure < 25000 then 
			star_lv=10
		else
			star_lv=GetItemAttr ( Item_Shuxing , ITEMATTR_VAL_LEVEL )                                     -- �����ۺϵ��ߵȼ�
		end
	else 
		star_lv=10
	end
	--SystemNotice( role , "star_lv="..star_lv )
	SetItemAttr ( Item_Waiguan , ITEMATTR_VAL_LEVEL , star_lv )                                     -- �����ۺϵ��ߵȼ�
	--local i = GetItemAttr ( Item_Waiguan , ITEMATTR_VAL_LEVEL )
	--SystemNotice( role , "װ���ȼ�="..i )
	local hole_num = Check_HasHole ( Item_Shuxing )

	if Check_FusionItem == 0    then
		CALCULATE_FORGE_LUA_000104 = GetResString("CALCULATE_FORGE_LUA_000104")
		SystemNotice( role , CALCULATE_FORGE_LUA_000104)
		return
	--	else 
	--		for Check_FusionItem = 1 , 49 , 1 do
	--			RO = GetItemAttr ( Item_Waiguan , Check_FusionItem )
	--			SystemNotice( role , "����"..Check_FusionItem.."="..RO )
	--		end
	end
	--------�Ƴ�����
	----------------------------------
	----------------------------------�˴���LG
	local Item_Shuxing_ENERGY  = GetItemAttr ( Item_Shuxing , ITEMATTR_ENERGY )
	local Item_Shuxing_MAXURE  = GetItemAttr ( Item_Shuxing , ITEMATTR_MAXURE )
	local cha_name = GetChaDefaultName ( role )
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
	    a [i]=GetItemAttr ( Item_Shuxing , i )
		if a [i]~=0 then
	--		SystemNotice( role , a [i] )
				b = b + 1
				num [b]=i
				numAttr [b]=a[i]
		end
	end
	--LG( "ZhuangBeiRH_XinXi" , cha_name , ItemID_Waiguan , ItemID_Shuxing , Item_Shuxing_ENERGY , Item_Shuxing_MAXURE , num[1],numAttr[1],num[2],numAttr[2],num[3],numAttr[3],num[4],numAttr[4],num[5],numAttr[5],Jinglianxinxi,flg)
	LG( "ZhuangBeiRH_XinXi" , cha_name , ItemID_Waiguan , ItemID_Shuxing , Item_Shuxing_ENERGY , Item_Shuxing_MAXURE , STAR_ATTR[num[1]],numAttr[1],STAR_ATTR[num[2]],numAttr[2],STAR_ATTR[num[3]],numAttr[3],STAR_ATTR[num[4]],numAttr[4],STAR_ATTR[num[5]],numAttr[5],Jinglianxinxi,flg)
	-----------ȡ�ںϺ���ߵ�����
	local attr1=GetItemAttr ( Item_Waiguan , num[1] )
	local attr2=GetItemAttr ( Item_Waiguan , num[2] )
	local attr3=GetItemAttr ( Item_Waiguan , num[3] )
	local attr4=GetItemAttr ( Item_Waiguan , num[4] )
	local attr5=GetItemAttr ( Item_Waiguan , num[5] )
	LG( "RHWaiguan_XinXi" , cha_name , ItemID_Waiguan , STAR_ATTR[num[1]],attr1,STAR_ATTR[num[2]],attr2,STAR_ATTR[num[3]],attr3,STAR_ATTR[num[4]],attr4,STAR_ATTR[num[5]],attr5)

	--------------------���������ں�װ���;�
	SetItemAttr ( Item_Waiguan , ITEMATTR_MAXURE , 25000 )
	SetItemAttr ( Item_Waiguan , ITEMATTR_URE , 25000 )
	local R1 = 0
	local R2 = 0
	local R3 = 1
	R1 = RemoveChaItem ( role , ItemID_Juanzhou , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		--�Ƴ��������
	R2 = RemoveChaItem ( role , ItemID_Shuxing , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		--�Ƴ����Ե���
	if ItemID_Cuihuaji ~= 0 then
		R3 = RemoveChaItem ( role , ItemID_Cuihuaji , 1 , 2 , ItemBag [3] , 2 , 1 , 0 )	--�Ƴ��߻�������
	end
	if R1 == 0 or R2 == 0 or R3 == 0 then
		CALCULATE_FORGE_LUA_000105 = GetResString("CALCULATE_FORGE_LUA_000105")
		SystemNotice( role , CALCULATE_FORGE_LUA_000105)
		return
	end

	--------�����ۺϵ��߾�������
	if ItemID_Cuihuaji ~= 0 then
		local Check_SetItemForgeParam = SetItemForgeParam( Item_Waiguan , 1 , Jinglianxinxi )
		if Check_SetItemForgeParam == 0 then
			CALCULATE_FORGE_LUA_000106 = GetResString("CALCULATE_FORGE_LUA_000106")
			SystemNotice( role , CALCULATE_FORGE_LUA_000106)
			return
		end
	else 
		local Part1_Jinglianxinxi = GetNum_Part1 ( Jinglianxinxi )	--Get Num Part 1 �� Part 7
		local Part2_Jinglianxinxi = GetNum_Part2 ( Jinglianxinxi )	
		local Part3_Jinglianxinxi = GetNum_Part3 ( Jinglianxinxi )
		local Part4_Jinglianxinxi = GetNum_Part4 ( Jinglianxinxi )
		local Part5_Jinglianxinxi = GetNum_Part5 ( Jinglianxinxi )
		local Part6_Jinglianxinxi = GetNum_Part6 ( Jinglianxinxi )
		local Part7_Jinglianxinxi = GetNum_Part7 ( Jinglianxinxi )
		Jinglianxinxi = SetNum_Part1 ( Jinglianxinxi , hole_num ) ----------��ת���
		Jinglianxinxi = SetNum_Part2 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part3 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part4 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part5 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part6 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part7 ( Jinglianxinxi , 0 )
		local Check_SetItemForgeParam = SetItemForgeParam( Item_Waiguan , 1 , Jinglianxinxi )
		if Check_SetItemForgeParam == 0 then
			CALCULATE_FORGE_LUA_000106 = GetResString("CALCULATE_FORGE_LUA_000106")
			SystemNotice( role , CALCULATE_FORGE_LUA_000106)
			return
		end	
	end
end

-------------װ������֮ǿ����������
----װ������֮ǿ������
---����Ƿ��ܹ�ǿ������
function can_upgrade_item (...)

--	Notice ( "�ж��Ƿ����ǿ������")
	if #arg ~= 12 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end

	local Check = 0

	Check = can_beuplv_item_main ( arg )

	if Check == 1 then
		return 1
	else
		return 0
	end

end

--����Ƿ����ǿ������������
function can_beuplv_item_main ( Table )


	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	local ItemBagCount_beuplv = ItemBagCount [1]
	local ItemBag_beuplv = ItemBag [1]
	local ItemNum_beuplv = ItemCount [1]
	local Item_beuplv = GetChaItem ( role , 2 , ItemBag_beuplv ) ----ȡ����ָ��

	local Item_beuplv_Type = GetItemType ( Item_beuplv )		----ȡ�ںϵ�������
	local Item_beuplv_ID = GetItemID ( Item_beuplv )		----ȡ�ںϵ���ID
	local Item_ScItem = GetChaItem ( role , 2 , ItemBag [0] )	----ǿ���������ָ��
	local Item_YxItem = GetChaItem ( role , 2 , ItemBag [2] )	----ǿ����ʯ����ָ��
	local Item_ScItem_ID = GetItemID ( Item_ScItem )		----�̳ǵ���ID
	local Item_YxItem_ID = GetItemID ( Item_YxItem )		----��Ϸ����ID
	local Item_ScItem_Type = GetItemType ( Item_ScItem )		----ȡǿ�������������
	local Item_YxItem_Type = GetItemType ( Item_YxItem )		----ȡǿ����ʯ��������


	local Item_beuplv_Lv =  Get_Itembeuplv_Lv ( Item_beuplv )	---ȡ�ں�סװ���ȼ�
	
	local ItemAttr_Val_Fusionid = GetItemAttr ( Item_beuplv , ITEMATTR_VAL_FUSIONID ) -- ȡ����װ���ۺ���ϢID
	----SystemNotice(role,"װ���ȼ�="..Item_beuplv_Lv)

	if Item_beuplv_ID < 5001 or Item_beuplv_ID > 8000 then					--�ж��ںϵ����Ƿ�Ϊ�ں�����
		CALCULATE_FORGE_LUA_000107 = GetResString("CALCULATE_FORGE_LUA_000107")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000107)
		return 0
	end
-------------------------------------------                             --δ�ں�װ����������
	if  ItemAttr_Val_Fusionid == 0 then
		CALCULATE_FORGE_LUA_000108 = GetResString("CALCULATE_FORGE_LUA_000108")
		SystemNotice( role , CALCULATE_FORGE_LUA_000108)
		return 0
	end

-----------------------------------------------
	if Item_beuplv_Lv >= 15 then					--�ж��ںϵ����Ƿ�Ϊ���ȼ�		
		CALCULATE_FORGE_LUA_000109 = GetResString("CALCULATE_FORGE_LUA_000109")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000109)
		return 0
	end
	if ItemBagCount_beuplv ~= 1 then				--�ڶ������ںϵ���
		CALCULATE_FORGE_LUA_000110 = GetResString("CALCULATE_FORGE_LUA_000110")
		SystemNotice( role , CALCULATE_FORGE_LUA_000110)
		return 0
	end
	if Item_ScItem_Type ~= 62 then
		CALCULATE_FORGE_LUA_000111 = GetResString("CALCULATE_FORGE_LUA_000111")
		SystemNotice( role , CALCULATE_FORGE_LUA_000111)
		return 0
	end
	if Item_YxItem_Type ~= 63 then
		CALCULATE_FORGE_LUA_000112 = GetResString("CALCULATE_FORGE_LUA_000112")
		SystemNotice( role , CALCULATE_FORGE_LUA_000112)
		return 0
	end

	if ItemNum_beuplv ~= 1 then
		CALCULATE_FORGE_LUA_000113 = GetResString("CALCULATE_FORGE_LUA_000113")
		SystemNotice( role , CALCULATE_FORGE_LUA_000113)
		return 0
	end

	if ItemCount [0] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [2] ~= 1 then  ----��һ���͵��������̳ǵ��ߺ���Ϸ����
		CALCULATE_FORGE_LUA_000114 = GetResString("CALCULATE_FORGE_LUA_000114")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000114)
		return 0
	end

	local Money_Need = getupgrade_money_main ( Table )

	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000115 = GetResString("CALCULATE_FORGE_LUA_000115")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000115)
		return 0
	end

--SystemNotice(role ,"�жϽ��� ")
	return 1

end



--��ʼǿ������
function begin_upgrade_item (...)



	local Check_Canbeuplv = 0
	Check_Canbeuplv = can_beuplv_item_main ( arg )

	if Check_Canbeuplv == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local ItemBag_beuplv = ItemBag [1]
	local Item_beuplv = GetChaItem ( role , 2 , ItemBag_beuplv )    ----�ں�װ������ָ��
	local Item_ScItem = GetChaItem ( role , 2 , ItemBag [0] )	----ǿ���������ָ��
	local Item_YxItem = GetChaItem ( role , 2 , ItemBag [2] )	----ǿ����ʯ����ָ��
	local Item_ScItem_ID = GetItemID ( Item_ScItem )		----�̳ǵ���ID
	local Item_YxItem_ID = GetItemID ( Item_YxItem )		----��Ϸ����ID

	local Item_beuplv_Lv =  Get_Itembeuplv_Lv ( Item_beuplv )	 ---ȡ�ں�סװ���ȼ�

	--SystemNotice( role , "LVA"..Item_beuplv_Lv)


	local R1 = 0
	local R2 = 0

	R1 = RemoveChaItem ( role , Item_ScItem_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		--�Ƴ��̳ǵ���
	R2 = RemoveChaItem ( role , Item_YxItem_ID , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		--�Ƴ���Ϸ����

	if R1 == 0 or R2 == 0 then
		CALCULATE_FORGE_LUA_000009 = GetResString("CALCULATE_FORGE_LUA_000009")
		LG( "beuplv" , CALCULATE_FORGE_LUA_000009 )
	end

	local Money_Need = getupgrade_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )						--���ݽ�ɫ��̬�ֱ�ˢ�µ�ǰ����

	local a = Check_CG_beuplv ( Item_beuplv_Lv )			---��ͬ�ȼ��ĳɹ�����

	if a == 0 then
		R1 = RemoveChaItem ( role , Item_ScItem_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		--�Ƴ��̳ǵ���
		R2 = RemoveChaItem ( role , Item_YxItem_ID , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		--�Ƴ���Ϸ����
		if R1 == 0 or R2 == 0 then
			CALCULATE_FORGE_LUA_000009 = GetResString("CALCULATE_FORGE_LUA_000009")
			LG( "beuplv" , CALCULATE_FORGE_LUA_000009 )
		end
		local cha_name = GetChaDefaultName ( role )
		CALCULATE_FORGE_LUA_000116 = GetResString("CALCULATE_FORGE_LUA_000116")
		CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
		LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000116 )
		CALCULATE_FORGE_LUA_000117 = GetResString("CALCULATE_FORGE_LUA_000117")
		SystemNotice( role , CALCULATE_FORGE_LUA_000117)
		return 
	end


	Item_beuplv_Lv = Item_beuplv_Lv + 1

	SetChaKitbagChange( role , 1 )

	--SystemNotice( role , "LVB"..Item_beuplv_Lv)
	Set_Itembeuplv_Lv ( Item_beuplv , Item_beuplv_Lv )		-------���ں�סװ���ȼ�
	--SystemNotice( role , "LVC"..Item_beuplv_Lv)

	SynChaKitbag( role, 4 )

	local LvD = GetItemAttr( Item_beuplv , ITEMATTR_VAL_LEVEL )


	--SystemNotice( role , "LVD"..LvD)

	--check_item_final_data ( Item_beuplv )				-----��������
	SynChaKitbag(role,13)

	CALCULATE_FORGE_LUA_000118 = GetResString("CALCULATE_FORGE_LUA_000118")
	SystemNotice( role , CALCULATE_FORGE_LUA_000118)
	local cha_name = GetChaDefaultName ( role )
	CALCULATE_FORGE_LUA_000119 = GetResString("CALCULATE_FORGE_LUA_000119")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	LG( "JingLian_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000119 )

	return 1

end
-------------------------------
--function beuplv ( item )						----------�ں�װ������Ч��

--	local can_beuplv = 0
--	can_beuplv = can_beuplv_item(...)

--	if can_beuplv == 0 then
--		return 0
--	end
--end


-------------------------------
function Get_Itembeuplv_Lv ( Item )								--��ȡ�ں�װ���ȼ�

	local Lv = GetItemAttr ( Item , ITEMATTR_VAL_LEVEL )

	return Lv
end

---------------------------------
function Set_Itembeuplv_Lv ( Item , Item_Lv )							--����װ���ȼ�
	local i = 0
	i = SetItemAttr ( Item , ITEMATTR_VAL_LEVEL , Item_Lv )
	if i == 0 then
		CALCULATE_FORGE_LUA_000032 = GetResString("CALCULATE_FORGE_LUA_000032")
		LG( "Hecheng_BS",CALCULATE_FORGE_LUA_000032 )
	end
end
----------------------------
function Check_CG_beuplv ( Item_Lv )				-------��ͬ�ȼ��ĳɹ�����
	local	ran = math.random ( 1, 100 )

	if Item_Lv <= 10 then					-------10������100%�ɹ�
		return 1
	end
	if Item_Lv>10 and Item_Lv <= 15 then			-------10��15������50%�ɹ�
		if ran <= 50 then
		return 1
		else
		return 0
		end
	end
	if Item_Lv>15 and Item_Lv <= 20 then			-------15��20������10%�ɹ�
		if ran <= 10 then
		return 1
		else
		return 0
		end
	end
end

function get_item_upgrade_money(...)
	local arg = {...}
--	Notice("�������")
	local Money = getupgrade_money_main ( arg )
	return Money
end


--���㾫������������

function getupgrade_money_main ( Table )

	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_Waiguan = ItemBag [1]
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag_Waiguan )
	local Waiguan_Lv = 0

	local Waiguan_Lv =  Get_Itembeuplv_Lv ( Item_Waiguan )

	local Money_Need = ( Waiguan_Lv + 1 )*( Waiguan_Lv + 1 )*10000

--	Notice("�������")
	return Money_Need
end



--�����ת
--�ж��Ƿ��ܹ�ת����ת���������
function can_jlborn_item(...)
	local arg = {...}
	if #arg ~= 12  then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg)
		return 0
	end
	local Check = 0
	Check = can_jlborn_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ����ת��������
function can_jlborn_item_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	---���������ж�
	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		CALCULATE_FORGE_LUA_000079 = GetResString("CALCULATE_FORGE_LUA_000079")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000079)
		return 0
	end
	----ȡ������ָ��
	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )	--��ħ��ʯָ��
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )	--һ��������ߵ�ָ��
	local Item_JLother = GetChaItem ( role , 2 , ItemBag [2] )	--��һ��������ߵ�ָ��
	local Item_JLone_ID = GetItemID ( Item_JLone )   --һ���������ID
	local Item_JLother_ID = GetItemID ( Item_JLother )   --һ���������ID
	---ȡһ��������������
	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )		 --����
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )		--����
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )		--רע
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )		--����
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )		--����
	local URE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_URE )		--����
	local MAXURE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )       --�������
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone  ----һ������ĵȼ�
	---ȡ��һ��������������
	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )       --����
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )       --����
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )       --רע
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )       --����
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )       --����
	local URE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_URE )		 --����
	local MAXURE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )       --�������
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother ----��һ������ĵȼ�
	----ȡһ�������7λ��ֵ
	local Num_JLone = GetItemForgeParam ( Item_JLone , 1 )
	local Part1_JLone = GetNum_Part1 ( Num_JLone )	--Get Num Part 1 �� Part 7
	local Part2_JLone = GetNum_Part2 ( Num_JLone )	
	local Part3_JLone = GetNum_Part3 ( Num_JLone )
	local Part4_JLone = GetNum_Part4 ( Num_JLone )
	local Part5_JLone = GetNum_Part5 ( Num_JLone )
	local Part6_JLone = GetNum_Part6 ( Num_JLone )
	local Part7_JLone= GetNum_Part7 ( Num_JLone )
	----ȡ��һ�������7λ��ֵ
	local Num_JLother = GetItemForgeParam ( Item_JLother , 1 )
	local Part1_JLother = GetNum_Part1 ( Num_JLother )	--Get Num Part 1 �� Part 7
	local Part2_JLother = GetNum_Part2 ( Num_JLother )	
	local Part3_JLother = GetNum_Part3 ( Num_JLother )
	local Part4_JLother = GetNum_Part4 ( Num_JLother )
	local Part5_JLother = GetNum_Part5 ( Num_JLother )
	local Part6_JLother = GetNum_Part6 ( Num_JLother )
	local Part7_JLother= GetNum_Part7 ( Num_JLother )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 2 then
		CALCULATE_FORGE_LUA_000120 = GetResString("CALCULATE_FORGE_LUA_000120")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000120)
		return 0
	end	
	----��ħ��ʵ�ж�
	local  Item_EMstone_ID = GetItemID ( Item_EMstone )
	if Item_EMstone_ID ~= 3918 and Item_EMstone_ID ~= 3919 and Item_EMstone_ID ~= 3920 and Item_EMstone_ID ~= 3921 and Item_EMstone_ID ~= 3922 and Item_EMstone_ID ~= 3924 and Item_EMstone_ID ~= 3925 then
		CALCULATE_FORGE_LUA_000121 = GetResString("CALCULATE_FORGE_LUA_000121")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000121)
		return 0
	end
	-----��ͨ���ϼ��
	if Item_EMstone_ID == 3918 then
	local i1 = CheckBagItem( role, 4530 )			---��ζ������
	local i2 = CheckBagItem( role,3434 )			----������ʿ����
		if i1 < 10 or i2 < 10 then
			CALCULATE_FORGE_LUA_000122 = GetResString("CALCULATE_FORGE_LUA_000122")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000122)
			return 0
		end
	end

	if Item_EMstone_ID == 3919 then
	local i1 = CheckBagItem( role, 4531 )			---����İ��������� 
	local i2 = CheckBagItem( role, 3435 )			----���鹭���ֺ���   
		if i1 < 10 or i2 < 10 then
			CALCULATE_FORGE_LUA_000122 = GetResString("CALCULATE_FORGE_LUA_000122")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000122)
			return 0
		end
	end

	if Item_EMstone_ID == 3920 then
	local i1 = CheckBagItem( role,1196 )			---������������Ƭ
	local i2 = CheckBagItem( role,3436 )			----������ʿ����  
		if i1 < 10 or i2 < 10 then
			CALCULATE_FORGE_LUA_000122 = GetResString("CALCULATE_FORGE_LUA_000122")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000122)
			return 0
		end
	end

	if Item_EMstone_ID == 3921 then
	local i1 = CheckBagItem( role, 4533 )			---���β��           
	local i2 = CheckBagItem( role, 3437 )			----���鹭���ֺ��� 
		if i1 < 10 or i2 < 10 then
			CALCULATE_FORGE_LUA_000122 = GetResString("CALCULATE_FORGE_LUA_000122")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000122)
			return 0
		end
	end

	if Item_EMstone_ID == 3922 then
	local i1 = CheckBagItem( role,4537 )			---���                      
	local i2 = CheckBagItem( role,3444 )			----�ཬ��   
		if i1 < 10 or i2 < 10 then
			CALCULATE_FORGE_LUA_000122 = GetResString("CALCULATE_FORGE_LUA_000122")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000122)
			return 0
		end
	end

	if Item_EMstone_ID == 3924 then
	local i1 = CheckBagItem( role, 4540 )			---���㱳��             
	local i2 = CheckBagItem( role, 3443 )			----�����ľ   
		if i1 < 10 or i2 < 10 then
			CALCULATE_FORGE_LUA_000122 = GetResString("CALCULATE_FORGE_LUA_000122")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000122)
			return 0
		end
	end

	if Item_EMstone_ID == 3925 then
	local i1 = CheckBagItem( role, 1253 )			---����İ�����������Ƭ
	local i2 = CheckBagItem( role, 3442 )			----�����                    
		if i1 < 10 or i2 < 10 then
			CALCULATE_FORGE_LUA_000122 = GetResString("CALCULATE_FORGE_LUA_000122")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000122)
			return 0
		end
	end
	----���������ж�
	local ItemType_JLone = GetItemType (Item_JLone)
	local ItemType_JLother = GetItemType (Item_JLother)
	if  ItemType_JLone ~=59 or ItemType_JLother ~=59  then
			CALCULATE_FORGE_LUA_000123 = GetResString("CALCULATE_FORGE_LUA_000123")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000123)
		return 0
	end
	------������Ƿ���ͬһ����
	if ItemBag [1]==ItemBag [2] then
		CALCULATE_FORGE_LUA_000124 = GetResString("CALCULATE_FORGE_LUA_000124")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000124)
		return 0		
	end
	----�Ƿ�Ϊ��ͨ������ж�
	if  Part1_JLone ~=0 or Part1_JLother ~=0  then
		CALCULATE_FORGE_LUA_000125 = GetResString("CALCULATE_FORGE_LUA_000125")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000125)
		return 0
	end
	-----����ȼ��ж�
	if  lv_JLone < 20 or lv_JLother < 20   then
		CALCULATE_FORGE_LUA_000126 = GetResString("CALCULATE_FORGE_LUA_000126")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000126)
		return 0
	end
	-----�����Ƿ��������ж�
	if URE_JLone < MAXURE_JLone or URE_JLone < MAXURE_JLone then
		CALCULATE_FORGE_LUA_000127 = GetResString("CALCULATE_FORGE_LUA_000127")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000127)
		return 0
	end
	----���Ͻ�Ǯ�ж�
	local Money_Need = getjlborn_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000128 = GetResString("CALCULATE_FORGE_LUA_000128")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000128)
		return 0
	end
	return 1
end

--��ʼת����ת�����������
function begin_jlborn_item(...)
	local arg = {...}
	-----�Ƿ�����ںϼ��
	local Check_Canjlborn = 0
	Check_Canjlborn = can_jlborn_item_main ( arg )
	if Check_Canjlborn == 0 then
		return 0
	end
	------ȡ������
	local role = 0
	local ItemBag = {}											--���߱���λ��
	local ItemCount = {}											--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )
	-----ȡ������ָ��
	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )				--��ħ��ʯָ��
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )					--һ��������ߵ�ָ��
	local Item_JLother = GetChaItem ( role , 2 , ItemBag [2] )				--��һ��������ߵ�ָ��
	-----�۳���Ǯ
	local Money_Need = getjlborn_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )
	-----ת������
	Check_JLBorn_Item = jlborn_item ( arg )
	if Check_JLBorn_Item == 0  then
		CALCULATE_FORGE_LUA_000129 = GetResString("CALCULATE_FORGE_LUA_000129")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000129)
	end
	local cha_name = GetChaDefaultName ( role )
	CALCULATE_FORGE_LUA_000130 = GetResString("CALCULATE_FORGE_LUA_000130")
	SystemNotice ( role ,CALCULATE_FORGE_LUA_000130)
	CALCULATE_FORGE_LUA_000131 = GetResString("CALCULATE_FORGE_LUA_000131")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	LG( "JLBorn_ShiBai" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000131 )
	return 1
end

--����ת������
function get_item_jlborn_money(...)
	local arg = {...}
	local Money = getjlborn_money_main ( arg )
	return Money
end

--����ת������������
function getjlborn_money_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )
	---ȡ������ָ��
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )				--һ��������ߵ�ָ��
	local Item_JLother = GetChaItem ( role , 2 , ItemBag [2] )			--��һ��������ߵ�ָ��
	---ȡһ��������������
	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )		  --����
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )		   --����
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )		  --רע
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )		 --����
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )		 --����
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone  ----һ������ĵȼ�
	---ȡ��һ��������������
	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )		 --����
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )		  --����
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )		--רע
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )		  --����
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )		 --����
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother ----��һ������ĵȼ�
	local  Money_Need = ( 60 - lv_JLone )*(60 - lv_JLother )*100
	if lv_JLone>60 or lv_JLother>60 then
		 Money_Need = 0
	end
	return Money_Need
end
----��غ���--------------------------------------------------------------------------------------------------------
---��ʼת��
function jlborn_item ( Table )
	local role = 0
	local ItemBag = {}											--���߱���λ��
	local ItemCount = {}											--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )
	---ȡ������ָ��
	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )				--��ħ��ʯָ��
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )					--һ��������ߵ�ָ��
	local Item_JLother = GetChaItem ( role , 2 , ItemBag [2] )				--��һ��������ߵ�ָ��
	local  Item_EMstone_ID = GetItemID ( Item_EMstone )					 --��ħ��ʵID
	local  Item_JLone_ID = GetItemID ( Item_JLone )						 --һ���������ID
	local  Item_JLother_ID = GetItemID ( Item_JLother )					 --һ���������ID
	---ȡһ��������������
	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )			  --���� 
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )			 ---���� 
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )			 --���� 
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )			  --רע 
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )			  --���� 
	local URE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_URE )			--���� 
	local MAXURE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )		 --�������
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone	----һ������ĵȼ�
	---ȡ��һ��������������
	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )		--����
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )		  --����
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )		 --����
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )		 --רע
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )		 --����
	local URE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_URE )			    --����
	local MAXURE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )	 --�������
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother ----��һ������ĵȼ�
	----ȡһ�������7λ��ֵ
	local Num_JLone = GetItemForgeParam ( Item_JLone , 1 )
	local Part1_JLone = GetNum_Part1 ( Num_JLone )	--Get Num Part 1 �� Part 7
	local Part2_JLone = GetNum_Part2 ( Num_JLone )	
	local Part3_JLone = GetNum_Part3 ( Num_JLone )
	local Part4_JLone = GetNum_Part4 ( Num_JLone )
	local Part5_JLone = GetNum_Part5 ( Num_JLone )
	local Part6_JLone = GetNum_Part6 ( Num_JLone )
	local Part7_JLone= GetNum_Part7 ( Num_JLone )
	----ȡ��һ�������7λ��ֵ
	local Num_JLother = GetItemForgeParam ( Item_JLother , 1 )
	local Part1_JLother = GetNum_Part1 ( Num_JLother )	--Get Num Part 1 �� Part 7
	local Part2_JLother = GetNum_Part2 ( Num_JLother )	
	local Part3_JLother = GetNum_Part3 ( Num_JLother )
	local Part4_JLother = GetNum_Part4 ( Num_JLother )
	local Part5_JLother = GetNum_Part5 ( Num_JLother )
	local Part6_JLother = GetNum_Part6 ( Num_JLother )
	local Part7_JLother= GetNum_Part7 ( Num_JLother )
	-----�����¾���ȼ���¼���¾�����
	local new_str = math.floor ((str_JLone+str_JLother)*0.125 )
	local new_con = math.floor ((con_JLone+con_JLother)*0.125 )
	local new_agi = math.floor ((agi_JLone+agi_JLother)*0.125 )
	local new_dex = math.floor ((dex_JLone+dex_JLother)*0.125 )
	local new_sta = math.floor ((sta_JLone+sta_JLother)*0.125 )
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		new_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		new_MAXURE = 32000
	end
	if new_MAXURE ==25000  then
		new_MAXURE = 25000+1
	end
		--------��ħ��ʵ�ж�
	if Item_EMstone_ID ==3918 then ---��ɬ��ħ��ʵ
		local j1 =TakeItem( role, 0, 4530, 10 )			---��ζ������     
		local j2 = TakeItem( role, 0,3434, 10  )			----������ʿ���� 
		if j1==0 or j2==0 then
			CALCULATE_FORGE_LUA_000132 = GetResString("CALCULATE_FORGE_LUA_000132")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000132)
			return
		end 
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then---90%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )			
			else
				r1,r2 =MakeItem ( role , 231  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 231  , 1 , 4 )
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )			--ȡ�¾������ָ��
		local Item_newJL_ID = GetItemID ( Item_newJL )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 �� Part 7
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )			
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 6					 ---------��֮���鼼�ܱ��
			Part3_newJL = 1						---------�����׶�
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 6					 ---------��֮���鼼�ܱ��
			Part3_newJL = 2						---------�м��׶�
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 6					 ---------��֮���鼼�ܱ��
			Part3_newJL = 3						---------�߼��׶�
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 ) 
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )	 ----------��ת���
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )
		
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3919 then ---���߶�ħ��ʵ  ��֮����----���ʼӷ���
		local j1 = TakeItem( role, 0, 4531, 10 )			---����İ���������  
		local j2 = TakeItem( role, 0,3435, 10 )			----���鹭���ֺ���    
		if j1==0 or j2==0 then
			CALCULATE_FORGE_LUA_000132 = GetResString("CALCULATE_FORGE_LUA_000132")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000132)
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif  lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then---90%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )			
			else
				r1,r2 =MakeItem ( role , 233  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 233  , 1 , 4 )
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )			--ȡ�¾������ָ��
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 �� Part 7
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 7					 ---------��֮���鼼�ܱ��
			Part3_newJL = 1					---------�����׶�
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 7					 ---------��֮���鼼�ܱ��
			Part3_newJL = 2					---------�м��׶�
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 7					 ---------��֮���鼼�ܱ��
			Part3_newJL = 3					---------�߼��׶�
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 ) 
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )	----------��ת���
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3920 then ---������ħ��ʵ ��֮����----�����ӹ���
		local j1 =TakeItem( role, 0, 1196, 10 )			---������������Ƭ  
		local j2 = TakeItem( role, 0,3436, 10 )			----������ʿ����    
		if j1==0 or j2==0 then
			CALCULATE_FORGE_LUA_000132 = GetResString("CALCULATE_FORGE_LUA_000132")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000132)
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif  lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then---90%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )			
			else
				r1,r2 =MakeItem ( role , 232  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 232  , 1 , 4 )
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )			--ȡ�¾������ָ��
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 �� Part 7
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 8													 ---------��֮���鼼�ܱ��
			Part3_newJL = 1													---------�����׶�
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 8													 ---------��֮���鼼�ܱ��
			Part3_newJL = 2													---------�м��׶�
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 8													 ---------��֮���鼼�ܱ��
			Part3_newJL = 3													---------�߼��׶�
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 ) 
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )	----------��ת���
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )
 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3921 then ---�ǻ۶�ħ��ʵ ��֮���� ����ӷ���
		local j1 =TakeItem( role, 0, 4533, 10 )			---���β��            
		local j2 = TakeItem( role, 0,3437, 10 )			----���鹭���ֺ���  
		if j1==0 or j2==0 then
			CALCULATE_FORGE_LUA_000132 = GetResString("CALCULATE_FORGE_LUA_000132")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000132)
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif  lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then---90%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )			
			else
				r1,r2 =MakeItem ( role , 234  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 234  , 1 , 4 )
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )			--ȡ�¾������ָ��
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 �� Part 7
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 9													 ---------��֮���鼼�ܱ��
			Part3_newJL = 1													---------�����׶�
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 9													 ---------��֮���鼼�ܱ��
			Part3_newJL = 2													---------�м��׶�
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 9													 ---------��֮���鼼�ܱ��
			Part3_newJL = 3													---------�߼��׶�
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 ) 
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 ) ----------��ת���
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3922 then ---������ħ��ʵ ר֮���� רע�ӹ���
		local j1 =TakeItem( role, 0,4537, 10 )			---���                     
		local j2 = TakeItem( role, 0,3444, 10 )			----�ཬ��  
		if j1==0 or j2==0 then
			CALCULATE_FORGE_LUA_000132 = GetResString("CALCULATE_FORGE_LUA_000132")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000132)
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif  lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then---90%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )			
			else
				r1,r2 =MakeItem ( role , 235  , 1 , 4 )
			end
		else
			 r1,r2 =MakeItem ( role , 235  , 1 , 4 )
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )			--ȡ�¾������ָ��
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_JLother )	--Get Num Part 1 �� Part 7
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 10												 ---------ר֮���鼼�ܱ��
			Part3_newJL = 1													---------�����׶�
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 10												 ---------ר֮���鼼�ܱ��
			Part3_newJL = 2													---------�м��׶�
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 10													 ---------ר֮���鼼�ܱ��
			Part3_newJL = 3													---------�߼��׶�
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 ) 
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 ) ----------��ת���
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3924 then ---�����ħ��ʵ ��֮���� ���ݼӷ���
		local j1 = TakeItem( role, 0,4540, 10 )			---���㱳��              
		local j2 = TakeItem( role, 0,3443, 10 )			----�����ľ    
		if j1==0 or j2==0 then
			CALCULATE_FORGE_LUA_000132 = GetResString("CALCULATE_FORGE_LUA_000132")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000132)
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif  lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then---90%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )			
			else
				r1,r2 =MakeItem ( role , 236  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 236  , 1 , 4 )
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )			--ȡ�¾������ָ��
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 �� Part 7
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 11													 ---------��֮���鼼�ܱ��
			Part3_newJL = 1													---------�����׶�
		end		
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 11													 ---------��֮���鼼�ܱ��
			Part3_newJL = 2													---------�м��׶�
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 11													 ---------��֮���鼼�ܱ��
			Part3_newJL = 3													---------�߼��׶�
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 ) 
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 ) ----------��ת���
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3925 then ---���ض�ħ��ʵ а֮���� ����ӳ�
		local j1 = TakeItem( role, 0,1253, 10 )			---����İ�����������Ƭ        
		local j2 = TakeItem( role, 0,3442, 10 )			----�����    
		if j1==0 or j2==0 then
			CALCULATE_FORGE_LUA_000132 = GetResString("CALCULATE_FORGE_LUA_000132")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000132)
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif  lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%ΪĦ������
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then---90%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )			
			else
				r1,r2 =MakeItem ( role , 237  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 237 , 1 , 4 )
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )			--ȡ�¾������ָ��
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 �� Part 7
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 12													 ---------а֮���鼼�ܱ��
			Part3_newJL = 1													---------�����׶�
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 12													 ---------а֮���鼼�ܱ��
			Part3_newJL = 2													---------�м��׶�
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 12													 ---------а֮���鼼�ܱ��
			Part3_newJL = 3													---------�߼��׶�
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 ) 
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 ) 
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 ) 
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 ) ----------��ת���
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	--------------����ת��LG
	local cha_name = GetChaDefaultName ( role )
	--LG( "star_JLZS_lg" ,cha_name,Item_JLone_ID , lv_JLone , str_JLone , con_JLone , agi_JLone , dex_JLone , sta_JLone , Item_JLother_ID , lv_JLother  , str_JLother , con_JLother , agi_JLother , dex_JLother , sta_JLother )
	LG( "star_JLZS_lg" ,cha_name, Item_EMstone_ID , Item_JLone_ID , lv_JLone ,  Item_JLother_ID , lv_JLother , Item_newJL_ID )

	R1 = RemoveChaItem ( role , Item_EMstone_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		--�Ƴ���ħ��ʵ
	if R1 == 0  then
		CALCULATE_FORGE_LUA_000133 = GetResString("CALCULATE_FORGE_LUA_000133")
		SystemNotice( role , CALCULATE_FORGE_LUA_000133)
		return
	end
	 Elf_Attr_cs ( role , Item_JLone , Item_JLother )	
end
--����
--�ж��Ƿ��ܹ������������������
function can_tichun_item(...)
	local arg = {...}
--	Notice ( "�ж��Ƿ��������")
	if #arg ~= 10 and #arg ~= 14 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end
	local Check = 0
	Check = can_tichun_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ��������������
function can_tichun_item_main ( Table )
	--Notice ( "����Ƿ��������������")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	--------���������ж�
	if ItemCount [0] ~= 1 or ItemCount [1] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [1] ~= 1 then
		CALCULATE_FORGE_LUA_000079 = GetResString("CALCULATE_FORGE_LUA_000079")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000079)
		return 0
	end
	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )
	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	--SystemNotice ( role ,"ItemID_mainitem=="..ItemID_mainitem)
	--SystemNotice ( role ,"ItemID_otheritem=="..ItemID_otheritem)
	--------ȡ���ߵȼ�
	local ItemID_mainitem_Lv =  GetItemLv ( Item_mainitem )
	local ItemID_otheritem_Lv =  GetItemLv ( Item_otheritem )
	--SystemNotice ( role ,"ItemID_mainitem_Lv=="..ItemID_mainitem_Lv)
	--SystemNotice ( role ,"ItemID_otheritem_Lv=="..ItemID_otheritem_Lv)
	local ItemID_main=ItemID_mainitem		
        local ItemID_other=ItemID_otheritem
	-------������ۺϹ���װ����ȡ��ԭʼID
	if ItemID_main > 5000 then
		ItemID_main = GetItemAttr( Item_mainitem , ITEMATTR_VAL_FUSIONID )
	end
	-------�Ƿ��������Կ�����װ��
	local flg=0
	if ItemID_main==825 or ItemID_main==826 or ItemID_main==827  or ItemID_main==828 then---------��������
		if ItemID_other==2403 then
			flg=1
		end
	end
	if ItemID_main==845 or ItemID_main==846 or ItemID_main==847  or ItemID_main==848 then---------��������
		if ItemID_other==2404 then
			flg=1
		end
	end
	if ItemID_main>=2530 and ItemID_main<=2532 then---------70���޽�BOSSװ��������
		if ItemID_other==2562 then
			flg=1
		end
	end
	if ItemID_main>=2533 and ItemID_main<=2535 then---------70��˫��BOSSװ��������
		if ItemID_other==2563 then
			flg=1
		end
	end
	if ItemID_main>=2536 and ItemID_main<=2538 then---------70���ѻ�BOSSװ��������
		if ItemID_other==2564 then
			flg=1
		end
	end
	if ItemID_main>=2539 and ItemID_main<=2541 then---------70������BOSSװ��������
		if ItemID_other==2565 then
			flg=1
		end
	end
	if ItemID_main>=2542 and ItemID_main<=2544 then---------70��ʥְBOSSװ��������
		if ItemID_other==2566 then
			flg=1
		end
	end
	if ItemID_main>=2545 and ItemID_main<=2547 then---------70����ӡBOSSװ��������
		if ItemID_other==2567 then
			flg=1
		end
	end
	if flg==0 then
		CALCULATE_FORGE_LUA_000134 = GetResString("CALCULATE_FORGE_LUA_000134")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000134)
		return 0		
	end
	--------���Ͻ�Ǯ�ж�
	local Money_Need = gettichun_money_main ( Table )
	--SystemNotice(role ,"Money_Need== "..Money_Need)
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000135 = GetResString("CALCULATE_FORGE_LUA_000135")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000135)
		return 0
	end
	--SystemNotice(role ,"�жϽ��� ")
	return 1
end

--��ʼ�������������������
function begin_tichun_item(...)
	local arg = {...}
	--Notice("��������")
	--------�Ƿ�����ںϼ��
	local Check_Cantichun = 0
	Check_Cantichun = can_tichun_item_main ( arg )
	if Check_Cantichun == 0 then
		return 0
	end
	--------ȡ������
	local role = 0
	local ItemBag = {}											--���߱���λ��
	local ItemCount = {}											--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	
	--------�۳���Ǯ
	local Money_Need = gettichun_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	TakeMoney(role,nil,Money_Need)
	--Money_Have = Money_Have - Money_Need
	--SetCharaAttr ( Money_Have , role , ATTR_GD )
	--ALLExAttrSet( role )

	--------��������
	Check_TiChun_Item = tichun_item ( arg )
	if Check_TiChun_Item == 0  then
		CALCULATE_FORGE_LUA_000136 = GetResString("CALCULATE_FORGE_LUA_000136")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000136)
	end
	--?????????check_item_final_data ( Item_Waiguan )
	--------Notice("��������")

	return 1
end

--������������
function get_item_tichun_money(...)
	local arg = {...}
	--Notice("�������")
	local Money = gettichun_money_main ( arg )
	return Money
end

--������������������
function gettichun_money_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_mainitem_Lv =  GetItemLv ( Item_mainitem )
	local Money_Need = 1000000---------------10W
	--Notice("�������")
	return Money_Need
end

----��غ���--------------------------------------------------------------------------------------------------------
---��ʼ����
function tichun_item ( Table )
	--Notice("Ronghe_Item")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )
	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	--SystemNotice ( role ,"ItemID_mainitem=="..ItemID_mainitem)
	--SystemNotice ( role ,"ItemID_otheritem=="..ItemID_otheritem)
	--------ȡ���ߵȼ�
	local ItemID_mainitem_Lv =  GetItemLv ( Item_mainitem )
	local ItemID_otheritem_Lv =  GetItemLv ( Item_otheritem )
	--SystemNotice ( role ,"ItemID_mainitem_Lv=="..ItemID_mainitem_Lv)
	--SystemNotice ( role ,"ItemID_otheritem_Lv=="..ItemID_otheritem_Lv)
	local ItemID_main=ItemID_mainitem		
        local ItemID_other=ItemID_otheritem
	-------������ۺϹ���װ����ȡ��ԭʼID
	if ItemID_main > 5000 then
		ItemID_main = GetItemAttr( Item_mainitem , ITEMATTR_VAL_FUSIONID )
	end
	-------ȡԭװ��������Ϣ
	local Jinglianxinxi = GetItemForgeParam ( Item_mainitem , 1 )
	--local hole_num = Check_HasHole ( Item_mainitem )

	--local flg=0
	local r1 = -1
	local r2 = 0
	-------ȡװ������
	local item_energy = GetItemAttr(Item_mainitem,ITEMATTR_ENERGY) 
	-------��������
	if ItemID_main==825  then---------����������
		r1,r2 =MakeItem ( role , 2549  , 1 , 4 )
	end
	if ItemID_main==826  then---------����������
		r1,r2 =MakeItem ( role , 2550  , 1 , 4 )
	end
	if ItemID_main==827  then---------���޽�����
		r1,r2 =MakeItem ( role , 2551  , 1 , 4 )
	end
	if ItemID_main==828  then---------����ͷ����
		r1,r2 =MakeItem ( role , 2552  , 1 , 4 )
	end
	-------��������
	local item_qulity=12
	if ItemID_main==845 or ItemID_main==846 or ItemID_main==847  or ItemID_main==848 then---------��������
		if item_energy<1000 then
			item_qulity=2
		elseif item_energy>=1000 and item_energy<2000  then
			item_qulity=12
		elseif item_energy>=2000 and item_energy<3000  then
			item_qulity=13
		elseif item_energy>=3000 and item_energy<4000  then
			item_qulity=14
		elseif item_energy>=4000 and item_energy<5000  then
			item_qulity=15
		elseif item_energy>=5000 and item_energy<6000  then
			item_qulity=16
		elseif item_energy>=6000 and item_energy<7000  then
			item_qulity=17
		elseif item_energy>=7000 and item_energy<8000  then
			item_qulity=18
		elseif item_energy>=8000 and item_energy<9000  then
			item_qulity=19
		elseif item_energy>=9000 and item_energy<10000  then
			item_qulity=20
		end
		ItemID_main=ItemID_main+1522
		r1,r2 =MakeItem ( role , ItemID_main  , 1 , item_qulity )
		if r1 == 0 then 
			return -1
		end
	end
	---------70BOSS����
	if ItemID_main>=2530 and ItemID_main<=2547 then---------70BOSS����
		ItemID_main=ItemID_main+287
		r1,r2 =MakeItem ( role , ItemID_main  , 1 , 4)
		if r1 == 0 then 
			return -1
		end
	end
	local R1 = 0
	local R2 = 0
	R1 = RemoveChaItem ( role , ItemID_mainitem , 1 , 2 , ItemBag [0] , 2 , 1 , 1 )	--�Ƴ�����
	R2 = RemoveChaItem ( role , ItemID_otheritem , 1 , 2 , ItemBag [1] , 2 , 1 , 1 )	--�Ƴ�����
	if R1==0 or R2==0 then
		CALCULATE_FORGE_LUA_000105 = GetResString("CALCULATE_FORGE_LUA_000105")
		SystemNotice( role , CALCULATE_FORGE_LUA_000105)
		return
	end
	------------ȡ��װ��ָ��
	local Item_new = GetChaItem ( role , 2 , r2 )	
	local Check_SetItemForgeParam = SetItemForgeParam( Item_new , 1 , Jinglianxinxi )
	if Check_SetItemForgeParam == 0 then
		CALCULATE_FORGE_LUA_000106 = GetResString("CALCULATE_FORGE_LUA_000106")
		SystemNotice( role , CALCULATE_FORGE_LUA_000106)
		return
	end	
	--------------����LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_HNBTICHUN_lg" ,cha_name, ItemID_mainitem , ItemID_otheritem , ItemID_main, ItemID_other, item_energy , Jinglianxinxi )
	SynChaKitbag(role,13)
end
--���ǳ��
--�ж��Ƿ��ܹ����ǳ�磬���ǳ�纯�����
function can_energy_item(...)
	local arg = {...}
--	Notice ( "�ж��Ƿ���Ա��ǳ��")
	if #arg ~= 10 and #arg ~= 14 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end
	local Check = 0
	Check = can_energy_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ���Ա��ǳ��������
function can_energy_item_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	--------���������ж�
	if ItemCount [0] ~= 1 or ItemCount [1] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [1] ~= 1 then
		CALCULATE_FORGE_LUA_000079 = GetResString("CALCULATE_FORGE_LUA_000079")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000079)
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		CALCULATE_FORGE_LUA_000137 = GetResString("CALCULATE_FORGE_LUA_000137")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000137)
		UseItemFailed ( role )
		return
	end
	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--���ǵ���ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--��ص���ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )

	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	--------ȡ���ߵȼ�
	local Item_mainitem_Lv =  GetItemLv ( Item_mainitem )
	-------ȡ��������
	local item_energy = GetItemAttr(Item_mainitem,ITEMATTR_ENERGY) ---��ǰ����
	local item_maxenergy = GetItemAttr(Item_mainitem,ITEMATTR_MAXENERGY) ---�������

	-------�Ƿ����ڱ���
	if ItemType_mainitem~=29 then
		CALCULATE_FORGE_LUA_000138 = GetResString("CALCULATE_FORGE_LUA_000138")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000138)
		return 0	
	end
	-------�Ƿ��ǵ��
	if ItemID_otheritem ~= 1022 and ItemID_otheritem ~= 1024 and ItemID_otheritem ~= 6447 then
		CALCULATE_FORGE_LUA_000139 = GetResString("CALCULATE_FORGE_LUA_000139")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000139)
		return 0	
	end
	-------�жϱ����Ƿ�������
	if item_energy==item_maxenergy then
		CALCULATE_FORGE_LUA_000140 = GetResString("CALCULATE_FORGE_LUA_000140")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000140)
		return 0	
	end
	--------���Ͻ�Ǯ�ж�
	local Money_Need = get_item_energy_money ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000141 = GetResString("CALCULATE_FORGE_LUA_000141")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000141)
		return 0
	end
	--SystemNotice(role ,"�жϽ��� ")
	return 1
end

--��ʼ���ǳ�磬���ǳ�����������
function begin_energy_item(...)
	local arg = {...}
	--Notice("���뱴�ǳ��")
	--------�Ƿ�����ںϼ��
	local Check_Canenergy = 0
	Check_Canenergy = can_energy_item_main ( arg )
	if Check_Canenergy == 0 then
		return 0
	end
	--------ȡ������
	local role = 0
	local ItemBag = {}											--���߱���λ��
	local ItemCount = {}											--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	
	--------�۳���Ǯ
	local Money_Need = get_item_energy_money ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	--Money_Have = Money_Have - Money_Need
	--SetCharaAttr ( Money_Have , role , ATTR_GD )
	--ALLExAttrSet( role )
	TakeMoney(role,nil,Money_Need)

	--------���ǳ�����
	Check_Energy_Item = energy_item ( arg )
	if Check_Energy_Item == 0  then
		CALCULATE_FORGE_LUA_000142 = GetResString("CALCULATE_FORGE_LUA_000142")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000142)
	end
	-------check_item_final_data ( Item_Waiguan )
	--------Notice("���ǳ�����")
	return 1
end

--���㱴�ǳ�����
function get_item_energy_money(...)
	local arg = {...}
	--Notice("�������")
	local Money = energy_money_main ( arg )
	return Money
end

--���㱴�ǳ�����������
function energy_money_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	--------ȡ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	--------ȡ����ID
        local ItemID_otheritem = GetItemID ( Item_otheritem )

	if ItemID_otheritem==1022 then
		Money_Need=300
	else
		Money_Need=1000
	end
	--Notice("�������")
	return Money_Need
end

----��غ���--------------------------------------------------------------------------------------------------------
---��ʼ���ǳ��
function energy_item ( Table )
	--	Notice("Ronghe_Item")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )
	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	-------ȡ��������
	local item_energy = GetItemAttr(Item_mainitem,ITEMATTR_ENERGY) ---��ǰ����
		--SystemNotice( role , "��ǰ����=="..item_energy)

	local item_maxenergy = GetItemAttr(Item_mainitem,ITEMATTR_MAXENERGY) ---�������
		--SystemNotice( role , "�������=="..item_maxenergy)

	local energy_differ=0
	local star=math.random(1,20)
		--SystemNotice( role , "star=="..star)
	if ItemID_otheritem==1022 then
		energy_differ=star*50
	else
		energy_differ=1500
	end
		--SystemNotice( role , "energy_differ=="..energy_differ)
	item_energy=item_maxenergy--math.min( item_maxenergy , (item_energy+energy_differ) )
		--SystemNotice( role , "item_energy=="..item_energy)
	SetItemAttr ( Item_mainitem ,ITEMATTR_ENERGY, item_energy )
	--------------���LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_CHONGDIAN_lg" ,cha_name, ItemID_mainitem , ItemID_otheritem )

	local R1 = 0
	R1 = RemoveChaItem ( role , Item_otheritem , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )		--�Ƴ����
	if R1 == 0 then
		CALCULATE_FORGE_LUA_000105 = GetResString("CALCULATE_FORGE_LUA_000105")
		SystemNotice( role , CALCULATE_FORGE_LUA_000105)
		return
	end
end


--��ȡ��ʯ
--�ж��Ƿ��ܹ���ȡ��ʯ����ȡ��ʯ�������
function can_getstone_item(...)
	local arg = {...}
	--Notice ( "�ж��Ƿ������ȡ��ʯ")
	if #arg ~= 10 and #arg ~= 14 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end
	local Check = 0
	Check = can_getstone_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ������ȡ��ʯ������
function can_getstone_item_main( Table )
	--Notice ( "����Ƿ������ȡ��ʯ������")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	--------���������ж�
	if ItemCount [0] ~= 1 or ItemCount [1] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [1] ~= 1 then
		CALCULATE_FORGE_LUA_000079 = GetResString("CALCULATE_FORGE_LUA_000079")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000079)
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		CALCULATE_FORGE_LUA_000137 = GetResString("CALCULATE_FORGE_LUA_000137")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000137)
		UseItemFailed ( role )
		return
	end
	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--������ǯ�ӵ���ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )
	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	--------ȡ���ߵȼ�
	local Item_mainitem_Lv =  GetItemLv ( Item_mainitem )
	------ȡ���߾�������
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Jinglianxinxi = GetItemForgeParam ( Item_mainitem , 1 )
	Jinglianxinxi = TansferNum ( Jinglianxinxi )
	Item_Stone[0] = GetNum_Part2 ( Jinglianxinxi )
	Item_Stone[1] = GetNum_Part4 ( Jinglianxinxi )
	Item_Stone[2] = GetNum_Part6 ( Jinglianxinxi )
	
	Item_StoneLv[0] = GetNum_Part3 ( Jinglianxinxi )
	Item_StoneLv[1] = GetNum_Part5 ( Jinglianxinxi )
	Item_StoneLv[2] = GetNum_Part7 ( Jinglianxinxi )
	-----�Ƿ��������Կ�����װ��
	local checkstar=CheckItem_CanJinglian(Item_mainitem)
	if checkstar==0 then
		CALCULATE_FORGE_LUA_000143 = GetResString("CALCULATE_FORGE_LUA_000143")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000143)
		return 0	
	end
	if Item_Stone[0]==0 and Item_Stone[1]==0 and Item_Stone[2]==0 then
		CALCULATE_FORGE_LUA_000144 = GetResString("CALCULATE_FORGE_LUA_000144")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000144)
		return 0		
	end
	-------kokora-------
	if ItemID_otheritem ~= 1020 and ItemID_otheritem ~=5641 then
		CALCULATE_FORGE_LUA_000145 = GetResString("CALCULATE_FORGE_LUA_000145")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000145)
		return 0			
	end
	--------���Ͻ�Ǯ�ж�
	local Money_Need = getstone_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000146 = GetResString("CALCULATE_FORGE_LUA_000146")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000146)
		return 0
	end
	--SystemNotice(role ,"�жϽ��� ")
	return 1
end

--��ʼ��ȡ��ʯ����ȡ��ʯ���������
function begin_getstone_item(...)
	local arg = {...}
	--Notice("������ȡ��ʯ")
	--------�Ƿ�����ںϼ��
	local Check_Cangetstone = 0
	Check_Cangetstone = can_getstone_item_main ( arg )
	if Check_Cangetstone == 0 then
		return 0
	end
	--------ȡ������
	local role = 0
	local ItemBag = {}											--���߱���λ��
	local ItemCount = {}											--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	
	--------�۳���Ǯ
	local Money_Need = getstone_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	--Money_Have = Money_Have - Money_Need
	--SetCharaAttr ( Money_Have , role , ATTR_GD )
	--ALLExAttrSet( role )
	TakeMoney(role,nil,Money_Need)

	--------��ȡ��ʯ����
	Check_TiChun_Item = getstone_item ( arg )
	if Check_TiChun_Item == 0  then
		CALCULATE_FORGE_LUA_000147 = GetResString("CALCULATE_FORGE_LUA_000147")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000147)
	end
	--------Notice("��ȡ��ʯ����")
	return 1
end

--������ȡ��ʯ����
function get_item_getstone_money(...)
	local arg = {...}
	--Notice("�������")
	local Money = getstone_money_main ( arg )
	return Money
end

--������ȡ��ʯ����������
function getstone_money_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )
	
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	
	local Item_StoneLv = {}
	local Jinglianxinxi = GetItemForgeParam ( Item_mainitem , 1 )
	Jinglianxinxi = TansferNum ( Jinglianxinxi )

	Item_StoneLv[0] = GetNum_Part3 ( Jinglianxinxi )
	Item_StoneLv[1] = GetNum_Part5 ( Jinglianxinxi )
	Item_StoneLv[2] = GetNum_Part7 ( Jinglianxinxi )

	local Money_Need = (Item_StoneLv[0]+Item_StoneLv[1]+Item_StoneLv[2])*10000

	return Money_Need
end

----��غ���--------------------------------------------------------------------------------------------------------
---��ʼ��ȡ��ʯ
function getstone_item ( Table )
	--Notice("Ronghe_Item")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )
	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	--------ȡ���ߵȼ�
	local Item_mainitem_Lv =  GetItemLv ( Item_mainitem )
	local Item_otheritem_Lv =  GetItemLv ( Item_otheritem )
	-------��ȡװ��������Ϣ
	local Num = GetItemForgeParam ( Item_mainitem , 1 )
	Num = TansferNum ( Num )
	local lg_Num=Num
		--SystemNotice( role , "Num=="..Num)
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Item_StoneID = {}
	-------��ʯ����       
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	-------��ʯ�ȼ�
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )
	--------��ʯID==StoneTpye_ID [��ʯ����]
	Item_StoneID[0] = StoneTpye_ID[Item_Stone[0]]
	Item_StoneID[1] = StoneTpye_ID[Item_Stone[1]]
	Item_StoneID[2] = StoneTpye_ID[Item_Stone[2]]

	local r1 = 0
	local r2 = 0
	local Item_Lv = 0
	local item_tureID=0	---------ȡ���ı�ʯ����ID
	if Item_StoneID[0]~=0 then
		item_tureID = Item_StoneID[0]
		--Item_Stone[0] = 0
		Item_Lv = Item_StoneLv[0]
		Item_StoneLv[0] = Item_StoneLv[0]-1
		if Item_StoneLv[0]==0 then
			Item_Stone[0] = 0
		end
	elseif Item_StoneID[0]==0 and Item_StoneID[1]~=0 then
		item_tureID = Item_StoneID[1]
		--Item_Stone[1] = 0
		Item_Lv = Item_StoneLv[1]
		Item_StoneLv[1] = Item_StoneLv[1]-1
		if Item_StoneLv[1]==0 then
			Item_Stone[1] = 0
		end
	elseif Item_StoneID[0]==0 and Item_StoneID[1]==0  and Item_StoneID[2]~=0 then
		item_tureID = Item_StoneID[2]
		--Item_Stone[2] = 0
		Item_Lv = Item_StoneLv[2]
		Item_StoneLv[2] = Item_StoneLv[2]-1
		if Item_StoneLv[2]==0 then
			Item_Stone[2] = 0
		end
	else 
		CALCULATE_FORGE_LUA_000148 = GetResString("CALCULATE_FORGE_LUA_000148")
		SystemNotice( role , CALCULATE_FORGE_LUA_000148)
		return		
	end
	r1,r2 =MakeItem ( role , item_tureID , 1 , 2 )	
	local Item_ture = GetChaItem ( role , 2 , r2 ) ---------ȡ���ı�ʯָ��
	---------���ñ�ʯ�ȼ� 
	SetItemAttr ( Item_ture , ITEMATTR_VAL_BaoshiLV , Item_Lv )
	----------����װ����������
	Num = SetNum_Part2 ( Num , Item_Stone[0] )
	Num = SetNum_Part3 ( Num , Item_StoneLv[0] )
	Num = SetNum_Part4 ( Num , Item_Stone[1] )
	Num = SetNum_Part5 ( Num , Item_StoneLv[1] )
	Num = SetNum_Part6 ( Num , Item_Stone[2] )
	Num = SetNum_Part7 ( Num , Item_StoneLv[2] )
	SetItemForgeParam ( Item_mainitem , 1 , Num )
	--------------LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_tiqu_lg" ,cha_name, item_tureID , Item_Lv , lg_Num , Num )

	local R1 = 0
	R1 = RemoveChaItem ( role , ItemID_otheritem , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )		--�Ƴ�ǯ��
	if R1 == 0 then
		CALCULATE_FORGE_LUA_000105 = GetResString("CALCULATE_FORGE_LUA_000105")
		SystemNotice( role , CALCULATE_FORGE_LUA_000105)
		return
	end
	
end
---------------------------------------------------------------------------------------------а��ķָ��ߣ������ǵ��������ű���лл��---------------------------------------------------
--can_manufacture_item
--begin_manufacture_item
--end_manufacture_item
function can_manufacture_item (...)
	local arg = {...}
	--Notice("��ʼ�ж�")
	local ItemBagCount = arg[2]
	--Notice("��������"..ItemBagCount)
	local Length = ItemBagCount+3
	if #arg ~= Length then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		Notice(CALCULATE_FORGE_LUA_000014..#arg)
		return 0
	end	
	local Check = 0
--	SystemNotice( arg[1] , "���úϳɼ��������")
	Check = can_manufacture_item_main ( arg )
	if Check == 1 then		
		return 1
	else
		return 0
	end
end

function can_manufacture_item_main ( Table )
	--Notice ( "����ϳ�������")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemBagCount = 0										--���߶�������
	
	role , ItemBag , ItemBagCount = Read_manufacture ( Table )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		CALCULATE_FORGE_LUA_000137 = GetResString("CALCULATE_FORGE_LUA_000137")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000137)
		UseItemFailed ( role )
		return
	end
	local i = 0
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for i = 1 , ItemBagCount , 1 do							--�жϵ��߸����Ƿ�ͷ�
		
		--ȡ������(1-����,2-ͼֽ,3-����,4,5,6-����A,B,C)
		Item[i] = GetChaItem ( role , 2 , ItemBag [i] )			--ȡ����ָ��
		ItemID[i] = GetItemID ( Item[i] )						--ȡ����ID
		ItemType[i] = GetItemType ( Item[i] )					 --ȡ��������
	end

	
	
	
	if ItemID[1] ~= 6529 and ItemID[1] ~= 6530 and ItemID[1] ~= 6531 then
		CALCULATE_FORGE_LUA_000149 = GetResString("CALCULATE_FORGE_LUA_000149")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000149)
		
	elseif ItemID[1] ==6529 then
		
		CALCULATE_FORGE_LUA_000150 = GetResString("CALCULATE_FORGE_LUA_000150")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000150)
	elseif ItemID[1] ==6530 then
		
		CALCULATE_FORGE_LUA_000151 = GetResString("CALCULATE_FORGE_LUA_000151")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000151)
	elseif ItemID[1] ==6531 then
		
		CALCULATE_FORGE_LUA_000152 = GetResString("CALCULATE_FORGE_LUA_000152")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000152)
	elseif ItemID[1] >= 7294 and ItemID[1] <= 7329 then
		SystemNotice( role ,"Item cannot be forged!")
		return
	end
	
	
	local life_lv = 0
	 if ItemID[2]==2300 then ---------����ͼֽ
		
		life_lv=GetSkillLv( role , SK_ZHIZAO )	-----ȡ��ɫ���켼�ܵȼ�
	end
	if ItemID[2]==2301 then ---------����ͼֽ
		
		life_lv=GetSkillLv( role , SK_ZHUZAO )	-----ȡ��ɫ���켼�ܵȼ�
	end
	if ItemID[2]==2302 then ---------���ͼֽ
		
		life_lv=GetSkillLv( role , SK_PENGREN )	-----ȡ��ɫ��⿼��ܵȼ�
	end
	
	if ItemID[3]~=1067 and ItemID[3]~=1068 and ItemID[3]~=1069 then---------���߲�����
		CALCULATE_FORGE_LUA_000153 = GetResString("CALCULATE_FORGE_LUA_000153")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000153)
		return 0	
	end
	if ItemID[3]==1067 or ItemID[3]==1068 or ItemID[3]==1069 or ItemID[3]==1070 then---------���ߴ���
		local Gj_ure=GetItemAttr ( Item[3] , ITEMATTR_URE )
		if Gj_ure<=0 then
			Gj_ure=0
			CALCULATE_FORGE_LUA_000154 = GetResString("CALCULATE_FORGE_LUA_000154")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000154)
			return 0
		end
		if ItemID[3]==1068 and  ItemID[2]~=2300 then-------�����๤��
			CALCULATE_FORGE_LUA_000155 = GetResString("CALCULATE_FORGE_LUA_000155")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000155)
			return 0			
		end
		if ItemID[3]==1069 and  ItemID[2]~=2301 then-------�����๤��
			CALCULATE_FORGE_LUA_000155 = GetResString("CALCULATE_FORGE_LUA_000155")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000155)	
			return 0			
		end	
		if ItemID[3]==1067 and ItemID[2]~=2302 then-------����๤��
			CALCULATE_FORGE_LUA_000155 = GetResString("CALCULATE_FORGE_LUA_000155")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000155)
			return 0			
		end
		
	end

	--�ж�ͼֽ�����Ƿ���ȷ
	if ItemType[2] ~= 69 then
		CALCULATE_FORGE_LUA_000156 = GetResString("CALCULATE_FORGE_LUA_000156")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000156)
		return 0
	end
		

	--ȡͼֽ�������ݣ���������ID������1������2������3���������������ɹ��ʣ�����Ӳ�����ģ�ͼֽ�ȼ�
	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )--ȡͼֽ�ȼ�	
	if life_lv<paper_lv then
		CALCULATE_FORGE_LUA_000157 = GetResString("CALCULATE_FORGE_LUA_000157")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000157)
		return 0
	end
	local paper_id1=GetItemAttr(Item[2], ITEMATTR_VAL_STR )--�������1ID
	--SystemNotice( role ,"�������1ID=="..paper_id1)

	local paper_id2=GetItemAttr(Item[2], ITEMATTR_VAL_CON )--�������2ID
	--SystemNotice( role ,"�������2ID=="..paper_id2)

	local paper_id3=GetItemAttr(Item[2], ITEMATTR_VAL_DEX )--�������3ID	
	--SystemNotice( role ,"�������3ID=="..paper_id3)

	if ItemID[4]~=paper_id1 or  ItemID[5]~=paper_id2 or  ItemID[6]~=paper_id3 then
		CALCULATE_FORGE_LUA_000158 = GetResString("CALCULATE_FORGE_LUA_000158")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000158)
		return 0		
	end
	--------------�����Ʒ����������Ƿ�����
	local Num_paper = GetItemForgeParam ( Item[2] , 1 )---------ȡͼֽ�����������Ʒ������
	Num_paper = TansferNum ( Num_paper )
	local Part1_paper = GetNum_Part1 ( Num_paper )	--Get Num Part 1 �� Part 7
	local Part2_paper = GetNum_Part2 ( Num_paper )	--�������1����
	--SystemNotice( role ,"�������1����=="..Part2_paper)

	local Part3_paper = GetNum_Part3 ( Num_paper )	
	local Part4_paper = GetNum_Part4 ( Num_paper )	--�������2����
	--SystemNotice( role ,"�������2����=="..Part4_paper)

	local Part5_paper = GetNum_Part5 ( Num_paper )
	local Part6_paper = GetNum_Part6 ( Num_paper )	--�������3����
	--SystemNotice( role ,"�������3����=="..Part6_paper)

	local Part7_paper = GetNum_Part7 ( Num_paper )
	local i1 = CheckBagItem( role, ItemID[4] )			----
	local i2 = CheckBagItem( role, ItemID[5] )			----
	local i3 = CheckBagItem( role, ItemID[6] )			----
	--SystemNotice( role ,"�������3����i1=="..i1)
	--SystemNotice( role ,"�������3����i2=="..i2)
	--SystemNotice( role ,"�������3����i2=="..i2)
	if i1 < Part2_paper or i2 < Part4_paper or i3 < Part6_paper  then
		CALCULATE_FORGE_LUA_000159 = GetResString("CALCULATE_FORGE_LUA_000159")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000159)
		return 0
	end
	local paper_num=GetItemAttr(Item[2], ITEMATTR_VAL_STA )--ͼֽʹ�ô���
		--SystemNotice( role ,"ͼֽʹ�ô���=="..paper_num)
	if paper_num <= 0 then
		CALCULATE_FORGE_LUA_000160 = GetResString("CALCULATE_FORGE_LUA_000160")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000160)
		return 0
	end
	local a1 = CheckBagItem( role, 855 )			---����Ӳ��
	local a1_num=GetItemAttr(Item[2], ITEMATTR_MAXURE )--����Ӳ������
	if a1< a1_num then
		CALCULATE_FORGE_LUA_000161 = GetResString("CALCULATE_FORGE_LUA_000161")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000161)
		return 0
	end
	--SystemNotice( role ,"�㶨")
	return 1
end

function Read_manufacture ( Table )

	local role = Table [1]										--��ɫ
	local ItemBagCount = Table [2]								--���߶�������
	local ItemBag = {}										--���߱���λ��
--	local ItemCount = {}										--��������
	local i = 0
	--Notice( " Read_manufacture_ItemBagCount=="..ItemBagCount)
	if ItemBagCount==0 then
		return role , ItemBag , ItemBagCount
	end
	for i = 1 , ItemBagCount , 1 do
		local ReadNow = i + 2
		ItemBag [i] = Table [ReadNow]
		--Notice( " Read_manufacture_ItemBag"..i.."=="..ItemBag [i])
		--ItemCount [i] = Table [ReadNow+1]
	end

	return role , ItemBag , ItemBagCount
end


function begin_manufacture_item (...)
	local arg = {...}
	--Notice(  "����")
	
	local role = 0
	local ItemBag = {}											--���߱���λ��
	--local ItemCount = {}											--��������
	local ItemBagCount = 0										--���߶�������

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )
	
	local Check1 = can_manufacture_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end
	
	local i = 0
	local j = 0
	
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )			--ȡ����ָ��
		ItemID[j] = GetItemID ( Item[j] )						--ȡ���߱��
		ItemType[j] = GetItemType ( Item[j] )					--ȡ��������
	end
	local Gj_lv= 0-------------------���ߵȼ�
	if ItemID[3]==1068 then---------���ߴ���
		Gj_lv=GetItemAttr ( Item[3] , ITEMATTR_VAL_STR )
	end
	local life_lv=GetSkillLv( role , SK_ZHIZAO )	-----ȡ��ɫ���켼�ܵȼ�

	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )--ȡͼֽ�ȼ�	

	local paper_energy = GetItemAttr(Item[2], ITEMATTR_MAXENERGY )-100--ͼֽ������Ʒ����
	local star_good=30   --���׳ɹ���
	if ItemID[1]==6529 then 
		 star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100
	elseif ItemID[1]==6530 then 
		 star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100+5
	elseif ItemID[1]==6531 then 
		 star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100+10
	else star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100-10
	end
	
	
	local star_radom = math.random ( 1, 100 )
		
	local eleven=2
	local a1 = star_radom+7
	local a2 = star_radom+14
	local a3 = star_radom+21
	local a4  = star_radom+28
	local a5  = star_radom+35
	local a6  = star_radom+42
	local a7  = star_radom+49
	local a8  = star_radom+56
	local a9  = star_radom+63

	if star_good<star_radom then
		eleven=1
	elseif star_good>=98 then
		eleven=11
	elseif star_good>=a9 then
		eleven=10
	elseif star_good>=a8 then
		eleven=9
	elseif star_good>=a7 then
		eleven=8
	elseif star_good>=a6 then
		eleven=7
	elseif star_good>=a5 then
		eleven=6
	elseif star_good>=a4 then
		eleven=5
	elseif star_good>=a3 then
		eleven=4
	elseif star_good>=a2 then
		eleven=3
	elseif star_good>=a1 then
		eleven=2
	end
	local star_begin=3*(1+paper_lv)
	local star_end=5*(1+paper_lv)
	local star=math.random ( star_begin , star_end )
	if star>64 then
		star=64
	end
	local run_time = star
	
	return 2,run_time,eleven
end
function begin_manufacture1_item (...)
	local arg = {...}
	--Notice(  "����")
	local role = 0
	local ItemBag = {}											--���߱���λ��
	--local ItemCount = {}											--��������
	local ItemBagCount = 0										--���߶�������

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )

	local Check1 = can_manufacture_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end

	local i = 0
	local j = 0
	
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	--Notice( " ����_ItemBagCount=="..ItemBagCount)
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )			--ȡ����ָ��
		ItemID[j] = GetItemID ( Item[j] )						--ȡ���߱��
		ItemType[j] = GetItemType ( Item[j] )					--ȡ��������
		--Notice( " ����_ItemID["..j.."]=="..ItemID[j])
		--Notice( " ����_ItemType["..j.."]=="..ItemType[j])
	end

	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )--ȡͼֽ�ȼ�	
	--Notice(  "paper_lv"..paper_lv)

	local star_begin=3*(1+paper_lv)
	local star_end=5*(1+paper_lv)
	local star=math.random ( star_begin , star_end )
	if star>64 then
		star=64
	end
	local run_time = star
	local WORD1 =math.random ( 1, 6 )
	local WORD2 =math.random ( 1, 6 )
	local WORD3 =math.random ( 1, 6 )
	local str =""..WORD1..","..WORD2..","..WORD3
	--Notice(  "����_str=="..str)
	return 2,run_time,str
end
function begin_manufacture2_item (...)
	--Notice(  "���")
	local role = 0
	local ItemBag = {}											--���߱���λ��
											--��������
	local ItemBagCount = 0										--���߶�������

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )
	
	local Check1 = can_manufacture_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end

	local i = 0
	local j = 0
	
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )			--ȡ����ָ��
		ItemID[j] = GetItemID ( Item[j] )						--ȡ���߱��
		ItemType[j] = GetItemType ( Item[j] )					--ȡ��������
	end

	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )--ȡͼֽ�ȼ�	
	--Notice(  "paper_lv"..paper_lv)

	local star_begin=3*(1+paper_lv)
	local star_end=4*(1+paper_lv)
	local star=math.random ( star_begin , star_end )
	if star>64 then
		star=64
	end
	
	local run_time = star   --��������ʱ��
	
	local star_ok = 12
			--SystemNotice( role , "run_time==="..run_time)

	return 2,run_time,star_ok
end
function begin_manufacture3_item (...)
	local arg = {...}
	--Notice(  "�ֽ�")
	local role = 0
	local ItemBag = {}											--���߱���λ��
	--local ItemCount = {}											--��������
	local ItemBagCount = 0										--���߶�������

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )

	local Check1 = can_fenjie_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end

	local i = 0
	local j = 0
	
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )			--ȡ����ָ��
		ItemID[j] = GetItemID ( Item[j] )						--ȡ���߱��
		ItemType[j] = GetItemType ( Item[j] )					--ȡ��������
	end
	local Item_Lv =  GetItemLv ( Item[3] )
	if ItemID[3]>=5000 then
		local tmd_rad=math.random ( 1 , 10 )
		if tmd_rad==1 then
			Item_Lv=80
		elseif tmd_rad==2 then
			Item_Lv=70
		elseif tmd_rad==3 then
			Item_Lv=60
		elseif tmd_rad==4 then
			Item_Lv=50
		elseif tmd_rad==5 then
			Item_Lv=40
		elseif tmd_rad==6 then
			Item_Lv=30
		elseif tmd_rad==7 then
			Item_Lv=20
		else
			Item_Lv=10
		end
	end
	local base_rad=0
	base_rad=math.max((80-math.max(Item_Lv,10))*0.01,0.15)
	------------����ȼ�ÿ����һ��+10%�ɹ���
	-- local Num_JL = GetItemForgeParam ( Item[1] , 1 )
	-- Num_JL = TansferNum ( Num_JL )
	-- local Part1_JL = GetNum_Part1 ( Num_JL )	--Get Num Part 1 �� Part 7
	-- local Part2_JL = GetNum_Part2 ( Num_JL )	
	-- local Part3_JL = GetNum_Part3 ( Num_JL )
	-- local Part4_JL = GetNum_Part4 ( Num_JL )
	-- local Part5_JL = GetNum_Part5 ( Num_JL )
	-- local Part6_JL = GetNum_Part6 ( Num_JL )
	-- local Part7_JL = GetNum_Part7 ( Num_JL )
	-- local JL_jineng=0
	-- local JL_jineng_lv=0
	-- if Part2_JL==16 then
		-- JL_jineng=Part2_JL
		-- JL_jineng_lv=Part3_JL
	-- elseif Part4_JL==16 then
		-- JL_jineng=Part4_JL
		-- JL_jineng_lv=Part5_JL
	-- elseif Part6_JL==16 then
		-- JL_jineng=Part6_JL
		-- JL_jineng_lv=Part7_JL
	-- end
	local JL_jineng_lv=3
	--------------���ߵȼ�ÿ����һ��+1%�ɹ���
	local Gj_lv=0
	if  ItemID[2]==1070 then---------���ߴ���
		Gj_lv=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
	end
	--------------��ɫ�ȼ�ÿ����һ��+5%�ɹ���
	local life_lv = 0
	life_lv=GetSkillLv( role , SK_FENJIE )	-----ȡ��ɫ�ֽ⼼�ܵȼ�
	--------------�����ɹ���10%
	local run_time = math.random ( 4, 8 )
	local word_test = math.floor((JL_jineng_lv*0.05+life_lv*0.02+Gj_lv*0.03+base_rad)*100000)
	if word_test>99999 then
		word_test=99999	
	end
	local word_radom = math.random ( 10000, 99999 )
	local str =""..word_test..","..word_radom
	--Notice( "str=="..str)

	return 2,run_time,str
end
function end_manufacture_item (...)
	local arg = {...}
	--Notice(  "end_manufacture_item")
	local role = 0
	local ItemBag = {}											--���߱���λ��
	local ItemBagCount = 0										--���߶�������

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )
	--Notice( "����ȡ����arg[#arg]=="..arg[#arg])
	--Notice( "����ȡ����#arg=="..#arg)

	local i = 0
	local j = 0
	
	local star_check=0 
	--SystemNotice( role , "end_manufacture_item_star_check=="..star_check)
	star_check=arg[#arg] 
	--SystemNotice( role , "����ȡ����star_check=="..star_check)
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	local check = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )			--ȡ����ָ��
		ItemID[j] = GetItemID ( Item[j] )						--ȡ���߱��
		ItemType[j] = GetItemType ( Item[j] )					--ȡ��������
	end
	local paper_id1=GetItemAttr(Item[2], ITEMATTR_VAL_STR )--�������1ID
	local paper_id2=GetItemAttr(Item[2], ITEMATTR_VAL_CON )--�������2ID
	local paper_id3=GetItemAttr(Item[2], ITEMATTR_VAL_DEX )--�������3ID
	local Num_paper = GetItemForgeParam ( Item[2] , 1 )---------ȡͼֽ�����������Ʒ������
	Num_paper = TansferNum ( Num_paper )
	local Part2_paper = GetNum_Part2 ( Num_paper )	--�������1����
	local Part4_paper = GetNum_Part4 ( Num_paper )	--�������2����
	local Part6_paper = GetNum_Part6 ( Num_paper )	--�������3����
	local life_lv = 0-----------------��ɫ���ܵȼ�
	local Gj_lv= 0-------------------���ߵȼ�
	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )--ȡͼֽ�ȼ�	
	local num_x=1
	local star_num_qulity=4
	if ItemID[2]==2300 then ---------����ͼֽ
		life_lv=GetSkillLv( role , SK_ZHIZAO )	-----ȡ��ɫ���켼�ܵȼ�
		if star_check==1 then
			num_x=0
		elseif star_check==2 or star_check==3 or star_check==4 then
			num_x=1
		elseif star_check==5 or star_check==6 or star_check==7 then 
			num_x=2
		elseif star_check==8 or star_check==9 or star_check==10 then 
			num_x=3
		elseif star_check==11 then
			num_x=4			
		end
	end
	if ItemID[2]==2301 then ---------����ͼֽ
		life_lv=GetSkillLv( role , SK_ZHUZAO )	-----ȡ��ɫ���켼�ܵȼ�
	end
	if ItemID[2]==2302 then ---------���ͼֽ
		life_lv=GetSkillLv( role , SK_PENGREN )	-----ȡ��ɫ��⿼��ܵȼ�
		local differ_check=math.abs(star_check-75)
		--Notice(  "<<<<<<star_check>>>>>>=="..star_check)
		--Notice(  "<<<<<differ_check>>>>>=="..differ_check)
		
		--Notice(  "ItemID=="..ItemID[1])
		if ItemID[1] ==6529 then 
			if differ_check==0 then
				num_x=4
			elseif differ_check==1 then
				num_x=3
			elseif differ_check==2  then
				num_x=2
			elseif differ_check>=3 and differ_check<=6 and star_check<=77 then
				num_x=1
			elseif differ_check>=7 and differ_check<=25 and star_check<=77 then
				num_x=1		
			else
				num_x=0
			end
		elseif ItemID[1] ==6530 then 
			if differ_check==0 then
				num_x=5
			elseif differ_check==1 then
				num_x=4
			elseif differ_check==2  then
				num_x=3
			elseif differ_check>=3 and differ_check<=6 and star_check<=77 then
				num_x=2
			elseif differ_check>=7 and differ_check<=25 and star_check<=77 then
				num_x=1		
			else
				num_x=0
			end
		elseif ItemID[1] ==6531 then
			if differ_check==0 then
				num_x=5
			elseif differ_check==1 then
				num_x=4
			elseif differ_check==2  then
				num_x=3
			elseif differ_check>=3 and differ_check<=6 and star_check<=77 then
				num_x=2
			elseif differ_check>=7 and differ_check<=25 and star_check<=77 then
				num_x=2		
			else
				num_x=0
			end
		else	
			if differ_check==0 then
				num_x=2
			elseif differ_check==1 then
				num_x=2
			elseif differ_check==2  then
				num_x=1
			elseif differ_check>=3 and differ_check<=6 and star_check<=77 then
				num_x=1
			elseif differ_check>=7 and differ_check<=25 and star_check<=77 then
				num_x=1		
			else
				num_x=0
			end
		end
	end
	if ItemID[3]==1067 or ItemID[3]==1068 or ItemID[3]==1069 or ItemID[3]==1070 then---------���ߴ���
		Gj_lv=GetItemAttr ( Item[3] , ITEMATTR_VAL_STR )
	end

	--�Ƴ����ֵ���
	local i1 = 0
	local i2 = 0
	local i3 = 0
	
	local s1 = 0
	local s2 = 0
	local s3 = 0
	i1 =TakeItem( role, 0, paper_id1, Part2_paper)	--�Ƴ�
	i2 =TakeItem( role, 0, paper_id2, Part4_paper)	--�Ƴ�
	i3 =TakeItem( role, 0, paper_id3, Part6_paper)	--�Ƴ�
	
	if ItemID[1]==6529 then    		  --һ�Ƴ������
		s1 =TakeItem( role, 0, 6529, 1)
	elseif  ItemID[1]==6530 then      --һ�Ƴ������
		s2 =TakeItem( role, 0, 6530, 1)
	elseif ItemID[1]==6531 then      --һ�Ƴ������
		s3 =TakeItem( role, 0, 6531, 1)
	else 
		CALCULATE_FORGE_LUA_000162 = GetResString("CALCULATE_FORGE_LUA_000162")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000162)
	end
	
	
	if i1 == 0 or  i2 == 0 or  i3 == 0 then
		CALCULATE_FORGE_LUA_000009 = GetResString("CALCULATE_FORGE_LUA_000009")
		LG( "Hecheng_BS" , CALCULATE_FORGE_LUA_000009 )
	end
	local a1_num=GetItemAttr(Item[2], ITEMATTR_MAXURE )--����Ӳ������
	
	local a1=TakeItem( role, 0, 855, a1_num )			   
	if a1==0  then
		CALCULATE_FORGE_LUA_000163 = GetResString("CALCULATE_FORGE_LUA_000163")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000163)
		return
	end 
	--------ȡ��ͼֽ������Ʒ��ID
	local new_num = GetItemAttr(Item[2], ITEMATTR_VAL_AGI )--ͼֽ������ƷID
		
		-- local  aa=new_num
		
	if ItemID[2]==2300 then ---------����ͼֽ
		if new_num==1067 or  new_num==1068 or new_num==1069 or new_num==1070 or  new_num==2236 then
			num_x=1
		end
	end
	local paper_energy = GetItemAttr(Item[2], ITEMATTR_MAXENERGY )-100--ͼֽ������Ʒ����
	local star_good=0  
	
	if ItemID[1]==6529 then 
		 star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100
	elseif ItemID[1]==6530 then 
		 star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100+5
	elseif ItemID[1]==6531 then 
		 star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100+10
	else star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100-10
	end
	--Notice(  "new_num=="..new_num)
	--Notice ("ԭ��star_good=="..star_good)		
	
	
	local xianshi = {}   	 ---��������Ʒ
	xianshi[1] =1136
	xianshi[2] =2720
	xianshi[6] =1138
	xianshi[7] =2722
	xianshi[11]=1137
	xianshi[12]=2721	
	xianshi[16]=1080  			--���
	xianshi[17]=4022			--ӳ��������
	xianshi[18]=1082     	 	--����
	xianshi[19]=4022     		--ӳ��������
	xianshi[20]=4023			--�˱��м��
	xianshi[21]=2426    		 --������
	xianshi[24]=1083            --����
	xianshi[25]=1087			--ę́
	xianshi[26]=1871			--ף������
	xianshi[27]=4025			--��Ƥ�����
	xianshi[28]=4024			--СС��Ϻ��

	
	local i=0 
	for i =1,28,1 do
		if new_num ==xianshi[i] then	
			star_good =star_good*0.5
			--Notice ("������Ʒ�ɹ����½�һ��star_good=="..star_good)	
		end
		
	end

	---------����ͼֽ---------------------
	local star_radom = math.random ( 1, 100 )
	--SystemNotice( role ,",star_radom=="..star_radom)
	local m1 = -1
	local m2 = -1	
	if ItemID[2]==2300 then 
		if star_check>=2 then
			star_good=100
			star_radom=1
		else
			star_good=1
			star_radom=100
		end
	end
	--SystemNotice( role ,"star_check=="..star_check..",�ɹ���star_good=="..star_good..",�漴��star_radom=="..star_radom..",�������Ʒ����num_x=="..num_x)
	--SystemNotice( role , "������ǰ�������󵱳ɹ��ʴ����漴��ʱ�����ɹ���")
	local star_check_chenggong=0
	if star_check~=0 and star_good >star_radom and num_x~=0 then
		star_check_chenggong=1
		--SystemNotice( role , "star_check=="..star_check..",star_good=="..star_good..",star_radom=="..star_radom..",num_x=="..num_x)	
		m1, m2 = MakeItem ( role , new_num  , num_x , star_num_qulity )	
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		if ItemID[2]==2301 and CheckItem_CanJinglian(Itemfinal)==1 then ---------�������õ�������
			local Itemfinal_energy=GetItemAttr ( Itemfinal ,ITEMATTR_ENERGY) --------ȡװ������
			local itemfinal_maxenergy =GetItemAttrRange(new_num , ITEMATTR_MAXENERGY , 1 )-------��������ֵ ---ȡ��װ�������������
			local itemfinal_minenergy = GetItemAttrRange(new_num ,ITEMATTR_MAXENERGY , 0 )--------�������Сֵ ---ȡ��װ����������
		 	--SystemNotice( role , "Itemfinal_energy=="..Itemfinal_energy)
	 		--SystemNotice( role , "itemfinal_maxenergy=="..itemfinal_maxenergy)
	 		--SystemNotice( role , "itemfinal_minenergy=="..itemfinal_minenergy)
			if paper_energy>7 then
				paper_energy=7
			end 
			if itemfinal_maxenergy~=itemfinal_minenergy then ---------��BOSSװ��������
				Itemfinal_energy=math.fmod(Itemfinal_energy,1000)+paper_energy*1000
				SetItemAttr ( Itemfinal ,ITEMATTR_MAXENERGY , Itemfinal_energy)
				SetItemAttr ( Itemfinal ,ITEMATTR_ENERGY , Itemfinal_energy)
			end
		end
		local item_final_ID=GetItemID(Itemfinal)
			--SystemNotice( role , "item_final_ID="..item_final_ID)
		if item_final_ID==1067 or item_final_ID==1068 or item_final_ID==1069 or item_final_ID==1070 then
			SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)--��ͼֽ�ȼ����ù��ߵȼ�
			SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)--���ù����������
			SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)--���ù��ߵ�ǰ����
		end
		if item_final_ID==2236 then
			SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,paper_lv)--��ͼֽ�ȼ������޲����ߵȼ�
		end
	else
	 	CALCULATE_FORGE_LUA_000164 = GetResString("CALCULATE_FORGE_LUA_000164")
	 	SystemNotice( role , CALCULATE_FORGE_LUA_000164)
	end
	--����ͼֽ����
	local paper_num=GetItemAttr(Item[2], ITEMATTR_VAL_STA )--ͼֽʹ�ô���
	paper_num=paper_num-1

		SetItemAttr(Item[2], ITEMATTR_VAL_STA , paper_num )
	
	local Gj_ure=0
	if ItemID[3]==1067 or ItemID[3]==1068 or ItemID[3]==1069 or ItemID[3]==1070 then---------���ߴ���
		Gj_ure=GetItemAttr ( Item[3] , ITEMATTR_URE )
		local star_gjlv_num=GetItemAttr ( Item[3] , ITEMATTR_VAL_STR )
		Gj_ure=Gj_ure-50*star_gjlv_num
		if Gj_ure<=0 then
			Gj_ure=0
		end
		
		
		
		
		local star_lv_num = GetItemAttr( Item[3] ,ITEMATTR_ENERGY )       --���߾�����Ϣ���Լ�¼���߾���
		if star_check_chenggong==1 then-------�����ɹ�ʱ�����߳�����
			star_lv_num=star_lv_num+paper_lv
		else						--------ʧ��ʱ���鳤1
			star_lv_num=star_lv_num+1			
		end
		if star_lv_num>=10000 then
			star_lv_num=10000
		end
	 	CALCULATE_FORGE_LUA_000165 = GetResString("CALCULATE_FORGE_LUA_000165")
	 	CALCULATE_FORGE_LUA_000166 = GetResString("CALCULATE_FORGE_LUA_000166")
	 	SystemNotice( role , CALCULATE_FORGE_LUA_000166..star_lv_num..CALCULATE_FORGE_LUA_000165)
		if star_lv_num>=star_gjlv_num*star_gjlv_num*100 then --------������������
			star_gjlv_num=star_gjlv_num+1
			SetItemAttr ( Item[3] , ITEMATTR_VAL_STR ,star_gjlv_num)----------���蹤�ߵȼ�
	 		CALCULATE_FORGE_LUA_000167 = GetResString("CALCULATE_FORGE_LUA_000167")
	 		SystemNotice( role , CALCULATE_FORGE_LUA_000167)
			star_lv_num=0
		end
		SetItemAttr (  Item[3] , ITEMATTR_ENERGY , star_lv_num )
		SetItemAttr ( Item[3] , ITEMATTR_URE ,Gj_ure)
	end
	-----------------------------------------------------LG---------------------------------------------------------------------------------------------------------------------
	local cha_name = GetChaDefaultName ( role )
	LG( "star_SHENGHUO_lg" ,cha_name, star_check , ItemID[2] , paper_lv , paper_id1 , Part2_paper ,  paper_id2 , Part4_paper ,  paper_id3 , Part6_paper , ItemID[3] , Gj_lv ,  life_lv )
	SynChaKitbag(role,13)
	--check_item_final_data(Item[2])--------ͼֽ��������
	--check_item_final_data(Item[3])--------������������
	return m2
end
function can_fenjie_item (...)
	local arg = {...}
	--Notice("��ʼ�ж�")
	local ItemBagCount = arg[2]
	--Notice("��������"..ItemBagCount)
	local Length = ItemBagCount+3
	if #arg ~= Length then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		Notice(CALCULATE_FORGE_LUA_000014..#arg)
		return 0
	end	
	local Check = 0
--	SystemNotice( arg[1] , "���÷ֽ���������")
	Check = can_fenjie_item_main ( arg )
	if Check == 1 then		
		return 1
	else
		return 0
	end
	--Notice("��ʼ�жϡ�������")
end


function can_fenjie_item_main ( Table )
	--Notice ( "����ֽ�������")
	local role = 0
	local ItemBag = {}									--���߱���λ��
	local ItemBagCount = 0								--���߶�������
	
	role , ItemBag , ItemBagCount = Read_manufacture ( Table )
	--Notice( "����ֽ�������ItemBag [1]=="..ItemBag [1])
	--Notice( "����ֽ�������ItemBag [2]=="..ItemBag [2])
	--Notice( "����ֽ�������ItemBag [3]=="..ItemBag [3])
	--Notice( "����ֽ�������ItemBag [4]=="..ItemBag [4])
	role , ItemBag , ItemBagCount = Read_manufacture ( Table )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		CALCULATE_FORGE_LUA_000137 = GetResString("CALCULATE_FORGE_LUA_000137")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000137)
		UseItemFailed ( role )
		return
	end
	local i = 0
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for i = 1 , ItemBagCount , 1 do							--�жϵ��߸����Ƿ�ͷ�
		--if ItemBag[i] == 0  then
		--	SystemNotice( role , "���߸����Ƿ�")
		--	return 0
		--end
		--ȡ������(1-����,2-����,3-ԭ��,4-�ֽⷽ��)
		Item[i] = GetChaItem ( role , 2 , ItemBag [i] )			--ȡ����ָ��
		ItemID[i] = GetItemID ( Item[i] )						--ȡ����ID
		ItemType[i] = GetItemType ( Item[i] )					--ȡ��������
		--Notice( " �ֽ�_ItemID["..i.."]=="..ItemID[i])
		--Notice( " �ֽ�_ItemType["..i.."]=="..ItemType[i])
	end
	local type_check=0
	type_check=CheckItem_CanJinglian ( Item[3] )
	if type_check==0 then
		CALCULATE_FORGE_LUA_000168 = GetResString("CALCULATE_FORGE_LUA_000168")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000168)
		return 0		
	end
	
	
	local JL_jineng=0
	local JL_jineng_lv=0
	local life_lv = 0
	life_lv=GetSkillLv( role , SK_FENJIE )	-----ȡ��ɫ�ֽ⼼�ܵȼ�
	
			--SystemNotice( role ,"�ֽⰢ ������������������aaa")

	if  ItemID[2]~=1070 then---------���ߴ���
			CALCULATE_FORGE_LUA_000169 = GetResString("CALCULATE_FORGE_LUA_000169")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000169)
			return 0	
	else
		local Gj_ure=GetItemAttr ( Item[2] , ITEMATTR_URE )
		if Gj_ure<=0 then
			Gj_ure=0
			CALCULATE_FORGE_LUA_000170 = GetResString("CALCULATE_FORGE_LUA_000170")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000170)
			return 0
		end
		local Gj_lv=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
		
	end

	if ItemID[4] ~=2625 and ItemID[4] ~=2630 and ItemID[4] ~=2634 and ItemID[4] ~=2635 and ItemID[4] ~=2636 and ItemID[4] ~=2637 and ItemID[4] ~=2638 and ItemID[4] ~=2639  then	---�߻���
		CALCULATE_FORGE_LUA_000171 = GetResString("CALCULATE_FORGE_LUA_000171")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000171)
		return 0			
	end

	--Notice ( "����ֽ���������������")

	return 1
end

function end_fenjie_item (...)
	local arg = {...}
	--Notice(  "end_fenjie_item")
	local role = 0
	local ItemBag = {}											--���߱���λ��
	--local ItemCount = {}											--��������
	local ItemBagCount = 0										--���߶�������

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )

	local i = 0
	local j = 0
	

	local star_check=0 
	--Notice( "star_check=="..star_check)
	star_check=arg[#arg] 
	--Notice( "�ֽ�_star_check=="..star_check)
	--SystemNotice(role ,"�ֽ�_star_check=="..star_check)
	
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	--local check = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )			--ȡ����ָ��
		ItemID[j] = GetItemID ( Item[j] )						--ȡ���߱��
		ItemType[j] = GetItemType ( Item[j] )					--ȡ��������
	end
	local Item_Lv =  GetItemLv ( Item[3] )
	--Notice( "����ȼ�aaaaaaaaaaaaa")


	--------------���ߵȼ�ÿ����һ��+1%�ɹ���
	local Gj_lv=0
	if  ItemID[2]==1070 then---------���ߴ���
		Gj_lv=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
	end
	--------------��ɫ�ֽ⼼�ܵȼ�ÿ����һ��+5%�ɹ���
	local life_lv = 0
	life_lv=GetSkillLv( role , SK_FENJIE )	-----ȡ��ɫ�ֽ⼼�ܵȼ�
	local num_new =0
	--��������⴦��
		if ItemID[1]==6529 then 
			 num_new =math.min(math.max(1,math.floor( (1*0.1+life_lv*0.05+Gj_lv*0.05 )*10)),10)
			 CALCULATE_FORGE_LUA_000172 = GetResString("CALCULATE_FORGE_LUA_000172")
			 SystemNotice(role ,CALCULATE_FORGE_LUA_000172)
		elseif 	ItemID[1]==6530 then
			 num_new =math.min(math.max(1,math.floor( (2*0.1+life_lv*0.05+Gj_lv*0.05 )*10)),10)
			 CALCULATE_FORGE_LUA_000173 = GetResString("CALCULATE_FORGE_LUA_000173")
			 SystemNotice(role ,CALCULATE_FORGE_LUA_000173)
		elseif 	ItemID[1]==6531 then
			num_new =math.min(math.max(1,math.floor( (3*0.1+life_lv*0.05+Gj_lv*0.05 )*10)),10)
			CALCULATE_FORGE_LUA_000174 = GetResString("CALCULATE_FORGE_LUA_000174")
			SystemNotice(role ,CALCULATE_FORGE_LUA_000174)
		else 
			num_new =math.min(math.max(1,math.floor( (life_lv*0.05+Gj_lv*0.05 )*10)),10)
			
		end
	--Notice( "num_new"..num_new)	
	local i1 = 0
	local i2 = 0
	i1= RemoveChaItem ( role , ItemID[3] , 1 , 2 , ItemBag [3] , 2 , 1 , 1)		--�Ƴ�
	i2= RemoveChaItem ( role , ItemID[4] , 1 , 2 , ItemBag [4] , 2 , 1 , 1)		--�Ƴ�
	if i1 == 0 or  i2 == 0 then
		CALCULATE_FORGE_LUA_000009 = GetResString("CALCULATE_FORGE_LUA_000009")
		LG( "Hecheng_BS" , CALCULATE_FORGE_LUA_000009 )
	end
	local new_num=1346
	if ItemID[4] ==2625 then	---ʯ�Ĵ߻���
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 131, 143 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 116, 130 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 94, 115 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 72, 93 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 49, 71 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 27, 48 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 13, 26 )
		else
			rad1=math.random ( 1, 12 )
		end
		new_num=STONE1_ID[rad1]
	elseif ItemID[4] ==2630	 then ---ʳ�Ĵ߻���
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 150, 151 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 145, 149 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 119, 144 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 101, 118 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 76, 100 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 41, 75 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 25, 40 )
		else
			rad1=math.random ( 1, 24 )
		end
		new_num=FOOD_ID[rad1]
	elseif ItemID[4] ==2634	 then ---����߻���
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 336, 346 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 249, 335 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 191, 248 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 127, 190 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 89, 126 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 57, 88 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 19, 56 )
		else
			rad1=math.random ( 1, 18 )
		end
		new_num=SPECIL_ID[rad1]
	elseif ItemID[4] ==2635	 then ---��ͷ�߻���
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 171, 176 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 155, 170 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 133, 154 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 109, 132 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 88, 108 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 56, 87 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 38, 55 )
		else
			rad1=math.random ( 1, 37 )
		end
		new_num=BONE_ID[rad1]
	elseif ItemID[4] ==2636	 then ---ֲ��߻���
		local rad1=0
		if Item_Lv>=70 then
			rad1=math.random ( 57, 72 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 57, 69 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 57, 63 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 57, 61 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 37, 56 )
		else
			rad1=math.random ( 1, 36 )
		end
		new_num=TREE_ID[rad1]
	elseif ItemID[4] ==2637 then ---ëƤ�߻���
		local rad1=0
		if Item_Lv>=70 then
			rad1=math.random ( 77, 97 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 77, 93 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 63, 81 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 48, 62 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 30, 47 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 20, 29 )
		else
			rad1=math.random ( 1, 19 )
		end
		new_num=SKIP_ID[rad1]
	elseif ItemID[4] ==2638 then ---Һ��߻���
		local rad1=0
		if Item_Lv>=50 then
			rad1=math.random ( 33, 37 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 28, 32 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 19, 27 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 12, 18 )
		else
			rad1=math.random ( 1, 11 )
		end
		new_num=WATER_ID[rad1]
	end
	if ItemID[1]==6529 then    		  --һ�Ƴ������
		s1 =TakeItem( role, 0, 6529, 1)
	elseif  ItemID[1]==6530 then      --һ�Ƴ������
		s2 =TakeItem( role, 0, 6530, 1)
	elseif ItemID[1]==6531 then      --һ�Ƴ������								
		s3 =TakeItem( role, 0, 6531, 1)
	else 
		CALCULATE_FORGE_LUA_000175 = GetResString("CALCULATE_FORGE_LUA_000175")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000175)
	end
	--Notice( "new_num======"..new_num)
	--Notice( "num_new======"..num_new)

	--------���ݷֽⷽ�������Ʒ
	--if star_check~=0  and num_new~=0 then
	GiveItem ( role , 0 , new_num  , num_new , 4  ) 
	--else
	-- 	SystemNotice( role , "��������ĳЩ����ʧ��,�����Ͷ��׷���,����ĳЩ��Ʒ��ʧ��")
	--end
	--���蹤���;�
	if ItemID[2]==1070 then---------���ߴ���
		local Gj_ure=GetItemAttr ( Item[2] , ITEMATTR_URE )
		local star_gjlv_num=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
		Gj_ure=Gj_ure-50*star_gjlv_num
		if Gj_ure<=0 then
			Gj_ure=0
		end
		--if Gj_ure==0 then
		--	local k1 = 0
		--	k1= RemoveChaItem ( role , ItemID[2] , 1 , 2 , ItemBag [2] , 2 , 1 , 1)		--�Ƴ�
	 	--	SystemNotice( role , "���������Ѵ����ޣ��ع����Ȼ��")
		--	if k1 == 0 then
		--		LG( "FENJIE_BS" , "�Ƴ���Ʒʧ��" )
		--	end
		--end
		local star_lv_num = GetItemAttr( Item[2] ,ITEMATTR_ENERGY )       --���߾�����Ϣ���Լ�¼���߾���
		star_lv_num=star_lv_num+1-------�����ɹ�ʱ�����߳�����
		if star_lv_num>=10000 then
			star_lv_num=10000
		end
	 	CALCULATE_FORGE_LUA_000165 = GetResString("CALCULATE_FORGE_LUA_000165")
	 	CALCULATE_FORGE_LUA_000166 = GetResString("CALCULATE_FORGE_LUA_000166")
	 	SystemNotice( role , CALCULATE_FORGE_LUA_000166..star_lv_num..CALCULATE_FORGE_LUA_000165)
		local star_gjlv_num=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
		if star_lv_num>=star_gjlv_num*star_gjlv_num*100 then --------������������
			star_gjlv_num=star_gjlv_num+1
			SetItemAttr ( Item[2] , ITEMATTR_VAL_STR ,star_gjlv_num)----------���蹤�ߵȼ�
	 		CALCULATE_FORGE_LUA_000167 = GetResString("CALCULATE_FORGE_LUA_000167")
	 		SystemNotice( role , CALCULATE_FORGE_LUA_000167)
			star_lv_num=0
		end
		SetItemAttr (  Item[2] , ITEMATTR_ENERGY , star_lv_num )
		SetItemAttr ( Item[2] , ITEMATTR_URE ,Gj_ure)
	end
	--------------LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_FENJIE_lg" ,cha_name, star_check, ItemID[2] , ItemID[3] , ItemID[4] , Gj_lv ,  life_lv )
	--check_item_final_data(Item[3])--------������������
	SynChaKitbag(role,13)
	--Notice(  "end_fenjie_item-------����")
	return 1
end
--�����ƹ�
--�ж��Ƿ��ܹ������ƹ��������ƹ��������
function can_shtool_item(...)
	local arg = {...}
--	Notice ( "�ж��Ƿ���������ƹ�")
	if #arg ~= 10 and #arg ~= 14 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end
	local Check = 0
	Check = can_shtool_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ���������ƹ�������
function can_shtool_item_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	--------���������ж�
	if ItemCount [0] ~= 1 or ItemCount [1] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [1] ~= 1 then
		CALCULATE_FORGE_LUA_000079 = GetResString("CALCULATE_FORGE_LUA_000079")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000079)
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		CALCULATE_FORGE_LUA_000137 = GetResString("CALCULATE_FORGE_LUA_000137")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000137)
		UseItemFailed ( role )
		return
	end
	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--�ƹ�����ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--��������ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )

	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	--------ȡ�ƹ��ȼ�
	local Item_mainitem_Lv =  GetItemAttr ( Item_mainitem, ITEMATTR_VAL_STR )
	--------ȡ�����ȼ�
	local Item_otheritem_Lv =  GetItemAttr ( Item_otheritem , ITEMATTR_VAL_STR)
	-------ȡ�ƹ��;�
	local item_shtool_ure = GetItemAttr(Item_mainitem,ITEMATTR_URE) ---��ǰ�;�
	local item_shtool_maxure = GetItemAttr(Item_mainitem,ITEMATTR_MAXURE) ---����;�
	-------�Ƿ������ƹ�
	if ItemType_mainitem~=70 then
		CALCULATE_FORGE_LUA_000176 = GetResString("CALCULATE_FORGE_LUA_000176")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000176)
		return 0	
	end
	if ItemID_mainitem~=1067 and ItemID_mainitem~=1068 and ItemID_mainitem~=1069 and ItemID_mainitem~=1070 then
		CALCULATE_FORGE_LUA_000176 = GetResString("CALCULATE_FORGE_LUA_000176")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000176)
		return 0	
	end
	-------�Ƿ�������
	if ItemType_otheritem ~= 70 or ItemID_otheritem~=2236 then
		CALCULATE_FORGE_LUA_000177 = GetResString("CALCULATE_FORGE_LUA_000177")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000177)
		return 0	
	end
	-------�ж��ƹ��Ƿ����;�ĥ��
	if item_shtool_ure>=item_shtool_maxure then
		CALCULATE_FORGE_LUA_000178 = GetResString("CALCULATE_FORGE_LUA_000178")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000178)
		return 0	
	end
	-------�ж������ȼ����ƹ��ȼ��Ƿ�ƥ��
	if Item_mainitem_Lv>Item_otheritem_Lv then
		CALCULATE_FORGE_LUA_000179 = GetResString("CALCULATE_FORGE_LUA_000179")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000179)
		return 0	
	end
	--------���Ͻ�Ǯ�ж�
	local Money_Need = get_item_shtool_money ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		CALCULATE_FORGE_LUA_000180 = GetResString("CALCULATE_FORGE_LUA_000180")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000180)
		return 0
	end
	--SystemNotice(role ,"�жϽ��� ")
	return 1
end

--��ʼ�����ƹ��������ƹ����������
function begin_shtool_item(...)
	local arg = {...}
	--Notice("���������ƹ�")
	--------�Ƿ�����ںϼ��
	local Check_Canshtool = 0
	Check_Canshtool = can_shtool_item_main ( arg )
	if Check_Canshtool == 0 then
		return 0
	end
	--------ȡ������
	local role = 0
	local ItemBag = {}											--���߱���λ��
	local ItemCount = {}											--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	
	--------�۳���Ǯ
	local Money_Need = get_item_shtool_money ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	--Money_Have = Money_Have - Money_Need
	--SetCharaAttr ( Money_Have , role , ATTR_GD )
	--ALLExAttrSet( role )
	TakeMoney(role,nil,Money_Need)

	--------�����ƹ�����
	Check_shtool_Item = shtool_item ( arg )
	if Check_shtool_Item == 0  then
		CALCULATE_FORGE_LUA_000181 = GetResString("CALCULATE_FORGE_LUA_000181")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000181)
	end
	-------check_item_final_data ( Item_Waiguan )
	--------Notice("�����ƹ�����")
	return 1
end

--���������ƹ�����
function get_item_shtool_money(...)
	local arg = {...}
	--Notice("�������")
	local Money = shtool_money_main ( arg )
	return Money
end

--���������ƹ�����������
function shtool_money_main ( Table )
	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	--------ȡ������ָ��
	--local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--�ƹ�����ָ��
	--------ȡ����ID
       -- local Item_mainitem_Lv = GetItemAttr ( Item_mainitem, ITEMATTR_VAL_STR )
	local Money_Need=200--*Item_mainitem_Lv*Item_mainitem_Lv
	--Notice("�������")
	return Money_Need
end

----��غ���--------------------------------------------------------------------------------------------------------		elseif funclist[id].func == PlayEffect then
------------------------------------------------------------------------------------------------		ChaPlayEffect( npc, funclist[id].p1 )
---��ʼ�����ƹ�
function shtool_item ( Table )
	--	Notice("Ronghe_Item")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	--------ȡ������ָ��
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )	--��װ������ָ��
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )	--����װ������ָ��
	--------ȡ��������	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )
	--------ȡ����ID
        local ItemID_mainitem = GetItemID ( Item_mainitem )
        local ItemID_otheritem = GetItemID ( Item_otheritem )
	-------ȡ�ƹ��;�
	local item_shtool_ure = GetItemAttr(Item_mainitem,ITEMATTR_URE) ---��ǰ�;�
	local item_shtool_maxure = GetItemAttr(Item_mainitem,ITEMATTR_MAXURE) ---����;�

	SetItemAttr ( Item_mainitem ,ITEMATTR_URE, item_shtool_maxure )
	--------------���LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_xiuguo_lg" ,cha_name, ItemID_mainitem , ItemID_otheritem )

	local R1 = 0
	R1 = RemoveChaItem ( role , Item_otheritem , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )		--�Ƴ�����
	if R1 == 0 then
		CALCULATE_FORGE_LUA_000105 = GetResString("CALCULATE_FORGE_LUA_000105")
		SystemNotice( role , CALCULATE_FORGE_LUA_000105)
		return
	end
	SynChaKitbag(role,13)
end


-----------------------------------------------Ԫ���һ�ȯ1-4
 function GetChaName_4 ( role,npc )
	local el1= CheckBagItem( role,2242 )			
	local el2 = CheckBagItem( role,2243 )
	local el3 = CheckBagItem( role,2244 )
	local el4 = CheckBagItem( role,2245 )  
		if el1 ~=0  then 
			TakeItem( role, 0,2242, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 ) 
		elseif el2 ~= 0  then
			TakeItem( role, 0,2243, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 ) 
		elseif el3 ~= 0  then
			TakeItem( role, 0,2244, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 )  
		elseif el4 ~= 0  then
			TakeItem( role, 0,2245, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 )  
		else
			CALCULATE_FORGE_LUA_000182 = GetResString("CALCULATE_FORGE_LUA_000182")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000182)
		end
	end

	-------------------------------------�Ĺ����һ�Ħ����ʯ
function GetChaName_5 ( role,npc )
	local cha_name = GetChaDefaultName ( role )

	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	
	local am1 = CheckBagItem( role, 2240 )			
	if am1 < 1 then
		CALCULATE_FORGE_LUA_000183 = GetResString("CALCULATE_FORGE_LUA_000183")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000183)
		return
	else
	local am2 =TakeItem( role, 0,2240, 1 )			                   
		if am2==0  then
			CALCULATE_FORGE_LUA_000184 = GetResString("CALCULATE_FORGE_LUA_000184")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000184)
			return
		end
	end
	GiveItem( role , 0 , 1028  , 1 , 4 )
	CALCULATE_FORGE_LUA_000185 = GetResString("CALCULATE_FORGE_LUA_000185")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000185)	
end

-----------------------------------------------��ĸ���һ�
 function GetChaName_6 ( role,npc )
	
				
		
	local el_count0 = CheckBagItem ( role , 3850)
	local el_count1 = CheckBagItem ( role , 3853)
	local el_count2 = CheckBagItem ( role , 3854)
	local el_count3 = CheckBagItem ( role , 3856)
	local el_count4 = CheckBagItem ( role , 3857)
	local el_count5 = CheckBagItem ( role , 3858)
	local el_count6 = CheckBagItem ( role , 3863)
	local el_count7 = CheckBagItem ( role , 3866)
	local el_count8 = CheckBagItem ( role , 3868)
	local el_count9 = CheckBagItem ( role , 3870)
	local el_count10 = CheckBagItem ( role ,3872 )--��鱳���п�Ƭ����


		if el_count0 >= 1 and el_count1 >= 1 and el_count2 >= 1 and el_count3 >= 2 and el_count4 >= 3 and el_count5 >= 2 and el_count6 >= 2 and el_count7 >= 1 and el_count8 >= 1 and el_count9 >= 1 and el_count10 >= 1 then 
		
		local x_del_0 = DelBagItem ( role , 3850 , 1 ) 
		local x_del_1 = DelBagItem ( role , 3853 , 1 ) 
		local x_del_2 = DelBagItem ( role , 3854 , 1 ) 
		local x_del_3 = DelBagItem ( role , 3856 , 2 ) 
		local x_del_4 = DelBagItem ( role , 3857 , 3 ) 
		local x_del_5 = DelBagItem ( role , 3858 , 2 ) 
		local x_del_6 = DelBagItem ( role , 3863 , 2 ) 
		local x_del_7 = DelBagItem ( role , 3866 , 1 ) 
		local x_del_8 = DelBagItem ( role , 3868 , 1 ) 
		local x_del_9 = DelBagItem ( role , 3870 , 1 ) 
		local x_del_10 = DelBagItem ( role ,3872 , 1 ) 

		else
			CALCULATE_FORGE_LUA_000187 = GetResString("CALCULATE_FORGE_LUA_000187")
			SystemNotice( role ,CALCULATE_FORGE_LUA_000187)
			return
		end
		local a = math.random ( 1 , 6 )
			    if a == 1 then
				       GiveItem( role , 0 , 2536  , 1 , 4 )
		        elseif a == 2 then 
					GiveItem( role , 0 , 2533  , 1 , 4 )
		        elseif a == 3 then	--����
					GiveItem( role , 0 , 2539  , 1 , 4 )
			 elseif a == 4 then --�޽�
					GiveItem( role , 0 , 2530  , 1 , 4 )
			elseif a == 5 then	--ʥְ
					GiveItem( role , 0 ,2542  , 1 , 4 )
			elseif a == 6 then	--��ӡ
					GiveItem( role , 0 , 2545  , 1 , 4 )

			end
end



--------------------------------------�һ����������
function GetChaName_7 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2846 )	
	local am2 = CheckBagItem( role, 2847 )	
	local am3 = CheckBagItem( role, 2848 )	
	local am4 = CheckBagItem( role, 2849 )	
	local am5 = CheckBagItem( role, 2850 )	
	local am6 = CheckBagItem( role, 2851 )	
	local am7 = CheckBagItem( role, 2852 )	
	local am8 = CheckBagItem( role, 2853 )	
	       
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1 or am6 < 1 or am7 < 1 or am8 < 1   then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2846, 1 )
	local an2 =TakeItem( role, 0,2847, 1 )
	local an3 =TakeItem( role, 0,2848, 1 )
	local an4 =TakeItem( role, 0,2849, 1 )
	local an5 =TakeItem( role, 0,2850, 1 )
	local an6 =TakeItem( role, 0,2851, 1 )
	local an7 =TakeItem( role, 0,2852, 1 )
	local an8 =TakeItem( role, 0,2853, 1 )
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 or an6==0 or an7==0 or an8==0  then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2934  , 1 , 4 ) 
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000191 = GetResString("CALCULATE_FORGE_LUA_000191")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000192 = GetResString("CALCULATE_FORGE_LUA_000192")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000193 = GetResString("CALCULATE_FORGE_LUA_000193")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000194 = GetResString("CALCULATE_FORGE_LUA_000194")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000195 = GetResString("CALCULATE_FORGE_LUA_000195")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000196 = GetResString("CALCULATE_FORGE_LUA_000196")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000197 = GetResString("CALCULATE_FORGE_LUA_000197")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000198 = GetResString("CALCULATE_FORGE_LUA_000198")
	LG( "SSYRDH" ,cha_name,CALCULATE_FORGE_LUA_000198..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000197..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000196..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000195..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000194..am5..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000193..am6..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000192..am7..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000191..am8..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000199 = GetResString("CALCULATE_FORGE_LUA_000199")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000199)
	end
end


----------------------------------�һ�����˹������

function GetChaName_8 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2927 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2927, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2935  , 1 , 4 ) 
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000200 = GetResString("CALCULATE_FORGE_LUA_000200")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000201 = GetResString("CALCULATE_FORGE_LUA_000201")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000202 = GetResString("CALCULATE_FORGE_LUA_000202")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000203 = GetResString("CALCULATE_FORGE_LUA_000203")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000204 = GetResString("CALCULATE_FORGE_LUA_000204")
	LG( "HDSZZDH" ,cha_name,CALCULATE_FORGE_LUA_000204..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000203..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000202..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000201..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000200..am5..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000205 = GetResString("CALCULATE_FORGE_LUA_000205")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000205)
	end
end


----------------------------------�һ��ڰ�������

function GetChaName_9 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2928 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2928, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2936  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000206 = GetResString("CALCULATE_FORGE_LUA_000206")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000201 = GetResString("CALCULATE_FORGE_LUA_000201")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000202 = GetResString("CALCULATE_FORGE_LUA_000202")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000203 = GetResString("CALCULATE_FORGE_LUA_000203")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000204 = GetResString("CALCULATE_FORGE_LUA_000204")
	LG( "HAZZDH" ,cha_name,CALCULATE_FORGE_LUA_000204..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000203..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000202..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000201..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000206..am5..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000207 = GetResString("CALCULATE_FORGE_LUA_000207")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000207)
	end
end


----------------------------------�һ�����������

function GetChaName_10 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2929 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2929, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2937  , 1 , 4 ) 
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000208 = GetResString("CALCULATE_FORGE_LUA_000208")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000201 = GetResString("CALCULATE_FORGE_LUA_000201")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000202 = GetResString("CALCULATE_FORGE_LUA_000202")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000203 = GetResString("CALCULATE_FORGE_LUA_000203")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000204 = GetResString("CALCULATE_FORGE_LUA_000204")
	LG( "DYZZDH" ,cha_name,CALCULATE_FORGE_LUA_000204..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000203..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000202..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000201..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000208..am5..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000209 = GetResString("CALCULATE_FORGE_LUA_000209")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000209)
	end
end


----------------------------------�һ���ڤ������

function GetChaName_11  ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2931 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2931, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2939  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000210 = GetResString("CALCULATE_FORGE_LUA_000210")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000201 = GetResString("CALCULATE_FORGE_LUA_000201")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000202 = GetResString("CALCULATE_FORGE_LUA_000202")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000203 = GetResString("CALCULATE_FORGE_LUA_000203")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000204 = GetResString("CALCULATE_FORGE_LUA_000204")
	LG( "YMZZDH" ,cha_name,CALCULATE_FORGE_LUA_000204..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000203..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000202..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000201..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000210..am5..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000211 = GetResString("CALCULATE_FORGE_LUA_000211")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000211)
	end
end


----------------------------------�һ�ڤ�ӵ�����

function GetChaName_12 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2932 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2932, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2940  , 1 , 4 ) 
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000212 = GetResString("CALCULATE_FORGE_LUA_000212")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000201 = GetResString("CALCULATE_FORGE_LUA_000201")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000202 = GetResString("CALCULATE_FORGE_LUA_000202")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000203 = GetResString("CALCULATE_FORGE_LUA_000203")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000204 = GetResString("CALCULATE_FORGE_LUA_000204")
	LG( "MHZZDH" ,cha_name,CALCULATE_FORGE_LUA_000204..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000203..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000202..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000201..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000212..am5..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000213 = GetResString("CALCULATE_FORGE_LUA_000213")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000213)
	end
end


----------------------------------�һ����޵�����

function GetChaName_13 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2930 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2930, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2938  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000214 = GetResString("CALCULATE_FORGE_LUA_000214")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000201 = GetResString("CALCULATE_FORGE_LUA_000201")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000202 = GetResString("CALCULATE_FORGE_LUA_000202")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000203 = GetResString("CALCULATE_FORGE_LUA_000203")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000204 = GetResString("CALCULATE_FORGE_LUA_000204")
	LG( "XLZZDH" ,cha_name,CALCULATE_FORGE_LUA_000204..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000203..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000202..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000201..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000214..am5..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000215 = GetResString("CALCULATE_FORGE_LUA_000215")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000215)
	end
end


----------------------------------�һ�����˹�Ļ���

function GetChaName_14 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2935 )	
	
	if am1 < 1 or am2 < 1 then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2935, 1 )
	
	if an1==0 or an2==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2562  , 1 , 4 ) 
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000216 = GetResString("CALCULATE_FORGE_LUA_000216")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000217 = GetResString("CALCULATE_FORGE_LUA_000217")
	LG( "HDSHPDH" ,cha_name,CALCULATE_FORGE_LUA_000217..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000216..am2..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000218 = GetResString("CALCULATE_FORGE_LUA_000218")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000218)
	end
end


----------------------------------�һ��ڰ��Ļ���

function GetChaName_15 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2936 )	
	
	if am1 < 1 or am2 < 1 then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2936, 1 )
	
	if an1==0 or an2==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2563  , 1 , 4 ) 
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000219 = GetResString("CALCULATE_FORGE_LUA_000219")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000217 = GetResString("CALCULATE_FORGE_LUA_000217")
	LG( "HAHPDH" ,cha_name,CALCULATE_FORGE_LUA_000217..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000219..am2..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000220 = GetResString("CALCULATE_FORGE_LUA_000220")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000220)
	end
end


----------------------------------�һ������Ļ���

function GetChaName_16 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2937 )	
	
	if am1 < 1 or am2 < 1 then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2937, 1 )
	
	if an1==0 or an2==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2564  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000221 = GetResString("CALCULATE_FORGE_LUA_000221")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000217 = GetResString("CALCULATE_FORGE_LUA_000217")
	LG( "DYHPDH" ,cha_name,CALCULATE_FORGE_LUA_000217..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000221..am2..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000222 = GetResString("CALCULATE_FORGE_LUA_000222")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000222)
	end
end


----------------------------------�һ���ڤ�Ļ���

function GetChaName_17 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2939 )	
	
	if am1 < 1 or am2 < 1 then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2939, 1 )
	
	if an1==0 or an2==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2566  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000223 = GetResString("CALCULATE_FORGE_LUA_000223")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000217 = GetResString("CALCULATE_FORGE_LUA_000217")
	LG( "YMHPDH" ,cha_name,CALCULATE_FORGE_LUA_000217..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000223..am2..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000224 = GetResString("CALCULATE_FORGE_LUA_000224")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000224)
	end
end


----------------------------------�һ�ڤ�ӵĻ���

function GetChaName_18 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2940 )	
	
	if am1 < 1 or am2 < 1 then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2940, 1 )
	
	if an1==0 or an2==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2567  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000225 = GetResString("CALCULATE_FORGE_LUA_000225")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000217 = GetResString("CALCULATE_FORGE_LUA_000217")
	LG( "MHHPDH" ,cha_name,CALCULATE_FORGE_LUA_000217..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000225..am2..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000226 = GetResString("CALCULATE_FORGE_LUA_000226")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000226)
	end
end


----------------------------------�һ����޵Ļ���

function GetChaName_19 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2938 )	
	
	if am1 < 1 or am2 < 1 then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2938, 1 )
	
	if an1==0 or an2==0 then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2565  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000227 = GetResString("CALCULATE_FORGE_LUA_000227")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000217 = GetResString("CALCULATE_FORGE_LUA_000217")
	LG( "XLHPDH" ,cha_name,CALCULATE_FORGE_LUA_000217..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000227..am2..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000228 = GetResString("CALCULATE_FORGE_LUA_000228")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000228)
	end
end

--------------------------------------�һ������Ļ���
function GetChaName_20 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2562 )	
	local am2 = CheckBagItem( role, 2563 )	
	local am3 = CheckBagItem( role, 2564 )	
	local am4 = CheckBagItem( role, 2565 )	
	local am5 = CheckBagItem( role, 2566 )	
	local am6 = CheckBagItem( role, 2567 )	
	local am7 = CheckBagItem( role, 2933 )	
	local am8 = CheckBagItem( role, 2934 )	
	       
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1 or am6 < 1 or am7 < 1 or am8 < 1   then
		CALCULATE_FORGE_LUA_000188 = GetResString("CALCULATE_FORGE_LUA_000188")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000188)
		return
	end
	local an1 =TakeItem( role, 0,2562, 1 )
	local an2 =TakeItem( role, 0,2563, 1 )
	local an3 =TakeItem( role, 0,2564, 1 )
	local an4 =TakeItem( role, 0,2565, 1 )
	local an5 =TakeItem( role, 0,2566, 1 )
	local an6 =TakeItem( role, 0,2567, 1 )
	local an7 =TakeItem( role, 0,2933, 1 )
	local an8 =TakeItem( role, 0,2934, 1 )
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 or an6==0 or an7==0 or an8==0  then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2404  , 1 , 4 ) 
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000229 = GetResString("CALCULATE_FORGE_LUA_000229")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000217 = GetResString("CALCULATE_FORGE_LUA_000217")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000230 = GetResString("CALCULATE_FORGE_LUA_000230")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000231 = GetResString("CALCULATE_FORGE_LUA_000231")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000232 = GetResString("CALCULATE_FORGE_LUA_000232")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000233 = GetResString("CALCULATE_FORGE_LUA_000233")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000234 = GetResString("CALCULATE_FORGE_LUA_000234")
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000235 = GetResString("CALCULATE_FORGE_LUA_000235")
	LG( "HLHPDH" ,cha_name,CALCULATE_FORGE_LUA_000235..am1..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000234..am2..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000233..am3..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000232..am4..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000231..am5..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000230..am6..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000217..am7..CALCULATE_FORGE_LUA_000190,CALCULATE_FORGE_LUA_000229..am8..CALCULATE_FORGE_LUA_000190)
	CALCULATE_FORGE_LUA_000236 = GetResString("CALCULATE_FORGE_LUA_000236")
	CALCULATE_FORGE_LUA_000186 = GetResString("CALCULATE_FORGE_LUA_000186")
	Notice(CALCULATE_FORGE_LUA_000186..cha_name..CALCULATE_FORGE_LUA_000236)
	end
end
-------------------------------------�����̴��һ��氮������1��
function GetChaName_21 ( role,npc )

	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 31421 then
		CALCULATE_FORGE_LUA_000237 = GetResString("CALCULATE_FORGE_LUA_000237")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000237 )
		UseItemFailed ( role )
		return
	end
	
	local cha_name = GetChaDefaultName ( role )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	
	local am1 = CheckBagItem( role, 1649 )	
	       am2 = CheckBagItem( role, 3130 )
	       am3 = CheckBagItem( role, 1641 )
	       am4 = CheckBagItem( role, 4418 )
	if am1 < 1 or am2<1 or am3<1 or am4<1 then
		CALCULATE_FORGE_LUA_000238 = GetResString("CALCULATE_FORGE_LUA_000238")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000238)
		return
	else
	local am5 =TakeItem( role, 0,1649, 1)
	       am6 =TakeItem( role, 0,3130, 1)
	       am7 =TakeItem( role, 0,1641, 1)
	       am8 =TakeItem( role, 0,4418, 1)
		if am5==0 or am6==0 or am7==0 or am8==0 then
			CALCULATE_FORGE_LUA_000239 = GetResString("CALCULATE_FORGE_LUA_000239")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000239)
			return
		end
	end
	GiveItem( role , 0 , 1074  , 1 , 4 )
	CALCULATE_FORGE_LUA_000240 = GetResString("CALCULATE_FORGE_LUA_000240")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	LG( "ZAZZ" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000240 )
end



-------------------------------------�����̴��һ������ɿ���1��
function GetChaName_22 ( role,npc )
		
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	
	if CheckDateNum < 31420  then
		CALCULATE_FORGE_LUA_000241 = GetResString("CALCULATE_FORGE_LUA_000241")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000241 )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 31421 then
		CALCULATE_FORGE_LUA_000237 = GetResString("CALCULATE_FORGE_LUA_000237")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000237 )
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role )

	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	
	local am1 = CheckBagItem( role, 1074 )			
	if am1 < 10 then
		CALCULATE_FORGE_LUA_000242 = GetResString("CALCULATE_FORGE_LUA_000242")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000242)
		return
	else
	local am2 =TakeItem( role, 0,1074, 10)			                   
		if am2==0  then
			CALCULATE_FORGE_LUA_000243 = GetResString("CALCULATE_FORGE_LUA_000243")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000243)
			return
		end
	end
	GiveItem( role , 0 , 3077  , 1 , 4 )
end


-------------------------------------�����̴��һ�Ŭ��������3��
function GetChaName_23 ( role,npc )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum < 31420  then
		CALCULATE_FORGE_LUA_000241 = GetResString("CALCULATE_FORGE_LUA_000241")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000241 )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 31421 then
		CALCULATE_FORGE_LUA_000237 = GetResString("CALCULATE_FORGE_LUA_000237")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000237 )
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	
	local am1 = CheckBagItem( role, 1074 )			
	if am1 < 100 then
		CALCULATE_FORGE_LUA_000242 = GetResString("CALCULATE_FORGE_LUA_000242")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000242)
		return
	else
	local am2 =TakeItem( role, 0,1074, 100)			                   
		if am2==0  then
			CALCULATE_FORGE_LUA_000244 = GetResString("CALCULATE_FORGE_LUA_000244")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000244)
			return
		end
	end
	GiveItem( role , 0 , 3094  , 3 , 4 )
end


-------------------------------------�����̴��һ�����4���Ʊ1��
function GetChaName_24 ( role,npc )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum < 31420  then
		CALCULATE_FORGE_LUA_000241 = GetResString("CALCULATE_FORGE_LUA_000241")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000241 )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 31421 then
		CALCULATE_FORGE_LUA_000237 = GetResString("CALCULATE_FORGE_LUA_000237")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000237 )
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	
	local am1 = CheckBagItem( role, 1074 )			
	if am1 < 1000 then
		CALCULATE_FORGE_LUA_000242 = GetResString("CALCULATE_FORGE_LUA_000242")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000242)
		return
	else
	local am2 =TakeItem( role, 0,1074, 1000)			                   
		if am2==0  then
			CALCULATE_FORGE_LUA_000245 = GetResString("CALCULATE_FORGE_LUA_000245")
			SystemNotice ( role ,CALCULATE_FORGE_LUA_000245)
			return
		end
	end
	GiveItem( role , 0 , 2844  , 1 , 4 )
end

----------------------------------�һ�ת����

function GetChaName_25 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000053 = GetResString("CALCULATE_FORGE_LUA_000053")
		SystemNotice(role,CALCULATE_FORGE_LUA_000053)
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(role,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	local am1 = CheckBagItem( role, 2235 )	
	
	
	if am1 < 1  then
		CALCULATE_FORGE_LUA_000246 = GetResString("CALCULATE_FORGE_LUA_000246")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000246)
		return
	end
	local an1 =TakeItem( role, 0,2235, 1 )
	
	
	if an1==0  then
		CALCULATE_FORGE_LUA_000189 = GetResString("CALCULATE_FORGE_LUA_000189")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000189)
	else
	GiveItem ( role , 0 , 2941  , 1 , 4 )
	CALCULATE_FORGE_LUA_000190 = GetResString("CALCULATE_FORGE_LUA_000190")
	CALCULATE_FORGE_LUA_000247 = GetResString("CALCULATE_FORGE_LUA_000247")
	LG( "ZSK" ,cha_name,CALCULATE_FORGE_LUA_000247..am1..CALCULATE_FORGE_LUA_000190)
	end
end


---------------------------------------------------
------ʥս�������񲿷�--Roico
---------------------------------------------------

function GetChaName1_guildwar( role,npc )-------------��������������
    local num_count = CheckBagItem(role, 2859)
    if num_count >=20 then
        TakeItem( role, 0,2859, 20 )
	local a = math.random ( 1 , 4 )
        if a == 1 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
        AddState ( role , role , STATE_QINGZ , 10 , 300 )---5����15%�ٶ�����
	elseif a ==2 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_YS , 10 , 300 )---5����Ǳ��
	elseif a ==3 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_HFZQ , 10 , 10 )---10����hp��spȫ��
	else
	AddState ( role , role , STATE_JRQKL , 10 , 180 )---3���Ӿ����ɿ���Ч��
	end
    end
    if num_count < 20 then
    CALCULATE_FORGE_LUA_000248 = GetResString("CALCULATE_FORGE_LUA_000248")
    SystemNotice( role ,CALCULATE_FORGE_LUA_000248)
    end
end


function GetChaName2_guildwar( role,npc )------���������������

 local map_name_role = GetChaMapName ( role )

 if  map_name_role == "guildwar" then
     local bs_def = Def(haijunSide_BaseRole)
     local bs_reseist = Resist(haijunSide_BaseRole)
     local def_20 = 20
     local pedf_1 = 1
     local bs_def_after = bs_def + def_20
     local bs_reseist_after = bs_reseist + pedf_1
    
  
     local num_count = CheckBagItem(role, 4546)
      if num_count >=30 then
         TakeItem( role, 0,4546, 30 )
	 SetChaAttrI( haijunSide_BaseRole , ATTR_DEF ,bs_def_after )
	 SetChaAttrI( haijunSide_BaseRole , ATTR_PDEF, bs_reseist_after )
	 CALCULATE_FORGE_LUA_000249 = GetResString("CALCULATE_FORGE_LUA_000249")
	 SystemNotice( role ,CALCULATE_FORGE_LUA_000249)
      end
      if num_count < 30 then
      CALCULATE_FORGE_LUA_000250 = GetResString("CALCULATE_FORGE_LUA_000250")
      SystemNotice( role ,CALCULATE_FORGE_LUA_000250)
      end
     
 elseif map_name_role == "guildwar2" then
     local bs_def = Def(di_haijunSide_BaseRole)
     local bs_reseist = Resist(di_haijunSide_BaseRole)
     local def_20 = 20
     local pedf_1 = 1
     local bs_def_after = bs_def + def_20
     local bs_reseist_after = bs_reseist + pedf_1

     local num_count = CheckBagItem(role, 4546)
      if num_count >=30 then
         TakeItem( role, 0,4546, 30 )
	 SetChaAttrI( di_haijunSide_BaseRole , ATTR_DEF ,bs_def_after )
	 SetChaAttrI( di_haijunSide_BaseRole , ATTR_PDEF, bs_reseist_after )
	 CALCULATE_FORGE_LUA_000249 = GetResString("CALCULATE_FORGE_LUA_000249")
	 SystemNotice( role ,CALCULATE_FORGE_LUA_000249)
      end
      if num_count < 30 then
      CALCULATE_FORGE_LUA_000250 = GetResString("CALCULATE_FORGE_LUA_000250")
      SystemNotice( role ,CALCULATE_FORGE_LUA_000250)
      end
    end
     
end
	

function GetChaName3_guildwar( role,npc )------�����������޵�BUFF
    
 local map_name_role = GetChaMapName ( role )
 if map_name_role == "guildwar" then
    
    local num_count_1 = CheckBagItem(role, 1684)---��Ӳ���
    local num_count_2 = CheckBagItem(role, 4012)---��β���
    if num_count_1 >= 4 and num_count_2 >= 9 then
       TakeItem( role, 0,1684, 4 )
       TakeItem( role, 0,4012, 9 )
       AddState ( haijunSide_BaseRole , haijunSide_BaseRole , STATE_PKWD , 10 , 180 )
       CALCULATE_FORGE_LUA_000251 = GetResString("CALCULATE_FORGE_LUA_000251")
       SystemNotice( role ,CALCULATE_FORGE_LUA_000251)
    else
    CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
    SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
    end
 end
 if map_name_role == "guildwar2" then
  local num_count_1 = CheckBagItem(role, 1684)---��Ӳ���
    local num_count_2 = CheckBagItem(role, 4012)---��β���
    if num_count_1 >= 4 and num_count_2 >= 9 then
       TakeItem( role, 0,1684, 4 )
       TakeItem( role, 0,4012, 9 )
       AddState ( di_haijunSide_BaseRole , di_haijunSide_BaseRole , STATE_PKWD , 10 , 180 )
       CALCULATE_FORGE_LUA_000251 = GetResString("CALCULATE_FORGE_LUA_000251")
       SystemNotice( role ,CALCULATE_FORGE_LUA_000251)
    else
    CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
    SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
    end
   end
  
end



function GetChaName4_guildwar( role,npc )-------����������������
    local map_name_role = GetChaMapName ( role )
 if map_name_role == "guildwar" then

    local num_count_1 = CheckBagItem(role, 4011)---��ˮ
    local num_count_2 = CheckBagItem(role, 1720)---���ͷ
   if num_count_1 >= 12 and num_count_2 >= 12 then
       TakeItem( role, 0,4011, 12 )
       TakeItem( role, 0,1720, 12 )
       local min_atk = Mnatk(haijunSide_JTRole_1)
       local max_atk = Mxatk(haijunSide_JTRole_1)
    
       if min_atk == 0 then
          local min_atk = Mnatk(haijunSide_JTRole_2)
          local max_atk = Mxatk(haijunSide_JTRole_2)
       end
          local min_atk_after = min_atk + 25
          local max_atk_after = max_atk + 25
          SetChaAttrI( haijunSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
          SetChaAttrI( haijunSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
          SetChaAttrI( haijunSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
          SetChaAttrI( haijunSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
          CALCULATE_FORGE_LUA_000253 = GetResString("CALCULATE_FORGE_LUA_000253")
          SystemNotice( role ,CALCULATE_FORGE_LUA_000253)
    elseif num_count_1 < 12 and num_count_2 < 12 then
          CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
          SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
    end
  end
  

 if map_name_role == "guildwar2" then
    local num_count_1 = CheckBagItem(role, 4011)---��ˮ
    local num_count_2 = CheckBagItem(role, 1720)---���ͷ
    if num_count_1 >= 12 and num_count_2 >= 12 then
       TakeItem( role, 0,4011, 12 )
       TakeItem( role, 0,1720, 12 )
       local min_atk = Mnatk(di_haijunSide_JTRole_1)
       local max_atk = Mxatk(di_haijunSide_JTRole_1)
    
	    if min_atk == 0 then
	       local min_atk = Mnatk(di_haijunSide_JTRole_2)
	       local max_atk = Mxatk(di_haijunSide_JTRole_2)
	    end
	       local min_atk_after = min_atk + 25
	       local max_atk_after = max_atk + 25
	       SetChaAttrI( di_haijunSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
	       SetChaAttrI( di_haijunSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
	       SetChaAttrI( di_haijunSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
	       SetChaAttrI( di_haijunSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
	       CALCULATE_FORGE_LUA_000253 = GetResString("CALCULATE_FORGE_LUA_000253")
	       SystemNotice( role ,CALCULATE_FORGE_LUA_000253)
     
      elseif num_count_1 < 12 and num_count_2 < 12 then
             CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
             SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
     end 
    end  
 end



function GetChaName5_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 30641 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)

        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--    end
   elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 30641 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)

        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
    end

end


function GetChaName6_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
    end

end


function GetChaName7_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
    
end

function GetChaName8_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
    end
end

function GetChaName9_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName10_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 11241 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 11241 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

--function GetChaName11_guildwar(role)-------ʹ��15���������·��
--     local num_count_1 = CheckBagItem(role, 176)----��ȱ�Ĺ�ʬ��
--     local map_name_cha = GetChaMapName ( role )
--     if num_count_1 >= 15 and map_name_cha == "guildwar" then
--        TakeItem( role, 0,176, 15 )
--        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
--	local Monster1 =CreateChaX( 999 , 30500 , 30800 , 145 , 310,role )
--	SetChaLifeTime( Monster1, 300 )
--	SetChaSideID(Monster1, 1)
--	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
--	local Monster2 =CreateChaX( 999 , 30641 , 30802 , 145 , 310,role )
--	SetChaLifeTime( Monster2, 300 )
--	SetChaSideID(Monster2, 1)
--	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
--	local Monster3 =CreateChaX( 999 , 30541 , 30702 , 145 , 310,role )
--	SetChaLifeTime( Monster3, 300 )
--	SetChaSideID(Monster3, 1)
--	
--        SystemNotice( role ,"�ɹ�����ͻϮ��")
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
--end

function GetChaName11_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName12_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName13_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end


function GetChaName14_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName15_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName16_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 11041 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 11141 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 11100 , 11800 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 11241 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 11241 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
     elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 11141 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 11100 , 11900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 11241 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 11241 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName17_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
        local Monster1 =CreateChaX( 999 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	local Monster5 =CreateChaX( 999 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	local Monster6 =CreateChaX( 999 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
        local Monster7 =CreateChaX( 999 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	local Monster8 =CreateChaX( 999 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
        local Monster1 =CreateChaX( 1025 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	local Monster5 =CreateChaX( 1025 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	local Monster6 =CreateChaX( 1025 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
        local Monster7 =CreateChaX( 1025 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	local Monster8 =CreateChaX( 1025 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName18_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
       local Monster1 =CreateChaX( 999 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
       local Monster1 =CreateChaX( 1025 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName19_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
       local Monster1 =CreateChaX( 999 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
       local Monster1 =CreateChaX( 1025 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName20_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
       local Monster1 =CreateChaX( 999 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 30841 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 30541 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 30441 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
       local Monster1 =CreateChaX( 1025 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 30841 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 30541 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 30441 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName21_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
      local Monster1 =CreateChaX( 999 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 51241 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 51241 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 51041 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 51141 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
      local Monster1 =CreateChaX( 1025 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 51241 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 51141 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 51041 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 51141 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end

function GetChaName22_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 2964)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
        local Monster1 =CreateChaX( 999 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 11041 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 11141 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 11100 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 11241 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 11241 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 11141 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 11441 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 10941 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
        local Monster1 =CreateChaX( 1025 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 11041 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 11141 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 11100 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 11241 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 11241 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 11141 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 11441 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 10941 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000255 = GetResString("CALCULATE_FORGE_LUA_000255")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000255)
     end
end



---------------------------------------------------
------ʥս�������񲿷�--Roico
---------------------------------------------------

function GetChaName23_guildwar( role,npc )-------------��������������
    local num_count = CheckBagItem(role, 2858)
    if num_count >=20 then
        TakeItem( role, 0,2858, 20 )
	local a = math.random ( 1 , 4 )
        if a == 1 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
        AddState ( role , role , STATE_QINGZ , 10 , 300 )---5����15%�ٶ�����
	elseif a ==2 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_YS , 10 , 300 )---5����Ǳ��
	elseif a ==3 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_HFZQ , 10 , 10 )---10����hp��spȫ��
	else
	AddState ( role , role , STATE_JRQKL , 10 , 180 )---3���Ӿ����ɿ���Ч��
	end
    end
    if num_count < 20 then
    CALCULATE_FORGE_LUA_000248 = GetResString("CALCULATE_FORGE_LUA_000248")
    SystemNotice( role ,CALCULATE_FORGE_LUA_000248)
    end
end


function GetChaName24_guildwar( role,npc )------���������������

     local map_name_role = GetChaMapName ( role )

  if map_name_role == "guildwar" then
     local bs_def = Def(haidaoSide_BaseRole)
     local bs_reseist = Resist(haidaoSide_BaseRole)
     local def_20 = 20 ------20����
     local pedf_1 = 1 -------1�￹
     local bs_def_after = bs_def + def_20
     local bs_reseist_after = bs_reseist + pedf_1
     local num_count = CheckBagItem(role, 4546)
      if num_count >=30 then
         TakeItem( role, 0,4546, 30 )
	 SetChaAttrI( haidaoSide_BaseRole , ATTR_DEF ,bs_def_after )
	 --AddState( haijunSide_BaseRole , haijunSide_BaseRole , STATE_PKLC, 10 , 10800 )
	 SetChaAttrI( haidaoSide_BaseRole , ATTR_PDEF, bs_reseist_after )
	 CALCULATE_FORGE_LUA_000256 = GetResString("CALCULATE_FORGE_LUA_000256")
	 SystemNotice( role ,CALCULATE_FORGE_LUA_000256)
      end
      if num_count < 30 then
      CALCULATE_FORGE_LUA_000250 = GetResString("CALCULATE_FORGE_LUA_000250")
      SystemNotice( role ,CALCULATE_FORGE_LUA_000250)
      end
   elseif map_name_role == "guildwar2" then
     local bs_def = Def(di_haidaoSide_BaseRole)
     local bs_reseist = Resist(di_haidaoSide_BaseRole)
     local def_20 = 20 ------20����
     local pedf_1 = 1 -------1�￹
     local bs_def_after = bs_def + def_20
     local bs_reseist_after = bs_reseist + pedf_1
     local num_count = CheckBagItem(role, 4546)
      if num_count >=30 then
         TakeItem( role, 0,4546, 30 )
	 SetChaAttrI( di_haidaoSide_BaseRole , ATTR_DEF ,bs_def_after )
	 --AddState( haijunSide_BaseRole , haijunSide_BaseRole , STATE_PKLC, 10 , 10800 )
	 SetChaAttrI( di_haidaoSide_BaseRole , ATTR_PDEF, bs_reseist_after )
	 CALCULATE_FORGE_LUA_000256 = GetResString("CALCULATE_FORGE_LUA_000256")
	 SystemNotice( role ,CALCULATE_FORGE_LUA_000256)
      end
      if num_count < 30 then
      CALCULATE_FORGE_LUA_000250 = GetResString("CALCULATE_FORGE_LUA_000250")
      SystemNotice( role ,CALCULATE_FORGE_LUA_000250)
      end
    end
end
	

function GetChaName25_guildwar( role,npc )------�����������޵�BUFF

     local map_name_role = GetChaMapName ( role )
 if map_name_role == "guildwar" then
    local num_count_1 = CheckBagItem(role, 4013)---��̲Ǳˮ��
    local num_count_2 = CheckBagItem(role, 1683)---�����Ƭ
    if num_count_1 >= 4 and num_count_2 >= 9 then
       TakeItem( role, 0,4013, 4 )
       TakeItem( role, 0,1683, 9 )
       AddState ( haidaoSide_BaseRole , haidaoSide_BaseRole , STATE_PKWD , 10 , 180 )
       CALCULATE_FORGE_LUA_000257 = GetResString("CALCULATE_FORGE_LUA_000257")
       SystemNotice( role ,CALCULATE_FORGE_LUA_000257)
    else
    CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
    SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
    end
  end
 if map_name_role == "guildwar2" then
    local num_count_1 = CheckBagItem(role, 4013)---��̲Ǳˮ��
    local num_count_2 = CheckBagItem(role, 1683)---�����Ƭ
    if num_count_1 >= 4 and num_count_2 >= 9 then
       TakeItem( role, 0,4013, 4 )
       TakeItem( role, 0,1683, 9 )
       AddState ( di_haidaoSide_BaseRole , di_haidaoSide_BaseRole , STATE_PKWD , 10 , 180 )
       CALCULATE_FORGE_LUA_000257 = GetResString("CALCULATE_FORGE_LUA_000257")
       SystemNotice( role ,CALCULATE_FORGE_LUA_000257)
    else
    CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
    SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
    end
 end
end



function GetChaName26_guildwar( role,npc )-------����������������

     local map_name_role = GetChaMapName ( role )
 if map_name_role == "guildwar" then
     local num_count_1 = CheckBagItem(role, 4011)---��ˮ
     local num_count_2 = CheckBagItem(role, 1720)---���ͷ
    if num_count_1 >= 12 and num_count_2 >= 12 then
       TakeItem( role, 0,4011, 12 )
       TakeItem( role, 0,1720, 12 )
       local min_atk = Mnatk(haidaoSide_JTRole_1)
       local max_atk = Mxatk(haidaoSide_JTRole_1)
	    if min_atk == 0 then
	       local min_atk = Mnatk(haidaoSide_JTRole_2)
	       local max_atk = Mxatk(haidaoSide_JTRole_2)
	    end
       local min_atk_after = min_atk + 25
       local max_atk_after = max_atk + 25
       SetChaAttrI( haidaoSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
       SetChaAttrI( haidaoSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
       SetChaAttrI( haidaoSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
       SetChaAttrI( haidaoSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
       CALCULATE_FORGE_LUA_000253 = GetResString("CALCULATE_FORGE_LUA_000253")
       SystemNotice( role ,CALCULATE_FORGE_LUA_000253)
   elseif num_count_1 < 12 and num_count_2 < 12 then
       CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
       SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
   end
end
  if map_name_role == "guildwar2" then
     local num_count_1 = CheckBagItem(role, 4011)---��ˮ
     local num_count_2 = CheckBagItem(role, 1720)---���ͷ
    if num_count_1 >= 12 and num_count_2 >= 12 then
	       TakeItem( role, 0,4011, 12 )
	       TakeItem( role, 0,1720, 12 )
	       local min_atk = Mnatk(di_haidaoSide_JTRole_1)
	       local max_atk = Mxatk(di_haidaoSide_JTRole_1)
	    if min_atk == 0 then
	       local min_atk = Mnatk(di_haidaoSide_JTRole_2)
	       local max_atk = Mxatk(di_haidaoSide_JTRole_2)
	    end
	       local min_atk_after = min_atk + 25
	       local max_atk_after = max_atk + 25
	       SetChaAttrI( di_haidaoSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
	       SetChaAttrI( di_haidaoSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
	       SetChaAttrI( di_haidaoSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
	       SetChaAttrI( di_haidaoSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
	       CALCULATE_FORGE_LUA_000253 = GetResString("CALCULATE_FORGE_LUA_000253")
	       SystemNotice( role ,CALCULATE_FORGE_LUA_000253)
     
    
     elseif num_count_1 < 12 and num_count_2 < 12 then
               CALCULATE_FORGE_LUA_000252 = GetResString("CALCULATE_FORGE_LUA_000252")
               SystemNotice( role ,CALCULATE_FORGE_LUA_000252)
     end
   end
end



function GetChaName27_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30741 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)

        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30741 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)

        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end


function GetChaName28_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 51141 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 51141 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end


function GetChaName29_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 11241 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11141 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 11241 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11141 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName30_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30700 , 51700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30841 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30700 , 51770 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30841 , 51670 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName31_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 12000 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11900 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName32_guildwar(role)-------ʹ��15��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 52300 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 52441 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 52541 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 52300 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 52200 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 52100 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

--function GetChaName11_guildwar(role)-------ʹ��15���������·��
--     local num_count_1 = CheckBagItem(role, 176)----��ȱ�Ĺ�ʬ��
--     local map_name_cha = GetChaMapName ( role )
--     if num_count_1 >= 15 and map_name_cha == "guildwar" then
--        TakeItem( role, 0,176, 15 )
--        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
--	local Monster1 =CreateChaX( 999 , 30500 , 30800 , 145 , 310,role )
--	SetChaLifeTime( Monster1, 300 )
--	SetChaSideID(Monster1, 2)
--	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
--	local Monster2 =CreateChaX( 999 , 30641 , 30802 , 145 , 310,role )
--	SetChaLifeTime( Monster2, 300 )
--	SetChaSideID(Monster2, 2)
--	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
--	local Monster3 =CreateChaX( 999 , 30541 , 30702 , 145 , 310,role )
--	SetChaLifeTime( Monster3, 300 )
--	SetChaSideID(Monster3, 2)
--	
--        SystemNotice( role ,"�ɹ�����ͻϮ��")
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
--end

function GetChaName33_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30600 , 10200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30641 , 10302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30541 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 30541 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30600 , 10200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30641 , 10302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30541 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 30541 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName34_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 51200 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 51141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 51241 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 51000 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 51141 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 51341 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 51041 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 51200 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 51141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 51241 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 51000 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 51141 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 51341 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 51041 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName35_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11400 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 11541 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 11400 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 11341 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 11341 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11400 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 11541 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 11400 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 11341 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 11341 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end


function GetChaName36_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30841 , 51600 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30741 , 51600 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30700 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 30641 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 30741 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 30741 , 51300 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName37_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
     elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 ,12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName38_guildwar(role)-------ʹ��30��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 52100 , 52200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 52241 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 52041 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 52400 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 51941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 51941 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
     elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 52100 , 52200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 52241 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 52041 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 52400 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 51941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 51941 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	
        CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
        SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName39_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
        local Monster1 =CreateChaX( 1000 , 30700 , 10500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 30541 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 30741 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 30541 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
        local Monster7 =CreateChaX( 1000 , 30641 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 30841 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 30841 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 30741 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
     elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
        local Monster1 =CreateChaX( 1026 , 30700 , 10500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 30541 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 30741 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 30541 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
        local Monster7 =CreateChaX( 1026 , 30641 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 30841 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 30841 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 30741 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName40_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
       local Monster1 =CreateChaX( 1000 , 52100 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1000 , 52241 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1000 , 52141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 52200 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1000 , 52041 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1000 , 52141 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 52341 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1000 , 52341 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 52041 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 52041 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 52341 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
     elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
       local Monster1 =CreateChaX( 1026 , 52100 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1026 , 52241 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1026 , 52141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 52200 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1026 , 52041 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1026 , 52141 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 52341 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1026 , 52341 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 52041 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 52041 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 52341 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName41_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
       local Monster1 =CreateChaX( 1000 , 11500 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1000 , 11441 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1000 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 11400 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1000 , 11541 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1000 , 11541 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1000 , 11641 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
        local Monster1 =CreateChaX( 1026 , 11500 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1026 , 11441 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1026 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 11400 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1026 , 11541 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1026 , 11541 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1026 , 11641 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName42_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
      local Monster1 =CreateChaX( 1000 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
        local Monster7 =CreateChaX( 1000 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
     elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
        local Monster1 =CreateChaX( 1026 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
        local Monster7 =CreateChaX( 1026 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName43_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
      local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1000 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1000 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1000 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1000 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
      local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1026 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1026 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1026 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1026 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1026 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName44_guildwar(role)-------ʹ��45��������
     local num_count_1 = CheckBagItem(role, 3001)
     local map_name_cha = GetChaMapName ( role )
     if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
       local Monster1 =CreateChaX( 1000 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1000 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1000 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1000 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1000 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1000 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
--     else
--     SystemNotice( role ,"��û���㹻�����ġ��������")
--     end
    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
          local Monster1 =CreateChaX( 1000 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	
	local Monster2 =CreateChaX( 1026 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	
	local Monster3 =CreateChaX( 1026 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	
	local Monster5 =CreateChaX( 1026 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	
	local Monster6 =CreateChaX( 1026 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)

	local Monster8 =CreateChaX( 1026 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
	CALCULATE_FORGE_LUA_000254 = GetResString("CALCULATE_FORGE_LUA_000254")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000254)
     else
     CALCULATE_FORGE_LUA_000258 = GetResString("CALCULATE_FORGE_LUA_000258")
     SystemNotice( role ,CALCULATE_FORGE_LUA_000258)
     end
end

function GetChaName45_guildwar(character,npc)

		local i= CheckBagItem( character, 3849 )
		
		if i~=1 then
			CALCULATE_FORGE_LUA_000259 = GetResString("CALCULATE_FORGE_LUA_000259")
			SystemNotice( character , CALCULATE_FORGE_LUA_000259)
			return 0
		end

		local s= CheckBagItem( character, 2382 )
		if s >=1 then
		CALCULATE_FORGE_LUA_000260 = GetResString("CALCULATE_FORGE_LUA_000260")
		SystemNotice( character , CALCULATE_FORGE_LUA_000260)
			return 0
		end

		local retbag = HasLeaveBagGrid( character, 1)
	        if retbag ~= LUA_TRUE then
		CALCULATE_FORGE_LUA_000055 = GetResString("CALCULATE_FORGE_LUA_000055")
		SystemNotice(character,CALCULATE_FORGE_LUA_000055)
		return 
	end	 
		local role_RY = GetChaItem2 ( character , 2 , 3849 )
                local HonorPoint = GetItemAttr ( role_RY , ITEMATTR_VAL_STR)
                local HonorPoint_now = HonorPoint - 15
	if HonorPoint < 15 then
		CALCULATE_FORGE_LUA_000261 = GetResString("CALCULATE_FORGE_LUA_000261")
		SystemNotice ( character , CALCULATE_FORGE_LUA_000261 )
		return 0
	else
               
	        SetItemAttr( role_RY , ITEMATTR_VAL_STR , HonorPoint_now )
		GiveItem ( character , 0 , 2382  , 1 , 4 )

	end
		
end

-------------------------------ת��Ϊ˫��
function GetChaName1_born ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type==2 or cha_type==4 then
		CALCULATE_FORGE_LUA_000262 = GetResString("CALCULATE_FORGE_LUA_000262")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000262)
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000263 = GetResString("CALCULATE_FORGE_LUA_000263")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000263)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,9 ) 	
	GiveItem_chibang ( role  )				--���
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end
-------------------------------ת��Ϊ�޽�
function GetChaName2_born ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=2 then
		CALCULATE_FORGE_LUA_000264 = GetResString("CALCULATE_FORGE_LUA_000264")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000264)
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000263 = GetResString("CALCULATE_FORGE_LUA_000263")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000263)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,8 )
	GiveItem_chibang ( role  )				--���
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end
-------------------------------ת��Ϊ����ʿ
function GetChaName3_born ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=1 and cha_type~=3 and cha_type~=4 then
		CALCULATE_FORGE_LUA_000265 = GetResString("CALCULATE_FORGE_LUA_000265")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000265)
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000263 = GetResString("CALCULATE_FORGE_LUA_000263")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000263)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,16 ) 	
	GiveItem_chibang ( role  )				--���
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end
-------------------------------ת��Ϊ�ѻ���
function GetChaName4_born ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=1 and cha_type~=3 then
		CALCULATE_FORGE_LUA_000266 = GetResString("CALCULATE_FORGE_LUA_000266")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000266)
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000263 = GetResString("CALCULATE_FORGE_LUA_000263")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000263)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,12 ) 	
	GiveItem_chibang ( role  )				--���
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end
-------------------------------ת��Ϊʥְ��
function GetChaName5_born ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=3 and cha_type~=4 then
		CALCULATE_FORGE_LUA_000267 = GetResString("CALCULATE_FORGE_LUA_000267")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000267)
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000263 = GetResString("CALCULATE_FORGE_LUA_000263")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000263)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,13 ) 	
	GiveItem_chibang ( role  )				--���
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end
-------------------------------ת��Ϊ��ӡʦ
function GetChaName6_born ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=3 and cha_type~=4 then
		CALCULATE_FORGE_LUA_000268 = GetResString("CALCULATE_FORGE_LUA_000268")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000268)
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000263 = GetResString("CALCULATE_FORGE_LUA_000263")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000263)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,14 ) 	
	GiveItem_chibang ( role  )				--���
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end
function GiveItem_chibang ( role  )
        local cha_type = GetChaTypeID ( role )	
	if cha_type==1 then
		GiveItem( role , 0 , 134  , 1 , 4 )
	elseif cha_type==2 then
		GiveItem( role , 0 , 138  , 1 , 4 )
	elseif cha_type==3 then
		GiveItem( role , 0 , 128  , 1 , 4 )
	elseif cha_type==4 then
		GiveItem( role , 0 , 131  , 1 , 4 )
	end
end

function GiveItem_zsbook ( role )
	local cha_job = GetChaAttr(role, ATTR_JOB)
	---SystemNotice( role ,""..cha_job )
	if cha_job == 8 then
		GiveItem( role , 0 , 2957 , 1 , 4 )
	elseif cha_job == 9 then
		GiveItem( role , 0 , 2956 , 1 , 4 )
	elseif cha_job == 12 then
		GiveItem( role , 0 , 2961 , 1 , 4 )
	elseif cha_job == 13 then
		GiveItem( role , 0 , 2959 , 1 , 4 )
	elseif cha_job == 14 then
		GiveItem( role , 0 , 2958 , 1 , 4 )
	elseif cha_job == 16 then
		GiveItem( role , 0 , 2960 , 1 , 4 )
	end
end

-------------------------------ת��
function GetChaName_born ( role )
	---SystemNotice(role ,"GetChaName_born")
	-----------------ȡ��ɫ������
	local cha_name = GetChaDefaultName ( role )
	-----------------ȡ��ɫ�ĵȼ�
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	-----------------ȡ��ɫ��ְҵ
	local cha_job = GetChaAttr(role, ATTR_JOB)
	if cha_job < 8 then
		CALCULATE_FORGE_LUA_000269 = GetResString("CALCULATE_FORGE_LUA_000269")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000269)
		return 0
	end
	-----------------�жϽ�ɫ�������Ƿ����ת��֤��
	local i = CheckBagItem( role, 2235 )    
	if i < 1 then
		CALCULATE_FORGE_LUA_000270 = GetResString("CALCULATE_FORGE_LUA_000270")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000270)
		return 0
	end
	-----------------�жϽ�ɫװ�����Ƿ������
	local item_empty=IsEquip(role)
	if item_empty==LUA_TRUE then
		CALCULATE_FORGE_LUA_000271 = GetResString("CALCULATE_FORGE_LUA_000271")
		SystemNotice(role,CALCULATE_FORGE_LUA_000271)
		return 0	
	end
	-----------------�жϽ�ɫ�������Ƿ��пո�
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 5 then
		CALCULATE_FORGE_LUA_000272 = GetResString("CALCULATE_FORGE_LUA_000272")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000272)
		UseItemFailed ( role )
		return 0
	end
	local zs1 =TakeItem( role, 0,2235, 1 )
	if zs1==0 then
		CALCULATE_FORGE_LUA_000273 = GetResString("CALCULATE_FORGE_LUA_000273")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000273)
		return 0
	end
	------------------�жϽ�ɫ�Ƿ��Ѿ�ת����
	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if Zs_Exp > 0 then
		CALCULATE_FORGE_LUA_000274 = GetResString("CALCULATE_FORGE_LUA_000274")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000274)
		return 0
	end

	--���˽ڽ�ָ�����ж�---JACK
	local QLZX= GetSkillLv ( role, SK_QLZX )
	--�жϽ���

	-----------------ȡ����Ľ�Ǯ
	-----------------��ս�ɫ����
	local cha_skill_num=GetChaAttr(role, ATTR_TP  )
	-----SystemNotice(role ,"ʣ�༼�ܵ�=="..cha_skill_num)
	local clear_skill_num=ClearFightSkill(role)
	-----SystemNotice(role ,"clear_skill_num=="..clear_skill_num)
	-----------------������ɫ���ܵ�
	cha_skill_num=cha_skill_num+clear_skill_num
	--���˽ڽ�ָ���ܴ���---JACK
	if QLZX == 1 then
		cha_skill_num = cha_skill_num - 1
		AddChaSkill ( role , SK_QLZX , 1 , 1 , 0 )
	end
	--���˽ڽ�ָ���ܴ������
	SetChaAttr(role, ATTR_TP ,cha_skill_num ) 
	-----------------ϴ��ɫ���Ե�
	local ap = GetChaAttr( role , ATTR_AP )
	-----SystemNotice(role ,"ʣ�����Ե�=="..ap)
	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
	ap=ap+cha_str+cha_dex+cha_agi+cha_con+cha_sta-25
	SetChaAttr(role, ATTR_BSTR ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BDEX ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BAGI ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BCON,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BSTA,5 ) 
	SyncChar(role,4)
	SetChaAttr(role , ATTR_AP,ap  )
	SyncChar(role,4)
	AddSailExp(role, npc , 1 , 1 )
	local sk_add = SK_ZSSL
	AddChaSkill ( role , sk_add , 1 , 1 , 0 )

	---PlayEffect( npc, 361 )
	CALCULATE_FORGE_LUA_000275 = GetResString("CALCULATE_FORGE_LUA_000275")
	CALCULATE_FORGE_LUA_000276 = GetResString("CALCULATE_FORGE_LUA_000276")
	CALCULATE_FORGE_LUA_000277 = GetResString("CALCULATE_FORGE_LUA_000277")
	Notice(CALCULATE_FORGE_LUA_000277..cha_name..CALCULATE_FORGE_LUA_000276..cha_name..CALCULATE_FORGE_LUA_000275)
	return 1
--	end
end

-------------------------------�ý���֤�����Ӧ���---------forge
function ChangeItem (character,npc)

	local Item_CanGet = GetChaFreeBagGridNum ( character )
	if Item_CanGet <1 then
		CALCULATE_FORGE_LUA_000278 = GetResString("CALCULATE_FORGE_LUA_000278")
		SystemNotice(character ,CALCULATE_FORGE_LUA_000278)
		return 0
	end

	local am1 = CheckBagItem( character, 3066 )			
	if am1 < 1 then
		CALCULATE_FORGE_LUA_000279 = GetResString("CALCULATE_FORGE_LUA_000279")
		SystemNotice( character ,CALCULATE_FORGE_LUA_000279)
		return 0
	end
	local Money_Need = 50000
	local Money_Have = GetChaAttr ( character , ATTR_GD )
	if Money_Need > Money_Have  then
		CALCULATE_FORGE_LUA_000280 = GetResString("CALCULATE_FORGE_LUA_000280")
		SystemNotice( character ,CALCULATE_FORGE_LUA_000280)
		return 0
	else
		TakeMoney(character,nil,Money_Need)
	end

	local r1=0
	local r2=0
	r1,r2 =MakeItem ( character , 3666  , 10 , 4 )
	local Item_el = GetChaItem ( character , 2 , r2 )

	local item_old = GetChaItem2 ( character , 2 , 3066 )
	---------ȡ֤���ʱ��	
	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)		-------------�� 	
	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)			-------------��  
	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)			-------------ʱ   
	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)		-------------��   
	
	--SystemNotice ( character , "old_month=="..old_month )
	--SystemNotice ( character , "old_day=="..old_day )       
	--SystemNotice ( character , "old_hour=="..old_hour )    
	--SystemNotice ( character , "old_miniute=="..old_miniute)

	SetItemAttr(Item_el, ITEMATTR_VAL_STA, old_month )	-------------�� 	
	SetItemAttr(Item_el, ITEMATTR_VAL_STR, old_day )		-------------��  
	SetItemAttr(Item_el, ITEMATTR_VAL_CON, old_hour )		-------------ʱ 
	SetItemAttr(Item_el, ITEMATTR_VAL_DEX, old_miniute )	-------------��

	local old_month2 = GetItemAttr(Item_el, ITEMATTR_VAL_STA)		-------------�� 	
	local old_day2 = GetItemAttr(Item_el, ITEMATTR_VAL_STR)			-------------��  
	local old_hour2 = GetItemAttr(Item_el, ITEMATTR_VAL_CON)			-------------ʱ   
	local old_miniute2 = GetItemAttr(Item_el, ITEMATTR_VAL_DEX)		-------------�� 

	--SystemNotice ( character , "old_month2=="..old_month2 )
	--SystemNotice ( character , "old_day2=="..old_day2 )       
	--SystemNotice ( character , "old_hour2=="..old_hour2 )    
	--SystemNotice ( character , "old_miniute2=="..old_miniute2)

	SynChaKitbag(character,13)
	
end

------------------------------dina֮����begin
-------------------------------����Ϊ˫��
function GetChaName1_born2 ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type==2 or cha_type==4 then
		CALCULATE_FORGE_LUA_000262 = GetResString("CALCULATE_FORGE_LUA_000262")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000262)
		return
	end
	local check=GetChaName_born2 ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000281 = GetResString("CALCULATE_FORGE_LUA_000281")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000281)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,9 ) 	
	GiveItem_chibang2 ( role  )				--���
	GiveItem_zsbook2 ( role )
	SetChaAttrI(role, ATTR_CSAILEXP , 10000)
	RefreshCha ( role )
end
-------------------------------����Ϊ�޽�
function GetChaName2_born2 ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=2 then
		CALCULATE_FORGE_LUA_000264 = GetResString("CALCULATE_FORGE_LUA_000264")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000264)
		return
	end
	local check=GetChaName_born2 ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000281 = GetResString("CALCULATE_FORGE_LUA_000281")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000281)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,8 )
	GiveItem_chibang2 ( role  )				--���
	GiveItem_zsbook2 ( role )
	SetChaAttrI(role, ATTR_CSAILEXP , 10000)
	RefreshCha ( role )
end
-------------------------------����Ϊ����ʿ
function GetChaName3_born2 ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=1 and cha_type~=3 and cha_type~=4 then
		CALCULATE_FORGE_LUA_000265 = GetResString("CALCULATE_FORGE_LUA_000265")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000265)
		return
	end
	local check=GetChaName_born2 ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000281 = GetResString("CALCULATE_FORGE_LUA_000281")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000281)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,16 ) 	
	GiveItem_chibang2 ( role  )				--���
	GiveItem_zsbook2 ( role )
	SetChaAttrI(role, ATTR_CSAILEXP , 10000)
	RefreshCha ( role )
end
-------------------------------����Ϊ�ѻ���
function GetChaName4_born2 ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=1 and cha_type~=3 then
		CALCULATE_FORGE_LUA_000266 = GetResString("CALCULATE_FORGE_LUA_000266")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000266)
		return
	end
	local check=GetChaName_born2 ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000281 = GetResString("CALCULATE_FORGE_LUA_000281")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000281)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,12 ) 	
	GiveItem_chibang2 ( role  )				--���
	GiveItem_zsbook2 ( role )
	SetChaAttrI(role, ATTR_CSAILEXP , 10000)
	RefreshCha ( role )
end
-------------------------------����Ϊʥְ��
function GetChaName5_born2 ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=3 and cha_type~=4 then
		CALCULATE_FORGE_LUA_000267 = GetResString("CALCULATE_FORGE_LUA_000267")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000267)
		return
	end
	local check=GetChaName_born2 ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000281 = GetResString("CALCULATE_FORGE_LUA_000281")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000281)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,13 ) 	
	GiveItem_chibang2 ( role  )				--���
	GiveItem_zsbook2 ( role )
	SetChaAttrI(role, ATTR_CSAILEXP , 10000)
	RefreshCha ( role )
end
-------------------------------����Ϊ��ӡʦ
function GetChaName6_born2 ( role,npc )
	-----------------ȡ��ɫ������
        local cha_type = GetChaTypeID ( role )
	if cha_type~=3 and cha_type~=4 then
		CALCULATE_FORGE_LUA_000268 = GetResString("CALCULATE_FORGE_LUA_000268")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000268)
		return
	end
	local check=GetChaName_born2 ( role )
	if check==0 then
		CALCULATE_FORGE_LUA_000281 = GetResString("CALCULATE_FORGE_LUA_000281")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000281)
		return
	end
	-----------------���ý�ɫְҵ
	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,14 ) 	
	GiveItem_chibang2 ( role  )				--���
	GiveItem_zsbook2 ( role )
	SetChaAttrI(role, ATTR_CSAILEXP , 10000)
	RefreshCha ( role )
end

function GiveItem_chibang2 ( role  )
        local cha_type = GetChaTypeID ( role )	
	if cha_type==1 then
		GiveItem( role , 0 , 136  , 1 , 4 )
	elseif cha_type==2 then
		GiveItem( role , 0 , 139  , 1 , 4 )
	elseif cha_type==3 then
		GiveItem( role , 0 , 129  , 1 , 4 )
	elseif cha_type==4 then
		GiveItem( role , 0 , 132  , 1 , 4 )
	end
end

-------------------------------����
function GetChaName_born2 ( role )
	-----------------ȡ��ɫ������
	local cha_name = GetChaDefaultName ( role )
	-----------------ȡ��ɫ�ĵȼ�
	local cha_lv = GetChaAttr(role, ATTR_LV)
	-----------------ȡ��ɫ��ְҵ
	local cha_job = GetChaAttr(role, ATTR_JOB)
	if cha_job < 8 then
		CALCULATE_FORGE_LUA_000282 = GetResString("CALCULATE_FORGE_LUA_000282")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000282)
		return 0
	end
	-----------------�жϽ�ɫ�������Ƿ��������֤��
	local i = CheckBagItem( role, 5765 )    
	if i < 1 then
		CALCULATE_FORGE_LUA_000283 = GetResString("CALCULATE_FORGE_LUA_000283")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000283)
		return 0
	end
	-----------------�жϽ�ɫװ�����Ƿ������
	local item_empty=IsEquip(role)
	if item_empty==LUA_TRUE then
		CALCULATE_FORGE_LUA_000271 = GetResString("CALCULATE_FORGE_LUA_000271")
		SystemNotice(role,CALCULATE_FORGE_LUA_000271)
		return 0	
	end
	-----------------�жϽ�ɫ�������Ƿ��пո�
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 3 then
		CALCULATE_FORGE_LUA_000284 = GetResString("CALCULATE_FORGE_LUA_000284")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000284)
		UseItemFailed ( role )
		return 0
	end
	local zs1 =TakeItem( role, 0,5765, 1 )
	if zs1==0 then
		CALCULATE_FORGE_LUA_000285 = GetResString("CALCULATE_FORGE_LUA_000285")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000285)
		return 0
	end
	------------------�жϽ�ɫ�Ƿ��Ѿ�������
	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if Zs_Exp >=10000 then
		CALCULATE_FORGE_LUA_000286 = GetResString("CALCULATE_FORGE_LUA_000286")
		SystemNotice(role ,CALCULATE_FORGE_LUA_000286)
		return 0
	end


	--���˽ڽ�ָ�����ж�
	local QLZX= GetSkillLv ( role, SK_QLZX )
	--�жϽ���

	-----------------ȡ����Ľ�Ǯ
	-----------------��ս�ɫ����
	local cha_skill_num=GetChaAttr(role, ATTR_TP  )
	-----SystemNotice(role ,"ʣ�༼�ܵ�=="..cha_skill_num)
	local clear_skill_num=ClearFightSkill(role)
	-----SystemNotice(role ,"clear_skill_num=="..clear_skill_num)
	-----------------������ɫ���ܵ�
	cha_skill_num=cha_skill_num+clear_skill_num
	--���˽ڽ�ָ���ܴ���
	if QLZX == 1 then
		cha_skill_num = cha_skill_num - 1
		AddChaSkill ( role , SK_QLZX , 1 , 1 , 0 )
	end
	--���˽ڽ�ָ���ܴ������
	SetChaAttr(role, ATTR_TP ,cha_skill_num ) 
	-----------------ϴ��ɫ���Ե�
	local ap = GetChaAttr( role , ATTR_AP )
	-----SystemNotice(role ,"ʣ�����Ե�=="..ap)
	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
	ap=ap+cha_str+cha_dex+cha_agi+cha_con+cha_sta-25
	SetChaAttr(role, ATTR_BSTR ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BDEX ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BAGI ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BCON,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BSTA,5 ) 
	SyncChar(role,4)
	SetChaAttr(role , ATTR_AP,ap  )
	SyncChar(role,4)
	AddSailExp(role, npc , 1 , 1 )


	CALCULATE_FORGE_LUA_000275 = GetResString("CALCULATE_FORGE_LUA_000275")
	CALCULATE_FORGE_LUA_000287 = GetResString("CALCULATE_FORGE_LUA_000287")
	CALCULATE_FORGE_LUA_000277 = GetResString("CALCULATE_FORGE_LUA_000277")
	Notice(CALCULATE_FORGE_LUA_000277..cha_name..CALCULATE_FORGE_LUA_000287..cha_name..CALCULATE_FORGE_LUA_000275)
	return 1
	
end

function GiveItem_zsbook2 ( role )
	local cha_job = GetChaAttr(role, ATTR_JOB)
	---SystemNotice( role ,""..cha_job )
	if cha_job == 8 then
		GiveItem( role , 0 , 7609 , 1 , 4 )
	elseif cha_job == 9 then
		GiveItem( role , 0 , 7608 , 1 , 4 )
	elseif cha_job == 12 then
		GiveItem( role , 0 , 7613 , 1 , 4 )
	elseif cha_job == 13 then
		GiveItem( role , 0 , 7611 , 1 , 4 )
	elseif cha_job == 14 then
		GiveItem( role , 0 , 7610 , 1 , 4 )
	elseif cha_job == 16 then
		GiveItem( role , 0 , 7612 , 1 , 4 )
	end
	GiveItem( role , 0 , 1572 , 1 , 4 )
end
------------------------------dina֮����end


-------------����Ӳ������----by L.li 20090320
function can_YBTL_item(role , button ,itemcount)
	if button==1 then
	can_TLHY_item ( role,itemcount )
	return 
	end
	if button==2 then
	can_TLWHY1_item ( role,itemcount )
	return
	end
	if button==3 then
	can_TLWHY2_item ( role,itemcount )
	return
	end
end


function can_TLHY_item ( role,ItemCount1 )
	local yingbiCount=0
	local yingbiNeed=0
	local yingbiNeed =ItemCount1*20
	local yingbiCount=CheckBagItem(role ,855)
	
	local item_elf = GetChaItem(role , 2, 1)			--��ȡ������2�����ָ��
	local item_elf_type = GetItemType ( item_elf )			--��ȡ������2���������
	if item_elf_type ~= 59 then
		CALCULATE_FORGE_LUA_000288 = GetResString("CALCULATE_FORGE_LUA_000288")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000288 ) 
		CALCULATE_FORGE_LUA_000289 = GetResString("CALCULATE_FORGE_LUA_000289")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000289)
		return 
	end	
--------���������ж�
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--��ȡ���鵱ǰhp
	local a=ItemCount1 * 50
	if	item_elf_hp < a then
		CALCULATE_FORGE_LUA_000290 = GetResString("CALCULATE_FORGE_LUA_000290")
		CALCULATE_FORGE_LUA_000291 = GetResString("CALCULATE_FORGE_LUA_000291")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000291..ItemCount1..CALCULATE_FORGE_LUA_000290)
		return 		
	end	
	local item_elf_hp=item_elf_hp - a
	
	if yingbiNeed > yingbiCount then
	CALCULATE_FORGE_LUA_000292 = GetResString("CALCULATE_FORGE_LUA_000292")
	CALCULATE_FORGE_LUA_000293 = GetResString("CALCULATE_FORGE_LUA_000293")
	CALCULATE_FORGE_LUA_000294 = GetResString("CALCULATE_FORGE_LUA_000294")
	HelpInfo(role,0,CALCULATE_FORGE_LUA_000294..ItemCount1..CALCULATE_FORGE_LUA_000293..yingbiNeed..CALCULATE_FORGE_LUA_000292)
	CALCULATE_FORGE_LUA_000292 = GetResString("CALCULATE_FORGE_LUA_000292")
	CALCULATE_FORGE_LUA_000293 = GetResString("CALCULATE_FORGE_LUA_000293")
	CALCULATE_FORGE_LUA_000294 = GetResString("CALCULATE_FORGE_LUA_000294")
	SystemNotice ( role ,CALCULATE_FORGE_LUA_000294..ItemCount1..CALCULATE_FORGE_LUA_000293..yingbiNeed..CALCULATE_FORGE_LUA_000292)
	return
	end
	TakeItem ( role , 0,855 , yingbiNeed )
	SetItemAttr ( item_elf , ITEMATTR_URE , item_elf_hp ) 
	GiveItem(role,0,2588,ItemCount1,4)
	CALCULATE_FORGE_LUA_000292 = GetResString("CALCULATE_FORGE_LUA_000292")
	CALCULATE_FORGE_LUA_000295 = GetResString("CALCULATE_FORGE_LUA_000295")
	CALCULATE_FORGE_LUA_000296 = GetResString("CALCULATE_FORGE_LUA_000296")
	CALCULATE_FORGE_LUA_000297 = GetResString("CALCULATE_FORGE_LUA_000297")
	SystemNotice(role,CALCULATE_FORGE_LUA_000297..ItemCount1..CALCULATE_FORGE_LUA_000296..ItemCount1..CALCULATE_FORGE_LUA_000295..yingbiNeed..CALCULATE_FORGE_LUA_000292)
end	

function can_TLWHY1_item ( role,ItemCount2 )
	local yingbiCount=0
	local yingbiNeed =0
	local yingbiNeed =ItemCount2 * 300
	local yingbiCount=CheckBagItem(role ,855)
	
	local item_elf = GetChaItem(role , 2, 1)			--��ȡ������2�����ָ��
	local item_elf_type = GetItemType ( item_elf )			--��ȡ������2���������
	if item_elf_type ~= 59 then
		CALCULATE_FORGE_LUA_000288 = GetResString("CALCULATE_FORGE_LUA_000288")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000288 ) 
		CALCULATE_FORGE_LUA_000289 = GetResString("CALCULATE_FORGE_LUA_000289")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000289)
		return 
	end	
--------���������ж�
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--��ȡ���鵱ǰhp
	local a=ItemCount2 * 50
	if	item_elf_hp < a then
		CALCULATE_FORGE_LUA_000290 = GetResString("CALCULATE_FORGE_LUA_000290")
		CALCULATE_FORGE_LUA_000291 = GetResString("CALCULATE_FORGE_LUA_000291")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000291..ItemCount2..CALCULATE_FORGE_LUA_000290)
		return 		
	end	
	local item_elf_hp=item_elf_hp - a
	
	if yingbiNeed > yingbiCount then
	CALCULATE_FORGE_LUA_000292 = GetResString("CALCULATE_FORGE_LUA_000292")
	CALCULATE_FORGE_LUA_000298 = GetResString("CALCULATE_FORGE_LUA_000298")
	CALCULATE_FORGE_LUA_000294 = GetResString("CALCULATE_FORGE_LUA_000294")
	HelpInfo(role,0,CALCULATE_FORGE_LUA_000294..ItemCount2..CALCULATE_FORGE_LUA_000298..yingbiNeed..CALCULATE_FORGE_LUA_000292)
	CALCULATE_FORGE_LUA_000292 = GetResString("CALCULATE_FORGE_LUA_000292")
	CALCULATE_FORGE_LUA_000298 = GetResString("CALCULATE_FORGE_LUA_000298")
	CALCULATE_FORGE_LUA_000294 = GetResString("CALCULATE_FORGE_LUA_000294")
	SystemNotice ( role ,CALCULATE_FORGE_LUA_000294..ItemCount2..CALCULATE_FORGE_LUA_000298..yingbiNeed..CALCULATE_FORGE_LUA_000292)
	return
	end
	TakeItem(  role, 0 , 855, yingbiNeed)
	SetItemAttr ( item_elf , ITEMATTR_URE , item_elf_hp ) 
	GiveItem(role,0,2589,ItemCount2,4)
	CALCULATE_FORGE_LUA_000292 = GetResString("CALCULATE_FORGE_LUA_000292")
	CALCULATE_FORGE_LUA_000295 = GetResString("CALCULATE_FORGE_LUA_000295")
	CALCULATE_FORGE_LUA_000299 = GetResString("CALCULATE_FORGE_LUA_000299")
	CALCULATE_FORGE_LUA_000297 = GetResString("CALCULATE_FORGE_LUA_000297")
	SystemNotice(role,CALCULATE_FORGE_LUA_000297..ItemCount2..CALCULATE_FORGE_LUA_000299..ItemCount2..CALCULATE_FORGE_LUA_000295..yingbiNeed..CALCULATE_FORGE_LUA_000292)
end	

function can_TLWHY2_item ( role,ItemCount3 )
	local huiyinCount=0
	local huiyinNeed=0
	local huiyinNeed =ItemCount3*15
	local huiyinCount=CheckBagItem(role ,2588)
	local item_elf = GetChaItem(role , 2, 1)			--��ȡ������2�����ָ��
	local item_elf_type = GetItemType ( item_elf )			--��ȡ������2���������
	if item_elf_type ~= 59 then
		CALCULATE_FORGE_LUA_000288 = GetResString("CALCULATE_FORGE_LUA_000288")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000288 ) 
		CALCULATE_FORGE_LUA_000289 = GetResString("CALCULATE_FORGE_LUA_000289")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000289)
		return 
	end	
--------���������ж�
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--��ȡ���鵱ǰhp
	local a=ItemCount3 * 50
	if	item_elf_hp < a then
		CALCULATE_FORGE_LUA_000290 = GetResString("CALCULATE_FORGE_LUA_000290")
		CALCULATE_FORGE_LUA_000291 = GetResString("CALCULATE_FORGE_LUA_000291")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000291..ItemCount3..CALCULATE_FORGE_LUA_000290)
		return 		
	end	
	local item_elf_hp=item_elf_hp - a
	
	if huiyinNeed > huiyinCount then
	CALCULATE_FORGE_LUA_000300 = GetResString("CALCULATE_FORGE_LUA_000300")
	CALCULATE_FORGE_LUA_000298 = GetResString("CALCULATE_FORGE_LUA_000298")
	CALCULATE_FORGE_LUA_000301 = GetResString("CALCULATE_FORGE_LUA_000301")
	HelpInfo(role,0,CALCULATE_FORGE_LUA_000301..ItemCount3..CALCULATE_FORGE_LUA_000298..huiyinNeed..CALCULATE_FORGE_LUA_000300)
	CALCULATE_FORGE_LUA_000300 = GetResString("CALCULATE_FORGE_LUA_000300")
	CALCULATE_FORGE_LUA_000298 = GetResString("CALCULATE_FORGE_LUA_000298")
	CALCULATE_FORGE_LUA_000301 = GetResString("CALCULATE_FORGE_LUA_000301")
	SystemNotice ( role ,CALCULATE_FORGE_LUA_000301..ItemCount3..CALCULATE_FORGE_LUA_000298..huiyinNeed..CALCULATE_FORGE_LUA_000300)
	return
	end
	TakeItem ( role , 0,2588 , huiyinNeed )
	SetItemAttr ( item_elf , ITEMATTR_URE , item_elf_hp ) 
	GiveItem(role,0,2589,ItemCount3,4)
	CALCULATE_FORGE_LUA_000300 = GetResString("CALCULATE_FORGE_LUA_000300")
	CALCULATE_FORGE_LUA_000295 = GetResString("CALCULATE_FORGE_LUA_000295")
	CALCULATE_FORGE_LUA_000299 = GetResString("CALCULATE_FORGE_LUA_000299")
	CALCULATE_FORGE_LUA_000297 = GetResString("CALCULATE_FORGE_LUA_000297")
	SystemNotice(role,CALCULATE_FORGE_LUA_000297..ItemCount3..CALCULATE_FORGE_LUA_000299..ItemCount3..CALCULATE_FORGE_LUA_000295..huiyinNeed..CALCULATE_FORGE_LUA_000300)
end	

-----------��������ת��--by L.li-20090324-------

---��������ת��

--�ж��Ƿ��ܹ���������ת�ƣ�ת�ƺ������

function can_jlzy_item(...)
	local arg = {...}
	if #arg ~= 12 and #arg ~= 10 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end
	local Check = 0
	Check = can_jlzy_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

--����Ƿ��������ת��������

function can_jlzy_item_main ( Table )
	
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
--------���������ж�
	if ItemBagCount[1] == 0 then	--------------�˴��ж�����Ϊ ����������Ϊ�յ�ʱ�򣬴������ĵ���ָ����λ������Ҫ��Դ������������
		ItemCount[2] = ItemCount[1]
		ItemCount[1] = 0
	end

	if ItemCount [0] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [2] ~= 1 then
		CALCULATE_FORGE_LUA_000302 = GetResString("CALCULATE_FORGE_LUA_000302")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000302)
		return 0
	end
	

--------ȡ������ָ��
	local Item_Shizhongyan = GetChaItem ( role , 2 , ItemBag [1] )	--��������ָ��
	local Item_JLSX = GetChaItem ( role , 2 , ItemBag [0] )	--�ṩ�������Ե���ָ��
	if ItemBagCount[1] == 0 then	--------------�˴��ж�����Ϊ ����������Ϊ�յ�ʱ�򣬴������ĵ���ָ����λ������Ҫ��Դ������������
		ItemBag[2] = ItemBag[1]
		ItemBag[1] = 0
	end
	local Item_Muban = GetChaItem ( role , 2 , ItemBag [2] )	--�ṩģ�����ָ��
	local ItemID_Muban = GetItemID ( Item_Muban )

	if ItemCount [0]==0	then 
		CALCULATE_FORGE_LUA_000303 = GetResString("CALCULATE_FORGE_LUA_000303")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000303)
		return 0
	end 
	
--------��0�е��������ж��Ƿ�ɾ���

	Check1 = CheckItem_CanJinglian ( Item_JLSX )
	if Check1 == 0 then
		CALCULATE_FORGE_LUA_000304 = GetResString("CALCULATE_FORGE_LUA_000304")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000304)
		CALCULATE_FORGE_LUA_000305 = GetResString("CALCULATE_FORGE_LUA_000305")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000305)
		return 0
	end
	
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Jinglianxinxi = GetItemForgeParam ( Item_JLSX , 1 )
	Jinglianxinxi = TansferNum ( Jinglianxinxi )
	Item_Stone[0] = GetNum_Part2 ( Jinglianxinxi )
	Item_Stone[1] = GetNum_Part4 ( Jinglianxinxi )
	Item_Stone[2] = GetNum_Part6 ( Jinglianxinxi )
	
	-- Item_StoneLv[0] = GetNum_Part3 ( Jinglianxinxi )
	-- Item_StoneLv[1] = GetNum_Part5 ( Jinglianxinxi )
	-- Item_StoneLv[2] = GetNum_Part7 ( Jinglianxinxi )
	
	if Item_Stone[0]==0 and Item_Stone[1]==0 and Item_Stone[2]==0 then
	CALCULATE_FORGE_LUA_000306 = GetResString("CALCULATE_FORGE_LUA_000306")
	SystemNotice( role ,CALCULATE_FORGE_LUA_000306)
	CALCULATE_FORGE_LUA_000307 = GetResString("CALCULATE_FORGE_LUA_000307")
	HelpInfo(role,0,CALCULATE_FORGE_LUA_000307)
	return 0		
	end
	
	
	if ItemCount [2]==0 then
		CALCULATE_FORGE_LUA_000308 = GetResString("CALCULATE_FORGE_LUA_000308")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000308)
		return 0
	end 
	
------��2�е��������ж��Ƿ�ɾ���	
	Check2 = CheckItem_CanJinglian ( Item_Muban )
	if Check2 == 0 then
		CALCULATE_FORGE_LUA_000304 = GetResString("CALCULATE_FORGE_LUA_000304")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000304)
		CALCULATE_FORGE_LUA_000309 = GetResString("CALCULATE_FORGE_LUA_000309")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000309)
		return 0
	end
	
	
			--------��ۺ����Ե����Ƿ�Ϊͬһ����
	local ItemType_JLSX = GetItemType ( Item_JLSX )
	local ItemType_Muban = GetItemType ( Item_Muban )
	local star=0
	
	if ItemType_JLSX ~= 22 and ItemType_JLSX ~=27 then ----�Ȳ�������Ҳ�����·�
	star = 1
	end
	
	if ItemType_Muban~=27  then
		if ItemType_JLSX ~= ItemType_Muban then
		CALCULATE_FORGE_LUA_000310 = GetResString("CALCULATE_FORGE_LUA_000310")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000310 )
		CALCULATE_FORGE_LUA_000311 = GetResString("CALCULATE_FORGE_LUA_000311")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000311)
		return 0
		end 
	elseif ItemType_Muban==27 and star == 1 then
		CALCULATE_FORGE_LUA_000310 = GetResString("CALCULATE_FORGE_LUA_000310")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000310 )
		CALCULATE_FORGE_LUA_000311 = GetResString("CALCULATE_FORGE_LUA_000311")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000311)
		return 0
	end
	
--------��ۺ����Ե����Ƿ�Ϊͬһ���ͺ�ְҵ����
	local Check_JLZY = 0
	Check_JLZY = CheckFusionItem( Item_Muban , Item_JLSX )
	if Check_JLZY == LUA_FALSE then
		CALCULATE_FORGE_LUA_000312 = GetResString("CALCULATE_FORGE_LUA_000312")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000312 )
		CALCULATE_FORGE_LUA_000313 = GetResString("CALCULATE_FORGE_LUA_000313")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000313)
		return 0
	end
	

	local Num1 = GetItemForgeParam (Item_JLSX,1)
	Num1 =TansferNum ( Num1 )
	local Hole1 = GetNum_Part1 ( Num1 )
	local Num2 = GetItemForgeParam (Item_Muban,1)
	Num2 =TansferNum ( Num2 )
	local Hole2 = GetNum_Part1 ( Num2 )
	if Hole1 >Hole2 then 
		CALCULATE_FORGE_LUA_000314 = GetResString("CALCULATE_FORGE_LUA_000314")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000314 )
		CALCULATE_FORGE_LUA_000314 = GetResString("CALCULATE_FORGE_LUA_000314")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000314)
		return 0
	end
	

-------�������������ж�
	local SZYNeedNum,JLHPNeedNum= zhuanyi_feiyong_main ( Table )
	local Shizhongyan_ItemCount=0	
	local Shizhongyan_ItemCount=SZYNeedNum
	if Shizhongyan_ItemCount>ItemCount [1]	then
		CALCULATE_FORGE_LUA_000315 = GetResString("CALCULATE_FORGE_LUA_000315")
		CALCULATE_FORGE_LUA_000316 = GetResString("CALCULATE_FORGE_LUA_000316")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000316..Shizhongyan_ItemCount..CALCULATE_FORGE_LUA_000315)
		CALCULATE_FORGE_LUA_000315 = GetResString("CALCULATE_FORGE_LUA_000315")
		CALCULATE_FORGE_LUA_000317 = GetResString("CALCULATE_FORGE_LUA_000317")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000317..Shizhongyan_ItemCount..CALCULATE_FORGE_LUA_000315)
		return 0
	end 
	
	if ItemCount [1]==0 then 
		CALCULATE_FORGE_LUA_000318 = GetResString("CALCULATE_FORGE_LUA_000318")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000318)
		return 0
	end
--------�������������ж�

	if Item_Shizhongyan == nil then 
		return 0
	end

	local Shizhongyan_ItemID = GetItemID (Item_Shizhongyan)
	if Shizhongyan_ItemID ~=6835 then
		CALCULATE_FORGE_LUA_000319 = GetResString("CALCULATE_FORGE_LUA_000319")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000319)
		CALCULATE_FORGE_LUA_000320 = GetResString("CALCULATE_FORGE_LUA_000320")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000320)
		return 0
	end
	
	local item_elf = GetChaItem(role , 2, 1)			--��ȡ������2�����ָ��
	local item_elf_type = GetItemType ( item_elf )			--��ȡ������2���������
	
	
	if item_elf_type ~= 59 then
		CALCULATE_FORGE_LUA_000288 = GetResString("CALCULATE_FORGE_LUA_000288")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000288 ) 
		CALCULATE_FORGE_LUA_000289 = GetResString("CALCULATE_FORGE_LUA_000289")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000289)
		return 0 
	end
	

--------���������ж�
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--��ȡ���鵱ǰhp
	local a=JLHPNeedNum/50
	
	if	item_elf_hp < JLHPNeedNum then
		CALCULATE_FORGE_LUA_000290 = GetResString("CALCULATE_FORGE_LUA_000290")
		CALCULATE_FORGE_LUA_000321 = GetResString("CALCULATE_FORGE_LUA_000321")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000321..a..CALCULATE_FORGE_LUA_000290)
		CALCULATE_FORGE_LUA_000290 = GetResString("CALCULATE_FORGE_LUA_000290")
		CALCULATE_FORGE_LUA_000321 = GetResString("CALCULATE_FORGE_LUA_000321")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000321..a..CALCULATE_FORGE_LUA_000290)
		return 0		
	end	
	
	return 1
end

--��ʼ��������ת��

function begin_jlzy_item(...)
	local arg = {...}
--	Notice("���뾫��Ч��ת��")
--------�Ƿ����ת�Ƽ��
	
	local Check_CanJLZY = 0
	Check_CanJLZY = can_jlzy_item_main ( arg )
	if Check_CanJLZY == 0 then
		return 0
	end
--------ȡ������

	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0


	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_Shizhongyan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_JLSX = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_Muban = GetChaItem ( role , 2 , ItemBag [2] )
	local ItemID_Muban = GetItemID ( Item_Muban )

	
--------����Ч��ת�ƹ���

	Check_JLZY_Item = zhuanyi_item ( arg )

	if Check_JLZY_Item == 0  then
		CALCULATE_FORGE_LUA_000322 = GetResString("CALCULATE_FORGE_LUA_000322")
		SystemNotice ( role ,CALCULATE_FORGE_LUA_000322)
	end
	
	ReSetForgeAttr(Item_Muban)
	

	local cha_name = GetChaDefaultName ( role )
	CALCULATE_FORGE_LUA_000323 = GetResString("CALCULATE_FORGE_LUA_000323")
	SystemNotice ( role ,CALCULATE_FORGE_LUA_000323)
	CALCULATE_FORGE_LUA_000324 = GetResString("CALCULATE_FORGE_LUA_000324")
	HelpInfo(role,0,CALCULATE_FORGE_LUA_000324)
	local Item_Muban_name = GetItemName ( ItemID_Muban )
	CALCULATE_FORGE_LUA_000325 = GetResString("CALCULATE_FORGE_LUA_000325")
	CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
	LG( "jinglianzhuanyi_chenggong" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000325..Item_Muban_name )
	return 1

end



--����۳�����ת�Ƹ�����������������������������

function zhuanyi_feiyong_main ( Table )
	
	local role = 0
	local ItemBag = {}										--���߱���λ������
	local ItemCount = {}										--������������
	local ItemBagCount = {}									--���߶�����������
	local ItemBag_Num = 0									--����λ�����鳤��
	local ItemCount_Num = 0									--�����������鳤��
	local ItemBagCount_Num = 0								--���߶����������鳤��

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	if ItemBagCount[1] == 0 then
		ItemBag[2] = ItemBag[1]
		ItemBag[1] = 0
	end
	
	local Item_JLSX = GetChaItem ( role , 2 , ItemBag [0] )	--�ṩ�������Ե���ָ��
	local Item_Muban = GetChaItem ( role , 2 , ItemBag [2] )	--�ṩģ�����ָ��
	

	local ItemLv_Muban = GetItemLv ( Item_Muban )

	local ItemLv_JLSX = GetItemLv ( Item_JLSX )
	
	local ItemURE_Muban = GetItemAttr ( Item_Muban , ITEMATTR_MAXURE )
		
	local ItemAttr_Val_Fusionid = GetItemAttr ( Item_Muban , ITEMATTR_VAL_FUSIONID ) 
	-- SystemNotice ( role ,"ItemAttr_Val_Fusionid="..ItemAttr_Val_Fusionid)
	local ItemID_Muban1 =0
	if  ItemAttr_Val_Fusionid == 0 then
		ItemID_Muban1 = GetItemID ( Item_Muban )	
	else 
		ItemID_Muban1 = GetItemAttr ( Item_Muban , ITEMATTR_VAL_FUSIONID )
		
	end

----------------------------------	
	local WrongItemID ={}
	WrongItemID [1] =825
	WrongItemID [2] =826
	WrongItemID [3] =827
	WrongItemID [4] =828
	WrongItemID [5] =831
	WrongItemID [6] =832
	WrongItemID [7] =833
	WrongItemID [8] =834
	WrongItemID [9] =835
	WrongItemID [10] =836
	WrongItemID [11] =837
	WrongItemID [12] =838
	WrongItemID [13] =839
	WrongItemID [14] =840
	WrongItemID [15] =841
	WrongItemID [16] =842
	WrongItemID [17] =843
	WrongItemID [18] =1115
	WrongItemID [19] =1116
	WrongItemID [20] =1117
	WrongItemID [21] =1118
	WrongItemID [22] =2549
	WrongItemID [23] =2550
	WrongItemID [24] =2551
	WrongItemID [25] =2552
	local checkMubanID=1
	for i = 1 , 25 , 1 do
		if ItemID_Muban1 == WrongItemID [i] then
		
			checkMubanID=0
			break
		end
	end
	
--------������������ʯ����������������

	local Item_Stone = {}
	local Item_StoneLv = {}
	local Jinglianxinxi = GetItemForgeParam ( Item_JLSX , 1 )
	Jinglianxinxi = TansferNum ( Jinglianxinxi )
	
	Item_StoneLv[0] = GetNum_Part3 ( Jinglianxinxi )
	Item_StoneLv[1] = GetNum_Part5 ( Jinglianxinxi )
	Item_StoneLv[2] = GetNum_Part7 ( Jinglianxinxi )
	
	local JLHPNeed1=0
	local JLHPNeed2=0
	local JLHPNeed3=0
	local SZYNeed1=0
	local SZYNeed2=0
	local SZYNeed3=0
	
	if ItemLv_Muban>=0 and ItemLv_Muban<=65 and checkMubanID ==1 then
	-- SystemNotice ( role ,"checkMubanID="..checkMubanID)
		if  Item_StoneLv[0]==0 then
		SZYNeed1 =0
		JLHPNeed1 =0
		elseif  Item_StoneLv[0]>=1 and Item_StoneLv[0]<=5 then 
		SZYNeed1 =1
		JLHPNeed1 =10
		elseif  Item_StoneLv[0]==6 then
		SZYNeed1 =2
		JLHPNeed1 =20
		
		elseif Item_StoneLv[0]==7 then
		SZYNeed1 =4
		JLHPNeed1 =40
		
		elseif Item_StoneLv[0]==8 then
		SZYNeed1 =6
		JLHPNeed1 =60
		
		elseif Item_StoneLv[0] ==9 then
		SZYNeed1 =8
		JLHPNeed1 =80
		end
		
		if  Item_StoneLv[1]==0 then
		SZYNeed2 =0
		JLHPNeed2 =0
		
		elseif  Item_StoneLv[1]>=1 and Item_StoneLv[1]<=5 then
		SZYNeed2 =1
		JLHPNeed2 =10
		
		elseif  Item_StoneLv[1]==6 then
		SZYNeed2 =2
		JLHPNeed2 =20
		
		elseif Item_StoneLv[1]==7 then
		SZYNeed2 =4
		JLHPNeed2 =40
		
		elseif Item_StoneLv[1]==8 then
		SZYNeed2 =6
		JLHPNeed2 =60
		
		elseif Item_StoneLv[1] ==9 then
		SZYNeed2 =8
		JLHPNeed2 =80
		end
		
		if  Item_StoneLv[2]==0 then
		SZYNeed3 =0
		JLHPNeed3 =0
		
		elseif  Item_StoneLv[2]>=1 and Item_StoneLv[2]<=5 then
		SZYNeed3 =1
		JLHPNeed3 =10
		
		elseif  Item_StoneLv[2]==6 then
		SZYNeed3 =2
		JLHPNeed3 =20
		
		elseif Item_StoneLv[2]==7 then
		SZYNeed3 =4
		JLHPNeed3 =40
		
		elseif Item_StoneLv[2]==8 then
		SZYNeed3 =6
		JLHPNeed3 =60
		
		elseif Item_StoneLv[2] ==9 then
		SZYNeed3 =8
		JLHPNeed3 =80
		end
	
	
	
	elseif  ItemLv_Muban<=75 and ItemLv_Muban>65 then
	
		if  Item_StoneLv[0]==0 then
		SZYNeed1 =0
		JLHPNeed1 =0
	
		elseif  Item_StoneLv[0]>=1 and Item_StoneLv[0]<=5 then
		SZYNeed1 =2
		JLHPNeed1 =20
		
		elseif  Item_StoneLv[0]==6 then
		SZYNeed1 =3
		JLHPNeed1 =30
		
		elseif Item_StoneLv[0]==7 then
		SZYNeed1 =6
		JLHPNeed1 =60
		
		elseif Item_StoneLv[0]==8 then
		SZYNeed1 =9
		JLHPNeed1 =90
		
		elseif Item_StoneLv[0] ==9 then
		SZYNeed1 =12
		JLHPNeed1 =120
		end
		
		if  Item_StoneLv[1]==0 then
		SZYNeed2 =0
		JLHPNeed2 =0
		
		elseif  Item_StoneLv[1]>=1 and Item_StoneLv[1]<=5 then
		SZYNeed2 =2
		JLHPNeed2 =20
		
		elseif  Item_StoneLv[1]==6 then
		SZYNeed2 =3
		JLHPNeed2 =30
		
		elseif Item_StoneLv[1]==7 then
		SZYNeed2 =6
		JLHPNeed2 =60
		
		elseif Item_StoneLv[1]==8 then
		SZYNeed2 =9
		JLHPNeed2 =90
		
		elseif Item_StoneLv[1] ==9 then
		SZYNeed2 =12
		JLHPNeed2 =120
		end
		
		if  Item_StoneLv[2]==0 then
		SZYNeed3 =0
		JLHPNeed3 =0
		
		elseif  Item_StoneLv[2]>=1 and Item_StoneLv[2]<=5 then
		SZYNeed3 =2
		JLHPNeed3 =20
		
		elseif  Item_StoneLv[2]==6 then
		SZYNeed3 =3
		JLHPNeed3 =30
		
		elseif Item_StoneLv[2]==7 then
		SZYNeed3 =6
		JLHPNeed3 =60
		
		elseif Item_StoneLv[2]==8 then
		SZYNeed3 =9
		JLHPNeed3 =90
		
		elseif Item_StoneLv[2] ==9 then
		SZYNeed3 =12
		JLHPNeed3 =120
		
		else 
		CALCULATE_FORGE_LUA_000326 = GetResString("CALCULATE_FORGE_LUA_000326")
		SystemNotice (CALCULATE_FORGE_LUA_000326)
		return
		end
	
	
	elseif  ItemLv_Muban<=95 and ItemLv_Muban>75 then
	
		if  Item_StoneLv[0]==0 then
		SZYNeed1 =0
		JLHPNeed1 =0
		
		elseif  Item_StoneLv[0]>=1 and Item_StoneLv[0]<=5 then
		SZYNeed1 =3
		JLHPNeed1 =30
		
		elseif  Item_StoneLv[0]==6 then
		SZYNeed1 =4
		JLHPNeed1 =40
		
		elseif Item_StoneLv[0]==7 then
		SZYNeed1 =8
		JLHPNeed1 =80
		
		elseif Item_StoneLv[0]==8 then
		SZYNeed1 =12
		JLHPNeed1 =120
		
		elseif Item_StoneLv[0] ==9 then
		SZYNeed1 =16
		JLHPNeed1 =160
		end
		
		if  Item_StoneLv[1]==0 then
		SZYNeed2 =0
		JLHPNeed2 =0
		
		elseif  Item_StoneLv[1]>=1 and Item_StoneLv[1]<=5 then
		SZYNeed2 =3
		JLHPNeed2 =30
		
		elseif  Item_StoneLv[1]==6 then
		SZYNeed2 =4
		JLHPNeed2 =40
		
		elseif Item_StoneLv[1]==7 then
		SZYNeed2 =8
		JLHPNeed2 =80
		
		elseif Item_StoneLv[1]==8 then
		SZYNeed2 =12
		JLHPNeed2 =120
		
		elseif Item_StoneLv[1] ==9 then
		SZYNeed2 =16
		JLHPNeed2 =160
		end
		
		if  Item_StoneLv[2]==0 then
		SZYNeed3 =0
		JLHPNeed3 =0
		
		elseif  Item_StoneLv[2]>=1 and Item_StoneLv[2]<=5 then
		SZYNeed3 =3
		JLHPNeed3 =30
		
		elseif  Item_StoneLv[2]==6 then
		SZYNeed3 =4
		JLHPNeed3 =40
		
		elseif Item_StoneLv[2]==7 then
		SZYNeed3 =8
		JLHPNeed3 =80
		
		elseif Item_StoneLv[2]==8 then
		SZYNeed3 =12
		JLHPNeed3 =120
		
		elseif Item_StoneLv[2] ==9 then
		SZYNeed3 =16
		JLHPNeed3 =160
	
		else 
		CALCULATE_FORGE_LUA_000326 = GetResString("CALCULATE_FORGE_LUA_000326")
		SystemNotice (CALCULATE_FORGE_LUA_000326)
		return
		end
		
	
	else
	
		if  Item_StoneLv[0]==0 then
		SZYNeed1 =0
		JLHPNeed1 =0
	
		elseif  Item_StoneLv[0]>=1 and Item_StoneLv[0]<=5 then
		SZYNeed1 =5
		JLHPNeed1 =50
		
		elseif  Item_StoneLv[0]==6 then
		SZYNeed1 =7
		JLHPNeed1 =70
		
		elseif Item_StoneLv[0]==7 then
		SZYNeed1 =14
		JLHPNeed1 =100
		
		elseif Item_StoneLv[0]==8 then
		SZYNeed1 =21
		JLHPNeed1 =150
		
		elseif Item_StoneLv[0] ==9 then
		SZYNeed1 =28
		JLHPNeed1 =180
		end
		
		if  Item_StoneLv[1]==0 then
		SZYNeed2 =0
		JLHPNeed2 =0
		
		elseif  Item_StoneLv[1]>=1 and Item_StoneLv[1]<=5 then
		SZYNeed2 =5
		JLHPNeed2 =50
		
		elseif Item_StoneLv[1]==6 then
		SZYNeed2 =7
		JLHPNeed2 =70
		
		elseif Item_StoneLv[1]==7 then
		SZYNeed2 =14
		JLHPNeed2 =100
		
		elseif Item_StoneLv[1]==8 then
		SZYNeed2 =21
		JLHPNeed2 =150
		
		elseif Item_StoneLv[1] ==9 then
		SZYNeed2 =28
		JLHPNeed2 =180
		end
		
		if  Item_StoneLv[2]==0 then
		SZYNeed3 =0
		JLHPNeed3 =0
		
		elseif  Item_StoneLv[2]>=1 and Item_StoneLv[2]<=5 then
		SZYNeed3 =5
		JLHPNeed3 =50
		
		elseif  Item_StoneLv[2]==6 then
		SZYNeed3 =7
		JLHPNeed3 =70
		
		elseif Item_StoneLv[2]==7 then
		SZYNeed3 =14
		JLHPNeed3 =100
		
		elseif Item_StoneLv[2]==8 then
		SZYNeed3 =21
		JLHPNeed3 =150
		
		elseif Item_StoneLv[2] ==9 then
		SZYNeed3 =28
		JLHPNeed3 =180
		
		else 
		CALCULATE_FORGE_LUA_000326 = GetResString("CALCULATE_FORGE_LUA_000326")
		SystemNotice (CALCULATE_FORGE_LUA_000326)
		return
		end
	end
	local SZYNeedNum=0
	local JLHPNeedNum=0
	SZYNeedNum=SZYNeed1+SZYNeed2+SZYNeed3
	JLHPNeedNum=(JLHPNeed1+JLHPNeed2+JLHPNeed3)*50
	-- local Item_beuplv_ID1 = GetItemID ( Item_Muban )
	-- local Item_beuplv_ID2 = GetItemID ( Item_JLSX )
	
	local ItemAttr_Val_Fusionid1 = GetItemAttr ( Item_Muban ,ITEMATTR_VAL_FUSIONID )
	local ItemAttr_Val_Fusionid2 = GetItemAttr ( Item_JLSX ,ITEMATTR_VAL_FUSIONID )
	-- SystemNotice( role ,"ItemAttr_Val_Fusionid1="..ItemAttr_Val_Fusionid1.."��")
	-- SystemNotice( role ,"ItemAttr_Val_Fusionid2="..ItemAttr_Val_Fusionid2.."��")
	if ItemAttr_Val_Fusionid1 ~= 0 and ItemAttr_Val_Fusionid2 ~= 0 then					--�ж��ںϵ����Ƿ�Ϊ�ں�����
	SZYNeedNum = SZYNeedNum +2
	-- SystemNotice( role ,"װ�����Ӷȱ�ת�ƣ����⻨��ʯ����2����")
	-- SystemNotice( role ,"SZYNeedNum="..SZYNeedNum.."��")
	-- SystemNotice( role ,"JLHPNeedNum="..JLHPNeedNum.."��")
	end
	return SZYNeedNum,JLHPNeedNum
end




----��غ���--------------------------------------------------------------------------------------------------------


---��ʼת��

function zhuanyi_item ( Table )
--	Notice("Ronghe_Item")
	

	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0


	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_Shizhongyan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Muban = GetChaItem ( role , 2 , ItemBag [2] )
	local Item_JLSX = GetChaItem ( role , 2 , ItemBag [0] )

	local ItemID_Shizhongyan = GetItemID ( Item_Shizhongyan )
	local ItemID_Muban = GetItemID ( Item_Muban )
	local ItemID_JLSX = GetItemID ( Item_JLSX )
----------------==============
	local Jinglianxinxi = GetItemForgeParam ( Item_JLSX , 1 )

		local R1 = 0
		local R2 = 0
		
		local Shizhongyan_ItemCount=0
		local SZYNeedNum,JLHPNeedNum = zhuanyi_feiyong_main ( Table )
		local Shizhongyan_ItemCount=SZYNeedNum
		-- local JLHPNeedNum_ItemCount=JLHPNeedNum
				--------�۳���������
		
		local item_elf = GetChaItem(role , 2, 1)			--��ȡ������2�����ָ��
		local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--��ȡ���鵱ǰhp
		local item_elf_hp=item_elf_hp - JLHPNeedNum
		a=JLHPNeedNum/50
		CALCULATE_FORGE_LUA_000290 = GetResString("CALCULATE_FORGE_LUA_000290")
		CALCULATE_FORGE_LUA_000327 = GetResString("CALCULATE_FORGE_LUA_000327")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000327..a..CALCULATE_FORGE_LUA_000290)
		CALCULATE_FORGE_LUA_000315 = GetResString("CALCULATE_FORGE_LUA_000315")
		CALCULATE_FORGE_LUA_000328 = GetResString("CALCULATE_FORGE_LUA_000328")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000328..Shizhongyan_ItemCount..CALCULATE_FORGE_LUA_000315)
		SetItemAttr ( item_elf , ITEMATTR_URE , item_elf_hp ) 
		
		local cha_name = GetChaDefaultName ( role )
		--LG("JLzhuanyi_xinxi",cha_name,ItemID_Shizhongyan,ItemID_Muban,ItemID_JLSX,item_elf_hp,Jinglianxinxi)

		R1 = RemoveChaItem ( role , ItemID_Shizhongyan , Shizhongyan_ItemCount , 2 , ItemBag [1] , 2 , 1 , 0 )		--�Ƴ���������
		R2 = RemoveChaItem ( role , ItemID_JLSX , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		--�Ƴ����Ե���

		if R1 == 0 or R2 == 0 then
			CALCULATE_FORGE_LUA_000105 = GetResString("CALCULATE_FORGE_LUA_000105")
			SystemNotice( role , CALCULATE_FORGE_LUA_000105)
			return 
		end

		local Check_SetItemForgeParam = SetItemForgeParam( Item_Muban , 1 , Jinglianxinxi )
		
		if Check_SetItemForgeParam == 0 then
			CALCULATE_FORGE_LUA_000106 = GetResString("CALCULATE_FORGE_LUA_000106")
			SystemNotice( role , CALCULATE_FORGE_LUA_000106)
			return 
		end
------------------------------------------δ�ں�װ����������--------	
		local Item_beuplv_ID1 = GetItemID ( Item_Muban )
		local Item_beuplv_ID2 = GetItemID ( Item_JLSX )
		local ItemAttr_Val_Fusionid1 = GetItemAttr ( Item_Muban ,ITEMATTR_VAL_FUSIONID )
		local ItemAttr_Val_Fusionid2 = GetItemAttr ( Item_JLSX ,ITEMATTR_VAL_FUSIONID )
		if  ItemAttr_Val_Fusionid1 ~= 0 and ItemAttr_Val_Fusionid2 ~= 0 then					--�ж��ںϵ����Ƿ�Ϊ�ں�����
		SetChaKitbagChange ( role , 1 )
		SetItemAttr ( Item_Muban , ITEMATTR_VAL_LEVEL , 15 )
		CALCULATE_FORGE_LUA_000329 = GetResString("CALCULATE_FORGE_LUA_000329")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000329)
		CALCULATE_FORGE_LUA_000329 = GetResString("CALCULATE_FORGE_LUA_000329")
		HelpInfo(role,0,CALCULATE_FORGE_LUA_000329)
		SynChaKitbag ( role , 4 )
		SynChaKitbag ( role , 13 )
		return 
		end	
end

--���߾�����������
function ReSetForgeAttr(Item)
		local Item_TypeCheck = GetItemType ( Item )

	if Item_TypeCheck == 59 then
		return
	end
	ResetItemFinalAttr( Item )
--	Notice ("check_item_final_data")
	local Num = GetItemForgeParam ( Item , 1 )
	if Num== 0 then 
		return 
	end
	Num = TansferNum ( Num )

--	Notice(Num)
	local StoneInfo = {}
	local StoneLv = {}
	--local ResetCheck = 0
	--ResetCheck = ResetItemFinalAttr( Item )
	
	--if ResetCheck == 0 then
		---Notice("ResetCheckʧ��")
		--LG("check_item_final","ResetCheckʧ��")
		--return
	--end 
	StoneInfo[0]=0
	StoneInfo[1]=0
	StoneInfo[2]=0
	StoneLv[0]=0
	StoneLv[1]=0
	StoneLv[2]=0
	StoneInfo[0],StoneInfo[1],StoneInfo[2],StoneLv[0],StoneLv[1],StoneLv[2] = CheckStoneInfo ( Num )

	local AddCheck = 0

	local i = 0
	local j = 0
	for i = 0 , 2 , 1 do
		if StoneInfo [i] ~= nil and StoneInfo [i] ~=0  then
--			Notice("StoneInfo"..i.."= "..StoneInfo [i])
			if StoneAttrType[StoneInfo [i]] == ITEMATTR_VAL_MNATK then
--				Notice("�ӹ�����")
				local Itemattr_Type1 = StoneAttrType[StoneInfo [i]]
				local Itemattr_Type2 = Itemattr_Type1 + 1
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
--				local Item_attr1 = GetItemAttr ( Item , Itemattr_Type1 )
--				local Item_attr2 = GetItemAttr ( Item , Itemattr_Type2 )

--				local Item_Newattr1 = Item_attr1 + ItemAttrEff
--				local Item_Newattr2 = Item_attr2 + ItemAttrEff
				
--				Notice ( "Itemattr_Type1= "..Itemattr_Type1.." Itemattr_Type2= "..Itemattr_Type2)
--				Notice ( "ItemAttrEff= "..ItemAttrEff)
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type1 , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type2 , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end
			else
				local Itemattr_Type = StoneAttrType[StoneInfo [i]]
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
				--local ItemAttrEff = StoneEff[StoneInfo [i]] * StoneLv[i]

--				local Item_attr = GetItemAttr ( Item , Itemattr_Type )
--				local Item_Newattr = Item_attr + ItemAttrEff

				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type , ItemAttrEff )
				if AddCheck == 0 then
					CALCULATE_FORGE_LUA_000035 = GetResString("CALCULATE_FORGE_LUA_000035")
					LG("check_item_final",CALCULATE_FORGE_LUA_000035)
				end

			end
		end
	end
end
-----������
function can_hatch_item (...)
	local arg = {...}
--	Notice("��ʼ�ж�")
	if #arg ~= 10 then
		return 0
	end	
	local kkk = 0
	local Check = 0
	Check = check_hatch_item ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end


function check_hatch_item ( Table )
--	SystemNotice ( Table[1] , "���뱳�������������")
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

--	SystemNotice( arg[1] , "��ʼ���ò�������")

	
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	local i = 0
	for i = 0 , 1 , 1 do							--�жϵ��߶�������͵��߸����Ƿ�ͷ�
		if ItemBagCount[i] ~= 1 or ItemCount[i] ~= 1 then
--			SystemNotice( role , "ItemBagCount[i] = "..ItemBagCount[i])
--			SystemNotice( role , "ItemCount[i] = "..ItemCount[i])
			CALCULATE_FORGE_LUA_000001 = GetResString("CALCULATE_FORGE_LUA_000001")
			SystemNotice( role , CALCULATE_FORGE_LUA_000001)
			return 0
		end
	end

	
	
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]


	local Item1 = GetChaItem ( role , 2 , BagItem1 )			--ȡ����ָ��
	local Item2 = GetChaItem ( role , 2 , BagItem2 )

	
	local ItemID1 = GetItemID ( Item1 )					--ȡ���߱��
	local ItemID2 = GetItemID ( Item2 )


	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )

	if ItemType1 ~= 59 then					--�жϾ����Ƿ���ȷ
		
		CALCULATE_FORGE_LUA_000330 = GetResString("CALCULATE_FORGE_LUA_000330")
		SystemNotice( role ,CALCULATE_FORGE_LUA_000330)
		return 0
	end

	if ItemType2 ~= 78 then			--�ж��Ƿ��Ǳ�ʯ
		CALCULATE_FORGE_LUA_000331 = GetResString("CALCULATE_FORGE_LUA_000331")
		SystemNotice( role , CALCULATE_FORGE_LUA_000331)
		return 0
	end
	local Elf_URE = GetItemAttr( Item1 ,ITEMATTR_URE )       --����
	if Elf_URE < 5000 then
		CALCULATE_FORGE_LUA_000332 = GetResString("CALCULATE_FORGE_LUA_000332")
		SystemNotice ( role , CALCULATE_FORGE_LUA_000332)
		return 0
	end
	return 1
end

function begin_hatch_item(...)
	local arg = {...}
--	Notice("��ʼ�ϳ�")
	
	local Check_CanUnite = 0

	Check_CanUnite = check_hatch_item ( arg )
	if Check_CanUnite == 0 then
		return 0
	end
	
	local role = 0
	local ItemBag = {}										--���߱���λ��
	local ItemCount = {}										--��������
	local ItemBagCount = {}										--���߶�������
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( arg )

	
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]
	
	local BagItem1 = arg [3]						--ȡ���߱���λ��
	local BagItem2 = arg [6]
	local BagItem3 = arg [9]

	local Item1 = GetChaItem ( role , 2 , BagItem1 )			--ȡ����ָ��
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	
	local ItemID1 = GetItemID ( Item1 )					--ȡ���߱��
	local ItemID2 = GetItemID ( Item2 )


	local ItemType2 = GetItemType ( Item2 )

	local j = 0

	j = RemoveChaItem ( role , ItemID2 , 1 , 2 , BagItem2 , 2 , 1 , 0)		--�Ƴ�һ��������

	if j == 0 then
		CALCULATE_FORGE_LUA_000333 = GetResString("CALCULATE_FORGE_LUA_000333")
		LG( "FuHua_SB" , CALCULATE_FORGE_LUA_000333 )
	end
	SynChaKitbag(role,13)
	i = 0
	local Pet={}	local PetID = {}
	Pet[1]=	6856	PetID[1]=	6847
	Pet[2]=	6857	PetID[2]=	6848
	Pet[3]=	6858	PetID[3]=	6849
	Pet[4]=	6859	PetID[4]=	6850
	Pet[5]=	6860	PetID[5]=	6851
	Pet[6]=	6861	PetID[6]=	6852
	Pet[7]=	6862	PetID[7]=	6853
	Pet[8]=	6863	PetID[8]=	6854
	Pet[9]=	6864	PetID[9]=	6855


	
	for i = 1,9,1 do 
		if ItemID2 == Pet[i] then
		local cha_name = GetChaDefaultName ( role )
		local PetName = GetItemName(PetID[i])
			GiveItem ( role , 0 , PetID[i] , 1 , 4 )
			CALCULATE_FORGE_LUA_000334 = GetResString("CALCULATE_FORGE_LUA_000334")
			CALCULATE_FORGE_LUA_000335 = GetResString("CALCULATE_FORGE_LUA_000335")
			CALCULATE_EXP_AND_LEVEL_LUA_000040 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000040")
			LG( "FuHua_CG" , CALCULATE_EXP_AND_LEVEL_LUA_000040..cha_name..CALCULATE_FORGE_LUA_000335..PetName..CALCULATE_FORGE_LUA_000334 )
		else
		end
	end
	local Elf_URE = GetItemAttr( Item1 ,ITEMATTR_URE )       --����
	Elf_URE	= Elf_URE - 5000
	SetItemAttr ( Item1 , ITEMATTR_URE , Elf_URE )
	return 1
end 
 
 ------һ����ʯ�һ�ȯ---------
function TransferDiamondScript_Lv1 ( role )
	local cha = TurnToCha ( role ) 
	local x_give = 0 
	local y_give = 0 
	local script_count = CheckBagItem ( cha , 888 )					--��鱳���жһ�ȯ����
	local DiamondId = Roll_DiamondId ( cha )						--����һ���ʯ������
	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 888 , 1 ) 
		if x_del == 1 then 
			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 101 )				--�һ���ʯ
            y_give = GiveItem ( cha , 0 , 885 , 1 , 101 )                   ---�һ�����ʯ

		else 
			SystemNotice ( cha , "Unable to deduct Gem Voucher" ) 
		end 
	else 
		SystemNotice ( cha , "You need to have a Gem Voucher in order to redeem"  ) 
	end 
	if x_give == 1 then 
		return 1 
	else 
		return 0 
	end 
end
