--*-----------------------------------------*--
--* dir parent  : AdmiralCloak              *--
--* File name   : init.lua                  *--
--* Created by  : Eviles                    *--
--* Discord     : Eviles#2759               *--
--*-----------------------------------------*--
print("* Loading <AdmiralCloak> init.lua" )
--********************************************************************************************************************************--  
--##################################################Configurations################################################################--
--********************************************************************************************************************************--  
    Cloak                           = {}
        Cloak.Conf                  = {
            cloakId                 = 9205,
            dustyId                 = 9204,
            cloakSlot               = 5,
            maxLv                   = 10,
			statperLv				= 1
        }
        Cloak.race                  = {
            [1]                     = 240,
            [2]                     = 241,
            [3]                     = 242,
            [4]                     = 71,
        }
        Cloak.eff01                 = {
            [1]                     = 246,
            [2]                     = 249,
            [3]                     = 243,
            [4]                     = 252,
        }
        Cloak.eff02                 = {
            [1]                     = 247,
            [2]                     = 250,
            [3]                     = 244,
            [4]                     = 253,
        }  
        Cloak.eff03                 = {
            [1]                     = 248,
            [2]                     = 251,
            [3]                     = 245,
            [4]                     = 254,
        }  
        Cloak.upRate                = {}
        Cloak.upRate[0]             = 1
        Cloak.upRate[1]             = .9
        Cloak.upRate[2]             = .8
        Cloak.upRate[3]             = .7
        Cloak.upRate[4]             = .6
        Cloak.upRate[5]             = .5
        Cloak.upRate[6]             = .4
        Cloak.upRate[7]             = .3
        Cloak.upRate[8]             = .2
        Cloak.upRate[9]             = .2
        Cloak.upRate[10]            = .1
