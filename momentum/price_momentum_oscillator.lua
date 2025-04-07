instrument { name = "Price Momentum Oscillator" }

input_group {
    "PMO",
    
    smooth = input (35, "Smoothing Period", input.integer, 1),
    dsmooth = input (20, "Double Smoothing Period", input.integer, 1),
    source = input (1, "Source", input.string_selection,  inputs.titles),

    pmo_color  = input { default = "#DB4931", type = input.color },
    pmo_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Signal Line",

    signal_period = input (10, "Period", input.integer, 1),
    signal_color  = input { default = "#2CAC40", type = input.color },
    signal_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

local k1 = 2 / smooth
local k2 = 2 / dsmooth

rc = roc (inputs [source]) * 100
rc_ma = (nz (rc_ma [1], rc) * (1 - k1) + rc * k1)
pmo = nz (pmo [1], 10 * rc_ma) * (1 - k2) + 10 * rc_ma * k2

signal = ema (pmo, signal_period)

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

plot (pmo, "PMO", pmo_color, pmo_width)
plot (signal, "Signal Line", signal_color, signal_width)
