instrument { name="Divergence Indicator" }

ma_period = input (14, "front.period", input.integer, 1)
src_idx = input (inputs.close, "front.ind.source", input.string_selection, inputs.titles)

bullish_n_color = input ("#2CAC40", "front.newind.divergence.normalbullish", input.color)
bullish_h_color = input ("#2CAC40", "front.newind.divergence.hiddenbullish", input.color)
bearish_n_color = input ("#DB4931", "front.newind.divergence.normalbearish", input.color)
bearish_h_color = input ("#DB4931", "front.newind.divergence.hiddenbearish", input.color)

osc = rsi (inputs [src_idx], ma_period)

-- Bullish
bullishPrice = low
priceMins = bullishPrice > bullishPrice[1] and bullishPrice[1] < bullishPrice[2]

priceRightMin = value_when(priceMins, bullishPrice[1], 0)
priceLeftMin = value_when(priceMins, bullishPrice[1], 1)

oscRightMin = value_when(priceMins, osc[1], 0)
oscLeftMin = value_when(priceMins, osc[1], 1)

bullishNDiv = conditional (priceLeftMin > priceRightMin and oscLeftMin < oscRightMin)
bullishHDiv = conditional (priceLeftMin < priceRightMin and oscLeftMin > oscRightMin)

bullishNSig = get_value (bullishNDiv) and (not get_value (bullishNDiv[1])) and (bullishPrice[1] < bullishPrice)
bullishHSig = get_value (bullishHDiv) and (not get_value (bullishHDiv[1])) and (bullishPrice[1] > bullishPrice)

if bullishNSig then
    rect {
        first = 0,
        second = 1,
        color = bullish_n_color,
        width = 0.6
    }
end


if bullishHSig then
    rect {
        first = 0,
        second = 1,
        color = bullish_h_color,
        width = 0.2
    }
end

-- Bearish

bearishPrice = high
priceMaxs = bearishPrice < bearishPrice[1] and bearishPrice[1] > bearishPrice[2]

priceRightMax = value_when(priceMaxs, bearishPrice[1], 0)
priceLeftMax = value_when(priceMaxs, bearishPrice[1], 1)

oscRightMax = value_when(priceMaxs, osc[1], 0)
oscLeftMax = value_when(priceMaxs, osc[1], 1)

bearishNDiv = conditional (priceLeftMax < priceRightMax and oscLeftMax > oscRightMax)
bearishHDiv = conditional (priceLeftMax > priceRightMax and oscLeftMax < oscRightMax)

bearishNSig = get_value (bearishNDiv) and not get_value (bearishNDiv[1]) and bearishPrice[1] < bearishPrice
bearishHSig = get_value (bearishHDiv) and not get_value (bearishHDiv[1]) and bearishPrice[1] > bearishPrice

if bearishNSig  then
    rect {
        first = 0,
        second = 1,
        color = bearish_n_color,
        width = 0.6
    }
end


if bearishHSig  then
    rect {
        first = 0,
        second = 1,
        color = bearish_h_color,
        width = 0.2
    }
end
