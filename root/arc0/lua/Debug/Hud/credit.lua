import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Debug/Hud/debugCommon.lua")
test_credit_tbl = {}
test_credit_tbl.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "type",
    data_label = "type",
    "Credit",
    "TrueStaffRoll",
    "FalseStaffRoll",
    "DlcStaffRoll"
  },
  {
    type = dbgCommon.kTypeInteger,
    data_name = "Time",
    data_label = "Time",
    step = 1,
    min = 0,
    max = 3600,
    num = 0
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "EndWaitTime",
    data_label = "EndWaitTime",
    step = 0.1,
    min = -0.1,
    max = 60,
    num = -0.1
  },
  {
    type = dbgCommon.kTypeBoolean,
    data_name = "InputScroll",
    data_label = "InputScroll",
    data = false
  }
}
function test_credit_tbl.root.Execute(A0_0)
  wait(2)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_0)
  HUD:creditSetting(TextParam)
  HUD:menuOpen(TextParam.type)
  wait()
  HUD:fadein(0)
end
function test_credit()
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
  dbgCommon.TreeExecute(test_credit_tbl.root)
end
