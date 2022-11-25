import("math")
import("Debug")
import("HUD")
import("Pad")
import("Player")
import("Replay")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
restore_task = nil
function task_restore_bkobj(A0_0)
  A0_0:requestRestore()
  restore_task = nil
end
function main()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = createGameObject2
  L1_2 = "TerrainBg"
  L0_1 = L0_1(L1_2)
  L2_3 = L0_1
  L1_2 = L0_1.setName
  L3_4 = "motion_test_stage1"
  L1_2(L2_3, L3_4)
  L2_3 = L0_1
  L1_2 = L0_1.setModelName
  L3_4 = "motion_test_stage1"
  L1_2(L2_3, L3_4)
  L2_3 = L0_1
  L1_2 = L0_1.setCollisionName
  L3_4 = "motion_test_stage1"
  L1_2(L2_3, L3_4)
  L1_2 = Debug
  L2_3 = L1_2
  L1_2 = L1_2.setSwitch
  L3_4 = {L4_5, "Debug Draw"}
  L4_5 = "Display"
  L4_5 = true
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Debug
  L2_3 = L1_2
  L1_2 = L1_2.setSwitch
  L3_4 = {
    L4_5,
    "File Asset Status"
  }
  L4_5 = "Display"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Debug
  L2_3 = L1_2
  L1_2 = L1_2.setSwitch
  L3_4 = {
    L4_5,
    "FIOS2Driver Status"
  }
  L4_5 = "Display"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Debug
  L2_3 = L1_2
  L1_2 = L1_2.setSwitch
  L3_4 = {
    L4_5,
    "Warning Indicator"
  }
  L4_5 = "Display"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Debug
  L2_3 = L1_2
  L1_2 = L1_2.setSwitch
  L3_4 = {
    L4_5,
    "DebugDrawGroup",
    "Default"
  }
  L4_5 = "Display"
  L4_5 = true
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Debug
  L2_3 = L1_2
  L1_2 = L1_2.setSwitch
  L3_4 = {
    L4_5,
    "DebugDrawGroup",
    "Player"
  }
  L4_5 = "Display"
  L4_5 = true
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = print
  L2_3 = "init all"
  L1_2(L2_3)
  L1_2 = initializeAllGameObjects
  L1_2()
  L1_2 = print
  L2_3 = "wait ready all"
  L1_2(L2_3)
  L1_2 = waitForReadyAllGameObjects
  L1_2()
  L1_2 = print
  L2_3 = "start all"
  L1_2(L2_3)
  L1_2 = startAllGameObjects
  L1_2()
  L1_2 = DebugStage
  L2_3 = L1_2
  L1_2 = L1_2.createTestPlayer
  L3_4 = Vector
  L4_5 = 0
  L3_4 = L3_4(L4_5, 2, 1)
  L4_5 = YRotQuaternion
  L4_5 = L4_5(Deg2Rad(0))
  L1_2 = L1_2(L2_3, L3_4, L4_5, L4_5(Deg2Rad(0)))
  L2_3 = Debug
  L3_4 = L2_3
  L2_3 = L2_3.setSwitch
  L4_5 = {
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }
  L2_3(L3_4, L4_5, true)
  L2_3 = initializeAllGameObjects
  L2_3()
  L2_3 = waitForReadyAllGameObjects
  L2_3()
  L2_3 = startAllGameObjects
  L2_3()
  L2_3 = HUD
  L3_4 = L2_3
  L2_3 = L2_3.hpgDispReq_FadeIn
  L2_3(L3_4)
  L2_3 = HUD
  L3_4 = L2_3
  L2_3 = L2_3.grgDispReq_FadeIn
  L2_3(L3_4)
  L2_3 = createGameObject2
  L3_4 = "Puppet"
  L2_3 = L2_3(L3_4)
  L4_5 = L2_3
  L3_4 = L2_3.loadModel
  L3_4(L4_5, "kit01_base_gs00")
  L4_5 = L2_3
  L3_4 = L2_3.loadBaseSkeleton
  L3_4(L4_5, "kit01_base", "kit01_base")
  L4_5 = L2_3
  L3_4 = L2_3.setPos
  L3_4(L4_5, Vector(0, 0, 0))
  L4_5 = L2_3
  L3_4 = L2_3.setRot
  L3_4(L4_5, Quaternion(0, 0, 0, 1))
  L3_4 = createGameObject2
  L4_5 = "GhostBrain"
  L3_4 = L3_4(L4_5)
  L4_5 = L3_4.setFile
  L4_5(L3_4, Replay:getFile())
  L4_5 = L3_4.try_init
  L4_5(L3_4)
  L4_5 = "kit01"
  loadFileAsset("evd", "AnimAttrs/" .. L4_5):wait()
  L2_3:loadPoseAnimationSet(L4_5)
  L2_3:try_init()
  L3_4:try_init()
  L2_3:waitForReady()
  L3_4:waitForReady()
  L2_3:setBrain(L3_4)
  L2_3:try_start()
  L3_4:try_start()
  L3_4:play()
  while true do
    if Pad:getButton(Pad.kButton_RR) then
      L3_4:setCnt(0)
    end
    if Pad:getButton(Pad.kButton_L1) then
      L3_4:setCnt(L3_4:getCnt() - 30)
    end
    if Pad:getButton(Pad.kButton_R1) then
      L3_4:setCnt(L3_4:getCnt() + 30)
    end
    wait()
  end
end
