L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.01,
      0.095
    },
    Rad = 0.12
  }
}
Col_HairFront = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.01,
      -0.025,
      0.035
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      -0.03,
      -0.015,
      0.075
    },
    Node1 = "bn_head",
    Pos1 = {
      -0.025,
      0.015,
      0.085
    },
    Rad = 0.115
  }
}
Col_HairMomiL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.01,
      -0.025,
      0.035
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0.03,
      -0.015,
      0.075
    },
    Node1 = "bn_head",
    Pos1 = {
      0.025,
      0.015,
      0.085
    },
    Rad = 0.115
  }
}
Col_HairMomiR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0,
      0.095
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Pos0 = {
      0.005,
      0.01,
      0
    },
    Node1 = "bn_l_clavicle",
    Pos1 = {
      0,
      -0.02,
      0.09
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Pos0 = {
      -0.005,
      0.01,
      0
    },
    Node1 = "bn_r_clavicle",
    Pos1 = {
      0,
      -0.02,
      0.09
    },
    Rad = 0.07
  }
}
L0_0.Dbg_IsDisp = true
Col_HairBack = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.08,
      0.005,
      0
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.045,
      0,
      0.29
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.08,
      0.005,
      0
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.045,
      0,
      0.29
    },
    Rad = 0.085
  }
}
L0_0.Dbg_IsDisp = true
Col_Skirt = L0_0
L0_0 = {
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
  },
  {
    Spd = 0,
    SpdAir = 2.73,
    Pow = 0,
    PowAir = 0.4
  }
}
L0_0.StdLen = 0.3
Ym_Eqo02 = {
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    VibParam = L0_0,
    GrvRate = 0.2,
    ColRad = 0,
    {
      "bn_fr_hair_0_0"
    },
    {
      "bn_fr_hair_0_1",
      AnimRate = 0.7
    },
    {
      "dm_n_fr_hair_0_2",
      AnimRate = 0.3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    VibParam = L0_0,
    GrvRate = 0.2,
    ColRad = 0,
    {
      "bn_fr_hair_1_0"
    },
    {
      "bn_fr_hair_1_1",
      AnimRate = 0.7
    },
    {
      "dm_bn_fr_hair_1_2",
      AnimRate = 0.3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    VibParam = L0_0,
    GrvRate = 0.2,
    ColRad = 0,
    {
      "bn_fr_hair_2_0"
    },
    {
      "bn_fr_hair_2_1",
      AnimRate = 0.7
    },
    {
      "dm_bn_fr_hair_2_2",
      AnimRate = 0.3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    VibParam = L0_0,
    GrvRate = 0.2,
    ColRad = 0,
    {
      "bn_fr_hair_3_0"
    },
    {
      "bn_fr_hair_3_1",
      AnimRate = 0.7
    },
    {
      "dm_bn_fr_hair_3_2",
      AnimRate = 0.3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairMomiL,
    VibParam = L0_0,
    GrvRate = 0.2,
    ColRad = 0,
    {
      "bn_l_hair_0"
    },
    {
      "bn_l_hair_1",
      AnimRate = 0.8
    },
    {
      "bn_l_hair_2",
      AnimRate = 0.4
    },
    {
      "dm_bn_fr_l_hair_3",
      AnimRate = 0.15,
      GrvRate = 0.1
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairMomiR,
    VibParam = L0_0,
    GrvRate = 0.2,
    ColRad = 0,
    {
      "bn_r_hair_0"
    },
    {
      "bn_r_hair_1",
      AnimRate = 0.8
    },
    {
      "bn_r_hair_2",
      AnimRate = 0.4
    },
    {
      "dm_n_r_hair_3",
      AnimRate = 0.15,
      GrvRate = 0.1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBack,
    VibParam = L0_0,
    GrvRate = 0.2,
    {
      "bn_bk_hair_0"
    },
    {
      "bn_bk_hair_1",
      ColRad = 0.035,
      AnimRate = 1
    },
    {
      "bn_bk_hair_2",
      ColRad = 0.025,
      AnimRate = 0.5
    },
    {
      "bn_bk_hair_3",
      ColRad = 0.02,
      AnimRate = 0.2,
      GrvRate = 0.2
    },
    {
      "dm_bn_bk_hair_4",
      ColRad = 0.01,
      AnimRate = 0.1,
      GrvRate = 0.1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Skirt,
    IsTube = true,
    CalLoopNum = 3,
    IsFitLen = false,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.9,
    BeneNobiX = 0.5,
    ColPowXHalf = 0.4,
    GrvRate = 1,
    AirRegV = 0.7,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.1,
    {
      {
        "bn_l_skirt_1_0"
      },
      {
        "bn_l_skirt_1_1",
        AnimRate = 0.5
      },
      {
        "dm_bn_l_skirt_1_2"
      }
    },
    {
      {
        "bn_l_skirt_2_0"
      },
      {
        "bn_l_skirt_2_1",
        AnimRate = 0.5
      },
      {
        "dm_bn_l_skirt_2_2"
      }
    },
    {
      {
        "bn_l_skirt_3_0"
      },
      {
        "bn_l_skirt_3_1",
        AnimRate = 0.5
      },
      {
        "dm_bn_l_skirt_3_2"
      }
    },
    {
      {
        "bn_r_skirt_3_0"
      },
      {
        "bn_r_skirt_3_1",
        AnimRate = 0.5
      },
      {
        "dm_bn_r_skirt_3_2"
      }
    },
    {
      {
        "bn_r_skirt_2_0"
      },
      {
        "bn_r_skirt_2_1",
        AnimRate = 0.5
      },
      {
        "dm_bn_r_skirt_2_2"
      }
    },
    {
      {
        "bn_r_skirt_1_0"
      },
      {
        "bn_r_skirt_1_1",
        AnimRate = 0.5
      },
      {
        "dm_bn_r_skirt_1_3"
      }
    }
  }
}
