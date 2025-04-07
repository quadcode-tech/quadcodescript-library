instrument { name = "Stochastic Momentum Index" }

input_group {
    "%K",
    k_period = input (10, "Period", input.integer, 1),
    smooth = input (3, "Smoothing Period", input.integer, 1),
    dsmooth = input (3, "Double Smoothing Period", input.integer, 1),

    k_color  = input { default = "#DB4931", type = input.color },
    k_width  = input { default = 1, type = input.line_width}
}

input_group {
    "%D",
    d_period = input (10, "Period", input.integer, 1),
    fn       = input (averages.ema, "Average", input.string_selection, averages.titles),

    d_color  = input { default = "#2CAC40", type = input.color },
    d_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Support Lines",
    overbought = input (40, "Overbought", input.double, 0, 100, 1, false),
    oversold = input (-40, "Oversold", input.double, -100, 0, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },

    support_width  = input { default = 1, type = input.line_width}
}

local averageFunction = averages [fn]

hh = highest (k_period)
ll = lowest (k_period)

diff = hh - ll
rdiff = close - (hh + ll) / 2

avgdiff = ema (ema (diff, smooth), smooth) / 2
avgrdiff = ema (ema (rdiff, smooth), smooth)

k = averageFunction (avgrdiff / avgdiff, dsmooth) * 100
d = averageFunction (k, d_period)

fill_area (overbought, oversold, "", bg_color)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

plot (k, "%K", k_color, k_width)
plot (d, "%D", d_color, d_width)
