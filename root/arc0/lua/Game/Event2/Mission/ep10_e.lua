local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = dofile
L1_1 = "/Game/Event2/Common/EventCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Mission/ep10_common.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/SuppoterCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Common/WarshipCommon.lua"
L0_0(L1_1)
_fake_barrage_max = 59
L0_0 = {}
_fake_barrage_task = L0_0
_brain_crow = nil
_puppet_crow = nil
_phi_kaiwa_Possible = false
L0_0 = {}
L0_0.repair = "ryz02_repair_00"
_motion_table_ryz = L0_0
L0_0 = {}
L0_0.repair = "cid01_repair_00"
_motion_table_cid = L0_0
_hammer_hdl = nil
INFINITY_SOLDIER_END_POINT_NAME = "locator2_infinite_soldier_move_end_0%d"
INFINITY_SOLDIER_MOVE_NAME = "locator2_infinite_soldier_move_0%d"
INFINITY_SOLDIER_END_POINT_MAX = 20
_ar_enter_flag = false
_text_view_ng_flg = false
_text_view_played = false
L0_0 = {}
L0_0.spawnOnStart = true
L0_0.autoPrepare = true
L0_0.autoRebirthFlag = true
L0_0.autoRebirthIntervalTime = 2
L1_1 = {L2_2}
L2_2 = {}
L2_2.type = "fi"
L2_2.locator = "locator2_phi_01"
L2_2.name = "phi01"
L2_2.ai_spawn_option = "Fi/fi_ep10"
L0_0.spawnSet = L1_1
function L1_1(A0_8)
  findGameObject2("EnemyBrain", "phi01"):setEnableHomingTarget(false)
  findGameObject2("EnemyBrain", "phi01"):setVisibleEnemyMarker(false)
end
L0_0.onEnter = L1_1
enmgen2_phi_01 = L0_0
L0_0 = {}
L0_0.spawnOnStart = true
L0_0.autoPrepare = false
L0_0.autoRebirthFlag = false
L0_0.autoRebirthIntervalTime = 0
L1_1 = {
  L2_2,
  L3_3,
  L4_4,
  L5_5,
  L6_6,
  L7_7,
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_07",
    name = "def_soldier07",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_08",
    name = "def_soldier08",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_09",
    name = "def_soldier09",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_10",
    name = "def_soldier10",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_11",
    name = "def_soldier11",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_12",
    name = "def_soldier12",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_13",
    name = "def_soldier13",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_14",
    name = "def_soldier14",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  },
  {
    type = "soldier_rifle",
    locator = "locator2_HtostileoThePhiDefault_15",
    name = "def_soldier15",
    ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
  }
}
L2_2 = {}
L2_2.type = "soldier_rifle"
L2_2.locator = "locator2_HtostileoThePhiDefault_01"
L2_2.name = "def_soldier01"
L2_2.ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
L3_3.type = "soldier_rifle"
L3_3.locator = "locator2_HtostileoThePhiDefault_02"
L3_3.name = "def_soldier02"
L3_3.ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
L4_4.type = "soldier_rifle"
L4_4.locator = "locator2_HtostileoThePhiDefault_03"
L4_4.name = "def_soldier03"
L4_4.ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
L5_5.type = "soldier_rifle"
L5_5.locator = "locator2_HtostileoThePhiDefault_04"
L5_5.name = "def_soldier04"
L5_5.ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
L6_6.type = "soldier_rifle"
L6_6.locator = "locator2_HtostileoThePhiDefault_05"
L6_6.name = "def_soldier05"
L6_6.ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
L7_7 = {}
L7_7.type = "soldier_rifle"
L7_7.locator = "locator2_HtostileoThePhiDefault_06"
L7_7.name = "def_soldier06"
L7_7.ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
L0_0.spawnSet = L1_1
L0_0.dead_num = 0
function L1_1(A0_9)
  A0_9:setEnemyMarker(false)
end
L0_0.onEnter = L1_1
function L1_1(A0_10, A1_11)
  spec_tbl = A0_10:getSpecTable()
  spec_tbl.dead_num = spec_tbl.dead_num + 1
  A0_10:setEventListener("DestroyEnemyReport", function(A0_12)
    if A0_12.attacker == "player" then
      print("\229\133\181\229\163\171\227\130\146\230\174\186\227\129\151\227\129\159\227\129\174\227\129\175\227\130\173\227\131\136\227\130\165\227\131\179")
      kdemo_execution_judgment()
    end
  end)
