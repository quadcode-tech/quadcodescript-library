instrument { name = "ATR Bands", overlay = true, icon="indicators:ATR" }

period = input (13, "Period", input.integer, 1   )
shift  = input (3, "Offset", input.double, 1   )

source = input (1, "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "Lines",
    color = input { default = rgba(75,255,181,0.7), type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "ADX Fill",
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
