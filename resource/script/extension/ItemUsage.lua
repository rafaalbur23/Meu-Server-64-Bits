print( "Loading ItemUsage.lua" )
-- custom items / top2 items by Xtacy
-- Ticket System by Angelix, reworked by Xtacy 2016.05.21.
-- top2 items scripted according to item details and public information
-- itemid nil [TODOs]
-- TODO: rework AMP system

ticketTab = {}	-- for tickets
ticketTab.Prohibit = {'prisonisland', 'lonetower'};

function UseTicketDefault(role, Item)
	local itemId = GetItemID(Item)
	if (Hp(role) < Mxhp(role) * 0.5) or (Sp(role) < Mxsp(role) * 0.5) then 
		SystemNotice(role, "You need to have at least half of your max HP and SP to teleport.")
		UseItemFailed(role)
		return
	end
	if ChaIsBoat(role) == 1 then
		SystemNotice(role, "Cannot use while sailing!")
		UseItemFailed(role)
		return
	end
	for j = 1, table.getn(ticketTab.Prohibit) do
		if GetChaMapName(role) == ticketTab.Prohibit[j] then
			BickerNotice(role, "Cannot use a ticket inside this map.")
			UseItemFailed(role)
			return
		end
	end
	if GetItemType(Item) == 44 or GetItemType(Item) == 36 then
		local j = DelBagItem(role, itemId, 1)
		if j ~= 1 then
			SystemNotice(role, 'Error in item function. Please report!');
			UseItemFailed(role)
			return
		end
	end
	MoveCity(role, ticketTab[itemId])
end

ticketTab[3141] = ""						Jz_Script_hc = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[0332] = "Spring Town"				Jz_Script_cfzs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[0563] = "Summer Island"			Jz_Script_xdfjp = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[0583] = "Autumn Island"			Jz_Script_qdfjp = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[2445] = "Caribbean"				Jz_Script_jialebi = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[2447] = "Skeletar IsleI"			TW_Ticket_Script2 = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[2491] = "Naval Base"				TW_Ticket_Script3 = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[2844] = "Abaddon 4"				Jz_Script_4thDy = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3048] = "Thundoria Castle"		Jz_Script_ltcsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3049] = "Thundoria Harbor"		Jz_Script_ltjgcsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3050] = "Sacred Snow Mountain"	Jz_Script_sxscsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3051] = "Andes Forest Haven"		Jz_Script_laslcsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3052] = "Oasis Haven"				Jz_Script_sqcsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3053] = "Icespire Haven"			Jz_Script_bjcsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3054] = "Lone Tower Entrace"		Jz_Script_jmztcsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3055] = "Barren Cavern Entrance"	Jz_Script_scrkcsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3056] = "Abandon Mine 2"			Jz_Script_fk2csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3057] = "Silver Mine 2"			Jz_Script_yk2csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3058] = "Silver Mine 3"			Jz_Script_yk3csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3059] = "Lone Tower 2"			Jz_Script_jmzt2csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3060] = "Lone Tower 3"			Jz_Script_jmzt3csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3070] = "Lone Tower 4"			Jz_Script_jmzt4csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3071] = "Lone Tower 5"			Jz_Script_jmzt5csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3072] = "Lone Tower 6"			Jz_Script_jmzt6csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3073] = "Abandon Mine 1"			Jz_Script_fk1csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3076] = "Spring Town"				Jz_Script_cfzsA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3828] = "Thundoria Castle"		Jz_Script_ltcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3829] = "Thundoria Harbor"		Jz_Script_ltjgcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3830] = "Sacred Snow Mountain"	Jz_Script_sxscs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3831] = "Andes Forest Haven"		Jz_Script_laslcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3832] = "Oasis Haven"				Jz_Script_sqcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3833] = "Icespire Haven"			Jz_Script_bjcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3834] = "Lone Tower Entrace"		Jz_Script_jmztcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3835] = "Barren Cavern Entrance"	Jz_Script_scrkcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3836] = "Abandon Mine 2"			Jz_Script_fk2cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3837] = "Silver Mine 2"			Jz_Script_yk2cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3838] = "Silver Mine 3"			Jz_Script_yk3cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3839] = "Lone Tower 2"			Jz_Script_jmzt2cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3840] = "Lone Tower 3"			Jz_Script_jmzt3cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3841] = "Lone Tower 4"			Jz_Script_jmzt4cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3842] = "Lone Tower 5"			Jz_Script_jmzt5cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3843] = "Lone Tower 6"			Jz_Script_jmzt6cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3847] = "Abandon Mine 1"			Jz_Script_fk1cs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[4602] = "Argent City"				Jz_Script_bycs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[4603] = "Shaitan City"			Jz_Script_slcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[4604] = "Icicle Castle"			Jz_Script_blbcs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[3024] = "Church"					Jz_Script_yszs = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[5619] = "Spring Town"				Jz_Script_spring = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[5620] = "Summer Island"			Jz_Script_summer = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[5621] = "Autumn Island"			Jz_Script_autumn = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[5622] = "Caribbean"				Jz_Script_caribbean = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[5623] = "Abaddon 4"				Jz_Script_4clime = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[5624] = "Sacred Snow Mountain"	Jz_Script_jokul = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[5625] = "Thundoria Castle"		Jz_Script_lante = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[6205] = "Winter Island"			ItemUse_DDJP = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[6398] = "Icespire Haven"			Jz_Script_bjcsA1 = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[6399] = "Andes Forest Haven"		Jz_Script_laslcsA1 = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[6400] = "Thundoria Harbor"		Jz_Script_ltjgcsA1 = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[6401] = "Sacred Snow Mountain"	Jz_Script_sxscsA1 = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[6454] = "Abandon Mine 1"			Jz_Script_fk1csA = function(role,Item) UseTicketDefault(role,Item) end
ticketTab[6455] = "Caribbean"				Jz_Script_jialebi = function(role,Item) UseTicketDefault(role,Item) end
ticketTab['__'] = "Underwater Tunnel"
ticketTab['__'] = "Underwater City"
ticketTab['__'] = "Seabed Tunnel"
ticketTab['__'] = "Dragon's Lair 1"
ticketTab['__'] = "Dream City"
ticketTab['__'] = "Heaven"
ticketTab['__'] = "Snow Kara Isle"
ticketTab['__'] = "Snow Ville Isle"
ticketTab['__'] = "Winter Moon Island"
ticketTab['__'] = "Icy Lake Island"
ticketTab['__'] = "Ice-Covered Island"
ticketTab['__'] = "Arena Island"
ticketTab['__'] = "Abaddon 5-8"
ticketTab['__'] = "Abaddon 9"
ticketTab['__'] = "Abaddon Haven"
ticketTab['__'] = "Abandon Mine Haven"
ticketTab['__'] = "Argent Bar"

