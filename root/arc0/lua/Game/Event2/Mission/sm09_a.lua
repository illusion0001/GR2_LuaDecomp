dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm09_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/perceivable_npc.lua")
_puppet_tbl = {}
_soldierName = {}
_guardName = {}
_soldierInstance = {}
_guardInstance = {}
_npcTable = {}
_ship_near = false
enmgen2_mechsky_a_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_01",
      name = "mechsky_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_01",
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
enmgen2_mechsky_a_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_02",
      name = "mechsky_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_02",
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
enmgen2_mechsky_a_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_03",
      name = "mechsky_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_03",
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
enmgen2_mechsky_a_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_04",
      name = "mechsky_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_04",
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
enmgen2_mechsky_a_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_05",
      name = "mechsky_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_05",
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
enmgen2_mechsky_a_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_06",
      name = "mechsky_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_06",
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
enmgen2_mechsky_a_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_07",
      name = "mechsky_07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_07",
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
enmgen2_mechsky_a_08 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_08",
      name = "mechsky_08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_08",
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
enmgen2_mechsky_a_09 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_09",
      name = "mechsky_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_09",
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
enmgen2_mechsky_a_10 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_10",
      name = "mechsky_10"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_10",
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
enmgen2_mechsky_a_11 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_11",
      name = "mechsky_11"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_11",
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
enmgen2_mechsky_a_12 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_12",
      name = "mechsky_12"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_12",
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
enmgen2_mechsky_a_13 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_13",
      name = "mechsky_13"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_13",
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
enmgen2_mechsky_a_14 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_14",
      name = "mechsky_14"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_14",
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
enmgen2_mechsky_a_15 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_15",
      name = "mechsky_15"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_15",
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
enmgen2_mechsky_a_16 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_a_16",
      name = "mechsky_16"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_a_16",
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
  L0_48 = Fn_userCtrlOff
  L0_48()
  L0_48 = Fn_pcSensorOff
  L0_48(L1_49)
  L0_48 = {
    L1_49,
    L2_50,
    L3_51,
    L4_52,
    L5_53,
    {
      name = "sm09_soldier_03",
      type = "soldier",
      node = "locator2_soldier_a_03",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_04",
      type = "soldier",
      node = "locator2_soldier_a_04",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_05",
      type = "soldier",
      node = "locator2_soldier_a_05",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_06",
      type = "soldier",
      node = "locator2_soldier_a_06",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_07",
      type = "soldier",
      node = "locator2_soldier_a_07",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_08",
      type = "soldier",
      node = "locator2_soldier_a_08",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_09",
      type = "soldier",
      node = "locator2_soldier_a_09",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_10",
      type = "soldier",
      node = "locator2_soldier_a_10",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_11",
      type = "soldier",
      node = "locator2_soldier_a_11",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_12",
      type = "soldier",
      node = "locator2_soldier_a_12",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_13",
      type = "soldier",
      node = "locator2_soldier_a_13",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_14",
      type = "soldier",
      node = "locator2_soldier_a_14",
      active = false,
      attach = false
    },
    {
      name = "sm09_soldier_15",
      type = "soldier",
      node = "locator2_soldier_a_15",
      active = true,
      attach = false
    },
    {
      name = "sm09_soldier_16",
      type = "soldier",
      node = "locator2_soldier_a_16",
      active = true,
      attach = false
    },
    {
      name = "sm09_guard_01",
      type = "soldier",
      node = "locator2_guard_a_01",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_02",
      type = "soldier",
      node = "locator2_guard_a_02",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_03",
      type = "soldier",
      node = "locator2_guard_a_03",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_04",
      type = "soldier",
      node = "locator2_guard_a_04",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_05",
      type = "soldier",
      node = "locator2_guard_a_05",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_06",
      type = "soldier",
      node = "locator2_guard_a_06",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_07",
      type = "soldier",
      node = "locator2_guard_a_07",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_08",
      type = "soldier",
      node = "locator2_guard_a_08",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_09",
      type = "soldier",
      node = "locator2_guard_a_09",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_10",
      type = "soldier",
      node = "locator2_guard_a_10",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_11",
      type = "soldier",
      node = "locator2_guard_11_01",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_12",
      type = "soldier",
      node = "locator2_guard_a_12",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_13",
      type = "soldier",
      node = "locator2_guard_a_13",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_14",
      type = "soldier",
      node = "locator2_guard_a_14",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_15",
      type = "soldier",
      node = "locator2_guard_a_15",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_16",
      type = "soldier",
      node = "locator2_guard_a_16",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_17",
      type = "soldier",
      node = "locator2_guard_a_17",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_18",
      type = "soldier",
      node = "locator2_guard_a_18",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_19",
      type = "soldier",
      node = "locator2_guard_a_19",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_20",
      type = "soldier",
      node = "locator2_guard_a_20",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_21",
      type = "soldier",
      node = "locator2_guard_a_21",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_22",
      type = "soldier",
      node = "locator2_guard_a_22",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_23",
      type = "soldier",
      node = "locator2_guard_a_23",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_24",
      type = "soldier",
      node = "locator2_guard_a_24",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_25",
      type = "soldier",
      node = "locator2_guard_a_25",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_26",
      type = "soldier",
      node = "locator2_guard_a_26",
      active = false,
      attach = false
    },
    {
      name = "sm09_guard_27",
      type = "soldier",
      node = "locator2_guard_a_27",
      active = false,
      attach = false
    }
  }
  L1_49.name = "sm09_gun_01"
  L1_49.type = "man56"
  L1_49.node = "locator2_gunjin_a_01"
  L1_49.active = false
  L1_49.attach = false
  L2_50.name = "sm09_gun_02"
  L2_50.type = "soldier"
  L2_50.node = "locator2_gunjin_a_02"
  L2_50.active = false
  L2_50.attach = false
  L3_51.name = "sm09_gun_03"
  L3_51.type = "soldier"
  L3_51.node = "locator2_gunjin_a_03"
  L3_51.active = false
  L3_51.attach = false
  L4_52 = {}
  L4_52.name = "sm09_soldier_01"
  L4_52.type = "soldier"
  L4_52.node = "locator2_soldier_a_01"
  L4_52.active = false
  L4_52.attach = false
  L5_53 = {}
  L5_53.name = "sm09_soldier_02"
  L5_53.type = "soldier"
  L5_53.node = "locator2_soldier_a_02"
  L5_53.active = false
  L5_53.attach = false
  L1_49(L2_50)
  for L4_52, L5_53 in L1_49(L2_50) do
    _puppet_tbl[L5_53.name] = Fn_findNpcPuppet(L5_53.name)
  end
  for L4_52 = 2, VILLAIN_MAX do
    L5_53 = "sm09_gun_"
    L5_53 = L5_53 .. string.format("%02d", L4_52)
    Fn_loadNpcEventMotion(L5_53, SOL_MOTION_LIST)
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
  _sdemo_move_ship = L1_49
  _sdemo_gun_entry = L1_49
  if L1_49 == false then
    L1_49()
  end
