dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm39_common.lua")
import("Vehicle")
_staff_bg_tbl = {}
_is_in_sensor = {}
_is_out_of_range = false
_shipWork = nil
_staff_ship_move_task = nil
PHASE_START = 1
PHASE_SHIP_01 = 2
PHASE_SHIP_02 = 3
PHASE_SHIP_03 = 4
PHASE_SHIP_04 = 5
PHASE_SHIP_05 = 6
PHASE_END = 7
_player_motion_table = {
  glad_in_01 = "kit01_glad_in_01",
  glad_01 = "kit01_glad_01"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = {
    L1_1,
    L2_2,
    L3_3
  }
  L1_1.name = "sm39_director_01"
  L1_1.type = "man18"
  L1_1.node = "locator2_director_01"
  L1_1.active = false
  L2_2.name = "sm39_assistant_01"
  L2_2.type = "man17"
  L2_2.node = "locator2_assistant_01"
  L2_2.active = false
  L3_3.name = "sm39_assi_wom_01"
  L3_3.type = "wom01"
  L3_3.node = "locator2_assi_wom_01"
  L3_3.active = false
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  for L4_4 = PHASE_START, PHASE_END do
    L5_5 = _is_in_sensor
    L5_5[L4_4] = false
  end
  for L5_5, L6_6 in L2_2(L3_3) do
    if findGameObject2("GimmickBg", L6_6) then
      findGameObject2("GimmickBg", L6_6):setVisiblePermission(false)
      _staff_bg_tbl[L6_6] = findGameObject2("GimmickBg", L6_6)
    end
  end
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3, L4_4)
end
function Ingame()
  Fn_userCtrlOff()
  Fn_disableCostumeChange(true)
  while Player:getPuppet():isLoading() do
    wait()
  end
  Fn_loadPlayerMotion(_player_motion_table)
  scene3Main()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _shipWork then
    if _shipWork.mainTask then
      _shipWork.mainTask:abort()
      _shipWork.mainTask = nil
    end
    _shipWork = nil
  end
  if staff_ship_move_task ~= nil then
    staff_ship_move_task:abort()
    staff_ship_move_task = nil
  end
  Fn_disableCostumeChange(false)
