dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_enmgen_name = nil
_is_enemy_spawn_settled = false
_is_ship_spawn_setteled = false
_is_enemy_idle = false
_is_enemy_marker = false
_is_enemy_group_all_dead = false
_is_enemy_jamming = false
_enemy_move = nil
_luna_cnt = 20
_enemy_cnt = 2
_total_enemy_cnt = 23
_is_create_box_request = false
_is_create_box_settled = false
_is_box_delete = false
_box_hdl_tbl = {}
enmgen2_a_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_a_b_01_01",
      type = "guardcore",
      locator = "locator_enemy_a_b_01_01"
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
enmgen2_a_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_a_b_02_01",
      type = "gellyfish",
      locator = "locator_enemy_a_b_02_01"
    },
    {
      name = "sm22_enemy_a_b_02_02",
      type = "gellyfish",
      locator = "locator_enemy_a_b_02_02"
    },
    {
      name = "sm22_enemy_a_b_02_03",
      type = "gellyfish",
      locator = "locator_enemy_a_b_02_03"
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
  onSpawn = function(A0_23, A1_24)
    A0_23:getSpecTable().enemyDeadNum = A0_23:getSpecTable().enemyDeadNum - 1
    if A0_23:getSpecTable().enemyDeadNum < 0 then
      A0_23:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_25, A1_26)
  end,
  onObjectAsh = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_29)
    return #A0_29.spawnSet
  end,
  getEnemyDeadNum = function(A0_30)
    local L1_31
    L1_31 = A0_30.enemyDeadNum
    return L1_31
  end,
  isEnemyAllDead = function(A0_32)
    local L2_33
    L2_33 = A0_32.enemyDeadNum
    L2_33 = L2_33 >= #A0_32.spawnSet
    return L2_33
  end
}
enmgen2_a_b_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_a_b_03_01",
      type = "stalker",
      locator = "locator_enemy_a_b_03_01"
    }
  },
  onUpdate = function(A0_34)
    local L1_35
  end,
  onEnter = function(A0_36)
    local L1_37
  end,
  onLeave = function(A0_38)
    local L1_39
  end,
  onSpawn = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyDeadNum = A0_40:getSpecTable().enemyDeadNum - 1
    if A0_40:getSpecTable().enemyDeadNum < 0 then
      A0_40:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
    A0_44:getSpecTable().enemyDeadNum = A0_44:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_46)
    return #A0_46.spawnSet
  end,
  getEnemyDeadNum = function(A0_47)
    local L1_48
    L1_48 = A0_47.enemyDeadNum
    return L1_48
  end,
  isEnemyAllDead = function(A0_49)
    local L2_50
    L2_50 = A0_49.enemyDeadNum
    L2_50 = L2_50 >= #A0_49.spawnSet
    return L2_50
  end
}
enmgen2_root_init_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_init_01_01",
      type = "stalker",
      locator = "locator_enemy_root_init_01_01"
    },
    {
      name = "sm22_enemy_root_init_01_02",
      type = "stalker",
      locator = "locator_enemy_root_init_01_02"
    }
  },
  onUpdate = function(A0_51)
    local L1_52
  end,
  onEnter = function(A0_53)
    local L1_54
  end,
  onLeave = function(A0_55)
    local L1_56
  end,
  onSpawn = function(A0_57, A1_58)
    A0_57:getSpecTable().enemyDeadNum = A0_57:getSpecTable().enemyDeadNum - 1
    if A0_57:getSpecTable().enemyDeadNum < 0 then
      A0_57:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_59, A1_60)
  end,
  onObjectAsh = function(A0_61, A1_62)
    A0_61:getSpecTable().enemyDeadNum = A0_61:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_63)
    return #A0_63.spawnSet
  end,
  getEnemyDeadNum = function(A0_64)
    local L1_65
    L1_65 = A0_64.enemyDeadNum
    return L1_65
  end,
  isEnemyAllDead = function(A0_66)
    local L2_67
    L2_67 = A0_66.enemyDeadNum
    L2_67 = L2_67 >= #A0_66.spawnSet
    return L2_67
  end
}
enmgen2_root_init_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_init_02_01",
      type = "gellyfish",
      locator = "locator_enemy_root_init_02_01"
    },
    {
      name = "sm22_enemy_root_init_02_02",
      type = "treecannon",
      locator = "locator_enemy_root_init_02_02"
    }
  },
  onUpdate = function(A0_68)
    local L1_69
  end,
  onEnter = function(A0_70)
    local L1_71
  end,
  onLeave = function(A0_72)
    local L1_73
  end,
  onSpawn = function(A0_74, A1_75)
    A0_74:getSpecTable().enemyDeadNum = A0_74:getSpecTable().enemyDeadNum - 1
    if A0_74:getSpecTable().enemyDeadNum < 0 then
      A0_74:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_76, A1_77)
  end,
  onObjectAsh = function(A0_78, A1_79)
    A0_78:getSpecTable().enemyDeadNum = A0_78:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_80)
    return #A0_80.spawnSet
  end,
  getEnemyDeadNum = function(A0_81)
    local L1_82
    L1_82 = A0_81.enemyDeadNum
    return L1_82
  end,
  isEnemyAllDead = function(A0_83)
    local L2_84
    L2_84 = A0_83.enemyDeadNum
    L2_84 = L2_84 >= #A0_83.spawnSet
    return L2_84
  end
}
enmgen2_root_init_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_init_03_01",
      type = "stalker",
      locator = "locator_enemy_root_init_03_01"
    },
    {
      name = "sm22_enemy_root_init_03_02",
      type = "stalker",
      locator = "locator_enemy_root_init_03_02"
    }
  },
  onUpdate = function(A0_85)
    local L1_86
  end,
  onEnter = function(A0_87)
    local L1_88
  end,
  onLeave = function(A0_89)
    local L1_90
  end,
  onSpawn = function(A0_91, A1_92)
    A0_91:getSpecTable().enemyDeadNum = A0_91:getSpecTable().enemyDeadNum - 1
    if A0_91:getSpecTable().enemyDeadNum < 0 then
      A0_91:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_93, A1_94)
  end,
  onObjectAsh = function(A0_95, A1_96)
    A0_95:getSpecTable().enemyDeadNum = A0_95:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_97)
    return #A0_97.spawnSet
  end,
  getEnemyDeadNum = function(A0_98)
    local L1_99
    L1_99 = A0_98.enemyDeadNum
    return L1_99
  end,
  isEnemyAllDead = function(A0_100)
    local L2_101
    L2_101 = A0_100.enemyDeadNum
    L2_101 = L2_101 >= #A0_100.spawnSet
    return L2_101
  end
}
enmgen2_root_a_init_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_a_init_01_01",
      type = "guardcore",
      locator = "locator_enemy_root_a_init_01_01"
    }
  },
  onUpdate = function(A0_102)
    local L1_103
  end,
  onEnter = function(A0_104)
    local L1_105
  end,
  onLeave = function(A0_106)
    local L1_107
  end,
  onSpawn = function(A0_108, A1_109)
    A0_108:getSpecTable().enemyDeadNum = A0_108:getSpecTable().enemyDeadNum - 1
    if A0_108:getSpecTable().enemyDeadNum < 0 then
      A0_108:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_110, A1_111)
  end,
  onObjectAsh = function(A0_112, A1_113)
    A0_112:getSpecTable().enemyDeadNum = A0_112:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_114)
    return #A0_114.spawnSet
  end,
  getEnemyDeadNum = function(A0_115)
    local L1_116
    L1_116 = A0_115.enemyDeadNum
    return L1_116
  end,
  isEnemyAllDead = function(A0_117)
    local L2_118
    L2_118 = A0_117.enemyDeadNum
    L2_118 = L2_118 >= #A0_117.spawnSet
    return L2_118
  end
}
enmgen2_root_b_init_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_b_init_01_01",
      type = "guardcore",
      locator = "locator_enemy_root_b_init_01_01"
    },
    {
      name = "sm22_enemy_root_b_init_01_02",
      type = "guardcore",
      locator = "locator_enemy_root_b_init_01_02"
    }
  },
  onUpdate = function(A0_119)
    local L1_120
  end,
  onEnter = function(A0_121)
    local L1_122
  end,
  onLeave = function(A0_123)
    local L1_124
  end,
  onSpawn = function(A0_125, A1_126)
    A0_125:getSpecTable().enemyDeadNum = A0_125:getSpecTable().enemyDeadNum - 1
    if A0_125:getSpecTable().enemyDeadNum < 0 then
      A0_125:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_127, A1_128)
  end,
  onObjectAsh = function(A0_129, A1_130)
    A0_129:getSpecTable().enemyDeadNum = A0_129:getSpecTable().enemyDeadNum + 1
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
  isEnemyAllDead = function(A0_134)
    local L2_135
    L2_135 = A0_134.enemyDeadNum
    L2_135 = L2_135 >= #A0_134.spawnSet
    return L2_135
  end
}
enmgen2_root_b_init_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_b_init_02_01",
      type = "stalker",
      locator = "locator_enemy_root_b_init_02_01"
    },
    {
      name = "sm22_enemy_root_b_init_02_02",
      type = "stalker",
      locator = "locator_enemy_root_b_init_02_02"
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
  onSpawn = function(A0_142, A1_143)
    A0_142:getSpecTable().enemyDeadNum = A0_142:getSpecTable().enemyDeadNum - 1
    if A0_142:getSpecTable().enemyDeadNum < 0 then
      A0_142:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_144, A1_145)
  end,
  onObjectAsh = function(A0_146, A1_147)
    A0_146:getSpecTable().enemyDeadNum = A0_146:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_148)
    return #A0_148.spawnSet
  end,
  getEnemyDeadNum = function(A0_149)
    local L1_150
    L1_150 = A0_149.enemyDeadNum
    return L1_150
  end,
  isEnemyAllDead = function(A0_151)
    local L2_152
    L2_152 = A0_151.enemyDeadNum
    L2_152 = L2_152 >= #A0_151.spawnSet
    return L2_152
  end
}
enmgen2_root_b_init_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_b_init_03_01",
      type = "runner",
      locator = "locator_enemy_root_b_init_03_01"
    }
  },
  onUpdate = function(A0_153)
    local L1_154
  end,
  onEnter = function(A0_155)
    local L1_156
  end,
  onLeave = function(A0_157)
    local L1_158
  end,
  onSpawn = function(A0_159, A1_160)
    A0_159:getSpecTable().enemyDeadNum = A0_159:getSpecTable().enemyDeadNum - 1
    if A0_159:getSpecTable().enemyDeadNum < 0 then
      A0_159:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_161, A1_162)
  end,
  onObjectAsh = function(A0_163, A1_164)
    A0_163:getSpecTable().enemyDeadNum = A0_163:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_165)
    return #A0_165.spawnSet
  end,
  getEnemyDeadNum = function(A0_166)
    local L1_167
    L1_167 = A0_166.enemyDeadNum
    return L1_167
  end,
  isEnemyAllDead = function(A0_168)
    local L2_169
    L2_169 = A0_168.enemyDeadNum
    L2_169 = L2_169 >= #A0_168.spawnSet
    return L2_169
  end
}
enmgen2_root_slope_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_slope_01_01",
      type = "gellyfish",
      locator = "locator_enemy_root_slope_01_01"
    }
  },
  onUpdate = function(A0_170)
    local L1_171
  end,
  onEnter = function(A0_172)
    local L1_173
  end,
  onLeave = function(A0_174)
    local L1_175
  end,
  onSpawn = function(A0_176, A1_177)
    A0_176:getSpecTable().enemyDeadNum = A0_176:getSpecTable().enemyDeadNum - 1
    if A0_176:getSpecTable().enemyDeadNum < 0 then
      A0_176:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_178, A1_179)
  end,
  onObjectAsh = function(A0_180, A1_181)
    A0_180:getSpecTable().enemyDeadNum = A0_180:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_182)
    return #A0_182.spawnSet
  end,
  getEnemyDeadNum = function(A0_183)
    local L1_184
    L1_184 = A0_183.enemyDeadNum
    return L1_184
  end,
  isEnemyAllDead = function(A0_185)
    local L2_186
    L2_186 = A0_185.enemyDeadNum
    L2_186 = L2_186 >= #A0_185.spawnSet
    return L2_186
  end
}
enmgen2_root_slope_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_slope_02_01",
      type = "gellyfish",
      locator = "locator_enemy_root_slope_02_01"
    }
  },
  onUpdate = function(A0_187)
    local L1_188
  end,
  onEnter = function(A0_189)
    local L1_190
  end,
  onLeave = function(A0_191)
    local L1_192
  end,
  onSpawn = function(A0_193, A1_194)
    A0_193:getSpecTable().enemyDeadNum = A0_193:getSpecTable().enemyDeadNum - 1
    if A0_193:getSpecTable().enemyDeadNum < 0 then
      A0_193:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_195, A1_196)
  end,
  onObjectAsh = function(A0_197, A1_198)
    A0_197:getSpecTable().enemyDeadNum = A0_197:getSpecTable().enemyDeadNum + 1
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
enmgen2_root_slope_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_slope_03_01",
      type = "gellyfish",
      locator = "locator_enemy_root_slope_03_01"
    }
  },
  onUpdate = function(A0_204)
    local L1_205
  end,
  onEnter = function(A0_206)
    local L1_207
  end,
  onLeave = function(A0_208)
    local L1_209
  end,
  onSpawn = function(A0_210, A1_211)
    A0_210:getSpecTable().enemyDeadNum = A0_210:getSpecTable().enemyDeadNum - 1
    if A0_210:getSpecTable().enemyDeadNum < 0 then
      A0_210:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_212, A1_213)
  end,
  onObjectAsh = function(A0_214, A1_215)
    A0_214:getSpecTable().enemyDeadNum = A0_214:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_216)
    return #A0_216.spawnSet
  end,
  getEnemyDeadNum = function(A0_217)
    local L1_218
    L1_218 = A0_217.enemyDeadNum
    return L1_218
  end,
  isEnemyAllDead = function(A0_219)
    local L2_220
    L2_220 = A0_219.enemyDeadNum
    L2_220 = L2_220 >= #A0_219.spawnSet
    return L2_220
  end
}
enmgen2_root_bridge_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_bridge_01_01_01",
      type = "gellyfish",
      locator = "locator_enemy_root_bridge_01_01_01"
    }
  },
  onUpdate = function(A0_221)
    local L1_222
  end,
  onEnter = function(A0_223)
    local L1_224
  end,
  onLeave = function(A0_225)
    local L1_226
  end,
  onSpawn = function(A0_227, A1_228)
    A0_227:getSpecTable().enemyDeadNum = A0_227:getSpecTable().enemyDeadNum - 1
    if A0_227:getSpecTable().enemyDeadNum < 0 then
      A0_227:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_229, A1_230)
  end,
  onObjectAsh = function(A0_231, A1_232)
    A0_231:getSpecTable().enemyDeadNum = A0_231:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_233)
    return #A0_233.spawnSet
  end,
  getEnemyDeadNum = function(A0_234)
    local L1_235
    L1_235 = A0_234.enemyDeadNum
    return L1_235
  end,
  isEnemyAllDead = function(A0_236)
    local L2_237
    L2_237 = A0_236.enemyDeadNum
    L2_237 = L2_237 >= #A0_236.spawnSet
    return L2_237
  end
}
enmgen2_root_bridge_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_bridge_01_02_01",
      type = "imp",
      locator = "locator_enemy_root_bridge_01_02_01"
    }
  },
  onUpdate = function(A0_238)
    local L1_239
  end,
  onEnter = function(A0_240)
    local L1_241
  end,
  onLeave = function(A0_242)
    local L1_243
  end,
  onSpawn = function(A0_244, A1_245)
    A0_244:getSpecTable().enemyDeadNum = A0_244:getSpecTable().enemyDeadNum - 1
    if A0_244:getSpecTable().enemyDeadNum < 0 then
      A0_244:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_246, A1_247)
  end,
  onObjectAsh = function(A0_248, A1_249)
    A0_248:getSpecTable().enemyDeadNum = A0_248:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_250)
    return #A0_250.spawnSet
  end,
  getEnemyDeadNum = function(A0_251)
    local L1_252
    L1_252 = A0_251.enemyDeadNum
    return L1_252
  end,
  isEnemyAllDead = function(A0_253)
    local L2_254
    L2_254 = A0_253.enemyDeadNum
    L2_254 = L2_254 >= #A0_253.spawnSet
    return L2_254
  end
}
enmgen2_root_bridge_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_bridge_02_01",
      type = "guardcore",
      locator = "locator_enemy_root_bridge_02_01"
    }
  },
  onPopGem = function(A0_255, A1_256)
    Fn_enemyAshPopGem(A0_255, A1_256, {"D"})
  end,
  onUpdate = function(A0_257)
    local L1_258
  end,
  onEnter = function(A0_259)
    local L1_260
  end,
  onLeave = function(A0_261)
    local L1_262
  end,
  onSpawn = function(A0_263, A1_264)
    A0_263:getSpecTable().enemyDeadNum = A0_263:getSpecTable().enemyDeadNum - 1
    if A0_263:getSpecTable().enemyDeadNum < 0 then
      A0_263:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_265, A1_266)
  end,
  onObjectAsh = function(A0_267, A1_268)
    A0_267:getSpecTable().enemyDeadNum = A0_267:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_269)
    return #A0_269.spawnSet
  end,
  getEnemyDeadNum = function(A0_270)
    local L1_271
    L1_271 = A0_270.enemyDeadNum
    return L1_271
  end,
  isEnemyAllDead = function(A0_272)
    local L2_273
    L2_273 = A0_272.enemyDeadNum
    L2_273 = L2_273 >= #A0_272.spawnSet
    return L2_273
  end
}
enmgen2_root_water_fountain_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_water_fountain_01_01",
      type = "imp",
      locator = "locator_enemy_root_water_fountain_01_01"
    }
  },
  onUpdate = function(A0_274)
    local L1_275
  end,
  onEnter = function(A0_276)
    local L1_277
  end,
  onLeave = function(A0_278)
    local L1_279
  end,
  onSpawn = function(A0_280, A1_281)
    A0_280:getSpecTable().enemyDeadNum = A0_280:getSpecTable().enemyDeadNum - 1
    if A0_280:getSpecTable().enemyDeadNum < 0 then
      A0_280:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_282, A1_283)
  end,
  onObjectAsh = function(A0_284, A1_285)
    A0_284:getSpecTable().enemyDeadNum = A0_284:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_286)
    return #A0_286.spawnSet
  end,
  getEnemyDeadNum = function(A0_287)
    local L1_288
    L1_288 = A0_287.enemyDeadNum
    return L1_288
  end,
  isEnemyAllDead = function(A0_289)
    local L2_290
    L2_290 = A0_289.enemyDeadNum
    L2_290 = L2_290 >= #A0_289.spawnSet
    return L2_290
  end
}
enmgen2_root_water_fountain_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_water_fountain_02_01",
      type = "imp",
      locator = "locator_enemy_root_water_fountain_02_01"
    }
  },
  onUpdate = function(A0_291)
    local L1_292
  end,
  onEnter = function(A0_293)
    local L1_294
  end,
  onLeave = function(A0_295)
    local L1_296
  end,
  onSpawn = function(A0_297, A1_298)
    A0_297:getSpecTable().enemyDeadNum = A0_297:getSpecTable().enemyDeadNum - 1
    if A0_297:getSpecTable().enemyDeadNum < 0 then
      A0_297:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_299, A1_300)
  end,
  onObjectAsh = function(A0_301, A1_302)
    A0_301:getSpecTable().enemyDeadNum = A0_301:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_303)
    return #A0_303.spawnSet
  end,
  getEnemyDeadNum = function(A0_304)
    local L1_305
    L1_305 = A0_304.enemyDeadNum
    return L1_305
  end,
  isEnemyAllDead = function(A0_306)
    local L2_307
    L2_307 = A0_306.enemyDeadNum
    L2_307 = L2_307 >= #A0_306.spawnSet
    return L2_307
  end
}
enmgen2_root_cross_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_cross_01_01",
      type = "runner",
      locator = "locator_enemy_root_cross_01_01"
    }
  },
  onPopGem = function(A0_308, A1_309)
    Fn_enemyAshPopGem(A0_308, A1_309, {"A"})
  end,
  onUpdate = function(A0_310)
    local L1_311
  end,
  onEnter = function(A0_312)
    local L1_313
  end,
  onLeave = function(A0_314)
    local L1_315
  end,
  onSpawn = function(A0_316, A1_317)
    A0_316:getSpecTable().enemyDeadNum = A0_316:getSpecTable().enemyDeadNum - 1
    if A0_316:getSpecTable().enemyDeadNum < 0 then
      A0_316:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_318, A1_319)
  end,
  onObjectAsh = function(A0_320, A1_321)
    A0_320:getSpecTable().enemyDeadNum = A0_320:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_322)
    return #A0_322.spawnSet
  end,
  getEnemyDeadNum = function(A0_323)
    local L1_324
    L1_324 = A0_323.enemyDeadNum
    return L1_324
  end,
  isEnemyAllDead = function(A0_325)
    local L2_326
    L2_326 = A0_325.enemyDeadNum
    L2_326 = L2_326 >= #A0_325.spawnSet
    return L2_326
  end
}
enmgen2_root_cross_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_cross_01_02",
      type = "runner",
      locator = "locator_enemy_root_cross_01_02"
    }
  },
  onUpdate = function(A0_327)
    local L1_328
  end,
  onEnter = function(A0_329)
    local L1_330
  end,
  onLeave = function(A0_331)
    local L1_332
  end,
  onSpawn = function(A0_333, A1_334)
    A0_333:getSpecTable().enemyDeadNum = A0_333:getSpecTable().enemyDeadNum - 1
    if A0_333:getSpecTable().enemyDeadNum < 0 then
      A0_333:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_335, A1_336)
  end,
  onObjectAsh = function(A0_337, A1_338)
    A0_337:getSpecTable().enemyDeadNum = A0_337:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_339)
    return #A0_339.spawnSet
  end,
  getEnemyDeadNum = function(A0_340)
    local L1_341
    L1_341 = A0_340.enemyDeadNum
    return L1_341
  end,
  isEnemyAllDead = function(A0_342)
    local L2_343
    L2_343 = A0_342.enemyDeadNum
    L2_343 = L2_343 >= #A0_342.spawnSet
    return L2_343
  end
}
enmgen2_root_cross_01_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_cross_01_03",
      type = "runner",
      locator = "locator_enemy_root_cross_01_03"
    }
  },
  onUpdate = function(A0_344)
    local L1_345
  end,
  onEnter = function(A0_346)
    local L1_347
  end,
  onLeave = function(A0_348)
    local L1_349
  end,
  onSpawn = function(A0_350, A1_351)
    A0_350:getSpecTable().enemyDeadNum = A0_350:getSpecTable().enemyDeadNum - 1
    if A0_350:getSpecTable().enemyDeadNum < 0 then
      A0_350:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_352, A1_353)
  end,
  onObjectAsh = function(A0_354, A1_355)
    A0_354:getSpecTable().enemyDeadNum = A0_354:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_356)
    return #A0_356.spawnSet
  end,
  getEnemyDeadNum = function(A0_357)
    local L1_358
    L1_358 = A0_357.enemyDeadNum
    return L1_358
  end,
  isEnemyAllDead = function(A0_359)
    local L2_360
    L2_360 = A0_359.enemyDeadNum
    L2_360 = L2_360 >= #A0_359.spawnSet
    return L2_360
  end
}
enmgen2_root_cross_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_cross_02_01",
      type = "guardcore",
      locator = "locator_enemy_root_cross_02_01"
    }
  },
  onPopGem = function(A0_361, A1_362)
    Fn_enemyAshPopGem(A0_361, A1_362, {"B"})
  end,
  onUpdate = function(A0_363)
    local L1_364
  end,
  onEnter = function(A0_365)
    local L1_366
  end,
  onLeave = function(A0_367)
    local L1_368
  end,
  onSpawn = function(A0_369, A1_370)
    A0_369:getSpecTable().enemyDeadNum = A0_369:getSpecTable().enemyDeadNum - 1
    if A0_369:getSpecTable().enemyDeadNum < 0 then
      A0_369:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_371, A1_372)
  end,
  onObjectAsh = function(A0_373, A1_374)
    A0_373:getSpecTable().enemyDeadNum = A0_373:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_375)
    return #A0_375.spawnSet
  end,
  getEnemyDeadNum = function(A0_376)
    local L1_377
    L1_377 = A0_376.enemyDeadNum
    return L1_377
  end,
  isEnemyAllDead = function(A0_378)
    local L2_379
    L2_379 = A0_378.enemyDeadNum
    L2_379 = L2_379 >= #A0_378.spawnSet
    return L2_379
  end
}
enmgen2_root_cross_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_cross_03_01",
      type = "gellyfish",
      locator = "locator_enemy_root_cross_03_01"
    },
    {
      name = "sm22_enemy_root_cross_03_02",
      type = "gellyfish",
      locator = "locator_enemy_root_cross_03_02"
    }
  },
  onUpdate = function(A0_380)
    local L1_381
  end,
  onEnter = function(A0_382)
    local L1_383
  end,
  onLeave = function(A0_384)
    local L1_385
  end,
  onSpawn = function(A0_386, A1_387)
    A0_386:getSpecTable().enemyDeadNum = A0_386:getSpecTable().enemyDeadNum - 1
    if A0_386:getSpecTable().enemyDeadNum < 0 then
      A0_386:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_388, A1_389)
  end,
  onObjectAsh = function(A0_390, A1_391)
    A0_390:getSpecTable().enemyDeadNum = A0_390:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_392)
    return #A0_392.spawnSet
  end,
  getEnemyDeadNum = function(A0_393)
    local L1_394
    L1_394 = A0_393.enemyDeadNum
    return L1_394
  end,
  isEnemyAllDead = function(A0_395)
    local L2_396
    L2_396 = A0_395.enemyDeadNum
    L2_396 = L2_396 >= #A0_395.spawnSet
    return L2_396
  end
}
enmgen2_root_circle_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_circle_01_01",
      type = "gellyfish",
      locator = "locator_enemy_root_circle_01_01"
    }
  },
  onUpdate = function(A0_397)
    local L1_398
  end,
  onEnter = function(A0_399)
    local L1_400
  end,
  onLeave = function(A0_401)
    local L1_402
  end,
  onSpawn = function(A0_403, A1_404)
    A0_403:getSpecTable().enemyDeadNum = A0_403:getSpecTable().enemyDeadNum - 1
    if A0_403:getSpecTable().enemyDeadNum < 0 then
      A0_403:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_405, A1_406)
  end,
  onObjectAsh = function(A0_407, A1_408)
    A0_407:getSpecTable().enemyDeadNum = A0_407:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_409)
    return #A0_409.spawnSet
  end,
  getEnemyDeadNum = function(A0_410)
    local L1_411
    L1_411 = A0_410.enemyDeadNum
    return L1_411
  end,
  isEnemyAllDead = function(A0_412)
    local L2_413
    L2_413 = A0_412.enemyDeadNum
    L2_413 = L2_413 >= #A0_412.spawnSet
    return L2_413
  end
}
enmgen2_root_circle_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_root_circle_02_01",
      type = "gellyfish",
      locator = "locator_enemy_root_circle_02_01"
    }
  },
  onUpdate = function(A0_414)
    local L1_415
  end,
  onEnter = function(A0_416)
    local L1_417
  end,
  onLeave = function(A0_418)
    local L1_419
  end,
  onSpawn = function(A0_420, A1_421)
    A0_420:getSpecTable().enemyDeadNum = A0_420:getSpecTable().enemyDeadNum - 1
    if A0_420:getSpecTable().enemyDeadNum < 0 then
      A0_420:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_422, A1_423)
  end,
  onObjectAsh = function(A0_424, A1_425)
    A0_424:getSpecTable().enemyDeadNum = A0_424:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_426)
    return #A0_426.spawnSet
  end,
  getEnemyDeadNum = function(A0_427)
    local L1_428
    L1_428 = A0_427.enemyDeadNum
    return L1_428
  end,
  isEnemyAllDead = function(A0_429)
    local L2_430
    L2_430 = A0_429.enemyDeadNum
    L2_430 = L2_430 >= #A0_429.spawnSet
    return L2_430
  end
}
enmgen2_root_circle_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      name = "sm22_enemy_root_circle_03_01",
      type = "treecannon",
      locator = "locator_enemy_root_circle_03_01"
    }
  },
  onUpdate = function(A0_431)
    local L1_432
  end,
  onEnter = function(A0_433)
    local L1_434
  end,
  onLeave = function(A0_435)
    local L1_436
  end,
  onSpawn = function(A0_437, A1_438)
    A0_437:getSpecTable().enemyDeadNum = A0_437:getSpecTable().enemyDeadNum - 1
    if A0_437:getSpecTable().enemyDeadNum < 0 then
      A0_437:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_439, A1_440)
  end,
  onObjectAsh = function(A0_441, A1_442)
    A0_441:getSpecTable().enemyDeadNum = A0_441:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_443)
    return #A0_443.spawnSet
  end,
  getEnemyDeadNum = function(A0_444)
    local L1_445
    L1_445 = A0_444.enemyDeadNum
    return L1_445
  end,
  isEnemyAllDead = function(A0_446)
    local L2_447
    L2_447 = A0_446.enemyDeadNum
    L2_447 = L2_447 >= #A0_446.spawnSet
    return L2_447
  end
}
enmgen2_root_circle_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      name = "sm22_enemy_root_circle_04_01",
      type = "gellyfish",
      locator = "locator_enemy_root_circle_04_01"
    }
  },
  onUpdate = function(A0_448)
    local L1_449
  end,
  onEnter = function(A0_450)
    local L1_451
  end,
  onLeave = function(A0_452)
    local L1_453
  end,
  onSpawn = function(A0_454, A1_455)
    A0_454:getSpecTable().enemyDeadNum = A0_454:getSpecTable().enemyDeadNum - 1
    if A0_454:getSpecTable().enemyDeadNum < 0 then
      A0_454:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_456, A1_457)
  end,
  onObjectAsh = function(A0_458, A1_459)
    A0_458:getSpecTable().enemyDeadNum = A0_458:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_460)
    return #A0_460.spawnSet
  end,
  getEnemyDeadNum = function(A0_461)
    local L1_462
    L1_462 = A0_461.enemyDeadNum
    return L1_462
  end,
  isEnemyAllDead = function(A0_463)
    local L2_464
    L2_464 = A0_463.enemyDeadNum
    L2_464 = L2_464 >= #A0_463.spawnSet
    return L2_464
  end
}
enmgen2_root_stairs_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      name = "sm22_enemy_root_stairs_01_01",
      type = "gellyfish",
      locator = "locator_enemy_root_stairs_01_01"
    },
    {
      name = "sm22_enemy_root_stairs_01_02",
      type = "gellyfish",
      locator = "locator_enemy_root_stairs_01_02"
    }
  },
  onUpdate = function(A0_465)
    local L1_466
  end,
  onEnter = function(A0_467)
    local L1_468
  end,
  onLeave = function(A0_469)
    local L1_470
  end,
  onSpawn = function(A0_471, A1_472)
    A0_471:getSpecTable().enemyDeadNum = A0_471:getSpecTable().enemyDeadNum - 1
    if A0_471:getSpecTable().enemyDeadNum < 0 then
      A0_471:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_473, A1_474)
  end,
  onObjectAsh = function(A0_475, A1_476)
    A0_475:getSpecTable().enemyDeadNum = A0_475:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_477)
    return #A0_477.spawnSet
  end,
  getEnemyDeadNum = function(A0_478)
    local L1_479
    L1_479 = A0_478.enemyDeadNum
    return L1_479
  end,
  isEnemyAllDead = function(A0_480)
    local L2_481
    L2_481 = A0_480.enemyDeadNum
    L2_481 = L2_481 >= #A0_480.spawnSet
    return L2_481
  end
}
enmgen2_root_stairs_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      name = "sm22_enemy_root_stairs_02_01",
      type = "imp",
      locator = "locator_enemy_root_stairs_02_01"
    }
  },
  onUpdate = function(A0_482)
    local L1_483
  end,
  onEnter = function(A0_484)
    local L1_485
  end,
  onLeave = function(A0_486)
    local L1_487
  end,
  onSpawn = function(A0_488, A1_489)
    A0_488:getSpecTable().enemyDeadNum = A0_488:getSpecTable().enemyDeadNum - 1
    if A0_488:getSpecTable().enemyDeadNum < 0 then
      A0_488:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_490, A1_491)
  end,
  onObjectAsh = function(A0_492, A1_493)
    A0_492:getSpecTable().enemyDeadNum = A0_492:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_494)
    return #A0_494.spawnSet
  end,
  getEnemyDeadNum = function(A0_495)
    local L1_496
    L1_496 = A0_495.enemyDeadNum
    return L1_496
  end,
  isEnemyAllDead = function(A0_497)
    local L2_498
    L2_498 = A0_497.enemyDeadNum
    L2_498 = L2_498 >= #A0_497.spawnSet
    return L2_498
  end
}
enmgen2_root_stairs_03_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      name = "sm22_enemy_root_stairs_03_01_01",
      type = "guardcore",
      locator = "locator_enemy_root_stairs_03_01_01"
    }
  },
  onPopGem = function(A0_499, A1_500)
    Fn_enemyAshPopGem(A0_499, A1_500, {"C"})
  end,
  onUpdate = function(A0_501)
    local L1_502
  end,
  onEnter = function(A0_503)
    local L1_504
  end,
  onLeave = function(A0_505)
    local L1_506
  end,
  onSpawn = function(A0_507, A1_508)
    A0_507:getSpecTable().enemyDeadNum = A0_507:getSpecTable().enemyDeadNum - 1
    if A0_507:getSpecTable().enemyDeadNum < 0 then
      A0_507:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_509, A1_510)
  end,
  onObjectAsh = function(A0_511, A1_512)
    A0_511:getSpecTable().enemyDeadNum = A0_511:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_513)
    return #A0_513.spawnSet
  end,
  getEnemyDeadNum = function(A0_514)
    local L1_515
    L1_515 = A0_514.enemyDeadNum
    return L1_515
  end,
  isEnemyAllDead = function(A0_516)
    local L2_517
    L2_517 = A0_516.enemyDeadNum
    L2_517 = L2_517 >= #A0_516.spawnSet
    return L2_517
  end
}
enmgen2_root_stairs_03_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      name = "sm22_enemy_root_stairs_03_02_01",
      type = "gellyfish",
      locator = "locator_enemy_root_stairs_03_02_01"
    },
    {
      name = "sm22_enemy_root_stairs_03_02_02",
      type = "gellyfish",
      locator = "locator_enemy_root_stairs_03_02_02"
    }
  },
  onUpdate = function(A0_518)
    local L1_519
  end,
  onEnter = function(A0_520)
    local L1_521
  end,
  onLeave = function(A0_522)
    local L1_523
  end,
  onSpawn = function(A0_524, A1_525)
    A0_524:getSpecTable().enemyDeadNum = A0_524:getSpecTable().enemyDeadNum - 1
    if A0_524:getSpecTable().enemyDeadNum < 0 then
      A0_524:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_526, A1_527)
  end,
  onObjectAsh = function(A0_528, A1_529)
    A0_528:getSpecTable().enemyDeadNum = A0_528:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_530)
    return #A0_530.spawnSet
  end,
  getEnemyDeadNum = function(A0_531)
    local L1_532
    L1_532 = A0_531.enemyDeadNum
    return L1_532
  end,
  isEnemyAllDead = function(A0_533)
    local L2_534
    L2_534 = A0_533.enemyDeadNum
    L2_534 = L2_534 >= #A0_533.spawnSet
    return L2_534
  end
}
enmgen2_root_finish_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 30,
  spawnSet = {
    {
      name = "sm22_enemy_root_finish_03_01",
      type = "runner",
      locator = "locator_enemy_root_finish_01_01"
    },
    {
      name = "sm22_enemy_root_finish_03_02",
      type = "gellyfish",
      locator = "locator_enemy_root_finish_01_02"
    },
    {
      name = "sm22_enemy_root_finish_03_03",
      type = "gellyfish",
      locator = "locator_enemy_root_finish_01_03"
    }
  },
  onUpdate = function(A0_535)
    local L1_536
  end,
  onEnter = function(A0_537)
    local L1_538
  end,
  onLeave = function(A0_539)
    local L1_540
  end,
  onSpawn = function(A0_541, A1_542)
    A0_541:getSpecTable().enemyDeadNum = A0_541:getSpecTable().enemyDeadNum - 1
    if A0_541:getSpecTable().enemyDeadNum < 0 then
      A0_541:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_543, A1_544)
  end,
  onObjectAsh = function(A0_545, A1_546)
    A0_545:getSpecTable().enemyDeadNum = A0_545:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_547)
    return #A0_547.spawnSet
  end,
  getEnemyDeadNum = function(A0_548)
    local L1_549
    L1_549 = A0_548.enemyDeadNum
    return L1_549
  end,
  isEnemyAllDead = function(A0_550)
    local L2_551
    L2_551 = A0_550.enemyDeadNum
    L2_551 = L2_551 >= #A0_550.spawnSet
    return L2_551
  end
}
enmgen2_c_d_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_c_d_01",
      type = "treecannon",
      locator = "locator_enemy_c_d_01"
    },
    {
      name = "sm22_enemy_c_d_02",
      type = "treecannon",
      locator = "locator_enemy_c_d_02"
    },
    {
      name = "sm22_enemy_c_d_03",
      type = "treecannon",
      locator = "locator_enemy_c_d_03"
    }
  },
  onUpdate = function(A0_552)
    local L1_553
  end,
  onEnter = function(A0_554)
    local L1_555
  end,
  onLeave = function(A0_556)
    local L1_557
  end,
  onSpawn = function(A0_558, A1_559)
    A0_558:getSpecTable().enemyDeadNum = A0_558:getSpecTable().enemyDeadNum - 1
    if A0_558:getSpecTable().enemyDeadNum < 0 then
      A0_558:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_560, A1_561)
    _luna_cnt = findGameObject2("EnemyGenerator", "enmgen2_c_d_luna"):getEnemyCount()
    _enemy_cnt = findGameObject2("EnemyGenerator", "enmgen2_c_d_01"):getEnemyCount()
    _total_enemy_cnt = _luna_cnt + _enemy_cnt
    print("_luna_cnt", _luna_cnt)
    print("_enemy_cnt", _enemy_cnt)
    print("_total_enemy_cnt", _total_enemy_cnt)
  end,
  onObjectAsh = function(A0_562, A1_563)
    A0_562:getSpecTable().enemyDeadNum = A0_562:getSpecTable().enemyDeadNum + 1
    _enemy_cnt = _enemy_cnt - 1
    print("\230\174\139\227\130\138\227\129\174\227\131\141\227\131\180\227\130\163\239\188\154", _enemy_cnt)
  end,
  onSetupGem = function(A0_564, A1_565)
    Fn_enemyPopGemSetup(A0_564, {
      "sm22_enemy_c_d_01",
      "sm22_enemy_c_d_03"
    }, 1, 5, "A")
    Fn_enemyPopGemSetup(A0_564, {
      "sm22_enemy_c_d_02"
    }, 1, 6, "B")
  end,
  onPopGem = function(A0_566, A1_567)
    Fn_enemyAshPopGem(A0_566, A1_567, {"A", "B"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_568)
    return #A0_568.spawnSet
  end,
  getEnemyDeadNum = function(A0_569)
    local L1_570
    L1_570 = A0_569.enemyDeadNum
    return L1_570
  end,
  isEnemyAllDead = function(A0_571)
    local L2_572
    L2_572 = A0_571.enemyDeadNum
    L2_572 = L2_572 >= #A0_571.spawnSet
    return L2_572
  end
}
enmgen2_c_d_luna = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm22_enemy_c_d_luna",
      type = "lunafishowner",
      locator = "locator_enemy_c_d_luna",
      ai_spawn_option = "LunaFishOwner/owner_num12"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_enemy_c_d_luna",
      name = "childship_01"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_enemy_c_d_luna",
      name = "lunafish_01"
    }
  },
  onUpdate = function(A0_573)
    local L1_574
  end,
  onEnter = function(A0_575)
    local L1_576
  end,
  onLeave = function(A0_577)
    local L1_578
  end,
  onSpawn = function(A0_579, A1_580)
    A0_579:getSpecTable().enemyDeadNum = A0_579:getSpecTable().enemyDeadNum - 1
    if A0_579:getSpecTable().enemyDeadNum < 0 then
      A0_579:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_581, A1_582)
    _luna_cnt = findGameObject2("EnemyGenerator", "enmgen2_c_d_luna"):getEnemyCount()
    _enemy_cnt = findGameObject2("EnemyGenerator", "enmgen2_c_d_01"):getEnemyCount()
    _total_enemy_cnt = _luna_cnt + _enemy_cnt
    print("_luna_cnt", _luna_cnt)
    print("_enemy_cnt", _enemy_cnt)
    print("_total_enemy_cnt", _total_enemy_cnt)
  end,
  onObjectAsh = function(A0_583, A1_584)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_585)
    return #A0_585.spawnSet
  end,
  getEnemyDeadNum = function(A0_586)
    local L1_587
    L1_587 = A0_586.enemyDeadNum
    return L1_587
  end,
  isEnemyAllDead = function(A0_588)
    local L2_589
    L2_589 = A0_588.enemyDeadNum
    L2_589 = L2_589 >= #A0_588.spawnSet
    return L2_589
  end
}
enmgen2_landingship = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "landingship_01",
      type = "landingship",
      locator = "locator2_landingship"
    }
  },
  onUpdate = function(A0_590)
    local L1_591
  end,
  onEnter = function(A0_592)
    local L1_593
  end,
  onLeave = function(A0_594)
    local L1_595
  end,
  onSpawn = function(A0_596, A1_597)
    _is_ship_spawn_setteled = true
    A0_596:getSpecTable().enemyDeadNum = A0_596:getSpecTable().enemyDeadNum - 1
    if A0_596:getSpecTable().enemyDeadNum < 0 then
      A0_596:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_598, A1_599)
  end,
  onObjectAsh = function(A0_600, A1_601)
    A0_600:getSpecTable().enemyDeadNum = A0_600:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_602)
    return #A0_602.spawnSet
  end,
  getEnemyDeadNum = function(A0_603)
    local L1_604
    L1_604 = A0_603.enemyDeadNum
    return L1_604
  end,
  isEnemyAllDead = function(A0_605)
    local L2_606
    L2_606 = A0_605.enemyDeadNum
    L2_606 = L2_606 >= #A0_605.spawnSet
    return L2_606
  end
}
_enemy_all_spec_tbl = {
  "enmgen2_a_b_01",
  "enmgen2_a_b_02",
  "enmgen2_a_b_03",
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
  "enmgen2_root_cross_01_02",
  "enmgen2_root_cross_01_03",
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
  "enmgen2_root_finish_01",
  "enmgen2_c_d_luna",
  "enmgen2_c_d_01"
}
_enemy_spec_tbl = {
  enmgen2_root_init_01,
  enmgen2_root_init_02,
  enmgen2_root_init_03,
  enmgen2_root_a_init_01,
  enmgen2_root_b_init_01,
  enmgen2_root_b_init_02,
  enmgen2_root_b_init_03,
  enmgen2_root_slope_01,
  enmgen2_root_slope_02,
  enmgen2_root_slope_03,
  enmgen2_root_bridge_01_01,
  enmgen2_root_bridge_01_02,
  enmgen2_root_bridge_02,
  enmgen2_root_water_fountain_01,
  enmgen2_root_water_fountain_02,
  enmgen2_root_cross_01_01,
  enmgen2_root_cross_02,
  enmgen2_root_cross_03,
  enmgen2_root_circle_01,
  enmgen2_root_circle_02,
  enmgen2_root_circle_03,
  enmgen2_root_circle_04,
  enmgen2_root_stairs_01,
  enmgen2_root_stairs_02,
  enmgen2_root_stairs_03,
  enmgen2_root_finish_01
}
function Initialize()
end
function Ingame()
  local L0_607, L1_608, L2_609, L3_610
  L0_607 = findGameObject2
  L1_608 = "EnemyGenerator"
  L2_609 = "enmgen2_root_cross_01_01"
  L0_607 = L0_607(L1_608, L2_609)
  L1_608 = findGameObject2
  L2_609 = "EnemyGenerator"
  L3_610 = "enmgen2_root_cross_02"
  L1_608 = L1_608(L2_609, L3_610)
  L2_609 = findGameObject2
  L3_610 = "EnemyGenerator"
  L2_609 = L2_609(L3_610, "enmgen2_root_stairs_03_01")
  L3_610 = findGameObject2
  L3_610 = L3_610("EnemyGenerator", "enmgen2_root_bridge_02")
  Fn_enemyPopGemSetup(L0_607, {
    "sm22_enemy_root_cross_01_01"
  }, 1, 5, "A")
  Fn_enemyPopGemSetup(L1_608, {
    "sm22_enemy_root_cross_02_01"
  }, 1, 5, "B")
  Fn_enemyPopGemSetup(L2_609, {
    "sm22_enemy_root_stairs_03_01_01"
  }, 1, 5, "C")
  Fn_enemyPopGemSetup(L3_610, {
    "sm22_enemy_root_bridge_02_01"
  }, 1, 5, "D")
  while true do
    if _is_enemy_spawn_request then
      if findGameObject2("EnemyGenerator", _enmgen_name) ~= nil then
        findGameObject2("EnemyGenerator", _enmgen_name):requestSpawn()
        while not findGameObject2("EnemyGenerator", _enmgen_name):isPrepared() do
          wait()
        end
      end
      _is_enemy_spawn_request = false
    end
    if _is_box_delete then
      for _FORV_7_ = 1, #_box_hdl_tbl do
        if _box_hdl_tbl[_FORV_7_] ~= nil then
          if _box_hdl_tbl[_FORV_7_]:getDynamicObject() ~= nil then
            print("\227\130\130\227\129\142\229\143\150\227\130\137\227\130\140\227\129\159\227\130\170\227\131\150\227\130\184\227\130\167\227\130\175\227\131\136\239\188\154kill")
            _box_hdl_tbl[_FORV_7_]:getDynamicObject():kill()
            _box_hdl_tbl[_FORV_7_] = nil
          else
            print("\227\130\130\227\129\142\229\143\150\227\130\137\227\130\140\227\129\166\227\129\170\227\129\132\227\130\170\227\131\150\227\130\184\227\130\167\227\130\175\227\131\136\239\188\154kill")
            _box_hdl_tbl[_FORV_7_]:kill()
            _box_hdl_tbl[_FORV_7_] = nil
          end
        end
      end
      _is_box_delete = false
      print("\231\174\177\227\130\146\229\133\168\233\131\168\230\182\136\227\129\151\227\129\166\227\128\129\227\131\134\227\131\188\227\131\150\227\131\171\227\130\130\229\136\157\230\156\159\229\140\150\227\129\151\227\129\159")
    end
    wait()
  end
