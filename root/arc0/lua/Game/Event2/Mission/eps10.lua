dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    {
      name = "ep10_crow",
      type = "crow01",
      node = "locator2_crow_01_01"
    }
  }
  Fn_setupNpc(L0_0)
end
function Ingame()
  Fn_missionStart()
  Fn_digoutResultForMission()
  if g_own:getGameObject("soundManager") then
    g_own:getGameObject("soundManager"):sendEvent("requestJingle", "mission_clear")
  end
  Fn_captionViewWait("ep10_00001")
  HUD:info("eps10_info_01", false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
