instrument { name = "Mass Index", overlay = false }

period  = input (10, "front.period", input.integer, 1, 200)
ema_period = input (9, "front.newind.emaperiod", input.integer, 1, 200)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.bulge",
    bulge = input (27, "front.value", input.double, 0),
    bulge_color  = input { default = rgba(255,255,255,0.15), type = input.color },
    bulge_width  = input { default = 1, type = input.line_width}
}

ema_9 = ema (hml, ema_period)
ema_ema_9 = ema (ema_9, ema_period)

mi = sum (ema_9 / ema_ema_9, period)

hline { value = bulge, color = bulge_color, width = bulge_width }
plot (mi, "MI", color, width)
