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
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {}
function L0_0.switch_visible(A0_1)
  if HUD:miniGaugeIsVisible() then
    HUD:miniGaugeSetVisible(false, true)
  else
    HUD:miniGaugeSetVisible(true, true)
  end
end
function L0_0.switch_timer(A0_2)
  if HUD:timerIsVisible() then
    HUD:timerSetVisible(false, true)
  else
    HUD:timerSetVisible(true, true)
  end
end
function L0_0.player_set(A0_3)
  if A0_3.is_player_set == nil then
    A0_3.is_player_set = true
    DebugStage:createTestPlayer()
    initializeAllGameObjects()
    waitForReadyAllGameObjects()
    startAllGameObjects()
  end
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id",
    data_label = "text_id",
    "ui_hud_counter_bar_01",
    "ui_hud_counter_score_01",
    "ui_hud_counter_score_02"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "count_type",
    data_label = "count_type",
    "up",
    "down"
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "threshold",
    data_label = "threshold",
    step = 0.05,
    min = 0,
    max = 1,
    num = 0.8
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "num",
    data_label = "num",
    step = 0.05,
    min = 0,
    max = 1,
    num = 0
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_visible,
    data_label = "switch_minigauge"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_timer,
    data_label = "switch_timer"
  }
}
function L0_0.root.Execute(A0_4)
  local L1_5
end
function L0_0.root.init(A0_6)
  L0_0.root.update()
  HUD:miniGaugeSetVisible(true)
end
function L0_0.root.update()
  TextParam = {}
  dbgCommon.get_param(TextParam, L0_0.root)
  if TextParam.count_type ~= nil then
    HUD:miniGaugeSetNum(TextParam.num)
    HUD:miniGaugeSetTextID(TextParam.text_id)
    if TextParam.count_type == "up" then
      HUD:miniGaugeSetType(HUD.kCountType_Up, TextParam.threshold)
    else
      HUD:miniGaugeSetType(HUD.kCountType_Down, TextParam.threshold)
    end
  end
end
function test_minigauge()
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
  HUD:timerSetVisible(false)
  HUD:timerStart()
  HUD:timerSetMax({
    99,
    9,
    35,
    11
  })
  HUD:timerSetSecond(565)
  L0_0.player_set(L0_0.root)
  dbgCommon.TreeExecute(L0_0.root)
end
