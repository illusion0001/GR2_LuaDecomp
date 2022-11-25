dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Misc/photo.lua")
dofile("/Game/Mob/mob_event_util.lua")
import("Vehicle")
VEHICLE_DAMAGE_MAX_COUNT = 4
VEHICLE_RIDE_FAILED_SECONDS = 20
VEHICLE_MOVE_SPEED_RIDE = 3.06
VEHICLE_MOVE_SPEED = 4.86
PHOTO_HINT_DISP_SEC_FIRST = 30
PHOTO_HINT_INTERVAL_SEC = 10
_puppet_tbl = {}
_vehicle_hdl = nil
_is_in_sensor = false
_vehicle_is_in_sensor = false
_is_in_shortcut_sensor = false
_is_in_hint_sensor = {}
_sdemo = nil
_is_out_of_range = false
_is_out_of_range2 = false
_is_ride_ship = false
_vehicle_engine_se_handle = nil
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = {
    L1_1,
    L2_2,
    {
      name = "sm40_clerk",
      type = "man64",
      node = "locator2_clerk_01",
      active = false
    }
  }
  L1_1.name = "sm40_gmom"
  L1_1.type = "wom43"
  L1_1.node = "locator2_gmom_01"
  L1_1.active = false
  L2_2.name = "sm40_captain"
  L2_2.type = "man09"
  L2_2.node = "locator2_captain_01"
  L2_2.active = false
  L1_1(L2_2)
  for _FORV_4_, _FORV_5_ in L1_1(L2_2) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L2_2:setModelName("sagashi_a_01")
  L1_1:appendChild(L2_2)
  _sdemo = L1_1
  L1_1(L2_2, true)
