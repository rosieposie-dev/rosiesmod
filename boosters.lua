SMODS.Booster {
    key = 'casino_pack2',
    loc_txt = {
        name = "Casino Pack",
        text = {
            "Choose 1 of up to",
            "3 Casino Cards",
            "to be used immediately"
        },
        group_name = "rosie_boosters"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "rosie_boosters",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "gambling",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosie_casino_pack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("32b35d"))
        ease_background_colour({ new_colour = HEX('32b35d'), special_colour = HEX("33a992"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'casino_pack',
    loc_txt = {
        name = "Casino Pack",
        text = {
            "Choose 1 of up to",
            "3 Casino Cards",
            "to be used immediately"
        },
        group_name = "rosie_boosters"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    group_key = "rosie_boosters",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "gambling",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosie_casino_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("32b35d"))
        ease_background_colour({ new_colour = HEX('32b35d'), special_colour = HEX("33a992"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'jumbo_casino_pack',
    loc_txt = {
        name = "Jumbo Casino Pack",
        text = {
            "Choose 1 of up to",
            "5 Casino Cards",
            "to be used immediately"
        },
        group_name = "rosie_boosters"
    },
    config = { extra = 5, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    group_key = "rosie_boosters",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "gambling",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosie_jumbo_casino_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("32b35d"))
        ease_background_colour({ new_colour = HEX('32b35d'), special_colour = HEX("33a992"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'mega_casino_pack',
    loc_txt = {
        name = "Mega Casino Pack",
        text = {
            "Choose 2 of up to",
            "5 Casino Cards",
            "to be used immediately"
        },
        group_name = "rosie_boosters"
    },
    config = { extra = 5, choose = 2 },
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    group_key = "rosie_boosters",
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "gambling",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "rosie_mega_casino_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("32b35d"))
        ease_background_colour({ new_colour = HEX('32b35d'), special_colour = HEX("33a992"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
