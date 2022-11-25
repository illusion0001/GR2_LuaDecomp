local L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = 0
L1_1 = 0.1
L2_2 = 1
L3_3 = 0.3
L4_4 = 0.2
L5_5 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      -0.06,
      0.09
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      0.005,
      0.095
    },
    Rad = 0.075
  }
}
Col_HairF = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      -0.06,
      0.12
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      -0.07,
      0.055
    },
    Rad = 0.075
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.025,
      -0.01,
      0.095
    },
    Rad = 0.125
  }
}
L5_5.Dbg_IsDisp = true
Col_HairFR = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.045,
      -0.025,
      0.105
    },
    Rad = 0.15
  }
}
Col_HairSideLF = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.035,
      0.095
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      -0.025,
      0.005
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine3",
    Pos = {
      0,
      -0.035,
      0.05
    },
    Rad = 0.13
  }
}
Col_HairBack = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.035,
      -0.025,
      0.105
    },
    Rad = 0.14
  }
}
Col_HairSideR = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      0.055,
      -0.22
    },
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
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.07,
      -0.04,
      0.015
    },
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
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.07,
      -0.04,
      0.015
    },
    Pos1 = {
      0.005,
      0.025,
      0.19
    },
    Rad = 0.115
  }
}
Col_TareF = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      -0.095,
      -0.185
    },
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
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.07,
      -0.04,
      0.015
    },
    Pos1 = {
      -0.005,
      0,
      0.185
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.07,
      -0.04,
      0.015
    },
    Pos1 = {
      0.005,
      0,
      0.185
    },
    Rad = 0.115
  }
}
L5_5.Dbg_IsDisp = true
Col_TareB = L5_5
L5_5 = {
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairF,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_a0_c03",
      AnimRate = L2_2
    },
    {
      "bn_hair_a1_c03",
      AnimRate = L2_2
    },
    {
      "dm_hair_a1_c03"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairF,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_b0_c03",
      AnimRate = L2_2
    },
    {
      "bn_hair_b1_c03",
      AnimRate = L2_2
    },
    {
      "bn_hair_b2_c03",
      AnimRate = 0.5
    },
    {
      "dm_hair_b2_c03",
      AnimRate = 0.3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFR,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_g0_c03",
      AnimRate = L2_2
    },
    {
      "bn_hair_g1_c03",
      AnimRate = 0.8
    },
    {
      "dm_hair_g1_c03",
      AnimRate = 0.15
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideLF,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_c0_c03",
      AnimRate = L2_2
    },
    {
      "dm_hair_c0_c03",
      AnimRate = L3_3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideLF,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_d0_c03",
      AnimRate = L2_2
    },
    {
      "dm_hair_d0_c03",
      AnimRate = L3_3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_e0_c03",
      AnimRate = L2_2
    },
    {
      "bn_hair_e1_c03",
      AnimRate = L2_2
    },
    {
      "dm_hair_e1_c03",
      AnimRate = L3_3
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideR,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_f0_c03",
      AnimRate = L2_2
    },
    {
      "bn_hair_f1_c03",
      AnimRate = L2_2,
      ColRad = 0
    },
    {
      "dm_hair_f1_c03",
      AnimRate = L3_3
    }
  },
  {
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
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
        "bn_r_fr_cloth_b0_c03"
      },
      {
        "bn_r_fr_cloth_b1_c03",
        AnimRate = L4_4
      },
      {
        "dm_r_fr_cloth_b1_c03"
      }
    },
    {
      {
        "bn_r_fr_cloth_a0_c03"
      },
      {
        "bn_r_fr_cloth_a1_c03",
        AnimRate = L4_4
      },
      {
        "dm_r_fr_cloth_a1_c03"
      }
    },
    {
      {
        "bn_l_fr_cloth_a0_c03"
      },
      {
        "bn_l_fr_cloth_a1_c03",
        AnimRate = L4_4
      },
      {
        "dm_l_fr_cloth_a1_c03"
      }
    },
    {
      {
        "bn_l_fr_cloth_b0_c03"
      },
      {
        "bn_l_fr_cloth_b1_c03",
        AnimRate = L4_4
      },
      {
        "dm_l_fr_cloth_b1_c03"
      }
    }
  },
  {
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
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
        "bn_l_ba_cloth_b0_c03"
      },
      {
        "bn_l_ba_cloth_b1_c03",
        AnimRate = L4_4
      },
      {
        "dm_l_ba_cloth_b1_c03"
      }
    },
    {
      {
        "bn_l_ba_cloth_a0_c03"
      },
      {
        "bn_l_ba_cloth_a1_c03",
        AnimRate = L4_4
      },
      {
        "dm_l_ba_cloth_a1_c03"
      }
    },
    {
      {
        "bn_r_ba_cloth_a0_c03"
      },
      {
        "bn_r_ba_cloth_a1_c03",
        AnimRate = L4_4
      },
      {
        "dm_r_ba_cloth_a1_c03"
      }
    },
    {
      {
        "bn_r_ba_cloth_b0_c03"
      },
      {
        "bn_r_ba_cloth_b1_c03",
        AnimRate = L4_4
      },
      {
        "dm_r_ba_cloth_b1_c03"
      }
    }
  }
}
L5_5.Dbg_IsDispBody = true
Ym_Cid03 = L5_5
