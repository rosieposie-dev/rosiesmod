SMODS.Consumable {
    key = '2_slots',
    set = 'gambling',
    pos = { x = 7, y = 0 },
    config = { extra = {
        dollars_value = 0,
        hands_value = 0,
        discards_value = 0,
    } },
    loc_txt = {
        name = 'Slots',
        text = {
        [1] = '{C:green}RANDOM {}{C:money}MONEY {}{C:blue}HANDS {}{C:red}DISCARD{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        card.ability.extra.dollars_value = pseudorandom('dollars_1d5e2862', 0, 100)
	card.ability.extra.hands_value = pseudorandom('hands_1d5e2862', 1, 8)
	card.ability.extra.discards_value = pseudorandom('discards_1d5e2862', 0, 8)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local current_dollars = G.GAME.dollars
                    local target_dollars = card.ability.extra.dollars_value
                    local difference = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(card.ability.extra.dollars_value), colour = G.C.MONEY})
                    ease_dollars(difference, true)
                    return true
                end
            }))
            delay(0.6)
            local mod = card.ability.extra.hands_value - G.GAME.round_resets.hands
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.hands_value).." Hands", colour = G.C.BLUE})
                    
        G.GAME.round_resets.hands = card.ability.extra.hands_value
        ease_hands_played(card.ability.extra.hands_value - G.GAME.current_round.hands_left)
        
                    return true
                end
            }))
            delay(0.6)
            local mod = card.ability.extra.discards_value - G.GAME.round_resets.discards
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.discards_value).." Discards", colour = G.C.BLUE})
                    
        G.GAME.round_resets.discards = card.ability.extra.discards_value
        ease_discard(card.ability.extra.discards_value - G.GAME.current_round.discards_left)
        
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}