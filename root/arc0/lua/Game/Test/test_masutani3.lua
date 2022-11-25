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
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
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
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = createSandbox2
  L1_1 = "father2"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setString
  L3_3 = "g_filename"
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
  L3_3 = L2_2.setDriftEnable
  L3_3(L4_4, L5_5)
  L3_3 = {}
  for L7_7 = 1, L1_1 do
    L8_8 = {}
    L8_8.node = nil
    L8_8.gbg = nil
    L3_3[L7_7] = L8_8
    L8_8 = createGameObject2
    L9_9 = "Node"
    L8_8 = L8_8(L9_9)
    L10_10 = L8_8
    L9_9 = L8_8.setName
    L9_9(L10_10, "node" .. L7_7)
    L10_10 = L8_8
    L9_9 = L8_8.setPos
    L9_9(L10_10, Vector(30, 50, L7_7 * 50 - 25))
    L10_10 = L8_8
    L9_9 = L8_8.setForceMove
    L9_9(L10_10)
    L10_10 = L8_8
    L9_9 = L8_8.try_init
    L9_9(L10_10)
    L10_10 = L8_8
    L9_9 = L8_8.waitForReady
    L9_9(L10_10)
    L9_9 = L3_3[L7_7]
    L9_9.node = L8_8
    L9_9 = createGameObject2
    L10_10 = "GimmickBg"
    L9_9 = L9_9(L10_10)
    L10_10 = L9_9.setName
    L10_10(L9_9, "gbg" .. L7_7)
    L10_10 = L9_9.setDrawModelName
    L10_10(L9_9, "ciaccordion01_base")
    L10_10 = L9_9.setCollisionName
    L10_10(L9_9, "ciaccordion01_base")
    L10_10 = L9_9.setAttributeName
    L10_10(L9_9, "ciaccordion01_base")
    L10_10 = L9_9.setPos
    L10_10(L9_9, Vector(0, 0, 0))
    L10_10 = L9_9.setForceMove
    L10_10(L9_9)
    L10_10 = L9_9.setIgnoreGrab
    L10_10(L9_9, true)
    L10_10 = L9_9.setAutoRestore
    L10_10(L9_9, 10)
    L10_10 = L9_9.setVisibleBlockEnable
    L10_10(L9_9, false)
    L10_10 = L9_9.setCollidableBlockEnable
    L10_10(L9_9, false)
    L10_10 = L9_9.setVisible
    L10_10(L9_9, true)
    L10_10 = L9_9.setActive
    L10_10(L9_9, true)
    L10_10 = L9_9.try_init
    L10_10(L9_9)
    L10_10 = L9_9.waitForReady
    L10_10(L9_9)
    L10_10 = L9_9.setEventListener
    L10_10(L9_9, "dynamic", bomDynamicEventHandler)
    L10_10 = L9_9.setEventListener
    L10_10(L9_9, "broken", bomBrokenEventHandler)
    L10_10 = L9_9.setEventListener
    L10_10(L9_9, "restore", bomRestoreEventHandler)
    L10_10 = L3_3[L7_7]
    L10_10 = L10_10.node
    L10_10 = L10_10.appendChild
    L10_10(L10_10, L9_9)
    L10_10 = createGameObject2
    L10_10 = L10_10("AreaRegularBg")
    L10_10:setName("arb" .. L7_7)
    L10_10:setModelName("gm_armarea_a")
    L10_10:setPos(Vector(0, 0, 0))
    L10_10:setForceMove()
    L10_10:try_init()
    L10_10:waitForReady()
    L10_10:setVisible(false)
    L10_10:setActive(false)
    L9_9:appendChild(L10_10)
    L3_3[L7_7].gbg = L9_9
  end
  L4_4()
  L4_4()
  L4_4()
  L4_4(L5_5)
  L4_4(L5_5)
  for L7_7 = 1, L1_1 do
    L8_8 = "arb"
    L9_9 = L7_7
    L8_8 = L8_8 .. L9_9
    arbName = L8_8
    L8_8 = findGameObject2
    L9_9 = "AreaRegularBg"
    L10_10 = arbName
    L8_8 = L8_8(L9_9, L10_10)
    L10_10 = L8_8
    L9_9 = L8_8.setVisible
    L9_9(L10_10, true)
    L10_10 = L8_8
    L9_9 = L8_8.setActive
    L9_9(L10_10, true)
  end
  L7_7 = 30.5
  L8_8 = 12
  L9_9 = 0
  L10_10 = L6_6(L7_7, L8_8, L9_9)
  L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L6_6(L7_7, L8_8, L9_9))
  while true do
    L4_4(L5_5)
    for L7_7 = 1, L1_1 do
      L8_8 = L3_3[L7_7]
      L8_8 = L8_8.gbg
      L9_9 = L8_8
      L8_8 = L8_8.pushJob
      L10_10 = nil
      L8_8(L9_9, L10_10, "N", 0, "D")
    end
    L4_4(L5_5)
    for L7_7 = 1, L1_1 do
      L8_8 = L3_3[L7_7]
      L8_8 = L8_8.gbg
      L9_9 = L8_8
      L8_8 = L8_8.requestRestoreForce
      L8_8(L9_9)
    end
  end
end
function bomRestoreEventHandler(A0_11)
  local L1_12, L2_13, L3_14
  L1_12 = print
  L2_13 = "\228\191\174\229\190\169\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159:"
  L3_14 = A0_11.getName
  L3_14 = L3_14(A0_11)
  L2_13 = L2_13 .. L3_14
  L1_12(L2_13)
  L2_13 = A0_11
  L1_12 = A0_11.getName
  L1_12 = L1_12(L2_13)
  L2_13 = string
  L2_13 = L2_13.gsub
  L3_14 = L1_12
  L2_13 = L2_13(L3_14, "gbg", "arb")
  L3_14 = findGameObject2
  L3_14 = L3_14("AreaRegularBg", L2_13)
  L3_14:setPos(Vector(0, 0, 0))
  A0_11:appendChild(L3_14)
  A0_11:setEventListener("broken", bomBrokenEventHandler)
end
function bomDynamicEventHandler(A0_15)
  local L1_16, L2_17, L3_18, L4_19
  L2_17 = A0_15
  L1_16 = A0_15.setEventListener
  L3_18 = "broken"
  L4_19 = nil
  L1_16(L2_17, L3_18, L4_19)
  L2_17 = A0_15
  L1_16 = A0_15.getDynamicObject
  L1_16 = L1_16(L2_17)
  L3_18 = L1_16
  L2_17 = L1_16.setEventListener
  L4_19 = "broken"
  L2_17(L3_18, L4_19, bomBrokenEventHandler)
  L3_18 = A0_15
  L2_17 = A0_15.getName
  L2_17 = L2_17(L3_18)
  L3_18 = string
  L3_18 = L3_18.gsub
  L4_19 = L2_17
  L3_18 = L3_18(L4_19, "gbg", "arb")
  L4_19 = findGameObject2
  L4_19 = L4_19("AreaRegularBg", L3_18)
  L4_19:setPos(Vector(0, 0, 0))
  L1_16:appendChild(L4_19)
end
function bomBrokenEventHandler(A0_20)
  A0_20:setEventListener("broken", nil)
  print(string.format("\229\163\138\227\130\140\227\129\159\228\189\141\231\189\174 (%d, %d, %d)", A0_20:getWorldPos().x, A0_20:getWorldPos().y, A0_20:getWorldPos().z))
end
