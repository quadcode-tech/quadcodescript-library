instrument { name = "DeMarker" }

period = input (13, "front.period", input.integer,  1)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (80, "front.overbought", input.double, 1, 100, 1, false),
    oversold = input (20, "front.oversold", input.double, 1, 100, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

fill_area (overbought, oversold, "", bg_color)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

dem_max = max (high - high[1], 0)
dem_min = max (low[1] - low, 0)

s_dem_max = sma (dem_max, period)
s_dem_min = sma (dem_min, period)

dem = s_dem_max / (s_dem_min + s_dem_max) * 100

plot (dem, "DeM", color, width)
