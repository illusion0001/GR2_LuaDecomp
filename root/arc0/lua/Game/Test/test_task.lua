local L1_1
end_req = false
end_req2 = false
task1 = nil
task2 = nil
function L0_0()
  local L0_2, L1_3
  L0_2 = invokeTask
  function L1_3()
    while not end_req do
      print("task1")
      wait(10)
    end
    print("EXIT TASK1")
  end
  L0_2 = L0_2(L1_3)
  task1 = L0_2
  L0_2 = invokeSystemTask
  function L1_3()
    while not end_req2 do
      print("task2")
      wait(10)
    end
    print("EXIT TASK2")
  end
  L0_2 = L0_2(L1_3)
  task2 = L0_2
  L0_2 = setExitCallback
  function L1_3()
    end_req2 = true
    print("EXIT CALLBACK")
  end
  L0_2(L1_3)
  L0_2 = 100
  while L0_2 > 0 do
    L0_2 = L0_2 - 1
    L1_3 = wait
    L1_3()
  end
  function L1_3()
    print("test send event function")
  end
  g_own:sendEvent("sendEventTest01", "test send event", L1_3)
  while true do
    wait()
  end
end
main = L0_0
function L0_0(A0_4, A1_5)
  print(A0_4)
  print(A1_5)
  end_req = true
end
sendEventTest01 = L0_0
