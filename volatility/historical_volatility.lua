instrument { name = "Historical Volatility", overlay = false }

period = input (10, "front.period", input.integer, 1)
annual = input (252, "front.newind.daysperyear", input.integer, 1, 366)
source = input (1, "front.ind.source", input.string_selection, inputs.titles)

input_group {
    "front.ind.dpo.generalline",
    color   = input { default = "#56CEFF", type = input.color },
    width   = input { default = 1, type = input.line_width }
}


local sourceSeries = inputs [source]

xprice = log (sourceSeries / sourceSeries [1])
nper = iff(is_intraday or is_daily, 1, 7)
xstdev = stdev (xprice, period)
hvol = xstdev * sqrt (annual / nper) * 100

plot (hvol, "HV", color, width)
