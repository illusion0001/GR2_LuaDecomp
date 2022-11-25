dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm02_common.lua")
import("Camera")
PHASE_1 = 1
PHASE_2 = 2
PHASE_3 = 3
PHASE_4 = 4
PHASE_5 = 5
PHASE_6 = 6
PHASE_7 = 7
PHASE_8 = 8
PHASE_9 = 9
PHASE_10 = 10
PHASE_11 = 11
PHASE_12 = 12
PHASE_GOAL = 13
MEMORY_DEBRIS_PARAM_TBL = {
  {
    memory_name = "intro",
    locator_name = "locator2_intro_mem_debris_01",
    attach_sensor = false
  },
  {
    memory_name = "babybed",
    locator_name = "locator2_babybed_mem_debris_01",
    attach_sensor = false
  },
  {
    memory_name = "teddybear",
    locator_name = "locator2_teddybear_mem_debris_01"
  },
  {
    memory_name = "shoe",
    locator_name = "locator2_shoe_mem_debris_01"
  },
  {
    memory_name = "graffiti",
    locator_name = "locator2_graffiti_mem_debris_01"
  },
  {
    memory_name = "birdcage",
    locator_name = "locator2_birdcage_mem_debris_01"
  },
  {
    memory_name = "schoolbag",
    locator_name = "locator2_schoolbag_mem_debris_01"
  },
  {
    memory_name = "clock",
    locator_name = "locator2_clock_mem_debris_01"
  },
  {
    memory_name = "swing",
    locator_name = "locator2_swing_mem_debris_01"
  },
  {
    memory_name = "extra_01",
    locator_name = "locator2_ex_mem_debris_01"
  },
  {
    memory_name = "extra_02",
    locator_name = "locator2_ex_mem_debris_02"
  },
  {
    memory_name = "extra_03",
    locator_name = "locator2_ex_mem_debris_03"
  },
  {
    memory_name = "extra_04",
    locator_name = "locator2_ex_mem_debris_04"
  },
  {
    memory_name = "extra_05",
    locator_name = "locator2_ex_mem_debris_05"
  },
  {
    memory_name = "extra_06",
    locator_name = "locator2_ex_mem_debris_06"
  },
  {
    memory_name = "extra_07",
    locator_name = "locator2_ex_mem_debris_07"
  },
  {
    memory_name = "extra_08",
    locator_name = "locator2_ex_mem_debris_08"
  },
  {
    memory_name = "extra_09",
    locator_name = "locator2_ex_mem_debris_09"
  },
  {
    memory_name = "extra_10",
    locator_name = "locator2_ex_mem_debris_10"
  },
  {
    memory_name = "extra_11",
    locator_name = "locator2_ex_mem_debris_11"
  }
}
COLLECTOR_FIND_FRONT_DIST = 10
COLLECTOR_FIND_BEHIND_DIST = 3
COLLECTOR_LOST_FRONT_DIST = 15
COLLECTOR_LOST_BEHIND_DIST = 5
COLLECTOR_PREY_DIST = 3
ENM_STATE_WAIT = 1
ENM_STATE_PATROL = 2
ENM_STATE_FOUND_PLAYER = 3
ENM_STATE_LOST_PLAYER = 4
ENM_STATE_PREY = 5
COLLECTOR_DATA_TBL = {
  enmgen2_collector_01 = {
    move_prefix = "locator2_collector_01_move_"
  },
  enmgen2_collector_02 = {
    move_prefix = "locator2_collector_02_move_"
  },
  enmgen2_collector_03 = {
    move_prefix = "locator2_collector_03_move_"
  },
  enmgen2_collector_05 = {
    move_prefix = "locator2_collector_05_move_"
  },
  enmgen2_collector_06 = {
    move_prefix = "locator2_collector_06_move_"
  },
  enmgen2_collector_07 = {
    move_prefix = "locator2_collector_07_move_"
  },
  enmgen2_collector_08 = {
    move_prefix = "locator2_collector_08_move_"
  },
  enmgen2_collector_09 = {
    move_prefix = "locator2_collector_09_move_"
  },
  enmgen2_collector_10 = {
    move_prefix = "locator2_collector_10_move_"
  },
  enmgen2_collector_11 = {
    move_prefix = "locator2_collector_11_move_"
  }
}
PHASE_DATA_TBL = {
  [PHASE_1] = {
    gravity_vector = Vector(0, -1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_A_01_02",
        restart_node_name = "locator2_check_point_A_01_02",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_A_01_03",
        restart_node_name = "locator2_check_point_A_01_03",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_A_01_04",
        restart_node_name = "locator2_check_point_A_01_04",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_B_02_01",
        restart_node_name = "locator2_check_point_B_02_01",
        next_phase = PHASE_2
      },
      {
        sensor_name = "pccubesensor2_check_point_A_04_01",
        restart_node_name = "locator2_check_point_A_04_01",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_C_03_02",
        restart_node_name = "locator2_check_point_C_03_02",
        next_phase = PHASE_3
      }
    },
    memory_data = {
      debris_sensor_name = "pccubesensor2_swing",
      alternate_sensor_name = "pccubesensor2_alternate_swing",
      restart_node_name = "locator2_check_point_swing",
      next_phase = PHASE_4
    },
    out_sensor_name = "pccubesensormulti2_outrange_A"
  },
  [PHASE_2] = {
    gravity_vector = Vector(0, -1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_A_01_04",
        restart_node_name = "locator2_check_point_A_01_04",
        next_phase = PHASE_1
      },
      {
        sensor_name = "pccubesensor2_check_point_B_02_01",
        restart_node_name = "locator2_check_point_B_02_01",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_B_02_02",
        restart_node_name = "locator2_check_point_B_02_02",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_B_02_03",
        restart_node_name = "locator2_check_point_B_02_03",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_C_03_01",
        restart_node_name = "locator2_check_point_C_03_01",
        next_phase = PHASE_3
      }
    },
    memory_data = {
      debris_sensor_name = "pccubesensor2_babybed",
      alternate_sensor_name = nil,
      restart_node_name = nil,
      next_phase = nil
    },
    out_sensor_name = "pccubesensormulti2_outrange_B"
  },
  [PHASE_3] = {
    gravity_vector = Vector(0, -1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_B_02_03",
        restart_node_name = "locator2_check_point_B_02_03",
        next_phase = PHASE_2
      },
      {
        sensor_name = "pccubesensor2_check_point_C_03_01",
        restart_node_name = "locator2_check_point_C_03_01",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_C_03_02",
        restart_node_name = "locator2_check_point_C_03_02",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_A_01_01",
        restart_node_name = "locator2_check_point_A_01_01",
        next_phase = PHASE_1
      },
      {
        sensor_name = "pccubesensor2_check_point_A_04_01",
        restart_node_name = "locator2_check_point_A_04_01",
        next_phase = PHASE_1
      }
    },
    memory_data = nil,
    out_sensor_name = "pccubesensormulti2_outrange_C"
  },
  [PHASE_4] = {
    gravity_vector = Vector(0, 1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_D_05_01",
        restart_node_name = "locator2_check_point_D_05_01",
        next_phase = nil
      }
    },
    memory_data = {
      debris_sensor_name = "pccubesensor2_teddybear",
      alternate_sensor_name = "pccubesensor2_alternate_teddybear",
      restart_node_name = "locator2_check_point_teddybear",
      next_phase = PHASE_5
    },
    out_sensor_name = "pccubesensormulti2_outrange_D"
  },
  [PHASE_5] = {
    gravity_vector = Vector(0, 0, -1),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_E_06_01",
        restart_node_name = "locator2_check_point_E_06_01",
        next_phase = nil
      }
    },
    memory_data = {
      debris_sensor_name = "pccubesensor2_shoe",
      alternate_sensor_name = "pccubesensor2_alternate_shoe",
      restart_node_name = "locator2_check_point_shoe",
      next_phase = PHASE_6
    },
    out_sensor_name = "pccubesensormulti2_outrange_E"
  },
  [PHASE_6] = {
    gravity_vector = Vector(0, 0, 1),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_F_07_01",
        restart_node_name = "locator2_check_point_F_07_01",
        next_phase = nil
      }
    },
    memory_data = {
      debris_sensor_name = "pccubesensor2_graffiti",
      alternate_sensor_name = "pccubesensor2_alternate_graffiti",
      restart_node_name = "locator2_check_point_graffiti",
      next_phase = PHASE_7
    },
    out_sensor_name = "pccubesensormulti2_outrange_F"
  },
  [PHASE_7] = {
    gravity_vector = Vector(0, 0, -1),
    check_point_tbl = {},
    memory_data = {
      debris_sensor_name = "pccubesensor2_birdcage",
      alternate_sensor_name = "pccubesensor2_alternate_birdcage",
      restart_node_name = "locator2_check_point_birdcage",
      next_phase = PHASE_8
    },
    out_sensor_name = "pccubesensormulti2_outrange_G"
  },
  [PHASE_8] = {
    gravity_vector = Vector(0, 1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_H_09_01",
        restart_node_name = "locator2_check_point_H_09_01",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_I_10_01",
        restart_node_name = "locator2_check_point_I_10_01",
        next_phase = PHASE_9
      }
    },
    memory_data = {
      debris_sensor_name = "pccubesensor2_schoolbag",
      alternate_sensor_name = "pccubesensor2_alternate_schoolbag",
      restart_node_name = "locator2_check_point_schoolbag",
      next_phase = PHASE_11
    },
    out_sensor_name = "pccubesensormulti2_outrange_H"
  },
  [PHASE_9] = {
    gravity_vector = Vector(0, 1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_H_09_01",
        restart_node_name = "locator2_check_point_H_09_01",
        next_phase = PHASE_8
      },
      {
        sensor_name = "pccubesensor2_check_point_I_10_01",
        restart_node_name = "locator2_check_point_I_10_01",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_I_10_02",
        restart_node_name = "locator2_check_point_I_10_02",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_check_point_J_11_01",
        restart_node_name = "locator2_check_point_J_11_01",
        next_phase = PHASE_10
      }
    },
    memory_data = nil,
    out_sensor_name = "pccubesensormulti2_outrange_I"
  },
  [PHASE_10] = {
    gravity_vector = Vector(0, 1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_I_10_02",
        restart_node_name = "locator2_check_point_I_10_02",
        next_phase = PHASE_9
      },
      {
        sensor_name = "pccubesensor2_check_point_J_11_01",
        restart_node_name = "locator2_check_point_J_11_01",
        next_phase = nil
      }
    },
    memory_data = nil,
    out_sensor_name = "pccubesensormulti2_outrange_J"
  },
  [PHASE_11] = {
    gravity_vector = Vector(0, 0, -1),
    check_point_tbl = {},
    memory_data = {
      debris_sensor_name = "pccubesensor2_clock",
      alternate_sensor_name = "pccubesensor2_alternate_clock",
      restart_node_name = "locator2_check_point_clock",
      next_phase = PHASE_12
    },
    out_sensor_name = "pccubesensormulti2_outrange_K"
  },
  [PHASE_12] = {
    gravity_vector = Vector(0, 1, 0),
    check_point_tbl = {
      {
        sensor_name = "pccubesensor2_check_point_H_09_01",
        restart_node_name = "locator2_check_point_H_09_01",
        next_phase = PHASE_8
      },
      {
        sensor_name = "pccubesensor2_check_point_I_10_01",
        restart_node_name = "locator2_check_point_I_10_01",
        next_phase = PHASE_9
      },
      {
        sensor_name = "pccubesensor2_check_point_I_10_02",
        restart_node_name = "locator2_check_point_I_10_02",
        next_phase = PHASE_9
      },
      {
        sensor_name = "pccubesensor2_check_point_J_11_01",
        restart_node_name = "locator2_check_point_J_11_01",
        next_phase = PHASE_10
      },
      {
        sensor_name = "pccubesensor2_check_point_L_13_01",
        restart_node_name = "locator2_check_point_L_13_01",
        next_phase = nil
      },
      {
        sensor_name = "pccubesensor2_goal",
        restart_node_name = nil,
        next_phase = PHASE_GOAL
      }
    },
    memory_data = nil,
    out_sensor_name = "pccubesensormulti2_outrange_L"
  }
}
_phase = nil
bg_babybed = nil
bg_teddybear = nil
bg_swing = nil
bg_graffiti = nil
bg_birdcage = nil
bg_schoolbag = nil
bg_clock = nil
clock_look = nil
bg_shoe = nil
bg_bus = nil
_sdemo = nil
_memory_event_flag_tbl = {}
_collector_work_tbl = {}
_is_in_check_point_sensor = {}
_is_out_of_range = false
_restart_phase = nil
_extra_mem_debris_caption_idx = 1
_fall_ctrl_on_task = nil
_trophy_40_attainable = true
enmgen2_collector_sdemo_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_collector",
      name = "collector_sdemo_01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_collector_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_collector",
      name = "collector_02",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectAsh = function(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
  end
}
enmgen2_collector_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_collector",
      name = "collector_03",
      navi_mesh_name = "az5_a_03_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onSpawn = function(A0_30, A1_31)
  end,
  onObjectAsh = function(A0_32, A1_33)
  end,
  onObjectDead = function(A0_34, A1_35)
  end
}
enmgen2_collector_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_collector",
      name = "collector_04",
      navi_mesh_name = "az5_a_04_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_36)
    local L1_37
  end,
  onEnter = function(A0_38)
    local L1_39
  end,
  onLeave = function(A0_40)
    local L1_41
  end,
  onSpawn = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
  end,
  onObjectDead = function(A0_46, A1_47)
  end
}
enmgen2_collector_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_collector",
      name = "collector_06",
      navi_mesh_name = "az5_a_05_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onSpawn = function(A0_54, A1_55)
  end,
  onObjectAsh = function(A0_56, A1_57)
  end,
  onObjectDead = function(A0_58, A1_59)
  end
}
enmgen2_collector_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_collector",
      name = "collector_07",
      navi_mesh_name = "az5_a_05_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_60)
    local L1_61
  end,
  onEnter = function(A0_62)
    local L1_63
  end,
  onLeave = function(A0_64)
    local L1_65
  end,
  onSpawn = function(A0_66, A1_67)
  end,
  onObjectAsh = function(A0_68, A1_69)
  end,
  onObjectDead = function(A0_70, A1_71)
  end
}
enmgen2_collector_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_collector",
      name = "collector_08",
      navi_mesh_name = "az5_a_05_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_72)
    local L1_73
  end,
  onEnter = function(A0_74)
    local L1_75
  end,
  onLeave = function(A0_76)
    local L1_77
  end,
  onSpawn = function(A0_78, A1_79)
  end,
  onObjectAsh = function(A0_80, A1_81)
  end,
  onObjectDead = function(A0_82, A1_83)
  end
}
enmgen2_collector_08 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_collector",
      name = "collector_09",
      navi_mesh_name = "az5_a_05_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_84)
    local L1_85
  end,
  onEnter = function(A0_86)
    local L1_87
  end,
  onLeave = function(A0_88)
    local L1_89
  end,
  onSpawn = function(A0_90, A1_91)
  end,
  onObjectAsh = function(A0_92, A1_93)
  end,
  onObjectDead = function(A0_94, A1_95)
  end
}
enmgen2_collector_09 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector03",
      locator = "locator_collector",
      name = "collector_10",
      navi_mesh_name = "az5_a_05_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_96)
    local L1_97
  end,
  onEnter = function(A0_98)
    local L1_99
  end,
  onLeave = function(A0_100)
    local L1_101
  end,
  onSpawn = function(A0_102, A1_103)
  end,
  onObjectAsh = function(A0_104, A1_105)
  end,
  onObjectDead = function(A0_106, A1_107)
  end
}
enmgen2_collector_10 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector01",
      locator = "locator_collector",
      name = "collector_11",
      navi_mesh_name = "az5_a_01_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_108)
    local L1_109
  end,
  onEnter = function(A0_110)
    local L1_111
  end,
  onLeave = function(A0_112)
    local L1_113
  end,
  onSpawn = function(A0_114, A1_115)
  end,
  onObjectAsh = function(A0_116, A1_117)
  end,
  onObjectDead = function(A0_118, A1_119)
  end
}
enmgen2_collector_11 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "collector02",
      locator = "locator_collector",
      name = "collector_12",
      navi_mesh_name = "az5_a_01_custom01",
      ai_spawn_option = "Collector/dm02_a"
    }
  },
  onUpdate = function(A0_120)
    local L1_121
  end,
  onEnter = function(A0_122)
    local L1_123
  end,
  onLeave = function(A0_124)
    local L1_125
  end,
  onSpawn = function(A0_126, A1_127)
  end,
  onObjectAsh = function(A0_128, A1_129)
  end,
  onObjectDead = function(A0_130, A1_131)
  end
}
function Initialize()
  local L0_132, L1_133, L2_134, L3_135, L4_136, L5_137, L6_138, L7_139, L8_140
  L0_132 = {L1_133}
  L1_133.name = "bit"
  L1_133.type = "bit01"
  L1_133.node = "locator2_bit_01"
  L1_133(L2_134)
  bg_swing = L1_133
  bg_babybed = L1_133
  bg_teddybear = L1_133
  bg_graffiti = L1_133
  bg_birdcage = L1_133
  bg_schoolbag = L1_133
  bg_clock = L1_133
  clock_look = L1_133
  bg_shoe = L1_133
  bg_bus = L1_133
  L1_133(L2_134, L3_135)
  for L4_136, L5_137 in L1_133(L2_134) do
    L6_138 = findGameObject2
    L7_139 = "EnemyGenerator"
    L8_140 = L4_136
    L6_138 = L6_138(L7_139, L8_140)
    if L6_138 ~= nil then
      L8_140 = L6_138
      L7_139 = L6_138.requestIdlingEnemy
      L7_139(L8_140, true)
      L8_140 = L6_138
      L7_139 = L6_138.setEnemyMarker
      L7_139(L8_140, false)
      L7_139 = _collector_work_tbl
      L8_140 = {}
      L8_140.enmgen = L6_138
      L8_140.patrol_task = nil
      L8_140.state = nil
      L8_140.ex_req_state_data = nil
      L7_139[L4_136] = L8_140
    else
      L7_139 = print
      L8_140 = "error: "
      L8_140 = L8_140 .. L4_136 .. " is not found."
      L7_139(L8_140)
    end
  end
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  L1_133(L2_134)
  _sdemo = L1_133
  L2_134(L3_135)
  L3_135.asset_name = "az5_a_01_custom01"
  L3_135.area_name = "az5_a_01"
  L4_136.asset_name = "az5_a_03_custom01"
  L4_136.area_name = "az5_a_03"
  L5_137.asset_name = "az5_a_04_custom01"
  L5_137.area_name = "az5_a_04"
  L6_138 = {}
  L6_138.asset_name = "az5_a_05_custom01"
  L6_138.area_name = "az5_a_05"
  L7_139 = {}
  L7_139.asset_name = "az5_a_06_custom01"
  L7_139.area_name = "az5_a_06"
  L8_140 = {}
  L8_140.asset_name = "az5_a_08_custom01"
  L8_140.area_name = "az5_a_08"
  for L6_138, L7_139 in L3_135(L4_136) do
    L8_140 = loadFileAsset
    L8_140 = L8_140("nvm", L7_139.asset_name)
    if L8_140 ~= nil then
      L8_140:wait()
      if Fn_findAreaHandle(L7_139.area_name) ~= nil then
        Fn_findAreaHandle(L7_139.area_name):setNaviMeshAsset(L8_140)
      end
    end
  end
  L2_134()
