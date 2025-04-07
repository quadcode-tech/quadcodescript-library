instrument { name = "Gopalakrishnan Range Index", overlay = false }

period = input (14, "Period", input.integer, 2   )

input_group {
    "General Line",
    color = input { default = "#DB4931", type = input.color },
    width = input { default = 1, type = input.line_width}
}

gri = log (highest (period) - lowest (period)) / log (period)

plot (gri [1], "GAPO", color, width)
