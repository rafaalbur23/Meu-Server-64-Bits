print('Loading IGS.lua')
CMD_CM_STORE_MODE = 101
CMD_CM_STORE_OPEN_ASK = 41
CMD_CM_STORE_LIST_ASK = 42
CMD_CM_STORE_BUY_ASK = 43
CMD_CM_STORE_CHANGE_ASK = 44
CMD_CM_STORE_QUERY = 45
CMD_CM_STORE_VIP = 46
CMD_CM_STORE_AFFICHE = 47
CMD_CM_STORE_CLOSE = 48

CMD_MC_STORE_OPEN_ASR = 561
CMD_MC_STORE_LIST_ASR = 562
CMD_MC_STORE_BUY_ASR = 563
CMD_MC_STORE_CHANGE_ASR = 564
CMD_MC_STORE_QUERY = 565
CMD_MC_STORE_VIP = 566
CMD_MC_STORE_AFFICHE = 567
CMD_MC_POPUP_NOTICE = 503


function split(str, delim, maxNb)
	-- Eliminate bad cases...
	if string.find(str, delim) == nil then
		return { str }
	end
	if maxNb == nil or maxNb < 1 then
		maxNb = 0    -- No limit
	end
	local result = {}
	local pat = "(.-)" .. delim .. "()"
	local nb = 0
	local lastPos
	for part, pos in string.gmatch(str, pat) do
		nb = nb + 1
		result[nb] = part
		lastPos = pos
		if nb == maxNb then 
			break 
		end
	end
	-- Handle the last field
	if nb ~= maxNb then
		result[nb + 1] = string.sub(str, lastPos)
	end
	return result
end
PopupNotice = PopupNotice or function(role, text) -- PopupNotice by Billy
	local packet = GetPacket() 
	WriteCmd(packet, CMD_MC_POPUP_NOTICE)
	WriteString(packet, text)
	SendPacket(role, packet) 
end 
function Spliter(s, delimiter)
    result = {};
    --for i in (s..delimiter) :gmatch("(.-)"..delimiter) do
    for i in string.gmatch(s..delimiter,"(.-)"..delimiter) do
        table.insert(result, i);
    end
    return result;
end

ItemMallInfo = {}
ItemRepInfo = {}
ShopMode = {}
PACK_PER_PAGE = 9

IGSUsers = IGSUsers or {}
IGSPacks = {}
IGSTabs = {}



RPSUsers = RPSUsers or {}
RPSTabs = {}
RPSPacks = {}
 



function LoadShopIGS()
	local fp = assert(io.open(GetResPath('ItemMallShop.txt')))
	for line in fp:lines() do
		local position = string.find(line, '[ \t]*//')
		if position ~= 1 then
			local column = split(line, '\t')
			local iD = tonumber(column[1])
			local itemName = column[2]
			local description = column[3]
			local price = tonumber(column[4])
			local hot = tonumber(column[5])
			local items = Spliter(column[6], ",")
			local quantity = Spliter(column[7], ",")
			local duration = tonumber(column[8])
			local stock = tonumber(column[9])
			
			
			ItemMallInfo[iD] = {ItemName = itemName, Description = description, Price = price, Hot = hot, Items = items, Quantity = quantity, Duration = duration,Stock = stock}
			
		end
	end
end
LoadShopIGS()



function LoadShopRep()
	local fp = assert(io.open(GetResPath('ItemRepuShop.txt')))
	for line in fp:lines() do
		local position = string.find(line, '[ \t]*//')
		if position ~= 1 then
			local column = split(line, '\t')
			local iD = tonumber(column[1])
			local itemName = column[2]
			local description = column[3]
			local price = tonumber(column[4])
			local hot = tonumber(column[5])
			local items = Spliter(column[6], ",")
			local quantity = Spliter(column[7], ",")
			local duration = tonumber(column[8])
			local stock = tonumber(column[9])
			
			
			ItemRepInfo[iD] = {ItemName = itemName, Description = description, Price = price, Hot = hot, Items = items, Quantity = quantity, Duration = duration,Stock = stock}
			
		end
	end