--********************************************************************************************************************************--
--##################################################Functions#####################################################################--
--********************************************************************************************************************************--
    function Cloak.HasCloak(Player)
        local slot                  = GetChaItem(Player, 2, (Cloak.Conf['cloakSlot'] -1))
        local slotId                = GetItemID(slot)
        if slotId == Cloak.Conf['cloakId'] then
            return 1
        end
        return 0
    end
    function Cloak.getLv(Cloak)
        local cloakLv               = GetItemAttr(Cloak, 55)
        if cloakLv == nil then
            return 0
        else
            return cloakLv
        end
    end
 	function Cloak.GetGem(item)
 		local chaCloak = {};
 		local param = GetItemForgeParam(item, 1)
		param = TansferNum(param)
		chaCloak[1] = GetNum_Part2(param)
		chaCloak[2] = GetNum_Part3(param)
		chaCloak[3] = GetNum_Part4(param)
		chaCloak[4] = GetNum_Part5(param)
		chaCloak[5] = GetNum_Part6(param)
		chaCloak[6] = GetNum_Part7(param)
		return chaCloak
 	end	
 	function Cloak.HasGem(item, GemId)
 		local gem = Cloak.GetGem(item)
 		if gem[1] == GemId or
 			gem[3] == GemId or
 				gem[5] == GemId then
 			return 1
 		end
 		return 0
 	end	
 	function Cloak.GetGemLv(item, stoneId)
 		local gem = Cloak.GetGem(item);
 		if gem[1] == stoneId then
 			return gem[2];
 		end
 		if gem[3] == stoneId then
 			return gem[4];
 		end
 		if gem[5] == stoneId then
 			return gem[6];
 		end
 	end	
   
    function ItemUse_PFFYJCQG(Player, Item)
        local Cha_Boat              = 0
        Cha_Boat                    = GetCtrlBoat(Player)
        if Cha_Boat ~= nil then
            SystemNotice(Player, 'Cannot use while sailing!')
            UseItemFailed(Player)
            return
        end
        local hasDusty              = CheckBagItem(Player, Cloak.Conf['dustyId'])
        if hasDusty < 1 then
            BickerNotice(Player, 'You need ['..GetItemName(Cloak.Conf['dustyId'])..'] in your inventory!')
            UseItemFailed(Player)
            return
        else
            TakeItem(Player, 0, Cloak.Conf['dustyId'], 1)
            GiveItem(Player, 0, Cloak.Conf['cloakId'], 1, 88)
            Notice(GetChaDefaultName(Player)..' succesfully unsealed a '..GetItemName(Cloak.Conf['dustyId'])..'!')
            PlayEffect(Player, 345)
        end
    end
   
 	function ItemUse_PFFYJCQ(role, Item)
 		local Cha_Boat = GetCtrlBoat ( role )
		if Cha_Boat ~=  nil then
			SystemNotice( role , "Cannot use while sailing" )
			UseItemFailed ( role )
			return
		end
 		local slot = GetChaItem(role, 2, (Cloak.Conf['cloakSlot'] - 1));
 		local slotId = GetItemID(slot);
 		local cloakLv = Cloak.getLv(slot);
 		local deviceId = GetItemID(Item);
 		if slotId ~= Cloak.Conf['cloakId'] then
			BickerNotice(role, 'Cannot use ['..GetItemName(deviceId)..'] on '..GetItemName(slotId)..'!');
			UseItemFailed(role);
			return
		end
		local cloakLv = Cloak.getLv(slot);
		if cloakLv >= Cloak.Conf['maxLv'] then
			BickerNotice(role, '['..GetItemName(slotId)..'] already maxed Upgrade!');
			UseItemFailed(role);
			return
		end

		local successRate = Percentage_Random(Cloak.upRate[cloakLv]);
		if successRate == 1 then
			local startAttr,endAttr = ITEMATTR_VAL_STR,ITEMATTR_VAL_STA;
			local itemAttr = {};
			local increment = 1;
			for i = startAttr,endAttr do
				itemAttr[i] = GetItemAttr(slot, i);
				SetItemAttr(slot, i, itemAttr[i] + Cloak.Conf['statperLv']);
			end
			SetItemAttr(slot, 55, cloakLv + 1);
			PlayEffect(role, 345);
		else
			SystemNotice(role , "Sorry, upgrade has failed! Luckily Cloak is not damaged...");
			PlayEffect(role, 346);
		end
	end
   
 function STATE_AC_Add(Player, StateLv)
        if (IsPlayer(Player) == 1) then
            local slot              = GetChaItem(Player, 2, (Cloak.Conf['cloakSlot'] -1))
            local cloakStr          = GetItemAttr(slot, ITEMATTR_VAL_STR)
            local cloakSta          = GetItemAttr(slot, ITEMATTR_VAL_STA)          
            local cloakAgi          = GetItemAttr(slot, ITEMATTR_VAL_AGI)          
            local cloakCon          = GetItemAttr(slot, ITEMATTR_VAL_CON)
            local cloakDex          = GetItemAttr(slot, ITEMATTR_VAL_DEX)
            local strVal            = 0
            local sprVal            = 0
            local agiVal            = 0
            local conVal            = 0
            local accVal            = 0
            if Cloak.HasCloak(Player) == 1 then
                strVal              = cloakStr
                sprVal              = cloakSta
                agiVal              = cloakAgi
                conVal              = cloakCon
                accVal              = cloakDex
            end
            SetCharaStatev(strVal, Player, ATTR_STATEV_STR, "STATE_CLOAK")
            SetCharaStatev(sprVal, Player, ATTR_STATEV_STA, "STATE_CLOAK")
            SetCharaStatev(agiVal, Player, ATTR_STATEV_AGI, "STATE_CLOAK")
            SetCharaStatev(conVal, Player, ATTR_STATEV_CON, "STATE_CLOAK")
            SetCharaStatev(accVal, Player, ATTR_STATEV_DEX, "STATE_CLOAK")  
			ALLExAttrSet(Player)  			
            RefreshCha(Player)        
        end
    end
   
    function STATE_AC_Rem(Player, StateLv)
        RemCharaStatev(0 , Player , ATTR_STATEV_STR, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_AGI, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_DEX, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_CON, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_STA, "STATE_CLOAK")
		ALLExAttrSet(Player) 
        RefreshCha(Player)    
    end
   
    function STATE_AC_Rem(Player, StateLv)
        RemCharaStatev(0 , Player , ATTR_STATEV_STR, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_AGI, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_DEX, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_CON, "STATE_CLOAK")
        RemCharaStatev(0 , Player , ATTR_STATEV_STA, "STATE_CLOAK")
		ALLExAttrSet(Player) 
        RefreshCha(Player)    
    end
   
    function PIO_Effect_Cloak(Player)
        local slot                  = GetChaItem(Player, 2, (Cloak.Conf['cloakSlot'] -1))
        local cloakLv               = Cloak.getLv(slot)
        local chaType               = GetChaTypeID(Player)
        local capeEff               = Cloak.race[chaType]
        local glow01                = Cloak.eff01[chaType]
        local glow02                = Cloak.eff02[chaType]
        local glow03                = Cloak.eff03[chaType]
        if Cloak.HasCloak(Player) == 1 then
            AddState(Player, Player, capeEff, 1, 3600)
        else
            if GetChaStateLv(Player, capeEff) > 0 then
                RemoveState(Player, capeEff)
            end
        end
        if Cloak.HasCloak(Player) == 1 and cloakLv < 5 then
            AddState(Player, Player, glow01, 1, 3600)
        else
            if GetChaStateLv(Player, glow01) > 0 then
                RemoveState(Player, glow01)
            end
        end
        if Cloak.HasCloak(Player) == 1 and cloakLv >= 5 and cloakLv <= 8 then
            AddState(Player, Player, glow02, 1, 3600)
        else
            if GetChaStateLv(Player, glow02) > 0 then
                RemoveState(Player, glow02)
            end
        end
        if Cloak.HasCloak(Player) == 1 and cloakLv >= 9 and cloakLv <= 10 then
            AddState(Player, Player, glow03, 1, 3600)
        else
            if GetChaStateLv(Player, glow03) > 0 then
                RemoveState(Player, glow03)
            end
        end     
    end
	
 	function Cloak.Skill(ATKER, DEFER, sklv)
 		if Cloak.HasCloak(ATKER) == 1 then
 			local cloakSlot = GetChaItem(ATKER, 2, (Cloak.Conf['cloakSlot'] - 1));
 			if Cloak.HasGem(cloakSlot, 66) == 1 then --Riven Soul Rune
				local Percentage = Percentage_Random(.99)
				if Percentage == 1 then
					local getStateLv = GetChaStateLv(DEFER, 227);
					if getStateLv == 0 then
		 				local gemLv = Cloak.GetGemLv(cloakSlot, 66);
		 				AddState(ATKER, DEFER, 227, gemLv, 3);
		 				local ret = gemLv * 5
		 				SystemNotice(ATKER, "Recieved bonus from Admiral Cloak. Target Physical Resistence reduce by "..ret.." for 3 sec")
		 			end
	 			end
 			end
 			if Cloak.HasGem(cloakSlot, 67) == 1 then --Piercing Rune
				local Percentage = Percentage_Random(.99)
				if Percentage == 1 then
					local getStateLv = GetChaStateLv(DEFER, 228);
					if getStateLv == 0 then
		 				local gemLv = Cloak.GetGemLv(cloakSlot, 67);
		 				AddState(ATKER, DEFER, 228, gemLv, 3);
		 				local ret = gemLv * 50
		 				SystemNotice(ATKER, "Recieved bonus from Admiral Cloak. Target Defence reduce by "..ret.." for 3 sec")
		 			end
	 			end
 			end
 			if Cloak.HasGem(cloakSlot, 68) == 1 then --Illusory Rune
 				local Percentage = Percentage_Random(.99)
				if Percentage == 1 then
					local getStateLv = GetChaStateLv(DEFER, 212);
					if getStateLv == 0 then
		 				local gemLv = Cloak.GetGemLv(cloakSlot, 68);
		 				AddState(ATKER, DEFER, 212, gemLv, 3);
		 				local ret = gemLv * 10
		 				SystemNotice(ATKER, "Recieved bonus from Admiral Cloak. Target Dodge reduce by "..ret.." for 3 sec")
		 			end
	 			end
 			end
 			if Cloak.HasGem(cloakSlot, 71) == 1 then --Curse Rune
 				local Percentage = Percentage_Random(.99)
				if Percentage == 1 then
					local getStateLv = GetChaStateLv(DEFER, 246);
					if getStateLv == 0 then
		 				local gemLv = Cloak.GetGemLv(cloakSlot, 71);
		 				AddState(ATKER, DEFER, 246, gemLv, 3);
		 				local ret = gemLv * 10
		 				SystemNotice(ATKER, "Recieved bonus from Admiral Cloak. Target Hitrate reduce by "..ret.." for 3 sec")
		 			end
	 			end
 			end
 		end
 	end	
	
