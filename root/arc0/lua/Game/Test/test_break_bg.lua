test_is_gimmickbg = true
if test_is_gimmickbg then
  test_bg_name = "gate_kk_01"
else
  test_bg_name = "core_type_horn"
end
player_y = 0
test_pos_height = 0
test_auto_break = false
import("math")
import("Debug")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  local L0_0, L1_1, L2_2
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setValue
  L2_2 = {
    "Display",
    "Debug Camera Info"
  }
  L0_0(L1_1, L2_2, true)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setValue
  L2_2 = {
    "DebugCam Activate"
  }
  L0_0(L1_1, L2_2)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    "Display",
    "Screen Console"
  }
  L0_0(L1_1, L2_2, false)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {"Display", "Debug Draw"}
  L0_0(L1_1, L2_2, true)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    "Display",
    "DebugDrawGroup",
    "GimmickBg"
  }
  L0_0(L1_1, L2_2, true)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    "Display",
    "Debug Draw GameObject"
  }
  L0_0(L1_1, L2_2, true)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    "Display",
    "File Asset Status"
  }
  L0_0(L1_1, L2_2, false)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    "Display",
    "Warning Indicator"
  }
  L0_0(L1_1, L2_2, false)
  L0_0 = 0
  L1_1 = createGameObject2
  L2_2 = "TerrainBg"
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1.setModelName
  L2_2(L1_1, "bu_a_01")
  L2_2 = L1_1.setCollisionName
  L2_2(L1_1, "bu_a_01")
  L2_2 = L1_1.setPos
  L2_2(L1_1, Vector(0, player_y - L0_0, 0))
  L2_2 = nil
  if test_is_gimmickbg then
    L2_2 = createGameObject2("GimmickBg")
    L2_2:setDrawModelName(test_bg_name)
    L2_2:setCollisionName(test_bg_name)
    L2_2:setAttributeName("test")
  else
    L2_2 = createGameObject2("EnemyParts")
    L2_2:setName(test_bg_name)
  end
  L2_2:setPos(Vector(0.1, L0_0 + test_pos_height, 0))
  L1_1:appendChild(L2_2)
  L2_2:setEventListener("dynamic", function(A0_3, A1_4)
    local L2_5, L3_6
    L3_6 = A0_3
    L2_5 = A0_3.getDynamicObject
    L2_5 = L2_5(L3_6)
    if L2_5 ~= nil then
      L3_6 = L2_5.getPos
      L3_6 = L3_6(L2_5)
      print("dobj=")
      print(L3_6)
    else
      L3_6 = print
      L3_6("dobj is nil")
    end
  end)
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  invokeTask(function()
    local L0_7, L1_8
    L0_7 = 0
    L1_8 = 0
    while true do
      if L2_2 ~= nil then
        if test_is_gimmickbg and L2_2:isBroken() then
          L1_8 = L1_8 + 1
          if L1_8 > 300 then
            L1_8 = 0
            L2_2:requestRestoreForce()
          end
        elseif test_auto_break then
          L0_7 = L0_7 + 1
          if L0_7 > 50 then
            L0_7 = 0
            L2_2:requestBreak(Vector(-50.2, 15.3, 12.3), 5, 10)
          end
        end
      end
      wait()
    end
  end)
  while true do
    wait()
  end
end
