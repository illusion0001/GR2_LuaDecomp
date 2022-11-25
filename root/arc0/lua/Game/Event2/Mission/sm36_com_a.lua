import("Vehicle")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_is_create_box_request = false
_is_create_box_settled = false
_is_box_delete = false
_box_hdl_tbl = {}
_is_create_sdemo_box_request = false
_is_sdemo_box_delete = false
_sdemo_box_hdl_tbl = {}
_is_Restore_shield_request = false
_is_shield_delete = false
_shield_hdl_tbl = {}
_ship_hdl = nil
_pos = nil
_is_request_create_ship = false
_is_request_speed_ship = false
_basespeed = 0
_currspeed = 0
_is_shield_box_created = false
_box_hdl = {}
BOX_GROUP_NUM = 6
BOX_INDIVIDUAL_NUM = {
  4,
  8,
  8,
  7,
  12,
  6
}
function Initialize()
  Mob:restrict_sm36_00(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  while true do
    if L0_0 then
      if L0_0 == nil then
        if L0_0 then
          L11_11 = L2_2(L3_3, L4_4, L5_5)
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[2] = L2_2
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[3] = L3_3
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[4] = L4_4
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[5] = L5_5
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[6] = L6_6
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[7] = L7_7
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[8] = L8_8
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[9] = L9_9
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[10] = L10_10
          ;({
            L1_1,
            [12] = L2_2(L3_3, L4_4, L5_5)
          })[11] = L11_11
          _ship_hdl = L1_1
          L1_1(L2_2, L3_3)
          L1_1(L2_2, L3_3)
          L1_1(L2_2, L3_3)
          _is_request_create_ship = false
        end
      end
    end
    if L0_0 then
      L0_0(L1_1, L2_2)
      L0_0(L1_1, L2_2)
      L11_11 = L2_2(L3_3)
      L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L2_2(L3_3))
      L11_11 = L2_2(L3_3)
      L0_0(L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L2_2(L3_3))
      _is_request_speed_ship = false
    end
    if L0_0 then
      for L6_6, L7_7 in L3_3(L4_4) do
        for L11_11 = 1, L7_7 do
          L1_1[L2_2] = string.format("locator2_box_%01d%02d", L6_6, L11_11)
        end
      end
      for L6_6, L7_7 in L3_3(L4_4) do
        while true do
          if L8_8 == nil then
            L11_11 = "box_"
            L11_11 = L11_11 .. string.format("%02d", L6_6)
            L8_8[L6_6] = L9_9
            L8_8()
          end
        end
      end
      _is_create_box_request = false
    end
    if L0_0 then
      for L6_6 = 1, L0_0 do
        L7_7 = string
        L7_7 = L7_7.format
        L7_7 = L7_7(L8_8, L9_9)
        L1_1[L2_2] = L7_7
      end
      for L6_6, L7_7 in L3_3(L4_4) do
        while true do
          if L8_8 == nil then
            L11_11 = "sdemo_box_"
            L11_11 = L11_11 .. string.format("%02d", L6_6)
            L8_8[L6_6] = L9_9
            L8_8()
          end
        end
      end
      _is_create_sdemo_box_request = false
    end
    if L0_0 then
      for L3_3 = 1, BOX_GROUP_NUM do
        L4_4[L3_3] = L5_5
      end
      for L3_3 = 1, BOX_GROUP_NUM do
        for L7_7 = 1, L5_5[L3_3] do
          L8_8[L7_7] = nil
        end
      end
      L0_0[1] = L1_1
      L0_0[2] = L1_1
      L0_0[3] = L1_1
      L0_0[4] = L1_1
      L0_0[1] = L1_1
      L0_0[2] = L1_1
      L0_0[3] = L1_1
      L0_0[4] = L1_1
      L0_0[5] = L1_1
      L0_0[6] = L1_1
      L0_0[7] = L1_1
      L0_0[8] = L1_1
      L0_0[1] = L1_1
      L0_0[2] = L1_1
      L0_0[3] = L1_1
      L0_0[4] = L1_1
      L0_0[5] = L1_1
      L0_0[6] = L1_1
      L0_0[7] = L1_1
      L0_0[8] = L1_1
      L0_0[1] = L1_1
      L0_0[2] = L1_1
      L0_0[3] = L1_1
      L0_0[4] = L1_1
      L0_0[5] = L1_1
      L0_0[6] = L1_1
      L0_0[7] = L1_1
      L0_0[1] = L1_1
      L0_0[2] = L1_1
      L0_0[3] = L1_1
      L0_0[4] = L1_1
      L0_0[5] = L1_1
      L0_0[6] = L1_1
      L0_0[7] = L1_1
      L0_0[8] = L1_1
      L0_0[9] = L1_1
      L0_0[10] = L1_1
      L0_0[11] = L1_1
      L0_0[12] = L1_1
      L0_0[1] = L1_1
      L0_0[2] = L1_1
      L0_0[3] = L1_1
      L0_0[4] = L1_1
      L0_0[5] = L1_1
      L0_0[6] = L1_1
      _is_shield_box_created = true
      _is_Restore_shield_request = false
    end
    if L0_0 then
      for L3_3 = 1, #L1_1 do
        if L4_4 ~= nil then
          if L4_4 ~= nil then
            L5_5(L6_6)
            L5_5(L6_6)
            L5_5[L3_3] = nil
          else
            L5_5(L6_6)
            L5_5(L6_6)
            L5_5[L3_3] = nil
          end
        end
      end
      _is_box_delete = false
      L0_0(L1_1)
    end
    if L0_0 then
      for L3_3 = 1, #L1_1 do
        if L4_4 ~= nil then
          if L4_4 ~= nil then
            L5_5(L6_6)
            L5_5(L6_6)
            L5_5[L3_3] = nil
          else
            L5_5(L6_6)
            L5_5(L6_6)
            L5_5[L3_3] = nil
          end
        end
      end
      _is_shield_delete = false
      L0_0(L1_1)
    end
    L0_0()
  end
