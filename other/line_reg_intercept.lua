instrument { name = "Linear Regression Intercept", overlay = true }

period = input (14,"Period", input.integer,  2)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = "#9A07ED", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (linreg (sourceSeries, period, period), "Intercept", color, width)
