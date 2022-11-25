local L1_1, L2_2
L0_0 = import
L1_1 = "math"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "Font"
L0_0(L1_1)
L0_0 = {}
function L1_1(A0_3, A1_4)
  HUD:counter999SetVisible(A0_3, A1_4, L0_0.slot)
end
L0_0.set_visible = L1_1
function L1_1()
  return HUD:counter999IsVisible(L0_0.slot)
end
L0_0.is_visible = L1_1
function L1_1(A0_5, A1_6)
  HUD:counter999SetNum(A0_5, A1_6, L0_0.slot)
end
L0_0.set_num = L1_1
function L1_1(A0_7)
  HUD:counter999SetIcon(A0_7, L0_0.slot)
end
L0_0.set_icon = L1_1
function L1_1(A0_8)
  HUD:counter999AddNum(A0_8, L0_0.slot)
end
L0_0.add_num = L1_1
function L1_1(A0_9)
  HUD:counter999SubNum(A0_9, L0_0.slot)
end
L0_0.sub_num = L1_1
function L1_1()
  return HUD:counter999GetNum(L0_0.slot)
end
L0_0.get_num = L1_1
function L1_1(A0_10)
  HUD:counter999SetTextID(A0_10, L0_0.slot)
end
L0_0.set_text_id = L1_1
function L1_1()
  local L1_11
  L1_11 = L0_0.slot
  if L1_11 == 0 then
    L0_0.slot = 1
  else
    L0_0.slot = 0
  end
end
L0_0.slot_change = L1_1
L0_0.slot = 0
L1_1 = {}
function L2_2(A0_12, A1_13)
  HUD:counter99_99SetVisible(A0_12, A1_13)
end
L1_1.set_visible = L2_2
function L2_2()
  return HUD:counter99_99IsVisible()
end
L1_1.is_visible = L2_2
function L2_2(A0_14, A1_15)
  return HUD:counter99_99SetNum(A0_14, A1_15)
end
L1_1.set_num = L2_2
function L2_2(A0_16)
  return HUD:counter99_99SetIcon(A0_16)
end
L1_1.set_icon = L2_2
function L2_2(A0_17)
  HUD:counter99_99AddNum(A0_17)
end
L1_1.add_num = L2_2
function L2_2(A0_18)
  HUD:counter99_99SubNum(A0_18)
end
L1_1.sub_num = L2_2
function L2_2()
  return HUD:counter99_99GetNum()
end
L1_1.get_num = L2_2
function L2_2(A0_19)
  HUD:counter99_99SetTextID(A0_19)
end
L1_1.set_text_id = L2_2
function L2_2()
  local L0_20, L1_21
end
L1_1.slot_change = L2_2
L2_2 = {}
function L2_2.switch_visible(A0_22)
  if A0_22.is_visible() then
    A0_22.set_visible(false, true)
  else
    A0_22.set_visible(true, true)
  end
end
function L2_2.add(A0_23, A1_24)
  if A1_24 ~= nil and type(A1_24) == "number" then
    A0_23.add_num(A1_24)
  end
end
function L2_2.set_text_id(A0_25, A1_26)
  if A1_26 ~= nil and type(A1_26) == "string" then
    A0_25.set_text_id(A1_26)
  end
end
function L2_2.slot_change(A0_27)
  A0_27.slot_change()
end
function test_counter999()
  local L0_28, L1_29
  L0_28 = {
    L1_29,
    {
      label = "SLOT_CHANGE",
      exc_func = L2_2.slot_change
    },
    {
      label = "ADD_100000",
      exc_func = L2_2.add,
      param1 = 100000
    },
    {
      label = "SUB_100000",
      exc_func = L2_2.add,
      param1 = -100000
    },
    {
      label = "ADD_10000",
      exc_func = L2_2.add,
      param1 = 10000
    },
    {
      label = "SUB_10000",
      exc_func = L2_2.add,
      param1 = -10000
    },
    {
      label = "ADD_1000",
      exc_func = L2_2.add,
      param1 = 1000
    },
    {
      label = "SUB_1000",
      exc_func = L2_2.add,
      param1 = -1000
    },
    {
      label = "ADD_100",
      exc_func = L2_2.add,
      param1 = 100
    },
    {
      label = "SUB_100",
      exc_func = L2_2.add,
      param1 = -100
    },
    {
      label = "ADD_10",
      exc_func = L2_2.add,
      param1 = 10
    },
    {
      label = "SUB_10",
      exc_func = L2_2.add,
      param1 = -10
    },
    {
      label = "ADD_1",
      exc_func = L2_2.add,
      param1 = 1
    },
    {
      label = "SUB_1",
      exc_func = L2_2.add,
      param1 = -1
    },
    {
      label = "TEXT_A",
      exc_func = L2_2.set_text_id,
      param1 = "ui_hud_counter_score_01"
    },
    {
      label = "TEXT_B",
      exc_func = L2_2.set_text_id,
      param1 = "ui_hud_counter_score_02"
    },
    {
      label = "TEXT_C",
      exc_func = L2_2.set_text_id,
      param1 = "UI_test"
    }
  }
  L1_29 = {}
  L1_29.label = "SWITCH_VISIBLE"
  L1_29.exc_func = L2_2.switch_visible
  L0_28.cursor = 1
  L1_29 = L0_0
  L1_29.set_visible(true)
  L1_29.set_num(9)
  L1_29.set_icon(HUD.kCountIconType_Checkbox)
  invokeTask(function()
    while true do
      Debug:screenPrint(92, 20, string.format("slot:%d", L0_0.slot))
      for _FORV_3_ = 1, #L0_28 do
        Debug:screenPrint(100, 100 + 16 * (_FORV_3_ - 1), L0_28[_FORV_3_].label)
      end
      _FOR_:screenPrint(92, 100 + 16 * (L0_28.cursor - 1), ">")
      if HUD:testViewerGetKey("Right") then
        L0_28[L0_28.cursor].exc_func(L1_29, L0_28[L0_28.cursor].param1)
      elseif HUD:testViewerGetKey("Down") then
        L0_28.cursor = L0_28.cursor + 1
        if #L0_28 < L0_28.cursor then
          L0_28.cursor = 1
        end
      elseif HUD:testViewerGetKey("Up") then
        L0_28.cursor = L0_28.cursor - 1
        if 1 > L0_28.cursor then
          L0_28.cursor = #L0_28
        end
      end
      wait()
    end
  end)
end
