local ext = {};
ext.title = 'Tribulation';
ext.author = 'Kop2';
----------------------------------------------------------
-- Please do not redistribute or claim/delete ownership!!!
-- Game: Tales Of Pirates Online - Compatible with version 1.36+ Files
-- Credits: Matt for Hook System.
-- Scripted according to: http://forum.top.igg.com/viewthread.php?tid=175950
-- Required File:
--			* serialize.lua (http://lua-users.org/wiki/TableSerialization)
--			* hook.lua (by MaTT@serverdev.net)
-- Support TXT files
-- Compatibility: windows OS
-- Discription: 
--			* http://forum.top.igg.com/viewthread.php?tid=165339
--			* http://top2.igg.com/news/view.php?id=282
-- Instance NPC Locations:
--			* Tribulation of Faith Administrator (1300, 530), darkblue
--			* Symbols of Faith Administrator (1307, 527), darkblue
-- Tribulation of Faith Instance Rules:
--		Tribulation of Faith is an instance, so party up with other plucky peg-legs 
--		and embark on this epic adventure together!
--			* You will need to form a party to enter the instance. Each party cannot
--				have more than 3 players of the same class.
--			* This instance can only be attempted twice a week. If someone in your 
--				team has already attempted the instance twice that week, the entire 
--				party will be unable to enter the instance.
--			* The instance attempt counter will be reset to 0 after the server maintenance.
--			* The instance is divided into 3 different difficulty ranges 
--					- Beginner (Levels 40-54), 
--					- Intermediate (Levels 55-64) 
--					- Hardcore (Levels 65-100)
--				Whatever difficulty level your party chooses, all members in the party 
--				must be within the same level range or they will not be able to
--				enter the instance.
--			* The whole party must be at Icicle Castle to enter the instance.-  If too 
--				many pirates are attempting the instance, you will be notified by the 
--				system that the instance is full for the moment. Be patient and your 
--				party's turn will come!- Need more Symbols of Faith? Fret not, the 
--				monsters of Tribulation of Faith have Golden Scrolls with them at times, 
--				which will give you an extra chance each week to attempt the instance. 
--				Just hand a Golden Scroll over to the Tribulation of Faith Administrator 
--				and you will be able to lead your party into the instance. 
-- Combat in the Instance:
--			* A horde of vile creatures will appear at the beginning of the instance, with 
--				4 spawning for each member of your party. Each monster will have a lifespan 
--				of 6 minutes. Hasten to defeat them, for a new wave of evil monsters will 
--				appear every 100 seconds whether the first group has been annihilated or not!
--			* During the 10th and 20th waves, your party will come face to face with 2 
--				extremely horrific monster bosses. If you survive long enough, brace yourselves 
--				for the ultimate monster boss in the 25th and final wave. With a permanent 
--				lifespan throughout the instance, these savage monster bosses will be at your 
--				throats until the moment they are killed. -  If you die in battle, you can 
--				wait for your comrades to resurrect you, or choose to resurrect yourself back 
--				in the city. Take note that once you leave the instance, you cannot re-enter 
--				the same instance again. If there is no action at all after your death, you 
--				will be removed from the instance once the next boss has been killed.
--			* Alas! If the entire crew is wiped out, the trial will end 1 minute later and all 
--				party members will be teleported out of the instance.
--			* There will be platforms appearing at times in the midst of the battleground that 
--				can both harm and heal brave buccaneers. From the 1st to the 10th monster wave, 
--				there will be a circular one that heals 100 HP per second for those who stand 
--				on it. From the 21st to 25th monster wave, a fiery platform will deal 500 
--				points of damage to those who stand among the flames. Keep an eye out for them!
-- Instance Rewards:
--	Symbols of Faith can be used to redeem for awesome rewards and insane amounts of EXP. 
--	Check out the list of fabulous treasure below for some of the items available.
--			* Low-level Light Fairy Liquid (x7)
--			* Low-level Darkness Fairy Liquid (x7)
--			* Low-level Thunder Fairy Liquid (x7)
--			* Baby Black Dragon Summon Scroll (x15)
--			* 5% EXP (x30)
--			* Gem Generator (x10)
--			* +3 Base Stats Gem (x10)
--	While all monsters will drop Symbols of Faith, the final Monster Boss for Hardcore Difficulty 
--	(Levels 65-70) instances will drop rare items, as shown below!
--			* Gem of Rage
--			* Gem of Colossus
--			* Gem of the Wind
--			* Gem of Striking
--			* Gem of Soul
--			* Crown of Decedent
--			* First Prize
--			* Carcass of Death
-- Instructions: EOF
-- ChangeLogs:
ext.version = '1.0' --------------------------------------
--			* 01.16.15
--			= Instead of Editing the monsters original stats, Created a new AI to boost stats
--			= Morbidos teleports him and all players from PT to the mid, stun all players.
--			= fire explosion: http://www.youtube.com/watch?v=xHCXdT3KIUY
-- updateall does not effect infile-map lua-files, so Everything has been ported
-- to single file implementation
--			= VERSION released
ext.version = '1.1' --------------------------------------
--			* 08.12.15
--			= VERSION 1.1 - present NONRELEASE VERSION
--			= code readability and optimization
--			= Fix Updateall issue.
-- 			= bi-mode (option to use 1 map or all 3 maps
-- because using 3 maps for the exact same purpose is unoptimize, I've decided to implement
-- a feature to use only 1 map. But ofcourse the option to use 3 map is
-- also available (tribInst.con['oneTrib'])
-- when using all kyjj_1/2/3, just 2 party simutaniously undergoing trib will result in 6 maps...
ext.version = '1.2' --------------------------------------
--			* 12.30.15
--			= auto create database folder
--			= port NPC functions to triggers (used to be MsgProc)
-- this is just to replicate the effects of official TOP2 trib npc.
--			= Vertex Form to calculate when in mid (used to be distance forumla)
--			= when players click on the NPC, the NPC will tell how many he/she entered
--			= Add Say function
ext.version = '1.3' --------------------------------------
--			* 01.02.16
--			= debug NPCS
--			= map configurations when register
--			= implmented difficulty feature
ext.version = '1.4' --------------------------------------
--			* 01.05.16
--			= recode map_copy_run
--			= fixed close map_copy bug (when players die in 2nd floor,
-- does not close)
--			= only 1 party member gets teleported
--			= skips boss waves (DONE)
--			= when boss is summoned, tick should stop
--			= number of monster spawn according to number of players
-- monster no longer spawn for dead members
ext.version = '1.5' --------------------------------------
--			* 01.07.16
--			= reward for killing bosses
--			= if inventory full then put in temp
--			= Current State: working with no known bug
ext.version = '1.6' --------------------------------------
--			* 01.17.16
--			= Credits: Breeze for bug testing and reporting
--			= Fix party count
--			= city teleportation (@MoveCity)
--			= Dead players also gets the reward Fixed
ext.version = '1.7' -----------------------------------------
--			= Special Pass
--			= fix: RemoveDeadCha
--			= Kick players when advancing
--			= Create skills for bosses
--			= Create explosion skill for bosses (when they die)
--				> in PKM invoke: ChaUseSkill(...)
-- TODO:
--			= recode 3_kyjj-map mode
--			= platform effects to states
--			= Cancel wedding skill
print((function() return 'Loading '..ext.title..' v'..ext.version..' (by: '..ext.author..')'; end)());
-- Make sure serialize.lua is patched (fix GS crashes) - @Xtacy
if table.load == nil then print('serialize.lua cannot be found!'); end
local minToSec = function(min) return min * 60; end
if tribInst == nil then tribInst = {}; end
-----------------------------------------------------------
-- Configurations:
-----------------------------------------------------------
	tribInst.conf	= {
		maxwave		= 25,										-- Number of waves (default: 25) - this does matter
		countdown	= 10,										-- Prep time (default: 10)
		sectowave	= 60,										-- interval to spawn next wave (default: 100)
		maxcopy		= 5,										-- Number of copies  (default: unknown)
		class		= 2,										-- Cannot allow this many of the same class (default: 2)
		member		= 2,										-- number of party members (default: 3)
		perweek		= 3,										-- number of entries per week (default: 2)
		map			= 'darkblue',								-- All member must be in this map when register (default: 'darkblue')
		distance	= 1500,										-- Distance all party must be within leader (default: unknown)
		mobpercha	= 4,										-- Number of monsters spawn per member (default: 4)
		lifespan	= 2,										-- Each mob is given 6 minutes to live (default: 6)
		minBoss		= 15,										-- minutes to kill boss (default: unknown)
		closetime	= 60,
		closeshow	= { minToSec(9),minToSec(8),minToSec(7),
						minToSec(6),minToSec(5),minToSec(4),
						minToSec(3),minToSec(2),minToSec(1),
						55,45,30,15,10,9,8,7,6,5,4,3,2,1
			},
		oneTrib		= true,										-- true: uses 1 map. false: use all 3
		removeDead	= true,										-- true: remove dead players after advancement
		maintenance = false										-- true: only GMs can enter
	};
	tribInst.map	= {'kyjj_1', 'kyjj_2', 'kyjj_3'};
	tribInst.path	= GetResPath(tribInst.map[1]..'/cache/');

	-- Auto create database folder (http://stackoverflow.com/questions/1340230/check-if-directory-exists-in-lua)
	local function getDir(sPath)
		if type(sPath) ~= "string" then return false end
		local response = os.execute("cd "..sPath)
		if response == 0 then
			return true
		end
		return false
	end
	if not getDir(tribInst.path) then
		os.execute("mkdir \""..tribInst.path.."\"")
	end
	-- use os.remove
	tribInst.delDb = function() os.execute("del \""..tribInst.path.."\"") end

	-- Configuration for Tribulation modes (by default there is 3)
	-- I beleive the normal monsters are the same for all modes whilst
	-- different modes have different bosses
	tribInst.mode 	= {
		{minLv = 40, maxLv = 54,
			boss = {1229, 1230, 1231} },
		{minLv = 55, maxLv = 64,
			boss = {1232, 1233, 1234} },
		{minLv = 65, maxLv = 130,
			boss = {1235, 1236, 1237} }
	};

	tribInst.hook 		= { pkm = GetExp_PKM, mTick = ai_loop };
	tribInst.mapRun 	= {
		tribOneTick		= tribInst.map[1],
		tribTwoTick		= tribInst.map[2],
		tribThreeTick	= tribInst.map[3]
	};
	
	-- map_copy Data
	if tribInst.data == nil then tribInst.data = {}; end
	-- stores "used" map_copies
	if tribInst.mapAssign == nil then tribInst.mapAssign = {}; end
	-- temporary data for players who used special pass
	if tribInst.tempData == nil then tribInst.tempData = {}; end
	
	-- The currency [default: 7107 (Symbol of Faith)]
	tribInst.gold = 7107;
	-- Special pass for additional runs
	tribInst.specialPass = 6902;
	-- this and tribInst.conf['maxwave'] can be configured to have more waves + boss (also define monsters after wave 25)
	tribInst.bossWave	= {
		[10] = {level = 1, 
			-- prizes for crushor
			prize = {id = tribInst.gold, qty = 2} },
		[20] = {level = 2,
			-- prizes for slitherslime
			prize = {id = tribInst.gold, qty = 3} },
		[25] = {level = 3,
			-- prizes formorbidos
			prize = {id = tribInst.gold, qty = 4} }
	};

	tribInst.shop = {
		-- by Default: http://forum.top.igg.com/attachments/20120106_a1f0fb6ba6a9116947dbYlNBk4xHRGw4.png
		{item = 5644, qty = 10, price = 15,
			info =	'Only consumeable by Angela fairies. '..GetItemName(5644)..'(stack of 10) '..
					'will cost you 15 Symbols of Faith.'
		},
		{item = 7803, qty = 1, price = 120,
			info =  'Valentine Ring Chest '..
					''..GetItemName(7803)..' will cost you 120 Symbols of Faith.'
		},
		{item = 2898, qty = 5, price = 30,
			info =  '5x dinners Double click to earn a huge amount of exp.'..
					''..GetItemName(2898)..' will cost you 30 Symbols of Faith.'
		},
		{item = 6305, qty = 1, price = 10,
			info =  'Summons Baby Black Dragon to your side(dissapear upon changing map or going offline) '..
					''..GetItemName(6305)..' will cost you 10 Symbols of Faith.'
		},
		{item = 3097, qty = 1, price = 5,
			info =  'Grants 2.5 times drop rate for 30 mins (Players: Lv60+). '..GetItemName(3495)..' '..
					'will cost you 5 Symbols of Faith.'
		},
		{item = 3095, qty = 1, price = 5,
			info =  'Grants 2.5 times exp rate for 30 mins (Players: Lv60+). '..GetItemName(5694)..' '..
					'will cost you 5 Symbols of Faith.'
		}
	}
	


-----------------------------------------------------------
-- Required Functions 
-----------------------------------------------------------
	-- (http://stackoverflow.com/questions/4990990/lua-check-if-a-file-exists)
	local file_exists = function(name)
		local f = io.open(name, 'r')
		if(f ~= nil)then io.close(f) return true
		else return false
		end
	end

	-- (http://www.indigorose.com/forums/archive/index.php/t-14669.html)
	local ToClockFormat = function(sec)
		local num = tonumber(sec)
		if num == 0 then
			return "00:00:00";
		else
			now_hour = string.format("%02.f",math.floor(num / 3600 ))
			now_minute = string.format("%02.f",math.floor(num / 60 - (now_hour*60)))
			now_second = string.format("%02.f",math.floor(num - now_hour*3600 - now_minute*60))
			return now_hour..":"..now_minute..":"..now_second
		end
	end

	local DealAllChaInCopy = function(mp, f, ...)
		local ply_n = GetMapCopyPlayerNum(mp);
		local ps = {};
		local i = 1;
		BeginGetMapCopyPlayerCha(mp)
		for i = 1, ply_n, 1 do
			ps[i] = GetMapCopyNextPlayerCha(mp);
		end
		for i = 1, ply_n, 1 do
			if ps[i] ~= 0 and ps[i] ~= nil then
				_G[f](ps[i], unpack(arg))
			end
		end
	end
	
	local DealAllLivingCha = function(mp, f, ...)
		local ply_n = GetMapCopyPlayerNum(mp);
		local ps = {};
		local i = 1;
		BeginGetMapCopyPlayerCha(mp)
		for i = 1, ply_n, 1 do
			ps[i] = GetMapCopyNextPlayerCha(mp);
		end
		for i = 1, ply_n, 1 do
			if ps[i] ~= 0 and ps[i] ~= nil then
				if Hp(ps[i]) > 0 then
					_G[f](ps[i], unpack(arg));
				end
			end
		end
	end

	local FileToArray = function(file)
		local f = io.open(file, "r")
		local arr = {}
		for line in f:lines() do
			table.insert(arr, line)
		end
		return arr
	end

	function table.getmin(arr)
		local n;
		if n == nil then n = arr[1]; end
		for m = 1, table.getn(arr) do
			if arr[m] < n then
				n = arr[m];
			end
		end
		return n;
	end

-----------------------------------------------------------
-- map_copy_run_kyjj_1 (hooked)
-- by Xtacy 01.07.16
-----------------------------------------------------------
	function tribOneTick(...)
		local old, map_copy = arg[1], arg[2];
		if GetMapCopyPlayerNum(map_copy) ~= 0 then
			if tribInst.data[map_copy] == nil then
				-- Clear all monsters if theres any (important - sometimes monsters are left behind)
				ClearAllSubMapMonster(map_copy);
				tribInst.initCopy(map_copy);
			end
			-- Using 1 tribulation map only
			if tribInst.conf['oneTrib'] then
				-- instance not done
				if tribInst.data[map_copy].finish == nil then
					tribInst.mainTick(map_copy);
				else
					-- all Instances are complete!
					tribInst.complete(map_copy);
				end
				-- All members are dead then close
				if tribInst.deadParty(map_copy) then
					--TODO: tribInst.noSurvivor(map_copy);
					tribInst.closeCopy(map_copy); -- put this in noSurvivor
				else
					tribInst.spawnTick(map_copy);
					-- Platform effect
					DealAllActivePlayerInMap(map_copy, 'inPlatform');
					-- removes players who is not in a party
					DealAllActivePlayerInMap(map_copy, 'RemoveSoloCha');
				end
			else
			-- using all 3 tribulations
				tribOneTick2(map_copy);
			end
		else
			-- no player in map so close
			tribInst.closeCopy(map_copy);
		end
	end
	
	-- this is tribulation using three maps
	function tribOneTick2(map_copy)
		MapCopyNotice(map_copy, 'Under Construction - redesigning!');
	end
	
	function tribTwoTick(...)
		local old, map_copy = arg[1], arg[2];
	end
	
	function tribThreeTick(...)
		local old, map_copy = arg[1], arg[2];
	end

-----------------------------------------------------------
-- Support Functions for Tribulation
-- map_copy functions
-----------------------------------------------------------
	-- Initializes the instance
	tribInst.initCopy = function(map_copy)
		tribInst.data[map_copy] = {
			wave	= 0,											-- waves
			tick	= 0,											-- tick to waves
			begin	= tribInst.conf['countdown'],					-- countdown
			id		= {},											-- holds boss data
			mode	= tribInst.mapAssign[GetMapCopyID2(map_copy)]	-- current mode
			--shut	= nil,											-- placeholder for countdown when boss is summoned
		};
	end
	
	-- Initialize the begining of a level* wave
	tribInst.initWave = function(map_copy)
		tribInst.data[map_copy].begin = nil;
		DealAllChaInCopy(map_copy, 'BickerNotice', 'Mayhem Madness has begun!')
		tribInst.spawn(map_copy);
	end
	
	-- main tick
	tribInst.mainTick = function(map_copy)
		-- begin the Countdown
		if tribInst.data[map_copy].begin ~= nil then
			-- check if should countdown
			if tribInst.data[map_copy].id[tribInst.data[map_copy].wave] == nil then
				if tribInst.data[map_copy].begin > 0 then
					DealAllChaInCopy(map_copy, 'BickerNotice', 'Countdown: '..tribInst.data[map_copy].begin..'!')
					tribInst.data[map_copy].begin = tribInst.data[map_copy].begin - 1;
				end
			else
				-- ready to shutdown if members do not kill the boss within the time limit
				tribInst.bossTick(map_copy);
			end	
			-- countdown reaches 0 - start the spawning
			if tribInst.data[map_copy].begin == 0 then
				-- Kick all players who are dead
				-- DealAllActivePlayerInMap(map_copy, 'RemoveDeadCha');
				tribInst.initWave(map_copy);
			end
		else
			-- begin the interval, reset when reach 100 in tribInst.spawnTick
			if tribInst.data[map_copy].tick < tribInst.conf['sectowave'] then
				tribInst.data[map_copy].tick = tribInst.data[map_copy].tick + 1;
			end
		end
	end
	
	-- summons every interval
	tribInst.spawnTick = function(map_copy)
		-- reaches the interval to spawn
		if tribInst.data[map_copy].tick >= tribInst.conf['sectowave'] then
			-- reset the tick
			tribInst.data[map_copy].tick = 0;
			-- spawn the wave
			tribInst.spawn(map_copy)
		end
	end
	
	-- remaining time to kill bosses
	tribInst.bossTick = function(map_copy)
		if tribInst.data[map_copy].shut ~= nil then
			if tribInst.data[map_copy].shut > 0 then
				-- prompt how many minutes are left to kill the boss
				for i = 1, table.getn(tribInst.conf['closeshow']) do
					if tribInst.data[map_copy].shut == tribInst.conf['closeshow'][i] then
						DealAllChaInCopy(map_copy, 'BickerNotice', 'Remaining time to kill '..
						''..GetChaDefaultName(tribInst.data[map_copy].id[tribInst.data[map_copy].wave])..': '..
						''..ToClockFormat(tribInst.data[map_copy].shut)..'!');
					end
				end
				tribInst.data[map_copy].shut = tribInst.data[map_copy].shut - 1;
				-- pkm will clear this
			else
				-- map gets shutdown for failing to kill boss in time
				tribInst.closeCopy(map_copy);
			end
		end
	end
	
	-- if arg[1] not nil then party has completed the tribulation
	tribInst.closeCopy = function(map_copy, ...)
		if arg[1] == nil then
			-- prompt with failed notice
			DealAllChaInCopy(map_copy, 'BickerNotice', 'You have failed the Tribulation!')
		end
		tribInst.data[map_copy] = nil;						-- clear the map_copy data
		tribInst.mapAssign[GetMapCopyID2(map_copy)] = nil;	-- free the map_copy
		DealAllChaInCopy(map_copy, 'MoveCity', 'Tribulation Admin');
		ClearAllSubMapCha(map_copy);						-- clear all players
		ClearAllSubMapMonster(map_copy);					-- clear all monster
		-- close the map_copy
		if not tribInst.conf['oneTrib'] then
			for i = 1, table.getn(tribInst.map) do
				--CloseMapCopy(tribInst.map[i]);
				CloseMapCopy(tribInst.map[i], GetMapCopyID2(map_copy))
			end
		else
			-- CloseMapCopy(tribInst.map[1]);
			CloseMapCopy(tribInst.map[1], GetMapCopyID2(map_copy))
		end
	end
	
	-- handles spawning by wave
	tribInst.spawn = function(map_copy)
		local monsterId;
		-- every time this function is called, increment the waves
		tribInst.data[map_copy].wave = tribInst.data[map_copy].wave + 1;
		-- check if its a boss wave
		if tribInst.bossWave[tribInst.data[map_copy].wave] ~= nil then
			tribInst.spawnBoss(map_copy);
		else
		-- regular waves
			DealAllChaInCopy(map_copy, 'BickerNotice', 'Wave number '..tribInst.data[map_copy].wave..' has begin!')
			-- wave is less than 10
			if tribInst.data[map_copy].wave >= 1 and tribInst.data[map_copy].wave < 10 then
				monsterId = 1244;
			elseif tribInst.data[map_copy].wave >= 10 and tribInst.data[map_copy].wave < 20 then
				monsterId = 1245;
			elseif tribInst.data[map_copy].wave >= 20 and tribInst.data[map_copy].wave < 25 then
				monsterId = 1246;
			end
			-- spawn
			for i = 1, GetMapActivePlayer(map_copy) * tribInst.conf['mobpercha'] do
				tribInst.summon(map_copy, monsterId, tribInst.conf['lifespan']);
			end
			-- Prompt the next wave
			DealAllChaInCopy(map_copy, 'BickerNotice', 'The next wave will start in '..tribInst.conf['sectowave']..' seconds')
		end
	end

	-- handles boss waves
	tribInst.spawnBoss = function(map_copy)
		-- gets the boss ID for this wave
		local monsterId = tribInst.mode[tribInst.data[map_copy].mode].boss[tribInst.bossWave[tribInst.data[map_copy].wave].level];
		local role = tribInst.summon(map_copy, monsterId, tribInst.conf['minBoss']);
		DealAllChaInCopy(map_copy, 'BickerNotice', GetMonsterName(monsterId)..' has been summoned!')
		-- this to stop the tick
		tribInst.data[map_copy].id[tribInst.data[map_copy].wave] = role;
		-- this to set new countdown for next level
		tribInst.data[map_copy].begin = tribInst.conf['countdown'];
		-- this to countdown the time needed to kill boss
		tribInst.data[map_copy].shut = minToSec(tribInst.conf['minBoss']);
	end
	
	tribInst.summon = function(map_copy, id, life)
		local x = math.random(36,92)
		local y = math.random(36,92)
		local angle = math.random(1,360)
		local monster = CreateChaEx(id, x*100, y*100, angle, 60000, map_copy)
		SetChaLifeTime(monster, life*600000)
		return monster;
	end
	
	-- invoked when all bosses are killed
	tribInst.complete = function(map_copy)
		if tribInst.data[map_copy].finish > 0 then
			tribInst.data[map_copy].finish = tribInst.data[map_copy].finish - 1;
		end
		-- Shutdown
		if tribInst.data[map_copy].finish <= 0 then
			tribInst.closeCopy(map_copy, 1);
		end
	end
	
	-- All members are dead @boolean method
	tribInst.deadParty = function(map_copy)
		local mpCha = GetMapCopyPlayerNum(map_copy);
		local ps = {};
		local i = 1;
		BeginGetMapCopyPlayerCha(map_copy);
		for i = 1, mpCha do
			ps[i] = GetMapCopyNextPlayerCha(map_copy);
		end
		local a = 0;
		for i = 1, mpCha do
			if Hp(ps[i]) <= 0 then a = a + 1;  end
		end
		-- return a == mpCha;
		if a == mpCha then return true; end
		return false
	end



	-- only called when adnvancing
	function RemoveDeadCha(cha)
		if Hp(cha) <= 0 then
			MapCopyNotice(GetChaMapCopy(cha), 'Member: '..GetChaDefaultName(cha)..' did not make it to the next level.')
			MoveCity(cha, 'Tribulation Admin')
		end
	end
	
	-- calculate if player is in platform (2.0 - Vertex form; PRE: distance formula)
	function isInCircle(x, y)
		local h,k = 68,58		-- Center of platform
		local radius = 4		-- radius of platform
		local sq_distance = (h - x)^2 + (k - y)^2;
		return sq_distance <= radius^2;
	end
	
	function inPlatform(cha)
		local chatick = GetChaParam(cha, 1)
		local x,y = GetChaPos(cha)
		x,y = math.floor(x/100),math.floor(y/100);
		-- player is in the platform
		if isInCircle(x, y) then
			local hp = GetChaAttr(cha, ATTR_HP);
			local mxhp = GetChaAttr(cha, ATTR_MXHP);
			local data = tribInst.data[GetChaMapCopy(cha)];
			-- First level platform (+100 hp)
			if data.wave >= 1 and data.wave <= 10 then
				-- Heals (though, not sure if its a state)
				if hp ~= mxhp then hp = hp + 100; end
			-- Third level platform (-500 hp)
			elseif data.wave >= 11 and data.wave <= 25 then
				if hp ~= mxhp then hp = hp + 500; end
			end
			if hp > mxhp then hp = mxhp; end
			SetCharaAttr(hp, cha, ATTR_HP);
			RefreshCha(cha);
		end
	end

-----------------------------------------------------------
-- Hooks - also add hooks to AddHelpNpc.lua
-- map_copy run
-- GetExp_PKM by Xtacy 01.04.16
-----------------------------------------------------------
	GetExp_PKM = function(dead, atk)				-- this (new)
		local deadmap = GetChaMapName(dead);
		if deadmap == tribInst.map[1] or
			deadmap == tribInst.map[2] or
				deadmap == tribInst.map[3] then
			tribInst.pkm(dead, atk);				-- this (kyjj - player kill monster)
		else
			tribInst.hook['pkm'](dead, atk)			-- this (default)
		end
	end
	
	-- monster loop for tribulation bosses (currently bugging monsters)
	--[[ ai_loop = function(monster)
		local map_copy = GetChaMapCopy(monster);
		if monster == tribInst.data[map_copy].id[tribInst.data[map_copy].wave] then
			tribInst.aiTick(monster);
		else
			tribInst.hook['mTick'](monster);
		end
	end ]]
	
	-- check if DealAllChaInCopy deals dead players (true)
	tribInst.pkm = function(dead, atk)
		local map_copy = GetChaMapCopy(dead);
		-- for bosses
		if tribInst.data[map_copy].id[tribInst.data[map_copy].wave] == dead then
			-- reward team for killing bosses 
			local x = {atk, GetTeamCha(atk, 0), GetTeamCha(atk, 1), GetTeamCha(atk, 2), GetTeamCha(atk, 3)}
			for i,v in pairs(x) do
				-- 01.17.16 - fix outside map
				if GetChaMapName(v) == GetChaMapName(atk) then
					if GetChaFreeBagGridNum(v) <= 0 then
						GiveItemX(v, 0,	tribInst.bossWave[tribInst.data[map_copy].wave].prize['id'], tribInst.bossWave[tribInst.data[map_copy].wave].prize['qty'], 4)
					else
						GiveItem(v, 0,	tribInst.bossWave[tribInst.data[map_copy].wave].prize['id'], tribInst.bossWave[tribInst.data[map_copy].wave].prize['qty'], 4)
					end
				end
			end
			-- Explosion here, invoke ChaUseSkill
			--DealAllChaInCopy(map_copy, 'BickerNotice', GetChaDefaultName(dead)..' has been killed!');
			MapCopyNotice(map_copy, GetChaDefaultName(dead)..' has been killed!');
			ClearAllSubMapMonster(map_copy);					-- clear all monster
			-- this will handle the final boss
			if tribInst.data[map_copy].wave == tribInst.conf['maxwave'] then
				-- instance completed
				DealAllChaInCopy(map_copy, 'BickerNotice', 'You have completed all the trials. The instance will be closed in 60 seconds.');
				-- closing triggers
				tribInst.data[map_copy].finish = tribInst.conf['closetime'];
			end
			
			tribInst.data[map_copy].id[tribInst.data[map_copy].wave] = nil
			tribInst.data[map_copy].shut = nil;
		end
	end
	
	tribInst.aiTick = function(monster)
		-- bost their stats here! (changed to when they are summoned)
		-- however needed for morbidos (teleportation skill)
	end

	tribInst.HOOKS = function()
		for i,v in pairs(tribInst.mapRun) do
			if _G['map_copy_run_'..v] == nil then
				_G['map_copy_run_'..v] = function(map_copy)
					-- this should invoke the platform function
				end
			end
			Hook:AddPostHook('map_copy_run_'..v, _G[i], 1);
		end
		-- print('Tribulation of Faith loaded!');
	end
	tribInst.HOOKS();
	
	-- Add hook to AddHelpNpc.lua
	tribInst.addHOOKS = function(str)
		local file = GetResPath('/script/help/AddHelpNPC.lua');
		local index = FileToArray(file);
		local r = 0
		for i = 1, table.getn(index) do
			if index[i] ~= tostring(str) then
				r = r + 1;
			end
		end
		if r == table.getn(index) then 
			local f = io.open(file, 'a');
			f:write('\n');
			f:write(tostring(str));
			f:close();
		end
	end
	tribInst.addHOOKS('tribInst.HOOKS()');

-----------------------------------------------------------
-- Support Functions for NPC
-- trigger functions
-----------------------------------------------------------
	-- not required function if serialize have not yet been
	-- patched. msg me for patched serialize.lua
	tribInst.creatDb = function(dbfile)
		if not file_exists(tribInst.path..dbfile) then
			local f = io.open(tribInst.path..dbfile, 'a')
			table.save({}, tribInst.path..dbfile)
			f:close()
		end
	end
	
	tribInst.getMode = function(cha)
		local difficulty = 0;
		local team = {cha, GetTeamCha(cha, 0),GetTeamCha(cha, 1),GetTeamCha(cha, 2),GetTeamCha(cha, 3)};
		local leaderLv = Lv(cha);
		-- get the mode of leader
		for i = 1, table.getn(tribInst.mode) do
			if leaderLv >= tribInst.mode[i].minLv and leaderLv <= tribInst.mode[i].maxLv then
				difficulty = i;
			end
		end
		-- all members must be same level range as leader
		local count = 0;
		for i,v in pairs(team) do
			if Lv(v) >= tribInst.mode[difficulty].minLv and Lv(v) <= tribInst.mode[difficulty].maxLv then
				count = count + 1;
			end
		end
		if count == table.getn(team) then
			return difficulty;
		else
			-- no mode
			return 0;
		end
	end

	tribInst.modeName = function(n)
		local mode = {	
			'Beginner',		-- (Levels '..tribInst.mode[1].minLv.."-"..tribInst.mode[1].maxLv..')', 
			'Intermediate',	-- (Levels '..tribInst.mode[2].minLv.."-"..tribInst.mode[2].maxLv..')',
			'Hardcore'		-- (Levels '..tribInst.mode[3].minLv..'-'..LV_LIMIT..')'
		};
		if mode[n] ~= nil then
			return mode[n];
		else
			LG('TribLG', 'mode:['..n..'] does not exist');
		end
	end

	tribInst.getVisit = function(cha)
		local week = tonumber(os.date("%W"));
		week = tostring(week)
		-- Create Database if not exists
		tribInst.creatDb(week..'.dat')
		local t = table.load(tribInst.path..week..'.dat');
		if t[GetCharID(cha)] ~= nil then
			return t[GetCharID(cha)];
		else
			return 0;
		end
	end
	
	tribInst.addVisit = function(cha)
		local week = tonumber(os.date("%W"));
		week = tostring(week)
		-- Create Database if not exists
		tribInst.creatDb(week..'.dat')
		local t = table.load(tribInst.path..week..'.dat');
		if t[GetCharID(cha)] ~= nil then
			t[GetCharID(cha)] = t[GetCharID(cha)] + 1;
		else
			t[GetCharID(cha)] = 1;
		end
		table.save(t, tribInst.path..week..'.dat');
	end

-----------------------------------------------------------
-- Requirements to enter Tribulation of Faith
-- Handlers for NPC conditions
-----------------------------------------------------------
	-- Party member requirements
	function PartyCount(role, count)
		local x = {role, GetTeamCha(role, 0), GetTeamCha(role, 1), GetTeamCha(role, 2), GetTeamCha(role, 3)}
		local c = 0
		for i,v in pairs(x) do
			c = c + 1
		end
		-- return c == count
		if c == count then
			return LUA_TRUE
		end
		return LUA_FALSE
	end
	
	-- Party registration map requirements
	function PartyGetMap(role, map)
		local x = {role, GetTeamCha(role, 0), GetTeamCha(role, 1), GetTeamCha(role, 2), GetTeamCha(role, 3)}
		local c = 0
		for i,v in pairs(x) do
			if GetChaMapName(v) == map then
				c = c + 1
			end
		end
		-- return c >= table.getn(x)
		if c >= table.getn(x) then
			return LUA_TRUE
		end
		return LUA_FALSE
	end
	
	-- Party distance requirements
	function PartyNearby(role, distance)
		local x = {role, GetTeamCha(role, 0), GetTeamCha(role, 1), GetTeamCha(role, 2), GetTeamCha(role, 3)}
		local c = 0
		for i,v in pairs(x) do
			if get_distance(role, v) <= distance then
				c = c + 1;
			end
		end
		-- return c == table.getn(x)
		if c == table.getn(x) then
			return LUA_TRUE
		end
		return LUA_FALSE
	end
	
	-- Party mode (level) requirements
	function PartyModeTrib(role)
		local tribMode = tribInst.getMode(role);
		-- return tribMode ~= 0
		if tribMode ~= 0 then
			return LUA_TRUE
		end
		return LUA_FALSE
	end
	
	-- Party visitation requirements
	function PartyVisitTrib(role, count)
		local x = {role, GetTeamCha(role, 0), GetTeamCha(role, 1), GetTeamCha(role, 2), GetTeamCha(role, 3)}
		local c = 0;
		for i,v in pairs(x) do
			if tribInst.getVisit(v) < count or tribInst.tempData[GetCharID(v)] ~= nil then
				c = c + 1;
			end
		end
		-- return c == table.getn(x)
		if c == table.getn(x) then
			return LUA_TRUE;
		end
		return LUA_FALSE;
	end
	
	-- cannot allow no more than "count" players of the same class
	function PartyRestrictClass(role, count)
		local x = {role, GetTeamCha(role, 0), GetTeamCha(role, 1), GetTeamCha(role, 2), GetTeamCha(role, 3)}
		local k = 0;
		for j = 1, table.getn(x) do
			local job = GetChaAttr(x[j], ATTR_JOB);
			k = 1;
			for i = j + 1, table.getn(x) do
				if GetChaAttr(x[i], ATTR_JOB) == job then
					k = k + 1;
				end
			end
			if k >= count then break; else k = 0; end
		end
		-- return not k >= count
		if k >= count then
            return LUA_FALSE;
		end
		return LUA_TRUE;
	end
	
	function HasCopyTrib(role)
		-- Check if there is available map copy
		local proxy = {};
		for i = 1, tribInst.conf['maxcopy'] do
			if tribInst.mapAssign[i] == nil then
				table.insert(proxy, i);
			end
		end
		-- return table.getn(proxy) ~= 0
		if table.getn(proxy) ~= 0 then
			return LUA_TRUE;
		end
		return LUA_FALSE;
	end
	
	function BeginTribulation(role)
		if tribInst.conf['maintenance'] == true then
			if GetGmLv(role) == 0 then
				SystemNotice(role, 'Tribulation under maintenance!');
				return;
			end
		end
		local x = {role, GetTeamCha(role, 0), GetTeamCha(role, 1), GetTeamCha(role, 2), GetTeamCha(role, 3)}
		local str = '';
		local getMode = tribInst.getMode(role);
		--Notice(getMode);
		-- Check if there is available map copy
		local proxy = {};
		for i = 1, tribInst.conf['maxcopy'] do
			if tribInst.mapAssign[i] == nil then
				table.insert(proxy, i);
			end
		end
		-- get next available copy
		if table.getn(proxy) ~= 0 then
			local map_copy = table.getmin(proxy);
			-- store the mode in this array (this mean, map_copy is used,
			-- also, can store the mode into map data when instance is running
			tribInst.mapAssign[map_copy] = getMode;
			--Notice(tribInst.mapAssign[map_copy]);
			for i = 1, table.getn(x) do
				tribInst.addVisit(x[i]);
				-- use golden pass
				if tribInst.tempData[GetCharID(x[i])] ~= nil then
					tribInst.tempData[GetCharID(x[i])] = nil;
				end
				MoveCity(x[i], 'Tribulation 1', map_copy);
				-- Gets Everyones name
				if i ~= table.getn(x) then
					if i == (table.getn(x) - 1) then
						if table.getn(x) ~= 2 then
							str = str..GetChaDefaultName(x[i])..', and ';
						else str = str..GetChaDefaultName(x[i])..' and '; end
					else str = str..GetChaDefaultName(x[i])..', '; end
				else str = str..GetChaDefaultName(x[i])..''; end
				-- end of name Grabbing
			end
		end
		if getMode ~= 0 then
			Notice('Players: '..str..' has begun the Tribulation (difficulty: '..tribInst.modeName(getMode)..')! Mayhem madness has begun...');
		end
		return LUA_TRUE;
	end
	
	function UseSpecialPass(role, npc)
		local weeknum = os.date("%W");
		week = tostring(tonumber(weeknum));
		local t = table.load(tribInst.path..week..'.dat');
		if t[GetCharID(role)] == nil then
			SystemNotice(role, 'You do not need a '..GetItemName(tribInst.specialPass)..' to enter! '..
			'week'..weeknum..':[entry: 0/'..tribInst.conf['perweek']..']');
			return;
		else
			if t[GetCharID(role)] < tribInst.conf['perweek'] then
				SystemNotice(role, 'You do not need a '..GetItemName(tribInst.specialPass)..' to enter! '..
				'week'..weeknum..':[entry: '..t[GetCharID(role)]..'/'..tribInst.conf['perweek']..']');
				return;
			else
				if t[GetCharID(role)] == tribInst.conf['perweek'] then
					local hasPass = CheckBagItem(role, tribInst.specialPass);
					if tribInst.tempData[GetCharID(role)] ~= nil then
						SystemNotice(role, 'You have an additional attempt to the Tribulation!');
						return
					else
						if hasPass <= 0 then
							SystemNotice(role, 'You do not have the '..GetItemName(tribInst.specialPass)..'. '..
							'Unable to redeem addition chance!');
							return;
						else
							TakeItem(role, 0, tribInst.specialPass, 1);
							tribInst.tempData[GetCharID(role)] = true;
							LG('TribLG', 'special_pass:['..GetChaDefaultName(role)..'] used!');
							BickerNotice(role, 'Congratulations! You gained an additional attempt at the Tribulation!');
							return;
						end
					end
				else
					SystemNotice(role, 'You already used '..GetItemName(tribInst.specialPass)..' this week. '..
					'Unable to enter! week'..weeknum..':[entry: '..t[GetCharID(role)]..'/'..tribInst.conf['perweek']..']');
					return;
				end
			end
		end
		return;
	end

-----------------------------------------------------------
-- Tribulation of Faith Administrator
-- Handles Registration and Symbol Shop
-----------------------------------------------------------
	-- NPC by Xtacy 01.02.16 (all strings are closest replica of official topII as possible)
	function trib_admin()
		--------------- EDIT THESE ! ---------------
		local npcName = "Tribulation of Faith Administrator";
		local shopTab = tribInst.shop;
		local shopTabN = table.getn(tribInst.shop);
		local shopCurrency = tribInst.gold;
		--------------- DO NOT TOUCH BELOW ---------------
		local initPage = 2										-- Starting page
		local itemsPerPage = 5									-- Items per page
		local totalPages = math.ceil(shopTabN/itemsPerPage) + 1	-- calculat total pages
		local initItem = 1										-- Starting item
		local initPagesItems = totalPages + 1
		local totalPagesPerItems = totalPages + shopTabN
		--------------- FAILURE PAGES ---------------
		local failurePage = totalPagesPerItems + 1
		local infoPage = failurePage + 1
		local passPage = infoPage + 1;
		local lvPage = passPage + 1;
		local teamPage = lvPage + 1;
		local leaderPage = teamPage + 1;
		local teamCountPage = leaderPage + 1;
		local mapPage = teamCountPage + 1;
		local distancePage = mapPage + 1;
		local modePage = distancePage + 1;
		local dbPage = modePage + 1;
		local classPage = dbPage + 1;
		local copyPage = classPage + 1;
		--------------- NPC STARTS HERE ---------------
		Talk(1, npcName..": I am the administrator for the Tribulation "..
				"of Faith. How can I help you?")

		InitTrigger()
			-- First Check for Level
			TriggerCondition(1, LvCheck, ">", tribInst.mode[1].minLv - 1)
			TriggerCondition(1, LvCheck, "<", tribInst.mode[3].maxLv + 1)
			TriggerFailure(1, JumpPage, lvPage);
			-- Second Check if player in party
			TriggerCondition(2, IsInTeam)
			TriggerFailure(2, JumpPage, teamPage);
			-- Check for team leader
			TriggerCondition(3, IsTeamLeader)
			TriggerFailure(3, JumpPage, leaderPage);
			-- Check for team count
			-- Check for team map
			TriggerCondition(5, PartyGetMap, tribInst.conf['map'])
			TriggerFailure(5, JumpPage, mapPage);
			-- Check if team mates are nearby
			TriggerCondition(6, PartyNearby, tribInst.conf['distance'])
			TriggerFailure(6, JumpPage, distancePage);
			-- Check if members are within the same level range
			TriggerCondition(7, PartyModeTrib)
			TriggerFailure(7, JumpPage, modePage);
			-- Check has visit twice
			TriggerCondition(8, PartyVisitTrib, tribInst.conf['perweek'])
			TriggerFailure(8, JumpPage, dbPage);
			-- Class limitation
			TriggerCondition(9, PartyRestrictClass, tribInst.conf['class'])
			TriggerFailure(9, JumpPage, classPage);
			-- Check if map has available copy
			TriggerCondition(10, HasCopyTrib)
			TriggerFailure(10, JumpPage, copyPage);
			-- TriggerAction (add to database)
			TriggerAction(10, BeginTribulation);
			Text(1, "Begin the Tribulation", MultiTrigger, GetMultiTrigger(), 10)

		Text(1, "Special Pass", JumpPage, passPage)
		--Text(1, "Symbols of Faith redemption", JumpPage, 2)
		Text( 1, "Symbols of Faith redemption.!", SendExchangeXData)
	local Items = {
	{7107 , 7, 6856, 1},
	{7107 , 7, 6859, 1},
	{7107 , 7, 6862, 1},
	{7107 , 15, 6305, 1},
	{7107 , 30, 2898, 6},
	{7107 , 6, 9473, 1},
	{7107 , 10, 9472, 1},
					}
	InitExchangeX()
	for B = 1, table.getn(Items), 1 do
		ExchangeDataX(Items[B][1], Items[B][2], Items[B][3], Items[B][4], 1)
		table.insert(ChangeItemList, Items[B])
	end

		for i = initPage, totalPages do
			Talk(i, "Tribulation of Faith Administrator: Redeem items using your Symbols of Faith!")
			local totalItemsPage = itemsPerPage * (i - 1)
			if totalItemsPage > shopTabN then
				totalItemsPage = shopTabN
			end
			for j = initItem,totalItemsPage do
				local ItemName = GetItemName(shopTab[j].item)
				Text( i, ItemName, JumpPage, totalPages + j)
			end
			if i ~= totalPages then
				Text(i, "more offers...", JumpPage, i + 1)
			end
			if i ~= 1 then
				Text(i, "previous...", JumpPage, i - 1)
			end
			initItem = totalItemsPage + 1
		end
		for a = initPagesItems, totalPagesPerItems do
			local b = a - totalPages
			local ItemName = GetItemName(shopTab[b].item)
			local ItemID = shopTab[b].item
			local Price = shopTab[b].price
			local ItemInfo = shopTab[b].info
			local Quantity = shopTab[b].qty
			Talk(a, npcName..': '..ItemInfo)
			InitTrigger()
			
			if(shopTab[b].price > 0)then
				TriggerCondition(b, HasItem, shopCurrency, shopTab[b].price)
				TriggerAction(b, TakeItem, shopCurrency, shopTab[b].price)
			end
			TriggerAction(b, GiveItem, ItemID, Quantity, 4)
			TriggerFailure(b, JumpPage, failurePage)
			Text(a, "Confirm...", MultiTrigger, GetMultiTrigger(), b)
			Text(a, "Previous Page", JumpPage, 2)
		end
		Text(1, "View the instance rules", JumpPage, infoPage)
		Text(1, "Maybe later...", BickerNotice, "Come again...!")
		
		Talk(infoPage, npcName..": The instance rules are as following: Your party must have "..tribInst.conf['member'].." - "..
						"5 members. A party cannot have more than "..tribInst.conf['class'].." members of the same class. "..
						"All members of a party must be grouped Level "..tribInst.mode[1].minLv.."-"..tribInst.mode[1].maxLv.." or "..
						"Level "..tribInst.mode[2].minLv.."-"..tribInst.mode[2].maxLv.." or Level "..tribInst.mode[3].minLv.."+. "..
						"Players can only attempt the instance without the aid of a special item x"..tribInst.conf['perweek'].." each week. "..
						"Those who use a Golden Scroll to get in with a Special Pass will get an additional opportunity each week.");
		Text(infoPage, "return...", JumpPage, 1)

		Talk(passPage, npcName..": I have created a Special Pass for enthusiastic pirates who just can't "..
						"get enough. You can access the Special Pass once a week. But you must first show your "..
						"worth by bringing back a Golden Scroll.");
		Text(passPage, "Use a Special Pass", UseSpecialPass);
		Text(passPage, "Maybe another time...", BickerNotice, "Come again...!");
		
		--------------- FAIL PAGES ---------------
		Talk(failurePage, npcName..": Your inventory is full or you do not have enough Symbols of Faith!")
		Talk(failurePage, "return...", JumpPage, 2)
		Talk(lvPage, npcName..": You must be within "..tribInst.mode[1].minLv.."-"..LV_LIMIT.." level.");
		Talk(teamPage, npcName..": The Tribulation of Faith instance is a strenuous test of your strength "..
						"and skills. You stand a much better chance by venturing out with a party. Make sure "..
						"your teammates are around you when you enter the instance.");
		Talk(leaderPage, npcName..": Only the Party Leader can begin the instance once party is ready!");
		Talk(teamCountPage, npcName..": You must have atleast "..tribInst.conf['member'].." members in "..
						"your Party!");
		Talk(mapPage, npcName..": All party member(s) must be in the same region!");
		Talk(distancePage, npcName..": All party member(s) must gather near the team leader!");
		Talk(modePage, npcName.." All party member(s) must be around the same level range. Difficulties: "..
						""..tribInst.mode[1].minLv.."-"..tribInst.mode[1].maxLv.." or Level "..tribInst.mode[2].minLv..""..
						"-"..tribInst.mode[2].maxLv.." or Level "..tribInst.mode[3].minLv.."+.")
		Talk(dbPage, npcName..": A party member has attempt the Tribulation Instance too many time this week! "..
						"Unless he/she posses a Golden Scroll then they can enter more than "..tribInst.conf['perweek'].." per week.");
		Talk(classPage, npcName..": The Tribulation cannot allow no more than "..tribInst.conf['class'].." players of "..
						"the same class to enter!");
		Talk(copyPage, npcName..": All Tribulations are currently being challenged! Please wait...");
	end
	
	
--[[ Tables:
 ** characterinfo.txt:
1192	Dagger Yin	Strong Guy	1	2	1	0	100	2279	255	834	835	836	0	0	0	0	0	0,0,0	1	2	100	182	-1	-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	1,061	1,815	2,785	40	1,5,0	2,0,0	399	398	0	0	0,0,0	1	1	0	0	25,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	4	1	1000	0	0	1	0	1	40	0	18	0	4	5	0	3	2	1	1	0	1	1	1442	0	1500	480	0	5	5	5	5	5	5	20	0	0	0	0	20	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1244	Snow man	Snow man	4	5	671	0	1	1	0	0	0	0	0	0	0	0	0	0,0,0	1	98	100	396	397	398	0	0	-50	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	5.17	3.877	4.18	40	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	7107,-1,-1,-1,-1,-1,-1,-1,-1,-1	5000,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	1000	0	0	1	0	67	9000	0	10000	0	600	700	25	140	300	200	10	132	10	0	2000	500	10000	420	0	85	85	85	85	85	40	20	0	0	0	8750	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1245	Whitepaw	Whitepaw	4	5	18	0	1	1	0	0	0	0	0	0	0	0	0	0,0,0	1	36	100	200	201	202	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	0.932	0.849	2.057	40	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	7107,-1,-1,-1,-1,-1,-1,-1,-1,-1	5000,-1,-1,-1,-1,-1,-1,-1,-1,-1	1	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	1000	0	0	1	0	70	10000	0	10000	0	650	750	25	140	300	200	10	120	10	0	2000	200	10000	420	0	95	95	95	95	95	40	20	0	0	0	20000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1246	Darkpaw	Darkpaw	4	5	17	0	1	1	0	0	0	0	0	0	0	0	0	0,0,0	1	35	100	200	201	202	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	0.932	0.849	2.057	40	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	7107,-1,-1,-1,-1,-1,-1,-1,-1,-1	2000,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	1000	0	0	1	0	73	12000	0	10000	0	750	800	25	140	300	200	10	115	10	0	2000	200	10000	420	0	105	105	105	105	105	40	20	0	0	0	30000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1229	Crushor	Crushor	4	5	879	0	1	1	1	1	0	0	0	0	0	0	0	0,0,0	1	879	100	0	0	372	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	1.649	3.906	3.697	300	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,198,-1,-1,-1,-1,-1,-1,-1,-1,-1	80,20,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	43	180000	0	10000	0	600	600	30	150	300	40	10	154	10	0	2500	300	10000	450	0	55	55	55	55	55	40	20	0	0	0	37500	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1230	Slitherslime	Slitherslime	4	5	880	0	1	1	1	0	0	0	0	0	0	0	0	0,0,0	1	880	100	0	0	372	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	2.183	2.134	2.063	400	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,198,-1,-1,-1,-1,-1,-1,-1,-1,-1	60,40,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	48	360000	0	10000	0	400	800	20	80	300	80	10	143	30	0	1500	400	10000	450	0	55	55	55	55	55	40	20	0	0	0	80000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1231	Morbidos	Morbidos	4	5	881	0	1	1	1	0	0	0	0	0	0	608	0	0,0,0	1	881	100	242	243	244	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	0.932	0.849	2.057	300	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,199,-1,-1,-1,-1,-1,-1,-1,-1,-1	80,20,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	53	360000	0	10000	0	400	500	10	40	300	150	100	139	50	0	800	350	10000	600	0	55	55	55	55	55	40	20	0	0	0	125000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1232	Crushor	Crushor	4	5	879	0	1	1	1	1	0	0	0	0	0	0	0	0,0,0	1	879	100	0	0	372	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	2.56	2.322	3.035	300	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,198,-1,-1,-1,-1,-1,-1,-1,-1,-1	80,20,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	57	420000	0	10000	0	800	800	40	200	300	60	10	136	15	0	2500	300	10000	450	0	65	65	65	65	65	40	20	0	0	0	67500	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1233	Slitherslime	Slitherslime	4	5	880	0	1	1	1	0	0	0	0	0	0	0	0	0,0,0	1	880	100	0	0	372	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	1.689	3.673	3.968	400	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,198,-1,-1,-1,-1,-1,-1,-1,-1,-1	60,40,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	60	720000	0	10000	0	500	1000	30	100	300	100	10	132	35	0	1500	400	10000	450	0	65	65	65	65	65	40	20	0	0	0	120000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1234	Morbidos	Morbidos	4	5	881	0	1	1	1	0	0	0	0	0	0	608	0	0,0,0	1	881	100	242	243	244	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	0.932	0.849	2.057	300	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,199,-1,-1,-1,-1,-1,-1,-1,-1,-1	70,30,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	63	720000	0	10000	0	400	550	20	60	300	200	100	127	55	0	800	350	10000	600	0	65	65	65	65	65	40	20	0	0	0	190000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1235	Crushor	Crushor	4	5	879	0	1	1	1	1	0	0	0	0	0	0	0	0,0,0	1	879	100	0	0	372	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	5.17	3.877	4.18	300	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,198,-1,-1,-1,-1,-1,-1,-1,-1,-1	80,20,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	67	540000	0	10000	0	1000	1000	50	220	300	80	10	132	20	0	2500	300	10000	280	0	75	75	75	75	75	40	20	0	0	0	87500	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1236	Slitherslime	Slitherslime	4	5	880	0	1	1	1	0	0	0	0	0	0	0	0	0,0,0	1	880	100	0	30	372	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	0.932	0.849	2.057	400	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,198,-1,-1,-1,-1,-1,-1,-1,-1,-1	60,40,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	1	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	70	900000	0	10000	0	600	1200	40	120	300	120	10	120	50	0	1500	400	10000	450	0	75	75	75	75	75	40	20	0	0	0	200000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1
1237	Morbidos	Morbidos	4	5	881	0	1	1	1	0	0	0	0	0	0	608	0	0,0,0	1	881	100	242	243	244	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	0.932	0.849	2.057	300	1,5,0	2,5,0	399	398	0	0	0,0,0	1	1	0	0	25,199,-1,-1,-1,-1,-1,-1,-1,-1,-1	50,50,-1,-1,-1,-1,-1,-1,-1,-1,-1	863,862,860,861,1012,2835,273,2842,-1,-1	10000,10000,10000,10000,10000,10000,10000,10000,-1,-1	0	0	0	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	0,-1,-1,-1,-1,-1,-1,-1,-1,-1	10	1	5000	0	0	1	0	73	900000	0	10000	0	400	600	30	80	300	220	100	115	70	0	800	350	10000	600	0	75	75	75	75	75	40	20	0	0	0	300000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1,1,1

** iteminfo.txt:
7107	Symbol of Faith	n2074	10130005	0	0	0	0	0	0	42	0	0	0	0	1	0	1	0	0	99	0	76	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,0	0,0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0	0	Proof of one's faith. Can be used to redeem rewards.	0

** mapinfo.txt:
51	kyjj_1	Tribulation of Faith 1	0	150,150	3,150,150	255,255,255
52	kyjj_2	Tribulation of Faith 2	0	150,150	3,150,150	255,255,255
53	kyjj_3	Tribulation of Faith 3	0	150,150	3,150,150	255,255,255


** resource/darkblue/darkbluenpc.txt:
115	Tribulation Administrator	1	1192	0	130070,52980	130070,52980	180	Argent City	1	0	trib_admin	0

** Tribulaiton conditions (MissionSdk.lua - function ConditionsTest):
			-- Tribulation Conditions:
			elseif conditions[i].func == IsInTeam then
				local ret = IsInTeam(character)
				if ret ~= 1 then
					return LUA_FALSE;
				end
			elseif conditions[i].func == IsTeamLeader then
				local ret = IsTeamLeader(character)
				if ret ~= 1 then
					return LUA_FALSE;
				end
			elseif conditions[i].func == PartyCount then
				local ret = PartyCount(character, conditions[i].p1)
				if ret ~= LUA_TRUE then
					return LUA_FALSE
				end
			elseif conditions[i].func == PartyGetMap then
				local ret = PartyGetMap(character, conditions[i].p1)
				if ret ~= LUA_TRUE then
					return LUA_FALSE
				end
			elseif conditions[i].func == PartyNearby then
				local ret = PartyNearby(character, conditions[i].p1)
				if ret ~= LUA_TRUE then
					return LUA_FALSE
				end
			elseif conditions[i].func == PartyModeTrib then
				local ret = PartyModeTrib(character)
				if ret ~= LUA_TRUE then
					return LUA_FALSE;
				end
			elseif conditions[i].func == PartyVisitTrib then
				local ret = PartyVisitTrib(character, conditions[i].p1)
				if ret ~= LUA_TRUE then
					return LUA_FALSE;
				end
			elseif conditions[i].func == PartyRestrictClass then
				local ret = PartyRestrictClass(character, conditions[i].p1)
				if ret ~= LUA_TRUE then
					return LUA_FALSE
				end
			elseif conditions[i].func == HasCopyTrib then
				local ret = HasCopyTrib(character)
				if ret ~= LUA_TRUE then
					return LUA_FALSE;
				end
			-- END OF TRIBULATIONS

** Tribulation actions (MissionSdk.lua - function ActionsProc):
 		elseif actions[i].func == BeginTribulation then
			PRINT( "ActionProc:BeginTribulation" )
			BeginTribulation( character )
			
** ctrl.lua:
function config(map)
	MapCanSavePos(map, 0)
	if tribInst ~= nil then
		MapCopyNum(map, tribInst.conf['maxcopy'])
	else
		MapCopyNum(map, 1)
	end
	MapCanPK(map, 0)
	SingleMapCopyPlyNum(map, 5)
	MapCanTeam(map, 1)
	MapType(map, 4)
end

  ]]