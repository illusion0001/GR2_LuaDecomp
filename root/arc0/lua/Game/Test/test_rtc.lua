import("Rtc")
function time_call(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5
  L5_5 = print
  L5_5(string.format("time callback = %02d/%02d %02d:%02d:%02d", A0_0, A1_1, A2_2, A3_3, A4_4))
end
function time_call2(A0_6, A1_7, A2_8, A3_9, A4_10)
  print(string.format("time callback2 = %02d/%02d %02d:%02d:%02d", A0_6, A1_7, A2_8, A3_9, A4_10))
  Rtc:clear()
  Rtc:setDailyCallback(daily_call)
end
function daily_call(A0_11, A1_12, A2_13, A3_14)
  print(string.format("daily callback = %02d/%02d %02d:%02d", A0_11, A1_12, A2_13, A3_14))
  Rtc:pushCallback(17, 18, 10, time_call)
  Rtc:pushCallback(17, 18, 10, time_call2)
  Rtc:pushCallback(17, 20, 45, time_call)
end
function main()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21
  L0_15 = Rtc
  L1_16 = L0_15
  L0_15 = L0_15.add
  L2_17.year = 2016
  L2_17.month = 8
  L2_17.day = 30
  L2_17.hour = 11
  L2_17.minute = 15
  L3_18.day = 28
  L0_15 = L0_15(L1_16, L2_17, L3_18)
  L1_16 = print
  L5_20 = L0_15.month
  L6_21 = L0_15.day
  L6_21 = L2_17(L3_18, L4_19, L5_20, L6_21, L0_15.hour, L0_15.minute, L0_15.second)
  L1_16(L2_17, L3_18, L4_19, L5_20, L6_21, L2_17(L3_18, L4_19, L5_20, L6_21, L0_15.hour, L0_15.minute, L0_15.second))
  L1_16 = Rtc
  L1_16 = L1_16.diffMinute
  L3_18.year = 2016
  L3_18.month = 8
  L3_18.day = 30
  L3_18.hour = 11
  L3_18.minute = 15
  L4_19.year = 2016
  L4_19.month = 8
  L4_19.day = 30
  L4_19.hour = 11
  L4_19.minute = 14
  L1_16 = L1_16(L2_17, L3_18, L4_19)
  L2_17(L3_18)
  tbl = L2_17
  for L5_20, L6_21 in L2_17(L3_18) do
    print(L5_20, L6_21)
  end
  L2_17(L3_18, L4_19)
  L2_17(L3_18)
end
