mine_name = "mine05"
add_mine = ""
_mine_id = 5
_floor = 20
_boss_navi_range = 100
_enmgen_boss = "enmgen2_boss"
_enmgen_list = {
  "enmgen2_wa_a_01_01",
  "enmgen2_wa_a_01_02",
  "enmgen2_wa_a_01_03",
  "enmgen2_wa_a_01_04",
  "enmgen2_wa_a_01_05",
  "enmgen2_wa_a_01_06",
  "enmgen2_wa_a_01_07",
  "enmgen2_wa_a_01_08",
  "enmgen2_wa_a_01_09",
  "enmgen2_wa_a_03",
  "enmgen2_wa_a_04_01",
  "enmgen2_wa_a_04_02",
  "enmgen2_wa_a_04_03",
  "enmgen2_wa_a_05_01",
  "enmgen2_wa_a_05_02",
  "enmgen2_wa_a_07",
  "enmgen2_wa_a_09"
}
dofile("/Game/Event2/Mission/mine_base.lua")
_gravityOre = {
  mineOreEvdName = mine_name .. "_ore",
  instance_flg = true,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
enmgen2_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "faker",
      locator = "locator_boss",
      name = "mine05_boss",
      ai_spawn_option = "Faker/faker_boss_mine05",
      navi_mesh_name = "wa_a_01_custom01"
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
  onObjectAsh = function(A0_6, A1_7)
    _boss_defeated = true
  end,
  onPopGem = function(A0_8, A1_9)
    invokeTask(function()
      if Fn_rewardMineBoss("boss05") then
        print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
      else
        Fn_EnemyDropGraviryOre(A0_8, A1_9, "infinity", 1)
      end
      EnemeyDropGem(A0_8, A1_9)
      Fn_bossDefeated()
    end)
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_wa_a_01_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_01_01_01",
        name = "0101_guardcore_1"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_02",
        name = "0101_runner_1"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_03",
        name = "0101_runner_2"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_01_01_01",
        name = "0101_guardcore_1"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_02",
        name = "0101_runner_1"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_03",
        name = "0101_runner_2"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_01_01_04",
        name = "0101_guardcore_2"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_05",
        name = "0101_runner_3"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_06",
        name = "0101_runner_4"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_01_01_01",
        name = "0101_guardcore_1"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_02",
        name = "0101_runner_1"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_03",
        name = "0101_runner_2"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_01_01_04",
        name = "0101_guardcore_2"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_05",
        name = "0101_runner_3"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_06",
        name = "0101_runner_4"
      },
      {
        type = "giant",
        locator = "locator_wa_a_01_01_07",
        name = "0101_giant_1"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_08",
        name = "0101_runner_5"
      },
      {
        type = "runner",
        locator = "locator_wa_a_01_01_09",
        name = "0101_runner_6"
      }
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onObjectDead = function(A0_18, A1_19)
  end,
  onObjectAsh = function(A0_20, A1_21)
  end,
  onPopGem = function(A0_22, A1_23)
    EnemeyDropGem(A0_22, A1_23)
  end
}
enmgen2_wa_a_01_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_01",
        name = "0102_stalker_1"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_02",
        name = "0102_stalker_2"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_03",
        name = "0102_stalker_3"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_01",
        name = "0102_stalker_1"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_02",
        name = "0102_stalker_2"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_03",
        name = "0102_stalker_3"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_04",
        name = "0102_stalker_4"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_05",
        name = "0102_stalker_5"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_06",
        name = "0102_stalker_6"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_01",
        name = "0102_stalker_1"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_02",
        name = "0102_stalker_2"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_03",
        name = "0102_stalker_3"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_04",
        name = "0102_stalker_4"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_05",
        name = "0102_stalker_5"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_06",
        name = "0102_stalker_6"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_07",
        name = "0102_stalker_7"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_08",
        name = "0102_stalker_8"
      },
      {
        type = "stalker",
        locator = "locator_wa_a_01_02_09",
        name = "0102_stalker_9"
      }
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onObjectDead = function(A0_30, A1_31)
  end,
  onObjectAsh = function(A0_32, A1_33)
  end,
  onPopGem = function(A0_34, A1_35)
    EnemeyDropGem(A0_34, A1_35)
  end
}
enmgen2_wa_a_01_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "defender",
        locator = "locator_wa_a_01_03_01",
        name = "0103_defender_1"
      }
    },
    {
      {
        type = "defender",
        locator = "locator_wa_a_01_03_01",
        name = "0103_defender_1"
      },
      {
        type = "defender",
        locator = "locator_wa_a_01_03_02",
        name = "0103_defender_2"
      }
    },
    {
      {
        type = "defender",
        locator = "locator_wa_a_01_03_01",
        name = "0103_defender_1"
      },
      {
        type = "defender",
        locator = "locator_wa_a_01_03_02",
        name = "0103_defender_2"
      },
      {
        type = "defender",
        locator = "locator_wa_a_01_03_03",
        name = "0103_defender_3"
      }
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
  end,
  onPopGem = function(A0_46, A1_47)
    EnemeyDropGem(A0_46, A1_47)
  end
}
enmgen2_wa_a_01_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_01",
        name = "0104_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_02",
        name = "0104_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_03",
        name = "0104_gellyfish_3"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_01",
        name = "0104_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_02",
        name = "0104_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_03",
        name = "0104_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_04",
        name = "0104_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_05",
        name = "0104_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_06",
        name = "0104_gellyfish_6"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_01",
        name = "0104_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_02",
        name = "0104_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_03",
        name = "0104_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_04",
        name = "0104_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_05",
        name = "0104_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_06",
        name = "0104_gellyfish_6"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_07",
        name = "0104_gellyfish_7"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_08",
        name = "0104_gellyfish_8"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_04_09",
        name = "0104_gellyfish_9"
      }
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
  onObjectDead = function(A0_54, A1_55)
  end,
  onObjectAsh = function(A0_56, A1_57)
  end,
  onPopGem = function(A0_58, A1_59)
    EnemeyDropGem(A0_58, A1_59)
  end
}
enmgen2_wa_a_01_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_01_05_01",
        name = "0105_guardcore_1"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_01_05_01",
        name = "0105_guardcore_1"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_01_05_02",
        name = "0105_guardcore_2"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_01_05_01",
        name = "0105_guardcore_1"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_01_05_02",
        name = "0105_guardcore_2"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_01_05_03",
        name = "0105_guardcore_3"
      }
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
  end,
  onPopGem = function(A0_70, A1_71)
    EnemeyDropGem(A0_70, A1_71)
  end
}
enmgen2_wa_a_01_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_01",
        name = "0106_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_02",
        name = "0106_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_03",
        name = "0106_gellyfish_3"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_01",
        name = "0106_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_02",
        name = "0106_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_03",
        name = "0106_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_04",
        name = "0106_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_05",
        name = "0106_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_06",
        name = "0106_gellyfish_6"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_01",
        name = "0106_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_02",
        name = "0106_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_03",
        name = "0106_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_04",
        name = "0106_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_05",
        name = "0106_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_06",
        name = "0106_gellyfish_6"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_07",
        name = "0106_gellyfish_7"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_08",
        name = "0106_gellyfish_8"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_06_09",
        name = "0106_gellyfish_9"
      }
    }
  },
  onUpdate = function(A0_72)
    local L1_73
  end,
  onEnter = function(A0_74)
    local L1_75
  end,
  onLeave = function(A0_76)
    local L1_77
  end,
  onObjectDead = function(A0_78, A1_79)
  end,
  onObjectAsh = function(A0_80, A1_81)
  end,
  onPopGem = function(A0_82, A1_83)
    EnemeyDropGem(A0_82, A1_83)
  end
}
enmgen2_wa_a_01_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_07_01",
        name = "0107_lasercannon_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_02",
        name = "0107_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_03",
        name = "0107_gellyfish_2"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_07_01",
        name = "0107_lasercannon_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_02",
        name = "0107_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_03",
        name = "0107_gellyfish_2"
      },
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_07_04",
        name = "0107_lasercannon_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_05",
        name = "0107_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_06",
        name = "0107_gellyfish_4"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_07_01",
        name = "0107_lasercannon_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_02",
        name = "0107_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_03",
        name = "0107_gellyfish_2"
      },
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_07_04",
        name = "0107_lasercannon_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_05",
        name = "0107_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_06",
        name = "0107_gellyfish_4"
      },
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_07_07",
        name = "0107_lasercannon_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_08",
        name = "0107_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_07_09",
        name = "0107_gellyfish_6"
      }
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
  end,
  onPopGem = function(A0_94, A1_95)
    EnemeyDropGem(A0_94, A1_95)
  end
}
enmgen2_wa_a_01_08 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_08_01",
        name = "0108_lasercannon_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_02",
        name = "0108_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_03",
        name = "0108_gellyfish_2"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_08_01",
        name = "0108_lasercannon_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_02",
        name = "0108_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_03",
        name = "0108_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_04",
        name = "0108_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_05",
        name = "0108_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_06",
        name = "0108_gellyfish_5"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_wa_a_01_08_01",
        name = "0108_lasercannon_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_02",
        name = "0108_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_03",
        name = "0108_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_04",
        name = "0108_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_05",
        name = "0108_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_06",
        name = "0108_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_07",
        name = "0108_gellyfish_6"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_08",
        name = "0108_gellyfish_7"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_08_09",
        name = "0108_gellyfish_8"
      }
    }
  },
  onUpdate = function(A0_96)
    local L1_97
  end,
  onEnter = function(A0_98)
    local L1_99
  end,
  onLeave = function(A0_100)
    local L1_101
  end,
  onObjectDead = function(A0_102, A1_103)
  end,
  onObjectAsh = function(A0_104, A1_105)
  end,
  onPopGem = function(A0_106, A1_107)
    EnemeyDropGem(A0_106, A1_107)
  end
}
enmgen2_wa_a_01_09 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "hand",
        locator = "locator_wa_a_01_09_01",
        name = "0109_hand_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_02",
        name = "0109_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_03",
        name = "0109_gellyfish_2"
      }
    },
    {
      {
        type = "hand",
        locator = "locator_wa_a_01_09_01",
        name = "0109_hand_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_02",
        name = "0109_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_03",
        name = "0109_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_04",
        name = "0109_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_05",
        name = "0109_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_06",
        name = "0109_gellyfish_5"
      }
    },
    {
      {
        type = "hand",
        locator = "locator_wa_a_01_09_01",
        name = "0109_hand_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_02",
        name = "0109_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_03",
        name = "0109_gellyfish_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_04",
        name = "0109_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_05",
        name = "0109_gellyfish_4"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_06",
        name = "0109_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_07",
        name = "0109_gellyfish_6"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_08",
        name = "0109_gellyfish_7"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_01_09_09",
        name = "0109_gellyfish_8"
      }
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
  end,
  onPopGem = function(A0_118, A1_119)
    EnemeyDropGem(A0_118, A1_119)
  end
}
enmgen2_wa_a_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_03_01_01",
        name = "0301_guardcore_1"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_03_01_01",
        name = "0301_guardcore_1"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_03_01_02",
        name = "0301_guardcore_2"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_03_01_01",
        name = "0301_guardcore_1"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_03_01_02",
        name = "0301_guardcore_2"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_03_01_03",
        name = "0301_guardcore_3"
      }
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
  onObjectAsh = function(A0_128, A1_129)
  end,
  onPopGem = function(A0_130, A1_131)
    EnemeyDropGem(A0_130, A1_131)
  end
}
enmgen2_wa_a_04_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "defender",
        locator = "locator_wa_a_04_01_01",
        name = "0401_defender_1"
      }
    },
    {
      {
        type = "defender",
        locator = "locator_wa_a_04_01_01",
        name = "0401_defender_1"
      },
      {
        type = "defender",
        locator = "locator_wa_a_04_01_02",
        name = "0401_defender_2"
      }
    },
    {
      {
        type = "defender",
        locator = "locator_wa_a_04_01_01",
        name = "0401_defender_1"
      },
      {
        type = "defender",
        locator = "locator_wa_a_04_01_02",
        name = "0401_defender_2"
      },
      {
        type = "defender",
        locator = "locator_wa_a_04_01_03",
        name = "0401_defender_3"
      }
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
  end,
  onPopGem = function(A0_142, A1_143)
    EnemeyDropGem(A0_142, A1_143)
  end
}
enmgen2_wa_a_04_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "imp",
        locator = "locator_wa_a_04_02_01",
        name = "0402_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_02",
        name = "0402_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_03",
        name = "0402_gellyfish_2"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_wa_a_04_02_01",
        name = "0402_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_02",
        name = "0402_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_03",
        name = "0402_gellyfish_2"
      },
      {
        type = "imp",
        locator = "locator_wa_a_04_02_04",
        name = "0402_imp_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_05",
        name = "0402_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_06",
        name = "0402_gellyfish_4"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_wa_a_04_02_01",
        name = "0402_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_02",
        name = "0402_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_03",
        name = "0402_gellyfish_2"
      },
      {
        type = "imp",
        locator = "locator_wa_a_04_02_04",
        name = "0402_imp_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_05",
        name = "0402_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_06",
        name = "0402_gellyfish_4"
      },
      {
        type = "imp",
        locator = "locator_wa_a_04_02_07",
        name = "0402_imp_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_08",
        name = "0402_gellyfish_6"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_04_02_09",
        name = "0402_gellyfish_7"
      }
    }
  },
  onUpdate = function(A0_144)
    local L1_145
  end,
  onEnter = function(A0_146)
    local L1_147
  end,
  onLeave = function(A0_148)
    local L1_149
  end,
  onObjectDead = function(A0_150, A1_151)
  end,
  onObjectAsh = function(A0_152, A1_153)
  end,
  onPopGem = function(A0_154, A1_155)
    EnemeyDropGem(A0_154, A1_155)
  end
}
enmgen2_wa_a_04_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "treecannon",
        locator = "locator_wa_a_04_03_01",
        name = "0403_treecannon_1"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_wa_a_04_03_01",
        name = "0403_treecannon_1"
      },
      {
        type = "treecannon",
        locator = "locator_wa_a_04_03_02",
        name = "0403_treecannon_2"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_wa_a_04_03_01",
        name = "0403_treecannon_1"
      },
      {
        type = "treecannon",
        locator = "locator_wa_a_04_03_02",
        name = "0403_treecannon_2"
      },
      {
        type = "treecannon",
        locator = "locator_wa_a_04_03_03",
        name = "0403_treecannon_3"
      }
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
  end,
  onPopGem = function(A0_166, A1_167)
    EnemeyDropGem(A0_166, A1_167)
  end
}
enmgen2_wa_a_05_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_05_01_01",
        name = "0501_guardcore_1"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_05_01_01",
        name = "0501_guardcore_1"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_05_01_02",
        name = "0501_guardcore_2"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_wa_a_05_01_01",
        name = "0501_guardcore_1"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_05_01_02",
        name = "0501_guardcore_2"
      },
      {
        type = "guardcore",
        locator = "locator_wa_a_05_01_03",
        name = "0501_guardcore_3"
      }
    }
  },
  onUpdate = function(A0_168)
    local L1_169
  end,
  onEnter = function(A0_170)
    local L1_171
  end,
  onLeave = function(A0_172)
    local L1_173
  end,
  onObjectDead = function(A0_174, A1_175)
  end,
  onObjectAsh = function(A0_176, A1_177)
  end,
  onPopGem = function(A0_178, A1_179)
    EnemeyDropGem(A0_178, A1_179)
  end
}
enmgen2_wa_a_05_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "imp",
        locator = "locator_wa_a_05_02_01",
        name = "0502_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_02",
        name = "0502_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_03",
        name = "0502_gellyfish_2"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_wa_a_05_02_01",
        name = "0502_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_02",
        name = "0502_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_03",
        name = "0502_gellyfish_2"
      },
      {
        type = "imp",
        locator = "locator_wa_a_05_02_04",
        name = "0502_imp_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_05",
        name = "0502_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_06",
        name = "0502_gellyfish_4"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_wa_a_05_02_01",
        name = "0502_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_02",
        name = "0502_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_03",
        name = "0502_gellyfish_2"
      },
      {
        type = "imp",
        locator = "locator_wa_a_05_02_04",
        name = "0502_imp_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_05",
        name = "0502_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_06",
        name = "0502_gellyfish_4"
      },
      {
        type = "imp",
        locator = "locator_wa_a_05_02_07",
        name = "0502_imp_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_08",
        name = "0502_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_05_02_09",
        name = "0502_gellyfish_6"
      }
    }
  },
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
  end,
  onObjectAsh = function(A0_188, A1_189)
  end,
  onPopGem = function(A0_190, A1_191)
    EnemeyDropGem(A0_190, A1_191)
  end
}
enmgen2_wa_a_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "imp",
        locator = "locator_wa_a_07_01_01",
        name = "0701_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_02",
        name = "0701_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_03",
        name = "0701_gellyfish_2"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_wa_a_07_01_01",
        name = "0701_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_02",
        name = "0701_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_03",
        name = "0701_gellyfish_2"
      },
      {
        type = "imp",
        locator = "locator_wa_a_07_01_04",
        name = "0701_imp_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_05",
        name = "0701_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_06",
        name = "0701_gellyfish_4"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_wa_a_07_01_01",
        name = "0701_imp_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_02",
        name = "0701_gellyfish_1"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_03",
        name = "0701_gellyfish_2"
      },
      {
        type = "imp",
        locator = "locator_wa_a_07_01_04",
        name = "0701_imp_2"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_05",
        name = "0701_gellyfish_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_06",
        name = "0701_gellyfish_4"
      },
      {
        type = "imp",
        locator = "locator_wa_a_07_01_07",
        name = "0701_imp_3"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_08",
        name = "0701_gellyfish_5"
      },
      {
        type = "gellyfish",
        locator = "locator_wa_a_07_01_09",
        name = "0701_gellyfish_6"
      }
    }
  },
  onUpdate = function(A0_192)
    local L1_193
  end,
  onEnter = function(A0_194)
    local L1_195
  end,
  onLeave = function(A0_196)
    local L1_197
  end,
  onObjectDead = function(A0_198, A1_199)
  end,
  onObjectAsh = function(A0_200, A1_201)
  end,
  onPopGem = function(A0_202, A1_203)
    EnemeyDropGem(A0_202, A1_203)
  end
}
enmgen2_wa_a_09 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "defender",
        locator = "locator_wa_a_09_01_01",
        name = "0901_defender_1"
      }
    },
    {
      {
        type = "defender",
        locator = "locator_wa_a_09_01_01",
        name = "0901_defender_1"
      },
      {
        type = "defender",
        locator = "locator_wa_a_09_01_02",
        name = "0901_defender_2"
      }
    },
    {
      {
        type = "defender",
        locator = "locator_wa_a_09_01_01",
        name = "0901_defender_1"
      },
      {
        type = "defender",
        locator = "locator_wa_a_09_01_02",
        name = "0901_defender_2"
      },
      {
        type = "defender",
        locator = "locator_wa_a_09_01_03",
        name = "0901_defender_3"
      }
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
  onObjectDead = function(A0_210, A1_211)
  end,
  onObjectAsh = function(A0_212, A1_213)
  end,
  onPopGem = function(A0_214, A1_215)
    EnemeyDropGem(A0_214, A1_215)
  end
}
