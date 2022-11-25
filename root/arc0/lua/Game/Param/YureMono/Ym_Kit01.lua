local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
L0_0 = {
  L1_1,
  L2_2,
  L3_3,
  L4_4,
  L5_5,
  L6_6,
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_arm",
    Pos0 = {
      0.025,
      -0.03,
      0.03
    },
    Node1 = "bn_r_forearm",
    Pos1 = {
      0,
      0,
      0
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_forearm",
    Pos0 = {
      0,
      0,
      0
    },
    Node1 = "bn_r_forearm",
    Pos1 = {
      0,
      0,
      0.24
    },
    Rad = 0.07
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.015,
      0.1,
      0.045
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.025,
      -0.025,
      0.035
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.015,
      0.1,
      0.045
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.025,
      -0.025,
      0.035
    },
    Rad = 0.12
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
  0.09
}
L5_5 = 0.035
L6_6 = -0.02
L3_3.Pos0 = L4_4
L3_3.Node1 = "bn_r_clavicle"
L4_4 = {
  L5_5,
  L6_6,
  0.09
}
L5_5 = -0.035
L6_6 = -0.02
L3_3.Pos1 = L4_4
L3_3.Rad = 0.1
L4_4 = {}
L5_5 = kYm_ColType_Cupsle
L4_4.Type = L5_5
L4_4.Node0 = "bn_spine0"
L5_5 = {
  L6_6,
  -0.05,
  0.15
}
L6_6 = 0
L4_4.Pos0 = L5_5
L4_4.Node1 = "bn_pelvis"
L5_5 = {
  L6_6,
  0,
  0.15
}
L6_6 = 0
L4_4.Pos1 = L5_5
L4_4.Rad = 0.13
L5_5 = {}
L6_6 = kYm_ColType_Cupsle
L5_5.Type = L6_6
L5_5.Node0 = "bn_l_arm"
L6_6 = {
  -0.025,
  -0.03,
  0.03
}
L5_5.Pos0 = L6_6
L5_5.Node1 = "bn_l_forearm"
L6_6 = {
  0,
  0,
  0
}
L5_5.Pos1 = L6_6
L5_5.Rad = 0.1
L6_6 = {}
L6_6.Type = kYm_ColType_Cupsle
L6_6.Node0 = "bn_l_forearm"
L6_6.Pos1 = {
  0,
  0,
  0
}
L6_6.Node1 = "bn_l_forearm"
L6_6.Pos0 = {
  0,
  0,
  0.24
}
L6_6.Rad = 0.1
Ym_Kit01_Col_Scarf = L0_0
L0_0 = {
  L1_1,
  L2_2,
  L3_3,
  L4_4
}
L0_0.Dbg_IsDisp = true
L1_1 = {}
L2_2 = kYm_ColType_Sphere
L1_1.Type = L2_2
L1_1.Node = "bn_head_end"
L2_2 = {
  L3_3,
  L4_4,
  L5_5
}
L3_3 = 0
L4_4 = 0
L5_5 = 0
L1_1.Pos = L2_2
L1_1.Rad = 0.1
L2_2 = {}
L3_3 = kYm_ColType_Sphere
L2_2.Type = L3_3
L2_2.Node = "bn_neck"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0
L5_5 = 0
L6_6 = 0.025
L2_2.Pos = L3_3
L2_2.Rad = 0.08
L3_3 = {}
L4_4 = kYm_ColType_Sphere
L3_3.Type = L4_4
L3_3.Node = "bn_spine3"
L4_4 = {
  L5_5,
  L6_6,
  0.005
}
L5_5 = 0
L6_6 = -0.035
L3_3.Pos = L4_4
L3_3.Rad = 0.13
L4_4 = {}
L5_5 = kYm_ColType_Cupsle
L4_4.Type = L5_5
L4_4.Node0 = "bn_r_clavicle"
L5_5 = {
  L6_6,
  0.005,
  0.06
}
L6_6 = -0.035
L4_4.Pos0 = L5_5
L4_4.Node1 = "bn_l_clavicle"
L5_5 = {
  L6_6,
  0.005,
  0.06
}
L6_6 = 0.035
L4_4.Pos1 = L5_5
L4_4.Rad = 0.09
Ym_Kit01_Col_HairBack = L0_0
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
L2_2.Node = "bn_neck"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0
L5_5 = -0.01
L6_6 = -0.035
L2_2.Pos = L3_3
L2_2.Rad = 0.105
L3_3 = {}
L4_4 = kYm_ColType_Sphere
L3_3.Type = L4_4
L3_3.Node = "bn_neck"
L4_4 = {
  L5_5,
  L6_6,
  0.04
}
L5_5 = 0
L6_6 = -0.035
L3_3.Pos = L4_4
L3_3.Rad = 0.07
L4_4 = {}
L5_5 = kYm_ColType_Cupsle
L4_4.Type = L5_5
L4_4.Node0 = "bn_head"
L5_5 = {
  L6_6,
  0.03,
  0.09
}
L6_6 = 0
L4_4.Pos0 = L5_5
L4_4.Node1 = "bn_jaw"
L5_5 = {
  L6_6,
  0.03,
  0
}
L6_6 = 0
L4_4.Pos1 = L5_5
L4_4.Rad = 0.06
L5_5 = {}
L6_6 = kYm_ColType_Cupsle
L5_5.Type = L6_6
L5_5.Node0 = "bn_r_clavicle"
L6_6 = {
  -0.04,
  0.01,
  0.07
}
L5_5.Pos0 = L6_6
L5_5.Node1 = "bn_l_clavicle"
L6_6 = {
  0.03,
  0.01,
  0.07
}
L5_5.Pos1 = L6_6
L5_5.Rad = 0.08
Ym_Kit01_Col_HairFront = L0_0
L0_0 = 1
L1_1 = 0.3
L2_2 = true
L3_3 = 1
L4_4 = 1
L5_5 = {
  L6_6,
  {
    Spd = 0,
    SpdAir = 2.1,
    Pow = 0,
    PowAir = 1
  }
}
L6_6 = {}
L6_6.Spd = 0
L6_6.SpdAir = -1
L6_6.Pow = 0
L6_6.PowAir = 1
L6_6 = {
  {
    Spd = 0,
    SpdAir = 0.41,
    Pow = 0,
    PowAir = 0.02
  },
  {
    Spd = 0,
    SpdAir = 0.21,
    Pow = 0,
    PowAir = 0.02
  },
  {
    Spd = 0,
    SpdAir = 0.1,
    Pow = 0,
    PowAir = 0.02
  }
}
L6_6.TrgNode = 2
L6_6.AirBottom = 0.001
Ym_Kit01 = {
  Dbg_DispUserChannel = {
    "ym_ir__master_value",
    "ym_ir__master_rate",
    "ym_ir_all",
    "ym_ir_hair",
    "ym_ir_hair_f",
    "ym_ir_hair_b",
    "ym_ir_deco"
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Kit01_Col_Scarf,
    CalLoopNum = 3,
    IsFitLen = true,
    IsAntiCross = true,
    BeneChijimi = 1,
    BeneNobi = 0.3,
    BeneNobiStep = 0.1,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.9,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0,
    BeneHasu = 0.1,
    VibParamL = L6_6,
    VibParamR = L6_6,
    {
      "bn_l_scarf0",
      Width = 0.06
    },
    {
      "bn_l_scarf1",
      Width = 0.07,
      AirRegV = 0.3
    },
    {
      "bn_l_scarf2",
      Width = 0.1,
      AirRegV = 0.3
    },
    {
      "bn_l_scarf3",
      Width = 0.1
    },
    {
      "bn_l_scarf4",
      Width = 0.1,
      ColRad = 0.01
    },
    {
      "bn_l_scarf5",
      Width = 0.1,
      ColRad = 0.01
    },
    {
      "bn_l_scarf6",
      Width = 0.07
    },
    {"dm_l_scarf", Width = 0.01}
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Kit01_Col_Scarf,
    CalLoopNum = 3,
    IsFitLen = true,
    IsAntiCross = true,
    BeneChijimi = 1,
    BeneNobi = 0.3,
    BeneNobiStep = 0.1,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.9,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0,
    BeneHasu = 0.1,
    VibParamL = L6_6,
    VibParamR = L6_6,
    {
      "bn_r_scarf0",
      Width = 0.07
    },
    {
      "bn_r_scarf1",
      Width = 0.08,
      AirRegV = 0.3
    },
    {
      "bn_r_scarf2",
      Width = 0.1,
      AirRegV = 0.3
    },
    {
      "bn_r_scarf3",
      Width = 0.1
    },
    {
      "bn_r_scarf4",
      Width = 0.1,
      ColRad = 0.01
    },
    {
      "bn_r_scarf5",
      Width = 0.1,
      ColRad = 0.01
    },
    {
      "bn_r_scarf6",
      Width = 0.07
    },
    {"dm_r_scarf", Width = 0.01}
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_hair_center0"
    },
    {
      "bn_hair_center1",
      AnimRate = 1,
      ColRad = 0.03,
      AirReg = 0.5
    },
    {
      "bn_hair_center2",
      AnimRate = 0.5,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_hair_center3",
      AnimRate = 0.2
    },
    {
      "bn_hair_center4",
      AnimRate = 0.1
    },
    {
      "bn_hair_center5"
    },
    {
      "bn_hair_center6"
    },
    {
      "dm_hair_center"
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
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_top0"
    },
    {
      "bn_l_hair_top1",
      AnimRate = 1,
      ColRad = 0.035,
      AirReg = 0.5
    },
    {
      "bn_l_hair_top2",
      AnimRate = 0.5,
      ColRad = 0.045,
      AirReg = 0.5
    },
    {
      "bn_l_hair_top3",
      ColRad = 0.025
    },
    {
      "bn_l_hair_top4"
    },
    {
      "bn_l_hair_top5"
    },
    {
      "dm_l_hair_top"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_top0"
    },
    {
      "bn_r_hair_top1",
      AnimRate = 1,
      ColRad = 0.055,
      AirReg = 0.5
    },
    {
      "bn_r_hair_top2",
      AnimRate = 0.7,
      ColRad = 0.05,
      AirReg = 0.5
    },
    {
      "bn_r_hair_top3",
      ColRad = 0.04
    },
    {
      "bn_r_hair_top4"
    },
    {
      "bn_r_hair_top5"
    },
    {
      "dm_r_hair_top"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_back0"
    },
    {
      "bn_l_hair_back1",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_back2",
      AnimRate = 0.5,
      AirReg = 0.5
    },
    {
      "bn_l_hair_back3"
    },
    {
      "bn_l_hair_back4"
    },
    {
      "bn_l_hair_back5"
    },
    {
      "dm_l_hair_back"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_back0"
    },
    {
      "bn_r_hair_back1",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_back2",
      AnimRate = 0.5,
      AirReg = 0.5
    },
    {
      "bn_r_hair_back3"
    },
    {
      "bn_r_hair_back4"
    },
    {
      "bn_r_hair_back5"
    },
    {
      "dm_r_hair_back"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_side0"
    },
    {
      "bn_l_hair_side1",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_side2",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_side3"
    },
    {
      "bn_l_hair_side4"
    },
    {
      "bn_l_hair_side5"
    },
    {
      "dm_l_hair_side"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_side0"
    },
    {
      "bn_r_hair_side1",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_side2",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_side3"
    },
    {
      "bn_r_hair_side4"
    },
    {
      "bn_r_hair_side5"
    },
    {
      "dm_r_hair_side"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_bottom0"
    },
    {
      "bn_r_hair_bottom1",
      AnimRate = 1
    },
    {
      "bn_r_hair_bottom2"
    },
    {
      "bn_r_hair_bottom3"
    },
    {
      "bn_r_hair_bottom4"
    },
    {
      "bn_r_hair_bottom5"
    },
    {
      "dm_r_hair_bottom"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_bottom0"
    },
    {
      "bn_l_hair_bottom1",
      AnimRate = 1
    },
    {
      "bn_l_hair_bottom2"
    },
    {
      "bn_l_hair_bottom3"
    },
    {
      "bn_l_hair_bottom4"
    },
    {
      "bn_l_hair_bottom5"
    },
    {
      "dm_l_hair_bottom"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairFront,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hairA0"
    },
    {
      "bn_l_fr_hairA1",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairA2"
    },
    {
      "bn_l_fr_hairA3"
    },
    {
      "bn_l_fr_hairA4"
    },
    {
      "dm_l_fr_hairA"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairFront,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hairA0"
    },
    {
      "bn_r_fr_hairA1",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairA2"
    },
    {
      "bn_r_fr_hairA3"
    },
    {
      "bn_r_fr_hairA4"
    },
    {
      "dm_r_fr_hairA"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairFront,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hairB0"
    },
    {
      "bn_l_fr_hairB1",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairB2"
    },
    {
      "bn_l_fr_hairB3"
    },
    {
      "dm_l_fr_hairB"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  },
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit01_Col_HairFront,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hairB0"
    },
    {
      "bn_r_fr_hairB1",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairB2"
    },
    {
      "bn_r_fr_hairB3"
    },
    {
      "dm_r_fr_hairB"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  }
}
