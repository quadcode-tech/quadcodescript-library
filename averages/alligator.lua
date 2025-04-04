instrument { name = "Alligator", icon="indicators:Alligator", overlay = true }

input_group {
    "Jaws",
    jaws_period  = input (13, "Period", input.integer, 1),
    jaws_offset  = input (8, "Offset", input.integer),
    jaws_color   = input { default = "#56CEFF", type = input.color },
    jaws_width   = input { default = 1, type = input.line_width },
    jaws_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Teeth",
    teeth_period  = input (8, "Period", input.integer, 1),
    teeth_offset  = input (5, "Offset", input.integer),
    teeth_color   = input { default = "#FF6C58", type = input.color },
    teeth_width   = input { default = 1, type = input.line_width },
    teeth_visible = input { default = true, type = input.plot_visibility }
}

input_group {
    "Lips",
    lips_period  = input (5, "Period", input.integer, 1),
    lips_offset  = input (3, "Offset", input.integer),
    lips_color   = input { default = "#25E154", type = input.color },
    lips_width   = input { default = 1, type = input.line_width },
    lips_visible = input { default = true, type = input.plot_visibility }
}

source = input (1, "Source", input.string_selection,  inputs.titles_overlay)
fn     = input (averages.ssma, "Average", input.string_selection, averages.titles)

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

if jaws_visible then
    jaws = averageFunction(sourceSeries, jaws_period)
    plot (jaws, "Jaws", jaws_color, jaws_width, jaws_offset)
end

if teeth_visible then
    teeth = averageFunction(sourceSeries, teeth_period)
    plot (teeth, "Teeth", teeth_color, teeth_width, teeth_offset)
end

if lips_visible then
    lips = averageFunction(sourceSeries, lips_period)
    plot (lips, "Lips", lips_color, lips_width, lips_offset)
end