end
function Ingame()
  local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60
  L0_54(L1_55)
  L0_54()
  _part = L0_54
  L0_54()
  L0_54(L1_55)
  L3_57 = true
  L4_58 = 0
  L5_59 = true
  L6_60 = false
  L0_54(L1_55, L2_56, L3_57, L4_58, L5_59, L6_60)
  L0_54()
  L0_54(L1_55)
  L0_54(L1_55)
  L0_54(L1_55)
  L3_57 = "locator2_aim_ship_move_01"
  L4_58 = false
  L0_54(L1_55, L2_56, L3_57, L4_58)
  L0_54(L1_55)
  for L3_57 = 1, GUARD_MAX do
    L4_58 = Fn_setNpcActive
    L5_59 = "sm09_guard_"
    L6_60 = string
    L6_60 = L6_60.format
    L6_60 = L6_60("%02d", L3_57)
    L5_59 = L5_59 .. L6_60
    L6_60 = true
    L4_58(L5_59, L6_60)
  end
  L0_54(L1_55, L2_56)
  L0_54(L1_55)
  L0_54(L1_55)
  L0_54(L1_55)
  for L3_57 = 1, SOLDIER_MAX do
    L4_58 = Fn_setNpcActive
    L5_59 = "sm09_soldier_"
    L6_60 = string
    L6_60 = L6_60.format
    L6_60 = L6_60("%02d", L3_57)
    L5_59 = L5_59 .. L6_60
    L6_60 = true
    L4_58(L5_59, L6_60)
  end
  L0_54(L1_55)
  L3_57 = "locator2_aim_ship_move_02"
  L4_58 = false
  L0_54(L1_55, L2_56, L3_57, L4_58)
  L3_57 = nil
  L4_58 = {}
  L4_58.deg = 22
  L0_54(L1_55, L2_56, L3_57, L4_58)
  L0_54(L1_55)
  L0_54(L1_55)
  L0_54(L1_55, L2_56)
  L0_54(L1_55)
  L1_55(L2_56)
  L1_55(L2_56)
  L1_55(L2_56)
  L3_57 = "sm09_info_01"
  L4_58 = false
  L1_55(L2_56, L3_57, L4_58)
  L1_55()
  L1_55()
  L3_57 = "eventpoint"
  L1_55(L2_56, L3_57)
  L1_55(L2_56)
  L1_55()
  L1_55(L2_56)
  L2_56()
  L3_57 = L1_55
  L3_57 = "sm09_gun_01"
  L4_58 = true
  L2_56(L3_57, L4_58)
  L3_57 = "sm09_gun_02"
  L4_58 = true
  L2_56(L3_57, L4_58)
  L3_57 = "sm09_gun_03"
  L4_58 = true
  L2_56(L3_57, L4_58)
  L3_57 = "sm09_00120k"
  L2_56(L3_57)
  L3_57 = L2_56
  L4_58 = true
  L5_59 = false
  L2_56(L3_57, L4_58, L5_59)
  L3_57 = L2_56
  L4_58 = true
  L5_59 = 1
  L6_60 = findGameObject2
  L6_60 = L6_60("Node", "locator2_gunjin_a_01")
  L6_60 = L6_60.getWorldPos
  L6_60 = L6_60(L6_60)
  L2_56(L3_57, L4_58, L5_59, L6_60, L6_60(L6_60))
  L3_57 = 1.5
  L2_56(L3_57)
  L3_57 = "locator2_gunjin_01_move_01"
  L4_58 = "locator2_gunjin_01_move_02"
  L3_57 = {L4_58, L5_59}
  L4_58 = "locator2_gunjin_02_move_01"
  L5_59 = "locator2_gunjin_02_move_02"
  L4_58 = {L5_59, L6_60}
  L5_59 = "locator2_gunjin_03_move_01"
  L6_60 = "locator2_gunjin_03_move_02"
  L5_59 = Fn_moveNpc
  L6_60 = "sm09_gun_01"
  L5_59(L6_60, L2_56)
  L5_59 = Fn_moveNpc
  L6_60 = "sm09_gun_02"
  L5_59(L6_60, L3_57)
  L5_59 = Fn_moveNpc
  L6_60 = "sm09_gun_03"
  L5_59(L6_60, L4_58)
  L5_59 = findGameObject2
  L6_60 = "Node"
  L5_59 = L5_59(L6_60, "locator2_gunjin_01_move_02")
  L6_60 = L5_59
  L5_59 = L5_59.getWorldPos
  L5_59 = L5_59(L6_60)
  L6_60 = Camera
  L6_60 = L6_60.lookTo
  L6_60(L6_60, L5_59, 2, 2)
  L6_60 = waitSeconds
  L6_60(2)
  L6_60 = Fn_getPlayerWorldPos
  L6_60 = L6_60()
  L6_60.y = L6_60.y + 1.5
  _sdemo_gun_entry:set(L6_60, "locator2_gunjin_01_move_02", false)
  _sdemo_gun_entry:setCameraParam(nil, nil, {deg = 15})
  _sdemo_gun_entry:switchCamera(true)
  waitSeconds(1)
  Fn_captionViewWait("sm09_00134")
  waitSeconds(2)
  Fn_blackout()
  _sdemo_gun_entry:switchCamera(false)
  Fn_resetPcPos("locator2_pc_reset_pos_01")
  enemyResetRelocation(_part)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_exitSandbox()
  Fn_nextMission()
