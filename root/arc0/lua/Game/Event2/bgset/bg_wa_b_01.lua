dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_scree_a_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
_evb_list = {
  "outrange_wa_b",
  "city_block_wa_b"
}
function createArea()
  scree = createGameObject2("Area")
  scree:setName("wa_b_root")
  scree:setAreaGroup("bungua", true)
  setAreaRootHandle("scree", scree)
  scree:setDriftParams(DRIFT_PARAM_SCREE_A)
  scree:setDriftInherit(true)
  scree:setDriftEnable(false)
  _cage_base, _cage, _wire = createCraneCage()
end
function setAreaDetail()
  local L0_0
  L0_0 = scree
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "wa_a_03")
  _cage:setTransform(L0_0:getNodePosRot("ve_cage_01", true))
  _cage:setForceMove()
  wireBind(_cage, _wire, L0_0, "ve_cage_01", Vector(0, 70, 0))
  setDriftParamsSubArea(scree, DRIFT_SUBAREA_TBL_SCREE_A, DRIFT_PARAM_SUBAREA_SCREE_A)
  setDriftParamsUniqueArea(scree, DRIFT_UNIQUE_AREA_TBL_SCREE_A)
end