end
LoadShopRep()


function AddMallPack(title,description,price,hot,items,Quantity,duration,stock)
	local index = table.getn(IGSPacks)+1
	IGSPacks[index] = {
		Title = title,
		Description = description,
		Price = price,
		Hot = hot,
		Items = items,
		Quantity = Quantity,
		duration = duration,
		stock = stock,
	}
	return index
end


function SetItemMall()
	for i = 1 , table.getn(ItemMallInfo) , 1 do
		
		AddMallPack(ItemMallInfo[i].ItemName,ItemMallInfo[i].Description,ItemMallInfo[i].Price,ItemMallInfo[i].Hot,ItemMallInfo[i].Items,ItemMallInfo[i].Quantity,ItemMallInfo[i].Duration,ItemMallInfo[i].Stock)
	
	end
end
SetItemMall()




function AddRPSPack(title,description,price,hot,items,Quantity,duration,stock)
	local index = table.getn(RPSPacks)+1
	RPSPacks[index] = {
		Title = title,
		Description = description,
		Price = price,
		Hot = hot,
		Items = items,
		Quantity = Quantity,
		duration = duration,
		stock = stock,
	}
	return index
end

function SetItemRep()
	for i = 1 , table.getn(ItemRepInfo) , 1 do
		
		AddRPSPack(ItemRepInfo[i].ItemName,ItemRepInfo[i].Description,ItemRepInfo[i].Price,ItemRepInfo[i].Hot,ItemRepInfo[i].Items,ItemRepInfo[i].Quantity,ItemRepInfo[i].Duration,ItemRepInfo[i].Stock)
	
	end
end
SetItemRep()


function AddMallTab(Title,Packs,Parent)
	local Packs = Packs or {}
	local index = table.getn(IGSTabs)+1
	IGSTabs[index] = {
		Title = Title,
		Packs = Packs,
		Parent = Parent or 0,
	}
	for i,v in pairs(Packs) do
		IGSPacks[v].Enabled = true
	end
	return index
end

function AddRPSTab(Title,Packs,Parent)
	local Packs = Packs or {}
	local index = table.getn(RPSTabs)+1
	RPSTabs[index] = {
		Title = Title,
		Packs = Packs,
		Parent = Parent or 0,
	}
	for i,v in pairs(Packs) do
		RPSPacks[v].Enabled = true
	end
	return index
end

function AddPackToTab(tab,item)
	IGSTabs[tab].Packs[table.getn(IGSTabs[tab].Packs)+1] = IGSPacks[item]
	IGSPacks[item].Enabled = true
end

function AddPackToTabRPS(tab,item)
	RPSTabs[tab].Packs[table.getn(RPSTabs[tab].Packs)+1] = RPSPacks[item]
	RPSPacks[item].Enabled = true
end



local PromotionM = AddMallTab("Promotion",{267,251,252,3,103,205})  -- ai vai ter os dois la? Isso, certo entendi
local PetM = AddMallTab("Pet",{4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,87,88,89,90,91}) 
local LevelingM = AddMallTab("Leveling",{23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,41,42,43})  
local MysteryM = AddMallTab("Teleportation",{44,45,46,47,48,49,50}) 
local ForgingM = AddMallTab("Forging",{51,52,53,54,55,56,57,58,59,60,77,78,83,84,85,86})  
local ApparelsM = AddMallTab("Decoration",{263,264,265,266,92,93,94,95,96,97,98,99,100,101,102,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250})
local OperaM = AddMallTab("Exclusive",{253,254,255,256,257,258,259,260,261,262,268,269,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511})
local MiscellaneousM = AddMallTab("Miscellaneous",{61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,79,80,81,82})
local CrystalsM = AddMallTab("Crystal",{121,122,123})


