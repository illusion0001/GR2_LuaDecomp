dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/sm19_common.lua")
_enmgen_name = nil
_is_enemy_spawn_settled = false
_is_enemy_spawn_request = false
_lo_a_01_enemy_num = 0
_lo_a_05_enemy_num = 0
_lo_a_02_enemy_num = 0
_luna_enemy_num = 0
_sky_enemy_num = 0
_brain_request = false
_gc_brain = nil
_request_gc_motion = false
_end_script_action = false
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_01_enemy_01",
      name = "enemy01"
    },
    {
      type = "gellyfish",
      locator = "locator_01_enemy_03",
      name = "enemy03"
    },
    {
      type = "gellyfish",
      locator = "locator_01_enemy_04",
      name = "enemy04"
    },
    {
      type = "treecannon",
      locator = "locator_01_enemy_05",
      name = "enemy05"
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
  onSpawn = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum - 1
    if A0_8:getSpecTable().enemyDeadNum < 0 then
      A0_8:getSpecTable().enemyDeadNum = 0
    end
    _lo_a_01_enemy_num = _lo_a_01_enemy_num + 1
  end,
  onObjectDead = function(A0_10, A1_11)
  end,
  onObjectAsh = function(A0_12, A1_13)
    A0_12:getSpecTable().enemyDeadNum = A0_12:getSpecTable().enemyDeadNum + 1
    _lo_a_01_enemy_num = _lo_a_01_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_14)
    return #A0_14.spawnSet
  end,
  getEnemyDeadNum = function(A0_15)
    local L1_16
    L1_16 = A0_15.enemyDeadNum
    return L1_16
  end,
  isEnemyAllDead = function(A0_17)
    local L2_18
    L2_18 = A0_17.enemyDeadNum
    L2_18 = L2_18 >= #A0_17.spawnSet
    return L2_18
  end
}
enmgen2_center_only_a = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_enemy_c_only_a_02",
      name = "enemy_c_only_a_02"
    },
    {
      type = "imp",
      locator = "locator_enemy_c_only_a_04",
      name = "enemy_c_only_a_04"
    }
  },
  onPopGem = function(A0_19, A1_20)
    Fn_enemyAshPopGem(A0_19, A1_20, {"A", "B"})
  end,
  onUpdate = function(A0_21)
    local L1_22
  end,
  onEnter = function(A0_23)
    local L1_24
  end,
  onLeave = function(A0_25)
    local L1_26
  end,
  onObjectDead = function(A0_27, A1_28)
  end,
  onSpawn = function(A0_29, A1_30)
    A0_29:getSpecTable().enemyDeadNum = A0_29:getSpecTable().enemyDeadNum - 1
    if A0_29:getSpecTable().enemyDeadNum < 0 then
      A0_29:getSpecTable().enemyDeadNum = 0
    end
    _lo_a_05_enemy_num = _lo_a_05_enemy_num + 1
  end,
  onObjectDead = function(A0_31, A1_32)
  end,
  onObjectAsh = function(A0_33, A1_34)
    A0_33:getSpecTable().enemyDeadNum = A0_33:getSpecTable().enemyDeadNum + 1
    _lo_a_05_enemy_num = _lo_a_05_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_35)
    return #A0_35.spawnSet
  end,
  getEnemyDeadNum = function(A0_36)
    local L1_37
    L1_37 = A0_36.enemyDeadNum
    return L1_37
  end,
  isEnemyAllDead = function(A0_38)
    local L2_39
    L2_39 = A0_38.enemyDeadNum
    L2_39 = L2_39 >= #A0_38.spawnSet
    return L2_39
  end
}
enmgen2_sdemo_play_a = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator2_sdemo_play_01",
      name = "sdemo_play_01"
    },
    {
      type = "gellyfish",
      locator = "locator2_sdemo_play_02",
      name = "sdemo_play_02"
    },
    {
      type = "imp",
      locator = "locator2_sdemo_play_03",
      name = "sdemo_play_03"
    }
  },
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onObjectDead = function(A0_46, A1_47)
  end,
  onSpawn = function(A0_48, A1_49)
    A0_48:getSpecTable().enemyDeadNum = A0_48:getSpecTable().enemyDeadNum - 1
    if A0_48:getSpecTable().enemyDeadNum < 0 then
      A0_48:getSpecTable().enemyDeadNum = 0
    end
    _lo_a_05_enemy_num = _lo_a_05_enemy_num + 1
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onObjectAsh = function(A0_52, A1_53)
    A0_52:getSpecTable().enemyDeadNum = A0_52:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_54)
    return #A0_54.spawnSet
  end,
  getEnemyDeadNum = function(A0_55)
    local L1_56
    L1_56 = A0_55.enemyDeadNum
    return L1_56
  end,
  isEnemyAllDead = function(A0_57)
    local L2_58
    L2_58 = A0_57.enemyDeadNum
    L2_58 = L2_58 >= #A0_57.spawnSet
    return L2_58
  end
}
enmgen2_sdemo_only_a = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 15,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator_enemy_sdemo_a_01",
      name = "enemy_sdemo_a_01"
    },
    {
      type = "gellyfish",
      locator = "locator_enemy_sdemo_a_02",
      name = "enemy_sdemo_a_02"
    },
    {
      type = "gellyfish",
      locator = "locator_enemy_sdemo_a_03",
      name = "enemy_sdemo_a_03"
    },
    {
      type = "imp",
      locator = "locator_enemy_sdemo_a_04",
      name = "enemy_sdemo_a_04"
    },
    {
      type = "imp",
      locator = "locator_enemy_sdemo_a_05",
      name = "enemy_sdemo_a_05"
    }
  },
  onPopGem = function(A0_59, A1_60)
    Fn_enemyAshPopGem(A0_59, A1_60, {"A", "B"})
  end,
  onUpdate = function(A0_61)
    local L1_62
  end,
  onEnter = function(A0_63)
    local L1_64
  end,
  onLeave = function(A0_65)
    local L1_66
  end,
  onObjectDead = function(A0_67, A1_68)
  end,
  onSpawn = function(A0_69, A1_70)
    A0_69:getSpecTable().enemyDeadNum = A0_69:getSpecTable().enemyDeadNum - 1
    if A0_69:getSpecTable().enemyDeadNum < 0 then
      A0_69:getSpecTable().enemyDeadNum = 0
    end
    _lo_a_05_enemy_num = _lo_a_05_enemy_num + 1
  end,
  onObjectDead = function(A0_71, A1_72)
  end,
  onObjectAsh = function(A0_73, A1_74)
    A0_73:getSpecTable().enemyDeadNum = A0_73:getSpecTable().enemyDeadNum + 1
    _lo_a_05_enemy_num = _lo_a_05_enemy_num - 1
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
  isEnemyAllDead = function(A0_78)
    local L2_79
    L2_79 = A0_78.enemyDeadNum
    L2_79 = L2_79 >= #A0_78.spawnSet
    return L2_79
  end
}
enmgen2_center_only_b = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_enemy_c_only_b_01",
      name = "enemy_c_only_b_01"
    },
    {
      type = "treecannon",
      locator = "locator_enemy_c_only_b_02",
      name = "enemy_c_only_b_02"
    },
    {
      type = "imp",
      locator = "locator_enemy_c_only_b_03",
      name = "enemy_c_only_b_03"
    },
    {
      type = "imp",
      locator = "locator_enemy_c_only_b_04",
      name = "enemy_c_only_b_04"
    }
  },
  onPopGem = function(A0_80, A1_81)
    Fn_enemyAshPopGem(A0_80, A1_81, {"A", "B"})
  end,
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
  onSpawn = function(A0_90, A1_91)
    A0_90:getSpecTable().enemyDeadNum = A0_90:getSpecTable().enemyDeadNum - 1
    if A0_90:getSpecTable().enemyDeadNum < 0 then
      A0_90:getSpecTable().enemyDeadNum = 0
    end
    _lo_a_05_enemy_num = _lo_a_05_enemy_num + 1
  end,
  onObjectDead = function(A0_92, A1_93)
  end,
  onObjectAsh = function(A0_94, A1_95)
    A0_94:getSpecTable().enemyDeadNum = A0_94:getSpecTable().enemyDeadNum + 1
    _lo_a_05_enemy_num = _lo_a_05_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_96)
    return #A0_96.spawnSet
  end,
  getEnemyDeadNum = function(A0_97)
    local L1_98
    L1_98 = A0_97.enemyDeadNum
    return L1_98
  end,
  isEnemyAllDead = function(A0_99)
    local L2_100
    L2_100 = A0_99.enemyDeadNum
    L2_100 = L2_100 >= #A0_99.spawnSet
    return L2_100
  end
}
enmgen2_sky = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator_01_enemy_sky_01",
      name = "enemy_s_01"
    },
    {
      type = "jammer",
      locator = "locator_01_enemy_sky_02",
      name = "enemy_s_02"
    },
    {
      type = "imp",
      locator = "locator_01_enemy_sky_03",
      name = "enemy_s_03"
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
  onSpawn = function(A0_109, A1_110)
    A0_109:getSpecTable().enemyDeadNum = A0_109:getSpecTable().enemyDeadNum - 1
    if A0_109:getSpecTable().enemyDeadNum < 0 then
      A0_109:getSpecTable().enemyDeadNum = 0
    end
    _sky_enemy_num = _sky_enemy_num + 1
  end,
  onObjectDead = function(A0_111, A1_112)
  end,
  onObjectAsh = function(A0_113, A1_114)
    A0_113:getSpecTable().enemyDeadNum = A0_113:getSpecTable().enemyDeadNum + 1
    _sky_enemy_num = _sky_enemy_num - 1
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
  isEnemyAllDead = function(A0_118)
    local L2_119
    L2_119 = A0_118.enemyDeadNum
    L2_119 = L2_119 >= #A0_118.spawnSet
    return L2_119
  end
}
enmgen2_sky02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "jammer",
      locator = "locator_01_enemy_sky2_01",
      name = "enemy_s2_01"
    },
    {
      type = "imp",
      locator = "locator_01_enemy_sky2_02",
      name = "enemy_s2_02"
    },
    {
      type = "jammer",
      locator = "locator_01_enemy_sky2_03",
      name = "enemy_s2_03"
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
  onObjectDead = function(A0_126, A1_127)
  end,
  onSpawn = function(A0_128, A1_129)
    A0_128:getSpecTable().enemyDeadNum = A0_128:getSpecTable().enemyDeadNum - 1
    if A0_128:getSpecTable().enemyDeadNum < 0 then
      A0_128:getSpecTable().enemyDeadNum = 0
    end
    _sky_enemy_num = _sky_enemy_num + 1
  end,
  onObjectDead = function(A0_130, A1_131)
  end,
  onObjectAsh = function(A0_132, A1_133)
    A0_132:getSpecTable().enemyDeadNum = A0_132:getSpecTable().enemyDeadNum + 1
    _sky_enemy_num = _sky_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_134)
    return #A0_134.spawnSet
  end,
  getEnemyDeadNum = function(A0_135)
    local L1_136
    L1_136 = A0_135.enemyDeadNum
    return L1_136
  end,
  isEnemyAllDead = function(A0_137)
    local L2_138
    L2_138 = A0_137.enemyDeadNum
    L2_138 = L2_138 >= #A0_137.spawnSet
    return L2_138
  end
}
enmgen2_luna_only_b = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_enemy_l_only_b_01",
      name = "enemy_l_only_b_01",
      ai_spawn_option = "LunaFishOwner/owner_test"
    },
    {
      type = "jammer",
      locator = "locator_enemy_l_only_b_02",
      name = "enemy_l_only_b_02"
    },
    {
      type = "gellyfish",
      locator = "locator_enemy_l_only_b_03",
      name = "enemy_l_only_b_03"
    },
    {
      type = "gellyfish",
      locator = "locator_enemy_l_only_b_04",
      name = "enemy_l_only_b_04"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_04_enemy_01",
      name = "childship_04"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_04_enemy_01",
      name = "lunafish_04"
    }
  },
  onPopGem = function(A0_139, A1_140)
    Fn_enemyAshPopGem(A0_139, A1_140, {"A", "B"})
  end,
  onUpdate = function(A0_141)
    local L1_142
  end,
  onEnter = function(A0_143)
    local L1_144
  end,
  onLeave = function(A0_145)
    local L1_146
  end,
  onObjectDead = function(A0_147, A1_148)
  end,
  onSpawn = function(A0_149, A1_150)
    A0_149:getSpecTable().enemyDeadNum = A0_149:getSpecTable().enemyDeadNum - 1
    if A0_149:getSpecTable().enemyDeadNum < 0 then
      A0_149:getSpecTable().enemyDeadNum = 0
    end
    _luna_enemy_num = _luna_enemy_num + 1
  end,
  onObjectDead = function(A0_151, A1_152)
  end,
  onObjectAsh = function(A0_153, A1_154)
    A0_153:getSpecTable().enemyDeadNum = A0_153:getSpecTable().enemyDeadNum + 1
    _luna_enemy_num = _luna_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_155)
    return #A0_155.spawnSet
  end,
  getEnemyDeadNum = function(A0_156)
    local L1_157
    L1_157 = A0_156.enemyDeadNum
    return L1_157
  end,
  isEnemyAllDead = function(A0_158)
    local L2_159
    L2_159 = A0_158.enemyDeadNum
    L2_159 = L2_159 >= #A0_158.spawnSet
    return L2_159
  end
}
enmgen2_luna_only_b_rich = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_enemy_l_only_b_rich_01",
      name = "enemy_l_only_b_rich_01",
      ai_spawn_option = "LunaFishOwner/owner_test"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_luna_rich_01",
      name = "childship_rich"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_luna_rich_01",
      name = "lunafish_rich"
    }
  },
  onPopGem = function(A0_160, A1_161)
    Fn_enemyAshPopGem(A0_160, A1_161, {"A", "B"})
  end,
  onUpdate = function(A0_162)
    local L1_163
  end,
  onEnter = function(A0_164)
    local L1_165
  end,
  onLeave = function(A0_166)
    local L1_167
  end,
  onObjectDead = function(A0_168, A1_169)
  end,
  onSpawn = function(A0_170, A1_171)
    A0_170:getSpecTable().enemyDeadNum = A0_170:getSpecTable().enemyDeadNum - 1
    if A0_170:getSpecTable().enemyDeadNum < 0 then
      A0_170:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_172, A1_173)
  end,
  onObjectAsh = function(A0_174, A1_175)
    A0_174:getSpecTable().enemyDeadNum = A0_174:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_176)
    return #A0_176.spawnSet
  end,
  getEnemyDeadNum = function(A0_177)
    local L1_178
    L1_178 = A0_177.enemyDeadNum
    return L1_178
  end,
  isEnemyAllDead = function(A0_179)
    local L2_180
    L2_180 = A0_179.enemyDeadNum
    L2_180 = L2_180 >= #A0_179.spawnSet
    return L2_180
  end
}
enmgen2_luna_only_c = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_enemy_l_only_c_01",
      name = "enemy_l_only_c_01",
      ai_spawn_option = "LunaFishOwner/owner_test"
    },
    {
      type = "gellyfish",
      locator = "locator_enemy_l_only_c_02",
      name = "enemy_l_only_c_02"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_04_enemy_01",
      name = "childship_04"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_04_enemy_01",
      name = "lunafish_04"
    }
  },
  onSetupGem = function(A0_181, A1_182)
    Fn_enemyPopGemSetup(A0_181, {
      "enemy_l_only_c_01"
    }, 1, GEM_SPECIAL)
  end,
  onPopGem = function(A0_183, A1_184)
    Fn_enemyAshPopGem(A0_183, A1_184)
  end,
  onUpdate = function(A0_185)
    local L1_186
  end,
  onEnter = function(A0_187)
    local L1_188
  end,
  onLeave = function(A0_189)
    local L1_190
  end,
  onObjectDead = function(A0_191, A1_192)
  end,
  onSpawn = function(A0_193, A1_194)
    A0_193:getSpecTable().enemyDeadNum = A0_193:getSpecTable().enemyDeadNum - 1
    if A0_193:getSpecTable().enemyDeadNum < 0 then
      A0_193:getSpecTable().enemyDeadNum = 0
    end
    _luna_enemy_num = _luna_enemy_num + 1
  end,
  onObjectDead = function(A0_195, A1_196)
  end,
  onObjectAsh = function(A0_197, A1_198)
    A0_197:getSpecTable().enemyDeadNum = A0_197:getSpecTable().enemyDeadNum + 1
    _luna_enemy_num = _luna_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_199)
    return #A0_199.spawnSet
  end,
  getEnemyDeadNum = function(A0_200)
    local L1_201
    L1_201 = A0_200.enemyDeadNum
    return L1_201
  end,
  isEnemyAllDead = function(A0_202)
    local L2_203
    L2_203 = A0_202.enemyDeadNum
    L2_203 = L2_203 >= #A0_202.spawnSet
    return L2_203
  end
}
enmgen2_center_only_c = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_enemy_c_only_c_01",
      name = "enemy_c_only_c_01"
    },
    {
      type = "treecannon",
      locator = "locator_enemy_c_only_c_02",
      name = "enemy_c_only_c_02"
    },
    {
      type = "imp",
      locator = "locator_enemy_c_only_c_03",
      name = "enemy_c_only_c_03"
    }
  },
  onSetupGem = function(A0_204, A1_205)
    Fn_enemyPopGemSetup(A0_204, {
      "enemy_c_only_c_02"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_206, A1_207)
    Fn_enemyAshPopGem(A0_206, A1_207)
  end,
  onUpdate = function(A0_208)
    local L1_209
  end,
  onEnter = function(A0_210)
    local L1_211
  end,
  onLeave = function(A0_212)
    local L1_213
  end,
  onObjectDead = function(A0_214, A1_215)
  end,
  onSpawn = function(A0_216, A1_217)
    A0_216:getSpecTable().enemyDeadNum = A0_216:getSpecTable().enemyDeadNum - 1
    if A0_216:getSpecTable().enemyDeadNum < 0 then
      A0_216:getSpecTable().enemyDeadNum = 0
    end
    _lo_a_05_enemy_num = _lo_a_05_enemy_num + 1
  end,
  onObjectDead = function(A0_218, A1_219)
  end,
  onObjectAsh = function(A0_220, A1_221)
    A0_220:getSpecTable().enemyDeadNum = A0_220:getSpecTable().enemyDeadNum + 1
    _lo_a_05_enemy_num = _lo_a_05_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_222)
    return #A0_222.spawnSet
  end,
  getEnemyDeadNum = function(A0_223)
    local L1_224
    L1_224 = A0_223.enemyDeadNum
    return L1_224
  end,
  isEnemyAllDead = function(A0_225)
    local L2_226
    L2_226 = A0_225.enemyDeadNum
    L2_226 = L2_226 >= #A0_225.spawnSet
    return L2_226
  end
}
enmgen2_water = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 1,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_03_enemy_01",
      name = "enemy_w_01"
    },
    {
      type = "jammer",
      locator = "locator_03_enemy_02",
      name = "enemy_w_02"
    }
  },
  onPopGem = function(A0_227, A1_228)
    Fn_enemyAshPopGem(A0_227, A1_228)
  end,
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
  onSpawn = function(A0_237, A1_238)
    A0_237:getSpecTable().enemyDeadNum = A0_237:getSpecTable().enemyDeadNum - 1
    if A0_237:getSpecTable().enemyDeadNum < 0 then
      A0_237:getSpecTable().enemyDeadNum = 0
    end
    _lo_a_02_enemy_num = _lo_a_02_enemy_num + 1
  end,
  onObjectDead = function(A0_239, A1_240)
  end,
  onObjectAsh = function(A0_241, A1_242)
    A0_241:getSpecTable().enemyDeadNum = A0_241:getSpecTable().enemyDeadNum + 1
    _lo_a_02_enemy_num = _lo_a_02_enemy_num - 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_243)
    return #A0_243.spawnSet
  end,
  getEnemyDeadNum = function(A0_244)
    local L1_245
    L1_245 = A0_244.enemyDeadNum
    return L1_245
  end,
  isEnemyAllDead = function(A0_246)
    local L2_247
    L2_247 = A0_246.enemyDeadNum
    L2_247 = L2_247 >= #A0_246.spawnSet
    return L2_247
  end
}
_enemy_status_tbl = {
  {
    name = "enmgen2_01",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_sdemo_only_a",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_sdemo_play_a",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_center_only_a",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_center_only_b",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_sky",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_sky02",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_luna_only_b",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_luna_only_b_rich",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_luna_only_c",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_center_only_c",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  },
  {
    name = "enmgen2_water",
    _is_enemy_idle = false,
    _is_enemy_marker = false,
    _is_enemy_spawn_request = false,
    _is_enemy_spawn_settled = false
  }
}
function Initialize()
  Fn_pcSensorOn("pccubesensor2_jammer_find")
