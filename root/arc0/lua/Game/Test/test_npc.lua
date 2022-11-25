import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
import("Player")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Npc/npc.lua")
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16
  L0_0 = Vector
  L1_1 = -5.614086
  L2_2 = -1.999998
  L3_3 = 31.22108
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L1_1 = Vector
  L2_2 = -2.7
  L3_3 = 0
  L4_4 = -50.89999999999999
  L1_1 = L1_1(L2_2, L3_3, L4_4)
  L2_2 = Vector
  L3_3 = 12.7
  L4_4 = 0
  L5_5 = -50.89999999999999
  L2_2 = L2_2(L3_3, L4_4, L5_5)
  L3_3 = Vector
  L4_4 = 12.7
  L5_5 = 0
  L6_6 = -40.89999999999999
  L3_3 = L3_3(L4_4, L5_5, L6_6)
  L4_4 = Vector
  L5_5 = -2.7
  L6_6 = 0
  L7_7 = -40.89999999999999
  L4_4 = L4_4(L5_5, L6_6, L7_7)
  L5_5 = enemy_base_bg_setup
  L5_5()
  L5_5 = findGameObject2
  L6_6 = "Area"
  L7_7 = "motion_test_stage1_01"
  L5_5 = L5_5(L6_6, L7_7)
  L6_6 = {L7_7}
  L7_7 = {}
  L7_7.label = "man01"
  L7_7.npcName = "NPC_man01"
  L11_11 = 26.2
  L7_7.pos = L8_8
  L11_11 = 0
  L12_12 = 0.71
  L7_7.rot = L8_8
  L7_7 = {}
  L7_7.use_gravity = true
  for L11_11 = 1, #L6_6 do
    L12_12 = Npc
    L12_12 = L12_12.Load
    L13_13 = L6_6[L11_11]
    L13_13 = L13_13.npcName
    L14_14 = L5_5
    L15_15 = L6_6[L11_11]
    L15_15 = L15_15.pos
    L16_16 = L6_6[L11_11]
    L16_16 = L16_16.rot
    L12_12(L13_13, L14_14, L15_15, L16_16, L6_6[L11_11].label, L7_7)
  end
  L11_11 = "posA"
  L9_9(L10_10, L11_11)
  L11_11 = L1_1
  L9_9(L10_10, L11_11)
  L11_11 = L9_9
  L12_12 = "posB"
  L10_10(L11_11, L12_12)
  L11_11 = L9_9
  L12_12 = L2_2
  L10_10(L11_11, L12_12)
  L11_11 = "Node"
  L12_12 = L10_10
  L11_11 = L10_10.setName
  L13_13 = "posC"
  L11_11(L12_12, L13_13)
  L12_12 = L10_10
  L11_11 = L10_10.setPos
  L13_13 = L3_3
  L11_11(L12_12, L13_13)
  L11_11 = createGameObject2
  L12_12 = "Node"
  L11_11 = L11_11(L12_12)
  L13_13 = L11_11
  L12_12 = L11_11.setName
  L14_14 = "posD"
  L12_12(L13_13, L14_14)
  L13_13 = L11_11
  L12_12 = L11_11.setPos
  L14_14 = L4_4
  L12_12(L13_13, L14_14)
  L12_12 = DebugStage
  L13_13 = L12_12
  L12_12 = L12_12.createTestPlayer
  L14_14 = L0_0
  L15_15 = YRotQuaternion
  L16_16 = Deg2Rad
  L16_16 = L16_16(90)
  L16_16 = L15_15(L16_16, L16_16(90))
  L12_12 = L12_12(L13_13, L14_14, L15_15, L16_16, L15_15(L16_16, L16_16(90)))
  L13_13 = Player
  L14_14 = L13_13
  L13_13 = L13_13.setEnergy
  L15_15 = Player
  L15_15 = L15_15.kEnergy_Life
  L16_16 = Player
  L16_16 = L16_16.getEnergyMax
  L16_16 = L16_16(L16_16, Player.kEnergy_Life)
  L13_13(L14_14, L15_15, L16_16, L16_16(L16_16, Player.kEnergy_Life))
  L13_13 = Player
  L14_14 = L13_13
  L13_13 = L13_13.setEnergy
  L15_15 = Player
  L15_15 = L15_15.kEnergy_Gravity
  L16_16 = Player
  L16_16 = L16_16.getEnergyMax
  L16_16 = L16_16(L16_16, Player.kEnergy_Gravity)
  L13_13(L14_14, L15_15, L16_16, L16_16(L16_16, Player.kEnergy_Gravity))
  L13_13 = Player
  L14_14 = L13_13
  L13_13 = L13_13.setEnergy
  L15_15 = Player
  L15_15 = L15_15.kEnergy_SpAttack
  L16_16 = Player
  L16_16 = L16_16.getEnergyMax
  L16_16 = L16_16(L16_16, Player.kEnergy_SpAttack)
  L13_13(L14_14, L15_15, L16_16, L16_16(L16_16, Player.kEnergy_SpAttack))
  L13_13 = print
  L14_14 = "init all"
  L13_13(L14_14)
  L13_13 = initializeAllGameObjects
  L13_13()
  L13_13 = print
  L14_14 = "wait ready all"
  L13_13(L14_14)
  L13_13 = waitForReadyAllGameObjects
  L13_13()
  L13_13 = print
  L14_14 = "start all"
  L13_13(L14_14)
  L13_13 = startAllGameObjects
  L13_13()
  L13_13 = HUD
  L14_14 = L13_13
  L13_13 = L13_13.hpgDispReq_FadeIn
  L13_13(L14_14)
  L13_13 = HUD
  L14_14 = L13_13
  L13_13 = L13_13.grgDispReq_FadeIn
  L13_13(L14_14)
  L13_13 = Debug
  L14_14 = L13_13
  L13_13 = L13_13.setSwitch
  L15_15 = {L16_16, "Debug Draw"}
  L16_16 = "Display"
  L16_16 = true
  L13_13(L14_14, L15_15, L16_16)
  L13_13 = Debug
  L14_14 = L13_13
  L13_13 = L13_13.setSwitch
  L15_15 = {
    L16_16,
    "File Asset Status"
  }
  L16_16 = "Display"
  L16_16 = false
  L13_13(L14_14, L15_15, L16_16)
  L13_13 = Debug
  L14_14 = L13_13
  L13_13 = L13_13.setSwitch
  L15_15 = {
    L16_16,
    "Warning Indicator"
  }
  L16_16 = "Display"
  L16_16 = false
  L13_13(L14_14, L15_15, L16_16)
  L13_13 = wait
  L14_14 = 30
  L13_13(L14_14)
  L14_14 = L5_5
  L13_13 = L5_5.appendChild
  L15_15 = L8_8
  L13_13(L14_14, L15_15)
  L14_14 = L5_5
  L13_13 = L5_5.appendChild
  L15_15 = L9_9
  L13_13(L14_14, L15_15)
  L14_14 = L5_5
  L13_13 = L5_5.appendChild
  L15_15 = L10_10
  L13_13(L14_14, L15_15)
  L14_14 = L5_5
  L13_13 = L5_5.appendChild
  L15_15 = L11_11
  L13_13(L14_14, L15_15)
  L13_13 = Npc
  L13_13 = L13_13.FindNpc
  L14_14 = L6_6[1]
  L14_14 = L14_14.npcName
  L13_13 = L13_13(L14_14)
  L15_15 = L13_13
  L14_14 = L13_13.getGenerator
  L14_14 = L14_14(L15_15)
  L15_15 = {}
  L15_15.arrivedLength = 3
  L15_15.runLength = -1
  L15_15.navimesh = true
  L15_15.noTurn = false
  L15_15.loop = true
  L15_15.recast = false
  L16_16 = L14_14.setMoveOption
  L16_16(L14_14, L15_15)
  L16_16 = {
    {
      pos = "posA",
      opt = {}
    },
    {
      pos = "posB",
      opt = {}
    },
    {
      pos = "posC",
      opt = {}
    },
    {
      pos = "posD",
      opt = {}
    }
  }
  L14_14:move(L16_16)
  while true do
    wait()
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
