--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading DreamIsland Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 1)		-- 1 = Allow players to save respaw // 0 = Do not allow players to save respaw
    MapCanPK(map, 1)			-- 1 = Turns on PK Mouse Sword Icon // 0 = Turns off PK Mouse Sword Icon ( Need to press CTRL key )
    MapCanTeam( map, 1 )		-- 1 = Allow players to create party // 0 = Do not allow players to create party
    MapType( map , 4 )			-- 0 = PvP Off // 1 = PvP Off // 2 = PvP On ( Not allowed to kill Guild and Party Mates ) // 3 = PvP On ( Allowed to kill any player but not Party Mates ) // 4 = PvP On ( Not allowed to kill Guild and Party Mates )        
    SingleMapCopyPlyNum(map, 300)	-- 300 Players are allowed to enter the map
    MapCanStall(map , 1)		-- 1 = Allow players to set stall // 0 = Do not allow players to set stall
end

function get_map_entry_pos_DreamIsland()
	local POS_X=0
	local POS_Y=0
	return POS_X , POS_Y
end

function init_entry(map)
end

function after_enter_DreamIsland( role , map_copy )
end

function before_leave_DreamIsland( role )
end

function map_copy_first_run_DreamIsland( map_copy )
end

function map_copy_run_DreamIsland( map_copy )
end

wangxiaohu = nil
wangxiaohuflag = nil

function map_run_DreamIsland( map )
	GMNotice()
	
	local Now_Time = tonumber(os.date("%H"))
	local Now_Minite =tonumber(os.date("%M"))
	local Now_Scend =  tonumber(os.date("%S"))
	local X = math.random(299,495)
	local Y = math.random(665,694)
	local X1 = X*100
	local Y1 = Y*100
	if Now_Time == 19 and Now_Minite ==30 and Now_Scend>0 and Now_Scend <6 then
	      if CheckWXHDead ( wangxiaohu ) == 2 or wangxiaohuflag== 0 then
		    wangxiaohu = CreateCha(1281, X1, Y1, 90, 60)
			SetChaLifeTime(wangxiaohu,10800000)
			wangxiaohuflag = 1
			GMNotice ( "Night event Boss announcement: Wang Xiao Hu is at City of Dream ("..X..","..Y.."). What item will this unlucky bandit have on him?",1) 
		 end
	end
	
	if wangxiaohuflag == 1 then 
		local a = CheckWXHDead ( wangxiaohu ,1281)
	end
	
	if Now_Time == 22 and Now_Minite ==30 and Now_Scend>0 and Now_Scend <6 then
	   if wangxiaohuflag == 1 then
			GMNotice ( "Daily Boss Event Announcement: The wicked robber Wang Xiao Hu has been captured by Private - Goldy. Thank you everyone for the help!",1)
			wangxiaohuflag =0
		end
	end
end


function map_copy_close_DreamIsland ( map_copy )
end

function can_open_entry_DreamIsland( map ) 
end 

function map_copy_run_special_DreamIsland(map)
end