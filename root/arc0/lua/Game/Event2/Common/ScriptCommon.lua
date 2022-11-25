import("math")
import("EventData")
import("Area")
import("EventHelper")
function Fn_get_distance(A0_0, A1_1)
  return (A0_0 - A1_1):Length()
end
function Fn_get_distance_angle(A0_2, A1_3)
  local L2_4, L3_5, L4_6
  L2_4 = A1_3.x
  L3_5 = A0_2.x
  L2_4 = L2_4 - L3_5
  L3_5 = A1_3.z
  L4_6 = A0_2.z
  L3_5 = L3_5 - L4_6
  L4_6 = math
  L4_6 = L4_6.deg
  return L4_6(math.atan2(L2_4, L3_5))
end
function Fn_get_target_rot(A0_7, A1_8)
  local L2_9, L3_10
  L2_9 = ConjQuat
  L3_10 = A0_7.getWorldRot
  L3_10 = L3_10(A0_7)
  L2_9 = L2_9(L3_10, L3_10(A0_7))
  L3_10 = A0_7.getWorldPos
  L3_10 = L3_10(A0_7)
  L3_10 = A1_8 - L3_10
  L3_10 = L2_9:Apply(L3_10)
  L3_10.y = 0
  L3_10 = L3_10:Normalize()
  return A0_7:getWorldRot() * ArcQuat(Vector(0, 0, 1), L3_10)
end
function Fn_add_rot(A0_11, A1_12, A2_13, A3_14)
  return A0_11 * XYZRotQuaternionEular(A1_12, A2_13, A3_14)
end
function Fn_get_random_index_teble(A0_15, A1_16)
  local L2_17, L3_18, L4_19, L5_20, L6_21
  L2_17 = {}
  for L6_21 = A0_15, A1_16 do
    L2_17[L6_21] = L6_21
  end
  for L6_21 = A0_15, A1_16 do
    L2_17[RandI(A0_15, A1_16)], L2_17[L6_21] = L2_17[L6_21], L2_17[RandI(A0_15, A1_16)]
  end
  return L2_17
end
function Fn_get_shuffle_teble(A0_22)
  local L1_23, L2_24, L3_25
  L1_23 = {
    [3] = L2_24(L3_25)
  }
  L2_24 = table
  L2_24 = L2_24.unpack
  L3_25 = A0_22
  L3_25 = L2_24(L3_25)
  ;({
    [3] = L2_24(L3_25)
  })[1] = L2_24
  ;({
    [3] = L2_24(L3_25)
  })[2] = L3_25
  L2_24 = {}
  L3_25 = 0
  for _FORV_7_, _FORV_8_ in pairs(A0_22) do
    L3_25 = L3_25 + 1
    L2_24[L3_25] = _FORV_7_
  end
  for _FORV_7_, _FORV_8_ in pairs(A0_22) do
    L1_23[_FORV_7_] = L1_23[L2_24[RandI(1, L3_25)]]
    L1_23[L2_24[RandI(1, L3_25)]] = L1_23[_FORV_7_]
  end
  return L1_23
end
function Fn_is_accord_table(A0_26, A1_27)
  local L2_28
  L2_28 = nil
  table.sort(A0_26)
  table.sort(A1_27)
  if #A0_26 > 0 then
    if #A0_26 ~= #A1_27 then
      L2_28 = false
    else
      L2_28 = true
      for _FORV_8_, _FORV_9_ in pairs(A0_26) do
        if _FORV_9_ ~= A1_27[_FORV_8_] then
          L2_28 = false
          break
        end
      end
    end
  end
  return L2_28
