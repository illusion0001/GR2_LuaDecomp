import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
import("Player")
import("Sound")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
function put_gimmickbg(A0_0, A1_1)
  createGameObject2("GimmickBg"):setDrawModelName(A1_1)
  createGameObject2("GimmickBg"):setCollisionName(A1_1)
  createGameObject2("GimmickBg"):setAttributeName(A1_1)
  createGameObject2("GimmickBg"):setPos(A0_0)
  createGameObject2("GimmickBg"):setAutoRestore(10)
  createGameObject2("GimmickBg"):setName(A1_1)
  createGameObject2("GimmickBg"):setUseCharaCollision(true)
  return (createGameObject2("GimmickBg"))
end
function put_barrel(A0_2)
  return put_gimmickbg(A0_2, "barrel_kk_01")
end
function enemy_simple_base_model_setup(A0_3, A1_4)
  createGameObject2("GimmickBg"):setDrawModelName(A1_4)
  createGameObject2("GimmickBg"):setPos(A0_3)
  createGameObject2("GimmickBg"):setName(A1_4)
  createGameObject2("GimmickBg"):setScale(0.001)
  createGameObject2("GimmickBg"):try_init()
  while not createGameObject2("GimmickBg"):isReady() do
    wait()
  end
  createGameObject2("GimmickBg"):try_start()
  print(A1_4)
end
function enemy_simple_base_model_setup_async(A0_5, A1_6)
  invokeTask(enemy_simple_base_model_setup, A0_5, A1_6)
end
function exitSandbox()
  Sound:unloadResource("enemy_se_hex")
  Sound:unloadResource("enemy_se_jir")
