dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
import("GlobalGem")
_phaseNum = 0
_isGemInfoFinished = false
_isTutorialClear = false
function Initialize()
  GlobalGem:SetEnargyGemGetCallback("onGetEnargyGem")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
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
  L5_5 = Player
  L5_5 = L5_5.kAbility_KickCombo
  L1_1 = Fn_lockPlayerAbility
  L2_2 = L0_0
  L3_3 = nil
  L1_1(L2_2, L3_3)
  L1_1 = Fn_missionStart
  L1_1()
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_02"
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
  L5_5 = "ep02_info_02"
  L3_3(L4_4, L5_5, false)
  L3_3 = waitSeconds
  L4_4 = 0.5
  L3_3(L4_4)
  L3_3 = Fn_missionView
  L4_4 = "\233\135\141\229\138\155\227\130\146\230\147\141\228\189\156\227\129\151\227\129\166\230\140\135\229\174\154\227\129\174\229\163\129\227\129\171\231\171\139\227\129\166\239\188\129"
  L3_3(L4_4)
  L3_3 = waitSeconds
  L4_4 = 1.3
  L3_3(L4_4)
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = {L4_4}
  L4_4 = Player
  L4_4 = L4_4.kAbility_GravityShift
  L4_4 = Fn_unLockPlayerAbility
  L5_5 = L3_3
  L4_4(L5_5, nil)
  L4_4 = {}
  L4_4.l_stick = true
  L4_4.r_stick = true
  L4_4.g_infinite = true
  L5_5 = Fn_lockPlayerAbility
  L5_5(nil, L4_4)
  L5_5 = Fn_naviSet
  L5_5(L1_1)
  L5_5 = waitSeconds
  L5_5(2.5)
  L5_5 = Fn_tutorialCaption
  L5_5("gravity_ep02_01")
  L5_5 = {}
  L5_5.r_stick = true
  L4_4 = L5_5
  L5_5 = Fn_unLockPlayerAbility
  L5_5(nil, L4_4)
  L5_5 = L2_2.abort
  L5_5(L2_2)
  while true do
    L5_5 = _phaseNum
    if L5_5 ~= 1 then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = Sound
  L5_5 = L5_5.playSE
  L5_5(L5_5, "success")
  L5_5 = Fn_tutorialCaptionKill
  L5_5()
  L5_5 = Fn_userCtrlOff
  L5_5()
  L5_5 = waitSeconds
  L5_5(1)
  L5_5 = findGameObject2
  L5_5 = L5_5("Node", "locator2_03")
  L1_1 = L5_5
  L5_5 = Fn_lookAtObject
  L5_5 = L5_5(L1_1)
  L2_2 = L5_5
  L5_5 = waitSeconds
  L5_5(1.5)
  L5_5 = Fn_missionView
  L5_5("\231\155\174\231\154\132\229\156\176\227\129\184\231\167\187\229\139\149\227\129\151\227\130\141\239\188\129")
  L5_5 = waitSeconds
  L5_5(1.3)
  L5_5 = {
    Player.kAbility_Walk,
    Player.kAbility_Run,
    Player.kAbility_Jump
  }
  L3_3 = L5_5
  L5_5 = {}
  L5_5.g_infinite = true
  L4_4 = L5_5
  L5_5 = Fn_unLockPlayerAbility
  L5_5(L3_3, L4_4)
  L5_5 = Fn_userCtrlOn
  L5_5()
  L5_5 = Fn_naviSet
  L5_5(L1_1)
  L5_5 = waitSeconds
  L5_5(2.5)
  L5_5 = Fn_tutorialCaption
  L5_5("move_ep02_01")
  L5_5 = L2_2.abort
  L5_5(L2_2)
  while true do
    L5_5 = _phaseNum
    if L5_5 ~= 2 then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = Sound
  L5_5 = L5_5.playSE
  L5_5(L5_5, "success")
  L5_5 = Fn_tutorialCaptionKill
  L5_5()
  L5_5 = checkGemInfoStart
  L5_5()
  while true do
    L5_5 = _isGemInfoFinished
    if L5_5 ~= true then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = Fn_userCtrlOff
  L5_5()
  L5_5 = waitSeconds
  L5_5(1)
  L5_5 = findGameObject2
  L5_5 = L5_5("Node", "locator2_04")
  L1_1 = L5_5
  L5_5 = Fn_lookAtObject
  L5_5 = L5_5(L1_1)
  L2_2 = L5_5
  L5_5 = waitSeconds
  L5_5(1.5)
  L5_5 = Fn_missionView
  L5_5("\233\135\141\229\138\155\230\147\141\228\189\156\227\130\146\232\167\163\233\153\164\227\129\151\227\130\141\239\188\129")
  L5_5 = waitSeconds
  L5_5(1.3)
  L5_5 = {
    Player.kAbility_GravityRevert
  }
  L3_3 = L5_5
  L5_5 = Fn_unLockPlayerAbility
  L5_5(L3_3, nil)
  L5_5 = {
    Player.kAbility_Walk,
    Player.kAbility_Run,
    Player.kAbility_Jump
  }
  L0_0 = L5_5
  L5_5 = {}
  L5_5.l_stick = true
  L4_4 = L5_5
  L5_5 = Fn_lockPlayerAbility
  L5_5(L0_0, L4_4)
  L5_5 = Fn_userCtrlOn
  L5_5()
  L5_5 = Fn_naviSet
  L5_5(L1_1)
  L5_5 = waitSeconds
  L5_5(2.5)
  L5_5 = Fn_tutorialCaption
  L5_5("gravitycancel_ep02_01")
  L5_5 = L2_2.abort
  L5_5(L2_2)
  while true do
    L5_5 = isFloat
    L5_5 = L5_5()
    if L5_5 == true then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = {
    Player.kAbility_Walk,
    Player.kAbility_Run,
    Player.kAbility_Jump
  }
  L3_3 = L5_5
  L5_5 = Fn_unLockPlayerAbility
  L5_5(L3_3, nil)
  while true do
    L5_5 = _phaseNum
    if L5_5 ~= 3 then
      L5_5 = wait
      L5_5()
    end
  end
  L5_5 = Sound
  L5_5 = L5_5.playSE
  L5_5(L5_5, "success")
  L5_5 = Fn_tutorialCaptionKill
  L5_5()
  L5_5 = Fn_userCtrlOff
  L5_5()
  L5_5 = waitSeconds
  L5_5(1)
  L5_5 = findGameObject2
  L5_5 = L5_5("Node", "locator2_05")
  L1_1 = L5_5
  L5_5 = Fn_lookAtObject
  L5_5 = L5_5(L1_1)
  L2_2 = L5_5
  L5_5 = waitSeconds
  L5_5(1.5)
  L5_5 = Fn_missionView
  L5_5("\230\140\135\229\174\154\227\129\174\228\189\141\231\189\174\227\129\167\231\169\186\228\184\173\230\181\174\233\129\138\227\129\151\227\130\141\239\188\129")
  L5_5 = waitSeconds
  L5_5(1.3)
  L5_5 = Fn_userCtrlOn
  L5_5()
  L5_5 = Fn_naviSet
  L5_5(L1_1)
  L5_5 = waitSeconds
  L5_5(2.5)
  L5_5 = Fn_tutorialCaption
  L5_5("gravity_ep02_01")
  L5_5 = L2_2.abort
  L5_5(L2_2)
  L5_5 = L1_1.getWorldPos
  L5_5 = L5_5(L1_1)
  while isFloatNear(L5_5, 10) == false do
    wait()
  end
  Sound:playSE("success")
  Fn_tutorialCaptionKill()
  Fn_naviKill()
  _phaseNum = 4
  Fn_userCtrlOff()
  waitSeconds(1)
  L1_1 = findGameObject2("Node", "locator2_06")
  L2_2 = Fn_lookAtObject(L1_1)
  waitSeconds(1.5)
  Fn_missionView("\233\135\141\229\138\155\230\147\141\228\189\156\227\130\146\232\167\163\233\153\164\227\129\151\227\130\141\239\188\129")
  waitSeconds(1.3)
  Fn_userCtrlOn()
  Fn_naviSet(L1_1)
  waitSeconds(2.5)
  Fn_tutorialCaption("gravitycancel_ep02_01")
  L2_2:abort()
  while _phaseNum ~= 5 do
    wait()
  end
  Sound:playSE("success")
  Fn_tutorialCaptionKill()
  Fn_naviKill()
  Fn_userCtrlOff()
  waitSeconds(1)
  L1_1 = findGameObject2("Node", "locator2_07")
  L2_2 = Fn_lookAtObject(L1_1)
  waitSeconds(1.5)
  Fn_missionView("\233\135\141\229\138\155\227\130\146\230\147\141\228\189\156\227\129\151\231\155\174\231\154\132\229\156\176\227\129\184\231\167\187\229\139\149\227\129\151\227\130\141\239\188\129")
  waitSeconds(1.3)
  Fn_userCtrlOn()
  Fn_naviSet(L1_1)
  waitSeconds(2.5)
  L2_2:abort()
  while _phaseNum ~= 6 do
    wait()
  end
  Sound:playSE("success")
  Fn_naviKill()
  waitSeconds(1)
  L1_1 = findGameObject2("Node", "locator2_16")
  L2_2 = Fn_lookAtObject(L1_1)
  waitSeconds(1.5)
  L2_2:abort()
  Fn_naviSet(L1_1)
  while _phaseNum ~= 7 do
    wait()
  end
  Sound:playSE("success")
  Fn_naviKill()
  waitSeconds(1)
  L1_1 = findGameObject2("Node", "locator2_08")
  L2_2 = Fn_lookAtObject(L1_1)
  waitSeconds(1.5)
  L2_2:abort()
  Fn_naviSet(L1_1)
  while _phaseNum ~= 8 do
    wait()
  end
  Sound:playSE("success")
  Fn_naviKill()
  waitSeconds(1)
  L1_1 = findGameObject2("Node", "locator2_09")
  L2_2 = Fn_lookAtObject(L1_1)
  waitSeconds(1.5)
  L2_2:abort()
  Fn_naviSet(L1_1)
  while _phaseNum ~= 9 do
    wait()
  end
  Sound:playSE("success")
  Fn_naviKill()
  waitSeconds(1)
  L1_1 = findGameObject2("Node", "locator2_10")
  L2_2 = Fn_lookAtObject(L1_1)
  waitSeconds(1.5)
  L2_2:abort()
  Fn_naviSet(L1_1)
  while _phaseNum ~= 10 do
    wait()
  end
  Sound:playSE("success")
  Fn_naviKill()
  Fn_userCtrlOff()
  waitSeconds(1)
  L1_1 = findGameObject2("Node", "locator2_11")
  L2_2 = Fn_lookAtObject(L1_1)
  waitSeconds(1.5)
  Fn_missionView("\233\135\141\229\138\155\232\144\189\228\184\139\227\129\167\231\155\174\231\154\132\229\156\176\227\129\184\231\167\187\229\139\149\227\129\151\227\130\141\239\188\129")
  waitSeconds(1.3)
  HUD:info("ep02_info_04", false)
  waitSeconds(0.5)
  Fn_userCtrlOn()
  Fn_naviSet(L1_1)
  waitSeconds(2.5)
  Fn_tutorialCaption("gravitymove")
  L2_2:abort()
  L3_3 = {
    Player.kAbility_GravityBoost
  }
  Fn_unLockPlayerAbility(L3_3, nil)
  while _isTutorialClear == false do
    wait()
  end
  Sound:playSE("success")
  Fn_naviKill()
  Fn_userCtrlOff()
  Fn_tutorialCaptionKill()
  waitSeconds(1)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_6, L1_7
