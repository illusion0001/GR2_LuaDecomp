import("math")
import("Debug")
import("Player")
dofile("/Debug/Action/debug_stage.lua")
test_model = "refraction"
function main()
  createGameObject2("SimpleModel"):setModelName(test_model)
  createGameObject2("SimpleModel"):setPos(Vector(-10, 0, 25))
  createGameObject2("SimpleModel"):setPos(Vector(0, 0, 0))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  while false do
    if 0 + 1 > 150 then
    end
    if 0 + 1 == 0 then
      createGameObject2("SimpleModel"):setWorldPos(Vector(0, 0, 0.1))
    elseif 0 + 1 == 1 then
      createGameObject2("SimpleModel"):setWorldPos(Vector(0, 0, 0))
    elseif 0 + 1 == 2 then
      createGameObject2("SimpleModel"):setWorldPos(Vector(0.1, 0, 0))
    elseif 0 + 1 == 4 then
      createGameObject2("SimpleModel"):setWorldPos(Vector(0, 0.1, 0))
    else
    end
    wait()
  end
end
