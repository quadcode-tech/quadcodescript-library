instrument {
    name = "Elder Impulse System"
}

input_group {
    "MACD",
    "Slow and fast EMA periods, used in MACD calculation",
    fast = input (12, "front.platform.fast period", input.integer, 1, 250),
    slow = input (26, "front.platform.fast period", input.integer, 1, 250)
}

input_group {
    "front.platform.signal-line",
    "Reference signal series period",
    signal_period = input (9, "front.period", input.integer, 1, 250)
}

input_group {
    "front.newind.emaperiod",
    ema_period = input (13, "front.period", input.integer, 1, 250)
}

input_group {
    "front.newind.barcolors",
    positive = input { default = "#2CAC40",   type = input.color },
    neutral  = input { default = "#C7CAD1", type = input.color },
    negative = input { default = "#DB4931",   type = input.color },
}

fastMA = ema(close, fast)
slowMA = ema(close, slow)

macd = fastMA - slowMA

signal = sma(macd, signal_period)

hist = macd - signal

ema13 = ema (close, ema_period)

local bar_color

if ema13 > ema13 [1] and hist > hist [1] then
    bar_color = positive
elseif ema13 < ema13 [1] and hist < hist [1] then
    bar_color = negative
else
    bar_color = neutral
end

plot_candle (open, high, low, close, "ES", bar_color)