end
function isFloatNear(A0_8, A1_9)
  if A1_9 > Fn_get_distance(A0_8, Fn_getPcPosRot()) and isFloat() then
    return true
  end
  return false
end
function isFloat()
  if Player:isGravityControlMode() and Player:getAction() == Player.kAction_Float then
    return true
  else
    return false
  end
end
function pccubesensor2_02_OnEnter()
  if _phaseNum == 0 then
    Fn_captionViewEnd()
    Fn_naviKill()
    _phaseNum = 1
  end
end
function pccubesensor2_03_OnEnter()
  if _phaseNum == 1 then
    Fn_captionViewEnd()
    Fn_naviKill()
    _phaseNum = 2
  end
end
function pccubesensor2_04_OnEnter()
  if _phaseNum == 2 then
    Fn_captionViewEnd()
    Fn_naviKill()
    _phaseNum = 3
  end
end
function pccubesensor2_06_OnEnter()
  if _phaseNum == 4 then
    Fn_captionViewEnd()
    Fn_naviKill()
    _phaseNum = 5
  end
end
function pccubesensor2_07_OnEnter()
  if _phaseNum == 5 then
    Fn_naviKill()
    _phaseNum = 6
  end
end
function pccubesensor2_16_OnEnter()
  if _phaseNum == 6 then
    Fn_naviKill()
    _phaseNum = 7
  end
