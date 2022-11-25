import("common")
import("GameDatabase")
import("EventData")
import("HUD")
import("Ugc")
import("Wind")
import("Player")
import("Debug")
import("Font")
import("Pad")
import("Sound")
import("Replay")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
_test_node = nil
_floor = 1
function main()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "ScriptQuery"
  }, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "ScriptDebugDraw"
  }, true)
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  createSandbox2("father2"):setString("g_filename", "/Game/Event2/father2.lua")
  createSandbox2("father2"):try_init()
  createSandbox2("father2"):waitForReady()
  createSandbox2("father2"):try_start()
  while not createSandbox2("father2"):sendEvent("isPcSpawned") do
    wait()
  end
  sb_mineManager = createSandbox2("mineManager")
  sb_mineManager:setString("g_filename", "/Game/Event2/minemanager.lua")
  sb_mineManager:try_init()
  invokeSystemTask(function()
    sb_mineManager:waitForReady()
    sb_mineManager:try_start()
  end)
  DebugStage:createTestStage():setDriftEnable(false)
  HUD:stackTelopStart()
  createGameObject2("Node"):setName("testnode")
  createGameObject2("Node"):setPos(Vector(0, 0, 30))
  createGameObject2("Node"):try_init()
  createGameObject2("Node"):waitForReady()
  createGameObject2("Node"):try_start()
  setEntranceForInfinityMining("mine01")
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function setEntranceForInfinityMining(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L1_1 = _sensor_hdl
  if L1_1 then
    L1_1 = _sensor_hdl
    L2_2 = L1_1
    L1_1 = L1_1.try_term
    L1_1(L2_2)
    _sensor_hdl = nil
  end
  L1_1 = _marker_hdl
  if L1_1 then
    L1_1 = _marker_hdl
    L2_2 = L1_1
    L1_1 = L1_1.try_term
    L1_1(L2_2)
    _marker_hdl = nil
  end
  L1_1 = _node_hdl
  if L1_1 then
    L1_1 = _node_hdl
    L2_2 = L1_1
    L1_1 = L1_1.try_term
    L1_1(L2_2)
    _node_hdl = nil
  end
  L1_1 = "testnode"
  L2_2 = findGameObject2
  L3_3 = "Node"
  L4_4 = L1_1
  L5_5 = true
  L2_2 = L2_2(L3_3, L4_4, L5_5)
  if L2_2 == nil then
    L3_3 = print
    L4_4 = A0_0
    L5_5 = " : "
    L6_6 = L1_1
    L7_7 = "\239\188\154\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147"
    L4_4 = L4_4 .. L5_5 .. L6_6 .. L7_7
    L3_3(L4_4)
    return
  end
  L3_3 = Fn_createEffect
  L4_4 = "ef_ev_bk_mgn"
  L5_5 = "ef_ev_bk_mgn"
  L7_7 = L2_2
  L6_6 = L2_2.getWorldPos
  L6_6 = L6_6(L7_7)
  L7_7 = Vector
  L8_8 = 0
  L9_9 = 1
  L10_10 = 0
  L7_7 = L7_7(L8_8, L9_9, L10_10)
  L6_6 = L6_6 + L7_7
  L7_7 = true
  L3_3 = L3_3(L4_4, L5_5, L6_6, L7_7)
  L4_4 = {}
  L4_4.target = L2_2
  L4_4.find_type = "Node"
  L5_5 = {}
  L5_5.name = "gui_marker_10"
  L6_6 = string
  L6_6 = L6_6.format
  L7_7 = "ui_acdialog_main_mine99_%02d"
  L8_8 = _floor
  L8_8 = L8_8 + 1
  L6_6 = L6_6(L7_7, L8_8)
  L5_5.ad_title_id = L6_6
  L5_5.ad_sub_id = "ui_acdialog_sub_11"
  L5_5.map_title_id = "ui_map_header_sk_09"
  L6_6 = string
  L6_6 = L6_6.format
  L7_7 = "ui_map_header_ms_%03d"
  L8_8 = _floor
  L8_8 = L8_8 + 1
  L6_6 = L6_6(L7_7, L8_8)
  L5_5.map_sub_id = L6_6
  L5_5.giude_id = "ui_keyguide_ac_00"
  L5_5.alert_id = "ui_acdialog_alert_01"
  L5_5.pattern = "A"
  L5_5.map_disp = false
  L5_5.active = true
  L6_6, L7_7, L8_8, L9_9, L10_10 = nil, nil, nil, nil, nil
  function L11_11()
    local L0_12, L1_13, L2_14, L3_15
    L0_12 = getMarkerHandle
    L1_13 = L2_2
    L0_12 = L0_12(L1_13)
    L2_14 = L0_12
    L1_13 = L0_12.playOut
    L1_13(L2_14)
    repeat
      L1_13 = wait
      L1_13()
      L2_14 = L0_12
      L1_13 = L0_12.isOutEnd
      L1_13 = L1_13(L2_14)
    until L1_13
    L1_13 = false
    L2_14 = false
    L3_15 = yesno
    if L3_15 then
      L2_14 = true
      L3_15 = Fn_userCtrlOff
      L3_15()
      L3_15 = HUD
      L3_15 = L3_15.yesnoOpen
      L3_15(L3_15, yesno)
      L3_15 = nil
      while true do
        L3_15 = HUD:yesnoResult()
        if L3_15 ~= nil then
          if L3_15 == HUD.kYesNoAnswerYes then
            L1_13 = true
          elseif L3_15 == HUD.kYesNoAnswerNo then
          end
        else
          wait()
          else
            L1_13 = true
          end
        end
      end
    if L2_14 then
      L3_15 = Fn_userCtrlOn
      L3_15()
    end
    if L1_13 then
      L3_15 = HUD
      L3_15 = L3_15.blackout
      L3_15(L3_15, 1)
      L3_15 = waitSeconds
      L3_15(1)
      L3_15 = Fn_naviKill
      L3_15()
    else
      L3_15 = L0_12.playIn
      L3_15(L0_12)
    end
  end
  _sensor_hdl, _marker_hdl, _node_hdl = setupMarkerBase(L4_4, L5_5, L11_11)
end
