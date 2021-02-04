instrument { name = "Bollinger Bands", overlay = true, icon = "indicators:BB" }

period = input (20,"front.period", input.integer,  1)
devs   = input (2, "front.newind.stddev", input.integer, 1)
source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)
fn     = input (1, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.top line",
    top_color = input { default = "#4BFFB5", type = input.color },
    top_width = input { default = 1, type = input.line_width}
}

input_group {
    "front.middle line",
    middle_color = input { default = "#FF6C58", type = input.color },
    middle_width = input { default = 1, type = input.line_width}
}

input_group {
    "front.bottom line",
    bottom_color = input { default = "#4BFFB5", type = input.color },
    bottom_width = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.adx.fill",
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

plot (top, "front.top line", top_color, top_width)
plot (middle, "front.middle line", middle_color, middle_width)
plot (bottom, "front.bottom line", bottom_color, bottom_width)
