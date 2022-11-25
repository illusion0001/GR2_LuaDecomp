local L1_1
L0_0 = {}
FatalMarker = L0_0
kFATAL_TYPE_EMP = 0
kFATAL_TYPE_ASH = 1
kFATAL_TYPE_ACT = 2
L0_0 = FatalMarker
function L1_1(A0_2, A1_3, A2_4, A3_5)
  local L4_6, L5_7, L6_8, L7_9
  if A1_3 then
    L4_6 = "fatal_marker02"
  else
    L4_6 = L4_6 or "fatal_marker01"
  end
  L5_7 = "CharDefs/npc/"
  L6_8 = L4_6
  L5_7 = L5_7 .. L6_8
  L6_8 = true
  if A2_4 ~= nil then
    L6_8 = A2_4
  end
  L7_9 = {}
  L7_9.marker_name = L4_6
  L7_9.file_path = L5_7
  L7_9.type = A0_2 or 0
  L7_9.support = A1_3
  L7_9.pause = L6_8
  L7_9.target = {}
  L7_9.gauge = A3_5
  L7_9.main_task = nil
  L7_9.judge_task = nil
  L7_9.finish = false
  L7_9.not_brain = false
  L7_9.fm_cnt = 1
  HUD:setFatalParam({len_fs = 40, len_ps = 10})
  FatalMarker._installMethods(L7_9)
  return L7_9
end
L0_0.create = L1_1
L0_0 = FatalMarker
function L1_1(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16)
  local L7_17, L8_18, L9_19, L10_20, L11_21, L12_22
  L7_17 = FatalMarker
  L7_17 = L7_17._isValid
  L8_18 = A0_10
  L7_17 = L7_17(L8_18)
  if not L7_17 then
    L7_17 = false
    return L7_17
  end
  L7_17 = A1_11
  L8_18 = nil
  L10_20 = A0_10
  L9_19 = A0_10._checkBrain
  L11_21 = A1_11
  L9_19 = L9_19(L10_20, L11_21)
  if L9_19 then
    L10_20 = A1_11
    L9_19 = A1_11.getGizmo
    L9_19 = L9_19(L10_20)
    L7_17 = L9_19
    L8_18 = A1_11
  else
    L10_20 = A1_11
    L9_19 = A1_11.isInstance
    L11_21 = "Puppet"
    L9_19 = L9_19(L10_20, L11_21)
    if L9_19 then
      L10_20 = A1_11
      L9_19 = A1_11.getBrain
      L9_19 = L9_19(L10_20)
      L8_18 = L9_19
    end
  end
  L9_19 = createGameObject2
  L10_20 = "Node"
  L9_19 = L9_19(L10_20)
  L11_21 = L9_19
  L10_20 = L9_19.leaveFromParent
  L12_22 = true
  L10_20(L11_21, L12_22)
  L10_20, L11_21 = nil, nil
  if A2_12 == nil then
    L12_22 = L7_17.getWorldTransform
    L11_21, L12_22 = L7_17, L12_22(L7_17)
    L10_20 = L12_22
  else
    L12_22 = L7_17.getJointWorldTransform
    L11_21, L12_22 = L7_17, L12_22(L7_17, A2_12)
    L10_20 = L12_22
  end
  L12_22 = L9_19.setWorldTransform
  L12_22(L9_19, L10_20, L11_21)
  L12_22 = L9_19.setForceMove
  L12_22(L9_19)
  if A2_12 == nil then
    L12_22 = L7_17.appendChild
    L12_22(L7_17, L9_19, true)
  else
    L12_22 = L7_17.appendChildToJoint
    L12_22(L7_17, L9_19, A2_12, true)
  end
  L12_22 = L9_19.try_init
  L12_22(L9_19)
  L12_22 = L9_19.waitForReady
  L12_22(L9_19)
  L12_22 = L9_19.try_start
  L12_22(L9_19)
  L12_22 = {}
  L12_22.name = L7_17:getName()
  L12_22.target = L7_17
  L12_22.brain = L8_18
  L12_22.joint = A2_12
  L12_22.ash = A5_15
  L12_22.marker = false
  L12_22.gauge = nil
  L12_22.gauge_task = nil
  L12_22.gauge_active = true
  L12_22.text = A6_16
  L12_22.node = L9_19
  A0_10.not_brain = A4_14
  if A3_13 and (A0_10.not_brain == true or A0_10:_checkBrain(L12_22.brain)) then
    L12_22.gauge_task = invokeTask(function()
      L12_22.gauge = HUD:createBossHpGauge({
        obj = L12_22.target,
        text = L12_22.text
      })
      L12_22.gauge:setActive(L12_22.gauge_active)
      while not A1_11:isStopped() do
        L12_22.gauge:setHp(L12_22.brain:getHealth() / L12_22.brain:getMaxHealth())
        wait()
      end
    end)
  end
  table.insert(A0_10.target, L12_22)
