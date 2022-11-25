dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm09_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/perceivable_npc.lua")
_puppet_tbl = {}
_hdl_tbl = {}
_soldierName = {}
_guardName = {}
_soldierInstance = {}
_guardInstance = {}
_npcTable = {}
_sdemo_play = false
_npc_battle_phase = false
_is_in_event = false
enmgen2_mechsky_c_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_01",
      name = "mechsky_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_01",
      name = "mechsky_sol01",
      target_vehicle = "mechsky_01"
    }
  },
  getEnemyName = function(A0_0, A1_1)
    local L2_2
    L2_2 = A0_0.spawnSet
    L2_2 = L2_2[A1_1]
    L2_2 = L2_2.name
    return L2_2
  end
}
enmgen2_mechsky_c_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_02",
      name = "mechsky_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_02",
      name = "mechsky_sol02",
      target_vehicle = "mechsky_02"
    }
  },
  getEnemyName = function(A0_3, A1_4)
    local L2_5
    L2_5 = A0_3.spawnSet
    L2_5 = L2_5[A1_4]
    L2_5 = L2_5.name
    return L2_5
  end
}
enmgen2_mechsky_c_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_03",
      name = "mechsky_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_03",
      name = "mechsky_sol03",
      target_vehicle = "mechsky_03"
    }
  },
  getEnemyName = function(A0_6, A1_7)
    local L2_8
    L2_8 = A0_6.spawnSet
    L2_8 = L2_8[A1_7]
    L2_8 = L2_8.name
    return L2_8
  end
}
enmgen2_mechsky_c_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_04",
      name = "mechsky_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_04",
      name = "mechsky_sol04",
      target_vehicle = "mechsky_04"
    }
  },
  getEnemyName = function(A0_9, A1_10)
    local L2_11
    L2_11 = A0_9.spawnSet
    L2_11 = L2_11[A1_10]
    L2_11 = L2_11.name
    return L2_11
  end
}
enmgen2_mechsky_c_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_05",
      name = "mechsky_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_05",
      name = "mechsky_sol05",
      target_vehicle = "mechsky_05"
    }
  },
  getEnemyName = function(A0_12, A1_13)
    local L2_14
    L2_14 = A0_12.spawnSet
    L2_14 = L2_14[A1_13]
    L2_14 = L2_14.name
    return L2_14
  end
}
enmgen2_mechsky_c_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_06",
      name = "mechsky_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_06",
      name = "mechsky_sol06",
      target_vehicle = "mechsky_06"
    }
  },
  getEnemyName = function(A0_15, A1_16)
    local L2_17
    L2_17 = A0_15.spawnSet
    L2_17 = L2_17[A1_16]
    L2_17 = L2_17.name
    return L2_17
  end
}
enmgen2_mechsky_c_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_07",
      name = "mechsky_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_07",
      name = "mechsky_sol07",
      target_vehicle = "mechsky_07"
    }
  },
  getEnemyName = function(A0_18, A1_19)
    local L2_20
    L2_20 = A0_18.spawnSet
    L2_20 = L2_20[A1_19]
    L2_20 = L2_20.name
    return L2_20
  end
}
enmgen2_mechsky_c_08 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_08",
      name = "mechsky_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_08",
      name = "mechsky_sol08",
      target_vehicle = "mechsky_08"
    }
  },
  getEnemyName = function(A0_21, A1_22)
    local L2_23
    L2_23 = A0_21.spawnSet
    L2_23 = L2_23[A1_22]
    L2_23 = L2_23.name
    return L2_23
  end
}
enmgen2_mechsky_c_09 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_09",
      name = "mechsky_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_09",
      name = "mechsky_sol09",
      target_vehicle = "mechsky_09"
    }
  },
  getEnemyName = function(A0_24, A1_25)
    local L2_26
    L2_26 = A0_24.spawnSet
    L2_26 = L2_26[A1_25]
    L2_26 = L2_26.name
    return L2_26
  end
}
enmgen2_mechsky_c_10 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_10",
      name = "mechsky_10"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_10",
      name = "mechsky_sol10",
      target_vehicle = "mechsky_10"
    }
  },
  getEnemyName = function(A0_27, A1_28)
    local L2_29
    L2_29 = A0_27.spawnSet
    L2_29 = L2_29[A1_28]
    L2_29 = L2_29.name
    return L2_29
  end
}
enmgen2_mechsky_c_11 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_11",
      name = "mechsky_11"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_11",
      name = "mechsky_sol11",
      target_vehicle = "mechsky_11"
    }
  },
  getEnemyName = function(A0_30, A1_31)
    local L2_32
    L2_32 = A0_30.spawnSet
    L2_32 = L2_32[A1_31]
    L2_32 = L2_32.name
    return L2_32
  end
}
enmgen2_mechsky_c_12 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_12",
      name = "mechsky_12"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_12",
      name = "mechsky_sol12",
      target_vehicle = "mechsky_12"
    }
  },
  getEnemyName = function(A0_33, A1_34)
    local L2_35
    L2_35 = A0_33.spawnSet
    L2_35 = L2_35[A1_34]
    L2_35 = L2_35.name
    return L2_35
  end
}
enmgen2_mechsky_c_13 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_13",
      name = "mechsky_13"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_13",
      name = "mechsky_sol13",
      target_vehicle = "mechsky_13"
    }
  },
  getEnemyName = function(A0_36, A1_37)
    local L2_38
    L2_38 = A0_36.spawnSet
    L2_38 = L2_38[A1_37]
    L2_38 = L2_38.name
    return L2_38
  end
}
enmgen2_mechsky_c_14 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_14",
      name = "mechsky_14"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_14",
      name = "mechsky_sol14",
      target_vehicle = "mechsky_14"
    }
  },
  getEnemyName = function(A0_39, A1_40)
    local L2_41
    L2_41 = A0_39.spawnSet
    L2_41 = L2_41[A1_40]
    L2_41 = L2_41.name
    return L2_41
  end
}
enmgen2_mechsky_c_15 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_15",
      name = "mechsky_15"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_15",
      name = "mechsky_sol15",
      target_vehicle = "mechsky_15"
    }
  },
  getEnemyName = function(A0_42, A1_43)
    local L2_44
    L2_44 = A0_42.spawnSet
    L2_44 = L2_44[A1_43]
    L2_44 = L2_44.name
    return L2_44
  end
}
enmgen2_mechsky_c_16 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_c_16",
      name = "mechsky_16"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_c_16",
      name = "mechsky_sol16",
      target_vehicle = "mechsky_16"
    }
  },
  getEnemyName = function(A0_45, A1_46)
    local L2_47
    L2_47 = A0_45.spawnSet
    L2_47 = L2_47[A1_46]
    L2_47 = L2_47.name
    return L2_47
  end
}
function Initialize()
  local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53
  L0_48 = {
    L1_49,
    L2_50,
    L3_51,
    L4_52,
    L5_53,
    {
      name = "sm09_soldier_03",
      type = "soldier",
      node = "locator2_soldier_c_03",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_04",
      type = "soldier",
      node = "locator2_soldier_c_04",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_05",
      type = "soldier",
      node = "locator2_soldier_c_05",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_06",
      type = "soldier",
      node = "locator2_soldier_c_06",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_07",
      type = "soldier",
      node = "locator2_soldier_c_07",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_08",
      type = "soldier",
      node = "locator2_soldier_c_08",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_09",
      type = "soldier",
      node = "locator2_soldier_c_09",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_10",
      type = "soldier",
      node = "locator2_soldier_c_10",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_11",
      type = "soldier",
      node = "locator2_soldier_c_11",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_12",
      type = "soldier",
      node = "locator2_soldier_c_12",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_13",
      type = "soldier",
      node = "locator2_soldier_c_13",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_14",
      type = "soldier",
      node = "locator2_soldier_c_14",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_15",
      type = "soldier",
      node = "locator2_soldier_c_15",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_16",
      type = "soldier",
      node = "locator2_soldier_c_16",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_01",
      type = "soldier",
      node = "locator2_guard_c_01",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_02",
      type = "soldier",
      node = "locator2_guard_c_02",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_03",
      type = "soldier",
      node = "locator2_guard_c_03",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_04",
      type = "soldier",
      node = "locator2_guard_c_04",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_05",
      type = "soldier",
      node = "locator2_guard_c_05",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_06",
      type = "soldier",
      node = "locator2_guard_c_06",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_07",
      type = "soldier",
      node = "locator2_guard_c_07",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_08",
      type = "soldier",
      node = "locator2_guard_c_08",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_09",
      type = "soldier",
      node = "locator2_guard_c_09",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_10",
      type = "soldier",
      node = "locator2_guard_c_10",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_11",
      type = "soldier",
      node = "locator2_guard_c_11",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_12",
      type = "soldier",
      node = "locator2_guard_c_12",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_13",
      type = "soldier",
      node = "locator2_guard_c_13",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_14",
      type = "soldier",
      node = "locator2_guard_c_14",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_15",
      type = "soldier",
      node = "locator2_guard_c_15",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_16",
      type = "soldier",
      node = "locator2_guard_c_16",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_17",
      type = "soldier",
      node = "locator2_guard_c_17",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_18",
      type = "soldier",
      node = "locator2_guard_c_18",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_19",
      type = "soldier",
      node = "locator2_guard_c_19",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_20",
      type = "soldier",
      node = "locator2_guard_c_20",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_21",
      type = "soldier",
      node = "locator2_guard_c_21",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_22",
      type = "soldier",
      node = "locator2_guard_c_22",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_23",
      type = "soldier",
      node = "locator2_guard_c_23",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_24",
      type = "soldier",
      node = "locator2_guard_c_24",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_25",
      type = "soldier",
      node = "locator2_guard_c_25",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_26",
      type = "soldier",
      node = "locator2_guard_c_26",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_27",
      type = "soldier",
      node = "locator2_guard_c_27",
      active = true,
      attach = false
    }
  }
  L1_49.name = "sm09_gun_01"
  L1_49.type = "man56"
  L1_49.node = "locator2_gunjin_c_01"
  L1_49.active = true
  L1_49.attach = false
  L2_50.name = "sm09_gun_02"
  L2_50.type = "soldier"
  L2_50.node = "locator2_gunjin_c_02"
  L2_50.active = true
  L2_50.attach = false
  L3_51.name = "sm09_gun_03"
  L3_51.type = "soldier"
  L3_51.node = "locator2_gunjin_c_03"
  L3_51.active = true
  L3_51.attach = false
  L4_52 = {}
  L4_52.name = "sm09_soldier_01"
  L4_52.type = "soldier"
  L4_52.node = "locator2_soldier_c_01"
  L4_52.active = true
  L4_52.attach = false
  L5_53 = {}
  L5_53.name = "sm09_soldier_02"
  L5_53.type = "soldier"
  L5_53.node = "locator2_soldier_c_02"
  L5_53.active = true
  L5_53.attach = false
  L1_49(L2_50)
  for L4_52, L5_53 in L1_49(L2_50) do
    _puppet_tbl[L5_53.name] = Fn_findNpcPuppet(L5_53.name)
    _hdl_tbl[L5_53.name] = Fn_findNpc(L5_53.name)
  end
  for L4_52 = 1, SOLDIER_MAX do
    L5_53 = "sm09_soldier_"
    L5_53 = L5_53 .. string.format("%02d", L4_52)
    table.insert(_soldierName, L5_53)
    Fn_loadNpcEventMotion(L5_53, SOL_MOTION_LIST)
  end
  for L4_52 = 1, GUARD_MAX do
    L5_53 = "sm09_guard_"
    L5_53 = L5_53 .. string.format("%02d", L4_52)
    table.insert(_guardName, L5_53)
    Fn_loadNpcEventMotion(L5_53, SOL_MOTION_LIST)
  end
  L1_49(L2_50)
  L1_49()
  _sdemo_road_closed = L1_49
  _sdemo_battle = L1_49
