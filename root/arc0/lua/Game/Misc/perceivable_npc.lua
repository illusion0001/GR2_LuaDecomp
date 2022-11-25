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
L0_0.UNKNOWN = 99
CALLBACK_REASON = L0_0
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
  L2_9 = false
  if A0_7 then
    L4_11 = A0_7
    L3_10 = A0_7.getJointWorldTransform
    L5_12 = A1_8.headLoc
    L4_11 = L3_10(L4_11, L5_12)
    L5_12 = XYZRotQuatD
    L6_13 = 90
    L7_14 = 0
    L8_15 = 0
    L5_12 = L5_12(L6_13, L7_14, L8_15)
    L5_12 = L4_11 * L5_12
    L6_13 = Fn_getPlayer
    L6_13 = L6_13()
    L7_14 = L6_13
    L6_13 = L6_13.getWorldTransform
    L7_14 = L6_13(L7_14)
    L8_15 = Vector
    L9_16 = 0
    L10_17 = 0
    L11_18 = 0
    L8_15 = L8_15(L9_16, L10_17, L11_18)
    L8_15 = L3_10 + L8_15
    L9_16 = Query
    L10_17 = L9_16
    L9_16 = L9_16.setEyeSightTransform
    L11_18 = L8_15
    L12_19 = L5_12
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
    L12_19 = L9_16 - L6_13
    L11_18 = L11_18(L12_19)
    L12_19 = 0.25
    L13_20 = L12_19 * 2
    for L17_24 = 1, 3 do
      L18_25 = L17_24 - 1
      L18_25 = L13_20 * L18_25
      L18_25 = L18_25 + L12_19
      L18_25 = L11_18 * L18_25
      L18_25 = L6_13 + L18_25
      L19_26 = 0.25
      if not Query:checkEyeSightSphere(L18_25, L19_26) or Query:raycastEyeSight(L18_25) then
      else
        L2_9 = true
        do break end
        break
      end
    end
  end
  return L2_9
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
function L0_0(A0_52, A1_53)
  return Fn_findNpcPuppet(A0_52):getWorldPos() + NormalizeVector(A1_53 - Fn_findNpcPuppet(A0_52):getWorldPos()) * 0.5
end
getNearPos = L0_0
function L0_0(A0_54)
  local L1_55, L2_56
  L1_55 = getNearPos
  L2_56 = A0_54
  return L1_55(L2_56, Fn_getPlayerWorldPos())
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
CautionLevel = L0_0
L0_0 = CautionLevel
L0_0.MAX_LEVEL = 100
L0_0 = CautionLevel
L0_0.visible = true
L0_0 = CautionLevel
L0_0.value = 0
L0_0 = CautionLevel
L1_1 = {}
L0_0.npcList = L1_1
L0_0 = CautionLevel
L0_0.task = nil
L0_0 = CautionLevel
L0_0.label = "\232\173\166\230\136\146\229\186\166"
L0_0 = CautionLevel
L0_0.keepVisible = true
L0_0 = CautionLevel
function L1_1(A0_73)
  if type(A0_73) == "boolean" then
    CautionLevel.visible = A0_73
  end
end
L0_0.setVisible = L1_1
L0_0 = CautionLevel
function L1_1(A0_74)
  local L1_75
  if A0_74 < 0 then
    A0_74 = 0
  else
    L1_75 = CautionLevel
    L1_75 = L1_75.MAX_LEVEL
    if A0_74 > L1_75 then
      L1_75 = CautionLevel
      A0_74 = L1_75.MAX_LEVEL
    end
  end
  L1_75 = CautionLevel
  L1_75.value = A0_74
end
L0_0.setValue = L1_1
L0_0 = CautionLevel
function L1_1()
  if CautionLevel.task ~= nil then
    CautionLevel.task:abort()
    CautionLevel.task = nil
  end
  CautionLevel.task = invokeTask(function()
    while true do
      CautionLevel.calcValue()
      CautionLevel.draw()
      wait()
    end
  end)
end
L0_0.drawTask = L1_1
L0_0 = CautionLevel
function L1_1()
  if CautionLevel.value > 0 then
    if not HUD:miniGaugeIsVisible() then
      HUD:miniGaugeSetVisible(true)
    end
    HUD:miniGaugeSetTextID(CautionLevel.label)
    HUD:miniGaugeSetType(HUD.kCountType_Up, 0.5)
    HUD:miniGaugeSetNum(CautionLevel.value / 100, false)
  elseif CautionLevel.keepVisible then
    if not HUD:miniGaugeIsVisible() then
      HUD:miniGaugeSetVisible(true)
    end
    HUD:miniGaugeSetTextID(CautionLevel.label)
    HUD:miniGaugeSetType(HUD.kCountType_Up, 0.5)
    HUD:miniGaugeSetNum(CautionLevel.value / 100, false)
  elseif HUD:miniGaugeIsVisible() then
    HUD:miniGaugeSetVisible(false)
  end
end
L0_0.draw = L1_1
L0_0 = CautionLevel
function L1_1(A0_76)
  if type(A0_76) == "table" then
    CautionLevel.npcList = A0_76
  end
end
L0_0.setNpc = L1_1
L0_0 = CautionLevel
function L1_1()
  local L0_77
  L0_77 = CautionLevel
  L0_77 = L0_77.npcList
  L0_77 = #L0_77
  if L0_77 <= 0 then
    return
  end
  L0_77 = 0
  for _FORV_4_ = 1, #CautionLevel.npcList do
    if CautionLevel.npcList[_FORV_4_].status ~= NPC_STATUS.DEAD and CautionLevel.npcList[_FORV_4_].status ~= NPC_STATUS.TERMINATE and L0_77 < CautionLevel.npcList[_FORV_4_].caution then
      L0_77 = CautionLevel.npcList[_FORV_4_].caution
    end
  end
  _FOR_.setValue(L0_77)
end
L0_0.calcValue = L1_1
L0_0 = CautionLevel
function L1_1()
  local L0_78, L1_79, L2_80, L3_81
  if L0_78 <= 0 then
    return
  end
  for L3_81 = 1, #L1_79 do
    if CautionLevel.npcList[L3_81].status ~= NPC_STATUS.DEAD and CautionLevel.npcList[L3_81].status ~= NPC_STATUS.TERMINATE then
      CautionLevel.npcList[L3_81]:terminate()
    end
  end
end
L0_0.allTerminate = L1_1
L0_0 = CautionLevel
function L1_1()
  if CautionLevel.task ~= nil then
    CautionLevel.task:abort()
    CautionLevel.task = nil
  end
  CautionLevel:setValue(0)
  CautionLevel:setVisible(false)
end
L0_0.reset = L1_1
L0_0 = CautionLevel
function L1_1(A0_82)
  if type(A0_82) == "string" then
    CautionLevel.label = A0_82
  end
end
L0_0.setLabel = L1_1
L0_0 = CautionLevel
function L1_1(A0_83)
  if type(A0_83) == "boolean" then
    CautionLevel.keepVisible = A0_83
  end
