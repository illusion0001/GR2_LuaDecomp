import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep17_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_TIME_TO_NEXT = 60
_AUJEAN_ROUTE_COUNT = 6
_AUJ_DISTANCE = 15
_EUG_DISTANCE = 15
_GAMEOVER_NEAR_GRIGO_CNT = 4
ENEMY_NEAR_JUDGE_DIST = 5
_GRIGO_MAX_CNT = 20
_POLICE_MAX_CNT = 20
_PEOPLE_MAX_CNT = 5
_GRIGO_ORUDO_MAX_CNT = 20
_POLICE_ORUDO_MAX_CNT = 20
_PEOPLE_ORUDO_MAX_CNT = 5
_enmgen_movie = nil
_movie_bot_died = false
_movie_bot_panic_task = nil
_ep17_00210k_done = false
_house_arrived = false
_puppet_tbl = {}
_swich_num = nil
_now_far_area = false
_aujean_call_flag = false
_timeLimit = 0
_sdemo = nil
_sdemo_cut02 = nil
_infinity_task = {}
_check_gameover_task = nil
_check_mob_panic_task = nil
_remove_far_enemy_task = nil
_gameover = false
_target_malti_navi = {}
_mnavi_hdl = {}
_isPanic = false
_enm_ash = false
_ash_enemy_name = nil
_start_cap_task = nil
_area_num = 1
enmgen2_movie_bot = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_movie_bot_01",
      name = "movie_bot_01",
      ai_spawn_option = "Grigo/ep17a_grigo"
    }
  },
  onSpawn = function(A0_0, A1_1)
  end,
  onObjectDead = function(A0_2, A1_3)
    _movie_bot_died = true
  end,
  onObjectAsh = function(A0_4, A1_5)
    _enm_ash = true
    _ash_enemy_name = A1_5:getName()
    print("Ash: ", _ash_enemy_name)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_6)
    return #A0_6.spawnSet
  end,
  getEnemyDeadNum = function(A0_7)
    local L1_8
    L1_8 = A0_7.enemyDeadNum
    return L1_8
  end,
  getEnemyName = function(A0_9, A1_10)
    local L2_11
    L2_11 = A0_9.spawnSet
    L2_11 = L2_11[A1_10]
    L2_11 = L2_11.name
    return L2_11
  end
}
enmgen2_mob_to_enemy_01 = {
  mobToEnemyFlag = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_01",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_02",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_03",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_04",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_05",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_06",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_07",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_08",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_09",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_10",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_11",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_12",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_13",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_14",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_15",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_16",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_17",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_18",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_19",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_20",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_01",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_02",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_03",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_04",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_05",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_06",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_07",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_08",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_09",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_10",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_11",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_12",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_13",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_14",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_15",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_16",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_17",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_18",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_19",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_20",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_01",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_02",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_03",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_04",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_05",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    print("*************\231\181\130\227\130\143\227\129\163\227\129\159")
  end,
  onSpawn = function(A0_17, A1_18)
  end,
  onObjectAsh = function(A0_19, A1_20)
    _enm_ash = true
    _ash_enemy_name = A1_20:getName()
    print("Ash: ", _ash_enemy_name)
  end,
  onObjectDead = function(A0_21, A1_22)
    print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140onObjectDead\227\129\160\227\130\136\239\188\129\239\188\129\239\188\129\239\188\129")
  end
}
enmgen2_mob_to_enemy_ordo_01 = {
  mobToEnemyFlag = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_01",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_02",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_03",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_04",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_05",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_06",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_07",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_08",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_09",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_10",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_11",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_12",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_13",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_14",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_15",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_16",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_17",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_18",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_19",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_orudo_20",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_01",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_02",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_03",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_04",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_05",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_06",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_07",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_08",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_09",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_10",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_11",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_12",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_13",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_14",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_15",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_16",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_17",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_18",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_19",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_orudo_20",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_orudo_01",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_orudo_02",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_orudo_03",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_orudo_04",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_orudo_05",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    }
  },
  onUpdate = function(A0_23)
    local L1_24
  end,
  onEnter = function(A0_25)
    local L1_26
  end,
  onLeave = function(A0_27)
    print("*************\231\181\130\227\130\143\227\129\163\227\129\159")
  end,
  onSpawn = function(A0_28, A1_29)
  end,
  onObjectAsh = function(A0_30, A1_31)
    _enm_ash = true
  end,
  onObjectDead = function(A0_32, A1_33)
    print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140onObjectDead\227\129\160\227\130\136\239\188\129\239\188\129\239\188\129\239\188\129")
  end
}
enmgen2_mob_to_enemy_pre_01 = {
  mobToEnemyFlag = true,
  spawnSet = {
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_01",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_02",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_03",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_04",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_05",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_06",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_07",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_08",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_09",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_10",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_11",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_12",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_13",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_14",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_15",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_16",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_17",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_18",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_19",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "grigo",
      locator = "locator_01",
      name = "grigo_pre_20",
      ai_spawn_option = "Grigo/ep17a_grigo"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_01",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_02",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_03",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_04",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_05",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_06",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_07",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_08",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_09",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_10",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_11",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_12",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_13",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_14",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_15",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_16",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_17",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_18",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_19",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "police",
      locator = "locator_01",
      name = "police_pre_20",
      ai_spawn_option = "Police/ep17a_police"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_pre_01",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_pre_02",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "people_pre_03",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_pre_04",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
    },
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "people_pre_05",
      ai_spawn_option = "Gorotuki/ep17a_gorotuki"
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
  onSpawn = function(A0_40, A1_41)
  end,
  onObjectAsh = function(A0_42, A1_43)
    _enm_ash = true
  end,
  onObjectDead = function(A0_44, A1_45)
  end
}
function Initialize()
  local L0_46
  _npc_aujean = "npcgen2_aujean_01"
  _npc_eugie = "npcgen2_eugie_01"
  L0_46 = {
    {
      name = "npcgen2_bit_01",
      type = "bit02",
      node = "locator2_bit_a_01"
    }
  }
  Fn_setupNpc(L0_46)
  for _FORV_4_, _FORV_5_ in pairs(L0_46) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo = SDemo.create("ep17_a")
  _sdemo_cut02 = SDemo.create("ep17_a_cut02")
  setGameOver(false)
  print("_gameover =", _gameover)
