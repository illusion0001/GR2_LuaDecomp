test_bg_name = "barrel_kk_01"
import("math")
import("Debug")
function main()
  local L0_0, L1_1
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L0_0(L1_1, {
    "Display",
    "Screen Console"
  }, false)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L0_0(L1_1, {
    "Display",
    "File Asset Status"
  }, false)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L0_0(L1_1, {
    "Display",
    "Warning Indicator"
  }, false)
  L0_0 = nil
  L1_1 = 5000
  for _FORV_5_ = 1, L1_1 do
    L0_0 = createGameObject2("SimpleModel")
    L0_0:setModelName(test_bg_name)
    L0_0:setVisibleBlockEnable(false)
    L0_0:setPos(Vector(_FORV_5_ % 10, _FORV_5_ / 10 % 10, _FORV_5_ / 100))
  end
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
end
