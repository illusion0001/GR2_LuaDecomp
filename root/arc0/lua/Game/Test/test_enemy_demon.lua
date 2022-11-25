import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
import("Player")
import("Area")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L0_0 = Vector
  L1_1 = 0
  L2_2 = 20.5
  L3_3 = 14
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L1_1 = Vector
  L2_2 = 0
  L3_3 = -2
  L4_4 = 100
  L1_1 = L1_1(L2_2, L3_3, L4_4)
  L2_2 = DebugStage
  L3_3 = L2_2
  L2_2 = L2_2.createTestStage
  L2_2 = L2_2(L3_3)
  L3_3 = Area
  L4_4 = L3_3
  L3_3 = L3_3.setAnimMoveDriftEnable
  L5_5 = false
  L6_6 = false
  L7_7 = false
  L3_3(L4_4, L5_5, L6_6, L7_7)
  L3_3 = createGameObject2
  L4_4 = "Node"
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.setName
  L6_6 = "demonPos"
  L4_4(L5_5, L6_6)
  L5_5 = L3_3
  L4_4 = L3_3.setPos
  L6_6 = L1_1
  L4_4(L5_5, L6_6)
  L4_4 = DebugStage
  L5_5 = L4_4
  L4_4 = L4_4.createTestPlayer
  L6_6 = L0_0
  L7_7 = YRotQuaternion
  L8_8 = Deg2Rad
  L9_9 = 0
  L11_11 = L8_8(L9_9)
  L11_11 = L7_7(L8_8, L9_9, L10_10, L11_11, L8_8(L9_9))
  L4_4 = L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L7_7(L8_8, L9_9, L10_10, L11_11, L8_8(L9_9)))
  L5_5 = Player
  L6_6 = L5_5
  L5_5 = L5_5.setEnergy
  L7_7 = Player
  L7_7 = L7_7.kEnergy_Life
  L8_8 = Player
  L9_9 = L8_8
  L8_8 = L8_8.getEnergyMax
  L10_10 = Player
  L10_10 = L10_10.kEnergy_Life
  L11_11 = L8_8(L9_9, L10_10)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L8_8(L9_9, L10_10))
  L5_5 = Player
  L6_6 = L5_5
  L5_5 = L5_5.setEnergy
  L7_7 = Player
  L7_7 = L7_7.kEnergy_Gravity
  L8_8 = Player
  L9_9 = L8_8
  L8_8 = L8_8.getEnergyMax
  L10_10 = Player
  L10_10 = L10_10.kEnergy_Gravity
  L11_11 = L8_8(L9_9, L10_10)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L8_8(L9_9, L10_10))
  L5_5 = Player
  L6_6 = L5_5
  L5_5 = L5_5.setEnergy
  L7_7 = Player
  L7_7 = L7_7.kEnergy_SpAttack
  L8_8 = Player
  L9_9 = L8_8
  L8_8 = L8_8.getEnergyMax
  L10_10 = Player
  L10_10 = L10_10.kEnergy_SpAttack
  L11_11 = L8_8(L9_9, L10_10)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L8_8(L9_9, L10_10))
  L5_5 = loadFileAsset
  L6_6 = "evb"
  L7_7 = "evx/test_enemy_type_03"
  L5_5 = L5_5(L6_6, L7_7)
  L6_6, L7_7 = nil, nil
  if L5_5 ~= nil then
    L9_9 = L5_5
    L8_8 = L5_5.wait
    L8_8(L9_9)
    L9_9 = L5_5
    L8_8 = L5_5.getRoot
    L8_8 = L8_8(L9_9)
    L6_6 = L8_8
    L8_8 = EventData
    L9_9 = L8_8
    L8_8 = L8_8.create
    L10_10 = "test_kudo"
    L11_11 = nil
    L8_8 = L8_8(L9_9, L10_10, L11_11, L6_6)
    L7_7 = L8_8
    L9_9 = L7_7
    L8_8 = L7_7.try_init
    L8_8(L9_9)
    L9_9 = L7_7
    L8_8 = L7_7.waitForReady
    L8_8(L9_9)
    L9_9 = L7_7
    L8_8 = L7_7.try_start
    L8_8(L9_9)
  end
  L8_8 = print
  L9_9 = "init all"
  L8_8(L9_9)
  L8_8 = initializeAllGameObjects
  L8_8()
  L8_8 = print
  L9_9 = "wait ready all"
  L8_8(L9_9)
  L8_8 = waitForReadyAllGameObjects
  L8_8()
  L8_8 = print
  L9_9 = "start all"
  L8_8(L9_9)
  L8_8 = startAllGameObjects
  L8_8()
  L8_8 = localtest_create_enemy_async
  L9_9 = L1_1.x
  L10_10 = L1_1.y
  L11_11 = L1_1.z
  L8_8(L9_9, L10_10, L11_11, "boss/demon/demon")
  L8_8 = Debug
  L9_9 = L8_8
  L8_8 = L8_8.setSwitch
  L10_10 = {L11_11, "Debug Draw"}
  L11_11 = "Display"
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = Debug
  L9_9 = L8_8
  L8_8 = L8_8.setSwitch
  L10_10 = {
    L11_11,
    "File Asset Status"
  }
  L11_11 = "Display"
  L11_11 = false
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = Debug
  L9_9 = L8_8
  L8_8 = L8_8.setSwitch
  L10_10 = {
    L11_11,
    "Warning Indicator"
  }
  L11_11 = "Display"
  L11_11 = false
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = Debug
  L9_9 = L8_8
  L8_8 = L8_8.setSwitch
  L10_10 = {
    L11_11,
    "DebugDrawGroup",
    "Enemy"
  }
  L11_11 = "Display"
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = Debug
  L9_9 = L8_8
  L8_8 = L8_8.setSwitch
  L10_10 = {
    L11_11,
    "DebugDrawGroup",
    "Animation"
  }
  L11_11 = "Display"
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = Debug
  L9_9 = L8_8
  L8_8 = L8_8.setSwitch
  L10_10 = {
    L11_11,
    "ShowPuppetAnimInfo"
  }
  L11_11 = "Viewer"
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L8_8 = HUD
  L9_9 = L8_8
  L8_8 = L8_8.hpgDispReq_FadeIn
  L8_8(L9_9)
  L8_8 = HUD
  L9_9 = L8_8
  L8_8 = L8_8.grgDispReq_FadeIn
  L8_8(L9_9)
  L8_8 = wait
  L9_9 = 30
  L8_8(L9_9)
  L8_8 = findGameObject2
  L9_9 = "Puppet"
  L10_10 = "demon"
  L8_8 = L8_8(L9_9, L10_10)
  L10_10 = L8_8
  L9_9 = L8_8.getBrain
  L9_9 = L9_9(L10_10)
  repeat
    L10_10 = wait
    L10_10()
    L11_11 = L9_9
    L10_10 = L9_9.isReadyEnemy
    L10_10 = L10_10(L11_11)
  until L10_10
  L10_10 = 0
  function L11_11(A0_12)
    if A0_12.isPerformance then
    elseif A0_12.form == "A" then
      if A0_12.isBreakCore.loc_setCore02 == true then
        A0_12.resetBreakCore = "loc_setCore02"
      end
      if A0_12.breakCoreCount == 2 and L10_10 == 0 then
        A0_12.changeForm = "B"
        L10_10 = 0
      end
    elseif A0_12.form == "B" then
      if L10_10 == 0 then
        A0_12.changeState_attract = {time = 3}
        L10_10 = 1
      elseif L10_10 == 1 then
        if A0_12.isHoldPlayer then
          Player:setControl(Player.kControl_All, false)
        end
        if A0_12.isSealPlayerAbility then
          Player:setControl(Player.kControl_All, true)
          A0_12.releasePlayer = true
        end
        if A0_12.isEndState_attract then
          L10_10 = 2
        end
      elseif L10_10 == 2 then
        if A0_12.breakCoreCount == 2 then
          L10_10 = 3
          A0_12.resetBreakCoreCount = true
        end
      elseif L10_10 == 3 and A0_12.breakCoreCount == 2 then
        A0_12.changeForm = "C"
        L10_10 = 0
      end
    elseif A0_12.form == "C" then
      if L10_10 == 0 then
        A0_12.changeState_freeze = {time = 3}
        L10_10 = 1
      elseif L10_10 == 1 then
        if A0_12.isEndState_freeze then
          L10_10 = 2
        end
      elseif L10_10 == 2 then
      end
    end
    return A0_12
  end
  L9_9:setEventListener("enemy_demon_event", L11_11)
  while true do
    wait()
  end
