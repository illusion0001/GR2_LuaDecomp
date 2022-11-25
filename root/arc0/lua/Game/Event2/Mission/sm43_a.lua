import("GlobalGem")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_puppets = {}
pond_height_node = nil
tension_gauge = 0
tension_gauge_max = 100
tension_max_flag = false
PENALTY_POINTS = 0.2
TENSION_KICK_COMBO_NORMAL = 3
TENSION_JUMP_KICK = 7
TENSION_COUNTER_ATTACK = 10
TENSION_SHORTJUMP_ATTACK = 10
TENSION_MAX_KICK_COMBO_NORMAL = 1.5
TENSION_MAX_JUMP_KICK = 1.5
TENSION_MAX_COUNTER_ATTACK = 2.5
TENSION_MAX_SHORTJUMP_ATTACK = 2.5
TENSION_DAMAGE = 15
TENSION_MAX_DAMAGE = 5
TENSION_DOWN_INTERVAL = 2
TENSION_MAX_DOWN_INTERVAL = 0.5
TENSION_IDLE_TIME = 3
TENSION_DOWN_INTERVAL_TIME = 0.5
TENSION_MAX_INTERVAL_TIME = 0.1
tension_system_task = nil
tension_gauge_task = nil
tension_action_task = nil
tension_damage_task = nil
tension_idle_task = nil
tension_max_task = nil
caption_tension_max = {
  "sm43_00100",
  "sm43_00101",
  "sm43_00102"
}
se_tension_max = {
  "pc1_052",
  "pc1_061",
  "pc1_083"
}
hundred_battle_down_max = 100
hundred_battle_same_num = {
  30,
  30,
  40,
  40,
  40,
  40,
  40,
  50,
  50,
  50,
  50
}
multiple_simultaneous_min = {
  20,
  20,
  30,
  30,
  30,
  30,
  30,
  40,
  40,
  40,
  40
}
enemy_pupil_table_start_num = {
  0,
  10,
  20,
  30,
  35,
  40,
  45,
  50,
  50,
  50
}
hundred_battle_get_ready_max = 20
multiple_simultaneous_phase_max = 8
vol_stage_outside = false
vol_stage_outside_pond = false
hundred_battle_end = false
hundred_battle_spawn_num = 0
hundred_battle_down_num = 0
hundred_battle_down_table = {}
hundred_battle_pond_task = {}
hundred_battle_spawn_check = {}
enemy_gen = {}
enemy_group = {
  single = 1,
  duo = 2,
  trio = 3,
  five = 5
}
sdemo = nil
hundred_battle_caption = {
  {10, "sm43_00103"},
  {30, "sm43_00104"},
  {50, "sm43_00105"},
  {70, "sm43_00106"},
  {99, "sm43_00107"}
}
enemy_pupoil_max = 40
enemy_pupil_table = {
  {
    1,
    2,
    3,
    4
  },
  {5, 6},
  {28, 29},
  {
    16,
    17,
    18
  },
  {
    24,
    25,
    26,
    27
  },
  {
    7,
    8,
    9,
    10
  },
  {
    19,
    20,
    21,
    22,
    23
  },
  {
    30,
    31,
    32,
    33,
    34
  },
  {
    11,
    12,
    13,
    14,
    15
  },
  {
    35,
    36,
    37,
    38,
    39,
    40
  }
}
enemy_pupil_table_flag = {}
enemy_pupil_task = {}
enemy_pupil_flag = {}
enemy_pupil_flag_ringout = {}
SM43_NPC_MOTION = {
  stay_sm43 = "man01_stay_02"
}
SM43_SDEMO_MOTION = {
  sm43_sdemo_01 = "phi01_fee_00"
}
sm43func = {}
function sm43func.onObjectAsh(A0_0, A1_1, A2_2)
  if hundred_battle_down_table[A2_2:getName()] == nil then
    HUD:counter999SubNum(1)
    hundred_battle_down_num = hundred_battle_down_num + 1
    hundred_battle_down_table[A2_2:getName()] = true
  end
