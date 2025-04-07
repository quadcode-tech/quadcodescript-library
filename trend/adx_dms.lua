instrument { name = "ADX/DMS", icon="indicators:ADX" }

adx_period = input (14, "ADX Smoothing", input.integer, 1)
di_period = input (14, "ADX DI Length", input.integer, 1)
threshold  = input (20, "ADX Threshold", input.double, 0, 100)

input_group {
    "ADX",
    adx_color = input { default = rgba(255,255,255,0.7), type = input.color },
    adx_width = input { default = 1, type = input.line_width },
    adx_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "DI+",
    pdi_color = input { default = "#25E154", type = input.color },
    pdi_width = input { default = 1, type = input.line_width },
    pdi_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "DI–",
    mdi_color = input { default = "#FF6C58", type = input.color },
    mdi_width = input { default = 1, type = input.line_width },
    mdi_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Threshold",
    threshold_color = input { default = rgba(255,255,255,0.15), type = input.color },
    threshold_width = input { default = 1, type = input.line_width },
    threshold_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "ADX Fill",
    up_color = input { default = rgba(37,225,84,0.15), type = input.color },
    down_color = input { default = rgba(255,108,88,0.15), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility }
}

up_move = change (high)
down_move = -change (low)

pdm = iff (up_move > down_move and nz(up_move) > 0, up_move, 0)
mdm = iff (down_move > up_move and nz(down_move) > 0, down_move, 0)

atr = rma(tr, di_period)

pdi = 100 * rma (pdm / atr, di_period)
mdi = 100 * rma (mdm / atr, di_period)

adx = 100 * rma (abs (pdi - mdi) / (pdi + mdi), adx_period)

if threshold_visible then
    hline { value = threshold, color = threshold_color, width = threshold_width }
end

if fill_visible then
    fill (mdi, pdi, "", iff(pdi > mdi, up_color, down_color))
end

if mdi_visible then
    plot (mdi, "MDI", mdi_color, mdi_width)
end

if pdi_visible then
    plot (pdi, "PDI", pdi_color, pdi_width)
end

if adx_visible then
    plot (adx, "ADX", adx_color, adx_width)
end