end
function Fn_setAlpha(A0_29, A1_30, A2_31, A3_32)
  local L4_33, L5_34
  L4_33 = 10
  if A3_32 ~= nil and A3_32 > 0 then
    L4_33 = A3_32
  end
  if A2_31 ~= nil and A2_31 > 0 then
    L5_34 = A2_31 / L4_33
    for _FORV_9_ = 1, L4_33 do
      if A1_30 == false then
        A0_29:setAlpha(1 - _FORV_9_ / L4_33)
      else
        A0_29:setAlpha(0 + _FORV_9_ / L4_33)
      end
      waitSeconds(L5_34)
    end
  elseif A1_30 == true then
    L5_34 = A0_29.setAlpha
    L5_34(A0_29, 1)
  else
    L5_34 = A0_29.setAlpha
    L5_34(A0_29, 0)
  end
end
function Fn_createWaterCollision(A0_35)
  local L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43, L9_44
  L1_36 = {
    L2_37,
    L3_38,
    L4_39
  }
  L2_37 = "board01"
  L3_38 = "sphere01"
  function L2_37(A0_45, A1_46, A2_47)
    local L3_48
    L3_48 = createGameObject2
    L3_48 = L3_48("GimmickBg")
    L3_48:setName(A1_46 .. "_" .. A2_47)
    L3_48:setCollisionName(A1_46)
    L3_48:setAttributeName("invisible_water_col")
    A0_45:appendChild(L3_48)
    L3_48:setActive(false)
    L3_48:setCollidableBlockEnable(false)
    return L3_48
  end
  create_col = L2_37
  L2_37 = {}
  L3_38 = 1
  for L7_42, L8_43 in L4_39(L5_40) do
    L9_44 = findGameObject2
    L9_44 = L9_44("Node", L8_43)
    if L9_44 ~= nil then
      for _FORV_13_ = 1, #L1_36 do
        if string.find(L8_43, "locator2_wc_" .. L1_36[_FORV_13_]) ~= nil then
          L2_37[L3_38] = create_col(L9_44, "water_" .. L1_36[_FORV_13_] .. "_col", L3_38)
          L3_38 = L3_38 + 1
          break
        end
      end
    end
  end
  return L2_37
end
function Fn_get_abs(A0_49)
  return math.abs(A0_49)
end
function Fn_get_ceil(A0_50)
  return math.ceil(A0_50)
end
function get_ceil(A0_51)
  return math.ceil(A0_51)
end
function load_env(A0_52, A1_53, A2_54)
  local L3_55, L4_56, L5_57
  L3_55 = findGameObject2
  L3_55 = L3_55(L4_56, L5_57)
  if L3_55 ~= nil then
    L4_56(L5_57)
    for _FORV_7_ = 1, 100 do
      if L3_55:isStopped() ~= true then
        wait()
      end
    end
    L3_55 = nil
  end
  L5_57(L4_56)
  return L4_56, L5_57
end
function load_env_area(A0_58, A1_59, A2_60)
  local L3_61, L4_62, L5_63
  L3_61 = load_env
  L4_62 = A0_58
  L5_63 = A1_59
  L4_62 = L3_61(L4_62, L5_63, A2_60)
  L5_63 = EventData
  L5_63 = L5_63.create
  L5_63 = L5_63(L5_63, A1_59, A2_60, L4_62)
  return L3_61, L5_63
end
function load_env_obj(A0_64, A1_65, A2_66)
  local L3_67, L4_68, L5_69
  L3_67 = load_env
  L4_68 = A0_64
  L5_69 = A1_65
  L4_68 = L3_67(L4_68, L5_69, A2_66)
  L5_69 = EventData
  L5_69 = L5_69.create
  L5_69 = L5_69(L5_69, A1_65, nil, L4_68)
  if A2_66 ~= nil then
    A2_66:appendChild(L5_69)
  end
  return L3_67, L5_69
