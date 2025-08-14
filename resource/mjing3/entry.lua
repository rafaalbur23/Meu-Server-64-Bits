function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = "Dark Area 1"
    SetMapEntryEventName( entry, EntryName )
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Dark Area Portal opened at ["..posx..","..posy.."] Winter Islands")

end

function after_destroy_entry_mjing3(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Access to Dark Area 1 entrance has disappeared!") 

end

function after_player_login_mjing3(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "Winter Island  opened Portal to Dark Area 1")

end

function check_can_enter_mjing3( role, copy_mgr )

	local Num_1= CheckBagItem(role,0222)
	if Num_1 >= 1 then
		SystemNotice(role, "Please, remove [Snow Dragon Fruit] from your inventory!")	
		return 0
	end

	local Num_2= CheckBagItem(role,0223)
	if Num_2 >= 1 then
		SystemNotice(role, "Please, remove [Icespire Plum] from your inventory!")	
		return 0
	end

	local Num_3= CheckBagItem(role,0224)
	if Num_3 >= 1 then
		SystemNotice(role, "Please, remove [Zephyr Fish Floss] from your inventory!")	
		return 0
	end

	local Num_4= CheckBagItem(role,0225)
	if Num_4 >= 1 then
		SystemNotice(role, "Please, remove [Argent Mango] from your inventory!")	
		return 0
	end

	local Num_5= CheckBagItem(role,0226)
	if Num_5 >= 1 then
		SystemNotice(role, "Please, remove [Shaitan Biscuit] from your inventory!")	
		return 0
	end

	local Num_6= CheckBagItem(role,0276)
	if Num_6 >= 1 then
		SystemNotice(role, "Please, remove [Great Snow Dragon Fruit] from your inventory!")	
		return 0
	end

        local Num_7= CheckBagItem(role,0277)
	if Num_7 >= 1 then
		SystemNotice(role, "Please, remove [Great Icespire Plum] from your inventory!")	
		return 0
	end

	local Num_8= CheckBagItem(role,0278)
	if Num_8 >= 1 then
		SystemNotice(role, "Please, remove [Great Zephyr Fish Floss] from your inventory!")	
		return 0
	end

	local Num_9= CheckBagItem(role,0279)
	if Num_9 >= 1 then
		SystemNotice(role, "Please, remove [Great Argent Mango] from your inventory!")	
		return 0
	end

	local Num_10= CheckBagItem(role,0280)
	if Num_10 >= 1 then
		SystemNotice(role, "Please, remove [Great Shaitan Biscuit] from your inventory!")	
		return 0
	end

	local Num_11= CheckBagItem(role,7003)
	if Num_11 >= 1 then
		SystemNotice(role, "Please, remove [Improved Strength Fruit] from your inventory!")	
		return 0
	end

        local Num_12= CheckBagItem(role,7004)
	if Num_12 >= 1 then
		SystemNotice(role, "Please, remove [Improved Agility Fruit] from your inventory!")	
		return 0
	end

	local Num_13= CheckBagItem(role,7005)
	if Num_13 >= 1 then
		SystemNotice(role, "Please, remove [Improved Accuracy Fruit] from your inventory!")	
		return 0
	end

	local Num_14= CheckBagItem(role,7006)
	if Num_14 >= 1 then
		SystemNotice(role, "Please, remove [Improved Constitution Fruit] from your inventory!")	
		return 0
	end

	local Num_15= CheckBagItem(role,7007)
	if Num_15 >= 1 then
		SystemNotice(role, "Please, remove [Improved Spirit Fruit] from your inventory!")	
		return 0
	end

end

function begin_enter_mjing3(role, copy_mgr) 

	SystemNotice(role,"Entering [Dark area 1]") 
	MoveCity(role, "mjing3")

end