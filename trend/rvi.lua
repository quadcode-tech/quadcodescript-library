instrument {
    name = "Relative Vigor Index"
}

input_group {
    "front.ind.dpo.generalline",
    period = input (10, "front.period", input.integer, 1, 250),

    rvi_color = input { default = "#56CEFF", type = input.color },
    rvi_width = input { default = 1, type = input.line_width },
    rvi_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.platform.signal-line",

    signal_color = input { default = "#DBCF0D", type = input.color },
    signal_width = input { default = 1, type = input.line_width },
    signal_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.platform.baseline",

    zero_line_visible = input { default = true, type = input.plot_visibility },
    zero_line_color   = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.newind.barcolors",

    histogram_visible = input { default = true, type = input.plot_visibility },
    histogram_up_color   = input { default = "#2CAC40", type = input.color },
    histogram_down_color   = input { default = "#DB4931", type = input.color }
}

CO=close-open
HL=high-low

num = sum (CO + 2*CO[1] + 2*CO[2] + CO[3], period)/6
denom = sum (HL + 2*HL[1] + 2*HL[2] + HL[3], period)/6


rvi = num / denom

signal = (rvi+ 2*rvi[1] + 2*rvi[2] + rvi[3]) / 6

hist = rvi - signal

if rvi_visible then
    plot(rvi, "RVI", rvi_color, rvi_width)
end

if signal_visible then
    plot(signal, "front.platform.signal-line", signal_color, signal_width)
end

if histogram_visible then
    rect {
        first = 0,
        second = hist,
        color = hist >= hist [1] and histogram_up_color or histogram_down_color,
        width = 0.2
    }
end

if zero_line_visible then
    hline (0, "Zero", zero_line_color, zero_line_width)
end
