--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Mjing4 Ctrl.lua" )


function config(map)
    MapCanSavePos(map, 0)		
    MapCanPK(map, 1)			 
    MapCopyNum(map, 1)			
    SingleMapCopyPlyNum(map, 300)	
    MapCanTeam(map , 1)			
    MapType ( map , 4 )			        
end

function get_map_entry_pos_mjing4()

	local POS_X=245
	local POS_Y=840
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "winterland")
    SetMapEntryTime(map, "2005/8/30/19/0", "0/5/0", "0/1/0", "0/4/0")
 
end