instrument { name = "ATR", overlay = false, icon="indicators:ATR" }

period = input (14, "front.period", input.integer, 1   )
fn     = input (averages.ssma, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local averageFunction = averages [fn]

plot (averageFunction (tr, period), "ATR", color, width)
