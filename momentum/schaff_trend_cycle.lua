--https://www.fxstreet.com/education/releasing-the-code-to-the-schaff-trend-cycle-200802150000
instrument { name = "Schaff Trend Cycle" }

input_group {
    "Relative Volatility",
    period = input (10, "front.period", input.integer, 1),
    short_cycle = input (23, "Short Cycle", input.integer, 1),
    long_cycle = input (50, "Long Cycle", input.integer, 1),

    source = input (1, "front.ind.source", input.string_selection, inputs.titles),
    fn     = input (averages.ema, "front.newind.smoothingfunction", input.string_selection, averages.titles),

    color  = input { default = "#DB4931", type = input.color },
    width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.supportlines",
    overbought = input (75, "front.overbought", input.double, 1, 100, 1, false),
    oversold = input (25, "front.oversold", input.double, 1, 100, 1, false),

    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    overbought_color  = input { default = rgba(37,225,84,0.50), type = input.color },
    oversold_color  = input { default = rgba(255,108,88,0.50), type = input.color },
    support_width  = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.adx.fill",
    fill_up_color = input { default = rgba(37,225,84,0.20), type = input.color },
    fill_down_color = input { default = rgba(255,108,88,0.20), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility }
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

fastMA = averageFunction(sourceSeries, short_cycle)
slowMA = averageFunction(sourceSeries, long_cycle)

macd = fastMA - slowMA

local factor = 0.5

v1 = lowest(macd, period)
v2 = highest(macd, period) - v1

f1 = iff(v2 > 0, ((macd - v1) / v2) * 100, nz(f1[1]))

pf = iff(na(pf[1]), f1, pf[1] + (factor * (f1 - pf[1])))

v3 = lowest(pf, period)
v4 = highest(pf, period) - v3

f2 = iff(v4 > 0, ((pf - v3) / v4) * 100, nz(f2[1]))

pff = iff(na(pff[1]), f2, pff[1] + (factor * (f2 - pff[1])))

if fill_visible then
    if nz(pff, 50) > overbought then
        fill (overbought, pff, "", fill_up_color)
    else
        fill (overbought, pff, "", "#0000000")
    end

    if nz(pff, 50) < oversold then
        fill (pff, oversold, "", fill_down_color)
    else
        fill (pff, oversold, "", "#0000000")
    end
end

hline { value = overbought, color = overbought_color, width = support_width }
hline { value = oversold, color = oversold_color, width = support_width }
hline { value = 50, color = zero_color, width = support_width }

plot (pff, "STC", color, width)

hline { value = 105, color = "#0000000", show_label = false }
hline { value = -5, color = "#0000000", show_label = false }
