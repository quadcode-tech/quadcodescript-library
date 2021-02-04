instrument { name = "Balance of Power" }

input_group {
    "front.newind.balanceofpower.smoothed",

    period = input (14, "front.period", input.integer, 1, 200),
    fn     = input (1,  "front.newind.average", input.string_selection, averages.titles),

    smoothed_color = input { default = "#57A1D0", type = input.color },
    smoothed_width = input { default = 1, type = input.line_width },
    smoothed_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.newind.barcolors",
    negative = input { default = "#DB4931",   type = input.color },
    neutral  = input { default = "#FF7700", type = input.color },
    positive = input { default = "#2CAC40",   type = input.color },
    histogram_visible = input { default = false, type = input.plot_visibility }
}

input_group {
    "front.platform.baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

bop = (close - open) / (high - low)

if histogram_visible then
    local positive_change = bop >= bop [1]

    local bar_color

    if bop >= 0 then
        bar_color = positive_change and negative or neutral
    else
        bar_color = positive_change and neutral or positive
    end

    rect {
        first = 0,
        second = bop,
        color = bar_color,
        width = 0.85
    }
end

if zero_visible then
    hline (0, "", zero_color, zero_width, 0, style.dash_line)
end

if smoothed_visible then
    local averageFunction = averages [fn]
    plot (averageFunction (bop, period), "BOP", smoothed_color, smoothed_width)
end
