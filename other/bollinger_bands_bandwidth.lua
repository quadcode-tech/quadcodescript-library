instrument { name = "Bollinger Bands Width", overlay = false, icon = "indicators:BB" }

period = input (20, "Period", input.integer,  1)
devs   = input (2, "Standard Deviation", input.integer, 1)

source = input (1, "Source", input.string_selection, inputs.titles)
fn     = input (1, "Average", input.string_selection, averages.titles)

input_group {
    "General Line",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

middle = averageFunction (sourceSeries, period)
scaled_dev = 2 * devs * stdev (sourceSeries, period)

pb = scaled_dev / middle

plot (pb, "Width Line", color, width)
