dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_scree_a_param.lua")
dofile("/Game/Event2/bgset/bg_bungua_a_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Event2/mob_reg.lua")
_vehicle_list = {
  "vehicle_route_bu_a"
}
_evb_list = {
  "outrange_bu_a",
  "outrange_wa_a",
  "city_block_bu_a"
}
_ship = nil
_cage = nil
_wire = nil
function createArea()
  scree = createGameObject2("Area")
  scree:setName("wa_a_root")
  setAreaRootHandle("scree", scree)
  bungua = createGameObject2("Area")
  bungua:setName("bu_a_root")
  setAreaRootHandle("bungua", bungua)
  setConnectToLocationParam(bungua, scree, nil, "bu_a_root", true)
  _ship, _wall, _rudder, _lever = createCraneShipJir()
  _ship:setAreaGroup("bu", true)
  setAreaRootHandle("ship_jir", _ship)
  setConnectToLocationParam(_ship, bungua, "bu_a_08", "ve_crane_root_01", true)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
end
function setAreaDetail()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = wireBind
  L1_1 = _cage
  L2_2 = _wire
  L3_3 = _ship
  L4_4 = "wire_nk_01"
  L0_0(L1_1, L2_2, L3_3, L4_4)
  L0_0 = warpShipObject
  L1_1 = _ship
  L2_2 = _cage_base
  L3_3 = _rudder
  L4_4 = _lever
  L0_0(L1_1, L2_2, L3_3, L4_4)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setDriftParams
  L2_2 = DRIFT_PARAM_SCREE_A
  L0_0(L1_1, L2_2)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setDriftInherit
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setDriftEnable
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setAreaGroup
  L2_2 = "bu"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setDriftParams
  L2_2 = DRIFT_PARAM_BUNGUA_A
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setDriftInherit
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setDriftEnable
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setAreaGroup
  L2_2 = "bu"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L2_2 = ggd
  L2_2 = L2_2.Menu__MapName
  L3_3 = "bu"
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = setDriftParamsSubArea
  L1_1 = scree
  L2_2 = DRIFT_SUBAREA_TBL_SCREE_A
  L3_3 = DRIFT_PARAM_SUBAREA_SCREE_A
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = setDriftParamsSubArea
  L1_1 = bungua
  L2_2 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L3_3 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = setDriftParamsUniqueArea
  L1_1 = scree
  L2_2 = DRIFT_UNIQUE_AREA_TBL_SCREE_A
  L0_0(L1_1, L2_2)
  L0_0 = setDriftParamsUniqueArea
  L1_1 = bungua
  L2_2 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.findSubArea
  L2_2 = "bu_a_02"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = createGameObject2
  L2_2 = "GimmickBg"
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.setName
  L4_4 = "building_nk_08b"
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setDrawModelName
  L4_4 = "building_nk_08b"
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setAttributeName
  L4_4 = "building_nk_08b"
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setCollisionName
  L4_4 = "building_nk_08b"
  L2_2(L3_3, L4_4)
  L3_3 = L0_0
  L2_2 = L0_0.appendChild
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L3_3 = L1_1
  L2_2 = L1_1.setTransform
  L5_5 = L0_0
  L4_4 = L0_0.getNodeLocalPosRot
  L6_6 = "building_nk_08_01"
  L6_6 = L4_4(L5_5, L6_6)
  L2_2(L3_3, L4_4, L5_5, L6_6, L4_4(L5_5, L6_6))
  L3_3 = L1_1
  L2_2 = L1_1.try_init
  L2_2(L3_3)
  L3_3 = L1_1
  L2_2 = L1_1.waitForReadyAsync
  function L4_4()
    L1_1:try_start()
  end
  L2_2(L3_3, L4_4)
  L2_2 = createGameObject2
  L3_3 = "GimmickBg"
  L2_2 = L2_2(L3_3)
  L4_4 = L2_2
  L3_3 = L2_2.setName
  L5_5 = "building_nk_08_door_01"
  L3_3(L4_4, L5_5)
  L4_4 = L2_2
  L3_3 = L2_2.setDrawModelName
  L5_5 = "building_nk_08_door_01"
  L3_3(L4_4, L5_5)
  L4_4 = L2_2
  L3_3 = L2_2.setCollisionName
  L5_5 = "building_nk_08_door_01"
  L3_3(L4_4, L5_5)
  L4_4 = L2_2
  L3_3 = L2_2.setAttributeName
  L5_5 = "building_nk_08_door_01"
  L3_3(L4_4, L5_5)
  L4_4 = L2_2
  L3_3 = L2_2.setPos
  L5_5 = Vector
  L6_6 = 0.31001
  L6_6 = L5_5(L6_6, 0, 3.02121)
  L3_3(L4_4, L5_5, L6_6, L5_5(L6_6, 0, 3.02121))
  L4_4 = L1_1
  L3_3 = L1_1.appendChild
  L5_5 = L2_2
  L3_3(L4_4, L5_5)
  L4_4 = L2_2
  L3_3 = L2_2.try_init
  L3_3(L4_4)
  L4_4 = L2_2
  L3_3 = L2_2.waitForReadyAsync
  function L5_5()
    L2_2:try_start()
  end
  L3_3(L4_4, L5_5)
  L3_3 = createGameObject2
  L4_4 = "GimmickBg"
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.setName
  L6_6 = "building_nk_08_door_02"
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setDrawModelName
  L6_6 = "building_nk_08_door_02"
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setCollisionName
  L6_6 = "building_nk_08_door_02"
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setAttributeName
  L6_6 = "building_nk_08_door_02"
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setPos
  L6_6 = Vector
  L6_6 = L6_6(1.62007, 0, 3.02121)
  L4_4(L5_5, L6_6, L6_6(1.62007, 0, 3.02121))
  L5_5 = L1_1
  L4_4 = L1_1.appendChild
  L6_6 = L3_3
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.try_init
  L4_4(L5_5)
  L5_5 = L3_3
  L4_4 = L3_3.waitForReadyAsync
  function L6_6()
    L3_3:try_start()
  end
  L4_4(L5_5, L6_6)
  L4_4 = setObjectHandle
  L5_5 = "pen"
  L6_6 = L1_1
  L4_4(L5_5, L6_6)
  L4_4 = setObjectHandle
  L5_5 = "pen_door_l"
  L6_6 = L2_2
  L4_4(L5_5, L6_6)
  L4_4 = setObjectHandle
  L5_5 = "pen_door_r"
  L6_6 = L3_3
  L4_4(L5_5, L6_6)
  L4_4 = bungua
  L5_5 = L4_4
  L4_4 = L4_4.findSubArea
  L6_6 = "bu_a_15"
  L4_4 = L4_4(L5_5, L6_6)
  if L4_4 then
    L5_5 = createSpecialGimmickBg
    L6_6 = "building_nk_01_01"
    L5_5 = L5_5(L6_6, "building_nk_01", L4_4)
    L6_6 = createGameObject2
    L6_6 = L6_6("GimmickBg")
    L6_6:setName("building_nk_01_fan_01")
    L6_6:setDrawModelName("building_nk_01_fan")
    L6_6:setAttributeName("building_nk_01_fan")
    L6_6:setCollisionName("building_nk_01_fan")
    L5_5:appendChild(L6_6)
    L6_6:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    L6_6:try_init()
    L6_6:waitForReadyAsync(function()
      L6_6:try_start()
    end)
  else
  end
end