end
function Ingame()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14
  L0_3 = Fn_userCtrlOff
  L0_3()
  L0_3 = Camera
  L1_4 = L0_3
  L0_3 = L0_3.setControl
  L2_5 = Camera
  L2_5 = L2_5.kPlayer
  L3_6 = Camera
  L3_6 = L3_6.kControl_All
  L4_7 = false
  L0_3(L1_4, L2_5, L3_6, L4_7)
  L0_3 = Fn_setCatWarpCheckPoint
  L1_4 = "locator2_pc_start_pos"
  L0_3(L1_4)
  L0_3 = Fn_setNpcActive
  L1_4 = "sm40_gmom"
  L2_5 = true
  L0_3(L1_4, L2_5)
  L0_3 = Fn_setNpcActive
  L1_4 = "sm40_captain"
  L2_5 = true
  L0_3(L1_4, L2_5)
  L0_3 = Fn_setNpcActive
  L1_4 = "sm40_clerk"
  L2_5 = true
  L0_3(L1_4, L2_5)
  L0_3 = initVehicle
  L0_3()
  L0_3 = _vehicle_hdl
  L1_4 = L0_3
  L0_3 = L0_3.getVehicle
  L0_3 = L0_3(L1_4)
  L2_5 = L0_3
  L1_4 = L0_3.procHorn
  L3_6 = false
  L1_4(L2_5, L3_6)
  L2_5 = L0_3
  L1_4 = L0_3.procFloat
  L3_6 = false
  L1_4(L2_5, L3_6)
  L1_4 = findGameObject2
  L2_5 = "Node"
  L3_6 = "locator2_navi_vehicle_01"
  L1_4 = L1_4(L2_5, L3_6)
  L3_6 = L0_3
  L2_5 = L0_3.appendChild
  L4_7 = L1_4
  L2_5(L3_6, L4_7, L5_8)
  L2_5 = findGameObject2
  L3_6 = "PlayerSensor"
  L4_7 = "pccubesensormulti2_vehicle_damage_success_01"
  L2_5 = L2_5(L3_6, L4_7)
  L4_7 = L0_3
  L3_6 = L0_3.appendChild
  L3_6(L4_7, L5_8, L6_9)
  L3_6 = Fn_createGimmickBg
  L4_7 = L1_4
  L3_6 = L3_6(L4_7, L5_8, L6_9)
  L4_7 = L3_6.setLockonPermission
  L4_7(L5_8, L6_9)
  L4_7 = L0_3.appendChild
  L4_7(L5_8, L6_9, L7_10)
  L4_7 = findGameObject2
  L4_7 = L4_7(L5_8, L6_9)
  L5_8(L6_9, L7_10, L8_11)
  L6_9(L7_10, L8_11, L9_12)
  L7_10(L8_11, L9_12, L10_13)
  L1_4 = invokeVehicleRotFixTask
  L1_4 = L1_4()
  L2_5 = Fn_playMotionNpc
  L3_6 = "sm40_captain"
  L4_7 = "trouble_00"
  L2_5(L3_6, L4_7, L5_8)
  L2_5 = Fn_missionStart
  L2_5()
  L2_5 = Fn_kaiwaDemoView
  L3_6 = "sm40_00700k"
  L2_5(L3_6)
  L2_5 = Sound
  L3_6 = L2_5
  L2_5 = L2_5.playSE
  L4_7 = "obj_cranehead_drop"
  L2_5(L3_6, L4_7, L5_8)
  L2_5 = waitSeconds
  L3_6 = 0.3
  L2_5(L3_6)
  L2_5 = Sound
  L3_6 = L2_5
  L2_5 = L2_5.playSE
  L4_7 = "obj_cranehead_drop"
  L2_5(L3_6, L4_7, L5_8)
  L2_5 = waitSeconds
  L3_6 = 0.5
  L2_5(L3_6)
  L2_5 = Sound
  L3_6 = L2_5
  L2_5 = L2_5.playSE
  L4_7 = "m31_913a"
  L2_5(L3_6, L4_7, L5_8, L6_9, L7_10)
  L2_5 = waitSeconds
  L3_6 = 1
  L2_5(L3_6)
  L2_5 = Fn_captionView
  L3_6 = "sm40_02000"
  L2_5(L3_6)
  L2_5 = RAC_LookAtObjectWait
  L3_6 = L0_3
  L4_7 = 1
  L2_5(L3_6, L4_7, L5_8)
  L2_5 = Camera
  L3_6 = L2_5
  L2_5 = L2_5.setControl
  L4_7 = Camera
  L4_7 = L4_7.kPlayer
  L2_5(L3_6, L4_7, L5_8, L6_9)
  L2_5 = Fn_pcSensorOn
  L3_6 = "pccubesensor2_vehicle_attack_out_01"
  L2_5(L3_6)
  L2_5 = Fn_userCtrlOn
  L2_5()
  L2_5 = invokeMoveDeactiveTask
  L3_6 = "sm40_gmom"
  L4_7 = "locator2_gmom_move_"
  L2_5 = L2_5(L3_6, L4_7, L5_8)
  L3_6 = Fn_naviSet
  L4_7 = _puppet_tbl
  L4_7 = L4_7.sm40_captain
  L3_6(L4_7)
  _is_in_sensor = false
  L3_6 = Fn_pcSensorOn
  L4_7 = "pccubesensor2_captain_01"
  L3_6(L4_7)
  while true do
    L3_6 = _is_in_sensor
    if L3_6 == false then
      L3_6 = wait
      L3_6()
    end
  end
  L3_6 = Fn_pcSensorOff
  L4_7 = "pccubesensor2_captain_01"
  L3_6(L4_7)
  _is_in_sensor = false
  L3_6 = Fn_naviKill
  L3_6()
  L3_6 = Fn_kaiwaDemoView
  L4_7 = "sm40_00900k"
  L3_6(L4_7)
  function L3_6()
    local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20
    _is_in_sensor = false
    L0_15 = Fn_pcSensorOn
    L1_16 = "pccubesensormulti2_vehicle_damage_success_01"
    L0_15(L1_16)
    L0_15 = {
      L1_16,
      L2_17,
      L3_18
    }
    L1_16 = {}
    L1_16.caption = "sm40_02001"
    L1_16.se_name = "m30_016"
    L2_17 = _puppet_tbl
    L2_17 = L2_17.sm40_captain
    L1_16.se_target = L2_17
    L2_17 = {}
    L2_17.caption = "sm40_02002"
    L2_17.se_name = "m30_016"
    L3_18 = _puppet_tbl
    L3_18 = L3_18.sm40_captain
    L2_17.se_target = L3_18
    L3_18 = {}
    L3_18.caption = "sm40_02003"
    L3_18.se_name = "kit_608"
    L4_19 = Fn_getPlayer
    L4_19 = L4_19()
    L3_18.se_target = L4_19
    L1_16 = 0
    L2_17 = 0
    L3_18 = L0_3
    L4_19 = L3_18
    L3_18 = L3_18.setCallback
    L3_18(L4_19, L5_20)
    L3_18 = RAC_missionNaviCaption
    L4_19 = "sm40_02006"
    L3_18 = L3_18(L4_19, L5_20, nil)
    while true do
      L4_19 = VEHICLE_DAMAGE_MAX_COUNT
      if L2_17 < L4_19 then
        L4_19 = restart
      end
      if L4_19 ~= true then
        L4_19 = math
        L4_19 = L4_19.max
        L4_19 = L4_19(L5_20, 0)
        L1_16 = L4_19
        L4_19 = wait
        L4_19()
      end
    end
    L4_19 = L3_18.abort
    L4_19(L5_20)
    L3_18 = nil
    L4_19 = Fn_naviKill
    L4_19()
    L4_19 = L0_3
    L4_19 = L4_19.setCallback
    L4_19(L5_20, function()
      local L0_21, L1_22
    end)
    L4_19 = Fn_pcSensorOff
    L4_19(L5_20)
    _is_in_sensor = false
    L4_19 = restart
    if L4_19 == true then
      L4_19 = Player
      L4_19 = L4_19.setStay
      L4_19(L5_20, true)
      L4_19 = {}
      table.insert(L4_19, RAC_createEffect({
        eff_name = "ef_com_exp_02",
        pos_node = L5_20,
        loop = false,
        time = 3
      }))
      table.insert(L4_19, RAC_createEffect({
        eff_name = "ef_ev_smk_01",
        pos_node = L5_20,
        loop = true
      }))
      Sound:playSE("ef_ev_exp_01", 1, "", L5_20)
      table.insert(L4_19, RAC_createEffect({
        eff_name = "ef_com_exp_02",
        pos_node = L5_20,
        loop = false,
        time = 3
      }))
      Sound:playSE("ef_ev_exp_01", 1, "", L5_20)
      table.insert(L4_19, RAC_createEffect({
        eff_name = "ef_com_exp_02",
        pos_node = L5_20,
        loop = false,
        time = 3
      }))
      table.insert(L4_19, RAC_createEffect({
        eff_name = "ef_ev_smk_01",
        pos_node = L5_20,
        loop = true
      }))
      Sound:playSE("ef_ev_exp_01", 1, "", L5_20)
      L5_20("sm40_captain", "talk_sad_01", false)
      L5_20(1)
      L5_20("sm40_02007")
      L5_20("sm40_02008")
      L5_20()
      L5_20("sm40_captain", "stay", false)
      for _FORV_8_, _FORV_9_ in L5_20(L4_19) do
        L4_19[_FORV_8_]:abort()
      end
      L4_19 = L5_20
      L2_17 = 0
      L5_20("warppoint2_pc_01")
      L5_20()
      L5_20(L5_20, false)
      restart = false
      return L5_20
    end
    L4_19 = findGameObject2
    L4_19 = L4_19(L5_20, "bg2_vehicle_attack_target_01")
    L5_20(L4_19, false)
    L5_20(L4_19)
    L4_19 = true
    return L4_19
  end
  while true do
    L4_7 = L3_6
    L4_7 = L4_7()
    if L4_7 == false then
    end
  end
  L4_7 = Fn_pcSensorOff
  L4_7(L5_8)
  L4_7 = waitSeconds
  L4_7(L5_8)
  L4_7 = Player
  L4_7 = L4_7.setStay
  L4_7(L5_8, L6_9)
  L4_7 = Sound
  L4_7 = L4_7.playSEHandle
  L4_7 = L4_7(L5_8, L6_9, L7_10, L8_11, L9_12)
  _vehicle_engine_se_handle = L4_7
  L4_7 = waitSeconds
  L4_7(L5_8)
  L4_7 = Fn_blackout
  L4_7(L5_8)
  L4_7 = _vehicle_engine_se_handle
  if L4_7 ~= nil then
    L4_7 = Sound
    L4_7 = L4_7.stopSEHandle
    L4_7(L5_8, L6_9)
    _vehicle_engine_se_handle = nil
  end
  L4_7 = L2_5.abort
  L4_7(L5_8)
  L2_5 = nil
  L4_7 = Fn_resetPcPos
  L4_7(L5_8)
  L4_7 = L1_4.abort
  L4_7(L5_8)
  L1_4 = nil
  L4_7 = initVehicle
  L4_7()
  L4_7 = L0_3.setPilot
  L4_7(L5_8, L6_9, L7_10)
  L4_7 = Fn_playMotionNpc
  L4_7(L5_8, L6_9, L7_10)
  L4_7 = findGameObject2
  L4_7 = L4_7(L5_8, L6_9)
  L5_8(L6_9, L7_10, L8_11)
  L4_7 = Fn_fadein
  L4_7(L5_8)
  L4_7 = Fn_kaiwaDemoView
  L4_7(L5_8)
  L4_7 = nil
  L7_10(L8_11)
  L11_14 = true
  L7_10(L8_11, L9_12, L10_13, L11_14, Vector(0, 1.5, 0))
  L7_10(L8_11)
  L4_7 = L5_8
  L5_8(L6_9)
  L5_8(L6_9)
  L5_8(L6_9, L7_10)
  L5_8(L6_9, L7_10)
  while true do
    if L7_10 == false then
    else
    end
  end
  L5_8(L6_9)
  L5_8(L6_9)
  _is_in_sensor = false
  L5_8(L6_9)
  while true do
    if L5_8 == false then
      L5_8()
    end
  end
  L5_8(L6_9)
  _is_in_sensor = false
  L5_8(L6_9)
  L5_8(L6_9)
  L5_8(L6_9)
  for L8_11 = 1, 7 do
    L9_12[L8_11] = false
    L11_14 = string
    L11_14 = L11_14.format
    L11_14 = L11_14("%02d", L8_11)
    L9_12(L10_13)
  end
  _is_in_sensor = false
  L7_10(L8_11)
  while L7_10 < 30 do
    if L8_11 == true then
      if L8_11 then
      else
      end
    else
    end
    L8_11()
  end
  L8_11(L9_12)
  _is_in_sensor = false
  L8_11(L9_12)
  for L11_14 = 1, 7 do
    Fn_pcSensorOff("pccubesensor2_photo_hint_" .. string.format("%02d", L11_14))
    _is_in_hint_sensor[L11_14] = false
  end
  L8_11(L9_12)
  L8_11(L9_12, L10_13)
  L11_14 = Camera
  L11_14 = L11_14.kControl_All
  L8_11(L9_12, L10_13, L11_14, false)
  L9_12(L10_13)
  L9_12(L10_13)
  L9_12(L10_13)
  L11_14 = Camera
  L11_14 = L11_14.kPlayer
  L9_12(L10_13, L11_14, Camera.kControl_All, true)
  L11_14 = false
  L9_12(L10_13, L11_14)
  L9_12(L10_13)
  L9_12(L10_13)
  L11_14 = kPHOTO_TYPE_ONCE
  L11_14 = L9_12
  L10_13(L11_14, L6_9)
  repeat
    L11_14 = L9_12.run
    L11_14(L9_12)
    repeat
      L11_14 = wait
      L11_14()
      L11_14 = L9_12.isRunning
      L11_14 = L11_14(L9_12)
    until not L11_14
    L11_14 = L9_12.getPhotoState
    L11_14 = L11_14(L9_12)
    if L10_13 ~= nil then
      L10_13:abort()
    end
    if L11_14 == kPHOTO_OK then
      Fn_missionViewEnd()
      Player:setStay(true)
    elseif L11_14 == kPHOTO_NEAR then
    elseif L11_14 == kPHOTO_FAR then
    elseif L11_14 == kPHOTO_ANGLE then
    else
    end
  until L11_14 == kPHOTO_OK
  L11_14 = Fn_pcSensorOff
  L11_14("pccubesensor2_photo_out_03")
  while true do
    if L10_13 ~= nil then
      L11_14 = L10_13.isRunning
      L11_14 = L11_14(L10_13)
    end
    if L11_14 then
      L11_14 = wait
      L11_14()
    end
  end
  L11_14 = HUD
  L11_14 = L11_14.setPhotoMode
  L11_14(L11_14, false)
  L5_8()
  if L4_7 ~= nil then
    L5_8(L6_9)
    L4_7 = nil
  end
  L5_8()
  L5_8(L6_9)
  L5_8()
  L5_8()
  L5_8()
  L5_8()
  L5_8()
  L5_8()
  L5_8()
