SMODS.Joker{ --ENA
    key = "ena_ena",
    config = {
        extra = {
            mult = 2,
            mult2 = -2
        }
    },
    loc_txt = {
        ['name'] = 'ENA',
        ['text'] = {
            [1] = '{C:red}+2 {}Mult for scored {C:#1#}#1#s{}',
            [2] = '{C:red}-2 {}Mult for scored {C:#2#}#2#s{}',
            [3] = '{s:0.8}Suit changes at start of round{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosie_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {localize((G.GAME.current_round.Good_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.Bad_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.Good_card or {}).suit or 'Spades'], G.C.SUITS[(G.GAME.current_round.Bad_card or {}).suit or 'Spades']}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.Good_card = { suit = 'Diamonds' }
        G.GAME.current_round.Bad_card = { suit = 'Clubs' }
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
                if G.playing_cards then
                    local valid_Good_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_Good_cards[#valid_Good_cards + 1] = v
                        end
                    end
                    if valid_Good_cards[1] then
                        local Good_card = pseudorandom_element(valid_Good_cards, pseudoseed('Good' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.Good_card.suit = Good_card.base.suit
                    end
                end
                if G.playing_cards then
                    local valid_Bad_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_Bad_cards[#valid_Bad_cards + 1] = v
                        end
                    end
                    if valid_Bad_cards[1] then
                        local Bad_card = pseudorandom_element(valid_Bad_cards, pseudoseed('Bad' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.Bad_card.suit = Bad_card.base.suit
                    end
                end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit(G.GAME.current_round.Good_card.suit) then
                return {
                    mult = card.ability.extra.mult
                }
            elseif context.other_card:is_suit(G.GAME.current_round.Bad_card.suit) then
                return {
                    mult = card.ability.extra.mult2
                }
            end
        end
    end
}