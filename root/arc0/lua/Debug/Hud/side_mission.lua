L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = {}
function L0_0.getCursor(A0_1)
  local L1_2
  L1_2 = A0_1.cursor
  return L1_2
end
L0_0.kSmStart = 0 + 1
L0_0.kSmEnd = 0 + 1 + 1
L0_0.kSmNum = 0 + 1 + 1 + 1
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id_main",
    data_label = "text_id_main",
    "ui_sm_main_sm01",
    "ui_sm_main_sm02",
    "ui_sm_main_sm03",
    "ui_sm_main_sm04",
    "ui_sm_main_sm05",
    "ui_sm_main_sm06",
    "ui_sm_main_sm07",
    "ui_sm_main_sm08",
    "ui_sm_main_sm09",
    "ui_sm_main_sm10",
    "ui_sm_main_sm11",
    "ui_sm_main_sm12",
    "ui_sm_main_sm13",
    "ui_sm_main_sm14",
    "ui_sm_main_sm15",
    "ui_sm_main_sm16",
    "ui_sm_main_sm17",
    "ui_sm_main_sm18",
    "ui_sm_main_sm19",
    "ui_sm_main_sm20",
    "ui_sm_main_sm21",
    "ui_sm_main_sm22",
    "ui_sm_main_sm23",
    "ui_sm_main_sm24",
    "ui_sm_main_sm25",
    "ui_sm_main_sm26",
    "ui_sm_main_sm27",
    "ui_sm_main_sm28",
    "ui_sm_main_sm29",
    "ui_sm_main_sm30",
    "ui_sm_main_sm31",
    "ui_sm_main_sm32",
    "ui_sm_main_sm33",
    "ui_sm_main_sm34",
    "ui_sm_main_sm35",
    "ui_sm_main_sm36",
    "ui_sm_main_sm37",
    "ui_sm_main_sm38",
    "ui_sm_main_sm39",
    "ui_sm_main_sm40",
    "ui_sm_main_sm41",
    "ui_sm_main_sm42",
    "ui_sm_main_sm43",
    "ui_sm_main_sm44",
    "ui_sm_main_sm45",
    "ui_sm_main_sm46",
    "ui_sm_main_sm47",
    "ui_sm_main_sm48",
    "ui_sm_main_sm49",
    "ui_sm_main_sm50",
    "ui_sm_main_sm51",
    "ui_sm_main_sm91",
    "ui_sm_main_sm92",
    "ui_acdialog_main_ep90",
    "ui_acdialog_main_cm90",
    "ui_acdialog_main_cm91"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id_sub_title",
    data_label = "text_id_sub_title",
    "ui_sm_sub_sm90",
    "ui_sm_sub_01",
    "ui_sm_sub_02",
    "ui_sm_sub_03",
    "ui_sm_sub_04",
    "ui_sm_sub_05"
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "time",
    data_label = "time",
    step = 0.1,
    min = 0.1,
    max = 10,
    num = 1
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Type",
    data_label = "Type",
    get_data = L0_0.getCursor,
    "Start",
    "End"
  }
}
function L0_0.root.Execute(A0_3)
  wait(2)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_3)
  if TextParam.Type == L0_0.kSmStart then
    HUD:sideMissionStartOpen(TextParam.text_id_main, TextParam.text_id_sub_title, TextParam.time)
  elseif TextParam.Type == L0_0.kSmEnd then
    HUD:sideMissionEndOpen(TextParam.text_id_main, TextParam.text_id_sub_title, TextParam.time)
  end
end
function test_side_mission()
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
  dbgCommon.TreeExecute(L0_0.root)
end
