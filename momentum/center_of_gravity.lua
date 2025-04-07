instrument { name = "Center of Gravity" }

period = input (10, "Period", input.integer, 1, 200)

input_group {
    "CoG",
    ef_color = input { default = "#2CAC40", type = input.color },
    ef_width = input { default = 1, type = input.line_width },
    ef_visible = input { default = true, type = input.plot_visibility }
}


input_group {
    "CoG Trigger",
    ef_trigger_color = input { default = "#DB4931", type = input.color },
    ef_trigger_width = input { default = 1, type = input.line_width },
    ef_trigger_visible = input { default = true, type = input.plot_visibility }
}

local num = get_value (hl2, 0)
local denom = num

for i=1,period-1 do
    local val = get_value (hl2 [i], 0)

    num = num + (1 + i) * val
    denom = denom + val
end

cg = make_series ()
cg:set(-num / denom)

if ef_trigger_visible then
    plot (cg [1], "Trigger",  ef_trigger_color, ef_trigger_width)
end

if ef_visible then
    plot (cg, "CoG", ef_color, ef_width)
end
