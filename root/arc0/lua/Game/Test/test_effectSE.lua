L0_0 = import
L0_0("math")
L0_0 = import
L0_0("EventData")
L0_0 = import
L0_0("common")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("DeltaTimer")
L0_0 = import
L0_0("Player")
L0_0 = import
L0_0("Query")
L0_0 = import
L0_0("Pad")
L0_0 = import
L0_0("Area")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("EventHelper")
L0_0 = dofile
L0_0("/Game/Supporter/supporter_spawn.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_spawner_register.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {
  {
    asset = "ef_bg_wtr_07m",
    local_pos = Vector(0, 0, 0)
  },
  {
    asset = "ef_bg_wtr_08m",
    local_pos = Vector(0, 0, 30)
  },
  {
    asset = "ef_bg_wtr_15m",
    local_pos = Vector(0, 0, 60)
  },
  {
    asset = "ef_bg_wtr_16m",
    local_pos = Vector(30, 0, 0)
  },
  {
    asset = "ef_bg_lqd_03m",
    local_pos = Vector(30, 0, 30)
  },
  {
    asset = "ef_bg_lqd_04m",
    local_pos = Vector(30, 0, 60)
  },
  {
    asset = "ef_bg_wtr_09m",
    local_pos = Vector(60, 0, 0)
  },
  {
    asset = "ef_bg_wtr_10m",
    local_pos = Vector(60, 0, 30)
  },
  {
    asset = "ef_bg_wtr_11m",
    local_pos = Vector(60, 0, 60)
  }
}
function main()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  if findGameObject2("Area", "motion_test_stage1_01") ~= nill then
  end
  for _FORV_6_, _FORV_7_ in ipairs(L0_0) do
    createGameObject2("Effect"):setName(_FORV_7_.asset)
    createGameObject2("Effect"):setModelName(_FORV_7_.asset)
    createGameObject2("Effect"):setPlay(true)
    createGameObject2("Effect"):setPos(_FORV_7_.local_pos)
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
