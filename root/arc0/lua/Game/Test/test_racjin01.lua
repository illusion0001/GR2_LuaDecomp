local L1_1, L2_2
L0_0 = import
L1_1 = "common"
L0_0(L1_1)
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0 = import
L1_1 = "EventData"
L0_0(L1_1)
L0_0 = import
L1_1 = "Pad"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "Font"
L0_0(L1_1)
L0_0 = import
L1_1 = "Sound"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Action/debug_stage.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/HUDCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/TutorialCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/CommonAll.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/PlayerCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/NpcCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Misc/balloon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/CameraCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/ScriptCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Mission/rac_common.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Misc/sdemo.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Npc/npc.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Mission/rac_common.lua"
L0_0(L1_1)
L0_0 = {
  L1_1,
  L2_2,
  "gui_marker_03",
  "gui_marker_04",
  "gui_marker_05",
  "gui_marker_06",
  "gui_marker_07",
  "gui_marker_08",
  "gui_marker_09",
  "gui_marker_10",
  "gui_marker_20",
  "gui_marker_21",
  "gui_marker_22",
  "gui_marker_23",
  "gui_marker_24",
  "gui_marker_30"
}
L1_1 = "gui_marker_01"
L2_2 = "gui_marker_02"
function L1_1()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11
  L0_3 = Fn_userCtrlAllOff
  L0_3()
  L0_3 = findGameObject2
  L1_4 = "Node"
  L2_5 = "locator2_map_marker_01"
  L0_3 = L0_3(L1_4, L2_5)
  L1_4 = findGameObject2
  L2_5 = "Node"
  L3_6 = "locator2_map_marker_02"
  L1_4 = L1_4(L2_5, L3_6)
  L2_5 = findGameObject2
  L3_6 = "Node"
  L2_5 = L2_5(L3_6, L4_7)
  L3_6 = findGameObject2
  L3_6 = L3_6(L4_7, L5_8)
  for L7_10, L8_11 in L4_7(L5_8) do
    createNewMarker(L8_11, L7_10, L0_3, "default")
    createNewMarker(L8_11, L7_10, L1_4, "A")
    createNewMarker(L8_11, L7_10, L2_5, "B")
    createNewMarker(L8_11, L7_10, L3_6, "C")
  end
  L8_11 = L4_7
  L7_10 = L4_7.getLocalAabb
  L7_10 = L7_10(L8_11)
  L8_11 = L5_8.y
  L8_11 = L8_11 - (L7_10.max.y - L7_10.min.y) * 0.5
  L5_8.y = L8_11
  L8_11 = RAC_createGameObject2
  L8_11 = L8_11("sensor_maker", "MapMarker", L5_8, L6_9)
  test_sensor_marker = L8_11
  L8_11 = test_sensor_marker
  L8_11 = L8_11.setAssetName
  L8_11(L8_11, "gui_marker_30")
  L8_11 = test_sensor_marker
  L8_11 = L8_11.setupPattern
  L8_11(L8_11, "C", L7_10.max - L7_10.min)
  L8_11 = test_sensor_marker
  L8_11 = L8_11.setActive
  L8_11(L8_11, true)
end
Initialize = L1_1
function L1_1()
  Fn_userCtrlOn()
  while true do
    wait()
  end
end
Ingame = L1_1
function L1_1(A0_12, A1_13, A2_14, A3_15)
  local L4_16
  L4_16 = A2_14.getWorldPos
  L4_16 = L4_16(A2_14)
  L4_16.x = L4_16.x + 3 * A1_13
  createGameObject2("MapMarker"):setName(A0_12)
  createGameObject2("MapMarker"):setAssetName(A0_12)
  createGameObject2("MapMarker"):setupPattern(A3_15)
  createGameObject2("MapMarker"):setPos(L4_16)
end
createNewMarker = L1_1
function L1_1()
  local L0_17, L1_18, L2_19, L3_20
  L0_17 = Debug
  L1_18 = L0_17
  L0_17 = L0_17.setSwitch
  L2_19 = {
    L3_20,
    "Console",
    "Script"
  }
  L3_20 = "Development"
  L3_20 = true
  L0_17(L1_18, L2_19, L3_20)
  L0_17 = Debug
  L1_18 = L0_17
  L0_17 = L0_17.setSwitch
  L2_19 = {
    L3_20,
    "Screen Console"
  }
  L3_20 = "Display"
  L3_20 = false
  L0_17(L1_18, L2_19, L3_20)
  L0_17 = Debug
  L1_18 = L0_17
  L0_17 = L0_17.setSwitch
  L2_19 = {
    L3_20,
    "File Asset Status"
  }
  L3_20 = "Display"
  L3_20 = false
  L0_17(L1_18, L2_19, L3_20)
  L0_17 = Debug
  L1_18 = L0_17
  L0_17 = L0_17.setSwitch
  L2_19 = {
    L3_20,
    "Warning Indicator"
  }
  L3_20 = "Display"
  L3_20 = false
  L0_17(L1_18, L2_19, L3_20)
  L0_17 = createSandbox2
  L1_18 = "father2"
  L0_17 = L0_17(L1_18)
  L2_19 = L0_17
  L1_18 = L0_17.setString
  L3_20 = "g_filename"
  L1_18(L2_19, L3_20, "/Game/Event2/father2.lua")
  L2_19 = L0_17
  L1_18 = L0_17.try_init
  L1_18(L2_19)
  L2_19 = L0_17
  L1_18 = L0_17.waitForReady
  L1_18(L2_19)
  L2_19 = L0_17
  L1_18 = L0_17.try_start
  L1_18(L2_19)
  while true do
    L2_19 = L0_17
    L1_18 = L0_17.sendEvent
    L3_20 = "isPcSpawned"
    L1_18 = L1_18(L2_19, L3_20)
    if not L1_18 then
      L1_18 = wait
      L1_18()
    end
  end
  L1_18 = DebugStage
  L2_19 = L1_18
  L1_18 = L1_18.createTestStage
  L1_18(L2_19)
  L1_18 = loadFileAsset
  L2_19 = "evb"
  L3_20 = "evx/test_racjin01"
  L1_18 = L1_18(L2_19, L3_20)
  L2_19, L3_20 = nil, nil
  if L1_18 ~= nil then
    L1_18:wait()
    L2_19 = L1_18:getRoot()
    L3_20 = EventData:create("test_racjin01", nil, L2_19)
    L3_20:try_init()
    L3_20:waitForReady()
    L3_20:try_start()
  end
  Initialize()
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  GameDatabase:reset(ggd.GlobalSystemFlags)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  invokeTask(function()
    Ingame()
  end)
end
main = L1_1
L1_1 = nil
L2_2 = "bort_fly"
function pccubesensor2_test_01_OnEnter(A0_21)
  print("pccubesensor2_OnEnter.." .. A0_21:getName())
  if L1_1 == nil then
    print("playSEHandle.." .. L2_2)
    L1_1 = Sound:playSEHandle(L2_2, 1, nil, A0_21:getWorldPos())
  end
end
function pccubesensor2_test_01_OnLeave(A0_22)
  print("pccubesensor2_OnLeave.." .. A0_22:getName())
  if L1_1 ~= nil then
    print("stopSEHandle.." .. L2_2)
    Sound:stopSEHandle(L1_1)
    L1_1 = nil
  end
end
