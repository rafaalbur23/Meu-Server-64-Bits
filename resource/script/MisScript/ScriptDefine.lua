--------------------------------------------------------------------------
--									--
--									--
--				ScriptDefine.lua 			--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading ScriptDefine.lua" )


--设置服务器地图名称信息，自动生成地图唯一ID
InitMap()
CALCULATE_EXP_AND_LEVEL_LUA_000011 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000011")
AddMap( "garner", CALCULATE_EXP_AND_LEVEL_LUA_000011 ) --ID = 1
MISSCRIPT_SCRIPTDEFINE_LUA_000001 = GetResString("MISSCRIPT_SCRIPTDEFINE_LUA_000001")
AddMap( "magicsea",MISSCRIPT_SCRIPTDEFINE_LUA_000001 ) --ID = 2
CALCULATE_EXP_AND_LEVEL_LUA_000017 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000017")
AddMap( "darkblue", CALCULATE_EXP_AND_LEVEL_LUA_000017 ) --ID = 3
CALCULATE_EXP_AND_LEVEL_LUA_000018 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000018")
AddMap( "eastgoaf", CALCULATE_EXP_AND_LEVEL_LUA_000018 ) --ID = 4
CALCULATE_EXP_AND_LEVEL_LUA_000019 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000019")
AddMap( "lonetower", CALCULATE_EXP_AND_LEVEL_LUA_000019 ) --ID = 5
CALCULATE_EXP_AND_LEVEL_LUA_000020 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000020")
AddMap( "secretgarden", CALCULATE_EXP_AND_LEVEL_LUA_000020 ) --ID = 6
DARKSWAMP_ENTRY_LUA_000004 = GetResString("DARKSWAMP_ENTRY_LUA_000004")
AddMap( "darkswamp", DARKSWAMP_ENTRY_LUA_000004 ) --ID = 7
ABANDONEDCITY_ENTRY_LUA_000006 = GetResString("ABANDONEDCITY_ENTRY_LUA_000006")
AddMap( "abandonedcity", ABANDONEDCITY_ENTRY_LUA_000006 ) --ID = 8
ABANDONEDCITY2_ENTRY_LUA_000001 = GetResString("ABANDONEDCITY2_ENTRY_LUA_000001")
AddMap( "abandonedcity2", ABANDONEDCITY2_ENTRY_LUA_000001 ) --ID = 9
ABANDONEDCITY3_ENTRY_LUA_000002 = GetResString("ABANDONEDCITY3_ENTRY_LUA_000002")
AddMap( "abandonedcity3", ABANDONEDCITY3_ENTRY_LUA_000002 ) --ID = 10
PUZZLEWORLD_ENTRY_LUA_000007 = GetResString("PUZZLEWORLD_ENTRY_LUA_000007")
AddMap( "puzzleworld", PUZZLEWORLD_ENTRY_LUA_000007 ) --ID = 11
PUZZLEWORLD2_ENTRY_LUA_000002 = GetResString("PUZZLEWORLD2_ENTRY_LUA_000002")
AddMap( "puzzleworld2", PUZZLEWORLD2_ENTRY_LUA_000002 ) --ID = 12
CALCULATE_EXP_AND_LEVEL_LUA_000021 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000021")
AddMap( "teampk", CALCULATE_EXP_AND_LEVEL_LUA_000021 ) --ID = 13
BIRTH_BIRTH_CONF_LUA_000048 = GetResString("BIRTH_BIRTH_CONF_LUA_000048")
AddMap( "jialebi", BIRTH_BIRTH_CONF_LUA_000048 ) --ID = 14
GARNER2_ENTRY_LUA_000014 = GetResString("GARNER2_ENTRY_LUA_000014")
AddMap( "garner2", GARNER2_ENTRY_LUA_000014 ) --ID = 15
HELL_ENTRY_LUA_000005 = GetResString("HELL_ENTRY_LUA_000005")
AddMap( "hell", HELL_ENTRY_LUA_000005 ) --ID = 16
HELL2_ENTRY_LUA_000005 = GetResString("HELL2_ENTRY_LUA_000005")
AddMap( "hell2", HELL2_ENTRY_LUA_000005 ) --ID = 17
HELL3_ENTRY_LUA_000003 = GetResString("HELL3_ENTRY_LUA_000003")
AddMap( "hell3", HELL3_ENTRY_LUA_000003 ) --ID = 18
HELL4_ENTRY_LUA_000003 = GetResString("HELL4_ENTRY_LUA_000003")
AddMap( "hell4", HELL4_ENTRY_LUA_000003 ) --ID = 19
HELL5_ENTRY_LUA_000006 = GetResString("HELL5_ENTRY_LUA_000006")
AddMap( "hell5", HELL5_ENTRY_LUA_000006 ) --ID = 20
CALCULATE_EXP_AND_LEVEL_LUA_000027 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000027")
AddMap( "guildwar", CALCULATE_EXP_AND_LEVEL_LUA_000027 ) --ID = 21
LEITING2_ENTRY_LUA_000008 = GetResString("LEITING2_ENTRY_LUA_000008")
AddMap( "leiting2", LEITING2_ENTRY_LUA_000008 ) --ID = 22
BIRTH_BIRTH_CONF_LUA_000050 = GetResString("BIRTH_BIRTH_CONF_LUA_000050")
AddMap( "shalan2", BIRTH_BIRTH_CONF_LUA_000050 ) --ID = 23
BINGLANG2_ENTRY_LUA_000010 = GetResString("BINGLANG2_ENTRY_LUA_000010")
AddMap( "binglang2", BINGLANG2_ENTRY_LUA_000010 ) --ID = 24
CALCULATE_EXP_AND_LEVEL_LUA_000028 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000028")
AddMap( "guildwar2", CALCULATE_EXP_AND_LEVEL_LUA_000028 ) --ID = 25
BIRTH_BIRTH_CONF_LUA_000051 = GetResString("BIRTH_BIRTH_CONF_LUA_000051")
AddMap( "yschurch", BIRTH_BIRTH_CONF_LUA_000051 ) --ID = 26
A07XMAS_ENTRY_LUA_000005 = GetResString("A07XMAS_ENTRY_LUA_000005")
AddMap( "07xmas", A07XMAS_ENTRY_LUA_000005 ) --ID = 27
CALCULATE_EXP_AND_LEVEL_LUA_000029 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000029")
AddMap( "sdBoss", CALCULATE_EXP_AND_LEVEL_LUA_000029 ) --ID = 28
A07XMAS2_ENTRY_LUA_000005 = GetResString("A07XMAS2_ENTRY_LUA_000005")
AddMap( "07xmas2", A07XMAS2_ENTRY_LUA_000005 ) --ID = 29
BIRTH_BIRTH_CONF_LUA_000052 = GetResString("BIRTH_BIRTH_CONF_LUA_000052")
AddMap( "prisonisland", BIRTH_BIRTH_CONF_LUA_000052 ) --ID = 30
CALCULATE_EXP_AND_LEVEL_LUA_000030 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000030")
AddMap( "starena1", CALCULATE_EXP_AND_LEVEL_LUA_000030 ) --ID = 31
CALCULATE_EXP_AND_LEVEL_LUA_000031 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000031")
AddMap( "starena2", CALCULATE_EXP_AND_LEVEL_LUA_000031 ) --ID = 32
CALCULATE_EXP_AND_LEVEL_LUA_000032 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000032")
AddMap( "starena3", CALCULATE_EXP_AND_LEVEL_LUA_000032 ) --ID = 33
BIRTH_BIRTH_CONF_LUA_000053 = GetResString("BIRTH_BIRTH_CONF_LUA_000053")
AddMap( "winterland", BIRTH_BIRTH_CONF_LUA_000053 ) --ID = 34
CALCULATE_EXP_AND_LEVEL_LUA_000033 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000033")
AddMap( "mjing1", CALCULATE_EXP_AND_LEVEL_LUA_000033 ) --ID = 35
CALCULATE_EXP_AND_LEVEL_LUA_000034 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000034")
AddMap( "mjing2", CALCULATE_EXP_AND_LEVEL_LUA_000034 ) --ID = 36
CALCULATE_EXP_AND_LEVEL_LUA_000035 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000035")
AddMap( "mjing3", CALCULATE_EXP_AND_LEVEL_LUA_000035 ) --ID = 37
CALCULATE_EXP_AND_LEVEL_LUA_000036 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000036")
AddMap( "mjing4", CALCULATE_EXP_AND_LEVEL_LUA_000036 ) --ID = 38
CALCULATE_EXP_AND_LEVEL_LUA_000037 = GetResString("CALCULATE_EXP_AND_LEVEL_LUA_000037")
AddMap( "mingyun", CALCULATE_EXP_AND_LEVEL_LUA_000037 ) --ID = 39
CALCULATE_FUNCTIONS_LUA_000327 = GetResString("CALCULATE_FUNCTIONS_LUA_000327")
AddMap( "starena13", "Arena 1A" ) --ID = 40
AddMap( "starena14", "Arena 1B" ) --ID = 41
AddMap( "starena15", "Arena 1C" ) --ID = 42
AddMap( "starena23", "Arena 2A" ) --ID = 43
AddMap( "starena24", "Arena 2B" ) --ID = 44
AddMap( "starena25", "Arena 2C" ) --ID = 45
AddMap( "starena33", "Arena 3A" ) --ID = 46
AddMap( "starena34", "Arena 3B" ) --ID = 47
AddMap( "starena35", "Arena 3C" ) --ID = 48
AddMap( "PKmap", "PKmap" ) --ID = 49
AddMap( "DreamIsland", "Continent of Dreams" )--50
AddMap( "starwalkway", "Starry Sky Alley" )
AddMap( "L4MAP", "L4MAP" )--53
AddMap( "Hellchapter", "Hell Chapter" ) --ID = 81
	tribInst.addmap = function()
		AddMap(tribInst.map[1], "Tribulation 1")
		AddMap(tribInst.map[2], "Tribulation 2")
		AddMap(tribInst.map[3], "Tribulation 3")
		AddBirthPoint("Tribulation 1", tribInst.map[1], 89,43)
		AddBirthPoint("Tribulation 1", tribInst.map[1], 84,43)
		AddBirthPoint("Tribulation 1", tribInst.map[1], 84,38)
		AddBirthPoint("Tribulation 1", tribInst.map[1], 89,38)
		AddBirthPoint("Tribulation 2", tribInst.map[2], 89,43)
		AddBirthPoint("Tribulation 2", tribInst.map[2], 84,43)
		AddBirthPoint("Tribulation 2", tribInst.map[2], 84,38)
		AddBirthPoint("Tribulation 2", tribInst.map[2], 89,38)
		AddBirthPoint("Tribulation 3", tribInst.map[3], 89,43)
		AddBirthPoint("Tribulation 3", tribInst.map[3], 84,43)
		AddBirthPoint("Tribulation 3", tribInst.map[3], 84,38)
		AddBirthPoint("Tribulation 3", tribInst.map[3], 89,38)
		AddBirthPoint("Tribulation Admin", "darkblue", 1300,530)
		AddBirthPoint("Tribulation 3 Center", "kyjj_3", 68, 58)
	end
	tribInst.addmap();