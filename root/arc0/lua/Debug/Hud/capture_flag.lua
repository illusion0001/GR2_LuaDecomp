L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = {}
function L0_0.Open()
  local L0_1
  L0_1 = {}
  dbgCommon.get_param(L0_1, L0_0.root)
  if L0_1.HudType == "Bar" then
    HUD:captureFlagOpen(HUD.kCaptureFlagHudType_Bar)
    HUD:captureFlagInitGauge(300, 100)
  elseif L0_1.HudType == "Count" then
    HUD:captureFlagOpen(HUD.kCaptureFlagHudType_Count)
  end
end
function L0_0.Close()
  HUD:captureFlagClose(false)
end
function L0_0.AddBell()
  local L0_2
  L0_2 = {}
  dbgCommon.get_param(L0_2, L0_0.root)
  if L0_2.ControlBell == "Left" then
    HUD:captureFlagAddBell(HUD.kBell_Left)
  elseif L0_2.ControlBell == "Right" then
    HUD:captureFlagAddBell(HUD.kBell_Right)
  end
end
function L0_0.RemoveBell()
  local L0_3
  L0_3 = {}
  dbgCommon.get_param(L0_3, L0_0.root)
  if L0_3.ControlBell == "Left" then
    HUD:captureFlagRemoveBell(HUD.kBell_Left)
  elseif L0_3.ControlBell == "Right" then
    HUD:captureFlagRemoveBell(HUD.kBell_Right)
  end
end
function L0_0.PlayBlink()
  local L0_4
  L0_4 = {}
  dbgCommon.get_param(L0_4, L0_0.root)
  if L0_4.ControlBell == "Left" then
    HUD:captureFlagPlayBlink(HUD.kBell_Left)
  elseif L0_4.ControlBell == "Right" then
    HUD:captureFlagPlayBlink(HUD.kBell_Right)
  end
end
function L0_0.StopBlink()
  local L0_5
  L0_5 = {}
  dbgCommon.get_param(L0_5, L0_0.root)
  if L0_5.ControlBell == "Left" then
    HUD:captureFlagStopBlink(HUD.kBell_Left)
  elseif L0_5.ControlBell == "Right" then
    HUD:captureFlagStopBlink(HUD.kBell_Right)
  end
end
function L0_0.ChangeGaugeNum()
  local L0_6
  L0_6 = {}
  dbgCommon.get_param(L0_6, L0_0.root)
  HUD:captureFlagChangeGauge(L0_6.GagueLine, L0_6.TransTime)
end
function L0_0.IsGaugeChanging()
  local L0_7
  L0_7 = false
  L0_7 = HUD:captureFlagIsGaugeChanging()
  L0_7 = true
end
function L0_0.switch_menu_lock()
  if L0_0.is_menu_lock then
    L0_0.is_menu_lock = false
  else
    L0_0.is_menu_lock = true
  end
  HUD:setUserControlLock(L0_0.is_menu_lock)
end
function L0_0.setNum()
  local L0_8
  L0_8 = {}
  dbgCommon.get_param(L0_8, L0_0.root)
  if L0_8.ControlBell == "Left" then
    HUD:captureFlagSetNum(HUD.kBell_Left, L0_8.Num)
  elseif L0_8.ControlBell == "Right" then
    HUD:captureFlagSetNum(HUD.kBell_Right, L0_8.Num)
  end
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "HudType",
    data_label = "HudType",
    "Bar",
    "Count"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Open,
    data_label = "Open"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Close,
    data_label = "Close"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "ControlBell",
    data_label = "ControlBell",
    "Left",
    "Right"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.AddBell,
    data_label = "AddBell"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.RemoveBell,
    data_label = "RemoveBell"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.PlayBlink,
    data_label = "PlayBlink"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.StopBlink,
    data_label = "StopBlink"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "GagueLine",
    data_label = "GagueLine",
    5,
    50,
    150,
    200,
    300
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "TransTime",
    data_label = "TransTime",
    step = 0.5,
    min = 0,
    max = 10,
    num = 4
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.ChangeGaugeNum,
    data_label = "ChangeGaugeNum"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.IsGaugeChanging,
    data_label = "Check IsGaugeChanging"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Num",
    data_label = "Num",
    0,
    5,
    10,
    99,
    100,
    -1
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.setNum,
    data_label = "SetNum"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_menu_lock,
    data_label = "switch_menu_lock"
  }
}
function test_capture_flag_ui()
  L0_0.is_menu_lock = true
  L0_0.is_photo_enable = false
  HUD:setUserControlLock(L0_0.is_menu_lock)
  HUD:enablePhotoMode(L0_0.is_photo_enable)
  dbgCommon.TreeExecute(L0_0.root)
end
