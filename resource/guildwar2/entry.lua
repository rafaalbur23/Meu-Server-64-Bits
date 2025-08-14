--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry,193,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("Announcement: According to reports, near Icicle City at ["..posx..","..posy.."] appears a portal to Mini Sacred War. Please check it out.") --通知本组服务器的所有玩家


    
--local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口
--    SetMapCopyParam(copy_mgr, 1, 3) --在第一个位置存入分边类型
--    SetMapCopyParam(copy_mgr, 2, 2) --在第二个位置存入分边数
--    SetMapCopyParam(copy_mgr, 3, HaiJunSide) 
--    SetMapCopyParam(copy_mgr, 4, HaiDaoSide)
--    SetMapCopyParam(copy_mgr, 5, 0) --在第5个位置放入胜负关系初值
--    FinishSetMapEntryCopy(entry, 1) 

    --local RedSideName = GetGuildName( RedSide_GuildID ) 
    --local BlueSideName = GetGuildName( BlueSide_GuildID ) 

    local EntryName = "Mini Sacred War Portal: [Navy Faction]  VS  [Pirate Faction] (Level 45 to 64)"
    SetMapEntryEventName( entry, EntryName )
    
    --map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    --Notice("海盗广播：公会挑战赛现在开始，对阵的双方公会是－－红方擂主 “["..RedSideName.."]”，蓝方挑战者“["..BlueSideName.."]”，双方公会的成员可以通过魔女之海“["..posx..","..posy.."]”处的漩涡进入竞技花园") --通知本组服务器的所有玩家

end

function after_destroy_entry_guildwar2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to reports, portal to [Mini Sacred War] has vanished. Check announcement for more details. Enjoy!") 

end

function after_player_login_guildwar2(entry, player_name)
--    local copy_mgr = GetMapEntryCopyObj(entry, 1) 
--    local RedSide_GuildID = GetMapCopyParam(copy_mgr, 3 )
--    local BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4 )
--    local RedSideName = GetGuildName( RedSide_GuildID ) 
--    local BlueSideName = GetGuildName( BlueSide_GuildID ) 

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
   ChaNotice(player_name, "Announcement: According to reports, near Icicle City at ["..posx..","..posy.."] appears a portal to Mini Sacred War. Please check it out.") --通知本组服务器的所有玩家

end




--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_guildwar2( role, copy_mgr )

local FightingBook_Num = 0
      FightingBook_Num = CheckBagItem( role,3849 )

if FightingBook_Num <= 0 then
		SystemNotice(role,"You need Medal of Valor to join Mini Sacred War!")
		--Notice("您身上没有勇者之证,不能进入圣战,请到竞技管理员处领取勇者之证")
		return 0
	elseif FightingBook_Num > 1 then
		--LG("RYZ_PK","more than one Medal of Valor")
		return 0
	end


local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "You must leave your party to join Mini Sacred War!" )
		return 0
		
	end


	--local Cha = TurnToCha(role)

    --local RedSide_GuildID = GetMapCopyParam(copy_mgr, 3 )
    --local BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4 )



 if  GetChaGuildID(role) == 0 then
	

     SystemNotice(role,"Sorry, only members of a Navy Guild or a Pirate Guild may join Mini Sacred War!")
     return 0
		
	
elseif Lv(role) < 45 or Lv(role) > 64  then

	SystemNotice(role, "Only players Lv 45 to 64 may enter")
	     return 0    
	end


        local Num_1= CheckBagItem(role,4661)
	if Num_1 >= 1 then
		SystemNotice(role, "Please, remove [Repair Wood] from your inventory!")	
		return 0
	end

	local Num_2= CheckBagItem(role,4546)
	if Num_2 >= 1 then
		SystemNotice(role, "Please, remove [Crystal Ore] from your inventory!")	
		return 0
	end

	local Num_3= CheckBagItem(role,1684)
	if Num_3 >= 1 then
		SystemNotice(role, "Please, remove [Hard Tortoise Shell] from your inventory!")	
		return 0
	end

	local Num_4= CheckBagItem(role,1683)
	if Num_4 >= 1 then
		SystemNotice(role, "Please, remove [Tortoise Shell Fragment] from your inventory!")	
		return 0
	end

	local Num_5= CheckBagItem(role,4012)
	if Num_5 >= 1 then
		SystemNotice(role, "Please, remove [Moon Tail Eel] from your inventory!")	
		return 0
	end

	local Num_6= CheckBagItem(role,4013)
	if Num_6 >= 1 then
		SystemNotice(role, "Please, remove [Diving Clam] from your inventory!")	
		return 0
	end

        local Num_7= CheckBagItem(role,2964)
	if Num_7 >= 1 then
		SystemNotice(role, "Please, remove [Navy Token] from your inventory!")	
		return 0
	end

	local Num_8= CheckBagItem(role,3001)
	if Num_8 >= 1 then
		SystemNotice(role, "Please, remove [Pirate Token] from your inventory!")	
		return 0
	end

	local Num_9= CheckBagItem(role,4011)
	if Num_9 >= 1 then
		SystemNotice(role, "Please, remove [Squirting Fish] from your inventory!")	
		return 0
	end

	local Num_10= CheckBagItem(role,1720)
	if Num_10 >= 1 then
		SystemNotice(role, "Please, remove [Fish Bone] from your inventory!")	
		return 0
	end

	local Num_11= CheckBagItem(role,2382)
	if Num_11 < 1 then
		SystemNotice(role, "Please, talk to Sacred War Administrator to obtain [Token of Life & Death]!")	
		return 0
	end

end

function begin_enter_guildwar2(role, copy_mgr) 

--local role_RY = GetChaItem2 ( role , 2 , 3849 )
--local HonorPoint = GetItemAttr ( role_RY , ITEMATTR_VAL_STR)
--local HonorPoint_now = HonorPoint - 15
--
--	if HonorPoint < 15 then
--		SystemNotice ( role , "您的荣誉值不够,不能进入圣战" )
--		return 0
--	else
--
--	SetItemAttr( role_RY , ITEMATTR_VAL_STR , HonorPoint_now )
--	        
--	end

    --local RedSide_GuildID, BlueSide_GuildID
    --RedSide_GuildID = GetMapCopyParam(copy_mgr, 3)
    --BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4)

     local Cha = TurnToCha(role)
     if  GetChaGuildID(Cha) <= 100 and GetChaGuildID(Cha) > 0 then
	     if count_haijun2 < 45 then
	        
	        SystemNotice(role,"[A Navy member joined Mini Sacred War]")
		MoveCity(role, "guildwarnavyside2")
                count_haijun2 = count_haijun2 + 1
	      else 
	        SystemNotice(role,"Navy Faction has already 45 members")
	      end
	
     end	        
		
     if GetChaGuildID(Cha) > 100 and GetChaGuildID(Cha) <= 200 then
             if count_haidao2 < 45 then
	        SystemNotice(role,"[A Pirate member joined Mini Sacred War]")
		MoveCity(role, "guildwarpirateside2")
		count_haidao2=count_haidao2 + 1
	     else
	        SystemNotice(role,"Pirate Faction has already 45 members")
	     end

     end 
end


