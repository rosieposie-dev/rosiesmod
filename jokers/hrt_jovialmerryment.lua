SMODS.Joker{ --Jovial Merryment
    key = "hrt_jovialmerryment",
    config = {
        extra = {
            Mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jovial Merryment',
        ['text'] = {
            [1] = 'Gains {C:red}+2{} Mult when any {C:attention}Blind{} is beaten.',
            [2] = '{C:inactive}(Currently {}{C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosiesmo_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + 2
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.Mult
                }
        end
    end
}