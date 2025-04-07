instrument { name = "Elder Ray Index" }

period = input (13, "Period", input.integer, 1)

local wide_rect = 0.85
local narrow_rect = 0.65

input_group {
    "Bar Colors",

    bull_color = input { default = "#2CAC40",   type = input.color },
    bear_color = input { default = "#DB4931",   type = input.color }
}

input_group {
    "Baseline",

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width }
}

ma = ema (close, period)

elder_bull = high - ma
elder_bear = low - ma

if elder_bull >= 0 then
    rect {
        first = 0,
        second = elder_bull,
        color = bull_color,
        width = wide_rect
    }
end

if elder_bear >= 0 then
    rect {
        first = 0,
        second = elder_bear,
        color = bear_color,
        width = narrow_rect
    }
else
    rect {
        first = 0,
        second = elder_bear,
        color = bear_color,
        width = wide_rect
    }
end

if elder_bull < 0 then
    rect {
        first = 0,
        second = elder_bull,
        color = bull_color,
        width = narrow_rect
    }
end

hline (0, "", zero_color, zero_width)
