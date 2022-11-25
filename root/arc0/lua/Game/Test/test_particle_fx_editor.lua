import("GameDatabase")
import("Debug")
import("math")
test_model = "ef_teststage_01"
function main()
  local L0_0
  L0_0 = Vector
  L0_0 = L0_0(0, 0, 0)
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
end
