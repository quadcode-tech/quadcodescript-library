instrument { name = "Standard Deviation", overlay = false, icon="indicators:MA" }

period = input (20, "front.period", input.integer, 1)

source = input (1, "front.ind.source", input.string_selection,  inputs.titles)
fn     = input (1, "front.newind.average", input.string_selection, averages.titles)

input_group {
    "front.ind.dpo.generalline",
    color = input { default = "#DB4931", type = input.color },
    width = input { default = 1, type = input.line_width}
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

mean  = averageFunction (sourceSeries, period)

local sqsum = 0
local m = mean ()

if na (m) then return end

for i=0,period-1 do
    local val = sourceSeries [i]

    if na (val) then return end

    local xc = val - m
    sqsum = sqsum + xc * xc
end

std = sqrt (sqsum / (period - 1))

plot (std, "STD", color, width)
