function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1)

end 

function after_create_entry(entry) 

    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = "Abaddon Eternal"
    SetMapEntryEventName( entry, EntryName )
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Announcement: In the depths of Abaddon 18\"["..posx..","..posy.."]\" is accumulating a form of energy and energy of evil keeps welling out from it!")

end

function after_destroy_entry_hell5(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    --Notice("Announcement: Challenge for today has ended.") 

end

function after_player_login_hell5(entry, player_name)

end

function check_can_enter_hell5( role, copy_mgr )

	if CRY[18]==0 then

		SystemNotice(role,"Power of Darkness sealed the entrance to Eternity. It will not open no matter how hard you try.")
		return 0

	end

	return 1

end

function begin_enter_hell5(role, copy_mgr) 
    

		SystemNotice(role,"A strong force pulls you towards the endless darkness. When you open your eyes, you see before you a familiar world.")

		MoveCity(role, "Abaddon 5")
	

end