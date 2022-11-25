import("math")
import("Debug")
import("HUD")
import("common")
import("EventData")
dofile("/Debug/Action/debug_supporter.lua")
dofile("/Debug/Action/debug_stage.lua")
enemy_gen_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "kali",
      locator = Vector(81.88557, 91.31609, 37.0459),
      name = "kali",
      ai_spawn_option = "Kali/kali_boss_ep20b"
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
  local L0_8, L1_9, L2_10, L3_11, L4_12
  L0_8 = Vector
  L1_9 = 81.88557
  L2_10 = 101.31609
  L3_11 = 37.0459
  L0_8 = L0_8(L1_9, L2_10, L3_11)
  L1_9 = enemy_base_bg_setup
  L1_9 = L1_9()
  L2_10 = DebugStage
  L3_11 = L2_10
  L2_10 = L2_10.createTestPlayer
  L4_12 = L0_8
  L2_10 = L2_10(L3_11, L4_12, YRotQuaternion(Deg2Rad(180)))
  L3_11 = findGameObject2
  L4_12 = "Area"
  L3_11 = L3_11(L4_12, "dt_a_root")
  L4_12 = createGameObject2
  L4_12 = L4_12("EnemyGenerator")
  L4_12:addActionArea(Vector(1000, 1000, 1000), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L4_12:addRespawnArea(Vector(1000, 1000, 1000), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L4_12:addActiveArea(Vector(1000, 1000, 1000), Vector(0, 0, 0), Quat(0, 0, 0, 1))
  L3_11:appendChild(L4_12)
  L4_12:setWorldPos(Vector(0, 0, 0))
  L4_12:setSpecTableName("enemy_gen_02")
  L4_12:try_init()
  L4_12:waitForReady()
  L4_12:try_start()
  L4_12:requestSpawn()
  L3_11 = print
  L4_12 = "init all"
  L3_11(L4_12)
  L3_11 = initializeAllGameObjects
  L3_11()
  L3_11 = print
  L4_12 = "wait ready all"
  L3_11(L4_12)
  L3_11 = waitForReadyAllGameObjects
  L3_11()
  L3_11 = print
  L4_12 = "start all"
  L3_11(L4_12)
  L3_11 = startAllGameObjects
  L3_11()
  L3_11 = Debug
  L4_12 = L3_11
  L3_11 = L3_11.setSwitch
  L3_11(L4_12, {"Display", "Debug Draw"}, true)
  L3_11 = Debug
  L4_12 = L3_11
  L3_11 = L3_11.setSwitch
  L3_11(L4_12, {
    "Display",
    "DebugDrawGroup",
    "Enemy"
  }, true)
  L3_11 = Debug
  L4_12 = L3_11
  L3_11 = L3_11.setSwitch
  L3_11(L4_12, {
    "Display",
    "File Asset Status"
  }, false)
  L3_11 = Debug
  L4_12 = L3_11
  L3_11 = L3_11.setSwitch
  L3_11(L4_12, {
    "Display",
    "Warning Indicator"
  }, false)
  L3_11 = Debug
  L4_12 = L3_11
  L3_11 = L3_11.setSwitch
  L3_11(L4_12, {
    "Development",
    "All On"
  }, true)
  L3_11 = Debug
  L4_12 = L3_11
  L3_11 = L3_11.setSwitch
  L3_11(L4_12, {
    "Game Objects",
    "Player",
    "LifePoint: Infinite"
  }, true)
  L3_11 = Debug
  L4_12 = L3_11
  L3_11 = L3_11.setSwitch
  L3_11(L4_12, {
    "Game Objects",
    "Player",
    "SpAttackPoint: Infinite"
  }, true)
  L3_11 = HUD
  L4_12 = L3_11
  L3_11 = L3_11.hpgDispReq_FadeIn
  L3_11(L4_12)
  L3_11 = HUD
  L4_12 = L3_11
  L3_11 = L3_11.grgDispReq_FadeIn
  L3_11(L4_12)
  while true do
    L3_11 = wait
    L3_11()
  end
end
function enemy_base_bg_setup()
  createGameObject2("Area"):setName("dt_a_root")
  createGameObject2("Area"):setSceneParameters("cubemap_03")
  createGameObject2("Area"):setDriftEnable(false)
  createGameObject2("Area"):try_init()
  createGameObject2("Area"):waitForReady()
  createGameObject2("Area"):try_start()
  createGameObject2("Area"):setPos(Vector(0, -2, 0))
end
function setupLocator(A0_13, A1_14)
  local L2_15
  L2_15 = createGameObject2
  L2_15 = L2_15("Node")
  L2_15:setName(A0_13)
  L2_15:setPos(A1_14)
  L2_15:try_init()
  L2_15:waitForReady()
  L2_15:try_start()
  if findGameObject2("Area", "dt_a_root") then
    findGameObject2("Area", "dt_a_root"):appendChild(L2_15)
  end
end
