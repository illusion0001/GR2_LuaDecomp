dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeBattleCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
SCORE_TABLE = ""
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
  {COUNT = 3, SCORE = 150},
  {COUNT = 6, SCORE = 200},
  {COUNT = 9, SCORE = 200},
  {COUNT = 12, SCORE = 250},
  {COUNT = 13, SCORE = 250}
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
      name = "ene_01_01",
      type = "stalker",
      locator = "locator_stalker_01",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    },
    {
      name = "ene_01_02",
      type = "stalker",
      locator = "locator_stalker_02"
    },
    {
      name = "ene_01_03",
      type = "stalker",
      locator = "locator_stalker_03"
    },
    {
      name = "ene_01_04",
      type = "stalker",
      locator = "locator_stalker_04",
      ai_spawn_option = "Stalker/Stalker_WildStay"
    },
    {
      name = "ene_01_05",
      type = "gellyfish",
      locator = "locator_gellyfish_01"
    },
    {
      name = "ene_01_06",
      type = "gellyfish",
      locator = "locator_gellyfish_02"
    },
    {
      name = "ene_01_07",
      type = "gellyfish",
      locator = "locator_gellyfish_03"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {
      "ene_01_01",
      "ene_01_02",
      "ene_01_03",
      "ene_01_04"
    }, 3, GEM_VITAL)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end
}
enmgen2_battle_02 = {
  enemyTableName = "enmgen2_02",
  spawnSet = {
    {
      name = "ene_02_01",
      type = "imp",
      locator = "locator_imp_01"
    },
    {
      name = "ene_02_02",
      type = "treecannon",
      locator = "locator_treecannon_01"
    },
    {
      name = "ene_02_03",
      type = "treecannon",
      locator = "locator_treecannon_02"
    }
  }
}
enmgen2_battle_03 = {
  enemyTableName = "enmgen2_03",
  spawnSet = {
    {
      name = "ene_03_01",
      type = "runner",
      locator = "locator_runner_01"
    },
    {
      name = "ene_03_02",
      type = "runner",
      locator = "locator_runner_02"
    },
    {
      name = "ene_03_03",
      type = "guardcore",
      locator = "locator_guardcore_01"
    },
    {
      name = "ene_03_04",
      type = "stalker",
      locator = "locator_stalker_01"
    },
    {
      name = "ene_03_05",
      type = "stalker",
      locator = "locator_stalker_02"
    },
    {
      name = "ene_03_06",
      type = "stalker",
      locator = "locator_stalker_03"
    },
    {
      name = "ene_03_07",
      type = "stalker",
      locator = "locator_stalker_04"
    },
    {
      name = "ene_03_08",
      type = "stalker",
      locator = "locator_stalker_05"
    }
  }
}
enmgen2_battle_04 = {
  enemyTableName = "enmgen2_04",
  spawnSet = {
    {
      name = "ene_04_01",
      type = "giant",
      locator = "locator_giant_01"
    },
    {
      name = "ene_04_02",
      type = "giant",
      locator = "locator_giant_02"
    },
    {
      name = "ene_02_02",
      type = "treecannon",
      locator = "locator_treecannon_01"
    }
  },
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"ene_04_01", "ene_04_02"}, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
enmgen2_battle_05 = {
  enemyTableName = "enmgen2_05",
  spawnSet = {
    {
      name = "ene_05_01",
      type = "guardcore",
      locator = "locator_guardcore_01"
    },
    {
      name = "ene_05_02",
      type = "imp",
      locator = "locator_imp_01"
    },
    {
      name = "ene_05_03",
      type = "imp",
      locator = "locator_imp_02"
    },
    {
      name = "ene_05_04",
      type = "imp",
      locator = "locator_imp_03"
    }
  }
}
BATTLE_TABLE = {
  {
    enemy_tbl = enmgen2_battle_01,
    navi = "locator2_specpoint_01",
    outrange = "pccubesensor2_outrange_01",
    next_dis = 20,
    retry = "locator2_RetryPoint_01",
    next_cnt = 5
  },
  {
    enemy_tbl = enmgen2_battle_02,
    navi = "locator2_specpoint_02",
    outrange = "pccubesensor2_outrange_02",
    next_dis = 30,
    retry = "locator2_RetryPoint_02",
    next_cnt = 3
  },
  {
    enemy_tbl = enmgen2_battle_03,
    navi = "locator2_specpoint_03",
    outrange = "pccubesensor2_outrange_03",
    next_dis = 25,
    retry = "locator2_RetryPoint_03",
    next_cnt = 7
  },
  {
    enemy_tbl = enmgen2_battle_04,
    navi = "locator2_specpoint_04",
    outrange = "pccubesensor2_outrange_04",
    next_dis = 40,
    retry = "locator2_RetryPoint_04",
    next_cnt = 2
  },
  {
    enemy_tbl = enmgen2_battle_05,
    navi = "locator2_specpoint_05",
    outrange = "pccubesensor2_outrange_05",
    next_dis = 30,
    retry = "locator2_RetryPoint_05",
    next_cnt = 3
  }
}
OUTRANGE_TABLE = {
  "pccubesensor2_outrange_po_a_01"
}
function Initialize()
  local L0_8
  L0_8 = {}
  L0_8.timer = {
    max = EXTEND_MAX_TIME,
    start = START_TIME
  }
  L0_8.score = {start = 0}
  Fn_challengeInitialize(L0_8)
  Fn_setChallengeBattle()
end
function Ingame()
  local L0_9
  L0_9 = Fn_warpArea
  L0_9("po_a_15", "locator2_po_a_15")
  L0_9 = {}
  L0_9.timer = true
  L0_9.score = true
  Fn_challengeStart(L0_9, Fn_CountdownSpawnEnemy(), true)
  Fn_runChallengeBattle()
  Fn_challengeFinish()
end
function Finalize()
  Fn_challengeFinalize()
end
