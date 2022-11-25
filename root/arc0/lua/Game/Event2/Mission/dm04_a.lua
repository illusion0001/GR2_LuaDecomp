dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
FIELD_01 = 1
FIELD_02 = 2
FIELD_03 = 3
FIELD_04 = 4
FIELD_05 = 5
FIELD_MAX = FIELD_05
_enmgen_black_tbl = {}
_enmgen_black_special_tbl = {}
_sdemo = nil
dm04_gade = nil
enmgen2_black_01_special = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant_dark",
      locator = "locator_b01_special",
      name = "blacknevi_special_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_0, A1_1)
  end,
  onUpdate = function(A0_2)
    local L1_3
  end,
  onEnter = function(A0_4)
    local L1_5
  end,
  onLeave = function(A0_6)
    local L1_7
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end
}
enmgen2_black_02_special = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon_dark",
      locator = "locator_b02_special",
      name = "blacknevi_special_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_12, A1_13)
  end,
  onUpdate = function(A0_14)
    local L1_15
  end,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  onObjectAsh = function(A0_22, A1_23)
  end
}
enmgen2_black_03_special = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant_dark",
      locator = "locator_b03_special",
      name = "blacknevi_special_03",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_24, A1_25)
  end,
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
  end
}
enmgen2_black_04_special = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "treecannon_dark",
      locator = "locator_b04_special",
      name = "blacknevi_special_04",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 120,
  onSpawn = function(A0_36, A1_37)
  end,
  onUpdate = function(A0_38)
    local L1_39
  end,
  onEnter = function(A0_40)
    local L1_41
  end,
  onLeave = function(A0_42)
    local L1_43
  end,
  onObjectDead = function(A0_44, A1_45)
  end,
  onObjectAsh = function(A0_46, A1_47)
  end,
  onSetupGem = function(A0_48, A1_49)
    Fn_enemyPopGemSetup(A0_48, {
      A0_48:getSpecTable().spawnSet[1].name
    }, 1, GEM_VITAL)
  end,
  onPopGem = function(A0_50, A1_51)
    Fn_enemyAshPopGem(A0_50, A1_51)
  end
}
enmgen2_black_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b01_01",
      name = "blacknevi_01_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b01_02",
      name = "blacknevi_01_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_52, A1_53)
  end,
  onUpdate = function(A0_54)
    local L1_55
  end,
  onEnter = function(A0_56)
    local L1_57
  end,
  onLeave = function(A0_58)
    local L1_59
  end,
  onObjectDead = function(A0_60, A1_61)
  end,
  onObjectAsh = function(A0_62, A1_63)
  end
}
enmgen2_black_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b02_01",
      name = "blacknevi_02_01",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b02_02",
      name = "blacknevi_02_02",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_64, A1_65)
  end,
  onUpdate = function(A0_66)
    local L1_67
  end,
  onEnter = function(A0_68)
    local L1_69
  end,
  onLeave = function(A0_70)
    local L1_71
  end,
  onObjectDead = function(A0_72, A1_73)
  end,
  onObjectAsh = function(A0_74, A1_75)
  end
}
enmgen2_black_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker_dark",
      locator = "locator_b03_01",
      name = "blacknevi_03_01",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    },
    {
      type = "stalker_dark",
      locator = "locator_b03_02",
      name = "blacknevi_03_02",
      ai_spawn_option = "Stalker/Stalker_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_76, A1_77)
  end,
  onUpdate = function(A0_78)
    local L1_79
  end,
  onEnter = function(A0_80)
    local L1_81
  end,
  onLeave = function(A0_82)
    local L1_83
  end,
  onObjectDead = function(A0_84, A1_85)
  end,
  onObjectAsh = function(A0_86, A1_87)
  end
}
enmgen2_black_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "runner_dark",
      locator = "locator_b04_01",
      name = "blacknevi_04_01",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    },
    {
      type = "runner_dark",
      locator = "locator_b04_02",
      name = "blacknevi_04_02",
      ai_spawn_option = "Runner/Runner_dm04bc_dark"
    }
  },
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 20,
  onSpawn = function(A0_88, A1_89)
  end,
  onUpdate = function(A0_90)
    local L1_91
  end,
  onEnter = function(A0_92)
    local L1_93
  end,
  onLeave = function(A0_94)
    local L1_95
  end,
  onObjectDead = function(A0_96, A1_97)
  end,
  onObjectAsh = function(A0_98, A1_99)
  end
}
function Initialize()
  local L0_100, L1_101, L2_102, L3_103, L4_104
  L0_100 = {L1_101}
  L1_101.name = "gade"
  L1_101.type = "gad01"
  L1_101.node = "locator2_man_01"
  L1_101(L2_102)
  dm04_gade = L1_101
  L1_101(L2_102, L3_103)
  for L4_104 = 1, FIELD_MAX do
    _enmgen_black_special_tbl[L4_104] = findGameObject2("EnemyGenerator", "enmgen2_black_" .. string.format("%02d", L4_104) .. "_special")
    _enmgen_black_tbl[L4_104] = findGameObject2("EnemyGenerator", "enmgen2_black_" .. string.format("%02d", L4_104))
  end
  _sdemo = L1_101
  L1_101(L2_102)
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_coercionPoseNomal()
  for _FORV_3_ = 1, FIELD_MAX do
    _enmgen_black_special_tbl[_FORV_3_]:requestSpawn()
    _enmgen_black_special_tbl[_FORV_3_]:requestIdlingEnemy(true)
    _enmgen_black_special_tbl[_FORV_3_]:setEnemyMarker(false)
    _enmgen_black_tbl[_FORV_3_]:requestSpawn()
    _enmgen_black_tbl[_FORV_3_]:requestIdlingEnemy(true)
    _enmgen_black_tbl[_FORV_3_]:setEnemyMarker(false)
  end
  Fn_loadPlayerMotion({
    "cro01_dlc_lookaround_00"
  })
  _sdemo:reset()
  _sdemo:set("locator2_cam_01", "locator2_aim_01", true)
  _sdemo:play()
  Fn_missionStart()
  _sdemo:play(nil, {
    {
      time = 1,
      pos = "locator2_cam_01"
    }
  })
  while _sdemo:isPlay() do
    wait()
  end
  _sdemo:stop(3)
  waitSeconds(3)
  Fn_playPlayerMotion("cro01_dlc_lookaround_00", 0, 0.2)
  waitSeconds(2)
  dm04_gade:setActive(true)
  Fn_lookAtObjectWait("locator2_gade_view")
  waitSeconds(1)
  Fn_kaiwaDemoView("dm04_00110k")
  Fn_disappearNpc("gade", 60)
  Sound:playSE("pc2_068", 1)
  Fn_captionViewWait("dm04_00100")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_resetCoercionPose()
end
