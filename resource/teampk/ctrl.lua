--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺

function config(map)
    MapCanSavePos(map, 0) --���õ�ͼ�Ƿ񱣴��ɫλ�ã���ͼ�����꣬���򣩣�������Ӱ��õ�ͼ�����и���
    MapCanPK(map, 1) --���õ�ͼ�Ƿ����PK��������Ӱ��õ�ͼ�����и���
    --MapCopyNum(map, 800) --���õ�ͼ�ĸ�����Ŀ����������ø���䣬��ʹ��Ĭ��ֵ1
    MapCanTeam( map, 1 )
    MapType( map , 3 )
    MapCopyStartType( map , 3 )
	
end

function init_entry(map)
    SetMapEntryMapName(map, "garner") --������ڵ�λ�ã���ͼ�������꣨�ף���
    SetMapEntryTime(map, "2005/8/30/13/0", "0/0/0", "0/0/0", "0/0/0") --������ڵ�ʱ�䣬��ͼ�����״ο���ʱ�䣨��/��/��/ʱ/�֣����Ժ��ٴο����ļ������/ʱ/�֣�ȫ����ʾֻ���״ο�������ÿ�ο����������ʧ�ļ������/ʱ/�֣�ȫ����ʾ������ʧ����ÿ�ο�������ͼ�رյļ������/ʱ/�֣�ȫ����ʾ�����رգ�����

end

