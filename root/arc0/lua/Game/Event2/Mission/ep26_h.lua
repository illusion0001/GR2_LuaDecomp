dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Event2/Mission/ep26_common.lua")
attack_wait = false
bress_01 = false
bress_02 = false
attack_name = ""
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon",
      locator = "locator_boss_01",
      name = "demon01"
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
    _enemy_cnt = _enemy_cnt - 1
  end
}
enmgen2_battle_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mothership",
      locator = "locator_01_01",
      name = "mothership",
      ai_spawn_option = "MotherShip/ep26_MotherShip"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
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
enmgen2_battle_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_02_01",
      name = "gellyfish_01",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_02_02",
      name = "gellyfish_02",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_02_03",
      name = "gellyfish_03",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_02_04",
      name = "gellyfish_04",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_02_05",
      name = "gellyfish_05",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_02_06",
      name = "gellyfish_06",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
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
  onObjectDead = function(A0_27, A1_28)
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
    if L2_33 >= #A0_32.spawnSet then
      A0_32.enemyDeadNum = 0
      L2_33 = true
      return L2_33
    else
      L2_33 = false
      return L2_33
    end
  end
}
enmgen2_battle_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_03_01",
      name = "gellyfish_11",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_03_02",
      name = "gellyfish_12",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_03_03",
      name = "gellyfish_13",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_03_04",
      name = "gellyfish_14",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_03_05",
      name = "gellyfish_15",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_03_06",
      name = "gellyfish_16",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
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
  onObjectDead = function(A0_40, A1_41)
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
  isEnemyAllDead = function(A0_45)
    local L2_46
    L2_46 = A0_45.enemyDeadNum
    if L2_46 >= #A0_45.spawnSet then
      A0_45.enemyDeadNum = 0
      L2_46 = true
      return L2_46
    else
      L2_46 = false
      return L2_46
    end
  end
}
enmgen2_battle_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_04_01",
      name = "gellyfish_21",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_04_02",
      name = "gellyfish_22",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_04_03",
      name = "gellyfish_23",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_04_04",
      name = "gellyfish_24",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_04_05",
      name = "gellyfish_25",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "gellyfish",
      locator = "locator_04_06",
      name = "gellyfish_26",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    }
  },
  onUpdate = function(A0_47)
    local L1_48
  end,
  onEnter = function(A0_49)
    local L1_50
  end,
  onLeave = function(A0_51)
    local L1_52
  end,
  onObjectDead = function(A0_53, A1_54)
    A0_53:getSpecTable().enemyDeadNum = A0_53:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_55)
    return #A0_55.spawnSet
  end,
  getEnemyDeadNum = function(A0_56)
    local L1_57
    L1_57 = A0_56.enemyDeadNum
    return L1_57
  end,
  isEnemyAllDead = function(A0_58)
    local L2_59
    L2_59 = A0_58.enemyDeadNum
    if L2_59 >= #A0_58.spawnSet then
      A0_58.enemyDeadNum = 0
      L2_59 = true
      return L2_59
    else
      L2_59 = false
      return L2_59
    end
  end
}
enmgen2_battle_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_05_01",
      name = "imp_01",
      ai_spawn_option = "imp/imp_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_05_02",
      name = "imp_02",
      ai_spawn_option = "imp/imp_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_05_03",
      name = "imp_03",
      ai_spawn_option = "imp/imp_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_05_04",
      name = "imp_04",
      ai_spawn_option = "imp/imp_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_05_05",
      name = "imp_05",
      ai_spawn_option = "imp/imp_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_05_06",
      name = "imp_06",
      ai_spawn_option = "imp/imp_vsDemon"
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
    A0_66:getSpecTable().enemyDeadNum = A0_66:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_68)
    return #A0_68.spawnSet
  end,
  getEnemyDeadNum = function(A0_69)
    local L1_70
    L1_70 = A0_69.enemyDeadNum
    return L1_70
  end,
  isEnemyAllDead = function(A0_71)
    local L2_72
    L2_72 = A0_71.enemyDeadNum
    if L2_72 >= #A0_71.spawnSet then
      A0_71.enemyDeadNum = 0
      L2_72 = true
      return L2_72
    else
      L2_72 = false
      return L2_72
    end
  end
}
enmgen2_battle_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_06_01",
      name = "imp_11",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_06_02",
      name = "imp_12",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_06_03",
      name = "imp_13",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_06_04",
      name = "imp_14",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_06_05",
      name = "imp_15",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_06_06",
      name = "imp_16",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    }
  },
  onUpdate = function(A0_73)
    local L1_74
  end,
  onEnter = function(A0_75)
    local L1_76
  end,
  onLeave = function(A0_77)
    local L1_78
  end,
  onObjectDead = function(A0_79, A1_80)
    A0_79:getSpecTable().enemyDeadNum = A0_79:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_81)
    return #A0_81.spawnSet
  end,
  getEnemyDeadNum = function(A0_82)
    local L1_83
    L1_83 = A0_82.enemyDeadNum
    return L1_83
  end,
  isEnemyAllDead = function(A0_84)
    local L2_85
    L2_85 = A0_84.enemyDeadNum
    if L2_85 >= #A0_84.spawnSet then
      A0_84.enemyDeadNum = 0
      L2_85 = true
      return L2_85
    else
      L2_85 = false
      return L2_85
    end
  end
}
enmgen2_battle_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_07_01",
      name = "imp_21",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_07_02",
      name = "imp_22",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_07_03",
      name = "imp_23",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_07_04",
      name = "imp_24",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_07_05",
      name = "imp_25",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    },
    {
      type = "imp",
      locator = "locator_07_06",
      name = "imp_26",
      ai_spawn_option = "Gellyfish/gellifish_vsDemon"
    }
  },
  onUpdate = function(A0_86)
    local L1_87
  end,
  onEnter = function(A0_88)
    local L1_89
  end,
  onLeave = function(A0_90)
    local L1_91
  end,
  onObjectDead = function(A0_92, A1_93)
    A0_92:getSpecTable().enemyDeadNum = A0_92:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_94)
    return #A0_94.spawnSet
  end,
  getEnemyDeadNum = function(A0_95)
    local L1_96
    L1_96 = A0_95.enemyDeadNum
    return L1_96
  end,
  isEnemyAllDead = function(A0_97)
    local L2_98
    L2_98 = A0_97.enemyDeadNum
    if L2_98 >= #A0_97.spawnSet then
      A0_97.enemyDeadNum = 0
      L2_98 = true
      return L2_98
    else
      L2_98 = false
      return L2_98
    end
  end
}
enmgen2_battle_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_08_01",
      name = "lunashipowner01",
      ai_spawn_option = "LunaFishOwner/owner_vsDemon"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_08_01",
      name = "childship01",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_08_01",
      name = "lunafish01",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  onUpdate = function(A0_99)
    local L1_100
  end,
  onEnter = function(A0_101)
    local L1_102
  end,
  onLeave = function(A0_103)
    local L1_104
  end,
  onObjectDead = function(A0_105, A1_106)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_107)
    return #A0_107.spawnSet
  end,
  getEnemyDeadNum = function(A0_108)
    local L1_109
    L1_109 = A0_108.enemyDeadNum
    return L1_109
  end,
  isEnemyAllDead = function(A0_110)
    local L2_111
    L2_111 = A0_110.enemyDeadNum
    if L2_111 >= #A0_110.spawnSet then
      A0_110.enemyDeadNum = 0
      L2_111 = true
      return L2_111
    else
      L2_111 = false
      return L2_111
    end
  end
}
enmgen2_battle_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_09_01",
      name = "lunashipowner02",
      ai_spawn_option = "LunaFishOwner/owner_vsDemon"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_09_01",
      name = "childship02",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_09_01",
      name = "lunafish02",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  onUpdate = function(A0_112)
    local L1_113
  end,
  onEnter = function(A0_114)
    local L1_115
  end,
  onLeave = function(A0_116)
    local L1_117
  end,
  onObjectDead = function(A0_118, A1_119)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_120)
    return #A0_120.spawnSet
  end,
  getEnemyDeadNum = function(A0_121)
    local L1_122
    L1_122 = A0_121.enemyDeadNum
    return L1_122
  end,
  isEnemyAllDead = function(A0_123)
    local L2_124
    L2_124 = A0_123.enemyDeadNum
    if L2_124 >= #A0_123.spawnSet then
      A0_123.enemyDeadNum = 0
      L2_124 = true
      return L2_124
    else
      L2_124 = false
      return L2_124
    end
  end
}
enmgen2_battle_10 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_10_01",
      name = "lunashipowner02",
      ai_spawn_option = "LunaFishOwner/owner_vsDemon"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_10_01",
      name = "childship02",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_10_01",
      name = "lunafish02",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  onUpdate = function(A0_125)
    local L1_126
  end,
  onEnter = function(A0_127)
    local L1_128
  end,
  onLeave = function(A0_129)
    local L1_130
  end,
  onObjectDead = function(A0_131, A1_132)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_133)
    return #A0_133.spawnSet
  end,
  getEnemyDeadNum = function(A0_134)
    local L1_135
    L1_135 = A0_134.enemyDeadNum
    return L1_135
  end,
  isEnemyAllDead = function(A0_136)
    local L2_137
    L2_137 = A0_136.enemyDeadNum
    if L2_137 >= #A0_136.spawnSet then
      A0_136.enemyDeadNum = 0
      L2_137 = true
      return L2_137
    else
      L2_137 = false
      return L2_137
    end
  end
}
enmgen2_battle_11 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_11_01",
      name = "lunashipowner02",
      ai_spawn_option = "LunaFishOwner/owner_vsDemon"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_11_01",
      name = "childship02",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_11_01",
      name = "lunafish02",
      ai_spawn_option = "LunaFish/lunafish_vsDemon"
    }
  },
  onUpdate = function(A0_138)
    local L1_139
  end,
  onEnter = function(A0_140)
    local L1_141
  end,
  onLeave = function(A0_142)
    local L1_143
  end,
  onObjectDead = function(A0_144, A1_145)
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
  isEnemyAllDead = function(A0_149)
    local L2_150
    L2_150 = A0_149.enemyDeadNum
    if L2_150 >= #A0_149.spawnSet then
      A0_149.enemyDeadNum = 0
      L2_150 = true
      return L2_150
    else
      L2_150 = false
      return L2_150
    end
  end
}
_kitMotionTable = {
  motion1 = "kit01_down_a_00",
  motion2 = "kit01_down_b_00"
}
function Initialize()
  local L0_151
  L0_151 = Fn_loadPlayerMotion
  L0_151(_kitMotionTable)
  L0_151 = Fn_setCatActive
  L0_151(off)
  L0_151 = Fn_loadEventData
  L0_151("evx/ep26_boss", "evarea2_dt_c_root", true)
  L0_151 = {
    {
      name = "cid_01",
      type = "cid04",
      node = "locator2_cid_01",
      attach = false,
      use_gravity = false,
      disable_collision = true
    }
  }
  Fn_setupNpc(L0_151)
  Player:muteVoice(Player.kVoiceMuteLv_All)
