dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/rac_perceivableNpc.lua")
GAME_TIME = 60
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
RES_BOX_L_ADD_POINT = 60
RES_BOX_M_ADD_POINT = 50
RES_BOX_S_ADD_POINT = 40
EXTRA_BG_ADD_POINT = 20
RES_BOX_NAME_PREFIX = "bg2_woodbox_"
RES_BOX_DYN_NAME_PREFIX = "dyn_"
BONUS_TIME_DATA = {
  {delta_score = 300, add_sec = 15},
  {delta_score = 300, add_sec = 15},
  {delta_score = 300, add_sec = 15},
  {delta_score = 350, add_sec = 12},
  {delta_score = 350, add_sec = 12},
  {delta_score = 350, add_sec = 12},
  {delta_score = 400, add_sec = 10},
  {delta_score = 400, add_sec = 10},
  {delta_score = 400, add_sec = 10},
  {delta_score = 400, add_sec = 5}
}
LANDINGSHIP_MOVE_WAIT_SEC = {
  0,
  25,
  25,
  25
}
PARTED_BOX_A = 1
PARTED_BOX_B = 2
PARTED_BOX_C = 3
PARTED_BOX_D = 4
SCORE_BONE_OFFSET_Y = 1
SCORE_POP_RAND_RANGE_X = {min = -0.25, max = 0.25}
SCORE_POP_RAND_RANGE_Y = {min = -0.25, max = 0.25}
_patrol_pup_tbl = {}
_is_out_of_range = false
_security_level = 1
_patrol_soldier_spawn_task_tbl = {}
_patrol_soldier_tbl = {}
_container_tbl = {}
_resource_box_tbl = {}
_res_box_parted = {}
_parted_box_max_num_tbl = {}
_parted_box_now_num_tbl = {}
_parted_box_respawn_tbl = {}
_res_throw_out_point = 0
_soldier_kill_count = 0
_is_in_bomb_sensor = false
_is_found = false
_alarm_se_handle = nil
_landingship_enmgen_data_tbl = {}
_bonus_time_idx = 1
_bonus_time_score_tmp = 0
_soldier_data_tbl = {
  {
    npc_name = "cm11_soldier_01_01",
    reset_pos = "locator2_patrol_soldier_01",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_01_move_",
    turn_target_prefix = "locator2_soldier_01_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_02",
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
    npc_name = "cm11_soldier_01_03",
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
    npc_name = "cm11_soldier_01_04",
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
    npc_name = "cm11_soldier_01_05",
    reset_pos = "locator2_patrol_soldier_05",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_05_move_",
    turn_target_prefix = "locator2_soldier_05_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_06",
    reset_pos = "locator2_patrol_soldier_06",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_06_move_",
    turn_target_prefix = "locator2_soldier_06_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_07",
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
    npc_name = "cm11_soldier_01_08",
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
    npc_name = "cm11_soldier_01_09",
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
    npc_name = "cm11_soldier_01_11",
    reset_pos = "locator2_patrol_soldier_11",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_11_move_",
    turn_target_prefix = "locator2_soldier_11_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_12",
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
    npc_name = "cm11_soldier_01_13",
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
    npc_name = "cm11_soldier_01_14",
    reset_pos = "locator2_patrol_soldier_14",
    spawn_security_level = 2,
    move_prefix = "locator2_soldier_14_move_",
    turn_target_prefix = "locator2_soldier_14_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_15",
    reset_pos = "locator2_patrol_soldier_15",
    spawn_security_level = 3,
    move_prefix = "locator2_soldier_15_move_",
    turn_target_prefix = "locator2_soldier_15_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_16",
    reset_pos = "locator2_patrol_soldier_16",
    spawn_security_level = 3,
    move_prefix = "locator2_soldier_16_move_",
    turn_target_prefix = "locator2_soldier_16_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_17",
    reset_pos = "locator2_patrol_soldier_17",
    spawn_security_level = 4,
    move_prefix = "locator2_soldier_17_move_",
    turn_target_prefix = "locator2_soldier_17_turn_target_",
    turn_interval_seconds = 1.5,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_18",
    reset_pos = "locator2_patrol_soldier_18",
    spawn_security_level = 4,
    move_prefix = "locator2_soldier_18_move_",
    turn_target_prefix = "locator2_soldier_18_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_19",
    reset_pos = "locator2_patrol_soldier_19",
    spawn_security_level = 4,
    move_prefix = "locator2_soldier_19_move_",
    turn_target_prefix = "locator2_soldier_19_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_20",
    reset_pos = "locator2_patrol_soldier_20",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_20_move_",
    turn_target_prefix = "locator2_soldier_20_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_21",
    reset_pos = "locator2_patrol_soldier_21",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_21_move_",
    turn_target_prefix = "locator2_soldier_21_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_22",
    reset_pos = "locator2_patrol_soldier_22",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_22_move_",
    turn_target_prefix = "locator2_soldier_22_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_23",
    reset_pos = "locator2_patrol_soldier_23",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_23_move_",
    turn_target_prefix = "locator2_soldier_23_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_24",
    reset_pos = "locator2_patrol_soldier_24",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_24_move_",
    turn_target_prefix = "locator2_soldier_24_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_25",
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
    npc_name = "cm11_soldier_01_26",
    reset_pos = "locator2_patrol_soldier_26",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_26_move_",
    turn_target_prefix = "locator2_soldier_26_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_27",
    reset_pos = "locator2_patrol_soldier_27",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_27_move_",
    turn_target_prefix = "locator2_soldier_27_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_28",
    reset_pos = "locator2_patrol_soldier_28",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_28_move_",
    turn_target_prefix = "locator2_soldier_28_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_29",
    reset_pos = "locator2_patrol_soldier_29",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_29_move_",
    turn_target_prefix = "locator2_soldier_29_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_30",
    reset_pos = "locator2_patrol_soldier_30",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_30_move_",
    turn_target_prefix = "locator2_soldier_30_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_31",
    reset_pos = "locator2_patrol_soldier_31",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_31_move_",
    turn_target_prefix = "locator2_soldier_31_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_32",
    reset_pos = "locator2_patrol_soldier_32",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_32_move_",
    turn_target_prefix = "locator2_soldier_32_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_33",
    reset_pos = "locator2_patrol_soldier_33",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_33_move_",
    turn_target_prefix = "locator2_soldier_33_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_34",
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
    npc_name = "cm11_soldier_01_35",
    reset_pos = "locator2_patrol_soldier_35",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_35_move_",
    turn_target_prefix = "locator2_soldier_35_turn_target_",
    turn_interval_seconds = 3,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_36",
    reset_pos = "locator2_patrol_soldier_36",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_36_move_",
    turn_target_prefix = "locator2_soldier_36_turn_target_",
    turn_interval_seconds = 2,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_37",
    reset_pos = "locator2_patrol_soldier_37",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_37_move_",
    turn_target_prefix = "locator2_soldier_37_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_38",
    reset_pos = "locator2_patrol_soldier_38",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_38_move_",
    turn_target_prefix = "locator2_soldier_38_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_39",
    reset_pos = "locator2_patrol_soldier_39",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_39_move_",
    turn_target_prefix = "locator2_soldier_39_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_40",
    reset_pos = "locator2_patrol_soldier_40",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_40_move_",
    turn_target_prefix = "locator2_soldier_40_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_41",
    reset_pos = "locator2_patrol_soldier_41",
    spawn_security_level = 1,
    move_prefix = "locator2_soldier_41_move_",
    turn_target_prefix = "locator2_soldier_41_turn_target_",
    turn_interval_seconds = 1,
    manage_res_box_group_idx = nil
  },
  {
    npc_name = "cm11_soldier_01_42",
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
enmgen2_landingship_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_01_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_01_01_01_01",
      target_vehicle = "landingship_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_01_01_01_02",
      target_vehicle = "landingship_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_01_01_01_03",
      target_vehicle = "landingship_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_01_01_01_04",
      target_vehicle = "landingship_01_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_01_01_02_01",
      target_vehicle = "landingship_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_01_01_02_02",
      target_vehicle = "landingship_01_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_01_01_02_03",
      target_vehicle = "landingship_01_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator_crew_01",
      name = "weak_01_01_02_04",
      target_vehicle = "landingship_01_01"
    }
  },
  onSpawn = function(A0_0, A1_1)
  end,
  onUpdate = function(A0_2)
    local L1_3
  end,
  onEnter = function(A0_4)
    local L1_5
  end,
  onLeave = function(A0_6)
    local L1_7
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      A0_12:getSpecTable().spawnSet[2].name,
      A0_12:getSpecTable().spawnSet[3].name,
      A0_12:getSpecTable().spawnSet[4].name,
      A0_12:getSpecTable().spawnSet[5].name,
      A0_12:getSpecTable().spawnSet[6].name,
      A0_12:getSpecTable().spawnSet[7].name
    }, 4, GEM_VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_landingship_02_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_02_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_02_01_01_01",
      target_vehicle = "landingship_02_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_02_01_02_01",
      target_vehicle = "landingship_02_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "mech_pilot_02_01_01_01",
      target_vehicle = "mech_02_01_01_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "mech_pilot_02_01_02_01",
      target_vehicle = "mech_02_01_02_01"
    }
  },
  onSpawn = function(A0_16, A1_17)
  end,
  onUpdate = function(A0_18)
    local L1_19
  end,
  onEnter = function(A0_20)
    local L1_21
  end,
  onLeave = function(A0_22)
    local L1_23
  end,
  onObjectAsh = function(A0_24, A1_25)
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onSetupGem = function(A0_28, A1_29)
    Fn_enemyPopGemSetup(A0_28, {
      A0_28:getSpecTable().spawnSet[2].name,
      A0_28:getSpecTable().spawnSet[3].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_30, A1_31)
    Fn_enemyAshPopGem(A0_30, A1_31)
  end
}
enmgen2_landingship_03_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_03_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_03_01_01_01",
      target_vehicle = "landingship_03_01"
    },
    {
      type = "mechsmall",
      locator = "locator_crew_01",
      name = "mech_03_01_02_01",
      target_vehicle = "landingship_03_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "mech_pilot_03_01_01_01",
      target_vehicle = "mech_03_01_01_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_crew_01",
      name = "mech_pilot_03_01_02_01",
      target_vehicle = "mech_03_01_02_01"
    }
  },
  onSpawn = function(A0_32, A1_33)
  end,
  onUpdate = function(A0_34)
    local L1_35
  end,
  onEnter = function(A0_36)
    local L1_37
  end,
  onLeave = function(A0_38)
    local L1_39
  end,
  onObjectAsh = function(A0_40, A1_41)
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onSetupGem = function(A0_44, A1_45)
    Fn_enemyPopGemSetup(A0_44, {
      A0_44:getSpecTable().spawnSet[2].name,
      A0_44:getSpecTable().spawnSet[3].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_46, A1_47)
    Fn_enemyAshPopGem(A0_46, A1_47)
  end
}
enmgen2_landingship_04_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "landingship",
      locator = "locator_landingship_01",
      name = "landingship_04_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_04_01_01_01",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_01_02",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_01_03",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator_crew_01",
      name = "weak_04_01_01_04",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "officer_launcher",
      locator = "locator_crew_01",
      name = "weak_04_01_02_01",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_02_02",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_crew_01",
      name = "weak_04_01_02_03",
      target_vehicle = "landingship_04_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator_crew_01",
      name = "weak_04_01_02_04",
      target_vehicle = "landingship_04_01"
    }
  },
  onSpawn = function(A0_48, A1_49)
  end,
  onUpdate = function(A0_50)
    local L1_51
  end,
  onEnter = function(A0_52)
    local L1_53
  end,
  onLeave = function(A0_54)
    local L1_55
  end,
  onObjectAsh = function(A0_56, A1_57)
  end,
  onObjectDead = function(A0_58, A1_59)
  end,
  onSetupGem = function(A0_60, A1_61)
    Fn_enemyPopGemSetup(A0_60, {
      A0_60:getSpecTable().spawnSet[2].name,
      A0_60:getSpecTable().spawnSet[3].name,
      A0_60:getSpecTable().spawnSet[4].name,
      A0_60:getSpecTable().spawnSet[5].name,
      A0_60:getSpecTable().spawnSet[6].name,
      A0_60:getSpecTable().spawnSet[7].name
    }, 4, GEM_VITAL)
  end,
  onPopGem = function(A0_62, A1_63)
    Fn_enemyAshPopGem(A0_62, A1_63)
  end
}
function Initialize()
  local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72, L9_73, L10_74, L11_75
  L0_64 = Fn_loadEventData
  L0_64(L1_65, L2_66, L3_67)
  L0_64 = {}
  L4_68 = 59
  L5_69 = 59
  L1_65.max = L2_66
  L1_65.start = L2_66
  L0_64.timer = L1_65
  L1_65.text = "ui_hud_counter_score_01"
  L1_65.start = 0
  L0_64.score = L1_65
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  L1_65(L2_66)
  while true do
    L4_68 = string
    L4_68 = L4_68.format
    L5_69 = "%02d"
    L4_68 = L4_68(L5_69, L6_70)
    L5_69 = "_"
    while true do
      L4_68 = findGameObject2
      L5_69 = "GimmickBg"
      L4_68 = L4_68(L5_69, L6_70)
      if L4_68 ~= nil then
        L5_69 = table
        L5_69 = L5_69.insert
        L5_69(L6_70, L7_71)
      else
        break
      end
    end
  end
  L2_66.type_str = "s"
  L2_66.add_point = L3_67
  L3_67.type_str = "m"
  L4_68 = RES_BOX_M_ADD_POINT
  L3_67.add_point = L4_68
  L4_68 = {}
  L4_68.type_str = "l"
  L5_69 = RES_BOX_L_ADD_POINT
  L4_68.add_point = L5_69
  while true do
    while true do
      L4_68 = nil
      L5_69 = 0
      for L9_73, L10_74 in L6_70(L7_71) do
        L11_75 = RES_BOX_NAME_PREFIX
        L11_75 = L11_75 .. L10_74.type_str .. "_" .. string.format("%02d", L2_66) .. "_" .. string.format("%02d", L3_67)
        L4_68 = findGameObject2("GimmickBg", L11_75)
        if L4_68 ~= nil then
          L5_69 = L10_74.add_point
          break
        end
      end
      if L4_68 ~= nil then
        L6_70(L7_71)
        if L6_70 == nil then
          L6_70[L2_66] = L7_71
        end
        L7_71.name = L8_72
        L7_71.hdl = L4_68
        L7_71.put_sensor = true
        L7_71.add_point = L5_69
        L7_71.break_pos_node = nil
        L7_71.grab = false
        L6_70[L3_67] = L7_71
      else
        break
      end
    end
    if not (L3_67 <= 1) then
      L4_68 = _resource_box_tbl
      L4_68 = L4_68[L2_66]
      L5_69 = L3_67 - 1
      L4_68.num = L5_69
    end
  end
  L4_68 = _resource_box_tbl
  L4_68 = L4_68[5]
  L5_69 = _resource_box_tbl
  L5_69 = L5_69[6]
  L10_74 = _resource_box_tbl
  L10_74 = L10_74[35]
  L11_75 = _resource_box_tbl
  L11_75 = L11_75[40]
  L4_68 = _resource_box_tbl
  L4_68 = L4_68[1]
  L5_69 = _resource_box_tbl
  L5_69 = L5_69[2]
  L10_74 = _resource_box_tbl
  L10_74 = L10_74[18]
  L11_75 = _resource_box_tbl
  L11_75 = L11_75[33]
  L4_68 = {
    L5_69,
    L6_70,
    L7_71,
    L8_72,
    L9_73,
    L10_74,
    L11_75,
    _resource_box_tbl[39],
    _resource_box_tbl[41]
  }
  L5_69 = _resource_box_tbl
  L5_69 = L5_69[7]
  L10_74 = _resource_box_tbl
  L10_74 = L10_74[31]
  L11_75 = _resource_box_tbl
  L11_75 = L11_75[32]
  L5_69 = {
    L6_70,
    L7_71,
    L8_72,
    L9_73,
    L10_74,
    L11_75,
    _resource_box_tbl[23],
    _resource_box_tbl[24],
    _resource_box_tbl[25],
    _resource_box_tbl[28],
    _resource_box_tbl[29],
    _resource_box_tbl[38]
  }
  L10_74 = _resource_box_tbl
  L10_74 = L10_74[19]
  L11_75 = _resource_box_tbl
  L11_75 = L11_75[20]
  _res_box_parted = L1_65
  for L4_68, L5_69 in L1_65(L2_66) do
    for L10_74, L11_75 in L7_71(L8_72) do
    end
    L7_71[L4_68] = L6_70
    L7_71[L4_68] = L6_70
  end
  L4_68 = true
  L2_66(L3_67, L4_68)