end
function Finalize()
  local L0_611, L1_612
end
function requestSpawnEnemy(A0_613)
  local L1_614
  _enmgen_name = A0_613
  _is_enemy_spawn_request = true
  _is_enemy_spawn_settled = true
end
function requestIdleEnemy(A0_615)
  local L1_616, L2_617, L3_618, L4_619, L5_620
  for L4_619, L5_620 in L1_616(L2_617) do
    if findGameObject2("EnemyGenerator", L5_620) ~= nil then
      findGameObject2("EnemyGenerator", L5_620):requestIdlingEnemy(A0_615)
    end
  end
  if A0_615 then
    _is_enemy_idle = true
  else
    _is_enemy_idle = false
  end
end
function requestChangeEnemyMarker(A0_621)
  local L1_622, L2_623, L3_624, L4_625, L5_626
  for L4_625, L5_626 in L1_622(L2_623) do
    if findGameObject2("EnemyGenerator", L5_626) ~= nil then
      findGameObject2("EnemyGenerator", L5_626):setEnemyMarker(A0_621)
    end
  end
  if A0_621 then
    _is_enemy_marker = true
  else
    _is_enemy_marker = false
  end
end
function requestChangeShipMarker(A0_627)
  if findGameObject2("EnemyGenerator", "enmgen2_landingship") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_landingship"):setEnemyMarker(A0_627)
  end
