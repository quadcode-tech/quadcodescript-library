instrument { name = "Fractal Chaos Bands", overlay = true }

local function high_fractal ()
    local res = make_series ()

    local p = high [2]

    if not get_value (p) then return res end

    local is_fractal = high <= p and high [1] <= p and high [3] <= p and high [4] <= p

    res:set (iff(is_fractal, p, res[1]))

    return res
end

local function low_fractal ()
    local res = make_series ()

    local p = low [2]

    if not get_value (p) then return res end

    local is_fractal = low >= p and low [1] >= p and low [3] >= p and low [4] >= p

    res:set (iff(is_fractal, p, res[1]))

    return res
end

input_group {
    "Chart High",
    high_color = input { default = "#25E154", type = input.color },
    high_width = input { default = 1, type = input.line_width },
    high_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Chart Low",
    low_color = input { default = "#FF6C58", type = input.color },
    low_width = input { default = 1, type = input.line_width },
    low_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "ADX Fill",
    fill_color = input { default = rgba(87,161,208,0.15), type = input.color },
    fill_visible = input { default = true, type = input.plot_visibility }
}

h = high_fractal ()
l = low_fractal ()

if fill_visible then
    fill (l, h, "", fill_color)
end

if high_visible then
    plot (h, "High", high_color, high_width)
end

if low_visible then
    plot (l, "Low", low_color, low_width)
end