end
function Finalize()
  if _vehicle_engine_se_handle ~= nil then
    Sound:stopSEHandle(_vehicle_engine_se_handle)
    _vehicle_engine_se_handle = nil
  end
  Mob:restrict_sm40_00(false)
end
function initVehicle()
  local L0_23, L1_24
  L0_23 = _vehicle_hdl
  if L0_23 == nil then
    L0_23 = RAC_spawnVehicle
    L1_24 = "sm40_car"
    L0_23 = L0_23(L1_24, "ForSm40Ship", "locator2_vehicle_01")
    _vehicle_hdl = L0_23
  end
  L0_23 = findGameObject2
  L1_24 = "Node"
  L0_23 = L0_23(L1_24, "locator2_vehicle_01")
  L1_24 = L0_23
  L0_23 = L0_23.getWorldTransform
  L1_24 = L0_23(L1_24)
  _vehicle_hdl:getVehicle():setActive(true)
  _vehicle_hdl:getVehicle():setWorldTransform(L0_23, L1_24)
  RAC_moveVehicle(_vehicle_hdl, "locator2_vehicle_01", 0, 0)
end
function deleteVehicle()
  if _vehicle_hdl ~= nil then
    RAC_deleteVehicle(_vehicle_hdl)
    _vehicle_hdl = nil
  end
