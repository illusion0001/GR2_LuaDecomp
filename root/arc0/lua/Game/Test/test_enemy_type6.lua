import("math")
import("Debug")
import("HUD")
import("common")
import("GameDatabase")
import("Pad")
import("Font")
import("Sound")
import("EventData")
import("Player")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_stage.lua")
enemy_gen_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mothership",
      locator = "locator_01",
      name = "ship01",
      ai_spawn_option = "MotherShip/MotherShip_Test"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_01",
      name = "childship01"
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
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_8, L1_9
    L0_8 = enemy_gen_01
    L0_8 = L0_8.spawnSet
    L0_8 = #L0_8
    return L0_8
  end,
  getEnemyName = function(A0_10)
    local L1_11
    L1_11 = enemy_gen_01
    L1_11 = L1_11.spawnSet
    L1_11 = L1_11[A0_10]
    L1_11 = L1_11.name
    return L1_11
  end
}
function main()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24
  L0_12 = Vector
  L1_13 = -22
  L2_14 = 1
  L3_15 = 17.6
  L0_12 = L0_12(L1_13, L2_14, L3_15)
  L1_13 = Vector
  L2_14 = -5
  L3_15 = 2
  L4_16 = 50.6
  L1_13 = L1_13(L2_14, L3_15, L4_16)
  L2_14 = Vector
  L3_15 = -10
  L4_16 = 4
  L5_17 = 17.6
  L2_14 = L2_14(L3_15, L4_16, L5_17)
  L3_15 = Vector
  L4_16 = -10
  L5_17 = 4
  L6_18 = 17.6
  L3_15 = L3_15(L4_16, L5_17, L6_18)
  L4_16 = Vector
  L5_17 = -3
  L6_18 = 0.8
  L7_19 = 18.5
  L4_16 = L4_16(L5_17, L6_18, L7_19)
  L5_17 = DebugStage
  L6_18 = L5_17
  L5_17 = L5_17.createTestStage
  L5_17 = L5_17(L6_18)
  L7_19 = L5_17
  L6_18 = L5_17.setDriftEnable
  L8_20 = false
  L6_18(L7_19, L8_20)
  L6_18 = createSandbox2
  L7_19 = "father2"
  L6_18 = L6_18(L7_19)
  L8_20 = L6_18
  L7_19 = L6_18.setString
  L9_21 = "g_filename"
  L10_22 = "/Game/Event2/father2.lua"
  L7_19(L8_20, L9_21, L10_22)
  L8_20 = L6_18
  L7_19 = L6_18.try_init
  L7_19(L8_20)
  L8_20 = L6_18
  L7_19 = L6_18.waitForReady
  L7_19(L8_20)
  L8_20 = L6_18
  L7_19 = L6_18.try_start
  L7_19(L8_20)
  while true do
    L8_20 = L6_18
    L7_19 = L6_18.sendEvent
    L9_21 = "isPcSpawned"
    L7_19 = L7_19(L8_20, L9_21)
    if not L7_19 then
      L7_19 = wait
      L7_19()
    end
  end
  L7_19 = Debug
  L8_20 = L7_19
  L7_19 = L7_19.setSwitch
  L9_21 = {
    L10_22,
    L11_23,
    L12_24
  }
  L10_22 = "Game Objects"
  L11_23 = "Player"
  L12_24 = "LifePoint: Infinite"
  L10_22 = true
  L7_19(L8_20, L9_21, L10_22)
  L7_19 = Debug
  L8_20 = L7_19
  L7_19 = L7_19.setSwitch
  L9_21 = {
    L10_22,
    L11_23,
    L12_24
  }
  L10_22 = "Game Objects"
  L11_23 = "Player"
  L12_24 = "GravityPower: Infinite"
  L10_22 = true
  L7_19(L8_20, L9_21, L10_22)
  L7_19 = loadFileAsset
  L8_20 = "evb"
  L9_21 = "evx/test_enemy_type_06"
  L7_19 = L7_19(L8_20, L9_21)
  L8_20, L9_21 = nil, nil
  if L7_19 ~= nil then
    L11_23 = L7_19
    L10_22 = L7_19.wait
    L10_22(L11_23)
    L11_23 = L7_19
    L10_22 = L7_19.getRoot
    L10_22 = L10_22(L11_23)
    L8_20 = L10_22
    L10_22 = EventData
    L11_23 = L10_22
    L10_22 = L10_22.create
    L12_24 = "test_enemy_type_06"
    L10_22 = L10_22(L11_23, L12_24, nil, L8_20)
    L9_21 = L10_22
    L11_23 = L9_21
    L10_22 = L9_21.try_init
    L10_22(L11_23)
    L11_23 = L9_21
    L10_22 = L9_21.waitForReady
    L10_22(L11_23)
    L11_23 = L9_21
    L10_22 = L9_21.try_start
    L10_22(L11_23)
  end
  L10_22 = wait
  L10_22()
  L10_22 = findGameObject2
  L11_23 = "Area"
  L12_24 = "motion_test_stage1_01"
  L10_22 = L10_22(L11_23, L12_24)
  L11_23 = findGameObject2
  L12_24 = "EventData"
  L11_23 = L11_23(L12_24, "evarea2_area01")
  L12_24 = L10_22.appendChild
  L12_24(L10_22, L11_23)
  L12_24 = findGameObject2
  L12_24 = L12_24("EnemyGenerator", "enmgen2_01")
  L10_22:appendChild(L12_24)
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Enemy"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Group18"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }, true)
  Debug:setSwitch({
    "Game Objects",
    "Player",
    "GravityPower: Infinite"
  }, true)
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
end
function localtest_create_enemy_async(A0_25, A1_26, A2_27, A3_28)
  invokeTask(localtest_create_enemy, A0_25, A1_26, A2_27, A3_28)
