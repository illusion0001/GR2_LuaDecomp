local L1_1
L0_0 = {}
L0_0.IS_INSIGHT = 1
L0_0.LISTENED = 2
L0_0.FEEL_INDICATION = 3
L0_0.RECEIVE_REPORT = 4
L0_0.DAMAGED = 5
L0_0.INDICATION_OVERFLOW = 6
L0_0.NO_INDICATION = 7
L0_0.CAUTION_OVERFLOW = 8
L0_0.NO_CAUTION = 9
L0_0.LOST_TARGET = 10
L0_0.BEGIN_COMBAT = 11
L0_0.BEGIN_CHASE = 12
L0_0.END_COMBAT = 13
L0_0.END_CHASE = 14
L0_0.TARGET_CAPTURE = 15
L0_0.TERMINATE = 16
L0_0.OUT_OF_RANGE = 17
L0_0.DIED = 18
L0_0.COMBAT_TIMEOUT = 19
L0_0.FORCED_TERMINATION = 20
L0_0.RESTART = 21
L0_0.HACKED = 22
L0_0.DETECTED_GRAVITY = 23
L0_0.RESOURCE_LOST = 24
L0_0.END_RESOURCE_LOST = 25
L0_0.NOTICE_SOUND = 26
L0_0.END_NOTICE_SOUND = 27
L0_0.LOST_SOUND = 28
L0_0.WONDER_SOUND = 29
L0_0.VERY_WONDER_SOUND = 30
L0_0.END_WONDER_SOUND = 31
L0_0.FORCED_ALERT = 32
L0_0.UNKNOWN = 99
CALLBACK_REASON = L0_0
L0_0 = {}
L0_0.NORMAL = 1
L0_0.CAUTION = 2
L0_0.RESOURCE_CAUTION = 3
L0_0.SOUND_CAUTION = 4
L0_0.WONDER_SOUND = 5
L0_0.ALERT = 6
L0_0.COMBAT = 7
L0_0.TERMINATE = 8
L0_0.DEAD = 9
L0_0.HACKED = 10
NPC_STATUS = L0_0
L0_0 = {}
L0_0.TIME = 1
L0_0.RANGE = 2
CAUTION_MODE = L0_0
function L0_0(A0_2, A1_3)
  local L2_4, L3_5, L4_6
  L2_4 = false
  L3_5 = A1_3.degH
  L4_6 = A1_3.degV
  if L3_5 ~= L4_6 then
    L3_5 = Fn_findNpc
    L4_6 = A0_2
    L3_5 = L3_5(L4_6)
    L4_6 = {}
    L4_6.degree_h = A1_3.degH
    L4_6.degree_v = A1_3.degV
    L4_6.in_length = A1_3.length
    L4_6.out_length = A1_3.length
    L4_6.valid = false
    L3_5:setSightParam(L4_6)
    L2_4 = L3_5:isInSight()
  else
    L2_4 = true
  end
  L3_5 = Fn_findNpcPuppet
  L4_6 = A0_2
  L3_5 = L3_5(L4_6)
  L4_6 = checkPcIsInSight
  L4_6 = L4_6(L3_5, A1_3)
  collectgarbage("step", 10)
  if collectgarbage("count") > 100000 then
    collectgarbage("collect")
  end
  return L2_4 and L4_6
