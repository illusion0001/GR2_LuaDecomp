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
function test_loading_load_begin()
  if L0_0.root.is_now_load == nil then
    HUD:accessBegin()
    L0_0.root.is_now_load = true
  end
end
function test_loading_load_begin_autosave()
  if L0_0.root.is_now_load == nil then
    HUD:dbgCheckPoint()
    HUD:accessBegin()
    L0_0.root.is_now_load = true
  end
end
function test_loading_load_end()
  if L0_0.root.is_now_load == true then
    HUD:accessEnd()
    L0_0.root.is_now_load = nil
  end
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = test_loading_load_begin,
    data_label = "LOADING_BEGIN"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_loading_load_begin_autosave,
    data_label = "LOADING_BEGIN_AUTOSAVE"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_loading_load_end,
    data_label = "LOADING_END"
  }
}
function L0_0.root.Execute(A0_1, A1_2)
  if A1_2 ~= nil and A1_2.type == dbgCommon.kTypeFunction then
    dbgCommon.function_execute(A1_2)
  end
end
function test_loading()
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