end
function Finalize()
  Mob:restrict_sm36_00(false)
end
function requestCreateBox()
  local L0_12, L1_13
  _is_create_box_request = true
  _is_create_box_settled = true
end
function requestCreatesdemoBox()
  print("\227\129\134\227\129\148\227\129\145\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  _is_create_sdemo_box_request = true
end
function requestBoxHandle()
  local L0_14, L1_15
  L0_14 = _box_hdl_tbl
  return L0_14
end
function requestSdemoBoxHandle()
  local L0_16, L1_17
  L0_16 = _sdemo_box_tbl
  return L0_16
end
function requestShieldHandle()
  local L0_18, L1_19
  L0_18 = _shield_hdl_tbl
  return L0_18
end
function requestBoxDelete()
  local L0_20, L1_21
  _is_box_delete = true
end
function requestsdemoBoxDelete()
  local L0_22, L1_23
  _is_sdemo_box_delete = true
end
function requestShieldDelete()
  local L0_24, L1_25
  _is_shield_delete = true
end
function isCreateBox()
  local L0_26, L1_27
  L0_26 = _is_create_box_settled
  return L0_26
end
function isCreateBoxEnd()
  local L0_28, L1_29
  L0_28 = _is_create_box_request
  return L0_28
end
function isDeleteBoxEnd()
  local L0_30, L1_31
  L0_30 = _is_box_delete
  return L0_30
end
function isDeleteShieldEnd()
  local L0_32, L1_33
  L0_32 = _is_shield_delete
  return L0_32
end
function getShipHandle()
  local L0_34, L1_35
  L0_34 = _ship_hdl
  return L0_34
end
function requestCreateShip(A0_36)
  local L1_37
  _pos = A0_36
  _is_request_create_ship = true
end
function setShipRoute(A0_38)
  local L1_39, L2_40
  L1_39 = nil
  if A0_38 == 0 then
    L2_40 = {
      findGameObject2("Node", "locator2_ship_com_path_01_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_01_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_01_03"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_01_04"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_01_05"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_03"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_04"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_04_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_04_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_05"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_06"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_06_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_07"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_07_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_09"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_09_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_10"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_11"):getWorldPos()
    }
    L1_39 = L2_40
  elseif A0_38 == 1 then
    L2_40 = {
      findGameObject2("Node", "locator2_ship_com_path_02_04"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_04_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_04_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_05"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_06"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_06_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_07"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_07_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_09"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_09_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_10"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_11"):getWorldPos()
    }
    L1_39 = L2_40
  elseif A0_38 == 2 then
    L2_40 = {
      findGameObject2("Node", "locator2_ship_com_path_02_07"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_07_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_08_02"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_09"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_09_01"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_10"):getWorldPos(),
      findGameObject2("Node", "locator2_ship_com_path_02_11"):getWorldPos()
    }
    L1_39 = L2_40
  end
  L2_40 = Vehicle
  L2_40 = L2_40.spawnRoute
  L2_40 = L2_40(L2_40, L1_39, g_own)
  L2_40:setTolerance(5)
  _ship_hdl:try_init()
  L2_40:try_init()
  _ship_hdl:attach(L2_40)
end
function setShipEscape()
  local L0_41, L1_42
  L0_41 = {
    L1_42,
    findGameObject2("Node", "locator2_suspect_escape_ship_path_02"):getWorldPos()
  }
  L1_42 = findGameObject2
  L1_42 = L1_42("Node", "locator2_suspect_escape_ship_path_01")
  L1_42 = L1_42.getWorldPos
  L1_42 = L1_42(L1_42)
  L1_42 = Vehicle
  L1_42 = L1_42.spawnRoute
  L1_42 = L1_42(L1_42, L0_41, g_own)
  L1_42:setTolerance(5)
  _ship_hdl:try_init()
  L1_42:try_init()
  _ship_hdl:attach(L1_42)
end
function setShipSpeed(A0_43, A1_44)
  _is_request_speed_ship = true
  _basespeed = A0_43
  _currspeed = A1_44
  print("base\227\130\185\227\131\148\227\131\188\227\131\137\229\164\137\230\155\180", A0_43)
  print("curr\227\130\185\227\131\148\227\131\188\227\131\137\229\164\137\230\155\180", A1_44)
end
function requestBoxSpawn()
  local L0_45, L1_46
  _is_Restore_shield_request = true
end
function requestResetBox()
  print("-----\231\174\177\227\129\174\227\131\170\227\130\187\227\131\131\227\131\136\227\129\174\230\153\130\233\150\147\227\129\160-----")
  for _FORV_3_ = 1, BOX_GROUP_NUM do
    for _FORV_7_ = 1, BOX_INDIVIDUAL_NUM[_FORV_3_] do
      _box_hdl[_FORV_3_][_FORV_7_]:requestRestoreForce()
    end
  end
end
function isCreatedBox()
  local L0_47, L1_48
  L0_47 = _is_shield_box_created
  return L0_47
end
function setShipCollidable(A0_49)
  _ship_hdl:setCollidable(A0_49)
end
