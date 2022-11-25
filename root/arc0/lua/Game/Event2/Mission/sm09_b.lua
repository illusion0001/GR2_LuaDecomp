dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm09_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/perceivable_npc.lua")
_hint_time = 0
_puppet_tbl = {}
_soldierName = {}
_guardName = {}
_soldierInstance = {}
_guardInstance = {}
_npcTable = {}
_sdemo_mechskytask = nil
_sdemo_enmgen = nil
_escape_hatch_view_task = nil
_mission_phase = 0
_pcreset_pos = nil
_shortcut_flag = false
_photo = nil
_is_success = false
enmgen2_sdemo_mechsky = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_sdemo_mechsky",
      name = "sdemo_mechsky"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_sdemo_mechsky",
      name = "sdemo_mechsky_sol01",
      target_vehicle = "sdemo_mechsky"
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
enmgen2_mechsky_b_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_01",
      name = "mechsky_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_01",
      name = "mechsky_sol01",
      target_vehicle = "mechsky_01"
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
enmgen2_mechsky_b_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_02",
      name = "mechsky_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_02",
      name = "mechsky_sol02",
      target_vehicle = "mechsky_02"
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
enmgen2_mechsky_b_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_03",
      name = "mechsky_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_03",
      name = "mechsky_sol03",
      target_vehicle = "mechsky_03"
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
enmgen2_mechsky_b_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_04",
      name = "mechsky_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_04",
      name = "mechsky_sol04",
      target_vehicle = "mechsky_04"
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
enmgen2_mechsky_b_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_05",
      name = "mechsky_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_05",
      name = "mechsky_sol05",
      target_vehicle = "mechsky_05"
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
enmgen2_mechsky_b_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_06",
      name = "mechsky_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_06",
      name = "mechsky_sol06",
      target_vehicle = "mechsky_06"
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
enmgen2_mechsky_b_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_07",
      name = "mechsky_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_07",
      name = "mechsky_sol07",
      target_vehicle = "mechsky_07"
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
enmgen2_mechsky_b_08 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_08",
      name = "mechsky_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_08",
      name = "mechsky_sol08",
      target_vehicle = "mechsky_08"
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
enmgen2_mechsky_b_09 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_09",
      name = "mechsky_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_09",
      name = "mechsky_sol09",
      target_vehicle = "mechsky_09"
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
enmgen2_mechsky_b_10 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_10",
      name = "mechsky_10"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_10",
      name = "mechsky_sol10",
      target_vehicle = "mechsky_10"
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
enmgen2_mechsky_b_11 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_11",
      name = "mechsky_11"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_11",
      name = "mechsky_sol11",
      target_vehicle = "mechsky_11"
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
enmgen2_mechsky_b_12 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_12",
      name = "mechsky_12"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_12",
      name = "mechsky_sol12",
      target_vehicle = "mechsky_12"
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
enmgen2_mechsky_b_13 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_13",
      name = "mechsky_13"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_13",
      name = "mechsky_sol13",
      target_vehicle = "mechsky_13"
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
enmgen2_mechsky_b_14 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_14",
      name = "mechsky_14"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_14",
      name = "mechsky_sol14",
      target_vehicle = "mechsky_14"
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
enmgen2_mechsky_b_15 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_15",
      name = "mechsky_15"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_15",
      name = "mechsky_sol15",
      target_vehicle = "mechsky_15"
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
enmgen2_mechsky_b_16 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_b_16",
      name = "mechsky_16"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_b_16",
      name = "mechsky_sol16",
      target_vehicle = "mechsky_16"
    }
  },
  getEnemyName = function(A0_48, A1_49)
    local L2_50
    L2_50 = A0_48.spawnSet
    L2_50 = L2_50[A1_49]
    L2_50 = L2_50.name
    return L2_50
  end
}
function Initialize()
  local L0_51, L1_52, L2_53, L3_54, L4_55, L5_56
  L0_51 = Fn_pcSensorOff
  L0_51(L1_52)
  L0_51 = Fn_pcSensorOff
  L0_51(L1_52)
  L0_51 = Fn_pcSensorOff
  L0_51(L1_52)
  L0_51 = Fn_pcSensorOff
  L0_51(L1_52)
  L0_51 = {
    L1_52,
    L2_53,
    L3_54,
    L4_55,
    L5_56,
    {
      name = "sm09_soldier_03",
      type = "soldier",
      node = "locator2_soldier_b_03",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_04",
      type = "soldier",
      node = "locator2_soldier_b_04",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_05",
      type = "soldier",
      node = "locator2_soldier_b_05",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_06",
      type = "soldier",
      node = "locator2_soldier_b_06",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_07",
      type = "soldier",
      node = "locator2_soldier_b_07",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_08",
      type = "soldier",
      node = "locator2_soldier_b_08",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_09",
      type = "soldier",
      node = "locator2_soldier_b_09",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_10",
      type = "soldier",
      node = "locator2_soldier_b_10",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_11",
      type = "soldier",
      node = "locator2_soldier_b_11",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_12",
      type = "soldier",
      node = "locator2_soldier_b_12",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_13",
      type = "soldier",
      node = "locator2_soldier_b_13",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_14",
      type = "soldier",
      node = "locator2_soldier_b_14",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_15",
      type = "soldier",
      node = "locator2_soldier_b_15",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_16",
      type = "soldier",
      node = "locator2_soldier_b_16",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_01",
      type = "soldier",
      node = "locator2_guard_b_01",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_02",
      type = "soldier",
      node = "locator2_guard_b_02",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_03",
      type = "soldier",
      node = "locator2_guard_b_03",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_04",
      type = "soldier",
      node = "locator2_guard_b_04",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_05",
      type = "soldier",
      node = "locator2_guard_b_05",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_06",
      type = "soldier",
      node = "locator2_guard_b_06",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_07",
      type = "soldier",
      node = "locator2_guard_b_07",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_08",
      type = "soldier",
      node = "locator2_guard_b_08",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_09",
      type = "soldier",
      node = "locator2_guard_b_09",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_10",
      type = "soldier",
      node = "locator2_guard_b_10",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_11",
      type = "soldier",
      node = "locator2_guard_b_11",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_12",
      type = "soldier",
      node = "locator2_guard_b_12",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_13",
      type = "soldier",
      node = "locator2_guard_b_13",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_14",
      type = "soldier",
      node = "locator2_guard_b_14",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_15",
      type = "soldier",
      node = "locator2_guard_b_15",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_16",
      type = "soldier",
      node = "locator2_guard_b_16",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_17",
      type = "soldier",
      node = "locator2_guard_b_17",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_18",
      type = "soldier",
      node = "locator2_guard_b_18",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_19",
      type = "soldier",
      node = "locator2_guard_b_19",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_20",
      type = "soldier",
      node = "locator2_guard_b_20",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_21",
      type = "soldier",
      node = "locator2_guard_b_21",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_22",
      type = "soldier",
      node = "locator2_guard_b_22",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_23",
      type = "soldier",
      node = "locator2_guard_b_23",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_24",
      type = "soldier",
      node = "locator2_guard_b_24",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_25",
      type = "soldier",
      node = "locator2_guard_b_25",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_26",
      type = "soldier",
      node = "locator2_guard_b_26",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_27",
      type = "soldier",
      node = "locator2_guard_b_27",
      active = true,
      attach = false
    }
  }
  L1_52.name = "sm09_gun_01"
  L1_52.type = "man56"
  L1_52.node = "locator2_gunjin_01_b_move_01"
  L1_52.active = true
  L1_52.attach = false
  L2_53.name = "sm09_gun_02"
  L2_53.type = "soldier"
  L2_53.node = "locator2_gunjin_02_b_move_01"
  L2_53.active = true
  L2_53.attach = false
  L3_54.name = "sm09_gun_03"
  L3_54.type = "soldier"
  L3_54.node = "locator2_gunjin_03_b_move_01"
  L3_54.active = true
  L3_54.attach = false
  L4_55 = {}
  L4_55.name = "sm09_soldier_01"
  L4_55.type = "soldier"
  L4_55.node = "locator2_soldier_b_01"
  L4_55.active = true
  L4_55.attach = false
  L5_56 = {}
  L5_56.name = "sm09_soldier_02"
  L5_56.type = "soldier"
  L5_56.node = "locator2_soldier_b_02"
  L5_56.active = true
  L5_56.attach = false
  L1_52(L2_53)
  for L4_55, L5_56 in L1_52(L2_53) do
    _puppet_tbl[L5_56.name] = Fn_findNpcPuppet(L5_56.name)
  end
  for L4_55 = 2, VILLAIN_MAX do
    L5_56 = "sm09_gun_"
    L5_56 = L5_56 .. string.format("%02d", L4_55)
    Fn_loadNpcEventMotion(L5_56, SOL_MOTION_LIST)
  end
  for L4_55 = 1, SOLDIER_MAX do
    L5_56 = "sm09_soldier_"
    L5_56 = L5_56 .. string.format("%02d", L4_55)
    table.insert(_soldierName, L5_56)
    Fn_loadNpcEventMotion(L5_56, SOL_MOTION_LIST)
  end
  for L4_55 = 1, GUARD_MAX do
    L5_56 = "sm09_guard_"
    L5_56 = L5_56 .. string.format("%02d", L4_55)
    table.insert(_guardName, L5_56)
    Fn_loadNpcEventMotion(L5_56, SOL_MOTION_LIST)
  end
  L1_52(L2_53)
  L1_52()
  _sdemo_trade_place = L1_52
  _sdemo_escape_hatch = L1_52