end
L0_0.set = L1_1
L0_0 = FatalMarker
function L1_1(A0_23, A1_24)
  local L2_25
  L2_25 = FatalMarker
  L2_25 = L2_25._isValid
  L2_25 = L2_25(A0_23)
  if not L2_25 then
    L2_25 = false
    return L2_25
  end
  L2_25 = A1_24
  if A0_23:_checkBrain(L2_25) then
    L2_25 = A1_24:getGizmo()
  end
  for _FORV_6_, _FORV_7_ in pairs(A0_23.target) do
    if _FORV_7_.target == L2_25 then
      HUD:deleteFatalMarker()
      A0_23.target[_FORV_6_] = nil
      break
    end
  end
end
L0_0.del = L1_1
L0_0 = FatalMarker
function L1_1(A0_26)
  if not FatalMarker._isValid(A0_26) then
    return false
  end
  if A0_26.main_task == nil then
    A0_26.main_task = invokeTask(function()
      while true do
        if A0_26:_isFatal() then
          A0_26:_visible(true)
          if not A0_26:_isJudge() then
            A0_26:_supportWait(true)
            A0_26:_gauge(false)
            A0_26:_judge(true)
          end
        else
          A0_26:_visible(false)
          if A0_26:_isJudge() then
            A0_26:_judge(false)
            A0_26:_gauge(true)
            A0_26:_supportWait(false)
          end
        end
        wait()
      end
    end)
  end
end
L0_0.run = L1_1
L0_0 = FatalMarker
function L1_1(A0_27)
  if not FatalMarker._isValid(A0_27) then
    return false
  end
  return A0_27.finish
end
L0_0.isFatalFinish = L1_1
L0_0 = FatalMarker
function L1_1(A0_28)
  if not FatalMarker._isValid(A0_28) then
    return false
  end
  A0_28:_supportWait(true)
  A0_28:_visible(false)
  for _FORV_4_, _FORV_5_ in pairs(A0_28.target) do
    if _FORV_5_.gauge_task and _FORV_5_.gauge_task:isRunning() then
      _FORV_5_.gauge:setActive(false)
      _FORV_5_.gauge_task:abort()
      _FORV_5_.gauge_task = nil
    end
  end
  A0_28:_judge(false)
  if A0_28.main_task and A0_28.main_task:isRunning() then
    A0_28.main_task:abort()
    A0_28.main_task = nil
  end
  HUD:setTextCommonCtrlGuide()
  HUD:missionEnd()
end
L0_0.kill = L1_1
L0_0 = FatalMarker
function L1_1(A0_29, A1_30)
  if not A1_30 then
    return false
  end
  return A1_30:isInstance("EnemyBrain") or A1_30:isInstance("AngeBrain") or A1_30:isInstance("CrowBrain")
end
L0_0._checkBrain = L1_1
L0_0 = FatalMarker
function L1_1(A0_31, A1_32)
  if A0_31.support and A0_31.pause then
    A0_31.support:getBrain():requestFatal(A1_32)
    if A0_31.target[1] ~= nil then
      A0_31.support:getBrain():setFatalParams({
        target_node = A0_31.target[1].node,
        enable = A1_32
      })
    elseif A0_31.target[2] ~= nil then
      A0_31.support:getBrain():setFatalParams({
        target_node = A0_31.target[2].node,
        enable = A1_32
      })
    end
    if A1_32 then
      A0_31.support:getBrain():setKeepDistanceOfFatal(3)
    end
  end
end
L0_0._supportWait = L1_1
L0_0 = FatalMarker
function L1_1(A0_33, A1_34)
  if A0_33.gauge then
    A0_33.gauge:setActive(A1_34)
  end
  for _FORV_5_, _FORV_6_ in pairs(A0_33.target) do
    _FORV_6_.gauge_active = A1_34
    if _FORV_6_.gauge then
      _FORV_6_.gauge:setActive(A1_34)
    end
  end