end
setExitCallback(exitSandbox)
function main()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19
  L0_7 = Vector
  L1_8 = -5.614086
  L2_9 = -1.999998
  L3_10 = 31.22108
  L0_7 = L0_7(L1_8, L2_9, L3_10)
  L1_8 = Vector
  L2_9 = -5
  L3_10 = 2
  L4_11 = 50.6
  L1_8 = L1_8(L2_9, L3_10, L4_11)
  L2_9 = Vector
  L3_10 = -5
  L4_11 = 0
  L5_12 = 47.6
  L2_9 = L2_9(L3_10, L4_11, L5_12)
  L3_10 = Sound
  L4_11 = L3_10
  L3_10 = L3_10.loadResource
  L5_12 = "enemy_se_hex"
  L3_10(L4_11, L5_12)
  L3_10 = Sound
  L4_11 = L3_10
  L3_10 = L3_10.loadResource
  L5_12 = "enemy_se_jir"
  L3_10(L4_11, L5_12)
  L3_10 = enemy_base_bg_setup
  L3_10()
  L3_10 = Vector
  L4_11 = -15
  L5_12 = 0.6
  L6_13 = 14.6
  L3_10 = L3_10(L4_11, L5_12, L6_13)
  L4_11 = print
  L5_12 = "init all"
  L4_11(L5_12)
  L4_11 = initializeAllGameObjects
  L4_11()
  L4_11 = print
  L5_12 = "wait ready all"
  L4_11(L5_12)
  L4_11 = waitForReadyAllGameObjects
  L4_11()
  L4_11 = print
  L5_12 = "start all"
  L4_11(L5_12)
  L4_11 = startAllGameObjects
  L4_11()
  L4_11 = DebugStage
  L5_12 = L4_11
  L4_11 = L4_11.createTestPlayer
  L6_13 = L0_7
  L7_14 = YRotQuaternion
  L8_15 = Deg2Rad
  L9_16 = 0
  L12_19 = L8_15(L9_16)
  L12_19 = L7_14(L8_15, L9_16, L10_17, L11_18, L12_19, L8_15(L9_16))
  L4_11 = L4_11(L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L7_14(L8_15, L9_16, L10_17, L11_18, L12_19, L8_15(L9_16)))
  L5_12 = Player
  L6_13 = L5_12
  L5_12 = L5_12.setEnergy
  L7_14 = Player
  L7_14 = L7_14.kEnergy_Life
  L8_15 = Player
  L9_16 = L8_15
  L8_15 = L8_15.getEnergyMax
  L10_17 = Player
  L10_17 = L10_17.kEnergy_Life
  L12_19 = L8_15(L9_16, L10_17)
  L5_12(L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L8_15(L9_16, L10_17))
  L5_12 = Player
  L6_13 = L5_12
  L5_12 = L5_12.setEnergy
  L7_14 = Player
  L7_14 = L7_14.kEnergy_Gravity
  L8_15 = Player
  L9_16 = L8_15
  L8_15 = L8_15.getEnergyMax
  L10_17 = Player
  L10_17 = L10_17.kEnergy_Gravity
  L12_19 = L8_15(L9_16, L10_17)
  L5_12(L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L8_15(L9_16, L10_17))
  L5_12 = Player
  L6_13 = L5_12
  L5_12 = L5_12.setEnergy
  L7_14 = Player
  L7_14 = L7_14.kEnergy_SpAttack
  L8_15 = Player
  L9_16 = L8_15
  L8_15 = L8_15.getEnergyMax
  L10_17 = Player
  L10_17 = L10_17.kEnergy_SpAttack
  L12_19 = L8_15(L9_16, L10_17)
  L5_12(L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L8_15(L9_16, L10_17))
  L5_12 = print
  L6_13 = "init all"
  L5_12(L6_13)
  L5_12 = initializeAllGameObjects
  L5_12()
  L5_12 = print
  L6_13 = "wait ready all"
  L5_12(L6_13)
  L5_12 = waitForReadyAllGameObjects
  L5_12()
  L5_12 = print
  L6_13 = "start all"
  L5_12(L6_13)
  L5_12 = startAllGameObjects
  L5_12()
  L5_12 = Vector
  L6_13 = 6
  L7_14 = 0
  L8_15 = 6
  L5_12 = L5_12(L6_13, L7_14, L8_15)
  L6_13 = localtest_create_enemy
  L7_14 = false
  L8_15 = L2_9.x
  L9_16 = L2_9.y
  L10_17 = L2_9.z
  L11_18 = "boss/fi/fi"
  L6_13(L7_14, L8_15, L9_16, L10_17, L11_18)
  L6_13 = Vector
  L7_14 = -12
  L8_15 = 3.65
  L9_16 = 17.6
  L6_13 = L6_13(L7_14, L8_15, L9_16)
  L7_14 = HUD
  L8_15 = L7_14
  L7_14 = L7_14.hpgDispReq_FadeIn
  L7_14(L8_15)
  L7_14 = HUD
  L8_15 = L7_14
  L7_14 = L7_14.grgDispReq_FadeIn
  L7_14(L8_15)
  L7_14 = Vector
  L8_15 = 0
  L9_16 = 10
  L10_17 = 0
  L7_14 = L7_14(L8_15, L9_16, L10_17)
  L8_15 = "pccubesensor2_test_OnEnter"
  L9_16 = "pccubesensor2_test_OnLeave"
  L10_17 = _G
  function L11_18()
    print("onEnter")
  end
  L10_17[L8_15] = L11_18
  L10_17 = _G
  function L11_18()
    print("onLeave")
  end
  L10_17[L9_16] = L11_18
  L10_17 = createGameObject2
  L11_18 = "Sensor"
  L10_17 = L10_17(L11_18)
  sensor_hdl = L10_17
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.setName
  L12_19 = "pccubesensor2_test"
  L10_17(L11_18, L12_19)
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.setDetectBehavior
  L12_19 = 1
  L10_17(L11_18, L12_19)
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.addBox
  L12_19 = Vector
  L12_19 = L12_19(100, 10, 100)
  L10_17(L11_18, L12_19, L12_19(100, 10, 100))
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.setPos
  L12_19 = Vector
  L12_19 = L12_19(-10.4, 24.5, 13.1)
  L10_17(L11_18, L12_19, L12_19(-10.4, 24.5, 13.1))
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.setRot
  L12_19 = YRotQuaternion
  L12_19 = L12_19(Deg2Rad(0))
  L10_17(L11_18, L12_19, L12_19(Deg2Rad(0)))
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.setOnEnter
  L12_19 = L8_15
  L10_17(L11_18, L12_19)
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.setOnLeave
  L12_19 = L9_16
  L10_17(L11_18, L12_19)
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.try_init
  L10_17(L11_18)
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.waitForReady
  L10_17(L11_18)
  L10_17 = sensor_hdl
  L11_18 = L10_17
  L10_17 = L10_17.try_start
  L10_17(L11_18)
  L10_17 = setupLocator
  L11_18 = "locator2_trijump_step_1"
  L12_19 = Vector
  L12_19 = L12_19(-8.777044, 0.1, -56.85956)
  L10_17(L11_18, L12_19, L12_19(-8.777044, 0.1, -56.85956))
  L10_17 = setupLocator
  L11_18 = "locator2_trijump_step_2"
  L12_19 = Vector
  L12_19 = L12_19(131826, 0.1, -55.98809)
  L10_17(L11_18, L12_19, L12_19(131826, 0.1, -55.98809))
  L10_17 = setupLocator
  L11_18 = "locator2_trijump_1"
  L12_19 = Vector
  L12_19 = L12_19(-10.75814, 10.62394, -61.48629)
  L10_17(L11_18, L12_19, L12_19(-10.75814, 10.62394, -61.48629))
  L10_17 = setupLocator
  L11_18 = "locator2_trijump_2"
  L12_19 = Vector
  L12_19 = L12_19(8.995899, 11.75075, -61.48629)
  L10_17(L11_18, L12_19, L12_19(8.995899, 11.75075, -61.48629))
  L10_17 = setupLocator
  L11_18 = "locator2_move_1"
  L12_19 = Vector
  L12_19 = L12_19(12.02664, 7.629395E-6, -36.84981)
  L10_17(L11_18, L12_19, L12_19(12.02664, 7.629395E-6, -36.84981))
  L10_17 = setupLocator
  L11_18 = "locator2_move_2"
  L12_19 = Vector
  L12_19 = L12_19(-16.18552, 0, -28.27652)
  L10_17(L11_18, L12_19, L12_19(-16.18552, 0, -28.27652))
  L10_17 = setupLocator
  L11_18 = "locator2_move_3"
  L12_19 = Vector
  L12_19 = L12_19(6.48328, 0, -48.39446)
  L10_17(L11_18, L12_19, L12_19(6.48328, 0, -48.39446))
  L10_17 = findGameObject2
  L11_18 = "EnemyBrain"
  L12_19 = "enemyAI"
  L10_17 = L10_17(L11_18, L12_19)
  repeat
    L11_18 = wait
    L11_18()
    L12_19 = L10_17
    L11_18 = L10_17.isReadyEnemy
    L11_18 = L11_18(L12_19)
  until L11_18
  L12_19 = L10_17
  L11_18 = L10_17.playMotion
  L11_18(L12_19, "phi01_fee_00")
  repeat
    L11_18 = wait
    L11_18()
    L12_19 = L10_17
    L11_18 = L10_17.isMotionEnd
    L11_18 = L11_18(L12_19)
  until L11_18
  L12_19 = L10_17
  L11_18 = L10_17.endScriptAction
  L11_18(L12_19)
  L11_18 = "pccubesensor2_test_OnEnter"
  L12_19 = "pccubesensor2_test_OnLeave"
  _G[L11_18] = function()
    print("onEnter")
  end
  _G[L12_19] = function()
    print("onLeave")
  end
  sensor_hdl = createGameObject2("Sensor")
  sensor_hdl:setName("cubesensor2_test")
  sensor_hdl:setDetectBehavior(1)
  sensor_hdl:addBox(Vector(5, 5, 5))
  sensor_hdl:setPos(Vector(-14.18552, 0, -28.27652))
  sensor_hdl:setRot(YRotQuaternion(Deg2Rad(40)))
  sensor_hdl:setOnEnter(L11_18)
  sensor_hdl:setOnLeave(L12_19)
  sensor_hdl:setEnableDebugDraw(true)
  sensor_hdl:setFilterType("Puppet")
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(sensor_hdl)
  end
  sensor_hdl:try_init()
  sensor_hdl:waitForReady()
  sensor_hdl:try_start()
  sensor_hdl:setActive(true)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  while true do
    wait()
  end
