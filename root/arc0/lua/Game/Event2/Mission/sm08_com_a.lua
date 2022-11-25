dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
MAX_MOVE_LANDINGSHIP_NUM_B = 6
MAX_MOVE_LANDINGSHIP_NUM_C = 6
MAX_MOVE_LANDINGSHIP_NUM_D = 7
_area_move_flg = false
_area_move_switch = false
_area_warp_flg_01 = false
_area_warp_flg_02 = false
_area_warp_switch = false
_load_area_flg_01 = false
_load_area_flg_02 = false
_load_anim_num = 0
_transport_ship_hdl = nil
_enmgen_name = nil
_fi_enmgen_name = nil
_is_enemy_spawn_request = false
_is_fi_spawn_request = false
_enemy_count = 0
_land_enemy_count = 0
_npc_puppet_tbl = {}
_phase_b = {}
_route_b = {}
_phase_c = {}
_route_c = {}
_phase_d = {}
_route_d = {}
_landingship_move_b_01 = false
_landingship_move_b_02 = false
_landingship_move_b_03 = false
_landingship_move_c_01 = false
_landingship_move_c_02 = false
_landingship_move_c_03_01 = false
_landingship_move_c_03_02 = false
_landingship_move_c_03_03 = false
_landingship_move_c_03_04 = false
_landingship_move_d_01 = false
_landingship_move_d_02 = false
_landingship_move_d_03 = false
_landingship_move_d_04 = false
_landingship_move_d_05 = false
_enm_not_ash_num_01 = 8
_enm_not_ash_num_02 = 10
_enm_not_ash_num_03 = 8
_fi_hdl = nil
_box_hdl = {}
_box_break = {}
_break_box_count = 0
_box_break_all_part = false
_view_control_on = {}
_enemy_all_spec_tbl = {
  "enmgen2_phase01_start_f_01",
  "enmgen2_phase01_start_c_01",
  "enmgen2_phase01_add_f_01",
  "enmgen2_phase01_add_c_01_01",
  "enmgen2_phase01_add_f_02",
  "enmgen2_phase01_add_c_02_01",
  "enmgen2_phase01_add_c_02_02",
  "enmgen2_phase02_start_landing_01",
  "enmgen2_phase02_start_trans_01",
  "enmgen2_phase02_add_trans_01",
  "enmgen2_phase03_01_01",
  "enmgen2_phase03_01_02",
  "enmgen2_phase03_02_01",
  "enmgen2_phase03_03_01",
  "enmgen2_phase03_03_02",
  "enmgen2_phase03_04_01",
  "enmgen2_phase03_05_01"
}
enmgen2_phase01_start_f_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_01",
      name = "phase01_start_sol_01",
      target_vehicle = "phase01_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_01",
      name = "phase01_start_sol_02",
      target_vehicle = "phase01_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_01",
      name = "phase01_start_sol_03",
      target_vehicle = "phase01_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_01",
      name = "phase01_start_sol_04",
      target_vehicle = "phase01_landingship01"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase01_01",
      name = "phase01_landingship01"
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
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    local L2_10
    L2_10 = _enemy_count
    L2_10 = L2_10 + 1
    _enemy_count = L2_10
    L2_10 = _enm_not_ash_num_01
    L2_10 = L2_10 - 1
    _enm_not_ash_num_01 = L2_10
  end,
  onSpawn = function(A0_11, A1_12)
  end
}
enmgen2_phase01_start_c_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_05",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_06",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_07",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_08",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_09",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_10",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_11",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_start_sol_12",
      target_vehicle = "phase01_landingship02"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase01_02",
      name = "phase01_landingship02"
    }
  },
  onUpdate = function(A0_13)
    local L1_14
  end,
  onEnter = function(A0_15)
    local L1_16
  end,
  onLeave = function(A0_17)
    local L1_18
  end,
  onObjectDead = function(A0_19, A1_20)
  end,
  onObjectAsh = function(A0_21, A1_22)
    local L2_23
    L2_23 = _enemy_count
    L2_23 = L2_23 + 1
    _enemy_count = L2_23
    L2_23 = _enm_not_ash_num_01
    L2_23 = L2_23 - 1
    _enm_not_ash_num_01 = L2_23
  end,
  onSpawn = function(A0_24, A1_25)
  end
}
enmgen2_phase01_add_f_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_phase01_01",
      name = "phase01_add_sol_01_01",
      target_vehicle = "phase01_mechsky01"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_phase01_01",
      name = "phase01_mechsky01"
    }
  },
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
    local L2_36
    L2_36 = _enemy_count
    L2_36 = L2_36 + 1
    _enemy_count = L2_36
    L2_36 = _enm_not_ash_num_01
    L2_36 = L2_36 - 1
    _enm_not_ash_num_01 = L2_36
  end,
  onSpawn = function(A0_37, A1_38)
  end
}
enmgen2_phase01_add_c_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_add_sol_01_02",
      target_vehicle = "phase01_landingship04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_add_sol_01_03",
      target_vehicle = "phase01_landingship04"
    },
    {
      type = "officer_rifle",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_add_sol_01_04",
      target_vehicle = "phase01_landingship04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_add_sol_01_05",
      target_vehicle = "phase01_landingship04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_add_sol_01_06",
      target_vehicle = "phase01_landingship04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_add_sol_01_07",
      target_vehicle = "phase01_landingship04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_add_sol_01_08",
      target_vehicle = "phase01_landingship04"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase01_04",
      name = "phase01_landingship04"
    }
  },
  onUpdate = function(A0_39)
    local L1_40
  end,
  onEnter = function(A0_41)
    local L1_42
  end,
  onLeave = function(A0_43)
    local L1_44
  end,
  onObjectDead = function(A0_45, A1_46)
  end,
  onObjectAsh = function(A0_47, A1_48)
    local L2_49
    L2_49 = _enemy_count
    L2_49 = L2_49 + 1
    _enemy_count = L2_49
    L2_49 = _enm_not_ash_num_01
    L2_49 = L2_49 - 1
    _enm_not_ash_num_01 = L2_49
  end,
  onSpawn = function(A0_50, A1_51)
  end,
  onSetupGem = function(A0_52, A1_53)
    Fn_enemyPopGemSetup(A0_52, {
      "phase01_add_sol_01_04"
    }, 1, 5, "A")
  end,
  onPopGem = function(A0_54, A1_55)
    Fn_enemyAshPopGem(A0_54, A1_55, {"A"})
  end
}
enmgen2_phase01_add_f_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_05",
      name = "phase01_add_sol_02_01",
      target_vehicle = "phase01_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_05",
      name = "phase01_add_sol_02_02",
      target_vehicle = "phase01_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_05",
      name = "phase01_add_sol_02_03",
      target_vehicle = "phase01_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_05",
      name = "phase01_add_sol_02_04",
      target_vehicle = "phase01_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_05",
      name = "phase01_add_sol_02_05",
      target_vehicle = "phase01_landingship05"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase01_05",
      name = "phase01_landingship05"
    }
  },
  onUpdate = function(A0_56)
    local L1_57
  end,
  onEnter = function(A0_58)
    local L1_59
  end,
  onLeave = function(A0_60)
    local L1_61
  end,
  onObjectDead = function(A0_62, A1_63)
  end,
  onObjectAsh = function(A0_64, A1_65)
    local L2_66
    L2_66 = _enemy_count
    L2_66 = L2_66 + 1
    _enemy_count = L2_66
    L2_66 = _enm_not_ash_num_01
    L2_66 = L2_66 - 1
    _enm_not_ash_num_01 = L2_66
  end,
  onSpawn = function(A0_67, A1_68)
  end
}
enmgen2_phase01_add_c_02_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_06",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_07",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_08",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_09",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_10",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_11",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_12",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_13",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_14",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_15",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_16",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_17",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_18",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_19",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_20",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_21",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_add_sol_02_22",
      target_vehicle = "phase01_landingship06"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase01_06",
      name = "phase01_landingship06"
    }
  },
  onUpdate = function(A0_69)
    local L1_70
  end,
  onEnter = function(A0_71)
    local L1_72
  end,
  onLeave = function(A0_73)
    local L1_74
  end,
  onObjectDead = function(A0_75, A1_76)
  end,
  onObjectAsh = function(A0_77, A1_78)
    local L2_79
    L2_79 = _enemy_count
    L2_79 = L2_79 + 1
    _enemy_count = L2_79
    L2_79 = _enm_not_ash_num_01
    L2_79 = L2_79 - 1
    _enm_not_ash_num_01 = L2_79
  end,
  onSpawn = function(A0_80, A1_81)
  end
}
enmgen2_phase01_add_c_02_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_phase01_02",
      name = "phase01_add_sol_02_23",
      target_vehicle = "phase01_mechsky02"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_phase01_02",
      name = "phase01_mechsky02"
    }
  },
  onUpdate = function(A0_82)
    local L1_83
  end,
  onEnter = function(A0_84)
    local L1_85
  end,
  onLeave = function(A0_86)
    local L1_87
  end,
  onObjectDead = function(A0_88, A1_89)
  end,
  onObjectAsh = function(A0_90, A1_91)
    local L2_92
    L2_92 = _enemy_count
    L2_92 = L2_92 + 1
    _enemy_count = L2_92
    L2_92 = _enm_not_ash_num_01
    L2_92 = L2_92 - 1
    _enm_not_ash_num_01 = L2_92
  end,
  onSpawn = function(A0_93, A1_94)
  end
}
enmgen2_phase02_start_landing_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator2_phase02_start_spawn_lan_01",
      name = "phase02_start_landingsol_01",
      target_vehicle = "phase02_sublandingship_03",
      ai_spawn_option = "Soldier/sm08_soldier_05"
    },
    {
      type = "officer_rifle",
      locator = "locator2_phase02_start_spawn_lan_02",
      name = "phase02_start_landingsol_02",
      target_vehicle = "phase02_sublandingship_02",
      ai_spawn_option = "Soldier/sm08_soldier_04"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_03",
      name = "phase02_start_landingsol_03",
      target_vehicle = "phase02_sublandingship_04",
      ai_spawn_option = "Soldier/sm08_soldier_01"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_04",
      name = "phase02_start_landingsol_04",
      target_vehicle = "phase02_sublandingship_04",
      ai_spawn_option = "Soldier/sm08_soldier_02"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_05",
      name = "phase02_start_landingsol_05",
      target_vehicle = "phase02_sublandingship_02",
      ai_spawn_option = "Soldier/sm08_soldier_03"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_06",
      name = "phase02_start_landingsol_06",
      target_vehicle = "phase02_sublandingship_02",
      ai_spawn_option = "Soldier/sm08_soldier_04"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_07",
      name = "phase02_start_landingsol_07",
      target_vehicle = "phase02_sublandingship_03",
      ai_spawn_option = "Soldier/sm08_soldier_05"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_08",
      name = "phase02_start_landingsol_08",
      target_vehicle = "phase02_sublandingship_03",
      ai_spawn_option = "Soldier/sm08_soldier_06"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_09",
      name = "phase02_start_landingsol_09",
      target_vehicle = "phase02_sublandingship_01",
      ai_spawn_option = "Soldier/sm08_soldier_07"
    },
    {
      type = "soldier_launcher",
      locator = "locator2_phase02_start_spawn_lan_10",
      name = "phase02_start_landingsol_10",
      target_vehicle = "phase02_sublandingship_01",
      ai_spawn_option = "Soldier/sm08_soldier_08"
    },
    {
      type = "landingship",
      locator = "locator2_phase02_sublandingship_01",
      name = "phase02_sublandingship_01"
    },
    {
      type = "landingship",
      locator = "locator2_phase02_sublandingship_02",
      name = "phase02_sublandingship_02"
    },
    {
      type = "landingship",
      locator = "locator2_phase02_sublandingship_03",
      name = "phase02_sublandingship_03"
    },
    {
      type = "landingship",
      locator = "locator2_phase02_sublandingship_04",
      name = "phase02_sublandingship_04"
    }
  },
  onUpdate = function(A0_95)
    local L1_96
  end,
  onEnter = function(A0_97)
    local L1_98
  end,
  onLeave = function(A0_99)
    local L1_100
  end,
  onObjectDead = function(A0_101, A1_102)
  end,
  onObjectAsh = function(A0_103, A1_104)
    local L2_105
    L2_105 = _enemy_count
    L2_105 = L2_105 + 1
    _enemy_count = L2_105
    L2_105 = _land_enemy_count
    L2_105 = L2_105 + 1
    _land_enemy_count = L2_105
    L2_105 = _enm_not_ash_num_02
    L2_105 = L2_105 - 1
    _enm_not_ash_num_02 = L2_105
  end,
  onSpawn = function(A0_106, A1_107)
  end,
  onSetupGem = function(A0_108, A1_109)
    Fn_enemyPopGemSetup(A0_108, {
      "phase02_start_landingsol_01",
      "phase02_start_landingsol_02"
    }, 1, 5, "A")
  end,
  onPopGem = function(A0_110, A1_111)
    Fn_enemyAshPopGem(A0_110, A1_111, {"A"})
  end
}
enmgen2_phase02_start_trans_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_start_transsol_01",
      target_vehicle = "phase02_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_start_transsol_02",
      target_vehicle = "phase02_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_start_transsol_03",
      target_vehicle = "phase02_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_start_transsol_04",
      target_vehicle = "phase02_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_start_transsol_05",
      target_vehicle = "phase02_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_start_transsol_06",
      target_vehicle = "phase02_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_start_transsol_07",
      target_vehicle = "phase02_landingship01"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase02_01",
      name = "phase02_landingship01"
    }
  },
  onUpdate = function(A0_112)
    local L1_113
  end,
  onEnter = function(A0_114)
    local L1_115
  end,
  onLeave = function(A0_116)
    local L1_117
  end,
  onObjectDead = function(A0_118, A1_119)
  end,
  onObjectAsh = function(A0_120, A1_121)
    _enemy_count = _enemy_count + 1
  end,
  onSpawn = function(A0_122, A1_123)
  end
}
enmgen2_phase02_add_trans_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_01",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_02",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_03",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_04",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_05",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_06",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_07",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_08",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_09",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_add_transsol_01_10",
      target_vehicle = "phase02_landingship02"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase02_02",
      name = "phase02_landingship02"
    }
  },
  onUpdate = function(A0_124)
    local L1_125
  end,
  onEnter = function(A0_126)
    local L1_127
  end,
  onLeave = function(A0_128)
    local L1_129
  end,
  onObjectDead = function(A0_130, A1_131)
  end,
  onObjectAsh = function(A0_132, A1_133)
    _enemy_count = _enemy_count + 1
  end,
  onSpawn = function(A0_134, A1_135)
  end
}
enmgen2_president_ship_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_pre_landingship_01",
      name = "dummy_sol_01",
      target_vehicle = "president_ship_01"
    },
    {
      type = "landingship",
      locator = "locator2_pre_landingship_01",
      name = "president_ship_01"
    }
  },
  onUpdate = function(A0_136)
    local L1_137
  end,
  onEnter = function(A0_138)
    local L1_139
  end,
  onLeave = function(A0_140)
    local L1_141
  end,
  onObjectDead = function(A0_142, A1_143)
  end
}
enmgen2_phase03_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_01",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_02",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_03",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_04",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_05",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_06",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_07",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_08",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_09",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_10",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_11",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_12",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_13",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_14",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_15",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_16",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_17",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_sol_01_18",
      target_vehicle = "phase03_landingship01"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase03_01",
      name = "phase03_landingship01"
    }
  },
  onUpdate = function(A0_144)
    local L1_145
  end,
  onEnter = function(A0_146)
    local L1_147
  end,
  onLeave = function(A0_148)
    local L1_149
  end,
  onObjectDead = function(A0_150, A1_151)
  end,
  onObjectAsh = function(A0_152, A1_153)
    local L2_154
    L2_154 = _enemy_count
    L2_154 = L2_154 + 1
    _enemy_count = L2_154
    L2_154 = _enm_not_ash_num_03
    L2_154 = L2_154 - 1
    _enm_not_ash_num_03 = L2_154
  end,
  onSpawn = function(A0_155, A1_156)
  end
}
enmgen2_phase03_01_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_02",
      name = "phase03_sol_02_01",
      target_vehicle = "phase03_sol_02_02"
    },
    {
      type = "mechsmall",
      locator = "locator2_landingship_phase03_02",
      name = "phase03_sol_02_02",
      target_vehicle = "phase03_landingship02"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase03_02",
      name = "phase03_landingship02"
    }
  },
  onUpdate = function(A0_157)
    local L1_158
  end,
  onEnter = function(A0_159)
    local L1_160
  end,
  onLeave = function(A0_161)
    local L1_162
  end,
  onObjectDead = function(A0_163, A1_164)
    print(A1_164:getName() .. "\230\173\187\228\186\161")
  end,
  onObjectAsh = function(A0_165, A1_166)
    _enemy_count = _enemy_count + 1
    _enm_not_ash_num_03 = _enm_not_ash_num_03 - 1
    print(A1_166:getName() .. "\231\128\149\230\173\187")
  end,
  onSpawn = function(A0_167, A1_168)
  end,
  onSetupGem = function(A0_169, A1_170)
  end,
  onPopGem = function(A0_171, A1_172)
    Fn_enemyAshPopGem(A0_171, A1_172, {"A"})
  end
}
enmgen2_phase03_02_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_01",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_02",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_03",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_04",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_05",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "officer_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_06",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_07",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_08",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_09",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_sol_03_10",
      target_vehicle = "phase03_landingship03"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase03_03",
      name = "phase03_landingship03"
    }
  },
  onUpdate = function(A0_173)
    local L1_174
  end,
  onEnter = function(A0_175)
    local L1_176
  end,
  onLeave = function(A0_177)
    local L1_178
  end,
  onObjectDead = function(A0_179, A1_180)
  end,
  onObjectAsh = function(A0_181, A1_182)
    local L2_183
    L2_183 = _enemy_count
    L2_183 = L2_183 + 1
    _enemy_count = L2_183
    L2_183 = _enm_not_ash_num_03
    L2_183 = L2_183 - 1
    _enm_not_ash_num_03 = L2_183
  end,
  onSpawn = function(A0_184, A1_185)
  end,
  onSetupGem = function(A0_186, A1_187)
    Fn_enemyPopGemSetup(A0_186, {
      "phase03_sol_03_06"
    }, 1, 5, "A")
  end,
  onPopGem = function(A0_188, A1_189)
    Fn_enemyAshPopGem(A0_188, A1_189, {"A"})
  end
}
enmgen2_phase03_03_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_04",
      name = "phase03_sol_04_01",
      target_vehicle = "phase03_sol_04_02"
    },
    {
      type = "mechsmall",
      locator = "locator2_landingship_phase03_04",
      name = "phase03_sol_04_02",
      target_vehicle = "phase03_landingship04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_04",
      name = "phase03_sol_04_03",
      target_vehicle = "phase03_sol_04_04"
    },
    {
      type = "mechsmall",
      locator = "locator2_landingship_phase03_04",
      name = "phase03_sol_04_04",
      target_vehicle = "phase03_landingship04"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase03_04",
      name = "phase03_landingship04"
    }
  },
  onUpdate = function(A0_190)
    local L1_191
  end,
  onEnter = function(A0_192)
    local L1_193
  end,
  onLeave = function(A0_194)
    local L1_195
  end,
  onObjectDead = function(A0_196, A1_197)
  end,
  onObjectAsh = function(A0_198, A1_199)
    local L2_200
    L2_200 = _enemy_count
    L2_200 = L2_200 + 1
    _enemy_count = L2_200
    L2_200 = _enm_not_ash_num_03
    L2_200 = L2_200 - 1
    _enm_not_ash_num_03 = L2_200
  end,
  onSpawn = function(A0_201, A1_202)
  end,
  onSetupGem = function(A0_203, A1_204)
    Fn_enemyPopGemSetup(A0_203, {
      "phase03_add_sol_04_01"
    }, 1, 5, "A")
  end,
  onPopGem = function(A0_205, A1_206)
    Fn_enemyAshPopGem(A0_205, A1_206, {"A"})
  end
}
enmgen2_phase03_03_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_01",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_02",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_03",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_04",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_05",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_06",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_07",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_08",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_09",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_10",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_11",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_12",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_13",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_14",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_sol_05_15",
      target_vehicle = "phase03_landingship05"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase03_05",
      name = "phase03_landingship05"
    }
  },
  onUpdate = function(A0_207)
    local L1_208
  end,
  onEnter = function(A0_209)
    local L1_210
  end,
  onLeave = function(A0_211)
    local L1_212
  end,
  onObjectDead = function(A0_213, A1_214)
  end,
  onObjectAsh = function(A0_215, A1_216)
    local L2_217
    L2_217 = _enemy_count
    L2_217 = L2_217 + 1
    _enemy_count = L2_217
    L2_217 = _enm_not_ash_num_03
    L2_217 = L2_217 - 1
    _enm_not_ash_num_03 = L2_217
  end,
  onSpawn = function(A0_218, A1_219)
  end
}
enmgen2_phase03_04_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_01",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_02",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_03",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_04",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "officer_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_05",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_06",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_07",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_08",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_09",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "officer_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_10",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_11",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_sol_06_12",
      target_vehicle = "phase03_landingship06"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase03_06",
      name = "phase03_landingship06"
    }
  },
  onUpdate = function(A0_220)
    local L1_221
  end,
  onEnter = function(A0_222)
    local L1_223
  end,
  onLeave = function(A0_224)
    local L1_225
  end,
  onObjectDead = function(A0_226, A1_227)
  end,
  onObjectAsh = function(A0_228, A1_229)
    local L2_230
    L2_230 = _enemy_count
    L2_230 = L2_230 + 1
    _enemy_count = L2_230
    L2_230 = _enm_not_ash_num_03
    L2_230 = L2_230 - 1
    _enm_not_ash_num_03 = L2_230
  end,
  onSpawn = function(A0_231, A1_232)
  end,
  onSetupGem = function(A0_233, A1_234)
    Fn_enemyPopGemSetup(A0_233, {
      "phase03_sol_06_05"
    }, 1, 5, "A")
  end,
  onPopGem = function(A0_235, A1_236)
    Fn_enemyAshPopGem(A0_235, A1_236, {"A"})
  end
}
enmgen2_phase03_05_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_01",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_02",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_03",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_04",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "officer_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_05",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_06",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_07",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_08",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_09",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "officer_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_10",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_11",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_sol_07_12",
      target_vehicle = "phase03_landingship07"
    },
    {
      type = "landingship",
      locator = "locator2_landingship_phase03_07",
      name = "phase03_landingship07"
    }
  },
  onUpdate = function(A0_237)
    local L1_238
  end,
  onEnter = function(A0_239)
    local L1_240
  end,
  onLeave = function(A0_241)
    local L1_242
  end,
  onObjectDead = function(A0_243, A1_244)
  end,
  onObjectAsh = function(A0_245, A1_246)
    local L2_247
    L2_247 = _enemy_count
    L2_247 = L2_247 + 1
    _enemy_count = L2_247
    L2_247 = _enm_not_ash_num_03
    L2_247 = L2_247 - 1
    _enm_not_ash_num_03 = L2_247
  end,
  onSpawn = function(A0_248, A1_249)
  end,
  onSetupGem = function(A0_250, A1_251)
    Fn_enemyPopGemSetup(A0_250, {
      "phase03_sol_07_05"
    }, 1, 5, "A")
  end,
  onPopGem = function(A0_252, A1_253)
    Fn_enemyAshPopGem(A0_252, A1_253, {"A"})
  end
}
enmgen2_fi_battle_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi",
      locator = "locator2_fi_battle_01",
      name = "fi_battle_01",
      ai_spawn_option = "Fi/fi_sm08"
    }
  },
  onUpdate = function(A0_254)
    local L1_255
  end,
  onEnter = function(A0_256)
    local L1_257
  end,
  onLeave = function(A0_258)
    local L1_259
  end,
  onObjectDead = function(A0_260, A1_261)
  end,
  onObjectAsh = function(A0_262, A1_263)
  end,
  onSpawn = function(A0_264, A1_265)
  end
}
enmgen2_fi_battle_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi",
      locator = "locator2_fi_battle_02",
      name = "fi_battle_02",
      ai_spawn_option = "Fi/fi_sm08"
    }
  },
  onUpdate = function(A0_266)
    local L1_267
  end,
  onEnter = function(A0_268)
    local L1_269
  end,
  onLeave = function(A0_270)
    local L1_271
  end,
  onObjectDead = function(A0_272, A1_273)
  end,
  onObjectAsh = function(A0_274, A1_275)
  end,
  onSpawn = function(A0_276, A1_277)
  end
}
function Initialize()
  for _FORV_4_ = 1, MAX_MOVE_LANDINGSHIP_NUM_B do
    _route_b[_FORV_4_] = 0
    _phase_b[_FORV_4_] = 0
  end
  for _FORV_4_ = 1, MAX_MOVE_LANDINGSHIP_NUM_C do
    _route_c[_FORV_4_] = 0
    _phase_c[_FORV_4_] = 0
  end
  for _FORV_4_ = 1, MAX_MOVE_LANDINGSHIP_NUM_D do
    _route_d[_FORV_4_] = -1
    _phase_d[_FORV_4_] = 0
  end
  for _FORV_4_ = 1, 5 do
    _view_control_on[_FORV_4_] = false
  end
