import("Player")
Balloon = {}
BalloonCatchOnce = false
function Balloon.create(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5
  if A2_2 == nil then
    A2_2 = "CharDefs/redballoon00"
  end
  L3_3 = nil
  if A1_1 == nil then
    L4_4 = createGameObject2
    L5_5 = "Puppet"
    L4_4 = L4_4(L5_5)
    L3_3 = L4_4
  else
    L5_5 = A1_1
    L4_4 = A1_1.createGameObject2
    L4_4 = L4_4(L5_5, "Puppet")
    L3_3 = L4_4
  end
  L5_5 = L3_3
  L4_4 = L3_3.setEnableDebugDraw
  L4_4(L5_5, true)
  L5_5 = L3_3
  L4_4 = L3_3.setName
  L4_4(L5_5, A0_0)
  L4_4 = loadFileAsset
  L5_5 = "evd"
  L4_4 = L4_4(L5_5, A2_2)
  L5_5 = L4_4.wait
  L5_5(L4_4)
  L5_5 = L3_3.setDescription
  L5_5(L3_3, L4_4:getRoot())
  L5_5 = L3_3.setVisible
  L5_5(L3_3, true)
  L5_5 = {}
  L5_5.puppet = L3_3
  L5_5.catch = false
  L5_5.lost = false
  Balloon._installMethods(L5_5)
  return L5_5
end
function Balloon.find(A0_6, A1_7)
  local L2_8
  if A1_7 == nil then
    L2_8 = findGameObject2
    L2_8 = L2_8("Puppet", A0_6)
    puppet = L2_8
  else
    L2_8 = A1_7.findGameObject2
    L2_8 = L2_8(A1_7, "Puppet", A0_6)
    puppet = L2_8
  end
  L2_8 = puppet
  if L2_8 then
    L2_8 = {}
    L2_8.puppet = puppet
    L2_8.catch = false
    L2_8.lost = false
    Balloon._installMethods(L2_8)
    return L2_8
  else
    L2_8 = nil
    return L2_8
  end
end
function Balloon.start(A0_9)
  if not Balloon._isValid(A0_9) then
    return false
  end
  A0_9.puppet:try_init()
  A0_9.puppet:waitForReady()
  A0_9.puppet:try_start()
end
function Balloon.reset(A0_10)
  if not Balloon._isValid(A0_10) then
    return false
  end
  A0_10.puppet:setAlpha(1)
  A0_10.puppet:setForceMove()
end
function Balloon.getWorldPos(A0_11)
  if not Balloon._isValid(A0_11) then
    return false
  end
  return A0_11.puppet:getWorldPos()
end
function Balloon.move(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17)
  local L6_18
  L6_18 = Balloon
  L6_18 = L6_18._isValid
  L6_18 = L6_18(A0_12)
  if not L6_18 then
    L6_18 = false
    return L6_18
  end
  if A3_15 == nil then
    A3_15 = 30
  end
  if A4_16 == nil then
    A4_16 = 50
  end
  L6_18 = invokeTask
  L6_18 = L6_18(function()
    local L0_19, L1_20, L2_21
    L0_19 = Player
    L1_20 = L0_19
    L0_19 = L0_19.getPuppet
    L0_19 = L0_19(L1_20)
    L1_20 = waitSeconds
    L2_21 = 0.5
    L1_20(L2_21)
    while true do
      L1_20 = BalloonCatchOnce
      if L1_20 == false then
        L2_21 = L0_19
        L1_20 = L0_19.getWorldPos
        L1_20 = L1_20(L2_21)
        L2_21 = A0_12.puppet
        L2_21 = L2_21.getWorldPos
        L2_21 = L2_21(L2_21)
        if L1_20:DistanceTo(L2_21) <= 1 then
          A0_12.catch = true
          A0_12:attachJoint(L0_19, "loc_l_hand")
          if A5_17 == true then
            BalloonCatchOnce = true
          end
          if A2_14 ~= nil then
            A2_14()
          end
          break
        end
      end
      wait()
    end
    task_func = nil
    L1_20 = print
    L2_21 = "catch check task finish"
    L1_20(L2_21)
  end)
  if A1_13 ~= nil then
    A0_12.puppet:leaveFromParent(true)
    invokeTask(function()
      local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31
      L0_22 = Vector
      L1_23 = 0
      L2_24 = 0
      L3_25 = 0
      L0_22 = L0_22(L1_23, L2_24, L3_25)
      L1_23 = A0_12.puppet
      L2_24 = L1_23
      L1_23 = L1_23.getWorldPos
      L1_23 = L1_23(L2_24)
      L2_24 = RandI
      L3_25 = A3_15
      L4_26 = A4_16
      L2_24 = L2_24(L3_25, L4_26)
      L3_25 = A1_13
      L3_25 = L3_25 - L1_23
      L4_26 = Vector
      L8_30 = -15
      L9_31 = 15
      L9_31 = L7_29(L8_30, L9_31)
      L4_26 = L4_26(L5_27, L6_28, L7_29, L8_30, L9_31, L7_29(L8_30, L9_31))
      L3_25 = L3_25 + L4_26
      L4_26 = math
      L4_26 = L4_26.ceil
      L4_26 = L4_26(L5_27)
      L0_22.x = L5_27
      L0_22.y = L5_27
      L0_22.z = L5_27
      for L8_30 = 1, L4_26 do
        L9_31 = A0_12.catch
        if not L9_31 then
          L9_31 = A0_12.puppet
          L9_31 = L9_31.getWorldPos
          L9_31 = L9_31(L9_31)
          L9_31 = L9_31 + L0_22
          A0_12.puppet:setWorldPos(L9_31)
          A0_12.puppet:setForceMove()
          wait()
        end
      end
      if not L5_27 then
        if L5_27 ~= nil then
          if L5_27 then
            L5_27(L6_28)
            L6_18 = L5_27
          end
        end
        A0_12.lost = true
        L5_27(L6_28)
      end
      L5_27(L6_28)
    end)
  end
end
function Balloon.moveOnly(A0_32, A1_33, A2_34, A3_35)
  if not Balloon._isValid(A0_32) then
    return false
  end
  if A2_34 == nil then
    A2_34 = 30
  end
  if A3_35 == nil then
    A3_35 = 50
  end
  A0_32.puppet:leaveFromParent(true)
  invokeTask(function()
    local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45
    L0_36 = Vector
    L1_37 = 0
    L2_38 = 0
    L3_39 = 0
    L0_36 = L0_36(L1_37, L2_38, L3_39)
    L1_37 = A0_32.puppet
    L2_38 = L1_37
    L1_37 = L1_37.getWorldPos
    L1_37 = L1_37(L2_38)
    L2_38 = RandI
    L3_39 = A2_34
    L4_40 = A3_35
    L2_38 = L2_38(L3_39, L4_40)
    L3_39 = A1_33
    L3_39 = L3_39 - L1_37
    L4_40 = Vector
    L4_40 = L4_40(L5_41, L6_42, L7_43)
    L3_39 = L3_39 + L4_40
    L4_40 = math
    L4_40 = L4_40.ceil
    L4_40 = L4_40(L5_41)
    L0_36.x = L5_41
    L0_36.y = L5_41
    L0_36.z = L5_41
    for L8_44 = 1, L4_40 do
      L9_45 = A0_32.puppet
      L9_45 = L9_45.getWorldPos
      L9_45 = L9_45(L9_45)
      L9_45 = L9_45 + L0_36
      A0_32.puppet:setWorldPos(L9_45)
      A0_32.puppet:setForceMove()
      wait()
    end
    A0_32.lost = true
    L5_41(L6_42)
  end)
end
function Balloon.release(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55
  L1_47 = Balloon
  L1_47 = L1_47._isValid
  L2_48 = A0_46
  L1_47 = L1_47(L2_48)
  if not L1_47 then
    L1_47 = false
    return L1_47
  end
  BalloonCatchOnce = false
  L1_47 = A0_46.puppet
  L2_48 = L1_47
  L1_47 = L1_47.leaveFromParent
  L3_49 = true
  L1_47(L2_48, L3_49)
  A0_46.catch = false
  L1_47 = Vector
  L2_48 = 0
  L3_49 = 0
  L4_50 = 0
  L1_47 = L1_47(L2_48, L3_49, L4_50)
  L2_48 = Vector
  L3_49 = RandI
  L4_50 = -3
  L3_49 = L3_49(L4_50, L5_51)
  L4_50 = 10
  L9_55 = L5_51(L6_52, L7_53)
  L2_48 = L2_48(L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55, L5_51(L6_52, L7_53))
  L3_49 = 25
  L4_50 = math
  L4_50 = L4_50.ceil
  L4_50 = L4_50(L5_51)
  L1_47.x = L5_51
  L1_47.y = L5_51
  L1_47.z = L5_51
  for L8_54 = 1, L4_50 do
    L9_55 = A0_46.puppet
    L9_55 = L9_55.getWorldPos
    L9_55 = L9_55(L9_55)
    L9_55 = L9_55 + L1_47
    A0_46.puppet:setWorldPos(L9_55)
    A0_46.puppet:setForceMove()
    wait()
  end
  L5_51(L6_52)
end
function Balloon.attachJoint(A0_56, A1_57, A2_58)
  local L3_59
  L3_59 = Balloon
  L3_59 = L3_59._isValid
  L3_59 = L3_59(A0_56)
  if not L3_59 then
    L3_59 = false
    return L3_59
  end
  L3_59 = A0_56.puppet
  L3_59 = L3_59.leaveFromParent
  L3_59(L3_59, true)
  L3_59 = A1_57.getJointWorldTransform
  L3_59 = L3_59(A1_57, A2_58)
  A0_56.puppet:setIsolateFlags(nil, true)
  A0_56.puppet:setWorldTransform(L3_59)
  A0_56.puppet:setForceMove()
  A1_57:appendChildToJoint(A0_56.puppet, A2_58, true)
end
function Balloon.broken(A0_60)
  if not Balloon._isValid(A0_60) then
    return false
  end
  A0_60.puppet:leaveFromParent(true)
  A0_60.catch = false
  A0_60.puppet:setAlpha(0)
end
function Balloon.lookAt(A0_61)
  if not Balloon._isValid(A0_61) then
    return false
  end
  while not Fn_isInSightTarget(A0_61.puppet, 0.5) do
    wait()
  end
  Fn_lookAtObject(A0_61.puppet, 1):abort()
end
function Balloon.isCatch(A0_62)
  if not Balloon._isValid(A0_62) then
    return false
  end
  return A0_62.catch
end
function Balloon.isLost(A0_63)
  if not Balloon._isValid(A0_63) then
    return false
  end
  return A0_63.lost
end
function Balloon.getPuppet(A0_64)
  if not Balloon._isValid(A0_64) then
    return false
  end
  return A0_64.puppet
end
function Balloon._isValid(A0_65)
  if A0_65 == nil then
    return false
  end
  if A0_65.puppet == nil then
    return false
  end
  return true
end
function Balloon._installMethods(A0_66)
  local L1_67, L2_68, L3_69, L4_70, L5_71
  for L4_70, L5_71 in L1_67(L2_68) do
    if type(L5_71) == "function" then
      A0_66[L4_70] = L5_71
    end
  end
end
