dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_litho_theme = nil
_enm_litho_06_01_h = nil
_enm_litho_06_02_h = nil
_enm_litho_06_03_h = nil
_enm_litho_06_04_h = nil
_enemy_spawn_task = nil
_litho_hit_count = 0
_litho_hit_max = 7
_first_hit = false
_cactus_max = 99
_cactus_hdl = {}
_cactus_restore = 60
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_infinite_cap = nil
_debug_flag = false
enmgen_litho_06_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 60,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_litho_06_01_enm_01",
      name = "litho_06_enemy_01"
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
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "litho_06_enemy_01"
    }, 1, 5)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end,
  onObjectDead = function(A0_12, A1_13)
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemyDeadNum = A0_14:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
enmgen_litho_06_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 30,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_litho_06_02_enm_01",
      name = "litho_06_enemy_03"
    },
    {
      type = "runner",
      locator = "locator_litho_06_02_enm_02",
      name = "litho_06_enemy_04"
    },
    {
      type = "guardcore",
      locator = "locator_litho_06_02_enm_03",
      name = "litho_06_enemy_05"
    }
  },
  onUpdate = function(A0_21)
    local L1_22
  end,
  onEnter = function(A0_23)
    local L1_24
  end,
  onLeave = function(A0_25)
    local L1_26
  end,
  onSpawn = function(A0_27, A1_28)
  end,
  onObjectDead = function(A0_29, A1_30)
  end,
  onObjectAsh = function(A0_31, A1_32)
    A0_31:getSpecTable().enemyDeadNum = A0_31:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "litho_06_enemy_03",
      "litho_06_enemy_04"
    }, 2, 5, "gem_02_01")
    Fn_enemyPopGemSetup(A0_33, {
      "litho_06_enemy_05"
    }, 1, 5, "gem_02_02")
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36, {"gem_02_01", "gem_02_02"})
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_37)
    return #A0_37.spawnSet
  end,
  getEnemyDeadNum = function(A0_38)
    local L1_39
    L1_39 = A0_38.enemyDeadNum
    return L1_39
  end,
  isEnemyAllDead = function(A0_40)
    local L2_41
    L2_41 = A0_40.enemyDeadNum
    L2_41 = L2_41 >= #A0_40.spawnSet
    return L2_41
  end
}
enmgen_litho_06_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 30,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_06_03_enm_01",
      name = "litho_06_enemy_07"
    },
    {
      type = "stalker",
      locator = "locator_litho_06_03_enm_02",
      name = "litho_06_enemy_08"
    },
    {
      type = "guardcore",
      locator = "locator_litho_06_03_enm_03",
      name = "litho_06_enemy_09"
    },
    {
      type = "stalker",
      locator = "locator_litho_06_03_enm_04",
      name = "litho_06_enemy_10"
    }
  },
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onSpawn = function(A0_48, A1_49)
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onObjectAsh = function(A0_52, A1_53)
    A0_52:getSpecTable().enemyDeadNum = A0_52:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_54, A1_55)
    Fn_enemyPopGemSetup(A0_54, {
      "litho_06_enemy_09"
    }, 1, 5)
  end,
  onPopGem = function(A0_56, A1_57)
    Fn_enemyAshPopGem(A0_56, A1_57)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_58)
    return #A0_58.spawnSet
  end,
  getEnemyDeadNum = function(A0_59)
    local L1_60
    L1_60 = A0_59.enemyDeadNum
    return L1_60
  end,
  isEnemyAllDead = function(A0_61)
    local L2_62
    L2_62 = A0_61.enemyDeadNum
    L2_62 = L2_62 >= #A0_61.spawnSet
    return L2_62
  end
}
enmgen_litho_06_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_06_04_enm_01",
      name = "litho_06_enemy_11"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_06_04_enm_02",
      name = "litho_06_enemy_12"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_06_04_enm_03",
      name = "litho_06_enemy_13"
    }
  },
  onUpdate = function(A0_63)
    local L1_64
  end,
  onEnter = function(A0_65)
    local L1_66
  end,
  onLeave = function(A0_67)
    local L1_68
  end,
  onSpawn = function(A0_69, A1_70)
  end,
  onObjectDead = function(A0_71, A1_72)
  end,
  onObjectAsh = function(A0_73, A1_74)
    A0_73:getSpecTable().enemyDeadNum = A0_73:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_75, A1_76)
    Fn_enemyPopGemSetup(A0_75, {
      "litho_06_enemy_11",
      "litho_06_enemy_12",
      "litho_06_enemy_13"
    }, 3, 6)
  end,
  onPopGem = function(A0_77, A1_78)
    Fn_enemyAshPopGem(A0_77, A1_78)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_79)
    return #A0_79.spawnSet
  end,
  getEnemyDeadNum = function(A0_80)
    local L1_81
    L1_81 = A0_80.enemyDeadNum
    return L1_81
  end,
  isEnemyAllDead = function(A0_82)
    local L2_83
    L2_83 = A0_82.enemyDeadNum
    L2_83 = L2_83 >= #A0_82.spawnSet
    return L2_83
  end
}
enmgen_litho_06_05_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_06_05_01_enm_01",
      name = "litho_06_enemy_20"
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
  onSpawn = function(A0_90, A1_91)
    invokeTask(function()
      if _infinite_cap == false then
        waitSeconds(2)
        _infinite_cap = true
      end
    end)
  end,
  onObjectDead = function(A0_92, A1_93)
  end,
  onObjectAsh = function(A0_94, A1_95)
    A0_94:getSpecTable().enemyDeadNum = A0_94:getSpecTable().enemyDeadNum + 1
    if _infinite_cap == nil then
      _infinite_cap = false
    end
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
enmgen_litho_06_05_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_06_05_02_enm_01",
      name = "litho_06_enemy_22"
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
  onSpawn = function(A0_107, A1_108)
    invokeTask(function()
      if _infinite_cap == false then
        waitSeconds(2)
        _infinite_cap = true
      end
    end)
  end,
  onObjectDead = function(A0_109, A1_110)
  end,
  onObjectAsh = function(A0_111, A1_112)
    A0_111:getSpecTable().enemyDeadNum = A0_111:getSpecTable().enemyDeadNum + 1
    if _infinite_cap == nil then
      _infinite_cap = false
    end
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_113)
    return #A0_113.spawnSet
  end,
  getEnemyDeadNum = function(A0_114)
    local L1_115
    L1_115 = A0_114.enemyDeadNum
    return L1_115
  end,
  isEnemyAllDead = function(A0_116)
    local L2_117
    L2_117 = A0_116.enemyDeadNum
    L2_117 = L2_117 >= #A0_116.spawnSet
    return L2_117
  end
}
enmgen_litho_06_05_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_litho_06_05_03_enm_01",
      name = "litho_06_enemy_24"
    },
    {
      type = "gellyfish",
      locator = "locator_litho_06_05_03_enm_02",
      name = "litho_06_enemy_25"
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
  onSpawn = function(A0_124, A1_125)
    invokeTask(function()
      if _infinite_cap == false then
        waitSeconds(2)
        _infinite_cap = true
      end
    end)
  end,
  onObjectDead = function(A0_126, A1_127)
  end,
  onObjectAsh = function(A0_128, A1_129)
    A0_128:getSpecTable().enemyDeadNum = A0_128:getSpecTable().enemyDeadNum + 1
    if _infinite_cap == nil then
      _infinite_cap = false
    end
  end,
  onSetupGem = function(A0_130, A1_131)
    Fn_enemyPopGemSetup(A0_130, {
      "litho_06_enemy_24",
      "litho_06_enemy_25"
    }, 2, 5)
  end,
  onPopGem = function(A0_132, A1_133)
    Fn_enemyAshPopGem(A0_132, A1_133)
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
enmgen_litho_06_05_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 40,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_litho_06_05_04_enm_01",
      name = "litho_06_enemy_26"
    },
    {
      type = "stalker",
      locator = "locator_litho_06_05_04_enm_02",
      name = "litho_06_enemy_27"
    }
  },
  onUpdate = function(A0_139)
    local L1_140
  end,
  onEnter = function(A0_141)
    local L1_142
  end,
  onLeave = function(A0_143)
    local L1_144
  end,
  onSpawn = function(A0_145, A1_146)
    invokeTask(function()
      if _infinite_cap == false then
        waitSeconds(2)
        _infinite_cap = true
      end
    end)
  end,
  onObjectDead = function(A0_147, A1_148)
  end,
  onObjectAsh = function(A0_149, A1_150)
    A0_149:getSpecTable().enemyDeadNum = A0_149:getSpecTable().enemyDeadNum + 1
    if _infinite_cap == nil then
      _infinite_cap = false
    end
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
  isEnemyAllDead = function(A0_154)
    local L2_155
    L2_155 = A0_154.enemyDeadNum
    L2_155 = L2_155 >= #A0_154.spawnSet
    return L2_155
  end
}
enmgen_litho_06_05_05 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_litho_06_05_05_enm_01",
      name = "litho_06_enemy_28"
    },
    {
      type = "runner",
      locator = "locator_litho_06_05_05_enm_02",
      name = "litho_06_enemy_29"
    }
  },
  onUpdate = function(A0_156)
    local L1_157
  end,
  onEnter = function(A0_158)
    local L1_159
  end,
  onSpawn = function(A0_160, A1_161)
  end,
  onLeave = function(A0_162)
    local L1_163
  end,
  onSpawn = function(A0_164, A1_165)
  end,
  onObjectDead = function(A0_166, A1_167)
  end,
  onObjectAsh = function(A0_168, A1_169)
    A0_168:getSpecTable().enemyDeadNum = A0_168:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_170, A1_171)
    Fn_enemyPopGemSetup(A0_170, {
      "litho_06_enemy_28",
      "litho_06_enemy_29"
    }, 1, 5)
  end,
  onPopGem = function(A0_172, A1_173)
    Fn_enemyAshPopGem(A0_172, A1_173)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_174)
    return #A0_174.spawnSet
  end,
  getEnemyDeadNum = function(A0_175)
    local L1_176
    L1_176 = A0_175.enemyDeadNum
    return L1_176
  end,
  isEnemyAllDead = function(A0_177)
    local L2_178
    L2_178 = A0_177.enemyDeadNum
    L2_178 = L2_178 >= #A0_177.spawnSet
    return L2_178
  end
}
enmgen_litho_06_05_06 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 20,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_litho_06_05_06_enm_01",
      name = "litho_06_enemy_30"
    }
  },
  onUpdate = function(A0_179)
    local L1_180
  end,
  onEnter = function(A0_181)
    local L1_182
  end,
  onLeave = function(A0_183)
    local L1_184
  end,
  onSpawn = function(A0_185, A1_186)
  end,
  onObjectDead = function(A0_187, A1_188)
  end,
  onObjectAsh = function(A0_189, A1_190)
    A0_189:getSpecTable().enemyDeadNum = A0_189:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_191, A1_192)
    Fn_enemyPopGemSetup(A0_191, {
      "litho_06_enemy_30"
    }, 1, 5)
  end,
  onPopGem = function(A0_193, A1_194)
    Fn_enemyAshPopGem(A0_193, A1_194)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_195)
    return #A0_195.spawnSet
  end,
  getEnemyDeadNum = function(A0_196)
    local L1_197
    L1_197 = A0_196.enemyDeadNum
    return L1_197
  end,
  isEnemyAllDead = function(A0_198)
    local L2_199
    L2_199 = A0_198.enemyDeadNum
    L2_199 = L2_199 >= #A0_198.spawnSet
    return L2_199
  end
}
function Initialize()
  _enm_litho_06_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_01")
  _enm_litho_06_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_02")
  _enm_litho_06_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_03")
  _enm_litho_06_04_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_04")
  _enm_litho_06_05_01_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_05_01")
  _enm_litho_06_05_02_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_05_02")
  _enm_litho_06_05_03_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_05_03")
  _enm_litho_06_05_04_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_05_04")
  _enm_litho_06_05_05_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_05_05")
  _enm_litho_06_05_06_h = findGameObject2("EnemyGenerator", "enmgen2_litho_06_05_06")
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  _litho_obj = Fn_sendEventComSb("requestHandle", "Lithograph", "lithograph_06")
  Fn_sensorOff("cubesensor2_cactus")
  Fn_pcSensorOff("pccubesensor2_infinite")
  Fn_vctrlOff("vctrl2_cactus")
  _cactus_01 = findGameObject2("GimmickBg", "bg2_az_grab_cactus_litho_06_01")
  _cactus_02 = findGameObject2("GimmickBg", "bg2_az_grab_cactus_litho_06_02")
  _cactus_01:setActive(false)
  _cactus_02:setActive(false)
  _cactus_01:setAutoRestore(-1)
  _cactus_02:setAutoRestore(-1)
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_k")
  _catwarp_change = false
