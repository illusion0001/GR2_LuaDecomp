dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
import("GlobalGem")
eps03_kaiwa_end = false
_menu_task = nil
_menu_running = false
_guide_off_task = nil
_salary_gem = 500
function Initialize()
  local L0_0
  L0_0 = findGameObject2
  L0_0 = L0_0("Node", "gem2_eps03_tutorial")
  gem_eps03_handle = L0_0
  L0_0 = gem_eps03_handle
  L0_0 = L0_0.setActive
  L0_0(L0_0, false)
  L0_0 = {
    {
      name = "cid01_ep03",
      type = "cid01",
      node = "locator2_cid01_01"
    }
  }
  Fn_setupNpc(L0_0)
  _cid_pup = Fn_findNpcPuppet("cid01_ep03")
  Fn_setKaiwaDemo(_cid_pup, "eps03_00030k", eps03_cid_kaiwa, true, nil, nil, nil)
  Fn_disableKaiwaDemo(_cid_pup)
end
function Ingame()
  Fn_setCatWarp(true)
  Fn_userCtrlAllOff()
  Fn_missionStart()
  Fn_kaiwaDemoView("eps03_00010k")
  Fn_menuLock()
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, false)
  GlobalGem:AddPreciousGemNum(_salary_gem)
  HUD:playGemSE(HUD.kGemSE_PreciousGemS, Fn_getPlayer())
  Fn_captionViewWait("ep03_00001")
  HUD:info("eps03_info_01", false)
  Fn_missionView("ep03_00004", nil, nil, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuPowerup, true)
  Fn_captionViewEnd()
  waitSeconds(0.5)
  Fn_unlockPlayerLevelCap("Combat")
  Fn_unlockPlayerLevelCap("Dodge")
  Fn_unlockPlayerLevelCap("GravityKick")
  Fn_unlockPlayerLevelCap("Grab")
  Fn_captionView("ep03_00002", 0)
  _menu_task = invokeSystemTask(function()
    repeat
      wait()
      menu_status = HUD:menuStatus("Main")
    until menu_status.state == "running"
    _menu_running = true
  end)
  while _menu_running == false do
    wait()
  end
  if _menu_task ~= nil then
    _menu_task:abort()
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Powerup, true)
  Fn_captionViewEnd()
  waitSeconds(0.7)
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Map, false)
  Fn_menuLock(true)
  Fn_kaiwaDemoView("eps03_00020k")
  Fn_enableKaiwaDemo(_cid_pup)
  wait(3)
  HUD:info("eps03_info_02", false)
  Fn_missionView("ep03_00005", nil, nil, true)
  HUD:setMainMenuTutorialNavi(true)
  waitSeconds(0.5)
  _map_guide = invokeTask(function()
    _map_view = false
    repeat
      if _map_view == false then
        _map_view = true
        Fn_tutorialCaption("map")
        Fn_userCtrlAllOff()
        _guide_off_task = invokeSystemTask(function()
          repeat
            wait()
          until Pad:getButton(Pad.kButton_LR) or HUD:menuStatus("Main").state == "running" or HUD:isMainMenuTutorialNaviSelect()
          Fn_tutorialCaptionKill()
          _map_view = false
        end)
      end
      wait()
    until HUD:isMainMenuTutorialNaviSelect()
  end)
  while HUD:isMainMenuTutorialNaviSelect() ~= true do
    wait()
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Map, true)
  HUD:setMainMenuTutorialNavi(false)
  Fn_tutorialCaptionKill()
  if _guide_off_task ~= nil then
    _guide_off_task:abort()
  end
  if _map_guide ~= nil then
    _map_guide:abort()
  end
  Fn_userCtrlOn()
  Fn_missionView("ep03_00003")
  while eps03_kaiwa_end == false do
    wait()
  end
  repeat
    wait()
  until GameDatabase:get(ggd.GlobalSystemFlags__IsMissionStart)
  if GameDatabase:get(ggd.Savedata__EventFlags__eps03__flag01) == 0 then
    HUD:info("eps03_info_03", false)
    GameDatabase:set(ggd.Savedata__EventFlags__eps03__flag01, 1)
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function eps03_cid_kaiwa()
  Fn_naviKill()
  eps03_kaiwa_end = true
end
function Finalize()
  if _guide_off_task ~= nil then
    _guide_off_task:abort()
  end
  if _menu_task ~= nil then
    _menu_task:abort()
  end
end
