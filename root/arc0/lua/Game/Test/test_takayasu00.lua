import("math")
import("Debug")
import("HUD")
import("Pad")
import("Font")
import("Player")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
restore_task = nil
function task_restore_bkobj(A0_0)
  A0_0:requestRestore()
  restore_task = nil
end
function CreateTerrainBg(A0_1)
  createGameObject2("TerrainBg"):setName(A0_1)
  createGameObject2("TerrainBg"):setModelName(A0_1)
  createGameObject2("TerrainBg"):setCollisionName(A0_1)
  return (createGameObject2("TerrainBg"))
end
function main()
  local L0_2, L1_3, L2_4, L3_5, L4_6
  L0_2 = DebugStage
  L1_3 = L0_2
  L0_2 = L0_2.createTestStage
  L0_2 = L0_2(L1_3)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {L4_6, "Debug Draw"}
  L4_6 = "Display"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "File Asset Status"
  }
  L4_6 = "Display"
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "FIOS2Driver Status"
  }
  L4_6 = "Display"
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "Warning Indicator"
  }
  L4_6 = "Display"
  L4_6 = false
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "DebugDrawGroup",
    "Default"
  }
  L4_6 = "Display"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "DebugDrawGroup",
    "Player"
  }
  L4_6 = "Display"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "DebugDrawGroup",
    "Animation"
  }
  L4_6 = "Display"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "Console",
    "Standard"
  }
  L4_6 = "Development"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Debug
  L2_4 = L1_3
  L1_3 = L1_3.setSwitch
  L3_5 = {
    L4_6,
    "Console",
    "Player"
  }
  L4_6 = "Development"
  L4_6 = true
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = print
  L2_4 = "init all"
  L1_3(L2_4)
  L1_3 = initializeAllGameObjects
  L1_3()
  L1_3 = print
  L2_4 = "wait ready all"
  L1_3(L2_4)
  L1_3 = waitForReadyAllGameObjects
  L1_3()
  L1_3 = print
  L2_4 = "start all"
  L1_3(L2_4)
  L1_3 = startAllGameObjects
  L1_3()
  L1_3 = DebugStage
  L2_4 = L1_3
  L1_3 = L1_3.createTestPlayer
  L3_5 = Vector
  L4_6 = 0
  L3_5 = L3_5(L4_6, 2, 0)
  L4_6 = YRotQuaternion
  L4_6 = L4_6(Deg2Rad(0))
  L1_3 = L1_3(L2_4, L3_5, L4_6, L4_6(Deg2Rad(0)))
  L2_4 = Debug
  L3_5 = L2_4
  L2_4 = L2_4.setSwitch
  L4_6 = {
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }
  L2_4(L3_5, L4_6, true)
  L2_4 = initializeAllGameObjects
  L2_4()
  L2_4 = waitForReadyAllGameObjects
  L2_4()
  L2_4 = startAllGameObjects
  L2_4()
  L2_4 = "cro01"
  L3_5 = createGameObject2
  L4_6 = "Puppet"
  L3_5 = L3_5(L4_6)
  L4_6 = L2_4
  L4_6 = L4_6 .. "_base"
  L3_5:loadModel(L4_6)
  L3_5:loadBasePoseAnimation(L4_6)
  L3_5:loadBaseAttrAnimation(L4_6)
  L3_5:loadBaseSkeleton(L4_6, L4_6)
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  while true do
    wait()
  end
end
