instrument { name = "Prime Number Bands", overlay = true }

input_group {
    "front.top line",
    upper_color = input { default = "#25E154", type = input.color },
    upper_width = input { default = 2, type = input.line_width },
    upper_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.bottom line",
    lower_color = input { default = "#FF6C58", type = input.color },
    lower_width = input { default = 2, type = input.line_width },
    lower_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "front.newind.adx.fill",
    fill_color = input { default = rgba(255,108,88,0.15), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility }
}

l = lower_prime (low)
h = upper_prime (high)

if fill_visible then
    fill (l, h, "", fill_color)
end

if upper_visible then
    plot (h, "Upper", upper_color, upper_width)
end

if lower_visible then
    plot (l, "Lower", lower_color, lower_width)
end
