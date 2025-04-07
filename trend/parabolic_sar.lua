instrument { name = "Parabolic SAR", overlay = true }

min_af  = input (0.02,"Acceleration Minimum", input.double,  0.01, 1, 0.01)
step_af = input (0.02,"Acceleration", input.double,  0.01, 1, 0.01)
max_af  = input (0.2,"Acceleration Maximum", input.double,  0.01, 1, 0.01)

input_group {
    "General Line",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

psar = sar (min_af, step_af, max_af)
plot (psar, "PSAR", color, width, 0, style.points)
