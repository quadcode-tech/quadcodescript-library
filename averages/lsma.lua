instrument { name = "LSMA", overlay = true }

period = input (25,"Period", input.integer,  1, 200)
offset = input (0, "Offset", input.integer, -100, 100)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = rgba(86,206,255,0.75), type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (linreg (sourceSeries, period, offset), "LSMA", color, width)
