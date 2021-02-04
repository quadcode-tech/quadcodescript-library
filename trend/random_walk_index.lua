-- https://www.fmlabs.com/reference/default.htm?url=RWI.htm
-- http://www.robertbrain.com/bullcharts/bc-files/Indicators/Random%20Walk%20Index.bss
-- http://store.traders.com/-v10-c09-arether-pdf.html#_ga=2.60332909.1773273311.1543313782-847862791.1543313682

instrument { name = "Random Walk Index" }

period = input (14, "front.period", input.integer, 2)

input_group {
    "RWI of High",
    high_color = input { default = "#2CAC40", type = input.color },
    high_width = input { default = 1, type = input.line_width },
    high_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "RWI of Low",
    low_color = input { default = "#DB4931", type = input.color },
    low_width = input { default = 1, type = input.line_width },
    low_visible = input { default = true, type = input.plot_visibility }
}

rwi_h = make_series ()
rwi_l = make_series ()

for n=2, period do
    local sqp = sqrt (n)
    local denom = rma (tr, n) * sqp

    local rwi_h_c = (high - low [n - 1]) / denom
    local rwi_l_c = (high [n - 1] - low) / denom

    rwi_h:set (max (nz (rwi_h, rwi_h_c), rwi_h_c))
    rwi_l:set (max (nz (rwi_l, rwi_l_c), rwi_l_c))
end

if high_visible then
    plot (rwi_h, "RWI High", high_color, high_width)
end

if low_visible then
    plot (rwi_l, "RWI Low", low_color, low_width)
end