end
function requestIdleShip(A0_628)
  if findGameObject2("EnemyGenerator", "enmgen2_landingship") ~= nil then
    findGameObject2("EnemyGenerator", "enmgen2_landingship"):requestIdlingEnemy(A0_628)
  end
end
function requestDestroyEnemy()
  local L0_629, L1_630, L2_631, L3_632, L4_633
  for L3_632, L4_633 in L0_629(L1_630) do
    if findGameObject2("EnemyGenerator", L4_633) ~= nil then
      findGameObject2("EnemyGenerator", L4_633):requestAllEnemyKill()
    end
  end
end
function requestChangeEnemyInfinite(A0_634, A1_635)
  if findGameObject2("EnemyGenerator", A0_634) ~= nil then
    findGameObject2("EnemyGenerator", A0_634):setAutoRevirthSwitch(A1_635)
  end
end
function requestEnemyGenerator(A0_636)
  return findGameObject2("EnemyGenerator", A0_636)
end
function requestEnemyHandle(A0_637)
  return findGameObject2("Puppet", A0_637)
end
function requestResetEnemyDeadNum()
  for _FORV_3_, _FORV_4_ in ipairs(_enemy_spec_tbl) do
    _FORV_4_.enemyDeadNum = 0
    print("\227\131\170\227\130\187\227\131\131\227\131\136", _FORV_4_.enemyDeadNum)
  end
