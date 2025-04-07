instrument { name = "Intraday Momentum Index", overlay = false }

period = input (20, "Period", input.integer, 1   )

input_group {
    "General Line",
    color = input { default = "#DBCF0D", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "Support Lines",
    overbought = input (70, "Overbought", input.double, 1, 100, 1, false),
    oversold = input (30, "Oversold", input.double, 1, 100, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

gain = iff (close >= open, close - open, 0)
loss = iff (close < open, open - close, 0)

imi = sum (gain, period) / (sum (gain, period) + sum (loss, period)) * 100

fill_area (overbought, oversold, "", bg_color)

plot (imi, "IMI", color, width)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

hline { value = 90, color = "#0000000", show_label = false }
hline { value = 10, color = "#0000000", show_label = false }
