------------------------------------------------------------
--EventEntity.lua Created by knight 2005.5.16.
--
--Define the map events each entity
print( "loading EventEntity.lua" )
-------------------------------------------------------------

--Winter Island incident entity initialization information
function InitGarnerEntity()

	--Winter Island port entity created
	CreateBerthEntity( "Docked", 455, 2, 33714, 96511, -10, 34, 329, 951, 0 )
	CreateBerthEntity( "Docked", 455, 2, 70214, 72011, -10, 34, 697, 703, 0 )
	CreateBerthEntity( "Docked", 455, 2, 104314, 62911, -10, 34, 1040, 605, 0 )
	CreateBerthEntity( "Docked", 455, 2, 24614, 118511, -10, 34, 254, 1203, 0 )
	CreateBerthEntity( "Docked", 455, 2, 45214, 142211, -10, 34, 715,1140, 0 )



end

InitGarnerEntity()