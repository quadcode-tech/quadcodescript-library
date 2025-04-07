instrument { name = "Ichimoku Clouds", overlay = true, icon = "indicators:Ichimoku" }

input_group {
    "Tenkan",
    tenkan_period = input (9, "Period", input.integer, 1),
    tenkan_color = input { default = rgba(86,206,255,0.7), type = input.color },
    tenkan_width = input { default = 1, type = input.line_width },
    tenkan_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Kijun",
    kijun_period = input (26, "Period", input.integer, 1),
    kijun_color = input { default = rgba(183,36,17,0.7), type = input.color },
    kijun_width = input { default = 1, type = input.line_width },
    kijun_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Senkou A",
    senkou_span_a_color = input { default = rgba(37,225,84,0.7), type = input.color },
    senkou_span_a_width = input { default = 1, type = input.line_width },
    senkou_span_a_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Senkou B",
    senkou_span_b_period = input (52, "Period", input.integer, 1),
    senkou_span_b_color = input { default = rgba(255,108,88,0.7), type = input.color },
    senkou_span_b_width = input { default = 1, type = input.line_width },
    senkou_span_b_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Chikou",
    chikou_span_period = input (26, "Period", input.integer, 1),
    chikou_span_color = input { default = "#187226", type = input.color },
    chikou_span_width = input { default = 1, type = input.line_width },
    chikou_span_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Cloud Fill",
    senkou_fill_a_color = input { default = rgba(37,225,84,0.15), type = input.color },
    senkou_fill_b_color = input { default = rgba(255,108,88,0.15), type = input.color },
    senkou_fill_visible = input { default = true, type = input.plot_visibility }
}

tenkan = (highest (tenkan_period) + lowest (tenkan_period)) / 2
kijun = (highest (kijun_period) + lowest (kijun_period)) / 2
senkou_span_a = (tenkan + kijun) / 2
senkou_span_b = (highest (senkou_span_b_period) + lowest (senkou_span_b_period)) / 2
chikou_span = close

a = senkou_span_a  [kijun_period]
b = senkou_span_b  [kijun_period]

if senkou_fill_visible then
    fill (a, b, "", a > b and senkou_fill_a_color or senkou_fill_b_color)
end

if tenkan_visible then
    plot (tenkan, "Tenkan", tenkan_color, tenkan_width)
end

if kijun_visible then
    plot (kijun, "Kijun", kijun_color, kijun_width)
end

if chikou_span_visible then
    plot (chikou_span, "Chikou", chikou_span_color, chikou_span_width, -chikou_span_period)
end

if senkou_span_a_visible then
    plot (a, "Senkou A", senkou_span_a_color, senkou_span_a_width)
end

if senkou_span_b_visible then
    plot (b, "Senkou B", senkou_span_b_color, senkou_span_b_width)
end
