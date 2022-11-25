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
  "city_block_up_b",
  "city_block_po_a",
  "city_block_lo_a",
  "po_b_object"
}
function createArea()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = "ji_c_root"
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
  L2_2(L3_3, "bu_d_root")
  L2_2 = setAreaRootHandle
  L3_3 = "bungua"
  L2_2(L3_3, L1_1)
  L2_2 = setConnectToLocationParam
  L3_3 = L1_1
  L2_2(L3_3, L0_0, "po_a_01", "bu_b_root_01", true)
  L2_2 = createCraneShipJir
  _rudder, _lever, L2_2 = L0_0, "po_a_01", L2_2()
  _rudder, _lever, L3_3 = L0_0, "po_a_01", L2_2()
  _wall = L3_3
  _ship = L2_2
  L2_2 = _ship
  L3_3 = L2_2
  L2_2 = L2_2.setAreaGroup
  L2_2(L3_3, "po", true)
  L2_2 = setAreaRootHandle
  L3_3 = "ship_jir"
  L2_2(L3_3, _ship)
  L2_2 = setConnectToLocationParam
  L3_3 = _ship
  L2_2(L3_3, L0_0, nil, "ve_crane_root", true)
  L2_2 = createCraneCage
  _wire, L2_2 = L0_0, L2_2()
  _wire, L3_3 = L0_0, L2_2()
  _cage = L3_3
  _cage_base = L2_2
  L2_2 = _ship
  L3_3 = L2_2
  L2_2 = L2_2.appendChild
  L2_2(L3_3, _cage_base)
  L2_2 = Fn_getGameObject
  L3_3 = "craneShipManager"
  L2_2 = L2_2(L3_3)
  if L2_2 then
    L3_3 = L2_2.sendEvent
    L3_3(L2_2, "setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
  L3_3 = createGameObject2
  L3_3 = L3_3("Area")
  L3_3:setName("ve_lo_a")
  setAreaRootHandle("ve_lo_a", L3_3)
  setConnectToLocationParam(L3_3, L0_0, nil, "ve_lo_a", true)
end
function setAreaDetail()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18
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
  L2_6 = "ar_a_root"
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
  L2_6 = L0_4
  L1_5 = L0_4.setSceneParameters
  L3_7 = "gm_b_root"
  L1_5(L2_6, L3_7)
  L1_5 = setAreaRootHandle
  L2_6 = "ar"
  L3_7 = L0_4
  L1_5(L2_6, L3_7)
  L1_5 = Fn_getGameObject
  L2_6 = "warShipManager"
  L1_5 = L1_5(L2_6)
  if L1_5 then
    L3_7 = L1_5
    L2_6 = L1_5.sendEvent
    L4_8 = "setWarShip"
    L5_9 = L0_4
    L2_6(L3_7, L4_8, L5_9)
  end
  L2_6 = findGameObject2
  L3_7 = "Area"
  L4_8 = "up_b_root"
  L2_6 = L2_6(L3_7, L4_8)
  L4_8 = L2_6
  L3_7 = L2_6.setDriftParams
  L5_9 = DRIFT_PARAM_HABENA_A
  L3_7(L4_8, L5_9)
  L4_8 = L2_6
  L3_7 = L2_6.setDriftInherit
  L5_9 = true
  L3_7(L4_8, L5_9)
  L4_8 = L2_6
  L3_7 = L2_6.setDriftEnable
  L5_9 = false
  L3_7(L4_8, L5_9)
  L4_8 = L2_6
  L3_7 = L2_6.setAreaGroup
  L5_9 = "up"
  L6_10 = true
  L3_7(L4_8, L5_9, L6_10)
  L4_8 = L2_6
  L3_7 = L2_6.setSceneParameters
  L5_9 = "gm_b_root"
  L3_7(L4_8, L5_9)
  L3_7 = setAreaRootHandle
  L4_8 = "habena"
  L5_9 = L2_6
  L3_7(L4_8, L5_9)
  L3_7 = findGameObject2
  L4_8 = "Area"
  L5_9 = "up_a_12a"
  L3_7 = L3_7(L4_8, L5_9)
  L5_9 = L3_7
  L4_8 = L3_7.setDriftEnable
  L6_10 = false
  L4_8(L5_9, L6_10)
  L4_8 = findGameObject2
  L5_9 = "Area"
  L6_10 = "up_a_12b"
  L4_8 = L4_8(L5_9, L6_10)
  L6_10 = L4_8
  L5_9 = L4_8.setDriftEnable
  L7_11 = false
  L5_9(L6_10, L7_11)
  L5_9 = findGameObject2
  L6_10 = "Area"
  L7_11 = "up_a_02_01"
  L5_9 = L5_9(L6_10, L7_11)
  L7_11 = L5_9
  L6_10 = L5_9.setDriftEnable
  L8_12 = false
  L6_10(L7_11, L8_12)
  L6_10 = findGameObject2
  L7_11 = "Area"
  L8_12 = "po_a_root"
  L6_10 = L6_10(L7_11, L8_12)
  L8_12 = L6_10
  L7_11 = L6_10.setDriftParams
  L9_13 = DRIFT_PARAM_JIRGA_A
  L7_11(L8_12, L9_13)
  L8_12 = L6_10
  L7_11 = L6_10.setDriftInherit
  L9_13 = true
  L7_11(L8_12, L9_13)
  L8_12 = L6_10
  L7_11 = L6_10.setDriftEnable
  L9_13 = false
  L7_11(L8_12, L9_13)
  L8_12 = L6_10
  L7_11 = L6_10.setAreaGroup
  L9_13 = "po"
  L10_14 = true
  L7_11(L8_12, L9_13, L10_14)
  L8_12 = L6_10
  L7_11 = L6_10.setSceneParameters
  L9_13 = "gm_b_root"
  L7_11(L8_12, L9_13)
  L7_11 = setAreaRootHandle
  L8_12 = "port"
  L9_13 = L6_10
  L7_11(L8_12, L9_13)
  L7_11 = findGameObject2
  L8_12 = "Area"
  L9_13 = "mi_a_root"
  L7_11 = L7_11(L8_12, L9_13)
  L9_13 = L7_11
  L8_12 = L7_11.setDriftParams
  L10_14 = DRIFT_PARAM_JIRGA_B
  L8_12(L9_13, L10_14)
  L9_13 = L7_11
  L8_12 = L7_11.setDriftInherit
  L10_14 = true
  L8_12(L9_13, L10_14)
  L9_13 = L7_11
  L8_12 = L7_11.setDriftEnable
  L10_14 = false
  L8_12(L9_13, L10_14)
  L9_13 = L7_11
  L8_12 = L7_11.setAreaGroup
  L10_14 = "po"
  L11_15 = true
  L8_12(L9_13, L10_14, L11_15)
  L9_13 = L7_11
  L8_12 = L7_11.setSceneParameters
  L10_14 = "gm_b_root"
  L8_12(L9_13, L10_14)
  L8_12 = setAreaRootHandle
  L9_13 = "minato"
  L10_14 = L7_11
  L8_12(L9_13, L10_14)
  L8_12 = getAreaRootHandle
  L9_13 = "bungua"
  L8_12 = L8_12(L9_13)
  L10_14 = L8_12
  L9_13 = L8_12.setDriftParams
  L11_15 = DRIFT_PARAM_BUNGUA_B
  L9_13(L10_14, L11_15)
  L10_14 = L8_12
  L9_13 = L8_12.setDriftInherit
  L11_15 = true
  L9_13(L10_14, L11_15)
  L10_14 = L8_12
  L9_13 = L8_12.setDriftEnable
  L11_15 = false
  L9_13(L10_14, L11_15)
  L10_14 = L8_12
  L9_13 = L8_12.setAreaGroup
  L11_15 = "po"
  L12_16 = true
  L9_13(L10_14, L11_15, L12_16)
  L10_14 = L8_12
  L9_13 = L8_12.setSceneParameters
  L11_15 = "gm_b_root"
  L9_13(L10_14, L11_15)
  L9_13 = findGameObject2
  L10_14 = "Area"
  L11_15 = "lo_a_root"
  L9_13 = L9_13(L10_14, L11_15)
  L11_15 = L9_13
  L10_14 = L9_13.setDriftParams
  L12_16 = DRIFT_PARAM_ELGONA_A
  L10_14(L11_15, L12_16)
  L11_15 = L9_13
  L10_14 = L9_13.setDriftInherit
  L12_16 = true
  L10_14(L11_15, L12_16)
  L11_15 = L9_13
  L10_14 = L9_13.setDriftEnable
  L12_16 = false
  L10_14(L11_15, L12_16)
  L11_15 = L9_13
  L10_14 = L9_13.setAreaGroup
  L12_16 = "lo"
  L13_17 = true
  L10_14(L11_15, L12_16, L13_17)
  L11_15 = L9_13
  L10_14 = L9_13.setSceneParameters
  L12_16 = "gm_b_root"
  L10_14(L11_15, L12_16)
  L10_14 = setAreaRootHandle
  L11_15 = "elgona"
  L12_16 = L9_13
  L10_14(L11_15, L12_16)
  L10_14 = setDriftParamsSubArea
  L11_15 = L6_10
  L12_16 = DRIFT_SUBAREA_TBL_JIRGA_A
  L13_17 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L10_14(L11_15, L12_16, L13_17)
  L10_14 = setDriftParamsSubArea
  L11_15 = L8_12
  L12_16 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L13_17 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L10_14(L11_15, L12_16, L13_17)
  L10_14 = setDriftParamsSubArea
  L11_15 = L2_6
  L12_16 = DRIFT_SUBAREA_TBL_HABENA_A
  L13_17 = DRIFT_PARAM_SUBAREA_HABENA_A
  L10_14(L11_15, L12_16, L13_17)
  L10_14 = setDriftParamsSubArea
  L11_15 = L9_13
  L12_16 = DRIFT_SUBAREA_TBL_ELGONA_A
  L13_17 = DRIFT_PARAM_SUBAREA_ELGONA_A
  L10_14(L11_15, L12_16, L13_17)
  L10_14 = setDriftParamsUniqueArea
  L11_15 = L6_10
  L12_16 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L10_14(L11_15, L12_16)
  L10_14 = setDriftParamsUniqueArea
  L11_15 = L8_12
  L12_16 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L10_14(L11_15, L12_16)
  L10_14 = setDriftParamsUniqueArea
  L11_15 = L2_6
  L12_16 = DRIFT_UNIQUE_AREA_TBL_HABENA_A
  L10_14(L11_15, L12_16)
  L10_14 = setDriftParamsUniqueArea
  L11_15 = L9_13
  L12_16 = DRIFT_UNIQUE_AREA_TBL_ELGONA_A
  L10_14(L11_15, L12_16)
  L10_14 = findGameObject2
  L11_15 = "Area"
  L12_16 = "ve_lo_a"
  L10_14 = L10_14(L11_15, L12_16)
  L12_16 = L10_14
  L11_15 = L10_14.setDriftEnable
  L13_17 = false
  L11_15(L12_16, L13_17)
  L12_16 = L8_12
  L11_15 = L8_12.findSubArea
  L13_17 = "bu_a_02"
  L11_15 = L11_15(L12_16, L13_17)
  if L11_15 then
    L12_16 = createSpecialGimmickBg
    L13_17 = "building_nk_08_01"
    L14_18 = "building_nk_08"
    L12_16(L13_17, L14_18, L11_15)
  end
  L13_17 = L8_12
  L12_16 = L8_12.findSubArea
  L14_18 = "bu_a_15"
  L12_16 = L12_16(L13_17, L14_18)
  if L12_16 then
    L13_17 = createSpecialGimmickBg
    L14_18 = "building_nk_01_01"
    L13_17 = L13_17(L14_18, "building_nk_01", L12_16)
    L14_18 = createGameObject2
    L14_18 = L14_18("GimmickBg")
    L14_18:setName("building_nk_01_fan_01")
    L14_18:setDrawModelName("building_nk_01_fan")
    L14_18:setAttributeName("building_nk_01_fan")
    L14_18:setCollisionName("building_nk_01_fan")
    L13_17:appendChild(L14_18)
    L14_18:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    L14_18:try_init()
    L14_18:waitForReadyAsync(function()
      L14_18:try_start()
    end)
  else
  end
end
