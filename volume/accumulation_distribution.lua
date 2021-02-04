instrument { name = "Accumulation/Distribution", overlay = false }

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#DBCF0D", type = input.color },
    width = input { default = 1, type = input.line_width}
}

clv = ((close - low) - (high - close)) / hml
accdist = nz (accdist [1]) + volume * clv

plot (accdist, "ADL", color, width)