UseItemId = {}	-- for items
function UseItemDefault(role, Item) -- Handler
	local itemId = GetItemID(Item);
	if UseItemId[itemId] == nil then
		BickerNotice(role, 'Item is currently not registered!');
		UseItemFailed(role);
		return
	else
		role = TurnToCha(role)
		if GetItemType(Item) == 44 then
			local j = DelBagItem(role, itemId, 1)
			if j ~= 1 then
				SystemNotice(role, 'Error in item function. Please report!');
				UseItemFailed(role)
				return
			end
		end
		UseItemId[itemId](role, Item);
	end
end

isItemStackable = function(itemId) return true end

GiveEqSet = function(role, attr, ...)
    local args = {...}
    local num_args = #args  -- Número de argumentos

    -- Verificar se há slots livres suficientes na bolsa
    if GetChaFreeBagGridNum(role) < num_args then
        SystemNotice(role, "Requires "..num_args.." Empty Slots to Open")
        UseItemFailed(role)
        return
    end

    -- Dar os itens correspondentes aos argumentos
    for i = 1, num_args do
        GiveItem(role, 0, args[i], 1, attr)
    end
end


GiveGemSet = function(role, gemId, beginLv, endLv)
	local slotsNeed = endLv - beginLv
	if GetChaFreeBagGridNum(role) < slotsNeed then
		SystemNotice(role, "Requires "..slotsNeed.." Empty Slots to Open")
		UseItemFailed(role)
		return
	end
	for i = beginLv, endLv do
		GiveItem(role, 0, gemId, 1, i+100)
	end
end

GiveEqRandom = function(role, attr, ...)
    if GetChaFreeBagGridNum(role) < 1 then
        SystemNotice(role, "Requires 1 Empty Slot to Open")
        UseItemFailed(role)
        return
    end

    -- Coletar os argumentos passados por '...'
    local args = {...}
    local num_args = #args  -- Número de argumentos

    -- Gerar um número aleatório com base no número de argumentos
    local i = math.random(1, num_args)

    -- Dar o item correspondente ao argumento i
    GiveItem(role, 0, args[i], 1, attr)
end


GiveTableRandom = function(role, t)
	local need = 1
	--[[for i = 1, table.getn(t) do
		if t[i].qty > need and not isItemStackable(t[i].id) then
			need = t[i].qty
		end
	end]]
	if GetChaFreeBagGridNum(role) < need then
		SystemNotice(role, "Requires "..need.." Empty Slots to Open")
		UseItemFailed(role)
		return
	end
	local i = math.random(1, table.getn(t))
	t[i][3] = t[i][3] or 4
	GiveItem(role, 0, t[i][1], t[i][2], t[i][3])
end

-- xtacy2016.05.16
GiveItemByPercent = function(role, ...)
	if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role, "Requires 1 Empty Slots to Open")
		UseItemFailed(role)
		return
	end
	if math.mod(arg.n, 2) ~= 0 then
		SystemNotice(role, "Invalid entries of arguments. Please contact officials!")
		UseItemFailed(role)
		return
	end
	local percent,max = {},0
	for i = arg.n/2+1, arg.n do
		max = max + arg[i]*100
		percent[table.getn(percent)+1] = arg[i]*100
		--table.insert(percent, arg[i]*100)
	end
	local rad = math.random(1, max); local id;
	for i = 1, table.getn(percent) do
		percent[i-1] = percent[i-1] or 0
		if rad >= percent[i-1] and rad <= (percent[i-1]+percent[i]) then
			id = i
			break;
		end
	end
	-- repeat ... until
	GiveItem(role, 0, arg[id], 1, 4)
end

GiveRandomPieces = function(role, t)
end

-- TODO: Treasure Chest of Forsaken City, Treasure Chest of Dark Swamp, Treasure Chest of Demonic World
-- TODO: write tool iterate through iteminfo
-- if UteItemId[column 1] ~= nil then
-- replace itemeffect with UseItemDefault
-- io.read() to confirm

ItemUse_100UP = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[6872] = function(role, Item) --Trick Leveling Fruit
	local Cha_Boat = 0
	local Lv = Lv(role)
	local nextLv = DEXP[Lv+1]
	if GetCtrlBoat(role) ~=  nil then
		SystemNotice(role, "You can not use this item while sailing" )
		UseItemFailed(role)
		return
	end
	if Lv >= 100 and Lv < 115 then
		SetChaAttrI(role, ATTR_CEXP, nextLv)
	else
		SystemNotice(role, "This fruit may only be used by players who are between Lv100 and Lv115." )
		UseItemFailed(role)
		return
	end
end

UseItemId[7057] = nil --Summer Leveling Fruit
UseItemId[7058] = nil --Summer Event Apparel Chest
UseItemId[7059] = nil --Lv45 BOSS Equipment Chest

--[[ItemUse_LV70Sxl = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7124] = function(role, Item) --Lvl 70 Necklace Voucher
	GiveEqRandom(role, 4, 7114, 7115, 7116, 7117, 7118, 7119, 7120, 7121, 7122, 7123)
end]]

ItemUse_AQLJLD = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7127] = function(role, Item) --Angela Junior Egg
	if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role, "Requires 1 Empty Slots to Open")
		UseItemFailed(role)
		return
	end
	GiveItem(role, 0, 7126, 1, 4) 
end

UseItemId[7128] = nil --Hourglass
UseItemId[7129] = nil --Mystic Gift Bag

ItemUse_AQL = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7131] = function(role, Item) --Angela-Egg
	if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role, "Requires 1 Empty Slots to Open")
		UseItemFailed(role)
		return
	end
	GiveItem(role, 0, 7125, 1, 4) 
end

UseItemId[7189] = nil --Mystic Chest
UseItemId[7190] = nil --Chest of Dream
UseItemId[7191] = nil --Flowery Chest
UseItemId[7192] = nil --Deathless Chest

--ItemUse_95JZDH = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7194] = function(role, Item) --Lv 90 Ring Ticket
end

UseItemId[7225] = nil --Red Christmas Box
UseItemId[7226] = nil --Yellow Christmas Box
UseItemId[7227] = nil --Blue Christmas Box
UseItemId[7228] = nil --Death Knight Summon Scroll
UseItemId[7229] = nil --Huge Mud Monster Summon Scroll
UseItemId[7230] = nil --Snowman Warlord Summon Scroll
UseItemId[7231] = nil --Soul of Goddess Summon Scroll
UseItemId[7232] = nil --Wandering Soul Summon Scroll
UseItemId[7233] = nil --Award Permit
UseItemId[7247] = nil --Christmas Voucher
UseItemId[7363] = nil --Wang Xiao Hu's Chest
UseItemId[7393] = nil --Force of the Devil