end
function Ingame()
  local L0_152, L1_153, L2_154, L3_155, L4_156, L5_157, L6_158, L7_159, L8_160, L9_161, L10_162, L11_163, L12_164, L13_165, L14_166, L15_167, L16_168, L17_169, L18_170
  L0_152 = Player
  L1_153 = L0_152
  L0_152 = L0_152.setSpecialTuning
  L2_154 = Player
  L2_154 = L2_154.kSpecialTuning_Ep26Groggy
  L0_152(L1_153, L2_154)
  L0_152 = Camera
  L1_153 = L0_152
  L0_152 = L0_152.lookTo
  L2_154 = findGameObject2
  L3_155 = "Node"
  L4_156 = "locator2_aim_start"
  L2_154 = L2_154(L3_155, L4_156)
  L3_155 = L2_154
  L2_154 = L2_154.getWorldPos
  L2_154 = L2_154(L3_155)
  L3_155 = 0
  L4_156 = 2
  L0_152(L1_153, L2_154, L3_155, L4_156)
  L0_152 = Player
  L1_153 = L0_152
  L0_152 = L0_152.setEnergyFakeLimit
  L2_154 = Player
  L2_154 = L2_154.kEnergy_Life
  L3_155 = 100
  L0_152(L1_153, L2_154, L3_155)
  L0_152 = Player
  L1_153 = L0_152
  L0_152 = L0_152.setAbility
  L2_154 = Player
  L2_154 = L2_154.kAbility_TalismanEffect
  L3_155 = false
  L0_152(L1_153, L2_154, L3_155)
  L0_152 = GameDatabase
  L1_153 = L0_152
  L0_152 = L0_152.set
  L2_154 = ggd
  L2_154 = L2_154.Savedata__Menu__MenuUnlock__TopMenuTalisman
  L3_155 = false
  L0_152(L1_153, L2_154, L3_155)
  L0_152 = Player
  L1_153 = L0_152
  L0_152 = L0_152.getPuppet
  L0_152 = L0_152(L1_153)
  L2_154 = L0_152
  L1_153 = L0_152.getWorldPos
  L1_153 = L1_153(L2_154)
  L2_154 = Fn_findGimmickBgInBgset
  L3_155 = "g1_building_pd_77b_01"
  L2_154 = L2_154(L3_155)
  L4_156 = L2_154
  L3_155 = L2_154.requestBreak
  L5_157 = L1_153
  L6_158 = 100
  L7_159 = 0.1
  L3_155(L4_156, L5_157, L6_158, L7_159)
  L3_155 = waitSeconds
  L4_156 = 1
  L3_155(L4_156)
  L3_155 = Fn_getPlayer
  L3_155 = L3_155()
  L4_156 = Player
  L5_157 = L4_156
  L4_156 = L4_156.setSituation
  L6_158 = Player
  L6_158 = L6_158.kSituation_Normal
  L7_159 = true
  L8_160 = 0
  L9_161 = false
  L10_162 = false
  L4_156(L5_157, L6_158, L7_159, L8_160, L9_161, L10_162)
  L4_156 = wait
  L4_156()
  L4_156 = Fn_sendEventComSb
  L5_157 = "requestIdling"
  L4_156(L5_157)
  while true do
    L4_156 = _demon_puppet
    if L4_156 == nil then
      L4_156 = Fn_sendEventComSb
      L5_157 = "boss_name"
      L4_156 = L4_156(L5_157)
      _demon_puppet = L4_156
      L4_156 = wait
      L4_156()
    end
  end
  L4_156 = _demon_puppet
  L5_157 = L4_156
  L4_156 = L4_156.getBrain
  L4_156 = L4_156(L5_157)
  L5_157 = findGameObject2
  L6_158 = "EnemyGenerator"
  L7_159 = "enmgen2_g_01"
  L5_157 = L5_157(L6_158, L7_159)
  if L5_157 ~= nil then
    L7_159 = L5_157
    L6_158 = L5_157.requestSpawn
    L6_158(L7_159)
  end
  L7_159 = L5_157
  L6_158 = L5_157.setEnemyMarker
  L8_160 = false
  L6_158(L7_159, L8_160)
  while true do
    L6_158 = findGameObject2
    L7_159 = "Puppet"
    L8_160 = "mothership"
    L6_158 = L6_158(L7_159, L8_160)
    if L6_158 == nil then
      L6_158 = wait
      L6_158()
    end
  end
  L6_158 = findGameObject2
  L7_159 = "Puppet"
  L8_160 = "mothership"
  L6_158 = L6_158(L7_159, L8_160)
  while true do
    L8_160 = L6_158
    L7_159 = L6_158.getBrain
    L7_159 = L7_159(L8_160)
    if L7_159 == nil then
      L7_159 = wait
      L7_159()
    end
  end
  L8_160 = L6_158
  L7_159 = L6_158.getBrain
  L7_159 = L7_159(L8_160)
  L9_161 = L7_159
  L8_160 = L7_159.setEnableHomingTarget
  L10_162 = false
  L8_160(L9_161, L10_162)
  L8_160 = findGameObject2
  L9_161 = "EnemyGenerator"
  L10_162 = "enmgen2_g_02"
  L8_160 = L8_160(L9_161, L10_162)
  if L8_160 ~= nil then
    L10_162 = L8_160
    L9_161 = L8_160.requestSpawn
    L9_161(L10_162)
  end
  L10_162 = L8_160
  L9_161 = L8_160.setEnemyMarker
  L11_163 = false
  L9_161(L10_162, L11_163)
  L9_161 = findGameObject2
  L10_162 = "EnemyGenerator"
  L11_163 = "enmgen2_g_03"
  L9_161 = L9_161(L10_162, L11_163)
  if L9_161 ~= nil then
    L11_163 = L9_161
    L10_162 = L9_161.requestSpawn
    L10_162(L11_163)
  end
  L11_163 = L9_161
  L10_162 = L9_161.setEnemyMarker
  L12_164 = false
  L10_162(L11_163, L12_164)
  L10_162 = findGameObject2
  L11_163 = "EnemyGenerator"
  L12_164 = "enmgen2_g_05"
  L10_162 = L10_162(L11_163, L12_164)
  if L10_162 ~= nil then
    L12_164 = L10_162
    L11_163 = L10_162.requestSpawn
    L11_163(L12_164)
  end
  L12_164 = L10_162
  L11_163 = L10_162.setEnemyMarker
  L13_165 = false
  L11_163(L12_164, L13_165)
  L11_163 = findGameObject2
  L12_164 = "EnemyGenerator"
  L13_165 = "enmgen2_g_06"
  L11_163 = L11_163(L12_164, L13_165)
  if L11_163 ~= nil then
    L13_165 = L11_163
    L12_164 = L11_163.requestSpawn
    L12_164(L13_165)
  end
  L13_165 = L11_163
  L12_164 = L11_163.setEnemyMarker
  L14_166 = false
  L12_164(L13_165, L14_166)
  L12_164 = findGameObject2
  L13_165 = "EnemyGenerator"
  L14_166 = "enmgen2_g_07"
  L12_164 = L12_164(L13_165, L14_166)
  if L12_164 ~= nil then
    L14_166 = L12_164
    L13_165 = L12_164.requestSpawn
    L13_165(L14_166)
  end
  L14_166 = L12_164
  L13_165 = L12_164.setEnemyMarker
  L15_167 = false
  L13_165(L14_166, L15_167)
  L13_165 = findGameObject2
  L14_166 = "EnemyGenerator"
  L15_167 = "enmgen2_g_08"
  L13_165 = L13_165(L14_166, L15_167)
  if L13_165 ~= nil then
    L15_167 = L13_165
    L14_166 = L13_165.requestSpawn
    L14_166(L15_167)
  end
  L15_167 = L13_165
  L14_166 = L13_165.setEnemyMarker
  L16_168 = false
  L14_166(L15_167, L16_168)
  L14_166 = findGameObject2
  L15_167 = "EnemyGenerator"
  L16_168 = "enmgen2_g_09"
  L14_166 = L14_166(L15_167, L16_168)
  if L14_166 ~= nil then
    L16_168 = L14_166
    L15_167 = L14_166.requestSpawn
    L15_167(L16_168)
  end
  L16_168 = L14_166
  L15_167 = L14_166.setEnemyMarker
  L17_169 = false
  L15_167(L16_168, L17_169)
  L15_167 = Fn_sendEventComSb
  L16_168 = "partchange"
  L15_167(L16_168)
  L15_167 = invokeTask
  function L16_168()
    repeat
      Fn_sendEventComSb("attackname", "at_wing")
      print("\231\190\189\230\148\187\230\146\131")
      demonAttackWait()
      Fn_sendEventComSb("attackname", "at_horn")
      print("\232\167\146\230\148\187\230\146\131")
      demonAttackWait()
      Fn_sendEventComSb("attackname", "at_h_lh")
      print("\229\183\166\230\137\139\227\129\175\227\129\159\227\129\141\228\184\138")
      demonAttackWait()
      Fn_sendEventComSb("attackname", "at_h_rl")
      print("\229\143\179\230\137\139\227\129\175\227\129\159\227\129\141\228\184\139")
      demonAttackWait()
      Fn_sendEventComSb("attackname", "at_h_ll")
      print("\229\183\166\230\137\139\227\129\175\227\129\159\227\129\141\228\184\138")
      demonAttackWait()
      Fn_sendEventComSb("attackname", "at_bress3")
      print("\227\129\170\227\129\142\227\131\150\227\131\172\227\130\185\229\183\166")
      demonAttackWait()
      Fn_sendEventComSb("attackname", "at_h_rh")
      print("\229\143\179\230\137\139\227\129\175\227\129\159\227\129\141\228\184\138")
      demonAttackWait()
      Fn_sendEventComSb("attackname", "at_h_ll")
      print("\229\183\166\230\137\139\227\129\175\227\129\159\227\129\141\228\184\139")
      demonAttackWait()
    until false
  end
  L15_167 = L15_167(L16_168)
  L16_168 = invokeTask
  function L17_169()
    repeat
      if enmgen2_battle_02:isEnemyAllDead() then
        L8_160:requestSpawn()
        bress_01 = true
        print("\227\130\184\227\130\167\227\131\170\227\131\188\239\188\145\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      if enmgen2_battle_03:isEnemyAllDead() then
        L9_161:requestSpawn()
        bress_01 = true
        print("\227\130\184\227\130\167\227\131\170\227\131\188\239\188\146\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      if enmgen2_battle_04:isEnemyAllDead() then
        enmgen4:requestSpawn()
        bress_01 = true
        print("\227\130\184\227\130\167\227\131\170\227\131\188\239\188\147\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      if enmgen2_battle_05:isEnemyAllDead() then
        L10_162:requestSpawn()
        bress_02 = true
        print("\227\130\164\227\131\179\227\131\151\239\188\145\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      if enmgen2_battle_06:isEnemyAllDead() then
        L11_163:requestSpawn()
        bress_02 = true
        print("\227\130\164\227\131\179\227\131\151\239\188\146\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      if enmgen2_battle_07:isEnemyAllDead() then
        L12_164:requestSpawn()
        bress_02 = true
        print("\227\130\164\227\131\179\227\131\151\239\188\147\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      if enmgen2_battle_08:isEnemyAllDead() then
        L13_165:requestSpawn()
        print("\233\173\154\239\188\145\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      if enmgen2_battle_09:isEnemyAllDead() then
        L14_166:requestSpawn()
        print("\233\173\154\239\188\146\227\131\170\227\130\185\227\131\157\227\131\188\227\131\179")
      end
      wait()
    until false
  end
  L16_168 = L16_168(L17_169)
  L17_169 = HUD
  L18_170 = L17_169
  L17_169 = L17_169.hpgDispReq_FadeOut
  L17_169(L18_170)
  L17_169 = HUD
  L18_170 = L17_169
  L17_169 = L17_169.grgDispReq_FadeOut
  L17_169(L18_170)
  L17_169 = HUD
  L18_170 = L17_169
  L17_169 = L17_169.spgDispReq_FadeOut
  L17_169(L18_170)
  L17_169 = findGameObject2
  L18_170 = "Puppet"
  L17_169 = L17_169(L18_170, "mothership")
  L18_170 = findGameObject2
  L18_170 = L18_170("Puppet", "cid_01")
  cid_hdl = L18_170
  L18_170 = cid_hdl
  L18_170 = L18_170.setTransform
  L18_170(L18_170, Vector(0, 10, 11.2))
  L18_170 = L17_169.appendChild
  L18_170(L17_169, cid_hdl)
  L18_170 = Fn_playPlayerMotion
  L18_170(_kitMotionTable.motion1)
  L18_170 = GameDatabase
  L18_170 = L18_170.set
  L18_170(L18_170, ggd.Savedata__Menu__MenuUnlock__TopMenuSaveLoad, false)
  L18_170 = Sound
  L18_170 = L18_170.playSEHandle
  L18_170 = L18_170(L18_170, "kit_566")
  _kit566 = L18_170
  L18_170 = Fn_missionStart
  L18_170()
  L18_170 = waitSeconds
  L18_170(1)
  L18_170 = push_moveStick
  L18_170()
  L18_170 = Camera
  L18_170 = L18_170.lookTo
  L18_170(L18_170, findGameObject2("Node", "locator2_daemon_02"):getWorldPos(), 2, 2)
  L18_170 = Player
  L18_170 = L18_170.setSpecialTuning
  L18_170(L18_170, Player.kSpecialTuning_Ep26Groggy2)
  L18_170 = Fn_playPlayerMotion
  L18_170(_kitMotionTable.motion2)
  L18_170 = waitSeconds
  L18_170(1)
  L18_170 = Player
  L18_170 = L18_170.setSituation
  L18_170(L18_170, Player.kSituation_Normal, true, 0.1, true, false)
  L18_170 = Fn_userCtrlOn
  L18_170()
  L18_170 = HUD
  L18_170 = L18_170.enablePhotoMode
  L18_170(L18_170, false)
  L18_170 = Player
  L18_170 = L18_170.setAbility
  L18_170(L18_170, {
    Player.kAbility_Run,
    Player.kAbility_Jump,
    Player.kAbility_Grab,
    Player.kAbility_KickCombo,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_GravityShift,
    Player.kAbility_Dodge,
    Player.kAbility_SpAttack,
    Player.kAbility_FirstPersonView
  }, false)
  L18_170 = waitPhace
  L18_170()
  L18_170 = Player
  L18_170 = L18_170.setEnergyFakeLimit
  L18_170(L18_170, Player.kEnergy_Life)
  L18_170 = Player
  L18_170 = L18_170.setAbility
  L18_170(L18_170, Player.kAbility_TalismanEffect, true)
  L18_170 = GameDatabase
  L18_170 = L18_170.set
  L18_170(L18_170, ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
  L18_170 = Player
  L18_170 = L18_170.getEnergyMax
  L18_170 = L18_170(L18_170, Player.kEnergy_Life)
  Player:setEnergy(Player.kEnergy_Life, L18_170)
  waitPhace()
  Camera:lookTo(findGameObject2("Node", "locator2_daemon_02"):getWorldPos(), 2, 3)
  waitSeconds(1)
  Fn_userCtrlAllOff()
  Camera:setControl(Camera.kPlayer, Camera.kControl_Gyro, false)
  FatalMarker.create(kFATAL_TYPE_EMP):set(_demon_puppet, "loc_setCore03", false)
  FatalMarker.create(kFATAL_TYPE_EMP):run()
  repeat
    wait()
  until FatalMarker.create(kFATAL_TYPE_EMP):isFatalFinish()
  FatalMarker.create(kFATAL_TYPE_EMP):kill()
  Fn_whiteout(0.3)
  Sound:stopSEHandle(_kit566)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSpecialTuning(Player.kSpecialTuning_None)
    Player:setAbility(Player.kAbility_TalismanEffect, true)
    Player:setSpecialTuning(Player.kSpecialTuning_None)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
    HUD:enablePhotoMode(true)
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
  Camera:setControl(Camera.kPlayer, Camera.kControl_Gyro, true)
end
function pccubesensor2_next_OnEnter(A0_171)
  A0_171:setActive(false)
  _next_phase = true
end
function navi_on()
  local L0_172, L1_173
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function demonAttackWait()
  repeat
    wait()
  until Fn_sendEventComSb("attackwait") == true
  if bress_01 then
    if RandI(0, 2) == 0 then
      Fn_sendEventComSb("attackname", "at_bress1")
      print("\227\131\150\227\131\172\227\130\185\229\183\166")
    else
      Fn_sendEventComSb("attackname", "at_bress2")
      print("\227\129\170\227\129\142\227\131\150\227\131\172\227\130\185\229\183\166")
    end
    bress_01 = false
  end
  if bress_02 then
    if RandI(0, 4) == 0 then
      Fn_sendEventComSb("attackname", "at_bress3")
      print("\227\131\150\227\131\172\227\130\185\229\143\179")
    else
      Fn_sendEventComSb("attackname", "at_bress4")
      print("\227\129\170\227\129\142\227\131\150\227\131\172\227\130\185\229\143\179")
    end
    bress_02 = false
  end
  repeat
    wait()
  until Fn_sendEventComSb("attackwait") == false
end
function push_moveStick()
  repeat
    wait()
  until Pad:getStick(Pad.kStick_Move) ~= 0
end
function push_trybutton()
  repeat
    wait()
  until Pad:getButton(Pad.kButton_RU) == true
end
