local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
L0_0 = 0.5
L1_1 = 0.1
L2_2 = 1
L3_3 = 0.05
L4_4 = 0.05
L5_5 = 0.15
L6_6 = 1
L7_7 = 0.2
L8_8 = {}
Ym_Ryz01_Col_Non = L8_8
L8_8 = {
  {
    Type = kYm_ColType_Surface,
    Node = "bn_head",
    Pos = {
      0,
      0.045,
      0.06
    },
    Vec = {
      0,
      -2.255,
      -2.145
    }
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      0.035,
      0.035
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      -0.01,
      0.065
    },
    Rad = 0.055
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      0.015,
      0.01
    },
    Node1 = "bn_jaw",
    Pos1 = {
      0,
      0.015,
      0.01
    },
    Rad = 0.045
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_neck",
    Pos0 = {
      0,
      -0.005,
      -0.04
    },
    Node1 = "bn_neck",
    Pos1 = {
      0,
      0.03,
      0.175
    },
    Rad = 0.04
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      -0.005,
      0.04
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Pos0 = {
      -0.05,
      -0.005,
      -0.01
    },
    Node1 = "bn_l_clavicle",
    Pos1 = {
      0.005,
      -0.005,
      0.105
    },
    Rad = 0.045
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Pos0 = {
      0.05,
      -0.005,
      -0.01
    },
    Node1 = "bn_r_clavicle",
    Pos1 = {
      -0.005,
      -0.005,
      0.105
    },
    Rad = 0.045
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Pos0 = {
      0.005,
      0.005,
      0.06
    },
    Node1 = "bn_l_breastphy_SHB",
    Pos1 = {
      0.01,
      -0.005,
      0
    },
    Rad = 0.055
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Pos0 = {
      -0.005,
      0.005,
      0.06
    },
    Node1 = "bn_r_breastphy_SHB",
    Pos1 = {
      -0.01,
      -0.005,
      0
    },
    Rad = 0.055
  }
}
L8_8.Dbg_IsDisp = true
Ym_Ryz01_Col_Head = L8_8
L8_8 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      0,
      0
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      0.115,
      0.13
    },
    Rad = 0.18
  }
}
Ym_Ryz01_Col_HeadForHat = L8_8
L8_8 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      -0.02,
      0.005,
      0.055
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.015,
      0,
      0.405
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Pos0 = {
      0.02,
      0.005,
      0.055
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.015,
      0,
      0.405
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      0.01,
      -0.2,
      0.17
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      -0.01,
      -0.2,
      0.17
    },
    Rad = 0.31
  }
}
L8_8.Dbg_IsDisp = true
Ym_Ryz01_Col_LegForFront = L8_8
L8_8 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      -0.07,
      -0.01,
      0.055
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.035,
      -0.015,
      0.405
    },
    Rad = 0.14
  }
}
Ym_Ryz01_Col_LegForLeft = L8_8
L8_8 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Pos0 = {
      0.07,
      -0.01,
      0.055
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.035,
      -0.015,
      0.405
    },
    Rad = 0.14
  }
}
Ym_Ryz01_Col_LegForRight = L8_8
L8_8 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      0,
      -0.075,
      0.065
    },
    Rad = 0.185
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      -0.005,
      0.01,
      0.055
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      0.01,
      -0.015,
      0.405
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Pos0 = {
      0.005,
      0.01,
      0.055
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      -0.01,
      -0.015,
      0.405
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_leg",
    Pos0 = {
      0,
      0,
      0
    },
    Node1 = "bn_l_leg",
    Pos1 = {
      0.01,
      -0.015,
      0.405
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_leg",
    Pos0 = {
      0,
      0,
      0
    },
    Node1 = "bn_r_leg",
    Pos1 = {
      -0.01,
      -0.015,
      0.405
    },
    Rad = 0.085
  }
}
Ym_Ryz01_Col_LegForBack = L8_8
L8_8 = {
  {
    Spd = 0,
    SpdAir = -0.3,
    Pow = 0,
    PowAir = 0.13
  },
  {
    Spd = 0,
    SpdAir = 0.7,
    Pow = 0,
    PowAir = 0.1
  }
}
L8_8.StdLen = 0.25
SkirtVibParam = {
  StdLen = 0.25,
  {
    AirBottom = 0.01,
    Spd = 0,
    SpdAir = 2.31,
    Pow = 0,
    PowAir = 0.05
  },
  {
    AirBottom = 0.08,
    Spd = 0,
    SpdAir = 3.3000000000000003,
    Pow = 0,
    PowAir = 0.07
  }
}
Ym_Ryz01 = {
  Dbg_IsDispBody = true,
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_fr_hairA0"
    },
    {
      "bn_l_fr_hairA1"
    },
    {
      "bn_l_fr_hairA2"
    },
    {
      "bn_l_fr_hairA3"
    },
    {
      "bn_l_fr_hairA4"
    },
    {
      "bn_l_fr_hairA5"
    },
    {
      "dm_l_fr_hairA6_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_fr_hairA0"
    },
    {
      "bn_r_fr_hairA1"
    },
    {
      "bn_r_fr_hairA2"
    },
    {
      "bn_r_fr_hairA3"
    },
    {
      "bn_r_fr_hairA4"
    },
    {
      "bn_r_fr_hairA5"
    },
    {
      "dm_r_fr_hairA6_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_sd_hair0"
    },
    {
      "bn_r_sd_hair1"
    },
    {
      "bn_r_sd_hair2"
    },
    {
      "bn_r_sd_hair3"
    },
    {
      "dm_r_sd_hair4_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_bt_hair0"
    },
    {
      "bn_r_bt_hair1"
    },
    {
      "bn_r_bt_hair2"
    },
    {
      "bn_r_bt_hair3"
    },
    {
      "dm_r_bt_hair4_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_bk_hair0"
    },
    {
      "bn_r_bk_hair1"
    },
    {
      "bn_r_bk_hair2"
    },
    {
      "bn_r_bk_hair3"
    },
    {
      "dm_r_bk_hair4_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_center_hair0"
    },
    {
      "bn_center_hair1"
    },
    {
      "bn_center_hair2"
    },
    {
      "bn_center_hair3"
    },
    {
      "bn_center_hair4"
    },
    {
      "dm_center_hair5_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_bt_hair0"
    },
    {
      "bn_l_bt_hair1"
    },
    {
      "bn_l_bt_hair2"
    },
    {
      "bn_l_bt_hair3"
    },
    {
      "dm_l_bt_hair4_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_bk_hair0"
    },
    {
      "bn_l_bk_hair1"
    },
    {
      "bn_l_bk_hair2"
    },
    {
      "bn_l_bk_hair3"
    },
    {
      "dm_l_bk_hair4_end"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_Head,
    VibParam = L8_8,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_sd_hair0"
    },
    {
      "bn_l_sd_hair1"
    },
    {
      "bn_l_sd_hair2"
    },
    {
      "bn_l_sd_hair3"
    },
    {
      "dm_l_sd_hair4_end"
    }
  },
  {
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_LegForFront,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.2,
    VibParam = SkirtVibParam,
    {
      {
        "bn_r_fr_skirt0",
        AnimRate = L6_6
      },
      {
        "bn_r_fr_skirt1",
        AnimRate = L6_6
      },
      {
        "bn_r_fr_skirt2",
        AnimRate = L6_6
      },
      {
        "bn_r_fr_skirt3"
      },
      {
        "bn_r_fr_skirt4"
      },
      {
        "dm_r_fr_skirt5_end"
      }
    },
    {
      {
        "bn_c_fr_skirt0",
        AnimRate = L6_6
      },
      {
        "bn_c_fr_skirt1",
        AnimRate = L6_6
      },
      {
        "bn_c_fr_skirt2",
        AnimRate = L6_6
      },
      {
        "bn_c_fr_skirt3"
      },
      {
        "bn_c_fr_skirt4"
      },
      {
        "dm_c_fr_skirt5_end"
      }
    },
    {
      {
        "bn_l_fr_skirt0",
        AnimRate = L6_6
      },
      {
        "bn_l_fr_skirt1",
        AnimRate = L6_6
      },
      {
        "bn_l_fr_skirt2",
        AnimRate = L6_6
      },
      {
        "bn_l_fr_skirt3"
      },
      {
        "bn_l_fr_skirt4"
      },
      {
        "dm_l_fr_skirt5_end"
      }
    }
  },
  {
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_LegForLeft,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.2,
    VibParam = SkirtVibParam,
    {
      {
        "bn_l_sd_skirtA0",
        AnimRate = L7_7
      },
      {
        "bn_l_sd_skirtA1",
        AnimRate = L7_7
      },
      {
        "bn_l_sd_skirtA2"
      },
      {
        "bn_l_sd_skirtA3"
      },
      {
        "bn_l_sd_skirtA4"
      },
      {
        "dm_l_sd_skirtA5_end"
      }
    },
    {
      {
        "bn_l_sd_skirtB0",
        AnimRate = L7_7
      },
      {
        "bn_l_sd_skirtB1",
        AnimRate = L7_7
      },
      {
        "bn_l_sd_skirtB2"
      },
      {
        "bn_l_sd_skirtB3"
      },
      {
        "bn_l_sd_skirtB4"
      },
      {
        "dm_l_sd_skirtB5_end"
      }
    },
    {
      {
        "bn_l_sd_skirtC0",
        AnimRate = L7_7
      },
      {
        "bn_l_sd_skirtC1",
        AnimRate = L7_7
      },
      {
        "bn_l_sd_skirtC2"
      },
      {
        "bn_l_sd_skirtC3"
      },
      {
        "bn_l_sd_skirtC4"
      },
      {
        "dm_l_sd_skirtC5_end"
      }
    }
  },
  {
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_LegForRight,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.2,
    VibParam = SkirtVibParam,
    {
      {
        "bn_r_sd_skirtC0",
        AnimRate = L7_7
      },
      {
        "bn_r_sd_skirtC1",
        AnimRate = L7_7
      },
      {
        "bn_r_sd_skirtC2"
      },
      {
        "bn_r_sd_skirtC3"
      },
      {
        "bn_r_sd_skirtC4"
      },
      {
        "dm_r_sd_skirtC5_end"
      }
    },
    {
      {
        "bn_r_sd_skirtB0",
        AnimRate = L7_7
      },
      {
        "bn_r_sd_skirtB1",
        AnimRate = L7_7
      },
      {
        "bn_r_sd_skirtB2"
      },
      {
        "bn_r_sd_skirtB3"
      },
      {
        "bn_r_sd_skirtB4"
      },
      {
        "dm_r_sd_skirtB5_end"
      }
    },
    {
      {
        "bn_r_sd_skirtA0",
        AnimRate = L7_7
      },
      {
        "bn_r_sd_skirtA1",
        AnimRate = L7_7
      },
      {
        "bn_r_sd_skirtA2"
      },
      {
        "bn_r_sd_skirtA3"
      },
      {
        "bn_r_sd_skirtA4"
      },
      {
        "dm_r_sd_skirtA5_end"
      }
    }
  },
  {
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_LegForBack,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.2,
    VibParam = SkirtVibParam,
    {
      {
        "bn_l_bk_skirt0",
        AnimRate = L6_6
      },
      {
        "bn_l_bk_skirt1",
        AnimRate = L6_6
      },
      {
        "bn_l_bk_skirt2",
        AnimRate = L6_6
      },
      {
        "bn_l_bk_skirt3"
      },
      {
        "bn_l_bk_skirt4"
      },
      {
        "dm_l_bk_skirt5_end"
      }
    },
    {
      {
        "bn_c_bk_skirt0",
        AnimRate = L6_6
      },
      {
        "bn_c_bk_skirt1",
        AnimRate = L6_6
      },
      {
        "bn_c_bk_skirt2",
        AnimRate = L6_6
      },
      {
        "bn_c_bk_skirt3"
      },
      {
        "bn_c_bk_skirt4"
      },
      {
        "dm_c_bk_skirt5_end"
      }
    },
    {
      {
        "bn_r_bk_skirt0",
        AnimRate = L6_6
      },
      {
        "bn_r_bk_skirt1",
        AnimRate = L6_6
      },
      {
        "bn_r_bk_skirt2",
        AnimRate = L6_6
      },
      {
        "bn_r_bk_skirt3"
      },
      {
        "bn_r_bk_skirt4"
      },
      {
        "dm_r_bk_skirt5_end"
      }
    }
  },
  {
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Ryz01_Col_HeadForHat,
    IsTube = true,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    GrvRate = 0,
    AirRegV = 0.9,
    AirRegP = 0.3,
    AnimRate = 0.99,
    ColRad = 0,
    StraightPowZ = 0.2,
    PressAxis = {
      0.9,
      0.2,
      0
    },
    {
      {
        "bn_l_fr_hat0"
      },
      {
        "dm_l_fr_hat1_end"
      }
    },
    {
      {
        "bn_l_sd_hat0"
      },
      {
        "dm_l_sd_hat1_end"
      }
    },
    {
      {
        "bn_l_bk_hat0"
      },
      {
        "dm_l_bk_hat1_end"
      }
    },
    {
      {
        "bn_c_bk_hat0"
      },
      {
        "dm_c_bk_hat1_end"
      }
    },
    {
      {
        "bn_r_bk_hat0"
      },
      {
        "dm_r_bk_hat1_end"
      }
    },
    {
      {
        "bn_r_sd_hat0"
      },
      {
        "dm_r_sd_hat1_end"
      }
    },
    {
      {
        "bn_r_fr_hat0"
      },
      {
        "dm_r_fr_hat1_end"
      }
    },
    {
      {
        "bn_c_fr_hat0"
      },
      {
        "dm_c_fr_hat1_end"
      }
    }
  }
}
