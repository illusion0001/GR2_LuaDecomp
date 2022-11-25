dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_waitStartedNpc("sm08_client")
  Fn_waitStartedNpc("sm08_phi_01")
  Fn_playMotionNpc("sm08_client", "talk_angry_00", false, {isRandom = true, isRepeat = true})
  Fn_playMotionNpc("sm08_phi_01", "talk_00", false, {isRandom = true, isRepeat = true})
  GameDatabase:set(ggd.EventFlags__sm08__flag01, 1)
end
function Finalize()
  local L0_2
  L0_2 = {
    "sm08_client",
    "sm08_phi_01"
  }
  Fn_finalizeNpcKill("sm08", L0_2)
end