ItemUse_jlcBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7563] = function(role, Item) --Mystic Shrub Magic Toadstool
	TransformChaX(role, 75)
end

ItemUse_ppBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7564] = function(role, Item) --Little Squidy Magic Toadstool
	TransformChaX(role, 70)
end

ItemUse_kkBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7565] = function(role, Item) --Little Squirt Magic Toadstool
	TransformChaX(role, 69)
end

ItemUse_qjdsBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7566] = function(role, Item) --Rookie Boxeroo Magic Toadstool
	TransformChaX(role, 76)
end

ItemUse_szBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7567] = function(role, Item) --Bandit Magic Toadstool
	TransformChaX(role, 93)
end

ItemUse_xxbfBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7568] = function(role, Item) --Vampire Bat Magic Toadstool
	TransformChaX(role, 82)
end

ItemUse_ngqsBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7569] = function(role, Item) --Pumpkin Knight Magic Toadstool
	TransformChaX(role, 37)
end

ItemUse_xrqBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7570] = function(role, Item) --Melon Magic Toadstool
	TransformChaX(role, 96)
end

ItemUse_xrzBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7571] = function(role, Item) --Cactus Magic Toadstool
	TransformChaX(role, 95)
end

ItemUse_njgBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7572] = function(role, Item) --Mud Monster Magic Toadstool
	TransformChaX(role, 253)
end

--ItemUse_njgBSG = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7573] = function(role, Item)
	TransformChaX(role, 1324)
end

UseItemId[8322] = nil --Santa's Cart
UseItemId[8323] = nil --Empty Stocking
UseItemId[8324] = nil --Filled Stocking
UseItemId[8325] = nil --Jolly Cola
UseItemId[8326] = nil --Pine Cone
UseItemId[8327] = nil --Xmas Bling Ball
UseItemId[8328] = nil --Starry Cookie
UseItemId[8329] = nil --Frosty Magic Blossom
UseItemId[8330] = nil --3x Exp Fruit
UseItemId[8331] = nil --3x Drop Fruit

ItemUse_SZZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8648] = function(role, Item) --Leo Set Chest
	local chaType = GetChaTypeID(role)
	if chaType == 1 then		GiveEqSet(role, 4, 8652, 8653, 8654, 8655)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8656, 8657, 8658, 8659)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8660, 8661, 8662, 8663)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8664, 8665, 8496, 8497)
	end
end

ItemUse_MJZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8649] = function(role, Item) --Capricorn Set Chest
	local chaType = GetChaTypeID(role)
	if chaType == 1 then		GiveEqSet(role, 4, 8600, 8601, 8602, 8603)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8604, 8605, 8606, 8607)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8608, 8609, 8610, 8611)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8612, 8613, 8614, 8615)
	end
end

ItemUse_SPZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8650] = function(role, Item) --Aquarius Set Chest
	local chaType = GetChaTypeID(role)
	if chaType == 1 then		GiveEqSet(role, 4, 8616, 8617, 8618, 8619)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8620, 8621, 8622, 8623)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8624, 8625, 8626, 8627)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8628, 8629, 8630, 8631)
	end
end

ItemUse_SYZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8651] = function(role, Item) --Pisces Set Chest
	local chaType = GetChaTypeID(role)
	if chaType == 1 then		GiveEqSet(role, 4, 8632, 8633, 8634, 8635)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8636, 8637, 8638, 8639)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8640, 8641, 8642, 8643)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8644, 8645, 8646, 8647)
	end
end

ItemUse_XZXZ = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8713] = function(role, Item) --Constellation Medal
	GiveEqRandom(role, 4, 8445, 8449, 8453, 8457, 8461, 8465, 8469, 8473)
end

ItemUse_CNZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8722] = function(role, Item) --Virgo Set Chest
	local chaType = GetChaTypeID(role)
	if chaType == 1 then		GiveEqSet(role, 4, 8536, 8537, 8538, 8539)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8540, 8541, 8542, 8543)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8544, 8545, 8546, 8547)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8548, 8549, 8550, 8551)
	end
end

ItemUse_TPZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8723] = function(role, Item) --Libra Set Chest
	local chaType = GetChaTypeID(role)
	if chaType == 1 then		GiveEqSet(role, 4, 8552, 8553, 8554, 8555)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8556, 8557, 8558, 8559)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8560, 8561, 8562, 8563)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8564, 8565, 8566, 8567)
	end
end

ItemUse_TXZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8724] = function(role, Item) --Scorpio Set Chest
	if chaType == 1 then		GiveEqSet(role, 4, 8568, 8569, 8570, 8571)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8572, 8573, 8574, 8575)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8576, 8577, 8578, 8579)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8580, 8581, 8582, 8583)
	end
end

ItemUse_SSZKZBX = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[8725] = function(role, Item) --Sagittarius Set Chest
	if chaType == 1 then		GiveEqSet(role, 4, 8584, 8585, 8586, 8587)
	elseif chaType == 2 then	GiveEqSet(role, 4, 8588, 8589, 8590, 8591)
	elseif chaType == 3 then	GiveEqSet(role, 4, 8592, 8593, 8594, 8595)
	elseif chaType == 4 then	GiveEqSet(role, 4, 8596, 8597, 8598, 8599)
	end
end

UseItemId[8807] = nil --Book for Regaining Lifeskills
UseItemId[8909] = nil --Constellation Blueprint
UseItemId[9021] = nil --Demonic Dragon Fang Chest
UseItemId[9024] = nil --Skill Treasure Trove
UseItemId[9027] = nil --Booty Bag
UseItemId[9146] = nil --Tome of Love
UseItemId[9147] = nil --Altair Gem
UseItemId[9148] = nil --Vega Gem
UseItemId[9149] = nil --Romantic Rose
UseItemId[9150] = nil --Amour Rose
UseItemId[9151] = nil --Forever Love Rose
UseItemId[9164] = nil --Evil Crystal Source
UseItemId[9169] = nil --Amour Rose Ribbon
UseItemId[9170] = nil --Forever Love Rose Ribbon
UseItemId[9181] = nil --Magic Pump (Staff)
UseItemId[9182] = nil --Magic Pump
UseItemId[9183] = nil --Swing Maintenance Kit
UseItemId[9248] = nil --Cloak Unseal Device


UseItemId[9373] = nil -- Bronze Easter Egg
UseItemId[9374] = nil -- Silver Easter Egg
UseItemId[9375] = nil -- Gold Easter Egg


ItemUse_copBox = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[9302] = function(role, Item) --Bronze booty bag
	local itemList = {
		{5767,3,4}, {2898,1,4}, {5707,1,4},
		{0885,1,4}, {6719,1,4}, {6720,1,4},
		{6721,1,4}, {6722,1,4}, {6726,1,4}
	}
	GiveTableRandom(role, itemList)
