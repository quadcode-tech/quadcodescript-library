instrument {
        overlay = true,
        name = "CandleStick Patterns",
        short_name = "CPRC",
        icon = "indicators:BelkhayateTiming"
    }
    arrow_sze = input(2, "Arrow Size", input.string_selection, {"Large", "Medium", "Normal", "Small"})
    show_engulfing =  input(true, "Engulfing", input.boolean)
    show_hammer = input(true, "Bear/Bull Hammer",input.boolean)
    show_marubozu = input(true, "Marubozu",input.boolean)
    show_spinningtop = input(true, "Spinning Top",input.boolean)
    show_tweezer_tb = input(true, "Tweezer Top/Bottom",input.boolean)
    show_darckc = input(true, "Darck-Cloud & Piercing",input.boolean)
    show_doji = input(true, "Doji & Doji-Star",input.boolean)
    show_grey_drag_doji = input(true, "Dragonfly & Gravestone Doji",input.boolean)
    show_harami = input(true, "Bear/Bull Harami",input.boolean)
    show_3outside_up_dw = input(true, "Three outside Up & Down",input.boolean)
    show_3inside_up_dw = input(true, "Three Inside Up & Down",input.boolean)
    show_eve_mor_star = input(true, "Evening & Morning Star",input.boolean)
    show_matching = input(true, "Matching High/Low",input.boolean)
    show_kicker = input(true, "Bear/Bull Kicker",input.boolean)
    show_3_candles = input(true, "3 Soldier/cows",input.boolean)
    show_tasuky_gap = input(true, "Tasuki Gap",input.boolean)
    show_fall_ris_wind = input(true, "Falling/Rising Window",input.boolean)
    show_fall_ris_3mtd = input(true, "Falling/Rising 3 Methods",input.boolean)

    input_group {"Marubozu - UP COLOR", 
                mbup_color = input {default = "#ADFF2F", type = input.color},
                mbup_shape = input { default = 8, type = input.plot_shape_style} }
    input_group {"Marubozu - DOWN COLOR", 
                mbdn_color = input {default = "#ADFF2F", type = input.color},
                mbdn_shape = input { default = 8, type = input.plot_shape_style} }
    input_group {"Engulfing - UP COLOR", 
                eng_call_color = input {default = "#FF00FF", type = input.color},
                eng_call_shape = input { default = 1, type = input.plot_shape_style} }
    input_group {"Engulfing - DOWN COLOR", 
                eng_put_color = input {default = "#FF00FF", type = input.color},
                eng_put_shape = input { default = 0, type = input.plot_shape_style} }
    input_group {"Dark Cloud Cover COLOR", 
                dark_color = input {default = "#ADFF2F", type = input.color},
                dark_shape = input { default = 2, type = input.plot_shape_style} }
    input_group {"Piercing line COLOR", 
                piercing_color = input {default = "#ADFF2F", type = input.color},
                piercing_shape = input { default = 2, type = input.plot_shape_style} }
    input_group {"Hammer", 
                hmr_color = input {default = "#00FFFF", type = input.color},
                hmr_shape = input { default = 4, type = input.plot_shape_style} }
    input_group {"Inverted Hammer", 
                ihmr_color = input {default = "#00FFFF", type = input.color},
                ihmr_shape = input { default = 4, type = input.plot_shape_style} }
    input_group {"Hanging Man", 
                hgm_color = input {default = "#00FFFF", type = input.color},
                hgm_shape = input { default = 4, type = input.plot_shape_style} }
    input_group {"Shotting Star", 
                shtr_color = input {default = "#00FFFF", type = input.color},
                shtr_shape = input { default = 4, type = input.plot_shape_style} }
    input_group {"Spinning top - UP COLOR", 
                spiningup_color = input {default = "#FFA07A", type = input.color},
                spiningup_shape = input { default = 2, type = input.plot_shape_style} }
    input_group {"Spinning top - DOWN COLOR", 
                spiningdn_color = input {default = "#FFA07A", type = input.color},
                spiningdn_shape = input { default = 2, type = input.plot_shape_style} }
    input_group {"Tweezer - UP COLOR", 
                twezerup_color = input {default = "#FFFF00", type = input.color},
                twezerup_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"Tweezer - DOWN COLOR", 
                twezerdn_color = input {default = "#FFFF00", type = input.color},
                twezerdn_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"Doji Star COLOR", 
                doji_star_color = input {default = "#9370DB", type = input.color},
                doji_star_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"Doji color", 
                doji_color = input {default = "#9370DB", type = input.color},
                doji_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"DragonFly Doji COLOR", 
                dragon_doji_color = input {default = "#DDA0DD", type = input.color},
                dragon_doji_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"Gravestone doji COLOR", 
                grave_doji_color = input {default = "#DDA0DD", type = input.color},
                grave_doji_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"Bull Harami COLOR", 
                bull_harami_color = input{default = "#9ACD32", type = input.color},
                bull_harami_shape = input{ default = 10, type = input.plot_shape_style} }
    input_group {"Bear Harami COLOR", 
                bear_harami_color = input{default = "#9ACD32", type = input.color},
                bear_harami_shape = input{ default = 9, type = input.plot_shape_style} }
    input_group {"3 outside up COLOR", 
                outsideup_color = input {default = "#8FBC8B", type = input.color},
                outsideup_shape = input { default = 10, type = input.plot_shape_style} }
    input_group {"3 outside down COLOR", 
                outsidedw_color = input {default = "#8FBC8B", type = input.color},
                outsidedw_shape = input { default = 9, type = input.plot_shape_style} }
    input_group {"Three Inside up COLOR", 
                insideup_color = input {default = "#008080", type = input.color},
                insideup_shape = input { default = 1, type = input.plot_shape_style} }
    input_group {"Three Inside down COLOR", 
                insidedw_color = input {default = "#008080", type = input.color},
                insidedw_shape = input { default = 0, type = input.plot_shape_style} }
    input_group {"Morning Star Color COLOR", 
                morning_star_color = input {default = "#7B68EE", type = input.color},
                morning_star_shape = input { default = 1, type = input.plot_shape_style} }
    input_group {"Evening Star Color COLOR", 
                evening_star_color = input {default = "#7B68EE", type = input.color},
                evening_star_shape = input { default = 0, type = input.plot_shape_style} }
    input_group {"Matching low COLOR", 
                matl_color = input {default = "#FFA07A", type = input.color},
                matl_shape = input { default = 8, type = input.plot_shape_style} }
    input_group {"Matching high COLOR", 
                math_color = input {default = "#FFA07A", type = input.color},
                math_shape = input { default = 8, type = input.plot_shape_style} }
    input_group {"Bull Kicker COLOR", 
                bullkiker_color = input {default = "#BDB76B", type = input.color},
                bullkiker_shape = input { default = 5, type = input.plot_shape_style} }
    input_group {"Bear Kicker COLOR", 
                bearkiker_color = input {default = "#BDB76B", type = input.color},
                bearkiker_shape = input { default = 5, type = input.plot_shape_style} }
    input_group {"3 white soldier", 
                three_w_soldier_color = input {default = "#E0FFFF", type = input.color},
                three_w_soldier_shape = input { default = 4, type = input.plot_shape_style} }
    input_group {"3 black cows", 
                three_b_cows_color = input {default = "#E0FFFF", type = input.color},
                three_b_cows_shape = input { default = 4, type = input.plot_shape_style} }
    input_group {"Downside Tasuki Gap", 
                tasuki_dn_gap_color = input {default = "#20B2AA", type = input.color},
                tasuki_dn_gap_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"Upside Tasuki Gap", 
                tasuki_up_gap_color = input {default = "#20B2AA", type = input.color},
                tasuki_up_gap_shape = input { default = 3, type = input.plot_shape_style} }
    input_group {"Falling Windows PUT", 
                filling_window_dn_color = input {default = "#FF00FF", type = input.color},
                filling_window_dn_shape = input { default = 9, type = input.plot_shape_style} }
    input_group {"Rising Window CALL", 
                rising_window_up_color = input {default = "#FF00FF", type = input.color},
                rising_window_up_shape = input { default = 10, type = input.plot_shape_style} }
    input_group {"Falling 3 Methods PUT", 
                filling_3_mtd_dn_color = input {default = "#FF1493", type = input.color},
                filling_3_mtd_dn_shape = input { default = 9, type = input.plot_shape_style} }
    input_group {"Rising 3 Methods CALL", 
                rising_3_mtd_up_color = input {default = "#FF1493", type = input.color},
                rising_3_mtd_up_shape = input { default = 10, type = input.plot_shape_style} }

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
    is_bull_harami = (close[2] < open[2] and open[1] < close[1] and open[1] >= close[2] and open[2] >= close[1] and open[1] - close[1] >close[2] - open[2] and open[1] > close[2] )
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
    is_3_withe_soldier = close[1] > open[1] and close[2] > open[2] and close[3] > open[3] and close[4] < open[4] and Body_a > Shadow_a*0.4 and Body_b > Shadow_b*0.4 and Body_c > Shadow_c*0.4
    is_3_black_cows = close[1] < open[1] and close[2] < open[2] and close[3] < open[3] and close[4] > open[4] and Body_a > Shadow_a*0.4 and Body_b > Shadow_b*0.4 and Body_c > Shadow_c*0.4
    tasuki_gap_dn= high[2] < low[3] and open[1] <  open[2] and close[1] > high[2] and close[1] < low[3] and close[3] < open[3] and close[2] <  open[2] and (abs(close[3] - open[3]) > 0.5* (high[3] - low[3]) ) and (abs(close[2] - open[2]) > 0.5* (high[2] - low[2])) 
    tasuki_gap_up= low[2] > high[3] and close[1] < open[1] and close[1] < open[2] and close[1] > close[3] and close[2] > open[2] and close[3] > open[3] and (abs(close[3] - open[3]) > 0.5* (high[3] - low[3]) ) and (abs(close[2] - open[2]) > 0.5* (high[2] - low[2])) 
    rising_3_mthd_up = open[1] < close[1] and open[2] > close[2] and open[3] > close[3] and open[4] > close[4] and open[5] < close[5] and close[1] >= open[4]
    falng_3_mthd_dn = open[1] > close[1] and open[2] < close[2] and open[3] < close[3] and open[4] < close[4] and open[5] > close[5] and close[1] <= open[4]
    falling_gap_win_dn=(open[1]<low[2] and high[1]<low[2])
    rising_gap_win_up=(open[1]>high[2] and low[1]>high[2])

    if show_engulfing == true then
        plot_shape(engulfingup, "Bull_Engulfing", eng_call_shape, arrow_size_id, eng_call_color, shape_location.belowbar, -1, "Eng", eng_call_color)
        plot_shape(enfulfingdn, "Bear_Engulfing", eng_put_shape, arrow_size_id, eng_put_color, shape_location.abovebar, -1, "Eng", eng_put_color)
    end
    if (show_hammer == true) then
        plot_shape(is_hammer, "Hammer", hmr_shape, arrow_size_id, hmr_color, shape_location.belowbar, -1, "Hmr", hmr_color)
        plot_shape(is_inverted_hammer, "Inverted Hammer", ihmr_shape, arrow_size_id, ihmr_color, shape_location.belowbar, -1, "Ihmr", ihmr_color)
        plot_shape(is_hangingMan, "Hanging Man", hgm_shape, arrow_size_id, hgm_color, shape_location.abovebar, -1, "Hgm", hgm_color)
        plot_shape(is_shottingStar, "Shotting Star", shtr_shape, arrow_size_id, shtr_color, shape_location.abovebar, -1, "Str", shtr_color)
    end
    if (show_marubozu == true) then
        plot_shape(is_marubozuup, "Marobotu UP", mbup_shape, arrow_size_id, mbup_color, shape_location.belowbar, -1, "Mzu", mbup_color)
        plot_shape(is_marubozudn, "Marubozu Down", mbdn_shape, arrow_size_id, mbdn_color, shape_location.abovebar, -1, "Mzu", mbdn_color)
    end
    if (show_spinningtop == true) then
        plot_shape(is_spinningtop, "BullSpinningtop", spiningup_shape, arrow_size_id, spiningup_color, shape_location.belowbar, -1, "SPT", spiningup_color)
        plot_shape(is_spinningbtn, "BearSpinningtop", spiningdn_shape, arrow_size_id, spiningdn_color, shape_location.abovebar, -1, "SPT", spiningdn_color)
    end
    if (show_tweezer_tb == true) then
        plot_shape(is_tweezertop, "TweezerTop", twezerdn_shape, arrow_size_id, twezerdn_color, shape_location.abovebar, -1, "TWET", twezerdn_color)
        plot_shape(is_tweezerbtm, "TweezerBottom", twezerup_shape, arrow_size_id, twezerup_color, shape_location.belowbar, -1, "TWEB", twezerup_color)
    end
    if (show_darckc == true) then
        plot_shape(is_dark_cloud, "Dark Cloud Cover", dark_shape, arrow_size_id, dark_color, shape_location.abovebar, -1, "DCC", dark_color)
        plot_shape(is_piercing, "Piercing Line", piercing_shape, arrow_size_id, piercing_color, shape_location.belowbar, -1, "PLP", piercing_color)
    end
    if (show_doji == true) then
        plot_shape(is_doji, "Doji", doji_shape, arrow_size_id, doji_color, shape_location.abovebar, -1, "Doji", doji_color)
        plot_shape(is_doji_star, "Doji Star", doji_star_shape, arrow_size_id, doji_star_color, shape_location.abovebar, -1, "D_Star", doji_star_color)
    end
    if (show_grey_drag_doji == true) then
        plot_shape(is_dragonfly_doji, "Dragon Fly Doji", dragon_doji_shape, arrow_size_id, dragon_doji_color, shape_location.belowbar, -1, "DrDji", dragon_doji_color)
        plot_shape(is_gravestone_doji, "Gravestone Doji", grave_doji_shape, arrow_size_id, grave_doji_color, shape_location.abovebar, -1, "GrDoji", grave_doji_color)
    end
    if (show_harami == true) then
        plot_shape(is_bull_harami, "Bull_Harami", bull_harami_shape, arrow_size_id, bull_harami_color, shape_location.belowbar, -1, "HARup", bull_harami_color)
        plot_shape(is_bear_harami, "Bear Harami", bear_harami_shape, arrow_size_id, bear_harami_color, shape_location.abovebar, -1, "HARdn", bear_harami_color)
    end
    if (show_3outside_up_dw == true) then
        plot_shape(is_3outsideup, "3 Outside UP", outsideup_shape, arrow_size_id, outsideup_color, shape_location.belowbar, -1, "3OUP", outsideup_color)
        plot_shape(is_3outsidedw, "3 Outside DOWB", outsidedw_shape, arrow_size_id, outsidedw_color, shape_location.abovebar, -1, "3ODN", outsidedw_color)
    end
    if (show_3inside_up_dw == true) then
        plot_shape(is_3insideup, "3 Inside UP", insideup_shape, arrow_size_id, insideup_color, shape_location.belowbar, -1, "3IUP", insideup_color)
        plot_shape(is_3insidedw, "3 Inside DOWN", insidedw_shape, arrow_size_id, insidedw_color, shape_location.abovebar, -1, "3IDN", insidedw_color)
    end
    if (show_eve_mor_star == true) then
        plot_shape(is_morning_star, "Morning Star", morning_star_shape, arrow_size_id, morning_star_color, shape_location.belowbar, -1, "MRST", morning_star_color)
        plot_shape(is_evening_star, "Evening Star", evening_star_shape, arrow_size_id, evening_star_color, shape_location.abovebar, -1, "EVST", evening_star_color)
    end
    if (show_matching == true) then
        plot_shape(is_bull_matching, "Matching Low", matl_shape, arrow_size_id, matl_color, shape_location.belowbar, -1, "MATL", matl_color)
        plot_shape(is_bear_matching, "Matching High", math_shape, arrow_size_id, math_color, shape_location.abovebar, -1, "MATH", math_color)
    end
    if (show_kicker == true) then
        plot_shape(is_bull_kicker, "Bull Kicker", bullkiker_shape, arrow_size_id, bullkiker_color, shape_location.belowbar, -1, "KIKR", bullkiker_color)
        plot_shape(is_bear_kicker, "Bear Kicker", bearkiker_shape, arrow_size_id, bearkiker_color, shape_location.abovebar, -1, "KIKR", bearkiker_color)
    end
    if (show_3_candles == true) then
        plot_shape(is_3_withe_soldier, "Bull 3 withe soldier", three_w_soldier_shape, arrow_size_id, three_w_soldier_color, shape_location.abovebar, -1, "3WS", three_w_soldier_color)
        plot_shape(is_3_black_cows, "Bear black cows", three_b_cows_shape, arrow_size_id, three_b_cows_color, shape_location.belowbar, -1, "3BC", three_b_cows_color)
    end
    if (show_tasuky_gap == true) then
        plot_shape(tasuki_gap_up, "Bull Tasuki Gap up", tasuki_up_gap_shape, arrow_size_id, tasuki_up_gap_color, shape_location.belowbar, -1, "TSGP", tasuki_up_gap_color)
        plot_shape(tasuki_gap_dn, "Bear Tasuki gap down", tasuki_dn_gap_shape, arrow_size_id, tasuki_dn_gap_color, shape_location.abovebar, -1, "TSGP", tasuki_dn_gap_color)
    end
    if (show_fall_ris_wind == true) then
        plot_shape(rising_gap_win_up, "Rising Window up", rising_window_up_shape, arrow_size_id, rising_window_up_color, shape_location.belowbar, -1, "RGWd", rising_window_up_color)
        plot_shape(falling_gap_win_dn , "Falling Window down", filling_window_dn_shape, arrow_size_id, filling_window_dn_color, shape_location.abovebar, -1, "FGWd", filling_window_dn_color)
    end
    if (show_fall_ris_3mtd == true) then
        plot_shape(rising_3_mthd_up, "Rising 3 Methods up", rising_3_mtd_up_shape, arrow_size_id, rising_3_mtd_up_color, shape_location.belowbar, -1, "R3mt", rising_3_mtd_up_color)
        plot_shape(falng_3_mthd_dn, "Falling 3 Methods down", filling_3_mtd_dn_shape, arrow_size_id, filling_3_mtd_dn_color, shape_location.abovebar, -1, "F3mt", filling_3_mtd_dn_color)
    end

