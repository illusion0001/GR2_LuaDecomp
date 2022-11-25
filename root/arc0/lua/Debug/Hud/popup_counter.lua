L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = import
L0_0("Player")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {}
function L0_0.switch_photo_enable()
  if L0_0.is_photo_enable then
    L0_0.is_photo_enable = false
  else
    L0_0.is_photo_enable = true
  end
  HUD:enablePhotoMode(L0_0.is_photo_enable)
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
    type = dbgCommon.kTypeTable,
    data_name = "target",
    data_label = "target",
    "q-c4a58f9f-JP-ja",
    "q-56f4249e-JP-ja",
    "hiropong"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "joint",
    data_label = "joint",
    "bn_root",
    "bn_head",
    "non"
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "offset_pos",
    data_label = "offset_pos",
    step = 0.01,
    min = 0,
    max = 2,
    num = 0.7
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "time",
    data_label = "time",
    step = 0.05,
    min = 0,
    max = 5,
    num = 1
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "num",
    data_label = "num",
    cursor = 4,
    5,
    10,
    20,
    100,
    200,
    300,
    500,
    1000,
    2000,
    5000,
    9999
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_menu_lock,
    data_label = "switch_menu_lock"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_photo_enable,
    data_label = "switch_photo_enable"
  }
}
function L0_0.root.Execute(A0_1)
  local L1_2
  L1_2 = {}
  TextParam = L1_2
  L1_2 = dbgCommon
  L1_2 = L1_2.get_param
  L1_2(TextParam, L0_0.root)
  L1_2 = nil
  for _FORV_5_ = 1, #L0_0.root.ghost do
    if TextParam.target == L0_0.root.ghost[_FORV_5_].id then
      L1_2 = L0_0.root.ghost[_FORV_5_].obj:getPuppet()
      break
    end
  end
  if L1_2 ~= nil then
    HUD:scorePopDebugSetting(TextParam)
    HUD:scorePop(TextParam.num, L1_2, TextParam.joint)
  end
end
function test_popup_counter()
  local L0_3
  L0_3 = Debug
  L0_3 = L0_3.setSwitch
  L0_3(L0_3, {"Display", "Debug Draw"}, true)
  L0_3 = Debug
  L0_3 = L0_3.setSwitch
  L0_3(L0_3, {
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  L0_3 = Debug
  L0_3 = L0_3.setSwitch
  L0_3(L0_3, {
    "Display",
    "File Asset Status"
  }, false)
  L0_0.is_menu_lock = true
  L0_0.is_photo_enable = false
  L0_3 = HUD
  L0_3 = L0_3.setUserControlLock
  L0_3(L0_3, L0_0.is_menu_lock)
  L0_3 = HUD
  L0_3 = L0_3.enablePhotoMode
  L0_3(L0_3, L0_0.is_photo_enable)
  L0_3 = {
    {
      id = "q-c4a58f9f-JP-ja",
      asset = "ghost01",
      label = "Ghost:blue",
      color = HUD.kGhostColor_Blue
    },
    {
      id = "q-56f4249e-JP-ja",
      asset = "ghost02",
      label = "Ghost:green",
      color = HUD.kGhostColor_Green
    },
    {
      id = "hiropong",
      asset = "ghost03",
      label = "Ghost:yellow",
      color = HUD.kGhostColor_Yellow
    }
  }
  invokeTask(function()
    local L0_4
    L0_4 = Player
    L0_4 = L0_4.getPuppet
    L0_4 = L0_4(L0_4)
    L0_4 = L0_4.getWorldPos
    L0_4 = L0_4(L0_4)
    L0_0.root.ghost = {}
    for _FORV_4_ = 1, #L0_3 do
      L0_0.root.ghost[_FORV_4_] = {}
      L0_0.root.ghost[_FORV_4_].obj = createGameObject2("GhostPuppet")
      L0_0.root.ghost[_FORV_4_].obj:setName(L0_3[_FORV_4_].id)
      L0_0.root.ghost[_FORV_4_].obj:setAssetName(L0_3[_FORV_4_].asset)
      L0_0.root.ghost[_FORV_4_].obj:setGhostType(0)
      L0_0.root.ghost[_FORV_4_].obj:try_init()
      L0_0.root.ghost[_FORV_4_].obj:waitForReady()
      L0_0.root.ghost[_FORV_4_].obj:try_start()
      L0_4.x = L0_4.x + RandF(-15, 15)
      L0_4.z = L0_4.z + RandF(-15, 15)
      L0_0.root.ghost[_FORV_4_].obj:getPuppet():setWorldPos(L0_4)
      L0_3[_FORV_4_].marker = HUD:createGhostMarker({
        id = L0_3[_FORV_4_].id,
        obj = L0_0.root.ghost[_FORV_4_].obj,
        joint = "bn_root",
        color = L0_3[_FORV_4_].color
      })
      L0_3[_FORV_4_].marker:setActive(true)
      L0_0.root.ghost[_FORV_4_].id = L0_3[_FORV_4_].id
    end
  end)
  dbgCommon.TreeExecute(L0_0.root)
end
