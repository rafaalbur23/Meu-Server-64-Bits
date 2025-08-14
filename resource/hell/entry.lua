function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1)

end 

function after_create_entry(entry) 

    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = "Gate to Hell"
    SetMapEntryEventName( entry, EntryName )
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Announcement: In the depths of Abaddon \"["..posx..","..posy.."]\" Cries of the undead have constantly been heard, resulting in the people of Caribean Island being afraid. Is there any warrior whos willing to investigate?") --通知本组服务器的所有玩家

end

function after_destroy_entry_hell(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    --Notice("Announcement: Challenge for today has ended.") 

end

function after_player_login_hell(entry, player_name)

end

function check_can_enter_hell( role, copy_mgr )

end

function begin_enter_hell(role, copy_mgr) 
    
		SystemNotice(role,"An unknown gravity pulls you towards the endless darkness. A darker Abaddon awaits you.")
		MoveCity(role, "Abaddon 1")
	
end