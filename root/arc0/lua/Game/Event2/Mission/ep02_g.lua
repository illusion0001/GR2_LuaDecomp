dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
_next_phase = false
function Initialize()
  _npc_misai = "npcgen2_misai_01"
  HUD:enemymarkerSetRange()
end
function Ingame()
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  Fn_sendEventComSb("requestPartG", 1)
  waitComNextPhase()
  Fn_missionStart()
  Fn_userCtrlOn()
  waitSeconds(2)
  Fn_missionView("ep02_05002")
  Fn_sendEventComSb("requestPartG", 2)
  invokeTask(function()
    waitSeconds(30)
    Fn_setBgmPoint("event", "battle_2")
  end)
  waitComNextPhase()
  Fn_setBgmPoint("event", "battle_end")
  Fn_coercionGravityRevert()
  Fn_sendEventComSb("requestPartG", 3)
  waitComNextPhase()
  Player:setStay(false)
  if GameDatabase:get(ggd.Savedata__Info__ep02__ep02_info_12) == 0 then
    GameDatabase:set(ggd.Savedata__Info__ep02__ep02_info_12, 1)
    GameDatabase:backup(ggd.Savedata__Info__ep02__ep02_info_12)
  end
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
function pcspheresensor2_warp_g_OnEnter()
  local L0_2, L1_3
end
function pcspheresensor2_warp_g_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep02_05003")
  end)
end
