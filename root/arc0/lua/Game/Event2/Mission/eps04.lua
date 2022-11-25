dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
import("GlobalGem")
_caption_task = nil
_tarisman_setting_complete = false
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setEnergy
  L2_2 = Player
  L2_2 = L2_2.kEnergy_Life
  L0_0(L1_1, L2_2, Player:getEnergyMax(Player.kEnergy_Life))
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setEnergy
  L2_2 = Player
  L2_2 = L2_2.kEnergy_Gravity
  L0_0(L1_1, L2_2, Player:getEnergyMax(Player.kEnergy_Gravity))
end
function Ingame()
  Fn_setCatWarp(true)
  Fn_lockPlayerAbility({
    Player.kAbility_AttrTuneSwitch
  })
  Fn_userCtrlAllOff()
  Fn_menuLock()
  Fn_missionStart()
  repeat
    wait()
  until HUD:captionGetTextId() == nil
  HUD:info("eps04_info_01", false, -1)
  Fn_missionView("ep04_00001", 0, nil, true)
  _caption_task = invokeTask(function()
    wait(10)
    if false == _tarisman_setting_complete then
      wait(10)
      if false == _tarisman_setting_complete then
        Fn_tutorialCaption("options")
      end
    end
  end)
  repeat
    wait()
  until nil ~= GlobalGem:getTalismanInfo(-1) or nil ~= GlobalGem:getTalismanInfo(-2) or nil ~= GlobalGem:getTalismanInfo(-3)
  _tarisman_setting_complete = true
  if nil ~= _caption_task then
    wait()
    _caption_task:abort()
    _caption_task = nil
  end
  Fn_missionViewEnd()
  Fn_missionInfoEnd()
  Fn_tutorialCaptionKill()
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Talisman, true)
  Fn_menuLock()
  Fn_userCtrlOn()
  repeat
    print(tostring(HUD:captionGetTextId()))
    wait()
  until HUD:captionGetTextId() == nil
  wait()
  Fn_captionViewWait("ep04_00003")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_3, L1_4
end
