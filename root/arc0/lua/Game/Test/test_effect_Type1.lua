import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
import("Player")
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
function main()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17
  L0_7 = HUD
  L1_8 = L0_7
  L0_7 = L0_7.menuOpen
  L2_9 = "Main"
  L0_7(L1_8, L2_9)
  L0_7 = Vector
  L1_8 = -3
  L2_9 = 0
  L3_10 = 0
  L0_7 = L0_7(L1_8, L2_9, L3_10)
  L1_8 = Vector
  L2_9 = -5
  L3_10 = 2
  L4_11 = 50.6
  L1_8 = L1_8(L2_9, L3_10, L4_11)
  L2_9 = Vector
  L3_10 = -5
  L4_11 = 4
  L5_12 = 17.6
  L2_9 = L2_9(L3_10, L4_11, L5_12)
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
  L4_11 = LayoutPosYaw
  L5_12 = L0_7
  L6_13 = Deg2Rad
  L7_14 = 90
  L10_17 = L6_13(L7_14)
  L4_11 = L4_11(L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L6_13(L7_14))
  L5_12 = DebugStage
  L6_13 = L5_12
  L5_12 = L5_12.createTestPlayer
  L7_14 = L0_7
  L8_15 = YRotQuaternion
  L9_16 = Deg2Rad
  L10_17 = 90
  L10_17 = L9_16(L10_17)
  L10_17 = L8_15(L9_16, L10_17, L9_16(L10_17))
  L5_12 = L5_12(L6_13, L7_14, L8_15, L9_16, L10_17, L8_15(L9_16, L10_17, L9_16(L10_17)))
  L6_13 = Player
  L7_14 = L6_13
  L6_13 = L6_13.setEnergy
  L8_15 = Player
  L8_15 = L8_15.kEnergy_Life
  L9_16 = Player
  L10_17 = L9_16
  L9_16 = L9_16.getEnergyMax
  L10_17 = L9_16(L10_17, Player.kEnergy_Life)
  L6_13(L7_14, L8_15, L9_16, L10_17, L9_16(L10_17, Player.kEnergy_Life))
  L6_13 = Player
  L7_14 = L6_13
  L6_13 = L6_13.setEnergy
  L8_15 = Player
  L8_15 = L8_15.kEnergy_Gravity
  L9_16 = Player
  L10_17 = L9_16
  L9_16 = L9_16.getEnergyMax
  L10_17 = L9_16(L10_17, Player.kEnergy_Gravity)
  L6_13(L7_14, L8_15, L9_16, L10_17, L9_16(L10_17, Player.kEnergy_Gravity))
  L6_13 = Player
  L7_14 = L6_13
  L6_13 = L6_13.setEnergy
  L8_15 = Player
  L8_15 = L8_15.kEnergy_SpAttack
  L9_16 = Player
  L10_17 = L9_16
  L9_16 = L9_16.getEnergyMax
  L10_17 = L9_16(L10_17, Player.kEnergy_SpAttack)
  L6_13(L7_14, L8_15, L9_16, L10_17, L9_16(L10_17, Player.kEnergy_SpAttack))
  L6_13 = print
  L7_14 = "init all"
  L6_13(L7_14)
  L6_13 = initializeAllGameObjects
  L6_13()
  L6_13 = print
  L7_14 = "wait ready all"
  L6_13(L7_14)
  L6_13 = waitForReadyAllGameObjects
  L6_13()
  L6_13 = print
  L7_14 = "start all"
  L6_13(L7_14)
  L6_13 = startAllGameObjects
  L6_13()
  L6_13 = Vector
  L7_14 = 6
  L8_15 = 0
  L9_16 = 6
  L6_13 = L6_13(L7_14, L8_15, L9_16)
  L7_14 = Vector
  L8_15 = -12
  L9_16 = 3.65
  L10_17 = 17.6
  L7_14 = L7_14(L8_15, L9_16, L10_17)
  L8_15 = HUD
  L9_16 = L8_15
  L8_15 = L8_15.hpgDispReq_FadeIn
  L8_15(L9_16)
  L8_15 = HUD
  L9_16 = L8_15
  L8_15 = L8_15.grgDispReq_FadeIn
  L8_15(L9_16)
  L8_15 = Vector
  L9_16 = 0
  L10_17 = 10
  L8_15 = L8_15(L9_16, L10_17, 0)
  L9_16 = "pccubesensor2_test_OnEnter"
  L10_17 = "pccubesensor2_test_OnLeave"
  _G[L9_16] = function()
    print("onEnter")
  end
  _G[L10_17] = function()
    print("onLeave")
  end
  sensor_hdl = createGameObject2("Sensor")
  sensor_hdl:setName("pccubesensor2_test")
  sensor_hdl:setDetectBehavior(1)
  sensor_hdl:addBox(Vector(10.5, 21.5, 10.5))
  sensor_hdl:setPos(Vector(-14.18234, 0.7217345, 4.89168))
  sensor_hdl:setRot(YRotQuaternion(Deg2Rad(40)))
  sensor_hdl:setOnEnter(L9_16)
  sensor_hdl:setOnLeave(L10_17)
  sensor_hdl:try_init()
  sensor_hdl:waitForReady()
  sensor_hdl:try_start()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "ParticleFX",
    "Display",
    "Particle Count(According to Calculation)"
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
  createGameObject2("Area"):setPos(Vector(0, -0.01, -30))
