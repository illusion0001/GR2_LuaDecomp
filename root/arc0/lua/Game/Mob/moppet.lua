import("math")
Moppet = {}
Moppet.check_assertion = true
Moppet._gen_human_collision_desc = nil
Moppet._sandbox = nil
function Moppet._isValid(A0_0)
  local L1_1
  L1_1 = A0_0.puppet
  if L1_1 then
    L1_1 = true
  else
    L1_1 = L1_1 or false
  end
  return L1_1
end
function Moppet._get_coll_desc(A0_2)
  if not Moppet._gen_human_collision_desc then
    loadFileAsset("evd", "CharDefs/gen_human_collision"):wait()
    Moppet._gen_human_collision_desc = loadFileAsset("evd", "CharDefs/gen_human_collision")
  end
  return Moppet._gen_human_collision_desc
end
function Moppet._installMethods(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8
  for L4_7, L5_8 in L1_4(L2_5) do
    if type(L5_8) == "function" then
      A0_3[L4_7] = L5_8
    end
  end
end
function Moppet.create_moppet_sandbox()
  Moppet._sandbox = createSandbox2("moppet_sb")
  createSandbox2("moppet_sb"):setString("g_filename", "/Game/Mob/moppet_sb.lua")
  createSandbox2("moppet_sb"):try_init()
  createSandbox2("moppet_sb"):waitForReady()
  createSandbox2("moppet_sb"):try_start()
  return (createSandbox2("moppet_sb"))
end
function Moppet.setSandbox(A0_9)
  assert(A0_9)
  Moppet._sandbox = A0_9
end
function Moppet.create(A0_10, A1_11, A2_12, A3_13, A4_14)
  local L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25, L16_26
  L5_15 = string
  L5_15 = L5_15.sub
  L6_16 = A0_10
  L7_17 = 1
  L8_18 = 3
  L5_15 = L5_15(L6_16, L7_17, L8_18)
  L6_16 = Moppet
  L6_16 = L6_16.check_assertion
  if L6_16 then
    L6_16 = assert
    L7_17 = L5_15 == "man" or L5_15 == "wom" or L5_15 == "chi" or L5_15 == "cid"
    L6_16(L7_17)
  end
  if not A4_14 or not A4_14 then
    L6_16 = {}
    A4_14 = L6_16
  end
  L6_16 = A0_10
  L7_17 = "_base"
  L6_16 = L6_16 .. L7_17
  L7_17 = L5_15
  L8_18 = "01"
  L7_17 = L7_17 .. L8_18
  L8_18 = nil
  L9_19 = Moppet
  L8_18 = L9_19._sandbox
  L9_19 = A4_14.sandbox
  if L9_19 then
    L8_18 = A4_14.sandbox
  end
  L10_20 = L8_18
  L9_19 = L8_18.createGameObject2
  L11_21 = "Puppet"
  L9_19 = L9_19(L10_20, L11_21)
  L11_21 = L9_19
  L10_20 = L9_19.setEnableDebugDraw
  L10_20(L11_21, L12_22)
  L11_21 = L9_19
  L10_20 = L9_19.loadModel
  L10_20(L11_21, L12_22)
  L11_21 = L9_19
  L10_20 = L9_19.loadBaseSkeleton
  L10_20(L11_21, L12_22)
  L11_21 = L9_19
  L10_20 = L9_19.loadPoseAnimationSet
  L10_20(L11_21, L12_22)
  L10_20 = A4_14.name
  if L10_20 then
    L11_21 = L9_19
    L10_20 = L9_19.setName
    L10_20(L11_21, L12_22)
  end
  if A1_11 then
    L11_21 = A1_11
    L10_20 = A1_11.appendChild
    L10_20(L11_21, L12_22)
  end
  if not A2_12 then
    L10_20 = Vector
    L11_21 = 0
    L10_20 = L10_20(L11_21, L12_22, L13_23)
    A2_12 = L10_20
  end
  if not A3_13 then
    L10_20 = IdentityQuaternion
    L10_20 = L10_20()
    A3_13 = L10_20
  end
  L10_20 = A4_14.ls
  if L10_20 then
    L11_21 = L9_19
    L10_20 = L9_19.setTransform
    L10_20(L11_21, L12_22, L13_23)
  else
    L10_20 = A4_14.ws
    if L10_20 then
      L11_21 = L9_19
      L10_20 = L9_19.setWorldTransform
      L10_20(L11_21, L12_22, L13_23)
    else
      L11_21 = L9_19
      L10_20 = L9_19.setWorldTransform
      L10_20(L11_21, L12_22, L13_23)
    end
  end
  L10_20 = Moppet
  L10_20 = L10_20._get_coll_desc
  L10_20 = L10_20()
  L11_21 = L9_19.setDescription
  L16_26 = L13_23(L14_24)
  L11_21(L12_22, L13_23, L14_24, L15_25, L16_26, L13_23(L14_24))
  L11_21 = A4_14.motion_list
  if L11_21 then
    for L15_25, L16_26 in L12_22(L13_23) do
      L9_19:loadPoseAnimation(L16_26, L16_26)
    end
  end
  L15_25 = L12_22
  L13_23(L14_24, L15_25)
  L13_23.puppet = L9_19
  L15_25 = L13_23
  L14_24(L15_25)
  L15_25 = L9_19
  L14_24(L15_25)
  L15_25 = L12_22
  L14_24(L15_25)
  function L15_25()
    L14_24 = L14_24 - 1
    if L14_24 == 0 then
      L9_19:try_start()
      L12_22:try_start()
      if A4_14.play_motion then
        L9_19:playPoseAnimation(A4_14.play_motion)
      end
      if A4_14.fn_ready then
        A4_14.fn_ready(L13_23)
      end
    end
  end
  L16_26 = invokeTask
  L16_26(function()
    while L9_19:isLoading() do
      wait()
    end
    L15_25()
  end)
  L16_26 = L9_19.waitForReadyAsync
  L16_26(L9_19, L15_25)
  L16_26 = L12_22.waitForReadyAsync
  L16_26(L12_22, L15_25)
  L16_26 = A4_14.wait_for_ready
  if L16_26 then
    L16_26 = L9_19.waitForReady
    L16_26(L9_19)
    L16_26 = L12_22.waitForReady
    L16_26(L12_22)
    while true do
      L16_26 = L9_19.isLoading
      L16_26 = L16_26(L9_19)
      if L16_26 then
        L16_26 = wait
        L16_26()
      end
    end
  end
  return L13_23
end
function Moppet.findMoppet(A0_27)
  local L1_28, L2_29
  L1_28 = assert
  L2_29 = Moppet
  L2_29 = L2_29._sandbox
  L1_28(L2_29)
  L1_28 = Moppet
  L1_28 = L1_28._sandbox
  L2_29 = L1_28
  L1_28 = L1_28.findGameObject2
  L1_28 = L1_28(L2_29, "Puppet", A0_27)
  if L1_28 then
    L2_29 = {}
    L2_29.puppet = L1_28
    Moppet._installMethods(L2_29)
    return L2_29
  else
    L2_29 = nil
    return L2_29
  end
end
function Moppet.disapear(A0_30, A1_31, A2_32)
  local L3_33, L4_34, L5_35
  L3_33 = Moppet
  L3_33 = L3_33._isValid
  L4_34 = A0_30
  L3_33 = L3_33(L4_34)
  if not L3_33 then
    L3_33 = false
    return L3_33
  end
  L3_33 = A0_30.puppet
  L5_35 = L3_33
  L4_34 = L3_33.getBrain
  L4_34 = L4_34(L5_35)
  A0_30.puppet = nil
  L5_35 = {}
  L5_35.has_done = false
  L5_35.task = nil
  if not A1_31 or not A1_31 then
    A1_31 = 30
  end
  L5_35.task = invokeTask(function()
    for _FORV_3_ = 1, A1_31 do
      L3_33:setAlpha(1 - _FORV_3_ / A1_31)
      wait()
    end
    _FOR_:kill()
    L3_33:kill()
    L5_35.has_done = true
  end)
  return L5_35
end
function Moppet.letGoOff(A0_36, A1_37)
  local L2_38, L3_39
  L2_38 = Moppet
  L2_38 = L2_38._isValid
  L3_39 = A0_36
  L2_38 = L2_38(L3_39)
  if not L2_38 then
    L2_38 = false
    return L2_38
  end
  L2_38 = A0_36.puppet
  L3_39 = L2_38.getBrain
  L3_39 = L3_39(L2_38)
  L2_38:playPoseAnimation("stay")
  A0_36.puppet = nil
  invokeTask(function()
    local L0_40
    L0_40 = 90
    for _FORV_4_ = 1, L0_40 do
      L2_38:setAlpha(1 - _FORV_4_ / L0_40)
      wait()
    end
    _FOR_:kill()
    L2_38:kill()
  end)
end
function Moppet.getPuppet(A0_41)
  if not Moppet._isValid(A0_41) then
    return false
  end
  return A0_41.puppet
end
function Moppet.getPosture(A0_42, A1_43)
  if not Moppet._isValid(A0_42) then
    return false
  end
  if A1_43 and A1_43.ls then
    return A0_42.puppet:getTransform()
  else
    return A0_42.puppet:getWorldTransform()
  end
end
function Moppet.setPosture(A0_44, A1_45, A2_46, A3_47)
  if not Moppet._isValid(A0_44) then
    return false
  end
  A2_46 = A2_46 or Quaternion(0, 0, 0, 1)
  if A3_47 and A3_47.ls then
    A0_44.puppet:setTransform(A1_45, A2_46)
  else
    A0_44.puppet:setWorldTransform(A1_45, A2_46)
  end
  A0_44.puppet:setForceMove()
end
function Moppet.loadMotions(A0_48, A1_49, A2_50)
  local L3_51, L4_52, L5_53, L6_54, L7_55, L8_56
  L3_51 = Moppet
  L3_51 = L3_51._isValid
  L3_51 = L3_51(L4_52)
  if not L3_51 then
    L3_51 = false
    return L3_51
  end
  L3_51 = A0_48.puppet
  for L7_55, L8_56 in L4_52(L5_53) do
    L3_51:loadPoseAnimation(L8_56, L8_56)
  end
  if A2_50 then
    L4_52(L5_53)
  end
end
function Moppet.playMotion(A0_57, A1_58, A2_59)
  local L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67
  L3_60 = Moppet
  L3_60 = L3_60._isValid
  L4_61 = A0_57
  L3_60 = L3_60(L4_61)
  if not L3_60 then
    L3_60 = false
    return L3_60
  end
  if not A2_59 or not A2_59 then
    L3_60 = {}
    A2_59 = L3_60
  end
  L3_60 = A0_57.puppet
  L4_61 = type
  L5_62 = A1_58
  L4_61 = L4_61(L5_62)
  if L4_61 == "string" then
    L4_61 = nil
    L5_62 = A2_59.fn_anim_end
    if L5_62 then
      L5_62 = invokeTask
      L5_62 = L5_62(L6_63)
      L4_61 = L5_62
    end
    L5_62 = L3_60.playPoseAnimation
    L9_66 = A2_59.transit_duration
    L5_62 = L5_62(L6_63, L7_64, L8_65, L9_66)
    return L5_62, L6_63
  else
    L4_61 = A1_58[1]
    L5_62 = {}
    for L9_66, L10_67 in L6_63(L7_64) do
      if L9_66 ~= 1 then
        table.insert(L5_62, L10_67)
      end
    end
    L9_66 = L4_61
    L10_67 = 0
    do return L7_64, L8_65 end
    break
  end
end
function Moppet.setEventListener(A0_68, A1_69, A2_70)
  if not Moppet._isValid(A0_68) then
    return false
  end
  A0_68.puppet:getBrain():setEventListener(A1_69, A2_70)
end
function Moppet.turnTo(A0_71, A1_72, A2_73)
  local L3_74, L4_75, L5_76
  L3_74 = Moppet
  L3_74 = L3_74._isValid
  L4_75 = A0_71
  L3_74 = L3_74(L4_75)
  if not L3_74 then
    L3_74 = false
    return L3_74
  end
  if not A2_73 or not A2_73 then
    L3_74 = {}
    A2_73 = L3_74
  end
  L3_74 = A0_71.puppet
  L5_76 = L3_74
  L4_75 = L3_74.getWorldPos
  L4_75 = L4_75(L5_76)
  L5_76 = A1_72 - L4_75
  L3_74:setWorldRot(DirectionToYaw(L5_76))
end
function Moppet.pursue(A0_77, A1_78, A2_79)
  local L3_80, L4_81, L5_82, L6_83, L7_84, L8_85
  L3_80 = Moppet
  L3_80 = L3_80._isValid
  L4_81 = A0_77
  L3_80 = L3_80(L4_81)
  if not L3_80 then
    L3_80 = false
    return L3_80
  end
  if not A2_79 or not A2_79 then
    L3_80 = {}
    A2_79 = L3_80
  end
  L3_80 = A0_77.puppet
  L5_82 = L3_80
  L4_81 = L3_80.setUseAnimLocomotion
  L6_83 = true
  L4_81(L5_82, L6_83)
  L4_81 = A2_79.run
  if L4_81 then
    L4_81 = "run"
  else
    L4_81 = L4_81 or "walk"
  end
  L6_83 = L3_80
  L5_82 = L3_80.playPoseAnimation
  L7_84 = L4_81
  L5_82(L6_83, L7_84)
  L5_82 = A1_78
  L5_82 = L5_82()
  L7_84 = L3_80
  L6_83 = L3_80.getWorldPos
  L6_83 = L6_83(L7_84)
  L5_82 = L5_82 - L6_83
  L6_83 = L5_82
  L5_82 = L5_82.Length
  L5_82 = L5_82(L6_83)
  L6_83 = A2_79.target_radius
  if L6_83 then
    L6_83 = A2_79.target_radius
  else
    L6_83 = L6_83 or 1
  end
  L7_84 = {}
  L7_84.distance = L5_82
  L7_84.cancel = false
  L7_84.has_reached = false
  L7_84.stay_motion = "stay"
  L7_84.target_radius = L6_83
  function L8_85()
    local L0_86, L1_87, L2_88, L3_89
    L0_86 = false
    repeat
      L1_87 = A1_78
      L1_87 = L1_87()
      L2_88 = L3_80
      L3_89 = L2_88
      L2_88 = L2_88.getWorldPos
      L2_88 = L2_88(L3_89)
      L3_89 = L2_88.y
      L1_87.y = L3_89
      L3_89 = L1_87 - L2_88
      if L3_89:Length() <= L7_84.target_radius then
        L0_86 = true
        break
      end
      L3_80:setWorldRot(DirectionToYaw(L3_89))
      L7_84.distance = L3_89:Length()
      wait()
    until L7_84.cancel
    if L0_86 then
      L7_84.has_reached = true
      L1_87 = A2_79.fn_has_reached
      if L1_87 then
        L1_87 = A2_79.fn_has_reached
        L1_87()
      end
    end
    L1_87 = L3_80
    L2_88 = L1_87
    L1_87 = L1_87.playPoseAnimation
    L3_89 = L7_84.stay_motion
    L1_87(L2_88, L3_89)
  end
  L7_84.task = L8_85
  invokeTask(L8_85)
  return L7_84
end
function Moppet.moveToPointNM(A0_90, A1_91, A2_92)
  local L3_93, L4_94
  L3_93 = Moppet
  L3_93 = L3_93._isValid
  L4_94 = A0_90
  L3_93 = L3_93(L4_94)
  if not L3_93 then
    L3_93 = false
    return L3_93
  end
  if not A2_92 or not A2_92 then
    L3_93 = {}
    A2_92 = L3_93
  end
  L3_93 = nil
  L4_94 = A2_92.ws
  if L4_94 then
    L3_93 = A1_91
  else
    L4_94 = A2_92.ls
    if L4_94 then
      L4_94 = A0_90.area_obj
      L4_94 = L4_94.localToWorld
      L4_94 = L4_94(L4_94, A1_91)
      L3_93 = L4_94
    else
      L3_93 = A1_91
    end
  end
  L4_94 = nil
  if A2_92.run then
    L4_94 = 1
  elseif A2_92.move_method then
    L4_94 = A2_92.move_method
  end
  if L3_93 then
    A0_90.puppet:getBrain():moveToPointNM(L3_93, L4_94)
  else
    warn("no position was specified @Moppet.moveToOnNV")
  end
end