-- Best Candlestick Pattern
-- NAME   |||   ABBREVIATION ON CHART
-- 1 - Bear/Bull  Engulfing    |||  Eng
-- 2 - Dark Cloud Cover   |||  DCC
-- 3 - Piercing line  |||  PLP
-- 4 - Hammer and Inverted Hammer   |||  Hmr and  Ihmr
-- 5 - Hanging Man and Shotting Star   |||  Hgm and Str
-- 6 - Bear/Bull Spinning Top   ||| SPT
-- 7 - Tweezer Top and Tweezer Bottom  |||  TWET and TWEB
-- 8 - Doji   |||  Doji
-- 9 - DragonFly Doji and Gravestone Doji   |||  DrDji  and GrDji
-- 10 - Bear/Bull  Harami   ||| HARdn and HARup
-- 11 - 3 Outside up and 3 Outside down   |||  3OUP and 3ODN
-- 12 - 3 Inside up and 3 Inside down   |||  3IUP and 3IDN
-- 13 - Morning Star and Evening Star   ||| MRST and EVST
-- 14 -  Matching high and Matching low   ||| MATL and MATH
-- 15 - Bear/Bull  Kicker  |||  KIKR
-- 16 - 3 White Soldier and 3 black cows  |||  3WS and 3BC
-- 17 - Bear/Bull  Tasuki Gap   ||| TSGP
-- 18 - Falling/Rising Window   ||| TFWd and FGWd
-- 19 - Falling/Rising 3 Methods  |||  R3mt and F3mt
-- 20 - Doji Star   ||| D_Star
-- 21 - Marubozu ||| Mzu
