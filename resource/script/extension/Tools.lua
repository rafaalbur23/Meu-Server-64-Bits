print("* Loading <Tools> init.lua" )

function SendArenaPoint(cha, point)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		GiveArenaPoint(cha, point)
	end
end
function HelpInfoX(role, npc, text)
	local npcdata = -1
	if npc ~= nil and type(npc) == 'userdata' then
		npcdata = GetCharID(npc)
	end
	local packet = GetPacket()
	WriteCmd(packet, CMD_MC_TALKPAGE)
	WriteDword(packet, npcdata)
	WriteByte(packet, -1)
	WriteString(packet, text)
	SendPacket(role, packet)
end
function DeForgeEquip(cha, slot, socket)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local Slot = GetChaItem(cha, 2, slot - 1)
		if Slot ~= nil then
			local ItemID	= GetItemID(Slot)
			local ItemName	= GetItemName(ItemID)
			local ItemType	= GetItemType(Slot)
			local Param		= GetItemForgeParam(Slot, 1)
			if ItemType < 28 then
				if socket > 0 and socket < 4 then
					if socket == 1 then
						Param = TansferNum(Param)
						local StoneID,StoneLv = GetNum_Part2(Param),GetNum_Part3(Param)
						if StoneID == 0 and StoneLv == 0 then
							BickerNotice(cha, 'No gem detected on 1st socket!')
							return
						else
							local FreeSlot = GetChaFreeBagGridNum(cha)
							local SlotNeed = StoneLv * 2
							if FreeSlot < SlotNeed then
								BickerNotice(cha, 'Required '..SlotNeed..' Free Inventory Space!')
								return
							end
							for i = 1, StoneLv do
								GiveItem(cha, cha, SPKO.StoneInfo[StoneID].StoneItemID, 1, SPKO.GemLv[i])
								GiveItem(cha, cha, 885, 1, SPKO.GemLv[i])
							end
							Sockets = GetNum_Part1(Param)
							Param = SetNum_Part1(Param, Sockets)
							Param = SetNum_Part2(Param, 0)
							Param = SetNum_Part3(Param, 0)
							SetItemForgeParam(Slot, 1, Param)
							BickerNotice(cha, 'Successfully removed Lv1 - '..StoneLv..' of '..SPKO.StoneInfo[StoneID].StoneName..' from ['..ItemName..']!')
							RefreshCha(cha)
						end
	
					elseif socket == 2 then
						Param = TansferNum(Param)
						local StoneID,StoneLv = GetNum_Part4(Param),GetNum_Part5(Param)
						if StoneID == 0 and StoneLv == 0 then
							BickerNotice(cha, 'No gem detected on 2nd socket!')
							return
						else
							local FreeSlot = GetChaFreeBagGridNum(cha)
							local SlotNeed = StoneLv * 2
							if FreeSlot < SlotNeed then
								BickerNotice(cha, 'Required '..SlotNeed..' Free Inventory Space!')
								return
							end
							for i = 1, StoneLv do
								GiveItem(cha, cha, SPKO.StoneInfo[StoneID].StoneItemID, 1, SPKO.GemLv[i])
								GiveItem(cha, cha, 885, 1, SPKO.GemLv[i])
							end
							Sockets = GetNum_Part1(Param)
							Param = SetNum_Part1(Param, Sockets)
							Param = SetNum_Part4(Param, 0)
							Param = SetNum_Part5(Param, 0)
							SetItemForgeParam(Slot, 1, Param)
							BickerNotice(cha, 'Successfully removed Lv1 - '..StoneLv..' of '..SPKO.StoneInfo[StoneID].StoneName..' from ['..ItemName..']!')
							RefreshCha(cha)
						end
	
					elseif socket == 3 then
						Param = TansferNum(Param)
						local StoneID,StoneLv = GetNum_Part6(Param),GetNum_Part7(Param)
						if StoneID == 0 and StoneLv == 0 then
							BickerNotice(cha, 'No gem detected on 2nd socket!')
							return
						else
							local FreeSlot = GetChaFreeBagGridNum(cha)
							local SlotNeed = StoneLv * 2
							if FreeSlot < SlotNeed then
								BickerNotice(cha, 'Required '..SlotNeed..' Free Inventory Space!')
								return
							end
							for i = 1, StoneLv do
								GiveItem(cha, cha, SPKO.StoneInfo[StoneID].StoneItemID, 1, SPKO.GemLv[i])
								GiveItem(cha, cha, 885, 1, SPKO.GemLv[i])
							end
							Sockets = GetNum_Part1(Param)
							Param = SetNum_Part1(Param, Sockets)
							Param = SetNum_Part6(Param, 0)
							Param = SetNum_Part7(Param, 0)
							SetItemForgeParam(Slot, 1, Param)
							BickerNotice(cha, 'Successfully removed Lv1 - '..StoneLv..' of '..SPKO.StoneInfo[StoneID].StoneName..' from ['..ItemName..']!')
							RefreshCha(cha)
						end
					end
				else
					BickerNotice(cha, 'Socket values must be between: 1 - 3!')
					return
				end
			else
				BickerNotice(cha, '['..ItemName..'] on slot '..slot..' isnt a valid equipment!')
				return
			end
		else
			BickerNotice(cha, 'No item detected on slot '..slot..'!')
			return
		end
	else
		BickerNotice(cha, 'Character error!')
		return
	end
