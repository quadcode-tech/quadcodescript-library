instrument { name = "Highest High", overlay = true }

period = input (14, "Period", input.integer, 1   )

input_group {
    "General Line",
    color = input { default = "#25E154", type = input.color },
    width = input { default = 1, type = input.line_width}
}

plot (highest (period) [1], "HH", color, width)
