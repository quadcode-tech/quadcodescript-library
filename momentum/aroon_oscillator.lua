instrument { name = "Aroon Oscillator" }

period = input (14, "front.period", input.integer,  1, 200)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#FF6C58", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.platform.baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

aro = (bars_since_lowest (period) - bars_since_highest (period)) / period * 100

plot (aro, "ARO", color, width)