end
L0_0.onObjectDead = L1_1
function L1_1(A0_13, A1_14)
end
L0_0.onSpawn = L1_1
enmgen2_hostile_to_the_phi_default = L0_0
L0_0 = {}
L0_0.spawnOnStart = true
L0_0.autoPrepare = true
L0_0.autoRebirthFlag = false
L0_0.autoRebirthIntervalTime = 0
L1_1 = {}
L0_0.spawnSet = L1_1
L0_0.dead_num = 0
function L1_1(A0_15, A1_16)
  spec_tbl = A0_15:getSpecTable()
  spec_tbl.dead_num = spec_tbl.dead_num + 1
  A0_15:setEventListener("DestroyEnemyReport", function(A0_17)
    if A0_17.attacker == "player" then
      print("\229\133\181\229\163\171\227\130\146\230\174\186\227\129\151\227\129\159\227\129\174\227\129\175\227\130\173\227\131\136\227\130\165\227\131\179")
      kdemo_execution_judgment()
    end
  end)
  if #spec_tbl.spawnSet <= spec_tbl.dead_num then
    print(A0_15:getName() .. "\227\129\171\229\177\158\227\129\153\227\130\139\229\133\181\229\163\171\227\129\140\229\133\168\230\187\133")
    spec_tbl.dead_num = 0
    invokeTask(function()
      while false == enemy_raspown_check(spec_tbl.spawnSet) do
        wait()
      end
      print("\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179\230\157\161\228\187\182\227\129\140\230\149\180\227\129\163\227\129\159\227\129\174\227\129\167" .. A0_15:getName() .. "\227\129\171\229\177\158\227\129\153\227\130\139\229\133\181\229\163\171\229\133\168\229\147\161\227\130\146\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      A0_15:requestSpawn()
    end)
  end
end
L0_0.onObjectDead = L1_1
function L1_1(A0_18, A1_19)
end
L0_0.onSpawn = L1_1
template_enmgen2_infinity = L0_0
function L0_0()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30, L11_31, L12_32
  L0_20 = 7
  L1_21 = 1
  for L5_25 = 1, L0_20 do
    L6_26 = string
    L6_26 = L6_26.format
    L7_27 = "enmgen2_infinity_%02d"
    L6_26 = L6_26(L7_27, L8_28)
    L7_27 = {}
    for L11_31, L12_32 in L8_28(L9_29) do
      if "table" == type(L12_32) then
        L7_27[L11_31] = {}
      else
        L7_27[L11_31] = L12_32
      end
    end
    for L12_32 = 1, 2 do
      L8_28.type = "soldier_rifle"
      L8_28.locator = string.format("locator2_infinity_%02d", L1_21)
      name = string.format("infinity_soldier_%02d", L1_21)
      ai_spawn_option = "Soldier/ep10_e_infinity_soldier"
      L1_21 = L1_21 + 1
      table.insert(L7_27.spawnSet, L8_28)
    end
    L9_29[L6_26] = L7_27
  end
end
createInfinitySoldier = L0_0
L0_0 = createInfinitySoldier
L0_0()
function L0_0()
  invokeTask(function()
    if _phi_kaiwa_Possible == false then
      print("ep10_00220k\227\129\174\228\188\154\232\169\177\227\131\135\227\131\162\229\134\141\231\148\159\230\157\161\228\187\182\227\129\140\230\186\128\227\129\159\227\129\149\227\130\140\227\129\159")
      _phi_kaiwa_Possible = true
      Fn_kaiwaDemoView("ep10_00220k")
      waitSeconds(0.5)
      Fn_captionView("ep10_02011")
      waitSeconds(2)
      _phi_kaiwa_Possible = false
    end
  end)
end
kdemo_execution_judgment = L0_0
function L0_0(A0_33)
  for _FORV_4_, _FORV_5_ in pairs(A0_33) do
    if true == Fn_isInSightTarget(_FORV_5_.locator, 2) then
      return false
    end
  end
  return true
end
enemy_raspown_check = L0_0
function L0_0(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41
  if A0_34 then
    A0_34 = true
  else
    A0_34 = false
  end
  L1_35 = nil
  L2_36 = 7
  for L6_40 = 1, L2_36 do
    L7_41 = string
    L7_41 = L7_41.format
    L7_41 = L7_41("enmgen2_infinity_%02d", L6_40)
    L1_35 = findGameObject2("EnemyGenerator", L7_41)
    L1_35:setEnemyMarker(A0_34)
  end
end
setVisibleFiEnemys = L0_0
function L0_0(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49
  if A0_42 then
    A0_42 = true
  else
    A0_42 = false
  end
  L1_43 = nil
  L2_44 = findGameObject2
  L2_44 = L2_44(L3_45, L4_46)
  L1_43 = L2_44
  L2_44 = L1_43.requestIdlingEnemy
  L2_44(L3_45, L4_46)
  L2_44 = findGameObject2
  L2_44 = L2_44(L3_45, L4_46)
  L1_43 = L2_44
  L2_44 = L1_43.requestIdlingEnemy
  L2_44(L3_45, L4_46)
  L2_44 = findGameObject2
  L2_44 = L2_44(L3_45, L4_46)
  L1_43 = L2_44
  L2_44 = L1_43.requestIdlingEnemy
  L2_44(L3_45, L4_46)
  L2_44 = findGameObject2
  L2_44 = L2_44(L3_45, L4_46)
  L1_43 = L2_44
  L2_44 = L1_43.requestIdlingEnemy
  L2_44(L3_45, L4_46)
  L2_44 = 7
  for L6_48 = 1, L2_44 do
    L7_49 = string
    L7_49 = L7_49.format
    L7_49 = L7_49("enmgen2_infinity_%02d", L6_48)
    L1_43 = findGameObject2("EnemyGenerator", L7_49)
    L1_43:requestIdlingEnemy(A0_42)
  end
end
requestIdlingAllEnemy = L0_0
L0_0 = {}
L0_0.spawnOnStart = true
L0_0.autoPrepare = false
L0_0.autoRebirthFlag = false
L1_1 = {
  L2_2,
  L3_3,
  L4_4,
  L5_5,
  L6_6,
  L7_7,
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_07",
    name = "Front_deck_07",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_08",
    name = "Front_deck_08",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_09",
    name = "Middle_deck_01",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_10",
    name = "Middle_deck_02",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_11",
    name = "Middle_deck_03",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_12",
    name = "Middle_deck_04",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_13",
    name = "Building_of_edge_01",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_14",
    name = "Building_of_edge_02",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_15",
    name = "Building_of_edge_03",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_16",
    name = "Building_of_edge_04",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_17",
    name = "Building_of_edge_05",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_18",
    name = "Controlle_deck_01",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  },
  {
    type = "soldier_launcher",
    locator = "locator2_engen_ar_b_19",
    name = "Controlle_deck_02",
    ai_spawn_option = "Soldier/ep10_e_soldier"
  }
}
L2_2 = {}
L2_2.type = "soldier_launcher"
L2_2.locator = "locator2_engen_ar_b_01"
L2_2.name = "Front_deck_01"
L2_2.ai_spawn_option = "Soldier/ep10_e_soldier"
L3_3.type = "soldier_launcher"
L3_3.locator = "locator2_engen_ar_b_02"
L3_3.name = "Front_deck_02"
L3_3.ai_spawn_option = "Soldier/ep10_e_soldier"
L4_4.type = "soldier_launcher"
L4_4.locator = "locator2_engen_ar_b_03"
L4_4.name = "Front_deck_03"
L4_4.ai_spawn_option = "Soldier/ep10_e_soldier"
L5_5.type = "soldier_launcher"
L5_5.locator = "locator2_engen_ar_b_04"
L5_5.name = "Front_deck_04"
L5_5.ai_spawn_option = "Soldier/ep10_e_soldier"
L6_6.type = "soldier_launcher"
L6_6.locator = "locator2_engen_ar_b_05"
L6_6.name = "Front_deck_05"
L6_6.ai_spawn_option = "Soldier/ep10_e_soldier"
L7_7 = {}
L7_7.type = "soldier_launcher"
L7_7.locator = "locator2_engen_ar_b_06"
L7_7.name = "Front_deck_06"
L7_7.ai_spawn_option = "Soldier/ep10_e_soldier"
L0_0.spawnSet = L1_1
function L1_1(A0_50)
  local L1_51
end
L0_0.onUpdate = L1_1
function L1_1(A0_52)
  local L1_53
end
L0_0.onEnter = L1_1
function L1_1(A0_54)
  local L1_55
end
L0_0.onLeave = L1_1
function L1_1(A0_56, A1_57)
end
L0_0.onObjectDead = L1_1
enmgen2_ar_b = L0_0
L0_0 = {}
L0_0.spawnOnStart = true
L0_0.autoPrepare = false
L0_0.autoRebirthFlag = false
L1_1 = {}
L0_0.spawnSet = L1_1
function L1_1(A0_58)
  local L1_59
end
L0_0.onUpdate = L1_1
function L1_1(A0_60)
  local L1_61
end
L0_0.onEnter = L1_1
function L1_1(A0_62)
  local L1_63
end
L0_0.onLeave = L1_1
function L1_1(A0_64, A1_65)
end
L0_0.onObjectDead = L1_1
function L1_1(A0_66, A1_67)
end
L0_0.onSpawn = L1_1
enmgen2_ar_b_orbiter_02 = L0_0
L0_0 = 6
L1_1 = "locator2_engen_ar_b_02_%02d"
L2_2 = "Orbiter_02_%02d"
for L6_6 = 1, L0_0 do
  L7_7 = table
  L7_7 = L7_7.insert
  L7_7(enmgen2_ar_b_orbiter_02.spawnSet, {
    type = "mechsky",
    locator = string.format(L1_1, L6_6),
    name = string.format(L2_2, L6_6),
    ai_spawn_option = "MechSky/ep10_e_mechsky_fix"
  })
end
L1_1 = "locator2_engen_ar_b_02_%02d"
L2_2 = "Orbiter_02_%02d"
for L7_7 = L0_0 + 1, L3_3 do
  table.insert(enmgen2_ar_b_orbiter_02.spawnSet, {
    type = "soldier_rifle",
    locator = string.format(L1_1, L7_7 - L0_0),
    name = string.format(L2_2, L7_7),
    target_vehicle = string.format(L2_2, L7_7 - L0_0)
  })
end
function L0_0()
  local L0_68, L1_69, L2_70, L3_71, L4_72
  L0_68 = Fn_setAreaWarp
  L1_69 = "ve_crane_root"
  L2_70 = "locator2_crane_ship_pos"
  L0_68(L1_69, L2_70)
  L0_68 = Fn_warshipWarpRequest
  L1_69 = findGameObject2
  L2_70 = "Node"
  L3_71 = "locator2_ar_ship_pos"
  L4_72 = L1_69(L2_70, L3_71)
  L0_68(L1_69, L2_70, L3_71, L4_72, L1_69(L2_70, L3_71))
  L0_68 = Fn_userCtrlAllOff
  L0_68()
  L0_68 = Fn_coercionPoseNomal
  L0_68()
  L0_68 = {L1_69, L2_70}
  L1_69 = {}
  L1_69.name = "ryz01"
  L1_69.type = "ryz02"
  L1_69.node = "locator2_ryz_01"
  L2_70 = {}
  L2_70.name = "cid01"
  L2_70.type = "cid01"
  L2_70.node = "locator2_cid_01"
  L1_69 = Fn_setupNpc
  L2_70 = L0_68
  L1_69(L2_70)
  L1_69 = Fn_loadNpcEventMotion
  L2_70 = "ryz01"
  L3_71 = _motion_table_ryz
  L1_69(L2_70, L3_71)
  L1_69 = Fn_loadNpcEventMotion
  L2_70 = "cid01"
  L3_71 = _motion_table_cid
  L1_69(L2_70, L3_71)
  L1_69 = createGameObject2
  L2_70 = "GimmickBg"
  L1_69 = L1_69(L2_70)
  _hammer_hdl = L1_69
  L1_69 = _hammer_hdl
  L2_70 = L1_69
  L1_69 = L1_69.setDrawModelName
  L3_71 = "cihammer01_base"
  L1_69(L2_70, L3_71)
  L1_69 = _hammer_hdl
  L2_70 = L1_69
  L1_69 = L1_69.setName
  L3_71 = "cihammer01"
  L1_69(L2_70, L3_71)
  L1_69 = Fn_findNpcPuppet
  L2_70 = "cid01"
  L1_69 = L1_69(L2_70)
  L2_70 = Fn_attachJoint
  L3_71 = _hammer_hdl
  L4_72 = L1_69
  L2_70(L3_71, L4_72, "loc_r_hand")
  L2_70 = loadFileAsset
  L3_71 = "evb"
  L4_72 = "evx/ar_intrusion_range"
  L2_70 = L2_70(L3_71, L4_72)
  L3_71 = nil
  if L2_70 ~= nil then
    L4_72 = L2_70.wait
    L4_72(L2_70)
    L4_72 = L2_70.getRoot
    L4_72 = L4_72(L2_70)
    L3_71 = EventData:create("ar_intrusion_range", nil, L4_72)
    L3_71:try_init()
    L3_71:waitForReady()
    L3_71:try_start()
  end
  L4_72 = Fn_pcSensorOff
  L4_72("pccubesensor2_07")
  L4_72 = Fn_pcSensorOff
  L4_72("pccubesensormulti2_intrusion_range")
  L4_72 = Fn_pcSensorOff
  L4_72("pccubesensor2_10")
  L4_72 = Fn_findAreaHandle
  L4_72 = L4_72("ar_b_root")
  _area_ar = L4_72
  L4_72 = _area_ar
  L4_72 = L4_72.setExpandedAabb
  L4_72(L4_72, true)
end
Initialize = L0_0
function L0_0()
  local L0_73, L1_74, L2_75, L3_76
  L0_73(L1_74, L2_75)
  L0_73(L1_74, L2_75)
  L0_73(L1_74)
  _task_warship = L0_73
  L0_73(L1_74)
  L0_73(L1_74)
  repeat
    L0_73()
  until L0_73
  L0_73(L1_74)
  L0_73(L1_74)
  L0_73()
  L0_73()
  L0_73(L1_74)
  L0_73(L1_74, L2_75)
  for L3_76 = 1, 10 do
    _breakdown_effect[L3_76] = Fn_createEffect("smk_effect_" .. string.format("%02d", L3_76), "ef_ev_smk_01", "locator2_breakdown_effect_" .. string.format("%02d", L3_76), true)
  end
  L0_73(L1_74)
  L0_73(L1_74)
  L0_73(L1_74)
  L0_73(L1_74)
  repeat
    L0_73()
  until L0_73
  L0_73(L1_74)
  L0_73(L1_74)
  L0_73(L1_74)
  if L0_73 then
    L3_76 = L0_73.getWorldPos
    L3_76 = L3_76(L0_73)
    L1_74(L2_75, L3_76, 0, 0)
  end
  L0_73()
  L1_74(L2_75)
  L1_74(L2_75)
  L1_74(L2_75)
  L3_76 = _motion_table_ryz
  L3_76 = L3_76.repair
  L1_74(L2_75, L3_76, true, 0, false)
  L3_76 = _motion_table_cid
  L3_76 = L3_76.repair
  L1_74(L2_75, L3_76, true, 0, false)
  L1_74(L2_75)
  L1_74()
  L1_74()
  L1_74(L2_75)
  L1_74(L2_75)
  L1_74(L2_75)
  L3_76 = "ep10_02001"
  L2_75(L3_76)
  L3_76 = L2_75
  L2_75(L3_76, false)
  L3_76 = L2_75
  L2_75(L3_76, 40)
  L3_76 = L2_75
  L2_75(L3_76, true)
  L3_76 = L2_75
  L2_75(L3_76, "ep10_02013")
  L3_76 = L2_75
  L2_75(L3_76)
  while true do
    L3_76 = L2_75
    L3_76 = Fn_isCaptionView
    L3_76 = L3_76()
    if L3_76 == false then
      if L2_75 == 35 then
        L3_76 = repopEnergyGem
        L3_76()
        L3_76 = invokeTask
        L3_76(function()
          if false == _text_view_played then
            Sound:playSE("m23_016")
            Fn_captionViewWait("ep10_02002")
          end
          waitSeconds(0.2)
          if false == _text_view_played then
            Sound:playSE("m24_914c")
            Fn_captionViewWait("ep10_02003")
          end
          waitSeconds(1.2)
          if false == _text_view_played then
            Sound:playSE("m24_914b")
            Fn_captionView("ep10_02004")
          end
        end)
      elseif L2_75 == 23 then
        L3_76 = repopEnergyGem
        L3_76()
        L3_76 = invokeTask
        L3_76(function()
          if false == _text_view_played then
            Sound:playSE("m23_017")
            Fn_captionViewWait("ep10_02005")
          end
          waitSeconds(0.2)
          if false == _text_view_played then
            Sound:playSE("m24_001")
            Fn_captionViewWait("ep10_02006")
          end
          waitSeconds(1.2)
          if false == _text_view_played then
            Sound:playSE("m24_923c")
            Fn_captionViewWait("ep10_02007")
          end
        end)
      elseif L2_75 == 10 then
        _text_view_ng_flg = true
        L3_76 = repopEnergyGem
        L3_76()
        L3_76 = invokeTask
        L3_76(function()
          Sound:playSE("m24_001")
          Fn_captionViewWait("ep10_02008")
          _text_view_ng_flg = false
        end)
      elseif L2_75 <= 0 then
        _text_view_ng_flg = true
        L3_76 = HUD
        L3_76 = L3_76.timerStop
        L3_76(L3_76)
        L3_76 = HUD
        L3_76 = L3_76.timerSetVisible
        L3_76(L3_76, false)
        break
      end
    end
    L3_76 = wait
    L3_76()
  end
  if L1_74 then
    L3_76 = L1_74
    L2_75(L3_76)
  end
  repeat
    L2_75()
    L3_76 = L2_75
  until L2_75 > 0
  L3_76 = L2_75
  L2_75(L3_76, Player.kEnergy_Life, true)
  L3_76 = L2_75
  L2_75(L3_76, Player.kEnergy_Gravity, true)
  _text_view_ng_flg = true
  L3_76 = true
  L2_75(L3_76)
  L3_76 = false
  L2_75(L3_76)
  L3_76 = L2_75
  L2_75(L3_76)
  L3_76 = true
  L2_75(L3_76)
  L3_76 = "pccubesensor2_07"
  L2_75(L3_76)
  L3_76 = "pccubesensor2_10"
  L2_75(L3_76)
  L3_76 = L2_75
  L2_75(L3_76)
  L3_76 = L2_75
  L2_75(L3_76)
  L3_76 = L2_75
  L2_75(L3_76)
  if L2_75 == false then
    L3_76 = L2_75
    L2_75(L3_76, "m23_016")
    L3_76 = "ep10_02009"
    L2_75(L3_76)
    L3_76 = 2
    L2_75(L3_76)
    L2_75()
    L2_75()
    L3_76 = "pccubesensormulti2_intrusion_range"
    L2_75(L3_76)
    L3_76 = L2_75
    L2_75(L3_76, false)
    L2_75()
  elseif L2_75 == true then
    L3_76 = L2_75
    L2_75(L3_76, "pc1_527")
    L3_76 = "ep10_02010"
    L2_75(L3_76)
    L3_76 = 0.2
    L2_75(L3_76)
    L3_76 = L2_75
    L2_75(L3_76, "m23_016")
    L3_76 = "ep10_02009"
    L2_75(L3_76)
    L3_76 = 0.2
    L2_75(L3_76)
  end
  L2_75()
  L3_76 = "pccubesensormulti2_intrusion_range"
  L2_75(L3_76)
  L3_76 = true
  L2_75(L3_76)
  L3_76 = L2_75
  L2_75(L3_76, false)
  L2_75()
  L2_75()
  L2_75()
end
Ingame = L0_0
function L0_0()
  if Fn_getPlayer() then
    Player:setEnergyInfinite(Player.kEnergy_Life, false)
    Player:setEnergyInfinite(Player.kEnergy_Gravity, false)
  end
end
Finalize = L0_0
function L0_0()
  return invokeTask(function()
    local L0_77, L1_78
    L0_77 = findGameObject2
    L1_78 = "Gem"
    L0_77 = L0_77(L1_78, "gem2_energy_r_01")
    if not L0_77 then
      L0_77 = findGameObject2
      L1_78 = "Node"
      L0_77 = L0_77(L1_78, "locator2_energy_r_01")
      if L0_77 then
        L1_78 = L0_77.isRunning
        L1_78 = L1_78(L0_77)
        if L1_78 then
          L1_78 = createGameObject2
          L1_78 = L1_78("Gem")
          L1_78:setName("gem2_energy_r_01")
          L1_78:setGemModelNo(4)
          L1_78:setForceMove()
          L1_78:setVisibleBlockHalfSize(150)
          L0_77:appendChild(L1_78)
          L1_78:try_init()
          L1_78:waitForReadyAsync(function()
            L1_78:try_start()
          end)
        end
      end
    else
    end
  end)
end
repopEnergyGem = L0_0
function L0_0()
  _puppet_crow = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Ground, "locator2_crow_03")
  _brain_crow = _puppet_crow:getBrain()
  _brain_crow:setAbility(Supporter.Ability.ActionInAir, false)
  _brain_crow:setIdling(true)
  wait()
end
supporterNpc_crow_setup = L0_0
function L0_0(A0_79)
  print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\171\232\191\145\227\129\165\227\129\132\227\129\159")
  _ar_enter_flag = true
end
pccubesensor2_07_OnEnter = L0_0
function L0_0(A0_80)
  print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\139\227\130\137\233\155\162\227\130\140\227\129\159")
  _ar_enter_flag = false
end
pccubesensor2_07_OnLeave = L0_0
function L0_0(A0_81)
  print("\231\140\171\227\131\175\227\131\188\227\131\151\229\136\164\229\174\154")
  HUD:timerStop()
  invokeTask(function()
    Fn_catWarp()
    HUD:timerStart()
    waitSeconds(1)
    if Fn_isCaptionView() == false then
      Fn_captionView("ep10_02001")
    end
  end)
end
pccubesensor2_10_OnLeave = L0_0
L0_0 = {}
_warship_attack_on_the_cannon = L0_0
L0_0 = _warship_attack_on_the_cannon
function L1_1(A0_82)
  local L1_83
  A0_82.task = nil
  A0_82.canon_weak_point = nil
  A0_82.isRunning = false
  A0_82.wait_flg = false
  A0_82.isPrepare = false
  A0_82.isPrepareNow = false
  A0_82.gage_01 = nil
  A0_82.dummy_puppet = nil
  A0_82.canon_hit_flg = false
  A0_82.canon_normal_hit_flg = false
end
L0_0.init = L1_1
L0_0 = _warship_attack_on_the_cannon
function L1_1(A0_84, A1_85)
  if true == A1_85 then
    A0_84.wait_flg = true
  else
    A0_84.wait_flg = false
  end
end
L0_0.setWait = L1_1
L0_0 = _warship_attack_on_the_cannon
function L1_1(A0_86)
  local L1_87
  L1_87 = A0_86.task
  if L1_87 then
    L1_87 = A0_86.task
    if L1_87 then
      L1_87 = A0_86.task
      L1_87 = L1_87.isRunning
      L1_87 = L1_87(L1_87)
    end
  else
    if false == L1_87 then
      L1_87 = 1000
      Player:setTargetingPriority(Player.kTargetingPrio_GimmickBgFirst)
      invokeSystemTask(function()
        local L0_88, L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97, L10_98, L11_99
        L0_88 = A0_86.isPrepare
        if false == L0_88 then
          L0_88 = A0_86.isPrepareNow
          if false == L0_88 then
            A0_86.isPrepareNow = true
            L0_88 = createGameObject2
            L1_89 = "Puppet"
            L0_88 = L0_88(L1_89)
            A0_86.dummy_puppet = L0_88
            L0_88 = A0_86.dummy_puppet
            L1_89 = L0_88
            L0_88 = L0_88.setName
            L0_88(L1_89, L2_90)
            L0_88 = Fn_findAreaHandle
            L1_89 = "ar_b_root"
            L0_88 = L0_88(L1_89)
            L1_89 = L0_88.appendChild
            L1_89(L2_90, L3_91)
            L1_89 = HUD
            L1_89 = L1_89.createBossHpGauge
            L3_91.obj = L4_92
            L3_91.hp = 1
            L3_91.text = nil
            L1_89 = L1_89(L2_90, L3_91)
            A0_86.gage_01 = L1_89
            L1_89 = {
              L2_90,
              L3_91,
              L4_92,
              L5_93,
              L6_94,
              L7_95,
              L8_96,
              L9_97,
              L10_98,
              L11_99,
              {
                gimmickBgHdls = nil,
                column = 1,
                scale = 0.435
              },
              {
                gimmickBgHdls = nil,
                column = 1,
                scale = 1.628
              },
              {
                gimmickBgHdls = nil,
                column = 1,
                scale = 1.628
              }
            }
            L2_90.gimmickBgHdls = nil
            L2_90.column = 5
            L2_90.scale = 1.5
            L3_91.gimmickBgHdls = nil
            L3_91.column = 5
            L3_91.scale = 1.95
            L4_92.gimmickBgHdls = nil
            L4_92.column = 2
            L4_92.scale = 2.446
            L5_93 = {}
            L5_93.gimmickBgHdls = nil
            L5_93.column = 7
            L5_93.scale = 0.435
            L6_94 = {}
            L6_94.gimmickBgHdls = nil
            L6_94.column = 7
            L6_94.scale = 0.435
            L7_95 = {}
            L7_95.gimmickBgHdls = nil
            L7_95.column = 3
            L7_95.scale = 0.435
            L8_96.gimmickBgHdls = nil
            L8_96.column = 7
            L8_96.scale = 0.435
            L9_97.gimmickBgHdls = nil
            L9_97.column = 7
            L9_97.scale = 0.435
            L10_98.gimmickBgHdls = nil
            L10_98.column = 3
            L10_98.scale = 0.435
            L11_99.gimmickBgHdls = nil
            L11_99.column = 1
            L11_99.scale = 0.435
            A0_86.canon_weak_point = L1_89
            L1_89 = A0_86.canon_weak_point
            L1_89 = #L1_89
            for L5_93, L6_94 in L2_90(L3_91) do
              L7_95 = {}
              for L11_99 = 1, L6_94.column do
                table.insert(L7_95, string.format("locator2_wc_column01_%02d_%02d", L5_93, L11_99))
              end
              L6_94.gimmickBgHdls = L8_96
              for _FORV_12_, _FORV_13_ in L9_97(L10_98) do
                _FORV_13_:setEventListener("damage", L8_96)
                _FORV_13_:setScale(L6_94.scale)
                _FORV_13_:setActive(false)
                _FORV_13_:try_init()
                _FORV_13_:waitForReadyAsync(function(A0_100)
                  A0_100:try_start()
                end)
              end
            end
            A0_86.isPrepare = true
            A0_86.isPrepareNow = false
          end
        else
          L0_88 = A0_86.isPrepareNow
          if L0_88 then
            repeat
              L0_88 = wait
              L0_88()
              L0_88 = A0_86.isPrepare
            until L0_88
          end
        end
        L0_88 = A0_86.task
        if L0_88 then
          L0_88 = A0_86.task
          L1_89 = L0_88
          L0_88 = L0_88.abort
          L0_88(L1_89)
        end
        L0_88 = invokeTask
        function L1_89()
          local L0_101, L1_102
          for _FORV_3_, _FORV_4_ in L0_101(L1_102) do
            if 0 < #_FORV_4_.gimmickBgHdls then
              _FORV_4_.gimmickBgHdls[1]:setLockonPermission(true)
              for _FORV_8_, _FORV_9_ in pairs(_FORV_4_.gimmickBgHdls) do
                _FORV_9_:setActive(true)
              end
            end
          end
          L0_101(L1_102, true)
          repeat
            wait(5)
            if true == A0_86.canon_hit_flg then
              A0_86.gage_01:setHp(L0_101 / L1_87)
              A0_86.canon_hit_flg = false
            elseif true == A0_86.canon_normal_hit_flg then
              A0_86.gage_01:setHp(L0_101 / L1_87)
              A0_86.canon_normal_hit_flg = false
            end
          until false
        end
        L0_88 = L0_88(L1_89)
        A0_86.task = L0_88
      end)
    else
    end
  end
end
L0_0.start = L1_1
L0_0 = _warship_attack_on_the_cannon
function L1_1(A0_103)
  Player:setTargetingPriority(Player.kTargetingPrio_Default)
  if A0_103.task then
    A0_103.task:abort()
  end
  for _FORV_4_, _FORV_5_ in ipairs(A0_103.canon_weak_point) do
    for _FORV_9_, _FORV_10_ in ipairs(_FORV_5_.gimmickBgHdls) do
      _FORV_10_:try_term()
    end
  end
  if A0_103.gage_01 then
    HUD:deleteBossHpGauge()
    A0_103.gage_01 = nil
  end
  _warship_attack_on_the_cannon:init()
end
L0_0.stop = L1_1
L0_0 = _warship_attack_on_the_cannon
L1_1 = L0_0
L0_0 = L0_0.init
L0_0(L1_1)
L0_0 = {}
_support_controller_crow = L0_0
L0_0 = {}
L0_0.UNKNOWN = 0
L0_0.UNCREATED = 10
L0_0.STANBY = 20
L0_0.MOVE = 30
L0_0.SABOTAGE = 50
L0_0.FOLLOW = 65
L0_0.FINALIE = 70
_CROW_EP10E_STATE = L0_0
L0_0 = _support_controller_crow
function L1_1(A0_104)
  local L1_105
  A0_104.req_receipt_setup = false
  A0_104.is_ready = false
  A0_104.is_event_start = false
  A0_104.event_task = nil
  A0_104.puppet_crow = nil
  A0_104.brain_crow = nil
  L1_105 = _CROW_EP10E_STATE
  L1_105 = L1_105.UNCREATED
  A0_104.crow_event_state = L1_105
  A0_104.sensor = nil
  A0_104.detection_enemycount = 0
end
L0_0.init = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_106, A1_107)
  local L2_108
  L2_108 = A0_106.brain_crow
  if L2_108 then
    L2_108 = Fn_TerminateSupporterFromBrain
    L2_108(A0_106.brain_crow)
  end
  L2_108 = A0_106.puppet_crow
  if L2_108 then
    L2_108 = Fn_TerminateSupporterFromPuppet
    L2_108(A0_106.puppet_crow)
  end
  L2_108 = findGameObject2
  L2_108 = L2_108("Puppet", "_puppet_supporter_raven")
  if L2_108 then
    Fn_TerminateSupporterFromPuppet(L2_108)
    L2_108 = nil
  end
  _G.OnEnterDetectionEnemySensor_crow = nil
  _G.OnleaveDetectionEnemySensor_crow = nil
  if A0_106.event_task then
    A0_106.event_task:abort()
  end
  A0_106:init()
