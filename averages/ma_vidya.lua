instrument { name = "Variable Index Dynamic Average", short_name = "VIDYA", overlay = true, icon="indicators:MA" }

period = input (9, "Period", input.integer, 1)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = "#B42EFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (vidya (sourceSeries, period), "VIDYA", color, width)
