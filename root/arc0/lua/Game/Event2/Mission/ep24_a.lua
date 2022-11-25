dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_isDead = false
_near_elec_flag = false
_stingray_dead_count = 0
_isBreakStingray = false
_isEndTutorial = false
_boss_gauge = nil
_unica_permet_gen = nil
_unica_brain = nil
_permet_brain = nil
_unica_s_brain = nil
_permet_s_brain = nil
_unica_s_pup = nil
_permet_s_pup = nil
_unica_pup = nil
_permet_pup = nil
_elektricity_brain = nil
_elektricity_gen = nil
_enmgen2_01_gen = nil
_enmgen2_02_gen = nil
_enmgen2_03_gen = nil
_enmgen2_04_gen = nil
_enmgen2_05_gen = nil
_stg_02_gen = nil
_stg_03_gen = nil
_stg_04_gen = nil
_stg_05_gen = nil
_isInSensor = false
_sdemo1 = nil
_sdemo2 = nil
_sdemo3 = nil
_warp_caption_flag = false
enmgen2_unica_permet = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stingray_unica",
      locator = "locator_01",
      name = "unica_s",
      ai_spawn_option = "Unica/unica_ep24"
    },
    {
      type = "stingray_permet",
      locator = "locator_02",
      name = "permet_s",
      ai_spawn_option = "Permet/permet_ep24"
    },
    {
      type = "unica_ep24",
      locator = "locator_01",
      name = "unica",
      target_vehicle = "unica_s",
      ai_spawn_option = "Unica/unica_ep24"
    },
    {
      type = "permet_ep24",
      locator = "locator_01",
      name = "permet",
      target_vehicle = "permet_s",
      ai_spawn_option = "Permet/permet_ep24"
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
    _stingray_dead_count = _stingray_dead_count + 1
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end
}
enmgen2_elektricity = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "elektricity",
      locator = "locator_01",
      name = "elektricity",
      ai_spawn_option = "Elektricity/elektricity_ep24_a"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onObjectAsh = function(A0_24, A1_25)
    A0_24:getSpecTable().enemyDeadNum = A0_24:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_26)
    return #A0_26.spawnSet
  end,
  getEnemyDeadNum = function(A0_27)
    local L1_28
    L1_28 = A0_27.enemyDeadNum
    return L1_28
  end,
  getEnemyRest = function(A0_29)
    local L1_30
    L1_30 = A0_29.spawnSet
    L1_30 = #L1_30
    L1_30 = L1_30 - enemyDeadNum
    return L1_30
  end,
  getEnemyName = function(A0_31, A1_32)
    local L2_33
    L2_33 = A0_31.spawnSet
    L2_33 = L2_33[A1_32]
    L2_33 = L2_33.name
    return L2_33
  end,
  countReset = function(A0_34)
    local L1_35
    A0_34.enemyDeadNum = 0
  end
}
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lasercannon_high",
      locator = "locator_01",
      name = "en01_01",
      ai_spawn_option = "LaserCannon/lasercannon_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_02",
      name = "en01_02",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_03",
      name = "en01_03",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_04",
      name = "en01_04",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_07",
      name = "en01_07",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_08",
      name = "en01_08",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
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
  onObjectDead = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
    A0_44:getSpecTable().enemyDeadNum = A0_44:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_46, A1_47)
    Fn_enemyPopGemSetup(A0_46, {
      "en01_01",
      "en01_02",
      "en01_03",
      "en01_04",
      "en01_07",
      "en01_08"
    }, 2, 4, "A")
    Fn_enemyPopGemSetup(A0_46, {
      "en01_01",
      "en01_02",
      "en01_03",
      "en01_04",
      "en01_07",
      "en01_08"
    }, 3, 5, "B")
    Fn_enemyPopGemSetup(A0_46, {
      "en01_01",
      "en01_02",
      "en01_03",
      "en01_04",
      "en01_07",
      "en01_08"
    }, 3, 6, "C")
  end,
  onPopGem = function(A0_48, A1_49)
    Fn_enemyAshPopGem(A0_48, A1_49, {
      "A",
      "B",
      "C"
    })
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_50)
    return #A0_50.spawnSet
  end,
  getEnemyDeadNum = function(A0_51)
    local L1_52
    L1_52 = A0_51.enemyDeadNum
    return L1_52
  end,
  getEnemyRest = function(A0_53)
    local L1_54
    L1_54 = A0_53.spawnSet
    L1_54 = #L1_54
    L1_54 = L1_54 - A0_53.enemyDeadNum
    return L1_54
  end,
  getEnemyName = function(A0_55, A1_56)
    local L2_57
    L2_57 = A0_55.spawnSet
    L2_57 = L2_57[A1_56]
    L2_57 = L2_57.name
    return L2_57
  end,
  countReset = function(A0_58)
    local L1_59
    A0_58.enemyDeadNum = 0
  end
}
enmgen2_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "imp_high",
      locator = "locator_01",
      name = "en02_01",
      ai_spawn_option = "Imp/imp_ep24"
    },
    {
      type = "imp_high",
      locator = "locator_02",
      name = "en02_02",
      ai_spawn_option = "Imp/imp_ep24"
    },
    {
      type = "imp_high",
      locator = "locator_03",
      name = "en02_03",
      ai_spawn_option = "Imp/imp_ep24"
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
  onObjectDead = function(A0_66, A1_67)
  end,
  onObjectAsh = function(A0_68, A1_69)
    A0_68:getSpecTable().enemyDeadNum = A0_68:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_70, A1_71)
    Fn_enemyPopGemSetup(A0_70, {
      "en02_01",
      "en02_02",
      "en02_03"
    }, 2, 4, "A")
    Fn_enemyPopGemSetup(A0_70, {
      "en02_01",
      "en02_02",
      "en02_03"
    }, 3, 5, "B")
    Fn_enemyPopGemSetup(A0_70, {
      "en02_01",
      "en02_02",
      "en02_03"
    }, 3, 6, "C")
  end,
  onPopGem = function(A0_72, A1_73)
    Fn_enemyAshPopGem(A0_72, A1_73, {
      "A",
      "B",
      "C"
    })
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_74)
    return #A0_74.spawnSet
  end,
  getEnemyDeadNum = function(A0_75)
    local L1_76
    L1_76 = A0_75.enemyDeadNum
    return L1_76
  end,
  getEnemyRest = function(A0_77)
    local L1_78
    L1_78 = A0_77.spawnSet
    L1_78 = #L1_78
    L1_78 = L1_78 - A0_77.enemyDeadNum
    return L1_78
  end,
  getEnemyName = function(A0_79, A1_80)
    local L2_81
    L2_81 = A0_79.spawnSet
    L2_81 = L2_81[A1_80]
    L2_81 = L2_81.name
    return L2_81
  end,
  countReset = function(A0_82)
    local L1_83
    A0_82.enemyDeadNum = 0
  end
}
enmgen2_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "gellyfish_high",
      locator = "locator_01",
      name = "en03_01",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
    },
    {
      type = "lasercannon_high",
      locator = "locator_02",
      name = "en03_02",
      ai_spawn_option = "LaserCannon/lasercannon_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_03",
      name = "en03_03",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_04",
      name = "en03_04",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
    },
    {
      type = "gellyfish_high",
      locator = "locator_05",
      name = "en03_05",
      ai_spawn_option = "Gellyfish/gellyfish_ep24"
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
  onObjectDead = function(A0_90, A1_91)
  end,
  onObjectAsh = function(A0_92, A1_93)
    A0_92:getSpecTable().enemyDeadNum = A0_92:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_94, A1_95)
    Fn_enemyPopGemSetup(A0_94, {
      "en03_01",
      "en03_02",
      "en03_03",
      "en03_04",
      "en03_05"
    }, 2, 4, "A")
    Fn_enemyPopGemSetup(A0_94, {
      "en03_01",
      "en03_02",
      "en03_03",
      "en03_04",
      "en03_05"
    }, 5, 5, "B")
    Fn_enemyPopGemSetup(A0_94, {
      "en03_01",
      "en03_02",
      "en03_03",
      "en03_04",
      "en03_05"
    }, 3, 6, "C")
  end,
  onPopGem = function(A0_96, A1_97)
    Fn_enemyAshPopGem(A0_96, A1_97, {
      "A",
      "B",
      "C"
    })
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_98)
    return #A0_98.spawnSet
  end,
  getEnemyDeadNum = function(A0_99)
    local L1_100
    L1_100 = A0_99.enemyDeadNum
    return L1_100
  end,
  getEnemyRest = function(A0_101)
    local L1_102
    L1_102 = A0_101.spawnSet
    L1_102 = #L1_102
    L1_102 = L1_102 - A0_101.enemyDeadNum
    return L1_102
  end,
  getEnemyName = function(A0_103, A1_104)
    local L2_105
    L2_105 = A0_103.spawnSet
    L2_105 = L2_105[A1_104]
    L2_105 = L2_105.name
    return L2_105
  end,
  countReset = function(A0_106)
    local L1_107
    A0_106.enemyDeadNum = 0
  end
}
enmgen2_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "lasercannon_high",
      locator = "locator_04",
      name = "en04_04",
      ai_spawn_option = "LaserCannon/lasercannon_ep24"
    },
    {
      type = "imp_high",
      locator = "locator_05",
      name = "en04_05",
      ai_spawn_option = "Imp/imp_ep24"
    },
    {
      type = "imp_high",
      locator = "locator_06",
      name = "en04_06",
      ai_spawn_option = "Imp/imp_ep24"
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
  onObjectDead = function(A0_114, A1_115)
  end,
  onObjectAsh = function(A0_116, A1_117)
    A0_116:getSpecTable().enemyDeadNum = A0_116:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_118, A1_119)
    Fn_enemyPopGemSetup(A0_118, {
      "en04_04",
      "en04_05",
      "en04_06"
    }, 2, 4, "A")
    Fn_enemyPopGemSetup(A0_118, {
      "en04_04",
      "en04_05",
      "en04_06"
    }, 3, 5, "B")
    Fn_enemyPopGemSetup(A0_118, {
      "en04_04",
      "en04_05",
      "en04_06"
    }, 3, 6, "C")
  end,
  onPopGem = function(A0_120, A1_121)
    Fn_enemyAshPopGem(A0_120, A1_121, {
      "A",
      "B",
      "C"
    })
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_122)
    return #A0_122.spawnSet
  end,
  getEnemyDeadNum = function(A0_123)
    local L1_124
    L1_124 = A0_123.enemyDeadNum
    return L1_124
  end,
  getEnemyRest = function(A0_125)
    local L1_126
    L1_126 = A0_125.spawnSet
    L1_126 = #L1_126
    L1_126 = L1_126 - A0_125.enemyDeadNum
    return L1_126
  end,
  getEnemyName = function(A0_127, A1_128)
    local L2_129
    L2_129 = A0_127.spawnSet
    L2_129 = L2_129[A1_128]
    L2_129 = L2_129.name
    return L2_129
  end,
  countReset = function(A0_130)
    local L1_131
    A0_130.enemyDeadNum = 0
  end
}
enmgen2_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_01",
      name = "en05_01",
      ai_spawn_option = "LunaFishOwner/owner_ep24"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish_high",
      locator = "locator_01",
      name = "lunafish01"
    }
  },
  onUpdate = function(A0_132)
    local L1_133
  end,
  onEnter = function(A0_134)
    local L1_135
  end,
  onLeave = function(A0_136)
    local L1_137
  end,
  onObjectDead = function(A0_138, A1_139)
  end,
  onObjectAsh = function(A0_140, A1_141)
    A0_140:getSpecTable().enemyDeadNum = A0_140:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_142, A1_143)
    Fn_enemyPopGemSetup(A0_142, {"lunafish01"}, 3, 4, "A")
    Fn_enemyPopGemSetup(A0_142, {"lunafish01"}, 5, 5, "B")
    Fn_enemyPopGemSetup(A0_142, {"lunafish01"}, 4, 6, "C")
  end,
  onPopGem = function(A0_144, A1_145)
    Fn_enemyAshPopGem(A0_144, A1_145, {
      "A",
      "B",
      "C"
    })
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_146)
    return #A0_146.spawnSet
  end,
  getEnemyDeadNum = function(A0_147)
    local L1_148
    L1_148 = A0_147.enemyDeadNum
    return L1_148
  end,
  getEnemyRest = function(A0_149)
    local L1_150
    L1_150 = A0_149.spawnSet
    L1_150 = #L1_150
    L1_150 = L1_150 - A0_149.enemyDeadNum
    return L1_150
  end,
  getEnemyName = function(A0_151, A1_152)
    local L2_153
    L2_153 = A0_151.spawnSet
    L2_153 = L2_153[A1_152]
    L2_153 = L2_153.name
    return L2_153
  end,
  countReset = function(A0_154)
    local L1_155
    A0_154.enemyDeadNum = 0
  end
}
enmgen2_stg_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stingray",
      locator = "locator_01",
      name = "en02_stg_01",
      ai_spawn_option = "Stingray/stingray_ep24"
    },
    {
      type = "stingray",
      locator = "locator_02",
      name = "en02_stg_02",
      ai_spawn_option = "Stingray/stingray_ep24"
    },
    {
      type = "terrorist",
      locator = "locator_01",
      name = "en02_stg_01_a",
      target_vehicle = "en02_stg_01"
    },
    {
      type = "terrorist",
      locator = "locator_02",
      name = "en02_stg_02_a",
      target_vehicle = "en02_stg_02"
    }
  },
  onUpdate = function(A0_156)
    local L1_157
  end,
  onEnter = function(A0_158)
    local L1_159
  end,
  onLeave = function(A0_160)
    local L1_161
  end,
  onObjectDead = function(A0_162, A1_163)
  end,
  onObjectAsh = function(A0_164, A1_165)
    A0_164:getSpecTable().enemyDeadNum = A0_164:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_166)
    return #A0_166.spawnSet
  end,
  getEnemyDeadNum = function(A0_167)
    local L1_168
    L1_168 = A0_167.enemyDeadNum
    return L1_168
  end,
  getEnemyRest = function(A0_169)
    local L1_170
    L1_170 = A0_169.spawnSet
    L1_170 = #L1_170
    L1_170 = L1_170 - A0_169.enemyDeadNum
    return L1_170
  end,
  getEnemyName = function(A0_171, A1_172)
    local L2_173
    L2_173 = A0_171.spawnSet
    L2_173 = L2_173[A1_172]
    L2_173 = L2_173.name
    return L2_173
  end,
  countReset = function(A0_174)
    local L1_175
    A0_174.enemyDeadNum = 0
  end
}
enmgen2_stg_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stingray",
      locator = "locator_01",
      name = "en03_stg_01",
      ai_spawn_option = "Stingray/stingray_ep24"
    },
    {
      type = "terrorist",
      locator = "locator_01",
      name = "en03_stg_01_a",
      target_vehicle = "en03_stg_01"
    }
  },
  onUpdate = function(A0_176)
    local L1_177
  end,
  onEnter = function(A0_178)
    local L1_179
  end,
  onLeave = function(A0_180)
    local L1_181
  end,
  onObjectDead = function(A0_182, A1_183)
  end,
  onObjectAsh = function(A0_184, A1_185)
    A0_184:getSpecTable().enemyDeadNum = A0_184:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_186)
    return #A0_186.spawnSet
  end,
  getEnemyDeadNum = function(A0_187)
    local L1_188
    L1_188 = A0_187.enemyDeadNum
    return L1_188
  end,
  getEnemyRest = function(A0_189)
    local L1_190
    L1_190 = A0_189.spawnSet
    L1_190 = #L1_190
    L1_190 = L1_190 - A0_189.enemyDeadNum
    return L1_190
  end,
  getEnemyName = function(A0_191, A1_192)
    local L2_193
    L2_193 = A0_191.spawnSet
    L2_193 = L2_193[A1_192]
    L2_193 = L2_193.name
    return L2_193
  end,
  countReset = function(A0_194)
    local L1_195
    A0_194.enemyDeadNum = 0
  end
}
enmgen2_stg_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stingray",
      locator = "locator_01",
      name = "en04_stg_01",
      ai_spawn_option = "Stingray/stingray_ep24"
    },
    {
      type = "stingray",
      locator = "locator_02",
      name = "en04_stg_02",
      ai_spawn_option = "Stingray/stingray_ep24"
    },
    {
      type = "terrorist",
      locator = "locator_01",
      name = "en04_stg_01_a",
      target_vehicle = "en04_stg_01"
    },
    {
      type = "terrorist",
      locator = "locator_02",
      name = "en04_stg_02_a",
      target_vehicle = "en04_stg_02"
    }
  },
  onUpdate = function(A0_196)
    local L1_197
  end,
  onEnter = function(A0_198)
    local L1_199
  end,
  onLeave = function(A0_200)
    local L1_201
  end,
  onObjectDead = function(A0_202, A1_203)
  end,
  onObjectAsh = function(A0_204, A1_205)
    A0_204:getSpecTable().enemyDeadNum = A0_204:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_206)
    return #A0_206.spawnSet
  end,
  getEnemyDeadNum = function(A0_207)
    local L1_208
    L1_208 = A0_207.enemyDeadNum
    return L1_208
  end,
  getEnemyRest = function(A0_209)
    local L1_210
    L1_210 = A0_209.spawnSet
    L1_210 = #L1_210
    L1_210 = L1_210 - A0_209.enemyDeadNum
    return L1_210
  end,
  getEnemyName = function(A0_211, A1_212)
    local L2_213
    L2_213 = A0_211.spawnSet
    L2_213 = L2_213[A1_212]
    L2_213 = L2_213.name
    return L2_213
  end,
  countReset = function(A0_214)
    local L1_215
    A0_214.enemyDeadNum = 0
  end
}
enmgen2_stg_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stingray",
      locator = "locator_01",
      name = "en05_stg_01",
      ai_spawn_option = "Stingray/stingray_ep24"
    },
    {
      type = "terrorist",
      locator = "locator_01",
      name = "en05_stg_01_a",
      target_vehicle = "en05_stg_01"
    }
  },
  onUpdate = function(A0_216)
    local L1_217
  end,
  onEnter = function(A0_218)
    local L1_219
  end,
  onLeave = function(A0_220)
    local L1_221
  end,
  onObjectDead = function(A0_222, A1_223)
  end,
  onObjectAsh = function(A0_224, A1_225)
    A0_224:getSpecTable().enemyDeadNum = A0_224:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_226)
    return #A0_226.spawnSet
  end,
  getEnemyDeadNum = function(A0_227)
    local L1_228
    L1_228 = A0_227.enemyDeadNum
    return L1_228
  end,
  getEnemyRest = function(A0_229)
    local L1_230
    L1_230 = A0_229.spawnSet
    L1_230 = #L1_230
    L1_230 = L1_230 - A0_229.enemyDeadNum
    return L1_230
  end,
  getEnemyName = function(A0_231, A1_232)
    local L2_233
    L2_233 = A0_231.spawnSet
    L2_233 = L2_233[A1_232]
    L2_233 = L2_233.name
    return L2_233
  end,
  countReset = function(A0_234)
    local L1_235
    A0_234.enemyDeadNum = 0
  end
}
function Initialize()
  local L0_236, L1_237, L2_238, L3_239
  L0_236 = Fn_pcSensorOff
  L1_237 = "pccubesensor2_CatWarp_in1"
  L0_236(L1_237)
  L0_236 = Fn_pcSensorOff
  L1_237 = "pccubesensor2_CatWarp_mid1"
  L0_236(L1_237)
  L0_236 = Fn_pcSensorOff
  L1_237 = "pccubesensor2_CatWarp_out1"
  L0_236(L1_237)
  L0_236 = SDemo
  L0_236 = L0_236.create
  L1_237 = "ep24_a_01"
  L0_236 = L0_236(L1_237)
  _sdemo1 = L0_236
  L0_236 = SDemo
  L0_236 = L0_236.create
  L1_237 = "ep24_a_02"
  L0_236 = L0_236(L1_237)
  _sdemo2 = L0_236
  L0_236 = SDemo
  L0_236 = L0_236.create
  L1_237 = "ep24_a_03"
  L0_236 = L0_236(L1_237)
  _sdemo3 = L0_236
  L0_236 = _sdemo1
  L1_237 = L0_236
  L0_236 = L0_236.set
  L2_238 = "locator2_sdemo_cam_pos_01"
  L3_239 = "locator2_sdemo_aim_pos_01"
  L0_236(L1_237, L2_238, L3_239)
  L0_236 = _sdemo1
  L1_237 = L0_236
  L0_236 = L0_236.setCameraParam
  L2_238 = nil
  L3_239 = 0.1
  L0_236(L1_237, L2_238, L3_239, {deg = 35})
  L0_236 = _sdemo2
  L1_237 = L0_236
  L0_236 = L0_236.set
  L2_238 = "locator2_sdemo_cam_pos_03"
  L3_239 = "locator2_sdemo_aim_pos_03"
  L0_236(L1_237, L2_238, L3_239)
  L0_236 = _sdemo2
  L1_237 = L0_236
  L0_236 = L0_236.setCameraParam
  L2_238 = nil
  L3_239 = 0.1
  L0_236(L1_237, L2_238, L3_239, {deg = 33})
  L0_236 = _sdemo3
  L1_237 = L0_236
  L0_236 = L0_236.set
  L2_238 = "locator2_sdemo_cam_pos_04"
  L3_239 = "locator2_sdemo_aim_pos_04"
  L0_236(L1_237, L2_238, L3_239)
  L0_236 = _sdemo3
  L1_237 = L0_236
  L0_236 = L0_236.setCameraParam
  L2_238 = nil
  L3_239 = 0.1
  L0_236(L1_237, L2_238, L3_239, {deg = 33})
  L0_236 = Fn_cityPlaceName
  L1_237 = false
  L0_236(L1_237)
  L0_236 = Player
  L1_237 = L0_236
  L0_236 = L0_236.muteVoice
  L2_238 = Player
  L2_238 = L2_238.kVoiceMuteLv_All
  L0_236(L1_237, L2_238)
  L0_236 = findGameObject2
  L1_237 = "Node"
  L2_238 = "locator2_xii_start_pos"
  L0_236 = L0_236(L1_237, L2_238)
  L1_237 = L0_236
  L0_236 = L0_236.getWorldTransform
  L1_237 = L0_236(L1_237)
  L2_238 = Fn_warpXii
  L3_239 = L0_236
  L2_238(L3_239, L1_237)
  L2_238 = Fn_disableCostumeChange
  L3_239 = true
  L2_238(L3_239)
