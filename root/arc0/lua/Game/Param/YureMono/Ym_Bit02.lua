Col_Hair = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.015,
      0.125
    },
    Rad = 0.135
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.035,
      0.05
    },
    Rad = 0.07
  }
}
Col_Skirt = {
  Dbg_IsDisp = true,
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_pelvis_end",
    Pos0 = {
      0,
      0.12,
      0
    },
    Pos1 = {
      0,
      0.005,
      0.005
    },
    Rad = 0.08
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.045,
      0.005,
      0
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.035,
      0,
      0.225
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.045,
      0.005,
      0
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.035,
      0,
      0.225
    },
    Rad = 0.07
  }
}
Col_KoshiHimo = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      0,
      0.12,
      0
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.045,
      0.015,
      -0.01
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.035,
      0,
      0.225
    },
    Rad = 0.085
  }
}
Ym_Bit02 = {
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = 0.5,
    AnimRate = 0.5,
    ColRad = 0,
    {
      "bn_l_hair_a0_bi02"
    },
    {
      "bn_l_hair_a1_bi02",
      AnimRate = 1
    },
    {
      "bn_l_hair_a2_bi02",
      AnimRate = 0.7
    },
    {
      "dm_l_hair_a2_bi02"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = 0.5,
    AnimRate = 0.5,
    ColRad = 0,
    {
      "bn_l_hair_b0"
    },
    {
      "bn_l_hair_b1",
      AnimRate = 1
    },
    {
      "bn_l_hair_b2",
      AnimRate = 0.7
    },
    {
      "dm_l_hair_b2"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = 0.5,
    AnimRate = 0.5,
    ColRad = 0,
    {
      "bn_r_hair_a0_bi02"
    },
    {
      "bn_r_hair_a1_bi02",
      AnimRate = 1
    },
    {
      "dm_r_hair_a1_bi02"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = 0.5,
    AnimRate = 0.5,
    ColRad = 0,
    {
      "bn_r_hair_b0_bi02"
    },
    {
      "bn_r_hair_b1_bi02",
      AnimRate = 1
    },
    {
      "bn_r_hair_b2_bi02",
      AnimRate = 0.7
    },
    {
      "dm_r_hair_b2_bi02"
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Skirt,
    IsTube = true,
    CalLoopNum = 5,
    IsFitLen = false,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.1,
    BeneChijimiX = 0.5,
    BeneNobiX = 0.02,
    ColPowXHalf = 0.4,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    {
      {
        "bn_r_si_cloth_a0_bi02"
      },
      {
        "bn_r_si_cloth_a1_bi02"
      },
      {
        "bn_r_si_cloth_a2_bi02"
      },
      {
        "bn_r_si_cloth_a3_bi02"
      },
      {
        "bn_r_si_cloth_a4_bi02"
      },
      {
        "dm_r_si_cloth_a4_bi02"
      }
    },
    {
      {
        "bn_r_fr_cloth0_bi02"
      },
      {
        "bn_r_fr_cloth1_bi02"
      },
      {
        "bn_r_fr_cloth2_bi02"
      },
      {
        "bn_r_fr_cloth3_bi02"
      },
      {
        "bn_r_fr_cloth4_bi02"
      },
      {
        "dm_r_fr_cloth4_bi02"
      }
    },
    {
      {
        "bn_l_fr_cloth0_bi02"
      },
      {
        "bn_l_fr_cloth1_bi02"
      },
      {
        "bn_l_fr_cloth2_bi02"
      },
      {
        "bn_l_fr_cloth3_bi02"
      },
      {
        "bn_l_fr_cloth4_bi02"
      },
      {
        "dm_l_fr_cloth4_bi02"
      }
    },
    {
      {
        "bn_l_si_cloth_a0_bi02"
      },
      {
        "bn_l_si_cloth_a1_bi02"
      },
      {
        "bn_l_si_cloth_a2_bi02"
      },
      {
        "bn_l_si_cloth_a3_bi02"
      },
      {
        "bn_l_si_cloth_a4_bi02"
      },
      {
        "dm_l_si_cloth_a4_bi02"
      }
    },
    {
      {
        "bn_l_si_cloth_b0_bi02"
      },
      {
        "bn_l_si_cloth_b1_bi02"
      },
      {
        "bn_l_si_cloth_b2_bi02"
      },
      {
        "bn_l_si_cloth_b3_bi02"
      },
      {
        "bn_l_si_cloth_b4_bi02"
      },
      {
        "dm_l_si_cloth_b4_bi02"
      }
    },
    {
      {
        "bn_l_ba_cloth0_bi02"
      },
      {
        "bn_l_ba_cloth1_bi02"
      },
      {
        "bn_l_ba_cloth2_bi02"
      },
      {
        "bn_l_ba_cloth3_bi02"
      },
      {
        "bn_l_ba_cloth4_bi02"
      },
      {
        "dm_l_ba_cloth4_bi02"
      }
    },
    {
      {
        "bn_r_ba_cloth0_bi02"
      },
      {
        "bn_r_ba_cloth1_bi02"
      },
      {
        "bn_r_ba_cloth2_bi02"
      },
      {
        "bn_r_ba_cloth3_bi02"
      },
      {
        "bn_r_ba_cloth4_bi02"
      },
      {
        "dm_r_ba_cloth4_bi02"
      }
    },
    {
      {
        "bn_r_si_cloth_b0_bi02"
      },
      {
        "bn_r_si_cloth_b1_bi02"
      },
      {
        "bn_r_si_cloth_b2_bi02"
      },
      {
        "bn_r_si_cloth_b3_bi02"
      },
      {
        "bn_r_si_cloth_b4_bi02"
      },
      {
        "dm_r_si_cloth_b4_bi02"
      }
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_KoshiHimo,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.01,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_rope_a0_bi02"
    },
    {
      "bn_rope_a1_bi02",
      AnimRate = 0.02
    },
    {
      "dm_rope_a1_bi02"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_KoshiHimo,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.01,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0,
    VibParamL = l_VibParamScL,
    VibParamR = l_VibParamScR,
    NoAirRegRate = {0.06, 0.06},
    {
      "bn_rope_b0_bi02"
    },
    {
      "bn_rope_b1_bi02",
      AnimRate = 0.02
    },
    {
      "dm_rope_b1_bi02"
    }
  }
}
