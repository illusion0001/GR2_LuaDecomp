import("math")
import("common")
import("Sound")
import("Player")
dofile("/Game/Supporter/supporter_common.lua")
dofile("/Game/Supporter/supporter_area.lua")
dofile("/Game/Supporter/Crow/selector_supporter_crow.lua")
dofile("/Game/Supporter/CrowMask/selector_supporter_crowmask.lua")
dofile("/Game/Supporter/AnotherKitten/selector_supporter_kitten.lua")
dofile("/Game/Misc/felgar.lua")
function Supporter.Spawner.get_supporter_params_of_crow()
  local L0_0
  L0_0 = {}
  L0_0.pos = Vector(0, 0, 0)
  L0_0.rot = YRotQuaternion(Deg2Rad(0))
  L0_0.gobj_name = "supporter_crow"
  L0_0.gobj_name = "supporter_crow"
  L0_0.brain_name = "CrowBrain"
  L0_0.ai_type_name = "supporter"
  L0_0.model_name = "cro01_base"
  L0_0.yure_name = "cro01_base"
  L0_0.group_name = "supporter"
  L0_0.servant_name = "raven"
  L0_0.use_foot_marker = false
  L0_0.use_graph = nil
  L0_0.use_graphs = nil
  L0_0.use_sound = nil
  L0_0.use_bullet_provider = true
  L0_0.permit_in_air = true
  L0_0.permit_on_ground = true
  L0_0.first_action = Supporter.FirstAction.Ground
  L0_0.param_parallel = Supporter.Crow.get_parallel_params_default()
  L0_0.action_selector = Supporter.Crow.action_selector
  L0_0.assist_selector = Supporter.Crow.assist_selector
  L0_0.reaction_selector = Supporter.Crow.reaction_selector
  L0_0.resource_provider_name = "CrowResourceProvider"
  L0_0.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_crow"
  L0_0.animset_name = "supporter/anim_attrs_supporter_crow"
  L0_0.action_dict_name = "CharDefs/supporter/crow/action_supporter_crow"
  L0_0.chardef_dict_name = "CharDefs/supporter/crow/chardefs_supporter_crow"
  L0_0.attack_dict_name = "CharDefs/supporter/crow/attack_supporter_crow"
  return L0_0
end
function Supporter.Spawner.get_supporter_params_of_kitten()
  local L0_1
  L0_1 = {}
  L0_1.pos = Vector(0, 0, 0)
  L0_1.rot = YRotQuaternion(Deg2Rad(0))
  L0_1.gobj_name = "another_kit"
  L0_1.brain_name = "AnotherKittenBrain2"
  L0_1.ai_type_name = "enemy"
  L0_1.model_name = "oth01_base"
  L0_1.yure_name = "oth01_base"
  L0_1.group_name = "enemy"
  L0_1.use_foot_marker = false
  L0_1.use_graph = nil
  L0_1.use_sound = nil
  L0_1.servant_name = nil
  L0_1.use_bullet_provider = true
  L0_1.permit_in_air = true
  L0_1.permit_on_ground = true
  L0_1.first_action = _first_action
  L0_1.param_parallel = nil
  L0_1.action_selector = Supporter.Kitten.action_selector
  L0_1.assist_selector = nil
  L0_1.reaction_selector = Supporter.Kitten.reaction_selector
  L0_1.resource_provider_name = "CrowResourceProvider"
  L0_1.animset_name = "supporter/anim_attrs_supporter_kitten"
  L0_1.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_kitten"
  L0_1.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten"
  L0_1.chardef_dict_name = "CharDefs/supporter/kitten/chardefs_supporter_kitten"
  L0_1.attack_dict_name = "CharDefs/supporter/kitten/attack_supporter_kitten"
  L0_1.haunter_type = nil
  L0_1.leopard_type = nil
  return L0_1
