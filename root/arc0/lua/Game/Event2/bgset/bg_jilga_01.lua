dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_jilga_a_param.lua")
dofile("/Game/Event2/bgset/bg_elgona_a_param.lua")
dofile("/Game/Event2/bgset/bg_habena_a_param.lua")
dofile("/Game/Event2/bgset/bg_bungua_a_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Event2/mob_reg.lua")
_picture_list = {
  "sagashi_po_a",
  "sagashi_up_a",
  "sagashi_mi_a",
  "sagashi_lo_a",
  "sagashi_ar_a",
  "sagashi_go_a"
}
_vehicle_list = {
  "vehicle_route_up",
  "vehicle_route_mi",
  "vehicle_route_po",
  "vehicle_route_lo"
}
_evb_list = {
  "outrange_go_a",
  "outrange_up_a",
  "outrange_po_a",
  "outrange_mi_a",
  "outrange_lo_a",
  "city_block_go_a",
  "city_block_ar_a",
  "city_block_up_a",
  "city_block_po_a",
  "city_block_lo_a",
  "po_b_object"
}
_windmill_01 = nil
_windmill_02 = nil
_windmill_fan = nil
_jailcage_01 = {}
_jailcage_02 = {}
_hut = nil
_is_remake_finish = false
function createArea()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = "ji_a_root"
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setDriftEnable
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = setAreaRootHandle
  L2_2 = "jirga"
  L3_3 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = createGameObject2
  L2_2 = "Area"
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.setName
  L2_2(L3_3, "ar_a_root")
  L2_2 = setAreaRootHandle
  L3_3 = "ar"
  L2_2(L3_3, L1_1)
  L2_2 = setConnectToLocationParam
  L3_3 = L1_1
  L2_2(L3_3, L0_0, nil, "ar_a_root", true)
  L2_2 = createGameObject2
  L3_3 = "Area"
  L2_2 = L2_2(L3_3)
  L3_3 = L2_2.setName
  L3_3(L2_2, "go_a_root")
  L3_3 = setAreaRootHandle
  L3_3("go", L2_2)
  L3_3 = setConnectToLocationParam
  L3_3(L2_2, L0_0, nil, "go_a_root", true)
  L3_3 = createGameObject2
  L3_3 = L3_3("Area")
  L3_3:setName("bu_d_root")
  setAreaRootHandle("bungua", L3_3)
  setConnectToLocationParam(L3_3, L0_0, "po_a_01", "bu_b_root_01", true)
  _ship, _wall, _rudder, _lever = createCraneShipJir()
  _ship:setAreaGroup("po", true)
  setAreaRootHandle("ship_jir", _ship)
  setObjectHandle("rudder", _rudder)
  setConnectToLocationParam(_ship, L0_0, "po_a_01", "ve_crane_root_02", true)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
