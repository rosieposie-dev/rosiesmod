SMODS.Joker{ --Not Discovered
    key = "bala_coop",
    config = {},
    loc_txt = {
        ['name'] = 'Co-op Joker',
        ['text'] = {
            [1] = '{C:mult}+1{} Mult for every',
            [2] = '{C:attetnion}Friend{} you have on steam.',
	    [3] = '{C:inactive}Currently: {C:mult}+#1#{}{}',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosie_jokers"] = true },
    loc_vars = function(self, info_queue, card)
	return {vars = { G.steamfriends or {} } }
    end,
    set_ability = function(self, card, initial)
        recheckSteamStats(please)
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
		return {
                    mult = G.steamfriends or 0
                }
        end
    end
}