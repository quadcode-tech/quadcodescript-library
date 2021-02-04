instrument { name = "Lowest Low", overlay = true }

period = input (14, "front.period", input.integer, 1   )

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#FF6C58", type = input.color },
    width = input { default = 1, type = input.line_width}
}

plot (lowest (period) [1], "LL", color, width)
