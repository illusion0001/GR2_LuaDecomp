L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_jaw",
    Pos = {
      0,
      0.02,
      -0.06
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Node1 = "bn_l_arm",
    Pos0 = {
      0.015,
      0,
      0.075
    },
    Pos1 = {
      0,
      -0.05,
      0.015
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine3",
    Node1 = "bn_r_arm",
    Pos0 = {
      -0.015,
      0,
      0.075
    },
    Pos1 = {
      0,
      -0.05,
      0.015
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Pos0 = {
      0,
      -0.05,
      0.15
    },
    Node1 = "bn_pelvis",
    Pos1 = {
      0,
      0,
      0.15
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_belt0_dkb",
    Pos = {
      0,
      -0.015,
      -0.03
    },
    Rad = 0.145
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_belt0_dkb",
    Pos = {
      0.04,
      -0.015,
      -0.03
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_belt0_dkb",
    Pos = {
      -0.04,
      -0.015,
      -0.03
    },
    Rad = 0.12
  }
}
Ym_Cro01_Col_HairBack = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      0.005,
      0.04
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      -0.01,
      0.02
    },
    Rad = 0.06
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.08,
      0.015
    },
    Rad = 0.095
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Pos0 = {
      -0.035,
      -0.01,
      0.09
    },
    Node1 = "bn_l_clavicle",
    Pos1 = {
      0.035,
      -0.01,
      0.09
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_l_fingerC0",
    Pos = {
      0,
      -0.03,
      0
    },
    Rad = 0.07,
    Pow = 0.5
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_r_fingerC0",
    Pos = {
      0,
      -0.03,
      0
    },
    Rad = 0.07,
    Pow = 0.5
  }
}
Ym_Cro01_Col_HairFront = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Pos0 = {
      0,
      -0.05,
      0.15
    },
    Node1 = "bn_pelvis",
    Pos1 = {
      0,
      0,
      0.15
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      -0.045,
      -0.005,
      0
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.055,
      -0.025,
      0.35
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Pos0 = {
      0.045,
      -0.005,
      0
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.055,
      -0.025,
      0.35
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_forearm",
    Node1 = "bn_l_forearm",
    Pos0 = {
      0,
      0,
      0
    },
    Pos1 = {
      0,
      0,
      0.175
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_forearm",
    Node1 = "bn_r_forearm",
    Pos0 = {
      0,
      0,
      0
    },
    Pos1 = {
      0,
      0,
      0.175
    },
    Rad = 0.065
  }
}
Ym_Cro01_Col_Scarf = L0_0
L0_0 = kYm_Type_Himo
Ym_Cro01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Cro01_Col_Scarf,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    {
      "bn_l_sleeve0",
      Width = 0.12
    },
    {
      "bn_l_sleeve1",
      Width = 0.11,
      ColRad = 0.045,
      AnimRate = 0.16
    },
    {
      "bn_l_sleeve2",
      Width = 0.1,
      ColRad = 0.015
    },
    {
      "bn_l_sleeve3",
      Width = 0.04,
      ColRad = 0.01
    },
    {
      "bn_l_sleeve4",
      Width = 0.02,
      ColRad = 0.005
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Cro01_Col_Scarf,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    {
      "bn_r_sleeve0",
      Width = 0.12
    },
    {
      "bn_r_sleeve1",
      Width = 0.11,
      ColRad = 0.045,
      AnimRate = 0.16
    },
    {
      "bn_r_sleeve2",
      Width = 0.1,
      ColRad = 0.015
    },
    {
      "bn_r_sleeve3",
      Width = 0.04,
      ColRad = 0.01
    },
    {
      "bn_r_sleeve4",
      Width = 0.02,
      ColRad = 0.005
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cro01_Col_HairFront,
    VibParam = {
      TrgNode = 2,
      StdLen = 0.7,
      {
        Spd = 0,
        SpdAir = -0.31,
        Pow = 0,
        PowAir = 0.23
      },
      {
        Spd = 0,
        SpdAir = 0.9,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = -1.01,
        Pow = 0,
        PowAir = 0.25
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.02,
    {
      "bn_l_sd_hair0_c01"
    },
    {
      "bn_l_sd_hair1_c01"
    },
    {
      "bn_l_sd_hair2_c01"
    },
    {
      "bn_l_sd_hair3_c01"
    },
    {
      "bn_l_sd_hair4_c01"
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Dbg_IsDispBody = true,
    Collision = Ym_Cro01_Col_HairBack,
    VibParam = {
      TrgNode = 2,
      StdLen = 0.7,
      {
        Spd = 0,
        SpdAir = -0.31,
        Pow = 0,
        PowAir = 0.23
      },
      {
        Spd = 0,
        SpdAir = 0.9,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = -1.01,
        Pow = 0,
        PowAir = 0.25
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.02,
    {
      "bn_l_bt_hair0_c01"
    },
    {
      "bn_l_bt_hair1_c01",
      AnimRate = 0.3
    },
    {
      "bn_l_bt_hair2_c01",
      ColRad = 0.04
    },
    {
      "bn_l_bt_hair3_c01",
      ColRad = 0.04
    },
    {
      "bn_l_bt_hair4_c01",
      ColRad = 0.035
    },
    {
      "bn_l_bt_hair5_c01",
      ColRad = 0.02
    },
    {
      "bn_l_bt_hair6_c01",
      ColRad = 0.01
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Dbg_IsDispBody = true,
    Collision = Ym_Cro01_Col_HairBack,
    VibParam = {
      TrgNode = 2,
      StdLen = 0.7,
      {
        Spd = 0,
        SpdAir = -0.31,
        Pow = 0,
        PowAir = 0.23
      },
      {
        Spd = 0,
        SpdAir = 0.9,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = -1.01,
        Pow = 0,
        PowAir = 0.25
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.02,
    {
      "bn_l_bk_hair0_c01"
    },
    {
      "bn_l_bk_hair1_c01",
      AnimRate = 0.3
    },
    {
      "bn_l_bk_hair2_c01",
      ColRad = 0.035
    },
    {
      "bn_l_bk_hair3_c01",
      ColRad = 0.035
    },
    {
      "bn_l_bk_hair4_c01",
      ColRad = 0.025
    },
    {
      "bn_l_bk_hair5_c01",
      ColRad = 0.02
    },
    {
      "bn_l_bk_hair6_c01",
      ColRad = 0.02
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Dbg_IsDispBody = true,
    Collision = Ym_Cro01_Col_HairBack,
    VibParam = {
      TrgNode = 2,
      StdLen = 0.7,
      {
        Spd = 0,
        SpdAir = -0.31,
        Pow = 0,
        PowAir = 0.23
      },
      {
        Spd = 0,
        SpdAir = 0.9,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = -1.01,
        Pow = 0,
        PowAir = 0.25
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.02,
    {
      "bn_center_hair0_c01"
    },
    {
      "bn_center_hair1_c01",
      AnimRate = 0.3
    },
    {
      "bn_center_hair2_c01",
      ColRad = 0.065
    },
    {
      "bn_center_hair3_c01",
      ColRad = 0.065
    },
    {
      "bn_center_hair4_c01",
      ColRad = 0.05
    },
    {
      "bn_center_hair5_c01",
      ColRad = 0.03
    },
    {
      "bn_center_hair6_c01",
      ColRad = 0.015
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Dbg_IsDispBody = true,
    Collision = Ym_Cro01_Col_HairBack,
    VibParam = {
      TrgNode = 2,
      StdLen = 0.7,
      {
        Spd = 0,
        SpdAir = -0.31,
        Pow = 0,
        PowAir = 0.23
      },
      {
        Spd = 0,
        SpdAir = 0.9,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = -1.01,
        Pow = 0,
        PowAir = 0.25
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.02,
    {
      "bn_r_bk_hair0_c01"
    },
    {
      "bn_r_bk_hair1_c01",
      AnimRate = 0.3
    },
    {
      "bn_r_bk_hair2_c01",
      ColRad = 0.035
    },
    {
      "bn_r_bk_hair3_c01",
      ColRad = 0.03
    },
    {
      "bn_r_bk_hair4_c01",
      ColRad = 0.025
    },
    {
      "bn_r_bk_hair5_c01",
      ColRad = 0.02
    },
    {
      "bn_r_bk_hair6_c01",
      ColRad = 0.01
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Dbg_IsDispBody = true,
    Collision = Ym_Cro01_Col_HairBack,
    VibParam = {
      TrgNode = 2,
      StdLen = 0.7,
      {
        Spd = 0,
        SpdAir = -0.31,
        Pow = 0,
        PowAir = 0.23
      },
      {
        Spd = 0,
        SpdAir = 0.9,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = -1.01,
        Pow = 0,
        PowAir = 0.25
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.02,
    {
      "bn_r_bt_hair0_c01"
    },
    {
      "bn_r_bt_hair1_c01",
      AnimRate = 0.3
    },
    {
      "bn_r_bt_hair2_c01",
      ColRad = 0.04
    },
    {
      "bn_r_bt_hair3_c01",
      ColRad = 0.04
    },
    {
      "bn_r_bt_hair4_c01",
      ColRad = 0.035
    },
    {
      "bn_r_bt_hair5_c01",
      ColRad = 0.02
    },
    {
      "bn_r_bt_hair6_c01",
      ColRad = 0.005
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cro01_Col_HairFront,
    VibParam = {
      TrgNode = 2,
      StdLen = 0.7,
      {
        Spd = 0,
        SpdAir = -0.31,
        Pow = 0,
        PowAir = 0.23
      },
      {
        Spd = 0,
        SpdAir = 0.9,
        Pow = 0,
        PowAir = 0.2
      },
      {
        Spd = 0,
        SpdAir = -1.01,
        Pow = 0,
        PowAir = 0.25
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0,
    ColRad = 0.02,
    {
      "bn_r_sd_hair0_c01"
    },
    {
      "bn_r_sd_hair1_c01"
    },
    {
      "bn_r_sd_hair2_c01"
    },
    {
      "bn_r_sd_hair3_c01"
    },
    {
      "bn_r_sd_hair4_c01"
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cro01_Col_HairFront,
    VibParam = {
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.99,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 1.7,
        Pow = 0,
        PowAir = 0.3
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0.1,
    ColRad = 0.02,
    {
      "bn_r_fr_hairC0_c01"
    },
    {
      "bn_r_fr_hairC1_c01",
      AnimRate = 0.5
    },
    {
      "bn_r_fr_hairC2_c01"
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cro01_Col_HairFront,
    VibParam = {
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.99,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 1.7,
        Pow = 0,
        PowAir = 0.3
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0.1,
    ColRad = 0.02,
    {
      "bn_r_fr_hairB0_c01"
    },
    {
      "bn_r_fr_hairB1_c01",
      AnimRate = 0.5
    },
    {
      "bn_r_fr_hairB2_c01",
      AnimRate = 0.2
    },
    {
      "bn_r_fr_hairB3_c01"
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cro01_Col_HairFront,
    IsAnimPowerful = true,
    VibParam = {
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.99,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 1.7,
        Pow = 0,
        PowAir = 0.3
      }
    },
    GrvRate = 0,
    AirReg = 0.3,
    AnimRate = 0.1,
    ColRad = 0.02,
    {
      "bn_r_fr_hairA0_c01"
    },
    {
      "bn_r_fr_hairA1_c01",
      AnimRate = 0.2,
      StraightPow = 0.075
    },
    {
      "bn_r_fr_hairA2_c01",
      AnimRate = 0.055
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cro01_Col_HairFront,
    VibParam = {
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.99,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 1.7,
        Pow = 0,
        PowAir = 0.3
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0.1,
    ColRad = 0.02,
    {
      "bn_l_fr_hairB0_c01"
    },
    {
      "bn_l_fr_hairB1_c01",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairB2_c01"
    }
  },
  {
    Type = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cro01_Col_HairFront,
    VibParam = {
      StdLen = 0.3,
      {
        Spd = 0,
        SpdAir = -0.99,
        Pow = 0,
        PowAir = 0.33
      },
      {
        Spd = 0,
        SpdAir = 1.7,
        Pow = 0,
        PowAir = 0.3
      }
    },
    GrvRate = 1,
    AirReg = 0.2,
    AnimRate = 0.1,
    ColRad = 0.02,
    {
      "bn_l_fr_hairA0_c01"
    },
    {
      "bn_l_fr_hairA1_c01"
    },
    {
      "bn_l_fr_hairA2_c01",
      ColRad = 0
    }
  }
}
