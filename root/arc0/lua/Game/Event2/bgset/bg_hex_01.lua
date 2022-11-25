dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Event2/mob_reg.lua")
_picture_list = {
  "sagashi_cc_a",
  "sagashi_dt_a",
  "sagashi_ed_a",
  "sagashi_id_a"
}
_vehicle_list = {
  "vehicle_route_cc",
  "vehicle_route_dt",
  "vehicle_route_ed"
}
_evb_list = {
  "outrange_hx_a",
  "city_block_hx_a"
}
_farniture_file_name = "farniture_placement"
_put_train = true
_ship = nil
_cage = nil
_wire = nil
function createArea()
  local L0_0, L1_1, L2_2
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L1_1(L2_2, "hx_a_root")
  L1_1 = setAreaRootHandle
  L2_2 = "hex"
  L1_1(L2_2, L0_0)
  L1_1 = createCraneShipHex
  _rudder, _lever, L1_1 = L0_0, nil, L1_1()
  _rudder, _lever, L2_2 = L0_0, nil, L1_1()
  _wall = L2_2
  _ship = L1_1
  L1_1 = _ship
  L2_2 = L1_1
  L1_1 = L1_1.setAreaGroup
  L1_1(L2_2, "dt", true)
  L1_1 = setAreaRootHandle
  L2_2 = "ship_hex"
  L1_1(L2_2, _ship)
  L1_1 = setConnectToLocationParam
  L2_2 = _ship
  L1_1(L2_2, L0_0, "g1_base_dt_f2_road", "ve_crane_root_dt_01", true)
  L1_1 = createCraneCage
  _wire, L1_1 = L0_0, L1_1()
  _wire, L2_2 = L0_0, L1_1()
  _cage = L2_2
  _cage_base = L1_1
  L1_1 = _ship
  L2_2 = L1_1
  L1_1 = L1_1.appendChild
  L1_1(L2_2, _cage_base)
  L1_1 = Fn_getGameObject
  L2_2 = "craneShipManager"
  L1_1 = L1_1(L2_2)
  if L1_1 then
    L2_2 = L1_1.sendEvent
    L2_2(L1_1, "setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
  L2_2 = {
    {
      area = "cc_a_root",
      node = "g1_base_cc_sign_01",
      name = "g1_base_cc_sign"
    },
    {
      area = "ed_a_root",
      node = "g1_base_ed_sign_01",
      name = "g1_base_ed_sign"
    },
    {
      area = "dt_a_root",
      node = "g1_base_dt_sign_01",
      name = "g1_base_dt_sign"
    },
    {
      area = "g1_base_dt_f1_road_01",
      node = "g1_building_kw_01_01",
      name = "g1_base_dt_f1_clocktower",
      lod = "g1_base_dt_f1_clocktower_low",
      ofs_y = 80
    }
  }
  _placement_ctrl:setAreaRegularBg(L2_2)
end
function setAreaDetail()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10
  L0_3 = wireBind
  L1_4 = _cage
  L0_3(L1_4, L2_5, L3_6, L4_7)
  L0_3 = warpShipObject
  L1_4 = _ship
  L0_3(L1_4, L2_5, L3_6, L4_7)
  L0_3 = getAreaRootHandle
  L1_4 = "hex"
  L0_3 = L0_3(L1_4)
  L1_4 = L0_3.setDriftEnable
  L1_4(L2_5, L3_6)
  L1_4 = L0_3.getChildren
  L1_4 = L1_4(L2_5)
  for L5_8, L6_9 in L2_5(L3_6) do
    L7_10 = L6_9.setDriftEnable
    L7_10(L6_9, false)
    L7_10 = L6_9.getChildren
    L7_10 = L7_10(L6_9)
    for _FORV_11_, _FORV_12_ in pairs(L7_10) do
      _FORV_12_:setDriftEnable(false)
    end
  end
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
  L5_8 = true
  L2_5(L3_6, L4_7, L5_8)
end
