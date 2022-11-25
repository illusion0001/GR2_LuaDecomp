L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = {}
function L0_0.Open()
  HUD:DEBUG_ModelationOpen()
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Open,
    data_label = "Open"
  }
}
function test_modelation_ui()
  L0_0.is_menu_lock = true
  L0_0.is_photo_enable = false
  HUD:setUserControlLock(L0_0.is_menu_lock)
  HUD:enablePhotoMode(L0_0.is_photo_enable)
  dbgCommon.TreeExecute(L0_0.root)
end
