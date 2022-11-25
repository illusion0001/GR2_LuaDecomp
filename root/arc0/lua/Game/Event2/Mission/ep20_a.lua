dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_sdemo1 = nil
_sdemo2 = nil
_sdemo3 = nil
_boss_gauge = nil
_energy_field_brain = nil
_energy_field_gen = nil
_defeatFirstBub = false
_defeatEnergyField = false
_unica_brain = nil
_permet_brain = nil
_unica_pup = nil
_permet_pup = nil
_bubCnt = 0
_openBubCnt = 0
_isChargingEnergy = true
_beginReinforceBubHp = false
_centerNode = nil
_isBlownOff = false
_warp_caption_flag = false
_countTimeBub = 0
enmgen2_unica_permet = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stingray_unica",
      locator = "locator_unica",
      name = "unica",
      ai_spawn_option = "Unica/unica_ep20_a"
    },
    {
      type = "stingray_permet",
      locator = "locator_permet",
      name = "permet",
      ai_spawn_option = "Permet/permet_ep20_a"
    },
    {
      type = "unica_ep20",
      locator = "locator_01",
      name = "unica_n",
      target_vehicle = "unica",
      ai_spawn_option = "Unica/unica_ep20_a"
    },
    {
      type = "permet_ep20",
      locator = "locator_01",
      name = "permet_n",
      target_vehicle = "permet",
      ai_spawn_option = "Permet/permet_ep20_a"
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
enmgen2_energy_field = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "energy_field",
      locator = "locator_01_01",
      name = "energy_field"
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
    local L3_26
    L3_26 = enmgen2_energy_field
    L3_26.enemyDeadNum = enmgen2_energy_field.enemyDeadNum + 1
    _defeatEnergyField = true
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_27, L1_28
    L0_27 = enmgen2_energy_field
    L0_27 = L0_27.spawnSet
    L0_27 = #L0_27
    return L0_27
  end,
  getEnemyDeadNum = function()
    local L1_29
    L1_29 = enmgen2_energy_field
    L1_29 = L1_29.enemyDeadNum
    return L1_29
  end,
  getEnemyName = function(A0_30)
    local L1_31
    L1_31 = enmgen2_energy_field
    L1_31 = L1_31.spawnSet
    L1_31 = L1_31[A0_30]
    L1_31 = L1_31.name
    return L1_31
  end
}
enmgen2_kali_durga = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_01",
      name = "kali",
      ai_spawn_option = "Kali/kali_demo_ep20a"
    },
    {
      type = "durga",
      locator = "locator_01",
      name = "durga",
      ai_spawn_option = "Durga/durga_demo_ep20a"
    }
  },
  onUpdate = function(A0_32)
    local L1_33
  end,
  onEnter = function(A0_34)
    local L1_35
  end,
  onLeave = function(A0_36)
    local L1_37
  end,
  onObjectDead = function(A0_38, A1_39)
  end,
  onObjectAsh = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyDeadNum = A0_40:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_42)
    return #A0_42.spawnSet
  end,
  getEnemyDeadNum = function(A0_43)
    local L1_44
    L1_44 = A0_43.enemyDeadNum
    return L1_44
  end,
  getEnemyName = function(A0_45, A1_46)
    local L2_47
    L2_47 = A0_45.spawnSet
    L2_47 = L2_47[A1_46]
    L2_47 = L2_47.name
    return L2_47
  end
}
enmgen2_bub_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "bub",
      locator = "locator_01_01",
      name = "bub_01"
    },
    {
      type = "bub",
      locator = "locator_01_02",
      name = "bub_02"
    },
    {
      type = "bub",
      locator = "locator_01_03",
      name = "bub_03"
    },
    {
      type = "bub",
      locator = "locator_01_04",
      name = "bub_04"
    },
    {
      type = "bub",
      locator = "locator_01_05",
      name = "bub_05"
    },
    {
      type = "bub",
      locator = "locator_01_06",
      name = "bub_06"
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
    _bubCnt = _bubCnt + 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onObjectDead = function(A0_56, A1_57)
  end,
  onObjectAsh = function(A0_58, A1_59)
    enmgen2_bub_01.enemyDeadNum = enmgen2_bub_01.enemyDeadNum + 1
    if enmgen2_bub_01.getEnemyDeadNum() == enmgen2_bub_01.getEnemyMax() then
      _defeatFirstBub = true
    end
    _bubCnt = _bubCnt - 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onSetupGem = function(A0_60, A1_61)
    Fn_enemyPopGemSetup(A0_60, {
      "bub_01",
      "bub_02",
      "bub_03",
      "bub_04",
      "bub_05",
      "bub_06"
    }, 1, 4, "A")
    Fn_enemyPopGemSetup(A0_60, {
      "bub_01",
      "bub_02",
      "bub_03",
      "bub_04",
      "bub_05",
      "bub_06"
    }, 3, 5, "B")
  end,
  onPopGem = function(A0_62, A1_63)
    Fn_enemyAshPopGem(A0_62, A1_63, {"A", "B"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_64, L1_65
    L0_64 = enmgen2_bub_01
    L0_64 = L0_64.spawnSet
    L0_64 = #L0_64
    return L0_64
  end,
  getEnemyDeadNum = function()
    local L1_66
    L1_66 = enmgen2_bub_01
    L1_66 = L1_66.enemyDeadNum
    return L1_66
  end,
  getEnemyName = function(A0_67)
    local L1_68
    L1_68 = enmgen2_bub_01
    L1_68 = L1_68.spawnSet
    L1_68 = L1_68[A0_67]
    L1_68 = L1_68.name
    return L1_68
  end
}
enmgen2_bub_hp_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "bub",
      locator = "locator_01_01",
      name = "bub_hp_01"
    },
    {
      type = "bub",
      locator = "locator_01_02",
      name = "bub_hp_02"
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
  onSpawn = function(A0_75, A1_76)
    _bubCnt = _bubCnt + 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onObjectDead = function(A0_77, A1_78)
  end,
  onObjectAsh = function(A0_79, A1_80)
    enmgen2_bub_hp_01.enemyDeadNum = enmgen2_bub_hp_01.enemyDeadNum + 1
    if enmgen2_bub_hp_01.getEnemyDeadNum() == enmgen2_bub_hp_01.getEnemyMax() then
      _defeatFirstBub = true
    end
    _bubCnt = _bubCnt - 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onSetupGem = function(A0_81, A1_82)
    Fn_enemyPopGemSetup(A0_81, {"bub_hp_01", "bub_hp_02"}, 1, 4, "A")
    Fn_enemyPopGemSetup(A0_81, {"bub_hp_01", "bub_hp_02"}, 2, 5, "B")
  end,
  onPopGem = function(A0_83, A1_84)
    Fn_enemyAshPopGem(A0_83, A1_84, {"A", "B"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_85, L1_86
    L0_85 = enmgen2_bub_hp_01
    L0_85 = L0_85.spawnSet
    L0_85 = #L0_85
    return L0_85
  end,
  getEnemyDeadNum = function()
    local L1_87
    L1_87 = enmgen2_bub_hp_01
    L1_87 = L1_87.enemyDeadNum
    return L1_87
  end,
  getEnemyName = function(A0_88)
    local L1_89
    L1_89 = enmgen2_bub_hp_01
    L1_89 = L1_89.spawnSet
    L1_89 = L1_89[A0_88]
    L1_89 = L1_89.name
    return L1_89
  end
}
enmgen2_bub_time_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "bub",
      locator = "locator_01_01",
      name = "bub_time_01_01"
    },
    {
      type = "bub",
      locator = "locator_01_02",
      name = "bub_time_01_02"
    }
  },
  onUpdate = function(A0_90)
    local L1_91
  end,
  onEnter = function(A0_92)
    local L1_93
  end,
  onLeave = function(A0_94)
    local L1_95
  end,
  onSpawn = function(A0_96, A1_97)
    _bubCnt = _bubCnt + 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onObjectDead = function(A0_98, A1_99)
  end,
  onObjectAsh = function(A0_100, A1_101)
    enmgen2_bub_time_01.enemyDeadNum = enmgen2_bub_time_01.enemyDeadNum + 1
    if enmgen2_bub_time_01.getEnemyDeadNum() == enmgen2_bub_time_01.getEnemyMax() then
      _defeatFirstBub = true
    end
    _bubCnt = _bubCnt - 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onSetupGem = function(A0_102, A1_103)
    Fn_enemyPopGemSetup(A0_102, {
      "bub_time_01_01",
      "bub_time_01_02"
    }, 1, 4, "A")
    Fn_enemyPopGemSetup(A0_102, {
      "bub_time_01_01",
      "bub_time_01_02"
    }, 2, 5, "B")
  end,
  onPopGem = function(A0_104, A1_105)
    Fn_enemyAshPopGem(A0_104, A1_105, {"A", "B"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_106, L1_107
    L0_106 = enmgen2_bub_time_01
    L0_106 = L0_106.spawnSet
    L0_106 = #L0_106
    return L0_106
  end,
  getEnemyDeadNum = function()
    local L1_108
    L1_108 = enmgen2_bub_time_01
    L1_108 = L1_108.enemyDeadNum
    return L1_108
  end,
  getEnemyName = function(A0_109)
    local L1_110
    L1_110 = enmgen2_bub_time_01
    L1_110 = L1_110.spawnSet
    L1_110 = L1_110[A0_109]
    L1_110 = L1_110.name
    return L1_110
  end
}
enmgen2_bub_time_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "bub",
      locator = "locator_01_01",
      name = "bub_time_02_01"
    },
    {
      type = "bub",
      locator = "locator_01_02",
      name = "bub_time_02_02"
    }
  },
  onUpdate = function(A0_111)
    local L1_112
  end,
  onEnter = function(A0_113)
    local L1_114
  end,
  onLeave = function(A0_115)
    local L1_116
  end,
  onSpawn = function(A0_117, A1_118)
    _bubCnt = _bubCnt + 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onObjectDead = function(A0_119, A1_120)
  end,
  onObjectAsh = function(A0_121, A1_122)
    enmgen2_bub_time_02.enemyDeadNum = enmgen2_bub_time_02.enemyDeadNum + 1
    if enmgen2_bub_time_02.getEnemyDeadNum() == enmgen2_bub_time_02.getEnemyMax() then
      _defeatFirstBub = true
    end
    _bubCnt = _bubCnt - 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onSetupGem = function(A0_123, A1_124)
    Fn_enemyPopGemSetup(A0_123, {
      "bub_time_02_01",
      "bub_time_02_02"
    }, 1, 4, "A")
    Fn_enemyPopGemSetup(A0_123, {
      "bub_time_02_01",
      "bub_time_02_02"
    }, 2, 5, "B")
  end,
  onPopGem = function(A0_125, A1_126)
    Fn_enemyAshPopGem(A0_125, A1_126, {"A", "B"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_127, L1_128
    L0_127 = enmgen2_bub_time_02
    L0_127 = L0_127.spawnSet
    L0_127 = #L0_127
    return L0_127
  end,
  getEnemyDeadNum = function()
    local L1_129
    L1_129 = enmgen2_bub_time_02
    L1_129 = L1_129.enemyDeadNum
    return L1_129
  end,
  getEnemyName = function(A0_130)
    local L1_131
    L1_131 = enmgen2_bub_time_02
    L1_131 = L1_131.spawnSet
    L1_131 = L1_131[A0_130]
    L1_131 = L1_131.name
    return L1_131
  end
}
enmgen2_bub_time_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "bub",
      locator = "locator_01_01",
      name = "bub_time_03_01"
    },
    {
      type = "bub",
      locator = "locator_01_02",
      name = "bub_time_03_02"
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
  onSpawn = function(A0_138, A1_139)
    _bubCnt = _bubCnt + 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onObjectDead = function(A0_140, A1_141)
  end,
  onObjectAsh = function(A0_142, A1_143)
    enmgen2_bub_time_03.enemyDeadNum = enmgen2_bub_time_03.enemyDeadNum + 1
    if enmgen2_bub_time_03.getEnemyDeadNum() == enmgen2_bub_time_03.getEnemyMax() then
      _defeatFirstBub = true
    end
    _bubCnt = _bubCnt - 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onSetupGem = function(A0_144, A1_145)
    Fn_enemyPopGemSetup(A0_144, {
      "bub_time_03_01",
      "bub_time_03_02"
    }, 1, 4, "A")
    Fn_enemyPopGemSetup(A0_144, {
      "bub_time_03_01",
      "bub_time_03_02"
    }, 2, 5, "B")
  end,
  onPopGem = function(A0_146, A1_147)
    Fn_enemyAshPopGem(A0_146, A1_147, {"A", "B"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_148, L1_149
    L0_148 = enmgen2_bub_time_03
    L0_148 = L0_148.spawnSet
    L0_148 = #L0_148
    return L0_148
  end,
  getEnemyDeadNum = function()
    local L1_150
    L1_150 = enmgen2_bub_time_03
    L1_150 = L1_150.enemyDeadNum
    return L1_150
  end,
  getEnemyName = function(A0_151)
    local L1_152
    L1_152 = enmgen2_bub_time_03
    L1_152 = L1_152.spawnSet
    L1_152 = L1_152[A0_151]
    L1_152 = L1_152.name
    return L1_152
  end
}
enmgen2_bub_time_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "bub",
      locator = "locator_01_01",
      name = "bub_time_04_01"
    },
    {
      type = "bub",
      locator = "locator_01_02",
      name = "bub_time_04_02"
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
    _bubCnt = _bubCnt + 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onObjectDead = function(A0_161, A1_162)
  end,
  onObjectAsh = function(A0_163, A1_164)
    enmgen2_bub_time_04.enemyDeadNum = enmgen2_bub_time_04.enemyDeadNum + 1
    if enmgen2_bub_time_04.getEnemyDeadNum() == enmgen2_bub_time_04.getEnemyMax() then
      _defeatFirstBub = true
    end
    _bubCnt = _bubCnt - 1
    print("\227\131\150\227\131\150\227\129\174\230\149\176" .. _bubCnt)
  end,
  onSetupGem = function(A0_165, A1_166)
    Fn_enemyPopGemSetup(A0_165, {
      "bub_time_04_01",
      "bub_time_04_02"
    }, 1, 4, "A")
    Fn_enemyPopGemSetup(A0_165, {
      "bub_time_04_01",
      "bub_time_04_02"
    }, 2, 5, "B")
  end,
  onPopGem = function(A0_167, A1_168)
    Fn_enemyAshPopGem(A0_167, A1_168, {"A", "B"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_169, L1_170
    L0_169 = enmgen2_bub_time_04
    L0_169 = L0_169.spawnSet
    L0_169 = #L0_169
    return L0_169
  end,
  getEnemyDeadNum = function()
    local L1_171
    L1_171 = enmgen2_bub_time_04
    L1_171 = L1_171.enemyDeadNum
    return L1_171
  end,
  getEnemyName = function(A0_172)
    local L1_173
    L1_173 = enmgen2_bub_time_04
    L1_173 = L1_173.spawnSet
    L1_173 = L1_173[A0_172]
    L1_173 = L1_173.name
    return L1_173
  end
}
function Initialize()
  local L0_174, L1_175, L2_176, L3_177, L4_178
  L0_174 = Fn_recoverEnergyFully
  L0_174()
  L0_174 = Fn_userCtrlAllOff
  L0_174()
  L0_174 = SDemo
  L0_174 = L0_174.create
  L1_175 = "ep20_a_01"
  L0_174 = L0_174(L1_175)
  _sdemo1 = L0_174
  L0_174 = SDemo
  L0_174 = L0_174.create
  L1_175 = "ep20_a_02"
  L0_174 = L0_174(L1_175)
  _sdemo2 = L0_174
  L0_174 = SDemo
  L0_174 = L0_174.create
  L1_175 = "ep20_a_03"
  L0_174 = L0_174(L1_175)
  _sdemo3 = L0_174
  L0_174 = Vector
  L1_175 = -524.9
  L2_176 = 339.2
  L3_177 = 123.8
  L0_174 = L0_174(L1_175, L2_176, L3_177)
  L1_175 = Vector
  L2_176 = -541.9
  L3_177 = 341.1
  L4_178 = 115.5
  L1_175 = L1_175(L2_176, L3_177, L4_178)
  L2_176 = _sdemo1
  L3_177 = L2_176
  L2_176 = L2_176.set
  L4_178 = L0_174
  L2_176(L3_177, L4_178, L1_175)
  L2_176 = _sdemo1
  L3_177 = L2_176
  L2_176 = L2_176.setCameraParam
  L4_178 = nil
  L2_176(L3_177, L4_178, 0.1, {deg = 32})
  L2_176 = Vector
  L3_177 = -622
  L4_178 = 345.7
  L2_176 = L2_176(L3_177, L4_178, 193.4)
  L3_177 = Vector
  L4_178 = -605.5
  L3_177 = L3_177(L4_178, 342.1, 169.1)
  L4_178 = _sdemo2
  L4_178 = L4_178.set
  L4_178(L4_178, L2_176, L3_177)
  L4_178 = _sdemo2
  L4_178 = L4_178.setCameraParam
  L4_178(L4_178, nil, 0.1, {deg = 45})
  L4_178 = _sdemo3
  L4_178 = L4_178.set
  L4_178(L4_178, "locator2_cam_03_01", "locator2_aim_03_01")
  L4_178 = _sdemo3
  L4_178 = L4_178.setCameraParam
  L4_178(L4_178, nil, 0.1, {deg = 35})
  L4_178 = {}
  L4_178.tx = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1.5,
    min_a = 0.2,
    max_t = 10,
    min_t = 5
  }
  L4_178.ty = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1.2,
    min_a = 0,
    max_t = 10,
    min_t = 5
  }
  L4_178.tz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 2.5,
    min_a = 0.5,
    max_t = 20,
    min_t = 10
  }
  findGameObject2("GimmickBg", "bg2_g1_car_pd_03"):setVisibleBlockEnable(false)
  findGameObject2("GimmickBg", "bg2_g1_car_pd_03"):setFloaterParams(L4_178)
  Player:muteVoice(Player.kVoiceMuteLv_All)
