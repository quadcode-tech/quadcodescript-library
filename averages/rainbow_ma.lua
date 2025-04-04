instrument { name = "Rainbow MA", overlay = true }

starting_period = input (2, "Starting Period", input.integer, 1, 100)
bands_count = input (10, "Bands Count", input.integer, 1, 20)

source = input (1, "Source", input.string_selection,  inputs.titles_overlay)
fn     = input (1, "Average", input.string_selection, averages.titles)

input_group {
    "Lines",
    color1  = input { default = "#FF6C58", type = input.color },
    color2  = input { default = "#DB4931", type = input.color },
    color3  = input { default = "#FF7700", type = input.color },
    color4  = input { default = "#DBCF0D", type = input.color },
    color5  = input { default = "#25E154", type = input.color },
    color6  = input { default = "#4BFFB5", type = input.color },
    color7  = input { default = "#56CEFF", type = input.color },
    color8  = input { default = "#2384C2", type = input.color },
    color9  = input { default = "#B42EFF", type = input.color },
    color10 = input { default = "#FF6BF1", type = input.color },
    width   = input { default = 1, type = input.line_width }
}

local colors = {
    color1, color2, color3, color4, color5,
    color6, color7, color8, color9, color10
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]

for i=1,bands_count do
    local color = colors [(i % 10) + 1]
    sourceSeries = averageFunction (sourceSeries, starting_period)
    plot (sourceSeries, "", color, width)
end
