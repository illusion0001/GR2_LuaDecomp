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
      type = "stalker",
      locator = "locator_01_01",
      name = "gellyfish",
      ai_spawn_option = "Stalker/Stalker_Hide"
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
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14
  L0_8 = Vector
  L1_9 = -13.6686
  L2_10 = 1
  L3_11 = 86.6058
  L0_8 = L0_8(L1_9, L2_10, L3_11)
  L1_9 = DebugStage
  L2_10 = L1_9
  L1_9 = L1_9.createTestStage
  L1_9 = L1_9(L2_10)
  L2_10 = DebugStage
  L3_11 = L2_10
  L2_10 = L2_10.createTestPlayer
  L4_12 = L0_8
  L5_13 = YRotQuaternion
  L6_14 = Deg2Rad
  L6_14 = L6_14(90)
  L6_14 = L5_13(L6_14, L6_14(90))
  L2_10 = L2_10(L3_11, L4_12, L5_13, L6_14, L5_13(L6_14, L6_14(90)))
  L3_11 = loadFileAsset
  L4_12 = "evb"
  L5_13 = "evx/test_enemy_type_03"
  L3_11 = L3_11(L4_12, L5_13)
  L4_12, L5_13 = nil, nil
  if L3_11 ~= nil then
    L6_14 = L3_11.wait
    L6_14(L3_11)
    L6_14 = L3_11.getRoot
    L6_14 = L6_14(L3_11)
    L4_12 = L6_14
    L6_14 = EventData
    L6_14 = L6_14.create
    L6_14 = L6_14(L6_14, "test_kudo", nil, L4_12)
    L5_13 = L6_14
    L6_14 = L5_13.try_init
    L6_14(L5_13)
    L6_14 = L5_13.waitForReady
    L6_14(L5_13)
    L6_14 = L5_13.try_start
    L6_14(L5_13)
  end
  L6_14 = print
  L6_14("init all")
  L6_14 = initializeAllGameObjects
  L6_14()
  L6_14 = print
  L6_14("wait ready all")
  L6_14 = waitForReadyAllGameObjects
  L6_14()
  L6_14 = print
  L6_14("start all")
  L6_14 = startAllGameObjects
  L6_14()
  L6_14 = Debug
  L6_14 = L6_14.setSwitch
  L6_14(L6_14, {"Display", "Debug Draw"}, true)
  L6_14 = Debug
  L6_14 = L6_14.setSwitch
  L6_14(L6_14, {
    "Display",
    "File Asset Status"
  }, false)
  L6_14 = Debug
  L6_14 = L6_14.setSwitch
  L6_14(L6_14, {
    "Display",
    "Warning Indicator"
  }, false)
  L6_14 = HUD
  L6_14 = L6_14.hpgDispReq_FadeIn
  L6_14(L6_14)
  L6_14 = HUD
  L6_14 = L6_14.grgDispReq_FadeIn
  L6_14(L6_14)
  L6_14 = nil
  while not L6_14 do
    L6_14 = findGameObject2("EnemyGenerator", "enmgen2_01")
    wait()
  end
  L6_14:requestSpawn()
  while true do
    wait()
  end
end