end
function invokeVehicleRotFixTask()
  local L0_25, L1_26
  L0_25 = _vehicle_hdl
  L1_26 = L0_25
  L0_25 = L0_25.getVehicle
  L0_25 = L0_25(L1_26)
  L1_26 = L0_25.getWorldRot
  L1_26 = L1_26(L0_25)
  return invokeTask(function()
    local L0_27
    while true do
      L0_27 = L0_25
      L0_27 = L0_27.getWorldRot
      L0_27 = L0_27(L0_27)
      L0_27.y = L1_26.y
      L0_25:setWorldRot(L0_27)
      wait()
    end
  end)
end
function invokeMoveVehicleTask()
  local L0_28
  L0_28 = _vehicle_hdl
  if L0_28 == nil then
    L0_28 = nil
    return L0_28
  end
  _is_ride_ship = false
  L0_28 = {}
  L0_28.deactive_task = nil
  L0_28.main_task = invokeTask(function()
    local L0_29, L1_30, L2_31, L3_32, L4_33
    L0_29 = L0_28
    L1_30 = _vehicle_hdl
    L2_31 = L1_30
    L1_30 = L1_30.getVehicle
    L1_30 = L1_30(L2_31)
    L2_31 = {}
    L3_32 = 1
    while true do
      L4_33 = findGameObject2
      L4_33 = L4_33("Node", "locator2_vehicle_move_a_" .. string.format("%02d", L3_32))
      if L4_33 ~= nil then
        table.insert(L2_31, L4_33)
      else
        break
      end
      L3_32 = L3_32 + 1
    end
    L3_32 = RAC_moveVehicle
    L4_33 = _vehicle_hdl
    L3_32(L4_33, L2_31, VEHICLE_MOVE_SPEED_RIDE)
    while true do
      while true do
        L4_33 = L1_30
        L3_32 = L1_30.isAttachReady
        L3_32 = L3_32(L4_33, _vehicle_hdl.route_hdl)
        if L3_32 == false then
          L3_32 = wait
          L3_32()
        end
      end
    end
    while true do
      L3_32 = _is_ride_ship
      if L3_32 == false then
        L3_32 = _vehicle_hdl
        L4_33 = L3_32
        L3_32 = L3_32.getRemainingDist
        L3_32 = L3_32(L4_33)
      end
      if L3_32 > 0.5 then
        L3_32 = wait
        L3_32()
      end
    end
    L3_32 = _vehicle_hdl
    L4_33 = L3_32
    L3_32 = L3_32.setBaseSpeed
    L3_32(L4_33, VEHICLE_MOVE_SPEED)
    while true do
      L3_32 = _vehicle_hdl
      L4_33 = L3_32
      L3_32 = L3_32.getRemainingDist
      L3_32 = L3_32(L4_33)
      if L3_32 > 0.5 then
        L3_32 = wait
        L3_32()
      end
    end
    L3_32 = invokeTask
    function L4_33()
      while _is_ride_ship == false or L1_30:getActive() and (Fn_isInSightTarget(L1_30, 1) or Fn_getDistanceToPlayer(L1_30:getWorldPos()) < 20) do
        wait()
      end
      L1_30:setActive(false)
    end
    L3_32 = L3_32(L4_33)
    L0_29.deactive_task = L3_32
    L3_32 = {}
    L2_31 = L3_32
    L3_32 = 1
    while true do
      while true do
        L4_33 = findGameObject2
        L4_33 = L4_33("Node", "locator2_vehicle_move_b_" .. string.format("%02d", L3_32))
        if L4_33 ~= nil then
          table.insert(L2_31, L4_33)
        else
          break
        end
        L3_32 = L3_32 + 1
      end
    end
    while true do
      repeat
        L3_32 = L0_29.deactive_task
        L4_33 = L3_32
        L3_32 = L3_32.isRunning
        L3_32 = L3_32(L4_33)
        if L3_32 then
          L3_32 = RAC_moveVehicle
          L4_33 = _vehicle_hdl
          L3_32(L4_33, L2_31)
          while true do
            while true do
              L4_33 = L1_30
              L3_32 = L1_30.isAttachReady
              L3_32 = L3_32(L4_33, _vehicle_hdl.route_hdl)
              if L3_32 == false then
                L3_32 = wait
                L3_32()
              end
            end
          end
          while true do
            L3_32 = _vehicle_hdl
            L4_33 = L3_32
            L3_32 = L3_32.getRemainingDist
            L3_32 = L3_32(L4_33)
            if L3_32 > 0.5 then
              L3_32 = L0_29.deactive_task
              L4_33 = L3_32
              L3_32 = L3_32.isRunning
              L3_32 = L3_32(L4_33)
            end
            L3_32 = wait
            L3_32()
          end
        end
      until L3_32
    end
  end)
  function L0_28.abort(A0_34)
    _vehicle_hdl:setBaseSpeed(0)
    _vehicle_hdl:setCurrSpeed(0)
    if A0_34.deactive_task ~= nil then
      A0_34.deactive_task:abort()
      A0_34.deactive_task = nil
    end
    if A0_34.main_task ~= nil then
      A0_34.main_task:abort()
      A0_34.main_task = nil
    end
  end
  return L0_28