local PromotionR = AddRPSTab("Promotion",{83,3,79})
local LevelingR = AddRPSTab("Pet",{4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21})  --Tem outro arquivo para loja de rep
local ForgingR = AddRPSTab("Leveling",{22,23,24,25,26,28,29,30})  
local ForgingR = AddRPSTab("Teleportation",{31,32,33,34,35,36,37})  
local PetR = AddRPSTab("Forging",{64,65,66,67,38,39,40,41,42,43,44,45,46,47})   
local EquipmentR = AddRPSTab("Decoration",{68,69,70,71,72,73,74,75,76,77,78})    
local MiscellaneousR = AddRPSTab("Miscellaneous",{48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63})
local ReputationR = AddRPSTab("Reputation",{80,81,82})




function GetShopMode(role)
	return (ShopMode[role].Shop)
end


function operateIGS(role,pkt)
	
	local cmd = ReadCmd(pkt)
	if cmd == CMD_CM_STORE_OPEN_ASK then
	elseif cmd == CMD_CM_STORE_MODE then
		
		local Mode = ReadDword(pkt)
		if ShopMode[role] == nil then
			ShopMode[role] = {Shop = 0}
		end
		if Mode == 1 then
			ShopMode[role].Shop = 1
			openIGS(role,1)
		elseif Mode == 2 then
			ShopMode[role].Shop = 2
			openIGS(role,2)
		end
	
		
	elseif cmd == CMD_CM_STORE_BUY_ASK then
		
		local StoreMode = GetShopMode(role)
		local ID = ReadDword(pkt)
		if GetShopMode(role) == 1 then 
			BuyIGSPack(role,ID,1)
			
		elseif GetShopMode(role) == 2 then
			BuyIGSPack(role,ID,2)
		end
		
		
	elseif cmd == CMD_CM_STORE_LIST_ASK then
		
		local lClsID = ReadDword(pkt)
		local sPage = ReadWord(pkt)
		local sNum = ReadWord(pkt)	
		local StoreMode = GetShopMode(role)
		if GetShopMode(role) == 1 then 
			openIGSTab(role,lClsID,sPage,1)
		elseif GetShopMode(role) == 2 then
			openIGSTab(role,lClsID,sPage,2)
		end
		
	elseif cmd == CMD_CM_STORE_CLOSE then
		IGSUsers[role] = nil
		RPSUsers[role] = nil
		ShopMode[role] = nil
	end
end



------ create .log file ---mothannakh
_igs					= {}												-- Declares the table _igs
_igs.SavePath			= GetResPath('../IGS_Logs/Igs.log')		-- create the empty file 
_igs.SavePath2			= GetResPath('../IGS_Logs/MallPoints.log')		-- create the empty file
_igs.SavePath3			= GetResPath('../RPS_Logs/Rps.log')		-- create the empty file
_igs.Initial			= function(File)
	Table				= io.open(File, 'r')
	
	if Table ~= nil then
		io.close(Table)
		--print("file closed")
	else
	io.open(File, 'w+')
	---print("Mall System Logs unexpected Error!")
	end
end
_igs.Initial(_igs.SavePath)	
_igs.Initial(_igs.SavePath2)	
_igs.Initial(_igs.SavePath3)
-----------mall points logs--
function MallLog(msg)
	local file = "IGS_Logs/MallPoints.log"
	local LogFile = io.open(file,'a')
	LogFile:write("["..os.date().."]\t"..msg.."\n")
	LogFile:close()	
end
----------------
function IGSLog(msg)
	local file = "IGS_Logs/Igs.log"
	local LogFile = io.open(file,'a')
	LogFile:write("["..os.date().."]\t"..msg.."\n")
	LogFile:close()	
end

function RPSLog(msg)
	local file = "RPS_Logs/Rps.log"
	local LogFile = io.open(file,'a')
	LogFile:write("["..os.date().."]\t"..msg.."\n")
	LogFile:close()	
