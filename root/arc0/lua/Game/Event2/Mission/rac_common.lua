dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Misc/balloon.lua")
import("Vehicle")
RAC_OPERATION_TUTORIAL_DELAY_DEFAULT = 1.3
function RAC_InvokeTaskWithDestractor(A0_0, A1_1, A2_2)
  local L3_3
  L3_3 = {}
  L3_3.main_task = invokeTask(A0_0, A2_2)
  L3_3.update_task = invokeTask(function()
    while L3_3.main_task:isRunning() do
      wait()
    end
    if A1_1 ~= nil then
      A1_1(A2_2)
    end
  end)
  function L3_3.isRunning(A0_4)
    return A0_4.update_task:isRunning()
  end
  function L3_3.abort(A0_5)
    if A0_5:isRunning() then
      A0_5.update_task:abort()
      A0_5.main_task:abort()
      if A1_1 ~= nil then
        A1_1(A2_2)
      end
    end
  end
  return L3_3
end
function RAC_MultiNaviAdd(A0_6, A1_7, A2_8, A3_9)
  local L4_10
  if A0_6 ~= nil then
    if A1_7 == nil then
      A1_7 = true
    end
    L4_10 = _findObjectHandle
    L4_10 = L4_10(A0_6)
    HUD:mnaviNew({
      name = L4_10:getName(),
      PochFadeLen0 = A2_8,
      PochFadeLen100 = A3_9
    }):setTarget(L4_10)
    HUD:mnaviNew({
      name = L4_10:getName(),
      PochFadeLen0 = A2_8,
      PochFadeLen100 = A3_9
    }):setActive(true, A1_7)
    return (HUD:mnaviNew({
      name = L4_10:getName(),
      PochFadeLen0 = A2_8,
      PochFadeLen100 = A3_9
    }))
  end
  L4_10 = nil
  return L4_10
end
function RAC_MultiNaviDel(A0_11)
  local L1_12, L2_13
  L1_12 = type
  L2_13 = A0_11
  L1_12 = L1_12(L2_13)
  L2_13 = nil
  if L1_12 == "string" then
    L2_13 = HUD:mnaviFind(A0_11)
  elseif L1_12 == "table" then
    L2_13 = A0_11
  elseif _findObjectHandle(A0_11) ~= nil then
    L2_13 = HUD:mnaviFind(_findObjectHandle(A0_11):getName())
  end
  if L2_13 ~= nil and L2_13:isValid() then
    L2_13:setActive(false)
    L2_13:del()
  end
end
function RAC_MultiNaviClear()
  local L0_14
  L0_14 = HUD
  L0_14 = L0_14.mnaviFind
  L0_14 = L0_14(L0_14)
  while true == L0_14:isValid() do
    L0_14:setActive(false)
    L0_14:del()
    L0_14 = L0_14:findNext()
  end
end
function RAC_IsMultiNaviRegistered(A0_15)
  local L1_16
  L1_16 = HUD
  L1_16 = L1_16.mnaviFind
  L1_16 = L1_16(L1_16, A0_15:getName())
  if L1_16 ~= nil and L1_16:isValid() then
    return true
  end
  return false
end
function RAC_DynamicMultiNaviAdd(A0_17, A1_18, A2_19, A3_20)
  local L4_21
  L4_21 = {}
  L4_21.target_hdl = nil
  L4_21.node_hdl = nil
  L4_21.navi_hdl = nil
  L4_21.target_name = name
  L4_21.target_hdl = A0_17
  L4_21.target_name = L4_21.target_hdl:getName()
  L4_21.target_hdl:setEventListener("broken", function(A0_22)
    L4_21:finalize()
  end)
  L4_21.target_hdl:setEventListener("dynamic", function(A0_23)
    A0_23:getDynamicObject():appendChild(L4_21.node_hdl)
  end)
  L4_21.node_hdl = RAC_createGameObject2(L4_21.target_hdl:getName() .. "_RacNaviNode", "Node")
  if L4_21.target_hdl:getDynamicObject() ~= nil then
    L4_21.target_hdl:getDynamicObject():appendChild(L4_21.node_hdl)
  else
    L4_21.target_hdl:appendChild(L4_21.node_hdl)
  end
  L4_21.node_hdl:setPos(Vector(0, 0, 0))
  L4_21.node_hdl:try_init()
  L4_21.node_hdl:waitForReady()
  L4_21.node_hdl:try_start()
  function L4_21.update(A0_24)
    while A0_24.navi_hdl ~= nil and A0_24.navi_hdl:isValid() and A0_24.target_hdl ~= nil and not A0_24.target_hdl:isBroken() and not A0_24.target_hdl:isGrabbed() do
      wait()
    end
  end
  function L4_21.destractor(A0_25)
    A0_25:finalize()
  end
  function L4_21.finalize(A0_26)
    if A0_26.target_hdl ~= nil then
      A0_26.target_hdl:setEventListener("dynamic", nil)
      A0_26.target_hdl:setEventListener("broken", nil)
    end
    if A0_26.node_hdl ~= nil then
      RAC_MultiNaviDel(A0_26.node_hdl)
      A0_26.node_hdl:try_term()
      A0_26.node_hdl = nil
    end
  end
  L4_21.navi_hdl = RAC_MultiNaviAdd(L4_21.node_hdl, A1_18, A2_19, A3_20)
  RAC_InvokeTaskWithDestractor(L4_21.update, L4_21.destractor, L4_21)
  return L4_21.navi_hdl
end
function RAC_LookAtObjectWait(A0_27, A1_28, A2_29, A3_30)
  local L4_31
  L4_31 = _findObjectHandle
  L4_31 = L4_31(A0_27)
  while invokeTask(function()
    if A3_30 ~= nil then
      waitSeconds(A3_30)
    else
      waitSeconds(4)
    end
  end):isRunning() and not Fn_isInSightTarget(L4_31, A2_29) do
    wait()
  end
  Fn_lookAtObject(L4_31, A1_28):abort()
  invokeTask(function()
    if A3_30 ~= nil then
      waitSeconds(A3_30)
    else
      waitSeconds(4)
    end
  end):abort()
end
function RAC_LookAtObject(A0_32, A1_33, A2_34, A3_35)
  local L4_36
  L4_36 = {}
  L4_36.look_task = nil
  L4_36.timer_task = nil
  function L4_36.update(A0_37)
    local L1_38
    L1_38 = _findObjectHandle
    L1_38 = L1_38(A0_32)
    A0_37.look_task = Fn_lookAtObject(L1_38, A1_33)
    A0_37.timer_task = invokeTask(function()
      if A3_35 ~= nil then
        waitSeconds(A3_35)
      else
        waitSeconds(4)
      end
    end)
    while A0_37.timer_task:isRunning() and not Fn_isInSightTarget(L1_38, A2_34) do
      wait()
    end
    A0_37.look_task:abort()
    A0_37.look_task = nil
    A0_37.timer_task:abort()
    A0_37.timer_task = nil
  end
  function L4_36.destractor(A0_39)
    if A0_39.look_task ~= nil then
      A0_39.look_task:abort()
      A0_39.look_task = nil
    end
    if A0_39.timer_task ~= nil then
      A0_39.timer_task:abort()
      A0_39.timer_task = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L4_36.update, L4_36.destractor, L4_36)
end
function RAC_LockOnObject(A0_40, A1_41, A2_42)
  local L3_43
  L3_43 = {}
  L3_43.timer_task = nil
  function L3_43.update(A0_44)
    local L1_45, L2_46
    L1_45 = _findObjectHandle
    L2_46 = A0_40
    L1_45 = L1_45(L2_46)
    L2_46 = A2_42
    if L2_46 ~= nil then
      L2_46 = invokeTask
      L2_46 = L2_46(function()
        waitSeconds(A2_42)
      end)
      A0_44.timer_task = L2_46
    end
    L2_46 = Camera
    L2_46 = L2_46.resetViewControl
    L2_46(L2_46)
    while true do
      L2_46 = A0_44.timer_task
      if L2_46 ~= nil then
        L2_46 = A0_44.timer_task
        L2_46 = L2_46.isRunning
        L2_46 = L2_46(L2_46)
      end
      if L2_46 then
        L2_46 = L1_45.getWorldPos
        L2_46 = L2_46(L1_45)
        L2_46.y = L2_46.y + A1_41
        Camera:setViewControlTarget(L2_46)
        wait()
      end
    end
  end
  function L3_43.destractor(A0_47)
    if A0_47.timer_task ~= nil then
      A0_47.timer_task:abort()
      A0_47.timer_task = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L3_43.update, L3_43.destractor, L3_43)
end
function RAC_disablePhotoMode(A0_48)
  HUD:setPhotoMode(false)
  while HUD:isPhotoMode() or HUD:isPhotoModePlayingAnim() do
    wait()
  end
  if A0_48 ~= nil then
    waitSeconds(A0_48)
  end
end
function RAC_createGameObject2(A0_49, A1_50, A2_51, A3_52)
  if A2_51 == nil then
    A2_51 = Vector(0, 0, 0)
  end
  if A3_52 == nil then
    A3_52 = IdentQuat()
  end
  createGameObject2(A1_50):setName(A0_49)
  createGameObject2(A1_50):setWorldTransform(A2_51, A3_52)
  createGameObject2(A1_50):setForceMove()
  return (createGameObject2(A1_50))
end
function RAC_createGimmickBg(A0_53, A1_54, A2_55, A3_56, A4_57, A5_58, A6_59, A7_60, A8_61)
  Fn_createGimmickBg(A2_55, A0_53, A1_54, A6_59, A7_60, A8_61):setWorldTransform(_findObjectHandle(A2_55):getWorldTransform())
  Fn_createGimmickBg(A2_55, A0_53, A1_54, A6_59, A7_60, A8_61):setForceMove()
  Fn_createGimmickBg(A2_55, A0_53, A1_54, A6_59, A7_60, A8_61):setFloaterParams()
  if A3_56 == nil then
    A3_56 = false
  end
  Fn_createGimmickBg(A2_55, A0_53, A1_54, A6_59, A7_60, A8_61):setIgnoreGrab(A3_56)
  if A4_57 == nil then
    A4_57 = false
  end
  Fn_createGimmickBg(A2_55, A0_53, A1_54, A6_59, A7_60, A8_61):switchGravityGrabAsWeapon(A4_57)
  if A5_58 == nil then
    A5_58 = -1
  end
  Fn_createGimmickBg(A2_55, A0_53, A1_54, A6_59, A7_60, A8_61):setAutoRestore(A5_58)
  return (Fn_createGimmickBg(A2_55, A0_53, A1_54, A6_59, A7_60, A8_61))