end
isInSight = L0_0
function L0_0(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26
  L3_10 = A0_7
  L2_9 = A0_7.getJointWorldTransform
  L4_11 = A1_8.headLoc
  L3_10 = L2_9(L3_10, L4_11)
  L4_11 = XYZRotQuatD
  L5_12 = 90
  L6_13 = 0
  L7_14 = 0
  L4_11 = L4_11(L5_12, L6_13, L7_14)
  L4_11 = L3_10 * L4_11
  L5_12 = Fn_getPlayer
  L5_12 = L5_12()
  L6_13 = L5_12
  L5_12 = L5_12.getWorldTransform
  L6_13 = L5_12(L6_13)
  L7_14 = false
  L8_15 = Vector
  L9_16 = 0
  L10_17 = 0
  L11_18 = 0
  L8_15 = L8_15(L9_16, L10_17, L11_18)
  L8_15 = L2_9 + L8_15
  L9_16 = Query
  L10_17 = L9_16
  L9_16 = L9_16.setEyeSightTransform
  L11_18 = L8_15
  L12_19 = L4_11
  L9_16(L10_17, L11_18, L12_19)
  L9_16 = A1_8.degH
  L10_17 = A1_8.degV
  if L9_16 > L10_17 then
    L9_16 = Query
    L10_17 = L9_16
    L9_16 = L9_16.setEyeSightAngle
    L11_18 = Deg2Rad
    L12_19 = A1_8.degH
    L19_26 = L11_18(L12_19)
    L9_16(L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L11_18(L12_19))
  else
    L9_16 = Query
    L10_17 = L9_16
    L9_16 = L9_16.setEyeSightAngle
    L11_18 = Deg2Rad
    L12_19 = A1_8.degV
    L19_26 = L11_18(L12_19)
    L9_16(L10_17, L11_18, L12_19, L13_20, L14_21, L15_22, L16_23, L17_24, L18_25, L19_26, L11_18(L12_19))
  end
  L9_16 = Query
  L10_17 = L9_16
  L9_16 = L9_16.setEyeSightRange
  L11_18 = A1_8.length
  L9_16(L10_17, L11_18)
  L9_16 = Fn_getPlayer
  L9_16 = L9_16()
  L10_17 = L9_16
  L9_16 = L9_16.getJointWorldTransform
  L11_18 = "bn_root"
  L10_17 = L9_16(L10_17, L11_18)
  L11_18 = NormalizeVector
  L12_19 = L9_16 - L5_12
  L11_18 = L11_18(L12_19)
  L12_19 = 0.25
  L13_20 = L12_19 * 2
  for L17_24 = 1, 3 do
    L18_25 = L17_24 - 1
    L18_25 = L13_20 * L18_25
    L18_25 = L18_25 + L12_19
    L18_25 = L11_18 * L18_25
    L18_25 = L5_12 + L18_25
    L19_26 = 0.25
    if not Query:checkEyeSightSphere(L18_25, L19_26) or Query:raycastEyeSight(L18_25) then
    else
      L7_14 = true
      do break end
      break
    end
  end
  return L7_14
end
checkPcIsInSight = L0_0
function L0_0(A0_27)
  local L1_28
  L1_28 = true
  if A0_27.perceiveEachOther then
    L1_28 = isInPCsSight(A0_27.npcPuppet, A0_27.pcSightParam)
    if L1_28 then
    end
  end
  return L1_28
end
isSightCheckEnable = L0_0
function L0_0(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48
  L2_31 = Fn_getPlayer
  L2_31 = L2_31()
  L3_32 = L2_31
  L2_31 = L2_31.getJointWorldTransform
  L4_33 = A1_30.headLoc
  L3_32 = L2_31(L3_32, L4_33)
  L4_33 = XYZRotQuatD
  L5_34 = 90
  L6_35 = 0
  L7_36 = 0
  L4_33 = L4_33(L5_34, L6_35, L7_36)
  L4_33 = L3_32 * L4_33
  L6_35 = A0_29
  L5_34 = A0_29.getWorldTransform
  L6_35 = L5_34(L6_35)
  L7_36 = false
  L8_37 = Vector
  L9_38 = 0
  L10_39 = 0
  L11_40 = 0
  L8_37 = L8_37(L9_38, L10_39, L11_40)
  L8_37 = L2_31 + L8_37
  L9_38 = Query
  L10_39 = L9_38
  L9_38 = L9_38.setEyeSightTransform
  L11_40 = L8_37
  L12_41 = L4_33
  L9_38(L10_39, L11_40, L12_41)
  L9_38 = A1_30.degH
  L10_39 = A1_30.degV
  if L9_38 > L10_39 then
    L9_38 = Query
    L10_39 = L9_38
    L9_38 = L9_38.setEyeSightAngle
    L11_40 = Deg2Rad
    L12_41 = A1_30.degH
    L19_48 = L11_40(L12_41)
    L9_38(L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L11_40(L12_41))
  else
    L9_38 = Query
    L10_39 = L9_38
    L9_38 = L9_38.setEyeSightAngle
    L11_40 = Deg2Rad
    L12_41 = A1_30.degV
    L19_48 = L11_40(L12_41)
    L9_38(L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48, L11_40(L12_41))
  end
  L9_38 = Query
  L10_39 = L9_38
  L9_38 = L9_38.setEyeSightRange
  L11_40 = A1_30.length
  L9_38(L10_39, L11_40)
  L10_39 = A0_29
  L9_38 = A0_29.getJointWorldTransform
  L11_40 = "bn_root"
  L10_39 = L9_38(L10_39, L11_40)
  L11_40 = NormalizeVector
  L12_41 = L9_38 - L5_34
  L11_40 = L11_40(L12_41)
  L12_41 = 0.25
  L13_42 = L12_41 * 2
  for L17_46 = 1, 3 do
    L18_47 = L17_46 - 1
    L18_47 = L13_42 * L18_47
    L18_47 = L18_47 + L12_41
    L18_47 = L11_40 * L18_47
    L18_47 = L5_34 + L18_47
    L19_48 = 0.25
    if not Query:checkEyeSightSphere(L18_47, L19_48) or Query:raycastEyeSight(L18_47) then
    else
      L7_36 = true
      do break end
      break
    end
  end
  return L7_36
end
isInPCsSight = L0_0
function L0_0(A0_49, A1_50)
  local L2_51
  L2_51 = Fn_findNpcPuppet
  L2_51 = L2_51(A0_49)
  L2_51 = L2_51.getWorldPos
  L2_51 = L2_51(L2_51)
  if A1_50 >= Fn_getDistanceToPlayer(L2_51) then
  end
  return (100 - 100 * Fn_getDistanceToPlayer(L2_51) / A1_50) * 0.01
end
getCautionValue = L0_0
function L0_0(A0_52, A1_53, A2_54)
  A2_54 = A2_54 or 0.5
  return Fn_findNpcPuppet(A0_52):getWorldPos() + NormalizeVector(A1_53 - Fn_findNpcPuppet(A0_52):getWorldPos()) * A2_54
end
getNearPos = L0_0
function L0_0(A0_55, A1_56)
  return getNearPos(A0_55, Fn_getPlayerWorldPos(), A1_56)
end
getNearPosforPC = L0_0
function L0_0(A0_57, A1_58)
  local L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65
  L2_59 = Fn_findNpcPuppet
  L3_60 = A0_57
  L2_59 = L2_59(L3_60)
  L3_60 = L2_59
  L2_59 = L2_59.getWorldPos
  L2_59 = L2_59(L3_60)
  L3_60 = {}
  L3_60.num = 0
  L3_60.len = 99999
  for L7_64 = 1, #A1_58 do
    L8_65 = findGameObject2
    L8_65 = L8_65("Node", A1_58[L7_64].pos)
    L8_65 = L8_65.getWorldPos
    L8_65 = L8_65(L8_65)
    if Fn_get_distance(L2_59, L8_65) < L3_60.len then
      L3_60.len, L3_60.num = Fn_get_distance(L2_59, L8_65), L7_64
    end
  end
  return L4_61(L5_62, L6_63)
end
rotatePosList = L0_0
function L0_0(A0_66, A1_67)
  local L3_68, L4_69, L5_70, L6_71, L8_72
  L3_68 = {}
  L4_69 = A1_67
  for _FORV_7_ = 1, #A0_66 do
    L3_68[_FORV_7_] = A0_66[L4_69]
    L4_69 = L4_69 + 1
    if L4_69 > #A0_66 then
      L4_69 = 1
    end
  end
  return L3_68
end
rotateTable = L0_0
L0_0 = {}
RAC_CautionLevel = L0_0
L0_0 = RAC_CautionLevel
L0_0.MAX_LEVEL = 100
L0_0 = RAC_CautionLevel
L0_0.visible = true
L0_0 = RAC_CautionLevel
L0_0.value = 0
L0_0 = RAC_CautionLevel
L0_0.valueMin = 0
L0_0 = RAC_CautionLevel
L1_1 = RAC_CautionLevel
L1_1 = L1_1.MAX_LEVEL
L0_0.valueMax = L1_1
L0_0 = RAC_CautionLevel
L1_1 = {}
L0_0.npcList = L1_1
L0_0 = RAC_CautionLevel
L0_0.task = nil
L0_0 = RAC_CautionLevel
L0_0.label = ""
L0_0 = RAC_CautionLevel
L0_0.keepVisible = true
L0_0 = RAC_CautionLevel
function L1_1(A0_73)
  if type(A0_73) == "boolean" then
    RAC_CautionLevel.visible = A0_73
  end
end
L0_0.setVisible = L1_1
L0_0 = RAC_CautionLevel
function L1_1(A0_74)
  local L1_75
  L1_75 = RAC_CautionLevel
  L1_75 = L1_75.valueMin
  if A0_74 < L1_75 then
    L1_75 = RAC_CautionLevel
    A0_74 = L1_75.valueMin
  else
    L1_75 = RAC_CautionLevel
    L1_75 = L1_75.valueMax
    if A0_74 > L1_75 then
      L1_75 = RAC_CautionLevel
      A0_74 = L1_75.valueMax
    end
  end
  L1_75 = RAC_CautionLevel
  L1_75.value = A0_74
end
L0_0.setValue = L1_1
L0_0 = RAC_CautionLevel
function L1_1()
  local L1_76
  L1_76 = RAC_CautionLevel
  L1_76 = L1_76.value
  return L1_76
end
L0_0.getValue = L1_1
L0_0 = RAC_CautionLevel
function L1_1(A0_77, A1_78)
  local L2_79
  if A0_77 == nil and A1_78 == nil then
    L2_79 = RAC_CautionLevel
    L2_79.valueMin = 0
    L2_79 = RAC_CautionLevel
    L2_79.valueMax = RAC_CautionLevel.MAX_LEVEL
  else
    L2_79 = RAC_CautionLevel
    L2_79.valueMin = A0_77 ~= nil and A0_77 or RAC_CautionLevel.valueMin
    L2_79 = RAC_CautionLevel
    L2_79.valueMax = A1_78 ~= nil and A1_78 or RAC_CautionLevel.valueMax
  end
  L2_79 = RAC_CautionLevel
  L2_79 = L2_79.valueMax
  if L2_79 < RAC_CautionLevel.valueMin then
    if A0_77 ~= nil then
      L2_79 = RAC_CautionLevel
      L2_79.valueMax = A0_77
    elseif A1_78 ~= nil then
      L2_79 = RAC_CautionLevel
      L2_79.valueMin = A1_78
    else
      L2_79 = RAC_CautionLevel
      L2_79.valueMax = RAC_CautionLevel.valueMin
    end
  end
  L2_79 = RAC_CautionLevel
  L2_79 = L2_79.setValue
  L2_79(RAC_CautionLevel.getValue())
end
L0_0.setValueLimitRange = L1_1
L0_0 = RAC_CautionLevel
function L1_1()
  RAC_CautionLevel.drawTaskAbort()
  RAC_CautionLevel.task = invokeTask(function()
    while true do
      RAC_CautionLevel.calcValue()
      RAC_CautionLevel.draw()
      wait()
    end
  end)
end
L0_0.drawTask = L1_1
L0_0 = RAC_CautionLevel
function L1_1()
  if RAC_CautionLevel.task ~= nil then
    RAC_CautionLevel.task:abort()
    RAC_CautionLevel.task = nil
    if HUD:miniGaugeIsVisible() then
      HUD:miniGaugeSetVisible(false)
    end
  end
end
L0_0.drawTaskAbort = L1_1
L0_0 = RAC_CautionLevel
function L1_1()
  if RAC_CautionLevel.visible == true then
    if RAC_CautionLevel.value > 0 then
      if not HUD:miniGaugeIsVisible() then
        HUD:miniGaugeSetVisible(true)
      end
      HUD:miniGaugeSetTextID(RAC_CautionLevel.label)
      HUD:miniGaugeSetType(HUD.kCountType_Up, 0.5)
      HUD:miniGaugeSetNum(RAC_CautionLevel.value / 100, false)
    elseif RAC_CautionLevel.keepVisible then
      if not HUD:miniGaugeIsVisible() then
        HUD:miniGaugeSetVisible(true)
      end
      HUD:miniGaugeSetTextID(RAC_CautionLevel.label)
      HUD:miniGaugeSetType(HUD.kCountType_Up, 0.5)
      HUD:miniGaugeSetNum(RAC_CautionLevel.value / 100, false)
    elseif HUD:miniGaugeIsVisible() then
      HUD:miniGaugeSetVisible(false)
    end
  elseif HUD:miniGaugeIsVisible() then
    HUD:miniGaugeSetVisible(false)
  end
end
L0_0.draw = L1_1
L0_0 = RAC_CautionLevel
function L1_1(A0_80)
  if type(A0_80) == "table" then
    RAC_CautionLevel.npcList = {
      table.unpack(A0_80)
    }
  end
end
L0_0.setNpc = L1_1
L0_0 = RAC_CautionLevel
function L1_1(A0_81)
  if A0_81 ~= nil then
    table.insert(RAC_CautionLevel.npcList, A0_81)
  end
end
L0_0.addNpc = L1_1
L0_0 = RAC_CautionLevel
function L1_1()
  local L0_82
  L0_82 = 0
  for _FORV_4_ = 1, #RAC_CautionLevel.npcList do
    if RAC_CautionLevel.npcList[_FORV_4_].status ~= NPC_STATUS.DEAD and RAC_CautionLevel.npcList[_FORV_4_].status ~= NPC_STATUS.TERMINATE and L0_82 < RAC_CautionLevel.npcList[_FORV_4_].caution then
      L0_82 = RAC_CautionLevel.npcList[_FORV_4_].caution
    end
  end
  _FOR_.setValue(L0_82)
end
L0_0.calcValue = L1_1
L0_0 = RAC_CautionLevel
function L1_1()
  local L0_83, L1_84, L2_85, L3_86
  if L0_83 <= 0 then
    return
  end
  for L3_86 = 1, #L1_84 do
    if RAC_CautionLevel.npcList[L3_86].status ~= NPC_STATUS.DEAD and RAC_CautionLevel.npcList[L3_86].status ~= NPC_STATUS.TERMINATE then
      RAC_CautionLevel.npcList[L3_86]:terminate()
    end
  end
end
L0_0.allTerminate = L1_1
L0_0 = RAC_CautionLevel
function L1_1()
  RAC_CautionLevel.drawTaskAbort()
  RAC_CautionLevel.setValueLimitRange()
  RAC_CautionLevel.setValue(0)
  RAC_CautionLevel.setVisible(false)
  if HUD:miniGaugeIsVisible() then
    HUD:miniGaugeSetVisible(false)
  end
end
L0_0.reset = L1_1
L0_0 = RAC_CautionLevel
function L1_1(A0_87)
  if type(A0_87) == "string" then
    RAC_CautionLevel.label = A0_87
  end
end
L0_0.setLabel = L1_1
L0_0 = RAC_CautionLevel
function L1_1(A0_88)
  if type(A0_88) == "boolean" then
    RAC_CautionLevel.keepVisible = A0_88
  end
end
L0_0.setKeepVisible = L1_1
L0_0 = {}
RAC_GestureManageClass = L0_0
L0_0 = RAC_GestureManageClass
L0_0.task = nil
L0_0 = RAC_GestureManageClass
L0_0.label = ""
L0_0 = RAC_GestureManageClass
L0_0.yes_func = nil
L0_0 = RAC_GestureManageClass
L0_0.yes_func_task = nil
L0_0 = RAC_GestureManageClass
L1_1 = {}
L0_0.npcList = L1_1
L0_0 = RAC_GestureManageClass
L0_0.gestureEnable = false
L0_0 = RAC_GestureManageClass
function L1_1()
  RAC_GestureManageClass.task = invokeTask(function()
    local L0_89, L1_90, L2_91
    function L0_89()
      local L0_92
      L0_92 = RAC_GestureManageClass
      L0_92.gestureEnable = false
      L0_92 = RAC_GestureManageClass
      L0_92.yes_func_task = invokeTask(function()
        if RAC_GestureManageClass.yes_func ~= nil then
          RAC_GestureManageClass.yes_func()
        end
        for _FORV_3_ = 1, #RAC_GestureManageClass.npcList do
          RAC_GestureManageClass.npcList[_FORV_3_]:setLostSound()
        end
      end)
    end
    L1_90 = {}
    L2_91 = {}
    L2_91.id = RAC_GestureManageClass.label
    L2_91.func = L0_89
    L1_90.RL = L2_91
    while true do
      L2_91 = true
      if HUD:captionGetTextId() ~= nil then
        L2_91 = false
      end
      if L2_91 == true and RAC_GestureManageClass.yes_func_task ~= nil and RAC_GestureManageClass.yes_func_task:isRunning() then
        L2_91 = false
      end
      if L2_91 == true then
        L2_91 = false
        for _FORV_6_ = 1, #RAC_GestureManageClass.npcList do
          if RAC_GestureManageClass.npcList[_FORV_6_]:isPermitGesture() == true then
            L2_91 = true
            break
          end
        end
      end
      if L2_91 == true then
        for _FORV_6_ = 1, #RAC_GestureManageClass.npcList do
          if RAC_GestureManageClass.npcList[_FORV_6_]:getStatus() == NPC_STATUS.COMBAT then
            L2_91 = false
            break
          end
        end
      end
      if L2_91 == true then
        if RAC_GestureManageClass.gestureEnable == false then
          Fn_gestureAction(L1_90)
          print("lively action start")
          RAC_GestureManageClass.gestureEnable = true
        end
      elseif RAC_GestureManageClass.gestureEnable == true then
        Fn_gestureActionCancel()
        print("lively action end")
        RAC_GestureManageClass.gestureEnable = false
      end
      wait()
    end
  end)
end
L0_0.run = L1_1
L0_0 = RAC_GestureManageClass
function L1_1(A0_93)
  RAC_GestureManageClass.yes_func = A0_93
end
L0_0.setYesFunc = L1_1
L0_0 = RAC_GestureManageClass
function L1_1(A0_94)
  if A0_94 ~= nil then
    RAC_GestureManageClass.label = A0_94
  end
end
L0_0.setLabel = L1_1
L0_0 = RAC_GestureManageClass
function L1_1(A0_95)
  if type(A0_95) == "table" then
    RAC_GestureManageClass.npcList = {
      table.unpack(A0_95)
    }
  end
end
L0_0.setNpc = L1_1
L0_0 = RAC_GestureManageClass
function L1_1(A0_96)
  if A0_96 ~= nil then
    table.insert(RAC_GestureManageClass.npcList, A0_96)
  end
end
L0_0.addNpc = L1_1
L0_0 = RAC_GestureManageClass
function L1_1()
  if RAC_GestureManageClass.yes_func_task ~= nil then
    RAC_GestureManageClass.yes_func_task:abort()
    RAC_GestureManageClass.yes_func_task = nil
  end
  if RAC_GestureManageClass.task ~= nil then
    RAC_GestureManageClass.task:abort()
    RAC_GestureManageClass.task = nil
  end
end
L0_0.reset = L1_1
L0_0 = {}
RAC_PerceivableNpc = L0_0
L0_0 = RAC_PerceivableNpc
function L1_1(A0_97)
  local L1_98
  COMBAT_TIME = 5
  CAPTURE_DISTANCE = 1.5
  COOLDOWN_TIME = 90
  L1_98 = {}
  L1_98.npcName = A0_97
  L1_98.npc = Fn_findNpc(A0_97)
  L1_98.npcPuppet = Fn_findNpcPuppet(A0_97)
  L1_98.task = nil
  L1_98.status = NPC_STATUS.NORMAL
  L1_98.dead = false
  L1_98.combatTimeout = false
  L1_98.battleTimerTask = nil
  L1_98.statusPhase = 0
  L1_98.naviFlag = false
  L1_98.moveTimerTask = nil
  L1_98.caution = 0
  L1_98.cautionIncCoefficent = 1
  L1_98.cautionDecCoefficent = 1
  L1_98.alertRange = 3
  L1_98.cautionRange = 10
  L1_98.cautionMode = CAUTION_MODE.TIME
  L1_98.indicationEnable = true
  L1_98.indication = 0
  L1_98.indicationRange = 3
  L1_98.indicationIncCoefficent = 1
  L1_98.indicationDecCoefficent = 1
  L1_98.sightParam = {}
  L1_98.sightParam.degH = 90
  L1_98.sightParam.degV = 45
  L1_98.sightParam.length = 10
  L1_98.sightParam.headLoc = "bn_head"
  L1_98.pcSightParam = {}
  L1_98.pcSightParam.degH = 50
  L1_98.pcSightParam.degV = 50
  L1_98.pcSightParam.length = 15
  L1_98.pcSightParam.headLoc = "bn_head"
  L1_98.perceiveEachOther = false
  L1_98.combatReady = true
  L1_98.combatReady2 = false
  L1_98.combatTimeEnable = true
  L1_98.combatTime = COMBAT_TIME
  L1_98.combatTimeoutCallbackOnly = true
  L1_98.combatReadyIfDamaged = false
  L1_98.combatGrabEnable = false
  L1_98.enemyGenerator = nil
  L1_98.chaseMode = false
  L1_98.terminateMode = false
  L1_98.coolDown = COOLDOWN_TIME
  L1_98.posList = {}
  L1_98.posList2 = {}
  L1_98.moveStep = 1
  L1_98.changeRouteImmediately = false
  L1_98.routeChanged = false
  L1_98.moveOption = {}
  L1_98.chaseMoveOption = {}
  L1_98.afterMoveWaitTime = 0
  L1_98.initAfterMoveWaitTime = 30
  L1_98.loop = true
  L1_98.currentMovePos = -1
  L1_98.turnList = {}
  L1_98.turnExist = false
  L1_98.turnStep = 1
  L1_98.turnIntervalTime = 0
  L1_98.initTurnIntervalTime = 30
  L1_98.resourceCautionTime = 0
  L1_98.resCautionMotion = "lookaround"
  L1_98.manageResGroupList = {}
  L1_98.checkResLostFnc = {}
  L1_98.oldResLostFlagList = {}
  L1_98.resLostDetectPcRange = 15
  L1_98.motion = "stay"
  L1_98.dismissMotion = "lookaround"
  L1_98.changeStateFunction = nil
  L1_98.callbackReason = CALLBACK_REASON.UNKNOWN
  L1_98.callbackReasonCount = {}
  L1_98.targetPos = nil
  L1_98.enemyGen = nil
  L1_98.initHackDuration = 2100
  L1_98.hackDuration = initHackDuration
  L1_98.detectGravity = false
  L1_98.headLoc = nil
  L1_98.report = false
  L1_98.reportPos = nil
  L1_98.noticeSoundRange = 10
  L1_98.soundCautionMotion = "lookaround"
  L1_98.lostSoundRate = 100
  L1_98.damageType = -1
  L1_98.noDamageAction = ""
  function L1_98.taskAbort(A0_99)
    if A0_99.task ~= nil then
      A0_99.task:abort()
      A0_99.task = nil
    end
  end
  function L1_98.action(A0_100)
    A0_100.task = perceivableNpcAction(A0_100)
  end
  function L1_98.terminate(A0_101)
    A0_101.npcPuppet = Fn_findNpcPuppet(A0_101.npcName)
    if A0_101.npcPuppet == nil then
      return
    end
    if A0_101.npc:isEnemy() then
      A0_101.npc:enableHomingTarget(false)
      A0_101.npc:changeNpc()
    end
    if not A0_101.npc:isMoveEnd() then
      A0_101.npc:reset()
    end
    if A0_101.naviFlag == true then
      RAC_MultiNaviDel(A0_101.npcName)
      A0_101.naviFlag = false
    end
    print(" -> TERMINATION")
    A0_101.caution = 0
    A0_101.indication = 0
    A0_101:changeStatus(NPC_STATUS.TERMINATE, CALLBACK_REASON.FORCED_TERMINATION)
  end
  function L1_98.restart(A0_102)
    if A0_102.status == NPC_STATUS.TERMINATE then
      print("TERMINATE -> NORMAL")
      A0_102.caution = 0
      A0_102.indication = 0
      A0_102:changeStatus(NPC_STATUS.NORMAL, CALLBACK_REASON.RESTART)
    end
  end
  function L1_98.getStatus(A0_103)
    local L1_104
    L1_104 = A0_103.status
    return L1_104
  end
  function L1_98.setOnChangeState(A0_105, A1_106)
    if type(A1_106) == "function" then
      A0_105.changeStateFunction = A1_106
    end
  end
  function L1_98.setSightParam(A0_107, A1_108, A2_109)
    local L3_110
    L3_110 = A0_107.sightParam
    L3_110.degH = A1_108
    L3_110 = A0_107.sightParam
    L3_110.degV = A1_108
    L3_110 = A0_107.sightParam
    L3_110.length = A2_109
  end
  function L1_98.setSightParam2(A0_111, A1_112, A2_113, A3_114)
    local L4_115
    L4_115 = A0_111.sightParam
    L4_115.degH = A1_112
    L4_115 = A0_111.sightParam
    L4_115.degV = A2_113
    L4_115 = A0_111.sightParam
    L4_115.length = A3_114
  end
  function L1_98.setPcSightParam(A0_116, A1_117, A2_118)
    local L3_119
    L3_119 = A0_116.sightParam
    L3_119.degH = A1_117
    L3_119 = A0_116.sightParam
    L3_119.degV = A1_117
    L3_119 = A0_116.sightParam
    L3_119.length = A2_118
  end
  function L1_98.setHeadLoc(A0_120, A1_121)
    if A1_121 ~= nil then
      A0_120.sightParam.headLoc = A1_121
    end
  end
  function L1_98.setPosList(A0_122, A1_123)
    if A1_123 ~= nil and #A1_123 > 0 then
      A0_122.posList = A1_123
      A0_122.posListChanged = true
    end
  end
  function L1_98.setChangeRouteImmediately(A0_124, A1_125)
    if type(A1_125) == "boolean" then
      A0_124.changeRouteImmediately = A1_125
    end
  end
  function L1_98.setMoveOption(A0_126, A1_127)
    if A1_127 ~= nil and type(A1_127) == "table" then
      A0_126.moveOption = A1_127
    end
  end
  function L1_98.setChaseMoveOption(A0_128, A1_129)
    if A1_129 ~= nil and type(A1_129) == "table" then
      A0_128.chaseMoveOption = A1_129
    end
  end
  function L1_98.setAfterMoveWaitTime(A0_130, A1_131)
    if type(A1_131) == "number" then
      A0_130.initAfterMoveWaitTime = A1_131
    end
  end
  function L1_98.setLoop(A0_132, A1_133)
    if type(A1_133) == "boolean" then
      A0_132.loop = A1_133
    end
  end
  function L1_98.setTurnList(A0_134, A1_135)
    if A1_135 ~= nil and type(A1_135) == "table" then
      A0_134.turnExist = false
      for _FORV_5_, _FORV_6_ in pairs(A1_135) do
        A0_134.turnExist = true
        break
      end
      A0_134.turnList = A1_135
    end
  end
  function L1_98.setTurnIntervalTime(A0_136, A1_137)
    if type(A1_137) == "number" then
      A0_136.initTurnIntervalTime = A1_137
    end
  end
  function L1_98.setManageResGroupList(A0_138, A1_139)
    if A1_139 ~= nil and type(A1_139) == "table" then
      A0_138.manageResGroupList = A1_139
    end
  end
  function L1_98.setCheckResLostFnc(A0_140, A1_141)
    if type(A1_141) == "function" then
      A0_140.checkResLostFnc = A1_141
    end
  end
  function L1_98.setStayMotion(A0_142, A1_143)
    if A1_143 ~= nil then
      A0_142.motion = A1_143
    end
  end
  function L1_98.setDismissMotion(A0_144, A1_145)
    if A1_145 ~= nil then
      A0_144.dismissMotion = A1_145
    end
  end
  function L1_98.setResCautionMotion(A0_146, A1_147)
    if A1_147 ~= nil then
      A0_146.resCautionMotion = A1_147
    end
  end
  function L1_98.setSoundCautionMotion(A0_148, A1_149)
    if A1_149 ~= nil then
      A0_148.soundCautionMotion = A1_149
    end
  end
  function L1_98.setCautionLevel(A0_150, A1_151)
    if A1_151 < 0 then
      A1_151 = 0
    elseif A1_151 > 100 then
      A1_151 = 100
    end
    A0_150.caution = A1_151
  end
  function L1_98.setAlertRange(A0_152, A1_153)
    if type(A1_153) == "number" and A1_153 >= 0 then
      A0_152.alertRange = A1_153
    end
  end
  function L1_98.setCautionRange(A0_154, A1_155)
    if type(A1_155) == "number" and A1_155 >= 0 then
      A0_154.cautionRange = A1_155
    end
  end
  function L1_98.setCautionMode(A0_156, A1_157)
    if type(A1_157) == "number" and A1_157 >= 0 then
      A0_156.cautionMode = A1_157
    end
  end
  function L1_98.setIndicationLevel(A0_158, A1_159)
    if A1_159 < 0 then
      A1_159 = 0
    elseif A1_159 > 100 then
      A1_159 = 100
    end
    A0_158.indication = A1_159
  end
  function L1_98.setIndicationEnable(A0_160, A1_161)
    if type(A1_161) == "boolean" then
      A0_160.indicationEnable = A1_161
    end
  end
  function L1_98.setIndicationRange(A0_162, A1_163)
    if type(A1_163) == "number" and A1_163 >= 0 then
      A0_162.indicationRange = A1_163
    end
  end
  function L1_98.setNoticeSoundRange(A0_164, A1_165)
    if type(A1_165) == "number" and A1_165 >= 0 then
      A0_164.noticeSoundRange = A1_165
    end
  end
  function L1_98.setPerceiveEachOther(A0_166, A1_167)
    if type(A1_167) == "boolean" then
      A0_166.perceiveEachOther = A1_167
    end
  end
  function L1_98.setCombatReady(A0_168, A1_169)
    if type(A1_169) == "boolean" then
      A0_168.combatReady = A1_169
    end
  end
  function L1_98.setCombatTimeEnable(A0_170, A1_171)
    if type(A1_171) == "boolean" then
      A0_170.combatTimeEnable = A1_171
    end
  end
  function L1_98.setCombatTime(A0_172, A1_173)
    if type(A1_173) == "number" and A1_173 >= 0 then
      A0_172.combatTime = A1_173
    end
  end
  function L1_98.setCombatTimeoutCallbackOnly(A0_174, A1_175)
    if type(A1_175) == "boolean" then
      A0_174.combatTimeoutCallbackOnly = A1_175
    end
  end
  function L1_98.setEnemyGenerator(A0_176, A1_177)
    if A1_177 ~= nil then
      A0_176.enemyGenerator = A1_177
      A0_176.npc:setEnemyGenerator(A0_176.enemyGenerator)
    end
  end
  function L1_98.setCombatReadyIfDamaged(A0_178, A1_179)
    if type(A1_179) == "boolean" then
      A0_178.combatReadyIfDamaged = A1_179
    end
  end
  function L1_98.setCombatGrabEnable(A0_180, A1_181)
    if type(A1_181) == "boolean" then
      A0_180.combatGrabEnable = A1_181
    end
  end
  function L1_98.setChaseMode(A0_182, A1_183)
    if type(A1_183) == "boolean" then
      A0_182.chaseMode = A1_183
    end
  end
  function L1_98.setTerminate(A0_184, A1_185)
    if type(A1_185) == "boolean" then
      A0_184.terminateMode = A1_185
    end
  end
  function L1_98.setCautionCoefficient(A0_186, A1_187, A2_188)
    if A1_187 > 0 then
      A0_186.cautionIncCoefficent = A1_187
    else
      A0_186.cautionIncCoefficent = 1
    end
    if A2_188 > 0 then
      A0_186.cautionDecCoefficent = A2_188
    else
      A0_186.cautionDecCoefficent = 1
    end
  end
  function L1_98.setIndicationCoefficient(A0_189, A1_190, A2_191)
    if A1_190 > 0 then
      A0_189.indicationIncCoefficent = A1_190
    else
      A0_189.indicationIncCoefficent = 1
    end
    if A2_191 > 0 then
      A0_189.indicationDecCoefficent = A2_191
    else
      A0_189.indicationDecCoefficent = 1
    end
  end
  function L1_98.hack(A0_192)
    A0_192.npcPuppet = Fn_findNpcPuppet(A0_192.npcName)
    if A0_192.npcPuppet == nil then
      return
    end
    A0_192.headLoc = createGameObject2("Node")
    A0_192.headLoc:setName(A0_192.npcName .. "_hacked")
    Fn_findAreaHandle("ed_a_root"):appendChild(A0_192.headLoc)
    A0_192.headLoc:try_init()
    A0_192.headLoc:waitForReady()
    A0_192.headLoc:try_start()
    print(" -> HACKED")
    A0_192.caution = 0
    A0_192.indication = 0
    A0_192.hackDuration = A0_192.initHackDuration
    A0_192:changeStatus(NPC_STATUS.HACKED, CALLBACK_REASON.HACKED)
  end
  function L1_98.setHackDuration(A0_193, A1_194)
    if type(A1_194) == "number" then
      A0_193.initHackDuration = A1_194
    end
  end
  function L1_98.setDetectGravity(A0_195, A1_196)
    if type(A1_196) == "boolean" then
      A0_195.detectGravity = A1_196
    end
  end
  function L1_98.setLostSoundRate(A0_197, A1_198)
    if type(A1_198) == "number" then
      A0_197.lostSoundRate = math.max(0, math.min(100, A1_198))
    end
  end
  function L1_98.getLostSoundRate(A0_199)
    local L1_200
    L1_200 = A0_199.lostSoundRate
    return L1_200
  end
  function L1_98.setReport(A0_201, A1_202)
    if A1_202 ~= nil then
      A0_201.report = true
      A0_201.reportPos = A1_202
    end
  end
  function L1_98.setNoticeSound(A0_203, A1_204)
    local L2_205
    if A1_204 ~= nil then
      L2_205 = Fn_findNpcPuppet
      L2_205 = L2_205(A0_203.npcName)
      A0_203.npcPuppet = L2_205
      L2_205 = A0_203.npcPuppet
      if L2_205 == nil then
        return
      end
      L2_205 = A0_203.npc
      L2_205 = L2_205.isNpc
      L2_205 = L2_205(L2_205)
      if L2_205 then
        L2_205 = A0_203.status
        if L2_205 ~= NPC_STATUS.NORMAL then
          L2_205 = A0_203.status
          if L2_205 ~= NPC_STATUS.CAUTION then
            L2_205 = A0_203.status
            if L2_205 ~= NPC_STATUS.RESOURCE_CAUTION then
              L2_205 = A0_203.status
              if L2_205 ~= NPC_STATUS.SOUND_CAUTION then
                L2_205 = A0_203.status
              end
            end
          end
        elseif L2_205 == NPC_STATUS.WONDER_SOUND then
          L2_205 = Fn_get_distance
          L2_205 = L2_205(A0_203.npc:getWorldPos(), A1_204)
          if L2_205 <= A0_203.noticeSoundRange then
            L2_205 = A0_203.lostSoundRate
            if L2_205 <= 0 then
              L2_205 = print
              L2_205("Lost Sound : -> WONDER_SOUND")
              L2_205 = math
              L2_205 = L2_205.max
              L2_205 = L2_205(math.min(A0_203.caution + 10, RAC_CautionLevel.MAX_LEVEL - 1), 50)
              A0_203.caution = L2_205
              L2_205 = Fn_getPlayerWorldPos
              L2_205 = L2_205()
              A0_203.targetPos = L2_205
              L2_205 = {
                {
                  pos = A0_203.targetPos,
                  opt = A0_203.moveOption
                }
              }
              A0_203.npc:move(L2_205)
              A0_203:changeStatus(NPC_STATUS.WONDER_SOUND, CALLBACK_REASON.VERY_WONDER_SOUND)
            else
              L2_205 = print
              L2_205("Notice Sound : -> SOUND_CAUTION")
              L2_205 = math
              L2_205 = L2_205.min
              L2_205 = L2_205(A0_203.caution + 10, RAC_CautionLevel.MAX_LEVEL - 1)
              A0_203.caution = L2_205
              A0_203.targetPos = A1_204
              L2_205 = {
                {
                  pos = A0_203.targetPos,
                  opt = A0_203.moveOption
                }
              }
              A0_203.npc:move(L2_205)
              A0_203:changeStatus(NPC_STATUS.SOUND_CAUTION, CALLBACK_REASON.NOTICE_SOUND)
            end
          end
        end
      end
    end
  end
  function L1_98.setLostSound(A0_206)
    local L1_207
    L1_207 = Fn_findNpcPuppet
    L1_207 = L1_207(A0_206.npcName)
    A0_206.npcPuppet = L1_207
    L1_207 = A0_206.npcPuppet
    if L1_207 == nil then
      return
    end
    L1_207 = A0_206.npc
    L1_207 = L1_207.isNpc
    L1_207 = L1_207(L1_207)
    if L1_207 then
      L1_207 = A0_206.status
      if L1_207 == NPC_STATUS.SOUND_CAUTION then
        L1_207 = RandI
        L1_207 = L1_207(1, 100)
        if L1_207 <= A0_206.lostSoundRate then
          L1_207 = print
          L1_207("Lost Sound : -> CAUTION")
          L1_207 = A0_206.npc
          L1_207 = L1_207.reset
          L1_207(L1_207)
          L1_207 = A0_206.changeStatus
          L1_207(A0_206, NPC_STATUS.CAUTION, CALLBACK_REASON.LOST_SOUND)
        else
          L1_207 = print
          L1_207("Lost Sound : -> WONDER_SOUND")
          L1_207 = math
          L1_207 = L1_207.max
          L1_207 = L1_207(A0_206.caution, 50)
          A0_206.caution = L1_207
          L1_207 = Fn_getPlayerWorldPos
          L1_207 = L1_207()
          A0_206.targetPos = L1_207
          L1_207 = {
            {
              pos = A0_206.targetPos,
              opt = A0_206.moveOption
            }
          }
          A0_206.npc:move(L1_207)
          A0_206:changeStatus(NPC_STATUS.WONDER_SOUND, CALLBACK_REASON.WONDER_SOUND)
        end
      end
    end
  end
  function L1_98.setAlert(A0_208)
    A0_208.npcPuppet = Fn_findNpcPuppet(A0_208.npcName)
    if A0_208.npcPuppet == nil then
      return
    end
    if A0_208.npc:isNpc() and A0_208.status ~= NPC_STATUS.DEAD and A0_208.status ~= NPC_STATUS.TERMINATE then
      print(" -> ALERT")
      A0_208.caution = RAC_CautionLevel.MAX_LEVEL
      A0_208:changeStatus(NPC_STATUS.ALERT, CALLBACK_REASON.FORCED_ALERT)
    end
  end
  function L1_98.setDamageType(A0_209, A1_210, A2_211)
    if A1_210 < 0 or A1_210 > 2 then
      A0_209.damageType = -1
      return
    end
    A0_209.damageType = A1_210
    if A2_211 ~= nil and type(A2_211) == "string" then
      A0_209.noDamageAction = A2_211
    else
      A0_209.noDamageAction = ""
    end
  end
  function L1_98.setDamagedEvent(A0_212)
    if A0_212.damageType ~= -1 then
      A0_212.npc:changeDamageType(A0_212.damageType, A0_212.noDamageAction)
    end
    A0_212.npc:setEventListener("npcDamaged", function(A0_213)
      local L1_214, L2_215
      L1_214 = print
      L2_215 = "npcDamaged : "
      L2_215 = L2_215 .. A0_212.npcName
      L1_214(L2_215)
      L1_214 = A0_213.attacker
      L2_215 = A0_213.damageType
      print(string.format("npcDamaged : %s o\239\190\159\208\148\239\190\159)==O %s \228\184\137\226\152\133)\239\190\159\226\151\135\239\190\159)%s", L1_214, L2_215, A0_212.npcName))
      if (L1_214 == "player" or L1_214 == "supporter") and A0_212.npc:isNpc() and (A0_212.status == NPC_STATUS.NORMAL or A0_212.status == NPC_STATUS.CAUTION or A0_212.status == NPC_STATUS.RESOURCE_CAUTION or A0_212.status == NPC_STATUS.SOUND_CAUTION or A0_212.status == NPC_STATUS.WONDER_SOUND or A0_212.status == NPC_STATUS.HACKED) then
        if A0_212.combatReadyIfDamaged then
          print("combatReady2 = true")
          A0_212.combatReady2 = true
        end
        print("npcDamaged : -> ALERT")
        A0_212.caution = RAC_CautionLevel.MAX_LEVEL
        A0_212:changeStatus(NPC_STATUS.ALERT, CALLBACK_REASON.DAMAGED)
        A0_212.npc:setEventListener("npcDamaged", nil)
      end
    end)
  end
  function L1_98.isPermitGesture(A0_216)
    local L1_217, L2_218
    L1_217 = A0_216.status
    L2_218 = NPC_STATUS
    L2_218 = L2_218.SOUND_CAUTION
    L1_217 = L1_217 == L2_218 and L1_217 > 0
    return L1_217
  end
  function L1_98.changeStatus(A0_219, A1_220, A2_221)
    local L3_222, L4_223
    L3_222 = A0_219.status
    L4_223 = A0_219.callbackReason
    A0_219.status = A1_220
    A0_219.statusPhase = 0
    A0_219.callbackReason = A2_221
    if A0_219.callbackReasonCount[A2_221] == nil then
      A0_219.callbackReasonCount[A2_221] = 0
    end
    A0_219.callbackReasonCount[A2_221] = A0_219.callbackReasonCount[A2_221] + 1
    A0_219.callbackReasonCount[A2_221] = math.min(A0_219.callbackReasonCount[A2_221], 10000)
    if A0_219.changeStateFunction ~= nil and A2_221 > 0 then
      A0_219.changeStateFunction(A0_219.npcName, A2_221, A0_219.callbackReasonCount[A2_221], L3_222, L4_223)
    end
  end
  RAC_CautionLevel.addNpc(L1_98)
  RAC_GestureManageClass.addNpc(L1_98)
  return L1_98
end
L0_0.new = L1_1
function L0_0(A0_224)
  A0_224:setDamagedEvent()
  A0_224.npc:setEventListener("npcGrabbed", function()
    A0_224.npc:setEventListener("npcGrabbed", nil)
    print("npcGrabbed : " .. A0_224.npcName)
  end)
  A0_224.npc:setEventListener("npcDead", function()
    A0_224.npc:setEventListener("npcDead", nil)
    print("npcDead : " .. A0_224.npcName)
    if A0_224.battleTimerTask ~= nil then
      A0_224.battleTimerTask:abort()
      A0_224.battleTimerTask = nil
    end
    if A0_224.npc:isEnemy() then
      A0_224.npc:enableHomingTarget(false)
    end
    A0_224:changeStatus(NPC_STATUS.DEAD, CALLBACK_REASON.DIED)
  end)
  A0_224.npc:setEventListener("npcFall", function()
    A0_224.npc:setEventListener("npcFall", nil)
    print("npcFall : " .. A0_224.npcName)
  end)
  return invokeTask(function()
    local L0_225, L1_226, L2_227, L3_228, L4_229, L5_230, L6_231, L7_232, L8_233, L9_234, L10_235, L11_236
    L0_225 = {}
    L0_225.isRepeat = false
    L0_225.isRandom = false
    L0_225.isStop = true
    L0_225.animSpeed = 1
    L0_225.animBlendDuration = 0.5
    while true do
      L1_226 = A0_224.dead
      if not L1_226 then
        L1_226 = Fn_findNpcPuppet
        L1_226 = L1_226(L2_227)
        A0_224.npcPuppet = L1_226
        L1_226 = A0_224.npcPuppet
        if L1_226 == nil then
          L1_226 = A0_224.status
          if L1_226 ~= L2_227 then
            L1_226 = print
            L1_226(L2_227)
            L1_226 = A0_224
            L1_226 = L1_226.changeStatus
            L1_226(L2_227, L3_228, L4_229)
          end
        end
        L1_226 = A0_224.status
        if L1_226 == L2_227 then
          L1_226 = A0_224.cautionMode
          if L1_226 == L2_227 then
            L1_226 = isInSight
            L1_226 = L1_226(L2_227, L3_228)
            if L1_226 then
              L1_226 = isSightCheckEnable
              L1_226 = L1_226(L2_227)
              if L1_226 then
                L1_226 = A0_224.npc
                L1_226 = L1_226.getMoveCurrentIndex
                L1_226 = L1_226(L2_227)
                A0_224.currentMovePos = L1_226
                L1_226 = getNearPosforPC
                L1_226 = L1_226(L2_227, L3_228)
                A0_224.targetPos = L1_226
                L1_226 = {L2_227}
                L2_227.pos = L3_228
                L2_227.opt = L3_228
                L2_227(L3_228, L4_229)
                if L2_227 < L3_228 then
                  A0_224.caution = L2_227
                  L2_227(L3_228, L4_229, L5_230)
                else
                  A0_224.caution = L2_227
                  L2_227(L3_228, L4_229, L5_230)
                  do break end
                  else
                    L1_226 = A0_224.report
                    if L1_226 then
                      L1_226 = getNearPos
                      L1_226 = L1_226(L2_227, L3_228, L4_229)
                      A0_224.targetPos = L1_226
                      L1_226 = {L2_227}
                      L2_227.pos = L3_228
                      L2_227.opt = L3_228
                      L2_227(L3_228, L4_229)
                      A0_224.caution = L2_227
                      L2_227(L3_228, L4_229, L5_230)
                    else
                      L1_226 = A0_224.npc
                      L1_226 = L1_226.isMoveEnd
                      L1_226 = L1_226(L2_227)
                      if L1_226 then
                        L1_226 = A0_224.npc
                        L1_226 = L1_226.isTurnEnd
                        L1_226 = L1_226(L2_227)
                        if L1_226 then
                          L1_226 = A0_224.turnExist
                          if L1_226 ~= false then
                            L1_226 = A0_224.turnStep
                          elseif L1_226 > 1 then
                            L1_226 = {}
                            if L2_227 == false then
                              if L2_227 ~= nil then
                                for L5_230, L6_231 in L2_227(L3_228) do
                                  for L10_235, L11_236 in L7_232(L8_233) do
                                    table.insert(L1_226, L11_236)
                                  end
                                end
                              end
                            elseif L2_227 ~= nil then
                              if L2_227 ~= nil then
                                for L5_230, L6_231 in L2_227(L3_228) do
                                  L7_232(L8_233, L9_234)
                                end
                              end
                            end
                            for L6_231, L7_232 in L3_228(L4_229) do
                              for _FORV_12_, _FORV_13_ in L9_234(L10_235) do
                                if A0_224.oldResLostFlagList[L7_232] == nil then
                                  A0_224.oldResLostFlagList[L7_232] = {}
                                end
                                if A0_224.oldResLostFlagList[L7_232][_FORV_12_] == nil then
                                  A0_224.oldResLostFlagList[L7_232][_FORV_12_] = false
                                end
                                if _FORV_13_ == true and A0_224.oldResLostFlagList[L7_232][_FORV_12_] == false then
                                  A0_224.oldResLostFlagList[L7_232][_FORV_12_] = true
                                end
                              end
                            end
                            if L2_227 == true then
                              if L3_228 <= L4_229 then
                                L3_228(L4_229)
                                L6_231 = L0_225
                                L3_228(L4_229, L5_230, L6_231)
                                A0_224.caution = L3_228
                                A0_224.resourceCautionTime = 90
                                L6_231 = CALLBACK_REASON
                                L6_231 = L6_231.RESOURCE_LOST
                                L3_228(L4_229, L5_230, L6_231)
                              end
                            end
                          end
                        end
                      else
                        L1_226 = A0_224.indicationEnable
                        if L1_226 then
                          L1_226 = getCautionValue
                          L1_226 = L1_226(L2_227, L3_228)
                          L1_226 = L1_226 * L2_227
                          if L1_226 > 0 then
                            L2_227(L3_228, L4_229)
                            if L2_227 >= 100 then
                              if L2_227 then
                                A0_224.targetPos = L2_227
                                L2_227(L3_228, L4_229)
                                A0_224.currentMovePos = L2_227
                                if L2_227 == L3_228 then
                                  A0_224.caution = L2_227
                                  L2_227(L3_228, L4_229, L5_230)
                                end
                                else
                                  else
                                    L3_228(L4_229, L5_230)
                                  end
                                  else
                                    L1_226 = Fn_getDistanceToPlayer
                                    L1_226 = L1_226(L2_227)
                                    if L1_226 <= L2_227 then
                                      A0_224.currentMovePos = L2_227
                                      if L2_227 < L3_228 then
                                        L2_227(L3_228)
                                        L2_227(L3_228)
                                        A0_224.caution = L2_227
                                        L2_227(L3_228, L4_229, L5_230)
                                      else
                                        L2_227(L3_228)
                                        L2_227(L3_228)
                                        A0_224.caution = L2_227
                                        L2_227(L3_228, L4_229, L5_230)
                                        do break end
                                        else
                                          A0_224.caution = 0
                                          if L2_227 then
                                            if L2_227 then
                                              L2_227(L3_228)
                                              L2_227(L3_228)
                                              A0_224.caution = L2_227
                                              L2_227(L3_228, L4_229, L5_230)
                                            end
                                        end
                                        else
                                          L1_226 = A0_224.changeRouteImmediately
                                          if not L1_226 then
                                            L1_226 = A0_224.npc
                                            L1_226 = L1_226.isMoveEnd
                                            L1_226 = L1_226(L2_227)
                                            if L1_226 then
                                              L1_226 = A0_224.npc
                                              L1_226 = L1_226.isTurnEnd
                                              L1_226 = L1_226(L2_227)
                                            end
                                          elseif L1_226 then
                                            L1_226 = A0_224.posListChanged
                                            if L1_226 then
                                              L1_226 = A0_224.posList
                                              L1_226 = #L1_226
                                              if L1_226 > 0 then
                                                A0_224.moveStep = 1
                                                A0_224.turnStep = 1
                                                A0_224.statusPhase = 0
                                                A0_224.currentMovePos = -1
                                              end
                                              A0_224.posListChanged = false
                                            end
                                          end
                                          L1_226 = A0_224.statusPhase
                                          if L1_226 == 0 then
                                            L1_226 = A0_224.npc
                                            L1_226 = L1_226.isMoveEnd
                                            L1_226 = L1_226(L2_227)
                                            if L1_226 then
                                              L1_226 = A0_224.npc
                                              L1_226 = L1_226.isTurnEnd
                                              L1_226 = L1_226(L2_227)
                                            else
                                              if not L1_226 then
                                                L1_226 = A0_224.changeRouteImmediately
                                                L1_226 = L1_226 and A0_224.posListChanged
                                            end
                                            elseif L1_226 then
                                              L1_226 = A0_224.posList
                                              L1_226 = #L1_226
                                              if L1_226 > 0 then
                                                L1_226 = A0_224.posList
                                                L1_226 = #L1_226
                                                if L1_226 == 1 then
                                                  L1_226 = A0_224.posList
                                                  L1_226 = L1_226[1]
                                                  L1_226 = #L1_226
                                                  if L1_226 == 1 then
                                                    L1_226 = findGameObject2
                                                    L1_226 = L1_226(L2_227, L3_228)
                                                    if L1_226 ~= nil then
                                                      L6_231 = L1_226
                                                      L6_231 = L5_230(L6_231)
                                                      if L2_227 < L3_228 then
                                                        L3_228(L4_229)
                                                        L3_228(L4_229, L5_230)
                                                        L6_231 = {}
                                                        L6_231.startIndex = 1
                                                        L6_231.goalDirection = true
                                                        L3_228(L4_229, L5_230, L6_231)
                                                        A0_224.turnStep = 1
                                                        A0_224.currentMovePos = -1
                                                      end
                                                    end
                                                  end
                                                else
                                                  L1_226 = A0_224.npc
                                                  L1_226 = L1_226.setMoveOption
                                                  L1_226(L2_227, L3_228)
                                                  L1_226 = A0_224.npc
                                                  L1_226 = L1_226.move
                                                  L6_231 = A0_224.currentMovePos
                                                  L4_229.startIndex = L5_230
                                                  L4_229.goalDirection = false
                                                  L1_226(L2_227, L3_228, L4_229)
                                                  A0_224.turnStep = 1
                                                  A0_224.currentMovePos = -1
                                                end
                                                L1_226 = A0_224.initAfterMoveWaitTime
                                                A0_224.afterMoveWaitTime = L1_226
                                                A0_224.statusPhase = 1
                                              else
                                                L1_226 = A0_224.motion
                                                if L1_226 ~= nil then
                                                  L1_226 = A0_224.npc
                                                  L1_226 = L1_226.playMotion
                                                  L1_226(L2_227, L3_228, L4_229)
                                                end
                                                A0_224.statusPhase = 2
                                              end
                                            end
                                          else
                                            L1_226 = A0_224.statusPhase
                                            if L1_226 == 1 then
                                              L1_226 = A0_224.npc
                                              L1_226 = L1_226.isMoveEnd
                                              L1_226 = L1_226(L2_227)
                                              if L1_226 then
                                                L1_226 = A0_224.npc
                                                L1_226 = L1_226.isTurnEnd
                                                L1_226 = L1_226(L2_227)
                                                if L1_226 then
                                                  L1_226 = A0_224.afterMoveWaitTime
                                                  L1_226 = L1_226 - 1
                                                  A0_224.afterMoveWaitTime = L1_226
                                                  L1_226 = A0_224.afterMoveWaitTime
                                                  if L1_226 <= 0 then
                                                    A0_224.statusPhase = 2
                                                  end
                                                end
                                              end
                                            else
                                              L1_226 = A0_224.statusPhase
                                              if L1_226 == 2 then
                                                L1_226 = A0_224.npc
                                                L1_226 = L1_226.isMoveEnd
                                                L1_226 = L1_226(L2_227)
                                                if L1_226 then
                                                  L1_226 = A0_224.npc
                                                  L1_226 = L1_226.isTurnEnd
                                                  L1_226 = L1_226(L2_227)
                                                  if L1_226 then
                                                    L1_226 = A0_224.turnList
                                                    L1_226 = L1_226[L2_227]
                                                    if L1_226 ~= nil then
                                                      L1_226 = A0_224.turnList
                                                      L1_226 = L1_226[L2_227]
                                                      L1_226 = L1_226[L2_227]
                                                      if L1_226 ~= nil then
                                                        L1_226 = A0_224.npc
                                                        L1_226 = L1_226.turn
                                                        L1_226(L2_227, L3_228)
                                                        L1_226 = A0_224.turnStep
                                                        L1_226 = L1_226 + 1
                                                        A0_224.turnStep = L1_226
                                                        L1_226 = A0_224.initTurnIntervalTime
                                                        A0_224.turnIntervalTime = L1_226
                                                        A0_224.statusPhase = 3
                                                      end
                                                    else
                                                      A0_224.posListChanged = false
                                                      L1_226 = A0_224.moveStep
                                                      L1_226 = L1_226 + 1
                                                      A0_224.moveStep = L1_226
                                                      A0_224.turnStep = 1
                                                      L1_226 = A0_224.posList
                                                      L1_226 = L1_226[L2_227]
                                                      if L1_226 == nil then
                                                        L1_226 = A0_224.turnList
                                                        L1_226 = L1_226[L2_227]
                                                        if L1_226 ~= nil then
                                                          L1_226 = A0_224.turnList
                                                          L1_226 = L1_226[L2_227]
                                                          L1_226 = L1_226[L2_227]
                                                        elseif L1_226 == nil then
                                                          L1_226 = A0_224.loop
                                                          if L1_226 then
                                                            A0_224.moveStep = 1
                                                            A0_224.statusPhase = 0
                                                          else
                                                            A0_224.statusPhase = 4
                                                          end
                                                        end
                                                      else
                                                        A0_224.statusPhase = 0
                                                      end
                                                    end
                                                  end
                                                end
                                              else
                                                L1_226 = A0_224.statusPhase
                                                if L1_226 == 3 then
                                                  L1_226 = A0_224.npc
                                                  L1_226 = L1_226.isMoveEnd
                                                  L1_226 = L1_226(L2_227)
                                                  if L1_226 then
                                                    L1_226 = A0_224.npc
                                                    L1_226 = L1_226.isTurnEnd
                                                    L1_226 = L1_226(L2_227)
                                                    if L1_226 then
                                                      L1_226 = A0_224.turnIntervalTime
                                                      L1_226 = L1_226 - 1
                                                      A0_224.turnIntervalTime = L1_226
                                                      L1_226 = A0_224.turnIntervalTime
                                                      if L1_226 <= 0 then
                                                        A0_224.statusPhase = 2
                                                      end
                                                    end
                                                  end
                                                else
                                                  L1_226 = A0_224.statusPhase
                                                  if L1_226 == 4 then
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                        else
                                          L1_226 = A0_224.status
                                          if L1_226 == L2_227 then
                                            L1_226 = A0_224.cautionMode
                                            if L1_226 == L2_227 then
                                              L1_226 = isInSight
                                              L1_226 = L1_226(L2_227, L3_228)
                                              if L1_226 then
                                                L1_226 = isSightCheckEnable
                                                L1_226 = L1_226(L2_227)
                                                if L1_226 then
                                                  L1_226 = Fn_getPlayerWorldPos
                                                  L1_226 = L1_226()
                                                  A0_224.targetPos = L1_226
                                                  L1_226 = getCautionValue
                                                  L1_226 = L1_226(L2_227, L3_228)
                                                  L1_226 = L1_226 * L2_227
                                                  L2_227(L3_228, L4_229)
                                                end
                                              else
                                                L1_226 = A0_224.indicationEnable
                                                if L1_226 then
                                                  L1_226 = getCautionValue
                                                  L1_226 = L1_226(L2_227, L3_228)
                                                  L1_226 = L1_226 * L2_227
                                                  if L1_226 > 0 then
                                                    A0_224.targetPos = L2_227
                                                    L2_227(L3_228, L4_229)
                                                  else
                                                    L3_228(L4_229, L5_230)
                                                  end
                                                else
                                                  L1_226 = A0_224.cautionDecCoefficent
                                                  L1_226 = 1 * L1_226
                                                  L2_227(L3_228, L4_229)
                                                end
                                              end
                                            else
                                              L1_226 = Fn_getDistanceToPlayer
                                              L1_226 = L1_226(L2_227)
                                              if L1_226 >= 0 then
                                                if L1_226 <= L2_227 then
                                                  A0_224.coolDown = L2_227
                                                  A0_224.caution = L2_227
                                                end
                                              elseif L1_226 > L2_227 then
                                                if L1_226 <= L2_227 then
                                                  A0_224.coolDown = L2_227
                                                  A0_224.caution = L2_227
                                                end
                                              else
                                                A0_224.coolDown = L2_227
                                                if L2_227 < 0 then
                                                  A0_224.caution = 0
                                                end
                                                if L2_227 then
                                                  if L2_227 then
                                                    A0_224.caution = L2_227
                                                  end
                                                end
                                              end
                                            end
                                            L1_226 = A0_224.caution
                                            if L1_226 >= L2_227 then
                                              L1_226 = getNearPosforPC
                                              L1_226 = L1_226(L2_227, L3_228)
                                              A0_224.targetPos = L1_226
                                              L1_226 = {L2_227}
                                              L2_227.pos = L3_228
                                              L2_227.opt = L3_228
                                              L2_227(L3_228, L4_229)
                                              L2_227(L3_228, L4_229)
                                              L2_227(L3_228)
                                              L2_227(L3_228, L4_229, L5_230)
                                            else
                                              L1_226 = A0_224.caution
                                              if L1_226 <= 0 then
                                                L1_226 = print
                                                L1_226(L2_227)
                                                L1_226 = getNearPosforPC
                                                L1_226 = L1_226(L2_227)
                                                A0_224.targetPos = L1_226
                                                L1_226 = A0_224.npc
                                                L1_226 = L1_226.reset
                                                L1_226(L2_227)
                                                L1_226 = A0_224.npc
                                                L1_226 = L1_226.playMotion
                                                L1_226(L2_227, L3_228, L4_229)
                                                A0_224.caution = 0
                                                A0_224.indication = 0
                                                L1_226 = A0_224
                                                L1_226 = L1_226.changeStatus
                                                L1_226(L2_227, L3_228, L4_229)
                                              else
                                                L1_226 = A0_224.chaseMode
                                                if L1_226 then
                                                  L1_226 = A0_224.npc
                                                  L1_226 = L1_226.isMoveEnd
                                                  L1_226 = L1_226(L2_227)
                                                  if L1_226 then
                                                    L1_226 = Fn_getPlayer
                                                    L1_226 = L1_226()
                                                    A0_224.targetPos = L1_226
                                                    L1_226 = {L2_227}
                                                    L2_227.pos = L3_228
                                                    L2_227.opt = L3_228
                                                    L2_227(L3_228, L4_229)
                                                    L2_227(L3_228, L4_229)
                                                  end
                                                else
                                                  L1_226 = A0_224.caution
                                                  if L1_226 >= 50 then
                                                    L1_226 = A0_224.npc
                                                    L1_226 = L1_226.isMoveEnd
                                                    L1_226 = L1_226(L2_227)
                                                    if L1_226 then
                                                      L1_226 = A0_224.npc
                                                      L1_226 = L1_226.isMotionEnd
                                                      L1_226 = L1_226(L2_227)
                                                      if L1_226 then
                                                        L1_226 = A0_224.npc
                                                        L1_226 = L1_226.isTurnEnd
                                                        L1_226 = L1_226(L2_227)
                                                        if L1_226 then
                                                          L1_226 = A0_224.npc
                                                          L1_226 = L1_226.turn
                                                          L1_226(L2_227, L3_228)
                                                        end
                                                      end
                                                    end
                                                  else
                                                    L1_226 = A0_224.npc
                                                    L1_226 = L1_226.isMoveEnd
                                                    L1_226 = L1_226(L2_227)
                                                    if L1_226 then
                                                      L1_226 = A0_224.npc
                                                      L1_226 = L1_226.isMotionEnd
                                                      L1_226 = L1_226(L2_227)
                                                      if L1_226 then
                                                        L1_226 = A0_224.npc
                                                        L1_226 = L1_226.isTurnEnd
                                                        L1_226 = L1_226(L2_227)
                                                        if L1_226 then
                                                          L1_226 = A0_224.npc
                                                          L1_226 = L1_226.playMotion
                                                          L1_226(L2_227, L3_228, L4_229)
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          else
                                            L1_226 = A0_224.status
                                            if L1_226 == L2_227 then
                                              L1_226 = A0_224.cautionMode
                                              if L1_226 == L2_227 then
                                                L1_226 = isInSight
                                                L1_226 = L1_226(L2_227, L3_228)
                                                if L1_226 then
                                                  L1_226 = isSightCheckEnable
                                                  L1_226 = L1_226(L2_227)
                                                  if L1_226 then
                                                    L1_226 = getNearPosforPC
                                                    L1_226 = L1_226(L2_227, L3_228)
                                                    A0_224.targetPos = L1_226
                                                    L1_226 = {L2_227}
                                                    L2_227.pos = L3_228
                                                    L2_227.opt = L3_228
                                                    L2_227(L3_228, L4_229)
                                                    if L2_227 < L3_228 then
                                                      A0_224.caution = L2_227
                                                      L2_227(L3_228, L4_229, L5_230)
                                                    else
                                                      A0_224.caution = L2_227
                                                      L2_227(L3_228, L4_229, L5_230)
                                                    end
                                                    else
                                                      else
                                                        L1_226 = Fn_getDistanceToPlayer
                                                        L1_226 = L1_226(L2_227)
                                                        if L1_226 <= L2_227 then
                                                          if L1_226 <= L2_227 then
                                                            L2_227(L3_228)
                                                            L2_227(L3_228)
                                                            A0_224.caution = L2_227
                                                            L2_227(L3_228, L4_229, L5_230)
                                                          else
                                                            L2_227(L3_228)
                                                            L2_227(L3_228)
                                                            A0_224.caution = L2_227
                                                            L2_227(L3_228, L4_229, L5_230)
                                                          end
                                                      end
                                                      else
                                                        L1_226 = A0_224.resourceCautionTime
                                                        if L1_226 > 0 then
                                                          L1_226 = A0_224.resourceCautionTime
                                                          L1_226 = L1_226 - 1
                                                          A0_224.resourceCautionTime = L1_226
                                                        end
                                                        L1_226 = A0_224.resourceCautionTime
                                                        if L1_226 <= 0 then
                                                          L1_226 = A0_224.npc
                                                          L1_226 = L1_226.isMotionEnd
                                                          L1_226 = L1_226(L2_227)
                                                          if L1_226 then
                                                            L1_226 = print
                                                            L1_226(L2_227)
                                                            L1_226 = A0_224
                                                            L1_226 = L1_226.changeStatus
                                                            L1_226(L2_227, L3_228, L4_229)
                                                          end
                                                        else
                                                        end
                                                      end
                                                      else
                                                        L1_226 = A0_224.status
                                                        if L1_226 == L2_227 then
                                                          L1_226 = A0_224.cautionMode
                                                          if L1_226 == L2_227 then
                                                            L1_226 = isInSight
                                                            L1_226 = L1_226(L2_227, L3_228)
                                                            if L1_226 then
                                                              L1_226 = isSightCheckEnable
                                                              L1_226 = L1_226(L2_227)
                                                              if L1_226 then
                                                                L1_226 = getNearPosforPC
                                                                L1_226 = L1_226(L2_227, L3_228)
                                                                A0_224.targetPos = L1_226
                                                                L1_226 = {L2_227}
                                                                L2_227.pos = L3_228
                                                                L2_227.opt = L3_228
                                                                L2_227(L3_228, L4_229)
                                                                if L2_227 < L3_228 then
                                                                  A0_224.caution = L2_227
                                                                  L2_227(L3_228, L4_229, L5_230)
                                                                else
                                                                  A0_224.caution = L2_227
                                                                  L2_227(L3_228, L4_229, L5_230)
                                                                end
                                                                else
                                                                  else
                                                                    L1_226 = Fn_getDistanceToPlayer
                                                                    L1_226 = L1_226(L2_227)
                                                                    if L1_226 <= L2_227 then
                                                                      if L1_226 <= L2_227 then
                                                                        L2_227(L3_228)
                                                                        L2_227(L3_228)
                                                                        A0_224.caution = L2_227
                                                                        L2_227(L3_228, L4_229, L5_230)
                                                                      else
                                                                        L2_227(L3_228)
                                                                        L2_227(L3_228)
                                                                        A0_224.caution = L2_227
                                                                        L2_227(L3_228, L4_229, L5_230)
                                                                      end
                                                                  end
                                                                  else
                                                                    L1_226 = A0_224.statusPhase
                                                                    if L1_226 == 0 then
                                                                      L1_226 = invokeTask
                                                                      L1_226 = L1_226(L2_227, L3_228)
                                                                      A0_224.moveTimerTask = L1_226
                                                                      A0_224.statusPhase = 1
                                                                    else
                                                                      L1_226 = A0_224.statusPhase
                                                                      if L1_226 == 1 then
                                                                        L1_226 = A0_224.npc
                                                                        L1_226 = L1_226.isMoveEnd
                                                                        L1_226 = L1_226(L2_227)
                                                                        if not L1_226 then
                                                                          L1_226 = A0_224.moveTimerTask
                                                                          L1_226 = L1_226.isRunning
                                                                          L1_226 = L1_226(L2_227)
                                                                        elseif L1_226 == false then
                                                                          L1_226 = A0_224.moveTimerTask
                                                                          L1_226 = L1_226.abort
                                                                          L1_226(L2_227)
                                                                          A0_224.moveTimerTask = nil
                                                                          L1_226 = A0_224.npc
                                                                          L1_226 = L1_226.reset
                                                                          L1_226(L2_227)
                                                                          L1_226 = A0_224.npc
                                                                          L1_226 = L1_226.playMotion
                                                                          L1_226(L2_227, L3_228, L4_229)
                                                                          A0_224.statusPhase = 2
                                                                        end
                                                                      else
                                                                        L1_226 = A0_224.statusPhase
                                                                        if L1_226 == 2 then
                                                                          L1_226 = A0_224.npc
                                                                          L1_226 = L1_226.isMotionEnd
                                                                          L1_226 = L1_226(L2_227)
                                                                          if L1_226 then
                                                                            L1_226 = print
                                                                            L1_226(L2_227)
                                                                            L1_226 = A0_224
                                                                            L1_226 = L1_226.changeStatus
                                                                            L1_226(L2_227, L3_228, L4_229)
                                                                          end
                                                                        else
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                  else
                                                                    L1_226 = A0_224.status
                                                                    if L1_226 == L2_227 then
                                                                      L1_226 = A0_224.cautionMode
                                                                      if L1_226 == L2_227 then
                                                                        L1_226 = isInSight
                                                                        L1_226 = L1_226(L2_227, L3_228)
                                                                        if L1_226 then
                                                                          L1_226 = isSightCheckEnable
                                                                          L1_226 = L1_226(L2_227)
                                                                          if L1_226 then
                                                                            L1_226 = getNearPosforPC
                                                                            L1_226 = L1_226(L2_227, L3_228)
                                                                            A0_224.targetPos = L1_226
                                                                            L1_226 = {L2_227}
                                                                            L2_227.pos = L3_228
                                                                            L2_227.opt = L3_228
                                                                            L2_227(L3_228, L4_229)
                                                                            if L2_227 < L3_228 then
                                                                              A0_224.caution = L2_227
                                                                              L2_227(L3_228, L4_229, L5_230)
                                                                            else
                                                                              A0_224.caution = L2_227
                                                                              L2_227(L3_228, L4_229, L5_230)
                                                                              do break end
                                                                              else
                                                                                L1_226 = A0_224.indicationEnable
                                                                                if L1_226 then
                                                                                  L1_226 = getCautionValue
                                                                                  L1_226 = L1_226(L2_227, L3_228)
                                                                                  L1_226 = L1_226 * L2_227
                                                                                  if L1_226 <= 0 then
                                                                                  elseif L2_227 then
                                                                                    L3_228(L4_229, L5_230)
                                                                                  end
                                                                                else
                                                                                  L1_226 = A0_224.npc
                                                                                  L1_226 = L1_226.isMoveEnd
                                                                                  L1_226 = L1_226(L2_227)
                                                                                  if L1_226 then
                                                                                    L1_226 = A0_224.cautionDecCoefficent
                                                                                    L1_226 = 1 * L1_226
                                                                                    L2_227(L3_228, L4_229)
                                                                                  end
                                                                                end
                                                                              end
                                                                              else
                                                                                L1_226 = Fn_getDistanceToPlayer
                                                                                L1_226 = L1_226(L2_227)
                                                                                if L1_226 <= L2_227 then
                                                                                  if L1_226 <= L2_227 then
                                                                                    L2_227(L3_228)
                                                                                    L2_227(L3_228)
                                                                                    A0_224.caution = L2_227
                                                                                    L2_227(L3_228, L4_229, L5_230)
                                                                                  else
                                                                                    L2_227(L3_228)
                                                                                    L2_227(L3_228)
                                                                                    A0_224.caution = L2_227
                                                                                    L2_227(L3_228, L4_229, L5_230)
                                                                                  end
                                                                              end
                                                                              else
                                                                                L1_226 = A0_224.statusPhase
                                                                                if L1_226 == 0 then
                                                                                  L1_226 = invokeTask
                                                                                  L1_226 = L1_226(L2_227, L3_228)
                                                                                  A0_224.moveTimerTask = L1_226
                                                                                  A0_224.statusPhase = 1
                                                                                else
                                                                                  L1_226 = A0_224.statusPhase
                                                                                  if L1_226 == 1 then
                                                                                    L1_226 = A0_224.npc
                                                                                    L1_226 = L1_226.isMoveEnd
                                                                                    L1_226 = L1_226(L2_227)
                                                                                    if not L1_226 then
                                                                                      L1_226 = A0_224.moveTimerTask
                                                                                      L1_226 = L1_226.isRunning
                                                                                      L1_226 = L1_226(L2_227)
                                                                                    elseif L1_226 == false then
                                                                                      L1_226 = A0_224.moveTimerTask
                                                                                      L1_226 = L1_226.abort
                                                                                      L1_226(L2_227)
                                                                                      A0_224.moveTimerTask = nil
                                                                                      L1_226 = A0_224.npc
                                                                                      L1_226 = L1_226.reset
                                                                                      L1_226(L2_227)
                                                                                      L1_226 = A0_224.npc
                                                                                      L1_226 = L1_226.playMotion
                                                                                      L1_226(L2_227, L3_228, L4_229)
                                                                                      A0_224.statusPhase = 2
                                                                                    end
                                                                                  else
                                                                                    L1_226 = A0_224.statusPhase
                                                                                    if L1_226 == 2 then
                                                                                      L1_226 = A0_224.npc
                                                                                      L1_226 = L1_226.isMotionEnd
                                                                                      L1_226 = L1_226(L2_227)
                                                                                      if L1_226 then
                                                                                        L1_226 = print
                                                                                        L1_226(L2_227)
                                                                                        L1_226 = A0_224
                                                                                        L1_226 = L1_226.changeStatus
                                                                                        L1_226(L2_227, L3_228, L4_229)
                                                                                      end
                                                                                    else
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                              else
                                                                                L1_226 = A0_224.status
                                                                                if L1_226 == L2_227 then
                                                                                  L1_226 = A0_224.combatReady
                                                                                  if not L1_226 then
                                                                                    L1_226 = A0_224.combatReady2
                                                                                  else
                                                                                    if L1_226 then
                                                                                      L1_226 = print
                                                                                      L1_226(L2_227)
                                                                                      A0_224.combatTimeout = false
                                                                                      L1_226 = A0_224.npc
                                                                                      L1_226 = L1_226.changeEnemy
                                                                                      L1_226(L2_227)
                                                                                      L1_226 = Fn_setGrabNpc
                                                                                      L1_226(L2_227, L3_228, L4_229)
                                                                                      L1_226 = A0_224.npc
                                                                                      L1_226 = L1_226.setIgnoreGrabThrow
                                                                                      L1_226(L2_227, L3_228)
                                                                                      L1_226 = A0_224.npc
                                                                                      L1_226 = L1_226.enableHomingTarget
                                                                                      L1_226(L2_227, L3_228)
                                                                                      L1_226 = A0_224.combatTimeEnable
                                                                                      if L1_226 then
                                                                                        L1_226 = A0_224.battleTimerTask
                                                                                        if L1_226 ~= nil then
                                                                                          L1_226 = A0_224.battleTimerTask
                                                                                          L1_226 = L1_226.abort
                                                                                          L1_226(L2_227)
                                                                                          A0_224.battleTimerTask = nil
                                                                                        end
                                                                                        L1_226 = EventHelper
                                                                                        L1_226 = L1_226.timerCallback
                                                                                        L1_226 = L1_226(L2_227, L3_228, L4_229, L5_230)
                                                                                        A0_224.battleTimerTask = L1_226
                                                                                      end
                                                                                      L1_226 = A0_224
                                                                                      L1_226 = L1_226.changeStatus
                                                                                      L1_226(L2_227, L3_228, L4_229)
                                                                                  end
                                                                                  else
                                                                                    L1_226 = A0_224.cautionMode
                                                                                    if L1_226 == L2_227 then
                                                                                      L1_226 = isInSight
                                                                                      L1_226 = L1_226(L2_227, L3_228)
                                                                                      if L1_226 then
                                                                                        L1_226 = isSightCheckEnable
                                                                                        L1_226 = L1_226(L2_227)
                                                                                        if L1_226 then
                                                                                          L1_226 = COOLDOWN_TIME
                                                                                          A0_224.coolDown = L1_226
                                                                                          L1_226 = Fn_getPlayer
                                                                                          L1_226 = L1_226()
                                                                                          A0_224.targetPos = L1_226
                                                                                          L1_226 = A0_224.chaseMode
                                                                                          if L1_226 then
                                                                                            L1_226 = A0_224.npc
                                                                                            L1_226 = L1_226.isMoveEnd
                                                                                            L1_226 = L1_226(L2_227)
                                                                                            if L1_226 then
                                                                                              L1_226 = {L2_227}
                                                                                              L2_227.pos = L3_228
                                                                                              L2_227.opt = L3_228
                                                                                              L2_227(L3_228, L4_229)
                                                                                              L2_227(L3_228, L4_229)
                                                                                            end
                                                                                            L1_226 = A0_224.npcPuppet
                                                                                            L1_226 = L1_226.getWorldPos
                                                                                            L1_226 = L1_226(L2_227)
                                                                                            L6_231 = L4_229(L5_230)
                                                                                            if L2_227 < L3_228 then
                                                                                              A0_224.targetPos = L2_227
                                                                                              L2_227(L3_228)
                                                                                              L2_227(L3_228, L4_229, L5_230)
                                                                                            end
                                                                                          else
                                                                                            L1_226 = A0_224.terminateMode
                                                                                            if L1_226 then
                                                                                              L1_226 = A0_224
                                                                                              L1_226 = L1_226.changeStatus
                                                                                              L1_226(L2_227, L3_228, L4_229)
                                                                                            else
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      else
                                                                                        L1_226 = A0_224.coolDown
                                                                                        L1_226 = L1_226 - 1
                                                                                        A0_224.coolDown = L1_226
                                                                                        L1_226 = A0_224.coolDown
                                                                                        if L1_226 < 0 then
                                                                                          L1_226 = getNearPosforPC
                                                                                          L1_226 = L1_226(L2_227)
                                                                                          A0_224.targetPos = L1_226
                                                                                          L1_226 = A0_224.npc
                                                                                          L1_226 = L1_226.reset
                                                                                          L1_226(L2_227)
                                                                                          L1_226 = print
                                                                                          L1_226(L2_227)
                                                                                          L1_226 = RAC_CautionLevel
                                                                                          L1_226 = L1_226.MAX_LEVEL
                                                                                          L1_226 = L1_226 - 1
                                                                                          A0_224.caution = L1_226
                                                                                          L1_226 = A0_224
                                                                                          L1_226 = L1_226.changeStatus
                                                                                          L1_226(L2_227, L3_228, L4_229)
                                                                                        else
                                                                                        end
                                                                                      end
                                                                                    else
                                                                                      L1_226 = A0_224.chaseMode
                                                                                      if L1_226 then
                                                                                        L1_226 = Fn_getPlayer
                                                                                        L1_226 = L1_226()
                                                                                        A0_224.targetPos = L1_226
                                                                                        L1_226 = A0_224.npc
                                                                                        L1_226 = L1_226.isMoveEnd
                                                                                        L1_226 = L1_226(L2_227)
                                                                                        if L1_226 then
                                                                                          L1_226 = {L2_227}
                                                                                          L2_227.pos = L3_228
                                                                                          L2_227.opt = L3_228
                                                                                          L2_227(L3_228, L4_229)
                                                                                          L2_227(L3_228, L4_229)
                                                                                        end
                                                                                        L1_226 = A0_224.npcPuppet
                                                                                        L1_226 = L1_226.getWorldPos
                                                                                        L1_226 = L1_226(L2_227)
                                                                                        L6_231 = L4_229(L5_230)
                                                                                        if L2_227 < L3_228 then
                                                                                          L2_227(L3_228, L4_229, L5_230)
                                                                                          break
                                                                                        else
                                                                                          if L2_227 > L3_228 then
                                                                                            A0_224.coolDown = L3_228
                                                                                            if L3_228 < 0 then
                                                                                              A0_224.coolDown = 0
                                                                                              A0_224.targetPos = L3_228
                                                                                              L3_228(L4_229)
                                                                                              L3_228(L4_229)
                                                                                              A0_224.caution = L3_228
                                                                                              L6_231 = CALLBACK_REASON
                                                                                              L6_231 = L6_231.LOST_TARGET
                                                                                              L3_228(L4_229, L5_230, L6_231)
                                                                                            end
                                                                                          else
                                                                                          end
                                                                                        end
                                                                                      else
                                                                                        L1_226 = Fn_getDistanceToPlayer
                                                                                        L1_226 = L1_226(L2_227)
                                                                                        if L1_226 >= 0 then
                                                                                          if L1_226 <= L2_227 then
                                                                                          end
                                                                                        else
                                                                                          A0_224.coolDown = L2_227
                                                                                          if L2_227 < 0 then
                                                                                            A0_224.coolDown = 0
                                                                                            A0_224.targetPos = L2_227
                                                                                            L2_227(L3_228)
                                                                                            L2_227(L3_228)
                                                                                            A0_224.caution = L2_227
                                                                                            L2_227(L3_228, L4_229, L5_230)
                                                                                          else
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                else
                                                                                  L1_226 = A0_224.status
                                                                                  if L1_226 == L2_227 then
                                                                                    L1_226 = A0_224.combatTimeout
                                                                                    if L1_226 then
                                                                                      A0_224.combatTimeout = false
                                                                                      L1_226 = A0_224.combatTimeoutCallbackOnly
                                                                                      if L1_226 == true then
                                                                                        L1_226 = A0_224
                                                                                        L1_226 = L1_226.changeStatus
                                                                                        L1_226(L2_227, L3_228, L4_229)
                                                                                      else
                                                                                        L1_226 = A0_224.npc
                                                                                        L1_226 = L1_226.isEnemy
                                                                                        L1_226 = L1_226(L2_227)
                                                                                        if L1_226 then
                                                                                          L1_226 = A0_224.npc
                                                                                          L1_226 = L1_226.enableHomingTarget
                                                                                          L1_226(L2_227, L3_228)
                                                                                          L1_226 = A0_224.npc
                                                                                          L1_226 = L1_226.changeNpc
                                                                                          L1_226(L2_227)
                                                                                          A0_224.combatReady2 = false
                                                                                        end
                                                                                        A0_224.caution = 0
                                                                                        L1_226 = A0_224.terminateMode
                                                                                        if L1_226 then
                                                                                          L1_226 = print
                                                                                          L1_226(L2_227)
                                                                                          L1_226 = A0_224
                                                                                          L1_226 = L1_226.changeStatus
                                                                                          L1_226(L2_227, L3_228, L4_229)
                                                                                        else
                                                                                          L1_226 = print
                                                                                          L1_226(L2_227)
                                                                                          L1_226 = A0_224
                                                                                          L1_226 = L1_226.setDamagedEvent
                                                                                          L1_226(L2_227)
                                                                                          L1_226 = A0_224
                                                                                          L1_226 = L1_226.changeStatus
                                                                                          L1_226(L2_227, L3_228, L4_229)
                                                                                        end
                                                                                      end
                                                                                    else
                                                                                    end
                                                                                  else
                                                                                    L1_226 = A0_224.status
                                                                                    if L1_226 == L2_227 then
                                                                                    else
                                                                                      L1_226 = A0_224.status
                                                                                      if L1_226 == L2_227 then
                                                                                      else
                                                                                        L1_226 = A0_224.status
                                                                                        if L1_226 == L2_227 then
                                                                                          L1_226 = A0_224.hackDuration
                                                                                          L1_226 = L1_226 % 100
                                                                                          if L1_226 == 0 then
                                                                                            L1_226 = A0_224.headLoc
                                                                                            L1_226 = L1_226.setWorldTransform
                                                                                            L6_231 = 2
                                                                                            L1_226(L2_227, L3_228)
                                                                                            L1_226 = HUD
                                                                                            L1_226 = L1_226.scorePop
                                                                                            L1_226(L2_227, L3_228, L4_229)
                                                                                          end
                                                                                          L1_226 = Fn_getPlayer
                                                                                          L1_226 = L1_226()
                                                                                          A0_224.targetPos = L1_226
                                                                                          L1_226 = A0_224.npc
                                                                                          L1_226 = L1_226.isMoveEnd
                                                                                          L1_226 = L1_226(L2_227)
                                                                                          if L1_226 then
                                                                                            L1_226 = {L2_227}
                                                                                            L2_227.pos = L3_228
                                                                                            L2_227.opt = L3_228
                                                                                            L2_227(L3_228, L4_229)
                                                                                            L2_227(L3_228, L4_229)
                                                                                          end
                                                                                          L1_226 = A0_224.hackDuration
                                                                                          L1_226 = L1_226 - 1
                                                                                          A0_224.hackDuration = L1_226
                                                                                          L1_226 = A0_224.hackDuration
                                                                                          if L1_226 < 0 then
                                                                                            A0_224.hackDuration = -1
                                                                                            L1_226 = print
                                                                                            L1_226(L2_227)
                                                                                            L1_226 = A0_224.npc
                                                                                            L1_226 = L1_226.reset
                                                                                            L1_226(L2_227)
                                                                                            A0_224.caution = 0
                                                                                            A0_224.indication = 0
                                                                                            L1_226 = A0_224
                                                                                            L1_226 = L1_226.changeStatus
                                                                                            L1_226(L2_227, L3_228, L4_229)
                                                                                          else
                                                                                          end
                                                                                        else
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                  end
                                                                end
                                                              end
                                                      end
                                                    end
                                                  end
                                          end
                                        end
                                      end
                                  end
                                end
                              end
                        end
                      end
                    end
                  end
                end
              end
        L1_226 = A0_224.caution
        if L1_226 > 0 then
          L1_226 = A0_224.npcPuppet
          if L1_226 ~= nil then
            L1_226 = A0_224.npc
            L1_226 = L1_226.isNpc
            L1_226 = L1_226(L2_227)
            if L1_226 == true then
              L1_226 = A0_224.naviFlag
              if L1_226 == false then
                L1_226 = RAC_MultiNaviAdd
                L1_226(L2_227, L3_228, L4_229, L5_230)
                A0_224.naviFlag = true
              end
            end
          end
        else
          L1_226 = A0_224.naviFlag
          if L1_226 == true then
            L1_226 = RAC_MultiNaviDel
            L1_226(L2_227)
            A0_224.naviFlag = false
          end
        end
        L1_226 = wait
        L1_226()
      end
    end
  end)
end
perceivableNpcAction = L0_0
