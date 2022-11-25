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
function put_gimmick(A0_0, A1_1, A2_2)
  createGameObject2("GimmickBg"):setName(A2_2)
  createGameObject2("GimmickBg"):setDrawModelName(A1_1)
  createGameObject2("GimmickBg"):setCollisionName(A1_1)
  createGameObject2("GimmickBg"):setAttributeName(A1_1)
  createGameObject2("GimmickBg"):setPos(A0_0)
  createGameObject2("GimmickBg"):setAutoRestore(5)
  return (createGameObject2("GimmickBg"))
end
function put_barrel(A0_3)
  return put_gimmickbg(A0_3, "barrel_kk_01")
end
function enemy_simple_base_model_setup(A0_4, A1_5)
  createGameObject2("GimmickBg"):setDrawModelName(A1_5)
  createGameObject2("GimmickBg"):setPos(A0_4)
  createGameObject2("GimmickBg"):setName(A1_5)
  createGameObject2("GimmickBg"):setScale(0.001)
  createGameObject2("GimmickBg"):try_init()
  while not createGameObject2("GimmickBg"):isReady() do
    wait()
  end
  createGameObject2("GimmickBg"):try_start()
  print(A1_5)
end
function enemy_simple_base_model_setup_async(A0_6, A1_7)
  invokeTask(enemy_simple_base_model_setup, A0_6, A1_7)
end
function exitSandbox()
  Sound:unloadResource("enemy_se_hex")
  Sound:unloadResource("enemy_se_jir")
