instrument { name = "McGinley Dynamic", short_name = "MG", overlay = true }

period = input (14, "front.period", input.integer, 1, 200)
source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

mg = make_series ()

if na (mg[1]) then
    mg:set (ema (sourceSeries, period))
else
    mg:set (mg [1] + (sourceSeries - mg [1]) / (period * (sourceSeries / mg[1]) ^ 4))
end

plot (mg, "MG", color, width)
