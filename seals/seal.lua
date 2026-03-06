SMODS.Seal {
    key = 'seal',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('cef7f2'),
   loc_txt = {
        name = 'Seal',
        label = 'Seal',
        text = {
        [1] = 'Seal'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
        end
    end
}