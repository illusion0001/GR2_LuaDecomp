dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm30_director_01",
      type = "man18",
      node = "locator2_director_01",
      active = false
    },
    {
      name = "sm30_assistant_01",
      type = "man17",
      node = "locator2_assistant_01",
      active = false
    },
    {
      name = "sm30_assi_wom_01",
      type = "wom01",
      node = "locator2_assi_wom_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  _polydemo = PDemo.create("kit05_nurse_00", findGameObject2("Node", "locator2_pdemo_pos_01"), {camera = true, scene_param = false})
end
function Ingame()
  Fn_userCtrlOff()
  if Player:setAttrTune(Player.kAttrTune_Normal, true) == true then
    print("\227\131\142\227\131\188\227\131\158\227\131\171\227\131\129\227\131\165\227\131\188\227\131\179\227\129\184\229\164\137\230\155\180\227\129\151\227\129\190\227\129\151\227\129\159")
  end
  Fn_warpNpc("sm30_client", "warppoint2_prologue_client_01")
  Fn_playMotionNpc("sm30_client", "idle_00", false)
  Fn_setNpcActive("sm30_director_01", true)
  Fn_setNpcActive("sm30_assistant_01", true)
  Fn_setNpcActive("sm30_assi_wom_01", true)
  while _polydemo:isLoading() == false do
    wait()
  end
  _polydemo:play()
  Fn_missionStart()
  while _polydemo:isEnd() == false do
    wait()
  end
  Fn_blackout()
  _polydemo:stop(0)
  _polydemo:try_term()
  RAC_setCostumeWait("kit05", "locator2_start_pc_pos")
  Fn_disableCostumeChange(true)
  Fn_playMotionNpc("sm30_director_01", "stay_01", false)
  Fn_fadein()
  waitSeconds(1)
  Fn_kaiwaDemoView("sm30_00200k")
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
