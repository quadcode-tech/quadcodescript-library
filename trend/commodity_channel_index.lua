instrument { name = "Commodity Channel Index", icon = "indicators:CCI" }

input_group {
    "Commodity Channel Index",
    period = input (20, "front.period", input.double, 1),

    color  = input { default = "#FBE90C", type = input.color },
    width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (100, "front.overbought", input.double, -200, 200, 1, false),
    oversold = input (-100, "front.oversold", input.double, -200, 200, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

nom = hlc3 - sma (hlc3, period)
denom = mad (hlc3, period) * 0.015

res = nom / denom

fill_area (overbought, oversold, "", bg_color)

plot (res, "CCI", color, width)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

hline { value = 120, color = rgba(255,255,255,0.2), show_label = false }
hline { value = -120, color = rgba(255,255,255,0.2), show_label = false }
