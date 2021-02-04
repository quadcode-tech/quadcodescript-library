instrument { name = "Moving Average Deviation", overlay = false, icon="indicators:MA" }

period = input (12, "front.period", input.integer, 1)

source = input (1, "front.ind.source", input.string_selection,  inputs.titles)
fn     = input (1, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.newind.barcolors",
    up_color   = input { default = "#2CAC40", type = input.color },
    down_color = input { default = "#DB4931", type = input.color }
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

mean = averageFunction (sourceSeries, period)
mad = sourceSeries - mean

rect {
    first = 0,
    second = mad,
    color = mad >= mad [1] and up_color or down_color,
    width = 0.4
}
