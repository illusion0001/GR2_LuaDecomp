dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  while true do
    if Fn_isValidNpc("ep06_riz01", 30) == false then
      Fn_disappearNpc("ep06_riz01")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2
  L0_2 = {"ep06_riz01"}
  Fn_finalizeNpcKill("ep06", L0_2)
end