end
function RAC_createEffect(A0_62)
  local L1_63
  if A0_62 ~= nil then
    L1_63 = {}
    L1_63.eff_hdl = nil
    L1_63.pos_node = nil
    L1_63.timer_task = nil
    L1_63.is_ready = false
    function L1_63.update(A0_64)
      local L1_65, L2_66, L3_67
      L1_65 = Vector
      L2_66 = 0
      L3_67 = 0
      L1_65 = L1_65(L2_66, L3_67, 0)
      L2_66 = IdentQuat
      L2_66 = L2_66()
      L3_67 = A0_62.loop
      if L3_67 == nil then
        A0_62.loop = false
      end
      L3_67 = A0_62.parent_hdl
      if L3_67 ~= nil then
        L3_67 = A0_62.parent_hdl
        if L3_67:getTypeName() == "GimmickBg" and L3_67:getDynamicObject() ~= nil then
          L3_67 = L3_67:getDynamicObject()
        end
        if A0_62.parent_joint ~= nil then
          L1_65, L2_66 = L3_67:getJointWorldTransform(A0_62.parent_joint)
        else
          L1_65, L2_66 = L3_67:getWorldTransform()
        end
        A0_64.pos_node = RAC_createGameObject2(A0_62.eff_name .. "_pos_node", "Node", L1_65, L2_66)
        L3_67:appendChild(A0_64.pos_node, true)
        if A0_62.off_pos ~= nil then
          A0_64.pos_node:setPos(A0_62.off_pos)
        end
        if A0_62.off_rot ~= nil then
          A0_64.pos_node:setRot(A0_62.off_rot)
        end
      else
        L3_67 = A0_62.pos_node
        if L3_67 ~= nil then
          L3_67 = A0_62.pos_node
          if L3_67:getTypeName() == "GimmickBg" and L3_67:getDynamicObject() ~= nil then
            L3_67 = L3_67:getDynamicObject()
          end
          L1_65, L2_66 = L3_67:getWorldTransform()
          A0_64.pos_node = RAC_createGameObject2(A0_62.eff_name .. "_pos_node", "Node", L1_65, L2_66)
        else
          L3_67 = A0_62.world_pos
          if L3_67 ~= nil then
            L1_65 = A0_62.world_pos
            L3_67 = A0_62.world_rot
            L2_66 = L3_67 or L3_67
            L3_67 = RAC_createGameObject2
            L3_67 = L3_67(A0_62.eff_name .. "_pos_node", "Node", L1_65, L2_66)
            A0_64.pos_node = L3_67
          end
        end
      end
      L3_67 = start_game_obj
      L3_67()
      L3_67 = Fn_createEffect
      L3_67 = L3_67(A0_62.eff_name, A0_62.eff_name, A0_64.pos_node, A0_62.loop)
      A0_64.eff_hdl = L3_67
      L3_67 = invokeTask
      L3_67 = L3_67(function()
        if A0_62.time ~= nil then
          waitSeconds(A0_62.time)
        while true do
          else
            wait()
          end
        end
      end)
      A0_64.timer_task = L3_67
      A0_64.is_ready = true
      L3_67 = A0_62.stop
      if L3_67 == true then
        L3_67 = A0_64.eff_hdl
        L3_67 = L3_67.stop
        L3_67(L3_67)
        while true do
          while true do
            L3_67 = A0_64.eff_hdl
            if L3_67 ~= nil then
              L3_67 = A0_64.eff_hdl
              L3_67 = L3_67.isPlaying
              L3_67 = L3_67(L3_67)
            end
            if not L3_67 then
              L3_67 = wait
              L3_67()
            end
          end
        end
      end
      while true do
        L3_67 = A0_64.eff_hdl
        if L3_67 ~= nil then
          L3_67 = A0_64.eff_hdl
          L3_67 = L3_67.isPlaying
          L3_67 = L3_67(L3_67)
          if L3_67 then
            L3_67 = A0_64.timer_task
            if L3_67 ~= nil then
              L3_67 = A0_64.timer_task
              L3_67 = L3_67.isRunning
              L3_67 = L3_67(L3_67)
            end
          end
        end
        if L3_67 then
          L3_67 = wait
          L3_67()
        end
      end
    end
    function L1_63.destractor(A0_68)
      A0_68:finalize()
    end
    function L1_63.finalize(A0_69)
      if A0_69.pos_node ~= nil then
        A0_69.pos_node:try_term()
        A0_69.pos_node = nil
      end
      if A0_69.eff_hdl ~= nil then
        Fn_finishedTremEffect(A0_69.eff_hdl)
        A0_69.eff_hdl = nil
      end
      if A0_69.timer_task ~= nil then
        A0_69.timer_task:abort()
        A0_69.timer_task = nil
      end
    end
    function L1_63.setAlpha(A0_70, A1_71, A2_72, A3_73)
      if A0_70.eff_hdl ~= nil then
        Fn_setAlpha(A0_70.eff_hdl, A1_71, A2_72, A3_73)
      end
    end
    function L1_63.setVisible(A0_74, A1_75)
      if A0_74.eff_hdl ~= nil then
        A0_74.eff_hdl:setVisible(A1_75)
      end
    end
    function L1_63.setActive(A0_76, A1_77)
      if A0_76.eff_hdl ~= nil then
        A0_76.eff_hdl:setActive(A1_77)
      end
    end
    RAC_InvokeTaskWithDestractor(L1_63.update, L1_63.destractor, L1_63).eff_task = L1_63
    RAC_InvokeTaskWithDestractor(L1_63.update, L1_63.destractor, L1_63).setAlpha = function(A0_78, A1_79, A2_80, A3_81)
      A0_78.eff_task:setAlpha(A1_79, A2_80, A3_81)
    end
    RAC_InvokeTaskWithDestractor(L1_63.update, L1_63.destractor, L1_63).playEffect = function(A0_82)
      if A0_82.eff_task.eff_hdl ~= nil then
        A0_82.eff_task.eff_hdl:play()
      end
    end
    RAC_InvokeTaskWithDestractor(L1_63.update, L1_63.destractor, L1_63).stopEffect = function(A0_83)
      if A0_83.eff_task.eff_hdl ~= nil then
        A0_83.eff_task.eff_hdl:stop()
      end
    end
    RAC_InvokeTaskWithDestractor(L1_63.update, L1_63.destractor, L1_63).isReady = function(A0_84)
      return A0_84.eff_task.is_ready
    end
    RAC_InvokeTaskWithDestractor(L1_63.update, L1_63.destractor, L1_63).getPosNode = function(A0_85)
      return A0_85.eff_task.pos_node
    end
    return (RAC_InvokeTaskWithDestractor(L1_63.update, L1_63.destractor, L1_63))
  end
  L1_63 = nil
  return L1_63
end
function RAC_createEffectReadyWait(A0_86)
  while not RAC_createEffect(A0_86):isReady() do
    wait()
  end
  return (RAC_createEffect(A0_86))
end
function RAC_NaviKill(A0_87)
  if A0_87 == nil then
    A0_87 = true
  end
  HUD:naviSetActivate(false, A0_87)
  HUD:naviSetTarget(nil)
  HUD:naviSetPochiDistanceDensity0(0)
  HUD:naviSetPochiDistanceDensity100(2)
end
function RAC_invokeMoveCharaTask(A0_88, A1_89, A2_90, A3_91)
  local L4_92, L5_93
  L4_92 = {}
  L5_93 = 1
  while findGameObject2("Node", A1_89 .. string.format("%02d", L5_93)) ~= nil do
    L4_92[L5_93] = {
      pos = findGameObject2("Node", A1_89 .. string.format("%02d", L5_93)):getName()
    }
    do break end
    do break end
    L5_93 = L5_93 + 1
  end
  if #L4_92 == 0 then
    print(" \231\148\159\230\136\144\229\164\177\230\149\151:" .. A1_89 .. string.format("%02d", L5_93))
    return invokeTask(function()
      local L0_94, L1_95
    end)
  end
  if Fn_findNpc(A0_88) == nil then
    return nil
  end
  Fn_findNpc(A0_88):pauseMove(false)
  return Fn_moveNpc(A0_88, L4_92, A2_90, A3_91)
end
function RAC_invokeMoveCharaTask2(A0_96, A1_97, A2_98, A3_99)
  local L4_100, L5_101, L6_102, L7_103, L8_104, L9_105, L10_106
  L4_100 = {}
  L5_101 = 1
  for L9_105, L10_106 in L6_102(L7_103) do
    if findGameObject2("Node", L10_106) ~= nil then
      L4_100[L5_101] = findGameObject2("Node", L10_106):getName()
    else
      break
    end
    L5_101 = L5_101 + 1
  end
  if L6_102 == 0 then
    L6_102(L7_103)
    return L6_102(L7_103)
  end
  L6_102(L7_103, L8_104)
  L9_105 = A2_98
  L10_106 = A3_99
  return L6_102(L7_103, L8_104, L9_105, L10_106)
end
function RAC_invokeMoveCharaTaskComSb(A0_107, A1_108, A2_109, A3_110, A4_111)
  local L5_112, L6_113
  L5_112 = {}
  L6_113 = 1
  while Fn_sendEventComSb(A0_107, "Node", A2_109 .. string.format("%02d", L6_113)) ~= nil do
    L5_112[L6_113] = {
      pos = Fn_sendEventComSb(A0_107, "Node", A2_109 .. string.format("%02d", L6_113))
    }
    do break end
    do break end
    L6_113 = L6_113 + 1
  end
  if #L5_112 == 0 then
    print(" \231\148\159\230\136\144\229\164\177\230\149\151:" .. A2_109 .. string.format("%02d", L6_113))
    return invokeTask(function()
      local L0_114, L1_115
    end)
  end
  Fn_findNpc(A1_108):pauseMove(false)
  return Fn_moveNpc(A1_108, L5_112, A3_110, A4_111)
end
function RAC_invokeMoveCharaTaskComSb2(A0_116, A1_117, A2_118, A3_119, A4_120)
  local L5_121, L6_122, L7_123, L8_124, L9_125, L10_126, L11_127
  L5_121 = {}
  L6_122 = 1
  for L10_126, L11_127 in L7_123(L8_124) do
    if Fn_sendEventComSb(A0_116, "Node", L11_127) ~= nil then
      L5_121[L6_122] = {
        pos = Fn_sendEventComSb(A0_116, "Node", L11_127)
      }
    else
      break
    end
    L6_122 = L6_122 + 1
  end
  if L7_123 == 0 then
    L7_123(L8_124)
    return L7_123(L8_124)
  end
  L7_123(L8_124, L9_125)
  L10_126 = A3_119
  L11_127 = A4_120
  return L7_123(L8_124, L9_125, L10_126, L11_127)
end
function RAC_InvokeAutoDeactiveNpcTask(A0_128, A1_129)
  A1_129 = A1_129 or 20
  return invokeTask(function()
    local L0_130
    L0_130 = Fn_findNpcPuppet
    L0_130 = L0_130(A0_128)
    if L0_130 ~= nil then
      while L0_130:getActive() and (Fn_isInSightTarget(L0_130, 1) or Fn_getPlayerWorldPos():DistanceTo(L0_130:getWorldPos()) < A1_129) do
        wait()
      end
      Fn_setNpcActive(A0_128, false)
    end
  end)
end
function RAC_grabNpcCaption(A0_131, A1_132, A2_133)
  local L3_134, L4_135
  L3_134 = Fn_findNpc
  L4_135 = A0_131
  L3_134 = L3_134(L4_135)
  L4_135 = Fn_findNpcPuppet
  L4_135 = L4_135(A0_131)
  if L4_135 ~= nil and not L4_135:isGrabbed() then
    return (invokeTask(function()
      local L0_136, L1_137, L2_138, L3_139, L4_140, L5_141
      L0_136 = {}
      L1_137 = false
      L2_138 = nil
      L3_139 = 0
      for _FORV_7_, _FORV_8_ in L4_140(L5_141) do
        L0_136[_FORV_7_] = false
        if _FORV_8_.range == nil then
          _FORV_8_.range = L3_139 + 3
        end
        L3_139 = _FORV_8_.range
      end
      if L4_140 == nil then
        A2_133 = L4_140
      end
      if L4_140 then
        L4_140(L5_141)
        L1_137 = true
      end
      while true do
        if not L4_140 then
          for _FORV_9_, _FORV_10_ in ipairs(A1_132) do
            if L4_140 < _FORV_10_.range then
              break
            end
          end
          if A1_132[L5_141].caption ~= nil then
            if L0_136[L5_141] == false then
              if L2_138 ~= nil then
                Fn_captionViewEnd()
                L2_138 = nil
              end
              if not L3_134:isIgnoreGrab() then
                if A1_132[L5_141].fall_check ~= true or not L3_134:isFall() then
                  Fn_captionView(A1_132[L5_141].caption, A1_132[L5_141].time)
                  if A1_132[L5_141].voice ~= nil then
                    Sound:playSE(A1_132[L5_141].voice, 1, "", L4_135)
                  end
                end
                L2_138 = A1_132[L5_141].caption
              end
            end
          elseif L2_138 ~= nil then
            Fn_captionViewEnd()
            L2_138 = nil
          end
          L0_136[L5_141] = true
          for _FORV_9_, _FORV_10_ in ipairs(L0_136) do
            if _FORV_9_ ~= L5_141 then
              L0_136[_FORV_9_] = false
            end
          end
          if A2_133 and not L1_137 then
            Fn_naviSet(L4_135)
            L1_137 = true
          end
          wait()
        end
      end
      if L4_140 and L1_137 then
        L4_140()
        L1_137 = false
      end
      if L2_138 ~= nil then
        L4_140()
        L2_138 = nil
      end
    end))
  end
  return nil
end
function RAC_grabNpcCaptionWait(A0_142, A1_143, A2_144, A3_145, A4_146)
  while RAC_grabNpcCaption(A0_142, A1_143, A2_144, A3_145, A4_146) ~= nil and RAC_grabNpcCaption(A0_142, A1_143, A2_144, A3_145, A4_146):isRunning() do
    wait()
  end
end
RAC_CarryMultiGrabClass = {}
RAC_CarryMultiGrabClass.CARRY_TYPE_FLOATING = 0
RAC_CarryMultiGrabClass.CARRY_TYPE_LANDING = 1
RAC_CarryMultiGrabClass.CARRY_TYPE_RELEASE = 2
function RAC_CarryMultiGrabClass.create(A0_147)
  local L1_148, L2_149, L3_150, L4_151, L5_152, L6_153
  L1_148 = {}
  L1_148.npc_name = nil
  L1_148.target_data_tbl = L2_149
  L1_148.navi_kill = true
  L1_148.carry_type = L2_149
  L1_148.main_task = nil
  L1_148.carry_success_idx = 0
  L1_148.req_change_target_enable = false
  L1_148.req_change_navi_enable = false
  L1_148.capture_caption = ""
  L1_148.release_caption = nil
  L1_148.caption_delay_task = nil
  for L5_152, L6_153 in L2_149(L3_150) do
    if type(L6_153) == "function" then
      L1_148[L5_152] = L6_153
    end
  end
  return L1_148
