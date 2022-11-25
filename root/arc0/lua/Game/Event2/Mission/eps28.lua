dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  Fn_userCtrlAllOff()
  HUD:furnitureReconfiguration("ft28")
end
function Ingame()
  Fn_missionStart()
  HUD:info("eps28_info_01", false)
  wait()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