end
function invokeMoveDeactiveTask(A0_35, A1_36, A2_37)
  local L3_38
  L3_38 = {}
  L3_38.move_task = nil
  L3_38.deactive_task = nil
  function L3_38.update(A0_39)
    A0_39.deactive_task = RAC_InvokeAutoDeactiveNpcTask(A0_35, A2_37)
    A0_39.move_task = RAC_invokeMoveCharaTask(A0_35, A1_36, {arrivedLength = 1, recast = true})
    while A0_39.deactive_task:isRunning() do
      wait()
    end
    A0_39.move_task:abort()
    A0_39.move_task = nil
    RAC_stopNpcMoveTask(A0_35)
    A0_39.deactive_task:abort()
    A0_39.deactive_task = nil
  end
  function L3_38.destractor(A0_40)
    if A0_40.move_task ~= nil then
      A0_40.move_task:abort()
      A0_40.move_task = nil
      RAC_stopNpcMoveTask(A0_35)
    end
    if A0_40.deactive_task ~= nil then
      A0_40.deactive_task:abort()
      A0_40.deactive_task = nil
      Fn_setNpcActive(A0_35, false)
    end
  end
  return RAC_InvokeTaskWithDestractor(L3_38.update, L3_38.destractor, L3_38)
end
function invokePhotoOutHintTask()
  return invokeTask(function()
    local L0_41
    L0_41 = Player
    L0_41 = L0_41.setStay
    L0_41(L0_41, true)
    L0_41 = findGameObject2
    L0_41 = L0_41("Node", "locator2_navi_photo_out_01")
    Fn_naviSet(L0_41)
    Fn_captionViewWait("sm40_02037")
    Fn_lookAtObject(L0_41, 0.7):abort()
    Player:setStay(false)
  end)
