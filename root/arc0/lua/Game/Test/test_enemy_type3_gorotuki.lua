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
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      type = "gorotuki_pipe",
      locator = "locator_01_01",
      name = "officer01"
    }
  },
  addSpawnSetName = "spawnSetSoldier",
  spawnSetSoldier = {
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "call_soldier04"
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
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22
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
  L14_22 = L10_18(L11_19)
  L14_22 = L9_17(L10_18, L11_19, L12_20, L13_21, L14_22, L10_18(L11_19))
  L6_14 = L6_14(L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L9_17(L10_18, L11_19, L12_20, L13_21, L14_22, L10_18(L11_19)))
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
  L14_22 = 0.7
  L14_22 = L11_19(L12_20, L13_21, L14_22)
  L9_17(L10_18, L11_19, L12_20, L13_21, L14_22, L11_19(L12_20, L13_21, L14_22))
  L9_17 = loadFileAsset
  L10_18 = "evb"
  L11_19 = "evx/test_enemy_type_03"
  L9_17 = L9_17(L10_18, L11_19)
  L10_18, L11_19 = nil, nil
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
    L14_22 = "test_kudo"
    L12_20 = L12_20(L13_21, L14_22, nil, L10_18)
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
  L14_22 = {"Display", "Debug Draw"}
  L12_20(L13_21, L14_22, true)
  L12_20 = Debug
  L13_21 = L12_20
  L12_20 = L12_20.setSwitch
  L14_22 = {
    "Display",
    "File Asset Status"
  }
  L12_20(L13_21, L14_22, false)
  L12_20 = Debug
  L13_21 = L12_20
  L12_20 = L12_20.setSwitch
  L14_22 = {
    "Display",
    "Warning Indicator"
  }
  L12_20(L13_21, L14_22, false)
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
  L14_22 = 10
  L12_20 = L12_20(L13_21, L14_22, 0)
  L13_21 = nil
  while not L13_21 do
    L14_22 = findGameObject2
    L14_22 = L14_22("EnemyGenerator", "enmgen2_01")
    L13_21 = L14_22
    L14_22 = wait
    L14_22()
  end
  L14_22 = L13_21.requestSpawn
  L14_22(L13_21)
  while true do
    L14_22 = L13_21.getEnemyCount
    L14_22 = L14_22(L13_21)
    print("enemy:" .. L14_22)
    wait()
  end
end
function localtest_create_enemy_async(A0_23, A1_24, A2_25, A3_26)
  invokeTask(localtest_create_enemy, A0_23, A1_24, A2_25, A3_26)
end
function localtest_create_enemy(A0_27, A1_28, A2_29, A3_30)
  local L4_31, L5_32, L6_33, L7_34
  L4_31 = print
  L5_32 = "x "
  L6_33 = A0_27
  L5_32 = L5_32 .. L6_33
  L4_31(L5_32)
  L4_31 = print
  L5_32 = "y "
  L6_33 = A1_28
  L5_32 = L5_32 .. L6_33
  L4_31(L5_32)
  L4_31 = print
  L5_32 = "z "
  L6_33 = A2_29
  L5_32 = L5_32 .. L6_33
  L4_31(L5_32)
  L4_31 = print
  L5_32 = "classification "
  L6_33 = A3_30
  L5_32 = L5_32 .. L6_33
  L4_31(L5_32)
  L4_31 = "enemyA"
  L5_32 = createGameObject2
  L6_33 = "Puppet"
  L5_32 = L5_32(L6_33)
  L7_34 = L5_32
  L6_33 = L5_32.setEnableDebugDraw
  L6_33(L7_34, true)
  L7_34 = L5_32
  L6_33 = L5_32.setName
  L6_33(L7_34, L4_31)
  L6_33 = loadFileAsset
  L7_34 = "evd"
  L6_33 = L6_33(L7_34, "CharDefs/" .. A3_30)
  L7_34 = L6_33.wait
  L7_34(L6_33)
  L7_34 = L5_32.setDescription
  L7_34(L5_32, L6_33:getRoot())
  L7_34 = L5_32.setPos
  L7_34(L5_32, Vector(A0_27, A1_28, A2_29))
  L7_34 = L5_32.setRot
  L7_34(L5_32, YRotQuaternion(Deg2Rad(-90)))
  L7_34 = L5_32.registerIntoGroup
  L7_34(L5_32, "enemy")
  L7_34 = L5_32.setVisible
  L7_34(L5_32, false)
  L7_34 = createGameObject2
  L7_34 = L7_34("EnemyBrain")
  L7_34:setEnableDebugDraw(true)
  L7_34:setName("enemyAI")
  L5_32:try_init()
  L7_34:try_init()
  L5_32:waitForReady()
  L7_34:waitForReady()
  L5_32:try_start()
  L7_34:try_start()
  while L5_32:isLoading() do
    wait()
  end
  loadFileAsset("evd", "CharDefs/" .. A3_30 .. "_exported_brain"):wait()
  L7_34:setDescription(loadFileAsset("evd", "CharDefs/" .. A3_30 .. "_exported_brain"):getRoot())
  L5_32:setBrain(L7_34)
  L5_32:setVisible(true)
end
