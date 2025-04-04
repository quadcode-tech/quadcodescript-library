instrument { name = "KAMA", overlay = true }

local length = input (21, "Period", input.integer, 1 , 250  )
local fastMA = input (4,  "Fast Period",   input.integer, 1, 250)
local slowMA = input (30, "Slow Period",   input.integer, 1, 250)
local source = input (1,  "Source", input.string_selection, inputs.titles_overlay)

input_group {
    "General Line",
    color = input { default = "#57A1D0", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local source_series = inputs [source]

change = abs (source_series - source_series[length - 1])
volatility = sum (abs(source_series - source_series[1]), length)

local er = 0

if nz (volatility [0]) ~= 0 then
    er = nz (change [0]) / nz (volatility [0])
end

local fastSC = 2 / (fastMA + 1)
local slowSC = 2 / (slowMA + 1)

local sc = (er * (fastSC - slowSC) + slowSC) ^ 2

kama = sc * source_series + (1 - sc) * nz(kama [1], source_series [0])

plot (kama, "KAMA", color, width)
