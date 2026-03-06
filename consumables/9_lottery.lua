SMODS.Consumable {
    key = '9_lottery',
    set = 'gambling',
    pos = { x = 6, y = 0 },
    config = { extra = {
        odds = 2,
        double_limit = 9999
    } },
    loc_txt = {
        name = 'LOTTERY',
        text = {
        [1] = '{C:attention}YEAH, GOOD LUCK WITH THAT{}'
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
        local roll = pseudorandom('this_oneyouwillnotgetunlessyoureallyareluckybecausebalatroluckisrigged', 0, 10)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
		card:juice_up(0.3, 0.5)

                if roll == 0 then
                ease_dollars(100, true)
		end

                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.GAME.dollar ~= 0
    end
}