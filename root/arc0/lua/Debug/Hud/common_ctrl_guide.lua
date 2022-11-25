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
L0_0.kFuncType_SetText = 0 + 1
L0_0.kFuncType_OutText = 0 + 1 + 1
function L0_0.getAlign(A0_1)
  local L3_2
  L3_2 = A0_1.cursor
  return A0_1[L3_2].data
end
function L0_0.getCursor(A0_3)
  local L1_4
  L1_4 = A0_3.cursor
  return L1_4
end
function L0_0.cbLabelAlign(A0_5)
  local L3_6
  L3_6 = A0_5.cursor
  return A0_5[L3_6].label
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id",
    data_label = "text_id",
    "ui_caption_jimaku_3",
    "ui_test_mojiretsu_1",
    "ui_keyguide_ac_01",
    "ui_keyguide_ac_02",
    "ui_keyguide_ac_03"
  },
  {
    type = dbgCommon.kTypeTable,
    label = L0_0.cbLabelAlign,
    data_name = "align",
    data_label = "align",
    get_data = L0_0.getAlign,
    {
      label = "Center",
      data = HUD.kCCGuideAlignCenter
    },
    {
      label = "Left",
      data = HUD.kCCGuideAlignLeft
    },
    {
      label = "Right",
      data = HUD.kCCGuideAlignRight
    }
  },
  {
    type = dbgCommon.kTypeBoolean,
    data_name = "Bloom",
    data_label = "Bloom",
    data = true
  },
  {
    ["type"] = dbgCommon.kTypeTable,
    ["data_name"] = "functype",
    ["data_label"] = "functype",
    ["get_data"] = L0_0.getCursor,
    [L0_0.kFuncType_SetText] = "setText",
    [L0_0.kFuncType_OutText] = "outText"
  }
}
function L0_0.root.Execute(A0_7)
  wait(2)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_7)
  if TextParam.functype == L0_0.kFuncType_SetText then
    HUD:setTextCommonCtrlGuide(TextParam.text_id, TextParam.align, TextParam.Bloom)
  elseif TextParam.functype == L0_0.kFuncType_OutText then
    HUD:setTextCommonCtrlGuide()
  end
end
function test_common_ctrl_guide()
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
