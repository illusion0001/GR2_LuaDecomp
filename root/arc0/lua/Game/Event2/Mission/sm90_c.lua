dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  Fn_userCtrlOff()
end
function Ingame()
  Fn_missionStart()
  Fn_getGameObject("MineManager"):sendEvent("viewOreToTalisman")
  waitSeconds(0.5)
  Fn_kaiwaDemoView("sm90_00200k")
  waitSeconds(0.5)
  Fn_userCtrlOn()
  Sound:pulse("mission_clear")
  Fn_setKeepPlayerPos()
  Fn_nextMission()
  Fn_setNextMissionFlag()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
