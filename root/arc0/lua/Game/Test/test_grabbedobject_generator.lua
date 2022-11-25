import("math")
import("EventData")
import("common")
import("Debug")
import("DeltaTimer")
import("Player")
import("Query")
import("Pad")
import("Area")
import("HUD")
import("EventHelper")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
function damage_callback(A0_0, A1_1)
  print("### damage:" .. A1_1)
end
function dynamic_callback(A0_2)
  print("$$$ dynamic")
  A0_2:getDynamicObject():setEventListener("damage", damage_callback)
end
function main()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  createGameObject2("GimmickBg"):setDrawModelName("up_a_02_water_01")
  createGameObject2("GimmickBg"):setCollisionName("up_a_02_water_01")
  createGameObject2("GimmickBg"):setAttributeName("up_a_02_water_01")
  createGameObject2("GimmickBg"):setPos(Vector(0, -25, -20))
  createGameObject2("GrabbedObjectGenerator"):setCollisionFileName("up_a_02_water_01")
  createGameObject2("GrabbedObjectGenerator"):setGenertionObjectName("grab_water")
  createGameObject2("GrabbedObjectGenerator"):setEffectName("ef_com_wtr_02", GrabbedObjectGenerator.kEffectPosition_Fixied)
  createGameObject2("GrabbedObjectGenerator"):setEffectName("ef_com_wtr_01", GrabbedObjectGenerator.kEffectPosition_Object)
  createGameObject2("GrabbedObjectGenerator"):setGenerationObjectIsWater(true)
  createGameObject2("GrabbedObjectGenerator"):setGenerationOnceNum(4)
  createGameObject2("GrabbedObjectGenerator"):setPos(Vector(0, -25, -20))
  if findGameObject2("Area", "motion_test_stage1_01") ~= nill then
  end
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  Area:setAnimMoveDriftEnable(true)
  while true do
    wait()
  end
end
