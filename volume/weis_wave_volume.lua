instrument { name = "Weis Wave Volume", short_name = "WWV" }

local method        = input(1, "Renko Assignment Method", input.string_selection, { "ATR", "Traditional", "Part of Price" })
local methodvalue   = input(2, "Value", input.double, 0)
local pricesource   = input(1, "Price Source", input.string_selection, { "Close", "Open / Close", "High / Low" })

local useTrueRange  = input(2, "Use True Range instead of Volume", input.string_selection, { "Always", "Auto", "Never" })
local isOscillating = input(false, "Oscillating", input.boolean)
local normalize     = input(false, "Normalize", input.boolean)

input_group {
    "front.newind.barcolors",
    up_color   = input { default = "#2CAC40", type = input.color },
    down_color = input { default = "#DB4931", type = input.color }
}

local useClose = pricesource == 1
local useOpenClose = pricesource == 2 or useClose

local inp_vol = iff (useTrueRange == 1 or (useTrueRange == 2 and na(volume)), tr, volume)
local op = iff (useClose, close, open)
local hi = iff (useOpenClose, iff (close >= op, close, op), high)
local lo = iff (useOpenClose, iff (close <= op, close, op), low)

if method == 1 then
    methodvalue = rma(tr, round(methodvalue))
elseif method == 3 then
    methodvalue = close / methodvalue
end

prevclose = nz(currclose[1])
prevhigh = prevclose + methodvalue
prevlow = prevclose - methodvalue
currclose = iff (hi > prevhigh, hi, iff (lo < prevlow, lo, prevclose))

direction = iff (currclose > prevclose, 1, iff (currclose < prevclose, -1, nz(direction[1])))

local directionHasChanged = direction ~= direction [1]

local directionIsUp = direction > 0
local directionIsDown = direction < 0

barcount = nz (iff (not directionHasChanged and normalize, barcount[1] + 1, 1), 1)
vol = iff (not directionHasChanged, nz (vol [1]) + inp_vol, inp_vol)

res = vol / barcount

rect (
    0, iff (isOscillating and directionIsDown, -res, res),
    "",
    directionIsUp and up_color or down_color,
    0.6
)