end
function Ingame()
  local L0_278, L1_279, L2_280, L3_281, L4_282, L5_283, L6_284, L7_285, L8_286, L9_287, L10_288, L11_289, L12_290, L13_291, L14_292, L15_293, L16_294, L17_295, L18_296, L19_297, L20_298, L21_299, L22_300, L23_301, L24_302
  L0_278 = Fn_getGameObject
  L1_279 = "mother2"
  L0_278 = L0_278(L1_279)
  L1_279 = Fn_findAreaHandle
  L2_280 = "po_a_17"
  L1_279 = L1_279(L2_280)
  _transport_ship_hdl = L1_279
  L1_279 = findGameObject2
  L2_280 = "Node"
  L3_281 = "locator2_ship_a_pos"
  L1_279 = L1_279(L2_280, L3_281)
  L2_280 = _transport_ship_hdl
  L3_281 = L2_280
  L2_280 = L2_280.setDriftEnable
  L4_282 = false
  L2_280(L3_281, L4_282)
  L2_280 = _transport_ship_hdl
  L3_281 = L2_280
  L2_280 = L2_280.setExpandedAabb
  L4_282 = true
  L2_280(L3_281, L4_282)
  L2_280 = Area
  L3_281 = L2_280
  L2_280 = L2_280.setAnimEnable
  L4_282 = true
  L2_280(L3_281, L4_282)
  function L2_280(A0_303)
    local L1_304
    L1_304 = A0_303.state
    if L1_304 == "wait" then
      L1_304 = _route_b
      L1_304 = L1_304[1]
      if L1_304 == 0 then
        A0_303.changeState = "move"
        L1_304 = {
          "locator2_landingship01_phase01_route01"
        }
        A0_303.movePoint = L1_304
      end
    end
    L1_304 = A0_303.state
    if L1_304 == "openEnd" then
      L1_304 = _route_b
      L1_304[1] = _route_b[1] + 1
      L1_304 = _phase_b
      L1_304[1] = 1
      A0_303.changeState = "move"
      L1_304 = {
        "locator2_landingship01_phase01_exit01",
        "locator2_landingship01_phase01_exit02"
      }
      A0_303.movePoint = L1_304
    end
    L1_304 = A0_303.state
    if L1_304 == "moveEnd" then
      L1_304 = _route_b
      L1_304 = L1_304[1]
      if L1_304 == 0 then
        A0_303.changeState = "open"
      end
    end
    return A0_303
  end
  function L3_281(A0_305)
    local L1_306
    L1_306 = A0_305.state
    if L1_306 == "wait" then
      L1_306 = _route_b
      L1_306 = L1_306[2]
      if L1_306 == 0 then
        A0_305.changeState = "move"
        L1_306 = {
          "locator2_landingship02_phase01_route01"
        }
        A0_305.movePoint = L1_306
      else
        L1_306 = _route_b
        L1_306 = L1_306[2]
        if L1_306 == 2 then
          A0_305.changeState = "open"
        end
      end
    end
    L1_306 = A0_305.state
    if L1_306 == "openEnd" then
      L1_306 = _route_b
      L1_306[2] = _route_b[2] + 1
      L1_306 = _route_b
      L1_306 = L1_306[2]
      if L1_306 == 1 then
        L1_306 = _phase_b
        L1_306[2] = 1
      else
        L1_306 = _route_b
        L1_306 = L1_306[2]
        if L1_306 == 3 then
          L1_306 = _phase_b
          L1_306[2] = 2
          A0_305.changeState = "move"
          L1_306 = {
            "locator2_landingship02_phase01_exit01"
          }
          A0_305.movePoint = L1_306
        end
      end
    end
    L1_306 = A0_305.state
    if L1_306 == "moveEnd" then
      L1_306 = _route_b
      L1_306 = L1_306[2]
      if L1_306 == 0 then
        A0_305.changeState = "open"
        A0_305.dropEnemy = 4
      end
    end
    return A0_305
  end
  function L4_282(A0_307)
    local L1_308
    L1_308 = A0_307.state
    if L1_308 == "wait" then
      L1_308 = _route_b
      L1_308 = L1_308[4]
      if L1_308 == 0 then
        A0_307.changeState = "move"
        L1_308 = {
          "locator2_landingship04_phase01_route01"
        }
        A0_307.movePoint = L1_308
      else
        L1_308 = _route_b
        L1_308 = L1_308[4]
        if L1_308 == 2 then
          A0_307.changeState = "open"
          A0_307.dropEnemy = 4
        else
          L1_308 = _route_b
          L1_308 = L1_308[4]
          if L1_308 == 4 then
            A0_307.changeState = "open"
          end
        end
      end
    end
    L1_308 = A0_307.state
    if L1_308 == "moveEnd" then
      L1_308 = _route_b
      L1_308 = L1_308[4]
      if L1_308 == 0 then
        L1_308 = _route_b
        L1_308[4] = _route_b[4] + 1
      end
    end
    L1_308 = A0_307.state
    if L1_308 == "openEnd" then
      L1_308 = _route_b
      L1_308[4] = _route_b[4] + 1
      L1_308 = _route_b
      L1_308 = L1_308[4]
      if L1_308 == 3 then
        L1_308 = _phase_b
        L1_308[4] = 1
        A0_307.changeState = "move"
        L1_308 = {
          "locator2_landingship04_phase01_route02",
          "locator2_landingship04_phase01_route03"
        }
        A0_307.movePoint = L1_308
      else
        L1_308 = _route_b
        L1_308 = L1_308[4]
        if L1_308 == 5 then
          L1_308 = _phase_b
          L1_308[4] = 2
          A0_307.changeState = "move"
          L1_308 = {
            "locator2_landingship04_phase01_exit01",
            "locator2_landingship04_phase01_exit02"
          }
          A0_307.movePoint = L1_308
        end
      end
    end
    return A0_307
  end
  function L5_283(A0_309)
    local L1_310
    L1_310 = A0_309.state
    if L1_310 == "wait" then
      L1_310 = _route_b
      L1_310 = L1_310[5]
      if L1_310 == 0 then
        A0_309.changeState = "move"
        L1_310 = {
          "locator2_landingship05_phase01_route01"
        }
        A0_309.movePoint = L1_310
      else
        L1_310 = _route_b
        L1_310 = L1_310[5]
        if L1_310 == 2 then
          A0_309.changeState = "open"
        end
      end
    end
    L1_310 = A0_309.state
    if L1_310 == "moveEnd" then
      L1_310 = _route_b
      L1_310[5] = _route_b[5] + 1
    end
    L1_310 = A0_309.state
    if L1_310 == "openEnd" then
      L1_310 = _route_b
      L1_310[5] = _route_b[5] + 1
      L1_310 = _phase_b
      L1_310[5] = 1
      A0_309.changeState = "move"
      L1_310 = {
        "locator2_landingship05_phase01_exit01"
      }
      A0_309.movePoint = L1_310
    end
    return A0_309
  end
  function L6_284(A0_311)
    local L1_312
    L1_312 = A0_311.state
    if L1_312 == "wait" then
      L1_312 = _route_b
      L1_312 = L1_312[6]
      if L1_312 == 0 then
        A0_311.changeState = "move"
        L1_312 = {
          "locator2_landingship06_phase01_route01"
        }
        A0_311.movePoint = L1_312
      else
        L1_312 = _route_b
        L1_312 = L1_312[6]
        if L1_312 == 2 then
          A0_311.changeState = "open"
          A0_311.dropEnemy = 12
        else
          L1_312 = _route_b
          L1_312 = L1_312[6]
          if L1_312 == 4 then
            A0_311.changeState = "open"
          else
            L1_312 = _route_b
            L1_312 = L1_312[6]
            if L1_312 == 6 then
              A0_311.changeState = "move"
              L1_312 = {
                "locator2_landingship06_phase01_exit02"
              }
              A0_311.movePoint = L1_312
            end
          end
        end
      end
    end
    L1_312 = A0_311.state
    if L1_312 == "moveEnd" then
      L1_312 = _route_b
      L1_312 = L1_312[6]
      if L1_312 == 0 then
        L1_312 = _route_b
        L1_312[6] = _route_b[6] + 1
      end
    end
    L1_312 = A0_311.state
    if L1_312 == "openEnd" then
      L1_312 = _route_b
      L1_312[6] = _route_b[6] + 1
      L1_312 = _route_b
      L1_312 = L1_312[6]
      if L1_312 == 3 then
        L1_312 = _phase_b
        L1_312[6] = 1
        A0_311.changeState = "move"
        L1_312 = {
          "locator2_landingship06_phase01_route02",
          "locator2_landingship06_phase01_route03"
        }
        A0_311.movePoint = L1_312
      else
        L1_312 = _route_b
        L1_312 = L1_312[6]
        if L1_312 == 5 then
          L1_312 = _phase_b
          L1_312[6] = 2
          A0_311.changeState = "move"
          L1_312 = {
            "locator2_landingship06_phase01_exit01"
          }
          A0_311.movePoint = L1_312
        end
      end
    end
    return A0_311
  end
  function L7_285(A0_313)
    local L1_314
    L1_314 = A0_313.state
    if L1_314 == "wait" then
      L1_314 = _route_c
      L1_314 = L1_314[1]
      if L1_314 == 0 then
        A0_313.changeState = "move"
        L1_314 = {
          "locator2_landingship01_phase02_route01"
        }
        A0_313.movePoint = L1_314
      end
    end
    L1_314 = A0_313.state
    if L1_314 == "moveEnd" then
      L1_314 = _route_c
      L1_314 = L1_314[1]
      if L1_314 == 0 then
        A0_313.changeState = "open"
      end
    end
    L1_314 = A0_313.state
    if L1_314 == "openEnd" then
      L1_314 = _route_c
      L1_314[1] = _route_c[1] + 1
      L1_314 = _phase_c
      L1_314[1] = 1
      A0_313.changeState = "move"
      L1_314 = {
        "locator2_landingship01_phase02_exit01",
        "locator2_landingship01_phase02_exit02"
      }
      A0_313.movePoint = L1_314
    end
    return A0_313
  end
  function L8_286(A0_315)
    local L1_316
    L1_316 = A0_315.state
    if L1_316 == "wait" then
      L1_316 = _route_c
      L1_316 = L1_316[2]
      if L1_316 == 0 then
        A0_315.changeState = "move"
        L1_316 = {
          "locator2_landingship02_phase02_route01",
          "locator2_landingship02_phase02_route02"
        }
        A0_315.movePoint = L1_316
      else
        L1_316 = _route_c
        L1_316 = L1_316[2]
        if L1_316 == 2 then
          L1_316 = _phase_c
          L1_316 = L1_316[2]
          if L1_316 == 1 then
            A0_315.changeState = "open"
          end
        end
      end
    end
    L1_316 = A0_315.state
    if L1_316 == "moveEnd" then
      L1_316 = _route_c
      L1_316 = L1_316[2]
      if L1_316 ~= 0 then
        L1_316 = _route_c
        L1_316 = L1_316[2]
        if L1_316 == 2 then
          L1_316 = _phase_c
          L1_316 = L1_316[2]
        end
      elseif L1_316 == 0 then
        A0_315.changeState = "open"
        A0_315.dropEnemy = 5
      end
    end
    L1_316 = A0_315.state
    if L1_316 == "openEnd" then
      L1_316 = _route_c
      L1_316 = L1_316[2]
      if L1_316 == 2 then
        L1_316 = _phase_c
        L1_316 = L1_316[2]
        if L1_316 == 0 then
        end
      else
        L1_316 = _route_c
        L1_316[2] = _route_c[2] + 1
      end
      L1_316 = _phase_c
      L1_316 = L1_316[2]
      if L1_316 == 0 then
        L1_316 = _phase_c
        L1_316[2] = 1
      else
        L1_316 = _route_c
        L1_316 = L1_316[2]
        if L1_316 == 3 then
          L1_316 = _phase_c
          L1_316[2] = 2
          A0_315.changeState = "move"
          L1_316 = {
            "locator2_landingship02_phase02_exit01",
            "locator2_landingship02_phase02_exit02"
          }
          A0_315.movePoint = L1_316
        end
      end
    end
    return A0_315
  end
  function L9_287(A0_317)
    local L1_318
    L1_318 = A0_317.state
    if L1_318 == "wait" then
      L1_318 = _route_c
      L1_318 = L1_318[3]
      if L1_318 == 0 then
        A0_317.changeState = "move"
        L1_318 = {
          "locator2_phase02_sublandingship_up_01"
        }
        A0_317.movePoint = L1_318
      end
    end
    L1_318 = A0_317.state
    if L1_318 == "moveEnd" then
      L1_318 = _route_c
      L1_318[3] = 1
    end
    return A0_317
  end
  function L10_288(A0_319)
    local L1_320
    L1_320 = A0_319.state
    if L1_320 == "wait" then
      L1_320 = _route_c
      L1_320 = L1_320[4]
      if L1_320 == 0 then
        A0_319.changeState = "move"
        L1_320 = {
          "locator2_phase02_sublandingship_up_02"
        }
        A0_319.movePoint = L1_320
      end
    end
    L1_320 = A0_319.state
    if L1_320 == "moveEnd" then
      L1_320 = _route_c
      L1_320[4] = 1
    end
    return A0_319
  end
  function L11_289(A0_321)
    local L1_322
    L1_322 = A0_321.state
    if L1_322 == "wait" then
      L1_322 = _route_c
      L1_322 = L1_322[5]
      if L1_322 == 0 then
        A0_321.changeState = "move"
        L1_322 = {
          "locator2_phase02_sublandingship_up_03"
        }
        A0_321.movePoint = L1_322
      end
    end
    L1_322 = A0_321.state
    if L1_322 == "moveEnd" then
      L1_322 = _route_c
      L1_322[5] = 1
    end
    return A0_321
  end
  function L12_290(A0_323)
    local L1_324
    L1_324 = A0_323.state
    if L1_324 == "wait" then
      L1_324 = _route_c
      L1_324 = L1_324[6]
      if L1_324 == 0 then
        A0_323.changeState = "move"
        L1_324 = {
          "locator2_phase02_sublandingship_up_04"
        }
        A0_323.movePoint = L1_324
      end
    end
    L1_324 = A0_323.state
    if L1_324 == "moveEnd" then
      L1_324 = _route_c
      L1_324[6] = 1
    end
    return A0_323
  end
  function L13_291(A0_325)
    local L1_326
    L1_326 = A0_325.state
    if L1_326 == "wait" then
      L1_326 = _route_d
      L1_326 = L1_326[1]
      if L1_326 == -1 then
        A0_325.changeState = "move"
        L1_326 = {
          "locator2_landingship01_phase03_route00"
        }
        A0_325.movePoint = L1_326
      end
      L1_326 = _route_d
      L1_326 = L1_326[1]
      if L1_326 == 0 then
        A0_325.changeState = "move"
        L1_326 = {
          "locator2_landingship01_phase03_route01",
          "locator2_landingship01_phase03_route02"
        }
        A0_325.movePoint = L1_326
      end
      L1_326 = _route_d
      L1_326 = L1_326[1]
      if L1_326 == 2 then
        A0_325.changeState = "open"
      end
    end
    L1_326 = A0_325.state
    if L1_326 == "moveEnd" then
      L1_326 = _route_d
      L1_326 = L1_326[1]
      if L1_326 == -1 then
        L1_326 = _route_d
        L1_326[1] = -2
      end
      L1_326 = _route_d
      L1_326 = L1_326[1]
      if L1_326 == 0 then
        L1_326 = _view_control_on
        L1_326[1] = true
        A0_325.changeState = "open"
        A0_325.dropEnemy = 6
      else
        L1_326 = _route_d
        L1_326 = L1_326[1]
        if L1_326 == 1 then
          A0_325.changeState = "open"
          A0_325.dropEnemy = 6
        end
      end
    end
    L1_326 = A0_325.state
    if L1_326 == "openEnd" then
      L1_326 = _route_d
      L1_326[1] = _route_d[1] + 1
      L1_326 = _phase_d
      L1_326[1] = _phase_d[1] + 1
      L1_326 = _route_d
      L1_326 = L1_326[1]
      if L1_326 == 1 then
        A0_325.changeState = "move"
        L1_326 = {
          "locator2_landingship01_phase03_route03",
          "locator2_landingship01_phase03_route04"
        }
        A0_325.movePoint = L1_326
      else
        L1_326 = _route_d
        L1_326 = L1_326[1]
        if L1_326 == 3 then
          A0_325.changeState = "move"
          L1_326 = {
            "locator2_landingship01_phase03_exit01",
            "locator2_landingship01_phase03_exit02"
          }
          A0_325.movePoint = L1_326
        end
      end
    end
    return A0_325
  end
  function L14_292(A0_327)
    local L1_328
    L1_328 = A0_327.state
    if L1_328 == "wait" then
      L1_328 = _route_d
      L1_328 = L1_328[2]
      if L1_328 == -1 then
        A0_327.changeState = "move"
        L1_328 = {
          "locator2_landingship02_phase03_route00"
        }
        A0_327.movePoint = L1_328
      end
      L1_328 = _route_d
      L1_328 = L1_328[2]
      if L1_328 == 0 then
        A0_327.changeState = "move"
        L1_328 = {
          "locator2_landingship02_phase03_route01",
          "locator2_landingship02_phase03_route02"
        }
        A0_327.movePoint = L1_328
      end
    end
    L1_328 = A0_327.state
    if L1_328 == "moveEnd" then
      L1_328 = _route_d
      L1_328 = L1_328[2]
      if L1_328 == -1 then
        L1_328 = _route_d
        L1_328[2] = -2
      end
      L1_328 = _route_d
      L1_328 = L1_328[2]
      if L1_328 == 0 then
        A0_327.changeState = "drop"
        L1_328 = {
          "phase03_sol_02_02"
        }
        A0_327.dropEnemy = L1_328
      end
    end
    L1_328 = A0_327.state
    if L1_328 == "dropEnd" then
      L1_328 = _route_d
      L1_328[2] = _route_d[2] + 1
      L1_328 = _phase_d
      L1_328[2] = 1
      A0_327.changeState = "move"
      L1_328 = {
        "locator2_landingship02_phase03_exit01",
        "locator2_landingship02_phase03_exit02"
      }
      A0_327.movePoint = L1_328
    end
    return A0_327
  end
  function L15_293(A0_329)
    local L1_330
    L1_330 = A0_329.state
    if L1_330 == "wait" then
      L1_330 = _route_d
      L1_330 = L1_330[3]
      if L1_330 == -1 then
        A0_329.changeState = "move"
        L1_330 = {
          "locator2_landingship03_phase03_route00"
        }
        A0_329.movePoint = L1_330
      end
      L1_330 = _route_d
      L1_330 = L1_330[3]
      if L1_330 == 0 then
        A0_329.changeState = "move"
        L1_330 = {
          "locator2_landingship03_phase03_route01",
          "locator2_landingship03_phase03_route02"
        }
        A0_329.movePoint = L1_330
      end
    end
    L1_330 = A0_329.state
    if L1_330 == "moveEnd" then
      L1_330 = _route_d
      L1_330 = L1_330[3]
      if L1_330 == -1 then
        L1_330 = _route_d
        L1_330[3] = -2
      end
      L1_330 = _route_d
      L1_330 = L1_330[3]
      if L1_330 == 0 then
        L1_330 = _view_control_on
        L1_330[2] = true
        A0_329.changeState = "open"
        A0_329.dropEnemy = 5
      else
        L1_330 = _route_d
        L1_330 = L1_330[3]
        if L1_330 == 1 then
          A0_329.changeState = "open"
        end
      end
    end
    L1_330 = A0_329.state
    if L1_330 == "openEnd" then
      L1_330 = _route_d
      L1_330[3] = _route_d[3] + 1
      L1_330 = _phase_d
      L1_330[3] = _phase_d[3] + 1
      L1_330 = _route_d
      L1_330 = L1_330[3]
      if L1_330 == 1 then
        A0_329.changeState = "move"
        L1_330 = {
          "locator2_landingship03_phase03_route03",
          "locator2_landingship03_phase03_route04"
        }
        A0_329.movePoint = L1_330
      else
        A0_329.changeState = "move"
        L1_330 = {
          "locator2_landingship03_phase03_exit01",
          "locator2_landingship03_phase03_exit02"
        }
        A0_329.movePoint = L1_330
      end
    end
    return A0_329
  end
  function L16_294(A0_331)
    local L1_332
    L1_332 = A0_331.state
    if L1_332 == "wait" then
      L1_332 = _route_d
      L1_332 = L1_332[4]
      if L1_332 == -1 then
        A0_331.changeState = "move"
        L1_332 = {
          "locator2_landingship04_phase03_route00"
        }
        A0_331.movePoint = L1_332
      end
      L1_332 = _route_d
      L1_332 = L1_332[4]
      if L1_332 == 0 then
        A0_331.changeState = "move"
        L1_332 = {
          "locator2_landingship04_phase03_route01",
          "locator2_landingship04_phase03_route02"
        }
        A0_331.movePoint = L1_332
      end
    end
    L1_332 = A0_331.state
    if L1_332 == "moveEnd" then
      L1_332 = _route_d
      L1_332 = L1_332[4]
      if L1_332 == -1 then
        L1_332 = _route_d
        L1_332[4] = -2
      end
      L1_332 = _route_d
      L1_332 = L1_332[4]
      if L1_332 == 0 then
        A0_331.changeState = "drop"
        L1_332 = {
          "phase03_sol_04_04",
          "phase03_sol_04_02"
        }
        A0_331.dropEnemy = L1_332
      end
    end
    L1_332 = A0_331.state
    if L1_332 == "dropEnd" then
      L1_332 = _route_d
      L1_332[4] = _route_d[4] + 1
      L1_332 = _phase_d
      L1_332[4] = 1
      A0_331.changeState = "move"
      L1_332 = {
        "locator2_landingship04_phase03_exit01",
        "locator2_landingship04_phase03_exit02"
      }
      A0_331.movePoint = L1_332
    end
    return A0_331
  end
  function L17_295(A0_333)
    local L1_334
    L1_334 = A0_333.state
    if L1_334 == "wait" then
      L1_334 = _route_d
      L1_334 = L1_334[5]
      if L1_334 == -1 then
        A0_333.changeState = "move"
        L1_334 = {
          "locator2_landingship05_phase03_route00"
        }
        A0_333.movePoint = L1_334
      end
      L1_334 = _route_d
      L1_334 = L1_334[5]
      if L1_334 == 0 then
        A0_333.changeState = "move"
        L1_334 = {
          "locator2_landingship05_phase03_route01",
          "locator2_landingship05_phase03_route02"
        }
        A0_333.movePoint = L1_334
      end
      L1_334 = _route_d
      L1_334 = L1_334[5]
      if L1_334 == 2 then
        A0_333.changeState = "open"
      end
    end
    L1_334 = A0_333.state
    if L1_334 == "moveEnd" then
      L1_334 = _route_d
      L1_334 = L1_334[5]
      if L1_334 == -1 then
        L1_334 = _route_d
        L1_334[5] = -2
      end
      L1_334 = _route_d
      L1_334 = L1_334[5]
      if L1_334 == 0 then
        L1_334 = _view_control_on
        L1_334[3] = true
        A0_333.changeState = "open"
        A0_333.dropEnemy = 5
      else
        L1_334 = _route_d
        L1_334 = L1_334[5]
        if L1_334 == 1 then
          A0_333.changeState = "open"
          A0_333.dropEnemy = 5
        end
      end
    end
    L1_334 = A0_333.state
    if L1_334 == "openEnd" then
      L1_334 = _route_d
      L1_334[5] = _route_d[5] + 1
      L1_334 = _phase_d
      L1_334[5] = _phase_d[5] + 1
      L1_334 = _route_d
      L1_334 = L1_334[5]
      if L1_334 == 1 then
        A0_333.changeState = "move"
        L1_334 = {
          "locator2_landingship05_phase03_route03",
          "locator2_landingship05_phase03_route04"
        }
        A0_333.movePoint = L1_334
      else
        L1_334 = _route_d
        L1_334 = L1_334[5]
        if L1_334 == 3 then
          A0_333.changeState = "move"
          L1_334 = {
            "locator2_landingship05_phase03_exit01",
            "locator2_landingship05_phase03_exit02"
          }
          A0_333.movePoint = L1_334
        end
      end
    end
    return A0_333
  end
  function L18_296(A0_335)
    local L1_336
    L1_336 = A0_335.state
    if L1_336 == "wait" then
      L1_336 = _route_d
      L1_336 = L1_336[6]
      if L1_336 == -1 then
        A0_335.changeState = "move"
        L1_336 = {
          "locator2_landingship06_phase03_route00"
        }
        A0_335.movePoint = L1_336
      end
      L1_336 = _route_d
      L1_336 = L1_336[6]
      if L1_336 == 0 then
        A0_335.changeState = "move"
        L1_336 = {
          "locator2_landingship06_phase03_route01",
          "locator2_landingship06_phase03_route02"
        }
        A0_335.movePoint = L1_336
      end
    end
    L1_336 = A0_335.state
    if L1_336 == "moveEnd" then
      L1_336 = _route_d
      L1_336 = L1_336[6]
      if L1_336 == -1 then
        L1_336 = _route_d
        L1_336[6] = -2
      else
        L1_336 = _route_d
        L1_336 = L1_336[6]
        if L1_336 == 0 then
          L1_336 = _view_control_on
          L1_336[4] = true
          A0_335.changeState = "open"
          A0_335.dropEnemy = 6
        else
          L1_336 = _route_d
          L1_336 = L1_336[6]
          if L1_336 == 1 then
            A0_335.changeState = "open"
          end
        end
      end
    end
    L1_336 = A0_335.state
    if L1_336 == "openEnd" then
      L1_336 = _route_d
      L1_336[6] = _route_d[6] + 1
      L1_336 = _phase_d
      L1_336[6] = _phase_d[6] + 1
      L1_336 = _route_d
      L1_336 = L1_336[6]
      if L1_336 == 1 then
        A0_335.changeState = "move"
        L1_336 = {
          "locator2_landingship06_phase03_route03"
        }
        A0_335.movePoint = L1_336
      else
        A0_335.changeState = "move"
        L1_336 = {
          "locator2_landingship06_phase03_exit01",
          "locator2_landingship06_phase03_exit02"
        }
        A0_335.movePoint = L1_336
      end
    end
    return A0_335
  end
  function L19_297(A0_337)
    local L1_338
    L1_338 = A0_337.state
    if L1_338 == "wait" then
      L1_338 = _route_d
      L1_338 = L1_338[7]
      if L1_338 == -1 then
        A0_337.changeState = "move"
        L1_338 = {
          "locator2_landingship07_phase03_route00"
        }
        A0_337.movePoint = L1_338
      end
      L1_338 = _route_d
      L1_338 = L1_338[7]
      if L1_338 == 0 then
        A0_337.changeState = "move"
        L1_338 = {
          "locator2_landingship07_phase03_route01",
          "locator2_landingship07_phase03_route02"
        }
        A0_337.movePoint = L1_338
      end
    end
    L1_338 = A0_337.state
    if L1_338 == "moveEnd" then
      L1_338 = _route_d
      L1_338 = L1_338[7]
      if L1_338 == -1 then
        L1_338 = _route_d
        L1_338[7] = -2
      end
      L1_338 = _route_d
      L1_338 = L1_338[7]
      if L1_338 == 0 then
        L1_338 = _view_control_on
        L1_338[5] = true
        A0_337.changeState = "open"
        A0_337.dropEnemy = 6
      else
        L1_338 = _route_d
        L1_338 = L1_338[7]
        if L1_338 == 1 then
          A0_337.changeState = "open"
        end
      end
    end
    L1_338 = A0_337.state
    if L1_338 == "openEnd" then
      L1_338 = _route_d
      L1_338[7] = _route_d[7] + 1
      L1_338 = _phase_d
      L1_338[7] = _phase_d[7] + 1
      L1_338 = _route_d
      L1_338 = L1_338[7]
      if L1_338 == 1 then
        A0_337.changeState = "move"
        L1_338 = {
          "locator2_landingship07_phase03_route03",
          "locator2_landingship07_phase03_route04"
        }
        A0_337.movePoint = L1_338
      else
        A0_337.changeState = "move"
        L1_338 = {
          "locator2_landingship07_phase03_exit01",
          "locator2_landingship07_phase03_exit02"
        }
        A0_337.movePoint = L1_338
      end
    end
    return A0_337
  end
  while true do
    if L20_298 then
      L20_298(L21_299, L22_300)
      L20_298(L21_299)
      while true do
        if L20_298 then
          L20_298()
        end
      end
      L20_298(L21_299)
      _load_anim_num = 1
      _load_area_flg_01 = false
    end
    if L20_298 then
      L20_298(L21_299, L22_300)
      L20_298(L21_299)
      while true do
        if L20_298 then
          L20_298()
        end
      end
      L20_298(L21_299)
      _load_anim_num = 2
      _load_area_flg_02 = false
    end
    if L20_298 then
      L20_298()
      L20_298(L21_299)
      L20_298(L21_299)
      L20_298()
      L20_298(L21_299, L22_300)
      L20_298(L21_299, L22_300)
      L20_298(L21_299)
      _area_warp_switch = true
      _area_move_switch = false
      _area_warp_flg_01 = false
    end
    if L20_298 then
      L20_298(L21_299)
      L1_279 = L20_298
      L23_301 = L1_279
      L24_302 = L22_300(L23_301)
      L20_298(L21_299, L22_300, L23_301, L24_302, L22_300(L23_301))
      L20_298(L21_299)
      L20_298(L21_299, L22_300)
      _load_anim_num = 3
      _area_warp_flg_02 = false
    end
    if L20_298 then
      if L20_298 ~= "sm08_c" then
      else
        if L20_298 == "sm08_d" then
          L20_298(L21_299, L22_300)
      end
      else
        L20_298(L21_299, L22_300)
      end
      L20_298(L21_299)
      _area_warp_switch = false
      _area_move_switch = true
      _area_move_flg = false
    end
    if L20_298 then
      if L20_298 == "string" then
        if L20_298 ~= nil then
          L21_299(L22_300)
          L23_301 = false
          L21_299(L22_300, L23_301)
          L23_301 = "\231\148\159\230\136\144\233\150\139\229\167\139"
          L21_299(L22_300)
          while true do
            if not L21_299 then
              L21_299()
            end
          end
          L21_299(L22_300)
        end
      elseif L20_298 == "table" then
        for L23_301, L24_302 in L20_298(L21_299) do
          if findGameObject2("EnemyGenerator", L24_302) ~= nil then
            findGameObject2("EnemyGenerator", L24_302):requestSpawn()
            findGameObject2("EnemyGenerator", L24_302):setEnemyMarker(false)
            print(L24_302 .. "\231\148\159\230\136\144\233\150\139\229\167\139")
            while not findGameObject2("EnemyGenerator", L24_302):isPrepared() do
              wait()
            end
            print("\230\143\154\233\153\184\232\137\135\227\129\174\230\186\150\229\130\153\231\181\130\228\186\134")
          end
        end
      end
      _is_enemy_spawn_request = false
    end
    if L20_298 then
      _fi_hdl = L20_298
      if L20_298 ~= nil then
        L20_298(L21_299)
        L20_298(L21_299, L22_300)
        while true do
          if not L20_298 then
            L20_298()
          end
        end
      end
      _is_fi_spawn_request = false
    end
    if L20_298 then
      L23_301 = "phase01_landingship02"
      L23_301 = L20_298
      L24_302 = L21_299
      L23_301 = L21_299.getBrain
      L23_301 = L23_301(L24_302)
      L24_302 = L22_300.setEventListener
      L24_302(L22_300, "enemy_landingship_event", L2_280)
      L24_302 = L23_301.setEventListener
      L24_302(L23_301, "enemy_landingship_event", L3_281)
      L24_302 = L22_300.setVisibleEnemyMarker
      L24_302(L22_300, false)
      L24_302 = L23_301.setVisibleEnemyMarker
      L24_302(L23_301, false)
      while true do
        L24_302 = L23_301.isReadyEnemy
        L24_302 = L24_302(L23_301)
        if not L24_302 then
          L24_302 = wait
          L24_302()
        end
      end
      L24_302 = L23_301.cmd
      L24_302(L23_301, "setPuppet", {
        _npc_puppet_tbl[1],
        _npc_puppet_tbl[2],
        _npc_puppet_tbl[3]
      })
      _landingship_move_b_01 = false
    end
    if L20_298 then
      L23_301 = L21_299
      L24_302 = "enemy_landingship_event"
      L22_300(L23_301, L24_302, L4_282)
      L23_301 = L21_299
      L24_302 = false
      L22_300(L23_301, L24_302)
      _landingship_move_b_02 = false
    end
    if L20_298 then
      L23_301 = "phase01_landingship06"
      L23_301 = L20_298
      L24_302 = L21_299
      L23_301 = L21_299.getBrain
      L23_301 = L23_301(L24_302)
      L24_302 = L22_300.setEventListener
      L24_302(L22_300, "enemy_landingship_event", L5_283)
      L24_302 = L23_301.setEventListener
      L24_302(L23_301, "enemy_landingship_event", L6_284)
      L24_302 = L22_300.setVisibleEnemyMarker
      L24_302(L22_300, false)
      L24_302 = L23_301.setVisibleEnemyMarker
      L24_302(L23_301, false)
      _landingship_move_b_03 = false
    end
    if L20_298 then
      L23_301 = L21_299
      L24_302 = "enemy_landingship_event"
      L22_300(L23_301, L24_302, L7_285)
      L23_301 = L21_299
      L24_302 = false
      L22_300(L23_301, L24_302)
      _landingship_move_c_01 = false
    end
    if L20_298 then
      L23_301 = L21_299
      L24_302 = "enemy_landingship_event"
      L22_300(L23_301, L24_302, L8_286)
      L23_301 = L21_299
      L24_302 = false
      L22_300(L23_301, L24_302)
      _landingship_move_c_02 = false
    end
    if L20_298 then
      L23_301 = "phase02_sublandingship_01"
      L23_301 = L21_299
      L24_302 = L22_300
      L23_301 = L22_300.setEventListener
      L23_301(L24_302, "enemy_landingship_event", L9_287)
      L24_302 = L22_300
      L23_301 = L22_300.setVisibleEnemyMarker
      L23_301(L24_302, false)
      _landingship_move_c_03_01 = false
    end
    if L20_298 then
      L23_301 = "phase02_sublandingship_02"
      L23_301 = L21_299
      L24_302 = L22_300
      L23_301 = L22_300.setEventListener
      L23_301(L24_302, "enemy_landingship_event", L10_288)
      L24_302 = L22_300
      L23_301 = L22_300.setVisibleEnemyMarker
      L23_301(L24_302, false)
      _landingship_move_c_03_02 = false
    end
    if L20_298 then
      L23_301 = "phase02_sublandingship_03"
      L23_301 = L21_299
      L24_302 = L22_300
      L23_301 = L22_300.setEventListener
      L23_301(L24_302, "enemy_landingship_event", L11_289)
      L24_302 = L22_300
      L23_301 = L22_300.setVisibleEnemyMarker
      L23_301(L24_302, false)
      _landingship_move_c_03_03 = false
    end
    if L20_298 then
      L23_301 = "phase02_sublandingship_04"
      L23_301 = L21_299
      L24_302 = L22_300
      L23_301 = L22_300.setEventListener
      L23_301(L24_302, "enemy_landingship_event", L12_290)
      L24_302 = L22_300
      L23_301 = L22_300.setVisibleEnemyMarker
      L23_301(L24_302, false)
      _landingship_move_c_03_04 = false
    end
    if L20_298 then
      repeat
        L22_300()
        L23_301 = L21_299
      until L22_300
      L23_301 = L21_299
      L24_302 = "setPuppet"
      L22_300(L23_301, L24_302, {
        _npc_puppet_tbl[1],
        _npc_puppet_tbl[2],
        _npc_puppet_tbl[3]
      })
      _landingship_move_c_pre = false
    end
    if L20_298 then
      L23_301 = "phase03_landingship02"
      L23_301 = L20_298
      L24_302 = L21_299
      L23_301 = L21_299.getBrain
      L23_301 = L23_301(L24_302)
      L24_302 = L22_300.setEventListener
      L24_302(L22_300, "enemy_landingship_event", L13_291)
      L24_302 = L23_301.setEventListener
      L24_302(L23_301, "enemy_landingship_event", L14_292)
      L24_302 = L22_300.setVisibleEnemyMarker
      L24_302(L22_300, false)
      L24_302 = L23_301.setVisibleEnemyMarker
      L24_302(L23_301, false)
      _landingship_move_d_01 = false
    end
    if L20_298 then
      L23_301 = L21_299
      L24_302 = "enemy_landingship_event"
      L22_300(L23_301, L24_302, L15_293)
      L23_301 = L21_299
      L24_302 = false
      L22_300(L23_301, L24_302)
      _landingship_move_d_02 = false
    end
    if L20_298 then
      L23_301 = "phase03_landingship05"
      L23_301 = L20_298
      L24_302 = L21_299
      L23_301 = L21_299.getBrain
      L23_301 = L23_301(L24_302)
      L24_302 = L22_300.setEventListener
      L24_302(L22_300, "enemy_landingship_event", L16_294)
      L24_302 = L23_301.setEventListener
      L24_302(L23_301, "enemy_landingship_event", L17_295)
      L24_302 = L22_300.setVisibleEnemyMarker
      L24_302(L22_300, false)
      L24_302 = L23_301.setVisibleEnemyMarker
      L24_302(L23_301, false)
      while true do
        L24_302 = L23_301.isReadyEnemy
        L24_302 = L24_302(L23_301)
        if not L24_302 then
          L24_302 = wait
          L24_302()
        end
      end
      L24_302 = L23_301.cmd
      L24_302(L23_301, "setPuppet", {
        _npc_puppet_tbl[1],
        _npc_puppet_tbl[2],
        _npc_puppet_tbl[3]
      })
      _landingship_move_d_03 = false
    end
    if L20_298 then
      L23_301 = L21_299
      L24_302 = "enemy_landingship_event"
      L22_300(L23_301, L24_302, L18_296)
      L23_301 = L21_299
      L24_302 = false
      L22_300(L23_301, L24_302)
      _landingship_move_d_04 = false
    end
    if L20_298 then
      L23_301 = L21_299
      L24_302 = "enemy_landingship_event"
      L22_300(L23_301, L24_302, L19_297)
      L23_301 = L21_299
      L24_302 = false
      L22_300(L23_301, L24_302)
      _landingship_move_d_05 = false
    end
    L20_298()
  end
