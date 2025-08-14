--This file, all functions may be executed many times, the function name must be prefixed with the map name

function config(map)
    MapCanSavePos(map, 0) --Set the map to save the role of location (map coordinates, direction), this setting affects all copies of the map
    -----MapCanPK(map, 0) --Set the map can PK, this setting affects all copies of the map
    MapCopyNum(map, 1) --Set the number of copies of the map, if you do not call the statement, the default value of 1
    SingleMapCopyPlyNum(map, 300)   --Set a copy of the number of players
    MapCanTeam(map , 1)
    MapType ( map , 1 )
end


function get_map_entry_pos_07xmas2()   --Set the location of the entrance of the coordinates (coordinates (m))

	local POS_X=130
	local POS_Y=156
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "07xmas") --Set the location of the entrance (map name)
    SetMapEntryTime(map, "2008/12/25/19/0", "1/0/0", "0/3/0", "0/3/0") --Set the entry time, the map object, the first turn-on time (year / month / day / hour / minute), open again after an interval (day / hour / minute, only for the first time on all 0), open to the entrance of each disappearance of the interval (day / hour / minute, that never disappear all 0), to map each time you turn off the interval (day / hour / minute, never closed all 0). .

end


function can_open_entry_07xmas2( map ) 
end 
