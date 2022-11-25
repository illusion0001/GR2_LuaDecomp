L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("EventData")
L0_0 = import
L0_0("Time")
L0_0 = import
L0_0("Player")
L0_0 = dofile
L0_0("/Game/Supporter/supporter_spawn.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {
  "CharDefs/npc/man01"
}
function create_puppet(A0_1, A1_2)
  createGameObject2("Puppet"):setEnableDebugDraw(true)
  createGameObject2("Puppet"):setName(A0_1)
  loadFileAsset("evd", L0_0[A1_2]):wait()
  createGameObject2("Puppet"):setDescription(loadFileAsset("evd", L0_0[A1_2]):getRoot())
  createGameObject2("Puppet"):setUseAnimLocomotion(true)
  return (createGameObject2("Puppet"))
end
function main()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13
  L0_3 = Vector
  L1_4 = -6
  L2_5 = 15
  L3_6 = 21
  L0_3 = L0_3(L1_4, L2_5, L3_6)
  org = L0_3
  L0_3 = {}
  L1_4 = createGameObject2
  L2_5 = "Area"
  L1_4 = L1_4(L2_5)
  L3_6 = L1_4
  L2_5 = L1_4.setName
  L4_7 = "test_z_root2"
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setEnableDebugDraw
  L4_7 = true
  L2_5(L3_6, L4_7)
  L2_5 = DebugStage
  L3_6 = L2_5
  L2_5 = L2_5.createTestPlayer
  L4_7 = org
  L5_8 = YRotQuaternion
  L10_13 = L6_9(L7_10)
  L10_13 = L5_8(L6_9, L7_10, L8_11, L9_12, L10_13, L6_9(L7_10))
  L2_5 = L2_5(L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L5_8(L6_9, L7_10, L8_11, L9_12, L10_13, L6_9(L7_10)))
  L3_6 = create_puppet
  L4_7 = "testman"
  L5_8 = 1
  L3_6 = L3_6(L4_7, L5_8)
  L5_8 = L3_6
  L4_7 = L3_6.setUsePhysicsMove
  L4_7(L5_8, L6_9)
  L5_8 = L3_6
  L4_7 = L3_6.setDetectable
  L4_7(L5_8, L6_9)
  L5_8 = L3_6
  L4_7 = L3_6.setCollidable
  L4_7(L5_8, L6_9)
  L5_8 = L3_6
  L4_7 = L3_6.setPos
  L4_7(L5_8, L6_9)
  L4_7 = initializeAllGameObjects
  L4_7()
  L4_7 = waitForReadyAllGameObjects
  L4_7()
  L4_7 = startAllGameObjects
  L4_7()
  L5_8 = L1_4
  L4_7 = L1_4.getDescendant
  L4_7 = L4_7(L5_8)
  L5_8 = 1
  for L9_12, L10_13 in L6_9(L7_10) do
    L0_3[L5_8] = L10_13
    L5_8 = L5_8 + 1
  end
  L4_7 = nil
  L1_4 = nil
  L9_12 = L0_3[1]
  L9_12 = true
  L7_10(L8_11, L9_12)
  L7_10()
  L7_10()
  L7_10()
  L9_12 = "PlayerSensor"
  L10_13 = "pccubesensor2_1"
  L9_12 = L7_10
  L10_13 = true
  L8_11(L9_12, L10_13)
  L9_12 = L8_11
  L10_13 = "Sensor"
  L10_13 = L8_11
  L9_12 = L8_11.setEnableDebugDraw
  L9_12(L10_13, true)
  L10_13 = L8_11
  L9_12 = L8_11.setFilterType
  L9_12(L10_13, "Puppet")
  L9_12 = g_own
  L10_13 = L9_12
  L9_12 = L9_12.findGameObject2
  L9_12 = L9_12(L10_13, "Node", "warppoint2_1")
  L10_13 = g_own
  L10_13 = L10_13.findGameObject2
  L10_13 = L10_13(L10_13, "Node", "warppoint2_2")
  Debug:setSwitch({
    "Development",
    "Console",
    "Standard"
  }, true)
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "Debug Draw GameObject"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  TestCase(L2_5, L3_6, L7_10, L9_12)
  TestCase(L2_5, L3_6, L8_11, L10_13)
