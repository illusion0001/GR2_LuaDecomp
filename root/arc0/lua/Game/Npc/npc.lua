import("math")
Npc = {}
Npc._sandbox = nil
function Npc.setSandbox(A0_0)
  Npc._sandbox = A0_0
end
function Npc.Create(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  local L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22
  L6_7 = nil
  L7_8 = Npc
  L6_7 = L7_8._sandbox
  L7_8 = nil
  if L6_7 == nil then
    L8_9 = createGameObject2
    L9_10 = "NpcGenerator"
    L8_9 = L8_9(L9_10)
    L7_8 = L8_9
  else
    L9_10 = L6_7
    L8_9 = L6_7.createGameObject2
    L10_11 = "NpcGenerator"
    L8_9 = L8_9(L9_10, L10_11)
    L7_8 = L8_9
  end
  L8_9 = "stay"
  if A5_6 then
    L9_10 = A5_6.motion
    if L9_10 ~= nil then
      L8_9 = A5_6.motion
    end
  end
  L9_10 = true
  if A5_6 then
    L10_11 = A5_6.use_gravity
    if L10_11 == false then
      L9_10 = false
    end
  end
  L10_11 = false
  if A5_6 then
    L11_12 = A5_6.disable_collision
    if L11_12 == true then
      L10_11 = true
    end
  end
  L11_12 = false
  if A5_6 then
    L12_13 = A5_6.use_fall
    if L12_13 == true then
      L11_12 = true
    end
  end
  L12_13 = 0
  if A5_6 then
    L13_14 = A5_6.color
    if L13_14 ~= nil then
      L12_13 = A5_6.color
    end
  end
  L13_14 = ""
  if A5_6 then
    L14_15 = A5_6.face
    if L14_15 ~= nil then
      L13_14 = A5_6.face
    end
  end
  L14_15 = 0
  if A5_6 then
    L15_16 = A5_6.hair
    if L15_16 ~= nil then
      L14_15 = A5_6.hair
    end
  end
  if not A1_2 then
    L16_17 = L7_8
    L15_16 = L7_8.findArea
    L17_18 = A2_3
    L15_16 = L15_16(L16_17, L17_18)
    A1_2 = L15_16
  end
  if A1_2 then
    L16_17 = A1_2
    L15_16 = A1_2.appendChild
    L17_18 = L7_8
    L15_16(L16_17, L17_18)
  end
  L15_16 = false
  if A5_6 then
    L16_17 = A5_6.mob
    if L16_17 ~= nil then
      L15_16 = A5_6.mob
    end
  end
  L16_17 = nil
  if A5_6 then
    L17_18 = A5_6.prop
    if L17_18 ~= nil then
      L16_17 = A5_6.prop
    end
  end
  L17_18 = ""
  if A5_6 then
    L18_19 = A5_6.propType
    if L18_19 ~= nil then
      L17_18 = A5_6.propType
    end
  end
  L18_19 = {}
  L18_19.labelName = A4_5
  L18_19.npcName = A0_1
  L18_19.position = A2_3
  L18_19.rotation = A3_4
  L18_19.animName = L8_9
  L18_19.useGravity = L9_10
  L18_19.disableCollision = L10_11
  L18_19.useFall = L11_12
  L18_19.colorVariation = L12_13
  L18_19.hairVariation = L14_15
  L18_19.faceTexName = L13_14
  L18_19.mobToNpc = L15_16
  L18_19.prop = L16_17
  L18_19.propType = L17_18
  L20_21 = L7_8
  L19_20 = L7_8.setCreateParam
  L21_22 = L18_19
  L19_20(L20_21, L21_22)
  L20_21 = L7_8
  L19_20 = L7_8.setWorldTransform
  L21_22 = A2_3
  L19_20(L20_21, L21_22, A3_4)
  L20_21 = L7_8
  L19_20 = L7_8.setName
  L21_22 = "NpcGen_"
  L21_22 = L21_22 .. A0_1
  L19_20(L20_21, L21_22)
  L19_20 = {}
  L19_20.generator = L7_8
  L19_20.turnLimit = 60
  L20_21 = Npc
  L20_21 = L20_21._installMethods
  L21_22 = L19_20
  L20_21(L21_22)
  L21_22 = L7_8
  L20_21 = L7_8.try_init
  L20_21(L21_22)
  L20_21 = 2
  function L21_22()
    L20_21 = L20_21 - 1
    if L20_21 == 0 then
      L7_8:try_start()
      if L6_7 ~= nil and L6_7:getName() == "infoActorManager" then
        L6_7:sendEvent("setNpc", A0_1, L7_8:getPuppet(), L7_8:getBrain(), L7_8)
      end
      if A5_6.fn_ready then
        A5_6.fn_ready(L19_20)
      end
    end
  end
  L7_8:waitForReadyAsync(L21_22)
  invokeTask(function()
    repeat
      wait()
    until L7_8:getPuppet()
    while L7_8:getPuppet():isLoading() do
      wait()
    end
    L21_22()
  end)
  return L19_20
end
function Npc.Load(A0_23, A1_24, A2_25, A3_26, A4_27, A5_28)
  local L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41, L19_42
  L6_29 = nil
  L7_30 = Npc
  L6_29 = L7_30._sandbox
  L7_30 = nil
  if L6_29 == nil then
    L8_31 = createGameObject2
    L9_32 = "NpcGenerator"
    L8_31 = L8_31(L9_32)
    L7_30 = L8_31
  else
    L9_32 = L6_29
    L8_31 = L6_29.createGameObject2
    L10_33 = "NpcGenerator"
    L8_31 = L8_31(L9_32, L10_33)
    L7_30 = L8_31
  end
  L8_31 = "stay"
  if A5_28 then
    L9_32 = A5_28.motion
    if L9_32 ~= nil then
      L8_31 = A5_28.motion
    end
  end
  L9_32 = true
  if A5_28 then
    L10_33 = A5_28.use_gravity
    if L10_33 == false then
      L9_32 = false
    end
  end
  L10_33 = false
  if A5_28 then
    L11_34 = A5_28.disable_collision
    if L11_34 == true then
      L10_33 = true
    end
  end
  L11_34 = false
  if A5_28 then
    L12_35 = A5_28.use_fall
    if L12_35 == true then
      L11_34 = true
    end
  end
  L12_35 = 0
  if A5_28 then
    L13_36 = A5_28.color
    if L13_36 ~= nil then
      L12_35 = A5_28.color
    end
  end
  L13_36 = ""
  if A5_28 then
    L14_37 = A5_28.face
    if L14_37 ~= nil then
      L13_36 = A5_28.face
    end
  end
  L14_37 = 0
  if A5_28 then
    L15_38 = A5_28.hair
    if L15_38 ~= nil then
      L14_37 = A5_28.hair
    end
  end
  if not A1_24 then
    L16_39 = L7_30
    L15_38 = L7_30.findArea
    L17_40 = A2_25
    L15_38 = L15_38(L16_39, L17_40)
    A1_24 = L15_38
  end
  if A1_24 then
    L16_39 = A1_24
    L15_38 = A1_24.appendChild
    L17_40 = L7_30
    L15_38(L16_39, L17_40)
  end
  L15_38 = false
  if A5_28 then
    L16_39 = A5_28.mob
    if L16_39 ~= nil then
      L15_38 = A5_28.mob
    end
  end
  L16_39 = nil
  if A5_28 then
    L17_40 = A5_28.prop
    if L17_40 ~= nil then
      L16_39 = A5_28.prop
    end
  end
  L17_40 = ""
  if A5_28 then
    L18_41 = A5_28.propType
    if L18_41 ~= nil then
      L17_40 = A5_28.propType
    end
  end
  L18_41 = {}
  L18_41.labelName = A4_27
  L18_41.npcName = A0_23
  L18_41.position = A2_25
  L18_41.rotation = A3_26
  L18_41.animName = L8_31
  L18_41.useGravity = L9_32
  L18_41.disableCollision = L10_33
  L18_41.useFall = L11_34
  L18_41.colorVariation = L12_35
  L18_41.hairVariation = L14_37
  L18_41.faceTexName = L13_36
  L18_41.mobToNpc = L15_38
  L18_41.prop = L16_39
  L18_41.propType = L17_40
  L19_42 = L7_30.setCreateParam
  L19_42(L7_30, L18_41)
  L19_42 = L7_30.setWorldTransform
  L19_42(L7_30, A2_25, A3_26)
  L19_42 = L7_30.setName
  L19_42(L7_30, "NpcGen_" .. A0_23)
  L19_42 = {}
  L19_42.generator = L7_30
  L19_42.turnLimit = 60
  Npc._installMethods(L19_42)
  return L19_42
end
function Npc.FindPuppet(A0_43)
  local L1_44, L2_45
  L1_44 = nil
  L2_45 = Npc
  L1_44 = L2_45._sandbox
  L2_45 = nil
  if L1_44 == nil then
    L2_45 = findGameObject2("Puppet", A0_43)
  else
    L2_45 = L1_44:findGameObject2("Puppet", A0_43)
  end
  return L2_45
end
function Npc.FindNpc(A0_46)
  local L1_47, L2_48, L3_49
  L1_47 = nil
  L2_48 = Npc
  L1_47 = L2_48._sandbox
  L2_48 = nil
  if L1_47 == nil then
    L3_49 = findGameObject2
    L3_49 = L3_49("NpcGenerator", "NpcGen_" .. A0_46)
    L2_48 = L3_49
  else
    L3_49 = L1_47.findGameObject2
    L3_49 = L3_49(L1_47, "NpcGenerator", "NpcGen_" .. A0_46)
    L2_48 = L3_49
  end
  if L2_48 then
    L3_49 = {}
    L3_49.generator = L2_48
    L3_49.turnLimit = 60
    Npc._installMethods(L3_49)
    return L3_49
  else
    L3_49 = nil
    return L3_49
  end
end
function Npc.SendNpcHandle(A0_50, A1_51)
  local L2_52
  L2_52 = nil
  L2_52 = Npc._sandbox
  if L2_52 ~= nil and A1_51 and (L2_52:getName() == "mother2" or L2_52:getName() == "infoActorManager") then
    L2_52:sendEvent("setNpc", A0_50, A1_51:getPuppet(), A1_51:getBrain(), A1_51)
  end
end
function Npc.FindNearPoint(A0_53, A1_54, A2_55, A3_56)
  local L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63
  L4_57 = nil
  L5_58 = Npc
  L4_57 = L5_58._sandbox
  if A3_56 ~= true then
    L4_57 = nil
  end
  L5_58 = {}
  for L9_62 = 1, #A1_54 do
    L10_63 = nil
    if L4_57 == nil then
      L10_63 = findGameObject2("Node", A1_54[L9_62])
    else
      L10_63 = L4_57:findGameObject2("Node", A1_54[L9_62])
    end
    assert(L10_63)
    table.insert(L5_58, {
      length = (A0_53 - L10_63:getWorldTransform()):Length(),
      index = L9_62
    })
  end
  L6_59(L7_60, L8_61)
  return L6_59
end
function Npc._isValid(A0_64)
  if A0_64 == nil then
    return false
  end
  if A0_64.generator == nil then
    return false
  end
  return true
end
function Npc._installMethods(A0_65)
  local L1_66, L2_67, L3_68, L4_69, L5_70
  for L4_69, L5_70 in L1_66(L2_67) do
    if type(L5_70) == "function" then
      A0_65[L4_69] = L5_70
    end
  end
end
function Npc.getPuppet(A0_71)
  if not Npc._isValid(A0_71) then
    return nil
  end
  return A0_71.generator:getPuppet()
end
function Npc.getBrain(A0_72)
  if not Npc._isValid(A0_72) then
    return nil
  end
  return A0_72.generator:getBrain()
end
function Npc.getGenerator(A0_73)
  if not Npc._isValid(A0_73) then
    return nil
  end
  return A0_73.generator
end
function Npc.setEventListener(A0_74, A1_75, A2_76)
  if not Npc._isValid(A0_74) then
    return false
  end
  A0_74.generator:setEventListener(A1_75, A2_76)
end
function Npc.disappear(A0_77, A1_78)
  if not Npc._isValid(A0_77) then
    return false
  end
  A0_77.generator:getBrain():npcDisappear(A1_78)
  if Npc._sandbox ~= nil and (Npc._sandbox:getName() == "mother2" or Npc._sandbox:getName() == "infoActorManager") then
    Npc._sandbox:sendEvent("killNpc", A0_77.generator:getPuppet():getName())
  end
  A0_77.generator = nil
end
function Npc.kill(A0_79)
  if not Npc._isValid(A0_79) then
    return false
  end
  A0_79.generator:try_term()
  A0_79.generator = nil
end
function Npc.playMotion(A0_80, A1_81, A2_82)
  local L3_83, L4_84, L5_85, L6_86, L7_87, L8_88
  L3_83 = Npc
  L3_83 = L3_83._isValid
  L4_84 = A0_80
  L3_83 = L3_83(L4_84)
  if not L3_83 then
    L3_83 = false
    return L3_83
  end
  L3_83 = A0_80.generator
  L4_84 = L3_83
  L3_83 = L3_83.getBrain
  L3_83 = L3_83(L4_84)
  L4_84 = 1
  if A2_82 ~= nil then
    L4_84 = A2_82
  end
  L5_85 = false
  L6_86 = "Normal"
  L7_87 = {L8_88}
  L8_88 = {}
  L8_88.name = A1_81
  L8_88.speed = L4_84
  L8_88 = {}
  L8_88.animList = L7_87
  L8_88.playMode = "Normal"
  L8_88.repeatFlag = false
  L3_83:npcPlayMotion(L8_88)
  L3_83 = nil
end
function Npc.playMotionNormal(A0_89, A1_90, A2_91)
  local L3_92, L4_93, L5_94
  L3_92 = Npc
  L3_92 = L3_92._isValid
  L4_93 = A0_89
  L3_92 = L3_92(L4_93)
  if not L3_92 then
    L3_92 = false
    return L3_92
  end
  L3_92 = A0_89.generator
  L4_93 = L3_92
  L3_92 = L3_92.getBrain
  L3_92 = L3_92(L4_93)
  L4_93 = false
  if A2_91 ~= nil and A2_91 == true then
    L4_93 = true
  end
  L5_94 = {}
  L5_94.animList = A1_90
  L5_94.playMode = "Normal"
  L5_94.repeatFlag = L4_93
  L3_92:npcPlayMotion(L5_94)
  L3_92 = nil
end
function Npc.playMotionRandom(A0_95, A1_96, A2_97)
  local L3_98, L4_99, L5_100
  L3_98 = Npc
  L3_98 = L3_98._isValid
  L4_99 = A0_95
  L3_98 = L3_98(L4_99)
  if not L3_98 then
    L3_98 = false
    return L3_98
  end
  L3_98 = A0_95.generator
  L4_99 = L3_98
  L3_98 = L3_98.getBrain
  L3_98 = L3_98(L4_99)
  L4_99 = false
  if A2_97 ~= nil and A2_97 == true then
    L4_99 = true
  end
  L5_100 = {}
  L5_100.animList = A1_96
  L5_100.playMode = "Random"
  L5_100.repeatFlag = L4_99
  L3_98:npcPlayMotion(L5_100)
  L3_98 = nil
end
function Npc.playMotionShuffle(A0_101, A1_102, A2_103)
  local L3_104, L4_105, L5_106
  L3_104 = Npc
  L3_104 = L3_104._isValid
  L4_105 = A0_101
  L3_104 = L3_104(L4_105)
  if not L3_104 then
    L3_104 = false
    return L3_104
  end
  L3_104 = A0_101.generator
  L4_105 = L3_104
  L3_104 = L3_104.getBrain
  L3_104 = L3_104(L4_105)
  L4_105 = false
  if A2_103 ~= nil and A2_103 == true then
    L4_105 = true
  end
  L5_106 = {}
  L5_106.animList = A1_102
  L5_106.playMode = "Shuffle"
  L5_106.repeatFlag = L4_105
  L3_104:npcPlayMotion(L5_106)
  L3_104 = nil
end
function Npc.isMotionEnd(A0_107)
  if not Npc._isValid(A0_107) then
    return false
  end
  return (A0_107.generator:getBrain():npcIsMotionEnd())
end
function Npc.isMotionEnd2(A0_108)
  if not Npc._isValid(A0_108) then
    return false
  end
  return (A0_108.generator:getBrain():npcIsMotionEnd2())
end
function Npc.pursue(A0_109, A1_110, A2_111, A3_112, A4_113, A5_114)
  local L6_115, L7_116, L8_117, L9_118, L10_119, L11_120, L12_121
  L6_115 = Npc
  L6_115 = L6_115._isValid
  L7_116 = A0_109
  L6_115 = L6_115(L7_116)
  if not L6_115 then
    L6_115 = false
    return L6_115
  end
  L6_115 = A0_109.generator
  L7_116 = L6_115
  L6_115 = L6_115.getBrain
  L6_115 = L6_115(L7_116)
  L7_116 = 1
  L8_117 = 1
  L9_118 = 1
  if A5_114 ~= nil then
    L10_119 = A5_114.noNaviMesh
    if L10_119 ~= nil then
      L10_119 = A5_114.noNaviMesh
      if L10_119 == true then
        useNaviMesh = false
      end
    end
    if A4_113 == 0 then
      L10_119 = A5_114.walk
      if L10_119 then
        L7_116 = A5_114.walk
      end
      L10_119 = A5_114.walk_b
      if L10_119 then
        L8_117 = A5_114.walk_b
      end
      L10_119 = A5_114.run
      if L10_119 then
        L9_118 = A5_114.run
      end
    elseif A4_113 == 1 then
      L10_119 = A5_114.walk1
      if L10_119 then
        L7_116 = A5_114.walk1
      end
      L10_119 = A5_114.walk_b1
      if L10_119 then
        L8_117 = A5_114.walk_b1
      end
      L10_119 = A5_114.run1
      if L10_119 then
        L9_118 = A5_114.run1
      end
    elseif A4_113 == 2 then
      L10_119 = A5_114.walk2
      if L10_119 then
        L7_116 = A5_114.walk2
      end
      L10_119 = A5_114.walk_b2
      if L10_119 then
        L8_117 = A5_114.walk_b2
      end
      L10_119 = A5_114.run2
      if L10_119 then
        L9_118 = A5_114.run2
      end
    end
  end
  L10_119 = {}
  if A4_113 == 0 then
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "walk", speed = L7_116})
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "walk_b", speed = L8_117})
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "run", speed = L9_118})
  elseif A4_113 == 1 then
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "walk1", speed = L7_116})
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "walk_b1", speed = L8_117})
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "run1", speed = L9_118})
  elseif A4_113 == 2 then
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "walk2", speed = L7_116})
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "walk_b2", speed = L8_117})
    L11_120 = table
    L11_120 = L11_120.insert
    L12_121 = L10_119
    L11_120(L12_121, {anim = "run2", speed = L9_118})
  end
  L11_120 = {L12_121}
  L12_121 = A1_110
  L12_121 = {}
  L12_121.posList = L11_120
  L12_121.animTable = L10_119
  L12_121.arrivedLength = A2_111
  L12_121.runLength = A3_112
  L12_121.moveType = A4_113
  L6_115:npcPursue(L12_121)
  L6_115 = nil
  return true
