dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/pdemo.lua")
_polydemo = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm39_director_01",
      type = "man18",
      node = "locator2_director_01",
      active = false
    },
    {
      name = "sm39_assistant_01",
      type = "man17",
      node = "locator2_assistant_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  _polydemo = PDemo.create("kit05_nurse_00", findGameObject2("Node", "warppoint2_prologue_pc_01"), {camera = true, scene_param = false})
end
function Ingame()
  Fn_userCtrlOff()
  Fn_missionStart()
  Fn_kaiwaDemoView("sm39_00100k")
  Fn_blackout()
  if Player:setAttrTune(Player.kAttrTune_Normal) == true then
    print("\227\131\142\227\131\188\227\131\158\227\131\171\227\131\129\227\131\165\227\131\188\227\131\179\227\129\184\229\164\137\230\155\180\227\129\151\227\129\190\227\129\151\227\129\159")
  end
  while _polydemo:isLoading() == false do
    wait()
  end
  _polydemo:play()
  Fn_fadein()
  while _polydemo:isEnd() == false do
    wait()
  end
  Fn_blackout()
  _polydemo:stop(0)
  _polydemo:try_term()
  Fn_setCostume("kit05")
  Fn_disableCostumeChange(true)
  Fn_resetPcPos("warppoint2_prologue_pc_01")
  Fn_setNpcActive("sm39_director_01", true)
  Fn_setNpcActive("sm39_assistant_01", true)
  Fn_warpNpc("sm39_client", "warppoint2_prologue_client_01")
  Fn_playMotionNpc("sm39_assistant_01", "talk_angry_00", false, {isRepeat = true})
  Fn_playMotionNpc("sm39_client", "idle_00", false)
  Fn_fadein()
  waitSeconds(2)
  Fn_kaiwaDemoView("sm39_00200k")
  Fn_blackout()
  Fn_setNpcActive("sm39_director_01", false)
  Fn_setNpcActive("sm39_assistant_01", false)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