end
function Ingame()
  local L0_240, L1_241, L2_242, L3_243, L4_244, L5_245, L6_246, L7_247, L8_248, L9_249
  L0_240 = {}
  L0_240 = L1_241
  for L4_244, L5_245 in L1_241(L2_242) do
    L8_248 = false
    L6_246(L7_247, L8_248)
    L8_248 = false
    L6_246(L7_247, L8_248)
  end
  L2_242(L3_243, L4_244)
  L2_242(L3_243, L4_244)
  L3_243(L4_244, L5_245)
  L3_243(L4_244, L5_245)
  _elektricity_brain = L3_243
  L3_243(L4_244, L5_245)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244()
  L4_244()
  L8_248 = 10
  L9_249 = true
  L4_244(L5_245, L6_246, L7_247, L8_248, L9_249)
  L8_248 = 30
  L9_249 = false
  L4_244(L5_245, L6_246, L7_247, L8_248, L9_249)
  L8_248 = 30
  L9_249 = false
  L4_244(L5_245, L6_246, L7_247, L8_248, L9_249)
  L8_248 = 30
  L9_249 = false
  L4_244(L5_245, L6_246, L7_247, L8_248, L9_249)
  L8_248 = 30
  L9_249 = false
  L4_244(L5_245, L6_246, L7_247, L8_248, L9_249)
  _unica_permet_gen = L4_244
  L4_244(L5_245, L6_246)
  _unica_s_brain = L4_244
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  _unica_brain = L4_244
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  _unica_s_pup = L4_244
  _unica_pup = L4_244
  _permet_s_brain = L4_244
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  _permet_brain = L4_244
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  _permet_s_pup = L4_244
  _permet_pup = L4_244
  L4_244(L5_245, L6_246)
  _enmgen2_01_gen = L4_244
  _enmgen2_02_gen = L4_244
  _enmgen2_03_gen = L4_244
  _enmgen2_04_gen = L4_244
  _enmgen2_05_gen = L4_244
  _stg_02_gen = L4_244
  _stg_03_gen = L4_244
  _stg_04_gen = L4_244
  _stg_05_gen = L4_244
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  L4_244(L5_245, L6_246)
  for L7_247 = 1, 4 do
    L8_248 = findGameObject2
    L9_249 = "EnemyBrain"
    L8_248 = L8_248(L9_249, "en01_" .. string.format("%02d", L7_247))
    L9_249 = L8_248.skipSpawnMotion
    L9_249(L8_248, true)
  end
  for L7_247 = 7, 8 do
    L8_248 = findGameObject2
    L9_249 = "EnemyBrain"
    L8_248 = L8_248(L9_249, "en01_" .. string.format("%02d", L7_247))
    L9_249 = L8_248.skipSpawnMotion
    L9_249(L8_248, true)
  end
  L4_244(L5_245)
  L4_244[1] = L5_245
  L4_244[2] = L5_245
  L4_244[3] = L5_245
  L4_244[4] = L5_245
  L4_244[5] = L5_245
  L4_244[6] = L5_245
  L4_244[7] = L5_245
  L4_244[8] = L5_245
  L4_244[9] = L5_245
  L4_244[10] = L5_245
  L4_244[11] = L5_245
  L4_244[12] = L5_245
  for L8_248 = 1, 12 do
    L9_249 = L4_244[L8_248]
    L9_249 = L9_249.setEnableHomingTarget
    L9_249(L9_249, false)
    L9_249 = print
    L9_249("setEnableHomingTarget", L8_248)
  end
  _elektricity_gen = L5_245
  L5_245(L6_246, L7_247)
  L5_245()
  L5_245(L6_246, L7_247)
  L6_246.pos = "locator2_sdemo_cam_pos_02"
  L6_246.time = 4
  L6_246.hashfunc = "Linear"
  L7_247.pos = "locator2_sdemo_aim_pos_02"
  L7_247.time = 4
  L7_247.hashfunc = "Linear"
  L8_248 = L7_247
  L7_247(L8_248)
  L8_248 = Fn_missionStart
  L9_249 = L7_247
  L8_248(L9_249)
  L8_248 = invokeTask
  function L9_249()
    local L0_250
    while true do
      L0_250 = _permet_s_brain
      L0_250 = L0_250.isReadyEnemy
      L0_250 = L0_250(L0_250)
      if L0_250 == false then
        L0_250 = wait
        L0_250()
      end
    end
    L0_250 = _permet_s_brain
    L0_250 = L0_250.cmd
    L0_250(L0_250, "UseMissile", false)
    while true do
      L0_250 = _permet_brain
      L0_250 = L0_250.isReadyEnemy
      L0_250 = L0_250(L0_250)
      if L0_250 == false then
        L0_250 = wait
        L0_250()
      end
    end
    L0_250 = _permet_brain
    L0_250 = L0_250.eventMessage
    L0_250 = L0_250(L0_250, "SetEnableMicroMissile", false)
    print("\227\131\154\227\131\171\227\131\161\227\129\174\227\131\158\227\130\164\227\130\175\227\131\173\227\131\159\227\130\181\227\130\164\227\131\171\231\166\129\230\173\162\227\129\174\230\136\144\229\144\166\229\136\164\229\174\154", L0_250)
  end
  L8_248(L9_249)
  L8_248 = wait
  L9_249 = 90
  L8_248(L9_249)
  L8_248 = _sdemo2
  L9_249 = L8_248
  L8_248 = L8_248.play
  L8_248(L9_249)
  L8_248 = wait
  L9_249 = 30
  L8_248(L9_249)
  L8_248 = Fn_captionView
  L9_249 = "ep24_00100"
  L8_248(L9_249, 3)
  L8_248 = wait
  L9_249 = 90
  L8_248(L9_249)
  L8_248 = _sdemo3
  L9_249 = L8_248
  L8_248 = L8_248.play
  L8_248(L9_249)
  L8_248 = wait
  L9_249 = 10
  L8_248(L9_249)
  L8_248 = _sdemo3
  L9_249 = L8_248
  L8_248 = L8_248.stop
  L8_248(L9_249)
  L8_248 = Player
  L9_249 = L8_248
  L8_248 = L8_248.muteVoice
  L8_248(L9_249, Player.kVoiceMuteLv_NoMute)
  L8_248 = Fn_resetCoercionPose
  L8_248()
  L8_248 = Player
  L9_249 = L8_248
  L8_248 = L8_248.setEnergy
  L8_248(L9_249, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
  L8_248 = findGameObject2
  L9_249 = "Node"
  L8_248 = L8_248(L9_249, "locator2_look_01")
  L9_249 = findGameObject2
  L9_249 = L9_249("Node", "locator2_navi_01")
  Fn_naviSet(L9_249)
  Camera:lookTo(L8_248:getWorldPos(), 0, 1)
  _elektricity_gen:setEnemyMarker(true)
  breakLightningRod()
  invokeTask(function()
    while _near_elec_flag == false do
      wait()
    end
    Fn_naviKill()
    _elektricity_brain:setInvincibility(false)
    HPgauge("elektricity")
    Fn_setBgmPoint("battle", "bgmPoint2")
  end)
  Fn_userCtrlOn()
  _enmgen2_01_gen:setEnemyMarker(true)
  _enmgen2_02_gen:setEnemyMarker(true)
  _enmgen2_03_gen:setEnemyMarker(true)
  _enmgen2_04_gen:setEnemyMarker(true)
  _enmgen2_05_gen:setEnemyMarker(true)
  Fn_missionView("ep24_00101")
  HUD:info("ep24_info_01")
  repeat
    wait()
  until _isDead and _isEndTutorial
  Fn_whiteout(0.3)
  _boss_gauge:setActive(false)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function HPgauge(A0_251)
  invokeTask(function()
    local L0_252, L1_253
    L0_252 = false
    L1_253 = false
    _boss_gauge = HUD:createBossHpGauge({
      obj = findGameObject2("Puppet", A0_251)
    })
    _boss_gauge:setActive(true)
    while true do
      if findGameObject2("EnemyBrain", A0_251):getHealth() < findGameObject2("EnemyBrain", A0_251):getMaxHealth() / 4 and _isDead == false and _isEndTutorial then
        _isDead = true
      end
      if findGameObject2("EnemyBrain", A0_251):getHealth() <= findGameObject2("EnemyBrain", A0_251):getMaxHealth() / 4 + 2 and L0_252 == false and _isBreakStingray == false then
        findGameObject2("EnemyBrain", A0_251):setInvincibility(true)
        L0_252 = true
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\132\161\230\149\181")
      elseif L0_252 and _isBreakStingray then
        findGameObject2("EnemyBrain", A0_251):setInvincibility(false)
        L0_252 = false
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\132\161\230\149\181\232\167\163\233\153\164")
      end
      if findGameObject2("EnemyBrain", A0_251):getHealth() <= findGameObject2("EnemyBrain", A0_251):getMaxHealth() / 20 and L1_253 == false and _isEndTutorial == false then
        findGameObject2("EnemyBrain", A0_251):setInvincibility(true)
        L1_253 = true
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\132\161\230\149\181")
      elseif L1_253 and _isEndTutorial then
        findGameObject2("EnemyBrain", A0_251):setInvincibility(false)
        L1_253 = false
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\132\161\230\149\181\232\167\163\233\153\164")
      end
      _boss_gauge:setHp((findGameObject2("EnemyBrain", A0_251):getHealth() + findGameObject2("EnemyBrain", A0_251):getMaxHealth() + findGameObject2("EnemyBrain", A0_251):getMaxHealth()) / (findGameObject2("EnemyBrain", A0_251):getMaxHealth() + findGameObject2("EnemyBrain", A0_251):getMaxHealth() + findGameObject2("EnemyBrain", A0_251):getMaxHealth()))
      wait()
    end
  end)
end
function captionUniPer()
  invokeTask(function()
    local L0_254, L1_255, L2_256, L3_257, L4_258, L5_259, L6_260, L7_261, L8_262, L9_263, L10_264, L11_265, L12_266
    L0_254 = findGameObject2
    L1_255 = "Puppet"
    L2_256 = "elektricity"
    L0_254 = L0_254(L1_255, L2_256)
    L1_255 = 0
    L2_256 = 0
    L3_257 = false
    L4_258 = false
    L5_259 = false
    while true do
      if L1_255 == 0 then
        L6_260 = Fn_captionViewWait
        L7_261 = "ep24_00102"
        L6_260(L7_261)
        L6_260 = Sound
        L7_261 = L6_260
        L6_260 = L6_260.playSE
        L8_262 = "pc2_094"
        L9_263 = 1
        L6_260(L7_261, L8_262, L9_263)
        L6_260 = Fn_captionViewWait
        L7_261 = "ep24_00103"
        L6_260(L7_261)
        L6_260 = Fn_captionViewWait
        L7_261 = "ep24_00104"
        L6_260(L7_261)
        L6_260 = Fn_captionViewWait
        L7_261 = "ep24_00105"
        L6_260(L7_261)
        L6_260 = Sound
        L7_261 = L6_260
        L6_260 = L6_260.playSE
        L8_262 = "pc2_049"
        L9_263 = 1
        L6_260(L7_261, L8_262, L9_263)
        L6_260 = Fn_captionViewWait
        L7_261 = "ep24_00106"
        L6_260(L7_261)
        L1_255 = 1
        L2_256 = 0
      elseif L1_255 == 1 and L2_256 >= 150 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "SetReservationActionScriptLightning"
        L9_263 = _unica_s_pup
        L6_260 = L6_260(L7_261, L8_262, L9_263)
        L7_261 = print
        L8_262 = "\227\131\166\227\131\139\227\130\171\227\129\174\227\130\185\227\131\134\227\130\163\227\131\179\227\130\176\227\131\172\227\130\164\227\129\171\232\144\189\233\155\183\228\186\136\231\180\132\230\136\144\229\144\166"
        L9_263 = L6_260
        L7_261(L8_262, L9_263)
        L7_261 = 0
        while true do
          L8_262 = _elektricity_brain
          L9_263 = L8_262
          L8_262 = L8_262.eventMessage
          L10_264 = "IsScriptLightning"
          L8_262 = L8_262(L9_263, L10_264)
          if L8_262 == false then
            L8_262 = wait
            L8_262()
            L7_261 = L7_261 + 1
            if L7_261 >= 210 then
              L8_262 = _elektricity_brain
              L9_263 = L8_262
              L8_262 = L8_262.eventMessage
              L10_264 = "SetReservationActionScriptLightning"
              L11_265 = _unica_s_pup
              L8_262 = L8_262(L9_263, L10_264, L11_265)
              L9_263 = print
              L10_264 = "\227\131\166\227\131\139\227\130\171\227\129\174\227\130\185\227\131\134\227\130\163\227\131\179\227\130\176\227\131\172\227\130\164\227\129\171\232\144\189\233\155\183\228\186\136\231\180\132\230\136\144\229\144\166"
              L11_265 = L8_262
              L9_263(L10_264, L11_265)
              L7_261 = 0
            end
          end
        end
        L8_262 = wait
        L8_262()
        L8_262 = _unica_s_brain
        L9_263 = L8_262
        L8_262 = L8_262.cmd
        L10_264 = "ForceDead"
        L8_262(L9_263, L10_264)
        L8_262 = Sound
        L9_263 = L8_262
        L8_262 = L8_262.playSE
        L10_264 = "ene_stingray_ep24_exp"
        L11_265 = 1
        L12_266 = ""
        L8_262(L9_263, L10_264, L11_265, L12_266, _unica_s_pup)
        L8_262 = Fn_createEffect
        L9_263 = "exp"
        L10_264 = "ef_com_exp_01"
        L11_265 = _unica_s_pup
        L12_266 = L11_265
        L11_265 = L11_265.getWorldPos
        L11_265 = L11_265(L12_266)
        L12_266 = false
        L8_262(L9_263, L10_264, L11_265, L12_266)
        L8_262 = invokeTask
        function L9_263()
          wait(2)
          _unica_brain:setEnableHomingTarget(false)
        end
        L8_262(L9_263)
        L8_262 = Sound
        L9_263 = L8_262
        L8_262 = L8_262.playSE
        L10_264 = "ene_yunica_vo_escape"
        L11_265 = 1
        L8_262(L9_263, L10_264, L11_265)
        L8_262 = Fn_captionViewWait
        L9_263 = "ep24_00107"
        L8_262(L9_263)
        L8_262 = math
        L8_262 = L8_262.random
        L9_263 = 1
        L10_264 = 2
        L8_262 = L8_262(L9_263, L10_264)
        if L8_262 == 1 then
          L9_263 = Sound
          L10_264 = L9_263
          L9_263 = L9_263.playSE
          L11_265 = "ene_permet_vo_talk_4"
          L12_266 = 1
          L9_263(L10_264, L11_265, L12_266)
          L9_263 = Fn_captionViewWait
          L10_264 = "ep24_00117"
          L9_263(L10_264)
          L9_263 = Sound
          L10_264 = L9_263
          L9_263 = L9_263.playSE
          L11_265 = "ene_yunica_vo_talk_4"
          L12_266 = 1
          L9_263(L10_264, L11_265, L12_266)
          L9_263 = Fn_captionViewWait
          L10_264 = "ep24_00118"
          L9_263(L10_264)
        else
          L9_263 = Sound
          L10_264 = L9_263
          L9_263 = L9_263.playSE
          L11_265 = "ene_permet_vo_talk_3"
          L12_266 = 1
          L9_263(L10_264, L11_265, L12_266)
          L9_263 = Fn_captionViewWait
          L10_264 = "ep24_00119"
          L9_263(L10_264)
          L9_263 = Sound
          L10_264 = L9_263
          L9_263 = L9_263.playSE
          L11_265 = "ene_yunica_vo_talk_3"
          L12_266 = 1
          L9_263(L10_264, L11_265, L12_266)
          L9_263 = Fn_captionViewWait
          L10_264 = "ep24_00120"
          L9_263(L10_264)
        end
        L9_263 = _elektricity_brain
        L10_264 = L9_263
        L9_263 = L9_263.eventMessage
        L11_265 = "SetReservationActionScriptLightning"
        L12_266 = _permet_s_pup
        L9_263 = L9_263(L10_264, L11_265, L12_266)
        L10_264 = print
        L11_265 = "\227\131\154\227\131\171\227\131\161\227\129\174\227\130\185\227\131\134\227\130\163\227\131\179\227\130\176\227\131\172\227\130\164\227\129\171\232\144\189\233\155\183\228\186\136\231\180\132\230\136\144\229\144\166"
        L12_266 = L9_263
        L10_264(L11_265, L12_266)
        L10_264 = 0
        while true do
          L11_265 = _elektricity_brain
          L12_266 = L11_265
          L11_265 = L11_265.eventMessage
          L11_265 = L11_265(L12_266, "IsScriptLightning")
          if L11_265 == false then
            L11_265 = wait
            L11_265()
            L10_264 = L10_264 + 1
            if L10_264 >= 210 then
              L11_265 = _elektricity_brain
              L12_266 = L11_265
              L11_265 = L11_265.eventMessage
              L11_265 = L11_265(L12_266, "SetReservationActionScriptLightning", _permet_s_pup)
              L12_266 = print
              L12_266("\227\131\154\227\131\171\227\131\161\227\129\174\227\130\185\227\131\134\227\130\163\227\131\179\227\130\176\227\131\172\227\130\164\227\129\171\232\144\189\233\155\183\228\186\136\231\180\132\230\136\144\229\144\166", L11_265)
              L10_264 = 0
            end
          end
        end
        _isBreakStingray = true
        L11_265 = wait
        L11_265()
        L11_265 = _permet_s_brain
        L12_266 = L11_265
        L11_265 = L11_265.cmd
        L11_265(L12_266, "ForceDead")
        L11_265 = Sound
        L12_266 = L11_265
        L11_265 = L11_265.playSE
        L11_265(L12_266, "ene_stingray_ep24_exp", 1, "", _permet_s_pup)
        L11_265 = Fn_createEffect
        L12_266 = "exp"
        L11_265(L12_266, "ef_com_exp_01", _permet_s_pup:getWorldPos(), false)
        L11_265 = invokeTask
        function L12_266()
          wait(2)
          _permet_brain:setEnableHomingTarget(false)
        end
        L11_265(L12_266)
        L11_265 = _unica_permet_gen
        L12_266 = L11_265
        L11_265 = L11_265.addActionArea
        L11_265(L12_266, Vector(90, 130, 115), Vector(48.88974, 15, 45.78911), XYZRotQuaternionEular(0, 52.785, 0))
        L11_265 = _elektricity_gen
        L12_266 = L11_265
        L11_265 = L11_265.addActionArea
        L11_265(L12_266, Vector(90, 130, 115), Vector(48.88974, 15, 45.78911), XYZRotQuaternionEular(0, 52.785, 0))
        L11_265 = _unica_permet_gen
        L12_266 = L11_265
        L11_265 = L11_265.addRespawnArea
        L11_265(L12_266, Vector(100, 140, 125), Vector(48.88974, 15, 45.78911), XYZRotQuaternionEular(0, 52.785, 0))
        L11_265 = _elektricity_gen
        L12_266 = L11_265
        L11_265 = L11_265.addRespawnArea
        L11_265(L12_266, Vector(100, 140, 125), Vector(48.88974, 15, 45.78911), XYZRotQuaternionEular(0, 52.785, 0))
        L11_265 = Sound
        L12_266 = L11_265
        L11_265 = L11_265.playSE
        L11_265(L12_266, "ene_permet_vo_escape", 1)
        L11_265 = Fn_captionViewWait
        L12_266 = "ep24_00108"
        L11_265(L12_266)
        L11_265 = math
        L11_265 = L11_265.random
        L12_266 = 1
        L11_265 = L11_265(L12_266, 2)
        if L11_265 == 1 then
          L12_266 = Sound
          L12_266 = L12_266.playSE
          L12_266(L12_266, "ene_yunica_vo_talk_1", 1)
          L12_266 = Fn_captionViewWait
          L12_266("ep24_00109")
          L12_266 = Sound
          L12_266 = L12_266.playSE
          L12_266(L12_266, "ene_permet_vo_talk_1", 1)
          L12_266 = Fn_captionViewWait
          L12_266("ep24_00110")
        else
          L12_266 = Sound
          L12_266 = L12_266.playSE
          L12_266(L12_266, "ene_yunica_vo_talk_2", 1)
          L12_266 = Fn_captionViewWait
          L12_266("ep24_00121")
          L12_266 = Sound
          L12_266 = L12_266.playSE
          L12_266(L12_266, "ene_permet_vo_talk_2", 1)
          L12_266 = Fn_captionViewWait
          L12_266("ep24_00122")
        end
        L12_266 = _elektricity_brain
        L12_266 = L12_266.eventMessage
        L12_266(L12_266, "SetEnableBeatBlitz", false)
        L12_266 = _elektricity_brain
        L12_266 = L12_266.eventMessage
        L12_266 = L12_266(L12_266, "SetEnableCharge", true)
        print("\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\232\144\189\233\155\183\227\131\129\227\131\163\227\131\188\227\130\184\229\134\141\233\150\139\230\136\144\229\144\166\229\136\164\229\174\154", L12_266)
        L1_255 = 2
        L2_256 = 0
      elseif L1_255 == 2 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsChargingBlitz"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 then
          L6_260 = invokeTask
          function L7_261()
            Fn_sendEventComSb("resetCancelChargeForLargeMissile")
            L1_255 = 3
            wait(30)
            Sound:playSE("pc2_071", 1)
            Fn_captionViewWait("ep24_00114")
            L2_256 = 0
            Fn_lookAtObject(L0_254):abort()
            if _elektricity_brain:eventMessage("IsChargingBlitz") then
              Sound:setGlobalVariable("voice_type", "radio")
              Sound:playSE("uni_014", 0.7)
              Fn_captionViewWait("ep24_00115")
              Sound:setGlobalVariable("voice_type", "normal")
              L2_256 = 0
            end
            if _elektricity_brain:eventMessage("IsChargingBlitz") then
              Sound:setGlobalVariable("voice_type", "radio")
              Sound:playSE("per_009", 0.7)
              Fn_captionViewWait("ep24_00116")
              Sound:setGlobalVariable("voice_type", "normal")
              L2_256 = 0
            end
            L2_256 = 0
          end
          L6_260(L7_261)
        end
      elseif L1_255 == 3 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsChargingBlitz"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 and L2_256 >= 120 then
          L6_260 = _unica_brain
          L7_261 = L6_260
          L6_260 = L6_260.eventMessage
          L8_262 = "SetReservationActionPooledPlasma"
          L6_260(L7_261, L8_262)
          L6_260 = Fn_sendEventComSb
          L7_261 = "resetCancelChargeForLargeMissile"
          L6_260(L7_261)
          L6_260 = print
          L7_261 = "\227\131\129\227\131\163\227\131\188\227\130\184\227\131\151\227\131\169\227\130\186\227\131\158\231\153\186\229\176\132\228\186\136\231\180\132"
          L6_260(L7_261)
          L1_255 = 4
          L2_256 = 0
        end
      elseif L1_255 == 4 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsChargingBlitz"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 and L2_256 >= 210 then
          L6_260 = Sound
          L7_261 = L6_260
          L6_260 = L6_260.playSE
          L8_262 = "ene_yunica_vo_escape"
          L9_263 = 1
          L6_260(L7_261, L8_262, L9_263)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00123"
          L6_260(L7_261)
          L1_255 = 5
          L2_256 = 0
        end
      elseif L1_255 == 5 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsChargingBlitz"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 and L4_258 == false and L2_256 >= 210 then
          L6_260 = _permet_brain
          L7_261 = L6_260
          L6_260 = L6_260.eventMessage
          L8_262 = "SetReservationActionMicroMissile"
          L6_260 = L6_260(L7_261, L8_262)
          L7_261 = Fn_sendEventComSb
          L8_262 = "resetCancelChargeForLargeMissile"
          L7_261(L8_262)
          L7_261 = print
          L8_262 = "\227\131\158\227\130\164\227\130\175\227\131\173\227\131\159\227\130\181\227\130\164\227\131\171\231\153\186\229\176\132\228\186\136\231\180\132"
          L9_263 = L6_260
          L7_261(L8_262, L9_263)
          L2_256 = 0
        end
      elseif L1_255 == 5 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsCanceledChargedByTheBlast"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 then
          L6_260 = _elektricity_brain
          L7_261 = L6_260
          L6_260 = L6_260.eventMessage
          L8_262 = "SetEnableBeatBlitz"
          L9_263 = true
          L6_260(L7_261, L8_262, L9_263)
          L6_260 = Sound
          L7_261 = L6_260
          L6_260 = L6_260.playSE
          L8_262 = "pc2_032"
          L9_263 = 1
          L6_260(L7_261, L8_262, L9_263)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00124"
          L6_260(L7_261)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00125"
          L6_260(L7_261)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00127"
          L6_260(L7_261)
          L1_255 = 6
          _isEndTutorial = true
          L2_256 = 0
        end
      elseif L1_255 == 3 or L1_255 == 4 or L1_255 == 5 then
        L6_260 = Fn_sendEventComSb
        L7_261 = "getCancelChargeForLargeMissile"
        L6_260 = L6_260(L7_261)
        if L6_260 then
          L6_260 = _elektricity_brain
          L7_261 = L6_260
          L6_260 = L6_260.eventMessage
          L8_262 = "SetEnableBeatBlitz"
          L9_263 = true
          L6_260(L7_261, L8_262, L9_263)
          L6_260 = Fn_sendEventComSb
          L7_261 = "resetCancelChargeForLargeMissile"
          L6_260(L7_261)
          L6_260 = Sound
          L7_261 = L6_260
          L6_260 = L6_260.playSE
          L8_262 = "pc2_032"
          L9_263 = 1
          L6_260(L7_261, L8_262, L9_263)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00124"
          L6_260(L7_261)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00127"
          L6_260(L7_261)
          L6_260 = Sound
          L7_261 = L6_260
          L6_260 = L6_260.playSE
          L8_262 = "uni_019"
          L9_263 = 1
          L6_260(L7_261, L8_262, L9_263)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00128"
          L6_260(L7_261)
          L6_260 = invokeTask
          function L7_261()
            Sound:playSE("per_010", 1)
            wait(30)
            Sound:playSE("per_011", 1)
          end
          L6_260(L7_261)
          L6_260 = Fn_captionViewWait
          L7_261 = "ep24_00129"
          L6_260(L7_261)
          L1_255 = 6
          _isEndTutorial = true
          L2_256 = 0
          L3_257 = true
        end
      elseif L1_255 == 6 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsChargingBlitz"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 and L2_256 >= 30 then
          L6_260 = print
          L7_261 = "\227\131\158\227\130\164\227\130\175\227\131\173\227\131\159\227\130\181\227\130\164\227\131\171\229\145\189\228\187\164"
          L6_260(L7_261)
          L6_260 = Fn_sendEventComSb
          L7_261 = "resetCancelChargeForLargeMissile"
          L6_260(L7_261)
          L6_260 = math
          L6_260 = L6_260.random
          L7_261 = 1
          L8_262 = 2
          L6_260 = L6_260(L7_261, L8_262)
          if L6_260 == 1 then
            L7_261 = Sound
            L8_262 = L7_261
            L7_261 = L7_261.playSE
            L9_263 = "uni_019"
            L10_264 = 1
            L7_261(L8_262, L9_263, L10_264)
            L7_261 = invokeTask
            function L8_262()
              wait(24)
              Sound:playSE("ene_yunica_vo_beam", 1)
            end
            L7_261(L8_262)
            L7_261 = Fn_captionViewWait
            L8_262 = "ep24_00130"
            L7_261(L8_262)
            L7_261 = _permet_brain
            L8_262 = L7_261
            L7_261 = L7_261.eventMessage
            L9_263 = "SetReservationActionMicroMissile"
            L7_261(L8_262, L9_263)
            L7_261 = Sound
            L8_262 = L7_261
            L7_261 = L7_261.playSE
            L9_263 = "per_010"
            L10_264 = 1
            L7_261(L8_262, L9_263, L10_264)
            L7_261 = invokeTask
            function L8_262()
              wait(10)
              Sound:playSE("ene_permet_vo_laser", 1)
            end
            L7_261(L8_262)
            L7_261 = Fn_captionViewWait
            L8_262 = "ep24_00131"
            L7_261(L8_262)
          else
            L7_261 = Sound
            L8_262 = L7_261
            L7_261 = L7_261.playSE
            L9_263 = "uni_019"
            L10_264 = 1
            L7_261(L8_262, L9_263, L10_264)
            L7_261 = invokeTask
            function L8_262()
              wait(24)
              Sound:playSE("ene_yunica_vo_beam", 1)
            end
            L7_261(L8_262)
            L7_261 = Fn_captionViewWait
            L8_262 = "ep24_00132"
            L7_261(L8_262)
            L7_261 = _permet_brain
            L8_262 = L7_261
            L7_261 = L7_261.eventMessage
            L9_263 = "SetReservationActionMicroMissile"
            L7_261(L8_262, L9_263)
            L7_261 = Sound
            L8_262 = L7_261
            L7_261 = L7_261.playSE
            L9_263 = "per_010"
            L10_264 = 1
            L7_261(L8_262, L9_263, L10_264)
            L7_261 = invokeTask
            function L8_262()
              wait(10)
              Sound:playSE("ene_permet_vo_laser", 1)
            end
            L7_261(L8_262)
            L7_261 = Fn_captionViewWait
            L8_262 = "ep24_00133"
            L7_261(L8_262)
          end
          L1_255 = 7
          L2_256 = 0
        end
      elseif L1_255 == 7 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsCanceledChargedByTheBlast"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 then
          L6_260 = wait
          L7_261 = 45
          L6_260(L7_261)
          L6_260 = _unica_brain
          L7_261 = L6_260
          L6_260 = L6_260.eventMessage
          L8_262 = "SetReservationActionChargeAttack"
          L6_260(L7_261, L8_262)
          L6_260 = print
          L7_261 = "\227\131\166\227\131\139\227\130\171\231\170\129\233\128\178_A"
          L6_260(L7_261)
          L1_255 = 6
          L2_256 = 0
        end
      elseif L1_255 == 7 then
        L6_260 = Fn_sendEventComSb
        L7_261 = "getCancelChargeForLargeMissile"
        L6_260 = L6_260(L7_261)
        if L6_260 then
          L6_260 = _unica_brain
          L7_261 = L6_260
          L6_260 = L6_260.eventMessage
          L8_262 = "SetReservationActionChargeAttack"
          L6_260(L7_261, L8_262)
          L6_260 = Fn_sendEventComSb
          L7_261 = "resetCancelChargeForLargeMissile"
          L6_260(L7_261)
          L6_260 = print
          L7_261 = "\227\131\166\227\131\139\227\130\171\231\170\129\233\128\178_B"
          L6_260(L7_261)
          if L3_257 == false then
            L6_260 = Fn_captionViewWait
            L7_261 = "ep24_00134"
            L6_260(L7_261)
            L6_260 = Fn_captionViewWait
            L7_261 = "ep24_00135"
            L6_260(L7_261)
            L3_257 = true
          else
            L6_260 = wait
            L7_261 = 60
            L6_260(L7_261)
          end
          L1_255 = 6
          L2_256 = 0
        end
      elseif L1_255 == 7 then
        L6_260 = _elektricity_brain
        L7_261 = L6_260
        L6_260 = L6_260.eventMessage
        L8_262 = "IsChargingBlitz"
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 and L2_256 >= 210 then
          L6_260 = _permet_brain
          L7_261 = L6_260
          L6_260 = L6_260.eventMessage
          L8_262 = "SetReservationActionMicroMissile"
          L6_260 = L6_260(L7_261, L8_262)
          L7_261 = print
          L8_262 = "\227\131\158\227\130\164\227\130\175\227\131\173\227\131\159\227\130\181\227\130\164\227\131\171\231\153\186\229\176\132\228\186\136\231\180\132"
          L9_263 = L6_260
          L7_261(L8_262, L9_263)
          L2_256 = 0
        end
      elseif L5_259 == true then
        L6_260 = Player
        L7_261 = L6_260
        L6_260 = L6_260.isFeline
        L6_260 = L6_260(L7_261)
        if L6_260 == false then
          L5_259 = false
        end
      elseif L1_255 == 1 then
        L6_260 = GameDatabase
        L7_261 = L6_260
        L6_260 = L6_260.get
        L8_262 = ggd
        L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 == 0 and L5_259 == false then
          L6_260 = Player
          L7_261 = L6_260
          L6_260 = L6_260.isFeline
          L6_260 = L6_260(L7_261)
          if L6_260 then
            L6_260 = Fn_captionViewWait
            L7_261 = "ep24_02002"
            L6_260(L7_261)
            L5_259 = true
            L2_256 = 0
            L6_260 = GameDatabase
            L7_261 = L6_260
            L6_260 = L6_260.set
            L8_262 = ggd
            L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
            L9_263 = 1
            L6_260(L7_261, L8_262, L9_263)
          end
        end
      elseif L1_255 == 1 then
        L6_260 = GameDatabase
        L7_261 = L6_260
        L6_260 = L6_260.get
        L8_262 = ggd
        L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 == 1 and L5_259 == false then
          L6_260 = Player
          L7_261 = L6_260
          L6_260 = L6_260.isFeline
          L6_260 = L6_260(L7_261)
          if L6_260 then
            L6_260 = Fn_captionViewWait
            L7_261 = "ep24_02001"
            L6_260(L7_261)
            L5_259 = true
            L2_256 = 0
            L6_260 = GameDatabase
            L7_261 = L6_260
            L6_260 = L6_260.set
            L8_262 = ggd
            L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
            L9_263 = 2
            L6_260(L7_261, L8_262, L9_263)
          end
        end
      elseif L1_255 == 1 then
        L6_260 = GameDatabase
        L7_261 = L6_260
        L6_260 = L6_260.get
        L8_262 = ggd
        L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 == 2 and L5_259 == false then
          L6_260 = Player
          L7_261 = L6_260
          L6_260 = L6_260.isFeline
          L6_260 = L6_260(L7_261)
          if L6_260 then
            L6_260 = Fn_captionViewWait
            L7_261 = "ep24_01026"
            L6_260(L7_261)
            L5_259 = true
            L2_256 = 0
            L6_260 = GameDatabase
            L7_261 = L6_260
            L6_260 = L6_260.set
            L8_262 = ggd
            L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
            L9_263 = 3
            L6_260(L7_261, L8_262, L9_263)
          end
        end
      elseif L1_255 == 1 then
        L6_260 = GameDatabase
        L7_261 = L6_260
        L6_260 = L6_260.get
        L8_262 = ggd
        L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
        L6_260 = L6_260(L7_261, L8_262)
        if L6_260 == 3 and L5_259 == false then
          L6_260 = Player
          L7_261 = L6_260
          L6_260 = L6_260.isFeline
          L6_260 = L6_260(L7_261)
          if L6_260 then
            L6_260 = Fn_captionViewWait
            L7_261 = "ep24_00136"
            L6_260(L7_261)
            L5_259 = true
            L2_256 = 0
            L6_260 = GameDatabase
            L7_261 = L6_260
            L6_260 = L6_260.set
            L8_262 = ggd
            L8_262 = L8_262.Savedata__EventFlags__ep24__flag01
            L9_263 = 4
            L6_260(L7_261, L8_262, L9_263)
          end
        end
      end
      L2_256 = L2_256 + 1
      L6_260 = wait
      L6_260()
    end
  end)
end
function gravityGemCreate()
  invokeTask(function()
    local L0_267, L1_268, L2_269, L3_270, L4_271, L5_272, L6_273, L7_274, L8_275, L9_276, L10_277, L11_278, L12_279, L13_280
    L0_267 = 0
    L1_268 = math
    L1_268 = L1_268.random
    L2_269 = 1
    L3_270 = 16
    L1_268 = L1_268(L2_269, L3_270)
    L2_269 = nil
    L3_270 = {}
    while L0_267 <= 25 do
      L4_271 = _isInSensor
      if L4_271 then
        L4_271 = createGameObject2
        L5_272 = "Gem"
        L4_271 = L4_271(L5_272)
        L6_273 = L4_271
        L5_272 = L4_271.setGemModelNo
        L7_274 = 4
        L5_272(L6_273, L7_274)
        L5_272 = Fn_getPcPosRot
        L6_273 = L5_272()
        L7_274 = math
        L7_274 = L7_274.random
        L8_275 = -5
        L9_276 = 5
        L7_274 = L7_274(L8_275, L9_276)
        L8_275 = math
        L8_275 = L8_275.random
        L9_276 = -25
        L10_277 = 25
        L8_275 = L8_275(L9_276, L10_277)
        L9_276 = math
        L9_276 = L9_276.random
        L10_277 = -5
        L11_278 = 5
        L9_276 = L9_276(L10_277, L11_278)
        if L1_268 == 1 then
          L10_277 = Vector
          L11_278 = 18 + L7_274
          L12_279 = 3 + L8_275
          L13_280 = 0 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 2 then
          L10_277 = Vector
          L11_278 = -18 + L7_274
          L12_279 = 4 + L8_275
          L13_280 = 0 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 3 then
          L10_277 = Vector
          L11_278 = 0 + L7_274
          L12_279 = -3 + L8_275
          L13_280 = 18 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 4 then
          L10_277 = Vector
          L11_278 = 0 + L7_274
          L12_279 = -4 + L8_275
          L13_280 = -18 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 5 then
          L10_277 = Vector
          L11_278 = 15 + L7_274
          L12_279 = 1 + L8_275
          L13_280 = 15 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 6 then
          L10_277 = Vector
          L11_278 = -15 + L7_274
          L12_279 = -1 + L8_275
          L13_280 = -15 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 7 then
          L10_277 = Vector
          L11_278 = -15 + L7_274
          L12_279 = 2 + L8_275
          L13_280 = 15 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 8 then
          L10_277 = Vector
          L11_278 = 15 + L7_274
          L12_279 = -2 + L8_275
          L13_280 = -15 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 9 then
          L10_277 = Vector
          L11_278 = 17 + L7_274
          L12_279 = 3 + L8_275
          L13_280 = 5 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 10 then
          L10_277 = Vector
          L11_278 = -17 + L7_274
          L12_279 = 4 + L8_275
          L13_280 = -5 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 11 then
          L10_277 = Vector
          L11_278 = 5 + L7_274
          L12_279 = -3 + L8_275
          L13_280 = 17 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 12 then
          L10_277 = Vector
          L11_278 = -5 + L7_274
          L12_279 = -4 + L8_275
          L13_280 = -17 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 13 then
          L10_277 = Vector
          L11_278 = 17 + L7_274
          L12_279 = 3 + L8_275
          L13_280 = -5 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 14 then
          L10_277 = Vector
          L11_278 = -17 + L7_274
          L12_279 = 4 + L8_275
          L13_280 = 5 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 15 then
          L10_277 = Vector
          L11_278 = -5 + L7_274
          L12_279 = -3 + L8_275
          L13_280 = 17 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        elseif L1_268 == 16 then
          L10_277 = Vector
          L11_278 = 5 + L7_274
          L12_279 = -4 + L8_275
          L13_280 = -17 + L9_276
          L10_277 = L10_277(L11_278, L12_279, L13_280)
          L2_269 = L5_272 + L10_277
        end
        L10_277 = Fn_getPcPosRot
        L11_278 = L10_277()
        L12_279 = Query
        L13_280 = L12_279
        L12_279 = L12_279.setEyeSightTransform
        L12_279(L13_280, L10_277, L11_278)
        L12_279 = Query
        L13_280 = L12_279
        L12_279 = L12_279.setEyeSightAngle
        L12_279(L13_280, Deg2Rad(45))
        L12_279 = Query
        L13_280 = L12_279
        L12_279 = L12_279.setEyeSightRange
        L12_279(L13_280, range)
        L12_279 = Query
        L13_280 = L12_279
        L12_279 = L12_279.raycastEyeSight
        L12_279 = L12_279(L13_280, L2_269)
        if not L12_279 then
          L13_280 = L4_271.setWorldPos
          L13_280(L4_271, L2_269)
          L13_280 = L4_271.setForceMove
          L13_280(L4_271)
          L13_280 = L4_271.setVisible
          L13_280(L4_271, true)
          L13_280 = L4_271.try_init
          L13_280(L4_271)
          L13_280 = L4_271.setVisibleBlockHalfSize
          L13_280(L4_271, 150)
          L13_280 = L4_271.waitForReadyAsync
          L13_280(L4_271, function()
            L4_271:try_start()
          end)
          L0_267 = L0_267 + 1
          L13_280 = print
          L13_280("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_268)
          L0_267 = L0_267 + 1
          L13_280 = waitSeconds
          L13_280(20)
          L13_280 = table
          L13_280 = L13_280.insert
          L13_280(L3_270, L4_271)
          while true do
            L13_280 = 0
            for _FORV_17_, _FORV_18_ in pairs(L3_270) do
              if L3_270[_FORV_17_]:isRunning() then
                L13_280 = L13_280 + 1
              end
            end
            if L13_280 < 20 then
              print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L13_280)
              break
            end
            wait(15)
          end
          L1_268 = L1_268 + 1
          if L1_268 >= 17 then
            L1_268 = 1
          end
        end
      else
      end
      L4_271 = wait
      L4_271()
    end
  end)
end
function playEffect(A0_281, A1_282, A2_283, A3_284, A4_285)
  local L5_286
  L5_286 = findGameObject2
  L5_286 = L5_286("Node", A0_281)
  L5_286 = L5_286.getWorldPos
  L5_286 = L5_286(L5_286)
  invokeTask(function()
    local L0_287, L1_288, L2_289, L3_290, L4_291
    while true do
      L0_287 = Fn_getDistanceToPlayer
      L1_288 = A0_281
      L0_287 = L0_287(L1_288)
      if L0_287 > 70 then
        L0_287 = A4_285
        L0_287 = L0_287 and _near_elec_flag
      end
      if not L0_287 then
        L0_287 = math
        L0_287 = L0_287.random
        L1_288 = A1_282
        L1_288 = -L1_288
        L2_289 = A1_282
        L0_287 = L0_287(L1_288, L2_289)
        L1_288 = math
        L1_288 = L1_288.random
        L2_289 = A2_283
        L2_289 = -L2_289
        L3_290 = A2_283
        L1_288 = L1_288(L2_289, L3_290)
        L2_289 = math
        L2_289 = L2_289.random
        L3_290 = A3_284
        L3_290 = -L3_290
        L4_291 = A3_284
        L2_289 = L2_289(L3_290, L4_291)
        L3_290 = L5_286
        L4_291 = Vector
        L4_291 = L4_291(L0_287, L1_288, L2_289)
        L3_290 = L3_290 + L4_291
        L4_291 = Fn_createEffect
        L4_291("exp", "ef_com_exp_02", L3_290, false)
        L4_291 = Sound
        L4_291 = L4_291.playSE
        L4_291(L4_291, "ene_robot_missile_hit", 1, "", findGameObject2("Node", A0_281))
        L4_291 = math
        L4_291 = L4_291.random
        L4_291 = L4_291(5, 90)
        wait(L4_291)
      end
    end
  end)
end
function breakLightningRod()
  local L0_292
  function L0_292(A0_293)
    local L1_294, L2_295
    L1_294 = A0_293.lightningRodName
    L2_295 = A0_293.gameObject
    Fn_sendEventComSb("breakLightningRod_com", L1_294, L2_295)
  end
  findGameObject2("EnemyBrain", "elektricity"):setEventListener("boss_eleReport", L0_292)
end
function sendSetElekPupTbl()
  local L0_296, L1_297
  L0_296 = {}
  L1_297 = {}
  L0_296[1] = findGameObject2("Puppet", "elektricity")
  L1_297[1] = findGameObject2("EnemyBrain", "elektricity")
  Fn_sendEventComSb("setElekPupTbl", L0_296, L1_297)
end
function pccubesensor2_elec_battle_01_OnEnter(A0_298)
  captionUniPer()
  _near_elec_flag = true
  Fn_pcSensorOff("pccubesensor2_elec_battle_01")
  _enmgen2_01_gen:requestAllEnemyKill()
  _enmgen2_02_gen:requestAllEnemyKill()
  _enmgen2_03_gen:requestAllEnemyKill()
  _enmgen2_04_gen:requestAllEnemyKill()
  _enmgen2_05_gen:requestAllEnemyKill()
  _stg_02_gen:requestAllEnemyKill()
  _stg_03_gen:requestAllEnemyKill()
  _stg_04_gen:requestAllEnemyKill()
  _stg_05_gen:requestAllEnemyKill()
  Fn_pcSensorOff("pccubesensor2_CatWarp_in")
  Fn_pcSensorOff("pccubesensor2_CatWarp_mid")
  Fn_pcSensorOff("pccubesensor2_CatWarp_out")
  Fn_pcSensorOn("pccubesensor2_CatWarp_in1")
  Fn_pcSensorOn("pccubesensor2_CatWarp_mid1")
  Fn_pcSensorOn("pccubesensor2_CatWarp_out1")
  Fn_setCatWarpCheckPoint("locator2_navi_01")
  gravityGemCreate()
end
function pccubesensor2_elec_battle_02_OnEnter()
  local L0_299, L1_300
  _isInSensor = true
end
function pccubesensor2_elec_battle_02_OnLeave()
  local L0_301, L1_302
  _isInSensor = false
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_303
  L1_303 = _warp_caption_flag
  if L1_303 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep24_00138")
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_CatWarp_in1_OnEnter()
  local L0_304, L1_305
  L0_304 = _near_elec_flag
  if L0_304 == true then
    L0_304 = _warp_caption_flag
    if L0_304 == true then
      _warp_caption_flag = false
    end
  end
end
function pccubesensor2_CatWarp_mid1_OnLeave()
  if _near_elec_flag == true and _warp_caption_flag == false then
    Fn_captionView("ep24_00138")
    Player:setAction(Player.kAction_Float)
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out1_OnLeave()
  if _near_elec_flag == true then
    invokeTask(function()
      Fn_catWarp()
    end)
  end
end
function Finalize()
  if Fn_getPlayer() then
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  Sound:setGlobalVariable("voice_type", "normal")
  Fn_disableCostumeChange(false)
end