end
L0_0._gauge = L1_1
L0_0 = FatalMarker
function L1_1(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42
  L1_36 = true
  if L2_37 == L3_38 then
  elseif L2_37 == L3_38 then
    L1_36 = false
    for L5_40, L6_41 in L2_37(L3_38) do
      L7_42 = L6_41.target
      if L7_42 then
        L7_42 = L6_41.target
        L7_42 = L7_42.getBrain
        L7_42 = L7_42(L7_42)
        if A0_35.not_brain or A0_35:_checkBrain(L7_42) then
          if (L6_41.ash or 0) >= L7_42:getHealth() then
            L1_36 = true
          end
        end
      end
    end
  elseif L2_37 == L3_38 then
    L1_36 = false
    for L5_40, L6_41 in L2_37(L3_38) do
      L7_42 = L6_41.target
      if L7_42 then
        L7_42 = L6_41.target
        L7_42 = L7_42.getBrain
        L7_42 = L7_42(L7_42)
        if (A0_35.not_brain or L7_42:isInstance("EnemyBrain")) and L7_42:isFatalAction() then
          L1_36 = true
        end
      end
    end
  else
    L1_36 = false
  end
  return L1_36
end
L0_0._isFatal = L1_1
L0_0 = FatalMarker
function L1_1(A0_43, A1_44)
  if A1_44 then
    for _FORV_5_, _FORV_6_ in pairs(A0_43.target) do
      if _FORV_6_.target and _FORV_6_.target:isStarted() and not _FORV_6_.marker then
        HUD:addFatalTarget(_FORV_6_.target, _FORV_6_.joint)
        if A0_43.support then
          HUD:setFatalNpc(A0_43.support, _FORV_6_.joint)
        end
        _FORV_6_.marker = true
      end
    end
  else
    for _FORV_5_, _FORV_6_ in pairs(A0_43.target) do
      HUD:deleteFatalMarker()
      if _FORV_6_.marker then
        _FORV_6_.marker = false
      end
    end
  end
end
L0_0._visible = L1_1
L0_0 = FatalMarker
function L1_1(A0_45)
  local L1_46
  L1_46 = A0_45.judge_task
  return L1_46
end
L0_0._isJudge = L1_1
L0_0 = FatalMarker
function L1_1(A0_47, A1_48)
  if A1_48 then
    if A0_47.judge_task == nil then
      A0_47.judge_task = invokeTask(function()
        local L0_49, L1_50, L2_51, L3_52, L4_53
        L0_49, L1_50, L2_51, L3_52, L4_53 = nil, nil, nil, nil, nil
        while true do
          L0_49 = nil
          L2_51 = nil
          if HUD:getFatalState() == HUD.kFatalState_None then
            L4_53 = HUD:getFatalState()
          elseif HUD:getFatalState() == HUD.kFatalState_OutRangeTarget then
            L4_53, L0_49 = HUD:getFatalState(), "ui_object_fin_02"
          elseif HUD:getFatalState() == HUD.kFatalState_OutRangeNpc then
            L4_53 = HUD:getFatalState()
          elseif HUD:getFatalState() == HUD.kFatalState_NoneLock then
            L4_53, L0_49 = HUD:getFatalState(), "ui_object_fin_03"
          elseif HUD:getFatalState() == HUD.kFatalState_OutScreenTarget then
            L4_53, L0_49 = HUD:getFatalState(), "ui_object_fin_03"
          elseif HUD:getFatalState() == HUD.kFatalState_Visible then
            if L4_53 ~= HUD:getFatalState() then
              Sound:pulse("sys_chance2")
            end
            L4_53 = HUD:getFatalState()
            L2_51 = "ui_keyguide_fin_01"
            if Pad:getButton(Pad.kButton_TouchPad) then
              Sound:pulse("sys_chance2_success")
              A0_47.finish = true
              break
            end
          end
          if L0_49 ~= L1_50 then
            L1_50 = L0_49
            if L0_49 ~= nil then
              HUD:missionBegin(L0_49, 0)
              print(L0_49)
            else
              HUD:missionEnd(1)
            end
          end
          if L2_51 ~= L3_52 then
            L3_52 = L2_51
            if L2_51 == nil then
              HUD:setTextCommonCtrlGuide()
            else
              HUD:setTextCommonCtrlGuide(L2_51)
            end
          end
          wait()
        end
      end)
    end
  elseif A0_47.judge_task and A0_47.judge_task:isRunning() then
    A0_47.judge_task:abort()
    Sound:pulse("sys_chance_fail")
    HUD:missionEnd(1)
    HUD:setTextCommonCtrlGuide()
    A0_47.judge_task = nil
  end
end
L0_0._judge = L1_1
L0_0 = FatalMarker
function L1_1(A0_54)
  local L1_55
  if A0_54 == nil then
    L1_55 = false
    return L1_55
  end
  L1_55 = true
  return L1_55
end
L0_0._isValid = L1_1
L0_0 = FatalMarker
function L1_1(A0_56)
  local L1_57, L2_58, L3_59, L4_60, L5_61
  for L4_60, L5_61 in L1_57(L2_58) do
    if type(L5_61) == "function" then
      A0_56[L4_60] = L5_61
    end
  end
end
L0_0._installMethods = L1_1
