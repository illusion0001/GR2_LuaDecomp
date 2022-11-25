dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3
  L0_2 = "sm91_client"
  L1_3 = Fn_turnNpc
  L1_3(L0_2)
  L1_3 = Fn_playMotionNpc
  L1_3(L0_2, "greeting")
  L1_3 = {
    "locator2_move_01",
    "locator2_move_02",
    "locator2_move_03",
    "locator2_move_04",
    "locator2_move_05",
    "locator2_move_06",
    "locator2_move_07"
  }
  while Fn_moveNpc(L0_2, L1_3, {arrivedLength = 5, runLength = 10000}):isRunning() do
    wait()
  end
  Fn_disappearNpc(L0_2, 60)
  L0_2 = nil
  kill()
end
function Finalize()
  local L0_4, L1_5
end
