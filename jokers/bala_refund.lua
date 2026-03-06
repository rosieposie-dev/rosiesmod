SMODS.Joker{ --Refund
    key = "bala_refund",
    config = {
        extra = {
            dollars = 4
        }
    },
    loc_txt = {
        ['name'] = 'Refund',
        ['text'] = {
            [1] = 'Earn {C:money}$4{} when any',
            [2] = '{C:attention}Booster Pack{} is skipped'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosiesmo_jokers"] = true },

    calculate = function(self, card, context)
        if context.skipping_booster  and not context.blueprint then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
    end
}