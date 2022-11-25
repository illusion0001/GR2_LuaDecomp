dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_talkCnt = 0
_cid_pup = nil
_crow_pup = nil
_tkg_pup = nil
_guide_off_task = nil
_map_guide = nil
_map_view = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "cid01",
      type = "cid01",
      node = "locator2_fix_spawn_01"
    },
    {
      name = "crow01",
      type = "crow01",
      node = "locator2_fix_spawn_03"
    }
  }
  Fn_setupNpc(L0_0)
  _cid_pup = Fn_findNpcPuppet("cid01")
  _crow_pup = Fn_findNpcPuppet("crow01")
  Fn_setKaiwaDemo(_cid_pup, "sm98_00100k", tutorial_talk_end, true, nil, nil, nil, "\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\129\138\231\150\178\227\130\140\227\129\149\227\129\190")
  Fn_setKaiwaDemo(_crow_pup, "sm98_00200k", tutorial_talk_end, true, nil, nil, nil, "crow01")
end
function Ingame()
  local L0_1
  L0_1 = {
    Player.kAbility_AttrTuneSwitch
  }
  Fn_lockPlayerAbility(L0_1, nil)
  Fn_userCtrlAllOff()
  Fn_disableKaiwaDemo(_crow_pup)
  Fn_missionStart()
  waitSeconds(1)
  HUD:info("eps03_info_02", false)
  waitSeconds(0.5)
  Fn_missionView("\227\131\158\227\131\131\227\131\151\227\130\146\228\189\191\227\129\163\227\129\166\n\231\155\174\231\154\132\229\156\176\227\129\171\227\131\138\227\131\147\227\130\146\232\168\173\229\174\154\227\129\151\227\130\141\239\188\129")
  HUD:setMainMenuTutorialNavi(true)
  waitSeconds(2.8)
  _map_guide = invokeTask(function()
    _map_view = false
    repeat
      if _map_view == false then
        _map_view = true
        Fn_tutorialCaption("map")
        Fn_userCtrlAllOff()
        _guide_off_task = invokeSystemTask(guide_off)
      end
      wait()
    until HUD:isMainMenuTutorialNaviSelect()
  end)
  while HUD:isMainMenuTutorialNaviSelect() ~= true do
    wait()
  end
  HUD:setMainMenuTutorialNavi(false)
  Fn_tutorialCaptionKill()
  Fn_missionView("\230\131\133\229\160\177\227\130\173\227\131\163\227\131\169\227\130\175\227\130\191\227\131\188\227\129\168\228\188\154\232\169\177\227\129\151\227\130\141\239\188\129")
  if _guide_off_task ~= nil then
    _guide_off_task:abort()
  end
  if _map_guide ~= nil then
    _map_guide:abort()
  end
  Fn_userCtrlOn()
  while 1 > _talkCnt do
    wait()
  end
  waitSeconds(2)
  Fn_missionView("\230\131\133\229\160\177\227\130\173\227\131\163\227\131\169\227\130\175\227\130\191\227\131\188\227\129\168\228\188\154\232\169\177\227\129\151\227\130\141\239\188\129")
  waitSeconds(2.8)
  Fn_tutorialCaption("map")
  _guide_off_task = invokeSystemTask(guide_off)
  Fn_enableKaiwaDemo(_crow_pup)
  while _talkCnt < 2 do
    wait()
  end
  if _guide_off_task ~= nil then
    _guide_off_task:abort()
  end
  Fn_userCtrlOff()
  waitSeconds(1)
  HUD:info("eps03_info_03", false)
  waitSeconds(1)
  HUD:fadeout(1, 2)
  Fn_captionViewWait("\228\187\165\228\184\138\227\129\167\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\185\227\131\134\227\131\188\227\130\184\227\129\175\231\181\130\228\186\134\227\129\167\227\129\153\227\128\130\227\129\138\231\150\178\227\130\140\227\129\149\227\129\190\227\129\167\227\129\151\227\129\159\227\128\130", 5, 5, Font.kLayerFront)
  Fn_setNextMissionFlag("sm98_header")
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
function tutorial_talk_end()
  Fn_naviKill()
  _talkCnt = _talkCnt + 1
end
function guide_off()
  repeat
    wait()
  until Pad:getButton(Pad.kButton_LR) or HUD:menuStatus("Main").state == "running" or HUD:isMainMenuTutorialNaviSelect()
  Fn_tutorialCaptionKill()
  _map_view = false
end
