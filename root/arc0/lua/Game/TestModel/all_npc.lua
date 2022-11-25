import("common")
import("GameDatabase")
import("EventData")
import("Debug")
import("Player")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
_hair_variation = 0
_color_variation = 0
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24
  L0_0 = HUD
  L1_1 = L0_0
  L0_0 = L0_0.menuOpen
  L2_2 = "Main"
  L0_0(L1_1, L2_2)
  L0_0 = invokeTask
  function L1_1()
    local L0_25
    while true do
      L0_25 = Debug
      L0_25 = L0_25.isDebugMenuOpen
      L0_25 = L0_25(L0_25)
      if L0_25 then
        L0_25 = 250
      else
        L0_25 = L0_25 or 50
      end
      Font:debugPrint(L0_25, 40, "name disp : Display >  DebugDrawGroup > Npc : " .. tostring(Debug:getValue({
        "Display",
        "DebugDrawGroup",
        "Npc"
      })))
      wait()
    end
  end
  L0_0(L1_1)
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
  L2_2 = {L3_3, L4_4}
  L3_3 = "Display"
  L4_4 = "Screen Console"
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
  L2_2 = findGameObject2
  L3_3 = "Area"
  L4_4 = "motion_test_stage1_01"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = createGameObject2
  L4_4 = "Node"
  L3_3 = L3_3(L4_4)
  L4_4 = createGameObject2
  L5_5 = "Node"
  L4_4 = L4_4(L5_5)
  L5_5 = createGameObject2
  L6_6 = "Node"
  L5_5 = L5_5(L6_6)
  L6_6 = createGameObject2
  L7_7 = "Node"
  L6_6 = L6_6(L7_7)
  L7_7 = createGameObject2
  L8_8 = "Node"
  L7_7 = L7_7(L8_8)
  L8_8 = createGameObject2
  L9_9 = "Node"
  L8_8 = L8_8(L9_9)
  L9_9 = createGameObject2
  L10_10 = "Node"
  L9_9 = L9_9(L10_10)
  L10_10 = createGameObject2
  L11_11 = "Node"
  L10_10 = L10_10(L11_11)
  L12_12 = L3_3
  L11_11 = L3_3.setName
  L13_13 = "locator2_nonpc"
  L11_11(L12_12, L13_13)
  L12_12 = L4_4
  L11_11 = L4_4.setName
  L13_13 = "locator2_main1"
  L11_11(L12_12, L13_13)
  L12_12 = L5_5
  L11_11 = L5_5.setName
  L13_13 = "locator2_main2"
  L11_11(L12_12, L13_13)
  L12_12 = L6_6
  L11_11 = L6_6.setName
  L13_13 = "locator2_man1"
  L11_11(L12_12, L13_13)
  L12_12 = L7_7
  L11_11 = L7_7.setName
  L13_13 = "locator2_man2"
  L11_11(L12_12, L13_13)
  L12_12 = L8_8
  L11_11 = L8_8.setName
  L13_13 = "locator2_wom"
  L11_11(L12_12, L13_13)
  L12_12 = L9_9
  L11_11 = L9_9.setName
  L13_13 = "locator2_chi"
  L11_11(L12_12, L13_13)
  L12_12 = L10_10
  L11_11 = L10_10.setName
  L13_13 = "locator2_other"
  L11_11(L12_12, L13_13)
  L12_12 = L3_3
  L11_11 = L3_3.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 20
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L12_12 = L4_4
  L11_11 = L4_4.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 25
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L12_12 = L5_5
  L11_11 = L5_5.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 30
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L12_12 = L6_6
  L11_11 = L6_6.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 35
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L12_12 = L7_7
  L11_11 = L7_7.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 40
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L12_12 = L8_8
  L11_11 = L8_8.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 45
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L12_12 = L9_9
  L11_11 = L9_9.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 50
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L12_12 = L10_10
  L11_11 = L10_10.setWorldTransform
  L13_13 = Vector
  L14_14 = -27
  L15_15 = 0
  L16_16 = 55
  L13_13 = L13_13(L14_14, L15_15, L16_16)
  L14_14 = XYZRotQuatD
  L15_15 = 0
  L16_16 = 180
  L17_17 = 0
  L24_24 = L14_14(L15_15, L16_16, L17_17)
  L11_11(L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L14_14(L15_15, L16_16, L17_17))
  L11_11 = initializeAllGameObjects
  L11_11()
  L11_11 = waitForReadyAllGameObjects
  L11_11()
  L11_11 = startAllGameObjects
  L11_11()
  L11_11 = Fn_captionView
  L12_12 = "\227\130\173\227\131\163\227\131\169\228\189\156\230\136\144\228\184\173"
  L13_13 = 0
  L11_11(L12_12, L13_13)
  L11_11 = {
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "kit18",
    "kit19",
    "oth01",
    "cro02",
    "cro05",
    "cro06",
    "uni01",
    "uni02",
    "per01",
    "per02",
    "cow02",
    "ang01",
    "xii01",
    "fel01",
    "vol01"
  }
  L12_12 = "kit02"
  L13_13 = "kit03"
  L14_14 = "kit05"
  L15_15 = "kit06"
  L16_16 = "kit07"
  L17_17 = "kit08"
  L18_18 = "kit09"
  L19_19 = "kit10"
  L23_23 = "kit16"
  L24_24 = "kit17"
  L12_12 = {
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "cid04",
    "cid05",
    "cow01",
    "crow01",
    "cya01",
    "cya02",
    "ele01",
    "ele02",
    "eqo01",
    "eqo02",
    "eug01",
    "gad01"
  }
  L13_13 = "adl01"
  L14_14 = "ali01"
  L15_15 = "auj01"
  L16_16 = "bit01"
  L17_17 = "bit02"
  L18_18 = "bra01"
  L19_19 = "bra02"
  L23_23 = "cid02"
  L24_24 = "cid03"
  L13_13 = {
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "xer01",
    "xer02",
    "yur01",
    "zaz01",
    "zaz02",
    "bab01"
  }
  L14_14 = "kai01"
  L15_15 = "kaj01"
  L16_16 = "kit04"
  L17_17 = "miz01"
  L18_18 = "new01"
  L19_19 = "phi01"
  L23_23 = "sis01"
  L24_24 = "vog01"
  L14_14 = {
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "man26",
    "man30",
    "man31",
    "man32",
    "man33",
    "man34",
    "man35",
    "man36",
    "man37",
    "man38",
    "man39",
    "man40",
    "man41",
    "man42",
    "man43",
    "man44",
    "man45",
    "man46"
  }
  L15_15 = "man01"
  L16_16 = "man02"
  L17_17 = "man05"
  L18_18 = "man07"
  L19_19 = "man08"
  L23_23 = "man18"
  L24_24 = "man25"
  L15_15 = {
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "man56",
    "man57",
    "man61",
    "man62",
    "man63",
    "man64",
    "man65",
    "man66",
    "man67",
    "man68",
    "man69",
    "man70",
    "man71",
    "man73",
    "man74",
    "man75",
    "man76",
    "man77",
    "man78",
    "man79",
    "man80",
    "man81",
    "man82",
    "man83"
  }
  L16_16 = "man47"
  L17_17 = "man48"
  L18_18 = "man49"
  L19_19 = "man50"
  L23_23 = "man54"
  L24_24 = "man55"
  L16_16 = {
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "wom22",
    "wom23",
    "wom24",
    "wom25",
    "wom26",
    "wom27",
    "wom28",
    "wom29",
    "wom30",
    "wom31",
    "wom32",
    "wom33",
    "wom36",
    "wom37",
    "wom38",
    "wom39",
    "wom40",
    "wom41",
    "wom42",
    "wom43",
    "wom44",
    "wom45",
    "wom46",
    "wom47"
  }
  L17_17 = "wom01"
  L18_18 = "wom03"
  L19_19 = "wom04"
  L23_23 = "wom20"
  L24_24 = "wom21"
  L17_17 = {
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "chi20",
    "kid01",
    "kid02",
    "kid03"
  }
  L18_18 = "chi11"
  L19_19 = "chi12"
  L23_23 = "chi16"
  L24_24 = "chi19"
  L18_18 = {
    L19_19,
    L20_20,
    L21_21,
    L22_22,
    L23_23,
    L24_24,
    "duck01",
    "thief",
    "soldier",
    "npc_follower",
    "mcgri",
    "mcstg",
    "fai01"
  }
  L19_19 = "tkg05"
  L23_23 = "dog03"
  L24_24 = "dog04"
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = _createNodes
  L19_19(L20_20, L21_21, L22_22)
  L19_19 = {}
  L20_20(L21_21, L22_22)
  L20_20(L21_21, L22_22)
  L20_20(L21_21, L22_22)
  L20_20(L21_21, L22_22)
  L20_20(L21_21, L22_22)
  L20_20(L21_21, L22_22)
  L20_20(L21_21, L22_22)
  L20_20(L21_21)
  L20_20()
  L20_20()
  L20_20()
  for L23_23, L24_24 in L20_20(L21_21) do
    _createActor(L24_24)
  end
  L20_20(L21_21)
