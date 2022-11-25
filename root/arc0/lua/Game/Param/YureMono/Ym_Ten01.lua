HairGrR = 0.1
HairAirReg = 0.2
HairLimRad = 0.55
HairAnimR = 0.2
HairFGrR = 1
HairFAirReg = 0.3
HairFAnimR0 = 0.3
HairLGrR = 0.7
HairLAirReg = 0.33
HairLStPow = 0.1
HairLAnimR0 = 0.8
HairLAnimR1 = 0.2
HairLAnimR2 = 0
HairLAnimR3 = 0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.06,
      0.06
    },
    Rad = 0.1
  },
  {
    Type = kYm_ColType_Surface,
    Node = "bn_head",
    Pos = {
      0,
      0.04,
      0.155
    },
    Vec = {
      0,
      -0.353854,
      -0.986485
    }
  },
  {
    Type = kYm_ColType_Surface,
    Node = "bn_head",
    Pos = {
      0.085,
      0.055,
      0.015
    },
    Vec = {
      -0.873985,
      0.072597,
      -0.291727
    }
  },
  {
    Type = kYm_ColType_Surface,
    Node = "bn_head",
    Pos = {
      -0.085,
      0.055,
      0.015
    },
    Vec = {
      0.873985,
      0.072597,
      -0.291727
    }
  }
}
Col_forHairF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.043,
      0.085
    },
    Rad = 0.081
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.004,
      0.039
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0.035,
      0.175,
      0.175
    },
    Pos1 = {
      0.084,
      0.172,
      -0.107
    },
    Rad = 0.185
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0.09,
      -0.01,
      0.15
    },
    Pos1 = {
      0.139,
      0.002,
      -0.012
    },
    Rad = 0.065
  }
}
Col_forHairFL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.043,
      0.085
    },
    Rad = 0.081
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.004,
      0.039
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      -0.035,
      0.175,
      0.175
    },
    Pos1 = {
      -0.084,
      0.172,
      -0.107
    },
    Rad = 0.185
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      -0.09,
      -0.01,
      0.15
    },
    Pos1 = {
      -0.139,
      0.002,
      -0.012
    },
    Rad = 0.065
  }
}
Col_forHairFR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0,
      0.045,
      0.12
    },
    Pos1 = {
      0,
      0.015,
      0.045
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_r_hood0",
    Pos0 = {
      0,
      0.065,
      0.015
    },
    Pos1 = {
      -0.01,
      0.005,
      0.03
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_l_hood0",
    Pos0 = {
      0,
      0.065,
      0.015
    },
    Pos1 = {
      0.01,
      0.005,
      0.03
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_spine2",
    Pos0 = {
      -0.02,
      0,
      0.03
    },
    Pos1 = {
      0.02,
      0,
      0.03
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Node1 = "bn_l_arm",
    Pos0 = {
      0,
      0.04,
      0.12
    },
    Pos1 = {
      0,
      0,
      0.2
    },
    Rad = 0.075
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Node1 = "bn_r_arm",
    Pos0 = {
      0,
      0.04,
      0.12
    },
    Pos1 = {
      0,
      0,
      0.2
    },
    Rad = 0.075
  }
}
Col_forHairL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.06,
      0.015
    },
    Rad = 0.215
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_spine0",
    Pos0 = {
      0.04,
      -0.025,
      0.095
    },
    Pos1 = {
      0.04,
      0.05,
      -0.045
    },
    Rad = 0.1
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_spine0",
    Pos0 = {
      -0.04,
      -0.025,
      0.095
    },
    Pos1 = {
      -0.04,
      0.05,
      -0.045
    },
    Rad = 0.1
  }
}
Col_forWingS = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.06,
      0.015
    },
    Rad = 0.215
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      -0.045,
      0.055
    },
    Pos1 = {
      0,
      -0.05,
      0
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis",
    Node1 = "bn_pelvis",
    Pos0 = {
      0,
      0.045,
      -0.01
    },
    Pos1 = {
      0,
      0.01,
      0.075
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Node1 = "bn_l_thigh",
    Pos0 = {
      -0.035,
      0,
      0
    },
    Pos1 = {
      -0.03,
      0.045,
      0.405
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Node1 = "bn_l_leg",
    Pos0 = {
      -0.03,
      0.005,
      0.415
    },
    Pos1 = {
      0,
      0.015,
      0.5
    },
    Rad = 0.1
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.035,
      0,
      0
    },
    Pos1 = {
      -0.03,
      0.045,
      0.405
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Node1 = "bn_r_leg",
    Pos0 = {
      -0.03,
      0.005,
      0.415
    },
    Pos1 = {
      0,
      0.015,
      0.5
    },
    Rad = 0.1
  }
}
L0_0.Dbg_IsDisp = true
Col_forWingL = L0_0
L0_0 = {
  {
    Spd = 0,
    SpdAir = -3.11,
    Pow = 0,
    PowAir = 0.04
  },
  {
    Spd = 0,
    SpdAir = 1,
    Pow = 0,
    PowAir = 0.05
  },
  {
    Spd = 0,
    SpdAir = 0.72705,
    Pow = 0,
    PowAir = 0.05
  }
}
L0_0.StdLen = 0.03
HimoVibParam = {
  TrgNode = 2,
  {
    Spd = 0,
    SpdAir = 0.755,
    Pow = 0,
    PowAir = 0.04
  },
  {
    Spd = 0,
    SpdAir = -0.5,
    Pow = 0,
    PowAir = 0.4
  },
  {
    Spd = 0,
    SpdAir = 0.655,
    Pow = 0,
    PowAir = 0.1
  }
}
Ym_Ten01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairL,
    GrvRate = HairLGrR,
    AirReg = HairLAirReg,
    ColRad = 0.005,
    StraightPow = HairLStPow,
    {
      "bn_l_hair_c1_te01"
    },
    {
      "bn_l_hair_c2_te01",
      ColRad = 0,
      AnimRate = HairLAnimR0
    },
    {
      "bn_l_hair_c3_te01",
      ColRad = 0.02,
      AnimRate = HairLAnimR1
    },
    {
      "bn_l_hair_c4_te01",
      ColRad = 0.015,
      AnimRate = HairLAnimR2
    },
    {
      "dm_l_hair_c5_te01",
      ColRad = 0.005,
      AnimRate = HairLAnimR3
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairL,
    GrvRate = HairLGrR,
    AirReg = HairLAirReg,
    ColRad = 0.005,
    StraightPow = HairLStPow,
    {
      "bn_r_hair_c1_te01"
    },
    {
      "bn_r_hair_c2_te01",
      ColRad = 0,
      AnimRate = HairLAnimR0
    },
    {
      "bn_r_hair_c3_te01",
      ColRad = 0.02,
      AnimRate = HairLAnimR1
    },
    {
      "bn_r_hair_c4_te01",
      ColRad = 0.015,
      AnimRate = HairLAnimR2
    },
    {
      "dm_r_hair_c5_te01",
      ColRad = 0.005,
      AnimRate = HairLAnimR3
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    StraightPow = HairFStPow,
    {
      "bn_c_hair_a0_te01"
    },
    {
      "dm_c_hair_a1_te01",
      LimRad = 0.07,
      ColRad = 0.01,
      AnimRate = HairFAnimR0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    StraightPow = HairFStPow,
    {
      "bn_c_hair_b0_te01"
    },
    {
      "dm_c_hair_b1_te01",
      LimRad = 0.065,
      ColRad = 0.01,
      AnimRate = HairFAnimR0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairFL,
    ColPowHalf = 1,
    PressAxis = {
      0,
      1,
      0
    },
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    StraightPow = HairFStPow,
    {
      "bn_l_hair_a0_te01"
    },
    {
      "bn_l_hair_a1_te01",
      LimRad = -0.07,
      ColRad = 0,
      AnimRate = 0.4
    },
    {
      "dm_l_hair_a2_te01",
      LimRad = -0.07,
      ColRad = 0.005,
      AnimRate = 0.1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairFL,
    ColPowHalf = 1,
    PressAxis = {
      0,
      1,
      0
    },
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    StraightPow = HairFStPow,
    {
      "bn_l_hair_b0_te01"
    },
    {
      "bn_l_hair_b1_te01",
      LimRad = -0.07,
      ColRad = 0,
      AnimRate = 0.7
    },
    {
      "bn_l_hair_b2_te01",
      LimRad = -0.07,
      ColRad = 0.005,
      AnimRate = 0.2
    },
    {
      "dm_l_hair_b3_te01",
      LimRad = -0.07,
      ColRad = 0.005,
      AnimRate = 0.1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairFR,
    ColPowHalf = 1,
    PressAxis = {
      0,
      1,
      0
    },
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    StraightPow = HairFStPow,
    {
      "bn_r_hair_a0_te01"
    },
    {
      "bn_r_hair_a1_te01",
      LimRad = -0.07,
      ColRad = 0,
      AnimRate = 0.4
    },
    {
      "dm_r_hair_a2_te01",
      LimRad = -0.07,
      ColRad = 0.005,
      AnimRate = 0.1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairFR,
    ColPowHalf = 1,
    PressAxis = {
      0,
      1,
      0
    },
    GrvRate = HairFGrR,
    AirReg = HairFAirReg,
    ColRad = 0.005,
    StraightPow = HairFStPow,
    {
      "bn_r_hair_b0_te01"
    },
    {
      "bn_r_hair_b1_te01",
      LimRad = -0.07,
      ColRad = 0,
      AnimRate = 0.7
    },
    {
      "bn_r_hair_b2_te01",
      LimRad = -0.07,
      ColRad = 0.005,
      AnimRate = 0.2
    },
    {
      "dm_r_hair_b3_te01",
      LimRad = -0.07,
      ColRad = 0.005,
      AnimRate = 0.1
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forWingS,
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 0,
    BeneNobiStep = 0.1,
    GrvRate = 0.7,
    AirRegV = 0.6,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = 0.1,
    {
      "bn_l_scarf_a0_te01",
      Width = 0.15
    },
    {
      "bn_l_scarf_a1_te01",
      Width = 0.14,
      AnimRate = 0.3
    },
    {
      "bn_l_scarf_a2_te01",
      Width = 0.11,
      AnimRate = 0.1
    },
    {
      "dm_l_scarf_a3_te01",
      Width = 0.02,
      AnimRate = 0
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forWingS,
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 0,
    BeneNobiStep = 0.1,
    GrvRate = 0.7,
    AirRegV = 0.6,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = 0.1,
    {
      "bn_r_scarf_a0_te01",
      Width = 0.15
    },
    {
      "bn_r_scarf_a1_te01",
      Width = 0.14,
      AnimRate = 0.3
    },
    {
      "bn_r_scarf_a2_te01",
      Width = 0.11,
      AnimRate = 0.1
    },
    {
      "dm_r_scarf_a3_te01",
      Width = 0.02,
      AnimRate = 0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forWingL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 0,
    BeneNobiStep = 0.25,
    GrvRate = 1,
    AirRegV = 0.4,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = 0.25,
    {
      "bn_l_scarf_b0_te01",
      Width = 0.15,
      BeneHasu = 0.15
    },
    {
      "bn_l_scarf_b1_te01",
      Width = 0.15,
      AnimRate = 0.8,
      BeneHasu = 0.2
    },
    {
      "bn_l_scarf_b2_te01",
      Width = 0.15,
      AnimRate = 0.1
    },
    {
      "bn_l_scarf_b3_te01",
      Width = 0.14,
      AnimRate = 0
    },
    {
      "bn_l_scarf_b4_te01",
      Width = 0.13,
      AnimRate = 0
    },
    {
      "bn_l_scarf_b5_te01",
      Width = 0.12,
      AnimRate = 0
    },
    {
      "bn_l_scarf_b6_te01",
      Width = 0.11,
      AnimRate = 0
    },
    {
      "bn_l_scarf_b7_te01",
      Width = 0.1,
      AnimRate = 0
    },
    {
      "bn_l_scarf_b8_te01",
      Width = 0.08,
      AnimRate = 0
    },
    {
      "dm_l_scarf_b9_te01",
      Width = 0.02,
      AnimRate = 0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forWingL,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 0,
    BeneNobiStep = 0.25,
    GrvRate = 1,
    AirRegV = 0.4,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = 0.25,
    {
      "bn_r_scarf_b0_te1",
      Width = 0.15,
      BeneHasu = 0.15
    },
    {
      "bn_r_scarf_b1_te01",
      Width = 0.15,
      AnimRate = 0.8,
      BeneHasu = 0.2
    },
    {
      "bn_r_scarf_b2_te01",
      Width = 0.15,
      AnimRate = 0.1
    },
    {
      "bn_r_scarf_b3_te01",
      Width = 0.14,
      AnimRate = 0
    },
    {
      "bn_r_scarf_b4_te01",
      Width = 0.13,
      AnimRate = 0
    },
    {
      "bn_r_scarf_b5_te01",
      Width = 0.12,
      AnimRate = 0
    },
    {
      "bn_r_scarf_b6_te01",
      Width = 0.11,
      AnimRate = 0
    },
    {
      "bn_r_scarf_b7_te01",
      Width = 0.1,
      AnimRate = 0
    },
    {
      "bn_r_scarf_b8_te01",
      Width = 0.08,
      AnimRate = 0
    },
    {
      "dm_r_scarf_b9_te01",
      Width = 0.02,
      AnimRate = 0
    }
  }
}