end
function Ingame()
  local L0_141, L1_142
  L0_141()
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141()
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  L0_141(L1_142)
  _restart_phase = L0_141
  L0_141(L1_142)
  L0_141(L1_142)
  if L0_141 == 1 then
    while L1_142 > 0 do
    end
    HUD:counter99_99SetTextID("\229\143\150\229\190\151\227\129\151\227\129\159\232\168\152\230\134\182\227\129\174\231\160\180\231\137\135\227\129\174\230\149\176")
    HUD:counter99_99SetMax(#MEMORY_DEBRIS_PARAM_TBL - 1)
    HUD:counter99_99SetNum(L0_141)
    HUD:counter99_99SetVisible(true)
  end
  L0_141()
  L0_141(L1_142)
  collectMemoryRestart = L0_141
  collectMemoryMain = L0_141
  while true do
    if L0_141 == false then
    end
  end
  L0_141()
  if L0_141 == true then
    L0_141(L1_142, 40)
  end
  for _FORV_6_ = #MEMORY_DEBRIS_PARAM_TBL, 2, -1 do
  end
  _FOR_:set(ggd.Savedata__EventFlags__dm02__flag01, L0_141)
  if L0_141 >= 2 ^ (#MEMORY_DEBRIS_PARAM_TBL - 1) - 1 then
    GameDatabase:set(ggd.EventFlags__dm02__flag01, 1)
  else
    GameDatabase:set(ggd.EventFlags__dm02__flag01, 0)
  end
  L0_141()
  if L0_141 == 1 then
    L0_141(L1_142, false)
  end
  for _FORV_3_, _FORV_4_ in L0_141(L1_142) do
    _collector_work_tbl[_FORV_3_].enmgen:requestAllEnemyKill()
  end
  L0_141()
  L0_141()
  L0_141()
end
function Finalize()
  deleteMemoryDebris()
  Fn_setCatActive(true)
  Fn_resetCoercionPose()
end
function playSdemo01()
  local L0_143, L1_144
  L0_143 = findGameObject2
  L1_144 = "EnemyGenerator"
  L0_143 = L0_143(L1_144, "enmgen2_collector_sdemo_01")
  L1_144 = L0_143.requestPrepare
  L1_144(L0_143)
  while true do
    L1_144 = L0_143.isPrepared
    L1_144 = L1_144(L0_143)
    if L1_144 == false then
      L1_144 = wait
      L1_144()
    end
  end
  L1_144 = _sdemo
  L1_144 = L1_144.reset
  L1_144(L1_144)
  L1_144 = _sdemo
  L1_144 = L1_144.set
  L1_144(L1_144, "locator2_sdemo_01_cam_01", "locator2_sdemo_01_aim_01")
  L1_144 = _sdemo
  L1_144 = L1_144.play
  L1_144(L1_144)
  L1_144 = nil
  Fn_playPlayerMotion("sac01_sleep_dm02_00", -1)
  Fn_missionStart(function()
    L1_144 = invokeTask(function()
      Fn_playPlayerMotion("sac01_getup_dm02_00", 0)
      wait(90)
      Sound:playSE("sac_013", 1)
      repeat
        wait()
      until Player:getPuppet():isPoseAnimEnd()
    end)
  end)
  waitSeconds(1)
  _sdemo:play({
    {
      pos = "locator2_sdemo_01_cam_02",
      time = 5,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo_01_aim_02",
      time = 5,
      hashfunc = "EaseInOut"
    }
  })
  while L1_144:isRunning() == true do
    wait()
  end
  L1_144:abort()
  L1_144 = nil
  while _sdemo:isPlay() do
    wait()
  end
  Sound:playSE("sac_014", 1)
  Fn_captionView("dm02_00010")
  waitSeconds(3)
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_01_cam_03", "locator2_sdemo_01_aim_03")
  _sdemo:play()
  L0_143:requestSpawn()
  L0_143:requestIdlingEnemy(true)
  L0_143:setEnemyMarker(false)
  findGameObject2("EnemyBrain", "collector_sdemo_01"):skipSpawnMotion(true)
  while findGameObject2("EnemyBrain", "collector_sdemo_01"):isReadyEnemy() == false do
    wait()
  end
  findGameObject2("EnemyBrain", "collector_sdemo_01"):move({
    "locator2_collector_sdemo_move_01"
  })
  while findGameObject2("EnemyBrain", "collector_sdemo_01"):isMoveEnd() == false do
    wait()
  end
  waitSeconds(1)
  setGettingMemoryDebris("intro")
  _sdemo:play({
    {
      pos = "locator2_sdemo_01_cam_04",
      time = 2,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo_01_aim_04",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  waitSeconds(0.5)
  findGameObject2("EnemyBrain", "collector_sdemo_01"):move({
    "locator2_collector_sdemo_move_02"
  })
  while _sdemo:isPlay() do
    wait()
  end
  waitSeconds(1)
  findGameObject2("EnemyBrain", "collector_sdemo_01"):endScriptAction()
  L0_143:requestAllEnemyKill()
  _sdemo:play({
    {
      pos = "locator2_sdemo_01_cam_05",
      time = 3,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo_01_aim_05",
      time = 3,
      hashfunc = "EaseInOut"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  Sound:playSE("sac_501", 1)
  Fn_captionViewWait("dm02_00020")
  Sound:playSE("bit_055", 1, "", Fn_findNpcPuppet("bit"))
  Fn_captionViewWait("dm02_00100")
  Player:setLookAtIk(true, 1, Fn_findNpcPuppet("bit"):getWorldPos())
  _sdemo:play({
    {
      pos = "locator2_sdemo_01_cam_06",
      time = 2,
      hashfunc = "EaseInOut"
    }
  }, {
    {
      pos = "locator2_sdemo_01_aim_06",
      time = 2,
      hashfunc = "EaseInOut"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Fn_kaiwaDemoView("dm02_00110k")
  _sdemo:stop(1)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_first"):getWorldPos())
  Fn_lookAtObjectWait("locator2_first")
  waitSeconds(0.25)
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  RAC_createEffect({
    eff_name = "ef_ev_dis_01",
    world_pos = Fn_findNpcPuppet("bit"):getWorldPos(),
    time = 6
  })
  Fn_disappearNpc("bit", 60)
end
function StageReset()
  Fn_userCtrlAllOff()
  Fn_blackout()
  if _fall_ctrl_on_task ~= nil then
    _fall_ctrl_on_task:abort()
    _fall_ctrl_on_task = nil
  end
  for _FORV_3_, _FORV_4_ in pairs(_collector_work_tbl) do
    _collector_work_tbl[_FORV_3_].enmgen:requestAllEnemyKill()
    _collector_work_tbl[_FORV_3_].enmgen:requestSpawn()
  end
  Fn_catWarpCheckPoint()
  _is_in_check_point_sensor = {}
  changePhase(_restart_phase, 0)
  Fn_fadein()
  Fn_userCtrlOn()
  Fn_recoverEnergyFully()
end
function changePhase(A0_145, A1_146)
  if A0_145 == _phase then
    return
  end
  print("request change phase:" .. A0_145)
  if _phase ~= nil and _phase ~= PHASE_GOAL then
    for _FORV_7_, _FORV_8_ in ipairs(PHASE_DATA_TBL[_phase].check_point_tbl) do
      if A0_145 ~= PHASE_GOAL and _is_in_check_point_sensor[_FORV_8_.sensor_name] == true then
        for _FORV_13_, _FORV_14_ in ipairs(PHASE_DATA_TBL[A0_145].check_point_tbl) do
          if _FORV_8_.sensor_name == _FORV_14_.sensor_name then
            break
          end
        end
      end
      if true == false then
        Fn_pcSensorOff(_FORV_8_.sensor_name)
      end
    end
    Fn_pcSensorOff(PHASE_DATA_TBL[_phase].out_sensor_name)
    if PHASE_DATA_TBL[_phase].memory_data ~= nil then
      if PHASE_DATA_TBL[_phase].memory_data.debris_sensor_name ~= nil then
        Fn_pcSensorOff(PHASE_DATA_TBL[_phase].memory_data.debris_sensor_name)
      end
      if PHASE_DATA_TBL[_phase].memory_data.alternate_sensor_name ~= nil then
        Fn_pcSensorOff(PHASE_DATA_TBL[_phase].memory_data.alternate_sensor_name)
      end
    end
  end
  _phase = A0_145
  if _phase ~= nil and _phase ~= PHASE_GOAL then
    for _FORV_7_, _FORV_8_ in ipairs(PHASE_DATA_TBL[_phase].check_point_tbl) do
      Fn_pcSensorOn(_FORV_8_.sensor_name)
    end
    Fn_pcSensorOn(PHASE_DATA_TBL[_phase].out_sensor_name)
    if PHASE_DATA_TBL[_phase].memory_data ~= nil then
      if PHASE_DATA_TBL[_phase].memory_data.debris_sensor_name ~= nil and _memory_event_flag_tbl[_phase] ~= true then
        Fn_pcSensorOn(PHASE_DATA_TBL[_phase].memory_data.debris_sensor_name)
      elseif PHASE_DATA_TBL[_phase].memory_data.alternate_sensor_name ~= nil then
        Fn_pcSensorOn(PHASE_DATA_TBL[_phase].memory_data.alternate_sensor_name)
      end
    end
    setGravityVector(PHASE_DATA_TBL[_phase].gravity_vector, A1_146 ~= nil and A1_146 or 0.5)
  end
end
function setGravityVector(A0_147, A1_148)
  local L2_149
  L2_149 = dm_pcSetGravityVector
  L2_149(A0_147, A1_148)
  L2_149 = _fall_ctrl_on_task
  if L2_149 ~= nil then
    L2_149 = _fall_ctrl_on_task
    L2_149 = L2_149.abort
    L2_149(L2_149)
  end
  L2_149 = {}
  L2_149.look_node = createGameObject2("Node")
  L2_149.look_node:setName("locator2_look_pos")
  L2_149.look_node:try_init()
  L2_149.look_task = nil
  function L2_149.update(A0_150)
    local L1_151
    L1_151 = 0
    while Player:getUnderfootObject() ~= nil do
      wait()
      L1_151 = L1_151 + 1
      if L1_151 >= 30 then
        return
      end
    end
    Fn_userCtrlAllOff()
    A0_150.look_node:waitForReady()
    A0_150.look_node:try_start()
    L2_149.look_node:setWorldPos(Fn_getPlayerWorldPos() + NormalizeVector(A0_147) * 10)
    A0_150.look_task = RAC_LookAtObject(A0_150.look_node, 0, 0.7)
    while Player:getUnderfootObject() == nil do
      wait()
      L2_149.look_node:setWorldPos(Fn_getPlayerWorldPos() + NormalizeVector(A0_147) * 10)
    end
    A0_150.look_task:abort()
    A0_150.look_task = nil
    Fn_userCtrlOn()
  end
  function L2_149.destructor(A0_152)
    if A0_152.look_task ~= nil then
      A0_152.look_task:abort()
      A0_152.look_task = nil
    end
    if A0_152.look_node ~= nil then
      A0_152.look_node:try_term()
      A0_152.look_node = nil
    end
  end
  _fall_ctrl_on_task = RAC_InvokeTaskWithDestractor(L2_149.update, L2_149.destructor, L2_149)
end
function memoryDebrisForceShift()
  local L0_153
  L0_153 = PHASE_DATA_TBL
  L0_153 = L0_153[_phase]
  L0_153 = L0_153.memory_data
  if L0_153 ~= nil then
    if L0_153.restart_node_name ~= nil then
      if L0_153.next_phase ~= nil then
        _restart_phase = L0_153.next_phase
      else
        _restart_phase = _phase
      end
      Fn_setCatWarpCheckPoint(L0_153.restart_node_name)
    end
    if L0_153.next_phase ~= nil then
      changePhase(L0_153.next_phase)
    end
  end
end
function checkFoundPlayer(A0_154)
  local L1_155, L2_156, L3_157, L4_158
  L2_156 = A0_154
  L1_155 = A0_154.getWorldTransform
  L2_156 = L1_155(L2_156)
  L3_157 = Fn_getDistanceToPlayer
  L4_158 = L1_155
  L3_157 = L3_157(L4_158)
  L4_158 = COLLECTOR_FIND_FRONT_DIST
  if L3_157 <= L4_158 then
    L4_158 = Query
    L4_158 = L4_158.setEyeSightTransform
    L4_158(L4_158, A0_154:getWorldTransform())
    L4_158 = Query
    L4_158 = L4_158.setEyeSightAngle
    L4_158(L4_158, Deg2Rad(30))
    L4_158 = Query
    L4_158 = L4_158.setEyeSightRange
    L4_158(L4_158, L3_157 + 1)
    L4_158 = Query
    L4_158 = L4_158.checkEyeSightSphere
    L4_158 = L4_158(L4_158, Fn_getPlayerWorldPos(), 1)
    if L4_158 then
      L4_158 = Query
      L4_158 = L4_158.raycastEyeSight
      L4_158 = L4_158(L4_158, Fn_getPlayerWorldPos())
      if L4_158 == nil then
        L4_158 = true
        return L4_158
      end
    end
  else
  end
  L4_158 = COLLECTOR_FIND_BEHIND_DIST
  if L3_157 <= L4_158 then
    L4_158 = Query
    L4_158 = L4_158.setEyeSightTransform
    L4_158(L4_158, A0_154:getWorldTransform())
    L4_158 = Query
    L4_158 = L4_158.setEyeSightRange
    L4_158(L4_158, L3_157 + 1)
    L4_158 = Query
    L4_158 = L4_158.raycastEyeSight
    L4_158 = L4_158(L4_158, Fn_getPlayerWorldPos())
    if L4_158 == nil then
      L4_158 = true
      return L4_158
    end
  end
  L4_158 = false
  return L4_158
end
function checkLostPlayer(A0_159)
  local L1_160, L2_161, L3_162, L4_163
  L2_161 = A0_159
  L1_160 = A0_159.getWorldTransform
  L2_161 = L1_160(L2_161)
  L3_162 = Fn_getDistanceToPlayer
  L4_163 = L1_160
  L3_162 = L3_162(L4_163)
  L4_163 = COLLECTOR_LOST_FRONT_DIST
  if L3_162 <= L4_163 then
    L4_163 = Query
    L4_163 = L4_163.setEyeSightTransform
    L4_163(L4_163, A0_159:getWorldTransform())
    L4_163 = Query
    L4_163 = L4_163.setEyeSightAngle
    L4_163(L4_163, Deg2Rad(30))
    L4_163 = Query
    L4_163 = L4_163.setEyeSightRange
    L4_163(L4_163, L3_162 + 1)
    L4_163 = Query
    L4_163 = L4_163.checkEyeSightSphere
    L4_163 = L4_163(L4_163, Fn_getPlayerWorldPos(), 1)
    if L4_163 then
      L4_163 = Query
      L4_163 = L4_163.raycastEyeSight
      L4_163 = L4_163(L4_163, Fn_getPlayerWorldPos())
      if L4_163 == nil then
        L4_163 = false
        return L4_163
      end
    end
  else
  end
  L4_163 = COLLECTOR_LOST_BEHIND_DIST
  if L3_162 <= L4_163 then
    L4_163 = Query
    L4_163 = L4_163.setEyeSightTransform
    L4_163(L4_163, A0_159:getWorldTransform())
    L4_163 = Query
    L4_163 = L4_163.setEyeSightRange
    L4_163(L4_163, L3_162 + 1)
    L4_163 = Query
    L4_163 = L4_163.raycastEyeSight
    L4_163 = L4_163(L4_163, Fn_getPlayerWorldPos())
    if L4_163 == nil then
      L4_163 = false
      return L4_163
    end
  end
  L4_163 = true
  return L4_163
end
function checkPreyPlayer(A0_164)
  Query:setEyeSightTransform(A0_164:getWorldTransform())
  Query:setEyeSightAngle(Deg2Rad(30))
  Query:setEyeSightRange(COLLECTOR_PREY_DIST)
  if Query:checkEyeSightSphere(Fn_getPlayerWorldPos(), 1) and Query:raycastEyeSight(Fn_getPlayerWorldPos()) == nil then
    return true
  else
    return false
  end
end
function invokeCollectorProcTask(A0_165, A1_166)
  local L2_167, L3_168, L4_169
  L3_168 = A0_165
  L2_167 = A0_165.getName
  L2_167 = L2_167(L3_168)
  L4_169 = A0_165
  L3_168 = A0_165.getSpecTable
  L3_168 = L3_168(L4_169)
  L3_168 = L3_168.spawnSet
  L3_168 = L3_168[1]
  L3_168 = L3_168.name
  L4_169 = _collector_work_tbl
  L4_169 = L4_169[L2_167]
  L4_169.state = ENM_STATE_PATROL
  L4_169 = A0_165.requestIdlingEnemy
  L4_169(A0_165, true)
  L4_169 = {}
  L4_169.proc_task = nil
  L4_169.eye_node = nil
  function L4_169.update(A0_170)
    local L1_171, L2_172, L3_173, L4_174, L5_175, L6_176, L7_177, L8_178, L9_179
    while true do
      L1_171 = A0_165
      L2_172 = L1_171
      L1_171 = L1_171.isSpawnOnStartFinished
      L1_171 = L1_171(L2_172)
      if L1_171 == false then
        L1_171 = print
        L2_172 = L3_168
        L3_173 = " : isSpawnOnStartFinished wait"
        L2_172 = L2_172 .. L3_173
        L1_171(L2_172)
        L1_171 = wait
        L1_171()
      end
    end
    L1_171 = findGameObject2
    L2_172 = "Puppet"
    L3_173 = L3_168
    L1_171 = L1_171(L2_172, L3_173)
    L3_173 = L1_171
    L2_172 = L1_171.getBrain
    L2_172 = L2_172(L3_173)
    while true do
      L4_174 = L2_172
      L3_173 = L2_172.isReadyEnemy
      L3_173 = L3_173(L4_174)
      if L3_173 == false then
        L3_173 = print
        L4_174 = L3_168
        L5_175 = " : isReadyEnemy wait"
        L4_174 = L4_174 .. L5_175
        L3_173(L4_174)
        L3_173 = wait
        L3_173()
      end
    end
    L4_174 = L2_172
    L3_173 = L2_172.setEnableHomingTarget
    L5_175 = false
    L3_173(L4_174, L5_175)
    L3_173 = createGameObject2
    L4_174 = "Node"
    L3_173 = L3_173(L4_174)
    A0_170.eye_node = L3_173
    L3_173 = A0_170.eye_node
    L4_174 = L3_173
    L3_173 = L3_173.setName
    L5_175 = L3_168
    L6_176 = "_eye_node"
    L5_175 = L5_175 .. L6_176
    L3_173(L4_174, L5_175)
    L4_174 = L1_171
    L3_173 = L1_171.appendChild
    L5_175 = A0_170.eye_node
    L3_173(L4_174, L5_175)
    L3_173 = A0_170.eye_node
    L4_174 = L3_173
    L3_173 = L3_173.setPos
    L5_175 = Vector
    L6_176 = 0
    L7_177 = 1
    L8_178 = 0
    L9_179 = L5_175(L6_176, L7_177, L8_178)
    L3_173(L4_174, L5_175, L6_176, L7_177, L8_178, L9_179, L5_175(L6_176, L7_177, L8_178))
    L3_173 = {}
    L4_174 = A1_166
    if L4_174 ~= nil then
      L4_174 = 1
      while true do
        L5_175 = 1
        while true do
          L6_176 = findGameObject2
          L7_177 = "Node"
          L8_178 = A1_166
          L9_179 = string
          L9_179 = L9_179.format
          L9_179 = L9_179("%02d_%02d", L4_174, L5_175)
          L8_178 = L8_178 .. L9_179
          L6_176 = L6_176(L7_177, L8_178)
          if L6_176 ~= nil then
            L7_177 = L3_173[L4_174]
            if L7_177 == nil then
              L7_177 = {}
              L3_173[L4_174] = L7_177
            end
            L7_177 = table
            L7_177 = L7_177.insert
            L8_178 = L3_173[L4_174]
            L9_179 = L6_176.getName
            L9_179 = L9_179(L6_176)
            L7_177(L8_178, L9_179, L9_179(L6_176))
          else
            break
          end
          L5_175 = L5_175 + 1
        end
        if not (L5_175 <= 1) then
          L4_174 = L4_174 + 1
        end
      end
    end
    L4_174 = nil
    L5_175 = 1
    L6_176 = #L3_173
    L7_177 = {}
    L8_178 = ENM_STATE_WAIT
    function L9_179(A0_180)
      return invokeTask(function()
        while true do
          wait()
        end
      end)
    end
    L7_177[L8_178] = L9_179
    L8_178 = ENM_STATE_PATROL
    function L9_179(A0_181)
      local L1_182
      L1_182 = {}
      L1_182.timer_task = nil
      function L1_182.update(A0_183)
        local L1_184, L2_185
        L1_184 = nil
        L2_185 = L6_176
        if L2_185 > 0 then
          while true do
            L2_185 = false
            L2_172:move(L3_173[L5_175])
            print(L3_168 .. " move step : " .. L5_175)
            while L2_172:isMoveEnd() == false do
              wait()
              L2_185 = checkFoundPlayer(L4_169.eye_node)
              if L2_185 ~= true then
              end
            end
            L2_172:endScriptAction()
            if L2_185 == true then
              _collector_work_tbl[L2_167].state = ENM_STATE_FOUND_PLAYER
              L4_174 = nil
              return
            end
            A0_183.timer_task = invokeTask(waitSeconds, 3)
            while A0_183.timer_task:isRunning() do
              wait()
              L2_185 = checkFoundPlayer(L4_169.eye_node)
              if L2_185 ~= true then
              end
            end
            A0_183.timer_task:abort()
            A0_183.timer_task = nil
            if L2_185 == true then
              _collector_work_tbl[L2_167].state = ENM_STATE_FOUND_PLAYER
              L4_174 = nil
              return
            end
            L5_175 = L5_175 + 1
            if L6_176 < L5_175 then
              L5_175 = 1
            end
          end
        while true do
          else
            L2_185 = wait
            L2_185()
            L2_185 = checkFoundPlayer
            L2_185 = L2_185(L4_169.eye_node)
            if L2_185 == true then
              L2_185 = _collector_work_tbl
              L2_185 = L2_185[L2_167]
              L2_185.state = ENM_STATE_FOUND_PLAYER
              L2_185 = nil
              L4_174 = L2_185
              return
            end
          end
        end
      end
      function L1_182.destractor(A0_186)
        if L2_172:isMoveEnd() == false then
          L2_172:endScriptAction()
        end
        if A0_186.timer_task ~= nil then
          A0_186.timer_task:abort()
          A0_186.timer_task = nil
        end
      end
      return RAC_InvokeTaskWithDestractor(L1_182.update, L1_182.destractor, L1_182)
    end
    L7_177[L8_178] = L9_179
    L8_178 = ENM_STATE_FOUND_PLAYER
    function L9_179(A0_187)
      local L1_188
      _trophy_40_attainable = false
      L1_188 = {}
      L1_188.timer_task = nil
      L1_188.target_pos_obj = nil
      function L1_188.update(A0_189)
        local L1_190, L2_191
        L1_190 = false
        L2_191 = 0
        while L2_191 < 30 do
          if checkPreyPlayer(L4_169.eye_node) == true then
            L1_190 = true
            break
          end
          wait()
          L2_191 = L2_191 + 1
        end
        if L1_190 == true then
          _collector_work_tbl[L2_167].state = ENM_STATE_PREY
          L4_174 = nil
          return
        end
        A0_165:requestIdlingEnemy(false)
        while checkLostPlayer(L4_169.eye_node) == false do
          if checkPreyPlayer(L4_169.eye_node) == true then
            L1_190 = true
            break
          end
          wait()
        end
        if L1_190 == true then
          _collector_work_tbl[L2_167].state = ENM_STATE_PREY
          L4_174 = nil
          return
        end
        _collector_work_tbl[L2_167].state = ENM_STATE_LOST_PLAYER
        L4_174 = nil
      end
      function L1_188.destractor(A0_192)
        if _collector_work_tbl[L2_167].state ~= ENM_STATE_PREY and _collector_work_tbl[L2_167].state ~= ENM_STATE_LOST_PLAYER then
          A0_165:requestIdlingEnemy(true)
        end
      end
      return RAC_InvokeTaskWithDestractor(L1_188.update, L1_188.destractor, L1_188)
    end
    L7_177[L8_178] = L9_179
    L8_178 = ENM_STATE_LOST_PLAYER
    function L9_179(A0_193)
      local L1_194
      L1_194 = {}
      function L1_194.update(A0_195)
        local L1_196
        L1_196 = 0
        while true do
          wait()
          if checkLostPlayer(L4_169.eye_node) == true then
            L1_196 = L1_196 + 1
            if L1_196 >= 90 then
              _collector_work_tbl[L2_167].state = ENM_STATE_PATROL
              L4_174 = nil
              return
            end
          elseif checkFoundPlayer(L4_169.eye_node) then
            L1_196 = 0
            _collector_work_tbl[L2_167].state = ENM_STATE_FOUND_PLAYER
            L4_174 = nil
            return
          end
        end
        A0_165:requestIdlingEnemy(true)
        L1_196 = 0
        while true do
          wait()
          if checkLostPlayer(L4_169.eye_node) == true then
            L1_196 = L1_196 + 1
            if L1_196 >= 30 then
              _collector_work_tbl[L2_167].state = ENM_STATE_PATROL
              L4_174 = nil
              return
            end
          else
            L1_196 = 0
            _collector_work_tbl[L2_167].state = ENM_STATE_FOUND_PLAYER
            L4_174 = nil
            return
          end
        end
      end
      function L1_194.destractor(A0_197)
        if _collector_work_tbl[L2_167].state ~= ENM_STATE_FOUND_PLAYER then
          A0_165:requestIdlingEnemy(true)
        end
      end
      return RAC_InvokeTaskWithDestractor(L1_194.update, L1_194.destractor, L1_194)
    end
    L7_177[L8_178] = L9_179
    L8_178 = ENM_STATE_PREY
    function L9_179(A0_198)
      local L1_199
      L1_199 = {}
      L1_199.main_task = invokeTask(function()
        while true do
          wait()
        end
      end)
      function L1_199.isRunning(A0_200)
        if A0_200.main_task == nil then
          return false
        end
        return A0_200.main_task:isRunning()
      end
      function L1_199.abort(A0_201)
        A0_165:requestIdlingEnemy(true)
        if A0_201.main_task ~= nil then
          A0_201.main_task:abort()
          A0_201.main_task = nil
        end
      end
      return L1_199
    end
    L7_177[L8_178] = L9_179
    while true do
      L8_178 = _collector_work_tbl
      L9_179 = L2_167
      L8_178 = L8_178[L9_179]
      L8_178 = L8_178.state
      L9_179 = L4_174
      L4_174 = nil
      print(L3_168 .. " state : " .. L8_178)
      A0_170.proc_task = L7_177[L8_178](L9_179)
      while A0_170.proc_task:isRunning() and _collector_work_tbl[L2_167].ex_req_state_data == nil do
        wait()
      end
      A0_170.proc_task:abort()
      A0_170.proc_task = nil
      if _collector_work_tbl[L2_167].ex_req_state_data ~= nil then
        _collector_work_tbl[L2_167].state = _collector_work_tbl[L2_167].ex_req_state_data.state
        L4_174 = _collector_work_tbl[L2_167].ex_req_state_data.arg
        _collector_work_tbl[L2_167].ex_req_state_data = nil
      end
    end
  end
  function L4_169.destractor(A0_202)
    if A0_202.eye_node ~= nil then
      A0_202.eye_node:try_term()
      A0_202.eye_node = nil
    end
    if A0_202.proc_task ~= nil then
      A0_202.proc_task:abort()
      A0_202.proc_task = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L4_169.update, L4_169.destractor, L4_169)
end
function showExtraMemDebrisCaption()
  local L0_203
  L0_203 = {
    "dm02_00119",
    "dm02_00120",
    "dm02_00121",
    "dm02_00122",
    "dm02_00123",
    "dm02_00124",
    "dm02_00125",
    "dm02_00126",
    "dm02_00127",
    "dm02_00128",
    "dm02_00129"
  }
  if _extra_mem_debris_caption_idx <= #L0_203 then
    Fn_captionView(L0_203[_extra_mem_debris_caption_idx])
    _extra_mem_debris_caption_idx = _extra_mem_debris_caption_idx + 1
  end
end
function memoryDebrisGetCallback(A0_204)
  if A0_204 == "babybed" then
  elseif A0_204 == "teddybear" then
    memoryDebrisForceShift()
  elseif A0_204 == "shoe" then
    memoryDebrisForceShift()
  elseif A0_204 == "graffiti" then
    memoryDebrisForceShift()
  elseif A0_204 == "birdcage" then
    memoryDebrisForceShift()
  elseif A0_204 == "schoolbag" then
    memoryDebrisForceShift()
  elseif A0_204 == "clock" then
    memoryDebrisForceShift()
  elseif A0_204 == "swing" then
    memoryDebrisForceShift()
  elseif A0_204 == "extra_01" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_02" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_03" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_04" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_05" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_06" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_07" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_08" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_09" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_10" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_11" then
    showExtraMemDebrisCaption()
  elseif A0_204 == "extra_12" then
    showExtraMemDebrisCaption()
  end
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__dm02) == 1 then
    for _FORV_5_ = #MEMORY_DEBRIS_PARAM_TBL, 2, -1 do
      if MEMORY_DEBRIS_PARAM_TBL[_FORV_5_].memory_name == A0_204 then
        if math.floor(GameDatabase:get(ggd.Savedata__EventFlags__dm02__flag01) / 2 ^ (_FORV_5_ - 1)) % 2 == 0 then
          HUD:counter99_99AddNum()
        end
        break
      end
    end
  end
end
function memoryAlternateSensorOnEnter(A0_205)
  local L1_206
  L1_206 = _is_out_of_range
  if L1_206 == false then
    L1_206 = PHASE_DATA_TBL
    L1_206 = L1_206[_phase]
    L1_206 = L1_206.memory_data
    if L1_206 ~= nil and L1_206.alternate_sensor_name == A0_205 then
      if L1_206.restart_node_name ~= nil then
        if L1_206.next_phase ~= nil then
          _restart_phase = L1_206.next_phase
        else
          _restart_phase = _phase
        end
        Fn_setCatWarpCheckPoint(L1_206.restart_node_name)
      end
      if L1_206.next_phase ~= nil then
        changePhase(L1_206.next_phase)
      end
    end
  end
end
function setMemoryEventFlag()
  _memory_event_flag_tbl[_phase] = true
end
function checkPointSensorOnEnter(A0_207)
  _is_in_check_point_sensor[A0_207] = true
  if _is_out_of_range == false then
    for _FORV_4_, _FORV_5_ in ipairs(PHASE_DATA_TBL[_phase].check_point_tbl) do
      if _FORV_5_.sensor_name == A0_207 then
        if _FORV_5_.restart_node_name ~= nil then
          if _FORV_5_.next_phase ~= nil then
            _restart_phase = _FORV_5_.next_phase
          else
            _restart_phase = _phase
          end
          Fn_setCatWarpCheckPoint(_FORV_5_.restart_node_name)
        end
        if _FORV_5_.next_phase ~= nil then
          changePhase(_FORV_5_.next_phase)
        end
        break
      end
    end
  end
end
function checkPointSensorOnLeave(A0_208)
  _is_in_check_point_sensor[A0_208] = false
end
function pccubesensor2_swing_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_swing")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00102")
    wait()
    Fn_captionViewWait("dm02_00103")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_swing,
      time = 6
    })
    bg_swing:setActive(false)
    Fn_lookAtObject(bg_swing):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("swing")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_babybed_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_babybed")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00104")
    wait()
    Fn_captionViewWait("dm02_00105")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_babybed,
      time = 6
    })
    bg_babybed:setActive(false)
    Fn_lookAtObject(bg_babybed):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("babybed")
    waitSeconds(2)
    setGettingMemoryDebris("babybed")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_teddybear_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_teddybear")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00106")
    wait()
    Fn_captionViewWait("dm02_00107")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_teddybear,
      time = 6
    })
    bg_teddybear:setActive(false)
    Fn_lookAtObject(bg_teddybear):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("teddybear")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_shoe_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_shoe")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00108")
    wait()
    Fn_captionViewWait("dm02_00109")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_shoe,
      time = 6
    })
    bg_shoe:setActive(false)
    Fn_lookAtObject(bg_shoe):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("shoe")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_graffiti_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_graffiti")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00110")
    wait()
    Fn_captionViewWait("dm02_00111")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_graffiti,
      time = 6
    })
    bg_graffiti:setActive(false)
    Fn_lookAtObject(bg_graffiti):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("graffiti")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_birdcage_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_birdcage")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00112")
    wait()
    Fn_captionViewWait("dm02_00113")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_birdcage,
      time = 6
    })
    bg_birdcage:setActive(false)
    Fn_lookAtObject(bg_birdcage):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("birdcage")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_schoolbag_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_schoolbag")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00114")
    wait()
    Fn_captionViewWait("dm02_00115")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_schoolbag,
      time = 6
    })
    bg_schoolbag:setActive(false)
    Fn_lookAtObject(bg_schoolbag):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("schoolbag")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_clock_OnEnter()
  setMemoryEventFlag()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_clock")
    Player:setControl(Player.kControl_All, false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_captionViewWait("dm02_00116")
    wait()
    Fn_captionViewWait("dm02_00117")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = bg_clock,
      time = 6
    })
    bg_clock:setActive(false)
    Fn_lookAtObject(clock_look):abort()
    waitSeconds(0.5)
    setActiveMemoryDebris("clock")
    Player:setControl(Player.kControl_All, true)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  end)
