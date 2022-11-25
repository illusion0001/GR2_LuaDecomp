import("math")
import("common")
import("Debug")
import("EventData")
import("DeltaTimer")
import("Player")
import("Query")
import("Pad")
import("Area")
import("HUD")
import("EventHelper")
import("Yaml")
import("DebugDraw")
import("Camera")
dofile("/Debug/Action/debug_stage.lua")
TestStage = {
  put_barrel = function(A0_0, A1_1)
    createGameObject2("GimmickBg"):setDrawModelName("barrel_kk_01")
    createGameObject2("GimmickBg"):setCollisionName("barrel_kk_01")
    createGameObject2("GimmickBg"):setAttributeName("barrel_kk_01")
    createGameObject2("GimmickBg"):setPos(A1_1)
    createGameObject2("GimmickBg"):setUseCharaCollision(true)
    createGameObject2("GimmickBg"):setAutoRestore(5)
    return (createGameObject2("GimmickBg"))
  end,
  put_barrels = function(A0_2)
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 2, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 1, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z + 1))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 1, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 1))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 3, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 4))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 4, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 2))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 6, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z + 2))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x + 2.5, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 1.5))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x - 3.5, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 0.5))
    A0_2:put_barrel(Vector(Vector(-14, 0, 30).x, Vector(-14, 0, 30).y, Vector(-14, 0, 30).z - 3))
  end
}
function main()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {L3_6, L4_7}
  L3_6 = "Display"
  L4_7 = "Screen Console"
  L3_6 = false
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {L3_6, L4_7}
  L3_6 = "Display"
  L4_7 = "Debug Draw"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Display"
  L4_7 = "DebugDrawGroup"
  L5_8 = "ScriptQuery"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Display"
  L4_7 = "DebugDrawGroup"
  L5_8 = "ScriptDebugDraw"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Display"
  L4_7 = "DebugDrawGroup"
  L5_8 = "BlockObject"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Display"
  L4_7 = "DebugDrawGroup"
  L5_8 = "Sensor"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Display"
  L4_7 = "DebugDrawGroup"
  L5_8 = "Viewer"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setValue
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Viewer"
  L4_7 = "DebugDrawGroup"
  L5_8 = "Animation"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setValue
  L2_5 = {L3_6, L4_7}
  L3_6 = "Viewer"
  L4_7 = "DrawPuppetSkeleton"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Game Objects"
  L4_7 = "Player"
  L5_8 = "Recover Life"
  L0_3(L1_4, L2_5)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setValue
  L2_5 = {L3_6, L4_7}
  L3_6 = "Viewer"
  L4_7 = "GridCellCount"
  L3_6 = 50
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Development"
  L4_7 = "Console"
  L5_8 = "All Off"
  L0_3(L1_4, L2_5)
  L0_3 = Debug
  L1_4 = L0_3
  L0_3 = L0_3.setSwitch
  L2_5 = {
    L3_6,
    L4_7,
    L5_8
  }
  L3_6 = "Development"
  L4_7 = "Console"
  L5_8 = "Script"
  L3_6 = true
  L0_3(L1_4, L2_5, L3_6)
  L0_3 = DebugStage
  L1_4 = L0_3
  L0_3 = L0_3.createTestStage
  L0_3 = L0_3(L1_4)
  L1_4 = initializeAllGameObjects
  L1_4()
  L1_4 = waitForReadyAllGameObjects
  L1_4()
  L1_4 = startAllGameObjects
  L1_4()
  L2_5 = L0_3
  L1_4 = L0_3.findSubArea
  L3_6 = "motion_test_stage1_01"
  L1_4 = L1_4(L2_5, L3_6)
  L2_5 = createGameObject2
  L3_6 = "Effect"
  L2_5 = L2_5(L3_6)
  L4_7 = L2_5
  L3_6 = L2_5.setModelName
  L5_8 = "core01"
  L3_6(L4_7, L5_8)
  L4_7 = L2_5
  L3_6 = L2_5.setPos
  L5_8 = Vector
  L5_8 = L5_8(10, 5, 0)
  L3_6(L4_7, L5_8, L5_8(10, 5, 0))
  L4_7 = L2_5
  L3_6 = L2_5.setPlay
  L5_8 = true
  L3_6(L4_7, L5_8)
  L4_7 = L2_5
  L3_6 = L2_5.setLoop
  L5_8 = true
  L3_6(L4_7, L5_8)
  L4_7 = L1_4
  L3_6 = L1_4.appendChild
  L5_8 = L2_5
  L3_6(L4_7, L5_8)
  L3_6 = createGameObject2
  L4_7 = "Puppet"
  L3_6 = L3_6(L4_7)
  L5_8 = L3_6
  L4_7 = L3_6.loadModel
  L4_7(L5_8, "dus01_base")
  L4_7 = createGameObject2
  L5_8 = "Puppet"
  L4_7 = L4_7(L5_8)
  L5_8 = L4_7.loadModel
  L5_8(L4_7, "kit01_base")
  L5_8 = L4_7.setPos
  L5_8(L4_7, 1, 0, 0)
  L5_8 = {L3_6, L4_7}
  puppets = L5_8
  L5_8 = initializeAllGameObjects
  L5_8()
  L5_8 = waitForReadyAllGameObjects
  L5_8()
  L5_8 = startAllGameObjects
  L5_8()
  L5_8 = 1
  while true do
    for _FORV_9_, _FORV_10_ in ipairs(puppets) do
      print("alpha = " .. L5_8)
      _FORV_10_:setAlpha(L5_8)
    end
    wait(10)
    L5_8 = L5_8 - 0.1
    if L5_8 < 0 then
      L5_8 = 1
    end
  end
end
function test_sensor_OnEnter(A0_9, A1_10)
  local L2_11
  L2_11 = print
  L2_11("-- ON ENTER --")
  if A1_10 ~= nil then
    L2_11 = A1_10.getName
    L2_11 = L2_11(A1_10)
    if L2_11 then
      print("enter " .. L2_11)
    else
      print("enter " .. A1_10:getUid())
    end
  end
end
function test_sensor_OnLeave(A0_12, A1_13)
  local L2_14
  L2_14 = print
  L2_14("-- ON LEAVE --")
  if A1_13 ~= nil then
    L2_14 = A1_13.getName
    L2_14 = L2_14(A1_13)
    if L2_14 then
      print("leave " .. L2_14)
    else
      print("leave " .. A1_13:getUid())
    end
    if A1_13.getDynamicObject then
      if A1_13:getDynamicObject() ~= nil then
        print("DOBJ = " .. A1_13:getDynamicObject():getWorldPos().x .. ", " .. A1_13:getDynamicObject():getWorldPos().y .. ", " .. A1_13:getDynamicObject():getWorldPos().z)
        if A1_13:getDynamicObject():isGrabThrown() then
          print("THROWN")
        end
      end
      if A1_13 ~= nil then
        print("OBJ = " .. A1_13:getWorldPos().x .. ", " .. A1_13:getWorldPos().y .. ", " .. A1_13:getWorldPos().z)
      end
    end
  end
end
