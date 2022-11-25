import("GameDatabase")
import("math")
import("Debug")
import("HUD")
import("Font")
import("Pad")
import("Debug")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  HUD:menuOpen("Main")
  HUD:menuOpen("Gameover")
  createGameObject2("TerrainBg"):setName("motion_test_stage1")
  createGameObject2("TerrainBg"):setModelName("motion_test_stage1")
  createGameObject2("TerrainBg"):setCollisionName("motion_test_stage1")
  createGameObject2("TerrainBg"):setPos(Vector(0, -0.6, 0))
  createGameObject2("TerrainBg"):setModelName("sky_md_01")
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  Debug:setSwitch({"Display"}, false)
  HUD:hpgDispReq_FadeIn()
  HUD:grgDispReq_FadeIn()
  HUD:spgDispReq_FadeIn()
  invokeTask(function()
    local L0_0, L1_1
    L0_0 = 0
    while true do
      if L0_0 == 0 then
        L1_1 = HUD
        L1_1 = L1_1.setCheckDirectory
        L1_1(L1_1, "mp4", "mp4", true)
        L0_0 = 1
      elseif L0_0 == 1 then
        L1_1 = HUD
        L1_1 = L1_1.menuStatus
        L1_1 = L1_1(L1_1, "Debug")
        L1_1 = L1_1.state
        if L1_1 ~= "running" then
          L1_1 = HUD
          L1_1 = L1_1.getSelectFileName
          L1_1 = L1_1(L1_1)
          if L1_1 == "" then
            L0_0 = 0
          else
            print(L1_1)
            HUD:movie(L1_1)
            L0_0 = 2
          end
        end
      elseif L0_0 == 2 then
        L1_1 = HUD
        L1_1 = L1_1.menuStatus
        L1_1 = L1_1(L1_1, "Movie")
        L1_1 = L1_1.state
        if L1_1 ~= "running" then
          L1_1 = HUD
          L1_1 = L1_1.fadein
          L1_1(L1_1, 0)
          L0_0 = 0
        end
      end
      L1_1 = wait
      L1_1()
    end
  end)
end
