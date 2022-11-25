L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = {}
function L0_0.FadeIn()
  HUD:cameraCommonCounter99_99SetVisible(true)
end
function L0_0.FadeOut()
  HUD:cameraCommonCounter99_99SetVisible(false)
end
function L0_0.SetMax5()
  HUD:cameraCommonCounter99_99SetMax(5)
end
function L0_0.SetMax99()
  HUD:cameraCommonCounter99_99SetMax(99)
end
function L0_0.SetMax100()
  HUD:cameraCommonCounter99_99SetMax(100)
end
function L0_0.Add1()
  HUD:cameraCommonCounter99_99AddNum()
end
function L0_0.Add5()
  HUD:cameraCommonCounter99_99AddNum(5)
end
function L0_0.Add10()
  HUD:cameraCommonCounter99_99AddNum(10)
end
function L0_0.Sub1()
  HUD:cameraCommonCounter99_99SubNum()
end
function L0_0.Sub5()
  HUD:cameraCommonCounter99_99SubNum(5)
end
function L0_0.Sub10()
  HUD:cameraCommonCounter99_99SubNum(10)
end
function L0_0.GetNum()
  local L0_1
  L0_1 = HUD
  L0_1 = L0_1.cameraCommonCounter99_99GetNum
  L0_1 = L0_1(L0_1)
  print(L0_1)
end
function L0_0.switch_menu_lock()
  if L0_0.is_menu_lock then
    L0_0.is_menu_lock = false
  else
    L0_0.is_menu_lock = true
  end
  HUD:setUserControlLock(L0_0.is_menu_lock)
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.FadeIn,
    data_label = "FadeIn"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.FadeOut,
    data_label = "FadeOut"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.SetMax5,
    data_label = "SetMax5"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.SetMax99,
    data_label = "SetMax99"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.SetMax100,
    data_label = "SetMax100"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Add1,
    data_label = "Add1"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Sub1,
    data_label = "Sub1"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Add5,
    data_label = "Add5"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Sub5,
    data_label = "Sub5"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Add10,
    data_label = "Add10"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Sub10,
    data_label = "Sub10"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.GetNum,
    data_label = "GetNum"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_menu_lock,
    data_label = "switch_menu_lock"
  }
}
function test_camera_common_counter()
  L0_0.is_menu_lock = true
  L0_0.is_photo_enable = true
  HUD:setUserControlLock(L0_0.is_menu_lock)
  HUD:enablePhotoMode(L0_0.is_photo_enable)
  dbgCommon.TreeExecute(L0_0.root)
end