end
enmgen2_hundred_battle_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0101",
      type = "follower03",
      variation = "man52_aa",
      locator = "locator2_hundred_battle_10101"
    }
  },
  onObjectAsh = function(A0_3, A1_4)
    sm43func:onObjectAsh(A0_3, A1_4)
  end
}
enmgen2_hundred_battle_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0102",
      type = "follower02",
      variation = "man51_aa",
      locator = "locator2_hundred_battle_10201"
    }
  },
  onObjectAsh = function(A0_5, A1_6)
    sm43func:onObjectAsh(A0_5, A1_6)
  end
}
enmgen2_hundred_battle_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0103",
      type = "follower01",
      variation = "man50_aa",
      locator = "locator2_hundred_battle_10301"
    }
  },
  onObjectAsh = function(A0_7, A1_8)
    sm43func:onObjectAsh(A0_7, A1_8)
  end
}
enmgen2_hundred_battle_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0104",
      type = "follower03",
      variation = "man52_ab",
      locator = "locator2_hundred_battle_10401"
    }
  },
  onObjectAsh = function(A0_9, A1_10)
    sm43func:onObjectAsh(A0_9, A1_10)
  end
}
enmgen2_hundred_battle_05 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0105",
      type = "follower02",
      variation = "man51_ab",
      locator = "locator2_hundred_battle_10501"
    }
  },
  onObjectAsh = function(A0_11, A1_12)
    sm43func:onObjectAsh(A0_11, A1_12)
  end
}
enmgen2_hundred_battle_06 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0106",
      type = "follower01",
      variation = "man50_ab",
      locator = "locator2_hundred_battle_10601"
    }
  },
  onObjectAsh = function(A0_13, A1_14)
    sm43func:onObjectAsh(A0_13, A1_14)
  end
}
enmgen2_hundred_battle_07 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0107",
      type = "follower03",
      variation = "man52_ac",
      locator = "locator2_hundred_battle_10701"
    }
  },
  onObjectAsh = function(A0_15, A1_16)
    sm43func:onObjectAsh(A0_15, A1_16)
  end
}
enmgen2_hundred_battle_08 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0108",
      type = "follower02",
      variation = "man51_ac",
      locator = "locator2_hundred_battle_10801"
    }
  },
  onObjectAsh = function(A0_17, A1_18)
    sm43func:onObjectAsh(A0_17, A1_18)
  end
}
enmgen2_hundred_battle_09 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0109",
      type = "follower01",
      variation = "man50_ac",
      locator = "locator2_hundred_battle_10901"
    }
  },
  onObjectAsh = function(A0_19, A1_20)
    sm43func:onObjectAsh(A0_19, A1_20)
  end
}
enmgen2_hundred_battle_10 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0110",
      type = "follower03",
      variation = "man52_ad",
      locator = "locator2_hundred_battle_11001"
    }
  },
  onObjectAsh = function(A0_21, A1_22)
    sm43func:onObjectAsh(A0_21, A1_22)
  end
}
enmgen2_hundred_battle_11 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0111",
      type = "follower02",
      variation = "man51_ad",
      locator = "locator2_hundred_battle_11101"
    }
  },
  onObjectAsh = function(A0_23, A1_24)
    sm43func:onObjectAsh(A0_23, A1_24)
  end
}
enmgen2_hundred_battle_12 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0112",
      type = "follower01",
      variation = "man50_ad",
      locator = "locator2_hundred_battle_11201"
    }
  },
  onObjectAsh = function(A0_25, A1_26)
    sm43func:onObjectAsh(A0_25, A1_26)
  end
}
enmgen2_hundred_battle_13 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0113",
      type = "follower03",
      variation = "man52_ba",
      locator = "locator2_hundred_battle_11301"
    }
  },
  onObjectAsh = function(A0_27, A1_28)
    sm43func:onObjectAsh(A0_27, A1_28)
  end
}
enmgen2_hundred_battle_14 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0114",
      type = "follower02",
      variation = "man51_ba",
      locator = "locator2_hundred_battle_11401"
    }
  },
  onObjectAsh = function(A0_29, A1_30)
    sm43func:onObjectAsh(A0_29, A1_30)
  end
}
enmgen2_hundred_battle_15 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0115",
      type = "follower01",
      variation = "man50_ba",
      locator = "locator2_hundred_battle_11501"
    }
  },
  onObjectAsh = function(A0_31, A1_32)
    sm43func:onObjectAsh(A0_31, A1_32)
  end
}
enmgen2_hundred_battle_16 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0116",
      type = "follower03",
      variation = "man52_bb",
      locator = "locator2_hundred_battle_11601"
    }
  },
  onObjectAsh = function(A0_33, A1_34)
    sm43func:onObjectAsh(A0_33, A1_34)
  end
}
enmgen2_hundred_battle_17 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0117",
      type = "follower02",
      variation = "man51_bb",
      locator = "locator2_hundred_battle_11701"
    }
  },
  onObjectAsh = function(A0_35, A1_36)
    sm43func:onObjectAsh(A0_35, A1_36)
  end
}
enmgen2_hundred_battle_18 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0118",
      type = "follower01",
      variation = "man50_bb",
      locator = "locator2_hundred_battle_11801"
    }
  },
  onObjectAsh = function(A0_37, A1_38)
    sm43func:onObjectAsh(A0_37, A1_38)
  end
}
enmgen2_hundred_battle_19 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0119",
      type = "follower03",
      variation = "man52_bc",
      locator = "locator2_hundred_battle_11901"
    }
  },
  onObjectAsh = function(A0_39, A1_40)
    sm43func:onObjectAsh(A0_39, A1_40)
  end
}
enmgen2_hundred_battle_20 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0120",
      type = "follower02",
      variation = "man51_bc",
      locator = "locator2_hundred_battle_12001"
    }
  },
  onObjectAsh = function(A0_41, A1_42)
    sm43func:onObjectAsh(A0_41, A1_42)
  end
}
enmgen2_hundred_battle_21 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0121",
      type = "follower01",
      variation = "man50_bc",
      locator = "locator2_hundred_battle_12101"
    }
  },
  onObjectAsh = function(A0_43, A1_44)
    sm43func:onObjectAsh(A0_43, A1_44)
  end
}
enmgen2_hundred_battle_22 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0122",
      type = "follower03",
      variation = "man52_bd",
      locator = "locator2_hundred_battle_12201"
    }
  },
  onObjectAsh = function(A0_45, A1_46)
    sm43func:onObjectAsh(A0_45, A1_46)
  end
}
enmgen2_hundred_battle_23 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0123",
      type = "follower02",
      variation = "man51_bd",
      locator = "locator2_hundred_battle_12301"
    }
  },
  onObjectAsh = function(A0_47, A1_48)
    sm43func:onObjectAsh(A0_47, A1_48)
  end
}
enmgen2_hundred_battle_24 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0124",
      type = "follower01",
      variation = "man50_bd",
      locator = "locator2_hundred_battle_12401"
    }
  },
  onObjectAsh = function(A0_49, A1_50)
    sm43func:onObjectAsh(A0_49, A1_50)
  end
}
enmgen2_hundred_battle_25 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0125",
      type = "follower03",
      variation = "man52_ca",
      locator = "locator2_hundred_battle_12501"
    }
  },
  onObjectAsh = function(A0_51, A1_52)
    sm43func:onObjectAsh(A0_51, A1_52)
  end
}
enmgen2_hundred_battle_201 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0126",
      type = "follower02",
      variation = "man51_ca",
      locator = "locator2_hundred_battle_20101"
    },
    {
      name = "enemy0201",
      type = "follower03",
      variation = "man52_aa",
      locator = "locator2_hundred_battle_20102"
    }
  },
  onObjectAsh = function(A0_53, A1_54)
    sm43func:onObjectAsh(A0_53, A1_54)
  end,
  onSetupGem = function(A0_55, A1_56)
    Fn_enemyPopGemSetup(A0_55, {"enemy0126", "enemy0201"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_57, A1_58)
    Fn_enemyAshPopGem(A0_57, A1_58)
  end
}
enmgen2_hundred_battle_202 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0127",
      type = "follower01",
      variation = "man50_ca",
      locator = "locator2_hundred_battle_20201"
    },
    {
      name = "enemy0202",
      type = "follower02",
      variation = "man51_aa",
      locator = "locator2_hundred_battle_20202"
    }
  },
  onObjectAsh = function(A0_59, A1_60)
    sm43func:onObjectAsh(A0_59, A1_60)
  end,
  onSetupGem = function(A0_61, A1_62)
    Fn_enemyPopGemSetup(A0_61, {"enemy0127", "enemy0202"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_63, A1_64)
    Fn_enemyAshPopGem(A0_63, A1_64)
  end
}
enmgen2_hundred_battle_203 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0128",
      type = "follower03",
      variation = "man52_cb",
      locator = "locator2_hundred_battle_20301"
    },
    {
      name = "enemy0203",
      type = "follower01",
      variation = "man50_aa",
      locator = "locator2_hundred_battle_20302"
    }
  },
  onObjectAsh = function(A0_65, A1_66)
    sm43func:onObjectAsh(A0_65, A1_66)
  end,
  onSetupGem = function(A0_67, A1_68)
    Fn_enemyPopGemSetup(A0_67, {"enemy0128", "enemy0203"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_69, A1_70)
    Fn_enemyAshPopGem(A0_69, A1_70)
  end
}
enmgen2_hundred_battle_204 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0129",
      type = "follower02",
      variation = "man51_cb",
      locator = "locator2_hundred_battle_20401"
    },
    {
      name = "enemy0204",
      type = "follower03",
      variation = "man52_ab",
      locator = "locator2_hundred_battle_20402"
    }
  },
  onObjectAsh = function(A0_71, A1_72)
    sm43func:onObjectAsh(A0_71, A1_72)
  end,
  onSetupGem = function(A0_73, A1_74)
    Fn_enemyPopGemSetup(A0_73, {"enemy0129", "enemy0204"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_75, A1_76)
    Fn_enemyAshPopGem(A0_75, A1_76)
  end
}
enmgen2_hundred_battle_205 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0130",
      type = "follower01",
      variation = "man50_cb",
      locator = "locator2_hundred_battle_20501"
    },
    {
      name = "enemy0205",
      type = "follower02",
      variation = "man51_ab",
      locator = "locator2_hundred_battle_20502"
    }
  },
  onObjectAsh = function(A0_77, A1_78)
    sm43func:onObjectAsh(A0_77, A1_78)
  end,
  onSetupGem = function(A0_79, A1_80)
    Fn_enemyPopGemSetup(A0_79, {"enemy0130", "enemy0205"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_81, A1_82)
    Fn_enemyAshPopGem(A0_81, A1_82)
  end
}
enmgen2_hundred_battle_206 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0131",
      type = "follower03",
      variation = "man52_cc",
      locator = "locator2_hundred_battle_20601"
    },
    {
      name = "enemy0206",
      type = "follower01",
      variation = "man50_ab",
      locator = "locator2_hundred_battle_20602"
    }
  },
  onObjectAsh = function(A0_83, A1_84)
    sm43func:onObjectAsh(A0_83, A1_84)
  end,
  onSetupGem = function(A0_85, A1_86)
    Fn_enemyPopGemSetup(A0_85, {"enemy0131", "enemy0206"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_87, A1_88)
    Fn_enemyAshPopGem(A0_87, A1_88)
  end
}
enmgen2_hundred_battle_207 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0132",
      type = "follower02",
      variation = "man51_cc",
      locator = "locator2_hundred_battle_20701"
    },
    {
      name = "enemy0207",
      type = "follower03",
      variation = "man52_ac",
      locator = "locator2_hundred_battle_20702"
    }
  },
  onObjectAsh = function(A0_89, A1_90)
    sm43func:onObjectAsh(A0_89, A1_90)
  end,
  onSetupGem = function(A0_91, A1_92)
    Fn_enemyPopGemSetup(A0_91, {"enemy0132", "enemy0207"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_93, A1_94)
    Fn_enemyAshPopGem(A0_93, A1_94)
  end
}
enmgen2_hundred_battle_208 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0133",
      type = "follower01",
      variation = "man50_cc",
      locator = "locator2_hundred_battle_20801"
    },
    {
      name = "enemy0208",
      type = "follower02",
      variation = "man51_ac",
      locator = "locator2_hundred_battle_20802"
    }
  },
  onObjectAsh = function(A0_95, A1_96)
    sm43func:onObjectAsh(A0_95, A1_96)
  end,
  onSetupGem = function(A0_97, A1_98)
    Fn_enemyPopGemSetup(A0_97, {"enemy0133", "enemy0208"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_99, A1_100)
    Fn_enemyAshPopGem(A0_99, A1_100)
  end
}
enmgen2_hundred_battle_209 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0134",
      type = "follower03",
      variation = "man52_cd",
      locator = "locator2_hundred_battle_20901"
    },
    {
      name = "enemy0209",
      type = "follower01",
      variation = "man50_ac",
      locator = "locator2_hundred_battle_20902"
    }
  },
  onObjectAsh = function(A0_101, A1_102)
    sm43func:onObjectAsh(A0_101, A1_102)
  end,
  onSetupGem = function(A0_103, A1_104)
    Fn_enemyPopGemSetup(A0_103, {"enemy0134", "enemy0209"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_105, A1_106)
    Fn_enemyAshPopGem(A0_105, A1_106)
  end
}
enmgen2_hundred_battle_210 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0135",
      type = "follower02",
      variation = "man51_cd",
      locator = "locator2_hundred_battle_21001"
    },
    {
      name = "enemy0210",
      type = "follower03",
      variation = "man52_ad",
      locator = "locator2_hundred_battle_21002"
    }
  },
  onObjectAsh = function(A0_107, A1_108)
    sm43func:onObjectAsh(A0_107, A1_108)
  end,
  onSetupGem = function(A0_109, A1_110)
    Fn_enemyPopGemSetup(A0_109, {"enemy0135", "enemy0210"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_111, A1_112)
    Fn_enemyAshPopGem(A0_111, A1_112)
  end
}
enmgen2_hundred_battle_301 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0136",
      type = "follower01",
      variation = "man50_cd",
      locator = "locator2_hundred_battle_30101"
    },
    {
      name = "enemy0211",
      type = "follower02",
      variation = "man51_ad",
      locator = "locator2_hundred_battle_30102"
    },
    {
      name = "enemy0301",
      type = "follower03",
      variation = "man52_aa",
      locator = "locator2_hundred_battle_30103"
    }
  },
  onObjectAsh = function(A0_113, A1_114)
    sm43func:onObjectAsh(A0_113, A1_114)
  end
}
enmgen2_hundred_battle_302 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0137",
      type = "follower03",
      variation = "man52_da",
      locator = "locator2_hundred_battle_30201"
    },
    {
      name = "enemy0212",
      type = "follower01",
      variation = "man50_ad",
      locator = "locator2_hundred_battle_30202"
    },
    {
      name = "enemy0302",
      type = "follower02",
      variation = "man51_aa",
      locator = "locator2_hundred_battle_30203"
    }
  },
  onObjectAsh = function(A0_115, A1_116)
    sm43func:onObjectAsh(A0_115, A1_116)
  end
}
enmgen2_hundred_battle_303 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0138",
      type = "follower02",
      variation = "man51_da",
      locator = "locator2_hundred_battle_30301"
    },
    {
      name = "enemy0213",
      type = "follower03",
      variation = "man52_ba",
      locator = "locator2_hundred_battle_30302"
    },
    {
      name = "enemy0303",
      type = "follower01",
      variation = "man50_aa",
      locator = "locator2_hundred_battle_30303"
    }
  },
  onObjectAsh = function(A0_117, A1_118)
    sm43func:onObjectAsh(A0_117, A1_118)
  end
}
enmgen2_hundred_battle_304 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0139",
      type = "follower01",
      variation = "man50_da",
      locator = "locator2_hundred_battle_30401"
    },
    {
      name = "enemy0214",
      type = "follower02",
      variation = "man51_ba",
      locator = "locator2_hundred_battle_30402"
    },
    {
      name = "enemy0304",
      type = "follower03",
      variation = "man52_ab",
      locator = "locator2_hundred_battle_30403"
    }
  },
  onObjectAsh = function(A0_119, A1_120)
    sm43func:onObjectAsh(A0_119, A1_120)
  end
}
enmgen2_hundred_battle_305 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0140",
      type = "follower03",
      variation = "man52_db",
      locator = "locator2_hundred_battle_30501"
    },
    {
      name = "enemy0215",
      type = "follower01",
      variation = "man50_ba",
      locator = "locator2_hundred_battle_30502"
    },
    {
      name = "enemy0305",
      type = "follower02",
      variation = "man51_ab",
      locator = "locator2_hundred_battle_30503"
    }
  },
  onObjectAsh = function(A0_121, A1_122)
    sm43func:onObjectAsh(A0_121, A1_122)
  end
}
enmgen2_hundred_battle_306 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0141",
      type = "follower02",
      variation = "man51_db",
      locator = "locator2_hundred_battle_30601"
    },
    {
      name = "enemy0216",
      type = "follower03",
      variation = "man52_bb",
      locator = "locator2_hundred_battle_30602"
    },
    {
      name = "enemy0306",
      type = "follower01",
      variation = "man50_ab",
      locator = "locator2_hundred_battle_30603"
    }
  },
  onObjectAsh = function(A0_123, A1_124)
    sm43func:onObjectAsh(A0_123, A1_124)
  end
}
enmgen2_hundred_battle_307 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0142",
      type = "follower01",
      variation = "man50_db",
      locator = "locator2_hundred_battle_30701"
    },
    {
      name = "enemy0217",
      type = "follower02",
      variation = "man51_bb",
      locator = "locator2_hundred_battle_30702"
    },
    {
      name = "enemy0307",
      type = "follower03",
      variation = "man52_ac",
      locator = "locator2_hundred_battle_30703"
    }
  },
  onObjectAsh = function(A0_125, A1_126)
    sm43func:onObjectAsh(A0_125, A1_126)
  end
}
enmgen2_hundred_battle_308 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0143",
      type = "follower03",
      variation = "man52_dc",
      locator = "locator2_hundred_battle_30801"
    },
    {
      name = "enemy0218",
      type = "follower01",
      variation = "man50_bb",
      locator = "locator2_hundred_battle_30802"
    },
    {
      name = "enemy0308",
      type = "follower02",
      variation = "man51_ac",
      locator = "locator2_hundred_battle_30803"
    }
  },
  onObjectAsh = function(A0_127, A1_128)
    sm43func:onObjectAsh(A0_127, A1_128)
  end
}
enmgen2_hundred_battle_309 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0144",
      type = "follower02",
      variation = "man51_dc",
      locator = "locator2_hundred_battle_30901"
    },
    {
      name = "enemy0219",
      type = "follower03",
      variation = "man52_bc",
      locator = "locator2_hundred_battle_30902"
    },
    {
      name = "enemy0309",
      type = "follower01",
      variation = "man50_ac",
      locator = "locator2_hundred_battle_30903"
    }
  },
  onObjectAsh = function(A0_129, A1_130)
    sm43func:onObjectAsh(A0_129, A1_130)
  end
}
enmgen2_hundred_battle_310 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0145",
      type = "follower01",
      variation = "man50_dc",
      locator = "locator2_hundred_battle_31001"
    },
    {
      name = "enemy0220",
      type = "follower02",
      variation = "man51_bc",
      locator = "locator2_hundred_battle_31002"
    },
    {
      name = "enemy0310",
      type = "follower03",
      variation = "man52_ad",
      locator = "locator2_hundred_battle_31003"
    }
  },
  onObjectAsh = function(A0_131, A1_132)
    sm43func:onObjectAsh(A0_131, A1_132)
  end
}
enmgen2_hundred_battle_501 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0146",
      type = "follower03",
      variation = "man52_dd",
      locator = "locator2_hundred_battle_50101"
    },
    {
      name = "enemy0221",
      type = "follower01",
      variation = "man50_bc",
      locator = "locator2_hundred_battle_50102"
    },
    {
      name = "enemy0311",
      type = "follower02",
      variation = "man51_ad",
      locator = "locator2_hundred_battle_50103"
    },
    {
      name = "enemy0401",
      type = "follower03",
      variation = "man52_aa",
      locator = "locator2_hundred_battle_50104"
    },
    {
      name = "enemy0501",
      type = "follower03",
      variation = "man52_aa",
      locator = "locator2_hundred_battle_50105"
    }
  },
  onObjectAsh = function(A0_133, A1_134)
    sm43func:onObjectAsh(A0_133, A1_134)
  end
}
enmgen2_hundred_battle_502 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0147",
      type = "follower02",
      variation = "man51_dd",
      locator = "locator2_hundred_battle_50201"
    },
    {
      name = "enemy0222",
      type = "follower03",
      variation = "man52_bd",
      locator = "locator2_hundred_battle_50202"
    },
    {
      name = "enemy0312",
      type = "follower01",
      variation = "man50_ad",
      locator = "locator2_hundred_battle_50203"
    },
    {
      name = "enemy0402",
      type = "follower02",
      variation = "man51_aa",
      locator = "locator2_hundred_battle_50204"
    },
    {
      name = "enemy0502",
      type = "follower02",
      variation = "man51_aa",
      locator = "locator2_hundred_battle_50205"
    }
  },
  onObjectAsh = function(A0_135, A1_136)
    sm43func:onObjectAsh(A0_135, A1_136)
  end
}
enmgen2_hundred_battle_503 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0148",
      type = "follower01",
      variation = "man50_dd",
      locator = "locator2_hundred_battle_50301"
    },
    {
      name = "enemy0223",
      type = "follower02",
      variation = "man51_bd",
      locator = "locator2_hundred_battle_50302"
    },
    {
      name = "enemy0313",
      type = "follower03",
      variation = "man52_ba",
      locator = "locator2_hundred_battle_50303"
    },
    {
      name = "enemy0403",
      type = "follower01",
      variation = "man50_aa",
      locator = "locator2_hundred_battle_50304"
    },
    {
      name = "enemy0503",
      type = "follower01",
      variation = "man50_aa",
      locator = "locator2_hundred_battle_50305"
    }
  },
  onObjectAsh = function(A0_137, A1_138)
    sm43func:onObjectAsh(A0_137, A1_138)
  end
}
enmgen2_hundred_battle_504 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0149",
      type = "follower03",
      variation = "man52_aa",
      locator = "locator2_hundred_battle_50401"
    },
    {
      name = "enemy0224",
      type = "follower01",
      variation = "man50_bd",
      locator = "locator2_hundred_battle_50402"
    },
    {
      name = "enemy0314",
      type = "follower02",
      variation = "man51_ba",
      locator = "locator2_hundred_battle_50403"
    },
    {
      name = "enemy0404",
      type = "follower03",
      variation = "man52_ab",
      locator = "locator2_hundred_battle_50404"
    },
    {
      name = "enemy0504",
      type = "follower03",
      variation = "man52_ab",
      locator = "locator2_hundred_battle_50405"
    }
  },
  onObjectAsh = function(A0_139, A1_140)
    sm43func:onObjectAsh(A0_139, A1_140)
  end
}
enmgen2_hundred_battle_505 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0150",
      type = "follower02",
      variation = "man51_aa",
      locator = "locator2_hundred_battle_50501"
    },
    {
      name = "enemy0225",
      type = "follower03",
      variation = "man52_ca",
      locator = "locator2_hundred_battle_50502"
    },
    {
      name = "enemy0315",
      type = "follower01",
      variation = "man50_ba",
      locator = "locator2_hundred_battle_50503"
    },
    {
      name = "enemy0405",
      type = "follower02",
      variation = "man51_ab",
      locator = "locator2_hundred_battle_50504"
    },
    {
      name = "enemy0505",
      type = "follower02",
      variation = "man51_ab",
      locator = "locator2_hundred_battle_50505"
    }
  },
  onObjectAsh = function(A0_141, A1_142)
    sm43func:onObjectAsh(A0_141, A1_142)
  end
}
enmgen2_hundred_battle_506 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0151",
      type = "follower01",
      variation = "man50_aa",
      locator = "locator2_hundred_battle_50601"
    },
    {
      name = "enemy0226",
      type = "follower02",
      variation = "man51_ca",
      locator = "locator2_hundred_battle_50602"
    },
    {
      name = "enemy0316",
      type = "follower03",
      variation = "man52_bb",
      locator = "locator2_hundred_battle_50603"
    },
    {
      name = "enemy0406",
      type = "follower01",
      variation = "man50_ab",
      locator = "locator2_hundred_battle_50604"
    },
    {
      name = "enemy0506",
      type = "follower01",
      variation = "man50_ab",
      locator = "locator2_hundred_battle_50605"
    }
  },
  onObjectAsh = function(A0_143, A1_144)
    sm43func:onObjectAsh(A0_143, A1_144)
  end
}
enmgen2_hundred_battle_507 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0152",
      type = "follower03",
      variation = "man52_ab",
      locator = "locator2_hundred_battle_50701"
    },
    {
      name = "enemy0227",
      type = "follower01",
      variation = "man50_ca",
      locator = "locator2_hundred_battle_50702"
    },
    {
      name = "enemy0317",
      type = "follower02",
      variation = "man51_bb",
      locator = "locator2_hundred_battle_50703"
    },
    {
      name = "enemy0407",
      type = "follower03",
      variation = "man52_ac",
      locator = "locator2_hundred_battle_50704"
    },
    {
      name = "enemy0507",
      type = "follower03",
      variation = "man52_ac",
      locator = "locator2_hundred_battle_50705"
    }
  },
  onObjectAsh = function(A0_145, A1_146)
    sm43func:onObjectAsh(A0_145, A1_146)
  end
}
enmgen2_hundred_battle_508 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0153",
      type = "follower02",
      variation = "man51_ab",
      locator = "locator2_hundred_battle_50801"
    },
    {
      name = "enemy0228",
      type = "follower03",
      variation = "man52_cb",
      locator = "locator2_hundred_battle_50802"
    },
    {
      name = "enemy0318",
      type = "follower01",
      variation = "man50_bb",
      locator = "locator2_hundred_battle_50803"
    },
    {
      name = "enemy0408",
      type = "follower02",
      variation = "man51_ac",
      locator = "locator2_hundred_battle_50804"
    },
    {
      name = "enemy0508",
      type = "follower02",
      variation = "man51_ac",
      locator = "locator2_hundred_battle_50805"
    }
  },
  onObjectAsh = function(A0_147, A1_148)
    sm43func:onObjectAsh(A0_147, A1_148)
  end
}
enmgen2_hundred_battle_509 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0154",
      type = "follower01",
      variation = "man50_ab",
      locator = "locator2_hundred_battle_50901"
    },
    {
      name = "enemy0229",
      type = "follower02",
      variation = "man51_cb",
      locator = "locator2_hundred_battle_50902"
    },
    {
      name = "enemy0319",
      type = "follower03",
      variation = "man52_bc",
      locator = "locator2_hundred_battle_50903"
    },
    {
      name = "enemy0409",
      type = "follower01",
      variation = "man50_ac",
      locator = "locator2_hundred_battle_50904"
    },
    {
      name = "enemy0509",
      type = "follower01",
      variation = "man50_ac",
      locator = "locator2_hundred_battle_50905"
    }
  },
  onObjectAsh = function(A0_149, A1_150)
    sm43func:onObjectAsh(A0_149, A1_150)
  end
}
enmgen2_hundred_battle_510 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy0155",
      type = "follower02",
      variation = "man52_ac",
      locator = "locator2_hundred_battle_51001"
    },
    {
      name = "enemy0230",
      type = "follower01",
      variation = "man50_cb",
      locator = "locator2_hundred_battle_51002"
    },
    {
      name = "enemy0320",
      type = "follower02",
      variation = "man51_bc",
      locator = "locator2_hundred_battle_51003"
    },
    {
      name = "enemy0410",
      type = "follower03",
      variation = "man52_ad",
      locator = "locator2_hundred_battle_51004"
    },
    {
      name = "enemy0510",
      type = "follower03",
      variation = "man52_ad",
      locator = "locator2_hundred_battle_51005"
    }
  },
  onObjectAsh = function(A0_151, A1_152)
    sm43func:onObjectAsh(A0_151, A1_152)
  end
}
function Initialize()
  local L0_153, L1_154, L2_155, L3_156, L4_157, L5_158, L6_159
  function L0_153()
    Fn_userCtrlAllOff()
  end
  if L1_154 == false then
    L1_154(L2_155, L3_156)
    for L4_157 = 1, 8 do
      L5_158 = Fn_setNpcActive
      L6_159 = string
      L6_159 = L6_159.format
      L6_159 = L6_159("sm43_student_%02d", L4_157)
      L5_158(L6_159, true)
    end
    L1_154(L2_155, L3_156)
    L1_154()
    for L5_158 = 1, enemy_pupoil_max do
      L6_159 = string
      L6_159 = L6_159.format
      L6_159 = L6_159("npc_mon_%02d", L5_158)
      Fn_disappearNpc(L6_159)
    end
  end
  L2_155.name = "npc_fii_01"
  L2_155.type = "phi01"
  L2_155.node = "locator2_fii_01"
  L2_155.active = false
  L3_156.name = "npc_dus_01"
  L3_156.type = "dus01"
  L3_156.node = "locator2_dus_01"
  L3_156.active = false
  L4_157.name = "npc_mon_01"
  L4_157.type = "npc_follower"
  L4_157.node = "locator2_hundred_npc_mon_01"
  L4_157.color_variation = 0
  L4_157.hair_variation = 3
  L4_157.active = false
  L5_158 = {}
  L5_158.name = "npc_mon_02"
  L5_158.type = "npc_follower"
  L5_158.node = "locator2_hundred_npc_mon_02"
  L5_158.color_variation = 1
  L5_158.hair_variation = 2
  L5_158.active = false
  L6_159 = {}
  L6_159.name = "npc_mon_03"
  L6_159.type = "npc_follower"
  L6_159.node = "locator2_hundred_npc_mon_03"
  L6_159.color_variation = 2
  L6_159.hair_variation = 1
  L6_159.active = false
  L2_155(L3_156)
  for L5_158, L6_159 in L2_155(L3_156) do
    _puppets[L6_159.name] = Fn_findNpcPuppet(L6_159.name)
  end
  L2_155(L3_156)
  sdemo = L2_155
  pond_height_node = L2_155
