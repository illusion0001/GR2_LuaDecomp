dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/dm04_common.lua")
FIELD_01 = 1
FIELD_02 = 2
FIELD_03 = 3
FIELD_04 = 4
FIELD_05 = 5
FIELD_MAX = FIELD_05
CHECK_POINT_FRIEND_ATTR_NUM = {3}
dm04_lumino = false
_black_nevi_count_tbl = {}
_white_nevi_count_tbl = {}
_enmgen_black_special_tbl = {}
_enmgen_black_tbl = {}
_enmgen_white_tbl = {}
_field_attr_tbl = nil
_black_field_hdl_tbl = {}
_white_field_hdl_tbl = {}
dm04_hint_wait = true
enmgen2_black_01_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_dark",
      locator = "locator_b01_special",
      name = "blacknevi_special_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
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
enmgen2_black_02_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_dark",
      locator = "locator_b02_special",
      name = "blacknevi_special_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
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
enmgen2_black_03_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_dark",
      locator = "locator_b03_special",
      name = "blacknevi_special_03",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
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
enmgen2_black_04_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "treecannon_dark",
      locator = "locator_b04_special",
      name = "blacknevi_special_04",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
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
enmgen2_black_05_special = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_dark",
      locator = "locator_b05_special",
      name = "blacknevi_special_05",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
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
enmgen2_black_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b01_01",
      name = "blacknevi_01_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b01_02",
      name = "blacknevi_01_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
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
      A0_92:getSpecTable().spawnSet[1].name,
      A0_92:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_94, A1_95)
    Fn_enemyAshPopGem(A0_94, A1_95)
  end
}
enmgen2_black_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b02_01",
      name = "blacknevi_02_01",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b02_02",
      name = "blacknevi_02_02",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
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
      A0_108:getSpecTable().spawnSet[1].name,
      A0_108:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_110, A1_111)
    Fn_enemyAshPopGem(A0_110, A1_111)
  end
}
enmgen2_black_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b03_01",
      name = "blacknevi_03_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b03_02",
      name = "blacknevi_03_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
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
      A0_124:getSpecTable().spawnSet[1].name,
      A0_124:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_126, A1_127)
    Fn_enemyAshPopGem(A0_126, A1_127)
  end
}
enmgen2_black_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b04_01",
      name = "blacknevi_04_01",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b04_02",
      name = "blacknevi_04_02",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
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
      A0_140:getSpecTable().spawnSet[1].name,
      A0_140:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_142, A1_143)
    Fn_enemyAshPopGem(A0_142, A1_143)
  end
}
enmgen2_black_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b05_01",
      name = "blacknevi_05_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b05_02",
      name = "blacknevi_05_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_144, A1_145)
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
  end,
  onSetupGem = function(A0_156, A1_157)
    Fn_enemyPopGemSetup(A0_156, {
      A0_156:getSpecTable().spawnSet[1].name,
      A0_156:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_158, A1_159)
    Fn_enemyAshPopGem(A0_158, A1_159)
  end
}
enmgen2_white_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w01_01",
      name = "whitenevi_01_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_shine"
    },
    {
      type = "stalker_shine",
      locator = "locator_w01_02",
      name = "whitenevi_01_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_160, A1_161)
    if A1_161 ~= nil then
      A1_161:setEnableHomingTarget(false)
    end
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
  onObjectAsh = function(A0_170, A1_171)
  end
}
enmgen2_white_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_shine",
      locator = "locator_w02_01",
      name = "whitenevi_02_01",
      ai_spawn_option = "Runner/Runner_dm04bc_shine"
    },
    {
      type = "runner_shine",
      locator = "locator_w02_02",
      name = "whitenevi_02_02",
      ai_spawn_option = "Runner/Runner_dm04bc_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_172, A1_173)
    if A1_173 ~= nil then
      A1_173:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_174)
    local L1_175
  end,
  onEnter = function(A0_176)
    local L1_177
  end,
  onLeave = function(A0_178)
    local L1_179
  end,
  onObjectDead = function(A0_180, A1_181)
  end,
  onObjectAsh = function(A0_182, A1_183)
  end
}
enmgen2_white_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w03_01",
      name = "whitenevi_03_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_shine"
    },
    {
      type = "stalker_shine",
      locator = "locator_w03_02",
      name = "whitenevi_03_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_184, A1_185)
    if A1_185 ~= nil then
      A1_185:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_186)
    local L1_187
  end,
  onEnter = function(A0_188)
    local L1_189
  end,
  onLeave = function(A0_190)
    local L1_191
  end,
  onObjectDead = function(A0_192, A1_193)
  end,
  onObjectAsh = function(A0_194, A1_195)
  end
}
enmgen2_white_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner_shine",
      locator = "locator_w04_01",
      name = "whitenevi_04_01",
      ai_spawn_option = "Runner/Runner_dm04bc_shine"
    },
    {
      type = "runner_shine",
      locator = "locator_w04_02",
      name = "whitenevi_04_02",
      ai_spawn_option = "Runner/Runner_dm04bc_shine"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_196, A1_197)
    if A1_197 ~= nil then
      A1_197:setEnableHomingTarget(false)
    end
  end,
  onUpdate = function(A0_198)
    local L1_199
  end,
  onEnter = function(A0_200)
    local L1_201
  end,
  onLeave = function(A0_202)
    local L1_203
  end,
  onObjectDead = function(A0_204, A1_205)
  end,
  onObjectAsh = function(A0_206, A1_207)
  end
}
enmgen2_white_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_shine",
      locator = "locator_w05_01",
      name = "whitenevi_05_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_shine"
    },
    {
      type = "stalker_shine",
      locator = "locator_w05_02",
      name = "whitenevi_05_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_shine"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_208, A1_209)
    if A1_209 ~= nil then
      A1_209:setEnableHomingTarget(false)
    end
  end,
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
  onObjectAsh = function(A0_218, A1_219)
  end
}
function Initialize()
  local L0_220, L1_221, L2_222, L3_223
  for L3_223 = 1, FIELD_MAX do
    _black_field_hdl_tbl[L3_223] = findGameObject2("GimmickBg", "bg2_field_b" .. string.format("%02d", L3_223))
    _white_field_hdl_tbl[L3_223] = findGameObject2("GimmickBg", "bg2_field_w" .. string.format("%02d", L3_223))
    _enmgen_black_special_tbl[L3_223] = findGameObject2("EnemyGenerator", "enmgen2_black_" .. string.format("%02d", L3_223) .. "_special")
    _enmgen_black_tbl[L3_223] = findGameObject2("EnemyGenerator", "enmgen2_black_" .. string.format("%02d", L3_223))
    _enmgen_white_tbl[L3_223] = findGameObject2("EnemyGenerator", "enmgen2_white_" .. string.format("%02d", L3_223))
    _black_nevi_count_tbl[L3_223] = 0
    _white_nevi_count_tbl[L3_223] = 0
  end
  _field_attr_tbl = L0_220
  if L0_220 == nil then
    _field_attr_tbl = L0_220
    L0_220[L1_221] = L2_222
    L0_220[L1_221] = L2_222
    L0_220[L1_221] = L2_222
    L0_220[L1_221] = L2_222
    L0_220[L1_221] = L2_222
  end
  L0_220(L1_221)
  L0_220(L1_221)
  L0_220(L1_221)
  L0_220(L1_221)
  L0_220(L1_221)
  L0_220(L1_221)
