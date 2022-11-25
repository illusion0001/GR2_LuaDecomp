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
function main()
  local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18
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
  L2_9 = enemy_base_bg_setup
  L2_9()
  L2_9 = Vector
  L3_10 = -15
  L4_11 = 0.6
  L5_12 = 14.6
  L2_9 = L2_9(L3_10, L4_11, L5_12)
  L3_10 = print
  L4_11 = "init all"
  L3_10(L4_11)
  L3_10 = initializeAllGameObjects
  L3_10()
  L3_10 = print
  L4_11 = "wait ready all"
  L3_10(L4_11)
  L3_10 = waitForReadyAllGameObjects
  L3_10()
  L3_10 = print
  L4_11 = "start all"
  L3_10(L4_11)
  L3_10 = startAllGameObjects
  L3_10()
  L3_10 = DebugStage
  L4_11 = L3_10
  L3_10 = L3_10.createTestPlayer
  L5_12 = L0_7
  L6_13 = YRotQuaternion
  L7_14 = Deg2Rad
  L8_15 = 900
  L11_18 = L7_14(L8_15)
  L11_18 = L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L7_14(L8_15))
  L3_10 = L3_10(L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L6_13(L7_14, L8_15, L9_16, L10_17, L11_18, L7_14(L8_15)))
  L4_11 = Player
  L5_12 = L4_11
  L4_11 = L4_11.setEnergy
  L6_13 = Player
  L6_13 = L6_13.kEnergy_Life
  L7_14 = Player
  L8_15 = L7_14
  L7_14 = L7_14.getEnergyMax
  L9_16 = Player
  L9_16 = L9_16.kEnergy_Life
  L11_18 = L7_14(L8_15, L9_16)
  L4_11(L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L7_14(L8_15, L9_16))
  L4_11 = Player
  L5_12 = L4_11
  L4_11 = L4_11.setEnergy
  L6_13 = Player
  L6_13 = L6_13.kEnergy_Gravity
  L7_14 = Player
  L8_15 = L7_14
  L7_14 = L7_14.getEnergyMax
  L9_16 = Player
  L9_16 = L9_16.kEnergy_Gravity
  L11_18 = L7_14(L8_15, L9_16)
  L4_11(L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L7_14(L8_15, L9_16))
  L4_11 = Player
  L5_12 = L4_11
  L4_11 = L4_11.setEnergy
  L6_13 = Player
  L6_13 = L6_13.kEnergy_SpAttack
  L7_14 = Player
  L8_15 = L7_14
  L7_14 = L7_14.getEnergyMax
  L9_16 = Player
  L9_16 = L9_16.kEnergy_SpAttack
  L11_18 = L7_14(L8_15, L9_16)
  L4_11(L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L7_14(L8_15, L9_16))
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
  L5_12 = 0
  L6_13 = 3
  L7_14 = 3
  L4_11 = L4_11(L5_12, L6_13, L7_14)
  L5_12 = XRotQuaternion
  L6_13 = Deg2Rad
  L7_14 = 90
  L11_18 = L6_13(L7_14)
  L5_12 = L5_12(L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L6_13(L7_14))
  L6_13 = localtest_create_enemy_async
  L7_14 = false
  L8_15 = L4_11
  L9_16 = L5_12
  L10_17 = 3
  L11_18 = "enemy/stalker/stalker"
  L6_13(L7_14, L8_15, L9_16, L10_17, L11_18)
  L6_13 = Vector
  L7_14 = 0
  L8_15 = 6
  L9_16 = 0
  L6_13 = L6_13(L7_14, L8_15, L9_16)
  L7_14 = XRotQuaternion
  L8_15 = Deg2Rad
  L9_16 = 180
  L11_18 = L8_15(L9_16)
  L7_14 = L7_14(L8_15, L9_16, L10_17, L11_18, L8_15(L9_16))
  L8_15 = localtest_create_enemy_async
  L9_16 = false
  L10_17 = L6_13
  L11_18 = L7_14
  L8_15(L9_16, L10_17, L11_18, 3, "enemy/stalker/stalker")
  L8_15 = Vector
  L9_16 = 3
  L10_17 = 3
  L11_18 = 0
  L8_15 = L8_15(L9_16, L10_17, L11_18)
  L9_16 = ZRotQuaternion
  L10_17 = Deg2Rad
  L11_18 = 90
  L11_18 = L10_17(L11_18)
  L9_16 = L9_16(L10_17, L11_18, L10_17(L11_18))
  L10_17 = localtest_create_enemy_async
  L11_18 = false
  L10_17(L11_18, L8_15, L9_16, 3, "enemy/stalker/stalker")
  L10_17 = Vector
  L11_18 = -3
  L10_17 = L10_17(L11_18, 3, 0)
  L11_18 = ZRotQuaternion
  L11_18 = L11_18(Deg2Rad(-90))
  localtest_create_enemy_async(false, L10_17, L11_18, 3, "enemy/stalker/stalker")
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
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
function setupLocator(A0_19, A1_20)
  local L2_21
  L2_21 = createGameObject2
  L2_21 = L2_21("Node")
  L2_21:setName(A0_19)
  L2_21:setPos(A1_20)
  L2_21:try_init()
  L2_21:waitForReady()
  L2_21:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_21)
  end