end
function localtest_create_enemy(A0_29, A1_30, A2_31, A3_32)
  local L4_33, L5_34, L6_35, L7_36
  L4_33 = print
  L5_34 = "x "
  L6_35 = A0_29
  L5_34 = L5_34 .. L6_35
  L4_33(L5_34)
  L4_33 = print
  L5_34 = "y "
  L6_35 = A1_30
  L5_34 = L5_34 .. L6_35
  L4_33(L5_34)
  L4_33 = print
  L5_34 = "z "
  L6_35 = A2_31
  L5_34 = L5_34 .. L6_35
  L4_33(L5_34)
  L4_33 = print
  L5_34 = "classification "
  L6_35 = A3_32
  L5_34 = L5_34 .. L6_35
  L4_33(L5_34)
  L4_33 = "enemyA"
  L5_34 = createGameObject2
  L6_35 = "Puppet"
  L5_34 = L5_34(L6_35)
  L7_36 = L5_34
  L6_35 = L5_34.setEnableDebugDraw
  L6_35(L7_36, true)
  L7_36 = L5_34
  L6_35 = L5_34.setName
  L6_35(L7_36, L4_33)
  L6_35 = loadFileAsset
  L7_36 = "evd"
  L6_35 = L6_35(L7_36, "CharDefs/" .. A3_32)
  L7_36 = L6_35.wait
  L7_36(L6_35)
  L7_36 = L5_34.setDescription
  L7_36(L5_34, L6_35:getRoot())
  L7_36 = L5_34.setPos
  L7_36(L5_34, Vector(A0_29, A1_30, A2_31))
  L7_36 = L5_34.setRot
  L7_36(L5_34, YRotQuaternion(Deg2Rad(-90)))
  L7_36 = L5_34.registerIntoGroup
  L7_36(L5_34, "enemy")
  L7_36 = L5_34.setVisible
  L7_36(L5_34, false)
  L7_36 = createGameObject2
  L7_36 = L7_36("EnemyBrain")
  L7_36:setEnableDebugDraw(true)
  L7_36:setName("enemyAI")
  loadFileAsset("evd", "CharDefs/" .. A3_32 .. "_exported_brain"):wait()
  L7_36:setDescription(loadFileAsset("evd", "CharDefs/" .. A3_32 .. "_exported_brain"):getRoot())
  L5_34:try_init()
  L7_36:try_init()
  L5_34:waitForReady()
  L7_36:waitForReady()
  L5_34:try_start()
  L7_36:try_start()
  L5_34:setBrain(L7_36)
  L5_34:setVisible(true)
end
