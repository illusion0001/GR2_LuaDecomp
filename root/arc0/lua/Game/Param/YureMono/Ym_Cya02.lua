HairGrR = 0.2
HairFAnimR0 = 0.2
HairFStPow = 0.2
HairFBaneHasu0 = 0.5
HairFBaneHasu1 = 0.7
HairFBCS = 0
HairFBNS = 0.5
HairMAnimR0 = 1
HairMAnimR1 = 0.5
HairMAnimR2 = 0.1
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.02,
      0.1
    },
    Rad = 0.085
  }
}
Col_forHairF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.02,
      0.1
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.035,
      0.045
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.01,
      0.075
    },
    Rad = 0.085
  }
}
Col_forHairM = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.016,
      0.1
    },
    Rad = 0.094
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.029,
      0.099
    },
    Rad = 0.088
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.048,
      0.034
    },
    Rad = 0.063
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.005,
      0.066
    },
    Rad = 0.084
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      0.003,
      0.046
    },
    Rad = 0.039
  }
}
L0_0.Dbg_IsDisp = true
Col_forHairO = L0_0
L0_0 = {
  {
    Spd = 0,
    SpdAir = 2.22,
    Pow = 0,
    PowAir = 0.8
  },
  {
    Spd = 0,
    SpdAir = 1,
    Pow = 0,
    PowAir = 0.6
  },
  {
    Spd = 0,
    SpdAir = 0.131,
    Pow = 0,
    PowAir = 0.6
  }
}
Ym_Cya02 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_forHairF,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = HairFBCS,
    BeneNobiStep = 0.8,
    Width = 0.04,
    GrvRate = HairGrR,
    AirRegV = HairAirReg,
    AirRegP = HairAirReg,
    AnimRate = RibbonAnimR,
    ColRad = 0.01,
    BeneHasu = HairFBaneHasu,
    VibParamL = L0_0,
    VibParamR = {
      {
        Spd = 0,
        SpdAir = 2.22,
        Pow = 0,
        PowAir = 0.8
      },
      {
        Spd = 0,
        SpdAir = 1,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = -0.131,
        Pow = 0,
        PowAir = 0.6
      }
    },
    {
      "bn_hairA0",
      BeneHasu = HairFBaneHasu0
    },
    {
      "bn_hairA1",
      BeneHasu = HairFBaneHasu1,
      AnimRate = 0.4
    },
    {
      "dm_hairA",
      BeneHasu = HairFBaneHasu1,
      AnimRate = 0.2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_forHairF,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = HairFBCS,
    BeneNobiStep = HairFBNS,
    Width = 0.03,
    GrvRate = HairGrR,
    AirRegV = HairAirReg,
    AirRegP = HairAirReg,
    AnimRate = RibbonAnimR,
    ColRad = 0.01,
    BeneHasu = HairFBaneHasu,
    VibParamL = L0_0,
    VibParamR = {
      {
        Spd = 0,
        SpdAir = 2.22,
        Pow = 0,
        PowAir = 0.8
      },
      {
        Spd = 0,
        SpdAir = 1,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = -0.131,
        Pow = 0,
        PowAir = 0.6
      }
    },
    {
      "bn_hairC0",
      BeneHasu = HairFBaneHasu0
    },
    {
      "dm_hairC",
      BeneHasu = HairFBaneHasu1,
      AnimRate = HairFAnimR0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_forHairF,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = HairFBCS,
    BeneNobiStep = HairFBNS,
    Width = 0.04,
    GrvRate = HairGrR,
    AirRegV = HairAirReg,
    AirRegP = HairAirReg,
    AnimRate = RibbonAnimR,
    ColRad = 0.01,
    BeneHasu = HairFBaneHasu,
    VibParamL = L0_0,
    VibParamR = {
      {
        Spd = 0,
        SpdAir = 2.22,
        Pow = 0,
        PowAir = 0.8
      },
      {
        Spd = 0,
        SpdAir = 1,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = -0.131,
        Pow = 0,
        PowAir = 0.6
      }
    },
    {
      "bn_hairD0",
      BeneHasu = HairFBaneHasu0
    },
    {
      "dm_hairD",
      BeneHasu = HairFBaneHasu1,
      AnimRate = HairFAnimR0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairM,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {"bn_hairE0"},
    {
      "bn_hairE1",
      AnimRate = HairMAnimR0
    },
    {
      "dm_hairE",
      AnimRate = HairMAnimR1
    },
    {
      "dm_hairE2",
      AnimRate = HairMAnimR2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairM,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {"bn_hairB0"},
    {
      "bn_hairB1",
      AnimRate = HairMAnimR0
    },
    {
      "bn_hairB2",
      AnimRate = HairMAnimR1
    },
    {
      "dm_hairB",
      AnimRate = HairMAnimR2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairO,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_hairF0"
    },
    {
      "bn_l_hairF1",
      ColRad = 0.027,
      AnimRate = HairMAnimR0
    },
    {
      "bn_l_hairF2",
      ColRad = 0.022,
      AnimRate = HairMAnimR1
    },
    {
      "dm_l_hairF",
      ColRad = 0.022,
      AnimRate = HairMAnimR2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairM,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_hairG0"
    },
    {
      "bn_l_hairG1",
      ColRad = 0.012,
      AnimRate = HairMAnimR0
    },
    {
      "bn_l_hairG2",
      ColRad = 0.012,
      AnimRate = HairMAnimR1
    },
    {
      "dm_l_hairG",
      ColRad = 0.005,
      AnimRate = HairMAnimR2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairM,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_hairH0"
    },
    {
      "bn_l_hairH1",
      ColRad = 0.011,
      AnimRate = HairMAnimR0
    },
    {
      "bn_l_hairH2",
      ColRad = 0.01,
      AnimRate = HairMAnimR1
    },
    {
      "dm_l_hairH",
      ColRad = 0.005,
      AnimRate = HairMAnimR2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairO,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_hairF0"
    },
    {
      "bn_r_hairF1",
      ColRad = 0.027,
      AnimRate = HairMAnimR0
    },
    {
      "bn_r_hairF2",
      ColRad = 0.022,
      AnimRate = HairMAnimR1
    },
    {
      "dm_r_hairF",
      ColRad = 0.022,
      AnimRate = HairMAnimR2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairM,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_hairG0"
    },
    {
      "bn_r_hairG1",
      ColRad = 0.012,
      AnimRate = HairMAnimR0
    },
    {
      "bn_r_hairG2",
      ColRad = 0.012,
      AnimRate = HairMAnimR1
    },
    {
      "dm_r_hairG",
      ColRad = 0.005,
      AnimRate = HairMAnimR2
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairM,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.165
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.05
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_hairH0"
    },
    {
      "bn_r_hairH1",
      ColRad = 0.011,
      AnimRate = HairMAnimR0
    },
    {
      "bn_r_hairH2",
      ColRad = 0.01,
      AnimRate = HairMAnimR1
    },
    {
      "dm_r_hairH",
      ColRad = 0.005,
      AnimRate = HairMAnimR2
    }
  }
}
