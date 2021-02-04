-- https://kipdf.com/special-k-etf-add-on-package-for-metastock-user-s-guide_5afdc9668ead0e24178b45a7.html
-- http://take.ms/bUx9S

instrument { name = "Special K" }

input_group {
    "Special K",
    mode = input (1, "front.newind.mode", input.string_selection, { "Daily", "Weekly" }),

    k_color = input { default = "#FF7700", type = input.color },
    k_width = input { default = 1, type = input.line_width },
    k_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.platform.smothing",
    internal_period = input (100, "Period 1", input.integer, 2),
    external_period = input (100, "Period 2", input.integer, 2),

    ma_color = input { default = "#56CEFF", type = input.color },
    ma_width = input { default = 1, type = input.line_width },
    ma_visible = input { default = true, type = input.plot_visibility }
}

if mode == 1 then
    roc1  = sma(roc(close, 10),  10 )
    roc2  = sma(roc(close, 15),  10 ) * 2
    roc3  = sma(roc(close, 20),  10 ) * 3
    roc4  = sma(roc(close, 30),  50 ) * 4
    roc5  = sma(roc(close, 50),  50 )
    roc6  = sma(roc(close, 65),  65 ) * 2
    roc7  = sma(roc(close, 75),  75 ) * 3
    roc8  = sma(roc(close, 100), 100) * 4
    roc9  = sma(roc(close, 195), 130)
    roc10 = sma(roc(close, 265), 130) * 2
    roc11 = sma(roc(close, 390), 130) * 3
    roc12 = sma(roc(close, 530), 195) * 4

    special_k =
        nz (roc1 + roc2  + roc3  + roc4) +
        nz (roc5 + roc6  + roc7  + roc8) +
        nz (roc9 + roc10 + roc11 + roc12)
else
    roc1  = ema(roc(close, 4  ), 4 )
    roc2  = ema(roc(close, 5  ), 5 ) * 2
    roc3  = ema(roc(close, 6  ), 6 ) * 3
    roc4  = ema(roc(close, 8  ), 8 ) * 4
    roc5  = ema(roc(close, 10 ), 10)
    roc6  = ema(roc(close, 13 ), 13) * 2
    roc7  = ema(roc(close, 15 ), 15) * 3
    roc8  = ema(roc(close, 20 ), 20) * 4
    roc9  = ema(roc(close, 39 ), 26)
    roc10 = ema(roc(close, 52 ), 26) * 2
    roc11 = ema(roc(close, 78 ), 26) * 3
    roc12 = ema(roc(close, 104), 39) * 4

    special_k =
        nz (roc1 + roc2  + roc3  + roc4) +
        nz (roc5 + roc6  + roc7  + roc8) +
        nz (roc9 + roc10 + roc11 + roc12)
end

if k_visible then
    plot (special_k, "K", k_color, k_width)
end

if ma_visible then
    plot (sma(sma (special_k, internal_period), external_period), "MA", ma_color, ma_width)
end
