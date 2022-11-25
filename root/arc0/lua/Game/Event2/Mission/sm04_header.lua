dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_waitStartedNpc("sm04_client")
  while true do
    Fn_playMotionNpc("sm04_client", ({
      "lookaround",
      "lookaround_01",
      "lookaround_02",
      "lookaround_03"
    })[RandI(1, #{
      "lookaround",
      "lookaround_01",
      "lookaround_02",
      "lookaround_03"
    })])
    Fn_playMotionNpc("sm04_client", "stay", false)
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2
  L0_2 = {
    "sm04_client"
  }
  Fn_finalizeNpcKill("sm04", L0_2)
end
