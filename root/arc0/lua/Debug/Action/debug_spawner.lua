import("Debug")
import("math")
import("common")
import("Player")
dofile("/Debug/Action/debug_layout.lua")
dofile("/Game/Supporter/supporter_spawn.lua")
function get_supporter_params_of_crow()
  local L0_0
  L0_0 = {}
  L0_0.pos = Vector(0, 0, 0)
  L0_0.gobj_name = "supporter_crow_00"
  L0_0.brain_name = "CrowBrain"
  L0_0.ai_type_name = "supporter"
  L0_0.model_name = "cro01_base"
  L0_0.yure_name = "cro01_base"
  L0_0.group_name = "supporter"
  L0_0.use_foot_marker = false
  L0_0.use_graph = nil
  L0_0.use_graphs = nil
  L0_0.use_sound = {"player2_se", "player2_vo"}
  L0_0.servant_name = "raven"
  L0_0.use_bullet_provider = true
  L0_0.permit_in_air = true
  L0_0.permit_on_ground = true
  L0_0.param_parallel = Supporter.Crow.get_parallel_params_default()
  L0_0.action_selector = Supporter.Crow.action_selector
  L0_0.assist_selector = Supporter.Crow.assist_selector
  L0_0.reaction_selector = Supporter.Crow.reaction_selector
  L0_0.resource_provider_name = "CrowResourceProvider"
  L0_0.animset_name = "supporter/anim_attrs_supporter_crow"
  L0_0.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_crow"
  L0_0.action_dict_name = "CharDefs/supporter/crow/action_supporter_crow"
  L0_0.chardef_dict_name = "CharDefs/supporter/crow/chardefs_supporter_crow"
  L0_0.attack_dict_name = "CharDefs/supporter/crow/attack_supporter_crow"
  return L0_0
end
function get_supporter_params_of_enemy_crow()
  local L0_1
  L0_1 = {}
  L0_1.pos = Vector(0, 0, 0)
  L0_1.gobj_name = "supporter_crow_00"
  L0_1.brain_name = "CrowBrain"
  L0_1.ai_type_name = "enemy"
  L0_1.model_name = "cro02_base"
  L0_1.yure_name = "cro02_base"
  L0_1.group_name = "enemy"
  L0_1.use_foot_marker = false
  L0_1.use_graph = nil
  L0_1.use_sound = {"player2_se", "player2_vo"}
  L0_1.servant_name = "raven"
  L0_1.use_bullet_provider = true
  L0_1.permit_in_air = true
  L0_1.permit_on_ground = true
  L0_1.param_parallel = Supporter.CrowMask.get_parallel_params_default()
  L0_1.action_selector = Supporter.CrowMask.action_selector
  L0_1.assist_selector = Supporter.CrowMask.assist_selector
  L0_1.reaction_selector = Supporter.CrowMask.reaction_selector
  L0_1.resource_provider_name = "CrowResourceProvider"
  L0_1.animset_name = "supporter/anim_attrs_supporter_crow"
  L0_1.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_crowmask"
  L0_1.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask"
  L0_1.chardef_dict_name = "CharDefs/supporter/crowmask/chardefs_supporter_crowmask"
  L0_1.attack_dict_name = "CharDefs/supporter/crowmask/attack_supporter_crowmask"
  return L0_1
end
function get_supporter_params_of_enemy_kitten()
  local L0_2
  L0_2 = {}
  L0_2.pos = Vector(0, 0, 0)
  L0_2.gobj_name = "supporter_kitten_00"
  L0_2.brain_name = "AnotherKittenBrain2"
  L0_2.ai_type_name = "enemy"
  L0_2.model_name = "oth01_base"
  L0_2.yure_name = "oth01_base"
  L0_2.group_name = "enemy"
  L0_2.use_foot_marker = false
  L0_2.use_graph = nil
  L0_2.use_sound = {"player2_se", "player2_vo"}
  L0_2.servant_name = nill
  L0_2.use_bullet_provider = true
  L0_2.permit_in_air = true
  L0_2.permit_on_ground = true
  L0_2.param_parallel = nil
  L0_2.action_selector = Supporter.Kitten.action_selector
  L0_2.assist_selector = nil
  L0_2.reaction_selector = Supporter.Kitten.reaction_selector
  L0_2.resource_provider_name = "CrowResourceProvider"
  L0_2.animset_name = "supporter/anim_attrs_supporter_kitten"
  L0_2.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_kitten"
  L0_2.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten"
  L0_2.chardef_dict_name = "CharDefs/supporter/kitten/chardefs_supporter_kitten"
  L0_2.attack_dict_name = "CharDefs/supporter/kitten/attack_supporter_kitten"
  return L0_2
