local L1_1
L0_0 = import
L1_1 = "math"
L0_0(L1_1)
L0_0 = import
L1_1 = "EventData"
L0_0(L1_1)
L0_0 = import
L1_1 = "common"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "DeltaTimer"
L0_0(L1_1)
L0_0 = import
L1_1 = "Player"
L0_0(L1_1)
L0_0 = import
L1_1 = "Query"
L0_0(L1_1)
L0_0 = import
L1_1 = "Pad"
L0_0(L1_1)
L0_0 = import
L1_1 = "Area"
L0_0(L1_1)
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "EventHelper"
L0_0(L1_1)
L0_0 = import
L1_1 = "GravityOre"
L0_0(L1_1)
L0_0 = import
L1_1 = "GlobalGem"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Supporter/supporter_spawn.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Action/debug_spawner_register.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Action/debug_stage.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Hud/debugCommon.lua"
L0_0(L1_1)
L0_0 = {}
L1_1 = 0
function L0_0.None()
  local L0_2, L1_3
end
function L0_0.Break()
  GravityOre:Debug_Break(1)
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.None,
    data_label = "None"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.Break,
    data_label = "Break"
  }
}
function main()
  DeltaTimer:new():start()
  wait()
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, true)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Game Objects",
    "Player",
    "Recover Life"
  })
  HUD:menuOpen("Main")
  HUD:enablePhotoMode(false)
  setEnableDebugDraw(true)
  createGameObject2("GravityOreManager"):setName("GOMgr01")
  createGameObject2("GravityOreManager"):setSpawnPointMax(5)
  createGameObject2("GravityOreManager"):setSpawnMimic(0, 2)
  EventData:create("test_gravity_ore", nil):try_init()
  EventData:create("test_gravity_ore", nil):waitForReady()
  EventData:create("test_gravity_ore", nil):try_start()
  createGameObject2("GravityOre"):setBundle(findGameObject2("GravityOre", "gravityore_15"):getBundle())
  createGameObject2("GravityOre"):setName("test")
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  GravityOre.setLockonDistance(3.5)
  GlobalGem:SetPreciousGemAddCallback("GetPreciousGemCallback")
  createGameObject2("GravityOreManager"):lottery()
  createGameObject2("GravityOreManager"):make()
  while createGameObject2("GravityOreManager"):isObjAllReady() == false do
    wait()
  end
  print("start all")
  startAllGameObjects()
  while true do
    wait()
  end
end
function testBroken(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11
  if L1_5 == "GravityOre2" then
    if L1_5 == true then
      L4_8 = A0_4
      L1_5(L2_6)
      for L4_8 = 1, 10 do
        L5_9 = createGameObject2
        L6_10 = "Gem"
        L5_9 = L5_9(L6_10)
        L7_11 = L5_9
        L6_10 = L5_9.setGemModelNo
        L6_10(L7_11, 1)
        L7_11 = L5_9
        L6_10 = L5_9.setPos
        L6_10(L7_11, Vector(0, 2, 0))
        L7_11 = A0_4
        L6_10 = A0_4.appendChild
        L6_10(L7_11, L5_9)
        L7_11 = L5_9
        L6_10 = L5_9.setDynamic
        L6_10(L7_11, true)
        L7_11 = A0_4
        L6_10 = A0_4.getBreakForce
        L6_10 = L6_10(L7_11)
        L7_11 = A0_4.getWorldPos
        L7_11 = L7_11(A0_4)
        L5_9:setImpulse(L6_10, L7_11)
        L5_9:setName("gem " .. L1_1)
        L1_1 = L1_1 + 1
        L5_9:try_init()
        L5_9:waitForReadyAsync(function()
          L5_9:try_start()
        end)
        break
      end
    end
  end
end
function testOnSensorEnter(A0_12)
  print(A0_12:getName())
  A0_12:requestBreak(Vector(1, 1, 0), 1)
  A0_12:setSensorPos(Vector(1, 0, 0))
end
function GetPreciousGemCallback(A0_13)
  print("GetPreciousGem " .. A0_13:getName())
end
