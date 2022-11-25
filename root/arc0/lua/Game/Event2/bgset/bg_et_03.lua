dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_et3_a_param.lua")
_evb_list = {
  "city_block_et3_a"
}
function createArea()
  et3_a_root = createGameObject2("Area")
  et3_a_root:setName("et3_a_root")
  setAreaRootHandle("et3", et3_a_root)
  GameDatabase:set(ggd.Menu__MapName, "None")
end
function setAreaDetail()
  et3_a_root:setDriftParams(DRIFT_PARAM_ANOTHER_DIMENSION_A)
  et3_a_root:setDriftInherit(true)
  et3_a_root:setDriftEnable(false)
end