end

function BuyIGSPack(role,ID,StoreMode)
	
	if StoreMode == 1 then
		if IGSPacks[ID] and IGSPacks[ID].Enabled then
			local pack = IGSPacks[ID]
			local slots = table.getn(pack.Items)
			local pkt = GetPacket()
			WriteCmd(pkt,CMD_MC_STORE_BUY_ASR)
			
			if GetChaFreeTempBagGridNum(role) >= slots and HasIMP(role,pack.Price) and CanBuyRemainItemIGS(ID) and CanBuyLimitedItemIGS(ID) then
				
				if ItemMallInfo[ID].Stock > 0 then
					
					EditStockItemMall(ID,9,ItemMallInfo[ID].Stock-1)
					
					
					
					
					local cmd1 = string.format("LoadShopIGS()")	
					LuaAll(cmd1,role)
					local cmd2 = string.format("SetItemMall()")	
					LuaAll(cmd2,role)
					local cmd3 = string.format("UpdateIGS()")	
					LuaAll(cmd3,role)
				end
				
				
				TakeIMP(role,pack.Price)
				IGSLog(string.format("[%s] Bought [%s] for [%d], [%d] remaining.",GetChaDefaultName(role),pack.Title,pack.Price,GetIMP(role)))
			
				local Products = IGSPacks[ID].Items
				local Qnt = IGSPacks[ID].Quantity
			
				for i,v in ipairs(Products) do 
					GiveItemX ( role , 0 , v , Qnt[i] , 4 )
				end
				WriteByte(pkt,1)
				
				WriteDword(pkt,GetCredits(role))
				WriteDword(pkt,GetIMP(role))
				
			else
				WriteByte(pkt,0)
			end	
			
			SendPacket(role,pkt)
		end
	
	elseif StoreMode == 2 then
	
		if RPSPacks[ID] and RPSPacks[ID].Enabled then
		
			local pack = RPSPacks[ID]
			local slots = table.getn(pack.Items)
			local pkt = GetPacket()
			WriteCmd(pkt,CMD_MC_STORE_BUY_ASR)
			if GetChaFreeTempBagGridNum(role) >= slots and HasCredits(role,pack.Price) and CanBuyRemainItemRep(ID) and CanBuyLimitedItemRep(ID) then
				
				if ItemRepInfo[ID].Stock > 0 then
					
					EditStockItemRep(ID,9,ItemRepInfo[ID].Stock-1)
					local cmd1 = string.format("LoadShopRep()")	
					LuaAll(cmd1,role)
					local cmd2 = string.format("SetItemRep()")	
					LuaAll(cmd2,role)
					local cmd3 = string.format("UpdateRPS()")	
					LuaAll(cmd3,role)
				end
				
				TakeCredits(role,pack.Price)
				RPSLog(string.format("[%s] Bought [%s] for [%d], [%d] remaining.",GetChaDefaultName(role),pack.Title,pack.Price,GetCredits(role)))
				
				
				local Products = RPSPacks[ID].Items
				local Qnt = RPSPacks[ID].Quantity
			
				for i,v in ipairs(Products) do 
					GiveItemX ( role , 0 , v , Qnt[i] , 4 )
				end
				WriteByte(pkt,1)
				
				
				WriteDword(pkt,GetCredits(role))
				WriteDword(pkt,GetIMP(role))
				
			else
				WriteByte(pkt,0)
			end	
			SendPacket(role,pkt)
		end
	end
	
end



function SetIMPAcc(acc,num)
	local chas = {GetPlayerByActName(acc)}
	for i,v in ipairs(chas) do
		SetIMP(v,num,true)
		--UpdateIMP(v)
	end
end

-- function imp(i)
	-- GiveIMP(GetPlayerByName('ShadowJr'),i or 1000)
