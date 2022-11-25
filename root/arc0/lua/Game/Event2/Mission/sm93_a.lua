dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm93_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_navi_cnt = 0
_restart_flag = false
_look_task = nil
_man33_task = nil
function Initialize()
  gemSet(1, false)
  gemSet(2, false)
  gemSet(3, false)
  Fn_pcSensorOff("pccubesensor2_restart_01")
  Fn_pcSensorOff("pccubesensor2_restart_02")
  Fn_pcSensorOff("pccubesensor2_restart_03")
  Fn_pcSensorOff("pccubesensor2_restart_04")
  Fn_pcSensorOff("pccubesensor2_restart_05")
  Fn_pcSensorOff("pccubesensor2_restart_06")
  Fn_pcSensorOff("pccubesensor2_restart_07")
  Fn_pcSensorOff("pccubesensor2_restart_fall_07")
  Mob:restrictNavForTutorialStart(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = Fn_missionStart
  L0_0()
  _navi_cnt = 1
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_01"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_01"
  L1_1(L2_2)
  L1_1 = gemSet
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setAbility
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_captionViewWait
  L2_2 = "ep80_00120"
  L1_1(L2_2)
  L1_1 = Fn_missionView
  L2_2 = "sm93_00007"
  L1_1(L2_2)
  L1_1 = Fn_lookAtTargetInput
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1.3
  L1_1(L2_2)
  L1_1 = Fn_naviSet
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 2.5
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "sm93_00008"
  L1_1(L2_2, L3_3)
  L1_1 = waitNaviPoint
  L2_2 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_01"
  L1_1(L2_2)
  L1_1 = Fn_userCtrlAllOff
  L1_1()
  L1_1 = Fn_naviKill
  L1_1()
  L1_1 = Fn_captionViewEnd
  L1_1()
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.pulse
  L1_1(L2_2, L3_3)
  _navi_cnt = 2
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_02"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_02"
  L1_1(L2_2)
  L1_1 = gemSet
  L2_2 = 2
  L1_1(L2_2)
  L1_1 = Fn_missionView
  L2_2 = "sm93_00009"
  L1_1(L2_2)
  L1_1 = Fn_lookAtObject
  L2_2 = L0_0
  L1_1 = L1_1(L2_2, L3_3)
  _look_task = L1_1
  L1_1 = Fn_playerTurn
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1.3
  L1_1(L2_2)
  L1_1 = Fn_naviSet
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 2.5
  L1_1(L2_2)
  L1_1 = Fn_tutorialCaption
  L2_2 = "gravity_r1_only"
  L1_1(L2_2)
  L1_1 = Fn_playerTurnEnd
  L1_1()
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setControl
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Camera
  L2_2 = L1_1
  L1_1 = L1_1.setControl
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setAbility
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = waitGravityCtrlMode
  L1_1()
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setAbility
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.pulse
  L1_1(L2_2, L3_3)
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setAbility
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = invokeTask
  function L2_2()
    waitNaviPoint(L0_0, 3)
    if _look_task ~= nil and _look_task:isRunning() == true then
      _look_task:abort()
    end
    _look_task = nil
  end
  L1_1 = L1_1(L2_2)
  L2_2 = waitNaviWall
  L2_2(L3_3, L4_4)
  L2_2 = Fn_pcSensorOff
  L2_2(L3_3)
  L2_2 = Fn_tutorialCaptionKill
  L2_2()
  if L1_1 ~= nil then
    L2_2 = L1_1.isRunning
    L2_2 = L2_2(L3_3)
    if L2_2 == true then
      L2_2 = L1_1.abort
      L2_2(L3_3)
    end
  end
  L1_1 = nil
  L2_2 = Fn_userCtrlOff
  L2_2()
  L2_2 = gemSet
  L2_2(L3_3)
  L2_2 = Fn_naviKill
  L2_2()
  L2_2 = Fn_missionInfoEnd
  L2_2()
  L2_2 = Sound
  L2_2 = L2_2.pulse
  L2_2(L3_3, L4_4)
  L2_2 = Fn_captionView
  L2_2(L3_3, L4_4)
  L2_2 = waitSeconds
  L2_2(L3_3)
  L2_2 = Camera
  L2_2 = L2_2.lookTo
  L6_6 = "locator2_navi_03"
  L6_6 = 1
  L2_2(L3_3, L4_4, L5_5, L6_6)
  L2_2 = waitSeconds
  L2_2(L3_3)
  do break end
  _navi_cnt = 3
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_03"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Camera
  L2_2 = L1_1
  L1_1 = L1_1.lookTo
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_03"
  L1_1(L2_2)
  L1_1 = Fn_naviSet
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setAbility
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setAbility
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_captionView
  L2_2 = "sm93_00011"
  L1_1(L2_2)
  L1_1 = waitNaviPoint
  L2_2 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_03"
  L1_1(L2_2)
  L1_1 = Fn_userCtrlOff
  L1_1()
  L1_1 = Fn_naviKill
  L1_1()
  L1_1 = Fn_captionViewEnd
  L1_1()
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.pulse
  L1_1(L2_2, L3_3)
  _navi_cnt = 4
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_04"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_04"
  L1_1(L2_2)
  L1_1 = Fn_lookAtObject
  L2_2 = L0_0
  L1_1 = L1_1(L2_2)
  _look_task = L1_1
  L1_1 = waitSeconds
  L2_2 = BEFORE_DISP_NAVI_WAIT
  L1_1(L2_2)
  L1_1 = Fn_naviSet
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setAbility
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_tutorialCaption
  L2_2 = "gravity_r1_only"
  L1_1(L2_2)
  L1_1 = createGemNaviToPlayer
  L2_2 = L0_0
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1 = waitNaviPoint
  L2_2 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_04"
  L1_1(L2_2)
  L1_1 = _look_task
  if L1_1 ~= nil then
    L1_1 = _look_task
    L2_2 = L1_1
    L1_1 = L1_1.isRunning
    L1_1 = L1_1(L2_2)
    if L1_1 == true then
      L1_1 = _look_task
      L2_2 = L1_1
      L1_1 = L1_1.abort
      L1_1(L2_2)
    end
  end
  _look_task = nil
  L1_1 = Fn_tutorialCaptionKill
  L1_1()
  L1_1 = Fn_naviKill
  L1_1()
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.pulse
  L1_1(L2_2, L3_3)
  _navi_cnt = 5
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_05"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_05"
  L1_1(L2_2)
  L1_1 = {}
  L2_2 = 1
  while true do
    L6_6 = string
    L6_6 = L6_6.format
    L7_7 = "%02d"
    L8_8 = L2_2
    L6_6 = L6_6(L7_7, L8_8)
    L7_7 = "_start"
    if L3_3 ~= nil then
      L6_6 = string
      L6_6 = L6_6.format
      L7_7 = "%02d"
      L8_8 = L2_2
      L6_6 = L6_6(L7_7, L8_8)
      L4_4.name = L5_5
      L4_4.type = "gull01"
      L6_6 = L3_3
      L4_4.node = L5_5
      L4_4.use_gravity = false
      L4_4.attach = true
      L4_4.start = true
      L1_1[L2_2] = L4_4
    else
      break
    end
    L2_2 = L2_2 + 1
  end
  L3_3(L4_4)
  for L6_6, L7_7 in L3_3(L4_4) do
    L8_8 = {}
    L9_9 = 1
    while true do
      L10_10 = "locator2_gull"
      L10_10 = L10_10 .. string.format("%02d", L6_6) .. "_" .. string.format("%02d", L9_9)
      if findGameObject2("Node", L10_10) ~= nil then
        L8_8[L9_9] = {pos = L10_10, attr = ""}
      else
        break
      end
      L9_9 = L9_9 + 1
    end
    L10_10 = L8_8[1]
    L10_10.attr = "takeoff"
    L10_10 = #L8_8
    L10_10 = L8_8[L10_10]
    L10_10.attr = "land"
    L10_10 = invokeTask
    L10_10(function()
      waitSeconds(L6_6 * 0.5)
      Fn_fly(L7_7.name, L8_8, {moveSpeed = 5, escape = true})
      Fn_playMotionNpc(L7_7.name, "eat", false)
    end)
    do break end
    break
  end
  _man33_task = L3_3
  L6_6 = L0_0
  L6_6 = 2
  L7_7 = 2
  L3_3(L4_4, L5_5, L6_6, L7_7)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L6_6 = 30
  L7_7 = 60
  L3_3(L4_4, L5_5, L6_6, L7_7)
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
  L3_3()
  L3_3()
  L3_3(L4_4)
  L3_3(L4_4, L5_5)
  _navi_cnt = 6
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_06"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_06"
  L1_1(L2_2)
  L1_1 = Fn_lookAtTargetInput
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = BEFORE_DISP_NAVI_WAIT
  L1_1(L2_2)
  L1_1 = Fn_naviSet
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Fn_tutorialCaption
  L2_2 = "gravity_r1_only"
  L1_1(L2_2)
  L1_1 = createGemNaviToPlayer
  L2_2 = L0_0
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1 = waitNaviPoint
  L2_2 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_06"
  L1_1(L2_2)
  L1_1 = Fn_tutorialCaptionKill
  L1_1()
  L1_1 = _man33_task
  if L1_1 ~= nil then
    L1_1 = _man33_task
    L2_2 = L1_1
    L1_1 = L1_1.isRunning
    L1_1 = L1_1(L2_2)
    if L1_1 == true then
      L1_1 = _man33_task
      L2_2 = L1_1
      L1_1 = L1_1.abort
      L1_1(L2_2)
    end
  end
  _man33_task = nil
  L1_1 = Fn_naviKill
  L1_1()
  L1_1 = Fn_captionViewEnd
  L1_1()
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.pulse
  L1_1(L2_2, L3_3)
  _navi_cnt = 7
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setNoDamageMode
  L2_2 = Player
  L2_2 = L2_2.kNoDamage_FromCrash
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_07"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_07"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_fall_07"
  L1_1(L2_2)
  L1_1 = Camera
  L2_2 = L1_1
  L1_1 = L1_1.lookTo
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L1_1 = waitSeconds
  L2_2 = BEFORE_DISP_NAVI_WAIT
  L1_1(L2_2)
  L1_1 = Fn_naviSet
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "ic_tutorial_00150"
  L1_1(L2_2, L3_3)
  L1_1 = Fn_unLockPlayerAbility
  L2_2 = {L3_3}
  L1_1(L2_2)
  L1_1 = waitNaviFall
  L2_2 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_07"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_fall_07"
  L1_1(L2_2)
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.setNoDamageMode
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_userCtrlAllOff
  L1_1()
  L1_1 = Fn_naviKill
  L1_1()
  L1_1 = Fn_captionViewEnd
  L1_1()
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.pulse
  L1_1(L2_2, L3_3)
  L0_0 = Fn_setKeepPlayerPos
  L0_0()
  L0_0 = Fn_setNextMissionFlag
  L0_0()
  L0_0 = Fn_nextMission
  L0_0()
  L0_0 = Fn_exitSandbox
  L0_0()
end
function Finalize()
  Mob:restrictNavForTutorialStart(false)
end
function pccubesensor2_OnLeave_restart_fall_07(A0_11)
  if _restart_flag == false and Player:isGravityControlMode() == true then
    _restart_flag = true
    invokeTask(function()
      Fn_blackout(1)
      Player:setStay(true)
      Fn_resetPcPos(findGameObject2("Node", "locator2_navi_06"))
      Fn_fadein(1)
      Player:setStay(false)
      _restart_flag = false
    end)
  end
end
