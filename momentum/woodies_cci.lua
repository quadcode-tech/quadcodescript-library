instrument {
    name = "Woodies CCI",
    short_name = "WCCI",
}

input_group {
    "CCI Turbo",
    cci_turbo_period = input (6, "front.period", input.integer, 3, 14),

    cci_turbo_color = input { default = "#2CAC40", type = input.color },
    cci_turbo_width = input { default = 1, type = input.line_width },
    cci_turbo_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "CCI",
    cci_period = input (14, "front.period", input.integer, 7, 20),

    cci_color = input { default = "#DB4931", type = input.color },
    cci_width = input { default = 1, type = input.line_width },
    cci_visible = input { default = true, type = input.plot_visibility }
}


input_group {
    "CCI Turbo Histogram",
    histogram_visible = input { default = true, type = input.plot_visibility },

    histogram_up_color   = input { default = "#2CAC40", type = input.color },
    histogram_down_color   = input { default = "#DB4931", type = input.color }
}

input_group {
    "front.platform.baseline",
    zero_line_visible = input { default = true, type = input.plot_visibility },
    zero_line_color   = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_line_width   = input { default = 1, type = input.line_width }
}

input_group {
    "front.newind.supportlines",
    overbought = input (100, "front.overbought", input.double, 0, 500, 1, false),
    oversold = input (-100, "front.oversold", input.double, -500, 0, 1, false),

    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    bg_color  = input { default = rgba(255,255,255,0.05), type = input.color },
    support_width  = input { default = 1, type = input.line_width },
    support_visible = input { default = true, type = input.plot_visibility }
}

src_idx = input (1, "front.ind.source", input.string_selection, inputs.titles)
local source = inputs [src_idx]

cci_turbo = cci (source, cci_turbo_period)
cci14 = cci (source, cci_period)

local last5IsDown = cci14[5] < 0 and cci14[4] < 0 and cci14[3] < 0 and cci14[2] < 0 and cci14[1] < 0
local last5IsUp = cci14[5] > 0 and cci14[4] > 0 and cci14[3] > 0 and cci14[2] > 0 and cci14[1] > 0

local histogram_color = iff (last5IsUp, histogram_up_color, iff (last5IsDown, histogram_down_color, iff (cci14 < 0, histogram_up_color, histogram_down_color)))

if support_visible then
    fill_area (overbought, oversold, "", bg_color)
end

if histogram_visible then
    rect {
        first = 0,
        second = cci14,
        color = histogram_color,
        width = 0.4
    }
end

if support_visible then
    hline (overbought, "", overbought_color, support_width)
    hline (oversold, "", oversold_color, support_width)
end

if zero_line_visible then
    hline (0, "Zero", zero_line_color, zero_line_width)
end

if cci_turbo_visible then
    plot(cci_turbo, "Turbo CCI", cci_turbo_color, cci_turbo_width)
end

if cci_visible then
    plot(cci14, "CCI14", cci_color, cci_width)
end