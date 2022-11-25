dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/mob_reg.lua")
_vehicle_list = {
  "vehicle_route_dt_b",
  "vehicle_route_cc_b",
  "vehicle_route_ed_b"
}
_evb_list = {
  "outrange_hx_b",
  "city_block_hx_b"
}
_farniture_file_name = "farniture_placement"
_mission_name = GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName)
if string.match(_mission_name, "(.-)_()") == "dm01" then
  _put_train = true
end
function createArea()
  local L0_0, L1_1
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.setName
  L1_1(L0_0, "hx_b_root")
  L1_1 = setAreaRootHandle
  L1_1("hex", L0_0)
  L1_1 = {
    {
      area = "cc_a_root",
      node = "g1_base_cc_sign_01",
      name = "g1_base_cc_sign_af"
    }
  }
  _placement_ctrl:setAreaRegularBg(L1_1)
end
function setAreaDetail()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9
  L0_2 = getAreaRootHandle
  L1_3 = "hex"
  L0_2 = L0_2(L1_3)
  L1_3 = L0_2.setDriftEnable
  L1_3(L2_4, L3_5)
  L1_3 = L0_2.getChildren
  L1_3 = L1_3(L2_4)
  for L5_7, L6_8 in L2_4(L3_5) do
    L7_9 = L6_8.setDriftEnable
    L7_9(L6_8, false)
    L7_9 = L6_8.getChildren
    L7_9 = L7_9(L6_8)
    for _FORV_11_, _FORV_12_ in pairs(L7_9) do
      _FORV_12_:setDriftEnable(false)
    end
  end
  L5_7 = true
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = true
  L2_4(L3_5, L4_6, L5_7)
  L5_7 = true
  L2_4(L3_5, L4_6, L5_7)
end
