instrument { name = "ALMA", overlay = true }

period = input (9, "Period", input.integer, 1,  100)
offset = input (0.85, "Offset", input.double,  0, 100, 0.01)
sigma  = input (6, "Alma Sigma",  input.double,  0.01, 10, 1)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "Alma Line",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width }
}

local sourceSeries = inputs [source]

plot (alma (sourceSeries, period, offset, sigma), "ALMA", color, width)
