instrument {
    overlay = true,
    name = "Auto fibonacci Retracement",
    short_name = "AFRT",
    icon = "indicators:AO"
}
n=input(60, "front.period", input.integer, 2)
input_group {
    "front.ind.dpo.generalline",
    colottop = input { default = "#00FFFF", type = input.color },
    colormdd = input { default = "#0000FF", type = input.color },
    colorbtn = input { default = "#00FFFF", type = input.color },
    colorbtb = input { default = "#808080", type = input.color }
}
hh=highest(high,n)
ll=lowest(low,n)
p1=ll+(hh-ll)*0.236
p2=ll+(hh-ll)*0.382
p3=ll+(hh-ll)*0.5
p4=ll+(hh-ll)*0.618
p5=ll+(hh-ll)*0.764

hline{ll, "Lowest",colottop,2, 0, style.solid_line,show_label = true}
hline{p1, "p1 0.236",colorbtb,1, 0, style.solid_line,show_label = true}
hline{p2, "p2 0.382",colorbtb,1, 0, style.solid_line,show_label = true}
hline{p3, "p3 0.5",colormdd,2, 0, style.solid_line,show_label = true}
hline{p4, "p4 0.618 ",colorbtb,1, 0, style.solid_line,show_label = true}
hline{p5, "p5 0.764",colorbtb,1, 0, style.solid_line,show_label = true}
hline{hh, "Highest",colorbtn,2, 0, style.solid_line,show_label = true}
