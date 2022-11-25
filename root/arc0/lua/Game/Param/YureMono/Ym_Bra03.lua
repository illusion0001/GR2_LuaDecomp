L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.01,
      0.12
    },
    Rad = 0.095
  }
}
Col_HairFront = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.01,
      0.12
    },
    Rad = 0.1
  }
}
Col_HairSideUp = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.01,
      0.12
    },
    Rad = 0.1
  }
}
Col_HairSizeLow = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.005,
      0.13
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.01,
      0.07
    },
    Rad = 0.1
  }
}
Col_HairBackUp = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.005,
      0.1
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine1",
    Pos = {
      0,
      0,
      0.24
    },
    Rad = 0.1
  }
}
Col_HairBackLow = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Node1 = "bn_l_thigh",
    Pos0 = {
      0,
      -0.01,
      0.005
    },
    Pos1 = {
      -0.025,
      -0.01,
      0.365
    },
    Rad = 0.1
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Node1 = "bn_r_thigh",
    Pos0 = {
      0,
      -0.01,
      0.005
    },
    Pos1 = {
      0.025,
      -0.01,
      0.365
    },
    Rad = 0.1
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_leg",
    Node1 = "bn_l_leg",
    Pos0 = {
      -0.02,
      0,
      0
    },
    Pos1 = {
      -0.015,
      0,
      0.42
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_leg",
    Node1 = "bn_r_leg",
    Pos0 = {
      0.02,
      0,
      0
    },
    Pos1 = {
      0.015,
      0,
      0.42
    },
    Rad = 0.105
  }
}
Col_Suso = L0_0
L0_0 = kYm_Type_Himo
Ym_Bra03 = {
  Dbg_DispNodeA = {
    Size = 0.1,
    {
      "bn_l_coat_1_0"
    },
    {
      "bn_l_coat_1_1"
    },
    {
      "dm_l_coat_1_2"
    },
    {
      "bn_l_coat_2_0"
    },
    {
      "bn_l_coat_2_1"
    },
    {
      "dm_l_coat_2_2"
    },
    {
      "bn_l_coat_3_0"
    },
    {
      "bn_l_coat_3_1"
    },
    {
      "dm_l_coat_3_2"
    },
    {
      "bn_r_coat_3_0"
    },
    {
      "bn_r_coat_3_1"
    },
    {
      "dm_r_coat_3_2"
    },
    {
      "bn_r_coat_2_0"
    },
    {
      "bn_r_coat_2_1"
    },
    {
      "dm_r_coat_2_2"
    },
    {
      "bn_r_coat_1_0"
    },
    {
      "bn_r_coat_1_1"
    },
    {
      "dm_r_coat_1_2"
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    GrvRate = 0.1,
    AnimRate = 0.2,
    {
      "bn_hair_fr_1"
    },
    {
      "bn_hair_fr_2",
      AnimRate = 1,
      ColRad = 0.01
    },
    {
      "dm_hair_fr_3",
      AnimRate = 0.3,
      ColRad = 0.005
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideUp,
    GrvRate = 0.1,
    {
      "bn_hair_upper_bk_l"
    },
    {
      "dm_hair_upper_bk_l",
      AnimRate = 0.3,
      ColRad = 0.01
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    GrvRate = 0.1,
    Collision = Col_HairSideUp,
    {
      "bn_hair_upper_bk_r"
    },
    {
      "dm_hair_upper_bk_r",
      AnimRate = 0.3,
      ColRad = 0.01
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideLow,
    GrvRate = 0.1,
    {
      "bn_hair_lower_bk_l"
    },
    {
      "dm_hair_lower_bk_l",
      AnimRate = 0.3,
      ColRad = 0.01
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideLow,
    GrvRate = 0.1,
    {
      "bn_hair_lower_bk_r"
    },
    {
      "dm_hair_lower_bk_r",
      AnimRate = 0.3,
      ColRad = 0.01
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBackUp,
    GrvRate = 0.1,
    {
      "bn_hair_upper_bk_c"
    },
    {
      "dm_hair_upper_bk_c",
      AnimRate = 0.3,
      ColRad = 0.01
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBackLow,
    GrvRate = 0.1,
    {
      "bn_hair_lower_bk_c"
    },
    {
      "dm_hair_lower_bk_c",
      AnimRate = 0.3,
      ColRad = 0.01
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Suso,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    GrvRate = 1,
    AirRegV = 0.7,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.2,
    {
      {
        "bn_l_coat_1_0"
      },
      {
        "bn_l_coat_1_1",
        ColRad = 0.02,
        AnimRate = 0.3
      },
      {
        "dm_l_coat_1_2",
        ColRad = 0.02
      }
    },
    {
      {
        "bn_l_coat_2_0"
      },
      {
        "bn_l_coat_2_1",
        ColRad = 0.015
      },
      {
        "dm_l_coat_2_2",
        ColRad = 0.015
      }
    },
    {
      {
        "bn_l_coat_3_0"
      },
      {
        "bn_l_coat_3_1"
      },
      {
        "dm_l_coat_3_2"
      }
    },
    {
      {
        "bn_r_coat_3_0"
      },
      {
        "bn_r_coat_3_1"
      },
      {
        "dm_r_coat_3_2"
      }
    },
    {
      {
        "bn_r_coat_2_0"
      },
      {
        "bn_r_coat_2_1",
        ColRad = 0.015
      },
      {
        "dm_r_coat_2_2",
        ColRad = 0.015
      }
    },
    {
      {
        "bn_r_coat_1_0"
      },
      {
        "bn_r_coat_1_1",
        ColRad = 0.02,
        AnimRate = 0.3
      },
      {
        "dm_r_coat_1_2",
        ColRad = 0.02
      }
    }
  }
}
