instrument { name = "Bollinger Bands", overlay = true, icon = "indicators:BB" }

period = input (20,"Period", input.integer,  1)
devs   = input (2, "Standard Deviation", input.integer, 1)
source = input (1, "Source", input.string_selection, inputs.titles_overlay)
fn     = input (1, "Average", input.string_selection, averages.titles)

input_group {
    "Top Line",
    top_color = input { default = "#4BFFB5", type = input.color },
    top_width = input { default = 1, type = input.line_width}
}

input_group {
    "Middle Line",
    middle_color = input { default = "#FF6C58", type = input.color },
    middle_width = input { default = 1, type = input.line_width}
}

input_group {
    "Bottom Line",
    bottom_color = input { default = "#4BFFB5", type = input.color },
    bottom_width = input { default = 1, type = input.line_width}
}

input_group {
    "ADX Fill",
    fill_color = input { default = rgba(75,255,181,0.08), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

middle = averageFunction (sourceSeries, period)
scaled_dev = devs * stdev (sourceSeries, period)

top = middle + scaled_dev
bottom = middle - scaled_dev

if fill_visible then
    fill (bottom, top, "", fill_color)
end

plot (top, "Top Line", top_color, top_width)
plot (middle, "Middle Line", middle_color, middle_width)
plot (bottom, "Bottom Line", bottom_color, bottom_width)
