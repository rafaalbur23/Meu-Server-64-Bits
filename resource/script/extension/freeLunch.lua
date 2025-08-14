--*---------------------------------------------*--
--* dir parent		: lua	     	   	 		*--
--* File name		: freeLunch.lua				*--
--* Created by		: Valdiney Eviles			*--
--* Discord			: _eviles				    *--
--*---------------------------------------------*--
--[[
		Installation and use:
			Installation:
				1)      Load this file with dofile on your plugin/addon folder:
                            dofile(GetResPath("../lua/plugin/freeLunch.lua"))
				2)      Add a NPC on any map, like this one:
                            ###	Free Lunch - Event	1	449	0	220225,277525	220225,277525	270	Argent City	1	0	FreeNPC	0
                3)      Go to \resource\script\MisSdk and open "NpcSdk.lua"
                3.1)   Search for the following:
		                    elseif item.func == OpenGetStone then
		                    	return OpenGetStone( character, npc )
                3.2)    Add the following below it:
		                    elseif item.func == FreeLunch.SubmitEvent then
		                    	return FreeLunch.SubmitEvent(character)				
		                    elseif item.func == FreeLunch.ClaimRewards then
		                    	return FreeLunch.ClaimRewards(character)	
                4.)     Go to \resource\script\calculate\ and open "functions.lua"
                4.1)    Search for the following:
                                function cha_timer(role, freq, time)
                4.2)    Add the following inside it, if you don't have a check for players, add it.. or the function will be triggered for: monsters, npc and that can overload the server...
                            if IsPlayer(role) == 1 then
                                FreeLunch:UpdateOnlineTime(role, now_tick)
                            end
                5)      Create a folder called "PlayerData" in root of your server files and inside it create another called "FreeLunch" for the local database
                5.1)    The local database path can be changed at lines 124 and 135, function LoadPlayerData(characterId) and function SavePlayerData(characterId, data)
                6)      All settings, messages and rewards from the plugin can be configured on the "FreeLunch" table
                7)      This plugin requires "Salt Library" in order to work and data be saved into the local file
                7.1)    You should also load the salt.lua file with dofile on \resource\script\initial.lua
                8)      That's all :) !!
]]

