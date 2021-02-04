instrument { name = "Awesome Oscillator", overlay = false }

fast = input (5, "front.platform.fast period", input.integer, 1, 250)
slow = input (34, "front.platform.slow period", input.integer, 1, 250)

input_group {
    "front.newind.barcolors",
    up_color   = input { default = "#2CAC40", type = input.color },
    down_color = input { default = "#DB4931", type = input.color }
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

ao = sma (hl2, fast) - sma (hl2, slow)

rect {
    first = 0,
    second = ao,
    color = ao >= ao [1] and up_color or down_color,
    width = 0.8
}
