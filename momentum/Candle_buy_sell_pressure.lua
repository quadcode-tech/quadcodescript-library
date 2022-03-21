instrument {overlay = false,
            name = 'Candle Buy/Sell Pressure',
            short_name = 'CBSP ',
            icon="indicators:AO"}

input_group { "Presure UP Color", up_color = input { default="lime", type = input.color } }
input_group { "Presure Down Color", dn_color = input { default="tomato", type = input.color } }
barwidth = input (0.3, "Volume width", input.double, 0.1, 250)

BP =    iff(close<open,iff(close[1]<open,  max(high-close[1], close-low), 
            max(high-open, close-low)), iff(close>open, iff(close[1]>open,  high-low, 
            max(open-close[1], high-low)), iff(high-close>close-low, iff(close[1]<open,    max(high-close[1],close-low),
            high-open), iff(high-close<close-low, iff(close[1]>open,    high-low,
            max(open-close[1], high-low)), iff(close[1]>open,  max(high-open, close-low),
            iff(close[1]<open,  max(open-close[1], high-low),
        high-low))))))
SP =    iff(close<open, iff(close[1]>open,  max(close[1]-open, high-low),
            high-low), iff(close>open, iff(close[1]>open,  max(close[1]-low, high-close),
            max(open-low, high-close)), iff(high-close>close-low,   iff(close[1]>open,  max(close[1]-open, high-low),
            high-low), iff(high-close<close-low,   iff(close[1]>open,  max(close[1]-low, high-close),
            open-low), iff(close[1]>open,  max(close[1]-open, high-low),
            iff(close[1]<open,  max(open-low, high-close),
        high-low))))))
TP = BP+SP
rect {
    first =TP,
    second  ="",
    color =  iff(BP > SP,up_color,iff(SP > BP,dn_color,nil)),
    width = barwidth
}