end
function Ingame()
  local L0_248, L1_249, L2_250, L3_251
  L0_248 = findGameObject2
  L1_249 = "EnemyGenerator"
  L2_250 = "enmgen2_center_only_b"
  L0_248 = L0_248(L1_249, L2_250)
  L1_249 = Fn_enemyPopGemSetup
  L2_250 = L0_248
  L3_251 = {
    "enemy_c_only_b_01",
    "enemy_c_only_b_02"
  }
  L1_249(L2_250, L3_251, 2, GEM_VITAL, "A")
  L1_249 = Fn_enemyPopGemSetup
  L2_250 = L0_248
  L3_251 = {
    "enemy_c_only_b_03",
    "enemy_c_only_b_04",
    "enemy11"
  }
  L1_249(L2_250, L3_251, 2, GEM_VITAL, "B")
  L1_249 = findGameObject2
  L2_250 = "EnemyGenerator"
  L3_251 = "enmgen2_luna_only_b"
  L1_249 = L1_249(L2_250, L3_251)
  L2_250 = Fn_enemyPopGemSetup
  L3_251 = L1_249
  L2_250(L3_251, {
    "enemy_l_only_b_01"
  }, 1, GEM_ENERGY, "A")
  L2_250 = Fn_enemyPopGemSetup
  L3_251 = L1_249
  L2_250(L3_251, {
    "enemy_l_only_b_02",
    "enemy_l_only_b_03",
    "enemy_l_only_b_04"
  }, 3, GEM_SPECIAL, "B")
  L2_250 = findGameObject2
  L3_251 = "EnemyGenerator"
  L2_250 = L2_250(L3_251, "enmgen2_water")
  L3_251 = Fn_enemyPopGemSetup
  L3_251(L2_250, {"enemy_w_01", "enemy_w_02"}, 2, GEM_SPECIAL)
  L3_251 = invokeTask
  L3_251 = L3_251(function()
    while true do
      for _FORV_3_, _FORV_4_ in pairs(_enemy_status_tbl) do
        if _FORV_4_.name == _enmgen_name and _FORV_4_._is_enemy_spawn_request then
          if findGameObject2("EnemyGenerator", _enmgen_name) ~= nil then
            findGameObject2("EnemyGenerator", _enmgen_name):requestSpawn()
            while not findGameObject2("EnemyGenerator", _enmgen_name):isPrepared() do
              wait()
            end
          end
          _enmgen_name = nil
          _FORV_4_._is_enemy_spawn_request = false
          _is_enemy_spawn_request = false
        end
      end
      wait()
    end
  end)
  while true do
    if _brain_request then
      print("\227\131\150\227\131\172\227\130\164\227\131\179\229\143\150\229\190\151\229\135\166\231\144\134\233\150\139\229\167\139")
      _brain_request = false
      _gc_brain = findGameObject2("EnemyBrain", "enemy01")
      while _gc_brain:isReadyEnemy() == false do
        wait()
      end
      print("\227\131\150\227\131\172\227\130\164\227\131\179\229\143\150\229\190\151\229\174\140\228\186\134")
    end
    if _request_gc_motion then
      print("\227\130\172\227\131\188\227\131\137\227\130\179\227\130\162\239\188\154\230\188\148\230\138\128\232\166\129\232\171\139\233\150\139\229\167\139")
      _request_gc_motion = false
      _gc_brain:playMotion("attack")
    end
    if _end_script_action then
      print("\227\130\172\227\131\188\227\131\137\227\130\179\227\130\162\239\188\154\233\128\154\229\184\184\230\140\153\229\139\149\227\129\171\230\136\187\227\129\153")
      _end_script_action = false
      _gc_brain:endScriptAction()
    end
    wait()
  end
  L3_251 = Mv_safeTaskAbort(L3_251)
