import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_stage.lua")
enemy_gen_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier02",
      ai_spawn_option = "Soldier/soldier_test"
    }
  },
  addSpawnSetName = "spawnSetSoldier",
  spawnSetSoldier = {
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier01",
      ai_spawn_option = "Soldier/soldier_test"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier02",
      ai_spawn_option = "Soldier/soldier_test"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier03",
      ai_spawn_option = "Soldier/soldier_test"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier04",
      ai_spawn_option = "Soldier/soldier_test"
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
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21
  L0_8 = Vector
  L1_9 = -22
  L2_10 = 1
  L3_11 = 17.6
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
  L9_17 = YRotQuaternion
  L10_18 = Deg2Rad
  L11_19 = 90
  L13_21 = L10_18(L11_19)
  L13_21 = L9_17(L10_18, L11_19, L12_20, L13_21, L10_18(L11_19))
  L6_14 = L6_14(L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L9_17(L10_18, L11_19, L12_20, L13_21, L10_18(L11_19)))
  L7_15 = createGameObject2
  L8_16 = "Node"
  L7_15 = L7_15(L8_16)
  L9_17 = L7_15
  L8_16 = L7_15.setName
  L10_18 = "locator_enemy_pos"
  L8_16(L9_17, L10_18)
  L9_17 = L7_15
  L8_16 = L7_15.setPos
  L10_18 = L4_12
  L8_16(L9_17, L10_18)
  L8_16 = createGameObject2
  L9_17 = "Node"
  L8_16 = L8_16(L9_17)
  L10_18 = L7_15
  L9_17 = L7_15.setName
  L11_19 = "locator_soldier_spawn"
  L9_17(L10_18, L11_19)
  L10_18 = L7_15
  L9_17 = L7_15.setPos
  L11_19 = Vector
  L12_20 = 26.4
  L13_21 = 0.7
  L13_21 = L11_19(L12_20, L13_21, 0.7)
  L9_17(L10_18, L11_19, L12_20, L13_21, L11_19(L12_20, L13_21, 0.7))
  L9_17 = loadFileAsset
  L10_18 = "evb"
  L11_19 = "evx/test_enemy"
  L9_17 = L9_17(L10_18, L11_19)
  L10_18, L11_19 = nil, nil
  L12_20 = print
  L13_21 = "-------------------------------------------------------------------------------------------------------------------start"
  L12_20(L13_21)
  if L9_17 ~= nil then
    L13_21 = L9_17
    L12_20 = L9_17.wait
    L12_20(L13_21)
    L13_21 = L9_17
    L12_20 = L9_17.getRoot
    L12_20 = L12_20(L13_21)
    L10_18 = L12_20
    L12_20 = EventData
    L13_21 = L12_20
    L12_20 = L12_20.create
    L12_20 = L12_20(L13_21, "test_kudo", nil, L10_18)
    L11_19 = L12_20
    L13_21 = L11_19
    L12_20 = L11_19.try_init
    L12_20(L13_21)
    L13_21 = L11_19
    L12_20 = L11_19.waitForReady
    L12_20(L13_21)
    L13_21 = L11_19
    L12_20 = L11_19.try_start
    L12_20(L13_21)
    L12_20 = print
    L13_21 = "ok"
    L12_20(L13_21)
  end
  L12_20 = print
  L13_21 = "init all"
  L12_20(L13_21)
  L12_20 = initializeAllGameObjects
  L12_20()
  L12_20 = print
  L13_21 = "wait ready all"
  L12_20(L13_21)
  L12_20 = waitForReadyAllGameObjects
  L12_20()
  L12_20 = print
  L13_21 = "start all"
  L12_20(L13_21)
  L12_20 = startAllGameObjects
  L12_20()
  L12_20 = Debug
  L13_21 = L12_20
  L12_20 = L12_20.setSwitch
  L12_20(L13_21, {"Display", "Debug Draw"}, true)
  L12_20 = Debug
  L13_21 = L12_20
  L12_20 = L12_20.setSwitch
  L12_20(L13_21, {
    "Display",
    "File Asset Status"
  }, false)
  L12_20 = Debug
  L13_21 = L12_20
  L12_20 = L12_20.setSwitch
  L12_20(L13_21, {
    "Display",
    "Warning Indicator"
  }, false)
  L12_20 = HUD
  L13_21 = L12_20
  L12_20 = L12_20.hpgDispReq_FadeIn
  L12_20(L13_21)
  L12_20 = HUD
  L13_21 = L12_20
  L12_20 = L12_20.grgDispReq_FadeIn
  L12_20(L13_21)
  L12_20 = Vector
  L13_21 = 0
  L12_20 = L12_20(L13_21, 10, 0)
  L13_21 = nil
  while not L13_21 do
    L13_21 = findGameObject2("EnemyGenerator", "enmgen2_01")
    wait()
  end
  L13_21:requestSpawn()
  while true do
    wait()
  end
end
function localtest_create_enemy_async(A0_22, A1_23, A2_24, A3_25)
  invokeTask(localtest_create_enemy, A0_22, A1_23, A2_24, A3_25)
end
function localtest_create_enemy(A0_26, A1_27, A2_28, A3_29)
  local L4_30, L5_31, L6_32, L7_33
  L4_30 = print
  L5_31 = "x "
  L6_32 = A0_26
  L5_31 = L5_31 .. L6_32
  L4_30(L5_31)
  L4_30 = print
  L5_31 = "y "
  L6_32 = A1_27
  L5_31 = L5_31 .. L6_32
  L4_30(L5_31)
  L4_30 = print
  L5_31 = "z "
  L6_32 = A2_28
  L5_31 = L5_31 .. L6_32
  L4_30(L5_31)
  L4_30 = print
  L5_31 = "classification "
  L6_32 = A3_29
  L5_31 = L5_31 .. L6_32
  L4_30(L5_31)
  L4_30 = "enemyA"
  L5_31 = createGameObject2
  L6_32 = "Puppet"
  L5_31 = L5_31(L6_32)
  L7_33 = L5_31
  L6_32 = L5_31.setEnableDebugDraw
  L6_32(L7_33, true)
  L7_33 = L5_31
  L6_32 = L5_31.setName
  L6_32(L7_33, L4_30)
  L6_32 = loadFileAsset
  L7_33 = "evd"
  L6_32 = L6_32(L7_33, "CharDefs/" .. A3_29)
  L7_33 = L6_32.wait
  L7_33(L6_32)
  L7_33 = L5_31.setDescription
  L7_33(L5_31, L6_32:getRoot())
  L7_33 = L5_31.setPos
  L7_33(L5_31, Vector(A0_26, A1_27, A2_28))
  L7_33 = L5_31.setRot
  L7_33(L5_31, YRotQuaternion(Deg2Rad(-90)))
  L7_33 = L5_31.registerIntoGroup
  L7_33(L5_31, "enemy")
  L7_33 = L5_31.setVisible
  L7_33(L5_31, false)
  L7_33 = createGameObject2
  L7_33 = L7_33("EnemyBrain")
  L7_33:setEnableDebugDraw(true)
  L7_33:setName("enemyAI")
  loadFileAsset("evd", "CharDefs/" .. A3_29 .. "_exported_brain"):wait()
  L7_33:setDescription(loadFileAsset("evd", "CharDefs/" .. A3_29 .. "_exported_brain"):getRoot())
  L5_31:try_init()
  L7_33:try_init()
  L5_31:waitForReady()
  L7_33:waitForReady()
  L5_31:try_start()
  L7_33:try_start()
  L5_31:setBrain(L7_33)
  L5_31:setVisible(true)
end
