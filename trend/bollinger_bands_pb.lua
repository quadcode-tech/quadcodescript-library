instrument { name = "Bollinger Bands %B", overlay = false, icon = "indicators:BB" }

period = input (20, "Period", input.integer,  1)
devs   = input (2, "Standard Deviation", input.integer, 1)

overbought = input (1, "Overbought", input.double, -2, 2, 0.1, false)
oversold = input (0, "Oversold", input.double, -2, 2, 0.1, false)

source = input (1, "Source", input.string_selection, inputs.titles)
fn     = input (1, "Average", input.string_selection, averages.titles)


input_group {
    "General Line",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "KDJ Line Overbought",
    overbought_color = input { default = rgba(37,225,84,0.50), type = input.color },
    overbought_width = input { default = 1, type = input.line_width},
    overbought_visible = input { default = true, type = input.plot_visibility}
}

input_group {
    "KDJ Line Oversold",
    oversold_color = input { default = rgba(255,108,88,0.50), type = input.color },
    oversold_width = input { default = 1, type = input.line_width},
    oversold_visible = input { default = true, type = input.plot_visibility}
}

input_group {
    "ADX Fill",
    fill_color = input { default = rgba(75,255,181,0.06), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

middle = averageFunction (sourceSeries, period)
scaled_dev = devs * stdev (sourceSeries, period)

top = middle + scaled_dev
bottom = middle - scaled_dev

if fill_visible then
    fill_area (oversold, overbought, "", fill_color)
end

if overbought_visible then
    hline (overbought, "", overbought_color, overbought_width)
end

if oversold_visible then
    hline (oversold, "", oversold_color, oversold_width)
end

pb = (sourceSeries - bottom) / (top - bottom)

plot (pb, "%B", color, width)
