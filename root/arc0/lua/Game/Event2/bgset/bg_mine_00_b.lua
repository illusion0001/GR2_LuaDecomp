dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_mine_00_b_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
_evb_list = {
  "city_block_pi_c"
}
function createArea()
  _mine = createGameObject2("Area")
  _mine:setName("pi_c_root")
  setAreaRootHandle("mine", _mine)
  _mine:setDriftParams(DRIFT_PARAM_MINE_00_B)
  _mine:setDriftInherit(true)
  _mine:setDriftEnable(false)
  _mine:setAreaGroup("pi00", true)
  _ship, _wall, _rudder, _lever = createCraneShipJir()
  _ship:setDriftEnable(false)
  _ship:setEffectiveness(false, true)
  setAreaRootHandle("ship", _ship)
  _cage_base, _cage, _wire = createCraneCage()
end
function setAreaDetail()
  local L0_0, L1_1, L2_2
  L0_0 = wireBind
  L1_1 = _cage
  L2_2 = _wire
  L0_0(L1_1, L2_2, _ship, "wire_nk_01")
  L0_0 = wait
  L0_0()
  L0_0 = warpShipObject
  L1_1 = _ship
  L2_2 = _cage_base
  L0_0(L1_1, L2_2, _rudder, _lever)
  L0_0 = 1050
  L1_1 = warpShipStartPos
  L2_2 = _ship
  L1_1 = L1_1(L2_2, _mine, "pi_a_22", "pi_a_22_ve_cage_02", L0_0)
  L2_2 = createGameObject2
  L2_2 = L2_2("Node")
  L2_2:setName("dmy_pi_a_gate")
  L2_2:try_init()
  L2_2:waitForReady()
  L2_2:try_start()
  L2_2:setPos(L1_1 + Vector(0, L0_0, 0))
  L2_2:setForceMove()
  if Fn_getGameObject("craneShipManager") then
    Fn_getGameObject("craneShipManager"):sendEvent("setGameObjectHandle", _ship, _wall, _rudder, _lever, _cage_base, _cage, _wire, _mine, "pi_a_22", L2_2, "pi_a_22_ve_cage_02")
    Fn_getGameObject("craneShipManager"):sendEvent("request", {
      cage = {standby = true, warp_goal = true}
    })
  end
  setDriftParamsSubArea(_mine, DRIFT_SUBAREA_TBL_MINE_00_B, DRIFT_PARAM_SUBAREA_MINE_00_B)
  setDriftParamsUniqueArea(_mine, DRIFT_UNIQUE_AREA_TBL_MINE_00_B)
end
function createEffect(A0_3, A1_4)
  local L2_5
  L2_5 = createGameObject2
  L2_5 = L2_5("Effect")
  L2_5:setName(A0_3)
  L2_5:setModelName(A0_3)
  A1_4:appendChild(L2_5)
  L2_5:try_init()
  L2_5:waitForReady()
  L2_5:try_start()
  L2_5:setActive(false)
  L2_5:setLoop(true)
  L2_5:play()
  return L2_5
end
