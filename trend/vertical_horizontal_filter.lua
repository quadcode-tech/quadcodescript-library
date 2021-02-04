instrument { name = "Vertical Horizontal Filter" }

period = input (28, "front.period", input.integer, 1)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#9A07ED", type = input.color },
    width = input { default = 1, type = input.line_width }
}


vfh = (highest (period) - lowest (period)) / sum (abs (change (close)), period)

plot (vfh, "VHF",  color, width)
