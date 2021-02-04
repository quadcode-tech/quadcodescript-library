instrument { name = "Ultimate Oscillator" }

period1 = input (7,  "Period 1", input.integer,  1)
period2 = input (14, "Period 2", input.integer,  1)
period3 = input (28, "Period 3", input.integer,  1)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#DB4931", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (70, "front.overbought", input.double, 1, 100, 1, false),
    oversold = input (30, "front.oversold", input.double, 0, 100, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

bp = close - min (low, close [1])

avg1 = sum (bp, period1) / sum (tr, period1)
avg2 = sum (bp, period2) / sum (tr, period2)
avg3 = sum (bp, period3) / sum (tr, period3)

uo = (100 / 7) * (4 * avg1 + 2 * avg2 + avg3)

fill_area (overbought, oversold, "", bg_color)
hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

plot (uo, "UO", color, width)
