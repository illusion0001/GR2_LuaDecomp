L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("common")
L0_0 = import
L0_0("Camera")
L0_0 = import
L0_0("Sound")
L0_0 = import
L0_0("Pad")
L0_0 = import
L0_0("EventData")
L0_0 = dofile
L0_0("/Debug/Action/debug_supporter.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = dofile
L0_0("/Game/Misc/fatal_marker.lua")
L0_0 = {}
L0_0.spawnOnStart = true
L0_0.autoPrepare = true
L0_0.autoRebirthFlag = true
L0_0.spawnSet = {
  {
    type = "lastkali",
    locator = Vector(-21.32873, 20.39475, 25.52032),
    name = "lastkali01",
    ai_spawn_option = "LastKali/lastkali_test"
  },
  {
    type = "lastkaliarm_l_a",
    locator = "locator_01_01",
    name = "lastkaliarm_01"
  },
  {
    type = "lastkaliarm_l_b",
    locator = "locator_01_01",
    name = "lastkaliarm_02"
  },
  {
    type = "lastkaliarm_l_c",
    locator = "locator_01_01",
    name = "lastkaliarm_03"
  },
  {
    type = "lastkaliarm_l_d",
    locator = "locator_01_01",
    name = "lastkaliarm_04"
  },
  {
    type = "lastkaliarm_l_e",
    locator = "locator_01_01",
    name = "lastkaliarm_05"
  },
  {
    type = "lastkaliarm_l_f",
    locator = "locator_01_01",
    name = "lastkaliarm_06"
  },
  {
    type = "lastkaliarm_r_a",
    locator = "locator_01_01",
    name = "lastkaliarm_07"
  },
  {
    type = "lastkaliarm_r_b",
    locator = "locator_01_01",
    name = "lastkaliarm_08"
  },
  {
    type = "lastkaliarm_f_l_a",
    locator = "locator_01_01",
    name = "lastkaliarm_11"
  },
  {
    type = "lastkaliarm_f_r_a",
    locator = "locator_01_01",
    name = "lastkaliarm_12"
  },
  {
    type = "lastkaliarm_f_r_b",
    locator = "locator_01_01",
    name = "lastkaliarm_13"
  },
  {
    type = "lastkalihead_b",
    locator = "locator_01_01",
    name = "lastkalihead_01"
  },
  {
    type = "lastkalihead_c",
    locator = "locator_01_01",
    name = "lastkalihead_02"
  },
  {
    type = "lastkalihead_g",
    locator = "locator_01_01",
    name = "lastkalihead_03"
  },
  {
    type = "lastkalihead_h",
    locator = "locator_01_01",
    name = "lastkalihead_04"
  },
  {
    type = "lastkalihead_j",
    locator = "locator_01_01",
    name = "lastkalihead_05"
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
enemy_gen_02 = L0_0
L0_0 = false
function fn_lastkali_event(A0_9)
  local L1_10
  L1_10 = A0_9.eventType
  if L1_10 == "fatal_ok" then
    L1_10 = true
    L0_0 = L1_10
  end
end
function fn_lastkaliarm_event(A0_11)
  if A0_11.name == "lastkaliarm_01" then
    print("left arm")
  elseif A0_11.name == "lastkaliarm_07" then
    print("right arm")
    return
  end
  if A0_11.armEvent == "grab_start" then
    print("grab start " .. string.format("x: %f, y: %f, z: %f", A0_11.grabPosition.x, A0_11.grabPosition.y, A0_11.grabPosition.z))
  elseif A0_11.armEvent == "grab_success" then
    print("grab success")
    if A0_11.grabBrain ~= nil then
      print("grabBrain: " .. string.format("%s", A0_11.grabBrain:getTypeName()))
    end
    if A0_11.grabHandGizmo ~= nil then
      print("grabHandGizmo")
    end
    if A0_11.grabHandName ~= nil then
      print("grabHandName: " .. string.format("%s", A0_11.grabHandName))
    end
  elseif A0_11.armEvent == "grab_failed" then
    print("grab failed")
  elseif A0_11.armEvent == "throw_start" then
    print("throw start")
  elseif A0_11.armEvent == "throw_release" then
    print("throw release")
  elseif A0_11.armEvent == "damage_release" then
    print("damage release")
    if A0_11.attacker ~= nil then
      print("attacker: " .. string.format("%s", A0_11.attacker:getTypeName()))
    end
  elseif A0_11.armEvent == "arm_destroy" then
    print("arm destroy")
    if A0_11.attacker ~= nil then
      print("attacker: " .. string.format("%s", A0_11.attacker:getTypeName()))
    end
  elseif A0_11.armEvent == "arm_cutoff" then
    print("arm cutoff")
  end
end
function main()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20
  L0_12 = Vector
  L1_13 = -12
  L2_14 = 1
  L3_15 = 70.6
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
  L5_17 = Sound
  L6_18 = L5_17
  L5_17 = L5_17.loadResource
  L7_19 = "ep20_se"
  L5_17(L6_18, L7_19)
  L5_17 = DebugStage
  L6_18 = L5_17
  L5_17 = L5_17.createTestStage
  L5_17 = L5_17(L6_18)
  L6_18 = DebugStage
  L7_19 = L6_18
  L6_18 = L6_18.createTestPlayer
  L8_20 = L0_12
  L6_18 = L6_18(L7_19, L8_20, YRotQuaternion(Deg2Rad(180)))
  L7_19 = findGameObject2
  L8_20 = "Area"
  L7_19 = L7_19(L8_20, "motion_test_stage1_01")
  L8_20 = createGameObject2
  L8_20 = L8_20("EnemyGenerator")
  L8_20:addActionArea(Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L8_20:addRespawnArea(Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L8_20:addActiveArea(Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L7_19:appendChild(L8_20)
  L8_20:setWorldPos(Vector(0, 0, 0))
  L8_20:setSpecTableName("enemy_gen_02")
  L8_20:setName("enmgen2_01")
  L8_20:try_init()
  L8_20:waitForReady()
  L8_20:try_start()
  L8_20:requestSpawn()
  L7_19 = print
  L8_20 = "init all"
  L7_19(L8_20)
  L7_19 = initializeAllGameObjects
  L7_19()
  L7_19 = print
  L8_20 = "wait ready all"
  L7_19(L8_20)
  L7_19 = waitForReadyAllGameObjects
  L7_19()
  L7_19 = print
  L8_20 = "start all"
  L7_19(L8_20)
  L7_19 = startAllGameObjects
  L7_19()
  L7_19 = Debug
  L8_20 = L7_19
  L7_19 = L7_19.setSwitch
  L7_19(L8_20, {"Display", "Debug Draw"}, true)
  L7_19 = Debug
  L8_20 = L7_19
  L7_19 = L7_19.setSwitch
  L7_19(L8_20, {
    "Display",
    "File Asset Status"
  }, false)
  L7_19 = Debug
  L8_20 = L7_19
  L7_19 = L7_19.setSwitch
  L7_19(L8_20, {
    "Display",
    "Warning Indicator"
  }, false)
  L7_19 = HUD
  L8_20 = L7_19
  L7_19 = L7_19.hpgDispReq_FadeIn
  L7_19(L8_20)
  L7_19 = HUD
  L8_20 = L7_19
  L7_19 = L7_19.grgDispReq_FadeIn
  L7_19(L8_20)
  L7_19 = Vector
  L8_20 = 0
  L7_19 = L7_19(L8_20, 10, 0)
  L8_20 = nil
  while not L8_20 do
    L8_20 = findGameObject2("EnemyGenerator", "enmgen2_01")
    wait()
  end
  repeat
    wait()
  until findGameObject2("EnemyBrain", "lastkali01"):isReadyEnemy()
  findGameObject2("EnemyBrain", "lastkali01"):setEventListener("enemy_lastkali_event", fn_lastkali_event)
  repeat
    wait()
  until findGameObject2("EnemyBrain", "lastkaliarm_01"):isReadyEnemy()
  findGameObject2("EnemyBrain", "lastkaliarm_01"):setEventListener("enemy_lastkaliarm_event", fn_lastkaliarm_event)
  repeat
    wait()
  until findGameObject2("EnemyBrain", "lastkaliarm_07"):isReadyEnemy()
  findGameObject2("EnemyBrain", "lastkaliarm_07"):setEventListener("enemy_lastkaliarm_event", fn_lastkaliarm_event)
  FatalMarker.create(kFATAL_TYPE_EMP, nil, true):set(findGameObject2("Puppet", "lastkali01"), "bn_crystal_core2", true)
  while true do
    if not false and 0 >= findGameObject2("EnemyBrain", "lastkali01"):getHealth() - 100 then
      findGameObject2("EnemyBrain", "lastkali01"):eventMessage("requestHeadAppear")
    end
    if not false and L0_0 == true then
      findGameObject2("EnemyBrain", "lastkali01"):eventMessage("requestHeartAppear")
      wait(30)
      FatalMarker.create(kFATAL_TYPE_EMP, nil, true):run()
    end
    wait()
  end
end
function setupLocator(A0_21, A1_22)
  local L2_23
  L2_23 = createGameObject2
  L2_23 = L2_23("Node")
  L2_23:setName(A0_21)
  L2_23:setPos(A1_22)
  L2_23:try_init()
  L2_23:waitForReady()
  L2_23:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_23)
  end
end
function localtest_create_enemy_async(A0_24, A1_25, A2_26, A3_27)
  invokeTask(localtest_create_enemy, A0_24, A1_25, A2_26, A3_27)
end
function localtest_create_enemy(A0_28, A1_29, A2_30, A3_31)
  local L4_32, L5_33, L6_34, L7_35
  L4_32 = print
  L5_33 = "x "
  L6_34 = A0_28
  L5_33 = L5_33 .. L6_34
  L4_32(L5_33)
  L4_32 = print
  L5_33 = "y "
  L6_34 = A1_29
  L5_33 = L5_33 .. L6_34
  L4_32(L5_33)
  L4_32 = print
  L5_33 = "z "
  L6_34 = A2_30
  L5_33 = L5_33 .. L6_34
  L4_32(L5_33)
  L4_32 = print
  L5_33 = "classification "
  L6_34 = A3_31
  L5_33 = L5_33 .. L6_34
  L4_32(L5_33)
  L4_32 = "enemyA"
  L5_33 = createGameObject2
  L6_34 = "Puppet"
  L5_33 = L5_33(L6_34)
  L7_35 = L5_33
  L6_34 = L5_33.setEnableDebugDraw
  L6_34(L7_35, true)
  L7_35 = L5_33
  L6_34 = L5_33.setName
  L6_34(L7_35, L4_32)
  L6_34 = loadFileAsset
  L7_35 = "evd"
  L6_34 = L6_34(L7_35, "CharDefs/" .. A3_31)
  L7_35 = L6_34.wait
  L7_35(L6_34)
  L7_35 = L5_33.setDescription
  L7_35(L5_33, L6_34:getRoot())
  L7_35 = L5_33.setPos
  L7_35(L5_33, Vector(A0_28, A1_29, A2_30))
  L7_35 = L5_33.setRot
  L7_35(L5_33, YRotQuaternion(Deg2Rad(-90)))
  L7_35 = L5_33.registerIntoGroup
  L7_35(L5_33, "enemy")
  L7_35 = L5_33.setVisible
  L7_35(L5_33, false)
  L7_35 = createGameObject2
  L7_35 = L7_35("EnemyBrain")
  L7_35:setEnableDebugDraw(true)
  L7_35:setName("enemyAI")
  loadFileAsset("evd", "CharDefs/" .. A3_31 .. "_exported_brain"):wait()
  L7_35:setDescription(loadFileAsset("evd", "CharDefs/" .. A3_31 .. "_exported_brain"):getRoot())
  L5_33:try_init()
  L7_35:try_init()
  L5_33:waitForReady()
  L7_35:waitForReady()
  L5_33:try_start()
  L7_35:try_start()
  L5_33:setBrain(L7_35)
  L5_33:setVisible(true)
end