end
L0_0.finalize = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_109)
  if false == A0_109.req_receipt_setup and false == A0_109.is_ready then
    A0_109.req_receipt_setup = true
    invokeSystemTask(function()
      A0_109.puppet_crow = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Ground, "locator2_crow_03")
      A0_109.brain_crow = A0_109.puppet_crow:getBrain()
      A0_109.brain_crow:setAbility(Supporter.Ability.ActionInAir, false)
      A0_109.brain_crow:setIdling(true)
      A0_109.req_receipt_setup = false
      A0_109.is_ready = true
    end)
  end
end
L0_0.setup = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_110)
  local L1_111
  L1_111 = A0_110.is_ready
  return L1_111
end
L0_0.isSetup = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_112)
  if false == A0_112.is_event_start then
    A0_112.is_event_start = true
    A0_112.event_task = invokeTask(function()
      local L0_113
      L0_113 = waitSeconds
      L0_113(0.5)
      L0_113 = A0_112
      L0_113 = L0_113._state_move
      L0_113(L0_113)
      L0_113 = _CROW_EP10E_STATE
      L0_113 = L0_113.SABOTAGE
      repeat
        if _CROW_EP10E_STATE.FOLLOW == L0_113 then
          L0_113 = A0_112:_state_follow()
        elseif _CROW_EP10E_STATE.SABOTAGE == L0_113 then
          L0_113 = A0_112:_state_sabotage()
          do break end
          do break end
          wait()
        end
      until false
      A0_112.is_event_start = false
    end)
  end
