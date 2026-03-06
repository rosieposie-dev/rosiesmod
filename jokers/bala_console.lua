SMODS.Joker{ --Console
    key = "bala_console",
    config = {
        extra = {
            linuxchips = 0,
            highcardplayed = 0,
            highcardlevel = 0,
            currentweekday = 0,
            currentmoney = 0,
            leftmostcardrank = 0,
            mult = 4,
            dollars = 2,
            repetitions = 2,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Console',
        ['text'] = {
            [1] = 'If on Windows: {C:red}+4{} Mult for {C:attention}Glass Cards{}',
            [2] = 'If on Mac: {C:money}$2{} for scored {C:attention}Gold Cards{}',
            [3] = 'If on Linux: {C:blue}Chips{} based on a cumulative amount of all your stats.',
            [4] = 'For more info, View our documentation at',
            [5] = 'https://rosie.nekoweb.org/balatro/documentation',
            [6] = 'If on Mobile: {C:attention,s:1.5}Wee Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["rosie_rosie_jokers"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (love.system.getOS() == "Windows" and SMODS.get_enhancements(context.other_card)["m_glass"] == true) then
                return {
                    mult = card.ability.extra.mult
                }
            elseif (love.system.getOS() == "OS X" and SMODS.get_enhancements(context.other_card)["m_gold"] == true) then
                return {
                    dollars = card.ability.extra.dollars
                }
            elseif (love.system.getOS() == "Android" or love.system.getOS() == "iOS") then
                for i = 1, card.ability.extra.repetitions do
              local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_wee_joker' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
          end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if love.system.getOS() == "Linux" then
                local linuxchips_value = card.ability.extra.linuxchips
                card.ability.extra.linuxchips = (card.ability.extra.linuxchips) + G.GAME.hands['High Card'].played
                card.ability.extra.linuxchips = math.max(0, (card.ability.extra.linuxchips) - G.GAME.hands['High Card'].level)
                card.ability.extra.linuxchips = (card.ability.extra.linuxchips) * os.date("*t", os.time()).wday
                card.ability.extra.linuxchips = (card.ability.extra.linuxchips) + G.GAME.dollars
                card.ability.extra.var1 = (card.ability.extra.var1) + (G.hand and G.hand.cards[1] and G.hand.cards[1].base.id or 0)
                return {
                    message = "+High card plays",
                    extra = {
                        message = "-High card level",
                        colour = G.C.RED,
                        extra = {
                            message = "Xcurrent week day",
                            colour = G.C.MULT,
                        extra = {
                            message = "+money",
                            colour = G.C.GREEN,
                        extra = {
                            message = "+leftmost rank",
                            colour = G.C.GREEN
                        }
                        }
                        }
                        }
                }
            end
        end
    end
}