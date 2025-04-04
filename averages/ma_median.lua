instrument { name = "Median", short_name = "Med", overlay = true, icon="indicators:MA" }

period = input (20, "Period", input.integer, 1)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (median (sourceSeries, period), "Median", color, width)
