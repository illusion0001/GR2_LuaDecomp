dofile("/Game/Event2/Common/BgsetCommon.lua")
_evb_list = {
  "city_block_az3_a"
}
function createArea()
  local L0_0
  L0_0 = GameDatabase
  L0_0 = L0_0.set
  L0_0(L0_0, ggd.GlobalSystemFlags__AreaDrift, false)
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  L0_0:setName("az3_a_root")
  setAreaRootHandle("az", L0_0)
end
function setAreaDetail()
  local L0_1, L1_2
end
