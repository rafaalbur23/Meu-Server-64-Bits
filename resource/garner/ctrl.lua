--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Garner Ctrl.lua" )


--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺

function config(map)
    MapCanPK(map, 0)			-- 1 = Turns on PK Mouse Sword Icon // 0 = Turns off PK Mouse Sword Icon ( Need to press CTRL key )
--    MapType ( map , 3 )			-- 0 = PvP Off // 1 = PvP Off // 2 = PvP On ( Not allowed to kill Guild and Party Mates ) // 3 = PvP On ( Allowed to kill any player but not Party Mates ) // 4 = PvP On ( Not allowed to kill Guild and Party Mates )        
end


function get_map_entry_pos_garner()   --������ڵ�λ�õ����꣨���꣨�ף���

end

function init_entry(map)

end

function after_enter_garner( role , map_copy )
end

function before_leave_garner( role )
end

function map_copy_first_run_garner( map_copy )

end

function map_copy_run_garner( map_copy )
end

--ÿ5��ִ��һ�ε�
function map_run_garner( map )
end

--��ͼ�ر�ʱִ��
function map_copy_close_garner ( map_copy )
end
		
--��ͼ�����жϡ�����������������������������������������������������������������������������������

function can_open_entry_garner( map ) 
end 