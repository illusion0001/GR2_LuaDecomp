import("math")
import("Debug")
import("HUD")
import("Font")
dofile("/Debug/Hud/debugCommon.lua")
test_place_name_tbl = {}
function test_place_name_tbl.term()
  HUD:placeNameExit()
end
test_place_name_tbl.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "unique",
    data_label = "text_id_unique",
    "ui_gaiku_01_01",
    "ui_gaiku_01_02",
    "ui_gaiku_01_03",
    "ui_gaiku_01_04",
    "ui_gaiku_01_11",
    "ui_gaiku_01_12",
    "ui_gaiku_01_13",
    "ui_gaiku_01_14",
    "ui_gaiku_01_15",
    "ui_gaiku_01_16",
    "ui_gaiku_01_17",
    "ui_gaiku_01_21",
    "length_test_AAAAAA",
    "length_test_AAAAAAAAAAA",
    "length_test_AAAAAAAAAAAAAAAAA",
    ""
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "section",
    data_label = "text_id_section",
    "ui_gaiku_02_01",
    "ui_gaiku_02_02",
    "ui_gaiku_02_03",
    "ui_gaiku_02_04",
    "ui_gaiku_02_11",
    "ui_gaiku_02_12",
    "ui_gaiku_02_13",
    "ui_gaiku_02_14",
    "ui_gaiku_02_15",
    "ui_gaiku_02_16",
    "ui_gaiku_02_17",
    "ui_gaiku_02_21",
    "length_test_AAAAAA",
    "length_test_AAAAAAAAAAA",
    "length_test_AAAAAAAAAAAAAAAAA",
    ""
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "town",
    data_label = "text_id_town",
    "ui_gaiku_03_01",
    "ui_gaiku_03_02",
    "ui_gaiku_03_03",
    "length_test_AAAAAA",
    "length_test_AAAAAAAAAAA",
    "length_test_AAAAAAAAAAAAAAAAA",
    ""
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "time",
    data_label = "time",
    step = 0.2,
    min = 0.2,
    max = 20,
    num = 5
  },
  {
    type = dbgCommon.kTypeFunction,
    data = test_place_name_tbl.term,
    data_label = "TERM"
  }
}
function test_place_name_tbl.root.Execute(A0_0)
  wait(2)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_0)
  HUD:placeNameStart(TextParam)
end
function test_place_name()
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
  dbgCommon.TreeExecute(test_place_name_tbl.root)
end
