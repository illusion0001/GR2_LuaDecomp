dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4
  L0_2 = Fn_findNpc
  L1_3 = "sdemo_fan_wom01"
  L0_2 = L0_2(L1_3)
  L1_3 = Fn_findNpc
  L2_4 = "sdemo_fan_wom02"
  L1_3 = L1_3(L2_4)
  L2_4 = Fn_findNpc
  L2_4 = L2_4("sm45_client")
  if L0_2 ~= nil and L1_3 ~= nil and L2_4 ~= nil then
    invokeTask(function()
      Fn_turnNpc(L0_2, L1_3:getPuppet())
      Fn_playMotionNpc(L0_2, "talk_03", false, {isRepeat = true})
    end)
    invokeTask(function()
      Fn_turnNpc(L1_3, L0_2:getPuppet())
      Fn_playMotionNpc(L1_3, "talk_00", false, {isRepeat = true})
    end)
    Fn_playMotionNpc(L2_4, "idle_00", false)
    while true do
      if Fn_isValidNpc(L2_4) == false then
        Fn_disappearNpc(L2_4)
        Fn_disappearNpc(L0_2)
        Fn_disappearNpc(L1_3)
        break
      end
      waitSeconds(1)
    end
  end
end
function Finalize()
  local L0_5, L1_6
end
