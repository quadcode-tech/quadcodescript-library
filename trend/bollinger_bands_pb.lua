instrument { name = "Bollinger Bands %B", overlay = false, icon = "indicators:BB" }

period = input (20, "front.period", input.integer,  1)
devs   = input (2, "front.newind.stddev", input.integer, 1)

overbought = input (1, "front.overbought", input.double, -2, 2, 0.1, false)
oversold = input (0, "front.oversold", input.double, -2, 2, 0.1, false)

source = input (1, "front.ind.source", input.string_selection, inputs.titles)
fn     = input (1, "front.newind.average", input.string_selection, averages.titles)


input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#4BFFB5", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.ind.kdj.line.overbought",
    overbought_color = input { default = rgba(37,225,84,0.50), type = input.color },
    overbought_width = input { default = 1, type = input.line_width},
    overbought_visible = input { default = true, type = input.plot_visibility}
}

input_group {
    "front.ind.kdj.line.oversold",
    oversold_color = input { default = rgba(255,108,88,0.50), type = input.color },
    oversold_width = input { default = 1, type = input.line_width},
    oversold_visible = input { default = true, type = input.plot_visibility}
}

input_group {
    "front.newind.adx.fill",
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