end
L0_0.eventStart = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_114)
  if A0_114.event_task then
    A0_114.event_task:abort()
    A0_114.event_task = nil
  end
end
L0_0.eventEnd = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_115)
  local L1_116, L2_117, L3_118, L4_119, L5_120, L6_121, L7_122, L8_123
  L1_116 = A0_115.brain_crow
  L2_117 = L1_116
  L1_116 = L1_116.setAbility
  L1_116(L2_117, L3_118, L4_119)
  L1_116 = A0_115.brain_crow
  L2_117 = L1_116
  L1_116 = L1_116.setIdling
  L1_116(L2_117, L3_118)
  L1_116 = 13
  L2_117 = {L3_118}
  L6_121 = "locator2_crow_03"
  L3_118.pos = L4_119
  L3_118.action = L4_119
  L3_118.vel = 10
  for L6_121 = 1, 4 do
    L7_122 = string
    L7_122 = L7_122.format
    L8_123 = "locator2_crow_air_roat_%02d"
    L7_122 = L7_122(L8_123, L6_121)
    L8_123 = {}
    L8_123.pos = findGameObject2("Node", L7_122):getWorldPos()
    L8_123.action = Supporter.MovePoint.Air
    L8_123.vel = L1_116 + 2.5 * (L6_121 - 1)
    table.insert(L2_117, L8_123)
  end
  L3_118(L4_119)
  L3_118(L4_119, L5_120)
  L3_118(L4_119)
  repeat
    L3_118()
  until L3_118
  L3_118(L4_119)
  L6_121 = true
  L3_118(L4_119, L5_120, L6_121)
  L3_118(L4_119, L5_120)
