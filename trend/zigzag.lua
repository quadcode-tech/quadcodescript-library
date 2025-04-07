instrument { name = "ZigZag", overlay = true }

percentage = input (1, "Percentage", input.double, 0.01, 100, 1.0) / 100
period = 3

input_group {
    "General Line",
    up_color = input { default = "#FF7700", type = input.color },
    down_color = input { default = "#57A1D0", type = input.color },
    width = input { default = 1, type = input.line_width }
}


local reference = make_series ()
reference:set(nz(reference[1], high))

local is_direction_up = make_series ()
is_direction_up:set(nz(is_direction_up[1], true))

local htrack = make_series ()
local ltrack = make_series ()

local pivot = make_series ()

reverse_range = reference * percentage / 100

if get_value (is_direction_up) then
    htrack:set (max(high, nz(htrack[1], high)))

    if close < htrack[1] - reverse_range then
        pivot:set (htrack)
        is_direction_up:set (false)
        reference:set(htrack)
    end
else
    ltrack:set (min(low, nz(ltrack[1], low)))

    if close > ltrack[1] + reverse_range then
        pivot:set (ltrack)
        is_direction_up:set(true)
        reference:set (ltrack)
    end
end

color = is_direction_up() and  up_color or down_color
plot(pivot, 'ZZ', color, width, -1, style.solid_line, na_mode.continue)
