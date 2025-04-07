instrument { name = "Net Volume", short_name = "NV" }

src_idx = input (1, "Source", input.string_selection, inputs.titles)

input_group {
    "Net Volume",
    nv_color  = input { default = "#57A1D0", type = input.color },
    nv_width  = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

pc = change (inputs [src_idx])

nv = iff (pc > 0, volume, iff (pc < 0, -volume, 0))

if zero_visible then
    hline (0, "", zero_color, zero_width)
end

plot (nv, "Net Volume", nv_color, nv_width)