end
function get_gameobj_node(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75
  L1_71 = nil
  if A0_70 ~= "" then
    for L5_75 = 1, 100 do
      L1_71 = findGameObject2("Node", A0_70)
      if L1_71 == nil then
        wait()
      end
    end
  end
  return L1_71
end
function get_gameobj_node_world_pos_rot(A0_76)
  local L1_77, L2_78
  L1_77, L2_78 = nil, nil
  if get_gameobj_node(A0_76) ~= nil then
    L1_77 = get_gameobj_node(A0_76):getWorldPos()
    L2_78 = get_gameobj_node(A0_76):getWorldRot()
  end
  return get_default_pos_rot(L1_77, L2_78)
end
function get_gameobj_node_pos_rot(A0_79)
  local L1_80, L2_81
  L1_80, L2_81 = nil, nil
  if get_gameobj_node(A0_79) ~= nil then
    L1_80 = get_gameobj_node(A0_79):getPos()
    L2_81 = get_gameobj_node(A0_79):getRot()
  end
  return get_default_pos_rot(L1_80, L2_81)
end
function get_move_pos(A0_82, A1_83, A2_84)
  local L3_85, L4_86
  L3_85 = A1_83 - A0_82
  if A2_84 ~= nil then
    L4_86 = L3_85.x
    L4_86 = L4_86 / A2_84
    L3_85.x = L4_86
    L4_86 = L3_85.y
    L4_86 = L4_86 / A2_84
    L3_85.y = L4_86
    L4_86 = L3_85.z
    L4_86 = L4_86 / A2_84
    L3_85.z = L4_86
  end
  return L3_85
end
function get_move_rot(A0_87, A1_88, A2_89)
  if A2_89 ~= nil then
    Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).w = Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).w / A2_89
    Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).x = Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).x / A2_89
    Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).y = Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).y / A2_89
    Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).z = Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z).z / A2_89
  end
  return (Fn_add_rot(A1_88, -A0_87.x, -A0_87.y, -A0_87.z))
end
function set_obj_pos_rot(A0_90, A1_91, A2_92)
  if A0_90 ~= nil and A1_91 ~= nil and A2_92 ~= nil then
    A0_90:setTransform(A1_91, A2_92)
    A0_90:setForceMove()
  end
end
function set_obj_world_pos_rot(A0_93, A1_94, A2_95)
  if A0_93 ~= nil and A1_94 ~= nil and A2_95 ~= nil then
    A0_93:setWorldTransform(A1_94, A2_95)
    A0_93:setForceMove()
  end
end
function obj_move_pos_rot(A0_96, A1_97, A2_98)
  local L3_99, L4_100
  L4_100 = A0_96
  L3_99 = A0_96.getPos
  L3_99 = L3_99(L4_100)
  L3_99 = L3_99 + A1_97
  L4_100 = A0_96.setPos
  L4_100(A0_96, L3_99)
  L4_100 = Fn_add_rot
  L4_100 = L4_100(A0_96:getRot(), A2_98.x, A2_98.y, A2_98.z)
  A0_96:setRot(L4_100)
end
function obj_move_world_pos_rot(A0_101, A1_102, A2_103)
  local L3_104, L4_105
  L4_105 = A0_101
  L3_104 = A0_101.getWorldPos
  L3_104 = L3_104(L4_105)
  L3_104 = L3_104 + A1_102
  L4_105 = Fn_add_rot
  L4_105 = L4_105(A0_101:getWorldRot(), A2_103.x, A2_103.y, A2_103.z)
  A0_101:setWorldTransform(L3_104, L4_105)
  A0_101:setForceMove()
end
function obj_move_world_pos(A0_106, A1_107)
  local L2_108
  L2_108 = A0_106.getWorldPos
  L2_108 = L2_108(A0_106)
  L2_108 = L2_108 + A1_107
  A0_106:setWorldPos(L2_108)
  A0_106:setForceMove()
end
function get_default_pos_rot(A0_109, A1_110)
  if A0_109 == nil or A1_110 == nil then
    A0_109 = Vector(0, 0, 0)
    A1_110 = Quaternion(0, 0, 0, 1)
  end
  return A0_109, A1_110
end
function create_obj(A0_111, A1_112, A2_113, A3_114)
  local L4_115
  L4_115 = createGameObject2
  L4_115 = L4_115("GimmickBg")
  L4_115:setName(A0_111)
  L4_115:setDrawModelName(A1_112)
  L4_115:setCollisionName(A1_112)
  L4_115:setAttributeName(A1_112)
  set_obj_pos_rot(L4_115, A2_113, A3_114)
  return L4_115
