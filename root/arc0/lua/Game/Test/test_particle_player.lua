import("GameDatabase")
import("Debug")
import("math")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
test_model = "fx_testfloor_01"
function main()
  local L0_0
  L0_0 = Vector
  L0_0 = L0_0(0, 0, 0)
  DebugStage:createTestPlayer():setPos(L0_0)
  createGameObject2("SimpleModel"):setModelName(test_model)
  createGameObject2("SimpleModel"):setPos(L0_0)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  Debug:setEnableDebugCamera(true)
  Debug:setSwitch({
    "ParticleFX",
    "Display",
    "Particle Count(According to Calculation)"
  }, true)
  Debug_RegisterSpawners()
end