end
function invokePhotoHintTask()
  return invokeTask(function()
    local L0_42, L1_43, L2_44
    L0_42 = {
      L1_43,
      L2_44,
      "sm40_02031",
      "sm40_02032",
      "sm40_02033",
      "sm40_02034",
      "sm40_02035"
    }
    L1_43 = "sm40_02029"
    L1_43 = {}
    for _FORV_5_, _FORV_6_ in L2_44(_is_in_hint_sensor) do
      L1_43[_FORV_5_] = PHOTO_HINT_DISP_SEC_FIRST * 30
    end
    while true do
      L2_44()
      if L2_44 == false then
        for _FORV_6_, _FORV_7_ in pairs(_is_in_hint_sensor) do
          if _FORV_7_ == true then
            break
          end
        end
        if L2_44 ~= nil then
          L1_43[L2_44] = L1_43[L2_44] - 1
          if L1_43[L2_44] <= 0 then
            Fn_captionView(L0_42[L2_44])
            L1_43[L2_44] = PHOTO_HINT_INTERVAL_SEC * 30
          end
        end
      end
    end
  end)
end
function setVisibiltyPicture()
  if not Fn_getBgsetHandle() then
    return nil
  end
  Fn_getBgsetHandle():sendEvent("activePicture")
end
function pccubesensor2_vehicle_attack_out_01_OnEnter()
  local L0_45, L1_46
