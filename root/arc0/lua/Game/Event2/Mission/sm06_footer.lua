dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  while true do
    if Fn_isValidNpc("sm06_client", 40) == false then
      Fn_disappearNpc("sm06_client")
      Fn_disappearNpc("ryz_01")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2, L1_3
end
