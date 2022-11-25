dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Mob/mob_event_util.lua")
_reinforce = false
_grigo_goal = false
_grigo_goal02 = false
_begin_main_a = false
_mob_to_npc_table = {}
_is_ready = false
_begin_b_sdemo_00 = false
_begin_b_sdemo_01 = false
_begin_main_b = false
_alive_sol_cnt = 12
_defeat_enemy_cnt = 0
_defeat_enemy_cnt_first = 0
_enemy_cnt = nil
_reinforce_backward_grigo = false
_fin_grigo_defeat = 45
_rein_grigo_defeat = 25
_end_ep18_b_phase = false
_mission_retry = false
_sol_01_gen = nil
_sol_02_gen = nil
_sol_03_gen = nil
_sol_04_gen = nil
_sol_05_gen = nil
_guri_01_gen = nil
_guri_02_gen = nil
_guri_rein_01_gen = nil
_guri_rein_02_gen = nil
_guri_rein_03_gen = nil
_guri_rein_04_gen = nil
_guri_rein2_01_gen = nil
_guri_rein2_02_gen = nil
_guri_rein2_03_gen = nil
_guri_rein2_04_gen = nil
_guri_ep18c_01_gen = nil
_guri_ep18c_02_gen = nil
_guri_ep18c_03_gen = nil
_guri_ep18c_04_gen = nil
_guri_ep18c_05_gen = nil
_look_task = nil
_isRetry = false
_grigo_count = 63
_check_eneguri_count = 0
_begin_c_sdemo_01 = false
_finish_c_sdemo_01 = false
_begin_c_sdemo_02 = false
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "grigo_01",
      type = "mcgri",
      node = "locator2_grigo_01_start"
    },
    {
      name = "grigo_02",
      type = "mcgri",
      node = "locator2_grigo_02_start"
    },
    {
      name = "grigo_03",
      type = "mcgri",
      node = "locator2_grigo_03_start"
    },
    {
      name = "grigo_04",
      type = "mcgri",
      node = "locator2_grigo_04_start"
    },
    {
      name = "grigo_05",
      type = "mcgri",
      node = "locator2_grigo_05_start"
    },
    {
      name = "grigo_06",
      type = "mcgri",
      node = "locator2_grigo_06_start"
    },
    {
      name = "grigo_07",
      type = "mcgri",
      node = "locator2_grigo_07_start"
    },
    {
      name = "grigo_08",
      type = "mcgri",
      node = "locator2_grigo_08_start"
    },
    {
      name = "grigo_09",
      type = "mcgri",
      node = "locator2_grigo_09_start"
    }
  }
  Fn_setupNpc(L0_0)
