instrument { name = "Weighted Moving Average", short_name = "WMA", overlay = true, icon="indicators:MA" }

period = input (9, "front.period", input.integer, 1)
source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (wma (sourceSeries, period), "WMA", color, width)