end
function Ingame()
  local L0_160, L1_161, L2_162, L3_163, L4_164, L5_165, L6_166, L7_167, L8_168, L9_169, L10_170, L11_171, L12_172, L13_173, L14_174, L15_175, L16_176
  L0_160 = Fn_missionStart
  L0_160()
  L0_160 = Fn_userCtrlAllOff
  L0_160()
  L0_160 = Fn_kaiwaDemoView
  L1_161 = "sm43_00100k"
  L0_160(L1_161)
  L0_160 = Sound
  L1_161 = L0_160
  L0_160 = L0_160.pulse
  L2_162 = "m13_005"
  L0_160(L1_161, L2_162)
  L0_160 = Sound
  L1_161 = L0_160
  L0_160 = L0_160.pulse
  L2_162 = "m14_001"
  L0_160(L1_161, L2_162)
  L0_160 = Sound
  L1_161 = L0_160
  L0_160 = L0_160.pulse
  L2_162 = "m15_001"
  L0_160(L1_161, L2_162)
  L0_160 = Fn_blackout
  L0_160()
  L0_160 = Player
  L1_161 = L0_160
  L0_160 = L0_160.setAttrTune
  L2_162 = Player
  L2_162 = L2_162.kAttrTune_Normal
  L0_160(L1_161, L2_162)
  L0_160 = 1
  while true do
    L1_161 = findGameObject2
    L2_162 = "Node"
    L3_163 = "locator2_col_"
    L4_164 = string
    L4_164 = L4_164.format
    L5_165 = "%02d"
    L6_166 = L0_160
    L4_164 = L4_164(L5_165, L6_166)
    L3_163 = L3_163 .. L4_164
    L1_161 = L1_161(L2_162, L3_163)
    if L1_161 ~= nil then
      L2_162 = create_collision
      L3_163 = "col_"
      L4_164 = string
      L4_164 = L4_164.format
      L5_165 = "%02d"
      L6_166 = L0_160
      L4_164 = L4_164(L5_165, L6_166)
      L3_163 = L3_163 .. L4_164
      L4_164 = L1_161
      L2_162(L3_163, L4_164)
    else
      break
    end
    L0_160 = L0_160 + 1
  end
  L1_161 = sm43_createGem
  L1_161()
  L1_161 = 1
  L2_162 = enemy_gen
  L3_163 = {}
  L2_162.single = L3_163
  while true do
    L2_162 = enemy_gen
    L2_162 = L2_162.single
    L3_163 = findGameObject2
    L4_164 = "EnemyGenerator"
    L5_165 = "enmgen2_hundred_battle_"
    L6_166 = string
    L6_166 = L6_166.format
    L6_166 = L6_166(L7_167, L8_168)
    L5_165 = L5_165 .. L6_166
    L3_163 = L3_163(L4_164, L5_165)
    L2_162[L1_161] = L3_163
    L2_162 = enemy_gen
    L2_162 = L2_162.single
    L2_162 = L2_162[L1_161]
    if L2_162 ~= nil then
      L1_161 = L1_161 + 1
    end
  end
  L2_162 = 1
  L3_163 = enemy_gen
  L4_164 = {}
  L3_163.duo = L4_164
  while true do
    L3_163 = enemy_gen
    L3_163 = L3_163.duo
    L4_164 = findGameObject2
    L5_165 = "EnemyGenerator"
    L6_166 = "enmgen2_hundred_battle_"
    L6_166 = L6_166 .. L7_167
    L4_164 = L4_164(L5_165, L6_166)
    L3_163[L2_162] = L4_164
    L3_163 = enemy_gen
    L3_163 = L3_163.duo
    L3_163 = L3_163[L2_162]
    if L3_163 ~= nil then
      L2_162 = L2_162 + 1
    end
  end
  L3_163 = 1
  L4_164 = enemy_gen
  L5_165 = {}
  L4_164.trio = L5_165
  while true do
    L4_164 = enemy_gen
    L4_164 = L4_164.trio
    L5_165 = findGameObject2
    L6_166 = "EnemyGenerator"
    L5_165 = L5_165(L6_166, L7_167)
    L4_164[L3_163] = L5_165
    L4_164 = enemy_gen
    L4_164 = L4_164.trio
    L4_164 = L4_164[L3_163]
    if L4_164 ~= nil then
      L3_163 = L3_163 + 1
    end
  end
  L4_164 = 1
  L5_165 = enemy_gen
  L6_166 = {}
  L5_165.five = L6_166
  while true do
    L5_165 = enemy_gen
    L5_165 = L5_165.five
    L6_166 = findGameObject2
    L6_166 = L6_166(L7_167, L8_168)
    L5_165[L4_164] = L6_166
    L5_165 = enemy_gen
    L5_165 = L5_165.five
    L5_165 = L5_165[L4_164]
    if L5_165 ~= nil then
      L4_164 = L4_164 + 1
    end
  end
  L5_165 = invokeTask
  function L6_166()
    local L0_177, L1_178, L2_179, L3_180, L4_181, L5_182, L6_183, L7_184, L8_185, L9_186, L10_187
    while true do
      for L3_180, L4_181 in L0_177(L1_178) do
        for L8_185, L9_186 in L5_182(L6_183) do
          L10_187 = L9_186.getEnemyCount
          L10_187 = L10_187(L9_186)
          if L10_187 > 0 then
            L10_187 = L9_186.getSpecTable
            L10_187 = L10_187(L9_186)
            L10_187 = L10_187.spawnSet
            for _FORV_14_, _FORV_15_ in ipairs(L10_187) do
              if findGameObject2("Puppet", _FORV_15_.name) and findGameObject2("Puppet", _FORV_15_.name):getWorldPos().y < pond_height_node:getWorldPos().y then
                ActionAfterEnemyPondDrop(_FORV_15_.name, findGameObject2("Puppet", _FORV_15_.name):getWorldPos())
              end
            end
          end
        end
      end
      L0_177()
    end
  end
  L5_165 = L5_165(L6_166)
  L6_166 = {
    L7_167,
    L8_168,
    L9_169,
    L10_170,
    L11_171,
    L12_172,
    L13_173,
    L14_174,
    L15_175,
    L16_176,
    {
      npc_name = "npc_mon_11",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_12",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_13",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_14",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_15",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_16",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_17",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_18",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_19",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_20",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_21",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_22",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_23",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_24",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_25",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_26",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_27",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_28",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_29",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_30",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_31",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_32",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_33",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_34",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_35",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_36",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_37",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_38",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_39",
      idle_motion_tbl = {"stay_sm43"}
    },
    {
      npc_name = "npc_mon_40",
      idle_motion_tbl = {"stay_sm43"}
    }
  }
  L7_167.npc_name = "npc_mon_01"
  L7_167.idle_motion_tbl = L8_168
  L8_168.npc_name = "npc_mon_02"
  L8_168.idle_motion_tbl = L9_169
  L9_169.npc_name = "npc_mon_03"
  L9_169.idle_motion_tbl = L10_170
  L10_170.npc_name = "npc_mon_04"
  L10_170.idle_motion_tbl = L11_171
  L11_171.npc_name = "npc_mon_05"
  L11_171.idle_motion_tbl = L12_172
  L12_172.npc_name = "npc_mon_06"
  L12_172.idle_motion_tbl = L13_173
  L13_173.npc_name = "npc_mon_07"
  L13_173.idle_motion_tbl = L14_174
  L14_174.npc_name = "npc_mon_08"
  L14_174.idle_motion_tbl = L15_175
  L15_175.npc_name = "npc_mon_09"
  L15_175.idle_motion_tbl = L16_176
  L16_176.npc_name = "npc_mon_10"
  L16_176.idle_motion_tbl = {"stay_sm43"}
  for L10_170, L11_171 in L7_167(L8_168) do
    L13_173(L14_174, L15_175)
    L13_173(L14_174, L15_175)
    L14_174(L15_175, L16_176)
    L15_175(L16_176, SM43_NPC_MOTION[L14_174], {isRepeat = true, isRandom = true})
  end
  L7_167(L8_168)
  L7_167()
  L7_167(L8_168, L9_169)
  L7_167(L8_168, L9_169)
  for L10_170 = 1, 8 do
    L11_171(L12_172, L13_173)
  end
  for L10_170 = 1, enemy_pupoil_max do
    L11_171(L12_172, L13_173)
  end
  L7_167(L8_168)
  L7_167(L8_168, L9_169)
  L7_167()
  L7_167(L8_168, L9_169)
  L7_167(L8_168)
  L7_167(L8_168, L9_169, L10_170, L11_171, L12_172, L13_173, L14_174, L15_175, L16_176, L12_172(L13_173, L14_174, L15_175))
  L7_167(L8_168)
  L7_167()
  L7_167(L8_168)
  L12_172.isStop = true
  L8_168(L9_169, L10_170, L11_171, L12_172)
  L8_168(L9_169, L10_170, L11_171)
  L8_168(L9_169)
  L8_168(L9_169, L10_170)
  for L11_171 = 1, #L9_169 do
    L12_172[L11_171] = false
  end
  while true do
    if L8_168 < L9_169 then
      L10_170(L11_171)
      if L10_170 == nil then
        L10_170(L11_171)
        L10_170(L11_171, L12_172)
        hundred_battle_spawn_num = L10_170
        L10_170[L11_171] = true
        L10_170(L11_171)
      end
    end
  end
  L9_169(L10_170)
  L9_169(L10_170)
  L9_169(L10_170)
  L9_169()
  L9_169(L10_170)
  L9_169()
  L9_169(L10_170)
  L9_169()
  L9_169(L10_170)
  for L12_172, L13_173 in L9_169(L10_170) do
    for _FORV_17_, _FORV_18_ in L14_174(L15_175) do
      _FORV_18_:requestIdlingEnemy(false)
    end
  end
  L10_170(L11_171, L12_172)
  L10_170(L11_171, L12_172)
  L10_170(L11_171, L12_172)
  L10_170(L11_171, L12_172)
  L10_170(L11_171, L12_172)
  L10_170(L11_171, L12_172)
  L10_170(L11_171, L12_172, L13_173)
  tension_action_task = L11_171
  tension_gauge_task = L11_171
  tension_system_task = L11_171
  while true do
    if not L12_172 then
      if L12_172 == true then
        if L12_172 == true then
          L12_172()
          L12_172(L13_173)
          vol_stage_outside = false
          L12_172()
        end
      end
      if L12_172 == true then
        L12_172()
        L12_172()
        tension_gauge = 0
        L12_172(L13_173)
        if L13_173 > 0 then
          L14_174(L15_175, L16_176, L13_173)
        else
          L14_174(L15_175, L16_176, 10)
        end
        vol_stage_outside_pond = false
        L14_174()
        L14_174()
      end
      if L12_172 >= L13_173 then
        hundred_battle_end = true
      end
      L12_172()
    end
  end
  if L5_165 ~= nil then
    L12_172(L13_173)
    L5_165 = nil
  end
  if L12_172 ~= nil then
    L12_172(L13_173)
    tension_system_task = nil
  end
  if L12_172 ~= nil then
    L12_172(L13_173)
    tension_gauge_task = nil
  end
  if L12_172 ~= nil then
    L12_172(L13_173)
    tension_action_task = nil
  end
  if L12_172 ~= nil then
    L12_172(L13_173)
    tension_idle_task = nil
  end
  if L12_172 ~= nil then
    L12_172(L13_173)
    tension_damage_task = nil
  end
  if L12_172 ~= nil then
    L12_172(L13_173)
    tension_max_task = nil
  end
  L12_172(L13_173)
  L12_172(L13_173)
  L12_172()
  L12_172()
  L12_172(L13_173, L14_174)
  L12_172(L13_173)
  L12_172(L13_173, L14_174, L15_175)
  L12_172(L13_173)
  L12_172(L13_173, L14_174)
  L12_172(L13_173, L14_174)
  L12_172(L13_173)
  L12_172()
  L12_172(L13_173)
  L12_172(L13_173)
  for L15_175 = 1, 40 do
    Fn_disappearNpc(L16_176)
    _puppets[L16_176] = nil
  end
  L12_172()
  L12_172()
  L12_172()
  L12_172()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setEnergyInfinite(Player.kEnergy_Life, false)
  end
