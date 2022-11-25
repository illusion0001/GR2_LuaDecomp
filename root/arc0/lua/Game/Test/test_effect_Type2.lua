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
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15
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
  L4_11 = Vector
  L5_12 = 6
  L6_13 = 0
  L7_14 = 6
  L4_11 = L4_11(L5_12, L6_13, L7_14)
  L5_12 = Vector
  L6_13 = -12
  L7_14 = 3.65
  L8_15 = 17.6
  L5_12 = L5_12(L6_13, L7_14, L8_15)
  L6_13 = HUD
  L7_14 = L6_13
  L6_13 = L6_13.hpgDispReq_FadeIn
  L6_13(L7_14)
  L6_13 = HUD
  L7_14 = L6_13
  L6_13 = L6_13.grgDispReq_FadeIn
  L6_13(L7_14)
  L6_13 = Vector
  L7_14 = 0
  L8_15 = 10
  L6_13 = L6_13(L7_14, L8_15, 0)
  L7_14 = "pccubesensor2_test_OnEnter"
  L8_15 = "pccubesensor2_test_OnLeave"
  _G[L7_14] = function()
    print("onEnter")
  end
  _G[L8_15] = function()
    print("onLeave")
  end
  sensor_hdl = createGameObject2("Sensor")
  sensor_hdl:setName("pccubesensor2_test")
  sensor_hdl:setDetectBehavior(1)
  sensor_hdl:addBox(Vector(10.5, 21.5, 10.5))
  sensor_hdl:setPos(Vector(-14.18234, 0.7217345, 4.89168))
  sensor_hdl:setRot(YRotQuaternion(Deg2Rad(40)))
  sensor_hdl:setOnEnter(L7_14)
  sensor_hdl:setOnLeave(L8_15)
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
  Debug:setEnableDebugCamera(true)
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
  createGameObject2("Area"):setName("test_sakai")
  createGameObject2("Area"):setSceneParameters("cubemap_03")
  createGameObject2("Area"):setDriftEnable(false)
  createGameObject2("Area"):try_init()
  createGameObject2("Area"):waitForReady()
  createGameObject2("Area"):try_start()
  createGameObject2("Area"):setPos(Vector(0, -0.01, -30))
