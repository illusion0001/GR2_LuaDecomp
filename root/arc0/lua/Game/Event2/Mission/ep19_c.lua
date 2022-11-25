dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep19_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep19_c")
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_missionView("ep19_02000")
  waitSeconds(1.3)
  Fn_naviSet(findGameObject2("Node", "locator2_litho_01"))
  waitPhase()
  Fn_naviKill()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
