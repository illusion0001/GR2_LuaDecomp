L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = {}
function L0_0.Open()
  HUD:homeOpen()
  HUD:setCallbackFunction(HUD.kCallback_Home_Select, test_selected_callback)
  HUD:setCallbackFunction(HUD.kCallback_Home_Closed, test_closed_callback)
  HUD:setCurrentMenu(HUD.kSelectItem_Home_Rearrange)
end
function L0_0.Close()
  local L0_1, L1_2
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Open,
    data_label = "Open",
    is_break = true
  }
}
function test_home_ui()
  L0_0.is_menu_lock = true
  L0_0.is_photo_enable = false
  HUD:setUserControlLock(L0_0.is_menu_lock)
  HUD:enablePhotoMode(L0_0.is_photo_enable)
  dbgCommon.TreeExecute(L0_0.root)
end
function test_selected_callback(A0_3)
  print("test_selected_callback" .. A0_3)
end
function test_closed_callback()
  print("test_closed_callback")
  dbgCommon.TreeExecute(L0_0.root)
end
