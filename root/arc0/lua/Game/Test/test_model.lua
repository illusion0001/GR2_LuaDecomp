import("math")
import("Debug")
test_model = "man01_base"
function main()
  Debug:setValue({
    "Display",
    "Debug Camera Info"
  }, true)
  Debug:setValue({
    "DebugCam Activate"
  })
  createGameObject2("SimpleModel"):setModelName(test_model)
  createGameObject2("SimpleModel"):setPos(Vector(0, 0, 0))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
end
