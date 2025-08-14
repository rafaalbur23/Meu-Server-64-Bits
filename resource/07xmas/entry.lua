--This file, all functions may be executed many times, the function name must be prefixed with the map name, such as after_destroy_entry_testpk
--This file is the maximum number of characters per line is 255, if it has objections, please contact the program of

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --Set the map entry the entity number (the number corresponds to characterinfo.txt index)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --Create a copy of the management object, this function has an explicit entry in the map must be called for implicit map entry (such as team challenge) without the interface to call

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --Take the entrance location map (map name and coordinates of the target map name)
    Notice("Announcement: Some players have discovered that on Ascaron region at ["..posx..","..posy.."] emerges a portal that leads to [Christmas Village]. All players beware!") --Notify the server of all the players in this group

end

function after_destroy_entry_07xmas(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to reports, portal to [Christmas Village] has vanished. Check announcement for more details. Enjoy!") 

end

function after_player_login_07xmas(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --Take the entrance location map (map name and coordinates of the target map name)
    ChaNotice(player_name, "Announcement: Some players have discovered that on Ascaron region at ["..posx..","..posy.."] emerges a portal that leads to [Christmas Village]. All players beware!") --Notify the server of all the players in this group

end

function begin_enter_07xmas(role, copy_mgr) 
	SystemNotice(role,"Entering [Christmas Village]") 
	MoveCity(role, "Chirstmas Village")
end