end
function RAC_CarryMultiGrabClass.set(A0_154, A1_155, A2_156, A3_157, A4_158, A5_159, A6_160)
  if A0_154 == nil then
    return false
  end
  if A0_154.main_task == nil then
    A0_154.npc_name = A1_155
    A0_154.target_data_tbl = {
      table.unpack(A2_156)
    }
    A0_154.navi_kill = true
    if A3_157 ~= nil then
      A0_154.navi_kill = A3_157
    end
    A0_154.carry_type = true
    if A4_158 ~= nil then
      A0_154.carry_type = A4_158
    end
    A0_154.capture_caption = A5_159
    A0_154.release_caption = A6_160
    for _FORV_10_, _FORV_11_ in ipairs(A0_154.target_data_tbl) do
      if A0_154.target_data_tbl[_FORV_10_].navi_obj ~= nil then
        A0_154.target_data_tbl[_FORV_10_].navi_obj:setActive(false)
        A0_154.target_data_tbl[_FORV_10_].navi_obj:del()
        A0_154.target_data_tbl[_FORV_10_].navi_obj = nil
      end
      if A0_154.target_data_tbl[_FORV_10_].enable == nil then
        A0_154.target_data_tbl[_FORV_10_].enable = true
      end
      if A0_154.target_data_tbl[_FORV_10_].navi_enable == nil then
        A0_154.target_data_tbl[_FORV_10_].navi_enable = true
      end
      if A0_154.target_data_tbl[_FORV_10_].is_in_fx == nil then
        A0_154.target_data_tbl[_FORV_10_].is_in_fx = true
      end
      if A0_154.target_data_tbl[_FORV_10_].is_out_fx == nil then
        A0_154.target_data_tbl[_FORV_10_].is_out_fx = true
      end
    end
    return true
  end
  return false
end
function RAC_CarryMultiGrabClass.reqSetTargetActive(A0_161, A1_162, A2_163)
  local L3_164
  L3_164 = A0_161.target_data_tbl
  L3_164 = L3_164[A1_162]
  if L3_164 ~= nil then
    L3_164 = A0_161.target_data_tbl
    L3_164 = L3_164[A1_162]
    L3_164.enable = A2_163
    A0_161.req_change_target_enable = true
  end
end
function RAC_CarryMultiGrabClass.getTargetActive(A0_165, A1_166)
  local L2_167
  if A0_165 == nil then
    L2_167 = false
    return L2_167
  end
  L2_167 = A0_165.target_data_tbl
  L2_167 = L2_167[A1_166]
  if L2_167 ~= nil then
    L2_167 = false
    return L2_167
  end
  L2_167 = A0_165.target_data_tbl
  L2_167 = L2_167[A1_166]
  L2_167 = L2_167.enable
  return L2_167
end
function RAC_CarryMultiGrabClass.reqSetNaviActive(A0_168, A1_169, A2_170)
  if A0_168 == nil then
    return
  end
  if navi_idx ~= nil then
    if A0_168.target_data_tbl[A1_169] ~= nil then
      A0_168.target_data_tbl[A1_169].navi_enable = A2_170
      A0_168.req_change_navi_enable = true
    end
  else
    for _FORV_6_, _FORV_7_ in ipairs(A0_168.target_data_tbl) do
      A0_168.target_data_tbl[_FORV_6_].navi_enable = A2_170
    end
    A0_168.req_change_navi_enable = true
  end
end
function RAC_CarryMultiGrabClass.run(A0_171)
  if A0_171 == nil then
    return
  end
  if A0_171.main_task == nil then
    A0_171.carry_success_idx = 0
    A0_171.main_task = invokeTask(function()
      local L0_172, L1_173, L2_174, L3_175, L4_176, L5_177
      for L3_175, L4_176 in L0_172(L1_173) do
        L5_177.navi_obj = nil
        if L5_177 ~= nil then
          if type(L5_177) == "string" then
          end
          HUD:mnaviNew({
            name = "mnavi_" .. L3_175
          }):setTarget(L5_177)
          HUD:mnaviNew({
            name = "mnavi_" .. L3_175
          }):setActive(false)
          A0_171.target_data_tbl[L3_175].navi_obj = HUD:mnaviNew({
            name = "mnavi_" .. L3_175
          })
        end
      end
      if L0_172 == nil then
        L1_173(L2_174)
      else
        repeat
          if L3_175 == false then
            while true do
              if L3_175 == false then
                L3_175()
              end
            end
            for _FORV_6_, _FORV_7_ in L3_175(L4_176) do
              if _FORV_7_.navi_obj ~= nil then
                _FORV_7_.navi_obj:setActive(false)
              end
            end
            L3_175(L4_176)
            if L2_174 == true then
              A0_171.caption_delay_task = L3_175
            else
              L3_175(L4_176, L5_177)
            end
            while true do
              if L3_175 == false then
                L3_175()
              end
            end
            if L3_175 ~= nil then
              L3_175(L4_176)
              A0_171.caption_delay_task = nil
            end
            L3_175()
            L3_175()
          end
          for _FORV_6_, _FORV_7_ in L3_175(L4_176) do
            if _FORV_7_.enable == true and _FORV_7_.navi_obj ~= nil and _FORV_7_.navi_enable == true then
              _FORV_7_.navi_obj:setActive(true, _FORV_7_.is_in_fx)
            end
          end
          A0_171.req_change_navi_enable = false
          for _FORV_6_, _FORV_7_ in L3_175(L4_176) do
            if _FORV_7_.enable == true then
              _FORV_7_.reset_sensor_flag_fnc()
              Fn_pcSensorOn(_FORV_7_.target_pc_sensor_name)
            end
          end
          repeat
            L5_177()
            if L5_177 == true then
              for _FORV_8_, _FORV_9_ in L5_177(A0_171.target_data_tbl) do
                if _FORV_9_.enable == true then
                  _FORV_9_.reset_sensor_flag_fnc()
                  Fn_pcSensorOn(_FORV_9_.target_pc_sensor_name)
                else
                  Fn_pcSensorOff(_FORV_9_.target_pc_sensor_name)
                  _FORV_9_.reset_sensor_flag_fnc()
                end
              end
              L5_177()
              A0_171.req_change_target_enable = false
            end
            if L5_177 == true then
              L5_177()
            end
            for _FORV_9_, _FORV_10_ in ipairs(A0_171.target_data_tbl) do
              if _FORV_10_.enable == true then
                if A0_171.carry_type == RAC_CarryMultiGrabClass.CARRY_TYPE_FLOATING then
                  if _FORV_10_.check_sensor_fnc() == true and L0_172:isGrabbed() == true then
                    A0_171.carry_success_idx = _FORV_9_
                    break
                  end
                elseif A0_171.carry_type == RAC_CarryMultiGrabClass.CARRY_TYPE_LANDING then
                  if _FORV_10_.check_sensor_fnc() == true and Player:getAction() == Player.kAction_Idle and L0_172:isGrabbed() == true then
                    A0_171.carry_success_idx = _FORV_9_
                    break
                  end
                elseif A0_171.carry_type == RAC_CarryMultiGrabClass.CARRY_TYPE_RELEASE and _FORV_10_.check_sensor_fnc() == true and Player:getAction() == Player.kAction_Idle and L0_172:isGrabbed() == true then
                  break
                end
              end
            end
            if L5_177 > 0 then
              if L3_175 == false then
                if A0_171.release_caption ~= nil then
                  Fn_captionView(A0_171.release_caption, 0)
                end
              end
              if L4_176 == false and Pad:getButton(Pad.kButton_RR) == true then
                if L3_175 == true then
                  Fn_captionViewEnd()
                end
                Fn_setGrabReleaseNpc(A0_171.npc_name)
                L0_172:setWorldTransform(Fn_getPlayerWorldTransform())
                L0_172:setForceMove()
                A0_171.carry_success_idx = L5_177
              end
            elseif L3_175 == true then
              Fn_captionViewEnd()
            end
          until 0 < A0_171.carry_success_idx or L0_172:isGrabbed() == false
          for _FORV_8_, _FORV_9_ in L5_177(A0_171.target_data_tbl) do
            if _FORV_9_.enable == true then
              Fn_pcSensorOff(_FORV_9_.target_pc_sensor_name)
              _FORV_9_.reset_sensor_flag_fnc()
            end
          end
        until L5_177 > 0
      end
      for L4_176, L5_177 in L1_173(L2_174) do
        if L5_177.navi_obj ~= nil and (A0_171.navi_kill == true or L5_177.navi_obj:getAvtive() == false) then
          L5_177.navi_obj:setActive(false, L5_177.is_out_fx)
          L5_177.navi_obj:del()
          L5_177.navi_obj = nil
        end
      end
      A0_171.main_task = nil
    end)
  end
end
function RAC_CarryMultiGrabClass.isRunning(A0_178)
  if A0_178 == nil then
    return false
  end
  if A0_178.main_task ~= nil and A0_178.main_task:isRunning() then
    return true
  end
  return false
end
function RAC_CarryMultiGrabClass.kill(A0_179)
  if A0_179 == nil then
    return
  end
  if A0_179.main_task ~= nil then
    A0_179.main_task:abort()
    A0_179.main_task = nil
  end
  for _FORV_4_, _FORV_5_ in ipairs(A0_179.target_data_tbl) do
    if _FORV_5_.navi_obj ~= nil and (A0_179.navi_kill == true or _FORV_5_.navi_obj:getAvtive() == false) then
      _FORV_5_.navi_obj:setActive(false)
      _FORV_5_.navi_obj:del()
      _FORV_5_.navi_obj = nil
    end
  end
  if A0_179.caption_delay_task ~= nil then
    A0_179.caption_delay_task:abort()
    A0_179.caption_delay_task = nil
  end
end
function RAC_CarryMultiGrabClass.getCarrySuccessIdx(A0_180)
  local L1_181
  if A0_180 == nil then
    L1_181 = 0
    return L1_181
  end
  L1_181 = A0_180.carry_success_idx
  return L1_181
end
function RAC_getDistanceAngleYQuat(A0_182, A1_183)
  local L2_184, L3_185
  L3_185 = A0_182
  L2_184 = A0_182.Apply
  L2_184 = L2_184(L3_185, Vector(0, 0, 1))
  L3_185 = A1_183.Apply
  L3_185 = L3_185(A1_183, Vector(0, 0, 1))
  return Fn_get_distance_angle(L2_184, L3_185)
end
function RAC_getDistanceAngleQuat(A0_186, A1_187)
  local L2_188, L3_189
  L3_189 = A0_186
  L2_188 = A0_186.Apply
  L2_188 = L2_188(L3_189, Vector(0, 0, 1))
  L3_189 = A1_187.Apply
  L3_189 = L3_189(A1_187, Vector(0, 0, 1))
  return RAC_getDistanceAngle(L2_188, L3_189)
end
function RAC_getDistanceAngle(A0_190, A1_191)
  local L2_192, L3_193, L4_194, L5_195, L6_196
  L3_193 = A0_190
  L2_192 = A0_190.Length
  L2_192 = L2_192(L3_193)
  L4_194 = A1_191
  L3_193 = A1_191.Length
  L3_193 = L3_193(L4_194)
  L4_194 = L2_192 * L3_193
  if L4_194 <= 0 then
    L5_195 = 360
    return L5_195
  end
  L5_195 = A0_190.x
  L6_196 = A1_191.x
  L5_195 = L5_195 * L6_196
  L6_196 = A0_190.y
  L6_196 = L6_196 * A1_191.y
  L5_195 = L5_195 + L6_196
  L6_196 = A0_190.z
  L6_196 = L6_196 * A1_191.z
  L5_195 = L5_195 + L6_196
  L6_196 = ArcCos
  L6_196 = L6_196(L5_195 / L4_194)
  return Rad2Deg(L6_196)
