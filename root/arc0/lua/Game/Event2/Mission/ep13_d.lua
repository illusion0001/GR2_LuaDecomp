dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
import("Vehicle")
HAND_TBL_MAX = 3
BUB_TBL_MAX = 3
PANIC_MOBSHIP_NODES_MAX = 3
NAVI_VIEW_DIST_LIMIT = 50
ENOUGH_TUNE_CHANGE_CNT = 3
KALI_NEAR_DIST = 2.8
BUB_KIT_ENOUGH_DIST = 12
EFFECT_END_TIME = 10
_kali = nil
_kali_pup = nil
_storm_count = 0
_is_remnants_of_hunting = false
_remaining_num = 0
_gs_pupp_tbl = {}
_gs_idx = 0
_eff_tbl = {}
_bub_pupp_tbl = {}
_bub_name_hdl = {}
_bub_go_pos_tbl = {}
_bub_leave_pos_tbl = {}
_bub_open_cnt = {}
_bub_open_cnt[1] = 0
_bub_open_cnt[2] = 0
_bub_open_cnt[3] = 0
_bub_state = {}
_bub_alive = {}
_kali_cap_view = false
_sdemo_1st = nil
_sdemo = nil
_enm_hand01 = nil
_enm_hand02 = nil
_enm_hand03 = nil
_enm_gen01 = nil
_enm_gen02 = nil
_enm_gen03 = nil
_enm_gen01_is_alive = {}
_enm_gen02_is_alive = {}
_enm_gen03_is_alive = {}
_hand_navi_task = nil
_storm_se_hdl_01 = nil
_storm_se_hdl_02 = nil
_storm_se_hdl_03 = nil
_cat_navi_view = false
_more_important_navi_view = false
_remnants_sound_hdl = {}
enmgen2_ep13d_hand01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "hand",
      locator = "locator_storm_01",
      name = "hand_01",
      ai_spawn_option = "Hand/hand_ep13"
    }
  },
  onSpawn = function(A0_0, A1_1)
    local L2_2, L3_3, L4_4
    L3_3 = A1_1
    L2_2 = A1_1.getName
    L2_2 = L2_2(L3_3)
    L4_4 = A1_1
    L3_3 = A1_1.getTypeName
    L3_3 = L3_3(L4_4)
    if L3_3 == "EnemyBrain" and L2_2 == "hand_01" then
      L4_4 = A1_1
      L3_3 = A1_1.getGizmo
      L3_3 = L3_3(L4_4)
      L4_4 = L3_3.getName
      L4_4 = L4_4(L3_3)
      print("Spawn now\227\131\190(`\208\148\194\180)\227\130\157" .. L4_4)
      _gs_pupp_tbl.name = L3_3
    end
  end,
  onObjectDead = function(A0_5, A1_6)
  end,
  onObjectAsh = function(A0_7, A1_8)
    _storm_count = _storm_count + 1
    _gs_idx = 1
    createRemnantsEffect(_gs_idx)
    _enm_gen01:setAutoRevirthSwitch(false)
    print("*+*+*+*+* " .. _gs_idx .. " \227\130\182\227\130\179\231\132\161\233\153\144\230\178\184\227\129\141OFF+*+*+*+*+")
    bubAction(_gs_idx)
    enmgen2_ep13d_01.enemyDeadNum = enmgen2_ep13d_01.enemyDeadNum + 1
  end,
  onSetupGem = function(A0_9, A1_10)
    Fn_enemyPopGemSetup(A0_9, {"hand_01"}, 1, 5)
  end,
  onPopGem = function(A0_11, A1_12)
    Fn_enemyAshPopGem(A0_11, A1_12)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_13)
    return #A0_13.spawnSet
  end,
  getEnemyDeadNum = function(A0_14)
    local L1_15
    L1_15 = A0_14.enemyDeadNum
    return L1_15
  end,
  getEnemyName = function(A0_16, A1_17)
    local L2_18
    L2_18 = A0_16.spawnSet
    L2_18 = L2_18[A1_17]
    L2_18 = L2_18.name
    return L2_18
  end
}
enmgen2_ep13d_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_01_01",
      name = "hand_01_enm_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_01_02",
      name = "hand_01_enm_02"
    },
    {
      type = "runner_strong",
      locator = "locator_01_03",
      name = "hand_01_enm_03"
    },
    {
      type = "runner_strong",
      locator = "locator_01_04",
      name = "hand_01_enm_04"
    },
    {
      type = "runner_strong",
      locator = "locator_01_09",
      name = "hand_01_enm_09"
    }
  },
  onSpawn = function(A0_19, A1_20)
    _enm_gen01_is_alive[A1_20:getName()] = true
  end,
  onObjectDead = function(A0_21, A1_22)
    _enm_gen01_is_alive[A1_22:getName()] = false
  end,
  onObjectAsh = function(A0_23, A1_24)
    local L3_25
    L3_25 = enmgen2_ep13d_01
    L3_25.enemyDeadNum = enmgen2_ep13d_01.enemyDeadNum + 1
  end,
  onSetupGem = function(A0_26, A1_27)
    Fn_enemyPopGemSetup(A0_26, {
      "hand_01_enm_01",
      "hand_01_enm_02",
      "hand_01_enm_03",
      "hand_01_enm_04",
      "hand_01_enm_09",
      "hand_01_enm_10"
    }, 3, 5)
  end,
  onPopGem = function(A0_28, A1_29)
    Fn_enemyAshPopGem(A0_28, A1_29)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_30)
    return #A0_30.spawnSet
  end,
  getEnemyDeadNum = function(A0_31)
    local L1_32
    L1_32 = A0_31.enemyDeadNum
    return L1_32
  end,
  getEnemyName = function(A0_33, A1_34)
    local L2_35
    L2_35 = A0_33.spawnSet
    L2_35 = L2_35[A1_34]
    L2_35 = L2_35.name
    return L2_35
  end
}
enmgen2_ep13d_hand02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "hand",
      locator = "locator_storm_02",
      name = "hand_02",
      ai_spawn_option = "Hand/hand_ep13"
    }
  },
  onSpawn = function(A0_36, A1_37)
    local L2_38, L3_39
    L3_39 = A1_37
    L2_38 = A1_37.getGizmo
    L2_38 = L2_38(L3_39)
    L3_39 = L2_38.getName
    L3_39 = L3_39(L2_38)
    print("Spawn now\227\131\190(`\208\148\194\180)\227\130\157" .. L3_39)
    _gs_pupp_tbl.name = L2_38
  end,
  onObjectDead = function(A0_40, A1_41)
  end,
  onObjectAsh = function(A0_42, A1_43)
    _storm_count = _storm_count + 1
    _gs_idx = 2
    createRemnantsEffect(_gs_idx)
    _enm_gen02:setAutoRevirthSwitch(false)
    print("*+*+*+*+* " .. _gs_idx .. " \227\130\182\227\130\179\231\132\161\233\153\144\230\178\184\227\129\141OFF+*+*+*+*+")
    bubAction(_gs_idx)
    enmgen2_ep13d_02.enemyDeadNum = enmgen2_ep13d_02.enemyDeadNum + 1
  end,
  onSetupGem = function(A0_44, A1_45)
    Fn_enemyPopGemSetup(A0_44, {"hand_02"}, 1, 5)
  end,
  onPopGem = function(A0_46, A1_47)
    Fn_enemyAshPopGem(A0_46, A1_47)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_48)
    return #A0_48.spawnSet
  end,
  getEnemyDeadNum = function(A0_49)
    local L1_50
    L1_50 = A0_49.enemyDeadNum
    return L1_50
  end,
  getEnemyName = function(A0_51, A1_52)
    local L2_53
    L2_53 = A0_51.spawnSet
    L2_53 = L2_53[A1_52]
    L2_53 = L2_53.name
    return L2_53
  end
}
enmgen2_ep13d_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_02_01",
      name = "hand_02_enm_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_02_02",
      name = "hand_02_enm_02"
    },
    {
      type = "imp_strong",
      locator = "locator_02_03",
      name = "hand_02_enm_03"
    },
    {
      type = "imp_strong",
      locator = "locator_02_04",
      name = "hand_02_enm_04"
    },
    {
      type = "gellyfish",
      locator = "locator_02_09",
      name = "hand_02_enm_09"
    },
    {
      type = "imp",
      locator = "locator_02_10",
      name = "hand_02_enm_10"
    }
  },
  onUpdate = function(A0_54)
    local L1_55
  end,
  onEnter = function(A0_56)
    local L1_57
  end,
  onLeave = function(A0_58)
    local L1_59
  end,
  onSpawn = function(A0_60, A1_61)
    _enm_gen02_is_alive[A1_61:getName()] = true
  end,
  onObjectDead = function(A0_62, A1_63)
    _enm_gen02_is_alive[A1_63:getName()] = false
  end,
  onObjectAsh = function(A0_64, A1_65)
    local L3_66
    L3_66 = enmgen2_ep13d_02
    L3_66.enemyDeadNum = enmgen2_ep13d_02.enemyDeadNum + 1
  end,
  onSetupGem = function(A0_67, A1_68)
    Fn_enemyPopGemSetup(A0_67, {
      "hand_02_enm_01",
      "hand_02_enm_02",
      "hand_02_enm_03",
      "hand_02_enm_04",
      "hand_02_enm_09",
      "hand_02_enm_10"
    }, 3, 5)
  end,
  onPopGem = function(A0_69, A1_70)
    Fn_enemyAshPopGem(A0_69, A1_70)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_71)
    return #A0_71.spawnSet
  end,
  getEnemyDeadNum = function(A0_72)
    local L1_73
    L1_73 = A0_72.enemyDeadNum
    return L1_73
  end,
  getEnemyName = function(A0_74, A1_75)
    local L2_76
    L2_76 = A0_74.spawnSet
    L2_76 = L2_76[A1_75]
    L2_76 = L2_76.name
    return L2_76
  end
}
enmgen2_ep13d_hand03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "hand",
      locator = "locator_storm_03",
      name = "hand_03",
      ai_spawn_option = "Hand/hand_ep13"
    }
  },
  onSpawn = function(A0_77, A1_78)
    local L2_79, L3_80
    L3_80 = A1_78
    L2_79 = A1_78.getGizmo
    L2_79 = L2_79(L3_80)
    L3_80 = L2_79.getName
    L3_80 = L3_80(L2_79)
    print("Spawn now\227\131\190(`\208\148\194\180)\227\130\157" .. L3_80)
    _gs_pupp_tbl.name = L2_79
  end,
  onObjectDead = function(A0_81, A1_82)
  end,
  onObjectAsh = function(A0_83, A1_84)
    _storm_count = _storm_count + 1
    _gs_idx = 3
    createRemnantsEffect(_gs_idx)
    _enm_gen03:setAutoRevirthSwitch(false)
    print("*+*+*+*+* " .. _gs_idx .. " \227\130\182\227\130\179\231\132\161\233\153\144\230\178\184\227\129\141OFF+*+*+*+*+")
    bubAction(_gs_idx)
    enmgen2_ep13d_03.enemyDeadNum = enmgen2_ep13d_03.enemyDeadNum + 1
  end,
  onSetupGem = function(A0_85, A1_86)
    Fn_enemyPopGemSetup(A0_85, {"hand_03"}, 1, 5)
  end,
  onPopGem = function(A0_87, A1_88)
    Fn_enemyAshPopGem(A0_87, A1_88)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_89)
    return #A0_89.spawnSet
  end,
  getEnemyDeadNum = function(A0_90)
    local L1_91
    L1_91 = A0_90.enemyDeadNum
    return L1_91
  end,
  getEnemyName = function(A0_92, A1_93)
    local L2_94
    L2_94 = A0_92.spawnSet
    L2_94 = L2_94[A1_93]
    L2_94 = L2_94.name
    return L2_94
  end
}
enmgen2_ep13d_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "guardcore_strong",
      locator = "locator_03_01",
      name = "hand_03_enm_01"
    },
    {
      type = "guardcore_strong",
      locator = "locator_03_02",
      name = "hand_03_enm_02"
    },
    {
      type = "stalker",
      locator = "locator_03_03",
      name = "hand_03_enm_03"
    },
    {
      type = "lasercannon_strong",
      locator = "locator_03_04",
      name = "hand_03_enm_04"
    },
    {
      type = "stalker",
      locator = "locator_03_09",
      name = "hand_03_enm_09"
    },
    {
      type = "stalker",
      locator = "locator_03_10",
      name = "hand_03_enm_10"
    },
    {
      type = "stalker",
      locator = "locator_03_11",
      name = "hand_03_enm_11"
    },
    {
      type = "stalker",
      locator = "locator_03_12",
      name = "hand_03_enm_12"
    },
    {
      type = "stalker",
      locator = "locator_03_13",
      name = "hand_03_enm_13"
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
  onSpawn = function(A0_101, A1_102)
    _enm_gen03_is_alive[A1_102:getName()] = true
  end,
  onObjectDead = function(A0_103, A1_104)
    _enm_gen03_is_alive[A1_104:getName()] = false
    if _is_remnants_of_hunting then
      HUD:counter999SubNum()
      _remaining_num = _remaining_num - 1
    end
  end,
  onObjectAsh = function(A0_105, A1_106)
    local L3_107
    L3_107 = enmgen2_ep13d_03
    L3_107.enemyDeadNum = enmgen2_ep13d_03.enemyDeadNum + 1
  end,
  onSetupGem = function(A0_108, A1_109)
    Fn_enemyPopGemSetup(A0_108, {
      "hand_03_enm_01",
      "hand_03_enm_02",
      "hand_03_enm_03",
      "hand_03_enm_04",
      "hand_03_enm_09",
      "hand_03_enm_10"
    }, 3, 5)
  end,
  onPopGem = function(A0_110, A1_111)
    Fn_enemyAshPopGem(A0_110, A1_111)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_112)
    return #A0_112.spawnSet
  end,
  getEnemyDeadNum = function(A0_113)
    local L1_114
    L1_114 = A0_113.enemyDeadNum
    return L1_114
  end,
  getEnemyName = function(A0_115, A1_116)
    local L2_117
    L2_117 = A0_115.spawnSet
    L2_117 = L2_117[A1_116]
    L2_117 = L2_117.name
    return L2_117
  end
}
enmgen2_kali = {
  spawnOnStart = true,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 0,
  spawnSet = {
    {
      type = "kali",
      locator = "locator_kali_pos",
      name = "kali_01",
      ai_spawn_option = "Kali/kali_ep13_d"
    }
  },
  onUpdate = function(A0_118)
    local L1_119
  end,
  onEnter = function(A0_120)
    local L1_121
  end,
  onLeave = function(A0_122)
    local L1_123
  end,
  onObjectDead = function(A0_124, A1_125)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_126)
    return #A0_126.spawnSet
  end,
  getEnemyDeadNum = function(A0_127)
    local L1_128
    L1_128 = A0_127.enemyDeadNum
    return L1_128
  end,
  getEnemyName = function(A0_129, A1_130)
    local L2_131
    L2_131 = A0_129.spawnSet
    L2_131 = L2_131[A1_130]
    L2_131 = L2_131.name
    return L2_131
  end
}
enmgen2_ep13d_bub_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      name = "bub_01_01",
      type = "bub",
      locator = "locator_bub_01_01"
    },
    {
      name = "bub_01_02",
      type = "bub",
      locator = "locator_bub_01_02"
    },
    {
      name = "bub_01_03",
      type = "bub",
      locator = "locator_bub_01_03"
    }
  },
  onEnter = function(A0_132)
    print("ENTER")
  end,
  onLeave = function(A0_133)
    print("LEAVE")
  end,
  onSpawn = function(A0_134, A1_135)
    local L2_136, L3_137
    L3_137 = A1_135
    L2_136 = A1_135.getTypeName
    L2_136 = L2_136(L3_137)
    if L2_136 == "EnemyBrain" then
      L3_137 = A1_135
      L2_136 = A1_135.getGizmo
      L2_136 = L2_136(L3_137)
      L3_137 = L2_136.getName
      L3_137 = L3_137(L2_136)
      print("Spawn now\227\131\190(`\208\148\194\180)\227\130\157" .. L3_137 .. " : " .. L2_136:getTypeName())
      _bub_pupp_tbl[L3_137] = L2_136
    end
    L2_136 = _bub_alive
    L3_137 = A1_135.getName
    L3_137 = L3_137(A1_135)
    L2_136[L3_137] = true
    L2_136 = print
    L3_137 = "\231\148\159\229\173\152\227\131\149\227\131\169\227\130\176"
    L3_137 = L3_137 .. tostring(_bub_alive[A1_135:getName()])
    L2_136(L3_137)
  end,
  onObjectDead = function(A0_138, A1_139)
    print("BUB\239\188\154DEAD = " .. A1_139:getName())
    _bub_alive[A1_139:getName()] = false
  end,
  onObjectAsh = function(A0_140, A1_141)
    print("\226\152\133BUB:Ash = " .. A1_141:getName())
    if A1_141:getTypeName() == "EnemyBrain" then
      _bub_pupp_tbl.name = nil
    end
    if _kali_cap_view == false then
      _kali_cap_view = true
      invokeTask(function()
        Sound:playSE("ene_kali_vo_reproach_2", 1, "", _kali_pup)
        Fn_captionViewWait("ep13_03008")
        waitSeconds(2)
        _kali_cap_view = false
      end)
    end
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_142)
    return #A0_142.spawnSet
  end,
  getEnemyDeadNum = function(A0_143)
    local L1_144
    L1_144 = A0_143.enemyDeadNum
    return L1_144
  end,
  isEnemyAllDead = function(A0_145)
    local L2_146
    L2_146 = A0_145.enemyDeadNum
    L2_146 = L2_146 >= #A0_145.spawnSet
    return L2_146
  end
}
enmgen2_ep13d_bub_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      name = "bub_02_01",
      type = "bub",
      locator = "locator_bub_02_01"
    },
    {
      name = "bub_02_02",
      type = "bub",
      locator = "locator_bub_02_02"
    },
    {
      name = "bub_02_03",
      type = "bub",
      locator = "locator_bub_02_03"
    }
  },
  onEnter = function(A0_147)
    print("ENTER")
  end,
  onLeave = function(A0_148)
    print("LEAVE")
  end,
  onSpawn = function(A0_149, A1_150)
    local L2_151, L3_152
    L3_152 = A1_150
    L2_151 = A1_150.getTypeName
    L2_151 = L2_151(L3_152)
    if L2_151 == "EnemyBrain" then
      L3_152 = A1_150
      L2_151 = A1_150.getGizmo
      L2_151 = L2_151(L3_152)
      L3_152 = L2_151.getName
      L3_152 = L3_152(L2_151)
      print("Spawn now\227\131\190(`\208\148\194\180)\227\130\157" .. L3_152 .. " : " .. L2_151:getTypeName())
      _bub_pupp_tbl[L3_152] = L2_151
    end
    L2_151 = _bub_alive
    L3_152 = A1_150.getName
    L3_152 = L3_152(A1_150)
    L2_151[L3_152] = true
  end,
  onObjectDead = function(A0_153, A1_154)
    print("BUB\239\188\154DEAD = " .. A1_154:getName())
    _bub_alive[A1_154:getName()] = false
  end,
  onObjectAsh = function(A0_155, A1_156)
    print("\226\152\133BUB:Ash = " .. A1_156:getName())
    if A1_156:getTypeName() == "EnemyBrain" then
      _bub_pupp_tbl.name = nil
    end
    if _kali_cap_view == false then
      _kali_cap_view = true
      invokeTask(function()
        Sound:playSE("ene_kali_vo_reproach_2", 1, "", _kali_pup)
        Fn_captionViewWait("ep13_03008")
        waitSeconds(2)
        _kali_cap_view = false
      end)
    end
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_157)
    return #A0_157.spawnSet
  end,
  getEnemyDeadNum = function(A0_158)
    local L1_159
    L1_159 = A0_158.enemyDeadNum
    return L1_159
  end,
  isEnemyAllDead = function(A0_160)
    local L2_161
    L2_161 = A0_160.enemyDeadNum
    L2_161 = L2_161 >= #A0_160.spawnSet
    return L2_161
  end
}
enmgen2_ep13d_bub_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 10,
  spawnSet = {
    {
      name = "bub_03_01",
      type = "bub",
      locator = "locator_bub_03_01"
    },
    {
      name = "bub_03_02",
      type = "bub",
      locator = "locator_bub_03_02"
    },
    {
      name = "bub_03_03",
      type = "bub",
      locator = "locator_bub_03_03"
    }
  },
  onEnter = function(A0_162)
    print("ENTER")
  end,
  onLeave = function(A0_163)
    print("LEAVE")
  end,
  onSpawn = function(A0_164, A1_165)
    local L2_166, L3_167
    L3_167 = A1_165
    L2_166 = A1_165.getTypeName
    L2_166 = L2_166(L3_167)
    if L2_166 == "EnemyBrain" then
      L3_167 = A1_165
      L2_166 = A1_165.getGizmo
      L2_166 = L2_166(L3_167)
      L3_167 = L2_166.getName
      L3_167 = L3_167(L2_166)
      print("Spawn now\227\131\190(`\208\148\194\180)\227\130\157" .. L3_167 .. " : " .. L2_166:getTypeName())
      _bub_pupp_tbl[L3_167] = L2_166
    end
    L2_166 = _bub_alive
    L3_167 = A1_165.getName
    L3_167 = L3_167(A1_165)
    L2_166[L3_167] = true
  end,
  onObjectDead = function(A0_168, A1_169)
    print("BUB\239\188\154DEAD = " .. A1_169:getName())
    _bub_alive[A1_169:getName()] = false
  end,
  onObjectAsh = function(A0_170, A1_171)
    print("\226\152\133BUB:Ash = " .. A1_171:getName())
    if A1_171:getTypeName() == "EnemyBrain" then
      _bub_pupp_tbl.name = nil
    end
    if _kali_cap_view == false then
      _kali_cap_view = true
      invokeTask(function()
        Sound:playSE("ene_kali_vo_reproach_2", 1, "", _kali_pup)
        Fn_captionViewWait("ep13_03008")
        waitSeconds(2)
        _kali_cap_view = false
      end)
    end
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_172)
    return #A0_172.spawnSet
  end,
  getEnemyDeadNum = function(A0_173)
    local L1_174
    L1_174 = A0_173.enemyDeadNum
    return L1_174
  end,
  isEnemyAllDead = function(A0_175)
    local L2_176
    L2_176 = A0_175.enemyDeadNum
    L2_176 = L2_176 >= #A0_175.spawnSet
    return L2_176
  end
}
function Initialize()
  local L0_177, L1_178, L2_179, L3_180, L4_181, L5_182, L6_183, L7_184
  L0_177(L1_178)
  L0_177(L1_178)
  L0_177(L1_178)
  _kali = L0_177
  L0_177(L1_178, L2_179)
  L0_177(L1_178, L2_179)
  _kali_pup = L0_177
  for L3_180 = 1, HAND_TBL_MAX do
    L4_181[L3_180] = L5_182
    L4_181[L3_180] = L5_182
    for L7_184 = 1, BUB_TBL_MAX do
      _bub_go_pos_tbl[L3_180][L7_184] = "locator2_bub_go_pos_" .. string.format("%02d", L3_180) .. "_" .. string.format("%02d", L7_184)
      _bub_leave_pos_tbl[L3_180][L7_184] = "locator2_bub_leave_pos_" .. string.format("%02d", L3_180) .. "_" .. string.format("%02d", L7_184)
    end
  end
  _sdemo_1st = L0_177
  _sdemo = L0_177
  for L3_180, L4_181 in L0_177(L1_178) do
    L7_184 = enmgen2_ep13d_01
    L7_184 = L7_184.spawnOnStart
    L5_182[L6_183] = L7_184
  end
  for L3_180, L4_181 in L0_177(L1_178) do
    L7_184 = enmgen2_ep13d_02
    L7_184 = L7_184.spawnOnStart
    L5_182[L6_183] = L7_184
  end
  for L3_180, L4_181 in L0_177(L1_178) do
    L7_184 = enmgen2_ep13d_03
    L7_184 = L7_184.spawnOnStart
    L5_182[L6_183] = L7_184
  end
