dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  Fn_setNpcActive("ep07_sis_01", false)
  Fn_setNpcActive("ep07_gawa_01", false)
  repeat
    wait()
  until Fn_sendEventComSb("getFreighterHundle")
  Fn_loadEventData("evx/ep07_d_ve_f", {
    "evarea2_ve_f"
  }, true)
end
function Ingame()
  local L0_0
  while true do
    L0_0 = Fn_sendEventComSb
    L0_0 = L0_0("missionPartInitIsEnd")
    if L0_0 == false then
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_sendEventComSb
  L0_0("missionPartMainStart")
  L0_0 = false
  while Fn_sendEventComSb("missionPartMainIsEnd") == false do
    wait()
    L0_0 = Fn_sendEventComSb("missionPartMainIsRestart")
    if L0_0 ~= true then
    end
  end
  if L0_0 == true then
    Fn_missionRetry()
  end
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
