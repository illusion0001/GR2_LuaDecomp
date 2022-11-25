import("Debug")
import("GameDatabase")
GameDatabase:set(ggd.Debug__StartMission, "check_treasure_box")
GameDatabase:set(ggd.Debug__TreasureBox, true)
Debug:setDebugMenuFocus({
  "Development",
  "Network",
  "Treasure",
  "Interval(sec)"
})
Debug:setValue({
  "Development",
  "Network",
  "Treasure",
  "Interval(sec)"
}, 5)
Debug:setDebugMenuFocus({})
invokeSystemTask(function()
  Savedata:sysSave()
  while Savedata:update() == 0 do
    wait()
  end
end)
dofile("/Game/LaunchScript/root.lua")
