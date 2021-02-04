-- https://www.sevendata.co.jp/shihyou/technical/shinohara.html

instrument { name = "Shinohara Intensity Ratio" }

period = input (26, "front.period", input.integer, 1)

input_group {
    "Energy Line",
    a_color = input { default = "#56CEFF", type = input.color },
    a_width = input { default = 1, type = input.line_width },
    a_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Popularity Line",
    b_color = input { default = "#FF7700", type = input.color },
    b_width = input { default = 1, type = input.line_width },
    b_visible = input { default = true, type = input.plot_visibility }
}

a_bull = sum(high, period) - sum(open, period)
a_bear = sum(open, period) - sum(low, period)

b_bull = sum(high, period) - sum(close[1], period)
b_bear = sum(close[1], period) - sum(low, period)

a_ratio = 100 * a_bull/a_bear
b_ratio = 100 * b_bull/b_bear

if a_visible then
    plot (a_ratio, "Energy", a_color, a_width)
end

if b_visible then
    plot (b_ratio, "Popularity", b_color, b_width)
end
