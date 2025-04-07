instrument { name = "ATR", overlay = false, icon="indicators:ATR" }

period = input (14, "Period", input.integer, 1   )
fn     = input (averages.ssma, "Average", input.string_selection, averages.titles)

input_group {
    "General Line",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local averageFunction = averages [fn]

plot (averageFunction (tr, period), "ATR", color, width)