end
function isSpawnEnemy()
  local L0_638, L1_639
  L0_638 = _is_enemy_spawn_settled
  return L0_638
end
function isSpawnShip()
  local L0_640, L1_641
  L0_640 = _is_ship_spawn_setteled
  return L0_640
end
function isSpawnEnemyEnd()
  local L0_642, L1_643
  L0_642 = _is_enemy_spawn_request
  return L0_642
end
function isIdleEnemy()
  local L0_644, L1_645
  L0_644 = _is_enemy_idlefgur
  return L0_644
end
function isEnemyMarker()
  local L0_646, L1_647
  L0_646 = _is_enemy_marker
  return L0_646
end
function isEnemyGroupAllDead(A0_648)
  for _FORV_4_, _FORV_5_ in pairs(_enemy_all_spec_tbl) do
    if A0_648 == _FORV_5_ and findGameObject2("EnemyGenerator", A0_648) ~= nil then
      return findGameObject2("EnemyGenerator", A0_648):getSpecTable():isEnemyAllDead()
    end
  end
end
function isEnemyGroupAllDead_D()
  local L1_649
  L1_649 = _total_enemy_cnt
  if L1_649 == 0 then
    L1_649 = true
    return L1_649
  end
end
function requestBrain(A0_650)
  return findGameObject2("EnemyBrain", A0_650)
end
function requestCreateBox()
  Area:requestRestore()
end
