dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_userCtrlOff()
  Fn_missionStart()
  Fn_kaiwaDemoView("sm30_00100k")
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
