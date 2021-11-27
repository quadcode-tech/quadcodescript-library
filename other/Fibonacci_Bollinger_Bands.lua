instrument {
            overlay = true,
            name = 'Fibonacci retracements B.Bands',
            short_name = 'FBBB',
            icon="indicators:BB"}
period = input (200, "front.period", input.integer, 1)
source = input (1, "front.ind.source", input.string_selection, inputs.titles_overlay)
fn     = input (1, "front.newind.average", input.string_selection, averages.titles)
devs   = input (2.3, "front.newind.stddev", input.double, 0.5)

input_group {
    "front.ind.dpo.generalline",
    colottop = input { default = "#00FFFF", type = input.color },
    colormdd = input { default = "#0000FF", type = input.color },
    colorbtn = input { default = "#00FFFF", type = input.color },
    colorbtb = input { default = "#808080", type = input.color }
}

local sourceSeries = inputs [source]
local averageFunction = averages [fn]
basis = averageFunction(sourceSeries, period)
dev = devs * stdev(sourceSeries, period)
upper_1 = basis + 0.236 * dev
upper_2 = basis + 0.382 * dev
upper_3 = basis + 0.5 * dev
upper_4 = basis + 0.618 * dev
upper_5 = basis + 0.764 * dev
upper_6 = basis + 1 * dev
lower_1 = basis - 0.236 * dev
lower_2 = basis - 0.382 * dev
lower_3 = basis - 0.5 * dev
lower_4 = basis - 0.618 * dev
lower_5 = basis - 0.764 * dev
lower_6 = basis - 1 * dev
plot(basis, "BB Midle",colormdd,2,0,style.solid_line,na_mode.continue)
p1 = plot(upper_1, "0.236", colorbtb, 1,0, style.solid_line, na_mode.continue)
p2 = plot(upper_2, "0.382", colorbtb, 1,0, style.solid_line, na_mode.continue)
p3 = plot(upper_3, "0.5", colormdd, 2,0, style.solid_line, na_mode.continue)
p4 = plot(upper_4,"0.618" , colormdd, 2,0, style.solid_line, na_mode.continue)
p5 = plot(upper_5, "0.764", colorbtb, 1,0, style.solid_line, na_mode.continue)
p6 = plot(upper_6, "1", colottop, 2,0, style.solid_line, na_mode.continue)
p13 = plot(lower_1, "0.236", colorbtb, 1,0, style.solid_line, na_mode.continue)
p14 = plot(lower_2, "0.382", colorbtb, 1,0, style.solid_line, na_mode.continue)
p15 = plot(lower_3, "0.5", colormdd, 2,0, style.solid_line, na_mode.continue)
p16 = plot(lower_4, "0.618", colormdd, 2,0, style.solid_line, na_mode.continue)
p17 = plot(lower_5, "0.764", colorbtb, 1,0, style.solid_line, na_mode.continue)
p18 = plot(lower_6, "1", colorbtn, 2,0, style.solid_line, na_mode.continue)
