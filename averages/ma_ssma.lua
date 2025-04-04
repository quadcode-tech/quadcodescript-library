instrument { name = "Smoothed Simple Moving Average", short_name = "SSMA", overlay = true, icon="indicators:MA" }

period = input (7, "Period", input.integer, 1)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = "#DB4931", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (ssma (sourceSeries, period), "SSMA", color, width)
