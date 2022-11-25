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
function L0_0.delete_list()
  HUD:setListOrder()
  L0_0.root.old_num = nil
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "targetA",
    data_label = "targetA",
    "q-c4a58f9f-JP-ja",
    "none"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "targetB",
    data_label = "targetB",
    "q-56f4249e-JP-ja",
    "none"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "targetC",
    data_label = "targetC",
    "hiropong",
    "none"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.delete_list,
    data_label = "delete_list"
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
  L1_2 = HUD
  L1_2 = L1_2.setListOrderSortType
  L1_2(L1_2, HUD.kSortDir_Descend)
  L1_2 = {
    {
      isGoal = false,
      {
        skey1 = RandF(1, 15)
      }
    }
  }
  if TextParam.targetA ~= "none" then
    if RandI(1, 2) == 1 then
    else
    end
    table.insert(L1_2, {
      onlineId = TextParam.targetA,
      isGoal = false,
      {
        skey1 = RandF(1, 15)
      }
    })
  end
  if TextParam.targetB ~= "none" then
    if RandI(1, 2) == 1 then
    else
    end
    table.insert(L1_2, {
      onlineId = TextParam.targetB,
      isGoal = false,
      {
        skey1 = RandF(1, 15)
      }
    })
  end
  if TextParam.targetC ~= "none" then
    if RandI(1, 2) == 1 then
    else
    end
    table.insert(L1_2, {
      onlineId = TextParam.targetC,
      isGoal = false,
      {
        skey1 = RandF(1, 15)
      }
    })
  end
  if (A0_1.old_num == nil or A0_1.old_num == #L1_2) and #L1_2 >= 2 and #L1_2 <= 4 then
    A0_1.old_num = #L1_2
    HUD:setListOrder(L1_2)
  end
end
function test_list_order()
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
        color = L0_3[_FORV_4_].color,
        detail = true
      })
      L0_3[_FORV_4_].marker:setActive(true)
      L0_0.root.ghost[_FORV_4_].id = L0_3[_FORV_4_].id
    end
  end)
  wait(30)
  dbgCommon.TreeExecute(L0_0.root)
end
