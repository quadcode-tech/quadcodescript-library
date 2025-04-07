instrument { name = "KDJ" }

input_group {
    "%K",
    k_period = input (9, "Period", input.integer, 1),
    smooth = input (3, "Smoothing", input.integer, 1),

    source = input (1, "Source", input.string_selection, inputs.titles),

    k_color  = input { default = "#FF7700", type = input.color },
    k_width  = input { default = 1, type = input.line_width}
}

input_group {
    "%D",
    d_period = input (3, "Period", input.integer, 1),

    d_color  = input { default = "#25E154", type = input.color },
    d_width  = input { default = 1, type = input.line_width}
}

input_group {
    "%J",
    j_color  = input { default = "#B42EFF", type = input.color },
    j_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Support Lines",
    overbought = input (80, "Overbought", input.double, 1, 100, 1, false),
    oversold = input (20, "Oversold", input.double, 1, 100, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },

    support_width  = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

k = sma (stochastic (sourceSeries, k_period), smooth) * 100
d = sma (k, d_period)
j = 3 * k - 2 * d

fill_area (overbought, oversold, "", bg_color)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

plot (k, "%K", k_color, k_width)
plot (d, "%D", d_color, d_width)
plot (j, "%J", j_color, j_width)

hline { value = 90, color = rgba(255,255,255,0.15), show_label = false }
hline { value = 10, color = rgba(255,255,255,0.15), show_label = false }
