instrument { name = "Coppock Curve" }

period = input (10,"front.period", input.integer,  1,  200)
long_roc = input (14, "Long RoC", input.integer,  1, 200)
short_roc = input (11, "Short RoC", input.integer,  1, 200)

source = input (1, "front.ind.source", input.string_selection, inputs.titles)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#56CEFF", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.platform.baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

local sourceSeries = inputs [source]
coppock = wma (roc(sourceSeries, long_roc) + roc (sourceSeries, short_roc), period)

plot (coppock, "Coppock", color, width)
