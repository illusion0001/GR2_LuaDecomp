dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_phaseNum = 0
_isTutorialClear = false
function Initialize()
  Fn_userCtrlOff()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6
  }
  L1_1 = Player
  L1_1 = L1_1.kAbility_Dodge
  L2_2 = Player
  L2_2 = L2_2.kAbility_KickCombo
  L3_3 = Player
  L3_3 = L3_3.kAbility_GravityKick
  L4_4 = Player
  L4_4 = L4_4.kAbility_Slider
  L5_5 = Player
  L5_5 = L5_5.kAbility_Grab
  L6_6 = Player
  L6_6 = L6_6.kAbility_AttrTuneSwitch
  L1_1 = Fn_lockPlayerAbility
  L2_2 = L0_0
  L3_3 = nil
  L1_1(L2_2, L3_3)
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = Fn_userCtrlOff
  L1_1()
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_12"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = Fn_lookAtObject
  L3_3 = L1_1
  L2_2 = L2_2(L3_3)
  L3_3 = waitSeconds
  L4_4 = 1.5
  L3_3(L4_4)
  L3_3 = HUD
  L4_4 = L3_3
  L3_3 = L3_3.info
  L5_5 = "ep03_info_04"
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L3_3 = waitSeconds
  L4_4 = 0.5
  L3_3(L4_4)
  L3_3 = Fn_missionView
  L4_4 = "\231\155\174\231\154\132\229\156\176\227\129\184\231\167\187\229\139\149\227\129\151\227\130\141\239\188\129"
  L3_3(L4_4)
  L3_3 = waitSeconds
  L4_4 = 1.3
  L3_3(L4_4)
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = {L4_4}
  L4_4 = Player
  L4_4 = L4_4.kAbility_Slider
  L4_4 = Fn_unLockPlayerAbility
  L5_5 = L3_3
  L6_6 = nil
  L4_4(L5_5, L6_6)
  L5_5 = L2_2
  L4_4 = L2_2.abort
  L4_4(L5_5)
  L4_4 = Fn_naviSet
  L5_5 = L1_1
  L4_4(L5_5)
  L4_4 = waitSeconds
  L5_5 = 2.5
  L4_4(L5_5)
  L4_4 = Fn_tutorialCaption
  L5_5 = "slider"
  L4_4(L5_5)
  while true do
    L4_4 = _phaseNum
    if L4_4 ~= 1 then
      L4_4 = wait
      L4_4()
    end
  end
  L4_4 = Sound
  L5_5 = L4_4
  L4_4 = L4_4.playSE
  L6_6 = "success"
  L4_4(L5_5, L6_6)
  L4_4 = findGameObject2
  L5_5 = "Node"
  L6_6 = "locator2_13"
  L4_4 = L4_4(L5_5, L6_6)
  L5_5 = Fn_naviSet
  L6_6 = L4_4
  L5_5(L6_6)
  while true do
    L5_5 = _phaseNum
    if L5_5 ~= 2 then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = Sound
  L6_6 = L5_5
  L5_5 = L5_5.playSE
  L7_7 = "success"
  L5_5(L6_6, L7_7)
  L5_5 = findGameObject2
  L6_6 = "Node"
  L7_7 = "locator2_14"
  L5_5 = L5_5(L6_6, L7_7)
  L6_6 = Fn_naviSet
  L7_7 = L5_5
  L6_6(L7_7)
  while true do
    L6_6 = _phaseNum
    if L6_6 ~= 3 then
      L6_6 = wait
      L6_6()
    end
  end
  L6_6 = Sound
  L7_7 = L6_6
  L6_6 = L6_6.playSE
  L6_6(L7_7, "success")
  L6_6 = findGameObject2
  L7_7 = "Node"
  L6_6 = L6_6(L7_7, "locator2_15")
  L7_7 = Fn_naviSet
  L7_7(L6_6)
  while true do
    L7_7 = _phaseNum
    if L7_7 ~= 4 then
      L7_7 = wait
      L7_7()
    end
  end
  L7_7 = Sound
  L7_7 = L7_7.playSE
  L7_7(L7_7, "success")
  L7_7 = findGameObject2
  L7_7 = L7_7("Node", "locator2_sm98_c_goal")
  Fn_naviSet(L7_7)
  while _isTutorialClear ~= true do
    wait()
  end
  Sound:playSE("success")
  Fn_tutorialCaptionKill()
  Player:setGravityControlMode(false)
  Fn_userCtrlOff()
  waitSeconds(1)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_8, L1_9
end
function pccubesensor2_12_OnEnter()
  if _phaseNum == 0 then
    Fn_naviKill()
    _phaseNum = 1
  end
end
function pccubesensor2_13_OnEnter()
  if _phaseNum == 1 then
    Fn_naviKill()
    _phaseNum = 2
  end
end
function pccubesensor2_14_OnEnter()
  if _phaseNum == 2 then
    Fn_naviKill()
    _phaseNum = 3
  end
end
function pccubesensor2_15_OnEnter()
  if _phaseNum == 3 then
    Fn_naviKill()
    _phaseNum = 4
  end
end
function pccubesensor2_sm98_c_goal_OnEnter()
  if _phaseNum == 4 then
    Fn_captionViewEnd()
    Fn_naviKill()
    _isTutorialClear = true
  end
end
