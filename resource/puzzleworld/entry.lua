--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    PUZZLEWORLD_ENTRY_LUA_000001 = GetResString("PUZZLEWORLD_ENTRY_LUA_000001")
    PUZZLEWORLD_ENTRY_LUA_000002 = GetResString("PUZZLEWORLD_ENTRY_LUA_000002")
    Notice(PUZZLEWORLD_ENTRY_LUA_000002..posx..","..posy..PUZZLEWORLD_ENTRY_LUA_000001) --֪ͨ������������������
end

function after_destroy_entry_puzzleworld(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    PUZZLEWORLD_ENTRY_LUA_000003 = GetResString("PUZZLEWORLD_ENTRY_LUA_000003")
    Notice(PUZZLEWORLD_ENTRY_LUA_000003) 

end

function after_player_login_puzzleworld(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    PUZZLEWORLD_ENTRY_LUA_000004 = GetResString("PUZZLEWORLD_ENTRY_LUA_000004")
    PUZZLEWORLD_ENTRY_LUA_000002 = GetResString("PUZZLEWORLD_ENTRY_LUA_000002")
    ChaNotice(player_name, PUZZLEWORLD_ENTRY_LUA_000002..posx..","..posy..PUZZLEWORLD_ENTRY_LUA_000004) --֪ͨ������������������

end









--���ڼ���������
--����ֵ��0�����������������1���ɹ����롣
function check_can_enter_puzzleworld( role, copy_mgr )
	if Lv(role) >=50 then
			return 1
				
	else
		PUZZLEWORLD_ENTRY_LUA_000005 = GetResString("PUZZLEWORLD_ENTRY_LUA_000005")
		SystemNotice(role, PUZZLEWORLD_ENTRY_LUA_000005)
		return 0    
	end
end

function begin_enter_puzzleworld(role, copy_mgr) 
    
		PUZZLEWORLD_ENTRY_LUA_000006 = GetResString("PUZZLEWORLD_ENTRY_LUA_000006")
		SystemNotice(role,PUZZLEWORLD_ENTRY_LUA_000006) 
		PUZZLEWORLD_ENTRY_LUA_000007 = GetResString("PUZZLEWORLD_ENTRY_LUA_000007")
		MoveCity(role, PUZZLEWORLD_ENTRY_LUA_000007)
	
end
