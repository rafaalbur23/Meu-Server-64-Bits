--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺

function config(map)
	MapCanSavePos(map, 0) --���õ�ͼ�Ƿ񱣴��ɫλ�ã���ͼ�����꣬���򣩣�������Ӱ��õ�ͼ�����и���
    MapCanPK(map, 1) --���õ�ͼ�Ƿ����PK��������Ӱ��õ�ͼ�����и���
    --MapCopyNum(map, 1) --���õ�ͼ�ĸ�����Ŀ����������ø���䣬��ʹ��Ĭ��ֵ1
    MapCanTeam( map, 1 )
    MapType( map , 3 )
    MapCopyStartType( map , 1 )
	MapCanStall(map , 0)
end


function get_map_entry_pos_starena24()   --������ڵ�λ�õ����꣨���꣨�ף���
local POS_X=0
	local POS_Y=0
	return POS_X , POS_Y
end

function init_entry(map)

end

function after_enter_starena24( role , map_copy )
	
end

function before_leave_starena24( role )
end

function map_copy_first_run_starena24( map_copy )
	
end

function map_copy_run_starena24( map_copy )
	JJC24(map_copy)
end

--ÿ5��ִ��һ�ε�


function map_run_starena24( map )




end

--��ͼ�ر�ʱִ��
function map_copy_close_starena24 ( map_copy )
end
		
--��ͼ�����жϡ�����������������������������������������������������������������������������������

function can_open_entry_starena24( map ) 
end 