end
function Npc.pursuePath(A0_122, A1_123, A2_124, A3_125, A4_126, A5_127)
  local L6_128, L7_129, L8_130, L9_131, L10_132, L11_133, L12_134, L13_135, L14_136, L15_137, L16_138
  L6_128 = Npc
  L6_128 = L6_128._isValid
  L7_129 = A0_122
  L6_128 = L6_128(L7_129)
  if not L6_128 then
    L6_128 = false
    return L6_128
  end
  L6_128 = A0_122.generator
  L7_129 = L6_128
  L6_128 = L6_128.getBrain
  L6_128 = L6_128(L7_129)
  L7_129 = nil
  L8_130 = locatorOpt
  if L8_130 ~= nil then
    L8_130 = locatorOpt
    L8_130 = L8_130.belong
    if L8_130 == true then
      L8_130 = L6_128.npcGetSandbox2
      L8_130 = L8_130(L9_131)
      L7_129 = L8_130
    else
      L8_130 = locatorOpt
      L8_130 = L8_130.sandbox
      if L8_130 ~= nil then
        L8_130 = locatorOpt
        L7_129 = L8_130.sandbox
      end
    end
  end
  L8_130 = {}
  for L12_134 = 1, #A1_123 do
    L13_135 = nil
    if L7_129 == nil then
      L14_136 = findGameObject2
      L15_137 = "Node"
      L16_138 = A1_123[L12_134]
      L14_136 = L14_136(L15_137, L16_138)
      L13_135 = L14_136
    else
      L15_137 = L7_129
      L14_136 = L7_129.findGameObject2
      L16_138 = "Node"
      L14_136 = L14_136(L15_137, L16_138, A1_123[L12_134])
      L13_135 = L14_136
    end
    if L13_135 ~= nil then
      L14_136 = table
      L14_136 = L14_136.insert
      L15_137 = L8_130
      L16_138 = L13_135
      L14_136(L15_137, L16_138)
    else
      L14_136 = table
      L14_136 = L14_136.insert
      L15_137 = L8_130
      L16_138 = A1_123[L12_134]
      L14_136(L15_137, L16_138)
    end
  end
  L12_134 = 1
  L13_135 = 1
  L14_136 = 1
  if A2_124 then
  end
  if A3_125 then
  end
  if A4_126 then
  end
  if A5_127 ~= nil then
    if A4_126 == 0 then
      L15_137 = A5_127.walk
      if L15_137 then
        L12_134 = A5_127.walk
      end
      L15_137 = A5_127.walk_b
      if L15_137 then
        L13_135 = A5_127.walk_b
      end
      L15_137 = A5_127.run
      if L15_137 then
        L14_136 = A5_127.run
      end
    elseif A4_126 == 1 then
      L15_137 = A5_127.walk1
      if L15_137 then
        L12_134 = A5_127.walk1
      end
      L15_137 = A5_127.walk_b1
      if L15_137 then
        L13_135 = A5_127.walk_b1
      end
      L15_137 = A5_127.run1
      if L15_137 then
        L14_136 = A5_127.run1
      end
    elseif A4_126 == 2 then
      L15_137 = A5_127.walk2
      if L15_137 then
        L12_134 = A5_127.walk2
      end
      L15_137 = A5_127.walk_b2
      if L15_137 then
        L13_135 = A5_127.walk_b2
      end
      L15_137 = A5_127.run2
      if L15_137 then
        L14_136 = A5_127.run2
      end
    end
  end
  L15_137 = {}
  if A4_126 == 0 then
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "walk", speed = L12_134})
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "walk_b", speed = L13_135})
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "run", speed = L14_136})
  elseif A4_126 == 1 then
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "walk1", speed = L12_134})
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "walk_b1", speed = L13_135})
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "run1", speed = L14_136})
  elseif A4_126 == 2 then
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "walk2", speed = L12_134})
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "walk_b2", speed = L13_135})
    L16_138 = table
    L16_138 = L16_138.insert
    L16_138(L15_137, {anim = "run2", speed = L14_136})
  end
  L16_138 = {}
  L16_138.posList = L8_130
  L16_138.animTable = L15_137
  L16_138.arrivedLength = L9_131
  L16_138.runLength = L10_132
  L16_138.moveType = L11_133
  L6_128:npcPursue(L16_138)
  L6_128 = nil