end
function Ingame()
  local L0_185, L1_186, L2_187, L3_188, L4_189, L5_190
  L0_185(L1_186)
  L0_185(L1_186)
  L0_185(L1_186)
  L0_185(L1_186)
  L0_185(L1_186)
  L0_185(L1_186)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  for L3_188 = 1, PANIC_MOBSHIP_NODES_MAX do
    L4_189 = Vehicle
    L5_190 = L4_189
    L4_189 = L4_189.SetPanic
    L4_189(L5_190, true, findGameObject2("Node", "locator2_panic_handpos_" .. string.format("%02d", L3_188)):getWorldPos())
  end
  repeat
    L0_185()
  until L0_185
  _kali_brain = L0_185
  repeat
    repeat
      L0_185()
    until L0_185 ~= nil
  until L0_185
  L0_185(L1_186)
  if L0_185 == 0 then
    L3_188 = true
    L4_189 = 11.2
    L5_190 = false
    L0_185(L1_186, L2_187, L3_188, L4_189, L5_190, false)
    L0_185(L1_186, L2_187)
    L3_188 = 352.469421
    L3_188 = -6.920135
    L4_189 = 352.662476
    L3_188 = L2_187
    L4_189 = L0_185
    L5_190 = L1_186
    L2_187(L3_188, L4_189, L5_190)
    L3_188 = L2_187
    L4_189 = nil
    L5_190 = 0.1
    L2_187(L3_188, L4_189, L5_190, {deg = 50})
    L3_188 = L2_187
    L2_187(L3_188)
    L2_187()
    L3_188 = "oneTimeDemo\227\129\139\227\130\137\239\188\129\239\188\129\239\188\129\239\188\129"
    L2_187(L3_188)
    L2_187()
  else
    L0_185(L1_186)
    L0_185()
    L0_185()
  end
  L3_188 = 1
  L0_185(L1_186, L2_187, L3_188)
  L3_188 = 36
  L4_189 = 33
  L5_190 = 385
  L3_188 = 100
  L0_185(L1_186, L2_187, L3_188)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  L0_185(L1_186, L2_187)
  L3_188 = "DestroyEnemyReport"
  L4_189 = L0_185
  L1_186(L2_187, L3_188, L4_189)
  L3_188 = "DestroyEnemyReport"
  L4_189 = L0_185
  L1_186(L2_187, L3_188, L4_189)
  L3_188 = "DestroyEnemyReport"
  L4_189 = L0_185
  L1_186(L2_187, L3_188, L4_189)
  L2_187()
  L3_188 = "battle"
  L2_187(L3_188)
  L3_188 = L2_187
  L4_189 = "VsHandBattle"
  L5_190 = false
  L2_187(L3_188, L4_189, L5_190)
  L3_188 = L2_187
  L4_189 = false
  L2_187(L3_188, L4_189)
  L3_188 = "EnemyBrain"
  L4_189 = "hand_02"
  L3_188 = findGameObject2
  L4_189 = "EnemyBrain"
  L5_190 = "hand_03"
  L3_188 = L3_188(L4_189, L5_190)
  repeat
    repeat
      L4_189 = wait
      L4_189()
      L5_190 = L2_187
      L4_189 = L2_187.isReadyEnemy
      L4_189 = L4_189(L5_190)
    until L4_189
    L5_190 = L3_188
    L4_189 = L3_188.isReadyEnemy
    L4_189 = L4_189(L5_190)
  until L4_189
  L5_190 = L2_187
  L4_189 = L2_187.setEnableHomingTarget
  L4_189(L5_190, false)
  L5_190 = L3_188
  L4_189 = L3_188.setEnableHomingTarget
  L4_189(L5_190, false)
  L4_189 = print
  L5_190 = "2,3\231\149\170\231\155\174\227\131\143\227\131\179\227\131\137\227\129\174\227\131\150\227\131\172\227\130\164\227\131\179\229\143\150\229\190\151\239\188\134\227\131\155\227\131\188\227\131\159\227\131\179\227\130\176\227\130\191\227\130\178OFF\229\174\140\228\186\134"
  L4_189(L5_190)
  L4_189 = waitSeconds
  L5_190 = 1
  L4_189(L5_190)
  L4_189 = Mv_viewObj
  L5_190 = "locator2_kali_pos"
  L4_189 = L4_189(L5_190, 0.5, 1.5)
  L5_190 = Sound
  L5_190 = L5_190.playSE
  L5_190(L5_190, "ene_kali_vo_lookdown_1")
  L5_190 = Fn_captionViewWait
  L5_190("ep13_03000", 4, 1.8)
  L5_190 = Mv_safeTaskAbort
  L5_190 = L5_190(L4_189)
  L4_189 = L5_190
  L5_190 = invokeTask
  L5_190(function()
    local L0_191
    L0_191 = _kali_brain
    L0_191 = L0_191.move
    L0_191(L0_191, {
      "locator2_kali_move_01_01"
    }, nil)
    repeat
      L0_191 = wait
      L0_191()
      L0_191 = _kali_brain
      L0_191 = L0_191.isMoveEnd
      L0_191 = L0_191(L0_191)
    until L0_191
    L0_191 = {}
    L0_191.height = 5
    _kali_brain:jump("locator2_kali_jump_01_01", L0_191)
    repeat
      wait()
    until _kali_brain:isJumpEnd()
    _kali_brain:endScriptAction()
    _kali:requestIdlingEnemy(false)
    print("\227\130\171\227\131\188\227\131\170\227\130\163\239\188\154\233\128\154\229\184\184\230\140\153\229\139\149\227\129\184\230\136\187\227\129\153\227\130\162\227\130\164\227\131\137\227\131\171\232\167\163\233\153\164\239\188\129\239\188\129")
  end)
  L5_190 = waitSeconds
  L5_190(1)
  L5_190 = nil
  invokeTask(function()
    Fn_missionView("ep13_03001")
    waitSeconds(1.3)
    startHandNaviChangeTask(1)
    waitSeconds(5.5)
    if Fn_sendEventComSb("getAttrTuneChangeCount") < ENOUGH_TUNE_CHANGE_CNT then
      Fn_captionView("ep13_03012", 0)
      L5_190 = invokeTask(function()
        waitSeconds(10)
        Fn_captionViewEnd()
      end)
    end
    Fn_sendEventComSb("abortAttrTuneCheckTask")
  end)
  while _storm_count ~= 1 do
    wait()
  end
  Mv_safeTaskAbort(_hand_navi_task)
  Fn_naviKill()
  L5_190 = Mv_safeTaskAbort(L5_190)
  Sound:stopSEHandle(_storm_se_hdl_01)
  _storm_se_hdl_01 = nil
  _enm_hand02:setEnemyMarker(true)
  _enm_hand02:requestIdlingEnemy(false)
  L2_187:setEnableHomingTarget(true)
  invokeTask(function()
    waitSeconds(1.5)
    _kali:requestIdlingEnemy(true)
    _kali_brain:move({
      "locator2_kali_move_02_01"
    }, nil)
    print("\227\130\171\227\131\188\227\131\170\227\130\163\239\188\154\230\172\161\227\129\174\229\156\176\231\130\185\227\129\184\229\188\183\229\136\182\231\167\187\229\139\149\233\150\139\229\167\139")
    repeat
      wait()
    until _kali_brain:isMoveEnd()
    _kali_brain:endScriptAction()
    _kali:requestIdlingEnemy(false)
    print("\227\130\171\227\131\188\227\131\170\227\130\163\239\188\154\233\128\154\229\184\184\230\140\153\229\139\149\227\129\184\230\136\187\227\129\153\227\130\162\227\130\164\227\131\137\227\131\171\232\167\163\233\153\164\239\188\129\239\188\129")
  end)
  waitSeconds(3)
  Fn_captionView("ep13_03006")
  startHandNaviChangeTask(2)
  while _storm_count ~= 2 do
    wait()
  end
  Mv_safeTaskAbort(_hand_navi_task)
  Fn_naviKill()
  Sound:stopSEHandle(_storm_se_hdl_02)
  _storm_se_hdl_02 = nil
  _enm_hand03:setEnemyMarker(true)
  _enm_hand03:requestIdlingEnemy(false)
  L3_188:setEnableHomingTarget(true)
  invokeTask(function()
    local L0_192, L1_193, L2_194, L3_195, L4_196
    L0_192 = waitSeconds
    L0_192(L1_193)
    L0_192 = _kali
    L0_192 = L0_192.requestIdlingEnemy
    L0_192(L1_193, L2_194)
    L0_192 = _kali_brain
    L0_192 = L0_192.move
    L0_192(L1_193, L2_194, L3_195)
    L0_192 = print
    L0_192(L1_193)
    repeat
      L0_192 = wait
      L0_192()
      L0_192 = _kali_brain
      L0_192 = L0_192.isMoveEnd
      L0_192 = L0_192(L1_193)
    until L0_192
    L0_192 = {}
    L0_192.height = 2
    for L4_196 = 1, 2 do
      _kali_brain:jump("locator2_kali_jump_03_" .. string.format("%02d", L4_196), L0_192)
      repeat
        wait()
      until _kali_brain:isJumpEnd()
    end
    L1_193(L2_194)
    L1_193(L2_194, L3_195)
    L1_193(L2_194)
  end)
  waitSeconds(3)
  Fn_captionView("ep13_03007")
  startHandNaviChangeTask(3)
  while _storm_count ~= HAND_TBL_MAX do
    wait()
  end
  _hand_navi_task = Mv_safeTaskAbort(_hand_navi_task)
  Fn_naviKill()
  _more_important_navi_view = false
  Sound:stopSEHandle(_storm_se_hdl_03)
  _storm_se_hdl_03 = nil
  _enm_gen01:requestAllEnemyKill()
  _enm_gen02:requestAllEnemyKill()
  Fn_captionView("ep13_03002")
  _is_remnants_of_hunting = true
  _remaining_num = _enm_gen03:getEnemyCount()
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter999SetTextID("ep13_03005")
  HUD:counter999SetNum(_remaining_num)
  HUD:counter999SetVisible(true)
  waitSeconds(1)
  Sound:pulse("ep13_announcement2")
  while _remaining_num ~= 0 do
    wait()
  end
  Fn_captionView("ep13_03003")
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_d_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_d_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_navi_kill_d_01")
  HUD:counter999SetVisible(false)
  Fn_sendEventComSb("requestBgScene", false)
  Fn_sendEventComSb("requestTv", false)
  _kali_brain:playMotion("cow01_ep13_stay_01")
  waitSeconds(5)
  Mob:makeSituationPanic(false)
  Vehicle:SetPanic(false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSituation(Player.kSituation_Normal, true, 1, false, false)
  end
  Area:gravityStorm()
  Sound:stopSEHandle(_storm_se_hdl_01)
  Sound:stopSEHandle(_storm_se_hdl_02)
  Sound:stopSEHandle(_storm_se_hdl_03)
end
function pccubesensor2_catwarp_warning_d_01_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    if _more_important_navi_view == false then
      Fn_naviSet(findGameObject2("Node", "pccubesensor2_catwarp_navi_kill_d_01"))
      _cat_navi_view = true
    end
    Fn_captionViewWait("ep13_03013")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_area_d_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_navi_kill_d_01_OnEnter()
  if _cat_navi_view then
    Fn_naviKill()
    _cat_navi_view = false
  end
end
function oneTimeDemo()
  local L0_197, L1_198, L2_199, L3_200, L4_201
  L0_197 = waitSeconds
  L1_198 = 2
  L0_197(L1_198)
  L0_197 = Fn_kaiwaDemoView
  L1_198 = "ep13_00210k"
  L0_197(L1_198)
  L0_197 = Vector
  L1_198 = 34.857246
  L2_199 = -6.761487
  L3_200 = 352.469421
  L0_197 = L0_197(L1_198, L2_199, L3_200)
  L1_198 = Vector
  L2_199 = 33.888973
  L3_200 = -6.920135
  L4_201 = 352.662476
  L1_198 = L1_198(L2_199, L3_200, L4_201)
  L2_199 = {L3_200, L4_201}
  L3_200 = {}
  L3_200.pos = "locator2_sdemo1_cam_02"
  L3_200.time = 1.5
  L4_201 = {}
  L4_201.pos = "locator2_sdemo1_cam_03"
  L4_201.time = 2.5
  L3_200 = {L4_201}
  L4_201 = {}
  L4_201.pos = "locator2_storm_01_aim"
  L4_201.time = 1.5
  L4_201 = {
    {
      pos = "locator2_storm_02_aim",
      time = 1.5
    },
    {
      pos = "locator2_storm_03_aim",
      time = 2.5
    }
  }
  createStorm()
  waitSeconds(0.4)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_storm_01_aim"):getWorldPos())
  waitSeconds(0.1)
  _sdemo:set(L0_197, L1_198)
  _sdemo:setCameraParam(nil, 0.1, {deg = 50})
  _sdemo:play(nil, L3_200)
  waitSeconds(1)
  Fn_captionView("ep13_03004", 5)
  waitSeconds(1)
  _sdemo:play(L2_199, L4_201)
  _kali_brain:endScriptAction()
  Player:setLookAtIk(false, 1, L1_198)
  waitSeconds(1)
  Player:setLookAtIk(true, 1, L1_198)
  waitSeconds(4)
  _sdemo:stop(0)
end
function createStorm()
  invokeTask(function()
    _enm_hand01 = findGameObject2("EnemyGenerator", "enmgen2_ep13d_hand01")
    _enm_hand01:requestSpawn()
    _enm_hand01:setEnemyMarker(false)
    print("_enm_hand01 Spawn")
    _storm_se_hdl_01 = Sound:playSEHandle("amb_ep00_001", 1, "")
    _enm_gen01 = findGameObject2("EnemyGenerator", "enmgen2_ep13d_01")
    _enm_gen01:requestSpawn()
    _enm_gen01:setEnemyMarker(false)
    waitSeconds(2.5)
    _enm_hand02 = findGameObject2("EnemyGenerator", "enmgen2_ep13d_hand02")
    _enm_hand02:requestSpawn()
    _enm_hand02:setEnemyMarker(false)
    _enm_hand02:requestIdlingEnemy(true)
    print("_enm_hand02 Spawn")
    _storm_se_hdl_02 = Sound:playSEHandle("amb_ep00_001", 1, "")
    _enm_gen02 = findGameObject2("EnemyGenerator", "enmgen2_ep13d_02")
    _enm_gen02:requestSpawn()
    _enm_gen02:setEnemyMarker(false)
    waitSeconds(0.5)
    _enm_hand03 = findGameObject2("EnemyGenerator", "enmgen2_ep13d_hand03")
    _enm_hand03:requestSpawn()
    _enm_hand03:setEnemyMarker(false)
    _enm_hand03:requestIdlingEnemy(true)
    print("_enm_hand03 Spawn")
    _storm_se_hdl_03 = Sound:playSEHandle("amb_ep00_001", 1, "")
    _enm_gen03 = findGameObject2("EnemyGenerator", "enmgen2_ep13d_03")
    _enm_gen03:requestSpawn()
    _enm_gen03:setEnemyMarker(false)
  end)
end
function createRemnantsEffect(A0_202)
  invokeTask(function()
    local L0_203
    L0_203 = findGameObject2
    L0_203 = L0_203("Node", "locator2_haze_" .. A0_202 .. "_01")
    print("Effect < " .. A0_202 .. " >play ( n\194\180\226\136\128\239\189\128)n\227\130\156*:.\227\128\130.:*")
    _eff_tbl[A0_202] = Fn_createEffect("haze" .. A0_202 .. "_01", "ef_ev_bkzan_01", L0_203, true)
    _remnants_sound_hdl[A0_202] = Sound:playSEHandle("ene_gstorm_debr_loop", 1, "", _eff_tbl[A0_202])
    Sound:setAudibleRange(_remnants_sound_hdl[A0_202], 150)
    print("\230\174\139\230\187\147\233\159\179\229\134\141\231\148\159\233\150\139\229\167\139\239\188\129\239\188\154\227\130\176\227\131\171\227\131\188\227\131\151", A0_202)
  end)
end
function bubAction(A0_204)
  invokeTask(function()
    local L0_205, L1_206, L2_207, L3_208, L4_209, L5_210, L6_211, L7_212
    while true do
      L0_205 = Fn_isInSightTarget
      L1_206 = "locator2_bub_ray_0"
      L2_207 = A0_204
      L3_208 = "_01"
      L1_206 = L1_206 .. L2_207 .. L3_208
      L2_207 = 1
      L0_205 = L0_205(L1_206, L2_207)
      if L0_205 == false then
        L0_205 = Fn_isInSightTarget
        L1_206 = "locator2_bub_ray_0"
        L2_207 = A0_204
        L3_208 = "_02"
        L1_206 = L1_206 .. L2_207 .. L3_208
        L2_207 = 1
        L0_205 = L0_205(L1_206, L2_207)
        if L0_205 == false then
          L0_205 = Fn_isInSightTarget
          L1_206 = "locator2_bub_ray_0"
          L2_207 = A0_204
          L3_208 = "_03"
          L1_206 = L1_206 .. L2_207 .. L3_208
          L2_207 = 1
          L0_205 = L0_205(L1_206, L2_207)
        end
      end
      if L0_205 ~= false then
        L0_205 = wait
        L0_205()
      end
    end
    L0_205 = findGameObject2
    L1_206 = "EnemyGenerator"
    L2_207 = "enmgen2_ep13d_bub_0"
    L3_208 = A0_204
    L2_207 = L2_207 .. L3_208
    L0_205 = L0_205(L1_206, L2_207)
    L1_206 = 0
    L3_208 = L0_205
    L2_207 = L0_205.setEnemyMarker
    L2_207(L3_208, L4_209)
    while true do
      L3_208 = L0_205
      L2_207 = L0_205.requestSpawn
      L2_207(L3_208)
      while true do
        L3_208 = L0_205
        L2_207 = L0_205.isPrepared
        L2_207 = L2_207(L3_208)
        if not L2_207 then
          L2_207 = wait
          L2_207()
          break
        end
      end
    end
    L2_207 = {}
    L3_208 = waitSeconds
    L3_208(L4_209)
    function L3_208(A0_213, A1_214, A2_215)
      L2_207[A0_213] = findGameObject2("EnemyBrain", A0_213)
      L2_207[A0_213]:setEnableHomingTarget(false)
      invokeTask(function()
        local L0_216, L1_217, L2_218, L3_219
        L0_216 = _bub_pupp_tbl
        L1_217 = A0_213
        L0_216 = L0_216[L1_217]
        L1_217 = L0_216
        L0_216 = L0_216.getBrain
        L0_216 = L0_216(L1_217)
        L1_217 = _bub_go_pos_tbl
        L2_218 = A1_214
        L1_217 = L1_217[L2_218]
        L2_218 = A2_215
        L1_217 = L1_217[L2_218]
        L2_218 = _bub_leave_pos_tbl
        L3_219 = A1_214
        L2_218 = L2_218[L3_219]
        L3_219 = A2_215
        L2_218 = L2_218[L3_219]
        repeat
          L3_219 = wait
          L3_219()
          L3_219 = L0_216.isReadyEnemy
          L3_219 = L3_219(L0_216)
        until L3_219
        L3_219 = L0_216.move
        L3_219(L0_216, {L1_217})
        repeat
          L3_219 = wait
          L3_219()
          L3_219 = L0_216.isMoveEnd
          L3_219 = L3_219(L0_216)
        until L3_219
        L3_219 = _eff_tbl
        L3_219 = L3_219[A1_214]
        while L3_219 == nil do
          wait()
        end
        L0_216:cmd("suction", L3_219)
        repeat
          wait()
        until L0_216:cmd("isOpen")
        _bub_open_cnt[A1_214] = _bub_open_cnt[A1_214] + 1
        print("\227\130\176\227\131\171\227\131\188\227\131\151" .. A1_214 .. "\227\131\150\227\131\150\233\150\139\227\129\132\227\129\159\227\128\130_bub_open_cnt\239\188\154", _bub_open_cnt[A1_214])
        if _bub_open_cnt[A1_214] == 3 then
          _bub_open_cnt[A1_214] = 0
          _eff_tbl[A1_214]:setFadeOutSpawnRate(EFFECT_END_TIME)
          print("\230\174\139\230\187\147\227\130\168\227\131\149\227\130\167\239\188\154\227\131\149\227\130\167\227\131\188\227\131\137\227\130\162\227\130\166\227\131\136\233\150\139\229\167\139")
          Fn_finishedTremEffect(_eff_tbl[A1_214], EFFECT_END_TIME)
          invokeTask(function()
            waitSeconds(EFFECT_END_TIME)
            Sound:stopSEHandle(_remnants_sound_hdl[A1_214])
            _remnants_sound_hdl[A1_214] = nil
            print("\230\174\139\230\187\147SE\231\181\130\228\186\134\239\188\129\239\188\129\239\188\129\239\188\154\227\130\176\227\131\171\227\131\188\227\131\151\239\188\154", A1_214)
          end)
        end
        waitSeconds(EFFECT_END_TIME + 2)
        L0_216:cmd("close")
        print(bub_name, "\239\188\154\233\150\137\227\129\152\227\130\139")
        repeat
          wait()
        until L0_216:cmd("isClose")
        L0_216:move({L2_218})
        waitSeconds(4)
        print("\239\188\154\230\174\139\230\187\147\227\129\139\227\130\137\229\141\129\229\136\134\229\142\187\227\129\163\227\129\159")
        while Fn_isInSightTarget(findGameObject2("Node", A0_213), 1.1) ~= false or not (Fn_getDistanceToPlayer(findGameObject2("Node", A0_213)) >= BUB_KIT_ENOUGH_DIST) do
          wait()
        end
        L1_206 = L1_206 + 1
        if L1_206 == 3 then
          L0_205:requestAllEnemyKill()
        end
      end)
    end
    if L4_209 == 1 then
      for L7_212, _FORV_8_ in L4_209(L5_210) do
        L3_208(_FORV_8_.name, A0_204, L7_212)
      end
    elseif L4_209 == 2 then
      for L7_212, _FORV_8_ in L4_209(L5_210) do
        L3_208(_FORV_8_.name, A0_204, L7_212)
      end
    elseif L4_209 == 3 then
      for L7_212, _FORV_8_ in L4_209(L5_210) do
        L3_208(_FORV_8_.name, A0_204, L7_212)
      end
    end
  end)
end
function startHandNaviChangeTask(A0_220)
  Fn_naviSet(findGameObject2("Node", "hand_" .. string.format("%02d", A0_220)))
  _more_important_navi_view = true
  _hand_navi_task = invokeTask(function()
    while true do
      if Fn_getDistanceToPlayer("locator2_view_storm_" .. string.format("%02d", A0_220)) < NAVI_VIEW_DIST_LIMIT and _more_important_navi_view then
        Fn_naviKill()
        _more_important_navi_view = false
      elseif Fn_getDistanceToPlayer("locator2_view_storm_" .. string.format("%02d", A0_220)) >= NAVI_VIEW_DIST_LIMIT and not _more_important_navi_view then
        Fn_naviSet(findGameObject2("Node", "hand_" .. string.format("%02d", A0_220)))
        _more_important_navi_view = true
      end
      wait()
    end
  end)
end