FreeLunch = {
    _VERSION = "v1.0",
    _DESCRIPTION = "Free Lunch Event for Tales of Pirates",
    _LICENSE = [[
      PLUGIN LICENSE

      Copyright (c) 2024 Valdiney Eviles

      Permission is hereby granted, free of charge, to any person obtaining a
      copy of this software and associated documentation files (the
      "Software"), to deal with the Plugin subject to
      the following conditions:

	  Modify, copy the codes, but not redistribute or sell without owner permissions.

      The above copyright notice and this permission notice shall be included
      in all copies or substantial portions of the Software.

	  THE PLUGIN IS PROVIDED IN VERSION 1.0, BUT IF THERE'S UPDATES
	  YOU CAN CONTACT THE OWNER OF PLUGIN TO GET A UPDATED VERSION
	  IF THERE'S, OR YOU CAN EVEN REPORT BUGS IF ANY FOUND,
	  SO HIM CAN UPDATE THE PLUGIN WITH FIXES AND IMPROVEMENTS.

      LAST MODIFIED DATE: 28/09/2024 00:12am
	]],
    Active = true,                          -- Enable or disable the NPC: true | false
    NameNPC = "Free Lunch - Event",         -- Name for the NPC
    StartPageNPC = 1,                       -- Starting page of the NPC (default: 1)
    EventDay = 6,                           -- Day of week which submit to Free Lunch Event will be available, 0 = Sunday, 1 = Monday, 6 = Saturday ...
    EventStartTime = { hour = 0, min = 0 }, -- event start time
    EventEndTime = { hour = 23, min = 59 }, -- event end time
    UpdateFrequency = 1,                    -- Time (in seconds) to update player online time (by default: 1 min). Lowering this may impact on server performance bcz running I/O operations often is not a good choice.
    NoticeRepeatInterval = 300,             -- interval to repeat notice in seconds (5 minutes by default)
    OnlineTimeNeeded = 10800,               -- Time (in seconds) a player must be online to claim rewards (default: 3 hours)
    LastNoticeTime = nil,                   -- to track when the last notice was sent
    Messages = {
        Welcome = "%s: Hello dear Pirate! Free Lunch Event starts on Saturday from 00:00am till 11:59pm.",
        Submit = "Submit Free Lunch Event",
        Claim = "Claim Free Lunch Rewards",
        Decline = "Maybe later..",
        EventActiveNotice = "%s: Free Lunch Event is active! The event runs from %02d:%02d to %02d:%02d.",
        EventNotActive = "%s: Free Lunch Event is only available on Saturdays. Come back next %s.",
        AlreadySubmitted = "%s: You already submitted for the Free Lunch Event. Stay online for another [%s] to claim your reward!",
        RegistrationSuccess = "Successfully registered for Free Lunch Event!",
        SubmissionRequired = "%s: You must submit to the event and stay online to claim rewards!",
        TimeRemaining = "%s: You need to stay online for another %s to claim the reward!",
        AlreadyClaimed = "%s: You already claimed your reward. Come back next %s!",
        RewardAvailable = "%s: You have a reward available to be claimed, please check it out..",
        RewardSlotNeeded = "%s: You need at least %d free inventory slots to claim the reward!",
        RewardClaimed = "Successfully claimed Free Lunch Rewards!",
        NoReward = "%s: No rewards available for your level.",
        EventMaintenance = "%s: Free Lunch Event is undergo maintenance, please como back later..."
    },
    Rewards = {
        -- Lv66-86 rewards
        {
            minLevel = 66,
            maxLevel = 86,
            rewards = {
                { itemId = 2312,  quantity = 10, quality = 4 },
                { itemId = 5639,  quantity = 3,  quality = 4 },
                { itemId = 2898, quantity = 3,  quality = 4 }
            }
        },
        -- Lv87-100 rewards
        {
            minLevel = 87,
            maxLevel = 100,
            rewards = {
                { itemId = 6530,  quantity = 15, quality = 4 },
                { itemId = 2898,  quantity = 10, quality = 4 },
                { itemId = 5639, quantity = 5,  quality = 4 }
            }
        },
        -- Lv101-130 rewards
        {
            minLevel = 101,
            maxLevel = 130,
            rewards = {
                { itemId = 5644,  quantity = 9, quality = 4 },
                { itemId = 2953,  quantity = 2, quality = 4 },
                { itemId = 2801, quantity = 3, quality = 4 }
            }
        }
    }
}

