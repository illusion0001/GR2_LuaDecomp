import("common")
import("HUD")
import("Player")
import("GameDatabase")
GameDatabase:set(ggd.Debug__TitleSkip, true)
GameDatabase:set(ggd.Debug__StartMission, "city_block_jilga")
GameDatabase:set(ggd.Debug__PlayerStartPos, Vector(-66.5, 20.35, 137))
GameDatabase:set(ggd.Debug__PlayerStartArea, "po_a_01")
dofile("/Game/LaunchScript/root.lua")
main_root = main
function main()
  main_root()
  sb_mother2:waitForReady()
  while true do
    while true do
      if Debug:getSwitch({
        "Display",
        "FIOS2Driver Status"
      }) == false then
        Debug:setSwitch({
          "Display",
          "FIOS2Driver Status"
        }, true)
        Debug:setSwitch({"Display", "FPS"}, true)
        break
      end
      wait()
    end
  end
  while HUD:faderAlpha() ~= 1 do
    wait()
  end
  while HUD:faderAlpha() == 1 do
    wait()
  end
  print("start area_tune")
  Player:reset(Player.kReset_Standing, Player:getPuppet():getPos(), XYZRotQuaternionEular(0, 180, 0))
end
