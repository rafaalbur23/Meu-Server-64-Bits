--此文件在GameServer全部地图初始化完成后, 执行一次


function PM(monster)
    local filename = "script/monster/"..monster..".lua"
    LG("init", "执行怪物摆放", filename)
    dofile(GetResPath(filename))
end

local m = SetCurMap("garner")

if m==1 then --如果此服务器上地图存在
    local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
    PM("baiyinlinqu")
    PM("lietinglinqu")
    PM("baiyinyuchang")
    PM("jianazuixiayuchang")
    PM("haifengyuchang")
    PM("jianayunshi")
    PM("bycduizhang")
    PM("bycdaoguai")
	
--	if CheckDateNum >= 8122200  then
--		if CheckDateNum <= 9010923 then
--			PM("baiyinhuoji")
--			PM("baiyinxieemilu")
--			PM("xuerenbaiyin")
--		end
--	end
--    PM("baiyinhuoji")
--    PM("baiyinxieemilu")
--    PM("xuerenbaiyin")

    LG("init", "garner脚本放怪结束!")
end


m = SetCurMap("magicsea")
if m==1 then --如果此服务器上地图存在
    local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	PM("monvzhihaimeirenyuwang")

    PM("mingshapaota")
    PM("monv480")
    PM("shalanyuchang")
    PM("mingshayuchang")
    PM("shalanlinqu")
    PM("shalanmingshaxian")
    PM("shaxie")
    PM("shalanyunshi")
    PM("slcdaoguai")
    PM("slcduizhang")
    PM("WriteSheepKiper")
    PM("JinNiuKiper")
    PM("ShuangZiKiper")
    PM("juxieKiper")
--	if CheckDateNum >= 8122200  then
--		if CheckDateNum <= 9010923 then
--			PM("shalanhuoji")
--			PM("shalanxieemilu")
--			PM("xuerenshalan")
--		end
--	end
		-- PM("shalanhuoji")
		-- PM("shalanxieemilu")
		-- PM("xuerenshalan")
		-- PM("huojishalan")   

    LG("init", "magicsea脚本放怪结束!")
end

m = SetCurMap("darkblue")
if m==1 then --如果此服务器上地图存在
    local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local Now_Year = os.date("%y")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local NowYearNum = tonumber(Now_Year)
	local CheckDateNum = NowYearNum * 1000000 + NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
    PM("binglanglinqu")
    PM("binglangyuchang")
    PM("binglangyunshi")
    PM("chundaoguai")
    PM("qiudaoguai")
    PM("xiadaoguai")
    PM("blbdaoguai")
    PM("blbduizhang")
   -- PM("qiuxiang")
--    PM("binglanghuoji")
--    PM("binglangxieemilu")
--    PM("xuerenbinglang")
--	if CheckDateNum >= 8122200  then
--		if CheckDateNum <= 9010923 then
--			PM("binglanghuoji")
--			PM("binglangxieemilu")
--			PM("xuerenbinglang")
--		end
--	end
    LG("init", "darkblue脚本放怪结束!")
end

m = SetCurMap("lonetower")
if m==1 then --如果此服务器上地图存在

    PM("jimozhita")

    LG("init", "lonetower脚本放怪结束!")
end

m = SetCurMap("secretgarden")
if m==1 then --如果此服务器上地图存在

    PM("HY_RedSide")

    LG("init" , "secretgarden红方脚本放怪结束!")
end

m = SetCurMap("secretgarden")
if m==1 then --如果此服务器上地图存在

    PM("HY_BlueSide")

    LG("init" , "secretgarden蓝方脚本放怪结束!")
end

m = SetCurMap("secretgarden")
if m==1 then --如果此服务器上地图存在

    PM("PK_Monsters")

    LG("init" , "secretgarden中立脚本放怪结束!")
end

m = SetCurMap("eastgoaf")
if m==1 then --如果此服务器上地图存在
    PM("haidisuidao")
    PM("xiashuidao")
    PM("heilong1")
    PM("heilong2")
    LG("init", "eastgoaf脚本放怪结束!")
end

m = SetCurMap("guildwar")
if m==1 then --如果此服务器上地图存在
    PM("haidaohaijun_side")
    
    LG("init", "haidaohaijun_side脚本放怪结束!")
end


m = SetCurMap("guildwar2")
if m==1 then --如果此服务器上地图存在
    PM("haidaohaijun_side2")
    
    LG("init", "haidaohaijun_side2脚本放怪结束!")
end

m = SetCurMap("guildwar")
if m==1 then --如果此服务器上地图存在
    PM("yeguai_guildwar")
    
    LG("init", "yeguai_guildwar脚本放怪结束!")
end

m = SetCurMap("guildwar2")
if m==1 then --如果此服务器上地图存在
    PM("yeguai_guildwar2")
    
    LG("init", "yeguai_guildwar2脚本放怪结束!")
end

m = SetCurMap("07xmas2")
if m==1 then --如果此服务器上地图存在
    PM("xieeshengdan")
    
    LG("init", "xieeshengdan脚本放怪结束!")
end

m = SetCurMap("sdBoss")
if m==1 then --如果此服务器上地图存在
    
    PM("sd_jingjichang")
    

    LG("init", "sdBoss脚本放怪结束!")
end