end
function RAC_InvokePursueFlyTask(A0_197, A1_198, A2_199, A3_200, A4_201, A5_202)
  if A4_201 == nil then
    A4_201 = true
  end
  if A5_202 == nil then
    A5_202 = true
  end
  return invokeTask(function()
    local L0_203, L1_204
    L0_203 = {}
    L1_204 = 1
    while true do
      if findGameObject2("Node", A1_198 .. string.format("%02d", L1_204)) ~= nil then
        L0_203[L1_204] = {}
        L0_203[L1_204].pos = findGameObject2("Node", A1_198 .. string.format("%02d", L1_204)):getName()
        if L1_204 == 1 and A4_201 == true then
          L0_203[L1_204].attr = "takeoff"
        else
          L0_203[L1_204].attr = "fly"
        end
      else
        if L1_204 >= 2 and A5_202 == true then
          L0_203[L1_204 - 1].attr = "land"
        end
        break
      end
      L1_204 = L1_204 + 1
    end
    Fn_fly(A0_197, L0_203, {moveSpeed = A2_199, escape = A3_200})
  end)
end
function RAC_FlyChara(A0_205, A1_206, A2_207, A3_208)
  local L4_209, L5_210, L6_211, L7_212
  L4_209 = {}
  L5_210 = 1
  while true do
    L6_211 = A1_206
    L7_212 = string
    L7_212 = L7_212.format
    L7_212 = L7_212("%02d", L5_210)
    L6_211 = L6_211 .. L7_212
    L7_212 = findGameObject2
    L7_212 = L7_212("Node", L6_211)
    if L7_212 ~= nil then
      L4_209[L5_210] = {pos = L6_211, attr = "fly"}
    else
      break
    end
    L5_210 = L5_210 + 1
  end
  L6_211 = #L4_209
  if L6_211 == 0 then
    L6_211 = print
    L7_212 = " \231\148\159\230\136\144\229\164\177\230\149\151"
    L6_211(L7_212)
    return
  end
  L6_211 = Fn_findNpc
  L7_212 = A0_205
  L6_211 = L6_211(L7_212)
  L7_212 = L6_211
  L6_211 = L6_211.pauseMove
  L6_211(L7_212, false)
  L6_211, L7_212 = nil, nil
  if A3_208 ~= nil then
    L6_211 = invokeTask(function()
      waitSeconds(A3_208)
    end)
  end
  L7_212 = invokeTask(function()
    Fn_fly(A0_205, L4_209, A2_207)
  end)
  if L6_211 ~= nil then
    while L7_212:isRunning() and L6_211:isRunning() do
      wait()
    end
    L6_211:abort()
    L7_212:abort()
  else
    while L7_212:isRunning() do
      wait()
    end
    L7_212:abort()
  end
end
function RAC_setAccordionNpc(A0_213, A1_214, A2_215, A3_216, A4_217)
  local L5_218
  if A3_216 == nil then
    A3_216 = true
  end
  if A4_217 == nil then
    A4_217 = false
  end
  L5_218 = {}
  L5_218.npc_tbl = {}
  L5_218.ready_flg = false
  function L5_218.update(A0_219)
    local L1_220, L2_221
    L1_220 = A0_213
    L2_221 = "_accordion"
    L1_220 = L1_220 .. L2_221
    L2_221 = {
      {
        name = A0_213,
        type = A1_214,
        node = A2_215,
        attach = true,
        active = A3_216,
        start = A4_217
      },
      {
        name = L1_220,
        type = "ciaccordion01",
        node = A2_215,
        attach = true,
        active = A3_216,
        start = A4_217
      }
    }
    Fn_setupNpc(L2_221)
    for _FORV_6_, _FORV_7_ in pairs(L2_221) do
      A0_219.npc_tbl[_FORV_7_.name] = Fn_findNpcPuppet(_FORV_7_.name)
      while not A0_219.npc_tbl[_FORV_7_.name]:isStarted() do
        wait()
      end
    end
    if A3_216 == true then
      Fn_findNpc(A0_213):setPilots({
        {
          pilot = A0_219.npc_tbl[L1_220],
          attach = "bn_spine1"
        }
      })
      Fn_playMotionNpc(A0_213, "accordion_00", false, {isRepeat = true})
      A0_219.ready_flg = true
    else
      A0_219.ready_flg = true
      while true do
        while true do
          if Fn_findNpc(A0_213) ~= nil then
            if false == false and Fn_findNpc(A0_213):getActive() then
              if Fn_findNpc(L1_220) ~= nil then
                Fn_setNpcActive(L1_220, true)
                Fn_findNpc(A0_213):setPilots({
                  {
                    pilot = A0_219.npc_tbl[L1_220],
                    attach = "bn_spine1"
                  }
                })
                Fn_playMotionNpc(A0_213, "accordion_00", false, {isRepeat = true})
              end
            elseif true == true and Fn_findNpc(A0_213):getActive() == false then
              if Fn_findNpc(L1_220) ~= nil then
                Fn_setNpcActive(L1_220, false)
              end
            end
          end
          wait()
        end
      end
    end
    while true do
      wait()
    end
  end
  function L5_218.destractor(A0_222)
    A0_222:finalize()
  end
  function L5_218.isReady(A0_223)
    local L1_224
    L1_224 = A0_223.ready_flg
    return L1_224
  end
  function L5_218.finalize(A0_225)
    for _FORV_4_, _FORV_5_ in pairs(A0_225.npc_tbl) do
      if Fn_findNpc(_FORV_5_.name) ~= nil then
        if not Fn_findNpc(_FORV_5_.name):isStarted() then
          while not Fn_findNpc(_FORV_5_.name):isStarted() do
            wait()
          end
          Fn_disappearNpc(_FORV_5_.name)
        else
          Fn_disappearNpc(_FORV_5_.name)
        end
      end
    end
  end
  RAC_InvokeTaskWithDestractor(L5_218.update, L5_218.destractor, L5_218).npc_task = L5_218
  return (RAC_InvokeTaskWithDestractor(L5_218.update, L5_218.destractor, L5_218))
end
function RAC_setBalloonNpc(A0_226, A1_227, A2_228, A3_229, A4_230, A5_231)
  local L6_232, L7_233
  if A3_229 == nil then
    A3_229 = true
  end
  if A4_230 == nil then
    A4_230 = false
  end
  if A5_231 == nil then
    A5_231 = false
  end
  L6_232 = nil
  L7_233 = {}
  L7_233.npc_tbl = {}
  L7_233.ready_flg = false
  function L7_233.update(A0_234)
    local L1_235, L2_236
    L1_235 = {L2_236}
    L2_236 = {}
    L2_236.name = A0_226
    L2_236.type = A1_227
    L2_236.node = A2_228
    L2_236.attach = true
    L2_236.active = A3_229
    L2_236.start = A4_230
    L2_236 = {}
    L2_236.play = "man01_balloon_stay_00"
    Fn_setupNpc(L1_235)
    for _FORV_6_, _FORV_7_ in pairs(L1_235) do
      A0_234.npc_tbl[_FORV_7_.name] = Fn_findNpcPuppet(_FORV_7_.name)
      while not A0_234.npc_tbl[_FORV_7_.name]:isStarted() do
        wait()
      end
    end
    Fn_loadNpcEventMotion(A0_226, L2_236)
    if A5_231 == false then
      L6_232 = Balloon.create("_balloon_name_01")
      L6_232:start()
      L6_232:attachJoint(A0_234.npc_tbl[A0_226], "loc_l_hand")
    else
      L6_232 = Fn_createGimmickBg("loc_l_hand", "balloon_01", "ciballoonset00_base")
      Fn_attachJoint(L6_232, A0_234.npc_tbl[A0_226], "loc_l_hand")
    end
    Fn_playNpcEventMotion(A0_226, L2_236.play, -1, nil, false)
    A0_234.ready_flg = true
    while true do
      wait()
      if A0_234.npc_tbl[A0_226]:isGrabbed() and L6_232 ~= nil then
        L6_232:release()
      end
    end
  end
  function L7_233.destractor(A0_237)
    A0_237:finalize()
  end
  function L7_233.isReady(A0_238)
    local L1_239
    L1_239 = A0_238.ready_flg
    return L1_239
  end
  function L7_233.finalize(A0_240)
    for _FORV_4_, _FORV_5_ in pairs(A0_240.npc_tbl) do
      if Fn_findNpc(_FORV_5_.name) ~= nil then
        if not Fn_findNpc(_FORV_5_.name):isStarted() then
          while not Fn_findNpc(_FORV_5_.name):isStarted() do
            wait()
          end
          Fn_disappearNpc(_FORV_5_.name)
        else
          Fn_disappearNpc(_FORV_5_.name)
        end
      end
    end
  end
  RAC_InvokeTaskWithDestractor(L7_233.update, L7_233.destractor, L7_233).npc_task = L7_233
  return (RAC_InvokeTaskWithDestractor(L7_233.update, L7_233.destractor, L7_233))
end
function RAC_RaycastEyeSightBase(A0_241, A1_242, A2_243, A3_244, A4_245, A5_246, A6_247)
  local L7_248, L8_249, L9_250
  L8_249 = A0_241
  L7_248 = A0_241.getWorldTransform
  L8_249 = L7_248(L8_249)
  if A4_245 ~= nil then
    L9_250 = L7_248.y
    L9_250 = L9_250 + A4_245
    L7_248.y = L9_250
  else
    L9_250 = L7_248.y
    L9_250 = L9_250 + 1.5
    L7_248.y = L9_250
  end
  L9_250 = Query
  L9_250 = L9_250.setEyeSightRange
  L9_250(L9_250, A2_243)
  L9_250 = A1_242
  if L9_250.x == nil then
    L9_250 = A1_242:getWorldPos()
  end
  if A5_246 ~= nil then
    L9_250.y = L9_250.y + A5_246
  end
  if A6_247 == nil then
    A6_247 = 1
  end
  Query:setEyeSightTransform(L7_248, L8_249)
  if A3_244 ~= nil and A3_244 <= 90 then
    Query:setEyeSightAngle(Deg2Rad(A3_244))
    if Query:checkEyeSightSphere(L9_250, A6_247) then
      return Query:raycastEyeSight(L9_250) == nil
    end
  elseif A2_243 >= Fn_get_distance(L7_248, L9_250) then
    return Query:raycastEyeSight(L9_250) == nil
  end
  return false
end
function RAC_RaycastEyeSight(A0_251, A1_252, A2_253, A3_254, A4_255, A5_256)
  return RAC_RaycastEyeSightBase(Fn_getPlayer(), A0_251, A1_252, A2_253, A3_254, A4_255, A5_256)
end
function RAC_checkEyeSightBase(A0_257, A1_258, A2_259, A3_260, A4_261, A5_262, A6_263)
  local L7_264, L8_265, L9_266
  L8_265 = A0_257
  L7_264 = A0_257.getWorldTransform
  L8_265 = L7_264(L8_265)
  if A4_261 ~= nil then
    L9_266 = L7_264.y
    L9_266 = L9_266 + A4_261
    L7_264.y = L9_266
  else
    L9_266 = L7_264.y
    L9_266 = L9_266 + 1.5
    L7_264.y = L9_266
  end
  L9_266 = Query
  L9_266 = L9_266.setEyeSightRange
  L9_266(L9_266, A2_259)
  L9_266 = A1_258
  if L9_266.x == nil then
    L9_266 = A1_258:getWorldPos()
  end
  if A5_262 ~= nil then
    L9_266.y = L9_266.y + A5_262
  end
  if A6_263 == nil then
    A6_263 = 1
  end
  if A3_260 == nil or A3_260 > 90 then
    A3_260 = 90
  end
  Query:setEyeSightTransform(L7_264, L8_265)
  Query:setEyeSightAngle(Deg2Rad(A3_260))
  if Query:checkEyeSightSphere(L9_266, A6_263) then
    return true
  end
  return false
end
function RAC_checkEyeSight(A0_267, A1_268, A2_269, A3_270, A4_271, A5_272)
  return RAC_checkEyeSightBase(Fn_getPlayer(), A0_267, A1_268, A2_269, A3_270, A4_271, A5_272)
end
function RAC_FindTableValue(A0_273, A1_274)
  for _FORV_5_, _FORV_6_ in pairs(A0_273) do
    if _FORV_6_ == A1_274 then
      return _FORV_5_
    end
  end
  return nil
end
function RAC_GetTableLength(A0_275)
  for _FORV_5_, _FORV_6_ in pairs(A0_275) do
  end
  return 0 + 1
end
function RAC_getTailNumber(A0_276, A1_277, A2_278)
  local L3_279
  if A0_276 ~= nil then
    if A2_278 ~= nil then
      L3_279 = string
      L3_279 = L3_279.sub
      L3_279 = L3_279(A0_276, -(A1_277 + A2_278), -(A2_278 + 1))
      return tonumber(L3_279)
    else
      L3_279 = string
      L3_279 = L3_279.sub
      L3_279 = L3_279(A0_276, -A1_277)
      return tonumber(L3_279)
    end
  end
  L3_279 = nil
  return L3_279
