import("common")
import("GameDatabase")
import("EventData")
import("HUD")
import("Ugc")
import("Wind")
import("Player")
import("Debug")
import("Font")
import("Pad")
import("Sound")
import("Replay")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
  L4_4 = "Debug Draw"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Display"
  L4_4 = "DebugDrawGroup"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = createSandbox2
  L1_1 = "father2"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setString
  L3_3 = "g_filename"
  L4_4 = "/Game/Event2/father2.lua"
  L1_1(L2_2, L3_3, L4_4)
  L2_2 = L0_0
  L1_1 = L0_0.try_init
  L1_1(L2_2)
  L2_2 = L0_0
  L1_1 = L0_0.waitForReady
  L1_1(L2_2)
  L2_2 = L0_0
  L1_1 = L0_0.try_start
  L1_1(L2_2)
  while true do
    L2_2 = L0_0
    L1_1 = L0_0.sendEvent
    L3_3 = "isPcSpawned"
    L1_1 = L1_1(L2_2, L3_3)
    if not L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L0_0 = nil
  L1_1 = 3
  L2_2 = DebugStage
  L3_3 = L2_2
  L2_2 = L2_2.createTestStage
  L2_2 = L2_2(L3_3)
  L4_4 = L2_2
  L3_3 = L2_2.setDriftEnable
  L3_3(L4_4, L5_5)
  L3_3 = {}
  L4_4 = {
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    L10_10
  }
  L8_8 = "gm_move_a_04"
  L9_9 = "gm_move_a_05"
  L10_10 = "gm_move_a_06"
  for L8_8, L9_9 in L5_5(L6_6) do
    L10_10 = {}
    L10_10.node = nil
    L10_10.arb = nil
    L3_3[L8_8] = L10_10
    L10_10 = createGameObject2
    L11_11 = "Node"
    L10_10 = L10_10(L11_11)
    L11_11 = L10_10.setName
    L11_11(L10_10, "node_" .. L9_9)
    L11_11 = L10_10.setPos
    L11_11(L10_10, Vector(30, 50, L8_8 * 50 - 25))
    L11_11 = L10_10.setForceMove
    L11_11(L10_10)
    L11_11 = L10_10.try_init
    L11_11(L10_10)
    L11_11 = L10_10.waitForReady
    L11_11(L10_10)
    L11_11 = L3_3[L8_8]
    L11_11.node = L10_10
    L11_11 = createGameObject2
    L11_11 = L11_11("AreaRegularBg")
    L11_11:setName("arb_" .. L9_9)
    L11_11:setModelName(L9_9)
    L11_11:setCollisionName(L9_9)
    L11_11:setPos(Vector(0, 0, 0))
    L11_11:setForceMove()
    L11_11:try_init()
    L11_11:waitForReady()
    L11_11:setVisible(false)
    L11_11:setActive(false)
    L3_3[L8_8].node:appendChild(L11_11)
    L3_3[L8_8].arb = L11_11
  end
  L5_5()
  L5_5()
  L5_5()
  L5_5(L6_6)
  L5_5(L6_6)
  for L8_8, L9_9 in L5_5(L6_6) do
    L10_10 = L9_9.arb
    L11_11 = L10_10
    L10_10 = L10_10.setVisible
    L10_10(L11_11, true)
    L10_10 = L9_9.arb
    L11_11 = L10_10
    L10_10 = L10_10.setActive
    L10_10(L11_11, true)
  end
  while true do
    L5_5(L6_6)
    L5_5(L6_6)
    for L8_8, L9_9 in L5_5(L6_6) do
      L10_10 = print
      L11_11 = string
      L11_11 = L11_11.format
      L11_11 = L11_11("%s -> setVisible(false)", L9_9.arb:getName())
      L10_10(L11_11, L11_11("%s -> setVisible(false)", L9_9.arb:getName()))
      L10_10 = L9_9.arb
      L11_11 = L10_10
      L10_10 = L10_10.setVisible
      L10_10(L11_11, false)
      L10_10 = waitSeconds
      L11_11 = 3
      L10_10(L11_11)
    end
    L5_5(L6_6)
    L5_5(L6_6)
    for L8_8, L9_9 in L5_5(L6_6) do
      L10_10 = print
      L11_11 = string
      L11_11 = L11_11.format
      L11_11 = L11_11("%s -> setVisible(true)", L9_9.arb:getName())
      L10_10(L11_11, L11_11("%s -> setVisible(true)", L9_9.arb:getName()))
      L10_10 = L9_9.arb
      L11_11 = L10_10
      L10_10 = L10_10.setVisible
      L10_10(L11_11, true)
      L10_10 = waitSeconds
      L11_11 = 3
      L10_10(L11_11)
    end
  end
end
function createEffectAroundTarget(A0_12, A1_13, A2_14, A3_15)
  local L4_16, L5_17, L6_18, L7_19, L8_20, L9_21
  L4_16 = {}
  for L8_20 = 1, A1_13 do
    L9_21 = createGameObject2
    L9_21 = L9_21("Effect")
    L9_21:setName(string.format("sfx_node_%s_%02d", A2_14, L8_20))
    L9_21:setModelName(A2_14)
    L9_21:setPos(Vector(RandF(-A3_15, A3_15), RandF(-A3_15, A3_15), RandF(-A3_15, A3_15)))
    A0_12:appendChild(L9_21)
    L9_21:try_init()
    L9_21:waitForReady()
    L9_21:try_start()
    L9_21:setActive(true)
    L9_21:setLoop(loop)
    L9_21:play()
    table.insert(L4_16, L9_21)
  end
  return L4_16
end
