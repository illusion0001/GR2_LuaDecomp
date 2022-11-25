dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/rac_perceivableNpc.lua")
PHASE_WAIT = 0
PHASE_MAIN_B_INIT = 1
PHASE_MAIN_B_END = 2
PHASE_MAIN_C_INIT = 3
PHASE_MAIN_C_INIT_END = 4
PHASE_MAIN_C = 5
PHASE_MAIN_C_END = 6
PHASE_MAIN_D = 7
GRAB_ATTRACT_RADIUS = 7
THROW_FLYING_DISTANCE = 150
THROW_FLYING_DURATION_SEC = 10
THROW_FREE_FALL_DISTANCE = 30
THROW_FREE_FALL_GRAVITY_ACCEL = 40
SOLDIER_CAUTION_INC_COEFFICENT = 3
SOLDIER_CAUTION_DEC_COEFFICENT = 0.35
SOLDIER_SIGHT_H_DEG = 45
SOLDIER_SIGHT_V_DEG = 45
SOLDIER_SIGHT_LEN = 15
SOLDIER_INDICATION_INC_COEFFICENT = 5
SOLDIER_INDICATION_DEC_COEFFICENT = 3
SOLDIER_INDICATION_LEN = 20
SOLDIER_HEARING_RANGE = 8
SOLDIER_LOST_SOUND_RATE_SUB = {
  25,
  25,
  50
}
BOMB_CAUTION_INC_SPEED = 1.7
BOMB_CAUTION_DEC_SPEED = 1
RES_THROW_OUT_MAX_POINT = 40
RES_BOX_L_ADD_POINT = 2
RES_BOX_M_ADD_POINT = 1
RES_BOX_S_ADD_POINT = 1
RES_BOS_RESTORE_RATE = 0.8
PARTED_RES_BOX_GROUP_TBL = {
  {
    7,
    14,
    21,
    22
  },
  {
    9,
    10,
    16,
    17,
    20,
    23,
    24,
    25
  },
  {
    1,
    2,
    3,
    8,
    12,
    13,
    18
  },
  {
    4,
    5,
    6,
    11,
    15,
    19
  }
}
POINT_CAP_DATA_TBL = {
  {point = 10, caption = "sm07_09000"},
  {point = 15, caption = "sm07_09001"},
  {point = 30, caption = "sm07_09002"}
}
RES_BOX_NAME_PREFIX = "bg2_woodbox_"
RES_BOX_DYN_NAME_PREFIX = "dyn_"
RES_BOX_NG_CAP_COUNT = 1
RES_BOX_NG_CAP_DISTANCE = 30
CAPTION_PRIORITY_SOLDIER = 4
CAPTION_PRIORITY_RES_BOX_OK = 3
CAPTION_PRIORITY_RES_BOX_NG = 2
CAPTION_PRIORITY_ETC = 1
CAPTION_PRIORITY_UNKNOWN = 100
_phase = 0
_patrol_pup_tbl = {}
_is_out_of_range = false
_is_in_tutorial_grab_sensor = false
_is_out_of_tutorial_sensor = false
_is_in_bomb_sensor = false
_security_level = 1
_patrol_soldier_spawn_task_tbl = {}
_patrol_soldier_tbl = {}
_container_tbl = {}
_resource_box_tbl = {}
_res_throw_out_point = 0
_soldier_kill_count = 0
_escape_start_idx = nil
_found_soldier_name = nil
_point_cap_idx = 1
_hundred_legs_caption_wait_task = nil
_res_throw_failed_count = 0
_res_throw_failed_cap_wait_task = nil
_catwarp_enable = true
_captionPriority = CAPTION_PRIORITY_UNKNOWN
_captionPriorityTask = nil
_soldier_data_tbl = {
  {
    npc_name = "sm07_soldier_01_01",
    reset_pos = "locator2_patrol_soldier_01",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_01_move_",
    turn_target_prefix = "locator2_soldier_01_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_02",
    reset_pos = "locator2_patrol_soldier_02",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_02_move_",
    turn_target_prefix = "locator2_soldier_02_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = {
      [1] = {
        {1}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_03",
    reset_pos = "locator2_patrol_soldier_03",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_03_move_",
    turn_target_prefix = "locator2_soldier_03_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = {
      [2] = {
        {25}
      },
      [3] = {
        {10}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_04",
    reset_pos = "locator2_patrol_soldier_04",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_04_move_",
    turn_target_prefix = "locator2_soldier_04_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = {
      [1] = {
        {1}
      },
      [2] = {
        {2}
      },
      [3] = {
        {8}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_05",
    reset_pos = "locator2_patrol_soldier_05",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_05_move_",
    turn_target_prefix = "locator2_soldier_05_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_06",
    reset_pos = "locator2_patrol_soldier_06",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_06_move_",
    turn_target_prefix = "locator2_soldier_06_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_07",
    reset_pos = "locator2_patrol_soldier_07",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_07_move_",
    turn_target_prefix = "locator2_soldier_07_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = {
      [3] = {
        {5}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_08",
    reset_pos = "locator2_patrol_soldier_08",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_08_move_",
    turn_target_prefix = "locator2_soldier_08_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = {
      [4] = {
        {20}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_09",
    reset_pos = "locator2_patrol_soldier_09",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_09_move_",
    turn_target_prefix = "locator2_soldier_09_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = {
      [3] = {
        {17}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_11",
    reset_pos = "locator2_patrol_soldier_11",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_11_move_",
    turn_target_prefix = "locator2_soldier_11_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_12",
    reset_pos = "locator2_patrol_soldier_12",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_12_move_",
    turn_target_prefix = "locator2_soldier_12_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = {
      [2] = {
        {6}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_13",
    reset_pos = "locator2_patrol_soldier_13",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_13_move_",
    turn_target_prefix = "locator2_soldier_13_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = {
      [1] = {
        {8}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_14",
    reset_pos = "locator2_patrol_soldier_14",
    spawn_security_level = 2,
    move_prefix = "locator2_soldier_14_move_",
    turn_target_prefix = "locator2_soldier_14_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_15",
    reset_pos = "locator2_patrol_soldier_15",
    spawn_security_level = 3,
    move_prefix = "locator2_soldier_15_move_",
    turn_target_prefix = "locator2_soldier_15_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_16",
    reset_pos = "locator2_patrol_soldier_16",
    spawn_security_level = 3,
    move_prefix = "locator2_soldier_16_move_",
    turn_target_prefix = "locator2_soldier_16_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_17",
    reset_pos = "locator2_patrol_soldier_17",
    spawn_security_level = 4,
    move_prefix = "locator2_soldier_17_move_",
    turn_target_prefix = "locator2_soldier_17_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_18",
    reset_pos = "locator2_patrol_soldier_18",
    spawn_security_level = 4,
    move_prefix = "locator2_soldier_18_move_",
    turn_target_prefix = "locator2_soldier_18_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_19",
    reset_pos = "locator2_patrol_soldier_19",
    spawn_security_level = 4,
    move_prefix = "locator2_soldier_19_move_",
    turn_target_prefix = "locator2_soldier_19_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_20",
    reset_pos = "locator2_patrol_soldier_20",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_20_move_",
    turn_target_prefix = "locator2_soldier_20_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_21",
    reset_pos = "locator2_patrol_soldier_21",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_21_move_",
    turn_target_prefix = "locator2_soldier_21_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_22",
    reset_pos = "locator2_patrol_soldier_22",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_22_move_",
    turn_target_prefix = "locator2_soldier_22_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_23",
    reset_pos = "locator2_patrol_soldier_23",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_23_move_",
    turn_target_prefix = "locator2_soldier_23_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_24",
    reset_pos = "locator2_patrol_soldier_24",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_24_move_",
    turn_target_prefix = "locator2_soldier_24_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_25",
    reset_pos = "locator2_patrol_soldier_25",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_25_move_",
    turn_target_prefix = "locator2_soldier_25_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = {
      [1] = {
        {7}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_26",
    reset_pos = "locator2_patrol_soldier_26",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_26_move_",
    turn_target_prefix = "locator2_soldier_26_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_27",
    reset_pos = "locator2_patrol_soldier_27",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_27_move_",
    turn_target_prefix = "locator2_soldier_27_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_28",
    reset_pos = "locator2_patrol_soldier_28",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_28_move_",
    turn_target_prefix = "locator2_soldier_28_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_29",
    reset_pos = "locator2_patrol_soldier_29",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_29_move_",
    turn_target_prefix = "locator2_soldier_29_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_30",
    reset_pos = "locator2_patrol_soldier_30",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_30_move_",
    turn_target_prefix = "locator2_soldier_30_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_31",
    reset_pos = "locator2_patrol_soldier_31",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_31_move_",
    turn_target_prefix = "locator2_soldier_31_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_32",
    reset_pos = "locator2_patrol_soldier_32",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_32_move_",
    turn_target_prefix = "locator2_soldier_32_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_33",
    reset_pos = "locator2_patrol_soldier_33",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_33_move_",
    turn_target_prefix = "locator2_soldier_33_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_34",
    reset_pos = "locator2_patrol_soldier_34",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_34_move_",
    turn_target_prefix = "locator2_soldier_34_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = {
      [1] = {
        {23}
      },
      [2] = {
        {9}
      }
    }
  },
  {
    npc_name = "sm07_soldier_01_35",
    reset_pos = "locator2_patrol_soldier_35",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_35_move_",
    turn_target_prefix = "locator2_soldier_35_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_36",
    reset_pos = "locator2_patrol_soldier_36",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_36_move_",
    turn_target_prefix = "locator2_soldier_36_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_37",
    reset_pos = "locator2_patrol_soldier_37",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_37_move_",
    turn_target_prefix = "locator2_soldier_37_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_38",
    reset_pos = "locator2_patrol_soldier_38",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_38_move_",
    turn_target_prefix = "locator2_soldier_38_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_39",
    reset_pos = "locator2_patrol_soldier_39",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_39_move_",
    turn_target_prefix = "locator2_soldier_39_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_40",
    reset_pos = "locator2_patrol_soldier_40",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_40_move_",
    turn_target_prefix = "locator2_soldier_40_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_41",
    reset_pos = "locator2_patrol_soldier_41",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_41_move_",
    turn_target_prefix = "locator2_soldier_41_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "sm07_soldier_01_42",
    reset_pos = "locator2_patrol_soldier_42",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_42_move_",
    turn_target_prefix = "locator2_soldier_42_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = {
      [1] = {
        {9}
      },
      [2] = {
        {23}
      }
    }
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_throw_out_01"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_01"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_02"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_03"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_04"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_05"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_06"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_07"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_08"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_09"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_10"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_11"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_12"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_13"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_14"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_15"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_16"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_17"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_18"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_19"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_20"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_21"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_22"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_23"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_24"
  L0_0(L1_1)
  L0_0 = Fn_sensorOff
  L1_1 = "cubesensor2_lose_res_box_25"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_out_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensormulti2_force_find_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_tutorial_grab_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_tutorial_out_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_restore_res_box_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_restore_res_box_02"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_restore_res_box_03"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L1_1 = "pccubesensor2_restore_res_box_04"
  L0_0(L1_1)
  L0_0 = 1
  while true do
    L1_1 = 1
    L2_2 = "bg2_container_"
    L3_3 = string
    L3_3 = L3_3.format
    L4_4 = "%02d"
    L3_3 = L3_3(L4_4, L5_5)
    L4_4 = "_"
    L2_2 = L2_2 .. L3_3 .. L4_4
    while true do
      L3_3 = findGameObject2
      L4_4 = "GimmickBg"
      L8_8 = L1_1
      L3_3 = L3_3(L4_4, L5_5)
      if L3_3 ~= nil then
        L4_4 = _container_tbl
        L4_4 = L4_4[L0_0]
        if L4_4 == nil then
          L4_4 = _container_tbl
          L4_4[L0_0] = L5_5
        end
        L4_4 = _container_tbl
        L4_4 = L4_4[L0_0]
        L4_4[L1_1] = L3_3
      else
        break
      end
      L1_1 = L1_1 + 1
    end
    if not (L1_1 <= 1) then
      L0_0 = L0_0 + 1
    end
  end
  L0_0 = {
    L1_1,
    L2_2,
    L3_3
  }
  L1_1 = {}
  L1_1.type_str = "s"
  L2_2 = RES_BOX_S_ADD_POINT
  L1_1.add_point = L2_2
  L2_2 = {}
  L2_2.type_str = "m"
  L3_3 = RES_BOX_M_ADD_POINT
  L2_2.add_point = L3_3
  L3_3 = {}
  L3_3.type_str = "l"
  L4_4 = RES_BOX_L_ADD_POINT
  L3_3.add_point = L4_4
  L1_1 = 1
  while true do
    L2_2 = 1
    while true do
      L3_3 = nil
      L4_4 = 0
      for L8_8, L9_9 in L5_5(L6_6) do
        L10_10 = RES_BOX_NAME_PREFIX
        L10_10 = L10_10 .. L9_9.type_str .. "_" .. string.format("%02d", L1_1) .. "_" .. string.format("%02d", L2_2)
        L3_3 = findGameObject2("GimmickBg", L10_10)
        if L3_3 ~= nil then
          L4_4 = L9_9.add_point
          break
        end
      end
      if L3_3 ~= nil then
        L5_5(L6_6, L7_7)
        L5_5(L6_6)
        if L5_5 == nil then
          L5_5[L1_1] = L6_6
        end
        L8_8 = L3_3
        L6_6.name = L7_7
        L6_6.hdl = L3_3
        L6_6.put_sensor = true
        L6_6.add_point = L4_4
        L6_6.break_pos_node = nil
        L6_6.grab = false
        L6_6.is_scored = false
        L5_5[L2_2] = L6_6
      else
        break
      end
      L2_2 = L2_2 + 1
    end
    if not (L2_2 <= 1) then
      L1_1 = L1_1 + 1
    end
  end
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  if L0_0 == "sm07_c" then
    L1_1 = createPatrolSoldier
    L2_2 = false
    L1_1(L2_2)
    L1_1 = PHASE_MAIN_C_INIT
    _phase = L1_1
  elseif L0_0 == "sm07_d" then
    L1_1 = PHASE_MAIN_D
    _phase = L1_1
  else
    L1_1 = PHASE_WAIT
    _phase = L1_1
  end
  L1_1 = CAPTION_PRIORITY_UNKNOWN
  _captionPriority = L1_1
end
function Ingame()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18
  while true do
    L0_11 = _phase
    L1_12 = PHASE_WAIT
    if L0_11 == L1_12 then
      L0_11 = Fn_getMissionPart
      L0_11 = L0_11()
      if L0_11 == "sm07_b" then
        L0_11 = PHASE_MAIN_B_INIT
        _phase = L0_11
      end
    else
      L0_11 = _phase
      L1_12 = PHASE_MAIN_B_INIT
      if L0_11 == L1_12 then
        L0_11 = createPatrolSoldier
        L1_12 = true
        L0_11(L1_12)
        L0_11 = PHASE_MAIN_B_END
        _phase = L0_11
      else
        L0_11 = _phase
        L1_12 = PHASE_MAIN_B_END
        if L0_11 == L1_12 then
          L0_11 = Fn_getMissionPart
          L0_11 = L0_11()
          if L0_11 == "sm07_c" then
            L0_11 = PHASE_MAIN_C_INIT
            _phase = L0_11
          end
        else
          L0_11 = _phase
          L1_12 = PHASE_MAIN_C_INIT
          if L0_11 == L1_12 then
            L0_11 = Fn_userCtrlOff
            L0_11()
            L0_11 = Fn_loadPlayerMotion
            L1_12 = {L2_13}
            L2_13 = "kit01_meow_00"
            L0_11(L1_12)
            L0_11 = RAC_CautionLevel
            L0_11 = L0_11.reset
            L0_11()
            L0_11 = RAC_CautionLevel
            L0_11 = L0_11.setLabel
            L1_12 = "sm07_09053"
            L0_11(L1_12)
            L0_11 = RAC_CautionLevel
            L0_11 = L0_11.setVisible
            L1_12 = false
            L0_11(L1_12)
            L0_11 = RAC_CautionLevel
            L0_11 = L0_11.setKeepVisible
            L1_12 = true
            L0_11(L1_12)
            L0_11 = RAC_CautionLevel
            L0_11 = L0_11.drawTask
            L0_11()
            L0_11 = RAC_GestureManageClass
            L0_11 = L0_11.reset
            L0_11()
            L0_11 = RAC_GestureManageClass
            L0_11 = L0_11.setLabel
            L1_12 = "sm07_09050"
            L0_11(L1_12)
            L0_11 = RAC_GestureManageClass
            L0_11 = L0_11.setYesFunc
            function L1_12()
              Fn_userCtrlOff()
              Fn_playPlayerMotion("kit01_meow_00", 0, 0.3, true)
              waitSeconds(1)
              Sound:playSE("kit_801", 1)
              waitSeconds(0.5)
              Fn_userCtrlOn()
            end
            L0_11(L1_12)
            L0_11 = RAC_GestureManageClass
            L0_11 = L0_11.run
            L0_11()
            L0_11 = startSoldierPatrol
            L1_12 = false
            L0_11(L1_12)
            L0_11 = PHASE_MAIN_C_INIT_END
            _phase = L0_11
          else
            L0_11 = _phase
            L1_12 = PHASE_MAIN_C_INIT_END
            if L0_11 == L1_12 then
            else
              L0_11 = _phase
              L1_12 = PHASE_MAIN_C
              if L0_11 == L1_12 then
                L0_11 = Fn_kaiwaDemoView
                L1_12 = "sm07_00250k"
                L0_11(L1_12)
                L0_11 = invokeTask
                function L1_12()
                  local L0_19, L1_20, L2_21, L3_22, L4_23
                  while true do
                    for L3_22, L4_23 in L0_19(L1_20) do
                      for _FORV_8_, _FORV_9_ in ipairs(L4_23) do
                        if _FORV_9_.hdl:isGrabbed() then
                          _resource_box_tbl[L3_22][_FORV_8_].grab = true
                        end
                      end
                    end
                    L0_19()
                  end
                end
                L0_11 = L0_11(L1_12)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_throw_out_01"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_01"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_02"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_03"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_04"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_05"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_06"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_07"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_08"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_09"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_10"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_11"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_12"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_13"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_14"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_15"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_16"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_17"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_18"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_19"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_20"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_21"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_22"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_23"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_24"
                L1_12(L2_13)
                L1_12 = Fn_sensorOn
                L2_13 = "cubesensor2_lose_res_box_25"
                L1_12(L2_13)
                L1_12 = Fn_pcSensorOn
                L2_13 = "pccubesensor2_restore_res_box_01"
                L1_12(L2_13)
                L1_12 = Fn_pcSensorOn
                L2_13 = "pccubesensor2_restore_res_box_02"
                L1_12(L2_13)
                L1_12 = Fn_pcSensorOn
                L2_13 = "pccubesensor2_restore_res_box_03"
                L1_12(L2_13)
                L1_12 = Fn_pcSensorOn
                L2_13 = "pccubesensor2_restore_res_box_04"
                L1_12(L2_13)
                L1_12 = Fn_userCtrlOn
                L1_12()
                L1_12 = Player
                L2_13 = L1_12
                L1_12 = L1_12.setGrabAttractRadius
                L3_14 = GRAB_ATTRACT_RADIUS
                L1_12(L2_13, L3_14)
                L1_12 = Player
                L2_13 = L1_12
                L1_12 = L1_12.setGrabThrowLimit
                L3_14 = THROW_FLYING_DISTANCE
                L4_15 = THROW_FLYING_DURATION_SEC
                L1_12(L2_13, L3_14, L4_15)
                L1_12 = Player
                L2_13 = L1_12
                L1_12 = L1_12.setGrabThrowFreeFall
                L3_14 = THROW_FREE_FALL_DISTANCE
                L4_15 = THROW_FREE_FALL_GRAVITY_ACCEL
                L1_12(L2_13, L3_14, L4_15)
                function L1_12()
                  RAC_infoView("sm07_info_01")
                  Fn_missionView("sm07_09004")
                end
                L2_13 = L1_12
                L2_13()
                L2_13 = RAC_CautionLevel
                L2_13 = L2_13.setVisible
                L3_14 = true
                L2_13(L3_14)
                L2_13 = HUD
                L3_14 = L2_13
                L2_13 = L2_13.counter99_99SetTextID
                L4_15 = "sm07_09003"
                L2_13(L3_14, L4_15)
                L2_13 = HUD
                L3_14 = L2_13
                L2_13 = L2_13.counter99_99SetIcon
                L4_15 = HUD
                L4_15 = L4_15.kCount99_99IconType_Stone
                L2_13(L3_14, L4_15)
                L2_13 = HUD
                L3_14 = L2_13
                L2_13 = L2_13.counter99_99SetMax
                L4_15 = RES_THROW_OUT_MAX_POINT
                L2_13(L3_14, L4_15)
                L2_13 = HUD
                L3_14 = L2_13
                L2_13 = L2_13.counter99_99SetNum
                L4_15 = _res_throw_out_point
                L2_13(L3_14, L4_15)
                L2_13 = HUD
                L3_14 = L2_13
                L2_13 = L2_13.counter99_99SetVisible
                L4_15 = true
                L2_13(L3_14, L4_15)
                L2_13 = {
                  L3_14,
                  L4_15,
                  L5_16
                }
                L3_14 = {}
                L3_14.min_soldier_kill_count = 1
                L3_14.min_throw_out_point = 20
                L3_14.caption = "sm07_09005"
                L3_14.se = "m10_916c"
                L3_14.is_radio_se = true
                L3_14.soldier_lost_sound_rate_sub = 25
                L4_15 = {}
                L4_15.min_soldier_kill_count = 3
                L4_15.min_throw_out_point = 30
                L4_15.caption = "sm07_09006"
                L4_15.se = "m10_914c"
                L4_15.is_radio_se = true
                L4_15.soldier_lost_sound_rate_sub = 100
                L5_16 = {}
                L5_16.min_soldier_kill_count = 5
                L5_16.min_throw_out_point = nil
                L5_16.caption = "sm07_09007"
                L5_16.se = "ene_human_call_m25"
                L5_16.is_radio_se = false
                L5_16.soldier_lost_sound_rate_sub = 100
                function L3_14()
                  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30
                  L0_24 = Player
                  L0_24 = L0_24.setStay
                  L0_24(L1_25, L2_26)
                  L0_24 = Camera
                  L0_24 = L0_24.setControl
                  L0_24(L1_25, L2_26, L3_27, L4_28)
                  L0_24 = Player
                  L0_24 = L0_24.setNoDamageMode
                  L0_24(L1_25, L2_26, L3_27)
                  L0_24 = Sound
                  L0_24 = L0_24.playSEHandle
                  L5_29 = Fn_findAreaHandle
                  L6_30 = "ar_a_root"
                  L6_30 = L5_29(L6_30)
                  L0_24 = L0_24(L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L5_29(L6_30))
                  for L4_28, L5_29 in L1_25(L2_26) do
                    L6_30 = _patrol_soldier_tbl
                    L6_30 = L6_30[L4_28]
                    L6_30 = L6_30.setAlert
                    L6_30(L6_30)
                  end
                  if L2_26 ~= nil then
                  end
                  L2_26(L3_27)
                  L2_26(L3_27, L4_28)
                  L2_26(L3_27)
                  if L1_25 ~= nil then
                    while true do
                      if L2_26 then
                        L2_26()
                      end
                    end
                    L2_26(L3_27)
                  end
                  L2_26()
                  L2_26(L3_27, L4_28)
                  L0_24 = nil
                  L2_26(L3_27, L4_28)
                  L2_26()
                  L2_26(L3_27)
                  _soldier_kill_count = 0
                  _security_level = 1
                  L2_26()
                  _res_throw_out_point = 0
                  L2_26(L3_27, L4_28)
                  L2_26(L3_27)
                  L2_26(L3_27)
                  for L5_29, L6_30 in L2_26(L3_27) do
                    for _FORV_10_, _FORV_11_ in ipairs(L6_30) do
                      _container_tbl[L5_29][_FORV_10_]:requestRestoreForce()
                    end
                  end
                  for L5_29, L6_30 in L2_26(L3_27) do
                    for _FORV_10_, _FORV_11_ in ipairs(L6_30) do
                      _resource_box_tbl[L5_29][_FORV_10_].hdl:requestRestoreForce()
                      _resource_box_tbl[L5_29][_FORV_10_].put_sensor = true
                      _resource_box_tbl[L5_29][_FORV_10_].grab = false
                      _resource_box_tbl[L5_29][_FORV_10_].is_scored = false
                    end
                  end
                  L2_26()
                  L2_26()
                  L2_26()
                  L5_29 = Camera
                  L5_29 = L5_29.kControl_All
                  L6_30 = true
                  L2_26(L3_27, L4_28, L5_29, L6_30)
                  L5_29 = false
                  L2_26(L3_27, L4_28, L5_29)
                end
                function L4_15()
                  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36, L6_37
                  L0_31 = Player
                  L0_31 = L0_31.setStay
                  L0_31(L1_32, L2_33)
                  L0_31 = Player
                  L0_31 = L0_31.setEnergyInfinite
                  L0_31(L1_32, L2_33, L3_34)
                  L0_31 = Sound
                  L0_31 = L0_31.playSEHandle
                  L5_36 = Fn_findAreaHandle
                  L6_37 = "ar_a_root"
                  L6_37 = L5_36(L6_37)
                  L0_31 = L0_31(L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L5_36(L6_37))
                  for L4_35, L5_36 in L1_32(L2_33) do
                    L6_37 = _patrol_soldier_tbl
                    L6_37 = L6_37[L4_35]
                    L6_37 = L6_37.setAlert
                    L6_37(L6_37)
                  end
                  L1_32(L2_33)
                  L1_32(L2_33, L3_34, L4_35)
                  L1_32(L2_33, L3_34)
                  L1_32(L2_33)
                  L3_34.eff_name = "ef_com_exp_01"
                  L3_34.world_pos = L1_32
                  L3_34.loop = false
                  L3_34.time = 10
                  L2_33(L3_34)
                  L5_36 = 0.01
                  L5_36 = L4_35
                  L6_37 = L1_32
                  L4_35(L5_36, L6_37, L3_34:Apply(L2_33) * 10, 0, true)
                  L2_33(L3_34)
                  L2_33()
                  L2_33(L3_34, L4_35)
                  L0_31 = nil
                  L2_33(L3_34, L4_35)
                  L2_33()
                  L2_33(L3_34)
                  _soldier_kill_count = 0
                  _security_level = 1
                  L2_33()
                  _res_throw_out_point = 0
                  L2_33(L3_34, L4_35)
                  L2_33(L3_34)
                  L2_33(L3_34)
                  for L5_36, L6_37 in L2_33(L3_34) do
                    for _FORV_10_, _FORV_11_ in ipairs(L6_37) do
                      _container_tbl[L5_36][_FORV_10_]:requestRestoreForce()
                    end
                  end
                  for L5_36, L6_37 in L2_33(L3_34) do
                    for _FORV_10_, _FORV_11_ in ipairs(L6_37) do
                      _resource_box_tbl[L5_36][_FORV_10_].hdl:requestRestoreForce()
                      _resource_box_tbl[L5_36][_FORV_10_].put_sensor = true
                      _resource_box_tbl[L5_36][_FORV_10_].grab = false
                      _resource_box_tbl[L5_36][_FORV_10_].is_scored = false
                    end
                  end
                  L2_33()
                  L2_33()
                  L2_33()
                  L5_36 = false
                  L2_33(L3_34, L4_35, L5_36)
                end
                function L5_16()
                  local L0_38, L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L7_45
                  L0_38 = Fn_catWarpIn
                  L0_38()
                  L0_38 = {
                    L1_39,
                    L2_40,
                    L3_41,
                    L4_42,
                    L5_43,
                    L6_44
                  }
                  L1_39 = "warppoint2_restart_02_pc_01"
                  L2_40 = "warppoint2_restart_02_pc_02"
                  L6_44 = "warppoint2_restart_02_pc_06"
                  L1_39, L2_40 = nil, nil
                  for L6_44, L7_45 in L3_41(L4_42) do
                    if findGameObject2("Node", L7_45) ~= nil then
                      if L1_39 ~= nil then
                        if L2_40 > Fn_getDistanceToPlayer(findGameObject2("Node", L7_45):getWorldPos()) then
                          L2_40, L1_39 = Fn_getDistanceToPlayer(findGameObject2("Node", L7_45):getWorldPos()), L6_44
                        end
                      else
                        L2_40, L1_39 = Fn_getDistanceToPlayer(findGameObject2("Node", L7_45):getWorldPos()), L6_44
                      end
                    end
                  end
                  if L1_39 ~= nil then
                    L3_41(L4_42)
                  end
                  L3_41()
                  L0_38 = RAC_CautionLevel
                  L0_38 = L0_38.setValueLimitRange
                  L0_38()
                  L0_38 = Fn_catWarpOut
                  L0_38()
                end
                L6_17 = true
                function L7_18()
                  local L0_46, L1_47, L2_48, L3_49
                  _is_out_of_range = false
                  L0_46 = Fn_pcSensorOn
                  L1_47 = "pccubesensor2_out_01"
                  L0_46(L1_47)
                  _is_in_bomb_sensor = false
                  L0_46 = Fn_pcSensorOn
                  L1_47 = "pccubesensormulti2_force_find_01"
                  L0_46(L1_47)
                  L0_46 = setResBoxEventListener
                  L0_46()
                  L0_46 = invokeTask
                  function L1_47()
                    local L0_50, L1_51, L2_52, L3_53
                    L0_50 = false
                    L1_51 = false
                    L2_52 = false
                    while true do
                      L2_52 = L1_51
                      L3_53 = Pad
                      L3_53 = L3_53.getButton
                      L3_53 = L3_53(L3_53, Pad.kButton_RR)
                      L1_51 = L3_53
                      if L0_50 == true and L2_52 == false and L1_51 == true then
                        L3_53 = Fn_getPlayerWorldPos
                        L3_53 = L3_53()
                        for _FORV_7_, _FORV_8_ in pairs(_patrol_soldier_tbl) do
                          _patrol_soldier_tbl[_FORV_7_]:setNoticeSound(L3_53)
                        end
                      end
                      L3_53 = Player
                      L3_53 = L3_53.getGrabObjectCount
                      L3_53 = L3_53(L3_53)
                      L0_50 = L3_53 > 0
                      L3_53 = wait
                      L3_53()
                    end
                  end
                  L0_46 = L0_46(L1_47)
                  L1_47 = invokeTask
                  function L2_48()
                    local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60
                    while true do
                      L0_54 = wait
                      L0_54()
                      L0_54 = _security_level
                      if L0_54 <= L1_55 then
                        L0_54 = _security_level
                        L0_54 = L2_13[L0_54]
                        if L1_55 ~= nil then
                        end
                        if not (L1_55 <= L2_56) then
                          if L1_55 ~= nil then
                          end
                        elseif L1_55 <= L2_56 then
                          _security_level = L1_55
                          if L1_55 == true then
                            L4_58 = "radio"
                            L1_55(L2_56, L3_57, L4_58)
                          end
                          L1_55(L2_56, L3_57)
                          if L1_55 == true then
                            L1_55(L2_56)
                          end
                          L1_55(L2_56)
                          L1_55(L2_56)
                          for L4_58, L5_59 in L1_55(L2_56) do
                            L6_60 = _patrol_soldier_tbl
                            L6_60 = L6_60[L4_58]
                            L6_60 = L6_60.getLostSoundRate
                            L6_60 = L6_60(L6_60)
                            L6_60 = L6_60 - L0_54.soldier_lost_sound_rate_sub
                            _patrol_soldier_tbl[L4_58]:setLostSoundRate(L6_60)
                          end
                        end
                      end
                    end
                  end
                  L1_47 = L1_47(L2_48)
                  L2_48 = L6_17
                  if L2_48 == true then
                    L2_48 = invokeTutorialTask
                    L2_48 = L2_48()
                  else
                    L2_48 = L2_48 or nil
                  end
                  L3_49 = false
                  L6_17 = L3_49
                  _found_soldier_name = nil
                  _point_cap_idx = 1
                  _res_throw_failed_count = 0
                  L3_49 = 0
                  while HUD:counter99_99GetNum() < RES_THROW_OUT_MAX_POINT do
                    wait()
                    if _found_soldier_name == nil and _is_out_of_range ~= true then
                      if _is_in_bomb_sensor == true then
                        L3_49 = math.min(L3_49 + BOMB_CAUTION_INC_SPEED, RAC_CautionLevel.MAX_LEVEL)
                        if true == true then
                          Sound:playSE("m25_903", 0.8)
                          CaptionViewPriority("sm07_09011", CAPTION_PRIORITY_SOLDIER)
                        end
                      else
                        L3_49 = math.max(L3_49 - BOMB_CAUTION_DEC_SPEED, 0)
                      end
                      RAC_CautionLevel.setValueLimitRange(L3_49)
                    end
                    if not (L3_49 >= RAC_CautionLevel.MAX_LEVEL) then
                      HUD:counter99_99SetNum(_res_throw_out_point)
                    end
                  end
                  if L2_48 ~= nil then
                    L2_48:abort()
                    L2_48 = nil
                  end
                  L1_47:abort()
                  L1_47 = nil
                  L0_46:abort()
                  L0_46 = nil
                  clearResBoxEventListenert()
                  Fn_pcSensorOff("pccubesensormulti2_force_find_01")
                  Fn_pcSensorOff("pccubesensor2_out_01")
                  if _res_throw_failed_cap_wait_task ~= nil then
                    _res_throw_failed_cap_wait_task:abort()
                    _res_throw_failed_cap_wait_task = nil
                  end
                  if _hundred_legs_caption_wait_task then
                    _hundred_legs_caption_wait_task:abort()
                    _hundred_legs_caption_wait_task = nil
                  end
                  if _found_soldier_name ~= nil then
                    L3_14()
                    return false
                  elseif L3_49 >= RAC_CautionLevel.MAX_LEVEL then
                    L4_15()
                    return false
                  elseif _is_out_of_range == true then
                    if _catwarp_enable then
                      L5_16()
                    end
                    return false
                  end
                  _is_in_bomb_sensor = false
                  _is_out_of_range = false
                  return true
                end
                while true do
                  if L7_18() == false then
                  else
                  end
                end
                L2_13 = HUD
                L3_14 = L2_13
                L2_13 = L2_13.counter99_99SetVisible
                L4_15 = false
                L2_13(L3_14, L4_15)
                L2_13 = RAC_CautionLevel
                L2_13 = L2_13.reset
                L2_13()
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_throw_out_01"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_01"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_02"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_03"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_04"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_05"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_06"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_07"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_08"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_09"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_10"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_11"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_12"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_13"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_14"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_15"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_16"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_17"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_18"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_19"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_20"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_21"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_22"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_23"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_24"
                L2_13(L3_14)
                L2_13 = Fn_sensorOff
                L3_14 = "cubesensor2_lose_res_box_25"
                L2_13(L3_14)
                L2_13 = Fn_pcSensorOff
                L3_14 = "pccubesensor2_restore_res_box_01"
                L2_13(L3_14)
                L2_13 = Fn_pcSensorOff
                L3_14 = "pccubesensor2_restore_res_box_02"
                L2_13(L3_14)
                L2_13 = Fn_pcSensorOff
                L3_14 = "pccubesensor2_restore_res_box_03"
                L2_13(L3_14)
                L2_13 = Fn_pcSensorOff
                L3_14 = "pccubesensor2_restore_res_box_04"
                L2_13(L3_14)
                L3_14 = L0_11
                L2_13 = L0_11.abort
                L2_13(L3_14)
                L0_11 = nil
                L2_13 = waitSeconds
                L3_14 = 3
                L2_13(L3_14)
                L2_13 = Fn_kaiwaDemoView
                L3_14 = "sm07_00280k"
                L2_13(L3_14)
                L2_13 = RAC_GestureManageClass
                L2_13 = L2_13.reset
                L2_13()
                L2_13 = Player
                L3_14 = L2_13
                L2_13 = L2_13.setGrabAttractRadius
                L4_15 = -1
                L2_13(L3_14, L4_15)
                L2_13 = Player
                L3_14 = L2_13
                L2_13 = L2_13.setGrabThrowLimit
                L2_13(L3_14)
                L2_13 = Player
                L3_14 = L2_13
                L2_13 = L2_13.setGrabThrowFreeFall
                L2_13(L3_14)
                L2_13 = Fn_userCtrlOff
                L2_13()
                L2_13 = Fn_blackout
                L3_14 = 0.5
                L2_13(L3_14)
                L2_13 = deletePatrolSoldier
                L2_13()
                _escape_start_idx = nil
                L2_13 = nil
                L3_14 = 1
                while true do
                  L4_15 = findGameObject2
                  L5_16 = "Node"
                  L6_17 = "warppoint2_escape_pc_"
                  L7_18 = string
                  L7_18 = L7_18.format
                  L7_18 = L7_18("%02d", L3_14)
                  L6_17 = L6_17 .. L7_18
                  L4_15 = L4_15(L5_16, L6_17)
                  if L4_15 ~= nil then
                    L5_16 = Fn_getDistanceToPlayer
                    L7_18 = L4_15
                    L6_17 = L4_15.getWorldPos
                    L7_18 = L6_17(L7_18)
                    L5_16 = L5_16(L6_17, L7_18, L6_17(L7_18))
                    L6_17 = _escape_start_idx
                    if L6_17 ~= nil then
                      if L2_13 > L5_16 then
                        _escape_start_idx = L3_14
                        L2_13 = L5_16
                      end
                    else
                      _escape_start_idx = L3_14
                      L2_13 = L5_16
                    end
                  else
                    break
                  end
                  L3_14 = L3_14 + 1
                end
                L4_15 = PHASE_MAIN_C_END
                _phase = L4_15
                break
              else
                L0_11 = _phase
                L1_12 = PHASE_MAIN_C_END
                if L0_11 == L1_12 then
                  L0_11 = Fn_getMissionPart
                  L0_11 = L0_11()
                  if L0_11 == "sm07_d" then
                    L0_11 = PHASE_MAIN_D
                    _phase = L0_11
                  end
                else
                  L0_11 = _phase
                  L1_12 = PHASE_MAIN_D
                  if L0_11 == L1_12 then
                  end
                end
              end
            end
          end
        end
      end
    end
    L0_11 = wait
    L0_11()
  end
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabAttractRadius(-1)
  end
  if _hundred_legs_caption_wait_task then
    _hundred_legs_caption_wait_task:abort()
    _hundred_legs_caption_wait_task = nil
  end
  if _captionPriorityTask then
    _captionPriorityTask:abort()
    _captionPriorityTask = nil
  end
  Sound:setGlobalVariable("voice_type", "normal")
end
function soldierChangeStateCallback(A0_61, A1_62, A2_63, A3_64, A4_65)
  local L5_66
  if A1_62 == L5_66 then
    L5_66(L5_66, "m25_903", 1, "", Fn_findNpcPuppet(A0_61))
    L5_66("sm07_09011", CAPTION_PRIORITY_SOLDIER)
  elseif A1_62 == L5_66 then
    Sound:playSE("m25_903", 1, "", Fn_findNpcPuppet(A0_61))
    CaptionViewPriority(L5_66[RandI(1, #L5_66)], CAPTION_PRIORITY_SOLDIER)
  elseif A1_62 == L5_66 then
    if L5_66 == true then
      for _FORV_9_, _FORV_10_ in pairs(_patrol_soldier_tbl) do
        if _FORV_9_ ~= A0_61 and _FORV_10_:getStatus() == NPC_STATUS.SOUND_CAUTION then
          break
        end
      end
    end
    if L5_66 == true then
      Sound:playSE("m25_903", 1, "", Fn_findNpcPuppet(A0_61))
      CaptionViewPriority("sm07_09015", CAPTION_PRIORITY_SOLDIER)
    end
  elseif A1_62 == L5_66 then
    _patrol_soldier_tbl[A0_61]:setLostSoundRate(L5_66)
    Sound:playSE("m25_930b", 1, "", Fn_findNpcPuppet(A0_61))
    CaptionViewPriority("sm07_09016", CAPTION_PRIORITY_SOLDIER)
  elseif A1_62 == L5_66 then
    L5_66(L5_66, 0)
    L5_66(L5_66, "m25_923b", 1, "", Fn_findNpcPuppet(A0_61))
    L5_66("sm07_09017", CAPTION_PRIORITY_SOLDIER)
  elseif A1_62 == L5_66 then
    if A4_65 ~= A1_62 then
      Sound:playSE("m23_914c", 1, "", Fn_findNpcPuppet(A0_61))
      CaptionViewPriority(L5_66[RandI(1, #L5_66)], CAPTION_PRIORITY_SOLDIER)
    end
  elseif A1_62 == L5_66 then
    if A4_65 ~= L5_66 then
      Sound:playSE(L5_66[RandI(1, #L5_66)].se, 1, "", Fn_findNpcPuppet(A0_61))
      Fn_captionView(L5_66[RandI(1, #L5_66)].cap)
    end
  elseif A1_62 == L5_66 then
    if A4_65 ~= L5_66 then
      Sound:playSE(L5_66[RandI(1, #L5_66)].se, 1, "", Fn_findNpcPuppet(A0_61))
      Fn_captionView(L5_66[RandI(1, #L5_66)].cap)
    end
  elseif A1_62 == L5_66 then
    Sound:playSE("ene_human_damaged_m25", 1, "", Fn_findNpcPuppet(A0_61))
    CaptionViewPriority(L5_66[RandI(1, #L5_66)], CAPTION_PRIORITY_SOLDIER)
  elseif A1_62 == L5_66 then
    for _FORV_8_, _FORV_9_ in L5_66(_patrol_soldier_tbl) do
      _patrol_soldier_tbl[_FORV_8_]:setIndicationEnable(true)
    end
  elseif A1_62 == L5_66 then
    if 0 < L5_66:getHealth() then
      _found_soldier_name = A0_61
    end
  elseif A1_62 == L5_66 then
    for _FORV_9_, _FORV_10_ in pairs(_patrol_soldier_tbl) do
      if _FORV_9_ ~= A0_61 and _FORV_10_:getStatus() == NPC_STATUS.BEGIN_COMBAT then
        break
      end
    end
    if L5_66 == true then
      for _FORV_9_, _FORV_10_ in pairs(_patrol_soldier_tbl) do
        _patrol_soldier_tbl[_FORV_9_]:setIndicationEnable(false)
      end
    end
    _soldier_kill_count = _soldier_kill_count + 1
  elseif A1_62 == L5_66 then
  end
end
function deletePatrolSoldier()
  local L0_67, L1_68, L2_69, L3_70, L4_71, L5_72
  L0_67 = endSoldierPatrol
  L0_67()
  L0_67 = {}
  for L4_71, L5_72 in L1_68(L2_69) do
    table.insert(L0_67, L4_71)
  end
  _patrol_pup_tbl = L1_68
  if L1_68 > 0 then
    for L4_71, L5_72 in L1_68(L2_69) do
      if Fn_findNpcPuppet(L5_72) ~= nil then
        print("disappearNpc: " .. L5_72)
        Fn_setGrabReleaseNpc(L5_72)
        Fn_disappearNpc(L5_72)
      end
    end
    L1_68()
  end
  L1_68.npcList = L2_69
  L1_68.npcList = L2_69
end
function createPatrolSoldier(A0_73)
  local L1_74, L2_75, L3_76, L4_77, L5_78
  L1_74 = deletePatrolSoldier
  L1_74()
  L1_74 = {
    L2_75,
    L3_76,
    L4_77,
    L5_78,
    {
      name = "sm07_soldier_01_05",
      type = "soldier",
      node = "locator2_patrol_soldier_05",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_06",
      type = "soldier",
      node = "locator2_patrol_soldier_06",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_07",
      type = "soldier",
      node = "locator2_patrol_soldier_07",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_08",
      type = "soldier",
      node = "locator2_patrol_soldier_08",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_09",
      type = "soldier",
      node = "locator2_patrol_soldier_09",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_10",
      type = "soldier",
      node = "locator2_patrol_soldier_10",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_11",
      type = "soldier",
      node = "locator2_patrol_soldier_11",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_12",
      type = "soldier",
      node = "locator2_patrol_soldier_12",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_13",
      type = "soldier",
      node = "locator2_patrol_soldier_13",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_14",
      type = "soldier",
      node = "locator2_patrol_soldier_14",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_15",
      type = "soldier",
      node = "locator2_patrol_soldier_15",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_16",
      type = "soldier",
      node = "locator2_patrol_soldier_16",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_17",
      type = "soldier",
      node = "locator2_patrol_soldier_17",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_18",
      type = "soldier",
      node = "locator2_patrol_soldier_18",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_19",
      type = "soldier",
      node = "locator2_patrol_soldier_19",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_20",
      type = "soldier",
      node = "locator2_patrol_soldier_20",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_21",
      type = "soldier",
      node = "locator2_patrol_soldier_21",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_22",
      type = "soldier",
      node = "locator2_patrol_soldier_22",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_23",
      type = "soldier",
      node = "locator2_patrol_soldier_23",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_24",
      type = "soldier",
      node = "locator2_patrol_soldier_24",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_25",
      type = "soldier",
      node = "locator2_patrol_soldier_25",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_26",
      type = "soldier",
      node = "locator2_patrol_soldier_26",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_27",
      type = "soldier",
      node = "locator2_patrol_soldier_27",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_28",
      type = "soldier",
      node = "locator2_patrol_soldier_28",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_29",
      type = "soldier",
      node = "locator2_patrol_soldier_29",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_30",
      type = "soldier",
      node = "locator2_patrol_soldier_30",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_31",
      type = "soldier",
      node = "locator2_patrol_soldier_31",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_32",
      type = "soldier",
      node = "locator2_patrol_soldier_32",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_33",
      type = "soldier",
      node = "locator2_patrol_soldier_33",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_34",
      type = "soldier",
      node = "locator2_patrol_soldier_34",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_35",
      type = "soldier",
      node = "locator2_patrol_soldier_35",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_36",
      type = "soldier",
      node = "locator2_patrol_soldier_36",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_37",
      type = "soldier",
      node = "locator2_patrol_soldier_37",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_38",
      type = "soldier",
      node = "locator2_patrol_soldier_38",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_39",
      type = "soldier",
      node = "locator2_patrol_soldier_39",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_40",
      type = "soldier",
      node = "locator2_patrol_soldier_40",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_41",
      type = "soldier",
      node = "locator2_patrol_soldier_41",
      active = false,
      start = A0_73,
      attach = false
    },
    {
      name = "sm07_soldier_01_42",
      type = "soldier",
      node = "locator2_patrol_soldier_42",
      active = false,
      start = A0_73,
      attach = false
    }
  }
  L2_75.name = "sm07_soldier_01_01"
  L2_75.type = "soldier"
  L2_75.node = "locator2_patrol_soldier_01"
  L2_75.active = false
  L2_75.start = A0_73
  L2_75.attach = false
  L3_76.name = "sm07_soldier_01_02"
  L3_76.type = "soldier"
  L3_76.node = "locator2_patrol_soldier_02"
  L3_76.active = false
  L3_76.start = A0_73
  L3_76.attach = false
  L4_77.name = "sm07_soldier_01_03"
  L4_77.type = "soldier"
  L4_77.node = "locator2_patrol_soldier_03"
  L4_77.active = false
  L4_77.start = A0_73
  L4_77.attach = false
  L5_78 = {}
  L5_78.name = "sm07_soldier_01_04"
  L5_78.type = "soldier"
  L5_78.node = "locator2_patrol_soldier_04"
  L5_78.active = false
  L5_78.start = A0_73
  L5_78.attach = false
  L2_75(L3_76)
  for L5_78, _FORV_6_ in L2_75(L3_76) do
    _patrol_pup_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  for L5_78, _FORV_6_ in L2_75(L3_76) do
    Fn_loadNpcEventMotion(L5_78, {
      "man57_lookaround_00"
    })
  end
end
function startSoldierPatrol(A0_79)
  local L1_80, L2_81, L3_82, L4_83, L5_84
  for L4_83, L5_84 in L1_80(L2_81) do
    if _patrol_soldier_tbl[L5_84.npc_name] == nil and L5_84.spawn_security_level <= _security_level then
      _patrol_soldier_spawn_task_tbl[L5_84.npc_name] = invokeTask(function()
        local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90, L6_91
        L0_85 = A0_79
        if L0_85 == true then
          L0_85 = findGameObject2
          L1_86 = "Node"
          L2_87 = L5_84.reset_pos
          L0_85 = L0_85(L1_86, L2_87)
          while true do
            L1_86 = Fn_isInSightTarget
            L2_87 = L0_85
            L3_88 = 1
            L1_86 = L1_86(L2_87, L3_88)
            if L1_86 == true then
              L1_86 = RAC_RaycastEyeSight
              L2_87 = L0_85
              L3_88 = Fn_getDistanceToPlayer
              L4_89 = L0_85
              L3_88 = L3_88(L4_89)
              L3_88 = L3_88 + 1
              L4_89 = 180
              L5_90 = 1.5
              L6_91 = 1
              L1_86 = L1_86(L2_87, L3_88, L4_89, L5_90, L6_91)
            end
            if L1_86 == true then
              L1_86 = wait
              L2_87 = RandI
              L3_88 = 2
              L4_89 = 5
              L6_91 = L2_87(L3_88, L4_89)
              L1_86(L2_87, L3_88, L4_89, L5_90, L6_91, L2_87(L3_88, L4_89))
            end
          end
        end
        L0_85 = Fn_setNpcActive
        L1_86 = L5_84.npc_name
        L2_87 = true
        L0_85(L1_86, L2_87)
        L0_85 = RAC_PerceivableNpc
        L0_85 = L0_85.new
        L1_86 = L5_84.npc_name
        L0_85 = L0_85(L1_86)
        L1_86 = {}
        L2_87 = 1
        while true do
          L3_88 = 1
          while true do
            L4_89 = findGameObject2
            L5_90 = "Node"
            L6_91 = L5_84.move_prefix
            L6_91 = L6_91 .. string.format("%02d", L2_87) .. "_" .. string.format("%02d", L3_88)
            L4_89 = L4_89(L5_90, L6_91)
            if L4_89 ~= nil then
              L5_90 = L1_86[L2_87]
              if L5_90 == nil then
                L5_90 = {}
                L1_86[L2_87] = L5_90
              end
              L5_90 = table
              L5_90 = L5_90.insert
              L6_91 = L1_86[L2_87]
              L5_90(L6_91, {
                pos = L4_89:getName(),
                opt = nil
              })
            else
              break
            end
            L3_88 = L3_88 + 1
          end
          if not (L3_88 <= 1) then
            L2_87 = L2_87 + 1
          end
        end
        L3_88 = #L1_86
        if L3_88 <= 0 then
          L3_88 = {L4_89}
          L4_89 = {}
          L5_90 = L5_84.reset_pos
          L4_89.pos = L5_90
          L4_89.opt = nil
          L1_86[1] = L3_88
        end
        L3_88 = L0_85
        L2_87 = L0_85.setPosList
        L4_89 = L1_86
        L2_87(L3_88, L4_89)
        L3_88 = L0_85
        L2_87 = L0_85.setMoveOption
        L4_89 = {}
        L4_89.arrivedLength = 1
        L4_89.runLength = 10000
        L4_89.recast = true
        L2_87(L3_88, L4_89)
        L2_87 = {}
        L3_88 = L5_84.turn_target_prefix
        if L3_88 ~= nil then
          L3_88 = #L1_86
          L4_89 = 1
          while true do
            L5_90 = 1
            while true do
              L6_91 = findGameObject2
              L6_91 = L6_91("Node", L5_84.turn_target_prefix .. string.format("%02d", L4_89) .. "_" .. string.format("%02d", L5_90))
              if L6_91 ~= nil then
                if L2_87[L4_89] == nil then
                  L2_87[L4_89] = {}
                end
                table.insert(L2_87[L4_89], L6_91)
              else
                break
              end
              L5_90 = L5_90 + 1
            end
            if not (L5_90 <= 1) or not (L3_88 <= L4_89) then
              L4_89 = L4_89 + 1
            end
          end
        end
        L4_89 = L0_85
        L3_88 = L0_85.setTurnList
        L5_90 = L2_87
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setManageResGroupList
        L5_90 = L5_84.manage_res_box_group_idx
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setCheckResLostFnc
        function L5_90(A0_92)
          for _FORV_5_, _FORV_6_ in ipairs(_resource_box_tbl[A0_92]) do
            ;({})[_FORV_5_] = _FORV_6_.put_sensor == false or _FORV_6_.hdl:isGrabbed() == true or _FORV_6_.hdl:isBroken() == true
          end
          return {}
        end
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setChaseMoveOption
        L5_90 = nil
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setLoop
        L5_90 = true
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setSightParam2
        L5_90 = SOLDIER_SIGHT_H_DEG
        L6_91 = SOLDIER_SIGHT_V_DEG
        L3_88(L4_89, L5_90, L6_91, SOLDIER_SIGHT_LEN)
        L4_89 = L0_85
        L3_88 = L0_85.setNoticeSoundRange
        L5_90 = SOLDIER_HEARING_RANGE
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setCautionCoefficient
        L5_90 = SOLDIER_CAUTION_INC_COEFFICENT
        L6_91 = SOLDIER_CAUTION_DEC_COEFFICENT
        L3_88(L4_89, L5_90, L6_91)
        L4_89 = L0_85
        L3_88 = L0_85.setOnChangeState
        L5_90 = soldierChangeStateCallback
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setCombatReady
        L5_90 = true
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setCombatTimeEnable
        L5_90 = true
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setCombatTime
        L5_90 = 5
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setCombatTimeoutCallbackOnly
        L5_90 = true
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setIndicationEnable
        L5_90 = false
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setIndicationRange
        L5_90 = SOLDIER_INDICATION_LEN
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setIndicationCoefficient
        L5_90 = SOLDIER_INDICATION_INC_COEFFICENT
        L6_91 = SOLDIER_INDICATION_DEC_COEFFICENT
        L3_88(L4_89, L5_90, L6_91)
        L4_89 = L0_85
        L3_88 = L0_85.setDamageType
        L5_90 = 1
        L6_91 = nil
        L3_88(L4_89, L5_90, L6_91)
        L4_89 = L0_85
        L3_88 = L0_85.setCombatGrabEnable
        L5_90 = true
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setDismissMotion
        L5_90 = "man57_lookaround_00"
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setResCautionMotion
        L5_90 = "man57_lookaround_00"
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.setSoundCautionMotion
        L5_90 = "man57_lookaround_00"
        L3_88(L4_89, L5_90)
        L4_89 = L0_85
        L3_88 = L0_85.action
        L3_88(L4_89)
        L3_88 = _patrol_soldier_tbl
        L4_89 = L5_84.npc_name
        L3_88[L4_89] = L0_85
        L3_88 = _patrol_soldier_spawn_task_tbl
        L4_89 = L5_84.npc_name
        L3_88[L4_89] = nil
      end)
    else
    end
  end
end
function endSoldierPatrol()
  for _FORV_3_, _FORV_4_ in pairs(_patrol_soldier_spawn_task_tbl) do
    if _FORV_4_ and _FORV_4_:isRunning() then
      _FORV_4_:abort()
    end
  end
  _patrol_soldier_spawn_task_tbl = {}
  for _FORV_3_, _FORV_4_ in pairs(_patrol_soldier_tbl) do
    _patrol_soldier_tbl[_FORV_3_]:terminate()
    _patrol_soldier_tbl[_FORV_3_]:taskAbort()
  end
  _patrol_soldier_tbl = {}
end
function setResBoxEventListener()
  local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101
  for L3_96, L4_97 in L0_93(L1_94) do
    for L8_101, _FORV_9_ in L5_98(L6_99) do
      _resource_box_tbl[L3_96][L8_101].hdl:setEventListener("dynamic", function(A0_102)
        local L1_103, L2_104, L3_105
        L2_104 = A0_102
        L1_103 = A0_102.getName
        L1_103 = L1_103(L2_104)
        L3_105 = A0_102
        L2_104 = A0_102.getDynamicObject
        L2_104 = L2_104(L3_105)
        L3_105 = L2_104.setName
        L3_105(L2_104, RES_BOX_DYN_NAME_PREFIX .. L1_103)
        L3_105 = createGameObject2
        L3_105 = L3_105("Node")
        L3_105:setName("locator2_" .. L1_103 .. "_break_pos")
        L2_104:appendChild(L3_105)
        L3_105:try_init()
        L3_105:waitForReady()
        L3_105:try_start()
        _resource_box_tbl[L3_96][L8_101].break_pos_node = L3_105
      end)
      _resource_box_tbl[L3_96][L8_101].hdl:setEventListener("broken", function(A0_106)
        local L1_107, L2_108
        L1_107 = _resource_box_tbl
        L2_108 = L3_96
        L1_107 = L1_107[L2_108]
        L2_108 = L8_101
        L1_107 = L1_107[L2_108]
        L1_107 = L1_107.break_pos_node
        if L1_107 ~= nil then
          L2_108 = L1_107.getWorldPos
          L2_108 = L2_108(L1_107)
        elseif not L2_108 then
          L2_108 = A0_106.getWorldPos
          L2_108 = L2_108(A0_106)
        end
        if _resource_box_tbl[L3_96][L8_101].break_pos_node ~= nil then
          _resource_box_tbl[L3_96][L8_101].break_pos_node:try_term()
          _resource_box_tbl[L3_96][L8_101].break_pos_node = nil
        end
        for _FORV_6_, _FORV_7_ in pairs(_patrol_soldier_tbl) do
          _patrol_soldier_tbl[_FORV_6_]:setNoticeSound(L2_108)
        end
        if _resource_box_tbl[L3_96][L8_101].grab == true and _resource_box_tbl[L3_96][L8_101].is_scored == false and RES_BOX_NG_CAP_DISTANCE <= Fn_getDistanceToPlayer(L2_108) then
          _res_throw_failed_count = _res_throw_failed_count + 1
          if RES_BOX_NG_CAP_COUNT <= _res_throw_failed_count and (_res_throw_failed_cap_wait_task == nil or _res_throw_failed_cap_wait_task:isRunning() == false) then
            CaptionViewPriority("sm07_09054", CAPTION_PRIORITY_RES_BOX_NG)
            _res_throw_failed_cap_wait_task = invokeTask(waitSeconds, 5)
            _res_throw_failed_count = 0
          end
        end
      end)
      break
    end
    break
  end
end
function clearResBoxEventListenert()
  local L0_109, L1_110, L2_111, L3_112, L4_113
  for L3_112, L4_113 in L0_109(L1_110) do
    for _FORV_8_, _FORV_9_ in ipairs(L4_113) do
      _resource_box_tbl[L3_112][_FORV_8_].hdl:setEventListener("dynamic", nil)
      _resource_box_tbl[L3_112][_FORV_8_].hdl:setEventListener("broken", nil)
    end
  end
end
function invokeTutorialTask()
  local L0_114, L1_115, L2_116, L3_117
  L0_114 = 11
  function L1_115()
    local L0_118
    L0_118 = false
    for _FORV_4_, _FORV_5_ in ipairs(_resource_box_tbl[L0_114]) do
      if _FORV_5_.put_sensor == true and _FORV_5_.hdl:isBroken() == false then
        L0_118 = true
        break
      end
    end
    return L0_118
  end
  function L2_116(A0_119)
    local L1_120
    L1_120 = false
    for _FORV_5_, _FORV_6_ in ipairs(A0_119) do
      if _resource_box_tbl[L0_114][_FORV_6_].hdl:isBroken() == false and _resource_box_tbl[L0_114][_FORV_6_].hdl:isGrabbed() == true then
        L1_120 = true
        break
      end
    end
    return L1_120
  end
  L3_117 = {}
  L3_117.timer_task = nil
  function L3_117.update(A0_121)
    local L1_122, L2_123, L3_124, L4_125, L5_126, L6_127
    _is_out_of_tutorial_sensor = false
    L1_122 = Fn_pcSensorOn
    L2_123 = "pccubesensor2_tutorial_out_01"
    L1_122(L2_123)
    _is_in_tutorial_grab_sensor = false
    L1_122 = Fn_pcSensorOn
    L2_123 = "pccubesensor2_tutorial_grab_01"
    L1_122(L2_123)
    L1_122 = true
    L2_123 = invokeTask
    L2_123 = L2_123(L3_124, L4_125)
    A0_121.timer_task = L2_123
    while true do
      L2_123 = A0_121.timer_task
      L2_123 = L2_123.isRunning
      L2_123 = L2_123(L3_124)
      if L2_123 then
        L2_123 = wait
        L2_123()
        L2_123 = _is_out_of_tutorial_sensor
        if L2_123 ~= true then
          L2_123 = L1_115
          L2_123 = L2_123()
          L1_122 = L2_123
        end
      end
      if L1_122 ~= false then
      end
    end
    L2_123 = A0_121.timer_task
    L2_123 = L2_123.abort
    L2_123(L3_124)
    A0_121.timer_task = nil
    L2_123 = _is_out_of_tutorial_sensor
    if L2_123 == true then
      L2_123 = Fn_pcSensorOff
      L2_123(L3_124)
      _is_in_tutorial_grab_sensor = false
      return
    elseif L1_122 == false then
      L2_123 = Fn_pcSensorOff
      L2_123(L3_124)
      _is_in_tutorial_grab_sensor = false
      return
    end
    L2_123 = Fn_naviSet
    L6_127 = L3_124(L4_125, L5_126)
    L2_123(L3_124, L4_125, L5_126, L6_127, L3_124(L4_125, L5_126))
    L2_123 = {}
    repeat
      L3_124()
      if L3_124 ~= true then
        L1_122 = L3_124
        if L1_122 ~= false then
          if L3_124 == true then
            if L3_124 == nil then
              L3_124(L4_125)
            end
          elseif L3_124 ~= nil then
            L3_124()
          end
          for L6_127, _FORV_7_ in L3_124(L4_125) do
            if _FORV_7_.hdl:isGrabbed() == true then
              table.insert(L2_123, L6_127)
            end
          end
        end
      end
    until L3_124 > 0
    L3_124()
    L3_124(L4_125)
    _is_in_tutorial_grab_sensor = false
    L3_124()
    if L3_124 == true then
      return
    elseif L1_122 == false then
      return
    end
    L3_124(L4_125)
    _is_out_of_tutorial_sensor = false
    while L5_126 < 5 do
      L6_127 = wait
      L6_127()
      L6_127 = _res_throw_out_point
      if not (L3_124 < L6_127) then
        L6_127 = L2_116
        L6_127 = L6_127(L2_123)
      end
      if L4_125 ~= false then
      end
    end
    L6_127 = _res_throw_out_point
    if L3_124 >= L6_127 then
      L6_127 = Fn_captionView
      L6_127("ic_tutorial_00420", 0)
      while true do
        L6_127 = Player
        L6_127 = L6_127.getGrabStatus
        L6_127 = L6_127(L6_127)
        if L6_127 == Player.kGrabStatus_Holding then
          L6_127 = _res_throw_out_point
        end
        if L3_124 >= L6_127 then
          L6_127 = wait
          L6_127()
        end
      end
      L6_127 = Fn_captionViewEnd
      L6_127()
      while true do
        L6_127 = _res_throw_out_point
        if L3_124 >= L6_127 then
          L6_127 = wait
          L6_127()
          L6_127 = L2_116
          L6_127 = L6_127(L2_123)
        end
        if L4_125 ~= false then
        end
      end
    end
    L6_127 = _res_throw_out_point
    if L3_124 >= L6_127 then
      L6_127 = Fn_captionView
      L6_127("sm07_09055")
      return
    end
    L6_127 = Fn_captionViewWait
    L6_127("sm07_09023")
    L6_127 = Sound
    L6_127 = L6_127.setGlobalVariable
    L6_127(L6_127, "voice_type", "radio")
    L6_127 = Sound
    L6_127 = L6_127.playSE
    L6_127(L6_127, "m10_920")
    L6_127 = invokeTask
    L6_127(function()
      waitSeconds(1)
      Sound:setGlobalVariable("voice_type", "normal")
    end)
    L6_127 = Fn_captionViewWait
    L6_127("sm07_09024")
  end
  function L3_117.destructor(A0_128)
    Fn_captionViewEnd()
    Fn_tutorialCaptionKill()
    Fn_naviKill()
    if A0_128.timer_task ~= nil then
      A0_128.timer_task:abort()
      A0_128.timer_task = nil
    end
    Fn_pcSensorOff("pccubesensor2_tutorial_out_01")
    _is_out_of_tutorial_sensor = false
  end
  return RAC_InvokeTaskWithDestractor(L3_117.update, L3_117.destructor, L3_117)
end
function restorePartResBox(A0_129)
  local L1_130, L2_131, L3_132, L4_133, L5_134, L6_135
  L1_130 = true
  for L5_134, L6_135 in L2_131(L3_132) do
    if L5_134 ~= A0_129 then
      for _FORV_11_, _FORV_12_ in ipairs(L6_135) do
        for _FORV_16_, _FORV_17_ in ipairs(_resource_box_tbl[_FORV_12_]) do
        end
      end
      if 0 + 1 > math.ceil(#L6_135 * RES_BOS_RESTORE_RATE) then
        L1_130 = false
        break
      end
    end
  end
  if L1_130 == true then
    for L5_134, L6_135 in L2_131(L3_132) do
      if L5_134 ~= A0_129 then
        for _FORV_10_, _FORV_11_ in ipairs(L6_135) do
          for _FORV_15_, _FORV_16_ in ipairs(_resource_box_tbl[_FORV_11_]) do
            _resource_box_tbl[_FORV_11_][_FORV_15_].hdl:requestRestoreForce()
            _resource_box_tbl[_FORV_11_][_FORV_15_].put_sensor = true
            _resource_box_tbl[_FORV_11_][_FORV_15_].grab = false
            _resource_box_tbl[_FORV_11_][_FORV_15_].is_scored = false
          end
        end
      end
    end
  end
end
function CaptionViewPriority(A0_136, A1_137)
  if HUD:captionGetTextId() then
  else
    _captionPriority = CAPTION_PRIORITY_UNKNOWN
  end
  if false then
    if _captionPriorityTask then
      _captionPriorityTask:abort()
      _captionPriorityTask = nil
    end
    _captionPriorityTask = invokeTask(function()
      _captionPriority = A1_137
      Fn_captionView(A0_136)
      while HUD:captionGetTextId(A0_136) ~= nil do
        wait()
      end
      _captionPriority = CAPTION_PRIORITY_UNKNOWN
    end)
  end
end
function setResBoxPutSensor(A0_138, A1_139, A2_140)
  if _resource_box_tbl[A0_138] ~= nil and string.match(A1_139, RES_BOX_DYN_NAME_PREFIX .. "(.+)") ~= nil then
    for _FORV_7_, _FORV_8_ in ipairs(_resource_box_tbl[A0_138]) do
      if string.match(A1_139, RES_BOX_DYN_NAME_PREFIX .. "(.+)") == _FORV_8_.name then
        _resource_box_tbl[A0_138][_FORV_7_].put_sensor = A2_140
        break
      end
    end
  end
end
function cubesensor2_throw_out_01_OnEnter(A0_141, A1_142)
end
function cubesensor2_throw_out_01_OnLeave(A0_143, A1_144)
  local L2_145, L3_146, L4_147, L5_148, L6_149, L7_150, L8_151, L9_152, L10_153
  L3_146 = A1_144
  L2_145 = A1_144.getDynamicObject
  L2_145 = L2_145(L3_146)
  if L2_145 == nil then
    L4_147 = A1_144
    L3_146 = A1_144.isGrabbed
    L3_146 = L3_146(L4_147)
    if L3_146 == true then
      L4_147 = A1_144
      L3_146 = A1_144.isBroken
      L3_146 = L3_146(L4_147)
      if L3_146 == false then
        L4_147 = A1_144
        L3_146 = A1_144.isRunning
        L3_146 = L3_146(L4_147)
        if L3_146 == true then
          L4_147 = A1_144
          L3_146 = A1_144.getName
          L3_146 = L3_146(L4_147)
          L4_147, L5_148 = nil, nil
          if L3_146 ~= nil then
            L3_146 = L6_149
            if L3_146 ~= nil then
              for L9_152, L10_153 in L6_149(L7_150) do
                for _FORV_14_, _FORV_15_ in ipairs(L10_153) do
                  if L3_146 == _FORV_15_.name then
                    L4_147 = L9_152
                    L5_148 = _FORV_14_
                    break
                  end
                end
                if L4_147 == nil or L5_148 == nil then
                end
              end
            end
          end
          if L4_147 ~= nil and L5_148 ~= nil then
            _res_throw_out_point = L7_150
            L7_150.is_scored = true
            _res_throw_failed_count = 0
            L10_153 = 1
            L7_150(L8_151, L9_152, L10_153)
            for L10_153 = #L7_150, _point_cap_idx, -1 do
              if POINT_CAP_DATA_TBL[L10_153].point <= _res_throw_out_point then
                Sound:setGlobalVariable("voice_type", "radio")
                Sound:playSE("m10_920")
                invokeTask(function()
                  waitSeconds(1)
                  Sound:setGlobalVariable("voice_type", "normal")
                end)
                CaptionViewPriority(POINT_CAP_DATA_TBL[L10_153].caption, CAPTION_PRIORITY_RES_BOX_OK)
                _point_cap_idx = L10_153 + 1
                break
              end
            end
          else
            L6_149(L7_150)
            if L6_149 ~= nil then
            elseif L6_149 == false then
              if L6_149 == false then
                L7_150.se = "m10_932b"
                L7_150.caption = "sm07_09025"
                L8_151.se = "m10_914a"
                L8_151.caption = "sm07_09026"
                L9_152.se = "m10_914c"
                L9_152.caption = "sm07_09027"
                L10_153 = "voice_type"
                L8_151(L9_152, L10_153, "radio")
                L10_153 = L6_149[L7_150]
                L10_153 = L10_153.se
                L8_151(L9_152, L10_153)
                L8_151(L9_152)
                L10_153 = CAPTION_PRIORITY_ETC
                L8_151(L9_152, L10_153)
                L10_153 = 5
                _hundred_legs_caption_wait_task = L8_151
              end
            end
          end
          if A1_144 then
            if L7_150 then
            else
            end
          end
          if L8_151 then
            L10_153 = L8_151
            if L9_152 then
            else
            end
          end
          L10_153 = "leave: "
          L10_153 = L10_153 .. L6_149 .. " parent: " .. L7_150
          L9_152(L10_153)
        end
      end
    end
  end
end
function cubesensor2_lose_res_box_01_OnEnter(A0_154, A1_155)
  local L2_156
  L2_156 = A1_155.getName
  L2_156 = L2_156(A1_155)
  if L2_156 ~= nil then
    setResBoxPutSensor(1, L2_156, true)
  end
end
function cubesensor2_lose_res_box_01_OnLeave(A0_157, A1_158)
  local L2_159
  L2_159 = A1_158.getName
  L2_159 = L2_159(A1_158)
  if L2_159 ~= nil then
    setResBoxPutSensor(1, L2_159, false)
  end
end
function cubesensor2_lose_res_box_02_OnEnter(A0_160, A1_161)
  local L2_162
  L2_162 = A1_161.getName
  L2_162 = L2_162(A1_161)
  if L2_162 ~= nil then
    setResBoxPutSensor(2, L2_162, true)
  end
end
function cubesensor2_lose_res_box_02_OnLeave(A0_163, A1_164)
  local L2_165
  L2_165 = A1_164.getName
  L2_165 = L2_165(A1_164)
  if L2_165 ~= nil then
    setResBoxPutSensor(2, L2_165, false)
  end
end
function cubesensor2_lose_res_box_03_OnEnter(A0_166, A1_167)
  local L2_168
  L2_168 = A1_167.getName
  L2_168 = L2_168(A1_167)
  if L2_168 ~= nil then
    setResBoxPutSensor(3, L2_168, true)
  end
end
function cubesensor2_lose_res_box_03_OnLeave(A0_169, A1_170)
  local L2_171
  L2_171 = A1_170.getName
  L2_171 = L2_171(A1_170)
  if L2_171 ~= nil then
    setResBoxPutSensor(3, L2_171, false)
  end
end
function cubesensor2_lose_res_box_04_OnEnter(A0_172, A1_173)
  local L2_174
  L2_174 = A1_173.getName
  L2_174 = L2_174(A1_173)
  if L2_174 ~= nil then
    setResBoxPutSensor(4, L2_174, true)
  end
end
function cubesensor2_lose_res_box_04_OnLeave(A0_175, A1_176)
  local L2_177
  L2_177 = A1_176.getName
  L2_177 = L2_177(A1_176)
  if L2_177 ~= nil then
    setResBoxPutSensor(4, L2_177, false)
  end
end
function cubesensor2_lose_res_box_05_OnEnter(A0_178, A1_179)
  local L2_180
  L2_180 = A1_179.getName
  L2_180 = L2_180(A1_179)
  if L2_180 ~= nil then
    setResBoxPutSensor(5, L2_180, true)
  end
end
function cubesensor2_lose_res_box_05_OnLeave(A0_181, A1_182)
  local L2_183
  L2_183 = A1_182.getName
  L2_183 = L2_183(A1_182)
  if L2_183 ~= nil then
    setResBoxPutSensor(5, L2_183, false)
  end
end
function cubesensor2_lose_res_box_06_OnEnter(A0_184, A1_185)
  local L2_186
  L2_186 = A1_185.getName
  L2_186 = L2_186(A1_185)
  if L2_186 ~= nil then
    setResBoxPutSensor(6, L2_186, true)
  end
end
function cubesensor2_lose_res_box_06_OnLeave(A0_187, A1_188)
  local L2_189
  L2_189 = A1_188.getName
  L2_189 = L2_189(A1_188)
  if L2_189 ~= nil then
    setResBoxPutSensor(6, L2_189, false)
  end
end
function cubesensor2_lose_res_box_07_OnEnter(A0_190, A1_191)
  local L2_192
  L2_192 = A1_191.getName
  L2_192 = L2_192(A1_191)
  if L2_192 ~= nil then
    setResBoxPutSensor(7, L2_192, true)
  end
end
function cubesensor2_lose_res_box_07_OnLeave(A0_193, A1_194)
  local L2_195
  L2_195 = A1_194.getName
  L2_195 = L2_195(A1_194)
  if L2_195 ~= nil then
    setResBoxPutSensor(7, L2_195, false)
  end
end
function cubesensor2_lose_res_box_08_OnEnter(A0_196, A1_197)
  local L2_198
  L2_198 = A1_197.getName
  L2_198 = L2_198(A1_197)
  if L2_198 ~= nil then
    setResBoxPutSensor(8, L2_198, true)
  end
end
function cubesensor2_lose_res_box_08_OnLeave(A0_199, A1_200)
  local L2_201
  L2_201 = A1_200.getName
  L2_201 = L2_201(A1_200)
  if L2_201 ~= nil then
    setResBoxPutSensor(8, L2_201, false)
  end
end
function cubesensor2_lose_res_box_09_OnEnter(A0_202, A1_203)
  local L2_204
  L2_204 = A1_203.getName
  L2_204 = L2_204(A1_203)
  if L2_204 ~= nil then
    setResBoxPutSensor(9, L2_204, true)
  end
end
function cubesensor2_lose_res_box_09_OnLeave(A0_205, A1_206)
  local L2_207
  L2_207 = A1_206.getName
  L2_207 = L2_207(A1_206)
  if L2_207 ~= nil then
    setResBoxPutSensor(9, L2_207, false)
  end
end
function cubesensor2_lose_res_box_10_OnEnter(A0_208, A1_209)
  local L2_210
  L2_210 = A1_209.getName
  L2_210 = L2_210(A1_209)
  if L2_210 ~= nil then
    setResBoxPutSensor(10, L2_210, true)
  end
end
function cubesensor2_lose_res_box_10_OnLeave(A0_211, A1_212)
  local L2_213
  L2_213 = A1_212.getName
  L2_213 = L2_213(A1_212)
  if L2_213 ~= nil then
    setResBoxPutSensor(10, L2_213, false)
  end
end
function cubesensor2_lose_res_box_11_OnEnter(A0_214, A1_215)
  local L2_216
  L2_216 = A1_215.getName
  L2_216 = L2_216(A1_215)
  if L2_216 ~= nil then
    setResBoxPutSensor(11, L2_216, true)
  end
end
function cubesensor2_lose_res_box_11_OnLeave(A0_217, A1_218)
  local L2_219
  L2_219 = A1_218.getName
  L2_219 = L2_219(A1_218)
  if L2_219 ~= nil then
    setResBoxPutSensor(11, L2_219, false)
  end
end
function cubesensor2_lose_res_box_12_OnEnter(A0_220, A1_221)
  local L2_222
  L2_222 = A1_221.getName
  L2_222 = L2_222(A1_221)
  if L2_222 ~= nil then
    setResBoxPutSensor(12, L2_222, true)
  end
end
function cubesensor2_lose_res_box_12_OnLeave(A0_223, A1_224)
  local L2_225
  L2_225 = A1_224.getName
  L2_225 = L2_225(A1_224)
  if L2_225 ~= nil then
    setResBoxPutSensor(12, L2_225, false)
  end
end
function cubesensor2_lose_res_box_13_OnEnter(A0_226, A1_227)
  local L2_228
  L2_228 = A1_227.getName
  L2_228 = L2_228(A1_227)
  if L2_228 ~= nil then
    setResBoxPutSensor(13, L2_228, true)
  end
end
function cubesensor2_lose_res_box_13_OnLeave(A0_229, A1_230)
  local L2_231
  L2_231 = A1_230.getName
  L2_231 = L2_231(A1_230)
  if L2_231 ~= nil then
    setResBoxPutSensor(13, L2_231, false)
  end
end
function cubesensor2_lose_res_box_14_OnEnter(A0_232, A1_233)
  local L2_234
  L2_234 = A1_233.getName
  L2_234 = L2_234(A1_233)
  if L2_234 ~= nil then
    setResBoxPutSensor(14, L2_234, true)
  end
end
function cubesensor2_lose_res_box_14_OnLeave(A0_235, A1_236)
  local L2_237
  L2_237 = A1_236.getName
  L2_237 = L2_237(A1_236)
  if L2_237 ~= nil then
    setResBoxPutSensor(14, L2_237, false)
  end
end
function cubesensor2_lose_res_box_15_OnEnter(A0_238, A1_239)
  local L2_240
  L2_240 = A1_239.getName
  L2_240 = L2_240(A1_239)
  if L2_240 ~= nil then
    setResBoxPutSensor(15, L2_240, true)
  end
end
function cubesensor2_lose_res_box_15_OnLeave(A0_241, A1_242)
  local L2_243
  L2_243 = A1_242.getName
  L2_243 = L2_243(A1_242)
  if L2_243 ~= nil then
    setResBoxPutSensor(15, L2_243, false)
  end
end
function cubesensor2_lose_res_box_16_OnEnter(A0_244, A1_245)
  local L2_246
  L2_246 = A1_245.getName
  L2_246 = L2_246(A1_245)
  if L2_246 ~= nil then
    setResBoxPutSensor(16, L2_246, true)
  end
end
function cubesensor2_lose_res_box_16_OnLeave(A0_247, A1_248)
  local L2_249
  L2_249 = A1_248.getName
  L2_249 = L2_249(A1_248)
  if L2_249 ~= nil then
    setResBoxPutSensor(16, L2_249, false)
  end
end
function cubesensor2_lose_res_box_17_OnEnter(A0_250, A1_251)
  local L2_252
  L2_252 = A1_251.getName
  L2_252 = L2_252(A1_251)
  if L2_252 ~= nil then
    setResBoxPutSensor(17, L2_252, true)
  end
end
function cubesensor2_lose_res_box_17_OnLeave(A0_253, A1_254)
  local L2_255
  L2_255 = A1_254.getName
  L2_255 = L2_255(A1_254)
  if L2_255 ~= nil then
    setResBoxPutSensor(17, L2_255, false)
  end
end
function cubesensor2_lose_res_box_18_OnEnter(A0_256, A1_257)
  local L2_258
  L2_258 = A1_257.getName
  L2_258 = L2_258(A1_257)
  if L2_258 ~= nil then
    setResBoxPutSensor(18, L2_258, true)
  end
end
function cubesensor2_lose_res_box_18_OnLeave(A0_259, A1_260)
  local L2_261
  L2_261 = A1_260.getName
  L2_261 = L2_261(A1_260)
  if L2_261 ~= nil then
    setResBoxPutSensor(18, L2_261, false)
  end
end
function cubesensor2_lose_res_box_19_OnEnter(A0_262, A1_263)
  local L2_264
  L2_264 = A1_263.getName
  L2_264 = L2_264(A1_263)
  if L2_264 ~= nil then
    setResBoxPutSensor(19, L2_264, true)
  end
end
function cubesensor2_lose_res_box_19_OnLeave(A0_265, A1_266)
  local L2_267
  L2_267 = A1_266.getName
  L2_267 = L2_267(A1_266)
  if L2_267 ~= nil then
    setResBoxPutSensor(19, L2_267, false)
  end
end
function cubesensor2_lose_res_box_20_OnEnter(A0_268, A1_269)
  local L2_270
  L2_270 = A1_269.getName
  L2_270 = L2_270(A1_269)
  if L2_270 ~= nil then
    setResBoxPutSensor(20, L2_270, true)
  end
end
function cubesensor2_lose_res_box_20_OnLeave(A0_271, A1_272)
  local L2_273
  L2_273 = A1_272.getName
  L2_273 = L2_273(A1_272)
  if L2_273 ~= nil then
    setResBoxPutSensor(20, L2_273, false)
  end
end
function cubesensor2_lose_res_box_21_OnEnter(A0_274, A1_275)
  local L2_276
  L2_276 = A1_275.getName
  L2_276 = L2_276(A1_275)
  if L2_276 ~= nil then
    setResBoxPutSensor(21, L2_276, true)
  end
end
function cubesensor2_lose_res_box_21_OnLeave(A0_277, A1_278)
  local L2_279
  L2_279 = A1_278.getName
  L2_279 = L2_279(A1_278)
  if L2_279 ~= nil then
    setResBoxPutSensor(21, L2_279, false)
  end
end
function cubesensor2_lose_res_box_22_OnEnter(A0_280, A1_281)
  local L2_282
  L2_282 = A1_281.getName
  L2_282 = L2_282(A1_281)
  if L2_282 ~= nil then
    setResBoxPutSensor(22, L2_282, true)
  end
end
function cubesensor2_lose_res_box_22_OnLeave(A0_283, A1_284)
  local L2_285
  L2_285 = A1_284.getName
  L2_285 = L2_285(A1_284)
  if L2_285 ~= nil then
    setResBoxPutSensor(22, L2_285, false)
  end
end
function cubesensor2_lose_res_box_23_OnEnter(A0_286, A1_287)
  local L2_288
  L2_288 = A1_287.getName
  L2_288 = L2_288(A1_287)
  if L2_288 ~= nil then
    setResBoxPutSensor(23, L2_288, true)
  end
end
function cubesensor2_lose_res_box_23_OnLeave(A0_289, A1_290)
  local L2_291
  L2_291 = A1_290.getName
  L2_291 = L2_291(A1_290)
  if L2_291 ~= nil then
    setResBoxPutSensor(23, L2_291, false)
  end
end
function cubesensor2_lose_res_box_24_OnEnter(A0_292, A1_293)
  local L2_294
  L2_294 = A1_293.getName
  L2_294 = L2_294(A1_293)
  if L2_294 ~= nil then
    setResBoxPutSensor(24, L2_294, true)
  end
end
function cubesensor2_lose_res_box_24_OnLeave(A0_295, A1_296)
  local L2_297
  L2_297 = A1_296.getName
  L2_297 = L2_297(A1_296)
  if L2_297 ~= nil then
    setResBoxPutSensor(24, L2_297, false)
  end
end
function cubesensor2_lose_res_box_25_OnEnter(A0_298, A1_299)
  local L2_300
  L2_300 = A1_299.getName
  L2_300 = L2_300(A1_299)
  if L2_300 ~= nil then
    setResBoxPutSensor(25, L2_300, true)
  end
end
function cubesensor2_lose_res_box_25_OnLeave(A0_301, A1_302)
  local L2_303
  L2_303 = A1_302.getName
  L2_303 = L2_303(A1_302)
  if L2_303 ~= nil then
    setResBoxPutSensor(25, L2_303, false)
  end
end
function pccubesensor2_out_01_OnEnter()
  local L0_304, L1_305
end
function pccubesensor2_out_01_OnLeave()
  local L0_306, L1_307
end
function pccubesensor2_out_02_OnEnter()
  local L0_308, L1_309
  _is_out_of_range = false
end
function pccubesensor2_out_02_OnLeave()
  local L0_310, L1_311
  _is_out_of_range = true
end
function pccubesensormulti2_force_find_01_OnEnter()
  local L0_312, L1_313
  _is_in_bomb_sensor = true
end
function pccubesensormulti2_force_find_01_OnLeave()
  local L0_314, L1_315
  _is_in_bomb_sensor = false
end
function pccubesensor2_tutorial_grab_01_OnEnter()
  local L0_316, L1_317
  _is_in_tutorial_grab_sensor = true
end
function pccubesensor2_tutorial_grab_01_OnLeave()
  local L0_318, L1_319
  _is_in_tutorial_grab_sensor = false
end
function pccubesensor2_tutorial_out_01_OnEnter()
  local L0_320, L1_321
  _is_out_of_tutorial_sensor = false
end
function pccubesensor2_tutorial_out_01_OnLeave()
  local L0_322, L1_323
  _is_out_of_tutorial_sensor = true
end
function pccubesensor2_restore_res_box_01_OnEnter()
  restorePartResBox(1)
end
function pccubesensor2_restore_res_box_01_OnLeave()
  local L0_324, L1_325
end
function pccubesensor2_restore_res_box_02_OnEnter()
  restorePartResBox(2)
end
function pccubesensor2_restore_res_box_02_OnLeave()
  local L0_326, L1_327
end
function pccubesensor2_restore_res_box_03_OnEnter()
  restorePartResBox(3)
end
function pccubesensor2_restore_res_box_03_OnLeave()
  local L0_328, L1_329
end
function pccubesensor2_restore_res_box_04_OnEnter()
  restorePartResBox(4)
end
function pccubesensor2_restore_res_box_04_OnLeave()
  local L0_330, L1_331
end
function isEndInitC()
  return _phase == PHASE_MAIN_C_INIT_END
end
function startC()
  if isEndInitC() then
    _phase = PHASE_MAIN_C
  end
end
function isEndC()
  return _phase == PHASE_MAIN_C_END
end
function containerSetActive(A0_332, A1_333, A2_334)
  _container_tbl[A0_332][A1_333]:setActive(A2_334)
end
function resBoxSetActive(A0_335, A1_336, A2_337)
  _resource_box_tbl[A0_335][A1_336].hdl:setActive(A2_337)
  if _resource_box_tbl[A0_335][A1_336].hdl:getDynamicObject() ~= nil then
    _resource_box_tbl[A0_335][A1_336].hdl:getDynamicObject():setActive(A2_337)
  end
end
function containerSetVisibleBlockEnable(A0_338)
  local L1_339, L2_340, L3_341, L4_342, L5_343
  for L4_342, L5_343 in L1_339(L2_340) do
    for _FORV_9_, _FORV_10_ in ipairs(L5_343) do
      _container_tbl[L4_342][_FORV_9_]:setVisibleBlockEnable(A0_338)
    end
  end
end
function resBoxSetVisibleBlockEnable(A0_344)
  local L1_345, L2_346, L3_347, L4_348, L5_349
  for L4_348, L5_349 in L1_345(L2_346) do
    for _FORV_9_, _FORV_10_ in ipairs(L5_349) do
      _resource_box_tbl[L4_348][_FORV_9_].hdl:setVisibleBlockEnable(A0_344)
    end
  end
end
function getEscapeStartIdx()
  local L0_350, L1_351
  L0_350 = _escape_start_idx
  return L0_350
end
function sm07_findGameObject2(A0_352, A1_353)
  return findGameObject2(A0_352, A1_353)
end
function sm07_catwarp_permission(A0_354)
  local L1_355
  _catwarp_enable = A0_354
end
