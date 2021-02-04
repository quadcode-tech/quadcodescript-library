instrument { name = "Gator Oscillator", icon="indicators:Alligator" }

input_group {
    "front.jaws",
    jaws_period  = input (13, "front.period", input.integer, 1),
    jaws_offset  = input (8, "front.newind.offset", input.integer, 1)
}

input_group {
    "front.teeth",
    teeth_period  = input (8, "front.period", input.integer, 1),
    teeth_offset  = input (5, "front.newind.offset", input.integer, 1)
}

input_group {
    "front.lips",
    lips_period  = input (5, "front.period", input.integer, 1),
    lips_offset  = input (3, "front.newind.offset", input.integer, 1)
}

input_group {
    "front.newind.barcolors",
    up_color   = input { default = "#2CAC40", type = input.color },
    down_color = input { default = "#DB4931", type = input.color }
}

input_group {
    "front.platform.baseline",
    zero_color = input { default = rgba(255,255,255,0.15), type = input.color },
    zero_width = input { default = 1, type = input.line_width },
    zero_visible = input { default = true, type = input.plot_visibility }
}

source = input (1, "front.ind.source", input.string_selection,  inputs.titles)
fn     = input (averages.ssma, "front.newind.average", input.string_selection, averages.titles)

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

jaws = averageFunction(sourceSeries, jaws_period)
teeth = averageFunction(sourceSeries, teeth_period)
lips = averageFunction(sourceSeries, lips_period)

upper = abs (jaws [jaws_offset] - teeth [teeth_offset])
lower = abs (teeth [teeth_offset] - lips [lips_offset])

rect {
    first = 0,
    second = upper,
    color = upper >= upper [1] and up_color or down_color,
    width = 0.8
}

rect {
    first = 0,
    second = -lower,
    color = lower >= lower [1] and up_color or down_color,
    width = 0.8
}

if zero_visible then
    hline (0, "", zero_color, zero_width)
end
