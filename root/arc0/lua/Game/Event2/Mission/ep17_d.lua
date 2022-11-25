dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep17_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_missionStart()
  Player:setStay(false)
  Fn_userCtrlOn()
  invokeTask(function()
    while not Fn_sendEventComSb("checkMissionRetry") do
      wait()
    end
    Fn_sendEventComSb("resetMissionRetry")
    Fn_missionRetry()
  end)
  Fn_sendEventComSb("requestSection", "d1")
  waitComNextPhase()
  Fn_sendEventComSb("requestSection", "d2")
  waitComNextPhase()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
