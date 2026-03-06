SMODS.Enhancement {
    key = 'frozen',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            Chips = 1
        }
    },
    loc_txt = {
        name = 'Frozen',
        text = {
        [1] = '{C:planet}Gets {}{X:planet,C:white}Stronger{} {C:planet}when scored.{}',
        [2] = '{C:hearts}Resets if not played.{}'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = false,
    no_collection = true,
    weight = -9999,
	in_pool = function(self, args)
		if args ~= nil then
			return args.source ~= 'sta'
		else return true
		end
	end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.Chips = (card.ability.extra.Chips) + 0.1
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Got stronger.", colour = G.C.BLUE})
            SMODS.calculate_effect({x_chips = card.ability.extra.Chips}, card)
        end
        if context.cardarea == G.hand and context.main_scoring then
            card.ability.extra.Chips = 1
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Aborted.", colour = G.C.BLUE})
        end
        if context.discard and context.other_card == card then
            return { func = function()
                    card.ability.extra.Chips = 1
                    return true
                end }
        end
    end
}