end

function ApparelUpgrade(cha, bagslot, lv)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then	
		local Slot		= GetChaItem(cha,2,bagslot - 1)
		local Apparel 	= GetItemID (Slot)
		local IsApparel = GetItemAttr ( Slot , ITEMATTR_VAL_FUSIONID )
		local Type		= GetItemType2(GetItemID(Slot))
		if Slot == nil then
			BickerNotice(cha,"Nothing inserted at slot ["..bagslot.."] of ["..GetChaDefaultName(cha).."].")
			return
		end
		if lv < 10 or lv > 60 then
			BickerNotice(cha,"Maximum upgrading is from 10 to 60.")
			return
		end
		if Type > 83 then
			BickerNotice(cha,"Item inserted at slot ["..bagslot.."] of ["..GetChaDefaultName(cha).."] is not an apparel equipment.")
			return
		end
		if Apparel < 100 or Apparel > 20000 then
			BickerNotice(cha,"Item inserted at slot ["..bagslot.."] of ["..GetChaDefaultName(cha).."] is not an apparel equipment.")
			return
		end
		SetItemAttr(Slot, ITEMATTR_VAL_LEVEL, lv)
		RefreshCha(cha)
		BickerNotice(cha,"Succesfully Upgrade Equipment at slot ["..bagslot.."].")
	end
end

function CreateEquip(cha,item_id,Gem1,Lv1,Gem2,Lv2,Gem3,Lv3)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
    	local r1,r2 = MakeItem(cha,item_id,1,18)
    	local Equip = GetChaItem(cha,2,r2)
		local param = GetItemForgeParam(Equip, 1)
		local Item_Stone = { }
		local Item_StoneLv = { }
		if Gem1 ~= nil then
			param = TansferNum(param)
			Item_Stone[0] 	= GetNum_Part2(param)
			Item_StoneLv[0] = GetNum_Part3(param)
			Item_Stone[0] 	= Gem1 		-- Gem ID
			Item_StoneLv[0] = Lv1 		-- Gem Lv
			param = SetNum_Part2(param, Item_Stone[0])
			param = SetNum_Part3(param, Item_StoneLv[0])
			SetItemForgeParam(Equip, 1, param)
		end
		if Gem2 ~= nil then
			param 		= TansferNum(param)
			Item_Stone[1] 	= GetNum_Part2(param)
			Item_StoneLv[1] = GetNum_Part3(param)
			Item_Stone[1] 	= Gem2 		-- Gem ID
			Item_StoneLv[1] = Lv2 		-- Gem Lv
			param = SetNum_Part4(param, Item_Stone[1])
			param = SetNum_Part5(param, Item_StoneLv[1])
			SetItemForgeParam(Equip, 1, param)
		end
		if Gem3 ~= nil then
			param 		= TansferNum(param)
			Item_Stone[2] 	= GetNum_Part2(param)
			Item_StoneLv[2] = GetNum_Part3(param)
			Item_Stone[2] 	= Gem3 		-- Gem ID
			Item_StoneLv[2] = Lv3 		-- Gem Lv
			param = SetNum_Part6(param, Item_Stone[2]) 
			param = SetNum_Part7(param, Item_StoneLv[2])
			SetItemForgeParam(Equip, 1, param)
		end
		local Socket = GetItemForgeParam(Equip, 1)
		Socket = TansferNum(Socket)
		Socket = SetNum_Part1(Socket, 3)
		SetItemForgeParam(Equip, 1, Socket)
		RefreshCha(cha)
	end
