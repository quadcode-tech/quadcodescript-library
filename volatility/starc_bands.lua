instrument { name = "STARC Bands", overlay = true }

period = input (15, "Period", input.integer, 1)
maperiod = input (5, "MA Pperiod", input.integer, 1)
multiplier =  input (1.3,  "Multiplier", input.double, 0.01, 300, 0.01)

source = input (1, "Source", input.string_selection,  inputs.titles_overlay)
fn     = input (averages.ema, "Average", input.string_selection, averages.titles)

input_group {
    "Top Line",
    upper_line_visible = input { default = true, type = input.plot_visibility },
    upper_line_color   = input { default = "#DBCF0D", type = input.color },
    upper_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "Middle Line",
    middle_line_visible = input { default = true, type = input.plot_visibility },
    middle_line_color   = input { default = rgba(219,207,13,0.6), type = input.color },
    middle_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "Bottom Line",
    lower_line_visible = input { default = true, type = input.plot_visibility },
    lower_line_color   = input { default = "#DBCF0D", type = input.color },
    lower_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "ADX Fill",
    fill_visible = input { default = true, type = input.plot_visibility },
    fill_color   = input { default = rgba(219,207,13,0.05), type = input.color },
}

local averageFunction = averages [fn]
local sourceSeries = inputs [source]


middle = averageFunction (sourceSeries, maperiod)
offset = rma(tr, period) * multiplier

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
