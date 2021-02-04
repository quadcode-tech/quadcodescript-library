instrument { name = "Moving Average", overlay = true, icon="indicators:MA" }

period = input (14, "front.period", input.integer, 1)

source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)
fn     = input (1, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "red", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

plot (averageFunction (sourceSeries, period), inputs.titles [source], color, width)
