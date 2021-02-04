instrument { name = "ATR Trailing Stops", overlay = true, icon="indicators:ATR" }

period = input (14, "front.period", input.integer, 1   )
multiplier  = input (2, "front.newind.multiplier", input.double, 1   )

high_low = input (false, "HighLow", input.boolean)

input_group {
    "front.newind.colors",
    up   = input { default = "#2CAC40", type = input.color },
    down = input { default = "#DB4931", type = input.color },
    width = input { default = 1, type = input.line_width }
}

atr = rma (tr, period) * multiplier

h = iff (high_low, high, close)
l = iff (high_low, low, close)

atr_ts = iff(close > nz(atr_ts[1], 0) and close[1] > nz(atr_ts[1], 0), 
            max(nz(atr_ts[1]), h - atr),
            iff(close < nz(atr_ts[1], 0) and close[1] < nz(atr_ts[1], 0), 
                min(nz(atr_ts[1]), l + atr),
                iff(close > nz(atr_ts[1], 0), 
                    h - atr, 
                    l + atr
                )
            )
        )

pos = iff(close[1] < nz(atr_ts[1], 0) and close > nz(atr_ts[1], 0), 1,
            iff(close[1] > nz(atr_ts[1], 0) and close < nz(atr_ts[1], 0), -1, nz(pos[1], 0)))

plot (atr_ts, "", pos < 0 and down or up , width)

short = (pos[1] ~= pos[0]) and (pos[0] == -1)
long = (pos[1] ~= pos[0]) and (pos[0] == 1)

plot_shape(long, "long", shape_style.triangleup, shape_size.tiny, 'green', shape_location.belowbar)
plot_shape(short, "short", shape_style.triangledown, shape_size.tiny, 'red', shape_location.abovebar)

