instrument { name = "Williams %R" }

input_group {
    "%R",
    k_period = input (14, "Period", input.integer, 1),

    k_color  = input { default = "#56CEFF", type = input.color },
    k_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Support Lines",
    overbought = input (-20, "Overbought", input.double, -100, 0, 1, false),
    oversold = input (-80, "Oversold", input.double, -100, 0, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },

    support_width  = input { default = 1, type = input.line_width}
}

local averageFunction = averages [fn]

hh = highest (k_period)
ll = lowest (k_period)

diff = hh - ll
rdiff = close - hh

r = 100 * rdiff / diff

fill_area (overbought, oversold, "", bg_color)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

plot (r, "%R", k_color, k_width)
