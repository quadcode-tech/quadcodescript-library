instrument { name = "Relative Volatility" }

input_group {
    "General Line",
    stdev_period = input (10, "Standard Deviation", input.double, 1),
    avg_period = input (14, "Smoothing Period", input.double, 1),
    source = input (1, "Source", input.string_selection, inputs.titles),
    fn     = input (averages.ema, "Smoothing Function", input.string_selection, averages.titles),

    color  = input { default = "#2CAC40", type = input.color },
    width  = input { default = 1, type = input.line_width}
}

input_group {
    "Support Lines",
    overbought = input (70, "Overbought", input.double, 1, 100, 1, false),
    oversold = input (30, "Oversold", input.double, 1, 100, 1, false),

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(37,225,84,0.20), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

dev = stdev (sourceSeries, stdev_period)

up = iff (nz (get_value (change (sourceSeries))) >= 0, dev, 0)
down = iff (nz (get_value (change (sourceSeries))) < 0, dev, 0)

up_sum = averageFunction (up, avg_period)
down_sum = averageFunction (down, avg_period)

res = 100 * up_sum / (up_sum + down_sum)

if nz(res, 50) > overbought then
    fill (overbought, res, "", bg_color)
else
    fill (overbought, res, "", "#0000000")
end

if nz(res, 50) < oversold then
    fill (res, oversold, "", bg_color)
else
    fill (res, oversold, "", "#0000000")
end

hline { value = overbought, color = overbought_color, width = support_width }
hline { value = oversold, color = oversold_color, width = support_width }
hline { value = 50, color = zero_color, width = support_width }

plot (res, "RVI", color, width)

hline { value = 90, color = "#0000000", show_label = false }
hline { value = 10, color = "#0000000", show_label = false }
