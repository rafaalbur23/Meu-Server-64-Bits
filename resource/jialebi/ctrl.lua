print( "------------------------------------")
print( "-- Loading jialebi files          --")
print( "------------------------------------")
print( "* Loading ctrl.lua" )

function config(Map)
    MapCanSavePos(Map, 1) --Set the map to save the role of location (map coordinates, direction), this setting affects all copies of the map
    MapCanPK(Map, 1) --Set the map can PK, this setting affects all copies of the map
  --  MapCopyNum(map, 1) --Set the number of copies of the map, if you do not call the statement, the default value of 1
  --  SingleMapCopyPlyNum(map, 300)
  --  MapCanTeam(map , 1)
    MapType(Map, 4)
end

function get_map_entry_pos_jialebi()
  local POS_X = 0
  local POS_Y = 0
  return POS_X, POS_Y
end

function init_entry(map)
end

function after_enter_jialebi(Player, MapCopy)
end

function before_leave_jialebi(Player)
end

function map_copy_first_run_jialebi(MapCopy)
end

function map_copy_run_jialebi(MapCopy)
end

function map_copy_run_special_jialebi(MapCopy)
end

function map_run_jialebi(Map)
end

function map_copy_before_close_jialebi(MapCopy)
end

function map_copy_close_jialebi(MapCopy)
end

function can_open_entry_jialebi(Map) 
    return 1
end 