end

function ForgeEquip(cha,slot,Gem1,Lv1,Gem2,Lv2,Gem3,Lv3)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
    	local Equip = GetChaItem(cha,2,slot - 1)
		local param = GetItemForgeParam(Equip, 1)
		local Item_Stone   = { }
		local Item_StoneLv = { }
		if Gem1 ~= nil then
			param = TansferNum(param)
			Item_Stone[0] 	= GetNum_Part2(param)
			Item_StoneLv[0] = GetNum_Part3(param)
			Item_Stone[0] 	= Gem1 		-- Gem ID
			Item_StoneLv[0] = Lv1 		-- Gem Lv
			param = SetNum_Part2(param, Item_Stone[0])
			param = SetNum_Part3(param, Item_StoneLv[0])
			SetItemForgeParam(Equip, 1, param)
		end
		if Gem2 ~= nil then
			param 		= TansferNum(param)
			Item_Stone[1] 	= GetNum_Part2(param)
			Item_StoneLv[1] = GetNum_Part3(param)
			Item_Stone[1] 	= Gem2 		-- Gem ID
			Item_StoneLv[1] = Lv2 		-- Gem Lv
			param = SetNum_Part4(param, Item_Stone[1])
			param = SetNum_Part5(param, Item_StoneLv[1])
			SetItemForgeParam(Equip, 1, param)
		end
		if Gem3 ~= nil then
			param 		= TansferNum(param)
			Item_Stone[2] 	= GetNum_Part2(param)
			Item_StoneLv[2] = GetNum_Part3(param)
			Item_Stone[2] 	= Gem3 		-- Gem ID
			Item_StoneLv[2] = Lv3 		-- Gem Lv
			param = SetNum_Part6(param, Item_Stone[2]) 
			param = SetNum_Part7(param, Item_StoneLv[2])
			SetItemForgeParam(Equip, 1, param)
		end
		local Socket = GetItemForgeParam(Equip, 1)
		Socket = TansferNum(Socket)
		Socket = SetNum_Part1(Socket, 3)
		SetItemForgeParam(Equip, 1, Socket)
		RefreshCha(cha)
	end
end

function SendMoney(cha,amount)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local Money_Have = GetChaAttr (cha , ATTR_GD)
		if (Money_Have + amount) > 2000000000 then
			SystemNotice(cha,"Cant add more money !")
			return
		end
		AddMoney(cha, 0 , amount )
	end
end

function DelMoney(cha,amount)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local Money_Have = GetChaAttr(cha , ATTR_GD )
		if (Money_Have - amount) <= 0 then
			SystemNotice(cha,"Cant take more money !")
			return
		end
		TakeMoney(cha , 0 , amount )
	end
end

function SendToPrison(cha)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local chaname = GetChaDefaultName(cha)
		MoveCity(cha,"Island Prison")
		SystemNotice(cha,"Good Night, stay here for Unknown hours !")
	end
end

function CheckInventory(cha1,cha2)
	if(type(cha1) ~= 'userdata' and type(cha2) ~= 'userdata') then
		cha1 = PKOPLAYER(cha1)
		cha2 = PKOPLAYER(cha2)
	end
	if(cha1 ~= nil and cha2 ~= nil)then
		local cha2name	= GetChaDefaultName(cha2)
		local ItemName	= {}
		local ItemNum	= {}
		for k = 0,47,1 do
			ItemName[k]	= GetItemName(GetItemID (GetChaItem (cha2, 2, k)))
			ItemNum[k]	= CheckBagItem(cha2,GetItemID (GetChaItem (cha2, 2, k)))
			SystemNotice(cha1,""..ItemName[k]..": "..ItemNum[k].."")
		end
	end
end

function RevivePlayer(cha)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local ChaName = GetChaDefaultName(cha)
		SetRelive(cha, cha,  10, "Player"..ChaName.."\n\n wish to revive you. Accept?")
	end
end

