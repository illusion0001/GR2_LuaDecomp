import("PhotoMgr")
SDemo = {}
kSDEMO_APPEND_ALL = 1
kSDEMO_APPEND_CAM = 2
kSDEMO_APPEND_AIM = 3
kSDEMO_CAMERA = 0
kSDEMO_CAM_POS = 1
kSDEMO_AIM_POS = 2
function SDemo.create(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5
  L2_2 = createGameObject2
  L3_3 = "CameraNode"
  L2_2 = L2_2(L3_3)
  L4_4 = L2_2
  L3_3 = L2_2.setName
  L5_5 = A0_0
  L5_5 = L5_5 .. "_camera"
  L3_3(L4_4, L5_5)
  if A1_1 == true then
    L4_4 = L2_2
    L3_3 = L2_2.switchCamera
    L5_5 = true
    L3_3(L4_4, L5_5)
  else
    L4_4 = L2_2
    L3_3 = L2_2.switchCamera
    L5_5 = false
    L3_3(L4_4, L5_5)
  end
  L4_4 = L2_2
  L3_3 = L2_2.setIsolateFlags
  L5_5 = false
  L3_3(L4_4, L5_5, true, false)
  L4_4 = L2_2
  L3_3 = L2_2.setStabilityRange
  L5_5 = 0
  L3_3(L4_4, L5_5, 0)
  L3_3 = createGameObject2
  L4_4 = "GimmickBg"
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.setName
  L4_4(L5_5, A0_0 .. "_cam_pos")
  L5_5 = L3_3
  L4_4 = L3_3.appendChild
  L4_4(L5_5, L2_2)
  L4_4 = createGameObject2
  L5_5 = "GimmickBg"
  L4_4 = L4_4(L5_5)
  L5_5 = L4_4.setName
  L5_5(L4_4, A0_0 .. "_aim_pos")
  L5_5 = {}
  L5_5.name = A0_0
  L5_5.camera = L2_2
  L5_5.cam_pos = L3_3
  L5_5.aim_pos = L4_4
  L5_5.camera_shaketask_hdl = nil
  L5_5.anim = false
  L5_5.point = false
  L5_5.is_play = false
  L5_5.far_clip = L2_2:getFarClip()
  L5_5.near_clip = L2_2:getNearClip()
  L5_5.fov = L2_2:getFov()
  SDemo._installMethods(L5_5)
  return L5_5
end
function SDemo.set(A0_6, A1_7, A2_8, A3_9, A4_10, A5_11)
  local L6_12, L7_13, L8_14, L9_15, L10_16, L11_17
  L6_12 = SDemo
  L6_12 = L6_12._isValid
  L7_13 = A0_6
  L6_12 = L6_12(L7_13)
  if not L6_12 then
    L6_12 = false
    return L6_12
  end
  L6_12, L7_13, L8_14, L9_15 = nil, nil, nil, nil
  L10_16 = type
  L11_17 = A1_7
  L10_16 = L10_16(L11_17)
  if L10_16 == "table" then
    L10_16 = A1_7.x
    if not L10_16 then
      L6_12 = A1_7.target
      L8_14 = A1_7.joint
    end
  else
    L6_12 = A1_7
  end
  L10_16 = type
  L11_17 = A2_8
  L10_16 = L10_16(L11_17)
  if L10_16 == "table" then
    L10_16 = A2_8.x
    if not L10_16 then
      L7_13 = A2_8.target
      L9_15 = A2_8.joint
    end
  else
    L7_13 = A2_8
  end
  L11_17 = A0_6
  L10_16 = A0_6._findNode
  L10_16 = L10_16(L11_17, L6_12)
  L11_17 = A0_6._findNode
  L11_17 = L11_17(A0_6, L7_13)
  if A3_9 == true or A3_9 == kSDEMO_APPEND_ALL then
    A0_6:_append(L10_16, A0_6.cam_pos, L8_14)
    A0_6:_append(L11_17, A0_6.aim_pos, L9_15)
  else
    if A3_9 == kSDEMO_APPEND_CAM then
      A0_6:_append(L10_16, A0_6.cam_pos, L8_14)
    else
      A0_6:_warp(L10_16, A0_6.cam_pos)
    end
    if A3_9 == kSDEMO_APPEND_AIM then
      A0_6:_append(L11_17, A0_6.aim_pos, L9_15)
    else
      A0_6:_warp(L11_17, A0_6.aim_pos)
    end
  end
  A0_6.camera:setAimTarget(A0_6.aim_pos, A4_10)
  if A5_11 and A5_11.x and A5_11.y then
    A0_6.camera:setStabilityRange(A5_11.x, A5_11.y)
  end
  wait()
end
function SDemo.setCameraParam(A0_18, A1_19, A2_20, A3_21)
  if not SDemo._isValid(A0_18) then
    return nil
  end
  if A1_19 then
    A0_18.camera:setFarClip(A1_19)
  end
  if A2_20 then
    A0_18.camera:setNearClip(A2_20)
  end
  if A3_21 then
    if A3_21.rad then
      A0_18.camera:setFov(A3_21.rad)
    end
    if A3_21.deg then
      A0_18.camera:setFov(Deg2Rad(A3_21.deg))
    end
  end
end
function SDemo.offset(A0_22, A1_23, A2_24)
  if not SDemo._isValid(A0_22) then
    return nil
  end
  if A1_23 then
    A0_22.cam_pos:setPos(A1_23)
    A0_22.cam_pos:setForceMove()
    A0_22.cam_pos:resetFloater()
  end
  if A2_24 then
    A0_22.aim_pos:setPos(A2_24)
    A0_22.aim_pos:setForceMove()
  end
end
function SDemo.get(A0_25, A1_26)
  if not SDemo._isValid(A0_25) then
    return nil
  end
  if A1_26 == kSDEMO_CAMERA then
    return A0_25.camera
  elseif A1_26 == kSDEMO_CAM_POS then
    return A0_25.cam_pos
  elseif A1_26 == kSDEMO_AIM_POS then
    return A0_25.aim_pos
  end
  return nil
end
function SDemo.load(A0_27, A1_28, A2_29)
  if not SDemo._isValid(A0_27) then
    return false
  end
  A0_27.anim = false
  if A0_27.camera:loadMotionFileAsset(A1_28) then
    if A2_29 then
      A2_29:appendChild(A0_27.camera)
    end
    wait()
    A0_27.camera:waitForLoading()
    A0_27.anim = true
    if A0_27.cam_pos:getParent() then
      A0_27.cam_pos:leaveFromParent()
    end
    if A0_27.aim_pos:getParent() then
      A0_27.aim_pos:leaveFromParent()
    end
  else
    print("\232\170\173\227\129\191\232\190\188\227\129\191\229\164\177\230\149\151")
  end
end
function SDemo.play(A0_30, A1_31, A2_32, A3_33)
  local L4_34, L5_35
  L4_34 = SDemo
  L4_34 = L4_34._isValid
  L5_35 = A0_30
  L4_34 = L4_34(L5_35)
  if not L4_34 then
    L4_34 = false
    return L4_34
  end
  if A3_33 ~= false then
    L4_34 = Player
    L5_35 = L4_34
    L4_34 = L4_34.dropGrabObject
    L4_34(L5_35, -1)
  end
  L4_34 = Bullet
  L5_35 = L4_34
  L4_34 = L4_34.reset
  L4_34(L5_35, Bullet.ID.Shockwave, Bullet.Owner.Player)
  L4_34 = PhotoMgr
  L5_35 = L4_34
  L4_34 = L4_34.DeleteAllItem
  L4_34(L5_35)
  L4_34 = HUD
  L5_35 = L4_34
  L4_34 = L4_34.sightMarkerSetDisable
  L4_34(L5_35, true)
  L4_34 = HUD
  L5_35 = L4_34
  L4_34 = L4_34.navisSetMaskFromDemo
  L4_34(L5_35, true)
  L4_34 = g_own
  L5_35 = L4_34
  L4_34 = L4_34.getGameObject
  L4_34 = L4_34(L5_35, "soundManager")
  if L4_34 then
    L5_35 = event_name
    if not L5_35 then
      L5_35 = g_own
      L5_35 = L5_35.getName
      L5_35 = L5_35(L5_35)
    end
    L4_34:sendEvent("request", L5_35, "sdemo", "sdemo", A0_30.is_play)
  end
  L5_35 = A0_30.anim
  if L5_35 then
    L5_35 = A0_30.camera
    L5_35 = L5_35.playAnim
    L5_35(L5_35, 0)
  end
  L5_35 = A0_30.camera
  L5_35 = L5_35.switchCamera
  L5_35(L5_35, true, 0)
  L5_35 = A0_30.anim
  if L5_35 == false then
    A0_30.point = true
    L5_35 = A0_30._play
    L5_35(A0_30, A1_31, A0_30.cam_pos)
    L5_35 = A0_30._play
    L5_35(A0_30, A2_32, A0_30.aim_pos, true)
  end
  A0_30.is_play = true
end
function SDemo.isPlay(A0_36)
  local L1_37, L2_38
  L1_37 = SDemo
  L1_37 = L1_37._isValid
  L2_38 = A0_36
  L1_37 = L1_37(L2_38)
  if not L1_37 then
    L1_37 = false
    return L1_37
  end
  L1_37 = A0_36.point
  if L1_37 then
    L1_37 = A0_36.cam_pos
    L2_38 = L1_37
    L1_37 = L1_37.isCurveMoving
    L1_37 = L1_37(L2_38)
    L2_38 = A0_36.aim_pos
    L2_38 = L2_38.isCurveMoving
    L2_38 = L2_38(L2_38)
    if L1_37 == false and L2_38 == false then
      A0_36.point = false
    end
    return L1_37 or L2_38
  end
  L1_37 = A0_36.anim
  if L1_37 then
    L1_37 = A0_36.camera
    L2_38 = L1_37
    L1_37 = L1_37.isAnimEnd
    L1_37 = L1_37(L2_38)
    L1_37 = not L1_37
    return L1_37
  end
  L1_37 = A0_36.is_play
  return L1_37
end
function SDemo.zoomIn(A0_39, A1_40, A2_41, A3_42)
  local L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50
  L4_43 = SDemo
  L4_43 = L4_43._isValid
  L5_44 = A0_39
  L4_43 = L4_43(L5_44)
  if not L4_43 then
    L4_43 = nil
    return L4_43
  end
  if A2_41 then
    L4_43 = Rad2Deg
    L5_44 = A0_39.camera
    L6_45 = L5_44
    L5_44 = L5_44.getFov
    L11_50 = L5_44(L6_45)
    L4_43 = L4_43(L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L5_44(L6_45))
    L5_44 = nil
    L6_45 = A2_41.rad
    if L6_45 then
      L6_45 = Rad2Deg
      L7_46 = A2_41.rad
      L6_45 = L6_45(L7_46)
      L5_44 = L6_45
    end
    L6_45 = A2_41.deg
    if L6_45 then
      L5_44 = A2_41.deg
    end
    if L5_44 ~= nil and L4_43 > L5_44 then
      L6_45 = A1_40 * 30
      L7_46 = nil
      for L11_50 = 1, L6_45 do
        if A3_42 == "easeOut" then
          L7_46 = L4_43 - A0_39:_easeOut(L11_50, L4_43 - L5_44, L6_45)
        elseif A3_42 == "easeIn" then
          L7_46 = L4_43 - A0_39:_easeIn(L11_50, L4_43 - L5_44, L6_45)
        elseif A3_42 == "Linear" then
          L7_46 = L4_43 - A0_39:_linear(L11_50, L4_43 - L5_44, L6_45)
        else
          L7_46 = L4_43 - A0_39:_easeInOut(L11_50, L4_43 - L5_44, L6_45)
        end
        if L7_46 ~= nil then
          A0_39.camera:setFov(Deg2Rad(L7_46))
        end
        wait()
      end
    end
  end
end
function SDemo.zoomOut(A0_51, A1_52, A2_53, A3_54)
  local L4_55, L5_56, L6_57, L7_58, L8_59, L9_60, L10_61, L11_62
  L4_55 = SDemo
  L4_55 = L4_55._isValid
  L5_56 = A0_51
  L4_55 = L4_55(L5_56)
  if not L4_55 then
    L4_55 = nil
    return L4_55
  end
  if A2_53 then
    L4_55 = Rad2Deg
    L5_56 = A0_51.camera
    L6_57 = L5_56
    L5_56 = L5_56.getFov
    L11_62 = L5_56(L6_57)
    L4_55 = L4_55(L5_56, L6_57, L7_58, L8_59, L9_60, L10_61, L11_62, L5_56(L6_57))
    L5_56 = nil
    L6_57 = A2_53.rad
    if L6_57 then
      L6_57 = Rad2Deg
      L7_58 = A2_53.rad
      L6_57 = L6_57(L7_58)
      L5_56 = L6_57
    end
    L6_57 = A2_53.deg
    if L6_57 then
      L5_56 = A2_53.deg
    end
    if L5_56 ~= nil and L4_55 < L5_56 then
      L6_57 = A1_52 * 30
      L7_58 = nil
      for L11_62 = 1, L6_57 do
        if A3_54 == "easeOut" then
          L7_58 = L4_55 + A0_51:_easeOut(L11_62, L5_56 - L4_55, L6_57)
        elseif A3_54 == "easeIn" then
          L7_58 = L4_55 + A0_51:_easeIn(L11_62, L5_56 - L4_55, L6_57)
        elseif A3_54 == "Linear" then
          L7_58 = L4_55 + A0_51:_linear(L11_62, L5_56 - L4_55, L6_57)
        else
          L7_58 = L4_55 + A0_51:_easeInOut(L11_62, L5_56 - L4_55, L6_57)
        end
        if L7_58 ~= nil then
          A0_51.camera:setFov(Deg2Rad(L7_58))
        end
        wait()
      end
    end
  end
end
function SDemo.stop(A0_63, A1_64)
  if not SDemo._isValid(A0_63) then
    return false
  end
  A0_63.camera:switchCamera(false, A1_64 or 1)
  if A0_63.anim then
    A0_63.camera:stopAnim()
    A0_63.camera:resetAnim()
  end
  HUD:navisSetMaskFromDemo(false)
  HUD:sightMarkerSetDisable(false)
  A0_63.cam_pos:setFloaterFadeout(0)
  A0_63.is_play = false
end
function SDemo.reset(A0_65)
  if not SDemo._isValid(A0_65) then
    return false
  end
  A0_65.cam_pos:setFloaterFadeout(0)
  if A0_65.anim then
    A0_65.camera:stopAnim()
    A0_65.camera:resetAnim()
    A0_65.camera:leaveFromParent()
    A0_65.anim = false
  end
  if A0_65.cam_pos:getParent() ~= nil then
    A0_65.cam_pos:leaveFromParent()
  end
  if A0_65.aim_pos:getParent() ~= nil then
    A0_65.aim_pos:leaveFromParent()
  end
  A0_65.cam_pos:appendChild(A0_65.camera)
  A0_65.cam_pos:clearCurve()
  A0_65.aim_pos:clearCurve()
  A0_65.cam_pos:setPos(Vector(0, 0, 0))
  A0_65.aim_pos:setPos(Vector(0, 0, 0))
  A0_65.cam_pos:setForceMove()
  A0_65.aim_pos:setForceMove()
  A0_65.cam_pos:resetFloater()
  A0_65.camera:setFarClip(A0_65.far_clip)
  A0_65.camera:setNearClip(A0_65.near_clip)
  A0_65.camera:setFov(A0_65.fov)
  A0_65.is_play = false
end
function SDemo.switchCamera(A0_66, A1_67, A2_68)
  if not SDemo._isValid(A0_66) then
    return false
  end
  A0_66.camera:switchCamera(A1_67, A2_68 or 0)
  A0_66:camera_shake()
end
function SDemo.terminate(A0_69)
  A0_69:reset()
  if A0_69.camera then
    A0_69.camera:try_term()
    A0_69.camera = nil
  end
  if A0_69.cam_pos then
    A0_69.cam_pos:try_term()
    A0_69.cam_pos = nil
  end
  if A0_69.aim_pos then
    A0_69.aim_pos:try_term()
    A0_69.aim_pos = nil
  end
end
function SDemo._isValid(A0_70)
  local L1_71
  if A0_70 == nil then
    L1_71 = false
    return L1_71
  end
  L1_71 = true
  return L1_71
end
function SDemo._installMethods(A0_72)
  local L1_73, L2_74, L3_75, L4_76, L5_77
  for L4_76, L5_77 in L1_73(L2_74) do
    if type(L5_77) == "function" then
      A0_72[L4_76] = L5_77
    end
  end
end
function SDemo._findNode(A0_78, A1_79)
  local L2_80
  L2_80 = A1_79
  if type(L2_80) == "string" then
    L2_80 = findGameObject2("Node", L2_80)
  end
  return L2_80
end
function SDemo._append(A0_81, A1_82, A2_83, A3_84)
  if A1_82 then
    if A2_83:getParent() then
      A2_83:leaveFromParent(true)
    end
    A2_83:clearCurve()
    A2_83:setPos(Vector(0, 0, 0))
    if A1_82.x then
      A2_83:setWorldPos(A1_82)
      A2_83:setForceMove()
      A0_81.cam_pos:resetFloater()
    else
      A2_83:setForceMove()
      A0_81.cam_pos:resetFloater()
      if not A3_84 then
        A1_82:appendChild(A2_83)
      else
        A1_82:appendChildToJoint(A2_83, A3_84)
      end
      A2_83:setForceMove()
      A0_81.cam_pos:resetFloater()
    end
  end
end
function SDemo._warp(A0_85, A1_86, A2_87)
  local L3_88
  L3_88 = A2_87.getParent
  L3_88 = L3_88(A2_87)
  if L3_88 then
    L3_88 = A2_87.leaveFromParent
    L3_88(A2_87, true)
  end
  L3_88 = A2_87.getWorldPos
  L3_88 = L3_88(A2_87)
  if A1_86 then
    if type(A1_86) == "table" then
      L3_88 = A1_86
    else
      L3_88 = A1_86:getWorldPos()
    end
  end
  A2_87:setWorldPos(L3_88)
  A2_87:setForceMove()
  A0_85.cam_pos:resetFloater()
end
function SDemo._play(A0_89, A1_90, A2_91, A3_92)
  local L4_93, L5_94, L6_95, L7_96, L8_97, L9_98, L10_99, L11_100, L12_101, L13_102, L14_103
  L5_94 = A0_89
  L4_93 = A0_89.camera_shake
  L4_93(L5_94)
  if A1_90 then
    L5_94 = A2_91
    L4_93 = A2_91.clearCurve
    L4_93(L5_94)
    L5_94 = A2_91
    L4_93 = A2_91.getWorldPos
    L4_93 = L4_93(L5_94)
    L6_95 = A2_91
    L5_94 = A2_91.getWorldPos
    L5_94 = L5_94(L6_95)
    L6_95 = 0
    L7_96 = true
    if L8_97 then
      L8_97(L9_98)
      L11_100 = 0
      L12_101 = 0
      L13_102 = 0
      L14_103 = L10_99(L11_100, L12_101, L13_102)
      L8_97(L9_98, L10_99, L11_100, L12_101, L13_102, L14_103, L10_99(L11_100, L12_101, L13_102))
      L8_97(L9_98, L10_99)
      L8_97(L9_98)
      if A3_92 then
        L8_97(L9_98)
      end
    end
    for L11_100, L12_101 in L8_97(L9_98) do
      L13_102 = L12_101.rot_z
      if L13_102 ~= nil then
        L7_96 = false
      end
      L13_102 = L12_101.time
      L13_102 = L13_102 or 1
      L14_103 = L12_101.hashfunc
      L14_103 = L14_103 or "EaseInOut"
      if L7_96 == false then
        L4_93 = L4_93 - L5_94
      end
      A2_91:appendCurvePointLTLQ(L4_93, Vector(0, 0, 0), L13_102, L14_103, L7_96)
      L4_93 = A0_89:_findNode(L12_101.pos)
      if not L4_93.x then
        L4_93 = L4_93:getWorldPos()
      end
      L6_95 = L12_101.rot_z or 0
    end
    if L7_96 == false then
      L4_93 = L4_93 - L5_94
    end
    L11_100 = Vector
    L12_101 = 0
    L13_102 = 0
    L14_103 = L6_95
    L11_100 = L11_100(L12_101, L13_102, L14_103)
    L12_101 = 0
    L13_102 = "EaseInOut"
    L14_103 = L7_96
    L8_97(L9_98, L10_99, L11_100, L12_101, L13_102, L14_103)
    L8_97(L9_98, L10_99)
  end
end
function SDemo._linear(A0_104, A1_105, A2_106, A3_107)
  local L4_108
  L4_108 = A2_106 * A1_105
  L4_108 = L4_108 / A3_107
  return L4_108
end
function SDemo._easeIn(A0_109, A1_110, A2_111, A3_112)
  local L4_113, L5_114
  L4_113 = A1_110 / A3_112
  L5_114 = A2_111 * L4_113
  L5_114 = L5_114 * L4_113
  L5_114 = L5_114 * L4_113
  return L5_114
end
function SDemo._easeOut(A0_115, A1_116, A2_117, A3_118)
  local L4_119, L5_120
  L4_119 = A1_116 / A3_118
  L4_119 = L4_119 - 1
  L5_120 = L4_119 * L4_119
  L5_120 = L5_120 * L4_119
  L5_120 = L5_120 + 1
  L5_120 = A2_117 * L5_120
  return L5_120
end
function SDemo._easeInOut(A0_121, A1_122, A2_123, A3_124)
  local L4_125, L5_126, L6_127
  L4_125 = A1_122 / A3_124
  L4_125 = L4_125 * 2
  if L4_125 < 1 then
    L5_126 = A2_123 / 2
    L5_126 = L5_126 * L4_125
    L5_126 = L5_126 * L4_125
    L5_126 = L5_126 * L4_125
    return L5_126
  end
  L4_125 = L4_125 - 2
  L5_126 = A2_123 / 2
  L6_127 = L4_125 * L4_125
  L6_127 = L6_127 * L4_125
  L6_127 = L6_127 + 2
  L5_126 = L5_126 * L6_127
  return L5_126
end
function SDemo.camera_shake_task(A0_128)
  if A0_128.camera_shaketask_hdl == nil then
    A0_128.camera_shaketask_hdl = invokeTask(function()
      while true do
        Camera:shake2D(2, RandF(0.05, 0.08), 0.025, 0)
        waitSeconds(2)
      end
    end)
  end
end
function SDemo.camera_shake(A0_129)
  invokeTask(function()
    wait()
    A0_129.cam_pos:setFloaterParams({
      tx = {
        rand = 1,
        sign = 0,
        max_a = 0.015,
        min_a = -0.015,
        max_t = 2.8,
        min_t = 2.5
      },
      ty = {
        rand = 1,
        sign = 0,
        max_a = 0.01,
        min_a = -0.01,
        max_t = 3.3,
        min_t = 2.95
      },
      tz = {
        rand = 1,
        sign = 0,
        max_a = 0,
        min_a = 0,
        max_t = 2.5,
        min_t = 2.2
      },
      rx = {
        rand = 1,
        sign = 0,
        max_a = 0,
        min_a = 0,
        max_t = 2.5,
        min_t = 2
      },
      ry = {
        rand = 1,
        sign = 0,
        max_a = 0,
        min_a = 0,
        max_t = 2.5,
        min_t = 2
      },
      rz = {
        rand = 1,
        sign = 0,
        max_a = 0,
        min_a = 0,
        max_t = 2.5,
        min_t = 2
      }
    })
  end)
end
