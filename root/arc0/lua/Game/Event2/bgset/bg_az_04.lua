dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_az_04_param.lua")
_evb_list = {
  "city_block_az4_a"
}
function createArea()
  local L0_0
  L0_0 = GameDatabase
  L0_0 = L0_0.set
  L0_0(L0_0, ggd.GlobalSystemFlags__AreaRootTree, 1)
  L0_0 = GameDatabase
  L0_0 = L0_0.set
  L0_0(L0_0, ggd.GlobalSystemFlags__AreaDrift, false)
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  L0_0:setName("az4_a_root")
  setAreaRootHandle("az", L0_0)
  L0_0:setDriftParams(DRIFT_PARAM_ANOTHER_ZONE_D)
  L0_0:setDriftInherit(true)
  L0_0:setDriftEnable(false)
end
function setAreaDetail()
  local L0_1
  L0_1 = getAreaRootHandle
  L0_1 = L0_1("az")
  setDriftParamsSubArea(L0_1, DRIFT_SUBAREA_TBL_ANOTHER_ZONE_04, DRIFT_PARAM_SUBAREA_ANOTHER_ZONE_04)
  setDriftParamsUniqueArea(L0_1, DRIFT_UNIQUE_AREA_TBL_ANOTHER_ZONE_04)
end