end
function pccubesensormulti2_outside_01_OnEnter()
  local L0_188, L1_189
  vol_stage_outside = false
end
function pccubesensormulti2_outside_01_OnLeave()
  local L0_190, L1_191
  vol_stage_outside = true
end
function pccubesensor2_pond_OnEnter()
  vol_stage_outside_pond = true
  print("\230\177\160\227\131\157\227\131\129\227\131\163")
end
function pccubesensor2_pond_OnLeave()
  vol_stage_outside_pond = false
  print("\230\177\160\232\132\177\229\135\186")
end
function cubesensor2_pond_OnEnter(A0_192, A1_193)
  print("pond_sensor_in:" .. A1_193:getName())
  if string.find(A1_193:getName(), "npc_mon") ~= nil or string.find(A1_193:getName(), "enemy") ~= nil then
    ActionAfterEnemyPondDrop(A1_193:getName(), A1_193:getWorldPos())
  end
end
function cubesensor2_npc_to_enemy_OnEnter(A0_194, A1_195)
  if string.find(A1_195:getName(), "npc_mon") ~= nil then
    enemy_pupil_flag[A1_195:getName()] = true
  end
end
function cubesensor2_ringout_OnEnter(A0_196, A1_197)
  if string.find(A1_197:getName(), "npc_mon") ~= nil then
    enemy_pupil_flag[A1_197:getName()] = true
    enemy_pupil_flag_ringout[A1_197:getName()] = true
  end
