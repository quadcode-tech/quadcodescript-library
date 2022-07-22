instrument {
        overlay = true,
        name = "CandleStick Patterns",
        short_name = "CPRC",
        icon = "indicators:BelkhayateTiming"
    }
    arrow_sze = input(2, "Arrow Size", input.string_selection, {"Large", "Medium", "Normal", "Small"})
    show_engulfing = input(1, "Enable Engulfing", input.string_selection, {"Yes", "No"})
    show_hammer = input(1, "Show Bear/Bull Hammer", input.string_selection, {"Yes", "No"})
    show_marubozu = input(1, "Show Marubozu", input.string_selection, {"Yes", "No"})
    show_spinningtop = input(1, "Show Spinning Top", input.string_selection, {"Yes", "No"})
    show_tweezer_tb = input(1, "Show Tweezer Top/Bottom", input.string_selection, {"Yes", "No"})
    show_darckc = input(1, "Enable Darck-Cloud and Piercing", input.string_selection, {"Yes", "No"})
    show_doji = input(1, "Enable Doji & Doji-Star", input.string_selection, {"Yes", "No"})
    show_grey_drag_doji = input(1, "Enable Dragonfly & Gravestone Doji", input.string_selection, {"Yes", "No"})
    show_harami = input(1, "Enable Bear/Bull Harami", input.string_selection, {"Yes", "No"})
    show_3outside_up_dw = input(1, "Enable Three outside Up and Down", input.string_selection, {"Yes", "No"})
    show_3inside_up_dw = input(1, "Enable Three Inside Up and Down", input.string_selection, {"Yes", "No"})
    show_eve_mor_star = input(1, "Enable Evening and Morning Star", input.string_selection, {"Yes", "No"})
    show_matching = input(1, "Enable Matching High Low", input.string_selection, {"Yes", "No"})
    show_kicker = input(1, "Enable Bear Bull Kicker", input.string_selection, {"Yes", "No"})
    show_3_candles = input(1, "Enable 3 Soldier/cows", input.string_selection, {"Yes", "No"})
    show_tasuky_gap = input(1, "Enable Tasuki Gap", input.string_selection, {"Yes", "No"})
    show_fall_ris_wind = input(1, "Falling/Rising Window", input.string_selection, {"Yes", "No"})
    show_fall_ris_3mtd = input(1, "Falling/Rising 3 Methods", input.string_selection, {"Yes", "No"})

    input_group {"Marubozu - UP COLOR", mbup_color = input {default = "#ADFF2F", type = input.color}}
    input_group {"Marubozu - DOWN COLOR", mbdn_color = input {default = "#ADFF2F", type = input.color}}
    
    input_group {"Engulfing - UP COLOR", call_color = input {default = "#FF00FF", type = input.color}}
    input_group {"Engulfing - DOWN COLOR", put_color = input {default = "#FF00FF", type = input.color}}
    
    input_group {"Dark Cloud Cover COLOR", dark_color = input {default = "#ADFF2F", type = input.color}}
    input_group {"Piercing line COLOR", piercing_color = input {default = "#ADFF2F", type = input.color}}

    input_group {"Hammer", hmr_color = input {default = "#00FFFF", type = input.color}}
    input_group {"Inverted Hammer", ihmr_color = input {default = "#00FFFF", type = input.color}}
    
    input_group {"Hanging Man", hgm_color = input {default = "#00FFFF", type = input.color}}
    input_group {"Shotting Star", shtr_color = input {default = "#00FFFF", type = input.color}}
    
    input_group {"Spinning top - UP COLOR", spiningup_color = input {default = "#FFA07A", type = input.color}}
    input_group {"Spinning top - DOWN COLOR", spiningdn_color = input {default = "#FFA07A", type = input.color}}
    
    input_group {"Tweezer - UP COLOR", twezerup_color = input {default = "#FFFF00", type = input.color}}
    input_group {"Tweezer - DOWN COLOR", twezerdn_color = input {default = "#FFFF00", type = input.color}}

    input_group {"Doji Star COLOR", doji_star_color = input {default = "#9370DB", type = input.color}}
    input_group {"Doji color", doji_color = input {default = "#9370DB", type = input.color}}
    input_group {"DragonFly Doji COLOR", dragon_doji_color = input {default = "#DDA0DD", type = input.color}}
    input_group {"Gravestone doji COLOR", grave_doji_color = input {default = "#DDA0DD", type = input.color}}

    input_group {"Bull Harami COLOR", bull_harami_color = input {default = "#9ACD32", type = input.color}}
    input_group {"Bear Harami COLOR", bear_harami_color = input {default = "#9ACD32", type = input.color}}

    input_group {"3 outside up COLOR", outsideup_color = input {default = "#8FBC8B", type = input.color}}
    input_group {"3 outside down COLOR", outsidedw_color = input {default = "#8FBC8B", type = input.color}}
    
    input_group {"Three Inside up COLOR", insideup_color = input {default = "#008080", type = input.color}}
    input_group {"Three Inside down COLOR", insidedw_color = input {default = "#008080", type = input.color}}

    input_group {"Morning Star Color COLOR", morning_star_color = input {default = "#7B68EE", type = input.color}}
    input_group {"Evening Star Color COLOR", outsidedw_color = input {default = "#7B68EE", type = input.color}}

    input_group {"Matching low COLOR", matl_color = input {default = "#FFA07A", type = input.color}}
    input_group {"Matching high COLOR", math_color = input {default = "#FFA07A", type = input.color}}

    input_group {"Bull Kicker COLOR", bullkiker_color = input {default = "#BDB76B", type = input.color}}
    input_group {"Bear Kicker COLOR", bearkiker_color = input {default = "#BDB76B", type = input.color}}

    input_group {"3 white soldier", three_w_soldier = input {default = "#E0FFFF", type = input.color}}
    input_group {"3 black cows", three_b_cows = input {default = "#E0FFFF", type = input.color}}

    input_group {"Downside Tasuki Gap", tasuki_dn_gap = input {default = "#20B2AA", type = input.color}}
    input_group {"Upside Tasuki Gap", tasuki_up_gap = input {default = "#20B2AA", type = input.color}}

    input_group {"Falling Windows PUT", filling_window_dn = input {default = "#FF00FF", type = input.color}}
    input_group {"Rising Window CALL", rising_window_up = input {default = "#FF00FF", type = input.color}}

    input_group {"Falling 3 Methods PUT", filling_3_mtd_dn = input {default = "#FF1493", type = input.color}}
    input_group {"Rising 3 Methods CALL", rising_3_mtd_up = input {default = "#FF1493", type = input.color}}

    if arrow_sze == 1 then
        arrow_size_id = shape_size.huge
    elseif arrow_sze == 2 then
        arrow_size_id = shape_size.large
    elseif arrow_sze == 3 then
        arrow_size_id = shape_size.normal
    elseif arrow_sze == 4 then
        arrow_size_id = shape_size.small
    end
    
    --Define body_a size to scann
    Shadow_a = (high[1] - low[1])
    Body_a = (abs(close[1] - open[1]))

    Shadow_b = (high[2] - low[2])
    Body_b = (abs(close[2]-open[2]))

    Shadow_c = (high[3]-low[3])
    Body_c = (abs(close[3]-open[3]))

    MidCandleBody_a = abs(close[1] + open[1])/2
    MidCandleBody_c = abs(close[3] + open[3])/2

    -- Define Candles
    engulfingup = (close[2] < open[2]) and (close[1] > open[1]) and (close[1] > open[2]) and (close[2] >= open[1])
    enfulfingdn = (close[2] > open[2]) and (close[1] < open[1]) and (close[1] < open[2]) and (close[2] <= open[1])
    is_dark_cloud = close[2] > open[2] and Body_b > Shadow_b*0.7 and close[1] < open[1] and Body_a > Shadow_a*0.7 and open[1] > close[2] and open[2] < close[1] and close[1] < MidCandleBody_a 
    is_piercing   = close[2] < open[2] and Body_b > Shadow_b*0.7 and close[1] > open[1] and Body_a > Shadow_a*0.7 and open[1] < close[2] and close[1] < open[2] and close[1] > MidCandleBody_a 
    is_hammer = (open[1] < close[1] and close[1] > high[1] - (Shadow_a * 0.05) and Body_a <= (Shadow_a * 0.4) and Body_a > (Shadow_a * 0.2)  )
    is_inverted_hammer = (open[1] < close[1] and open[1] < low[1] + (Shadow_a * 0.05) and Body_a <= (Shadow_a * 0.4) and Body_a > (Shadow_a * 0.2)  )
    is_hangingMan = (open[1] > close[1] and open[1] > high[1] - (Shadow_a * 0.05) and Body_a <= (Shadow_a * 0.4) and Body_a > (Shadow_a * 0.2)  )
    is_shottingStar = (open[1] > close[1] and close[1] < low[1] + (Shadow_a * 0.05) and Body_a <= (Shadow_a * 0.4) and Body_a > (Shadow_a * 0.2)  )
    is_spinningtop = (open[1] < close[1] and close[1] < high[1] - (Shadow_a * 0.30) and open[1] > low[1] + (Shadow_a * 0.30) and Body_a < (Shadow_a * 0.4) and Body_a > (Shadow_a * 0.05)  )
    is_spinningbtn = (open[1] > close[1] and open[1] < high[1] - (Shadow_a * 0.30) and close[1] > low[1] + (Shadow_a * 0.30) and Body_a < (Shadow_a * 0.4) and Body_a > (Shadow_a * 0.05)  )
    is_doji = Body_a / Shadow_a < 0.1 and (high[1] - max(close[1], open[1])) > (3 * Body_a) and (min(close[1], open[1]) - low[1]) > (3 * Body_a)   
    is_dragonfly_doji = Body_a / Shadow_a < 0.1 and (min(close[1], open[1]) - low[1]) > (3 * Body_a) and (high[1] - max(close[1], open[1])) < Body_a  
    is_gravestone_doji = Body_a / Shadow_a < 0.1 and (high[1] - max(close[1], open[1])) > (3 * Body_a) and (min(close[1], open[1]) - low[1]) <= Body_a  
    is_doji_star = close[2] > open[2] and (Body_b / Shadow_b >= 0.7) and Body_a / Shadow_a < 0.1 and close[2] < close[1] and close[2] < open[1] and (high[1] - max(close[1], open[1])) > (3 * Body_a) and (min(close[1], open[1]) - low[1]) > (3 * Body_a)  
    is_marubozuup = ((open[1] < close[1]) and (close[1] > high[1] - (Shadow_a * 0.02)) and (open[1] < low[1] + (Shadow_a * 0.02)) and (Body_a > (Shadow_a * 0.95)) )
    is_marubozudn = ((open[1] > close[1]) and (close[1] < high[1] + (Shadow_a * 0.02)) and (open[1] > low[1] - (Shadow_a * 0.02)) and (Body_a > (Shadow_a * 0.95)) )
    is_tweezerbtm = (close[2] < open[2] and close[1] > open[1] and (low[1] == low[2]))
    is_tweezertop = (close[2] > open[2] and close[1] < open[1] and (high[1] == high[2]))
    is_bear_harami = (close[2] > open[2] and open[1] > close[1] and open[1] <= close[2] and open[2] <= close[1] and open[1] - close[1] < close[2] - open[2] and open[1] < close[2] )
    is_bull_harami = (open[2] > close[2] and close[1] > open[1] and close[1] <= open[2] and close[2] <= open[1] and close[1] - open[1] < open[2] - close[2]  and open[1] < close[2])
    is_3outsideup = ((open[3]>close[3]) and (close[2] > open[2]) and (close[2]>=open[3]) and (close[3]>=open[2]) and ((close[2]-open[2])>(open[3]-close[3])) and (close[1] > open[1]) and (close[1] > close[2])  )
    is_3outsidedw = ((close[3]>open[3]) and (open[2]>close[2]) and (open[2]>=close[3]) and (open[3]>=close[2]) and ((open[2]-close[2])>(close[3]-open[3])) and (open[1] > close[1]) and (close[1] < close[2]) )
    is_3insideup =(open[3] > close[3]) and (close[2] > open[2]) and   close[2] >= MidCandleBody_c and (close[1] > open[1]) and close[1] > open[3] and close[1] > close[2] and close[2] < open[3]         
    is_3insidedw =(open[3] < close[3]) and (close[2] < open[2]) and close[2] <= MidCandleBody_c and (close[1] < open[1]) and close[1] < open[3] and close[1] < close[2] and close[2] > open[3] 
    is_evening_star = open[3] < close[3] and Body_b < Shadow_b*0.3 and open[1] > close[1] and close[1] < low[2] and open[3] < low[2]  and Body_a > Shadow_a*0.5 and Body_c > Shadow_c*0.5 and close[1] < MidCandleBody_c
    is_morning_star = open[3] > close[3] and Body_b < Shadow_b*0.3 and open[1] < close[1] and close[1] > high[2] and open[3] > high[2] and Body_a > Shadow_a*0.5 and Body_c > Shadow_c*0.5 and close[1] > MidCandleBody_c
    is_bull_matching = (close[2] < open[2] and Body_b > .5* Shadow_b and close[1] < open[1] and abs(close[1]/close[2]-1) < 0.01 and close[2]==close[1]  )
    is_bear_matching = (close[2] > open[2] and Body_b > .5* Shadow_b and close[1] > open[1] and abs(close[1]/close[2]-1) < 0.01 and close[2]==close[1]  )
    is_bull_kicker = (close[1] > open[1]) and (close[2] < open[2]) and ((open[1] - open[2]) > 0.0) 
    is_bear_kicker = (close[1] < open[1]) and (close[2] > open[2]) and ((open[2] - open[1]) > 0.0)
    is_3_withe_soldier = close[1] > open[1] and close[2] > open[2] and close[3] > open[3] and close[4] < open[4] and Body_a > Shadow_a*0.5 and Body_b > Shadow_b*0.5 and Body_c > Shadow_c*0.5
    is_3_black_cows = close[1] < open[1] and close[2] < open[2] and close[3] < open[3] and close[4] > open[4] and Body_a > Shadow_a*0.5 and Body_b > Shadow_b*0.5 and Body_c > Shadow_c*0.5
    tasuki_gap_dn= high[2] < low[3] and open[1] <  open[2] and close[1] > high[2] and close[1] < low[3] and close[3] < open[3] and close[2] <  open[2] and (abs(close[3] - open[3]) > 0.5* (high[3] - low[3]) ) and (abs(close[2] - open[2]) > 0.5* (high[2] - low[2])) 
    tasuki_gap_up= low[2] > high[3] and close[1] < open[1] and close[1] < open[2] and close[1] > close[3] and close[2] > open[2] and close[3] > open[3] and (abs(close[3] - open[3]) > 0.5* (high[3] - low[3]) ) and (abs(close[2] - open[2]) > 0.5* (high[2] - low[2])) 
    falling_gap_win_dn=(open[1]<low[2]*0.995 and high[1]<low[2]*0.995)
    rising_gap_win_up=(open[1]>high[2]*1.005 and low[1]>high[2]*1.005)

    if show_engulfing == 1 then
        plot_shape(engulfingup, "Bull_Engulfing", shape_style.arrowup, arrow_size_id, call_color, shape_location.belowbar, -1, "Eng", call_color)
        plot_shape(enfulfingdn, "Bear_Engulfing", shape_style.arrowdown, arrow_size_id, put_color, shape_location.abovebar, -1, "Eng", put_color)
    end
    if (show_hammer == 1) then
        plot_shape(is_hammer, "Hammer", shape_style.triangleup, arrow_size_id, hmr_color, shape_location.belowbar, -1, "Hmr", hmr_color)
        plot_shape(is_inverted_hammer, "Inverted Hammer", shape_style.triangleup, arrow_size_id, ihmr_color, shape_location.belowbar, -1, "Ihmr", ihmr_color)
        plot_shape(is_hangingMan, "Hanging Man", shape_style.triangledown, arrow_size_id, hgm_color, shape_location.abovebar, -1, "Hgm", hgm_color)
        plot_shape(is_shottingStar, "Shotting Star", shape_style.triangledown, arrow_size_id, shtr_color, shape_location.abovebar, -1, "Str", shtr_color)
    end
    if (show_marubozu == 1) then
        plot_shape(is_marubozuup, "Marobotu UP", shape_style.square, arrow_size_id, mbup_color, shape_location.belowbar, -1, "Mzu", mbup_color)
        plot_shape(is_marubozudn, "Marubozu Down", shape_style.square, arrow_size_id, mbdn_color, shape_location.abovebar, -1, "Mzu", mbdn_color)
    end
    if (show_spinningtop == 1) then
        plot_shape(is_spinningtop, "BullSpinningtop", shape_style.circle, arrow_size_id, spiningup_color, shape_location.belowbar, -1, "SPT", spiningup_color)
        plot_shape(is_spinningbtn, "BearSpinningtop", shape_style.circle, arrow_size_id, spiningdn_color, shape_location.abovebar, -1, "SPT", spiningdn_color)
    end
    if (show_tweezer_tb == 1) then
        plot_shape(is_tweezertop, "TweezerTop", shape_style.cross, arrow_size_id, hgm_color, shape_location.belowbar, -1, "TWET", hgm_color)
        plot_shape(is_tweezerbtm, "TweezerBottom", shape_style.cross, arrow_size_id, twezerup_color, shape_location.abovebar, -1, "TWEB", twezerdn_color)
    end
    if (show_darckc == 1) then
        plot_shape(is_dark_cloud, "Dark Cloud Cover", shape_style.diamond, arrow_size_id, dark_color, shape_location.abovebar, -1, "DCC", dark_color)
        plot_shape(is_piercing, "Piercing Line", shape_style.diamond, arrow_size_id, piercing_color, shape_location.belowbar, -1, "PLP", piercing_color)
    end
    if (show_doji == 1) then
        plot_shape(is_doji, "Doji", shape_style.cross, arrow_size_id, doji_color, shape_location.abovebar, -1, "Doji", doji_color)
        plot_shape(is_doji_star, "Doji Star", shape_style.cross, arrow_size_id, doji_star_color, shape_location.abovebar, -1, "D_Star", doji_star_color)
    end
    if (show_grey_drag_doji == 1) then
        plot_shape(is_dragonfly_doji, "Dragon Fly Doji", shape_style.flag, arrow_size_id, dragon_doji_color, shape_location.belowbar, -1, "DrDji", dragon_doji_color)
        plot_shape(is_gravestone_doji, "Gravestone Doji", shape_style.flag, arrow_size_id, grave_doji_color, shape_location.abovebar, -1, "GrDji", grave_doji_color)
    end
    if (show_harami == 1) then
        plot_shape(is_bull_harami, "Bull_Harami", shape_style.triangleup, arrow_size_id, bull_harami_color, shape_location.belowbar, -1, "HARup", bull_harami_color)
        plot_shape(is_bear_harami, "Bear Harami", shape_style.triangledown, arrow_size_id, bear_harami_color, shape_location.abovebar, -1, "HARdn", bear_harami_color)
    end
    if (show_3outside_up_dw == 1) then
        plot_shape(is_3outsideup, "3 Outside UP", shape_style.triangleup, arrow_size_id, outsideup_color, shape_location.belowbar, -1, "3OUP", outsideup_color)
        plot_shape(is_3outsidedw, "3 Outside DOWB", shape_style.diamond, arrow_size_id, outsidedw_color, shape_location.abovebar, -1, "3ODN", outsidedw_color)
    end
    if (show_3inside_up_dw == 1) then
        plot_shape(is_3insideup, "3 Inside UP", shape_style.diamond, arrow_size_id, insideup_color, shape_location.belowbar, -1, "3IUP", insideup_color)
        plot_shape(is_3insidedw, "3 Inside DOWN", shape_style.diamond, arrow_size_id, insidedw_color, shape_location.abovebar, -1, "3IDN", insidedw_color)
    end
    if (show_eve_mor_star == 1) then
        plot_shape(is_morning_star, "Morning Star", shape_style.arrowup, arrow_size_id, morning_star_color, shape_location.belowbar, -1, "MRST", morning_star_color)
        plot_shape(is_evening_star, "Evening Star", shape_style.arrowdown, arrow_size_id, outsidedw_color, shape_location.abovebar, -1, "EVST", outsidedw_color)
    end
    if (show_matching == 1) then
        plot_shape(is_bull_matching, "Matching Low", shape_style.circle, arrow_size_id, matl_color, shape_location.belowbar, -1, "MATL", matl_color)
        plot_shape(is_bear_matching, "Matching High", shape_style.circle, arrow_size_id, math_color, shape_location.abovebar, -1, "MATH", math_color)
    end
    if (show_kicker == 1) then
        plot_shape(is_bull_kicker, "Bull Kicker", shape_style.diamond, arrow_size_id, bullkiker_color, shape_location.belowbar, -1, "KIKR", bullkiker_color)
        plot_shape(is_bear_kicker, "Bear Kicker", shape_style.diamond, arrow_size_id, bearkiker_color, shape_location.abovebar, -1, "KIKR", bearkiker_color)
    end
    if (show_3_candles == 1) then
        plot_shape(is_3_withe_soldier, "Bull 3 withe soldier", shape_style.diamond, arrow_size_id, three_w_soldier, shape_location.belowbar, -1, "3WS", three_w_soldier)
        plot_shape(is_3_black_cows, "Bear black cows", shape_style.diamond, arrow_size_id, three_b_cows, shape_location.abovebar, -1, "3BC", three_b_cows)
    end

    if (show_tasuky_gap == 1) then
        plot_shape(tasuki_gap_up, "Bull Tasuki Gap up", shape_style.diamond, arrow_size_id, tasuki_up_gap, shape_location.belowbar, -1, "TSGP", tasuki_up_gap)
        plot_shape(tasuki_gap_dn, "Bear Tasuki gap down", shape_style.diamond, arrow_size_id, tasuki_dn_gap, shape_location.abovebar, -1, "TSGP", tasuki_dn_gap)
    end

    if (show_fall_ris_wind == 1) then
        plot_shape(rising_gap_win_up, "Rising Window up", shape_style.diamond, arrow_size_id, rising_window_up, shape_location.belowbar, -1, "RGWd", rising_window_up)
        plot_shape(falling_gap_win_dn , "Falling Window down", shape_style.diamond, arrow_size_id, filling_window_dn, shape_location.abovebar, -1, "FGWd", filling_window_dn)
    end

    if (show_fall_ris_3mtd == 1) then
        plot_shape(rising_3_mthd_up, "Rising 3 Methods up", shape_style.diamond, arrow_size_id, rising_3_mtd_up, shape_location.belowbar, -1, "R3mt", rising_3_mtd_up)
        plot_shape(falng_3_mthd_dn, "Falling 3 Methods down", shape_style.diamond, arrow_size_id, filling_3_mtd_dn, shape_location.abovebar, -1, "F3mt", filling_3_mtd_dn)
    end






  
