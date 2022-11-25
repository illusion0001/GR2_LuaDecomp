dofile("/Game/Event2/Common/HeaderCommon.lua")
_cliant_name = "sm27_client"
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  while true do
    if Fn_isValidNpc(_cliant_name) == false then
      Fn_disappearNpc(_cliant_name)
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2, L1_3
end
