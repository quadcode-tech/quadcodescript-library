instrument { name = "Pretty Good Oscillator" }

period = input (14, "Period", input.integer, 2)

input_group {
    "General Line",
    color = input { default = "#21B190", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Support Lines",
    overbought = input (2, "Overbought", input.double, 0, 100, 1, false),
    oversold = input (-2, "Oversold", input.double, -100, 0, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width},
    support_visible = input { default = true, type = input.plot_visibility }
}

if support_visible then
    fill_area (overbought, oversold, "", bg_color)
end

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

pgo = (close - sma (close, period)) / ema (tr, period)

plot (pgo, "PGO", color, width)

if support_visible then
    hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
    hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

    hline { value = overbought + 1, color = "#0000000", show_label = false }
    hline { value = oversold - 1, color = "#0000000", show_label = false }
end