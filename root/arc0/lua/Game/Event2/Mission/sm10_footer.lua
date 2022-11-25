dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  Fn_loadEventData("evx/sm10", {
    "evarea2_mi_a_05"
  }, true)
end
function Ingame()
  Fn_repeatPlayMotion("sm10_client", "regret_00")
  Fn_playMotionNpc("sm10_dove", "stay_01", false)
  while true do
    if Fn_isValidNpc("sm10_client", 40) == false then
      Fn_disappearNpc("sm10_client")
      Fn_disappearNpc("sm10_dove")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_0, L1_1
end
