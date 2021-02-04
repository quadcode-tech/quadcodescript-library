instrument { name = "Bollinger Bands Width", overlay = false, icon = "indicators:BB" }

period = input (20, "front.period", input.integer,  1)
devs   = input (2, "front.newind.stddev", input.integer, 1)

source = input (1, "front.ind.source", input.string_selection, inputs.titles)
fn     = input (1, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

middle = averageFunction (sourceSeries, period)
scaled_dev = 2 * devs * stdev (sourceSeries, period)

pb = scaled_dev / middle

plot (pb, "front.width line", color, width)
