import("math")
import("common")
import("Debug")
import("HUD")
import("Vehicle")
import("Area")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
put_player = {
  put_barrel = function(A0_0, A1_1)
    createGameObject2("GimmickBg"):setDrawModelName("barrel_kk_01")
    createGameObject2("GimmickBg"):setCollisionName("barrel_kk_01")
    createGameObject2("GimmickBg"):setAttributeName("barrel_kk_01")
    createGameObject2("GimmickBg"):setPos(A1_1)
    createGameObject2("GimmickBg"):setAutoRestore(5)
    return (createGameObject2("GimmickBg"))
  end,
  put_barrels = function(A0_2, A1_3)
    local L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
    for L5_7 = -3, 3, 1.5 do
      for L9_11 = -3, 3, 1.5 do
        L10_12 = L5_7 * L5_7
        L11_13 = L9_11 * L9_11
        L10_12 = L10_12 + L11_13
        if L10_12 < 10 then
          L11_13 = A0_2
          L10_12 = A0_2.put_barrel
          L10_12(L11_13, Vector(A1_3.x + L5_7, A1_3.y + 0, A1_3.z + L9_11))
        end
      end
    end
  end,
  enter = function(A0_14)
    A0_14:put_barrels(Vector(0, 0, 25))
    DebugStage:createTestPlayer()
    Debug:setSwitch({
      "Game Objects",
      "Player",
      "GravityPower: Infinite"
    }, true)
    initializeAllGameObjects()
    waitForReadyAllGameObjects()
    startAllGameObjects()
  end
}
function main()
  local L0_15, L1_16
  L0_15 = DebugStage
  L1_16 = L0_15
  L0_15 = L0_15.createTestStage
  L0_15 = L0_15(L1_16)
  L1_16 = L0_15.setName
  L1_16(L0_15, "vehicle_test_area")
  L1_16 = put_player
  L1_16 = L1_16.enter
  L1_16(L1_16)
  L1_16 = loadFileAsset
  L1_16 = L1_16("evd", "vehicle/vehicle_route_debugstage")
  L1_16:wait()
  Vehicle:CreateRoute(L1_16)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Vehicle"
  }, true)
end
