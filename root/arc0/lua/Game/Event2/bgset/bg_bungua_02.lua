dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_scree_a_param.lua")
dofile("/Game/Event2/bgset/bg_bungua_a_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Event2/mob_reg.lua")
_evb_list = {
  "city_block_bu_f"
}
function createArea()
  scree = createGameObject2("Area")
  scree:setName("wa_a_root")
  setAreaRootHandle("scree", scree)
  bungua = createGameObject2("Area")
  bungua:setName("bu_f_root")
  setAreaRootHandle("bungua", bungua)
  setConnectToLocationParam(bungua, scree, nil, "bu_f_root", true)
  _ship, _wall, _rudder, _lever = createCraneShipJir()
  _ship:setAreaGroup("bu", true)
  setAreaRootHandle("ship_jir", _ship)
  setConnectToLocationParam(_ship, bungua, "bu_a_08", "ve_crane_root_01", true)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire)
  end
end
function setAreaDetail()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = wireBind
  L1_1 = _cage
  L2_2 = _wire
  L3_3 = _ship
  L0_0(L1_1, L2_2, L3_3, "wire_nk_01")
  L0_0 = warpShipObject
  L1_1 = _ship
  L2_2 = _cage_base
  L3_3 = _rudder
  L0_0(L1_1, L2_2, L3_3, _lever)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setDriftParams
  L2_2 = DRIFT_PARAM_SCREE_A
  L0_0(L1_1, L2_2)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setDriftInherit
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setDriftEnable
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = scree
  L1_1 = L0_0
  L0_0 = L0_0.setAreaGroup
  L2_2 = "bu"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setDriftParams
  L2_2 = DRIFT_PARAM_BUNGUA_A
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setDriftInherit
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setDriftEnable
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.setAreaGroup
  L2_2 = "bu"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L2_2 = ggd
  L2_2 = L2_2.Menu__MapName
  L3_3 = "bu"
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = setDriftParamsSubArea
  L1_1 = scree
  L2_2 = DRIFT_SUBAREA_TBL_SCREE_A
  L3_3 = DRIFT_PARAM_SUBAREA_SCREE_A
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = setDriftParamsSubArea
  L1_1 = bungua
  L2_2 = DRIFT_SUBAREA_TBL_BUNGUA_A
  L3_3 = DRIFT_PARAM_SUBAREA_BUNGUA_A
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = setDriftParamsUniqueArea
  L1_1 = scree
  L2_2 = DRIFT_UNIQUE_AREA_TBL_SCREE_A
  L0_0(L1_1, L2_2)
  L0_0 = setDriftParamsUniqueArea
  L1_1 = bungua
  L2_2 = DRIFT_UNIQUE_AREA_TBL_BUNGUA_A
  L0_0(L1_1, L2_2)
  L0_0 = bungua
  L1_1 = L0_0
  L0_0 = L0_0.findSubArea
  L2_2 = "bu_a_02"
  L0_0 = L0_0(L1_1, L2_2)
  if L0_0 then
    L1_1 = createSpecialGimmickBg
    L2_2 = "building_nk_08_01"
    L3_3 = "building_nk_08"
    L1_1(L2_2, L3_3, L0_0)
  end
  L1_1 = bungua
  L2_2 = L1_1
  L1_1 = L1_1.findSubArea
  L3_3 = "bu_a_15"
  L1_1 = L1_1(L2_2, L3_3)
  if L1_1 then
    L2_2 = createSpecialGimmickBg
    L3_3 = "building_nk_01_01"
    L2_2 = L2_2(L3_3, "building_nk_01", L1_1)
    L3_3 = createGameObject2
    L3_3 = L3_3("GimmickBg")
    L3_3:setName("building_nk_01_fan_01")
    L3_3:setDrawModelName("building_nk_01_fan")
    L3_3:setAttributeName("building_nk_01_fan")
    L3_3:setCollisionName("building_nk_01_fan")
    L2_2:appendChild(L3_3)
    L3_3:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    L3_3:try_init()
    L3_3:waitForReadyAsync(function()
      L3_3:try_start()
    end)
  else
  end
end
