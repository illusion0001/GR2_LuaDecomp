dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3
  L0_2 = Fn_findNpcPuppet
  L1_3 = "sm39_client"
  L0_2 = L0_2(L1_3)
  L1_3 = Fn_findNpcPuppet
  L1_3 = L1_3("sm39_assistant_01")
  repeat
    wait()
  until not invokeTask(function()
    Fn_turnNpc("sm39_client", L1_3)
  end):isRunning() and not invokeTask(function()
    Fn_turnNpc("sm39_assistant_01", L0_2)
  end):isRunning()
  while true do
    if Fn_isValidNpc("sm39_client") == false then
      if Fn_repeatPlayMotion("sm39_client", "talk_01", {"talk_01"}) ~= nil and Fn_repeatPlayMotion("sm39_client", "talk_01", {"talk_01"}):isRunning() == true then
        Fn_repeatPlayMotion("sm39_client", "talk_01", {"talk_01"}):abort()
      end
      if Fn_repeatPlayMotion("sm39_assistant_01", "talk_00", {"talk_00"}) ~= nil and Fn_repeatPlayMotion("sm39_assistant_01", "talk_00", {"talk_00"}):isRunning() == true then
        Fn_repeatPlayMotion("sm39_assistant_01", "talk_00", {"talk_00"}):abort()
      end
      Fn_disappearNpc("sm39_client")
      Fn_disappearNpc("sm39_assistant_01")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_4, L1_5
end
