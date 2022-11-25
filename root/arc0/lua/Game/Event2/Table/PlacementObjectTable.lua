local L1_1, L2_2
kBU_ROOT = 1
kPO_ROOT = 2
kMI_ROOT = 3
kLO_ROOT = 4
kUP_ROOT = 5
kGO_ROOT = 6
kAR_ROOT = 7
kDT_ROOT = 8
kED_ROOT = 9
kCC_ROOT = 10
kWA_ROOT = 11
L0_0 = {}
L1_1 = kBU_ROOT
L2_2 = {
  "bu_a_root",
  "bu_d_root",
  "bu_f_root"
}
L0_0[L1_1] = L2_2
L1_1 = kPO_ROOT
L2_2 = {"po_a_root"}
L0_0[L1_1] = L2_2
L1_1 = kMI_ROOT
L2_2 = {"mi_a_root"}
L0_0[L1_1] = L2_2
L1_1 = kLO_ROOT
L2_2 = {"lo_a_root"}
L0_0[L1_1] = L2_2
L1_1 = kUP_ROOT
L2_2 = {
  "up_a_root",
  "up_b_root",
  "up_c_root"
}
L0_0[L1_1] = L2_2
L1_1 = kGO_ROOT
L2_2 = {"go_a_root"}
L0_0[L1_1] = L2_2
L1_1 = kAR_ROOT
L2_2 = {"ar_a_root", "ar_b_root"}
L0_0[L1_1] = L2_2
L1_1 = kDT_ROOT
L2_2 = {
  "dt_a_root",
  "dt_b_root",
  "dt_c_root"
}
L0_0[L1_1] = L2_2
L1_1 = kED_ROOT
L2_2 = {"ed_a_root", "ed_b_root"}
L0_0[L1_1] = L2_2
L1_1 = kCC_ROOT
L2_2 = {"cc_a_root", "cc_b_root"}
L0_0[L1_1] = L2_2
L1_1 = kWA_ROOT
L2_2 = {"wa_a_root", "wa_b_root"}
L0_0[L1_1] = L2_2
_area_root_names = L0_0
L0_0 = {}
L1_1 = kBU_ROOT
L2_2 = {}
L2_2.bu_a_02 = {}
L2_2.bu_a_15 = {}
L0_0[L1_1] = L2_2
L1_1 = kPO_ROOT
L2_2 = {}
L2_2.po_a_01a = {
  gimmick_bg = {
    {
      name = "gate_md_01",
      loc = {
        "gate_md_01_01"
      }
    }
  },
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.po_a_01b = {
  effect = {ef_bg_wtr_07m = 3, ef_bg_wtr_08m = 2}
}
L2_2.po_a_01c = {
  effect = {ef_bg_wtr_07m = 3, ef_bg_wtr_08m = 1}
}
L2_2.po_a_02 = {
  grabbed_obj = {
    {
      name = "fountain_kw_01_water",
      pos_list = {
        {
          pos = Vector(1.50885943917, 41.1796755138, -8.93668677245)
        }
      }
    }
  },
  effect = {ef_bg_wtr_07m = 2, ef_bg_wtr_08m = 2}
}
L2_2.po_a_03 = {
  grabbed_obj = {
    {
      name = "fountain_oc_01_water",
      pos_list = {
        {
          pos = Vector(30, 34.1752491901, -1.14930287509E-14)
        }
      }
    }
  },
  effect = {ef_bg_wtr_08m = 8}
}
L2_2.po_a_04a = {
  gimmick_bg = {
    {
      name = "container_kk_01",
      loc = {
        "container_kk_01_07",
        "container_kk_01_09",
        "container_kk_01_010",
        "container_kk_01_011"
      }
    },
    {
      name = "container_kk_02",
      loc = {
        "container_kk_02_09",
        "container_kk_02_013",
        "container_kk_02_016",
        "container_kk_02_017"
      }
    },
    {
      name = "container_kk_03",
      loc = {
        "container_kk_03_05",
        "container_kk_03_06",
        "container_kk_03_08"
      }
    },
    {
      name = "container_kk_05",
      loc = {
        "container_kk_05_01",
        "container_kk_05_02"
      }
    },
    {
      name = "container_ms_04",
      loc = {
        "container_ms_04_01",
        "container_ms_04_02"
      }
    }
  },
  effect = {ef_bg_wtr_07m = 2, ef_bg_wtr_08m = 4}
}
L2_2.po_a_04c = {
  gimmick_bg = {
    {
      name = "container_kk_01",
      loc = {
        "container_kk_01_01",
        "container_kk_01_02"
      }
    },
    {
      name = "container_kk_02",
      loc = {
        "container_kk_02_01",
        "container_kk_02_02"
      }
    },
    {
      name = "container_kk_03",
      loc = {
        "container_kk_03_01",
        "container_kk_03_02"
      }
    }
  }
}
L2_2.bridge_kw_01 = {
  gimmick_bg = {
    {
      name = "container_kk_01",
      loc = {
        "container_kk_01_01"
      }
    },
    {
      name = "container_kk_02",
      loc = {
        "container_kk_02_01",
        "container_kk_02_02"
      }
    },
    {
      name = "container_kk_03",
      loc = {
        "container_kk_03_01",
        "container_kk_03_02"
      }
    },
    {
      name = "container_ms_04",
      loc = {
        "container_ms_04_01"
      }
    }
  }
}
L2_2.bridge_kw_02 = {
  gimmick_bg = {
    {
      name = "container_kk_01",
      loc = {
        "container_kk_01_01"
      }
    },
    {
      name = "container_kk_02",
      loc = {
        "container_kk_02_01"
      }
    },
    {
      name = "container_kk_03",
      loc = {
        "container_kk_03_01"
      }
    },
    {
      name = "container_kk_05",
      loc = {
        "container_ms_04_01"
      }
    },
    {
      name = "container_ms_03",
      loc = {
        "container_ms_03_01"
      }
    },
    {
      name = "container_ms_04",
      loc = {
        "container_ms_04_01"
      }
    }
  }
}
L2_2.po_a_06 = {
  instans = {"_02", "_04"},
  effect = {ef_bg_wtr_07m = 2, ef_bg_wtr_08m = 2}
}
L2_2.po_a_10 = {
  instans = {
    "_01",
    "_02",
    "_03"
  },
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.po_a_13 = {
  instans = {
    "_01",
    "_02",
    "_03",
    "_04"
  },
  effect = {ef_bg_wtr_07m = 1}
}
L2_2.po_a_15 = {
  gimmick_bg = {
    {
      name = "container_kk_02",
      loc = {
        "container_kk_02_01",
        "container_kk_02_02"
      }
    },
    {
      name = "container_ms_03",
      loc = {
        "container_ms_03_06",
        "container_ms_03_05",
        "container_ms_03_04",
        "container_ms_03_03",
        "container_ms_03_02",
        "container_ms_03_01"
      }
    },
    {
      name = "container_ms_04",
      loc = {
        "container_ms_04_11",
        "container_ms_04_10",
        "container_ms_04_09",
        "container_ms_04_08",
        "container_ms_04_07",
        "container_ms_04_06",
        "container_ms_04_05",
        "container_ms_04_04",
        "container_ms_04_03",
        "container_ms_04_02",
        "container_ms_04_01"
      }
    }
  }
}
L2_2.po_a_19 = {
  instans = {
    "_01",
    "_02",
    "_03"
  },
  effect = {ef_bg_wtr_08m = 2}
}
L0_0[L1_1] = L2_2
L1_1 = kMI_ROOT
L2_2 = {}
L2_2.mi_a_01 = {
  effect = {ef_bg_wtr_07m = 4}
}
L2_2.mi_a_02 = {
  grabbed_obj = {
    {
      name = "mi_a_02_water_01"
    },
    {
      name = "mi_a_02_water_02"
    }
  },
  effect = {ef_bg_lqd_04m = 5}
}
L2_2.mi_a_03 = {
  effect = {ef_bg_wtr_07m = 5}
}
L2_2.mi_a_04 = {
  grabbed_obj = {
    {
      name = "mi_statue_kw_03_water",
      pos_list = {
        {
          pos = Vector(-72.1574001123, 0.187574584011, 19.8069008936),
          rot = XYZRotQuatD(0, -90, 0)
        }
      }
    }
  },
  effect = {ef_bg_wtr_07m = 7}
}
L2_2.mi_a_05a = {
  effect = {ef_bg_wtr_07m = 5}
}
L2_2.mi_a_05b = {
  effect = {ef_bg_wtr_07m = 3, ef_bg_wtr_08m = 1}
}
L2_2.mi_a_05c = {
  effect = {ef_bg_wtr_07m = 4}
}
L2_2.mi_a_06 = {
  instans = {"_01", "_02"},
  effect = {ef_bg_wtr_07m = 3, ef_bg_wtr_08m = 2}
}
L2_2.mi_a_07 = {
  effect = {ef_bg_wtr_07m = 3}
}
L2_2.mi_a_08 = {
  effect = {ef_bg_wtr_07m = 5}
}
L2_2.mi_a_09 = {
  instans = {"_01", "_02"},
  effect = {ef_bg_wtr_07m = 4}
}
L2_2.mi_a_10 = {
  effect = {ef_bg_wtr_07m = 3, ef_bg_wtr_08m = 1}
}
L2_2.mi_a_11 = {
  instans = {"_01", "_02"},
  effect = {ef_bg_wtr_07m = 1, ef_bg_wtr_08m = 3}
}
L2_2.mi_a_13 = {
  instans = {"_01", "_02"},
  effect = {ef_bg_wtr_07m = 3, ef_bg_wtr_08m = 1}
}
L2_2.mi_a_17 = {
  effect = {ef_bg_wtr_07m = 4, ef_bg_wtr_08m = 2}
}
L2_2.mi_a_18 = {
  instans = {
    "_01",
    "_02",
    "_03",
    "_04",
    "_05",
    "_06",
    "_07",
    "_08"
  },
  effect = {ef_bg_wtr_07m = 2}
}
L2_2.mi_a_20 = {
  instans = {
    "_01",
    "_02",
    "_03",
    "_04",
    "_05",
    "_06",
    "_07",
    "_08",
    "_09",
    "_10",
    "_11",
    "_12"
  },
  effect = {ef_bg_wtr_07m = 3}
}
L2_2.mi_a_21 = {
  instans = {
    "_01",
    "_02",
    "_03",
    "_04",
    "_05"
  },
  effect = {ef_bg_wtr_07m = 4}
}
L2_2.mi_a_23 = {
  instans = {
    "_01",
    "_02",
    "_03",
    "_04",
    "_05",
    "_06"
  },
  effect = {ef_bg_wtr_07m = 2}
}
L0_0[L1_1] = L2_2
L1_1 = kLO_ROOT
L2_2 = {}
L2_2.lo_a_02 = {
  grabbed_obj = {
    {
      name = "bowl_fl_01_water",
      pos_list = {
        {
          pos = Vector(-4.72375462482, 18.3474900078, -0.0208548240036),
          rot = XYZRotQuatD(0, 0, 0)
        }
      }
    },
    {
      name = "bowl_fl_02_water",
      pos_list = {
        {
          pos = Vector(11.5002998747, 11.4701084556, -1.97634554898),
          rot = XYZRotQuatD(1.53235533303, -4.75965861224, 2.42168376314)
        },
        {
          pos = Vector(-10.2565893647, 21.0003619977, -6.97760329033),
          rot = XYZRotQuatD(0, 0, 0)
        },
        {
          pos = Vector(3.99521841188, 18.5354818092, -1.00502228016),
          rot = XYZRotQuatD(-2, 3.25347121618, -2)
        },
        {
          pos = Vector(-0.132696252703, 18.858500971, -7.32308386634),
          rot = XYZRotQuatD(-2, 2.73799851022, -2)
        },
        {
          pos = Vector(7.48492425527, 14.624970715, 8.05684484113),
          rot = XYZRotQuatD(-2, 2.76312274824, 0.508598080387)
        },
        {
          pos = Vector(2.85794864916, 18.0989145633, 4.49768073646),
          rot = XYZRotQuatD(2, -2.87784440425, -2)
        },
        {
          pos = Vector(-1.76888682198, 19.2374530012, 8.34113703672),
          rot = XYZRotQuatD(-2, 1.86859601618, -0.043689639657)
        },
        {
          pos = Vector(-8.47347950872, 21.2832103768, 7.19891353974),
          rot = XYZRotQuatD(2, -85.3939983517, -2)
        },
        {
          pos = Vector(-13.3867408991, 19.9683815661, 1.25521609457),
          rot = XYZRotQuatD(0, 259.169001432, 2)
        }
      }
    },
    {
      name = "pool_fl_01_water",
      pos_list = {
        {
          pos = Vector(7.092392317, 4.94038053801, -7.5770920247),
          rot = XYZRotQuatD(0, -45.0543205716, 0)
        }
      }
    },
    {
      name = "pool_fl_02_water",
      pos_list = {
        {
          pos = Vector(3.36482626793, 4.28594829111, 9.12115438201),
          rot = XYZRotQuatD(0, -70.9344190691, 0)
        }
      }
    }
  },
  effect = {ef_bg_wtr_15m = 3}
}
L0_0[L1_1] = L2_2
L1_1 = kUP_ROOT
L2_2 = {}
L2_2.up_a_01 = {
  grabbed_obj = {
    {
      name = "garden_sk_08_water",
      pos_list = {
        {
          pos = Vector(11.4930932052, 51.205431297, -6.77615471086)
        },
        {
          pos = Vector(-42.4120847127, 49.4464688616, 5.74313775443)
        }
      }
    }
  }
}
L2_2.up_a_02 = {
  instans = {"_01", "_02"},
  grabbed_obj = {
    {
      name = "up_a_02_water_01"
    },
    {
      name = "up_a_02_water_02"
    },
    {
      name = "up_a_02_water_03"
    },
    {
      name = "up_a_02_water_04"
    },
    {
      name = "up_a_02_water_05"
    }
  }
}
L2_2.up_a_04 = {
  instans = {
    "_01",
    "_02",
    "_03"
  },
  grabbed_obj = {
    {
      name = "up_a_04_water_01"
    },
    {
      name = "up_a_04_water_02"
    },
    {
      name = "up_a_04_water_03"
    },
    {
      name = "garden_sk_10_water",
      pos_list = {
        {
          pos = Vector(33.3319379875, 32.3243927256, 0)
        }
      }
    },
    {
      name = "garden_sk_08_water",
      pos_list = {
        {
          pos = Vector(-34.0321952964, 21.9094149787, 66.0746514336)
        }
      }
    }
  }
}
L2_2.up_a_05 = {
  grabbed_obj = {
    {
      name = "up_a_05_water",
      pos_list = {
        {
          pos = Vector(-31.6973206659, 43.2783909764, -7.67497982498),
          rot = XYZRotQuatD(0, -97.8104957477, 0)
        }
      }
    },
    {
      name = "garden_sk_09_water",
      pos_list = {
        {
          pos = Vector(0.33202253689, 42.6733452477, -18.3820039668)
        }
      }
    }
  }
}
L2_2.up_a_08 = {
  grabbed_obj = {
    {
      name = "up_a_08_water"
    }
  }
}
L2_2.up_a_09 = {
  grabbed_obj = {
    {
      name = "up_a_09_water_01"
    },
    {
      name = "up_a_09_water_02"
    },
    {
      name = "up_a_09_water_03"
    },
    {
      name = "up_a_09_water_04"
    },
    {
      name = "garden_sk_08_water",
      pos_list = {
        {
          pos = Vector(6.9645947224, 22.360027064, 28.2833422431)
        },
        {
          pos = Vector(-22.4471903518, 8.36018008908, 112.82651084)
        },
        {
          pos = Vector(27.2055052607, 31.855071108, -79.4310232141)
        }
      }
    }
  },
  effect = {ef_bg_wtr_16m = 1}
}
L2_2.up_a_10 = {
  grabbed_obj = {
    {
      name = "up_a_10_water_01"
    },
    {
      name = "up_a_10_water_02"
    },
    {
      name = "up_a_10_water_03"
    },
    {
      name = "up_a_10_water_04"
    },
    {
      name = "up_a_10_water_05"
    },
    {
      name = "up_a_10_water_06"
    }
  },
  effect = {ef_bg_wtr_14m = 14}
}
L2_2.up_a_11 = {
  grabbed_obj = {
    {
      name = "up_a_11_water_01"
    },
    {
      name = "up_a_11_water_02"
    }
  },
  effect = {ef_bg_lqd_03m = 3}
}
L0_0[L1_1] = L2_2
L1_1 = kGO_ROOT
L2_2 = {}
L2_2.go_a_root = {
  grabbed_obj = {
    {
      name = "go_fountain_a_water",
      pos_list = {
        {
          pos = Vector(0, 115.400429687, 15)
        }
      }
    },
    {
      name = "go_waterway_a_water",
      pos_list = {
        {
          pos = Vector(-60.4990093556, 18.644525479, 48.6825592923),
          rot = XYZRotQuatD(0, -82.7681834791, 0)
        },
        {
          pos = Vector(70.6014550193, -33.7375740461, -20.955319497),
          rot = XYZRotQuatD(0, 88.9036789923, 0)
        },
        {
          pos = Vector(26.4751798864, 58.4405061227, 84.6351554758),
          rot = XYZRotQuatD(0, 7.63303642889, 0)
        },
        {
          pos = Vector(-16.4885977535, 25.3012207326, 79.7994222337),
          rot = XYZRotQuatD(0, -22.5666182391, 0)
        },
        {
          pos = Vector(-55.7057320737, 20.3622117244, -60.046810315),
          rot = XYZRotQuatD(0, 256.578412953, 0)
        },
        {
          pos = Vector(-63.0609676266, 56.4711316267, 33.3190032998),
          rot = XYZRotQuatD(0, -63.7444149462, 0)
        },
        {
          pos = Vector(64.8551263903, 27.7422373792, 66.1823637197),
          rot = XYZRotQuatD(0, 68.1395285437, 0)
        },
        {
          pos = Vector(-4.41978287896, 56.0715135042, -41.1953165508),
          rot = XYZRotQuatD(0, 154.868815077, 0)
        },
        {
          pos = Vector(68.3401369075, 58.9977540255, -42.3660537326),
          rot = XYZRotQuatD(0, 116.255585054, 0)
        },
        {
          pos = Vector(-38.3392439056, 21.9551598314, -69.1210326875),
          rot = XYZRotQuatD(0, 183.344653685, 0)
        },
        {
          pos = Vector(77.0418878254, 54.0025287531, 36.4317925193),
          rot = XYZRotQuatD(0, 81.7330271751, 0)
        },
        {
          pos = Vector(17.7184130706, 24.5251270951, 85.5309476116),
          rot = XYZRotQuatD(0, -9.92588262565, 0)
        }
      }
    }
  },
  effect = {ef_bg_lqd_03m = 2, ef_bg_lqd_04m = 12}
}
L0_0[L1_1] = L2_2
L1_1 = kAR_ROOT
L2_2 = {}
L2_2.ar_a = {
  effect = {ef_bg_wtr_08m = 4}
}
L2_2.ar_b = {
  effect = {ef_bg_wtr_08m = 4}
}
L0_0[L1_1] = L2_2
L1_1 = kDT_ROOT
L2_2 = {}
L2_2.area_reg = {
  {
    name = "g1_base_cc_sign_af",
    loc = "g1_base_cc_sign_01"
  }
}
L2_2.g1_base_dt_a1_road_01 = {
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.g1_base_dt_b1_road_01 = {
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.g1_base_dt_f1_road_01 = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_dt_f1_road_01_brk = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_dt_g1_road_01 = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_dt_g1_road_01_brk = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_dt_g2_road = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_dt_i1_road = {
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.g1_base_dt_k1_road_01 = {
  effect = {ef_bg_wtr_08m = 1}
}
L0_0[L1_1] = L2_2
L1_1 = kED_ROOT
L2_2 = {}
L2_2.g1_base_ed_a1_road_02 = {
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.g1_base_ed_b1_road_01 = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_ed_b2_road = {
  effect = {ef_bg_wtr_07m = 2}
}
L2_2.g1_base_ed_d1_road = {
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.g1_base_ed_d1_road_01 = {
  effect = {ef_bg_wtr_07m = 1, ef_bg_wtr_08m = 2}
}
L2_2.g1_base_ed_f1_b_road_01 = {
  effect = {ef_bg_wtr_08m = 3}
}
L2_2.g1_base_ed_f1_c_road = {
  grabbed_obj = {
    {
      name = "g1_monument_sn_01_water",
      pos_list = {
        {
          pos = Vector(2.06758789063, 2.71506347656, -30.28875)
        }
      }
    }
  }
}
L0_0[L1_1] = L2_2
L1_1 = kCC_ROOT
L2_2 = {}
L2_2.g1_base_cc_a_road_02 = {
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.g1_base_cc_b1_road_07 = {
  grabbed_obj = {
    {
      name = "g1_fountain_sk_01_water",
      pos_list = {
        {
          pos = Vector(-3.41597787359, -2.01860351563, -7.06620708574)
        }
      }
    }
  },
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_cc_b2_road_01 = {
  effect = {ef_bg_wtr_07m = 2}
}
L2_2.g1_base_cc_c2_road_02 = {
  effect = {ef_bg_wtr_07m = 1}
}
L2_2.g1_base_cc_d1_road_01 = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_cc_d1_road_02 = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_cc_d2_road = {
  effect = {ef_bg_wtr_08m = 2}
}
L2_2.g1_base_cc_d2_road_01 = {
  effect = {ef_bg_wtr_07m = 1, ef_bg_wtr_08m = 1}
}
L2_2.g1_base_cc_e1_road_04 = {
  effect = {ef_bg_wtr_08m = 1}
}
L2_2.g1_base_cc_g_road_01 = {
  effect = {ef_bg_wtr_08m = 3}
}
L2_2.g1_base_cc_sign = {
  AreaRegularBg = true,
  grabbed_obj = {
    {
      name = "g1_monument_sn_01_water",
      pos_list = {
        {
          pos = Vector(96.0955861045, 50.6938329061, 0.907612717343)
        }
      }
    }
  }
}
L2_2.g1_base_cc_sign_af = {
  AreaRegularBg = true,
  grabbed_obj = {
    {
      name = "g1_monument_sn_01_water",
      pos_list = {
        {
          pos = Vector(96.0955861045, 50.6938329061, 0.907612717343)
        }
      }
    }
  }
}
L0_0[L1_1] = L2_2
L1_1 = kWA_ROOT
L2_2 = {}
L2_2.wa_a_01 = {
  grabbed_obj = {
    {
      name = "wa_a_01_water",
      pos_list = {
        {
          pos = Vector(-23.1513892599, 23.900137589, 25.2126182149)
        }
      }
    }
  }
}
L0_0[L1_1] = L2_2
_placement_object_list = L0_0
