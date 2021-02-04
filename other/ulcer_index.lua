instrument { name = "Ulcer Index", overlay = false }

period = input (14, "front.period", input.integer, 1)

source = input (1, "front.ind.source", input.string_selection,  inputs.titles)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#21B190", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

h = highest (sourceSeries, period)
r = 100 * (sourceSeries - h) / h
ui = sqrt (sma (r^2, period))

plot (ui, "UI", color, width)