end
RAC_NAVI_DELAY_DEFAULT = 1.3
RAC_CAPTION_DELAY_DEFAULT = 2.5
function RAC_missionNaviCaption(A0_280, A1_281, A2_282, A3_283, A4_284, A5_285, A6_286, A7_287)
  local L8_288, L9_289, L10_290, L11_291
  L8_288 = A3_283 or 0
  L9_289 = A4_284 or RAC_NAVI_DELAY_DEFAULT
  L10_290 = A5_285 or L9_289 + L10_290
  if A0_280 == nil or A0_280 == "" then
    L9_289 = A4_284 or 0
    if A1_281 ~= nil and A1_281 ~= "" then
      L10_290 = A5_285 or L9_289 + L11_291
    else
      L10_290 = A5_285 or 0
    end
  end
  L11_291 = {}
  L11_291.mission_task = nil
  L11_291.navi_task = nil
  L11_291.caption_task = nil
  function L11_291.update(A0_292)
    local L1_293
    L1_293 = A0_280
    if L1_293 ~= nil then
      L1_293 = A0_280
      if L1_293 ~= "" then
        L1_293 = invokeTask
        L1_293 = L1_293(function()
          if L8_288 ~= nil and L8_288 > 0 then
            waitSeconds(L8_288)
          end
          Fn_missionViewWait(A0_280)
        end)
        A0_292.mission_task = L1_293
      end
    end
    L1_293 = _findObjectHandle
    L1_293 = L1_293(A1_281)
    if L1_293 ~= nil then
      A0_292.navi_task = invokeTask(function()
        if L9_289 ~= nil and L9_289 > 0 then
          waitSeconds(L9_289)
        end
        Fn_naviSet(L1_293)
      end)
    end
    if A2_282 ~= nil and A2_282 ~= "" then
      A0_292.caption_task = invokeTask(function()
        if L10_290 ~= nil and L10_290 > 0 then
          waitSeconds(L10_290)
        end
        if A6_286 ~= nil then
          Sound:playSE(A6_286, 1, "", A7_287)
        end
        Fn_captionViewWait(A2_282)
      end)
    end
    while true do
      wait()
    end
  end
  function L11_291.destractor(A0_294)
    if A0_294.mission_task ~= nil then
      A0_294.mission_task:abort()
      A0_294.mission_task = nil
    end
    if A0_294.navi_task ~= nil then
      A0_294.navi_task:abort()
      A0_294.navi_task = nil
    end
    if A0_294.caption_task ~= nil then
      A0_294.caption_task:abort()
      A0_294.caption_task = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L11_291.update, L11_291.destractor, L11_291)
end
function RAC_missionNaviCaptionWait(A0_295, A1_296, A2_297, A3_298, A4_299, A5_300, A6_301, A7_302)
  if RAC_missionNaviCaption(A0_295, A1_296, A2_297, A3_298, A4_299, A5_300, A6_301, A7_302) ~= nil then
    while RAC_missionNaviCaption(A0_295, A1_296, A2_297, A3_298, A4_299, A5_300, A6_301, A7_302):isRunning() do
      wait()
    end
    RAC_missionNaviCaption(A0_295, A1_296, A2_297, A3_298, A4_299, A5_300, A6_301, A7_302):abort()
  end
end
RAC_LINEUP_CONTROL = {}
function RAC_initializeLineup(A0_303, A1_304, A2_305)
  local L3_306, L4_307, L5_308, L6_309, L7_310, L8_311, L9_312, L10_313, L11_314, L12_315, L13_316
  L3_306 = {}
  L3_306.name = A0_303
  L4_307 = {}
  L3_306.lineup_node = L4_307
  if A2_305 == nil then
    A2_305 = 1
  end
  L4_307 = {}
  L5_308 = {}
  L6_309 = {}
  L7_310 = 1
  while true do
    L8_311 = findGameObject2
    L9_312 = "Node"
    L10_313 = A1_304
    L11_314 = string
    L11_314 = L11_314.format
    L12_315 = "%02d"
    L13_316 = L7_310
    L11_314 = L11_314(L12_315, L13_316)
    L10_313 = L10_313 .. L11_314
    L8_311 = L8_311(L9_312, L10_313)
    if L8_311 ~= nil then
      L4_307[L7_310] = L8_311
      if L7_310 == 1 then
        L9_312 = print
        L10_313 = "LineupNode.."
        L11_314 = L4_307[L7_310]
        L12_315 = L11_314
        L11_314 = L11_314.getName
        L11_314 = L11_314(L12_315)
        L10_313 = L10_313 .. L11_314
        L9_312(L10_313)
      else
        L9_312 = L4_307[L7_310]
        L10_313 = L9_312
        L9_312 = L9_312.getWorldPos
        L9_312 = L9_312(L10_313)
        L10_313 = L7_310 - 1
        L10_313 = L4_307[L10_313]
        L11_314 = L10_313
        L10_313 = L10_313.getWorldPos
        L10_313 = L10_313(L11_314)
        L9_312 = L9_312 - L10_313
        L10_313 = L7_310 - 1
        L12_315 = L9_312
        L11_314 = L9_312.Length
        L11_314 = L11_314(L12_315)
        L5_308[L10_313] = L11_314
        L10_313 = print
        L11_314 = "LineupBaseNode.."
        L12_315 = L4_307[L7_310]
        L13_316 = L12_315
        L12_315 = L12_315.getName
        L12_315 = L12_315(L13_316)
        L13_316 = "("
        L11_314 = L11_314 .. L12_315 .. L13_316 .. L5_308[L7_310 - 1] .. ")"
        L10_313(L11_314)
        L10_313 = L7_310 - 1
        L12_315 = L9_312
        L11_314 = L9_312.Normalize
        L11_314 = L11_314(L12_315)
        L6_309[L10_313] = L11_314
      end
      L7_310 = L7_310 + 1
    end
  end
  L7_310 = 1
  L8_311 = 1
  L9_312 = 0
  while true do
    L10_313, L11_314 = nil, nil
    if L7_310 == 1 then
      L12_315 = L4_307[1]
      L13_316 = L12_315
      L12_315 = L12_315.getWorldTransform
      L13_316 = L12_315(L13_316)
      L11_314 = L13_316
      L10_313 = L12_315
      L9_312 = 0
    else
      L9_312 = L9_312 + A2_305
      L12_315 = L5_308[L8_311]
      if L9_312 < L12_315 then
        L12_315 = L4_307[L8_311]
        L13_316 = L12_315
        L12_315 = L12_315.getWorldTransform
        L13_316 = L12_315(L13_316)
        L11_314 = L13_316
        L10_313 = L12_315
        L12_315 = L6_309[L8_311]
        L12_315 = L12_315 * L9_312
        L10_313 = L10_313 + L12_315
      else
        L12_315 = #L4_307
        L12_315 = L12_315 - 1
        if L8_311 < L12_315 then
          while true do
            L12_315 = L5_308[L8_311]
            if L9_312 > L12_315 then
              L12_315 = L5_308[L8_311]
              L9_312 = L9_312 - L12_315
              L8_311 = L8_311 + 1
            end
          end
          L12_315 = L4_307[L8_311]
          L13_316 = L12_315
          L12_315 = L12_315.getWorldTransform
          L13_316 = L12_315(L13_316)
          L11_314 = L13_316
          L10_313 = L12_315
          L12_315 = L6_309[L8_311]
          L12_315 = L12_315 * L9_312
          L10_313 = L10_313 + L12_315
          do break end
          do break end
          L12_315 = L3_306.lineup_node
          L13_316 = L7_310 - 1
          L12_315 = L12_315[L13_316]
          L13_316 = L12_315
          L12_315 = L12_315.getWorldPos
          L12_315 = L12_315(L13_316)
          L12_315 = L12_315 - L10_313
          L13_316 = Fn_get_distance_angle
          L13_316 = L13_316(L10_313, L3_306.lineup_node[L7_310 - 1]:getWorldPos())
          L11_314 = YRotQuat(Deg2Rad(L13_316))
          L12_315 = A1_304
          L13_316 = string
          L13_316 = L13_316.format
          L13_316 = L13_316("%03d", L7_310)
          L12_315 = L12_315 .. L13_316
          L13_316 = print
          L13_316("LineupNode.." .. L12_315)
          L13_316 = L3_306.lineup_node
          L13_316[L7_310] = RAC_createGameObject2(L12_315, "Node", L10_313, L11_314)
          L7_310 = L7_310 + 1
        end
      end
    end
  end
  L7_310 = RAC_LINEUP_CONTROL
  L7_310[A0_303] = L3_306
  L7_310 = RAC_LINEUP_CONTROL
  L7_310 = L7_310[A0_303]
  L8_311 = {}
  L7_310.lineup_index = L8_311
  L7_310 = L3_306.lineup_node
  return L7_310
end
function RAC_printLineup(A0_317)
  local L1_318, L2_319, L3_320, L4_321, L5_322, L6_323
  L1_318 = RAC_LINEUP_CONTROL
  L1_318 = L1_318[A0_317]
  L1_318 = L1_318.lineup_node
  if L1_318 ~= nil then
    L1_318 = RAC_LINEUP_CONTROL
    L1_318 = L1_318[A0_317]
    L1_318 = L1_318.lineup_node
    L5_322 = ") start"
    L2_319(L3_320)
    for L5_322 = 1, #L1_318 do
      L6_323 = "nil"
      for _FORV_10_, _FORV_11_ in pairs(RAC_LINEUP_CONTROL[A0_317].lineup_index) do
        if L5_322 == RAC_LINEUP_CONTROL[A0_317].lineup_index[_FORV_10_] then
          L6_323 = _FORV_10_
          break
        end
      end
      print(string.format("%3d", L5_322) .. ":" .. L6_323)
    end
    L5_322 = ") end"
    L2_319(L3_320)
  end
end
function RAC_addLineup(A0_324)
  local L1_325, L2_326
  L1_325 = RAC_LINEUP_CONTROL
  L1_325 = L1_325[A0_324]
  L1_325 = L1_325.lineup_node
  if L1_325 ~= nil then
    L1_325 = RAC_LINEUP_CONTROL
    L1_325 = L1_325[A0_324]
    L1_325 = L1_325.lineup_node
    L2_326 = #L1_325
    while L2_326 > 0 do
      if RAC_findLineupIndex(A0_324, L2_326) then
        if L2_326 + 1 > #L1_325 then
          return nil
        else
          print("RAC_findLineupIndex.............." .. L2_326 + 1)
          return L2_326 + 1
        end
      end
      L2_326 = L2_326 - 1
    end
    print("RAC_findLineupIndex..............1")
    return 1
  end
  L1_325 = nil
  return L1_325
end
function RAC_findLineupIndex(A0_327, A1_328)
  if RAC_LINEUP_CONTROL[A0_327] == nil then
    return nil
  end
  for _FORV_5_, _FORV_6_ in pairs(RAC_LINEUP_CONTROL[A0_327].lineup_index) do
    if A1_328 == RAC_LINEUP_CONTROL[A0_327].lineup_index[_FORV_5_] then
      return true
    end
  end
  return false
end
function RAC_setLineupIndex(A0_329, A1_330, A2_331)
  local L3_332
  L3_332 = RAC_LINEUP_CONTROL
  L3_332 = L3_332[A0_329]
  L3_332 = L3_332.lineup_index
  L3_332[A1_330] = A2_331
end
function RAC_getLineupIndex(A0_333, A1_334)
  local L2_335
  L2_335 = RAC_LINEUP_CONTROL
  L2_335 = L2_335[A0_333]
  if L2_335 == nil then
    L2_335 = nil
    return L2_335
  end
  L2_335 = RAC_LINEUP_CONTROL
  L2_335 = L2_335[A0_333]
  L2_335 = L2_335.lineup_index
  L2_335 = L2_335[A1_334]
  return L2_335
end
function RAC_endLineup(A0_336)
  local L1_337, L2_338, L4_339, L5_340
  L1_337 = RAC_LINEUP_CONTROL
  L1_337 = L1_337[A0_336]
  if L1_337 ~= nil then
    L1_337 = RAC_LINEUP_CONTROL
    L1_337 = L1_337[A0_336]
    for _FORV_5_ = 1, #L4_339 do
      if L1_337.lineup_node[_FORV_5_] ~= nil then
        L1_337.lineup_node[_FORV_5_]:try_term()
        L1_337.lineup_node[_FORV_5_] = nil
      end
    end
    L1_337.lineup_node = nil
    L1_337.lineup_index = nil
    L1_337 = nil
  end
  L1_337 = RAC_LINEUP_CONTROL
  L1_337[A0_336] = nil