end
function Npc.move(A0_139, A1_140, A2_141)
  local L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149
  L3_142 = Npc
  L3_142 = L3_142._isValid
  L4_143 = A0_139
  L3_142 = L3_142(L4_143)
  if not L3_142 then
    L3_142 = false
    return L3_142
  end
  L3_142 = A0_139.generator
  L4_143 = L3_142
  L3_142 = L3_142.getBrain
  L3_142 = L3_142(L4_143)
  L4_143 = nil
  L5_144 = A2_141.locatorOpt
  if L5_144 ~= nil then
    L5_144 = A2_141.locatorOpt
    L5_144 = L5_144.belong
    if L5_144 == true then
      L5_144 = L3_142.npcGetSandbox2
      L5_144 = L5_144(L6_145)
      L4_143 = L5_144
    else
      L5_144 = A2_141.locatorOpt
      L5_144 = L5_144.sandbox
      if L5_144 ~= nil then
        L5_144 = A2_141.locatorOpt
        L4_143 = L5_144.sandbox
      end
    end
  end
  L5_144 = {}
  for L9_148 = 1, #A1_140 do
    L10_149 = nil
    if L4_143 == nil then
      L10_149 = findGameObject2("Node", A1_140[L9_148])
    else
      L10_149 = L4_143:findGameObject2("Node", A1_140[L9_148])
    end
    if L10_149 ~= nil then
      table.insert(L5_144, L10_149)
    else
      table.insert(L5_144, A1_140[L9_148])
    end
  end
  L9_148 = {}
  if A2_141 ~= nil then
    L10_149 = A2_141.anim_walk
    if L10_149 ~= nil then
      L10_149 = table
      L10_149 = L10_149.insert
      L10_149(L9_148, {
        anim = A2_141.anim_walk[1],
        speed = A2_141.anim_walk[2]
      })
    else
      L10_149 = table
      L10_149 = L10_149.insert
      L10_149(L9_148, {anim = "walk", speed = 1})
    end
    L10_149 = A2_141.anim_walk_b
    if L10_149 ~= nil then
      L10_149 = table
      L10_149 = L10_149.insert
      L10_149(L9_148, {
        anim = A2_141.anim_walk_b[1],
        speed = A2_141.anim_walk_b[2]
      })
    else
      L10_149 = table
      L10_149 = L10_149.insert
      L10_149(L9_148, {anim = "walk_b", speed = 1})
    end
    L10_149 = A2_141.anim_run
    if L10_149 ~= nil then
      L10_149 = table
      L10_149 = L10_149.insert
      L10_149(L9_148, {
        anim = A2_141.anim_run[1],
        speed = A2_141.anim_run[2]
      })
    else
      L10_149 = table
      L10_149 = L10_149.insert
      L10_149(L9_148, {anim = "run", speed = 1})
    end
    L10_149 = A2_141.arrived
    L10_149 = A2_141.run
    if L10_149 ~= nil then
      L10_149 = A2_141.run
      run_length = L10_149
    end
    L10_149 = A2_141.noNaviMesh
    if L10_149 ~= nil then
      L10_149 = A2_141.noNaviMesh
    end
  end
  L10_149 = {}
  L10_149.posList = L5_144
  L10_149.animTable = L9_148
  L10_149.arrivedLength = L6_145
  L10_149.runLength = run_length
  L10_149.navimesh = L8_147
  L10_149.moveType = 10
  L3_142:npcPursue(L10_149)
  L3_142 = nil
