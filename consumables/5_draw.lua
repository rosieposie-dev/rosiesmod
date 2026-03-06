SMODS.Consumable {
    key = '5_draw',
    set = 'gambling',
    pos = { x = 5, y = 0 },
    config = { extra = {
        hand_type = 'High Card',
    } },
    loc_txt = {
        name = 'DRAW',
        text = {
        [1] = '{C:green}PULL{} {C:attention}A GOOD{} {C:planet}HAND{}',
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
	HandList = {"High Card", "Pair", "Three of a Kind", "Full House", "Four of a Kind", 'Flush', 'Straight', 'Two Pair', 'Straight Flush', 'Five of a Kind', 'Flush House', 'Flsuh Five'}
        local roll = pseudorandom('hand_1d5e2862', 1, 12)
        card.ability.extra.hand_type = HandList[roll]

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(
                    used_card, 'extra', nil, nil, nil,
                    {message = "Rolled: "..HandList[roll], colour = G.C.PLANET}
                )
		card:juice_up(0.3, 0.5)

                SMODS.smart_level_up_hand(card, card.ability.extra.hand_type, true)

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return true
    end
}