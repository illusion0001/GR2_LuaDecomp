import("math")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
test_model = "mi_a_05_low"
function main()
  Debug:setValue({
    "Display",
    "Debug Camera Info"
  }, true)
  Debug:setValue({
    "DebugCam Activate"
  })
  createGameObject2("TerrainBg"):setCollisionName(test_model)
  createGameObject2("TerrainBg"):setModelName(test_model)
  createGameObject2("TerrainBg"):setPos(Vector(0, 0, 0))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
