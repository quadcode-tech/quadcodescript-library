instrument { name = "High Minus Low", overlay = false }

input_group {
    "General Line",
    color = input { default = "#2CAC40", type = input.color },
    width = input { default = 1, type = input.line_width}
}

plot (hml, "HH", color, width)