end
function Ingame()
  Fn_userCtrlAllOff()
  for _FORV_3_, _FORV_4_ in ipairs(_field_attr_tbl) do
    if _FORV_4_ == FIELD_ATTR_WHITE then
      _white_field_hdl_tbl[_FORV_3_]:setActive(true)
      _black_field_hdl_tbl[_FORV_3_]:setActive(false)
    else
      _white_field_hdl_tbl[_FORV_3_]:setActive(false)
      _black_field_hdl_tbl[_FORV_3_]:setActive(true)
    end
  end
  for _FORV_3_ = 1, FIELD_MAX do
    _enmgen_white_tbl[_FORV_3_]:requestPrepare()
    setNeviEventListener(_enmgen_white_tbl[_FORV_3_])
    _enmgen_black_tbl[_FORV_3_]:requestPrepare()
    setNeviEventListener(_enmgen_black_tbl[_FORV_3_])
    _enmgen_black_special_tbl[_FORV_3_]:requestPrepare()
  end
  for _FORV_3_ = 1, FIELD_MAX do
    while _enmgen_white_tbl[_FORV_3_]:isPrepared() == false do
      wait()
    end
    while _enmgen_black_tbl[_FORV_3_]:isPrepared() == false do
      wait()
    end
    while _enmgen_black_special_tbl[_FORV_3_]:isPrepared() == false do
      wait()
    end
  end
  Fn_sensorOn("spheresensor2_nevi_detector_01")
  Fn_sensorOn("spheresensor2_nevi_detector_02")
  Fn_sensorOn("spheresensor2_nevi_detector_03")
  Fn_sensorOn("spheresensor2_nevi_detector_04")
  Fn_sensorOn("spheresensor2_nevi_detector_05")
  for _FORV_3_, _FORV_4_ in ipairs(_field_attr_tbl) do
    if _FORV_4_ == FIELD_ATTR_WHITE then
      _enmgen_white_tbl[_FORV_3_]:requestSpawn()
      _enmgen_white_tbl[_FORV_3_]:requestIdlingEnemy(true)
      _enmgen_white_tbl[_FORV_3_]:setAutoRevirthSwitch(true)
      _enmgen_white_tbl[_FORV_3_]:setEnemyMarker(false)
    else
      _enmgen_black_tbl[_FORV_3_]:requestSpawn()
      _enmgen_black_tbl[_FORV_3_]:requestIdlingEnemy(true)
      _enmgen_black_tbl[_FORV_3_]:setAutoRevirthSwitch(true)
      _enmgen_black_special_tbl[_FORV_3_]:requestSpawn()
      _enmgen_black_special_tbl[_FORV_3_]:requestIdlingEnemy(true)
    end
  end
  Fn_missionStart()
  Fn_missionView("dm04_01000")
  Fn_captionView("dm04_01001")
  Fn_lookAtObjectWait("locator2_battle_view")
  waitSeconds(1)
  HUD:info("dm04_info_01", false)
  for _FORV_5_, _FORV_6_ in ipairs(_field_attr_tbl) do
    if _FORV_6_ == FIELD_ATTR_WHITE then
      _enmgen_white_tbl[_FORV_5_]:requestIdlingEnemy(false)
    else
      _enmgen_black_tbl[_FORV_5_]:requestIdlingEnemy(false)
      _enmgen_black_special_tbl[_FORV_5_]:requestIdlingEnemy(false)
    end
  end
  Fn_userCtrlOn()
  while dm04_lumino == false do
    wait()
  end
  invokeTask(platformColorCheck):abort()
  Fn_sensorOff("spheresensor2_nevi_detector_01")
  Fn_sensorOff("spheresensor2_nevi_detector_02")
  Fn_sensorOff("spheresensor2_nevi_detector_03")
  Fn_sensorOff("spheresensor2_nevi_detector_04")
  Fn_sensorOff("spheresensor2_nevi_detector_05")
  waitSeconds(3)
  invokeTask(hint_comment):abort()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_224, L1_225