end
L0_0.setKeepVisible = L1_1
L0_0 = {}
PerceivableNpc = L0_0
L0_0 = PerceivableNpc
function L1_1(A0_84, A1_85)
  local L2_86
  L2_86 = {}
  L2_86.NORMAL = 1
  L2_86.CAUTION = 2
  L2_86.ALERT = 3
  L2_86.COMBAT = 4
  L2_86.TERMINATE = 5
  L2_86.DEAD = 6
  L2_86.HACKED = 7
  NPC_STATUS = L2_86
  L2_86 = {}
  L2_86.TIME = 1
  L2_86.RANGE = 2
  CAUTION_MODE = L2_86
  COMBAT_TIME = 5
  CAPTURE_DISTANCE = 1.5
  COOLDOWN_TIME = 90
  L2_86 = {}
  L2_86.npcName = A0_84
  L2_86.npc = Fn_findNpc(A0_84)
  L2_86.npcPuppet = Fn_findNpcPuppet(A0_84)
  L2_86.task = nil
  L2_86.status = NPC_STATUS.NORMAL
  L2_86.oldStatus = L2_86.status
  L2_86.dead = false
  L2_86.combatTimeout = false
  L2_86.battleTimerTask = nil
  L2_86.hackCount = 0
  L2_86.caution = 0
  L2_86.cautionIncCoefficent = 1
  L2_86.cautionDecCoefficent = 1
  L2_86.alertRange = 3
  L2_86.cautionRange = 10
  L2_86.cautionMode = CAUTION_MODE.TIME
  L2_86.indicationEnable = true
  L2_86.indication = 0
  L2_86.indicationRange = 3
  L2_86.indicationIncCoefficent = 1
  L2_86.indicationDecCoefficent = 1
  L2_86.noIndicationTime = 30
  L2_86.noIndicationCount = 30
  L2_86.sightParam = {}
  L2_86.sightParam.degH = 90
  L2_86.sightParam.degV = 45
  L2_86.sightParam.length = 10
  L2_86.sightParam.headLoc = "bn_head"
  L2_86.pcSightParam = {}
  L2_86.pcSightParam.degH = 50
  L2_86.pcSightParam.degV = 50
  L2_86.pcSightParam.length = 15
  L2_86.pcSightParam.headLoc = "bn_head"
  L2_86.perceiveEachOther = false
  L2_86.combatReady = true
  L2_86.combatReady2 = false
  L2_86.combatTimeEnable = true
  L2_86.combatTime = COMBAT_TIME
  L2_86.combatReadyIfDamaged = false
  L2_86.enemyGenerator = nil
  L2_86.chaseMode = false
  L2_86.terminate = false
  L2_86.coolDown = COOLDOWN_TIME
  L2_86.posList = {}
  L2_86.posList2 = {}
  L2_86.changeRouteImmediately = false
  L2_86.routeChanged = false
  L2_86.moveOption = {}
  L2_86.chaseMoveOption = {}
  L2_86.loop = true
  L2_86.currentMovePos = -1
  L2_86.motion = "stay"
  L2_86.dismissMotion = "lookaround"
  L2_86.changeStateFunction = nil
  L2_86.callbackReason = 0
  L2_86.targetPos = nil
  L2_86.enemyGen = nil
  L2_86.initHackDuration = 2100
  L2_86.hackDuration = initHackDuration
  L2_86.livelyActionEnable = false
  L2_86.livelyActionRange = 3
  L2_86.livelyActionTable = nil
  L2_86.livelyAction = false
  L2_86.detectGravity = false
  L2_86.headLoc = nil
  L2_86.report = false
  L2_86.reportPos = nil
  L2_86.damageType = -1
  L2_86.noDamageAction = ""
  function L2_86.taskAbort(A0_87)
    if A0_87.task ~= nil then
      A0_87.task:abort()
      A0_87.task = nil
    end
  end
  function L2_86.action(A0_88)
    A0_88.task = perceivableNpcAction(A0_88, A1_85)
  end
  function L2_86.terminate(A0_89)
    if A0_89.npc:isEnemy() then
      A0_89.npc:changeNpc()
    end
    if not A0_89.npc:isMoveEnd() then
      A0_89.npc:reset()
    end
    print(" -> TERMINATION")
    A0_89.caution = 0
    A0_89.indication = 0
    A0_89.callbackReason = CALLBACK_REASON.FORCED_TERMINATION
    A0_89.status = NPC_STATUS.TERMINATE
  end
  function L2_86.restart(A0_90)
    if A0_90.status == NPC_STATUS.TERMINATE then
      print("TERMINATE -> NORMAL")
      A0_90.caution = 0
      A0_90.indication = 0
      A0_90.callbackReason = CALLBACK_REASON.RESTART
      A0_90.status = NPC_STATUS.NORMAL
    end
  end
  function L2_86.setOnChangeState(A0_91, A1_92)
    if type(A1_92) == "function" then
      L2_86.changeStateFunction = A1_92
    end
  end
  function L2_86.setSightParam(A0_93, A1_94, A2_95)
    local L3_96
    L3_96 = A0_93.sightParam
    L3_96.degH = A1_94
    L3_96 = A0_93.sightParam
    L3_96.degV = A1_94
    L3_96 = A0_93.sightParam
    L3_96.length = A2_95
  end
  function L2_86.setSightParam2(A0_97, A1_98, A2_99, A3_100)
    local L4_101
    L4_101 = A0_97.sightParam
    L4_101.degH = A1_98
    L4_101 = A0_97.sightParam
    L4_101.degV = A2_99
    L4_101 = A0_97.sightParam
    L4_101.length = A3_100
  end
  function L2_86.setPcSightParam(A0_102, A1_103, A2_104)
    local L3_105
    L3_105 = A0_102.sightParam
    L3_105.degH = A1_103
    L3_105 = A0_102.sightParam
    L3_105.degV = A1_103
    L3_105 = A0_102.sightParam
    L3_105.length = A2_104
  end
  function L2_86.setHeadLoc(A0_106, A1_107)
    if A1_107 ~= nil then
      A0_106.sightParam.headLoc = A1_107
    end
  end
  function L2_86.setPosList(A0_108, A1_109)
    if A1_109 ~= nil and #A1_109 > 0 then
      A0_108.posList = A1_109
      A0_108.posListChanged = true
    end
  end
  function L2_86.setChangeRouteImmediately(A0_110, A1_111)
    if type(A1_111) == "boolean" then
      L2_86.changeRouteImmediately = A1_111
    end
  end
  function L2_86.setMoveOption(A0_112, A1_113)
    if A1_113 ~= nil and type(A1_113) == "table" then
      A0_112.moveOption = A1_113
    end
  end
  function L2_86.setChaseMoveOption(A0_114, A1_115)
    if A1_115 ~= nil and type(A1_115) == "table" then
      A0_114.chaseMoveOption = A1_115
    end
  end
  function L2_86.setLoop(A0_116, A1_117)
    if type(A1_117) == "boolean" then
      L2_86.loop = A1_117
    end
  end
  function L2_86.setStayMotion(A0_118, A1_119)
    if A1_119 ~= nil then
      A0_118.motion = A1_119
    end
  end
  function L2_86.setDismissMotion(A0_120, A1_121)
    if A1_121 ~= nil then
      A0_120.dismissMotion = A1_121
    end
  end
  function L2_86.setCautionLevel(A0_122, A1_123)
    if A1_123 < 0 then
      A1_123 = 0
    elseif A1_123 > 100 then
      A1_123 = 100
    end
    A0_122.caution = A1_123
  end
  function L2_86.setAlertRange(A0_124, A1_125)
    if type(A1_125) == "number" and A1_125 >= 0 then
      A0_124.alertRange = A1_125
    end
  end
  function L2_86.setCautionRange(A0_126, A1_127)
    if type(A1_127) == "number" and A1_127 >= 0 then
      A0_126.cautionRange = A1_127
    end
  end
  function L2_86.setCautionMode(A0_128, A1_129)
    if type(A1_129) == "number" and A1_129 >= 0 then
      L2_86.cautionMode = A1_129
    end
  end
  function L2_86.setIndicationLevel(A0_130, A1_131)
    if A1_131 < 0 then
      A1_131 = 0
    elseif A1_131 > 100 then
      A1_131 = 100
    end
    A0_130.indication = A1_131
  end
  function L2_86.setIndicationEnable(A0_132, A1_133)
    if type(A1_133) == "boolean" then
      A0_132.indicationEnable = A1_133
    end
  end
  function L2_86.setIndicationRange(A0_134, A1_135)
    if type(A1_135) == "number" and A1_135 >= 0 then
      A0_134.indicationRange = A1_135
    end
  end
  function L2_86.setPerceiveEachOther(A0_136, A1_137)
    if type(A1_137) == "boolean" then
      A0_136.perceiveEachOther = A1_137
    end
  end
  function L2_86.setCombatReady(A0_138, A1_139)
    if type(A1_139) == "boolean" then
      A0_138.combatReady = A1_139
    end
  end
  function L2_86.setCombatTimeEnable(A0_140, A1_141)
    if type(A1_141) == "boolean" then
      A0_140.combatTimeEnable = A1_141
    end
  end
  function L2_86.setCombatTime(A0_142, A1_143)
    if type(A1_143) == "number" and A1_143 >= 0 then
      A0_142.combatTime = A1_143
    end
  end
  function L2_86.setEnemyGenerator(A0_144, A1_145)
    if A1_145 ~= nil then
      A0_144.enemyGenerator = A1_145
      A0_144.npc:setEnemyGenerator(A0_144.enemyGenerator)
    end
  end
  function L2_86.setCombatReadyIfDamaged(A0_146, A1_147)
    if type(A1_147) == "boolean" then
      A0_146.combatReadyIfDamaged = A1_147
    end
  end
  function L2_86.setChaseMode(A0_148, A1_149)
    if type(A1_149) == "boolean" then
      A0_148.chaseMode = A1_149
    end
  end
  function L2_86.setTerminate(A0_150, A1_151)
    if type(A1_151) == "boolean" then
      A0_150.terminate = A1_151
    end
  end
  function L2_86.setCautionCoefficient(A0_152, A1_153, A2_154)
    local L3_155
    if A1_153 > 0 then
      L3_155 = A1_153 * 5
      A0_152.cautionIncCoefficent = L3_155
    else
      A0_152.cautionIncCoefficent = 5
    end
    if A2_154 > 0 then
      L3_155 = A2_154 * 5
      A0_152.cautionDecCoefficent = L3_155
    else
      A0_152.cautionDecCoefficent = 5
    end
  end
  function L2_86.setIndicationCoefficient(A0_156, A1_157, A2_158)
    if A1_157 > 0 then
      A0_156.indicationIncCoefficent = A1_157
    else
      A0_156.indicationIncCoefficent = 1
    end
    if A2_158 > 0 then
      A0_156.indicationDecCoefficent = A2_158
    else
      A0_156.indicationDecCoefficent = 1
    end
  end
  function L2_86.setNoIndicationTime(A0_159, A1_160)
    if type(A1_160) == "number" and A1_160 >= 0 then
      A0_159.noIndicationTime = A1_160
      A0_159.noIndicationCount = A1_160
    end
  end
  function L2_86.setLivelyActionEnable(A0_161, A1_162)
    if type(A1_162) == "boolean" then
      A0_161.livelyActionEnable = A1_162
    end
  end
  function L2_86.setLivelyActionRange(A0_163, A1_164)
    if type(A1_164) == "number" then
      A0_163.livelyActionRange = A1_164
    end
  end
  function L2_86.setLivelyActionTable(A0_165, A1_166)
    if A1_166 ~= nil and type(A1_166) == "table" then
      L2_86.livelyActionTable = A1_166
    end
  end
  function L2_86.hack(A0_167)
    A0_167.headLoc = createGameObject2("Node")
    A0_167.headLoc:setName(A0_167.npcName .. "_hacked")
    Fn_findAreaHandle("ed_a_root"):appendChild(L2_86.headLoc)
    A0_167.headLoc:try_init()
    A0_167.headLoc:waitForReady()
    A0_167.headLoc:try_start()
    print(" -> HACKED")
    A0_167.caution = 0
    A0_167.indication = 0
    A0_167.hackDuration = A0_167.initHackDuration
    A0_167.callbackReason = CALLBACK_REASON.HACKED
    A0_167.status = NPC_STATUS.HACKED
    A0_167.hackCount = 0
    invokeTask(function()
      while A0_167.status == NPC_STATUS.HACKED do
        A0_167.hackCount = A0_167.hackCount + 1
        wait()
      end
    end)
  end
  function L2_86.setHackDuration(A0_168, A1_169)
    if type(A1_169) == "number" then
      A0_168.initHackDuration = A1_169
    end
  end
  function L2_86.setDetectGravity(A0_170, A1_171)
    if type(A1_171) == "boolean" then
      A0_170.detectGravity = A1_171
    end
  end
  function L2_86.setReport(A0_172, A1_173)
    if A1_173 ~= nil then
      A0_172.report = true
      A0_172.reportPos = A1_173
    end
  end
  function L2_86.setDamageType(A0_174, A1_175, A2_176)
    if A1_175 < 0 or A1_175 > 2 then
      A0_174.damageType = -1
      return
    end
    A0_174.damageType = A1_175
    if A2_176 ~= nil and type(A2_176) == "string" then
      A0_174.noDamageAction = A2_176
    else
      A0_174.noDamageAction = ""
    end
  end
  function L2_86.setDamagedEvent(A0_177)
    if A0_177.damageType ~= -1 then
      A0_177.npc:changeDamageType(A0_177.damageType, A0_177.noDamageAction)
    end
    A0_177.npc:setEventListener("npcDamaged", function(A0_178)
      local L1_179, L2_180
      L1_179 = A0_178.attacker
      L2_180 = A0_178.damageType
      print(string.format("npcDamaged : %s o\239\190\159\208\148\239\190\159)==O %s \228\184\137\226\152\133)\239\190\159\226\151\135\239\190\159)%s", L1_179, L2_180, A0_177.npcName))
      if L1_179 ~= "player" and L1_179 ~= "supporter" or A0_177.status == NPC_STATUS.HACKED and A0_177.hackCount < 90 then
      else
        A0_177.npc:setEventListener("npcDamaged", nil)
        if A0_177.combatReadyIfDamaged then
          print("combatReady2 = true")
          A0_177.combatReady2 = true
        end
        if A0_177.npc:isNpc() and (A0_177.status == NPC_STATUS.NORMAL or A0_177.status == NPC_STATUS.CAUTION or A0_177.status == NPC_STATUS.HACKED) then
          print("npcDamaged : -> ALERT")
          A0_177.caution = 100
          A0_177.callbackReason = CALLBACK_REASON.DAMAGED
          A0_177.status = NPC_STATUS.ALERT
        end
      end
    end)
  end
  return L2_86
