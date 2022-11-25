dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Share/em01.lua")
function Initialize()
  setLivestock()
end
function Ingame()
  Fn_missionStart()
  Fn_kaiwaDemoView("sm94_00100k")
  runLivestock()
  Fn_kaiwaDemoView("sm94_00200k")
  waitSeconds(0.5)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  endLivestock()
end
