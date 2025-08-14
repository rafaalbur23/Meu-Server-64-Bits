------------------------------------------------------------
--EventEntity.lua Created by knight 2005.5.16.
--
--Defines the various entities of events on the map
print( "loading EventEntity.lua" )
-------------------------------------------------------------

--Ghana continental event entity initialization information
function InitGarnerEntity()

	--Create a Caribbean port entity
	CreateBerthEntity( "Docked", 455, 2, 63614, 91411, -10, 12, 631, 927, 0 )
	CreateBerthEntity( "Docked", 455, 2, 65411, 100611,-10, 12, 658,993, 0 )
	CreateBerthEntity( "Docked", 455, 2, 62411, 62811,-10, 12, 612,622, 0 )
	CreateBerthEntity( "Docked", 455, 2, 38011, 15611,-10, 12, 370,165, 0 )
	CreateBerthEntity( "Docked", 455, 2, 108200, 22500,-10, 12, 1082,211, 0 )



end

InitGarnerEntity()