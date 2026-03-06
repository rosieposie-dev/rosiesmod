SMODS.Consumable {
    key = 'wheelofmisfortune',
    set = 'Tarot',
    pos = { x = 0, y = 1 },
    config = { extra = {
        jokercount = 1,
        odds = 4,
        edition_amount = 1,
        odds = 4
    } },
    loc_txt = {
        name = 'Wheel of Misfortune',
        text = {
        [1] = '{C:green}1 in 4{} chance to add {C:dark_edition}Polychrome{} edition',
        [2] = 'to a random {C:attention}Joker{}',
        [3] = '{E:1}{C:green}1 in 4{} chance to destroy all jokers.{}'
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
            if SMODS.pseudorandom_probability(card, 'group_0_91c81d5f', 1, card.ability.extra.odds, 'c_rosie_wheelofmisfortune', false) then
                
                local jokers_to_edition = {}
            local eligible_jokers = {}
            
            if 'editionless' == 'editionless' then
                eligible_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
            else
                for _, joker in pairs(G.jokers.cards) do
                    if joker.ability.set == 'Joker' then
                        eligible_jokers[#eligible_jokers + 1] = joker
                    end
                end
            end
            
            if #eligible_jokers > 0 then
                local temp_jokers = {}
                for _, joker in ipairs(eligible_jokers) do 
                    temp_jokers[#temp_jokers + 1] = joker 
                end
                
                pseudoshuffle(temp_jokers, 76543)
                
                for i = 1, math.min(card.ability.extra.edition_amount, #temp_jokers) do
                    jokers_to_edition[#jokers_to_edition + 1] = temp_jokers[i]
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            for _, joker in pairs(jokers_to_edition) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        joker:set_edition({ polychrome = true }, true)
                        return true
                    end
                }))
            end
            delay(0.6)
            end
            if SMODS.pseudorandom_probability(card, 'group_0_429351cd', 1, card.ability.extra.odds, 'c_rosie_wheelofmisfortune', false) then
                
                local jokers_to_destroy = {}
            local deletable_jokers = {}
            
            for _, joker in pairs(G.jokers.cards) do
                if joker.ability.set == 'Joker' and not SMODS.is_eternal(joker, card) then
                    deletable_jokers[#deletable_jokers + 1] = joker
                end
            end
            
            if #deletable_jokers > 0 then
                local temp_jokers = {}
                for _, joker in ipairs(deletable_jokers) do 
                    temp_jokers[#temp_jokers + 1] = joker 
                end
                
                pseudoshuffle(temp_jokers, 98765)
                
                for i = 1, math.min(card.ability.extra.jokercount + (#(G.jokers and G.jokers.cards or {})), #temp_jokers) do
                    jokers_to_destroy[#jokers_to_destroy + 1] = temp_jokers[i]
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            local _first_dissolve = nil
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.75,
                func = function()
                    for _, joker in pairs(jokers_to_destroy) do
                        joker:start_dissolve(nil, _first_dissolve)
                        _first_dissolve = true
                    end
                    return true
                end
            }))
            delay(0.6)
            end
    end,
    can_use = function(self, card)
        return true
    end
}