end
function spawn_enemy(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17
  L1_4 = print
  L2_5 = "create_enemy"
  L1_4(L2_5)
  L1_4 = A0_3.layout_func
  L2_5 = A0_3.layout_args
  L3_6 = A0_3.layout_args
  L3_6 = L3_6.from_player_distance
  L4_7 = A0_3.enemy_class
  L5_8 = Player
  L6_9 = L5_8
  L5_8 = L5_8.getPuppet
  L5_8 = L5_8(L6_9)
  L6_9 = Debug
  L7_10 = L6_9
  L6_9 = L6_9.getMainViewFront
  L6_9 = L6_9(L7_10)
  L8_11 = L5_8
  L7_10 = L5_8.getWorldPos
  L7_10 = L7_10(L8_11)
  L8_11 = L6_9 * L3_6
  L7_10 = L7_10 + L8_11
  L2_5.origin = L7_10
  L2_5.dir = L6_9
  L8_11 = L1_4
  L8_11 = L8_11(L9_12)
  for L12_15 = 1, #L8_11 do
    L13_16 = L8_11[L12_15]
    L13_16 = L13_16.pos
    L14_17 = L4_7
    debug_create_enemy_async(L13_16.x, L13_16.y, L13_16.z, L14_17)
  end
end
function spawn_supporter(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32
  L1_19 = print
  L2_20 = "create_supporter"
  L1_19(L2_20)
  L1_19 = A0_18.layout_func
  L2_20 = A0_18.layout_args
  L3_21 = A0_18.layout_args
  L3_21 = L3_21.from_player_distance
  L4_22 = Player
  L5_23 = L4_22
  L4_22 = L4_22.getPuppet
  L4_22 = L4_22(L5_23)
  if L4_22 == nil then
    return
  end
  L5_23 = Debug
  L6_24 = L5_23
  L5_23 = L5_23.getMainViewFront
  L5_23 = L5_23(L6_24)
  L7_25 = L4_22
  L6_24 = L4_22.getWorldPos
  L6_24 = L6_24(L7_25)
  L7_25 = L5_23 * L3_21
  L6_24 = L6_24 + L7_25
  L2_20.origin = L6_24
  L2_20.dir = L5_23
  L7_25 = L1_19
  L8_26 = L2_20
  L7_25 = L7_25(L8_26)
  L8_26 = Supporter
  L8_26 = L8_26.Crow
  L8_26 = L8_26.get_parallel_params_default
  L8_26 = L8_26()
  if L9_27 ~= nil then
    L12_30 = "%s"
    L13_31 = A0_18.mars_type
    L9_27(L10_28)
    L9_27.type = L10_28
  end
  for L12_30 = 1, #L7_25 do
    L13_31 = get_supporter_params_of_crow
    L13_31 = L13_31()
    L14_32 = L7_25[L12_30]
    L14_32 = L14_32.pos
    L13_31.pos = L14_32
    L14_32 = A0_18.haunter_type
    L13_31.haunter_type = L14_32
    L14_32 = A0_18.leopard_type
    L13_31.leopard_type = L14_32
    L14_32 = A0_18.haunter_chardef_dict_name
    L13_31.haunter_chardef_dict_name = L14_32
    L14_32 = A0_18.leopard_chardef_dict_name
    L13_31.leopard_chardef_dict_name = L14_32
    L14_32 = A0_18.transform_with_servant
    L13_31.transform_with_servant = L14_32
    L14_32 = A0_18.transform_without_servant
    L13_31.transform_without_servant = L14_32
    L14_32 = A0_18.haunter_anim_set
    L13_31.haunter_anim_set = L14_32
    L14_32 = nil
    if A0_18.with_ghost ~= nil and A0_18.with_ghost == true then
      L14_32 = Supporter.Spawner.create_supporter_crow_ghost(L13_31.pos, L13_31.rot)
    else
      L14_32 = Supporter.Spawner.create_supporter(L13_31)
    end
    L14_32:getBrain():setName(string.format("supporter_crow_%d", Supporter.spawn_count))
    Supporter.spawn_count = Supporter.spawn_count + 1
  end
end
function spawn_supporter_for_only_ground(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46
  L1_34 = print
  L2_35 = "create_supporter"
  L1_34(L2_35)
  L1_34 = A0_33.layout_func
  L2_35 = A0_33.layout_args
  L3_36 = A0_33.layout_args
  L3_36 = L3_36.from_player_distance
  L4_37 = Player
  L5_38 = L4_37
  L4_37 = L4_37.getPuppet
  L4_37 = L4_37(L5_38)
  L5_38 = Debug
  L6_39 = L5_38
  L5_38 = L5_38.getMainViewFront
  L5_38 = L5_38(L6_39)
  L7_40 = L4_37
  L6_39 = L4_37.getWorldPos
  L6_39 = L6_39(L7_40)
  L7_40 = L5_38 * L3_36
  L6_39 = L6_39 + L7_40
  L2_35.origin = L6_39
  L2_35.dir = L5_38
  L7_40 = L1_34
  L8_41 = L2_35
  L7_40 = L7_40(L8_41)
  L8_41 = Supporter
  L8_41 = L8_41.Crow
  L8_41 = L8_41.get_parallel_params_default
  L8_41 = L8_41()
  if L9_42 ~= nil then
    L12_45 = "%s"
    L13_46 = A0_33.mars_type
    L9_42(L10_43)
    L9_42.type = L10_43
  end
  for L12_45 = 1, #L7_40 do
    L13_46 = get_supporter_params_of_crow
    L13_46 = L13_46()
    L13_46.pos = L7_40[L12_45].pos
    Supporter.Spawner.create_supporter(L13_46):getBrain():setName(string.format("supporter_crow_%d", Supporter.spawn_count))
    Supporter.spawn_count = Supporter.spawn_count + 1
  end
end
function spawn_supporter_with_kali(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60
  L1_48 = print
  L2_49 = "create_supporter_with_kali"
  L1_48(L2_49)
  L1_48 = A0_47.layout_func
  L2_49 = A0_47.layout_args
  L3_50 = A0_47.layout_args
  L3_50 = L3_50.from_player_distance
  L4_51 = Player
  L5_52 = L4_51
  L4_51 = L4_51.getPuppet
  L4_51 = L4_51(L5_52)
  L5_52 = Debug
  L6_53 = L5_52
  L5_52 = L5_52.getMainViewFront
  L5_52 = L5_52(L6_53)
  L7_54 = L4_51
  L6_53 = L4_51.getWorldPos
  L6_53 = L6_53(L7_54)
  L7_54 = L5_52 * L3_50
  L6_53 = L6_53 + L7_54
  L2_49.origin = L6_53
  L2_49.dir = L5_52
  L7_54 = L1_48
  L8_55 = L2_49
  L7_54 = L7_54(L8_55)
  L8_55 = Supporter
  L8_55 = L8_55.Crow
  L8_55 = L8_55.get_parallel_params_default
  L8_55 = L8_55()
  if L9_56 ~= nil then
    L12_59 = "%s"
    L13_60 = A0_47.mars_type
    L9_56(L10_57)
    L9_56.type = L10_57
  end
  for L12_59 = 1, #L7_54 do
    L13_60 = get_supporter_params_of_crow
    L13_60 = L13_60()
    L13_60.reaction_selector = Supporter.CrowWithAnge.reaction_selector
    L13_60.pos = L7_54[L12_59].pos
    Supporter.Spawner.create_supporter(L13_60):getBrain():setName(string.format("supporter_crow_%d", Supporter.spawn_count))
    Supporter.spawn_count = Supporter.spawn_count + 1
  end
end
function spawn_crow_of_enemy(A0_61)
  local L1_62, L2_63, L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73, L13_74
  L1_62 = print
  L2_63 = "create_supporter_of_enemy"
  L1_62(L2_63)
  L1_62 = A0_61.layout_func
  L2_63 = A0_61.layout_args
  L3_64 = A0_61.layout_args
  L3_64 = L3_64.from_player_distance
  L4_65 = Player
  L5_66 = L4_65
  L4_65 = L4_65.getPuppet
  L4_65 = L4_65(L5_66)
  L5_66 = Debug
  L6_67 = L5_66
  L5_66 = L5_66.getMainViewFront
  L5_66 = L5_66(L6_67)
  L7_68 = L4_65
  L6_67 = L4_65.getWorldPos
  L6_67 = L6_67(L7_68)
  L7_68 = L5_66 * L3_64
  L6_67 = L6_67 + L7_68
  L2_63.origin = L6_67
  L2_63.dir = L5_66
  L7_68 = L1_62
  L8_69 = L2_63
  L7_68 = L7_68(L8_69)
  L8_69 = Supporter
  L8_69 = L8_69.Crow
  L8_69 = L8_69.get_parallel_params_default
  L8_69 = L8_69()
  if L9_70 ~= nil then
    L12_73 = "%s"
    L13_74 = A0_61.mars_type
    L9_70(L10_71)
    L9_70.type = L10_71
  end
  for L12_73 = 1, #L7_68 do
    L13_74 = get_supporter_params_of_enemy_crow
    L13_74 = L13_74()
    L13_74.pos = L7_68[L12_73].pos
    Supporter.Spawner.create_supporter(L13_74):getBrain():setName(string.format("supporter_crow_%d", Supporter.spawn_count))
    Supporter.spawn_count = Supporter.spawn_count + 1
  end
end
function spawn_crow_with_garuda(A0_75)
  print("spawn_crow_with_garuda")
  A0_75.transform_with_servant = true
  A0_75.transform_without_servant = false
  A0_75.haunter_type = Player.kFelPartsType_GarudaSup
  A0_75.leopard_type = Player.kFelPartsType_GarudaSup
  A0_75.haunter_chardef_dict_name = "/CharDefs/player/feline/gar02"
  A0_75.leopard_chardef_dict_name = "/CharDefs/player/feline/gar01"
  A0_75.haunter_anim_set = "supporter/anim_attrs_supporter_crow"
  return spawn_supporter(A0_75)
end
function spawn_crow_with_ghost(A0_76)
  print("spawn_crow_with_ghost")
  A0_76.with_ghost = true
  return spawn_supporter(A0_76)
end
function spawn_kitten_of_enemy(A0_77)
  local L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86, L10_87, L11_88, L12_89, L13_90
  L1_78 = print
  L2_79 = "create_kitten_of_enemy"
  L1_78(L2_79)
  L1_78 = A0_77.layout_func
  L2_79 = A0_77.layout_args
  L3_80 = A0_77.layout_args
  L3_80 = L3_80.from_player_distance
  L4_81 = Player
  L5_82 = L4_81
  L4_81 = L4_81.getPuppet
  L4_81 = L4_81(L5_82)
  L5_82 = Debug
  L6_83 = L5_82
  L5_82 = L5_82.getMainViewFront
  L5_82 = L5_82(L6_83)
  L7_84 = L4_81
  L6_83 = L4_81.getWorldPos
  L6_83 = L6_83(L7_84)
  L7_84 = L5_82 * L3_80
  L6_83 = L6_83 + L7_84
  L2_79.origin = L6_83
  L2_79.dir = L5_82
  L7_84 = L1_78
  L8_85 = L2_79
  L7_84 = L7_84(L8_85)
  L8_85 = Supporter
  L8_85 = L8_85.Crow
  L8_85 = L8_85.get_parallel_params_default
  L8_85 = L8_85()
  if L9_86 ~= nil then
    L12_89 = "%s"
    L13_90 = A0_77.mars_type
    L9_86(L10_87)
    L9_86.type = L10_87
  end
  for L12_89 = 1, #L7_84 do
    L13_90 = get_supporter_params_of_enemy_kitten
    L13_90 = L13_90()
    L13_90.pos = L7_84[L12_89].pos
    L13_90.haunter_type = A0_77.haunter_type
    L13_90.leopard_type = A0_77.leopard_type
    L13_90.haunter_chardef_dict_name = A0_77.haunter_chardef_dict_name
    L13_90.leopard_chardef_dict_name = A0_77.leopard_chardef_dict_name
    L13_90.transform_with_servant = A0_77.transform_with_servant
    L13_90.transform_without_servant = A0_77.transform_without_servant
    L13_90.haunter_anim_set = A0_77.haunter_anim_set
    if A0_77.transform ~= nil then
      Supporter.Spawner.create_supporter(L13_90):getBrain():requestTransform(A0_77.transform)
    end
    Supporter.Spawner.create_supporter(L13_90):getBrain():setEnemyBossNavi(true)
    Supporter.Spawner.create_supporter(L13_90):getBrain():setName(string.format("supporter_crow_%d", Supporter.spawn_count))
    Supporter.spawn_count = Supporter.spawn_count + 1
  end
end
function spawn_kitten_with_feline(A0_91)
  print("spawn_kitten_with_feline")
  A0_91.transform_with_servant = true
  A0_91.transform_without_servant = false
  A0_91.transform = true
  A0_91.haunter_type = Player.kFelPartsType_FelineSup
  A0_91.leopard_type = Player.kFelPartsType_FelineSup
  A0_91.haunter_chardef_dict_name = "/CharDefs/player/feline/fel02"
  A0_91.leopard_chardef_dict_name = "/CharDefs/player/feline/fel01"
  A0_91.haunter_anim_set = "supporter/anim_attrs_supporter_crow"
  return spawn_kitten_of_enemy(A0_91)
end
function spawn_raven(A0_92)
  local L1_93, L2_94
  L1_93 = print
  L2_94 = "create_supporter_of_raven"
  L1_93(L2_94)
  L1_93 = A0_92.layout_func
  L2_94 = A0_92.layout_args
  L2_94.dir, L2_94.origin = Debug:getMainViewFront(), Player:getPuppet():getWorldPos() + Debug:getMainViewFront() * A0_92.layout_args.from_player_distance
  if A0_92.mars_type ~= nil then
    print("args.mars_type: " .. string.format("%s", A0_92.mars_type))
    Supporter.Crow.get_parallel_params_default().fall_kick.mars.type = A0_92.mars_type
  end
  for _FORV_12_ = 1, #L1_93(L2_94) do
    Supporter.Spawner.create_supporter_raven(L1_93(L2_94)[_FORV_12_].pos, false):getBrain():setName(string.format("supporter_crow_%d", Supporter.spawn_count))
    Supporter.spawn_count = Supporter.spawn_count + 1
  end
end
function spawn_cat(A0_95)
  local L1_96, L2_97
  L1_96 = print
  L2_97 = "create_supporter_of_cat"
  L1_96(L2_97)
  L1_96 = A0_95.layout_func
  L2_97 = A0_95.layout_args
  L2_97.dir, L2_97.origin = Debug:getMainViewFront(), Player:getPuppet():getWorldPos() + Debug:getMainViewFront() * A0_95.layout_args.from_player_distance
  if A0_95.mars_type ~= nil then
    print("args.mars_type: " .. string.format("%s", A0_95.mars_type))
    Supporter.Crow.get_parallel_params_default().fall_kick.mars.type = A0_95.mars_type
  end
  for _FORV_12_ = 1, #L1_96(L2_97) do
    Supporter.Spawner.create_supporter_cat(L1_96(L2_97)[_FORV_12_].pos, false):getBrain():setName(string.format("supporter_crow_%d", Supporter.spawn_count))
    Supporter.spawn_count = Supporter.spawn_count + 1
  end
end
function spawn_breakable(A0_98)
  local L1_99, L2_100, L3_101, L4_102, L5_103, L6_104, L7_105, L8_106, L9_107, L10_108, L11_109, L12_110, L13_111, L14_112
  L1_99 = print
  L2_100 = "spawn_breakable"
  L1_99(L2_100)
  L1_99 = A0_98.layout_func
  L2_100 = A0_98.layout_args
  L3_101 = A0_98.layout_args
  L3_101 = L3_101.from_player_distance
  L4_102 = Player
  L5_103 = L4_102
  L4_102 = L4_102.getPuppet
  L4_102 = L4_102(L5_103)
  L5_103 = Debug
  L6_104 = L5_103
  L5_103 = L5_103.getMainViewFront
  L5_103 = L5_103(L6_104)
  L7_105 = L4_102
  L6_104 = L4_102.getWorldPos
  L6_104 = L6_104(L7_105)
  L7_105 = L5_103 * L3_101
  L6_104 = L6_104 + L7_105
  L7_105 = Vector
  L7_105 = L7_105(L8_106, L9_107, L10_108)
  L6_104 = L6_104 + L7_105
  L2_100.origin = L6_104
  L2_100.dir = L5_103
  L7_105 = L1_99
  L7_105 = L7_105(L8_106)
  for L11_109 = 1, #L7_105 do
    L12_110 = "apple_kn_01_base"
    L13_111 = A0_98.object_list
    L14_112 = nill
    if L13_111 ~= L14_112 then
      L13_111 = A0_98.object_list
      L13_111 = #L13_111
      L14_112 = RandI
      L14_112 = L14_112(L13_111)
      L12_110 = A0_98.object_list[L14_112]
    end
    L13_111 = createGameObject2
    L14_112 = "GimmickBg"
    L13_111 = L13_111(L14_112)
    L14_112 = L13_111.setDrawModelName
    L14_112(L13_111, L12_110)
    L14_112 = L13_111.setCollisionName
    L14_112(L13_111, L12_110)
    L14_112 = L13_111.setAttributeName
    L14_112(L13_111, L12_110)
    L14_112 = L13_111.setVisibleBlockEnable
    L14_112(L13_111, false)
    L14_112 = L7_105[L11_109]
    L14_112 = L14_112.pos
    L13_111:setPos(L14_112)
    L13_111:try_init()
    while not L13_111:isReady() do
      wait()
    end
    L13_111:try_start()
  end
end
function spawn_breakable_random(A0_113)
  if A0_113.object_list == nil then
    A0_113.object_list = {
      "woodbox_kk_01",
      "woodbox_kk_02"
    }
  end
  spawn_breakable(A0_113)
end
function spawn_debri(A0_114)
  local L1_115, L2_116, L3_117, L4_118, L5_119, L6_120, L7_121, L8_122, L9_123, L10_124, L11_125, L12_126, L13_127, L14_128
  L1_115 = print
  L2_116 = "spawn_debri"
  L1_115(L2_116)
  L1_115 = A0_114.layout_func
  L2_116 = A0_114.layout_args
  L3_117 = A0_114.layout_args
  L3_117 = L3_117.from_player_distance
  L4_118 = Player
  L5_119 = L4_118
  L4_118 = L4_118.getPuppet
  L4_118 = L4_118(L5_119)
  L5_119 = Debug
  L6_120 = L5_119
  L5_119 = L5_119.getMainViewFront
  L5_119 = L5_119(L6_120)
  L7_121 = L4_118
  L6_120 = L4_118.getWorldPos
  L6_120 = L6_120(L7_121)
  L7_121 = L5_119 * L3_117
  L6_120 = L6_120 + L7_121
  L7_121 = Vector
  L7_121 = L7_121(L8_122, L9_123, L10_124)
  L6_120 = L6_120 + L7_121
  L2_116.origin = L6_120
  L2_116.dir = L5_119
  L7_121 = L1_115
  L7_121 = L7_121(L8_122)
  for L11_125 = 1, #L7_121 do
    L12_126 = "apple_kn_01_base"
    L13_127 = A0_114.object_list
    L14_128 = nill
    if L13_127 ~= L14_128 then
      L13_127 = A0_114.object_list
      L13_127 = #L13_127
      L14_128 = RandI
      L14_128 = L14_128(L13_127)
      L12_126 = A0_114.object_list[L14_128]
    end
    L13_127 = createGameObject2
    L14_128 = "GimmickBg"
    L13_127 = L13_127(L14_128)
    L14_128 = L13_127.setDrawModelName
    L14_128(L13_127, L12_126)
    L14_128 = L13_127.setCollisionName
    L14_128(L13_127, L12_126)
    L14_128 = L13_127.setAttributeName
    L14_128(L13_127, L12_126)
    L14_128 = L13_127.setVisibleBlockEnable
    L14_128(L13_127, false)
    L14_128 = L7_121[L11_125]
    L14_128 = L14_128.pos
    L13_127:setPos(L14_128)
    L13_127:try_init()
    while not L13_127:isReady() do
      wait()
    end
    L13_127:try_start()
    L13_127:requestBreak(L14_128, 5)
  end
end
function spawn_debri_random(A0_129)
  if A0_129.object_list == nil then
    A0_129.object_list = {
      "woodbox_kk_01",
      "woodbox_kk_02"
    }
  end
  spawn_debri(A0_129)
end
function spawn_clone_debri(A0_130)
  local L1_131, L2_132, L3_133, L4_134, L5_135, L6_136, L7_137, L8_138, L9_139, L10_140, L11_141, L12_142, L13_143, L14_144
  L1_131 = print
  L2_132 = "spawn_clone_debri"
  L1_131(L2_132)
  L1_131 = A0_130.layout_func
  L2_132 = A0_130.layout_args
  L3_133 = A0_130.layout_args
  L3_133 = L3_133.from_player_distance
  L4_134 = Player
  L5_135 = L4_134
  L4_134 = L4_134.getPuppet
  L4_134 = L4_134(L5_135)
  L5_135 = Debug
  L6_136 = L5_135
  L5_135 = L5_135.getMainViewFront
  L5_135 = L5_135(L6_136)
  L7_137 = L4_134
  L6_136 = L4_134.getWorldPos
  L6_136 = L6_136(L7_137)
  L7_137 = L5_135 * L3_133
  L6_136 = L6_136 + L7_137
  L7_137 = Vector
  L7_137 = L7_137(L8_138, L9_139, L10_140)
  L6_136 = L6_136 + L7_137
  L2_132.origin = L6_136
  L2_132.dir = L5_135
  L7_137 = L1_131
  L7_137 = L7_137(L8_138)
  for L11_141 = 1, #L7_137 do
    L12_142 = "apple_kn_01_base"
    L13_143 = A0_130.object_list
    L14_144 = nill
    if L13_143 ~= L14_144 then
      L13_143 = A0_130.object_list
      L13_143 = #L13_143
      L14_144 = RandI
      L14_144 = L14_144(L13_143)
      L12_142 = A0_130.object_list[L14_144]
    end
    L13_143 = createGameObject2
    L14_144 = "GimmickBg"
    L13_143 = L13_143(L14_144)
    L14_144 = L13_143.setDrawModelName
    L14_144(L13_143, L12_142)
    L14_144 = L13_143.setCollisionName
    L14_144(L13_143, L12_142)
    L14_144 = L13_143.setAttributeName
    L14_144(L13_143, L12_142)
    L14_144 = L7_137[L11_141]
    L14_144 = L14_144.pos
    L13_143:setPos(L14_144)
    L13_143:try_init()
    while not L13_143:isReady() do
      wait()
    end
    L13_143:try_start()
    createGameObject2("CloneDebri"):setGimmickBG(L13_143)
    createGameObject2("CloneDebri"):try_init()
    while not createGameObject2("CloneDebri"):isReady() do
      wait()
    end
    createGameObject2("CloneDebri"):setPos(L14_144)
    createGameObject2("CloneDebri"):try_start()
  end
end
function spawn_clone_debri_random(A0_145)
  if A0_145.object_list == nil then
    A0_145.object_list = {
      "woodbox_kk_01",
      "woodbox_kk_02",
      "apple_kn_01_base",
      "dust_iy_01"
    }
  end
  spawn_clone_debri(A0_145)
end
