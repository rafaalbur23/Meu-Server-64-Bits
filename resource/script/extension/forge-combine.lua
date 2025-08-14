-- variable.lua
-- Capping max gem level (forge/combine)
MAX_STONELV					= {}
-- Refining Gem
MAX_STONELV[0885]			= 4
-- Normal Gems
MAX_STONELV[0878]			= 4
MAX_STONELV[0879]			= 4
MAX_STONELV[0880]			= 4
MAX_STONELV[0881]			= 4
MAX_STONELV[0882]			= 4
MAX_STONELV[0883]			= 4
MAX_STONELV[0884]			= 4
MAX_STONELV[0887]			= 4
-- Unique Gems
MAX_STONELV[0860] 			= 3		-- Unique Gems
MAX_STONELV[0861] 			= 3
MAX_STONELV[0862] 			= 3
MAX_STONELV[0863] 			= 3
MAX_STONELV[1012] 			= 3
-- Azrael Gems
MAX_STONELV[5845] 			= 1
MAX_STONELV[5846] 			= 1
MAX_STONELV[5847] 			= 1
MAX_STONELV[5848] 			= 1
MAX_STONELV[5849] 			= 1
-- Black Dragon Gems
MAX_STONELV[0864] 			= 4	
MAX_STONELV[0865] 			= 4
MAX_STONELV[0866] 			= 4
MAX_STONELV[9720] 			= 4
-- Hat Gems
MAX_STONELV[5750] 			= 3	
MAX_STONELV[5751] 			= 3
MAX_STONELV[5752] 			= 3
MAX_STONELV[6971]			= 3
-- Advanced Gems
MAX_STONELV[5771] 			= 3	
MAX_STONELV[5772] 			= 3
MAX_STONELV[5773] 			= 3
MAX_STONELV[5774] 			= 3
MAX_STONELV[5775] 			= 3
-- Gem of Trial
MAX_STONELV[6717] 			= 2	
MAX_STONELV[6718] 			= 2
-- Broken Gems
MAX_STONELV[6817] 			= 3
MAX_STONELV[6820] 			= 3
MAX_STONELV[6823] 			= 3
MAX_STONELV[6826] 			= 3
MAX_STONELV[6829] 			= 3
-- Cracked Gems
MAX_STONELV[6818] 			= 3
MAX_STONELV[6821] 			= 3
MAX_STONELV[6824] 			= 3
MAX_STONELV[6827] 			= 3
MAX_STONELV[6830] 			= 3
-- Chipped Gems
MAX_STONELV[6819] 			= 3
MAX_STONELV[6822] 			= 3
MAX_STONELV[6825] 			= 3
MAX_STONELV[6828] 			= 3
MAX_STONELV[6831] 			= 3
-- Great Gems
MAX_STONELV[7108]			= 2
MAX_STONELV[7109]			= 2
MAX_STONELV[7110]			= 2
MAX_STONELV[7111]			= 2
MAX_STONELV[7112]			= 2
-- Rock Gems
MAX_STONELV[7288]			= 3
MAX_STONELV[7289]			= 3
MAX_STONELV[7290]			= 3
MAX_STONELV[7291]			= 3
MAX_STONELV[7292]			= 3
-- Ring Gems
MAX_STONELV[7621]			= 4
MAX_STONELV[7622]			= 4
MAX_STONELV[7623]			= 4
MAX_STONELV[7624]			= 4
MAX_STONELV[7625]			= 4
MAX_STONELV[7626]			= 4
MAX_STONELV[7627]			= 4
MAX_STONELV[6965]			= 4
MAX_STONELV[6966]			= 4
MAX_STONELV[6967]			= 4
MAX_STONELV[6968]			= 4
MAX_STONELV[6969]			= 4
MAX_STONELV[6970]			= 4
-- Cloak Gems
MAX_STONELV[9208]			= 3
MAX_STONELV[9209]			= 3
MAX_STONELV[9210]			= 3
MAX_STONELV[9206]			= 3
MAX_STONELV[9207]			= 3
MAX_STONELV[9211]			= 3
-- forge.lua
---------------
--Gem Combine--
---------------
function can_unite_item (...)
	local arg = {...}
--	Notice("开始判断")
	if #arg ~= 12 then
