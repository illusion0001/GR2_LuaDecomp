local L1_1
L0_0 = {}
sdateTime = L0_0
L0_0 = sdateTime
function L1_1(A0_2, A1_3, A2_4, A3_5, A4_6)
  local L5_7
  L5_7 = {}
  sdateTime._installMethods(L5_7)
  sdateTime._overloadedOperators(L5_7)
  if "string" == type(A0_2) then
    if "None" == A0_2 then
      L5_7:Invalid()
    elseif 12 == string.len(A0_2) then
      L5_7 = sdateTime.getNowTickTime(tonumber(string.sub(A0_2, 1, 4)), tonumber(string.sub(A0_2, 5, 6)), tonumber(string.sub(A0_2, 7, 8)), tonumber(string.sub(A0_2, 9, 10)), tonumber(string.sub(A0_2, 11, 12)))
    elseif 16 == string.len(A0_2) then
      L5_7 = sdateTime.getNowTickTime(tonumber(string.sub(A0_2, 1, 4)), tonumber(string.sub(A0_2, 6, 7)), tonumber(string.sub(A0_2, 9, 10)), tonumber(string.sub(A0_2, 12, 13)), tonumber(string.sub(A0_2, 15, 16)))
    else
      L5_7:Invalid()
    end
  elseif "number" == type(A0_2) then
    L5_7.date = string.format("%04d%02d%02d%02d%02d", A0_2, A1_3, A2_4, A3_5, A4_6)
  else
    L5_7.date = string.format("%04d%02d%02d%02d%02d", Rtc:localtime().year, Rtc:localtime().month, Rtc:localtime().day, Rtc:localtime().hour, Rtc:localtime().minute)
  end
  return L5_7
end
L0_0.getNowTickTime = L1_1
L0_0 = sdateTime
function L1_1(A0_8)
  if not sdateTime._isValid(A0_8) then
    return nil
  end
  if A0_8.date == "None" or not A0_8.date then
    return false
  end
  return true
end
L0_0.getEnable = L1_1
L0_0 = sdateTime
function L1_1(A0_9)
  if not sdateTime._isValid(A0_9) then
    return nil
  end
  A0_9.date = "None"
end
L0_0.Invalid = L1_1
L0_0 = sdateTime
function L1_1(A0_10)
  local L1_11
  L1_11 = sdateTime
  L1_11 = L1_11._isValid
  L1_11 = L1_11(A0_10)
  if not L1_11 then
    L1_11 = nil
    return L1_11
  end
  L1_11 = A0_10.date
  return tonumber(string.sub(L1_11, 1, 4)), tonumber(string.sub(L1_11, 5, 6)), tonumber(string.sub(L1_11, 7, 8)), tonumber(string.sub(L1_11, 9, 10)), tonumber(string.sub(L1_11, 11, 12))
end
L0_0.split = L1_1
L0_0 = sdateTime
function L1_1(A0_12)
  if not sdateTime._isValid(A0_12) then
    return nil
  end
  if A0_12:getEnable() then
    return A0_12.date
  else
    return "None"
  end
end
L0_0.getString = L1_1
L0_0 = sdateTime
function L1_1(A0_13)
  if not sdateTime._isValid(A0_13) then
    return nil
  end
  if A0_13:getEnable() then
    return string.format("%04d/%02d/%02d/%02d:%02d", A0_13:split())
  else
    return "None"
  end
