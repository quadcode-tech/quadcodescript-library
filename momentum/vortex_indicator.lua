instrument { name = "Vortex Indicator" }

input_group {
    "front.ind.dpo.generalline",
    period = input (14, "front.period", input.integer, 1),

    p_color  = input { default = "#56CEFF", type = input.color },
    m_color  = input { default = "#B42EFF", type = input.color },

    width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (1.1, "front.overbought", input.double, 0, 100, 1, false),
    oversold   = input (0.9, "front.oversold",   input.double, 0, 100, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },

    support_width    = input { default = 1, type = input.line_width}
}

pvm = abs (high - low [1])
mvm = abs (low - high [1])

pvi = sum (pvm, period) / sum (tr, period)
mvi = sum (mvm, period) / sum (tr, period)

fill_area (overbought, oversold, "", bg_color)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

plot (pvi, "VI+", p_color, width)
plot (mvi, "VI-", m_color, width)