function STATE_Riven_Add(role, statelv)
	local pdef_dif = 5 * statelv
	local pdef = ResistSb(role) - pdef_dif 
	SetCharaAttr( pdef , role , ATTR_STATEV_PDEF )
	ALLExAttrSet(role)  
end

function STATE_Riven_Rem(role, statelv)
	local pdef_dif = 5 * statelv
	local pdef = ResistSb(role) + pdef_dif 
	SetCharaAttr( pdef , role , ATTR_STATEV_PDEF )
	ALLExAttrSet(role)  
end

function STATE_Pierc_Add(role, statelv)
	local defsb_dif = 50 * statelv
	local defsb = DefSb(role) - defsb_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	ALLExAttrSet(role)
end

function STATE_Pierc_Rem(role, statelv)
	local defsb_dif = 50 * statelv
	local defsb = DefSb(role) + defsb_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	ALLExAttrSet(role)
end

function STATE_Illus_Add(role, statelv)
	local fleesb_dif = 10 * statelv
	local fleesb = FleeSb(role) - fleesb_dif 
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE )
	ALLExAttrSet(role)  
end

function STATE_Illus_Rem(role, statelv)
	local fleesb_dif = 10 * statelv
	local fleesb = FleeSb(role) + fleesb_dif 
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE )
	ALLExAttrSet(role)  
end

function STATE_Curse_Add(role, statelv)
	local hitsb_dif = 10 * statelv
	local hitsb = HitSb(role) - hitsb_dif
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role) 
end

function STATE_Curse_Rem(role, statelv)
	local hitsb_dif = 10 * statelv
	local hitsb = HitSb(role) + hitsb_dif
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role) 
end	