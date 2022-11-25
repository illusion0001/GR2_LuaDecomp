dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm22_common.lua")
NPC_MAX = 10
NPC_MOVE_SPEED = 0.83
NPC_SPEED_PLUS = 0.2
NPC_CAP01 = 2
NPC_CAP02 = 5
NPC_CAP03 = 7
NPC_CAP01_MAX = 6
NPC_CAP02_MAX = 5
NPC_CAP03_MAX = 5
BATTLE_END_DIST = 20
ENEMY_NEAR_DIST01 = 16
ENEMY_NEAR_DIST02 = 6
ENEMY_FIND_DIST = 10
TARGET_DIST = 3
NPC_MOTION = {
  MOVE = 0,
  IN = 1,
  SIT = 2,
  OUT = 3
}
_puppet_tbl = {}
_hdl_tbl = {}
_warning_flag = false
_end_catwarp_warning_ = false
_npc_motion_sw = {}
_npc_flag = {
  dist = false,
  cap = false,
  OnEnter = false,
  OnLeave = false,
  sdemo = false,
  move_stop = false,
  target_near = false
}
_ENEMY_SPEC_TBL = {
  "enmgen2_root_init_01",
  "enmgen2_root_init_02",
  "enmgen2_root_init_03",
  "enmgen2_root_a_init_01",
  "enmgen2_root_b_init_01",
  "enmgen2_root_b_init_02",
  "enmgen2_root_b_init_03",
  "enmgen2_root_slope_01",
  "enmgen2_root_slope_02",
  "enmgen2_root_slope_03",
  "enmgen2_root_bridge_01_01",
  "enmgen2_root_bridge_01_02",
  "enmgen2_root_bridge_02",
  "enmgen2_root_water_fountain_01",
  "enmgen2_root_water_fountain_02",
  "enmgen2_root_cross_01_01",
  "enmgen2_root_cross_02",
  "enmgen2_root_cross_03",
  "enmgen2_root_circle_01",
  "enmgen2_root_circle_02",
  "enmgen2_root_circle_03",
  "enmgen2_root_circle_04",
  "enmgen2_root_stairs_01",
  "enmgen2_root_stairs_02",
  "enmgen2_root_stairs_03_01",
  "enmgen2_root_stairs_03_02",
  "enmgen2_root_finish_01"
}
_ENEMY_NAME_TBL = {
  "sm22_enemy_root_init_01_01",
  "sm22_enemy_root_init_01_02",
  "sm22_enemy_root_init_02_01",
  "sm22_enemy_root_init_02_02",
  "sm22_enemy_root_init_03_01",
  "sm22_enemy_root_init_03_02",
  "sm22_enemy_root_a_init_01_01",
  "sm22_enemy_root_b_init_01_01",
  "sm22_enemy_root_b_init_01_02",
  "sm22_enemy_root_b_init_02_01",
  "sm22_enemy_root_b_init_02_02",
  "sm22_enemy_root_b_init_03_01",
  "sm22_enemy_root_slope_01_01",
  "sm22_enemy_root_slope_02_01",
  "sm22_enemy_root_slope_03_01",
  "sm22_enemy_root_bridge_01_01_01",
  "sm22_enemy_root_bridge_01_02_01",
  "sm22_enemy_root_bridge_01_03",
  "sm22_enemy_root_bridge_01_04",
  "sm22_enemy_root_bridge_02_01",
  "sm22_enemy_root_water_fountain_01_01",
  "sm22_enemy_root_water_fountain_02_01",
  "sm22_enemy_root_cross_01_01",
  "sm22_enemy_root_cross_01_02",
  "sm22_enemy_root_cross_01_03",
  "sm22_enemy_root_cross_02_01",
  "sm22_enemy_root_cross_03_01",
  "sm22_enemy_root_cross_03_02",
  "sm22_enemy_root_circle_01_01",
  "sm22_enemy_root_circle_01_02",
  "sm22_enemy_root_circle_02_01",
  "sm22_enemy_root_circle_02_02",
  "sm22_enemy_root_circle_03_01",
  "sm22_enemy_root_circle_04_01",
  "sm22_enemy_root_stairs_01_01",
  "sm22_enemy_root_stairs_01_02",
  "sm22_enemy_root_stairs_02_01",
  "sm22_enemy_root_stairs_03_01_01",
  "sm22_enemy_root_stairs_03_02_01",
  "sm22_enemy_root_stairs_03_02_02",
  "sm22_enemy_root_finish_03_01",
  "sm22_enemy_root_finish_03_02",
  "sm22_enemy_root_finish_03_03"
}
_CITIZENS_ROOT_INIT = {
  {
    "locator2_root_init_01",
    "locator2_root_init_02"
  },
  {
    "locator2_root_init_03",
    "locator2_root_init_04"
  },
  {
    "locator2_root_init_05",
    "locator2_root_init_06"
  },
  {
    "locator2_root_init_07",
    "locator2_root_init_08",
    "locator2_root_init_09",
    "locator2_root_init_10",
    "locator2_root_init_11"
  }
}
_CITIZENS_ROOT_A_INIT = {
  {
    "locator2_root_a_init_01",
    "locator2_root_a_init_02",
    "locator2_root_a_init_03",
    "locator2_root_a_init_04",
    "locator2_root_a_init_05",
    "locator2_root_a_init_06",
    "locator2_root_a_init_07",
    "locator2_root_a_init_08",
    "locator2_root_a_init_09",
    "locator2_root_a_init_10"
  }
}
_CITIZENS_ROOT_A_A = {
  {
    "locator2_root_01_01",
    "locator2_root_01_02",
    "locator2_root_01_03",
    "locator2_root_01_04",
    "locator2_root_01_05",
    "locator2_root_01_06",
    "locator2_root_01_07"
  },
  {
    "locator2_root_01_08",
    "locator2_root_01_09",
    "locator2_root_01_10"
  }
}
_CITIZENS_ROOT_A_B = {
  {
    "locator2_root_02_01",
    "locator2_root_02_02"
  }
}
_CITIZENS_ROOT_A_C = {
  {
    "locator2_root_06_01",
    "locator2_root_06_02",
    "locator2_root_06_03",
    "locator2_root_06_04",
    "locator2_root_06_05",
    "locator2_root_06_06",
    "locator2_root_06_07",
    "locator2_root_06_08",
    "locator2_root_06_09",
    "locator2_root_06_10",
    "locator2_root_cross_04_01",
    "locator2_root_cross_04_02",
    "locator2_root_cross_05_01"
  }
}
_CITIZENS_ROOT_A_B_A = {
  {
    "locator2_root_03_01",
    "locator2_root_03_02",
    "locator2_root_03_03",
    "locator2_root_03_04",
    "locator2_root_03_05",
    "locator2_root_03_06",
    "locator2_root_cross_01_01",
    "locator2_root_cross_01_02",
    "locator2_root_cross_01_03"
  }
}
_CITIZENS_ROOT_A_B_B = {
  {
    "locator2_root_04_01",
    "locator2_root_04_02",
    "locator2_root_04_03",
    "locator2_root_04_04"
  }
}
_CITIZENS_ROOT_A_B_B_A = {
  {
    "locator2_root_05_01",
    "locator2_root_05_02",
    "locator2_root_cross_02_01",
    "locator2_root_cross_02_02",
    "locator2_root_goal_02_01"
  }
}
_CITIZENS_ROOT_A_B_B_B = {
  {
    "locator2_root_cross_03_01",
    "locator2_root_cross_03_02",
    "locator2_root_cross_04_01",
    "locator2_root_cross_04_02",
    "locator2_root_cross_05_01"
  }
}
_CITIZENS_ROOT_B_INIT = {
  {
    "locator2_root_b_init_01",
    "locator2_root_b_init_02",
    "locator2_root_b_init_03"
  },
  {
    "locator2_root_b_init_04",
    "locator2_root_b_init_05",
    "locator2_root_b_init_06",
    "locator2_root_b_init_07"
  },
  {
    "locator2_root_b_init_08",
    "locator2_root_b_init_09",
    "locator2_root_b_init_10",
    "locator2_root_b_init_11"
  }
}
_CITIZENS_ROOT_B_A = {
  {
    "locator2_root_cross_05_01_re",
    "locator2_root_cross_04_02",
    "locator2_root_cross_04_01",
    "locator2_root_cross_03_02",
    "locator2_root_cross_03_01",
    "locator2_root_07_01",
    "locator2_root_07_02",
    "locator2_root_07_03",
    "locator2_root_07_04",
    "locator2_root_cross_01_01",
    "locator2_root_cross_01_02",
    "locator2_root_cross_01_03"
  }
}
_CITIZENS_ROOT_B_B = {
  {
    "locator2_root_cross_05_01",
    "locator2_root_cross_06_01",
    "locator2_root_cross_06_02",
    "locator2_root_cross_06_03",
    "locator2_root_cross_02_01",
    "locator2_root_cross_02_02"
  }
}
_CITIZENS_ROOT_GOAL_01 = {
  {
    "locator2_root_goal_01_01",
    "locator2_root_goal_01_02",
    "locator2_root_goal_01_03",
    "locator2_root_goal_01_04",
    "locator2_root_goal_01_05",
    "locator2_root_goal_01_06",
    "locator2_root_goal_01_07",
    "locator2_root_goal_01_08"
  },
  {
    "locator2_root_goal_01_09",
    "locator2_root_goal_01_10",
    "locator2_root_goal_01_11",
    "locator2_root_goal_01_12",
    "locator2_root_goal_01_13",
    "locator2_root_goal_01_14",
    "locator2_root_goal_01_15"
  }
}
_CITIZENS_ROOT_GOAL_02 = {
  {
    "locator2_root_goal_02_02",
    "locator2_root_goal_02_03",
    "locator2_root_goal_02_04",
    "locator2_root_goal_02_05",
    "locator2_root_goal_02_06",
    "locator2_root_goal_02_07",
    "locator2_root_goal_02_08",
    "locator2_root_goal_02_09"
  },
  {
    "locator2_root_goal_02_10",
    "locator2_root_goal_02_11",
    "locator2_root_goal_02_12",
    "locator2_root_goal_02_13"
  }
}
_CITIZENS_ROOT_GOAL_03 = {
  {
    "locator2_root_goal_03_01",
    "locator2_root_goal_03_02",
    "locator2_root_goal_03_03",
    "locator2_root_goal_03_04",
    "locator2_root_goal_03_05",
    "locator2_root_goal_03_06",
    "locator2_root_goal_03_07",
    "locator2_root_goal_03_08"
  },
  {
    "locator2_root_goal_03_09",
    "locator2_root_goal_03_10",
    "locator2_root_goal_03_11",
    "locator2_root_goal_03_12",
    "locator2_root_goal_03_13",
    "locator2_root_goal_03_14",
    "locator2_root_goal_03_15",
    "locator2_root_goal_03_16"
  },
  {
    "locator2_root_goal_03_17",
    "locator2_root_goal_03_18",
    "locator2_root_goal_03_19",
    "locator2_root_goal_03_20"
  }
}
_CITIZENS_FORMATION_TBL = {
  changeCatWarpPoint = {
    {
      "locator2_catwarp_point"
    }
  },
  formation_a = {
    {
      "locator2_follow_a_01"
    },
    {
      "locator2_follow_a_02"
    },
    {
      "locator2_follow_a_03"
    },
    {
      "locator2_follow_a_04"
    },
    {
      "locator2_follow_a_05"
    },
    {
      "locator2_follow_a_06"
    },
    {
      "locator2_follow_a_07"
    },
    {
      "locator2_follow_a_08"
    },
    {
      "locator2_follow_a_09"
    }
  },
  formation_b = {
    {
      "locator2_follow_b_01"
    },
    {
      "locator2_follow_b_02"
    },
    {
      "locator2_follow_b_03"
    },
    {
      "locator2_follow_b_04"
    },
    {
      "locator2_follow_b_05"
    },
    {
      "locator2_follow_b_06"
    },
    {
      "locator2_follow_b_07"
    },
    {
      "locator2_follow_b_08"
    },
    {
      "locator2_follow_b_09"
    }
  },
  formation_c = {
    {
      "locator2_follow_c_01"
    },
    {
      "locator2_follow_c_02"
    },
    {
      "locator2_follow_c_03"
    },
    {
      "locator2_follow_c_04"
    },
    {
      "locator2_follow_c_05"
    },
    {
      "locator2_follow_c_06"
    },
    {
      "locator2_follow_c_07"
    },
    {
      "locator2_follow_c_08"
    },
    {
      "locator2_follow_c_09"
    }
  }
}
_ROOT_TBL = {
  {
    dead_group = "enmgen2_root_init_01",
    move_tbl = _CITIZENS_ROOT_INIT[2],
    spawn_group = {
      "enmgen2_root_init_02"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    recast = true,
    retry_pos = "locator2_root_init_03_retry"
  },
  {
    dead_group = "enmgen2_root_init_02",
    move_tbl = _CITIZENS_ROOT_INIT[3],
    spawn_group = {
      "enmgen2_root_init_03"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_init_05_retry"
  },
  {
    dead_group = "enmgen2_root_init_03",
    move_tbl = _CITIZENS_ROOT_INIT[4],
    spawn_group = {
      "enmgen2_root_a_init_01",
      "enmgen2_root_b_init_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_init_07_retry"
  },
  {
    dead_group = "enmgen2_root_a_init_01",
    move_tbl = _CITIZENS_ROOT_A_INIT[1],
    spawn_group = {
      "enmgen2_root_slope_01",
      "enmgen2_root_slope_02",
      "enmgen2_root_slope_03"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    recast = true,
    navimesh = false,
    retry_pos = "locator2_root_a_init_01_retry"
  },
  {
    dead_group = "enmgen2_root_slope_01",
    move_tbl = _CITIZENS_ROOT_A_A[1],
    spawn_group = {
      "enmgen2_root_bridge_01_01",
      "enmgen2_root_bridge_01_02"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    navimesh = true,
    retry_pos = "locator2_root_01_01_retry"
  },
  {
    dead_group = "enmgen2_root_bridge_01_01",
    move_tbl = _CITIZENS_ROOT_A_A[2],
    spawn_group = {
      "enmgen2_root_cross_01_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    recast = false,
    retry_pos = "locator2_root_01_08_retry"
  },
  {
    dead_group = "enmgen2_root_cross_01_01",
    move_tbl = _CITIZENS_ROOT_GOAL_01[1],
    spawn_group = {
      "enmgen2_root_stairs_01",
      "enmgen2_root_stairs_02"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    recast = false,
    retry_pos = "locator2_root_goal_01_01_retry"
  },
  {
    dead_group = "enmgen2_root_stairs_02",
    move_tbl = _CITIZENS_ROOT_GOAL_01[2],
    spawn_group = {},
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    goal = true,
    retry_pos = "locator2_root_goal_01_09_retry"
  },
  {
    dead_group = "enmgen2_root_slope_02",
    move_tbl = _CITIZENS_ROOT_A_B[1],
    spawn_group = {
      "enmgen2_root_water_fountain_01",
      "enmgen2_root_water_fountain_02"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    navimesh = true,
    retry_pos = "locator2_root_02_01_retry"
  },
  {
    dead_group = "enmgen2_root_water_fountain_01",
    move_tbl = _CITIZENS_ROOT_A_B_A[1],
    spawn_group = {
      "enmgen2_root_cross_01_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_03_01_retry"
  },
  {
    dead_group = "enmgen2_root_water_fountain_02",
    move_tbl = _CITIZENS_ROOT_A_B_B[1],
    spawn_group = {
      "enmgen2_root_cross_02",
      "enmgen2_root_cross_03"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_04_01_retry"
  },
  {
    dead_group = "enmgen2_root_cross_02",
    move_tbl = _CITIZENS_ROOT_A_B_B_A[1],
    spawn_group = {
      "enmgen2_root_bridge_02"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_05_01_retry"
  },
  {
    dead_group = "enmgen2_root_bridge_02",
    move_tbl = _CITIZENS_ROOT_GOAL_02[1],
    spawn_group = {
      "enmgen2_root_finish_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_goal_02_01_retry"
  },
  {
    dead_group = "enmgen2_root_finish_01",
    move_tbl = _CITIZENS_ROOT_GOAL_03[3],
    spawn_group = {},
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    goal = true
  },
  {
    dead_group = "enmgen2_root_cross_03",
    move_tbl = _CITIZENS_ROOT_A_B_B_B[1],
    spawn_group = {
      "enmgen2_root_circle_02",
      "enmgen2_root_circle_03"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    retry_pos = "locator2_root_cross_03_01_retry"
  },
  {
    dead_group = "enmgen2_root_circle_02",
    move_tbl = _CITIZENS_ROOT_B_B[1],
    spawn_group = {
      "enmgen2_root_bridge_02"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_cross_05_01_retry"
  },
  {
    dead_group = "enmgen2_root_circle_04",
    move_tbl = _CITIZENS_ROOT_GOAL_03[1],
    spawn_group = {
      "enmgen2_root_stairs_03_02",
      "enmgen2_root_stairs_03_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    recast = false,
    retry_pos = "locator2_root_goal_03_01_retry"
  },
  {
    dead_group = "enmgen2_root_stairs_03_01",
    move_tbl = _CITIZENS_ROOT_GOAL_03[2],
    spawn_group = {
      "enmgen2_root_finish_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    recast = false,
    retry_pos = "locator2_root_goal_03_09_retry"
  },
  {
    dead_group = "enmgen2_root_slope_03",
    move_tbl = _CITIZENS_ROOT_A_C[1],
    spawn_group = {
      "enmgen2_root_circle_02",
      "enmgen2_root_circle_03"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    navimesh = true,
    retry_pos = "locator2_root_06_01_retry"
  },
  {
    dead_group = "enmgen2_root_b_init_01",
    move_tbl = _CITIZENS_ROOT_B_INIT[1],
    spawn_group = {
      "enmgen2_root_b_init_02"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_b_init_01_retry"
  },
  {
    dead_group = "enmgen2_root_b_init_02",
    move_tbl = _CITIZENS_ROOT_B_INIT[2],
    spawn_group = {
      "enmgen2_root_b_init_03"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_b_init_04_retry"
  },
  {
    dead_group = "enmgen2_root_b_init_03",
    move_tbl = _CITIZENS_ROOT_B_INIT[3],
    spawn_group = {
      "enmgen2_root_circle_04",
      "enmgen2_root_circle_02",
      "enmgen2_root_circle_03"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_b_init_08_retry"
  },
  {
    dead_group = "enmgen2_root_circle_03",
    move_tbl = _CITIZENS_ROOT_GOAL_03[1],
    spawn_group = {
      "enmgen2_root_stairs_03_02",
      "enmgen2_root_stairs_03_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_b,
    recast = false,
    retry_pos = "locator2_root_goal_03_01_retry"
  },
  {
    dead_group = "enmgen2_root_circle_01",
    move_tbl = _CITIZENS_ROOT_B_A[1],
    spawn_group = {
      "enmgen2_root_cross_01_01"
    },
    formation = _CITIZENS_FORMATION_TBL.formation_a,
    retry_pos = "locator2_root_cross_05_01_re_retry"
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20
  L1_1.name = "sm22_new_regime"
  L1_1.type = "man57"
  L1_1.node = "locator2_new_regime_c"
  L1_1.reset = false
  L1_1.color_variation = 1
  L2_2.name = "sm22_old_regime"
  L2_2.type = "man56"
  L2_2.node = "locator2_old_regime_c"
  L2_2.reset = false
  L3_3 = {}
  L3_3.name = "sm22_man_poor"
  L3_3.type = "man36"
  L3_3.node = "locator2_man_poor_c"
  L3_3.reset = false
  L4_4 = {}
  L4_4.name = "sm22_man_middle_class"
  L4_4.type = "man38"
  L4_4.node = "locator2_man_middle_class_c"
  L4_4.reset = false
  L5_5.name = "sm22_madam"
  L5_5.type = "wom27"
  L5_5.node = "locator2_madam_c"
  L5_5.reset = false
  L6_6.name = "sm22_citizen_man45"
  L6_6.type = "man45"
  L6_6.node = "locator2_man45_c"
  L6_6.reset = false
  L7_7.name = "sm22_citizen_man32"
  L7_7.type = "man32"
  L7_7.node = "locator2_man32_c"
  L7_7.reset = false
  L8_8 = {}
  L8_8.name = "sm22_citizen_man48"
  L8_8.type = "man48"
  L8_8.node = "locator2_man48_c"
  L8_8.reset = false
  L9_9 = {}
  L9_9.name = "sm22_citizen_wom17"
  L9_9.type = "wom17"
  L9_9.node = "locator2_wom17_c"
  L9_9.reset = false
  L10_10.name = "sm22_citizen_chi12"
  L10_10.type = "chi12"
  L10_10.node = "locator2_chi12_c"
  L10_10.reset = false
  chara_table = L0_0
  L0_0(L1_1)
  for L3_3, L4_4 in L0_0(L1_1) do
    L8_8 = L4_4.name
    L5_5[L6_6] = L7_7
    L8_8 = L4_4.name
    L5_5[L6_6] = L7_7
  end
  L3_3 = 1
  L1_1(L2_2, L3_3)
  L3_3 = "Puppet"
  L1_1(L2_2, L3_3)
  L3_3 = L0_0
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2)
  L3_3 = "pccubesensor2_citizens_caption_c"
  L3_3 = L2_2
  L4_4 = L1_1
  L2_2(L3_3, L4_4, L5_5)
  L3_3 = "pccubesensor2_citizens_caption_c"
  L2_2(L3_3)
  L3_3 = "PlayerSensor"
  L4_4 = "pccubesensor2_citizens_distant_c"
  L3_3 = _puppet_tbl
  L3_3 = L3_3.sm22_new_regime
  L4_4 = L3_3
  L3_3 = L3_3.appendChild
  L3_3(L4_4, L5_5, L6_6)
  L3_3 = Fn_pcSensorOff
  L4_4 = "pccubesensor2_citizens_distant_c"
  L3_3(L4_4)
  L3_3 = findGameObject2
  L4_4 = "PlayerSensor"
  L3_3 = L3_3(L4_4, L5_5)
  L4_4 = _puppet_tbl
  L4_4 = L4_4.sm22_new_regime
  L4_4 = L4_4.appendChild
  L4_4(L5_5, L6_6, L7_7)
  L4_4 = Fn_pcSensorOff
  L4_4(L5_5)
  L4_4 = findGameObject2
  L4_4 = L4_4(L5_5, L6_6)
  L8_8 = true
  L5_5(L6_6, L7_7, L8_8)
  L5_5(L6_6)
  for L8_8, L9_9 in L5_5(L6_6) do
    for L13_13, L14_14 in L10_10(L11_11) do
      for L18_18, L19_19 in L15_15(L16_16) do
        L20_20 = findGameObject2
        L20_20 = L20_20("Node", L19_19)
        _puppet_tbl.sm22_new_regime:appendChild(L20_20, true)
      end
    end
  end
  _sdemo_cut01 = L5_5
  _sdemo_cut02 = L5_5
  _sdemo_cut03 = L5_5
end
function Ingame()
  local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39, L19_40, L20_41, L21_42, L22_43, L23_44, L24_45, L25_46, L26_47, L27_48, L28_49, L29_50, L30_51, L31_52, L32_53, L33_54, L34_55, L35_56, L36_57, L37_58, L38_59, L39_60, L40_61, L41_62, L42_63, L43_64, L44_65, L45_66, L46_67, L47_68, L48_69, L49_70, L50_71, L51_72, L52_73, L53_74, L54_75, L55_76, L56_77, L57_78, L58_79, L59_80
  L0_21 = Mob
  L1_22 = L0_21
  L0_21 = L0_21.makeSituationPanic
  L2_23 = true
  L0_21(L1_22, L2_23)
  L0_21 = {
    L1_22,
    L2_23,
    L3_24,
    L4_25,
    L5_26,
    L6_27,
    L7_28,
    L8_29,
    L9_30,
    L10_31
  }
  L1_22 = {}
  L1_22.num = 10
  L1_22.name = "sm22_new_regime"
  L1_22.type = "man"
  L1_22.sdemo_node = "locator2_new_regime_sdemo_pos_c"
  L1_22.turn_node = "locator2_battle_pos"
  L2_23 = {}
  L2_23.num = 1
  L2_23.name = "sm22_old_regime"
  L2_23.type = "man"
  L2_23.sdemo_node = "locator2_old_regime_sdemo_pos_c"
  L2_23.turn_node = "locator2_battle_pos"
  L3_24 = {}
  L3_24.num = 2
  L3_24.name = "sm22_man_poor"
  L3_24.type = "man"
  L3_24.sdemo_node = "locator2_man_poor_sdemo_pos_c"
  L3_24.turn_node = "locator2_man_middle_class_sdemo_pos_c"
  L4_25 = {}
  L4_25.num = 3
  L4_25.name = "sm22_man_middle_class"
  L4_25.type = "man"
  L4_25.sdemo_node = "locator2_man_middle_class_sdemo_pos_c"
  L4_25.turn_node = "locator2_man_poor_sdemo_pos_c"
  L5_26 = {}
  L5_26.num = 4
  L5_26.name = "sm22_madam"
  L5_26.type = "wom"
  L5_26.sdemo_node = "locator2_madam_sdemo_pos_c"
  L5_26.turn_node = "locator2_man48_sdemo_pos_c"
  L6_27 = {}
  L6_27.num = 5
  L6_27.name = "sm22_citizen_man45"
  L6_27.type = "man"
  L6_27.sdemo_node = "locator2_man45_sdemo_pos_c"
  L6_27.turn_node = "locator2_man32_sdemo_pos_c"
  L7_28 = {}
  L7_28.num = 6
  L7_28.name = "sm22_citizen_man32"
  L7_28.type = "man"
  L7_28.sdemo_node = "locator2_man32_sdemo_pos_c"
  L7_28.turn_node = "locator2_man45_sdemo_pos_c"
  L8_29 = {}
  L8_29.num = 7
  L8_29.name = "sm22_citizen_man48"
  L8_29.type = "man"
  L8_29.sdemo_node = "locator2_man48_sdemo_pos_c"
  L8_29.turn_node = "locator2_madam_sdemo_pos_c"
  L9_30 = {}
  L9_30.num = 8
  L9_30.name = "sm22_citizen_wom17"
  L9_30.type = "wom"
  L9_30.sdemo_node = "locator2_wom17_sdemo_pos_c"
  L9_30.turn_node = "locator2_chi12_sdemo_pos_c"
  L10_31 = {}
  L10_31.num = 9
  L10_31.name = "sm22_citizen_chi12"
  L10_31.type = "chi"
  L10_31.sdemo_node = "locator2_chi12_sdemo_pos_c"
  L10_31.turn_node = "locator2_wom17_sdemo_pos_c"
  L1_22 = {
    L2_23,
    L3_24,
    L4_25,
    L5_26,
    L6_27,
    L7_28,
    L8_29,
    L9_30,
    L10_31
  }
  L2_23 = {}
  L2_23.num = "1"
  L2_23.name = "sm22_old_regime"
  L2_23.type = "man"
  L2_23.move_speed = 1
  L2_23.anim_run = "run"
  L3_24 = {}
  L3_24.num = "2"
  L3_24.name = "sm22_man_poor"
  L3_24.type = "man"
  L3_24.move_speed = 1
  L3_24.anim_run = "man01_run_afraid_01"
  L4_25 = {}
  L4_25.num = "3"
  L4_25.name = "sm22_man_middle_class"
  L4_25.type = "man"
  L4_25.move_speed = 1
  L4_25.anim_run = "man01_run_afraid_00"
  L5_26 = {}
  L5_26.num = "4"
  L5_26.name = "sm22_madam"
  L5_26.type = "wom"
  L5_26.move_speed = 1.2
  L5_26.anim_run = "wom01_run_afraid_01"
  L6_27 = {}
  L6_27.num = "5"
  L6_27.name = "sm22_citizen_man45"
  L6_27.type = "man"
  L6_27.move_speed = 1
  L6_27.anim_run = "man01_run_afraid_00"
  L7_28 = {}
  L7_28.num = "6"
  L7_28.name = "sm22_citizen_man32"
  L7_28.type = "man"
  L7_28.move_speed = 1
  L7_28.anim_run = "man01_run_afraid_01"
  L8_29 = {}
  L8_29.num = "7"
  L8_29.name = "sm22_citizen_man48"
  L8_29.type = "man"
  L8_29.move_speed = 1
  L8_29.anim_run = "man01_run_afraid_00"
  L9_30 = {}
  L9_30.num = "8"
  L9_30.name = "sm22_citizen_wom17"
  L9_30.type = "wom"
  L9_30.move_speed = 1
  L9_30.anim_run = "wom01_run_afraid_00"
  L10_31 = {}
  L10_31.num = "9"
  L10_31.name = "sm22_citizen_chi12"
  L10_31.type = "chi"
  L10_31.move_speed = 1.9
  L10_31.anim_run = "chi01_run_afraid_00"
  L2_23 = {}
  L3_24 = {}
  L3_24.on = false
  L3_24.enemy = false
  L3_24.in_skip = false
  L4_25 = {}
  L5_26 = {}
  L5_26.leader_task = nil
  L5_26.leader_move = false
  L5_26.follow_move = true
  L5_26.goal = false
  L5_26.scared_flag = false
  L5_26.move_caption_num = 0
  L6_27 = {}
  L7_28 = {}
  L8_29 = {}
  L8_29.battle_end = false
  L9_30 = "locator2_pc_start_pos"
  L10_31 = false
  L11_32 = false
  L12_33 = false
  L13_34 = true
  L14_35 = true
  L15_36 = {}
  L16_37 = {}
  L17_38 = {}
  L17_38.goal = false
  L17_38.recast = false
  L17_38.navimesh = false
  L18_39 = {}
  L19_40 = {}
  L20_41 = {}
  L21_42 = {}
  L22_43 = {}
  L23_44, L24_45 = nil, nil
  L25_46 = Fn_pcSensorOff
  L26_47 = "pccubesensor2_end_area_catwarp_01"
  L25_46(L26_47)
  L25_46 = Fn_pcSensorOff
  L26_47 = "pccubesensor2_end_warning_catwarp_01"
  L25_46(L26_47)
  function L25_46()
    local L0_81, L1_82
    L0_81 = print
    L1_82 = "\227\131\170\227\131\136\227\131\169\227\130\164"
    L0_81(L1_82)
    L0_81 = Mv_safeTaskAbort
    L1_82 = L5_26.leader_task
    L0_81 = L0_81(L1_82)
    L5_26.leader_task = L0_81
    L0_81 = L4_25.retry_pos
    if L0_81 ~= nil then
      L0_81 = L4_25.retry_pos
      L9_30 = L0_81
    end
    function L0_81()
      local L0_83, L1_84, L2_85, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92
      L0_83()
      L0_83()
      if L0_83 then
      else
        if L0_83 == nil then
          L0_83(L1_84)
          for L3_86, L4_87 in L0_83(L1_84) do
            L5_88(L6_89, L7_90)
          end
          L7_28 = L0_83
          L15_36 = L0_83
      end
      else
        L0_83(L1_84)
        for L3_86, L4_87 in L0_83(L1_84) do
          for L8_91, L9_92 in L5_88(L6_89) do
            print("\230\164\156\231\180\162\228\184\173\227\129\174\227\130\185\227\131\157\227\131\188\227\131\179\227\130\176\227\131\171\227\131\188\227\131\151", L9_92)
          end
        end
        L0_83(L1_84, L2_85)
        L0_83(L1_84, L2_85)
        L7_28 = L0_83
        for L3_86, L4_87 in L0_83(L1_84) do
          L5_88(L6_89, L7_90)
        end
        L15_36 = L0_83
        for L3_86, L4_87 in L0_83(L1_84) do
          L5_88(L6_89, L7_90)
        end
        L0_83(L1_84)
        for L3_86, L4_87 in L0_83(L1_84) do
          L5_88(L6_89, L7_90)
        end
      end
      L0_83()
      L0_83(L1_84)
      L0_83(L1_84)
      L0_83(L1_84, L2_85)
      L0_83()
    end
    L1_82 = waitSeconds
    L1_82(3)
    L1_82 = Fn_sceneConversion
    L1_82(L9_30, L0_81)
    L1_82 = clearFearGauge
    L1_82()
    L1_82 = Player
    L1_82 = L1_82.setStay
    L1_82(L1_82, false)
    L1_82 = Fn_userCtrlOn
    L1_82()
    L5_26.leader_move = false
    L3_24.on = false
    L3_24.in_skip = true
    L1_82 = false
    L13_34 = L1_82
    L1_82 = _npc_flag
    L1_82.dist = false
    L1_82 = _npc_flag
    L1_82.cap = false
    L1_82 = _npc_flag
    L1_82.OnEnter = false
    L1_82 = _npc_flag
    L1_82.OnLeave = false
    L5_26.move_caption_num = 0
    L1_82 = _npc_flag
    L1_82.near_nevy = false
    L1_82 = true
    L12_33 = L1_82
    L3_24.enemy = true
    L5_26.follow_move = true
    L1_82 = Player
    L1_82 = L1_82.setEnergy
    L1_82(L1_82, Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    L1_82 = Player
    L1_82 = L1_82.setEnergy
    L1_82(L1_82, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
    L1_82 = Mv_viewObj
    L1_82 = L1_82(_puppet_tbl.sm22_new_regime, 1)
    Fn_captionView("sm22_01022")
    waitSeconds(2)
    L1_82 = Mv_safeTaskAbort(L1_82)
  end
  L26_47 = Fn_sendEventComSb
  L26_47(L27_48)
  L26_47 = Fn_sendEventComSb
  L26_47(L27_48)
  L26_47 = Fn_sendEventComSb
  L26_47(L27_48, L28_49)
  L26_47 = setupFearGauge
  L26_47()
  L26_47 = Fn_missionStart
  L26_47()
  L26_47 = Fn_sendEventComSb
  L26_47 = L26_47(L27_48)
  if not L26_47 then
    L26_47 = Fn_sendEventComSb
    L26_47(L27_48, L28_49)
    while true do
      L26_47 = Fn_sendEventComSb
      L26_47 = L26_47(L27_48)
      if L26_47 then
        L26_47 = wait
        L26_47()
      end
    end
  end
  L26_47 = Fn_sensorOn
  L26_47(L27_48)
  L26_47 = Fn_pcSensorOn
  L26_47(L27_48)
  L26_47 = Fn_pcSensorOn
  L26_47(L27_48)
  L26_47 = Fn_pcSensorOn
  L26_47(L27_48)
  L26_47 = Fn_pcSensorOn
  L26_47(L27_48)
  L26_47 = Fn_setCatWarpCheckPoint
  L26_47(L27_48)
  L26_47 = _CITIZENS_ROOT_INIT
  L7_28 = L26_47[1]
  L26_47 = _CITIZENS_FORMATION_TBL
  L6_27 = L26_47.formation_a
  L26_47 = {L27_48}
  L15_36 = L26_47
  L26_47 = {}
  L26_47.isStop = true
  L26_47.animBlendDuration = 0.1
  for L30_51, L31_52 in L27_48(L28_49) do
    if L32_53 == "man" then
      L32_53(L33_54, L34_55)
    elseif L32_53 == "wom" then
      L32_53(L33_54, L34_55)
    elseif L32_53 == "chi" then
      L32_53(L33_54, L34_55)
    end
  end
  L27_48()
  L27_48(L28_49)
  L28_49(L29_50)
  L28_49(L29_50)
  L28_49(L29_50)
  L28_49(L29_50, L30_51, L31_52)
  L28_49(L29_50)
  L28_49(L29_50)
  L28_49(L29_50)
  L28_49(L29_50)
  L28_49(L29_50)
  L28_49.near = nil
  L28_49.follow = nil
  while true do
    while true do
      if not L29_50 then
        L29_50(L30_51)
        if L29_50 <= 0 then
          for L32_53, L33_54 in L29_50(L30_51) do
            L34_55(L35_56)
          end
        end
        while true do
          if L29_50 then
            L29_50(L30_51)
            L29_50()
          end
        end
        L29_50(L30_51)
        L29_50(L30_51)
        L29_50(L30_51)
        if L11_32 then
          if not L29_50 then
            L16_37 = L22_43
            L4_25 = L18_39
            L5_26.goal = L29_50
            L13_34 = L17_38.recast
            L14_35 = L17_38.navimesh
            L7_28 = L19_40
            L6_27 = L20_41
            L15_36 = L21_42
            end_pos = L29_50
            for L32_53, L33_54 in L29_50(L30_51) do
              for L37_58, L38_59 in L34_55(L35_56) do
                L39_60 = L38_59.dead_group
                if L33_54 == L39_60 then
                  L39_60 = table
                  L39_60 = L39_60.remove
                  L40_61 = _ROOT_TBL
                  L41_62 = L37_58
                  L39_60(L40_61, L41_62)
                  break
                end
              end
            end
          end
        end
        L3_24.enemy = false
        L12_33 = false
        for L33_54, L34_55 in L30_51(L31_52) do
          L37_58.pos = L34_55
          L37_58.flg = false
          L35_56(L36_57, L37_58)
        end
        L33_54.anim_run = "run1"
        L33_54.anim_run_speed = L34_55
        L33_54.anim_speed_over = true
        L33_54.runLength = -1
        L33_54.recast = true
        L33_54.navimesh = true
        L33_54.noTurn = true
        L5_26.leader_task = L30_51
        L5_26.leader_move = true
        if L32_53 == nil then
          L28_49.near = L32_53
        end
        if L32_53 == nil then
          L28_49.follow = L32_53
        end
        while true do
          while true do
            L59_80 = L36_57(L37_58)
            if L33_54 <= L34_55 and not L31_52 then
              if L34_55 ~= nil then
              end
              for L38_59, L39_60 in L35_56(L36_57) do
                L40_61 = TARGET_DIST
                L41_62 = Fn_get_distance
                L45_66 = L39_60.pos
                L59_80 = L43_64(L44_65)
                L41_62 = L41_62(L42_63, L43_64, L44_65, L45_66, L46_67, L47_68, L48_69, L49_70, L50_71, L51_72, L52_73, L53_74, L54_75, L55_76, L56_77, L57_78, L58_79, L59_80, L43_64(L44_65))
                if L40_61 >= L41_62 then
                  L39_60.flg = true
                end
                L40_61 = L39_60.flg
              end
              if L33_54 then
              else
                for L39_60, L40_61 in L36_57(L37_58) do
                  L41_62 = L40_61.flg
                  if L41_62 == false then
                    L41_62 = table
                    L41_62 = L41_62.insert
                    L41_62(L42_63, L43_64)
                  end
                end
                L39_60 = {}
                L40_61 = NPC_MOVE_SPEED
                L39_60.anim_run_speed = L40_61
                L39_60.anim_run = "run1"
                L39_60.anim_speed_over = true
                L39_60.runLength = -1
                L39_60.recast = true
                L39_60.navimesh = true
                L5_26.leader_task = L36_57
                L5_26.leader_move = true
                L36_57.sm22_new_regime = L37_58
              end
              L39_60 = {L40_61, L41_62}
              L40_61 = {}
              L41_62 = {L42_63}
              L40_61.enmgen = L41_62
              L41_62 = {L42_63, L43_64}
              L40_61.enemies = L41_62
              L41_62 = {}
              L41_62.enmgen = L42_63
              L45_66 = "sm22_enemy_root_b_init_01_02"
              L41_62.enemies = L42_63
              L40_61 = {
                L41_62,
                L42_63,
                L43_64,
                L44_65,
                L45_66
              }
              L41_62 = {}
              L41_62.name = "sm22_enemy_root_init_03_01"
              L41_62.move_tbl = L42_63
              L42_63.name = "sm22_enemy_root_init_03_02"
              L42_63.move_tbl = L43_64
              L43_64.name = "sm22_enemy_root_a_init_01_01"
              L45_66 = "locator2_sm22_enemy_root_a_init_01_01_target_01"
              L43_64.move_tbl = L44_65
              L44_65.name = "sm22_enemy_root_b_init_01_01"
              L45_66 = {L46_67, L47_68}
              L46_67 = "locator2_sm22_enemy_root_b_init_01_01_target_01"
              L47_68 = "locator2_sm22_enemy_root_b_init_01_01_target_02"
              L44_65.move_tbl = L45_66
              L45_66 = {}
              L45_66.name = "sm22_enemy_root_b_init_01_02"
              L46_67 = {
                L47_68,
                L48_69,
                L49_70
              }
              L47_68 = "locator2_sm22_enemy_root_b_init_01_02_target_01"
              L48_69 = "locator2_sm22_enemy_root_b_init_01_02_target_02"
              L49_70 = "locator2_sm22_enemy_root_b_init_01_02_target_03"
              L45_66.move_tbl = L46_67
              L41_62 = {}
              L41_62.invincible = false
              if L42_63 then
                L42_63(L43_64)
                for L45_66, L46_67 in L42_63(L43_64) do
                  L47_68 = Fn_sendEventComSb
                  L48_69 = "requestSpawnEnemy"
                  L49_70 = L46_67
                  L47_68(L48_69, L49_70)
                  while true do
                    L47_68 = Fn_sendEventComSb
                    L48_69 = "isSpawnEnemyEnd"
                    L47_68 = L47_68(L48_69)
                    if L47_68 then
                      L47_68 = wait
                      L47_68()
                    end
                  end
                  L47_68 = {}
                  L48_69 = {}
                  L49_70 = {}
                  for L53_74, L54_75 in L50_71(L51_72) do
                    if L55_76 == L56_77 then
                      for L58_79, L59_80 in L55_76(L56_77) do
                        L47_68[L59_80] = Fn_sendEventComSb("requestBrain", L54_75.enemies[L58_79])
                        print("\227\131\150\227\131\172\227\130\164\227\131\179\229\135\186\227\129\141\227\129\159\227\129\158\227\130\179\227\131\169", L59_80)
                        print("enmgen_brain[value]", L47_68[L59_80])
                      end
                      for L58_79, L59_80 in L55_76(L56_77) do
                        L48_69[L58_79] = Fn_sendEventComSb("requestEnemyGenerator", L54_75.enmgen[L58_79])
                        L48_69[L58_79]:setEventListener("DamageEnemyReport", L38_59)
                      end
                      L55_76(L56_77)
                      L23_44 = L55_76
                    else
                    end
                  end
                  L53_74 = "sm22_01050"
                  L54_75 = "sm22_01051"
                  L51_72(L52_73)
                  L51_72.OnEnter = true
                  break
                end
                L42_63.target_near = false
                L28_49.near = L42_63
                break
              end
            end
            L42_63()
          end
        end
        if L33_54 == false then
          while true do
            if L33_54 then
              if L33_54 then
                for L36_57, L37_58 in L33_54(L34_55) do
                  L39_60 = "requestSpawnEnemy"
                  L40_61 = L37_58
                  L38_59(L39_60, L40_61)
                  while true do
                    L39_60 = "isSpawnEnemyEnd"
                    if L38_59 then
                      L38_59()
                    end
                  end
                end
                L33_54.target_near = false
                L28_49.near = L33_54
              end
              L33_54()
              L33_54(L34_55)
            end
          end
          L10_31 = true
          if not L34_55 then
            L34_55()
            for L37_58, L38_59 in L34_55(L35_56) do
              L39_60 = L38_59.num
              L40_61 = Fn_moveNpc
              L41_62 = L38_59.name
              L59_80 = L43_64(L44_65)
              ;({
                [18] = L43_64(L44_65)
              })[1] = L43_64
              ;({
                [18] = L43_64(L44_65)
              })[2] = L44_65
              ;({
                [18] = L43_64(L44_65)
              })[3] = L45_66
              ;({
                [18] = L43_64(L44_65)
              })[4] = L46_67
              ;({
                [18] = L43_64(L44_65)
              })[5] = L47_68
              ;({
                [18] = L43_64(L44_65)
              })[6] = L48_69
              ;({
                [18] = L43_64(L44_65)
              })[7] = L49_70
              ;({
                [18] = L43_64(L44_65)
              })[8] = L50_71
              ;({
                [18] = L43_64(L44_65)
              })[9] = L51_72
              ;({
                [18] = L43_64(L44_65)
              })[10] = L52_73
              ;({
                [18] = L43_64(L44_65)
              })[11] = L53_74
              ;({
                [18] = L43_64(L44_65)
              })[12] = L54_75
              ;({
                [18] = L43_64(L44_65)
              })[13] = L55_76
              ;({
                [18] = L43_64(L44_65)
              })[14] = L56_77
              ;({
                [18] = L43_64(L44_65)
              })[15] = L57_78
              ;({
                [18] = L43_64(L44_65)
              })[16] = L58_79
              ;({
                [18] = L43_64(L44_65)
              })[17] = L59_80
              L40_61 = L40_61(L41_62, L42_63)
              L2_23[L39_60] = L40_61
              L39_60 = waitSeconds
              L40_61 = 0.2
              L39_60(L40_61)
              L39_60 = L38_59.num
              L40_61 = Mv_safeTaskAbort
              L41_62 = L38_59.num
              L41_62 = L2_23[L41_62]
              L40_61 = L40_61(L41_62)
              L2_23[L39_60] = L40_61
              L39_60 = Fn_killNpcTask
              L40_61 = L38_59.name
              L39_60(L40_61)
              L39_60 = invokeTask
              function L40_61()
                if L37_58 ~= 1 then
                  randomWaitSecondsMin()
                end
                _npc_motion_sw[L38_59.name] = NPC_MOTION.IN
                Fn_playMotionNpc(L38_59.name, L38_59.type .. "01_scared_nevy_in_00", true, L26_47)
                print(tostring(L38_59.name) .. "\229\186\167\227\130\138\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179in")
                if _npc_motion_sw[L38_59.name] == NPC_MOTION.IN then
                  Fn_playMotionNpc(L38_59.name, L38_59.type .. "01_scared_nevy_00", false)
                  _npc_motion_sw[L38_59.name] = NPC_MOTION.SIT
                else
                  print(tostring(L38_59.name) .. ":\229\186\167\227\130\138\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\129\174\229\134\141\231\148\159\227\130\146\227\129\151\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171\227\129\151\227\129\190\227\129\153")
                end
              end
              L39_60(L40_61)
              break
            end
            L5_26.leader_task = L33_54
            L28_49.follow = L33_54
            L13_34 = true
            L5_26.leader_move = false
            L5_26.move_caption_num = L33_54
            if L33_54 then
              L33_54(L34_55)
              L8_29.battle_end = true
              break
            end
            L5_26.scared_flag = true
            if not L11_32 then
              L33_54(L34_55)
            end
            while true do
              while true do
                if not L12_33 then
                elseif L34_55 == true then
                  L34_55(L35_56)
                  break
                end
                for L37_58, L38_59 in L34_55(L35_56) do
                  L39_60 = Fn_sendEventComSb
                  L40_61 = "isEnemyGroupAllDead"
                  L41_62 = L38_59.dead_group
                  L39_60 = L39_60(L40_61, L41_62)
                  if L39_60 then
                    L39_60 = L3_24.on
                    if L39_60 == false then
                      L12_33 = true
                      L18_39 = L38_59
                      L39_60 = L38_59.goal
                      L17_38.goal = L39_60
                      L39_60 = L38_59.recast
                      L17_38.recast = L39_60
                      L39_60 = L38_59.navimesh
                      L17_38.navimesh = L39_60
                      L19_40 = L38_59.move_tbl
                      L20_41 = L38_59.formation
                      L21_42 = L38_59.spawn_group
                      L22_43 = L15_36
                      L39_60 = print
                      L40_61 = "1407val.goal"
                      L41_62 = tostring
                      L41_62 = L41_62(L42_63)
                      L40_61 = L40_61 .. L41_62 .. L42_63
                      L39_60(L40_61)
                      L11_32 = true
                      L3_24.enemy = false
                      L39_60 = L38_59.dead_group
                      if L39_60 == "enmgen2_root_cross_01_01" then
                        L39_60 = Fn_sendEventComSb
                        L40_61 = "requestSpawnEnemy"
                        L41_62 = "enmgen2_root_cross_01_02"
                        L39_60(L40_61, L41_62)
                        while true do
                          L39_60 = Fn_sendEventComSb
                          L40_61 = "isSpawnEnemyEnd"
                          L39_60 = L39_60(L40_61)
                          if L39_60 then
                            L39_60 = wait
                            L39_60()
                          end
                        end
                        L39_60 = Mv_viewObj
                        L40_61 = Fn_sendEventComSb
                        L41_62 = "requestEnemyHandle"
                        L40_61 = L40_61(L41_62, L42_63)
                        L41_62 = 0.3
                        L39_60 = L39_60(L40_61, L41_62)
                        L40_61 = waitSeconds
                        L41_62 = 1.5
                        L40_61(L41_62)
                        L40_61 = Fn_captionViewWait
                        L41_62 = "sm22_01041"
                        L40_61(L41_62)
                        L40_61 = 300
                        L41_62 = 0
                        while L40_61 >= L41_62 do
                          if not L42_63 then
                            L40_61 = L40_61 - 1
                            L42_63(L43_64)
                          end
                          if L42_63 ~= true then
                            L42_63()
                          end
                        end
                        L39_60 = L42_63
                        if L42_63 ~= true then
                          L42_63(L43_64, L44_65)
                          while true do
                            if L42_63 then
                              L42_63()
                            end
                          end
                          L39_60 = L42_63
                          L45_66 = "sm22_enemy_root_cross_01_03"
                          L39_60 = L42_63
                          L42_63(L43_64)
                          L42_63(L43_64)
                          while true do
                            if not L42_63 then
                              L45_66 = "isEnemyGroupAllDead"
                              L46_67 = "enmgen2_root_cross_01_03"
                              L59_80 = L44_65(L45_66, L46_67)
                              L42_63(L43_64, L44_65, L45_66, L46_67, L47_68, L48_69, L49_70, L50_71, L51_72, L52_73, L53_74, L54_75, L55_76, L56_77, L57_78, L58_79, L59_80, L44_65(L45_66, L46_67))
                            end
                            if L42_63 ~= true then
                              L42_63()
                            end
                          end
                          L39_60 = L42_63
                        end
                      end
                      break
                    end
                  end
                end
                L34_55()
              end
            end
            while true do
              if L34_55 then
                L34_55(L35_56)
              end
              if L34_55 ~= true then
                L34_55()
              end
            end
            L34_55(L35_56)
            L12_33 = false
            if L34_55 == false then
              L34_55()
            end
            L34_55()
            L34_55(L35_56)
          end
        end
      end
    end
  end
  L29_50()
  L29_50(L30_51)
  L29_50(L30_51)
  L29_50(L30_51)
  L29_50(L30_51)
  L29_50(L30_51)
  L29_50(L30_51)
  L29_50(L30_51)
  for L32_53, L33_54 in L29_50(L30_51) do
    L38_59.anim_run = "run1"
    L39_60 = NPC_MOVE_SPEED
    L38_59.anim_run_speed = L39_60
    L38_59.anim_speed_over = true
    L38_59.runLength = -1
    L38_59.recast = true
    L38_59.navimesh = true
    L38_59.noTurn = true
    L2_23[L34_55] = L35_56
  end
  L29_50(L30_51)
  for L32_53, L33_54 in L29_50(L30_51) do
    L34_55(L35_56)
    break
  end
  L29_50()
  L29_50(L30_51)
  L29_50(L30_51)
  for L32_53, L33_54 in L29_50(L30_51) do
    L2_23[L34_55] = L35_56
  end
  L29_50(L30_51)
  L30_51(L31_52)
  L30_51()
  L30_51(L31_52)
  L30_51(L31_52)
  L30_51()
  for L33_54, L34_55 in L30_51(L31_52) do
    L35_56(L36_57, L37_58, L38_59)
  end
  L30_51(L31_52)
  L31_52()
  if L31_52 == true then
    L31_52()
  end
  L31_52()
  L31_52.TIME02 = 3
  L31_52.TIME03 = 1.5
  L31_52.TIME04 = 1.5
  L31_52.TIME05 = 1.5
  SDEMO_C = L31_52
  L31_52(L32_53, L33_54, L34_55, L35_56)
  L31_52(L32_53)
  L31_52(L32_53, L33_54)
  while true do
    if L31_52 then
      L31_52()
    end
  end
  L32_53.pos = "locator2_cam_c_02"
  L32_53.time = L33_54
  L33_54.pos = "locator2_aim_c_02"
  L33_54.time = L34_55
  L33_54(L34_55)
  L33_54(L34_55)
  L33_54(L34_55, L35_56, L36_57)
  L33_54(L34_55)
  L33_54(L34_55, L35_56)
  while true do
    if L33_54 then
      L33_54()
    end
  end
  L33_54(L34_55, L35_56)
  L33_54(L34_55)
  L34_55.pos = L35_56
  L34_55.time = L35_56
  L35_56.pos = L36_57
  L35_56.time = L36_57
  L35_56(L36_57, L37_58, L38_59)
  L36_57.pos = L37_58
  L36_57.time = L37_58
  L36_57.pos = L37_58
  L36_57.time = L37_58
  while true do
    if L35_56 then
      L35_56()
    end
  end
  L35_56(L36_57, L37_58, L38_59)
  L36_57.pos = L37_58
  L36_57.time = L37_58
  L36_57.pos = L37_58
  L36_57.time = L37_58
  while true do
    if L35_56 then
      L35_56()
    end
  end
  L35_56(L36_57, L37_58, L38_59)
  while true do
    if L35_56 then
      L35_56()
    end
  end
  L35_56(L36_57)
  L35_56(L36_57)
  L35_56(L36_57, L37_58)
  L35_56(L36_57)
  L35_56()
  L35_56()
  L35_56()
  L35_56()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_citizens_caption_OnEnter()
  local L1_93
  L1_93 = _npc_flag
  L1_93.cap = true
end
function pccubesensor2_citizens_caption_OnLeave()
  local L1_94
  L1_94 = _npc_flag
  L1_94.cap = false
end
function pccubesensor2_citizens_distant_OnEnter()
  local L1_95
  L1_95 = _npc_flag
  L1_95.dist = false
end
function pccubesensor2_citizens_distant_OnLeave()
  local L1_96
  L1_96 = _npc_flag
  L1_96.dist = true
end
function pccubesensor2_citizens_distant_c_catwarp_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_citizens_sdemo_OnEnter()
  local L1_97
  L1_97 = _npc_flag
  L1_97.sdemo = true
end
function pccubesensor2_citizens_sdemo_OnLeave()
  local L1_98
  L1_98 = _npc_flag
  L1_98.sdemo = false
end
function brain_move(A0_99, A1_100, A2_101)
  local L3_102
  L3_102 = nil
  L3_102 = invokeTask(function()
    A0_99:move(A1_100, A2_101)
    repeat
      wait()
    until A0_99:isMoveEnd()
    if A0_99 ~= nil then
      A0_99:endScriptAction()
    end
  end)
end
function cubesensor2_citizens_enemy_OnEnter(A0_103, A1_104)
  for _FORV_5_, _FORV_6_ in pairs(_ENEMY_NAME_TBL) do
    if A1_104:getName() == _FORV_6_ then
      print("\230\164\156\231\159\165\227\129\151\227\129\159\239\188\136\229\133\165\227\129\163\227\129\159\239\188\137")
      print("\233\187\146\232\159\178", A1_104:getName())
      _npc_flag.OnEnter = true
      _npc_flag.near_nevy = true
    end
  end
end
function cubesensor2_citizens_enemy_OnLeave(A0_105, A1_106)
  for _FORV_5_, _FORV_6_ in pairs(_ENEMY_NAME_TBL) do
    if A1_106:getName() == _FORV_6_ then
      print("\230\164\156\231\159\165\227\129\151\227\129\159\239\188\136\229\135\186\227\129\159\239\188\137")
      print("\233\187\146\232\159\178", A1_106:getName())
      _npc_flag.OnLeave = true
      _npc_flag.near_nevy = false
    end
  end
end
function createBox()
  Fn_sendEventComSb("requestCreateBox")
end
function pccubesensor2_end_area_catwarp_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_end_warning_catwarp_01_OnEnter()
  local L0_107, L1_108
end
function pccubesensor2_end_warning_catwarp_01_OnLeave()
  if _end_catwarp_warning_ == true then
    _warning_flag = true
    _end_catwarp_warning_ = false
  else
    invokeTask(function()
      local L0_109
      L0_109 = print
      L0_109("\230\156\128\229\190\140\227\129\174\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151")
      _warning_flag = true
      L0_109 = Mv_viewObj
      L0_109 = L0_109(_puppet_tbl.sm22_new_regime)
      Fn_naviSet(_puppet_tbl.sm22_new_regime)
      Player:setAction(Player.kAction_Float)
      Fn_captionView("sm22_01023")
      waitSeconds(1.5)
      L0_109 = Mv_safeTaskAbort(view_task)
    end)
  end
end
