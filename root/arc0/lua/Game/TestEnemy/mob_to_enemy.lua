import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_stage.lua")
enmgen2_01 = {
  mobToEnemyFlag = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_01"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_02"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_03"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_04"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_05"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_06"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_07"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_08"
    },
    {
      type = "people",
      locator = "locator_01",
      name = "police_09"
    },
    {
      type = "people",
      locator = "locator_01",
      name = "police_10"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end
}
function main()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21
  L0_10 = Vector
  L1_11 = -12
  L2_12 = 1
  L3_13 = 70.6
  L0_10 = L0_10(L1_11, L2_12, L3_13)
  L1_11 = Vector
  L2_12 = -5
  L3_13 = 2
  L4_14 = 50.6
  L1_11 = L1_11(L2_12, L3_13, L4_14)
  L2_12 = Vector
  L3_13 = -10
  L4_14 = 4
  L5_15 = 17.6
  L2_12 = L2_12(L3_13, L4_14, L5_15)
  L3_13 = Vector
  L4_14 = -10
  L5_15 = 4
  L6_16 = 17.6
  L3_13 = L3_13(L4_14, L5_15, L6_16)
  L4_14 = Vector
  L5_15 = -3
  L6_16 = 0.8
  L7_17 = 18.5
  L4_14 = L4_14(L5_15, L6_16, L7_17)
  L5_15 = DebugStage
  L6_16 = L5_15
  L5_15 = L5_15.createTestStage
  L5_15 = L5_15(L6_16)
  L6_16 = DebugStage
  L7_17 = L6_16
  L6_16 = L6_16.createTestPlayer
  L8_18 = L0_10
  L9_19 = YRotQuaternion
  L10_20 = Deg2Rad
  L11_21 = 180
  L11_21 = L10_20(L11_21)
  L11_21 = L9_19(L10_20, L11_21, L10_20(L11_21))
  L6_16 = L6_16(L7_17, L8_18, L9_19, L10_20, L11_21, L9_19(L10_20, L11_21, L10_20(L11_21)))
  L7_17 = findGameObject2
  L8_18 = "Area"
  L9_19 = "motion_test_stage1_01"
  L7_17 = L7_17(L8_18, L9_19)
  L8_18 = createGameObject2
  L9_19 = "EnemyGenerator"
  L8_18 = L8_18(L9_19)
  L10_20 = L8_18
  L9_19 = L8_18.addActionArea
  L11_21 = Vector
  L11_21 = L11_21(100, 100, 100)
  L9_19(L10_20, L11_21, Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L10_20 = L8_18
  L9_19 = L8_18.addRespawnArea
  L11_21 = Vector
  L11_21 = L11_21(100, 100, 100)
  L9_19(L10_20, L11_21, Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L10_20 = L8_18
  L9_19 = L8_18.addActiveArea
  L11_21 = Vector
  L11_21 = L11_21(100, 100, 100)
  L9_19(L10_20, L11_21, Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L10_20 = L7_17
  L9_19 = L7_17.appendChild
  L11_21 = L8_18
  L9_19(L10_20, L11_21)
  L10_20 = L8_18
  L9_19 = L8_18.setWorldPos
  L11_21 = Vector
  L11_21 = L11_21(0, 0, 0)
  L9_19(L10_20, L11_21, L11_21(0, 0, 0))
  L10_20 = L8_18
  L9_19 = L8_18.setSpecTableName
  L11_21 = "enmgen2_01"
  L9_19(L10_20, L11_21)
  L10_20 = L8_18
  L9_19 = L8_18.try_init
  L9_19(L10_20)
  L10_20 = L8_18
  L9_19 = L8_18.waitForReady
  L9_19(L10_20)
  L10_20 = L8_18
  L9_19 = L8_18.try_start
  L9_19(L10_20)
  L9_19 = print
  L10_20 = "init all"
  L9_19(L10_20)
  L9_19 = initializeAllGameObjects
  L9_19()
  L9_19 = print
  L10_20 = "wait ready all"
  L9_19(L10_20)
  L9_19 = waitForReadyAllGameObjects
  L9_19()
  L9_19 = print
  L10_20 = "start all"
  L9_19(L10_20)
  L9_19 = startAllGameObjects
  L9_19()
  L9_19 = Debug
  L10_20 = L9_19
  L9_19 = L9_19.setSwitch
  L11_21 = {"Display", "Debug Draw"}
  L9_19(L10_20, L11_21, true)
  L9_19 = Debug
  L10_20 = L9_19
  L9_19 = L9_19.setSwitch
  L11_21 = {
    "Display",
    "File Asset Status"
  }
  L9_19(L10_20, L11_21, false)
  L9_19 = Debug
  L10_20 = L9_19
  L9_19 = L9_19.setSwitch
  L11_21 = {
    "Display",
    "Warning Indicator"
  }
  L9_19(L10_20, L11_21, false)
  L9_19 = HUD
  L10_20 = L9_19
  L9_19 = L9_19.hpgDispReq_FadeIn
  L9_19(L10_20)
  L9_19 = HUD
  L10_20 = L9_19
  L9_19 = L9_19.grgDispReq_FadeIn
  L9_19(L10_20)
  L9_19 = Vector
  L10_20 = 0
  L11_21 = 10
  L9_19 = L9_19(L10_20, L11_21, 0)
  L10_20 = localtest_create_enemy
  L11_21 = -15
  L10_20 = L10_20(L11_21, 0, -40.6, "enemy/police/police")
  L11_21 = L7_17.appendChild
  L11_21(L7_17, L10_20)
  L11_21 = localtest_create_enemy
  L11_21 = L11_21(-10, 0, -40.6, "enemy/people/people")
  L7_17:appendChild(L11_21)
  wait(150)
  L8_18:debugtest_mobToEnemy(L10_20, "police")
  wait(30)
  L8_18:debugtest_mobToEnemy(L11_21, "people")
  wait(30)
  while true do
    print(L8_18:getEnemyCount())
    wait()
  end
end
function setupLocator(A0_22, A1_23)
  local L2_24
  L2_24 = createGameObject2
  L2_24 = L2_24("Node")
  L2_24:setName(A0_22)
  L2_24:setPos(A1_23)
  L2_24:try_init()
  L2_24:waitForReady()
  L2_24:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_24)
  end
end
function localtest_create_enemy(A0_25, A1_26, A2_27, A3_28)
  local L4_29
  L4_29 = print
  L4_29("x " .. A0_25)
  L4_29 = print
  L4_29("y " .. A1_26)
  L4_29 = print
  L4_29("z " .. A2_27)
  L4_29 = print
  L4_29("classification " .. A3_28)
  L4_29 = "enemyA"
  createGameObject2("Puppet"):setEnableDebugDraw(true)
  createGameObject2("Puppet"):setName(L4_29)
  loadFileAsset("evd", "CharDefs/" .. A3_28):wait()
  createGameObject2("Puppet"):setDescription(loadFileAsset("evd", "CharDefs/" .. A3_28):getRoot())
  createGameObject2("Puppet"):setPos(Vector(A0_25, A1_26, A2_27))
  createGameObject2("Puppet"):setRot(YRotQuaternion(Deg2Rad(-90)))
  createGameObject2("Puppet"):registerIntoGroup("enemy")
  createGameObject2("Puppet"):try_init()
  createGameObject2("Puppet"):waitForReady()
  createGameObject2("Puppet"):try_start()
  createGameObject2("Puppet"):setVisible(true)
  return (createGameObject2("Puppet"))
end
