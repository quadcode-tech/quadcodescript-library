instrument {
    name = "True Strength Indicator",
    short_name = "TSI"
}

input_group {
    "front.ind.dpo.generalline",
    long = input (25, "Long", input.integer, 1, 250),
    short = input (13, "Short", input.integer, 1, 250),
    src_idx = input (inputs.close, "front.ind.source", input.string_selection, inputs.titles),

    osc_color = input { default = "#56CEFF", type = input.color },
    osc_width = input { default = 1, type = input.line_width },
    osc_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.platform.signal-line",
    signal_period = input (13, "front.period", input.integer, 1, 250),

    signal_color = input { default = "#FF6C58", type = input.color },
    signal_width = input { default = 1, type = input.line_width },
    signal_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.platform.baseline",
    zero_line_visible = input { default = true, type = input.plot_visibility },
    zero_line_color   = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_line_width   = input { default = 1, type = input.line_width }
}

local source = inputs [src_idx]

pc = change (source)

dspc  = ema (ema (pc,       long), short)
dsapc = ema (ema (abs (pc), long), short)

tsi = 100 * dspc / dsapc

signal = ema(tsi, signal_period)

if zero_line_visible then
    hline (0, "Zero", zero_line_color, zero_line_width)
end

if osc_visible then
    plot(tsi, "TSI", osc_color, osc_width)
end

if signal_visible then
    plot(signal, "front.platform.signal-line", signal_color, signal_width)
end
