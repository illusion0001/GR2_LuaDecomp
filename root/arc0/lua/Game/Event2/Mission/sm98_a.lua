dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_isTutorialClear = false
function Initialize()
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    Player.kAbility_KickCombo,
    Player.kAbility_GravityShift,
    Player.kAbility_GravityRevert,
    Player.kAbility_GravityBoost,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_SliderKick,
    Player.kAbility_Grab,
    Player.kAbility_AttrTuneSwitch
  }
  L1_1 = Player
  L1_1 = L1_1.kAbility_Walk
  L2_2 = Player
  L2_2 = L2_2.kAbility_Run
  L3_3 = Player
  L3_3 = L3_3.kAbility_Dodge
  L4_4 = Player
  L4_4 = L4_4.kAbility_Jump
  L1_1 = Fn_lockPlayerAbility
  L2_2 = L0_0
  L3_3 = nil
  L1_1(L2_2, L3_3)
  L1_1 = waitSeconds
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = Fn_missionView
  L2_2 = "\229\183\166\227\130\146\229\144\145\227\129\132\227\129\166\231\155\174\231\154\132\229\156\176\227\130\146\231\162\186\232\170\141\227\129\151\227\130\141\239\188\129"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1.3
  L1_1(L2_2)
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_01"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = Fn_naviSet
  L3_3 = L1_1
  L2_2(L3_3)
  L2_2 = waitSeconds
  L3_3 = 2.5
  L2_2(L3_3)
  L2_2 = Fn_captionView
  L3_3 = "ic_tutorial_00050"
  L4_4 = 0
  L2_2(L3_3, L4_4)
  L2_2 = Fn_userCtrlOn
  L2_2()
  while true do
    L2_2 = Fn_isInSightTarget
    L3_3 = L1_1
    L2_2 = L2_2(L3_3)
    if L2_2 == false then
      L2_2 = wait
      L2_2()
    end
  end
  L2_2 = Fn_lookAtObject
  L3_3 = L1_1
  L2_2 = L2_2(L3_3)
  L3_3 = Sound
  L4_4 = L3_3
  L3_3 = L3_3.playSE
  L3_3(L4_4, "success")
  L3_3 = Fn_userCtrlAllOff
  L3_3()
  L3_3 = Fn_captionViewEnd
  L3_3()
  L3_3 = waitSeconds
  L4_4 = 3
  L3_3(L4_4)
  L3_3 = Fn_missionView
  L4_4 = "\231\155\174\231\154\132\229\156\176\227\129\184\231\167\187\229\139\149\227\129\151\227\130\141\239\188\129"
  L3_3(L4_4)
  L3_3 = waitSeconds
  L4_4 = 1.3
  L3_3(L4_4)
  L3_3 = {
    L4_4,
    Player.kAbility_Run,
    Player.kAbility_Jump
  }
  L4_4 = Player
  L4_4 = L4_4.kAbility_Walk
  L4_4 = {}
  L4_4.l_stick = true
  L4_4.r_stick = true
  Fn_unLockPlayerAbility(L3_3, L4_4)
  Fn_userCtrlOn()
  L2_2:abort()
  waitSeconds(2.5)
  Fn_tutorialCaption("move_ep02_01")
  while _isTutorialClear == false do
    wait()
  end
  Sound:playSE("success")
  waitSeconds(1.5)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_5, L1_6
end
function pccubesensor2_01_OnEnter()
  Fn_captionViewEnd()
  Fn_naviKill()
  Fn_userCtrlOff()
  _isTutorialClear = true
end
function pccubesensor2_warp_01_OnLeave()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
    Player:setStay(true)
    Fn_userCtrlOff()
    Fn_catWarpIn()
    Fn_catWarpCheckPoint()
    Player:setStay(false)
    Fn_userCtrlOn()
    Fn_catWarpOut()
  end)
end
