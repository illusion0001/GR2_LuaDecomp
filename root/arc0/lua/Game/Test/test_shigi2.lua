import("math")
import("Debug")
import("Area")
import("EventData")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  local L0_0, L1_1, L2_2
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setDriftRatioTrans
  L2_2 = 1
  L0_0(L1_1, L2_2)
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setDriftRatioRot
  L2_2 = 1
  L0_0(L1_1, L2_2)
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L1_1(L2_2, "test_z_root2")
  L2_2 = L0_0
  L1_1 = L0_0.setEnableDebugDraw
  L1_1(L2_2, true)
  L2_2 = L0_0
  L1_1 = L0_0.setDriftParams
  L1_1(L2_2, {
    xz = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0.8,
      min_a = 0.1,
      max_t = 30,
      min_t = 10
    },
    y = {
      rand = 1,
      sign = 0.85,
      max_a = 1,
      min_a = 0.5,
      max_t = 10,
      min_t = 5
    },
    angle = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0,
      min_a = 0,
      max_t = 120,
      min_t = 30
    }
  })
  L2_2 = L0_0
  L1_1 = L0_0.setDriftInherit
  L1_1(L2_2, true)
  L2_2 = L0_0
  L1_1 = L0_0.setDriftEnable
  L1_1(L2_2, false)
  L1_1 = createGameObject2
  L2_2 = "TerrainBg"
  L1_1 = L1_1(L2_2)
  test_sky = L1_1
  L1_1 = test_sky
  L2_2 = L1_1
  L1_1 = L1_1.setName
  L1_1(L2_2, "sky_ux_01")
  L1_1 = test_sky
  L2_2 = L1_1
  L1_1 = L1_1.setModelName
  L1_1(L2_2, "sky_ux_01")
  L2_2 = L0_0
  L1_1 = L0_0.appendChild
  L1_1(L2_2, test_sky)
  L1_1 = DebugStage
  L2_2 = L1_1
  L1_1 = L1_1.createTestPlayer
  L1_1 = L1_1(L2_2, Vector(-15, 1, 0), YRotQuaternion(Deg2Rad(0)))
  L2_2 = start_game_obj
  L2_2()
  L2_2 = Debug
  L2_2 = L2_2.setSwitch
  L2_2(L2_2, {
    "Display",
    "Screen Console"
  }, false)
  L2_2 = Debug
  L2_2 = L2_2.setSwitch
  L2_2(L2_2, {"Display", "Debug Draw"}, false)
  L2_2 = Debug
  L2_2 = L2_2.setSwitch
  L2_2(L2_2, {
    "Display",
    "File Asset Status"
  }, false)
  L2_2 = Debug
  L2_2 = L2_2.setSwitch
  L2_2(L2_2, {
    "Display",
    "Warning Indicator"
  }, false)
  L2_2 = createGameObject2
  L2_2 = L2_2("Area")
  freighter_handle = L2_2
  L2_2 = freighter_handle
  L2_2 = L2_2.setName
  L2_2(L2_2, "ve_a")
  L2_2 = freighter_handle
  L2_2 = L2_2.try_init
  L2_2(L2_2)
  L2_2 = freighter_handle
  L2_2 = L2_2.waitForReady
  L2_2(L2_2)
  L2_2 = freighter_handle
  L2_2 = L2_2.try_start
  L2_2(L2_2)
  L2_2 = createGameObject2
  L2_2 = L2_2("Effect")
  L2_2:loadModel("ef_ev_smk_06")
  L2_2:setLoop(true)
  L2_2:play()
  L2_2:setActive(true)
  L2_2:try_init()
  L2_2:waitForReady()
  L2_2:try_start()
  invokeTask(function()
    local L0_3
    L0_3 = Vector
    L0_3 = L0_3(0, 0, 20)
    while true do
      L2_2:setPos(L0_3)
      L0_3.x = L0_3.x + 0.5
      if L0_3.x > 30 then
        L0_3.x = 0
      end
      wait()
    end
  end)
  start_game_obj()
  Area:setAnimMoveDriftEnable(true)
end
