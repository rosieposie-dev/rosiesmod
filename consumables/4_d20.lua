SMODS.Consumable {
    key = '4_d20',
    set = 'gambling',
    pos = { x = 3, y = 0 },
    config = { extra = {
        ran_value = 0,
    } },
    loc_txt = {
        name = 'D20',
        text = {
        [1] = '{C:green}ROLL FOR LUCK{}',
	[2] = 'This card is unfinished...'
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
        local roll = pseudorandom('ran_1d5e2862', 1, 20) 
        card.ability.extra.ran_value = roll

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(
                    used_card, 'extra', nil, nil, nil,
                    {message = "Rolled: "..tostring(roll), colour = G.C.ATTENTION}
                )
		card:juice_up(0.3, 0.5)

                if roll <= 1 then
                    G.hand:change_size(card.ability.extra.handsize - 2 )
                elseif roll <= 2 then
                    ease_dollars(-5)
                elseif roll <= 5 then
                    SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                elseif roll <= 10 then
                    ease_dollars(10)
                elseif roll >= 16 and not roll == 20 then
                    SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                elseif roll == 20 then
                    SMODS.add_card({ set = 'Joker', legendary = true })
		    check_for_unlock { type = 'spawn_legendary' }
                else
                    ease_dollars(roll)
                end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return true
    end
}