end
function pccubesensor2_vehicle_attack_out_01_OnLeave()
  Player:setStay(true)
  invokeTask(function()
    Fn_captionViewWait("sm40_02036")
    Fn_catWarp()
    Player:setStay(false)
  end)
end
function pccubesensor2_captain_01_OnEnter()
  local L0_47, L1_48
  _is_in_sensor = true
end
function pccubesensor2_captain_01_OnLeave()
  local L0_49, L1_50
  _is_in_sensor = false
end
function pccubesensormulti2_vehicle_damage_success_01_OnEnter()
  local L0_51, L1_52
  _is_in_sensor = true
end
function pccubesensormulti2_vehicle_damage_success_01_OnLeave()
  local L0_53, L1_54
  _is_in_sensor = false
end
function pccubesensor2_vehicle_out_01_OnEnter()
  local L0_55, L1_56
  _is_out_of_range = false
end
function pccubesensor2_vehicle_out_01_OnLeave()
  local L0_57, L1_58
  _is_out_of_range = true
end
function pccubesensor2_vehicle_out_02_OnEnter()
  local L0_59, L1_60
  _is_out_of_range2 = false
end
function pccubesensor2_vehicle_out_02_OnLeave()
  local L0_61, L1_62
  _is_out_of_range2 = true
end
function cubesensor2_look_clock_tower_01_OnEnter()
  local L0_63, L1_64
  _vehicle_is_in_sensor = true
end
function cubesensor2_look_clock_tower_01_OnLeave()
  local L0_65, L1_66
  _vehicle_is_in_sensor = false
end
function pccubesensor2_look_clock_tower_02_OnEnter()
  local L0_67, L1_68
  _is_in_shortcut_sensor = true
end
function pccubesensor2_look_clock_tower_02_OnLeave()
  local L0_69, L1_70
  _is_in_shortcut_sensor = false
end
function pccubesensormulti2_notice_clock_tower_out_01_OnEnter()
  local L0_71, L1_72
end
function pccubesensormulti2_notice_clock_tower_out_01_OnLeave()
  Fn_pcSensorOff("pccubesensormulti2_notice_clock_tower_out_01")
  Fn_pcSensorOn("pccubesensor2_photo_out_02")
  invokePhotoOutHintTask()
