-- https://traderhq.com/trading-strategies/darvas-box-trading-strategy-explained/

instrument { name = "Darvas Box", overlay=true }

boxp=input (5, "front.newind.darvasbox.length", input.integer, 3)

input_group {
    "front.newind.darvasbox.top",
    top_color = input { default = "#25E154", type = input.color },
    top_width = input { default = 1, type = input.line_width}
}

input_group {
    "front.newind.darvasbox.bottom",
    bottom_color = input { default = "#FF6C58", type = input.color },
    bottom_width = input { default = 1, type = input.line_width}
}

LL = lowest (low,boxp)
k1 = highest (high,boxp)
k2 = highest (high,boxp - 1)
k3 = highest (high,boxp - 2)

NH =  value_when (high > k1 [1], high, 0)

box1 = k3 < k2
bs = bars_since (high > k1 [1])
cond = (get_value (nz(bs)) == (boxp - 2)) and box1

TopBox = value_when (cond, NH, 0)
BottomBox = value_when (cond, LL, 0)

plot(TopBox, "Top Box", top_color, top_width)
plot(BottomBox, "Bottom Box", bottom_color, bottom_width)
