instrument { name = "Rainbow Oscillator" }

period = input (2, "front.period", input.integer, 1)
hh_period = input (10, "HH/LL Loockback", input.integer, 1)

source = input (1, "front.ind.source", input.string_selection, inputs.titles)

input_group {
    "front.newind.barcolors",
    up_color   = input { default = "#2CAC40", type = input.color },
    down_color = input { default = "#DB4931", type = input.color }
}

input_group {
    "front.newind.lines",
    line_up_color = input { default = "#25E154", type = input.color },
    line_down_color = input { default = "#FF6C58", type = input.color },
    line_width = input { default = 1, type = input.line_width }
}

input_group {
    "front.newind.adx.fill",
    fill_up_color = input { default = rgba(37,225,84,0.2), type = input.color },
    fill_down_color = input { default = rgba(255,108,88,0.2), type = input.color }
}

input_group {
    "front.platform.baseline",

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

local source_series = inputs [source]

ma1  = sma (source_series, period)
ma2  = sma (ma1,           period)
ma3  = sma (ma2,           period)
ma4  = sma (ma3,           period)
ma5  = sma (ma4,           period)
ma6  = sma (ma5,           period)
ma7  = sma (ma6,           period)
ma8  = sma (ma7,           period)
ma9  = sma (ma8,           period)
ma10 = sma (ma9,           period)

hh = highest (source_series, hh_period)
ll = lowest  (source_series, hh_period)

hhma = max (ma1, max (ma2, max (ma3, max (ma4, max (ma5, max (ma6, max (ma7, max (ma8, max (ma9, ma10)))))))))
llma = min (ma1, min (ma2, min (ma3, min (ma4, min (ma5, min (ma6, min (ma7, min (ma8, min (ma9, ma10)))))))))

rb = 100 * (hhma - llma) / (hh - ll)
rbo = 100 * (source_series - (ma1 + ma2 + ma3 + ma4 + ma5 + ma6 + ma7 + ma8 + ma9 + ma10) / 10) / (hh - ll)

fill (-rb, 0, "", fill_down_color)
fill (0, rb,  "", fill_up_color)

plot ( rb, "", line_up_color,   line_width)
plot (-rb, "", line_down_color, line_width)

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

rect {
    first = 0,
    second = rbo,
    color = rbo >= 0 and up_color or down_color,
    width = 0.7
}
