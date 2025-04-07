instrument { name = "Linear Regression R2", overlay = false }

period  = input (14, "Period", input.integer, 3)

source = input (inputs.close, "Source", input.string_selection, inputs.titles)

input_group {
    "General Line",
    color = input { default = "#B42EFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}


local sourceSeries = inputs [source]

r = correlation (index_range (1), sourceSeries, period)

plot (r ^ 2, "R2", color, width)
