dofile("/Game/Event2/Mission/mine04_common.lua")
mine_name = "mine04"
add_mine = ""
_mine_id = 4
_floor = 15
_boss_navi_range = 100
_enmgen_boss = "enmgen2_boss"
_enmgen_list = {
  "enmgen2_az2_a_05_01",
  "enmgen2_az2_a_01_01",
  "enmgen2_az2_a_17_01",
  "enmgen2_az2_a_18_01",
  "enmgen2_az2_a_19_01",
  "enmgen2_az2_a_04_01",
  "enmgen2_az2_a_02_02",
  "enmgen2_az2_a_23_01",
  "enmgen2_az2_a_05_14_01",
  "enmgen2_az2_a_22_01",
  "enmgen2_az2_a_21_01"
}
dofile("/Game/Event2/Mission/mine_base.lua")
_gravityOre = {
  mineOreEvdName = mine_name .. "_ore",
  instance_flg = true,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
function uniqueInitFunc()
  local L0_0, L1_1, L2_2, L3_3
  for L3_3 = 1, 4 do
    putCandleFireEffect(string.format("az2_a_01_%02d", L3_3), _candle_fire_max_az2_a_01, true)
  end
  for L3_3 = 1, 2 do
    putCandleFireEffect(string.format("az2_a_02_%02d", L3_3), _candle_fire_max_az2_a_02, true)
  end
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  for L3_3 = 1, 2 do
    putCandleFireEffect(string.format("az2_a_04_%02d", L3_3), _candle_fire_max_az2_a_04, true)
  end
  for L3_3 = 1, 19 do
    putCandleFireEffect(string.format("az2_a_05_%02d", L3_3), _candle_fire_max_az2_a_05, true)
  end
  for L3_3 = 1, 23 do
    putCandleFireEffect(string.format("az2_a_06_%02d", L3_3), _candle_fire_max_az2_a_06, true)
  end
  for L3_3 = 1, 2 do
    putCandleFireEffect(string.format("az2_a_06_%02d", L3_3 + 30), _candle_fire_max_az2_a_06, true)
  end
  for L3_3 = 1, 74 do
    putCandleFireEffect(string.format("az2_a_07_%02d", L3_3), _candle_fire_max_az2_a_07, true)
  end
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
end
enmgen2_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "faker",
      locator = "locator_boss",
      name = "mine04_boss",
      ai_spawn_option = "Faker/faker_boss_mine04",
      navi_mesh_name = "az2_a_20_custom01"
    }
  },
  onUpdate = function(A0_4)
    local L1_5
  end,
  onEnter = function(A0_6)
    local L1_7
  end,
  onLeave = function(A0_8)
    local L1_9
  end,
  onObjectAsh = function(A0_10, A1_11)
    _boss_defeated = true
  end,
  onPopGem = function(A0_12, A1_13)
    invokeTask(function()
      if Fn_rewardMineBoss("boss04") then
        print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
      else
        Fn_EnemyDropGraviryOre(A0_12, A1_13, "infinity", 1)
      end
      EnemeyDropGem(A0_12, A1_13)
      Fn_bossDefeated()
    end)
  end,
  onObjectDead = function(A0_14, A1_15)
  end
}
enmgen2_az2_a_05_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_01",
        name = "gellyfish0501"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_02",
        name = "gellyfish0502"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_01",
        name = "gellyfish0501"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_02",
        name = "gellyfish0502"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_az2_a_05_01",
        name = "gellyfish0501"
      },
      {
        type = "imp",
        locator = "locator_az2_a_05_02",
        name = "gellyfish0502"
      }
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
  onPopGem = function(A0_24, A1_25)
    EnemeyDropGem(A0_24, A1_25)
  end,
  onObjectAsh = function(A0_26, A1_27)
  end
}
enmgen2_az2_a_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "imp",
        locator = "locator_az2_a_01",
        name = "gellyfish0101"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_03",
        name = "gellyfish0103"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_az2_a_01",
        name = "gellyfish0101"
      },
      {
        type = "imp",
        locator = "locator_az2_a_02",
        name = "gellyfish0102"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_03",
        name = "gellyfish0103"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_az2_a_01",
        name = "gellyfish0101"
      },
      {
        type = "imp",
        locator = "locator_az2_a_02",
        name = "gellyfish0102"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_03",
        name = "gellyfish0103"
      },
      {
        type = "jammer",
        locator = "locator_az2_a_04",
        name = "jammer0101"
      }
    }
  },
  onUpdate = function(A0_28)
    local L1_29
  end,
  onEnter = function(A0_30)
    local L1_31
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onObjectDead = function(A0_34, A1_35)
  end,
  onPopGem = function(A0_36, A1_37)
    EnemeyDropGem(A0_36, A1_37)
  end,
  onObjectAsh = function(A0_38, A1_39)
  end
}
enmgen2_az2_a_17_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_az2_a_17_01",
      name = "lunafishowner_01",
      ai_spawn_option = "LunaFishOwner/owner_test"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_az2_a_17_01",
      name = "lunafish_01"
    }
  },
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
  end,
  onPopGem = function(A0_48, A1_49)
    EnemeyDropGem(A0_48, A1_49)
  end,
  onObjectAsh = function(A0_50, A1_51)
  end
}
enmgen2_az2_a_18_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "runner",
        locator = "locator_az2_a_18_01",
        name = "runner1801"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_18_05",
        name = "gellyfish1801"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_18_06",
        name = "gellyfish1802"
      }
    },
    {
      {
        type = "runner",
        locator = "locator_az2_a_18_01",
        name = "runner1801"
      },
      {
        type = "imp",
        locator = "locator_az2_a_18_03",
        name = "imp1801"
      },
      {
        type = "imp",
        locator = "locator_az2_a_18_04",
        name = "imp1802"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_18_05",
        name = "gellyfish1801"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_18_06",
        name = "gellyfish1802"
      }
    },
    {
      {
        type = "runner",
        locator = "locator_az2_a_18_01",
        name = "runner1801"
      },
      {
        type = "runner",
        locator = "locator_az2_a_18_02",
        name = "runner1802"
      },
      {
        type = "imp",
        locator = "locator_az2_a_18_03",
        name = "imp1801"
      },
      {
        type = "imp",
        locator = "locator_az2_a_18_04",
        name = "imp1802"
      },
      {
        type = "lasercannon",
        locator = "locator_az2_a_18_05",
        name = "gellyfish1801"
      },
      {
        type = "lasercannon",
        locator = "locator_az2_a_18_06",
        name = "gellyfish1802"
      }
    }
  },
  onUpdate = function(A0_52)
    local L1_53
  end,
  onEnter = function(A0_54)
    local L1_55
  end,
  onLeave = function(A0_56)
    local L1_57
  end,
  onObjectDead = function(A0_58, A1_59)
  end,
  onPopGem = function(A0_60, A1_61)
    EnemeyDropGem(A0_60, A1_61)
  end,
  onObjectAsh = function(A0_62, A1_63)
  end
}
enmgen2_az2_a_19_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "lasercannon",
        locator = "locator_az2_a_19_01",
        name = "lasercannon1901"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_04",
        name = "stalker1901"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_05",
        name = "stalker1902"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_az2_a_19_01",
        name = "lasercannon1901"
      },
      {
        type = "lasercannon",
        locator = "locator_az2_a_19_02",
        name = "lasercannon1902"
      },
      {
        type = "runner",
        locator = "locator_az2_a_19_03",
        name = "runner1901"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_04",
        name = "stalker1901"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_05",
        name = "stalker1902"
      }
    },
    {
      {
        type = "lasercannon_strong",
        locator = "locator_az2_a_19_01",
        name = "lasercannon1901"
      },
      {
        type = "lasercannon",
        locator = "locator_az2_a_19_02",
        name = "lasercannon1902"
      },
      {
        type = "runner",
        locator = "locator_az2_a_19_03",
        name = "runner1901"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_04",
        name = "stalker1901"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_05",
        name = "stalker1902"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_06",
        name = "stalker1903"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_19_07",
        name = "stalker1904"
      }
    }
  },
  onUpdate = function(A0_64)
    local L1_65
  end,
  onEnter = function(A0_66)
    local L1_67
  end,
  onLeave = function(A0_68)
    local L1_69
  end,
  onObjectDead = function(A0_70, A1_71)
  end,
  onPopGem = function(A0_72, A1_73)
    EnemeyDropGem(A0_72, A1_73)
  end,
  onObjectAsh = function(A0_74, A1_75)
  end
}
enmgen2_az2_a_04_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "imp",
        locator = "locator_az2_a_04_01",
        name = "imp0401"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_04_03",
        name = "gellyfish0401"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_04_04",
        name = "gellyfish0402"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_az2_a_04_01",
        name = "imp0401"
      },
      {
        type = "imp",
        locator = "locator_az2_a_04_02",
        name = "imp0402"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_04_03",
        name = "gellyfish0401"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_04_04",
        name = "gellyfish0402"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_az2_a_04_01",
        name = "imp0401"
      },
      {
        type = "imp",
        locator = "locator_az2_a_04_02",
        name = "imp0402"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_04_03",
        name = "gellyfish0401"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_04_04",
        name = "gellyfish0402"
      },
      {
        type = "imp",
        locator = "locator_az2_a_04_05",
        name = "imp0403"
      },
      {
        type = "imp",
        locator = "locator_az2_a_04_06",
        name = "imp0404"
      }
    }
  },
  onUpdate = function(A0_76)
    local L1_77
  end,
  onEnter = function(A0_78)
    local L1_79
  end,
  onLeave = function(A0_80)
    local L1_81
  end,
  onObjectDead = function(A0_82, A1_83)
  end,
  onPopGem = function(A0_84, A1_85)
    EnemeyDropGem(A0_84, A1_85)
  end,
  onObjectAsh = function(A0_86, A1_87)
  end
}
enmgen2_az2_a_02_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "imp",
        locator = "locator_az2_a_02_01",
        name = "imp0201"
      },
      {
        type = "jammer",
        locator = "locator_az2_a_02_03",
        name = "jammer0201"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_az2_a_02_01",
        name = "imp0201"
      },
      {
        type = "lasercannon",
        locator = "locator_az2_a_02_02",
        name = "lasercannon0201"
      },
      {
        type = "jammer",
        locator = "locator_az2_a_02_03",
        name = "jammer0201"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_az2_a_02_01",
        name = "imp0201"
      },
      {
        type = "lasercannon_strong",
        locator = "locator_az2_a_02_02",
        name = "lasercannon0201"
      },
      {
        type = "jammer",
        locator = "locator_az2_a_02_03",
        name = "jammer0201"
      }
    }
  },
  onUpdate = function(A0_88)
    local L1_89
  end,
  onEnter = function(A0_90)
    local L1_91
  end,
  onLeave = function(A0_92)
    local L1_93
  end,
  onObjectDead = function(A0_94, A1_95)
  end,
  onPopGem = function(A0_96, A1_97)
    EnemeyDropGem(A0_96, A1_97)
  end,
  onObjectAsh = function(A0_98, A1_99)
  end
}
enmgen2_az2_a_23_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_az2_a_23_01",
      name = "lunafishowner_02",
      ai_spawn_option = "LunaFishOwner/owner_test"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_az2_a_23_01",
      name = "lunafish_02"
    }
  },
  setData = {
    {
      {
        type = "runner",
        locator = "locator_az2_a_23_03",
        name = "runner2301"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_23_05",
        name = "stalker2301"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_23_06",
        name = "stalker2301"
      }
    },
    {
      {
        type = "runner",
        locator = "locator_az2_a_23_03",
        name = "runner2301"
      },
      {
        type = "runner",
        locator = "locator_az2_a_23_04",
        name = "runner2302"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_23_05",
        name = "stalker2301"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_23_06",
        name = "stalker2301"
      }
    },
    {
      {
        type = "treecannon",
        locator = "locator_az2_a_23_02",
        name = "treecannon2301"
      },
      {
        type = "runner",
        locator = "locator_az2_a_23_03",
        name = "runner2301"
      },
      {
        type = "runner",
        locator = "locator_az2_a_23_04",
        name = "runner2302"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_23_05",
        name = "stalker2301"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_23_06",
        name = "stalker2301"
      }
    }
  },
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
  end,
  onPopGem = function(A0_108, A1_109)
    EnemeyDropGem(A0_108, A1_109)
  end,
  onObjectAsh = function(A0_110, A1_111)
  end
}
enmgen2_az2_a_05_14_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "lasercannon",
        locator = "locator_az2_a_05_14_01",
        name = "lasercannon1601"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_14_03",
        name = "gellyfish1603"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_az2_a_05_14_01",
        name = "lasercannon1601"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_14_03",
        name = "gellyfish1603"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_14_04",
        name = "gellyfish1604"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_az2_a_05_14_01",
        name = "lasercannon1601"
      },
      {
        type = "lasercannon",
        locator = "locator_az2_a_05_14_02",
        name = "lasercannon1602"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_14_03",
        name = "gellyfish1603"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_05_14_04",
        name = "gellyfish1604"
      }
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
  onPopGem = function(A0_120, A1_121)
    EnemeyDropGem(A0_120, A1_121)
  end,
  onObjectAsh = function(A0_122, A1_123)
  end
}
enmgen2_az2_a_22_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_az2_a_22_01",
        name = "stalker2201"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_22_02",
        name = "stalker2202"
      },
      {
        type = "imp",
        locator = "locator_az2_a_22_05",
        name = "imp2202"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_az2_a_22_01",
        name = "stalker2201"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_22_02",
        name = "stalker2202"
      },
      {
        type = "imp",
        locator = "locator_az2_a_22_04",
        name = "imp2201"
      },
      {
        type = "imp",
        locator = "locator_az2_a_22_05",
        name = "imp2202"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_az2_a_22_01",
        name = "stalker2201"
      },
      {
        type = "stalker",
        locator = "locator_az2_a_22_02",
        name = "stalker2202"
      },
      {
        type = "jammer",
        locator = "locator_az2_a_22_03",
        name = "jammer2201"
      },
      {
        type = "imp",
        locator = "locator_az2_a_22_04",
        name = "imp2201"
      },
      {
        type = "imp",
        locator = "locator_az2_a_22_05",
        name = "imp2202"
      }
    }
  },
  onUpdate = function(A0_124)
    local L1_125
  end,
  onEnter = function(A0_126)
    local L1_127
  end,
  onLeave = function(A0_128)
    local L1_129
  end,
  onObjectDead = function(A0_130, A1_131)
  end,
  onPopGem = function(A0_132, A1_133)
    EnemeyDropGem(A0_132, A1_133)
  end,
  onObjectAsh = function(A0_134, A1_135)
  end
}
enmgen2_az2_a_21_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "giant",
        locator = "locator_az2_a_21_01",
        name = "giant2101"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_21_04",
        name = "gellyfish2101"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_21_05",
        name = "gellyfish2102"
      }
    },
    {
      {
        type = "giant",
        locator = "locator_az2_a_21_01",
        name = "giant2101"
      },
      {
        type = "imp",
        locator = "locator_az2_a_21_04",
        name = "gellyfish2101"
      },
      {
        type = "imp",
        locator = "locator_az2_a_21_05",
        name = "gellyfish2102"
      }
    },
    {
      {
        type = "giant",
        locator = "locator_az2_a_21_01",
        name = "giant2101"
      },
      {
        type = "jammer",
        locator = "locator_az2_a_21_02",
        name = "jammer2101"
      },
      {
        type = "jammer",
        locator = "locator_az2_a_21_03",
        name = "jammer2102"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_21_04",
        name = "gellyfish2101"
      },
      {
        type = "gellyfish",
        locator = "locator_az2_a_21_05",
        name = "gellyfish2102"
      }
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
  onObjectDead = function(A0_142, A1_143)
  end,
  onPopGem = function(A0_144, A1_145)
    EnemeyDropGem(A0_144, A1_145)
  end,
  onObjectAsh = function(A0_146, A1_147)
  end
}
