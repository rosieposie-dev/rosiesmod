SMODS.Joker{ --Shield of Time
    key = "mado_shieldoftime",
    config = {
        extra = {
            Loops = 0,
            totaljokerslots = 0,
            ante_value = 1,
            joker_slots = 1
        }
    },
    loc_txt = {
        ['name'] = 'Shield of Time',
        ['text'] = {
            [1] = '{X:edition,C:white}{E:1}Prevents Death{}{}',
            [2] = 'Resets {C:attention}Ante{} and {C:attention}-1{} Joker Slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosiesmo_jokers"] = true },

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
            if G.jokers and G.jokers.config.card_limit > 1 then
                return {
                    saved = true,
                    message = " ",
                    extra = {
                        func = function()
                    local mod = card.ability.extra.ante_value - G.GAME.round_resets.ante
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = card.ability.extra.ante_value
				return true
			end,
		}))
                    return true
                end,
                            message = " ",
                        colour = G.C.FILTER,
                        extra = {
                            func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = " ", colour = G.C.RED})
                G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - card.ability.extra.joker_slots)
                return true
            end,
                            colour = G.C.DARK_EDITION,
                        extra = {
                            func = function()
                    card.ability.extra.Loops = (card.ability.extra.Loops) + 1
                    return true
                end,
                            message = "Yet another.",
                            colour = G.C.GREEN
                        }
                        }
                        }
                }
            end
        end
    end
}