end
function enemy_base_model_setup(A0_16, A1_17, A2_18)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_16, A1_17, A2_18))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_19, A1_20, A2_21)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_19, A1_20, A2_21))
end
function localtest_create_enemy_async(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27)
  for _FORV_10_ = 1, A4_26 do
    invokeTask(localtest_create_enemy, A0_22, Vector(A1_23 + math.random() * 6, A2_24, A3_25 + math.random() * 6).x, Vector(A1_23 + math.random() * 6, A2_24, A3_25 + math.random() * 6).y, Vector(A1_23 + math.random() * 6, A2_24, A3_25 + math.random() * 6).z, A5_27)
    Vector(A1_23 + math.random() * 6, A2_24, A3_25 + math.random() * 6).x = Vector(A1_23 + math.random() * 6, A2_24, A3_25 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_28, A1_29, A2_30, A3_31, A4_32)
  local L5_33, L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40
  L5_33 = print
  L6_34 = "x "
  L7_35 = A1_29
  L6_34 = L6_34 .. L7_35
  L5_33(L6_34)
  L5_33 = print
  L6_34 = "y "
  L7_35 = A2_30
  L6_34 = L6_34 .. L7_35
  L5_33(L6_34)
  L5_33 = print
  L6_34 = "z "
  L7_35 = A3_31
  L6_34 = L6_34 .. L7_35
  L5_33(L6_34)
  L5_33 = print
  L6_34 = "classification "
  L7_35 = A4_32
  L6_34 = L6_34 .. L7_35
  L5_33(L6_34)
  L5_33 = "enemyA"
  L6_34 = createGameObject2
  L7_35 = "Puppet"
  L6_34 = L6_34(L7_35)
  L8_36 = L6_34
  L7_35 = L6_34.setEnableDebugDraw
  L9_37 = true
  L7_35(L8_36, L9_37)
  L8_36 = L6_34
  L7_35 = L6_34.setName
  L9_37 = L5_33
  L7_35(L8_36, L9_37)
  L7_35 = loadFileAsset
  L8_36 = "evd"
  L9_37 = "CharDefs/"
  L10_38 = A4_32
  L9_37 = L9_37 .. L10_38
  L7_35 = L7_35(L8_36, L9_37)
  L9_37 = L7_35
  L8_36 = L7_35.wait
  L8_36(L9_37)
  L9_37 = L6_34
  L8_36 = L6_34.setDescription
  L11_39 = L7_35
  L10_38 = L7_35.getRoot
  L12_40 = L10_38(L11_39)
  L8_36(L9_37, L10_38, L11_39, L12_40, L10_38(L11_39))
  L9_37 = L6_34
  L8_36 = L6_34.setPos
  L10_38 = Vector
  L11_39 = A1_29
  L12_40 = A2_30
  L12_40 = L10_38(L11_39, L12_40, A3_31)
  L8_36(L9_37, L10_38, L11_39, L12_40, L10_38(L11_39, L12_40, A3_31))
  L9_37 = L6_34
  L8_36 = L6_34.setRot
  L10_38 = YRotQuaternion
  L11_39 = Deg2Rad
  L12_40 = 90
  L12_40 = L11_39(L12_40)
  L12_40 = L10_38(L11_39, L12_40, L11_39(L12_40))
  L8_36(L9_37, L10_38, L11_39, L12_40, L10_38(L11_39, L12_40, L11_39(L12_40)))
  L9_37 = L6_34
  L8_36 = L6_34.registerIntoGroup
  L10_38 = "enemy"
  L8_36(L9_37, L10_38)
  L9_37 = L6_34
  L8_36 = L6_34.setVisible
  L10_38 = false
  L8_36(L9_37, L10_38)
  L8_36 = createGameObject2
  L9_37 = "EnemyBrain"
  L8_36 = L8_36(L9_37)
  L10_38 = L8_36
  L9_37 = L8_36.setEnableDebugDraw
  L11_39 = true
  L9_37(L10_38, L11_39)
  L10_38 = L8_36
  L9_37 = L8_36.setName
  L11_39 = "enemyAI"
  L9_37(L10_38, L11_39)
  L9_37 = loadFileAsset
  L10_38 = "evd"
  L11_39 = "CharDefs/"
  L12_40 = A4_32
  L11_39 = L11_39 .. L12_40 .. "_exported_brain"
  L9_37 = L9_37(L10_38, L11_39)
  L11_39 = L6_34
  L10_38 = L6_34.try_init
  L10_38(L11_39)
  L11_39 = L8_36
  L10_38 = L8_36.try_init
  L10_38(L11_39)
  L11_39 = L6_34
  L10_38 = L6_34.waitForReady
  L10_38(L11_39)
  L11_39 = L8_36
  L10_38 = L8_36.waitForReady
  L10_38(L11_39)
  L11_39 = L6_34
  L10_38 = L6_34.try_start
  L10_38(L11_39)
  L11_39 = L8_36
  L10_38 = L8_36.try_start
  L10_38(L11_39)
  while true do
    L11_39 = L6_34
    L10_38 = L6_34.isLoading
    L10_38 = L10_38(L11_39)
    if L10_38 then
      L10_38 = wait
      L10_38()
    end
  end
  L11_39 = L9_37
  L10_38 = L9_37.wait
  L10_38(L11_39)
  L11_39 = L8_36
  L10_38 = L8_36.setDescription
  L12_40 = L9_37.getRoot
  L12_40 = L12_40(L9_37)
  L10_38(L11_39, L12_40, L12_40(L9_37))
  L11_39 = L6_34
  L10_38 = L6_34.setBrain
  L12_40 = L8_36
  L10_38(L11_39, L12_40)
  if A0_28 then
    L10_38 = createGameObject2
    L11_39 = "Puppet"
    L10_38 = L10_38(L11_39)
    L12_40 = L10_38
    L11_39 = L10_38.setName
    L11_39(L12_40, "pilot01")
    L11_39 = loadFileAsset
    L12_40 = "evd"
    L11_39 = L11_39(L12_40, "CharDefs/enemy/soldier/officer_rifle")
    L12_40 = L11_39.wait
    L12_40(L11_39)
    L12_40 = L10_38.setDescription
    L12_40(L10_38, L11_39:getRoot())
    L12_40 = L10_38.setPos
    L12_40(L10_38, Vector(A1_29, A2_30, A3_31))
    L12_40 = L10_38.setRot
    L12_40(L10_38, YRotQuaternion(Deg2Rad(90)))
    L12_40 = L10_38.registerIntoGroup
    L12_40(L10_38, "enemy")
    L12_40 = L10_38.setVisible
    L12_40(L10_38, true)
    L12_40 = createGameObject2
    L12_40 = L12_40("EnemyBrain")
    L12_40:setEnableDebugDraw(true)
    L12_40:setName("enemyAI")
    L10_38:try_init()
    L12_40:try_init()
    L10_38:waitForReady()
    L12_40:waitForReady()
    L10_38:try_start()
    L12_40:try_start()
    loadFileAsset("evd", "CharDefs/enemy/soldier/officer_rifle_exported_brain"):wait()
    L12_40:setDescription(loadFileAsset("evd", "CharDefs/enemy/soldier/officer_rifle_exported_brain"):getRoot())
    L10_38:setBrain(L12_40)
    L8_36:setPilot(L10_38)
  end
  L11_39 = L6_34
  L10_38 = L6_34.setVisible
  L12_40 = true
  L10_38(L11_39, L12_40)
  L11_39 = L8_36
  L10_38 = L8_36.reset
  L12_40 = Vector
  L12_40 = L12_40(0, 10, 0)
  L10_38(L11_39, L12_40, YRotQuaternion(Deg2Rad(90)))
end