end

ItemUse_silverBox = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[9303] = function(role, Item) --Silver booty bag
	local itemList = {
		{5694,3,4}, {2953,2,4}, {5707,1,4},
		{3877,1,4}, {6723,1,4}, {6725,1,4},
		{6730,1,4}, {6732,1,4}, {6727,1,4}
	}
	GiveTableRandom(role, itemList)
end

ItemUse_goldBox = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[9304] = function(role, Item) --Gold booty bag
	local itemList = {
		{5695,3,4}, {2953,2,4}, {3878,2,4},
		{6724,1,4}, {6728,1,4}, {6729,1,4},
		{6731,1,4}, {6749,1,4}
	}
	GiveTableRandom(role, itemList)
end

ItemUse_YiWanDollar = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[9314] = function(role, Item) --Billion Dollar note
	local chaGold = GetChaAttr(role, ATTR_GD)
	local gold = 1000000000
	if (chaGold + gold) >= 2000000000 then
		SystemNotice(role, "Your account is saturated. Unable to use item")
		UseItemFailed(role)
		return
	end
	AddMoney(role, 0, gold)
end



UseItemId[9386] = nil -- EXP Carrion Ball

-- Customs
UseItemId[9500] = function(role, Item) -- Hundred Million Note (stack x20)
	local chaGold = GetChaAttr(role, ATTR_GD)
	local gold = 100000000
	if (chaGold + gold) >= 2000000000 then
		SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed(role )
		return
	end
	AddMoney(role, 0, gold)
end

UseItemId[-1] = function(role, Item) -- Skill Reset
	role = TurnToCha(role)
	local tp,rs = GetChaAttr(role, ATTR_TP),ClearFightSkill(role)
	local rb,jb = GetChaAttr(role, ATTR_CSAILEXP),GetChaAttr(role, ATTR_JOB)
	local r1
	if rb > 0 then
		local r2 = SK_ZSSL
		-- get RB skills
		if jb == 8 then 			r1 = SK_BSJ
			elseif jb == 9 then		r1 = SK_WYZ
			elseif jb == 12 then	r1 = SK_HLP
			elseif jb == 13 then	r1 = SK_SSSP
			elseif jb == 14 then	r1 = SK_EMZZ
			elseif jb == 16 then	r1 = SK_CYN
		end
		AddChaSkill(role, r1, rb, 1, 0)
		AddChaSkill(role, r2, rb, 1, 0)
	end
	tp = tp + rs - (rb * 2)
	SetChaAttr(role, ATTR_TP, tp)
	BickerNotice(role, 'Skills resetted!')
	RefreshCha(role)
end
ItemUse_XiDianBook = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[9461] = function(role, Item) -- Stat Reset
	role = TurnToCha(role)
	local str,dex,agi,con,sta = GetChaAttr(role, ATTR_BSTR),GetChaAttr(role, ATTR_BDEX),GetChaAttr(role, ATTR_BAGI),GetChaAttr(role, ATTR_BCON),GetChaAttr(role, ATTR_BSTA)
	if str < 5 or dex < 5 or agi < 5 or con < 5 or sta < 5 then 
		SystemNotice(role, "You do not have enough points to reset. Reset failed")
		UseItemFailed(role)
		return
	end
	local cha_str,cha_dex,cha_agi,cha_con,cha_sta = str,dex,agi,con,sta
	local ap = GetChaAttr(role, ATTR_AP)
	local ap_dif = ap
	str,dex,agi,con,sta = str-cha_str+5,dex-cha_dex+5,agi-cha_agi+5,con-cha_con+5,sta-cha_sta+5
	ap_dif = ap_dif - ap + 5
	ap = ap + cha_str + cha_dex + cha_agi + cha_con + cha_sta - 25
	SetCharaAttr(ap, role, ATTR_AP)
	SetCharaAttr(str, role, ATTR_BSTR)
	SetCharaAttr(dex, role, ATTR_BDEX)
	SetCharaAttr(agi, role, ATTR_BAGI)
	SetCharaAttr(con, role, ATTR_BCON)
	SetCharaAttr(sta, role, ATTR_BSTA)
	BickerNotice(role, 'Stats resetted!')
	RefreshCha(role)
end

UseItemId[-1] = function(role, Item) -- auto 48 slots
	local bagnum = GetKbCap(role) 
	if bagnum >= 48 then
		SystemNotice(role, "You already have 48 Inventory Slot.")
		UseItemFailed(role)
		return
	end
	AddKbCap(role, 24) 
end

function GiveFairyKit(role, Item1, Item2, Item3)
	local Item_CanGet = GetChaFreeBagGridNum(role)	
	if Item_CanGet <= 0 then
		SystemNotice(role, "Your Inventory does not have enough slots to open !")
		UseItemFailed(role)
		return
	end
	GiveItem(role, 0, Item1, 1, 4)
	GiveItem(role, 0, Item2, 10, 4)
	GiveItem(role, 0, Item3, 10, 4)
end
UseItemId[-1] = function(role, Item) GiveFairyKit(role, 3920, 1196, 3436) end
UseItemId[-1] = function(role, Item) GiveFairyKit(role, 3919, 4531, 3435) end
UseItemId[-1] = function(role, Item) GiveFairyKit(role, 3924, 4540, 3443) end
UseItemId[-1] = function(role, Item) GiveFairyKit(role, 3922, 4537, 3444) end
UseItemId[-1] = function(role, Item) GiveFairyKit(role, 3921, 4533, 3437) end
UseItemId[-1] = function(role, Item) GiveFairyKit(role, 3925, 1253, 3442) end
UseItemId[-1] = function(role, Item) GiveFairyKit(role, 3918, 4530, 3434) end

UseItemId[-1] = function(role, Item) -- Random BOSS FRAME peice
	GiveEqRandom(role, 4, 2530, 2531, 2532, 2533, 2534, 2535, 2536, 2537,
						  2538, 2539, 2540, 2541, 2542, 2543, 2544, 2545,
						  2546, 2547, 2548)
end

UseItemId[-1] = function(role, Item) -- Chest of death soul
	GiveEqRandom(role, 4, 2562, 2563, 2564, 2565, 2566, 2567)
end

UseItemId[-1] = function(role, Item) -- 0cp bd set
	GiveEqSet(role, PLAYER_CCFSBOXI, 0845, 0846, 0847, 0848)
end

