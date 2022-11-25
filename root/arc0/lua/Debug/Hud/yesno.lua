import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Debug/Hud/debugCommon.lua")
test_yesno_tbl = {}
test_yesno_tbl.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "window_text",
    data_label = "window_text",
    "ui_debug_caption_14",
    "ui_debug_caption_15",
    "ui_debug_caption_16",
    ""
  }
}
function test_yesno_tbl.root.Execute(A0_0)
  local L1_1
  L1_1 = wait
  L1_1(2)
  L1_1 = {}
  TextParam = L1_1
  L1_1 = dbgCommon
  L1_1 = L1_1.get_param
  L1_1(TextParam, A0_0)
  L1_1 = HUD
  L1_1 = L1_1.yesnoOpen
  L1_1(L1_1, TextParam.window_text)
  L1_1 = nil
  while true do
    L1_1 = HUD:yesnoResult()
    if L1_1 ~= nil then
      if L1_1 == HUD.kYesNoAnswerYes then
        print("result:Yes")
        break
      end
      if L1_1 == HUD.kYesNoAnswerNo then
        print("result:No")
      end
      break
    end
    wait()
  end
end
function test_yesno()
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
  dbgCommon.TreeExecute(test_yesno_tbl.root)
end
