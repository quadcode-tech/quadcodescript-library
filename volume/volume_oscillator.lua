instrument { name = "Volume Oscillator", short_name = "VO" }

input_group {
    "General Line",
    short_period = input (5, "Short Cycle", input.integer, 1, 200),
    long_period = input (10, "Long Cycle",  input.integer, 1, 200),

    vo_color  = input { default = "#25E154", type = input.color },
    vo_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

short = ema (volume, short_period)
long  = ema (volume, long_period )

vo = (short - long) / long * 100

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

plot (vo, "VO", vo_color, vo_width)
