dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm03_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_playMotionNpc("sm13_client", "cry_00", false)
  Fn_playMotionNpc("sm13_bird_sdemo", "stay_01", false)
  while true do
    if Fn_isValidNpc("sm13_client") == false then
      Fn_disappearNpc("sm13_client")
      Fn_disappearNpc("sm13_bird_sdemo")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2, L1_3
end