end
function Npc.pausePursue(A0_150, A1_151)
  if not Npc._isValid(A0_150) then
    return false
  end
  A0_150.generator:getBrain():npcPausePursue(A1_151)
end
function Npc.isPursueEnd(A0_152)
  if not Npc._isValid(A0_152) then
    return false
  end
  return (A0_152.generator:getBrain():npcIsPursueEnd())
end
function Npc.getPosture(A0_153)
  if not Npc._isValid(A0_153) then
    return false
  end
  return A0_153.generator:getPuppet():getWorldTransform()
end
function Npc.setPosture(A0_154, A1_155, A2_156)
  if not Npc._isValid(A0_154) then
    return false
  end
  A0_154.generator:getPuppet():setWorldTransform(A1_155, A2_156)
  A0_154.generator:getPuppet():setForceMove()
end
function Npc.warp(A0_157, A1_158)
  local L2_159
  L2_159 = Npc
  L2_159 = L2_159._isValid
  L2_159 = L2_159(A0_157)
  if not L2_159 then
    L2_159 = false
    return L2_159
  end
  L2_159 = findGameObject2
  L2_159 = L2_159("Node", A1_158)
  if L2_159 ~= nil then
    A0_157.generator:warp(L2_159)
  end
  L2_159 = nil
end
function Npc.isSightTarget(A0_160, A1_161, A2_162, A3_163, A4_164)
  if not Npc._isValid(A0_160) then
    return false
  end
  return (A0_160.generator:getBrain():npcIsSightTarget(A1_161, A2_162, A3_163, A4_164))