--		Notice("参数个数非法"..#arg)
		return 0
	end
	local Check = 0
	Check = can_unite_item_main(arg)
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_unite_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	local i = 0
	for i = 0 , 2 , 1 do
		if ItemBagCount[i] ~= 1 or ItemCount[i] ~= 1 then
			SystemNotice( role , "Item target unit and item unit illegal")
			return 0
		end
	end
	
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]

	local Item1 = GetChaItem ( role , 2 , BagItem1 )
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	
	local ItemID1 = GetItemID ( Item1 )
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )

	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )
	local ItemType3 = GetItemType ( Item3 )

	if ItemType1 ~= 47 then
		SystemNotice( role ,"This is not a combining scroll")
		return 0
	end

	if ItemType2 ~= 49 or ItemType3 ~= 49 then
		if ItemType2 ~= 50 or ItemType3 ~= 50 then
			SystemNotice( role , "This is not a Gem")
			return 0
		end
	end

	if ItemID2 ~= ItemID3 then
		SystemNotice(role ,"Gem type mismatch")
		return 0
	end

	local Item2_Lv = Get_StoneLv ( Item2 )
	local Item3_Lv = Get_StoneLv ( Item3 )
	if Item2_Lv ~= Item3_Lv then
		SystemNotice(role ,"Level of both gems does not match")
		return 0
	end

	if MAX_STONELV[ItemID2] ~= nil then
		if Item2_Lv >= MAX_STONELV[ItemID2] then
			BickerNotice(role, GetItemName(ItemID2).." can improved to level "..MAX_STONELV[ItemID2].." at most.")
			return 0
		end
	else
		SystemNotice(role, "What is this? This is not a gem!")
		return 0
	end

	local Money_Need = getunite_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice(role ,"Insufficient gold. Unable to combine")
		return 0
	end

	return 1
end

function begin_unite_item (...)
	local Check_CanUnite = 0
	Check_CanUnite = can_unite_item_main ( arg )
	if Check_CanUnite == 0 then
		return 0
	end
	
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( arg )

	
	local BagItem1 = ItemBag[0]
	local BagItem2 = ItemBag[1]
	local BagItem3 = ItemBag[2]
	
	local BagItem1 = arg[3]
	local BagItem2 = arg[6]
	local BagItem3 = arg[9]

	local Item1 = GetChaItem(role, 2, BagItem1)
	local Item2 = GetChaItem(role, 2, BagItem2)
	local Item3 = GetChaItem(role, 2, BagItem3)
	
	local ItemID1 = GetItemID(Item1)
	local ItemID2 = GetItemID(Item2)
	local ItemID3 = GetItemID(Item3)

	local ItemType2 = GetItemType ( Item2 )

	local Item2_Lv = Get_StoneLv ( Item2 )
	local Item3_Lv = Get_StoneLv ( Item3 )

	local i = 0
	local j = 0

	i = RemoveChaItem ( role , ItemID1 , 1 , 2 , BagItem1 , 2 , 1 , 0)
	j = RemoveChaItem ( role , ItemID3 , 1 , 2 , BagItem3 , 2 , 1 , 0)

	if i == 0 or j == 0 then
		LG( "Gems_Combining" , "Delete item failed" )
	end
	
	Item2_Lv = Item2_Lv + 1
	Set_StoneLv(Item2, Item2_Lv)
	
	local Money_Need = getunite_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	local cha_name	= GetChaDefaultName(role)
	local Csr 		= 0
	local Sklv		= 0
	local StateLv	= GetChaStateLv(role, STATE_HCGLJB)
	Sklv = Sklv + StateLv

	local b = Combine_Success_Rate(Item2_Lv, ItemType2, Sklv, Csr)
	if b == 0 then
		i = RemoveChaItem ( role , ItemID2 , 1 , 2 , BagItem2 , 2 , 1 , 0)	
		if i == 0 then
			LG( "Gems_Combining" , "Player "..cha_name.." Delete item failed" )
		end
		LG( "Gems_Combining" , "Player "..cha_name.." Gem combining failed" )
		SystemNotice( role , "Very sorry, combining has failed. Gem has vanished!")
		return 2
	end

	local cha_name = GetChaDefaultName ( role )
	LG( "Gems_Combining" , "Player "..cha_name.." Gem combining successful")
	return 1
end