---Check a existence of a file in a certain path
---@param filePath string containing the path which where the file should be located
---@return boolean
file_exists = file_exists or function(filePath)
    local file = io.open(filePath, "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

---Converts second into clock format
---@param sec integer
---@return string
ToClockFormat = ToClockFormat or function(sec)
    local num = tonumber(sec)
    if (num == 0) then
        return "00:00:00"
    else
        now_hour = string.format("%02.f", math.floor(num / 3600))
        now_minute = string.format("%02.f", math.floor(num / 60 - (now_hour * 60)))
        now_second = string.format("%02.f", math.floor(num - now_hour * 3600 - now_minute * 60))
        if tonumber(now_minute) < 10 then
            return tonumber(now_hour) .. ":0" .. tonumber(now_minute) .. ":" .. tonumber(now_second)
        else
            return tonumber(now_hour) .. ":" .. tonumber(now_minute) .. ":" .. tonumber(now_second)
        end
    end
end

---Helper function to load player data from the database
---@param characterId integer if of player
---@return table
local function LoadPlayerData(characterId)
    local dir = GetResPath(string.format("../PlayerData/FreeLunch/%d.dat", characterId))
    if file_exists(dir) then
        return salt.load(dir)
    end
    return {}
end

---Helper function to save player data to the database
---@param characterId integer if of player
---@param data table
local function SavePlayerData(characterId, data)
    local dir = GetResPath(string.format("../PlayerData/FreeLunch/%d.dat", characterId))
    salt.save(data, dir)
end

---Helper function to initialize player data for the current date, eg: 09/25/24
---@param playerData table
---@param date string
---@return table
local function GetOrInitializePlayerData(playerData, date)
    if not playerData[date] then
        playerData[date] = { Active = false, OnlineTime = 0, ClaimedReward = 0 }
    end
    return playerData[date]
end

---Get the next Saturday date in DD/MM/YYYY format
---@return string Formatted date string for the next Saturday
local function GetNextSaturday()
    local today = tonumber(os.date("%w"))            -- Get current day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    local daysUntilSaturday = math.fmod(6 - today, 7) -- Calculate how many days until next Saturday
    if daysUntilSaturday == 0 then
        daysUntilSaturday = 7                        -- If today is Saturday, return the next Saturday (7 days later)
    end

    -- Get the timestamp for the next Saturday
    local nextSaturdayTime = os.time() + (daysUntilSaturday * 24 * 60 * 60) -- Add the difference in days to current time

    -- Format and return the next Saturday's date as "DD/MM/YYYY 00:00am"
    return os.date("%d/%m/%Y 00:00am", nextSaturdayTime)
end

--- Check if the event is currently active based on the day and time
---@return boolean Whether the event is active
function FreeLunch:IsEventActive()
    local currentDayOfWeek = tonumber(os.date("%w")) -- Get the current day of the week (0 = Sunday, ..., 6 = Saturday)
    local currentTime = os.time()

    -- Only activate on the configured event day
    if currentDayOfWeek ~= self.EventDay then
        return false
    end

    -- Get the current time in hours and minutes
    local currentHour = tonumber(os.date("%H"))
    local currentMin = tonumber(os.date("%M"))

    -- Event start and end times
    local eventStartTime = os.time({ year = os.date("%Y"), month = os.date("%m"), day = os.date("%d"), hour = self
    .EventStartTime.hour, min = self.EventStartTime.min })
    local eventEndTime = os.time({ year = os.date("%Y"), month = os.date("%m"), day = os.date("%d"), hour = self
    .EventEndTime.hour, min = self.EventEndTime.min })

    -- Return true if the current time is within the event period
    return currentTime >= eventStartTime and currentTime <= eventEndTime
end

---Register player for the Free Lunch event
---@param character userdata of player
function FreeLunch.SubmitEvent(character)
    local nextSaturday = GetNextSaturday()
    if not FreeLunch:IsEventActive() then
        HelpInfo(character, 0, string.format(FreeLunch.Messages.EventNotActive, FreeLunch.NameNPC, nextSaturday))
        return
    end

    local characterId = GetCharID(character)
    local currentDate = os.date("%x")
    local playerData = LoadPlayerData(characterId)
    local sessionData = GetOrInitializePlayerData(playerData, currentDate)

    if sessionData.Active and sessionData.ClaimedReward == 1 then
        HelpInfo(character, 0, string.format(FreeLunch.Messages.AlreadyClaimed, FreeLunch.NameNPC, nextSaturday))
        return
    end

    if sessionData.Active and sessionData.OnlineTime < FreeLunch.OnlineTimeNeeded then
        local timeLeft = FreeLunch.OnlineTimeNeeded - sessionData.OnlineTime
        HelpInfo(character, 0,
            string.format(FreeLunch.Messages.AlreadySubmitted, FreeLunch.NameNPC, ToClockFormat(timeLeft)))
        return
    end

    if sessionData.Active and sessionData.OnlineTime >= FreeLunch.OnlineTimeNeeded then
        HelpInfo(character, 0, string.format(FreeLunch.Messages.RewardAvailable, FreeLunch.NameNPC))
        return
    end

    sessionData.Active = true
    SavePlayerData(characterId, playerData)
    BickerNotice(character, FreeLunch.Messages.RegistrationSuccess)
end

---Allow player to claim rewards if they've met the online time requirement
---@param character userdata of player
function FreeLunch.ClaimRewards(character)
    local characterId = GetCharID(character)
    local characterLevel = GetChaAttr(character, ATTR_LV)
    local characterFreeInventorySlots = GetChaFreeBagGridNum(character)
    local currentDate = os.date("%x")
    local playerData = LoadPlayerData(characterId)
    local sessionData = GetOrInitializePlayerData(playerData, currentDate)

    if not sessionData.Active then
        HelpInfo(character, 0, string.format(FreeLunch.Messages.SubmissionRequired, FreeLunch.NameNPC))
        return
    end

    if sessionData.ClaimedReward == 1 then
        local nextSaturday = GetNextSaturday()
        HelpInfo(character, 0, string.format(FreeLunch.Messages.AlreadyClaimed, FreeLunch.NameNPC, nextSaturday))
        return
    end

    if sessionData.OnlineTime < FreeLunch.OnlineTimeNeeded then
        local timeLeft = FreeLunch.OnlineTimeNeeded - sessionData.OnlineTime
        HelpInfo(character, 0,
            string.format(FreeLunch.Messages.TimeRemaining, FreeLunch.NameNPC, ToClockFormat(timeLeft)))
        return
    end

    local rewardFound = false
    for _, levelReward in ipairs(FreeLunch.Rewards) do
        if characterLevel >= levelReward.minLevel and characterLevel <= levelReward.maxLevel then
            local requiredInventorySlots = table.getn(levelReward.rewards)

            if characterFreeInventorySlots < requiredInventorySlots then
                HelpInfo(character, 0,
                    string.format(FreeLunch.Messages.RewardSlotNeeded, FreeLunch.NameNPC, requiredInventorySlots))
                return
            end

            for _, reward in ipairs(levelReward.rewards) do
                GiveItem(character, 0, reward.itemId, reward.quantity, reward.quality)
            end
            rewardFound = true
            break
        end
    end

    if not rewardFound then
        HelpInfo(character, 0, string.format(FreeLunch.Messages.NoReward, FreeLunch.NameNPC))
        return
    end

    sessionData.ClaimedReward = 1
    SavePlayerData(characterId, playerData)
    BickerNotice(character, FreeLunch.Messages.RewardClaimed)
end

---Update player's online time at a set frequency via cha_timer
---@param character userdata of player
---@param tick integer which represents the tick of cha_timer
function FreeLunch:UpdateOnlineTime(character, tick)
    local characterId = GetCharID(character)
    local currentDate = os.date("%x")
    local playerData = LoadPlayerData(characterId)
    local sessionData = GetOrInitializePlayerData(playerData, currentDate)

    if self:IsEventActive() then
        if math.fmod(tick, self.UpdateFrequency) == 0 and tick > 0 then
            if sessionData.Active and sessionData.OnlineTime < self.OnlineTimeNeeded and sessionData.ClaimedReward == 0 then
                sessionData.OnlineTime = sessionData.OnlineTime + self.UpdateFrequency
                SavePlayerData(characterId, playerData)
            end
        end

        local currentTime = os.time()
        if not self.LastNoticeTime or (currentTime - self.LastNoticeTime >= self.NoticeRepeatInterval) then
            local eventStartHour, eventStartMin = self.EventStartTime.hour, self.EventStartTime.min
            local eventEndHour, eventEndMin = self.EventEndTime.hour, self.EventEndTime.min
            ScrollNotice(string.format(self.Messages.EventActiveNotice, self.NameNPC, eventStartHour, eventStartMin, eventEndHour,eventEndMin), 1)
            self.LastNoticeTime = currentTime
        end
    end
end

-- Free Lunch NPC Interaction
function FreeNPC()
    if FreeLunch.Active == true then
        Talk(FreeLunch.StartPageNPC, string.format(FreeLunch.Messages.Welcome, FreeLunch.NameNPC))
        Text(FreeLunch.StartPageNPC, FreeLunch.Messages.Submit, FreeLunch.SubmitEvent)
        Text(FreeLunch.StartPageNPC, FreeLunch.Messages.Claim, FreeLunch.ClaimRewards)
        Text(FreeLunch.StartPageNPC, FreeLunch.Messages.Decline, CloseTalk)
    else
        Talk(FreeLunch.StartPageNPC, FreeLunch.Messages.EventMaintenance)
    end
end