end
function Npc.changeEnemy(A0_165)
  if not Npc._isValid(A0_165) then
    return false
  end
  A0_165.generator:getBrain():npcChangeEnemy()
end
function Npc.changeNpc(A0_166)
  if not Npc._isValid(A0_166) then
    return false
  end
  A0_166.generator:getBrain():npcChangeNpc()
end
function Npc.changeMob(A0_167, A1_168)
  if not Npc._isValid(A0_167) then
    return false
  end
end
function Npc.isEnemy(A0_169)
  if not Npc._isValid(A0_169) then
    return false
  end
  return (A0_169.generator:getBrain():npcIsEnemy())
end
function Npc.isActive(A0_170)
  if not Npc._isValid(A0_170) then
    return false
  end
  return (A0_170.generator:getBrain():npcIsReady())
end
function Npc.changeDamageType(A0_171, A1_172)
  if not Npc._isValid(A0_171) then
    return false
  end
  A0_171.generator:getBrain():npcChangeCreateParam(0, A1_172)
end
function Npc.changeGrabbeType(A0_173, A1_174)
  if not Npc._isValid(A0_173) then
    return false
  end
  A0_173.generator:getBrain():npcChangeCreateParam(1, A1_174)
end
function Npc.updatePose(A0_175, A1_176, A2_177, A3_178, A4_179)
  local L5_180, L6_181, L7_182, L8_183
  L5_180 = Npc
  L5_180 = L5_180._isValid
  L6_181 = A0_175
  L5_180 = L5_180(L6_181)
  if not L5_180 then
    L5_180 = false
    return L5_180
  end
  L5_180 = A0_175.generator
  L6_181 = L5_180
  L5_180 = L5_180.getBrain
  L5_180 = L5_180(L6_181)
  if A2_177 == nil then
    L7_182 = L5_180
    L6_181 = L5_180.npcUpdatePose
    L8_183 = A1_176
    L6_181(L7_182, L8_183)
    L5_180 = nil
  else
    L6_181 = 0
    L7_182 = 45
    if A4_179 then
      L6_181 = L7_182
    end
    L8_183 = 60
    L5_180:npcUpdatePose(A1_176, A2_177, A3_178, L6_181, L7_182, L8_183)
    L5_180 = nil
  end
