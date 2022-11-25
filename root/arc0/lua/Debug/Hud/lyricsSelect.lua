L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = {}
function L0_0.Open()
  HUD:lyricsSelectOpen()
  HUD:menuSetCallback(HUD.kCallback_LyricsSelectPressBtn, test_press_btn_callback)
end
function L0_0.Close()
  HUD:lyricsSelectClose()
  HUD:menuDelCallback(HUD.kCallback_LyricsSelectPressBtn)
end
function L0_0.ResetBtn()
  HUD:lyricsSelectResetBtn()
end
L0_0.root = {
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
    type = dbgCommon.kTypeFunction,
    data = L0_0.ResetBtn,
    data_label = "ResetBtn"
  }
}
function test_lyricsSelect()
  L0_0.is_menu_lock = true
  L0_0.is_photo_enable = false
  HUD:setUserControlLock(L0_0.is_menu_lock)
  HUD:enablePhotoMode(L0_0.is_photo_enable)
  dbgCommon.TreeExecute(L0_0.root)
end
function test_selected_callback(A0_1)
  print("test_selected_callback" .. A0_1)
end
function test_closed_callback()
  print("test_closed_callback")
  dbgCommon.TreeExecute(L0_0.root)
end
function test_press_btn_callback(A0_2)
  print(A0_2)
end