end
function scene3Main()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L0_7(L1_8, L2_9)
  L3_10 = false
  L0_7(L1_8, L2_9, L3_10)
  L3_10 = false
  L0_7(L1_8, L2_9, L3_10)
  L3_10 = false
  L0_7(L1_8, L2_9, L3_10)
  for L3_10, L4_11 in L0_7(L1_8) do
    L6_13 = L4_11
    L5_12 = L4_11.setVisiblePermission
    L5_12(L6_13, true)
  end
  L3_10 = "locator2_scene3_staff_ship_01"
  L4_11 = "locator2_scene3_staff_ship_02"
  L5_12 = 3.01
  L3_10 = Player
  L3_10 = L3_10.kEnergy_Life
  L4_11 = Player
  L5_12 = L4_11
  L4_11 = L4_11.getEnergyMax
  L6_13 = Player
  L6_13 = L6_13.kEnergy_Life
  L6_13 = L4_11(L5_12, L6_13)
  L1_8(L2_9, L3_10, L4_11, L5_12, L6_13, L4_11(L5_12, L6_13))
  L3_10 = true
  L1_8(L2_9, L3_10)
  L3_10 = true
  L1_8(L2_9, L3_10)
  L3_10 = true
  L1_8(L2_9, L3_10)
  L1_8()
  L1_8()
  L1_8(L2_9)
  _staff_ship_move_task = L1_8
  L1_8(L2_9)
  L1_8(L2_9)
  L1_8(L2_9)
  L1_8(L2_9)
  L3_10 = "sm39_02011"
  L4_11 = "sm39_02012"
  L5_12 = "sm39_02013"
  L3_10 = 1
  while true do
    L4_11 = "locator2_scene3_range_sensor_"
    L5_12 = string
    L5_12 = L5_12.format
    L6_13 = "%02d"
    L5_12 = L5_12(L6_13, L3_10)
    L4_11 = L4_11 .. L5_12
    L5_12 = findGameObject2
    L6_13 = "Node"
    L5_12 = L5_12(L6_13, L4_11)
    if L5_12 ~= nil then
      L5_12 = {}
      L6_13 = "pccubesensor2_scene3_land_"
      L6_13 = L6_13 .. string.format("%02d", L3_10)
      L5_12.land_sensor = L6_13
      L5_12.range_sensor_node = L4_11
      L6_13 = Vector
      L6_13 = L6_13(3.5, 1, 10.5)
      L5_12.range_sensor_scale = L6_13
      L5_12.is_set_pos = false
      L6_13 = L1_8[L3_10]
      L5_12.caption = L6_13
      L2_9[L3_10] = L5_12
      L3_10 = L3_10 + 1
    end
  end
  L4_11 = {}
  L4_11.land_sensor = "pcspheresensor2_scene3_land_end"
  L4_11.range_sensor_node = "locator2_scene3_range_sensor_end"
  L5_12 = Vector
  L6_13 = 7
  L5_12 = L5_12(L6_13, 1, 7)
  L4_11.range_sensor_scale = L5_12
  L4_11.is_set_pos = true
  L4_11.caption = nil
  L2_9[L3_10] = L4_11
  L4_11 = #L2_9
  function L5_12()
    Player:setStay(true)
    PlaySeFailure()
    Fn_kaiwaDemoView("sm39_01100k")
    Fn_blackout()
    Fn_resetPcPos("warppoint2_scene3_pc_02")
    if _staff_ship_move_task ~= nil then
      _staff_ship_move_task:abort()
      _staff_ship_move_task = nil
      ResetPosShipWork(L0_7)
    end
    _shipWork:ResetShip()
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    wait()
    _shipWork:StartShip()
    _staff_ship_move_task = StartShipWorkInvokeTask(L0_7)
    Fn_fadein()
  end
  function L6_13()
    local L0_14, L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23
    L0_14 = RAC_infoView
    L1_15 = "sm39_info_03"
    L0_14(L1_15)
    L0_14 = Fn_missionView
    L1_15 = "sm39_02001"
    L0_14(L1_15)
    L0_14 = RAC_countDownVoice
    L0_14()
    L0_14 = Fn_captionView
    L1_15 = "sm39_02014"
    L0_14(L1_15)
    L0_14 = Player
    L1_15 = L0_14
    L0_14 = L0_14.setStay
    L2_16 = false
    L0_14(L1_15, L2_16)
    L0_14 = Fn_userCtrlOn
    L0_14()
    L0_14 = Fn_userCtrlGravityOff
    L0_14()
    L0_14, L1_15 = nil, nil
    function L2_16()
      Fn_naviKill()
      Fn_captionViewEnd()
      if L0_14 then
        L0_14:abort()
        L0_14 = nil
      end
      if L1_15 then
        L1_15:try_term()
        L1_15 = nil
      end
    end
    _is_out_of_range = false
    for L6_20 = 1, L4_18 - 1 do
      L7_21 = findGameObject2
      L8_22 = "Node"
      L9_23 = L2_9[L6_20]
      L9_23 = L9_23.range_sensor_node
      L7_21 = L7_21(L8_22, L9_23)
      L8_22 = GetShipHandle
      L9_23 = L6_20
      L8_22 = L8_22(L9_23)
      L9_23 = L8_22
      L8_22 = L8_22.appendChild
      L8_22(L9_23, L7_21, true)
      L8_22 = findGameObject2
      L9_23 = "PlayerSensor"
      L8_22 = L8_22(L9_23, L2_9[L6_20].land_sensor)
      L9_23 = GetShipHandle
      L9_23 = L9_23(L6_20)
      L9_23 = L9_23.appendChild
      L9_23(L9_23, L8_22)
      L9_23 = Vector
      L9_23 = L9_23(0, 4, -1)
      L8_22:setPos(L9_23)
    end
    L3_17[L4_18] = true
    L3_17(L4_18)
    for L6_20 = 1, L4_11 do
      L7_21 = _is_in_sensor
      L8_22 = L6_20 + 1
      L7_21[L8_22] = false
      L7_21 = Fn_pcSensorOn
      L8_22 = L2_9[L6_20]
      L8_22 = L8_22.land_sensor
      L7_21(L8_22)
    end
    for L7_21 = 1, L4_11 do
      L8_22 = L4_11
      if L7_21 == L8_22 then
        L8_22 = Fn_captionView
        L9_23 = "sm39_02002"
        L8_22(L9_23, 0)
      end
      L8_22 = L4_11
      if L7_21 == L8_22 then
        L8_22 = createRangeMarker
        L9_23 = L2_9[L7_21]
        L9_23 = L9_23.range_sensor_node
        L8_22 = L8_22(L9_23, L2_9[L7_21].range_sensor_scale, L2_9[L7_21].is_set_pos)
        L1_15 = L8_22
      end
      L8_22 = Fn_naviSet
      L9_23 = findGameObject2
      L9_23 = L9_23("PlayerSensor", L2_9[L7_21].land_sensor)
      L8_22(L9_23, L9_23("PlayerSensor", L2_9[L7_21].land_sensor))
      L8_22 = invokeTask
      function L9_23()
        local L0_24
        L0_24 = findGameObject2
        L0_24 = L0_24("PlayerSensor", L2_9[L7_21].land_sensor)
        while L2_9[L7_21] == nil or not (Fn_getPlayerWorldPos().y <= L0_24:getWorldPos().y - 3) and not (Fn_getDistanceToPlayer(L0_24) > 90) do
          wait()
        end
        _is_out_of_range = true
      end
      L8_22 = L8_22(L9_23)
      L0_14 = L8_22
      while true do
        L8_22 = _is_in_sensor
        L8_22 = L8_22[L7_21]
        L8_22 = L8_22 and _is_out_of_range
        if not L8_22 then
          L8_22 = wait
          L8_22()
        end
      end
      L8_22 = _is_out_of_range
      if L8_22 then
        L8_22 = L2_16
        L8_22()
        break
      end
      while true do
        L8_22 = Player
        L9_23 = L8_22
        L8_22 = L8_22.getUnderfootObject
        L8_22 = L8_22(L9_23)
        if L8_22 == nil then
          L8_22 = _is_out_of_range
        end
        if not L8_22 then
          L8_22 = wait
          L8_22()
        end
      end
      L8_22 = Fn_naviKill
      L8_22()
      L8_22 = Fn_captionViewEnd
      L8_22()
      L8_22 = _is_out_of_range
      if L8_22 then
        L8_22 = L2_16
        L8_22()
        break
      end
      L8_22 = _is_in_sensor
      L9_23 = L7_21 + 1
      L8_22 = L8_22[L9_23]
      if L8_22 then
        L8_22 = L4_11
        if L7_21 == L8_22 then
          L8_22 = Player
          L8_22 = L8_22.getAction
          L8_22 = L8_22()
          L9_23 = Player
          L9_23 = L9_23.kAction_Breakfall
          if L8_22 == L9_23 then
          else
            L8_22 = print
            L9_23 = "\229\164\177\230\149\151\239\188\154\229\143\151\227\129\145\232\186\171\229\164\177\230\149\151"
            L8_22(L9_23)
          end
        else
        end
      else
      end
      L8_22 = L4_11
      if L7_21 == L8_22 then
        L8_22 = Fn_userCtrlOff
        L8_22()
        while true do
          L8_22 = Player
          L9_23 = L8_22
          L8_22 = L8_22.getAction
          L8_22 = L8_22(L9_23)
          L9_23 = Player
          L9_23 = L9_23.kAction_Idle
          if L8_22 ~= L9_23 then
            L8_22 = _is_out_of_range
          end
          if not L8_22 then
            L8_22 = wait
            L8_22()
          end
        end
        L8_22 = _is_out_of_range
        if L8_22 then
          L8_22 = L2_16
          L8_22()
          break
        end
      end
      L8_22 = invokeTask
      L9_23 = waitSeconds
      L8_22 = L8_22(L9_23, 0.1)
      while true do
        L9_23 = L8_22.isRunning
        L9_23 = L9_23(L8_22)
        L9_23 = L9_23 and _is_out_of_range
        if not L9_23 then
          L9_23 = wait
          L9_23()
        end
      end
      L9_23 = L8_22.abort
      L9_23(L8_22)
      L8_22 = nil
      if L1_15 then
        L9_23 = L1_15.try_term
        L9_23(L1_15)
        L1_15 = nil
      end
      if L0_14 then
        L9_23 = L0_14.abort
        L9_23(L0_14)
        L0_14 = nil
      end
      if L3_17 then
        L9_23 = _is_out_of_range
      elseif L9_23 then
        L9_23 = L2_16
        L9_23()
        break
      end
      L9_23 = L2_9[L7_21]
      L9_23 = L9_23.caption
      if L9_23 then
        L9_23 = Fn_captionView
        L9_23(L2_9[L7_21].caption)
      else
      end
    end
    L4_18(L5_19)
    L4_18[L5_19] = false
    for L7_21 = 1, L4_11 do
      L8_22 = Fn_pcSensorOff
      L9_23 = L2_9[L7_21]
      L9_23 = L9_23.land_sensor
      L8_22(L9_23)
      L8_22 = _is_in_sensor
      L9_23 = L7_21 + 1
      L8_22[L9_23] = false
    end
    if L3_17 then
    elseif L4_18 then
      L4_18()
      return L4_18
    end
    return L4_18
  end
  while true do
    if L6_13() == false then
    end
  end
  Fn_setBgmPoint("event", "battle_end")
  PcAppeal(_player_motion_table.glad_in_01, _player_motion_table.glad_01)
  Fn_kaiwaDemoView("sm39_01000k")
  Fn_blackout()
  for _FORV_10_, _FORV_11_ in pairs(_staff_bg_tbl) do
    _FORV_11_:setVisiblePermission(false)
  end