end
L0_0.new = L1_1
function L0_0(A0_181, A1_182)
  local L2_183
  L2_183 = A0_181.setDamagedEvent
  L2_183(A0_181)
  L2_183 = A0_181.npc
  L2_183 = L2_183.setEventListener
  L2_183(L2_183, "npcGrabbed", function()
    A0_181.npc:setEventListener("npcGrabbed", nil)
    print("npcGrabbed : " .. A0_181.npcName)
  end)
  L2_183 = A0_181.npc
  L2_183 = L2_183.setEventListener
  L2_183(L2_183, "npcDead", function()
    A0_181.npc:setEventListener("npcDead", nil)
    print("npcDead : " .. A0_181.npcName)
    if A0_181.battleTimerTask ~= nil then
      A0_181.battleTimerTask:abort()
      A0_181.battleTimerTask = nil
    end
    if A0_181.npc:isEnemy() then
    end
    A0_181.callbackReason = CALLBACK_REASON.DIED
    A0_181.status = NPC_STATUS.DEAD
  end)
  L2_183 = A0_181.npc
  L2_183 = L2_183.setEventListener
  L2_183(L2_183, "npcFall", function()
    A0_181.npc:setEventListener("npcFall", nil)
    print("npcFall : " .. A0_181.npcName)
  end)
  L2_183 = RandI
  L2_183 = L2_183(1, 8)
  return invokeTask(function()
    local L0_184, L1_185, L2_186, L3_187, L4_188
    L0_184 = {}
    L0_184.isRepeat = false
    L0_184.isRandom = false
    L0_184.isStop = true
    L0_184.animSpeed = 1
    L0_184.animBlendDuration = 0.5
    L1_185 = 1
    while true do
      L2_186 = L2_183
      if L2_186 == L1_185 then
        L2_186 = A0_181.dead
        if not L2_186 then
          L2_186 = Fn_findNpcPuppet
          L3_187 = A0_181.npcName
          L2_186 = L2_186(L3_187)
          A0_181.npcPuppet = L2_186
          L2_186 = A0_181.status
          L3_187 = NPC_STATUS
          L3_187 = L3_187.NORMAL
          if L2_186 == L3_187 then
            L2_186 = A0_181.cautionMode
            L3_187 = CAUTION_MODE
            L3_187 = L3_187.TIME
            if L2_186 == L3_187 then
              L2_186 = isInSight
              L3_187 = A0_181.npcName
              L4_188 = A0_181.sightParam
              L2_186 = L2_186(L3_187, L4_188)
              if L2_186 then
                L2_186 = isSightCheckEnable
                L3_187 = A0_181
                L2_186 = L2_186(L3_187)
                if L2_186 then
                  L2_186 = A0_181.currentMovePos
                  if L2_186 == -1 then
                    L2_186 = A0_181.npc
                    L3_187 = L2_186
                    L2_186 = L2_186.getMoveCurrentIndex
                    L2_186 = L2_186(L3_187)
                    A0_181.currentMovePos = L2_186
                    L2_186 = A0_181.currentMovePos
                    if L2_186 == -1 then
                      L2_186 = A0_181.posList
                      L2_186 = #L2_186
                      A0_181.currentMovePos = L2_186
                    end
                    L2_186 = getNearPosforPC
                    L3_187 = A0_181.npcName
                    L2_186 = L2_186(L3_187)
                    A0_181.targetPos = L2_186
                    L2_186 = {L3_187}
                    L3_187 = {}
                    L4_188 = A0_181.targetPos
                    L3_187.pos = L4_188
                    L4_188 = A0_181.moveOption
                    L3_187.opt = L4_188
                    L3_187 = A0_181.npc
                    L4_188 = L3_187
                    L3_187 = L3_187.move
                    L3_187(L4_188, L2_186)
                    L3_187 = A0_181.status
                    L4_188 = NPC_STATUS
                    L4_188 = L4_188.NORMAL
                    if L3_187 == L4_188 then
                      L3_187 = Fn_getDistanceToPlayer
                      L4_188 = A0_181.npcPuppet
                      L3_187 = L3_187(L4_188)
                      L4_188 = A0_181.alertRange
                      if L3_187 < L4_188 then
                        L3_187 = CautionLevel
                        L3_187 = L3_187.MAX_LEVEL
                        A0_181.caution = L3_187
                        L3_187 = CALLBACK_REASON
                        L3_187 = L3_187.CAUTION_OVERFLOW
                        A0_181.callbackReason = L3_187
                        L3_187 = NPC_STATUS
                        L3_187 = L3_187.ALERT
                        A0_181.status = L3_187
                      else
                        A0_181.caution = 10
                        L3_187 = CALLBACK_REASON
                        L3_187 = L3_187.IS_INSIGHT
                        A0_181.callbackReason = L3_187
                        L3_187 = NPC_STATUS
                        L3_187 = L3_187.CAUTION
                        A0_181.status = L3_187
                      end
                    end
                  else
                    else
                      L2_186 = A0_181.report
                      if L2_186 then
                        L2_186 = getNearPos
                        L3_187 = A0_181.reportPos
                        L2_186 = L2_186(L3_187)
                        A0_181.targetPos = L2_186
                        L2_186 = {L3_187}
                        L3_187 = {}
                        L4_188 = A0_181.targetPos
                        L3_187.pos = L4_188
                        L4_188 = A0_181.moveOption
                        L3_187.opt = L4_188
                        L3_187 = A0_181.npc
                        L4_188 = L3_187
                        L3_187 = L3_187.move
                        L3_187(L4_188, L2_186)
                        A0_181.caution = 80
                        L3_187 = CALLBACK_REASON
                        L3_187 = L3_187.RECEIVE_REPORT
                        A0_181.callbackReason = L3_187
                        L3_187 = NPC_STATUS
                        L3_187 = L3_187.CAUTION
                        A0_181.status = L3_187
                      else
                        L2_186 = A0_181.noIndicationCount
                        L2_186 = L2_186 - 1
                        A0_181.noIndicationCount = L2_186
                        L2_186 = A0_181.noIndicationCount
                        if L2_186 < 0 then
                          A0_181.noIndicationCount = 0
                        end
                        L2_186 = A0_181.indicationEnable
                        if L2_186 then
                          L2_186 = A0_181.noIndicationCount
                          if L2_186 <= 0 then
                            L2_186 = getCautionValue
                            L3_187 = A0_181.npcName
                            L4_188 = A0_181.indicationRange
                            L2_186 = L2_186(L3_187, L4_188)
                            L3_187 = A0_181.indicationIncCoefficent
                            L2_186 = L2_186 * L3_187
                            if L2_186 > 0 then
                              L3_187 = A0_181
                              L4_188 = L3_187
                              L3_187 = L3_187.setIndicationLevel
                              L3_187(L4_188, A0_181.indication + L2_186)
                              L3_187 = A0_181.indication
                              if L3_187 >= 100 then
                                L3_187 = A0_181.npc
                                L4_188 = L3_187
                                L3_187 = L3_187.isTurnEnd
                                L3_187 = L3_187(L4_188)
                                if L3_187 then
                                  L3_187 = getNearPosforPC
                                  L4_188 = A0_181.npcName
                                  L3_187 = L3_187(L4_188)
                                  A0_181.targetPos = L3_187
                                  L3_187 = A0_181.npc
                                  L4_188 = L3_187
                                  L3_187 = L3_187.turn
                                  L3_187(L4_188, A0_181.targetPos)
                                  L3_187 = A0_181.currentMovePos
                                  if L3_187 == -1 then
                                    L3_187 = A0_181.npc
                                    L4_188 = L3_187
                                    L3_187 = L3_187.getMoveCurrentIndex
                                    L3_187 = L3_187(L4_188)
                                    A0_181.currentMovePos = L3_187
                                    L3_187 = A0_181.currentMovePos
                                    if L3_187 == -1 then
                                      L3_187 = A0_181.posList
                                      L3_187 = #L3_187
                                      A0_181.currentMovePos = L3_187
                                    end
                                    L3_187 = A0_181.status
                                    L4_188 = NPC_STATUS
                                    L4_188 = L4_188.NORMAL
                                    if L3_187 == L4_188 then
                                      A0_181.caution = 50
                                      L3_187 = CALLBACK_REASON
                                      L3_187 = L3_187.INDICATION_OVERFLOW
                                      A0_181.callbackReason = L3_187
                                      L3_187 = NPC_STATUS
                                      L3_187 = L3_187.CAUTION
                                      A0_181.status = L3_187
                                      else
                                        else
                                          L3_187 = A0_181.indicationDecCoefficent
                                          L3_187 = 1 * L3_187
                                          L4_188 = A0_181
                                          L4_188 = L4_188.setIndicationLevel
                                          L4_188(L4_188, A0_181.indication - L3_187)
                                        end
                                        L2_186 = A0_181.status
                                        L3_187 = NPC_STATUS
                                        L3_187 = L3_187.NORMAL
                                        if L2_186 == L3_187 then
                                          L2_186 = A0_181.livelyActionEnable
                                          if L2_186 then
                                            L2_186 = A0_181.livelyActionTable
                                            if L2_186 ~= nil then
                                              L2_186 = Fn_getDistanceToPlayer
                                              L3_187 = A0_181.npcPuppet
                                              L2_186 = L2_186(L3_187)
                                              L3_187 = A0_181.livelyActionRange
                                              if L2_186 < L3_187 then
                                                L2_186 = A0_181.livelyAction
                                                if not L2_186 then
                                                  L2_186 = Fn_captionViewEnd
                                                  L2_186()
                                                  L2_186 = Fn_gestureAction
                                                  L3_187 = A0_181.livelyActionTable
                                                  L2_186(L3_187)
                                                  A0_181.livelyAction = true
                                                end
                                              else
                                                L2_186 = A0_181.livelyAction
                                                if L2_186 then
                                                  L2_186 = Fn_gestureActionCancel
                                                  L2_186()
                                                  A0_181.livelyAction = false
                                                end
                                              end
                                            end
                                          end
                                          else
                                            L2_186 = Fn_getDistanceToPlayer
                                            L3_187 = A0_181.npcPuppet
                                            L2_186 = L2_186(L3_187)
                                            L3_187 = A0_181.cautionRange
                                            if L2_186 <= L3_187 then
                                              L3_187 = A0_181.currentMovePos
                                              if L3_187 == -1 then
                                                L3_187 = A0_181.npc
                                                L4_188 = L3_187
                                                L3_187 = L3_187.getMoveCurrentIndex
                                                L3_187 = L3_187(L4_188)
                                                A0_181.currentMovePos = L3_187
                                                L3_187 = A0_181.currentMovePos
                                                if L3_187 == -1 then
                                                  L3_187 = A0_181.posList
                                                  L3_187 = #L3_187
                                                  A0_181.currentMovePos = L3_187
                                                end
                                                L3_187 = A0_181.status
                                                L4_188 = NPC_STATUS
                                                L4_188 = L4_188.NORMAL
                                                if L3_187 == L4_188 then
                                                  L3_187 = Fn_getDistanceToPlayer
                                                  L4_188 = A0_181.npcPuppet
                                                  L3_187 = L3_187(L4_188)
                                                  L4_188 = A0_181.alertRange
                                                  if L3_187 < L4_188 then
                                                    L3_187 = print
                                                    L4_188 = "NORMAL -> ALERT"
                                                    L3_187(L4_188)
                                                    L3_187 = A0_181.npc
                                                    L4_188 = L3_187
                                                    L3_187 = L3_187.reset
                                                    L3_187(L4_188)
                                                    L3_187 = CautionLevel
                                                    L3_187 = L3_187.MAX_LEVEL
                                                    A0_181.caution = L3_187
                                                    L3_187 = CALLBACK_REASON
                                                    L3_187 = L3_187.CAUTION_OVERFLOW
                                                    A0_181.callbackReason = L3_187
                                                    L3_187 = NPC_STATUS
                                                    L3_187 = L3_187.ALERT
                                                    A0_181.status = L3_187
                                                  else
                                                    L3_187 = print
                                                    L4_188 = "NORMAL -> CAUTION"
                                                    L3_187(L4_188)
                                                    L3_187 = A0_181.npc
                                                    L4_188 = L3_187
                                                    L3_187 = L3_187.reset
                                                    L3_187(L4_188)
                                                    A0_181.caution = 10
                                                    L3_187 = CALLBACK_REASON
                                                    L3_187 = L3_187.IS_INSIGHT
                                                    A0_181.callbackReason = L3_187
                                                    L3_187 = NPC_STATUS
                                                    L3_187 = L3_187.CAUTION
                                                    A0_181.status = L3_187
                                                  end
                                                end
                                              else
                                                else
                                                  A0_181.caution = 0
                                                  L3_187 = A0_181.detectGravity
                                                  if L3_187 then
                                                    L3_187 = Player
                                                    L4_188 = L3_187
                                                    L3_187 = L3_187.isGravityControlMode
                                                    L3_187 = L3_187(L4_188)
                                                    if L3_187 then
                                                      L3_187 = print
                                                      L4_188 = "Gravity control detected."
                                                      L3_187(L4_188)
                                                      L3_187 = A0_181.npc
                                                      L4_188 = L3_187
                                                      L3_187 = L3_187.reset
                                                      L3_187(L4_188)
                                                      A0_181.caution = 50
                                                      L3_187 = CALLBACK_REASON
                                                      L3_187 = L3_187.DETECTED_GRAVITY
                                                      A0_181.callbackReason = L3_187
                                                      L3_187 = NPC_STATUS
                                                      L3_187 = L3_187.CAUTION
                                                      A0_181.status = L3_187
                                                    end
                                                end
                                                else
                                                  L2_186 = A0_181.posList
                                                  L2_186 = #L2_186
                                                  if L2_186 > 0 then
                                                    L2_186 = A0_181.changeRouteImmediately
                                                    if L2_186 then
                                                      L2_186 = A0_181.posListChanged
                                                      if L2_186 then
                                                        L2_186 = A0_181.npc
                                                        L3_187 = L2_186
                                                        L2_186 = L2_186.setMoveOption
                                                        L4_188 = A0_181.moveOption
                                                        L2_186(L3_187, L4_188)
                                                        L2_186 = A0_181.npc
                                                        L3_187 = L2_186
                                                        L2_186 = L2_186.move
                                                        L4_188 = A0_181.posList
                                                        L2_186(L3_187, L4_188, {startIndex = 1, goalDirection = true})
                                                        A0_181.currentMovePos = -1
                                                        A0_181.posListChanged = false
                                                      end
                                                    end
                                                    L2_186 = A0_181.npc
                                                    L3_187 = L2_186
                                                    L2_186 = L2_186.isMoveEnd
                                                    L2_186 = L2_186(L3_187)
                                                    if L2_186 then
                                                      L2_186 = A0_181.npc
                                                      L3_187 = L2_186
                                                      L2_186 = L2_186.isTurnEnd
                                                      L2_186 = L2_186(L3_187)
                                                      if L2_186 then
                                                        L2_186 = A0_181.posListChanged
                                                        if L2_186 then
                                                          L2_186 = A0_181.npc
                                                          L3_187 = L2_186
                                                          L2_186 = L2_186.setMoveOption
                                                          L4_188 = A0_181.moveOption
                                                          L2_186(L3_187, L4_188)
                                                          L2_186 = A0_181.npc
                                                          L3_187 = L2_186
                                                          L2_186 = L2_186.move
                                                          L4_188 = A0_181.posList
                                                          L2_186(L3_187, L4_188, {startIndex = 1, goalDirection = true})
                                                          A0_181.currentMovePos = -1
                                                          A0_181.posListChanged = false
                                                        else
                                                          L2_186 = A0_181.currentMovePos
                                                          if L2_186 > 0 then
                                                            L2_186 = A0_181.posListChanged
                                                            if L2_186 then
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.setMoveOption
                                                              L4_188 = A0_181.moveOption
                                                              L2_186(L3_187, L4_188)
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.move
                                                              L4_188 = A0_181.posList
                                                              L2_186(L3_187, L4_188, {startIndex = 1, goalDirection = true})
                                                              A0_181.currentMovePos = -1
                                                              A0_181.posListChanged = false
                                                            else
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.setMoveOption
                                                              L4_188 = A0_181.moveOption
                                                              L2_186(L3_187, L4_188)
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.move
                                                              L4_188 = A0_181.posList
                                                              L2_186(L3_187, L4_188, {
                                                                startIndex = A0_181.currentMovePos,
                                                                goalDirection = true
                                                              })
                                                              A0_181.currentMovePos = -1
                                                            end
                                                          else
                                                            A0_181.posListChanged = false
                                                            L2_186 = A0_181.loop
                                                            if L2_186 then
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.playMotion
                                                              L4_188 = A0_181.motion
                                                              L2_186(L3_187, L4_188, L0_184)
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.setMoveOption
                                                              L4_188 = A0_181.moveOption
                                                              L2_186(L3_187, L4_188)
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.move
                                                              L4_188 = A0_181.posList
                                                              L2_186(L3_187, L4_188, {startIndex = 1, goalDirection = true})
                                                            else
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.isMotionEnd
                                                              L2_186 = L2_186(L3_187)
                                                              if L2_186 then
                                                                L2_186 = A0_181.motion
                                                                if L2_186 ~= nil then
                                                                  L2_186 = A0_181.npc
                                                                  L3_187 = L2_186
                                                                  L2_186 = L2_186.playMotion
                                                                  L4_188 = A0_181.motion
                                                                  L2_186(L3_187, L4_188, L0_184)
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  else
                                                    L2_186 = A0_181.npc
                                                    L3_187 = L2_186
                                                    L2_186 = L2_186.isMotionEnd
                                                    L2_186 = L2_186(L3_187)
                                                    if L2_186 then
                                                      L2_186 = A0_181.motion
                                                      if L2_186 ~= nil then
                                                        L2_186 = A0_181.npc
                                                        L3_187 = L2_186
                                                        L2_186 = L2_186.playMotion
                                                        L4_188 = A0_181.motion
                                                        L2_186(L3_187, L4_188, L0_184)
                                                      end
                                                    end
                                                  end
                                                  else
                                                    L2_186 = A0_181.status
                                                    L3_187 = NPC_STATUS
                                                    L3_187 = L3_187.CAUTION
                                                    if L2_186 == L3_187 then
                                                      L2_186 = A0_181.cautionMode
                                                      L3_187 = CAUTION_MODE
                                                      L3_187 = L3_187.TIME
                                                      if L2_186 == L3_187 then
                                                        L2_186 = isInSight
                                                        L3_187 = A0_181.npcName
                                                        L4_188 = A0_181.sightParam
                                                        L2_186 = L2_186(L3_187, L4_188)
                                                        if L2_186 then
                                                          L2_186 = isSightCheckEnable
                                                          L3_187 = A0_181
                                                          L2_186 = L2_186(L3_187)
                                                          if L2_186 then
                                                            L2_186 = Fn_getPlayerWorldPos
                                                            L2_186 = L2_186()
                                                            A0_181.targetPos = L2_186
                                                            L2_186 = getCautionValue
                                                            L3_187 = A0_181.npcName
                                                            L4_188 = A0_181.sightParam
                                                            L4_188 = L4_188.length
                                                            L2_186 = L2_186(L3_187, L4_188)
                                                            L3_187 = A0_181.cautionIncCoefficent
                                                            L2_186 = L2_186 * L3_187
                                                            L3_187 = A0_181
                                                            L4_188 = L3_187
                                                            L3_187 = L3_187.setCautionLevel
                                                            L3_187(L4_188, A0_181.caution + L2_186)
                                                          end
                                                        else
                                                          L2_186 = A0_181.indicationEnable
                                                          if L2_186 then
                                                            L2_186 = getCautionValue
                                                            L3_187 = A0_181.npcName
                                                            L4_188 = A0_181.indicationRange
                                                            L2_186 = L2_186(L3_187, L4_188)
                                                            L3_187 = A0_181.indicationIncCoefficent
                                                            L2_186 = L2_186 * L3_187
                                                            if L2_186 > 0 then
                                                              L3_187 = getNearPosforPC
                                                              L4_188 = A0_181.npcName
                                                              L3_187 = L3_187(L4_188)
                                                              A0_181.targetPos = L3_187
                                                              L3_187 = A0_181.npc
                                                              L4_188 = L3_187
                                                              L3_187 = L3_187.turn
                                                              L3_187(L4_188, A0_181.targetPos)
                                                              L3_187 = A0_181.cautionDecCoefficent
                                                              L3_187 = 1 * L3_187
                                                              L4_188 = A0_181
                                                              L4_188 = L4_188.setCautionLevel
                                                              L4_188(L4_188, A0_181.caution - L3_187)
                                                            else
                                                              L3_187 = A0_181.cautionDecCoefficent
                                                              L3_187 = 1 * L3_187
                                                              L4_188 = A0_181
                                                              L4_188 = L4_188.setCautionLevel
                                                              L4_188(L4_188, A0_181.caution - L3_187)
                                                            end
                                                          else
                                                            L2_186 = A0_181.cautionDecCoefficent
                                                            L2_186 = 1 * L2_186
                                                            L3_187 = A0_181
                                                            L4_188 = L3_187
                                                            L3_187 = L3_187.setCautionLevel
                                                            L3_187(L4_188, A0_181.caution - L2_186)
                                                          end
                                                        end
                                                      else
                                                        L2_186 = Fn_getDistanceToPlayer
                                                        L3_187 = A0_181.npcPuppet
                                                        L2_186 = L2_186(L3_187)
                                                        if L2_186 >= 0 then
                                                          L3_187 = A0_181.alertRange
                                                          if L2_186 <= L3_187 then
                                                            L3_187 = COOLDOWN_TIME
                                                            A0_181.coolDown = L3_187
                                                            L3_187 = CautionLevel
                                                            L3_187 = L3_187.MAX_LEVEL
                                                            A0_181.caution = L3_187
                                                          end
                                                        else
                                                          L3_187 = A0_181.alertRange
                                                          if L2_186 > L3_187 then
                                                            L3_187 = A0_181.cautionRange
                                                            if L2_186 <= L3_187 then
                                                              L3_187 = COOLDOWN_TIME
                                                              A0_181.coolDown = L3_187
                                                              L3_187 = A0_181.cautionRange
                                                              L3_187 = L3_187 - L2_186
                                                              L3_187 = L3_187 * 100
                                                              L4_188 = A0_181.cautionRange
                                                              L4_188 = L4_188 - A0_181.alertRange
                                                              L3_187 = L3_187 / L4_188
                                                              A0_181.caution = L3_187
                                                            end
                                                          else
                                                            L3_187 = A0_181.coolDown
                                                            L3_187 = L3_187 - 1
                                                            A0_181.coolDown = L3_187
                                                            L3_187 = A0_181.coolDown
                                                            if L3_187 < 0 then
                                                              A0_181.caution = 0
                                                            end
                                                            L3_187 = A0_181.detectGravity
                                                            if L3_187 then
                                                              L3_187 = Player
                                                              L4_188 = L3_187
                                                              L3_187 = L3_187.isGravityControlMode
                                                              L3_187 = L3_187(L4_188)
                                                              if L3_187 then
                                                                A0_181.caution = 50
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                      L2_186 = A0_181.caution
                                                      L3_187 = CautionLevel
                                                      L3_187 = L3_187.MAX_LEVEL
                                                      if L2_186 >= L3_187 then
                                                        L2_186 = getNearPosforPC
                                                        L3_187 = A0_181.npcName
                                                        L2_186 = L2_186(L3_187)
                                                        A0_181.targetPos = L2_186
                                                        L2_186 = {L3_187}
                                                        L3_187 = {}
                                                        L4_188 = A0_181.targetPos
                                                        L3_187.pos = L4_188
                                                        L4_188 = A0_181.moveOption
                                                        L3_187.opt = L4_188
                                                        L3_187 = A0_181.npc
                                                        L4_188 = L3_187
                                                        L3_187 = L3_187.setMoveOption
                                                        L3_187(L4_188, A0_181.moveOption)
                                                        L3_187 = A0_181.npc
                                                        L4_188 = L3_187
                                                        L3_187 = L3_187.move
                                                        L3_187(L4_188, L2_186)
                                                        L3_187 = A0_181.status
                                                        L4_188 = NPC_STATUS
                                                        L4_188 = L4_188.CAUTION
                                                        if L3_187 == L4_188 then
                                                          L3_187 = print
                                                          L4_188 = "CAUTION -> ALERT"
                                                          L3_187(L4_188)
                                                          L3_187 = CALLBACK_REASON
                                                          L3_187 = L3_187.CAUTION_OVERFLOW
                                                          A0_181.callbackReason = L3_187
                                                          L3_187 = NPC_STATUS
                                                          L3_187 = L3_187.ALERT
                                                          A0_181.status = L3_187
                                                        end
                                                      else
                                                        L2_186 = A0_181.caution
                                                        if L2_186 <= 0 then
                                                          L2_186 = print
                                                          L3_187 = "CAUTION -> NORMAL"
                                                          L2_186(L3_187)
                                                          L2_186 = getNearPosforPC
                                                          L3_187 = A0_181.npcName
                                                          L2_186 = L2_186(L3_187)
                                                          A0_181.targetPos = L2_186
                                                          L2_186 = {L3_187}
                                                          L3_187 = {}
                                                          L4_188 = A0_181.targetPos
                                                          L3_187.pos = L4_188
                                                          L4_188 = A0_181.moveOption
                                                          L3_187.opt = L4_188
                                                          L3_187 = A0_181.npc
                                                          L4_188 = L3_187
                                                          L3_187 = L3_187.setMoveOption
                                                          L3_187(L4_188, A0_181.moveOption)
                                                          L3_187 = A0_181.npc
                                                          L4_188 = L3_187
                                                          L3_187 = L3_187.move
                                                          L3_187(L4_188, L2_186)
                                                          L3_187 = A0_181.npc
                                                          L4_188 = L3_187
                                                          L3_187 = L3_187.playMotion
                                                          L3_187(L4_188, A0_181.dismissMotion, L0_184)
                                                          L3_187 = A0_181.status
                                                          L4_188 = NPC_STATUS
                                                          L4_188 = L4_188.CAUTION
                                                          if L3_187 == L4_188 then
                                                            A0_181.caution = 0
                                                            A0_181.indication = 0
                                                            L3_187 = A0_181.noIndicationTime
                                                            A0_181.noIndicationCount = L3_187
                                                            L3_187 = CALLBACK_REASON
                                                            L3_187 = L3_187.NO_CAUTION
                                                            A0_181.callbackReason = L3_187
                                                            L3_187 = NPC_STATUS
                                                            L3_187 = L3_187.NORMAL
                                                            A0_181.status = L3_187
                                                          end
                                                        else
                                                          L2_186 = A0_181.chaseMode
                                                          if L2_186 then
                                                            L2_186 = A0_181.npc
                                                            L3_187 = L2_186
                                                            L2_186 = L2_186.isMoveEnd
                                                            L2_186 = L2_186(L3_187)
                                                            if L2_186 then
                                                              L2_186 = Fn_getPlayer
                                                              L2_186 = L2_186()
                                                              A0_181.targetPos = L2_186
                                                              L2_186 = {L3_187}
                                                              L3_187 = {}
                                                              L4_188 = A0_181.targetPos
                                                              L3_187.pos = L4_188
                                                              L4_188 = A0_181.moveOption
                                                              L3_187.opt = L4_188
                                                              L3_187 = A0_181.npc
                                                              L4_188 = L3_187
                                                              L3_187 = L3_187.setMoveOption
                                                              L3_187(L4_188, A0_181.moveOption)
                                                              L3_187 = A0_181.npc
                                                              L4_188 = L3_187
                                                              L3_187 = L3_187.move
                                                              L3_187(L4_188, L2_186)
                                                            end
                                                          else
                                                            L2_186 = A0_181.caution
                                                            if L2_186 >= 50 then
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.turn
                                                              L4_188 = A0_181.targetPos
                                                              L2_186(L3_187, L4_188)
                                                            else
                                                              L2_186 = A0_181.npc
                                                              L3_187 = L2_186
                                                              L2_186 = L2_186.isMoveEnd
                                                              L2_186 = L2_186(L3_187)
                                                              if L2_186 then
                                                                L2_186 = A0_181.npc
                                                                L3_187 = L2_186
                                                                L2_186 = L2_186.isMotionEnd
                                                                L2_186 = L2_186(L3_187)
                                                                if L2_186 then
                                                                  L2_186 = A0_181.npc
                                                                  L3_187 = L2_186
                                                                  L2_186 = L2_186.isTurnEnd
                                                                  L2_186 = L2_186(L3_187)
                                                                  if L2_186 then
                                                                    L2_186 = A0_181.npc
                                                                    L3_187 = L2_186
                                                                    L2_186 = L2_186.playMotion
                                                                    L4_188 = A0_181.motion
                                                                    L2_186(L3_187, L4_188, L0_184)
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                          else
                                                            L2_186 = A0_181.status
                                                            L3_187 = NPC_STATUS
                                                            L3_187 = L3_187.ALERT
                                                            if L2_186 == L3_187 then
                                                              L2_186 = A0_181.combatReady
                                                              if not L2_186 then
                                                                L2_186 = A0_181.combatReady2
                                                              else
                                                                if L2_186 then
                                                                  L2_186 = print
                                                                  L3_187 = "ALERT -> COMBAT"
                                                                  L2_186(L3_187)
                                                                  L2_186 = A0_181.status
                                                                  L3_187 = NPC_STATUS
                                                                  L3_187 = L3_187.ALERT
                                                                  if L2_186 == L3_187 then
                                                                    L2_186 = A0_181.combatReady2
                                                                    if L2_186 then
                                                                      L2_186 = CALLBACK_REASON
                                                                      L2_186 = L2_186.DAMAGED
                                                                      A0_181.callbackReason = L2_186
                                                                    else
                                                                      L2_186 = CALLBACK_REASON
                                                                      L2_186 = L2_186.BEGIN_COMBAT
                                                                      A0_181.callbackReason = L2_186
                                                                    end
                                                                    L2_186 = NPC_STATUS
                                                                    L2_186 = L2_186.COMBAT
                                                                    A0_181.status = L2_186
                                                                    A0_181.combatTimeout = false
                                                                    L2_186 = A0_181.npc
                                                                    L3_187 = L2_186
                                                                    L2_186 = L2_186.changeEnemy
                                                                    L2_186(L3_187)
                                                                    L2_186 = A0_181.combatTimeEnable
                                                                    if L2_186 then
                                                                      L2_186 = A0_181.battleTimerTask
                                                                      if L2_186 ~= nil then
                                                                        L2_186 = A0_181.battleTimerTask
                                                                        L3_187 = L2_186
                                                                        L2_186 = L2_186.abort
                                                                        L2_186(L3_187)
                                                                        A0_181.battleTimerTask = nil
                                                                      end
                                                                      L2_186 = EventHelper
                                                                      L3_187 = L2_186
                                                                      L2_186 = L2_186.timerCallback
                                                                      L4_188 = "combat"
                                                                      L2_186 = L2_186(L3_187, L4_188, A0_181.combatTime, function()
                                                                        A0_181.battleTimerTask:abort()
                                                                        A0_181.battleTimerTask = nil
                                                                        A0_181.combatTimeout = true
                                                                      end)
                                                                      A0_181.battleTimerTask = L2_186
                                                                    end
                                                                  end
                                                              end
                                                              else
                                                                L2_186 = A0_181.cautionMode
                                                                L3_187 = CAUTION_MODE
                                                                L3_187 = L3_187.TIME
                                                                if L2_186 == L3_187 then
                                                                  L2_186 = isInSight
                                                                  L3_187 = A0_181.npcName
                                                                  L4_188 = A0_181.sightParam
                                                                  L2_186 = L2_186(L3_187, L4_188)
                                                                  if L2_186 then
                                                                    L2_186 = isSightCheckEnable
                                                                    L3_187 = A0_181
                                                                    L2_186 = L2_186(L3_187)
                                                                    if L2_186 then
                                                                      L2_186 = COOLDOWN_TIME
                                                                      A0_181.coolDown = L2_186
                                                                      L2_186 = Fn_getPlayer
                                                                      L2_186 = L2_186()
                                                                      A0_181.targetPos = L2_186
                                                                      L2_186 = A0_181.chaseMode
                                                                      if L2_186 then
                                                                        L2_186 = A0_181.npc
                                                                        L3_187 = L2_186
                                                                        L2_186 = L2_186.isMoveEnd
                                                                        L2_186 = L2_186(L3_187)
                                                                        if L2_186 then
                                                                          L2_186 = {L3_187}
                                                                          L3_187 = {}
                                                                          L4_188 = A0_181.targetPos
                                                                          L3_187.pos = L4_188
                                                                          L4_188 = A0_181.chaseMoveOption
                                                                          L3_187.opt = L4_188
                                                                          L3_187 = A0_181.npc
                                                                          L4_188 = L3_187
                                                                          L3_187 = L3_187.setMoveOption
                                                                          L3_187(L4_188, A0_181.chaseMoveOption)
                                                                          L3_187 = A0_181.npc
                                                                          L4_188 = L3_187
                                                                          L3_187 = L3_187.move
                                                                          L3_187(L4_188, L2_186)
                                                                        end
                                                                        L2_186 = A0_181.npcPuppet
                                                                        L3_187 = L2_186
                                                                        L2_186 = L2_186.getWorldPos
                                                                        L2_186 = L2_186(L3_187)
                                                                        L3_187 = Fn_get_distance
                                                                        L4_188 = L2_186
                                                                        L3_187 = L3_187(L4_188, A0_181.targetPos:getWorldPos())
                                                                        L4_188 = CAPTURE_DISTANCE
                                                                        if L3_187 < L4_188 then
                                                                          L3_187 = getNearPosforPC
                                                                          L4_188 = A0_181.npcName
                                                                          L3_187 = L3_187(L4_188)
                                                                          A0_181.targetPos = L3_187
                                                                          L3_187 = {L4_188}
                                                                          L4_188 = {}
                                                                          L4_188.pos = A0_181.targetPos
                                                                          L4_188.opt = A0_181.moveOption
                                                                          L4_188 = A0_181.npc
                                                                          L4_188 = L4_188.setMoveOption
                                                                          L4_188(L4_188, A0_181.moveOption)
                                                                          L4_188 = A0_181.npc
                                                                          L4_188 = L4_188.move
                                                                          L4_188(L4_188, L3_187)
                                                                          L4_188 = A0_181.status
                                                                          if L4_188 == NPC_STATUS.ALERT then
                                                                            L4_188 = CALLBACK_REASON
                                                                            L4_188 = L4_188.TARGET_CAPTURE
                                                                            A0_181.callbackReason = L4_188
                                                                            L4_188 = NPC_STATUS
                                                                            L4_188 = L4_188.TERMINATE
                                                                            A0_181.status = L4_188
                                                                          end
                                                                        end
                                                                      else
                                                                        L2_186 = A0_181.terminateMode
                                                                        if L2_186 then
                                                                          L2_186 = CALLBACK_REASON
                                                                          L2_186 = L2_186.TERMINATE
                                                                          A0_181.callbackReason = L2_186
                                                                          L2_186 = NPC_STATUS
                                                                          L2_186 = L2_186.TERMINATE
                                                                          A0_181.status = L2_186
                                                                        else
                                                                          else
                                                                            L2_186 = A0_181.coolDown
                                                                            L2_186 = L2_186 - 1
                                                                            A0_181.coolDown = L2_186
                                                                            L2_186 = A0_181.coolDown
                                                                            if L2_186 < 0 then
                                                                              L2_186 = getNearPosforPC
                                                                              L3_187 = A0_181.npcName
                                                                              L2_186 = L2_186(L3_187)
                                                                              A0_181.targetPos = L2_186
                                                                              L2_186 = {L3_187}
                                                                              L3_187 = {}
                                                                              L4_188 = A0_181.targetPos
                                                                              L3_187.pos = L4_188
                                                                              L4_188 = A0_181.moveOption
                                                                              L3_187.opt = L4_188
                                                                              L3_187 = A0_181.npc
                                                                              L4_188 = L3_187
                                                                              L3_187 = L3_187.setMoveOption
                                                                              L3_187(L4_188, A0_181.moveOption)
                                                                              L3_187 = A0_181.npc
                                                                              L4_188 = L3_187
                                                                              L3_187 = L3_187.move
                                                                              L3_187(L4_188, L2_186)
                                                                              L3_187 = A0_181.status
                                                                              L4_188 = NPC_STATUS
                                                                              L4_188 = L4_188.ALERT
                                                                              if L3_187 == L4_188 then
                                                                                L3_187 = print
                                                                                L4_188 = "ALERT -> CAUTION"
                                                                                L3_187(L4_188)
                                                                                L3_187 = CautionLevel
                                                                                L3_187 = L3_187.MAX_LEVEL
                                                                                L3_187 = L3_187 - 1
                                                                                A0_181.caution = L3_187
                                                                                L3_187 = CALLBACK_REASON
                                                                                L3_187 = L3_187.LOST_TARGET
                                                                                A0_181.callbackReason = L3_187
                                                                                L3_187 = NPC_STATUS
                                                                                L3_187 = L3_187.CAUTION
                                                                                A0_181.status = L3_187
                                                                                else
                                                                                  else
                                                                                    L2_186 = A0_181.chaseMode
                                                                                    if L2_186 then
                                                                                      L2_186 = Fn_getPlayer
                                                                                      L2_186 = L2_186()
                                                                                      A0_181.targetPos = L2_186
                                                                                      L2_186 = A0_181.npc
                                                                                      L3_187 = L2_186
                                                                                      L2_186 = L2_186.isMoveEnd
                                                                                      L2_186 = L2_186(L3_187)
                                                                                      if L2_186 then
                                                                                        L2_186 = {L3_187}
                                                                                        L3_187 = {}
                                                                                        L4_188 = A0_181.targetPos
                                                                                        L3_187.pos = L4_188
                                                                                        L4_188 = A0_181.chaseMoveOption
                                                                                        L3_187.opt = L4_188
                                                                                        L3_187 = A0_181.npc
                                                                                        L4_188 = L3_187
                                                                                        L3_187 = L3_187.setMoveOption
                                                                                        L3_187(L4_188, A0_181.chaseMoveOption)
                                                                                        L3_187 = A0_181.npc
                                                                                        L4_188 = L3_187
                                                                                        L3_187 = L3_187.move
                                                                                        L3_187(L4_188, L2_186)
                                                                                      end
                                                                                      L2_186 = A0_181.npcPuppet
                                                                                      L3_187 = L2_186
                                                                                      L2_186 = L2_186.getWorldPos
                                                                                      L2_186 = L2_186(L3_187)
                                                                                      L3_187 = Fn_get_distance
                                                                                      L4_188 = L2_186
                                                                                      L3_187 = L3_187(L4_188, A0_181.targetPos:getWorldPos())
                                                                                      L4_188 = CAPTURE_DISTANCE
                                                                                      if L3_187 < L4_188 then
                                                                                        L3_187 = A0_181.status
                                                                                        L4_188 = NPC_STATUS
                                                                                        L4_188 = L4_188.ALERT
                                                                                        if L3_187 == L4_188 then
                                                                                          L3_187 = CALLBACK_REASON
                                                                                          L3_187 = L3_187.TARGET_CAPTURE
                                                                                          A0_181.callbackReason = L3_187
                                                                                          L3_187 = NPC_STATUS
                                                                                          L3_187 = L3_187.TERMINATE
                                                                                          A0_181.status = L3_187
                                                                                          do break end
                                                                                          else
                                                                                            L3_187 = Fn_getDistanceToPlayer
                                                                                            L4_188 = A0_181.npcPuppet
                                                                                            L3_187 = L3_187(L4_188)
                                                                                            L4_188 = A0_181.cautionRange
                                                                                            L4_188 = L4_188 * 2
                                                                                            if L3_187 > L4_188 then
                                                                                              L4_188 = A0_181.coolDown
                                                                                              L4_188 = L4_188 - 1
                                                                                              A0_181.coolDown = L4_188
                                                                                              L4_188 = A0_181.coolDown
                                                                                              if L4_188 < 0 then
                                                                                                A0_181.coolDown = 0
                                                                                                L4_188 = getNearPosforPC
                                                                                                L4_188 = L4_188(A0_181.npcName)
                                                                                                A0_181.targetPos = L4_188
                                                                                                L4_188 = {
                                                                                                  {
                                                                                                    pos = A0_181.targetPos,
                                                                                                    opt = A0_181.moveOption
                                                                                                  }
                                                                                                }
                                                                                                A0_181.npc:setMoveOption(A0_181.moveOption)
                                                                                                A0_181.npc:move(L4_188)
                                                                                                if A0_181.status == NPC_STATUS.ALERT then
                                                                                                  print("ALERT -> CAUTION")
                                                                                                  A0_181.caution = CautionLevel.MAX_LEVEL - 1
                                                                                                  A0_181.callbackReason = CALLBACK_REASON.LOST_TARGET
                                                                                                  A0_181.status = NPC_STATUS.CAUTION
                                                                                                  else
                                                                                                    else
                                                                                                      L2_186 = Fn_getDistanceToPlayer
                                                                                                      L3_187 = A0_181.npcPuppet
                                                                                                      L2_186 = L2_186(L3_187)
                                                                                                      if L2_186 >= 0 then
                                                                                                        L3_187 = A0_181.cautionRange
                                                                                                        if L2_186 <= L3_187 then
                                                                                                        end
                                                                                                      else
                                                                                                        L3_187 = A0_181.coolDown
                                                                                                        L3_187 = L3_187 - 1
                                                                                                        A0_181.coolDown = L3_187
                                                                                                        L3_187 = A0_181.coolDown
                                                                                                        if L3_187 < 0 then
                                                                                                          A0_181.coolDown = 0
                                                                                                          L3_187 = getNearPosforPC
                                                                                                          L4_188 = A0_181.npcName
                                                                                                          L3_187 = L3_187(L4_188)
                                                                                                          A0_181.targetPos = L3_187
                                                                                                          L3_187 = {L4_188}
                                                                                                          L4_188 = {}
                                                                                                          L4_188.pos = A0_181.targetPos
                                                                                                          L4_188.opt = A0_181.moveOption
                                                                                                          L4_188 = A0_181.npc
                                                                                                          L4_188 = L4_188.setMoveOption
                                                                                                          L4_188(L4_188, A0_181.moveOption)
                                                                                                          L4_188 = A0_181.npc
                                                                                                          L4_188 = L4_188.move
                                                                                                          L4_188(L4_188, L3_187)
                                                                                                          L4_188 = A0_181.status
                                                                                                          if L4_188 == NPC_STATUS.ALERT then
                                                                                                            L4_188 = print
                                                                                                            L4_188("ALERT -> CAUTION")
                                                                                                            L4_188 = CautionLevel
                                                                                                            L4_188 = L4_188.MAX_LEVEL
                                                                                                            L4_188 = L4_188 - 1
                                                                                                            A0_181.caution = L4_188
                                                                                                            L4_188 = CALLBACK_REASON
                                                                                                            L4_188 = L4_188.LOST_TARGET
                                                                                                            A0_181.callbackReason = L4_188
                                                                                                            L4_188 = NPC_STATUS
                                                                                                            L4_188 = L4_188.CAUTION
                                                                                                            A0_181.status = L4_188
                                                                                                            else
                                                                                                              else
                                                                                                                L2_186 = A0_181.status
                                                                                                                L3_187 = NPC_STATUS
                                                                                                                L3_187 = L3_187.COMBAT
                                                                                                                if L2_186 == L3_187 then
                                                                                                                else
                                                                                                                  L2_186 = A0_181.status
                                                                                                                  L3_187 = NPC_STATUS
                                                                                                                  L3_187 = L3_187.TERMINATE
                                                                                                                  if L2_186 == L3_187 then
                                                                                                                  else
                                                                                                                    L2_186 = A0_181.status
                                                                                                                    L3_187 = NPC_STATUS
                                                                                                                    L3_187 = L3_187.DEAD
                                                                                                                    if L2_186 == L3_187 then
                                                                                                                    else
                                                                                                                      L2_186 = A0_181.status
                                                                                                                      L3_187 = NPC_STATUS
                                                                                                                      L3_187 = L3_187.HACKED
                                                                                                                      if L2_186 == L3_187 then
                                                                                                                        L2_186 = A0_181.hackDuration
                                                                                                                        L2_186 = L2_186 % 100
                                                                                                                        if L2_186 == 0 then
                                                                                                                          L2_186 = A0_181.headLoc
                                                                                                                          L3_187 = L2_186
                                                                                                                          L2_186 = L2_186.setWorldTransform
                                                                                                                          L4_188 = A0_181.npcPuppet
                                                                                                                          L4_188 = L4_188.getWorldTransform
                                                                                                                          L4_188 = L4_188(L4_188)
                                                                                                                          L4_188 = L4_188 + Vector(0, 2, 0)
                                                                                                                          L2_186(L3_187, L4_188)
                                                                                                                          L2_186 = HUD
                                                                                                                          L3_187 = L2_186
                                                                                                                          L2_186 = L2_186.scorePop
                                                                                                                          L4_188 = math
                                                                                                                          L4_188 = L4_188.floor
                                                                                                                          L4_188 = L4_188(A0_181.hackDuration / 100)
                                                                                                                          L2_186(L3_187, L4_188, A0_181.headLoc)
                                                                                                                        end
                                                                                                                        L2_186 = Fn_getPlayer
                                                                                                                        L2_186 = L2_186()
                                                                                                                        A0_181.targetPos = L2_186
                                                                                                                        L2_186 = A0_181.npc
                                                                                                                        L3_187 = L2_186
                                                                                                                        L2_186 = L2_186.isMoveEnd
                                                                                                                        L2_186 = L2_186(L3_187)
                                                                                                                        if L2_186 then
                                                                                                                          L2_186 = {L3_187}
                                                                                                                          L3_187 = {}
                                                                                                                          L4_188 = A0_181.targetPos
                                                                                                                          L3_187.pos = L4_188
                                                                                                                          L4_188 = A0_181.chaseMoveOption
                                                                                                                          L3_187.opt = L4_188
                                                                                                                          L3_187 = A0_181.npc
                                                                                                                          L4_188 = L3_187
                                                                                                                          L3_187 = L3_187.setMoveOption
                                                                                                                          L3_187(L4_188, A0_181.chaseMoveOption)
                                                                                                                          L3_187 = A0_181.npc
                                                                                                                          L4_188 = L3_187
                                                                                                                          L3_187 = L3_187.move
                                                                                                                          L3_187(L4_188, L2_186)
                                                                                                                        end
                                                                                                                        L2_186 = A0_181.hackDuration
                                                                                                                        L2_186 = L2_186 - 1
                                                                                                                        A0_181.hackDuration = L2_186
                                                                                                                        L2_186 = A0_181.hackDuration
                                                                                                                        if L2_186 < 0 then
                                                                                                                          A0_181.hackDuration = -1
                                                                                                                          L2_186 = A0_181.status
                                                                                                                          L3_187 = NPC_STATUS
                                                                                                                          L3_187 = L3_187.HACKED
                                                                                                                          if L2_186 == L3_187 then
                                                                                                                            L2_186 = print
                                                                                                                            L3_187 = "HACKED -> NORMAL"
                                                                                                                            L2_186(L3_187)
                                                                                                                            L2_186 = A0_181.npc
                                                                                                                            L3_187 = L2_186
                                                                                                                            L2_186 = L2_186.reset
                                                                                                                            L2_186(L3_187)
                                                                                                                            A0_181.caution = 0
                                                                                                                            A0_181.indication = 0
                                                                                                                            L2_186 = CALLBACK_REASON
                                                                                                                            L2_186 = L2_186.NO_CAUTION
                                                                                                                            A0_181.callbackReason = L2_186
                                                                                                                            L2_186 = NPC_STATUS
                                                                                                                            L2_186 = L2_186.NORMAL
                                                                                                                            A0_181.status = L2_186
                                                                                                                            else
                                                                                                                              L2_186 = A0_181.combatTimeout
                                                                                                                              if L2_186 then
                                                                                                                                L2_186 = A0_181.status
                                                                                                                                L3_187 = NPC_STATUS
                                                                                                                                L3_187 = L3_187.COMBAT
                                                                                                                                if L2_186 == L3_187 then
                                                                                                                                  A0_181.combatTimeout = false
                                                                                                                                  L2_186 = A1_182
                                                                                                                                  if L2_186 ~= false then
                                                                                                                                    L2_186 = A1_182
                                                                                                                                  elseif L2_186 == nil then
                                                                                                                                    L2_186 = A0_181.npc
                                                                                                                                    L3_187 = L2_186
                                                                                                                                    L2_186 = L2_186.isEnemy
                                                                                                                                    L2_186 = L2_186(L3_187)
                                                                                                                                    if L2_186 then
                                                                                                                                      L2_186 = A0_181.npc
                                                                                                                                      L3_187 = L2_186
                                                                                                                                      L2_186 = L2_186.changeNpc
                                                                                                                                      L2_186(L3_187)
                                                                                                                                      A0_181.combatReady2 = false
                                                                                                                                    end
                                                                                                                                    L2_186 = print
                                                                                                                                    L3_187 = "COMBAT -> NORMAL"
                                                                                                                                    L2_186(L3_187)
                                                                                                                                    A0_181.caution = 0
                                                                                                                                  end
                                                                                                                                  L2_186 = CALLBACK_REASON
                                                                                                                                  L2_186 = L2_186.COMBAT_TIMEOUT
                                                                                                                                  A0_181.callbackReason = L2_186
                                                                                                                                  L2_186 = A0_181.terminateMode
                                                                                                                                  if L2_186 then
                                                                                                                                    L2_186 = NPC_STATUS
                                                                                                                                    L2_186 = L2_186.TERMINATE
                                                                                                                                    A0_181.status = L2_186
                                                                                                                                  else
                                                                                                                                    L2_186 = A0_181
                                                                                                                                    L3_187 = L2_186
                                                                                                                                    L2_186 = L2_186.setDamagedEvent
                                                                                                                                    L2_186(L3_187)
                                                                                                                                    L2_186 = NPC_STATUS
                                                                                                                                    L2_186 = L2_186.NORMAL
                                                                                                                                    A0_181.status = L2_186
                                                                                                                                  end
                                                                                                                                end
                                                                                                                              end
                                                                                                                            end
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
          L2_186 = A0_181.oldStatus
          L3_187 = A0_181.status
          if L2_186 ~= L3_187 then
            L2_186 = print
            L3_187 = "\227\130\185\227\131\134\227\131\188\227\130\191\227\130\185\229\164\137\229\140\150"
            L2_186(L3_187)
            A0_181.hackCount = 0
            L2_186 = A0_181.changeStateFunction
            if L2_186 ~= nil then
              L2_186 = A0_181.callbackReason
              if L2_186 > 0 then
                L2_186 = A0_181.changeStateFunction
                L3_187 = A0_181.npcName
                L4_188 = A0_181.callbackReason
                L2_186(L3_187, L4_188)
                A0_181.callbackReason = 0
              end
            end
          end
          L2_186 = A0_181.status
          A0_181.oldStatus = L2_186
          if L1_185 == 8 then
            L1_185 = 1
          else
            L1_185 = L1_185 + 1
          end
          L2_186 = wait
          L2_186()
        end
      end
    end
  end)
end
perceivableNpcAction = L0_0
