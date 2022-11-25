dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
function Initialize()
  Fn_userCtrlAllOff()
end
function Ingame()
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSpawn")
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep09_a")
  Fn_sendEventComSb("setSensorVisible", false)
  Fn_missionStart()
  Fn_kaiwaDemoView("ep09_00110k")
  Fn_userCtrlOn()
  Fn_missionView("ep09_00100")
  waitSeconds(1.3)
  Fn_naviSet(findGameObject2("Node", "locator2_litho_01"))
  waitSeconds(2.5)
  if not Fn_isCaptionView("ep09_00101") then
    Fn_captionView("ep09_00101")
  end
  waitPhase()
  Fn_naviKill()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
