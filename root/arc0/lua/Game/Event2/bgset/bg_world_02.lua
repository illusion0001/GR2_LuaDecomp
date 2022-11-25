dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_jilga_a_param.lua")
dofile("/Game/Event2/bgset/bg_elgona_a_param.lua")
dofile("/Game/Event2/bgset/bg_habena_a_param.lua")
dofile("/Game/Event2/bgset/bg_bungua_a_param.lua")
dofile("/Game/Event2/bgset/bg_dolwa_hiraleon_a_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Event2/mob_reg.lua")
_picture_list = {
  "sagashi_po_a",
  "sagashi_up_a",
  "sagashi_mi_a",
  "sagashi_lo_a",
  "sagashi_ar_a",
  "sagashi_cc_a",
  "sagashi_dt_a",
  "sagashi_id_a",
  "sagashi_ed_a"
}
_evb_list = {
  "city_block_ar_a",
  "city_block_up_a",
  "city_block_po_a",
  "city_block_lo_a",
  "city_block_hx_a",
  "po_b_object"
}
_farniture_file_name = "farniture_placement"
function createArea()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = "world_a_root"
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setDriftEnable
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = setAreaRootHandle
  L2_2 = "world"
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
  L2_2(L3_3, L0_0, "ji_a_root", "ar_a_root", true)
  L2_2 = createGameObject2
  L3_3 = "Area"
  L2_2 = L2_2(L3_3)
  L3_3 = L2_2.setName
  L3_3(L2_2, "bu_d_root")
  L3_3 = setAreaRootHandle
  L3_3("bungua", L2_2)
  L3_3 = setConnectToLocationParam
  L3_3(L2_2, L0_0, "po_a_01", "bu_b_root_01", true)
  L3_3 = createCraneShipJir
  _wall_a, _rudder_a, _lever_a, L3_3 = L2_2, L0_0, "po_a_01", L3_3()
  _ship_a = L3_3
  L3_3 = _ship_a
  L3_3 = L3_3.setAreaGroup
  L3_3(L3_3, "po", true)
  L3_3 = setAreaRootHandle
  L3_3("ship_jir", _ship_a)
  L3_3 = setConnectToLocationParam
  L3_3(_ship_a, L0_0, "po_a_01", "ve_crane_root_02", true)
  L3_3 = createCraneCage
  _cage_a, _wire_a, L3_3 = _ship_a, L0_0, L3_3()
  _cage_base_a = L3_3
  L3_3 = _ship_a
  L3_3 = L3_3.appendChild
  L3_3(L3_3, _cage_base_a)
  L3_3 = createCraneShipHex
  _wall_b, _rudder_b, _lever_b, L3_3 = L3_3, _cage_base_a, "po_a_01", L3_3()
  _ship_b = L3_3
  L3_3 = _ship_b
  L3_3 = L3_3.setAreaGroup
  L3_3(L3_3, "dt", true)
  L3_3 = setAreaRootHandle
  L3_3("ship_hex", _ship_b)
  L3_3 = setConnectToLocationParam
  L3_3(_ship_b, L0_0, "g1_base_dt_f2_road", "ve_crane_root_dt_01", true)
  L3_3 = createCraneCage
  _cage_b, _wire_b, L3_3 = _ship_b, L0_0, L3_3()
  _cage_base_b = L3_3
  L3_3 = _ship_b
  L3_3 = L3_3.appendChild
  L3_3(L3_3, _cage_base_b)
  L3_3 = {
    {
      area = "cc_a_root",
      node = "g1_base_cc_sign_01",
      name = "g1_base_cc_sign_af"
    },
    {
      area = "g1_base_dt_f1_road_01",
      node = "g1_building_kw_01_01",
      name = "g1_base_dt_f1_clocktower",
      lod = "g1_base_dt_f1_clocktower_low",
      ofs_y = 80
    }
  }
  _placement_ctrl:setAreaRegularBg(L3_3)