end
function pccubesensor2_08_OnEnter()
  if _phaseNum == 7 then
    Fn_naviKill()
    _phaseNum = 8
  end
end
function pccubesensor2_09_OnEnter()
  if _phaseNum == 8 then
    Fn_naviKill()
    _phaseNum = 9
  end
end
function pccubesensor2_10_OnEnter()
  if _phaseNum == 9 then
    Fn_naviKill()
    _phaseNum = 10
  end
end
function pccubesensor2_11_OnEnter()
  if _phaseNum == 10 then
    Fn_captionViewEnd()
    Fn_naviKill()
    _isTutorialClear = true
  end
end
function checkGemInfoStart()
  if _isGemInfoFinished == false then
    waitSeconds(1)
    HUD:info("ep02_info_03", false)
    _isGemInfoFinished = true
  end
end
function onGetEnargyGem()
  if _isGemInfoFinished == false then
    HUD:info("ep02_info_03", false)
    _isGemInfoFinished = true
  end
end
function pccubesensor2_warp_02_OnLeave()
  if _phaseNum ~= 0 then
    return
  end
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
function pccubesensor2_warp_03_OnLeave()
  if _phaseNum ~= 1 then
    return
  end
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_pc_restart_pos_01")
    Player:setStay(true)
    Fn_userCtrlOff()
    Fn_catWarpIn()
    Fn_catWarpCheckPoint()
    Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
    Player:setStay(false)
    Fn_userCtrlOn()
    Fn_catWarpOut()
  end)
end
