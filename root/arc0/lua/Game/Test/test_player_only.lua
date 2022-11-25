import("math")
import("common")
import("Debug")
dofile("/Debug/Action/debug_stage.lua")
function main()
  local L0_0
  L0_0 = Vector
  L0_0 = L0_0(0, 0, 0)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