end
RAC_CAT_WARP_CONTROL = {}
function RAC_startCatWarpControl(A0_341, A1_342, A2_343, A3_344, A4_345, A5_346, A6_347, A7_348, A8_349, A9_350, A10_351, A11_352)
  if RAC_CAT_WARP_CONTROL[A0_341] ~= nil then
    RAC_endCatWarpControl(A0_341)
  end
  print("RAC_startCatWarpControl.." .. A0_341)
  ;({}).name = A0_341
  ;({}).stop = false
  ;({}).middle_leave = false
  if A1_342 ~= nil then
    ;({}).near_sensor_hdl = _findObjectHandle(A1_342)
    ;({}).near_sensor_hdl:setOnEnter("RAC_near_sensor_OnEnter")
    Fn_pcSensorOn(({}).near_sensor_hdl)
  end
  if A2_343 ~= nil then
    ;({}).middle_sensor_hdl = _findObjectHandle(A2_343)
    ;({}).middle_sensor_hdl:setOnLeave("RAC_middle_sensor_OnLeave")
    Fn_pcSensorOn(({}).middle_sensor_hdl)
  end
  if A3_344 ~= nil then
    ;({}).long_sensor_hdl = _findObjectHandle(A3_344)
    ;({}).long_sensor_hdl:setOnLeave("RAC_long_sensor_OnLeave")
    Fn_pcSensorOn(({}).long_sensor_hdl)
  end
  if A4_345 ~= nil then
    ;({}).return_node_hdl = _findObjectHandle(A4_345)
    Fn_setCatWarpCheckPoint(({}).return_node_hdl:getName())
  end
  if A5_346 ~= nil then
    ;({}).navi_node_hdl = _findObjectHandle(A5_346)
  end
  if A6_347 ~= nil then
    ;({}).lookat_node_hdl = _findObjectHandle(A6_347)
  end
  ;({}).warning_txt = A7_348
  ;({}).before_warp = A8_349
  ;({}).after_warp = A9_350
  ;({}).near_in = A10_351
  ;({}).middle_out = A11_352
  RAC_CAT_WARP_CONTROL[A0_341] = {}
  RAC_CAT_WARP_CONTROL[A0_341].near_task = nil
  RAC_CAT_WARP_CONTROL[A0_341].middle_task = nil
  RAC_CAT_WARP_CONTROL[A0_341].long_task = nil
  RAC_CAT_WARP_CONTROL[A0_341].hud_task = nil
end
function RAC_endCatWarpControl(A0_353)
  print("RAC_endCatWarpControl.." .. A0_353)
  if RAC_CAT_WARP_CONTROL[A0_353] ~= nil then
    if RAC_CAT_WARP_CONTROL[A0_353].near_task ~= nil then
      RAC_CAT_WARP_CONTROL[A0_353].near_task:abort()
      RAC_CAT_WARP_CONTROL[A0_353].near_task = nil
    end
    if RAC_CAT_WARP_CONTROL[A0_353].middle_task ~= nil then
      RAC_CAT_WARP_CONTROL[A0_353].middle_task:abort()
      RAC_CAT_WARP_CONTROL[A0_353].middle_task = nil
    end
    if RAC_CAT_WARP_CONTROL[A0_353].long_task ~= nil then
      RAC_CAT_WARP_CONTROL[A0_353].long_task:abort()
      RAC_CAT_WARP_CONTROL[A0_353].long_task = nil
    end
    if RAC_CAT_WARP_CONTROL[A0_353].hud_task ~= nil then
      RAC_CAT_WARP_CONTROL[A0_353].hud_task:abort()
      RAC_CAT_WARP_CONTROL[A0_353].hud_task = nil
    end
    if RAC_CAT_WARP_CONTROL[A0_353].near_sensor_hdl ~= nil then
      RAC_CAT_WARP_CONTROL[A0_353].near_sensor_hdl:setOnEnter(nil)
      Fn_pcSensorOff(RAC_CAT_WARP_CONTROL[A0_353].near_sensor_hdl)
    end
    if RAC_CAT_WARP_CONTROL[A0_353].middle_sensor_hdl ~= nil then
      RAC_CAT_WARP_CONTROL[A0_353].middle_sensor_hdl:setOnLeave(nil)
      Fn_pcSensorOff(RAC_CAT_WARP_CONTROL[A0_353].middle_sensor_hdl)
    end
    if RAC_CAT_WARP_CONTROL[A0_353].long_sensor_hdl ~= nil then
      RAC_CAT_WARP_CONTROL[A0_353].long_sensor_hdl:setOnLeave(nil)
      Fn_pcSensorOff(RAC_CAT_WARP_CONTROL[A0_353].long_sensor_hdl)
    end
    if RAC_CAT_WARP_CONTROL[A0_353].return_node_hdl ~= nil then
      Fn_setCatWarpCheckPoint(nil)
    end
  end
  RAC_CAT_WARP_CONTROL[A0_353] = nil
end
function RAC_stopCatWarpControl(A0_354, A1_355)
  local L2_356
  L2_356 = RAC_CAT_WARP_CONTROL
  L2_356 = L2_356[A0_354]
  if L2_356 ~= nil then
    L2_356 = RAC_CAT_WARP_CONTROL
    L2_356 = L2_356[A0_354]
    if A1_355 == false and L2_356.return_node_hdl ~= nil then
      print("RAC_stopCatWarpControl.." .. A0_354 .. "(disable)")
      Fn_setCatWarpCheckPoint(L2_356.return_node_hdl:getName())
    else
      print("RAC_stopCatWarpControl.." .. A0_354 .. "(enable)")
      Fn_setCatWarpCheckPoint(nil)
    end
    L2_356.stop = A1_355
  end
end
function RAC_isBusyCatWarp(A0_357)
  local L1_358
  L1_358 = RAC_CAT_WARP_CONTROL
  L1_358 = L1_358[A0_357]
  if L1_358 ~= nil then
    L1_358 = RAC_CAT_WARP_CONTROL
    L1_358 = L1_358[A0_357]
    if L1_358.near_task ~= nil and L1_358.near_task:isRunning() then
      return true
    end
    if L1_358.middle_task ~= nil and L1_358.middle_task:isRunning() then
      return true
    end
    if L1_358.long_task ~= nil and L1_358.long_task:isRunning() then
      return true
    end
    if L1_358.hud_task ~= nil and L1_358.hud_task:isRunning() then
      return true
    end
  end
  L1_358 = false
  return L1_358
end
function RAC_findCatWarpControl(A0_359)
  for _FORV_5_, _FORV_6_ in pairs(RAC_CAT_WARP_CONTROL) do
    if _FORV_6_.near_sensor_hdl ~= nil and _FORV_6_.near_sensor_hdl:getName() == A0_359:getName() then
      return _FORV_5_
    end
    if _FORV_6_.middle_sensor_hdl ~= nil and _FORV_6_.middle_sensor_hdl:getName() == A0_359:getName() then
      return _FORV_5_
    end
    if _FORV_6_.long_sensor_hdl ~= nil and _FORV_6_.long_sensor_hdl:getName() == A0_359:getName() then
      return _FORV_5_
    end
  end
  return nil
end
function RAC_changeNodeCatWarpControl(A0_360, A1_361, A2_362, A3_363)
  local L4_364
  L4_364 = RAC_CAT_WARP_CONTROL
  L4_364 = L4_364[A0_360]
  if L4_364 ~= nil then
    L4_364 = RAC_CAT_WARP_CONTROL
    L4_364 = L4_364[A0_360]
    L4_364.return_node_hdl = _findObjectHandle(A1_361)
    L4_364.navi_node_hdl = _findObjectHandle(A2_362)
    L4_364.lookat_node_hdl = _findObjectHandle(A3_363)
  end
end
function RAC_changeWarningTxtCatWarpControl(A0_365, A1_366)
  local L2_367
  L2_367 = RAC_CAT_WARP_CONTROL
  L2_367 = L2_367[A0_365]
  if L2_367 ~= nil then
    L2_367 = RAC_CAT_WARP_CONTROL
    L2_367 = L2_367[A0_365]
    L2_367.warning_txt = A1_366
  end
end
function RAC_isWarningCatWarp(A0_368)
  local L1_369, L2_370
  L1_369 = RAC_CAT_WARP_CONTROL
  L1_369 = L1_369[A0_368]
  if L1_369 ~= nil then
    L1_369 = RAC_CAT_WARP_CONTROL
    L1_369 = L1_369[A0_368]
    L2_370 = L1_369.middle_leave
    return L2_370
  end
  L1_369 = false
  return L1_369
end
function RAC_near_sensor_OnEnter(A0_371)
  local L1_372, L2_373
  L1_372 = RAC_findCatWarpControl
  L2_373 = A0_371
  L1_372 = L1_372(L2_373)
  L2_373 = RAC_CAT_WARP_CONTROL
  L2_373 = L2_373[L1_372]
  L2_373.middle_leave = false
  if L2_373.stop == false then
    print("RAC_near_sensor_OnEnter.." .. A0_371:getName())
    L2_373.near_task = invokeTask(function()
      if L2_373.navi_node_hdl ~= nil then
        Fn_naviKill()
      end
      if L2_373.near_in ~= nil then
        L2_373.near_in(L1_372)
      end
    end)
  end
end
function RAC_middle_sensor_OnLeave(A0_374)
  local L1_375, L2_376
  L1_375 = RAC_findCatWarpControl
  L2_376 = A0_374
  L1_375 = L1_375(L2_376)
  L2_376 = RAC_CAT_WARP_CONTROL
  L2_376 = L2_376[L1_375]
  if L2_376.stop == false then
    print("RAC_middle_sensor_OnLeave.." .. A0_374:getName())
    L2_376.middle_leave = true
    L2_376.middle_task = invokeTask(function()
      Fn_userCtrlAllOff()
      Player:setStay(true)
      if L2_376.lookat_node_hdl ~= nil then
        RAC_LookAtObject(L2_376.lookat_node_hdl, 0, 0.2)
      end
      if L2_376.middle_out ~= nil then
        L2_376.middle_out(L1_375)
      end
      L2_376.hud_task = RAC_missionNaviCaption(nil, L2_376.navi_node_hdl, L2_376.warning_txt)
      Player:setStay(false)
      Fn_userCtrlOn()
    end)
  end
end
function RAC_long_sensor_OnLeave(A0_377)
  local L1_378, L2_379
  L1_378 = RAC_findCatWarpControl
  L2_379 = A0_377
  L1_378 = L1_378(L2_379)
  L2_379 = RAC_CAT_WARP_CONTROL
  L2_379 = L2_379[L1_378]
  if L2_379.stop == false then
    print("RAC_long_sensor_OnLeave.." .. A0_377:getName())
    L2_379.long_task = invokeTask(function()
      if L2_379.navi_node_hdl ~= nil then
        Fn_naviKill()
      end
      Fn_userCtrlAllOff()
      Fn_catWarpIn()
      if L2_379.return_node_hdl ~= nil then
        Fn_setCatWarpCheckPoint(L2_379.return_node_hdl:getName())
      else
        Fn_setCatWarpCheckPoint(nil)
      end
      if L2_379.before_warp ~= nil then
        L2_379.before_warp(L1_378)
      end
      Fn_catWarpCheckPoint()
      wait()
      if L2_379.after_warp ~= nil then
        L2_379.after_warp(L1_378)
      end
      Fn_catWarpOut()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
    end)
  end
end
function RAC_createGemBase(A0_380, A1_381, A2_382, A3_383)
  local L4_384, L5_385
  L4_384 = Vector
  L5_385 = 0
  L4_384 = L4_384(L5_385, 0, 0)
  L5_385 = IdentQuat
  L5_385 = L5_385()
  if _findObjectHandle(A2_382) == nil then
    return nil
  end
  L4_384, L5_385 = _findObjectHandle(A2_382):getWorldTransform()
  if A3_383 ~= nil then
    L4_384.y = L4_384.y + A3_383
  end
  createGameObject2("Gem"):setName(A0_380)
  createGameObject2("Gem"):setGemModelNo(A1_381)
  createGameObject2("Gem"):setWorldTransform(L4_384, L5_385)
  createGameObject2("Gem"):setForceMove()
  createGameObject2("Gem"):setVisible(true)
  createGameObject2("Gem"):setVisibleBlockHalfSize(150)
  createGameObject2("Gem"):try_init()
  return (createGameObject2("Gem"))
end
function RAC_createGemAsync(A0_386, A1_387, A2_388, A3_389, A4_390)
  if RAC_createGemBase(A0_386, A1_387, A2_388) ~= nil then
    if A4_390 == nil then
      function A4_390(A0_391)
        A0_391:try_start()
      end
    end
    RAC_createGemBase(A0_386, A1_387, A2_388):waitForReadyAsync(A4_390)
  end
  return (RAC_createGemBase(A0_386, A1_387, A2_388))
