import("common")
import("GameDatabase")
import("EventData")
import("Debug")
import("Player")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
  L0_0 = HUD
  L1_1 = L0_0
  L0_0 = L0_0.menuOpen
  L2_2 = "Main"
  L0_0(L1_1, L2_2)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
  L4_4 = "File Asset Status"
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
  L4_4 = "Warning Indicator"
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
  L4_4 = "Debug Draw"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Gfx"
  L4_4 = "ModelList"
  L5_5 = "ModelName Display"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Debug
  L1_1 = L0_0
  L0_0 = L0_0.setSwitch
  L2_2 = {
    L3_3,
    L4_4,
    L5_5
  }
  L3_3 = "Development"
  L4_4 = "Console"
  L5_5 = "Script"
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = createSandbox2
  L1_1 = "father2"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setString
  L3_3 = "g_filename"
  L4_4 = "/Game/Event2/father2.lua"
  L1_1(L2_2, L3_3, L4_4)
  L2_2 = L0_0
  L1_1 = L0_0.try_init
  L1_1(L2_2)
  L2_2 = L0_0
  L1_1 = L0_0.waitForReady
  L1_1(L2_2)
  L2_2 = L0_0
  L1_1 = L0_0.try_start
  L1_1(L2_2)
  while true do
    L2_2 = L0_0
    L1_1 = L0_0.sendEvent
    L3_3 = "isPcSpawned"
    L1_1 = L1_1(L2_2, L3_3)
    if not L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L0_0 = nil
  L1_1 = DebugStage
  L2_2 = L1_1
  L1_1 = L1_1.createTestStage
  L1_1 = L1_1(L2_2)
  L3_3 = L1_1
  L2_2 = L1_1.setDriftEnable
  L4_4 = false
  L2_2(L3_3, L4_4)
  L2_2 = createGameObject2
  L3_3 = "Node"
  L2_2 = L2_2(L3_3)
  L3_3 = createGameObject2
  L4_4 = "Node"
  L3_3 = L3_3(L4_4)
  L4_4 = createGameObject2
  L5_5 = "Node"
  L4_4 = L4_4(L5_5)
  L6_6 = L2_2
  L5_5 = L2_2.setName
  L7_7 = "locator2_marker_def_01"
  L5_5(L6_6, L7_7)
  L6_6 = L3_3
  L5_5 = L3_3.setName
  L7_7 = "locator2_marker_a_01"
  L5_5(L6_6, L7_7)
  L6_6 = L4_4
  L5_5 = L4_4.setName
  L7_7 = "locator2_marker_b_01"
  L5_5(L6_6, L7_7)
  L6_6 = L2_2
  L5_5 = L2_2.setTransform
  L7_7 = Vector
  L8_8 = -25
  L7_7 = L7_7(L8_8, L9_9, L10_10)
  L8_8 = Quaternion
  L12_12 = 1
  L13_13 = L8_8(L9_9, L10_10, L11_11, L12_12)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L8_8(L9_9, L10_10, L11_11, L12_12))
  L6_6 = L3_3
  L5_5 = L3_3.setTransform
  L7_7 = Vector
  L8_8 = -25
  L7_7 = L7_7(L8_8, L9_9, L10_10)
  L8_8 = Quaternion
  L12_12 = 1
  L13_13 = L8_8(L9_9, L10_10, L11_11, L12_12)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L8_8(L9_9, L10_10, L11_11, L12_12))
  L6_6 = L4_4
  L5_5 = L4_4.setTransform
  L7_7 = Vector
  L8_8 = -25
  L7_7 = L7_7(L8_8, L9_9, L10_10)
  L8_8 = Quaternion
  L12_12 = 1
  L13_13 = L8_8(L9_9, L10_10, L11_11, L12_12)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L8_8(L9_9, L10_10, L11_11, L12_12))
  L5_5 = initializeAllGameObjects
  L5_5()
  L5_5 = waitForReadyAllGameObjects
  L5_5()
  L5_5 = startAllGameObjects
  L5_5()
  L5_5 = Fn_captionView
  L6_6 = "\227\131\158\227\131\188\227\130\171\227\131\188\228\189\156\230\136\144\228\184\173"
  L7_7 = 0
  L5_5(L6_6, L7_7)
  L5_5 = {
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    "gui_marker_09",
    "gui_marker_10",
    "gui_marker_11",
    "gui_marker_12",
    "gui_marker_20",
    "gui_marker_23",
    "gui_marker_30",
    "gui_marker_21",
    "gui_marker_22",
    "gui_marker_24",
    "gui_marker_25"
  }
  L6_6 = "gui_marker_01"
  L7_7 = "gui_marker_02"
  L8_8 = "gui_marker_03"
  L12_12 = "gui_marker_07"
  L13_13 = "gui_marker_08"
  L6_6 = findGameObject2
  L7_7 = "Node"
  L8_8 = "locator2_marker_def_01"
  L6_6 = L6_6(L7_7, L8_8)
  L7_7 = findGameObject2
  L8_8 = "Node"
  L7_7 = L7_7(L8_8, L9_9)
  L8_8 = findGameObject2
  L8_8 = L8_8(L9_9, L10_10)
  for L12_12, L13_13 in L9_9(L10_10) do
    _createNewMarker(L13_13, L12_12, L6_6, "default")
    _createNewMarker(L13_13, L12_12, L7_7, "A")
    _createNewMarker(L13_13, L12_12, L8_8, "B")
  end
  L9_9()
  L9_9()
  L9_9()
  L9_9(L10_10)
end
function _createNewMarker(A0_14, A1_15, A2_16, A3_17)
  local L4_18
  L4_18 = A2_16.getWorldPos
  L4_18 = L4_18(A2_16)
  L4_18.x = L4_18.x + 4 * A1_15
  createGameObject2("MapMarker"):setName(A0_14)
  createGameObject2("MapMarker"):setAssetName(A0_14)
  createGameObject2("MapMarker"):setupPattern(A3_17)
  createGameObject2("MapMarker"):setPos(L4_18)
end
function exitsandbox()
  Debug:setSwitch({
    "Gfx",
    "ModelList",
    "ModelName Display"
  }, false)
end
setExitCallback(exitsandbox)
