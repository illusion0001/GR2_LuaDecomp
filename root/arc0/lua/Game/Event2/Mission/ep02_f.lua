dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
_next_phase = false
function Initialize()
  _npc_misai = "npcgen2_misai_01"
  HUD:enemymarkerSetRange()
end
function Ingame()
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  Fn_sendEventComSb("requestPartF", 1)
  waitComNextPhase()
  Fn_missionStart()
  Fn_userCtrlOn()
  invokeTask(function()
    Fn_captionViewWait("ep02_05000")
    Fn_captionView("ep02_05001")
  end)
  waitSeconds(2)
  Fn_missionView("ep02_05002")
  Fn_sendEventComSb("requestPartF", 2)
  waitComNextPhase()
  Fn_sendEventComSb("requestPartF", 3)
  waitComNextPhase()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
function pcspheresensor2_warp_f_OnEnter()
  local L0_2, L1_3
end
function pcspheresensor2_warp_f_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep02_05003")
  end)
end
