SMODS.Consumable {
    key = '7_claw',
    set = 'gambling',
    pos = { x = 2, y = 0 },
    config = { extra = {
    } },
    loc_txt = {
        name = 'CLAW',
        text = {
        [1] = '{C:attention}A JOKER.{}'
	}
    },
    cost = 0,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
        can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit or card.area == G.jokers
    end
}