function map_copy_run_teampk(map_copy) 
--	local Start_time = GetMapCopyParam2(map_copy , 7)
--	if Start_time> 0 then
--		Start_time = Start_time -1
--		SetMapCopyParam2(map_copy, 7,Start_time)
--		return
--	end
--	if Start_time == 0 then
--	end
	local ply_num = GetMapCopyPlayerNum(map_copy) 
	if ply_num == 0 then 
	    CloseMapCopy ("teampk", GetMapCopyID2(map_copy)) 
	end
	local Map_Start = GetMapCopyParam2(map_copy, 8)
	local Map_Start = Map_Start + 1
	SetMapCopyParam2(map_copy, 8, Map_Start)
	local log_count = 0
	local PKMap_HasPlayers = 0
	local Team1_live = 0
	local Team2_live = 0
	local Team1_Num = GetMapCopyParam2(map_copy, 3)
	local Team2_Num = GetMapCopyParam2(map_copy, 4)
	local Max_PlayerNum = 11
	local Team_type = GetMapCopyParam2(map_copy, 1)
	local Team1_PlayerNum = 0
	local Team2_PlayerNum = 0
	local Team1_PlayerLv = 0
	local Team2_PlayerLv = 0
	
	local Winner_Is = GetMapCopyParam2( map_copy, 5 )
	if Winner_Is == -1 then
		SetMapCopyParam2(map_copy, 6, 11 )
	end
	if Winner_Is > -1 then
		local Time_count = GetMapCopyParam2(map_copy, 6)
		local Time_count = Time_count - 1
		SetMapCopyParam2(map_copy, 6,Time_count)
		
		if Time_count == 0 then
			CloseMapCopy ("teampk", GetMapCopyID2(map_copy))
		end
	end		
	
	BeginGetMapCopyPlayerCha ( map_copy )
	
	for i = 0 ,Max_PlayerNum - 1 , 1 do
		PKMap_HasPlayers = GetMapCopyNextPlayerCha ( map_copy )
		if PKMap_HasPlayers ~= 0 and PKMap_HasPlayers ~= nil then
			local Time_count = GetMapCopyParam2(map_copy, 6)
			local Time_num = Time_count / 5
			log_count = log_count + 1
			if Time_num == math.floor ( Time_num ) then
				TEAMPK_CTRL_LUA_000001 = GetResString("TEAMPK_CTRL_LUA_000001")
				TEAMPK_CTRL_LUA_000002 = GetResString("TEAMPK_CTRL_LUA_000002")
				SystemNotice ( PKMap_HasPlayers , TEAMPK_CTRL_LUA_000002..Time_count..TEAMPK_CTRL_LUA_000001)
				if Team_type == 1 then
					local Team_Num_get = GetChaTeamID( PKMap_HasPlayers )
					if Team_Num_get == Winner_Is then
						TEAMPK_CTRL_LUA_000003 = GetResString("TEAMPK_CTRL_LUA_000003")
						SystemNotice ( PKMap_HasPlayers , TEAMPK_CTRL_LUA_000003 )
					end
				end
				if Team_type == 2 then
					local Player = GetChaPlayer( PKMap_HasPlayers )
					local Player_ID_get = GetPlayerID( Player )
					if Player_ID_get == Winner_Is then
						TEAMPK_CTRL_LUA_000004 = GetResString("TEAMPK_CTRL_LUA_000004")
						SystemNotice ( PKMap_HasPlayers , TEAMPK_CTRL_LUA_000004 )
					end
				end
			end
			
				
			local Hp = Hp( PKMap_HasPlayers )		
			local Lv = Lv( PKMap_HasPlayers )
			if Hp > 0 then
				if Team_type == 1 then
					local Team_Num_get = GetChaTeamID( PKMap_HasPlayers )
					if Team_Num_get == 0 then
						TEAMPK_CTRL_LUA_000005 = GetResString("TEAMPK_CTRL_LUA_000005")
						LG("teampk",TEAMPK_CTRL_LUA_000005)
						Map_Start = 0
						SetMapCopyParam2(map_copy, 8, Map_Start)  -----���������Ϣδ�������ͼ������־��0
						return
					end
					if Team1_Num == Team_Num_get then
						Team1_live = Team1_live + 1
						Team1_PlayerNum = Team1_PlayerNum + 1
						Team1_PlayerLv = Team1_PlayerLv + Lv

					elseif Team2_Num == Team_Num_get then
						Team2_live = Team2_live + 1
						Team2_PlayerNum = Team2_PlayerNum + 1
						Team2_PlayerLv = Team2_PlayerLv + Lv
					end
				elseif Team_type == 2 then
					local Player = GetChaPlayer( PKMap_HasPlayers )
					local Player_ID_get = GetPlayerID( Player )
					if Player_ID_get == 0 then
						TEAMPK_CTRL_LUA_000006 = GetResString("TEAMPK_CTRL_LUA_000006")
						LG("teampk",TEAMPK_CTRL_LUA_000006)
						Map_Start = 0
						SetMapCopyParam2(map_copy, 8, Map_Start)  -----���������Ϣδ�������ͼ������־��0
						return
					end
					if Team1_Num == Player_ID_get then
						Team1_live = Team1_live + 1
						Team1_PlayerNum = Team1_PlayerNum + 1
						Team1_PlayerLv = Team1_PlayerLv + Lv
					elseif Team2_Num == Player_ID_get then
						Team2_live = Team2_live + 1
						Team2_PlayerNum = Team2_PlayerNum + 1
						Team2_PlayerLv = Team2_PlayerLv + Lv
					end
				end
				if Time_count == 1 then
					 BIRTH_BIRTH_CONF_LUA_000044 = GetResString("BIRTH_BIRTH_CONF_LUA_000044")
					 MoveCity( PKMap_HasPlayers, BIRTH_BIRTH_CONF_LUA_000044 )
				end
			end
		else
			if log_count <=1 and Map_Start == 1 then
				TEAMPK_CTRL_LUA_000007 = GetResString("TEAMPK_CTRL_LUA_000007")
				LG("teampk",TEAMPK_CTRL_LUA_000007..log_count )
			end
			if Map_Start == 1 then
--				Notice("��һ�����нű�")
				SetMapCopyParam2(map_copy , 11 ,Team1_PlayerNum )
				SetMapCopyParam2(map_copy , 12 ,Team2_PlayerNum )
				local Team1_Lv = math.floor ( Team1_PlayerLv / Team1_PlayerNum )
				local Team2_Lv = math.floor ( Team2_PlayerLv / Team2_PlayerNum )
				SetMapCopyParam2(map_copy , 9 , Team1_Lv )
				SetMapCopyParam2(map_copy , 10 , Team2_Lv )
