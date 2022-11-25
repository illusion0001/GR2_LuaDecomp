import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_stage.lua")
enemy_gen_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier01",
      target_vehicle = "mechsky01"
    },
    {
      type = "mechsky",
      locator = "locator_01_01",
      name = "mechsky01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier02",
      target_vehicle = "mechsky02"
    },
    {
      type = "mechsky",
      locator = "locator_01_01",
      name = "mechsky02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_01",
      name = "soldier03",
      target_vehicle = "mechsky03"
    },
    {
      type = "mechsky",
      locator = "locator_01_01",
      name = "mechsky03"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end
}
function main()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20
  L0_8 = Vector
  L1_9 = -0.3
  L2_10 = 8.6
  L3_11 = 73.5
  L0_8 = L0_8(L1_9, L2_10, L3_11)
  L1_9 = Vector
  L2_10 = -5
  L3_11 = 2
  L4_12 = 50.6
  L1_9 = L1_9(L2_10, L3_11, L4_12)
  L2_10 = Vector
  L3_11 = -10
  L4_12 = 4
  L5_13 = 17.6
  L2_10 = L2_10(L3_11, L4_12, L5_13)
  L3_11 = Vector
  L4_12 = -10
  L5_13 = 4
  L6_14 = 17.6
  L3_11 = L3_11(L4_12, L5_13, L6_14)
  L4_12 = Vector
  L5_13 = -3
  L6_14 = 0.8
  L7_15 = 18.5
  L4_12 = L4_12(L5_13, L6_14, L7_15)
  L5_13 = DebugStage
  L6_14 = L5_13
  L5_13 = L5_13.createTestStage
  L5_13 = L5_13(L6_14)
  L6_14 = DebugStage
  L7_15 = L6_14
  L6_14 = L6_14.createTestPlayer
  L8_16 = L0_8
  L9_17 = YRotQuaternion
  L10_18 = Deg2Rad
  L11_19 = 90
  L12_20 = L10_18(L11_19)
  L12_20 = L9_17(L10_18, L11_19, L12_20, L10_18(L11_19))
  L6_14 = L6_14(L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L9_17(L10_18, L11_19, L12_20, L10_18(L11_19)))
  L7_15 = createGameObject2
  L8_16 = "Node"
  L7_15 = L7_15(L8_16)
  L9_17 = L7_15
  L8_16 = L7_15.setName
  L10_18 = "locator_enemy_pos"
  L8_16(L9_17, L10_18)
  L9_17 = L7_15
  L8_16 = L7_15.setPos
  L10_18 = L4_12
  L8_16(L9_17, L10_18)
  L8_16 = createGameObject2
  L9_17 = "Node"
  L8_16 = L8_16(L9_17)
  L10_18 = L7_15
  L9_17 = L7_15.setName
  L11_19 = "locator_soldier_spawn"
  L9_17(L10_18, L11_19)
  L10_18 = L7_15
  L9_17 = L7_15.setPos
  L11_19 = Vector
  L12_20 = 26.4
  L12_20 = L11_19(L12_20, 0.7, 0.7)
  L9_17(L10_18, L11_19, L12_20, L11_19(L12_20, 0.7, 0.7))
  L9_17 = loadFileAsset
  L10_18 = "evb"
  L11_19 = "evx/test_enemy_type_03"
  L9_17 = L9_17(L10_18, L11_19)
  L10_18, L11_19 = nil, nil
  if L9_17 ~= nil then
    L12_20 = L9_17.wait
    L12_20(L9_17)
    L12_20 = L9_17.getRoot
    L12_20 = L12_20(L9_17)
    L10_18 = L12_20
    L12_20 = EventData
    L12_20 = L12_20.create
    L12_20 = L12_20(L12_20, "test_kudo", nil, L10_18)
    L11_19 = L12_20
    L12_20 = L11_19.try_init
    L12_20(L11_19)
    L12_20 = L11_19.waitForReady
    L12_20(L11_19)
    L12_20 = L11_19.try_start
    L12_20(L11_19)
  end
  L12_20 = print
  L12_20("init all")
  L12_20 = initializeAllGameObjects
  L12_20()
  L12_20 = print
  L12_20("wait ready all")
  L12_20 = waitForReadyAllGameObjects
  L12_20()
  L12_20 = print
  L12_20("start all")
  L12_20 = startAllGameObjects
  L12_20()
  L12_20 = Debug
  L12_20 = L12_20.setSwitch
  L12_20(L12_20, {"Display", "Debug Draw"}, true)
  L12_20 = Debug
  L12_20 = L12_20.setSwitch
  L12_20(L12_20, {
    "Display",
    "File Asset Status"
  }, false)
  L12_20 = Debug
  L12_20 = L12_20.setSwitch
  L12_20(L12_20, {
    "Display",
    "Warning Indicator"
  }, false)
  L12_20 = HUD
  L12_20 = L12_20.hpgDispReq_FadeIn
  L12_20(L12_20)
  L12_20 = HUD
  L12_20 = L12_20.grgDispReq_FadeIn
  L12_20(L12_20)
  L12_20 = nil
  while not L12_20 do
    L12_20 = findGameObject2("EnemyGenerator", "enmgen2_01")
    wait()
  end
  L12_20:requestSpawn()
  while true do
    wait()
  end
end
