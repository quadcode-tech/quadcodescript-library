instrument { name = "Belkhayate Timing", short_name = "BT" }

period = input (34, "Period", input.integer, 1)
range1 = input (4, "Range 1", input.integer, 1)
range2 = input (8, "Range 2", input.integer, 1)

show_hlc = input (false, "Smoothing Oscillator", input.boolean)

input_group {
    "Oscillator",
    oscillator_color = input { default = rgba(255,255,255,0.5), type=input.color },
    oscillator_width = input { default = 1, type=input.line_width },
    oscillator_visible = input { default = false, type=input.plot_visibility }
}

input_group {
    "Belkhayate Candles Style",
    candles_up_color = input { default = "#2CAC40", type=input.color },
    candles_down_color = input { default = "#DB4931", type=input.color },
    candles_visible = input { default = true, type=input.plot_visibility }
}

input_group {
    "Lines",
    lines_color = input { default = rgba(255,255,255,0.15), type=input.color },
    lines_width = input { default = 1, type=input.line_width },
    lines_visible = input { default = true, type=input.plot_visibility }
}

input_group {
    "ADX Fill",
    fill_up_color = input { default = rgba(44,172,64,0.2), type=input.color },
    fill_down_color = input { default = rgba(219,73,49,0.2), type=input.color },
    fill_visible = input { default = true, type=input.plot_visibility }
}

input_group {
    "Baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type=input.color },
    zero_width = input { default = 1, type=input.line_width },
    zero_visible = input { default = true, type=input.plot_visibility }
}

if fill_visible then
    fill (range1, range2, "", fill_down_color)
    fill (-range1, -range2, "", fill_up_color)
end

if lines_visible then
    hline (range1, "", lines_color, lines_width)
    hline (-range1, "", lines_color, lines_width)
    hline (range2, "", lines_color, lines_width)
    hline (-range2, "", lines_color, lines_width)
end

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

middle = sma (hl2, period)
scale =  sma (hml, period)

h = (high - middle) / scale
l = (low - middle) / scale
o = (open - middle) / scale
c = (close - middle) / scale

if candles_visible then
    plot_candle (o, h, l, c, "BT", iff (c > o, candles_up_color, candles_down_color))
end

if oscillator_visible then
    ht = iff (show_hlc, (h + l + c) / 3, c)
    plot (ht, "BT", oscillator_color, oscillator_width)
end
