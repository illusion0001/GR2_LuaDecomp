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
    data_name = "btn",
    data_label = "btn",
    get_data = L0_0.getCursor,
    "triangle",
    "o",
    "x",
    "square",
    "L2",
    "R2",
    "L1",
    "R1"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "functype",
    data_label = "functype",
    "open",
    "close"
  }
}
function L0_0.root.Execute(A0_3, A1_4)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_3)
  if TextParam.functype == "open" then
    HUD:openIconGuide(TextParam.btn - 1)
  elseif TextParam.functype == "close" then
    HUD:closeIconGuide()
  end
end
function test_iconguide()
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
