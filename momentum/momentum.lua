instrument { name = "Momentum", overlay = false }

period = input (10, "Period", input.integer, 1)

source = input (1, "Source", input.string_selection,  inputs.titles)

input_group {
    "General Line",
    color = input { default = "#DBCF0D", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

local sourceSeries = inputs [source]

mom = change (sourceSeries, period)

if zero_visible then
    hline (0, "", zero_color, zero_width, 0, style.dash_line)
end

plot (mom, "Mom", color, width)
