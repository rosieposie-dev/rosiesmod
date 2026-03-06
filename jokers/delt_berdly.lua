SMODS.Joker{ --Berdly
    key = "delt_berdly",
    config = {
        extra = {
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'Berdly',
        ['text'] = {
            [1] = '+1 level to your least played hand',
            [2] = 'when it is played.',
            [3] = '{C:red,E:1,s:0.8}Incredibly Annoying...{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosie_jokers"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    for hand, data in pairs(G.GAME.hands) do
        if hand == context.scoring_name and data.level == 1 then
            return true
        end
    end
    return false
  end)() then
                local target_hand = (context.scoring_name or "High Card")
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex'),
                    extra = {
                        message = "Some MUCH needed assistance.",
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.buying_card  then
                return {
                    message = "Bad for the meta..."
                }
        end
        if context.ending_shop  then
                return {
                    message = "Reroll next time."
                }
        end
        if context.skip_blind  then
                return {
                    message = "Moronic.."
                }
        end
        if context.selling_self  then
                return {
                    message = "WAIT NO"
                }
        end
        if context.skipping_booster  then
                return {
                    message = "What was the point?"
                }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
                return {
                    message = "A SMART choice."
                }
        end
        if context.end_of_round and context.game_over and context.main_eval  then
                return {
                    message = "AMATEUR mistake."
                }
        end
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    message = "HAH"
                }
            elseif context.result then
                return {
                    message = "BEGINNERS LUCK!"
                }
            end
        end
    end
}