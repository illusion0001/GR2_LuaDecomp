local L1_1
function L0_0(A0_2, A1_3, A2_4, A3_5, A4_6)
  invokeTask(localtest_create_enemy, A0_2, A1_3, A2_4, A3_5, A4_6)
end
localtest_create_enemy_async = L0_0
function L0_0(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12
  L5_12 = print
  L5_12("x " .. A0_7)
  L5_12 = print
  L5_12("y " .. A1_8)
  L5_12 = print
  L5_12("z " .. A2_9)
  L5_12 = print
  L5_12("classification " .. A4_11)
  L5_12 = "demon"
  createGameObject2("Puppet"):setEnableDebugDraw(true)
  createGameObject2("Puppet"):setName(L5_12)
  loadFileAsset("evd", "CharDefs/" .. A4_11):wait()
  createGameObject2("Puppet"):setDescription(loadFileAsset("evd", "CharDefs/" .. A4_11):getRoot())
  createGameObject2("Puppet"):setPos(Vector(A0_7, A1_8, A2_9))
  createGameObject2("Puppet"):setRot(A3_10)
  createGameObject2("Puppet"):registerIntoGroup("enemy")
  createGameObject2("Puppet"):setVisible(false)
  createGameObject2("EnemyBrain"):setEnableDebugDraw(true)
  createGameObject2("EnemyBrain"):setName("demonBrain")
  loadFileAsset("evd", "CharDefs/" .. A4_11 .. "_exported_brain"):wait()
  createGameObject2("EnemyBrain"):setDescription(loadFileAsset("evd", "CharDefs/" .. A4_11 .. "_exported_brain"):getRoot())
  createGameObject2("Puppet"):try_init()
  createGameObject2("EnemyBrain"):try_init()
  createGameObject2("Puppet"):waitForReady()
  createGameObject2("EnemyBrain"):waitForReady()
  createGameObject2("Puppet"):try_start()
  createGameObject2("EnemyBrain"):try_start()
  createGameObject2("Puppet"):setVisible(true)
end
localtest_create_enemy = L0_0