end
setExitCallback(exitSandbox)
function main()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17
  L0_8 = Vector
  L1_9 = -5.614086
  L2_10 = -1.999998
  L3_11 = 31.22108
  L0_8 = L0_8(L1_9, L2_10, L3_11)
  L1_9 = Vector
  L2_10 = -5
  L3_11 = 2
  L4_12 = 50.6
  L1_9 = L1_9(L2_10, L3_11, L4_12)
  L2_10 = Vector
  L3_11 = -5
  L4_12 = 0
  L5_13 = 47.6
  L2_10 = L2_10(L3_11, L4_12, L5_13)
  L3_11 = Sound
  L4_12 = L3_11
  L3_11 = L3_11.loadResource
  L5_13 = "enemy_se_hex"
  L3_11(L4_12, L5_13)
  L3_11 = Sound
  L4_12 = L3_11
  L3_11 = L3_11.loadResource
  L5_13 = "enemy_se_jir"
  L3_11(L4_12, L5_13)
  L3_11 = enemy_base_bg_setup
  L3_11()
  L3_11 = Vector
  L4_12 = -15
  L5_13 = 0.6
  L6_14 = 14.6
  L3_11 = L3_11(L4_12, L5_13, L6_14)
  L4_12 = print
  L5_13 = "init all"
  L4_12(L5_13)
  L4_12 = initializeAllGameObjects
  L4_12()
  L4_12 = print
  L5_13 = "wait ready all"
  L4_12(L5_13)
  L4_12 = waitForReadyAllGameObjects
  L4_12()
  L4_12 = print
  L5_13 = "start all"
  L4_12(L5_13)
  L4_12 = startAllGameObjects
  L4_12()
  L4_12 = DebugStage
  L5_13 = L4_12
  L4_12 = L4_12.createTestPlayer
  L6_14 = L0_8
  L7_15 = YRotQuaternion
  L8_16 = Deg2Rad
  L9_17 = 0
  L9_17 = L8_16(L9_17)
  L9_17 = L7_15(L8_16, L9_17, L8_16(L9_17))
  L4_12 = L4_12(L5_13, L6_14, L7_15, L8_16, L9_17, L7_15(L8_16, L9_17, L8_16(L9_17)))
  L5_13 = print
  L6_14 = "init all"
  L5_13(L6_14)
  L5_13 = initializeAllGameObjects
  L5_13()
  L5_13 = print
  L6_14 = "wait ready all"
  L5_13(L6_14)
  L5_13 = waitForReadyAllGameObjects
  L5_13()
  L5_13 = print
  L6_14 = "start all"
  L5_13(L6_14)
  L5_13 = startAllGameObjects
  L5_13()
  L5_13 = Player
  L6_14 = L5_13
  L5_13 = L5_13.setEnergy
  L7_15 = Player
  L7_15 = L7_15.kEnergy_Life
  L8_16 = Player
  L9_17 = L8_16
  L8_16 = L8_16.getEnergyMax
  L9_17 = L8_16(L9_17, Player.kEnergy_Life)
  L5_13(L6_14, L7_15, L8_16, L9_17, L8_16(L9_17, Player.kEnergy_Life))
  L5_13 = Player
  L6_14 = L5_13
  L5_13 = L5_13.setEnergy
  L7_15 = Player
  L7_15 = L7_15.kEnergy_Gravity
  L8_16 = Player
  L9_17 = L8_16
  L8_16 = L8_16.getEnergyMax
  L9_17 = L8_16(L9_17, Player.kEnergy_Gravity)
  L5_13(L6_14, L7_15, L8_16, L9_17, L8_16(L9_17, Player.kEnergy_Gravity))
  L5_13 = Player
  L6_14 = L5_13
  L5_13 = L5_13.setEnergy
  L7_15 = Player
  L7_15 = L7_15.kEnergy_SpAttack
  L8_16 = Player
  L9_17 = L8_16
  L8_16 = L8_16.getEnergyMax
  L9_17 = L8_16(L9_17, Player.kEnergy_SpAttack)
  L5_13(L6_14, L7_15, L8_16, L9_17, L8_16(L9_17, Player.kEnergy_SpAttack))
  L5_13 = Vector
  L6_14 = 6
  L7_15 = 0
  L8_16 = 6
  L5_13 = L5_13(L6_14, L7_15, L8_16)
  L6_14 = Vector
  L7_15 = -12
  L8_16 = 3.65
  L9_17 = 17.6
  L6_14 = L6_14(L7_15, L8_16, L9_17)
  L7_15 = HUD
  L8_16 = L7_15
  L7_15 = L7_15.hpgDispReq_FadeIn
  L7_15(L8_16)
  L7_15 = HUD
  L8_16 = L7_15
  L7_15 = L7_15.grgDispReq_FadeIn
  L7_15(L8_16)
  L7_15 = HUD
  L8_16 = L7_15
  L7_15 = L7_15.spgDispReq_FadeIn
  L7_15(L8_16)
  L7_15 = Vector
  L8_16 = 0
  L9_17 = 10
  L7_15 = L7_15(L8_16, L9_17, 0)
  L8_16 = "pccubesensor2_test_OnEnter"
  L9_17 = "pccubesensor2_test_OnLeave"
  _G[L8_16] = function()
    print("onEnter")
  end
  _G[L9_17] = function()
    print("onLeave")
  end
  sensor_hdl = createGameObject2("Sensor")
  sensor_hdl:setName("pccubesensor2_test")
  sensor_hdl:setDetectBehavior(1)
  sensor_hdl:addBox(Vector(10.5, 21.5, 10.5))
  sensor_hdl:setPos(Vector(-14.18234, 0.7217345, 4.89168))
  sensor_hdl:setRot(YRotQuaternion(Deg2Rad(40)))
  sensor_hdl:setOnEnter(L8_16)
  sensor_hdl:setOnLeave(L9_17)
  sensor_hdl:try_init()
  sensor_hdl:waitForReady()
  sensor_hdl:try_start()
  setupLocator("locator2_trijump_step_1", Vector(-8.777044, 0.1, -56.85956))
  setupLocator("locator2_trijump_step_2", Vector(131826, 0.1, -55.98809))
  setupLocator("locator2_trijump_1", Vector(-10.75814, 10.62394, -61.48629))
  setupLocator("locator2_trijump_2", Vector(8.995899, 11.75075, -61.48629))
  setupLocator("locator2_move_1", Vector(12.02664, 7.629395E-6, -36.84981))
  setupLocator("locator2_move_2", Vector(-16.18552, 0, -28.27652))
  setupLocator("locator2_move_3", Vector(6.48328, 0, -48.39446))
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({"Display", "FPS"}, false)
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
    "SpAttackPoint: Infinite"
  }, true)
  while true do
    wait()
    if 0 == 300 and sensor_hdl then
      sensor_hdl:try_term()
      sensor_hdl = nill
    end
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
function setupLocator(A0_18, A1_19)
  local L2_20
  L2_20 = createGameObject2
  L2_20 = L2_20("Node")
  L2_20:setName(A0_18)
  L2_20:setPos(A1_19)
  L2_20:try_init()
  L2_20:waitForReady()
  L2_20:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_20)
  end
