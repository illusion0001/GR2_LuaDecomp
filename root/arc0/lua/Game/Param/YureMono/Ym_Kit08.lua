local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
L0_0 = {
  L1_1,
  L2_2,
  L3_3,
  L4_4
}
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
  0,
  0.07
}
L6_6 = -0.03
L4_4.Pos0 = L5_5
L4_4.Node1 = "bn_l_clavicle"
L5_5 = {
  L6_6,
  0,
  0.07
}
L6_6 = 0.03
L4_4.Pos1 = L5_5
L4_4.Rad = 0.08
Ym_Kit08_Col_HairBack = L0_0
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
Ym_Kit08_Col_HairFront = L0_0
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
    SpdAir = 0.11,
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
Ym_Kit08 = {
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
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Kit08_Col_HairBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_hair_center0_k08"
    },
    {
      "bn_hair_center1_k08",
      AnimRate = 1,
      ColRad = 0.03,
      AirReg = 0.5
    },
    {
      "bn_hair_center2_k08",
      AnimRate = 0.5,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_hair_center3_k08",
      AnimRate = 0.2
    },
    {
      "bn_hair_center4_k08",
      AnimRate = 0.1
    },
    {
      "bn_hair_center5_k08"
    },
    {
      "bn_hair_center6_k08"
    },
    {
      "dm_hair_center_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_top0_k08"
    },
    {
      "bn_l_hair_top1_k08",
      AnimRate = 1,
      ColRad = 0.035,
      AirReg = 0.5
    },
    {
      "bn_l_hair_top2_k08",
      AnimRate = 0.5,
      ColRad = 0.045,
      AirReg = 0.5
    },
    {
      "bn_l_hair_top3_k08",
      ColRad = 0.025
    },
    {
      "bn_l_hair_top4_k08"
    },
    {
      "bn_l_hair_top5_k08"
    },
    {
      "dm_l_hair_top_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_top0_k08"
    },
    {
      "bn_r_hair_top1_k08",
      AnimRate = 1,
      ColRad = 0.055,
      AirReg = 0.5
    },
    {
      "bn_r_hair_top2_k08",
      AnimRate = 0.7,
      ColRad = 0.05,
      AirReg = 0.5
    },
    {
      "bn_r_hair_top3_k08",
      ColRad = 0.04
    },
    {
      "bn_r_hair_top4_k08"
    },
    {
      "bn_r_hair_top5_k08"
    },
    {
      "dm_r_hair_top_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_back0_k08"
    },
    {
      "bn_l_hair_back1_k08",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_back2_k08",
      AnimRate = 0.5,
      AirReg = 0.5
    },
    {
      "bn_l_hair_back3_k08"
    },
    {
      "bn_l_hair_back4_k08"
    },
    {
      "bn_l_hair_back5_k08"
    },
    {
      "dm_l_hair_back_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_back0_k08"
    },
    {
      "bn_r_hair_back1_k08",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_back2_k08",
      AnimRate = 0.5,
      AirReg = 0.5
    },
    {
      "bn_r_hair_back3_k08"
    },
    {
      "bn_r_hair_back4_k08"
    },
    {
      "bn_r_hair_back5_k08"
    },
    {
      "dm_r_hair_back_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_side0_k08"
    },
    {
      "bn_l_hair_side1_k08",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_side2_k08",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_side3_k08"
    },
    {
      "bn_l_hair_side4_k08"
    },
    {
      "bn_l_hair_side5_k08"
    },
    {
      "dm_l_hair_side_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_side0_k08"
    },
    {
      "bn_r_hair_side1_k08",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_side2_k08",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_side3_k08"
    },
    {
      "bn_r_hair_side4_k08"
    },
    {
      "bn_r_hair_side5_k08"
    },
    {
      "dm_r_hair_side_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_bottom0_k08"
    },
    {
      "bn_r_hair_bottom1_k08",
      AnimRate = 1
    },
    {
      "bn_r_hair_bottom2_k08"
    },
    {
      "bn_r_hair_bottom3_k08"
    },
    {
      "bn_r_hair_bottom4_k08"
    },
    {
      "bn_r_hair_bottom5_k08"
    },
    {
      "dm_r_hair_bottom_k08"
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
    Collision = Ym_Kit08_Col_HairBack,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_bottom0_k08"
    },
    {
      "bn_l_hair_bottom1_k08",
      AnimRate = 1
    },
    {
      "bn_l_hair_bottom2_k08"
    },
    {
      "bn_l_hair_bottom3_k08"
    },
    {
      "bn_l_hair_bottom4_k08"
    },
    {
      "bn_l_hair_bottom5_k08"
    },
    {
      "dm_l_hair_bottom_k08"
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
    Collision = Ym_Kit08_Col_HairFront,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hairA0_k08"
    },
    {
      "bn_l_fr_hairA1_k08",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairA2_k08"
    },
    {
      "bn_l_fr_hairA3_k08"
    },
    {
      "bn_l_fr_hairA4_k08"
    },
    {
      "dm_l_fr_hairA_k08"
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
    Collision = Ym_Kit08_Col_HairFront,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hairA0_k08"
    },
    {
      "bn_r_fr_hairA1_k08",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairA2_k08"
    },
    {
      "bn_r_fr_hairA3_k08"
    },
    {
      "bn_r_fr_hairA4_k08"
    },
    {
      "dm_r_fr_hairA_k08"
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
    Collision = Ym_Kit08_Col_HairFront,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hairB0_k08"
    },
    {
      "bn_l_fr_hairB1_k08",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairB2_k08"
    },
    {
      "bn_l_fr_hairB3_k08"
    },
    {
      "dm_l_fr_hairB_k08"
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
    Collision = Ym_Kit08_Col_HairFront,
    IsFitLen = L2_2,
    BeneChijimi = L3_3,
    BeneNobi = L4_4,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hairB0_k08"
    },
    {
      "bn_r_fr_hairB1_k08",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairB2_k08"
    },
    {
      "bn_r_fr_hairB3_k08"
    },
    {
      "dm_r_fr_hairB_k08"
    },
    AirBottom = 0.02,
    VibParam = L5_5
  }
}
