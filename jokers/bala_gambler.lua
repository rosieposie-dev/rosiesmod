SMODS.Joker{ --Gambler
    key = "bala_gambler",
    config = {
        extra = {
            odds = 10,
            Xmult = 10
        }
    },
    loc_txt = {
        ['name'] = 'Gambler',
        ['text'] = {
            [1] = '{C:green}1 in 10 chance{} for {X:mult,C:white}X10{} Mult',
            [2] = '{s:0.6}{C:inactive}\"One more time...\"{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosiesmo_jokers"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c5a0b563', 1, card.ability.extra.odds, 'j_rosie_bala_gambler', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
          end
            end
        end
    end
}