end
function Finalize()
  local L0_252, L1_253
end
function requestSpawnEnemy(A0_254)
  _enmgen_name = A0_254
  for _FORV_4_, _FORV_5_ in pairs(_enemy_status_tbl) do
    if _FORV_5_.name == A0_254 then
      _FORV_5_._is_enemy_spawn_request = true
      _FORV_5_._is_enemy_spawn_settled = true
    end
  end
  _is_enemy_spawn_settled = true
  _is_enemy_spawn_request = true
end
function requestIdleEnemy(A0_255, A1_256)
  if findGameObject2("EnemyGenerator", A1_256) ~= nil then
    findGameObject2("EnemyGenerator", A1_256):requestIdlingEnemy(A0_255)
  end
  if A0_255 then
    _is_enemy_idle = true
  else
    _is_enemy_idle = false
  end
end
function requestChangeEnemyMarker(A0_257, A1_258)
  if findGameObject2("EnemyGenerator", A1_258) ~= nil then
    findGameObject2("EnemyGenerator", A1_258):setEnemyMarker(A0_257)
  end
end
function isSpawnEnemyEnd(A0_259)
  for _FORV_4_, _FORV_5_ in pairs(_enemy_status_tbl) do
    if _FORV_5_.name == A0_259 then
      return _FORV_5_._is_enemy_spawn_request
    end
  end