end
function Ingame()
  local L0_179, L1_180, L2_181, L3_182, L4_183, L5_184, L6_185, L7_186, L8_187, L9_188, L10_189, L11_190, L12_191, L13_192, L14_193, L15_194, L16_195
  L0_179 = Player
  L1_180 = L0_179
  L0_179 = L0_179.setAttrTune
  L0_179(L1_180, L2_181, L3_182)
  L0_179 = Fn_findAreaHandle
  L1_180 = "dt_a_root"
  L0_179 = L0_179(L1_180)
  if L0_179 then
    L1_180 = L0_179.setSceneParameters
    L1_180(L2_181, L3_182)
    L1_180 = print
    L1_180(L2_181)
  end
  L1_180 = findGameObject2
  L1_180 = L1_180(L2_181, L3_182)
  _energy_field_brain = L1_180
  L1_180 = _energy_field_brain
  L1_180 = L1_180.eventMessage
  L1_180(L2_181, L3_182)
  L1_180 = _energy_field_brain
  L1_180 = L1_180.setVisibleBossMarker
  L1_180(L2_181, L3_182)
  L1_180 = {}
  L1_180 = L2_181
  for L5_184, L6_185 in L2_181(L3_182) do
    L9_188 = false
    L7_186(L8_187, L9_188)
    L9_188 = false
    L7_186(L8_187, L9_188)
  end
  L5_184 = false
  L3_182(L4_183, L5_184)
  L5_184 = false
  L3_182(L4_183, L5_184)
  L5_184 = L3_182
  L4_183(L5_184, L6_185)
  L5_184 = L3_182
  L4_183(L5_184, L6_185)
  L5_184 = L4_183
  L4_183(L5_184, L6_185)
  L5_184 = "Node"
  _centerNode = L4_183
  L5_184 = "EnemyGenerator"
  L5_184 = L4_183.setEnemyMarker
  L5_184(L6_185, L7_186)
  L5_184 = findGameObject2
  L5_184 = L5_184(L6_185, L7_186)
  _energy_field_gen = L5_184
  L5_184 = _energy_field_gen
  L5_184 = L5_184.setEnemyMarker
  L5_184(L6_185, L7_186)
  L5_184 = _energy_field_gen
  L5_184 = L5_184.requestIdlingEnemy
  L5_184(L6_185, L7_186)
  L5_184 = findGameObject2
  L5_184 = L5_184(L6_185, L7_186)
  L6_185(L7_186, L8_187)
  L6_185(L7_186, L8_187)
  _unica_brain = L6_185
  L6_185(L7_186, L8_187)
  L6_185(L7_186, L8_187)
  _permet_brain = L6_185
  L6_185(L7_186, L8_187)
  L6_185(L7_186, L8_187)
  _centerNode = L6_185
  for L9_188 = 1, 4 do
    L10_189 = findGameObject2
    L11_190 = "EnemyBrain"
    L15_194 = L9_188
    L10_189 = L10_189(L11_190, L12_191)
    while true do
      L11_190 = L10_189.isReadyEnemy
      L11_190 = L11_190(L12_191)
      if L11_190 == false then
        L11_190 = wait
        L11_190()
      end
    end
    L11_190 = L10_189.cmd
    L15_194 = true
    L11_190(L12_191, L13_192, L14_193, L15_194)
    L11_190 = bub_open_manager
    L11_190(L12_191)
  end
  L9_188 = L7_186
  L10_189 = true
  L8_187(L9_188, L10_189)
  L9_188 = L8_187
  L10_189 = L7_186
  L9_188 = L7_186.setFollowPoint
  L11_190 = true
  L9_188(L10_189, L11_190, L12_191, L13_192)
  L9_188 = playEnegySound
  L9_188()
  L9_188 = Fn_setBgmPoint
  L10_189 = "battle"
  L11_190 = "bgmPoint1"
  L9_188(L10_189, L11_190)
  L9_188 = Camera
  L10_189 = L9_188
  L9_188 = L9_188.shake3D
  L11_190 = 0
  L15_194 = L14_193
  L15_194 = 25
  L9_188(L10_189, L11_190, L12_191, L13_192, L14_193, L15_194)
  while true do
    L9_188 = Area
    L10_189 = L9_188
    L9_188 = L9_188.isSkyStable
    L9_188 = L9_188(L10_189)
    if not L9_188 then
      L9_188 = wait
      L9_188()
    end
  end
  L9_188 = findGameObject2
  L10_189 = "EnemyBrain"
  L11_190 = "bub_05"
  L9_188 = L9_188(L10_189, L11_190)
  while true do
    L11_190 = L9_188
    L10_189 = L9_188.isReadyEnemy
    L10_189 = L10_189(L11_190)
    if L10_189 == false then
      L10_189 = wait
      L10_189()
    end
  end
  L11_190 = L9_188
  L10_189 = L9_188.cmd
  L10_189(L11_190, L12_191, L13_192, L14_193)
  L10_189 = bub_open_manager
  L11_190 = L9_188
  L10_189(L11_190)
  L10_189 = GameDatabase
  L11_190 = L10_189
  L10_189 = L10_189.get
  L10_189 = L10_189(L11_190, L12_191)
  if L10_189 == false then
    L10_189 = invokeTask
    function L11_190()
      _sdemo1:zoomOut(7, {deg = 45}, "Linear")
    end
    L10_189(L11_190)
    L10_189 = _sdemo1
    L11_190 = L10_189
    L10_189 = L10_189.play
    L10_189(L11_190)
  else
    L10_189 = Camera
    L11_190 = L10_189
    L10_189 = L10_189.lookTo
    L10_189(L11_190, L12_191, L13_192, L14_193)
  end
  L10_189 = Fn_missionStart
  L10_189()
  L10_189 = findGameObject2
  L11_190 = "EnemyBrain"
  L10_189 = L10_189(L11_190, L12_191)
  L11_190 = findGameObject2
  L11_190 = L11_190(L12_191, L13_192)
  while true do
    if not L12_191 then
      L12_191()
    end
  end
  L12_191(L13_192, L14_193)
  L12_191(L13_192, L14_193)
  for L15_194 = 6, 6 do
    L16_195 = findGameObject2
    L16_195 = L16_195("EnemyBrain", "bub_" .. string.format("%02d", L15_194))
    while L16_195:isReadyEnemy() == false do
      wait()
    end
    L16_195:cmd("release", _centerNode, false)
    bub_open_manager(L16_195)
  end
  if L12_191 == false then
    L12_191(L13_192)
    L15_194 = 198.4
    L15_194 = 342.2
    L16_195 = 175.2
    L15_194 = {}
    L15_194.pos = L12_191
    L15_194.time = 7.5
    L15_194.hashfunc = "Linear"
    L15_194 = {L16_195}
    L16_195 = {}
    L16_195.pos = L13_192
    L16_195.time = 7.5
    L16_195.hashfunc = "Linear"
    L16_195 = _sdemo2
    L16_195 = L16_195.play
    L16_195(L16_195, L14_193, L15_194)
  end
  L12_191(L13_192, L14_193)
  if L12_191 == false then
    L12_191(L13_192)
    L12_191(L13_192)
    L13_192.pos = "locator2_cam_03_02"
    L13_192.time = 4
    L13_192.hashfunc = "Linear"
    L15_194 = L12_191
    L16_195 = nil
    L13_192(L14_193, L15_194, L16_195)
    L13_192(L14_193)
    L15_194 = false
    L13_192(L14_193, L15_194)
    repeat
      repeat
        L13_192()
      until L13_192
    until L13_192
    L15_194 = "ExcludeEnergyField"
    L16_195 = true
    L13_192(L14_193, L15_194, L16_195)
    L15_194 = "ExcludeEnergyField"
    L16_195 = true
    L13_192(L14_193, L15_194, L16_195)
    L15_194 = "SetEnergyField"
    L16_195 = {}
    L16_195.pos = "locator2_energy_field_pos"
    L16_195.radius = 25
    L13_192(L14_193, L15_194, L16_195)
    L15_194 = "SetEnergyField"
    L16_195 = {}
    L16_195.pos = "locator2_energy_field_pos"
    L16_195.radius = 25
    L13_192(L14_193, L15_194, L16_195)
    L15_194 = "locator2_unica_route_02"
    L16_195 = "locator2_energy_field_pos"
    L15_194 = "locator2_permet_route_01"
    L16_195 = "locator2_permet_route_02"
    L15_194 = {}
    L15_194.speed = 30
    L15_194.degZ = 90
    L15_194.speedZ = 90
    L15_194.curve = true
    L16_195 = _unica_brain
    L16_195 = L16_195.move
    L16_195(L16_195, L13_192, L15_194)
    L16_195 = _permet_brain
    L16_195 = L16_195.move
    L16_195(L16_195, L14_193, L15_194)
    L16_195 = waitSeconds
    L16_195(2)
    L16_195 = Fn_kaiwaDemoView
    L16_195("ep20_00110k")
    L16_195 = _sdemo3
    L16_195 = L16_195.stop
    L16_195(L16_195)
  else
    L12_191(L13_192, L14_193)
    repeat
      repeat
        L12_191()
      until L12_191
    until L12_191
    L15_194 = true
    L12_191(L13_192, L14_193, L15_194)
    L15_194 = true
    L12_191(L13_192, L14_193, L15_194)
    L15_194 = {}
    L15_194.pos = "locator2_energy_field_pos"
    L15_194.radius = 25
    L12_191(L13_192, L14_193, L15_194)
    L15_194 = {}
    L15_194.pos = "locator2_energy_field_pos"
    L15_194.radius = 25
    L12_191(L13_192, L14_193, L15_194)
  end
  L15_194 = Player
  L16_195 = L15_194
  L15_194 = L15_194.getEnergyMax
  L15_194 = L15_194(L16_195, Player.kEnergy_Gravity)
  L16_195 = true
  L12_191(L13_192, L14_193, L15_194, L16_195)
  L12_191()
  L12_191(L13_192)
  L12_191(L13_192, L14_193)
  L12_191()
  L12_191(L13_192, L14_193)
  L12_191(L13_192, L14_193)
  while true do
    if L12_191 == false then
    end
    if L12_191 == false then
      L12_191()
    end
  end
  L12_191(L13_192)
  L12_191(L13_192)
  _unica_pup = L12_191
  _permet_pup = L12_191
  L12_191()
  L12_191(L13_192)
  repeat
    L12_191()
  until L12_191
  L12_191()
  L12_191()
  L12_191()
  L12_191()
  repeat
    L12_191()
  until L12_191
  L12_191(L13_192, L14_193)
  L12_191()
  L12_191()
  L12_191()
  L12_191()