end
function Ingame()
  while Fn_sendEventComSb("requestMineInit") == false do
    wait()
  end
  invokeTask(function()
    repeat
      wait()
    until Player:getRecentAreaName() == "az_a_04" or _catwarp_change
    Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_l")
    print("***** ep03_catwarp point:" .. Fn_getCatWarpCheckPoint() .. " *****")
  end)
  Fn_missionStart()
  Fn_userCtrlOn()
  if _debug_flag then
    invokeTask(function()
      repeat
        debugDispPrint("_infinite_cap : " .. tostring(_infinite_cap))
        wait()
      until false
    end)
  end
  _island_navi = invokeTask(function()
    Fn_sendEventComSb("ViewMission")
    waitSeconds(1.3)
    repeat
      if false == false and Fn_getDistanceToPlayer("locator2_litho_navi_06_02") > 5 then
        Fn_naviSet(findGameObject2("Node", "locator2_litho_navi_06_02"))
        if not _catwarp_change then
          _catwarp_change = true
        end
      elseif true == true and Fn_getDistanceToPlayer("locator2_litho_navi_06_02") < 5 then
        Fn_naviKill()
      end
      wait()
    until _litho_theme
    Fn_naviKill()
  end)
  repeat
    wait()
  until Fn_sendEventComSb("isLithographStart")
  litho_init()
  Player:setTargetingPriority(Player.kTargetingPrio_GimmickBgFirst)
  Fn_userCtrlOff()
  _cactus_01:setActive(true)
  _cactus_02:setActive(true)
  Fn_sendEventComSb("setFirstHalfProcessEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isFirstHalfProcessEnd")
  Fn_captionViewWait("ep03_09014", 3, 1)
  Fn_vctrlOn("vctrl2_cactus")
  waitSeconds(2)
  Fn_userCtrlOn()
  Fn_vctrlOff("vctrl2_cactus")
  HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
  HUD:counter99_99SetTextID("ep03_12000")
  HUD:counter99_99SetMax(_litho_hit_max)
  HUD:counter99_99SetNum(0)
  HUD:counter99_99SetVisible(true)
  Fn_sensorOn("cubesensor2_cactus")
  invokeTask(function()
    Fn_missionView("ep03_12001", nil, nil, true)
    Fn_setBgmPoint("battle")
  end)
  invokeTask(infinite_caption)
  invokeTask(function()
    repeat
      repeat
        wait()
      until _litho_hit_count >= _litho_hit_max
      if _litho_theme == nil then
        _litho_theme = true
      end
      wait()
    until _litho_theme
  end)
  repeat
    if _litho_theme == false then
      restart_litho()
    end
    wait()
  until _litho_theme
  if _infinite_cap_task ~= nil then
    _infinite_cap_task:abort()
    _infinite_cap_task = nil
  end
  Fn_setBgmPoint("event", "battle_end")
  HUD:counter99_99SetVisible(false)
  HUD:counter99_99SetNum(0)
  Player:setTargetingPriority(Player.kTargetingPrio_Default)
  Fn_sendEventComSb("setSecondHalfProcessPre")
  Fn_sendEventComSb("missionComplete")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessPreStart")
  _island_navi:abort()
  Fn_sensorOff("cubesensor2_cactus")
  _litho_obj:setLockonPermission(false)
  if _enm_litho_06_01_h ~= nil then
    _enm_litho_06_01_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_02_h ~= nil then
    _enm_litho_06_02_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_03_h ~= nil then
    _enm_litho_06_03_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_04_h ~= nil then
    _enm_litho_06_04_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_05_h ~= nil then
    _enm_litho_06_05_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_05_01_h ~= nil then
    _enm_litho_06_05_01_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_05_02_h ~= nil then
    _enm_litho_06_05_02_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_05_03_h ~= nil then
    _enm_litho_06_05_03_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_05_04_h ~= nil then
    _enm_litho_06_05_04_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_05_05_h ~= nil then
    _enm_litho_06_05_05_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_05_06_h ~= nil then
    _enm_litho_06_05_06_h:requestAllEnemyKill(true)
  end
  if _enm_litho_06_04_h ~= nil then
    _enm_litho_06_04_h:setAutoRevirthSwitch(false)
  end
  if _enm_litho_06_05_h ~= nil then
    _enm_litho_06_05_h:setAutoRevirthSwitch(false)
  end
  if _enm_litho_06_05_01_h ~= nil then
    _enm_litho_06_05_01_h:setAutoRevirthSwitch(false)
  end
  if _enm_litho_06_05_02_h ~= nil then
    _enm_litho_06_05_02_h:setAutoRevirthSwitch(false)
  end
  if _enm_litho_06_05_03_h ~= nil then
    _enm_litho_06_05_03_h:setAutoRevirthSwitch(false)
  end
  if _enm_litho_06_05_04_h ~= nil then
    _enm_litho_06_05_04_h:setAutoRevirthSwitch(false)
  end
  Fn_sendEventComSb("setSecondHalfProcessPreEnd")
  repeat
    wait()
  until Fn_sendEventComSb("isSecondHalfProcessEnd")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function litho_init()
  local L0_200, L1_201, L2_202, L3_203
  L0_200(L1_201)
  _area_04_hdl = L0_200
  for L3_203 = 1, _cactus_max do
    _cactus_hdl[L3_203] = _area_04_hdl:findChildNode(string.format("az_grab_cactus_04_%02d", L3_203), true)
    if _cactus_hdl[L3_203] ~= nil then
      if _cactus_hdl[L3_203]:isBroken() then
        _cactus_hdl[L3_203]:requestRestoreForce()
      end
    else
      break
    end
  end
  L0_200(L1_201, L2_202)
  L0_200(L1_201, L2_202)
  L0_200(L1_201, L2_202)
  _enemy_spawn_task = L0_200