end
function _create_puppet(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = loadFileAsset
  L2_4 = "evd"
  L3_5 = A0_2.chardef_dict_name
  L1_3 = L1_3(L2_4, L3_5)
  L3_5 = L1_3
  L2_4 = L1_3.wait
  L2_4(L3_5)
  L2_4 = createGameObject2
  L3_5 = "Puppet"
  L2_4 = L2_4(L3_5)
  L3_5 = L2_4.loadModel
  L3_5(L2_4, A0_2.model_name)
  L3_5 = L2_4.loadBaseSkeleton
  L3_5(L2_4, A0_2.model_name, A0_2.yure_name)
  L3_5 = L2_4.setWorldPos
  L3_5(L2_4, A0_2.pos)
  L3_5 = L2_4.setWorldRot
  L3_5(L2_4, A0_2.rot)
  L3_5 = L2_4.setForceMove
  L3_5(L2_4)
  L3_5 = L2_4.setName
  L3_5(L2_4, "_puppet_" .. A0_2.gobj_name)
  L3_5 = L2_4.setDescription
  L3_5(L2_4, L1_3:getRoot())
  L3_5 = L2_4.setUseAnimLocomotion
  L3_5(L2_4, true)
  L3_5 = A0_2.animset_name
  loadFileAsset("evd", "AnimAttrs/" .. L3_5):wait()
  L2_4:loadPoseAnimationSet(L3_5)
  L2_4:try_init()
  while not L2_4:isReady() do
    wait()
  end
  while L2_4:isLoading() do
    wait()
  end
  L2_4:try_start()
  L2_4:setVisible(false)
  return L2_4
end
function Supporter.create_haunter_brain(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = Felgar
  L2_8 = L1_7
  L1_7 = L1_7.createHaunter
  L3_9 = A0_6.main_puppet
  L1_7 = L1_7(L2_8, L3_9, A0_6.haunter_type)
  L3_9 = L1_7
  L2_8 = L1_7.waitForReady
  L2_8(L3_9)
  L3_9 = L1_7
  L2_8 = L1_7.try_start
  L2_8(L3_9)
  while true do
    L3_9 = L1_7
    L2_8 = L1_7.getGizmo
    L2_8 = L2_8(L3_9)
    if nil == L2_8 then
      L2_8 = wait
      L2_8()
    end
  end
  L3_9 = L1_7
  L2_8 = L1_7.getGizmo
  L2_8 = L2_8(L3_9)
  L3_9 = L2_8.setVisible
  L3_9(L2_8, false)
  L3_9 = A0_6.haunter_anim_set
  if L3_9 ~= nil then
    L3_9 = A0_6.haunter_anim_set
    loadFileAsset("evd", "AnimAttrs/" .. L3_9):wait()
    L2_8:loadPoseAnimationSet(L3_9)
    while L2_8:isLoading() do
      wait()
    end
  end
  return L1_7
end
function Supporter.create_leopard_brain(A0_10)
  Felgar:createLeopard(A0_10.main_puppet, A0_10.leopard_type):waitForReady()
  Felgar:createLeopard(A0_10.main_puppet, A0_10.leopard_type):try_start()
  return (Felgar:createLeopard(A0_10.main_puppet, A0_10.leopard_type))
end
function Supporter.create_brain(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = createGameObject2
  L2_13 = A0_11.brain_name
  L1_12 = L1_12(L2_13)
  L2_13 = L1_12.setName
  L2_13(L3_14, L4_15)
  L2_13 = L1_12.try_init
  L2_13(L3_14)
  while true do
    L2_13 = L1_12.isReady
    L2_13 = L2_13(L3_14)
    if not L2_13 then
      L2_13 = wait
      L2_13()
    end
  end
  L2_13 = Supporter
  L2_13 = L2_13.create_resource_provider
  L2_13 = L2_13(L3_14)
  L3_14(L4_15, L5_16)
  L3_14(L4_15)
  if L3_14 ~= nil then
    L3_14(L4_15, L5_16)
  end
  if L3_14 ~= nil then
    L3_14(L4_15, L5_16)
  end
  if L3_14 ~= nil then
    L3_14(L4_15, L5_16, L6_17)
  end
  if L3_14 ~= nil then
    L3_14(L4_15, L5_16, L6_17)
  end
  if L3_14 ~= nil then
    L3_14(L4_15, L5_16, L6_17)
  end
  if L3_14 ~= nil then
    L3_14(L4_15, L5_16, L6_17)
  end
  if L3_14 ~= nil then
    L3_14(L4_15, L5_16, L6_17)
  end
  if L3_14 == true then
    L4_15(L5_16, L6_17)
  end
  if L3_14 ~= nil then
    L4_15(L5_16, L6_17)
  end
  if L3_14 ~= nil then
    L4_15(L5_16, L6_17)
  end
  if L3_14 ~= nil then
    for L7_18, L8_19 in L4_15(L5_16) do
      L9_20 = L8_19
      L1_12:addGraph(L9_20)
    end
  end
  if L3_14 ~= nil then
    for L6_17, L7_18 in L3_14(L4_15) do
      L9_20 = L1_12
      L8_19 = L1_12.addSoundResourceName
      L8_19(L9_20, L7_18)
    end
  end
  return L1_12
end
function Supporter.create_resource_provider(A0_21)
  local L1_22
  L1_22 = A0_21.resource_provider_name
  print(string.format("name:%s", L1_22))
  print(string.format("attack:%s", A0_21.attack_dict_name))
  print(string.format("anim_joint:%s", A0_21.anim_joint_dict_name))
  createGameObject2(L1_22):setName("supporter_resource_provider")
  if A0_21.anim_joint_dict_name ~= nil then
    createGameObject2(L1_22):pushDictionary("anim_joint_dict", A0_21.anim_joint_dict_name)
  end
  if A0_21.attack_dict_name ~= nil then
    createGameObject2(L1_22):pushDictionary("attack_dict", A0_21.attack_dict_name)
  end
  if A0_21.action_dict_name ~= nil then
    createGameObject2(L1_22):pushDictionary("action_dict", A0_21.action_dict_name)
  end
  createGameObject2(L1_22):try_init()
  while not createGameObject2(L1_22):isReady() do
    wait()
  end
  createGameObject2(L1_22):try_start()
  return (createGameObject2(L1_22))
end
function Supporter.create_bullets()
  local L0_23, L1_24
  L0_23 = createGameObject2
  L1_24 = "CrowBulletProvider"
  L0_23 = L0_23(L1_24)
  L1_24 = L0_23.setName
  L1_24(L0_23, "_bullets_crow")
  L1_24 = {
    {
      purpose = Supporter.Purpose.Common,
      name = "barrel_kk_01",
      model_name = "barrel_kk_01",
      collision_name = "barrel_kk_01",
      attribute_name = "barrel_kk_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = YRotQuaternion(Deg2Rad(0))
    },
    {
      purpose = Supporter.Purpose.Common,
      name = "woodbox_sk_01",
      model_name = "woodbox_sk_01",
      collision_name = "woodbox_sk_01",
      attribute_name = "woodbox_sk_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = YRotQuaternion(Deg2Rad(0)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowShoot,
      name = "crw_g1_manekin_pd_01",
      model_name = "g1_manekin_pd_01",
      collision_name = "g1_manekin_pd_01",
      attribute_name = "g1_manekin_pd_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowShoot,
      name = "crw_gasbombe_oc_01",
      model_name = "gasbombe_oc_01",
      collision_name = "gasbombe_oc_01",
      attribute_name = "gasbombe_oc_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowShoot,
      name = "crw_nvtre01rock01",
      model_name = "nvtre01rock01",
      collision_name = "nvtre01rock01",
      attribute_name = "nvtre01rock01",
      posLS = Vector(0, 2.5, 0),
      rotLS = YRotQuaternion(Deg2Rad(0)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowShoot,
      name = "steeldrum_kk_01",
      model_name = "steeldrum_kk_01",
      collision_name = "steeldrum_kk_01",
      attribute_name = "steeldrum_kk_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowShoot,
      name = "steeldrum_kk_02",
      model_name = "steeldrum_kk_02",
      collision_name = "steeldrum_kk_02",
      attribute_name = "steeldrum_kk_02",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowMaskShoot,
      name = "bomb_yj_01",
      model_name = "bomb_yj_01",
      collision_name = "bomb_yj_01",
      attribute_name = "bomb_yj_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowMaskShoot,
      name = "gasbombe_oc_01",
      model_name = "gasbombe_oc_01",
      collision_name = "gasbombe_oc_01",
      attribute_name = "gasbombe_oc_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowMaskShoot,
      name = "gasbombe_oc_02",
      model_name = "gasbombe_oc_02",
      collision_name = "gasbombe_oc_02",
      attribute_name = "gasbombe_oc_02",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowMaskShoot,
      name = "gasbombe_oc_03",
      model_name = "gasbombe_oc_03",
      collision_name = "gasbombe_oc_03",
      attribute_name = "gasbombe_oc_03",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.CrowMaskShoot,
      name = "gasbombe_oc_04",
      model_name = "gasbombe_oc_04",
      collision_name = "gasbombe_oc_04",
      attribute_name = "gasbombe_oc_04",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.Kitten,
      name = "himmeli",
      model_name = "az3_himmeli_oc_06",
      collision_name = "az3_himmeli_oc_06",
      attribute_name = "az3_himmeli_oc_06",
      posLS = Vector(0, 2.5, 0),
      rotLS = XRotQuaternion(Deg2Rad(-90)),
      effect_scale = 1
    },
    {
      purpose = Supporter.Purpose.Garuda,
      name = "grd_woodbox_sk_01",
      model_name = "woodbox_sk_01",
      collision_name = "woodbox_sk_01",
      attribute_name = "woodbox_sk_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = YRotQuaternion(Deg2Rad(0))
    },
    {
      purpose = Supporter.Purpose.CrowTyphoon,
      name = "typh_barrel_kk_01",
      model_name = "barrel_kk_01",
      collision_name = "barrel_kk_01",
      attribute_name = "barrel_kk_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = YRotQuaternion(Deg2Rad(0))
    },
    {
      purpose = Supporter.Purpose.CrowTyphoon,
      name = "typh_woodbox_sk_01",
      model_name = "woodbox_sk_01",
      collision_name = "woodbox_sk_01",
      attribute_name = "woodbox_sk_01",
      posLS = Vector(0, 2.5, 0),
      rotLS = YRotQuaternion(Deg2Rad(0))
    }
  }
  L0_23:setBgobjInfo(L1_24)
  L0_23:try_init()
  while not L0_23:isReady() do
    wait()
  end
  L0_23:try_start()
  return L0_23
end
function create_stalker()
  createGameObject2("SupporterStalker"):setName("_stalker")
  createGameObject2("SupporterStalker"):setDistBtwPoints(5)
  createGameObject2("SupporterStalker"):setMaxPointCount(50)
  createGameObject2("SupporterStalker"):try_init()
  while not createGameObject2("SupporterStalker"):isReady() do
    wait()
  end
  createGameObject2("SupporterStalker"):try_start()
  return (createGameObject2("SupporterStalker"))
end
function Supporter.create_foot_marker()
  createGameObject2("FootMarker"):setName("_stalker")
  createGameObject2("FootMarker"):setDistBtwPoints(5)
  createGameObject2("FootMarker"):setMaxPointCount(50)
  createGameObject2("FootMarker"):try_init()
  while not createGameObject2("FootMarker"):isReady() do
    wait()
  end
  createGameObject2("FootMarker"):try_start()
  return (createGameObject2("FootMarker"))
end
function Supporter.Spawner.create_supporter(A0_25)
  local L1_26, L2_27, L3_28, L4_29
  L1_26 = {}
  L2_27 = A0_25.pos
  L1_26.pos = L2_27
  L2_27 = A0_25.rot
  L1_26.rot = L2_27
  L2_27 = A0_25.gobj_name
  L1_26.gobj_name = L2_27
  L2_27 = A0_25.ai_type_name
  L1_26.ai_type_name = L2_27
  L2_27 = A0_25.group_name
  L1_26.group_name = L2_27
  L2_27 = A0_25.brain_name
  L1_26.brain_name = L2_27
  L2_27 = A0_25.model_name
  L1_26.model_name = L2_27
  L2_27 = A0_25.yure_name
  L1_26.yure_name = L2_27
  L2_27 = A0_25.use_foot_marker
  L1_26.use_foot_marker = L2_27
  L2_27 = A0_25.use_graph
  L1_26.use_graph = L2_27
  L2_27 = A0_25.use_graphs
  L1_26.use_graphs = L2_27
  L2_27 = A0_25.use_sound
  L1_26.use_sound = L2_27
  L2_27 = A0_25.servant_name
  L1_26.servant_name = L2_27
  L2_27 = A0_25.use_bullet_provider
  L1_26.use_bullet_provider = L2_27
  L2_27 = A0_25.animset_name
  L1_26.animset_name = L2_27
  L2_27 = A0_25.param_parallel
  L1_26.param_parallel = L2_27
  L2_27 = A0_25.action_selector
  L1_26.action_selector = L2_27
  L2_27 = A0_25.assist_selector
  L1_26.assist_selector = L2_27
  L2_27 = A0_25.reaction_selector
  L1_26.reaction_selector = L2_27
  L2_27 = A0_25.permit_in_air
  L1_26.permit_in_air = L2_27
  L2_27 = A0_25.permit_on_ground
  L1_26.permit_on_ground = L2_27
  L2_27 = A0_25.first_action
  L1_26.first_action = L2_27
  L2_27 = A0_25.resource_provider_name
  L1_26.resource_provider_name = L2_27
  L2_27 = A0_25.anim_joint_dict_name
  L1_26.anim_joint_dict_name = L2_27
  L2_27 = A0_25.chardef_dict_name
  L1_26.chardef_dict_name = L2_27
  L2_27 = A0_25.action_dict_name
  L1_26.action_dict_name = L2_27
  L2_27 = A0_25.attack_dict_name
  L1_26.attack_dict_name = L2_27
  L2_27 = A0_25.haunter_type
  L1_26.haunter_type = L2_27
  L2_27 = A0_25.leopard_type
  L1_26.leopard_type = L2_27
  L2_27 = A0_25.haunter_anim_set
  L1_26.haunter_anim_set = L2_27
  L2_27 = A0_25.transform_with_servant
  L1_26.transform_with_servant = L2_27
  L2_27 = A0_25.transform_without_servant
  L1_26.transform_without_servant = L2_27
  L2_27 = A0_25.transform
  L1_26.transform = L2_27
  L2_27 = _create_puppet
  L3_28 = L1_26
  L2_27 = L2_27(L3_28)
  L1_26.main_puppet = L2_27
  L3_28 = Supporter
  L3_28 = L3_28.create_brain
  L4_29 = L1_26
  L3_28 = L3_28(L4_29)
  L4_29 = L2_27.setBrain
  L4_29(L2_27, L3_28)
  L4_29 = L1_26.ai_type_name
  if L4_29 ~= nil then
    L4_29 = L3_28.setAITypeByName
    L4_29(L3_28, L1_26.ai_type_name)
  end
  L4_29 = L1_26.use_bullet_provider
  if L4_29 == true then
    L4_29 = Supporter
    L4_29 = L4_29.create_bullets
    L4_29 = L4_29()
    L3_28:setBullets(L4_29)
  end
  L4_29 = L1_26.servant_name
  if L4_29 ~= nil then
    L4_29 = L1_26.servant_name
    if L4_29 == "raven" then
      L4_29 = L1_26.pos
      L4_29 = L4_29 + Vector(0, 2, 0)
      L1_26.pos = L4_29
      L4_29 = Supporter
      L4_29 = L4_29.Spawner
      L4_29 = L4_29.create_supporter_raven
      L4_29 = L4_29(L1_26.pos, L1_26.rot, false)
      L4_29:getBrain():setOwner(L2_27)
      L3_28:setServant(L4_29:getBrain())
    end
  end
  L4_29 = L1_26.transform_with_servant
  if L4_29 ~= nil then
    L4_29 = L3_28.setAbility
    L4_29(L3_28, Supporter.Ability.TransformWithServant, L1_26.transform_with_servant)
  end
  L4_29 = L1_26.transform_without_servant
  if L4_29 ~= nil then
    L4_29 = L3_28.setAbility
    L4_29(L3_28, Supporter.Ability.TransformWithoutServant, L1_26.transform_without_servant)
  end
  L4_29 = L1_26.assist_selector
  if L4_29 ~= nil then
    L4_29 = L3_28.activateAssistSelector
    L4_29(L3_28, true)
  end
  L4_29 = L1_26.action_selector
  if L4_29 ~= nil then
    L4_29 = L3_28.activateActionSelector
    L4_29(L3_28, true)
  end
  L4_29 = L1_26.reaction_selector
  if L4_29 ~= nil then
    L4_29 = L3_28.activateReactionSelector
    L4_29(L3_28, true)
  end
  while true do
    L4_29 = L3_28.isActive
    L4_29 = L4_29(L3_28)
    if L4_29 == false then
      L4_29 = wait
      L4_29()
    end
  end
  if L3_28 ~= nil then
    L4_29 = L3_28.setIdling
    L4_29(L3_28, false)
  end
  L4_29 = L1_26.transform
  if L4_29 ~= nil then
    L4_29 = L3_28.requestTransform
    L4_29(L3_28, L1_26.transform)
  end
  L4_29 = L2_27.setVisible
  L4_29(L2_27, true)
  return L2_27
end
function Supporter.Spawner.create_supporter_crow_to_node(A0_30, A1_31, A2_32, A3_33, A4_34)
  local L5_35, L6_36
  L6_36 = A0_30
  L5_35 = A0_30.getWorldPos
  L5_35 = L5_35(L6_36)
  L6_36 = A0_30.getWorldRot
  L6_36 = L6_36(A0_30)
  Supporter.Spawner.create_supporter_crow(L5_35, L6_36, A1_31, A2_32, A3_33, A4_34):getBrain():warpToNode(A0_30, A2_32)
  return (Supporter.Spawner.create_supporter_crow(L5_35, L6_36, A1_31, A2_32, A3_33, A4_34))
end
function Supporter.Spawner.create_supporter_crow(A0_37, A1_38, A2_39, A3_40, A4_41, A5_42)
  local L6_43
  L6_43 = Supporter
  L6_43 = L6_43.Spawner
  L6_43 = L6_43.get_supporter_params_of_crow
  L6_43 = L6_43()
  L6_43.pos = A0_37
  L6_43.rot = A1_38
  L6_43.first_action = A3_40
  if A2_39 then
    L6_43.model_name = "cro02_base"
    L6_43.yure_name = "cro02_base"
    L6_43.ai_type_name = "enemy"
    L6_43.group_name = "enemy"
    L6_43.param_parallel = Supporter.CrowMask.get_parallel_params_default()
    L6_43.action_selector = Supporter.CrowMask.action_selector
    L6_43.assist_selector = Supporter.CrowMask.assist_selector
    L6_43.reaction_selector = Supporter.CrowMask.reaction_selector
    L6_43.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_crowmask"
    if Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Easy then
      print("Supporter.GameChallengeLevel: Easy")
      L6_43.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask_easy"
    elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Normal then
      print("Supporter.GameChallengeLevel: Normal")
      L6_43.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask_normal"
    elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Hard then
      print("Supporter.GameChallengeLevel: Hard")
      L6_43.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask_hard"
    end
    if A5_42 then
      print("Supporter.GameChallengeLevel: infinity")
      L6_43.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask_infinity"
    end
    L6_43.chardef_dict_name = "CharDefs/supporter/crowmask/chardefs_supporter_crowmask"
    L6_43.attack_dict_name = "CharDefs/supporter/crowmask/attack_supporter_crowmask"
  end
  if A4_41 then
    L6_43.reaction_selector = Supporter.CrowWithAnge.reaction_selector
  end
  Supporter.Spawner.create_supporter(L6_43):getBrain():warp(A0_37, A1_38, L6_43.first_action)
  return (Supporter.Spawner.create_supporter(L6_43))
end
function Supporter.Spawner.create_supporter_crow_ghost_to_node(A0_44, A1_45, A2_46)
  local L3_47, L4_48
  L4_48 = A0_44
  L3_47 = A0_44.getWorldPos
  L3_47 = L3_47(L4_48)
  L4_48 = A0_44.getWorldRot
  L4_48 = L4_48(A0_44)
  Supporter.Spawner.create_supporter_crow_ghost(L3_47, L4_48, A1_45, A2_46):getBrain():warpToNode(A0_44, A2_46)
  return (Supporter.Spawner.create_supporter_crow_ghost(L3_47, L4_48, A1_45, A2_46))
end
function Supporter.Spawner.create_supporter_crow_ghost(A0_49, A1_50, A2_51, A3_52)
  local L4_53
  L4_53 = Supporter
  L4_53 = L4_53.Spawner
  L4_53 = L4_53.get_supporter_params_of_crow
  L4_53 = L4_53()
  L4_53.pos = A0_49
  L4_53.rot = A1_50
  L4_53.first_action = A3_52
  L4_53.model_name = "ghs04_base"
  L4_53.yure_name = "ghs04_base"
  if A2_51 then
    L4_53.ai_type_name = "enemy"
    L4_53.group_name = "enemy"
    L4_53.param_parallel = Supporter.CrowMask.get_parallel_params_default()
    L4_53.action_selector = Supporter.CrowMask.action_selector
    L4_53.assist_selector = Supporter.CrowMask.assist_selector
    L4_53.reaction_selector = Supporter.CrowMask.reaction_selector
    L4_53.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_crowmask"
    L4_53.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask"
    L4_53.chardef_dict_name = "CharDefs/supporter/crowmask/chardefs_supporter_crowmask"
    L4_53.attack_dict_name = "CharDefs/supporter/crowmask/attack_supporter_crowmask"
  end
  L4_53.chardef_dict_name = "CharDefs/supporter/crowghost/chardefs_supporter_crowghost"
  L4_53.servant_name = nil
  Supporter.Spawner.create_supporter(L4_53):getBrain():enableGhostMode(true)
  Supporter.Spawner.create_supporter(L4_53):getBrain():warp(A0_49, A1_50, L4_53.first_action)
  return (Supporter.Spawner.create_supporter(L4_53))
end
function Supporter.Spawner.create_supporter_crow_garuda_to_node(A0_54, A1_55, A2_56)
  local L3_57, L4_58
  L4_58 = A0_54
  L3_57 = A0_54.getWorldPos
  L3_57 = L3_57(L4_58)
  L4_58 = A0_54.getWorldRot
  L4_58 = L4_58(A0_54)
  Supporter.Spawner.create_supporter_crow_garuda(L3_57, L4_58, A1_55, A2_56):getBrain():warpToNode(A0_54, A2_56)
  return (Supporter.Spawner.create_supporter_crow_garuda(L3_57, L4_58, A1_55, A2_56))
end
function Supporter.Spawner.create_supporter_crow_garuda(A0_59, A1_60, A2_61, A3_62)
  local L4_63
  L4_63 = Supporter
  L4_63 = L4_63.Spawner
  L4_63 = L4_63.get_supporter_params_of_crow
  L4_63 = L4_63()
  L4_63.pos = A0_59
  L4_63.rot = A1_60
  L4_63.first_action = A3_62
  L4_63.transform_with_servant = true
  L4_63.transform_without_servant = false
  L4_63.haunter_type = Player.kFelPartsType_GarudaSup
  L4_63.leopard_type = Player.kFelPartsType_GarudaSup
  L4_63.haunter_anim_set = "supporter/anim_attrs_supporter_crow"
  if A2_61 then
    L4_63.model_name = "cro02_base"
    L4_63.yure_name = "cro02_base"
    L4_63.ai_type_name = "enemy"
    L4_63.group_name = "enemy"
    L4_63.param_parallel = Supporter.CrowMask.get_parallel_params_default()
    L4_63.action_selector = Supporter.CrowMask.action_selector
    L4_63.assist_selector = Supporter.CrowMask.assist_selector
    L4_63.reaction_selector = Supporter.CrowMask.reaction_selector
    L4_63.anim_joint_dict_name = "Game/Param/AnimJoint/supporter/supporter_crowmask"
    if Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Easy then
      print("Supporter.GameChallengeLevel: Easy")
      L4_63.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask_easy"
    elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Normal then
      print("Supporter.GameChallengeLevel: Normal")
      L4_63.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask_normal"
    elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Hard then
      print("Supporter.GameChallengeLevel: Hard")
      L4_63.action_dict_name = "CharDefs/supporter/crowmask/action_supporter_crowmask_hard"
    end
    L4_63.chardef_dict_name = "CharDefs/supporter/crowmask/chardefs_supporter_crowmask"
    L4_63.attack_dict_name = "CharDefs/supporter/crowmask/attack_supporter_crowmask"
  end
  Supporter.Spawner.create_supporter(L4_63):getBrain():warp(A0_59, A1_60, L4_63.first_action)
  return (Supporter.Spawner.create_supporter(L4_63))
end
function Supporter.Spawner.create_supporter_kitten_to_node(A0_64, A1_65, A2_66, A3_67, A4_68)
  local L5_69, L6_70
  L6_70 = A0_64
  L5_69 = A0_64.getWorldPos
  L5_69 = L5_69(L6_70)
  L6_70 = A0_64.getWorldRot
  L6_70 = L6_70(A0_64)
  Supporter.Spawner.create_supporter_kitten(L5_69, L6_70, A1_65, A2_66, A3_67, A4_68):getBrain():warpToNode(A0_64, A1_65)
  return (Supporter.Spawner.create_supporter_kitten(L5_69, L6_70, A1_65, A2_66, A3_67, A4_68))
end
function Supporter.Spawner.create_supporter_kitten(A0_71, A1_72, A2_73, A3_74, A4_75, A5_76)
  local L6_77
  L6_77 = Supporter
  L6_77 = L6_77.Spawner
  L6_77 = L6_77.get_supporter_params_of_kitten
  L6_77 = L6_77()
  L6_77.pos = A0_71
  L6_77.rot = A1_72
  L6_77.first_action = A2_73
  if A3_74 then
    L6_77.action_selector = Supporter.Kitten.action_selector
    L6_77.reaction_selector = Supporter.Kitten.reaction_selector
  elseif A4_75 then
    L6_77.action_selector = Supporter.Kitten.action_selector2
    L6_77.reaction_selector = Supporter.Kitten.reaction_selector2
  elseif A5_76 then
    L6_77.action_selector = Supporter.Kitten.action_selector3
    L6_77.reaction_selector = Supporter.Kitten.reaction_selector3
  end
  if Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Easy then
    print("Supporter.GameChallengeLevel: Easy")
    if A3_74 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_e_battle"
    elseif A4_75 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_e_battle2"
    elseif A5_76 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_e_battle3"
    end
  elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Normal then
    print("Supporter.GameChallengeLevel: Normal")
    if A3_74 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_n_battle"
    elseif A4_75 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_n_battle2"
    elseif A5_76 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_n_battle3"
    end
  elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Hard then
    print("Supporter.GameChallengeLevel: Hard")
    if A3_74 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_h_battle"
    elseif A4_75 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_h_battle2"
    elseif A5_76 then
      L6_77.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_h_battle3"
    end
  end
  Supporter.Spawner.create_supporter(L6_77):getBrain():warp(A0_71, A1_72, L6_77.first_action)
  return (Supporter.Spawner.create_supporter(L6_77))
end
function Supporter.Spawner.create_supporter_kitten_feline_to_node(A0_78, A1_79, A2_80, A3_81, A4_82)
  local L5_83, L6_84
  L6_84 = A0_78
  L5_83 = A0_78.getWorldPos
  L5_83 = L5_83(L6_84)
  L6_84 = A0_78.getWorldRot
  L6_84 = L6_84(A0_78)
  Supporter.Spawner.create_supporter_kitten_feline(L5_83, L6_84, A1_79, A2_80, A3_81, A4_82):getBrain():warpToNode(A0_78, A1_79)
  return (Supporter.Spawner.create_supporter_kitten_feline(L5_83, L6_84, A1_79, A2_80, A3_81, A4_82))
end
function Supporter.Spawner.create_supporter_kitten_feline(A0_85, A1_86, A2_87, A3_88, A4_89, A5_90)
  local L6_91
  L6_91 = Supporter
  L6_91 = L6_91.Spawner
  L6_91 = L6_91.get_supporter_params_of_kitten
  L6_91 = L6_91()
  L6_91.pos = A0_85
  L6_91.rot = A1_86
  L6_91.first_action = A2_87
  L6_91.transform_with_servant = true
  L6_91.transform_without_servant = false
  L6_91.haunter_type = Player.kFelPartsType_FelineSup
  L6_91.leopard_type = Player.kFelPartsType_FelineSup
  L6_91.haunter_anim_set = "supporter/anim_attrs_supporter_crow"
  if Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Easy then
    print("Supporter.GameChallengeLevel: Easy")
    if A3_88 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_e_battle"
    elseif A4_89 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_e_battle2"
    elseif A5_90 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_e_battle3"
    end
  elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Normal then
    print("Supporter.GameChallengeLevel: Normal")
    if A3_88 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_n_battle"
    elseif A4_89 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_n_battle2"
    elseif A5_90 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_n_battle3"
    end
  elseif Supporter.getGameChallengeLevel() == Supporter.GameChallengeLevel.Hard then
    print("Supporter.GameChallengeLevel: Hard")
    if A3_88 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_h_battle"
    elseif A4_89 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_h_battle2"
    elseif A5_90 then
      L6_91.action_dict_name = "CharDefs/supporter/kitten/action_supporter_kitten_h_battle3"
    end
  end
  Supporter.Spawner.create_supporter(L6_91):getBrain():warp(A0_85, A1_86, L6_91.first_action)
  return (Supporter.Spawner.create_supporter(L6_91))
end
function Supporter.Spawner.create_supporter_cat(A0_92)
  local L1_93
  L1_93 = {}
  L1_93.pos = A0_92.pos
  L1_93.gobj_name = "supporter_cat"
  L1_93.brain_name = "CatBrain"
  L1_93.ai_type_name = nil
  L1_93.model_name = "dus01_base"
  L1_93.yure_name = "dus01_base"
  L1_93.group_name = "supporter"
  L1_93.use_bullet_provider = false
  L1_93.use_foot_marker = nil
  L1_93.use_graph = nil
  L1_93.use_sound = nil
  L1_93.permit_in_air = nil
  L1_93.permit_on_ground = nil
  L1_93.first_action = nil
  L1_93.param_parallel = nil
  L1_93.action_selector = nil
  L1_93.assist_selector = nil
  L1_93.reaction_selector = nil
  L1_93.resource_provider_name = "CatResourceProvider"
  L1_93.animset_name = "supporter/anim_attrs_supporter_cat"
  L1_93.action_dict_name = "CharDefs/supporter/cat/action_supporter_cat"
  L1_93.chardef_dict_name = "CharDefs/supporter/cat/chardefs_supporter_cat"
  L1_93.attack_dict_name = "CharDefs/supporter/cat/attack_supporter_cat"
  if _enemy then
    L1_93.ai_type_name = "enemy"
    L1_93.group_name = "enemy"
  end
  return (Supporter.Spawner.create_supporter(L1_93))
end
function Supporter.Spawner.create_supporter_raven(A0_94, A1_95, A2_96)
  local L3_97
  L3_97 = {}
  L3_97.pos = A0_94
  L3_97.rot = A1_95
  L3_97.gobj_name = "supporter_raven"
  L3_97.brain_name = "RavenBrain"
  L3_97.ai_type_name = nil
  L3_97.model_name = "xii01_base"
  L3_97.yure_name = "xii01_base"
  L3_97.group_name = "supporter"
  L3_97.use_bullet_provider = false
  L3_97.use_foot_marker = nil
  L3_97.use_graph = nil
  L3_97.use_sound = nil
  L3_97.permit_in_air = nil
  L3_97.permit_on_ground = nil
  L3_97.first_action = nil
  L3_97.param_parallel = nil
  L3_97.action_selector = nil
  L3_97.assist_selector = nil
  L3_97.reaction_selector = nil
  L3_97.resource_provider_name = "RavenResourceProvider"
  L3_97.animset_name = "supporter/anim_attrs_supporter_raven"
  L3_97.action_dict_name = "CharDefs/supporter/raven/action_supporter_raven"
  L3_97.chardef_dict_name = "CharDefs/supporter/raven/chardefs_supporter_raven"
  L3_97.attack_dict_name = "CharDefs/supporter/raven/attack_supporter_raven"
  if A2_96 then
    L3_97.ai_type_name = "enemy"
    L3_97.group_name = "enemy"
  end
  return (Supporter.Spawner.create_supporter(L3_97))
end