end
enmgen2_sol_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "police",
      locator = "locator_01",
      name = "police_01",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_02",
      name = "police_02",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_03",
      name = "police_03",
      ai_spawn_option = "Police/ep18_police"
    }
  },
  onUpdate = function(A0_1)
    local L1_2
  end,
  onEnter = function(A0_3)
    local L1_4
  end,
  onLeave = function(A0_5)
    local L1_6
  end,
  onObjectDead = function(A0_7, A1_8)
  end,
  onObjectAsh = function(A0_9, A1_10)
    A0_9:getSpecTable().enemyDeadNum = A0_9:getSpecTable().enemyDeadNum + 1
    _alive_sol_cnt = _alive_sol_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_11)
    return #A0_11.spawnSet
  end,
  getEnemyDeadNum = function(A0_12)
    local L1_13
    L1_13 = A0_12.enemyDeadNum
    return L1_13
  end,
  getEnemyName = function(A0_14, A1_15)
    local L2_16
    L2_16 = A0_14.spawnSet
    L2_16 = L2_16[A1_15]
    L2_16 = L2_16.name
    return L2_16
  end
}
enmgen2_sol_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "police",
      locator = "locator_01",
      name = "police_11",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_02",
      name = "police_12",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_03",
      name = "police_13",
      ai_spawn_option = "Police/ep18_police"
    }
  },
  onUpdate = function(A0_17)
    local L1_18
  end,
  onEnter = function(A0_19)
    local L1_20
  end,
  onLeave = function(A0_21)
    local L1_22
  end,
  onObjectDead = function(A0_23, A1_24)
  end,
  onObjectAsh = function(A0_25, A1_26)
    A0_25:getSpecTable().enemyDeadNum = A0_25:getSpecTable().enemyDeadNum + 1
    _alive_sol_cnt = _alive_sol_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_27)
    return #A0_27.spawnSet
  end,
  getEnemyDeadNum = function(A0_28)
    local L1_29
    L1_29 = A0_28.enemyDeadNum
    return L1_29
  end,
  getEnemyName = function(A0_30, A1_31)
    local L2_32
    L2_32 = A0_30.spawnSet
    L2_32 = L2_32[A1_31]
    L2_32 = L2_32.name
    return L2_32
  end
}
enmgen2_sol_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "police",
      locator = "locator_01",
      name = "police_21",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_02",
      name = "police_22",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_03",
      name = "police_23",
      ai_spawn_option = "Police/ep18_police"
    }
  },
  onUpdate = function(A0_33)
    local L1_34
  end,
  onEnter = function(A0_35)
    local L1_36
  end,
  onLeave = function(A0_37)
    local L1_38
  end,
  onObjectDead = function(A0_39, A1_40)
  end,
  onObjectAsh = function(A0_41, A1_42)
    A0_41:getSpecTable().enemyDeadNum = A0_41:getSpecTable().enemyDeadNum + 1
    _alive_sol_cnt = _alive_sol_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_43)
    return #A0_43.spawnSet
  end,
  getEnemyDeadNum = function(A0_44)
    local L1_45
    L1_45 = A0_44.enemyDeadNum
    return L1_45
  end,
  getEnemyName = function(A0_46, A1_47)
    local L2_48
    L2_48 = A0_46.spawnSet
    L2_48 = L2_48[A1_47]
    L2_48 = L2_48.name
    return L2_48
  end
}
enmgen2_sol_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "police",
      locator = "locator_01",
      name = "police_31",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_02",
      name = "police_32",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_03",
      name = "police_33",
      ai_spawn_option = "Police/ep18_police"
    }
  },
  onUpdate = function(A0_49)
    local L1_50
  end,
  onEnter = function(A0_51)
    local L1_52
  end,
  onLeave = function(A0_53)
    local L1_54
  end,
  onObjectDead = function(A0_55, A1_56)
  end,
  onObjectAsh = function(A0_57, A1_58)
    A0_57:getSpecTable().enemyDeadNum = A0_57:getSpecTable().enemyDeadNum + 1
    _alive_sol_cnt = _alive_sol_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_59)
    return #A0_59.spawnSet
  end,
  getEnemyDeadNum = function(A0_60)
    local L1_61
    L1_61 = A0_60.enemyDeadNum
    return L1_61
  end,
  getEnemyName = function(A0_62, A1_63)
    local L2_64
    L2_64 = A0_62.spawnSet
    L2_64 = L2_64[A1_63]
    L2_64 = L2_64.name
    return L2_64
  end
}
enmgen2_sol_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "police",
      locator = "locator_01",
      name = "police_41",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_02",
      name = "police_42",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_03",
      name = "police_43",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_04",
      name = "police_44",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_05",
      name = "police_45",
      ai_spawn_option = "Police/ep18_police"
    },
    {
      type = "police",
      locator = "locator_06",
      name = "police_46",
      ai_spawn_option = "Police/ep18_police"
    }
  },
  onUpdate = function(A0_65)
    local L1_66
  end,
  onEnter = function(A0_67)
    local L1_68
  end,
  onLeave = function(A0_69)
    local L1_70
  end,
  onObjectDead = function(A0_71, A1_72)
  end,
  onObjectAsh = function(A0_73, A1_74)
    A0_73:getSpecTable().enemyDeadNum = A0_73:getSpecTable().enemyDeadNum + 1
    _alive_sol_cnt = _alive_sol_cnt - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_75)
    return #A0_75.spawnSet
  end,
  getEnemyDeadNum = function(A0_76)
    local L1_77
    L1_77 = A0_76.enemyDeadNum
    return L1_77
  end,
  getEnemyName = function(A0_78, A1_79)
    local L2_80
    L2_80 = A0_78.spawnSet
    L2_80 = L2_80[A1_79]
    L2_80 = L2_80.name
    return L2_80
  end
}
enmgen2_guri_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_01",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_02",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_03",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_04",
      name = "ene_grigo_04",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_05",
      name = "ene_grigo_05",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_06",
      name = "ene_grigo_06",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_07",
      name = "ene_grigo_07",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onUpdate = function(A0_81)
    local L1_82
  end,
  onEnter = function(A0_83)
    local L1_84
  end,
  onLeave = function(A0_85)
    local L1_86
  end,
  onObjectDead = function(A0_87, A1_88)
  end,
  onObjectAsh = function(A0_89, A1_90)
    A0_89:getSpecTable().enemyDeadNum = A0_89:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
    _defeat_enemy_cnt_first = _defeat_enemy_cnt_first + 1
  end,
  onSetupGem = function(A0_91, A1_92)
    Fn_enemyPopGemSetup(A0_91, {
      "ene_grigo_01",
      "ene_grigo_02",
      "ene_grigo_03",
      "ene_grigo_04",
      "ene_grigo_05",
      "ene_grigo_06",
      "ene_grigo_07"
    }, 3, 5)
  end,
  onPopGem = function(A0_93, A1_94)
    Fn_enemyAshPopGem(A0_93, A1_94)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_95)
    return #A0_95.spawnSet
  end,
  getEnemyDeadNum = function(A0_96)
    local L1_97
    L1_97 = A0_96.enemyDeadNum
    return L1_97
  end,
  getEnemyName = function(A0_98, A1_99)
    local L2_100
    L2_100 = A0_98.spawnSet
    L2_100 = L2_100[A1_99]
    L2_100 = L2_100.name
    return L2_100
  end
}
enmgen2_guri_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_11",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_12",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_13",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_04",
      name = "ene_grigo_14",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_05",
      name = "ene_grigo_15",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_06",
      name = "ene_grigo_16",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_07",
      name = "ene_grigo_17",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onUpdate = function(A0_101)
    local L1_102
  end,
  onEnter = function(A0_103)
    local L1_104
  end,
  onLeave = function(A0_105)
    local L1_106
  end,
  onObjectDead = function(A0_107, A1_108)
  end,
  onObjectAsh = function(A0_109, A1_110)
    A0_109:getSpecTable().enemyDeadNum = A0_109:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
    _defeat_enemy_cnt_first = _defeat_enemy_cnt_first + 1
  end,
  onSetupGem = function(A0_111, A1_112)
    Fn_enemyPopGemSetup(A0_111, {
      "ene_grigo_11",
      "ene_grigo_12",
      "ene_grigo_13",
      "ene_grigo_14",
      "ene_grigo_15",
      "ene_grigo_16",
      "ene_grigo_17"
    }, 5, 5)
  end,
  onPopGem = function(A0_113, A1_114)
    Fn_enemyAshPopGem(A0_113, A1_114)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_115)
    return #A0_115.spawnSet
  end,
  getEnemyDeadNum = function(A0_116)
    local L1_117
    L1_117 = A0_116.enemyDeadNum
    return L1_117
  end,
  getEnemyName = function(A0_118, A1_119)
    local L2_120
    L2_120 = A0_118.spawnSet
    L2_120 = L2_120[A1_119]
    L2_120 = L2_120.name
    return L2_120
  end
}
enmgen2_guri_rein_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein_01",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein_02",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein_03",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onUpdate = function(A0_121)
    local L1_122
  end,
  onEnter = function(A0_123)
    local L1_124
  end,
  onLeave = function(A0_125)
    local L1_126
  end,
  onObjectDead = function(A0_127, A1_128)
  end,
  onObjectAsh = function(A0_129, A1_130)
    A0_129:getSpecTable().enemyDeadNum = A0_129:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_131)
    return #A0_131.spawnSet
  end,
  getEnemyDeadNum = function(A0_132)
    local L1_133
    L1_133 = A0_132.enemyDeadNum
    return L1_133
  end,
  getEnemyName = function(A0_134, A1_135)
    local L2_136
    L2_136 = A0_134.spawnSet
    L2_136 = L2_136[A1_135]
    L2_136 = L2_136.name
    return L2_136
  end
}
enmgen2_guri_rein_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein_11",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein_12",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein_13",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onUpdate = function(A0_137)
    local L1_138
  end,
  onEnter = function(A0_139)
    local L1_140
  end,
  onLeave = function(A0_141)
    local L1_142
  end,
  onObjectDead = function(A0_143, A1_144)
  end,
  onObjectAsh = function(A0_145, A1_146)
    A0_145:getSpecTable().enemyDeadNum = A0_145:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  onSetupGem = function(A0_147, A1_148)
    Fn_enemyPopGemSetup(A0_147, {
      "ene_grigo_rein_11",
      "ene_grigo_rein_12",
      "ene_grigo_rein_13"
    }, 3, 5)
  end,
  onPopGem = function(A0_149, A1_150)
    Fn_enemyAshPopGem(A0_149, A1_150)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_151)
    return #A0_151.spawnSet
  end,
  getEnemyDeadNum = function(A0_152)
    local L1_153
    L1_153 = A0_152.enemyDeadNum
    return L1_153
  end,
  getEnemyName = function(A0_154, A1_155)
    local L2_156
    L2_156 = A0_154.spawnSet
    L2_156 = L2_156[A1_155]
    L2_156 = L2_156.name
    return L2_156
  end
}
enmgen2_guri_rein_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein_21",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein_22",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein_23",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
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
  end,
  onObjectAsh = function(A0_165, A1_166)
    A0_165:getSpecTable().enemyDeadNum = A0_165:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_167)
    return #A0_167.spawnSet
  end,
  getEnemyDeadNum = function(A0_168)
    local L1_169
    L1_169 = A0_168.enemyDeadNum
    return L1_169
  end,
  getEnemyName = function(A0_170, A1_171)
    local L2_172
    L2_172 = A0_170.spawnSet
    L2_172 = L2_172[A1_171]
    L2_172 = L2_172.name
    return L2_172
  end
}
enmgen2_guri_rein_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein_31",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein_32",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein_33",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onSetupGem = function(A0_173, A1_174)
    Fn_enemyPopGemSetup(A0_173, {
      "ene_grigo_rein_31",
      "ene_grigo_rein_32",
      "ene_grigo_rein_33"
    }, 3, 5)
  end,
  onPopGem = function(A0_175, A1_176)
    Fn_enemyAshPopGem(A0_175, A1_176)
  end,
  onUpdate = function(A0_177)
    local L1_178
  end,
  onEnter = function(A0_179)
    local L1_180
  end,
  onLeave = function(A0_181)
    local L1_182
  end,
  onObjectDead = function(A0_183, A1_184)
  end,
  onObjectAsh = function(A0_185, A1_186)
    A0_185:getSpecTable().enemyDeadNum = A0_185:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_187)
    return #A0_187.spawnSet
  end,
  getEnemyDeadNum = function(A0_188)
    local L1_189
    L1_189 = A0_188.enemyDeadNum
    return L1_189
  end,
  getEnemyName = function(A0_190, A1_191)
    local L2_192
    L2_192 = A0_190.spawnSet
    L2_192 = L2_192[A1_191]
    L2_192 = L2_192.name
    return L2_192
  end
}
enmgen2_guri_rein2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein2_01",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein2_02",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein2_03",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_04",
      name = "ene_grigo_rein2_04",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onUpdate = function(A0_193)
    local L1_194
  end,
  onEnter = function(A0_195)
    local L1_196
  end,
  onLeave = function(A0_197)
    local L1_198
  end,
  onObjectDead = function(A0_199, A1_200)
  end,
  onObjectAsh = function(A0_201, A1_202)
    A0_201:getSpecTable().enemyDeadNum = A0_201:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  onSetupGem = function(A0_203, A1_204)
    Fn_enemyPopGemSetup(A0_203, {
      "ene_grigo_rein2_01",
      "ene_grigo_rein2_02",
      "ene_grigo_rein2_03",
      "ene_grigo_rein2_04"
    }, 4, 5)
  end,
  onPopGem = function(A0_205, A1_206)
    Fn_enemyAshPopGem(A0_205, A1_206)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_207)
    return #A0_207.spawnSet
  end,
  getEnemyDeadNum = function(A0_208)
    local L1_209
    L1_209 = A0_208.enemyDeadNum
    return L1_209
  end,
  getEnemyName = function(A0_210, A1_211)
    local L2_212
    L2_212 = A0_210.spawnSet
    L2_212 = L2_212[A1_211]
    L2_212 = L2_212.name
    return L2_212
  end
}
enmgen2_guri_rein2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein2_11",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein2_12",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein2_13",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_04",
      name = "ene_grigo_rein2_14",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onUpdate = function(A0_213)
    local L1_214
  end,
  onEnter = function(A0_215)
    local L1_216
  end,
  onLeave = function(A0_217)
    local L1_218
  end,
  onObjectDead = function(A0_219, A1_220)
  end,
  onObjectAsh = function(A0_221, A1_222)
    A0_221:getSpecTable().enemyDeadNum = A0_221:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_223)
    return #A0_223.spawnSet
  end,
  getEnemyDeadNum = function(A0_224)
    local L1_225
    L1_225 = A0_224.enemyDeadNum
    return L1_225
  end,
  getEnemyName = function(A0_226, A1_227)
    local L2_228
    L2_228 = A0_226.spawnSet
    L2_228 = L2_228[A1_227]
    L2_228 = L2_228.name
    return L2_228
  end
}
enmgen2_guri_rein2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein2_21",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein2_22",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein2_23",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_04",
      name = "ene_grigo_rein2_24",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    }
  },
  onUpdate = function(A0_229)
    local L1_230
  end,
  onEnter = function(A0_231)
    local L1_232
  end,
  onLeave = function(A0_233)
    local L1_234
  end,
  onObjectDead = function(A0_235, A1_236)
  end,
  onObjectAsh = function(A0_237, A1_238)
    A0_237:getSpecTable().enemyDeadNum = A0_237:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_239)
    return #A0_239.spawnSet
  end,
  getEnemyDeadNum = function(A0_240)
    local L1_241
    L1_241 = A0_240.enemyDeadNum
    return L1_241
  end,
  getEnemyName = function(A0_242, A1_243)
    local L2_244
    L2_244 = A0_242.spawnSet
    L2_244 = L2_244[A1_243]
    L2_244 = L2_244.name
    return L2_244
  end
}
enmgen2_guri_rein2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_rein2_31",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_rein2_32",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_rein2_33",
      ai_spawn_option = "Grigo/ep18_b_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_04",
      name = "ene_grigo_rein2_34",
      ai_spawn_option = "Grigo/ep18_b_grigo"
    }
  },
  onSetupGem = function(A0_245, A1_246)
    Fn_enemyPopGemSetup(A0_245, {
      "ene_grigo_rein2_31",
      "ene_grigo_rein2_32",
      "ene_grigo_rein2_33",
      "ene_grigo_rein2_34"
    }, 4, 5)
  end,
  onPopGem = function(A0_247, A1_248)
    Fn_enemyAshPopGem(A0_247, A1_248)
  end,
  onUpdate = function(A0_249)
    local L1_250
  end,
  onEnter = function(A0_251)
    local L1_252
  end,
  onLeave = function(A0_253)
    local L1_254
  end,
  onObjectDead = function(A0_255, A1_256)
  end,
  onObjectAsh = function(A0_257, A1_258)
    A0_257:getSpecTable().enemyDeadNum = A0_257:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_259)
    return #A0_259.spawnSet
  end,
  getEnemyDeadNum = function(A0_260)
    local L1_261
    L1_261 = A0_260.enemyDeadNum
    return L1_261
  end,
  getEnemyName = function(A0_262, A1_263)
    local L2_264
    L2_264 = A0_262.spawnSet
    L2_264 = L2_264[A1_263]
    L2_264 = L2_264.name
    return L2_264
  end
}
enmgen2_ep18c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_ep18c_01",
      ai_spawn_option = "Grigo/ep18_c_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_ep18c_02",
      ai_spawn_option = "Grigo/ep18_c_grigo"
    }
  },
  onUpdate = function(A0_265)
    local L1_266
  end,
  onEnter = function(A0_267)
    local L1_268
  end,
  onLeave = function(A0_269)
    local L1_270
  end,
  onObjectDead = function(A0_271, A1_272)
  end,
  onObjectAsh = function(A0_273, A1_274)
    A0_273:getSpecTable().enemyDeadNum = A0_273:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_275)
    return #A0_275.spawnSet
  end,
  getEnemyDeadNum = function(A0_276)
    local L1_277
    L1_277 = A0_276.enemyDeadNum
    return L1_277
  end,
  getEnemyName = function(A0_278, A1_279)
    local L2_280
    L2_280 = A0_278.spawnSet
    L2_280 = L2_280[A1_279]
    L2_280 = L2_280.name
    return L2_280
  end
}
enmgen2_ep18c_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_ep18c_11",
      ai_spawn_option = "Grigo/ep18_c_grigo"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_ep18c_12",
      ai_spawn_option = "Grigo/ep18_c_grigo_suicide"
    }
  },
  onUpdate = function(A0_281)
    local L1_282
  end,
  onEnter = function(A0_283)
    local L1_284
  end,
  onLeave = function(A0_285)
    local L1_286
  end,
  onObjectDead = function(A0_287, A1_288)
  end,
  onObjectAsh = function(A0_289, A1_290)
    A0_289:getSpecTable().enemyDeadNum = A0_289:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_291)
    return #A0_291.spawnSet
  end,
  getEnemyDeadNum = function(A0_292)
    local L1_293
    L1_293 = A0_292.enemyDeadNum
    return L1_293
  end,
  getEnemyName = function(A0_294, A1_295)
    local L2_296
    L2_296 = A0_294.spawnSet
    L2_296 = L2_296[A1_295]
    L2_296 = L2_296.name
    return L2_296
  end
}
enmgen2_ep18c_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_ep18c_21",
      ai_spawn_option = "Grigo/ep18_c_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_ep18c_22",
      ai_spawn_option = "Grigo/ep18_c_grigo"
    }
  },
  onUpdate = function(A0_297)
    local L1_298
  end,
  onEnter = function(A0_299)
    local L1_300
  end,
  onLeave = function(A0_301)
    local L1_302
  end,
  onObjectDead = function(A0_303, A1_304)
  end,
  onObjectAsh = function(A0_305, A1_306)
    A0_305:getSpecTable().enemyDeadNum = A0_305:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_307)
    return #A0_307.spawnSet
  end,
  getEnemyDeadNum = function(A0_308)
    local L1_309
    L1_309 = A0_308.enemyDeadNum
    return L1_309
  end,
  getEnemyName = function(A0_310, A1_311)
    local L2_312
    L2_312 = A0_310.spawnSet
    L2_312 = L2_312[A1_311]
    L2_312 = L2_312.name
    return L2_312
  end
}
enmgen2_ep18c_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_ep18c_31",
      ai_spawn_option = "Grigo/ep18_c_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_ep18c_32",
      ai_spawn_option = "Grigo/ep18_c_grigo"
    }
  },
  onUpdate = function(A0_313)
    local L1_314
  end,
  onEnter = function(A0_315)
    local L1_316
  end,
  onLeave = function(A0_317)
    local L1_318
  end,
  onObjectDead = function(A0_319, A1_320)
  end,
  onObjectAsh = function(A0_321, A1_322)
    A0_321:getSpecTable().enemyDeadNum = A0_321:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_323)
    return #A0_323.spawnSet
  end,
  getEnemyDeadNum = function(A0_324)
    local L1_325
    L1_325 = A0_324.enemyDeadNum
    return L1_325
  end,
  getEnemyName = function(A0_326, A1_327)
    local L2_328
    L2_328 = A0_326.spawnSet
    L2_328 = L2_328[A1_327]
    L2_328 = L2_328.name
    return L2_328
  end
}
enmgen2_ep18c_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "ene_grigo_ep18c_41",
      ai_spawn_option = "Grigo/ep18_c_grigo_suicide"
    },
    {
      type = "grigo",
      locator = "locator_02",
      name = "ene_grigo_ep18c_42",
      ai_spawn_option = "Grigo/ep18_c_grigo"
    },
    {
      type = "grigo",
      locator = "locator_03",
      name = "ene_grigo_ep18c_43",
      ai_spawn_option = "Grigo/ep18_c_grigo"
    }
  },
  onObjectAsh = function(A0_329, A1_330)
    A0_329:getSpecTable().enemyDeadNum = A0_329:getSpecTable().enemyDeadNum + 1
    _defeat_enemy_cnt = _defeat_enemy_cnt + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_331)
    return #A0_331.spawnSet
  end,
  getEnemyDeadNum = function(A0_332)
    local L1_333
    L1_333 = A0_332.enemyDeadNum
    return L1_333
  end,
  getEnemyName = function(A0_334, A1_335)
    local L2_336
    L2_336 = A0_334.spawnSet
    L2_336 = L2_336[A1_335]
    L2_336 = L2_336.name
    return L2_336
  end
}
function Ingame()
  local L0_337, L1_338, L2_339, L3_340
  L0_337(L1_338)
  _sol_01_gen = L0_337
  _sol_02_gen = L0_337
  _sol_03_gen = L0_337
  _sol_04_gen = L0_337
  _sol_05_gen = L0_337
  _guri_01_gen = L0_337
  _guri_02_gen = L0_337
  _guri_rein_01_gen = L0_337
  _guri_rein_02_gen = L0_337
  _guri_rein_03_gen = L0_337
  _guri_rein_04_gen = L0_337
  _guri_rein2_01_gen = L0_337
  _guri_rein2_02_gen = L0_337
  _guri_rein2_03_gen = L0_337
  _guri_rein2_04_gen = L0_337
  _guri_ep18c_01_gen = L0_337
  _guri_ep18c_02_gen = L0_337
  _guri_ep18c_03_gen = L0_337
  _guri_ep18c_04_gen = L0_337
  _guri_ep18c_05_gen = L0_337
  while true do
    if L0_337 == "ep18_a" then
      L0_337()
    end
  end
  L0_337(L1_338)
  L0_337(L1_338, L2_339)
  L0_337(L1_338)
  L0_337(L1_338, L2_339)
  if L0_337 ~= "ep18_c" then
    L0_337(L1_338)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
    L0_337(L1_338, L2_339)
  end
  while true do
    if L0_337 == "ep18_a" then
      L0_337()
    end
  end
  if L0_337 > 0 then
    L3_340 = _check_eneguri_count
    L0_337(L1_338, L2_339, L3_340)
  end
  while true do
    if L0_337 ~= "ep18_c" then
      L0_337()
    end
  end
  L0_337()
  for L3_340, _FORV_4_ in L0_337(L1_338) do
    if Fn_findNpc(_FORV_4_.name) == nil then
    elseif Fn_findNpc(_FORV_4_.name):isNpc() then
    else
      print(_FORV_4_.name, ":changeNpc()")
      Fn_findNpc(_FORV_4_.name):changeNpc()
    end
  end
  while true do
    if L0_337 ~= "ep18_c" then
      L0_337()
    end
  end
  for L3_340, _FORV_4_ in L0_337(L1_338) do
    print(_FORV_4_.name, ":kill()")
    Fn_disappearMobToNpc(_FORV_4_.name)
  end
  _mob_to_npc_table = L0_337
  L0_337()
  while true do
    if L0_337 ~= "ep18_c" then
      L0_337()
    end
  end
  L0_337()
  while true do
    if L0_337 == "ep18_b" then
      L0_337()
    end
  end
  L0_337(L1_338)
  if L0_337 ~= nil then
    L0_337(L1_338)
    L0_337(L1_338)
  end
  _look_task = nil
  if L0_337 == 0 then
    L3_340 = _alive_sol_cnt
    L0_337(L1_338, L2_339, L3_340)
  end
  while true do
    if not L0_337 then
      L0_337()
    end
  end
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  for L3_340 = 1, 3 do
    if findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)) ~= nil then
      findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)):setInvincibility(true)
    end
  end
  for L3_340 = 11, 13 do
    if findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)) ~= nil then
      findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)):setInvincibility(true)
    end
  end
  for L3_340 = 21, 23 do
    if findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)) ~= nil then
      findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)):setInvincibility(true)
    end
  end
  for L3_340 = 31, 33 do
    if findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)) ~= nil then
      findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)):setInvincibility(true)
    end
  end
  while true do
    if not L0_337 then
      L0_337()
    end
  end
  L0_337(L1_338)
  L0_337(L1_338, L2_339)
  for L3_340 = 41, 46 do
    if findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)) ~= nil then
      findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_340)):setInvincibility(true)
    end
  end
  L0_337(L1_338)
  L0_337(L1_338, L2_339)
  L0_337(L1_338)
  L0_337(L1_338, L2_339)
  L3_340 = "locator2_grigo_goal01"
  L0_337(L1_338, L2_339, L3_340, 31, 32, "ep18_c")
  if L0_337 >= 3 then
    L0_337(L1_338)
    L0_337(L1_338, L2_339)
    L3_340 = "locator2_grigo_goal01"
    L0_337(L1_338, L2_339, L3_340, 21, 22, "ep18_c")
  end
  if L0_337 >= 6 then
    L0_337(L1_338)
    L0_337(L1_338, L2_339)
    L3_340 = "locator2_grigo_goal01"
    L0_337(L1_338, L2_339, L3_340, 11, 12, "ep18_c")
  end
  if L0_337 >= 10 then
    L0_337(L1_338)
    L0_337(L1_338, L2_339)
    L3_340 = "locator2_grigo_goal01"
    L0_337(L1_338, L2_339, L3_340, 1, 2, "ep18_c")
  end
  while true do
    if not L0_337 then
      L0_337()
    end
  end
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  L0_337(L1_338, L2_339)
  while true do
    if L0_337 == "ep18_c" then
      L0_337()
    end
  end
