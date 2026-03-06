SMODS.Consumable {
    key = '8_wheel',
    set = 'gambling',
    pos = { x = 9, y = 0 },
    config = { extra = {
    } },
    loc_txt = {
        name = 'WHEEL',
        text = {
        [1] = '{C:hearts}HEARTS{} or {C:spades}SPADES{}'
	}
    },
    cost = 0,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
use = function(self, card, area, copier)
    local roll = pseudorandom('wheel_randomshitishouldreallylookupwahtthistextvaluedoesbecausereallyiahaventseenithaveanyspecificeffect', 0, 1)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                    if roll == 0 then
                        SMODS.add_card{ set = "Base", suit = 'H' }
                        SMODS.add_card{ set = "Base", suit = 'H' }
                        SMODS.add_card{ set = "Base", suit = 'H' }
                    else 
                        SMODS.add_card{ set = "Base", suit = 'S' }
                        SMODS.add_card{ set = "Base", suit = 'S' }
                        SMODS.add_card{ set = "Base", suit = 'S' }
                    end
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
        can_use = function(self, card)
        return true
    end
}