dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2
  L0_2 = Fn_waitStartedNpc
  L0_2("sm12_client")
  L0_2 = {}
  L0_2.mot = "wom01_trouble_00"
  Fn_loadNpcEventMotion("sm12_client", L0_2)
  Fn_playMotionNpc("sm12_client", {
    "wom01_trouble_00"
  }, false, {isRandom = true, isRepeat = true})
end
function Finalize()
  local L0_3
  L0_3 = {
    "sm12_client"
  }
  Fn_finalizeNpcKill("sm12", L0_3)
end