end
function setupStartNpc()
  invokeTask(function()
    local L0_341, L1_342, L2_343, L3_344
    for L3_344 = 1, 6 do
      npc = Fn_findNpc("grigo_" .. string.format("%02d", L3_344))
      print("grigo_" .. string.format("%02d", L3_344))
      while npc:isReadyNpc() == false do
        wait()
      end
    end
    _is_ready = true
  end)
end
function isReadyStartNpc()
  local L0_345, L1_346
  L0_345 = _is_ready
  return L0_345
end
function grigoMove()
  invokeTask(function()
    local L0_347, L1_348, L2_349, L3_350, L4_351, L5_352, L6_353, L7_354
    L0_347 = print
    L1_348 = "print begin grigoMove"
    L0_347(L1_348)
    L0_347 = {
      L1_348,
      L2_349,
      L3_350,
      L4_351,
      L5_352,
      L6_353,
      L7_354,
      "locator2_grigo_right08",
      "locator2_grigo_right09",
      "locator2_grigo_right10",
      "locator2_grigo_right11",
      "locator2_grigo_right12",
      "locator2_grigo_right13",
      "locator2_grigo_right14",
      "locator2_grigo_right15",
      "locator2_grigo_right16"
    }
    L1_348 = "locator2_grigo_right01"
    L2_349 = "locator2_grigo_right02"
    L3_350 = "locator2_grigo_right03"
    L4_351 = "locator2_grigo_right04"
    L5_352 = "locator2_grigo_right05"
    L6_353 = "locator2_grigo_right06"
    L7_354 = "locator2_grigo_right07"
    L1_348 = {
      L2_349,
      L3_350,
      L4_351,
      L5_352,
      L6_353,
      L7_354,
      "locator2_grigo_left07",
      "locator2_grigo_left08",
      "locator2_grigo_left09",
      "locator2_grigo_left10",
      "locator2_grigo_left11",
      "locator2_grigo_left12",
      "locator2_grigo_left13",
      "locator2_grigo_left14",
      "locator2_grigo_left15",
      "locator2_grigo_left16"
    }
    L2_349 = "locator2_grigo_left01"
    L3_350 = "locator2_grigo_left02"
    L4_351 = "locator2_grigo_left03"
    L5_352 = "locator2_grigo_left04"
    L6_353 = "locator2_grigo_left05"
    L7_354 = "locator2_grigo_left06"
    L2_349 = Fn_findNpc
    L3_350 = "grigo_01"
    L2_349 = L2_349(L3_350)
    L3_350 = Fn_findNpc
    L4_351 = "grigo_02"
    L3_350 = L3_350(L4_351)
    L4_351 = Fn_findNpc
    L5_352 = "grigo_03"
    L4_351 = L4_351(L5_352)
    L5_352 = Fn_findNpc
    L6_353 = "grigo_04"
    L5_352 = L5_352(L6_353)
    L6_353 = Fn_findNpc
    L7_354 = "grigo_05"
    L6_353 = L6_353(L7_354)
    L7_354 = Fn_findNpc
    L7_354 = L7_354("grigo_06")
    L2_349:changeMode("hacking")
    L3_350:changeMode("hacking")
    L4_351:changeMode("hacking")
    L5_352:changeMode("hacking")
    L6_353:changeMode("hacking")
    L7_354:changeMode("hacking")
    L2_349:changeDamageType(0)
    L3_350:changeDamageType(0)
    L4_351:changeDamageType(0)
    L5_352:changeDamageType(0)
    L6_353:changeDamageType(0)
    L7_354:changeDamageType(0)
    playSoundAlert(L2_349)
    playSoundAlert(L3_350)
    playSoundAlert(L4_351)
    playSoundAlert(L5_352)
    playSoundAlert(L6_353)
    playSoundAlert(L7_354)
    while L2_349:getBrain():isReadyEnemy() == false do
      wait()
    end
    L2_349:getBrain():cmd("LOD", true)
    while L3_350:getBrain():isReadyEnemy() == false do
      wait()
    end
    L3_350:getBrain():cmd("LOD", true)
    while L4_351:getBrain():isReadyEnemy() == false do
      wait()
    end
    L4_351:getBrain():cmd("LOD", true)
    while L5_352:getBrain():isReadyEnemy() == false do
      wait()
    end
    L5_352:getBrain():cmd("LOD", true)
    while L6_353:getBrain():isReadyEnemy() == false do
      wait()
    end
    L6_353:getBrain():cmd("LOD", true)
    while L7_354:getBrain():isReadyEnemy() == false do
      wait()
    end
    L7_354:getBrain():cmd("LOD", true)
    print("print finish grigoMove")
  end)
