--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry,193,1) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    Notice("Announcement: According to reports, near Shaitan City at [" .. posx ..",".. posy .. "] appears a portal to Sacred War. Please check it out.") --֪ͨ������������������


    
--local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�
--    SetMapCopyParam(copy_mgr, 1, 3) --�ڵ�һ��λ�ô���ֱ�����
--    SetMapCopyParam(copy_mgr, 2, 2) --�ڵڶ���λ�ô���ֱ���
--    SetMapCopyParam(copy_mgr, 3, HaiJunSide) 
--    SetMapCopyParam(copy_mgr, 4, HaiDaoSide)
--    SetMapCopyParam(copy_mgr, 5, 0) --�ڵ�5��λ�÷���ʤ����ϵ��ֵ
--    FinishSetMapEntryCopy(entry, 1) 

    --local RedSideName = GetGuildName( RedSide_GuildID ) 
    --local BlueSideName = GetGuildName( BlueSide_GuildID ) 

    local EntryName = "Sacred War Portal: [Navy Faction]  VS  [Pirate Faction] (Level 65 and up)"
    SetMapEntryEventName( entry, EntryName )
    
    --map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    --Notice("�����㲥��������ս�����ڿ�ʼ�������˫�������ǣ����췽���� ��["..RedSideName.."]����������ս�ߡ�["..BlueSideName.."]����˫������ĳ�Ա����ͨ��ħŮ֮����["..posx..","..posy.."]���������н��뾺����԰") --֪ͨ������������������

end

function after_destroy_entry_guildwar(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to reports, portal to [Sacred War] has vanished. Check announcement for more details. Enjoy!") 

end

function after_player_login_guildwar(entry, player_name)
--    local copy_mgr = GetMapEntryCopyObj(entry, 1) 
--    local RedSide_GuildID = GetMapCopyParam(copy_mgr, 3 )
--    local BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4 )
--    local RedSideName = GetGuildName( RedSide_GuildID ) 
--    local BlueSideName = GetGuildName( BlueSide_GuildID ) 

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
   ChaNotice(player_name, "Announcement: According to reports, near Shaitan City at [" .. posx ..",".. posy .. "] appears a portal to Sacred War. Please check it out.") --֪ͨ������������������

end




--���ڼ���������
--����ֵ��0�����������������1���ɹ����롣
function check_can_enter_guildwar( role, copy_mgr )

local FightingBook_Num = 0
      FightingBook_Num = CheckBagItem( role,3849 )

if FightingBook_Num <= 0 then
		SystemNotice(role,"You need Medal of Valor to join Sacred War!")
		--Notice("������û������֤֮,���ܽ���ʥս,�뵽��������Ա����ȡ����֤֮")
		return 0
	elseif FightingBook_Num > 1 then
		--LG("RYZ_PK","more than one Medal of Valor")
		return 0
	end


local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "You must leave your party to join Sacred War!" )
		return 0
		
	end

	--local Cha = TurnToCha(role)

    --local RedSide_GuildID = GetMapCopyParam(copy_mgr, 3 )
    --local BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4 )



 if  GetChaGuildID(role) == 0 then
	

     SystemNotice(role,"Sorry, only members of a Navy Guild or a Pirate Guild may join Sacred War!")
     return 0
		
	
elseif Lv(role) < 65  then

	SystemNotice(role, "Only players Lv 65 and above may enter")
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

function begin_enter_guildwar(role, copy_mgr) 

--local role_RY = GetChaItem2 ( role , 2 , 3849 )
--local HonorPoint = GetItemAttr ( role_RY , ITEMATTR_VAL_STR)
--local HonorPoint_now = HonorPoint - 15
--
--	if HonorPoint < 15 then
--		SystemNotice ( role , "��������ֵ����,���ܽ���ʥս" )
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
	     if count_haijun < 45 then
	        
	        SystemNotice(role,"[A Navy member joined Sacred War]")
		MoveCity(role, "guildwarnavyside")
                count_haijun = count_haijun + 1
	      else 
	        SystemNotice(role,"Navy Faction has already 45 members")
	      end
	
     end	        
		
     if GetChaGuildID(Cha) > 100 and GetChaGuildID(Cha) <= 200 then
             if count_haidao < 45 then
	        SystemNotice(role,"[A Pirate member joined Sacred War]")
		MoveCity(role, "guildwarpirateside")
		count_haidao=count_haidao + 1
	     else
	        SystemNotice(role,"Pirate Faction has already 45 members")
	     end

     end 
end