-- end
-----function for handle chat mothannakh--
--give imps byname
function giveimps (role,name,num)
	local name = GetPlayerByName(name)
	local gmname = GetChaDefaultName(role)
	if name ~= nil then
		GiveIMP(name,num)
		SystemNotice(name,"GM ["..gmname.." ]Gave you x"..num.." [mall points ]")
		PopupNotice(role,"you Gave you x ("..num..") [ mall points ] to ["..GetChaDefaultName(name).." ]")
		MallLog("GM ["..gmname.." ]Gave x("..num.." ) [ Mall Points ] to ["..GetChaDefaultName(name).."] " )
	end
end
----take imps handlechat mothannakh--
function takeimps (role,name,num)
	local name = GetPlayerByName(name)
	local gmname = GetChaDefaultName(role)
	if name ~= nil then
		TakeIMP(name,num)
		SystemNotice(name,"GM ["..gmname.." ]took from you x"..num.." [mall points ]")
		PopupNotice(role,"You Took x "..num.." [mall points ] from ["..GetChaDefaultName(name).." ]")
		MallLog("GM [ "..gmname.." ] Took x("..num..") [ Mall Points ] from ["..GetChaDefaultName(name).."] " )
	end
end
----give imps or take by accountname	--Note Player should be online 
function impsbyacount(role,name,num,value)
	local account = GetPlayerByActName(name)
	if account ~= nil then
		if value == '+' then
			SetIMP(account,GetIMP(account)+num)
		--	print("here")
		--	UpdateIMP(name)		
			else
			SetIMP(account,GetIMP(account)-num)
			--UpdateIMP(name)	
		end
	end

end

------
function imps(name,num)
	local role = GetPlayerByName(name)
	local cmd = string.format([[SetIMPAcc('%s',%d)]],GetActName(role),num)
	Lua_All(cmd,role)
end

function HasIMP(role,num)
	return GetIMP(role) >= num
end



function TakeIMP(role,num)
	SetIMP(role,GetIMP(role)-num)
end

function HasCredits(role,num)
	return GetCredits(role) >= num
end

function TakeCredits(role,num)
	SetChaAttr(role,ATTR_FAME,GetCredits(role)-num)
	RefreshCha(role)
end

function GiveIMP(role,num)
	SetIMP(role,GetIMP(role)+num)
	SystemNotice(role, "System gives you "..num.." IMP, total: "..GetIMP(role).."!");
end

function UpdateIMP(role)
	local pkt = GetPacket()
	WriteCmd(pkt,CMD_MC_UPDATEIMP)
	WriteDword(pkt,GetIMP(role))
	SendPacket(role,pkt)
end






function WritePackage(pkt,ID)
	local pack = IGSPacks[ID]
	
	------Stock tables end ---
	WriteDword(pkt,ID) --comid
	WriteString(pkt,pack.Title) --package name
	WriteDword(pkt,pack.Price) --price
	WriteString(pkt,pack.Description) --description
	WriteByte(pkt,pack.Hot) --1=hot, 0=not
	WriteDword(pkt,2147483648) --nTime (??)
	WriteDword(pkt,ItemMallInfo[ID].Stock) --Item Quantidade Disponivel
	WriteDword(pkt,ItemMallInfo[ID].Duration) -- Item Duration
	WriteWord(pkt,table.getn(pack.Items))--number of items in package
	
	local Products = IGSPacks[ID].Items
	local Qnt = IGSPacks[ID].Quantity
			
	for i,v in ipairs(Products) do 
		WriteItem(pkt,v,Qnt[i])	
	end
end