end
function grigoMove02()
  invokeTask(function()
    local L0_355, L1_356, L2_357, L3_358, L4_359
    L0_355 = print
    L1_356 = "print begin grigoMove02"
    L0_355(L1_356)
    repeat
      L0_355 = wait
      L0_355()
      L0_355 = _reinforce
    until L0_355
    L0_355 = Fn_findNpc
    L1_356 = "grigo_07"
    L0_355 = L0_355(L1_356)
    L1_356 = Fn_findNpc
    L2_357 = "grigo_08"
    L1_356 = L1_356(L2_357)
    L2_357 = Fn_findNpc
    L3_358 = "grigo_09"
    L2_357 = L2_357(L3_358)
    L4_359 = L0_355
    L3_358 = L0_355.changeMode
    L3_358(L4_359, "hacking")
    L4_359 = L1_356
    L3_358 = L1_356.changeMode
    L3_358(L4_359, "hacking")
    L4_359 = L2_357
    L3_358 = L2_357.changeMode
    L3_358(L4_359, "hacking")
    L4_359 = L0_355
    L3_358 = L0_355.changeDamageType
    L3_358(L4_359, 0)
    L4_359 = L1_356
    L3_358 = L1_356.changeDamageType
    L3_358(L4_359, 0)
    L4_359 = L2_357
    L3_358 = L2_357.changeDamageType
    L3_358(L4_359, 0)
    L3_358 = {
      L4_359,
      "locator2_grigo_right09",
      "locator2_grigo_right10",
      "locator2_grigo_right11",
      "locator2_grigo_right12",
      "locator2_grigo_right13",
      "locator2_grigo_right14",
      "locator2_grigo_right15",
      "locator2_grigo_right16"
    }
    L4_359 = "locator2_grigo_right08"
    L4_359 = {
      "locator2_grigo_left08",
      "locator2_grigo_left09",
      "locator2_grigo_left10",
      "locator2_grigo_left11",
      "locator2_grigo_left12",
      "locator2_grigo_left13",
      "locator2_grigo_left14",
      "locator2_grigo_left15",
      "locator2_grigo_left16"
    }
    playSoundAlert(L0_355)
    playSoundAlert(L1_356)
    playSoundAlert(L2_357)
    while L0_355:getBrain():isReadyEnemy() == false do
      wait()
    end
    L0_355:getBrain():cmd("LOD", true)
    while L1_356:getBrain():isReadyEnemy() == false do
      wait()
    end
    L1_356:getBrain():cmd("LOD", true)
    while L2_357:getBrain():isReadyEnemy() == false do
      wait()
    end
    L2_357:getBrain():cmd("LOD", true)
    print("print finish grigoMove02")
  end)
