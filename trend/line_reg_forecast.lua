instrument { name = "Linear Regression Forecast", overlay = true }

period = input (14,"front.period", input.integer,  2)
source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#FF6C58", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (linreg (sourceSeries, period, 0), "Forecast", color, width)