end
function Ingame()
  local L0_47
  while true do
    L0_47 = Vehicle
    L0_47 = L0_47.isReady
    L0_47 = L0_47(L0_47)
    if not L0_47 then
      L0_47 = wait
      L0_47()
      L0_47 = print
      L0_47("Viecle\229\190\133\227\129\161")
    end
  end
  L0_47 = print
  L0_47("\226\152\133Viecle\229\190\133\227\129\161\231\181\130\228\186\134\239\188\129\239\188\129")
  L0_47 = Mob
  L0_47 = L0_47.makeSituationPanic
  L0_47(L0_47, false)
  _isPanic = false
  L0_47 = Mob
  L0_47 = L0_47.topUpHatchery
  L0_47(L0_47)
  L0_47 = Fn_setCatWarpCheckPoint
  L0_47("locator2_pc_start_pos")
  L0_47 = anoterCatWarp
  L0_47()
  L0_47 = Fn_setNpcActive
  L0_47("npcgen2_bit_01", false)
  L0_47 = Player
  L0_47 = L0_47.setStay
  L0_47(L0_47, false)
  function L0_47(A0_48)
    local L1_49, L2_50
    L1_49 = A0_48.name
    L2_50 = A0_48.attacker
    print(L1_49 .. "\227\129\140" .. L2_50 .. "\227\129\171\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159 getHealth\239\188\154", findGameObject2("EnemyBrain", L1_49):getHealth())
    if findGameObject2("EnemyBrain", L1_49):getHealth() <= 0 and L2_50 == "player" and (string.find(L1_49, "police") ~= nil or string.find(L1_49, "people") ~= nil or string.find(L1_49, "grigo") ~= nil) and not isGameOver() then
      invokeTask(function()
        setGameOver(true)
        _start_cap_task = Mv_safeTaskAbort(_start_cap_task)
        Fn_captionViewEnd()
        Fn_captionViewWait("ep17_00107")
        Fn_scriptGameOver(true)
        print("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\229\135\166\231\144\134\239\188\154_gameover = ", _gameover)
        Mob:makeSituationPanic(false)
        _isPanic = false
        Mob:topUpHatchery()
        print("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\231\155\180\229\190\140\239\188\154\227\131\145\227\131\139\227\131\131\227\130\175\232\167\163\233\153\164\239\188\134\227\131\162\227\131\150\229\190\169\230\180\187")
      end)
    end
    return A0_48
  end
  findGameObject2("EnemyGenerator", "enmgen2_mob_to_enemy_01"):setEventListener("DamageEnemyReport", L0_47)
  findGameObject2("EnemyGenerator", "enmgen2_mob_to_enemy_ordo_01"):setEventListener("DamageEnemyReport", L0_47)
  findGameObject2("EnemyGenerator", "enmgen2_mob_to_enemy_pre_01"):setEventListener("DamageEnemyReport", L0_47)
  start_game_obj()
  _enmgen_movie = findGameObject2("EnemyGenerator", "enmgen2_movie_bot")
  _enmgen_movie:setEnemyMarker(false)
  print("\226\152\133Fn_missionStart\229\137\141\239\188\129\239\188\129\239\188\129\239\188\129")
  Fn_missionStart()
  print("\226\152\133Fn_missionStart\229\190\140\239\188\129\239\188\129\239\188\129\239\188\129")
  Fn_userCtrlOn()
  _movie_bot_panic_task = invokeTask(function()
    while true do
      if Fn_getDistanceToPlayer(findGameObject2("Node", "movie_bot_01")) < 5 and not _isPanic then
        print("\227\131\160\227\131\188\227\131\147\227\131\188\227\130\176\227\131\170\227\130\179\230\142\165\232\191\145\227\129\167\227\131\145\227\131\139\227\131\131\227\130\175")
        Mob:makeSituationPanic(true)
        Sound:pulse("ep13_announcement1")
        _isPanic = true
      end
      wait()
    end
  end)
  checkGameOverGrigo()
  removeFarEnemy(50)
  checkMobPanic(5, 29)
  checkEnemyMarker()
  _house_arrived = false
  if _ep17_00210k_done then
    Fn_pcSensorOff("pccubesensor2_01")
    Fn_pcSensorOff("pccubesensor2_02")
    Fn_pcSensorOff("pccubesensor2_04")
    Fn_disappearNpc("aujean_01", 0)
    Fn_disappearNpc("eugie_01", 0)
  else
    Fn_pcSensorOn("pccubesensor2_01")
    Fn_pcSensorOn("pccubesensor2_02")
    Fn_pcSensorOn("pccubesensor2_04")
    Fn_missionViewWait("ep17_00100")
  end
  _start_cap_task = invokeTask(function()
    if not isGameOver() then
      Fn_captionViewWait("ep17_00101")
      waitSeconds(3)
      Fn_captionViewWait("ep17_00102")
    end
  end)
  _timeLimit = _TIME_TO_NEXT
  while not _house_arrived do
    _timeLimit = _timeLimit - 1
    if (0 > _timeLimit or _ep17_00210k_done or _now_far_area) and not isGameOver() then
      subNavi(Fn_findNpcPuppet(_npc_aujean))
      Fn_kaiwaDemoView("ep17_00215k")
      waitSeconds(1)
      addNavi(findGameObject2("Node", "locator2_navi_pipehouse_01"))
      Fn_missionViewWait("ep17_00103")
      break
    end
    waitSeconds(1)
    wait()
  end
  while not _house_arrived do
    wait()
  end
  Fn_naviKill()
  maltiNaviAllDelete()
  for _FORV_7_, _FORV_8_ in pairs(_infinity_task) do
    _infinity_task[_FORV_7_] = Mv_safeTaskAbort(_infinity_task[_FORV_7_])
  end
  Fn_killChangeMob()
  _check_gameover_task = Mv_safeTaskAbort(_check_gameover_task)
  _check_mob_panic_task = Mv_safeTaskAbort(_check_mob_panic_task)
  _remove_far_enemy_task = Mv_safeTaskAbort(_remove_far_enemy_task)
  Fn_setCatWarpCheckPoint("locator2_sdemo_pc_01")
  bitAction()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_51, L1_52
end
function pccubesensor2_aujean_OnEnter(A0_53)
  local L1_54
  L1_54 = aujeanSensorOff
  L1_54()
  L1_54 = A0_53.getName
  L1_54 = L1_54(A0_53)
  _swich_num = tonumber(string.sub(L1_54, -1))
  aujeanAction(_swich_num)
end
function pccubesensor2_pipehouse_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_pipehouse_01")
  _house_arrived = true
  maltiNaviAllDelete()
end
function pccubesensor2_dt_area_a_01_OnEnter()
  _area_num = 1
  Fn_createChangeMobToEnemy("enmgen2_mob_to_enemy_01", {
    grigo = true,
    range = 30,
    time = 0.5,
    degree = 90
  })
  print("DT\227\129\174\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\233\150\139\229\167\139")
end
function pccubesensor2_dt_area_a_01_OnLeave()
  Mob:makeSituationPanic(false)
  Sound:pulse("ep13_announcement2")
  _isPanic = false
  print("DT\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\233\155\162\227\130\140\227\129\166\227\128\129\227\131\145\227\131\139\227\131\131\227\130\175\232\167\163\233\153\164")
  Mob:topUpHatchery()
  print("\227\131\162\227\131\150\229\190\169\230\180\187")
  _movie_bot_panic_task = Mv_safeTaskAbort(_movie_bot_panic_task)
  _enmgen_movie:requestAllEnemyKill()
  _movie_bot_died = true
  Fn_killChangeMob()
end
function pccubesensor2_orudo_area_a_01_OnEnter()
  _area_num = 2
  Fn_createChangeMobToEnemy("enmgen2_mob_to_enemy_ordo_01", {
    grigo = true,
    range = 30,
    time = 0.5,
    degree = 90
  })
  print("\227\130\170\227\131\171\227\131\137\227\129\174\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\233\150\139\229\167\139")
end
function pccubesensor2_orudo_area_a_01_OnLeave()
  Mob:makeSituationPanic(false)
  Sound:pulse("ep13_announcement2")
  _isPanic = false
  print("\227\130\170\227\131\171\227\131\137\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\233\155\162\227\130\140\227\129\166\227\128\129\227\131\145\227\131\139\227\131\131\227\130\175\232\167\163\233\153\164")
  Mob:topUpHatchery()
  print("\227\131\162\227\131\150\229\190\169\230\180\187")
  Fn_killChangeMob()
