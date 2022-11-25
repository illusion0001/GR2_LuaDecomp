dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/dm03_common.lua")
dm03_puppet_tbl = {}
dm03_cyanea_found = false
dm03_nevi_hint = false
dm03_sdemo = nil
dm03_bit = nil
dm03_cyanea = nil
dm03_cyanea_near_task = nil
dm03_effect_num = 0
CYANEA_FOUND_DIST = 50
enmgen2_cluster_dt = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01_01",
      name = "stalker_01"
    },
    {
      type = "stalker",
      locator = "locator_01_02",
      name = "runner_02"
    },
    {
      type = "stalker",
      locator = "locator_01_03",
      name = "stalker_03"
    },
    {
      type = "stalker",
      locator = "locator_01_04",
      name = "stalker_04"
    },
    {
      type = "runner",
      locator = "locator_01_05",
      name = "runner_05"
    },
    {
      type = "stalker",
      locator = "locator_01_06",
      name = "stalker_06"
    },
    {
      type = "stalker",
      locator = "locator_01_07",
      name = "stalker_07"
    },
    {
      type = "guardcore",
      locator = "locator_01_08",
      name = "guardcore_08"
    },
    {
      type = "stalker",
      locator = "locator_01_09",
      name = "stalker_29"
    },
    {
      type = "stalker",
      locator = "locator_01_10",
      name = "stalker_10"
    },
    {
      type = "runner",
      locator = "locator_01_11",
      name = "runner_11"
    },
    {
      type = "stalker",
      locator = "locator_01_12",
      name = "stalker_12"
    },
    {
      type = "stalker",
      locator = "locator_01_13",
      name = "stalker_13"
    },
    {
      type = "stalker",
      locator = "locator_01_14",
      name = "stalker_14"
    },
    {
      type = "guardcore",
      locator = "locator_01_15",
      name = "guardcore_15"
    },
    {
      type = "gellyfish",
      locator = "locator_01_16",
      name = "gellyfish_16"
    },
    {
      type = "gellyfish",
      locator = "locator_01_17",
      name = "gellyfish_17"
    },
    {
      type = "gellyfish",
      locator = "locator_01_18",
      name = "gellyfish_18"
    },
    {
      type = "gellyfish",
      locator = "locator_01_19",
      name = "gellyfish_19"
    },
    {
      type = "gellyfish",
      locator = "locator_01_20",
      name = "gellyfish_20"
    },
    {
      type = "gellyfish",
      locator = "locator_01_21",
      name = "gellyfish_21"
    },
    {
      type = "gellyfish",
      locator = "locator_01_22",
      name = "gellyfish_22"
    },
    {
      type = "gellyfish",
      locator = "locator_01_23",
      name = "gellyfish_23"
    },
    {
      type = "gellyfish",
      locator = "locator_01_24",
      name = "gellyfish_24"
    },
    {
      type = "gellyfish",
      locator = "locator_01_25",
      name = "gellyfish_25"
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
      "stalker_01",
      "stalker_03",
      "stalker_04",
      "stalker_06",
      "stalker_07",
      "stalker_29",
      "stalker_10",
      "stalker_12",
      "stalker_13",
      "stalker_14"
    }, 3, GEM_VITAL)
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
      type = "stalker",
      locator = "locator_01_01",
      name = "stalker_11"
    },
    {
      type = "runner",
      locator = "locator_01_02",
      name = "runner_12"
    },
    {
      type = "stalker",
      locator = "locator_01_03",
      name = "stalker_23"
    },
    {
      type = "runner",
      locator = "locator_01_04",
      name = "runner_04"
    },
    {
      type = "stalker",
      locator = "locator_01_05",
      name = "stalker_05"
    },
    {
      type = "runner",
      locator = "locator_01_06",
      name = "runner_06"
    },
    {
      type = "stalker",
      locator = "locator_01_07",
      name = "stalker_17"
    },
    {
      type = "runner",
      locator = "locator_01_08",
      name = "runner_08"
    },
    {
      type = "stalker",
      locator = "locator_01_09",
      name = "stalker_09"
    },
    {
      type = "runner",
      locator = "locator_01_10",
      name = "runner_10"
    },
    {
      type = "stalker",
      locator = "locator_01_11",
      name = "stalker_31"
    },
    {
      type = "runner",
      locator = "locator_01_12",
      name = "runner_42"
    },
    {
      type = "gellyfish",
      locator = "locator_01_13",
      name = "gellyfish_43"
    },
    {
      type = "gellyfish",
      locator = "locator_01_14",
      name = "gellyfish_44"
    },
    {
      type = "gellyfish",
      locator = "locator_01_15",
      name = "gellyfish_45"
    },
    {
      type = "gellyfish",
      locator = "locator_01_16",
      name = "gellyfish_26"
    },
    {
      type = "gellyfish",
      locator = "locator_01_17",
      name = "gellyfish_27"
    },
    {
      type = "gellyfish",
      locator = "locator_01_18",
      name = "gellyfish_28"
    },
    {
      type = "gellyfish",
      locator = "locator_01_19",
      name = "gellyfish_29"
    },
    {
      type = "gellyfish",
      locator = "locator_01_20",
      name = "gellyfish_30"
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
      "stalker_11",
      "stalker_23",
      "stalker_05",
      "stalker_17",
      "stalker_09",
      "stalker_31"
    }, 3, GEM_VITAL)
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
      type = "stalker",
      locator = "locator_01_02",
      name = "stalker_02"
    },
    {
      type = "runner",
      locator = "locator_01_03",
      name = "runner_03"
    },
    {
      type = "guardcore",
      locator = "locator_01_04",
      name = "guardcore_04"
    },
    {
      type = "stalker",
      locator = "locator_01_05",
      name = "stalker_45"
    },
    {
      type = "stalker",
      locator = "locator_01_06",
      name = "stalker_16"
    },
    {
      type = "runner",
      locator = "locator_01_07",
      name = "runner_07"
    },
    {
      type = "guardcore",
      locator = "locator_01_08",
      name = "guardcore_18"
    },
    {
      type = "stalker",
      locator = "locator_01_09",
      name = "stalker_19"
    },
    {
      type = "stalker",
      locator = "locator_01_10",
      name = "stalker_41"
    },
    {
      type = "runner",
      locator = "locator_01_11",
      name = "runner_21"
    },
    {
      type = "gellyfish",
      locator = "locator_01_12",
      name = "gellyfish_32"
    },
    {
      type = "gellyfish",
      locator = "locator_01_13",
      name = "gellyfish_33"
    },
    {
      type = "gellyfish",
      locator = "locator_01_14",
      name = "gellyfish_34"
    },
    {
      type = "gellyfish",
      locator = "locator_01_15",
      name = "gellyfish_35"
    },
    {
      type = "gellyfish",
      locator = "locator_01_16",
      name = "gellyfish_36"
    },
    {
      type = "gellyfish",
      locator = "locator_01_17",
      name = "gellyfish_37"
    },
    {
      type = "gellyfish",
      locator = "locator_01_18",
      name = "gellyfish_38"
    },
    {
      type = "gellyfish",
      locator = "locator_01_19",
      name = "gellyfish_39"
    },
    {
      type = "gellyfish",
      locator = "locator_01_20",
      name = "gellyfish_40"
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
      "stalker_21",
      "stalker_02",
      "stalker_45",
      "stalker_16",
      "stalker_19",
      "stalker_41"
    }, 3, GEM_VITAL)
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
      name = "cyanea_02",
      type = "cya01",
      node = "locator2_cyanea"
    },
    {
      name = "bit_01",
      type = "bit02",
      node = "locator2_bit"
    }
  }
  Fn_setupNpc(L0_36)
  Fn_loadNpcEventMotion("cyanea_02", NPC_MOTION)
  dm03_bit = Fn_findNpcPuppet("bit_01")
  dm03_bit:setActive(false)
  dm03_cyanea = Fn_findNpcPuppet("cyanea_02")
  dm03_sdemo = SDemo.create("dm03_cut01")
