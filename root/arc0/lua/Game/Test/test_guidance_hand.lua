L0_0 = import
L0_0("GameDatabase")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Area")
L0_0 = import
L0_0("Player")
L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Pad")
L0_0 = import
L0_0("EventData")
L0_0 = import
L0_0("Debug")
L0_0 = dofile
L0_0("/Game/Supporter/supporter_spawn.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_spawner_register.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = {}
function L0_0.CloseDebugMenu()
  local L0_1, L1_2
  L0_0.is_menu_open = false
end
function L0_0.requestBreak()
  local L0_3
  L0_3 = {}
  dbgCommon.get_param(L0_3, L0_0.root)
  if findGameObject2("Lithograph", L0_3.CurrentObjectName) ~= nil then
    findGameObject2("Lithograph", L0_3.CurrentObjectName):requestBreak()
  end
end
function L0_0.requestRestore()
  local L0_4
  L0_4 = {}
  dbgCommon.get_param(L0_4, L0_0.root)
  if findGameObject2("Lithograph", L0_4.CurrentObjectName) ~= nil then
    findGameObject2("Lithograph", L0_4.CurrentObjectName):requestRestore(true)
  end
end
function L0_0.onGlow()
  local L0_5
  L0_5 = {}
  dbgCommon.get_param(L0_5, L0_0.root)
  if findGameObject2("Lithograph", L0_5.CurrentObjectName) ~= nil then
    findGameObject2("Lithograph", L0_5.CurrentObjectName):onGlow()
  end
end
function L0_0.offGlow()
  local L0_6
  L0_6 = {}
  dbgCommon.get_param(L0_6, L0_0.root)
  if findGameObject2("Lithograph", L0_6.CurrentObjectName) ~= nil then
    findGameObject2("Lithograph", L0_6.CurrentObjectName):offGlow()
  end
end
function L0_0.Activate()
  local L0_7
  L0_7 = {}
  dbgCommon.get_param(L0_7, L0_0.root)
  if findGameObject2("GuidanceHand", L0_7.CurrentObjectName) ~= nil then
    findGameObject2("GuidanceHand", L0_7.CurrentObjectName):setActive(true)
  end
end
function L0_0.Deactivate()
  local L0_8
  L0_8 = {}
  dbgCommon.get_param(L0_8, L0_0.root)
  if findGameObject2("GuidanceHand", L0_8.CurrentObjectName) ~= nil then
    findGameObject2("GuidanceHand", L0_8.CurrentObjectName):setActive(false)
  end
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.CloseDebugMenu,
    data_label = "DebugMenuClose",
    is_break = true
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "CurrentObjectName",
    data_label = "CurrentObjectName",
    "lithograph_02",
    "lithograph_03",
    "hand_02"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.requestBreak,
    data_label = "requestBreak"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.requestRestore,
    data_label = "requestRestore"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.onGlow,
    data_label = "onGlow"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.offGlow,
    data_label = "offGlow"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Activate,
    data_label = "Activate"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Deactivate,
    data_label = "Deactivate"
  }
}
function main()
  HUD:menuOpen("Main")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  Area:setAnimMoveDriftEnable(true)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  L0_0.is_menu_open = false
  HUD:setUserControlLock(true)
  HUD:enablePhotoMode(false)
  HUD:enableGesture(false)
  findGameObject2("GuidanceHand", "hand_02"):setActive(false)
  if findGameObject2("Lithograph", "lithograph_02") then
    findGameObject2("Lithograph", "lithograph_02"):setEventListener("damage", damage_callback)
    findGameObject2("Lithograph", "lithograph_02"):requestRestore(true)
  end
  while true do
    if L0_0.is_menu_open then
    else
      Debug:screenPrint(100, 100, "R1+L1=OpenDebugTree")
      if Pad:getButton(Pad.kButton_R1) and Pad:getButton(Pad.kButton_L1) then
        L0_0.is_menu_open = true
        dbgCommon.TreeExecute(L0_0.root)
      end
      if Pad:getButton(Pad.kButton_RR) then
        findGameObject2("GuidanceHand", "hand_02"):play("stay_up")
      end
      if Pad:getButton(Pad.kButton_RU) then
        findGameObject2("GuidanceHand", "hand_02"):play("move")
      end
      if Pad:getButton(Pad.kButton_RL) then
        findGameObject2("GuidanceHand", "hand_02"):play("stay_down")
      end
    end
    wait()
  end
end
function Lithograph_OnInitialize(A0_9)
  if A0_9 ~= nil and A0_9:getName() == "lithograph_03" then
    return true
  end
  return false
end
function damage_callback(A0_10, A1_11)
  if A0_10 then
    print("Damage " .. A0_10:getName())
  end
end
