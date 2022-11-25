import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Debug/Hud/debugCommon.lua")
test_chapter_tbl = {}
test_chapter_tbl.root = {
  {
    type = dbgCommon.kTypeInteger,
    data_name = "Chapter",
    data_label = "Chapter",
    step = 1,
    min = 1,
    max = 4,
    num = 1
  }
}
function test_chapter_tbl.root.Execute(A0_0)
  wait(2)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_0)
  HUD:chapterSetting(TextParam)
  HUD:chapterOpen()
  wait()
end
function test_chapter()
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
  dbgCommon.TreeExecute(test_chapter_tbl.root)
end
