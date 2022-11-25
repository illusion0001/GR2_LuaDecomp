local L1_1
function L0_0()
  createGameObject2("Debris"):setName("test_debris")
  createGameObject2("Debris"):setModelName("bk_nvgia01_armor_body")
  createGameObject2("Debris"):setPos(Vector(0, 0, 0))
  createGameObject2("Debris"):setGravityFactorRatio(0.1)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  while true do
    if 0 == 0 then
      createGameObject2("Debris"):play(Vector(1, 0, 0), 10, 5)
    end
    wait()
  end
end
main = L0_0