end
L0_0._state_move = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_124)
  local L1_125, L2_126
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.resetFollowPoint
  L1_125(L2_126)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.ActionInAir, true)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Damaged, false)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Follow, false)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Attack, true)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setIdling
  L1_125(L2_126, false)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Parallel.Normal, false)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Parallel.Mars, false)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Parallel.Jupiter, false)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Parallel.NormalSp, true)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Parallel.MarsSp, true)
  L1_125 = A0_124.brain_crow
  L2_126 = L1_125
  L1_125 = L1_125.setAbility
  L1_125(L2_126, Supporter.Ability.Parallel.JupiterSp, true)
  L1_125 = findGameObject2
  L2_126 = "Node"
  L1_125 = L1_125(L2_126, "locator2_clow_follow_point_01")
  L2_126 = A0_124.brain_crow
  L2_126 = L2_126.setFollowPoint
  L2_126(L2_126, true, L1_125, 50)
  L2_126 = A0_124.brain_crow
  L2_126 = L2_126.setDetectThreatDistance
  L2_126(L2_126, 100)
  L2_126 = A0_124.brain_crow
  L2_126 = L2_126.clearThreatObject
  L2_126(L2_126)
  L2_126 = {}
  for _FORV_6_, _FORV_7_ in ipairs(_warship_attack_on_the_cannon.canon_weak_point) do
    if _FORV_7_.gimmickBgHdls and #_FORV_7_.gimmickBgHdls > 0 then
      table.insert(L2_126, _FORV_7_.gimmickBgHdls[1])
    end
  end
  for _FORV_6_, _FORV_7_ in pairs(enmgen2_ar_b_orbiter_02.spawnSet) do
    table.insert(L2_126, findGameObject2("Puppet", _FORV_7_.name))
  end
  A0_124.brain_crow:setThreatObjects(L2_126)
  A0_124.brain_crow:setThreatObjectAttackType(Supporter.AttackAction.Auto)
  A0_124.brain_crow:setThreatObjectAttackParams({
    type = Supporter.AttackAction.Auto,
    distance = 10000,
    power = 1000
  })
  repeat
    waitSeconds(1)
  until false
  return nil
