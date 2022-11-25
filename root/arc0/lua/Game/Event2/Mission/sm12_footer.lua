dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_playMotionNpc("sm12_client", "talk_angry_02", false, {animBlendDuration = 0.4, isRepeat = true})
  Fn_playMotionNpc("writer_end", "scared_01", false, {animBlendDuration = 0.4, isRepeat = true})
  while true do
    if Fn_isValidNpc("sm12_client") == false then
      Fn_disappearNpc("sm12_client")
      Fn_disappearNpc("writer_end")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_2, L1_3
end
