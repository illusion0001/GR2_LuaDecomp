dofile("/Game/Event2/Common/BgsetCommon.lua")
_vehicle_list = {
  "vehicle_route_et_a"
}
_evb_list = {
  "city_block_et_a"
}
function createArea()
  local L0_0, L1_1
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L0_0(L1_1, ggd.GlobalSystemFlags__AreaDrift, false)
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.setName
  L1_1(L0_0, "et_a_root")
  L1_1 = setAreaRootHandle
  L1_1("et", L0_0)
  L1_1 = createGameObject2
  L1_1 = L1_1("Area")
  L1_1:setName("ve_et_a")
  setAreaRootHandle("ship", L1_1)
  GameDatabase:set(ggd.Menu__MapName, "None")
end
function setAreaDetail()
  local L0_2, L1_3
end