end
L0_0._state_sabotage = L1_1
L0_0 = _support_controller_crow
function L1_1(A0_127)
  A0_127.brain_crow:reset()
  A0_127.brain_crow:resetFollowPoint()
  A0_127.brain_crow:setAbility(Supporter.Ability.ActionInAir, true)
  A0_127.brain_crow:setAbility(Supporter.Ability.Damaged, false)
  A0_127.brain_crow:setAbility(Supporter.Ability.Follow, true)
  A0_127.brain_crow:setAbility(Supporter.Ability.Attack, true)
  A0_127.brain_crow:setIdling(false)
  A0_127.brain_crow:setAbility(Supporter.Ability.Parallel.Normal, true)
  A0_127.brain_crow:setAbility(Supporter.Ability.Parallel.Mars, true)
  A0_127.brain_crow:setAbility(Supporter.Ability.Parallel.Jupiter, true)
  A0_127.brain_crow:setAbility(Supporter.Ability.Parallel.NormalSp, true)
  A0_127.brain_crow:setAbility(Supporter.Ability.Parallel.MarsSp, true)
  A0_127.brain_crow:setAbility(Supporter.Ability.Parallel.JupiterSp, true)
  A0_127.brain_crow:resetFollowPoint()
  A0_127.brain_crow:clearThreatObject()
  repeat
    if 50 <= Fn_get_distance(Fn_getPlayerWorldPos(), findGameObject2("Node", "locator2_clow_follow_point_01"):getWorldPos()) then
      return _CROW_EP10E_STATE.SABOTAGE
    end
    waitSeconds(1)
  until false
  return nil
end
L0_0._state_follow = L1_1
L0_0 = _support_controller_crow
L1_1 = L0_0
L0_0 = L0_0.init
L0_0(L1_1)
_eviction_shelling_player = false
function L0_0(A0_128, A1_129)
  print("pccubesensormulti2_intrusion_range_OnEnter")
  _eviction_shelling_player = true
  if false == _text_view_played then
    invokeTask(function()
      waitSeconds(1.5)
      if false == _text_view_ng_flg then
        _text_view_played = true
        Fn_captionViewWait("ep10_02012")
        _text_view_played = false
      end
    end)
  end
end
pccubesensormulti2_intrusion_range_OnEnter = L0_0
function L0_0(A0_130, A1_131)
  print("pccubesensormulti2_intrusion_range_OnLeave")
  _eviction_shelling_player = false
end
pccubesensormulti2_intrusion_range_OnLeave = L0_0
L0_0 = {}
ep10cannonWarship = L0_0
L0_0 = ep10cannonWarship
function L1_1()
  local L0_132, L1_133
  L0_132 = {}
  L0_132.task_barrage_warship = nil
  L0_132.task_intrusion_ban_warship = nil
  function L1_133(A0_134)
    L0_132.task_intrusion_ban_warship = WarshipIntrusionBan.new()
    L0_132.task_intrusion_ban_warship:action()
  end
  L0_132.action = L1_133
  function L1_133(A0_135)
    A0_135.task_intrusion_ban_warship:taskAbort()
  end
  L0_132.taskAbort = L1_133
  return L0_132
end
L0_0.new = L1_1
L0_0 = {}
WarshipIntrusionBan = L0_0
L0_0 = WarshipIntrusionBan
function L1_1()
  local L0_136, L1_137
  L0_136 = {}
  L0_136.MONITORING = 1
  L0_136.SHOT = 2
  L0_136.SHOT_INTERVAL = 3
  STATE_DEF = L0_136
  L0_136 = {}
  L0_136.MIN_BROW_AMO = 15
  L0_136.RADIUS = 190
  BROW_DEF = L0_136
  L0_136 = {}
  L0_136.MAX_INTERVAL = 30
  CANNON_DEF = L0_136
  L0_136 = {}
  L0_136.MAX_PLACE_MAKING = 1
  EXPLOSION_DEF = L0_136
  L0_136 = {}
  L0_136.task_hdl = nil
  L0_136.bullt_effects = nil
  function L1_137(A0_138)
    return invokeTask(function()
      local L0_139, L1_140, L2_141, L3_142, L4_143, L5_144, L6_145, L7_146, L8_147, L9_148, L10_149
      L0_139 = mother2
      L1_140 = L0_139
      L0_139 = L0_139.sendEvent
      L2_141 = "getBackgroundElement2Handle"
      L3_142 = "ar"
      L0_139 = L0_139(L1_140, L2_141, L3_142)
      L2_141 = L0_139
      L1_140 = L0_139.getName
      L1_140 = L1_140(L2_141)
      L2_141 = Fn_findAreaHandle
      L3_142 = "ar_b_root"
      L2_141 = L2_141(L3_142)
      L3_142 = A0_138.creatEffect
      L4_143 = A0_138
      L3_142(L4_143)
      L3_142 = A0_138.createBulletShockWave
      L4_143 = A0_138
      L3_142(L4_143)
      while true do
        L3_142 = A0_138.task_hdl
        if L3_142 ~= nil then
          L3_142 = A0_138.bullt_effects
        end
        if L3_142 == nil then
          L3_142 = wait
          L3_142()
        end
      end
      L3_142 = STATE_DEF
      L3_142 = L3_142.MONITORING
      L4_143 = 0
      while true do
        L5_144 = STATE_DEF
        L5_144 = L5_144.MONITORING
        if L3_142 == L5_144 then
          L5_144 = _eviction_shelling_player
          if L5_144 == true then
            L5_144 = STATE_DEF
            L3_142 = L5_144.SHOT
          else
            L4_143 = 0
          end
        else
          L5_144 = STATE_DEF
          L5_144 = L5_144.SHOT
          if L3_142 == L5_144 then
            L5_144 = Fn_getPlayerWorldPos
            L5_144 = L5_144()
            L7_146 = L2_141
            L6_145 = L2_141.getWorldPos
            L6_145 = L6_145(L7_146)
            L7_146 = _eviction_shelling_player
            if L7_146 == true then
              L7_146 = A0_138.playEffect
              L8_147 = A0_138
              L9_148 = L5_144
              L7_146 = L7_146(L8_147, L9_148)
              if L7_146 ~= nil then
                L8_147 = Fn_get_distance
                L9_148 = Fn_getPlayerWorldPos
                L9_148 = L9_148()
                L10_149 = L6_145
                L8_147 = L8_147(L9_148, L10_149)
                L9_148 = BROW_DEF
                L9_148 = L9_148.RADIUS
                L9_148 = L9_148 - L8_147
                if L9_148 <= 0 then
                  L9_148 = 0
                end
                L10_149 = BROW_DEF
                L10_149 = L10_149.MIN_BROW_AMO
                L9_148 = L9_148 + L10_149
                L10_149 = L5_144 - L6_145
                L10_149.x = L10_149.x * 0.15
                L10_149.z = L10_149.z * 0.15
                L10_149 = L10_149:Normalize()
                L10_149.x = L10_149.x * -1
                L10_149.y = L10_149.y * -1
                L10_149.z = L10_149.z * -1
                A0_138.attackBulletShockWave(A0_138, L5_144 + L10_149 * 5)
                Player:applyImpactDamage(L5_144 + L10_149 * 5 * 5, L10_149 * 1, Player:getEnergyMax(Player.kEnergy_Life) * 0.1, false)
                Camera:shake3D(1.5, 1.5, 0.7, L5_144, 100)
                Sound:playSE("ef_ev_exp_01", 1, "", L7_146)
                L3_142 = STATE_DEF.SHOT_INTERVAL
                L4_143 = CANNON_DEF.MAX_INTERVAL
              end
            else
              L7_146 = STATE_DEF
              L3_142 = L7_146.MONITORING
              L4_143 = 0
            end
          else
            L5_144 = STATE_DEF
            L5_144 = L5_144.SHOT_INTERVAL
            if L3_142 == L5_144 then
              L5_144 = _eviction_shelling_player
              if L5_144 then
                if L4_143 <= 0 then
                  L5_144 = STATE_DEF
                  L3_142 = L5_144.SHOT
                  L4_143 = 0
                else
                  L4_143 = L4_143 - 1
                end
              else
                L5_144 = STATE_DEF
                L3_142 = L5_144.MONITORING
                L4_143 = 0
              end
            end
          end
        end
        L5_144 = wait
        L5_144()
      end
    end)
  end
  L0_136.warshipIntrusionBan = L1_137
  function L1_137(A0_150)
    invokeSystemTask(function()
      local L0_151, L1_152, L3_153, L4_154
      L0_151 = {}
      for _FORV_4_ = 1, L3_153.MAX_PLACE_MAKING do
        Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false):stop()
        table.insert(L0_151, {
          effect = Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false),
          use = false
        })
      end
      A0_150.bullt_effects = L0_151
    end)
  end
  L0_136.creatEffect = L1_137
  function L1_137(A0_155, A1_156)
    Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false):stop()
    Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false):setTime(0)
    Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false):setWorldPos(A1_156)
    Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false):try_init()
    Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false):waitForReadyAsync(function(A0_157)
      A0_157:try_start()
      A0_157:play()
      waitSeconds(3)
      A0_157:stop()
    end)
    return (Fn_createEffect("bom", "ef_ev_exp_01", Vector(0, 0, 0), false))
  end
  L0_136.playEffect = L1_137
  function L1_137(A0_158)
    invokeSystemTask(function()
      local L0_159, L1_160
      L0_159 = createGameObject2
      L1_160 = "BulletShockwave"
      L0_159 = L0_159(L1_160)
      L1_160 = {}
      L1_160.type = "windfield"
      L1_160.damage = 0
      L1_160.force = 60
      L1_160.time = 9999
      L1_160.interval = 0
      L1_160.radius = 50
      L0_159:setParam(L1_160)
      L0_159:try_init()
      L0_159:waitForReady()
      L0_159:try_start()
      A0_158.bsw_obj = L0_159
    end)
  end
  L0_136.createBulletShockWave = L1_137
  function L1_137(A0_161, A1_162)
    if A0_161.bsw_obj ~= nil then
      A0_161.bsw_obj:attack({pos = A1_162, time = 9999})
      invokeTask(function()
        wait(10)
        A0_161.bsw_obj:attack({
          pos = Vector(0, 0, 0),
          time = 0
        })
      end)
      return true
    end
    return false
  end
  L0_136.attackBulletShockWave = L1_137
  function L1_137(A0_163)
    A0_163.task_hdl = A0_163.warshipIntrusionBan(A0_163)
  end
  L0_136.action = L1_137
  function L1_137(A0_164)
    A0_164.task_hdl:abort()
    A0_164.task_hdl = nil
    for _FORV_4_, _FORV_5_ in pairs(A0_164.bullt_effects) do
      _FORV_5_.effect:try_term()
    end
    A0_164.bullt_effects = {}
    A0_164.bsw_obj:try_term()
    A0_164.bsw_obj = nil
    A0_164.support_chrs = {}
  end
  L0_136.taskAbort = L1_137
  return L0_136