end
function playSoundAlert(A0_360)
  invokeTask(function()
    local L0_361, L1_362, L2_363, L3_364, L4_365, L5_366
    L0_361 = math
    L0_361 = L0_361.random
    L1_362 = 0
    L2_363 = 60
    L0_361 = L0_361(L1_362, L2_363)
    L1_362 = wait
    L2_363 = L0_361
    L1_362(L2_363)
    L1_362 = A0_360
    L2_363 = L1_362
    L1_362 = L1_362.getPuppet
    L1_362 = L1_362(L2_363)
    L2_363 = false
    L3_364, L4_365, L5_366 = nil, nil, nil
    if L1_362 ~= nil then
      repeat
        wait()
        if L2_363 == false and Fn_getDistanceToPlayer(L1_362) <= 50 then
          L3_364 = Sound:playSEHandle("ep18_grigo_alert", 1, "", L1_362)
          L4_365 = Sound:playSEHandle("w12_014", 1, "", L1_362)
          L5_366 = Sound:playSEHandle("ene_bot_move", 1, "", L1_362)
          L2_363 = true
        elseif L2_363 == true and Fn_getDistanceToPlayer(L1_362) > 50 then
          Sound:stopSEHandle(L3_364)
          Sound:stopSEHandle(L4_365)
          Sound:stopSEHandle(L5_366)
          L2_363 = false
        end
        wait(4)
      until _begin_b_sdemo_00
      Sound:stopSEHandle(L3_364)
      Sound:stopSEHandle(L4_365)
      Sound:stopSEHandle(L5_366)
      L3_364, L4_365, L5_366 = nil, nil, nil
    else
      print("GrigoAlert\229\134\141\231\148\159\239\188\154Puppet\227\129\140nil\227\129\174\227\129\159\227\130\129\229\134\141\231\148\159\227\129\151\227\129\170\227\129\132")
    end
  end)
end
function reinforce_grigo()
  local L0_367, L1_368
  _reinforce = true
end
function cubesensor2_changeEnemy_01_OnEnter(A0_369, A1_370)
  _grigo_goal = true
end
function cubesensor2_changeEnemy_02_OnEnter(A0_371, A1_372)
  _grigo_goal02 = true
end
function grigo_changeEnemy()
  invokeTask(function()
    print("print begin grigo_changeEnemy")
    while _grigo_goal == false and Fn_getMissionPart() == "ep18_a" do
      wait(2)
    end
    if Fn_getMissionPart() == "ep18_a" then
      Fn_findNpc("grigo_01"):changeEnemy({"police"})
      Fn_findNpc("grigo_02"):changeEnemy({"police"})
      Fn_findNpc("grigo_03"):changeEnemy({"police"})
      Fn_findNpc("grigo_04"):changeEnemy({"police"})
      Fn_findNpc("grigo_05"):changeEnemy({"police"})
      Fn_findNpc("grigo_06"):changeEnemy({"police"})
      Fn_findNpc("grigo_01"):enableHomingTarget(false)
      Fn_findNpc("grigo_02"):enableHomingTarget(false)
      Fn_findNpc("grigo_03"):enableHomingTarget(false)
      Fn_findNpc("grigo_04"):enableHomingTarget(false)
      Fn_findNpc("grigo_05"):enableHomingTarget(false)
      Fn_findNpc("grigo_06"):enableHomingTarget(false)
      Fn_findNpc("grigo_01"):setVisibleEnemyMarker(false)
      Fn_findNpc("grigo_02"):setVisibleEnemyMarker(false)
      Fn_findNpc("grigo_03"):setVisibleEnemyMarker(false)
      Fn_findNpc("grigo_04"):setVisibleEnemyMarker(false)
      Fn_findNpc("grigo_05"):setVisibleEnemyMarker(false)
      Fn_findNpc("grigo_06"):setVisibleEnemyMarker(false)
      _check_eneguri_count = _check_eneguri_count + 6
    end
    print("print finish grigo_changeEnemy")
  end)
