import("GameDatabase")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/SystemScriptCommon2.lua")
dofile("/Game/Misc/gravity_storm.lua")
dofile("/Game/Misc/cage_controller.lua")
dofile("/Game/Misc/ship_controller.lua")
_exit_sandbox = false
_ship_ctrl = nil
_cage_ctrl = nil
_gstm_ctrl = nil
_setting_comp = false
_request_list = {}
_cage_status = false
_is_mine_root = false
function main()
  _ship_ctrl = ShipCtrl.create(g_own, mineManager)
  _cage_ctrl = Cage.create()
  _gstm_ctrl = GravityStorm.create()
  invokeTask(requestTask)
  invokeTask(switchMineArea)
  invokeSystemTask(debugDispState)
end
function exitsandbox()
  if _ship_ctrl then
    _ship_ctrl:reset()
  end
  if _cage_ctrl then
    _cage_ctrl:reset()
  end
  if _gstm_ctrl then
    _gstm_ctrl:reset()
  end
  _ship_ctrl = nil
  _cage_ctrl = nil
  _gstm_ctrl = nil
  _exit_sandbox = true
end
setExitCallback(exitsandbox)
function reset()
  __npc_list = {}
  __npc_task = {}
  _cage_status = false
  _is_mine_root = false
  if _ship_ctrl then
    _ship_ctrl:reset()
  end
  if _cage_ctrl then
    _cage_ctrl:reset()
  end
  if _gstm_ctrl then
    _gstm_ctrl:reset()
  end
end
function resetNpcTable()
  __npc_list = {}
  __npc_task = {}
  if _ship_ctrl then
    _ship_ctrl:_releaseCrewHandle()
  end
end
function switchMineArea()
  while true do
    if _gstm_ctrl and _gstm_ctrl:isRunning() then
      if _gstm_ctrl:getStormType() == "ef_ev_bkhole_01" then
        if _is_mine_root == true then
          bgManager:sendEvent("requestBgSet", {switchArea = false})
          _is_mine_root = false
          print(" - cs mng - mine area hide")
        end
      elseif _is_mine_root == false then
        bgManager:sendEvent("requestBgSet", {switchArea = true})
        _is_mine_root = true
        print(" - cs mng - mine area disp")
      end
    end
    wait()
  end
