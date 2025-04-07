instrument { name = "TRIX", overlay = false }

period  = input (14, "Period", input.integer, 1)

source = input (inputs.close, "Source", input.string_selection, inputs.titles)

fn = input (averages.ema, "Average", input.string_selection, averages.titles)

input_group {
    "General Line",
    color = input { default = "#21B190", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",
    zero_color  = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width  = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

trix = change (averageFunction (averageFunction (averageFunction (log (sourceSeries), period), period), period)) * 100

hline { value = 0, color = zero_color, width = zero_width }
plot (trix, "TRIX", color, width)