end
function pccubesensor2_alternate_swing_OnEnter(A0_209, A1_210)
  local L2_211
  L2_211 = memoryAlternateSensorOnEnter
  L2_211(A0_209:getName())
end
function pccubesensor2_alternate_teddybear_OnEnter(A0_212, A1_213)
  local L2_214
  L2_214 = memoryAlternateSensorOnEnter
  L2_214(A0_212:getName())
end
function pccubesensor2_alternate_shoe_OnEnter(A0_215, A1_216)
  local L2_217
  L2_217 = memoryAlternateSensorOnEnter
  L2_217(A0_215:getName())
end
function pccubesensor2_alternate_graffiti_OnEnter(A0_218, A1_219)
  local L2_220
  L2_220 = memoryAlternateSensorOnEnter
  L2_220(A0_218:getName())
end
function pccubesensor2_alternate_birdcage_OnEnter(A0_221, A1_222)
  local L2_223
  L2_223 = memoryAlternateSensorOnEnter
  L2_223(A0_221:getName())
end
function pccubesensor2_alternate_schoolbag_OnEnter(A0_224, A1_225)
  local L2_226
  L2_226 = memoryAlternateSensorOnEnter
  L2_226(A0_224:getName())
end
function pccubesensor2_alternate_clock_OnEnter(A0_227, A1_228)
  local L2_229
  L2_229 = memoryAlternateSensorOnEnter
  L2_229(A0_227:getName())