end
function pccubesensor2_pre_area_a_01_OnEnter()
  _area_num = 3
  Fn_createChangeMobToEnemy("enmgen2_mob_to_enemy_pre_01", {
    grigo = true,
    range = 30,
    time = 0.5,
    degree = 90
  })
  print("\227\131\151\227\131\172\227\129\174\227\131\162\227\131\150\227\130\168\227\131\141\227\131\159\227\131\188\229\140\150\233\150\139\229\167\139")
end
function pccubesensor2_pre_area_a_01_OnLeave()
  Mob:makeSituationPanic(false)
  Sound:pulse("ep13_announcement2")
  _isPanic = false
  print("\227\131\151\227\131\172\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\233\155\162\227\130\140\227\129\166\227\128\129\227\131\145\227\131\139\227\131\131\227\130\175\232\167\163\233\153\164")
  Mob:topUpHatchery()
  print("\227\131\162\227\131\150\229\190\169\230\180\187")
  Fn_killChangeMob()
end
function pccubesensor2_far_area_01_OnLeave()
  local L0_55, L1_56
  _now_far_area = true
end
function pccubesensor2_far_area_01_OnEnter()
  local L0_57, L1_58
  _now_far_area = false
end
function pccubesensor2_warp_warning_01_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep17_09040", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_01_OnLeave()
  runCatWarp()
end
function aujeanSensorOff()
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_pcSensorOff("pccubesensor2_02")
  Fn_pcSensorOff("pccubesensor2_03")
  Fn_pcSensorOff("pccubesensor2_04")
  Fn_pcSensorOff("pccubesensor2_05")
  Fn_pcSensorOff("pccubesensor2_06")
end
function aujeanAction(A0_59)
  local L1_60
  L1_60 = {}
  L1_60.anim_walk_speed = 1
  L1_60.anim_run_speed = 1
  L1_60.anim_speed_over = false
  L1_60.runLength = -1
  L1_60.arrivedLength = 1
  L1_60.recast = true
  invokeTask(function()
    local L0_61, L1_62, L2_63, L3_64, L4_65
    L0_61 = {}
    function L1_62()
      Fn_warpNpc(_npc_aujean, "locator2_aujean_01_01")
      Fn_warpNpc(_npc_eugie, "locator2_eugie_01_01")
      Fn_moveNpc(_npc_aujean, {
        {
          pos = "locator2_aujean_01_02",
          opt = nil
        }
      }, L1_60)
      Fn_moveNpc(_npc_eugie, {
        {
          pos = "locator2_eugie_01_02",
          opt = nil
        }
      }, L1_60)
    end
    L0_61[1] = L1_62
    function L1_62()
      Fn_warpNpc(_npc_aujean, "locator2_aujean_02_01")
      Fn_warpNpc(_npc_eugie, "locator2_eugie_02_01")
      Fn_moveNpc(_npc_aujean, {
        {
          pos = "locator2_aujean_02_02",
          opt = nil
        }
      }, L1_60)
      Fn_moveNpc(_npc_eugie, {
        {
          pos = "locator2_eugie_02_02",
          opt = nil
        }
      }, L1_60)
    end
    L0_61[2] = L1_62
    function L1_62()
      Fn_warpNpc(_npc_aujean, "locator2_aujean_03_01")
      Fn_warpNpc(_npc_eugie, "locator2_eugie_03_01")
      Fn_moveNpc(_npc_aujean, {
        {
          pos = "locator2_aujean_03_02",
          opt = nil
        }
      }, L1_60)
      Fn_moveNpc(_npc_eugie, {
        {
          pos = "locator2_eugie_03_02",
          opt = nil
        }
      }, L1_60)
    end
    L0_61[3] = L1_62
    function L1_62()
      Fn_warpNpc(_npc_aujean, "locator2_aujean_04_01")
      Fn_warpNpc(_npc_eugie, "locator2_eugie_04_01")
      Fn_moveNpc(_npc_aujean, {
        {
          pos = "locator2_aujean_04_02",
          opt = nil
        }
      }, L1_60)
      Fn_moveNpc(_npc_eugie, {
        {
          pos = "locator2_eugie_04_02",
          opt = nil
        }
      }, L1_60)
    end
    L0_61[4] = L1_62
    function L1_62()
      Fn_warpNpc(_npc_aujean, "locator2_aujean_05_01")
      Fn_warpNpc(_npc_eugie, "locator2_eugie_05_01")
    end
    L0_61[5] = L1_62
    function L1_62()
      Fn_warpNpc(_npc_aujean, "locator2_aujean_06_01")
      Fn_warpNpc(_npc_eugie, "locator2_eugie_06_01")
      Fn_moveNpc(_npc_aujean, {
        {
          pos = "locator2_aujean_06_02",
          opt = nil
        }
      }, L1_60)
      Fn_moveNpc(_npc_eugie, {
        {
          pos = "locator2_eugie_06_02",
          opt = nil
        }
      }, L1_60)
    end
    L0_61[6] = L1_62
    L1_62 = A0_59
    if L1_62 > 0 then
      L1_62 = A0_59
      L2_63 = _AUJEAN_ROUTE_COUNT
      if L1_62 <= L2_63 then
        L1_62 = Fn_setNpcActive
        L2_63 = _npc_aujean
        L3_64 = true
        L1_62(L2_63, L3_64)
        L1_62 = Fn_setNpcActive
        L2_63 = _npc_eugie
        L3_64 = true
        L1_62(L2_63, L3_64)
        L1_62 = A0_59
        L1_62 = L0_61[L1_62]
        L1_62()
        L1_62 = false
        L2_63 = false
        while not L1_62 or not L2_63 do
          L3_64 = turnNPCifMoveEnd
          L4_65 = _npc_aujean
          L3_64 = L3_64(L4_65)
          L1_62 = L3_64
          L3_64 = turnNPCifMoveEnd
          L4_65 = _npc_eugie
          L3_64 = L3_64(L4_65)
          L2_63 = L3_64
          L3_64 = wait
          L3_64()
        end
        L3_64 = invokeTask
        function L4_65()
          while true do
            if Fn_getDistanceToPlayer(Fn_findNpcPuppet(_npc_aujean)) <= 5 then
              subNavi(Fn_findNpcPuppet(_npc_aujean))
              Fn_turnNpc(_npc_aujean)
              Fn_captionViewEnd()
              Fn_kaiwaDemoView("ep17_00210k")
              aujeanRunAway()
              break
            end
            wait()
          end
        end
        L3_64(L4_65)
        L3_64 = _now_far_area
        if L3_64 == false then
          L3_64 = Player
          L4_65 = L3_64
          L3_64 = L3_64.setStay
          L3_64(L4_65, true)
          L3_64 = Fn_userCtrlAllOff
          L3_64()
          L3_64 = Fn_findNpcPuppet
          L4_65 = _npc_aujean
          L3_64 = L3_64(L4_65)
          L4_65 = Mv_viewObj
          L4_65 = L4_65(L3_64, 0.3)
          Sound:playSE("auj_934", 1, L3_64)
          if not isGameOver() then
            Fn_captionViewWait("ep17_00104")
          end
          _aujean_call_flag = true
          _timeLimit = _TIME_TO_NEXT
          L4_65 = Mv_safeTaskAbort(L4_65)
          addNavi(L3_64)
          Player:setStay(false)
          Fn_userCtrlOn()
        end
      end
    end
  end)
