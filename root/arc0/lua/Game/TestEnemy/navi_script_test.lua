import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
import("Player")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
enemy_gen_mothership = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  spawnSet = {
    {
      type = "mothership",
      locator = Vector(-21.32873, 20.39475, 25.52032),
      name = "mothershipAI"
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
  end
}
function put_gimmickbg(A0_8, A1_9)
  createGameObject2("GimmickBg"):setDrawModelName(A1_9)
  createGameObject2("GimmickBg"):setCollisionName(A1_9)
  createGameObject2("GimmickBg"):setAttributeName(A1_9)
  createGameObject2("GimmickBg"):setPos(A0_8)
  createGameObject2("GimmickBg"):setAutoRestore(10)
  createGameObject2("GimmickBg"):setName(A1_9)
  createGameObject2("GimmickBg"):setUseCharaCollision(true)
  return (createGameObject2("GimmickBg"))
end
function put_barrel(A0_10)
  return put_gimmickbg(A0_10, "barrel_kk_01")
end
function main()
  local L0_11
  L0_11 = Vector
  L0_11 = L0_11(-5.614086, -1.999998, 31.22108)
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
  setupLocator("locator2_move_1", Vector(12.02664, 7.629395E-6, 36.84981))
  setupLocator("locator2_move_2", Vector(12.18552, 0, -80))
  setupLocator("locator2_move_3", Vector(6.48328, 0, -48.39446))
  setupLocator("locator3_move_1", Vector(12.02664, 40, 36.84981))
  setupLocator("locator3_move_2", Vector(12.18552, 40, -80))
  setupLocator("locator3_move_3", Vector(6.48328, 40, -48.39446))
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  enemy_scritp_check_Collector(Vector(0, 0, 48), "collector01AI")
  while true do
    wait()
    if 0 == 300 and sensor_hdl then
      sensor_hdl:try_term()
      sensor_hdl = nill
    end
  end
end
function enemy_scritp_check_Fi(A0_12, A1_13)
  localtest_create_enemy(false, A1_13, A0_12.x, A0_12.y, A0_12.z, "boss/fi/fi")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_13):isReadyEnemy()
  findGameObject2("EnemyBrain", A1_13):playMotion("phi01_fee_00")
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_13):isMotionEnd()
  findGameObject2("EnemyBrain", A1_13):endScriptAction()
end
function enemy_scritp_check_Durga(A0_14, A1_15)
  localtest_create_enemy(false, A1_15, A0_14.x, A0_14.y, A0_14.z, "boss/durga/durga")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  while not findGameObject2("EnemyBrain", A1_15):isReadyEnemy() do
    wait()
  end
  findGameObject2("EnemyBrain", A1_15):playMotion("shoot_regist")
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_15):isMotionEnd()
  findGameObject2("EnemyBrain", A1_15):endScriptAction()
end
function enemy_scritp_check_Kali(A0_16, A1_17)
  local L2_18, L3_19
  L2_18 = localtest_create_enemy
  L3_19 = false
  L2_18(L3_19, A1_17, A0_16.x, A0_16.y, A0_16.z, "boss/kali/kali")
  L2_18 = initializeAllGameObjects
  L2_18()
  L2_18 = waitForReadyAllGameObjects
  L2_18()
  L2_18 = startAllGameObjects
  L2_18()
  L2_18 = findGameObject2
  L3_19 = "EnemyBrain"
  L2_18 = L2_18(L3_19, A1_17)
  repeat
    L3_19 = wait
    L3_19()
    L3_19 = L2_18.isReadyEnemy
    L3_19 = L3_19(L2_18)
  until L3_19
  L3_19 = findGameObject2
  L3_19 = L3_19("Node", "locator2_move_1")
  if L3_19 then
    L2_18:turn(L3_19:getWorldPos())
    repeat
      wait()
    until L2_18:isTurnEnd()
  end
  L3_19 = findGameObject2
  L3_19 = L3_19("Node", "locator2_move_2")
  if L3_19 then
    L2_18:turn(L3_19:getWorldPos())
    repeat
      wait()
    until L2_18:isTurnEnd()
  end
  L3_19 = findGameObject2
  L3_19 = L3_19("Node", "locator2_move_3")
  if L3_19 then
    L2_18:turn(L3_19:getWorldPos())
    repeat
      wait()
    until L2_18:isTurnEnd()
  end
  L3_19 = L2_18.endScriptAction
  L3_19(L2_18)
  L3_19 = {}
  L3_19.kali_move_mode = "run"
  L2_18:move({
    "locator2_move_1",
    "locator2_move_2"
  })
  repeat
    wait()
  until L2_18:isMoveEnd()
  L3_19 = {}
  L3_19.kali_move_mode = "walk"
  L2_18:move({
    "locator2_move_3",
    "locator2_move_1"
  }, L3_19)
  repeat
    wait()
  until L2_18:isMoveEnd()
  L3_19 = L2_18.playMotion
  L3_19(L2_18, "attack_soccer_kick_00")
  repeat
    L3_19 = wait
    L3_19()
    L3_19 = L2_18.isMotionEnd
    L3_19 = L3_19(L2_18)
  until L3_19
  L3_19 = L2_18.endScriptAction
  L3_19(L2_18)