end
function Npc.inform(A0_184, A1_185, A2_186)
  local L3_187, L4_188, L5_189, L6_190, L7_191
  L3_187 = Npc
  L3_187 = L3_187._isValid
  L4_188 = A0_184
  L3_187 = L3_187(L4_188)
  if not L3_187 then
    L3_187 = false
    return L3_187
  end
  L3_187 = A0_184.generator
  L4_188 = L3_187
  L3_187 = L3_187.getBrain
  L3_187 = L3_187(L4_188)
  brain = L3_187
  L3_187 = "inform_in"
  L4_188 = "inform_lp"
  L5_189 = "inform_ed"
  L6_190 = "stay"
  if A2_186 ~= nil then
    L7_191 = A2_186.anim_in
    if L7_191 ~= nil then
      L3_187 = A2_186.anim_in
    end
    L7_191 = A2_186.anim_lp
    if L7_191 ~= nil then
      L4_188 = A2_186.anim_lp
    end
    L7_191 = A2_186.anim_ed
    if L7_191 ~= nil then
      L5_189 = A2_186.anim_ed
    end
    L7_191 = A2_186.anim_stay
    if L7_191 ~= nil then
      L6_190 = A2_186.anim_stay
    end
  end
  L7_191 = {}
  L7_191 = {
    target = A1_185,
    range = -1,
    limit_arm = 45,
    limit_neck = 45,
    limit_spine = 60,
    anim_in = L3_187,
    anim_lp = L4_188,
    anim_ed = L5_189,
    anim_stay = L6_190
  }
  brain:npcInform(L7_191)
  brain = nil
end
function Npc.inform2(A0_192, A1_193)
  local L2_194, L3_195, L4_196, L5_197, L6_198, L7_199, L8_200
  L2_194 = Npc
  L2_194 = L2_194._isValid
  L3_195 = A0_192
  L2_194 = L2_194(L3_195)
  if not L2_194 then
    L2_194 = false
    return L2_194
  end
  L2_194 = A0_192.generator
  L3_195 = L2_194
  L2_194 = L2_194.getBrain
  L2_194 = L2_194(L3_195)
  brain = L2_194
  L2_194, L3_195 = nil, nil
  if A1_193 == nil then
    L4_196 = assert
    L5_197 = A1_193
    L4_196(L5_197)
    return
  end
  L4_196 = A1_193.locator
  if L4_196 ~= nil then
    L4_196 = A1_193.locatorOpt
    if L4_196 ~= nil then
      L4_196 = A1_193.locatorOpt
      L4_196 = L4_196.belong
      if L4_196 == true then
        L4_196 = brain
        L5_197 = L4_196
        L4_196 = L4_196.npcGetSandbox2
        L4_196 = L4_196(L5_197)
        L2_194 = L4_196
      else
        L4_196 = A1_193.locatorOpt
        L4_196 = L4_196.sandbox
        if L4_196 ~= nil then
          L4_196 = A1_193.locatorOpt
          L2_194 = L4_196.sandbox
        end
      end
    end
    if L2_194 == nil then
      L4_196 = findGameObject2
      L5_197 = "Node"
      L6_198 = A1_193.locator
      L4_196 = L4_196(L5_197, L6_198)
      L3_195 = L4_196
    else
      L5_197 = L2_194
      L4_196 = L2_194.findGameObject2
      L6_198 = "Node"
      L7_199 = A1_193.locator
      L4_196 = L4_196(L5_197, L6_198, L7_199)
      L3_195 = L4_196
    end
    L4_196 = assert
    L5_197 = target
    L4_196(L5_197)
  else
    L4_196 = A1_193.pos
    if L4_196 ~= nil then
      L3_195 = A1_193.pos
    else
      L4_196 = A1_193.player
      if L4_196 ~= nil then
        L3_195 = A1_193.player
      end
    end
  end
  L4_196 = "inform_in"
  L5_197 = "inform_lp"
  L6_198 = "inform_ed"
  L7_199 = "stay"
  if A1_193 ~= nil then
    L8_200 = A1_193.anim_in
    if L8_200 ~= nil then
      L4_196 = A1_193.anim_in
    end
    L8_200 = A1_193.anim_lp
    if L8_200 ~= nil then
      L5_197 = A1_193.anim_lp
    end
    L8_200 = A1_193.anim_ed
    if L8_200 ~= nil then
      L6_198 = A1_193.anim_ed
    end
    L8_200 = A1_193.anim_stay
    if L8_200 ~= nil then
      L7_199 = A1_193.anim_stay
    end
  end
  L8_200 = {}
  L8_200 = {
    target = L3_195,
    range = -1,
    limit_arm = 45,
    limit_neck = 45,
    limit_spine = 60,
    anim_in = L4_196,
    anim_lp = L5_197,
    anim_ed = L6_198,
    anim_stay = L7_199
  }
  brain:npcInform(L8_200)
  brain = nil
end
function Npc.notifyInformEnd(A0_201)
  if not Npc._isValid(A0_201) then
    return false
  end
  A0_201.generator:getBrain():npcInformEnd()
end
function Npc.isInformMotionEnd(A0_202)
  if not Npc._isValid(A0_202) then
    return false
  end
  return (A0_202.generator:getBrain():npcIsInformEnd())