end
function RAC_createGemWait(A0_392, A1_393, A2_394, A3_395)
  if RAC_createGemBase(A0_392, A1_393, A2_394, A3_395) ~= nil then
    RAC_createGemBase(A0_392, A1_393, A2_394, A3_395):waitForReady()
    RAC_createGemBase(A0_392, A1_393, A2_394, A3_395):try_start()
  end
  return (RAC_createGemBase(A0_392, A1_393, A2_394, A3_395))
end
rac_default_navi_pochi_0 = nil
rac_default_navi_pochi_100 = nil
function RAC_naviPochiNoneStart()
  if rac_default_navi_pochi_0 == nil then
    rac_default_navi_pochi_0 = HUD:naviGetPochiDistanceDensity0()
  end
  if rac_default_navi_pochi_100 == nil then
    rac_default_navi_pochi_100 = HUD:naviGetPochiDistanceDensity100()
  end
  HUD:naviSetPochiDistanceDensity0(0)
  HUD:naviSetPochiDistanceDensity100(-1)
end
function RAC_naviPochiNoneEnd()
  if rac_default_navi_pochi_0 ~= nil then
    HUD:naviSetPochiDistanceDensity0(rac_default_navi_pochi_0)
    rac_default_navi_pochi_0 = nil
  end
  if rac_default_navi_pochi_100 ~= nil then
    HUD:naviSetPochiDistanceDensity100(rac_default_navi_pochi_100)
    rac_default_navi_pochi_100 = nil
  end
end
function RAC_countDownVoice(A0_396)
  invokeTask(function()
    waitSeconds(1.2)
    Sound:playSE("m32_014")
  end)
  if A0_396 then
    Fn_countDownWithTimer(HUD.kCountDownStart_Action)
  else
    Fn_countDown(HUD.kCountDownStart_Action)
  end
end
function RAC_createMapMaker(A0_397, A1_398, A2_399, A3_400)
  local L4_401, L5_402, L6_403, L7_404
  L4_401 = _findObjectHandle
  L5_402 = A2_399
  L4_401 = L4_401(L5_402)
  L6_403 = L4_401
  L5_402 = L4_401.getWorldTransform
  L6_403 = L5_402(L6_403)
  L7_404 = nil
  if A3_400 ~= nil then
    L5_402.y = L5_402.y - A3_400.y * 0.5
    L7_404 = RAC_createGameObject2(A0_397, "MapMarker", L5_402, L6_403)
    L7_404:setAssetName(A1_398)
    L7_404:setupPattern("C", A3_400)
  else
    L5_402.y = L5_402.y - (L4_401:getLocalAabb().max.y - L4_401:getLocalAabb().min.y) * 0.5
    L7_404 = RAC_createGameObject2(A0_397, "MapMarker", L5_402, L6_403)
    L7_404:setAssetName(A1_398)
    L7_404:setupPattern("C", L4_401:getLocalAabb().max - L4_401:getLocalAabb().min)
  end
  L7_404:setActive(true)
  return L7_404
end
function RAC_gaugeInit(A0_405, A1_406, A2_407, A3_408)
  if A1_406 ~= nil then
    HUD:miniGaugeSetType(A1_406, A2_407)
  end
  HUD:miniGaugeSetVisible(true)
  HUD:miniGaugeSetTextID(A0_405)
  HUD:miniGaugeSetNum(A3_408 or 0, false)
end
function RAC_gaugeSetRate(A0_409)
  if A0_409 < 0 then
    A0_409 = 0
  end
  if A0_409 > 100 then
    A0_409 = 100
  end
  HUD:miniGaugeSetNum(A0_409 / 100)
end
function RAC_infoView(A0_410)
  HUD:info(A0_410, false)
  while HUD:menuIsActive() do
    wait()
  end
end
function RAC_setSightParam(A0_411, A1_412, A2_413)
  local L3_414, L4_415, L5_416
  L3_414 = Fn_findNpc
  L4_415 = A0_411
  L3_414 = L3_414(L4_415)
  L4_415 = true
  if A1_412 == "" then
    L4_415 = false
  end
  if A2_413 ~= nil then
    L5_416 = _findObjectHandle
    L5_416 = L5_416(A1_412)
    A2_413.target = L5_416
  end
  L5_416 = {}
  L5_416.degree_h = A2_413 and A2_413.degree_h or 90
  L5_416.degree_v = A2_413 and A2_413.degree_v or 45
  L5_416.in_length = A2_413 and A2_413.in_length or 100
  L5_416.out_length = A2_413 and A2_413.out_length or 100
  L5_416.valid = A2_413 and A2_413.valid or L4_415
  L5_416.target = A2_413 and A2_413.target or nil
  L5_416.targetJoint = A2_413 and A2_413.targetJoint or ""
  L5_416.targetOffset = A2_413 and A2_413.targetOffset or 0
  L5_416.watchTarget = A2_413 and A2_413.watchTarget or false
  L5_416.forceTarget = A2_413 and A2_413.forceTarget or false
  if L3_414 == nil then
    print("=============================")
    print("Fn_findNpc\227\129\139\227\130\137Npc\229\143\150\229\190\151\227\129\167\227\129\141\227\129\170\227\129\139\227\129\163\227\129\159\239\188\129")
    print("=============================")
    return
  end
  L3_414:setSightParam(L5_416)
end
function RAC_setBulletShockwave(A0_417, A1_418, A2_419, A3_420, A4_421, A5_422, A6_423, A7_424)
  if A4_421 == nil then
    A4_421 = "blow"
  end
  if A5_422 == nil then
    A5_422 = 5
  end
  if A6_423 == nil then
    A6_423 = 1
  end
  if A7_424 == nil then
    A7_424 = -1
  end
  createGameObject2("BulletShockwave"):setParam({
    pos = A0_417,
    radius = A2_419,
    type = A4_421,
    damage = A1_418,
    force = A5_422,
    time = A6_423,
    interval = A7_424
  })
  createGameObject2("BulletShockwave"):attack()
  if A3_420 ~= nil then
    Sound:pulse(A3_420)
  end
end
function RAC_isReadyEnemy(A0_425)
  if _findObjectHandle(A0_425) ~= nil then
    for _FORV_5_, _FORV_6_ in ipairs(_findObjectHandle(A0_425):getSpecTable().spawnSet) do
      if findGameObject2("Puppet", _FORV_6_.name) == nil or not findGameObject2("Puppet", _FORV_6_.name):getBrain():isReadyEnemy() then
        return false
      end
    end
    return true
  end
  return false
end
function RAC_playerTurnWait(A0_426, A1_427, A2_428)
  local L3_429, L4_430, L5_431
  L3_429 = _findObjectHandle
  L4_430 = A0_426
  L3_429 = L3_429(L4_430)
  if L3_429 ~= nil then
    L4_430 = 1
    if A2_428 ~= nil then
      L4_430 = A2_428
    end
    L5_431 = L3_429.getWorldPos
    L5_431 = L5_431(L3_429)
    if A1_427 ~= nil then
      L5_431.y = L5_431.y + A1_427
    end
    Player:setLookAtIk(true, L4_430, L5_431)
    waitSeconds(L4_430)
    Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  end
end
function RAC_setCostumeWait(A0_432, A1_433)
  Fn_setCostume(A0_432)
  while Player:getCostumeChangePhase() == Player.kCostuemChange_Changing or Player:getPuppet():isLoading() do
    wait()
  end
  if A1_433 ~= nil then
    Fn_resetPcPos(_findObjectHandle(A1_433))
  end
  Fn_playPlayerMotion("stay", -1)
  wait()
end
function RAC_getSightTarget(A0_434)
  local L1_435
  L1_435 = _findObjectHandle
  L1_435 = L1_435(A0_434)
  if Query:calcInSightRatioGameObject(L1_435) == nil then
    return nil
  end
  if Query:calcInSightRatioGameObject(L1_435).left > -1 and Query:calcInSightRatioGameObject(L1_435).right < 1 and -1 < Query:calcInSightRatioGameObject(L1_435).top and 1 > Query:calcInSightRatioGameObject(L1_435).bottom then
    if math.abs((Query:calcInSightRatioGameObject(L1_435).left + Query:calcInSightRatioGameObject(L1_435).right) * 0.5) < math.abs((Query:calcInSightRatioGameObject(L1_435).top + Query:calcInSightRatioGameObject(L1_435).bottom) * 0.5) then
      return (math.abs((Query:calcInSightRatioGameObject(L1_435).left + Query:calcInSightRatioGameObject(L1_435).right) * 0.5))
    else
      return (math.abs((Query:calcInSightRatioGameObject(L1_435).top + Query:calcInSightRatioGameObject(L1_435).bottom) * 0.5))
    end
  end
  return nil
end
function RAC_invokeMobRepopTask(A0_436, A1_437)
  local L2_438, L3_439
  L2_438 = createGameObject2
  L3_439 = "Node"
  L2_438 = L2_438(L3_439)
  L3_439 = L2_438.setName
  L3_439(L2_438, "mob_repop_pos_node")
  L3_439 = L2_438.setWorldPos
  L3_439(L2_438, Fn_getPlayerWorldPos())
  L3_439 = {}
  L3_439.repop_pos_node = L2_438
  L3_439.main_task = invokeTask(function()
    local L0_440
    L0_440 = L3_439
    L0_440.repop_pos_node:try_init()
    L0_440.repop_pos_node:waitForReady()
    L0_440.repop_pos_node:try_start()
    while true do
      if A1_437 <= Fn_getDistanceToPlayer(L0_440.repop_pos_node) then
        Mob:topUpHatchery()
        L2_438:setWorldPos(Fn_getPlayerWorldPos())
      end
      waitSeconds(A0_436)
    end
  end)
  function L3_439.isRunning(A0_441)
    return L3_439.main_task:isRunning()
  end
  function L3_439.abort(A0_442)
    if A0_442.main_task ~= nil then
      A0_442.main_task:abort()
      A0_442.main_task = nil
    end
    if A0_442.repop_pos_node ~= nil then
      A0_442.repop_pos_node:try_term()
      A0_442.repop_pos_node = nil
    end
  end
  return L3_439
end
function RAC_stopNpcMoveTask(A0_443, A1_444)
  if Fn_findNpc(A0_443) ~= nil then
    if A1_444 ~= nil then
      A1_444:abort()
      A1_444 = nil
    end
    Fn_killNpcTask(A0_443)
    Fn_findNpc(A0_443):reset()
  end
