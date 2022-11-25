dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_jilga_a_param.lua")
dofile("/Game/Event2/bgset/bg_elgona_a_param.lua")
dofile("/Game/Event2/bgset/bg_habena_a_param.lua")
dofile("/Game/Event2/bgset/bg_bungua_a_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Event2/mob_reg.lua")
_picture_list = {
  "sagashi_po_a"
}
_vehicle_list = {
  "vehicle_route_up",
  "vehicle_route_mi",
  "vehicle_route_po_e3",
  "vehicle_route_lo"
}
_evb_list = {
  "outrange_po_e",
  "city_block_po_a",
  "po_b_object"
}
function createArea()
  local L0_0, L1_1
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.setName
  L1_1(L0_0, "ji_e_root")
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
  _ship:setAreaGroup("po", true)
  setAreaRootHandle("ship_jir", _ship)
  setObjectHandle("ship_jir_wall", _wall)
  setObjectHandle("rudder", _rudder)
  setConnectToLocationParam(_ship, L0_0, "po_a_01", "ve_crane_root_02", true)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
end
function setAreaDetail()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9
  L0_2 = _ship
  L1_3 = L0_2
  L0_2 = L0_2.setSceneParameters
  L2_4 = "po_a_root"
  L0_2(L1_3, L2_4)
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
  L2_4 = "up_a_root"
  L0_2 = L0_2(L1_3, L2_4)
  L2_4 = L0_2
  L1_3 = L0_2.setDriftParams
  L3_5 = DRIFT_PARAM_HABENA_A
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.setDriftInherit
  L3_5 = true
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.setDriftEnable
  L3_5 = false
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.setAreaGroup
  L3_5 = "up"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = setAreaRootHandle
  L2_4 = "habena"
  L3_5 = L0_2
  L1_3(L2_4, L3_5)
  L1_3 = findGameObject2
  L2_4 = "Area"
  L3_5 = "po_a_root"
  L1_3 = L1_3(L2_4, L3_5)
  L3_5 = L1_3
  L2_4 = L1_3.setDriftParams
  L4_6 = DRIFT_PARAM_JIRGA_A
  L2_4(L3_5, L4_6)
  L3_5 = L1_3
  L2_4 = L1_3.setDriftInherit
  L4_6 = true
  L2_4(L3_5, L4_6)
  L3_5 = L1_3
  L2_4 = L1_3.setDriftEnable
  L4_6 = false
  L2_4(L3_5, L4_6)
  L3_5 = L1_3
  L2_4 = L1_3.setAreaGroup
  L4_6 = "po"
  L5_7 = true
  L2_4(L3_5, L4_6, L5_7)
  L2_4 = setAreaRootHandle
  L3_5 = "port"
  L4_6 = L1_3
  L2_4(L3_5, L4_6)
  L2_4 = findGameObject2
  L3_5 = "Area"
  L4_6 = "mi_a_root"
  L2_4 = L2_4(L3_5, L4_6)
  L4_6 = L2_4
  L3_5 = L2_4.setDriftParams
  L5_7 = DRIFT_PARAM_JIRGA_B
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
  L5_7 = "po"
  L6_8 = true
  L3_5(L4_6, L5_7, L6_8)
  L3_5 = setAreaRootHandle
  L4_6 = "minato"
  L5_7 = L2_4
  L3_5(L4_6, L5_7)
  L3_5 = getAreaRootHandle
  L4_6 = "bungua"
  L3_5 = L3_5(L4_6)
  L5_7 = L3_5
  L4_6 = L3_5.setDriftParams
  L6_8 = DRIFT_PARAM_BUNGUA_B
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
  L4_6 = _ship
  L5_7 = L4_6
  L4_6 = L4_6.setDriftParams
  L6_8 = DRIFT_PARAM_BUNGUA_B
  L4_6(L5_7, L6_8)
  L4_6 = setDriftParamsSubArea
  L5_7 = L1_3
  L6_8 = DRIFT_SUBAREA_TBL_JIRGA_A
  L7_9 = DRIFT_PARAM_SUBAREA_JIRGA_A
  L4_6(L5_7, L6_8, L7_9)
  L4_6 = setDriftParamsSubArea
  L5_7 = L3_5
  L6_8 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L7_9 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L4_6(L5_7, L6_8, L7_9)
  L4_6 = setDriftParamsSubArea
  L5_7 = L0_2
  L6_8 = DRIFT_SUBAREA_TBL_HABENA_A
  L7_9 = DRIFT_PARAM_SUBAREA_HABENA_A
  L4_6(L5_7, L6_8, L7_9)
  L4_6 = setDriftParamsUniqueArea
  L5_7 = L1_3
  L6_8 = DRIFT_UNIQUE_AREA_TBL_JIRGA_A
  L4_6(L5_7, L6_8)
  L4_6 = setDriftParamsUniqueArea
  L5_7 = L3_5
  L6_8 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L4_6(L5_7, L6_8)
  L4_6 = setDriftParamsUniqueArea
  L5_7 = L0_2
  L6_8 = DRIFT_UNIQUE_AREA_TBL_HABENA_A
  L4_6(L5_7, L6_8)
  L5_7 = L3_5
  L4_6 = L3_5.findSubArea
  L6_8 = "bu_a_02"
  L4_6 = L4_6(L5_7, L6_8)
  if L4_6 then
    L5_7 = createSpecialGimmickBg
    L6_8 = "building_nk_08_01"
    L7_9 = "building_nk_08"
    L5_7(L6_8, L7_9, L4_6)
  end
  L6_8 = L3_5
  L5_7 = L3_5.findSubArea
  L7_9 = "bu_a_15"
  L5_7 = L5_7(L6_8, L7_9)
  if L5_7 then
    L6_8 = createSpecialGimmickBg
    L7_9 = "building_nk_01_01"
    L6_8 = L6_8(L7_9, "building_nk_01", L5_7)
    L7_9 = createGameObject2
    L7_9 = L7_9("GimmickBg")
    L7_9:setName("building_nk_01_fan_01")
    L7_9:setDrawModelName("building_nk_01_fan")
    L7_9:setAttributeName("building_nk_01_fan")
    L7_9:setCollisionName("building_nk_01_fan")
    L6_8:appendChild(L7_9)
    L7_9:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    L7_9:try_init()
    L7_9:waitForReadyAsync(function()
      L7_9:try_start()
    end)
  else
  end
end
