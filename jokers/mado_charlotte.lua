SMODS.Joker{ --Charlotte
    key = "mado_charlotte",
    config = {
        extra = {
            chips = 0,
            no = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Charlotte',
        ['text'] = {
            [1] = 'All {C:diamonds}Diamonds{} held in hand are destroyed.',
            [2] = 'Gains {C:blue}+10{} Chips when this Joker destroys a card.',
            [3] = '{C:inactive}(Currently {}{C:blue}+#1# {}{C:inactive}chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["rosie_rosiesmo_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if context.other_card:is_suit("Diamonds") then
                context.other_card.should_destroy = true
		SMODS.destroy_cards(context.other_card)
                return {
                    func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + 10
                    return true
                end,
                    extra = {
                        message = "Ate!",
                        colour = G.C.MONEY
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
        end
        if context.buying_card  and not context.blueprint then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_greedy_joker" then
              return true
          end
      end
      return false
  end)() then
                return {
                    func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_greedy_joker" and not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ate!", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + 50
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
    end
}