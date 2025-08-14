--------------------------------------------------------------------------
--									--
--									--
--				ai_define.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Ai_Define.lua" )
print( "------------------------------------" )


CHANGE_TARGET_RATIO = 50

AI_NONE        =  0
AI_N_ATK       =  1
AI_FLEE        =  2
AI_MOVETOHOST  =  4
AI_R_ATK       =  5
AI_ATK         = 10
AI_ATK_FLEE    = 11

MWHH = 21
MWYH = 22
MWXS = 23
MWBK = 24
MWFH = 25
MWJW = 26
MWLH = 27
MWHS = 28
MWHDS = 29
MHKL = 30

ai_flag_summon = {}
ai_flag_pick   = {}
ai_flag_nohide = {}

ai_flag_summon[45]  = 1 --Sand Bandit
ai_flag_summon[49]  = 1 --Sand Raider
ai_flag_summon[93]  = 1 --Bandit
ai_flag_summon[101] = 1 --Starving Wolf
ai_flag_summon[102] = 1 --Feral Wolf
ai_flag_summon[131] = 1 --Sand Brigand
ai_flag_summon[136] = 1 --Grassland Wolf
ai_flag_summon[137] = 1 --Snowy Wolf
ai_flag_summon[200] = 1 --Cavalier

ai_flag_pick[82] = 1 
ai_flag_pick[32] = 1
ai_flag_pick[33] = 1
ai_flag_pick[34] = 1 

--Forsaken City
ai_flag_nohide[712] = 1 --Abandoned Chest 1
ai_flag_nohide[713] = 1 --Abandoned Chest 2
ai_flag_nohide[714] = 1 --Abandoned Chest 3
ai_flag_nohide[673] = 1 --Death Knight

--Dark Swamp
ai_flag_nohide[709] = 1 --Obscure Chest 1
ai_flag_nohide[710] = 1 --Obscure Chest 2
ai_flag_nohide[711] = 1 --Obscure Chest 3
ai_flag_nohide[675] = 1 --Huge Mud Monster

--Demoniac World
ai_flag_nohide[715] = 1 --Chest of Demonic World 1
ai_flag_nohide[716] = 1 --Chest of Demonic World 2
ai_flag_nohide[717] = 1 --Chest of Demonic World 3
ai_flag_nohide[679] = 1 --Wandering Soul
ai_flag_nohide[678] = 1 --Snowman Warlord

--Guild War
ai_flag_nohide[728] = 1 --Blue Base
ai_flag_nohide[729] = 1 --Red Base
ai_flag_nohide[730] = 1 --Basic Blue Guard Tower
ai_flag_nohide[731] = 1 --Basic Red Guard Tower
ai_flag_nohide[739] = 1 --Advance Blue Guard Tower
ai_flag_nohide[740] = 1 --Advance Red Guard Tower
ai_flag_nohide[741] = 1 --Wolfman Archer
ai_flag_nohide[742] = 1 --Blue Team Granary
ai_flag_nohide[743] = 1 --Red Team Granary
ai_flag_nohide[744] = 1 --Blue Team Warehouse
ai_flag_nohide[745] = 1 --Red Team Warehouse

--Sacred War
ai_flag_nohide[933] = 1	--Medusa
ai_flag_nohide[936] = 1 --Pirate Defense Tower
ai_flag_nohide[953] = 1 --Pirate Devil Tower
ai_flag_nohide[954] = 1 --Navy Statue
ai_flag_nohide[955] = 1 --Pirate Statue
ai_flag_nohide[993] = 1 --Navy Granary
ai_flag_nohide[994] = 1 --Pirate Granary
ai_flag_nohide[995] = 1 --Navy Ammo Warehouse
ai_flag_nohide[996] = 1 --Pirate Ammo Warehouse
ai_flag_nohide[997] = 1 --Navy Cannon Tower
ai_flag_nohide[998] = 1 --Pirate Cannon Tower
ai_flag_nohide[1001] = 1 --Victory Goddess
ai_flag_nohide[1003] = 1 --Navy Tower
ai_flag_nohide[1004] = 1 --Pirate Tower
ai_flag_nohide[1005] = 1 --Navy Defense Tower
ai_flag_nohide[1006] = 1 --Navy Devil Tower
ai_flag_nohide[1007] = 1 --Navy Guardian
ai_flag_nohide[1008] = 1 --Pirate Guardian
ai_flag_nohide[1010] = 1 --Navy Advanced Tower
ai_flag_nohide[1011] = 1 --Pirate Advanced Tower
ai_flag_nohide[1012] = 1 --Medusa
ai_flag_nohide[1015] = 1 --Pirate Defense Tower
ai_flag_nohide[1016] = 1 --Pirate Devil Tower
ai_flag_nohide[1017] = 1 --Navy Statue
ai_flag_nohide[1018] = 1 --Pirate Statue
ai_flag_nohide[1019] = 1 --Navy Granary
ai_flag_nohide[1020] = 1 --Pirate Granary
ai_flag_nohide[1021] = 1 --Navy Ammo Warehouse
ai_flag_nohide[1022] = 1 --Pirate Ammo Warehouse
ai_flag_nohide[1023] = 1 --Navy Cannon Tower
ai_flag_nohide[1024] = 1 --Pirate Cannon Tower
ai_flag_nohide[1027] = 1 --Victory Goddess
ai_flag_nohide[1028] = 1 --Navy Tower
ai_flag_nohide[1029] = 1 --Pirate Tower
ai_flag_nohide[1030] = 1 --Navy Defense Tower
ai_flag_nohide[1031] = 1 --Navy Devil Tower
ai_flag_nohide[1032] = 1 --Navy Guardian
ai_flag_nohide[1033] = 1 --Pirate Guardian
ai_flag_nohide[1034] = 1 --Navy Advanced Tower
ai_flag_nohide[1035] = 1 --Pirate Advanced Tower