function WritePackageRPS(pkt,ID)
	local pack = RPSPacks[ID]
	
	
	------Stock tables end ---
	WriteDword(pkt,ID) --comid
	WriteString(pkt,pack.Title) --package name
	WriteDword(pkt,pack.Price) --price
	WriteString(pkt,pack.Description) --description
	WriteByte(pkt,pack.Hot) --1=hot, 0=not
	WriteDword(pkt,2147483648) --nTime (??)
	WriteDword(pkt,ItemRepInfo[ID].Stock) --stock Quantity
	WriteDword(pkt,ItemRepInfo[ID].Duration) --hours remaining 0x80000000
	WriteWord(pkt,table.getn(pack.Items))--number of items in package
	
	local Products = RPSPacks[ID].Items
	local Qnt = RPSPacks[ID].Quantity
			
	for i,v in ipairs(Products) do 
		WriteItem(pkt,v,Qnt[i])	
	end
end


	



function WriteItem(pkt,item,qty)
	
	
	item = {ID=item}	
	
	
	WriteWord(pkt,item.ID) --itemID
	WriteWord(pkt,qty or 1) --itemnum or Quantity
	WriteWord(pkt,0) --flute(????)
	for i = 1,5 do
		if item.Attributes and item.Attributes[i] then
			WriteWord(pkt,item.Attributes[i].ID)--attr
			WriteWord(pkt,item.Attributes[i].Num)--value
		else
			WriteWord(pkt,0)--attr
			WriteWord(pkt,0)--value
		end
	end
end





function openIGSTab(Player, tab, Page,StoreMode)
	
	if StoreMode == 1 then
		local tab = tab or 1
		local Page = Page or 1
		if not IGSTabs[tab] or not Player then
			return
		end
		IGSUsers[Player] = {tab,Page}
		local Packet = GetPacket()
		WriteCmd(Packet, CMD_MC_STORE_LIST_ASR)
		local totalnum = table.getn(IGSTabs[tab].Packs)
		local maxPage = math.ceil(totalnum / PACK_PER_PAGE)
		WriteWord(Packet, maxPage)--max Page (calc this)
		WriteWord(Packet, Page)--current Page
		if Page < maxPage or totalnum == PACK_PER_PAGE then		----add <= if want to fill empty slots
			WriteWord(Packet,PACK_PER_PAGE)--number of item packages
		else
			WriteWord(Packet, totalnum)--number of item packages
		end
		for i = 1, PACK_PER_PAGE, 1 do
			local index = i + (Page - 1) * PACK_PER_PAGE
			local packID = IGSTabs[tab].Packs[index]
			if packID then
				WritePackage(Packet, packID)
			end
		end
		SendPacket(Player,Packet)
	elseif StoreMode == 2 then
		local tab = tab or 1
		local Page = Page or 1
		if not RPSTabs[tab] or not Player then
			return
		end
		RPSUsers[Player] = {tab,Page}
		local Packet = GetPacket()
		WriteCmd(Packet, CMD_MC_STORE_LIST_ASR)
		local totalnum = table.getn(RPSTabs[tab].Packs)
		local maxPage = math.ceil(totalnum / PACK_PER_PAGE)
		WriteWord(Packet, maxPage)--max Page (calc this)
		WriteWord(Packet, Page)--current Page
		if Page < maxPage or totalnum == PACK_PER_PAGE then		----add <= if want to fill empty slots
			WriteWord(Packet,PACK_PER_PAGE)--number of item packages
		else
			WriteWord(Packet, totalnum)--number of item packages
		end
		for i = 1, PACK_PER_PAGE, 1 do
			local index = i + (Page - 1) * PACK_PER_PAGE
			local packID = RPSTabs[tab].Packs[index]
			if packID then
				WritePackageRPS(Packet, packID)
			end
		end
		SendPacket(Player,Packet)
	end
	
end



