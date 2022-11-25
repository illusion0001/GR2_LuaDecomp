local L1_1
function L0_0(A0_2, A1_3)
  repeat
    while not Fn_findNpcPuppet(A0_2):isGrabbed() do
      wait()
    end
  until not invokeTask(function()
    waitSeconds(A1_3)
  end):isRunning()
end
WaitSecondsGrab = L0_0