end
function TestCase(A0_14, A1_15, A2_16, A3_17)
  local L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31, L18_32, L19_33, L20_34, L21_35, L22_36, L23_37
  L4_18 = print
  L4_18(L5_19)
  L4_18 = print
  L4_18(L5_19)
  L4_18 = print
  L4_18(L5_19)
  L4_18 = print
  L4_18(L5_19)
  L4_18 = A3_17.getWorldPos
  L4_18 = L4_18(L5_19)
  L8_22 = L4_18
  L23_37 = L9_23(L10_24)
  L5_19(L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28, L15_29, L16_30, L17_31, L18_32, L19_33, L20_34, L21_35, L22_36, L23_37, L9_23(L10_24))
  L5_19()
  L5_19()
  L5_19()
  L5_19()
  for L8_22 = 4, 10 do
    for L12_26 = L8_22, 10 do
      for L16_30 = 4, 10 do
        for L20_34 = L16_30, 10 do
          L21_35 = print
          L22_36 = "###########################################################"
          L21_35(L22_36)
          L21_35 = print
          L22_36 = "##### Test deactivate"
          L23_37 = L8_22
          L22_36 = L22_36 .. L23_37 .. " activate" .. L12_26 .. " out" .. L16_30 .. " in" .. L20_34
          L21_35(L22_36)
          L21_35 = 0
          while L21_35 < 15 do
            L22_36 = wait
            L22_36()
            L21_35 = L21_35 + 1
            if L21_35 == L8_22 then
              L22_36 = print
              L23_37 = "    >>> deactive: @S"
              L23_37 = L23_37 .. L21_35 .. " @" .. Time:getGameWorldTimeStamp()
              L22_36(L23_37)
              L23_37 = A2_16
              L22_36 = A2_16.setActive
              L22_36(L23_37, false)
            end
            if L21_35 == L16_30 then
              L22_36 = print
              L23_37 = "  ### warp2 out sensor: @S"
              L23_37 = L23_37 .. L21_35 .. " @" .. Time:getGameWorldTimeStamp()
              L22_36(L23_37)
              L23_37 = A0_14
              L22_36 = A0_14.getRot
              L22_36 = L22_36(L23_37)
              L23_37 = Player
              L23_37 = L23_37.reset
              L23_37(L23_37, Player.kReset_Standing, org, L22_36)
            end
            if L21_35 == L20_34 then
              L23_37 = A3_17
              L22_36 = A3_17.getWorldPos
              L22_36 = L22_36(L23_37)
              L23_37 = print
              L23_37("  ### warp1 in sensor: @S" .. L21_35 .. " @" .. Time:getGameWorldTimeStamp())
              L23_37 = A0_14.getRot
              L23_37 = L23_37(A0_14)
              Player:reset(Player.kReset_Standing, L22_36, L23_37)
            end
            if L21_35 == L12_26 then
              L22_36 = print
              L23_37 = "    >>> active: @S"
              L23_37 = L23_37 .. L21_35 .. " @" .. Time:getGameWorldTimeStamp()
              L22_36(L23_37)
              L23_37 = A2_16
              L22_36 = A2_16.setActive
              L22_36(L23_37, true)
            end
            if L21_35 == 8 and A1_15 ~= nil then
              L22_36 = print
              L23_37 = "   @@@ warp "
              L23_37 = L23_37 .. A1_15:getName() .. " in sensor: @S" .. L21_35 .. " @" .. Time:getGameWorldTimeStamp()
              L22_36(L23_37)
              L23_37 = A3_17
              L22_36 = A3_17.appendChild
              L22_36(L23_37, A1_15)
              L23_37 = A1_15
              L22_36 = A1_15.setPos
              L22_36(L23_37, Vector(0, 0, 0))
              L23_37 = A1_15
              L22_36 = A1_15.setForceMove
              L22_36(L23_37)
            end
            if L21_35 == 9 and A1_15 ~= nil then
              L22_36 = print
              L23_37 = "   @@@ warp "
              L23_37 = L23_37 .. A1_15:getName() .. " out sensor: @S" .. L21_35 .. " @" .. Time:getGameWorldTimeStamp()
              L22_36(L23_37)
              L23_37 = A1_15
              L22_36 = A1_15.leaveFromParent
              L22_36(L23_37)
              L23_37 = A1_15
              L22_36 = A1_15.setPos
              L22_36(L23_37, org)
              L23_37 = A1_15
              L22_36 = A1_15.setForceMove
              L22_36(L23_37)
            end
          end
        end
      end
    end
  end
end
function TestEnter(A0_38, A1_39)
  print("\"" .. A1_39:getName() .. "\" enter into " .. "\"" .. A0_38:getName() .. "\"" .. " @" .. Time:getGameWorldTimeStamp())
