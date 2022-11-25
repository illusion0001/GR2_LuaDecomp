dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2
  L0_2 = Fn_waitStartedNpc
  L0_2("sm49_client")
  L0_2 = {}
  L0_2.mot = "man01_stay_01"
  Fn_loadNpcEventMotion("sm49_client", L0_2)
  Fn_playMotionNpc("sm49_client", L0_2.mot, false, {isRandom = true, isRepeat = true})
end
function Finalize()
  local L0_3
  L0_3 = {
    "sm49_client"
  }
  Fn_finalizeNpcKill("sm49", L0_3)
end