end
function Ingame()
  local L0_76, L1_77, L2_78, L3_79, L4_80, L5_81, L6_82, L7_83, L8_84
  L0_76()
  L0_76(L1_77, L2_78)
  L3_79 = THROW_FLYING_DURATION_SEC
  L0_76(L1_77, L2_78, L3_79)
  L3_79 = THROW_FREE_FALL_GRAVITY_ACCEL
  L0_76(L1_77, L2_78, L3_79)
  L0_76(L1_77)
  L3_79 = "ar"
  L1_77(L2_78)
  _landingship_enmgen_data_tbl = L0_76
  while true do
    while true do
      L3_79 = "EnemyGenerator"
      L4_80 = string
      L4_80 = L4_80.format
      L8_84 = L4_80(L5_81, L6_82, L7_83)
      if L2_78 ~= nil then
        L3_79 = _landingship_enmgen_data_tbl
        L3_79 = L3_79[L0_76]
        if L3_79 == nil then
          L3_79 = _landingship_enmgen_data_tbl
          L4_80 = {}
          L3_79[L0_76] = L4_80
        end
        L3_79 = nil
        L4_80 = L2_78.getSpecTable
        L4_80 = L4_80(L5_81)
        for L8_84, _FORV_9_ in L5_81(L6_82) do
          if _FORV_9_.type == "landingship" then
            L3_79 = _FORV_9_.name
            break
          end
        end
        L5_81.enmgen = L2_78
        L5_81.landingship_name = L3_79
        L5_81.landingship_pup = nil
        L8_84 = L5_81
        L6_82(L7_83, L8_84)
      else
        break
      end
    end
  end
  L0_76(L1_77)
  L0_76()
  L0_76(L1_77)
  L0_76(L1_77)
  L0_76()
  L0_76(L1_77)
  for L3_79, L4_80 in L0_76(L1_77) do
    for L8_84, _FORV_9_ in L5_81(L6_82) do
      _resource_box_tbl[L3_79][L8_84].hdl:setEventListener("dynamic", function(A0_85)
        local L1_86, L2_87, L3_88
        L2_87 = A0_85
        L1_86 = A0_85.getName
        L1_86 = L1_86(L2_87)
        L3_88 = A0_85
        L2_87 = A0_85.getDynamicObject
        L2_87 = L2_87(L3_88)
        L3_88 = L2_87.setName
        L3_88(L2_87, RES_BOX_DYN_NAME_PREFIX .. L1_86)
        L3_88 = createGameObject2
        L3_88 = L3_88("Node")
        L3_88:setName("locator2_" .. L1_86 .. "_break_pos")
        L2_87:appendChild(L3_88)
        L3_88:try_init()
        L3_88:waitForReady()
        L3_88:try_start()
        _resource_box_tbl[L3_79][L8_84].break_pos_node = L3_88
      end)
      _resource_box_tbl[L3_79][L8_84].hdl:setEventListener("broken", function(A0_89)
        local L1_90, L2_91, L3_92, L4_93, L5_94, L6_95, L7_96
        L1_90 = _resource_box_tbl
        L2_91 = L3_79
        L1_90 = L1_90[L2_91]
        L2_91 = L8_84
        L1_90 = L1_90[L2_91]
        L1_90 = L1_90.break_pos_node
        if L1_90 ~= nil then
          L2_91 = L1_90.getWorldPos
          L2_91 = L2_91(L3_92)
        elseif not L2_91 then
          L2_91 = A0_89.getWorldPos
          L2_91 = L2_91(L3_92)
        end
        if L3_92 ~= nil then
          L3_92(L4_93)
          L3_92.break_pos_node = nil
        end
        for L6_95, L7_96 in L3_92(L4_93) do
          _patrol_soldier_tbl[L6_95]:setNoticeSound(L2_91)
        end
        L3_92.num = L4_93
        L6_95 = "\n\230\174\139\227\129\163\227\129\166\227\130\139\230\149\176: "
        L7_96 = _resource_box_tbl
        L7_96 = L7_96[L3_79]
        L7_96 = L7_96.num
        L3_92(L4_93)
        for L6_95, L7_96 in L3_92(L4_93) do
          for _FORV_12_, _FORV_13_ in ipairs(L7_96) do
          end
          _parted_box_now_num_tbl[L6_95] = 0 + _FORV_13_.num
          print("\228\187\138\227\131\145\227\131\188\227\131\136[" .. L6_95 .. "]\230\174\139\227\129\163\227\129\166\227\130\139\231\183\143\230\149\176:" .. _parted_box_now_num_tbl[L6_95])
          if _parted_box_now_num_tbl[L6_95] < _parted_box_max_num_tbl[L6_95] / 2 then
            if 1 <= #_parted_box_respawn_tbl then
              for _FORV_13_, _FORV_14_ in ipairs(_parted_box_respawn_tbl) do
              end
            end
            if 0 + 1 == 0 then
              table.insert(_parted_box_respawn_tbl, L6_95)
              print("\227\131\145\227\131\188\227\131\136[" .. L6_95 .. "]\229\134\141\231\148\159\227\131\170\227\130\185\227\131\136\227\129\171\232\191\189\229\138\160, \228\187\138\229\134\141\231\148\159\229\190\133\227\129\161\227\129\174\230\149\176\227\129\175\239\188\154" .. #_parted_box_respawn_tbl)
            end
          end
        end
      end)
      break
    end
    break
  end
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  _is_out_of_range = false
  L1_77(L2_78)
  L1_77()
  L2_78.timer = true
  L2_78.score = true
  L3_79 = Fn_challengeStart
  L4_80 = L2_78
  L3_79(L4_80, L5_81, L6_82)
  L1_77()
  L3_79 = L1_77
  L4_80 = L1_77
  L2_78(L3_79, L4_80)
  L1_77()
  L1_77()
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  L1_77(L2_78)
  _is_out_of_range = false
  if L1_77 ~= nil then
    L3_79 = _alarm_se_handle
    L1_77(L2_78, L3_79)
    _alarm_se_handle = nil
  end
  L1_77()
  L1_77(L2_78)
  L1_77()
  L1_77()
end
function Finalize()
  local L0_97, L1_98, L2_99, L3_100, L4_101
  L0_97()
  L0_97()
  for L3_100, L4_101 in L0_97(L1_98) do
    for _FORV_8_, _FORV_9_ in pairs(L4_101) do
      _landingship_enmgen_data_tbl[L3_100][_FORV_8_].enmgen:requestAllEnemyKill()
    end
  end
  if L0_97 ~= nil then
    L0_97(L1_98, L2_99)
    _alarm_se_handle = nil
  end
  L0_97(L1_98, L2_99)
  L0_97(L1_98)
  L0_97(L1_98)
  L3_100 = false
  L1_98(L2_99, L3_100)
  L1_98(L2_99)
  L1_98()
  L1_98()
end
function gameLoop()
  local L0_102, L1_103, L2_104, L3_105, L4_106, L5_107
  L0_102 = {
    L1_103,
    L2_104,
    L3_105
  }
  L1_103 = {}
  L1_103.min_soldier_kill_count = 1
  L1_103.min_throw_out_point = 300
  L1_103.caption = "sm07_09051"
  L1_103.se = "ene_human_chase_1"
  L1_103.soldier_lost_sound_rate_sub = 25
  L2_104 = {}
  L2_104.min_soldier_kill_count = 3
  L2_104.min_throw_out_point = 700
  L2_104.caption = "sm07_09052"
  L2_104.se = "ene_officer_call_1"
  L2_104.soldier_lost_sound_rate_sub = 100
  L3_105 = {}
  L3_105.min_soldier_kill_count = 5
  L3_105.min_throw_out_point = 1500
  L3_105.caption = "sm07_09007"
  L3_105.se = "ene_officer_whistle_1"
  L3_105.soldier_lost_sound_rate_sub = 100
  function L1_103()
    Sound:playSE("m23_914c", 0.8)
    Fn_captionView("sm07_09009")
    _alarm_se_handle = Sound:playSEHandle("ep10_siren", 1, "", Fn_findAreaHandle("ar_a_root"))
  end
  function L2_104()
    _alarm_se_handle = Sound:playSEHandle("ep10_siren", 1, "", Fn_findAreaHandle("ar_a_root"))
    waitSeconds(1)
    Sound:playSE("m23_914c", 0.8)
    Fn_captionView("sm07_09009")
  end
  function L3_105()
    local L0_108, L1_109, L2_110, L3_111, L4_112, L5_113, L6_114, L7_115, L8_116
    L0_108 = HUD
    L1_109 = L0_108
    L0_108 = L0_108.setUserControlLock
    L2_110 = true
    L0_108(L1_109, L2_110)
    L0_108 = HUD
    L1_109 = L0_108
    L0_108 = L0_108.courseOutStart
    L0_108(L1_109)
    L0_108 = Fn_getPlayerWorldPos
    L0_108 = L0_108()
    L1_109 = {
      L2_110,
      L3_111,
      L4_112,
      L5_113,
      L6_114,
      L7_115
    }
    L2_110 = "warppoint2_restart_02_pc_01"
    L3_111 = "warppoint2_restart_02_pc_02"
    L7_115 = "warppoint2_restart_02_pc_06"
    L2_110, L3_111 = nil, nil
    for L7_115, L8_116 in L4_112(L5_113) do
      if findGameObject2("Node", L8_116) ~= nil then
        if L2_110 ~= nil then
          if L3_111 > Fn_get_distance(L0_108, findGameObject2("Node", L8_116):getWorldPos()) then
            L3_111, L2_110 = Fn_get_distance(L0_108, findGameObject2("Node", L8_116):getWorldPos()), L7_115
          end
        else
          L3_111, L2_110 = Fn_get_distance(L0_108, findGameObject2("Node", L8_116):getWorldPos()), L7_115
        end
      end
    end
    if L2_110 ~= nil then
      L4_112(L5_113)
    end
    L4_112()
  end
  L4_106 = false
  function L5_107()
    local L0_117, L1_118, L2_119, L3_120, L4_121, L5_122
    _is_in_bomb_sensor = false
    L0_117 = Fn_pcSensorOn
    L1_118 = "pccubesensormulti2_force_find_01"
    L0_117(L1_118)
    L0_117 = invokeTask
    function L1_118()
      local L0_123, L1_124, L2_125, L3_126
      L0_123 = false
      L1_124 = false
      L2_125 = false
      while true do
        L2_125 = L1_124
        L3_126 = Pad
        L3_126 = L3_126.getButton
        L3_126 = L3_126(L3_126, Pad.kButton_RR)
        L1_124 = L3_126
        if L0_123 == true and L2_125 == false and L1_124 == true then
          L3_126 = Fn_getPlayerWorldPos
          L3_126 = L3_126()
          for _FORV_7_, _FORV_8_ in pairs(_patrol_soldier_tbl) do
            _patrol_soldier_tbl[_FORV_7_]:setNoticeSound(L3_126)
          end
        end
        L3_126 = Player
        L3_126 = L3_126.getGrabObjectCount
        L3_126 = L3_126(L3_126)
        L0_123 = L3_126 > 0
        L3_126 = wait
        L3_126()
      end
    end
    L0_117 = L0_117(L1_118)
    L1_118 = invokeTask
    function L2_119()
      local L0_127, L1_128, L2_129, L3_130, L4_131, L5_132, L6_133
      while true do
        L0_127 = wait
        L0_127()
        L0_127 = _security_level
        if L0_127 <= L1_128 then
          L0_127 = _security_level
          L0_127 = L0_102[L0_127]
          if L1_128 ~= nil then
          end
          if not (L1_128 <= L2_129) then
            if L1_128 ~= nil then
            end
          elseif L1_128 <= L2_129 then
            _security_level = L1_128
            L1_128(L2_129, L3_130)
            if L1_128 ~= nil then
              L4_131 = 1
              L1_128(L2_129, L3_130, L4_131)
            end
            L1_128(L2_129)
            for L4_131, L5_132 in L1_128(L2_129) do
              L6_133 = _patrol_soldier_tbl
              L6_133 = L6_133[L4_131]
              L6_133 = L6_133.getLostSoundRate
              L6_133 = L6_133(L6_133)
              L6_133 = L6_133 - L0_127.soldier_lost_sound_rate_sub
              _patrol_soldier_tbl[L4_131]:setLostSoundRate(L6_133)
            end
          end
        end
      end
    end
    L1_118 = L1_118(L2_119)
    L2_119 = 0
    L3_120 = true
    while true do
      L4_121 = HUD
      L4_121 = L4_121.timerGetSecond
      L4_121 = L4_121(L5_122)
      if L4_121 > 0 then
        L4_121 = wait
        L4_121()
        L4_121 = _is_found
        if L4_121 ~= true then
          L4_121 = _is_out_of_range
          if L4_121 ~= true then
            L4_121 = _is_in_bomb_sensor
            if L4_121 == true then
              L4_121 = math
              L4_121 = L4_121.min
              L4_121 = L4_121(L5_122, RAC_CautionLevel.MAX_LEVEL)
              L2_119 = L4_121
              if L3_120 == true then
                L4_121 = L4_106
                if L4_121 == false then
                  L4_121 = Sound
                  L4_121 = L4_121.playSE
                  L4_121(L5_122, "m25_903", 0.8)
                  L4_121 = Fn_captionView
                  L4_121(L5_122)
                  L3_120 = false
                end
              end
            else
              L4_121 = math
              L4_121 = L4_121.max
              L4_121 = L4_121(L5_122, 0)
              L2_119 = L4_121
              L3_120 = true
            end
            L4_121 = RAC_CautionLevel
            L4_121 = L4_121.setValueLimitRange
            L4_121(L5_122)
            L4_121 = RAC_CautionLevel
            L4_121 = L4_121.MAX_LEVEL
          end
        end
      end
      if not (L2_119 >= L4_121) then
        L4_121 = HUD
        L4_121 = L4_121.counter999SetNum
        L4_121(L5_122, _res_throw_out_point)
      end
    end
    L4_121 = _is_found
    if L4_121 == true then
      L4_121 = L4_106
      if L4_121 == false then
        L4_121 = L1_103
        L4_121()
        L4_121 = true
        L4_106 = L4_121
      end
    else
      L4_121 = _is_in_bomb_sensor
      if L4_121 == true then
        L4_121 = L4_106
        if L4_121 == false then
          L4_121 = L2_104
          L4_121()
          L4_121 = true
          L4_106 = L4_121
        end
      else
        L4_121 = _is_out_of_range
        if L4_121 == true then
          L4_121 = L3_105
          L4_121()
          L4_121 = L1_118.abort
          L4_121(L5_122)
          L1_118 = nil
          L4_121 = false
          return L4_121
        end
      end
    end
    L4_121 = L1_118.abort
    L4_121(L5_122)
    L1_118 = nil
    L4_121 = L0_117.abort
    L4_121(L5_122)
    L0_117 = nil
    L4_121 = HUD
    L4_121 = L4_121.timerGetSecond
    L4_121 = L4_121(L5_122)
    if L4_121 > 0 then
      L4_121 = RAC_CautionLevel
      L4_121 = L4_121.setValueLimitRange
      L4_121(L5_122)
      L4_121 = nil
      function L5_122.update(A0_134)
        local L1_135
        L1_135 = false
        while true do
          if _is_in_bomb_sensor == true then
            if L1_135 == false then
              print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\191\142\230\146\131\233\150\139\229\167\139")
              Fn_IdlingMechCannon(false)
              Fn_MechCannonEndBlankMode()
              L1_135 = true
            end
          elseif L1_135 == true then
            print("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\191\142\230\146\131\231\181\130\228\186\134")
            Fn_IdlingMechCannon(true)
            Fn_MechCannonShotClear()
            L1_135 = false
          end
          wait()
        end
      end
      function L5_122.destractor(A0_136)
        Fn_IdlingMechCannon(true)
        Fn_MechCannonShotClear()
      end
      L4_121 = RAC_InvokeTaskWithDestractor(L5_122.update, L5_122.destractor, L5_122)
      for _FORV_8_, _FORV_9_ in L5_122(_patrol_soldier_tbl) do
        _patrol_soldier_tbl[_FORV_8_]:setCombatTimeEnable(false)
        _patrol_soldier_tbl[_FORV_8_]:setAlert()
      end
      while 0 < HUD:timerGetSecond() do
        wait()
        if _is_out_of_range ~= true then
          HUD:counter999SetNum(_res_throw_out_point)
        end
      end
      L5_122:abort()
      L4_121:abort()
      L4_121 = nil
    end
    L4_121 = Fn_pcSensorOff
    L4_121(L5_122)
    _is_in_bomb_sensor = false
    L4_121 = _is_out_of_range
    if L4_121 == true then
      L4_121 = L3_105
      L4_121()
      L4_121 = false
      return L4_121
    end
    L4_121 = true
    return L4_121
  end
  while true do
    if L5_107() == false then
    end
  end
end
function soldierChangeStateCallback(A0_137, A1_138, A2_139, A3_140, A4_141)
  local L5_142
  if A1_138 == L5_142 then
    L5_142(L5_142, "m25_903", 1, "", Fn_findNpcPuppet(A0_137))
    L5_142("sm07_09011")
  elseif A1_138 == L5_142 then
    Sound:playSE("m25_903", 1, "", Fn_findNpcPuppet(A0_137))
    Fn_captionView(L5_142[RandI(1, #L5_142)])
  elseif A1_138 == L5_142 then
    if L5_142 == true then
      for _FORV_9_, _FORV_10_ in pairs(_patrol_soldier_tbl) do
        if _FORV_9_ ~= A0_137 and _FORV_10_:getStatus() == NPC_STATUS.SOUND_CAUTION then
          break
        end
      end
    end
    if L5_142 == true then
      Sound:playSE("m25_903", 1, "", Fn_findNpcPuppet(A0_137))
      Fn_captionView("sm07_09015")
    end
  elseif A1_138 == L5_142 then
    _patrol_soldier_tbl[A0_137]:setLostSoundRate(L5_142)
    Sound:playSE("m25_930b", 1, "", Fn_findNpcPuppet(A0_137))
    Fn_captionView("sm07_09016")
  elseif A1_138 == L5_142 then
    L5_142(L5_142, 0)
    L5_142(L5_142, "m25_923b", 1, "", Fn_findNpcPuppet(A0_137))
    L5_142("sm07_09040")
  elseif A1_138 == L5_142 then
    if A4_141 ~= A1_138 then
      Sound:playSE("m23_914c", 1, "", Fn_findNpcPuppet(A0_137))
      Fn_captionView(L5_142[RandI(1, #L5_142)])
    end
  elseif A1_138 == L5_142 then
    if A4_141 ~= L5_142 then
      Sound:playSE(L5_142[RandI(1, #L5_142)].se, 1, "", Fn_findNpcPuppet(A0_137))
      Fn_captionView(L5_142[RandI(1, #L5_142)].cap)
    end
  elseif A1_138 == L5_142 then
    if A4_141 ~= L5_142 then
      Sound:playSE(L5_142[RandI(1, #L5_142)].se, 1, "", Fn_findNpcPuppet(A0_137))
      Fn_captionView(L5_142[RandI(1, #L5_142)].cap)
    end
  elseif A1_138 == L5_142 then
    Sound:playSE("ene_human_damaged_m25", 1, "", Fn_findNpcPuppet(A0_137))
    Fn_captionView(L5_142[RandI(1, #L5_142)])
  elseif A1_138 == L5_142 then
    for _FORV_8_, _FORV_9_ in L5_142(_patrol_soldier_tbl) do
      _patrol_soldier_tbl[_FORV_8_]:setIndicationEnable(true)
    end
  elseif A1_138 == L5_142 then
    if 0 < L5_142:getHealth() then
      _is_found = true
    end
  elseif A1_138 == L5_142 then
    for _FORV_9_, _FORV_10_ in pairs(_patrol_soldier_tbl) do
      if _FORV_9_ ~= A0_137 and _FORV_10_:getStatus() == NPC_STATUS.BEGIN_COMBAT then
        break
      end
    end
    if L5_142 == true then
      for _FORV_9_, _FORV_10_ in pairs(_patrol_soldier_tbl) do
        _patrol_soldier_tbl[_FORV_9_]:setIndicationEnable(false)
      end
    end
    _soldier_kill_count = _soldier_kill_count + 1
  elseif A1_138 == L5_142 then
  end
end
function deletePatrolSoldier()
  local L0_143, L1_144, L2_145, L3_146, L4_147, L5_148
  L0_143 = endSoldierPatrol
  L0_143()
  L0_143 = {}
  for L4_147, L5_148 in L1_144(L2_145) do
    table.insert(L0_143, L4_147)
  end
  _patrol_pup_tbl = L1_144
  if L1_144 > 0 then
    for L4_147, L5_148 in L1_144(L2_145) do
      if Fn_findNpcPuppet(L5_148) ~= nil then
        Fn_setGrabReleaseNpc(L5_148)
        Fn_disappearNpc(L5_148)
      end
    end
    L1_144()
  end
end
function createPatrolSoldier(A0_149)
  local L1_150, L2_151, L3_152, L4_153, L5_154
  L1_150 = deletePatrolSoldier
  L1_150()
  L1_150 = {
    L2_151,
    L3_152,
    L4_153,
    L5_154,
    {
      name = "cm11_soldier_01_05",
      type = "soldier",
      node = "locator2_patrol_soldier_05",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_06",
      type = "soldier",
      node = "locator2_patrol_soldier_06",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_07",
      type = "soldier",
      node = "locator2_patrol_soldier_07",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_08",
      type = "soldier",
      node = "locator2_patrol_soldier_08",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_09",
      type = "soldier",
      node = "locator2_patrol_soldier_09",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_10",
      type = "soldier",
      node = "locator2_patrol_soldier_10",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_11",
      type = "soldier",
      node = "locator2_patrol_soldier_11",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_12",
      type = "soldier",
      node = "locator2_patrol_soldier_12",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_13",
      type = "soldier",
      node = "locator2_patrol_soldier_13",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_14",
      type = "soldier",
      node = "locator2_patrol_soldier_14",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_15",
      type = "soldier",
      node = "locator2_patrol_soldier_15",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_16",
      type = "soldier",
      node = "locator2_patrol_soldier_16",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_17",
      type = "soldier",
      node = "locator2_patrol_soldier_17",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_18",
      type = "soldier",
      node = "locator2_patrol_soldier_18",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_19",
      type = "soldier",
      node = "locator2_patrol_soldier_19",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_20",
      type = "soldier",
      node = "locator2_patrol_soldier_20",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_21",
      type = "soldier",
      node = "locator2_patrol_soldier_21",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_22",
      type = "soldier",
      node = "locator2_patrol_soldier_22",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_23",
      type = "soldier",
      node = "locator2_patrol_soldier_23",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_24",
      type = "soldier",
      node = "locator2_patrol_soldier_24",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_25",
      type = "soldier",
      node = "locator2_patrol_soldier_25",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_26",
      type = "soldier",
      node = "locator2_patrol_soldier_26",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_27",
      type = "soldier",
      node = "locator2_patrol_soldier_27",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_28",
      type = "soldier",
      node = "locator2_patrol_soldier_28",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_29",
      type = "soldier",
      node = "locator2_patrol_soldier_29",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_30",
      type = "soldier",
      node = "locator2_patrol_soldier_30",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_31",
      type = "soldier",
      node = "locator2_patrol_soldier_31",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_32",
      type = "soldier",
      node = "locator2_patrol_soldier_32",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_33",
      type = "soldier",
      node = "locator2_patrol_soldier_33",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_34",
      type = "soldier",
      node = "locator2_patrol_soldier_34",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_35",
      type = "soldier",
      node = "locator2_patrol_soldier_35",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_36",
      type = "soldier",
      node = "locator2_patrol_soldier_36",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_37",
      type = "soldier",
      node = "locator2_patrol_soldier_37",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_38",
      type = "soldier",
      node = "locator2_patrol_soldier_38",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_39",
      type = "soldier",
      node = "locator2_patrol_soldier_39",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_40",
      type = "soldier",
      node = "locator2_patrol_soldier_40",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_41",
      type = "soldier",
      node = "locator2_patrol_soldier_41",
      active = false,
      start = A0_149
    },
    {
      name = "cm11_soldier_01_42",
      type = "soldier",
      node = "locator2_patrol_soldier_42",
      active = false,
      start = A0_149
    }
  }
  L2_151.name = "cm11_soldier_01_01"
  L2_151.type = "soldier"
  L2_151.node = "locator2_patrol_soldier_01"
  L2_151.active = false
  L2_151.start = A0_149
  L3_152.name = "cm11_soldier_01_02"
  L3_152.type = "soldier"
  L3_152.node = "locator2_patrol_soldier_02"
  L3_152.active = false
  L3_152.start = A0_149
  L4_153.name = "cm11_soldier_01_03"
  L4_153.type = "soldier"
  L4_153.node = "locator2_patrol_soldier_03"
  L4_153.active = false
  L4_153.start = A0_149
  L5_154 = {}
  L5_154.name = "cm11_soldier_01_04"
  L5_154.type = "soldier"
  L5_154.node = "locator2_patrol_soldier_04"
  L5_154.active = false
  L5_154.start = A0_149
  L2_151(L3_152)
  for L5_154, _FORV_6_ in L2_151(L3_152) do
    _patrol_pup_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  for L5_154, _FORV_6_ in L2_151(L3_152) do
    Fn_loadNpcEventMotion(L5_154, {
      "man57_lookaround_00"
    })
  end
end
function startSoldierPatrol(A0_155)
  local L1_156, L2_157, L3_158, L4_159, L5_160
  for L4_159, L5_160 in L1_156(L2_157) do
    if _patrol_soldier_tbl[L5_160.npc_name] == nil and L5_160.spawn_security_level <= _security_level then
      _patrol_soldier_spawn_task_tbl[L5_160.npc_name] = invokeTask(function()
        local L0_161, L1_162, L2_163, L3_164, L4_165, L5_166, L6_167
        L0_161 = A0_155
        if L0_161 == true then
          L0_161 = findGameObject2
          L1_162 = "Node"
          L2_163 = L5_160.reset_pos
          L0_161 = L0_161(L1_162, L2_163)
          while true do
            L1_162 = Fn_isInSightTarget
            L2_163 = L0_161
            L3_164 = 1
            L1_162 = L1_162(L2_163, L3_164)
            if L1_162 == true then
              L1_162 = RAC_RaycastEyeSight
              L2_163 = L0_161
              L3_164 = Fn_getDistanceToPlayer
              L4_165 = L0_161
              L3_164 = L3_164(L4_165)
              L3_164 = L3_164 + 1
              L4_165 = 180
              L5_166 = 1.5
              L6_167 = 1
              L1_162 = L1_162(L2_163, L3_164, L4_165, L5_166, L6_167)
            end
            if L1_162 == true then
              L1_162 = wait
              L2_163 = RandI
              L3_164 = 2
              L4_165 = 5
              L6_167 = L2_163(L3_164, L4_165)
              L1_162(L2_163, L3_164, L4_165, L5_166, L6_167, L2_163(L3_164, L4_165))
            end
          end
        end
        L0_161 = Fn_setNpcActive
        L1_162 = L5_160.npc_name
        L2_163 = true
        L0_161(L1_162, L2_163)
        L0_161 = RAC_PerceivableNpc
        L0_161 = L0_161.new
        L1_162 = L5_160.npc_name
        L0_161 = L0_161(L1_162)
        L1_162 = {}
        L2_163 = 1
        while true do
          L3_164 = 1
          while true do
            L4_165 = findGameObject2
            L5_166 = "Node"
            L6_167 = L5_160.move_prefix
            L6_167 = L6_167 .. string.format("%02d", L2_163) .. "_" .. string.format("%02d", L3_164)
            L4_165 = L4_165(L5_166, L6_167)
            if L4_165 ~= nil then
              L5_166 = L1_162[L2_163]
              if L5_166 == nil then
                L5_166 = {}
                L1_162[L2_163] = L5_166
              end
              L5_166 = table
              L5_166 = L5_166.insert
              L6_167 = L1_162[L2_163]
              L5_166(L6_167, {
                pos = L4_165:getName(),
                opt = nil
              })
            else
              break
            end
            L3_164 = L3_164 + 1
          end
          if not (L3_164 <= 1) then
            L2_163 = L2_163 + 1
          end
        end
        L3_164 = #L1_162
        if L3_164 <= 0 then
          L3_164 = {L4_165}
          L4_165 = {}
          L5_166 = L5_160.reset_pos
          L4_165.pos = L5_166
          L4_165.opt = nil
          L1_162[1] = L3_164
        end
        L3_164 = L0_161
        L2_163 = L0_161.setPosList
        L4_165 = L1_162
        L2_163(L3_164, L4_165)
        L3_164 = L0_161
        L2_163 = L0_161.setMoveOption
        L4_165 = {}
        L4_165.arrivedLength = 1
        L4_165.runLength = 10000
        L4_165.recast = true
        L2_163(L3_164, L4_165)
        L2_163 = {}
        L3_164 = L5_160.turn_target_prefix
        if L3_164 ~= nil then
          L3_164 = #L1_162
          L4_165 = 1
          while true do
            L5_166 = 1
            while true do
              L6_167 = findGameObject2
              L6_167 = L6_167("Node", L5_160.turn_target_prefix .. string.format("%02d", L4_165) .. "_" .. string.format("%02d", L5_166))
              if L6_167 ~= nil then
                if L2_163[L4_165] == nil then
                  L2_163[L4_165] = {}
                end
                table.insert(L2_163[L4_165], L6_167)
              else
                break
              end
              L5_166 = L5_166 + 1
            end
            if not (L5_166 <= 1) or not (L3_164 <= L4_165) then
              L4_165 = L4_165 + 1
            end
          end
        end
        L4_165 = L0_161
        L3_164 = L0_161.setTurnList
        L5_166 = L2_163
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setManageResGroupList
        L5_166 = L5_160.manage_res_box_group_idx
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setCheckResLostFnc
        function L5_166(A0_168)
          for _FORV_5_, _FORV_6_ in ipairs(_resource_box_tbl[A0_168]) do
            ;({})[_FORV_5_] = _FORV_6_.put_sensor == false or _FORV_6_.hdl:isGrabbed() == true
          end
          return {}
        end
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setChaseMoveOption
        L5_166 = nil
        L3_164(L4_165, L5_166)
        L3_164 = #L2_163
        if L3_164 > 0 then
          L4_165 = L0_161
          L3_164 = L0_161.setAfterMoveWaitTime
          L5_166 = 0
          L3_164(L4_165, L5_166)
          L4_165 = L0_161
          L3_164 = L0_161.setTurnIntervalTime
          L5_166 = 30
          L3_164(L4_165, L5_166)
        else
          L4_165 = L0_161
          L3_164 = L0_161.setAfterMoveWaitTime
          L5_166 = 30
          L3_164(L4_165, L5_166)
        end
        L4_165 = L0_161
        L3_164 = L0_161.setLoop
        L5_166 = true
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setSightParam2
        L5_166 = SOLDIER_SIGHT_H_DEG
        L6_167 = SOLDIER_SIGHT_V_DEG
        L3_164(L4_165, L5_166, L6_167, SOLDIER_SIGHT_LEN)
        L4_165 = L0_161
        L3_164 = L0_161.setCautionCoefficient
        L5_166 = SOLDIER_CAUTION_INC_COEFFICENT
        L6_167 = SOLDIER_CAUTION_DEC_COEFFICENT
        L3_164(L4_165, L5_166, L6_167)
        L4_165 = L0_161
        L3_164 = L0_161.setOnChangeState
        L5_166 = soldierChangeStateCallback
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setCombatReady
        L5_166 = true
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setCombatTimeEnable
        L5_166 = true
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setCombatTime
        L5_166 = 5
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setCombatTimeoutCallbackOnly
        L5_166 = true
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setIndicationEnable
        L5_166 = false
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setIndicationRange
        L5_166 = SOLDIER_INDICATION_LEN
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setIndicationCoefficient
        L5_166 = SOLDIER_INDICATION_INC_COEFFICENT
        L6_167 = SOLDIER_INDICATION_DEC_COEFFICENT
        L3_164(L4_165, L5_166, L6_167)
        L4_165 = L0_161
        L3_164 = L0_161.setDamageType
        L5_166 = 1
        L6_167 = nil
        L3_164(L4_165, L5_166, L6_167)
        L4_165 = L0_161
        L3_164 = L0_161.setCombatGrabEnable
        L5_166 = true
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setDismissMotion
        L5_166 = "man57_lookaround_00"
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setResCautionMotion
        L5_166 = "man57_lookaround_00"
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.setSoundCautionMotion
        L5_166 = "man57_lookaround_00"
        L3_164(L4_165, L5_166)
        L4_165 = L0_161
        L3_164 = L0_161.action
        L3_164(L4_165)
        L3_164 = _patrol_soldier_tbl
        L4_165 = L5_160.npc_name
        L3_164[L4_165] = L0_161
      end)
    else
    end
  end
end
function endSoldierPatrol()
  for _FORV_3_, _FORV_4_ in pairs(_patrol_soldier_spawn_task_tbl) do
    _patrol_soldier_spawn_task_tbl[_FORV_3_]:abort()
  end
  _patrol_soldier_spawn_task_tbl = {}
  for _FORV_3_, _FORV_4_ in pairs(_patrol_soldier_tbl) do
    _patrol_soldier_tbl[_FORV_3_]:terminate()
    _patrol_soldier_tbl[_FORV_3_]:taskAbort()
  end
  _patrol_soldier_tbl = {}
end
function invokeLandingshipStartTask()
  return invokeTask(function()
    local L0_169, L1_170, L2_171, L3_172, L4_173, L5_174, L6_175, L7_176, L8_177, L9_178, L10_179, L11_180, L12_181, L13_182, L14_183, L15_184, L16_185, L17_186, L18_187, L19_188, L20_189, L21_190
    for L3_172, L4_173 in L0_169(L1_170) do
      for L8_177, L9_178 in L5_174(L6_175) do
        L10_179 = _landingship_enmgen_data_tbl
        L10_179 = L10_179[L3_172]
        L10_179 = L10_179[L8_177]
        L10_179 = L10_179.enmgen
        L11_180 = L10_179
        L10_179 = L10_179.requestPrepare
        L10_179(L11_180)
      end
    end
    for L3_172, L4_173 in L0_169(L1_170) do
      for L8_177, L9_178 in L5_174(L6_175) do
        while true do
          L10_179 = L9_178.enmgen
          L11_180 = L10_179
          L10_179 = L10_179.isPrepared
          L10_179 = L10_179(L11_180)
          if L10_179 == false then
            L10_179 = wait
            L10_179()
          end
        end
      end
    end
    for L3_172, L4_173 in L0_169(L1_170) do
      if L5_174 ~= nil then
        L5_174(L6_175)
      end
      for L8_177, L9_178 in L5_174(L6_175) do
        L10_179 = _landingship_enmgen_data_tbl
        L10_179 = L10_179[L3_172]
        L10_179 = L10_179[L8_177]
        L10_179 = L10_179.enmgen
        L11_180 = L10_179
        L10_179 = L10_179.requestSpawn
        L10_179(L11_180)
        L10_179 = _landingship_enmgen_data_tbl
        L10_179 = L10_179[L3_172]
        L10_179 = L10_179[L8_177]
        L11_180 = findGameObject2
        L12_181 = "Puppet"
        L13_182 = L9_178.landingship_name
        L11_180 = L11_180(L12_181, L13_182)
        L10_179.landingship_pup = L11_180
        L10_179 = _landingship_enmgen_data_tbl
        L10_179 = L10_179[L3_172]
        L10_179 = L10_179[L8_177]
        L10_179 = L10_179.landingship_pup
        L11_180 = L10_179
        L10_179 = L10_179.getBrain
        L10_179 = L10_179(L11_180)
        L12_181 = L10_179
        L11_180 = L10_179.setVisibleEnemyMarker
        L13_182 = false
        L11_180(L12_181, L13_182)
      end
      for L8_177, L9_178 in L5_174(L6_175) do
        L10_179 = print
        L11_180 = "\229\188\183\232\165\178\230\143\154\233\153\184\232\137\166\231\167\187\229\139\149\233\150\139\229\167\139\239\188\154"
        L12_181 = L9_178.landingship_name
        L11_180 = L11_180 .. L12_181
        L10_179(L11_180)
        L10_179 = _landingship_enmgen_data_tbl
        L10_179 = L10_179[L3_172]
        L10_179 = L10_179[L8_177]
        L10_179 = L10_179.landingship_pup
        L11_180 = L10_179
        L10_179 = L10_179.getBrain
        L10_179 = L10_179(L11_180)
        L11_180 = ""
        L12_181 = ""
        L13_182 = L9_178.enmgen
        L13_182 = L13_182.getSpecTable
        L13_182 = L13_182(L14_183)
        for L17_186, L18_187 in L14_183(L15_184) do
          L19_188 = L18_187.type
          if L19_188 ~= "landingship" then
            L19_188 = L18_187.target_vehicle
            L20_189 = L9_178.landingship_name
            if L19_188 ~= L20_189 then
            else
              L19_188 = L18_187.type
              if L19_188 == "mechsmall" then
                if L12_181 == "" then
                  L19_188 = string
                  L19_188 = L19_188.sub
                  L20_189 = L18_187.name
                  L21_190 = 1
                  L19_188 = L19_188(L20_189, L21_190, -12)
                  L12_181 = L19_188
                end
              elseif L11_180 == "" then
                L19_188 = string
                L19_188 = L19_188.sub
                L20_189 = L18_187.name
                L21_190 = 1
                L19_188 = L19_188(L20_189, L21_190, -12)
                L11_180 = L19_188
              end
            end
          end
          if L11_180 == "" or L12_181 == "" then
          end
        end
        L17_186 = 3
        L18_187 = L14_183
        L19_188 = 1
        L20_189 = 1
        function L21_190(A0_191)
          local L1_192, L2_193
          L1_192 = A0_191.state
          if L1_192 == "wait" then
            L1_192 = L18_187
            L2_193 = L14_183
            if L1_192 ~= L2_193 then
              L1_192 = L18_187
              L2_193 = L15_184
              if L1_192 ~= L2_193 then
                L1_192 = L18_187
                L2_193 = L16_185
              end
            elseif L1_192 == L2_193 then
              L1_192 = {}
              A0_191.movePoint = L1_192
              L1_192 = 1
              while true do
                L2_193 = nil
                if L18_187 == L14_183 then
                  L2_193 = findGameObject2("Node", "locator2_" .. string.format("%s_move_%s_%02d_%02d", L9_178.landingship_name, "a", L19_188, L1_192))
                  if L1_192 == 1 and L2_193 == nil then
                    L18_187 = L15_184
                    L20_189 = 1
                  end
                end
                if L18_187 == L15_184 then
                  L2_193 = findGameObject2("Node", "locator2_" .. string.format("%s_move_%s_%02d_%02d", L9_178.landingship_name, "b", L20_189, L1_192))
                  if L1_192 == 1 and L2_193 == nil then
                    L18_187 = L16_185
                  end
                end
                if L18_187 == L16_185 then
                  L2_193 = findGameObject2("Node", "locator2_" .. string.format("%s_move_%s_%02d", L9_178.landingship_name, "c", L1_192))
                end
                if L2_193 ~= nil then
                  print(L2_193:getName())
                  table.insert(A0_191.movePoint, L2_193:getName())
                else
                  break
                end
                L1_192 = L1_192 + 1
              end
              L2_193 = A0_191.movePoint
              L2_193 = #L2_193
              if L2_193 > 0 then
                A0_191.changeState = "move"
              else
                L2_193 = print
                L2_193(L9_178.landingship_name .. " landingship move error")
              end
            end
          else
            L1_192 = A0_191.state
            if L1_192 == "moveEnd" then
              L1_192 = L18_187
              L2_193 = L14_183
              if L1_192 == L2_193 then
                L1_192 = L9_178.enmgen
                L2_193 = L1_192
                L1_192 = L1_192.getSpecTable
                L1_192 = L1_192(L2_193)
                L2_193 = L12_181
                L2_193 = L2_193 .. string.format("%02d_%02d_%02d_", L3_172, L8_177, L19_188)
                A0_191.dropEnemy = {}
                for _FORV_6_, _FORV_7_ in ipairs(L1_192.spawnSet) do
                  if _FORV_7_.type == "mechsmall" and string.sub(_FORV_7_.name, 1, -3) == L2_193 then
                    table.insert(A0_191.dropEnemy, _FORV_7_.name)
                  end
                end
                if 0 < #A0_191.dropEnemy then
                  A0_191.changeState = "drop"
                  L19_188 = L19_188 + 1
                  print(L9_178.landingship_name .. " drop")
                else
                  print(L9_178.landingship_name .. " landingship drop error")
                end
              else
                L1_192 = L18_187
                L2_193 = L15_184
                if L1_192 == L2_193 then
                  L1_192 = {}
                  A0_191.dropEnemy = L1_192
                  L1_192 = L9_178.enmgen
                  L2_193 = L1_192
                  L1_192 = L1_192.getSpecTable
                  L1_192 = L1_192(L2_193)
                  L2_193 = L11_180
                  L2_193 = L2_193 .. string.format("%02d_%02d_%02d_", L3_172, L8_177, L20_189)
                  for _FORV_6_, _FORV_7_ in ipairs(L1_192.spawnSet) do
                    if _FORV_7_.type == "landingship" or _FORV_7_.type == "mechsmall" or _FORV_7_.target_vehicle ~= L9_178.landingship_name then
                    elseif string.sub(_FORV_7_.name, 1, -3) == L2_193 then
                      table.insert(A0_191.dropEnemy, _FORV_7_.name)
                    end
                  end
                  if 0 < #A0_191.dropEnemy then
                    A0_191.changeState = "open"
                    L20_189 = L20_189 + 1
                    print(L9_178.landingship_name .. " open")
                  else
                    print(L9_178.landingship_name .. " landingship open error")
                  end
                else
                  L1_192 = L18_187
                  L2_193 = L16_185
                  if L1_192 == L2_193 then
                    L1_192 = L17_186
                    L18_187 = L1_192
                    L1_192 = L10_179
                    L2_193 = L1_192
                    L1_192 = L1_192.setEventListener
                    L1_192(L2_193, "enemy_landingship_event", nil)
                  end
                end
              end
            else
              L1_192 = A0_191.state
              if L1_192 == "dropEnd" then
              else
                L1_192 = A0_191.state
                if L1_192 == "openEnd" then
                end
              end
            end
          end
          return A0_191
        end
        L10_179:setEventListener("enemy_landingship_event", L21_190)
        do break end
        break
      end
      break
    end
  end)
end
function setResBoxPutSensor(A0_194, A1_195, A2_196)
  if _resource_box_tbl[A0_194] ~= nil and string.match(A1_195, RES_BOX_DYN_NAME_PREFIX .. "(.+)") ~= nil then
    for _FORV_7_, _FORV_8_ in ipairs(_resource_box_tbl[A0_194]) do
      if string.match(A1_195, RES_BOX_DYN_NAME_PREFIX .. "(.+)") == _FORV_8_.name then
        _resource_box_tbl[A0_194][_FORV_7_].put_sensor = A2_196
        break
      end
    end
  end
end
function cubesensor2_throw_out_01_OnEnter(A0_197, A1_198)
  local L2_199, L3_200
  L2_199 = "nil"
  if A1_198 then
    L3_200 = A1_198.getName
    L3_200 = L3_200(A1_198)
    if L3_200 then
      L2_199 = L3_200
    else
      L2_199 = "nilname"
    end
  end
  L3_200 = "nil"
  if A1_198:getParent() then
    if A1_198:getParent():getName() then
      L3_200 = A1_198:getParent():getName()
    else
      L3_200 = "nilname"
    end
  end
  print("enter: " .. L2_199 .. " parent: " .. L3_200)
end
function createHeadNode()
  createGameObject2("Node"):setName("headLoc_00")
  createGameObject2("Node"):try_init()
  createGameObject2("Node"):waitForReady()
  createGameObject2("Node"):try_start()
  return (createGameObject2("Node"))
end
function cubesensor2_throw_out_01_OnLeave(A0_201, A1_202)
  local L2_203, L3_204, L4_205, L5_206, L6_207, L7_208, L8_209, L9_210, L10_211
  L3_204 = A1_202
  L2_203 = A1_202.getDynamicObject
  L2_203 = L2_203(L3_204)
  if L2_203 == nil then
    L4_205 = A1_202
    L3_204 = A1_202.isGrabbed
    L3_204 = L3_204(L4_205)
    if L3_204 == true then
      L4_205 = A1_202
      L3_204 = A1_202.isBroken
      L3_204 = L3_204(L4_205)
      if L3_204 == false then
        L4_205 = A1_202
        L3_204 = A1_202.isRunning
        L3_204 = L3_204(L4_205)
        if L3_204 == true then
          L4_205 = A1_202
          L3_204 = A1_202.getName
          L3_204 = L3_204(L4_205)
          L4_205, L5_206 = nil, nil
          if L3_204 ~= nil then
            L9_210 = "(.+)"
            L3_204 = L6_207
            if L3_204 ~= nil then
              for L9_210, L10_211 in L6_207(L7_208) do
                for _FORV_14_, _FORV_15_ in ipairs(L10_211) do
                  if L3_204 == _FORV_15_.name then
                    L4_205 = L9_210
                    L5_206 = _FORV_14_
                    break
                  end
                end
                if L4_205 == nil or L5_206 == nil then
                end
              end
            end
          end
          if L4_205 ~= nil and L5_206 ~= nil then
            _res_throw_out_point = L7_208
            L9_210 = RandF
            L10_211 = SCORE_POP_RAND_RANGE_X
            L10_211 = L10_211.min
            L9_210 = L9_210(L10_211, SCORE_POP_RAND_RANGE_X.max)
            L10_211 = SCORE_BONE_OFFSET_Y
            L10_211 = L10_211 + RandF(SCORE_POP_RAND_RANGE_Y.min, SCORE_POP_RAND_RANGE_Y.max)
            L8_209:setWorldTransform(L7_208:getJointWorldTransform("bn_spine0") + Vector(L9_210, L10_211, L9_210))
            HUD:scorePop(L6_207.add_point, L8_209)
            Sound:playSE("success", 1)
          else
            L6_207(L7_208)
            _res_throw_out_point = L6_207
            L9_210 = SCORE_POP_RAND_RANGE_X
            L9_210 = L9_210.min
            L10_211 = SCORE_POP_RAND_RANGE_X
            L10_211 = L10_211.max
            L9_210 = SCORE_BONE_OFFSET_Y
            L10_211 = RandF
            L10_211 = L10_211(SCORE_POP_RAND_RANGE_Y.min, SCORE_POP_RAND_RANGE_Y.max)
            L9_210 = L9_210 + L10_211
            L10_211 = L7_208.setWorldTransform
            L10_211(L7_208, L6_207:getJointWorldTransform("bn_spine0") + Vector(L8_209, L9_210, L8_209))
            L10_211 = HUD
            L10_211 = L10_211.scorePop
            L10_211(L10_211, EXTRA_BG_ADD_POINT, L7_208)
            L10_211 = Sound
            L10_211 = L10_211.playSE
            L10_211(L10_211, "success", 1)
          end
          if L6_207 <= L7_208 then
            L9_210 = BONUS_TIME_DATA
            L10_211 = _bonus_time_idx
            L9_210 = L9_210[L10_211]
            L9_210 = L9_210.add_sec
            L9_210 = L6_207 + L9_210
            L7_208(L8_209, L9_210)
            L9_210 = "sys_info"
            L10_211 = 1
            L7_208(L8_209, L9_210, L10_211)
            L7_208(L8_209)
            L9_210 = _bonus_time_idx
            _bonus_time_score_tmp = L7_208
            L9_210 = BONUS_TIME_DATA
            L9_210 = #L9_210
            _bonus_time_idx = L7_208
          end
        end
      end
    end
  end
  L3_204 = "nil"
  if A1_202 then
    L5_206 = A1_202
    L4_205 = A1_202.getName
    L4_205 = L4_205(L5_206)
    if L4_205 then
      L3_204 = L4_205
    else
      L3_204 = "nilname"
    end
  end
  L4_205 = "nil"
  L5_206 = A1_202.getParent
  L5_206 = L5_206(L6_207)
  if L5_206 then
    if L6_207 then
      L4_205 = L6_207
    else
      L4_205 = "nilname"
    end
  end
  L9_210 = " parent: "
  L10_211 = L4_205
  L6_207(L7_208)
end
function respawn_res_box(A0_212)
  local L1_213, L2_214, L3_215, L4_216, L5_217
  if L1_213 >= 2 then
    for L4_216, L5_217 in L1_213(L2_214) do
      for _FORV_9_, _FORV_10_ in ipairs(L5_217) do
        if _FORV_10_.hdl:isBroken() then
          _FORV_10_.hdl:requestRestoreForce()
          _FORV_10_.put_sensor = true
          _FORV_10_.grab = false
          L5_217.num = L5_217.num + 1
        end
      end
    end
    L1_213[A0_212] = L2_214
    L4_216 = "]\230\174\139\227\129\163\227\129\166\227\130\139\231\183\143\230\149\176:"
    L5_217 = _parted_box_now_num_tbl
    L5_217 = L5_217[A0_212]
    L1_213(L2_214)
    L1_213(L2_214, L3_215)
    L4_216 = "]\229\134\141\231\148\159\227\131\170\227\130\185\227\131\136\227\129\139\227\130\137\229\137\138\233\153\164, \228\187\138\229\134\141\231\148\159\229\190\133\227\129\161\227\129\174\230\149\176\227\129\175\239\188\154"
    L5_217 = _parted_box_respawn_tbl
    L5_217 = #L5_217
    L1_213(L2_214)
  end
end
function cubesensor2_lose_res_box_01_OnEnter(A0_218, A1_219)
  local L2_220
  L2_220 = A1_219.getName
  L2_220 = L2_220(A1_219)
  if L2_220 ~= nil then
    setResBoxPutSensor(1, L2_220, true)
  end
end
function cubesensor2_lose_res_box_01_OnLeave(A0_221, A1_222)
  local L2_223
  L2_223 = A1_222.getName
  L2_223 = L2_223(A1_222)
  if L2_223 ~= nil then
    setResBoxPutSensor(1, L2_223, false)
  end
end
function cubesensor2_lose_res_box_02_OnEnter(A0_224, A1_225)
  local L2_226
  L2_226 = A1_225.getName
  L2_226 = L2_226(A1_225)
  if L2_226 ~= nil then
    setResBoxPutSensor(2, L2_226, true)
  end
end
function cubesensor2_lose_res_box_02_OnLeave(A0_227, A1_228)
  local L2_229
  L2_229 = A1_228.getName
  L2_229 = L2_229(A1_228)
  if L2_229 ~= nil then
    setResBoxPutSensor(2, L2_229, false)
  end
end
function cubesensor2_lose_res_box_03_OnEnter(A0_230, A1_231)
  local L2_232
  L2_232 = A1_231.getName
  L2_232 = L2_232(A1_231)
  if L2_232 ~= nil then
    setResBoxPutSensor(3, L2_232, true)
  end
end
function cubesensor2_lose_res_box_03_OnLeave(A0_233, A1_234)
  local L2_235
  L2_235 = A1_234.getName
  L2_235 = L2_235(A1_234)
  if L2_235 ~= nil then
    setResBoxPutSensor(3, L2_235, false)
  end
end
function cubesensor2_lose_res_box_04_OnEnter(A0_236, A1_237)
  local L2_238
  L2_238 = A1_237.getName
  L2_238 = L2_238(A1_237)
  if L2_238 ~= nil then
    setResBoxPutSensor(4, L2_238, true)
  end
end
function cubesensor2_lose_res_box_04_OnLeave(A0_239, A1_240)
  local L2_241
  L2_241 = A1_240.getName
  L2_241 = L2_241(A1_240)
  if L2_241 ~= nil then
    setResBoxPutSensor(4, L2_241, false)
  end
end
function cubesensor2_lose_res_box_05_OnEnter(A0_242, A1_243)
  local L2_244
  L2_244 = A1_243.getName
  L2_244 = L2_244(A1_243)
  if L2_244 ~= nil then
    setResBoxPutSensor(5, L2_244, true)
  end
end
function cubesensor2_lose_res_box_05_OnLeave(A0_245, A1_246)
  local L2_247
  L2_247 = A1_246.getName
  L2_247 = L2_247(A1_246)
  if L2_247 ~= nil then
    setResBoxPutSensor(5, L2_247, false)
  end
end
function cubesensor2_lose_res_box_06_OnEnter(A0_248, A1_249)
  local L2_250
  L2_250 = A1_249.getName
  L2_250 = L2_250(A1_249)
  if L2_250 ~= nil then
    setResBoxPutSensor(6, L2_250, true)
  end
end
function cubesensor2_lose_res_box_06_OnLeave(A0_251, A1_252)
  local L2_253
  L2_253 = A1_252.getName
  L2_253 = L2_253(A1_252)
  if L2_253 ~= nil then
    setResBoxPutSensor(6, L2_253, false)
  end
end
function cubesensor2_lose_res_box_07_OnEnter(A0_254, A1_255)
  local L2_256
  L2_256 = A1_255.getName
  L2_256 = L2_256(A1_255)
  if L2_256 ~= nil then
    setResBoxPutSensor(7, L2_256, true)
  end
end
function cubesensor2_lose_res_box_07_OnLeave(A0_257, A1_258)
  local L2_259
  L2_259 = A1_258.getName
  L2_259 = L2_259(A1_258)
  if L2_259 ~= nil then
    setResBoxPutSensor(7, L2_259, false)
  end
end
function cubesensor2_lose_res_box_08_OnEnter(A0_260, A1_261)
  local L2_262
  L2_262 = A1_261.getName
  L2_262 = L2_262(A1_261)
  if L2_262 ~= nil then
    setResBoxPutSensor(8, L2_262, true)
  end
end
function cubesensor2_lose_res_box_08_OnLeave(A0_263, A1_264)
  local L2_265
  L2_265 = A1_264.getName
  L2_265 = L2_265(A1_264)
  if L2_265 ~= nil then
    setResBoxPutSensor(8, L2_265, false)
  end
end
function cubesensor2_lose_res_box_09_OnEnter(A0_266, A1_267)
  local L2_268
  L2_268 = A1_267.getName
  L2_268 = L2_268(A1_267)
  if L2_268 ~= nil then
    setResBoxPutSensor(9, L2_268, true)
  end
end
function cubesensor2_lose_res_box_09_OnLeave(A0_269, A1_270)
  local L2_271
  L2_271 = A1_270.getName
  L2_271 = L2_271(A1_270)
  if L2_271 ~= nil then
    setResBoxPutSensor(9, L2_271, false)
  end
end
function cubesensor2_lose_res_box_10_OnEnter(A0_272, A1_273)
  local L2_274
  L2_274 = A1_273.getName
  L2_274 = L2_274(A1_273)
  if L2_274 ~= nil then
    setResBoxPutSensor(10, L2_274, true)
  end
end
function cubesensor2_lose_res_box_10_OnLeave(A0_275, A1_276)
  local L2_277
  L2_277 = A1_276.getName
  L2_277 = L2_277(A1_276)
  if L2_277 ~= nil then
    setResBoxPutSensor(10, L2_277, false)
  end
end
function cubesensor2_lose_res_box_11_OnEnter(A0_278, A1_279)
  local L2_280
  L2_280 = A1_279.getName
  L2_280 = L2_280(A1_279)
  if L2_280 ~= nil then
    setResBoxPutSensor(11, L2_280, true)
  end
end
function cubesensor2_lose_res_box_11_OnLeave(A0_281, A1_282)
  local L2_283
  L2_283 = A1_282.getName
  L2_283 = L2_283(A1_282)
  if L2_283 ~= nil then
    setResBoxPutSensor(11, L2_283, false)
  end
end
function cubesensor2_lose_res_box_12_OnEnter(A0_284, A1_285)
  local L2_286
  L2_286 = A1_285.getName
  L2_286 = L2_286(A1_285)
  if L2_286 ~= nil then
    setResBoxPutSensor(12, L2_286, true)
  end
end
function cubesensor2_lose_res_box_12_OnLeave(A0_287, A1_288)
  local L2_289
  L2_289 = A1_288.getName
  L2_289 = L2_289(A1_288)
  if L2_289 ~= nil then
    setResBoxPutSensor(12, L2_289, false)
  end
end
function cubesensor2_lose_res_box_13_OnEnter(A0_290, A1_291)
  local L2_292
  L2_292 = A1_291.getName
  L2_292 = L2_292(A1_291)
  if L2_292 ~= nil then
    setResBoxPutSensor(13, L2_292, true)
  end
end
function cubesensor2_lose_res_box_13_OnLeave(A0_293, A1_294)
  local L2_295
  L2_295 = A1_294.getName
  L2_295 = L2_295(A1_294)
  if L2_295 ~= nil then
    setResBoxPutSensor(13, L2_295, false)
  end
end
function cubesensor2_lose_res_box_14_OnEnter(A0_296, A1_297)
  local L2_298
  L2_298 = A1_297.getName
  L2_298 = L2_298(A1_297)
  if L2_298 ~= nil then
    setResBoxPutSensor(14, L2_298, true)
  end
end
function cubesensor2_lose_res_box_14_OnLeave(A0_299, A1_300)
  local L2_301
  L2_301 = A1_300.getName
  L2_301 = L2_301(A1_300)
  if L2_301 ~= nil then
    setResBoxPutSensor(14, L2_301, false)
  end
end
function cubesensor2_lose_res_box_15_OnEnter(A0_302, A1_303)
  local L2_304
  L2_304 = A1_303.getName
  L2_304 = L2_304(A1_303)
  if L2_304 ~= nil then
    setResBoxPutSensor(15, L2_304, true)
  end
end
function cubesensor2_lose_res_box_15_OnLeave(A0_305, A1_306)
  local L2_307
  L2_307 = A1_306.getName
  L2_307 = L2_307(A1_306)
  if L2_307 ~= nil then
    setResBoxPutSensor(15, L2_307, false)
  end
end
function cubesensor2_lose_res_box_16_OnEnter(A0_308, A1_309)
  local L2_310
  L2_310 = A1_309.getName
  L2_310 = L2_310(A1_309)
  if L2_310 ~= nil then
    setResBoxPutSensor(16, L2_310, true)
  end
end
function cubesensor2_lose_res_box_16_OnLeave(A0_311, A1_312)
  local L2_313
  L2_313 = A1_312.getName
  L2_313 = L2_313(A1_312)
  if L2_313 ~= nil then
    setResBoxPutSensor(16, L2_313, false)
  end
end
function cubesensor2_lose_res_box_17_OnEnter(A0_314, A1_315)
  local L2_316
  L2_316 = A1_315.getName
  L2_316 = L2_316(A1_315)
  if L2_316 ~= nil then
    setResBoxPutSensor(17, L2_316, true)
  end
end
function cubesensor2_lose_res_box_17_OnLeave(A0_317, A1_318)
  local L2_319
  L2_319 = A1_318.getName
  L2_319 = L2_319(A1_318)
  if L2_319 ~= nil then
    setResBoxPutSensor(17, L2_319, false)
  end
end
function cubesensor2_lose_res_box_18_OnEnter(A0_320, A1_321)
  local L2_322
  L2_322 = A1_321.getName
  L2_322 = L2_322(A1_321)
  if L2_322 ~= nil then
    setResBoxPutSensor(18, L2_322, true)
  end
end
function cubesensor2_lose_res_box_18_OnLeave(A0_323, A1_324)
  local L2_325
  L2_325 = A1_324.getName
  L2_325 = L2_325(A1_324)
  if L2_325 ~= nil then
    setResBoxPutSensor(18, L2_325, false)
  end
end
function cubesensor2_lose_res_box_19_OnEnter(A0_326, A1_327)
  local L2_328
  L2_328 = A1_327.getName
  L2_328 = L2_328(A1_327)
  if L2_328 ~= nil then
    setResBoxPutSensor(19, L2_328, true)
  end
end
function cubesensor2_lose_res_box_19_OnLeave(A0_329, A1_330)
  local L2_331
  L2_331 = A1_330.getName
  L2_331 = L2_331(A1_330)
  if L2_331 ~= nil then
    setResBoxPutSensor(19, L2_331, false)
  end
end
function cubesensor2_lose_res_box_20_OnEnter(A0_332, A1_333)
  local L2_334
  L2_334 = A1_333.getName
  L2_334 = L2_334(A1_333)
  if L2_334 ~= nil then
    setResBoxPutSensor(20, L2_334, true)
  end
end
function cubesensor2_lose_res_box_20_OnLeave(A0_335, A1_336)
  local L2_337
  L2_337 = A1_336.getName
  L2_337 = L2_337(A1_336)
  if L2_337 ~= nil then
    setResBoxPutSensor(20, L2_337, false)
  end
end
function cubesensor2_lose_res_box_21_OnEnter(A0_338, A1_339)
  local L2_340
  L2_340 = A1_339.getName
  L2_340 = L2_340(A1_339)
  if L2_340 ~= nil then
    setResBoxPutSensor(21, L2_340, true)
  end
end
function cubesensor2_lose_res_box_21_OnLeave(A0_341, A1_342)
  local L2_343
  L2_343 = A1_342.getName
  L2_343 = L2_343(A1_342)
  if L2_343 ~= nil then
    setResBoxPutSensor(21, L2_343, false)
  end
end
function cubesensor2_lose_res_box_22_OnEnter(A0_344, A1_345)
  local L2_346
  L2_346 = A1_345.getName
  L2_346 = L2_346(A1_345)
  if L2_346 ~= nil then
    setResBoxPutSensor(22, L2_346, true)
  end
end
function cubesensor2_lose_res_box_22_OnLeave(A0_347, A1_348)
  local L2_349
  L2_349 = A1_348.getName
  L2_349 = L2_349(A1_348)
  if L2_349 ~= nil then
    setResBoxPutSensor(22, L2_349, false)
  end
end
function cubesensor2_lose_res_box_23_OnEnter(A0_350, A1_351)
  local L2_352
  L2_352 = A1_351.getName
  L2_352 = L2_352(A1_351)
  if L2_352 ~= nil then
    setResBoxPutSensor(23, L2_352, true)
  end
end
function cubesensor2_lose_res_box_23_OnLeave(A0_353, A1_354)
  local L2_355
  L2_355 = A1_354.getName
  L2_355 = L2_355(A1_354)
  if L2_355 ~= nil then
    setResBoxPutSensor(23, L2_355, false)
  end
end
function cubesensor2_lose_res_box_24_OnEnter(A0_356, A1_357)
  local L2_358
  L2_358 = A1_357.getName
  L2_358 = L2_358(A1_357)
  if L2_358 ~= nil then
    setResBoxPutSensor(24, L2_358, true)
  end
end
function cubesensor2_lose_res_box_24_OnLeave(A0_359, A1_360)
  local L2_361
  L2_361 = A1_360.getName
  L2_361 = L2_361(A1_360)
  if L2_361 ~= nil then
    setResBoxPutSensor(24, L2_361, false)
  end
end
function cubesensor2_lose_res_box_25_OnEnter(A0_362, A1_363)
  local L2_364
  L2_364 = A1_363.getName
  L2_364 = L2_364(A1_363)
  if L2_364 ~= nil then
    setResBoxPutSensor(25, L2_364, true)
  end
end
function cubesensor2_lose_res_box_25_OnLeave(A0_365, A1_366)
  local L2_367
  L2_367 = A1_366.getName
  L2_367 = L2_367(A1_366)
  if L2_367 ~= nil then
    setResBoxPutSensor(25, L2_367, false)
  end
end
function cubesensor2_lose_res_box_26_OnEnter(A0_368, A1_369)
  local L2_370
  L2_370 = A1_369.getName
  L2_370 = L2_370(A1_369)
  if L2_370 ~= nil then
    setResBoxPutSensor(26, L2_370, true)
  end
end
function cubesensor2_lose_res_box_26_OnLeave(A0_371, A1_372)
  local L2_373
  L2_373 = A1_372.getName
  L2_373 = L2_373(A1_372)
  if L2_373 ~= nil then
    setResBoxPutSensor(26, L2_373, false)
  end
end
function cubesensor2_lose_res_box_27_OnEnter(A0_374, A1_375)
  local L2_376
  L2_376 = A1_375.getName
  L2_376 = L2_376(A1_375)
  if L2_376 ~= nil then
    setResBoxPutSensor(27, L2_376, true)
  end
end
function cubesensor2_lose_res_box_27_OnLeave(A0_377, A1_378)
  local L2_379
  L2_379 = A1_378.getName
  L2_379 = L2_379(A1_378)
  if L2_379 ~= nil then
    setResBoxPutSensor(27, L2_379, false)
  end
end
function cubesensor2_lose_res_box_28_OnEnter(A0_380, A1_381)
  local L2_382
  L2_382 = A1_381.getName
  L2_382 = L2_382(A1_381)
  if L2_382 ~= nil then
    setResBoxPutSensor(28, L2_382, true)
  end
end
function cubesensor2_lose_res_box_28_OnLeave(A0_383, A1_384)
  local L2_385
  L2_385 = A1_384.getName
  L2_385 = L2_385(A1_384)
  if L2_385 ~= nil then
    setResBoxPutSensor(28, L2_385, false)
  end
end
function cubesensor2_lose_res_box_29_OnEnter(A0_386, A1_387)
  local L2_388
  L2_388 = A1_387.getName
  L2_388 = L2_388(A1_387)
  if L2_388 ~= nil then
    setResBoxPutSensor(29, L2_388, true)
  end
end
function cubesensor2_lose_res_box_29_OnLeave(A0_389, A1_390)
  local L2_391
  L2_391 = A1_390.getName
  L2_391 = L2_391(A1_390)
  if L2_391 ~= nil then
    setResBoxPutSensor(29, L2_391, false)
  end
end
function cubesensor2_lose_res_box_30_OnEnter(A0_392, A1_393)
  local L2_394
  L2_394 = A1_393.getName
  L2_394 = L2_394(A1_393)
  if L2_394 ~= nil then
    setResBoxPutSensor(30, L2_394, true)
  end
end
function cubesensor2_lose_res_box_30_OnLeave(A0_395, A1_396)
  local L2_397
  L2_397 = A1_396.getName
  L2_397 = L2_397(A1_396)
  if L2_397 ~= nil then
    setResBoxPutSensor(30, L2_397, false)
  end
end
function cubesensor2_lose_res_box_31_OnEnter(A0_398, A1_399)
  local L2_400
  L2_400 = A1_399.getName
  L2_400 = L2_400(A1_399)
  if L2_400 ~= nil then
    setResBoxPutSensor(31, L2_400, true)
  end
end
function cubesensor2_lose_res_box_31_OnLeave(A0_401, A1_402)
  local L2_403
  L2_403 = A1_402.getName
  L2_403 = L2_403(A1_402)
  if L2_403 ~= nil then
    setResBoxPutSensor(31, L2_403, false)
  end
end
function cubesensor2_lose_res_box_32_OnEnter(A0_404, A1_405)
  local L2_406
  L2_406 = A1_405.getName
  L2_406 = L2_406(A1_405)
  if L2_406 ~= nil then
    setResBoxPutSensor(32, L2_406, true)
  end
end
function cubesensor2_lose_res_box_32_OnLeave(A0_407, A1_408)
  local L2_409
  L2_409 = A1_408.getName
  L2_409 = L2_409(A1_408)
  if L2_409 ~= nil then
    setResBoxPutSensor(32, L2_409, false)
  end
end
function cubesensor2_lose_res_box_33_OnEnter(A0_410, A1_411)
  local L2_412
  L2_412 = A1_411.getName
  L2_412 = L2_412(A1_411)
  if L2_412 ~= nil then
    setResBoxPutSensor(33, L2_412, true)
  end
end
function cubesensor2_lose_res_box_33_OnLeave(A0_413, A1_414)
  local L2_415
  L2_415 = A1_414.getName
  L2_415 = L2_415(A1_414)
  if L2_415 ~= nil then
    setResBoxPutSensor(33, L2_415, false)
  end
end
function cubesensor2_lose_res_box_34_OnEnter(A0_416, A1_417)
  local L2_418
  L2_418 = A1_417.getName
  L2_418 = L2_418(A1_417)
  if L2_418 ~= nil then
    setResBoxPutSensor(34, L2_418, true)
  end
end
function cubesensor2_lose_res_box_34_OnLeave(A0_419, A1_420)
  local L2_421
  L2_421 = A1_420.getName
  L2_421 = L2_421(A1_420)
  if L2_421 ~= nil then
    setResBoxPutSensor(34, L2_421, false)
  end
end
function cubesensor2_lose_res_box_35_OnEnter(A0_422, A1_423)
  local L2_424
  L2_424 = A1_423.getName
  L2_424 = L2_424(A1_423)
  if L2_424 ~= nil then
    setResBoxPutSensor(35, L2_424, true)
  end
end
function cubesensor2_lose_res_box_35_OnLeave(A0_425, A1_426)
  local L2_427
  L2_427 = A1_426.getName
  L2_427 = L2_427(A1_426)
  if L2_427 ~= nil then
    setResBoxPutSensor(35, L2_427, false)
  end
end
function cubesensor2_lose_res_box_36_OnEnter(A0_428, A1_429)
  local L2_430
  L2_430 = A1_429.getName
  L2_430 = L2_430(A1_429)
  if L2_430 ~= nil then
    setResBoxPutSensor(36, L2_430, true)
  end
end
function cubesensor2_lose_res_box_36_OnLeave(A0_431, A1_432)
  local L2_433
  L2_433 = A1_432.getName
  L2_433 = L2_433(A1_432)
  if L2_433 ~= nil then
    setResBoxPutSensor(36, L2_433, false)
  end
end
function cubesensor2_lose_res_box_37_OnEnter(A0_434, A1_435)
  local L2_436
  L2_436 = A1_435.getName
  L2_436 = L2_436(A1_435)
  if L2_436 ~= nil then
    setResBoxPutSensor(37, L2_436, true)
  end
end
function cubesensor2_lose_res_box_37_OnLeave(A0_437, A1_438)
  local L2_439
  L2_439 = A1_438.getName
  L2_439 = L2_439(A1_438)
  if L2_439 ~= nil then
    setResBoxPutSensor(37, L2_439, false)
  end
end
function cubesensor2_lose_res_box_38_OnEnter(A0_440, A1_441)
  local L2_442
  L2_442 = A1_441.getName
  L2_442 = L2_442(A1_441)
  if L2_442 ~= nil then
    setResBoxPutSensor(38, L2_442, true)
  end
end
function cubesensor2_lose_res_box_38_OnLeave(A0_443, A1_444)
  local L2_445
  L2_445 = A1_444.getName
  L2_445 = L2_445(A1_444)
  if L2_445 ~= nil then
    setResBoxPutSensor(38, L2_445, false)
  end
end
function cubesensor2_lose_res_box_39_OnEnter(A0_446, A1_447)
  local L2_448
  L2_448 = A1_447.getName
  L2_448 = L2_448(A1_447)
  if L2_448 ~= nil then
    setResBoxPutSensor(39, L2_448, true)
  end
end
function cubesensor2_lose_res_box_39_OnLeave(A0_449, A1_450)
  local L2_451
  L2_451 = A1_450.getName
  L2_451 = L2_451(A1_450)
  if L2_451 ~= nil then
    setResBoxPutSensor(39, L2_451, false)
  end
end
function pccubesensor2_out_01_OnEnter()
  local L0_452, L1_453
  _is_out_of_range = false
end
function pccubesensor2_out_01_OnLeave()
  local L0_454, L1_455
  _is_out_of_range = true
end
function pccubesensormulti2_force_find_01_OnEnter()
  local L0_456, L1_457
  _is_in_bomb_sensor = true
end
function pccubesensormulti2_force_find_01_OnLeave()
  local L0_458, L1_459
  _is_in_bomb_sensor = false
end
function pccubesensor2_respawn_a_OnEnter(A0_460)
  local L1_461
  L1_461 = print
  L1_461("pccubesensor2_OnEnter.." .. A0_460:getName())
  L1_461 = _parted_box_respawn_tbl
  L1_461 = L1_461[1]
  if L1_461 ~= PARTED_BOX_A then
    respawn_res_box(L1_461)
  end
end
function pccubesensor2_respawn_a_OnLeave(A0_462)
  print("pccubesensor2_OnLeave.." .. A0_462:getName())
end
function pccubesensor2_respawn_b_OnEnter(A0_463)
  local L1_464
  L1_464 = print
  L1_464("pccubesensor2_OnEnter.." .. A0_463:getName())
  L1_464 = _parted_box_respawn_tbl
  L1_464 = L1_464[1]
  if L1_464 ~= PARTED_BOX_B then
    respawn_res_box(L1_464)
  end
end
function pccubesensor2_respawn_b_OnLeave(A0_465)
  print("pccubesensor2_OnLeave.." .. A0_465:getName())
end
function pccubesensor2_respawn_c_OnEnter(A0_466)
  local L1_467
  L1_467 = print
  L1_467("pccubesensor2_OnEnter.." .. A0_466:getName())
  L1_467 = _parted_box_respawn_tbl
  L1_467 = L1_467[1]
  if L1_467 ~= PARTED_BOX_C then
    respawn_res_box(L1_467)
  end
end
function pccubesensor2_respawn_c_OnLeave(A0_468)
  print("pccubesensor2_OnLeave.." .. A0_468:getName())
end
function pccubesensor2_respawn_d_OnEnter(A0_469)
  local L1_470
  L1_470 = print
  L1_470("pccubesensor2_OnEnter.." .. A0_469:getName())
  L1_470 = _parted_box_respawn_tbl
  L1_470 = L1_470[1]
  if L1_470 ~= PARTED_BOX_D then
    respawn_res_box(L1_470)
  end
end
function pccubesensor2_respawn_d_OnLeave(A0_471)
  print("pccubesensor2_OnLeave.." .. A0_471:getName())
end
function containerSetVisibleBlockEnable(A0_472)
  for _FORV_4_, _FORV_5_ in ipairs(_container_tbl) do
    _container_tbl[_FORV_4_]:setVisibleBlockEnable(A0_472)
  end
end
function resBoxSetVisibleBlockEnable(A0_473)
  local L1_474, L2_475, L3_476, L4_477, L5_478
  for L4_477, L5_478 in L1_474(L2_475) do
    for _FORV_9_, _FORV_10_ in ipairs(L5_478) do
      _resource_box_tbl[L4_477][_FORV_9_].hdl:setVisibleBlockEnable(A0_473)
    end
  end
end
