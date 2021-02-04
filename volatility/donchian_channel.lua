instrument { name = "Donchian Channels", overlay = true }

period = input (20, "front.period", input.integer, 1, 200)

input_group {
    "front.top line",
    upper_line_visible = input { default = true, type = input.plot_visibility },
    upper_line_color   = input { default = "#2384C2", type = input.color },
    upper_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.middle line",
    middle_line_visible = input { default = true, type = input.plot_visibility },
    middle_line_color   = input { default = "#FF7700", type = input.color },
    middle_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.bottom line",
    lower_line_visible = input { default = true, type = input.plot_visibility },
    lower_line_color   = input { default = "#2384C2", type = input.color },
    lower_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.newind.adx.fill",
    fill_visible = input { default = true, type = input.plot_visibility },
    fill_color   = input { default = rgba(35,132,194,0.08), type = input.color },
}

upper = highest (high, period)
lower = lowest  (low, period)
middle = (upper + lower) / 2

if fill_visible then
    fill { first = upper, second = lower, color = fill_color }
end

if upper_line_visible then
    plot (upper, "front.top line", upper_line_color, upper_line_width)
end

if lower_line_visible then
    plot (lower, "front.bottom line", lower_line_color, lower_line_width)
end

if middle_line_visible then
    plot (middle, "front.middle line", middle_line_color, middle_line_width)
end