--				Notice ("����1����Ϊ"..Team1_PlayerNum)
--				Notice ("����2����Ϊ"..Team2_PlayerNum)
--				Notice ("����1ƽ������Ϊ"..Team1_Lv)
--				Notice ("����2ƽ������Ϊ"..Team2_Lv)
			end
			if Team1_live == 0 and Team2_live > 0 and Winner_Is == -1 then
				SetMapCopyParam2(map_copy, 5, Team2_Num )
			end
			
			if Team1_live > 0 and Team2_live == 0 and Winner_Is == -1 then
				SetMapCopyParam2(map_copy, 5, Team1_Num )
			end
			return
		end
			
	end


end 


function before_leave_teampk ( role , map_copy )
--	SystemNotice (role , "�뿪��")
	local Cha = TurnToCha( role ) 
	local Winner_Is = GetMapCopyParam2( map_copy, 5 )
	local Cha_TeamID = GetChaTeamID ( Cha )
	local Player = GetChaPlayer( Cha )
	local Cha_ID = GetPlayerID( Player )
	local PK_type = GetMapCopyParam2( map_copy , 1 )
	local Team1_ID = GetMapCopyParam2( map_copy , 3 )
	local Team2_ID = GetMapCopyParam2( map_copy , 4 )
	local base_rongyu = 2
	local rongyu_dif = 0
	local Team1_Lv = GetMapCopyParam2( map_copy , 9 )
	local Team2_Lv = GetMapCopyParam2( map_copy , 10)
	local Team1_PlayerNum = GetMapCopyParam2( map_copy , 11 )
	local Team2_PlayerNum = GetMapCopyParam2( map_copy , 12 )
	
	local Team1_Rongyu_get = ( base_rongyu * Team2_PlayerNum )
	local Team2_Rongyu_get = ( base_rongyu * Team1_PlayerNum )
	local Team1_Lv_dif = Team1_Lv - Team2_Lv
	local Team2_Lv_dif = Team2_Lv - Team1_Lv
	
	local Rongyu_get = 0
	local Player_Lv_dif = 0
		
--	SystemNotice(role , "����1ƽ���ȼ�="..Team1_Lv)
--	SystemNotice(role , "����2ƽ���ȼ�="..Team2_Lv)
--	SystemNotice(role , "����1����="..Team1_PlayerNum)
--	SystemNotice(role , "����2����="..Team2_PlayerNum)
	if PK_type == 1 then
--		SystemNotice ( role , "�Ƕ���PKŶ")
		if Cha_TeamID == Team1_ID then
			if Winner_Is == Cha_TeamID then
				Rongyu_get = Team1_Rongyu_get
			else
				Rongyu_get = Team2_Rongyu_get
			end
			Player_Lv_dif = Team1_Lv_dif
		elseif Cha_TeamID == Team2_ID then
			if Winner_Is == Cha_TeamID then
				Rongyu_get = Team2_Rongyu_get
			else
				Rongyu_get = Team1_Rongyu_get
			end
			Player_Lv_dif = Team2_Lv_dif
		else
			TEAMPK_CTRL_LUA_000008 = GetResString("TEAMPK_CTRL_LUA_000008")
			LG("teampk",TEAMPK_CTRL_LUA_000008 )
			return
		end
		local rongyu_add = 0
		
		if Player_Lv_dif > 0 then
			if Winner_Is == Cha_TeamID then 
				rongyu_add = math.floor ( Rongyu_get / math.floor ( (  Player_Lv_dif + 10 )/10 ) )
			else
--				SystemNotice(role , "����ʧ������")
				rongyu_add = math.floor ( Rongyu_get * math.min( 3 , math.floor ( (  Player_Lv_dif + 10 )/10 ) ) )