end
function grigo_changeEnemy02()
  invokeTask(function()
    print("print begin grigo_changeEnemy02")
    while _grigo_goal02 == false and Fn_getMissionPart() == "ep18_a" do
      wait(2)
    end
    if Fn_getMissionPart() == "ep18_a" then
      Fn_findNpc("grigo_07"):changeEnemy({"police"})
      Fn_findNpc("grigo_08"):changeEnemy({"police"})
      Fn_findNpc("grigo_09"):changeEnemy({"police"})
      Fn_findNpc("grigo_07"):enableHomingTarget(false)
      Fn_findNpc("grigo_08"):enableHomingTarget(false)
      Fn_findNpc("grigo_09"):enableHomingTarget(false)
      Fn_findNpc("grigo_07"):setVisibleEnemyMarker(false)
      Fn_findNpc("grigo_08"):setVisibleEnemyMarker(false)
      Fn_findNpc("grigo_09"):setVisibleEnemyMarker(false)
      _check_eneguri_count = _check_eneguri_count + 3
    end
    print("print finish grigo_changeEnemy02")
  end)
end
function changeNpc_grigo1_2()
  Fn_findNpc("grigo_01"):changeNpc()
  Fn_findNpc("grigo_02"):changeNpc()
  Fn_findNpc("grigo_03"):changeNpc()
  Fn_findNpc("grigo_04"):changeNpc()
  Fn_findNpc("grigo_05"):changeNpc()
  Fn_findNpc("grigo_06"):changeNpc()
  Fn_findNpc("grigo_07"):changeNpc()
  Fn_findNpc("grigo_08"):changeNpc()
  Fn_findNpc("grigo_09"):changeNpc()
end
function disappear_grigo1_2()
  Fn_disappearNpc("grigo_01")
  Fn_disappearNpc("grigo_02")
  Fn_disappearNpc("grigo_03")
  Fn_disappearNpc("grigo_04")
  Fn_disappearNpc("grigo_05")
  Fn_disappearNpc("grigo_06")
  Fn_disappearNpc("grigo_07")
  Fn_disappearNpc("grigo_08")
  Fn_disappearNpc("grigo_09")
  print("grigo_01", ":kill()")
  print("grigo_02", ":kill()")
  print("grigo_03", ":kill()")
  print("grigo_04", ":kill()")
  print("grigo_05", ":kill()")
  print("grigo_06", ":kill()")
  print("grigo_07", ":kill()")
  print("grigo_08", ":kill()")
  print("grigo_09", ":kill()")
end
function grigo_ResetAndMove(A0_373)
  local L1_374, L2_375, L3_376, L4_377, L5_378, L6_379, L7_380, L8_381, L9_382
  L1_374 = true
  L2_375 = "mob_grigo_"
  L3_376 = string
  L3_376 = L3_376.format
  L4_377 = "%02d"
  L5_378 = A0_373
  L3_376 = L3_376(L4_377, L5_378)
  L2_375 = L2_375 .. L3_376
  L3_376 = print
  L4_377 = "grigo_ResetAndmove"
  L5_378 = L2_375
  L3_376(L4_377, L5_378)
  L3_376 = "locator2_"
  L4_377 = L2_375
  L3_376 = L3_376 .. L4_377
  L4_377 = math
  L4_377 = L4_377.random
  L5_378 = 15
  L6_379 = 30
  L4_377 = L4_377(L5_378, L6_379)
  L5_378 = findGameObject2
  L6_379 = "Node"
  L7_380 = "locator2_grigo_goal04"
  L5_378 = L5_378(L6_379, L7_380)
  L6_379 = {L7_380}
  L7_380 = "locator2_grigo_goal04"
  L7_380, L8_381 = nil, nil
  L9_382 = true
  invokeTask(function()
    local L0_383, L1_384
    L0_383 = {L1_384}
    L1_384 = {}
    L1_384.name = L2_375
    L1_384.type = "mcgri"
    L1_384.node = L3_376
    L1_384.start = true
    L1_384.attach = true
    L1_384.reset = true
    L1_384 = findGameObject2
    L1_384 = L1_384("Node", L3_376)
    while L1_374 do
      while Fn_getDistanceToPlayer(L1_384) <= 30 or Fn_getDistanceToPlayer(L1_384) >= 170 do
        if _begin_b_sdemo_01 then
          L1_374 = false
          break
        end
        wait(5)
      end
      if L9_382 == true then
        Fn_setupNpc(L0_383)
        L9_382 = false
      end
      L7_380 = Fn_findNpcPuppet(L2_375)
      while true do
        if _begin_b_sdemo_01 then
          L1_374 = false
          break
        else
        end
        if not (Fn_getDistanceToPlayer(L1_384) >= 30) or not (Fn_getDistanceToPlayer(L1_384) <= 150) then
          wait(5)
        end
      end
      L8_381 = Fn_findNpc(L2_375)
      if L8_381 == nil then
        L1_374 = false
        break
      end
      print("npcname", L2_375)
      L8_381:changeMode("hacking")
      L8_381:changeDamageType(0)
      while L8_381:getBrain():isReadyEnemy() == false do
        wait(2)
      end
      print(L8_381:getName(), "ReadyGo", L8_381:getBrain():isReadyEnemy())
      L8_381:getBrain():cmd("LOD", true)
      playSoundAlert(L8_381)
      while L1_374 do
        for _FORV_7_ = 1, 5 do
          if _begin_b_sdemo_01 then
            L1_374 = false
            break
          end
          wait()
        end
        if _FOR_ ~= false then
          if Fn_get_distance(L7_380:getWorldPos(), L5_378:getWorldPos()) <= L4_377 then
            print(L2_375 .. "\227\130\146\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150")
            L8_381:changeEnemy({"police"})
            L8_381:enableHomingTarget(false)
            L8_381:setVisibleEnemyMarker(false)
            _check_eneguri_count = _check_eneguri_count + 1
            repeat
              wait()
            until _begin_b_sdemo_01
            L1_374 = false
            break
          elseif Fn_getDistanceToPlayer(L7_380) >= 100 and not Fn_isInSightTarget(L7_380, 1) then
            if not Fn_isInSightTarget(findGameObject2("Node", L3_376), 1) and Fn_getDistanceToPlayer(L1_384) >= 35 and Fn_getDistanceToPlayer(L1_384) <= 80 then
              if 150 <= 0 + 1 then
                print(L2_375 .. "\227\130\146\229\136\157\230\156\159\229\140\150", Fn_getDistanceToPlayer(L7_380))
                Fn_setupNpc(L0_383)
                break
              end
            else
            end
          else
          end
        end
      end
      L7_380 = Fn_findNpcPuppet(L2_375)
      L8_381 = Fn_findNpc(L2_375)
    end
    Fn_disappearNpc(L2_375)
    print(L2_375, ":kill()")
    print("print grigo_ResetAndMove \231\181\130\228\186\134", L2_375)
  end)
end
function begin_main_a()
  local L0_385, L1_386, L2_387, L3_388
  _begin_main_a = true
  for L3_388 = 1, _grigo_count, 3 do
    grigo_ResetAndMove(L3_388)
  end
  for L3_388 = 1, 3 do
    findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_388)):setInvincibility(true)
  end
  for L3_388 = 11, 13 do
    findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_388)):setInvincibility(true)
  end
  for L3_388 = 21, 23 do
    findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_388)):setInvincibility(true)
  end
  for L3_388 = 31, 33 do
    findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_388)):setInvincibility(true)
  end
  for L3_388 = 11, 17 do
    findGameObject2("EnemyBrain", "ene_grigo_" .. string.format("%02d", L3_388)):setInvincibility(true)
  end
  L0_385()
  L0_385()
  L0_385()
  L0_385()