end
function GetShipHandle(A0_25)
  local L1_26
  L1_26 = _shipWork
  if L1_26 == nil then
    L1_26 = nil
    return L1_26
  end
  L1_26 = _shipWork
  L1_26 = L1_26.ships
  L1_26 = L1_26[A0_25]
  if L1_26 == nil then
    L1_26 = nil
    return L1_26
  end
  L1_26 = _shipWork
  L1_26 = L1_26.ships
  L1_26 = L1_26[A0_25]
  L1_26 = L1_26.ship
  return L1_26
end
function CreateShipInvokeTask()
  local L0_27
  L0_27 = _shipWork
  if L0_27 then
    return
  end
  L0_27 = {}
  _shipWork = L0_27
  L0_27 = _shipWork
  L0_27.ships = {}
  L0_27 = _shipWork
  L0_27.isShipStart = false
  L0_27 = _shipWork
  L0_27.isShipReset = false
  L0_27 = _shipWork
  function L0_27.StartShip(A0_28)
    local L1_29
    A0_28.isShipStart = true
  end
  L0_27 = _shipWork
  function L0_27.ResetShip(A0_30)
    local L1_31
    A0_30.isShipReset = true
  end
  L0_27 = _shipWork
  L0_27.mainTask = invokeTask(function()
    local L0_32, L1_33
    L0_32 = 1
    while true do
      while true do
        L1_33(_shipWork.ships[L0_32])
        _shipWork.ships[L0_32] = InitializeShipWork("BusHexL04", L1_33, L1_33 .. "_01", L1_33 .. "_02", 3.01)
        if findGameObject2("Node", L1_33 .. "_01") ~= nil then
          L0_32 = L0_32 + 1
        end
      end
    end
    while true do
      repeat
        L1_33.isShipReset = false
        L1_33.isShipStart = false
        for _FORV_4_, _FORV_5_ in L1_33(_shipWork.ships) do
          _FORV_5_.ship:setBaseSpeed(0)
          _FORV_5_.ship:setCurrSpeed(0)
          _FORV_5_.ship:setWorldTransform(_FORV_5_.pos_route_tbl[1], _FORV_5_.startPosNode:getWorldRot())
        end
        while true do
          if not L1_33 then
            L1_33()
          end
        end
        for _FORV_4_, _FORV_5_ in L1_33(_shipWork.ships) do
          _FORV_5_.ship:setBaseSpeed(_FORV_5_.speed)
        end
        while true do
          L1_33()
        end
      until not L1_33
    end
  end)
