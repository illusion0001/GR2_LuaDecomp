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
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, false)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "ScriptQuery"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "ScriptDebugDraw"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "BlockObject"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Sensor"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Viewer"
  }, true)
  Debug:setValue({
    "Viewer",
    "DebugDrawGroup",
    "Animation"
  }, true)
  Debug:setValue({
    "Viewer",
    "DrawPuppetSkeleton"
  }, true)
  Debug:setSwitch({
    "Game Objects",
    "Player",
    "Recover Life"
  })
  Debug:setValue({
    "Viewer",
    "GridCellCount"
  }, 50)
  Debug:setSwitch({
    "Development",
    "Console",
    "All Off"
  })
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  TestStage:put_barrels()
  createGameObject2("Puppet"):loadModel("kit01_base")
  createGameObject2("Puppet"):loadBaseSkeleton("kit01_base", "kit01_base")
  createGameObject2("Puppet"):loadPoseAnimation("stay", "kit01_stay_00")
  createGameObject2("Puppet"):waitForLoading()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  Player:reset(Player.kReset_Standing, Vector(0, 0, 50), Quat(0, 0, 0, 1))
  createSandbox2("neko"):try_init()
  createSandbox2("neko"):waitForReady()
  createSandbox2("neko"):setGameObject("parent", g_own)
  invokeTask(function()
    while true do
      print("nekoneko")
      wait()
    end
  end)
  invokeSystemTask(function()
    while true do
      print("inuinu")
      wait()
    end
  end)
  while true do
    if 0 ~= 0 and Pad:getButton(Pad.kButton_RD) then
      createGameObject2("Puppet"):loadModel("kit01_base")
      createGameObject2("Puppet"):loadBaseSkeleton("kit01_base", "kit01_base")
      abortAllGameTasks()
    end
    if mode ~= 1 and Pad:getButton(Pad.kButton_RR) then
      createGameObject2("Puppet"):loadModel("cro01_base")
      createGameObject2("Puppet"):loadBaseSkeleton("cro01_base", "cro01_base")
    end
    if 0 ~= 0 and Pad:getButton(Pad.kButton_RL) then
      createGameObject2("Puppet"):loadAnimationSet("kit01")
      wait(60)
      createGameObject2("Puppet"):waitForLoading()
      createGameObject2("Puppet"):playPoseAnimation("stay")
    end
    if 0 ~= 1 and Pad:getButton(Pad.kButton_RU) then
      createGameObject2("Puppet"):loadAnimationSet("cro01")
      wait(60)
      createGameObject2("Puppet"):waitForLoading()
      createGameObject2("Puppet"):playPoseAnimation("stay")
    end
    print("main")
    wait()
  end
end