end
function Ingame()
  local L0_37, L1_38
  L0_37 = Fn_userCtrlAllOff
  L0_37()
  L0_37 = findGameObject2
  L1_38 = "EnemyGenerator"
  L0_37 = L0_37(L1_38, "enmgen2_cluster_dt")
  L1_38 = L0_37
  L0_37 = L0_37.requestIdlingEnemy
  L0_37(L1_38, true)
  L0_37 = Fn_playMotionNpc
  L1_38 = "cyanea_02"
  L0_37(L1_38, NPC_MOTION.cya_stay, false, {animBlendDuration = 0.3, isRepeat = true})
  L0_37 = findGameObject2
  L1_38 = "Node"
  L0_37 = L0_37(L1_38, "locator2_aim_01")
  L1_38 = findGameObject2
  L1_38 = L1_38("Node", "locator2_cam_01")
  dm03_sdemo:reset()
  dm03_sdemo:set(L1_38, L0_37, false)
  dm03_sdemo:play()
  Fn_missionStart()
  Fn_captionViewWait("dm03_01000")
  Fn_captionView("dm03_01002")
  Fn_resetPcPos("locator2_pc_start_pos")
  waitSeconds(1)
  while dm03_sdemo:isPlay() do
    wait()
  end
  dm03_sdemo:stop(3)
  Fn_missionView("dm03_01001")
  waitSeconds(3)
  findGameObject2("EnemyGenerator", "enmgen2_cluster_dt"):requestIdlingEnemy(false)
  Fn_userCtrlOn()
  Player:setStay(false)
  dm03_cyanea_near_task = _npc_found_task(dm03_cyanea, CYANEA_FOUND_DIST)
  while dm03_cyanea_found == false do
    if _dm03_npc_near then
      if _hint_task("dm03_01003") ~= nil then
        _hint_task("dm03_01003"):abort()
      end
      if dm03_cyanea_near_task ~= nil then
        dm03_cyanea_near_task:abort()
      end
      dm03_cyanea_near_task = nil
      Fn_userCtrlAllOff()
      Player:setStay(true)
      Fn_captionView("dm03_01006")
      Fn_lookAtObjectWait(dm03_cyanea, nil, 0.5)
      Fn_naviSet(dm03_cyanea)
      waitSeconds(2)
      Fn_userCtrlOn()
      Player:setStay(false)
      _dm03_npc_near = false
    end
    wait()
  end
  Fn_naviKill()
  findGameObject2("EnemyGenerator", "enmgen2_cluster_cc"):requestAllEnemyKill()
  findGameObject2("EnemyGenerator", "enmgen2_cluster_dt"):requestAllEnemyKill()
  findGameObject2("EnemyGenerator", "enmgen2_cluster_mt"):requestAllEnemyKill()
  findGameObject2("EnemyGenerator", "enmgen2_cluster_ed"):requestAllEnemyKill()
  Fn_userCtrlAllOff()
  wait()
  Fn_kaiwaDemoView("dm03_00220k")
  RAC_showSPNpc("bit_01")
  Fn_lookAtObjectWait(dm03_bit, nil, 0.5)
  waitSeconds(2.5)
  Fn_kaiwaDemoView("dm03_00225k")
  RAC_disappearSPNpc("bit_01")
  RAC_disappearSPNpc("cyanea_02")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if dm03_cyanea_near_task ~= nil then
    dm03_cyanea_near_task:abort()
  end
  dm03_cyanea_near_task = nil