end
function enemy_scritp_check_Stalker(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25
  L2_22 = localtest_create_enemy
  L3_23 = false
  L4_24 = A1_21
  L5_25 = A0_20.x
  L2_22(L3_23, L4_24, L5_25, A0_20.y, A0_20.z, "enemy/stalker/stalker")
  L2_22 = initializeAllGameObjects
  L2_22()
  L2_22 = waitForReadyAllGameObjects
  L2_22()
  L2_22 = startAllGameObjects
  L2_22()
  L2_22 = findGameObject2
  L3_23 = "EnemyBrain"
  L4_24 = A1_21
  L2_22 = L2_22(L3_23, L4_24)
  while true do
    L4_24 = L2_22
    L3_23 = L2_22.isReadyEnemy
    L3_23 = L3_23(L4_24)
    if not L3_23 then
      L3_23 = wait
      L3_23()
    end
  end
  L3_23 = findGameObject2
  L4_24 = "Puppet"
  L5_25 = "player"
  L3_23 = L3_23(L4_24, L5_25)
  L4_24 = {}
  L4_24.invincible = false
  L5_25 = L2_22.move
  L5_25(L2_22, {
    "locator2_move_1",
    "locator2_move_2",
    "locator2_move_3"
  }, L4_24)
  L5_25 = nil
  print("---start---")
  repeat
    L5_25 = L2_22:isMoveEnd()
    wait()
  until L5_25
  L5_25 = L2_22
  L4_24 = L2_22.move
  L4_24(L5_25, {
    "locator2_move_1",
    "locator2_move_2"
  })
  repeat
    L4_24 = wait
    L4_24()
    L5_25 = L2_22
    L4_24 = L2_22.isMoveEnd
    L4_24 = L4_24(L5_25)
  until L4_24
  L5_25 = L2_22
  L4_24 = L2_22.move
  L4_24(L5_25, {
    "locator2_move_3",
    "locator2_move_1"
  })
  repeat
    L4_24 = wait
    L4_24()
    L5_25 = L2_22
    L4_24 = L2_22.isMoveEnd
    L4_24 = L4_24(L5_25)
  until L4_24
  L5_25 = L2_22
  L4_24 = L2_22.playMotion
  L4_24(L5_25, "stay_lookup_start")
  repeat
    L4_24 = wait
    L4_24()
    L5_25 = L2_22
    L4_24 = L2_22.isMotionEnd
    L4_24 = L4_24(L5_25)
  until L4_24
  L5_25 = L2_22
  L4_24 = L2_22.playMotion
  L4_24(L5_25, "stay_lookup_loop")
  repeat
    L4_24 = wait
    L4_24()
    L5_25 = L2_22
    L4_24 = L2_22.isMotionEnd
    L4_24 = L4_24(L5_25)
  until L4_24
  L5_25 = L2_22
  L4_24 = L2_22.playMotion
  L4_24(L5_25, "stay_lookup_end")
  repeat
    L4_24 = wait
    L4_24()
    L5_25 = L2_22
    L4_24 = L2_22.isMotionEnd
    L4_24 = L4_24(L5_25)
  until L4_24
  L5_25 = L2_22
  L4_24 = L2_22.playMotion
  L4_24(L5_25, "lookup_01")
  repeat
    L4_24 = wait
    L4_24()
    L5_25 = L2_22
    L4_24 = L2_22.isMotionEnd
    L4_24 = L4_24(L5_25)
  until L4_24
  L5_25 = L2_22
  L4_24 = L2_22.endScriptAction
  L4_24(L5_25)
end
function enemy_scritp_check_Runner(A0_26, A1_27)
  local L2_28, L3_29, L4_30
  L2_28 = localtest_create_enemy
  L3_29 = false
  L4_30 = A1_27
  L2_28(L3_29, L4_30, A0_26.x, A0_26.y, A0_26.z, "enemy/runner/runner")
  L2_28 = initializeAllGameObjects
  L2_28()
  L2_28 = waitForReadyAllGameObjects
  L2_28()
  L2_28 = startAllGameObjects
  L2_28()
  L2_28 = findGameObject2
  L3_29 = "EnemyBrain"
  L4_30 = A1_27
  L2_28 = L2_28(L3_29, L4_30)
  repeat
    L3_29 = wait
    L3_29()
    L4_30 = L2_28
    L3_29 = L2_28.isReadyEnemy
    L3_29 = L3_29(L4_30)
  until L3_29
  L3_29 = findGameObject2
  L4_30 = "Puppet"
  L3_29 = L3_29(L4_30, "player")
  L4_30 = {}
  L4_30.invincible = false
  L2_28:move({
    "locator2_move_1",
    "locator2_move_2",
    "locator2_move_3"
  }, L4_30)
  repeat
    wait()
  until L2_28:isMoveEnd()
  while true do
    L4_30 = L2_28.playMotion
    L4_30(L2_28, "attack_herald")
    repeat
      L4_30 = wait
      L4_30()
      L4_30 = L2_28.isMotionEnd
      L4_30 = L4_30(L2_28)
    until L4_30
    L4_30 = L2_28.endScriptAction
    L4_30(L2_28)
  end
end
function enemy_scritp_check_GuardCore(A0_31, A1_32)
  local L2_33, L3_34, L4_35
  L2_33 = localtest_create_enemy
  L3_34 = false
  L4_35 = A1_32
  L2_33(L3_34, L4_35, A0_31.x, A0_31.y, A0_31.z, "enemy/guardcore/guardcore")
  L2_33 = initializeAllGameObjects
  L2_33()
  L2_33 = waitForReadyAllGameObjects
  L2_33()
  L2_33 = startAllGameObjects
  L2_33()
  L2_33 = findGameObject2
  L3_34 = "EnemyBrain"
  L4_35 = A1_32
  L2_33 = L2_33(L3_34, L4_35)
  repeat
    L3_34 = wait
    L3_34()
    L4_35 = L2_33
    L3_34 = L2_33.isReadyEnemy
    L3_34 = L3_34(L4_35)
  until L3_34
  L3_34 = findGameObject2
  L4_35 = "Puppet"
  L3_34 = L3_34(L4_35, "player")
  L4_35 = {}
  L4_35.invincible = false
  L2_33:move({
    "locator2_move_1",
    "locator2_move_2",
    "locator2_move_3"
  }, L4_35)
  repeat
    wait()
  until L2_33:isMoveEnd()
  while true do
    L4_35 = L2_33.playMotion
    L4_35(L2_33, "attack")
    repeat
      L4_35 = wait
      L4_35()
      L4_35 = L2_33.isMotionEnd
      L4_35 = L4_35(L2_33)
    until L4_35
    L4_35 = L2_33.playMotion
    L4_35(L2_33, "attack_air")
    repeat
      L4_35 = wait
      L4_35()
      L4_35 = L2_33.isMotionEnd
      L4_35 = L4_35(L2_33)
    until L4_35
    L4_35 = L2_33.endScriptAction
    L4_35(L2_33)
  end
end
function enemy_scritp_check_MechSmall(A0_36, A1_37)
  local L2_38, L3_39, L4_40
  L2_38 = localtest_create_enemy
  L3_39 = true
  L4_40 = A1_37
  L2_38(L3_39, L4_40, A0_36.x, A0_36.y, A0_36.z, "enemy/mechsmall/mechsmall")
  L2_38 = initializeAllGameObjects
  L2_38()
  L2_38 = waitForReadyAllGameObjects
  L2_38()
  L2_38 = startAllGameObjects
  L2_38()
  L2_38 = findGameObject2
  L3_39 = "EnemyBrain"
  L4_40 = A1_37
  L2_38 = L2_38(L3_39, L4_40)
  repeat
    L3_39 = wait
    L3_39()
    L4_40 = L2_38
    L3_39 = L2_38.isReadyEnemy
    L3_39 = L3_39(L4_40)
  until L3_39
  L3_39 = findGameObject2
  L4_40 = "Puppet"
  L3_39 = L3_39(L4_40, "player")
  L4_40 = {}
  L4_40.invincible = false
  L2_38:move({
    "locator2_move_1",
    "locator2_move_2",
    "locator2_move_3"
  }, L4_40)
  repeat
    wait()
  until L2_38:isMoveEnd()
  while true do
    L4_40 = L2_38.playMotion
    L4_40(L2_38, "attack")
    repeat
      L4_40 = wait
      L4_40()
      L4_40 = L2_38.isMotionEnd
      L4_40 = L4_40(L2_38)
    until L4_40
    L4_40 = L2_38.playMotion
    L4_40(L2_38, "attack_air")
    repeat
      L4_40 = wait
      L4_40()
      L4_40 = L2_38.isMotionEnd
      L4_40 = L4_40(L2_38)
    until L4_40
    L4_40 = L2_38.endScriptAction
    L4_40(L2_38)
  end
end
function enemy_scritp_check_Gellyfish(A0_41, A1_42)
  local L2_43, L3_44, L4_45
  L2_43 = localtest_create_enemy
  L3_44 = false
  L4_45 = A1_42
  L2_43(L3_44, L4_45, A0_41.x, A0_41.y, A0_41.z, "enemy/gellyfish/gellyfish")
  L2_43 = initializeAllGameObjects
  L2_43()
  L2_43 = waitForReadyAllGameObjects
  L2_43()
  L2_43 = startAllGameObjects
  L2_43()
  L2_43 = findGameObject2
  L3_44 = "EnemyBrain"
  L4_45 = A1_42
  L2_43 = L2_43(L3_44, L4_45)
  repeat
    L3_44 = wait
    L3_44()
    L4_45 = L2_43
    L3_44 = L2_43.isReadyEnemy
    L3_44 = L3_44(L4_45)
  until L3_44
  L3_44 = findGameObject2
  L4_45 = "Puppet"
  L3_44 = L3_44(L4_45, "player")
  L4_45 = {}
  L4_45.invincible = false
  L2_43:move({
    "locator2_move_1",
    "locator2_move_2",
    "locator2_move_3"
  }, L4_45)
  repeat
    wait()
  until L2_43:isMoveEnd()
  L4_45 = L2_43.move
  L4_45(L2_43, {
    "locator2_move_1",
    "locator2_move_2"
  })
  repeat
    L4_45 = wait
    L4_45()
    L4_45 = L2_43.isMoveEnd
    L4_45 = L4_45(L2_43)
  until L4_45
  L4_45 = L2_43.move
  L4_45(L2_43, {
    "locator2_move_3",
    "locator2_move_1"
  })
  repeat
    L4_45 = wait
    L4_45()
    L4_45 = L2_43.isMoveEnd
    L4_45 = L4_45(L2_43)
  until L4_45
  L4_45 = L2_43.playMotion
  L4_45(L2_43, "stay_lookup_start")
  repeat
    L4_45 = wait
    L4_45()
    L4_45 = L2_43.isMotionEnd
    L4_45 = L4_45(L2_43)
  until L4_45
  L4_45 = L2_43.playMotion
  L4_45(L2_43, "stay_lookup_loop")
  repeat
    L4_45 = wait
    L4_45()
    L4_45 = L2_43.isMotionEnd
    L4_45 = L4_45(L2_43)
  until L4_45
  L4_45 = L2_43.playMotion
  L4_45(L2_43, "stay_lookup_end")
  repeat
    L4_45 = wait
    L4_45()
    L4_45 = L2_43.isMotionEnd
    L4_45 = L4_45(L2_43)
  until L4_45
  L4_45 = L2_43.playMotion
  L4_45(L2_43, "lookup_01")
  repeat
    L4_45 = wait
    L4_45()
    L4_45 = L2_43.isMotionEnd
    L4_45 = L4_45(L2_43)
  until L4_45
  L4_45 = L2_43.endScriptAction
  L4_45(L2_43)
end
function enemy_scritp_check_Mothership(A0_46, A1_47)
  local L2_48, L3_49, L4_50
  L2_48 = findGameObject2
  L3_49 = "Area"
  L4_50 = "motion_test_stage1_01"
  L2_48 = L2_48(L3_49, L4_50)
  L3_49 = createGameObject2
  L4_50 = "EnemyGenerator"
  L3_49 = L3_49(L4_50)
  L4_50 = L3_49.addActionArea
  L4_50(L3_49, Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L4_50 = L3_49.addRespawnArea
  L4_50(L3_49, Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L4_50 = L3_49.addActiveArea
  L4_50(L3_49, Vector(100, 100, 100), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L4_50 = L2_48.appendChild
  L4_50(L2_48, L3_49)
  L4_50 = L3_49.setWorldPos
  L4_50(L3_49, Vector(0, 0, 0))
  L4_50 = L3_49.setSpecTableName
  L4_50(L3_49, "enemy_gen_mothership")
  L4_50 = L3_49.try_init
  L4_50(L3_49)
  L4_50 = L3_49.waitForReady
  L4_50(L3_49)
  L4_50 = L3_49.try_start
  L4_50(L3_49)
  L4_50 = L3_49.requestSpawn
  L4_50(L3_49)
  L2_48 = initializeAllGameObjects
  L2_48()
  L2_48 = waitForReadyAllGameObjects
  L2_48()
  L2_48 = startAllGameObjects
  L2_48()
  L2_48 = findGameObject2
  L3_49 = "EnemyBrain"
  L4_50 = A1_47
  L2_48 = L2_48(L3_49, L4_50)
  repeat
    L3_49 = wait
    L3_49()
    L4_50 = L2_48
    L3_49 = L2_48.isReadyEnemy
    L3_49 = L3_49(L4_50)
  until L3_49
  L3_49 = findGameObject2
  L4_50 = "Puppet"
  L3_49 = L3_49(L4_50, "player")
  L4_50 = {}
  L4_50.invincible = false
  L2_48:move({
    "locator3_move_1",
    "locator3_move_2",
    "locator3_move_3"
  }, L4_50)
  repeat
    wait()
  until L2_48:isMoveEnd()
  L4_50 = L2_48.move
  L4_50(L2_48, {
    "locator3_move_1",
    "locator3_move_2"
  })
  repeat
    L4_50 = wait
    L4_50()
    L4_50 = L2_48.isMoveEnd
    L4_50 = L4_50(L2_48)
  until L4_50
  L4_50 = L2_48.move
  L4_50(L2_48, {
    "locator3_move_3",
    "locator3_move_1"
  })
  repeat
    L4_50 = wait
    L4_50()
    L4_50 = L2_48.isMoveEnd
    L4_50 = L4_50(L2_48)
  until L4_50
  L4_50 = L2_48.playMotion
  L4_50(L2_48, "stay_lookup_start")
  repeat
    L4_50 = wait
    L4_50()
    L4_50 = L2_48.isMotionEnd
    L4_50 = L4_50(L2_48)
  until L4_50
  L4_50 = L2_48.playMotion
  L4_50(L2_48, "stay_lookup_loop")
  repeat
    L4_50 = wait
    L4_50()
    L4_50 = L2_48.isMotionEnd
    L4_50 = L4_50(L2_48)
  until L4_50
  L4_50 = L2_48.playMotion
  L4_50(L2_48, "stay_lookup_end")
  repeat
    L4_50 = wait
    L4_50()
    L4_50 = L2_48.isMotionEnd
    L4_50 = L4_50(L2_48)
  until L4_50
  L4_50 = L2_48.playMotion
  L4_50(L2_48, "lookup_01")
  repeat
    L4_50 = wait
    L4_50()
    L4_50 = L2_48.isMotionEnd
    L4_50 = L4_50(L2_48)
  until L4_50
  L4_50 = L2_48.endScriptAction
  L4_50(L2_48)
end
function enemy_scritp_check_Lunafishowner(A0_51, A1_52)
  localtest_create_enemy(false, A1_52, A0_51.x, A0_51.y, A0_51.z, "enemy/lunafishowner/lunafishowner")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isReadyEnemy()
  findGameObject2("EnemyBrain", A1_52):move({
    "locator2_move_1",
    "locator2_move_2",
    "locator2_move_3"
  })
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isMoveEnd()
  findGameObject2("EnemyBrain", A1_52):move({
    "locator2_move_1",
    "locator2_move_2"
  })
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isMoveEnd()
  findGameObject2("EnemyBrain", A1_52):move({
    "locator2_move_3",
    "locator2_move_1"
  })
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isMoveEnd()
  findGameObject2("EnemyBrain", A1_52):playMotion("stay_lookup_start")
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isMotionEnd()
  findGameObject2("EnemyBrain", A1_52):playMotion("stay_lookup_loop")
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isMotionEnd()
  findGameObject2("EnemyBrain", A1_52):playMotion("stay_lookup_end")
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isMotionEnd()
  findGameObject2("EnemyBrain", A1_52):playMotion("lookup_01")
  repeat
    wait()
  until findGameObject2("EnemyBrain", A1_52):isMotionEnd()
  findGameObject2("EnemyBrain", A1_52):endScriptAction()
end
function enemy_scritp_check_Collector(A0_53, A1_54)
  local L2_55, L3_56, L4_57, L5_58
  L2_55 = localtest_create_enemy
  L3_56 = false
  L4_57 = A1_54
  L5_58 = A0_53.x
  L2_55(L3_56, L4_57, L5_58, A0_53.y, A0_53.z, "enemy/collector/collector01")
  L2_55 = initializeAllGameObjects
  L2_55()
  L2_55 = waitForReadyAllGameObjects
  L2_55()
  L2_55 = startAllGameObjects
  L2_55()
  L2_55 = findGameObject2
  L3_56 = "EnemyBrain"
  L4_57 = A1_54
  L2_55 = L2_55(L3_56, L4_57)
  while true do
    L4_57 = L2_55
    L3_56 = L2_55.isReadyEnemy
    L3_56 = L3_56(L4_57)
    if not L3_56 then
      L3_56 = wait
      L3_56()
    end
  end
  L3_56 = findGameObject2
  L4_57 = "Puppet"
  L5_58 = "player"
  L3_56 = L3_56(L4_57, L5_58)
  L4_57 = {}
  L4_57.invincible = false
  L5_58 = L2_55.move
  L5_58(L2_55, {
    "locator2_move_1",
    "locator2_move_2",
    "locator2_move_3"
  }, L4_57)
  L5_58 = nil
  print("---start---")
  repeat
    L5_58 = L2_55:isMoveEnd()
    wait()
  until L5_58
  L5_58 = L2_55
  L4_57 = L2_55.move
  L4_57(L5_58, {
    "locator2_move_1",
    "locator2_move_2"
  })
  repeat
    L4_57 = wait
    L4_57()
    L5_58 = L2_55
    L4_57 = L2_55.isMoveEnd
    L4_57 = L4_57(L5_58)
  until L4_57
  L5_58 = L2_55
  L4_57 = L2_55.move
  L4_57(L5_58, {
    "locator2_move_3",
    "locator2_move_1"
  })
  repeat
    L4_57 = wait
    L4_57()
    L5_58 = L2_55
    L4_57 = L2_55.isMoveEnd
    L4_57 = L4_57(L5_58)
  until L4_57
  L5_58 = L2_55
  L4_57 = L2_55.playMotion
  L4_57(L5_58, "confusion")
  repeat
    L4_57 = wait
    L4_57()
    L5_58 = L2_55
    L4_57 = L2_55.isMotionEnd
    L4_57 = L4_57(L5_58)
  until L4_57
  L5_58 = L2_55
  L4_57 = L2_55.playMotion
  L4_57(L5_58, "spawn_2")
  repeat
    L4_57 = wait
    L4_57()
    L5_58 = L2_55
    L4_57 = L2_55.isMotionEnd
    L4_57 = L4_57(L5_58)
  until L4_57
  L5_58 = L2_55
  L4_57 = L2_55.playMotion
  L4_57(L5_58, "confusion")
  repeat
    L4_57 = wait
    L4_57()
    L5_58 = L2_55
    L4_57 = L2_55.isMotionEnd
    L4_57 = L4_57(L5_58)
  until L4_57
  L5_58 = L2_55
  L4_57 = L2_55.playMotion
  L4_57(L5_58, "confusion")
  repeat
    L4_57 = wait
    L4_57()
    L5_58 = L2_55
    L4_57 = L2_55.isMotionEnd
    L4_57 = L4_57(L5_58)
  until L4_57
  L5_58 = L2_55
  L4_57 = L2_55.endScriptAction
  L4_57(L5_58)
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
function setupLocator(A0_59, A1_60)
  local L2_61
  L2_61 = createGameObject2
  L2_61 = L2_61("Node")
  L2_61:setName(A0_59)
  L2_61:setPos(A1_60)
  L2_61:try_init()
  L2_61:waitForReady()
  L2_61:try_start()
  if findGameObject2("Area", "motion_test_stage1_01") then
    findGameObject2("Area", "motion_test_stage1_01"):appendChild(L2_61)
  end
end
function enemy_base_model_setup(A0_62, A1_63, A2_64)
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("core_model")
  createGameObject2("TerrainBg"):setPos(Vector(A0_62, A1_63, A2_64))
  createGameObject2("TerrainBg"):try_init()
  while not createGameObject2("TerrainBg"):isReady() do
    wait()
  end
  createGameObject2("TerrainBg"):try_start()
end
function enemy_test_parts_setup(A0_65, A1_66, A2_67)
  createGameObject2("EnemyParts"):setName("core01")
  createGameObject2("EnemyParts"):setPos(Vector(A0_65, A1_66, A2_67))
end
function localtest_create_enemy_async(A0_68, A1_69, A2_70, A3_71, A4_72, A5_73, A6_74)
  for _FORV_11_ = 1, A5_73 do
    invokeTask(localtest_create_enemy, A0_68, A1_69, Vector(A2_70 + math.random() * 6, A3_71, A4_72 + math.random() * 6).x, Vector(A2_70 + math.random() * 6, A3_71, A4_72 + math.random() * 6).y, Vector(A2_70 + math.random() * 6, A3_71, A4_72 + math.random() * 6).z, A6_74)
    Vector(A2_70 + math.random() * 6, A3_71, A4_72 + math.random() * 6).x = Vector(A2_70 + math.random() * 6, A3_71, A4_72 + math.random() * 6).x + 0.5
  end
end
function localtest_create_enemy(A0_75, A1_76, A2_77, A3_78, A4_79, A5_80)
  local L6_81, L7_82, L8_83, L9_84, L10_85, L11_86, L12_87, L13_88, L14_89
  L6_81 = print
  L7_82 = "x "
  L8_83 = A2_77
  L7_82 = L7_82 .. L8_83
  L6_81(L7_82)
  L6_81 = print
  L7_82 = "y "
  L8_83 = A3_78
  L7_82 = L7_82 .. L8_83
  L6_81(L7_82)
  L6_81 = print
  L7_82 = "z "
  L8_83 = A4_79
  L7_82 = L7_82 .. L8_83
  L6_81(L7_82)
  L6_81 = print
  L7_82 = "classification "
  L8_83 = A5_80
  L7_82 = L7_82 .. L8_83
  L6_81(L7_82)
  L6_81 = "enemyA"
  L7_82 = loadFileAsset
  L8_83 = "evd"
  L9_84 = "CharDefs/"
  L10_85 = A5_80
  L9_84 = L9_84 .. L10_85
  L7_82 = L7_82(L8_83, L9_84)
  L8_83 = loadFileAsset
  L9_84 = "evd"
  L10_85 = "CharDefs/"
  L11_86 = A5_80
  L12_87 = "_exported_brain"
  L10_85 = L10_85 .. L11_86 .. L12_87
  L8_83 = L8_83(L9_84, L10_85)
  L10_85 = L7_82
  L9_84 = L7_82.wait
  L9_84(L10_85)
  L10_85 = L8_83
  L9_84 = L8_83.wait
  L9_84(L10_85)
  L9_84 = createGameObject2
  L10_85 = "Puppet"
  L9_84 = L9_84(L10_85)
  L11_86 = L9_84
  L10_85 = L9_84.setEnableDebugDraw
  L12_87 = true
  L10_85(L11_86, L12_87)
  L11_86 = L9_84
  L10_85 = L9_84.setName
  L12_87 = L6_81
  L10_85(L11_86, L12_87)
  L11_86 = L9_84
  L10_85 = L9_84.setDescription
  L13_88 = L7_82
  L12_87 = L7_82.getRoot
  L14_89 = L12_87(L13_88)
  L10_85(L11_86, L12_87, L13_88, L14_89, L12_87(L13_88))
  L11_86 = L9_84
  L10_85 = L9_84.setPos
  L12_87 = Vector
  L13_88 = A2_77
  L14_89 = A3_78
  L14_89 = L12_87(L13_88, L14_89, A4_79)
  L10_85(L11_86, L12_87, L13_88, L14_89, L12_87(L13_88, L14_89, A4_79))
  L11_86 = L9_84
  L10_85 = L9_84.setRot
  L12_87 = YRotQuaternion
  L13_88 = Deg2Rad
  L14_89 = 90
  L14_89 = L13_88(L14_89)
  L14_89 = L12_87(L13_88, L14_89, L13_88(L14_89))
  L10_85(L11_86, L12_87, L13_88, L14_89, L12_87(L13_88, L14_89, L13_88(L14_89)))
  L11_86 = L9_84
  L10_85 = L9_84.registerIntoGroup
  L12_87 = "enemy"
  L10_85(L11_86, L12_87)
  L11_86 = L9_84
  L10_85 = L9_84.setVisible
  L12_87 = false
  L10_85(L11_86, L12_87)
  L10_85 = createGameObject2
  L11_86 = "EnemyBrain"
  L10_85 = L10_85(L11_86)
  L12_87 = L10_85
  L11_86 = L10_85.setEnableDebugDraw
  L13_88 = true
  L11_86(L12_87, L13_88)
  L12_87 = L10_85
  L11_86 = L10_85.setName
  L13_88 = A1_76
  L11_86(L12_87, L13_88)
  L12_87 = L10_85
  L11_86 = L10_85.setDescription
  L14_89 = L8_83
  L13_88 = L8_83.getRoot
  L14_89 = L13_88(L14_89)
  L11_86(L12_87, L13_88, L14_89, L13_88(L14_89))
  L12_87 = L9_84
  L11_86 = L9_84.try_init
  L11_86(L12_87)
  L12_87 = L10_85
  L11_86 = L10_85.try_init
  L11_86(L12_87)
  L12_87 = L9_84
  L11_86 = L9_84.waitForReady
  L11_86(L12_87)
  L12_87 = L10_85
  L11_86 = L10_85.waitForReady
  L11_86(L12_87)
  L12_87 = L9_84
  L11_86 = L9_84.try_start
  L11_86(L12_87)
  L12_87 = L10_85
  L11_86 = L10_85.try_start
  L11_86(L12_87)
  while true do
    L12_87 = L9_84
    L11_86 = L9_84.isLoading
    L11_86 = L11_86(L12_87)
    if L11_86 then
      L11_86 = wait
      L11_86()
    end
  end
  L12_87 = L9_84
  L11_86 = L9_84.setBrain
  L13_88 = L10_85
  L11_86(L12_87, L13_88)
  L12_87 = L9_84
  L11_86 = L9_84.setVisible
  L13_88 = true
  L11_86(L12_87, L13_88)
  if A0_75 then
    L11_86 = loadFileAsset
    L12_87 = "evd"
    L13_88 = "CharDefs/enemy/soldier/officer_rifle"
    L11_86 = L11_86(L12_87, L13_88)
    L12_87 = loadFileAsset
    L13_88 = "evd"
    L14_89 = "CharDefs/enemy/soldier/officer_rifle_exported_brain"
    L12_87 = L12_87(L13_88, L14_89)
    L14_89 = L11_86
    L13_88 = L11_86.wait
    L13_88(L14_89)
    L14_89 = L12_87
    L13_88 = L12_87.wait
    L13_88(L14_89)
    L13_88 = createGameObject2
    L14_89 = "Puppet"
    L13_88 = L13_88(L14_89)
    L14_89 = L13_88.setName
    L14_89(L13_88, "pilot01")
    L14_89 = L13_88.setDescription
    L14_89(L13_88, L11_86:getRoot())
    L14_89 = L13_88.setPos
    L14_89(L13_88, Vector(A2_77, A3_78, A4_79))
    L14_89 = L13_88.setRot
    L14_89(L13_88, YRotQuaternion(Deg2Rad(90)))
    L14_89 = L13_88.registerIntoGroup
    L14_89(L13_88, "enemy")
    L14_89 = L13_88.setVisible
    L14_89(L13_88, true)
    L14_89 = createGameObject2
    L14_89 = L14_89("EnemyBrain")
    L14_89:setEnableDebugDraw(true)
    L14_89:setName("enemyAI")
    L14_89:setDescription(L12_87:getRoot())
    L13_88:try_init()
    L14_89:try_init()
    L13_88:waitForReady()
    L14_89:waitForReady()
    L13_88:try_start()
    L14_89:try_start()
    while L13_88:isLoading() do
      wait()
    end
    L13_88:setBrain(L14_89)
    L10_85:setPilot(L13_88)
  end
end