function KillPlayer(cha_id)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		Hp_Endure_Dmg (cha,10000000)
		RefreshCha(cha)
	end
end

function GivePet(cha,pet_id,attribute,lv)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local r1 = 0
		local r2 = 0
		local r1,r2 = MakeItem(cha , pet_id , 1 , 4 )
		local Item_newJL = GetChaItem(cha , 2 , r2 )
		if (attribute == "str") then
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
			SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
		elseif (attribute == "agi") then
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
			SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
		elseif (attribute == "acc") then
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
			SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
		elseif (attribute == "con") then
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
			SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
		elseif (attribute == "spr") then
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , lv )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
			SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
			SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
		else
			SystemNotice(cha,"Attribute failed !")
		end
		RefreshCha(cha)
	end
end

function GiveMixPet(cha,pet_id,str,strlv,agi,agilv,acc,acclv,con,conlv,spr,sprlv)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local r1 = 0
		local r2 = 0
		local r1,r2 = MakeItem(cha , pet_id , 1 , 4 )
		local Item_newJL = GetChaItem(cha , 2 , r2 )
		if (str ~= nil) then
			if (str == 26) then
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , strlv )
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , strlv )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
				SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
				SystemNotice(cha,"Pet created Lv"..strlv.." strenght  !")
			else
				SystemNotice(cha,"STR Attribute number Unknown !")
			end
		end
		if (agi ~= nil) then
			if (agi == 27) then
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , agilv )
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , agilv )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
				SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
				SystemNotice(cha,"Pet created Lv"..agilv.." Agility  !")
			else
				SystemNotice(cha,"AGI Attribute number Unknown !")
			end
		end
		if (acc ~= nil) then
			if (acc == 28) then
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , acclv )
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , acclv )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
				SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
				SystemNotice(cha,"Pet created Lv"..acclv.." Accuracy  !")
			else
				SystemNotice(cha,"ACC Attribute number Unknown !")
			end
		end
		if (con ~= nil) then
			if (con == 29) then
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , conlv )
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , conlv )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
				SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
				SystemNotice(cha,"Pet created Lv"..conlv.." Constitution  !")
			else
				SystemNotice(cha,"CON Attribute number Unknown !")
			end
		end
		if (spr ~= nil) then
			if (spr == 30) then
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , sprlv )
				SetItemAttr ( Item_newJL , ITEMATTR_VAL_LV , sprlv )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_URE , 32000 )
				SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , 6480 )
				SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , 6480 )
				SystemNotice(cha,"Pet created Lv"..sprlv.." Spirit  !")
			else
				SystemNotice(cha,"SPR Attribute number Unknown !")
			end
		end
		RefreshCha(cha)
	end
end

function SendGift(cha,item_id,amount,quality)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		GiveItem(cha,0,item_id,amount,quality)
	end
end

function TakeGift(cha1,cha2,item_id,amount)
	if(type(cha1) ~= 'userdata' and type(cha2) ~= 'userdata') then
		cha1 = PKOPLAYER(cha1)
		cha2 = PKOPLAYER(cha2)
	end
	if(cha1 ~= nil and cha2 ~= nil)then
		local CheckHasItem = CheckBagItem(cha2, item_id)
		if(CheckHasItem < amount)then
			SystemNotice(cha1,"Item amount too large than player inventory !")
			return
		else
			TakeItem(cha2,0,item_id,amount)
			SystemNotice(cha1,"Succesfully deleted item !")
		end
		RefreshCha(cha2)
	end
end

function Immortal(cha)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		AddState(cha, cha, STATE_IMMORTAL, 1, 18000)
		RefreshCha(cha)
	end
end

function DelImmortal(cha)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		RemoveState(cha, STATE_IMMORTAL)
		RemoveState(cha, STATE_IMMORTAL2)
		RefreshCha(cha)
	end
end

function Tele(cha,map)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		MoveCity(cha,map)
	end
end

function SetPlayerRecord(cha,recid)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		SetRecord(cha,recid)
	end
end

function DelPlayerRecord(cha,recid)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		ClearRecord(cha,recid)
	end
end

function ClearPlayerMission(cha,recid)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		ClearMission(cha,recid)
	end
end

function SendReputation(cha,amount)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		GiveReputation(cha,amount)
	end
end