--				SystemNotice(role , "ʧ������Ϊ"..rongyu_add)
			end
		end
		if Player_Lv_dif < 0 then
			if Winner_Is == Cha_TeamID then
				rongyu_add = math.floor ( Rongyu_get * -1 * math.max ( -3 , math.floor ( (  Player_Lv_dif - 10 )/10 ) ) )
			else
--				SystemNotice(role , "����ʧ������")
				rongyu_add = math.floor ( Rongyu_get * -1 / math.floor ( (  Player_Lv_dif - 10 )/10 ) )
--				SystemNotice(role , "ʧ������Ϊ"..rongyu_add)
			end
		end
		
		if Player_Lv_dif ==  0 then
			rongyu_add = Rongyu_get
		end

		if Winner_Is == Cha_TeamID then
			local RYZ_Num = 0
			RYZ_Num = CheckBagItem( role,3849 )

			if RYZ_Num == 0 then
				return
			elseif RYZ_Num > 1 then
				TEAMPK_CTRL_LUA_000009 = GetResString("TEAMPK_CTRL_LUA_000009")
				LG("RYZ_PK",TEAMPK_CTRL_LUA_000009)
				return
			end
			local Cha_RYZ = GetChaItem2 ( Cha , 2 , 3849 )
			local attrtype = ITEMATTR_VAL_STA
			local attrtype_Rongyu = ITEMATTR_VAL_STR
			local num = 1
			local Rongyu = rongyu_add
--			SystemNotice ( role , "ʤ������ʤ������")
			Add_ItemAttr_RYZ ( role , Cha_RYZ , attrtype , num )
			TEAMPK_CTRL_LUA_000010 = GetResString("TEAMPK_CTRL_LUA_000010")
			SystemNotice ( role , TEAMPK_CTRL_LUA_000010..Rongyu )
			Add_ItemAttr_RYZ ( role , Cha_RYZ , attrtype_Rongyu , Rongyu )
		else
			local RYZ_Num = 0
			RYZ_Num = CheckBagItem( role,3849 )

			if RYZ_Num == 0 then
				return
			elseif RYZ_Num > 1 then
				TEAMPK_CTRL_LUA_000009 = GetResString("TEAMPK_CTRL_LUA_000009")
				LG("RYZ_PK",TEAMPK_CTRL_LUA_000009)
				return
			end
			local Cha_RYZ = GetChaItem2 ( Cha , 2 , 3849 )
			local attrtype_Rongyu = ITEMATTR_VAL_STR
			local Rongyu = -1 * rongyu_add
			TEAMPK_CTRL_LUA_000011 = GetResString("TEAMPK_CTRL_LUA_000011")
			SystemNotice ( role ,TEAMPK_CTRL_LUA_000011..rongyu_add )
			Add_ItemAttr_RYZ ( role , Cha_RYZ , attrtype_Rongyu , Rongyu )
		end
	elseif PK_type == 2 then
--		SystemNotice ( role , "�ǵ���Ŷ" )
		if Cha_ID == Team1_ID then
--			SystemNotice(role , "����1�ӵ�Ŷ")
			Rongyu_get = Team1_Rongyu_get
			Player_Lv_dif = Team1_Lv_dif
		elseif Cha_ID == Team2_ID then
--			SystemNotice ( role , "����2�ӵ�Ŷ")
			Rongyu_get = Team2_Rongyu_get
			Player_Lv_dif = Team2_Lv_dif
		else
--			SystemNotice(role ,"��������Ŷ")
			TEAMPK_CTRL_LUA_000012 = GetResString("TEAMPK_CTRL_LUA_000012")
			LG("teampk",TEAMPK_CTRL_LUA_000012 )
			return
		end
--		SystemNotice(role , "׼���жϵȼ���")
--		SystemNotice(role , "Player_Lv_dif="..Player_Lv_dif)
		local rongyu_add = 0
		
		if Player_Lv_dif > 0 then
