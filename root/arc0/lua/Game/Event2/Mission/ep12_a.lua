dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_title = false
_puppet_crow = nil
_brain_crow = nil
_caption_01 = false
_caption_02 = false
_caption_03 = false
_caption_04 = false
_caption_05 = false
function Initialize()
  Fn_userCtrlAllOff()
  Fn_vctrlOff("vctrl2_gm")
end
function Ingame()
  Fn_setCatWarp(false)
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  Fn_missionStart()
  Fn_kaiwaDemoView("ep12_00000k")
  Fn_vctrlOn("vctrl2_gm")
  waitSeconds(1)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_gm"):getWorldPos())
  waitSeconds(1)
  Fn_vctrlOff("vctrl2_gm")
  Fn_userCtrlOn()
  invokeTask(function()
    Fn_missionView("ep12_00100")
    waitSeconds(1.3)
    Fn_naviSet(Fn_sendEventComSb("requestHandle", "Node", "locator2_central_tower_navi"))
    waitSeconds(2.5)
    Fn_captionView("ep12_00101")
  end)
  caption_dialogue()
  repeat
    wait()
  until Fn_sendEventComSb("isTitleStart")
  Fn_naviKill()
  if HUD:isPhotoMode() or HUD:isPhotoModePlayingAnim() then
    HUD:setPhotoMode(false)
  end
  Fn_playCDemo("ep12_00100c")
  GameDatabase:set(ggd.EventFlags__ep12__flag01, 1)
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function caption_dialogue()
  repeat
    wait()
  until Fn_sendEventComSb("caption01Sensor")
  _caption_01 = true
  Fn_captionViewWait("ep12_00102")
  invokeTask(function()
    repeat
      wait()
    until Fn_sendEventComSb("caption02Sensor")
    _caption_02 = true
  end)
  EventHelper:timerCallback("caption_02_wait", 6, function()
    local L0_0, L1_1
    _caption_02 = true
  end)
  repeat
    wait()
  until _caption_02
  Fn_captionViewWait("ep12_00103")
  repeat
    wait()
  until Fn_sendEventComSb("caption03Sensor")
  _caption_03 = true
  Fn_captionViewWait("ep12_00104")
  invokeTask(function()
    repeat
      wait()
    until Fn_sendEventComSb("caption04Sensor")
    _caption_04 = true
  end)
  EventHelper:timerCallback("caption_03_wait", 6, function()
    local L0_2, L1_3
    _caption_04 = true
  end)
  repeat
    wait()
  until _caption_04
  Fn_captionViewWait("ep12_00105")
  invokeTask(function()
    repeat
      wait()
    until Fn_sendEventComSb("caption04Sensor")
    _caption_05 = true
  end)
  EventHelper:timerCallback("caption_04_wait", 6, function()
    local L0_4, L1_5
    _caption_05 = true
  end)
  repeat
    wait()
  until _caption_05
  Fn_captionView("ep12_00106")
end
function Finalize()
  local L0_6, L1_7
end