function ItemUse_Zhenheilong(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[2843] = function(role, Item) -- 0cp corp BD
	GiveEqSet(role, PLAYER_CCFSBOXI, 2367, 2368, 2369, 2370)
end

UseItemId[-1] = function(role, Item) -- Random 75 peice
	local t = {}
	for i = 2817, 2834 do table.insert(t, i) end
	GiveEqRandom(role, 4, unpack(t))
	--GiveEqRandom(role, 4, 2817, 2818, 2819, 2820, 2821, 2822, 2823, 2824, 2825, 
						  --2826, 2827, 2828, 2829, 2830, 2831, 2832, 2833, 2834)
end

UseItemId[-1] = function(role, Item) -- Random Lv75 weapon
	GiveEqRandom(role, 4, 0114, 0116, 0118, 0120, 0151, 0112, 0110)
end

UseItemId[-1] = function(role, Item) -- chest of grandiose
	GiveEqSet(role, 4, 1115, 1116, 1117, 1118)
end

UseItemId[-1] = function(role, Item) -- Corp kylin set
	GiveEqSet(role, 4, 2549, 2550, 2551, 2552)
end

UseItemId[-1] = function(role, Item) -- Random Lv60 ring
	GiveEqRandom(role, 4, 0415, 0416, 0414, 0387, 0417)
end

UseItemId[-1] = function(role, Item) -- Random Lv60 neck
	GiveEqRandom(role, 4, 0495, 0497)
end

UseItemId[-1] = function(role, Item) -- Random Lv50 ring
	GiveEqRandom(role, 4, 0334, 0346, 0347, 0348, 0349)
end

UseItemId[-1] = function(role, Item) -- Random Lv50 neck
	GiveEqRandom(role, 4, 0462, 0463)
end

UseItemId[-1] = function(role, Item) -- Random Lv40 ring
	GiveEqRandom(role, 4, 0324, 0327, 0328, 0329, 0330)
end

UseItemId[-1] = function(role, Item) -- Random Lv40 neck
	GiveEqRandom(role, 4, 0739, 0461)
end

ItemToForge = nil
UseItemId[-1] = function(role, Item) -- GM +27 Equipment Chest
end

UseItemId[-1] = function(role, Item) -- Combine Lv4 gem
end

UseItemId[-1] = function(role, Item) -- Random Azrael
end

UseItemId[-1] = function(role, Item) -- Random Normal Gem
end

UseItemId[-1] = function(role, Item) -- 2nd RB card
	GiveRebirthStone(role, Item, SecondRebirthStone)
end
UseItemId[-1] = function(role, Item) -- 3rd RB card
	GiveRebirthStone(role, Item, ThirdRebirthStone)
end

GiveRebirthStone = function(role, Item, stoneId)
	if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role, "Requires 1 Empty Slots to Open")
		UseItemFailed(role)
		return
	end
	if stoneId == nil then
		SystemNotice(role, "Card not activated!")
		print("Rebirth Stone Variable is nil. Please assign this variable")
		UseItemFailed(role)
		return
	end
	local map_name = GetChaMapName(role)
	if map_name == "prisonisland" then
  		SystemNotice(role, "Cannot use while inside Prison Island")
  		UseItemFailed(role)
  		return
	end
	local thisItemId = GetItemID(Item)
	local i = CheckBagItem(role, thisItemId)
	local k = ChaIsBoat(role)
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role, thisItemId, 1)
			if j == 1 then
				SystemNotice(role, "Use of Rebirth Card successful, you can now speak with the Reibrth angel to directly rebirth.")
				GiveItem(role, 0, stoneId, 1, 42)
				GoTo(role, 1750, 909, 'jialebi')
				return
			end
		end
	else
		UseItemFailed(role)
	end
end

-- include the weapons
-- need to lower these price to atleast 200g
-- TODO: anything that goes in the param of GiveEqRandom, change droppable to 0, tradeable to 0
UseItemId[9373] = function(role, Item) -- Lv 45 Light (crusader)
	GiveEqRandom(role, PLAYER_ZSITEM, 0654, 0478, 0302, 0022)
end
UseItemId[9373] = function(role, Item) -- Lv 50 Mithril (crusader)
	GiveEqRandom(role, PLAYER_ZSITEM, 0299, 0475, 0651, 0005)
end
UseItemId[9373] = function(role, Item) -- Lv 60 Ceremonial (crusader)
	GiveEqRandom(role, PLAYER_ZSITEM, 0304, 0480, 0656, 0006)
end
UseItemId[9373] = function(role, Item) -- Lv 70 Sagacious (crusader)
	GiveEqRandom(role, PLAYER_ZSITEM, 4150, 4166, 4182, 0007)
end
UseItemId[9373] = function(role, Item) -- Lv 45 Strong (champion)
	GiveEqRandom(role, PLAYER_ZSITEM, 0301, 0477, 0653, 0020)
end
UseItemId[9373] = function(role, Item) -- Lv 50 Savage Bull (champion)
	GiveEqRandom(role, PLAYER_ZSITEM, 2528, 0016)
end
UseItemId[9373] = function(role, Item) -- Lv 60 Primal (champion)
	GiveEqRandom(role, PLAYER_ZSITEM, 2529, 0017)
end
UseItemId[9373] = function(role, Item) -- Lv 70 Primal (champion)
	GiveEqRandom(role, PLAYER_ZSITEM, 4148, 0018)
end
UseItemId[9373] = function(role, Item) -- Lv 45 Peacock (sharpshooter)
	GiveEqRandom(role, PLAYER_ZSITEM, 0315, 0491, 0667, 0044)
end
UseItemId[9373] = function(role, Item) -- Lv 50 Emerald (sharpshooter)
	GiveEqRandom(role, PLAYER_ZSITEM, 0312, 0488, 0664, 0040)
end
UseItemId[9373] = function(role, Item) -- Lv 60 Raptor (sharpshooter)
	GiveEqRandom(role, PLAYER_ZSITEM, 0317, 0493, 0669, 0041)
end
UseItemId[9373] = function(role, Item) -- Lv 70 Gallant (sharpshooter)
	GiveEqRandom(role, PLAYER_ZSITEM, 4152, 4168, 4184, 0042)
end
UseItemId[9373] = function(role, Item) -- Lv 45 Mastman (lance/phyliss voyager)
	GiveEqRandom(role, PLAYER_ZSITEM, 0342, 0518, 0694, 0083)
end
UseItemId[9373] = function(role, Item) -- Lv 50 wind (lance/phyliss voyager)
	GiveEqRandom(role, PLAYER_ZSITEM, 0345, 0521, 0697, 1419)
end
UseItemId[9373] = function(role, Item) -- Lv 60 hurricane (lance/phyliss voyager)
	GiveEqRandom(role, PLAYER_ZSITEM, 0344, 0520, 0696, 1420)
end
UseItemId[9373] = function(role, Item) -- Lv 70 stride (lance/phyliss voyager)
	GiveEqRandom(role, PLAYER_ZSITEM, 4155, 4171, 4187, 1421)