end
function enemy_base_model_setup(A0_22, A1_23, A2_24)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_22, A1_23, A2_24))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_25, A1_26, A2_27)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_25, A1_26, A2_27))
end
function localtest_create_enemy_async(A0_28, A1_29, A2_30, A3_31, A4_32)
  local L5_33, L6_34, L7_35, L8_36, L9_37, L10_38
  L5_33 = Vector
  L5_33 = L5_33(L6_34, L7_35, L8_36)
  for L9_37 = 1, A3_31 do
    L10_38 = Vector
    L10_38 = L10_38(A1_29.x + L5_33.x, A1_29.y + L5_33.y, A1_29.z + L5_33.z)
    print(" " .. L10_38.x .. " " .. L10_38.y .. " " .. L10_38.z)
    invokeTask(localtest_create_enemy, A0_28, L10_38, A2_30, A4_32)
    L5_33.x = L5_33.x + 0.5
    L5_33.z = L5_33.z + 0.5
    L5_33.y = L5_33.y + 0.5
  end
end
function localtest_create_enemy(A0_39, A1_40, A2_41, A3_42)
  local L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51
  L4_43 = print
  L5_44 = "classification "
  L6_45 = A3_42
  L5_44 = L5_44 .. L6_45
  L4_43(L5_44)
  L4_43 = "enemyA"
  L5_44 = loadFileAsset
  L6_45 = "evd"
  L7_46 = "CharDefs/"
  L8_47 = A3_42
  L7_46 = L7_46 .. L8_47
  L5_44 = L5_44(L6_45, L7_46)
  L6_45 = loadFileAsset
  L7_46 = "evd"
  L8_47 = "CharDefs/"
  L9_48 = A3_42
  L10_49 = "_exported_brain"
  L8_47 = L8_47 .. L9_48 .. L10_49
  L6_45 = L6_45(L7_46, L8_47)
  L8_47 = L5_44
  L7_46 = L5_44.wait
  L7_46(L8_47)
  L8_47 = L6_45
  L7_46 = L6_45.wait
  L7_46(L8_47)
  L7_46 = createGameObject2
  L8_47 = "Puppet"
  L7_46 = L7_46(L8_47)
  L9_48 = L7_46
  L8_47 = L7_46.setEnableDebugDraw
  L10_49 = true
  L8_47(L9_48, L10_49)
  L9_48 = L7_46
  L8_47 = L7_46.setName
  L10_49 = L4_43
  L8_47(L9_48, L10_49)
  L9_48 = L7_46
  L8_47 = L7_46.setDescription
  L11_50 = L5_44
  L10_49 = L5_44.getRoot
  L12_51 = L10_49(L11_50)
  L8_47(L9_48, L10_49, L11_50, L12_51, L10_49(L11_50))
  L9_48 = L7_46
  L8_47 = L7_46.setPos
  L10_49 = A1_40
  L8_47(L9_48, L10_49)
  L9_48 = L7_46
  L8_47 = L7_46.setRot
  L10_49 = A2_41
  L8_47(L9_48, L10_49)
  L9_48 = L7_46
  L8_47 = L7_46.registerIntoGroup
  L10_49 = "enemy"
  L8_47(L9_48, L10_49)
  L9_48 = L7_46
  L8_47 = L7_46.setVisible
  L10_49 = false
  L8_47(L9_48, L10_49)
  L8_47 = createGameObject2
  L9_48 = "EnemyBrain"
  L8_47 = L8_47(L9_48)
  L10_49 = L8_47
  L9_48 = L8_47.setEnableDebugDraw
  L11_50 = true
  L9_48(L10_49, L11_50)
  L10_49 = L8_47
  L9_48 = L8_47.setName
  L11_50 = "enemyAI"
  L9_48(L10_49, L11_50)
  L10_49 = L8_47
  L9_48 = L8_47.setDescription
  L12_51 = L6_45
  L11_50 = L6_45.getRoot
  L12_51 = L11_50(L12_51)
  L9_48(L10_49, L11_50, L12_51, L11_50(L12_51))
  L10_49 = L7_46
  L9_48 = L7_46.try_init
  L9_48(L10_49)
  L10_49 = L8_47
  L9_48 = L8_47.try_init
  L9_48(L10_49)
  L10_49 = L7_46
  L9_48 = L7_46.waitForReady
  L9_48(L10_49)
  L10_49 = L8_47
  L9_48 = L8_47.waitForReady
  L9_48(L10_49)
  L10_49 = L7_46
  L9_48 = L7_46.try_start
  L9_48(L10_49)
  L10_49 = L8_47
  L9_48 = L8_47.try_start
  L9_48(L10_49)
  while true do
    L10_49 = L7_46
    L9_48 = L7_46.isLoading
    L9_48 = L9_48(L10_49)
    if L9_48 then
      L9_48 = wait
      L9_48()
    end
  end
  L10_49 = L7_46
  L9_48 = L7_46.setBrain
  L11_50 = L8_47
  L9_48(L10_49, L11_50)
  L10_49 = L7_46
  L9_48 = L7_46.setVisible
  L11_50 = true
  L9_48(L10_49, L11_50)
  if A0_39 then
    L9_48 = loadFileAsset
    L10_49 = "evd"
    L11_50 = "CharDefs/enemy/soldier/officer_rifle"
    L9_48 = L9_48(L10_49, L11_50)
    L10_49 = loadFileAsset
    L11_50 = "evd"
    L12_51 = "CharDefs/enemy/soldier/officer_rifle_exported_brain"
    L10_49 = L10_49(L11_50, L12_51)
    L12_51 = L9_48
    L11_50 = L9_48.wait
    L11_50(L12_51)
    L12_51 = L10_49
    L11_50 = L10_49.wait
    L11_50(L12_51)
    L11_50 = createGameObject2
    L12_51 = "Puppet"
    L11_50 = L11_50(L12_51)
    L12_51 = L11_50.setName
    L12_51(L11_50, "pilot01")
    L12_51 = L11_50.setDescription
    L12_51(L11_50, L9_48:getRoot())
    L12_51 = L11_50.setPos
    L12_51(L11_50, Vector(x, y, z))
    L12_51 = L11_50.setRot
    L12_51(L11_50, YRotQuaternion(Deg2Rad(90)))
    L12_51 = L11_50.registerIntoGroup
    L12_51(L11_50, "enemy")
    L12_51 = L11_50.setVisible
    L12_51(L11_50, true)
    L12_51 = createGameObject2
    L12_51 = L12_51("EnemyBrain")
    L12_51:setEnableDebugDraw(true)
    L12_51:setName("enemyAI")
    L12_51:setDescription(L10_49:getRoot())
    L11_50:try_init()
    L12_51:try_init()
    L11_50:waitForReady()
    L12_51:waitForReady()
    L11_50:try_start()
    L12_51:try_start()
    while L11_50:isLoading() do
      wait()
    end
    L11_50:setBrain(L12_51)
    L8_47:setPilot(L11_50)
  end
end