end
function createRangeMarker(A0_34, A1_35, A2_36)
  local L3_37, L4_38, L5_39, L6_40
  L3_37 = findGameObject2
  L4_38 = "Node"
  L5_39 = A0_34
  L3_37 = L3_37(L4_38, L5_39)
  L4_38 = nil
  if A2_36 then
    L6_40 = L3_37
    L5_39 = L3_37.getWorldTransform
    L6_40 = L5_39(L6_40)
    L4_38 = RAC_createGameObject2("range_maker", "MapMarker", L5_39, L6_40)
  else
    L5_39 = RAC_createGameObject2
    L6_40 = "range_maker"
    L5_39 = L5_39(L6_40, "MapMarker")
    L4_38 = L5_39
  end
  L6_40 = L4_38
  L5_39 = L4_38.setAssetName
  L5_39(L6_40, "gui_marker_30")
  L6_40 = L4_38
  L5_39 = L4_38.setupPattern
  L5_39(L6_40, "C", A1_35)
  L6_40 = L4_38
  L5_39 = L4_38.setActive
  L5_39(L6_40, true)
  L5_39 = start_game_obj
  L5_39()
  return L4_38
end
function pcspheresensor2_scene3_start_OnEnter()
  _is_in_sensor[PHASE_START] = true
end
function pcspheresensor2_scene3_start_OnLeave()
  _is_in_sensor[PHASE_START] = false