end
function pccubesensor2_outrange_OnLeave()
  local L0_230, L1_231
  _is_out_of_range = true
end
function pccubesensor2_check_point_A_01_01_OnEnter(A0_232, A1_233)
  local L2_234
  L2_234 = checkPointSensorOnEnter
  L2_234(A0_232:getName())
end
function pccubesensor2_check_point_A_01_01_OnLeave(A0_235, A1_236)
  local L2_237
  L2_237 = checkPointSensorOnLeave
  L2_237(A0_235:getName())
end
function pccubesensor2_check_point_A_01_02_OnEnter(A0_238, A1_239)
  local L2_240
  L2_240 = checkPointSensorOnEnter
  L2_240(A0_238:getName())
end
function pccubesensor2_check_point_A_01_02_OnLeave(A0_241, A1_242)
  local L2_243
  L2_243 = checkPointSensorOnLeave
  L2_243(A0_241:getName())
end
function pccubesensor2_check_point_A_01_03_OnEnter(A0_244, A1_245)
  local L2_246
  L2_246 = checkPointSensorOnEnter
  L2_246(A0_244:getName())
end
function pccubesensor2_check_point_A_01_03_OnLeave(A0_247, A1_248)
  local L2_249
  L2_249 = checkPointSensorOnLeave
  L2_249(A0_247:getName())