end
function RAC_setShopNpc(A0_445, A1_446, A2_447, A3_448, A4_449, A5_450)
  local L6_451
  if A3_448 == nil then
    A3_448 = true
  end
  if A4_449 == nil then
    A4_449 = false
  end
  if A5_450 == nil then
    A5_450 = 0.3
  end
  L6_451 = {}
  L6_451.npc_tbl = {}
  function L6_451.update(A0_452)
    local L1_453, L2_454, L3_455, L4_456, L5_457, L6_458, L7_459, L8_460
    L1_453 = {
      L2_454,
      L3_455,
      L4_456,
      L5_457,
      L6_458,
      L7_459,
      L8_460,
      "man17",
      "man18",
      "man25",
      "man26",
      "wom31",
      "wom41",
      "wom42",
      "wom46",
      "wom01",
      "wom03",
      "wom04",
      "wom05"
    }
    L2_454 = "man64"
    L3_455 = "man81"
    L4_456 = "man82"
    L8_460 = "man07"
    L2_454 = A2_447
    if L2_454 == "ED" then
      L2_454 = {
        L3_455,
        L4_456,
        L5_457,
        L6_458,
        L7_459,
        L8_460,
        "man18",
        "man25",
        "man26",
        "wom31",
        "wom41",
        "wom46",
        "wom47",
        "wom01",
        "wom03",
        "wom04",
        "wom05"
      }
      L3_455 = "man64"
      L4_456 = "man81"
      L8_460 = "man17"
      L1_453 = L2_454
    else
      L2_454 = A2_447
      if L2_454 == "CC" then
        L2_454 = {
          L3_455,
          L4_456,
          L5_457,
          L6_458,
          L7_459,
          L8_460,
          "man02",
          "man07",
          "man17",
          "man18",
          "man25",
          "man26",
          "wom41",
          "wom42",
          "wom46",
          "wom01",
          "wom03",
          "wom04",
          "wom05"
        }
        L3_455 = "man64"
        L4_456 = "man77"
        L8_460 = "man01"
        L1_453 = L2_454
      end
    end
    L2_454 = RandI
    L3_455 = 1
    L4_456 = #L1_453
    L2_454 = L2_454(L3_455, L4_456)
    L2_454 = L1_453[L2_454]
    L3_455 = {L4_456}
    L4_456 = {}
    L4_456.name = L5_457
    L4_456.type = L2_454
    L4_456.node = L5_457
    L4_456.attach = false
    L4_456.active = L5_457
    L4_456.start = L5_457
    L4_456 = {L5_457, L6_458}
    L5_457._mot01 = "man01_vendor_attract_00"
    L5_457._mot02 = "man01_watching_soft_00"
    L5_457._mot03 = "man01_talk_laugh_02"
    L5_457._mot04 = "man01_talk_laugh_01"
    L5_457._mot05 = "man01_talk_laugh_00"
    L5_457._mot06 = "man01_talk_04"
    L5_457._mot07 = "man01_stretch_00"
    L5_457._mot08 = "man01_stay_line_00"
    L5_457._mot09 = "man01_lookaround_03"
    L6_458._mot01 = "wom01_call_00"
    L6_458._mot02 = "wom01_stay_line_00"
    L6_458._mot03 = "wom01_talk_laugh_00"
    L6_458._mot04 = "wom01_vendor_attract_00"
    L5_457(L6_458)
    for L8_460, _FORV_9_ in L5_457(L6_458) do
      A0_452.npc_tbl[_FORV_9_.name] = Fn_findNpcPuppet(_FORV_9_.name)
      while not A0_452.npc_tbl[_FORV_9_.name]:isStarted() do
        wait()
      end
    end
    L8_460 = false
    L5_457(L6_458, L7_459, L8_460)
    L8_460 = "man"
    L8_460 = "wom"
    L8_460 = L4_456[L5_457]
    L6_458(L7_459, L8_460)
    while true do
      L8_460 = RAC_GetTableLength
      L8_460 = L8_460(L4_456[L5_457])
      L8_460 = string
      L8_460 = L8_460.format
      L8_460 = L8_460("%02d", L6_458)
      L8_460 = RandF
      L8_460 = L8_460(1, 3)
      Fn_playMotionNpc(A0_445, L4_456[L5_457][L7_459], true, {animBlendDuration = A5_450})
      Fn_playMotionNpc(A0_445, "stay", false, {animBlendDuration = A5_450})
      if L8_460 > 0 then
        waitSeconds(L8_460)
      end
      wait()
    end
  end
  function L6_451.destractor(A0_461)
    A0_461:finalize()
  end
  function L6_451.finalize(A0_462)
    for _FORV_4_, _FORV_5_ in pairs(A0_462.npc_tbl) do
      if Fn_findNpc(_FORV_5_.name) ~= nil then
        if not Fn_findNpc(_FORV_5_.name):isStarted() then
          while not Fn_findNpc(_FORV_5_.name):isStarted() do
            wait()
          end
          Fn_disappearNpc(_FORV_5_.name)
        else
          Fn_disappearNpc(_FORV_5_.name)
        end
      end
    end
  end
  RAC_InvokeTaskWithDestractor(L6_451.update, L6_451.destractor, L6_451).npc_task = L6_451
  return (RAC_InvokeTaskWithDestractor(L6_451.update, L6_451.destractor, L6_451))
end
_shop_npc_task = {}
function RAC_side_setupShopNpc(A0_463, A1_464, A2_465)
  local L3_466, L4_467, L5_468
  if A0_463 == nil then
    A0_463 = "sm_shopnpc_"
  end
  if A1_464 == nil then
    A1_464 = "locator2_shop_npc_"
  end
  L3_466 = 1
  while true do
    L4_467 = A0_463
    L5_468 = string
    L5_468 = L5_468.format
    L5_468 = L5_468("%02d", L3_466)
    L4_467 = L4_467 .. L5_468
    L5_468 = A1_464
    L5_468 = L5_468 .. string.format("%02d", L3_466)
    if findGameObject2("Node", L5_468) ~= nil then
      _shop_npc_task[L4_467] = RAC_setShopNpc(L4_467, L5_468, A2_465)
      L3_466 = L3_466 + 1
    end
  end
end
function RAC_side_endShopNpcTask()
  local L0_469, L1_470, L2_471, L3_472
  for L3_472, _FORV_4_ in L0_469(L1_470) do
    if _FORV_4_ ~= nil then
      _shop_npc_task[L3_472]:abort()
      _shop_npc_task[L3_472] = nil
      Fn_disappearNpc(L3_472)
    end
  end
end
function RAC_showSPNpc(A0_473)
  return invokeTask(function()
    local L0_474
    L0_474 = Fn_findNpcPuppet
    L0_474 = L0_474(A0_473)
    if L0_474 == nil then
      return
    end
    Sound:playSE("dm03_people_repair", 1, "", L0_474)
    Fn_createEffect("ef_ev_dis_02", "ef_ev_dis_02", L0_474:getWorldPos() + Vector(0, 0.5, 0), false)
    Fn_setNpcActive(A0_473, true)
    Fn_setNpcAlpha(A0_473, true)
  end)
end
function RAC_showSPNpcWait(A0_475)
  while RAC_showSPNpc(A0_475) ~= nil and RAC_showSPNpc(A0_475):isRunning() do
    wait()
  end
  if RAC_showSPNpc(A0_475) ~= nil then
    RAC_showSPNpc(A0_475):abort()
  end
end
function RAC_disappearSPNpc(A0_476)
  return invokeTask(function()
    local L0_477
    L0_477 = Fn_findNpcPuppet
    L0_477 = L0_477(A0_476)
    if L0_477 == nil then
      return
    end
    Sound:playSE("dm03_people_lost", 1, "", L0_477)
    Fn_createEffect("ef_ev_dis_02", "ef_ev_dis_02", L0_477:getWorldPos() + Vector(0, 0.75, 0), false)
    Fn_setNpcAlpha(A0_476, false)
    Fn_setNpcActive(A0_476, false)
  end)
end
function RAC_disappearSPNpcWait(A0_478)
  while RAC_disappearSPNpc(A0_478) ~= nil and RAC_disappearSPNpc(A0_478):isRunning() do
    wait()
  end
  if RAC_disappearSPNpc(A0_478) ~= nil then
    RAC_disappearSPNpc(A0_478):abort()
  end
end
function RAC_createMemoryEffect(A0_479)
  local L1_480
  L1_480 = {}
  L1_480.pos_node = _findObjectHandle(A0_479)
  L1_480.eff_tbl = {}
  L1_480.eff_tbl[1] = RAC_createEffect({
    eff_name = "ef_ev_kkr_01",
    parent_hdl = A0_479,
    loop = true,
    stop = true
  })
  L1_480.eff_tbl[2] = RAC_createEffect({
    eff_name = "ef_ev_kkr_02",
    parent_hdl = A0_479,
    loop = false,
    stop = true
  })
  L1_480.alpha_task = {}
  function L1_480.update(A0_481)
    while true do
      wait()
    end
  end
  function L1_480.destractor(A0_482)
    for _FORV_4_, _FORV_5_ in ipairs(A0_482.alpha_task) do
      if A0_482.alpha_task[_FORV_4_] then
        A0_482.alpha_task[_FORV_4_]:abort()
      end
    end
    for _FORV_4_, _FORV_5_ in ipairs(A0_482.eff_tbl) do
      if A0_482.eff_tbl[_FORV_4_] then
        A0_482.eff_tb[_FORV_4_]:abort()
      end
    end
  end
  RAC_InvokeTaskWithDestractor(L1_480.update, L1_480.destractor, L1_480).task_obj = L1_480
  RAC_InvokeTaskWithDestractor(L1_480.update, L1_480.destractor, L1_480).requestActive = function(A0_483)
    A0_483.task_obj.eff_tbl[1]:playEffect()
  end
  RAC_InvokeTaskWithDestractor(L1_480.update, L1_480.destractor, L1_480).requestGet = function(A0_484)
    local L1_485, L2_486, L3_487, L4_488
    L1_485(L2_486)
    for L4_488, _FORV_5_ in L1_485(L2_486) do
      A0_484.task_obj.alpha_task[L4_488] = invokeTask(function()
        A0_484.task_obj.eff_tbl[L4_488]:setAlpha(false, 1)
        A0_484.task_obj.eff_tbl[L4_488]:abort()
      end)
      break
    end
  end
  return (RAC_InvokeTaskWithDestractor(L1_480.update, L1_480.destractor, L1_480))
end
function RAC_spawnVehicle(A0_489, A1_490, A2_491, A3_492)
  local L4_493, L5_494, L6_495, L7_496, L8_497, L9_498, L10_499, L11_500
  L4_493 = {}
  L5_494 = Vehicle
  L6_495 = L5_494
  L5_494 = L5_494.spawnVehicle
  L5_494 = L5_494(L6_495, L7_496, L8_497)
  L4_493.vehicle_hdl = L5_494
  L5_494 = L4_493.vehicle_hdl
  L6_495 = L5_494
  L5_494 = L5_494.setName
  L5_494(L6_495, L7_496)
  L5_494 = {}
  L6_495 = {}
  if L7_496 == "string" then
    L11_500 = L7_496
    L10_499 = L7_496.getWorldPos
    L11_500 = L10_499(L11_500)
    L8_497(L9_498, L10_499, L11_500, L10_499(L11_500))
    L11_500 = L7_496
    L10_499 = L7_496.getWorldRot
    L11_500 = L10_499(L11_500)
    L8_497(L9_498, L10_499, L11_500, L10_499(L11_500))
  else
    for L10_499, L11_500 in L7_496(L8_497) do
      table.insert(L5_494, _findObjectHandle(L11_500):getWorldPos())
      table.insert(L6_495, _findObjectHandle(L11_500):getWorldRot())
    end
  end
  L10_499 = L6_495[1]
  L7_496(L8_497, L9_498, L10_499)
  if A3_492 == nil then
    A3_492 = 0
  end
  L7_496(L8_497, L9_498)
  L7_496(L8_497, L9_498)
  L7_496(L8_497, L9_498)
  L7_496(L8_497, L9_498)
  if L7_496 == 1 then
    L10_499 = L6_495[1]
    L11_500 = L10_499
    L10_499 = L10_499.Apply
    L10_499 = L10_499(L11_500, Vector(0, 0, 1))
    L7_496(L8_497, L9_498)
  end
  L10_499 = g_own
  L4_493.route_hdl = L7_496
  L7_496(L8_497, L9_498)
  L4_493.getVehicle = L7_496
  L4_493.getRemainingDist = L7_496
  L4_493.setBaseSpeed = L7_496
  L4_493.setCurrSpeed = L7_496
  return L4_493
end
function RAC_deleteVehicle(A0_501)
  if A0_501.route_hdl ~= nil then
    A0_501.route_hdl:try_term()
    A0_501.route_hdl = nil
  end
  if A0_501.vehicle_hdl ~= nil then
    A0_501.vehicle_hdl:try_term()
    A0_501.vehicle_hdl = nil
  end
end
function RAC_moveVehicle(A0_502, A1_503, A2_504, A3_505)
  local L4_506, L5_507, L6_508, L7_509, L8_510, L9_511, L10_512
  L4_506 = {}
  L5_507 = {}
  if L6_508 == "string" then
    L10_512 = L6_508
    L9_511 = L6_508.getWorldPos
    L10_512 = L9_511(L10_512)
    L7_509(L8_510, L9_511, L10_512, L9_511(L10_512))
    L10_512 = L6_508
    L9_511 = L6_508.getWorldRot
    L10_512 = L9_511(L10_512)
    L7_509(L8_510, L9_511, L10_512, L9_511(L10_512))
  else
    for L9_511, L10_512 in L6_508(L7_509) do
      table.insert(L4_506, _findObjectHandle(L10_512):getWorldPos())
      table.insert(L5_507, _findObjectHandle(L10_512):getWorldRot())
    end
  end
  if A2_504 ~= nil then
    L6_508(L7_509, L8_510)
  end
  if A3_505 ~= nil then
    L6_508(L7_509, L8_510)
  end
  if L6_508 == 1 then
    L9_511 = L5_507[1]
    L10_512 = L9_511
    L9_511 = L9_511.Apply
    L9_511 = L9_511(L10_512, Vector(0, 0, 1))
    L6_508(L7_509, L8_510)
    L6_508(L7_509, L8_510)
    L6_508(L7_509, L8_510)
  end
  if L6_508 ~= nil then
    L6_508(L7_509)
    A0_502.route_hdl = nil
  end
  L9_511 = g_own
  A0_502.route_hdl = L6_508
  L6_508(L7_509, L8_510)
end
function RAC_moveVehicleWait(A0_513, A1_514, A2_515, A3_516)
  RAC_moveVehicle(A0_513, A1_514, A2_515, A3_516)
  while 0 <= A0_513:getRemainingDist() do
    wait()
  end
end
