--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,4) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    ABANDONEDCITY_ENTRY_LUA_000001 = GetResString("ABANDONEDCITY_ENTRY_LUA_000001")
    ABANDONEDCITY_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY_ENTRY_LUA_000002")
    Notice(ABANDONEDCITY_ENTRY_LUA_000002..posx..","..posy..ABANDONEDCITY_ENTRY_LUA_000001) --֪ͨ������������������

end

function after_destroy_entry_abandonedcity(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    ABANDONEDCITY_ENTRY_LUA_000003 = GetResString("ABANDONEDCITY_ENTRY_LUA_000003")
    ABANDONEDCITY_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY_ENTRY_LUA_000002")
    Notice(ABANDONEDCITY_ENTRY_LUA_000002..posx..","..posy..ABANDONEDCITY_ENTRY_LUA_000003) 

end

function after_player_login_abandonedcity(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    ABANDONEDCITY_ENTRY_LUA_000001 = GetResString("ABANDONEDCITY_ENTRY_LUA_000001")
    ABANDONEDCITY_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY_ENTRY_LUA_000002")
    ChaNotice(player_name, ABANDONEDCITY_ENTRY_LUA_000002..posx..","..posy..ABANDONEDCITY_ENTRY_LUA_000001) --֪ͨ������������������

end

--���ڼ���������
--����ֵ��0�����������������1���ɹ����롣
function check_can_enter_abandonedcity(role, copy_mgr)

	local Cha = TurnToCha(role)
  
	if Lv(Cha) >=30 and Lv(Cha) <=45 then
	
		-- local Num
		-- Num = CheckBagItem(Cha, 1812)
        	
		-- if Num >= 1 then
			return 1
	
		-- else
			-- SystemNotice(role, "û�йŴ���λ�ǣ��޷���ȷͨ��쫷絽����֮��")
			-- return 0
		-- end
		
	else
		ABANDONEDCITY_ENTRY_LUA_000004 = GetResString("ABANDONEDCITY_ENTRY_LUA_000004")
		SystemNotice(role, ABANDONEDCITY_ENTRY_LUA_000004)
		return 0    
	end
end



function begin_enter_abandonedcity(role, copy_mgr) 

	-- local Cha = TurnToCha(role)	
	-- local Dbag = 0
	-- Dbag = DelBagItem(Cha, 1812, 1)

	-- if Dbag == 1 then
		ABANDONEDCITY_ENTRY_LUA_000005 = GetResString("ABANDONEDCITY_ENTRY_LUA_000005")
		SystemNotice(role,ABANDONEDCITY_ENTRY_LUA_000005) 
		ABANDONEDCITY_ENTRY_LUA_000006 = GetResString("ABANDONEDCITY_ENTRY_LUA_000006")
		MoveCity(role, ABANDONEDCITY_ENTRY_LUA_000006)

	-- else
	
		-- SystemNotice(role, "��ȡ�Ŵ���λ��ʧ�ܣ��޷���ȷͨ��쫷絽����֮��")
	-- end


end
