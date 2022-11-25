dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_009"
_floor_num = 9
_enegen_list = nil
_startArea = nil
_goalArea = nil
_enemySpawn_task = nil
_photo = nil
_PhotoCaption_Stopflag = false
_cage_move_start = false
_Spawn_enemy = {
  defender = 0,
  runner = 0,
  stalker = 0,
  lasercannon = 0,
  treecannon = 0,
  guardcore = 0,
  gellyfish = 0,
  imp = 0,
  jammer = 0
}
_PhotoTarget_player = false
_PhotoTarget_enemy = {
  defender = 0,
  runner = 0,
  stalker = 0,
  lasercannon = 0,
  treecannon = 0,
  guardcore = 0,
  gellyfish = 0,
  imp = 0,
  jammer = 0
}
_PhotoSuccess_enemy = {
  defender = false,
  runner = false,
  stalker = false,
  lasercannon = false,
  treecannon = false,
  guardcore = false,
  gellyfish = false,
  imp = false,
  jammer = false
}
_mission_start = false
_mission_clear = false
_mission_faled = false
enmgen2_MissionTarget_wa_a_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "defender_mine_01",
      locator = "locator2_MT_wa_a_02_enemy_01",
      name = "MT_wa_a_02_defender_1"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_02_enemy_02",
      name = "MT_wa_a_02_stalker_1"
    }
  },
  enemyDeadNum = 0,
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
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_7:getName())
  end,
  onSpawn = function(A0_8, A1_9)
    local L2_10, L3_11, L4_12
    L3_11 = A0_8
    L2_10 = A0_8.getSpecTable
    L2_10 = L2_10(L3_11)
    L2_10.enemyDeadNum = 0
    L4_12 = A1_9
    L3_11 = A1_9.getName
    L3_11 = L3_11(L4_12)
    L4_12 = findGameObject2
    L4_12 = L4_12("Puppet", L3_11)
    if _photo:set(L4_12) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_11))
    end
  end,
  onSetupGem = function(A0_13, A1_14)
    Fn_enemyPopGemSetup(A0_13, {
      "MT_wa_a_02_defender_1",
      "MT_wa_a_02_stalker_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_15, A1_16)
    Fn_enemyAshPopGem(A0_15, A1_16)
  end,
  getEnemyMax = function(A0_17)
    return #A0_17.spawnSet
  end,
  getEnemyDeadNum = function(A0_18)
    local L1_19
    L1_19 = A0_18.enemyDeadNum
    return L1_19
  end
}
enmgen2_MissionTarget_wa_a_04_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "runner_mine_01",
      locator = "locator2_MT_wa_a_04_01_enemy_01",
      name = "MT_wa_a_04_runner_1"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_MT_wa_a_04_01_enemy_02",
      name = "MT_wa_a_04_guardcore_1"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_20)
    local L1_21
  end,
  onEnter = function(A0_22)
    local L1_23
  end,
  onLeave = function(A0_24)
    local L1_25
  end,
  onObjectDead = function(A0_26, A1_27)
    A0_26:getSpecTable().enemyDeadNum = A0_26:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_27:getName())
  end,
  onSpawn = function(A0_28, A1_29)
    local L2_30, L3_31, L4_32
    L3_31 = A0_28
    L2_30 = A0_28.getSpecTable
    L2_30 = L2_30(L3_31)
    L2_30.enemyDeadNum = 0
    L4_32 = A1_29
    L3_31 = A1_29.getName
    L3_31 = L3_31(L4_32)
    L4_32 = findGameObject2
    L4_32 = L4_32("Puppet", L3_31)
    if _photo:set(L4_32) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_31))
    end
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "MT_wa_a_04_runner_1",
      "MT_wa_a_04_guardcore_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36)
  end,
  getEnemyMax = function(A0_37)
    return #A0_37.spawnSet
  end,
  getEnemyDeadNum = function(A0_38)
    local L1_39
    L1_39 = A0_38.enemyDeadNum
    return L1_39
  end
}
enmgen2_MissionTarget_wa_a_04_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_04_02_enemy_01",
      name = "MT_wa_a_04_jammer_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_MT_wa_a_04_02_enemy_02",
      name = "MT_wa_a_04_gellyfish_1"
    }
  },
  enemyDeadNum = 0,
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
    A0_46:getSpecTable().enemyDeadNum = A0_46:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_47:getName())
  end,
  onSpawn = function(A0_48, A1_49)
    local L2_50, L3_51, L4_52
    L3_51 = A0_48
    L2_50 = A0_48.getSpecTable
    L2_50 = L2_50(L3_51)
    L2_50.enemyDeadNum = 0
    L4_52 = A1_49
    L3_51 = A1_49.getName
    L3_51 = L3_51(L4_52)
    L4_52 = findGameObject2
    L4_52 = L4_52("Puppet", L3_51)
    if _photo:set(L4_52) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_51))
    end
  end,
  onSetupGem = function(A0_53, A1_54)
    Fn_enemyPopGemSetup(A0_53, {
      "MT_wa_a_04_jammer_1",
      "MT_wa_a_04_gellyfish_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_55, A1_56)
    Fn_enemyAshPopGem(A0_55, A1_56)
  end,
  getEnemyMax = function(A0_57)
    return #A0_57.spawnSet
  end,
  getEnemyDeadNum = function(A0_58)
    local L1_59
    L1_59 = A0_58.enemyDeadNum
    return L1_59
  end
}
enmgen2_MissionTarget_wa_a_05 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_05_enemy_01",
      name = "MT_wa_a_05_stalker_1"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_MT_wa_a_05_enemy_02",
      name = "MT_wa_a_05_guardcore_1"
    }
  },
  enemyDeadNum = 0,
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
    A0_66:getSpecTable().enemyDeadNum = A0_66:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_67:getName())
  end,
  onSpawn = function(A0_68, A1_69)
    local L2_70, L3_71, L4_72
    L3_71 = A0_68
    L2_70 = A0_68.getSpecTable
    L2_70 = L2_70(L3_71)
    L2_70.enemyDeadNum = 0
    L4_72 = A1_69
    L3_71 = A1_69.getName
    L3_71 = L3_71(L4_72)
    L4_72 = findGameObject2
    L4_72 = L4_72("Puppet", L3_71)
    if _photo:set(L4_72) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_71))
    end
  end,
  onSetupGem = function(A0_73, A1_74)
    Fn_enemyPopGemSetup(A0_73, {
      "MT_wa_a_05_stalker_1",
      "MT_wa_a_05_guardcore_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_75, A1_76)
    Fn_enemyAshPopGem(A0_75, A1_76)
  end,
  getEnemyMax = function(A0_77)
    return #A0_77.spawnSet
  end,
  getEnemyDeadNum = function(A0_78)
    local L1_79
    L1_79 = A0_78.enemyDeadNum
    return L1_79
  end
}
enmgen2_MissionTarget_wa_a_06 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_06_enemy_01",
      name = "MT_wa_a_06_jammer_1"
    },
    {
      type = "lasercannon_mine_01",
      locator = "locator2_MT_wa_a_06_enemy_02",
      name = "MT_wa_a_06_lasercannon_1"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_80)
    local L1_81
  end,
  onEnter = function(A0_82)
    local L1_83
  end,
  onLeave = function(A0_84)
    local L1_85
  end,
  onObjectDead = function(A0_86, A1_87)
    A0_86:getSpecTable().enemyDeadNum = A0_86:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_87:getName())
  end,
  onSpawn = function(A0_88, A1_89)
    local L2_90, L3_91, L4_92
    L3_91 = A0_88
    L2_90 = A0_88.getSpecTable
    L2_90 = L2_90(L3_91)
    L2_90.enemyDeadNum = 0
    L4_92 = A1_89
    L3_91 = A1_89.getName
    L3_91 = L3_91(L4_92)
    L4_92 = findGameObject2
    L4_92 = L4_92("Puppet", L3_91)
    if _photo:set(L4_92) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_91))
    end
  end,
  onSetupGem = function(A0_93, A1_94)
    Fn_enemyPopGemSetup(A0_93, {
      "MT_wa_a_06_jammer_1",
      "MT_wa_a_06_lasercannon_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_95, A1_96)
    Fn_enemyAshPopGem(A0_95, A1_96)
  end,
  getEnemyMax = function(A0_97)
    return #A0_97.spawnSet
  end,
  getEnemyDeadNum = function(A0_98)
    local L1_99
    L1_99 = A0_98.enemyDeadNum
    return L1_99
  end
}
enmgen2_MissionTarget_wa_a_07 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "treecannon_mine_01",
      locator = "locator2_MT_wa_a_07_enemy_01",
      name = "MT_wa_a_07_treecannon_1"
    },
    {
      type = "defender_mine_01",
      locator = "locator2_MT_wa_a_07_enemy_02",
      name = "MT_wa_a_07_defender_1"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_100)
    local L1_101
  end,
  onEnter = function(A0_102)
    local L1_103
  end,
  onLeave = function(A0_104)
    local L1_105
  end,
  onObjectDead = function(A0_106, A1_107)
    A0_106:getSpecTable().enemyDeadNum = A0_106:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_107:getName())
  end,
  onSpawn = function(A0_108, A1_109)
    local L2_110, L3_111, L4_112
    L3_111 = A0_108
    L2_110 = A0_108.getSpecTable
    L2_110 = L2_110(L3_111)
    L2_110.enemyDeadNum = 0
    L4_112 = A1_109
    L3_111 = A1_109.getName
    L3_111 = L3_111(L4_112)
    L4_112 = findGameObject2
    L4_112 = L4_112("Puppet", L3_111)
    if _photo:set(L4_112) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_111))
    end
  end,
  onSetupGem = function(A0_113, A1_114)
    Fn_enemyPopGemSetup(A0_113, {
      "MT_wa_a_07_treecannon_1",
      "MT_wa_a_07_defender_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_115, A1_116)
    Fn_enemyAshPopGem(A0_115, A1_116)
  end,
  getEnemyMax = function(A0_117)
    return #A0_117.spawnSet
  end,
  getEnemyDeadNum = function(A0_118)
    local L1_119
    L1_119 = A0_118.enemyDeadNum
    return L1_119
  end
}
enmgen2_MissionTarget_wa_a_08 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "treecannon_mine_01",
      locator = "locator2_MT_wa_a_08_enemy_01",
      name = "MT_wa_a_08_treecannon_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_MT_wa_a_08_enemy_02",
      name = "MT_wa_a_08_runner_1"
    }
  },
  enemyDeadNum = 0,
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
    A0_126:getSpecTable().enemyDeadNum = A0_126:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_127:getName())
  end,
  onSpawn = function(A0_128, A1_129)
    local L2_130, L3_131, L4_132
    L3_131 = A0_128
    L2_130 = A0_128.getSpecTable
    L2_130 = L2_130(L3_131)
    L2_130.enemyDeadNum = 0
    L4_132 = A1_129
    L3_131 = A1_129.getName
    L3_131 = L3_131(L4_132)
    L4_132 = findGameObject2
    L4_132 = L4_132("Puppet", L3_131)
    if _photo:set(L4_132) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_131))
    end
  end,
  onSetupGem = function(A0_133, A1_134)
    Fn_enemyPopGemSetup(A0_133, {
      "MT_wa_a_08_treecannon_1",
      "MT_wa_a_08_runner_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_135, A1_136)
    Fn_enemyAshPopGem(A0_135, A1_136)
  end,
  getEnemyMax = function(A0_137)
    return #A0_137.spawnSet
  end,
  getEnemyDeadNum = function(A0_138)
    local L1_139
    L1_139 = A0_138.enemyDeadNum
    return L1_139
  end
}
enmgen2_MissionTarget_wa_a_09 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_MT_wa_a_09_enemy_01",
      name = "MT_wa_a_09_gellyfish_1"
    },
    {
      type = "lasercannon_mine_01",
      locator = "locator2_MT_wa_a_09_enemy_02",
      name = "MT_wa_a_09_lasercannon_1"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_140)
    local L1_141
  end,
  onEnter = function(A0_142)
    local L1_143
  end,
  onLeave = function(A0_144)
    local L1_145
  end,
  onObjectDead = function(A0_146, A1_147)
    A0_146:getSpecTable().enemyDeadNum = A0_146:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_147:getName())
  end,
  onSpawn = function(A0_148, A1_149)
    local L2_150, L3_151, L4_152
    L3_151 = A0_148
    L2_150 = A0_148.getSpecTable
    L2_150 = L2_150(L3_151)
    L2_150.enemyDeadNum = 0
    L4_152 = A1_149
    L3_151 = A1_149.getName
    L3_151 = L3_151(L4_152)
    L4_152 = findGameObject2
    L4_152 = L4_152("Puppet", L3_151)
    if _photo:set(L4_152) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_151))
    end
  end,
  onSetupGem = function(A0_153, A1_154)
    Fn_enemyPopGemSetup(A0_153, {
      "MT_wa_a_09_gellyfish_1",
      "MT_wa_a_09_lasercannon_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_155, A1_156)
    Fn_enemyAshPopGem(A0_155, A1_156)
  end,
  getEnemyMax = function(A0_157)
    return #A0_157.spawnSet
  end,
  getEnemyDeadNum = function(A0_158)
    local L1_159
    L1_159 = A0_158.enemyDeadNum
    return L1_159
  end
}
enmgen2_MissionTarget_wa_a_10 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_01",
      locator = "locator2_MT_wa_a_10_enemy_01",
      name = "MT_wa_a_10_imp_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_10_enemy_02",
      name = "MT_wa_a_10_jammer_1"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_160)
    local L1_161
  end,
  onEnter = function(A0_162)
    local L1_163
  end,
  onLeave = function(A0_164)
    local L1_165
  end,
  onObjectDead = function(A0_166, A1_167)
    A0_166:getSpecTable().enemyDeadNum = A0_166:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_167:getName())
  end,
  onSpawn = function(A0_168, A1_169)
    local L2_170, L3_171, L4_172
    L3_171 = A0_168
    L2_170 = A0_168.getSpecTable
    L2_170 = L2_170(L3_171)
    L2_170.enemyDeadNum = 0
    L4_172 = A1_169
    L3_171 = A1_169.getName
    L3_171 = L3_171(L4_172)
    L4_172 = findGameObject2
    L4_172 = L4_172("Puppet", L3_171)
    if _photo:set(L4_172) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_171))
    end
  end,
  onSetupGem = function(A0_173, A1_174)
    Fn_enemyPopGemSetup(A0_173, {
      "MT_wa_a_10_imp_1",
      "MT_wa_a_10_jammer_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_175, A1_176)
    Fn_enemyAshPopGem(A0_175, A1_176)
  end,
  getEnemyMax = function(A0_177)
    return #A0_177.spawnSet
  end,
  getEnemyDeadNum = function(A0_178)
    local L1_179
    L1_179 = A0_178.enemyDeadNum
    return L1_179
  end
}
enmgen2_MissionTarget_wa_a_11 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_MT_wa_a_11_enemy_01",
      name = "MT_wa_a_11_gellyfish_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_MT_wa_a_11_enemy_02",
      name = "MT_wa_a_11_imp_1"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_180)
    local L1_181
  end,
  onEnter = function(A0_182)
    local L1_183
  end,
  onLeave = function(A0_184)
    local L1_185
  end,
  onObjectDead = function(A0_186, A1_187)
    A0_186:getSpecTable().enemyDeadNum = A0_186:getSpecTable().enemyDeadNum + 1
    target_count("Dead", A1_187:getName())
  end,
  onSpawn = function(A0_188, A1_189)
    local L2_190, L3_191, L4_192
    L3_191 = A0_188
    L2_190 = A0_188.getSpecTable
    L2_190 = L2_190(L3_191)
    L2_190.enemyDeadNum = 0
    L4_192 = A1_189
    L3_191 = A1_189.getName
    L3_191 = L3_191(L4_192)
    L4_192 = findGameObject2
    L4_192 = L4_192("Puppet", L3_191)
    if _photo:set(L4_192) then
      print(string.format("%s\227\130\146\230\146\174\229\189\177\227\130\191\227\131\188\227\130\178\227\131\131\227\131\136\227\129\171\231\153\187\233\140\178\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", L3_191))
    end
  end,
  onSetupGem = function(A0_193, A1_194)
    Fn_enemyPopGemSetup(A0_193, {
      "MT_wa_a_11_gellyfish_1",
      "MT_wa_a_11_imp_1"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_195, A1_196)
    Fn_enemyAshPopGem(A0_195, A1_196)
  end,
  getEnemyMax = function(A0_197)
    return #A0_197.spawnSet
  end,
  getEnemyDeadNum = function(A0_198)
    local L1_199
    L1_199 = A0_198.enemyDeadNum
    return L1_199
  end
}
enmgen2_wa_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "defender_mine_01",
      locator = "locator2_wa_a_02_enemy_01",
      name = "wa_a_02_defender_1"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_02_enemy_02",
      name = "wa_a_02_stalker_1"
    }
  },
  onUpdate = function(A0_200)
    local L1_201
  end,
  onEnter = function(A0_202)
    local L1_203
  end,
  onLeave = function(A0_204)
    local L1_205
  end,
  onObjectDead = function(A0_206, A1_207)
  end,
  onPopGem = function(A0_208, A1_209)
    EnemeyDropGem(A0_208, A1_209)
  end
}
enmgen2_wa_a_04_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "runner_mine_01",
      locator = "locator2_wa_a_04_01_enemy_01",
      name = "wa_a_04_runner_1"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_04_01_enemy_02",
      name = "wa_a_04_guardcore_1"
    }
  },
  onUpdate = function(A0_210)
    local L1_211
  end,
  onEnter = function(A0_212)
    local L1_213
  end,
  onLeave = function(A0_214)
    local L1_215
  end,
  onObjectDead = function(A0_216, A1_217)
  end,
  onPopGem = function(A0_218, A1_219)
    EnemeyDropGem(A0_218, A1_219)
  end
}
enmgen2_wa_a_04_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_04_02_enemy_01",
      name = "wa_a_04_jammer_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_04_02_enemy_02",
      name = "wa_a_04_gellyfish_1"
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
  onPopGem = function(A0_228, A1_229)
    EnemeyDropGem(A0_228, A1_229)
  end
}
enmgen2_wa_a_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_05_enemy_01",
      name = "wa_a_05_stalker_1"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_05_enemy_02",
      name = "wa_a_05_guardcore_1"
    }
  },
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
  onPopGem = function(A0_238, A1_239)
    EnemeyDropGem(A0_238, A1_239)
  end
}
enmgen2_wa_a_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_06_enemy_01",
      name = "wa_a_06_jammer_1"
    },
    {
      type = "lasercannon_mine_01",
      locator = "locator2_wa_a_06_enemy_02",
      name = "wa_a_06_lasercannon_1"
    }
  },
  onUpdate = function(A0_240)
    local L1_241
  end,
  onEnter = function(A0_242)
    local L1_243
  end,
  onLeave = function(A0_244)
    local L1_245
  end,
  onObjectDead = function(A0_246, A1_247)
  end,
  onPopGem = function(A0_248, A1_249)
    EnemeyDropGem(A0_248, A1_249)
  end
}
enmgen2_wa_a_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "treecannon_mine_01",
      locator = "locator2_wa_a_07_enemy_01",
      name = "wa_a_07_treecannon_1"
    },
    {
      type = "defender_mine_01",
      locator = "locator2_wa_a_07_enemy_02",
      name = "wa_a_07_defender_1"
    }
  },
  onUpdate = function(A0_250)
    local L1_251
  end,
  onEnter = function(A0_252)
    local L1_253
  end,
  onLeave = function(A0_254)
    local L1_255
  end,
  onObjectDead = function(A0_256, A1_257)
  end,
  onPopGem = function(A0_258, A1_259)
    EnemeyDropGem(A0_258, A1_259)
  end
}
enmgen2_wa_a_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "treecannon_mine_01",
      locator = "locator2_wa_a_08_enemy_01",
      name = "wa_a_08_treecannon_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_wa_a_08_enemy_02",
      name = "wa_a_08_runner_1"
    }
  },
  onUpdate = function(A0_260)
    local L1_261
  end,
  onEnter = function(A0_262)
    local L1_263
  end,
  onLeave = function(A0_264)
    local L1_265
  end,
  onObjectDead = function(A0_266, A1_267)
  end,
  onPopGem = function(A0_268, A1_269)
    EnemeyDropGem(A0_268, A1_269)
  end
}
enmgen2_wa_a_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_09_enemy_01",
      name = "wa_a_09_gellyfish_1"
    },
    {
      type = "lasercannon_mine_01",
      locator = "locator2_wa_a_09_enemy_02",
      name = "wa_a_09_lasercannon_1"
    }
  },
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
  onPopGem = function(A0_278, A1_279)
    EnemeyDropGem(A0_278, A1_279)
  end
}
enmgen2_wa_a_10 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_10_enemy_01",
      name = "wa_a_10_imp_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_10_enemy_02",
      name = "wa_a_10_jammer_1"
    }
  },
  onUpdate = function(A0_280)
    local L1_281
  end,
  onEnter = function(A0_282)
    local L1_283
  end,
  onLeave = function(A0_284)
    local L1_285
  end,
  onObjectDead = function(A0_286, A1_287)
  end,
  onPopGem = function(A0_288, A1_289)
    EnemeyDropGem(A0_288, A1_289)
  end
}
enmgen2_wa_a_11 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_11_enemy_01",
      name = "wa_a_11_gellyfish_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_11_enemy_02",
      name = "wa_a_11_imp_1"
    }
  },
  onUpdate = function(A0_290)
    local L1_291
  end,
  onEnter = function(A0_292)
    local L1_293
  end,
  onLeave = function(A0_294)
    local L1_295
  end,
  onObjectDead = function(A0_296, A1_297)
  end,
  onPopGem = function(A0_298, A1_299)
    EnemeyDropGem(A0_298, A1_299)
  end
}
function InitializeBody()
  local L0_300
  L0_300 = print
  L0_300(string.format("mine99_%03d InitializeBody", _floor_num))
  L0_300 = {}
  L0_300.mineOreEvdName = "mine05_ore"
  L0_300.instance_flg = true
  L0_300.manager_name = g_own:getName()
  L0_300.deploy_areas = getElectedAreaNames()
  L0_300.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_300