end
function Npc.updateInformTarget(A0_203, A1_204)
  local L2_205, L3_206
  L2_205 = Npc
  L2_205 = L2_205._isValid
  L3_206 = A0_203
  L2_205 = L2_205(L3_206)
  if not L2_205 then
    L2_205 = false
    return L2_205
  end
  L2_205 = A0_203.generator
  L3_206 = L2_205
  L2_205 = L2_205.getBrain
  L2_205 = L2_205(L3_206)
  L3_206 = nil
  if A1_204 ~= nil then
    if A1_204.locatorOpt ~= nil then
      if A1_204.locatorOpt.belong == true then
        sb = L2_205:npcGetSandbox2()
      elseif A1_204.locatorOpt.sandbox ~= nil then
        sb = opt.locatorOpt.sandbox
      end
    end
    if A1_204.locator ~= nil then
      if sb == nil then
        L3_206 = findGameObject2("Node", A1_204.locator)
      else
        L3_206 = sb:findGameObject2("Node", A1_204.locator)
      end
      assert(L3_206)
    elseif A1_204.pos ~= nil then
      L3_206 = A1_204.pos
    elseif A1_204.player ~= nil then
      L3_206 = A1_204.player
    end
  end
  L2_205:npcUpdateInformTarget(L3_206)
  L2_205 = nil
end
function Npc.setTurnLimit(A0_207, A1_208)
  if not Npc._isValid(A0_207) then
    return false
  end
  A0_207.turnLimit = A1_208
end
function Npc.isTurn(A0_209, A1_210)
  if not Npc._isValid(A0_209) then
    return false
  end
  return (A0_209.generator:getBrain():npcIsTurn(A1_210, A0_209.turnLimit))
end
function Npc.turn(A0_211, A1_212)
  if not Npc._isValid(A0_211) then
    return false
  end
  A0_211.generator:getBrain():npcTurn(A1_212, A0_211.turnLimit)
end
function Npc.isTurnEnd(A0_213)
  if not Npc._isValid(A0_213) then
    return false
  end
  return (A0_213.generator:getBrain():npcIsTurnEnd())
end
function Npc.turnSimple(A0_214, A1_215)
  local L2_216, L3_217, L4_218, L5_219
  L2_216 = Npc
  L2_216 = L2_216._isValid
  L3_217 = A0_214
  L2_216 = L2_216(L3_217)
  if not L2_216 then
    L2_216 = false
    return L2_216
  end
  L2_216 = A0_214.generator
  L3_217 = L2_216
  L2_216 = L2_216.getBrain
  L2_216 = L2_216(L3_217)
  L3_217 = nil
  L4_218 = ""
  if A1_215 ~= nil then
    L5_219 = A1_215.anim
    if L5_219 ~= nil then
      L4_218 = A1_215.anim
    end
    L5_219 = A1_215.locatorOpt
    if L5_219 ~= nil then
      L5_219 = A1_215.locatorOpt
      L5_219 = L5_219.belong
      if L5_219 == true then
        L5_219 = L2_216.npcGetSandbox2
        L5_219 = L5_219(L2_216)
        L3_217 = L5_219
      else
        L5_219 = A1_215.locatorOpt
        L5_219 = L5_219.sandbox
        if L5_219 ~= nil then
          L5_219 = A1_215.locatorOpt
          L3_217 = L5_219.sandbox
        end
      end
    end
    L5_219 = A1_215.locator
    if L5_219 ~= nil then
      L5_219 = nil
      if L3_217 == nil then
        L5_219 = findGameObject2("Node", A1_215.locator)
      else
        L5_219 = L3_217:findGameObject2("Node", A1_215.locator)
      end
      assert(L5_219)
      L2_216:npcTurn2(L4_218, L5_219)
    else
      L5_219 = A1_215.pos
      if L5_219 ~= nil then
        L5_219 = L2_216.npcTurn2
        L5_219(L2_216, L4_218, A1_215.pos)
      else
        L5_219 = A1_215.degree
        if L5_219 ~= nil then
          L5_219 = L2_216.npcTurn2
          L5_219(L2_216, L4_218, A1_215.degree)
        end
      end
    end
  end
  L2_216 = nil
end
function Npc.isTurnSimpleEnd(A0_220)
  if not Npc._isValid(A0_220) then
    return false
  end
  return (A0_220.generator:getBrain():npcIsTurnEnd2())
end
function Npc.isDamageAction(A0_221)
  if not Npc._isValid(A0_221) then
    return false
  end
  return (A0_221.generator:getBrain():npcIsDamageAction())
end
function Npc.isDamageScript(A0_222)
  if not Npc._isValid(A0_222) then
    return false
  end
  return (A0_222.generator:getBrain():npcIsDamageScript())
end
function Npc.notifyDamageScriptEnd(A0_223)
  if not Npc._isValid(A0_223) then
    return false
  end
  A0_223.generator:getBrain():npcDamageScriptEnd()
end
function Npc.isGrabbedAction(A0_224)
  if not Npc._isValid(A0_224) then
    return false
  end
  return (A0_224.generator:getBrain():npcIsGrabbedAction())
end
function Npc.isGrabbedScript(A0_225)
  if not Npc._isValid(A0_225) then
    return false
  end
  return (A0_225.generator:getBrain():npcIsGrabbedScript())
end
function Npc.notifyGrabbedScriptEnd(A0_226)
  if not Npc._isValid(A0_226) then
    return false
  end
  A0_226.generator:getBrain():npcGrabbedScriptEnd()
end
function Npc.enableHomingTarget(A0_227, A1_228)
  if not Npc._isValid(A0_227) then
    return false
  end
  A0_227.generator:getBrain():npcEnableHomingTarget(A1_228)
end
function Npc.setEnemyGenerator(A0_229, A1_230)
  if not Npc._isValid(A0_229) then
    return false
  end
  A0_229.generator:getBrain():npcSetEnemyGenerator(A1_230)