end
function aujeanRunAway()
  local L0_66, L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L10_76, L11_77, L12_78
  L0_66 = {}
  L0_66.anim_walk_speed = 1
  L0_66.anim_run_speed = 1
  L0_66.anim_speed_over = false
  L0_66.runLength = -1
  L0_66.arrivedLength = 1
  L0_66.recast = true
  L1_67 = {
    L2_68,
    L3_69,
    L4_70
  }
  L2_68 = {}
  L2_68.pos = "locator2_aujean_01_03"
  L2_68.opt = nil
  L3_69 = {}
  L3_69.pos = "locator2_aujean_01_04"
  L3_69.opt = nil
  L4_70 = {}
  L4_70.pos = "locator2_aujean_01_05"
  L4_70.opt = nil
  L2_68 = {
    L3_69,
    L4_70,
    L5_71
  }
  L3_69 = {}
  L3_69.pos = "locator2_eugie_01_04"
  L3_69.opt = nil
  L4_70 = {}
  L4_70.pos = "locator2_eugie_01_05"
  L4_70.opt = nil
  L5_71 = {}
  L5_71.pos = "locator2_eugie_01_06"
  L5_71.opt = nil
  L3_69 = {
    L4_70,
    L5_71,
    L6_72,
    L7_73
  }
  L4_70 = {}
  L4_70.pos = "locator2_aujean_02_03"
  L4_70.opt = nil
  L5_71 = {}
  L5_71.pos = "locator2_aujean_02_04"
  L5_71.opt = nil
  L6_72 = {}
  L6_72.pos = "locator2_aujean_02_05"
  L6_72.opt = nil
  L7_73 = {}
  L7_73.pos = "locator2_aujean_02_06"
  L7_73.opt = nil
  L4_70 = {
    L5_71,
    L6_72,
    L7_73
  }
  L5_71 = {}
  L5_71.pos = "locator2_eugie_02_03"
  L5_71.opt = nil
  L6_72 = {}
  L6_72.pos = "locator2_eugie_02_04"
  L6_72.opt = nil
  L7_73 = {}
  L7_73.pos = "locator2_eugie_02_05"
  L7_73.opt = nil
  L5_71 = {
    L6_72,
    L7_73,
    L8_74
  }
  L6_72 = {}
  L6_72.pos = "locator2_aujean_03_03"
  L6_72.opt = nil
  L7_73 = {}
  L7_73.pos = "locator2_aujean_03_04"
  L7_73.opt = nil
  L8_74 = {}
  L8_74.pos = "locator2_aujean_03_05"
  L8_74.opt = nil
  L6_72 = {
    L7_73,
    L8_74,
    L9_75
  }
  L7_73 = {}
  L7_73.pos = "locator2_eugie_03_03"
  L7_73.opt = nil
  L8_74 = {}
  L8_74.pos = "locator2_eugie_03_04"
  L8_74.opt = nil
  L9_75 = {}
  L9_75.pos = "locator2_eugie_03_05"
  L9_75.opt = nil
  L7_73 = {
    L8_74,
    L9_75,
    L10_76,
    L11_77,
    L12_78
  }
  L8_74 = {}
  L8_74.pos = "locator2_aujean_04_03"
  L8_74.opt = nil
  L9_75 = {}
  L9_75.pos = "locator2_aujean_04_04"
  L9_75.opt = nil
  L10_76 = {}
  L10_76.pos = "locator2_aujean_04_05"
  L10_76.opt = nil
  L11_77 = {}
  L11_77.pos = "locator2_aujean_04_06"
  L11_77.opt = nil
  L12_78 = {}
  L12_78.pos = "locator2_aujean_04_07"
  L12_78.opt = nil
  L8_74 = {
    L9_75,
    L10_76,
    L11_77,
    L12_78,
    {
      pos = "locator2_eugie_04_07",
      opt = nil
    }
  }
  L9_75 = {}
  L9_75.pos = "locator2_eugie_04_03"
  L9_75.opt = nil
  L10_76 = {}
  L10_76.pos = "locator2_eugie_04_04"
  L10_76.opt = nil
  L11_77 = {}
  L11_77.pos = "locator2_eugie_04_05"
  L11_77.opt = nil
  L12_78 = {}
  L12_78.pos = "locator2_eugie_04_06"
  L12_78.opt = nil
  L9_75 = {
    L10_76,
    L11_77,
    L12_78,
    {
      pos = "locator2_aujean_05_05",
      opt = nil
    },
    {
      pos = "locator2_aujean_05_06",
      opt = nil
    },
    {
      pos = "locator2_aujean_05_07",
      opt = nil
    },
    {
      pos = "locator2_aujean_05_08",
      opt = nil
    }
  }
  L10_76 = {}
  L10_76.pos = "locator2_aujean_05_02"
  L10_76.opt = nil
  L11_77 = {}
  L11_77.pos = "locator2_aujean_05_03"
  L11_77.opt = nil
  L12_78 = {}
  L12_78.pos = "locator2_aujean_05_04"
  L12_78.opt = nil
  L10_76 = {
    L11_77,
    L12_78,
    {
      pos = "locator2_eugie_05_04",
      opt = nil
    },
    {
      pos = "locator2_eugie_05_05",
      opt = nil
    },
    {
      pos = "locator2_eugie_05_06",
      opt = nil
    },
    {
      pos = "locator2_eugie_05_07",
      opt = nil
    },
    {
      pos = "locator2_eugie_05_08",
      opt = nil
    }
  }
  L11_77 = {}
  L11_77.pos = "locator2_eugie_05_02"
  L11_77.opt = nil
  L12_78 = {}
  L12_78.pos = "locator2_eugie_05_03"
  L12_78.opt = nil
  L11_77 = {
    L12_78,
    {
      pos = "locator2_aujean_06_04",
      opt = nil
    },
    {
      pos = "locator2_aujean_06_05",
      opt = nil
    },
    {
      pos = "locator2_aujean_06_06",
      opt = nil
    },
    {
      pos = "locator2_aujean_06_07",
      opt = nil
    }
  }
  L12_78 = {}
  L12_78.pos = "locator2_aujean_06_03"
  L12_78.opt = nil
  L12_78 = {
    {
      pos = "locator2_eugie_06_03",
      opt = nil
    },
    {
      pos = "locator2_eugie_06_04",
      opt = nil
    },
    {
      pos = "locator2_eugie_06_05",
      opt = nil
    },
    {
      pos = "locator2_eugie_06_06",
      opt = nil
    },
    {
      pos = "locator2_eugie_06_07",
      opt = nil
    }
  }
  Sound:playSE("auj_007", 1, _puppet_tbl[_npc_aujean])
  Sound:playSE("eug_007", 1, _puppet_tbl[_npc_eugie])
  invokeTask(function()
    local L0_79, L1_80, L2_81
    L0_79 = {}
    function L1_80()
    end
    L0_79[1] = L1_80
    function L1_80()
    end
    L0_79[2] = L1_80
    function L1_80()
    end
    L0_79[3] = L1_80
    function L1_80()
    end
    L0_79[4] = L1_80
    function L1_80()
    end
    L0_79[5] = L1_80
    function L1_80()
    end
    L0_79[6] = L1_80
    L1_80 = _swich_num
    if L1_80 > 0 then
      L1_80 = _swich_num
      L2_81 = _AUJEAN_ROUTE_COUNT
      if L1_80 <= L2_81 then
        L1_80 = _swich_num
        L1_80 = L0_79[L1_80]
        L1_80()
        L1_80 = waitSeconds
        L2_81 = 5
        L1_80(L2_81)
        _ep17_00210k_done = true
        L1_80 = false
        L2_81 = false
        while not L1_80 or not L2_81 do
          L1_80 = turnNPCifMoveEnd(_npc_aujean)
          L2_81 = turnNPCifMoveEnd(_npc_eugie)
          wait()
        end
      end
    end
    L1_80 = false
    L2_81 = false
    aujean = Fn_findNpc(_npc_aujean)
    eugie = Fn_findNpc(_npc_eugie)
    while not L1_80 or not L2_81 do
      if not L2_81 and isWithinRangeOfNPC(_npc_eugie, 5) and false == false then
        invokeTask(function()
          waitSeconds(0.3)
          Fn_turnNpc(_npc_aujean)
          Fn_playMotionNpc(_npc_aujean, "inform_ex_00", true)
          Fn_playMotionNpc(_npc_aujean, {
            "scared_in_00",
            "scared_00"
          }, false)
        end)
        Fn_turnNpc(_npc_eugie)
        Fn_playMotionNpc(_npc_eugie, "inform_ex_00", false)
        Sound:playSE("auj_007", 1, _puppet_tbl[_npc_aujean])
        Sound:playSE("eug_007", 1, _puppet_tbl[_npc_eugie])
        if not isGameOver() then
          Fn_captionViewWait("ep17_00105")
        end
        waitSeconds(0.5)
        Fn_playMotionNpc(_npc_eugie, {
          "scared_in_00",
          "scared_00"
        }, false)
      end
      if aujean:isMoveEnd() and eugie:isMoveEnd() and not L1_80 and not L2_81 and Fn_getDistanceToPlayer(Fn_findNpcPuppet(_npc_aujean)) > _AUJ_DISTANCE and Fn_getDistanceToPlayer(Fn_findNpcPuppet(_npc_eugie)) > _EUG_DISTANCE and not Fn_isInSightTarget(Fn_findNpcPuppet(_npc_aujean), 1.1) and not Fn_isInSightTarget(Fn_findNpcPuppet(_npc_eugie), 1.1) then
        Fn_disappearNpc(_npc_aujean)
        Fn_disappearNpc(_npc_eugie)
        L1_80 = true
        L2_81 = true
      end
      wait()
    end
  end)
