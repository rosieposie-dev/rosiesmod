SMODS.Consumable {
    key = '1_winbig',
    set = 'gambling',
    pos = { x = 1, y = 1 },
    config = { extra = {
        odds = 2,
        double_limit = 9999
    } },
    loc_txt = {
        name = 'WIN BIG',
        text = {
        [1] = '{C:green}GET MONEY{} or {C:attention}LOSE MONEY{}'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        local roll = pseudorandom('flip_1dfdsawe2862idontknowhowrandomizingworks', 0, 1)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
		card:juice_up(0.3, 0.5)

                if roll == 0 then
                ease_dollars(5, true)
		else
		    ease_dollars(-5, true)
		end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.GAME.dollar ~= 0
    end
}