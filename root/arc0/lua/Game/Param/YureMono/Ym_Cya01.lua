HairGrR = 0.7
HairFAnimR0 = 0.2
HairFStPow = 0.2
HairFBaneHasu0 = 0.5
HairFBaneHasu1 = 0.7
HairFBCS = 0
HairFBNS = 0.5
HairMAnimR0 = 1
HairMAnimR1 = 0.5
HairMAnimR2 = 0.1
HairBGrRt = 0
HairBAnimRt0 = 1
HairBAnimRt1 = 0
HairBOfsY0 = 0
HairBOfsY1 = 0
HairBStPow = 0.03
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
L0_0.Dbg_IsDisp = true
Col_forHairM = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.01,
      0.1
    },
    Rad = 0.115
  }
}
Col_forHairB = L0_0
L0_0 = {
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
  },
  {
    Spd = 0,
    SpdAir = 2.31,
    Pow = 0,
    PowAir = 0.05
  }
}
L0_0.TrgNode = 1
L0_0.StdLen = 0.3
Ym_Cya01 = {
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
    VibParamL = {
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
    },
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
    VibParamL = {
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
    },
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
    VibParamL = {
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
    },
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
      "bn_hairE2",
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
    Collision = Col_forHairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairBGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = HairBStPow,
    {
      "bn_l_hairT0"
    },
    {
      "bn_l_hairT1",
      ColRad = 0.065,
      RefOfsY = HairBOfsY0,
      AnimRate = HairBAnimRt0
    },
    {
      "dm_l_hairT",
      ColRad = 0.02,
      RefOfsY = HairBOfsY1,
      AnimRate = HairBAnimRt1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairBGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = HairBStPow,
    {
      "bn_r_hairT0"
    },
    {
      "bn_r_hairT1",
      ColRad = 0.065,
      RefOfsY = HairBOfsY0,
      AnimRate = HairBAnimRt0
    },
    {
      "dm_r_hairT",
      ColRad = 0.02,
      RefOfsY = HairBOfsY1,
      AnimRate = HairBAnimRt1
    }
  }
}