end
function IngameBody()
  local L0_301, L1_302, L2_303, L3_304, L4_305, L5_306, L6_307, L7_308, L8_309, L9_310, L10_311, L11_312
  L11_312 = L1_302(L2_303, L3_304)
  L0_301(L1_302, L2_303, L3_304, L4_305, L5_306, L6_307, L7_308, L8_309, L9_310, L10_311, L11_312, L1_302(L2_303, L3_304))
  _enegen_list = L0_301
  _startArea = L0_301
  _goalArea = L0_301
  L0_301()
  L0_301()
  L0_301()
  _enemySpawn_task = L0_301
  if not L0_301 then
    L0_301(L1_302)
    repeat
      L0_301()
    until L0_301
    L0_301()
    L0_301(L1_302, L2_303, L3_304, L4_305)
    if L0_301 ~= nil then
      L0_301(L1_302)
      _enemySpawn_task = nil
    end
    for L3_304, L4_305 in L0_301(L1_302) do
      L5_306(L6_307)
      L5_306(L6_307)
      for L8_309, L9_310 in L5_306(L6_307) do
        L10_311 = string
        L10_311 = L10_311.match
        L11_312 = L9_310
        L10_311 = L10_311(L11_312, "MissionTarget")
        if L10_311 ~= nil then
          L10_311 = print
          L11_312 = "-// \228\184\139\232\168\152\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\227\130\176\227\131\171\227\131\188\227\131\151\227\130\146\233\133\141\231\189\174 //-"
          L10_311(L11_312)
          L10_311 = print
          L11_312 = L9_310
          L10_311(L11_312)
          L10_311 = findGameObject2
          L11_312 = "EnemyGenerator"
          L10_311 = L10_311(L11_312, L9_310)
          L11_312 = L10_311.requestSpawn
          L11_312(L10_311)
          L11_312 = L10_311.getSpecTable
          L11_312 = L11_312(L10_311)
          L11_312 = L11_312.spawnSet
          for _FORV_15_, _FORV_16_ in pairs(L11_312) do
            target_count("Spawn", L11_312[_FORV_15_].name)
          end
        else
          L10_311 = findGameObject2
          L11_312 = "EnemyGenerator"
          L10_311 = L10_311(L11_312, L9_310)
          L11_312 = L10_311.requestAllEnemyKill
          L11_312(L10_311)
        end
      end
    end
    L0_301.near = 2
    L0_301.far = 20
    _photo = L1_302
    L11_312 = L3_304(L4_305)
    if L1_302 then
      L1_302(L2_303)
    end
    L1_302(L2_303, L3_304)
    L1_302(L2_303, L3_304)
    L1_302(L2_303, L3_304)
    L1_302(L2_303, L3_304)
    L1_302(L2_303, L3_304)
    L1_302(L2_303)
    _mission_start = true
    while true do
      L1_302.suc = 0
      L1_302.near = 0
      L1_302.far = 0
      L1_302.angle = 0
      L1_302.out = 0
      L1_302.back = 0
      if L2_303 == true then
        if L2_303 == false then
          _cage_move_start = true
          L2_303(L3_304, L4_305)
          L2_303()
          L2_303()
        end
      end
      if L2_303 ~= nil then
        L2_303(L3_304)
        while true do
          if L2_303 then
            for L6_307, L7_308 in L3_304(L4_305) do
              if L7_308 >= 1 then
              end
            end
            if L2_303 < L3_304 then
              _mission_faled = true
              break
            end
            if L3_304 then
              L3_304(L4_305, L5_306)
            elseif not L3_304 then
              L3_304(L4_305)
            end
          end
          if L3_304 ~= true then
            L3_304()
          end
        end
        if L2_303 == false then
          _PhotoCaption_Stopflag = true
          L2_303(L3_304, L4_305, L5_306, L6_307)
        end
        if L3_304 == "table" then
          for L6_307, L7_308 in L3_304(L4_305) do
            L9_310 = L8_309
            L9_310 = L7_308.state
            L10_311 = kPHOTO_OK
            if L9_310 == L10_311 then
              L9_310 = print
              L10_311 = "\229\175\190\232\177\161\227\129\174\230\146\174\229\189\177\227\129\171\230\136\144\229\138\159"
              L9_310(L10_311)
              L9_310 = L1_302.suc
              L9_310 = L9_310 + 1
              L1_302.suc = L9_310
              L9_310 = target_count
              L10_311 = "Photo"
              L11_312 = L8_309
              L9_310(L10_311, L11_312)
            else
              L9_310 = L7_308.state
              L10_311 = kPHOTO_NEAR
              if L9_310 == L10_311 then
                L9_310 = print
                L10_311 = "\229\175\190\232\177\161\227\129\168\227\129\174\232\183\157\233\155\162\227\129\140\232\191\145\227\129\153\227\129\142\227\129\159"
                L9_310(L10_311)
                L9_310 = L1_302.near
                L9_310 = L9_310 + 1
                L1_302.near = L9_310
              else
                L9_310 = L7_308.state
                L10_311 = kPHOTO_FAR
                if L9_310 == L10_311 then
                  L9_310 = print
                  L10_311 = "\229\175\190\232\177\161\227\129\168\227\129\174\232\183\157\233\155\162\227\129\140\233\129\160\227\129\153\227\129\142\227\129\159"
                  L9_310(L10_311)
                  L9_310 = L1_302.far
                  L9_310 = L9_310 + 1
                  L1_302.far = L9_310
                else
                  L9_310 = L7_308.state
                  L10_311 = kPHOTO_ANGLE
                  if L9_310 == L10_311 then
                    L9_310 = print
                    L10_311 = "\229\175\190\232\177\161\227\129\140\230\173\163\233\157\162\227\130\146\229\144\145\227\129\132\227\129\166\227\129\132\227\129\170\227\129\132"
                    L9_310(L10_311)
                    L9_310 = L7_308.dist
                    L10_311 = L0_301.near
                    if L9_310 < L10_311 then
                      L9_310 = print
                      L10_311 = "\227\129\160\227\129\140\227\128\129\229\175\190\232\177\161\227\129\168\227\129\174\232\183\157\233\155\162\227\129\140\232\191\145\227\129\153\227\129\142\227\129\159"
                      L9_310(L10_311)
                      L9_310 = L1_302.near
                      L9_310 = L9_310 + 1
                      L1_302.near = L9_310
                    else
                      L9_310 = L0_301.far
                      L10_311 = L7_308.dist
                      if L9_310 < L10_311 then
                        L9_310 = print
                        L10_311 = "\227\129\160\227\129\140\227\128\129\229\175\190\232\177\161\227\129\168\227\129\174\232\183\157\233\155\162\227\129\140\233\129\160\227\129\153\227\129\142\227\129\159"
                        L9_310(L10_311)
                        L9_310 = L1_302.far
                        L9_310 = L9_310 + 1
                        L1_302.far = L9_310
                      else
                        L9_310 = L1_302.angle
                        L9_310 = L9_310 + 1
                        L1_302.angle = L9_310
                        L9_310 = target_count
                        L10_311 = "Photo"
                        L11_312 = L8_309
                        L9_310(L10_311, L11_312)
                      end
                    end
                  else
                    L9_310 = L7_308.state
                    L10_311 = kPHOTO_OUT
                    if L9_310 == L10_311 then
                      L9_310 = print
                      L10_311 = "\229\175\190\232\177\161\227\129\140\227\131\149\227\131\172\227\131\188\227\131\160\229\164\150\227\129\171\227\129\132\227\130\139"
                      L9_310(L10_311)
                      L9_310 = L1_302.out
                      L9_310 = L9_310 + 1
                      L1_302.out = L9_310
                    else
                      L9_310 = L7_308.state
                      L10_311 = kPHOTO_BACK
                      if L9_310 == L10_311 then
                        L9_310 = print
                        L10_311 = "\229\175\190\232\177\161\227\129\140\229\190\140\227\130\141 or \231\156\159\230\168\170\227\130\146\229\144\145\227\129\132\227\129\166\227\129\132\227\130\139"
                        L9_310(L10_311)
                        L9_310 = L7_308.dist
                        L10_311 = L0_301.near
                        if L9_310 < L10_311 then
                          L9_310 = print
                          L10_311 = "\227\129\160\227\129\140\227\128\129\229\175\190\232\177\161\227\129\168\227\129\174\232\183\157\233\155\162\227\129\140\232\191\145\227\129\153\227\129\142\227\129\159"
                          L9_310(L10_311)
                          L9_310 = L1_302.near
                          L9_310 = L9_310 + 1
                          L1_302.near = L9_310
                        else
                          L9_310 = L0_301.far
                          L10_311 = L7_308.dist
                          if L9_310 < L10_311 then
                            L9_310 = print
                            L10_311 = "\227\129\160\227\129\140\227\128\129\229\175\190\232\177\161\227\129\168\227\129\174\232\183\157\233\155\162\227\129\140\233\129\160\227\129\153\227\129\142\227\129\159"
                            L9_310(L10_311)
                            L9_310 = L1_302.far
                            L9_310 = L9_310 + 1
                            L1_302.far = L9_310
                          else
                            L9_310 = L1_302.back
                            L9_310 = L9_310 + 1
                            L1_302.back = L9_310
                            L9_310 = target_count
                            L10_311 = "Photo"
                            L11_312 = L8_309
                            L9_310(L10_311, L11_312)
                          end
                        end
                      else
                        L9_310 = print
                        L10_311 = "\227\129\157\227\129\174\228\187\150"
                        L9_310(L10_311)
                      end
                    end
                  end
                end
              end
            end
          end
          if L3_304 >= 2 then
            for L8_309, L9_310 in L5_306(L6_307) do
              if L9_310 >= 1 then
              end
            end
            if L5_306 == false then
              L5_306(L6_307)
              L5_306(L6_307)
              L5_306(L6_307)
            elseif L3_304 >= 2 then
              L5_306(L6_307)
              L5_306(L6_307)
              L5_306(L6_307)
            elseif L5_306 == true then
              L5_306(L6_307)
              L5_306(L6_307)
              L5_306(L6_307)
            else
              L5_306(L6_307)
              L5_306(L6_307)
              L5_306(L6_307, L7_308)
              L5_306(L6_307)
              L5_306[L4_305] = true
              L5_306(L6_307)
            end
          else
            L3_304(L4_305)
            for L9_310, L10_311 in L6_307(L7_308) do
              if L5_306 < L4_305 then
              end
            end
            if L6_307 == false then
              L6_307(L7_308)
              L6_307(L7_308)
            elseif L6_307 < 2 then
              L6_307(L7_308)
              L6_307(L7_308)
            elseif L3_304 == "near" then
              L6_307(L7_308)
              L6_307(L7_308)
            elseif L3_304 == "far" then
              L6_307(L7_308)
              L6_307(L7_308)
            elseif L3_304 == "out" then
              L6_307(L7_308)
              L6_307(L7_308)
            else
              L6_307(L7_308)
              L6_307(L7_308)
            end
          end
          L3_304()
        end
      end
      if L2_303 >= 5 then
        L2_303(L3_304)
        _mission_clear = true
      end
      if L2_303 == true then
        _mission_start = false
        _mission_clear = false
        L2_303()
        L2_303(L3_304, L4_305)
        L2_303()
        L2_303()
        repeat
          L2_303()
        until L2_303
        L2_303()
        L2_303()
        L2_303(L3_304)
        break
      elseif L2_303 == true then
        _mission_start = false
        _mission_faled = false
        L2_303()
        L2_303(L3_304, L4_305)
        L2_303()
        repeat
          L2_303()
        until L2_303
        L2_303()
        L2_303()
      end
      L2_303()
    end
    for L4_305, L5_306 in L1_302(L2_303) do
      for L9_310, L10_311 in L6_307(L7_308) do
        L11_312 = findGameObject2
        L11_312 = L11_312("EnemyGenerator", L10_311)
        L11_312:requestAllEnemyKill()
      end
    end
  else
    L0_301(L1_302)
    L0_301(L1_302)
  end
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  if HUD:counter99_99IsVisible() then
    HUD:counter99_99SetVisible(false)
  end
  if _photo ~= nil then
    print("\230\147\141\228\189\156\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171")
    _photo:coercionCaption(false)
    photojudge_function_reset()
    photojudge_end_function_reset()
  end
