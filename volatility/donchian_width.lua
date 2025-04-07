instrument { name = "Donchian Width", overlay = false }

period = input (20, "Period", input.integer, 1)

input_group {
    "General Line",
    color   = input { default = "#57A1D0", type = input.color },
    width   = input { default = 1, type = input.line_width }
}


upper = highest (high, period)
lower = lowest  (low, period)

dw = upper - lower

plot (dw [1], "Width", color, width)
