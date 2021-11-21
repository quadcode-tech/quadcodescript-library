instrument {overlay = true,
            name = 'Pivot System',
            short_name = 'PBOT',
            icon="indicators:ADX"}
pivbuy =low[1] < low[2] and low > low[1] and high[1] < high[2] and high > high[1] and close > close[2]
pivsell =high[1] > high[2] and high < high[1] and low[1] > low[2] and low < low[1] and close < close[2]

plot_shape(pivbuy, "BUY", shape_style.arrowup, shape_size.large, "lime", shape_location.belowbar, 0, "buy","green" )
plot_shape(pivsell, "SELL", shape_style.arrowdown, shape_size.large, "red", shape_location.abovebar, 0, "Sell", "red" )


color = iff (pivbuy, "lime", iff(pivsell,"red", nil))

plot_candle (open, high, low, close, "Pivot", color)