end
function Ingame()
  local L0_54, L1_55
  L0_54 = Fn_sendEventComSb
  L1_55 = "getMissionPart"
  L0_54 = L0_54(L1_55)
  _part = L0_54
  L0_54 = setupAreaModel
  L0_54()
  L0_54 = Fn_resetPcPos
  L1_55 = "locator2_pc_start_pos"
  L0_54(L1_55, Player.kReset_Falling)
  L0_54 = setupMechSkyTask
  L1_55 = _part
  L0_54(L1_55)
  L0_54 = npcInit_soldier
  L1_55 = _part
  L0_54(L1_55)
  L0_54 = Player
  L1_55 = L0_54
  L0_54 = L0_54.setSituation
  L0_54(L1_55, Player.kSituation_Normal, true, 0, true, false)
  L0_54 = Fn_warpNpc
  L1_55 = "sm09_client"
  L0_54(L1_55, "locator2_reset_client_01")
  L0_54 = Fn_playMotionNpc
  L1_55 = "sm09_gun_01"
  L0_54(L1_55, "lookaround_02", false)
  L0_54 = Fn_missionStart
  L0_54()
  L0_54 = Fn_setCatWarpCheckPoint
  L1_55 = "locator2_pc_start_pos"
  L0_54(L1_55)
  L0_54 = Fn_kaiwaDemoView
  L1_55 = "sm09_00300k"
  L0_54(L1_55)
  L0_54 = periodicMotionChange
  L0_54 = L0_54()
  L1_55 = invokeTask
  L1_55 = L1_55(function()
    repeat
      if _sdemo_play then
        Player:setStay(true, false)
        _sdemo_road_closed:set("locator2_road_closed_cam_01", "locator2_road_closed_aim_01", false, Vector(0, 0, 0))
        _sdemo_road_closed:switchCamera(true)
        Fn_captionViewWait("sm09_02000")
        _sdemo_road_closed:switchCamera(false)
        Player:setStay(false)
        _sdemo_play = false
      end
      wait()
    until false
  end)
  Fn_userCtrlOn()
  thirdMissionView()
  Fn_playMotionNpc("sm09_client", "scared_00", false)
  _is_rescue = false
  Mv_waitPhase()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_battle_area_01")
  L1_55 = Mv_safeTaskAbort(L1_55)
  Player:setStay(true, true)
  _sdemo_battle:set("locator2_sdemo_battle_cam_01", "locator2_sdemo_battle_aim_01", false)
  _sdemo_battle:setCameraParam(nil, nil, {deg = 35})
  _sdemo_battle:switchCamera(true)
  _npc_battle_phase = true
  _is_in_event = true
  Fn_setCatWarpCheckPoint("locator2_pc_reset_battle_start")
  Fn_captionViewWait("sm09_02001")
  Fn_captionViewWait("sm09_02002")
  _soldierInstance[13]:setDamageType(1)
  _soldierInstance[13]:setIndicationEnable(true)
  _soldierInstance[13]:action()
  _sdemo_battle:switchCamera(false)
  Player:setStay(false)
  Fn_missionView("sm09_02007")
  _is_in_event = false
  repeat
    wait()
  until _is_rescue
  Fn_playMotionNpc("sm09_client", "scared_out_00", true)
  Fn_blackout()
  Fn_resetPcPos("locator2_pc_reset_battle_end")
  L0_54 = Mv_safeTaskAbort(L0_54)
  enemyResetRelocation(_part)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_exitSandbox()
  Fn_nextMission()
