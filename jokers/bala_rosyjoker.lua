SMODS.Joker{ --Rosy Joker
    key = "bala_rosyjoker",
    config = {
        extra = {
            mult = 15
        }
    },
    loc_txt = {
        ['name'] = 'Rosy Joker',
        ['text'] = {
            [1] = '{C:mult}+15{} Mult if played hand is a',
            [2] = '{C:attention}Flush{} of {C:hearts}Hearts{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
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
    pools = { ["rosie_rosie_jokers"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "Flush" and (function()
    local allMatchSuit = true
    for i, c in ipairs(context.scoring_hand) do
        if not (c:is_suit("Hearts")) then
            allMatchSuit = false
            break
        end
    end
    
    return allMatchSuit and #context.scoring_hand > 0
end)()) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}