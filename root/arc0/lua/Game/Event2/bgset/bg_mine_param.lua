dofile("/Game/Event2/bgset/bg_mine_99_01_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_06_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_11_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_12_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_13_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_14_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_15_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_16_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_21_param.lua")
dofile("/Game/Event2/bgset/bg_mine_99_40_param.lua")
bg_mine_99_01_param_table = {
  main = DRIFT_PARAM_MINE99_01,
  sub = DRIFT_SUBAREA_TBL_MINE99_01,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_01,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_01
}
bg_mine_99_06_param_table = {
  main = DRIFT_PARAM_MINE99_06,
  sub = DRIFT_SUBAREA_TBL_MINE99_06,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_06,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_06
}
bg_mine_99_11_param_table = {
  main = DRIFT_PARAM_MINE99_11,
  sub = DRIFT_SUBAREA_TBL_MINE99_11,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_11,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_11
}
bg_mine_99_12_param_table = {
  main = DRIFT_PARAM_MINE99_12,
  sub = DRIFT_SUBAREA_TBL_MINE99_12,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_12,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_12
}
bg_mine_99_13_param_table = {
  main = DRIFT_PARAM_MINE99_13,
  sub = DRIFT_SUBAREA_TBL_MINE99_13,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_13,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_13
}
bg_mine_99_14_param_table = {
  main = DRIFT_PARAM_MINE99_14,
  sub = DRIFT_SUBAREA_TBL_MINE99_14,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_14,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_14
}
bg_mine_99_15_param_table = {
  main = DRIFT_PARAM_MINE99_15,
  sub = DRIFT_SUBAREA_TBL_MINE99_15,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_15,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_15
}
bg_mine_99_16_param_table = {
  main = DRIFT_PARAM_MINE99_16,
  sub = DRIFT_SUBAREA_TBL_MINE99_16,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_16,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_16
}
bg_mine_99_21_param_table = {
  main = DRIFT_PARAM_MINE99_21,
  sub = DRIFT_SUBAREA_TBL_MINE99_21,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_21,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_21
}
bg_mine_99_40_param_table = {
  main = DRIFT_PARAM_MINE99_40,
  sub = DRIFT_SUBAREA_TBL_MINE99_40,
  sub_prm = DRIFT_PARAM_SUBAREA_MINE99_40,
  uni = DRIFT_UNIQUE_AREA_TBL_MINE99_40
}
_mine_base_tbl = {
  bg_mine_01 = {
    id = 1,
    area = "pi_a_root",
    cityblock = "ui_gaiku_02_31",
    mine_map = "pi01",
    gate_map = "sk01",
    gs_type = 1,
    cage_area = "pi_a_01",
    dist = 920,
    evb = {"mine01"},
    mission = {
      "mine01_storm",
      "ep02_00100c",
      "ep02_b",
      "sm48_b"
    }
  },
  bg_mine_02 = {
    id = 2,
    area = "pi2_a_root",
    cityblock = "ui_gaiku_02_32",
    mine_map = "pi02",
    gate_map = "sk02",
    gs_type = 2,
    cage_area = "pi2_a_16",
    dist = 1200,
    evb = {"mine02"},
    mission = {
      "mine02_storm"
    },
    drift = false
  },
  bg_mine_03 = {
    id = 3,
    area = "az_a_root",
    cityblock = "ui_gaiku_02_33",
    mine_map = "pi03",
    gate_map = "sk03",
    gs_type = 3,
    cage_area = "az_a_02",
    dist = 1000,
    evb = {"mine03"},
    mission = {
      "mine03_storm"
    },
    drift = false
  },
  bg_mine_04 = {
    id = 4,
    area = "az2_b_root",
    cityblock = "ui_gaiku_02_34",
    mine_map = "pi04",
    gate_map = "sk04",
    gs_type = 4,
    cage_area = "az2_a_23",
    dist = 920,
    evb = {"mine04"},
    mission = {
      "mine04_storm"
    },
    scene = "az2_a_root"
  },
  bg_mine_05 = {
    id = 5,
    area = "wa_b_root",
    cityblock = "ui_gaiku_02_35",
    mine_map = "pi05",
    gate_map = "sk05",
    gs_type = 5,
    cage_area = "wa_a_03",
    dist = 1200,
    evb = {"mine05"},
    mission = {
      "mine05_storm",
      "sm28_b"
    },
    drift = false
  },
  bg_mine_06 = {
    id = 1,
    area = "pi_f_root",
    cityblock = "ui_gaiku_02_31",
    mine_map = "mi99_01",
    gate_map = "sk01",
    gs_type = 1,
    cage_area = "pi_a_02",
    dist = 1000,
    evb = {},
    mission = {
      "mine01_storm"
    },
    scene = "pi_a_root"
  },
  bg_mine_07 = {
    id = 1,
    area = "pi_g_root",
    cityblock = "ui_gaiku_02_31",
    mine_map = "mi99_05",
    gate_map = "sk01",
    gs_type = 1,
    cage_area = "pi_a_01",
    dist = 1000,
    evb = {},
    mission = {
      "mine01_storm"
    },
    scene = "pi_a_root"
  }
}
_mine99_table = {
  mine99_001 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_01",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_001",
    evb2 = {
      "floor_001_outrange"
    },
    gs_type = 1
  },
  mine99_002 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_02",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_002",
    evb2 = {
      "floor_002_outrange"
    },
    gs_type = 1
  },
  mine99_003 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_03",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_003",
    evb2 = {
      "floor_003_outrange"
    },
    gs_type = 1
  },
  mine99_004 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_04",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_004",
    evb2 = {
      "floor_004_outrange"
    },
    gs_type = 1
  },
  mine99_005 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_05",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_005",
    evb2 = {
      "floor_005_outrange"
    },
    gs_type = 1
  },
  mine99_006 = {
    area = "wa_m_root",
    scene = "wa_b_root",
    map = "mi99_06",
    drift_param = bg_mine_99_06_param_table,
    evb = "floor_006",
    evb2 = {
      "floor_006_outrange"
    },
    gs_type = 5
  },
  mine99_007 = {
    area = "wa_m_root",
    scene = "wa_b_root",
    map = "mi99_07",
    drift_param = bg_mine_99_06_param_table,
    evb = "floor_007",
    evb2 = {
      "floor_007_outrange"
    },
    gs_type = 5
  },
  mine99_008 = {
    area = "wa_m_root",
    scene = "wa_b_root",
    map = "mi99_08",
    drift_param = bg_mine_99_06_param_table,
    evb = "floor_008",
    evb2 = {
      "floor_008_outrange"
    },
    gs_type = 5
  },
  mine99_009 = {
    area = "wa_m_root",
    scene = "wa_b_root",
    map = "mi99_09",
    drift_param = bg_mine_99_06_param_table,
    evb = "floor_009",
    evb2 = {
      "floor_009_outrange"
    },
    gs_type = 5
  },
  mine99_010 = {
    area = "wa_m_root",
    scene = "storm_a_root",
    map = "mi99_10",
    drift_param = bg_mine_99_06_param_table,
    evb = "floor_010",
    evb2 = {
      "floor_010_outrange"
    },
    gs_type = 5
  },
  mine99_011 = {
    area = "az_a_root",
    scene = "az_a_root",
    map = "mi99_11",
    drift_param = bg_mine_99_11_param_table,
    evb = "floor_011",
    evb2 = {
      "floor_011_outrange"
    },
    gs_type = 3,
    root_y_zero = true
  },
  mine99_012 = {
    area = "az_a_root",
    scene = "az_a_root",
    map = "mi99_12",
    drift_param = bg_mine_99_12_param_table,
    evb = "floor_012",
    evb2 = {
      "floor_012_outrange"
    },
    gs_type = 3,
    root_y_zero = true
  },
  mine99_013 = {
    area = "az_a_root",
    scene = "az_a_root",
    map = "mi99_13",
    drift_param = bg_mine_99_13_param_table,
    evb = "floor_013",
    evb2 = {
      "floor_013_outrange"
    },
    gs_type = 3,
    root_y_zero = true
  },
  mine99_014 = {
    area = "az_a_root",
    scene = "az_a_root",
    map = "mi99_14",
    drift_param = bg_mine_99_14_param_table,
    evb = "floor_014",
    evb2 = {
      "floor_014_outrange"
    },
    gs_type = 3,
    root_y_zero = true
  },
  mine99_015 = {
    area = "az_a_root",
    scene = "az_a_root",
    map = "mi99_15",
    drift_param = bg_mine_99_15_param_table,
    evb = "floor_015",
    evb2 = {
      "floor_015_outrange"
    },
    gs_type = 3,
    root_y_zero = true
  },
  mine99_016 = {
    area = "pi2_b_root",
    scene = "pi2_a_root",
    map = "mi99_16",
    drift_param = bg_mine_99_16_param_table,
    evb = "floor_016",
    evb2 = {
      "floor_016_outrange"
    },
    gs_type = 2,
    drift = false
  },
  mine99_017 = {
    area = "pi2_b_root",
    scene = "pi2_a_root",
    map = "mi99_17",
    drift_param = bg_mine_99_16_param_table,
    evb = "floor_017",
    evb2 = {
      "floor_017_outrange"
    },
    gs_type = 2,
    drift = false
  },
  mine99_018 = {
    area = "pi2_b_root",
    scene = "pi2_a_root",
    map = "mi99_18",
    drift_param = bg_mine_99_16_param_table,
    evb = "floor_018",
    evb2 = {
      "floor_018_outrange"
    },
    gs_type = 2,
    drift = false
  },
  mine99_019 = {
    area = "pi2_b_root",
    scene = "pi2_a_root",
    map = "mi99_19",
    drift_param = bg_mine_99_16_param_table,
    evb = "floor_019",
    evb2 = {
      "floor_019_outrange"
    },
    gs_type = 2,
    drift = false
  },
  mine99_020 = {
    area = "pi2_b_root",
    scene = "storm_a_root",
    map = "mi99_20",
    drift_param = bg_mine_99_16_param_table,
    evb = "floor_020",
    evb2 = {
      "floor_020_outrange"
    },
    gs_type = 2,
    drift = false
  },
  mine99_021 = {
    area = "az2_c_root",
    scene = "az2_a_root",
    map = "mi99_21",
    drift_param = bg_mine_99_21_param_table,
    evb = "floor_021",
    evb2 = {
      "floor_021_outrange"
    },
    gs_type = 4
  },
  mine99_022 = {
    area = "az2_c_root",
    scene = "az2_a_root",
    map = "mi99_22",
    drift_param = bg_mine_99_21_param_table,
    evb = "floor_022",
    evb2 = {
      "floor_022_outrange"
    },
    gs_type = 4
  },
  mine99_023 = {
    area = "az2_c_root",
    scene = "az2_a_root",
    map = "mi99_23",
    drift_param = bg_mine_99_21_param_table,
    evb = "floor_023",
    evb2 = {
      "floor_023_outrange"
    },
    gs_type = 4
  },
  mine99_024 = {
    area = "az2_c_root",
    scene = "az2_a_root",
    map = "mi99_24",
    drift_param = bg_mine_99_21_param_table,
    evb = "floor_024",
    evb2 = {
      "floor_024_outrange"
    },
    gs_type = 4
  },
  mine99_025 = {
    area = "az2_c_root",
    scene = "az2_a_root",
    map = "mi99_25",
    drift_param = bg_mine_99_21_param_table,
    evb = "floor_025",
    evb2 = {
      "floor_025_outrange"
    },
    gs_type = 4
  },
  mine99_026 = {
    area = "po_m26_root",
    scene = "storm_a_root",
    map = "mi99_26",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_026",
    evb2 = {
      "floor_026_outrange"
    },
    gs_type = 1,
    random = false
  },
  mine99_027 = {
    area = "wa_m27_root",
    scene = "storm_a_root",
    map = "mi99_27",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_027",
    evb2 = {
      "floor_027_outrange"
    },
    gs_type = 1,
    random = false
  },
  mine99_028 = {
    area = "ar_a_root",
    scene = "storm_a_root",
    map = "mi99_28",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_028",
    evb2 = {
      "floor_028_outrange"
    },
    gs_type = 1,
    random = false
  },
  mine99_029 = {
    area = "ed_a_root",
    scene = "storm_a_root",
    map = "mi99_29",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_029",
    evb2 = {
      "floor_029_outrange"
    },
    gs_type = 1,
    drift = false,
    random = false
  },
  mine99_030 = {
    area = "az4_b_root",
    scene = "az4_a_boss_root",
    map = "None",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_030",
    evb2 = {},
    gs_type = 6,
    drift = false,
    random = false,
    storm_dist = 23
  },
  mine99_031 = {
    area = "az3_b_root",
    scene = "az3_a_root",
    map = "mi99_31",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_031",
    evb2 = {
      "floor_031_outrange"
    },
    gs_type = 6,
    drift = false,
    storm_dist = 50,
    root_y_zero = true
  },
  mine99_032 = {
    area = "az3_b_root",
    scene = "az3_a_root",
    map = "mi99_32",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_032",
    evb2 = {
      "floor_032_outrange"
    },
    gs_type = 6,
    drift = false,
    storm_dist = 50,
    root_y_zero = true
  },
  mine99_033 = {
    area = "az3_b_root",
    scene = "az3_a_root",
    map = "mi99_33",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_033",
    evb2 = {
      "floor_033_outrange"
    },
    gs_type = 6,
    drift = false,
    storm_dist = 50,
    root_y_zero = true
  },
  mine99_034 = {
    area = "az4_c_root",
    scene = "az4_a_root",
    map = "mi99_34",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_034",
    evb2 = {},
    gs_type = 6,
    drift = false,
    storm_dist = 150
  },
  mine99_035 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_35",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_035",
    evb2 = {
      "floor_035_outrange"
    },
    gs_type = 1
  },
  mine99_036 = {
    area = "co_c_root",
    scene = "co_a_root",
    map = "mi99_36",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_036",
    evb2 = {
      "floor_036_outrange"
    },
    gs_type = 1,
    drift = false,
    storm_dist = 140
  },
  mine99_037 = {
    area = "az2_c_root",
    scene = "az2_a_root",
    map = "mi99_37",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_037",
    evb2 = {
      "floor_037_outrange"
    },
    gs_type = 1
  },
  mine99_038 = {
    area = "pi2_b_root",
    scene = "pi2_a_root",
    map = "mi99_38",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_038",
    evb2 = {
      "floor_038_outrange"
    },
    gs_type = 2,
    drift = false
  },
  mine99_039 = {
    area = "wa_m_root",
    scene = "wa_b_root",
    map = "mi99_39",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_039",
    evb2 = {
      "floor_039_outrange"
    },
    gs_type = 5
  },
  mine99_040 = {
    area = "az_a_root",
    scene = "az_a_root",
    map = "mi99_40",
    drift_param = bg_mine_99_40_param_table,
    evb = "floor_040",
    evb2 = {
      "floor_040_outrange"
    },
    gs_type = 3,
    root_y_zero = true
  },
  mine99_041 = {
    area = "co_c_root",
    scene = "co_a_root",
    map = "mi99_41",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_041",
    evb2 = {},
    gs_type = 1,
    drift = false,
    storm_dist = 50,
    root_y_zero = true
  },
  mine99_042 = {
    area = "wa_m_root",
    scene = "wa_b_root",
    map = "mi99_42",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_042",
    evb2 = {
      "floor_042_outrange"
    },
    gs_type = 1
  },
  mine99_043 = {
    area = "pi2_b_root",
    scene = "pi2_a_root",
    map = "mi99_43",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_043",
    evb2 = {
      "floor_043_outrange"
    },
    gs_type = 2,
    drift = false
  },
  mine99_044 = {
    area = "az4_c_root",
    scene = "az4_a_root",
    map = "mi99_44",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_044",
    evb2 = {},
    gs_type = 6,
    drift = false,
    storm_dist = 20
  },
  mine99_045 = {
    area = "et2_a_root",
    scene = "et2_a_root",
    map = "mi99_45",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_045",
    evb2 = {},
    gs_type = 6,
    drift = false,
    random = false,
    storm_dist = 25
  },
  mine99_046 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_46",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_046",
    evb2 = {
      "floor_046_outrange"
    },
    gs_type = 1
  },
  mine99_047 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_47",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_047",
    evb2 = {
      "floor_047_outrange"
    },
    gs_type = 1
  },
  mine99_048 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_48",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_048",
    evb2 = {
      "floor_048_outrange"
    },
    gs_type = 1
  },
  mine99_049 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_49",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_049",
    evb2 = {
      "floor_049_outrange"
    },
    gs_type = 1
  },
  mine99_050 = {
    area = "pi_e_root",
    scene = "pi_a_root",
    map = "mi99_50",
    drift_param = bg_mine_99_01_param_table,
    evb = "floor_050",
    evb2 = {
      "floor_050_outrange"
    },
    gs_type = 1
  }
}
