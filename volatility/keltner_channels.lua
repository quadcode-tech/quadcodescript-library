instrument { name = "Keltner Channels", overlay = true }

period = input (20, "front.period", input.integer, 1)
shift =  input (5,  "front.newind.offset", input.double, 0.01, 300, 0.01)

fn     = input (averages.ema, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.top line",
    upper_line_visible = input { default = true, type = input.plot_visibility },
    upper_line_color   = input { default = "#21B190", type = input.color },
    upper_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.middle line",
    middle_line_visible = input { default = true, type = input.plot_visibility },
    middle_line_color   = input { default = rgba(33,177,144,0.6), type = input.color },
    middle_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.bottom line",
    lower_line_visible = input { default = true, type = input.plot_visibility },
    lower_line_color   = input { default = "#21B190", type = input.color },
    lower_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.newind.adx.fill",
    fill_visible = input { default = true, type = input.plot_visibility },
    fill_color   = input { default = rgba(33,177,144,0.08), type = input.color },
}

local averageFunction = averages [fn]

middle = averageFunction (hlc3, period)
offset = rma(tr, period) * shift

upper = middle + offset
lower = middle - offset

if fill_visible then
    fill { first = upper, second = lower, color = fill_color }
end

if upper_line_visible then
    plot (upper, "Upper", upper_line_color, upper_line_width)
end

if lower_line_visible then
    plot (lower, "Lower", lower_line_color, lower_line_width)
end

if middle_line_visible then
    plot (middle, "Middle", middle_line_color, middle_line_width)
end
