instrument { name = "Envelopes", overlay = true }

period = input (15, "Period", input.integer, 1)
deviation = input (10, "Deviation", input.double, 0.01, 300, 0.01)

source = input (1, "Source", input.string_selection,  inputs.titles_overlay)
fn     = input (1, "Average", input.string_selection, averages.titles)

input_group {
    "Top Line",
    upper_line_visible = input { default = true, type = input.plot_visibility },
    upper_line_color   = input { default = "#2384C2", type = input.color },
    upper_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "Middle Line",
    middle_line_visible = input { default = true, type = input.plot_visibility },
    middle_line_color   = input { default = "#FF7700", type = input.color },
    middle_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "Bottom Line",
    lower_line_visible = input { default = true, type = input.plot_visibility },
    lower_line_color   = input { default = "#2384C2", type = input.color },
    lower_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "ADX Fill",
    fill_visible = input { default = true, type = input.plot_visibility },
    fill_color   = input { default = rgba(86,206,255,0.15), type = input.color },
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

middle =  averageFunction (sourceSeries, period)
offset = deviation / 1000 * middle

upper = middle + offset
lower = middle - offset

if fill_visible then
    fill { first = upper, second = lower, color = fill_color }
end

if upper_line_visible then
    plot (upper, "Top Line", upper_line_color, upper_line_width)
end

if lower_line_visible then
    plot (lower, "Bottom Line", lower_line_color, lower_line_width)
end

if middle_line_visible then
    plot (middle, "Middle Line", middle_line_color, middle_line_width)
end
