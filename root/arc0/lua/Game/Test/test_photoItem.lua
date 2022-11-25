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
import("PhotoMgr")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  PhotoMgr:StartLoad()
  while not PhotoMgr:IsLoaded() do
    wait()
  end
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  Area:setAnimMoveDriftEnable(true)
  while true do
    if Pad:getButton(Pad.kButton_R2) then
      PhotoMgr:StartLoad()
    end
    if Pad:getButton(Pad.kButton_L2) then
      PhotoMgr:Unload()
    end
    wait()
  end
end
