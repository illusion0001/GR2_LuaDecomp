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
_evb_list = {
  "city_block_up_c",
  "city_block_po_a",
  "city_block_lo_a",
  "po_b_object"
}
function createArea()
  local L0_0, L1_1
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.setName
  L1_1(L0_0, "ji_d_root")
  L1_1 = L0_0.setDriftEnable
  L1_1(L0_0, false)
  L1_1 = setAreaRootHandle
  L1_1("jirga", L0_0)
  L1_1 = createGameObject2
  L1_1 = L1_1("Area")
  L1_1:setName("bu_d_root")
  setAreaRootHandle("bungua", L1_1)
  setConnectToLocationParam(L1_1, L0_0, "po_a_01", "bu_b_root_01", true)
  _ship, _wall, _rudder, _lever = createCraneShipJir()
  _ship:setAreaGroup("up", true)
  setAreaRootHandle("ship_jir", _ship)
  setConnectToLocationParam(_ship, L0_0, nil, "ve_crane_root_01", true)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
end
function setAreaDetail()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12
  L0_2 = wireBind
  L1_3 = _cage
  L2_4 = _wire
  L3_5 = _ship
  L4_6 = "wire_nk_01"
  L0_2(L1_3, L2_4, L3_5, L4_6)
  L0_2 = warpShipObject
  L1_3 = _ship
  L2_4 = _cage_base
  L3_5 = _rudder
  L4_6 = _lever
  L0_2(L1_3, L2_4, L3_5, L4_6)
  L0_2 = findGameObject2
  L1_3 = "Area"
  L2_4 = "ar_a_root"
  L0_2 = L0_2(L1_3, L2_4)
  L2_4 = L0_2
  L1_3 = L0_2.setDriftEnable
  L3_5 = false
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.setAreaGroup
  L3_5 = "go"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L2_4 = L0_2
  L1_3 = L0_2.setSceneParameters
  L3_5 = "gm_b_root"
  L1_3(L2_4, L3_5)
  L1_3 = setAreaRootHandle
  L2_4 = "ar"
  L3_5 = L0_2
  L1_3(L2_4, L3_5)
  L1_3 = Fn_getGameObject
  L2_4 = "warShipManager"
  L1_3 = L1_3(L2_4)
  if L1_3 then
    L3_5 = L1_3
    L2_4 = L1_3.sendEvent
    L4_6 = "setWarShip"
    L5_7 = L0_2
    L2_4(L3_5, L4_6, L5_7)
  end
  L2_4 = findGameObject2
  L3_5 = "Area"
  L4_6 = "up_c_root"
  L2_4 = L2_4(L3_5, L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.setDriftParams
  L5_7 = DRIFT_PARAM_HABENA_A
  L3_5(L4_6, L5_7)
  L4_6 = L2_4
  L3_5 = L2_4.setDriftInherit
  L5_7 = true
  L3_5(L4_6, L5_7)
  L4_6 = L2_4
  L3_5 = L2_4.setDriftEnable
  L5_7 = false
  L3_5(L4_6, L5_7)
  L4_6 = L2_4
  L3_5 = L2_4.setAreaGroup
  L5_7 = "up"
  L6_8 = true
  L3_5(L4_6, L5_7, L6_8)
  L4_6 = L2_4
  L3_5 = L2_4.setSceneParameters
  L5_7 = "gm_b_root"
  L3_5(L4_6, L5_7)
  L3_5 = setAreaRootHandle
  L4_6 = "habena"
  L5_7 = L2_4
  L3_5(L4_6, L5_7)
  L3_5 = findGameObject2
  L4_6 = "Area"
  L5_7 = "po_a_root"
  L3_5 = L3_5(L4_6, L5_7)
  L5_7 = L3_5
  L4_6 = L3_5.setDriftParams
  L6_8 = DRIFT_PARAM_JIRGA_A
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.setDriftInherit
  L6_8 = true
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.setDriftEnable
  L6_8 = false
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.setAreaGroup
  L6_8 = "po"
  L7_9 = true
  L4_6(L5_7, L6_8, L7_9)
  L5_7 = L3_5
  L4_6 = L3_5.setSceneParameters
  L6_8 = "gm_b_root"
  L4_6(L5_7, L6_8)
  L4_6 = setAreaRootHandle
  L5_7 = "port"
  L6_8 = L3_5
  L4_6(L5_7, L6_8)
  L4_6 = findGameObject2
  L5_7 = "Area"
  L6_8 = "mi_a_root"
  L4_6 = L4_6(L5_7, L6_8)
  L6_8 = L4_6
  L5_7 = L4_6.setDriftParams
  L7_9 = DRIFT_PARAM_JIRGA_B
  L5_7(L6_8, L7_9)
  L6_8 = L4_6
  L5_7 = L4_6.setDriftInherit
  L7_9 = true
  L5_7(L6_8, L7_9)
  L6_8 = L4_6
  L5_7 = L4_6.setDriftEnable
  L7_9 = false
  L5_7(L6_8, L7_9)
  L6_8 = L4_6
  L5_7 = L4_6.setAreaGroup
  L7_9 = "po"
  L8_10 = true
  L5_7(L6_8, L7_9, L8_10)
  L6_8 = L4_6
  L5_7 = L4_6.setSceneParameters
  L7_9 = "gm_b_root"
  L5_7(L6_8, L7_9)
  L5_7 = setAreaRootHandle
  L6_8 = "minato"
  L7_9 = L4_6
  L5_7(L6_8, L7_9)
  L5_7 = getAreaRootHandle
  L6_8 = "bungua"
  L5_7 = L5_7(L6_8)
  L7_9 = L5_7
  L6_8 = L5_7.setDriftParams
  L8_10 = DRIFT_PARAM_BUNGUA_B
  L6_8(L7_9, L8_10)
  L7_9 = L5_7
  L6_8 = L5_7.setDriftInherit
  L8_10 = true
  L6_8(L7_9, L8_10)
  L7_9 = L5_7
  L6_8 = L5_7.setDriftEnable
  L8_10 = false
  L6_8(L7_9, L8_10)
  L7_9 = L5_7
  L6_8 = L5_7.setAreaGroup
  L8_10 = "po"
  L9_11 = true
  L6_8(L7_9, L8_10, L9_11)
  L7_9 = L5_7
  L6_8 = L5_7.setSceneParameters
  L8_10 = "gm_b_root"
  L6_8(L7_9, L8_10)
  L6_8 = findGameObject2
  L7_9 = "Area"
  L8_10 = "lo_a_root"
  L6_8 = L6_8(L7_9, L8_10)
  L8_10 = L6_8
  L7_9 = L6_8.setDriftParams
  L9_11 = DRIFT_PARAM_ELGONA_A
  L7_9(L8_10, L9_11)
  L8_10 = L6_8
  L7_9 = L6_8.setDriftInherit
  L9_11 = true
  L7_9(L8_10, L9_11)
  L8_10 = L6_8
  L7_9 = L6_8.setDriftEnable
  L9_11 = false
  L7_9(L8_10, L9_11)
  L8_10 = L6_8
  L7_9 = L6_8.setAreaGroup
  L9_11 = "lo"
  L10_12 = true
  L7_9(L8_10, L9_11, L10_12)
  L8_10 = L6_8
  L7_9 = L6_8.setSceneParameters
  L9_11 = "gm_b_root"
  L7_9(L8_10, L9_11)
  L7_9 = setAreaRootHandle
  L8_10 = "elgona"
  L9_11 = L6_8
  L7_9(L8_10, L9_11)
  L7_9 = setDriftParamsSubArea
  L8_10 = L3_5
  L9_11 = DRIFT_SUBAREA_TBL_JIRGA_A
  L10_12 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L7_9(L8_10, L9_11, L10_12)
  L7_9 = setDriftParamsSubArea
  L8_10 = L5_7
  L9_11 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L10_12 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L7_9(L8_10, L9_11, L10_12)
  L7_9 = setDriftParamsSubArea
  L8_10 = L2_4
  L9_11 = DRIFT_SUBAREA_TBL_HABENA_A
  L10_12 = DRIFT_PARAM_SUBAREA_HABENA_A
  L7_9(L8_10, L9_11, L10_12)
  L7_9 = setDriftParamsSubArea
  L8_10 = L6_8
  L9_11 = DRIFT_SUBAREA_TBL_ELGONA_A
  L10_12 = DRIFT_PARAM_SUBAREA_ELGONA_A
  L7_9(L8_10, L9_11, L10_12)
  L7_9 = setDriftParamsUniqueArea
  L8_10 = L3_5
  L9_11 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L7_9(L8_10, L9_11)
  L7_9 = setDriftParamsUniqueArea
  L8_10 = L5_7
  L9_11 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L7_9(L8_10, L9_11)
  L7_9 = setDriftParamsUniqueArea
  L8_10 = L2_4
  L9_11 = DRIFT_UNIQUE_AREA_TBL_HABENA_A
  L7_9(L8_10, L9_11)
  L7_9 = setDriftParamsUniqueArea
  L8_10 = L6_8
  L9_11 = DRIFT_UNIQUE_AREA_TBL_ELGONA_A
  L7_9(L8_10, L9_11)
  L8_10 = L5_7
  L7_9 = L5_7.findSubArea
  L9_11 = "bu_a_02"
  L7_9 = L7_9(L8_10, L9_11)
  if L7_9 then
    L8_10 = createSpecialGimmickBg
    L9_11 = "building_nk_08_01"
    L10_12 = "building_nk_08"
    L8_10(L9_11, L10_12, L7_9)
  end
  L9_11 = L5_7
  L8_10 = L5_7.findSubArea
  L10_12 = "bu_a_15"
  L8_10 = L8_10(L9_11, L10_12)
  if L8_10 then
    L9_11 = createSpecialGimmickBg
    L10_12 = "building_nk_01_01"
    L9_11 = L9_11(L10_12, "building_nk_01", L8_10)
    L10_12 = createGameObject2
    L10_12 = L10_12("GimmickBg")
    L10_12:setName("building_nk_01_fan_01")
    L10_12:setDrawModelName("building_nk_01_fan")
    L10_12:setAttributeName("building_nk_01_fan")
    L10_12:setCollisionName("building_nk_01_fan")
    L9_11:appendChild(L10_12)
    L10_12:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    L10_12:try_init()
    L10_12:waitForReadyAsync(function()
      L10_12:try_start()
    end)
  else
  end
end