end
function TargetField()
  invokeTask(function()
    _boss_gauge = HUD:createBossHpGauge({
      obj = findGameObject2("Puppet", "energy_field")
    })
    _boss_gauge:setHp(_energy_field_brain:getHealth() / _energy_field_brain:getMaxHealth())
    _boss_gauge:setActive(true)
    while _defeatEnergyField == false do
      _boss_gauge:setHp(_energy_field_brain:getHealth() / _energy_field_brain:getMaxHealth())
      wait()
      if _energy_field_brain:getHealth() / _energy_field_brain:getMaxHealth() < 0 and _beginReinforceBubHp == false then
        _defeatEnergyField = true
      end
      if _energy_field_brain:getHealth() / _energy_field_brain:getMaxHealth() < 0.7 and _beginReinforceBubHp == false then
        _beginReinforceBubHp = true
      end
    end
  end)
end
function look_at_target_input(A0_196, A1_197)
  while true do
    if Fn_isInSightTarget(A0_196, 0.2) == true then
      break
    end
    if is_camera_input() == true then
      if not (0 + 1 > 10) then
        else
        end
        wait()
      end
  end
  if Fn_lookAtObject(A0_196, A1_197) ~= nil and Fn_lookAtObject(A0_196, A1_197):isRunning() == true then
    Fn_lookAtObject(A0_196, A1_197):abort()
  end
  return true
