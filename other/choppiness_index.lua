instrument { name = "Choppiness Index" }

input_group {
    "front.ind.dpo.generalline",
    period = input (14, "front.period", input.double, 1),

    color  = input { default = "#57A1D0", type = input.color },
    width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (61.8, "front.overbought", input.double, 1, 100, 1, false),
    oversold = input (38.2, "front.oversold", input.double, 1, 100, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

res = 100 * log (sum (tr, period) / (highest (period) - lowest (period))) / log (period)

fill_area (overbought, oversold, "", bg_color)

plot (res, "CHOP", color, width)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

hline { value = 100, color = "#0000000", show_label = false }
hline { value = 0, color = "#0000000", show_label = false }
