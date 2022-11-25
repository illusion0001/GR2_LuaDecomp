dofile("/Game/Event2/Common/CommonAll.lua")
function Fn_warshipShellingOn()
  bgManager:sendEvent("requestWarshipShellingOn")
end
function Fn_warshipShellingOnAutoAlert()
  bgManager:sendEvent("requestWarshipShellingOnAutoAlert")
end
function Fn_warshipShellingOff()
  bgManager:sendEvent("requestWarshipShellingOff")
end
function Fn_MechCannonStartBlankMode(A0_0, A1_1)
  bgManager:sendEvent("requestMechCannonStartBlankMode", A0_0, A1_1)
end
function Fn_MechCannonEndBlankMode()
  bgManager:sendEvent("requestMechCannonEndBlankMode")
end
function Fn_MechCannonStartControlMode()
  bgManager:sendEvent("requestMechCannonStartControlMode")
end
function Fn_MechCannonBlankShot()
  bgManager:sendEvent("requestMechCannonBlankShot")
end
function Fn_WarshipInvisible()
  bgManager:sendEvent("requestWarshipInvisible")
end
function Fn_warshipBroken(A0_2)
  bgManager:sendEvent("requestWarshipBroken", A0_2)
end
function Fn_IdlingMechCannon(A0_3)
  bgManager:sendEvent("requestIdlingMechCannon", A0_3)
end
function Fn_WaitMechCannonShot()
  repeat
    wait()
  until bgManager:sendEvent("isMechCannonShot")
end
function Fn_MechCannonShotClear()
  bgManager:sendEvent("requestMechCannonShotClear")
end
function Fn_mechCannonTargetSupportChara()
  local L0_4, L1_5
end
function Fn_warshipWarpRequest(A0_6)
  if Fn_getGameObject("bgManager") then
    Fn_getGameObject("bgManager"):sendEvent("requestWarshipWarp", A0_6)
  end
end
function Fn_GetMechCannonMax()
  if Fn_getGameObject("bgManager") then
    return Fn_getGameObject("bgManager"):sendEvent("requestGetMechCannonMax")
  end
  return 0
end