end
function Finalize()
  requestStopArea()
end
function requestAreaLoad01()
  local L0_339, L1_340
  _load_area_flg_01 = true
end
function requestAreaLoad02()
  local L0_341, L1_342
  _load_area_flg_02 = true
end
function requestWarpArea()
  local L0_343, L1_344
  _area_warp_flg_01 = true
end
function requestWarpAreaEnd()
  local L0_345, L1_346
  _area_warp_flg_02 = true
end
function requestMoveArea()
  local L0_347, L1_348
  _area_move_flg = true
end
function requestStopArea()
  _transport_ship_hdl:stopMoveAnim()
end
function requestAreaSpeedChange(A0_349)
  _transport_ship_hdl:setMoveAnimRatio(A0_349)
end
function requestNpcOnLandingShip(A0_350, A1_351, A2_352)
  local L3_353
  L3_353 = _npc_puppet_tbl
  L3_353[1] = A0_350
  L3_353 = _npc_puppet_tbl
  L3_353[2] = A1_351
  L3_353 = _npc_puppet_tbl
  L3_353[3] = A2_352
end
function requestSpawnEnemy(A0_354)
  local L1_355
  _enmgen_name = A0_354
  _is_enemy_spawn_request = true
end
function requestSpawnFi(A0_356)
  local L1_357
  _fi_enmgen_name = A0_356
  _is_fi_spawn_request = true
