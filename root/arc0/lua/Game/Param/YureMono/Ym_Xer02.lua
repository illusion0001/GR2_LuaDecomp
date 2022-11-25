L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      -0.035,
      0.1
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      0.005,
      0.1
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      -0.015,
      -0.005
    },
    Rad = 0.09
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Pos0 = {
      -0.015,
      -0.015,
      0.055
    },
    Node1 = "bn_r_clavicle",
    Pos1 = {
      0.015,
      -0.015,
      0.055
    },
    Rad = 0.13
  }
}
L0_0.Dbg_IsDisp = true
Col_HairBack = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Pos0 = {
      0,
      0.055,
      -0.22
    },
    Node1 = "bn_spine0",
    Pos1 = {
      0,
      0.045,
      0.045
    },
    Rad = 0.19
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.08,
      0,
      0.015
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.005,
      0.025,
      0.19
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.08,
      0,
      0.015
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.005,
      0.025,
      0.19
    },
    Rad = 0.115
  }
}
Col_TareF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Pos0 = {
      0,
      -0.095,
      -0.185
    },
    Node1 = "bn_spine0",
    Pos1 = {
      0,
      -0.085,
      0.045
    },
    Rad = 0.19
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.07,
      0,
      0.015
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.005,
      0,
      0.185
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.07,
      0,
      0.015
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.005,
      0,
      0.185
    },
    Rad = 0.12
  }
}
Col_TareB = L0_0
L0_0 = 0.5
Ym_Xer02 = {
  Dbg_IsDispBody = true,
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBack,
    GrvRate = L0_0,
    AirReg = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_a0"
    },
    {
      "bn_l_hair_a1",
      AnimRate = 0.8,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_l_hair_a2",
      AnimRate = 0.3,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_l_hair_a3",
      AnimRate = 0,
      ColRad = 0.02
    },
    {
      "dm_l_hair_a4",
      AnimRate = 0
    },
    AirBottom = 0.02,
    VibParam = {
      {
        Spd = 0,
        SpdAir = -1,
        Pow = 0,
        PowAir = 1
      },
      {
        Spd = 0,
        SpdAir = 2.1,
        Pow = 0,
        PowAir = 1
      }
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBack,
    GrvRate = L0_0,
    AirReg = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_b0"
    },
    {
      "bn_l_hair_b1",
      AnimRate = 0.8,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_l_hair_b2",
      AnimRate = 0.3,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_l_hair_b3",
      AnimRate = 0,
      ColRad = 0.02
    },
    {
      "dm_l_hair_b4",
      AnimRate = 0
    },
    AirBottom = 0.02,
    VibParam = {
      {
        Spd = 0,
        SpdAir = -1,
        Pow = 0,
        PowAir = 1
      },
      {
        Spd = 0,
        SpdAir = 2.1,
        Pow = 0,
        PowAir = 1
      }
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBack,
    GrvRate = L0_0,
    AirReg = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_b0"
    },
    {
      "bn_r_hair_b1",
      AnimRate = 0.8,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_r_hair_b2",
      AnimRate = 0.3,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_r_hair_b3",
      AnimRate = 0,
      ColRad = 0.02
    },
    {
      "dm_r_hair_b4",
      AnimRate = 0
    },
    AirBottom = 0.02,
    VibParam = {
      {
        Spd = 0,
        SpdAir = -1,
        Pow = 0,
        PowAir = 1
      },
      {
        Spd = 0,
        SpdAir = 2.1,
        Pow = 0,
        PowAir = 1
      }
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBack,
    GrvRate = L0_0,
    AirReg = 0.1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_a0"
    },
    {
      "bn_r_hair_a1",
      AnimRate = 0.8,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_r_hair_a2",
      AnimRate = 0.3,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_r_hair_a3",
      AnimRate = 0,
      ColRad = 0.02
    },
    {
      "dm_r_hair_a4",
      AnimRate = 0
    },
    AirBottom = 0.02,
    VibParam = {
      {
        Spd = 0,
        SpdAir = -1,
        Pow = 0,
        PowAir = 1
      },
      {
        Spd = 0,
        SpdAir = 2.1,
        Pow = 0,
        PowAir = 1
      }
    }
  },
  {
    Type = kYm_Type_Cloth,
    Collision = Col_TareF,
    IsTube = false,
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.3,
    BeneChijimiX = 0.8,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    Width = 0.1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0.01,
    ColRad = 0.01,
    StraightPowZ = 0.2,
    {
      {
        "bn_r_cloth_b0"
      },
      {
        "bn_r_cloth_b1",
        AnimRate = 0.2
      },
      {
        "dm_r_cloth_b2"
      }
    },
    {
      {
        "bn_r_cloth_a0"
      },
      {
        "bn_r_cloth_a1",
        AnimRate = 0.2
      },
      {
        "dm_r_cloth_a2"
      }
    },
    {
      {
        "bn_l_cloth_a0"
      },
      {
        "bn_l_cloth_a1",
        AnimRate = 0.2
      },
      {
        "dm_l_cloth_a2"
      }
    },
    {
      {
        "bn_l_cloth_b0"
      },
      {
        "bn_l_cloth_b1",
        AnimRate = 0.2
      },
      {
        "dm_l_cloth_b2"
      }
    }
  },
  {
    Type = kYm_Type_Cloth,
    Collision = Col_TareB,
    IsTube = false,
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.3,
    BeneChijimiX = 0.8,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    Width = 0.1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0.01,
    ColRad = 0.01,
    StraightPowZ = 0.2,
    {
      {
        "bn_l_cloth_c0"
      },
      {
        "bn_l_cloth_c1",
        AnimRate = 0.2
      },
      {
        "dm_l_cloth_c2"
      }
    },
    {
      {
        "bn_l_cloth_d0"
      },
      {
        "bn_l_cloth_d1",
        AnimRate = 0.2
      },
      {
        "dm_l_cloth_d2"
      }
    },
    {
      {
        "bn_r_cloth_d0"
      },
      {
        "bn_r_cloth_d1",
        AnimRate = 0.2
      },
      {
        "dm_r_cloth_d2"
      }
    },
    {
      {
        "bn_r_cloth_c0"
      },
      {
        "bn_r_cloth_c1",
        AnimRate = 0.2
      },
      {
        "dm_r_cloth_c2"
      }
    }
  }
}