end
function start_game_obj()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function create_puppet_only(A0_116, A1_117)
  createGameObject2("Puppet"):setEnableDebugDraw(true)
  createGameObject2("Puppet"):setName(A0_116)
  loadFileAsset("evd", "CharDefs/npc/" .. A1_117):wait()
  createGameObject2("Puppet"):setDescription(loadFileAsset("evd", "CharDefs/npc/" .. A1_117):getRoot())
  createGameObject2("Puppet"):setVisible(true)
  return (createGameObject2("Puppet"))
end
function create_puppet(A0_118, A1_119, A2_120, A3_121, A4_122)
  local L5_123, L6_124, L7_125
  L5_123 = createGameObject2
  L6_124 = "Puppet"
  L5_123 = L5_123(L6_124)
  L7_125 = L5_123
  L6_124 = L5_123.setEnableDebugDraw
  L6_124(L7_125, true)
  L7_125 = L5_123
  L6_124 = L5_123.setName
  L6_124(L7_125, A0_118)
  L6_124 = loadFileAsset
  L7_125 = "evd"
  L6_124 = L6_124(L7_125, "CharDefs/npc/" .. A1_119)
  L7_125 = L6_124.wait
  L7_125(L6_124)
  L7_125 = L5_123.setDescription
  L7_125(L5_123, L6_124:getRoot())
  L7_125 = createGameObject2
  L7_125 = L7_125("ActorBrain")
  L7_125:setName(A0_118 .. "_brain")
  L7_125:try_init()
  L5_123:try_init()
  L7_125:waitForReady()
  L5_123:waitForReady()
  L5_123:setBrain(L7_125)
  if A4_122 ~= nil then
    A4_122:appendChild(L5_123)
  end
  L5_123:setWorldTransform(A2_120, A3_121)
  L5_123:setForceMove()
  L5_123:setVisible(true)
  return L5_123, L7_125
end
function create_node_puppet(A0_126, A1_127, A2_128)
  local L3_129, L4_130, L5_131
  L3_129 = createGameObject2
  L4_130 = "Puppet"
  L3_129 = L3_129(L4_130)
  L5_131 = L3_129
  L4_130 = L3_129.setEnableDebugDraw
  L4_130(L5_131, true)
  L5_131 = L3_129
  L4_130 = L3_129.setName
  L4_130(L5_131, A0_126)
  L4_130 = loadFileAsset
  L5_131 = "evd"
  L4_130 = L4_130(L5_131, "CharDefs/npc/" .. A1_127)
  L5_131 = L4_130.wait
  L5_131(L4_130)
  L5_131 = L3_129.setDescription
  L5_131(L3_129, L4_130:getRoot())
  L5_131 = createGameObject2
  L5_131 = L5_131("ActorBrain")
  L5_131:setName(A0_126 .. "_brain")
  L5_131:try_init()
  L3_129:try_init()
  L5_131:waitForReady()
  L3_129:waitForReady()
  L3_129:setBrain(L5_131)
  if A2_128 ~= nil then
    A2_128:appendChild(L3_129)
  end
  L3_129:setVisible(true)
  return L3_129, L5_131
end
function get_choice_index(A0_132)
  local L1_133, L2_134
  L1_133 = 0
  L2_134 = 0
  for _FORV_6_, _FORV_7_ in pairs(A0_132) do
    L2_134 = L2_134 + _FORV_7_.rate
    L1_133 = L1_133 + 1
  end
  for _FORV_9_, _FORV_10_ in pairs(A0_132) do
  end
  return 1 + 1
end
function Fn_lottery(A0_135)
  local L1_136
  L1_136 = 16777216
  if RandI(L1_136) < A0_135 * L1_136 / 100 then
    return true
  end
  return false
end
