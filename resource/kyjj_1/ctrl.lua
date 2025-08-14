--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading kyjj_1 Ctrl.lua" )

function config(map)
	MapCanSavePos(map, 0)
	if tribInst ~= nil then
		MapCopyNum(map, tribInst.conf['maxcopy'])
	else
		MapCopyNum(map, 1)
	end
	MapCanPK(map, 0)
	SingleMapCopyPlyNum(map, 5)
	MapCanTeam(map, 1)
	MapType(map, 4)
end