function UpdateLv(cha,Exp)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		AddExp(cha, cha, Exp, Exp)
		SystemNotice(cha,"Congratulations!")
		RefreshCha(cha)
	end
end

function LpoCheckTime(cha)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local now_month		= tonumber(os.date("%m"))
		local now_week		= tonumber(os.date("%w"))	--Day: 1 = Monday, 2 = Tuesday,...
		local now_date		= tonumber(os.date("%d"))	--Actual Date
		local now_hour		= tonumber(os.date("%H"))
		local now_minute	= tonumber(os.date("%M"))
		local now_second	= tonumber(os.date("%S"))
		SystemNotice(cha,now_month)
		SystemNotice(cha,now_week)
		SystemNotice(cha,now_date)
		SystemNotice(cha,now_hour)
		SystemNotice(cha,now_minute)
		SystemNotice(cha,now_second)
	end
end

--516(Clone)
--1505(Disconnected)
function SendPkt(cha,num)
	if(type(cha) ~= 'userdata')then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local pkt = GetPacket()
		WriteCmd(pkt,num)
		SendPacket(cha,pkt)
	end
end

function ChaEff(cha,eff)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		PlayEffect(cha,eff)
	end
end

function UnfuseApparel(cha,slot)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		local Apparel			= GetChaItem(cha,2,slot-1)
		local ApparelID			= GetItemID(Apparel)
		local GetOriginalItem	= GetItemAttr(Apparel,ITEMATTR_VAL_FUSIONID)
		if Apparel == nil then
			SystemNotice(cha,"You must put a fused equipment on your 1st Inventory Slot.")
			return
		end
		if ApparelID < 5000 or ApparelID > 10000 then
			SystemNotice(cha,"Failed !")
			SystemNotice(cha,"Unknown Apparel..are you sure this is an apparel?")
			return
		end
		if GetOriginalItem == 0 then
			SystemNotice(cha,"Failed !")
			SystemNotice(cha,"Your apparel is not fused with any equipment..")
			return
		end
		local ApparelGems = GetItemForgeParam(Apparel,1)
		local r1 = 0
		local r2 = 0
		r1,r2 = MakeItem(cha,GetOriginalItem,1,18)
		GiveItem(cha,0,ApparelID,1,4)
		local Remove = 0
		Remove = RemoveChaItem(cha,GetOriginalItem,2,2,0,2,1)
		if Remove == 0 then
			SystemNotice(cha,"Delete main item failed.")
			return
		end
		local OriginalItem = GetChaItem(cha,2,r2)   
		local TransferGems = SetItemForgeParam(OriginalItem,1,ApparelGems)
		if TransferGems == 0 then
			SystemNotice(cha,"Failed to set forging attribute settings.")
			return
		else
			SystemNotice(cha,"Apparel unfused successfuly!")
			RefreshCha(cha)
		end
	end
end

