instrument { name = "Fractal Chaos Oscillator", overlay = false }

input_group {
    "General Line",
    color = input { default = "#DB4931", type = input.color },
    width = input { default = 1, type = input.line_width}
}

input_group {
    "Baseline",
    zero_color  = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width  = input { default = 1, type = input.line_width}
}

local function high_fractal ()
    local res = make_series ()

    local p = high [2]

    if not get_value (p) then return res end

    local is_fractal = high <= p and high [1] <= p and high [3] <= p and high [4] <= p

    res:set (iff(is_fractal, 1, 0))

    return res
end

local function low_fractal ()
    local res = make_series ()

    local p = low [2]

    if not get_value (p) then return res end

    local is_fractal = low >= p and low [1] >= p and low [3] >= p and low [4] >= p

    res:set (iff(is_fractal, 1, 0))

    return res
end

res = high_fractal () - low_fractal ()

hline { value = 0, color = zero_color, width = zero_width }
plot (res, "FCO", color, width)