end
function setAreaDetail()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11
  L0_4 = wireBind
  L1_5 = _cage
  L2_6 = _wire
  L3_7 = _ship
  L4_8 = "wire_nk_01"
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4 = warpShipObject
  L1_5 = _ship
  L2_6 = _cage_base
  L3_7 = _rudder
  L4_8 = _lever
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4 = findGameObject2
  L1_5 = "Area"
  L2_6 = "go_a_root"
  L0_4 = L0_4(L1_5, L2_6)
  L2_6 = L0_4
  L1_5 = L0_4.setDriftEnable
  L3_7 = false
  L1_5(L2_6, L3_7)
  L2_6 = L0_4
  L1_5 = L0_4.setAreaGroup
  L3_7 = "go"
  L4_8 = true
  L1_5(L2_6, L3_7, L4_8)
  L1_5 = findGameObject2
  L2_6 = "Area"
  L3_7 = "ar_a_root"
  L1_5 = L1_5(L2_6, L3_7)
  L3_7 = L1_5
  L2_6 = L1_5.setDriftEnable
  L4_8 = false
  L2_6(L3_7, L4_8)
  L3_7 = L1_5
  L2_6 = L1_5.setAreaGroup
  L4_8 = "go"
  L5_9 = true
  L2_6(L3_7, L4_8, L5_9)
  L2_6 = Fn_getGameObject
  L3_7 = "warShipManager"
  L2_6 = L2_6(L3_7)
  if L2_6 then
    L4_8 = L2_6
    L3_7 = L2_6.sendEvent
    L5_9 = "setWarShip"
    L6_10 = L1_5
    L3_7(L4_8, L5_9, L6_10)
  end
  L3_7 = findGameObject2
  L4_8 = "Area"
  L5_9 = "up_a_root"
  L3_7 = L3_7(L4_8, L5_9)
  L5_9 = L3_7
  L4_8 = L3_7.setDriftParams
  L6_10 = DRIFT_PARAM_HABENA_A
  L4_8(L5_9, L6_10)
  L5_9 = L3_7
  L4_8 = L3_7.setDriftInherit
  L6_10 = true
  L4_8(L5_9, L6_10)
  L5_9 = L3_7
  L4_8 = L3_7.setDriftEnable
  L6_10 = false
  L4_8(L5_9, L6_10)
  L5_9 = L3_7
  L4_8 = L3_7.setAreaGroup
  L6_10 = "up"
  L7_11 = true
  L4_8(L5_9, L6_10, L7_11)
  L4_8 = setAreaRootHandle
  L5_9 = "habena"
  L6_10 = L3_7
  L4_8(L5_9, L6_10)
  L4_8 = findGameObject2
  L5_9 = "Area"
  L6_10 = "po_a_root"
  L4_8 = L4_8(L5_9, L6_10)
  L6_10 = L4_8
  L5_9 = L4_8.setDriftParams
  L7_11 = DRIFT_PARAM_JIRGA_A
  L5_9(L6_10, L7_11)
  L6_10 = L4_8
  L5_9 = L4_8.setDriftInherit
  L7_11 = true
  L5_9(L6_10, L7_11)
  L6_10 = L4_8
  L5_9 = L4_8.setDriftEnable
  L7_11 = false
  L5_9(L6_10, L7_11)
  L6_10 = L4_8
  L5_9 = L4_8.setAreaGroup
  L7_11 = "po"
  L5_9(L6_10, L7_11, true)
  L5_9 = setAreaRootHandle
  L6_10 = "port"
  L7_11 = L4_8
  L5_9(L6_10, L7_11)
  L5_9 = findGameObject2
  L6_10 = "Area"
  L7_11 = "mi_a_root"
  L5_9 = L5_9(L6_10, L7_11)
  L7_11 = L5_9
  L6_10 = L5_9.setDriftParams
  L6_10(L7_11, DRIFT_PARAM_JIRGA_B)
  L7_11 = L5_9
  L6_10 = L5_9.setDriftInherit
  L6_10(L7_11, true)
  L7_11 = L5_9
  L6_10 = L5_9.setDriftEnable
  L6_10(L7_11, false)
  L7_11 = L5_9
  L6_10 = L5_9.setAreaGroup
  L6_10(L7_11, "po", true)
  L6_10 = setAreaRootHandle
  L7_11 = "minato"
  L6_10(L7_11, L5_9)
  L6_10 = getAreaRootHandle
  L7_11 = "bungua"
  L6_10 = L6_10(L7_11)
  L7_11 = L6_10.setDriftParams
  L7_11(L6_10, DRIFT_PARAM_BUNGUA_B)
  L7_11 = L6_10.setDriftInherit
  L7_11(L6_10, true)
  L7_11 = L6_10.setDriftEnable
  L7_11(L6_10, false)
  L7_11 = L6_10.setAreaGroup
  L7_11(L6_10, "po", true)
  L7_11 = findGameObject2
  L7_11 = L7_11("Area", "lo_a_root")
  L7_11:setDriftParams(DRIFT_PARAM_ELGONA_A)
  L7_11:setDriftInherit(true)
  L7_11:setDriftEnable(false)
  L7_11:setAreaGroup("lo", true)
  setAreaRootHandle("elgona", L7_11)
  setDriftParamsSubArea(L4_8, DRIFT_SUBAREA_TBL_JIRGA_A, DRIFT_PARAM_SUBAREA_JIRGA_A)
  setDriftParamsSubArea(L6_10, DRIFT_SUBAREA_TBL_BUNGUA_A, DRIFT_PARAM_SUBAREA_BUNGUA_A)
  setDriftParamsSubArea(L3_7, DRIFT_SUBAREA_TBL_HABENA_A, DRIFT_PARAM_SUBAREA_HABENA_A)
  setDriftParamsSubArea(L7_11, DRIFT_SUBAREA_TBL_ELGONA_A, DRIFT_PARAM_SUBAREA_ELGONA_A)
  setDriftParamsUniqueArea(L4_8, DRIFT_UNIQUE_AREA_TBL_JIRGA_A)
  setDriftParamsUniqueArea(L6_10, DRIFT_UNIQUE_AREA_TBL_BUNGUA_A)
  setDriftParamsUniqueArea(L3_7, DRIFT_UNIQUE_AREA_TBL_HABENA_A)
  setDriftParamsUniqueArea(L7_11, DRIFT_UNIQUE_AREA_TBL_ELGONA_A)
  _go_a_01 = L0_4:findSubArea("go_a_01")
  _bu_a_02 = L6_10:findSubArea("bu_a_02")
  _bu_a_15 = L6_10:findSubArea("bu_a_15")
  createSpecialGimmickBgSet()