end
function requestEnemySpawnBAdd(A0_358, A1_359)
  local L2_360
  if A1_359 ~= nil then
    L2_360 = _route_b
    L2_360[A0_358] = A1_359
  else
    L2_360 = _route_b
    L2_360[A0_358] = 1
  end
end
function requestEnemySpawnDAdd(A0_361)
  local L1_362
  if A0_361 == 1 then
    L1_362 = _route_d
    L1_362[A0_361] = 1
  else
    L1_362 = _route_d
    L1_362[A0_361] = 2
  end
end
function requestEnemyExitB()
  local L1_363
  L1_363 = _route_b
  L1_363[6] = 6
end
function requestChangeEnemyMarker(A0_364)
  local L1_365, L2_366, L3_367, L4_368, L5_369
  for L4_368, L5_369 in L1_365(L2_366) do
    if findGameObject2("EnemyGenerator", L5_369) ~= nil then
      findGameObject2("EnemyGenerator", L5_369):setEnemyMarker(A0_364)
    end
  end
end
function requestAnyChangeEnemyMarker(A0_370, A1_371)
  if findGameObject2("EnemyGenerator", A1_371) ~= nil then
    print(A1_371)
    print(A0_370)
    findGameObject2("EnemyGenerator", A1_371):setEnemyMarker(A0_370)
  end
