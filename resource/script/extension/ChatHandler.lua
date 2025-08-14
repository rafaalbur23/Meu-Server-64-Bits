print("* Loading <HandleChat> init.lua" )

cmd = {};
cmd.symbol = '/'
cmd.GM 	   = '&'
cmd.list = {};

TPCOST = 2000










cmd.list['online'] = function(role, param)
	if GetGmLv(role) == 0 then
		BickerNotice(role, 'This command is not available.')
		return;
	end
	if param.n ~= 0 then
		BickerNotice(role, 'This command requires zero parameters! /online')
		return;
	end
	SystemNotice(role, 'Players Online: '..GetOnlineCount());
	return;
end

cmd.list['telearg'] = function(role, param)

    if param.n ~= 0 then
        BickerNotice(role, 'This command requires zero parameters! /online')
        return;
    end
    
    local hp = Hp(role)
    local mxhp = Mxhp(role)
    local sp = Sp(role)
    local mxsp = Mxsp(role)
    if sp < mxsp or hp < mxhp then 
        SystemNotice(role, "Please maintain full HP and SP")
        return
    end 
    
    local PlayerMoney = GetChaAttr(role, ATTR_GD)
    if PlayerMoney >= TPCOST then
        PlayerMoney = PlayerMoney - TPCOST
        SetCharaAttr(PlayerMoney, role, ATTR_GD)
        ALLExAttrSet(role)
        SystemNotice(role, "You have spent " .. TPCOST .. " gold for this teleport.")
        MoveCity(role, "Argent City")
    else
        SystemNotice(role, "Insufficient gold. Unable to Teleport")
    end
    
    return;
end


cmd.list['teleshai'] = function(role, param)

    if param.n ~= 0 then
        BickerNotice(role, 'This command requires zero parameters! /online')
        return;
    end
    
    local hp = Hp(role)
    local mxhp = Mxhp(role)
    local sp = Sp(role)
    local mxsp = Mxsp(role)
    if sp < mxsp or hp < mxhp then 
        SystemNotice(role, "Please maintain full HP and SP")
        return
    end 
    
    local PlayerMoney = GetChaAttr(role, ATTR_GD)
    if PlayerMoney >= TPCOST then
        PlayerMoney = PlayerMoney - TPCOST
        SetCharaAttr(PlayerMoney, role, ATTR_GD)
        ALLExAttrSet(role)
        SystemNotice(role, "You have spent " .. TPCOST .. " gold for this teleport.")
        MoveCity(role, "Shaitan City")
    else
        SystemNotice(role, "Insufficient gold. Unable to Teleport")
    end
    
    return;
end

cmd.list['teleici'] = function(role, param)

    if param.n ~= 0 then
        BickerNotice(role, 'This command requires zero parameters! /online')
        return;
    end
    
    local hp = Hp(role)
    local mxhp = Mxhp(role)
    local sp = Sp(role)
    local mxsp = Mxsp(role)
    if sp < mxsp or hp < mxhp then 
        SystemNotice(role, "Please maintain full HP and SP")
        return
    end 
    
    local PlayerMoney = GetChaAttr(role, ATTR_GD)
    if PlayerMoney >= TPCOST then
        PlayerMoney = PlayerMoney - TPCOST
        SetCharaAttr(PlayerMoney, role, ATTR_GD)
        ALLExAttrSet(role)
        SystemNotice(role, "You have spent " .. TPCOST .. " gold for this teleport.")
        MoveCity(role, "Icicle Castle")
    else
        SystemNotice(role, "Insufficient gold. Unable to Teleport")
    end
    
    return;
end


cmd.list['teledream'] = function(role, param)

	if param.n ~= 0 then
		BickerNotice(role, 'This command requires zero parameters! /online')
		return;
	end
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Please maintain full HP and SP")
		return
	end 
	local PlayerMoney = GetChaAttr ( role , ATTR_GD )
	if PlayerMoney >= TPCOST then
		PlayerMoney = PlayerMoney - TPCOST
		SetCharaAttr ( PlayerMoney , role , ATTR_GD )
		ALLExAttrSet( role )
		MoveCity ( role, "Dream City")
	else
		SystemNotice( role , "Insufficient gold. Unable to Teleport")
	end
	
	return;
end

cmd.list['date'] = function(role, param)
	if param.n ~= 0 then
		BickerNotice(role, 'This command requires zero parameters! /date')
		return;
	end
	SystemNotice(role, 'Server Date: '..os.date('%b')..'. '..os.date('%d')..', 20'..os.date('%y'))