end
function pccubesensor2_clock_tower_01_OnEnter()
  local L0_73, L1_74
  _is_in_sensor = true
end
function pccubesensor2_clock_tower_01_OnLeave()
  local L0_75, L1_76
  _is_in_sensor = false
end
function pccubesensor2_photo_reached_01_OnEnter()
  local L0_77, L1_78
  _is_in_sensor = true
end
function pccubesensor2_photo_reached_01_OnLeave()
  local L0_79, L1_80
  _is_in_sensor = false
end
function pccubesensor2_photo_hint_01_OnEnter()
  local L1_81
  L1_81 = _is_in_hint_sensor
  L1_81[1] = true
end
function pccubesensor2_photo_hint_01_OnLeave()
  local L1_82
  L1_82 = _is_in_hint_sensor
  L1_82[1] = false
end
function pccubesensor2_photo_hint_02_OnEnter()
  local L1_83
  L1_83 = _is_in_hint_sensor
  L1_83[2] = true
end
function pccubesensor2_photo_hint_02_OnLeave()
  local L1_84
  L1_84 = _is_in_hint_sensor
  L1_84[2] = false
end
function pccubesensor2_photo_hint_03_OnEnter()
  local L1_85
  L1_85 = _is_in_hint_sensor
  L1_85[3] = true
end
function pccubesensor2_photo_hint_03_OnLeave()
  local L1_86
  L1_86 = _is_in_hint_sensor
  L1_86[3] = false
end
function pccubesensor2_photo_hint_04_OnEnter()
  local L1_87
  L1_87 = _is_in_hint_sensor
  L1_87[4] = true
end
function pccubesensor2_photo_hint_04_OnLeave()
  local L1_88
  L1_88 = _is_in_hint_sensor
  L1_88[4] = false
end
function pccubesensor2_photo_hint_05_OnEnter()
  local L1_89
  L1_89 = _is_in_hint_sensor
  L1_89[5] = true
end
function pccubesensor2_photo_hint_05_OnLeave()
  local L1_90
  L1_90 = _is_in_hint_sensor
  L1_90[5] = false
end
function pccubesensor2_photo_hint_06_OnEnter()
  local L1_91
  L1_91 = _is_in_hint_sensor
  L1_91[6] = true
end
function pccubesensor2_photo_hint_06_OnLeave()
  local L1_92
  L1_92 = _is_in_hint_sensor
  L1_92[6] = false
end
function pccubesensor2_photo_hint_07_OnEnter()
  local L1_93
  L1_93 = _is_in_hint_sensor
  L1_93[7] = true
end
function pccubesensor2_photo_hint_07_OnLeave()
  local L1_94
  L1_94 = _is_in_hint_sensor
  L1_94[7] = false
end
function pccubesensor2_photo_out_01_OnEnter()
  local L0_95, L1_96
end
function pccubesensor2_photo_out_01_OnLeave()
  Fn_pcSensorOff("pccubesensor2_photo_out_01")
  Fn_pcSensorOn("pccubesensor2_photo_out_02")
  invokePhotoOutHintTask()
end
function pccubesensor2_photo_out_02_OnEnter()
  Fn_pcSensorOn("pccubesensor2_photo_out_01")
  Fn_pcSensorOff("pccubesensor2_photo_out_02")
  Fn_naviKill()
end
function pccubesensor2_photo_out_02_OnLeave()
  local L0_97, L1_98
end
function pccubesensor2_photo_out_03_OnEnter()
  local L0_99, L1_100
end
function pccubesensor2_photo_out_03_OnLeave()
  Fn_pcSensorOff("pccubesensor2_photo_out_03")
  Fn_pcSensorOn("pccubesensor2_photo_out_04")
  Fn_naviSet(findGameObject2("Node", "locator2_photo_target_01"))
  Fn_captionView("sm40_02038")
end
function pccubesensor2_photo_out_04_OnEnter()
  Fn_pcSensorOn("pccubesensor2_photo_out_03")
  Fn_pcSensorOff("pccubesensor2_photo_out_04")
  Fn_naviKill()
end
function pccubesensor2_photo_out_04_OnLeave()
  local L0_101, L1_102
end
