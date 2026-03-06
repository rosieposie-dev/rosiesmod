SMODS.Consumable {
    key = 'z_chaos',
    set = 'gambling',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'CHAOS',
        text = {
            [1] = '{C:green}RANDOMIZE{} {C:dark_edition}EVERYTHING{}'
        }
    },
    cost = 3,
    unlocked = true,
    weight = 0.5,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.4,
    func = function()

        local vars = {
            function(v) G.GAME.dollars = v end,
            function(v) G.GAME.joker_rate = v end,
            function(v) G.GAME.tarot_rate = v end,
            function(v) G.GAME.planet_rate = v end,
            function(v) G.GAME.spectral_weight = v end,
            function(v) G.GAME.playing_card_rate = v end,
            function(v) G.GAME.shop.joker_max = v end,
            function(v) G.GAME.current_round.hands_left = v end,
            function(v) G.GAME.current_round.discards_left = v end,
            function(v) G.GAME.round_resets.ante = v end,
            function(v) G.GAME.current_round.hand_size = v end,
            function(v) G.GAME.base_reroll_cost = v end,
            function(v) G.GAME.current_round.hand_size = v end
        }

        for i = 1, #vars do
            local ran = pseudorandom('seed', 0, 20)
            vars[i](ran)
        end

        return true
    end
}))
end,
    can_use = function(self, card)
        return true
    end
}