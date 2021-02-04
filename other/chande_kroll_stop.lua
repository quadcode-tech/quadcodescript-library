instrument { name = "Chande Kroll Stop", short_name = "CKS", overlay = true }

p = input (10, "P", input.integer, 1, 200)
x = input (1,  "X", input.integer, 1, 200)
q = input (9,  "Q", input.integer, 1, 200)

input_group {
    "Stop Short",
    short_color = input { default = "#FF6C58", type = input.color },
    short_width = input { default = 1, type = input.line_width },
    short_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Stop Long",
    long_color = input { default = "#25E154", type = input.color },
    long_width = input { default = 1, type = input.line_width },
    long_visible = input { default = true, type = input.plot_visibility }
}

first_high_stop = highest (high, p) - x * rma(tr, p)
first_low_stop  = lowest  (high, p) + x * rma(tr, p)
stop_short      = highest (first_high_stop, q)
stop_long       = lowest  (first_low_stop,  q)

if short_visible then
    plot (stop_short, "Stop Short", short_color, short_width)
end

if long_visible then
    plot (stop_long, "Stop Long", long_color, long_width)
end
