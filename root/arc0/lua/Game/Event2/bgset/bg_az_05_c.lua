dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_az_05_c_param.lua")
_evb_list = {
  "city_block_az5_c"
}
function createArea()
  local L0_0
  L0_0 = GameDatabase
  L0_0 = L0_0.set
  L0_0(L0_0, ggd.GlobalSystemFlags__AreaDrift, false)
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  L0_0:setName("az5_c_root")
  setAreaRootHandle("maze", L0_0)
end
function setAreaDetail()
  local L0_1, L1_2, L2_3
  L0_1 = {
    L1_2,
    L2_3,
    "az5_c_05",
    "az5_c_06",
    "az5_c_03_root",
    "az5_c_04_root",
    "az5_c_05_root",
    "az5_c_06_root"
  }
  L1_2 = "az5_c_03"
  L2_3 = "az5_c_04"
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
