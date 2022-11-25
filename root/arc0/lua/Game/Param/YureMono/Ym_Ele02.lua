L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.1,
      -0.01
    },
    Rad = 0.145
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Node1 = "bn_spine1",
    Pos0 = {
      0,
      -0.02,
      0.015
    },
    Pos1 = {
      0,
      -0.03,
      0.04
    },
    Rad = 0.13
  }
}
L0_0.Dbg_IsDisp = true
Col_HairFront = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.005,
      0.03
    },
    Rad = 0.145
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Pos0 = {
      0,
      -0.02,
      0
    },
    Node1 = "bn_pelvis_end",
    Pos1 = {
      0,
      0,
      -0.035
    },
    Rad = 0.195
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.08,
      0.02,
      -0.04
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.04,
      0,
      0.465
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.08,
      0.02,
      -0.04
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.04,
      0,
      0.465
    },
    Rad = 0.12
  }
}
Col_Hair = L0_0
L0_0 = 1
Ym_Ele02 = {
  Dbg_DispUserChannel = {
    "ym_ir__master_value",
    "ym_ir__master_rate",
    "ym_ir_all",
    "ym_ir_hair"
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_fr_hair0"
    },
    {
      "bn_l_fr_hair1",
      AnimRate = 1,
      StraightPow = 0
    },
    {
      "bn_l_fr_hair2",
      AnimRate = 1,
      StraightPow = 0
    },
    {
      "bn_l_fr_hair3",
      AnimRate = 0.15,
      StraightPow = 0
    },
    {
      "bn_l_fr_hair4",
      AnimRate = 0.1,
      StraightPow = 0.2
    },
    {
      "bn_l_fr_hair5",
      StraightPow = 0
    },
    {
      "bn_l_fr_hair6"
    },
    {
      "bn_l_fr_hair7"
    },
    {
      "dm_l_fr_hair7",
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_fr_hair0"
    },
    {
      "bn_r_fr_hair1",
      AnimRate = 1,
      StraightPow = 0
    },
    {
      "bn_r_fr_hair2",
      AnimRate = 1,
      StraightPow = 0
    },
    {
      "bn_r_fr_hair3",
      AnimRate = 0.15,
      StraightPow = 0
    },
    {
      "bn_r_fr_hair4",
      AnimRate = 0.1,
      StraightPow = 0.2
    },
    {
      "bn_r_fr_hair5",
      StraightPow = 0
    },
    {
      "bn_r_fr_hair6"
    },
    {
      "bn_r_fr_hair7"
    },
    {
      "dm_r_fr_hair7",
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_sd_hairA0"
    },
    {
      "bn_r_sd_hairA1",
      AnimRate = 1
    },
    {
      "bn_r_sd_hairA2",
      AnimRate = 0.01
    },
    {
      "bn_r_sd_hairA3",
      AnimRate = 0.01
    },
    {
      "bn_r_sd_hairA4",
      AnimRate = 0.01
    },
    {
      "bn_r_sd_hairA5",
      AnimRate = 0
    },
    {
      "dm_r_sd_hairA5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_bk_hairE0"
    },
    {
      "bn_r_bk_hairE1",
      AnimRate = 1
    },
    {
      "bn_r_bk_hairE2",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairE3",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairE4",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairE5",
      AnimRate = 0
    },
    {
      "bn_r_bk_hairE6",
      AnimRate = 0
    },
    {
      "dm_r_bk_hairE6",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_bk_hairD0"
    },
    {
      "bn_r_bk_hairD1",
      AnimRate = 1
    },
    {
      "bn_r_bk_hairD2",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairD3",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairD4",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairD5",
      AnimRate = 0
    },
    {
      "bn_r_bk_hairD6",
      AnimRate = 0
    },
    {
      "bn_r_bk_hairD7",
      AnimRate = 0
    },
    {
      "dm_r_bk_hairD7",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_sd_hairB0"
    },
    {
      "bn_r_sd_hairB1",
      AnimRate = 1
    },
    {
      "bn_r_sd_hairB2"
    },
    {
      "dm_r_sd_hairB2",
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_center_hairA0"
    },
    {
      "bn_center_hairA1",
      AnimRate = 1
    },
    {
      "bn_center_hairA2",
      AnimRate = 0.01
    },
    {
      "bn_center_hairA3",
      AnimRate = 0.01
    },
    {
      "bn_center_hairA4",
      AnimRate = 0.01
    },
    {
      "bn_center_hairA5",
      AnimRate = 0
    },
    {
      "bn_center_hairA6",
      AnimRate = 0
    },
    {
      "bn_center_hairA7",
      AnimRate = 0
    },
    {
      "dm_center_hairA7",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_bk_hairF0"
    },
    {
      "bn_r_bk_hairF1",
      AnimRate = 1
    },
    {
      "bn_r_bk_hairF2",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairF3",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairF4",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairF5",
      AnimRate = 0
    },
    {
      "dm_r_bk_hairF5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_bk_hairC0"
    },
    {
      "bn_r_bk_hairC1",
      AnimRate = 1
    },
    {
      "bn_r_bk_hairC2",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairC3",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairC4",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairC5",
      AnimRate = 0
    },
    {
      "dm_r_bk_hairC5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_bk_hairA0"
    },
    {
      "bn_r_bk_hairA1",
      AnimRate = 1
    },
    {
      "bn_r_bk_hairA2",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairA3",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairA4",
      AnimRate = 0.01
    },
    {
      "dm_r_bk_hairA4",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_r_bk_hairB0"
    },
    {
      "bn_r_bk_hairB1",
      AnimRate = 1
    },
    {
      "bn_r_bk_hairB2",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairB3",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairB4",
      AnimRate = 0.01
    },
    {
      "bn_r_bk_hairB5",
      AnimRate = 0
    },
    {
      "dm_r_bk_hairB5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_center_hairB0"
    },
    {
      "bn_center_hairB1",
      AnimRate = 1
    },
    {
      "bn_center_hairB2",
      AnimRate = 0.01
    },
    {
      "bn_center_hairB3",
      AnimRate = 0.01
    },
    {
      "bn_center_hairB4",
      AnimRate = 0.01
    },
    {
      "dm_center_hairB4",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_bk_hairC0"
    },
    {
      "bn_l_bk_hairC1",
      AnimRate = 1
    },
    {
      "bn_l_bk_hairC2",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairC3",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairC4",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairC5",
      AnimRate = 0
    },
    {
      "dm_l_bk_hairC5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_bk_hairB0"
    },
    {
      "bn_l_bk_hairB1",
      AnimRate = 1
    },
    {
      "bn_l_bk_hairB2",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairB3",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairB4",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairB5",
      AnimRate = 0
    },
    {
      "dm_l_bk_hairB5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_bk_hairA0"
    },
    {
      "bn_l_bk_hairA1",
      AnimRate = 1
    },
    {
      "bn_l_bk_hairA2",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairA3",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairA4",
      AnimRate = 0.01
    },
    {
      "dm_l_bk_hairA4",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_bk_hairF0"
    },
    {
      "bn_l_bk_hairF1",
      AnimRate = 1
    },
    {
      "bn_l_bk_hairF2",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairF3",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairF4",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairF5",
      AnimRate = 0
    },
    {
      "dm_l_bk_hairF5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_bk_hairE0"
    },
    {
      "bn_l_bk_hairE1",
      AnimRate = 1
    },
    {
      "bn_l_bk_hairE2",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairE3",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairE4",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairE5",
      AnimRate = 0
    },
    {
      "bn_l_bk_hairE6",
      AnimRate = 0
    },
    {
      "dm_l_bk_hairE6",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_bk_hairD0"
    },
    {
      "bn_l_bk_hairD1",
      AnimRate = 1
    },
    {
      "bn_l_bk_hairD2",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairD3",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairD4",
      AnimRate = 0.01
    },
    {
      "bn_l_bk_hairD5",
      AnimRate = 0
    },
    {
      "bn_l_bk_hairD6",
      AnimRate = 0
    },
    {
      "bn_l_bk_hairD7",
      AnimRate = 0
    },
    {
      "dm_l_bk_hairD7",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_sd_hairA0"
    },
    {
      "bn_l_sd_hairA1",
      AnimRate = 1
    },
    {
      "bn_l_sd_hairA2",
      AnimRate = 0.01
    },
    {
      "bn_l_sd_hairA3",
      AnimRate = 0.01
    },
    {
      "bn_l_sd_hairA4",
      AnimRate = 0.01
    },
    {
      "bn_l_sd_hairA5",
      AnimRate = 0
    },
    {
      "dm_l_sd_hairA5",
      AnimRate = 0,
      AirReg = 0.4,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    VibParam = {
      TrgNode = 2,
      {
        Spd = -0.731,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      },
      {
        Spd = 1,
        SpdAir = 0,
        Pow = 0.001,
        PowAir = 0
      },
      {
        Spd = 0,
        311,
        SpdAir = 0,
        Pow = 6.0E-4,
        PowAir = 0
      }
    },
    GrvRate = 0,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    BaneSkip = 0,
    UneLenRate = 1.1,
    UnePow = 0.05,
    {
      "bn_l_sd_hairB0"
    },
    {
      "bn_l_sd_hairB1",
      AnimRate = 1
    },
    {
      "bn_l_sd_hairB2"
    },
    {
      "dm_l_sd_hairB2",
      AirReg = 0.4,
      BaneSkip = 0
    }
  }
}