function Combine_Success_Rate(Item_Lv, Item_Type, Sklv, Csr)
	local GemLv		= Item_Lv - 1
	local StateLv	= Sklv * 0.1
	local CSR		= Csr
	local a 		= 0
	local b 		= 0
	--Gems Rate
	if Item_Type == 49 then
		local Rate = {}
		Rate[0]	= 1
		Rate[1]	= 1
		Rate[2]	= 1
		Rate[3]	= 1
		Rate[4]	= 0.7
		Rate[5]	= 0.5
		Rate[6]	= 0.4
		Rate[7]	= 0.3
		Rate[8]	= 0.2
		if Rate[GemLv] ~= nil then
			a = Rate[GemLv] + StateLv + CSR
			b = Percentage_Random(a)
		else
			b = 0
		end
		return b

	--Refining Rate
	elseif Item_Type == 50 then
		local Rate = {}
		Rate[0]	= 1
		Rate[1]	= 1
		Rate[2]	= 1
		Rate[3]	= 1
		Rate[4]	= 0.7
		Rate[5]	= 0.6
		Rate[6]	= 0.5
		Rate[7]	= 0.4
		Rate[8]	= 0.3
		if Rate[GemLv] ~= nil then
			a = Rate[GemLv] + StateLv + CSR
			b = Percentage_Random(a)
		else
			b = 0
		end
		return b

    else
		--Not a Gem or Refining
        return 0
	end
end

function get_item_unite_money (...)
	local Money = getunite_money_main ( arg )
	return Money
end

function getunite_money_main ( Table )
	return 50000
end

---------------
--Gem Forging--
---------------
function can_forge_item(...)
	local arg = {...}
