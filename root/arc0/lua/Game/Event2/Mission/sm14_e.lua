dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    {
      name = "sm14_crow",
      type = "crow01",
      node = "locator2_crow_e"
    }
  }
  Fn_setupNpc(L0_0)
end
function Ingame()
  local L0_1
  L0_1 = Fn_warpNpc
  L0_1("miz01", "locator2_client_e_pos")
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = waitSeconds
  L0_1(1)
  function L0_1()
    waitSeconds(1)
    Fn_disappearNpc("sm14_crow")
    Fn_disappearNpc("miz01")
  end
  Fn_kaiwaDemoView2("sm14_01000k", L0_1)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
