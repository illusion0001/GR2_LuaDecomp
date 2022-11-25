dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_az_05_a_param.lua")
_evb_list = {
  "city_block_az5_a"
}
function createArea()
  local L0_0
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  L0_0:setName("az5_a_root")
  setAreaRootHandle("maze", L0_0)
end
function setAreaDetail()
  local L0_1, L1_2, L2_3
  L0_1 = {
    L1_2,
    L2_3,
    "az5_a_03",
    "az5_a_04",
    "az5_a_05",
    "az5_a_06",
    "az5_a_07",
    "az5_a_08"
  }
  L1_2 = "az5_a_01"
  L2_3 = "az5_a_02"
  L1_2 = getAreaRootHandle
  L2_3 = "maze"
  L1_2 = L1_2(L2_3)
  L2_3 = L1_2.setDriftEnable
  L2_3(L1_2, false)
  L2_3 = L1_2.getChildren
  L2_3 = L2_3(L1_2)
  for _FORV_6_, _FORV_7_ in pairs(L2_3) do
    for _FORV_11_, _FORV_12_ in ipairs(L0_1) do
      if _FORV_7_:getName() == _FORV_12_ then
        _FORV_7_:setDriftEnable(false)
        _FORV_7_:setMoveEnable(true)
      end
    end
  end
end
