instrument { name = "Prime Number Oscillator", overlay = false }

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#FF6C58", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "front.platform.baseline",
    zero_color  = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width  = input { default = 1, type = input.line_width}
}

l, h = prime_bands (close)

ld = close - l
hd = h - close

pno = iff (ld < hd, -1, 1)

hline { value = 0, color = zero_color, width = zero_width }
plot (pno, "FCO", color, width)
