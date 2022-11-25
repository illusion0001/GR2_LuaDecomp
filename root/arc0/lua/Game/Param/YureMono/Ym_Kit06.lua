HairGrR = 1
HairAirReg = 0.3
HairAnimR = 0
HairStPow = 0.05
RibbonGrR = 0.6
RibbonAirRegV = 0.2
RibbonAirRegH = 0.3
RibbonAnimR = 0
ApronGrR = 1
ApronAnimR = 0
ApronAnimR0 = 0.7
ApronAnimR1 = 0.2
ApronStPowZ = 0.4
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.095,
      0.015
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0.025,
      -0.005,
      0.11
    },
    Pos1 = {
      -0.025,
      -0.005,
      0.11
    },
    Rad = 0.045
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0,
      -0.02,
      0.03
    },
    Pos1 = {
      0,
      0.09,
      -0.03
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      -0.01,
      0
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Node1 = "bn_l_clavicle",
    Pos0 = {
      0,
      0,
      0.05
    },
    Pos1 = {
      0.03,
      -0.005,
      0.08
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Node1 = "bn_r_clavicle",
    Pos0 = {
      0,
      0,
      0.05
    },
    Pos1 = {
      -0.03,
      -0.005,
      0.08
    },
    Rad = 0.065
  }
}
Col_HairFront = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.06,
      0.025
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      -0.01,
      0
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Node1 = "bn_l_clavicle",
    Pos0 = {
      0,
      0,
      0.05
    },
    Pos1 = {
      0.03,
      -0.005,
      0.08
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Node1 = "bn_r_clavicle",
    Pos0 = {
      0,
      0,
      0.05
    },
    Pos1 = {
      -0.03,
      -0.005,
      0.08
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_spine1",
    Pos0 = {
      0,
      -0.03,
      0.045
    },
    Pos1 = {
      0,
      -0.04,
      0.045
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_pelvis",
    Pos0 = {
      0,
      -0.015,
      0.015
    },
    Pos1 = {
      0,
      0.005,
      0
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_pelvis_end",
    Pos0 = {
      0.03,
      -0.005,
      0.005
    },
    Pos1 = {
      -0.03,
      -0.005,
      0.005
    },
    Rad = 0.13
  }
}
Col_HairBack = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_pelvis_end",
    Pos0 = {
      0,
      0,
      -0.045
    },
    Pos1 = {
      -0.02,
      0,
      -0.05
    },
    Rad = 0.16
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.05,
      -0.025,
      -0.025
    },
    Pos1 = {
      0.045,
      0.005,
      0.385
    },
    Rad = 0.13
  }
}
Col_forRibbonHimo = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_pelvis_end",
    Pos0 = {
      0,
      0,
      -0.045
    },
    Pos1 = {
      -0.02,
      0,
      -0.05
    },
    Rad = 0.16
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.025,
      -0.015,
      0
    },
    Pos1 = {
      0.045,
      0.005,
      0.385
    },
    Rad = 0.13
  }
}
L0_0.Dbg_IsDisp = true
Col_forRibbonWa = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      0,
      0.055,
      -0.08
    },
    Rad = 0.175
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.055,
      -0.025,
      -0.025
    },
    Pos1 = {
      -0.025,
      0.005,
      0.385
    },
    Rad = 0.11
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_l_thigh",
    Pos = {
      -0.01,
      0,
      0.085
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.055,
      -0.025,
      -0.025
    },
    Pos1 = {
      0.025,
      0.005,
      0.385
    },
    Rad = 0.11
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_r_thigh",
    Pos = {
      0.01,
      0,
      0.085
    },
    Rad = 0.095
  }
}
Col_forApron = L0_0
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
Ym_Kit06 = {
  Dbg_IsDispBody = true,
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_fr_hairA0_k06"
    },
    {
      "bn_l_fr_hairA1_k06",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairA2_k06"
    },
    {
      "bn_l_fr_hairA3_k06"
    },
    {
      "bn_l_fr_hairA4_k06"
    },
    {
      "dm_l_fr_hairA5_k06"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_fr_hairB0_k06"
    },
    {
      "bn_l_fr_hairB1_k06",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairB2_k06"
    },
    {
      "bn_l_fr_hairB3_k06"
    },
    {
      "dm_l_fr_hairB4_k06"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_fr_hairA0_k06"
    },
    {
      "bn_r_fr_hairA1_k06",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairA2_k06"
    },
    {
      "bn_r_fr_hairA3_k06"
    },
    {
      "bn_r_fr_hairA4_k06"
    },
    {
      "dm_r_fr_hairA5_k06"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_fr_hairB0_k06"
    },
    {
      "bn_r_fr_hairB1_k06",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairB2_k06"
    },
    {
      "bn_r_fr_hairB3_k06"
    },
    {
      "dm_r_fr_hairB4_k06"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_hair_c0_k06"
    },
    {
      "bn_hair_c1_k06",
      ColRad = 0.01,
      AnimRate = 1
    },
    {
      "bn_hair_c2_k06",
      ColRad = 0.015
    },
    {
      "bn_hair_c3_k06",
      ColRad = 0.02
    },
    {
      "bn_hair_c4_k06",
      ColRad = 0.015
    },
    {
      "bn_hair_c5_k06",
      ColRad = 0.005
    },
    {
      "dm_hair_c5_k06",
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_hair_a0_k06"
    },
    {
      "bn_hair_a1_k06",
      ColRad = 0.03,
      AnimRate = 1
    },
    {
      "bn_hair_a2_k06",
      ColRad = 0.04
    },
    {
      "bn_hair_a3_k06",
      ColRad = 0.035
    },
    {
      "bn_hair_a4_k06",
      ColRad = 0.025
    },
    {
      "bn_hair_a5_k06",
      ColRad = 0.015
    },
    {
      "bn_hair_a6_k06",
      ColRad = 0.005
    },
    {
      "dm_hair_a6_k06",
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_hair_b0_k06"
    },
    {
      "bn_hair_b1_k06",
      ColRad = 0.025,
      AnimRate = 1
    },
    {
      "bn_hair_b2_k06",
      ColRad = 0.025
    },
    {
      "bn_hair_b3_k06",
      ColRad = 0.025
    },
    {
      "bn_hair_b4_k06",
      ColRad = 0.015
    },
    {
      "bn_hair_b5_k06",
      ColRad = 0.01
    },
    {
      "bn_hair_b6_k06",
      ColRad = 0.005
    },
    {
      "dm_hair_b6_k06",
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    VibParam = {
      TrgNode = 2,
      {
        Spd = 0,
        SpdAir = -0.3,
        Pow = 0,
        PowAir = 0.66
      },
      {
        Spd = 0,
        SpdAir = 0.7,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 1.3,
        Pow = 0,
        PowAir = 0.2
      }
    },
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_hair_d0_k06"
    },
    {
      "bn_hair_d1_k06",
      ColRad = 0.015,
      AnimRate = 1
    },
    {
      "bn_hair_d2_k06",
      ColRad = 0.015
    },
    {
      "bn_hair_d3_k06",
      ColRad = 0.015
    },
    {
      "bn_hair_d4_k06",
      ColRad = 0.01
    },
    {
      "bn_hair_d5_k06",
      ColRad = 0.005
    },
    {
      "dm_hair_d6_k06",
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forRibbonHimo,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.15,
    GrvRate = RibbonGrR,
    AirRegV = RibbonAirRegV,
    AirRegP = RibbonAirRegH,
    AnimRate = RibbonAnimR,
    ColRad = 0.01,
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
      "bn_l_ribbon_b0_kit06",
      Width = 0.02
    },
    {
      "bn_l_ribbon_b1_kit06",
      Width = 0.023,
      AnimRate = 0.2
    },
    {
      "bn_l_ribbon_b2_kit06",
      Width = 0.026,
      AnimRate = 0.05
    },
    {
      "dm_l_ribbon_b3_kit06",
      Width = 0.03
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forRibbonHimo,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.01,
    Width = 0.15,
    GrvRate = RibbonGrR,
    AirRegV = RibbonAirRegV,
    AirRegP = RibbonAirRegH,
    AnimRate = RibbonAnimR,
    ColRad = 0.01,
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
      "bn_r_ribbon_b0_kit06",
      Width = 0.02
    },
    {
      "bn_r_ribbon_b1_kit06",
      Width = 0.023,
      AnimRate = 0.2
    },
    {
      "bn_r_ribbon_b2_kit06",
      Width = 0.026,
      AnimRate = 0.05
    },
    {
      "dm_r_ribbon_b3_kit06",
      Width = 0.03
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forRibbonWa,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.15,
    GrvRate = RibbonGrR,
    AirRegV = RibbonAirRegV,
    AirRegP = RibbonAirRegH,
    AnimRate = RibbonAnimR,
    ColRad = 0.01,
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
      "bn_l_ribbon_a0_kit06",
      Width = 0.02
    },
    {
      "bn_l_ribbon_a1_kit06",
      Width = 0.025,
      AnimRate = 0.1
    },
    {
      "dm_l_ribbon_a2_kit06",
      Width = 0.03,
      AnimRate = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forRibbonWa,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.15,
    GrvRate = RibbonGrR,
    AirRegV = RibbonAirRegV,
    AirRegP = RibbonAirRegH,
    AnimRate = RibbonAnimR,
    ColRad = 0.01,
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
      "bn_r_ribbon_a0_kit06",
      Width = 0.02
    },
    {
      "bn_r_ribbon_a1_kit06",
      Width = 0.025,
      AnimRate = 0.1
    },
    {
      "dm_r_ribbon_a2_kit06",
      Width = 0.03,
      AnimRate = 0.01
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forApron,
    IsTube = false,
    IsOrthoAx = false,
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.8,
    BeneNobiX = 0.2,
    ColPowXHalf = 0.8,
    IsLastCol = true,
    GrvRate = ApronGrR,
    AirRegV = 0.6,
    AirRegP = 0.1,
    AnimRate = ApronAnimR,
    ColRad = 0,
    StraightPowZ = ApronStPowZ,
    VibParam = {
      {
        AirBottom = 0.01,
        Spd = 0,
        SpdAir = 2.31,
        Pow = 0,
        PowAir = 0.25
      },
      {
        AirBottom = 0.08,
        Spd = 0,
        SpdAir = 3.3000000000000003,
        Pow = 0,
        PowAir = 0.3
      }
    },
    {
      {
        "bn_r_apron_b0_kit06"
      },
      {
        "bn_r_apron_b1_kit06",
        AnimRate = ApronAnimR0
      },
      {
        "bn_r_apron_b2_kit06",
        AnimRate = ApronAnimR1
      },
      {
        "dm_r_apron_b3_kit06"
      }
    },
    {
      {
        "bn_r_apron_a0_kit06"
      },
      {
        "bn_r_apron_a1_kit06",
        AnimRate = ApronAnimR0
      },
      {
        "bn_r_apron_a2_kit06",
        AnimRate = ApronAnimR1
      },
      {
        "dm_r_apron_a3_kit06"
      }
    },
    {
      {
        "bn_l_apron_a0_kit06"
      },
      {
        "bn_l_apron_a1_kit06",
        AnimRate = ApronAnimR0
      },
      {
        "bn_l_apron_a2_kit06",
        AnimRate = ApronAnimR1
      },
      {
        "dm_l_apron_a3_kit06"
      }
    },
    {
      {
        "bn_l_apron_b0_kit06"
      },
      {
        "bn_l_apron_b1_kit06",
        AnimRate = ApronAnimR0
      },
      {
        "bn_l_apron_b2_kit06",
        AnimRate = ApronAnimR1
      },
      {
        "dm_l_apron_b3_kit06"
      }
    }
  }
}
