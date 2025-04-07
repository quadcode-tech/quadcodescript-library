instrument { name = "Ehler's Fisher Transform" }

period = input (10, "Period", input.integer, 3)

input_group {
    "EF",
    ef_color = input { default = "#2CAC40", type = input.color },
    ef_width = input { default = 1, type = input.line_width },
    ef_visible = input { default = true, type = input.plot_visibility }
}


input_group {
    "EF Trigger",
    ef_trigger_color = input { default = "#DB4931", type = input.color },
    ef_trigger_width = input { default = 1, type = input.line_width },
    ef_trigger_visible = input { default = true, type = input.plot_visibility }
}

hh = highest (hl2, period)
ll = lowest (hl2, period)

i = 2 * (hl2 - ll) / (hh - ll) - 1

is = ema (i, 5)

eft = ema (log ((1 + is) / (1 - is)), 3)

if ef_trigger_visible then
    plot (eft [1], "EF Trigger",  ef_trigger_color, ef_trigger_width)
end

if ef_visible then
    plot (eft, "EF", ef_color, ef_width)
end
