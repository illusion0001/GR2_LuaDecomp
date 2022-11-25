L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("common")
L0_0 = import
L0_0("EventData")
L0_0 = import
L0_0("Player")
L0_0 = import
L0_0("Camera")
L0_0 = dofile
L0_0("/Debug/Action/debug_supporter.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_spawner_register.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {}
L0_0.spawnOnStart = false
L0_0.autoPrepare = false
L0_0.spawnSet = {
  {
    type = "parasite_nest",
    locator = "locator_01_01",
    name = "parasite_nest01"
  }
}
L0_0.addParasiteSpawnSetName0 = "spawnSetParasite0"
L0_0.spawnSetParasite0 = {
  {
    type = "parasite",
    locator = "locator_01_01",
    name = "call_parasite0_01"
  },
  {
    type = "parasite",
    locator = "locator_01_01",
    name = "call_parasite0_02"
  }
}
L0_0.addParasiteSpawnSetName1 = "spawnSetParasite1"
L0_0.spawnSetParasite1 = {
  {
    type = "parasite",
    locator = "locator_01_01",
    name = "call_parasite1_01"
  },
  {
    type = "parasite",
    locator = "locator_01_01",
    name = "call_parasite1_02"
  }
}
L0_0.addParasiteSpawnSetName2 = "spawnSetParasite2"
L0_0.spawnSetParasite2 = {
  {
    type = "parasite",
    locator = "locator_01_01",
    name = "call_parasite2_01"
  },
  {
    type = "parasite",
    locator = "locator_01_01",
    name = "call_parasite2_02"
  },
  {
    type = "parasite",
    locator = "locator_01_01",
    name = "call_parasite2_03"
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
enemy_gen_01 = L0_0
function L0_0(A0_9)
  print("shoot name: " .. string.format("%s", A0_9.name))
end
fn_mechcannon_shoot = L0_0
L0_0 = false
function fn_ghostcityeng_coreopen(A0_10)
  print("coreopen name: " .. string.format("%s", A0_10.name))
  if A0_10.eventType == "brow_core" then
    if A0_10.isOpen == true then
      print("browcore open")
    else
      print("browcore close")
    end
    print("coreopen number: " .. string.format("%d", A0_10.pipeCore))
    if L0_0 == false and A0_10.isOpen == true then
      L0_0 = true
      A0_10.changeState = "stop"
    end
  elseif A0_10.eventType == "fairy" then
    if A0_10.fairyAlert == true then
      print("fairy alert")
    else
      print("fairy normal")
    end
  end
  return A0_10
end
function put_gimmickbg(A0_11, A1_12)
  createGameObject2("GimmickBg"):setDrawModelName(A1_12)
  createGameObject2("GimmickBg"):setCollisionName(A1_12)
  createGameObject2("GimmickBg"):setAttributeName(A1_12)
  createGameObject2("GimmickBg"):setPos(A0_11)
  createGameObject2("GimmickBg"):setAutoRestore(10)
  createGameObject2("GimmickBg"):setName(A1_12)
  return (createGameObject2("GimmickBg"))
end
function put_barrel(A0_13)
  return put_gimmickbg(A0_13, "barrel_kk_01")
end
function enemy_simple_base_model_setup(A0_14, A1_15)
  createGameObject2("GimmickBg"):setDrawModelName(A1_15)
  createGameObject2("GimmickBg"):setPos(A0_14)
  createGameObject2("GimmickBg"):setName(A1_15)
  createGameObject2("GimmickBg"):setScale(0.001)
  createGameObject2("GimmickBg"):try_init()
  while not createGameObject2("GimmickBg"):isReady() do
    wait()
  end
  createGameObject2("GimmickBg"):try_start()
  print(A1_15)
end
function enemy_simple_base_model_setup_async(A0_16, A1_17)
  invokeTask(enemy_simple_base_model_setup, A0_16, A1_17)
end
function main()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32
  L0_18 = Vector
  L1_19 = -5.614086
  L2_20 = 1
  L3_21 = 31.22108
  L0_18 = L0_18(L1_19, L2_20, L3_21)
  L1_19 = Vector
  L2_20 = -5
  L3_21 = 4
  L4_22 = 17.6
  L1_19 = L1_19(L2_20, L3_21, L4_22)
  L2_20 = Vector
  L3_21 = 0
  L4_22 = 25
  L5_23 = 0
  L2_20 = L2_20(L3_21, L4_22, L5_23)
  L3_21 = Vector
  L4_22 = 0
  L5_23 = 0
  L6_24 = 17
  L3_21 = L3_21(L4_22, L5_23, L6_24)
  L4_22 = Vector
  L5_23 = -3
  L6_24 = 0.8
  L7_25 = 18.5
  L4_22 = L4_22(L5_23, L6_24, L7_25)
  L5_23 = Vector
  L6_24 = 0
  L7_25 = 30
  L8_26 = 60
  L5_23 = L5_23(L6_24, L7_25, L8_26)
  L6_24 = Vector
  L7_25 = 0
  L8_26 = 0
  L9_27 = 25
  L6_24 = L6_24(L7_25, L8_26, L9_27)
  L7_25 = enemy_base_bg_setup
  L7_25 = L7_25()
  L8_26 = Vector
  L9_27 = -15
  L10_28 = 0.6
  L11_29 = 14.6
  L8_26 = L8_26(L9_27, L10_28, L11_29)
  L9_27 = print
  L10_28 = "init all"
  L9_27(L10_28)
  L9_27 = initializeAllGameObjects
  L9_27()
  L9_27 = print
  L10_28 = "wait ready all"
  L9_27(L10_28)
  L9_27 = waitForReadyAllGameObjects
  L9_27()
  L9_27 = print
  L10_28 = "start all"
  L9_27(L10_28)
  L9_27 = startAllGameObjects
  L9_27()
  L9_27 = DebugStage
  L10_28 = L9_27
  L9_27 = L9_27.createTestPlayer
  L11_29 = L0_18
  L12_30 = YRotQuaternion
  L13_31 = Deg2Rad
  L14_32 = 90
  L14_32 = L13_31(L14_32)
  L14_32 = L12_30(L13_31, L14_32, L13_31(L14_32))
  L9_27 = L9_27(L10_28, L11_29, L12_30, L13_31, L14_32, L12_30(L13_31, L14_32, L13_31(L14_32)))
  L10_28 = Player
  L11_29 = L10_28
  L10_28 = L10_28.setEnergy
  L12_30 = Player
  L12_30 = L12_30.kEnergy_Life
  L13_31 = Player
  L14_32 = L13_31
  L13_31 = L13_31.getEnergyMax
  L14_32 = L13_31(L14_32, Player.kEnergy_Life)
  L10_28(L11_29, L12_30, L13_31, L14_32, L13_31(L14_32, Player.kEnergy_Life))
  L10_28 = Player
  L11_29 = L10_28
  L10_28 = L10_28.setEnergy
  L12_30 = Player
  L12_30 = L12_30.kEnergy_Gravity
  L13_31 = Player
  L14_32 = L13_31
  L13_31 = L13_31.getEnergyMax
  L14_32 = L13_31(L14_32, Player.kEnergy_Gravity)
  L10_28(L11_29, L12_30, L13_31, L14_32, L13_31(L14_32, Player.kEnergy_Gravity))
  L10_28 = Player
  L11_29 = L10_28
  L10_28 = L10_28.setEnergy
  L12_30 = Player
  L12_30 = L12_30.kEnergy_SpAttack
  L13_31 = Player
  L14_32 = L13_31
  L13_31 = L13_31.getEnergyMax
  L14_32 = L13_31(L14_32, Player.kEnergy_SpAttack)
  L10_28(L11_29, L12_30, L13_31, L14_32, L13_31(L14_32, Player.kEnergy_SpAttack))
  L10_28 = print
  L11_29 = "init all"
  L10_28(L11_29)
  L10_28 = initializeAllGameObjects
  L10_28()
  L10_28 = print
  L11_29 = "wait ready all"
  L10_28(L11_29)
  L10_28 = waitForReadyAllGameObjects
  L10_28()
  L10_28 = print
  L11_29 = "start all"
  L10_28(L11_29)
  L10_28 = startAllGameObjects
  L10_28()
  L10_28 = Camera
  L11_29 = L10_28
  L10_28 = L10_28.setPitchInvert
  L12_30 = true
  L10_28(L11_29, L12_30)
  L10_28 = Vector
  L11_29 = 6
  L12_30 = 0
  L13_31 = 6
  L10_28 = L10_28(L11_29, L12_30, L13_31)
  L11_29 = localtest_create_enemy
  L12_30 = false
  L13_31 = L5_23.x
  L14_32 = L5_23.y
  L11_29(L12_30, L13_31, L14_32, L5_23.z, "boss/ghostcity_eng/ghostcity_eng")
  L11_29 = Vector
  L12_30 = -12
  L13_31 = 3.65
  L14_32 = 17.6
  L11_29 = L11_29(L12_30, L13_31, L14_32)
  L12_30 = HUD
  L13_31 = L12_30
  L12_30 = L12_30.hpgDispReq_FadeIn
  L12_30(L13_31)
  L12_30 = HUD
  L13_31 = L12_30
  L12_30 = L12_30.grgDispReq_FadeIn
  L12_30(L13_31)
  L12_30 = Vector
  L13_31 = 0
  L14_32 = 10
  L12_30 = L12_30(L13_31, L14_32, 0)
  L13_31 = "pccubesensor2_test_OnEnter"
  L14_32 = "pccubesensor2_test_OnLeave"
  _G[L13_31] = function()
    print("onEnter")
  end
  _G[L14_32] = function()
    print("onLeave")
  end
  sensor_hdl = createGameObject2("Sensor")
  sensor_hdl:setName("pccubesensor2_test")
  sensor_hdl:setDetectBehavior(1)
  sensor_hdl:addBox(Vector(10.5, 21.5, 10.5))
  sensor_hdl:setPos(Vector(-14.18234, 0.7217345, 4.89168))
  sensor_hdl:setRot(YRotQuaternion(Deg2Rad(40)))
  sensor_hdl:setOnEnter(L13_31)
  sensor_hdl:setOnLeave(L14_32)
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
  Player:setEnergyInfinite(Player.kEnergy_Gravity, true)
  findGameObject2("EnemyBrain", "enemyAI"):setEventListener("enemy_ghostcityeng_event", fn_ghostcityeng_coreopen)
  while true do
    wait()
    if 0 + 1 == 300 then
    elseif 0 + 1 == 600 then
    end
    if L0_0 == true and 0 + 1 == 600 then
      findGameObject2("EnemyBrain", "enemyAI"):eventMessage("endScriptDamaged")
    end
    if 0 == 300 and sensor_hdl then
      sensor_hdl:try_term()
      sensor_hdl = nill
    end
  end
end
function enemy_base_bg_setup()
  return DebugStage:createTestStage()
end
function enemy_base_model_setup(A0_33, A1_34, A2_35)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_33, A1_34, A2_35))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_36, A1_37, A2_38)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_36, A1_37, A2_38))
end
function localtest_create_enemy_async(A0_39, A1_40, A2_41, A3_42, A4_43, A5_44)
  for _FORV_10_ = 1, A4_43 do
    invokeTask(localtest_create_enemy, A0_39, Vector(A1_40 + math.random() * 6, A2_41, A3_42 + math.random() * 6).x, Vector(A1_40 + math.random() * 6, A2_41, A3_42 + math.random() * 6).y, Vector(A1_40 + math.random() * 6, A2_41, A3_42 + math.random() * 6).z, A5_44)
    Vector(A1_40 + math.random() * 6, A2_41, A3_42 + math.random() * 6).x = Vector(A1_40 + math.random() * 6, A2_41, A3_42 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_45, A1_46, A2_47, A3_48, A4_49)
  local L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, L11_56, L12_57
  L5_50 = print
  L6_51 = "x "
  L7_52 = A1_46
  L6_51 = L6_51 .. L7_52
  L5_50(L6_51)
  L5_50 = print
  L6_51 = "y "
  L7_52 = A2_47
  L6_51 = L6_51 .. L7_52
  L5_50(L6_51)
  L5_50 = print
  L6_51 = "z "
  L7_52 = A3_48
  L6_51 = L6_51 .. L7_52
  L5_50(L6_51)
  L5_50 = print
  L6_51 = "classification "
  L7_52 = A4_49
  L6_51 = L6_51 .. L7_52
  L5_50(L6_51)
  L5_50 = "enemyA"
  L6_51 = createGameObject2
  L7_52 = "Puppet"
  L6_51 = L6_51(L7_52)
  L8_53 = L6_51
  L7_52 = L6_51.setEnableDebugDraw
  L9_54 = true
  L7_52(L8_53, L9_54)
  L8_53 = L6_51
  L7_52 = L6_51.setName
  L9_54 = L5_50
  L7_52(L8_53, L9_54)
  L7_52 = loadFileAsset
  L8_53 = "evd"
  L9_54 = "CharDefs/"
  L10_55 = A4_49
  L9_54 = L9_54 .. L10_55
  L7_52 = L7_52(L8_53, L9_54)
  L9_54 = L7_52
  L8_53 = L7_52.wait
  L8_53(L9_54)
  L9_54 = L6_51
  L8_53 = L6_51.setDescription
  L11_56 = L7_52
  L10_55 = L7_52.getRoot
  L12_57 = L10_55(L11_56)
  L8_53(L9_54, L10_55, L11_56, L12_57, L10_55(L11_56))
  L9_54 = L6_51
  L8_53 = L6_51.setPos
  L10_55 = Vector
  L11_56 = A1_46
  L12_57 = A2_47
  L12_57 = L10_55(L11_56, L12_57, A3_48)
  L8_53(L9_54, L10_55, L11_56, L12_57, L10_55(L11_56, L12_57, A3_48))
  L9_54 = L6_51
  L8_53 = L6_51.setRot
  L10_55 = YRotQuaternion
  L11_56 = Deg2Rad
  L12_57 = 90
  L12_57 = L11_56(L12_57)
  L12_57 = L10_55(L11_56, L12_57, L11_56(L12_57))
  L8_53(L9_54, L10_55, L11_56, L12_57, L10_55(L11_56, L12_57, L11_56(L12_57)))
  L9_54 = L6_51
  L8_53 = L6_51.registerIntoGroup
  L10_55 = "enemy"
  L8_53(L9_54, L10_55)
  L9_54 = L6_51
  L8_53 = L6_51.setVisible
  L10_55 = false
  L8_53(L9_54, L10_55)
  L8_53 = createGameObject2
  L9_54 = "EnemyBrain"
  L8_53 = L8_53(L9_54)
  L10_55 = L8_53
  L9_54 = L8_53.setEnableDebugDraw
  L11_56 = true
  L9_54(L10_55, L11_56)
  L10_55 = L8_53
  L9_54 = L8_53.setName
  L11_56 = "enemyAI"
  L9_54(L10_55, L11_56)
  L9_54 = loadFileAsset
  L10_55 = "evd"
  L11_56 = "CharDefs/"
  L12_57 = A4_49
  L11_56 = L11_56 .. L12_57 .. "_exported_brain"
  L9_54 = L9_54(L10_55, L11_56)
  L11_56 = L9_54
  L10_55 = L9_54.wait
  L10_55(L11_56)
  L11_56 = L8_53
  L10_55 = L8_53.setDescription
  L12_57 = L9_54.getRoot
  L12_57 = L12_57(L9_54)
  L10_55(L11_56, L12_57, L12_57(L9_54))
  L11_56 = L6_51
  L10_55 = L6_51.try_init
  L10_55(L11_56)
  L11_56 = L8_53
  L10_55 = L8_53.try_init
  L10_55(L11_56)
  L11_56 = L6_51
  L10_55 = L6_51.waitForReady
  L10_55(L11_56)
  L11_56 = L8_53
  L10_55 = L8_53.waitForReady
  L10_55(L11_56)
  L11_56 = L6_51
  L10_55 = L6_51.try_start
  L10_55(L11_56)
  L11_56 = L8_53
  L10_55 = L8_53.try_start
  L10_55(L11_56)
  while true do
    L11_56 = L6_51
    L10_55 = L6_51.isLoading
    L10_55 = L10_55(L11_56)
    if L10_55 then
      L10_55 = wait
      L10_55()
    end
  end
  L11_56 = L6_51
  L10_55 = L6_51.setBrain
  L12_57 = L8_53
  L10_55(L11_56, L12_57)
  if A0_45 then
    L10_55 = createGameObject2
    L11_56 = "Puppet"
    L10_55 = L10_55(L11_56)
    L12_57 = L10_55
    L11_56 = L10_55.setName
    L11_56(L12_57, "pilot01")
    L11_56 = loadFileAsset
    L12_57 = "evd"
    L11_56 = L11_56(L12_57, "CharDefs/enemy/soldier/officer_rifle")
    L12_57 = L11_56.wait
    L12_57(L11_56)
    L12_57 = L10_55.setDescription
    L12_57(L10_55, L11_56:getRoot())
    L12_57 = L10_55.setPos
    L12_57(L10_55, Vector(A1_46, A2_47, A3_48))
    L12_57 = L10_55.setRot
    L12_57(L10_55, YRotQuaternion(Deg2Rad(90)))
    L12_57 = L10_55.registerIntoGroup
    L12_57(L10_55, "enemy")
    L12_57 = L10_55.setVisible
    L12_57(L10_55, true)
    L12_57 = createGameObject2
    L12_57 = L12_57("EnemyBrain")
    L12_57:setEnableDebugDraw(true)
    L12_57:setName("enemyAI")
    L10_55:try_init()
    L12_57:try_init()
    L10_55:waitForReady()
    L12_57:waitForReady()
    L10_55:try_start()
    L12_57:try_start()
    loadFileAsset("evd", "CharDefs/enemy/soldier/officer_rifle_exported_brain"):wait()
    L12_57:setDescription(loadFileAsset("evd", "CharDefs/enemy/soldier/officer_rifle_exported_brain"):getRoot())
    L10_55:setBrain(L12_57)
    L8_53:setPilot(L10_55)
  end
  L11_56 = L6_51
  L10_55 = L6_51.setVisible
  L12_57 = true
  L10_55(L11_56, L12_57)
  L11_56 = L8_53
  L10_55 = L8_53.reset
  L12_57 = Vector
  L12_57 = L12_57(A1_46, A2_47, A3_48)
  L10_55(L11_56, L12_57, YRotQuaternion(Deg2Rad(90)))
end