end
function requestEnemyIdling(A0_372)
  local L1_373, L2_374, L3_375, L4_376, L5_377
  for L4_376, L5_377 in L1_373(L2_374) do
    if findGameObject2("EnemyGenerator", L5_377) ~= nil then
      findGameObject2("EnemyGenerator", L5_377):requestIdlingEnemy(A0_372)
    end
  end
end
function requestEnemyAllKill()
  local L0_378, L1_379, L2_380, L3_381, L4_382
  for L3_381, L4_382 in L0_378(L1_379) do
    if findGameObject2("EnemyGenerator", L4_382) ~= nil then
      findGameObject2("EnemyGenerator", L4_382):requestAllEnemyKill()
    end
  end
end
function requestEnemyPresidentKill()
  if findGameObject2("EnemyGenerator", "enmgen2_president_ship_01") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_president_ship_01"):requestAllEnemyKill()
  end
end
function requestFiKill()
  if _fi_hdl ~= nil then
    _fi_hdl:requestAllEnemyKill()
  end
end
function requestFiAIChange(A0_383, A1_384)
  if A0_383 == 1 then
  else
  end
  if _fi_hdl ~= nil then
    _fi_hdl:requestIdlingEnemy(A1_384)
  end
end
function requestEnemyCountReset()
  local L0_385, L1_386
  _enemy_count = 0
