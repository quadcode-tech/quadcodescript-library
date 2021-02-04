instrument { name = "Parabolic SAR", overlay = true }

min_af  = input (0.02,"front.newind.parabolicsar.accelmin", input.double,  0.01, 1, 0.01)
step_af = input (0.02,"front.platform.acceleration", input.double,  0.01, 1, 0.01)
max_af  = input (0.2,"front.platform.acceleration max", input.double,  0.01, 1, 0.01)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

psar = sar (min_af, step_af, max_af)
plot (psar, "PSAR", color, width, 0, style.points)
