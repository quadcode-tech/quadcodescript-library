instrument { name = "ATR Bands", overlay = true, icon="indicators:ATR" }

period = input (13, "front.period", input.integer, 1   )
shift  = input (3, "front.newind.offset", input.double, 1   )

source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)

input_group {
    "front.newind.lines",
    color = input { default = rgba(75,255,181,0.7), type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.adx.fill",
    fill_color = input { default = rgba(75,255,181,0.1), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility }
}

local sourceSeries = inputs [source]

atr = rma (tr, period)

h = sourceSeries + atr * shift
l = sourceSeries - atr * shift

if fill_visible then
    fill (l, h, "", fill_color)
end

plot (h, "", color, width)
plot (l, "", color, width)
