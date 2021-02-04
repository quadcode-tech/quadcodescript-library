instrument { name = "ALMA", overlay = true }

period = input (9,    "front.period", input.integer, 1,  100   )
offset = input (0.85, "front.newind.offset", input.double,  0, 100, 0.01)
sigma  = input (6,    "front.newind.alma.sigma",  input.double,  0.01, 10, 1)
source = input (1,    "front.ind.source", input.string_selection, inputs.titles_overlay)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]

plot (alma (sourceSeries, period, offset, sigma), "ALMA", color, width)
