instrument { name = "Aroon" }

period = input (14, "front.period", input.integer, 1, 200)

input_group {
    "Aroon Up",
    up_color = input { default = "#FF7700", type = input.color },
    up_width = input { default = 1, type = input.line_width },
    up_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Aroon Down",
    down_color = input { default = "#56CEFF", type = input.color },
    down_width = input { default = 1, type = input.line_width },
    down_visible = input { default = true, type = input.plot_visibility }
}

if up_visible then
    up = (period - bars_since_highest (period)) / period * 100
    plot (up, "Up", up_color, up_width)
end

if down_visible then
    down = (period - bars_since_lowest (period)) / period * 100
    plot (down, "Down", down_color, down_width)
end