end
function Ingame()
  local L0_57, L1_58, L2_59, L3_60, L4_61
  L0_57 = Fn_sendEventComSb
  L1_58 = "getMissionPart"
  L0_57 = L0_57(L1_58)
  _part = L0_57
  L0_57 = setupAreaModel
  L0_57()
  L0_57 = setupMechSkyTask
  L1_58 = _part
  L0_57(L1_58)
  L0_57 = setupSdemoMechSkyTask
  L0_57()
  L0_57 = npcInit_soldier
  L1_58 = _part
  L0_57(L1_58)
  L0_57 = Player
  L1_58 = L0_57
  L0_57 = L0_57.setSituation
  L2_59 = Player
  L2_59 = L2_59.kSituation_Normal
  L3_60 = true
  L4_61 = 0
  L0_57(L1_58, L2_59, L3_60, L4_61, true, false)
  L0_57 = _sdemo_trade_place
  L1_58 = L0_57
  L0_57 = L0_57.set
  L2_59 = "locator2_cam_discover_01"
  L3_60 = "locator2_aim_discover_01"
  L4_61 = false
  L0_57(L1_58, L2_59, L3_60, L4_61)
  L0_57 = _sdemo_trade_place
  L1_58 = L0_57
  L0_57 = L0_57.setCameraParam
  L2_59, L3_60 = nil, nil
  L4_61 = {}
  L4_61.deg = 15
  L0_57(L1_58, L2_59, L3_60, L4_61)
  L0_57 = _sdemo_trade_place
  L1_58 = L0_57
  L0_57 = L0_57.play
  L0_57(L1_58)
  L0_57 = {
    L1_58,
    L2_59,
    L3_60,
    L4_61,
    "locator2_gunjin_sdemo_move_04",
    "locator2_gunjin_b_01"
  }
  L1_58 = "locator2_gunjin_01_b_move_01"
  L2_59 = "locator2_gunjin_sdemo_move_01"
  L3_60 = "locator2_gunjin_sdemo_move_02"
  L4_61 = "locator2_gunjin_sdemo_move_03"
  L1_58 = {
    L2_59,
    L3_60,
    L4_61,
    "locator2_gunjin_sdemo_move_03",
    "locator2_gunjin_sdemo_move_04",
    "locator2_gunjin_b_02"
  }
  L2_59 = "locator2_gunjin_02_b_move_01"
  L3_60 = "locator2_gunjin_sdemo_move_01"
  L4_61 = "locator2_gunjin_sdemo_move_02"
  L2_59 = {
    L3_60,
    L4_61,
    "locator2_gunjin_sdemo_move_02",
    "locator2_gunjin_sdemo_move_03",
    "locator2_gunjin_sdemo_move_04",
    "locator2_gunjin_b_03"
  }
  L3_60 = "locator2_gunjin_03_b_move_01"
  L4_61 = "locator2_gunjin_sdemo_move_01"
  L3_60 = Fn_moveNpc
  L4_61 = "sm09_gun_01"
  L3_60(L4_61, L0_57)
  L3_60 = Fn_moveNpc
  L4_61 = "sm09_gun_02"
  L3_60(L4_61, L1_58)
  L3_60 = waitSeconds
  L4_61 = 0.5
  L3_60(L4_61)
  L3_60 = Fn_moveNpc
  L4_61 = "sm09_gun_03"
  L3_60(L4_61, L2_59)
  L3_60 = Fn_missionStart
  L3_60()
  L3_60 = Fn_setCatWarpCheckPoint
  L4_61 = "locator2_pc_start_pos"
  L3_60(L4_61)
  L3_60 = periodicMotionChange
  L3_60 = L3_60()
  L4_61 = Fn_fadein
  L4_61()
  L4_61 = waitSeconds
  L4_61(1)
  L4_61 = Fn_captionViewWait
  L4_61("sm09_00135")
  L4_61 = {
    {
      pos = "locator2_aim_discover_02",
      time = 3
    }
  }
  _sdemo_trade_place:play(nil, L4_61)
  while _sdemo_trade_place:isPlay() do
    wait()
  end
  Fn_captionViewWait("sm09_00141")
  Fn_naviSet(findGameObject2("Node", "locator2_shooting_place_navi_01"))
  _sdemo_trade_place:zoomOut(2, {deg = 40})
  waitSeconds(1)
  Fn_kaiwaDemoView("sm09_00200k")
  Fn_warpNpc("sm09_gun_01", "locator2_gunjin_b_01")
  Fn_warpNpc("sm09_gun_02", "locator2_gunjin_b_02")
  Fn_warpNpc("sm09_gun_03", "locator2_gunjin_b_03")
  waitSeconds(1)
  _sdemo_trade_place:stop()
  Fn_userCtrlOn()
  Player:setStay(false)
  repeat
    if not _now_retry and _mission_phase == 0 then
      Mv_invokeMissionViewNaviCaption("sm09_00136", "locator2_shooting_place_navi_01", "sm09_00137")
      Fn_pcSensorOn("pccubesensormulti2_escape_hatch_01")
      Fn_pcSensorOn("pccubesensor2_shooting_place_01")
      waitSeconds(2)
      _escape_hatch_view_task = invokeTask(function()
        repeat
          if not _now_retry then
            _hint_time = _hint_time + 1
            if _hint_time >= 120 then
              Mv_viewObj("locator2_target_route_view_01", 0.3)
              Fn_captionViewWait("sm09_00138")
              break
            end
          end
          waitSeconds(1)
        until false
      end)
      Mv_waitPhase()
    elseif not _now_retry and _mission_phase == 1 then
      if _shortcut_flag == false then
        Fn_naviSet(findGameObject2("Node", "locator2_shooting_place_navi_01"))
      end
      _enmgen[1]:requestAllEnemyKill()
      _enmgen[15]:requestAllEnemyKill()
      _enmgen[16]:requestAllEnemyKill()
      _mechsky[1] = nil
      _mechsky[15] = nil
      _mechsky[16] = nil
      Fn_pcSensorOn("pccubesensor2_shooting_place_01")
      Fn_playMotionNpc("sm09_gun_01", "lookaround_02", false)
      if _shortcut_flag == false then
        Mv_waitPhase()
      end
      if not _now_retry then
        Fn_kaiwaDemoView("sm09_00250k")
        Fn_missionView("sm09_00146")
        waitSeconds(1.4)
        Fn_captionViewWait("sm09_00147")
        _photo = nil
        while true do
          while true do
            _photo = Photo.create(kPHOTO_CAPTION_ON, kPHOTO_TYPE_ONCE, true, {near = 1, far = 7}, {
              left = -1,
              right = 1,
              top = -1,
              bottom = 1
            }, "sm09_user_photo01")
            _photo:set(_puppet_tbl.sm09_gun_01, "bn_head")
            if _photo == nil then
              wait()
            end
          end
        end
        repeat
          _photo:run()
          repeat
            wait()
          until _photo == nil or not _photo:isRunning() or _now_retry
          if _photo ~= nil then
            if _photo:getPhotoState() == kPHOTO_OK or _photo:getPhotoState() == kPHOTO_NEAR or _photo:getPhotoState() == kPHOTO_ANGLE then
              _is_success = true
              Sound:pulse("success")
              CautionLevel.setKeepVisible(false)
              CautionLevel.allTerminate()
              Fn_pcSensorOff("pccubesensor2_shooting_place_02")
              Fn_captionView("sm09_00127")
            elseif _photo:getPhotoState() == kPHOTO_FAR then
              Fn_captionView("sm09_00128")
            elseif _photo:getPhotoState() == kPHOTO_OUT then
              Fn_captionView("sm09_00129")
            elseif _photo:getPhotoState() == kPHOTO_BACK then
              Fn_captionView("sm09_00130")
            end
            wait()
          end
        until _is_success or _now_retry
      end
      _photo = Mv_safeObjectKill(_photo)
    end
    wait()
  until _is_success
  Player:setStay(true, false)
  waitSeconds(4)
  Fn_blackout()
  L3_60 = Mv_safeTaskAbort(L3_60)
  enemyResetRelocation(_part)
  Mv_resetWaitPhase()
  Player:setStay(false)
  Fn_setNextMissionFlag()
  Fn_exitSandbox()
  Fn_nextMission()