end
function _createNodes(A0_26, A1_27, A2_28)
  local L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38
  L3_29 = findGameObject2
  L4_30 = "Node"
  L5_31 = A1_27
  L3_29 = L3_29(L4_30, L5_31)
  L5_31 = L3_29
  L4_30 = L3_29.getWorldTransform
  L5_31 = L4_30(L5_31)
  for L9_35, L10_36 in L6_32(L7_33) do
    L11_37 = "locator2_"
    L12_38 = L10_36
    L11_37 = L11_37 .. L12_38
    L12_38 = createGameObject2
    L12_38 = L12_38("Node")
    L12_38:setName(L11_37)
    A2_28:appendChild(L12_38)
    L4_30.x = L4_30.x + 1.5
    L12_38:setWorldTransform(L4_30, L5_31)
  end
end
function _insertTable(A0_39, A1_40)
  local L2_41, L3_42, L4_43, L5_44, L6_45
  for L5_44, L6_45 in L2_41(L3_42) do
    table.insert(A0_39, {
      name = L6_45,
      type = L6_45,
      node = "locator2_" .. L6_45,
      hair_variation = _hair_variation,
      color_variation = _color_variation
    })
  end
end
function exitsandbox()
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Npc"
  }, false)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Enemy"
  }, false)
end
setExitCallback(exitsandbox)
function _createActor(A0_46)
  local L1_47, L2_48, L3_49
  L1_47 = findGameObject2
  L2_48 = "Node"
  L3_49 = "locator2_"
  L3_49 = L3_49 .. A0_46
  L1_47 = L1_47(L2_48, L3_49)
  L2_48 = createGameObject2
  L3_49 = "Puppet"
  L2_48 = L2_48(L3_49)
  L3_49 = createGameObject2
  L3_49 = L3_49("ActorBrain")
  invokeTask(function()
    local L0_50
    L0_50 = L2_48
    L0_50 = L0_50.loadModel
    L0_50(L0_50, A0_46 .. "_base")
    L0_50 = false
    if string.sub(A0_46, 1, 3) == "kit" or string.sub(A0_46, 1, 3) == "oth" then
      L2_48:loadBaseSkeleton(A0_46 .. "_base", A0_46 .. "_base")
      L0_50 = L2_48:loadAnimationSet("kit01")
      L2_48:waitForLoading()
    elseif string.sub(A0_46, 1, 3) == "cro" then
      if A0_46 == "cro02" or A0_46 == "cro05" then
        L2_48:loadBaseSkeleton(A0_46 .. "_base")
      else
        L2_48:loadBaseSkeleton(A0_46 .. "_base", A0_46 .. "_base")
      end
      L0_50 = L2_48:loadAnimationSet("cro01")
      L2_48:waitForLoading()
    elseif string.sub(A0_46, 1, 3) == "uni" then
      L2_48:loadBaseSkeleton(A0_46 .. "_base")
      L0_50 = L2_48:loadAnimationSet("unica")
      L2_48:waitForLoading()
    elseif string.sub(A0_46, 1, 3) == "per" then
      L2_48:loadBaseSkeleton(A0_46 .. "_base")
      L0_50 = L2_48:loadAnimationSet("permet")
      L2_48:waitForLoading()
    elseif string.sub(A0_46, 1, 3) == "ang" then
      L2_48:loadBaseSkeleton(A0_46 .. "_base")
      L0_50 = L2_48:loadAnimationSet("durga")
      L2_48:waitForLoading()
    elseif string.sub(A0_46, 1, 3) == "cow" then
      L2_48:loadBaseSkeleton(A0_46 .. "_base")
      L0_50 = L2_48:loadAnimationSet("kali")
      L2_48:waitForLoading()
    else
      L2_48:loadBaseSkeleton(A0_46 .. "_base")
    end
    L2_48:try_init()
    L3_49:try_init()
    L2_48:waitForReady()
    L3_49:waitForReady()
    L2_48:setTransform(L1_47:getWorldTransform())
    L2_48:setBrain(L3_49)
    L2_48:try_start()
    L3_49:try_start()
    if L0_50 then
      L2_48:playPoseAnimation("stay")
    end
  end)
end
