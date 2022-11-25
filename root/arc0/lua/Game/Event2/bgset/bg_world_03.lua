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
  "city_block_hx_c",
  "po_b_object"
}
_farniture_file_name = "farniture_placement"
_dt_broken_list = {
  g1_base_dt_j1_road_02_brk = {
    "g1_building_sf_16b_01"
  },
  g1_base_dt_k1_road_03_brk = {
    "g1_building_pd_77b_01",
    "g1_tree_yy_09_01"
  }
}
_dt_hdl = nil
_dt_broken_hdl = {}
_is_remake_finish = false
function createArea()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = "world_b_root"
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
    }
  }
  _placement_ctrl:setAreaRegularBg(L3_3)
end
function setAreaDetail()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22
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
  L7_11 = "dt_c_root"
  L6_10 = findGameObject2
  L7_11 = "Area"
  L8_12 = "id_a_root"
  L6_10 = L6_10(L7_11, L8_12)
  L8_12 = L3_7
  L7_11 = L3_7.setAreaGroup
  L7_11(L8_12, L9_13, L10_14)
  L8_12 = L4_8
  L7_11 = L4_8.setAreaGroup
  L7_11(L8_12, L9_13, L10_14)
  L8_12 = L5_9
  L7_11 = L5_9.setAreaGroup
  L7_11(L8_12, L9_13, L10_14)
  L8_12 = L6_10
  L7_11 = L6_10.setAreaGroup
  L7_11(L8_12, L9_13, L10_14)
  L7_11 = findGameObject2
  L8_12 = "Area"
  L7_11 = L7_11(L8_12, L9_13)
  L8_12 = L7_11.setDriftEnable
  L8_12(L9_13, L10_14)
  L8_12 = setAreaRootHandle
  L8_12(L9_13, L10_14)
  L8_12 = findGameObject2
  L8_12 = L8_12(L9_13, L10_14)
  L9_13(L10_14, L11_15)
  L12_16 = true
  L9_13(L10_14, L11_15, L12_16)
  if L9_13 then
    L12_16 = "setWarShip"
    L13_17 = L8_12
    L10_14(L11_15, L12_16, L13_17)
  end
  L12_16 = "up_a_root"
  L12_16 = L10_14
  L13_17 = DRIFT_PARAM_HABENA_A
  L11_15(L12_16, L13_17)
  L12_16 = L10_14
  L13_17 = true
  L11_15(L12_16, L13_17)
  L12_16 = L10_14
  L13_17 = false
  L11_15(L12_16, L13_17)
  L12_16 = L10_14
  L13_17 = "up"
  L14_18 = true
  L11_15(L12_16, L13_17, L14_18)
  L12_16 = "up"
  L13_17 = L10_14
  L11_15(L12_16, L13_17)
  L12_16 = "Area"
  L13_17 = "po_a_root"
  L13_17 = L11_15
  L12_16 = L11_15.setDriftParams
  L14_18 = DRIFT_PARAM_JIRGA_A
  L12_16(L13_17, L14_18)
  L13_17 = L11_15
  L12_16 = L11_15.setDriftInherit
  L14_18 = true
  L12_16(L13_17, L14_18)
  L13_17 = L11_15
  L12_16 = L11_15.setDriftEnable
  L14_18 = false
  L12_16(L13_17, L14_18)
  L13_17 = L11_15
  L12_16 = L11_15.setAreaGroup
  L14_18 = "po"
  L15_19 = true
  L12_16(L13_17, L14_18, L15_19)
  L12_16 = setAreaRootHandle
  L13_17 = "port"
  L14_18 = L11_15
  L12_16(L13_17, L14_18)
  L12_16 = findGameObject2
  L13_17 = "Area"
  L14_18 = "mi_a_root"
  L12_16 = L12_16(L13_17, L14_18)
  L14_18 = L12_16
  L13_17 = L12_16.setDriftParams
  L15_19 = DRIFT_PARAM_JIRGA_A
  L13_17(L14_18, L15_19)
  L14_18 = L12_16
  L13_17 = L12_16.setDriftInherit
  L15_19 = true
  L13_17(L14_18, L15_19)
  L14_18 = L12_16
  L13_17 = L12_16.setDriftEnable
  L15_19 = false
  L13_17(L14_18, L15_19)
  L14_18 = L12_16
  L13_17 = L12_16.setAreaGroup
  L15_19 = "po"
  L16_20 = true
  L13_17(L14_18, L15_19, L16_20)
  L13_17 = setAreaRootHandle
  L14_18 = "port_b"
  L15_19 = L12_16
  L13_17(L14_18, L15_19)
  L13_17 = findGameObject2
  L14_18 = "Area"
  L15_19 = "lo_a_root"
  L13_17 = L13_17(L14_18, L15_19)
  L15_19 = L13_17
  L14_18 = L13_17.setDriftParams
  L16_20 = DRIFT_PARAM_ELGONA_A
  L14_18(L15_19, L16_20)
  L15_19 = L13_17
  L14_18 = L13_17.setDriftInherit
  L16_20 = true
  L14_18(L15_19, L16_20)
  L15_19 = L13_17
  L14_18 = L13_17.setDriftEnable
  L16_20 = false
  L14_18(L15_19, L16_20)
  L15_19 = L13_17
  L14_18 = L13_17.setAreaGroup
  L16_20 = "lo"
  L17_21 = true
  L14_18(L15_19, L16_20, L17_21)
  L14_18 = setAreaRootHandle
  L15_19 = "elgona"
  L16_20 = L13_17
  L14_18(L15_19, L16_20)
  L14_18 = getAreaRootHandle
  L15_19 = "bungua"
  L14_18 = L14_18(L15_19)
  L16_20 = L14_18
  L15_19 = L14_18.setDriftParams
  L17_21 = DRIFT_PARAM_BUNGUA_B
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
  L17_21 = "po"
  L18_22 = true
  L15_19(L16_20, L17_21, L18_22)
  L15_19 = setDriftParamsSubArea
  L16_20 = L11_15
  L17_21 = DRIFT_SUBAREA_TBL_JIRGA_A
  L18_22 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L15_19(L16_20, L17_21, L18_22)
  L15_19 = setDriftParamsSubArea
  L16_20 = L12_16
  L17_21 = DRIFT_SUBAREA_TBL_JIRGA_A
  L18_22 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L15_19(L16_20, L17_21, L18_22)
  L15_19 = setDriftParamsSubArea
  L16_20 = L14_18
  L17_21 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L18_22 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L15_19(L16_20, L17_21, L18_22)
  L15_19 = setDriftParamsSubArea
  L16_20 = L10_14
  L17_21 = DRIFT_SUBAREA_TBL_HABENA_A
  L18_22 = DRIFT_PARAM_SUBAREA_HABENA_A
  L15_19(L16_20, L17_21, L18_22)
  L15_19 = setDriftParamsSubArea
  L16_20 = L13_17
  L17_21 = DRIFT_SUBAREA_TBL_ELGONA_A
  L18_22 = DRIFT_PARAM_SUBAREA_ELsGONA_A
  L15_19(L16_20, L17_21, L18_22)
  L15_19 = setDriftParamsUniqueArea
  L16_20 = L11_15
  L17_21 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L15_19(L16_20, L17_21)
  L15_19 = setDriftParamsUniqueArea
  L16_20 = L12_16
  L17_21 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L15_19(L16_20, L17_21)
  L15_19 = setDriftParamsUniqueArea
  L16_20 = L14_18
  L17_21 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L15_19(L16_20, L17_21)
  L15_19 = setDriftParamsUniqueArea
  L16_20 = L10_14
  L17_21 = DRIFT_UNIQUE_AREA_TBL_HABENA_A
  L15_19(L16_20, L17_21)
  L15_19 = setDriftParamsUniqueArea
  L16_20 = L13_17
  L17_21 = DRIFT_UNIQUE_AREA_TBL_ELGONA_A
  L15_19(L16_20, L17_21)
  L16_20 = L14_18
  L15_19 = L14_18.findSubArea
  L17_21 = "bu_a_02"
  L15_19 = L15_19(L16_20, L17_21)
  if L15_19 then
    L16_20 = createSpecialGimmickBg
    L17_21 = "building_nk_08_01"
    L18_22 = "building_nk_08"
    L16_20(L17_21, L18_22, L15_19)
  end
  L17_21 = L14_18
  L16_20 = L14_18.findSubArea
  L18_22 = "bu_a_15"
  L16_20 = L16_20(L17_21, L18_22)
  if L16_20 then
    L17_21 = createSpecialGimmickBg
    L18_22 = "building_nk_01_01"
    L17_21 = L17_21(L18_22, "building_nk_01", L16_20)
    L18_22 = createGameObject2
    L18_22 = L18_22("GimmickBg")
    L18_22:setName("building_nk_01_fan_01")
    L18_22:setDrawModelName("building_nk_01_fan")
    L18_22:setAttributeName("building_nk_01_fan")
    L18_22:setCollisionName("building_nk_01_fan")
    L17_21:appendChild(L18_22)
    L18_22:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    L18_22:try_init()
    L18_22:waitForReadyAsync(function()
      L18_22:try_start()
    end)
  else
  end
  L17_21 = createGameObject2
  L18_22 = "TerrainBg"
  L17_21 = L17_21(L18_22)
  _demo_obj = L17_21
  L17_21 = _demo_obj
  L18_22 = L17_21
  L17_21 = L17_21.setName
  L17_21(L18_22, "g1_building_kw_01_demo_brk_c")
  L17_21 = _demo_obj
  L18_22 = L17_21
  L17_21 = L17_21.setModelName
  L17_21(L18_22, "g1_building_kw_01_demo_brk_c")
  L17_21 = _demo_obj
  L18_22 = L17_21
  L17_21 = L17_21.setCollisionName
  L17_21(L18_22, "g1_building_kw_01_demo_brk_c")
  L18_22 = L5_9
  L17_21 = L5_9.appendChild
  L17_21(L18_22, _demo_obj)
  L17_21 = _demo_obj
  L18_22 = L17_21
  L17_21 = L17_21.setTransform
  L17_21(L18_22, L5_9:getNodeLocalPosRot("g1_building_kw_01_demo_brk_c_01"))
  L17_21 = _demo_obj
  L18_22 = L17_21
  L17_21 = L17_21.try_init
  L17_21(L18_22)
  L17_21 = _demo_obj
  L18_22 = L17_21
  L17_21 = L17_21.waitForReadyAsync
  L17_21(L18_22, function()
    _demo_obj:try_start()
  end)
  _dt_hdl = L5_9
  L17_21 = createSpecialGimmickBgSet
  L17_21()
