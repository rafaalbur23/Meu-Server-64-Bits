print("Loading tribulation functions")
function GetTeamMembers(role)
       team = {}
        team[0] = role
        if ValidCha (role) == 0 then
                return 0
        end
        team[1] = GetTeamCha(role, 1 )
        team[2] = GetTeamCha(role, 2 )
        team[3] = GetTeamCha(role, 3 )
        team[4] = GetTeamCha(role, 4 )
        for i = 0 , 4 , 1 do
                num = team[i]
                if ValidCha( num )== 1  then
				return 1
				
		else
return 0
end
end


end


function MoveTeam(role,copy_i)

		local TeamCha = {}
		TeamCha[0] = role
		TeamCha[1] = GetTeamCha(role , 0 )
		TeamCha[2] = GetTeamCha(role , 1 )
		TeamCha[3] = GetTeamCha(role , 2 )
		TeamCha[4] = GetTeamCha(role , 3 )

			for i = 0 , 4  , 1 do	
				local copy_i = GetMapCopyID(copy_mgr)
				MoveCity(TeamCha[i],"kyjj_1",copy_i)
				SystemNotice(TeamCha[i],copy_i)
			end

end

function CheckPartyClasses(role)
	local Classes = {}
	for i=0,16,1 do
	Classes[i] = 0
	end
	
	local player = {}
	player[1] = role
	player[2] = GetTeamCha( role , 0 )
	player[3] = GetTeamCha( role , 1 )
	player[4] = GetTeamCha( role , 2 )
	player[5] = GetTeamCha( role , 3 )
	

	for j = 0 , 5 , 1 do	
		if ValidCha( player[j] )== 1  then
		local job = GetChaAttr( player[j] , ATTR_JOB )
			if(job ~= nil) then
			Classes[job] = Classes[job] + 1
			end	
	   end	
	end

	for i,v in pairs(Classes) do
		if(v >=3 ) then
				return false
		end
	end
	
	return true
	
end

function SpawnMonsters(map_copy)
local Monster1 = CreateChaEx(859, 6875,4575, 145, 60,map_copy)
SetChaLifeTime(Monster1,5000)
local Monster2 = CreateChaEx(859, 5775,4625, 145, 60,map_copy)
SetChaLifeTime(Monster2,5000)
local Monster3 = CreateChaEx(859,4575,4725, 145, 60,map_copy)
SetChaLifeTime(Monster3,5000)
local Monster4 = CreateChaEx(859, 5775,4625, 145, 60,map_copy)
SetChaLifeTime(Monster4,5000)
local Monster5 = CreateChaEx(859, 4175,7425, 145, 60,map_copy)
SetChaLifeTime(Monster5,5000)
local Monster6 = CreateChaEx(859, 3925,8675, 145, 60,map_copy)
SetChaLifeTime(Monster6,5000)
local Monster7 = CreateChaEx(859, 5175,8575, 145, 60,map_copy)
SetChaLifeTime(Monster7,5000)
local Monster8 = CreateChaEx(859, 6275,8625, 145, 60,map_copy)
SetChaLifeTime(Monster8,5000)

end
