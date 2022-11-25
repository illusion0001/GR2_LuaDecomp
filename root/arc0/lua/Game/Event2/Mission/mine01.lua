mine_name = "mine01"
add_mine = ""
_mine_id = 1
_floor = 0
_boss_navi_range = 100
_enmgen_boss = "enmgen2_boss"
_enmgen_list = {
  "enmgen2_pi_a_01",
  "enmgen2_pi_a_03_01",
  "enmgen2_pi_a_03_02",
  "enmgen2_pi_a_03_03",
  "enmgen2_pi_a_03_04",
  "enmgen2_pi_a_06_01",
  "enmgen2_pi_a_06_02",
  "enmgen2_pi_a_06_03",
  "enmgen2_pi_a_06_04",
  "enmgen2_pi_a_09_01",
  "enmgen2_pi_a_09_02",
  "enmgen2_pi_a_11",
  "enmgen2_pi_a_13",
  "enmgen2_pi_a_16_01",
  "enmgen2_pi_a_16_02",
  "enmgen2_pi_a_16_03",
  "enmgen2_pi_a_16_04",
  "enmgen2_pi_a_16_05",
  "enmgen2_pi_a_22",
  "enmgen2_pi_a_23",
  "enmgen2_pi_a_25"
}
dofile("/Game/Event2/Mission/mine_base.lua")
_gravityOre = {
  mineOreEvdName = mine_name .. "_ore",
  instance_flg = true,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_is_boss_in_sensor = false
_boss_respawn_counter = 0
enmgen2_boss = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "faker",
      locator = "locator_boss",
      name = "mine01_boss",
      ai_spawn_option = "Faker/faker_boss_mine01",
      navi_mesh_name = "pi_a_10_custom01"
    }
  },
  onUpdate = function(A0_0)
    if _is_boss_in_sensor then
      _boss_respawn_counter = _boss_respawn_counter + 1
      if _boss_respawn_counter % 100 == 0 then
        print(string.format("Boss Respawn Count : %d", _boss_respawn_counter))
      end
      if _boss_respawn_counter > 1800 then
        findGameObject2("EnemyBrain", "mine01_boss"):eventMessage("requestRespawn")
        _boss_respawn_counter = 0
        _is_boss_in_sensor = false
        print("\227\131\156\227\130\185\227\129\174\230\185\167\227\129\141\231\155\180\227\129\151\227\130\146\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\151\227\129\190\227\129\151\227\129\159")
      end
    else
      _boss_respawn_counter = 0
    end
  end,
  onEnter = function(A0_1)
    local L1_2
  end,
  onLeave = function(A0_3)
    local L1_4
  end,
  onPopGem = function(A0_5, A1_6)
    invokeTask(function()
      if Fn_rewardMineBoss("boss01") then
        print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
      else
        Fn_EnemyDropGraviryOre(A0_5, A1_6, "infinity", 1)
      end
      EnemeyDropGem(A0_5, A1_6)
      Fn_bossDefeated()
    end)
  end,
  onObjectAsh = function(A0_7, A1_8)
    _boss_defeated = true
  end,
  onObjectDead = function(A0_9, A1_10)
  end
}
enmgen2_pi_a_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "runner",
        locator = "locator_pi_a_01_01",
        name = "runner0101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_04",
        name = "stalker0101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_07",
        name = "stalker0104"
      }
    },
    {
      {
        type = "runner",
        locator = "locator_pi_a_01_01",
        name = "runner0101"
      },
      {
        type = "runner",
        locator = "locator_pi_a_01_02",
        name = "runner0102"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_04",
        name = "stalker0101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_05",
        name = "stalker0102"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_06",
        name = "stalker0103"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_07",
        name = "stalker0104"
      }
    },
    {
      {
        type = "runner",
        locator = "locator_pi_a_01_01",
        name = "runner0101"
      },
      {
        type = "runner",
        locator = "locator_pi_a_01_02",
        name = "runner0102"
      },
      {
        type = "runner",
        locator = "locator_pi_a_01_03",
        name = "runner0103"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_04",
        name = "stalker0101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_05",
        name = "stalker0102"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_06",
        name = "stalker0103"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_07",
        name = "stalker0104"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_08",
        name = "stalker0105"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_01_09",
        name = "stalker0106"
      }
    }
  },
  onUpdate = function(A0_11)
    local L1_12
  end,
  onEnter = function(A0_13)
    local L1_14
  end,
  onLeave = function(A0_15)
    local L1_16
  end,
  onPopGem = function(A0_17, A1_18)
    EnemeyDropGem(A0_17, A1_18)
  end,
  onObjectAsh = function(A0_19, A1_20)
  end,
  onObjectDead = function(A0_21, A1_22)
  end
}
enmgen2_pi_a_03_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_01",
        name = "stalker030101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_04",
        name = "stalker030104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_01_07",
        name = "gellyfish030101"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_01",
        name = "stalker030101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_03",
        name = "stalker030103"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_05",
        name = "stalker030105"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_01_07",
        name = "gellyfish030101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_01_09",
        name = "gellyfish030103"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_01",
        name = "stalker030101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_02",
        name = "stalker030102"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_03",
        name = "stalker030103"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_04",
        name = "stalker030104"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_05",
        name = "stalker030105"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_01_06",
        name = "stalker030106"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_01_07",
        name = "gellyfish030101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_01_08",
        name = "gellyfish030102"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_01_09",
        name = "gellyfish030103"
      }
    }
  },
  onUpdate = function(A0_23)
    local L1_24
  end,
  onEnter = function(A0_25)
    local L1_26
  end,
  onLeave = function(A0_27)
    local L1_28
  end,
  onPopGem = function(A0_29, A1_30)
    EnemeyDropGem(A0_29, A1_30)
  end,
  onObjectAsh = function(A0_31, A1_32)
  end,
  onObjectDead = function(A0_33, A1_34)
  end
}
enmgen2_pi_a_03_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_03_02_01",
        name = "guardcore030201"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_04",
        name = "stalker030204"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_02_07",
        name = "gellyfish030201"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_03_02_01",
        name = "guardcore030201"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_03",
        name = "stalker030203"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_05",
        name = "stalker030205"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_02_07",
        name = "gellyfish030201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_02_09",
        name = "gellyfish030203"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_03_02_01",
        name = "guardcore030201"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_02",
        name = "stalker030202"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_03",
        name = "stalker030203"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_04",
        name = "stalker030204"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_05",
        name = "stalker030205"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_02_06",
        name = "stalker030206"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_02_07",
        name = "gellyfish030201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_02_08",
        name = "gellyfish030202"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_02_09",
        name = "gellyfish030203"
      }
    }
  },
  onUpdate = function(A0_35)
    local L1_36
  end,
  onEnter = function(A0_37)
    local L1_38
  end,
  onLeave = function(A0_39)
    local L1_40
  end,
  onObjectAsh = function(A0_41, A1_42)
  end,
  onPopGem = function(A0_43, A1_44)
    EnemeyDropGem(A0_43, A1_44)
  end,
  onObjectDead = function(A0_45, A1_46)
  end
}
enmgen2_pi_a_03_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_01",
        name = "stalker030301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_04",
        name = "stalker030304"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_07",
        name = "gellyfish030301"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_01",
        name = "stalker030301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_03",
        name = "stalker030303"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_05",
        name = "stalker030305"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_07",
        name = "gellyfish030301"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_09",
        name = "gellyfish030303"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_01",
        name = "stalker030301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_02",
        name = "stalker030302"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_03",
        name = "stalker030303"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_03_04",
        name = "stalker030304"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_05",
        name = "gellyfish030301"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_06",
        name = "gellyfish030302"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_07",
        name = "gellyfish030303"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_08",
        name = "gellyfish030304"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_03_09",
        name = "gellyfish030305"
      }
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
  onPopGem = function(A0_53, A1_54)
    EnemeyDropGem(A0_53, A1_54)
  end,
  onObjectAsh = function(A0_55, A1_56)
  end,
  onObjectDead = function(A0_57, A1_58)
  end
}
enmgen2_pi_a_03_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_04_01",
        name = "stalker030401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_04",
        name = "gellyfish030401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_07",
        name = "gellyfish030404"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_04_01",
        name = "stalker030401"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_04_03",
        name = "stalker030403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_05",
        name = "gellyfish030402"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_07",
        name = "gellyfish030404"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_09",
        name = "gellyfish030406"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_03_04_01",
        name = "stalker030401"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_03_04_02",
        name = "stalker030402"
      },
      {
        type = "runner",
        locator = "locator_pi_a_03_04_03",
        name = "stalker030403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_04",
        name = "gellyfish030401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_05",
        name = "gellyfish030402"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_06",
        name = "gellyfish030403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_07",
        name = "gellyfish030404"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_03_04_08",
        name = "gellyfish030405"
      },
      {
        type = "imp",
        locator = "locator_pi_a_03_04_09",
        name = "gellyfish030406"
      }
    }
  },
  onUpdate = function(A0_59)
    local L1_60
  end,
  onEnter = function(A0_61)
    local L1_62
  end,
  onLeave = function(A0_63)
    local L1_64
  end,
  onPopGem = function(A0_65, A1_66)
    EnemeyDropGem(A0_65, A1_66)
  end,
  onObjectAsh = function(A0_67, A1_68)
  end,
  onObjectDead = function(A0_69, A1_70)
  end
}
enmgen2_pi_a_06_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_01",
        name = "gellyfish060101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_04",
        name = "gellyfish060104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_07",
        name = "gellyfish060107"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_01",
        name = "gellyfish060101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_03",
        name = "gellyfish060103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_05",
        name = "gellyfish060105"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_07",
        name = "gellyfish060107"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_09",
        name = "gellyfish060109"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_01",
        name = "gellyfish060101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_02",
        name = "gellyfish060102"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_03",
        name = "gellyfish060103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_04",
        name = "gellyfish060104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_05",
        name = "gellyfish060105"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_06",
        name = "gellyfish060106"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_07",
        name = "gellyfish060107"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_08",
        name = "gellyfish060108"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_01_09",
        name = "gellyfish060109"
      }
    }
  },
  onUpdate = function(A0_71)
    local L1_72
  end,
  onEnter = function(A0_73)
    local L1_74
  end,
  onLeave = function(A0_75)
    local L1_76
  end,
  onPopGem = function(A0_77, A1_78)
    EnemeyDropGem(A0_77, A1_78)
  end,
  onObjectAsh = function(A0_79, A1_80)
  end,
  onObjectDead = function(A0_81, A1_82)
  end
}
enmgen2_pi_a_06_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_01",
        name = "gellyfish060201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_04",
        name = "gellyfish060204"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_07",
        name = "gellyfish060207"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_01",
        name = "gellyfish060201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_03",
        name = "gellyfish060203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_05",
        name = "gellyfish060205"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_07",
        name = "gellyfish060207"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_09",
        name = "gellyfish060209"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_01",
        name = "gellyfish060201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_02",
        name = "gellyfish060202"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_03",
        name = "gellyfish060203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_04",
        name = "gellyfish060204"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_05",
        name = "gellyfish060205"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_06",
        name = "gellyfish060206"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_07",
        name = "gellyfish060207"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_08",
        name = "gellyfish060208"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_02_09",
        name = "gellyfish060209"
      }
    }
  },
  onUpdate = function(A0_83)
    local L1_84
  end,
  onEnter = function(A0_85)
    local L1_86
  end,
  onLeave = function(A0_87)
    local L1_88
  end,
  onPopGem = function(A0_89, A1_90)
    EnemeyDropGem(A0_89, A1_90)
  end,
  onObjectAsh = function(A0_91, A1_92)
  end,
  onObjectDead = function(A0_93, A1_94)
  end
}
enmgen2_pi_a_06_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "treecannon",
        locator = "locator_pi_a_06_03_02",
        name = "treecannon060301"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_03",
        name = "imp060301"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_05",
        name = "imp060303"
      }
    },
    {
      {
        type = "jammer",
        locator = "locator_pi_a_06_03_01",
        name = "jammer060301"
      },
      {
        type = "treecannon",
        locator = "locator_pi_a_06_03_02",
        name = "treecannon060301"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_03",
        name = "imp060301"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_04",
        name = "imp060302"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_05",
        name = "imp060303"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_06",
        name = "imp060304"
      }
    },
    {
      {
        type = "jammer",
        locator = "locator_pi_a_06_03_01",
        name = "jammer060301"
      },
      {
        type = "treecannon",
        locator = "locator_pi_a_06_03_02",
        name = "treecannon060301"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_03",
        name = "imp060301"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_04",
        name = "imp060302"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_05",
        name = "imp060303"
      },
      {
        type = "imp",
        locator = "locator_pi_a_06_03_06",
        name = "imp060304"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_03_07",
        name = "gellyfish060301"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_03_08",
        name = "gellyfish060302"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_03_09",
        name = "gellyfish060303"
      }
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
  onPopGem = function(A0_101, A1_102)
    EnemeyDropGem(A0_101, A1_102)
  end,
  onObjectAsh = function(A0_103, A1_104)
  end,
  onObjectDead = function(A0_105, A1_106)
  end
}
enmgen2_pi_a_06_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_01",
        name = "gellyfish060401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_04",
        name = "gellyfish060404"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_07",
        name = "gellyfish060407"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_01",
        name = "gellyfish060401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_03",
        name = "gellyfish060403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_05",
        name = "gellyfish060405"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_07",
        name = "gellyfish060407"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_09",
        name = "gellyfish060409"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_01",
        name = "gellyfish060401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_02",
        name = "gellyfish060402"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_03",
        name = "gellyfish060403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_04",
        name = "gellyfish060404"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_05",
        name = "gellyfish060405"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_06",
        name = "gellyfish060406"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_07",
        name = "gellyfish060407"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_08",
        name = "gellyfish060408"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_04_09",
        name = "gellyfish060409"
      }
    }
  },
  onUpdate = function(A0_107)
    local L1_108
  end,
  onEnter = function(A0_109)
    local L1_110
  end,
  onLeave = function(A0_111)
    local L1_112
  end,
  onPopGem = function(A0_113, A1_114)
    EnemeyDropGem(A0_113, A1_114)
  end,
  onObjectAsh = function(A0_115, A1_116)
  end,
  onObjectDead = function(A0_117, A1_118)
  end
}
enmgen2_pi_a_06_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_02",
        name = "gellyfish060501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_05",
        name = "gellyfish060504"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_08",
        name = "gellyfish060507"
      }
    },
    {
      {
        type = "giant",
        locator = "locator_pi_a_06_05_01",
        name = "giant060501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_02",
        name = "gellyfish060501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_04",
        name = "gellyfish060503"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_08",
        name = "gellyfish060507"
      }
    },
    {
      {
        type = "giant",
        locator = "locator_pi_a_06_05_01",
        name = "giant060501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_02",
        name = "gellyfish060501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_03",
        name = "gellyfish060502"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_04",
        name = "gellyfish060503"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_05",
        name = "gellyfish060504"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_06",
        name = "gellyfish060505"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_07",
        name = "gellyfish060506"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_08",
        name = "gellyfish060507"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_05_09",
        name = "gellyfish060508"
      }
    }
  },
  onUpdate = function(A0_119)
    local L1_120
  end,
  onEnter = function(A0_121)
    local L1_122
  end,
  onLeave = function(A0_123)
    local L1_124
  end,
  onPopGem = function(A0_125, A1_126)
    EnemeyDropGem(A0_125, A1_126)
  end,
  onObjectAsh = function(A0_127, A1_128)
  end,
  onObjectDead = function(A0_129, A1_130)
  end
}
enmgen2_pi_a_06_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_06_06_05",
        name = "stalker060601"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_06_06_06",
        name = "stalker060602"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_06_08",
        name = "gellyfish060601"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_06_06_01",
        name = "guardcore060601"
      },
      {
        type = "lasercannon",
        locator = "locator_pi_a_06_06_03",
        name = "lasercannon060601"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_06_06_05",
        name = "stalker060601"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_06_06_06",
        name = "stalker060602"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_06_08",
        name = "gellyfish060601"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_06_06_01",
        name = "guardcore060601"
      },
      {
        type = "treecannon",
        locator = "locator_pi_a_06_06_02",
        name = "treecannon060601"
      },
      {
        type = "lasercannon",
        locator = "locator_pi_a_06_06_03",
        name = "lasercannon060601"
      },
      {
        type = "lasercannon",
        locator = "locator_pi_a_06_06_04",
        name = "lasercannon060602"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_06_06_05",
        name = "stalker060601"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_06_06_06",
        name = "stalker060602"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_06_06_07",
        name = "stalker060603"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_06_08",
        name = "gellyfish060601"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_06_06_09",
        name = "gellyfish060602"
      }
    }
  },
  onUpdate = function(A0_131)
    local L1_132
  end,
  onEnter = function(A0_133)
    local L1_134
  end,
  onLeave = function(A0_135)
    local L1_136
  end,
  onPopGem = function(A0_137, A1_138)
    EnemeyDropGem(A0_137, A1_138)
  end,
  onObjectAsh = function(A0_139, A1_140)
  end,
  onObjectDead = function(A0_141, A1_142)
  end
}
enmgen2_pi_a_09_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_01",
        name = "gellyfish090101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_04",
        name = "gellyfish090104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_07",
        name = "gellyfish090107"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_01",
        name = "gellyfish090101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_03",
        name = "gellyfish090103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_05",
        name = "gellyfish090105"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_07",
        name = "gellyfish090107"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_09",
        name = "gellyfish090109"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_01",
        name = "gellyfish090101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_02",
        name = "gellyfish090102"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_03",
        name = "gellyfish090103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_04",
        name = "gellyfish090104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_05",
        name = "gellyfish090105"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_06",
        name = "gellyfish090106"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_07",
        name = "gellyfish090107"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_08",
        name = "gellyfish090108"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_01_09",
        name = "gellyfish090109"
      }
    }
  },
  onUpdate = function(A0_143)
    local L1_144
  end,
  onEnter = function(A0_145)
    local L1_146
  end,
  onLeave = function(A0_147)
    local L1_148
  end,
  onPopGem = function(A0_149, A1_150)
    EnemeyDropGem(A0_149, A1_150)
  end,
  onObjectAsh = function(A0_151, A1_152)
  end,
  onObjectDead = function(A0_153, A1_154)
  end
}
enmgen2_pi_a_09_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_01",
        name = "gellyfish090201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_04",
        name = "gellyfish090204"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_07",
        name = "stalker090207"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_01",
        name = "gellyfish090201"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_03",
        name = "stalker090203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_05",
        name = "gellyfish090205"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_07",
        name = "stalker090207"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_09",
        name = "stalker090209"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_01",
        name = "gellyfish090201"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_02",
        name = "stalker090202"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_03",
        name = "stalker090203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_04",
        name = "gellyfish090204"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_05",
        name = "gellyfish090205"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_09_02_06",
        name = "gellyfish090206"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_07",
        name = "stalker090207"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_08",
        name = "stalker090208"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_09_02_09",
        name = "stalker090209"
      }
    }
  },
  onUpdate = function(A0_155)
    local L1_156
  end,
  onEnter = function(A0_157)
    local L1_158
  end,
  onLeave = function(A0_159)
    local L1_160
  end,
  onPopGem = function(A0_161, A1_162)
    EnemeyDropGem(A0_161, A1_162)
  end,
  onObjectAsh = function(A0_163, A1_164)
  end,
  onObjectDead = function(A0_165, A1_166)
  end
}
enmgen2_pi_a_11 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_11_01",
        name = "guardcore1101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_02",
        name = "gellyfish1101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_05",
        name = "gellyfish1104"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_11_01",
        name = "guardcore1101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_03",
        name = "gellyfish1102"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_05",
        name = "gellyfish1104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_07",
        name = "gellyfish1106"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_09",
        name = "gellyfish1108"
      }
    },
    {
      {
        type = "guardcore",
        locator = "locator_pi_a_11_01",
        name = "guardcore1101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_02",
        name = "gellyfish1101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_03",
        name = "gellyfish1102"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_04",
        name = "gellyfish1103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_05",
        name = "gellyfish1104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_06",
        name = "gellyfish1105"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_07",
        name = "gellyfish1106"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_08",
        name = "gellyfish1107"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_11_09",
        name = "gellyfish1108"
      }
    }
  },
  onUpdate = function(A0_167)
    local L1_168
  end,
  onEnter = function(A0_169)
    local L1_170
  end,
  onLeave = function(A0_171)
    local L1_172
  end,
  onPopGem = function(A0_173, A1_174)
    EnemeyDropGem(A0_173, A1_174)
  end,
  onObjectAsh = function(A0_175, A1_176)
  end,
  onObjectDead = function(A0_177, A1_178)
  end
}
enmgen2_pi_a_13 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "runner",
        locator = "locator_pi_a_13_02",
        name = "runner1302"
      },
      {
        type = "runner",
        locator = "locator_pi_a_13_04",
        name = "runner1304"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_06",
        name = "stalker1301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_08",
        name = "stalker1301"
      }
    },
    {
      {
        type = "runner",
        locator = "locator_pi_a_13_01",
        name = "runner1301"
      },
      {
        type = "runner",
        locator = "locator_pi_a_13_03",
        name = "runner1303"
      },
      {
        type = "runner",
        locator = "locator_pi_a_13_04",
        name = "runner1304"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_05",
        name = "stalker1301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_07",
        name = "stalker1301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_09",
        name = "stalker1301"
      }
    },
    {
      {
        type = "runner",
        locator = "locator_pi_a_13_01",
        name = "runner1301"
      },
      {
        type = "runner",
        locator = "locator_pi_a_13_02",
        name = "runner1302"
      },
      {
        type = "runner",
        locator = "locator_pi_a_13_03",
        name = "runner1303"
      },
      {
        type = "runner",
        locator = "locator_pi_a_13_04",
        name = "runner1304"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_05",
        name = "stalker1301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_06",
        name = "stalker1301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_07",
        name = "stalker1301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_08",
        name = "stalker1301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_13_09",
        name = "stalker1301"
      }
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
  onPopGem = function(A0_185, A1_186)
    EnemeyDropGem(A0_185, A1_186)
  end,
  onObjectAsh = function(A0_187, A1_188)
  end,
  onObjectDead = function(A0_189, A1_190)
  end
}
enmgen2_pi_a_16_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_01_01",
        name = "stalker160101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_04",
        name = "gellyfish160101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_07",
        name = "gellyfish160104"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_01_01",
        name = "stalker160101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_01_03",
        name = "stalker160103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_05",
        name = "gellyfish160102"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_07",
        name = "gellyfish160104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_09",
        name = "gellyfish160106"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_01_01",
        name = "stalker160101"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_01_02",
        name = "stalker160102"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_01_03",
        name = "stalker160103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_04",
        name = "gellyfish160101"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_05",
        name = "gellyfish160102"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_06",
        name = "gellyfish160103"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_07",
        name = "gellyfish160104"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_08",
        name = "gellyfish160105"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_01_09",
        name = "gellyfish160106"
      }
    }
  },
  onUpdate = function(A0_191)
    local L1_192
  end,
  onEnter = function(A0_193)
    local L1_194
  end,
  onLeave = function(A0_195)
    local L1_196
  end,
  onPopGem = function(A0_197, A1_198)
    EnemeyDropGem(A0_197, A1_198)
  end,
  onObjectAsh = function(A0_199, A1_200)
  end,
  onObjectDead = function(A0_201, A1_202)
  end
}
enmgen2_pi_a_16_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_02_01",
        name = "stalker160201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_04",
        name = "gellyfish160201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_07",
        name = "gellyfish160204"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_02_01",
        name = "stalker160201"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_02_03",
        name = "stalker160203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_05",
        name = "gellyfish160202"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_07",
        name = "gellyfish160204"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_09",
        name = "gellyfish160206"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_02_01",
        name = "stalker160201"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_02_02",
        name = "stalker160202"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_02_03",
        name = "stalker160203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_04",
        name = "gellyfish160201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_05",
        name = "gellyfish160202"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_06",
        name = "gellyfish160203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_07",
        name = "gellyfish160204"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_08",
        name = "gellyfish160205"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_02_09",
        name = "gellyfish160206"
      }
    }
  },
  onUpdate = function(A0_203)
    local L1_204
  end,
  onEnter = function(A0_205)
    local L1_206
  end,
  onLeave = function(A0_207)
    local L1_208
  end,
  onPopGem = function(A0_209, A1_210)
    EnemeyDropGem(A0_209, A1_210)
  end,
  onObjectAsh = function(A0_211, A1_212)
  end,
  onObjectDead = function(A0_213, A1_214)
  end
}
enmgen2_pi_a_16_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_03_01",
        name = "stalker160301"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_04",
        name = "gellyfish160301"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_07",
        name = "gellyfish160304"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_03_01",
        name = "stalker160301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_03_03",
        name = "stalker160303"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_05",
        name = "gellyfish160302"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_07",
        name = "gellyfish160304"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_09",
        name = "gellyfish160306"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_03_01",
        name = "stalker160301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_03_02",
        name = "stalker160302"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_03_03",
        name = "stalker160303"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_04",
        name = "gellyfish160301"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_05",
        name = "gellyfish160302"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_06",
        name = "gellyfish160303"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_07",
        name = "gellyfish160304"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_08",
        name = "gellyfish160305"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_03_09",
        name = "gellyfish160306"
      }
    }
  },
  onUpdate = function(A0_215)
    local L1_216
  end,
  onEnter = function(A0_217)
    local L1_218
  end,
  onLeave = function(A0_219)
    local L1_220
  end,
  onPopGem = function(A0_221, A1_222)
    EnemeyDropGem(A0_221, A1_222)
  end,
  onObjectAsh = function(A0_223, A1_224)
  end,
  onObjectDead = function(A0_225, A1_226)
  end
}
enmgen2_pi_a_16_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_04_01",
        name = "stalker160401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_04",
        name = "gellyfish160401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_07",
        name = "gellyfish160404"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_04_01",
        name = "stalker160401"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_04_03",
        name = "stalker160403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_05",
        name = "gellyfish160402"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_07",
        name = "gellyfish160404"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_09",
        name = "gellyfish160406"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_04_01",
        name = "stalker160401"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_04_02",
        name = "stalker160402"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_04_03",
        name = "stalker160403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_04",
        name = "gellyfish160401"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_05",
        name = "gellyfish160402"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_06",
        name = "gellyfish160403"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_07",
        name = "gellyfish160404"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_08",
        name = "gellyfish160405"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_04_09",
        name = "gellyfish160406"
      }
    }
  },
  onUpdate = function(A0_227)
    local L1_228
  end,
  onEnter = function(A0_229)
    local L1_230
  end,
  onLeave = function(A0_231)
    local L1_232
  end,
  onPopGem = function(A0_233, A1_234)
    EnemeyDropGem(A0_233, A1_234)
  end,
  onObjectAsh = function(A0_235, A1_236)
  end,
  onObjectDead = function(A0_237, A1_238)
  end
}
enmgen2_pi_a_16_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_05_01",
        name = "stalker160501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_04",
        name = "gellyfish160501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_07",
        name = "gellyfish160504"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_05_01",
        name = "stalker160501"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_05_03",
        name = "stalker160503"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_05",
        name = "gellyfish160502"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_07",
        name = "gellyfish160504"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_09",
        name = "gellyfish160506"
      }
    },
    {
      {
        type = "stalker",
        locator = "locator_pi_a_16_05_01",
        name = "stalker160501"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_05_02",
        name = "stalker160502"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_16_05_03",
        name = "stalker160503"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_04",
        name = "gellyfish160501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_05",
        name = "gellyfish160502"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_06",
        name = "gellyfish160503"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_07",
        name = "gellyfish160504"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_08",
        name = "gellyfish160505"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_16_05_09",
        name = "gellyfish160506"
      }
    }
  },
  onUpdate = function(A0_239)
    local L1_240
  end,
  onEnter = function(A0_241)
    local L1_242
  end,
  onLeave = function(A0_243)
    local L1_244
  end,
  onPopGem = function(A0_245, A1_246)
    EnemeyDropGem(A0_245, A1_246)
  end,
  onObjectAsh = function(A0_247, A1_248)
  end,
  onObjectDead = function(A0_249, A1_250)
  end
}
enmgen2_pi_a_22 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "imp",
        locator = "locator_pi_a_22_01",
        name = "imp2201"
      },
      {
        type = "imp",
        locator = "locator_pi_a_22_04",
        name = "imp2202"
      },
      {
        type = "guardcore",
        locator = "locator_pi_a_22_08",
        name = "guardcore2201"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_pi_a_22_01",
        name = "imp2201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_22_02",
        name = "gellyfish2201"
      },
      {
        type = "imp",
        locator = "locator_pi_a_22_04",
        name = "imp2202"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_22_05",
        name = "gellyfish2203"
      },
      {
        type = "guardcore",
        locator = "locator_pi_a_22_08",
        name = "guardcore2201"
      },
      {
        type = "runner",
        locator = "locator_pi_a_22_09",
        name = "stalker2202"
      }
    },
    {
      {
        type = "imp",
        locator = "locator_pi_a_22_01",
        name = "imp2201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_22_02",
        name = "gellyfish2201"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_22_03",
        name = "gellyfish2202"
      },
      {
        type = "imp",
        locator = "locator_pi_a_22_04",
        name = "imp2202"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_22_05",
        name = "gellyfish2203"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_22_06",
        name = "gellyfish2204"
      },
      {
        type = "runner",
        locator = "locator_pi_a_22_07",
        name = "stalker2201"
      },
      {
        type = "guardcore",
        locator = "locator_pi_a_22_08",
        name = "guardcore2201"
      },
      {
        type = "runner",
        locator = "locator_pi_a_22_09",
        name = "stalker2202"
      }
    }
  },
  onUpdate = function(A0_251)
    local L1_252
  end,
  onEnter = function(A0_253)
    local L1_254
  end,
  onLeave = function(A0_255)
    local L1_256
  end,
  onPopGem = function(A0_257, A1_258)
    EnemeyDropGem(A0_257, A1_258)
  end,
  onObjectAsh = function(A0_259, A1_260)
  end,
  onObjectDead = function(A0_261, A1_262)
  end
}
enmgen2_pi_a_23 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "runner",
        locator = "locator_pi_a_23_03",
        name = "runner2302"
      },
      {
        type = "lasercannon",
        locator = "locator_pi_a_23_04",
        name = "lasercannon2302"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_06",
        name = "stalker2302"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_09",
        name = "stalker2304"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_pi_a_23_01",
        name = "lasercannon2301"
      },
      {
        type = "runner",
        locator = "locator_pi_a_23_02",
        name = "runner2301"
      },
      {
        type = "lasercannon",
        locator = "locator_pi_a_23_04",
        name = "lasercannon2302"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_05",
        name = "stalker2301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_06",
        name = "stalker2302"
      },
      {
        type = "treecannon",
        locator = "locator_pi_a_23_08",
        name = "treecannon2301"
      }
    },
    {
      {
        type = "lasercannon",
        locator = "locator_pi_a_23_01",
        name = "lasercannon2301"
      },
      {
        type = "runner",
        locator = "locator_pi_a_23_02",
        name = "runner2301"
      },
      {
        type = "runner",
        locator = "locator_pi_a_23_03",
        name = "runner2302"
      },
      {
        type = "lasercannon",
        locator = "locator_pi_a_23_04",
        name = "lasercannon2302"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_05",
        name = "stalker2301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_06",
        name = "stalker2302"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_07",
        name = "stalker2303"
      },
      {
        type = "treecannon",
        locator = "locator_pi_a_23_08",
        name = "treecannon2301"
      },
      {
        type = "stalker",
        locator = "locator_pi_a_23_09",
        name = "stalker2304"
      }
    }
  },
  onUpdate = function(A0_263)
    local L1_264
  end,
  onEnter = function(A0_265)
    local L1_266
  end,
  onLeave = function(A0_267)
    local L1_268
  end,
  onPopGem = function(A0_269, A1_270)
    EnemeyDropGem(A0_269, A1_270)
  end,
  onObjectAsh = function(A0_271, A1_272)
  end,
  onObjectDead = function(A0_273, A1_274)
  end
}
enmgen2_pi_a_25 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_01",
        name = "gellyfish2501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_04",
        name = "gellyfish2504"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_07",
        name = "gellyfish2507"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_01",
        name = "gellyfish2501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_03",
        name = "gellyfish2503"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_05",
        name = "gellyfish2505"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_07",
        name = "gellyfish2507"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_09",
        name = "gellyfish2509"
      }
    },
    {
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_01",
        name = "gellyfish2501"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_02",
        name = "gellyfish2502"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_03",
        name = "gellyfish2503"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_04",
        name = "gellyfish2504"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_05",
        name = "gellyfish2505"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_06",
        name = "gellyfish2506"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_07",
        name = "gellyfish2507"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_08",
        name = "gellyfish2508"
      },
      {
        type = "gellyfish",
        locator = "locator_pi_a_25_09",
        name = "gellyfish2509"
      }
    }
  },
  onUpdate = function(A0_275)
    local L1_276
  end,
  onEnter = function(A0_277)
    local L1_278
  end,
  onLeave = function(A0_279)
    local L1_280
  end,
  onPopGem = function(A0_281, A1_282)
    EnemeyDropGem(A0_281, A1_282)
  end,
  onObjectAsh = function(A0_283, A1_284)
  end,
  onObjectDead = function(A0_285, A1_286)
  end
}
function cubesensor2_boss_01_OnEnter(A0_287)
  print("\227\131\156\227\130\185\227\129\140\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  _is_boss_in_sensor = true
end
function cubesensor2_boss_01_OnLeave(A0_288)
  print("\227\131\156\227\130\185\227\129\140\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\230\138\156\227\129\145\229\135\186\227\129\151\227\129\190\227\129\151\227\129\159")
  _is_boss_in_sensor = false
end
