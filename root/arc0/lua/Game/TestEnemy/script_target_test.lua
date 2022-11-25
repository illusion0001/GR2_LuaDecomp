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
function main()
  local L0_3
  L0_3 = Vector
  L0_3 = L0_3(-5.614086, -1.999998, 31.22108)
  enemy_base_bg_setup()
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  setupLocator("locator2_trijump_step_1", Vector(-8.777044, 0.1, -56.85956))
  setupLocator("locator2_trijump_step_2", Vector(131826, 0.1, -55.98809))
  setupLocator("locator2_trijump_1", Vector(-10.75814, 10.62394, -61.48629))
  setupLocator("locator2_trijump_2", Vector(8.995899, 11.75075, -61.48629))
  setupLocator("locator2_move_1", Vector(12.02664, 7.629395E-6, -36.84981))
  setupLocator("locator2_move_2", Vector(12.18552, 0, -80))
  setupLocator("locator2_move_3", Vector(6.48328, 0, -48.39446))
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  create_gimmickbg_barrel(Vector(0.02664, -2, 30), "barrel_01")
  create_gimmickbg_barrel(Vector(12.18552, -2, 80), "barrel_02")
  create_gimmickbg_barrel(Vector(6.48328, -2, 48.39446), "barrel_03")
  enemy_scritp_check_Giant(Vector(0, 0, 48), "giantAI")
  while true do
    wait()
    if 0 == 300 and sensor_hdl then
      sensor_hdl:try_term()
      sensor_hdl = nill
    end
  end
end
function enemy_scritp_check_Stalker(A0_4, A1_5)
  localtest_create_enemy(false, A1_5, A0_4.x, A0_4.y, A0_4.z, "enemy/stalker/stalker")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_5):isReadyEnemy()
  findGameObject2("EnemyBrain", A1_5):setScriptAttackTarget("barrel_01")
end
function enemy_scritp_check_Giant(A0_6, A1_7)
  localtest_create_enemy(false, A1_7, A0_6.x, A0_6.y, A0_6.z, "enemy/giant/giant")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_7):isReadyEnemy()
  findGameObject2("EnemyBrain", A1_7):setScriptAttackTarget("barrel_01")
end
function create_gimmickbg_barrel(A0_8, A1_9)
  local L2_10
  L2_10 = "barrel_kk_01"
  createGameObject2("GimmickBg"):setDrawModelName(L2_10)
  createGameObject2("GimmickBg"):setCollisionName(L2_10)
  createGameObject2("GimmickBg"):setAttributeName(L2_10)
  createGameObject2("GimmickBg"):setPos(A0_8)
  createGameObject2("GimmickBg"):setAutoRestore(10)
  createGameObject2("GimmickBg"):setName(A1_9)
  createGameObject2("GimmickBg"):try_init()
  while not createGameObject2("GimmickBg"):isReady() do
    wait()
  end
  createGameObject2("GimmickBg"):try_start()
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
function setupLocator(A0_11, A1_12)
  local L2_13
  L2_13 = createGameObject2
  L2_13 = L2_13("Node")
  L2_13:setName(A0_11)
  L2_13:setPos(A1_12)
  L2_13:try_init()
  L2_13:waitForReady()
  L2_13:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_13)
  end