end
function Finalize()
  local L0_62, L1_63
end
function pccubesensormulti2_escape_hatch_01_OnEnter()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensormulti2_escape_hatch_01")
    Fn_pcSensorOn("pccubesensor2_escape_hatch_01")
    Fn_naviKill()
    _escape_hatch_view_task = Mv_safeTaskAbort(_escape_hatch_view_task)
    Player:setStay(true, false)
    waitSeconds(0.5)
    moveSdemotMechSkyTask()
    _sdemo_escape_hatch:set("locator2_sdemo_hatch_cam_01", "locator2_sdemo_hatch_aim_01", false, Vector(0, 0, 0))
    _sdemo_escape_hatch:play()
    waitSeconds(2)
    _sdemo_escape_hatch:stop()
    Player:setStay(false)
    Fn_captionViewWait("sm09_00139")
    Fn_naviSet(findGameObject2("Node", "locator2_escape_hatch_navi_01"))
  end)
end
function pccubesensor2_escape_hatch_01_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_escape_hatch_01")
  Fn_naviSet(findGameObject2("Node", "locator2_escape_hatch_navi_02"))
  Fn_pcSensorOn("pccubesensor2_escape_hatch_02")
end
function pccubesensor2_escape_hatch_02_OnEnter()
  _mission_phase = 1
  _pcreset_pos = "locator2_pc_reset_pos_01"
  Fn_setCatWarpCheckPoint(_pcreset_pos)
  Fn_naviKill()
  Fn_captionView("sm09_00140")
  Fn_pcSensorOff("pccubesensor2_escape_hatch_02")
  Fn_pcSensorOff("pccubesensor2_event_cancel_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_event_cancel_01_OnEnter()
  _escape_hatch_view_task = Mv_safeTaskAbort(_escape_hatch_view_task)
  _mission_phase = 1
  _pcreset_pos = "locator2_pc_reset_pos_02"
  Fn_setCatWarpCheckPoint(_pcreset_pos)
  Fn_naviKill()
  Fn_captionView("sm09_00140")
  Fn_pcSensorOff("pccubesensor2_event_cancel_01")
  Fn_pcSensorOff("pccubesensormulti2_escape_hatch_01")
  Fn_pcSensorOff("pccubesensor2_escape_hatch_02")
  Mv_gotoNextPhase()
end
function pccubesensor2_shooting_place_01_OnEnter()
  if _mission_phase == 0 then
    _shortcut_flag = true
    _mission_phase = 1
  end
  Fn_pcSensorOff("pccubesensor2_shooting_place_01")
  Fn_pcSensorOn("pccubesensor2_shooting_place_02")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_shooting_place_02_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_shooting_place_02_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_shooting_place_navi_01"))
  Fn_captionView("sm09_00148")
end
function setupSdemoMechSkyTask()
  local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69, L6_70
  L0_64 = findGameObject2
  L1_65 = "EnemyGenerator"
  L2_66 = "enmgen2_sdemo_mechsky"
  L0_64 = L0_64(L1_65, L2_66)
  _sdemo_enmgen = L0_64
  L0_64 = findGameObject2
  L1_65 = "Puppet"
  L2_66 = "sdemo_mechsky"
  L0_64 = L0_64(L1_65, L2_66)
  L1_65 = nil
  if L0_64 ~= nil then
    L3_67 = L0_64
    L2_66 = L0_64.getBrain
    L2_66 = L2_66(L3_67)
    L1_65 = L2_66
  end
  repeat
    L2_66 = wait
    L2_66()
    L3_67 = L1_65
    L2_66 = L1_65.isReadyEnemy
    L2_66 = L2_66(L3_67)
  until L2_66
  L2_66 = findGameObject2
  L3_67 = "Node"
  L4_68 = "locator2_sdemo_mechsky"
  L2_66 = L2_66(L3_67, L4_68)
  L3_67 = L2_66
  L2_66 = L2_66.getWorldTransform
  L3_67 = L2_66(L3_67)
  L5_69 = L1_65
  L4_68 = L1_65.reset
  L6_70 = L2_66
  L4_68(L5_69, L6_70, L3_67)
  L4_68 = _sdemo_enmgen
  L5_69 = L4_68
  L4_68 = L4_68.setEnemyMarker
  L6_70 = false
  L4_68(L5_69, L6_70)
  L5_69 = L1_65
  L4_68 = L1_65.setEnableHomingTarget
  L6_70 = false
  L4_68(L5_69, L6_70)
  L4_68 = _sdemo_enmgen
  L5_69 = L4_68
  L4_68 = L4_68.requestIdlingEnemy
  L6_70 = true
  L4_68(L5_69, L6_70)
  L4_68 = _sdemo_enmgen
  L5_69 = L4_68
  L4_68 = L4_68.setVisible
  L6_70 = false
  L4_68(L5_69, L6_70)
  L5_69 = L1_65
  L4_68 = L1_65.cmd
  L6_70 = "setVisible"
  L4_68(L5_69, L6_70, false)
  function L4_68(A0_71)
    print("enemy name is " .. A0_71.name)
    A0_71.brain:endScriptAction()
    invokeTask(function()
      _mechsky_retry = true
      Retry(A0_71.name)
    end)
    _sdemo_enmgen:setEventListener("TargetEnemyReport", nil)
  end
  L5_69 = _sdemo_enmgen
  L6_70 = L5_69
  L5_69 = L5_69.setEventListener
  L5_69(L6_70, "TargetEnemyReport", L4_68)
  L5_69 = {L6_70}
  L6_70 = "locator2_sdemo_mechsky"
  L6_70 = L1_65.move
  L6_70(L1_65, L5_69, opt)
end
function moveSdemotMechSkyTask()
  local L0_72, L1_73, L2_74, L3_75
  L0_72 = findGameObject2
  L1_73 = "Puppet"
  L2_74 = "sdemo_mechsky"
  L0_72 = L0_72(L1_73, L2_74)
  L1_73 = nil
  if L0_72 ~= nil then
    L3_75 = L0_72
    L2_74 = L0_72.getBrain
    L2_74 = L2_74(L3_75)
    L1_73 = L2_74
  end
  repeat
    L2_74 = wait
    L2_74()
    L3_75 = L1_73
    L2_74 = L1_73.isReadyEnemy
    L2_74 = L2_74(L3_75)
  until L2_74
  L2_74 = _sdemo_enmgen
  L3_75 = L2_74
  L2_74 = L2_74.setVisible
  L2_74(L3_75, true)
  L3_75 = L1_73
  L2_74 = L1_73.cmd
  L2_74(L3_75, "setVisible", true)
  L2_74 = {}
  L2_74.invincible = true
  L2_74.speed = 4
  L2_74.loop = true
  L2_74.search = true
  L3_75 = {
    "locator2_sdemo_mechsky_move_pos_01",
    "locator2_sdemo_mechsky_move_pos_02",
    "locator2_sdemo_mechsky_move_pos_03",
    "locator2_sdemo_mechsky_move_pos_04",
    "locator2_sdemo_mechsky_move_pos_05"
  }
  L1_73:move(L3_75, L2_74)
end
function Retry(A0_76)
  if _now_retry or _is_succes then
    return
  end
  _now_retry = true
  Fn_naviKill()
  HUD:setPhotoMode(false)
  if _photo ~= nil then
    _photo = Mv_safeObjectKill(_photo)
  end
  _escape_hatch_view_task = Mv_safeTaskAbort(_escape_hatch_view_task)
  invokeTask(function()
    Player:setStay(true, false)
    CautionLevel.setKeepVisible(false)
    CautionLevel.allTerminate()
    _mechskytask = Mv_safeTaskAbort(_mechskytask)
    soldierTurnAction()
    villainTurnAction()
    playerRetryAction(A0_76)
    Fn_blackout()
    if _mission_phase == 0 then
      if _sdemo_enmgen ~= nil then
        setupSdemoMechSkyTask()
      end
      _hint_time = _hint_time + 30
    elseif _mission_phase == 1 then
      _enmgen[1]:requestSpawn()
      _enmgen[15]:requestSpawn()
      _enmgen[16]:requestSpawn()
    end
    Mv_gotoNextPhase()
    wait()
    Mv_resetWaitPhase()
    Fn_sendEventComSb("restoreHideObject")
    containerRestoreForce()
    enemyResetRelocation(_part)
    Fn_recoverEnergyFully()
    if _mission_phase == 0 then
      Fn_resetPcPos("locator2_pc_start_pos")
    elseif _mission_phase == 1 then
      Fn_resetPcPos(_pcreset_pos)
    end
    npcInit_soldier(_part)
    setupMechSkyTask(_part)
    Fn_coercionPoseNomal()
    Fn_fadein()
    Player:setStay(false)
    restartCaptionView()
    _found_to_enemy = false
    _is_seen_the_enemy = false
    _now_retry = false
  end)
end