function openIGS(role,StoreMode)
	if not role then
		return
	end
	
	local pkt = GetPacket()
	WriteCmd(pkt,CMD_MC_STORE_OPEN_ASR)
	
	WriteByte(pkt,1)--is valid
	
	if StoreMode == 1 then
		WriteDword(pkt,0)--VIP level
		WriteDword(pkt,GetCredits(role))--bean
		WriteDword(pkt,GetIMP(role))--money
		WriteDword(pkt,0)--unused (count for field that isnt used)
		WriteDword(pkt,table.getn(IGSTabs))--lClsNum
		IGSUsers[role] = true
		
		for i,v in ipairs(IGSTabs) do
			WriteWord(pkt,i)--lClsID
			WriteString(pkt,v.Title)--szClsName
			WriteWord(pkt,v.Parent or 0)--parentID
		end
	elseif StoreMode == 2 then
		WriteDword(pkt,0)--VIP level
		WriteDword(pkt,GetCredits(role))--bean
		WriteDword(pkt,GetIMP(role))--money
		WriteDword(pkt,0)--unused (count for field that isnt used)
		WriteDword(pkt,table.getn(RPSTabs))--lClsNum
		RPSUsers[role] = true
		for i,v in ipairs(RPSTabs) do
			WriteWord(pkt,i)--lClsID
			WriteString(pkt,v.Title)--szClsName
			WriteWord(pkt,v.Parent or 0)--parentID
		end
	end
	
	SendPacket(role,pkt)
end



function UpdateIGS()
	for i,v in pairs(IGSUsers) do
		if v then
			
			openIGSTab(i,v[1],v[2],1)
			
		end
	end
end

UpdateIGS()

function UpdateRPS()
	for i,v in pairs(RPSUsers) do
		if v then
			
			openIGSTab(i,v[1],v[2],2)
			
		end
	end
end

UpdateRPS()



--------igs mall point ---

function ImpsPointCard(Player, Item)
	local Name = GetChaDefaultName(Player)
	local ItemID = GetItemID(Item)
	local GlobalCD = true	-- If true, every player will have the same cooldown and will not be able to use it when another player just used it.
	local Cooldown = 5		-- Cooldown in seconds.
	local crystalifo = GetIMP(Player)
	if GlobalCD then
		IGS_V = IGS_V or 0
		if (IGS_V - os.time()) > 0 then
			PopupNotice(Player, "In order to use ["..GetItemName(ItemID).."] you must wait "..(IGS_V - os.time()).." second(s) since it's in a global cooldown.")
			UseItemFailed(Player)
			return
		end
		IGS_V = os.time() + Cooldown
	else
		IGS_V = IGS_V or {}
		IGS_V[Name] = IGS_V[Name] or 0
		if (IGS_V[Name] - os.time()) > 0 then
			PopupNotice(Player, "In order to use ["..GetItemName(ItemID).."] you must wait "..(IGS_V[Name] - os.time()).." second(s) since it's in a global cooldown.")
			UseItemFailed(Player)
			return
		end
		IGS_V[Name] = os.time() + Cooldown
	end
	
	local Points = {

		[9433] = 10,	
		[9434] = 50,    
		[9435] = 100,   
		[9436] = 200,   
		[9437] = 250  
		}      	
--GetIMP(role)
	local Amount = Points[ItemID]
	local total = Amount + crystalifo
	GiveIMP(Player,Amount)
	PopupNotice(Player, "You just used ["..GetItemName(ItemID).."]  and Gained ["..Amount.."]point(s) to spend in [Ingame-Mall], enjoy!")
	LG("Imps System", " Player:["..GetChaDefaultName(Player).."], Used:["..GetItemName(ItemID).."], Total IMPS now is: Amount:["..Amount.."] + Current Amount:["..crystalifo.."]= Total["..total.."]")
	
end



function ReturnItems(index)
	local str = ""
	for i = 1 , table.getn(index) , 1 do
		str = str..tostring(index[i]) 
		if i < table.getn(index) then
			str = str..","
		end
	end
	return str
end