--Chaos Argent
ai_flag_nohide[859] = 1 --Novice Chaos Chest
ai_flag_nohide[860] = 1 --Standard Chaos Chest
ai_flag_nohide[861] = 1 --Expert Chaos Chest
ai_flag_nohide[868] = 1 --Lance Newbie Phantom
ai_flag_nohide[869] = 1 --Lance Hunter Phantom
ai_flag_nohide[870] = 1 --Lance Crusader Phantom
ai_flag_nohide[871] = 1 --Lance Voyager Phantom
ai_flag_nohide[872] = 1 --Carsise Newbie Phantom
ai_flag_nohide[873] = 1 --Carsise Swordsman Phantom
ai_flag_nohide[874] = 1 --Carsise Champion Phantom
ai_flag_nohide[875] = 1 --Phyllis Newbie Phantom
ai_flag_nohide[876] = 1 --Phyllis Explorer Phantom
ai_flag_nohide[877] = 1 --Phyllis Sharpshooter Phantom
ai_flag_nohide[878] = 1 --Phyllis Cleric Phantom
ai_flag_nohide[879] = 1 --Ami Newbie Phantom
ai_flag_nohide[880] = 1 --Ami Cleric Phantom
ai_flag_nohide[881] = 1 --Ami Seal Master Phantom
ai_flag_nohide[883] = 1 --Black Dragon Lance
ai_flag_nohide[884] = 1 --Black Dragon Carsise
ai_flag_nohide[885] = 1 --Black Dragon Phyllis
ai_flag_nohide[886] = 1 --Black Dragon Ami

--Abaddons
ai_flag_nohide[974] = 1 --Despair Knight - Saro
ai_flag_nohide[975] = 1 --Abyss Mudmonster - Karu
ai_flag_nohide[976] = 1 --Abyss Prisoner - Aruthur
ai_flag_nohide[977] = 1 --Abyss Demon - Sacrois
ai_flag_nohide[978] = 1 --Abyss Beast - Kuroo
ai_flag_nohide[979] = 1 --Abyss Lord - Phantom Baron
ai_flag_nohide[980] = 1 --Abyss Lord - Demon Flame
ai_flag_nohide[981] = 1 --Abyss Lord - Evil Beast
ai_flag_nohide[982] = 1 --Abyss Lord - Tyran
ai_flag_nohide[983] = 1 --Abyss Lord - Phoenix
ai_flag_nohide[984] = 1 --Abyss Lord - Despair
ai_flag_nohide[985] = 1 --Abyss Lord - Drakan
ai_flag_nohide[986] = 1 --Abyss Lord - Tidal
ai_flag_nohide[987] = 1 --Abyss Lord - Hardin
ai_flag_nohide[988] = 1 --Abyss Supreme - Kara
ai_flag_nohide[989] = 1 --Bloodwing Angel
ai_flag_nohide[990] = 1 --Black Devious Angel
ai_flag_nohide[991] = 1 --Death Squirty
ai_flag_nohide[992] = 1 --Death Squirdy

--Underwater Tunel
ai_flag_nohide[764] = 1 --Zombie (Pong)
ai_flag_nohide[765] = 1 --Zombie (Gang)
ai_flag_nohide[766] = 1 --Zombie (Hu)

--Black Dragon Lair
ai_flag_nohide[789] = 1 --Black Dragon

--Ordinary Mobs
ai_flag_nohide[747] = 1 --Pirate Ringleader
ai_flag_nohide[776] = 1 --Fox Sage
ai_flag_nohide[786] = 1 --Lizardman Warrior Commander
ai_flag_nohide[788] = 1 --Evil Tribal Chieftian
ai_flag_nohide[796] = 1 --Kraken
ai_flag_nohide[805] = 1 --Barborosa
ai_flag_nohide[807] = 1 --Deathsoul Commander
ai_flag_nohide[815] = 1 --Black Jewel
ai_flag_nohide[74] = 1 --Icy Dragon
ai_flag_nohide[350] = 1 --Defense Turret A
ai_flag_nohide[727] = 1 --Mysterious Pebble
ai_flag_nohide[718] = 1 --Tree of Fortune
ai_flag_nohide[694] = 1 --Treasure Chest
ai_flag_nohide[866] = 1 --X Machine
ai_flag_nohide[867] = 1 --Matchstick
ai_flag_nohide[882] = 1 --Boiler