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
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = createSandbox2
  L1_1 = "father2"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setString
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
    L1_1 = L1_1(L2_2, L3_3)
    if not L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L0_0 = nil
  L1_1 = DebugStage
  L2_2 = L1_1
  L1_1 = L1_1.createTestStage
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1.setDriftEnable
  L2_2(L3_3, L4_4)
  L2_2 = {}
  for L6_6 = 1, 1 do
    L2_2[L6_6] = createGameObject2("GimmickBg")
    L2_2[L6_6]:setName("bom" .. L6_6)
    L2_2[L6_6]:setDrawModelName("bomb_yj_01")
    L2_2[L6_6]:setCollisionName("bomb_yj_01")
    L2_2[L6_6]:setAttributeName("bomb_yj_01")
    L2_2[L6_6]:setPos(Vector(30, 0, L6_6 * 1))
    L2_2[L6_6]:setForceMove()
    L2_2[L6_6]:setIgnoreGrab(false)
    L2_2[L6_6]:setGrabReleasePermission(true)
    L2_2[L6_6]:setAutoRestore(10)
    L2_2[L6_6]:setVisibleBlockEnable(false)
    L2_2[L6_6]:setVisible(true)
    L2_2[L6_6]:setActive(true)
    L2_2[L6_6]:try_init()
    L2_2[L6_6]:waitForReady()
    L2_2[L6_6]:setEventListener("broken", bomBrokenEventHandler)
  end
  L3_3()
  L3_3()
  L3_3()
  L3_3(L4_4)
  while true do
    L3_3()
  end
end
function bomBrokenEventHandler(A0_7)
  print("\229\163\138\227\130\140\227\129\190\227\129\151\227\129\159:" .. A0_7:getName())
  if A0_7:getDynamicObject() ~= nil then
    print(string.format("\229\163\138\227\130\140\227\129\159\228\189\141\231\189\174 (%d, %d, %d) - dynamic\227\129\130\227\130\138", A0_7:getDynamicObject():getWorldPos().x, A0_7:getDynamicObject():getWorldPos().y, A0_7:getDynamicObject():getWorldPos().z))
  else
    print(string.format("\229\163\138\227\130\140\227\129\159\228\189\141\231\189\174   (%d, %d, %d) - dynamic\227\129\170\227\129\151", A0_7:getWorldPos().x, A0_7:getWorldPos().y, A0_7:getWorldPos().z))
  end
end
function bomDynamicEventhandler(A0_8)
  print("\229\139\149\227\129\141\227\129\190\227\129\151\227\129\159:" .. A0_8:getName())
  A0_8:getDynamicObject():setEventListener("broken", bomBrokenDynamicEventHandler)
end
function bomRestoreEventHandler(A0_9, A1_10)
  local L2_11
  L2_11 = print
  L2_11(string.format("\229\190\169\230\180\187\227\129\151\227\129\190\227\129\151\227\129\159:%s, type:%s", A0_9:getName(), A1_10))
end
function bomBrokenDynamicEventHandler(A0_12)
  print(string.format("Dynamic\227\129\140\229\163\138\227\130\140\227\129\159\228\189\141\231\189\174   (%d, %d, %d)", A0_12:getWorldPos().x, A0_12:getWorldPos().y, A0_12:getWorldPos().z))
end
