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
  "sagashi_ar_b",
  "sagashi_go_a"
}
_vehicle_list = {
  "vehicle_route_up",
  "vehicle_route_mi",
  "vehicle_route_po",
  "vehicle_route_lo"
}
_evb_list = {
  "city_block_go_a",
  "city_block_ar_b",
  "city_block_up_a",
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
  L2_2(L3_3, "ar_b_root")
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
  _ship:setAreaGroup("go", true)
  setAreaRootHandle("ship_jir", _ship)
  setConnectToLocationParam(_ship, L0_0, "po_a_01", "ve_crane_root_02", true)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
end
function setAreaDetail()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24
  L0_4 = _ship
  L1_5 = L0_4
  L0_4 = L0_4.setDriftEnable
  L2_6 = false
  L0_4(L1_5, L2_6)
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
  L3_7 = "ar_b_root"
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
  L8_12 = true
  L5_9(L6_10, L7_11, L8_12)
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
  L8_12 = DRIFT_PARAM_JIRGA_B
  L6_10(L7_11, L8_12)
  L7_11 = L5_9
  L6_10 = L5_9.setDriftInherit
  L8_12 = true
  L6_10(L7_11, L8_12)
  L7_11 = L5_9
  L6_10 = L5_9.setDriftEnable
  L8_12 = false
  L6_10(L7_11, L8_12)
  L7_11 = L5_9
  L6_10 = L5_9.setAreaGroup
  L8_12 = "po"
  L9_13 = true
  L6_10(L7_11, L8_12, L9_13)
  L6_10 = setAreaRootHandle
  L7_11 = "minato"
  L8_12 = L5_9
  L6_10(L7_11, L8_12)
  L6_10 = getAreaRootHandle
  L7_11 = "bungua"
  L6_10 = L6_10(L7_11)
  L8_12 = L6_10
  L7_11 = L6_10.setDriftParams
  L9_13 = DRIFT_PARAM_BUNGUA_B
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
  L7_11 = findGameObject2
  L8_12 = "Area"
  L9_13 = "lo_a_root"
  L7_11 = L7_11(L8_12, L9_13)
  L9_13 = L7_11
  L8_12 = L7_11.setDriftParams
  L10_14 = DRIFT_PARAM_ELGONA_A
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
  L10_14 = "lo"
  L11_15 = true
  L8_12(L9_13, L10_14, L11_15)
  L8_12 = setAreaRootHandle
  L9_13 = "elgona"
  L10_14 = L7_11
  L8_12(L9_13, L10_14)
  L8_12 = setDriftParamsSubArea
  L9_13 = L4_8
  L10_14 = DRIFT_SUBAREA_TBL_JIRGA_A
  L11_15 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L8_12(L9_13, L10_14, L11_15)
  L8_12 = setDriftParamsSubArea
  L9_13 = L6_10
  L10_14 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L11_15 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L8_12(L9_13, L10_14, L11_15)
  L8_12 = setDriftParamsSubArea
  L9_13 = L3_7
  L10_14 = DRIFT_SUBAREA_TBL_HABENA_A
  L11_15 = DRIFT_PARAM_SUBAREA_HABENA_A
  L8_12(L9_13, L10_14, L11_15)
  L8_12 = setDriftParamsSubArea
  L9_13 = L7_11
  L10_14 = DRIFT_SUBAREA_TBL_ELGONA_A
  L11_15 = DRIFT_PARAM_SUBAREA_ELGONA_A
  L8_12(L9_13, L10_14, L11_15)
  L8_12 = setDriftParamsUniqueArea
  L9_13 = L4_8
  L10_14 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L8_12(L9_13, L10_14)
  L8_12 = setDriftParamsUniqueArea
  L9_13 = L6_10
  L10_14 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L8_12(L9_13, L10_14)
  L8_12 = setDriftParamsUniqueArea
  L9_13 = L3_7
  L10_14 = DRIFT_UNIQUE_AREA_TBL_HABENA_A
  L8_12(L9_13, L10_14)
  L8_12 = setDriftParamsUniqueArea
  L9_13 = L7_11
  L10_14 = DRIFT_UNIQUE_AREA_TBL_ELGONA_A
  L8_12(L9_13, L10_14)
  L9_13 = L1_5
  L8_12 = L1_5.findSubArea
  L10_14 = "ar_b"
  L8_12 = L8_12(L9_13, L10_14)
  L9_13 = createGameObject2
  L10_14 = "TerrainBg"
  L9_13 = L9_13(L10_14)
  L11_15 = L9_13
  L10_14 = L9_13.setName
  L10_14(L11_15, L12_16)
  L11_15 = L9_13
  L10_14 = L9_13.setModelName
  L10_14(L11_15, L12_16)
  L11_15 = L9_13
  L10_14 = L9_13.setCollisionName
  L10_14(L11_15, L12_16)
  L11_15 = L8_12
  L10_14 = L8_12.appendChild
  L10_14(L11_15, L12_16)
  L11_15 = L9_13
  L10_14 = L9_13.setTransform
  L20_24 = L12_16(L13_17, L14_18)
  L10_14(L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L12_16(L13_17, L14_18))
  L11_15 = L9_13
  L10_14 = L9_13.try_init
  L10_14(L11_15)
  L11_15 = L9_13
  L10_14 = L9_13.waitForReadyAsync
  L10_14(L11_15, L12_16)
  L10_14 = createGameObject2
  L11_15 = "TerrainBg"
  L10_14 = L10_14(L11_15)
  L11_15 = L10_14.setName
  L11_15(L12_16, L13_17)
  L11_15 = L10_14.setModelName
  L11_15(L12_16, L13_17)
  L11_15 = L10_14.setCollisionName
  L11_15(L12_16, L13_17)
  L11_15 = L8_12.appendChild
  L11_15(L12_16, L13_17)
  L11_15 = L10_14.setTransform
  L15_19 = "building_kk_50_01"
  L20_24 = L13_17(L14_18, L15_19)
  L11_15(L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L13_17(L14_18, L15_19))
  L11_15 = L10_14.setActive
  L11_15(L12_16, L13_17)
  L11_15 = L10_14.try_init
  L11_15(L12_16)
  L11_15 = L10_14.waitForReadyAsync
  L11_15(L12_16, L13_17)
  L11_15 = setObjectHandle
  L11_15(L12_16, L13_17)
  L11_15 = setObjectHandle
  L11_15(L12_16, L13_17)
  L11_15 = L0_4.findSubArea
  L11_15 = L11_15(L12_16, L13_17)
  for L15_19 = 1, 20 do
    L16_20 = "go_jailcage_a_"
    L17_21 = string
    L17_21 = L17_21.format
    L18_22 = "%02d"
    L19_23 = L15_19
    L17_21 = L17_21(L18_22, L19_23)
    L16_20 = L16_20 .. L17_21
    L17_21 = ggd
    L18_22 = "Savedata__BrokenObj__ep10__"
    L19_23 = L16_20
    L18_22 = L18_22 .. L19_23
    L17_21 = L17_21[L18_22]
    L18_22 = nil
    if L17_21 then
      L19_23 = createSpecialGimmickBg
      L20_24 = L16_20
      L19_23 = L19_23(L20_24, "go_jailcage_a", L11_15, L17_21)
      L18_22 = L19_23
    end
    L19_23 = ggd
    L20_24 = "Savedata__BrokenObj__ep10__"
    L20_24 = L20_24 .. L16_20 .. "_brk"
    L19_23 = L19_23[L20_24]
    if L19_23 then
      L20_24 = createSpecialGimmickBg
      L20_24 = L20_24(L16_20, "go_jailcage_a_brk_md01", L11_15, L19_23)
      L20_24:setName(L16_20 .. "_brk")
      if GameDatabase:get(L17_21) == false then
        L20_24:setActive(false)
        L18_22:setEventListener("broken", function(A0_25)
          GameDatabase:set(L17_21, true)
          L20_24:setActive(true)
        end)
      else
      end
    else
    end
  end
  if L12_16 then
    L15_19 = "building_nk_08"
    L16_20 = L12_16
    L13_17(L14_18, L15_19, L16_20)
  end
  L15_19 = "bu_a_15"
  if L13_17 then
    L15_19 = "building_nk_01_01"
    L16_20 = "building_nk_01"
    L17_21 = L13_17
    L15_19 = createGameObject2
    L16_20 = "GimmickBg"
    L15_19 = L15_19(L16_20)
    L17_21 = L15_19
    L16_20 = L15_19.setName
    L18_22 = "building_nk_01_fan_01"
    L16_20(L17_21, L18_22)
    L17_21 = L15_19
    L16_20 = L15_19.setDrawModelName
    L18_22 = "building_nk_01_fan"
    L16_20(L17_21, L18_22)
    L17_21 = L15_19
    L16_20 = L15_19.setAttributeName
    L18_22 = "building_nk_01_fan"
    L16_20(L17_21, L18_22)
    L17_21 = L15_19
    L16_20 = L15_19.setCollisionName
    L18_22 = "building_nk_01_fan"
    L16_20(L17_21, L18_22)
    L17_21 = L14_18
    L16_20 = L14_18.appendChild
    L18_22 = L15_19
    L16_20(L17_21, L18_22)
    L17_21 = L15_19
    L16_20 = L15_19.setTransform
    L18_22 = Vector
    L19_23 = -0.0135913593654
    L20_24 = 13.5852425172
    L18_22 = L18_22(L19_23, L20_24, 2.15632985057)
    L19_23 = XYZRotQuatD
    L20_24 = 0
    L20_24 = L19_23(L20_24, 0, 0)
    L16_20(L17_21, L18_22, L19_23, L20_24, L19_23(L20_24, 0, 0))
    L17_21 = L15_19
    L16_20 = L15_19.try_init
    L16_20(L17_21)
    L17_21 = L15_19
    L16_20 = L15_19.waitForReadyAsync
    function L18_22()
      L15_19:try_start()
    end
    L16_20(L17_21, L18_22)
  else
  end
end
