import("Debug")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
function main()
  local L0_0, L1_1
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L0_0(L1_1, {
    "Development",
    "Console",
    "Script"
  }, true)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L0_0(L1_1, {
    "Display",
    "Screen Console"
  }, false)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L0_0(L1_1, {
    "Display",
    "File Asset Status"
  }, false)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L0_0(L1_1, {
    "Display",
    "Warning Indicator"
  }, false)
  L0_0 = createSandbox2
  L1_1 = "father2"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0.setString
  L1_1(L0_0, "g_filename", "/Game/Event2/father2.lua")
  L1_1 = L0_0.try_init
  L1_1(L0_0)
  L1_1 = L0_0.waitForReady
  L1_1(L0_0)
  L1_1 = L0_0.try_start
  L1_1(L0_0)
  while true do
    L1_1 = L0_0.sendEvent
    L1_1 = L1_1(L0_0, "isPcSpawned")
    if not L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = "rough_pi2"
  createGameObject2("TerrainBg"):setName(L1_1)
  createGameObject2("TerrainBg"):setModelName(L1_1)
  createGameObject2("TerrainBg"):setCollisionName(L1_1)
  createGameObject2("TerrainBg"):setModelName("sky_md_02")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
