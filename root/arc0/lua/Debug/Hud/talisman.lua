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
function L0_0.add(A0_3, A1_4)
  HUD:dbgTalismanAdd(A0_3, A1_4)
end
function test_talisman()
  local L0_5
  L0_5 = HUD
  L0_5 = L0_5.counter99_99SetVisible
  L0_5(L0_5, true)
  L0_5 = HUD
  L0_5 = L0_5.counter99_99SetMax
  L0_5(L0_5, 12)
  L0_5 = HUD
  L0_5 = L0_5.counter99_99SetNum
  L0_5(L0_5, 5)
  L0_5 = HUD
  L0_5 = L0_5.timerSetVisible
  L0_5(L0_5, false)
  L0_5 = HUD
  L0_5 = L0_5.timerStart
  L0_5(L0_5)
  L0_5 = HUD
  L0_5 = L0_5.timerSetMax
  L0_5(L0_5, {
    99,
    9,
    35,
    11
  })
  L0_5 = HUD
  L0_5 = L0_5.timerSetSecond
  L0_5(L0_5, 565)
  L0_5 = {
    {
      label = "SWITCH_COUNTER",
      exc_func = L0_0.switch_counter
    },
    {
      label = "SWITCH_TIMER",
      exc_func = L0_0.switch_timer
    },
    {
      label = "ADD_Triangle",
      exc_func = L0_0.add,
      param1 = 1,
      param2 = 1
    },
    {
      label = "ADD_Circle",
      exc_func = L0_0.add,
      param1 = 1,
      param2 = 2
    },
    {
      label = "ADD_Moon",
      exc_func = L0_0.add,
      param1 = 1,
      param2 = 3
    },
    {
      label = "ADD10_Triangle",
      exc_func = L0_0.add,
      param1 = 10,
      param2 = 1
    },
    {
      label = "ADD10_Circle",
      exc_func = L0_0.add,
      param1 = 10,
      param2 = 2
    },
    {
      label = "ADD10_Moon",
      exc_func = L0_0.add,
      param1 = 10,
      param2 = 3
    },
    {
      label = "ADD_Random",
      exc_func = L0_0.add,
      param1 = 1
    },
    {
      label = "ADD10_Random",
      exc_func = L0_0.add,
      param1 = 10
    },
    {
      label = "ADD100_Random",
      exc_func = L0_0.add,
      param1 = 100
    },
    {
      label = "CLEAR",
      exc_func = L0_0.add
    }
  }
  L0_5.cursor = 1
  invokeTask(function()
    while true do
      for _FORV_3_ = 1, #L0_5 do
        Debug:screenPrint(100, 100 + 16 * (_FORV_3_ - 1), L0_5[_FORV_3_].label)
      end
      _FOR_:screenPrint(92, 100 + 16 * (L0_5.cursor - 1), ">")
      if HUD:testViewerGetKey("Right") then
        L0_5[L0_5.cursor].exc_func(L0_5[L0_5.cursor].param1, L0_5[L0_5.cursor].param2)
      elseif HUD:testViewerGetKey("Down") then
        L0_5.cursor = L0_5.cursor + 1
        if #L0_5 < L0_5.cursor then
          L0_5.cursor = 1
        end
      elseif HUD:testViewerGetKey("Up") then
        L0_5.cursor = L0_5.cursor - 1
        if 1 > L0_5.cursor then
          L0_5.cursor = #L0_5
        end
      end
      wait()
    end
  end)
end
