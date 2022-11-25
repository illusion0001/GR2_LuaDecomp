dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/dm04_common.lua")
FIELD_01 = 1
FIELD_02 = 2
FIELD_03 = 3
FIELD_04 = 4
FIELD_05 = 5
FIELD_06 = 6
FIELD_07 = 7
FIELD_08 = 8
FIELD_09 = 9
FIELD_MAX = FIELD_09
CHECK_POINT_FRIEND_ATTR_NUM = {3, 6}
dm04_tenebria = false
_black_nevi_count_tbl = {}
_white_nevi_count_tbl = {}
_enmgen_white_special_tbl = {}
_enmgen_black_tbl = {}
_enmgen_white_tbl = {}
_field_attr_tbl = nil
_black_field_hdl_tbl = {}
_white_field_hdl_tbl = {}
dm04_cyanea = nil
dm04_hint_wait = true
dm04_enmgen_b09_01_brain_hdl = nil
dm04_enmgen_b09_02_brain_hdl = nil
enmgen2_white_01_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_shine",
      locator = "locator_w01_special",
      name = "whitenevi_special_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
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
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      A0_12:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_white_02_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_shine",
      locator = "locator_w02_special",
      name = "whitenevi_special_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
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
  onObjectDead = function(A0_24, A1_25)
  end,
  onObjectAsh = function(A0_26, A1_27)
  end,
  onSetupGem = function(A0_28, A1_29)
    Fn_enemyPopGemSetup(A0_28, {
      A0_28:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_30, A1_31)
    Fn_enemyAshPopGem(A0_30, A1_31)
  end
}
enmgen2_white_03_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_shine",
      locator = "locator_w02_special",
      name = "whitenevi_special_03",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
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
  onObjectDead = function(A0_40, A1_41)
  end,
  onObjectAsh = function(A0_42, A1_43)
  end,
  onSetupGem = function(A0_44, A1_45)
    Fn_enemyPopGemSetup(A0_44, {
      A0_44:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_46, A1_47)
    Fn_enemyAshPopGem(A0_46, A1_47)
  end
}
enmgen2_white_04_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_shine",
      locator = "locator_w04_special",
      name = "whitenevi_special_04",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
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
  onObjectDead = function(A0_56, A1_57)
  end,
  onObjectAsh = function(A0_58, A1_59)
  end,
  onSetupGem = function(A0_60, A1_61)
    Fn_enemyPopGemSetup(A0_60, {
      A0_60:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_62, A1_63)
    Fn_enemyAshPopGem(A0_62, A1_63)
  end
}
enmgen2_white_05_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_shine",
      locator = "locator_w05_special",
      name = "whitenevi_special_05",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_64, A1_65)
  end,
  onUpdate = function(A0_66)
    local L1_67
  end,
  onEnter = function(A0_68)
    local L1_69
  end,
  onLeave = function(A0_70)
    local L1_71
  end,
  onObjectDead = function(A0_72, A1_73)
  end,
  onObjectAsh = function(A0_74, A1_75)
  end,
  onSetupGem = function(A0_76, A1_77)
    Fn_enemyPopGemSetup(A0_76, {
      A0_76:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_78, A1_79)
    Fn_enemyAshPopGem(A0_78, A1_79)
  end
}
enmgen2_white_06_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_shine",
      locator = "locator_w06_special",
      name = "whitenevi_special_06",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_80, A1_81)
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
  onObjectAsh = function(A0_90, A1_91)
  end,
  onSetupGem = function(A0_92, A1_93)
    Fn_enemyPopGemSetup(A0_92, {
      A0_92:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_94, A1_95)
    Fn_enemyAshPopGem(A0_94, A1_95)
  end
}
enmgen2_white_07_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_shine",
      locator = "locator_w07_special",
      name = "whitenevi_special_07",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_96, A1_97)
  end,
  onUpdate = function(A0_98)
    local L1_99
  end,
  onEnter = function(A0_100)
    local L1_101
  end,
  onLeave = function(A0_102)
    local L1_103
  end,
  onObjectDead = function(A0_104, A1_105)
  end,
  onObjectAsh = function(A0_106, A1_107)
  end,
  onSetupGem = function(A0_108, A1_109)
    Fn_enemyPopGemSetup(A0_108, {
      A0_108:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_110, A1_111)
    Fn_enemyAshPopGem(A0_110, A1_111)
  end
}
enmgen2_white_08_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_shine",
      locator = "locator_w08_special",
      name = "whitenevi_special_08",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_112, A1_113)
  end,
  onUpdate = function(A0_114)
    local L1_115
  end,
  onEnter = function(A0_116)
    local L1_117
  end,
  onLeave = function(A0_118)
    local L1_119
  end,
  onObjectDead = function(A0_120, A1_121)
  end,
  onObjectAsh = function(A0_122, A1_123)
  end,
  onSetupGem = function(A0_124, A1_125)
    Fn_enemyPopGemSetup(A0_124, {
      A0_124:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_126, A1_127)
    Fn_enemyAshPopGem(A0_126, A1_127)
  end
}
enmgen2_white_09_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_shine",
      locator = "locator_w09_special",
      name = "whitenevi_special_09",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_128, A1_129)
  end,
  onUpdate = function(A0_130)
    local L1_131
  end,
  onEnter = function(A0_132)
    local L1_133
  end,
  onLeave = function(A0_134)
    local L1_135
  end,
  onObjectDead = function(A0_136, A1_137)
  end,
  onObjectAsh = function(A0_138, A1_139)
  end,
  onSetupGem = function(A0_140, A1_141)
    Fn_enemyPopGemSetup(A0_140, {
      A0_140:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_142, A1_143)
    Fn_enemyAshPopGem(A0_142, A1_143)
  end
}
enmgen2_black_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b01_01",
      name = "blacknevi_01_01",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b01_02",
      name = "blacknevi_01_02",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_144, A1_145)
    if A1_145 ~= nil then
      A1_145:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_146)
    local L1_147
  end,
  onEnter = function(A0_148)
    local L1_149
  end,
  onLeave = function(A0_150)
    local L1_151
  end,
  onObjectDead = function(A0_152, A1_153)
  end,
  onObjectAsh = function(A0_154, A1_155)
  end
}
enmgen2_black_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b02_01",
      name = "blacknevi_02_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b02_02",
      name = "blacknevi_02_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_156, A1_157)
    if A1_157 ~= nil then
      A1_157:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_158)
    local L1_159
  end,
  onEnter = function(A0_160)
    local L1_161
  end,
  onLeave = function(A0_162)
    local L1_163
  end,
  onObjectDead = function(A0_164, A1_165)
  end,
  onObjectAsh = function(A0_166, A1_167)
  end
}
enmgen2_black_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b03_01",
      name = "blacknevi_03_01",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b03_02",
      name = "blacknevi_03_02",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_168, A1_169)
    if A1_169 ~= nil then
      A1_169:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_170)
    local L1_171
  end,
  onEnter = function(A0_172)
    local L1_173
  end,
  onLeave = function(A0_174)
    local L1_175
  end,
  onObjectDead = function(A0_176, A1_177)
  end,
  onObjectAsh = function(A0_178, A1_179)
  end
}
enmgen2_black_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b04_01",
      name = "blacknevi_04_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b04_02",
      name = "blacknevi_04_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_180, A1_181)
    if A1_181 ~= nil then
      A1_181:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_182)
    local L1_183
  end,
  onEnter = function(A0_184)
    local L1_185
  end,
  onLeave = function(A0_186)
    local L1_187
  end,
  onObjectDead = function(A0_188, A1_189)
  end,
  onObjectAsh = function(A0_190, A1_191)
  end
}
enmgen2_black_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b05_01",
      name = "blacknevi_05_01",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b05_02",
      name = "blacknevi_05_02",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_192, A1_193)
    if A1_193 ~= nil then
      A1_193:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_194)
    local L1_195
  end,
  onEnter = function(A0_196)
    local L1_197
  end,
  onLeave = function(A0_198)
    local L1_199
  end,
  onObjectDead = function(A0_200, A1_201)
  end,
  onObjectAsh = function(A0_202, A1_203)
  end
}
enmgen2_black_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b06_01",
      name = "blacknevi_06_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b06_02",
      name = "blacknevi_06_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_204, A1_205)
    if A1_205 ~= nil then
      A1_205:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_206)
    local L1_207
  end,
  onEnter = function(A0_208)
    local L1_209
  end,
  onLeave = function(A0_210)
    local L1_211
  end,
  onObjectDead = function(A0_212, A1_213)
  end,
  onObjectAsh = function(A0_214, A1_215)
  end
}
enmgen2_black_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b07_01",
      name = "blacknevi_07_01",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b07_02",
      name = "blacknevi_07_02",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_216, A1_217)
    if A1_217 ~= nil then
      A1_217:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_218)
    local L1_219
  end,
  onEnter = function(A0_220)
    local L1_221
  end,
  onLeave = function(A0_222)
    local L1_223
  end,
  onObjectDead = function(A0_224, A1_225)
  end,
  onObjectAsh = function(A0_226, A1_227)
  end
}
enmgen2_black_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b08_01",
      name = "blacknevi_08_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b08_02",
      name = "blacknevi_08_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_228, A1_229)
    if A1_229 ~= nil then
      A1_229:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_230)
    local L1_231
  end,
  onEnter = function(A0_232)
    local L1_233
  end,
  onLeave = function(A0_234)
    local L1_235
  end,
  onObjectDead = function(A0_236, A1_237)
  end,
  onObjectAsh = function(A0_238, A1_239)
  end
}
enmgen2_black_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b09_01",
      name = "blacknevi_09_01",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b09_02",
      name = "blacknevi_09_02",
      ai_spawn_option = "Runner/Runner_dm04de_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_240, A1_241)
    if A1_241 ~= nil then
      A1_241:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_242)
    local L1_243
  end,
  onEnter = function(A0_244)
    local L1_245
  end,
  onLeave = function(A0_246)
    local L1_247
  end,
  onObjectDead = function(A0_248, A1_249)
  end,
  onObjectAsh = function(A0_250, A1_251)
  end
}
enmgen2_white_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_shine",
      locator = "locator_w01_01",
      name = "whitenevi_01_01",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    },
    {
      type = "runner_shine",
      locator = "locator_w01_02",
      name = "whitenevi_01_02",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_252, A1_253)
  end,
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
  onSetupGem = function(A0_264, A1_265)
    Fn_enemyPopGemSetup(A0_264, {
      A0_264:getSpecTable().spawnSet[1].name,
      A0_264:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_266, A1_267)
    Fn_enemyAshPopGem(A0_266, A1_267)
  end
}
enmgen2_white_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w02_01",
      name = "whitenevi_02_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    },
    {
      type = "stalker_shine",
      locator = "locator_w02_02",
      name = "whitenevi_02_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_268, A1_269)
  end,
  onUpdate = function(A0_270)
    local L1_271
  end,
  onEnter = function(A0_272)
    local L1_273
  end,
  onLeave = function(A0_274)
    local L1_275
  end,
  onObjectDead = function(A0_276, A1_277)
  end,
  onObjectAsh = function(A0_278, A1_279)
  end,
  onSetupGem = function(A0_280, A1_281)
    Fn_enemyPopGemSetup(A0_280, {
      A0_280:getSpecTable().spawnSet[1].name,
      A0_280:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_282, A1_283)
    Fn_enemyAshPopGem(A0_282, A1_283)
  end
}
enmgen2_white_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_shine",
      locator = "locator_w03_01",
      name = "whitenevi_03_01",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    },
    {
      type = "runner_shine",
      locator = "locator_w03_02",
      name = "whitenevi_03_02",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_284, A1_285)
  end,
  onUpdate = function(A0_286)
    local L1_287
  end,
  onEnter = function(A0_288)
    local L1_289
  end,
  onLeave = function(A0_290)
    local L1_291
  end,
  onObjectDead = function(A0_292, A1_293)
  end,
  onObjectAsh = function(A0_294, A1_295)
  end,
  onSetupGem = function(A0_296, A1_297)
    Fn_enemyPopGemSetup(A0_296, {
      A0_296:getSpecTable().spawnSet[1].name,
      A0_296:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_298, A1_299)
    Fn_enemyAshPopGem(A0_298, A1_299)
  end
}
enmgen2_white_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w04_01",
      name = "whitenevi_04_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    },
    {
      type = "stalker_shine",
      locator = "locator_w04_02",
      name = "whitenevi_04_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_300, A1_301)
  end,
  onUpdate = function(A0_302)
    local L1_303
  end,
  onEnter = function(A0_304)
    local L1_305
  end,
  onLeave = function(A0_306)
    local L1_307
  end,
  onObjectDead = function(A0_308, A1_309)
  end,
  onObjectAsh = function(A0_310, A1_311)
  end,
  onSetupGem = function(A0_312, A1_313)
    Fn_enemyPopGemSetup(A0_312, {
      A0_312:getSpecTable().spawnSet[1].name,
      A0_312:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_314, A1_315)
    Fn_enemyAshPopGem(A0_314, A1_315)
  end
}
enmgen2_white_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_shine",
      locator = "locator_w05_01",
      name = "whitenevi_05_01",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    },
    {
      type = "runner_shine",
      locator = "locator_w05_02",
      name = "whitenevi_05_02",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_316, A1_317)
  end,
  onUpdate = function(A0_318)
    local L1_319
  end,
  onEnter = function(A0_320)
    local L1_321
  end,
  onLeave = function(A0_322)
    local L1_323
  end,
  onObjectDead = function(A0_324, A1_325)
  end,
  onObjectAsh = function(A0_326, A1_327)
  end,
  onSetupGem = function(A0_328, A1_329)
    Fn_enemyPopGemSetup(A0_328, {
      A0_328:getSpecTable().spawnSet[1].name,
      A0_328:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_330, A1_331)
    Fn_enemyAshPopGem(A0_330, A1_331)
  end
}
enmgen2_white_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w06_01",
      name = "whitenevi_06_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    },
    {
      type = "stalker_shine",
      locator = "locator_w06_02",
      name = "whitenevi_06_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_332, A1_333)
  end,
  onUpdate = function(A0_334)
    local L1_335
  end,
  onEnter = function(A0_336)
    local L1_337
  end,
  onLeave = function(A0_338)
    local L1_339
  end,
  onObjectDead = function(A0_340, A1_341)
  end,
  onObjectAsh = function(A0_342, A1_343)
  end,
  onSetupGem = function(A0_344, A1_345)
    Fn_enemyPopGemSetup(A0_344, {
      A0_344:getSpecTable().spawnSet[1].name,
      A0_344:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_346, A1_347)
    Fn_enemyAshPopGem(A0_346, A1_347)
  end
}
enmgen2_white_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_shine",
      locator = "locator_w07_01",
      name = "whitenevi_07_01",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    },
    {
      type = "runner_shine",
      locator = "locator_w07_02",
      name = "whitenevi_07_02",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_348, A1_349)
  end,
  onUpdate = function(A0_350)
    local L1_351
  end,
  onEnter = function(A0_352)
    local L1_353
  end,
  onLeave = function(A0_354)
    local L1_355
  end,
  onObjectDead = function(A0_356, A1_357)
  end,
  onObjectAsh = function(A0_358, A1_359)
  end,
  onSetupGem = function(A0_360, A1_361)
    Fn_enemyPopGemSetup(A0_360, {
      A0_360:getSpecTable().spawnSet[1].name,
      A0_360:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_362, A1_363)
    Fn_enemyAshPopGem(A0_362, A1_363)
  end
}
enmgen2_white_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w08_01",
      name = "whitenevi_08_01",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    },
    {
      type = "stalker_shine",
      locator = "locator_w08_02",
      name = "whitenevi_08_02",
      ai_spawn_option = "Stalker/Stalker_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_364, A1_365)
  end,
  onUpdate = function(A0_366)
    local L1_367
  end,
  onEnter = function(A0_368)
    local L1_369
  end,
  onLeave = function(A0_370)
    local L1_371
  end,
  onObjectDead = function(A0_372, A1_373)
  end,
  onObjectAsh = function(A0_374, A1_375)
  end,
  onSetupGem = function(A0_376, A1_377)
    Fn_enemyPopGemSetup(A0_376, {
      A0_376:getSpecTable().spawnSet[1].name,
      A0_376:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_378, A1_379)
    Fn_enemyAshPopGem(A0_378, A1_379)
  end
}
enmgen2_white_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_shine",
      locator = "locator_w09_01",
      name = "whitenevi_09_01",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    },
    {
      type = "runner_shine",
      locator = "locator_w09_02",
      name = "whitenevi_09_02",
      ai_spawn_option = "Runner/Runner_dm04de_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_380, A1_381)
  end,
  onUpdate = function(A0_382)
    local L1_383
  end,
  onEnter = function(A0_384)
    local L1_385
  end,
  onLeave = function(A0_386)
    local L1_387
  end,
  onObjectDead = function(A0_388, A1_389)
  end,
  onObjectAsh = function(A0_390, A1_391)
  end,
  onSetupGem = function(A0_392, A1_393)
    Fn_enemyPopGemSetup(A0_392, {
      A0_392:getSpecTable().spawnSet[1].name,
      A0_392:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_394, A1_395)
    Fn_enemyAshPopGem(A0_394, A1_395)
  end
}
function Initialize()
  local L0_396, L1_397, L2_398, L3_399, L4_400
  L0_396 = {L1_397}
  L1_397.name = "cyanea"
  L1_397.type = "cya01"
  L1_397.node = "locator2_wom_01"
  L1_397(L2_398)
  dm04_cyanea = L1_397
  L1_397(L2_398, L3_399)
  for L4_400 = 1, FIELD_MAX do
    _black_field_hdl_tbl[L4_400] = findGameObject2("GimmickBg", "bg2_field_b" .. string.format("%02d", L4_400))
    _white_field_hdl_tbl[L4_400] = findGameObject2("GimmickBg", "bg2_field_w" .. string.format("%02d", L4_400))
    _enmgen_black_tbl[L4_400] = findGameObject2("EnemyGenerator", "enmgen2_black_" .. string.format("%02d", L4_400))
    _enmgen_white_special_tbl[L4_400] = findGameObject2("EnemyGenerator", "enmgen2_white_" .. string.format("%02d", L4_400) .. "_special")
    _enmgen_white_tbl[L4_400] = findGameObject2("EnemyGenerator", "enmgen2_white_" .. string.format("%02d", L4_400))
    _black_nevi_count_tbl[L4_400] = 0
    _white_nevi_count_tbl[L4_400] = 0
  end
  _field_attr_tbl = L1_397
  if L1_397 == nil then
    _field_attr_tbl = L1_397
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
    L1_397[L2_398] = L3_399
  end
  L1_397(L2_398)
  L1_397(L2_398)
  L1_397(L2_398)
  L1_397(L2_398)
  L1_397(L2_398)
  L1_397(L2_398)
  L1_397(L2_398)
  L1_397(L2_398)
  L1_397(L2_398)
  sdemo1 = L1_397
  L4_400 = "locator2_aim_01"
  L1_397(L2_398, L3_399, L4_400, true)
  L1_397(L2_398)
end
function Ingame()
  Fn_userCtrlAllOff()
  dm_userCtrlCameraOff()
  for _FORV_3_, _FORV_4_ in ipairs(_field_attr_tbl) do
    if _FORV_4_ == FIELD_ATTR_WHITE then
      _white_field_hdl_tbl[_FORV_3_]:setActive(true)
      _black_field_hdl_tbl[_FORV_3_]:setActive(false)
    else
      _white_field_hdl_tbl[_FORV_3_]:setActive(false)
      _black_field_hdl_tbl[_FORV_3_]:setActive(true)
    end
  end
  for _FORV_3_, _FORV_4_ in ipairs(_field_attr_tbl) do
    if _FORV_4_ == FIELD_ATTR_WHITE then
      _enmgen_white_tbl[_FORV_3_]:requestPrepare()
      _enmgen_white_special_tbl[_FORV_3_]:requestPrepare()
    else
      _enmgen_black_tbl[_FORV_3_]:requestPrepare()
    end
  end
  for _FORV_3_, _FORV_4_ in ipairs(_field_attr_tbl) do
    if _FORV_4_ == FIELD_ATTR_WHITE then
      while _enmgen_white_tbl[_FORV_3_]:isPrepared() == false do
        wait()
      end
    else
      while _enmgen_black_tbl[_FORV_3_]:isPrepared() == false do
        wait()
      end
    end
  end
  Fn_sensorOn("spheresensor2_nevi_detector_01")
  Fn_sensorOn("spheresensor2_nevi_detector_02")
  Fn_sensorOn("spheresensor2_nevi_detector_03")
  Fn_sensorOn("spheresensor2_nevi_detector_04")
  Fn_sensorOn("spheresensor2_nevi_detector_05")
  Fn_sensorOn("spheresensor2_nevi_detector_06")
  Fn_sensorOn("spheresensor2_nevi_detector_07")
  Fn_sensorOn("spheresensor2_nevi_detector_08")
  Fn_sensorOn("spheresensor2_nevi_detector_09")
  for _FORV_3_, _FORV_4_ in ipairs(_field_attr_tbl) do
    if _FORV_4_ == FIELD_ATTR_WHITE then
      _enmgen_white_tbl[_FORV_3_]:requestSpawn()
      _enmgen_white_tbl[_FORV_3_]:requestIdlingEnemy(true)
      _enmgen_white_tbl[_FORV_3_]:setAutoRevirthSwitch(true)
      _enmgen_white_special_tbl[_FORV_3_]:requestSpawn()
      _enmgen_white_special_tbl[_FORV_3_]:requestIdlingEnemy(true)
    else
      _enmgen_black_tbl[_FORV_3_]:requestSpawn()
      _enmgen_black_tbl[_FORV_3_]:requestIdlingEnemy(true)
      _enmgen_black_tbl[_FORV_3_]:setAutoRevirthSwitch(true)
      _enmgen_black_tbl[_FORV_3_]:setEnemyMarker(false)
    end
  end
  sdemo1:play(nil, {
    {
      time = 1,
      pos = "locator2_cam_01"
    }
  })
  wait()
  Fn_missionStart()
  waitSeconds(1.5)
  sdemo1:play()
  while sdemo1:isPlay() do
    wait()
  end
  sdemo1:stop(3)
  waitSeconds(4)
  dm04_cyanea:setActive(true)
  Fn_lookAtObjectWait("locator2_cyanea_view")
  waitSeconds(1)
  Fn_kaiwaDemoView("dm04_00210k")
  Fn_disappearNpc("cyanea", 60)
  Fn_missionView("dm04_03000")
  Sound:playSE("cro_260", 1)
  Fn_captionView("dm04_03001")
  Fn_lookAtObjectWait("locator2_battle_view")
  HUD:info("dm04_info_02", false)
  for _FORV_3_, _FORV_4_ in ipairs(_field_attr_tbl) do
    if _FORV_4_ == FIELD_ATTR_WHITE then
      _enmgen_white_tbl[_FORV_3_]:requestIdlingEnemy(false)
      _enmgen_white_special_tbl[_FORV_3_]:requestIdlingEnemy(false)
    else
      _enmgen_black_tbl[_FORV_3_]:requestIdlingEnemy(false)
    end
  end
  Fn_userCtrlOn()
  dm_userCtrlCameraOn()
  while dm04_tenebria == false do
    wait()
  end
  invokeTask(platformColorCheck):abort()
  Fn_sensorOff("spheresensor2_nevi_detector_01")
  Fn_sensorOff("spheresensor2_nevi_detector_02")
  Fn_sensorOff("spheresensor2_nevi_detector_03")
  Fn_sensorOff("spheresensor2_nevi_detector_04")
  Fn_sensorOff("spheresensor2_nevi_detector_05")
  Fn_sensorOff("spheresensor2_nevi_detector_06")
  Fn_sensorOff("spheresensor2_nevi_detector_07")
  Fn_sensorOff("spheresensor2_nevi_detector_08")
  Fn_sensorOff("spheresensor2_nevi_detector_09")
  waitSeconds(3)
  invokeTask(hint_comment):abort()
  Fn_blackout()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_401, L1_402
end
function addCountNevi(A0_403, A1_404)
  if string.match(A1_404, "(blacknevi.*)") ~= nil then
    _black_nevi_count_tbl[A0_403] = _black_nevi_count_tbl[A0_403] + 1
    print(string.format("Enemy Entered field%02d:%d enemies present", A0_403, _black_nevi_count_tbl[A0_403]))
  elseif string.match(A1_404, "(whitenevi.*)") ~= nil then
    _white_nevi_count_tbl[A0_403] = _white_nevi_count_tbl[A0_403] + 1
    print(string.format("Enemy Entered field%02d:%d enemies present", A0_403, _white_nevi_count_tbl[A0_403]))
  end
end
function subCountNevi(A0_405, A1_406)
  if string.match(A1_406, "(blacknevi.*)") ~= nil then
    _black_nevi_count_tbl[A0_405] = _black_nevi_count_tbl[A0_405] - 1
    print(string.format("Enemy Left field%02d:%d enemies present", A0_405, _black_nevi_count_tbl[A0_405]))
  elseif string.match(A1_406, "(whitenevi.*)") ~= nil then
    _white_nevi_count_tbl[A0_405] = _white_nevi_count_tbl[A0_405] - 1
    print(string.format("Enemy Left field%02d:%d enemies present", A0_405, _white_nevi_count_tbl[A0_405]))
  end
end
function spheresensor2_nevi_detector_01_OnEnter(A0_407, A1_408)
  local L2_409, L3_410
  L2_409 = addCountNevi
  L3_410 = FIELD_01
  L2_409(L3_410, A1_408:getName())
end
function spheresensor2_nevi_detector_02_OnEnter(A0_411, A1_412)
  local L2_413, L3_414
  L2_413 = addCountNevi
  L3_414 = FIELD_02
  L2_413(L3_414, A1_412:getName())
end
function spheresensor2_nevi_detector_03_OnEnter(A0_415, A1_416)
  local L2_417, L3_418
  L2_417 = addCountNevi
  L3_418 = FIELD_03
  L2_417(L3_418, A1_416:getName())
end
function spheresensor2_nevi_detector_04_OnEnter(A0_419, A1_420)
  local L2_421, L3_422
  L2_421 = addCountNevi
  L3_422 = FIELD_04
  L2_421(L3_422, A1_420:getName())
end
function spheresensor2_nevi_detector_05_OnEnter(A0_423, A1_424)
  local L2_425, L3_426
  L2_425 = addCountNevi
  L3_426 = FIELD_05
  L2_425(L3_426, A1_424:getName())
end
function spheresensor2_nevi_detector_06_OnEnter(A0_427, A1_428)
  local L2_429, L3_430
  L2_429 = addCountNevi
  L3_430 = FIELD_06
  L2_429(L3_430, A1_428:getName())
end
function spheresensor2_nevi_detector_07_OnEnter(A0_431, A1_432)
  local L2_433, L3_434
  L2_433 = addCountNevi
  L3_434 = FIELD_07
  L2_433(L3_434, A1_432:getName())
end
function spheresensor2_nevi_detector_08_OnEnter(A0_435, A1_436)
  local L2_437, L3_438
  L2_437 = addCountNevi
  L3_438 = FIELD_08
  L2_437(L3_438, A1_436:getName())
end
function spheresensor2_nevi_detector_09_OnEnter(A0_439, A1_440)
  local L2_441, L3_442
  L2_441 = addCountNevi
  L3_442 = FIELD_09
  L2_441(L3_442, A1_440:getName())
end
function spheresensor2_nevi_detector_01_OnLeave(A0_443, A1_444)
  local L2_445, L3_446
  L2_445 = subCountNevi
  L3_446 = FIELD_01
  L2_445(L3_446, A1_444:getName())
end
function spheresensor2_nevi_detector_02_OnLeave(A0_447, A1_448)
  local L2_449, L3_450
  L2_449 = subCountNevi
  L3_450 = FIELD_02
  L2_449(L3_450, A1_448:getName())
end
function spheresensor2_nevi_detector_03_OnLeave(A0_451, A1_452)
  local L2_453, L3_454
  L2_453 = subCountNevi
  L3_454 = FIELD_03
  L2_453(L3_454, A1_452:getName())
end
function spheresensor2_nevi_detector_04_OnLeave(A0_455, A1_456)
  local L2_457, L3_458
  L2_457 = subCountNevi
  L3_458 = FIELD_04
  L2_457(L3_458, A1_456:getName())
end
function spheresensor2_nevi_detector_05_OnLeave(A0_459, A1_460)
  local L2_461, L3_462
  L2_461 = subCountNevi
  L3_462 = FIELD_05
  L2_461(L3_462, A1_460:getName())
end
function spheresensor2_nevi_detector_06_OnLeave(A0_463, A1_464)
  local L2_465, L3_466
  L2_465 = subCountNevi
  L3_466 = FIELD_06
  L2_465(L3_466, A1_464:getName())
end
function spheresensor2_nevi_detector_07_OnLeave(A0_467, A1_468)
  local L2_469, L3_470
  L2_469 = subCountNevi
  L3_470 = FIELD_07
  L2_469(L3_470, A1_468:getName())
end
function spheresensor2_nevi_detector_08_OnLeave(A0_471, A1_472)
  local L2_473, L3_474
  L2_473 = subCountNevi
  L3_474 = FIELD_08
  L2_473(L3_474, A1_472:getName())
end
function spheresensor2_nevi_detector_09_OnLeave(A0_475, A1_476)
  local L2_477, L3_478
  L2_477 = subCountNevi
  L3_478 = FIELD_09
  L2_477(L3_478, A1_476:getName())
end
function PlatformColorCheck()
  local L0_479
  for _FORV_3_ = 1, FIELD_MAX do
    if _field_attr_tbl[_FORV_3_] == FIELD_ATTR_WHITE then
      while _white_nevi_count_tbl[_FORV_3_] == 0 do
        wait()
      end
    else
      while _black_nevi_count_tbl[_FORV_3_] == 0 do
        wait()
      end
    end
  end
  while true do
    for _FORV_4_ = 1, FIELD_MAX do
      if _white_nevi_count_tbl[_FORV_4_] > 0 and _black_nevi_count_tbl[_FORV_4_] == 0 then
        if _field_attr_tbl[_FORV_4_] ~= FIELD_ATTR_WHITE then
          _field_attr_tbl[_FORV_4_] = FIELD_ATTR_WHITE
          _enmgen_white_tbl[_FORV_4_]:requestSpawn()
          _enmgen_white_special_tbl[_FORV_4_]:requestSpawn()
          _white_field_hdl_tbl[_FORV_4_]:setActive(true)
          _black_field_hdl_tbl[_FORV_4_]:setActive(false)
          _enmgen_white_tbl[_FORV_4_]:setAutoRevirthSwitch(true)
          _enmgen_black_tbl[_FORV_4_]:setAutoRevirthSwitch(false)
          flow_comment(false)
        end
      elseif _white_nevi_count_tbl[_FORV_4_] == 0 and _field_attr_tbl[_FORV_4_] ~= FIELD_ATTR_BLACK then
        _field_attr_tbl[_FORV_4_] = FIELD_ATTR_BLACK
        _enmgen_black_tbl[_FORV_4_]:requestSpawn()
        _enmgen_black_tbl[_FORV_4_]:setEnemyMarker(false)
        _white_field_hdl_tbl[_FORV_4_]:setActive(false)
        _black_field_hdl_tbl[_FORV_4_]:setActive(true)
        _enmgen_black_tbl[_FORV_4_]:setAutoRevirthSwitch(true)
        _enmgen_white_tbl[_FORV_4_]:setAutoRevirthSwitch(false)
        flow_comment(true)
      end
    end
    setTowerDefenseCheckPoint(ggd.EventFlags__dm04__flag02, FIELD_ATTR_BLACK, _field_attr_tbl, CHECK_POINT_FRIEND_ATTR_NUM)
    if L0_479 == FIELD_MAX then
      dm04_tenebria = true
      break
    elseif L0_479 == 0 then
      Sound:playSE("cro009b", 1)
      Fn_captionViewWait("dm04_03002")
      Fn_scriptGameOver()
      break
    end
    wait()
  end
end
function flow_comment(A0_480)
  if A0_480 == true then
    dm04_hint_wait = false
    if RandI(1, 5) == 1 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_03003")
    elseif RandI(1, 5) == 2 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_03004")
    elseif RandI(1, 5) == 3 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_03005")
    elseif RandI(1, 5) == 4 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_03006")
    else
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_03007")
    end
  elseif RandI(1, 5) == 1 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_03008")
  elseif RandI(1, 5) == 2 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_03009")
  elseif RandI(1, 5) == 3 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_03010")
  elseif RandI(1, 5) == 4 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_03011")
  else
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_03012")
  end
end
function hint_comment()
  waitSeconds(15)
  if dm04_hint_wait == true then
    Sound:playSE("cro_260", 1)
    Fn_captionView("dm04_03013")
  end
  waitSeconds(30)
  if dm04_hint_wait == true then
    Sound:playSE("cro_260", 1)
    Fn_captionView("dm04_03014")
  end
  waitSeconds(30)
  if dm04_hint_wait == true then
    Sound:playSE("cro_260", 1)
    Fn_captionView("dm04_03015")
  end
end
function outrange_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Sound:playSE("cro_260", 1)
    Fn_captionView("dm04_03016")
  end)
end
