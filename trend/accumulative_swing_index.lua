instrument { name = "Accumulative Swing Index", overlay = false }

limit  = input (0.5, "Limit Move Value", input.double, 0.01)

input_group {
    "General Line",
    color = input { default = "#57A1D0", type = input.color },
    width = input { default = 1, type = input.line_width}
}

H2_C1 = abs(high - close[1])
L2_C1 = abs(low - close[1])
H2_L2 = abs(high - low)
C1_O1 = abs(close[1] - open[1])

K = max(H2_C1, L2_C1)

R = iff(
    H2_C1 >= max(L2_C1, H2_L2), 
    H2_C1 - 0.5 * L2_C1 + 0.25 * C1_O1, 
    iff(L2_C1 >= max(H2_C1, H2_L2), 
        L2_C1 - 0.5 * H2_C1 + 0.25 * C1_O1, 
        H2_L2 + 0.25 * C1_O1
    )
)

res = nz (res[1]) + 50 * ((close - close[1] + 0.5 * (close - open) + 0.25 * (close[1] - open[1])) / R) * K / limit

plot (res, "ASI", color, width)
