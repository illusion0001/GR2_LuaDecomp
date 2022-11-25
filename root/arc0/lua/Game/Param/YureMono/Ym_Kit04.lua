local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
L0_0 = {
  L1_1,
  L2_2,
  L3_3,
  L4_4,
  L5_5,
  L6_6,
  L7_7,
  L8_8,
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0,
      -0.13,
      -0.01
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      0,
      -0.06,
      0.385
    },
    Rad = 0.205
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0,
      -0.13,
      -0.01
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0,
      -0.06,
      0.385
    },
    Rad = 0.205
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_leg",
    Pos0 = {
      -0.06,
      0,
      0.06
    },
    Node1 = "bn_l_leg",
    Pos1 = {
      0.03,
      -0.09,
      0.5
    },
    Rad = 0.255
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_leg",
    Pos0 = {
      0.06,
      0,
      0.06
    },
    Node1 = "bn_r_leg",
    Pos1 = {
      -0.03,
      -0.09,
      0.5
    },
    Rad = 0.255
  },
  {
    Type = kYm_ColType_Surface,
    Node = "loc_top",
    Pos = {
      0,
      0,
      0
    },
    Vec = {
      0,
      1,
      0
    }
  }
}
L1_1 = {}
L2_2 = kYm_ColType_Sphere
L1_1.Type = L2_2
L1_1.Node = "bn_head"
L2_2 = {
  L3_3,
  L4_4,
  L5_5
}
L3_3 = 0
L4_4 = 0.03
L5_5 = -0.01
L1_1.Pos = L2_2
L1_1.Rad = 0.16
L2_2 = {}
L3_3 = kYm_ColType_Cupsle
L2_2.Type = L3_3
L2_2.Node0 = "bn_spine1"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0.045
L5_5 = -0.015
L6_6 = 0.135
L2_2.Pos0 = L3_3
L2_2.Node1 = "bn_spine1"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = -0.045
L5_5 = -0.015
L6_6 = 0.135
L2_2.Pos1 = L3_3
L2_2.Rad = 0.11
L3_3 = {}
L4_4 = kYm_ColType_Cupsle
L3_3.Type = L4_4
L3_3.Node0 = "bn_l_clavicle"
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = 0.035
L6_6 = -0.02
L7_7 = 0.09
L3_3.Pos0 = L4_4
L3_3.Node1 = "bn_r_clavicle"
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = -0.035
L6_6 = -0.02
L7_7 = 0.09
L3_3.Pos1 = L4_4
L3_3.Rad = 0.1
L4_4 = {}
L5_5 = kYm_ColType_Cupsle
L4_4.Type = L5_5
L4_4.Node0 = "bn_spine0"
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = 0
L7_7 = -0.05
L8_8 = 0.15
L4_4.Pos0 = L5_5
L4_4.Node1 = "bn_pelvis"
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = 0
L7_7 = 0
L8_8 = 0.15
L4_4.Pos1 = L5_5
L4_4.Rad = 0.13
L5_5 = {}
L6_6 = kYm_ColType_Cupsle
L5_5.Type = L6_6
L5_5.Node0 = "bn_l_arm"
L6_6 = {
  L7_7,
  L8_8,
  0.03
}
L7_7 = -0.025
L8_8 = -0.03
L5_5.Pos0 = L6_6
L5_5.Node1 = "bn_l_forearm"
L6_6 = {
  L7_7,
  L8_8,
  0
}
L7_7 = 0
L8_8 = 0
L5_5.Pos1 = L6_6
L5_5.Rad = 0.1
L6_6 = {}
L7_7 = kYm_ColType_Cupsle
L6_6.Type = L7_7
L6_6.Node0 = "bn_l_forearm"
L7_7 = {
  L8_8,
  0,
  0
}
L8_8 = 0
L6_6.Pos1 = L7_7
L6_6.Node1 = "bn_l_forearm"
L7_7 = {
  L8_8,
  0,
  0.24
}
L8_8 = 0
L6_6.Pos0 = L7_7
L6_6.Rad = 0.1
L7_7 = {}
L8_8 = kYm_ColType_Cupsle
L7_7.Type = L8_8
L7_7.Node0 = "bn_r_arm"
L8_8 = {
  0.025,
  -0.03,
  0.03
}
L7_7.Pos0 = L8_8
L7_7.Node1 = "bn_r_forearm"
L8_8 = {
  0,
  0,
  0
}
L7_7.Pos1 = L8_8
L7_7.Rad = 0.07
L8_8 = {}
L8_8.Type = kYm_ColType_Cupsle
L8_8.Node0 = "bn_r_forearm"
L8_8.Pos0 = {
  0,
  0,
  0
}
L8_8.Node1 = "bn_r_forearm"
L8_8.Pos1 = {
  0,
  0,
  0.24
}
L8_8.Rad = 0.07
Col_forScarf = L0_0
L0_0 = {
  L1_1,
  L2_2,
  L3_3,
  L4_4,
  L5_5
}
L1_1 = {}
L2_2 = kYm_ColType_Sphere
L1_1.Type = L2_2
L1_1.Node = "bn_head"
L2_2 = {
  L3_3,
  L4_4,
  L5_5
}
L3_3 = 0
L4_4 = 0.06
L5_5 = 0.03
L1_1.Pos = L2_2
L1_1.Rad = 0.095
L2_2 = {}
L3_3 = kYm_ColType_Sphere
L2_2.Type = L3_3
L2_2.Node = "bn_spine3"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0
L5_5 = -0.05
L6_6 = 0.05
L2_2.Pos = L3_3
L2_2.Rad = 0.095
L3_3 = {}
L4_4 = kYm_ColType_Cupsle
L3_3.Type = L4_4
L3_3.Node0 = "bn_spine3"
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = 0.065
L6_6 = -0.04
L7_7 = 0.095
L3_3.Pos0 = L4_4
L3_3.Node1 = "bn_spine3"
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = 0.09
L6_6 = 0
L7_7 = 0.115
L3_3.Pos1 = L4_4
L3_3.Rad = 0.05
L4_4 = {}
L5_5 = kYm_ColType_Cupsle
L4_4.Type = L5_5
L4_4.Node0 = "bn_spine3"
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = -0.065
L7_7 = -0.04
L8_8 = 0.095
L4_4.Pos0 = L5_5
L4_4.Node1 = "bn_spine3"
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = -0.09
L7_7 = 0
L8_8 = 0.115
L4_4.Pos1 = L5_5
L4_4.Rad = 0.05
L5_5 = {}
L6_6 = kYm_ColType_Cupsle
L5_5.Type = L6_6
L5_5.Node0 = "bn_head"
L6_6 = {
  L7_7,
  L8_8,
  0.09
}
L7_7 = 0
L8_8 = 0.03
L5_5.Pos0 = L6_6
L5_5.Node1 = "bn_jaw"
L6_6 = {
  L7_7,
  L8_8,
  0
}
L7_7 = 0
L8_8 = 0.03
L5_5.Pos1 = L6_6
L5_5.Rad = 0.06
Col_Hair = L0_0
L0_0 = {
  L1_1,
  L2_2,
  L3_3,
  L4_4,
  L5_5,
  L6_6
}
L1_1 = {}
L2_2 = kYm_ColType_Cupsle
L1_1.Type = L2_2
L1_1.Node0 = "bn_l_thigh"
L1_1.Node1 = "bn_l_thigh"
L2_2 = {
  L3_3,
  L4_4,
  L5_5
}
L3_3 = -0.034
L4_4 = -0.015
L5_5 = 0.02
L1_1.Pos0 = L2_2
L2_2 = {
  L3_3,
  L4_4,
  L5_5
}
L3_3 = -0.07
L4_4 = -0.032
L5_5 = 0.352999
L1_1.Pos1 = L2_2
L1_1.Rad = 0.13
L2_2 = {}
L3_3 = kYm_ColType_Cupsle
L2_2.Type = L3_3
L2_2.Node0 = "bn_l_thigh"
L2_2.Node1 = "bn_l_leg"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = -0.042
L5_5 = -0.019
L6_6 = 0.088
L2_2.Pos0 = L3_3
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = -0.046
L5_5 = -0.038
L6_6 = 0.199
L2_2.Pos1 = L3_3
L2_2.Rad = 0.13
L3_3 = {}
L4_4 = kYm_ColType_Cupsle
L3_3.Type = L4_4
L3_3.Node0 = "bn_l_thigh"
L3_3.Node1 = "bn_l_leg"
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = -0.07
L6_6 = -0.032
L7_7 = 0.352999
L3_3.Pos0 = L4_4
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = 0
L6_6 = 0
L7_7 = 0.56
L3_3.Pos1 = L4_4
L3_3.Rad = 0.13
L4_4 = {}
L5_5 = kYm_ColType_Cupsle
L4_4.Type = L5_5
L4_4.Node0 = "bn_r_thigh"
L4_4.Node1 = "bn_r_thigh"
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = 0.034
L7_7 = -0.015
L8_8 = 0.02
L4_4.Pos0 = L5_5
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = 0.07
L7_7 = -0.032
L8_8 = 0.352999
L4_4.Pos1 = L5_5
L4_4.Rad = 0.13
L5_5 = {}
L6_6 = kYm_ColType_Cupsle
L5_5.Type = L6_6
L5_5.Node0 = "bn_r_thigh"
L5_5.Node1 = "bn_r_leg"
L6_6 = {
  L7_7,
  L8_8,
  0.088
}
L7_7 = 0.042
L8_8 = -0.019
L5_5.Pos0 = L6_6
L6_6 = {
  L7_7,
  L8_8,
  0.199
}
L7_7 = 0.046
L8_8 = -0.038
L5_5.Pos1 = L6_6
L5_5.Rad = 0.13
L6_6 = {}
L7_7 = kYm_ColType_Cupsle
L6_6.Type = L7_7
L6_6.Node0 = "bn_r_thigh"
L6_6.Node1 = "bn_r_leg"
L7_7 = {
  L8_8,
  -0.032,
  0.352999
}
L8_8 = 0.07
L6_6.Pos0 = L7_7
L7_7 = {
  L8_8,
  0,
  0.56
}
L8_8 = 0
L6_6.Pos1 = L7_7
L6_6.Rad = 0.13
Col_forSkirt = L0_0
SkirtAnimR0 = 1
SkirtAnimR1 = 0.1
SkirtAnimR2 = 0.1
SkirtAnimR3 = 0.01
L0_0 = 0.3
L1_1 = 0.2
L2_2 = 1
L3_3 = 0.3
L4_4 = true
L5_5 = 1
L6_6 = 1
L7_7 = {
  L8_8,
  {
    Spd = 0,
    SpdAir = 2.1,
    Pow = 0,
    PowAir = 1
  }
}
L8_8 = {}
L8_8.Spd = 0
L8_8.SpdAir = -1
L8_8.Pow = 0
L8_8.PowAir = 1
L8_8 = {
  {
    Spd = 0,
    SpdAir = 6.6E-4,
    Pow = 0,
    PowAir = 0.2
  },
  {
    Spd = 0,
    SpdAir = 6.000000000000001E-4,
    Pow = 0,
    PowAir = 0.2
  }
}
L8_8.TrgNode = 2
Ym_Kit04 = {
  Dbg_DispUserChannel = {
    "ym_ir__master_value",
    "ym_ir__master_rate",
    "ym_ir_all",
    "ym_ir_hair",
    "ym_ir_deco"
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forScarf,
    CalLoopNum = 3,
    IsFitLen = true,
    IsAntiCross = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.15,
    GrvRate = 1,
    AirRegV = L0_0,
    AirRegP = L1_1,
    AnimRate = 0,
    ColRad = 0,
    VibParamL = L8_8,
    VibParamR = L8_8,
    {
      "bn_l_scarf00_k04",
      Width = 0.06
    },
    {
      "bn_l_scarf01_k04",
      Width = 0.07,
      AnimRate = 1
    },
    {
      "bn_l_scarf02_k04",
      AnimRate = 0.07
    },
    {
      "bn_l_scarf03_k04"
    },
    {
      "bn_l_scarf04_k04"
    },
    {
      "bn_l_scarf05_k04"
    },
    {
      "bn_l_scarf06_k04"
    },
    {
      "bn_l_scarf07_k04"
    },
    {
      "bn_l_scarf08_k04"
    },
    {
      "bn_l_scarf09_k04"
    },
    {
      "bn_l_scarf10_k04"
    },
    {
      "bn_l_scarf11_k04"
    },
    {
      "bn_l_scarf12_k04"
    },
    {
      "bn_l_scarf13_k04",
      ColRad = 0.01
    },
    {
      "bn_l_scarf14_k04",
      ColRad = 0.01
    },
    {
      "bn_l_scarf15_k04",
      Width = 0.07
    },
    {
      "dm_l_scarf16_k04",
      Width = 0.01
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forScarf,
    CalLoopNum = 3,
    IsFitLen = true,
    IsAntiCross = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.15,
    GrvRate = 1,
    AirRegV = L0_0,
    AirRegP = L1_1,
    AnimRate = 0,
    ColRad = 0,
    VibParamL = L8_8,
    VibParamR = L8_8,
    {
      "bn_r_scarf00_k04",
      Width = 0.06
    },
    {
      "bn_r_scarf01_k04",
      Width = 0.07,
      AnimRate = 1
    },
    {
      "bn_r_scarf02_k04",
      AnimRate = 0.07
    },
    {
      "bn_r_scarf03_k04"
    },
    {
      "bn_r_scarf04_k04"
    },
    {
      "bn_r_scarf05_k04"
    },
    {
      "bn_r_scarf06_k04"
    },
    {
      "bn_r_scarf07_k04"
    },
    {
      "bn_r_scarf08_k04"
    },
    {
      "bn_r_scarf09_k04"
    },
    {
      "bn_r_scarf10_k04"
    },
    {
      "bn_r_scarf11_k04"
    },
    {
      "bn_r_scarf12_k04"
    },
    {
      "bn_r_scarf13_k04",
      ColRad = 0.01
    },
    {
      "bn_r_scarf14_k04",
      ColRad = 0.01
    },
    {
      "bn_r_scarf15_k04",
      Width = 0.07
    },
    {
      "dm_r_scarf16_k04",
      Width = 0.01
    }
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    IsFitLen = L4_4,
    BeneChijimi = L5_5,
    BeneNobi = L6_6,
    GrvRate = L2_2,
    AirReg = L3_3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hair_a0_k04"
    },
    {
      "bn_r_fr_hair_a1_k04"
    },
    {
      "bn_r_fr_hair_a2_k04"
    },
    {
      "bn_r_fr_hair_a3_k04"
    },
    {
      "bn_r_fr_hair_a4_k04"
    },
    {
      "bn_r_fr_hair_a5_k04"
    },
    {
      "dm_r_fr_hair_a6_k04"
    },
    AirBottom = 0.02,
    VibParam = L7_7
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    IsFitLen = L4_4,
    BeneChijimi = L5_5,
    BeneNobi = L6_6,
    GrvRate = L2_2,
    AirReg = L3_3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hair_b0_k04"
    },
    {
      "bn_r_fr_hair_b1_k04"
    },
    {
      "bn_r_fr_hair_b2_k04"
    },
    {
      "bn_r_fr_hair_b3_k04"
    },
    {
      "dm_r_fr_hair_b4_k04"
    },
    AirBottom = 0.02,
    VibParam = L7_7
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    IsFitLen = L4_4,
    BeneChijimi = L5_5,
    BeneNobi = L6_6,
    GrvRate = L2_2,
    AirReg = L3_3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hair_a0_k04"
    },
    {
      "bn_l_fr_hair_a1_k04"
    },
    {
      "bn_l_fr_hair_a2_k04"
    },
    {
      "bn_l_fr_hair_a3_k04"
    },
    {
      "bn_l_fr_hair_a4_k04"
    },
    {
      "bn_l_fr_hair_a5_k04"
    },
    {
      "dm_l_fr_hair_a6_k04"
    },
    AirBottom = 0.02,
    VibParam = L7_7
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    IsFitLen = L4_4,
    BeneChijimi = L5_5,
    BeneNobi = L6_6,
    GrvRate = L2_2,
    AirReg = L3_3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hair_b0_k04"
    },
    {
      "bn_l_fr_hair_b1_k04"
    },
    {
      "bn_l_fr_hair_b2_k04"
    },
    {
      "bn_l_fr_hair_b3_k04"
    },
    {
      "dm_l_fr_hair_b4_k04"
    },
    AirBottom = 0.02,
    VibParam = L7_7
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_forSkirt,
    IsTube = true,
    IsOrthoAx = false,
    CalLoopNum = 8,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.5,
    ColPowXHalf = 0.8,
    ColPowCHalf = 0.8,
    ColPowZHalf = 0.8,
    IsLastCol = true,
    GrvRate = 0.5,
    AirRegV = 0.7,
    AirRegP = 0.1,
    AnimRate = 0.05,
    ColRad = 0,
    StraightPowZ = 0.1,
    {
      {
        "bn_l_skirt_a0_k04"
      },
      {
        "bn_l_skirt_a1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5,
        AnimRateIn = 0.2
      },
      {
        "bn_l_skirt_a2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_l_skirt_a3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_l_skirt_a4_k04",
        AnimRate = SkirtAnimR3
      }
    },
    {
      {
        "bn_l_skirt_b0_k04"
      },
      {
        "bn_l_skirt_b1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5,
        AnimRateIn = 0.1
      },
      {
        "bn_l_skirt_b2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_l_skirt_b3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_l_skirt_b4_k04",
        AnimRate = SkirtAnimR3
      }
    },
    {
      {
        "bn_l_skirt_c0_k04"
      },
      {
        "bn_l_skirt_c1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5
      },
      {
        "bn_l_skirt_c2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_l_skirt_c3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_l_skirt_c4_k04",
        AnimRate = SkirtAnimR3
      }
    },
    {
      {
        "bn_l_skirt_d0_k04"
      },
      {
        "bn_l_skirt_d1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5
      },
      {
        "bn_l_skirt_d2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_l_skirt_d3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_l_skirt_d4_k04",
        AnimRate = SkirtAnimR3
      }
    },
    {
      {
        "bn_r_skirt_d0_k04"
      },
      {
        "bn_r_skirt_d1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5
      },
      {
        "bn_r_skirt_d2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_r_skirt_d3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_r_skirt_d4_k04",
        AnimRate = SkirtAnimR3
      }
    },
    {
      {
        "bn_r_skirt_c0_k04"
      },
      {
        "bn_r_skirt_c1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5
      },
      {
        "bn_r_skirt_c2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_r_skirt_c3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_r_skirt_c4_k04",
        AnimRate = SkirtAnimR3
      }
    },
    {
      {
        "bn_r_skirt_b0_k04"
      },
      {
        "bn_r_skirt_b1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5,
        AnimRateIn = 0.1
      },
      {
        "bn_r_skirt_b2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_r_skirt_b3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_r_skirt_b4_k04",
        AnimRate = SkirtAnimR3
      }
    },
    {
      {
        "bn_r_skirt_a0_k04"
      },
      {
        "bn_r_skirt_a1_k04",
        AnimRate = SkirtAnimR0,
        StraightPowZ = 0.5,
        AnimRateIn = 0.2
      },
      {
        "bn_r_skirt_a2_k04",
        AnimRate = SkirtAnimR1
      },
      {
        "bn_r_skirt_a3_k04",
        AnimRate = SkirtAnimR2
      },
      {
        "dm_r_skirt_a4_k04",
        AnimRate = SkirtAnimR3
      }
    }
  }
}
