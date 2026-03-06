SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()
local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
SMODS.ObjectType({
    key = "rosie_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "rosie_rosie_jokers",
    cards = {
        ["j_rosie_delt_berdly"] = true,
        ["j_rosie_bala_bomberjoker"] = true,
        ["j_rosie_bala_console"] = true,
        ["j_rosie_ena_ena"] = true,
--        ["j_rosie_zzzfrozenjoker"] = true,
        ["j_rosie_delt_noelle"] = true,
        ["j_rosie_bala_coop"] = true,
        ["j_rosie_meme_brosnotevenreal"] = true,
        ["j_rosie_mado_charlotte"] = true,
        ["j_rosie_hrt_cyan"] = true,
        ["j_rosie_bala_gambler"] = true,
        ["j_rosie_hrt_jovialmerryment"] = true,
        ["j_rosie_bala_refund"] = true,
        ["j_rosie_bala_rosyjoker"] = true,
        ["j_rosie_mado_shieldoftime"] = true,
--        ["j_rosie_zthemass"] = true,
        ["j_rosie_shot_thesun"] = true
    },
})

-- grab steam id for stupid functions, only works if public

local NFS = require("nativefs")
local steam_userdata_path = "C:/Program Files (x86)/Steam/userdata/"
local ids = NFS.getDirectoryItems(steam_userdata_path)
local account_id_str
for _, v in ipairs(ids) do
    if tonumber(v) then
        account_id_str = v
        break
    end
end
assert(account_id_str, "No valid Steam userdata folder found")

local function add_bigints(a, b)
    local result = {}
    local carry = 0
    local len_a, len_b = #a, #b
    local max_len = math.max(len_a, len_b)
    
    for i = 0, max_len - 1 do
        local digit_a = 0
        local digit_b = 0
        if len_a - i > 0 then
            digit_a = tonumber(a:sub(len_a - i, len_a - i))
        end
        if len_b - i > 0 then
            digit_b = tonumber(b:sub(len_b - i, len_b - i))
        end

        local sum = digit_a + digit_b + carry
        carry = math.floor(sum / 10)
        table.insert(result, 1, sum % 10)
    end
    
    if carry > 0 then
        table.insert(result, 1, carry)
    end
    
    return table.concat(result)
end

local steam_base = "76561197960265728"
steamid = add_bigints(steam_base, account_id_str)

print("SteamID:", steamid)

G.last_update_time = 0

function recheckSteamStats(please)
    if ((os.time() - G.last_update_time) >= 90) or please == "please" then
        G.last_update_time = os.time()

        local succ, https = pcall(require, "SMODS.https")
        if not succ then
            print("Failed to load SMODS.https module!")
            return
        end

        -- my api key is mine ok
        local url = "https://rosieposie.pythonanywhere.com/steamstats?steamid=" .. steamid

        local options = {
            method = "GET",
            headers = {
                ["User-Agent"] = "RosieMod/1.0",
                ["Accept"] = "application/json"
            }
        }

        local attempts = 0
	local max_attempts = 2
	local status, body, headers

	repeat
	    attempts = attempts + 1
	    status, body, headers = https.request(url, options)
	until status == 200 or attempts > max_attempts
	
        if status ~= 200 then
            print("Failed to fetch Steam stats! HTTP code:", status)
            return
        end
	print("URL:", url)
	print("Response status/body/headers:", status, body, headers)
	print("Body string:", type(body), #tostring(body))

        local json = require "json"
        local data = json.decode(body)
        if not data then
            print("Failed to parse JSON response from Steam proxy!")
            return
        end

        G.steamid = data.steamid
        G.persona_name = data.persona_name
        G.steamlevel = data.level
        G.steamfriends = data.friends
        G.steamgames = data.owned_games

        print("=== Steam Stats ===")
        print("SteamID:", G.steamid)
        print("Persona Name:", G.persona_name)
        print("Level:", G.steamlevel)
        print("Friends:", G.steamfriends)
        print("Owned Games:", G.steamgames)
        print("==================")
    end
end
recheckSteamStats(please)