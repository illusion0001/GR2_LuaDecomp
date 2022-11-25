dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep17_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3
  L0_2 = 0
  L1_3 = Fn_missionStart
  L1_3()
  L1_3 = Player
  L1_3 = L1_3.setStay
  L1_3(L1_3, false)
  L1_3 = Fn_userCtrlOn
  L1_3()
  L1_3 = invokeTask
  L1_3 = L1_3(function()
    while true do
      if L0_2 == 2 then
        if Fn_sendEventComSb("checkMissionRetry") then
          Fn_sendEventComSb("resetMissionRetry")
          Fn_sendEventComSb("retry_e3")
        end
      else
      end
      if not Fn_sendEventComSb("checkMissionRetry") then
        wait()
      end
    end
    Fn_sendEventComSb("resetMissionRetry")
    Fn_missionRetry()
  end)
  Fn_sendEventComSb("requestSection", "e1")
  waitComNextPhase()
  waitSeconds(1)
  L0_2 = 1
  Fn_sendEventComSb("requestSection", "e2")
  waitComNextPhase()
  L0_2 = 2
  Fn_sendEventComSb("requestSection", "e3")
  waitComNextPhase()
  L0_2 = 3
  L1_3 = Mv_safeTaskAbort(L1_3)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_4, L1_5
end