end
function pccubesensor2_check_point_A_01_04_OnEnter(A0_250, A1_251)
  local L2_252
  L2_252 = checkPointSensorOnEnter
  L2_252(A0_250:getName())
end
function pccubesensor2_check_point_A_01_04_OnLeave(A0_253, A1_254)
  local L2_255
  L2_255 = checkPointSensorOnLeave
  L2_255(A0_253:getName())
end
function pccubesensor2_check_point_B_02_01_OnEnter(A0_256, A1_257)
  local L2_258
  L2_258 = checkPointSensorOnEnter
  L2_258(A0_256:getName())
end
function pccubesensor2_check_point_B_02_01_OnLeave(A0_259, A1_260)
  local L2_261
  L2_261 = checkPointSensorOnLeave
  L2_261(A0_259:getName())
end
function pccubesensor2_check_point_B_02_02_OnEnter(A0_262, A1_263)
  local L2_264
  L2_264 = checkPointSensorOnEnter
  L2_264(A0_262:getName())
end
function pccubesensor2_check_point_B_02_02_OnLeave(A0_265, A1_266)
  local L2_267
  L2_267 = checkPointSensorOnLeave
  L2_267(A0_265:getName())
end
function pccubesensor2_check_point_B_02_03_OnEnter(A0_268, A1_269)
  local L2_270
  L2_270 = checkPointSensorOnEnter
  L2_270(A0_268:getName())
