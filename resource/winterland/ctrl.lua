function config(map)
    MapCanSavePos(map, 1) --Set the map to save the location of character(map coordinates, direction), this setting affects all copies of the map
    MapCanPK(map, 0) --Set the map can PK, this setting affects all copies of the map
  --  MapCopyNum(map, 1) --Set the number of copies of the map, if you do not call the statement, the default value of 1
  --  SingleMapCopyPlyNum(map, 300)
  --  MapCanTeam(map , 1)
 --   MapType ( map , 4 )

end

function init_entry(map)

end

function map_run_winterland ( map )
	local now_hour= tonumber(os.date("%H"))		------------- Hour
	local now_miniute= tonumber(os.date("%M"))	------------- Minute   
	local CheckDateNum = now_hour*100 +now_miniute
	local NowSecond = tonumber(os.date("%S"))			-------Second
	if now_hour == 0  and now_miniute == 0 and  NowSecond < 6 then
		Clear_Event_Record_By_Event_Name( "Harbor gathering command" )
		Clear_Event_Record_By_Event_Name( "Resident Evil" )
		Clear_Event_Record_By_Event_Name( "Virgin puppet doll" )
		Clear_Event_Record_By_Event_Name( "Kara puppet doll" )
		Clear_Event_Record_By_Event_Name( "Black Dragon intelligence agents" )
	end
end