end
function setMobGrigoTable(A0_389)
  local L1_390
  _mob_to_npc_table = A0_389
end
function lookGrigos()
  local L0_391, L1_392, L2_393, L3_394, L4_395, L5_396, L6_397, L7_398
  L0_391 = 0
  for L4_395 = 7, 9 do
    L5_396 = "grigo_"
    L6_397 = string
    L6_397 = L6_397.format
    L7_398 = "%02d"
    L6_397 = L6_397(L7_398, L4_395)
    L5_396 = L5_396 .. L6_397
    L6_397 = Fn_findNpcPuppet
    L7_398 = L5_396
    L6_397 = L6_397(L7_398)
    L7_398 = checkInSightAndRayCast
    L7_398 = L7_398(L5_396, L6_397)
    if L7_398 == true then
      L0_391 = L0_391 + 1
    end
  end
  for L4_395, L5_396 in L1_392(L2_393) do
    L6_397 = L5_396.name
    L7_398 = Fn_findNpcPuppet
    L7_398 = L7_398(L6_397)
    if checkInSightAndRayCast(L6_397, L7_398) then
      L0_391 = L0_391 + 1
    end
  end
  if L0_391 >= 3 then
    return L1_392
  else
    return L1_392
  end
end
function checkInSightAndRayCast(A0_399, A1_400)
  local L2_401, L3_402, L4_403, L5_404
  L2_401 = nil
  L3_402 = Fn_getDistanceToPlayer
  L4_403 = A1_400
  L3_402 = L3_402(L4_403)
  L4_403 = Fn_getPlayerWorldPos
  L4_403 = L4_403()
  L5_404 = L4_403.y
  L5_404 = L5_404 + 1
  L4_403.y = L5_404
  L5_404 = Fn_getPlayerWorldRot
  L5_404 = L5_404()
  Query:setEyeSightTransform(L4_403, L5_404)
  Query:setEyeSightAngle(Deg2Rad(50))
  Query:setEyeSightRange(15)
  if not Query:raycastEyeSight(A1_400:getWorldPos()) then
    L2_401 = true
  else
    L2_401 = false
  end
  if L3_402 <= 100 and Fn_isInSightTarget(A1_400, 1) and L2_401 then
    return true
  else
    return false
  end
end
function begin_b_sdemo_00()
  _begin_b_sdemo_00 = true
  _sol_01_gen:requestAllEnemyKill()
  _sol_02_gen:requestAllEnemyKill()
  _sol_03_gen:requestAllEnemyKill()
  _guri_02_gen:requestAllEnemyKill()
end
function begin_b_sdemo_01()
  _begin_b_sdemo_01 = true
  Fn_resetCoercionPose()
  _check_eneguri_count = GameDatabase:get(ggd.Savedata__EventFlags__ep18__flag01)
  _sol_01_gen:requestSpawn()
  _sol_01_gen:setEnemyMarker(false)
  _sol_02_gen:requestSpawn()
  _sol_02_gen:setEnemyMarker(false)
  _sol_03_gen:requestSpawn()
  _sol_03_gen:setEnemyMarker(false)
  _sol_04_gen:requestSpawn()
  _sol_04_gen:setEnemyMarker(false)
  _guri_01_gen:requestSpawn()
  _guri_01_gen:setEnemyMarker(false)
  _guri_02_gen:requestSpawn()
  _guri_02_gen:setEnemyMarker(false)
end
function begin_main_b()
  _begin_main_b = true
  _guri_rein_01_gen:requestIdlingEnemy(false)
  _guri_rein_02_gen:requestIdlingEnemy(false)
  _guri_rein_01_gen:requestSpawn()
  _guri_rein_02_gen:requestSpawn()
  _guri_rein_01_gen:setEnemyMarker(true)
  _guri_rein_02_gen:setEnemyMarker(true)
  _guri_01_gen:setEnemyMarker(true)
  _guri_02_gen:setEnemyMarker(true)
  moveEnemyGrigo("ene_grigo_rein_", _guri_rein_01_gen, "locator2_grigo_goal01", 1, 3, "ep18_b")
  moveEnemyGrigo("ene_grigo_rein_", _guri_rein_02_gen, "locator2_grigo_goal04", 11, 13, "ep18_b")
  _guri_rein_03_gen:requestIdlingEnemy(false)
  _guri_rein_04_gen:requestIdlingEnemy(false)
end
function count_sol()
  local L0_405, L1_406, L2_407, L3_408, L4_409, L5_410, L6_411, L7_412
  L0_405 = print
  L1_406 = "print begin count_sol"
  L0_405(L1_406)
  L0_405 = HUD
  L1_406 = L0_405
  L0_405 = L0_405.counter99_99SetTextID
  L2_407 = "ep18_09003"
  L0_405(L1_406, L2_407)
  L0_405 = HUD
  L1_406 = L0_405
  L0_405 = L0_405.counter99_99SetIcon
  L2_407 = HUD
  L2_407 = L2_407.kCount99_99IconType_None
  L0_405(L1_406, L2_407)
  L0_405 = HUD
  L1_406 = L0_405
  L0_405 = L0_405.counter99_99SetMax
  L2_407 = 12
  L0_405(L1_406, L2_407)
  L0_405 = HUD
  L1_406 = L0_405
  L0_405 = L0_405.counter99_99SetNum
  L2_407 = _alive_sol_cnt
  L0_405(L1_406, L2_407)
  L0_405 = HUD
  L1_406 = L0_405
  L0_405 = L0_405.counter99_99SetVisible
  L2_407 = true
  L0_405(L1_406, L2_407)
  L0_405 = false
  L1_406 = false
  L2_407 = false
  L3_408 = false
  L4_409 = false
  L5_410 = false
  L6_411 = false
  L7_412 = 0
  _enemy_cnt = invokeTask(function()
    while true do
      HUD:counter99_99SetNum(_alive_sol_cnt)
      if _alive_sol_cnt == 0 then
        _mission_retry = true
        _isRetry = true
        break
      elseif _alive_sol_cnt <= 4 and L0_405 == false then
        Sound:playSE("pc1_074")
        Fn_captionView("ep18_09000", 5)
        Fn_setBgmPoint("battle", "bgmPoint_")
        L0_405 = true
        L7_412 = 0
      elseif _alive_sol_cnt <= 8 and L1_406 == false then
        Fn_captionView("ep18_09001", 5)
        L1_406 = true
        L7_412 = 0
      elseif _reinforce_backward_grigo and L2_407 == false then
        Sound:playSE("pc1_527")
        Fn_captionView("ep18_09002", 5)
        look_at_target_input("locator2_lookpoint01")
        L2_407 = true
        L7_412 = 0
      elseif L7_412 > 180 and L3_408 == false then
        Sound:playSE("m32_019")
        Fn_captionView("ep18_01100", 5)
        L3_408 = true
        L7_412 = 0
      elseif L7_412 > 320 and L4_409 == false and L3_408 then
        Fn_captionView("ep18_01101", 5)
        L4_409 = true
        L7_412 = 0
      elseif L7_412 > 260 and L5_410 == false and L4_409 then
        Fn_captionView("ep18_01102", 5)
        L5_410 = true
        L7_412 = 0
      elseif L7_412 > 180 and L6_411 == false and L5_410 then
        Fn_captionView("ep18_01103", 5)
        L6_411 = true
        L7_412 = 0
      end
      L7_412 = L7_412 + 1
      wait()
    end
    waitSeconds(3)
    HUD:counter99_99SetVisible(false)
  end)
  print("print finish count_sol")
