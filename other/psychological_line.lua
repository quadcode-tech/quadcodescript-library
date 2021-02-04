instrument { name = "Psychological Line" }

period = input (28, "front.period", input.integer, 1)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#96ADBC", type = input.color },
    width = input { default = 1, type = input.line_width }
}

input_group {
    "front.platform.baseline",

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.newind.adx.fill",
    fill_up_color = input { default = rgba(37,225,84,0.10), type = input.color },
    fill_down_color = input { default = rgba(255,108,88,0.10), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility }
}

psy = sma (iff (conditional (close > close [1]), 1, 0), period) * 100

if fill_visible then
    fill (psy, 50, "", psy > 50 and fill_up_color or fill_down_color)
end

if zero_visible then
    hline (50, "", zero_color, zero_width)
end


plot (psy, "PSY",  color, width)
