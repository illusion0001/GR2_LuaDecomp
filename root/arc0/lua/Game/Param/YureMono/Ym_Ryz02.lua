L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_arm",
    Node1 = "bn_l_arm",
    Pos0 = {
      0,
      0,
      0
    },
    Pos1 = {
      0,
      0,
      0.23
    },
    Rad = 0.05
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_arm",
    Node1 = "bn_r_arm",
    Pos0 = {
      0,
      0,
      0
    },
    Pos1 = {
      0,
      0,
      0.23
    },
    Rad = 0.05
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_forearm",
    Node1 = "bn_l_forearm",
    Pos0 = {
      0,
      0,
      0
    },
    Pos1 = {
      0,
      0,
      0.26
    },
    Rad = 0.05
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_forearm",
    Node1 = "bn_r_forearm",
    Pos0 = {
      0,
      0,
      0
    },
    Pos1 = {
      0,
      0,
      0.26
    },
    Rad = 0.05
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine0",
    Pos = {
      0.02,
      -0.025,
      0.165
    },
    Rad = 0.11
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine0",
    Pos = {
      -0.02,
      -0.025,
      0.165
    },
    Rad = 0.11
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      0.015,
      -0.01,
      0.055
    },
    Pos1 = {
      0.025,
      -0.005,
      0.005
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      -0.015,
      -0.01,
      0.055
    },
    Pos1 = {
      -0.025,
      -0.005,
      0.005
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis",
    Node1 = "bn_pelvis",
    Pos0 = {
      0.02,
      0,
      -0.005
    },
    Pos1 = {
      0.085,
      0,
      0.165
    },
    Rad = 0.075
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis",
    Node1 = "bn_pelvis",
    Pos0 = {
      -0.02,
      0,
      -0.005
    },
    Pos1 = {
      -0.085,
      0,
      0.165
    },
    Rad = 0.075
  }
}
L0_0.Dbg_IsDisp = true
Col_Jacket = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.015,
      0.035,
      0.035
    },
    Rad = 0.105
  }
}
Col_HairMomiL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.015,
      0.035,
      0.035
    },
    Rad = 0.105
  }
}
Col_HairMomiR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.065,
      0.035,
      0.035
    },
    Rad = 0.155
  }
}
Col_HairSideL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.035,
      0.05,
      0.05
    },
    Rad = 0.155
  }
}
Col_HairEarL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.035,
      0.05,
      0.05
    },
    Rad = 0.155
  }
}
Col_HairEarR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.05,
      0.05
    },
    Rad = 0.13
  }
}
L0_0.Dbg_IsDisp = true
Col_HairBack = L0_0
L0_0 = kYm_Type_Himo
SusoVibParam = {
  StdLen = 0.25,
  {
    AirBottom = 0.01,
    Spd = 0,
    SpdAir = 0.77,
    Pow = 0,
    PowAir = 0.07
  },
  {
    AirBottom = 0.08,
    Spd = 0,
    SpdAir = 1.1,
    Pow = 0,
    PowAir = 0.1
  }
}
Ym_Ryz02 = {
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairMomiL,
    GrvRate = 0.5,
    ColRad = 0,
    VibParam = {
      StdLen = 0.25,
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
    },
    {
      "bn_l_fr_hair0"
    },
    {
      "bn_l_fr_hair1",
      ColRad = 0.015,
      AnimRate = 0.8
    },
    {
      "dm_l_fr_hair2_end",
      AnimRate = 0.15
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairMomiR,
    GrvRate = 0.5,
    ColRad = 0,
    VibParam = {
      StdLen = 0.25,
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
    },
    {
      "bn_r_fr_hair0"
    },
    {
      "bn_r_fr_hair1",
      ColRad = 0.015,
      AnimRate = 0.8
    },
    {
      "dm_r_fr_hair2_end",
      AnimRate = 0.15
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideL,
    GrvRate = 0.5,
    ColRad = 0,
    VibParam = {
      StdLen = 0.25,
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
    },
    {
      "bn_l_sd_hairB0"
    },
    {
      "bn_l_sd_hairB1",
      ColRad = 0.015,
      AnimRate = 0.8
    },
    {
      "dm_l_sd_hairB2_end",
      AnimRate = 0.15
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairEarL,
    GrvRate = 0.5,
    ColRad = 0,
    VibParam = {
      StdLen = 0.25,
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
    },
    {
      "bn_l_sd_hair0"
    },
    {
      "dm_l_sd_hair1_end",
      AnimRate = 0.5
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairEarR,
    GrvRate = 0.5,
    ColRad = 0,
    VibParam = {
      StdLen = 0.25,
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
    },
    {
      "bn_r_sd_hair0"
    },
    {
      "dm_r_sd_hair0_end",
      AnimRate = 0.5
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBack,
    GrvRate = 0.5,
    ColRad = 0,
    VibParam = {
      StdLen = 0.25,
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
    },
    {
      "bn_center_hair0"
    },
    {
      "dm_center_hair1_end",
      AnimRate = 0.3
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Jacket,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = false,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 1,
    BeneNobiX = 0.5,
    ColPowXHalf = 0.4,
    GrvRate = 0.7,
    AirRegV = 0.7,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.1,
    VibParam = SusoVibParam,
    {
      {
        "bn_l_fr_jkt0"
      },
      {
        "bn_l_fr_jkt1",
        AnimRate = 1
      },
      {
        "bn_l_fr_jkt2",
        AnimRate = 0.7
      },
      {
        "dm_l_fr_jkt3_end",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_l_sd_jkt0"
      },
      {
        "bn_l_sd_jkt1",
        AnimRate = 1
      },
      {
        "bn_l_sd_jkt2",
        AnimRate = 0.7
      },
      {
        "dm_l_sd_jkt3_end",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_l_bk_jkt0"
      },
      {
        "bn_l_bk_jkt1",
        AnimRate = 1
      },
      {
        "bn_l_bk_jkt2",
        AnimRate = 0.7
      },
      {
        "dm_l_bk_jkt3_end",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_r_bk_jkt0"
      },
      {
        "bn_r_bk_jkt1",
        AnimRate = 1
      },
      {
        "bn_r_bk_jkt2",
        AnimRate = 0.7
      },
      {
        "dm_r_bk_jkt3_end",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_r_sd_jkt0"
      },
      {
        "bn_r_sd_jkt1",
        AnimRate = 1
      },
      {
        "bn_r_sd_jkt2",
        AnimRate = 0.7
      },
      {
        "dm_r_sd_jkt3_end",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_r_fr_jkt0"
      },
      {
        "bn_r_fr_jkt1",
        AnimRate = 1
      },
      {
        "bn_r_fr_jkt2",
        AnimRate = 0.7
      },
      {
        "dm_r_fr_jkt3_end",
        AnimRate = 0.2
      }
    }
  }
}