end
function enemy_base_model_setup(A0_14, A1_15, A2_16)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_14, A1_15, A2_16))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_17, A1_18, A2_19)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_17, A1_18, A2_19))
end
function localtest_create_enemy_async(A0_20, A1_21, A2_22, A3_23, A4_24, A5_25, A6_26)
  for _FORV_11_ = 1, A5_25 do
    invokeTask(localtest_create_enemy, A0_20, A1_21, Vector(A2_22 + math.random() * 6, A3_23, A4_24 + math.random() * 6).x, Vector(A2_22 + math.random() * 6, A3_23, A4_24 + math.random() * 6).y, Vector(A2_22 + math.random() * 6, A3_23, A4_24 + math.random() * 6).z, A6_26)
    Vector(A2_22 + math.random() * 6, A3_23, A4_24 + math.random() * 6).x = Vector(A2_22 + math.random() * 6, A3_23, A4_24 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32)
  local L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41
  L6_33 = print
  L7_34 = "x "
  L8_35 = A2_29
  L7_34 = L7_34 .. L8_35
  L6_33(L7_34)
  L6_33 = print
  L7_34 = "y "
  L8_35 = A3_30
  L7_34 = L7_34 .. L8_35
  L6_33(L7_34)
  L6_33 = print
  L7_34 = "z "
  L8_35 = A4_31
  L7_34 = L7_34 .. L8_35
  L6_33(L7_34)
  L6_33 = print
  L7_34 = "classification "
  L8_35 = A5_32
  L7_34 = L7_34 .. L8_35
  L6_33(L7_34)
  L6_33 = "enemyA"
  L7_34 = loadFileAsset
  L8_35 = "evd"
  L9_36 = "CharDefs/"
  L10_37 = A5_32
  L9_36 = L9_36 .. L10_37
  L7_34 = L7_34(L8_35, L9_36)
  L8_35 = loadFileAsset
  L9_36 = "evd"
  L10_37 = "CharDefs/"
  L11_38 = A5_32
  L12_39 = "_exported_brain"
  L10_37 = L10_37 .. L11_38 .. L12_39
  L8_35 = L8_35(L9_36, L10_37)
  L10_37 = L7_34
  L9_36 = L7_34.wait
  L9_36(L10_37)
  L10_37 = L8_35
  L9_36 = L8_35.wait
  L9_36(L10_37)
  L9_36 = createGameObject2
  L10_37 = "Puppet"
  L9_36 = L9_36(L10_37)
  L11_38 = L9_36
  L10_37 = L9_36.setEnableDebugDraw
  L12_39 = true
  L10_37(L11_38, L12_39)
  L11_38 = L9_36
  L10_37 = L9_36.setName
  L12_39 = L6_33
  L10_37(L11_38, L12_39)
  L11_38 = L9_36
  L10_37 = L9_36.setDescription
  L13_40 = L7_34
  L12_39 = L7_34.getRoot
  L14_41 = L12_39(L13_40)
  L10_37(L11_38, L12_39, L13_40, L14_41, L12_39(L13_40))
  L11_38 = L9_36
  L10_37 = L9_36.setPos
  L12_39 = Vector
  L13_40 = A2_29
  L14_41 = A3_30
  L14_41 = L12_39(L13_40, L14_41, A4_31)
  L10_37(L11_38, L12_39, L13_40, L14_41, L12_39(L13_40, L14_41, A4_31))
  L11_38 = L9_36
  L10_37 = L9_36.setRot
  L12_39 = YRotQuaternion
  L13_40 = Deg2Rad
  L14_41 = 90
  L14_41 = L13_40(L14_41)
  L14_41 = L12_39(L13_40, L14_41, L13_40(L14_41))
  L10_37(L11_38, L12_39, L13_40, L14_41, L12_39(L13_40, L14_41, L13_40(L14_41)))
  L11_38 = L9_36
  L10_37 = L9_36.registerIntoGroup
  L12_39 = "enemy"
  L10_37(L11_38, L12_39)
  L11_38 = L9_36
  L10_37 = L9_36.setVisible
  L12_39 = false
  L10_37(L11_38, L12_39)
  L10_37 = createGameObject2
  L11_38 = "EnemyBrain"
  L10_37 = L10_37(L11_38)
  L12_39 = L10_37
  L11_38 = L10_37.setEnableDebugDraw
  L13_40 = true
  L11_38(L12_39, L13_40)
  L12_39 = L10_37
  L11_38 = L10_37.setName
  L13_40 = A1_28
  L11_38(L12_39, L13_40)
  L12_39 = L10_37
  L11_38 = L10_37.setDescription
  L14_41 = L8_35
  L13_40 = L8_35.getRoot
  L14_41 = L13_40(L14_41)
  L11_38(L12_39, L13_40, L14_41, L13_40(L14_41))
  L12_39 = L9_36
  L11_38 = L9_36.try_init
  L11_38(L12_39)
  L12_39 = L10_37
  L11_38 = L10_37.try_init
  L11_38(L12_39)
  L12_39 = L9_36
  L11_38 = L9_36.waitForReady
  L11_38(L12_39)
  L12_39 = L10_37
  L11_38 = L10_37.waitForReady
  L11_38(L12_39)
  L12_39 = L9_36
  L11_38 = L9_36.try_start
  L11_38(L12_39)
  L12_39 = L10_37
  L11_38 = L10_37.try_start
  L11_38(L12_39)
  while true do
    L12_39 = L9_36
    L11_38 = L9_36.isLoading
    L11_38 = L11_38(L12_39)
    if L11_38 then
      L11_38 = wait
      L11_38()
    end
  end
  L12_39 = L9_36
  L11_38 = L9_36.setBrain
  L13_40 = L10_37
  L11_38(L12_39, L13_40)
  L12_39 = L9_36
  L11_38 = L9_36.setVisible
  L13_40 = true
  L11_38(L12_39, L13_40)
  if A0_27 then
    L11_38 = loadFileAsset
    L12_39 = "evd"
    L13_40 = "CharDefs/enemy/soldier/officer_rifle"
    L11_38 = L11_38(L12_39, L13_40)
    L12_39 = loadFileAsset
    L13_40 = "evd"
    L14_41 = "CharDefs/enemy/soldier/officer_rifle_exported_brain"
    L12_39 = L12_39(L13_40, L14_41)
    L14_41 = L11_38
    L13_40 = L11_38.wait
    L13_40(L14_41)
    L14_41 = L12_39
    L13_40 = L12_39.wait
    L13_40(L14_41)
    L13_40 = createGameObject2
    L14_41 = "Puppet"
    L13_40 = L13_40(L14_41)
    L14_41 = L13_40.setName
    L14_41(L13_40, "pilot01")
    L14_41 = L13_40.setDescription
    L14_41(L13_40, L11_38:getRoot())
    L14_41 = L13_40.setPos
    L14_41(L13_40, Vector(A2_29, A3_30, A4_31))
    L14_41 = L13_40.setRot
    L14_41(L13_40, YRotQuaternion(Deg2Rad(90)))
    L14_41 = L13_40.registerIntoGroup
    L14_41(L13_40, "enemy")
    L14_41 = L13_40.setVisible
    L14_41(L13_40, true)
    L14_41 = createGameObject2
    L14_41 = L14_41("EnemyBrain")
    L14_41:setEnableDebugDraw(true)
    L14_41:setName("enemyAI")
    L14_41:setDescription(L12_39:getRoot())
    L13_40:try_init()
    L14_41:try_init()
    L13_40:waitForReady()
    L14_41:waitForReady()
    L13_40:try_start()
    L14_41:try_start()
    while L13_40:isLoading() do
      wait()
    end
    L13_40:setBrain(L14_41)
    L10_37:setPilot(L13_40)
  end
end
