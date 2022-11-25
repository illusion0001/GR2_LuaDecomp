HairGrRt = 0.8
HairFFAnimRt0 = 0.8
HairFFAnimRt1 = 0.43
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.037,
      0.067
    },
    Rad = 0.08
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.025,
      0.025
    },
    Rad = 0.06
  }
}
Col_HairFF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.066,
      0.044
    },
    Rad = 0.093
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.033,
      0.074
    },
    Rad = 0.071
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_jaw",
    Pos = {
      0,
      0.025,
      -0.01
    },
    Rad = 0.06
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      0,
      0.085
    },
    Rad = 0.05
  }
}
L0_0.Dbg_IsDisp = true
Col_HairF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.067,
      0.047
    },
    Rad = 0.093
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.033,
      0.074
    },
    Rad = 0.081
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.033,
      0.074
    },
    Rad = 0.081
  }
}
Col_HairB = L0_0
L0_0 = {
  {
    Spd = 0,
    SpdAir = -0.22499999999999998,
    Pow = 0,
    PowAir = 0.322
  },
  {
    Spd = 0,
    SpdAir = 0.615,
    Pow = 0,
    PowAir = 0.3
  },
  {
    Spd = 0,
    SpdAir = 1.2465,
    Pow = 0,
    PowAir = 0.3
  }
}
L0_0.StdLen = 0.3
Ym_Kit16 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFF,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_f_hair_B0_k16"
    },
    {
      "bn_f_hair_B1_k16",
      ColRad = 0,
      RefOfsY = 0.009,
      AnimRate = HairFFAnimRt0
    },
    {
      "dm_f_hair_B2_k16",
      ColRad = 0,
      RefOfsY = 0.025,
      AnimRate = HairFFAnimRt1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFF,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_f_hair_A0_k16"
    },
    {
      "bn_f_hair_A1_k16",
      ColRad = 0,
      RefOfsY = 0,
      AnimRate = HairFFAnimRt0
    },
    {
      "dm_f_hair_A2_k16",
      ColRad = 0,
      RefOfsY = 0.033,
      AnimRate = HairFFAnimRt1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFF,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_f_hair_C0_k16"
    },
    {
      "bn_f_hair_C1_k16",
      ColRad = 0,
      RefOfsY = 0.004,
      AnimRate = HairFFAnimRt0
    },
    {
      "dm_f_hair_C2_k16",
      ColRad = 0,
      RefOfsY = 0.03,
      AnimRate = HairFFAnimRt1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    IsAnimPowerful = true,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0.2,
    {
      "bn_l_fr_hair_topA0_k16"
    },
    {
      "bn_l_fr_hair_topA1_k16",
      ColRad = 0,
      AnimRate = 0.545,
      RefOfsY = 0
    },
    {
      "bn_l_fr_hair_topA2_k16",
      ColRad = 0,
      AnimRate = 0.23,
      RefOfsY = 0
    },
    {
      "bn_l_fr_hairA0_k16",
      ColRad = 0.007,
      AnimRate = 0.17,
      RefOfsY = 0
    },
    {
      "bn_l_fr_hairA1_k16",
      ColRad = 0.008,
      AnimRate = 0.11,
      RefOfsY = 0.005
    },
    {
      "bn_l_fr_hairA2_k16",
      ColRad = 0.004,
      AnimRate = 0.065,
      RefOfsY = 0.012
    },
    {
      "dm_l_fr_hairA3_k16",
      ColRad = 0.004,
      AnimRate = 0.02,
      RefOfsY = 0.02
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    IsAnimPowerful = true,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0.2,
    {
      "bn_r_fr_hair_topA0_k16"
    },
    {
      "bn_r_fr_hair_topA1_k16",
      ColRad = 0,
      AnimRate = 0.545,
      RefOfsY = 0
    },
    {
      "bn_r_fr_hair_topA2_k16",
      ColRad = 0.002,
      AnimRate = 0.23,
      RefOfsY = 0
    },
    {
      "bn_r_fr_hairA0_k16",
      ColRad = 0.007,
      AnimRate = 0.17,
      RefOfsY = 0
    },
    {
      "bn_r_fr_hairA1_k16",
      ColRad = 0.006,
      AnimRate = 0.11,
      RefOfsY = 0.009
    },
    {
      "bn_r_fr_hairA2_k16",
      ColRad = 0.004,
      AnimRate = 0.065,
      RefOfsY = 0.018
    },
    {
      "dm_r_fr_hairA3_k16",
      ColRad = 0.005,
      AnimRate = 0.02,
      RefOfsY = 0.022
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    IsAnimPowerful = true,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0.2,
    {
      "bn_l_fr_hairB0_k16"
    },
    {
      "bn_l_fr_hairB1_k16",
      ColRad = 0.006,
      AnimRate = 0.25
    },
    {
      "bn_l_fr_hairB2_k16",
      ColRad = 0.005,
      AnimRate = 0.035
    },
    {
      "dm_l_fr_hairB3_k16",
      ColRad = 0.001,
      AnimRate = 0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    IsAnimPowerful = true,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0.2,
    {
      "bn_r_fr_hairB0_k16"
    },
    {
      "bn_r_fr_hairB1_k16",
      ColRad = 0.007,
      AnimRate = 0.25
    },
    {
      "bn_r_fr_hairB2_k16",
      ColRad = 0.006,
      AnimRate = 0.035
    },
    {
      "dm_r_fr_hairB3_k16",
      ColRad = 0.001,
      AnimRate = 0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_l_si_hairF0_k16"
    },
    {
      "dm_l_si_hairF1_k16",
      ColRad = 0,
      RefOfsY = 0.021,
      AnimRate = 0.375
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_l_si_hairD0_k16"
    },
    {
      "dm_l_si_hairD1_k16",
      ColRad = 0,
      RefOfsY = 0.021,
      AnimRate = 0.375
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_l_si_hairE0_k16"
    },
    {
      "dm_l_si_hairE1_k16",
      ColRad = 0,
      RefOfsY = 0.021,
      AnimRate = 0.375
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_l_si_hairB0_k16"
    },
    {
      "bn_l_si_hairB1_k16",
      ColRad = 0,
      RefOfsY = 0.014,
      AnimRate = 0.55
    },
    {
      "dm_l_si_hairB2_k16",
      ColRad = 0,
      RefOfsY = 0.025,
      AnimRate = 0.37
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_l_si_hairC0_k16"
    },
    {
      "bn_l_si_hairC1_k16",
      ColRad = 0,
      RefOfsY = 0.019,
      AnimRate = 0.72,
      StraightPow = 0.065
    },
    {
      "dm_l_si_hairC2_k16",
      ColRad = 0,
      RefOfsY = 0.027,
      AnimRate = 0.055,
      StraightPow = 0.01
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_l_si_hairA0_k16"
    },
    {
      "bn_l_si_hairA1_k16",
      ColRad = 0,
      RefOfsY = 0.024,
      AnimRate = 0.875,
      StraightPow = 0.09
    },
    {
      "bn_l_si_hairA2_k16",
      ColRad = 0,
      RefOfsY = 0,
      AnimRate = 0.14,
      StraightPow = 0.01
    },
    {
      "dm__l_si_hairA3_k16",
      ColRad = 0,
      RefOfsY = 0,
      AnimRate = 0.07,
      StraightPow = 0
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_r_si_hairF0_k16"
    },
    {
      "dm_r_si_hairF1_k16",
      ColRad = 0,
      RefOfsY = 0.021,
      AnimRate = 0.375
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_r_si_hairE0_k16"
    },
    {
      "dm_r_si_hairE1_k16",
      ColRad = 0,
      RefOfsY = 0.021,
      AnimRate = 0.375
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_r_si_hairD0_k16"
    },
    {
      "dm_r_si_hairD1_k16",
      ColRad = 0,
      RefOfsY = 0.021,
      AnimRate = 0.375
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_r_si_hairB0_k16"
    },
    {
      "bn_r_si_hairB1_k16",
      ColRad = 0,
      RefOfsY = 0.014,
      AnimRate = 0.55
    },
    {
      "dm_r_si_hairB2_k16",
      ColRad = 0,
      RefOfsY = 0.025,
      AnimRate = 0.37
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_r_si_hairC0_k16"
    },
    {
      "bn_r_si_hairC1_k16",
      ColRad = 0,
      RefOfsY = 0.019,
      AnimRate = 0.72,
      StraightPow = 0.065
    },
    {
      "dm_r_si_hairC2_k16",
      ColRad = 0,
      RefOfsY = 0.027,
      AnimRate = 0.055,
      StraightPow = 0.01
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    VibParam = L0_0,
    GrvRate = HairGrRt,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.005,
    StraightPow = 0,
    {
      "bn_r_si_hairA0_k16"
    },
    {
      "bn_r_si_hairA1_k16",
      ColRad = 0,
      RefOfsY = 0.024,
      AnimRate = 0.875,
      StraightPow = 0.09
    },
    {
      "bn_r_si_hairA2_k16",
      ColRad = 0,
      RefOfsY = 0,
      AnimRate = 0.14,
      StraightPow = 0.01
    },
    {
      "dm_r_si_hairA3_k16",
      ColRad = 0,
      RefOfsY = 0,
      AnimRate = 0.07,
      StraightPow = 0
    }
  }
}
