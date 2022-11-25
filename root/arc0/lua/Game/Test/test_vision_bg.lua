test_tv_name = "tv_kk_01"
test_movie_name = "vision/gp_common_01"
test_pos_height = 2
import("math")
import("Debug")
import("Vision")
import("Pad")
import("Sound")
dofile("/Game/Supporter/supporter_spawn.lua")
dofile("/Debug/Action/debug_spawner_register.lua")
dofile("/Debug/Action/debug_stage.lua")
restore_task = nil
function task_restore_bkobj(A0_0)
  A0_0:requestRestore()
  restore_task = nil
end
function createVisionBg(A0_1, A1_2, A2_3, A3_4)
  local L4_5
  L4_5 = nil
  L4_5 = createGameObject2("VisionBg")
  L4_5:setName(A0_1)
  L4_5:setSourceName(test_movie_name)
  L4_5:setDrawModelName(A1_2)
  L4_5:setCollisionName(A1_2)
  L4_5:setAttributeName(A1_2)
  L4_5:setPos(A2_3)
  L4_5:setRot(A3_4)
  return L4_5
end
function main()
  local L0_6, L1_7, L2_8, L3_9, L4_10
  L0_6 = Vector
  L1_7 = -15
  L2_8 = 0.6
  L3_9 = 25
  L0_6 = L0_6(L1_7, L2_8, L3_9)
  L1_7 = Debug
  L2_8 = L1_7
  L1_7 = L1_7.setSwitch
  L3_9 = {
    L4_10,
    "Screen Console"
  }
  L4_10 = "Display"
  L4_10 = false
  L1_7(L2_8, L3_9, L4_10)
  L1_7 = Debug
  L2_8 = L1_7
  L1_7 = L1_7.setSwitch
  L3_9 = {L4_10, "Debug Draw"}
  L4_10 = "Display"
  L4_10 = false
  L1_7(L2_8, L3_9, L4_10)
  L1_7 = Debug
  L2_8 = L1_7
  L1_7 = L1_7.setSwitch
  L3_9 = {
    L4_10,
    "DebugDrawGroup",
    "GimmickBg"
  }
  L4_10 = "Display"
  L4_10 = true
  L1_7(L2_8, L3_9, L4_10)
  L1_7 = Debug
  L2_8 = L1_7
  L1_7 = L1_7.setSwitch
  L3_9 = {
    L4_10,
    "Debug Draw GameObject"
  }
  L4_10 = "Display"
  L4_10 = true
  L1_7(L2_8, L3_9, L4_10)
  L1_7 = Debug
  L2_8 = L1_7
  L1_7 = L1_7.setSwitch
  L3_9 = {
    L4_10,
    "File Asset Status"
  }
  L4_10 = "Display"
  L4_10 = false
  L1_7(L2_8, L3_9, L4_10)
  L1_7 = Debug
  L2_8 = L1_7
  L1_7 = L1_7.setSwitch
  L3_9 = {
    L4_10,
    "Warning Indicator"
  }
  L4_10 = "Display"
  L4_10 = false
  L1_7(L2_8, L3_9, L4_10)
  L1_7 = Sound
  L2_8 = L1_7
  L1_7 = L1_7.loadResource
  L3_9 = "tv_se_jir"
  L1_7(L2_8, L3_9)
  L1_7 = Sound
  L2_8 = L1_7
  L1_7 = L1_7.loadResource
  L3_9 = "tv_se_hex"
  L1_7(L2_8, L3_9)
  L1_7 = DebugStage
  L2_8 = L1_7
  L1_7 = L1_7.createTestStage
  L1_7 = L1_7(L2_8)
  L2_8 = DebugStage
  L3_9 = L2_8
  L2_8 = L2_8.createTestPlayer
  L2_8 = L2_8(L3_9)
  L3_9 = Vector
  L4_10 = L0_6.x
  L4_10 = L4_10 + 4
  L3_9 = L3_9(L4_10, L0_6.y + 2, L0_6.z)
  L4_10 = createVisionBg
  L4_10 = L4_10("tv_kk_01_01", test_tv_name, L3_9, XYZRotQuaternionEular(0, -90, 0))
  createVisionBg("tv1_po_01", test_tv_name, L3_9 + Vector(0, 0, 6), XYZRotQuaternionEular(0, -90, 0))
  createVisionBg("tv3_po_03", test_tv_name, L3_9 + Vector(-6, 0, 10), XYZRotQuaternionEular(0, -180, 0))
  createVisionBg("tv3_po_401", test_tv_name, L3_9 + Vector(-12, 0, 10), XYZRotQuaternionEular(0, -180, 0))
  createVisionBg("tv1_skyscraper_kw_04b_1", test_tv_name, L3_9 + Vector(-18, 0, 6), XYZRotQuaternionEular(0, -270, 0))
  print("init all")
  initializeAllGameObjects()
  VisionBg:globalTvScheduleName("gp_common", nil)
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  invokeTask(function()
    local L0_11, L1_12
    L0_11 = 0
    L1_12 = 0
    while true do
      if L4_10 ~= nil and restore_task == nil and L4_10:isBroken() then
        L1_12 = L1_12 + 1
        if L1_12 > 300 then
          L1_12 = 0
          restore_task = invokeTask(task_restore_bkobj, L4_10)
        end
      end
      wait()
    end
  end)
  invokeTask(function()
    while true do
      if Pad:getButton(Pad.kButton_RU) then
        VisionBg:globalTvScheduleName("gp_common", nil)
      end
      if Pad:getButton(Pad.kButton_RL) and L4_10 ~= nil then
        L4_10:setOverwriteDefaultTvScheduleName(nil)
        VisionBg:globalTvScheduleName(nil)
      end
      if Pad:getButton(Pad.kButton_RR) and L4_10 ~= nil then
        VisionBg:broadcast(nil, "ui_debug")
      end
      if Pad:getButton(Pad.kButton_RD) and L4_10 ~= nil then
        VisionBg:globalTvScheduleName("hx_pleajeune")
      end
      wait()
    end
  end)
end
