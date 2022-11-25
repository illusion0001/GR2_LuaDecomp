L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = {}
function L0_0.switch_counter(A0_1)
  if HUD:counter99_99IsVisible() then
    HUD:counter99_99SetVisible(false, true)
  else
    HUD:counter99_99SetVisible(true, true)
  end
end
function L0_0.switch_timer(A0_2)
  if HUD:timerIsVisible() then
    HUD:timerSetVisible(false, true)
  else
    HUD:timerSetVisible(true, true)
  end
end
function L0_0.add(A0_3)
  if A0_3 ~= nil and type(A0_3) == "number" then
    HUD:dbggemAdd(A0_3)
  end
end
function test_gem()
  local L0_4
  L0_4 = HUD
  L0_4 = L0_4.counter99_99SetVisible
  L0_4(L0_4, true)
  L0_4 = HUD
  L0_4 = L0_4.counter99_99SetMax
  L0_4(L0_4, 12)
  L0_4 = HUD
  L0_4 = L0_4.counter99_99SetNum
  L0_4(L0_4, 5)
  L0_4 = HUD
  L0_4 = L0_4.timerSetVisible
  L0_4(L0_4, false)
  L0_4 = HUD
  L0_4 = L0_4.timerStart
  L0_4(L0_4)
  L0_4 = HUD
  L0_4 = L0_4.timerSetMax
  L0_4(L0_4, {
    99,
    9,
    35,
    11
  })
  L0_4 = HUD
  L0_4 = L0_4.timerSetSecond
  L0_4(L0_4, 565)
  L0_4 = {
    {
      label = "SWITCH_COUNTER",
      exc_func = L0_0.switch_counter
    },
    {
      label = "SWITCH_TIMER",
      exc_func = L0_0.switch_timer
    },
    {
      label = "ADD_GEM_1",
      exc_func = L0_0.add,
      param1 = 1
    },
    {
      label = "ADD_GEM_10",
      exc_func = L0_0.add,
      param1 = 10
    },
    {
      label = "ADD_GEM_100",
      exc_func = L0_0.add,
      param1 = 100
    },
    {
      label = "ADD_GEM_1000",
      exc_func = L0_0.add,
      param1 = 1000
    },
    {
      label = "ADD_GEM_10000",
      exc_func = L0_0.add,
      param1 = 10000
    },
    {
      label = "SUB_GEM_1",
      exc_func = L0_0.add,
      param1 = -1
    },
    {
      label = "SUB_GEM_10",
      exc_func = L0_0.add,
      param1 = -10
    },
    {
      label = "SUB_GEM_100",
      exc_func = L0_0.add,
      param1 = -100
    },
    {
      label = "SUB_GEM_1000",
      exc_func = L0_0.add,
      param1 = -1000
    },
    {
      label = "SUB_GEM_10000",
      exc_func = L0_0.add,
      param1 = -10000
    }
  }
  L0_4.cursor = 1
  invokeTask(function()
    while true do
      for _FORV_3_ = 1, #L0_4 do
        Debug:screenPrint(100, 100 + 16 * (_FORV_3_ - 1), L0_4[_FORV_3_].label)
      end
      _FOR_:screenPrint(92, 100 + 16 * (L0_4.cursor - 1), ">")
      if HUD:testViewerGetKey("Right") then
        L0_4[L0_4.cursor].exc_func(L0_4[L0_4.cursor].param1)
      elseif HUD:testViewerGetKey("Down") then
        L0_4.cursor = L0_4.cursor + 1
        if #L0_4 < L0_4.cursor then
          L0_4.cursor = 1
        end
      elseif HUD:testViewerGetKey("Up") then
        L0_4.cursor = L0_4.cursor - 1
        if 1 > L0_4.cursor then
          L0_4.cursor = #L0_4
        end
      end
      wait()
    end
  end)
end
