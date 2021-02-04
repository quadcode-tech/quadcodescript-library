instrument { name = "Chop Zone" }

hh_period = input (30, "front.newind.chopzone.hhllperiod", input.integer, 1)
ma_period = input (34, "front.newind.maperiod", input.integer, 1)

src_idx = input (inputs.close, "front.ind.source", input.string_selection, inputs.titles)
avg_idx = input (inputs.hlc3, "front.newind.chopzone.smoothed", input.string_selection, inputs.titles)

fn     = input (averages.ema, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.newind.colors",

    color1 = input { default = rgba(86,206,255,0.75), type=input.color },
    color2 = input { default = rgba(24,114,38,0.75), type=input.color },
    color3 = input { default = rgba(37,225,84,0.50), type=input.color },
    color4 = input { default = rgba(37,225,84,0.80), type=input.color },
    color5 = input { default = rgba(183,36,17,0.80), type=input.color },
    color6 = input { default = rgba(255,108,88,0.75), type=input.color },
    color7 = input { default = rgba(201,94,4,0.80), type=input.color },
    color8 = input { default = rgba(255,119,0,0.50), type=input.color },
    color9 = input { default = rgba(251,233,12,0.75), type=input.color },

}

local pi = math.pi
local source = inputs [src_idx]
local avg = inputs [avg_idx]
local ma = averages [fn]

hh = highest (hh_period)
ll = lowest  (hh_period)

range = 25 * ll / (hh - ll)

ema34 = ma (source, ma_period)

y2_ema34 = (ema34[1] - ema34) / avg * range

c_ema34 = sqrt(1 + y2_ema34 ^ 2)

emaAngle_1 = round (180 / pi * acos(1 / c_ema34))
emaAngle = iff(y2_ema34 > 0, -emaAngle_1, emaAngle_1)

local color

if emaAngle >= 5 then
    color = color1
elseif emaAngle >= 3.57 then
    color = color2
elseif emaAngle >= 2.14 then
    color = color3
elseif emaAngle >= 0.71 then
    color = color4
elseif emaAngle <= -5 then
    color = color5
elseif emaAngle <= -3.57 then
    color = color6
elseif emaAngle <= -2.14 then
    color = color7
elseif emaAngle <= -0.71 then
    color = color8
else
    color = color9
end

rect {
    first = 0,
    second = 1,
    color = color,
    width = 0.8
}
