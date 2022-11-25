dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/ep07_common.lua")
function Initialize()
  Fn_loadEventData("evx/ep07_setup", {
    "evarea2_po_a_01"
  }, true)
end
function Ingame()
  Fn_waitStartedNpc("ep07_sis_01")
  ep07_ftNpcSetSightTarget("locator2_monitor_01")
end
function Finalize()
  local L0_0
  L0_0 = {
    "ep07_sis_01"
  }
  Fn_finalizeNpcKill("ep07", L0_0)
end
