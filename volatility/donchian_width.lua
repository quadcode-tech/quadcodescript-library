instrument { name = "Donchian Width", overlay = false }

period = input (20, "front.period", input.integer, 1)

input_group {
    "front.ind.dpo.generalline",
    color   = input { default = "#57A1D0", type = input.color },
    width   = input { default = 1, type = input.line_width }
}


upper = highest (high, period)
lower = lowest  (low, period)

dw = upper - lower

plot (dw [1], "Width", color, width)