end
function prog_manage()
  print("*** ep03_l:prog_manage ***")
  invokeTask(function()
    repeat
      wait()
    until _litho_hit_count >= 5
    if _enm_litho_06_01_h ~= nil then
      _enm_litho_06_01_h:requestSpawn()
    end
  end)
  invokeTask(function()
    repeat
      wait()
    until _litho_hit_count >= 2
    if _enm_litho_06_02_h ~= nil then
      _enm_litho_06_02_h:requestSpawn()
    end
  end)
  invokeTask(function()
    repeat
      wait()
    until _litho_hit_count >= 3
    if _enm_litho_06_03_h ~= nil then
      _enm_litho_06_03_h:requestSpawn()
    end
  end)
  invokeTask(function()
    repeat
      wait()
    until _litho_hit_count >= 1
    if _enm_litho_06_04_h ~= nil then
      _enm_litho_06_04_h:requestSpawn()
    end
  end)
  repeat
    wait()
  until _litho_hit_count >= 1
  repeat
    wait()
  until _first_hit
  if _enm_litho_06_05_01_h ~= nil then
    _enm_litho_06_05_01_h:requestSpawn()
  end
  repeat
    wait()
  until _litho_hit_count >= 2
  if _enm_litho_06_05_02_h ~= nil then
    _enm_litho_06_05_02_h:requestSpawn()
  end
  repeat
    wait()
  until _litho_hit_count >= 3
  if _enm_litho_06_05_03_h ~= nil then
    _enm_litho_06_05_03_h:requestSpawn()
  end
  repeat
    wait()
  until _litho_hit_count >= 4
  if _enm_litho_06_05_04_h ~= nil then
    _enm_litho_06_05_04_h:requestSpawn()
  end
  repeat
    wait()
  until _litho_hit_count >= 5
  if _enm_litho_06_05_05_h ~= nil then
    _enm_litho_06_05_05_h:requestSpawn()
  end
  repeat
    wait()
  until _litho_hit_count >= 6
  if _enm_litho_06_05_06_h ~= nil then
    _enm_litho_06_05_06_h:requestSpawn()
  end
