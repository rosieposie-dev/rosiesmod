SMODS.Consumable {
    key = '3_d6',
    set = 'gambling',
    pos = { x = 4, y = 0 },
    config = { extra = {
        ante_value = 0,
    } },
    loc_txt = {
        name = 'D6',
        text = {
        [1] = '{C:attention}MOVE{} {C:green}X{} {C:attention}SPACES{}'
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
        card.ability.extra.antes_value = pseudorandom('antes_1d5e2862', 0, 6) 
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Rolled: "..tostring(card.ability.extra.antes_value), colour = G.C.ATTENTION})
                    ease_ante(-G.GAME.round_resets.ante + card.ability.extra.antes_value)
                    return true
                end
            }))
    end,
    can_use = function(self, card)
        return true
    end
}