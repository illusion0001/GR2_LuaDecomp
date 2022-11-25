import("math")
import("Debug")
import("HUD")
import("Player")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
restore_task = nil
function task_restore_bkobj(A0_0)
  A0_0:requestRestore()
  restore_task = nil
end
function main()
  createGameObject2("GimmickBg"):setName("po_a_01")
  createGameObject2("GimmickBg"):setDrawModelName("po_a_01")
  createGameObject2("GimmickBg"):setCollisionName("po_a_01")
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "FIOS2Driver Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  })
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  Debug:setSwitch({
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }, true)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  while true do
    wait()
  end
end