end
function Finalize()
  local L0_56, L1_57
end
function pccubesensor2_escape_hatch_03_OnEnter()
  Fn_pcSensorOff("pccubesensor2_escape_hatch_03")
  _sdemo_play = true
end
function pccubesensormulti2_corner_01_OnEnter()
  Fn_pcSensorOff("pccubesensormulti2_corner_01")
  Fn_captionView("sm09_02003")
end
function pccubesensor2_dead_end_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_dead_end_01")
  Mv_viewObj("locator2_wall_view_01")
  Fn_captionView("sm09_02004")
end
function pccubesensor2_battle_area_01_OnEnter()
  Mv_gotoNextPhase()
end
function thirdMissionView()
  Mv_invokeMissionViewNaviCaption("sm09_02005", "locator2_reset_client_01", "sm09_02006")
end
function Retry(A0_58)
  if _now_retry or _is_in_event then
    return
  end
  _now_retry = true
  Fn_naviKill()
  invokeTask(function()
    Player:setStay(true, false)
    CautionLevel.setKeepVisible(false)
    CautionLevel.allTerminate()
    _mechskytask = Mv_safeTaskAbort(_mechskytask)
    soldierTurnAction()
    villainTurnAction()
    playerRetryAction(A0_58)
    Fn_blackout()
    Fn_sendEventComSb("restoreHideObject")
    containerRestoreForce()
    enemyResetRelocation(_part)
    Fn_recoverEnergyFully()
    npcInit_soldier(_part)
    if not _npc_battle_phase then
      Fn_resetPcPos("locator2_pc_start_pos", Player.kReset_Falling)
      Fn_pcSensorOn("pccubesensor2_escape_hatch_03")
    else
      Fn_resetPcPos("locator2_pc_reset_battle_start")
      _soldierInstance[13]:setDamageType(1)
      _soldierInstance[13]:setIndicationEnable(true)
      _soldierInstance[13]:action()
    end
    setupMechSkyTask(_part)
    Fn_coercionPoseNomal()
    Fn_fadein()
    Player:setStay(false)
    restartCaptionView()
    _found_to_enemy = false
    _is_seen_the_enemy = false
    _change_enemy_dead_num = 0
    _now_retry = false
    if not _npc_battle_phase then
      thirdMissionView()
    else
      Fn_missionView("sm09_02007")
    end
  end)
end
