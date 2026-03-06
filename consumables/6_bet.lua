SMODS.Consumable {
    key = '6_bet',
    set = 'gambling',
    pos = { x = 0, y = 0 },
    config = { extra = {
    } },
    loc_txt = {
        name = 'DRAW',
        text = {
        [1] = '{C:green}DOUBLE MONEY{} or {C:attention}NOTHING{}',
	[2] = '{C:attention}RESPAWNS{}'
	}
    },
    cost = 0,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        local roll = pseudorandom('flip_1d5e2862', 0, 1)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
		card:juice_up(0.3, 0.5)

                if roll == 0 then
		    local double_amount = math.min(G.GAME.dollars, 9999)
                    ease_dollars(double_amount, true)
		    SMODS.add_card({ key = 'c_rosie_6_bet' })
		else
		    ease_dollars(-G.GAME.dollars, true)
		end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.GAME.dollar ~= 0
    end
}