end
function addCountNevi(A0_226, A1_227)
  if string.match(A1_227, "(blacknevi.*)") ~= nil then
    _black_nevi_count_tbl[A0_226] = _black_nevi_count_tbl[A0_226] + 1
    print(string.format("Enemy Entered field%02d:%d enemies present", A0_226, _black_nevi_count_tbl[A0_226]))
  elseif string.match(A1_227, "(whitenevi.*)") ~= nil then
    _white_nevi_count_tbl[A0_226] = _white_nevi_count_tbl[A0_226] + 1
    print(string.format("Enemy Entered field%02d:%d enemies present", A0_226, _white_nevi_count_tbl[A0_226]))
  end
end
function subCountNevi(A0_228, A1_229)
  if string.match(A1_229, "(blacknevi.*)") ~= nil then
    _black_nevi_count_tbl[A0_228] = _black_nevi_count_tbl[A0_228] - 1
    print(string.format("Enemy Left field%02d:%d enemies present", A0_228, _black_nevi_count_tbl[A0_228]))
  elseif string.match(A1_229, "(whitenevi.*)") ~= nil then
    _white_nevi_count_tbl[A0_228] = _white_nevi_count_tbl[A0_228] - 1
    print(string.format("Enemy Left field%02d:%d enemies present", A0_228, _white_nevi_count_tbl[A0_228]))
  end
end
function spheresensor2_nevi_detector_01_OnEnter(A0_230, A1_231)
  local L2_232, L3_233
  L2_232 = addCountNevi
  L3_233 = FIELD_01
  L2_232(L3_233, A1_231:getName())
end
function spheresensor2_nevi_detector_02_OnEnter(A0_234, A1_235)
  local L2_236, L3_237
  L2_236 = addCountNevi
  L3_237 = FIELD_02
  L2_236(L3_237, A1_235:getName())
end
function spheresensor2_nevi_detector_03_OnEnter(A0_238, A1_239)
  local L2_240, L3_241
  L2_240 = addCountNevi
  L3_241 = FIELD_03
  L2_240(L3_241, A1_239:getName())
end
function spheresensor2_nevi_detector_04_OnEnter(A0_242, A1_243)
  local L2_244, L3_245
  L2_244 = addCountNevi
  L3_245 = FIELD_04
  L2_244(L3_245, A1_243:getName())
end
function spheresensor2_nevi_detector_05_OnEnter(A0_246, A1_247)
  local L2_248, L3_249
  L2_248 = addCountNevi
  L3_249 = FIELD_05
  L2_248(L3_249, A1_247:getName())
end
function spheresensor2_nevi_detector_01_OnLeave(A0_250, A1_251)
  local L2_252, L3_253
  L2_252 = subCountNevi
  L3_253 = FIELD_01
  L2_252(L3_253, A1_251:getName())
end
function spheresensor2_nevi_detector_02_OnLeave(A0_254, A1_255)
  local L2_256, L3_257
  L2_256 = subCountNevi
  L3_257 = FIELD_02
  L2_256(L3_257, A1_255:getName())
