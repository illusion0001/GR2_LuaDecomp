import("GameDatabase")
import("math")
test_model = "ef_ev_par_01m"
function main()
  createGameObject2("SimpleModel"):setModelName(test_model)
  createGameObject2("SimpleModel"):setPos(Vector(0, -10, -20))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
end