end
function bitAction()
  local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92, L11_93, L12_94, L13_95
  L0_82 = Fn_userCtrlOff
  L0_82()
  L0_82 = Fn_setKittenAndCatActive
  L1_83 = false
  L0_82(L1_83)
  L0_82 = {L1_83}
  L1_83 = {}
  L1_83.pos = "locator2_sdemo_camera_01"
  L1_83.time = 0
  L1_83.hashfunc = "Linear"
  L1_83 = {
    L2_84,
    L3_85,
    L4_86,
    L5_87
  }
  L2_84 = {}
  L2_84.pos = "locator2_sdemo_target_01"
  L2_84.time = 0
  L2_84.hashfunc = "Linear"
  L3_85 = {}
  L3_85.pos = "locator2_sdemo_target_02"
  L3_85.time = 3.5
  L3_85.hashfunc = "easeOut"
  L4_86 = {}
  L4_86.pos = "locator2_sdemo_target_02"
  L4_86.time = 0.5
  L4_86.hashfunc = "Linear"
  L5_87 = {}
  L5_87.pos = "locator2_sdemo_target_11"
  L5_87.time = 0.5
  L5_87.hashfunc = "Linear"
  L2_84 = _sdemo
  L3_85 = L2_84
  L2_84 = L2_84.set
  L4_86 = L0_82[1]
  L4_86 = L4_86.pos
  L5_87 = L1_83[1]
  L5_87 = L5_87.pos
  L6_88 = false
  L2_84(L3_85, L4_86, L5_87, L6_88)
  L2_84 = invokeTask
  function L3_85()
    waitSeconds(3)
    Sound:playSE("bit_048", 1)
    Fn_captionView("ep17_00106")
    waitSeconds(1)
    Fn_captionViewEnd()
  end
  L2_84(L3_85)
  L2_84 = _sdemo
  L3_85 = L2_84
  L2_84 = L2_84.play
  L4_86 = L0_82
  L5_87 = L1_83
  L2_84(L3_85, L4_86, L5_87)
  L2_84 = Fn_resetPcPos
  L3_85 = "locator2_sdemo_pc_03"
  L2_84(L3_85)
  L2_84 = Fn_setNpcActive
  L3_85 = "npcgen2_bit_01"
  L4_86 = true
  L2_84(L3_85, L4_86)
  L2_84 = {}
  L2_84.anim_walk_speed = 0.7
  L2_84.anim_speed_over = false
  L2_84.arrivedLength = 0.2
  L2_84.recast = true
  L3_85 = Fn_moveNpc
  L4_86 = "npcgen2_bit_01"
  L5_87 = {L6_88}
  L6_88 = "locator2_sdemo_bit_02"
  L6_88 = L2_84
  L3_85 = L3_85(L4_86, L5_87, L6_88)
  while true do
    while true do
      L5_87 = L3_85
      L4_86 = L3_85.isRunning
      L4_86 = L4_86(L5_87)
      if L4_86 then
        L4_86 = wait
        L4_86()
      end
    end
  end
  while true do
    L4_86 = _sdemo
    L5_87 = L4_86
    L4_86 = L4_86.isPlay
    L4_86 = L4_86(L5_87)
    if L4_86 then
      L4_86 = wait
      L4_86()
    end
  end
  L4_86 = waitSeconds
  L5_87 = 2
  L4_86(L5_87)
  L4_86 = Fn_kaiwaDemoView
  L5_87 = "ep17_00220k"
  L4_86(L5_87)
  L4_86 = invokeTask
  function L5_87()
    Fn_turnNpc("npcgen2_bit_01", "locator2_sdemo_bit_turn_ship")
  end
  L4_86(L5_87)
  L4_86 = waitSeconds
  L5_87 = 0.3
  L4_86(L5_87)
  L4_86 = Fn_captionView
  L5_87 = "ep17_00108"
  L4_86(L5_87)
  L4_86 = waitSeconds
  L5_87 = 1.5
  L4_86(L5_87)
  L4_86 = Fn_captionViewEnd
  L4_86()
  L4_86 = {}
  L5_87 = {}
  L6_88 = {}
  L7_89 = {}
  for L11_93 = 1, 3 do
    L12_94 = string
    L12_94 = L12_94.format
    L13_95 = "%02d"
    L12_94 = L12_94(L13_95, L11_93)
    L13_95 = {
      findGameObject2("Node", "locator2_policeve_" .. L12_94):getWorldPos(),
      findGameObject2("Node", "locator2_policeve_fly_" .. L12_94):getWorldPos()
    }
    L5_87[L11_93] = L13_95
    L13_95 = Mv_createScriptVehicleWait
    L6_88[L11_93], L13_95 = L5_87[L11_93], L13_95(L5_87[L11_93], "PoliceHexS02", "police_ship" .. L12_94, "locator2_policeve_" .. L12_94)
    L4_86[L11_93] = L13_95
    L13_95 = L4_86[L11_93]
    L13_95 = L13_95.setBaseSpeed
    L13_95(L13_95, 5)
  end
  L10_92.pos = "locator2_sdemo_camera_11"
  L10_92.time = L8_90
  L10_92.hashfunc = "easeInOut"
  L11_93 = {}
  L11_93.pos = "locator2_policeve_01"
  L11_93.time = 2.5
  L11_93.hashfunc = "easeInOut"
  L12_94 = {}
  L12_94.pos = "locator2_sdemo_target_17"
  L12_94.time = 5.5
  L12_94.hashfunc = "Linear"
  L11_93 = _sdemo
  L12_94 = L11_93
  L11_93 = L11_93.play
  L13_95 = L9_91
  L11_93(L12_94, L13_95, L10_92)
  while true do
    L11_93 = _sdemo
    L12_94 = L11_93
    L11_93 = L11_93.isPlay
    L11_93 = L11_93(L12_94)
    if L11_93 then
      L11_93 = wait
      L11_93()
    end
  end
  L11_93 = Fn_setKittenAndCatActive
  L12_94 = true
  L11_93(L12_94)
  L11_93 = invokeTask
  function L12_94()
    Fn_turnNpc("npcgen2_bit_01")
  end
  L11_93(L12_94)
  L11_93 = 2
  L12_94 = {L13_95}
  L13_95 = {}
  L13_95.pos = "locator2_sdemo_camera_11"
  L13_95.time = L11_93
  L13_95 = {
    {
      pos = "locator2_sdemo_target_04",
      time = L11_93
    }
  }
  _sdemo:play(L12_94, L13_95)
  invokeTask(function()
    waitSeconds(2)
    for _FORV_3_ = 1, 3 do
      L4_86[_FORV_3_]:setBaseSpeed(0)
      L4_86[_FORV_3_]:setVisible(false)
    end
  end)
  while _sdemo:isPlay() do
    wait()
  end
  Fn_playNpcEventMotion("npcgen2_bit_01", "bye_00")
  invokeTask(function()
    Fn_playNpcEventMotion("npcgen2_bit_01", "stay")
  end)
  Fn_disappearNpc("police_ve")
  Camera:lookTo(findGameObject2("Node", "locator2_sdemo_target_04"):getWorldPos(), 0, 0)
  _sdemo:stop(3)
  Fn_userCtrlOn()
