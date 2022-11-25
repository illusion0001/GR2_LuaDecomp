dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Mob/mob_event_util.lua")
_sm44_player_shop = {}
_sm44_player_area = true
_sm44_father_name = ""
_sm44_father_shop = {}
_sm44_father_area = true
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  L1_1 = loadFileAsset
  L1_1 = L1_1("nvm", "ed_a_root_custom01")
  if L1_1 ~= nil then
    print("\227\131\138\227\131\147\227\131\161\227\131\131\227\130\183\227\131\165\227\129\130\227\130\138")
    L1_1:wait()
    if Fn_findAreaHandle("ed_a_root") ~= nil then
      Fn_findAreaHandle("ed_a_root"):addNaviMeshAsset(L1_1)
    end
  else
    print("\227\131\138\227\131\147\227\131\161\227\131\131\227\130\183\227\131\165\227\129\170\227\129\151")
  end
  Mob:restrict_sm44_00(true)
end
function Ingame()
  while true do
    wait()
  end
end
function Finalize()
  Mob:restrict_sm44_00(false)
end
function sm44_findGameObject2(A0_2, A1_3)
  return findGameObject2(A0_2, A1_3)
end
function sm44_SetFatherName(A0_4)
  local L1_5
  _sm44_father_name = A0_4
end
function sm44_GetFatherName()
  local L0_6, L1_7
  L0_6 = _sm44_father_name
  return L0_6
end
function sm44_ClearShopInfo()
  local L0_8, L1_9
  _sm44_player_area = true
  _sm44_father_area = true
  L0_8 = {}
  _sm44_player_shop = L0_8
  L0_8 = {}
  _sm44_father_shop = L0_8
end
function sm44_IsPlayerInsideShop()
  local L0_10, L1_11
  L0_10 = _sm44_player_shop
  L0_10 = #L0_10
  L0_10 = L0_10 > 0
  return L0_10
end
function sm44_GetPlayerInsideShop()
  local L0_12, L1_13
  L0_12 = _sm44_player_shop
  return L0_12
end
function sm44_IsPlayerArrivalShop(A0_14)
  return RAC_FindTableValue(_sm44_player_shop, A0_14) ~= nil
end
function sm44_IsFatherArrivalShop(A0_15)
  return RAC_FindTableValue(_sm44_father_shop, A0_15) ~= nil
end
function sm44_IsPlayerArea()
  local L0_16, L1_17
  L0_16 = _sm44_player_area
  return L0_16
end
function sm44_IsFatherArea()
  local L0_18, L1_19
  L0_18 = _sm44_father_area
  return L0_18
end
function pccubesensor2_shop_OnEnter(A0_20)
  local L1_21
  L1_21 = "shop"
  L1_21 = L1_21 .. string.format("%02d", RAC_getTailNumber(A0_20:getName(), 2))
  if RAC_FindTableValue(_sm44_player_shop, L1_21) == nil then
    print("Player_OnEnter.." .. L1_21)
    table.insert(_sm44_player_shop, L1_21)
  end
end
function pccubesensor2_shop_OnLeave(A0_22)
  local L1_23, L2_24
  L1_23 = "shop"
  L2_24 = string
  L2_24 = L2_24.format
  L2_24 = L2_24("%02d", RAC_getTailNumber(A0_22:getName(), 2))
  L1_23 = L1_23 .. L2_24
  L2_24 = RAC_FindTableValue
  L2_24 = L2_24(_sm44_player_shop, L1_23)
  if L2_24 ~= nil then
    print("Player_OnLeave.." .. L1_23)
    table.remove(_sm44_player_shop, L2_24)
  end
end
function cubesensor2_shop_OnEnter(A0_25, A1_26)
  local L2_27
  L2_27 = string
  L2_27 = L2_27.match
  L2_27 = L2_27(A1_26:getName(), _sm44_father_name)
  if L2_27 ~= nil then
    L2_27 = "shop"
    L2_27 = L2_27 .. string.format("%02d", RAC_getTailNumber(A0_25:getName(), 2))
    if RAC_FindTableValue(_sm44_father_shop, L2_27) == nil then
      print("Father_OnEnter.." .. L2_27)
      table.insert(_sm44_father_shop, L2_27)
    end
  end
end
function cubesensor2_shop_OnLeave(A0_28, A1_29)
  local L2_30, L3_31
  L2_30 = string
  L2_30 = L2_30.match
  L3_31 = A1_29.getName
  L3_31 = L3_31(A1_29)
  L2_30 = L2_30(L3_31, _sm44_father_name)
  if L2_30 ~= nil then
    L2_30 = "shop"
    L3_31 = string
    L3_31 = L3_31.format
    L3_31 = L3_31("%02d", RAC_getTailNumber(A0_28:getName(), 2))
    L2_30 = L2_30 .. L3_31
    L3_31 = RAC_FindTableValue
    L3_31 = L3_31(_sm44_father_shop, L2_30)
    if L3_31 ~= nil then
      print("Father_OnLeave.." .. L2_30)
      table.remove(_sm44_father_shop, L3_31)
    end
  end
end
function pccubesensor2_player_area_OnEnter(A0_32)
  local L1_33
  _sm44_player_area = true
end
function pccubesensor2_player_area_OnLeave(A0_34)
  local L1_35
  _sm44_player_area = false
end
function cubesensor2_father_area_OnEnter(A0_36, A1_37)
  if string.match(A1_37:getName(), _sm44_father_name) ~= nil then
    _sm44_father_area = true
  end
end
function cubesensor2_father_area_OnLeave(A0_38, A1_39)
  if string.match(A1_39:getName(), _sm44_father_name) ~= nil then
    _sm44_father_area = false
  end
end
function sm44_startCatWarp(A0_40, A1_41)
  if A0_40 ~= "sm44_c2" then
    RAC_startCatWarpControl("sm44_outrange_warp", "pccubesensor2_out_of_range_01", "pccubesensor2_out_of_range_02", "pccubesensor2_out_of_range_03", "locator2_pc_reset_pos1", A1_41, A1_41, "ep07_05013")
  else
    RAC_endCatWarpControl("sm44_outrange_warp")
  end
end
function sm44_stopCatWarp(A0_42)
  RAC_stopCatWarpControl("sm44_outrange_warp", A0_42)
end
function sm44_isBusyCatWarp()
  return RAC_isBusyCatWarp("sm44_outrange_warp")
end
function sm44_isWarningCatWarp()
  return RAC_isWarningCatWarp("sm44_outrange_warp")
end