end
function createSpecialGimmickBgSet()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35
  for L3_26, L4_27 in L0_23(L1_24) do
    if L4_27 then
      L5_28 = L4_27.try_term
      L5_28(L6_29)
    end
  end
  _dt_broken_hdl = L0_23
  for L3_26, L4_27 in L0_23(L1_24) do
    L5_28 = _dt_hdl
    L5_28 = L5_28.findSubArea
    L5_28 = L5_28(L6_29, L7_30)
    if L5_28 then
      for L9_32, L10_33 in L6_29(L7_30) do
        L11_34 = ggd
        L12_35 = "Savedata__BrokenObj__ep26__"
        L12_35 = L12_35 .. L3_26 .. "__" .. L10_33
        L11_34 = L11_34[L12_35]
        if L11_34 then
          L12_35 = createSpecialGimmickBg
          L12_35 = L12_35(L10_33, string.sub(L10_33, 1, string.len(L10_33) - 3), L5_28, L11_34)
          if L12_35 then
            table.insert(_dt_broken_hdl, L12_35)
          end
        end
      end
    end
  end
  _is_remake_finish = true
end
function requestBgSet(A0_36)
  if A0_36.object_remake then
    _is_remake_finish = false
    invokeSystemTask(createSpecialGimmickBgSet)
  end
  if A0_36.demo_object ~= nil and _demo_obj then
    _demo_obj:setActive(A0_36.demo_object)
  end
end
function getRequestState(A0_37)
  if A0_37.is_remake_finish then
    return _is_remake_finish
  end
  return false
end
