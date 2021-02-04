-- http://traders.com/documentation/feedbk_docs/2002/06/Abstracts_new/Pee/pee.html
-- https://www.linnsoft.com/techind/trend-intensity-index-tii
-- https://user42.tuxfamily.org/chart/manual/Trend-Intensity-Index.html

instrument { name = "Trend Intensity Index" }

input_group {
    "front.ind.dpo.generalline",

    major_period = input (60, "front.newind.tii.major_period", input.double, 2),
    minor_period = input (30, "front.newind.tii.minor_period", input.double, 2),

    source = input (1, "front.ind.source", input.string_selection, inputs.titles),

    color  = input { default = "#DB4931", type = input.color },
    width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (80, "front.overbought", input.double, 1, 100, 1, false),
    oversold = input (20, "front.oversold", input.double, 1, 100, 1, false),

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

ma  = sma (sourceSeries, major_period)
dev = sourceSeries - ma

up   = max (dev, 0)
down = min (dev, 0)

up_sum   =  sum (up,   minor_period)
down_sum = -sum (down, minor_period)

res = 100 * up_sum / (up_sum + down_sum)

fill (overbought, oversold, "", bg_color)

hline { value = overbought, color = overbought_color, width = support_width }
hline { value = oversold, color = oversold_color, width = support_width }
hline { value = 50, color = zero_color, width = support_width }

plot (res, "TII", color, width)

hline { value = 90, color = "#0000000", show_label = false }
hline { value = 10, color = "#0000000", show_label = false }