end
function restart_litho()
  print("*** ep03_l:restart_litho ***")
  _island_navi:abort()
  if _enm_litho_06_01_h ~= nil then
    _enm_litho_06_01_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_02_h ~= nil then
    _enm_litho_06_02_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_03_h ~= nil then
    _enm_litho_06_03_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_04_h ~= nil then
    _enm_litho_06_04_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_05_01_h ~= nil then
    _enm_litho_06_05_01_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_05_02_h ~= nil then
    _enm_litho_06_05_02_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_05_03_h ~= nil then
    _enm_litho_06_05_03_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_05_04_h ~= nil then
    _enm_litho_06_05_04_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_05_05_h ~= nil then
    _enm_litho_06_05_05_h:requestIdlingEnemy(true)
  end
  if _enm_litho_06_05_06_h ~= nil then
    _enm_litho_06_05_06_h:requestIdlingEnemy(true)
  end
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function cubesensor2_cactus_OnEnter(A0_204, A1_205)
  local L2_206
  L2_206 = obj_name
  if L2_206 ~= "lithograph_06" then
    L2_206 = A1_205.getName
    L2_206 = L2_206(A1_205)
    print("***** sensor name : [ " .. tostring(A0_204:getName()) .. " ]   obj_name : [ " .. tostring(L2_206) .. " ]")
    print("+***** obj type : [ " .. tostring(A1_205:getTypeName()) .. " ]")
    A1_205:setGrabReleaseForce(true)
    A1_205:requestBreak(A1_205:getPos(), 10)
    _litho_hit_count = _litho_hit_count + 1
    HUD:counter99_99AddNum()
    if _litho_hit_count == 1 then
      invokeTask(function()
        waitSeconds(0.5)
        Sound:playSE("success", 1, Fn_sendEventComSb("requestHandle", "lithograph_06"))
        waitSeconds(1)
        Fn_captionView("ep03_12002")
        waitSeconds(2)
        _first_hit = true
      end)
    end
  end
end
function infinite_caption()
  print("\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\232\161\168\231\164\186\229\190\133\230\169\159")
  repeat
    wait()
  until _infinite_cap == true
  if not _litho_theme then
    Fn_pcSensorOn("pccubesensor2_infinite")
  end
end
function pccubesensor2_infinite_OnEnter(A0_207)
  _infinite_cap_task = invokeTask(function()
    Fn_pcSensorOff(A0_207)
    if not _litho_theme then
      Fn_captionViewWait("ep03_12003")
    end
    if not _litho_theme then
      Fn_captionView("ep03_12004")
    end
  end)
end
function Finalize()
  local L0_208, L1_209
end
