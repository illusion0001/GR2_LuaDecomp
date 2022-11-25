HairGrR = 0.1
HairAirReg = 0.2
HairLimRad = 0.55
HairAnimR = 0.2
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0,
      -0.015,
      0.12
    },
    Pos1 = {
      0,
      -0.045,
      0.105
    },
    Rad = 0.095
  }
}
Col_forHairF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Node1 = "bn_spine1",
    Pos0 = {
      0,
      0.01,
      0.11
    },
    Pos1 = {
      0,
      0.01,
      0
    },
    Rad = 0.165
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_r_clavicle",
    Pos0 = {
      -0.045,
      -0.03,
      0.02
    },
    Pos1 = {
      0,
      0,
      0.04
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_l_clavicle",
    Pos0 = {
      0.045,
      -0.03,
      0.02
    },
    Pos1 = {
      0,
      0,
      0.04
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis",
    Node1 = "bn_pelvis",
    Pos0 = {
      -0.03,
      -0.01,
      0.065
    },
    Pos1 = {
      0.03,
      -0.01,
      0.065
    },
    Rad = 0.19
  }
}
L0_0.Dbg_IsDisp = true
Col_forHimo = L0_0
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
Ym_Lum01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_c_hair_a0_lu01"
    },
    {
      "dm_c_hair_a1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_hair_a0_lu01"
    },
    {
      "dm_l_hair_a1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_hair_a0_lu01"
    },
    {
      "dm_r_hair_a1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_c_hair_b0_lu01"
    },
    {
      "dm_c_hair_b1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_hair_b0_lu01"
    },
    {
      "dm_l_hair_b1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_hair_c0_lu01"
    },
    {
      "dm_l_hair_c1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_l_hair_d0_lu01"
    },
    {
      "dm_l_hair_d1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_b_hair_a0_lu01"
    },
    {
      "dm_b_hair_a1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_b_hair_b0_lu01"
    },
    {
      "dm_b_hair_b1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_c_hair_d0_lu01"
    },
    {
      "dm_c_hair_d1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_hair_c0_lu01"
    },
    {
      "dm_r_hair_c1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_r_hair_b0_lu01"
    },
    {
      "bn_r_hair_b1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHairF,
    VibParam = L0_0,
    GrvRate = HairGrR,
    AirReg = HairAirReg,
    ColRad = 0.005,
    StraightPow = HairStPow,
    {
      "bn_c_hair_c0_lu01"
    },
    {
      "dm_c_hair_c1_lu01",
      AnimRate = HairAnimR,
      LimRad = HairLimRad
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_forHimo,
    VibParam = HimoVibParam,
    GrvRate = 1,
    AirReg = 0.2,
    ColRad = 0.005,
    StraightPow = 0.1,
    {"bn_string0"},
    {"bn_string1", AnimRate = 0.5},
    {"bn_string2", AnimRate = 0.1},
    {"bn_string3", AnimRate = 0},
    {"bn_string4", AnimRate = 0},
    {"dm_string5", AnimRate = 0}
  }
}
