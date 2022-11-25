dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_waitStartedNpc("sm15_client")
  Fn_playMotionNpc("sm15_client", "trouble_00", false, {isRandom = true, isRepeat = true})
end
function Finalize()
  local L0_2
  L0_2 = {
    "sm15_client"
  }
  Fn_finalizeNpcKill("sm15", L0_2)
end
