instrument { name = "Simple Moving Average", short_name = "SMA", overlay = true, icon="indicators:MA" }

period = input (9, "Period", input.integer, 1)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = "#DB4931", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (sma (sourceSeries, period), "SMA", color, width)
