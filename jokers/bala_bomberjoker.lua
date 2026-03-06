SMODS.Joker{ --Bomber Joker
    key = "bala_bomberjoker",
    config = {
        extra = {
            Rounds = 4,
            Mult = 1,
            did_it_already = 0,
            n = 0,
            no = 0,
            var1 = 0,
            explode = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bomber Joker',
        ['text'] = {
            [1] = '{X:mult,C:white}X0.5{} Mult {C:attention}every round{} you have this joker',
            [2] = '{C:attention}PLAYER!!!{} THERES A {C:red}BOMB {}STRAPPED TO MY CHEST!!',
            [3] = 'IT\'S GONNA {C:red}EXPLODE {}IN {C:attention}4-8 ROUNDS{} UNLESS',
            [4] = '{C:attention}YOU SELL THIS CARD!!!!{}',
            [5] = '{C:inactive}Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosie_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Rounds, card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if not ((G.GAME.pool_flags.rosie_did_it_already or false)) then
                G.GAME.pool_flags.rosie_did_it_already = true
                return {
                    func = function()
                    card.ability.extra.Rounds = pseudorandom('Rounds_1d5e2862', 4, 8)
                    return true
                end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if not ((card.ability.extra.Rounds or 0) <= 0) then
                return {
                    func = function()
                    card.ability.extra.Rounds = math.max(0, (card.ability.extra.Rounds) - 1)
                    return true
                end,
                    message = "Safe!",
                    extra = {
                        func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + 0.5
                    return true
                end,
                            message = "Safe!",
                        colour = G.C.GREEN
                        }
                }
            elseif (card.ability.extra.Rounds or 0) <= 0 then
                G.GAME.pool_flags.rosie_did_it_already = false
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "KABOOM", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        func = function()
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                local target_joker = nil
                if my_pos and my_pos < #G.jokers.cards then
                    local joker = G.jokers.cards[my_pos + 1]
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "KABOOM", colour = G.C.RED})
                end
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                card:explode()
                return true
            end,
                            message = "KABOOM",
                            colour = G.C.RED
                        }
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Mult
                }
        end
    end
}