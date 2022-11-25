dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Mission/sm15_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
ENCOUNT_TYPE_NONE = 0
ENCOUNT_TYPE_MOVE = 1
ENCOUNT_TYPE_MOVE_VISIBLE = 2
ENCOUNT_TYPE_TURN = 3
ENCOUNT_TYPE_SITING = 4
ENCOUNT_TYPE_FOLLOW = 5
ENCOUNT_TYPE_TALK = 6
PLAYER_FOLLOW_TARGET_NODE = "player_follow_target_node"
_puppet_tbl = {}
_npc_hdl_tbl = {}
_talk_task = {}
_is_area_distant = false
_is_in_editor_sensor = false
_is_mob_gesture = false
_g_pointing = {
  is_encount = false,
  encount_sensor_name = nil,
  is_success_wait = false,
  is_pointing = false,
  is_mission_end = false,
  is_retry = false,
  is_gesture = false,
  is_success = false,
  is_request_cry = false,
  is_client_found = false,
  is_area_fall = false,
  view_control_task = nil,
  gesture_time = 0,
  black_human_move_task = {},
  retry_time_max = 90,
  black_human_contact_name_tbl = {},
  is_look_end_tbl = {}
}
_g_debug = {
  is_enable_encount_sensor = true,
  is_enable_lock_run = true,
  is_invalid_skip_encount = true,
  is_invalid_debug_perfomance = true
}
_g_encount_npc_route_tbl = {
  route_01 = {
    "locator2_encount_01_01"
  },
  route_02 = {
    "locator2_encount_02_01"
  },
  route_03 = {},
  route_04 = {},
  route_05 = {},
  route_06 = {
    "locator2_encount_06_01"
  },
  route_07 = {},
  route_08 = {},
  route_09 = {
    "locator2_encount_09_01"
  },
  route_10 = {
    "locator2_encount_10_01"
  },
  route_11 = {},
  route_12 = {
    "locator2_encount_12_01"
  },
  route_13 = {
    "locator2_encount_13_01"
  },
  route_14 = {},
  route_15 = {},
  route_16 = {
    "locator2_encount_16_01"
  },
  route_17 = {}
}
_g_encoun_npc_random_generation_tbl = {
  tbl_01 = {},
  tbl_02 = {
    "locator2_encount_02_random_01",
    "locator2_encount_02_random_02",
    "locator2_encount_02_random_03",
    "locator2_encount_02_random_04",
    "locator2_encount_02_random_05",
    "locator2_encount_02_random_06",
    "locator2_encount_02_random_07",
    "locator2_encount_02_random_08"
  },
  tbl_03 = {},
  tbl_04 = {},
  tbl_05 = {},
  tbl_06 = {
    "locator2_encount_06_random_01",
    "locator2_encount_06_random_02",
    "locator2_encount_06_random_03",
    "locator2_encount_06_random_04",
    "locator2_encount_06_random_05",
    "locator2_encount_06_random_06",
    "locator2_encount_06_random_07",
    "locator2_encount_06_random_08"
  },
  tbl_07 = {},
  tbl_08 = {},
  tbl_09 = {},
  tbl_10 = {},
  tbl_11 = {},
  tbl_12 = {
    "locator2_encount_12_random_01",
    "locator2_encount_12_random_02",
    "locator2_encount_12_random_03",
    "locator2_encount_12_random_04",
    "locator2_encount_12_random_05",
    "locator2_encount_12_random_06",
    "locator2_encount_12_random_07",
    "locator2_encount_12_random_08"
  },
  tbl_13 = {
    "locator2_encount_13_random_01",
    "locator2_encount_13_random_02",
    "locator2_encount_13_random_03",
    "locator2_encount_13_random_04",
    "locator2_encount_13_random_05",
    "locator2_encount_13_random_06",
    "locator2_encount_13_random_07",
    "locator2_encount_13_random_08"
  },
  tbl_14 = {},
  tbl_15 = {},
  tbl_16 = {
    "locator2_encount_16_random_01",
    "locator2_encount_16_random_02",
    "locator2_encount_16_random_03",
    "locator2_encount_16_random_04",
    "locator2_encount_16_random_05",
    "locator2_encount_16_random_06",
    "locator2_encount_16_random_07",
    "locator2_encount_16_random_08"
  },
  tbl_17 = {}
}
_encount_tbl = {}
_encount_tbl.pccubesensor2_encount_01 = {
  name = "sm15_black_human_01",
  campany = nil,
  default_node = "locator2_black_human_c_01",
  campany_node = nil,
  type = "man38",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_MOVE,
  route = _g_encount_npc_route_tbl.route_01,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_02 = {
  name = "sm15_black_human_02",
  campany = nil,
  default_node = "locator2_black_human_c_02",
  campany_node = nil,
  type = "man38",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_MOVE,
  route = _g_encount_npc_route_tbl.route_02,
  random_generation = _g_encoun_npc_random_generation_tbl.tbl_02,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_03 = {
  name = "sm15_black_human_03",
  campany = nil,
  default_node = "locator2_black_human_c_03",
  campany_node = nil,
  type = "man39",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_FOLLOW,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_04 = {
  name = "sm15_black_human_04",
  campany = nil,
  default_node = "locator2_black_human_c_04",
  campany_node = nil,
  type = "man40",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_TURN,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_05 = {
  name = "sm15_black_human_05",
  campany = "sm15_black_human_05_p",
  default_node = "locator2_black_human_c_05",
  campany_node = "locator2_black_human_c_05_p",
  type = "man41",
  company_type = "man40",
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_TALK,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_06 = {
  name = "sm15_black_human_06",
  campany = nil,
  default_node = "locator2_black_human_c_06",
  campany_node = nil,
  type = "man62",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_MOVE,
  route = _g_encount_npc_route_tbl.route_06,
  random_generation = _g_encoun_npc_random_generation_tbl.tbl_06,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_07 = {
  name = "sm15_black_human_07",
  campany = nil,
  default_node = "locator2_black_human_c_07",
  campany_node = nil,
  type = "man69",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_TURN,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_08 = {
  name = "sm15_black_human_08",
  campany = nil,
  default_node = "locator2_black_human_c_08",
  campany_node = nil,
  type = "man76",
  company_type = nil,
  default_motion = "sit_00",
  encount_type = ENCOUNT_TYPE_SITING,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_09 = {
  name = "sm15_black_human_09",
  campany = nil,
  default_node = "locator2_black_human_c_09",
  campany_node = nil,
  type = "man78",
  company_type = nil,
  default_motion = "sit_00",
  encount_type = ENCOUNT_TYPE_MOVE_VISIBLE,
  route = _g_encount_npc_route_tbl.route_09,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_10 = {
  name = "sm15_black_human_10",
  campany = nil,
  default_node = "locator2_black_human_c_10",
  campany_node = nil,
  type = "man37",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_MOVE_VISIBLE,
  route = _g_encount_npc_route_tbl.route_10,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_11 = {
  name = "sm15_black_human_11",
  campany = nil,
  default_node = "locator2_black_human_c_11",
  campany_node = nil,
  type = "wom21",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_TURN,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_12 = {
  name = "sm15_black_human_12",
  campany = nil,
  default_node = "locator2_black_human_c_12",
  campany_node = nil,
  type = "wom21",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_MOVE,
  route = _g_encount_npc_route_tbl.route_12,
  random_generation = _g_encoun_npc_random_generation_tbl.tbl_12,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_13 = {
  name = "sm15_black_human_13",
  campany = nil,
  default_node = "locator2_black_human_c_13",
  campany_node = nil,
  type = "wom23",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_MOVE,
  route = _g_encount_npc_route_tbl.route_13,
  random_generation = _g_encoun_npc_random_generation_tbl.tbl_13,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_14 = {
  name = "sm15_black_human_14",
  campany = "sm15_black_human_14_p",
  default_node = "locator2_black_human_c_14",
  campany_node = "locator2_black_human_c_14_p",
  type = "wom24",
  company_type = "wom25",
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_TALK,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_15 = {
  name = "sm15_black_human_15",
  campany = nil,
  default_node = "locator2_black_human_c_15",
  campany_node = nil,
  type = "wom25",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_FOLLOW,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_16 = {
  name = "sm15_black_human_16",
  campany = nil,
  default_node = "locator2_black_human_c_16",
  campany_node = nil,
  type = "wom25",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_MOVE,
  route = _g_encount_npc_route_tbl.route_16,
  random_generation = _g_encoun_npc_random_generation_tbl.tbl_16,
  exit_node = nil
}
_encount_tbl.pccubesensor2_encount_17 = {
  name = "sm15_black_human_17",
  campany = nil,
  default_node = "locator2_black_human_c_17",
  campany_node = nil,
  type = "wom30",
  company_type = nil,
  default_motion = nil,
  encount_type = ENCOUNT_TYPE_TURN,
  route = nil,
  random_generation = nil,
  exit_node = nil
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    {
      name = "sm15_black_human_03",
      type = "man39",
      node = "locator2_black_human_c_03",
      attach = false
    },
    {
      name = "sm15_black_human_04",
      type = "man40",
      node = "locator2_black_human_c_04",
      attach = false
    },
    {
      name = "sm15_black_human_05",
      type = "man41",
      node = "locator2_black_human_c_05",
      attach = false
    },
    {
      name = "sm15_black_human_05_p",
      type = "man40",
      node = "locator2_black_human_c_05_p",
      attach = false
    },
    {
      name = "sm15_black_human_06",
      type = "man62",
      node = "locator2_black_human_c_06",
      attach = false
    },
    {
      name = "sm15_black_human_07",
      type = "man69",
      node = "locator2_black_human_c_07",
      attach = false
    },
    {
      name = "sm15_black_human_08",
      type = "man76",
      node = "locator2_black_human_c_08",
      attach = false
    },
    {
      name = "sm15_black_human_09",
      type = "man78",
      node = "locator2_black_human_c_09",
      attach = false
    },
    {
      name = "sm15_black_human_10",
      type = "man37",
      node = "locator2_black_human_c_10",
      attach = false
    },
    {
      name = "sm15_black_human_11",
      type = "wom21",
      node = "locator2_black_human_c_11",
      attach = false
    },
    {
      name = "sm15_black_human_12",
      type = "wom21",
      node = "locator2_black_human_c_12",
      attach = false
    },
    {
      name = "sm15_black_human_13",
      type = "wom23",
      node = "locator2_black_human_c_13",
      color_variation = 1,
      attach = false
    },
    {
      name = "sm15_black_human_14",
      type = "wom24",
      node = "locator2_black_human_c_14",
      attach = false
    },
    {
      name = "sm15_black_human_14_p",
      type = "wom25",
      node = "locator2_black_human_c_14_p",
      attach = false
    },
    {
      name = "sm15_black_human_15",
      type = "wom22",
      node = "locator2_black_human_c_15",
      attach = false
    },
    {
      name = "sm15_black_human_16",
      type = "wom25",
      node = "locator2_black_human_c_16",
      attach = false
    },
    {
      name = "sm15_black_human_17",
      type = "wom30",
      node = "locator2_black_human_c_17",
      attach = false
    },
    {
      name = "sm15_extra_01",
      type = "wom25",
      node = "locator2_extra_c_01",
      reset = false,
      active = false
    },
    {
      name = "sm15_extra_02",
      type = "man41",
      node = "locator2_extra_c_02",
      reset = false,
      active = false
    },
    {
      name = "sm15_extra_03",
      type = "wom17",
      node = "locator2_extra_c_03",
      reset = false,
      active = false
    },
    {
      name = "sm15_extra_04",
      type = "man32",
      node = "locator2_extra_c_04",
      reset = false,
      active = false
    },
    {
      name = "sm15_extra_05",
      type = "man33",
      node = "locator2_extra_c_05",
      reset = false,
      active = false
    },
    {
      name = "sm15_extra_06",
      type = "wom21",
      node = "locator2_extra_c_06",
      reset = false,
      active = false
    },
    {
      name = "sm15_extra_07",
      type = "man38",
      node = "locator2_extra_c_07",
      reset = false,
      active = false
    },
    {
      name = "sm15_extra_08",
      type = "wom27",
      node = "locator2_extra_c_08",
      reset = false,
      active = false
    }
  }
  L1_1.name = "sm15_writer_disguise"
  L1_1.type = "man76"
  L1_1.node = "locator2_writer_disguise_c"
  L1_1.attach = false
  L1_1.reset = false
  L2_2.name = "sm15_writer_original"
  L2_2.type = "man68"
  L2_2.node = "locator2_writer_original_c"
  L2_2.reset = false
  L2_2.active = false
  L2_2.not_mob = true
  L3_3.name = "sm15_black_human_01"
  L3_3.type = "man38"
  L3_3.node = "locator2_black_human_c_01"
  L3_3.attach = false
  L4_4 = {}
  L4_4.name = "sm15_black_human_02"
  L4_4.type = "man38"
  L4_4.node = "locator2_black_human_c_02"
  L4_4.color_variation = 1
  L4_4.attach = false
  L1_1(L2_2)
  for L4_4, _FORV_5_ in L1_1(L2_2) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_hdl_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  L1_1.sm15_client = L2_2
  L1_1.sm15_client = L2_2
  L1_1(L2_2)
  L1_1(L2_2)
  for L4_4, _FORV_5_ in L1_1(L2_2) do
    Fn_pcSensorOff(L4_4)
  end
  L4_4 = "kit01_stay_fighting_in_00"
  L1_1(L2_2)
  _sdemo_cut01 = L1_1
  _sdemo_cut02 = L1_1
  _sdemo_cut03 = L1_1
  _sdemo_cut04 = L1_1
  L4_4 = "po_a_01"
  L4_4 = {}
  L4_4.camera = true
  L4_4.scene_param = false
  _pdemo_cut01 = L1_1
  L4_4 = "po_a_01"
  L4_4 = {}
  L4_4.camera = true
  L4_4.scene_param = false
  _pdemo_cut02 = L1_1
  if not L1_1 then
    L4_4 = "Performance"
    L4_4 = true
    L1_1(L2_2, L3_3, L4_4)
    L4_4 = "Performance"
    L4_4 = true
    L1_1(L2_2, L3_3, L4_4)
  end
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L19_24, L20_25, L21_26, L22_27, L23_28, L24_29, L25_30, L26_31
  L0_5 = _g_debug
  L0_5 = L0_5.is_enable_lock_run
  if not L0_5 then
    L0_5 = Fn_unLockPlayerAbility
    L0_5(L1_6)
  end
  L0_5 = Fn_lockPlayerAbility
  L0_5(L1_6)
  L0_5 = {
    L1_6,
    L2_7,
    L3_8,
    L4_9,
    L5_10,
    L6_11,
    L7_12,
    L8_13,
    L9_14,
    L10_15
  }
  L1_6.name = "sm15_client"
  L1_6.gender = "wom"
  L1_6.motion = L2_7
  L2_7.name = "sm15_writer_original"
  L2_7.gender = "man"
  L2_7.motion = "inform"
  L3_8.name = "sm15_extra_01"
  L3_8.gender = "wom"
  L5_10 = "shock_in_00"
  L6_11 = "shock_00"
  L3_8.motion = L4_9
  L4_9.name = "sm15_extra_02"
  L4_9.gender = "man"
  L4_9.motion = "surprise"
  L5_10 = {}
  L5_10.name = "sm15_extra_03"
  L5_10.gender = "wom"
  L5_10.motion = "inform"
  L6_11 = {}
  L6_11.name = "sm15_extra_04"
  L6_11.gender = "man"
  L6_11.motion = "inform"
  L7_12 = {}
  L7_12.name = "sm15_extra_05"
  L7_12.gender = "man"
  L8_13 = {L9_14, L10_15}
  L9_14 = "scared_in_00"
  L10_15 = "scared_00"
  L7_12.motion = L8_13
  L8_13 = {}
  L8_13.name = "sm15_extra_06"
  L8_13.gender = "wom"
  L8_13.motion = "inform"
  L9_14 = {}
  L9_14.name = "sm15_extra_07"
  L9_14.gender = "man"
  L9_14.motion = "surprise"
  L10_15 = {}
  L10_15.name = "sm15_extra_08"
  L10_15.gender = "wom"
  L11_16 = {L12_17, L13_18}
  L12_17 = "shock_in_00"
  L13_18 = "shock_00"
  L10_15.motion = L11_16
  for L4_9, L5_10 in L1_6(L2_7) do
    L6_11 = Fn_setNpcVisible
    L7_12 = L5_10.name
    L8_13 = false
    L6_11(L7_12, L8_13)
  end
  L1_6()
  L1_6(L2_7)
  L5_10 = 0
  L6_11 = 0
  L26_31 = L3_8(L4_9, L5_10, L6_11)
  L2_7(L3_8)
  for L5_10, L6_11 in L2_7(L3_8) do
    L7_12 = createNode
    L8_13 = "locator2_view"
    L9_14 = Vector
    L10_15 = 0
    L11_16 = 1.5
    L12_17 = 0
    L26_31 = L9_14(L10_15, L11_16, L12_17)
    L7_12 = L7_12(L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L19_24, L20_25, L21_26, L22_27, L23_28, L24_29, L25_30, L26_31, L9_14(L10_15, L11_16, L12_17))
    L8_13 = _puppet_tbl
    L9_14 = L6_11.name
    L8_13 = L8_13[L9_14]
    L9_14 = L8_13
    L8_13 = L8_13.appendChild
    L10_15 = L7_12
    L8_13(L9_14, L10_15)
  end
  L5_10 = "sm15_02013"
  L3_8()
  L5_10 = "sm15_info_01"
  L6_11 = false
  L3_8(L4_9, L5_10, L6_11)
  L3_8()
  L5_10 = "locator2_client_goal_pos_01"
  L3_8(L4_9, L5_10)
  L3_8(L4_9)
  L3_8(L4_9)
  L5_10 = _puppet_tbl
  L5_10 = L5_10.sm15_client
  L5_10 = "sm15_client"
  L6_11 = "lookaround"
  L7_12 = false
  L4_9(L5_10, L6_11, L7_12)
  function L5_10()
    repeat
      waitSeconds(1.5)
      Fn_playMotionNpc("sm15_writer_disguise", "lookaround", true)
    until _is_in_editor_sensor
  end
  L4_9(L5_10)
  L5_10 = "pccubesensor2_area_distant_c"
  L4_9(L5_10)
  L5_10 = "sm15_02000"
  L5_10 = waitSeconds
  L6_11 = 2.5
  L5_10(L6_11)
  L5_10 = 0
  L6_11 = invokeTask
  function L7_12()
    while true do
      if not _g_pointing.is_retry and not is_mob_gesturre and not _g_pointing.is_encount then
        print("\231\181\140\233\129\142\230\153\130\233\150\147:" .. L5_10)
        waitSeconds(1)
        if Fn_getDistanceToPlayer(_puppet_tbl.sm15_client) >= 20 and 20 <= Fn_getDistanceToPlayer(_puppet_tbl.sm15_writer_disguise) then
          L5_10 = L5_10 + 1
        else
          L5_10 = 0
        end
      end
      wait()
    end
  end
  L6_11 = L6_11(L7_12)
  L7_12 = npcInitializeEncountGame
  L7_12()
  L7_12 = {}
  L8_13 = {}
  L9_14 = createNode
  L10_15 = "locator2_view_mob"
  L11_16 = Vector
  L12_17 = 0
  L13_18 = 1.5
  L26_31 = L11_16(L12_17, L13_18, L14_19)
  L9_14 = L9_14(L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L19_24, L20_25, L21_26, L22_27, L23_28, L24_29, L25_30, L26_31, L11_16(L12_17, L13_18, L14_19))
  L10_15 = {}
  L10_15.degree = 45
  L10_15.range = 3
  L10_15.time = 3
  L11_16 = {}
  L11_16.degree = 45
  L11_16.range = 0
  L11_16.time = 3
  L12_17 = Fn_createChangeMobToNpc
  L13_18 = L7_12
  L12_17(L13_18, L14_19)
  L12_17 = invokeTask
  function L13_18()
    local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41
    while true do
      for L3_35, L4_36 in L0_32(L1_33) do
        L5_37 = _g_pointing
        L5_37 = L5_37.is_encount
        if L5_37 == false then
          L5_37 = L4_36.name
          L5_37 = L8_13[L5_37]
          if L5_37 == nil then
            L5_37 = Fn_createChangeMobToNpc
            L6_38 = L7_12
            L7_39 = L11_16
            L5_37(L6_38, L7_39)
            L5_37 = print
            L6_38 = "Mob To Npc"
            L7_39 = L4_36.name
            L5_37(L6_38, L7_39)
            L5_37 = string
            L5_37 = L5_37.sub
            L6_38 = L4_36.name
            L7_39 = 5
            L8_40 = 7
            L5_37 = L5_37(L6_38, L7_39, L8_40)
            L6_38 = print
            L7_39 = "chara_type"
            L8_40 = L5_37
            L6_38(L7_39, L8_40)
            _is_mob_gesture = true
            L6_38 = 0
            L5_10 = L6_38
            L6_38 = Fn_turnNpc
            L7_39 = L4_36.name
            L6_38(L7_39)
            L6_38 = setEnableEncountPlayerControl
            L7_39 = false
            L6_38(L7_39)
            L6_38 = Fn_findNpcPuppet
            L7_39 = L4_36.name
            L6_38 = L6_38(L7_39)
            L7_39 = L6_38
            L6_38 = L6_38.appendChild
            L8_40 = L9_14
            L6_38(L7_39, L8_40)
            L6_38 = Fn_lookAtObject
            L7_39 = Fn_findNpcPuppet
            L8_40 = L4_36.name
            L7_39 = L7_39(L8_40)
            L8_40 = L7_39
            L7_39 = L7_39.findChildNode
            L9_41 = "locator2_view_mob"
            L9_41 = L7_39(L8_40, L9_41)
            L6_38 = L6_38(L7_39, L8_40, L9_41, L7_39(L8_40, L9_41))
            L7_39 = print
            L8_40 = "\230\140\135\227\129\149\227\129\151"
            L7_39(L8_40)
            L7_39 = waitSeconds
            L8_40 = 1
            L7_39(L8_40)
            L7_39 = Fn_turnNpc
            L8_40 = L4_36.name
            L7_39(L8_40)
            L7_39 = Fn_getPcPosRot
            L7_39 = L7_39()
            L8_40 = Mv_informNpc
            L9_41 = L4_36.name
            L8_40(L9_41, Vector(L7_39.x, L7_39.y + 4, L7_39.z))
            L8_40 = _g_pointing
            L8_40 = L8_40.retry_time_max
            L9_41 = _g_pointing
            L9_41.is_success = false
            L9_41 = Fn_captionViewEnd
            L9_41()
            L9_41 = Fn_missionViewEnd
            L9_41()
            L9_41 = Sound
            L9_41 = L9_41.playSEHandle
            L9_41 = L9_41(L9_41, "sm15_horror", 1)
            repeat
              if _is_in_editor_sensor then
                if L6_38 ~= nil then
                  L6_38:abort()
                  L6_38 = nil
                end
                Fn_gestureActionCancel()
                break
              end
              _g_pointing.gesture_time = _g_pointing.gesture_time + 1
              print("\227\130\191\227\130\164\227\131\160\227\130\171\227\130\166\227\131\179\227\131\136\239\188\154", _g_pointing.gesture_time)
              if _g_pointing.is_success then
                print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\230\136\144\229\138\159")
                _g_pointing.gesture_time = 0
                _g_pointing.is_success = false
                _g_pointing.is_success_wait = true
                Sound:stopSEHandle(L9_41)
                if L6_38 ~= nil then
                  L6_38:abort()
                  L6_38 = nil
                end
                L9_14:leaveFromParent()
                Fn_gestureActionCancel()
                Fn_captionViewWait("sm15_02004")
                Fn_captionView(L2_7[RandI(1, 3)])
                repeat
                  wait()
                until not Fn_findNpc(L4_36.name):isInformEnd()
                Fn_playMotionNpc(L4_36.name, "inform_ed", false)
                break
              end
              if L8_40 <= _g_pointing.gesture_time then
                Fn_pcSensorOff("pccubesensor2_editor")
                if L6_38 ~= nil then
                  L6_38:abort()
                  L6_38 = nil
                end
                L9_14:leaveFromParent()
                Fn_gestureActionCancel()
                repeat
                  wait()
                until not Fn_findNpc(L4_36.name):isInformEnd()
                Fn_playMotionNpc(L4_36.name, "inform_ed", true)
                Fn_turnNpc(L4_36.name)
                Sound:stopSEHandle(L9_41)
                L9_41 = nil
                if L5_37 == "man" then
                  Sound:playSE("m03_009", 1)
                elseif L5_37 == "wom" then
                  Sound:playSE("w02_002", 1)
                end
                Fn_captionViewWait("sm15_02006")
                _g_pointing.is_retry = true
                _g_pointing.is_request_cry = true
                break
              end
              wait()
            until false
            print("\230\140\135\227\129\149\227\129\151\231\181\130\227\130\143\227\130\138")
            setEnableEncountPlayerControl(true)
            invokeTask(function()
              L8_13[L4_36.name] = true
              waitSeconds(5)
              Fn_changeNpcToMob(L4_36.name)
            end)
            _is_mob_gesture = false
          end
        else
        end
      end
      L0_32()
    end
  end
  L12_17(L13_18)
  L12_17 = {
    L13_18,
    L14_19,
    L15_20
  }
  L13_18 = "sm15_02014"
  L13_18 = invokeTask
  L13_18(L14_19)
  L13_18 = invokeTask
  L13_18(L14_19)
  repeat
    L13_18 = _g_pointing
    L13_18 = L13_18.is_pointing
    if L13_18 == false then
      L13_18 = entryGestureAction
      L13_18()
    end
    while true do
      L13_18 = _g_pointing
      L13_18 = L13_18.is_retry
      if L13_18 then
        L13_18 = wait
        L13_18()
      end
    end
    L13_18 = _is_in_editor_sensor
    if L13_18 then
      L13_18 = _g_pointing
      L13_18 = L13_18.is_gesture
      if not L13_18 then
        L13_18 = _g_pointing
        L13_18.is_mission_end = true
        break
      end
    end
    L13_18 = _g_debug
    L13_18 = L13_18.is_invalid_skip_encount
    if not L13_18 then
      L13_18 = _g_pointing
      L13_18.is_mission_end = true
      break
    end
    L13_18 = _g_pointing
    L13_18 = L13_18.is_success_wait
    if L13_18 == true then
      L13_18 = Fn_createChangeMobToNpc
      L13_18(L14_19, L15_20)
      L13_18 = _g_pointing
      L13_18.is_encount = false
      L13_18 = RandI
      L13_18 = L13_18(L14_19, L15_20)
      for L17_22 = 0, L13_18 do
        if L18_23 then
          if not L18_23 then
            L18_23.is_mission_end = true
            break
          end
        end
        L18_23(L19_24)
      end
      if L14_19 ~= true then
        L14_19(L15_20, L16_21)
        L14_19.is_success_wait = false
        while true do
          L13_18 = _is_mob_gesture
          if L13_18 then
            L13_18 = _g_pointing
            L13_18.is_encount = false
            L13_18 = wait
            L13_18()
          end
        end
        L13_18 = _g_pointing
        L13_18 = L13_18.is_encount
        if L13_18 then
          L13_18 = Fn_createChangeMobToNpc
          L13_18(L14_19, L15_20)
          L13_18 = _encount_tbl
          L13_18 = L13_18[L14_19]
          L17_22 = 1
          L17_22 = L13_18.default_node
          if L13_18 then
            L20_25.is_gesture = true
            L21_26 = _g_pointing
            L21_26 = L21_26.encount_sensor_name
            L20_25(L21_26)
            if L20_25 then
              L21_26 = isAbleGenerationNPC
              L26_31 = L22_27(L23_28, L24_29)
              L21_26 = L21_26(L22_27, L23_28, L24_29, L25_30, L26_31, L22_27(L23_28, L24_29))
              if not L20_25 then
                L21_26 = {}
                for L25_30, L26_31 in L22_27(L23_28) do
                  if isAbleGenerationNPC(findGameObject2("Node", L26_31)) then
                    table.insert(L21_26, L26_31)
                  end
                end
                if L22_27 > 0 then
                  L17_22 = L21_26[L22_27]
                end
              end
            end
            if L16_21 ~= L20_25 then
            elseif L16_21 == L20_25 then
              L21_26 = L14_19
              L21_26 = L20_25
              L22_27.valid = true
              L22_27.target = L23_28
              L22_27.watchTarget = true
              L22_27.targetJoint = "bn_head"
              L20_25(L21_26, L22_27)
              if L16_21 == L20_25 then
                L21_26 = L14_19
                L20_25(L21_26, L22_27)
                L21_26 = L14_19
                L20_25(L21_26, L22_27)
                L21_26 = L14_19
                L20_25(L21_26, L22_27)
              end
              if L20_25 > 0 then
                L21_26 = L14_19
                L23_28.runLength = 10000
                L23_28.recast = true
                repeat
                  L21_26 = Fn_getDistanceToPlayer
                  L26_31 = L22_27(L23_28)
                  L21_26 = L21_26(L22_27, L23_28, L24_29, L25_30, L26_31, L22_27(L23_28))
                  if L21_26 <= 8 then
                    L21_26 = npcIsViewControl
                    L21_26 = L21_26()
                    if not L21_26 then
                      L21_26 = waitSeconds
                      L21_26(L22_27)
                      L21_26 = npcStartViewControl
                      L21_26(L22_27)
                    end
                  end
                  L21_26 = wait
                  L21_26()
                  L21_26 = L20_25.isRunning
                  L21_26 = L21_26(L22_27)
                until not L21_26
              end
              L20_25()
              L21_26 = L14_19
              L20_25(L21_26)
              if not L18_23 then
              end
            end
            if L16_21 == L20_25 then
              L21_26 = L14_19
              L20_25(L21_26)
              L20_25()
              L21_26 = L14_19
              L20_25(L21_26)
            end
            if L16_21 == L20_25 then
              L21_26 = L14_19
              L20_25(L21_26)
              L20_25()
              L21_26 = L14_19
              L20_25(L21_26, L22_27, L23_28)
              L21_26 = L14_19
              L20_25(L21_26)
            end
            if L16_21 == L20_25 then
              L21_26 = L14_19
              L20_25(L21_26, L22_27)
              L21_26 = L14_19
              L20_25(L21_26, L22_27)
              L21_26 = L14_19
              L20_25(L21_26, L22_27)
              L21_26 = L14_19
              L20_25(L21_26)
              repeat
                L21_26 = Fn_findNpcPuppet
                L26_31 = L21_26(L22_27)
                if L20_25 <= 8 then
                  L21_26 = npcIsViewControl
                  L21_26 = L21_26()
                  if not L21_26 then
                    L21_26 = npcStartViewControl
                    L21_26(L22_27)
                  end
                end
                if L20_25 <= 5 then
                  L21_26 = print
                  L21_26(L22_27)
                  L21_26 = npcEndFollowPlayer
                  L21_26(L22_27)
                  L21_26 = Fn_turnNpc
                  L21_26(L22_27)
                  break
                end
                if L20_25 >= 60 then
                  L21_26 = print
                  L21_26(L22_27)
                  L21_26 = npcEndViewControl
                  L21_26()
                  L21_26 = npcEndFollowPlayer
                  L21_26(L22_27)
                  L21_26 = npcTerminateEncountGameOne
                  L21_26(L22_27)
                  L21_26 = npcInitializeEncountGameOne
                  L21_26(L22_27)
                  break
                end
                L21_26 = wait
                L21_26()
                L21_26 = false
              until L21_26
            end
            if L16_21 == L20_25 then
              L21_26 = L14_19
              L20_25(L21_26)
              L20_25()
              function L21_26()
                Fn_turnNpc(L14_19)
              end
              L20_25(L21_26)
              L21_26 = L13_18.campany
              L20_25(L21_26)
            end
            if L19_24 then
              L21_26 = 1.5
              L20_25(L21_26)
              L21_26 = L14_19
              L20_25(L21_26)
              L20_25[L14_19] = L14_19
              if L16_21 == L20_25 then
                L21_26 = L13_18.campany
                L20_25(L21_26)
              end
              L5_10 = 0
              L21_26 = L7_12
              L20_25(L21_26, L22_27)
            end
            if L18_23 then
              L21_26 = L14_19
              L21_26 = L20_25
              L20_25(L21_26)
              L21_26 = Mv_informNpc
              L25_30 = 4
              L26_31 = 0
              L21_26(L22_27, L23_28)
              L21_26 = ENCOUNT_TYPE_TALK
              if L16_21 == L21_26 then
                L21_26 = Mv_informNpc
                L25_30 = 4
                L26_31 = 0
                L21_26(L22_27, L23_28)
              end
              repeat
                L21_26 = print
                L21_26(L22_27)
                L21_26 = wait
                L21_26()
                L21_26 = _npc_hdl_tbl
                L21_26 = L21_26[L14_19]
                L21_26 = L21_26.isInformEnd
                L21_26 = L21_26(L22_27)
              until not L21_26
              L21_26 = _g_pointing
              L21_26 = L21_26.retry_time_max
              L22_27.is_success = false
              L22_27()
              L22_27()
              L25_30 = 1
              repeat
                if L23_28 then
                  L23_28()
                  L23_28()
                  break
                end
                L23_28.gesture_time = L24_29
                L25_30 = _g_pointing
                L25_30 = L25_30.gesture_time
                L23_28(L24_29, L25_30)
                if L23_28 then
                  L23_28(L24_29)
                  L23_28.gesture_time = 0
                  L23_28.is_success = false
                  L23_28.is_success_wait = true
                  L25_30 = L22_27
                  L23_28(L24_29, L25_30)
                  L23_28()
                  L23_28()
                  L23_28(L24_29)
                  L25_30 = 3
                  L25_30 = L2_7[L23_28]
                  L24_29(L25_30)
                  L25_30 = L14_19
                  L26_31 = "inform_ed"
                  L24_29(L25_30, L26_31, false)
                  if L16_21 == L24_29 then
                    L25_30 = L13_18.campany
                    L26_31 = "inform_ed"
                    L24_29(L25_30, L26_31, false)
                  end
                  L25_30 = true
                  L24_29(L25_30)
                  L25_30 = 3
                  L24_29(L25_30)
                  L25_30 = L14_19
                  L24_29(L25_30)
                  L24_29[L14_19] = L14_19
                  if L16_21 == L24_29 then
                    L25_30 = L13_18.campany
                    L24_29(L25_30)
                  end
                  L5_10 = 0
                  break
                end
                if L21_26 <= L23_28 then
                  L23_28()
                  L23_28()
                  L23_28(L24_29)
                  if L16_21 == L23_28 then
                    L23_28(L24_29)
                  end
                  L25_30 = "inform_ed"
                  L26_31 = true
                  L23_28(L24_29, L25_30, L26_31)
                  L23_28(L24_29)
                  L25_30 = L22_27
                  L23_28(L24_29, L25_30)
                  if L15_20 == "man" then
                    L25_30 = "m03_009"
                    L26_31 = 1
                    L23_28(L24_29, L25_30, L26_31)
                  elseif L15_20 == "wom" then
                    L25_30 = "w02_002"
                    L26_31 = 1
                    L23_28(L24_29, L25_30, L26_31)
                  end
                  L23_28(L24_29)
                  L23_28.is_retry = true
                  L23_28.is_request_cry = true
                  L23_28(L24_29)
                  break
                end
                L23_28()
              until L23_28
            end
            L20_25.is_gesture = false
            L20_25.is_encount = false
          else
            L21_26 = 0.5
            L20_25(L21_26)
          end
        else
        end
        L13_18 = wait
        L13_18()
        L13_18 = false
      end
    end
  until L13_18
  L13_18 = print
  L13_18(L14_19)
  L13_18 = Fn_captionViewEnd
  L13_18()
  L13_18 = Fn_killChangeMob
  L13_18()
  L13_18 = Fn_gestureActionCancel
  L13_18()
  L13_18 = Fn_naviKill
  L13_18()
  L13_18 = Fn_pcSensorOff
  L13_18(L14_19)
  _is_in_editor_sensor = false
  L13_18 = L4_9.abort
  L13_18(L14_19)
  L13_18 = L6_11.abort
  L13_18(L14_19)
  L13_18 = waitSeconds
  L13_18(L14_19)
  function L13_18()
    Fn_warpNpc("sm15_client", "locator2_sdemo_editor_pos_01")
    for _FORV_3_, _FORV_4_ in pairs(_encount_tbl) do
      Fn_setNpcActive(_FORV_4_.name, false)
    end
    Fn_disappearNpc("sm15_writer_disguise")
    _sdemo_cut01:set("locator2_cam_c_01_01", "locator2_aim_c_01_01", false)
    _sdemo_cut01:setCameraParam(nil, 0.1, nil)
    _sdemo_cut01:play()
  end
  L14_19(L15_20, L16_21)
  L14_19()
  L14_19()
  L14_19(L15_20)
  L14_19(L15_20)
  L17_22 = "w05_003"
  L15_20(L16_21, L17_22)
  L15_20(L16_21)
  L17_22 = "sm15_client"
  L21_26 = L15_20.z
  L26_31 = L18_23(L19_24, L20_25, L21_26)
  L16_21(L17_22, L18_23, L19_24, L20_25, L21_26, L22_27, L23_28, L24_29, L25_30, L26_31, L18_23(L19_24, L20_25, L21_26))
  repeat
    L16_21()
    L17_22 = L16_21
  until not L16_21
  L17_22 = 2
  L16_21(L17_22)
  L17_22 = "Node"
  L17_22 = L16_21
  L17_22 = Player
  L17_22 = L17_22.setLookAtIk
  L21_26 = L16_21
  L17_22(L18_23, L19_24, L20_25, L21_26)
  L17_22 = waitSeconds
  L17_22(L18_23)
  L17_22 = Player
  L17_22 = L17_22.setLookAtIk
  L21_26 = L16_21
  L17_22(L18_23, L19_24, L20_25, L21_26)
  L17_22 = _sdemo_cut01
  L17_22 = L17_22.stop
  L17_22(L18_23, L19_24)
  L17_22 = Fn_setKittenAndCatActive
  L17_22(L18_23)
  L17_22 = _pdemo_cut01
  L17_22 = L17_22.play
  L17_22(L18_23)
  L17_22 = Fn_captionView
  L17_22(L18_23)
  L17_22 = waitSeconds
  L17_22(L18_23)
  L17_22 = Fn_captionView
  L17_22(L18_23)
  L17_22 = waitSeconds
  L17_22(L18_23)
  L17_22 = Fn_playMotionNpc
  L17_22(L18_23, L19_24, L20_25)
  L17_22 = waitSeconds
  L17_22(L18_23)
  L17_22 = Sound
  L17_22 = L17_22.playSE
  L17_22(L18_23, L19_24)
  L17_22 = Fn_captionViewWait
  L17_22(L18_23)
  L17_22 = waitSeconds
  L17_22(L18_23)
  L17_22 = Fn_captionView
  L17_22(L18_23)
  L17_22 = waitSeconds
  L17_22(L18_23)
  repeat
    L17_22 = wait
    L17_22()
    L17_22 = _pdemo_cut01
    L17_22 = L17_22.isEnd
    L17_22 = L17_22(L18_23)
  until L17_22
  L17_22 = Fn_kaiwaDemoView
  L17_22(L18_23)
  L17_22 = _pdemo_cut01
  L17_22 = L17_22.stop
  L17_22(L18_23, L19_24)
  L17_22 = _pdemo_cut01
  L17_22 = L17_22.try_term
  L17_22(L18_23)
  L17_22 = _pdemo_cut02
  L17_22 = L17_22.play
  L17_22(L18_23)
  L17_22 = Fn_sendEventComSb
  L17_22(L18_23, L19_24)
  L17_22 = Fn_sendEventComSb
  L17_22(L18_23, L19_24, L20_25)
  L17_22 = Fn_sendEventComSb
  L17_22(L18_23, L19_24, L20_25)
  repeat
    L17_22 = wait
    L17_22()
    L17_22 = _pdemo_cut02
    L17_22 = L17_22.isEnd
    L17_22 = L17_22(L18_23)
  until L17_22
  function L17_22()
    for _FORV_3_, _FORV_4_ in pairs(L0_5) do
      if _FORV_4_.name ~= "sm15_client" and _FORV_4_.name ~= "sm15_writer_disguise" then
        Fn_setNpcActive(_FORV_4_.name, true)
      end
    end
    Fn_playMotionNpc("sm15_client", "scared_01", false)
    Fn_playMotionNpc("sm15_writer_original", "scared_03", false)
    Fn_playMotionNpc("sm15_extra_01", "scared_04", false)
    Fn_playMotionNpc("sm15_extra_02", "scared_04", false)
    Fn_playMotionNpc("sm15_extra_03", "scared_03", false)
    Fn_playMotionNpc("sm15_extra_04", "scared_05", false)
    Fn_playMotionNpc("sm15_extra_05", "scared_02", false)
    Fn_playMotionNpc("sm15_extra_06", "scared_02", false)
    Fn_playMotionNpc("sm15_extra_07", "scared_01", false)
    Fn_playMotionNpc("sm15_extra_08", "scared_04", false)
    Mob:makeSituationPanic(true)
    Fn_playPlayerMotionWait("kit01_stay_fighting_in_00", 0, 0.2)
    Fn_playPlayerMotion("kit01_stay_fighting_00", -1)
    Fn_resetPcPos("locator2_pc_start_pos_02")
    for _FORV_3_, _FORV_4_ in pairs(L0_5) do
      if _FORV_4_.name ~= "sm15_client" and _FORV_4_.name ~= "sm15_writer_disguise" then
        Fn_setNpcVisible(_FORV_4_.name, false)
      end
    end
    _pdemo_cut02:stop(0)
    _pdemo_cut02:try_term()
    _sdemo_cut04:set("locator2_cam_c_04_01", "locator2_aim_c_04_01", false)
  end
  L21_26 = true
  L18_23(L19_24, L20_25, L21_26)
  for L21_26, L22_27 in L18_23(L19_24) do
    if L23_28 ~= "sm15_client" then
      if L23_28 ~= "sm15_writer_disguise" then
        L25_30 = true
        L23_28(L24_29, L25_30)
      end
    end
  end
  L18_23(L19_24)
  L21_26 = {}
  L21_26.time = 2.8
  L21_26.pos = "locator2_cam_c_04_02"
  L21_26 = {L22_27}
  L22_27.time = 3
  L22_27.pos = "locator2_aim_c_04_02"
  L18_23(L19_24, L20_25, L21_26)
  L21_26 = 1
  L18_23(L19_24, L20_25, L21_26, L22_27)
  while true do
    if L18_23 then
      L18_23()
    end
  end
  L21_26 = 0.2
  L18_23(L19_24, L20_25, L21_26)
  L18_23(L19_24, L20_25)
  L18_23(L19_24)
  L21_26 = "Node"
  L21_26 = L20_25
  L21_26 = 0
  L18_23(L19_24, L20_25, L21_26, L22_27)
  L18_23(L19_24, L20_25)
  L18_23()
  L18_23()
  L18_23()
  L18_23()
end
function Finalize()
  Mob:makeSituationPanic(false)
  if Fn_getPlayer() then
    Fn_resetCoercionPose()
  end
  Mob:letStateMode(Mob.StateMode.kNoAccessory, false)
  Mob:restrict_sm15_c_00(false)
end
function pccubesensor2_encount_OnEnter(A0_42, A1_43)
  if _g_pointing.is_success_wait == false and _is_mob_gesture == false then
    _g_pointing.is_encount = true
    _g_pointing.encount_sensor_name = A0_42:getName()
    print("\227\130\187\227\131\179\227\130\181\227\131\188\227\129\174\229\144\141\229\137\141\227\129\175\239\188\159 \226\134\146 ", _g_pointing.encount_sensor_name)
  end
end
function pccubesensor2_editor_OnEnter()
  local L0_44, L1_45
  _is_in_editor_sensor = true
end
function pccubesensor2_editor_OnLeave()
  local L0_46, L1_47
  _is_in_editor_sensor = false
end
function pccubesensor2_area_distant_OnEnter()
  local L0_48, L1_49
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  local L0_50, L1_51
  _is_area_distant = true
end
function pccubesensor2_area_fall_OnEnter()
  local L1_52
  L1_52 = _g_pointing
  L1_52.is_area_fall = true
end
function pccubesensor2_area_fall_OnLeave()
  local L1_53
  L1_53 = _g_pointing
  L1_53.is_area_fall = false
end
function createNode(A0_54, A1_55)
  createGameObject2("Node"):setName(A0_54)
  createGameObject2("Node"):setForceMove()
  createGameObject2("Node"):setPos(A1_55)
  createGameObject2("Node"):try_init()
  createGameObject2("Node"):waitForReady()
  createGameObject2("Node"):try_start()
  return (createGameObject2("Node"))
end
function entryGestureAction()
  local L0_56, L1_57
  L0_56 = _g_pointing
  L0_56 = L0_56.is_mission_end
  if not L0_56 then
    L0_56 = _g_pointing
    L0_56 = L0_56.is_retry
  elseif L0_56 then
    return
  end
  function L0_56()
    _g_pointing.is_pointing = true
    Fn_userCtrlAllOff()
    wait()
    if _g_pointing.is_encount or _is_mob_gesture then
      _g_pointing.is_success = true
    end
    Fn_playPlayerMotionWait("kit01_inform_00", 0, 0.3, true)
    Fn_userCtrlOn()
    _g_pointing.is_pointing = false
  end
  L1_57 = {}
  L1_57.RL = {
    id = "ui_event_guide_10",
    func = L0_56
  }
  Fn_gestureAction(L1_57)
end
function npcInitializeEncountGame()
  local L0_58, L1_59, L2_60, L3_61
  for L3_61, _FORV_4_ in L0_58(L1_59) do
    npcInitializeEncountGameOne(L3_61)
  end
end
function npcInitializeEncountGameOne(A0_62)
  local L1_63, L2_64, L3_65
  L1_63 = A0_62
  L2_64 = _encount_tbl
  L2_64 = L2_64[L1_63]
  L3_65 = _g_debug
  L3_65 = L3_65.is_enable_encount_sensor
  if L3_65 then
    L3_65 = Fn_pcSensorOn
    L3_65(L1_63)
  end
  L3_65 = Fn_findNpc
  L3_65 = L3_65(L2_64.name)
  L3_65 = L3_65.isStarted
  L3_65 = L3_65(L3_65)
  if L3_65 then
    L3_65 = L2_64.encount_type
    if L3_65 ~= ENCOUNT_TYPE_MOVE then
      L3_65 = L2_64.encount_type
    else
      if L3_65 == ENCOUNT_TYPE_FOLLOW then
        L3_65 = Fn_setNpcActive
        L3_65(L2_64.name, false)
    end
    else
      L3_65 = Fn_setNpcActive
      L3_65(L2_64.name, true)
      L3_65 = Fn_setNpcVisible
      L3_65(L2_64.name, true)
      L3_65 = print
      L3_65(L2_64.name)
      L3_65 = Fn_warpNpc
      L3_65(L2_64.name, L2_64.default_node)
      L3_65 = print
      L3_65(L2_64.name)
    end
    L3_65 = L2_64.encount_type
    if L3_65 == ENCOUNT_TYPE_TALK then
      L3_65 = Fn_turnNpc
      L3_65(L2_64.name, _puppet_tbl[L2_64.campany])
      L3_65 = Fn_turnNpc
      L3_65(L2_64.campany, _puppet_tbl[L2_64.name])
      L3_65 = {
        "talk_00",
        "talk_01",
        "talk_02"
      }
      Fn_playMotionNpc(L2_64.name, L3_65, false, {isRandom = true, isRepeat = true})
      Fn_playMotionNpc(L2_64.campany, L3_65, false, {isRandom = true, isRepeat = true})
    else
      L3_65 = L2_64.default_motion
      if L3_65 then
        L3_65 = Fn_playMotionNpc
        L3_65(L2_64.name, L2_64.default_motion, false)
      end
    end
  end
end
function npcTerminateEncountGame()
  local L0_66, L1_67, L2_68, L3_69
  for L3_69, _FORV_4_ in L0_66(L1_67) do
    npcTerminateEncountGameOne(L3_69)
  end
end
function npcTerminateEncountGameOne(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79, L10_80, L11_81
  L1_71 = A0_70
  L2_72 = _encount_tbl
  L2_72 = L2_72[L1_71]
  L3_73 = Fn_pcSensorOff
  L4_74 = L1_71
  L3_73(L4_74)
  L3_73 = _g_pointing
  L3_73 = L3_73.black_human_move_task
  L4_74 = L2_72.name
  L3_73 = L3_73[L4_74]
  if L3_73 then
    L3_73 = _g_pointing
    L3_73 = L3_73.black_human_move_task
    L4_74 = L2_72.name
    L3_73 = L3_73[L4_74]
    L4_74 = L3_73
    L3_73 = L3_73.abort
    L3_73(L4_74)
  end
  L3_73 = _g_pointing
  L3_73 = L3_73.black_human_move_task
  L4_74 = L2_72.name
  L3_73[L4_74] = nil
  L3_73 = Fn_findNpc
  L4_74 = L2_72.name
  L3_73 = L3_73(L4_74)
  L4_74 = Fn_findNpc
  L5_75 = L2_72.campany
  L4_74 = L4_74(L5_75)
  L5_75 = print
  L5_75(L6_76)
  L5_75 = {L6_76}
  L6_76.name = L7_77
  L6_76.type = L7_77
  L6_76.node = L7_77
  L6_76.attach = false
  if L6_76 == L7_77 then
    L9_79 = L2_72.campany
    L8_78.name = L9_79
    L9_79 = L2_72.company_type
    L8_78.type = L9_79
    L9_79 = L2_72.campany_node
    L8_78.node = L9_79
    L8_78.attach = false
    L6_76(L7_77, L8_78)
  end
  if L6_76 ~= nil then
    L6_76(L7_77)
    L6_76()
    for L9_79, L10_80 in L6_76(L7_77) do
      L11_81 = _puppet_tbl
      L11_81[L10_80.name] = Fn_findNpcPuppet(L10_80.name)
      L11_81 = _npc_hdl_tbl
      L11_81[L10_80.name] = Fn_findNpc(L10_80.name)
      L11_81 = createNode
      L11_81 = L11_81("locator2_view", Vector(0, 1.5, 0))
      _puppet_tbl[L10_80.name]:appendChild(L11_81)
    end
  elseif L6_76 then
    L6_76(L7_77)
    if L4_74 then
      L6_76(L7_77)
    end
  end
  L6_76[L7_77] = nil
  L6_76[L7_77] = false
end
function npcStartViewControl(A0_82)
  _g_pointing.view_control_task = Fn_lookAtObject(_puppet_tbl[A0_82]:findChildNode("locator2_view"))
  setEnableEncountPlayerControl(false)
end
function npcEndViewControl()
  if _g_pointing.view_control_task then
    _g_pointing.view_control_task:abort()
  end
  _g_pointing.view_control_task = nil
end
function npcIsViewControl()
  local L0_83, L1_84
  L0_83 = _g_pointing
  L0_83 = L0_83.view_control_task
  if L0_83 then
    L0_83 = true
    return L0_83
  else
    L0_83 = false
    return L0_83
  end
end
function setEnableEncountPlayerControl(A0_85)
  if A0_85 then
    Fn_userCtrlOn()
    Fn_unLockPlayerAbility(Player.kAbility_Dodge)
    Fn_unLockPlayerAbility(Player.kAbility_Jump)
    Fn_unLockPlayerAbility(Player.kAbility_AttrTuneSwitch)
    Fn_unLockPlayerAbility(nil, {r_stick = true})
  else
    Fn_lockPlayerAbility(nil, {r_stick = true})
  end
end
function npcStartFollowPlayer(A0_86)
  local L1_87
  L1_87 = _g_pointing
  L1_87 = L1_87.black_human_move_task
  L1_87[A0_86] = Fn_moveNpc(A0_86, {
    PLAYER_FOLLOW_TARGET_NODE
  })
end
function npcEndFollowPlayer(A0_88)
  if _g_pointing.black_human_move_task[A0_88] then
    _g_pointing.black_human_move_task[A0_88]:abort()
  end
  _g_pointing.black_human_move_task[A0_88] = nil
end
function npcIsFollowPlayer(A0_89)
  local L1_90
  L1_90 = _g_pointing
  L1_90 = L1_90.black_human_move_task
  L1_90 = L1_90[A0_89]
  if L1_90 then
    L1_90 = true
    return L1_90
  else
    L1_90 = false
    return L1_90
  end
end
function isAbleGenerationNPC(A0_91)
  local L1_92, L2_93, L3_94, L4_95
  L1_92 = false
  L2_93 = nil
  L4_95 = A0_91
  L3_94 = A0_91.getWorldPos
  L3_94 = L3_94(L4_95)
  L4_95 = A0_91.getWorldPos
  L4_95 = L4_95(A0_91)
  L4_95.y = L4_95.y + 1.6
  L2_93 = Camera:getEyePos()
  Query:setEyeSightTransform(L2_93)
  if Query:raycastEyeSight(L3_94) and Query:raycastEyeSight(L4_95) then
    L1_92 = true
  end
  if not L1_92 and not Fn_isInSightTarget(A0_91, 1) then
    L1_92 = true
  end
  return L1_92
end