end
function pccubesensor2_cyanea_OnEnter()
  dm03_cyanea_found = true
  Fn_pcSensorOff("pccubesensor2_cyanea")
end
function Brief_Navi(A0_39, A1_40)
  invokeTask(function()
    local L0_41, L1_42, L2_43, L3_44
    _dm03_hint = true
    L0_41 = A1_40
    L1_42 = L0_41
    L0_41 = L0_41.getGizmo
    L0_41 = L0_41(L1_42)
    L2_43 = L0_41
    L1_42 = L0_41.getWorldPos
    L1_42 = L1_42(L2_43)
    L2_43 = findGameObject2
    L3_44 = "Node"
    L2_43 = L2_43(L3_44, "locator2_cyanea")
    L3_44 = L2_43.getWorldPos
    L3_44 = L3_44(L2_43)
    dm_createTrailEffect("ef_ev_trl_01", L1_42, L3_44, A0_39)
    dm03_effect_num = dm03_effect_num + 1
    if dm03_nevi_hint == false then
      Fn_captionView("dm03_01007")
      dm03_nevi_hint = true
    end
    waitSeconds(8)
    dm03_effect_num = dm03_effect_num - 1
    _dm03_hint = false
    if dm03_nevi_hint == true and dm03_effect_num <= 0 then
      Fn_captionView("dm03_01008")
      dm03_nevi_hint = false
    end
  end)
end
