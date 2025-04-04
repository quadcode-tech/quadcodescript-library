instrument { name = "Moving Average", overlay = true, icon="indicators:MA" }

period = input (14, "Period", input.integer, 1)

source = input (1, "Source", input.string_selection, inputs.titles_overlay)
fn     = input (1, "Average", input.string_selection, averages.titles)

input_group {
    "General Line",
    color = input { default = "red", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

plot (averageFunction (sourceSeries, period), inputs.titles [source], color, width)
