instrument { name = "Supertrend", overlay = true }

period = input (7, "Period", input.integer, 1)
multiplier = input (3, "Multiplier", input.double, 0.01, 100, 0.01)

input_group {
    "General Line",
    up_color = input { default = "#25E154", type = input.color },
    down_color = input { default = "#FF6C58", type = input.color },
    width = input { default = 1, type = input.line_width }
}

offset = rma (tr, period) * multiplier

up = hl2 - offset
down = hl2 + offset

trend_up = iff (not na(trend_up) and close [1] > trend_up [1], max (up, trend_up [1]), up)
trend_down = iff (not na(trend_down) and close [1] < trend_down [1], min (down, trend_down [1]), down)

trend = iff (close > trend_down [1], true, iff (close < trend_up [1], false, nz(trend [1], true)))
tsl = iff (trend, trend_up, trend_down)

plot (tsl, "Supertrend",  trend () and up_color or down_color, width)
