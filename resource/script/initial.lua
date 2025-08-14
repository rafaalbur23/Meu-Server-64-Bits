_G["0"] = function(e) end
_G["event_cha_lifetime"] = function(e) end
_G["TigerStart"] = function(e) end
print("loading initial.lua")

AdjustTextSpace = function(Text, Spaces, End)
    local Count = math.floor((Spaces - string.len(Text)) * 0.5)
    local Message = ""
    for C = 1, Count, 1 do
        Message = Message.." "
    end
    Message = Message..Text
    Count = math.floor(Spaces - string.len(Message))
    for C = 1, Count, 1 do
        Message = Message.." "
    end
    if End ~= nil then
        Message = Message..End
    end
    return Message
end

	
		GetPlayerKey = function(role)
		local hex,name = '', GetPlayerID(GetChaPlayer(role))
		while string.len(name) > 0 do
		local hb = string.format("%X", string.byte(name, 1, 1))
		if string.len(hb) < 2 then 
			hb = '0' .. hb 
		end        
			hex = hex .. hb        
			name = string.sub(name, 2)
		end    
		return hex
	end
	print("* Loading BTH Function - GetPlayerKey created!")
	

	
		math_round = function(val, decimal)
		if (decimal) then
			return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
		else
			return math.floor(val+0.5)
		end
	end
	print("* Loading BTH Function - math_round created!")
	
	
function ToClockFormat(sec)
    local num = tonumber(sec)
    if(num == 0) then
        return "00:00:00"
    else
        now_hour = string.format("%02.f",math.floor(num / 3600 ))
        now_minute = string.format("%02.f",math.floor(num / 60 - (now_hour*60)))
        now_second = string.format("%02.f",math.floor(num - now_hour*3600 - now_minute*60))
        return tonumber(now_hour)..":"..tonumber(now_minute)..":"..tonumber(now_second)..""
    end
end
file_exists = file_exists or function(name)
	local f = io.open(name,"r")
	if(f ~= nil)then
		io.close(f)
		return true
	else
		return false
	end
end



if package ~= nil then
	local path = ";.\\lua\\luarock\\?.lua;.\\lua\\luarock\\?\\?.lua"
	local cpath = ";.\\lua\\luarock\\?.dll;.\\lua\\luarock\\?\\?.dll"
	if string.find(package.path,path) == nil then
		package.path = package.path .. path
	end
	if string.find(package.cpath,cpath) == nil then
		package.cpath = package.cpath .. cpath
	end
end

table.getn = function (t)
	if t.n then
		return t.n
	else
		local n = 0
		for i in pairs(t) do
			if type(i) == "number" then
				n = math.max(n, i)
			end
		end
		return n
	end
end

function start_debug()
	local status, err = pcall(require, "mobdebug")
	if package.loaded.mobdebug then 
		package.loaded.mobdebug.start()
	end
end




function error_catch(err)
	local traceback = debug.traceback()
	print(err)
	LG("lua_err", err)
	print(traceback)
	LG("lua_err", traceback)
end
	
function safe_call(f, arg)
	local ret = { xpcall(f, error_catch, unpack(arg)) }
	local status = ret[1]
	if status == true then
		table.remove(ret, 1)
		return unpack(ret)
	end
	return nil
end

function safe_wrap(f_name)
	local fct = _G[f_name]
	if fct ~= nil then
		_G[f_name] = function (arg)
			return safe_call(fct, unpack(arg))
		end
	end
end

split = function(str, delim, maxNb)
	if string.find(str, delim) == nil then
		return { str }
	end
	if maxNb == nil or maxNb < 1 then
		maxNb = 0
	end
	local result = {}
	local pat = "(.-)" .. delim .. "()"
	local nb = 0
	local lastPos
	for part, pos in string.gfind(str, pat) do
		nb = nb + 1
		result[nb] = part
		lastPos = pos
		if nb == maxNb then
			break
		end
	end
	if nb ~= maxNb then
		result[nb + 1] = string.sub(str, lastPos)
	end
	return result
end

	BTHLG = function(filename,text)
		local EclLog = {}
		EclLog.path	= GetResPath("script/BthLG/")
		local file	= EclLog.path..filename..".txt"
		LogFile		= io.open(file,'a')
		LogFile:write(""..text.."\n")
		--LogFile:write("["..os.date().."]\t"..text.."\n")
		LogFile:close()
	end
	print("* Loading BTH Function - BTHLG created!")