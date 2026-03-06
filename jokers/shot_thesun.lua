SMODS.Joker{ --The Sun
    key = "shot_thesun",
    config = {
        extra = {
            Mult = 0,
            handsremaining = 0,
            hands = 1,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Sun',
        ['text'] = {
            [1] = '{C:attention}Lose all but 1 hand.{}',
            [2] = '{X:mult,C:white}X2.5{} Mult for every hand removed',
            [3] = '{s:0.9,C:inactive}\"You only have one shot.\"{}',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
                local Mult_value = card.ability.extra.Mult
                return {
                    func = function()
                    card.ability.extra.Mult = (G.GAME.current_round.hands_left) * 2.5
                    return true
                end,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "ONESHOT", colour = G.C.BLUE})
                G.GAME.current_round.hands_left = card.ability.extra.hands
                return true
            end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                    card.ability.extra.Mult = math.max(0, (card.ability.extra.Mult) - 2.5)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
                return {
                    Xmult = card.ability.extra.Mult
                }
        end
    end
}