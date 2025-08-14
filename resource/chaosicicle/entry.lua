--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口
    local EntryName = "Chaos Icicle"
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("Announcement: According to reports, in Icicle Mirage at ["..posx..","..posy.."] appears a portal to Chaos Icicle. Please check it out.") --通知本组服务器的所有玩家

end

function after_destroy_entry_binglang2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to reports, portal to [Chaos Icicle] has vanished. Check announcement for more details. Enjoy!") 

end

function after_player_login_binglang2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    ChaNotice(player_name, "Announcement: According to reports, in Icicle Mirage at ["..posx..","..posy.."] appears a portal to Chaos Icicle. Please check it out.") --通知本组服务器的所有玩家

end









--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_chaosicicle( role, copy_mgr )
	local FightingBook_Num = 0
	FightingBook_Num = CheckBagItem( role,3849 )
	local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "Cannot Enter in Party to Chaos Icicle" )
		return 0
		
	end
	if FightingBook_Num <= 0 then
		SystemNotice ( role , "Does not possess Medal of Valor. Unable to pass through Portal to Chaos Icicle" )
		return 0
	elseif FightingBook_Num > 1 then
		LG("RYZ_PK","Does not possess Medal of Valor. Unable to pass through Portal to Chaos Icicle")
		return 0
	end
	local role_RY = GetChaItem2 ( role , 2 , 3849 )
	local HonorPoint = GetItemAttr ( role_RY , ITEMATTR_VAL_STR)

	if HonorPoint < 5 then
		SystemNotice ( role , "You need 25 Honor Points to enter Chaos Icicle" )
		return 0
	end

	if HonorPoint >30000 then
		SystemNotice ( role , "Too much Honor Points unable to participate" )
		return 0
	end

	local Credit_chaosicicle = GetCredit(role)
	 if Credit_chaosicicle < 5 then 
		SystemNotice ( role , "You need 50 Reputation to enter Chaos Icicle" )
		return 0
	--else
--		DelCredit(role,30)
	end

	if Lv(role) < 65 then
	SystemNotice(role, "Only players Lv 65 and above may enter Chaos Icicle")
		return 0    
	end
	local Has_money = check_HasMoney(role)
	if Has_money == 1 then
		
		return 1
		
	else
		SystemNotice(role,"You dont have enough money...")
		return 0
	end
				
end

function check_HasMoney(role)
	local lv= GetChaAttr(role, ATTR_LV)
	local Money_Need = lv*50
	local Money_Have = GetChaAttr ( role , ATTR_GD )
		if Money_Have >= Money_Need then
			return 1
		end

end


function begin_enter_chaosicicle(role, copy_mgr) 
	local	Money_Have = GetChaAttr ( role , ATTR_GD )
	local lv= GetChaAttr(role, ATTR_LV)
	local Money_Need = lv*50
	local	Money_Now = Money_Have - Money_Need
	SetChaAttrI( role , ATTR_GD , Money_Now )
	DelCredit(role,30)
		SystemNotice(role,"Enters [Chaos Icicle] Cost "..Money_Need..", will be deducted 30 reputation points.") 
		MoveCity(role, "Chaos Icicle")
Money_all = Money_all + Money_Need * 0.8
end








