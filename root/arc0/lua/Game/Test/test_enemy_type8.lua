L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("common")
L0_0 = import
L0_0("GameDatabase")
L0_0 = import
L0_0("Pad")
L0_0 = import
L0_0("Font")
L0_0 = import
L0_0("Sound")
L0_0 = import
L0_0("EventData")
L0_0 = import
L0_0("Player")
L0_0 = dofile
L0_0("/Debug/Action/debug_supporter.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {}
L0_0.spawnOnStart = true
L0_0.autoPrepare = true
L0_0.spawnSet = {
  {
    type = "lunafishowner",
    locator = "locator_01",
    name = "lunashipowner01",
    ai_spawn_option = "LunaFishOwner/owner_test"
  }
}
L0_0.addMotherShipSpawnSetName = "spawnSetMotherShip"
L0_0.spawnSetMotherShip = {
  {
    type = "childship",
    locator = "locator_01",
    name = "childship01"
  }
}
L0_0.addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner"
L0_0.spawnSetLunaFishOwner = {
  {
    type = "lunafish",
    locator = "locator_01",
    name = "lunafish01"
  }
}
function L0_0.onUpdate(A0_1)
  local L1_2
end
function L0_0.onEnter(A0_3)
  local L1_4
end
function L0_0.onLeave(A0_5)
  local L1_6
end
function L0_0.onObjectDead(A0_7, A1_8)
end
L0_0.enemyDeadNum = 0
function L0_0.getEnemyMax()
  local L0_9, L1_10
  L0_9 = enemy_gen_01
  L0_9 = L0_9.spawnSet
  L0_9 = #L0_9
  return L0_9
end
function L0_0.getEnemyName(A0_11)
  local L1_12
  L1_12 = enemy_gen_01
  L1_12 = L1_12.spawnSet
  L1_12 = L1_12[A0_11]
  L1_12 = L1_12.name
  return L1_12
end
enemy_gen_01 = L0_0
function L0_0(A0_13)
  attackerName = A0_13.name
  attackerType = A0_13.attacker
  print("enemy name " .. attackerName)
  print("enemy type " .. attackerType)
  A0_13.ret = true
  return A0_13
end
function main()
  local L0_14, L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26
  L0_14 = Vector
  L1_15 = -22
  L2_16 = 1
  L3_17 = 17.6
  L0_14 = L0_14(L1_15, L2_16, L3_17)
  L1_15 = Vector
  L2_16 = -5
  L3_17 = 2
  L4_18 = 50.6
  L1_15 = L1_15(L2_16, L3_17, L4_18)
  L2_16 = Vector
  L3_17 = -10
  L4_18 = 4
  L5_19 = 17.6
  L2_16 = L2_16(L3_17, L4_18, L5_19)
  L3_17 = Vector
  L4_18 = -10
  L5_19 = 4
  L6_20 = 17.6
  L3_17 = L3_17(L4_18, L5_19, L6_20)
  L4_18 = Vector
  L5_19 = -3
  L6_20 = 0.8
  L7_21 = 18.5
  L4_18 = L4_18(L5_19, L6_20, L7_21)
  L5_19 = DebugStage
  L6_20 = L5_19
  L5_19 = L5_19.createTestStage
  L5_19 = L5_19(L6_20)
  L7_21 = L5_19
  L6_20 = L5_19.setDriftEnable
  L8_22 = false
  L6_20(L7_21, L8_22)
  L6_20 = createSandbox2
  L7_21 = "father2"
  L6_20 = L6_20(L7_21)
  L8_22 = L6_20
  L7_21 = L6_20.setString
  L9_23 = "g_filename"
  L10_24 = "/Game/Event2/father2.lua"
  L7_21(L8_22, L9_23, L10_24)
  L8_22 = L6_20
  L7_21 = L6_20.try_init
  L7_21(L8_22)
  L8_22 = L6_20
  L7_21 = L6_20.waitForReady
  L7_21(L8_22)
  L8_22 = L6_20
  L7_21 = L6_20.try_start
  L7_21(L8_22)
  while true do
    L8_22 = L6_20
    L7_21 = L6_20.sendEvent
    L9_23 = "isPcSpawned"
    L7_21 = L7_21(L8_22, L9_23)
    if not L7_21 then
      L7_21 = wait
      L7_21()
    end
  end
  L7_21 = Debug
  L8_22 = L7_21
  L7_21 = L7_21.setSwitch
  L9_23 = {
    L10_24,
    L11_25,
    L12_26
  }
  L10_24 = "Game Objects"
  L11_25 = "Player"
  L12_26 = "LifePoint: Infinite"
  L10_24 = true
  L7_21(L8_22, L9_23, L10_24)
  L7_21 = Debug
  L8_22 = L7_21
  L7_21 = L7_21.setSwitch
  L9_23 = {
    L10_24,
    L11_25,
    L12_26
  }
  L10_24 = "Game Objects"
  L11_25 = "Player"
  L12_26 = "GravityPower: Infinite"
  L10_24 = true
  L7_21(L8_22, L9_23, L10_24)
  L7_21 = loadFileAsset
  L8_22 = "evb"
  L9_23 = "evx/test_enemy_type_08"
  L7_21 = L7_21(L8_22, L9_23)
  L8_22, L9_23 = nil, nil
  if L7_21 ~= nil then
    L11_25 = L7_21
    L10_24 = L7_21.wait
    L10_24(L11_25)
    L11_25 = L7_21
    L10_24 = L7_21.getRoot
    L10_24 = L10_24(L11_25)
    L8_22 = L10_24
    L10_24 = EventData
    L11_25 = L10_24
    L10_24 = L10_24.create
    L12_26 = "test_enemy_type_08"
    L10_24 = L10_24(L11_25, L12_26, nil, L8_22)
    L9_23 = L10_24
    L11_25 = L9_23
    L10_24 = L9_23.try_init
    L10_24(L11_25)
    L11_25 = L9_23
    L10_24 = L9_23.waitForReady
    L10_24(L11_25)
    L11_25 = L9_23
    L10_24 = L9_23.try_start
    L10_24(L11_25)
  end
  L10_24 = wait
  L10_24()
  L10_24 = findGameObject2
  L11_25 = "Area"
  L12_26 = "motion_test_stage1_01"
  L10_24 = L10_24(L11_25, L12_26)
  L11_25 = findGameObject2
  L12_26 = "EventData"
  L11_25 = L11_25(L12_26, "evarea2_area01")
  L12_26 = L10_24.appendChild
  L12_26(L10_24, L11_25)
  L12_26 = findGameObject2
  L12_26 = L12_26("EnemyGenerator", "enmgen2_01")
  L10_24:appendChild(L12_26)
  L12_26:setEventListener("DestroyEnemyReport", L0_0)
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
function localtest_create_enemy_async(A0_27, A1_28, A2_29, A3_30)
  invokeTask(localtest_create_enemy, A0_27, A1_28, A2_29, A3_30)
end
function localtest_create_enemy(A0_31, A1_32, A2_33, A3_34)
  local L4_35, L5_36, L6_37, L7_38
  L4_35 = print
  L5_36 = "x "
  L6_37 = A0_31
  L5_36 = L5_36 .. L6_37
  L4_35(L5_36)
  L4_35 = print
  L5_36 = "y "
  L6_37 = A1_32
  L5_36 = L5_36 .. L6_37
  L4_35(L5_36)
  L4_35 = print
  L5_36 = "z "
  L6_37 = A2_33
  L5_36 = L5_36 .. L6_37
  L4_35(L5_36)
  L4_35 = print
  L5_36 = "classification "
  L6_37 = A3_34
  L5_36 = L5_36 .. L6_37
  L4_35(L5_36)
  L4_35 = "enemyA"
  L5_36 = createGameObject2
  L6_37 = "Puppet"
  L5_36 = L5_36(L6_37)
  L7_38 = L5_36
  L6_37 = L5_36.setEnableDebugDraw
  L6_37(L7_38, true)
  L7_38 = L5_36
  L6_37 = L5_36.setName
  L6_37(L7_38, L4_35)
  L6_37 = loadFileAsset
  L7_38 = "evd"
  L6_37 = L6_37(L7_38, "CharDefs/" .. A3_34)
  L7_38 = L6_37.wait
  L7_38(L6_37)
  L7_38 = L5_36.setDescription
  L7_38(L5_36, L6_37:getRoot())
  L7_38 = L5_36.setPos
  L7_38(L5_36, Vector(A0_31, A1_32, A2_33))
  L7_38 = L5_36.setRot
  L7_38(L5_36, YRotQuaternion(Deg2Rad(-90)))
  L7_38 = L5_36.registerIntoGroup
  L7_38(L5_36, "enemy")
  L7_38 = L5_36.setVisible
  L7_38(L5_36, false)
  L7_38 = createGameObject2
  L7_38 = L7_38("EnemyBrain")
  L7_38:setEnableDebugDraw(true)
  L7_38:setName("enemyAI")
  loadFileAsset("evd", "CharDefs/" .. A3_34 .. "_exported_brain"):wait()
  L7_38:setDescription(loadFileAsset("evd", "CharDefs/" .. A3_34 .. "_exported_brain"):getRoot())
  L5_36:try_init()
  L7_38:try_init()
  L5_36:waitForReady()
  L7_38:waitForReady()
  L5_36:try_start()
  L7_38:try_start()
  L5_36:setBrain(L7_38)
  L5_36:setVisible(true)
end