end
function requestEnemyCountResetCALL()
  local L0_387, L1_388
  _land_enemy_count = 0
end
function requestLandingShipSettingResetB()
  local L0_389, L1_390, L2_391, L3_392, L4_393
  for L3_392 = 1, MAX_MOVE_LANDINGSHIP_NUM_B do
    L4_393 = _route_b
    L4_393[L3_392] = 0
    L4_393 = _phase_b
    L4_393[L3_392] = 0
  end
end
function requestLandingShipSettingResetC()
  local L0_394, L1_395, L2_396, L3_397, L4_398
  for L3_397 = 1, MAX_MOVE_LANDINGSHIP_NUM_C do
    L4_398 = _route_c
    L4_398[L3_397] = 0
    L4_398 = _phase_c
    L4_398[L3_397] = 0
  end
end
function requestLandingShipSettingResetD()
  local L0_399, L1_400, L2_401, L3_402, L4_403
  for L3_402 = 1, MAX_MOVE_LANDINGSHIP_NUM_D do
    L4_403 = _route_d
    L4_403[L3_402] = -1
    L4_403 = _phase_d
    L4_403[L3_402] = 0
  end
  for L3_402 = 1, 5 do
    L4_403 = _view_control_on
    L4_403[L3_402] = false
  end
end
function requestEnemyNotAshCountChangeB(A0_404, A1_405)
  if A1_405 ~= nil then
    _enm_not_ash_num_01 = A0_404
  else
    _enm_not_ash_num_01 = _enm_not_ash_num_01 + A0_404
  end