end
function pccubesensor2_check_point_B_02_03_OnLeave(A0_271, A1_272)
  local L2_273
  L2_273 = checkPointSensorOnLeave
  L2_273(A0_271:getName())
end
function pccubesensor2_check_point_C_03_01_OnEnter(A0_274, A1_275)
  local L2_276
  L2_276 = checkPointSensorOnEnter
  L2_276(A0_274:getName())
end
function pccubesensor2_check_point_C_03_01_OnLeave(A0_277, A1_278)
  local L2_279
  L2_279 = checkPointSensorOnLeave
  L2_279(A0_277:getName())
end
function pccubesensor2_check_point_C_03_02_OnEnter(A0_280, A1_281)
  local L2_282
  L2_282 = checkPointSensorOnEnter
  L2_282(A0_280:getName())
end
function pccubesensor2_check_point_C_03_02_OnLeave(A0_283, A1_284)
  local L2_285
  L2_285 = checkPointSensorOnLeave
  L2_285(A0_283:getName())
end
function pccubesensor2_check_point_A_04_01_OnEnter(A0_286, A1_287)
  local L2_288
  L2_288 = checkPointSensorOnEnter
  L2_288(A0_286:getName())
end
function pccubesensor2_check_point_A_04_01_OnLeave(A0_289, A1_290)
  local L2_291
  L2_291 = checkPointSensorOnLeave
  L2_291(A0_289:getName())
