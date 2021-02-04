instrument { name = "RAVI", overlay = false }

short_cycle = input (7, "Short Cycle", input.integer, 1)
long_cycle = input (65, "Long Cycle", input.integer, 1)

overbought = input (3, "front.overbought", input.double, 0, 100, 1, false)
oversold = input (-3, "front.oversold", input.double, -100, 0, 1, false)

source = input (inputs.close, "front.ind.source", input.string_selection,  inputs.titles)
fn     = input (averages.vidya, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.newind.barcolors",
    up_color   = input { default = "#2CAC40", type = input.color },
    down_color = input { default = "#DB4931", type = input.color },
    neutral_color = input { default = "#C7CAD1", type = input.color }
}

input_group {
    "front.platform.baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

short = averageFunction (sourceSeries, short_cycle)
long = averageFunction (sourceSeries, long_cycle)

ravi = (short - long) / long * 100

local color = iff (ravi < oversold, down_color, iff (ravi > overbought, up_color, neutral_color))

rect {
    first = 0,
    second = ravi,
    color = color,
    width = 0.8
}

hline (0, "Zero", zero_color, support_width)