end
function localtest_create_enemy_async(A0_13, A1_14, A2_15, A3_16)
  invokeTask(localtest_create_enemy, A0_13, A1_14, A2_15, A3_16)
end
function localtest_create_enemy(A0_17, A1_18, A2_19, A3_20)
  local L4_21, L5_22, L6_23, L7_24
  L4_21 = print
  L5_22 = "x "
  L6_23 = A0_17
  L5_22 = L5_22 .. L6_23
  L4_21(L5_22)
  L4_21 = print
  L5_22 = "y "
  L6_23 = A1_18
  L5_22 = L5_22 .. L6_23
  L4_21(L5_22)
  L4_21 = print
  L5_22 = "z "
  L6_23 = A2_19
  L5_22 = L5_22 .. L6_23
  L4_21(L5_22)
  L4_21 = print
  L5_22 = "classification "
  L6_23 = A3_20
  L5_22 = L5_22 .. L6_23
  L4_21(L5_22)
  L4_21 = "demon"
  L5_22 = createGameObject2
  L6_23 = "Puppet"
  L5_22 = L5_22(L6_23)
  L7_24 = L5_22
  L6_23 = L5_22.setEnableDebugDraw
  L6_23(L7_24, true)
  L7_24 = L5_22
  L6_23 = L5_22.setName
  L6_23(L7_24, L4_21)
  L6_23 = loadFileAsset
  L7_24 = "evd"
  L6_23 = L6_23(L7_24, "CharDefs/" .. A3_20)
  L7_24 = L6_23.wait
  L7_24(L6_23)
  L7_24 = L5_22.setDescription
  L7_24(L5_22, L6_23:getRoot())
  L7_24 = L5_22.setPos
  L7_24(L5_22, Vector(A0_17, A1_18, A2_19))
  L7_24 = L5_22.setRot
  L7_24(L5_22, YRotQuaternion(Deg2Rad(180)))
  L7_24 = L5_22.registerIntoGroup
  L7_24(L5_22, "enemy")
  L7_24 = L5_22.setVisible
  L7_24(L5_22, false)
  L7_24 = createGameObject2
  L7_24 = L7_24("EnemyBrain")
  L7_24:setEnableDebugDraw(true)
  L7_24:setName("demonBrain")
  loadFileAsset("evd", "CharDefs/" .. A3_20 .. "_exported_brain"):wait()
  L7_24:setDescription(loadFileAsset("evd", "CharDefs/" .. A3_20 .. "_exported_brain"):getRoot())
  L5_22:try_init()
  L7_24:try_init()
  L5_22:waitForReady()
  L7_24:waitForReady()
  L5_22:try_start()
  L7_24:try_start()
  L5_22:setBrain(L7_24)
  L5_22:setVisible(true)
end