end
function TestLeave(A0_40, A1_41)
  print("\"" .. A1_41:getName() .. "\" leave from " .. "\"" .. A0_40:getName() .. "\"" .. " @" .. Time:getGameWorldTimeStamp())
end
function calcPos(A0_42, A1_43)
  local L2_44
  if A0_42 <= 32 then
    L2_44 = Cos
    L2_44 = L2_44(2 * PI * A1_43 / 90)
    L2_44 = 4 * L2_44
    return Vector(L2_44, 0, 0)
  end
  L2_44 = Vector
  return L2_44(0, 0, 0)
end
function moveobj_swing(A0_45, A1_46, A2_47)
  local L3_48, L4_49, L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, L11_56, L12_57, L13_58, L14_59, L15_60, L16_61, L17_62, L18_63, L19_64, L20_65, L21_66, L22_67, L23_68
  L3_48 = RandF
  L4_49 = -1
  L5_50 = 1
  L3_48 = L3_48(L4_49, L5_50)
  function L4_49()
    if RandI(1, 2) == 1 then
      return Sin
    else
      return Cos
    end
  end
  rndcurve = L4_49
  L4_49 = rndcurve
  L4_49 = L4_49()
  L5_50 = rndcurve
  L5_50 = L5_50()
  L6_51 = rndcurve
  L6_51 = L6_51()
  L8_53 = A0_45
  L7_52 = A0_45.getPhasePos
  L7_52 = L7_52(L8_53)
  L8_53 = L7_52.x
  L9_54 = L7_52.y
  L10_55 = L7_52.z
  L11_56 = L8_53
  L12_57 = L9_54
  L13_58 = L10_55
  L14_59 = 0
  L15_60 = RandF
  L16_61 = 1
  L17_62 = 4
  L15_60 = L15_60(L16_61, L17_62)
  L16_61 = RandF
  L17_62 = 1
  L18_63 = 4
  L16_61 = L16_61(L17_62, L18_63)
  L17_62 = RandF
  L18_63 = 1
  L19_64 = 4
  L17_62 = L17_62(L18_63, L19_64)
  L18_63 = RandF
  L19_64 = 1
  L20_65 = 4
  L18_63 = L18_63(L19_64, L20_65)
  L19_64 = RandF
  L20_65 = 1
  L21_66 = 4
  L19_64 = L19_64(L20_65, L21_66)
  L20_65 = RandF
  L21_66 = 1
  L22_67 = 4
  L20_65 = L20_65(L21_66, L22_67)
  L21_66 = L8_53
  L22_67 = L9_54
  L23_68 = L10_55
  return invokeTask(function()
    local L0_69
    while true do
      L0_69 = L9_54
      L0_69 = L0_69 + (L4_49(L14_59) + L5_50(L14_59 / L15_60) + L6_51(L14_59 / L16_61)) * A1_46
      L12_57 = L0_69
      L0_69 = L8_53
      L0_69 = L0_69 + (L6_51(L14_59) + L4_49(L14_59 / L17_62) + L5_50(L14_59 / L18_63)) * A1_46 / 3
      L11_56 = L0_69
      L0_69 = L10_55
      L0_69 = L0_69 + (L5_50(L14_59) + L6_51(L14_59 / L19_64) + L4_49(L14_59 / L20_65)) * A1_46 / 3
      L13_58 = L0_69
      L0_69 = L11_56
      L11_56 = L11_56 - L21_66
      L12_57 = L12_57 - L22_67
      L13_58 = L13_58 - L23_68
      L7_52 = A0_45:getPhasePos()
      A0_45:setPhasePos(Vector(L7_52.x + L11_56, L7_52.y + L12_57, L7_52.z + L13_58))
      L23_68, L22_67, L21_66 = L13_58, L12_57, L0_69
      L14_59 = L14_59 + A2_47
      if L14_59 > 360 then
        L14_59 = 0
      end
      wait()
    end
  end)
end
function moveobj_turn(A0_70, A1_71)
  return invokeTask(function()
    local L0_72, L1_73
    L0_72 = 1
    L1_73 = nil
    if A1_71 == nil then
      A1_71 = 0.3
      L1_73 = RandF(0.01, A1_71) * L0_72
    else
      L1_73 = A1_71
    end
    while L0_72 ~= 0 do
      A0_70:setPhaseRot(A0_70:getPhaseRot() * XYZRotQuaternionEular(0, L1_73, 0))
      wait()
    end
  end)
end
