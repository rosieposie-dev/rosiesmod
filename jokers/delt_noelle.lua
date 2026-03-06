SMODS.Joker{ --Noelle
    key = "delt_noelle",
    config = {
        extra = {
            progress = 0,
            rosie_ominous = 0
        }
    },
    loc_txt = {
        ['name'] = 'Noelle',
        ['text'] = {
            [1] = '{X:planet,C:white}Freezes{} all scored cards',
            [2] = '{C:hearts}Gets Stronger{} when more',
            [3] = '{X:planet,C:white}Frozen{} cards are played.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
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
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosie_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 1
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint  and not 			SMODS.get_enhancements(context.other_card)["m_rosie_frozen"] then
                context.other_card:set_ability(G.P_CENTERS.m_rosie_frozen)
                return {
                    message = "Frozen!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (function()
    local count = 0
    for _, playing_card in pairs(context.scoring_hand or {}) do
        if SMODS.get_enhancements(playing_card)["m_rosie_frozen"] == true then
            count = count + 1
        end
    end
    return count >= 5
end)() then
                card.ability.extra.progress = (card.ability.extra.progress) + 1
                play_sound("rosie_ominous")
                return {
                    message = "Got Stronger."
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if ((G.GAME.pool_flags.rosie_thornequipped or false) and not (SMODS.get_enhancements(context.other_card)["m_rosie_frozen"] == true)) then
                context.other_card.should_destroy = true
                return {
                    message = "Unnessescary."
                }
            end
        end
    end
}