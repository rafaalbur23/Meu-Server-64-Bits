print("Loading ModuleStatev")

ModuleStatev = {}

function SetCharaStatev(Value, Player, Attr, Type)
	local PID = GetCharID(Player)	
	local star = 0
	local star = GetChaAttr(Player, Attr)
	if not ModuleStatev[PID] then
		ModuleStatev[PID] = {}
		ModuleStatev[PID][ATTR_STATEV_STR] = {}
		ModuleStatev[PID][ATTR_STATEV_CON] = {}
		ModuleStatev[PID][ATTR_STATEV_STA] = {}
		ModuleStatev[PID][ATTR_STATEV_DEX] = {}
		ModuleStatev[PID][ATTR_STATEV_AGI] = {}
		ModuleStatev[PID][ATTR_STATEV_LUK] = {}
		ModuleStatev[PID][ATTR_STATEV_MF] = {}
		ModuleStatev[PID][ATTR_STATEV_DEF] = {}
		ModuleStatev[PID][ATTR_STATEV_HREC] = {}
		ModuleStatev[PID][ATTR_STATEV_SREC] = {}
		ModuleStatev[PID][ATTR_STATEV_PDEF] = {}
		ModuleStatev[PID][ATTR_STATEV_MSPD] = {}
		ModuleStatev[PID][ATTR_STATEV_MXHP] = {}
		ModuleStatev[PID][Attr][Type] = Value
		star = (star + Value)		
		SetCharaAttr(star, Player, Attr)
	else
		if ModuleStatev[PID][Attr] then
			if ModuleStatev[PID][Attr][Type] then
				ModuleStatev[PID][Attr][Type] = Value
			else
				ModuleStatev[PID][Attr][Type] = Value
			end
			star = (star + Value)
			SetCharaAttr(star, Player, Attr)
		end
	end
end

function RemCharaStatev(Value, Player, Attr, Type)
	local PID = GetCharID(Player)	
	local star = 0
	local star = GetChaAttr(Player, Attr)
	if (not ModuleStatev[PID]) then
		ModuleStatev[PID] = {}
		ModuleStatev[PID][ATTR_STATEV_STR] = {}
		ModuleStatev[PID][ATTR_STATEV_CON] = {}
		ModuleStatev[PID][ATTR_STATEV_STA] = {}
		ModuleStatev[PID][ATTR_STATEV_DEX] = {}
		ModuleStatev[PID][ATTR_STATEV_AGI] = {}
		ModuleStatev[PID][ATTR_STATEV_LUK] = {}
		ModuleStatev[PID][ATTR_STATEV_MF] = {}
		ModuleStatev[PID][ATTR_STATEV_DEF] = {}
		ModuleStatev[PID][ATTR_STATEV_HREC] = {}
		ModuleStatev[PID][ATTR_STATEV_SREC] = {}
		ModuleStatev[PID][ATTR_STATEV_PDEF] = {}
		ModuleStatev[PID][ATTR_STATEV_MSPD] = {}
		ModuleStatev[PID][ATTR_STATEV_MXHP] = {}
		ModuleStatev[PID][Attr][Type] = Value
		star = (star + Value)		
		SetCharaAttr(star, Player, Attr)
	else
		if ModuleStatev[PID][Attr] then
			if ModuleStatev[PID][Attr][Type] then
				star = (star - ModuleStatev[PID][Attr][Type])
				ModuleStatev[PID][Attr][Type] = nil
			end
			SetCharaAttr(star, Player, Attr)
		end
	end
end	