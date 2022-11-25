dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/ChallengeBattleCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
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
      type = "mechsmall",
      locator = "locator_enemy_0101"
    },
    {
      name = "enemy_0107",
      type = "officer_rifle",
      locator = "locator_enemy_0101",
      target_vehicle = "enemy_0101"
    },
    {
      name = "enemy_0102",
      type = "soldier_rifle",
      locator = "locator_enemy_0102"
    },
    {
      name = "enemy_0103",
      type = "soldier_launcher",
      locator = "locator_enemy_0103"
    },
    {
      name = "enemy_0104",
      type = "soldier_rifle",
      locator = "locator_enemy_0104"
    },
    {
      name = "enemy_0105",
      type = "soldier_rifle",
      locator = "locator_enemy_0105"
    },
    {
      name = "enemy_0106",
      type = "soldier_rifle",
      locator = "locator_enemy_0106"
    }
  },
  onSetupGem = function(A0_0, A1_1)
    Fn_enemyPopGemSetup(A0_0, {"enemy_0101", "enemy_0102"}, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_2, A1_3)
    Fn_enemyAshPopGem(A0_2, A1_3)
  end
}
enmgen2_battle_02 = {
  enemyTableName = "enmgen2_02",
  spawnSet = {
    {
      name = "landingship_0201",
      type = "landingship",
      locator = "locator_landingship_0201"
    },
    {
      name = "landingship_0202",
      type = "landingship",
      locator = "locator_landingship_0202"
    },
    {
      name = "enemy_0201",
      type = "soldier_rifle",
      locator = "locator_landingship_0201",
      target_vehicle = "landingship_0201"
    },
    {
      name = "enemy_0202",
      type = "soldier_rifle",
      locator = "locator_landingship_0201",
      target_vehicle = "landingship_0201"
    },
    {
      name = "enemy_0203",
      type = "soldier_rifle",
      locator = "locator_landingship_0201",
      target_vehicle = "landingship_0201"
    },
    {
      name = "enemy_0204",
      type = "soldier_rifle",
      locator = "locator_landingship_0201",
      target_vehicle = "landingship_0201"
    },
    {
      name = "enemy_0205",
      type = "soldier_launcher",
      locator = "locator_landingship_0202",
      target_vehicle = "landingship_0202"
    },
    {
      name = "enemy_0206",
      type = "soldier_rifle",
      locator = "locator_landingship_0202",
      target_vehicle = "landingship_0202"
    },
    {
      name = "enemy_0207",
      type = "soldier_rifle",
      locator = "locator_landingship_0202",
      target_vehicle = "landingship_0202"
    },
    {
      name = "enemy_0208",
      type = "soldier_rifle",
      locator = "locator_landingship_0202",
      target_vehicle = "landingship_0202"
    },
    {
      name = "enemy_0209",
      type = "mechsky",
      locator = "locator_enemy_0209"
    },
    {
      name = "enemy_0210",
      type = "soldier_rifle",
      locator = "locator_enemy_0209",
      target_vehicle = "enemy_0209"
    }
  }
}
enmgen2_battle_03 = {
  enemyTableName = "enmgen2_03",
  spawnSet = {
    {
      name = "enemy_0301",
      type = "mechsmall",
      locator = "locator_enemy_0301"
    },
    {
      name = "enemy_0302",
      type = "mechsky",
      locator = "locator_enemy_0302"
    },
    {
      name = "enemy_0303",
      type = "mechsky",
      locator = "locator_enemy_0303"
    },
    {
      name = "enemy_0304",
      type = "officer_rifle",
      locator = "locator_enemy_0301",
      target_vehicle = "enemy_0301"
    },
    {
      name = "enemy_0305",
      type = "soldier_rifle",
      locator = "locator_enemy_0302",
      target_vehicle = "enemy_0302"
    },
    {
      name = "enemy_0306",
      type = "soldier_rifle",
      locator = "locator_enemy_0303",
      target_vehicle = "enemy_0303"
    }
  },
  onSetupGem = function(A0_4, A1_5)
    Fn_enemyPopGemSetup(A0_4, {"enemy_0301"}, 1, GEM_VITAL)
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
      type = "soldier_rifle",
      locator = "locator_enemy_0401"
    },
    {
      name = "enemy_0402",
      type = "soldier_rifle",
      locator = "locator_enemy_0402"
    },
    {
      name = "enemy_0403",
      type = "soldier_rifle",
      locator = "locator_enemy_0403"
    },
    {
      name = "enemy_0404",
      type = "soldier_rifle",
      locator = "locator_enemy_0404"
    },
    {
      name = "enemy_0405",
      type = "soldier_rifle",
      locator = "locator_enemy_0405"
    },
    {
      name = "enemy_0406",
      type = "soldier_launcher",
      locator = "locator_enemy_0406"
    }
  },
  onSetupGem = function(A0_8, A1_9)
    Fn_enemyPopGemSetup(A0_8, {
      "enemy_0401",
      "enemy_0402",
      "enemy_0403",
      "enemy_0404",
      "enemy_0405",
      "enemy_0406"
    }, 4, GEM_VITAL)
  end,
  onPopGem = function(A0_10, A1_11)
    Fn_enemyAshPopGem(A0_10, A1_11)
  end
}
enmgen2_battle_05 = {
  enemyTableName = "enmgen2_05",
  spawnSet = {
    {
      name = "landingship_0501",
      type = "landingship",
      locator = "locator_landingship_0501"
    },
    {
      name = "enemy_mechbig",
      type = "mechbig",
      locator = "locator_landingship_0501",
      target_vehicle = "landingship_0501"
    },
    {
      name = "enemy_0501",
      type = "mechsmall",
      locator = "locator_enemy_0501"
    },
    {
      name = "enemy_0502",
      type = "officer_rifle",
      locator = "locator_enemy_0502",
      target_vehicle = "enemy_0501"
    },
    {
      name = "enemy_0503",
      type = "soldier_launcher",
      locator = "locator_enemy_0503"
    },
    {
      name = "enemy_0504",
      type = "mechsky",
      locator = "locator_enemy_0504"
    },
    {
      name = "enemy_0505",
      type = "mechsky",
      locator = "locator_enemy_0505"
    },
    {
      name = "enemy_0509",
      type = "soldier_rifle",
      locator = "locator_enemy_0504",
      target_vehicle = "enemy_0504"
    },
    {
      name = "enemy_0510",
      type = "soldier_rifle",
      locator = "locator_enemy_0505",
      target_vehicle = "enemy_0505"
    },
    {
      name = "enemy_0506",
      type = "soldier_rifle",
      locator = "locator_enemy_0506"
    },
    {
      name = "enemy_0507",
      type = "soldier_rifle",
      locator = "locator_enemy_0507"
    },
    {
      name = "enemy_0508",
      type = "soldier_rifle",
      locator = "locator_enemy_0508"
    }
  },
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {"enemy_0501"}, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
BATTLE_TABLE = {
  {
    enemy_tbl = enmgen2_battle_01,
    navi = "locator2_specpoint_01",
    outrange = "pccubesensor2_outrange",
    next_dis = 50,
    retry = "locator2_RetryPoint_01",
    next_cnt = 6
  },
  {
    enemy_tbl = enmgen2_battle_02,
    navi = "locator2_specpoint_02",
    outrange = "pccubesensor2_outrange",
    next_dis = 50,
    retry = "locator2_RetryPoint_02",
    next_cnt = 8
  },
  {
    enemy_tbl = enmgen2_battle_03,
    navi = "locator2_specpoint_03",
    outrange = "pccubesensor2_outrange",
    next_dis = 40,
    retry = "locator2_RetryPoint_03",
    next_cnt = 4
  },
  {
    enemy_tbl = enmgen2_battle_04,
    navi = "locator2_specpoint_04",
    outrange = "pccubesensor2_outrange",
    next_dis = 40,
    retry = "locator2_RetryPoint_04",
    next_cnt = 5
  },
  {
    enemy_tbl = enmgen2_battle_05,
    navi = "locator2_specpoint_05",
    outrange = "pccubesensor2_outrange",
    next_dis = 60,
    retry = "locator2_RetryPoint_05",
    next_cnt = 11
  }
}
OUTRANGE_TABLE = {
  "pccubesensor2_outrange_sub"
}
_landingship_task = {}
function Initialize()
  local L0_16
  L0_16 = {}
  L0_16.timer = {
    max = EXTEND_MAX_TIME,
    start = START_TIME
  }
  L0_16.score = {start = 0}
  Fn_challengeInitialize(L0_16)
  Fn_setChallengeBattle()
end
function Ingame()
  local L0_17
  L0_17 = {}
  L0_17.timer = true
  L0_17.score = true
  Fn_challengeStart(L0_17, Fn_CountdownSpawnEnemy(), true)
  _landingship_task[1] = Landship0201Task()
  _landingship_task[2] = Landship0202Task()
  _landingship_task[3] = Landship0501Task()
  Fn_runChallengeBattle()
  for _FORV_4_, _FORV_5_ in ipairs(_landingship_task) do
    if _FORV_5_ ~= nil and _FORV_5_:isRunning() == true then
      _FORV_5_:abort()
    end
  end
  _landingship_task = {}
  Fn_challengeFinish()
end
function Finalize()
  for _FORV_3_, _FORV_4_ in ipairs(_landingship_task) do
    if _FORV_4_ ~= nil and _FORV_4_:isRunning() == true then
      _FORV_4_:abort()
    end
  end
  _landingship_task = {}
  Fn_challengeFinalize()
end
function Landship0201Task()
  return invokeTask(function()
    local L0_18, L1_19
    L0_18 = 0
    while true do
      L1_19 = _battle_phase
      if L1_19 == 2 then
        function L1_19(A0_20)
          local L1_21
          L1_21 = A0_20.state
          if L1_21 == "wait" then
            L1_21 = L0_18
            if L1_21 == 0 then
              A0_20.changeState = "move"
              L1_21 = {
                "locator2_landingship_0201_route01"
              }
              A0_20.movePoint = L1_21
            else
              L1_21 = L0_18
              if L1_21 == 1 then
                A0_20.changeState = "move"
                L1_21 = {
                  "locator2_landingship_0201_route02",
                  "locator2_landingship_0201_route03"
                }
                A0_20.movePoint = L1_21
              end
            end
          end
          L1_21 = A0_20.state
          if L1_21 == "moveEnd" then
            L1_21 = L0_18
            if L1_21 == 0 then
              A0_20.changeState = "open"
            else
              L1_21 = L0_18
              if L1_21 == 1 then
                L1_21 = 2
                L0_18 = L1_21
              end
            end
          end
          L1_21 = A0_20.state
          if L1_21 == "openEnd" then
            L1_21 = 1
            L0_18 = L1_21
          end
          return A0_20
        end
        if findGameObject2("Puppet", "landingship_0201") ~= nil and findGameObject2("Puppet", "landingship_0201"):getBrain() ~= nil then
          findGameObject2("Puppet", "landingship_0201"):getBrain():setEventListener("enemy_landingship_event", L1_19)
        end
      else
        L0_18 = 0
      end
      L1_19 = wait
      L1_19()
    end
  end)
end
function Landship0202Task()
  return invokeTask(function()
    local L0_22, L1_23, L2_24
    L0_22 = 0
    L1_23 = nil
    while true do
      L2_24 = _battle_phase
      if L2_24 == 2 then
        function L2_24(A0_25)
          if A0_25.state == "wait" then
            if L0_22 == 0 then
              A0_25.changeState = "move"
              A0_25.movePoint = {
                "locator2_landingship_0202_route01"
              }
            elseif L0_22 == 1 then
              A0_25.changeState = "move"
              A0_25.movePoint = {
                "locator2_landingship_0202_route02",
                "locator2_landingship_0202_route03"
              }
            end
          end
          if A0_25.state == "moveEnd" then
            if L0_22 == 0 then
              if L1_23 == nil then
                L1_23 = invokeTask(function()
                  waitSeconds(1)
                end)
              elseif L1_23:isRunning() == false then
                A0_25.changeState = "open"
                L1_23 = nil
              end
            elseif L0_22 == 1 then
              L0_22 = 2
            end
          end
          if A0_25.state == "openEnd" then
            L0_22 = 1
          end
          return A0_25
        end
        if findGameObject2("Puppet", "landingship_0202") ~= nil and findGameObject2("Puppet", "landingship_0202"):getBrain() ~= nil then
          findGameObject2("Puppet", "landingship_0202"):getBrain():setEventListener("enemy_landingship_event", L2_24)
        end
      else
        L0_22 = 0
      end
      L2_24 = wait
      L2_24()
    end
  end)
end
function Landship0501Task()
  return invokeTask(function()
    local L0_26, L1_27
    L0_26 = 0
    while true do
      L1_27 = _battle_phase
      if L1_27 == 5 then
        function L1_27(A0_28)
          local L1_29
          L1_29 = A0_28.state
          if L1_29 == "wait" then
            L1_29 = L0_26
            if L1_29 == 0 then
              A0_28.changeState = "move"
              L1_29 = {
                "locator2_landingship_0501_route01"
              }
              A0_28.movePoint = L1_29
            else
              L1_29 = L0_26
              if L1_29 == 1 then
                A0_28.changeState = "move"
                L1_29 = {
                  "locator2_landingship_0501_route02"
                }
                A0_28.movePoint = L1_29
              end
            end
          end
          L1_29 = A0_28.state
          if L1_29 == "moveEnd" then
            L1_29 = L0_26
            if L1_29 == 0 then
              A0_28.changeState = "drop"
              L1_29 = {
                "enemy_mechbig"
              }
              A0_28.dropEnemy = L1_29
            else
              L1_29 = L0_26
              if L1_29 == 1 then
                L1_29 = 2
                L0_26 = L1_29
              end
            end
          end
          L1_29 = A0_28.state
          if L1_29 == "dropEnd" then
            L1_29 = 1
            L0_26 = L1_29
          end
          return A0_28
        end
        if findGameObject2("Puppet", "landingship_0501") ~= nil and findGameObject2("Puppet", "landingship_0501"):getBrain() ~= nil then
          findGameObject2("Puppet", "landingship_0501"):getBrain():setEventListener("enemy_landingship_event", L1_27)
        end
      else
        L0_26 = 0
      end
      L1_27 = wait
      L1_27()
    end
  end)
end
