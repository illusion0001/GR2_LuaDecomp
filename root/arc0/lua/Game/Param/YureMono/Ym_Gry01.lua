L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head_end_gr01",
    Pos = {
      0,
      0,
      0
    },
    Rad = 0.1
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_neck_gr01",
    Node1 = "bn_neck_gr01",
    Pos0 = {
      0,
      -0.037,
      0.028
    },
    Pos1 = {
      0,
      0,
      0.01
    },
    Rad = 0.073
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine0_gr01",
    Pos = {
      0,
      -0.035,
      0.005
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle_gr01",
    Pos0 = {
      -0.03,
      0,
      0.07
    },
    Node1 = "bn_l_clavicle_gr01",
    Pos1 = {
      0.03,
      0,
      0.07
    },
    Rad = 0.08
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine02",
    Pos = {
      0,
      0.11,
      0.655
    },
    Rad = 0.3
  }
}
Ym_Gry01_Col_HairBack = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head_gr01",
    Pos = {
      0,
      0.06,
      0.03
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck_gr01",
    Pos = {
      0,
      -0.01,
      -0.035
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck_gr01",
    Pos = {
      0,
      -0.035,
      0.04
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head_gr01",
    Pos0 = {
      0,
      0.03,
      0.09
    },
    Node1 = "bn_jaw",
    Pos1 = {
      0,
      0.03,
      0
    },
    Rad = 0.06
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle_gr01",
    Pos0 = {
      -0.04,
      0.01,
      0.07
    },
    Node1 = "bn_l_clavicle_gr01",
    Pos1 = {
      0.03,
      0.01,
      0.07
    },
    Rad = 0.08
  }
}
L0_0.Dbg_IsDisp = true
Ym_Gry01_Col_HairFrontF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head_gr01",
    Pos = {
      0,
      0.06,
      0.03
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck_gr01",
    Pos = {
      0,
      -0.01,
      -0.035
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck_gr01",
    Pos = {
      0,
      -0.035,
      0.04
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head_gr01",
    Pos0 = {
      0,
      0.03,
      0.09
    },
    Node1 = "bn_jaw",
    Pos1 = {
      0,
      0.03,
      0
    },
    Rad = 0.06
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle_gr01",
    Pos0 = {
      -0.04,
      0.01,
      0.07
    },
    Node1 = "bn_l_clavicle_gr01",
    Pos1 = {
      0.03,
      0.01,
      0.07
    },
    Rad = 0.08
  }
}
Ym_Gry01_Col_HairFront = L0_0
L0_0 = 0.5
Ym_Gry01 = {
  {
    Type = kYm_Type_KitHair,
    InvalidRateGp = {
      "ym_ir_hair_b",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Gry01_Col_HairBack,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_hair_center0_gr01"
    },
    {
      "bn_hair_center1_gr01",
      AnimRate = 1,
      ColRad = 0.03,
      AirReg = 0.5
    },
    {
      "bn_hair_center2_gr01",
      AnimRate = 0.5,
      ColRad = 0.025,
      AirReg = 0.5
    },
    {
      "bn_hair_center3_gr01",
      AnimRate = 0.2
    },
    {
      "bn_hair_center4_gr01",
      AnimRate = 0.1
    },
    {
      "bn_hair_center5_gr01"
    },
    {
      "bn_hair_center6_gr01"
    },
    {
      "dm_hair_center_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_top0_gr01"
    },
    {
      "bn_l_hair_top1_gr01",
      AnimRate = 1,
      ColRad = 0.035,
      AirReg = 0.5
    },
    {
      "bn_l_hair_top2_gr01",
      AnimRate = 0.5,
      ColRad = 0.045,
      AirReg = 0.5
    },
    {
      "bn_l_hair_top3_gr01",
      ColRad = 0.025
    },
    {
      "bn_l_hair_top4_gr01"
    },
    {
      "bn_l_hair_top5_gr01"
    },
    {
      "dm_l_hair_top_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_top0_gr01"
    },
    {
      "bn_r_hair_top1_gr01",
      AnimRate = 1,
      ColRad = 0.055,
      AirReg = 0.5
    },
    {
      "bn_r_hair_top2_gr01",
      AnimRate = 0.7,
      ColRad = 0.05,
      AirReg = 0.5
    },
    {
      "bn_r_hair_top3_gr01",
      ColRad = 0.04
    },
    {
      "bn_r_hair_top4_gr01"
    },
    {
      "bn_r_hair_top5_gr01"
    },
    {
      "dm_r_hair_top_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_back0_gr01"
    },
    {
      "bn_l_hair_back1_gr01",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_back2_gr01",
      AnimRate = 0.5,
      AirReg = 0.5
    },
    {
      "bn_l_hair_back3_gr01"
    },
    {
      "bn_l_hair_back4_gr01"
    },
    {
      "bn_l_hair_back5_gr01"
    },
    {
      "dm_l_hair_back_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_back0_gr01"
    },
    {
      "bn_r_hair_back1_gr01",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_back2_gr01",
      AnimRate = 0.5,
      AirReg = 0.5
    },
    {
      "bn_r_hair_back3_gr01"
    },
    {
      "bn_r_hair_back4_gr01"
    },
    {
      "bn_r_hair_back5_gr01"
    },
    {
      "dm_r_hair_back_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_side0_gr01"
    },
    {
      "bn_l_hair_side1_gr01",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_side2_gr01",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_l_hair_side3_gr01"
    },
    {
      "bn_l_hair_side4_gr01"
    },
    {
      "bn_l_hair_side5_gr01"
    },
    {
      "dm_l_hair_side_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_side0_gr01"
    },
    {
      "bn_r_hair_side1_gr01",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_side2_gr01",
      AnimRate = 1,
      AirReg = 0.5
    },
    {
      "bn_r_hair_side3_gr01"
    },
    {
      "bn_r_hair_side4_gr01"
    },
    {
      "bn_r_hair_side5_gr01"
    },
    {
      "dm_r_hair_side_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_hair_bottom0_gr01"
    },
    {
      "bn_r_hair_bottom1_gr01",
      AnimRate = 1
    },
    {
      "bn_r_hair_bottom2_gr01"
    },
    {
      "bn_r_hair_bottom3_gr01"
    },
    {
      "bn_r_hair_bottom4_gr01"
    },
    {
      "bn_r_hair_bottom5_gr01"
    },
    {
      "dm_r_hair_bottom_gr01"
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
    Collision = Ym_Gry01_Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_hair_bottom0_gr01"
    },
    {
      "bn_l_hair_bottom1_gr01",
      AnimRate = 1
    },
    {
      "bn_l_hair_bottom2_gr01"
    },
    {
      "bn_l_hair_bottom3_gr01"
    },
    {
      "bn_l_hair_bottom4_gr01"
    },
    {
      "bn_l_hair_bottom5_gr01"
    },
    {
      "dm_l_hair_bottom_gr01"
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
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    CalLoopNum = 6,
    IsAnimPowerful = true,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Gry01_Col_HairFrontF,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = L0_0,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hairA0_gr01"
    },
    {
      "bn_l_fr_hairA1_gr01",
      StraightPow = 0.3,
      BaneSkip = 0.5,
      AnimRate = 0.4,
      LimRad = 0.03
    },
    {
      "bn_l_fr_hairA2_gr01",
      StraightPow = 0.065,
      BaneSkip = 0.375,
      AnimRate = 0.015
    },
    {
      "bn_l_fr_hairA3_gr01",
      StraightPow = 0.05,
      BaneSkip = 0.27
    },
    {
      "bn_l_fr_hairA4_gr01",
      StraightPow = 0,
      BaneSkip = 0.17
    },
    {
      "dm_l_fr_hairA_gr01"
    },
    AirBottom = 0.02,
    VibParam = {
      StdLen = 0.4,
      {
        Spd = 0,
        SpdAir = -1.5,
        Pow = 0,
        PowAir = 3
      },
      {
        Spd = 0,
        SpdAir = 3.1500000000000004,
        Pow = 0,
        PowAir = 3
      }
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    CalLoopNum = 6,
    IsAnimPowerful = true,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Gry01_Col_HairFrontF,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = L0_0,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hairA0_gr01"
    },
    {
      "bn_r_fr_hairA1_gr01",
      StraightPow = 0.3,
      BaneSkip = 0.5,
      AnimRate = 0.4,
      LimRad = 0.03
    },
    {
      "bn_r_fr_hairA2_gr01",
      StraightPow = 0.065,
      BaneSkip = 0.375,
      AnimRate = 0.015
    },
    {
      "bn_r_fr_hairA3_gr01",
      StraightPow = 0.05,
      BaneSkip = 0.27
    },
    {
      "bn_r_fr_hairA4_gr01",
      StraightPow = 0,
      BaneSkip = 0.17
    },
    {
      "dm_r_fr_hairA_gr01"
    },
    AirBottom = 0.02,
    VibParam = {
      StdLen = 0.4,
      {
        Spd = 0,
        SpdAir = -1.5,
        Pow = 0,
        PowAir = 3
      },
      {
        Spd = 0,
        SpdAir = 3.1500000000000004,
        Pow = 0,
        PowAir = 3
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = 6,
    IsAnimPowerful = true,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Gry01_Col_HairFront,
    BeneChijimi = 1,
    BeneNobi = 1,
    IsAnimPowerful = true,
    GrvRate = L0_0,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_l_fr_hairB0_gr01"
    },
    {
      "bn_l_fr_hairB1_gr01",
      StraightPow = 0.14,
      BaneSkip = 0.105,
      AnimRate = 0.165
    },
    {
      "bn_l_fr_hairB2_gr01",
      StraightPow = 0,
      BaneSkip = 0.09,
      AnimRate = 0
    },
    {
      "bn_l_fr_hairB3_gr01"
    },
    {
      "dm_l_fr_hairB_gr01"
    },
    AirBottom = 0.02,
    VibParam = {
      StdLen = 0.4,
      {
        Spd = 0,
        SpdAir = -1.5,
        Pow = 0,
        PowAir = 3
      },
      {
        Spd = 0,
        SpdAir = 3.1500000000000004,
        Pow = 0,
        PowAir = 3
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = 6,
    IsAnimPowerful = true,
    InvalidRateGp = {
      "ym_ir_hair_f",
      "ym_ir_hair",
      "ym_ir_all"
    },
    Collision = Ym_Gry01_Col_HairFront,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = L0_0,
    AirReg = 0.3,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_r_fr_hairB0_gr01"
    },
    {
      "bn_r_fr_hairB1_gr01",
      StraightPow = 0.14,
      BaneSkip = 0.105,
      AnimRate = 0.165
    },
    {
      "bn_r_fr_hairB2_gr01",
      StraightPow = 0,
      BaneSkip = 0.09,
      AnimRate = 0
    },
    {
      "bn_r_fr_hairB3_gr01"
    },
    {
      "dm_r_fr_hairB_gr01"
    },
    AirBottom = 0.02,
    VibParam = {
      StdLen = 0.4,
      {
        Spd = 0,
        SpdAir = -1.5,
        Pow = 0,
        PowAir = 3
      },
      {
        Spd = 0,
        SpdAir = 3.1500000000000004,
        Pow = 0,
        PowAir = 3
      }
    }
  }
}
