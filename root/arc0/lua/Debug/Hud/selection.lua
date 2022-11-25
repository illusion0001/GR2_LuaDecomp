import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Debug/Hud/debugCommon.lua")
test_selection_tbl = {}
test_selection_tbl.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "window_text",
    data_label = "window_text",
    "ep14_02027",
    "ep14_04013",
    "ep14_05003",
    "ep14_05028",
    ""
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "btn_circle",
    data_label = "btn_circle",
    "ep14_04010",
    "ep14_04011",
    "ep14_04012",
    "ep14_05000",
    "ep14_05001",
    "ep14_05002",
    "ep14_05025",
    "ep14_05026",
    "ep14_05027",
    "ep14_02024",
    "ep14_02025",
    "ep14_02026",
    "AAA",
    "AAAAA",
    "AAAAAAAA",
    "AAAAAAAAAA",
    "AAAAAAAAAAAA",
    "AAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAAAAA",
    ""
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "btn_cross",
    data_label = "btn_cross",
    cursor = 2,
    "",
    "ep14_04010",
    "ep14_04011",
    "ep14_04012",
    "ep14_05000",
    "ep14_05001",
    "ep14_05002",
    "ep14_05025",
    "ep14_05026",
    "ep14_05027",
    "ep14_02024",
    "ep14_02025",
    "ep14_02026",
    "AAA",
    "AAAAA",
    "AAAAAAAA",
    "AAAAAAAAAA",
    "AAAAAAAAAAAA",
    "AAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAAAAA",
    ""
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "btn_square",
    data_label = "btn_square",
    cursor = 3,
    "ep14_04010",
    "ep14_04011",
    "ep14_04012",
    "ep14_05000",
    "ep14_05001",
    "ep14_05002",
    "ep14_05025",
    "ep14_05026",
    "ep14_05027",
    "ep14_02024",
    "ep14_02025",
    "ep14_02026",
    "AAA",
    "AAAAA",
    "AAAAAAAA",
    "AAAAAAAAAA",
    "AAAAAAAAAAAA",
    "AAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAAAAA",
    ""
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "btn_triangle",
    data_label = "btn_triangle",
    cursor = 4,
    "ep14_04010",
    "ep14_04011",
    "ep14_04012",
    "ep14_05000",
    "ep14_05001",
    "ep14_05002",
    "ep14_05025",
    "ep14_05026",
    "ep14_05027",
    "ep14_02024",
    "ep14_02025",
    "ep14_02026",
    "AAA",
    "AAAAA",
    "AAAAAAAA",
    "AAAAAAAAAA",
    "AAAAAAAAAAAA",
    "AAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAA",
    "AAAAAAAAAAAAAAAAAAAAAAAAA",
    ""
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "time",
    data_label = "time",
    step = 1,
    min = -1,
    max = 20,
    num = -1
  }
}
function test_selection_tbl.root.Execute(A0_0)
  local L1_1, L2_2
  L1_1 = wait
  L2_2 = 2
  L1_1(L2_2)
  L1_1 = {}
  TextParam = L1_1
  L1_1 = dbgCommon
  L1_1 = L1_1.get_param
  L2_2 = TextParam
  L1_1(L2_2, A0_0)
  L1_1 = {}
  L2_2 = TextParam
  L2_2 = L2_2.btn_circle
  if L2_2 ~= nil then
    L2_2 = TextParam
    L2_2 = L2_2.btn_circle
    if L2_2 ~= "" then
      L2_2 = table
      L2_2 = L2_2.insert
      L2_2(L1_1, {
        text = TextParam.btn_circle,
        btn = Pad.kButton_RR
      })
    end
  end
  L2_2 = TextParam
  L2_2 = L2_2.btn_cross
  if L2_2 ~= nil then
    L2_2 = TextParam
    L2_2 = L2_2.btn_cross
    if L2_2 ~= "" then
      L2_2 = table
      L2_2 = L2_2.insert
      L2_2(L1_1, {
        text = TextParam.btn_cross,
        btn = Pad.kButton_RD
      })
    end
  end
  L2_2 = TextParam
  L2_2 = L2_2.btn_triangle
  if L2_2 ~= nil then
    L2_2 = TextParam
    L2_2 = L2_2.btn_triangle
    if L2_2 ~= "" then
      L2_2 = table
      L2_2 = L2_2.insert
      L2_2(L1_1, {
        text = TextParam.btn_triangle,
        btn = Pad.kButton_RU
      })
    end
  end
  L2_2 = TextParam
  L2_2 = L2_2.btn_square
  if L2_2 ~= nil then
    L2_2 = TextParam
    L2_2 = L2_2.btn_square
    if L2_2 ~= "" then
      L2_2 = table
      L2_2 = L2_2.insert
      L2_2(L1_1, {
        text = TextParam.btn_square,
        btn = Pad.kButton_RL
      })
    end
  end
  L2_2 = HUD
  L2_2 = L2_2.selectionOpen
  L2_2(L2_2, TextParam.window_text, L1_1, TextParam.time)
  L2_2 = nil
  while true do
    L2_2 = HUD:selectionResult()
    if L2_2 ~= nil then
      print("kButton:" .. L2_2)
      break
    end
    wait()
  end
end
function test_selection()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Font:openTextSet("ep14")
  dbgCommon.TreeExecute(test_selection_tbl.root)
end