end
function setAreaDetail()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26
  L0_4 = wireBind
  L1_5 = _cage_a
  L2_6 = _wire_a
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4 = wireBind
  L1_5 = _cage_b
  L2_6 = _wire_b
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4 = warpShipObject
  L1_5 = _ship_a
  L2_6 = _cage_base_a
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4 = warpShipObject
  L1_5 = _ship_b
  L2_6 = _cage_base_b
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4 = getAreaRootHandle
  L1_5 = "world"
  L0_4 = L0_4(L1_5)
  L2_6 = L0_4
  L1_5 = L0_4.findSubArea
  L1_5 = L1_5(L2_6, L3_7)
  L2_6 = L1_5.setDriftEnable
  L2_6(L3_7, L4_8)
  L2_6 = L1_5.getChildren
  L2_6 = L2_6(L3_7)
  for L6_10, L7_11 in L3_7(L4_8) do
    L8_12 = L7_11.setDriftEnable
    L8_12(L9_13, L10_14)
    L8_12 = L7_11.getChildren
    L8_12 = L8_12(L9_13)
    for L12_16, L13_17 in L9_13(L10_14) do
      L15_19 = L13_17
      L14_18 = L13_17.setDriftEnable
      L16_20 = false
      L14_18(L15_19, L16_20)
    end
  end
  L6_10 = "ed_a_root"
  L6_10 = "Area"
  L7_11 = "dt_a_root"
  L6_10 = findGameObject2
  L7_11 = "Area"
  L8_12 = "id_a_root"
  L6_10 = L6_10(L7_11, L8_12)
  L7_11 = findGameObject2
  L8_12 = "Area"
  L7_11 = L7_11(L8_12, L9_13)
  L8_12 = findGameObject2
  L8_12 = L8_12(L9_13, L10_14)
  L12_16 = "id_a_01"
  L12_16 = L3_7
  L13_17 = "cc"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L4_8
  L13_17 = "ed"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L5_9
  L13_17 = "dt"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L6_10
  L13_17 = "id"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L7_11
  L13_17 = "cc"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L8_12
  L13_17 = "ed"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L9_13
  L13_17 = "dt"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L10_14
  L13_17 = "id"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = L5_9
  L13_17 = "dt_electricity_root"
  L11_15(L12_16, L13_17)
  L12_16 = "Area"
  L13_17 = "ji_a_root"
  L13_17 = L11_15
  L12_16 = L11_15.setDriftEnable
  L14_18 = false
  L12_16(L13_17, L14_18)
  L12_16 = setAreaRootHandle
  L13_17 = "jirga"
  L14_18 = L11_15
  L12_16(L13_17, L14_18)
  L12_16 = findGameObject2
  L13_17 = "Area"
  L14_18 = "ar_a_root"
  L12_16 = L12_16(L13_17, L14_18)
  L14_18 = L12_16
  L13_17 = L12_16.setDriftEnable
  L15_19 = false
  L13_17(L14_18, L15_19)
  L14_18 = L12_16
  L13_17 = L12_16.setAreaGroup
  L15_19 = "go"
  L16_20 = true
  L13_17(L14_18, L15_19, L16_20)
  L13_17 = Fn_getGameObject
  L14_18 = "warShipManager"
  L13_17 = L13_17(L14_18)
  if L13_17 then
    L15_19 = L13_17
    L14_18 = L13_17.sendEvent
    L16_20 = "setWarShip"
    L17_21 = L12_16
    L14_18(L15_19, L16_20, L17_21)
  end
  L14_18 = findGameObject2
  L15_19 = "Area"
  L16_20 = "up_a_root"
  L14_18 = L14_18(L15_19, L16_20)
  L16_20 = L14_18
  L15_19 = L14_18.setDriftParams
  L17_21 = DRIFT_PARAM_HABENA_A
  L15_19(L16_20, L17_21)
  L16_20 = L14_18
  L15_19 = L14_18.setDriftInherit
  L17_21 = true
  L15_19(L16_20, L17_21)
  L16_20 = L14_18
  L15_19 = L14_18.setDriftEnable
  L17_21 = false
  L15_19(L16_20, L17_21)
  L16_20 = L14_18
  L15_19 = L14_18.setAreaGroup
  L17_21 = "up"
  L18_22 = true
  L15_19(L16_20, L17_21, L18_22)
  L15_19 = setAreaRootHandle
  L16_20 = "up"
  L17_21 = L14_18
  L15_19(L16_20, L17_21)
  L15_19 = findGameObject2
  L16_20 = "Area"
  L17_21 = "po_a_root"
  L15_19 = L15_19(L16_20, L17_21)
  L17_21 = L15_19
  L16_20 = L15_19.setDriftParams
  L18_22 = DRIFT_PARAM_JIRGA_A
  L16_20(L17_21, L18_22)
  L17_21 = L15_19
  L16_20 = L15_19.setDriftInherit
  L18_22 = true
  L16_20(L17_21, L18_22)
  L17_21 = L15_19
  L16_20 = L15_19.setDriftEnable
  L18_22 = false
  L16_20(L17_21, L18_22)
  L17_21 = L15_19
  L16_20 = L15_19.setAreaGroup
  L18_22 = "po"
  L19_23 = true
  L16_20(L17_21, L18_22, L19_23)
  L16_20 = setAreaRootHandle
  L17_21 = "port"
  L18_22 = L15_19
  L16_20(L17_21, L18_22)
  L16_20 = findGameObject2
  L17_21 = "Area"
  L18_22 = "mi_a_root"
  L16_20 = L16_20(L17_21, L18_22)
  L18_22 = L16_20
  L17_21 = L16_20.setDriftParams
  L19_23 = DRIFT_PARAM_JIRGA_A
  L17_21(L18_22, L19_23)
  L18_22 = L16_20
  L17_21 = L16_20.setDriftInherit
  L19_23 = true
  L17_21(L18_22, L19_23)
  L18_22 = L16_20
  L17_21 = L16_20.setDriftEnable
  L19_23 = false
  L17_21(L18_22, L19_23)
  L18_22 = L16_20
  L17_21 = L16_20.setAreaGroup
  L19_23 = "po"
  L20_24 = true
  L17_21(L18_22, L19_23, L20_24)
  L17_21 = setAreaRootHandle
  L18_22 = "port_b"
  L19_23 = L16_20
  L17_21(L18_22, L19_23)
  L17_21 = findGameObject2
  L18_22 = "Area"
  L19_23 = "lo_a_root"
  L17_21 = L17_21(L18_22, L19_23)
  L19_23 = L17_21
  L18_22 = L17_21.setDriftParams
  L20_24 = DRIFT_PARAM_ELGONA_A
  L18_22(L19_23, L20_24)
  L19_23 = L17_21
  L18_22 = L17_21.setDriftInherit
  L20_24 = true
  L18_22(L19_23, L20_24)
  L19_23 = L17_21
  L18_22 = L17_21.setDriftEnable
  L20_24 = false
  L18_22(L19_23, L20_24)
  L19_23 = L17_21
  L18_22 = L17_21.setAreaGroup
  L20_24 = "lo"
  L21_25 = true
  L18_22(L19_23, L20_24, L21_25)
  L18_22 = setAreaRootHandle
  L19_23 = "elgona"
  L20_24 = L17_21
  L18_22(L19_23, L20_24)
  L18_22 = getAreaRootHandle
  L19_23 = "bungua"
  L18_22 = L18_22(L19_23)
  L20_24 = L18_22
  L19_23 = L18_22.setDriftParams
  L21_25 = DRIFT_PARAM_BUNGUA_B
  L19_23(L20_24, L21_25)
  L20_24 = L18_22
  L19_23 = L18_22.setDriftInherit
  L21_25 = true
  L19_23(L20_24, L21_25)
  L20_24 = L18_22
  L19_23 = L18_22.setDriftEnable
  L21_25 = false
  L19_23(L20_24, L21_25)
  L20_24 = L18_22
  L19_23 = L18_22.setAreaGroup
  L21_25 = "po"
  L22_26 = true
  L19_23(L20_24, L21_25, L22_26)
  L19_23 = setDriftParamsSubArea
  L20_24 = L15_19
  L21_25 = DRIFT_SUBAREA_TBL_JIRGA_A
  L22_26 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L19_23(L20_24, L21_25, L22_26)
  L19_23 = setDriftParamsSubArea
  L20_24 = L16_20
  L21_25 = DRIFT_SUBAREA_TBL_JIRGA_A
  L22_26 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L19_23(L20_24, L21_25, L22_26)
  L19_23 = setDriftParamsSubArea
  L20_24 = L18_22
  L21_25 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L22_26 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L19_23(L20_24, L21_25, L22_26)
  L19_23 = setDriftParamsSubArea
  L20_24 = L14_18
  L21_25 = DRIFT_SUBAREA_TBL_HABENA_A
  L22_26 = DRIFT_PARAM_SUBAREA_HABENA_A
  L19_23(L20_24, L21_25, L22_26)
  L19_23 = setDriftParamsSubArea
  L20_24 = L17_21
  L21_25 = DRIFT_SUBAREA_TBL_ELGONA_A
  L22_26 = DRIFT_PARAM_SUBAREA_ELsGONA_A
  L19_23(L20_24, L21_25, L22_26)
  L19_23 = setDriftParamsUniqueArea
  L20_24 = L15_19
  L21_25 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L19_23(L20_24, L21_25)
  L19_23 = setDriftParamsUniqueArea
  L20_24 = L16_20
  L21_25 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L19_23(L20_24, L21_25)
  L19_23 = setDriftParamsUniqueArea
  L20_24 = L18_22
  L21_25 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L19_23(L20_24, L21_25)
  L19_23 = setDriftParamsUniqueArea
  L20_24 = L14_18
  L21_25 = DRIFT_UNIQUE_AREA_TBL_HABENA_A
  L19_23(L20_24, L21_25)
  L19_23 = setDriftParamsUniqueArea
  L20_24 = L17_21
  L21_25 = DRIFT_UNIQUE_AREA_TBL_ELGONA_A
  L19_23(L20_24, L21_25)
  L20_24 = L18_22
  L19_23 = L18_22.findSubArea
  L21_25 = "bu_a_02"
  L19_23 = L19_23(L20_24, L21_25)
  if L19_23 then
    L20_24 = createSpecialGimmickBg
    L21_25 = "building_nk_08_01"
    L22_26 = "building_nk_08"
    L20_24(L21_25, L22_26, L19_23)
  end
  L21_25 = L18_22
  L20_24 = L18_22.findSubArea
  L22_26 = "bu_a_15"
  L20_24 = L20_24(L21_25, L22_26)
  if L20_24 then
    L21_25 = createSpecialGimmickBg
    L22_26 = "building_nk_01_01"
    L21_25 = L21_25(L22_26, "building_nk_01", L20_24)
    L22_26 = createGameObject2
    L22_26 = L22_26("GimmickBg")
    L22_26:setName("building_nk_01_fan_01")
    L22_26:setDrawModelName("building_nk_01_fan")
    L22_26:setAttributeName("building_nk_01_fan")
    L22_26:setCollisionName("building_nk_01_fan")
    L21_25:appendChild(L22_26)
    L22_26:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    L22_26:try_init()
    L22_26:waitForReadyAsync(function()
      L22_26:try_start()
    end)
  else
  end
end
function clockTowerBraek()
  if _placement_ctrl then
    _placement_ctrl:tremClockTower()
  end
end
