dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeBattleCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_set_score_table = ""
START_TIME = {
  0,
  1,
  0,
  0
}
EXTEND_MAX_TIME = {
  0,
  59,
  59,
  99
}
EXTEND_SCORE = {
  {COUNT = 3, SCORE = 200},
  {COUNT = 6, SCORE = 250},
  {COUNT = 9, SCORE = 250},
  {COUNT = 12, SCORE = 300},
  {COUNT = 13, SCORE = 300}
}
EXTEND_TIME = {
  {
    COUNT = 3,
    TIME = {
      0,
      0,
      20,
      0
    }
  },
  {
    COUNT = 6,
    TIME = {
      0,
      0,
      15,
      0
    }
  },
  {
    COUNT = 9,
    TIME = {
      0,
      0,
      12,
      0
    }
  },
  {
    COUNT = 12,
    TIME = {
      0,
      0,
      10,
      0
    }
  },
  {
    COUNT = 13,
    TIME = {
      0,
      0,
      5,
      0
    }
  }
}
enmgen2_battle_01 = {
  enemyTableName = "enmgen2_01",
  spawnSet = {
    {
      name = "enemy_0101",
      type = "terrorist",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0102",
      type = "terrorist",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0103",
      type = "terrorist",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0104",
      type = "terrorist_rifle",
      locator = "locator_enemy_04"
    }
  }
}
enmgen2_battle_02 = {
  enemyTableName = "enmgen2_02",
  spawnSet = {
    {
      name = "enemy_0201",
      type = "gellyfish",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0202",
      type = "gellyfish_strong",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0203",
      type = "runner_strong",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0204",
      type = "defender_strong",
      locator = "locator_enemy_04"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {"enemy_0203", "enemy_0204"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end
}
enmgen2_battle_03 = {
  enemyTableName = "enmgen2_03",
  spawnSet = {
    {
      name = "enemy_0301",
      type = "terrorist",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0302",
      type = "terrorist_rifle",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0303",
      type = "terrorist",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0304",
      type = "terrorist_rifle",
      locator = "locator_enemy_04"
    },
    {
      name = "enemy_0305",
      type = "terrorist_rifle",
      locator = "locator_enemy_05"
    },
    {
      name = "enemy_0306",
      type = "terrorist_rifle",
      locator = "locator_enemy_06"
    },
    {
      name = "enemy_0307",
      type = "terrorist_rifle",
      locator = "locator_enemy_07"
    }
  },
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {
      "enemy_0301",
      "enemy_0302",
      "enemy_0303",
      "enemy_0304",
      "enemy_0305",
      "enemy_0306",
      "enemy_0307"
    }, 6, GEM_VITAL)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
enmgen2_battle_04 = {
  enemyTableName = "enmgen2_04",
  spawnSet = {
    {
      name = "enemy_0401",
      type = "lasercannon_strong",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0402",
      type = "lasercannon",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0403",
      type = "imp",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0404",
      type = "imp_strong",
      locator = "locator_enemy_04"
    },
    {
      name = "enemy_0405",
      type = "imp",
      locator = "locator_enemy_05"
    }
  },
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {"enemy_0401", "enemy_0402"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
enmgen2_battle_05 = {
  enemyTableName = "enmgen2_05",
  spawnSet = {
    {
      name = "enemy_0501",
      type = "terrorist",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0502",
      type = "terrorist_rifle",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0503",
      type = "terrorist_rifle",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0504",
      type = "terrorist_rifle",
      locator = "locator_enemy_04"
    },
    {
      name = "enemy_0505",
      type = "terrorist_rifle",
      locator = "locator_enemy_05"
    },
    {
      name = "enemy_0506",
      type = "stingray",
      locator = "locator_enemy_06"
    },
    {
      name = "enemy_0507",
      type = "stingray",
      locator = "locator_enemy_07"
    },
    {
      name = "enemy_0508",
      type = "terrorist",
      locator = "locator_enemy_08",
      target_vehicle = "enemy_0506"
    },
    {
      name = "enemy_0509",
      type = "terrorist",
      locator = "locator_enemy_09",
      target_vehicle = "enemy_0507"
    }
  },
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {"enemy_0508", "enemy_0509"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_battle_06 = {
  enemyTableName = "enmgen2_06",
  spawnSet = {
    {
      name = "enemy_0601",
      type = "mothership",
      locator = "locator_enemy_01",
      ai_spawn_option = "MotherShip/cm20_MotherShip"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      name = "childship01",
      type = "childship",
      locator = "locator_01"
    }
  },
  onSetupGem = function(A0_16, A1_17)
    Fn_enemyPopGemSetup(A0_16, {"enemy_0601"}, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_18, A1_19)
    Fn_enemyAshPopGem(A0_18, A1_19)
  end
}
BATTLE_TABLE = {
  {
    enemy_tbl = enmgen2_battle_01,
    navi = "locator2_specpoint_01",
    outrange = "pccubesensor2_outrange",
    next_dis = 40,
    retry = "locator2_RetryPoint_01",
    next_cnt = 3
  },
  {
    enemy_tbl = enmgen2_battle_02,
    navi = "locator2_specpoint_02",
    outrange = "pccubesensor2_outrange",
    next_dis = 30,
    retry = "locator2_RetryPoint_02",
    next_cnt = 3
  },
  {
    enemy_tbl = enmgen2_battle_03,
    navi = "locator2_specpoint_03",
    outrange = "pccubesensor2_outrange",
    next_dis = 30,
    retry = "locator2_RetryPoint_03",
    next_cnt = 5
  },
  {
    enemy_tbl = enmgen2_battle_04,
    navi = "locator2_specpoint_04",
    outrange = "pccubesensor2_outrange",
    next_dis = 40,
    retry = "locator2_RetryPoint_04",
    next_cnt = 4
  },
  {
    enemy_tbl = enmgen2_battle_05,
    navi = "locator2_specpoint_05",
    outrange = "pccubesensor2_outrange",
    next_dis = 30,
    retry = "locator2_RetryPoint_05",
    next_cnt = 6
  },
  {
    enemy_tbl = enmgen2_battle_06,
    navi = "locator2_specpoint_06",
    outrange = "pccubesensor2_outrange",
    next_dis = 50,
    retry = "locator2_RetryPoint_06"
  }
}
OUTRANGE_TABLE = {
  "pccubesensor2_outrange_sub"
}
function Initialize()
  local L0_20
  L0_20 = {}
  L0_20.timer = {
    max = EXTEND_MAX_TIME,
    start = START_TIME
  }
  L0_20.score = {start = 0}
  Fn_challengeInitialize(L0_20)
  Fn_setChallengeBattle()
end
function Ingame()
  local L0_21
  L0_21 = {}
  L0_21.timer = true
  L0_21.score = true
  Fn_challengeStart(L0_21, Fn_CountdownSpawnEnemy(), true)
  Fn_runChallengeBattle()
  Fn_challengeFinish()
end
function Finalize()
  Fn_challengeFinalize()
end