end
function enemy_base_model_setup(A0_18, A1_19, A2_20)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_18, A1_19, A2_20))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_21, A1_22, A2_23)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_21, A1_22, A2_23))
end
function localtest_create_enemy_async(A0_24, A1_25, A2_26, A3_27, A4_28, A5_29)
  for _FORV_10_ = 1, A4_28 do
    invokeTask(localtest_create_enemy, A0_24, Vector(A1_25 + math.random() * 6, A2_26, A3_27 + math.random() * 6).x, Vector(A1_25 + math.random() * 6, A2_26, A3_27 + math.random() * 6).y, Vector(A1_25 + math.random() * 6, A2_26, A3_27 + math.random() * 6).z, A5_29)
    Vector(A1_25 + math.random() * 6, A2_26, A3_27 + math.random() * 6).x = Vector(A1_25 + math.random() * 6, A2_26, A3_27 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_30, A1_31, A2_32, A3_33, A4_34)
  local L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42
  L5_35 = print
  L6_36 = "x "
  L7_37 = A1_31
  L6_36 = L6_36 .. L7_37
  L5_35(L6_36)
  L5_35 = print
  L6_36 = "y "
  L7_37 = A2_32
  L6_36 = L6_36 .. L7_37
  L5_35(L6_36)
  L5_35 = print
  L6_36 = "z "
  L7_37 = A3_33
  L6_36 = L6_36 .. L7_37
  L5_35(L6_36)
  L5_35 = print
  L6_36 = "classification "
  L7_37 = A4_34
  L6_36 = L6_36 .. L7_37
  L5_35(L6_36)
  L5_35 = "enemyA"
  L6_36 = createGameObject2
  L7_37 = "Puppet"
  L6_36 = L6_36(L7_37)
  L8_38 = L6_36
  L7_37 = L6_36.setEnableDebugDraw
  L9_39 = true
  L7_37(L8_38, L9_39)
  L8_38 = L6_36
  L7_37 = L6_36.setName
  L9_39 = L5_35
  L7_37(L8_38, L9_39)
  L7_37 = loadFileAsset
  L8_38 = "evd"
  L9_39 = "CharDefs/"
  L10_40 = A4_34
  L9_39 = L9_39 .. L10_40
  L7_37 = L7_37(L8_38, L9_39)
  L9_39 = L7_37
  L8_38 = L7_37.wait
  L8_38(L9_39)
  L9_39 = L6_36
  L8_38 = L6_36.setDescription
  L11_41 = L7_37
  L10_40 = L7_37.getRoot
  L12_42 = L10_40(L11_41)
  L8_38(L9_39, L10_40, L11_41, L12_42, L10_40(L11_41))
  L9_39 = L6_36
  L8_38 = L6_36.setPos
  L10_40 = Vector
  L11_41 = A1_31
  L12_42 = A2_32
  L12_42 = L10_40(L11_41, L12_42, A3_33)
  L8_38(L9_39, L10_40, L11_41, L12_42, L10_40(L11_41, L12_42, A3_33))
  L9_39 = L6_36
  L8_38 = L6_36.setRot
  L10_40 = YRotQuaternion
  L11_41 = Deg2Rad
  L12_42 = 90
  L12_42 = L11_41(L12_42)
  L12_42 = L10_40(L11_41, L12_42, L11_41(L12_42))
  L8_38(L9_39, L10_40, L11_41, L12_42, L10_40(L11_41, L12_42, L11_41(L12_42)))
  L9_39 = L6_36
  L8_38 = L6_36.registerIntoGroup
  L10_40 = "enemy"
  L8_38(L9_39, L10_40)
  L9_39 = L6_36
  L8_38 = L6_36.setVisible
  L10_40 = false
  L8_38(L9_39, L10_40)
  L8_38 = createGameObject2
  L9_39 = "EnemyBrain"
  L8_38 = L8_38(L9_39)
  L10_40 = L8_38
  L9_39 = L8_38.setEnableDebugDraw
  L11_41 = true
  L9_39(L10_40, L11_41)
  L10_40 = L8_38
  L9_39 = L8_38.setName
  L11_41 = "enemyAI"
  L9_39(L10_40, L11_41)
  L9_39 = loadFileAsset
  L10_40 = "evd"
  L11_41 = "CharDefs/"
  L12_42 = A4_34
  L11_41 = L11_41 .. L12_42 .. "_exported_brain"
  L9_39 = L9_39(L10_40, L11_41)
  L11_41 = L6_36
  L10_40 = L6_36.try_init
  L10_40(L11_41)
  L11_41 = L8_38
  L10_40 = L8_38.try_init
  L10_40(L11_41)
  L11_41 = L6_36
  L10_40 = L6_36.waitForReady
  L10_40(L11_41)
  L11_41 = L8_38
  L10_40 = L8_38.waitForReady
  L10_40(L11_41)
  L11_41 = L6_36
  L10_40 = L6_36.try_start
  L10_40(L11_41)
  L11_41 = L8_38
  L10_40 = L8_38.try_start
  L10_40(L11_41)
  while true do
    L11_41 = L6_36
    L10_40 = L6_36.isLoading
    L10_40 = L10_40(L11_41)
    if L10_40 then
      L10_40 = wait
      L10_40()
    end
  end
  L11_41 = L9_39
  L10_40 = L9_39.wait
  L10_40(L11_41)
  L11_41 = L8_38
  L10_40 = L8_38.setDescription
  L12_42 = L9_39.getRoot
  L12_42 = L12_42(L9_39)
  L10_40(L11_41, L12_42, L12_42(L9_39))
  L11_41 = L6_36
  L10_40 = L6_36.setBrain
  L12_42 = L8_38
  L10_40(L11_41, L12_42)
  if A0_30 then
    L10_40 = createGameObject2
    L11_41 = "Puppet"
    L10_40 = L10_40(L11_41)
    L12_42 = L10_40
    L11_41 = L10_40.setName
    L11_41(L12_42, "pilot01")
    L11_41 = loadFileAsset
    L12_42 = "evd"
    L11_41 = L11_41(L12_42, "CharDefs/enemy/soldier/officer_rifle")
    L12_42 = L11_41.wait
    L12_42(L11_41)
    L12_42 = L10_40.setDescription
    L12_42(L10_40, L11_41:getRoot())
    L12_42 = L10_40.setPos
    L12_42(L10_40, Vector(A1_31, A2_32, A3_33))
    L12_42 = L10_40.setRot
    L12_42(L10_40, YRotQuaternion(Deg2Rad(90)))
    L12_42 = L10_40.registerIntoGroup
    L12_42(L10_40, "enemy")
    L12_42 = L10_40.setVisible
    L12_42(L10_40, true)
    L12_42 = createGameObject2
    L12_42 = L12_42("EnemyBrain")
    L12_42:setEnableDebugDraw(true)
    L12_42:setName("enemyAI")
    L10_40:try_init()
    L12_42:try_init()
    L10_40:waitForReady()
    L12_42:waitForReady()
    L10_40:try_start()
    L12_42:try_start()
    loadFileAsset("evd", "CharDefs/enemy/soldier/officer_rifle_exported_brain"):wait()
    L12_42:setDescription(loadFileAsset("evd", "CharDefs/enemy/soldier/officer_rifle_exported_brain"):getRoot())
    L10_40:setBrain(L12_42)
    L8_38:setPilot(L10_40)
  end
  L11_41 = L6_36
  L10_40 = L6_36.setVisible
  L12_42 = true
  L10_40(L11_41, L12_42)
  L11_41 = L8_38
  L10_40 = L8_38.reset
  L12_42 = Vector
  L12_42 = L12_42(0, 10, 0)
  L10_40(L11_41, L12_42, YRotQuaternion(Deg2Rad(90)))
end
