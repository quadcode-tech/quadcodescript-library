instrument { name = "Triangular Moving Average", short_name = "TMA", overlay = true, icon="indicators:MA" }

period = input (10, "Period", input.integer, 1)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (tma (sourceSeries, period), "TMA", color, width)
