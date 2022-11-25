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
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "title",
    data_label = "text_id_main",
    "ui_acdialog_main_sm93",
    "ui_acdialog_main_mine99_01",
    "ui_acdialog_main_sm06",
    "ui_acdialog_main_sm06",
    "ui_acdialog_main_sm46_99999k",
    "ui_acdialog_main_sm15",
    "ui_acdialog_main_ft21_00050k"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "sub_title",
    data_label = "text_id_sub",
    "ui_acdialog_sub_01",
    "ui_acdialog_sub_02",
    "ui_acdialog_sub_03",
    "ui_acdialog_sub_04",
    "ui_acdialog_sub_05",
    "ui_acdialog_sub_06",
    "ui_acdialog_sub_07",
    "ui_acdialog_sub_08",
    "ui_acdialog_sub_09",
    "ui_acdialog_sub_10",
    "ui_acdialog_sub_11"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "guide",
    data_label = "text_id_guide",
    "ui_keyguide_ac_01",
    "ui_keyguide_ac_02",
    "ui_keyguide_ac_03"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "alert",
    data_label = "text_id_alert",
    "ui_acdialog_alert_01"
  }
}
function L0_0.root.Execute(A0_3)
  local L1_4
  L1_4 = wait
  L1_4(2)
  L1_4 = {}
  TextParam = L1_4
  L1_4 = dbgCommon
  L1_4 = L1_4.get_param
  L1_4(TextParam, A0_3)
  L1_4 = HUD
  L1_4 = L1_4.actionDialogView
  L1_4 = L1_4(L1_4, TextParam.text_id_main, TextParam.text_id_guide, TextParam.text_id_sub)
  while L1_4 ~= HUD.kActionDialogState_Decide and L1_4 ~= HUD.kActionDialogState_Out do
    wait()
    L1_4 = HUD:actionDialogView(TextParam)
  end
end
function test_action_dialog()
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
