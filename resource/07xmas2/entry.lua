--This file, all functions may be executed many times, the function name must be prefixed with the map name, such as after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --Set the map entry the entity number (the number corresponds to characterinfo.txt index)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --Create a copy of the management object, this function has an explicit entry in the map must be called for implicit map entry (such as team challenge) without the interface to call

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --Take the entrance location map (map name and coordinates of the target map name)
    Notice("Announcement: Some players have discovered that in Christmas Village at ["..posx..","..posy.."] emerges a portal that leads to [Converse Christmas Village]. All players beware!") --Notify the server of all the players in this group
end

function after_destroy_entry_07xmas2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to reports, portal to [Converse Christmas Village] has vanished. Check announcement for more details. Enjoy!") 

end

function after_player_login_07xmas2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --Take the entrance location map (map name and coordinates of the target map name)
    ChaNotice(player_name, "Announcement: Some players have discovered that in Christmas Village at ["..posx..","..posy.."] emerges a portal that leads to [Converse Christmas Village]. All players beware!") --Notify the server of all the players in this group

end

function begin_enter_07xmas2(role, copy_mgr) 
	SystemNotice(role,"Entering [Converse Christmas Village]") 
	MoveCity(role, "Converse Christmas Village")
end