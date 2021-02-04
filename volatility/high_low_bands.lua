instrument { name = "High Low Bands", overlay = true }

period = input (10, "front.period", input.integer, 1)
shift = input (0.1, "front.newind.percentshift", input.double, 0.01, 300, 0.01)

source = input (1, "front.ind.source", input.string_selection,  inputs.titles_overlay)

input_group {
    "front.top line",
    upper_line_visible = input { default = true, type = input.plot_visibility },
    upper_line_color   = input { default = "#B42EFF", type = input.color },
    upper_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.middle line",
    middle_line_visible = input { default = true, type = input.plot_visibility },
    middle_line_color   = input { default = rgba(180,46,255,0.5), type = input.color },
    middle_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.bottom line",
    lower_line_visible = input { default = true, type = input.plot_visibility },
    lower_line_color   = input { default = "#B42EFF", type = input.color },
    lower_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.newind.adx.fill",
    fill_visible = input { default = true, type = input.plot_visibility },
    fill_color   = input { default = rgba(180,46,255,0.05), type = input.color },
}

local sourceSeries = inputs [source]

middle =  tma (sourceSeries, period)
offset = middle * shift / 100

upper = middle + offset
lower = middle - offset

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
