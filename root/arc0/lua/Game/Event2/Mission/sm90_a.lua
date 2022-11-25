dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
function Initialize()
  Fn_userCtrlOff()
end
function Ingame()
  Fn_missionStart()
  Fn_kaiwaDemoView("sm90_00100k")
  Fn_userCtrlOn()
  Fn_craneShipGoToMine("homeToMine", event_name, "po")
  Fn_exitSandbox()
end
function Finalize()
  local L0_0, L1_1
end