end
function Npc.pursueFly(A0_231, A1_232, A2_233, A3_234, A4_235)
  local L5_236, L6_237, L7_238, L8_239, L9_240, L10_241, L11_242, L12_243
  L5_236 = Npc
  L5_236 = L5_236._isValid
  L6_237 = A0_231
  L5_236 = L5_236(L6_237)
  if not L5_236 then
    L5_236 = false
    return L5_236
  end
  L5_236 = A0_231.generator
  L6_237 = L5_236
  L5_236 = L5_236.getBrain
  L5_236 = L5_236(L6_237)
  L6_237 = {}
  for L10_241 = 1, #A1_232 do
    L11_242, L12_243 = nil, nil
    if A4_235 ~= nil then
      if A4_235.belong == true then
        L12_243 = L5_236:npcGetSandbox2()
      elseif A4_235.sandbox ~= nil then
        L12_243 = A4_235.sandbox
      end
    end
    if L12_243 == nil then
      L11_242 = findGameObject2("Node", A1_232[L10_241].pos)
    else
      L11_242 = L12_243:findGameObject2("Node", A1_232[L10_241].pos)
    end
    assert(L11_242)
    table.insert(L6_237, {
      position = L11_242,
      attribute = A1_232[L10_241].attr
    })
  end
  L10_241 = 1
  L11_242 = true
  if A2_233 ~= nil then
    L10_241 = A2_233
  end
  if A3_234 ~= nil then
    L11_242 = A3_234
  end
  L12_243 = L5_236.npcBirdFly2
  L12_243(L5_236, L6_237, L7_238, L8_239, L9_240, L10_241, L11_242)
  L5_236 = nil
end
function Npc.isPursueFlyEnd(A0_244)
  if not Npc._isValid(A0_244) then
    return false
  end
  return (A0_244.generator:getBrain():npcIsBirdFlyEnd2())
end
function Npc.wanderFly(A0_245, A1_246, A2_247, A3_248)
  local L4_249, L5_250
  L4_249 = Npc
  L4_249 = L4_249._isValid
  L5_250 = A0_245
  L4_249 = L4_249(L5_250)
  if not L4_249 then
    L4_249 = false
    return L4_249
  end
  L4_249 = A0_245.generator
  L5_250 = L4_249
  L4_249 = L4_249.getBrain
  L4_249 = L4_249(L5_250)
  L5_250 = 2
  L4_249:npcBirdWanderFly(A1_246, A2_247, A3_248, L5_250)
  L4_249 = nil
end
function Npc.setPilot(A0_251, A1_252, A2_253, A3_254)
  local L4_255, L5_256
  L4_255 = Npc
  L4_255 = L4_255._isValid
  L5_256 = A0_251
  L4_255 = L4_255(L5_256)
  if not L4_255 then
    L4_255 = false
    return L4_255
  end
  L4_255 = A0_251.generator
  L5_256 = L4_255
  L4_255 = L4_255.getBrain
  L4_255 = L4_255(L5_256)
  L5_256 = "ve01"
  if A2_253 ~= nil then
    L5_256 = A2_253
  end
  L4_255:npcSetPilot(A1_252:getPuppet(), L5_256, motionName)
  L4_255 = nil
end
function Npc.releasePilot(A0_257)
  if not Npc._isValid(A0_257) then
    return false
  end
  A0_257.generator:getBrain():npcReleasePilot()
end
function Npc.Sit(A0_258, A1_259, A2_260)
  local L3_261, L4_262, L5_263, L6_264, L7_265, L8_266, L9_267, L10_268, L11_269, L12_270, L13_271
  L3_261 = Npc
  L3_261 = L3_261._isValid
  L4_262 = A0_258
  L3_261 = L3_261(L4_262)
  if not L3_261 then
    L3_261 = false
    return L3_261
  end
  L3_261 = A0_258.generator
  L4_262 = L3_261
  L3_261 = L3_261.getBrain
  L3_261 = L3_261(L4_262)
  L4_262 = nil
  L5_263 = ""
  L6_264 = A1_259
  L7_265 = ""
  L8_266, L9_267, L10_268 = nil, nil, nil
  L11_269 = false
  L12_270 = 0.5
  L13_271 = true
  if A2_260 ~= nil then
    if A2_260.anim_in ~= nil then
      L5_263 = A2_260.anim_in
    end
    if A2_260.anim_out ~= nil then
      L7_265 = A2_260.anim_out
    end
    if A2_260.locator ~= nil then
      if A2_260.locatorOpt ~= nil then
        if A2_260.locatorOpt.belong == true then
          L4_262 = L3_261:npcGetSandbox2()
        elseif A2_260.locatorOpt.sandbox ~= nil then
          L4_262 = A2_260.locatorOpt.sandbox
        end
      end
      if L4_262 == nil then
        L8_266 = findGameObject2("Node", A2_260.locator)
      else
        L8_266 = L4_262:findGameObject2("Node", A2_260.locator)
      end
    end
    if A2_260.pos ~= nil then
      L9_267 = A2_260.pos
    end
    if A2_260.rot ~= nil then
      L10_268 = A2_260.rot
    end
    if A2_260.length ~= nil then
      L12_270 = A2_260.length
    end
    if A2_260.noNaviMesh ~= nil and A2_260.noNaviMesh == true then
      L13_271 = false
    end
  end
  L3_261:npcSit(L5_263, L6_264, L7_265, L8_266, L9_267, L10_268, L12_270, L13_271)
  L3_261 = nil
  locator = nil
end
function Npc.SitEnd(A0_272)
  if not Npc._isValid(A0_272) then
    return false
  end
  A0_272.generator:getBrain():npcSitEnd()
end
function Npc.IsSit(A0_273)
  if not Npc._isValid(A0_273) then
    return false
  end
  return (A0_273.generator:getBrain():npcIsSit())
end
function Npc.IsSitDown(A0_274)
  if not Npc._isValid(A0_274) then
    return false
  end
  return (A0_274.generator:getBrain():npcIsSitDown())
end
function Npc.watchPlayer(A0_275)
  if not Npc._isValid(A0_275) then
    return false
  end
  A0_275.generator:getBrain():npcWatch()
end
function Npc.watchPlayerEnd(A0_276)
  if not Npc._isValid(A0_276) then
    return false
  end
  A0_276.generator:getBrain():npcWatchEnd()
end
function Npc.isWatchPlayerEnd(A0_277)
  if not Npc._isValid(A0_277) then
    return false
  end
  return false
end
function Npc.isAimPlayer(A0_278)
  if not Npc._isValid(A0_278) then
    return false
  end
  return (A0_278.generator:getBrain():npcIsAimPlayer())
end