end
function is_camera_input(A0_198, A1_199)
  local L2_200
  L2_200 = false
  if Pad:getStick(Pad.kStick_Camera) > 0 or Pad:getStick(Pad.kStick_Camera) > 0 then
    L2_200 = true
  end
  return L2_200
end
function gravityGemCreate()
  invokeTask(function()
    local L0_201, L1_202, L2_203, L3_204, L4_205, L5_206, L6_207, L7_208, L8_209, L9_210
    L0_201 = 0
    L1_202 = math
    L1_202 = L1_202.random
    L2_203 = 1
    L3_204 = 16
    L1_202 = L1_202(L2_203, L3_204)
    L2_203 = {}
    while L0_201 <= 45 do
      L3_204 = Player
      L4_205 = L3_204
      L3_204 = L3_204.getEnergy
      L5_206 = Player
      L5_206 = L5_206.kEnergy_Gravity
      L3_204 = L3_204(L4_205, L5_206)
      L4_205 = Player
      L5_206 = L4_205
      L4_205 = L4_205.getEnergyMax
      L6_207 = Player
      L6_207 = L6_207.kEnergy_Gravity
      L4_205 = L4_205(L5_206, L6_207)
      L4_205 = L4_205 / 1
      if L3_204 <= L4_205 then
        L3_204 = createGameObject2
        L4_205 = "Gem"
        L3_204 = L3_204(L4_205)
        L5_206 = L3_204
        L4_205 = L3_204.setGemModelNo
        L6_207 = 4
        L4_205(L5_206, L6_207)
        L4_205 = findGameObject2
        L5_206 = "Node"
        L6_207 = "locator2_energy_field_pos"
        L4_205 = L4_205(L5_206, L6_207)
        L5_206 = L4_205
        L4_205 = L4_205.getWorldPos
        L4_205 = L4_205(L5_206)
        L5_206 = 0
        L6_207 = math
        L6_207 = L6_207.random
        L7_208 = -5
        L8_209 = 5
        L6_207 = L6_207(L7_208, L8_209)
        L7_208 = math
        L7_208 = L7_208.random
        L8_209 = -50
        L9_210 = 25
        L7_208 = L7_208(L8_209, L9_210)
        L8_209 = math
        L8_209 = L8_209.random
        L9_210 = -5
        L8_209 = L8_209(L9_210, 5)
        if L1_202 == 1 then
          L9_210 = Vector
          L9_210 = L9_210(33 + L6_207, 3 + L7_208, 0 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 2 then
          L9_210 = Vector
          L9_210 = L9_210(-33 + L6_207, 4 + L7_208, 0 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 3 then
          L9_210 = Vector
          L9_210 = L9_210(0 + L6_207, -3 + L7_208, 33 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 4 then
          L9_210 = Vector
          L9_210 = L9_210(0 + L6_207, -4 + L7_208, -33 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 5 then
          L9_210 = Vector
          L9_210 = L9_210(25 + L6_207, 1 + L7_208, 25 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 6 then
          L9_210 = Vector
          L9_210 = L9_210(-25 + L6_207, -1 + L7_208, -25 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 7 then
          L9_210 = Vector
          L9_210 = L9_210(-25 + L6_207, 2 + L7_208, 25 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 8 then
          L9_210 = Vector
          L9_210 = L9_210(25 + L6_207, -2 + L7_208, -25 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 9 then
          L9_210 = Vector
          L9_210 = L9_210(30 + L6_207, 3 + L7_208, 10 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 10 then
          L9_210 = Vector
          L9_210 = L9_210(-30 + L6_207, 4 + L7_208, -10 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 11 then
          L9_210 = Vector
          L9_210 = L9_210(10 + L6_207, -3 + L7_208, 30 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 12 then
          L9_210 = Vector
          L9_210 = L9_210(-10 + L6_207, -4 + L7_208, -30 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 13 then
          L9_210 = Vector
          L9_210 = L9_210(30 + L6_207, 3 + L7_208, -10 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 14 then
          L9_210 = Vector
          L9_210 = L9_210(-30 + L6_207, 4 + L7_208, 10 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 15 then
          L9_210 = Vector
          L9_210 = L9_210(-10 + L6_207, -3 + L7_208, 30 + L8_209)
          L5_206 = L4_205 + L9_210
        elseif L1_202 == 16 then
          L9_210 = Vector
          L9_210 = L9_210(10 + L6_207, -4 + L7_208, -30 + L8_209)
          L5_206 = L4_205 + L9_210
        end
        L9_210 = L3_204.setWorldPos
        L9_210(L3_204, L5_206)
        L9_210 = L3_204.setForceMove
        L9_210(L3_204)
        L9_210 = L3_204.setVisible
        L9_210(L3_204, true)
        L9_210 = L3_204.try_init
        L9_210(L3_204)
        L9_210 = L3_204.setVisibleBlockHalfSize
        L9_210(L3_204, 150)
        L9_210 = L3_204.waitForReadyAsync
        L9_210(L3_204, function()
          L3_204:try_start()
        end)
        L9_210 = print
        L9_210("\227\130\184\227\130\167\227\131\160\231\148\159\230\136\144", L1_202)
        L9_210 = table
        L9_210 = L9_210.insert
        L9_210(L2_203, L3_204)
        while true do
          L9_210 = 0
          for _FORV_13_, _FORV_14_ in pairs(L2_203) do
            if L2_203[_FORV_13_]:isRunning() then
              L9_210 = L9_210 + 1
            end
          end
          if L9_210 < 20 then
            print("\227\130\184\227\130\167\227\131\160\231\143\190\229\173\152\230\149\176", L9_210)
          else
            wait(15)
          end
        end
      else
      end
      L0_201 = L0_201 + 1
      if L0_201 > 8 then
        L3_204 = waitSeconds
        L4_205 = 15
        L3_204(L4_205)
      end
      L1_202 = L1_202 + 1
      if L1_202 >= 17 then
        L1_202 = 1
      end
    end
  end)
end
function bub_open_manager(A0_211)
  local L1_212
  L1_212 = false
  invokeTask(function()
    while _defeatEnergyField == false do
      if A0_211:getHealth() == 0 then
        if L1_212 == true then
          _openBubCnt = _openBubCnt - 1
          print("\230\148\190\229\135\186\228\184\173\227\129\174\227\131\150\227\131\150\227\129\174\230\149\176" .. _openBubCnt)
        end
        break
      end
      if A0_211:cmd("isOpen") and L1_212 == false then
        _openBubCnt = _openBubCnt + 1
        print("\230\148\190\229\135\186\228\184\173\227\129\174\227\131\150\227\131\150\227\129\174\230\149\176" .. _openBubCnt)
        L1_212 = true
      end
      wait()
    end
  end)
end
function energy_field_manager()
  invokeTask(function()
    local L0_213
    L0_213 = 0
    while _defeatEnergyField == false do
      if _openBubCnt == 0 and _isChargingEnergy == true then
        _energy_field_brain:eventMessage("endSupply")
        _energy_field_gen:setEnemyMarker(true)
        _energy_field_brain:setEnableHomingTarget(true)
        _isChargingEnergy = false
        _unica_brain:cmd("ExcludeEnergyField", false)
        _permet_brain:cmd("ExcludeEnergyField", false)
        Camera:stopShake(0)
        Camera:shake3D(0, 0.1, 3, _centerNode:getWorldPos(), 10)
        Fn_missionView("ep20_00106")
      elseif 0 < _openBubCnt and _isChargingEnergy == false and L0_213 < 80 then
        L0_213 = L0_213 + 1
      elseif 0 < _openBubCnt and _isChargingEnergy == false and L0_213 >= 80 then
        _energy_field_brain:eventMessage("startSupply")
        _energy_field_gen:setEnemyMarker(false)
        _energy_field_brain:setEnableHomingTarget(false)
        _isChargingEnergy = true
        _unica_brain:cmd("ExcludeEnergyField", true)
        _permet_brain:cmd("ExcludeEnergyField", true)
        Camera:stopShake(0)
        Camera:shake3D(0, 0.15, 3, _centerNode:getWorldPos(), 25)
        Fn_missionView("ep20_00100")
      else
        L0_213 = 0
      end
      wait()
    end
  end)
end
function reinforceBubHp()
  invokeTask(function()
    local L0_214, L1_215, L2_216, L3_217, L4_218, L5_219, L6_220
    while true do
      L0_214 = _defeatEnergyField
      if L0_214 == false then
        L0_214 = _beginReinforceBubHp
        if L0_214 == true then
          L0_214 = findGameObject2
          L1_215 = "EnemyGenerator"
          L0_214 = L0_214(L1_215, L2_216)
          L1_215 = L0_214.requestSpawn
          L1_215(L2_216)
          L1_215 = whoDefeatBub
          L1_215(L2_216)
          L1_215 = {L2_216, L3_217}
          for L5_219 = 1, 2 do
            L6_220 = findGameObject2
            L6_220 = L6_220("EnemyBrain", "bub_hp_" .. string.format("%02d", L5_219))
            while L6_220:isReadyEnemy() == false do
              wait()
            end
            L6_220:move(L1_215[L5_219])
            print("\227\131\150\227\131\150\231\167\187\229\139\149\233\150\139\229\167\139")
            setOpen(L6_220)
          end
          break
        end
      end
      L0_214 = wait
      L0_214()
    end
  end)
end
function setOpen(A0_221)
  invokeTask(function()
    repeat
      wait()
    until A0_221:isMoveEnd()
    print("\227\131\150\227\131\150\231\167\187\229\139\149\231\181\130\228\186\134")
    A0_221:cmd("release", _centerNode, false)
    bub_open_manager(A0_221)
  end)
end
function reinforceBubTime()
  invokeTask(function()
    local L0_222, L1_223, L2_224, L3_225, L4_226, L5_227, L6_228, L7_229
    L0_222 = 0
    _countTimeBub = 0
    repeat
      L1_223 = wait
      L1_223()
      L1_223 = _beginReinforceBubHp
      if L1_223 ~= true then
        L1_223 = _defeatEnergyField
      end
    until L1_223 == false
    while true do
      L1_223 = _defeatEnergyField
      if L1_223 == false then
        if L0_222 >= 2160 then
          L1_223 = _bubCnt
          if L1_223 <= 2 then
            L1_223 = _countTimeBub
            if L1_223 == 0 then
              L1_223 = findGameObject2
              L2_224 = "EnemyGenerator"
              L1_223 = L1_223(L2_224, L3_225)
              L2_224 = L1_223.requestSpawn
              L2_224(L3_225)
              L2_224 = whoDefeatBub
              L2_224(L3_225)
              L2_224 = {L3_225, L4_226}
              for L6_228 = 1, 2 do
                L7_229 = findGameObject2
                L7_229 = L7_229("EnemyBrain", "bub_time_01_" .. string.format("%02d", L6_228))
                while L7_229:isReadyEnemy() == false do
                  wait()
                end
                L7_229:move(L2_224[L6_228])
                print("\227\131\150\227\131\150\231\167\187\229\139\149\233\150\139\229\167\139")
                setOpen(L7_229)
              end
              _countTimeBub = 1
            else
              L1_223 = _countTimeBub
              if L1_223 == 1 then
                L1_223 = findGameObject2
                L2_224 = "EnemyGenerator"
                L1_223 = L1_223(L2_224, L3_225)
                L2_224 = L1_223.requestSpawn
                L2_224(L3_225)
                L2_224 = whoDefeatBub
                L2_224(L3_225)
                L2_224 = {L3_225, L4_226}
                for L6_228 = 1, 2 do
                  L7_229 = findGameObject2
                  L7_229 = L7_229("EnemyBrain", "bub_time_02_" .. string.format("%02d", L6_228))
                  while L7_229:isReadyEnemy() == false do
                    wait()
                  end
                  L7_229:move(L2_224[L6_228])
                  print("\227\131\150\227\131\150\231\167\187\229\139\149\233\150\139\229\167\139")
                  setOpen(L7_229)
                end
                _countTimeBub = 2
              else
                L1_223 = _countTimeBub
                if L1_223 == 2 then
                  L1_223 = findGameObject2
                  L2_224 = "EnemyGenerator"
                  L1_223 = L1_223(L2_224, L3_225)
                  L2_224 = L1_223.requestSpawn
                  L2_224(L3_225)
                  L2_224 = whoDefeatBub
                  L2_224(L3_225)
                  L2_224 = {L3_225, L4_226}
                  for L6_228 = 1, 2 do
                    L7_229 = findGameObject2
                    L7_229 = L7_229("EnemyBrain", "bub_time_03_" .. string.format("%02d", L6_228))
                    while L7_229:isReadyEnemy() == false do
                      wait()
                    end
                    L7_229:move(L2_224[L6_228])
                    print("\227\131\150\227\131\150\231\167\187\229\139\149\233\150\139\229\167\139")
                    setOpen(L7_229)
                  end
                  _countTimeBub = 3
                else
                  L1_223 = _countTimeBub
                  if L1_223 == 3 then
                    L1_223 = findGameObject2
                    L2_224 = "EnemyGenerator"
                    L1_223 = L1_223(L2_224, L3_225)
                    L2_224 = L1_223.requestSpawn
                    L2_224(L3_225)
                    L2_224 = whoDefeatBub
                    L2_224(L3_225)
                    L2_224 = {L3_225, L4_226}
                    for L6_228 = 1, 2 do
                      L7_229 = findGameObject2
                      L7_229 = L7_229("EnemyBrain", "bub_time_04_" .. string.format("%02d", L6_228))
                      while L7_229:isReadyEnemy() == false do
                        wait()
                      end
                      L7_229:move(L2_224[L6_228])
                      print("\227\131\150\227\131\150\231\167\187\229\139\149\233\150\139\229\167\139")
                      setOpen(L7_229)
                    end
                    _countTimeBub = 4
                    break
                  end
                end
              end
            end
            L0_222 = 0
          end
        end
      end
      L1_223 = wait
      L1_223()
      L0_222 = L0_222 + 1
    end
  end)
end
function captionMaster()
  invokeTask(function()
    local L0_230, L1_231, L2_232, L3_233, L4_234, L5_235, L6_236, L7_237, L8_238, L9_239, L10_240, L11_241, L12_242, L13_243, L14_244, L15_245, L16_246, L17_247, L18_248, L19_249, L20_250, L21_251, L22_252
    L0_230 = false
    L1_231 = false
    L2_232 = false
    L3_233 = false
    L4_234 = false
    L5_235 = false
    L6_236 = false
    L7_237 = false
    L8_238 = false
    L9_239 = false
    L10_240 = false
    L11_241 = false
    L12_242 = false
    L13_243 = false
    L14_244 = false
    L15_245 = false
    L16_246 = false
    L17_247 = 0
    L18_248 = nil
    L19_249 = 0
    L20_250 = Time
    L21_251 = L20_250
    L20_250 = L20_250.getGameWorldTimeStamp
    L20_250 = L20_250(L21_251)
    function L21_251(A0_253)
      local L1_254
      L1_254 = A0_253.name
      L18_248 = A0_253.attacker
      A0_253.ret = true
      return A0_253
    end
    L22_252 = _energy_field_gen
    L22_252 = L22_252.setEventListener
    L22_252(L22_252, "DamageEnemyReport", L21_251)
    function L22_252(A0_255)
      if A0_255.eventType == "damage_decay" then
        print("energyfield damage_decay: " .. string.format("%f", A0_255.damageRate))
        L19_249 = A0_255.damageRate
      end
    end
    _energy_field_brain:setEventListener("enemy_energyfield_event", L22_252)
    while true do
      if _isBlownOff == true and L0_230 == false then
        Fn_captionViewWait("ep20_00104")
        Fn_captionViewWait("ep20_00105")
        L0_230 = true
        L17_247 = 0
      elseif _defeatFirstBub == true and L1_231 == false then
        wait(70)
        Fn_captionViewWait("ep20_00107")
        L1_231 = true
        L17_247 = 0
      elseif (L2_232 == false or L20_250 + 900 < Time:getGameWorldTimeStamp()) and _energy_field_brain:getHealth() / _energy_field_brain:getMaxHealth() <= 0.6666666666666666 and L19_249 ~= 0 and L3_233 == false then
        L20_250 = Time:getGameWorldTimeStamp()
        Sound:playSE("pc1_070_always", 1)
        Fn_captionViewWait("ep20_00108")
        Fn_captionViewWait("ep20_00109")
        L2_232 = true
        print("\227\131\166\227\131\148\227\131\136\227\131\188\227\131\171\232\170\152\229\176\142\227\129\139\227\130\137\227\129\174\231\181\140\233\129\142\230\153\130\233\150\147\239\188\154" .. string.format(Time:getGameWorldTimeStamp()))
        L17_247 = 0
      elseif L2_232 == true and L3_233 == false and L18_248 == "player" and L19_249 == 0 then
        Fn_captionViewWait("ep20_00110")
        Fn_captionViewWait("ep20_00111")
        L3_233 = true
        L17_247 = 0
      elseif _beginReinforceBubHp == true and L4_234 == false then
        Fn_captionViewWait("ep20_00112")
        L4_234 = true
        L17_247 = 0
      elseif L1_231 == true and _isChargingEnergy == true and L5_235 == false then
        if math.random(1, 2) == 1 then
          Fn_captionViewWait("ep20_00113")
          Fn_captionViewWait("ep20_00114")
        elseif math.random(1, 2) == 2 then
          Fn_captionViewWait("ep20_00126")
          Fn_captionViewWait("ep20_00127")
        end
        L5_235 = true
        L17_247 = 0
        L6_236 = false
      elseif L5_235 == true and _isChargingEnergy == false and L6_236 == false then
        if math.random(1, 2) == 1 then
          Fn_captionViewWait("ep20_00115")
          Fn_captionViewWait("ep20_00116")
        elseif math.random(1, 2) == 2 then
          Fn_captionViewWait("ep20_00128")
          Fn_captionViewWait("ep20_00129")
        end
        L6_236 = true
        L17_247 = 0
        L4_234 = false
        L5_235 = false
      elseif L1_231 == true and L7_237 == false and L17_247 >= 300 then
        Fn_captionViewWait("ep20_00117")
        Fn_captionViewWait("ep20_00118")
        L7_237 = true
        L17_247 = 0
      elseif L7_237 == true and L8_238 == false and L17_247 >= 300 then
        Sound:playSE("uni_019", 1)
        Fn_captionViewWait("ep20_00102")
        Sound:playSE("per_010", 1)
        Fn_captionViewWait("ep20_00103")
        L8_238 = true
        L17_247 = 0
      elseif L9_239 == false and L17_247 >= 300 then
        invokeTask(function()
          Sound:playSE("ene_durga_vo_talk_1", 1, "", "locator2_energy_field_pos")
          wait(90)
          Sound:playSE("ene_durga_vo_talk_2", 1, "", "locator2_energy_field_pos")
        end)
        Fn_captionViewWait("ep20_00121", 6)
        invokeTask(function()
          Sound:playSE("ene_kali_vo_talk_1", 1, "", "locator2_energy_field_pos")
          wait(90)
          Sound:playSE("ene_kali_vo_talk_2", 1, "", "locator2_energy_field_pos")
        end)
        Fn_captionViewWait("ep20_00122", 6)
        L9_239 = true
        L17_247 = 0
      elseif L10_240 == false and L17_247 >= 450 then
        Sound:playSE("ene_durga_vo_talk_3", 1, "", "locator2_energy_field_pos")
        Fn_captionViewWait("ep20_00123")
        L10_240 = true
        L17_247 = 0
      elseif L11_241 == false and L17_247 >= 450 then
        Sound:playSE("ene_kali_vo_talk_1", 1, "", "locator2_energy_field_pos")
        Fn_captionViewWait("ep20_00124")
        L11_241 = true
        L17_247 = 0
      elseif L12_242 == false and 1 <= _countTimeBub and L17_247 >= 450 then
        Sound:playSE("pc2_074", 1)
        Fn_captionViewWait("ep20_00131")
        L12_242 = true
        L17_247 = 0
      elseif L13_243 == false and 2 <= _countTimeBub and L17_247 >= 450 then
        Fn_captionViewWait("ep20_00132")
        L13_243 = true
        L17_247 = 0
      elseif L14_244 == false and 2 <= _countTimeBub and L17_247 >= 450 then
        Fn_captionViewWait("ep20_00133")
        L14_244 = true
        L17_247 = 0
      elseif L15_245 == false and _countTimeBub >= 3 and L17_247 >= 450 then
        Fn_captionViewWait("ep20_00134")
        L15_245 = true
        L17_247 = 0
      elseif L16_246 == false and _countTimeBub >= 4 and L17_247 >= 450 then
        Sound:playSE("ene_yunica_vo_escape", 1)
        Fn_captionViewWait("ep20_00135")
        Sound:playSE("per_011", 1)
        Fn_captionViewWait("ep20_00136")
        L16_246 = true
        L17_247 = 0
      else
        L17_247 = L17_247 + 1
      end
      L18_248 = nil
      L19_249 = 0
      wait()
    end
  end)
end
function playEnegySound()
  invokeTask(function()
    while _defeatEnergyField ~= true do
      if _isChargingEnergy == true then
        Sound:playSE("ep20_crystalbody_create", 1, "", locator2_energy_field_pos)
      end
      wait(60)
    end
  end)
end
function whoDefeatBub(A0_256)
  invokeTask(function()
    local L0_257, L1_258, L2_259, L3_260, L4_261
    L0_257 = findGameObject2
    L1_258 = "EnemyGenerator"
    L2_259 = A0_256
    L0_257 = L0_257(L1_258, L2_259)
    L1_258, L2_259, L3_260 = nil, nil, nil
    function L4_261(A0_262)
      L1_258 = A0_262.name
      L2_259 = A0_262.attacker
      L3_260 = A0_262.damageHp
      print("enemy name " .. L1_258)
      print("attacker type " .. L2_259)
      A0_262.ret = true
      return A0_262
    end
    L0_257:setEventListener("DestroyEnemyReport", L4_261)
    while true do
      if L2_259 == "other" then
        if _openBubCnt > 0 then
          print("\227\131\166\227\131\139\227\130\171\227\131\154\227\131\171\227\131\161\227\129\140\227\131\150\227\131\150\227\130\146\231\160\180\229\163\138\227\129\151\227\129\159")
          if math.random(1, 3) == 1 then
            Fn_captionView("ep20_00119")
          elseif math.random(1, 3) == 2 then
            Fn_captionView("ep20_00120")
          elseif math.random(1, 3) == 3 then
            Fn_captionView("ep20_00130")
          end
        end
        L2_259 = nil
      end
      wait()
    end
  end)
end
function pcspheresensor2_01_OnEnter()
  print("print", "pcspheresensor2_01_OnEnter")
  if _isChargingEnergy == true then
    _isBlownOff = true
    print("print", "_isBlownOff")
  end
end
function pcspheresensor2_01_OnLeave()
  print("print", "pcspheresensor2_01_OnLeave")
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_263
  L1_263 = _warp_caption_flag
  if L1_263 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep20_00125")
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
function Finalize()
  if Fn_getPlayer() then
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
end