end
function isEnemyGroupAllDead(A0_260)
  if findGameObject2("EnemyGenerator", A0_260) ~= nil then
    return findGameObject2("EnemyGenerator", A0_260):getSpecTable():isEnemyAllDead()
  end
end
function isSpawnEnemy(A0_261)
  for _FORV_4_, _FORV_5_ in pairs(_enemy_status_tbl) do
    if _FORV_5_.name == A0_261 then
      return _FORV_5_._is_enemy_spawn_settled
    end
  end
end
function requestEnemyCount(A0_262)
  return findGameObject2("EnemyGenerator", A0_262):getEnemyCount()
end
function setAutoRevirthSwitch(A0_263, A1_264)
  return findGameObject2("EnemyGenerator", A0_263):setAutoRevirthSwitch(A1_264)
end
function requestDestroyEnemy(A0_265)
  for _FORV_4_, _FORV_5_ in pairs(_enemy_status_tbl) do
    if _FORV_5_.name == A0_265 and findGameObject2("EnemyGenerator", _FORV_5_.name) ~= nil then
      findGameObject2("EnemyGenerator", _FORV_5_.name):requestAllEnemyKill()
    end
  end
end
function isEnemyGroupAllDead2(A0_266)
  if findGameObject2("EnemyGenerator", A0_266) ~= nil then
    if A0_266 == "enmgen2_center_only_c" then
      return _lo_a_05_enemy_num
    elseif A0_266 == "enmgen2_luna_only_c" then
      return _luna_enemy_num
    elseif A0_266 == "enmgen2_water" then
      return _lo_a_02_enemy_num
    elseif A0_266 == "enmgen2_01" then
      return _lo_a_01_enemy_num
    end
  end
end
function scoreReset()
  local L0_267, L1_268
  _lo_a_05_enemy_num = 0
  _lo_a_02_enemy_num = 0
  _luna_enemy_num = 0
end
function pccubesensor2_jammer_find_OnEnter()
  requestChangeEnemyMarker(true, "enmgen2_sky02")
end
function requestGcBrain()
  local L0_269, L1_270
  _brain_request = true
end
function playGcMotion()
  local L0_271, L1_272
  _request_gc_motion = true
end
function endScriptAction()
  local L0_273, L1_274
  _end_script_action = true
end
