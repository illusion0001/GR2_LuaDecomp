dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm19_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_turnNpc(SISTER_ID)
  Fn_playMotionNpc(SISTER_ID, "wavehand_00", false)
  waitSeconds(0.5)
  Fn_turnNpc(BROTHER_ID)
  Fn_playMotionNpc(BROTHER_ID, "greeting", true)
  waitSeconds(1)
  invokeTask(function()
    local L0_2, L1_3
    L0_2 = Fn_turnNpc
    L1_3 = SISTER_ID
    L0_2(L1_3, Fn_findNpcPuppet(BROTHER_ID))
  end)
  waitSeconds(0.4)
  Fn_turnNpc(BROTHER_ID, Fn_findNpcPuppet(SISTER_ID))
  Fn_playLoopMotionInsert(SISTER_ID, "talk_00", {
    "talk_laugh_00"
  }, 6, 10)
  Fn_playLoopMotionInsert(BROTHER_ID, "stay", {"talk_01"}, 2, 3)
  while true do
    if Fn_isValidNpc("SISTER_ID") == false then
      Fn_disappearNpc("SISTER_ID")
      Fn_disappearNpc("BROTHER_ID")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_4, L1_5
end
