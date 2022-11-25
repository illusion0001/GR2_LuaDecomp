L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      -0.065,
      0.105
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      0.005,
      0.1
    },
    Rad = 0.11
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
      -0.025,
      -0.015,
      0.055
    },
    Node1 = "bn_r_clavicle",
    Pos1 = {
      0.025,
      -0.015,
      0.055
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Pos0 = {
      0.035,
      -0.055,
      0.045
    },
    Node1 = "bn_spine2",
    Pos1 = {
      -0.035,
      -0.055,
      0.045
    },
    Rad = 0.15
  }
}
Col_Hair = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_clavicle",
    Pos0 = {
      0,
      0,
      0.12
    },
    Node1 = "bn_r_clavicle",
    Pos1 = {
      0,
      0,
      0.12
    },
    Rad = 0.075
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Pos0 = {
      0.025,
      0.065,
      0.045
    },
    Node1 = "bn_spine2",
    Pos1 = {
      0,
      0.065,
      0.045
    },
    Rad = 0.21
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine2",
    Node1 = "bn_pelvis",
    Pos0 = {
      0,
      0.005,
      0.03
    },
    Pos1 = {
      0,
      -0.025,
      0.07
    },
    Rad = 0.165
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.01,
      0.03,
      -0.08
    },
    Node1 = "bn_pelvis_end",
    Pos1 = {
      -0.01,
      0.03,
      -0.08
    },
    Rad = 0.25
  }
}
Col_Tie = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.055,
      -0.035,
      -0.01
    },
    Pos1 = {
      0.055,
      -0.015,
      0.11
    },
    Rad = 0.13
  }
}
L0_0.Dbg_IsDisp = true
Col_Gun = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine1",
    Pos0 = {
      0,
      -0.02,
      0.04
    },
    Pos1 = {
      0,
      -0.025,
      0.015
    },
    Rad = 0.155
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_pelvis_end",
    Pos0 = {
      0.05,
      0.045,
      0.015
    },
    Pos1 = {
      -0.055,
      0.05,
      0.015
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.075,
      0.015,
      0.005
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.03,
      0.02,
      0.16
    },
    Rad = 0.09
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.075,
      0.015,
      0.005
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.03,
      0.02,
      0.16
    },
    Rad = 0.09
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_gun",
    Pos0 = {
      -0.01,
      -0.035,
      0
    },
    Node1 = "bn_gun",
    Pos1 = {
      -0.015,
      -0.035,
      0.13
    },
    Rad = 0.06
  }
}
L0_0.Dbg_IsDisp = true
Col_Suit = L0_0
L0_0 = 0.8
Ym_Ali01 = {
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairA0"},
    {"bn_hairA1", AnimRate = 0.8},
    {"bn_hairA2", AnimRate = 0.3},
    {"bn_hairA3", AnimRate = 0.1},
    {"bn_hairA4", AnimRate = 0},
    {"dm_hairA4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = 5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = 0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairB0"},
    {"bn_hairB1", AnimRate = 0.8},
    {"bn_hairB2", AnimRate = 0.3},
    {"bn_hairB3", AnimRate = 0.1},
    {"bn_hairB4", AnimRate = 0},
    {"dm_hairB4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = -5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = -0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairC0"},
    {"bn_hairC1", AnimRate = 0.8},
    {"bn_hairC2", AnimRate = 0.3},
    {"bn_hairC3", AnimRate = 0.1},
    {"bn_hairC4", AnimRate = 0},
    {"dm_hairC4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = 5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = 0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairD0"},
    {"bn_hairD1", AnimRate = 0.8},
    {"bn_hairD2", AnimRate = 0.3},
    {"bn_hairD3", AnimRate = 0.1},
    {"bn_hairD4", AnimRate = 0},
    {"dm_hairD4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = -5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = -0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairE0"},
    {"bn_hairE1", AnimRate = 0.8},
    {"bn_hairE2", AnimRate = 0.3},
    {"bn_hairE3", AnimRate = 0.1},
    {"bn_hairE4", AnimRate = 0},
    {"dm_hairE4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = 5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = 0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairF0"},
    {"bn_hairF1", AnimRate = 0.8},
    {"bn_hairF2", AnimRate = 0.3},
    {"bn_hairF3", AnimRate = 0.1},
    {"bn_hairF4", AnimRate = 0},
    {"dm_hairF4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = -5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = -0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairG0"},
    {"bn_hairG1", AnimRate = 0.8},
    {"bn_hairG2", AnimRate = 0.3},
    {"bn_hairG3", AnimRate = 0.1},
    {"bn_hairG4", AnimRate = 0},
    {"dm_hairG4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = 5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = 0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairH0"},
    {"bn_hairH1", AnimRate = 0.8},
    {"bn_hairH2", AnimRate = 0.3},
    {"bn_hairH3", AnimRate = 0.1},
    {"bn_hairH4", AnimRate = 0},
    {"dm_hairH4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = -5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = -0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairI0"},
    {"bn_hairI1", AnimRate = 0.8},
    {"bn_hairI2", AnimRate = 0.3},
    {"bn_hairI3", AnimRate = 0.1},
    {"bn_hairI4", AnimRate = 0},
    {"dm_hairI4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = 5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = 0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairJ0"},
    {"bn_hairJ1", AnimRate = 0.8},
    {"bn_hairJ2", AnimRate = 0.3},
    {"bn_hairJ3", AnimRate = 0.1},
    {"bn_hairJ4", AnimRate = 0},
    {"dm_hairJ4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = -5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = -0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairK0"},
    {"bn_hairK1", AnimRate = 0.8},
    {"bn_hairK2", AnimRate = 0.3},
    {"bn_hairK3", AnimRate = 0.1},
    {"bn_hairK4", AnimRate = 0},
    {"dm_hairK4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = 5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = 0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairL0"},
    {"bn_hairL1", AnimRate = 0.8},
    {"bn_hairL2", AnimRate = 0.3},
    {"bn_hairL3", AnimRate = 0.1},
    {"bn_hairL4", AnimRate = 0},
    {"dm_hairL4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = -5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = -0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hair,
    GrvRate = 0.5,
    AirReg = 0.1,
    AnimRate = HairAnR2,
    ColRad = 0.01,
    UneLenRate = 1.2,
    UnePow = 0.7,
    {"bn_hairM0"},
    {"bn_hairM1", AnimRate = 0.8},
    {"bn_hairM2", AnimRate = 0.3},
    {"bn_hairM3", AnimRate = 0.1},
    {"bn_hairM4", AnimRate = 0},
    {"dm_hairM4", AnimRate = 0},
    VibParam = {
      {
        AirBottom = 0,
        Spd = 5.07,
        SpdAir = 1,
        Pow = 0.002,
        PowAir = 0.01
      },
      {
        AirBottom = 0,
        Spd = 0.1333,
        SpdAir = 1,
        Pow = 0.003,
        PowAir = 0.01
      }
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Tie,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.35,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0,
    {
      "bn_necktie_top"
    },
    {
      "bn_necktieA0",
      AnimRate = 1
    },
    {
      "bn_necktieA1",
      AnimRate = 0.5
    },
    {
      "bn_necktieA2",
      AnimRate = 0.03
    },
    {
      "bn_necktieA3"
    },
    {
      "bn_necktieA4"
    },
    {
      "dm_necktieA4"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Tie,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0,
    {
      "bn_necktieB0",
      AnimRate = 1
    },
    {
      "bn_necktieB1",
      AnimRate = 0.5
    },
    {
      "bn_necktieB2",
      AnimRate = 0.03
    },
    {
      "bn_necktieB3"
    },
    {
      "bn_necktieB4"
    },
    {
      "dm_necktieB4"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Gun,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.05,
    GrvRate = 1,
    AirRegV = 0.08,
    AirRegP = 0.08,
    ColRad = 0.01,
    {"bn_gun"},
    {"dm_gun", AnimRate = 0.2}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    Collision = Col_Suit,
    IsTube = false,
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.5,
    BeneNobiX = 0.3,
    ColPowXHalf = 0.5,
    IsLastCol = true,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.7,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.3,
    {
      {
        "bn_l_suit_frontA1"
      },
      {
        "bn_l_suit_frontA2",
        ColRad = 0.015,
        AnimRate = L0_0
      },
      {
        "dm_l_suit_frontA2",
        ColRad = 0.005,
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_l_suit_frontB1"
      },
      {
        "bn_l_suit_frontB2",
        ColRad = 0.015,
        AnimRate = L0_0
      },
      {
        "dm_l_suit_frontB2",
        ColRad = 0.03,
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_l_suit_back1"
      },
      {
        "bn_l_suit_back2",
        AnimRate = L0_0
      },
      {
        "dm_l_suit_back2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_r_suit_back1"
      },
      {
        "bn_r_suit_back2",
        AnimRate = L0_0
      },
      {
        "dm_r_suit_back2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_r_suit_frontB1"
      },
      {
        "bn_r_suit_frontB2",
        ColRad = 0,
        AnimRate = L0_0
      },
      {
        "dm_r_suit_frontB2",
        ColRad = 0.015,
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_r_suit_frontA1"
      },
      {
        "bn_r_suit_frontA2",
        ColRad = 0.015,
        AnimRate = L0_0
      },
      {
        "dm_r_suit_frontA2",
        ColRad = 0.025,
        AnimRate = 0.1
      }
    }
  }
}