end
function enemy_base_model_setup(A0_21, A1_22, A2_23)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_21, A1_22, A2_23))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_24, A1_25, A2_26)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_24, A1_25, A2_26))
end
function localtest_create_enemy_async(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32)
  for _FORV_10_ = 1, A4_31 do
    invokeTask(localtest_create_enemy, A0_27, Vector(A1_28 + math.random() * 6, A2_29, A3_30 + math.random() * 6).x, Vector(A1_28 + math.random() * 6, A2_29, A3_30 + math.random() * 6).y, Vector(A1_28 + math.random() * 6, A2_29, A3_30 + math.random() * 6).z, A5_32)
    Vector(A1_28 + math.random() * 6, A2_29, A3_30 + math.random() * 6).x = Vector(A1_28 + math.random() * 6, A2_29, A3_30 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_33, A1_34, A2_35, A3_36, A4_37)
  local L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46
  L5_38 = print
  L6_39 = "x "
  L7_40 = A1_34
  L6_39 = L6_39 .. L7_40
  L5_38(L6_39)
  L5_38 = print
  L6_39 = "y "
  L7_40 = A2_35
  L6_39 = L6_39 .. L7_40
  L5_38(L6_39)
  L5_38 = print
  L6_39 = "z "
  L7_40 = A3_36
  L6_39 = L6_39 .. L7_40
  L5_38(L6_39)
  L5_38 = print
  L6_39 = "classification "
  L7_40 = A4_37
  L6_39 = L6_39 .. L7_40
  L5_38(L6_39)
  L5_38 = "enemyA"
  L6_39 = loadFileAsset
  L7_40 = "evd"
  L8_41 = "CharDefs/"
  L9_42 = A4_37
  L8_41 = L8_41 .. L9_42
  L6_39 = L6_39(L7_40, L8_41)
  L7_40 = loadFileAsset
  L8_41 = "evd"
  L9_42 = "CharDefs/"
  L10_43 = A4_37
  L11_44 = "_exported_brain"
  L9_42 = L9_42 .. L10_43 .. L11_44
  L7_40 = L7_40(L8_41, L9_42)
  L9_42 = L6_39
  L8_41 = L6_39.wait
  L8_41(L9_42)
  L9_42 = L7_40
  L8_41 = L7_40.wait
  L8_41(L9_42)
  L8_41 = createGameObject2
  L9_42 = "Puppet"
  L8_41 = L8_41(L9_42)
  L10_43 = L8_41
  L9_42 = L8_41.setEnableDebugDraw
  L11_44 = true
  L9_42(L10_43, L11_44)
  L10_43 = L8_41
  L9_42 = L8_41.setName
  L11_44 = L5_38
  L9_42(L10_43, L11_44)
  L10_43 = L8_41
  L9_42 = L8_41.setDescription
  L12_45 = L6_39
  L11_44 = L6_39.getRoot
  L13_46 = L11_44(L12_45)
  L9_42(L10_43, L11_44, L12_45, L13_46, L11_44(L12_45))
  L10_43 = L8_41
  L9_42 = L8_41.setPos
  L11_44 = Vector
  L12_45 = A1_34
  L13_46 = A2_35
  L13_46 = L11_44(L12_45, L13_46, A3_36)
  L9_42(L10_43, L11_44, L12_45, L13_46, L11_44(L12_45, L13_46, A3_36))
  L10_43 = L8_41
  L9_42 = L8_41.setRot
  L11_44 = YRotQuaternion
  L12_45 = Deg2Rad
  L13_46 = 90
  L13_46 = L12_45(L13_46)
  L13_46 = L11_44(L12_45, L13_46, L12_45(L13_46))
  L9_42(L10_43, L11_44, L12_45, L13_46, L11_44(L12_45, L13_46, L12_45(L13_46)))
  L10_43 = L8_41
  L9_42 = L8_41.registerIntoGroup
  L11_44 = "enemy"
  L9_42(L10_43, L11_44)
  L10_43 = L8_41
  L9_42 = L8_41.setVisible
  L11_44 = false
  L9_42(L10_43, L11_44)
  L9_42 = createGameObject2
  L10_43 = "EnemyBrain"
  L9_42 = L9_42(L10_43)
  L11_44 = L9_42
  L10_43 = L9_42.setEnableDebugDraw
  L12_45 = true
  L10_43(L11_44, L12_45)
  L11_44 = L9_42
  L10_43 = L9_42.setName
  L12_45 = "enemyAI"
  L10_43(L11_44, L12_45)
  L11_44 = L9_42
  L10_43 = L9_42.setDescription
  L13_46 = L7_40
  L12_45 = L7_40.getRoot
  L13_46 = L12_45(L13_46)
  L10_43(L11_44, L12_45, L13_46, L12_45(L13_46))
  L11_44 = L8_41
  L10_43 = L8_41.try_init
  L10_43(L11_44)
  L11_44 = L9_42
  L10_43 = L9_42.try_init
  L10_43(L11_44)
  L11_44 = L8_41
  L10_43 = L8_41.waitForReady
  L10_43(L11_44)
  L11_44 = L9_42
  L10_43 = L9_42.waitForReady
  L10_43(L11_44)
  L11_44 = L8_41
  L10_43 = L8_41.try_start
  L10_43(L11_44)
  L11_44 = L9_42
  L10_43 = L9_42.try_start
  L10_43(L11_44)
  while true do
    L11_44 = L8_41
    L10_43 = L8_41.isLoading
    L10_43 = L10_43(L11_44)
    if L10_43 then
      L10_43 = wait
      L10_43()
    end
  end
  L11_44 = L8_41
  L10_43 = L8_41.setBrain
  L12_45 = L9_42
  L10_43(L11_44, L12_45)
  L11_44 = L8_41
  L10_43 = L8_41.setVisible
  L12_45 = true
  L10_43(L11_44, L12_45)
  if A0_33 then
    L10_43 = loadFileAsset
    L11_44 = "evd"
    L12_45 = "CharDefs/enemy/soldier/officer_rifle"
    L10_43 = L10_43(L11_44, L12_45)
    L11_44 = loadFileAsset
    L12_45 = "evd"
    L13_46 = "CharDefs/enemy/soldier/officer_rifle_exported_brain"
    L11_44 = L11_44(L12_45, L13_46)
    L13_46 = L10_43
    L12_45 = L10_43.wait
    L12_45(L13_46)
    L13_46 = L11_44
    L12_45 = L11_44.wait
    L12_45(L13_46)
    L12_45 = createGameObject2
    L13_46 = "Puppet"
    L12_45 = L12_45(L13_46)
    L13_46 = L12_45.setName
    L13_46(L12_45, "pilot01")
    L13_46 = L12_45.setDescription
    L13_46(L12_45, L10_43:getRoot())
    L13_46 = L12_45.setPos
    L13_46(L12_45, Vector(A1_34, A2_35, A3_36))
    L13_46 = L12_45.setRot
    L13_46(L12_45, YRotQuaternion(Deg2Rad(90)))
    L13_46 = L12_45.registerIntoGroup
    L13_46(L12_45, "enemy")
    L13_46 = L12_45.setVisible
    L13_46(L12_45, true)
    L13_46 = createGameObject2
    L13_46 = L13_46("EnemyBrain")
    L13_46:setEnableDebugDraw(true)
    L13_46:setName("enemyAI")
    L13_46:setDescription(L11_44:getRoot())
    L12_45:try_init()
    L13_46:try_init()
    L12_45:waitForReady()
    L13_46:waitForReady()
    L12_45:try_start()
    L13_46:try_start()
    while L12_45:isLoading() do
      wait()
    end
    L12_45:setBrain(L13_46)
    L9_42:setPilot(L12_45)
  end
end
