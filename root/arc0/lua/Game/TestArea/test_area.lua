import("math")
import("Debug")
import("Area")
import("HUD")
import("Vehicle")
import("EventData")
import("Player")
import("Sound")
import("Pad")
import("GameDatabase")
import("Font")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Event2/Common/WaterCommon.lua")
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
  L0_0 = map_name
  if L0_0 then
    L0_0 = HUD
    L1_1 = L0_0
    L0_0 = L0_0.menuOpen
    L2_2 = "Main"
    L0_0(L1_1, L2_2)
  end
  L0_0 = HUD
  L1_1 = L0_0
  L0_0 = L0_0.blackout
  L2_2 = 0
  L0_0(L1_1, L2_2)
  L0_0 = HUD
  L1_1 = L0_0
  L0_0 = L0_0.accessBegin
  L0_0(L1_1)
  L0_0 = Vector
  L1_1 = 0
  L2_2 = 4.1
  L3_3 = 0
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  org = L0_0
  L0_0 = test_area
  if L0_0 == nil then
    test_area = "bu_a_root"
    L0_0 = Vector
    L1_1 = 4
    L2_2 = -3.95
    L3_3 = -1.75
    L0_0 = L0_0(L1_1, L2_2, L3_3)
    org = L0_0
  end
  L0_0 = drift_ratio_trans
  if L0_0 == nil then
    drift_ratio_trans = 1
  end
  L0_0 = drift_ratio_rot
  if L0_0 == nil then
    drift_ratio_rot = 0
  end
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setDriftRatioTrans
  L2_2 = drift_ratio_trans
  L0_0(L1_1, L2_2)
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setDriftRatioRot
  L2_2 = drift_ratio_rot
  L0_0(L1_1, L2_2)
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setAnimMoveDriftEnable
  L2_2 = false
  L3_3 = false
  L4_4 = false
  L0_0(L1_1, L2_2, L3_3, L4_4)
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L3_3 = test_area
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setAreaGroup
  L3_3 = "TestArea"
  L1_1(L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.setEnableDebugDraw
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = map_name
  if L1_1 then
    L2_2 = L0_0
    L1_1 = L0_0.setAreaGroup
    L3_3 = map_name
    L4_4 = true
    L1_1(L2_2, L3_3, L4_4)
    L1_1 = GameDatabase
    L2_2 = L1_1
    L1_1 = L1_1.set
    L3_3 = ggd
    L3_3 = L3_3.Menu__MapName
    L4_4 = map_name
    L1_1(L2_2, L3_3, L4_4)
  end
  L1_1, L2_2, L3_3, L4_4 = nil, nil, nil, nil
  L5_5 = tsg_set
  if L5_5 == true then
    L5_5 = createGameObject2
    L6_6 = "Area"
    L5_5 = L5_5(L6_6)
    L1_1 = L5_5
    L6_6 = L1_1
    L5_5 = L1_1.setName
    L7_7 = "bu_d_root"
    L5_5(L6_6, L7_7)
    L6_6 = L1_1
    L5_5 = L1_1.connectToLocation
    L7_7 = L0_0
    L5_5(L6_6, L7_7, L8_8, L9_9, L10_10)
    L5_5 = createCraneShip
    L6_6 = L0_0
    L7_7 = "po_a_01"
    L5_5 = L5_5(L6_6, L7_7, L8_8)
    L2_2 = L5_5
    L5_5 = createCraneCage
    L6_6 = L2_2
    L6_6 = L5_5(L6_6)
    L4_4 = L6_6
    L3_3 = L5_5
  end
  L5_5 = driftParams
  if L5_5 ~= nil then
    L6_6 = L0_0
    L5_5 = L0_0.setDriftParams
    L7_7 = driftParams
    L5_5(L6_6, L7_7)
  else
    L5_5 = tsg_set
    if L5_5 == true then
      L6_6 = L0_0
      L5_5 = L0_0.setDriftParams
      L7_7 = DRIFT_PARAM_JILGA_A
      L5_5(L6_6, L7_7)
    else
      L6_6 = L0_0
      L5_5 = L0_0.setDriftParams
      L7_7 = {}
      L8_8.rand = 0.5
      L8_8.sign = 0.5
      L8_8.max_a = 2
      L8_8.min_a = 0.1
      L8_8.max_t = 30
      L8_8.min_t = 10
      L7_7.xz = L8_8
      L8_8.rand = 0.5
      L8_8.sign = 0.85
      L8_8.max_a = 5
      L8_8.min_a = 4.1
      L8_8.max_t = 60
      L8_8.min_t = 30
      L7_7.y = L8_8
      L8_8.rand = 0.5
      L8_8.sign = 0.5
      L8_8.max_a = 15
      L8_8.min_a = 0
      L8_8.max_t = 120
      L8_8.min_t = 30
      L7_7.angle = L8_8
      L5_5(L6_6, L7_7)
    end
  end
  L6_6 = L0_0
  L5_5 = L0_0.setDriftInherit
  L7_7 = true
  L5_5(L6_6, L7_7)
  L6_6 = L0_0
  L5_5 = L0_0.setDriftEnable
  L7_7 = false
  L5_5(L6_6, L7_7)
  L5_5 = tsg_set
  if L5_5 == true and L1_1 ~= nil then
    L6_6 = L1_1
    L5_5 = L1_1.setDriftParams
    L7_7 = DRIFT_PARAM_BUNGUA_B
    L5_5(L6_6, L7_7)
    L6_6 = L1_1
    L5_5 = L1_1.setDriftInherit
    L7_7 = true
    L5_5(L6_6, L7_7)
    L6_6 = L1_1
    L5_5 = L1_1.setDriftEnable
    L7_7 = false
    L5_5(L6_6, L7_7)
    L5_5 = wireBind
    L6_6 = L3_3
    L7_7 = L4_4
    L5_5(L6_6, L7_7, L8_8, L9_9)
  end
  L5_5 = DebugStage
  L6_6 = L5_5
  L5_5 = L5_5.createTestPlayer
  L7_7 = L5_5(L6_6)
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L8_8(L9_9)
  L8_8()
  L8_8(L9_9)
  L8_8()
  L8_8(L9_9)
  L8_8()
  if L8_8 then
    L11_11 = sign_area
    L9_9(L10_10, L11_11)
    L11_11 = sign_area
    L9_9(L10_10, L11_11)
    L11_11 = 200
    L9_9(L10_10, L11_11)
    L11_11 = false
    L9_9(L10_10, L11_11)
    L11_11 = false
    L9_9(L10_10, L11_11)
    L9_9()
    L9_9()
    L9_9()
    while true do
      if L9_9 then
        L9_9()
      end
    end
    L11_11 = L8_8
    L9_9(L10_10, L11_11)
    L12_12 = L0_0
    L11_11 = L0_0.getNodeLocalPosRot
    L13_13 = sign_area
    L14_14 = "_01"
    L13_13 = L13_13 .. L14_14
    L18_18 = L11_11(L12_12, L13_13)
    L9_9(L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L11_11(L12_12, L13_13))
    L9_9(L10_10)
    L11_11 = true
    L9_9(L10_10, L11_11)
    L11_11 = true
    L9_9(L10_10, L11_11)
  end
  L8_8(L9_9, L10_10)
  if L8_8 then
    if L8_8 == "lo_a" then
      L8_8()
    elseif L8_8 == "up_a" then
      L8_8()
    elseif L8_8 == "go_a" then
      L8_8()
    elseif L8_8 == "po_a" then
      L8_8()
      L8_8(L9_9)
    elseif L8_8 == "mi_a" then
      L8_8()
    elseif L8_8 == "cc_a" then
      L8_8()
    elseif L8_8 == "dt_a" then
      L8_8()
    elseif L8_8 == "ed_a" then
      L8_8()
    elseif L8_8 == "wa_a" then
      L8_8()
    end
    L8_8(L9_9)
    L8_8()
    L8_8(L9_9)
    L8_8()
    L8_8(L9_9)
    L8_8()
  end
  if L8_8 then
    L8_8(L9_9)
  end
  if L8_8 then
    L8_8(L9_9)
  end
  if L8_8 then
    L8_8(L9_9)
  end
  if L8_8 == "string" then
    L8_8(L9_9)
  elseif L8_8 == "table" then
    for L11_11, L12_12 in L8_8(L9_9) do
      L13_13 = invokeTask
      function L14_14()
        local L0_19, L1_20, L2_21
        L0_19 = loadFileAsset
        L1_20 = "evb"
        L2_21 = "evx/"
        L2_21 = L2_21 .. L12_12
        L0_19 = L0_19(L1_20, L2_21)
        if L0_19 then
          L2_21 = L0_19
          L1_20 = L0_19.wait
          L1_20(L2_21)
          L2_21 = L0_19
          L1_20 = L0_19.getRoot
          L1_20 = L1_20(L2_21)
          L2_21 = nil
          while true do
            if GameDatabase:get(ggd.Debug__ScriptObj) then
              if not L2_21 then
                L2_21 = EventData:create(L12_12, nil, L1_20)
                L2_21:try_init()
                L2_21:waitForReady()
                L2_21:try_start()
              end
            elseif L2_21 then
              L2_21:try_term()
              L2_21 = nil
            end
            wait()
          end
        end
      end
      L13_13(L14_14)
      break
    end
  end
  L11_11 = "Display"
  L12_12 = "Screen Console"
  L11_11 = false
  L8_8(L9_9, L10_10, L11_11)
  L11_11 = "Display"
  L12_12 = "DebugDrawGroup"
  L13_13 = "Area"
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L11_11 = "Display"
  L12_12 = "File Asset Status"
  L11_11 = false
  L8_8(L9_9, L10_10, L11_11)
  L11_11 = "Display"
  L12_12 = "Warning Indicator"
  L11_11 = false
  L8_8(L9_9, L10_10, L11_11)
  L11_11 = "Development"
  L12_12 = "Console"
  L13_13 = "Gfx"
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L11_11 = "Development"
  L12_12 = "Console"
  L13_13 = "Script"
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
  L11_11 = target_area_name
  L11_11 = L0_0
  L12_12 = target_area2_name
  L11_11 = L9_9
  if L8_8 ~= nil then
    L13_13 = L8_8
    L12_12 = L8_8.setDriftParams
    L14_14 = {}
    L15_15.rand = 0.5
    L15_15.sign = 0.5
    L15_15.max_a = 2
    L15_15.min_a = 0.1
    L15_15.max_t = 30
    L15_15.min_t = 10
    L14_14.xz = L15_15
    L15_15.rand = 0.5
    L15_15.sign = 0.85
    L15_15.max_a = 20
    L15_15.min_a = 10
    L15_15.max_t = 5
    L15_15.min_t = 1
    L14_14.y = L15_15
    L15_15.rand = 0.5
    L15_15.sign = 0.5
    L15_15.max_a = 150
    L15_15.min_a = 100
    L15_15.max_t = 5
    L15_15.min_t = 1
    L14_14.angle = L15_15
    L12_12(L13_13, L14_14)
    L12_12 = move_list
    if L12_12 then
      L13_13 = L8_8
      L12_12 = L8_8.beginMoveTargets
      L12_12(L13_13)
      L13_13 = L8_8
      L12_12 = L8_8.appendMoveTarget
      L14_14 = L9_9
      L12_12(L13_13, L14_14)
      L13_13 = L8_8
      L12_12 = L8_8.appendMoveTarget
      L14_14 = L10_10
      L12_12(L13_13, L14_14)
      L13_13 = L8_8
      L12_12 = L8_8.endMoveTargets
      L12_12(L13_13)
    else
      L13_13 = L8_8
      L12_12 = L8_8.setMoveTarget2
      L14_14 = L11_11
      L12_12(L13_13, L14_14)
      if L11_11 == L9_9 then
        L11_11 = L10_10
      else
        L11_11 = L9_9
      end
    end
    L13_13 = L8_8
    L12_12 = L8_8.setMoveVelocity
    L14_14 = 10
    L12_12(L13_13, L14_14)
    L13_13 = L8_8
    L12_12 = L8_8.setMoveLoop
    L14_14 = true
    L12_12(L13_13, L14_14)
  end
  L13_13 = L0_0
  L12_12 = L0_0.findSubArea
  L14_14 = motion_area_name
  L12_12 = L12_12(L13_13, L14_14)
  if L12_12 ~= nil then
    L13_13 = motion_name
    if L13_13 ~= nil then
      L14_14 = L12_12
      L13_13 = L12_12.loadMotionFileAsset
      L13_13(L14_14, L15_15)
      while true do
        L14_14 = L12_12
        L13_13 = L12_12.isLoading
        L13_13 = L13_13(L14_14)
        if L13_13 then
          L13_13 = wait
          L13_13()
        end
      end
    end
  end
  L14_14 = L0_0
  L13_13 = L0_0.findSubArea
  L13_13 = L13_13(L14_14, L15_15)
  if L13_13 ~= nil then
    L14_14 = motion_name2
    if L14_14 ~= nil then
      L14_14 = L13_13.loadMotionFileAsset
      L14_14(L15_15, L16_16)
      while true do
        L14_14 = L13_13.isLoading
        L14_14 = L14_14(L15_15)
        if L14_14 then
          L14_14 = wait
          L14_14()
        end
      end
    end
  end
  if L12_12 ~= nil then
    L14_14 = motion_name
    if L14_14 ~= nil then
      L14_14 = L12_12.playMoveAnim
      L14_14(L15_15, L16_16)
    end
  end
  if L13_13 ~= nil then
    L14_14 = motion_name2
    if L14_14 ~= nil then
      L14_14 = L13_13.playMoveAnim
      L14_14(L15_15, L16_16)
    end
  end
  while true do
    L14_14 = Area
    L14_14 = L14_14.isLoading
    L14_14 = L14_14(L15_15)
    if L14_14 then
      L14_14 = wait
      L14_14()
    end
  end
  L14_14 = areamove
  if L14_14 ~= nil then
    L14_14 = areamove
  elseif L14_14 == true then
    L14_14 = Area
    L14_14 = L14_14.setAnimMoveDriftEnable
    L14_14(L15_15)
  end
  L14_14 = HUD
  L14_14 = L14_14.accessEnd
  L14_14(L15_15)
  L14_14 = HUD
  L14_14 = L14_14.fadein
  L14_14(L15_15, L16_16)
  L14_14 = print
  L14_14(L15_15)
  L14_14 = print
  L14_14(L15_15)
  L14_14 = L0_0.getChildren
  L14_14 = L14_14(L15_15)
  if L14_14 ~= nil then
    if L15_15 ~= nil then
      for L18_18 = 0, 10 do
        print(tostring(L18_18) .. ":" .. tostring(L14_14[1]:getPos()))
        wait()
      end
      L15_15(L16_16)
      L15_15(L16_16)
      for L18_18 = 0, 10 do
        print(tostring(L18_18) .. ":" .. tostring(L14_14[1]:getPos()))
        wait()
      end
      L18_18 = L16_16(L17_17)
      L15_15(L16_16, L17_17, L18_18, L16_16(L17_17))
    end
  end
  while true do
    if not L15_15 and L11_11 ~= nil then
      if L15_15 < 1 then
        L15_15(L16_16, L17_17)
        if L11_11 == L9_9 then
          L11_11 = L10_10
        else
          L11_11 = L9_9
        end
      end
      L15_15()
    end
  end
  while true do
    if L15_15 ~= nil then
      L18_18 = Pad
      L18_18 = L18_18.kButton_Enter
      if L16_16 then
        L18_18 = true
        L16_16(L17_17, L18_18, effectiveness_test_immediately)
      end
      L18_18 = Pad
      L18_18 = L18_18.kButton_Cancel
      if L16_16 then
        L18_18 = false
        L16_16(L17_17, L18_18, effectiveness_test_immediately)
      end
      L16_16()
    end
  end
end
function createVehicle(A0_22)
  local L1_23, L2_24
  L1_23 = loadFileAsset
  L2_24 = "evd"
  L1_23 = L1_23(L2_24, A0_22)
  if L1_23 ~= nil then
    L2_24 = L1_23.wait
    L2_24(L1_23)
    L2_24 = Vehicle
    L2_24 = L2_24.CreateRoute
    L2_24 = L2_24(L2_24, L1_23)
    if L2_24 then
      for _FORV_6_, _FORV_7_ in pairs(L2_24) do
        _FORV_7_:waitForReady()
      end
    end
  else
    L2_24 = print
    L2_24(A0_22 .. " is nil")
  end
end
