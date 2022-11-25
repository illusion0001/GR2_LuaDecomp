HairAnimRt0 = 0.4
SusoGrR = 0.8
SusoStPowZ = 0.2
SusoAnimR = 0
SusoAnimR0 = 1
SusoAnimR1 = 0.2
SusoAnimRI0 = 0
SusoAnimRI1 = 0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.01,
      0.1
    },
    Rad = 0.14
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_neck",
    Node1 = "bn_neck",
    Pos0 = {
      0,
      0.013,
      -0.009
    },
    Pos1 = {
      0,
      0,
      -0.015
    },
    Rad = 0.121
  }
}
Col_forHair = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      0.075,
      0.1
    },
    Pos1 = {
      0,
      0.04,
      -0.02
    },
    Rad = 0.27
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      -0.054,
      -0.017,
      0.123
    },
    Pos1 = {
      -0.063,
      -0.037,
      -0.02
    },
    Rad = 0.191
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      0.054,
      -0.017,
      0.123
    },
    Pos1 = {
      0.063,
      -0.037,
      -0.02
    },
    Rad = 0.191
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      -0.07,
      0.05,
      0.005
    },
    Pos1 = {
      0.07,
      0.05,
      0.005
    },
    Rad = 0.215
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      -0.084,
      -0.032,
      0.075
    },
    Pos1 = {
      -0.087,
      -0.062,
      -0.013
    },
    Rad = 0.132
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      0.084,
      -0.032,
      0.075
    },
    Pos1 = {
      0.087,
      -0.062,
      -0.013
    },
    Rad = 0.132
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis",
    Pos = {
      0,
      -0.025,
      0.075
    },
    Rad = 0.255
  }
}
Col_forTie = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis",
    Node1 = "bn_pelvis",
    Pos0 = {
      -0.034,
      0.053,
      -0.061
    },
    Pos1 = {
      0.034,
      0.053,
      -0.061
    },
    Rad = 0.207
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis",
    Node1 = "bn_pelvis",
    Pos0 = {
      -0.045,
      0.035,
      0.134
    },
    Pos1 = {
      0.045,
      0.035,
      0.134
    },
    Rad = 0.177
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.1,
      0.003,
      0.058
    },
    Pos1 = {
      -0.014,
      0.022,
      0.285
    },
    Rad = 0.133
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.1,
      0.003,
      0.058
    },
    Pos1 = {
      0.014,
      0.022,
      0.285
    },
    Rad = 0.133
  }
}
Col_forSuso = L0_0
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
Ym_Bul01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forTie,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.5,
    BeneNobiStep = 0.1,
    Width = 0.12,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0.015,
    VibParamC = L0_0,
    {"bn_tie_top", Width = 0.02},
    {
      "bn_tie_a0_bu01",
      Width = 0.02,
      AnimRate = 0.3
    },
    {
      "bn_tie_a1_bu01",
      Width = 0.03,
      AnimRate = 0.1
    },
    {
      "bn_tie_a2_bu01",
      Width = 0.033,
      AnimRate = 0
    },
    {
      "bn_tie_a3_bu01",
      Width = 0.04,
      AnimRate = 0
    },
    {
      "bn_tie_a4_bu01",
      Width = 0.043,
      AnimRate = 0
    },
    {
      "dm_tie_a4_bu01",
      Width = 0.046,
      AnimRate = 0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forTie,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.5,
    BeneNobiStep = 0.1,
    Width = 0.12,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    VibParamC = L0_0,
    {
      "bn_tie_b0_bu01",
      Width = 0.01
    },
    {
      "bn_tie_b1_bu01",
      Width = 0.02,
      AnimRate = 0.3
    },
    {
      "bn_tie_b2_bu01",
      Width = 0.028,
      AnimRate = 0.1
    },
    {
      "bn_tie_b3_bu01",
      Width = 0.035,
      AnimRate = 0
    },
    {
      "bn_tie_b4_bu01",
      Width = 0.039,
      AnimRate = 0
    },
    {
      "dm_tie_b4_bu01",
      Width = 0.042,
      AnimRate = 0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = {
      TrgNode = 3,
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.3
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.1
      }
    },
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_hair_a_bu01"
    },
    {
      "dm_hair_a_bu01",
      ColRad = 0,
      RefOfsY = 0.03,
      AnimRate = HairAnimRt0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = {
      TrgNode = 3,
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.3
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.1
      }
    },
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_hair_b_bu01"
    },
    {
      "dm_hair_b_bu01",
      ColRad = 0,
      RefOfsY = 0.03,
      AnimRate = HairFFAnimRt0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = {
      TrgNode = 3,
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.3
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.1
      }
    },
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_hair_c_bu01"
    },
    {
      "dm_hair_c_bu01",
      ColRad = 0,
      RefOfsY = 0.03,
      AnimRate = HairFFAnimRt0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forSuso,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.7,
    BeneChijimiX = 0.5,
    BeneNobiX = 0.2,
    ColPowXHalf = 0.8,
    ColPowZHalf = 0.8,
    IsLastCol = true,
    GrvRate = SusoGrR,
    AirRegV = 0.6,
    AirRegP = 0.3,
    AnimRate = SusoAnimR,
    ColRad = 0,
    StraightPowZ = SusoStPowZ,
    VibParam = {
      {
        AirBottom = 0.05,
        Spd = 0,
        SpdAir = 0.77,
        Pow = 0,
        PowAir = 0.25
      },
      {
        AirBottom = 0.08,
        Spd = 0,
        SpdAir = 1.1,
        Pow = 0,
        PowAir = 0.3
      }
    },
    {
      {
        "bn_l_suit_fr_a0_bu01"
      },
      {
        "bn_l_suit_fr_a1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_l_suit_fr_a2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_l_suit_fr_b0_bu01"
      },
      {
        "bn_l_suit_fr_b1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_l_suit_fr_b2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_l_suit_si_a0_bu01"
      },
      {
        "bn_l_suit_si_a1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_l_suit_si_a2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_l_suit_si_b0_bu01"
      },
      {
        "bn_l_suit_si_b1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_l_suit_si_b2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_b_suit0_bu01"
      },
      {
        "bn_b_suit1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_b_suit2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_r_suit_si_b0_bu01"
      },
      {
        "bn_r_suit_si_b1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_r_suit_si_b2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_r_suit_si_a0_bu01"
      },
      {
        "bn_r_suit_si_a1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_r_suit_si_a2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_r_suit_fr_b0_bu01"
      },
      {
        "bn_r_suit_fr_b1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_r_suit_fr_b2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    },
    {
      {
        "bn_r_suit_fr_a0_bu01"
      },
      {
        "bn_r_suit_fr_a1_bu01",
        AnimRate = SusoAnimR0,
        AnimRateIn = SusoAnimRI0
      },
      {
        "dm_r_suit_fr_a2_bu01",
        AnimRate = SusoAnimR1,
        AnimRateIn = SusoAnimRI1
      }
    }
  }
}
