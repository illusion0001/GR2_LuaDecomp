dofile("/Game/Event2/Common/BgsetCommon.lua")
dofile("/Game/Event2/bgset/bg_mine_00_a_param.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
_evb_list = {
  "city_block_pi_d"
}
_eff_phase = 1
_request = {switch_area = nil}
function createArea()
  _mine = createGameObject2("Area")
  _mine:setName("pi_d_root")
  setAreaRootHandle("mine", _mine)
  _mine:setDriftParams(DRIFT_PARAM_MINE_00_A)
  _mine:setDriftInherit(true)
  _mine:setDriftEnable(false)
  _mine:setAreaGroup("pi00", true)
  _ship, _wall, _rudder, _lever = createCraneShipJir()
  _ship:setDriftEnable(false)
  _ship:setEffectiveness(false, true)
  setAreaRootHandle("ship", _ship)
  _cage_base, _cage, _wire = createCraneCage()
  _ship:appendChild(_cage_base)
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
  L0_0 = 920
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
      cage = {standby = true},
      gstm = {standby = true, run = true}
    })
  end
  setDriftParamsSubArea(_mine, DRIFT_SUBAREA_TBL_MINE_00_A, DRIFT_PARAM_SUBAREA_MINE_00_A)
  setDriftParamsUniqueArea(_mine, DRIFT_UNIQUE_AREA_TBL_MINE_00_A)
  invokeSystemTask(function()
    while not _exit_sandbox do
      if _request.switch_area ~= nil then
        switchArea(_request.switch_area)
        _request.switch_area = nil
      end
      wait()
    end
  end)
end
function requestBgSet(A0_3)
  local L1_4
  L1_4 = A0_3.switchArea
  if L1_4 ~= nil then
    L1_4 = _request
    L1_4.switch_area = A0_3.switchArea
  end
end
function switchArea(A0_5)
  local L1_6
  if A0_5 then
    L1_6 = _mine
    L1_6 = L1_6.getDescendant
    L1_6 = L1_6(L1_6, true)
    _mine:setEffectiveness(true, true)
    for _FORV_5_, _FORV_6_ in ipairs(L1_6) do
      _FORV_6_:setEffectiveness(true, true)
    end
  else
    L1_6 = _mine
    L1_6 = L1_6.getDescendant
    L1_6 = L1_6(L1_6, true)
    _mine:setEffectiveness(false, true)
    for _FORV_5_, _FORV_6_ in ipairs(L1_6) do
      _FORV_6_:setEffectiveness(false, true)
    end
  end
end
