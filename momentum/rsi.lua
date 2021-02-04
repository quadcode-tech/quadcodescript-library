instrument { name = "RSI", icon="indicators:RSI" }

input_group {
    "RSI",
    period = input (14, "front.period", input.integer, 1),
    source = input (1, "front.ind.source", input.string_selection, inputs.titles),
    fn     = input (averages.ssma, "front.newind.average", input.string_selection, averages.titles),

    color  = input { default = "#B42EFF", type = input.color },
    width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (70, "front.overbought", input.double, 1, 100, 1, false),
    oversold = input (30, "front.oversold", input.double, 1, 100, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

delta = sourceSeries - sourceSeries [1]

up = averageFunction (max (delta, 0), period)
down = averageFunction (max (-delta, 0), period)

rs = up / down
res = 100 - 100 / (1 + rs)

fill_area (overbought, oversold, "", bg_color)

plot (res, "RSI", color, width)

hline { value = overbought, color = overbought_color, width = support_width, style = style.dash_line }
hline { value = oversold, color = oversold_color, width = support_width, style = style.dash_line }

hline { value = 90, color = rgba(255,255,255,0), show_label = false }
hline { value = 10, color = rgba(255,255,255,0), show_label = false }