end
cmd.list['time'] = function(role, param)
	if param.n ~= 0 then
		BickerNotice(role, 'This command requires zero parameters! /time')
		return;
	end
	SystemNotice(role, 'Server Time: '..os.date('%H')..':'..os.date('%M')..':'..os.date('%S'))
end

cmd.list['?'] = cmd.list['help'];
cmd.list['help'] = function(role, param)
	if param.n ~= 0 then
		BickerNotice(role, 'This command requires zero parameters! /help')
		return;
	end
	local a = ''
	for i,v in pairs(cmd.list) do
		a = a..'    > '..i..'_'
	end
	HelpInfoX(role, 0, 'List of Commands: _'..a)
	return;
end
cmd.list['bank'] = function(role, param)
	local r = 0
	r = IsChaInRegion(role, 2)
	if r ~= 1 then
		BickerNotice(role,'Cannot access bank on battle zone!')
		return;
	end
	OpenBank(role, role);
end
cmd.list['checkmap'] = function(role, param)
	map_timing_notice(role, param[1]);
end




BthGmList		= {};
BthGmList[1]	= {ID = 1, Mac = "70-85-C2-43-EF-CB-00-00"} --Eviles
BthGmList[2]	= {ID = 3, Mac = "0C-9D-92-8E-AF-61-00-00"} --Lucas
BthGmList[3]	= {ID = 10, Mac = "98-83-89-6D-9B-33-00-00"} --Nelore


function HandleChat(role, message)
	local ChaName	= GetChaDefaultName(TurnToCha(role))
	local ChaID		= GetPlayerID(GetChaPlayer(role))
	local isMsg 	= 0
	
	-------------------
	--GM Hack Attempt--
	-------------------
	-- if string.find(message, cmd.GM) == 1 then
		-- for k = 1, table.getn(BthGmList) do
			-- if ChaID == BthGmList[k].ID then
				-- local Mac = GetChaMacAddress(role)
				-- if Mac == BthGmList[k].Mac then
					-- return 1
				-- end
			-- end
		-- end
		-- BTHLG("Hack_Attempt", ""..ChaID.."\t"..ChaName.."\t "..message.."")
		-- SetGmLv(role, 0)
		-- KickCha(role)
		-- return 0
	-- end	

	
	----------------------------------
	----Auto Question & Answer Event--
	----------------------------------
	--local u,i = string.gsub(message,"","")
	--if i > 0 then
	--	if(file_exists(AutoQA.Logs..""..ChaID..".txt") == true) then
	--		local getCorrect = table.load(AutoQA.Logs..""..ChaID..".txt","r")
	--		if(u == getCorrect[1]) then
	--			AutoQA_Confirm(role)
	--			AutoQA_Correct(role)
	--			SystemNotice(role,"Correct")
	--			local GoldGive	= 2500
	--			local CredGive	= 3
	--			local gRandom	= Percentage_Random(0.5)
	--			if gRandom == 1 then
	--				Notice("Congratulation! "..ChaName.." just winning "..GoldGive.."G Gold from Q and A Event.")
	--				GiveGold(role,GoldGive)
	--			else
	--				Notice("Congratulation! "..ChaName.." just winning "..CredGive.." Credits from Q and A Event.")
	--				UpdatePlayerCredit(role,CredGive)
	--			end
	--			return 0
	--		else
	--			AutoQA_Confirm(role)
	--			SystemNotice(role,"Incorrect!")
	--			return 0
	--		end
	--	end
	--end
	
	if string.find(message, cmd.symbol) == 1 then
		local t = string.lower(string.sub(message, 2))
		if t == '' then
			BickerNotice(role, 'Enter a command after the dash: /')
			return 0;
		end
		local param = {n = 0}
		local r = string.find(t, ' ')
		if r == nil then
			t = string.sub(message, 2)
		else
			t = string.sub(message, 2, r)
			local arg = string.sub(message, r + 2)
			param = explode(',', arg)
			param.n = table.getn(param)
		end
		if cmd.list[t] ~= nil then
			local NocLock =	KitbagLock(role, 0)
			if(NocLock ~= LUA_FALSE)then
				cmd.list[t](role, param)
				return 0;
			else
				BickerNotice(role, 'Unlock inventory before inputting a command!')
				return 0;
			end
		else
			BickerNotice(role, 'Entered an invalid command!')
			return 0;
		end
		return 0;
	end
	return 1;
end

function explode(separator, str)
	local pos, arr = 0, {}
	for st, sp in function() return string.find(str, separator, pos, true) end do
		table.insert(arr, string.sub(str, pos, st-1))
		pos = sp + 1
	end
	table.insert(arr, string.sub(str, pos))
	return arr
end