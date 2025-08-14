--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,4) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������
end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    DARKSWAMP_ENTRY_LUA_000001 = GetResString("DARKSWAMP_ENTRY_LUA_000001")
    ABANDONEDCITY_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY_ENTRY_LUA_000002")
    Notice(ABANDONEDCITY_ENTRY_LUA_000002..posx..","..posy..DARKSWAMP_ENTRY_LUA_000001) --֪ͨ������������������
end

function after_destroy_entry_darkswamp(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    ABANDONEDCITY_ENTRY_LUA_000003 = GetResString("ABANDONEDCITY_ENTRY_LUA_000003")
    ABANDONEDCITY_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY_ENTRY_LUA_000002")
    Notice(ABANDONEDCITY_ENTRY_LUA_000002..posx..","..posy..ABANDONEDCITY_ENTRY_LUA_000003) 

end

function after_player_login_darkswamp(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    DARKSWAMP_ENTRY_LUA_000001 = GetResString("DARKSWAMP_ENTRY_LUA_000001")
    ABANDONEDCITY_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY_ENTRY_LUA_000002")
    ChaNotice(player_name, ABANDONEDCITY_ENTRY_LUA_000002..posx..","..posy..DARKSWAMP_ENTRY_LUA_000001) --֪ͨ������������������
end


--���ڼ���������
--����ֵ��0�����������������1���ɹ����롣
function check_can_enter_darkswamp( role, copy_mgr )
    local Cha = TurnToCha(role)
  
	if Lv(Cha) >=40 and Lv(Cha) <=55 then
		
		return 1
		
	else
		DARKSWAMP_ENTRY_LUA_000002 = GetResString("DARKSWAMP_ENTRY_LUA_000002")
		SystemNotice(role, DARKSWAMP_ENTRY_LUA_000002)
		return 0
	end
end


function begin_enter_darkswamp(role, copy_mgr) 

	DARKSWAMP_ENTRY_LUA_000003 = GetResString("DARKSWAMP_ENTRY_LUA_000003")
	SystemNotice(role,DARKSWAMP_ENTRY_LUA_000003) 
	DARKSWAMP_ENTRY_LUA_000004 = GetResString("DARKSWAMP_ENTRY_LUA_000004")
	MoveCity(role, DARKSWAMP_ENTRY_LUA_000004)
end 
