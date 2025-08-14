function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口
    local EntryName = "Argent Mirrage"
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("Announcement: According to reports, in Chaos Argent at ["..posx..","..posy.."] appears a portal to Argent Mirrage. Please check it out.") --通知本组服务器的所有玩家

end

function after_destroy_entry_garner3(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to reports, portal to [Argent Mirrage] has vanished. Check announcement for more details. Enjoy!") 

end

function after_player_login_garner3(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    ChaNotice(player_name, "Announcement: According to reports, in Chaos Argent at ["..posx..","..posy.."] appears a portal to Argent Mirrage. Please check it out.") --通知本组服务器的所有玩家

end

function check_can_enter_garner3( role, copy_mgr )
	local i = IsChaStall(role)
	if i == LUA_TRUE then
		SystemNotice(role, "Failed to Enter Argent Mirrage")
		return 0    
	end
	if Lv(role) < 70 then
		SystemNotice(role, "Only players Lv 70 and above may enter Argent Mirrage")
		return 0    
	end
	if Lv(role) > 151 then
		SystemNotice(role, "Only players Lv 150 and below may enter Argent Mirrage")
		return 0    
	end

	local Num
	Num = CheckBagItem(role,2324)
	if Num < 1 then
		SystemNotice(role, "Does not possess AM Pass. Unable to pass through Portal to Argent Mirrage")	
		return 0
	end

	local Credit_garner3 = GetCredit(role)
	if Credit_garner3 < 10 then
		SystemNotice(role, "You do not have sufficient Reputation points. Unable to enter Argent Mirrage")
		return 0
	else
		DelCredit(role,10)
		return 1
	end
end


function begin_enter_garner3(role, copy_mgr)

	local Cha = TurnToCha(role)	
	local Dbag = 0
	Dbag = DelBagItem(Cha, 2324, 20)
	
	if Dbag == 1 then
		SystemNotice(role,"Entering [Argent Mirrage]") 
		MoveCity(role, "Argent Mirrage")

	else
	
		SystemNotice(role, "Collection of AM Pass failed. Unable to enter Argent Mirage")
	end
end