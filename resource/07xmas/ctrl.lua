--This file, all functions may be executed many times, the function name must be prefixed with the map name

function config(map)
    MapCanSavePos(map, 0) --Set the map to save the role of location (map coordinates, direction), this setting affects all copies of the map
    -----MapCanPK(map, 0) --Set the map can PK, this setting affects all copies of the map
    MapCopyNum(map, 1) --Set the number of copies of the map, if you do not call the statement, the default value of 1
    SingleMapCopyPlyNum(map, 300)   --Set a copy of the number of players
    MapCanTeam(map , 1)
    MapType ( map , 1 )
end


function get_map_entry_pos_07xmas()   --Set the location of the entrance of the coordinates (coordinates (m))
end

function init_entry(map)
end


function can_open_entry_07xmas( map ) 
end 