end
L0_0.getOutputText = L1_1
L0_0 = sdateTime
function L1_1(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27
  L3_17 = sdateTime
  L3_17 = L3_17._isValid
  L4_18 = A0_14
  L3_17 = L3_17(L4_18)
  if not L3_17 then
    L3_17 = nil
    return L3_17
  end
  L4_18 = A0_14
  L3_17 = A0_14.split
  L7_21 = L3_17(L4_18)
  L9_23 = A1_15
  L8_22 = A1_15.split
  L12_26 = L8_22(L9_23)
  L13_27 = L3_17 - L8_22
  if L13_27 > 5 then
    L3_17 = L8_22 + 5
  end
  L13_27 = Rtc
  L13_27 = L13_27.diffMinute
  L13_27 = L13_27(L13_27, {
    year = L8_22,
    month = L9_23,
    day = L10_24,
    hour = L11_25,
    minute = L12_26
  }, {
    year = L3_17,
    month = L4_18,
    day = L5_19,
    hour = L6_20,
    minute = L7_21
  })
  L13_27 = math.max(L13_27, 0)
  return L13_27 / A2_16
end
L0_0.getCycle = L1_1
function L0_0(A0_28, A1_29)
  if not sdateTime._isValid(A0_28) or not A0_28:getEnable() then
    return nil
  end
  if not sdateTime._isValid(A1_29) or not A1_29:getEnable() then
    return nil
  end
  return sdateTime.getNowTickTime(Rtc:add({
    year = A0_28:split()
  }, {
    year = A1_29:split()
  }).year, Rtc:add({
    year = A0_28:split()
  }, {
    year = A1_29:split()
  }).month, Rtc:add({
    year = A0_28:split()
  }, {
    year = A1_29:split()
  }).day, Rtc:add({
    year = A0_28:split()
  }, {
    year = A1_29:split()
  }).hour, Rtc:add({
    year = A0_28:split()
  }, {
    year = A1_29:split()
  }).minute)
end
addSdateTime = L0_0
function L0_0(A0_30, A1_31)
  return A0_30.date == A1_31.date
end
eqSdateTime = L0_0
function L0_0(A0_32, A1_33)
  local L2_34
  L2_34 = A1_33.date
  L2_34 = L2_34 - A0_32.date
  L2_34 = L2_34 > 0
  return L2_34
end
ltSdateTime = L0_0
function L0_0(A0_35, A1_36)
  local L2_37
  L2_37 = A1_36.date
  L2_37 = L2_37 - A0_35.date
  L2_37 = L2_37 >= 0
  return L2_37
end
leSdateTime = L0_0
function L0_0(A0_38, A1_39)
  if not sdateTime._isValid(A0_38) or not A0_38:getEnable() then
    return nil
  end
  if not A1_39 then
    return nil
  end
  return sdateTime.getNowTickTime(Rtc:add({
    year = A0_38:split()
  }, {
    year = A1_39.year or 0,
    month = A1_39.month or 0,
    day = A1_39.day or 0,
    hour = A1_39.hour or 0,
    minute = A1_39.minute or 0
  }).year, Rtc:add({
    year = A0_38:split()
  }, {
    year = A1_39.year or 0,
    month = A1_39.month or 0,
    day = A1_39.day or 0,
    hour = A1_39.hour or 0,
    minute = A1_39.minute or 0
  }).month, Rtc:add({
    year = A0_38:split()
  }, {
    year = A1_39.year or 0,
    month = A1_39.month or 0,
    day = A1_39.day or 0,
    hour = A1_39.hour or 0,
    minute = A1_39.minute or 0
  }).day, Rtc:add({
    year = A0_38:split()
  }, {
    year = A1_39.year or 0,
    month = A1_39.month or 0,
    day = A1_39.day or 0,
    hour = A1_39.hour or 0,
    minute = A1_39.minute or 0
  }).hour, Rtc:add({
    year = A0_38:split()
  }, {
    year = A1_39.year or 0,
    month = A1_39.month or 0,
    day = A1_39.day or 0,
    hour = A1_39.hour or 0,
    minute = A1_39.minute or 0
  }).minute)
end
ItAddsAValueToTheSdatatime = L0_0
L0_0 = sdateTime
function L1_1(A0_40)
  local L1_41
  L1_41 = {}
  L1_41.__add = addSdateTime
  L1_41.__eq = eqSdateTime
  L1_41.__lt = ltSdateTime
  L1_41.__le = leSdateTime
  setmetatable(A0_40, L1_41)
end
L0_0._overloadedOperators = L1_1
L0_0 = sdateTime
function L1_1(A0_42)
  local L1_43
  if A0_42 == nil then
    L1_43 = false
    return L1_43
  end
  L1_43 = true
  return L1_43
end
L0_0._isValid = L1_1
L0_0 = sdateTime
function L1_1(A0_44)
  local L1_45, L2_46, L3_47, L4_48, L5_49
  for L4_48, L5_49 in L1_45(L2_46) do
    if type(L5_49) == "function" then
      A0_44[L4_48] = L5_49
    end
  end
end
L0_0._installMethods = L1_1
