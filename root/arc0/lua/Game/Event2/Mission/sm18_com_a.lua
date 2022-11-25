import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/HeaderCommon.lua")
sm18_pc_area_out1 = false
sm18_pc_area_out2 = false
sm18_pc_area_down = false
sm18_shop_near = nil
sm18_shop_near_enter = {}
sm18_shop_middle = nil
sm18_shop_middle_enter = {}
sm18_ruffian_navi = {}
sm18_box_area_out = {}
function Initialize()
end
function Ingame()
  local L0_0, L1_1
end
function Finalize()
  local L0_2, L1_3
end
function sm18_findGameObject2(A0_4, A1_5)
  return findGameObject2(A0_4, A1_5)
end
function sm18_EnablePlayerSensor(A0_6)
  if A0_6 then
    Fn_pcSensorOn("pccubesensor2_pc_area_01")
  else
    Fn_pcSensorOff("pccubesensor2_pc_area_01")
  end
end
function sm18_IsPlayerAreaOut1()
  local L0_7, L1_8
  L0_7 = sm18_pc_area_out1
  return L0_7
end
function sm18_ResetPlayerAreaOut1()
  local L0_9, L1_10
  sm18_pc_area_out1 = false
end
function sm18_IsPlayerAreaOut2()
  local L0_11, L1_12
  L0_11 = sm18_pc_area_out2
  return L0_11
end
function sm18_ResetPlayerAreaOut2()
  local L0_13, L1_14
  sm18_pc_area_out2 = false
end
function sm18_IsPlayerAreaDown()
  local L0_15, L1_16
  L0_15 = sm18_pc_area_down
  return L0_15
end
function sm18_ResetPlayerAreaDown()
  local L0_17, L1_18
  sm18_pc_area_down = true
end
function sm18_GetShopNearRange()
  local L0_19, L1_20
  L0_19 = sm18_shop_near
  return L0_19
end
function sm18_GetShopMiddleRange()
  local L0_21, L1_22
  L0_21 = sm18_shop_middle
  return L0_21
end
function sm18_ResetShopRange()
  local L0_23, L1_24
  sm18_shop_near = nil
  sm18_shop_middle = nil
end
function sm18_ShopNearEnter(A0_25)
  local L1_26
  L1_26 = sm18_shop_near_enter
  L1_26 = L1_26[A0_25]
  if L1_26 ~= nil then
    L1_26 = sm18_shop_near_enter
    L1_26 = L1_26[A0_25]
    return L1_26
  end
  L1_26 = false
  return L1_26
end
function sm18_ShopMiddleEnter(A0_27)
  local L1_28
  L1_28 = sm18_shop_middle_enter
  L1_28 = L1_28[A0_27]
  if L1_28 ~= nil then
    L1_28 = sm18_shop_middle_enter
    L1_28 = L1_28[A0_27]
    return L1_28
  end
  L1_28 = false
  return L1_28
end
function sm18_IsRuffianNavi(A0_29)
  local L1_30
  L1_30 = sm18_ruffian_navi
  L1_30 = L1_30[A0_29]
  if L1_30 ~= nil then
    L1_30 = sm18_ruffian_navi
    L1_30 = L1_30[A0_29]
    return L1_30
  end
  L1_30 = false
  return L1_30
end
function sm18_ClearRuffianNavi()
  local L0_31, L1_32
  L0_31 = {}
  sm18_ruffian_navi = L0_31
  L0_31 = {}
  sm18_shop_near_enter = L0_31
  L0_31 = {}
  sm18_shop_middle_enter = L0_31
end
function sm18_ResetRuffianNavi(A0_33)
  sm18_ruffian_navi[A0_33] = fasle
end
function sm18_SetRuffianNavi(A0_34)
  sm18_ruffian_navi[A0_34] = true
end
function sm18_EnableBoxSensor(A0_35, A1_36)
  if A1_36 then
    Fn_pcSensorOn("pccubesensor2_" .. A0_35)
  else
    Fn_pcSensorOff("pccubesensor2_" .. A0_35)
  end
end
function sm18_IsBoxAreaOut(A0_37)
  local L1_38
  L1_38 = sm18_box_area_out
  L1_38 = L1_38[A0_37]
  if L1_38 ~= nil then
    L1_38 = sm18_box_area_out
    L1_38 = L1_38[A0_37]
    return L1_38
  end
  L1_38 = false
  return L1_38
end
function sm18_ResetBoxAreaOut(A0_39)
  sm18_box_area_out[A0_39] = false
end
function pccubesensor2_pc_area_01_OnEnter(A0_40)
  local L1_41
  sm18_pc_area_out1 = false
end
function pccubesensor2_pc_area_01_OnLeave(A0_42)
  local L1_43
  sm18_pc_area_out1 = true
end
function pccubesensor2_pc_area_02_OnEnter(A0_44)
  local L1_45
  sm18_pc_area_out2 = false
end
function pccubesensor2_pc_area_02_OnLeave(A0_46)
  local L1_47
  sm18_pc_area_out2 = true
end
function pccubesensor2_pc_area_03_OnEnter(A0_48)
  local L1_49
  sm18_pc_area_down = true
end
function pccubesensor2_pc_area_03_OnLeave(A0_50)
  local L1_51
  sm18_pc_area_down = false
end
function cubesensor2_shop_near_OnEnter(A0_52, A1_53)
  if string.match(A1_53:getName(), "ruffian") ~= nil then
    sm18_shop_near = A1_53:getName()
    sm18_shop_near_enter[sm18_shop_near] = true
  end
end
function cubesensor2_shop_middle_OnEnter(A0_54, A1_55)
  if string.match(A1_55:getName(), "ruffian") ~= nil then
    sm18_shop_middle = A1_55:getName()
    sm18_shop_middle_enter[sm18_shop_middle] = true
  end
end
function cubesensormulti2_ruffian_navi_01_OnEnter(A0_56, A1_57)
  if string.match(A1_57:getName(), "ruffian") ~= nil then
    print("OnEnterRuffianNavi.." .. A1_57:getName())
    sm18_ruffian_navi[A1_57:getName()] = true
  end
end
function pccubesensor2_box_OnEnter(A0_58)
  local L1_59
  L1_59 = RAC_getTailNumber
  L1_59 = L1_59(A0_58:getName(), 2)
  sm18_box_area_out["box" .. string.format("%02d", L1_59)] = false
end
function pccubesensor2_box_OnLeave(A0_60)
  local L1_61
  L1_61 = RAC_getTailNumber
  L1_61 = L1_61(A0_60:getName(), 2)
  sm18_box_area_out["box" .. string.format("%02d", L1_61)] = true
end