end
function pccubesensor2_scene3_land_01_OnEnter()
  _is_in_sensor[PHASE_SHIP_01] = true
end
function pccubesensor2_scene3_land_01_OnLeave()
  _is_in_sensor[PHASE_SHIP_01] = false
end
function pccubesensor2_scene3_land_02_OnEnter()
  _is_in_sensor[PHASE_SHIP_02] = true
end
function pccubesensor2_scene3_land_02_OnLeave()
  _is_in_sensor[PHASE_SHIP_02] = false
end
function pccubesensor2_scene3_land_03_OnEnter()
  _is_in_sensor[PHASE_SHIP_03] = true
end
function pccubesensor2_scene3_land_03_OnLeave()
  _is_in_sensor[PHASE_SHIP_03] = false
end
function pccubesensor2_scene3_land_04_OnEnter()
  _is_in_sensor[PHASE_SHIP_04] = true
end
function pccubesensor2_scene3_land_04_OnLeave()
  _is_in_sensor[PHASE_SHIP_04] = false
end
function pccubesensor2_scene3_land_05_OnEnter()
  _is_in_sensor[PHASE_SHIP_05] = true
end
function pccubesensor2_scene3_land_05_OnLeave()
  _is_in_sensor[PHASE_SHIP_05] = false
end
function pcspheresensor2_scene3_land_end_OnEnter()
  _is_in_sensor[PHASE_END] = true
end
function pcspheresensor2_scene3_land_end_OnLeave()
  _is_in_sensor[PHASE_END] = false
end
function pccubesensor2_scene3_out_OnEnter()
  local L0_41, L1_42
  _is_out_of_range = false
end
function pccubesensor2_scene3_out_OnLeave()
  local L0_43, L1_44
  _is_out_of_range = true
end
