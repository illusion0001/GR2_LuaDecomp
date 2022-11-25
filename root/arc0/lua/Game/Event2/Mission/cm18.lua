dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeBattleCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
SCORE_TABLE = "cm18"
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
  {COUNT = 10, SCORE = 300}
}
EXTEND_TIME = {
  {
    COUNT = 3,
    TIME = {
      0,
      0,
      15,
      0
    }
  },
  {
    COUNT = 6,
    TIME = {
      0,
      0,
      12,
      0
    }
  },
  {
    COUNT = 9,
    TIME = {
      0,
      0,
      10,
      0
    }
  },
  {
    COUNT = 10,
    TIME = {
      0,
      0,
      5,
      0
    }
  }
}
_box_tbl = {}
BOX_RESTORE_PROBABILITY = 60
enmgen2_battle_01 = {
  enemyTableName = "enmgen2_01",
  spawnSet = {
    {
      name = "enemy_0101",
      type = "gellyfish",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0102",
      type = "imp",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0103",
      type = "gellyfish",
      locator = "locator_enemy_03"
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
      type = "imp",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0203",
      type = "gellyfish",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0204",
      type = "imp",
      locator = "locator_enemy_04"
    },
    {
      name = "enemy_0205",
      type = "gellyfish",
      locator = "locator_enemy_05"
    }
  }
}
enmgen2_battle_03 = {
  enemyTableName = "enmgen2_03",
  spawnSet = {
    {
      name = "enemy_0301",
      type = "giant",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0302",
      type = "stalker",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0303",
      type = "imp",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0304",
      type = "gellyfish",
      locator = "locator_enemy_04"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {"enemy_0301"}, 1, GEM_SPECIAL)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end
}
enmgen2_battle_04 = {
  enemyTableName = "enmgen2_04",
  spawnSet = {
    {
      name = "enemy_0401",
      type = "treecannon",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0402",
      type = "stalker",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0403",
      type = "stalker",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0404",
      type = "stalker",
      locator = "locator_enemy_04"
    },
    {
      name = "enemy_0405",
      type = "stalker",
      locator = "locator_enemy_05"
    },
    {
      name = "enemy_0406",
      type = "stalker",
      locator = "locator_enemy_06"
    }
  }
}
enmgen2_battle_05 = {
  enemyTableName = "enmgen2_05",
  spawnSet = {
    {
      name = "enemy_0501",
      type = "guardcore",
      locator = "locator_enemy_01"
    },
    {
      name = "enemy_0502",
      type = "gellyfish",
      locator = "locator_enemy_02"
    },
    {
      name = "enemy_0503",
      type = "gellyfish",
      locator = "locator_enemy_03"
    },
    {
      name = "enemy_0504",
      type = "gellyfish",
      locator = "locator_enemy_04"
    }
  },
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"enemy_0501"}, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_6, A1_7)
    Fn_enemyAshPopGem(A0_6, A1_7)
  end
}
BATTLE_TABLE = {
  {
    enemy_tbl = enmgen2_battle_01,
    navi = "locator2_specpoint_01",
    outrange = "pccubesensor2_outrange",
    next_dis = 30,
    retry = "locator2_RetryPoint_01",
    next_cnt = 2
  },
  {
    enemy_tbl = enmgen2_battle_02,
    navi = "locator2_specpoint_02",
    outrange = "pccubesensor2_outrange",
    next_dis = 20,
    retry = "locator2_RetryPoint_02",
    next_cnt = 4
  },
  {
    enemy_tbl = enmgen2_battle_03,
    navi = "locator2_specpoint_03",
    outrange = "pccubesensor2_outrange",
    next_dis = 25,
    retry = "locator2_RetryPoint_03",
    next_cnt = 3
  },
  {
    enemy_tbl = enmgen2_battle_04,
    navi = "locator2_specpoint_04",
    outrange = "pccubesensor2_outrange",
    next_dis = 25,
    retry = "locator2_RetryPoint_04",
    next_cnt = 2
  },
  {
    enemy_tbl = enmgen2_battle_05,
    navi = "locator2_specpoint_05",
    outrange = "pccubesensor2_outrange",
    next_dis = 20,
    retry = "locator2_RetryPoint_05",
    next_cnt = 3
  }
}
OUTRANGE_TABLE = {
  "pccubesensor2_outrange_sub"
}
function Initialize()
  local L0_8, L1_9, L2_10, L3_11, L4_12
  L0_8 = {}
  L1_9 = {}
  L2_10 = EXTEND_MAX_TIME
  L1_9.max = L2_10
  L2_10 = START_TIME
  L1_9.start = L2_10
  L0_8.timer = L1_9
  L1_9 = {}
  L1_9.start = 0
  L0_8.score = L1_9
  L1_9 = Fn_challengeInitialize
  L2_10 = L0_8
  L1_9(L2_10)
  L1_9 = GameDatabase
  L2_10 = L1_9
  L1_9 = L1_9.set
  L3_11 = ggd
  L3_11 = L3_11.GlobalSystemFlags__GaugeCoercion
  L4_12 = true
  L1_9(L2_10, L3_11, L4_12)
  L1_9 = Fn_setChallengeBattle
  L1_9()
  L1_9 = 1
  while true do
    L2_10 = 1
    L3_11 = nil
    while true do
      L4_12 = "bg2_dummy_"
      L4_12 = L4_12 .. string.format("%02d", L1_9) .. "_" .. string.format("%02d", L2_10)
      L3_11 = findGameObject2("GimmickBg", L4_12)
      if L3_11 ~= nil then
        if _box_tbl[L1_9] == nil then
          _box_tbl[L1_9] = {}
        end
        _box_tbl[L1_9][L2_10] = {
          name = L3_11:getName(),
          hdl = L3_11
        }
        L2_10 = L2_10 + 1
      end
    end
    if not (L2_10 <= 1) then
      L4_12 = _box_tbl
      L4_12 = L4_12[L1_9]
      L4_12.num = L2_10 - 1
      L4_12 = _box_tbl
      L4_12 = L4_12[L1_9]
      L4_12.nummax = L2_10 - 1
      L4_12 = _box_tbl
      L4_12 = L4_12[L1_9]
      L4_12.restorenum = math.floor(_box_tbl[L1_9].nummax / 100 * BOX_RESTORE_PROBABILITY)
      L4_12 = print
      L4_12("group.." .. L1_9 .. "..\230\156\168\231\174\177\227\129\174\230\149\176:" .. _box_tbl[L1_9].num .. "..\229\190\169\230\180\187\230\149\176" .. _box_tbl[L1_9].restorenum)
      L1_9 = L1_9 + 1
    end
  end
end
function Ingame()
  local L0_13
  L0_13 = check_box_broken
  L0_13()
  L0_13 = {}
  L0_13.timer = true
  L0_13.score = true
  Fn_challengeStart(L0_13, Fn_CountdownSpawnEnemy(), true)
  Fn_runChallengeBattle()
  if check_box_broken_task ~= nil then
    check_box_broken_task:abort()
    check_box_broken_task = nil
  end
  Fn_challengeFinish()
end
function check_box_broken()
end
function respawn_res_box(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  for L4_18, _FORV_5_ in L1_15(L2_16) do
    if _FORV_5_.hdl:isBroken() then
      print("RequestRestore " .. L4_18)
      _FORV_5_.hdl:requestRestoreForce()
      _box_tbl[A0_14].num = _box_tbl[A0_14].num + 1
    end
  end
end
function Finalize()
  Fn_challengeFinalize()
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, false)
end