end
L0_0.new = L1_1
L0_0 = {}
_bluff_shelling = L0_0
L0_0 = _bluff_shelling
function L1_1(A0_165)
  local L1_166
  A0_165.is_nowPreparation = false
  A0_165.is_endPreparation = false
  A0_165.event_task = nil
  A0_165.nodeBluffShelling = nil
  L1_166 = {}
  A0_165.place_making_eff = L1_166
  L1_166 = {}
  A0_165.inUse_eff = L1_166
end
L0_0.init = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_167)
  A0_167:eventEnd()
  A0_167:init()
end
L0_0.finalize = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_168)
  if false == A0_168.is_nowPreparation and false == A0_168.is_endPreparation then
    A0_168.is_nowPreparation = true
    A0_168.nodeBluffShelling = findGameObject2("Node", "locator2_bluff_shelling_01")
    A0_168.is_nowPreparation = false
    A0_168.is_endPreparation = true
  end
end
L0_0.preparation = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_169)
  local L1_170
  L1_170 = A0_169.is_endPreparation
  return L1_170
end
L0_0.isPreparation = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_171)
  local L1_172, L2_173, L3_174, L4_175, L5_176
  L1_172 = {}
  for L5_176, _FORV_6_ in L2_173(L3_174) do
    if false == _FORV_6_ then
      table.insert(L1_172, L5_176)
    end
  end
  return L1_172
end
L0_0.findAvailableEffect = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_177, A1_178, A2_179)
  local L3_180
  L3_180 = A0_177.inUse_eff
  L3_180[A2_179] = true
  L3_180 = A0_177.place_making_eff
  L3_180 = L3_180[A2_179]
  L3_180:setTime(0)
  L3_180:stop()
  L3_180:setWorldPos(A1_178)
  L3_180:play()
  invokeTask(function()
    waitSeconds(3)
    L3_180:stop()
    L3_180:setTime(0)
    A0_177.inUse_eff[A2_179] = false
  end)
end
L0_0.playPlaceMakingEffect = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_181, A1_182)
  local L2_183
  L2_183 = Fn_createEffect
  L2_183 = L2_183("bom", "ef_ev_exp_01", Vector(0, 0, 0), false)
  A0_181.nodeBluffShelling:appendChild(L2_183)
  L2_183:try_init()
  L2_183:waitForReadyAsync(function(A0_184)
    A0_184:try_start()
    A0_184:setWorldPos(A1_182)
    if 15 >= Fn_get_distance(Fn_getPlayerWorldPos(), A1_182) then
      Camera:shake3D(0.95, 1.45, 1.2, A1_182, 80)
      Sound:playSE("ef_ev_exp_01", 1, "", A0_184)
    end
    waitSeconds(3)
    A0_184:try_term()
  end)
