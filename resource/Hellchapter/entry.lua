function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)

    local EntryName = "Hell Chapter"
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Hell Chapter has started! Dream City - ["..posx..","..posy.."]", 1)

end

function after_destroy_entry_runff(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice(" Hell Chapter is now closed", 1)

end
function after_player_login_Hellchapter(entry, player_name)

end

--Entry conditions for the detection
--Return value: 0, does not meet entry conditions. 1, successfully entered.

function check_can_enter_Hellchapter( role, copy_mgr )


	if Lv(role) < 40 then
	SystemNotice(role, "To enter Hell Chapter, players need to be above level 39")
		return 0    
	end
		
end

function begin_enter_Hellchapter(role, copy_mgr) 

		SystemNotice(role,"Entering [Hell Chapter]") 
		MoveCity(role, "Hell Chapter")

end