end
function pccubesensor2_check_point_D_05_01_OnEnter(A0_292, A1_293)
  local L2_294
  L2_294 = checkPointSensorOnEnter
  L2_294(A0_292:getName())
end
function pccubesensor2_check_point_D_05_01_OnLeave(A0_295, A1_296)
  local L2_297
  L2_297 = checkPointSensorOnLeave
  L2_297(A0_295:getName())
end
function pccubesensor2_check_point_E_06_01_OnEnter(A0_298, A1_299)
  local L2_300
  L2_300 = checkPointSensorOnEnter
  L2_300(A0_298:getName())
end
function pccubesensor2_check_point_E_06_01_OnLeave(A0_301, A1_302)
  local L2_303
  L2_303 = checkPointSensorOnLeave
  L2_303(A0_301:getName())
end
function pccubesensor2_check_point_F_07_01_OnEnter(A0_304, A1_305)
  local L2_306
  L2_306 = checkPointSensorOnEnter
  L2_306(A0_304:getName())
end
function pccubesensor2_check_point_F_07_01_OnLeave(A0_307, A1_308)
  local L2_309
  L2_309 = checkPointSensorOnLeave
  L2_309(A0_307:getName())
end
function pccubesensor2_check_point_H_09_01_OnEnter(A0_310, A1_311)
  local L2_312
  L2_312 = checkPointSensorOnEnter
  L2_312(A0_310:getName())
