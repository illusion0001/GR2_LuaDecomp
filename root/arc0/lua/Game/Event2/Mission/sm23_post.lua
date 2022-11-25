dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_playMotionNpc("sm23_client", "idle_ep13_00", false)
  Fn_playMotionNpc("sm23_bird_sdemo", "stay_00", false)
  Fn_playMotionNpc("sm23_second_son", "cry_00", false)
  Fn_playMotionNpc("sm23_second_son_bird", "stay_00", false)
  Fn_repeatPlayMotion("sm23_third_son", "regret_00")
  Fn_playMotionNpc("sm23_third_son_bird", "stay_00", false)
  while true do
    if Fn_isValidNpc("sm23_client") == false then
      Fn_disappearNpc("sm23_client")
      Fn_disappearNpc("sm23_second_son")
      Fn_disappearNpc("sm23_third_son")
      Fn_disappearNpc("sm23_bird_sdemo")
      Fn_disappearNpc("sm23_second_son_bird")
      Fn_disappearNpc("sm23_third_son_bird")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2, L1_3
end
