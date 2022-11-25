L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      0.19,
      0
    },
    Pos1 = {
      0,
      0.155,
      0
    },
    Rad = 0.34
  }
}
Col_StoleFC = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      0.19,
      0
    },
    Pos1 = {
      0,
      0.155,
      0
    },
    Rad = 0.34
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Node1 = "bn_l_arm",
    Pos0 = {
      0,
      0,
      0.14
    },
    Pos1 = {
      0,
      -0.02,
      0.255
    },
    Rad = 0.075
  }
}
Col_StoleFL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      0.19,
      0
    },
    Pos1 = {
      0,
      0.155,
      0
    },
    Rad = 0.34
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Node1 = "bn_r_arm",
    Pos0 = {
      0,
      0,
      0.14
    },
    Pos1 = {
      0,
      -0.02,
      0.255
    },
    Rad = 0.075
  }
}
Col_StoleFR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Node1 = "bn_l_arm",
    Pos0 = {
      0,
      0,
      0.14
    },
    Pos1 = {
      0,
      -0.02,
      0.255
    },
    Rad = 0.075
  }
}
Col_StoleL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Node1 = "bn_r_arm",
    Pos0 = {
      0,
      0,
      0.14
    },
    Pos1 = {
      0,
      -0.02,
      0.255
    },
    Rad = 0.075
  }
}
Col_StoleR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      -0.175,
      0
    },
    Pos1 = {
      0,
      -0.17,
      0
    },
    Rad = 0.34
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Node1 = "bn_l_arm",
    Pos0 = {
      0,
      0,
      0.14
    },
    Pos1 = {
      0,
      -0.02,
      0.255
    },
    Rad = 0.075
  }
}
L0_0.Dbg_IsDisp = true
Col_StoleBL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      -0.175,
      0
    },
    Pos1 = {
      0,
      -0.17,
      0
    },
    Rad = 0.34
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Node1 = "bn_r_arm",
    Pos0 = {
      0,
      0,
      0.14
    },
    Pos1 = {
      0,
      -0.02,
      0.255
    },
    Rad = 0.075
  }
}
L0_0.Dbg_IsDisp = true
Col_StoleBR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      -0.175,
      0
    },
    Pos1 = {
      0,
      -0.17,
      0
    },
    Rad = 0.34
  }
}
L0_0.Dbg_IsDisp = true
Col_StoleB = L0_0
L0_0 = {
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleFC,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.03,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_fr_a0_ga01"
    },
    {
      "bn_l_stole_fr_a1_ga01",
      AnimRate = 0.1
    },
    {
      "dm_l_stole_fr_a2_ga01"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleFC,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.03,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_fr_a0_ga01"
    },
    {
      "bn_r_stole_fr_a1_ga01",
      AnimRate = 0.1
    },
    {
      "dm_r_stole_fr_a2_ga01"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleFL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_fr_b0_ga01"
    },
    {
      "dm_l_stole_fr_b1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleFL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_cl_b0_ga01"
    },
    {
      "dm_l_stole_cl_b1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleFR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_fr_b0_ga01"
    },
    {
      "dm_r_stole_fr_b1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleFR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_cl_b0_ga01"
    },
    {
      "dm_r_stole_cl_b1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.03,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_si_a0_ga01"
    },
    {
      "dm_l_stole_si_a1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.03,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_si_b0_ga01"
    },
    {
      "dm_l_stole_si_b1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_si_c0_ga01"
    },
    {
      "dm_l_stole_si_c1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.03,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_si_a0_ga01"
    },
    {
      "dm_r_stole_si_a1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.03,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_si_b0_ga01"
    },
    {
      "dm_r_stole_si_b1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.03,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_si_c0_ga01"
    },
    {
      "dm_r_stole_si_c1_ga01",
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleBL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_cl_c0_ga01"
    },
    {
      "dm_l_stole_cl_c1_ga01",
      AnimRate = 0.02
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleBR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_cl_c0_ga01"
    },
    {
      "dm_r_stole_cl_c1_ga01",
      AnimRate = 0.02
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleB,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_ba_b0_ga01"
    },
    {
      "dm_l_stole_ba_b1_ga01",
      AnimRate = 0.05
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleB,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_l_stole_ba_a0_ga01"
    },
    {
      "dm_l_stole_ba_a1_ga01",
      AnimRate = 0.05
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleB,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_ba_a0_ga01"
    },
    {
      "dm_r_stole_ba_a1_ga01",
      AnimRate = 0.05
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_StoleB,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_r_stole_ba_b0_ga01"
    },
    {
      "dm_r_stole_ba_b1_ga01",
      AnimRate = 0.05
    }
  }
}
L0_0.Dbg_IsDispBody = true
Ym_Gad01 = L0_0
