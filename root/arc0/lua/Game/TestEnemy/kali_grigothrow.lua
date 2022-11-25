import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_stage.lua")
enemy_gen_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  grigoCameraOutsideSpawnMode = true,
  spawnSet = {
    {
      type = "kali",
      locator = Vector(-5.32873, 1, 41.52032),
      name = "kali"
    },
    {
      type = "grigo",
      locator = Vector(-5.32873, 1.39475, 60.52032),
      name = "grigo01"
    },
    {
      type = "grigo",
      locator = Vector(-5.32873, 1.39475, 50.52032),
      name = "grigo02"
    },
    {
      type = "grigo",
      locator = Vector(-5.32873, 1.39475, 40.52032),
      name = "grigo03"
    },
    {
      type = "grigo",
      locator = Vector(-5.32873, 1.39475, 30.52032),
      name = "grigo04"
    },
    {
      type = "grigo",
      locator = Vector(-5.32873, 1.39475, 20.52032),
      name = "grigo05"
    },
    {
      type = "grigo",
      locator = Vector(-5.32873, 1.39475, 10.52032),
      name = "grigo06"
    },
    {
      type = "grigo",
      locator = Vector(-15.32873, 1.39475, 60.52032),
      name = "grigo07"
    },
    {
      type = "grigo",
      locator = Vector(-25.32873, 1.39475, 60.52032),
      name = "grigo08"
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
  end
}
function main()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16
  L0_8 = Vector
  L1_9 = -12
  L2_10 = 1
  L3_11 = 70.6
  L0_8 = L0_8(L1_9, L2_10, L3_11)
  L1_9 = Vector
  L2_10 = -5
  L3_11 = 2
  L4_12 = 50.6
  L1_9 = L1_9(L2_10, L3_11, L4_12)
  L2_10 = Vector
  L3_11 = -10
  L4_12 = 4
  L5_13 = 17.6
  L2_10 = L2_10(L3_11, L4_12, L5_13)
  L3_11 = Vector
  L4_12 = -10
  L5_13 = 4
  L6_14 = 17.6
  L3_11 = L3_11(L4_12, L5_13, L6_14)
  L4_12 = Vector
  L5_13 = -3
  L6_14 = 0.8
  L7_15 = 18.5
  L4_12 = L4_12(L5_13, L6_14, L7_15)
  L5_13 = DebugStage
  L6_14 = L5_13
  L5_13 = L5_13.createTestStage
  L5_13 = L5_13(L6_14)
  L6_14 = DebugStage
  L7_15 = L6_14
  L6_14 = L6_14.createTestPlayer
  L8_16 = L0_8
  L6_14 = L6_14(L7_15, L8_16, YRotQuaternion(Deg2Rad(180)))
  L7_15 = findGameObject2
  L8_16 = "Area"
  L7_15 = L7_15(L8_16, "motion_test_stage1_01")
  L8_16 = createGameObject2
  L8_16 = L8_16("EnemyGenerator")
  L8_16:addActionArea(Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L8_16:addRespawnArea(Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L8_16:addActiveArea(Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L7_15:appendChild(L8_16)
  L8_16:setWorldPos(Vector(0, 0, 0))
  L8_16:setSpecTableName("enemy_gen_02")
  L8_16:try_init()
  L8_16:waitForReady()
  L8_16:try_start()
  L8_16:requestSpawn()
  L7_15 = print
  L8_16 = "init all"
  L7_15(L8_16)
  L7_15 = initializeAllGameObjects
  L7_15()
  L7_15 = print
  L8_16 = "wait ready all"
  L7_15(L8_16)
  L7_15 = waitForReadyAllGameObjects
  L7_15()
  L7_15 = print
  L8_16 = "start all"
  L7_15(L8_16)
  L7_15 = startAllGameObjects
  L7_15()
  L7_15 = Debug
  L8_16 = L7_15
  L7_15 = L7_15.setSwitch
  L7_15(L8_16, {"Display", "Debug Draw"}, true)
  L7_15 = Debug
  L8_16 = L7_15
  L7_15 = L7_15.setSwitch
  L7_15(L8_16, {
    "Display",
    "File Asset Status"
  }, false)
  L7_15 = Debug
  L8_16 = L7_15
  L7_15 = L7_15.setSwitch
  L7_15(L8_16, {
    "Display",
    "Warning Indicator"
  }, false)
  L7_15 = Debug
  L8_16 = L7_15
  L7_15 = L7_15.setSwitch
  L7_15(L8_16, {
    "Development",
    "All On"
  }, true)
  L7_15 = Debug
  L8_16 = L7_15
  L7_15 = L7_15.setSwitch
  L7_15(L8_16, {
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }, true)
  L7_15 = Debug
  L8_16 = L7_15
  L7_15 = L7_15.setSwitch
  L7_15(L8_16, {
    "Game Objects",
    "Player",
    "SpAttackPoint: Infinite"
  }, true)
  L7_15 = HUD
  L8_16 = L7_15
  L7_15 = L7_15.hpgDispReq_FadeIn
  L7_15(L8_16)
  L7_15 = HUD
  L8_16 = L7_15
  L7_15 = L7_15.grgDispReq_FadeIn
  L7_15(L8_16)
  while true do
    L7_15 = wait
    L7_15()
  end
end
function setupLocator(A0_17, A1_18)
  local L2_19
  L2_19 = createGameObject2
  L2_19 = L2_19("Node")
  L2_19:setName(A0_17)
  L2_19:setPos(A1_18)
  L2_19:try_init()
  L2_19:waitForReady()
  L2_19:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_19)
  end
end
function localtest_create_enemy_async(A0_20, A1_21, A2_22, A3_23)
  invokeTask(localtest_create_enemy, A0_20, A1_21, A2_22, A3_23)
end
function localtest_create_enemy(A0_24, A1_25, A2_26, A3_27)
  local L4_28, L5_29, L6_30, L7_31
  L4_28 = print
  L5_29 = "x "
  L6_30 = A0_24
  L5_29 = L5_29 .. L6_30
  L4_28(L5_29)
  L4_28 = print
  L5_29 = "y "
  L6_30 = A1_25
  L5_29 = L5_29 .. L6_30
  L4_28(L5_29)
  L4_28 = print
  L5_29 = "z "
  L6_30 = A2_26
  L5_29 = L5_29 .. L6_30
  L4_28(L5_29)
  L4_28 = print
  L5_29 = "classification "
  L6_30 = A3_27
  L5_29 = L5_29 .. L6_30
  L4_28(L5_29)
  L4_28 = "enemyA"
  L5_29 = createGameObject2
  L6_30 = "Puppet"
  L5_29 = L5_29(L6_30)
  L7_31 = L5_29
  L6_30 = L5_29.setEnableDebugDraw
  L6_30(L7_31, true)
  L7_31 = L5_29
  L6_30 = L5_29.setName
  L6_30(L7_31, L4_28)
  L6_30 = loadFileAsset
  L7_31 = "evd"
  L6_30 = L6_30(L7_31, "CharDefs/" .. A3_27)
  L7_31 = L6_30.wait
  L7_31(L6_30)
  L7_31 = L5_29.setDescription
  L7_31(L5_29, L6_30:getRoot())
  L7_31 = L5_29.setPos
  L7_31(L5_29, Vector(A0_24, A1_25, A2_26))
  L7_31 = L5_29.setRot
  L7_31(L5_29, YRotQuaternion(Deg2Rad(-90)))
  L7_31 = L5_29.registerIntoGroup
  L7_31(L5_29, "enemy")
  L7_31 = L5_29.setVisible
  L7_31(L5_29, false)
  L7_31 = createGameObject2
  L7_31 = L7_31("EnemyBrain")
  L7_31:setEnableDebugDraw(true)
  L7_31:setName("enemyAI")
  loadFileAsset("evd", "CharDefs/" .. A3_27 .. "_exported_brain"):wait()
  L7_31:setDescription(loadFileAsset("evd", "CharDefs/" .. A3_27 .. "_exported_brain"):getRoot())
  L5_29:try_init()
  L7_31:try_init()
  L5_29:waitForReady()
  L7_31:waitForReady()
  L5_29:try_start()
  L7_31:try_start()
  L5_29:setBrain(L7_31)
  L5_29:setVisible(true)
end