function EditStockItemMall(ID,Colum,NewValue)
	local FileContentIGs = {}
    local FileRead = assert(io.open(GetResPath('ItemMallShop.txt'),'r'))
    
    for line in FileRead:lines() do
        
		local column = split(line, '\t')
		local iD = column[1]
		local itemName = column[2]
		local description = column[3]
		local price = column[4]
		local hot = column[5]
		local items = Spliter(column[6], ",")
		local quantity = Spliter(column[7], ",")
		local duration = column[8]
		local stock = column[9]
		
		table.insert (FileContentIGs, {iD,itemName,description,price,hot,items,quantity,duration,stock})
	end
    io.close(FileRead)
	
	FileContentIGs[ID+1][Colum] = NewValue
	
	FileWrite = assert(io.open(GetResPath('ItemMallShop.txt'),'w'))
	for index, value in ipairs(FileContentIGs) do
       
		local str = ""..tostring(value[1]).."\t"..tostring(value[2]).."\t"..tostring(value[3]).."\t"..tostring(value[4]).."\t"..tostring(value[5]).."\t"..ReturnItems(value[6]).."\t"..ReturnItems(value[7]).."\t"..tostring(value[8]).."\t"..tostring(value[9]).."\n"
		FileWrite:write(str)
		
    
	end
    io.close(FileWrite)
	
end



function EditStockItemRep(ID,Colum,NewValue)
	local FileContentRep = {}
    local FileRead = assert(io.open(GetResPath('ItemRepuShop.txt'),'r'))
    
    for line in FileRead:lines() do
        
		local column = split(line, '\t')
		local iD = column[1]
		local itemName = column[2]
		local description = column[3]
		local price = column[4]
		local hot = column[5]
		local items = Spliter(column[6], ",")
		local quantity = Spliter(column[7], ",")
		local duration = column[8]
		local stock = column[9]
		
		table.insert (FileContentRep, {iD,itemName,description,price,hot,items,quantity,duration,stock})
	end
    io.close(FileRead)
	
	FileContentRep[ID+1][Colum] = NewValue
	
	FileWrite = assert(io.open(GetResPath('ItemRepuShop.txt'),'w'))
	for index, value in ipairs(FileContentRep) do
       
		local str = ""..tostring(value[1]).."\t"..tostring(value[2]).."\t"..tostring(value[3]).."\t"..tostring(value[4]).."\t"..tostring(value[5]).."\t"..ReturnItems(value[6]).."\t"..ReturnItems(value[7]).."\t"..tostring(value[8]).."\t"..tostring(value[9]).."\n"
		FileWrite:write(str)
		
    
	end
    io.close(FileWrite)
end



function CanBuyRemainItemIGS(ID)
	local Duration
	if ItemMallInfo[ID].Duration == -1 then
		Duration = -1
	else
		local RemainTime = ItemMallInfo[ID].Duration - os.time()
		if RemainTime > 0 then
			Duration = RemainTime
		elseif RemainTime < 0 then
			Duration = 0
		end
	end	
	if Duration == -1 or Duration > 0 then
		return true
	else
		return false
	end
end

function CanBuyLimitedItemIGS(ID)
	if ItemMallInfo[ID].Stock == -1 then
		return true
	else
		if ItemMallInfo[ID].Stock > 0 then
			return true
		else
			return false
		end
	end
end

function CanBuyRemainItemRep(ID)
	local Duration
	if ItemRepInfo[ID].Duration == -1 then
		Duration = -1
	else
		local RemainTime = ItemRepInfo[ID].Duration - os.time()
		if RemainTime > 0 then
			Duration = RemainTime
		elseif RemainTime < 0 then
			Duration = 0
		end
	end	
	if Duration == -1 or Duration > 0 then
		return true
	else
		return false
	end
end

function CanBuyLimitedItemRep(ID)
	if ItemRepInfo[ID].Stock == -1 then
		return true
	else
		if ItemRepInfo[ID].Stock > 0 then
			return true
		else
			return false
		end
	end
end

function UpdateShopRep()
	LoadShopIGS()
	SetItemMall()
	UpdateIGS()
end

function UpdateRepShop()
	LoadShopRep()
	SetItemRep()
	UpdateRPS()
end