function LpoTransferGem(role)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
    	local ItemSlot1		= GetChaItem(cha,2,0)
    	local ItemSlot2		= GetChaItem(cha,2,1)
		local ItemSlot1ID	= GetItemID(ItemSlot1)
		local ItemSlot2ID	= GetItemID(ItemSlot2)
		local ItemSlot1_type = GetItemType (ItemSlot1)
		local ItemSlot2_type = GetItemType (ItemSlot2)
		if (ItemSlot1 == nil or ItemSlot2 == nil) then
        	SystemNotice(cha,"Follow Steps Below !")
        	SystemNotice(cha,"1st slot is Source Item")
        	SystemNotice(cha,"2nd slot is Destination Item")
        	return
    	end
		if (ItemSlot1_type ~= 1 and ItemSlot1_type ~= 2 and ItemSlot1_type ~= 3 and ItemSlot1_type ~= 4 and ItemSlot1_type ~= 7 and ItemSlot1_type ~= 9 and ItemSlot1_type ~= 11 and ItemSlot1_type ~= 20 and ItemSlot1_type ~= 27 and ItemSlot1_type ~= 22 and ItemSlot1_type ~= 23 and ItemSlot1_type ~= 24 and ItemSlot1_type ~= 25 and ItemSlot1_type ~= 26) then
        	SystemNotice(cha,"1st slot Inventory Isnt an Equipment/Weapon..!")
        	return
    	end
		if (ItemSlot2_type ~= 1 and ItemSlot2_type ~= 2 and ItemSlot2_type ~= 3 and ItemSlot2_type ~= 4 and ItemSlot2_type ~= 7 and ItemSlot2_type ~= 9 and ItemSlot2_type ~= 11 and ItemSlot2_type ~= 20 and ItemSlot2_type ~= 27 and ItemSlot2_type ~= 22 and ItemSlot2_type ~= 23 and ItemSlot2_type ~= 24 and ItemSlot2_type ~= 25 and ItemSlot2_type ~= 26) then
        	SystemNotice(cha,"2nd slot Inventory Isnt an Equipment/Weapon..!")
        	return
    	end
		if (ItemSlot1_type ~= ItemSlot2_type) then
        	SystemNotice(cha,"Item type on 1st slot and 2nd Slot Inventory Mismatch..!")
        	SystemNotice(cha,"Example: Sword with Sword or Glove with Glove")
        	return
		end
 
    	local ItemSlot1Gems = GetItemForgeParam(ItemSlot1,1)
    	local ItemSlot2Gems = GetItemForgeParam(ItemSlot2,1)
    	local AddGemsSlot1 = SetItemForgeParam(ItemSlot1,1,ItemSlot2Gems)
    	local AddGemsSlot2 = SetItemForgeParam(ItemSlot2,1,ItemSlot1Gems)
    	if AddGemsSlot1 == 0 or AddGemsSlot2 == 0 then
        	SystemNotice(cha,"Failed to set forging attribute settings.")
        	return
    	else
        	SystemNotice(cha,"Successfuly transfering your Gems !")
        	RefreshCha(cha)
    	end
	end
end

function GiveLifeSkill(cha)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		AddChaSkill(cha,201,10,1,0)	--Mining
		AddChaSkill(cha,200,10,1,0)	--Wood
		AddChaSkill(cha,231,10,1,0)	--Fishing
		AddChaSkill(cha,232,10,1,0)	--Salvage
		AddChaSkill(cha,241,3,1,0)	--Set stall
		AddChaSkill(cha,459,1,1,0)	--Fun Fishing
		RefreshCha(cha)
	end
end

function SendLifeExp(cha,num)
	if(type(cha) ~= 'userdata') then
		cha = PKOPLAYER(cha)
	end
	if(cha ~= nil)then
		AddExpAndType(cha, cha,2,num,num)
	end
end

function CleanInv(cha)
	if(type(cha) ~= 'userdata') then
		cha = GetPlayerByID(cha)
	end
	if(cha ~= nil)then
		local Inv = GetKbCap(cha)
		local Mark = {}
		for k = 0,Inv-1 do
			local Item = GetChaItem(cha,2,k)
			local ItemID = GetItemID(Item)
			local BagNum = CheckBagItem(cha, ItemID)
			if BagNum > 0 then
				DelBagItem(cha, ItemID, BagNum)
			end
		end
	else
		print("Character error!")
		return
	end
end

function RealPlayerStat(cha1,cha2)
	if(type(cha1) ~= 'userdata' and type(cha2) ~= 'userdata') then
		cha1 = GetPlayerByID(cha1)
		cha2 = GetPlayerByID(cha2)
	end
	if(cha1 ~= nil and cha2 ~= nil) then
		local mnatk 	= GetChaAttr(cha2,ATTR_MNATK)
		local mxatk 	= GetChaAttr(cha2,ATTR_MXATK)
		local hit 		= GetChaAttr(cha2,ATTR_HIT)
		local flee		= GetChaAttr(cha2,ATTR_FLEE)
		local def		= GetChaAttr(cha2,ATTR_DEF)
		local pdef		= GetChaAttr(cha2,ATTR_PDEF)
		local mspd		= GetChaAttr(cha2,ATTR_MSPD)
		local aspd		= GetChaAttr(cha2,ATTR_ASPD)
		HelpInfoX(cha1 ,0,"                 "..GetChaDefaultName(cha2).."_ Min Attack          "..mnatk.."_ Max Attack          "..mxatk.."_ Hit Rate            "..hit.."_ Dodge               "..flee.."_ Defense             "..def.."_ Resist              "..pdef.."_ Movement Speed      "..mspd.."_ Attack Speed      "..aspd.."")
	end
end