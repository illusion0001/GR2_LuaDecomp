L0_0 = {
  {
    id = 1,
    name = "mine01",
    gravity_concentration = 0,
    minable_volume = 1,
    mysterious_gravity_storm = true,
    unstable_condition = true,
    mine_available = true,
    miners = 0
  },
  {
    id = 2,
    name = "mine02",
    gravity_concentration = 0,
    minable_volume = 1,
    mysterious_gravity_storm = true,
    unstable_condition = true,
    mine_available = true,
    miners = 0
  },
  {
    id = 3,
    name = "mine03",
    gravity_concentration = 0,
    minable_volume = 1,
    mysterious_gravity_storm = true,
    unstable_condition = true,
    mine_available = true,
    miners = 0
  },
  {
    id = 4,
    name = "mine04",
    gravity_concentration = 0,
    minable_volume = 1,
    mysterious_gravity_storm = true,
    unstable_condition = true,
    mine_available = true,
    miners = 0
  },
  {
    id = 5,
    name = "mine05",
    gravity_concentration = 0,
    minable_volume = 1,
    mysterious_gravity_storm = true,
    unstable_condition = true,
    mine_available = true,
    miners = 0
  }
}
free_mines_info = L0_0
L0_0 = {}
L0_0.mine01 = "ui_map_header_sk_01"
L0_0.mine02 = "ui_map_header_sk_02"
L0_0.mine03 = "ui_map_header_sk_03"
L0_0.mine04 = "ui_map_header_sk_04"
L0_0.mine05 = "ui_map_header_sk_05"
L0_0.mine99_001 = "ui_map_header_ms_001"
L0_0.mine99_002 = "ui_map_header_ms_002"
L0_0.mine99_003 = "ui_map_header_ms_003"
L0_0.mine99_004 = "ui_map_header_ms_004"
L0_0.mine99_005 = "ui_map_header_ms_005"
L0_0.mine99_006 = "ui_map_header_ms_006"
L0_0.mine99_007 = "ui_map_header_ms_007"
L0_0.mine99_008 = "ui_map_header_ms_008"
L0_0.mine99_009 = "ui_map_header_ms_009"
L0_0.mine99_010 = "ui_map_header_ms_010"
L0_0.mine99_011 = "ui_map_header_ms_011"
L0_0.mine99_012 = "ui_map_header_ms_012"
L0_0.mine99_013 = "ui_map_header_ms_013"
L0_0.mine99_014 = "ui_map_header_ms_014"
L0_0.mine99_015 = "ui_map_header_ms_015"
L0_0.mine99_016 = "ui_map_header_ms_016"
L0_0.mine99_017 = "ui_map_header_ms_017"
L0_0.mine99_018 = "ui_map_header_ms_018"
L0_0.mine99_019 = "ui_map_header_ms_019"
L0_0.mine99_020 = "ui_map_header_ms_020"
L0_0.mine99_021 = "ui_map_header_ms_021"
L0_0.mine99_022 = "ui_map_header_ms_022"
L0_0.mine99_023 = "ui_map_header_ms_023"
L0_0.mine99_024 = "ui_map_header_ms_024"
L0_0.mine99_025 = "ui_map_header_ms_025"
mine_name_tbl = L0_0
L0_0 = {}
L0_0.mine01 = "ui_talisman_rs_header_3_01"
L0_0.mine02 = "ui_talisman_rs_header_3_02"
L0_0.mine03 = "ui_talisman_rs_header_3_03"
L0_0.mine04 = "ui_talisman_rs_header_3_04"
L0_0.mine05 = "ui_talisman_rs_header_3_05"
L0_0.mine05 = "ui_talisman_rs_header_3_06"
L0_0.mine05 = "ui_talisman_rs_header_3_07"
L0_0.mine99 = "ui_talisman_rs_header_3_08"
mine_name_for_result_tbl = L0_0
L0_0 = {}
L0_0.S = {gem_cnt = 0.9, talisman_ore_pct = 0.8}
L0_0.M = {gem_cnt = 1, talisman_ore_pct = 1}
L0_0.L = {gem_cnt = 1.3, talisman_ore_pct = 1.2}
ORE_TYPE_CORRECT_TABLE = L0_0
L0_0 = {}
L0_0.mine01 = {
  rate = 10,
  trigger = "",
  term = {
    "ft03",
    "ft04",
    "ft05",
    "ft06",
    "ft07",
    "ft08",
    "ft09",
    "ft10",
    "ft11",
    "ft14",
    "ft15",
    "ft16",
    "ft18",
    "ft21",
    "ft28"
  },
  mine_ore_tbl = "pi_a_point_01",
  gacha = {
    area = "normal",
    num = 2,
    infnum = 1
  },
  mimics = {
    "stalker_rare",
    "gellyfish_rare"
  },
  chance_mimics = 5,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine02 = {
  rate = 10,
  trigger = "",
  term = {
    "ft05",
    "ft06",
    "ft07",
    "ft08",
    "ft09",
    "ft10",
    "ft11",
    "ft14",
    "ft15",
    "ft16",
    "ft18",
    "ft21",
    "ft28"
  },
  mine_ore_tbl = "pi2_a_point_01",
  gacha = {
    area = "normal",
    num = 3,
    infnum = 1
  },
  mimics = {
    "stalker_rare",
    "gellyfish_rare"
  },
  chance_mimics = 5,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine03 = {
  rate = 10,
  trigger = "",
  term = {
    "ft04",
    "ft05",
    "ft06",
    "ft07",
    "ft08",
    "ft09",
    "ft10",
    "ft11",
    "ft14",
    "ft15",
    "ft16",
    "ft18",
    "ft21",
    "ft28"
  },
  mine_ore_tbl = "az_a_point_01",
  gacha = {
    area = "normal",
    num = 1,
    infnum = 1
  },
  mimics = {
    "stalker_rare",
    "gellyfish_rare"
  },
  chance_mimics = 5,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine04 = {
  rate = 10,
  trigger = "",
  term = {
    "ft14",
    "ft15",
    "ft16",
    "ft18",
    "ft21",
    "ft28"
  },
  mine_ore_tbl = "az2_a_point_01",
  gacha = {
    area = "normal",
    num = 4,
    infnum = 1
  },
  mimics = {
    "stalker_rare",
    "gellyfish_rare"
  },
  chance_mimics = 5,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine05 = {
  rate = 10,
  trigger = "",
  term = {
    "ft15",
    "ft16",
    "ft18",
    "ft21",
    "ft28"
  },
  mine_ore_tbl = "wa_b_point_01",
  gacha = {
    area = "normal",
    num = 6,
    infnum = 1
  },
  mimics = {
    "stalker_rare",
    "gellyfish_rare"
  },
  chance_mimics = 5,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_001 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_01",
  gacha = {area = "infinite", num = 1},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_002 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_02",
  gacha = {area = "infinite", num = 2},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_003 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_03",
  gacha = {area = "infinite", num = 3},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_004 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_04",
  gacha = {area = "infinite", num = 4},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_005 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_05",
  gacha = {area = "infinite", num = 5},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 20,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_006 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_06",
  gacha = {area = "infinite", num = 6},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare",
    "imp_rare",
    "giant_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 18,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_007 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_07",
  gacha = {area = "infinite", num = 7},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare",
    "imp_rare",
    "giant_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 18,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_008 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_08",
  gacha = {area = "infinite", num = 8},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare",
    "imp_rare",
    "giant_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 18,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_009 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_09",
  gacha = {area = "infinite", num = 9},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare",
    "imp_rare",
    "giant_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 18,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_010 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "wa_b_point_01",
  gacha = {area = "infinite", num = 10},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "gellyfish_rare",
    "imp_rare",
    "giant_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 18,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_011 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_11",
  gacha = {area = "infinite", num = 11},
  mimics = {
    "runner_rare",
    "giant_rare",
    "imp_rare",
    "guardcore_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 16,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_012 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_12",
  gacha = {area = "infinite", num = 12},
  mimics = {
    "runner_rare",
    "giant_rare",
    "imp_rare",
    "guardcore_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 16,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_013 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_13",
  gacha = {area = "infinite", num = 13},
  mimics = {
    "runner_rare",
    "giant_rare",
    "imp_rare",
    "guardcore_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 16,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_014 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_15",
  gacha = {area = "infinite", num = 14},
  mimics = {
    "runner_rare",
    "giant_rare",
    "imp_rare",
    "guardcore_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 16,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_015 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_16",
  gacha = {area = "infinite", num = 15},
  mimics = {
    "runner_rare",
    "giant_rare",
    "imp_rare",
    "guardcore_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 16,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_016 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_16",
  gacha = {area = "infinite", num = 16},
  mimics = {
    "guardcore_rare",
    "imp_rare",
    "giant_rare",
    "lunafish_rare",
    "treecannon_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 14,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_017 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_17",
  gacha = {area = "infinite", num = 17},
  mimics = {
    "guardcore_rare",
    "imp_rare",
    "giant_rare",
    "lunafish_rare",
    "treecannon_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 14,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_018 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_18",
  gacha = {area = "infinite", num = 18},
  mimics = {
    "guardcore_rare",
    "imp_rare",
    "giant_rare",
    "lunafish_rare",
    "treecannon_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 14,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_019 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_19",
  gacha = {area = "infinite", num = 19},
  mimics = {
    "guardcore_rare",
    "imp_rare",
    "giant_rare",
    "lunafish_rare",
    "treecannon_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 14,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_020 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "pi2_a_point_01",
  gacha = {area = "infinite", num = 20},
  mimics = {
    "guardcore_rare",
    "imp_rare",
    "giant_rare",
    "lunafish_rare",
    "treecannon_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 14,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_021 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_21",
  gacha = {area = "infinite", num = 21},
  mimics = {
    "lunafish_rare",
    "treecannon_rare",
    "jammer_rare",
    "lasercannon_rare",
    "defender_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 12,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_022 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_22",
  gacha = {area = "infinite", num = 22},
  mimics = {
    "lunafish_rare",
    "treecannon_rare",
    "jammer_rare",
    "lasercannon_rare",
    "defender_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 12,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_023 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_23",
  gacha = {area = "infinite", num = 23},
  mimics = {
    "lunafish_rare",
    "treecannon_rare",
    "jammer_rare",
    "lasercannon_rare",
    "defender_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 12,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_024 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_24",
  gacha = {area = "infinite", num = 24},
  mimics = {
    "lunafish_rare",
    "treecannon_rare",
    "jammer_rare",
    "lasercannon_rare",
    "defender_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 12,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_025 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "infinite_dungeon_25",
  gacha = {area = "infinite", num = 25},
  mimics = {
    "lunafish_rare",
    "treecannon_rare",
    "jammer_rare",
    "lasercannon_rare",
    "defender_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 12,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_026 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "dummy_point_01",
  gacha = {area = "infinite", num = 26},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "guardcore_rare",
    "treecannon_rare",
    "defender_rare",
    "giant_rare",
    "lasercannon_rare",
    "imp_rare",
    "gellyfish_rare",
    "lunafish_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 0,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_027 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "dummy_point_01",
  gacha = {area = "infinite", num = 27},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "guardcore_rare",
    "treecannon_rare",
    "defender_rare",
    "giant_rare",
    "lasercannon_rare",
    "imp_rare",
    "gellyfish_rare",
    "lunafish_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 0,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_028 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "dummy_point_01",
  gacha = {area = "infinite", num = 28},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "guardcore_rare",
    "treecannon_rare",
    "defender_rare",
    "giant_rare",
    "lasercannon_rare",
    "imp_rare",
    "gellyfish_rare",
    "lunafish_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 0,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_029 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "dummy_point_01",
  gacha = {area = "infinite", num = 29},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "guardcore_rare",
    "treecannon_rare",
    "defender_rare",
    "giant_rare",
    "lasercannon_rare",
    "imp_rare",
    "gellyfish_rare",
    "lunafish_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 0,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.mine99_030 = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "dummy_point_01",
  gacha = {area = "infinite", num = 30},
  mimics = {
    "stalker_rare",
    "runner_rare",
    "guardcore_rare",
    "treecannon_rare",
    "defender_rare",
    "giant_rare",
    "lasercannon_rare",
    "imp_rare",
    "gellyfish_rare",
    "lunafish_rare",
    "jammer_rare"
  },
  chance_mimics = 10,
  lock_on_distance = 20,
  targetting_priority = Player.kTargetingPrio_Flat,
  enemy_pop_gem = {
    pct = 0,
    ene = 55,
    vit = 35,
    sp = 10
  }
}
L0_0.sm90_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "sm90_b_point_01",
  gacha = {area = "infinite", num = 1},
  lock_on_distance = 20
}
L0_0.ep02_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "ep02_point_01",
  gacha = {area = "normal", num = 1},
  lock_on_distance = 20
}
L0_0.ep03_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "ep03_point_01",
  gacha = {area = "normal", num = 1},
  lock_on_distance = 20
}
L0_0.ep03_p_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "ep03_point_02",
  gacha = {area = "normal", num = 1},
  lock_on_distance = 20
}
L0_0.ep09_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "ep09_point_01",
  gacha = {area = "normal", num = 4},
  lock_on_distance = 20
}
L0_0.ep12_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "ep12_point_01",
  gacha = {area = "normal", num = 5},
  lock_on_distance = 20
}
L0_0.ep12_n_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "ep12_point_02",
  gacha = {area = "normal", num = 5},
  lock_on_distance = 20
}
L0_0.ep19_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "ep19_point_01",
  gacha = {area = "normal", num = 7},
  lock_on_distance = 20
}
L0_0.sm01_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "sm01_point_01",
  gacha = {area = "normal", num = 1},
  lock_on_distance = 20
}
L0_0.sm14_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "sm14_point_01",
  gacha = {area = "normal", num = 2},
  lock_on_distance = 20
}
L0_0.sm28_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "wa_b_point_01",
  gacha = {area = "normal", num = 6},
  lock_on_distance = 20
}
L0_0.sm48_c_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "sm48_point_01",
  gacha = {area = "infinite", num = 1},
  lock_on_distance = 20
}
L0_0.sm48_d_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "sm48_point_02",
  gacha = {area = "infinite", num = 2},
  lock_on_distance = 20
}
L0_0.sm48_e_mine = {
  rate = 0,
  trigger = "",
  term = {},
  mine_ore_tbl = "sm48_point_03",
  gacha = {area = "infinite", num = 3},
  lock_on_distance = 20
}
mine_tbl = L0_0
L0_0 = {}
L0_0.dummy_point_01 = {
  rand_ore_max = 0,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 0,
  gem_max = 0,
  talisman_ore_pct = 0,
  talisman_ore_tbl = "talisman_01"
}
L0_0.pi_a_point_01 = {
  rand_ore_max = 300,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 10,
  talisman_ore_tbl = "talisman_01"
}
L0_0.pi_a_point_02 = {
  rand_ore_max = 6000,
  mimic_min = 1,
  mimic_max = 10,
  gem_min = 4,
  gem_max = 8,
  talisman_ore_pct = 50,
  talisman_ore_tbl = "talisman_01"
}
L0_0.pi2_a_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 1,
  mimic_max = 2,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 8,
  talisman_ore_tbl = "talisman_01"
}
L0_0.az_a_point_01 = {
  rand_ore_max = 200,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 10,
  talisman_ore_tbl = "talisman_01"
}
L0_0.az2_a_point_01 = {
  rand_ore_max = 240,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 10,
  talisman_ore_tbl = "talisman_01"
}
L0_0.az3_a_point_01 = {
  rand_ore_max = 6000,
  mimic_min = 1,
  mimic_max = 5,
  gem_min = 4,
  gem_max = 8,
  talisman_ore_pct = 50,
  talisman_ore_tbl = "talisman_01"
}
L0_0.wa_a_point_01 = {
  rand_ore_max = 6000,
  mimic_min = 1,
  mimic_max = 5,
  gem_min = 1,
  gem_max = 3,
  talisman_ore_pct = 50,
  talisman_ore_tbl = "talisman_01"
}
L0_0.wa_b_point_01 = {
  rand_ore_max = 150,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 7,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_01 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 7,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_02 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 7,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_03 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 7,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_04 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 7,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_05 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 7,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_06 = {
  rand_ore_max = 80,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 6,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_07 = {
  rand_ore_max = 35,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 10,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_08 = {
  rand_ore_max = 40,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 9,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_09 = {
  rand_ore_max = 50,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 8,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_10 = {
  rand_ore_max = 105,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_11 = {
  rand_ore_max = 105,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_12 = {
  rand_ore_max = 105,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_13 = {
  rand_ore_max = 105,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_14 = {
  rand_ore_max = 105,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_15 = {
  rand_ore_max = 105,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_16 = {
  rand_ore_max = 200,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_17 = {
  rand_ore_max = 200,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_18 = {
  rand_ore_max = 100,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_19 = {
  rand_ore_max = 300,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_20 = {
  rand_ore_max = 200,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_21 = {
  rand_ore_max = 75,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 6,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_22 = {
  rand_ore_max = 75,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 6,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_23 = {
  rand_ore_max = 75,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 6,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_24 = {
  rand_ore_max = 75,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 6,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_25 = {
  rand_ore_max = 75,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 6,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_26 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 8,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_27 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 8,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_28 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 8,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_29 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 8,
  talisman_ore_tbl = "talisman_01"
}
L0_0.infinite_dungeon_30 = {
  rand_ore_max = 60,
  mimic_min = 1,
  mimic_max = 1,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 8,
  talisman_ore_tbl = "talisman_01"
}
L0_0.sm90_b_point_01 = {
  rand_ore_max = 10,
  mimic_min = 10,
  mimic_max = 15,
  gem_min = 3,
  gem_max = 5,
  talisman_ore_pct = 10,
  talisman_ore_tbl = "talisman_01"
}
L0_0.ep02_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 2,
  gem_max = 5,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.ep03_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 2,
  gem_max = 5,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.ep03_point_02 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 2,
  gem_max = 2,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.ep09_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 1,
  gem_max = 3,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.ep12_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 1,
  gem_max = 3,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.ep12_point_02 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 1,
  gem_max = 1,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.ep19_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 1,
  gem_max = 3,
  talisman_ore_pct = 5,
  talisman_ore_tbl = "talisman_01"
}
L0_0.sm01_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 1,
  gem_max = 3,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.sm14_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 2,
  gem_max = 3,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.sm28_point_01 = {
  rand_ore_max = 2000,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 1,
  gem_max = 3,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.sm48_point_01 = {
  rand_ore_max = 200,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 2,
  gem_max = 3,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.sm48_point_02 = {
  rand_ore_max = 200,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 3,
  gem_max = 5,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
L0_0.sm48_point_03 = {
  rand_ore_max = 200,
  mimic_min = 0,
  mimic_max = 0,
  gem_min = 2,
  gem_max = 4,
  talisman_ore_pct = 0,
  talisman_ore_tbl = ""
}
mine_ore_tbl = L0_0
L0_0 = {}
L0_0.talisman_01 = {
  {rate = 15, talisman_id = 1},
  {rate = 15, talisman_id = 2},
  {rate = 15, talisman_id = 3},
  {rate = 15, talisman_id = 4},
  {rate = 15, talisman_id = 5},
  {rate = 10, talisman_id = 6},
  {rate = 10, talisman_id = 7},
  {rate = 10, talisman_id = 8},
  {rate = 5, talisman_id = 9},
  {rate = 5, talisman_id = 10}
}
talisman_ore_tbl = L0_0
L0_0 = "talisman_tbl"
_ENV[L0_0] = {
  [1] = {
    talisman_ore_name = "ui_tarisman_1_01",
    rarity = 1
  },
  [2] = {
    talisman_ore_name = "ui_tarisman_2_01",
    rarity = 1
  },
  [3] = {
    talisman_ore_name = "ui_tarisman_3_01",
    rarity = 1
  },
  [4] = {
    talisman_ore_name = "ui_tarisman_1_01",
    rarity = 1
  },
  [5] = {
    talisman_ore_name = "ui_tarisman_2_01",
    rarity = 1
  },
  [6] = {
    talisman_ore_name = "ui_tarisman_3_01",
    rarity = 2
  },
  [7] = {
    talisman_ore_name = "ui_tarisman_1_01",
    rarity = 2
  },
  [8] = {
    talisman_ore_name = "ui_tarisman_2_01",
    rarity = 2
  },
  [9] = {
    talisman_ore_name = "ui_tarisman_3_01",
    rarity = 3
  },
  [10] = {
    talisman_ore_name = "ui_tarisman_1_01",
    rarity = 3
  }
}
