dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/dm03_common.lua")
dm03_puppet_tbl = {}
dm03_gade_found = false
dm03_gade = nil
dm03_gade_near_task = nil
GADE_FOUND_DIST = 50
enmgen2_cluster_dt = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01_01",
      name = "guardcore_01"
    },
    {
      type = "runner",
      locator = "locator_01_02",
      name = "runner_02"
    },
    {
      type = "stalker",
      locator = "locator_01_03",
      name = "guardcore_03"
    },
    {
      type = "stalker",
      locator = "locator_01_04",
      name = "guardcore_04"
    },
    {
      type = "runner",
      locator = "locator_01_05",
      name = "runner_05"
    },
    {
      type = "stalker",
      locator = "locator_01_06",
      name = "guardcore_06"
    },
    {
      type = "runner",
      locator = "locator_01_07",
      name = "runner_07"
    },
    {
      type = "stalker",
      locator = "locator_01_08",
      name = "guardcore_08"
    },
    {
      type = "runner",
      locator = "locator_01_09",
      name = "runner_09"
    },
    {
      type = "guardcore",
      locator = "locator_01_10",
      name = "guardcore_10"
    },
    {
      type = "runner",
      locator = "locator_01_11",
      name = "runner_11"
    },
    {
      type = "runner",
      locator = "locator_01_12",
      name = "runner_12"
    },
    {
      type = "guardcore",
      locator = "locator_01_13",
      name = "guardcore_13"
    },
    {
      type = "guardcore",
      locator = "locator_01_14",
      name = "guardcore_14"
    },
    {
      type = "guardcore",
      locator = "locator_01_15",
      name = "guardcore_15"
    },
    {
      type = "gellyfish",
      locator = "locator_01_16",
      name = "mosquito_16"
    },
    {
      type = "gellyfish",
      locator = "locator_01_17",
      name = "mosquito_17"
    },
    {
      type = "gellyfish",
      locator = "locator_01_18",
      name = "mosquito_18"
    },
    {
      type = "gellyfish",
      locator = "locator_01_19",
      name = "mosquito_19"
    },
    {
      type = "gellyfish",
      locator = "locator_01_20",
      name = "mosquito_20"
    },
    {
      type = "gellyfish",
      locator = "locator_01_21",
      name = "mosquito_21"
    },
    {
      type = "gellyfish",
      locator = "locator_01_22",
      name = "mosquito_22"
    },
    {
      type = "gellyfish",
      locator = "locator_01_23",
      name = "mosquito_23"
    },
    {
      type = "gellyfish",
      locator = "locator_01_24",
      name = "mosquito_24"
    },
    {
      type = "gellyfish",
      locator = "locator_01_25",
      name = "mosquito_25"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = RESPAWN_TIME,
  onEnter = function(A0_0)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_dt"):requestSpawn()
  end,
  onLeave = function(A0_1)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_dt"):requestAllEnemyKill()
  end,
  onObjectAsh = function(A0_2, A1_3)
    local L2_4, L3_5
    L3_5 = A1_3
    L2_4 = A1_3.getName
    L2_4 = L2_4(L3_5)
    L3_5 = findGameObject2
    L3_5 = L3_5("EnemyBrain", L2_4)
    Brief_Navi(enemy_hint_time_tbl[string.match(L2_4, "[a-z]+")], L3_5)
  end,
  onSetupGem = function(A0_6, A1_7)
    Fn_enemyPopGemSetup(A0_6, {
      "runner_02",
      "runner_05",
      "runner_07",
      "runner_09",
      "runner_11",
      "runner_12"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_8, A1_9)
    Fn_enemyAshPopGem(A0_8, A1_9)
  end
}
enmgen2_cluster_mt = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_01_01",
      name = "gellyfish_01"
    },
    {
      type = "gellyfish",
      locator = "locator_01_02",
      name = "gellyfish_02"
    },
    {
      type = "gellyfish",
      locator = "locator_01_03",
      name = "gellyfish_03"
    },
    {
      type = "gellyfish",
      locator = "locator_01_04",
      name = "gellyfish_04"
    },
    {
      type = "gellyfish",
      locator = "locator_01_05",
      name = "gellyfish_05"
    },
    {
      type = "gellyfish",
      locator = "locator_01_06",
      name = "gellyfish_06"
    },
    {
      type = "gellyfish",
      locator = "locator_01_07",
      name = "gellyfish_07"
    },
    {
      type = "gellyfish",
      locator = "locator_01_08",
      name = "gellyfish_08"
    },
    {
      type = "gellyfish",
      locator = "locator_01_09",
      name = "gellyfish_09"
    },
    {
      type = "gellyfish",
      locator = "locator_01_10",
      name = "gellyfish_10"
    },
    {
      type = "gellyfish",
      locator = "locator_01_11",
      name = "gellyfish_11"
    },
    {
      type = "gellyfish",
      locator = "locator_01_12",
      name = "gellyfish_12"
    },
    {
      type = "gellyfish",
      locator = "locator_01_13",
      name = "gellyfish_13"
    },
    {
      type = "gellyfish",
      locator = "locator_01_14",
      name = "gellyfish_14"
    },
    {
      type = "gellyfish",
      locator = "locator_01_15",
      name = "gellyfish_15"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = RESPAWN_TIME,
  onEnter = function(A0_10)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_mt"):requestSpawn()
  end,
  onLeave = function(A0_11)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_mt"):requestAllEnemyKill()
  end,
  onObjectAsh = function(A0_12, A1_13)
    local L2_14, L3_15
    L3_15 = A1_13
    L2_14 = A1_13.getName
    L2_14 = L2_14(L3_15)
    L3_15 = findGameObject2
    L3_15 = L3_15("EnemyBrain", L2_14)
    Brief_Navi(enemy_hint_time_tbl[string.match(L2_14, "[a-z]+")], L3_15)
  end
}
enmgen2_cluster_ed = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_01_01",
      name = "guardcore_11"
    },
    {
      type = "runner",
      locator = "locator_01_02",
      name = "runner_22"
    },
    {
      type = "guardcore",
      locator = "locator_01_03",
      name = "guardcore_23"
    },
    {
      type = "runner",
      locator = "locator_01_04",
      name = "runner_04"
    },
    {
      type = "runner",
      locator = "locator_01_05",
      name = "runner_15"
    },
    {
      type = "runner",
      locator = "locator_01_06",
      name = "runner_06"
    },
    {
      type = "stalker",
      locator = "locator_01_07",
      name = "guardcore_07"
    },
    {
      type = "runner",
      locator = "locator_01_08",
      name = "runner_08"
    },
    {
      type = "stalker",
      locator = "locator_01_09",
      name = "guardcore_09"
    },
    {
      type = "runner",
      locator = "locator_01_10",
      name = "runner_10"
    },
    {
      type = "runner",
      locator = "locator_01_11",
      name = "runner_21"
    },
    {
      type = "runner",
      locator = "locator_01_12",
      name = "runner_42"
    },
    {
      type = "gellyfish",
      locator = "locator_01_13",
      name = "mosquito_13"
    },
    {
      type = "gellyfish",
      locator = "locator_01_14",
      name = "mosquito_14"
    },
    {
      type = "gellyfish",
      locator = "locator_01_15",
      name = "mosquito_15"
    },
    {
      type = "gellyfish",
      locator = "locator_01_16",
      name = "mosquito_26"
    },
    {
      type = "gellyfish",
      locator = "locator_01_17",
      name = "mosquito_27"
    },
    {
      type = "gellyfish",
      locator = "locator_01_18",
      name = "mosquito_28"
    },
    {
      type = "gellyfish",
      locator = "locator_01_19",
      name = "mosquito_29"
    },
    {
      type = "gellyfish",
      locator = "locator_01_20",
      name = "mosquito_30"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = RESPAWN_TIME,
  onEnter = function(A0_16)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_ed"):requestSpawn()
  end,
  onLeave = function(A0_17)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_ed"):requestAllEnemyKill()
  end,
  onObjectAsh = function(A0_18, A1_19)
    local L2_20, L3_21
    L3_21 = A1_19
    L2_20 = A1_19.getName
    L2_20 = L2_20(L3_21)
    L3_21 = findGameObject2
    L3_21 = L3_21("EnemyBrain", L2_20)
    Brief_Navi(enemy_hint_time_tbl[string.match(L2_20, "[a-z]+")], L3_21)
  end,
  onSetupGem = function(A0_22, A1_23)
    Fn_enemyPopGemSetup(A0_22, {
      "runner_22",
      "runner_04",
      "runner_15",
      "runner_06",
      "runner_08",
      "runner_10",
      "runner_21",
      "runner_42"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_24, A1_25)
    Fn_enemyAshPopGem(A0_24, A1_25)
  end
}
enmgen2_cluster_cc = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01_01",
      name = "stalker_21"
    },
    {
      type = "runner",
      locator = "locator_01_02",
      name = "runner_32"
    },
    {
      type = "runner",
      locator = "locator_01_03",
      name = "runner_03"
    },
    {
      type = "stalker",
      locator = "locator_01_04",
      name = "stalker_24"
    },
    {
      type = "runner",
      locator = "locator_01_05",
      name = "runner_25"
    },
    {
      type = "stalker",
      locator = "locator_01_06",
      name = "stalker_16"
    },
    {
      type = "runner",
      locator = "locator_01_07",
      name = "runner_17"
    },
    {
      type = "guardcore",
      locator = "locator_01_08",
      name = "guardcore_18"
    },
    {
      type = "runner",
      locator = "locator_01_09",
      name = "runner_19"
    },
    {
      type = "guardcore",
      locator = "locator_01_10",
      name = "guardcore_20"
    },
    {
      type = "runner",
      locator = "locator_01_11",
      name = "runner_31"
    },
    {
      type = "gellyfish",
      locator = "locator_01_12",
      name = "mosquito_12"
    },
    {
      type = "gellyfish",
      locator = "locator_01_13",
      name = "mosquito_33"
    },
    {
      type = "gellyfish",
      locator = "locator_01_14",
      name = "mosquito_34"
    },
    {
      type = "gellyfish",
      locator = "locator_01_15",
      name = "mosquito_35"
    },
    {
      type = "gellyfish",
      locator = "locator_01_16",
      name = "mosquito_36"
    },
    {
      type = "gellyfish",
      locator = "locator_01_17",
      name = "mosquito_37"
    },
    {
      type = "gellyfish",
      locator = "locator_01_18",
      name = "mosquito_38"
    },
    {
      type = "gellyfish",
      locator = "locator_01_19",
      name = "mosquito_39"
    },
    {
      type = "gellyfish",
      locator = "locator_01_20",
      name = "mosquito_40"
    },
    {
      type = "stalker",
      locator = "locator_01_21",
      name = "stalker_25"
    },
    {
      type = "guardcore",
      locator = "locator_01_22",
      name = "guardcore_21"
    },
    {
      type = "gellyfish",
      locator = "locator_01_23",
      name = "mosquito_41"
    },
    {
      type = "gellyfish",
      locator = "locator_01_24",
      name = "mosquito_42"
    },
    {
      type = "runner",
      locator = "locator_01_25",
      name = "runner_33"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = RESPAWN_TIME,
  onEnter = function(A0_26)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_cc"):requestSpawn()
  end,
  onLeave = function(A0_27)
    findGameObject2("EnemyGenerator", "enmgen2_cluster_cc"):requestAllEnemyKill()
  end,
  onObjectAsh = function(A0_28, A1_29)
    local L2_30, L3_31
    L3_31 = A1_29
    L2_30 = A1_29.getName
    L2_30 = L2_30(L3_31)
    L3_31 = findGameObject2
    L3_31 = L3_31("EnemyBrain", L2_30)
    Brief_Navi(enemy_hint_time_tbl[string.match(L2_30, "[a-z]+")], L3_31)
  end,
  onSetupGem = function(A0_32, A1_33)
    Fn_enemyPopGemSetup(A0_32, {
      "runner_32",
      "runner_03",
      "runner_25",
      "runner_17",
      "runner_19",
      "runner_31"
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_34, A1_35)
    Fn_enemyAshPopGem(A0_34, A1_35)
  end
}
function Initialize()
  local L0_36
  L0_36 = {
    {
      name = "dusty_01",
      type = "dus01",
      node = "locator2_dusty"
    },
    {
      name = "gade_01",
      type = "gad01",
      node = "locator2_gade"
    },
    {
      name = "cyanea_02",
      type = "cya02",
      node = "locator2_cyanea_02",
      active = false
    },
    {
      name = "bit_02",
      type = "bit02",
      node = "locator2_bit_02",
      active = false
    }
  }
  Fn_setupNpc(L0_36)
  Fn_loadNpcEventMotion("gade_01", NPC_MOTION)
  dm04_bit = Fn_findNpcPuppet("bit_02")
  dm04_cyanea = Fn_findNpcPuppet("cyanea_02")
  dm03_gade = Fn_findNpcPuppet("gade_01")
  Fn_sendEventComSb("setCatWarpOption", "dm03_02008", "locator2_return_c")
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_playMotionNpc("gade_01", NPC_MOTION.gade_stay, false, {animBlendDuration = 0.3, isRepeat = true})
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_missionView("dm03_02001")
  waitSeconds(1.3)
  Fn_captionView("dm03_02000")
  dm03_gade_near_task = _npc_found_task(dm03_gade, GADE_FOUND_DIST)
  while dm03_gade_found == false do
    if _dm03_npc_near then
      if _hint_task("dm03_02004") ~= nil then
        _hint_task("dm03_02004"):abort()
      end
      if dm03_gade_near_task ~= nil then
        dm03_gade_near_task:abort()
      end
      dm03_gade_near_task = nil
      Fn_userCtrlAllOff()
      Player:setStay(true)
      Fn_captionView("dm03_02006")
      Fn_lookAtObjectWait(dm03_gade, nil, 0.5)
      Fn_naviSet(dm03_gade)
      waitSeconds(2)
      Fn_userCtrlOn()
      Player:setStay(false)
      _dm03_npc_near = false
    end
    wait()
  end
  Fn_userCtrlAllOff()
  Fn_naviKill()
  Fn_kaiwaDemoView("dm03_00230k")
  RAC_showSPNpc("bit_02")
  RAC_showSPNpcWait("cyanea_02")
  Fn_captionView("dm03_02007")
  waitSeconds(1)
  Fn_lookAtObjectWait("locator2_bit_view")
  waitSeconds(1.5)
  Fn_kaiwaDemoView("dm03_00235k")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if dm03_gade_near_task ~= nil then
    dm03_gade_near_task:abort()
  end
  dm03_gade_near_task = nil
  Fn_naviKill()
end
function pccubesensor2_gade_OnEnter()
  dm03_gade_found = true
  Fn_pcSensorOff("pccubesensor2_gade")
end
function Brief_Navi(A0_37, A1_38)
  invokeTask(function()
    local L0_39, L1_40, L2_41, L3_42
    _dm03_hint = true
    L0_39 = A1_38
    L1_40 = L0_39
    L0_39 = L0_39.getGizmo
    L0_39 = L0_39(L1_40)
    L2_41 = L0_39
    L1_40 = L0_39.getWorldPos
    L1_40 = L1_40(L2_41)
    L2_41 = findGameObject2
    L3_42 = "Node"
    L2_41 = L2_41(L3_42, "locator2_gade")
    L3_42 = L2_41.getWorldPos
    L3_42 = L3_42(L2_41)
    dm_createTrailEffect("ef_ev_trl_01", L1_40, L3_42, A0_37)
    waitSeconds(8)
    _dm03_hint = false
  end)
end
