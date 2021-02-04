instrument { name = "Chaikin Volatility", overlay = false }

hl_period  = input (10, "front.newind.maperiod", input.integer, 1, 200)
roc_period = input (12, "front.newind.chaikinvol.rocperiod", input.integer, 1, 200)

source_high = input (inputs.high, "front.platform.chart.high", input.string_selection, inputs.titles)
source_low  = input (inputs.low,  "front.platform.chart.low",  input.string_selection, inputs.titles)

fn          = input (averages.ema, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#57A1D0", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.platform.baseline",
    zero_color  = input { default = "#B42EFF", type = input.color },
    zero_width  = input { default = 1, type = input.line_width}
}

local h = inputs [source_high]
local l = inputs [source_low]

local averageFunction = averages [fn]

vt = roc (averageFunction (h - l, hl_period), roc_period)

hline { value = 0, color = zero_color, width = zero_width }
plot (vt, "VT", color, width)