end
L0_0.autoPlayPlaceMakingEffect = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_185)
  if A0_185.event_task then
    A0_185.event_task:abort()
  end
  A0_185.event_task = invokeTask(function()
    local L0_186, L1_187, L2_188, L3_189, L4_190, L5_191, L6_192, L7_193
    L0_186 = A0_185.nodeBluffShelling
    L1_187 = 0
    L2_188 = 410
    L3_189 = 300
    L4_190 = 7
    L5_191 = L2_188 - L3_189
    L5_191 = L5_191 / L4_190
    L6_192 = {}
    L6_192.unknown = 0
    L6_192.pre_first_shelling = 10
    L6_192.shelling = 20
    L6_192.shelling02 = 25
    L6_192.cool_time = 40
    L6_192.stop = 100
    function L7_193(A0_194, A1_195, A2_196)
      local L3_197, L4_198, L5_199
      L3_197 = Cos
      L4_198 = A1_195
      L3_197 = L3_197(L4_198)
      L4_198 = A2_196.x
      L3_197 = L3_197 * L4_198
      L4_198 = Sin
      L5_199 = -A0_194
      L4_198 = L4_198(L5_199)
      L5_199 = Sin
      L5_199 = L5_199(-A1_195)
      L4_198 = L4_198 * L5_199
      L5_199 = A2_196.y
      L4_198 = L4_198 * L5_199
      L3_197 = L3_197 + L4_198
      L4_198 = Cos
      L5_199 = A0_194
      L4_198 = L4_198(L5_199)
      L5_199 = Sin
      L5_199 = L5_199(-A1_195)
      L4_198 = L4_198 * L5_199
      L5_199 = A2_196.z
      L4_198 = L4_198 * L5_199
      L3_197 = L3_197 + L4_198
      L4_198 = Cos
      L5_199 = A0_194
      L4_198 = L4_198(L5_199)
      L5_199 = A2_196.y
      L4_198 = L4_198 * L5_199
      L5_199 = Sin
      L5_199 = L5_199(A0_194)
      L5_199 = L5_199 * A2_196.z
      L4_198 = L4_198 + L5_199
      L5_199 = Sin
      L5_199 = L5_199(A1_195)
      L5_199 = L5_199 * A2_196.x
      L5_199 = L5_199 + Sin(-A0_194) * Cos(A1_195) * A2_196.y
      L5_199 = L5_199 + Cos(A0_194) * Cos(A1_195) * A2_196.z
      return Vector(L3_197, L4_198, L5_199)
    end
    XYRollMultipleVector3 = L7_193
    function L7_193(A0_200, A1_201)
      local L2_202, L3_203, L4_204, L5_205, L6_206, L7_207, L8_208, L9_209, L10_210, L11_211, L12_212, L13_213, L14_214, L15_215
      L2_202 = L6_192.unknown
      L3_203, L4_204 = nil, nil
      repeat
        L5_205 = L0_186
        L6_206 = L5_205
        L5_205 = L5_205.getWorldPos
        L5_205 = L5_205(L6_206)
        L7_207 = A0_200
        L6_206 = A0_200.getWorldPos
        L6_206 = L6_206(L7_207)
        L7_207 = Camera
        L8_208 = L7_207
        L7_207 = L7_207.getEyePos
        L7_207 = L7_207(L8_208)
        L8_208 = L6_192.unknown
        if L8_208 == L2_202 then
          L2_202 = L6_192.pre_first_shelling
        else
          L8_208 = L6_192.pre_first_shelling
          if L8_208 == L2_202 then
            L8_208 = Fn_get_distance
            L9_209 = L5_205
            L10_210 = L6_206
            L8_208 = L8_208(L9_209, L10_210)
            L9_209 = L2_188
            if L8_208 <= L9_209 then
              L9_209 = L3_189
              if L8_208 >= L9_209 then
                L2_202 = L6_192.shelling
              else
                L9_209 = L5_205.y
                L9_209 = L9_209 + 53
                L10_210 = L6_206.y
                if L9_209 < L10_210 and L8_208 > 110 then
                  L2_202 = L6_192.shelling02
                end
              end
            end
          else
            L8_208 = L6_192.shelling
            if L8_208 == L2_202 then
              L8_208, L9_209 = nil, nil
              L10_210 = NormalizeVector
              L10_210 = L10_210(L11_211)
              L14_214 = L10_210.z
              L10_210 = L11_211
              L15_215 = L11_211
              L14_214 = L11_211.Length
              L15_215 = L14_214(L15_215)
              L9_209 = L12_212
              L8_208 = L12_212
              L14_214 = L8_208.y
              L15_215 = L8_208.z
              L8_208 = L12_212
              L10_210 = RandI
              L10_210 = L10_210(L11_211, L12_212)
              for L14_214 = 1, L10_210 do
                L15_215 = nil
                L15_215 = XYRollMultipleVector3(RandF(-0.031400000000000004, 0.031400000000000004), RandF(-0.785, 0.785), L8_208)
                L15_215 = L15_215:Normalize()
                L15_215 = Vector(L15_215.x, L15_215.y, L15_215.z)
                L8_208 = L15_215
                L15_215 = invokeTask
                L15_215(function(A0_216, A1_217)
                  local L2_218
                  L2_218 = wait
                  L2_218(A1_217)
                  L2_218 = L5_205
                  L2_218 = L2_218 + A0_216
                  A0_185:autoPlayPlaceMakingEffect(L2_218)
                end, L8_208 * math.max(L3_189, L9_209 - RandI(20, 65)), RandI(5, 40))
              end
              L15_215 = L11_211
              L14_214 = L11_211.Length
              L15_215 = L14_214(L15_215)
              L9_209 = L12_212
              L8_208 = L12_212
              L14_214 = L8_208.y
              L15_215 = L8_208.z
              L8_208 = L12_212
              L10_210 = L11_211
              for L14_214 = 1, L10_210 do
                L15_215 = nil
                L15_215 = XYRollMultipleVector3(RandF(-0.15700000000000003, 0.15700000000000003), RandF(-0.0942, 0.0942), L8_208)
                L15_215 = L15_215:Normalize()
                L15_215 = Vector(L15_215.x, L15_215.y, L15_215.z)
                L8_208 = L15_215
                L15_215 = invokeTask
                L15_215(function(A0_219, A1_220)
                  local L2_221
                  L2_221 = wait
                  L2_221(A1_220)
                  L2_221 = L5_205
                  L2_221 = L2_221 + A0_219
                  A0_185:autoPlayPlaceMakingEffect(L2_221)
                end, L8_208 * math.max(L3_189, L9_209 - RandI(-10, 45)), RandI(5, 20))
              end
              L2_202 = L6_192.cool_time
            else
              L8_208 = L6_192.shelling02
              if L8_208 == L2_202 then
                L8_208, L9_209 = nil, nil
                L10_210 = NormalizeVector
                L10_210 = L10_210(L11_211)
                L14_214 = L10_210.z
                L10_210 = L11_211
                L15_215 = L11_211
                L14_214 = L11_211.Length
                L15_215 = L14_214(L15_215)
                L9_209 = L12_212
                L8_208 = L12_212
                L14_214 = L8_208.y
                L15_215 = L8_208.z
                L8_208 = L12_212
                L10_210 = RandI
                L10_210 = L10_210(L11_211, L12_212)
                for L14_214 = 1, L10_210 do
                  L15_215 = nil
                  L15_215 = XYRollMultipleVector3(RandF(-0.031400000000000004, 0.031400000000000004), RandF(-0.785, 0.785), L8_208)
                  L15_215 = L15_215:Normalize()
                  L15_215 = Vector(L15_215.x, L15_215.y, L15_215.z)
                  L8_208 = L15_215
                  L15_215 = invokeTask
                  L15_215(function(A0_222, A1_223)
                    local L2_224
                    L2_224 = wait
                    L2_224(A1_223)
                    L2_224 = L5_205
                    L2_224 = L2_224 + A0_222
                    A0_185:autoPlayPlaceMakingEffect(L2_224)
                  end, L8_208 * math.max(110, L9_209 - RandI(20, 65)), RandI(5, 30))
                end
                L15_215 = L11_211
                L14_214 = L11_211.Length
                L15_215 = L14_214(L15_215)
                L9_209 = L12_212
                L8_208 = L12_212
                L14_214 = L8_208.y
                L15_215 = L8_208.z
                L8_208 = L12_212
                L10_210 = L11_211
                for L14_214 = 1, L10_210 do
                  L15_215 = nil
                  L15_215 = XYRollMultipleVector3(RandF(-0.15700000000000003, 0.15700000000000003), RandF(-0.0942, 0.0942), L8_208)
                  L15_215 = L15_215:Normalize()
                  L15_215 = Vector(L15_215.x, L15_215.y, L15_215.z)
                  L8_208 = L15_215
                  L15_215 = invokeTask
                  L15_215(function(A0_225, A1_226)
                    local L2_227
                    L2_227 = wait
                    L2_227(A1_226)
                    L2_227 = L5_205
                    L2_227 = L2_227 + A0_225
                    A0_185:autoPlayPlaceMakingEffect(L2_227)
                  end, L8_208 * math.max(110, L9_209 - RandI(-10, 45)), RandI(5, 20))
                end
                L2_202 = L6_192.cool_time
              else
                L8_208 = L6_192.cool_time
                if L8_208 == L2_202 then
                  L8_208 = waitSeconds
                  L9_209 = 0.8
                  L8_208(L9_209)
                  L2_202 = L6_192.pre_first_shelling
                else
                  L8_208 = L6_192.stop
                  if L8_208 == L2_202 then
                  end
                end
              end
            end
          end
        end
        L8_208 = wait
        L8_208()
        L8_208 = A0_185.event_task
      until nil == L8_208
      break
    end
    invokeTask(function()
      local L0_228
      L0_228 = Fn_getPlayer
      L0_228 = L0_228()
      L7_193(L0_228)
    end)
    invokeTask(function()
      L7_193(_support_controller_crow.puppet_crow)
    end)
    repeat
      wait()
    until false
  end)
end
L0_0.eventStart = L1_1
L0_0 = _bluff_shelling
function L1_1(A0_229)
  if A0_229.event_task then
    A0_229.event_task:abort()
    A0_229.event_task = nil
  end
end
L0_0.eventEnd = L1_1
L0_0 = _bluff_shelling
L1_1 = L0_0
L0_0 = L0_0.init
L0_0(L1_1)
