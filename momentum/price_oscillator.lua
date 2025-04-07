instrument { name = "Percentage Price Oscillator" }

input_group {
    "General Line",
    short_period = input (12, "Short Cycle", input.integer, 1),
    long_period = input (26, "Long Cycle", input.integer, 1),

    pmo_color  = input { default = "#56CEFF", type = input.color },
    pmo_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Signal Line",
    signal_period = input (9, "Period", input.integer, 1),

    signal_color  = input { default = "#DB4931", type = input.color },
    signal_width  = input { default = 1, type = input.line_width}
}

source = input (1, "Source", input.string_selection,  inputs.titles)
fn     = input (averages.ema, "Average", input.string_selection, averages.titles)

input_group {
    "Baseline",

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

short = averageFunction (sourceSeries, short_period)
long = averageFunction (sourceSeries, long_period)

ppo = (short - long) / long * 100

signal = averageFunction (ppo, signal_period)

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

plot (ppo, "PPO", pmo_color, pmo_width)
plot (signal, "Signal Line", signal_color, signal_width)
