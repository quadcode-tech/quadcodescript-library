instrument { name = "Vertical Horizontal Filter" }

period = input (28, "Period", input.integer, 1)

input_group {
    "General Line",
    color = input { default = "#9A07ED", type = input.color },
    width = input { default = 1, type = input.line_width }
}


vfh = (highest (period) - lowest (period)) / sum (abs (change (close)), period)

plot (vfh, "VHF",  color, width)
