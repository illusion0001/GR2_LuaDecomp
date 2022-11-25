import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
import("Player")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
function main()
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, false)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Sensor"
  }, true)
  createSandbox2("father2"):setString("g_filename", "/Game/Event2/father2.lua")
  createSandbox2("father2"):try_init()
  createSandbox2("father2"):waitForReady()
  createSandbox2("father2"):try_start()
  while not createSandbox2("father2"):sendEvent("isPcSpawned") do
    wait()
  end
  createGameObject2("Area"):setName("test_z_root2")
  createGameObject2("TerrainBg"):setModelName("sky_md_01")
  _loadEventData("test_okura")
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  GameDatabase:reset(ggd.GlobalSystemFlags)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function _loadEventData(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = loadFileAsset
  L2_2 = "evb"
  L3_3 = "evx/"
  L3_3 = L3_3 .. A0_0
  L1_1 = L1_1(L2_2, L3_3)
  L2_2, L3_3 = nil, nil
  if L1_1 ~= nil then
    L1_1:wait()
    L2_2 = L1_1:getRoot()
    L3_3 = EventData:create(A0_0, nil, L2_2)
    L3_3:try_init()
    L3_3:waitForReady()
    L3_3:try_start()
  end
end
function pccubesensor2_01_OnEnter()
  local L0_4, L1_5
end
function pccubesensor2_01_OnLeave()
  local L0_6, L1_7
end
function pccubesensor2_02_OnEnter()
  local L0_8, L1_9
end
function pccubesensor2_02_OnLeave()
  local L0_10, L1_11
end