end
function createSpecialGimmickBgSet()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20
  if L0_12 then
    L0_12(L1_13)
    _windmill_01 = nil
  end
  if L0_12 then
    L0_12(L1_13)
    _windmill_02 = nil
  end
  if L0_12 then
    L0_12(L1_13)
    _windmill_fan = nil
  end
  if L0_12 then
    L0_12(L1_13)
    _hut = nil
  end
  for L3_15, L4_16 in L0_12(L1_13) do
    if L4_16 then
      L6_18 = L4_16
      L5_17 = L4_16.try_term
      L5_17(L6_18)
    end
  end
  for L3_15, L4_16 in L0_12(L1_13) do
    if L4_16 then
      L6_18 = L4_16
      L5_17 = L4_16.try_term
      L5_17(L6_18)
    end
  end
  _jailcage_01 = L0_12
  _jailcage_02 = L0_12
  if L0_12 then
    for L3_15 = 1, 20 do
      L4_16 = "go_jailcage_a_"
      L5_17 = string
      L5_17 = L5_17.format
      L6_18 = "%02d"
      L7_19 = L3_15
      L5_17 = L5_17(L6_18, L7_19)
      L4_16 = L4_16 .. L5_17
      L5_17 = ggd
      L6_18 = "Savedata__BrokenObj__ep10__"
      L7_19 = L4_16
      L6_18 = L6_18 .. L7_19
      L5_17 = L5_17[L6_18]
      L6_18 = nil
      if L5_17 then
        L7_19 = createSpecialGimmickBg
        L8_20 = L4_16
        L7_19 = L7_19(L8_20, "go_jailcage_a", _go_a_01, L5_17)
        L6_18 = L7_19
        L7_19 = table
        L7_19 = L7_19.insert
        L8_20 = _jailcage_01
        L7_19(L8_20, L6_18)
      end
      L7_19 = ggd
      L8_20 = "Savedata__BrokenObj__ep10__"
      L8_20 = L8_20 .. L4_16 .. "_brk"
      L7_19 = L7_19[L8_20]
      if L7_19 then
        L8_20 = createSpecialGimmickBg
        L8_20 = L8_20(L4_16, "go_jailcage_a_brk_md01", _go_a_01, L7_19)
        table.insert(_jailcage_02, L8_20)
        L8_20:setName(L4_16 .. "_brk")
        if GameDatabase:get(L5_17) == false then
          L8_20:setActive(false)
          L6_18:setEventListener("broken", function(A0_21)
            GameDatabase:set(L5_17, true)
            L8_20:setActive(true)
          end)
        else
        end
      else
      end
    end
  end
  if L0_12 then
    if L0_12 then
      L3_15 = "building_nk_08"
      L4_16 = _bu_a_02
      _hut = L1_13
    end
  end
  if L0_12 then
    L3_15 = _bu_a_15
    _windmill_01 = L0_12
    L3_15 = _bu_a_15
    _windmill_02 = L0_12
    L0_12(L1_13, L2_14)
    _windmill_fan = L0_12
    L0_12(L1_13, L2_14)
    L0_12(L1_13, L2_14)
    L0_12(L1_13, L2_14)
    L0_12(L1_13, L2_14)
    L0_12(L1_13, L2_14)
    L3_15 = -0.0135913593654
    L4_16 = 13.5852425172
    L5_17 = 2.15632985057
    L3_15 = XYZRotQuatD
    L4_16 = 0
    L5_17 = 0
    L6_18 = 0
    L8_20 = L3_15(L4_16, L5_17, L6_18)
    L0_12(L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L3_15(L4_16, L5_17, L6_18))
    L0_12(L1_13)
    L0_12(L1_13, L2_14)
    if L0_12 then
      L0_12(L1_13, L2_14)
    else
      L0_12(L1_13, L2_14)
    end
  end
  _is_remake_finish = true
end
function requestBgSet(A0_22)
  if A0_22.windmill_broken ~= nil then
    if A0_22.windmill_broken then
      _windmill_01:setActive(false)
      _windmill_02:setActive(true)
      GameDatabase:set(ggd.Savedata__BrokenObj__ep07__building_nk_01, true)
      debugPrint("\233\162\168\232\187\138\227\130\146\231\160\180\229\163\138")
    else
      _windmill_01:setActive(true)
      _windmill_02:setActive(false)
      GameDatabase:set(ggd.Savedata__BrokenObj__ep07__building_nk_01, false)
      debugPrint("\233\162\168\232\187\138\227\130\146\229\190\169\229\133\131")
    end
  end
  if A0_22.jailcage_restore_force then
    GameDatabase:reset(ggd.Savedata__BrokenObj__ep10)
    for _FORV_4_, _FORV_5_ in ipairs(_jailcage_01) do
      if _FORV_5_ then
        _FORV_5_:requestRestoreForce()
      end
    end
    for _FORV_4_, _FORV_5_ in ipairs(_jailcage_02) do
      if _FORV_5_ then
        _FORV_5_:requestRestoreForce()
        _FORV_5_:setActive(false)
      end
    end
  end
  if A0_22.object_remake then
    _is_remake_finish = false
    invokeSystemTask(createSpecialGimmickBgSet)
  end
end
function getRequestState(A0_23)
  if A0_23.is_remake_finish then
    return _is_remake_finish
  end
  return false
end
