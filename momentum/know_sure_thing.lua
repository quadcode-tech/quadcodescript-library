instrument { name = "Pring's Know Sure Thing" }

input_group {
    "Lightest",

    lightest_roc_period = input (10, "RoC Period", input.integer, 1),
    lightest_sma_period  = input (10, "SMA Period", input.integer, 1)
}

input_group {
    "Light",

    light_roc_period = input (15, "RoC Period", input.integer, 1),
    light_sma_period  = input (10, "SMA Period", input.integer, 1)
}

input_group {
    "Heavy",

    heavy_roc_period = input (20, "RoC Period", input.integer, 1),
    heavy_sma_period  = input (10, "SMA Period", input.integer, 1)
}

input_group {
    "Heaviest",

    heaviest_roc_period = input (30, "RoC Period", input.integer, 1),
    heaviest_sma_period  = input (15, "SMA Period", input.integer, 1)
}

input_group {
    "KST",

    kst_color  = input { default = "#DB4931", type = input.color },
    kst_width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.platform.signal-line",
    signal_period = input (9, "front.period", input.integer, 1),

    signal_color  = input { default = "#2CAC40", type = input.color },
    signal_width  = input { default = 1, type = input.line_width}
}

source = input (1, "front.ind.source", input.string_selection,  inputs.titles)

input_group {
    "front.platform.baseline",

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

local sourceSeries = inputs [source]

rocma1 = sma (roc (sourceSeries, lightest_roc_period) * 100, lightest_sma_period)
rocma2 = sma (roc (sourceSeries, light_roc_period)    * 100, light_sma_period)
rocma3 = sma (roc (sourceSeries, heavy_roc_period)    * 100, heavy_sma_period)
rocma4 = sma (roc (sourceSeries, heaviest_roc_period) * 100, heaviest_sma_period)

kst = rocma1 + 2 * rocma2 + 3 * rocma3 + 4 * rocma4

signal = sma (kst, signal_period)

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

plot (kst, "KST", kst_color, kst_width)
plot (signal, "front.platform.signal-line", signal_color, signal_width)