end
function enemy_base_bg_setup()
  createGameObject2("Area"):setName("test_z_root2")
  createGameObject2("Area"):setSceneParameters("cubemap_03")
  createGameObject2("Area"):setDriftEnable(false)
  createGameObject2("Area"):try_init()
  createGameObject2("Area"):waitForReady()
  createGameObject2("Area"):try_start()
  createGameObject2("Area"):setPos(Vector(0, -2, 0))
end
function setupLocator(A0_20, A1_21)
  local L2_22
  L2_22 = createGameObject2
  L2_22 = L2_22("Node")
  L2_22:setName(A0_20)
  L2_22:setPos(A1_21)
  L2_22:try_init()
  L2_22:waitForReady()
  L2_22:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_22)
  end
end
function enemy_base_model_setup(A0_23, A1_24, A2_25)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_23, A1_24, A2_25))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_26, A1_27, A2_28)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_26, A1_27, A2_28))
end
function localtest_create_enemy_async(A0_29, A1_30, A2_31, A3_32, A4_33, A5_34)
  for _FORV_10_ = 1, A4_33 do
    invokeTask(localtest_create_enemy, A0_29, Vector(A1_30 + math.random() * 6, A2_31, A3_32 + math.random() * 6).x, Vector(A1_30 + math.random() * 6, A2_31, A3_32 + math.random() * 6).y, Vector(A1_30 + math.random() * 6, A2_31, A3_32 + math.random() * 6).z, A5_34)
    Vector(A1_30 + math.random() * 6, A2_31, A3_32 + math.random() * 6).x = Vector(A1_30 + math.random() * 6, A2_31, A3_32 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_35, A1_36, A2_37, A3_38, A4_39)
  local L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48
  L5_40 = print
  L6_41 = "x "
  L7_42 = A1_36
  L6_41 = L6_41 .. L7_42
  L5_40(L6_41)
  L5_40 = print
  L6_41 = "y "
  L7_42 = A2_37
  L6_41 = L6_41 .. L7_42
  L5_40(L6_41)
  L5_40 = print
  L6_41 = "z "
  L7_42 = A3_38
  L6_41 = L6_41 .. L7_42
  L5_40(L6_41)
  L5_40 = print
  L6_41 = "classification "
  L7_42 = A4_39
  L6_41 = L6_41 .. L7_42
  L5_40(L6_41)
  L5_40 = "enemyA"
  L6_41 = loadFileAsset
  L7_42 = "evd"
  L8_43 = "CharDefs/"
  L9_44 = A4_39
  L8_43 = L8_43 .. L9_44
  L6_41 = L6_41(L7_42, L8_43)
  L7_42 = loadFileAsset
  L8_43 = "evd"
  L9_44 = "CharDefs/"
  L10_45 = A4_39
  L11_46 = "_exported_brain"
  L9_44 = L9_44 .. L10_45 .. L11_46
  L7_42 = L7_42(L8_43, L9_44)
  L9_44 = L6_41
  L8_43 = L6_41.wait
  L8_43(L9_44)
  L9_44 = L7_42
  L8_43 = L7_42.wait
  L8_43(L9_44)
  L8_43 = createGameObject2
  L9_44 = "Puppet"
  L8_43 = L8_43(L9_44)
  L10_45 = L8_43
  L9_44 = L8_43.setEnableDebugDraw
  L11_46 = true
  L9_44(L10_45, L11_46)
  L10_45 = L8_43
  L9_44 = L8_43.setName
  L11_46 = L5_40
  L9_44(L10_45, L11_46)
  L10_45 = L8_43
  L9_44 = L8_43.setDescription
  L12_47 = L6_41
  L11_46 = L6_41.getRoot
  L13_48 = L11_46(L12_47)
  L9_44(L10_45, L11_46, L12_47, L13_48, L11_46(L12_47))
  L10_45 = L8_43
  L9_44 = L8_43.setPos
  L11_46 = Vector
  L12_47 = A1_36
  L13_48 = A2_37
  L13_48 = L11_46(L12_47, L13_48, A3_38)
  L9_44(L10_45, L11_46, L12_47, L13_48, L11_46(L12_47, L13_48, A3_38))
  L10_45 = L8_43
  L9_44 = L8_43.setRot
  L11_46 = YRotQuaternion
  L12_47 = Deg2Rad
  L13_48 = 90
  L13_48 = L12_47(L13_48)
  L13_48 = L11_46(L12_47, L13_48, L12_47(L13_48))
  L9_44(L10_45, L11_46, L12_47, L13_48, L11_46(L12_47, L13_48, L12_47(L13_48)))
  L10_45 = L8_43
  L9_44 = L8_43.registerIntoGroup
  L11_46 = "enemy"
  L9_44(L10_45, L11_46)
  L10_45 = L8_43
  L9_44 = L8_43.setVisible
  L11_46 = false
  L9_44(L10_45, L11_46)
  L9_44 = createGameObject2
  L10_45 = "EnemyBrain"
  L9_44 = L9_44(L10_45)
  L11_46 = L9_44
  L10_45 = L9_44.setEnableDebugDraw
  L12_47 = true
  L10_45(L11_46, L12_47)
  L11_46 = L9_44
  L10_45 = L9_44.setName
  L12_47 = "enemyAI"
  L10_45(L11_46, L12_47)
  L11_46 = L9_44
  L10_45 = L9_44.setDescription
  L13_48 = L7_42
  L12_47 = L7_42.getRoot
  L13_48 = L12_47(L13_48)
  L10_45(L11_46, L12_47, L13_48, L12_47(L13_48))
  L11_46 = L8_43
  L10_45 = L8_43.try_init
  L10_45(L11_46)
  L11_46 = L9_44
  L10_45 = L9_44.try_init
  L10_45(L11_46)
  L11_46 = L8_43
  L10_45 = L8_43.waitForReady
  L10_45(L11_46)
  L11_46 = L9_44
  L10_45 = L9_44.waitForReady
  L10_45(L11_46)
  L11_46 = L8_43
  L10_45 = L8_43.try_start
  L10_45(L11_46)
  L11_46 = L9_44
  L10_45 = L9_44.try_start
  L10_45(L11_46)
  while true do
    L11_46 = L8_43
    L10_45 = L8_43.isLoading
    L10_45 = L10_45(L11_46)
    if L10_45 then
      L10_45 = wait
      L10_45()
    end
  end
  L11_46 = L8_43
  L10_45 = L8_43.setBrain
  L12_47 = L9_44
  L10_45(L11_46, L12_47)
  L11_46 = L8_43
  L10_45 = L8_43.setVisible
  L12_47 = true
  L10_45(L11_46, L12_47)
  if A0_35 then
    L10_45 = loadFileAsset
    L11_46 = "evd"
    L12_47 = "CharDefs/enemy/soldier/officer_rifle"
    L10_45 = L10_45(L11_46, L12_47)
    L11_46 = loadFileAsset
    L12_47 = "evd"
    L13_48 = "CharDefs/enemy/soldier/officer_rifle_exported_brain"
    L11_46 = L11_46(L12_47, L13_48)
    L13_48 = L10_45
    L12_47 = L10_45.wait
    L12_47(L13_48)
    L13_48 = L11_46
    L12_47 = L11_46.wait
    L12_47(L13_48)
    L12_47 = createGameObject2
    L13_48 = "Puppet"
    L12_47 = L12_47(L13_48)
    L13_48 = L12_47.setName
    L13_48(L12_47, "pilot01")
    L13_48 = L12_47.setDescription
    L13_48(L12_47, L10_45:getRoot())
    L13_48 = L12_47.setPos
    L13_48(L12_47, Vector(A1_36, A2_37, A3_38))
    L13_48 = L12_47.setRot
    L13_48(L12_47, YRotQuaternion(Deg2Rad(90)))
    L13_48 = L12_47.registerIntoGroup
    L13_48(L12_47, "enemy")
    L13_48 = L12_47.setVisible
    L13_48(L12_47, true)
    L13_48 = createGameObject2
    L13_48 = L13_48("EnemyBrain")
    L13_48:setEnableDebugDraw(true)
    L13_48:setName("enemyAI")
    L13_48:setDescription(L11_46:getRoot())
    L12_47:try_init()
    L13_48:try_init()
    L12_47:waitForReady()
    L13_48:waitForReady()
    L12_47:try_start()
    L13_48:try_start()
    while L12_47:isLoading() do
      wait()
    end
    L12_47:setBrain(L13_48)
    L9_44:setPilot(L12_47)
  end
end