end
function requestEnemyNotAshCountChangeC(A0_406, A1_407)
  if A1_407 ~= nil then
    _enm_not_ash_num_02 = A0_406
  else
    _enm_not_ash_num_02 = _enm_not_ash_num_02 + A0_406
  end
end
function requestEnemyNotAshCountChangeD(A0_408, A1_409)
  if A1_409 ~= nil then
    _enm_not_ash_num_03 = A0_408
  else
    _enm_not_ash_num_03 = _enm_not_ash_num_03 + A0_408
  end
end
function requestLandingShipSettingB01()
  local L0_410, L1_411
  _landingship_move_b_01 = true
end
function requestLandingShipSettingB02()
  local L0_412, L1_413
  _landingship_move_b_02 = true
end
function requestLandingShipSettingB03()
  local L0_414, L1_415
  _landingship_move_b_03 = true
end
function requestLandingShipSettingC01()
  local L0_416, L1_417
  _landingship_move_c_01 = true
end
function requestLandingShipSettingC02()
  local L0_418, L1_419
  _landingship_move_c_02 = true
end
function requestLandingShipSettingC03()
  local L1_420
  L1_420 = _route_c
  L1_420[2] = 2
end
function requestLandingShipSettingC04_01()
  local L0_421, L1_422
  _landingship_move_c_03_01 = true