end
function Finalize()
  local L0_61, L1_62
end
function pccubesensor2_container_01_OnEnter()
  Fn_naviKill()
  Fn_captionView("sm09_00142")
  Fn_pcSensorOff("pccubesensor2_container_01")
  Fn_naviSet(findGameObject2("Node", "locator2_navi_ship_01"))
  Fn_pcSensorOn("pccubesensor2_navi_ship_01")
end
function pccubesensor2_navi_ship_01_OnEnter()
  if not Player:isGravityControlMode() then
    Fn_pcSensorOff("pccubesensor2_navi_ship_01")
    Fn_naviKill()
    Mv_gotoNextPhase()
  end
end
function firstMissionView()
  Mv_invokeMissionViewNaviCaption("sm09_00120", "locator2_container_01", "sm09_00101")
  Fn_pcSensorOn("pccubesensor2_container_01")
end
function Retry(A0_63)
  if _now_retry then
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
    playerRetryAction(A0_63)
    Fn_blackout()
    Fn_sendEventComSb("restoreHideObject")
    containerRestoreForce()
    enemyResetRelocation(_part)
    Fn_recoverEnergyFully()
    Fn_resetPcPos("locator2_pc_start_pos")
    npcInit_soldier(_part)
    setupMechSkyTask(_part)
    Fn_coercionPoseNomal()
    Fn_fadein()
    Player:setStay(false)
    restartCaptionView()
    _found_to_enemy = false
    _is_seen_the_enemy = false
    _now_retry = false
    _ship_near = true
    firstMissionView()
  end)
end