end
function spheresensor2_nevi_detector_03_OnLeave(A0_258, A1_259)
  local L2_260, L3_261
  L2_260 = subCountNevi
  L3_261 = FIELD_03
  L2_260(L3_261, A1_259:getName())
end
function spheresensor2_nevi_detector_04_OnLeave(A0_262, A1_263)
  local L2_264, L3_265
  L2_264 = subCountNevi
  L3_265 = FIELD_04
  L2_264(L3_265, A1_263:getName())
end
function spheresensor2_nevi_detector_05_OnLeave(A0_266, A1_267)
  local L2_268, L3_269
  L2_268 = subCountNevi
  L3_269 = FIELD_05
  L2_268(L3_269, A1_267:getName())
end
function platformColorCheck()
  local L0_270
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
      if _black_nevi_count_tbl[_FORV_4_] == 0 then
        if _field_attr_tbl[_FORV_4_] ~= FIELD_ATTR_WHITE then
          _field_attr_tbl[_FORV_4_] = FIELD_ATTR_WHITE
          _enmgen_white_tbl[_FORV_4_]:requestSpawn()
          _enmgen_white_tbl[_FORV_4_]:setEnemyMarker(false)
          _white_field_hdl_tbl[_FORV_4_]:setActive(true)
          _black_field_hdl_tbl[_FORV_4_]:setActive(false)
          _enmgen_white_tbl[_FORV_4_]:setAutoRevirthSwitch(true)
          _enmgen_black_tbl[_FORV_4_]:setAutoRevirthSwitch(false)
          flow_comment(true)
        end
      elseif 0 < _black_nevi_count_tbl[_FORV_4_] and _white_nevi_count_tbl[_FORV_4_] == 0 and _field_attr_tbl[_FORV_4_] ~= FIELD_ATTR_BLACK then
        _field_attr_tbl[_FORV_4_] = FIELD_ATTR_BLACK
        _enmgen_black_tbl[_FORV_4_]:requestSpawn()
        _enmgen_black_special_tbl[_FORV_4_]:requestSpawn()
        _white_field_hdl_tbl[_FORV_4_]:setActive(false)
        _black_field_hdl_tbl[_FORV_4_]:setActive(true)
        _enmgen_black_tbl[_FORV_4_]:setAutoRevirthSwitch(true)
        _enmgen_white_tbl[_FORV_4_]:setAutoRevirthSwitch(false)
        flow_comment(false)
      end
    end
    setTowerDefenseCheckPoint(ggd.EventFlags__dm04__flag01, FIELD_ATTR_WHITE, _field_attr_tbl, CHECK_POINT_FRIEND_ATTR_NUM)
    if L0_270 == FIELD_MAX then
      dm04_lumino = true
      break
    elseif L0_270 == 0 then
      Fn_captionViewWait("dm04_01002")
      Fn_scriptGameOver()
      break
    end
    wait()
  end
end
function flow_comment(A0_271)
  if A0_271 == true then
    dm04_hint_wait = false
    if RandI(1, 5) == 1 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_01003")
    elseif RandI(1, 5) == 2 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_01004")
    elseif RandI(1, 5) == 3 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_01005")
    elseif RandI(1, 5) == 4 then
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_01006")
    else
      Sound:playSE("cro_261", 1)
      Fn_captionView("dm04_01007")
    end
  elseif RandI(1, 5) == 1 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_01008")
  elseif RandI(1, 5) == 2 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_01009")
  elseif RandI(1, 5) == 3 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_01010")
  elseif RandI(1, 5) == 4 then
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_01011")
  else
    Sound:playSE("cro_262", 1)
    Fn_captionView("dm04_01012")
  end
end
function hint_comment()
  waitSeconds(15)
  if dm04_hint_wait == true then
    Sound:playSE("cro_260", 1)
    Fn_captionView("dm04_01013")
  end
  waitSeconds(30)
  if dm04_hint_wait == true then
    Sound:playSE("cro_260", 1)
    Fn_captionView("dm04_01014")
  end
  waitSeconds(30)
  if dm04_hint_wait == true then
    Sound:playSE("cro_260", 1)
    Fn_captionView("dm04_01015")
  end
end
function outrange_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Sound:playSE("cro_260", 1)
    Fn_captionViewWait("dm04_01016")
  end)
end
function setNeviEventListener(A0_272)
  A0_272:setEventListener("DamageEnemyReport", function(A0_273)
    if A0_273.attacker == "other" then
      RAC_createEffect({
        eff_name = "ef_nev_death_nvhan",
        world_pos = findGameObject2("Puppet", A0_273.name):getWorldTransform()
      })
      A0_272:requestEnemyKill(findGameObject2("Puppet", A0_273.name):getBrain())
    end
    return A0_273
  end)
end