end
function requestLandingShipSettingC04_02()
  local L0_423, L1_424
  _landingship_move_c_03_02 = true
end
function requestLandingShipSettingC04_03()
  local L0_425, L1_426
  _landingship_move_c_03_03 = true
end
function requestLandingShipSettingC04_04()
  local L0_427, L1_428
  _landingship_move_c_03_04 = true
end
function requestLandingShipSettingCPre()
  local L0_429, L1_430
  _landingship_move_c_pre = true
end
function requestLandingShipSettingD01()
  local L0_431, L1_432
  _landingship_move_d_01 = true
end
function requestLandingShipSettingD02()
  local L0_433, L1_434
  _landingship_move_d_02 = true
end
function requestLandingShipSettingD03()
  local L0_435, L1_436
  _landingship_move_d_03 = true
end
function requestLandingShipSettingD04()
  local L0_437, L1_438
  _landingship_move_d_04 = true
end
function requestLandingShipSettingD05()
  local L0_439, L1_440
  _landingship_move_d_05 = true
end
function requestLandingShipMove(A0_441)
  _route_d[A0_441] = 0
end
function requestBoxSpawn()
  invokeTask(function()
    local L0_442, L1_443, L2_444, L3_445, L4_446, L5_447, L6_448, L7_449, L8_450, L9_451
    for L3_445 = 1, 8 do
      L4_446[L3_445] = L5_447
      L4_446[L3_445] = L5_447
      for L7_449 = 1, 6 do
        L8_450 = "locator2_vogbox_"
        L9_451 = string
        L9_451 = L9_451.format
        L9_451 = L9_451("%02d", L3_445)
        L8_450 = L8_450 .. L9_451 .. "_" .. string.format("%02d", L7_449)
        L9_451 = "bag_c_"
        L9_451 = L9_451 .. string.format("%02d", L3_445) .. "_" .. string.format("%02d", L7_449)
        if L7_449 < 5 then
          _box_hdl[L3_445][L7_449] = Fn_createGimmickBg(L8_450, L9_451, "woodboxvogo_kk_01", true, "box_ms_02_event_04")
        else
          _box_hdl[L3_445][L7_449] = Fn_createGimmickBg(L8_450, L9_451, "woodboxvogo_kk_03", true, "box_ms_02_event_04")
        end
        _box_break[L3_445][L7_449] = false
        _box_hdl[L3_445][L7_449]:setCollidableBlockEnable(false)
        _box_hdl[L3_445][L7_449]:switchGravityGrabAsWeapon(false)
      end
    end
  end)
end
function requestResetBox()
  local L0_452, L1_453, L2_454, L3_455, L4_456, L5_457, L6_458, L7_459
  for L3_455 = 1, 8 do
    for L7_459 = 1, 6 do
      _box_hdl[L3_455][L7_459]:requestRestoreForce()
      _box_break[L3_455][L7_459] = false
    end
  end
  _break_box_count = 0
end
function requestKillBox()
  local L0_460, L1_461, L2_462, L3_463, L4_464, L5_465, L6_466, L7_467
  for L3_463 = 1, 8 do
    for L7_467 = 1, 6 do
      _box_hdl[L3_463][L7_467]:kill()
      _box_hdl[L3_463][L7_467] = nil
    end
  end
end
function isShipAnimLoadingNum()
  local L0_468, L1_469
  L0_468 = _load_anim_num
  return L0_468
end
function isShipWarp01()
  local L0_470, L1_471
  L0_470 = _area_warp_switch
  return L0_470
end
function isAreaMove()
  local L0_472, L1_473
  L0_472 = _area_move_switch
  return L0_472
end
function isEnemyCount()
  local L0_474, L1_475
  L0_474 = _enemy_count
  return L0_474
end
function isLandEnemyCount()
  local L0_476, L1_477
  L0_476 = _land_enemy_count
  return L0_476
end
function isEnemyExist()
  local L0_478, L1_479
  L0_478 = mission_part
  if L0_478 == "sm08_b" then
    L0_478 = _enm_not_ash_num_01
    return L0_478
  end
  L0_478 = mission_part
  if L0_478 == "sm08_c" then
    L0_478 = _enm_not_ash_num_02
    return L0_478
  end
  L0_478 = mission_part
  if L0_478 == "sm08_d" then
    L0_478 = _enm_not_ash_num_03
    return L0_478
  end
end
function isSpawnEnemyEnd()
  local L0_480, L1_481
  L0_480 = _is_enemy_spawn_request
  return L0_480
end
function isSpawnFiEnd()
  local L0_482, L1_483
  L0_482 = _is_fi_spawn_request
  return L0_482
end
function isLandingShipSettingB(A0_484)
  local L1_485, L2_486
  if A0_484 == 1 or A0_484 == 5 then
    L1_485 = _phase_b
    L1_485 = L1_485[A0_484]
    if L1_485 == 1 then
      L1_485 = _phase_b
      L2_486 = A0_484 + 1
      L1_485 = L1_485[L2_486]
      if L1_485 == 1 then
        L1_485 = true
        return L1_485
      end
    else
      L1_485 = false
      return L1_485
    end
  elseif A0_484 == 3 then
    L1_485 = _phase_b
    L2_486 = A0_484 + 1
    L1_485 = L1_485[L2_486]
    if L1_485 == 1 then
      L1_485 = true
      return L1_485
    else
      L1_485 = false
      return L1_485
    end
  else
    L1_485 = _phase_b
    L1_485 = L1_485[A0_484]
    if L1_485 == 2 then
      L1_485 = true
      return L1_485
    else
      L1_485 = false
      return L1_485
    end
  end
end
function isLandingShipSettingC(A0_487, A1_488)
  local L2_489
  if A1_488 ~= nil then
    L2_489 = _phase_c
    L2_489 = L2_489[A0_487]
    if L2_489 == A1_488 then
      L2_489 = true
      return L2_489
    else
      L2_489 = false
      return L2_489
    end
  else
    L2_489 = _phase_c
    L2_489 = L2_489[A0_487]
    if L2_489 >= 1 then
      L2_489 = true
      return L2_489
    else
      L2_489 = false
      return L2_489
    end
  end
end
function isLandingShipSettingD(A0_490)
  return _phase_d[A0_490]
end
function isLandingShipOpenB(A0_491)
  return _route_b[A0_491]
end
function isViewControlFlg(A0_492)
  return _view_control_on[A0_492]
end
function isBoxBreakCount()
  local L0_493, L1_494, L2_495, L3_496, L4_497, L5_498, L6_499, L7_500
  for L3_496 = 1, 8 do
    for L7_500 = 1, 6 do
      if _box_hdl[L3_496][L7_500]:isBroken() and not _box_break[L3_496][L7_500] then
        _break_box_count = _break_box_count + 1
        print("\231\174\177\227\129\174\229\163\138\227\130\140\227\129\159\230\149\176" .. _break_box_count)
        _box_break[L3_496][L7_500] = true
        _box_break_all_part = true
        return true
      end
    end
  end
  return L0_493
end
function isBoxBreakAllPart()
  local L0_501, L1_502
  L0_501 = _box_break_all_part
  return L0_501
end