end
function pccubesensor2_check_point_H_09_01_OnLeave(A0_313, A1_314)
  local L2_315
  L2_315 = checkPointSensorOnLeave
  L2_315(A0_313:getName())
end
function pccubesensor2_check_point_I_10_01_OnEnter(A0_316, A1_317)
  local L2_318
  L2_318 = checkPointSensorOnEnter
  L2_318(A0_316:getName())
end
function pccubesensor2_check_point_I_10_01_OnLeave(A0_319, A1_320)
  local L2_321
  L2_321 = checkPointSensorOnLeave
  L2_321(A0_319:getName())
end
function pccubesensor2_check_point_I_10_02_OnEnter(A0_322, A1_323)
  local L2_324
  L2_324 = checkPointSensorOnEnter
  L2_324(A0_322:getName())
end
function pccubesensor2_check_point_I_10_02_OnLeave(A0_325, A1_326)
  local L2_327
  L2_327 = checkPointSensorOnLeave
  L2_327(A0_325:getName())
end
function pccubesensor2_check_point_J_11_01_OnEnter(A0_328, A1_329)
  local L2_330
  L2_330 = checkPointSensorOnEnter
  L2_330(A0_328:getName())
end
function pccubesensor2_check_point_J_11_01_OnLeave(A0_331, A1_332)
  local L2_333
  L2_333 = checkPointSensorOnLeave
  L2_333(A0_331:getName())
end
function pccubesensor2_check_point_L_13_01_OnEnter(A0_334, A1_335)
  local L2_336
  L2_336 = checkPointSensorOnEnter
  L2_336(A0_334:getName())
end
function pccubesensor2_check_point_L_13_01_OnLeave(A0_337, A1_338)
  local L2_339
  L2_339 = checkPointSensorOnLeave
  L2_339(A0_337:getName())
end
function pccubesensor2_goal_OnEnter(A0_340, A1_341)
  local L2_342
  L2_342 = checkPointSensorOnEnter
  L2_342(A0_340:getName())
end
function pccubesensor2_goal_OnLeave(A0_343, A1_344)
  local L2_345
  L2_345 = checkPointSensorOnLeave
  L2_345(A0_343:getName())
end
