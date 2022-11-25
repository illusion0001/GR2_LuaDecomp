dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_az_02_param.lua")
_evb_list = {
  "city_block_az2_a"
}
function createArea()
  local L0_0
  L0_0 = createGameObject2
  L0_0 = L0_0("Area")
  L0_0:setName("az2_a_root")
  setAreaRootHandle("az", L0_0)
  L0_0:setDriftParams(DRIFT_PARAM_ANOTHER_ZONE_02)
  L0_0:setDriftInherit(true)
  L0_0:setDriftEnable(false)
end
function setAreaDetail()
  local L0_1
  L0_1 = getAreaRootHandle
  L0_1 = L0_1("az")
  setDriftParamsSubArea(L0_1, DRIFT_SUBAREA_TBL_ANOTHER_ZONE_02, DRIFT_PARAM_SUBAREA_ANOTHER_ZONE_02)
  setDriftParamsUniqueArea(L0_1, DRIFT_UNIQUE_AREA_TBL_ANOTHER_ZONE_02)
end