end
function hundred_battle_EnemyFlow()
  local L0_198
  L0_198 = nil
  return invokeTask(function()
    local L0_199, L1_200, L2_201, L3_202, L4_203, L5_204, L6_205, L7_206, L8_207, L9_208, L10_209, L11_210, L12_211, L13_212, L14_213
    L0_199 = 1
    L1_200 = 1
    L2_201 = 0
    while true do
      L3_202 = Fn_getPlayerWorldTransform
      L4_203 = L3_202()
      L5_204 = L3_202.y
      L5_204 = L5_204 + 1.5
      L3_202.y = L5_204
      L5_204 = Query
      L5_204 = L5_204.setEyeSightTransform
      L5_204(L6_205, L7_206, L8_207)
      L5_204 = hundred_battle_spawn_num
      L5_204 = L5_204 - L6_205
      if L5_204 < L6_205 then
        L5_204 = multiple_simultaneous_phase_max
        if L0_199 <= L5_204 then
          L5_204 = hundred_battle_InsightCheck
          L5_204 = L5_204(L6_205)
          if not L5_204 then
            L5_204 = hundred_battle_InsightCheck
            L5_204 = L5_204(L6_205)
          elseif L5_204 then
            L5_204 = hundred_battle_InsightCheck
            L5_204 = L5_204(L6_205)
            if L5_204 then
              L5_204 = tension_max_flag
              if L5_204 == false then
                L5_204 = hundred_battle_EnemyPopulationGenerator
                L5_204 = L5_204(L6_205, L7_206, L8_207)
                L6_205(L7_206)
                L2_201 = L2_201 + L5_204
                L5_204 = L6_205
                L6_205(L7_206)
                L2_201 = L2_201 + L5_204
              else
                L5_204 = hundred_battle_EnemyPopulationGenerator
                L5_204 = L5_204(L6_205, L7_206, L8_207)
                L6_205(L7_206)
                L2_201 = L2_201 + L5_204
                if L6_205 < L7_206 then
                  L5_204 = L6_205
                  L6_205(L7_206)
                  L2_201 = L2_201 + L5_204
                end
              end
            end
          end
        end
      end
      L5_204 = L0_199 * 5
      if L2_201 >= L5_204 then
        L0_199 = L0_199 + 1
        L5_204 = L0_199 * 5
        if L2_201 >= L5_204 then
          L0_199 = L0_199 + 1
        end
        L5_204 = print
        L5_204(L6_205)
        L5_204 = print
        L5_204(L6_205)
        L5_204 = print
        L13_212 = multiple_simultaneous_min
        L13_212 = L13_212[L1_200]
        L13_212 = L0_199
        L14_213 = " / "
        L5_204(L6_205)
      end
      L5_204 = enemy_pupil_table_start_num
      L5_204 = #L5_204
      if L1_200 <= L5_204 then
        if L1_200 == 1 then
          L5_204 = print
          L5_204(L6_205)
          L5_204 = Fn_findNpc
          L14_213 = L6_205(L7_206, L8_207)
          L5_204 = L5_204(L6_205, L7_206, L8_207, L9_208, L10_209, L11_210, L12_211, L13_212, L14_213, L6_205(L7_206, L8_207))
          L14_213 = L7_206(L8_207, L9_208)
          L0_198 = L8_207
          for L11_210 = 1, #L9_208 do
            L13_212 = enemy_pupil_task
            L14_213 = hundred_battle_EnemyPupilGenerator
            L14_213 = L14_213(L12_211)
            L13_212[L12_211] = L14_213
            L13_212 = hundred_battle_spawn_num
            L13_212 = L13_212 + 1
            hundred_battle_spawn_num = L13_212
            L13_212 = waitSeconds
            L14_213 = 0.5
            L13_212(L14_213)
          end
          L8_207[1] = true
          L1_200 = L1_200 + 1
        else
          L5_204 = hundred_battle_down_num
          if L5_204 >= L6_205 then
            L5_204 = hundred_battle_spawn_num
            L5_204 = L5_204 - L6_205
            if L5_204 <= L6_205 then
              L5_204 = print
              L5_204(L6_205)
              L5_204 = {}
              for L9_208 = 1, #L7_206 do
                L10_209.ratio = nil
                L10_209.dist = nil
                L5_204[L9_208] = L10_209
                if L10_209 == false then
                  for L13_212 = 1, #L11_210 do
                    L14_213 = Fn_findNpcPuppet
                    L14_213 = L14_213(string.format("npc_mon_%02d", enemy_pupil_table[L9_208][L13_212]))
                    if RAC_getSightTarget(L14_213) ~= nil and (L5_204[L9_208].ratio == nil or RAC_getSightTarget(L14_213) < L5_204[L9_208].ratio) then
                      L5_204[L9_208].ratio = RAC_getSightTarget(L14_213)
                    end
                    if L5_204[L9_208].dist == nil or Fn_getDistanceToPlayer(L14_213) < L5_204[L9_208].dist then
                      L5_204[L9_208].dist = Fn_getDistanceToPlayer(L14_213)
                    end
                  end
                  if L10_209 ~= nil then
                    if L10_209 ~= nil then
                      L13_212 = " ratio="
                      L14_213 = L5_204[L9_208]
                      L14_213 = L14_213.ratio
                      L10_209(L11_210)
                    end
                  elseif L10_209 == nil then
                    L13_212 = " dist="
                    L14_213 = L5_204[L9_208]
                    L14_213 = L14_213.dist
                    L10_209(L11_210)
                  else
                    L13_212 = " INVALID"
                    L10_209(L11_210)
                  end
                end
              end
              for L11_210 = 1, #L9_208 do
                if L12_211 ~= nil then
                  if L7_206 ~= nil then
                  elseif L7_206 > L12_211 then
                  end
                end
              end
              if L6_205 == nil then
                for L12_211 = 1, #L10_209 do
                  L13_212 = L5_204[L12_211]
                  L13_212 = L13_212.dist
                  if L13_212 ~= nil then
                    if L8_207 ~= nil then
                      L13_212 = L5_204[L12_211]
                      L13_212 = L13_212.dist
                    elseif L8_207 > L13_212 then
                      L13_212 = L5_204[L12_211]
                    end
                  end
                end
              end
              if L6_205 ~= nil then
                L8_207(L9_208)
                L14_213 = L9_208(L10_209, L11_210)
                L13_212 = 2
                L0_198 = L9_208
                for L12_211 = 1, #L10_209 do
                  L13_212 = enemy_pupil_table
                  L13_212 = L13_212[L6_205]
                  L13_212 = L13_212[L12_211]
                  L14_213 = enemy_pupil_task
                  L14_213[L13_212] = hundred_battle_EnemyPupilGenerator(L13_212)
                  L14_213 = hundred_battle_spawn_num
                  L14_213 = L14_213 + 1
                  hundred_battle_spawn_num = L14_213
                  L14_213 = waitSeconds
                  L14_213(0.5)
                end
                L9_208[L6_205] = true
                L1_200 = L1_200 + 1
              end
            end
          end
        end
      end
      L5_204 = wait
      L5_204()
    end
  end)
