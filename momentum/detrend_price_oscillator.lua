instrument { name = "Detrend Price Oscillator", overlay = false, icon = "indicators:DPO" }

period  = input (21, "front.period", input.integer, 2)

source = input (inputs.close, "front.ind.source", input.string_selection, inputs.titles)
fn     = input (averages.sma, "front.newind.average", input.string_selection, averages.titles)


input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#dbcf0d", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.platform.baseline",
    zero_color  = input { default = rgba(255,255,255,0.2), type = input.color },
    zero_width  = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

avg = averageFunction (sourceSeries, period)
res = sourceSeries [math.floor (period / 2) + 1] - avg

hline { value = 0, color = zero_color, width = zero_width }
plot (res, "DPO", color, width)