end
function setGameObjectHandle(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  _setting_comp = false
  invokeTask(function()
    _ship_ctrl:setObjectHandle(A0_0, A1_1, A2_2, A3_3)
    _cage_ctrl:setObjectHandle(A4_4, A5_5, A7_7, A8_8, A0_0, A10_10, A6_6)
    _gstm_ctrl:setObjectHandle(A9_9)
    _setting_comp = true
  end)
end
function setGameObjectHandle2(A0_11)
  _setting_comp = false
  invokeTask(function()
    _ship_ctrl:setObjectHandle(A0_11.ship, A0_11.wall, A0_11.rudder, A0_11.lever)
    _cage_ctrl:setObjectHandle(A0_11.cage_base, A0_11.cage, A0_11.area, A0_11.base_area_name, A0_11.ship, A0_11.cage_loc_name, A0_11.wire, A0_11.scene_param)
    _gstm_ctrl:setObjectHandle(A0_11.gate, A0_11.scene_param)
    _setting_comp = true
  end)
end
function craneOperationStart(A0_12, A1_13)
  if A1_13 then
    _gstm_ctrl:run(A0_12)
    if not A0_12 then
      _ship_ctrl:setCrewActive(true)
      _ship_ctrl:stormCameraShakeOn()
      _gstm_ctrl:readyStrom()
    end
    _cage_ctrl:catRidingCage()
    print(" - cs mng - wait cat cage in start")
    for _FORV_7_ = 1, 20 do
      if not ((_cage_ctrl.model:getNodeWorldPosRot("ve_cage_chara_position") - Fn_getCatPuppet():getWorldPos()):Length() < 0.5) then
        waitSeconds(0.1)
      end
    end
    print(" - cs mng - wait cat cage in end")
  end
  invokeTask(function()
    _ship_ctrl:markerInOut(false)
  end)
  _ship_ctrl:_craneOperation(false, A0_12)
end
function craneOperationEnd(A0_14, A1_15)
  if g_own:getGameObject("bgManager") then
    if A0_14 then
      g_own:getGameObject("bgManager"):sendEvent("requestBgSet", {pi_a_gate_sensor = true})
    else
      g_own:getGameObject("bgManager"):sendEvent("requestBgSet", {pi_a_gate_sensor = false})
    end
  end
  _ship_ctrl:_craneOperation(true, A0_14, A1_15)
  _ship_ctrl:showDigoutResult()
  _gstm_ctrl:stop()
  if not A0_14 then
    _ship_ctrl:setCrewActive(false)
    _ship_ctrl:stormCameraShakeOff()
  else
    _ship_ctrl:markerInOut(true)
  end
end
function cageInvisibleCollOff()
  _cage_ctrl:invisibleColltion(false)
end
function requestTask()
  while true do
    if #_request_list > 0 then
      repeat
        print(" - crane mng - request count :" .. #_request_list)
        while not _setting_comp do
          wait()
        end
        if _request_list[1].ship then
          _requestShip(_request_list[1].ship)
        end
        if _request_list[1].gstm then
          GameDatabase:set(ggd.CreneShipFlags__MiningInFlags, true)
          _requestGStorm(_request_list[1].gstm)
        end
        if _request_list[1].cage then
          _requestCage(_request_list[1].cage)
        end
        table.remove(_request_list, 1)
        wait()
      until #_request_list <= 0
    else
      wait()
    end
  end
end
function copyTable(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22
  L1_17 = {}
  for L5_21, L6_22 in L2_18(L3_19) do
    if type(L6_22) == "table" then
      L1_17[L5_21] = copyTable(L6_22)
    else
      L1_17[L5_21] = L6_22
    end
  end
  return L1_17
end
function request(A0_23)
  local L2_24
  L2_24 = table
  L2_24 = L2_24.insert
  L2_24(_request_list, copyTable(A0_23))
end
function _requestShip(A0_25)
  _ship_ctrl:waitAvailable()
  if A0_25.reset then
    _ship_ctrl:reset()
  end
  if A0_25.standby then
    _ship_ctrl:standby()
  end
  if A0_25.destination_id then
    _ship_ctrl:setDestinationId(A0_25.destination_id)
  end
  if A0_25.set_mine_storm then
    _ship_ctrl:setMineStrom(A0_25.set_mine_storm)
  end
  if A0_25.route then
    _ship_ctrl:setRoute(A0_25.route)
  end
  if A0_25.show_digout_result then
    _ship_ctrl:showDigoutResult()
  end
  if A0_25.marker_in then
    _ship_ctrl:markerInOut(true)
  end
  if A0_25.marker_out then
    _ship_ctrl:markerInOut(false, false)
  end
  if A0_25.crew_active ~= nil then
    _ship_ctrl:setCrewActive(A0_25.crew_active)
  end
  if A0_25.departure then
    _ship_ctrl:departure(A0_25.departure)
  end
  if A0_25.ready_return_to_port then
    _ship_ctrl:readyReturnToPort()
  end
  if A0_25.return_to_port then
    GameDatabase:set(ggd.CreneShipFlags__MiningInFlags, false)
    _ship_ctrl:returnToPort()
  end
end
function _requestCage(A0_26)
  _cage_ctrl:waitAvailable()
  if A0_26.standby then
    _cage_ctrl:standby()
  end
  if A0_26.append_ship ~= nil then
    _cage_ctrl:append(A0_26.append_ship)
  end
  if A0_26.set_mine_infinity then
    _cage_ctrl:setMoveFunc(craneOperationStart, craneOperationEnd)
    _cage_ctrl:setMineInfinity(A0_26.set_mine_infinity)
  end
  if A0_26.set_mine_storm then
    _cage_ctrl:setMoveFunc(craneOperationStart, craneOperationEnd)
    _cage_ctrl:setMineStrom(A0_26.set_mine_storm)
  end
  if A0_26.ship_func then
    _cage_ctrl:setMoveFunc(craneOperationStart, craneOperationEnd)
  end
  if A0_26.invisible_col ~= nil then
    _cage_ctrl:invisibleColltion(A0_26.invisible_col)
  end
  if A0_26.set_mov_param then
    _cage_ctrl:setMoveParam(A0_26.set_mov_param)
  end
  if A0_26.set_down ~= nil then
    _cage_ctrl:setDown(A0_26.set_down)
  end
  if A0_26.set_cage_out_sensor ~= nil then
    _cage_ctrl:setCageOutSensor(A0_26.set_cage_out_sensor)
  end
  if A0_26.warp_ship ~= nil and A0_26.warp_pos then
    _cage_ctrl:setWarpParam(A0_26.warp_ship, A0_26.warp_pos)
  end
  if A0_26.warp_move ~= nil then
    _cage_ctrl:setWarpMove(A0_26.warp_move)
  end
  if A0_26.warp then
    _cage_ctrl:warp()
  end
  if A0_26.set_player_in then
    _cage_ctrl:warpPlayerInSelf()
  end
  if A0_26.marker then
    if A0_26.move_skip_marker == true then
      if _cage_ctrl:isMoveEnd() then
      else
      end
    end
    if false and _cage_ctrl:setupMarker(false) then
      _cage_ctrl:makerInOut(true)
    end
  end
  if A0_26.move_skip ~= nil then
    _cage_ctrl:setMoveSkip(A0_26.move_skip)
  end
  if A0_26.set_skip_fadein then
    _cage_ctrl:setSkipFadein()
  end
  if A0_26.marker_in then
    _cage_ctrl:makerInOut(true)
  end
  if A0_26.switch_mine_wire then
    _cage_ctrl:switchMineWire(true)
  end
  if A0_26.move then
    _cage_ctrl:move(A0_26.is_player_in, A0_26.is_user_ctrl)
  end
  if A0_26.stop then
    _cage_ctrl:stop()
  end
end
function _requestGStorm(A0_27)
  if A0_27.gs_type then
    _gstm_ctrl:setGsType(A0_27.gs_type)
  end
  if A0_27.standby then
    _gstm_ctrl:standby(A0_27.cityblock)
    _cage_ctrl:addWire(_gstm_ctrl:getStormNode())
  end
  _gstm_ctrl:waitAvailable()
  if A0_27.set_mine_storm then
    _gstm_ctrl:setMineStrom(A0_27.set_mine_storm)
  end
  if A0_27.run then
    _gstm_ctrl:run()
  end
  if A0_27.stop then
    _gstm_ctrl:stop()
  end
  if A0_27.set_active ~= nil then
    _gstm_ctrl:setGsActive(A0_27.set_active)
  end
  if A0_27.set_mine_gate then
    _gstm_ctrl:setMineGate()
    if g_own:getGameObject("bgManager") then
      g_own:getGameObject("bgManager"):sendEvent("requestBgSet", {pi_a_gate_sensor = false})
    end
  end
  if A0_27.set_indoor_cat_warp then
    _gstm_ctrl:setIndoorCatWarpOn()
    if g_own:getGameObject("bgManager") then
      g_own:getGameObject("bgManager"):sendEvent("requestBgSet", {pi_a_gate_sensor = false})
    end
  end
  if A0_27.all_off then
    _gstm_ctrl:allOff()
  end
end
function getState(A0_28)
  if A0_28.ship then
    return _getShipState(A0_28.ship)
  end
  if A0_28.cage then
    return _getCageState(A0_28.cage)
  end
  if A0_28.gstm then
    return _getGstmState(A0_28.gstm)
  end
  return false
end
function _getShipState(A0_29)
  if A0_29.is_return_to_port_finish then
    return _ship_ctrl:isReturnToPortFinish()
  end
  if A0_29.is_ready_port then
    return _ship_ctrl:isReadyReturnToPort()
  end
  if A0_29.is_departure then
    return _ship_ctrl:isDeparture()
  end
  if A0_29.is_crew then
    return _ship_ctrl:isCrew()
  end
  return false
end
function _getCageState(A0_30)
  if A0_30.get_move_dist then
    return _cage_ctrl:getMovingDist()
  end
  if A0_30.get_handle then
    return _cage_ctrl:getModelHandle()
  end
  if A0_30.is_move_end then
    return _cage_ctrl:isMoveEnd()
  end
  if A0_30.is_skip then
    return _cage_ctrl:isSkip()
  end
  return false
end
function _getGstmState(A0_31)
  if A0_31.is_gate_in then
    return _gstm_ctrl:isStormIn()
  end
  if A0_31.is_running then
    return _gstm_ctrl:isRunning()
  end
  if A0_31.is_brack_hole then
    return _gstm_ctrl:isBrackHole()
  end
  if A0_31.is_indoor_catwarp then
    return _gstm_ctrl:getIndoorCatWarpActive()
  end
  return false
end
function getCageStatus()
  local L0_32, L1_33
  L0_32 = _cage_status
  return L0_32
end
_debug_disp_ship = false
_debug_disp_cage = 0
_debug_disp_strom = false
function debugDispState()
  local L0_34
  while true do
    L0_34 = _exit_sandbox
    if not L0_34 then
      L0_34 = 10
      if _debug_disp_ship then
        _ship_ctrl:debug(L0_34)
        L0_34 = L0_34 + 320
      end
      if _debug_disp_cage ~= 0 then
        _cage_ctrl:debug(L0_34, _debug_disp_cage)
        L0_34 = L0_34 + 320
      end
      if _debug_disp_strom then
        _gstm_ctrl:debug(L0_34)
      end
      wait()
    end
  end
end
g_customDebugMenu = {
  {
    name = "DebugDispShip",
    callback = function()
      local L1_35
      L1_35 = _debug_disp_ship
      L1_35 = not L1_35
      _debug_disp_ship = L1_35
    end
  },
  {
    name = "DebugDispCage",
    get = function()
      local L0_36, L1_37
      L0_36 = _debug_disp_cage
      return L0_36
    end,
    up = function()
      local L0_38, L1_39
      L0_38 = _debug_disp_cage
      L0_38 = L0_38 + 1
      _debug_disp_cage = L0_38
      L0_38 = _debug_disp_cage
      if L0_38 > 3 then
        _debug_disp_cage = 0
      end
    end,
    down = function()
      local L0_40, L1_41
      L0_40 = _debug_disp_cage
      L0_40 = L0_40 - 1
      _debug_disp_cage = L0_40
      L0_40 = _debug_disp_cage
      if L0_40 < 0 then
        _debug_disp_cage = 3
      end
    end
  },
  {
    name = "DebugDispStrom",
    callback = function()
      local L1_42
      L1_42 = _debug_disp_strom
      L1_42 = not L1_42
      _debug_disp_strom = L1_42
    end
  },
  {
    name = "DebugDispAllOn",
    callback = function()
      local L0_43, L1_44
      _debug_disp_ship = true
      _debug_disp_cage = 1
      _debug_disp_strom = true
    end
  },
  {
    name = "DebugDispAllOff",
    callback = function()
      local L0_45, L1_46
      _debug_disp_ship = false
      _debug_disp_cage = 0
      _debug_disp_strom = false
    end
  },
  {
    name = "case_max_speed",
    get = function()
      local L1_47
      L1_47 = _cage_ctrl
      L1_47 = L1_47.max_speed
      return L1_47
    end,
    up = function()
      local L1_48
      L1_48 = _cage_ctrl
      L1_48.max_speed = _cage_ctrl.max_speed + 0.1
    end,
    down = function()
      local L0_49, L1_50
      L0_49 = _cage_ctrl
      L1_50 = _cage_ctrl
      L1_50 = L1_50.max_speed
      L1_50 = L1_50 - 0.1
      L0_49.max_speed = L1_50
      L0_49 = _cage_ctrl
      L0_49 = L0_49.max_speed
      if L0_49 < 0.5 then
        L0_49 = _cage_ctrl
        L0_49.max_speed = 0.5
      end
    end
  },
  {
    name = "case_acceleration_time",
    get = function()
      local L1_51
      L1_51 = _cage_ctrl
      L1_51 = L1_51.acceleration_time
      return L1_51
    end,
    up = function()
      local L1_52
      L1_52 = _cage_ctrl
      L1_52.acceleration_time = _cage_ctrl.acceleration_time + 0.1
    end,
    down = function()
      local L0_53, L1_54
      L0_53 = _cage_ctrl
      L1_54 = _cage_ctrl
      L1_54 = L1_54.acceleration_time
      L1_54 = L1_54 - 0.1
      L0_53.acceleration_time = L1_54
      L0_53 = _cage_ctrl
      L0_53 = L0_53.acceleration_time
      if L0_53 <= 0 then
        L0_53 = _cage_ctrl
        L0_53.acceleration_time = 0
      end
    end
  },
  {
    name = "case_deceleration_time",
    get = function()
      local L1_55
      L1_55 = _cage_ctrl
      L1_55 = L1_55.deceleration_time
      return L1_55
    end,
    up = function()
      local L1_56
      L1_56 = _cage_ctrl
      L1_56.deceleration_time = _cage_ctrl.deceleration_time + 0.1
    end,
    down = function()
      local L0_57, L1_58
      L0_57 = _cage_ctrl
      L1_58 = _cage_ctrl
      L1_58 = L1_58.deceleration_time
      L1_58 = L1_58 - 0.1
      L0_57.deceleration_time = L1_58
      L0_57 = _cage_ctrl
      L0_57 = L0_57.deceleration_time
      if L0_57 <= 0 then
        L0_57 = _cage_ctrl
        L0_57.deceleration_time = 0
      end
    end
  },
  {
    name = "cage_status",
    get = function()
      local L0_59, L1_60
      L0_59 = _cage_status
      return L0_59
    end,
    up = function()
      local L1_61
      L1_61 = _cage_status
      L1_61 = not L1_61
      _cage_status = L1_61
    end,
    down = function()
      local L1_62
      L1_62 = _cage_status
      L1_62 = not L1_62
      _cage_status = L1_62
    end
  },
  {
    name = "setting_complite",
    get = function()
      local L0_63, L1_64
      L0_63 = _setting_comp
      return L0_63
    end,
    up = function()
      local L0_65, L1_66
    end,
    down = function()
      local L0_67, L1_68
    end
  }
}