end
function hundred_battle_InsightCheck(A0_214)
  local L1_215, L2_216, L3_217, L4_218, L5_219, L6_220, L7_221, L8_222, L9_223, L10_224, L11_225, L12_226, L13_227
  L1_215 = 0
  for L5_219, L6_220 in L2_216(L3_217) do
    if L7_221 == nil then
      for L10_224, L11_225 in L7_221(L8_222) do
        L12_226 = findGameObject2
        L13_227 = "Node"
        L12_226 = L12_226(L13_227, "locator2_hundred_battle_" .. string.format("%d", enemy_group[A0_214]) .. string.format("%02d", L5_219) .. string.format("%02d", L10_224))
        L13_227 = findGameObject2
        L13_227 = L13_227("Node", "locator2_hundred_battle_dummy_" .. string.format("%d", enemy_group[A0_214]) .. string.format("%02d", L5_219) .. string.format("%02d", L10_224))
        if Fn_isInSightTarget(L12_226, 1) or Fn_isInSightTarget(L13_227, 1) or Query:calcInSightRatioSphere(L12_226:getWorldPos(), 1) ~= nil then
        else
          L1_215 = L1_215 + 1
        end
      end
    end
  end
  if L1_215 == 0 then
    L2_216(L3_217)
    return L2_216
  else
    L2_216(L3_217)
    return L2_216
  end
