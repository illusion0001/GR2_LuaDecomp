import("math")
import("Debug")
import("HUD")
import("Font")
function TST_Start(A0_0)
  HUD:stackTelopStart()
end
function TST_ADD_1(A0_1)
  HUD:stackTelopAddItem(HUD.kStackTelop_Type_Circle, "ui_tarisman_1_01")
end
function TST_ADD_2(A0_2)
  HUD:stackTelopAddItem(HUD.kStackTelop_Type_Square, "ui_tarisman_2_01")
end
function TST_ADD_3(A0_3)
  HUD:stackTelopAddItem(HUD.kStackTelop_Type_Triangle, "ui_tarisman_3_01")
end
function TST_Finish(A0_4)
  HUD:stackTelopFinish()
end
function test_stack_telop()
  local L0_5
  L0_5 = {
    {
      label = "START",
      exc_func = TST_Start
    },
    {
      label = "ADD_1",
      exc_func = TST_ADD_1
    },
    {
      label = "ADD_2",
      exc_func = TST_ADD_2
    },
    {
      label = "ADD_3",
      exc_func = TST_ADD_3
    },
    {
      label = "Finish",
      exc_func = TST_Finish
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
        L0_5[L0_5.cursor].exc_func(obj)
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
