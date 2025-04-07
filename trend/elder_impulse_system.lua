instrument {
    name = "Elder Impulse System"
}

input_group {
    "MACD",
    "Slow and fast EMA periods, used in MACD calculation",
    fast = input (12, "Fast Period", input.integer, 1, 250),
    slow = input (26, "Slow Period", input.integer, 1, 250)
}

input_group {
    "Signal Line",
    "Reference signal series period",
    signal_period = input (9, "Period", input.integer, 1, 250)
}

input_group {
    "EMA Period",
    ema_period = input (13, "Period", input.integer, 1, 250)
}

input_group {
    "Bar Colors",
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
