--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺

function config(map)
    MapCanSavePos(map, 0) --���õ�ͼ�Ƿ񱣴��ɫλ�ã���ͼ�����꣬���򣩣�������Ӱ��õ�ͼ�����и���
    -----MapCanPK(map, 0) --���õ�ͼ�Ƿ����PK��������Ӱ��õ�ͼ�����и���
    MapCopyNum(map, 1) --���õ�ͼ�ĸ�����Ŀ����������ø���䣬��ʹ��Ĭ��ֵ1
    SingleMapCopyPlyNum(map, 300)   --����һ�������������
    MapCanTeam(map , 1)
    MapType ( map , 1 )
end


function get_map_entry_pos_garner3()   --������ڵ�λ�õ����꣨���꣨�ף���

	local POS_X=100
	local POS_Y=100
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "garner2") --������ڵ�λ�ã���ͼ����
    SetMapEntryTime(map, "2006/10/18/14/0", "0/2/0", "0/0/30", "0/0/45") --������ڵ�ʱ�䣬��ͼ�����״ο���ʱ�䣨��/��/��/ʱ/�֣����Ժ��ٴο����ļ������/ʱ/�֣�ȫ����ʾֻ���״ο�������ÿ�ο����������ʧ�ļ������/ʱ/�֣�ȫ����ʾ������ʧ����ÿ�ο�������ͼ�رյļ������/ʱ/�֣�ȫ����ʾ�����رգ�����

end

function can_open_entry_garner2( map )
	local Now_Time = GetNowTime()
	if Now_Time == 2 or Now_Time == 4 or Now_Time == 6 or Now_Time == 8 or Now_Time == 10 or Now_Time == 12 or Now_Time == 14 or Now_Time == 16 or Now_Time == 18 or Now_Time == 20 or Now_Time == 22 or Now_Time == 24 then
		return 1
	else
		return 1
	end

end