--	Notice ( "判断是否可以精炼")
	if #arg ~= 12 then
		CALCULATE_FORGE_LUA_000014 = GetResString("CALCULATE_FORGE_LUA_000014")
		SystemNotice ( arg[1] , CALCULATE_FORGE_LUA_000014..#arg )
		return 0
	end
	local Check = 0
	Check = can_forge_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_forge_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
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
		SystemNotice( role , "Forging item related slot illegal")
		return 0
	end
	
	if ItemNum_Jinglian ~= 1 then
		SystemNotice( role , "Forging item quantity illegal")
		return 0
	end

	Check = CheckItem_CanJinglian ( Item_Jinglian )
	if Check == 0 then
		SystemNotice( role ,"Item cannot be forged")
		return 0
	end

	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice ( role ,"Illegal Gem quantity")
		return 0
	end

	local Item_Stone1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Stone2 = GetChaItem ( role , 2 , ItemBag [2] )
	local Check_Hole = 0
	Check_Hole = CheckItem_HaveHole ( Item_Jinglian , Item_Stone1 , Item_Stone2)
	if Check_Hole == 0 then
		SystemNotice( role ,"Does not have enough socket to forge" )
		return 0
	end

	local Check_Stone = 0
	Check_Stone = Check_StoneLv ( Item_Jinglian , Item_Stone1 , Item_Stone2 )
	if Check_Stone == 0 then
		SystemNotice ( role , "Gem or Refining Gem level does not match" )
		return 0
	end

	local Check_StoneItem = 0
	Check_StoneItem = Check_StoneItemType ( Item_Jinglian , Item_Stone1 , Item_Stone2 )
	if Check_StoneItem == 0 then
		SystemNotice ( role , "Gem and forging item does not match" )
		return 0
	end

	if MAX_STONELV[GetItemID(Item_Stone1)] ~= nil then
		if Get_StoneLv(Item_Stone1) > MAX_STONELV[GetItemID(Item_Stone1)] then
			BickerNotice(role, GetItemName(GetItemID(Item_Stone1)).." is capped at Lv"..MAX_STONELV[GetItemID(Item_Stone1)].."!")
			return 0
		end
	else
		SystemNotice(role, "What is this? this is not a Gem!")
		return 0
	end

	local Money_Need = getforge_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Insufficient Gold. Unable to forge.")
		return 0
	end
	return 1
end

function begin_forge_item(...)
local arg = {...}
	local Check_CanForge = 0
	Check_CanForge = can_forge_item_main ( arg )
	if Check_CanForge == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local ItemBag_Jinglian		= ItemBag [0]
	local Item_Jinglian			= GetChaItem(role, 2, ItemBag_Jinglian)
	local Item_Stone1			= GetChaItem(role, 2, ItemBag[1])
	local Item_Stone2			= GetChaItem(role, 2, ItemBag[2])

	local Money_Need = getforge_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	local ItemID_Jinglian = GetItemID ( Item_Jinglian )
	local Jinglian_Lv_Now = GetItem_JinglianLv ( Item_Jinglian )
	local Num = GetItemForgeParam ( Item_Jinglian , 1 )
	Num = TansferNum ( Num )

	local Stone1Type = GetItemType(Item_Stone1)
	local Stone2Type = GetItemType(Item_Stone2)
	local Baoshi = 0

	if Stone1Type == 49 then
		Baoshi = Item_Stone1
	elseif Stone2Type == 49 then
		Baoshi = Item_Stone2
	end
	
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Baoshi_NeedLv = 1
	Item_Stone[0] = GetNum_Part2(Num)
	Item_Stone[1] = GetNum_Part4(Num)
	Item_Stone[2] = GetNum_Part6(Num)
	Item_StoneLv[0] = GetNum_Part3(Num)
	Item_StoneLv[1] = GetNum_Part5(Num)
	Item_StoneLv[2] = GetNum_Part7(Num)

	BaoshiType = GetStone_TypeID(Baoshi)
	for i = 0 , 2 ,1 do
		if BaoshiType == Item_Stone[i] then
			Baoshi_NeedLv = Item_StoneLv[i] + 1
		end
	end

	local Check_Jinglian_Item	= 0
	local Sklv					= 0
	local StateLv				= GetChaStateLv(role, STATE_JLGLJB)
	Sklv = Sklv + StateLv

	local Success = Forging_Success_Rate(Baoshi_NeedLv, Sklv)
	if Success == 1 then
		Check_Jinglian_Item = Jinglian_Item(Item_Jinglian, Item_Stone1, Item_Stone2)
	else
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName(ItemID_Jinglian)
		LG("Gems_Forging", "Player ["..cha_name.."] possesed with booster Lv"..Sklv.." Forging GemID "..BaoshiType.." Lv"..Baoshi_NeedLv.." of equipment failed. Equipment is not damaged - "..Item_Jinglian_name)
		SystemNotice(role, "Sorry, forging has failed! Luckily equipment is not damaged.")
	end

	local ItemID_Stone1 = GetItemID ( Item_Stone1 )
	local ItemID_Stone2 = GetItemID ( Item_Stone2 )
	local Stone1_Lv = Get_StoneLv ( Item_Stone1 )
	local Stone2_Lv = Get_StoneLv ( Item_Stone2 )
	local Jinglianshi_Lv = 0
	if Stone1_Lv > Stone2_Lv then
		Jinglianshi_Lv = Stone1_Lv
	else
		Jinglianshi_Lv = Stone2_Lv
	end

	local Jinglian_Lv = GetItem_JinglianLv(Item_Jinglian)
	local R1 = 0
	local R2 = 0
	R1 = RemoveChaItem ( role , ItemID_Stone1 , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )
	R2 = RemoveChaItem ( role , ItemID_Stone2 , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )
	if R1 == 0 or R2 == 0 then
		LG( "Gems_Forging" , "Gem deletion failed" )
	end

	if Success == 0 then
		return 2
	end
	check_item_final_data(Item_Jinglian)
	local cha_name = GetChaDefaultName ( role )
	local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
	LG( "Gems_Forging" , "Player ["..cha_name.."] Forging successful - "..Item_Jinglian_name )
	return 1
end

function Forging_Success_Rate(Baoshi_NeedLv, Sklv)
	local GemLv		= Baoshi_NeedLv
	local StateLv	= Sklv * 0.1
	local a = 0
	local b = 0

	local Rate = {}
	Rate[1]	= 1
	Rate[2]	= 1
	Rate[3]	= 1
	Rate[4]	= 0.6
	Rate[5]	= 0.5
	Rate[6]	= 0.4
	Rate[7]	= 0.3
	Rate[8]	= 0.2
	Rate[9]	= 0.1
	if Rate[GemLv] ~= nil then
		a = Rate[GemLv] + StateLv
		b = Percentage_Random(a)
	else
		b = 0
	end
	return b
end

function get_item_forge_money(...)
	local arg = {...}
--	Notice("计算费用")
	local Money = getforge_money_main ( arg )
	return Money
end

function getforge_money_main ( Table )
	local role = 0
	local ItemBag = {}										--道具背包位置
	local ItemCount = {}										--道具数量
	local ItemBagCount = {}										--道具对象数量
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
--	Notice("计算结束")
	return Money_Need
end