end
function target_count(A0_313, A1_314)
  if A0_313 == "Photo" then
    if string.match(A1_314, "player") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\130\173\227\131\136\227\130\165\227\131\179")
      _PhotoTarget_player = true
    elseif string.match(A1_314, "defender") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\131\135\227\130\163\227\131\149\227\130\167\227\131\179\227\131\128\227\131\188")
      _PhotoTarget_enemy.defender = _PhotoTarget_enemy.defender + 1
    elseif string.match(A1_314, "runner") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\131\169\227\131\179\227\131\138\227\131\188")
      _PhotoTarget_enemy.runner = _PhotoTarget_enemy.runner + 1
    elseif string.match(A1_314, "stalker") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\130\185\227\131\136\227\131\188\227\130\171\227\131\188")
      _PhotoTarget_enemy.stalker = _PhotoTarget_enemy.stalker + 1
    elseif string.match(A1_314, "lasercannon") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\131\172\227\131\188\227\130\182\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179")
      _PhotoTarget_enemy.lasercannon = _PhotoTarget_enemy.lasercannon + 1
    elseif string.match(A1_314, "treecannon") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\131\132\227\131\170\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179")
      _PhotoTarget_enemy.treecannon = _PhotoTarget_enemy.treecannon + 1
    elseif string.match(A1_314, "guardcore") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\130\172\227\131\188\227\131\137\227\130\179\227\130\162")
      _PhotoTarget_enemy.guardcore = _PhotoTarget_enemy.guardcore + 1
    elseif string.match(A1_314, "gellyfish") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\130\184\227\130\167\227\131\170\227\131\188\227\131\149\227\130\163\227\131\131\227\130\183\227\131\165")
      _PhotoTarget_enemy.gellyfish = _PhotoTarget_enemy.gellyfish + 1
    elseif string.match(A1_314, "imp") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\130\164\227\131\179\227\131\151")
      _PhotoTarget_enemy.imp = _PhotoTarget_enemy.imp + 1
    elseif string.match(A1_314, "jammer") ~= nil then
      print("\230\146\174\229\189\177\229\175\190\232\177\161\239\188\154\227\130\184\227\131\163\227\131\158\227\131\188")
      _PhotoTarget_enemy.jammer = _PhotoTarget_enemy.jammer + 1
    end
  elseif A0_313 == "Spawn" then
    if string.match(A1_314, "defender") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\135\227\130\163\227\131\149\227\130\167\227\131\179\227\131\128\227\131\188")
      _Spawn_enemy.defender = _Spawn_enemy.defender + 1
    elseif string.match(A1_314, "runner") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\169\227\131\179\227\131\138\227\131\188")
      _Spawn_enemy.runner = _Spawn_enemy.runner + 1
    elseif string.match(A1_314, "stalker") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\185\227\131\136\227\131\188\227\130\171\227\131\188")
      _Spawn_enemy.stalker = _Spawn_enemy.stalker + 1
    elseif string.match(A1_314, "lasercannon") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\172\227\131\188\227\130\182\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179")
      _Spawn_enemy.lasercannon = _Spawn_enemy.lasercannon + 1
    elseif string.match(A1_314, "treecannon") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\132\227\131\170\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179")
      _Spawn_enemy.treecannon = _Spawn_enemy.treecannon + 1
    elseif string.match(A1_314, "guardcore") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\172\227\131\188\227\131\137\227\130\179\227\130\162")
      _Spawn_enemy.guardcore = _Spawn_enemy.guardcore + 1
    elseif string.match(A1_314, "gellyfish") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\184\227\130\167\227\131\170\227\131\188\227\131\149\227\130\163\227\131\131\227\130\183\227\131\165")
      _Spawn_enemy.gellyfish = _Spawn_enemy.gellyfish + 1
    elseif string.match(A1_314, "imp") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\164\227\131\179\227\131\151")
      _Spawn_enemy.imp = _Spawn_enemy.imp + 1
    elseif string.match(A1_314, "jammer") ~= nil then
      print("\229\135\186\231\143\190\227\129\153\227\130\139\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\184\227\131\163\227\131\158\227\131\188")
      _Spawn_enemy.jammer = _Spawn_enemy.jammer + 1
    end
  elseif A0_313 == "Dead" then
    if string.match(A1_314, "defender") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\135\227\130\163\227\131\149\227\130\167\227\131\179\227\131\128\227\131\188")
      _Spawn_enemy.defender = _Spawn_enemy.defender - 1
      if _Spawn_enemy.defender <= 0 then
        print("\227\131\135\227\130\163\227\131\149\227\130\167\227\131\179\227\131\128\227\131\188\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "runner") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\169\227\131\179\227\131\138\227\131\188")
      _Spawn_enemy.runner = _Spawn_enemy.runner - 1
      if _Spawn_enemy.runner <= 0 then
        print("\227\131\169\227\131\179\227\131\138\227\131\188\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "stalker") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\185\227\131\136\227\131\188\227\130\171\227\131\188")
      _Spawn_enemy.stalker = _Spawn_enemy.stalker - 1
      if _Spawn_enemy.stalker <= 0 then
        print("\227\130\185\227\131\136\227\131\188\227\130\171\227\131\188\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "lasercannon") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\172\227\131\188\227\130\182\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179")
      _Spawn_enemy.lasercannon = _Spawn_enemy.lasercannon - 1
      if _Spawn_enemy.lasercannon <= 0 then
        print("\227\131\172\227\131\188\227\130\182\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "treecannon") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\131\132\227\131\170\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179")
      _Spawn_enemy.treecannon = _Spawn_enemy.treecannon - 1
      if _Spawn_enemy.treecannon <= 0 then
        print("\227\131\132\227\131\170\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "guardcore") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\172\227\131\188\227\131\137\227\130\179\227\130\162")
      _Spawn_enemy.guardcore = _Spawn_enemy.guardcore - 1
      if _Spawn_enemy.guardcore <= 0 then
        print("\227\130\172\227\131\188\227\131\137\227\130\179\227\130\162\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "gellyfish") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\184\227\130\167\227\131\170\227\131\188\227\131\149\227\130\163\227\131\131\227\130\183\227\131\165")
      _Spawn_enemy.gellyfish = _Spawn_enemy.gellyfish - 1
      if _Spawn_enemy.gellyfish <= 0 then
        print("\227\130\184\227\130\167\227\131\170\227\131\188\227\131\149\227\130\163\227\131\131\227\130\183\227\131\165\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "imp") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\164\227\131\179\227\131\151")
      _Spawn_enemy.imp = _Spawn_enemy.imp - 1
      if _Spawn_enemy.imp <= 0 then
        print("\227\130\164\227\131\179\227\131\151\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    elseif string.match(A1_314, "jammer") ~= nil then
      print("\230\173\187\228\186\161\227\129\151\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\227\130\184\227\131\163\227\131\158\227\131\188")
      _Spawn_enemy.jammer = _Spawn_enemy.jammer - 1
      if _Spawn_enemy.jammer <= 0 then
        print("\227\130\184\227\131\163\227\131\158\227\131\188\227\129\140\229\133\168\230\187\133\227\129\151\227\129\159")
      end
    end
  end
end
function photojudge_function_reset()
  print("\227\131\149\227\130\169\227\131\136\227\131\129\227\130\167\227\131\131\227\130\175\233\150\162\233\128\163\233\150\162\230\149\176\227\129\174\227\131\170\227\130\187\227\131\131\227\131\136\229\135\166\231\144\134")
  _PhotoTarget_player = false
  for _FORV_3_, _FORV_4_ in pairs(_PhotoTarget_enemy) do
    _PhotoTarget_enemy[_FORV_3_] = 0
  end
end
function photojudge_end_function_reset()
  print("\227\131\149\227\130\169\227\131\136\227\131\129\227\130\167\227\131\131\227\130\175\227\129\174\231\181\130\228\186\134\227\129\171\228\188\180\227\129\134\233\150\162\233\128\163\233\150\162\230\149\176\227\129\174\227\131\170\227\130\187\227\131\131\227\131\136\229\135\166\231\144\134")
  _photo:kill()
  _photo = nil
  _PhotoCaption_Stopflag = false
  for _FORV_3_, _FORV_4_ in pairs(_Spawn_enemy) do
    _Spawn_enemy[_FORV_3_] = 0
  end
  for _FORV_3_, _FORV_4_ in pairs(_PhotoSuccess_enemy) do
    _PhotoSuccess_enemy[_FORV_3_] = false
  end
end