end
function hundred_battle_EnemyPupilGenerator(A0_228)
  local L1_229
  L1_229 = string
  L1_229 = L1_229.format
  L1_229 = L1_229("npc_mon_%02d", A0_228)
  enemy_pupil_flag[L1_229] = false
  return invokeTask(function()
    Fn_playMotionNpc(L1_229, "run", false)
    while enemy_pupil_flag[L1_229] == false do
      wait()
      if 0 + 1 > 150 then
        enemy_pupil_flag[L1_229] = true
      end
    end
    if enemy_pupil_flag_ringout[L1_229] == true then
      Fn_playMotionNpc(L1_229, "land")
      if hundred_battle_down_table[L1_229] == nil then
        HUD:counter999SubNum(1)
        hundred_battle_down_num = hundred_battle_down_num + 1
        hundred_battle_down_table[L1_229] = true
      end
    else
      Fn_playMotionNpc(L1_229, "land")
      if Fn_findNpc(L1_229):isNpc() then
        Fn_findNpc(L1_229):setEventListener("npcDead", function()
          if hundred_battle_down_table[L1_229] == nil then
            HUD:counter999SubNum(1)
            hundred_battle_down_num = hundred_battle_down_num + 1
            hundred_battle_down_table[L1_229] = true
          end
        end)
        Fn_findNpc(L1_229):changeEnemy()
      end
    end
  end)
end
function hundred_battle_EnemyPopulationGenerator(A0_230, A1_231, A2_232)
  local L3_233, L4_234, L5_235, L6_236, L7_237, L8_238, L9_239, L10_240, L11_241, L12_242, L13_243, L14_244, L15_245, L16_246, L17_247, L18_248, L19_249, L20_250
  L3_233 = {}
  L4_234 = nil
  L5_235 = {}
  L6_236 = 0
  L7_237 = print
  L7_237(L8_238)
  L7_237 = false
  if not (L8_238 > L9_239) then
  elseif L8_238 > L9_239 then
    if L8_238 >= 3 then
      A0_230 = "trio"
    elseif L8_238 >= 2 then
      A0_230 = "duo"
    elseif L8_238 >= 1 then
      A0_230 = "single"
    else
      L10_240(L11_241)
      return L10_240
    end
    L13_243 = " > "
    L10_240(L11_241)
  end
  for L11_241, L12_242 in L8_238(L9_239) do
    L13_243 = print
    L17_247 = L11_241
    L17_247 = string
    L17_247 = L17_247.format
    L18_248 = "%02d"
    L19_249 = L11_241
    L17_247 = L17_247(L18_248, L19_249)
    L18_248 = "]:CHECK"
    L13_243(L14_244)
    L13_243 = hundred_battle_spawn_check
    L13_243 = L13_243[L14_244]
    if L13_243 == nil then
      L13_243 = true
      for L17_247, L18_248 in L14_244(L15_245) do
        L19_249 = findGameObject2
        L20_250 = "Node"
        L19_249 = L19_249(L20_250, "locator2_hundred_battle_" .. string.format("%d", enemy_group[A0_230]) .. string.format("%02d", L11_241) .. string.format("%02d", L17_247))
        L20_250 = findGameObject2
        L20_250 = L20_250("Node", "locator2_hundred_battle_dummy_" .. string.format("%d", enemy_group[A0_230]) .. string.format("%02d", L11_241) .. string.format("%02d", L17_247))
        if Fn_isInSightTarget(L19_249, 1) or Fn_isInSightTarget(L20_250, 1) or Query:calcInSightRatioSphere(L19_249:getWorldPos(), 1) ~= nil then
          print(string.format("%d", enemy_group[A0_230]) .. string.format("%02d", L11_241) .. string.format("%02d", L17_247) .. ":\232\166\139\227\129\136\227\129\166\227\130\139")
          L13_243 = false
          break
        end
      end
      if L13_243 == true then
        L3_233[L11_241] = true
        L7_237 = true
      else
        L3_233[L11_241] = false
      end
    else
      L13_243 = print
      L17_247 = L11_241
      L17_247 = string
      L17_247 = L17_247.format
      L18_248 = "%02d"
      L19_249 = L11_241
      L17_247 = L17_247(L18_248, L19_249)
      L18_248 = "]:\230\151\162\229\135\186"
      L13_243(L14_244)
      L3_233[L11_241] = false
    end
  end
  for L13_243, L14_244 in L10_240(L11_241) do
    if L15_245 == true then
      L17_247 = "Node"
      L18_248 = "locator2_hundred_battle_"
      L19_249 = string
      L19_249 = L19_249.format
      L20_250 = "%d"
      L19_249 = L19_249(L20_250, enemy_group[A0_230])
      L20_250 = string
      L20_250 = L20_250.format
      L20_250 = L20_250("%02d", L13_243)
      L18_248 = L18_248 .. L19_249 .. L20_250 .. string.format("%02d", L15_245)
      L17_247 = print
      L18_248 = "locator2_hundred_battle_"
      L19_249 = string
      L19_249 = L19_249.format
      L20_250 = "%d"
      L19_249 = L19_249(L20_250, enemy_group[A0_230])
      L20_250 = string
      L20_250 = L20_250.format
      L20_250 = L20_250("%02d", L13_243)
      L18_248 = L18_248 .. L19_249 .. L20_250 .. string.format("%02d", L15_245) .. " DISTANCE CHECK"
      L17_247(L18_248)
      L17_247 = Fn_getDistanceToPlayer
      L18_248 = L16_246
      L17_247 = L17_247(L18_248)
      L9_239[L13_243] = L17_247
      L17_247 = print
      L18_248 = string
      L18_248 = L18_248.format
      L19_249 = "%d"
      L20_250 = enemy_group
      L20_250 = L20_250[A0_230]
      L18_248 = L18_248(L19_249, L20_250)
      L19_249 = string
      L19_249 = L19_249.format
      L20_250 = "%02d"
      L19_249 = L19_249(L20_250, L13_243)
      L20_250 = "["
      L18_248 = L18_248 .. L19_249 .. L20_250 .. string.format("%02d", L13_243) .. "] DISTANCE: " .. L9_239[L13_243]
      L17_247(L18_248)
      if L8_238 == -1 then
        if A1_231 == "center" then
          L6_236 = L6_236 + 1
          L17_247 = {}
          L18_248 = L9_239[L13_243]
          L17_247.dis = L18_248
          L17_247.num = L13_243
          L5_235[L6_236] = L17_247
        end
      else
        if A1_231 == "far" then
          L17_247 = L9_239[L13_243]
          L18_248 = L9_239[L8_238]
        end
        if A1_231 == "near" then
          L17_247 = L9_239[L13_243]
          L18_248 = L9_239[L8_238]
        end
        if A1_231 == "center" then
          L6_236 = L6_236 + 1
          L17_247 = {}
          L18_248 = L9_239[L13_243]
          L17_247.dis = L18_248
          L17_247.num = L13_243
          L5_235[L6_236] = L17_247
          L17_247 = print
          L18_248 = "CENTER_CHECK : "
          L19_249 = L6_236
          L20_250 = " "
          L18_248 = L18_248 .. L19_249 .. L20_250 .. L5_235[L6_236].dis .. " " .. L5_235[L6_236].num
          L17_247(L18_248)
        end
      end
    end
  end
  if L8_238 ~= -1 then
    if A1_231 == "center" then
      if L6_236 > 1 then
        L10_240(L11_241, L12_242)
        L13_243 = L6_236 / 2
        L10_240(L11_241)
        L4_234 = L10_240.num
      else
        L4_234 = L10_240.num
      end
    else
      L4_234 = L8_238
    end
  end
  if L7_237 == true then
    L13_243 = "%02d"
    L10_240(L11_241)
    L10_240(L11_241)
    L10_240[L11_241] = true
    hundred_battle_spawn_num = L10_240
    return L10_240
  end
  L10_240(L11_241)
  return L10_240