end

Gyoza = Gyoza or {}
function ItemUse_SSSJ(role, Item)
	if Gyoza[role] == nil then
		Gyoza[role] = os.time();
	end
	local cd = Gyoza[role] - os.time()
	if cd > 0 then
		SystemNotice(role, 'Gyoza cooldown on effect wait '..cd..' sec(s) to use again!')
		UseItemFailed(role)
		return
	end
	mxhp = GetChaAttr(role,ATTR_MXHP)
	hp_resume = mxhp * 0.3
	hp = hp + hp_resume
	if hp > mxhp then hp = mxhp end
	local delay = 10
	Gyoza[role] = os.time()+delay
	SetCharaAttr(hp, role, ATTR_HP) 
end

-- customs:
ItemUse_dailychest = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[7554] = function(role, Item) -- daily gift
	local Item_CanGet = GetChaFreeBagGridNum(role)
	if Item_CanGet <= 0 then
		SystemNotice(role, 'Insufficient slot in inventory. Failed to use Legend GiftBox')
		UseItemFailed(role)
		return
	end
	local remain = GetItemAttr(Item, ITEMATTR_URE)
	if remain > 0 then
		local left = math.floor(remain/50) + 1
		SystemNotice( role , 'You must remain online for '..left..' more min(s) to open '..GetItemName(GetItemID(Item))..'!')
		UseItemFailed(role)
		return
	end
	-- TODO: rewards
end

UseItemId[-1] = function(role, Item) -- automatic 48 slot expansion
	local bagnum = GetKbCap(role) 
	if bagnum >= 48 then
		SystemNotice(role, 'You already have 48 Inventory Slot.')
		UseItemFailed(role)
		return
	end
	AddKbCap(role, 24) 
end 

UseItemId[-1] = function(role, Item) -- gem combining scroll
	CheckGridAvailable(role, 1)
	local target_bg = GetChaItem(role, 2, 47)
	local gem_id = GetItemID(target_bg)
	local gem_type = GetItemType(target_bg)
	if(target_bg ~= nil)then
		if(gem_type == 49 or gem_type == 50)then
			DeleteGem = TakeItem(role, 0, gem_id, 8)
			if(DeleteGem == 1)then
				GiveItem(role, 0, gem_id, 1, 104)
				BickerNotice(role, "Sucessfully Combined a Lv4 "..GetItemName(gem_id).."!")
			else
				BickerNotice(role, "Requires x8 "..GetItemName(gem_id).." to continue the procedure!")
				UseItemFailed(role)
				return
			end
		else
			BickerNotice(role, "Targeted Item is not a gem. Unable to combine!")
			UseItemFailed(role)
			return
		end
	else
		BickerNotice(role, GetItemName(gem_id).." on Targeted slot isnt a valid Gem. Unable to proceed")
		UseItemFailed(role)
		return
	end
end

UseItemId[-1] = function(role, Item) -- apparel defusion scroll (should use item_traget)
	local Slot = GetChaItem(role, 2, 3)
	local ApparelID = GetItemID(Slot)
	local MainAppID = ApparelID
	if(Slot == nil)then
		BickerNotice(role, "Targeted Slot does not possess any Item. Unable to proceed!")
		UseItemFailed(role)
		return
	end
	if(ApparelID > 5000)then
		MainAppID = GetItemAttr(Slot, ITEMATTR_VAL_FUSIONID)
	else
		BickerNotice(role, "Targeted Equipment isn't fused to apparel")
		UseItemFailed(role)
		return
	end

	local EQgem = GetItemForgeParam(Slot, 1)
	local r1 = 0
	local r2 = 0
	r1,r2 = MakeItem(role, MainAppID, 1, 18)
	GiveItem(role, 0, ApparelID, 1, 1)
	local Remove = 0
	Remove = RemoveChaItem(role, MainAppID, 2, 2, 3, 2, 1)
	if(Remove == 0)then
		BickerNotice(role, "Deleted main equipment Failed")
		UseItemFailed(role)
		return
	end
	local NewEQ = GetChaItem(role, 2, r2)
	local ParamTransfer = SetItemForgeParam(NewEQ, 1, EQgem)
	if(ParamTransfer == 0)then
		BickerNotice(role, "Failed to set forging attribute settings.")
		UseItemFailed(role)
		return
	else
		BickerNotice(role, "Apparel defusion successfully!")
		RefreshCha(role)
	end
end

UseItemId[-1] = function(role, Item) -- equipment reforging scroll
	local Deforge = GetChaItem(role, 2, 0)
	local FrogeTo = GetChaItem(role, 2, 1)
	local Deforge_type = GetItemType2(GetItemID(Deforge))
	local ForgeTo_type = GetItemType2(GetItemID(FrogeTo))

	if Deforge_type > 26 or ForgeTo_type > 26 then
		SystemNotice(role,"Please put an equipment!")
		UseItemFailed(role)
		return 0
	end
	if Deforge_type ~= ForgeTo_type then
		SystemNotice(role,"Item type on slot [1] not the same as slot [2]. Reforge failed!")
		UseItemFailed(role)
		return 0
	end
	local param = GetItemForgeParam(Deforge, 1)
	local ForgteTo_param = GetItemForgeParam(FrogeTo, 1)
	local Item_Stone = { }
	local Item_StoneLv = { }
	param = TansferNum(param)
	ForgteTo_param = TansferNum(ForgteTo_param)

	-- Gets every gem from item on slot 2
	Sockets = GetNum_Part1(param)
	Item_Stone[0] = GetNum_Part2(param)
	Item_Stone[1] = GetNum_Part4(param)
	Item_Stone[2] = GetNum_Part6(param)
	Item_StoneLv[0] = GetNum_Part3(param)
	Item_StoneLv[1] = GetNum_Part5(param)
	Item_StoneLv[2] = GetNum_Part7(param)

	if Item_Stone[1] == 0 and Item_Stone[1] == 0 and Item_Stone[2] == 0 then
		SystemNotice(role,"The item you desire to deforge is empty. Reforge failed!")
		UseItemFailed(role)
		return 0
	end

	local DeforgeItemName = GetItemName(GetItemID(Deforge))
	local ForgeItemName = GetItemName(GetItemID(FrogeTo))
	-- Forge Item on slot 2
	ForgteTo_param = SetNum_Part1(ForgteTo_param, Sockets)
	ForgteTo_param = SetNum_Part2(ForgteTo_param, Item_Stone[0])
	ForgteTo_param = SetNum_Part3(ForgteTo_param, Item_StoneLv[0])
	ForgteTo_param = SetNum_Part4(ForgteTo_param, Item_Stone[1])
	ForgteTo_param = SetNum_Part5(ForgteTo_param, Item_StoneLv[1])
	ForgteTo_param = SetNum_Part6(ForgteTo_param, Item_Stone[2])
	ForgteTo_param = SetNum_Part7(ForgteTo_param, Item_StoneLv[2])
	SetItemForgeParam(FrogeTo, 1, ForgteTo_param)
	-- Remove Gems from old Eq
	param = SetNum_Part1(param, Sockets)
	param = SetNum_Part2(param, 0)
	param = SetNum_Part3(param, 0)
	param = SetNum_Part4(param, 0)
	param = SetNum_Part5(param, 0)
	param = SetNum_Part6(param, 0)
	param = SetNum_Part7(param, 0)
	SetItemForgeParam(Deforge, 1, param)

	SystemNotice(role, "Succesfully moved gems from ["..DeforgeItemName.."] to {{"..ForgeItemName.."}}")
	RefreshCha(role)