end
function checkDefeatEnemies()
  invokeTask(function()
    print("print begin checkDefeatEnemies")
    while _defeat_enemy_cnt < _fin_grigo_defeat do
      if _defeat_enemy_cnt >= _rein_grigo_defeat and Fn_getDistanceToPlayer("locator2_lookpoint01") >= 10 and Fn_isInSightTarget("locator2_lookpoint01", 1) == false and false == false then
        _reinforce_backward_grigo = true
        _guri_rein_03_gen:requestSpawn()
        _guri_rein_04_gen:requestSpawn()
        moveEnemyGrigo("ene_grigo_rein_", _guri_rein_03_gen, "locator2_grigo_goal05", 21, 23, "ep18_b")
        moveEnemyGrigo("ene_grigo_rein_", _guri_rein_04_gen, "locator2_grigo_goal05", 31, 33, "ep18_b")
      end
      wait()
    end
    _enemy_cnt:abort()
    print("print finish checkDefeatEnemies")
    _end_ep18_b_phase = true
  end)
end
function checkEndPhase()
  local L0_413, L1_414
  L0_413 = _end_ep18_b_phase
  return L0_413
end
function checkDefeatEnemyCnt()
  local L0_415, L1_416
  L0_415 = _defeat_enemy_cnt
  return L0_415
end
function resetDefeatEnemyAndAliveSolCnt()
  local L0_417, L1_418
  _defeat_enemy_cnt = 0
  _alive_sol_cnt = 12
  _mission_retry = false
end
function checkMissionRetry()
  local L0_419, L1_420
  L0_419 = _mission_retry
  return L0_419
end
function enemyReset()
  if _isRetry then
    _sol_01_gen:reset()
    _sol_01_gen:requestSpawn()
    _sol_02_gen:reset()
    _sol_02_gen:requestSpawn()
    _sol_03_gen:reset()
    _sol_03_gen:requestSpawn()
    _sol_04_gen:reset()
    _sol_04_gen:requestSpawn()
    _guri_01_gen:reset()
    _guri_01_gen:requestSpawn()
    _guri_02_gen:reset()
    _guri_02_gen:requestSpawn()
  end
end
function stopAutoRebirth()
  _sol_01_gen:setAutoRevirthSwitch(false)
  _sol_02_gen:setAutoRevirthSwitch(false)
  _sol_03_gen:setAutoRevirthSwitch(false)
  _sol_04_gen:setAutoRevirthSwitch(false)
  _guri_01_gen:setAutoRevirthSwitch(false)
  _guri_02_gen:setAutoRevirthSwitch(false)
end
function look_at_target_input(A0_421, A1_422)
  _look_task = Fn_lookAtObject(A0_421, A1_422)
  print("look start")
  while true do
    if Fn_isInSightTarget(A0_421) == true then
      break
    end
    if not (_defeat_enemy_cnt >= _fin_grigo_defeat) then
      if is_camera_input() == true then
        if not (0 + 1 > 10) then
          else
          end
          wait()
        end
    end
  end
  print("end look")
  if _look_task ~= nil and _look_task:isRunning() == true then
    _look_task:abort()
    print("look abort")
  end
  _look_task = nil
  return true
end
function is_camera_input(A0_423, A1_424)
  local L2_425
  L2_425 = false
  if Pad:getStick(Pad.kStick_Camera) > 0 or Pad:getStick(Pad.kStick_Camera) > 0 then
    L2_425 = true
  end
  return L2_425
end
function begingrigoRein2()
  local L0_426
  L0_426 = 0
  while Fn_getMissionPart() == "ep18_b" do
    if _defeat_enemy_cnt_first >= 2 and L0_426 == 0 then
      _guri_rein2_01_gen:requestSpawn()
      moveEnemyGrigo("ene_grigo_rein2_", _guri_rein2_01_gen, "locator2_grigo_goal01", 1, 4, "ep18_b")
      L0_426 = 1
    elseif _defeat_enemy_cnt_first >= 4 and L0_426 == 1 then
      _guri_rein2_02_gen:requestSpawn()
      moveEnemyGrigo("ene_grigo_rein2_", _guri_rein2_02_gen, "locator2_grigo_goal04", 11, 14, "ep18_b")
      L0_426 = 2
    elseif _defeat_enemy_cnt_first >= 6 and L0_426 == 2 then
      _guri_rein2_03_gen:requestSpawn()
      moveEnemyGrigo("ene_grigo_rein2_", _guri_rein2_03_gen, "locator2_grigo_goal01", 21, 24, "ep18_b")
      L0_426 = 3
    elseif _defeat_enemy_cnt_first >= 8 and L0_426 == 3 then
      _guri_rein2_04_gen:requestSpawn()
      moveEnemyGrigo("ene_grigo_rein2_", _guri_rein2_04_gen, "locator2_grigo_goal04", 31, 34, "ep18_b")
      L0_426 = 4
      break
    end
    wait()
  end
end
function begin_c_sdemo_01()
  local L0_427, L1_428
  _begin_c_sdemo_01 = true
end
function finish_c_sdemo_01()
  local L0_429, L1_430
  _finish_c_sdemo_01 = true
end
function begin_c_sdemo_02()
  local L0_431, L1_432
  _begin_c_sdemo_02 = true
end
function getgrigoPuppet(A0_433)
  return (findGameObject2("Puppet", A0_433))
end
function moveEnemyGrigo(A0_434, A1_435, A2_436, A3_437, A4_438, A5_439)
  local L6_440, L7_441, L8_442, L9_443, L10_444, L11_445, L12_446, L13_447, L14_448, L15_449, L16_450, L17_451, L18_452, L19_453, L20_454
  for L9_443 = A3_437, A4_438 do
    L10_444 = {L11_445}
    L11_445 = A2_436
    L11_445 = {}
    L11_445.invincible = false
    L11_445.loop = false
    L11_445.search = true
    L12_446 = nil
    L13_447 = 0
    L14_448 = false
    L15_449 = A0_434
    L16_450 = string
    L16_450 = L16_450.format
    L16_450 = L16_450(L17_451, L18_452)
    L15_449 = L15_449 .. L16_450
    L16_450 = {}
    for L20_454 = A3_437, A4_438 do
      L16_450[L20_454] = "locator2_" .. A0_434 .. string.format("%02d", L20_454)
    end
    L20_454 = L15_449
    L18_452(L19_453, L20_454)
    function L20_454()
      while Fn_getMissionPart() == A5_439 do
        if A5_439 == "ep18_c" and _begin_c_sdemo_02 == true then
          A1_435:requestAllEnemyKill(false)
          break
        end
        if L13_447 == 0 then
          L12_446 = findGameObject2("EnemyBrain", L15_449)
          L13_447 = L13_447 + 1
        elseif L13_447 == 1 and L12_446:isReadyEnemy() == true then
          L13_447 = L13_447 + 1
        elseif L13_447 == 2 and L12_446:isReadyEnemy() == true then
          L14_448 = false
          A1_435:setEventListener("TargetEnemyReport", L18_452)
          L12_446:move(L10_444, L11_445)
          L13_447 = L13_447 + 1
        elseif L13_447 == 3 and L12_446:isMoveEnd() then
          L12_446:endScriptAction()
          L13_447 = L13_447 + 1
        elseif L13_447 == 4 and A1_435:getEnemyCount() == 0 then
          for _FORV_3_, _FORV_4_ in pairs(L16_450) do
            if Fn_isInSightTarget(L16_450[_FORV_3_], 1) == true then
              L17_451 = L17_451 + 1
            elseif Fn_getDistanceToPlayer(L16_450[_FORV_3_]) <= 35 then
              L17_451 = L17_451 + 1
            end
          end
          if L17_451 == 0 then
            A1_435:requestSpawn()
            L13_447 = L13_447 + 1
          end
          L17_451 = 0
        elseif L13_447 == 5 and A1_435:getEnemyCount() == A4_438 - A3_437 + 1 then
          L13_447 = 0
        end
        wait()
      end
    end
    L19_453(L20_454)
    break
  end
end
function cubesensor2_01_OnEnter(A0_455, A1_456)
  local L2_457
  L2_457 = print
  L2_457("OnEnter")
  L2_457 = nil
  if (_begin_b_sdemo_01 or Fn_getMissionPart() == "ep18_c") and A1_456 then
    if string.match(A1_456:getName(), "grigo") ~= nil then
      L2_457 = A1_456:getName()
      print("OnEnterEnemy: " .. L2_457)
    elseif string.match(A1_456:getName(), "police") ~= nil then
      L2_457 = A1_456:getName()
      print("OnEnterEnemy: " .. L2_457)
    end
  end
end
function Finalize()
  Mob:restrict_ep18_00(false)
end
