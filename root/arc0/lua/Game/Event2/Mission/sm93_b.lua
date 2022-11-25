dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm93_common.lua")
dofile("/Game/Misc/balloon.lua")
dofile("/Game/Mob/mob_event_util.lua")
_navi_cnt = 0
_restart_flag = false
_balloon_tbl = {}
_fall_flag = false
_fall_task = nil
function Initialize()
  Fn_userCtrlAllOff()
  gemSet(9, false)
  gemSet(11, false)
  Fn_pcSensorOff("pccubesensor2_restart_08")
  Fn_pcSensorOff("pccubesensormulti2_restart_09")
  Fn_pcSensorOff("pccubesensor2_restart_10")
  Fn_pcSensorOff("pccubesensor2_restart_11")
  Fn_pcSensorOff("pccubesensor2_restart_12")
  Fn_pcSensorOff("pccubesensor2_fall_11")
  Fn_pcSensorOff("pccubesensor2_goal_11")
  Mob:restrictNavForTutorialEnd(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_missionStart
  L0_0()
  _navi_cnt = 8
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_08"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_08"
  L1_1(L2_2)
  L1_1 = Fn_userCtrlOn
  L1_1()
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
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = invokeTask
  function L2_2()
    createGemNaviToPlayer(L0_0, 3, 10, 40)
  end
  L1_1(L2_2)
  L1_1 = Fn_captionViewWait
  L2_2 = "sm93_00012"
  L1_1(L2_2)
  L1_1 = Fn_tutorialCaption
  L2_2 = "gravity"
  L1_1(L2_2)
  L1_1 = waitNaviWall
  L2_2 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_08"
  L1_1(L2_2)
  L1_1 = Fn_tutorialCaptionKill
  L1_1()
  L1_1 = Fn_userCtrlAllOff
  L1_1()
  L1_1 = Fn_naviKill
  L1_1()
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.pulse
  L1_1(L2_2, L3_3)
  do break end
  _navi_cnt = 9
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_09"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensormulti2_restart_09"
  L1_1(L2_2)
  L1_1 = gemSet
  L2_2 = 9
  L1_1(L2_2)
  L1_1 = {L2_2, L3_3}
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6
  }
  L2_2 = findGameObject2
  L2_2 = L2_2(L3_3, L4_4)
  L2_2 = L2_2.getWorldPos
  L2_2 = L2_2(L3_3)
  for L7_7 = 1, 30 do
    Balloon.create("balloon_" .. string.format("%02d", L7_7), nil, "CharDefs/" .. L1_1[L3_3][RandI(1, #L1_1[L3_3])]):start()
    Balloon.create("balloon_" .. string.format("%02d", L7_7), nil, "CharDefs/" .. L1_1[L3_3][RandI(1, #L1_1[L3_3])]).puppet:setWorldPos(L2_2 + Vector(RandF(-2, 2), RandF(-10, 15), RandF(-7.5, 7.5)))
    _balloon_tbl[L7_7] = Balloon.create("balloon_" .. string.format("%02d", L7_7), nil, "CharDefs/" .. L1_1[L3_3][RandI(1, #L1_1[L3_3])])
  end
  for _FORV_8_, _FORV_9_ in L5_5(L6_6) do
    _FORV_9_:move(L4_4 + Vector(RandF(-20, 20), RandF(-20, 20), RandF(-20, 20)), nil, 15, 40, true)
  end
  L5_5(L6_6, L7_7, 2, 2)
  L5_5(L6_6)
  L5_5(L6_6, L7_7)
  L5_5(L6_6, L7_7)
  L5_5(L6_6)
  L5_5(L6_6)
  L5_5(L6_6)
  L5_5()
  L5_5(L6_6, L7_7)
  L5_5(L6_6)
  if L5_5 ~= nil then
    if L5_5 == true then
      L5_5(L6_6)
    end
  end
  near_task = nil
  L5_5()
  L5_5()
  L5_5()
  L5_5(L6_6)
  L5_5(L6_6, L7_7)
  if L5_5 < 4 then
    L5_5(L6_6)
  else
    L5_5(L6_6)
  end
  _navi_cnt = 10
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_10"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_10"
  L1_1(L2_2)
  L1_1 = Fn_userCtrlOn
  L1_1()
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
  L1_1 = Player
  L2_2 = L1_1
  L1_1 = L1_1.isGravityControlMode
  L1_1 = L1_1(L2_2)
  if L1_1 == true then
    L1_1 = waitSeconds
    L2_2 = 2.5
    L1_1(L2_2)
    L1_1 = Fn_captionView
    L2_2 = "ic_tutorial_00150"
    L1_1(L2_2, L3_3)
  end
  L1_1 = waitNaviFall
  L2_2 = L0_0
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_restart_10"
  L1_1(L2_2)
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
  _navi_cnt = 11
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_11"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_restart_11"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_goal_11"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_fall_11"
  L1_1(L2_2)
  L1_1 = findGameObject2
  L2_2 = "Node"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = createGameObject2
  L2_2 = L2_2(L3_3)
  L3_3(L4_4, L5_5)
  L3_3(L4_4, L5_5)
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4, L5_5, L6_6, L7_7)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3()
  L3_3(L4_4, L5_5, L6_6)
  L3_3(L4_4)
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
  for L6_6, L7_7 in L3_3(L4_4) do
    if L7_7.catch == true then
      invokeTask(function()
        L7_7:release()
      end)
      break
    else
    end
  end
  _fall_task = L3_3
  L3_3(L4_4, L5_5)
  L3_3(L4_4, L5_5)
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
  L3_3(L4_4)
  _navi_cnt = 12
  L3_3(L4_4)
  _fall_flag = false
  if L3_3 ~= nil then
    if L3_3 == true then
      L3_3(L4_4)
    end
  end
  _fall_task = nil
  L3_3()
  while true do
    if L5_5 == true then
      L5_5(L6_6)
      L5_5(L6_6, L7_7)
      if L5_5 < 8 then
        L5_5(L6_6)
        break
      end
      L5_5(L6_6)
      break
    elseif L5_5 ~= L6_6 then
    elseif L5_5 == L6_6 then
      L6_6(L7_7)
      break
    end
    L5_5()
  end
  L5_5()
  L5_5(L6_6)
  L5_5(L6_6)
  if L4_4 ~= nil then
    if L5_5 == true then
      L5_5(L6_6)
    end
  end
  L5_5(L6_6)
  while true do
    if L5_5 then
      L5_5()
    end
  end
  L5_5(L6_6)
  L5_5()
  L5_5()
  L0_0 = waitSeconds
  L1_1 = 1
  L0_0(L1_1)
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setGravityControlMode
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Fn_setBgmPoint
  L1_1 = "event"
  L2_2 = "clear_jingle"
  L0_0(L1_1, L2_2)
  L0_0 = Sound
  L1_1 = L0_0
  L0_0 = L0_0.pulse
  L2_2 = "clear_jingle"
  L0_0(L1_1, L2_2)
  L0_0 = Fn_captionViewWait
  L1_1 = "sm93_00006"
  L0_0(L1_1)
  L0_0 = Fn_setBgmPoint
  L1_1 = "event"
  L2_2 = "missionend"
  L0_0(L1_1, L2_2)
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L2_2 = ggd
  L2_2 = L2_2.EventFlags__sm93__TutorialFlags
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L2_2 = ggd
  L2_2 = L2_2.GlobalSystemFlags__AreaReset
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = waitSeconds
  L1_1 = 1
  L0_0(L1_1)
  L0_0 = Fn_blackout
  L1_1 = 1
  L0_0(L1_1)
  L0_0 = Fn_setNextMissionFlag
  L1_1 = "ep80_00050m"
  L0_0(L1_1)
  L0_0 = Fn_nextMission
  L0_0()
  L0_0 = Fn_exitSandbox
  L0_0()
end
function Finalize()
  Mob:restrictNavForTutorialEnd(false)
  Area:setAnimMoveDriftEnable(true, true, true)
  _resetHUD()
end
function get_crate_tbl()
  local L0_8, L1_9
  L0_8 = {}
  L1_9 = 1
  while findGameObject2("GimmickBg", "bg2_crate_" .. string.format("%02d", L1_9)) ~= nil do
    L0_8[L1_9] = findGameObject2("GimmickBg", "bg2_crate_" .. string.format("%02d", L1_9))
    do break end
    do break end
    L1_9 = L1_9 + 1
  end
  return L0_8
end
function crate_break_task(A0_10)
  return invokeTask(function()
    local L0_11, L1_12, L2_13, L3_14, L4_15
    while true do
      for L3_14, L4_15 in L0_11(L1_12) do
        if Fn_getDistanceToPlayer(L4_15) < 1.5 and Player:getAction() ~= Player.kAction_Float then
          A0_10[L3_14]:requestBreak(Fn_getPlayerWorldPos(), 1)
        end
      end
      L0_11()
    end
  end)
end
function pccubesensor2_OnLeave_OnEnter_fall_11(A0_16)
  Player:setControl(Player.kControl_Stick, false)
  _fall_flag = true
end
function pccubesensor2_OnLeave_OnEnter_goal_11(A0_17)
  invokeTask(function()
    local L0_18, L1_19
    L0_18 = get_crate_tbl
    L0_18 = L0_18()
    L1_19 = Fn_findNpc
    L1_19 = L1_19("npcgen2_man39_01")
    Fn_playMotionNpc(L1_19, "surprise", true)
    for _FORV_5_, _FORV_6_ in pairs(L0_18) do
      if _FORV_6_:isBroken() == true then
        Fn_turnNpc(L1_19)
        Fn_playMotionNpc(L1_19, "talk_angry_00", true)
        break
      end
    end
    Fn_playMotionNpc(L1_19, "lookaround_01", false)
  end)
end
