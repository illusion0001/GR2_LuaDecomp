HairGrR = 0.3
HairFGrR = 0.3
HairFAirReg = 0.4
HairFAnimR = 0.4
HairRAirReg = 0.4
HairRLAnimR0 = 1
HairRLAnimR1 = 0.2
HairFAnimR0 = 0.2
HairFStPow = 0.2
HairFBaneHasu0 = 0.5
HairFBaneHasu1 = 0.7
HairFBCS = 0
HairFBNS = 0.5
HairMAnimR0 = 1
HairMAnimR1 = 0.5
HairMAnimR2 = 0.1
CloakGrR = 0.2
CloakAirRegV = 0.6
CloakAirRegP = 0.2
CloakFAnimR = 0.4
CloakFBeneH = 0.1
CloakSAnimR = 0.4
CloakSBeneH = 0.1
CloakBAnimR0 = 0.5
CloakBAnimR1 = 0.1
CloakBBeneH = 0.2
CloakBBaneCS = 0.9
CloakBBaneNS = 0.3
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.045,
      0.18
    },
    Rad = 0.185
  }
}
Col_forHairF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.025,
      0.16
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.065,
      0.16
    },
    Rad = 0.16
  }
}
L0_0.Dbg_IsDisp = true
Col_forHairR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      0.04,
      0.08,
      0.11
    },
    Pos1 = {
      0.025,
      0.05,
      0.075
    },
    Rad = 0.145
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_arm",
    Node1 = "bn_l_arm",
    Pos0 = {
      0,
      -0.01,
      0.02
    },
    Pos1 = {
      0,
      0,
      0.17
    },
    Rad = 0.055
  }
}
L0_0.Dbg_IsDisp = true
Col_forCloakFL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      -0.04,
      0.08,
      0.11
    },
    Pos1 = {
      -0.025,
      0.05,
      0.075
    },
    Rad = 0.145
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_arm",
    Node1 = "bn_r_arm",
    Pos0 = {
      0,
      -0.01,
      0.02
    },
    Pos1 = {
      0,
      0,
      0.17
    },
    Rad = 0.055
  }
}
L0_0.Dbg_IsDisp = true
Col_forCloakFR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      0,
      0.1,
      0.11
    },
    Pos1 = {
      0,
      0.095,
      0.065
    },
    Rad = 0.2
  }
}
Col_forCloakFC = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_arm",
    Node1 = "bn_l_arm",
    Pos0 = {
      0,
      -0.01,
      0.02
    },
    Pos1 = {
      0,
      0,
      0.17
    },
    Rad = 0.055
  }
}
Col_forCloakSL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_arm",
    Node1 = "bn_r_arm",
    Pos0 = {
      0,
      -0.01,
      0.02
    },
    Pos1 = {
      0,
      0,
      0.17
    },
    Rad = 0.055
  }
}
Col_forCloakSR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      0,
      -0.125,
      0.18
    },
    Pos1 = {
      0,
      -0.165,
      0
    },
    Rad = 0.2
  },
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
      0.17
    },
    Rad = 0.07
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
      0.17
    },
    Rad = 0.07
  }
}
Col_forCloakBB = L0_0
L0_0 = {
  {
    Spd = 0,
    SpdAir = 2.22,
    Pow = 0,
    PowAir = 0.3
  },
  {
    Spd = 0,
    SpdAir = 1,
    Pow = 0,
    PowAir = 0.2
  },
  {
    Spd = 0,
    SpdAir = 0.131,
    Pow = 0,
    PowAir = 0.2
  }
}
Ym_Zaz01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {"bn_hairA0"},
    {
      "dm_hairA1",
      AnimRate = HairFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    {"bn_hairF0"},
    {
      "dm_hairF",
      AnimRate = HairFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    {"bn_hairC0"},
    {
      "dm_hairC",
      AnimRate = HairFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    {"bn_hairE0"},
    {
      "dm_hairE",
      AnimRate = HairFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    {"bn_hairD0"},
    {
      "dm_hairD",
      AnimRate = HairFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    {"bn_hairB0"},
    {
      "dm_hairB",
      AnimRate = HairFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairT,
    VibParam = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.15
      }
    },
    GrvRate = HairGrR,
    AirReg = HairRAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    {
      "bn_uphair_01"
    },
    {
      "dm_uphair_02",
      AnimRate = 0.5
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairR,
    VibParam = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.15
      }
    },
    GrvRate = HairGrR,
    AirReg = HairRAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_sidehair01"
    },
    {
      "bn_l_sidehair02",
      AnimRate = HairRLAnimR0
    },
    {
      "dm_l_sidehair03",
      AnimRate = HairRLAnimR1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairR,
    VibParam = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.15
      }
    },
    GrvRate = HairGrR,
    AirReg = HairRAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_sidehair01"
    },
    {
      "bn_r_sidehair02",
      AnimRate = HairRLAnimR0
    },
    {
      "dm_r_sidehair03",
      AnimRate = HairRLAnimR1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairR,
    IsFitLen = IsFit,
    BeneNobi = 0.2,
    VibParam = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.15
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.15
      }
    },
    GrvRate = HairGrR,
    AirReg = HairRAirReg,
    AnimRate = HairAnimR,
    ColRad = 0.005,
    StraightPow = 0.1,
    {
      "bn_c_hair01"
    },
    {
      "bn_c_hair02",
      AnimRate = HairRLAnimR0
    },
    {
      "dm_c_hair03",
      AnimRate = HairRLAnimR1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakFL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakFBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_l_redA02",
      Width = 0.07
    },
    {
      "dm_l_redA",
      Width = 0.02,
      AnimRate = CloakFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakFC,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakFBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_c_redA01",
      Width = 0.07
    },
    {
      "dm_c_redA",
      Width = 0.02,
      AnimRate = CloakFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakFR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakFBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_r_redA01",
      Width = 0.07
    },
    {
      "dm_r_redA",
      Width = 0.02,
      AnimRate = CloakFAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakSL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakSBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_l_redB01",
      Width = 0.07
    },
    {
      "dm_l_redB",
      Width = 0.02,
      AnimRate = CloakSAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakSR,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakSBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_r_redB01",
      Width = 0.07
    },
    {
      "dm_r_redB",
      Width = 0.02,
      AnimRate = CloakSAnimR
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakBB,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = CloakBBaneCS,
    BeneNobiStep = CloakBBaneNS,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakBBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_l_redC01",
      Width = 0.1
    },
    {
      "bn_l_redC02",
      Width = 0.12,
      AnimRate = CloakBAnimR0
    },
    {
      "dm_l_redC",
      Width = 0.05,
      AnimRate = CloakBAnimR1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakBB,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = CloakBBaneCS,
    BeneNobiStep = CloakBBaneNS,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakBBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_c_redB01",
      Width = 0.1
    },
    {
      "bn_c_redB02",
      Width = 0.12,
      AnimRate = CloakBAnimR0
    },
    {
      "bn_c_redB03",
      Width = 0.05,
      AnimRate = CloakBAnimR1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forCloakBB,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = CloakBBaneCS,
    BeneNobiStep = CloakBBaneNS,
    Width = 0.12,
    GrvRate = CloakGrR,
    AirRegV = CloakAirRegV,
    AirRegP = CloakAirRegP,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = CloakBBeneH,
    VibParamC = {
      {
        Spd = 0,
        SpdAir = 1.665,
        Pow = 0,
        PowAir = 0.6
      },
      {
        Spd = 0,
        SpdAir = 0.7000000000000001,
        Pow = 0,
        PowAir = 0.4
      },
      {
        Spd = 0,
        SpdAir = 0.101,
        Pow = 0,
        PowAir = 0.4
      }
    },
    {
      "bn_r_redC01",
      Width = 0.1
    },
    {
      "bn_r_redC02",
      Width = 0.12,
      AnimRate = CloakBAnimR0
    },
    {
      "dm_r_redC",
      Width = 0.05,
      AnimRate = CloakBAnimR1
    }
  }
}