end
function sm43_LookAtObjectWait(A0_251, A1_252, A2_253, A3_254)
  local L4_255, L5_256, L6_257, L7_258
  L4_255 = _findObjectHandle
  L5_256 = A0_251
  L4_255 = L4_255(L5_256)
  L5_256 = 0
  L6_257 = Fn_lookAtObject
  L7_258 = L4_255
  L6_257 = L6_257(L7_258, A1_252)
  L7_258 = invokeTask
  L7_258 = L7_258(function()
    if A3_254 ~= nil then
      waitSeconds(A3_254)
    else
      waitSeconds(4)
    end
  end)
  return invokeTask(function()
    while L7_258:isRunning() and not Fn_isInSightTarget(L4_255, A2_253) do
      if is_camera_input() == true then
        print("\227\130\171\227\131\161\227\131\169\227\130\146\230\147\141\228\189\156\227\129\151\227\129\166\227\129\132\227\130\139")
        L5_256 = L5_256 + 1
      end
      if L5_256 > 10 then
        print("\227\130\171\227\131\161\227\131\169\227\130\146\230\147\141\228\189\156\227\129\151\227\129\166\227\129\139\227\130\137\228\184\128\229\174\154\230\153\130\233\150\147\227\129\140\231\181\140\227\129\163\227\129\159")
        break
      end
      wait()
    end
    L6_257:abort()
    L7_258:abort()
  end)
end
function is_camera_input(A0_259, A1_260)
  local L2_261
  L2_261 = false
  if Pad:getStick(Pad.kStick_Camera) > 0 or Pad:getStick(Pad.kStick_Camera) > 0 then
    L2_261 = true
  end
  return L2_261
end
function sm43_TensionGauge()
  local L0_262
  L0_262 = nil
  return invokeTask(function()
    while true do
      if tension_gauge > 0 then
        L0_262 = tension_gauge / 100
      else
        L0_262 = 0
      end
      HUD:miniGaugeSetNum(L0_262)
      wait()
    end
  end)
end
function sm43_TensionSystem()
  local L0_263, L1_264
  L0_263, L1_264 = nil, nil
  tension_damage_task = sm43_Tension_DamageCheck()
  return invokeTask(function()
    while true do
      if tension_max_flag == false and tension_gauge >= tension_gauge_max then
        tension_gauge = tension_gauge_max
        if tension_idle_task ~= nil then
          tension_idle_task:abort()
          tension_idle_task = nil
        end
        Player:setAttrTune(Player.kAttrTune_Jupiter)
        tension_max_task = sm43_Tension_MaxCheck()
        L1_264 = math.random(1, #se_tension_max)
        Sound:pulse(se_tension_max[L1_264])
        L1_264 = math.random(1, #caption_tension_max)
        Fn_captionView(caption_tension_max[L1_264])
        tension_max_flag = true
        HUD:miniGaugeSetType(HUD.kCountType_Down, 1)
        Player:setEnergyInfinite(Player.kEnergy_Life, true)
        L0_263 = RAC_createEffect({
          eff_name = "ef_ev_yp_chg",
          pos_node = Fn_getPlayer(),
          time = 2.7
        })
        Sound:pulse("ef_ev_exp_01")
        print("!!! TENSION MAX !!!")
      end
      if tension_max_flag == true and tension_gauge <= 0 then
        tension_gauge = 0
        if tension_max_task ~= nil then
          tension_max_task:abort()
          tension_max_task = nil
        end
        Player:setAttrTune(Player.kAttrTune_Normal)
        HUD:miniGaugeSetType(HUD.kCountType_Up, 1)
        Player:setEnergyInfinite(Player.kEnergy_Life, false)
        tension_max_flag = false
        print("::: TENSION NORMAL :::")
      end
      wait()
    end
  end)
end
function sm43_Tension_MaxCheck()
  return invokeTask(function()
    waitSeconds(TENSION_IDLE_TIME)
    while true do
      waitSeconds(TENSION_MAX_INTERVAL_TIME)
      tension_gauge = tension_gauge - TENSION_MAX_DOWN_INTERVAL
      if tension_gauge < 0 then
        tension_gauge = 0
      end
    end
  end)
end
function sm43_Tension_DamageCheck()
  return invokeTask(function()
    while true do
      if Player:getLastFrameDamagePoint() > 0 then
        if tension_max_flag == false then
          tension_gauge = math.max(tension_gauge - TENSION_DAMAGE, 0)
        else
          tension_gauge = math.max(tension_gauge - TENSION_MAX_DAMAGE, 0)
        end
      end
      wait()
    end
  end)
end
function sm43_Tension_ActionCheck()
  tension_idle_task = sm43_Tension_IdleCheck()
  return invokeTask(function()
    while true do
      if Player:getLastFrameAttackPoint() > 0 then
        if tension_idle_task ~= nil then
          tension_idle_task:abort()
          tension_idle_task = nil
        end
        if tension_max_flag == false then
          if Player:getAction() == Player.kAction_KickCombo then
            tension_gauge = tension_gauge + TENSION_KICK_COMBO_NORMAL
          elseif Player:getAction() == Player.kAction_CounterAtk then
            tension_gauge = tension_gauge + TENSION_COUNTER_ATTACK
          elseif Player:getAction() == Player.kAction_ShortJpAtk then
            tension_gauge = tension_gauge + TENSION_SHORTJUMP_ATTACK
          else
            tension_gauge = tension_gauge + TENSION_JUMP_KICK
          end
        elseif Player:getAction() == Player.kAction_KickCombo then
          tension_gauge = tension_gauge + TENSION_MAX_KICK_COMBO_NORMAL
        elseif Player:getAction() == Player.kAction_CounterAtk then
          tension_gauge = tension_gauge + TENSION_MAX_COUNTER_ATTACK
        elseif Player:getAction() == Player.kAction_ShortJpAtk then
          tension_gauge = tension_gauge + TENSION_SHORTJUMP_ATTACK
        else
          tension_gauge = tension_gauge + TENSION_MAX_SHORTJUMP_ATTACK
        end
        if tension_gauge >= tension_gauge_max then
          tension_gauge = tension_gauge_max
        end
      elseif tension_idle_task == nil and tension_max_flag == false then
        tension_idle_task = sm43_Tension_IdleCheck()
      end
      wait()
    end
  end)
end
function sm43_Tension_IdleCheck()
  return invokeTask(function()
    waitSeconds(TENSION_IDLE_TIME)
    while true do
      waitSeconds(TENSION_DOWN_INTERVAL_TIME)
      tension_gauge = tension_gauge - TENSION_DOWN_INTERVAL
      if tension_gauge < 0 then
        tension_gauge = 0
      end
    end
  end)
end
function create_collision(A0_265, A1_266)
  local L2_267
  L2_267 = createGameObject2
  L2_267 = L2_267("GimmickBg")
  A1_266:appendChild(L2_267)
  L2_267:setName(A0_265)
  L2_267:setCollisionName("sm43_col")
  L2_267:setAttributeName("invisible_col")
  L2_267:overrideCollisionFilterLayer("Boundary")
  L2_267:try_init()
  L2_267:waitForReady()
  L2_267:try_start()
end
function sm43_createGem()
  local L0_268, L1_269
  L0_268 = 1
  while true do
    L1_269 = findGameObject2
    L1_269 = L1_269("Node", "locator2_gem_vital_create_" .. string.format("%02d", L0_268))
    if L1_269 ~= nil then
      RAC_createGemWait("vital_gem_" .. string.format("%02d", L0_268), GEM_VITAL, L1_269)
      L0_268 = L0_268 + 1
    end
  end
end
function ActionAfterEnemyPondDrop(A0_270, A1_271)
  if hundred_battle_pond_task[A0_270] == nil then
    print("PondDrop " .. A0_270)
    hundred_battle_pond_task[A0_270] = invokeTask(function()
      if findGameObject2("EnemyBrain", A0_270) then
        findGameObject2("EnemyBrain", A0_270):setEnableTarget(false)
        findGameObject2("EnemyBrain", A0_270):cmd("ForceDead")
        print("enemyBrain_ForceDead\229\145\188\227\129\179\229\135\186\227\129\151:" .. A0_270)
      elseif _puppets[A0_270] ~= nil then
        Fn_findNpc(A0_270):changeNpc()
        Fn_setNpcActive(A0_270, false)
      end
      if true then
        if hundred_battle_down_table[A0_270] == nil then
          HUD:counter999SubNum(1)
          hundred_battle_down_num = hundred_battle_down_num + 1
          hundred_battle_down_table[A0_270] = true
        end
        A1_271.y = pond_height_node:getWorldPos().y
        Sound:playSE("ene_human_fall_water", 1, "", RAC_createEffectReadyWait({
          eff_name = "ef_com_wtr_07",
          world_pos = A1_271
        }):getPosNode())
      end
    end)
  end
end
