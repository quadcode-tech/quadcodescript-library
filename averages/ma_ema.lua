instrument { name = "Exponential Moving Average", short_name = "EMA", overlay = true, icon="indicators:MA" }

period = input (9, "front.period", input.integer, 1)
source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#57A1D0", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (ema (sourceSeries, period), "EMA", color, width)
