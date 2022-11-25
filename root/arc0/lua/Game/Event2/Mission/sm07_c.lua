dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
function Initialize()
  Fn_getGameObject("enemyManager"):setExcludeFlag_event_x(true)
end
function Ingame()
  while Fn_sendEventComSb("isEndInitC") == false do
    wait()
  end
  Fn_missionStart()
  Fn_sendEventComSb("startC")
  while Fn_sendEventComSb("isEndC") == false do
    wait()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_getGameObject("enemyManager"):setExcludeFlag_event_x(false)
end