end

--ÐÂÊ½ÑòÆ¤¾í
ItemUse_Map_JLBYPJ = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[0684] = function(role, Item) -- New Sheepskin Scroll
	 if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role, "You need to have at least 1 empty inventory slot")
		UseItemFailed(role)
		return
	end 
	local Has_GoldenMap = CheckBagItem(role, 682)
	if Has_GoldenMap >= 1 then
		SystemNotice(role, "You can only bring 1 Treasure Map at a time")
		UseItemFailed(role)
		return
	end
	local lv = GetChaAttr(role, ATTR_LV) 
	if lv < 15 or lv > 40 then
		SystemNotice(role, "Only characters between Lv 15 to Lv 40 can use New Sheepskin Scroll")
		UseItemFailed(role)
		return	
	end
	local r1 = 0
	local r2 = 0
	r1,r2 = MakeItem(role, 682, 1, 0)
	local ctm = GetChaItem(role, 2, r2)
	local ctm_maxure, ctm_ure, ctm_maxenergy = GetItemAttr(ctm, ITEMATTR_MAXURE), GetItemAttr(ctm, ITEMATTR_URE), GetItemAttr(ctm, ITEMATTR_MAXENERGY)
	local ctm_x, ctm_y, ctm_map = ctm_maxure, ctm_maxenergy, ctm_ure
	local mList, mName = {}, {}
		mList[0] = 'NoMap';		mList[1] = 'jialebi'
		mName[0] = 'No Map';	mName[1] = 'Treasure Gulf'
	if ctm_x == 0 or ctm_y == 0 or ctm_map == 0 then
		ctm_x, ctm_y, ctm_map = GetTheMapPos_JLB(role, 1)
		ctm_maxure, ctm_maxenergy, ctm_ure = ctm_x, ctm_y, ctm_map
		SetItemAttr(ctm, ITEMATTR_MAXURE, ctm_maxure)
		SetItemAttr(ctm, ITEMATTR_MAXENERGY, ctm_maxenergy)
		SetItemAttr(ctm, ITEMATTR_URE, ctm_map)
	end
	BickerNotice(role, 'Somewhere near ('..ctm_x..', '..ctm_y..'),'..mName[ctm_map]..'...')
end

-- ¼ÓÀÕ±È²Ø±¦Í¼
ItemUse_JLB_GoldenMap = function(role, Item) UseItemId[GetItemID(Item)](role, Item) end
UseItemId[0682] = function(role, Item) -- Caribbean Treasure Map
	if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role, "You need to have at least 1 empty inventory slot")
		UseItemFailed(role)
		return
	end 
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv < 15 or lv > 40 then
		SystemNotice(role, "Characters lower than Lv 15 or higher than Lv 40 cannot use this treasure map")
		UseItemFailed(role)
		return	
	end
	local Has_GoldenMap = CheckBagItem(role, 682)
	if Has_GoldenMap >= 2 then
		SystemNotice(role, "You can only have 1 treasure map in inventory to seek for treasure. Please deposit the rest into your vault")
		UseItemFailed(role)
		return
	end
	local ctm = GetChaItem2(role, 2, 682)
	local ctm_maxure, ctm_ure, ctm_maxenergy = GetItemAttr(ctm, ITEMATTR_MAXURE), GetItemAttr(ctm, ITEMATTR_URE), GetItemAttr(ctm, ITEMATTR_MAXENERGY)
	local ctm_x, ctm_y, ctm_map = ctm_maxure, ctm_maxenergy, ctm_ure
	local mList, mName = {}, {}
		mList[0] = 'NoMap';		mList[1] = 'jialebi'
		mName[0] = 'No Map';	mName[1] = 'Treasure Gulf'
	if ctm_x == 0 or ctm_y == 0 or ctm_map == 0 then
		ctm_x, ctm_y, ctm_map = GetTheMapPos_JLB(role, 1)
		ctm_maxure, ctm_maxenergy, ctm_ure = ctm_x, ctm_y, ctm_map
		SetItemAttr(ctm, ITEMATTR_MAXURE, ctm_maxure)
		SetItemAttr(ctm, ITEMATTR_MAXENERGY, ctm_maxenergy)
		SetItemAttr(ctm, ITEMATTR_URE, ctm_map)
	end
	local GetPos = CheckGetMapPos(role, ctm_x, ctm_y, mList[ctm_map])
	if GetPos == 0 then
		SystemNotice(role, "Treasure is hidden nearby ("..ctm_x..","..ctm_y..") at "..mName[ctm_map].." Region")
		UseItemFailed(role)
		return
	elseif GetPos == 1 then
		GiveGoldenMapItem_JLB(role)
	end
end

-- denies updateall
potCooldown = { hp = {}, sp = {} }
HandleFood = function(role, Item, heal, cooldown, life)
	-- by Xtacy [ero.2015]
	local name = GetChaDefaultName(role)
	local itemid = GetItemID(Item)
	local statName;
	-- get table
	local chaCooldown;
	if life == ATTR_HP then
		chaCooldown = potCooldown.hp
		statName = 'Hp'
	elseif life == ATTR_SP then
		chaCooldown = potCooldown.sp
		statName = 'Sp'
	else
		UseItemFailed(role)
		return
	end
	if chaCooldown[role] == nil then chaCooldown[role] = os.time() end
	-- get cooldown
	local cd = chaCooldown[role] - os.time()
	if cd > 0 then
		SystemNotice(role, GetItemName(itemid)..' cooldown. Please wait '..cd..' second(s) to use again!')
		UseItemFailed(role)
		return
	end
	local hp = GetChaAttr(role, life)
	local mxhp = GetChaAttr(role, life+30)
	-- check life already full
	if hp >= mxhp then
		SystemNotice(role, statName..' is currently full!')
		UseItemFailed(role)
		return
	end
	if hp > 0 then
		hp = hp + heal
		if hp > mxhp then hp = mxhp end
		-- SystemNotice(role, 'Recovered '..heal..' '..statName..'!')
		SetCharaAttr(hp, role, life)
		chaCooldown[role] = os.time() + cooldown
		PlayEffect(role, 134)
	end
