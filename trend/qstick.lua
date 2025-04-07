instrument { name = "QStick" }

period = input (10,"Period", input.integer,  1)

input_group {
    "General Line",

    color = input { default = "#FF7700", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "ADX Fill",
    fill_up_color = input { default = rgba(37,225,84,0.15), type = input.color },
    fill_down_color = input { default = rgba(255,108,88,0.15), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility }
}

qstick = sma (close - open, period)

if fill_visible then
    fill (qstick, 0, "", qstick > 0 and fill_up_color or fill_down_color)
end

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

plot (qstick, "QStick", color, width)