--			SystemNotice(role ,"�۸����͵��˰ɣ�")
			if Winner_Is == Cha_ID then 
				rongyu_add = math.floor ( Rongyu_get / math.floor ( (  Player_Lv_dif + 10 )/10 ) )
			else
				rongyu_add = math.floor ( Rongyu_get * math.min ( 3 ,math.floor ( (  Player_Lv_dif + 10 )/10 ) ) )
			end
		end
		if Player_Lv_dif < 0 then
--			SystemNotice(role , "�����ߵ� K �ˣ�")
			if Winner_Is == Cha_ID then
				rongyu_add = math.floor ( Rongyu_get * -1 * math.max ( -3 , math.floor ( (  Player_Lv_dif - 10 )/10 ) ) )
			else
				rongyu_add = math.floor ( Rongyu_get * -1 / math.floor ( (  Player_Lv_dif - 10 )/10 ) )
			end
		end
		if Player_Lv_dif == 0 then
--			SystemNotice(role , "��ô�ɣ�����һ����")
			rongyu_add = Rongyu_get
		end
	
		if Winner_Is == Cha_ID then
--			SystemNotice(role ,"��ʵ�Ҳ���Ӯ")
			local RYZ_Num = 0
			RYZ_Num = CheckBagItem( role,3849 )

			if RYZ_Num == 0 then
				return
			elseif RYZ_Num > 1 then
				TEAMPK_CTRL_LUA_000009 = GetResString("TEAMPK_CTRL_LUA_000009")
				LG("RYZ_PK",TEAMPK_CTRL_LUA_000009)
				return
			end
			local Cha_RYZ = GetChaItem2 ( Cha , 2 , 3849 )
			local attrtype = ITEMATTR_VAL_STA
			local attrtype_Rongyu = ITEMATTR_VAL_STR
			local num = 1
			local Rongyu = rongyu_add
--			SystemNotice ( role , "ʤ������ʤ������")
			Add_ItemAttr_RYZ ( role , Cha_RYZ , attrtype , num )
			TEAMPK_CTRL_LUA_000010 = GetResString("TEAMPK_CTRL_LUA_000010")
			SystemNotice ( role , TEAMPK_CTRL_LUA_000010..Rongyu)
			Add_ItemAttr_RYZ ( role , Cha_RYZ , attrtype_Rongyu , Rongyu )
		else
--			SystemNotice(role ,"����������")
			local RYZ_Num = 0
			RYZ_Num = CheckBagItem( role,3849 )

			if RYZ_Num == 0 then
				return
			elseif RYZ_Num > 1 then
				TEAMPK_CTRL_LUA_000009 = GetResString("TEAMPK_CTRL_LUA_000009")
				LG("RYZ_PK",TEAMPK_CTRL_LUA_000009)
				return
			end
			local Cha_RYZ = GetChaItem2 ( Cha , 2 , 3849 )
			local attrtype_Rongyu = ITEMATTR_VAL_STR
			local Rongyu = -1 * rongyu_add
			TEAMPK_CTRL_LUA_000011 = GetResString("TEAMPK_CTRL_LUA_000011")
			SystemNotice ( role ,TEAMPK_CTRL_LUA_000011..rongyu_add)
			Add_ItemAttr_RYZ ( role , Cha_RYZ , attrtype_Rongyu , Rongyu )
		end
	end
end

function after_enter_teampk ( role , map_copy )
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num == 0 then
		return
	elseif RYZ_Num > 1 then
		TEAMPK_CTRL_LUA_000009 = GetResString("TEAMPK_CTRL_LUA_000009")
		LG("RYZ_PK",TEAMPK_CTRL_LUA_000009)
		return
	end

	local Cha_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_CON
	local num = 1
--	SystemNotice ( role , "���Ӳμӳ���" )
	Add_ItemAttr_RYZ ( role , Cha_RYZ , attrtype , num )
end

function map_run_teampk(map)
end
function get_map_entry_pos_teampk()   --������ڵ�λ�õ����꣨���꣨�ף���
local POS_X=0
	local POS_Y=0
	return POS_X , POS_Y
end