end

-- HP Pots
function ItemUse_BREAD(role, Item)
	HandleFood(role, Item, 80, 2, ATTR_HP)
end
function ItemUse_APPLE(role, Item)
	HandleFood(role, Item, 20, 1, ATTR_HP)
end 
function ItemUse_CAKE(role, Item)
	HandleFood(role, Item, 180, 1, ATTR_HP)
end 
function ItemUse_JLG(role, Item)
	HandleFood(role, Item, 15, 1, ATTR_HP)
end 
function ItemUse_SZ(role, Item)
	HandleFood(role, Item, 20, 1, ATTR_HP)
end 
function ItemUse_MG(role, Item)
	HandleFood(role, Item, 35, 1, ATTR_HP)
end 
function ItemUse_MTLG(role, Item)
	HandleFood(role, Item, 40, 1, ATTR_HP)
end 
function ItemUse_BG(role, Item)
	HandleFood(role, Item, 50, 1, ATTR_HP)
end 
function ItemUse_WCG(role, Item)
	HandleFood(role, Item, 108, 1, ATTR_HP)
end 
function ItemUse_JLGZ(role, Item)
	HandleFood(role, Item, 250, 1, ATTR_HP)
end 
function ItemUse_SZC(role, Item)
	HandleFood(role, Item, 300, 1, ATTR_HP)
end 
function ItemUse_MGT(role, Item)
	HandleFood(role, Item, 350, 1, ATTR_HP)
end 
function ItemUse_MTLGZ(role, Item)
	HandleFood(role, Item, 400, 1, ATTR_HP)
end 
function ItemUse_BQL(role, Item)
	HandleFood(role, Item, 450, 1, ATTR_HP)
end
function ItemUse_WCLLZ(role, Item)
	HandleFood(role, Item, 500, 1, ATTR_HP)
end
function ItemUse_ZHGZ(role, Item)
	HandleFood(role, Item, 550, 1, ATTR_HP)
end 

-- SP POTS
function ItemUse_YYCY(role, Item)  --[[ medicated grass]]--
	HandleFood(role, Item, 4, 1, ATTR_SP)
end 
function ItemUse_MHHB(role, Item)  --[[ÃÎ»Ã»¨°ê]]--
	HandleFood(role, Item, 8, 1, ATTR_SP)
end 
function ItemUse_QYGS(role, Item)  --[[ÆæÒì¹ûÊµ]]--
	HandleFood(role, Item, 18, 1, ATTR_SP)
end 
function ItemUse_BFCY(role, Item)  --[[±ù·â²ÝÑ¿]]--
	HandleFood(role, Item, 22, 1, ATTR_SP)
end 
function ItemUse_GCYS(role, Item)  --[[¸Ê²ÝÒ©Ë®]]--
	HandleFood(role, Item, 33, 1, ATTR_SP)
end 
function ItemUse_XSHC(role, Item)  --[[ÐÑÉñ»¨²è]]--
	HandleFood(role, Item, 38, 1, ATTR_SP)
end 
function ItemUse_MZQYG(role, Item)  --[[ÃØÖÆÆæÒì¸à]]--
	HandleFood(role, Item, 41, 1, ATTR_SP)
end 
function ItemUse_BYS(role, Item)  --[[±ùÑ¿ËÖ]]--
	HandleFood(role, Item, 59, 1, ATTR_SP)
end 
function ItemUse_TMLGZ(role, Item)  --[[ÌáÂíÀ­¹û×Ó]]--
	HandleFood(role, Item, 100, 1, ATTR_SP)
end 
function ItemUse_SMG(role, Item)  --[[ÉñÃØ¹û]]--
	HandleFood(role, Item, 111, 1, ATTR_SP)
end 
function ItemUse_TSJ(role, Item)  --[[ÌáÉñ¼Á]]--
	HandleFood(role, Item, 141, 1, ATTR_SP)
end
function ItemUse_MHYS(role, Item)  --[[Ä§»ÃÒ©Ë®]]--
	HandleFood(role, Item, 201, 1, ATTR_SP)
end

-- 2.0
-------------------------------------Constitution Recovery Flask
function ItemUse_TLHFJA(role, Item)
	HandleFood(role, Item, 1000, 3, ATTR_HP)
end
------------------------------------SP Holy Water
function ItemUse_TMLGZA(role, Item) 
	HandleFood(role, Item, 150, 3, ATTR_SP)
end 
-- Consitution Recovery Vial
function ItemUse_TLHFJ(role, Item)
	HandleFood(role, Item, 800, 3, ATTR_HP)
end
-- Duplings
function ItemUse_ZhongZi(role, Item) 
	HandleFood(role, Item, 1000, 3, ATTR_HP)
end 

-- not in iteminfo
function ItemUse_superment(role, Item)
	HandleFood(role, Item, 1500, 3, ATTR_HP)
end
function ItemUse_holywater(role, Item) 
	HandleFood(role, Item, 250, 3, ATTR_SP)
end 
function ItemUse_HANBAO(role, Item)  --[[ºº±¤¹«Ê½]]--
	HandleFood(role, Item, 235, 1, ATTR_HP)
end 
function ItemUse_KAORUZHU(role, Item)  --[[¿¾ÈéÖí¹«Ê½]]--
	HandleFood(role, Item, 280, 1, ATTR_HP)
end 


apparelConverterTable = {
	[1] = 10846,--1h sword
	[2] = 10847,--2h sword
	[3] = 10851,--bow
	[4] = 10848,--gun
	[7] = 10850, --dagger
	[9] = 10849, --staff
	[11] = 10852, --shield
	[20] = 10842, --helm
	[22] = 10843, --armour
	[23] = 10844, --glove
	[24] = 10845, --boot
	[27] = 10843, --tatoo
}
function ApparelConverter(role,item,target)
	if not target or GetItemAttr(target,ITEMATTR_MAXURE) == 25000 then
		return UseItemFailed(role)
	end
	local itemType = GetItemType(target)
	if apparelConverterTable[itemType] then
		local ID = GetItemID(target)
		for i = 0,47 do
			local item2 = GetChaItem(role,2,i)
			if item2 == target then
				RemoveChaItem ( role , GetItemID(target) , 1 , 2 , i , 2 , 1 , 0)
				break
			end
		end
		local appTab = {
			ID = apparelConverterTable[itemType],
			Quantity = 1,
			MaxDurability = 25000,
			Durability = 25000,
			FuseID = ID,
		}
		AddItem(role,appTab)
	else
		SystemNotice(role,"Invalid equipment.")
		return UseItemFailed(role)
	end
end