end
function getEnemyDistance(A0_96)
  local L1_97, L2_98
  L1_97 = findGameObject2
  L2_98 = "Puppet"
  L1_97 = L1_97(L2_98, A0_96)
  L2_98 = 99999
  if L1_97 ~= nil then
    L2_98 = Fn_getDistanceToPlayer(L1_97)
  end
  return L2_98
end
function checkGameOverGrigo()
  if _check_gameover_task ~= nil then
    return
  end
  _check_gameover_task = invokeTask(function()
    local L0_99, L1_100, L2_101, L3_102, L4_103
    L0_99 = 0
    while true do
      if L1_100 == 1 then
        for L4_103 = 1, _GRIGO_MAX_CNT do
          if getEnemyDistance("grigo_" .. string.format("%02d", L4_103)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance("grigo_" .. string.format("%02d", L4_103)) ~= -1 then
            L0_99 = L0_99 + 1
          end
          wait()
        end
        for L4_103 = 1, _POLICE_MAX_CNT do
          if getEnemyDistance("police_" .. string.format("%02d", L4_103)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance("police_" .. string.format("%02d", L4_103)) ~= -1 then
            L0_99 = L0_99 + 1
          end
          wait()
        end
      elseif L1_100 == 2 then
        for L4_103 = 1, _GRIGO_ORUDO_MAX_CNT do
          if getEnemyDistance("grigo_orudo_" .. string.format("%02d", L4_103)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance("grigo_orudo_" .. string.format("%02d", L4_103)) ~= -1 then
            L0_99 = L0_99 + 1
          end
          wait()
        end
        for L4_103 = 1, _POLICE_ORUDO_MAX_CNT do
          if getEnemyDistance("police_orudo_" .. string.format("%02d", L4_103)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance("police_orudo_" .. string.format("%02d", L4_103)) ~= -1 then
            L0_99 = L0_99 + 1
          end
          wait()
        end
      elseif L1_100 == 3 then
        for L4_103 = 1, _GRIGO_ORUDO_MAX_CNT do
          if getEnemyDistance("grigo_pre_" .. string.format("%02d", L4_103)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance("grigo_pre_" .. string.format("%02d", L4_103)) ~= -1 then
            L0_99 = L0_99 + 1
          end
          wait()
        end
        for L4_103 = 1, _POLICE_ORUDO_MAX_CNT do
          if getEnemyDistance("police_pre_" .. string.format("%02d", L4_103)) < ENEMY_NEAR_JUDGE_DIST and getEnemyDistance("police_pre_" .. string.format("%02d", L4_103)) ~= -1 then
            L0_99 = L0_99 + 1
          end
          wait()
        end
      end
      if L0_99 >= L1_100 then
        L1_100()
        break
      end
      L0_99 = 0
      L1_100()
    end
  end)
end
function removeFarAndNotInSight(A0_104, A1_105)
  local L2_106, L3_107, L4_108, L5_109, L6_110
  L2_106 = findGameObject2
  L3_107 = "Puppet"
  L4_108 = A0_104
  L2_106 = L2_106(L3_107, L4_108)
  L3_107 = -1
  if L2_106 ~= nil then
    L4_108 = Mv_raycastCameraSight
    L5_109 = L2_106
    L4_108 = L4_108(L5_109)
    L5_109 = Fn_getDistanceToPlayer
    L6_110 = L2_106
    L5_109 = L5_109(L6_110)
    L3_107 = L5_109
    if A1_105 <= L3_107 and L4_108 == false then
      L6_110 = L2_106
      L5_109 = L2_106.getBrain
      L5_109 = L5_109(L6_110)
      L6_110 = L5_109.isReadyEnemy
      L6_110 = L6_110(L5_109)
      if L6_110 then
        L6_110 = nil
        if string.find(A0_104, "orudo") == nil and string.find(A0_104, "pre") == nil then
          L6_110 = "enmgen2_mob_to_enemy_01"
        elseif string.find(A0_104, "orudo") ~= nil then
          L6_110 = "enmgen2_mob_to_enemy_ordo_01"
          print("\227\130\170\227\131\171\227\131\137\227\131\142\227\131\175")
        elseif string.find(A0_104, "pre") ~= nil then
          L6_110 = "enmgen2_mob_to_enemy_pre_01"
          print("\227\130\170\227\131\171\227\131\137\227\131\142\227\131\175")
        end
        findGameObject2("EnemyGenerator", L6_110):requestEnemyKill(L5_109)
        print("\227\130\168\227\131\141\227\131\159\227\131\188\233\129\160\227\129\132\227\129\139\227\129\164\227\130\171\227\131\161\227\131\169\229\164\150\227\129\170\227\129\174\227\129\167\227\130\173\227\131\171\239\188\154", A0_104)
      end
    end
  end
end
function removeFarEnemy(A0_111)
  _remove_far_enemy_task = invokeTask(function()
    local L0_112, L1_113, L2_114, L3_115, L4_116
    while true do
      for L3_115 = 1, _GRIGO_MAX_CNT do
        L4_116 = "grigo_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _POLICE_MAX_CNT do
        L4_116 = "police_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _PEOPLE_MAX_CNT do
        L4_116 = "people_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _GRIGO_ORUDO_MAX_CNT do
        L4_116 = "grigo_orudo_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _POLICE_ORUDO_MAX_CNT do
        L4_116 = "police_orudo_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _PEOPLE_ORUDO_MAX_CNT do
        L4_116 = "people_orudo_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _GRIGO_ORUDO_MAX_CNT do
        L4_116 = "grigo_pre_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _POLICE_ORUDO_MAX_CNT do
        L4_116 = "police_pre_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      for L3_115 = 1, _PEOPLE_ORUDO_MAX_CNT do
        L4_116 = "people_pre_"
        L4_116 = L4_116 .. string.format("%02d", L3_115)
        removeFarAndNotInSight(L4_116, A0_111)
        wait()
      end
      L0_112()
    end
  end)
end
function checkMobPanic(A0_117, A1_118)
  _check_mob_panic_task = invokeTask(function()
    local L0_119, L1_120, L2_121, L3_122, L4_123
    while true do
      L0_119 = 9999
      if L1_120 == 1 then
        for L4_123 = 1, _GRIGO_MAX_CNT do
          if getEnemyDistance("grigo_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("grigo_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("grigo_" .. string.format("%02d", L4_123))
          end
          wait()
        end
        for L4_123 = 1, _POLICE_MAX_CNT do
          if getEnemyDistance("police_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("police_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("police_" .. string.format("%02d", L4_123))
          end
          wait()
        end
        for L4_123 = 1, _PEOPLE_MAX_CNT do
          if getEnemyDistance("people_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("people_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("people_" .. string.format("%02d", L4_123))
          end
          wait()
        end
      elseif L1_120 == 2 then
        for L4_123 = 1, _GRIGO_ORUDO_MAX_CNT do
          if getEnemyDistance("grigo_orudo_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("grigo_orudo_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("grigo_orudo_" .. string.format("%02d", L4_123))
          end
          wait()
        end
        for L4_123 = 1, _POLICE_ORUDO_MAX_CNT do
          if getEnemyDistance("police_orudo_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("police_orudo_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("police_orudo_" .. string.format("%02d", L4_123))
          end
          wait()
        end
        for L4_123 = 1, _PEOPLE_ORUDO_MAX_CNT do
          if getEnemyDistance("people_orudo_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("people_orudo_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("people_orudo_" .. string.format("%02d", L4_123))
          end
          wait()
        end
      elseif L1_120 == 3 then
        for L4_123 = 1, _GRIGO_ORUDO_MAX_CNT do
          if getEnemyDistance("grigo_pre_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("grigo_pre_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("grigo_pre_" .. string.format("%02d", L4_123))
          end
          wait()
        end
        for L4_123 = 1, _POLICE_ORUDO_MAX_CNT do
          if getEnemyDistance("police_pre_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("police_pre_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("police_pre_" .. string.format("%02d", L4_123))
          end
          wait()
        end
        for L4_123 = 1, _PEOPLE_ORUDO_MAX_CNT do
          if getEnemyDistance("people_pre_" .. string.format("%02d", L4_123)) ~= -1 and L0_119 > getEnemyDistance("people_pre_" .. string.format("%02d", L4_123)) then
            L0_119 = getEnemyDistance("people_pre_" .. string.format("%02d", L4_123))
          end
          wait()
        end
      end
      if L0_119 < L1_120 then
        if not L1_120 then
          L1_120(L2_121, L3_122)
          L1_120(L2_121, L3_122)
          L1_120(L2_121)
          _isPanic = true
        end
      elseif L0_119 > L1_120 then
        if L1_120 then
          L1_120(L2_121, L3_122)
          L1_120(L2_121, L3_122)
          _isPanic = false
          L1_120(L2_121)
          L1_120(L2_121)
          L1_120(L2_121)
        end
      end
      L1_120()
    end
  end)
end
function setEnemyMarker(A0_124, A1_125)
  if findGameObject2("Puppet", A0_124) ~= nil and findGameObject2("Puppet", A0_124):getBrain() ~= nil then
    findGameObject2("Puppet", A0_124):getBrain():setVisibleEnemyMarker(A1_125)
  end
end
function checkEnemyMarker()
  invokeTask(function()
    while true do
      if _area_num == 1 then
        invokeTask(function()
          local L0_126, L1_127, L2_128, L3_129
          for L3_129 = 1, _GRIGO_MAX_CNT do
            setEnemyMarker("grigo_" .. string.format("%02d", L3_129), false)
            if findGameObject2("EnemyBrain", "grigo_" .. string.format("%02d", L3_129)) ~= nil then
              findGameObject2("EnemyBrain", "grigo_" .. string.format("%02d", L3_129)):getGizmo():setIgnoreGrab(true)
            end
            wait()
          end
        end)
        invokeTask(function()
          local L0_130, L1_131, L2_132, L3_133
          for L3_133 = 1, _POLICE_MAX_CNT do
            setEnemyMarker("police_" .. string.format("%02d", L3_133), false)
            if findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_133)) ~= nil then
              findGameObject2("EnemyBrain", "police_" .. string.format("%02d", L3_133)):getGizmo():setIgnoreGrab(true)
            end
            wait()
          end
        end)
        invokeTask(function()
          local L0_134, L1_135, L2_136, L3_137
          for L3_137 = 1, _PEOPLE_MAX_CNT do
            setEnemyMarker("people_" .. string.format("%02d", L3_137), false)
            if findGameObject2("EnemyBrain", "people_" .. string.format("%02d", L3_137)) ~= nil then
              findGameObject2("EnemyBrain", "people_" .. string.format("%02d", L3_137)):getGizmo():setIgnoreGrab(true)
            end
            wait()
          end
        end)
      elseif _area_num == 2 then
        invokeTask(function()
          local L0_138, L1_139, L2_140, L3_141
          for L3_141 = 1, _GRIGO_ORUDO_MAX_CNT do
            setEnemyMarker("grigo_orudo_" .. string.format("%02d", L3_141), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_142, L1_143, L2_144, L3_145
          for L3_145 = 1, _POLICE_ORUDO_MAX_CNT do
            setEnemyMarker("police_orudo_" .. string.format("%02d", L3_145), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_146, L1_147, L2_148, L3_149
          for L3_149 = 1, _PEOPLE_ORUDO_MAX_CNT do
            setEnemyMarker("people_orudo_" .. string.format("%02d", L3_149), false)
            wait()
          end
        end)
      elseif _area_num == 3 then
        invokeTask(function()
          local L0_150, L1_151, L2_152, L3_153
          for L3_153 = 1, _GRIGO_ORUDO_MAX_CNT do
            setEnemyMarker("grigo_pre_" .. string.format("%02d", L3_153), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_154, L1_155, L2_156, L3_157
          for L3_157 = 1, _POLICE_ORUDO_MAX_CNT do
            setEnemyMarker("police_pre_" .. string.format("%02d", L3_157), false)
            wait()
          end
        end)
        invokeTask(function()
          local L0_158, L1_159, L2_160, L3_161
          for L3_161 = 1, _PEOPLE_ORUDO_MAX_CNT do
            setEnemyMarker("people_pre_" .. string.format("%02d", L3_161), false)
            wait()
          end
        end)
      end
      wait()
    end
  end)
end
function GrigoGameOver()
  invokeTask(function()
    local L0_162, L1_163, L2_164, L3_165, L4_166, L5_167, L6_168, L7_169
    L0_162 = isGameOver
    L0_162 = L0_162()
    if L0_162 then
      return
    end
    L0_162 = setGameOver
    L1_163 = true
    L0_162(L1_163)
    L0_162 = Fn_coercionGravityRevert
    L0_162()
    L0_162 = Fn_userCtrlAllOff
    L0_162()
    L0_162 = Fn_coercionPoseNomal
    L0_162()
    L0_162 = Mob
    L1_163 = L0_162
    L0_162 = L0_162.makeSituationPanic
    L2_164 = false
    L0_162(L1_163, L2_164)
    _isPanic = false
    L0_162 = 1
    L1_163 = 0
    L2_164 = nil
    L3_165 = _area_num
    if L3_165 == 1 then
      L3_165 = getEnemyDistance
      L7_169 = 1
      L3_165 = L3_165(L4_166)
      for L7_169 = 2, _GRIGO_MAX_CNT do
        if L3_165 > getEnemyDistance("grigo_" .. string.format("%02d", L7_169)) then
          L3_165 = getEnemyDistance("grigo_" .. string.format("%02d", L7_169))
          L0_162 = L7_169
        end
      end
      for L7_169 = 1, _POLICE_MAX_CNT do
        if L3_165 > getEnemyDistance("police_" .. string.format("%02d", L7_169)) then
          L3_165 = getEnemyDistance("police_" .. string.format("%02d", L7_169))
          L1_163 = L7_169
        end
      end
      if L1_163 <= 0 then
        L7_169 = L0_162
        L2_164 = L4_166 .. L5_167
      else
        L7_169 = L1_163
        L2_164 = L4_166 .. L5_167
      end
    else
      L3_165 = _area_num
      if L3_165 == 2 then
        L3_165 = getEnemyDistance
        L7_169 = 1
        L3_165 = L3_165(L4_166)
        for L7_169 = 2, _GRIGO_ORUDO_MAX_CNT do
          if L3_165 > getEnemyDistance("grigo_orudo_" .. string.format("%02d", L7_169)) then
            L3_165 = getEnemyDistance("grigo_orudo_" .. string.format("%02d", L7_169))
            L0_162 = L7_169
          end
        end
        for L7_169 = 1, _POLICE_ORUDO_MAX_CNT do
          if L3_165 > getEnemyDistance("police_orudo_" .. string.format("%02d", L7_169)) then
            L3_165 = getEnemyDistance("police_orudo_" .. string.format("%02d", L7_169))
            L1_163 = L7_169
          end
        end
        if L1_163 <= 0 then
          L7_169 = L0_162
          L2_164 = L4_166 .. L5_167
        else
          L7_169 = L1_163
          L2_164 = L4_166 .. L5_167
        end
      else
        L3_165 = _area_num
        if L3_165 == 3 then
          L3_165 = getEnemyDistance
          L7_169 = 1
          L3_165 = L3_165(L4_166)
          for L7_169 = 2, _GRIGO_ORUDO_MAX_CNT do
            if L3_165 > getEnemyDistance("grigo_pre_" .. string.format("%02d", L7_169)) then
              L3_165 = getEnemyDistance("grigo_pre_" .. string.format("%02d", L7_169))
              L0_162 = L7_169
            end
          end
          for L7_169 = 1, _POLICE_ORUDO_MAX_CNT do
            if L3_165 > getEnemyDistance("police_pre_" .. string.format("%02d", L7_169)) then
              L3_165 = getEnemyDistance("police_pre_" .. string.format("%02d", L7_169))
              L1_163 = L7_169
            end
          end
          if L1_163 <= 0 then
            L7_169 = L0_162
            L2_164 = L4_166 .. L5_167
          else
            L7_169 = L1_163
            L2_164 = L4_166 .. L5_167
          end
        end
      end
    end
    if L2_164 ~= nil then
      L3_165 = findGameObject2
      L3_165 = L3_165(L4_166, L5_167)
      if L3_165 ~= nil then
        L7_169 = 1.5
        L4_166(L5_167, L6_168, L7_169)
      end
    end
    L3_165 = Mv_safeTaskAbort
    L3_165 = L3_165(L4_166)
    _start_cap_task = L3_165
    L3_165 = Fn_captionViewEnd
    L3_165()
    L3_165 = Fn_captionViewWait
    L3_165(L4_166)
    L3_165 = Fn_scriptGameOver
    L3_165(L4_166)
    L3_165 = Mob
    L3_165 = L3_165.topUpHatchery
    L3_165(L4_166)
    L3_165 = print
    L3_165(L4_166)
  end)
end
function isGameOver()
  local L0_170, L1_171
  L0_170 = _gameover
  return L0_170
end
function setGameOver(A0_172)
  local L1_173
  _gameover = A0_172
end
function maltiNaviAllDelete()
  for _FORV_3_, _FORV_4_ in pairs(_mnavi_hdl) do
    _mnavi_hdl[_FORV_3_]:setActive(false)
    _mnavi_hdl[_FORV_3_]:del()
    _mnavi_hdl[_FORV_3_] = nil
  end
end
function maltiNaviCreate(A0_174)
  local L1_175
  L1_175 = A0_174.getName
  L1_175 = L1_175(A0_174)
  _mnavi_hdl[L1_175] = HUD:mnaviNew({
    name = "mnavi_" .. L1_175,
    PochFadeLen0 = 5,
    PochFadeLen100 = 20
  })
  _mnavi_hdl[L1_175]:setTarget(A0_174)
  _mnavi_hdl[L1_175]:setActive(true)
end
function addNavi(A0_176)
  for _FORV_4_, _FORV_5_ in pairs(_target_malti_navi) do
    if _FORV_5_ == A0_176 then
      return
    end
  end
  table.insert(_target_malti_navi, A0_176)
  setNavi()
end
function subNavi(A0_177)
  local L1_178, L2_179, L3_180, L4_181, L5_182
  L1_178 = table
  L1_178 = L1_178.maxn
  L1_178 = L1_178(L2_179)
  if L1_178 <= 0 then
    return
  end
  for L5_182, _FORV_6_ in L2_179(L3_180) do
    if _FORV_6_ == A0_177 then
      table.remove(_target_malti_navi, L5_182)
    end
  end
  if L1_178 == 1 then
    L2_179()
  else
    L2_179()
  end
  L2_179()
end
function deleteNavi(A0_183)
  if A0_183 then
    _target_malti_navi = {}
  end
  maltiNaviAllDelete()
  Fn_naviKill()
end
function resetNavi()
  if table.maxn(_target_malti_navi) <= 0 then
    return
  end
  maltiNaviAllDelete()
  setNavi()
end
function setNavi()
  local L0_184, L1_185, L2_186, L3_187, L4_188, L5_189
  L0_184 = table
  L0_184 = L0_184.maxn
  L0_184 = L0_184(L1_185)
  if L0_184 == 1 then
    L1_185()
    L1_185(L2_186)
  elseif L0_184 > 1 then
    L1_185()
    for L4_188, L5_189 in L1_185(L2_186) do
      maltiNaviCreate(L5_189)
    end
  end
end
