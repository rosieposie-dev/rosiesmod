SMODS.Joker{ --The Mass
    key = "zthemass",
    config = {
        extra = {
            dollars = 20,
            no = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Mass',
        ['text'] = {
            [1] = '{C:red}The Mass Consumes{} the Joker{s:0.5}(?){} to the left',
            [2] = 'and gives {C:money}$20{}',
            [3] = '{s:0.7,E:1}Must always have a joker to consume.{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = "rosie_foolish",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosiesmo_jokers"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if (function()
        return G.jokers.cards[1] == card
    end)() then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "The Mass Consumes", colour = G.C.RED})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end
                }
            else
                return {
                    func = function()
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                local target_joker = nil
                if my_pos and my_pos > 1 then
                    local joker = G.jokers.cards[my_pos - 1]
                    if not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                    end
                end
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "The Mass Consumes", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        dollars = card.ability.extra.dollars,
                        colour = G.C.MONEY
                        }
                }
            end
        end
    end
}