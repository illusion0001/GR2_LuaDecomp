import("math")
import("Debug")
import("Area")
import("HUD")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  HUD:blackout(0)
  HUD:accessBegin()
  test_area = "bu_a_root"
  org = Vector(1.3, 1.5, 8)
  Area:setDriftRatioTrans(1)
  Area:setDriftRatioRot(0)
  Area:setAnimMoveDriftEnable(false, false, false)
  createGameObject2("Area"):setName(test_area)
  createGameObject2("Area"):setAreaGroup("TestArea")
  createGameObject2("Area"):setEnableDebugDraw(true)
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, false)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Area"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "Development",
    "Console",
    "Gfx"
  }, true)
  createGameObject2("Area"):findSubArea("bu_a_01"):setSceneParameters("cubemap_01")
  createGameObject2("Area"):findSubArea("bu_a_09"):setSceneParameters("cubemap_02")
  while Area:isLoading() do
    wait()
  end
  Area:setAnimMoveDriftEnable()
  HUD:accessEnd()
  HUD:fadein(1)
  print("move all")
end
