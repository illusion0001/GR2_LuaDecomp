local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
L0_0 = {L1_1, L2_2}
L0_0.Dbg_IsDisp = true
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
L4_4 = 0.1
L5_5 = -0.01
L1_1.Pos = L2_2
L1_1.Rad = 0.145
L2_2 = {}
L3_3 = kYm_ColType_Cupsle
L2_2.Type = L3_3
L2_2.Node0 = "bn_spine3"
L2_2.Node1 = "bn_spine1"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0
L5_5 = -0.02
L6_6 = 0.015
L2_2.Pos0 = L3_3
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0
L5_5 = -0.03
L6_6 = 0.04
L2_2.Pos1 = L3_3
L2_2.Rad = 0.13
Col_HairFront = L0_0
L0_0 = {
  L1_1,
  L2_2,
  L3_3,
  L4_4
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
L4_4 = 0.005
L5_5 = 0.03
L1_1.Pos = L2_2
L1_1.Rad = 0.145
L2_2 = {}
L3_3 = kYm_ColType_Cupsle
L2_2.Type = L3_3
L2_2.Node0 = "bn_spine3"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0
L5_5 = -0.02
L6_6 = 0
L2_2.Pos0 = L3_3
L2_2.Node1 = "bn_pelvis_end"
L3_3 = {
  L4_4,
  L5_5,
  L6_6
}
L4_4 = 0
L5_5 = 0
L6_6 = -0.035
L2_2.Pos1 = L3_3
L2_2.Rad = 0.195
L3_3 = {}
L4_4 = kYm_ColType_Cupsle
L3_3.Type = L4_4
L3_3.Node0 = "bn_pelvis_end"
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = 0.08
L6_6 = 0.02
L7_7 = -0.04
L3_3.Pos0 = L4_4
L3_3.Node1 = "bn_l_thigh"
L4_4 = {
  L5_5,
  L6_6,
  L7_7
}
L5_5 = -0.04
L6_6 = 0
L7_7 = 0.465
L3_3.Pos1 = L4_4
L3_3.Rad = 0.12
L4_4 = {}
L5_5 = kYm_ColType_Cupsle
L4_4.Type = L5_5
L4_4.Node0 = "bn_pelvis_end"
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = -0.08
L7_7 = 0.02
L8_8 = -0.04
L4_4.Pos0 = L5_5
L4_4.Node1 = "bn_r_thigh"
L5_5 = {
  L6_6,
  L7_7,
  L8_8
}
L6_6 = 0.04
L7_7 = 0
L8_8 = 0.465
L4_4.Pos1 = L5_5
L4_4.Rad = 0.12
Col_Hair = L0_0
L0_0 = 1
L1_1 = 0.01
L2_2 = 0.2
L3_3 = 0.4
L4_4 = 1
L5_5 = 0
L6_6 = 0
L7_7 = 1.1
L8_8 = 0.13
L9_9 = true
L10_10 = 1
L11_11 = 1
L12_12 = {
  L13_13,
  {
    Spd = 0,
    SpdAir = 2.1,
    Pow = 0,
    PowAir = 1
  }
}
L13_13 = {}
L13_13.Spd = 0
L13_13.SpdAir = -1
L13_13.Pow = 0
L13_13.PowAir = 1
L13_13 = {
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
L13_13.TrgNode = 2
Ym_Ele01 = {
  Dbg_DispUserChannel = {
    "ym_ir__master_value",
    "ym_ir__master_rate",
    "ym_ir_all",
    "ym_ir_hair"
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_fr_hair0"
    },
    {
      "bn_l_fr_hair1",
      AnimRate = L4_4,
      StraightPow = 0
    },
    {
      "bn_l_fr_hair2",
      AnimRate = L4_4,
      StraightPow = 0
    },
    {
      "bn_l_fr_hair3",
      AnimRate = 0.15,
      StraightPow = 0.3
    },
    {
      "bn_l_fr_hair4",
      AnimRate = 0.1,
      StraightPow = 0.2
    },
    {
      "bn_l_fr_hair5",
      StraightPow = 0
    },
    {
      "bn_l_fr_hair6"
    },
    {
      "bn_l_fr_hair7"
    },
    {
      "dm_l_fr_hair7",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_fr_hair0"
    },
    {
      "bn_r_fr_hair1",
      AnimRate = L4_4,
      StraightPow = 0
    },
    {
      "bn_r_fr_hair2",
      AnimRate = L4_4,
      StraightPow = 0
    },
    {
      "bn_r_fr_hair3",
      AnimRate = 0.15,
      StraightPow = 0.3
    },
    {
      "bn_r_fr_hair4",
      AnimRate = 0.1,
      StraightPow = 0.2
    },
    {
      "bn_r_fr_hair5",
      StraightPow = 0
    },
    {
      "bn_r_fr_hair6"
    },
    {
      "bn_r_fr_hair7"
    },
    {
      "dm_r_fr_hair7",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_sd_hairA0"
    },
    {
      "bn_r_sd_hairA1",
      AnimRate = L4_4
    },
    {
      "bn_r_sd_hairA2"
    },
    {
      "bn_r_sd_hairA3"
    },
    {
      "bn_r_sd_hairA4"
    },
    {
      "bn_r_sd_hairA5"
    },
    {
      "dm_r_sd_hairA5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_bk_hairE0"
    },
    {
      "bn_r_bk_hairE1",
      AnimRate = L4_4
    },
    {
      "bn_r_bk_hairE2"
    },
    {
      "bn_r_bk_hairE3"
    },
    {
      "bn_r_bk_hairE4"
    },
    {
      "bn_r_bk_hairE5"
    },
    {
      "bn_r_bk_hairE6"
    },
    {
      "dm_r_bk_hairE6",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_bk_hairD0"
    },
    {
      "bn_r_bk_hairD1",
      AnimRate = L4_4
    },
    {
      "bn_r_bk_hairD2"
    },
    {
      "bn_r_bk_hairD3"
    },
    {
      "bn_r_bk_hairD4"
    },
    {
      "bn_r_bk_hairD5"
    },
    {
      "bn_r_bk_hairD6"
    },
    {
      "bn_r_bk_hairD7"
    },
    {
      "dm_r_bk_hairD7",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_sd_hairB0"
    },
    {
      "bn_r_sd_hairB1",
      AnimRate = L4_4
    },
    {
      "bn_r_sd_hairB2"
    },
    {
      "dm_r_sd_hairB2",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_center_hairA0"
    },
    {
      "bn_center_hairA1",
      AnimRate = L4_4
    },
    {
      "bn_center_hairA2"
    },
    {
      "bn_center_hairA3"
    },
    {
      "bn_center_hairA4"
    },
    {
      "bn_center_hairA5"
    },
    {
      "bn_center_hairA6"
    },
    {
      "bn_center_hairA7"
    },
    {
      "dm_center_hairA7",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_bk_hairF0"
    },
    {
      "bn_r_bk_hairF1",
      AnimRate = L4_4
    },
    {
      "bn_r_bk_hairF2"
    },
    {
      "bn_r_bk_hairF3"
    },
    {
      "bn_r_bk_hairF4"
    },
    {
      "bn_r_bk_hairF5"
    },
    {
      "dm_r_bk_hairF5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_bk_hairC0"
    },
    {
      "bn_r_bk_hairC1",
      AnimRate = L4_4
    },
    {
      "bn_r_bk_hairC2"
    },
    {
      "bn_r_bk_hairC3"
    },
    {
      "bn_r_bk_hairC4"
    },
    {
      "bn_r_bk_hairC5"
    },
    {
      "dm_r_bk_hairC5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_bk_hairA0"
    },
    {
      "bn_r_bk_hairA1",
      AnimRate = L4_4
    },
    {
      "bn_r_bk_hairA2"
    },
    {
      "bn_r_bk_hairA3"
    },
    {
      "bn_r_bk_hairA4"
    },
    {
      "dm_r_bk_hairA4",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_r_bk_hairB0"
    },
    {
      "bn_r_bk_hairB1",
      AnimRate = L4_4
    },
    {
      "bn_r_bk_hairB2"
    },
    {
      "bn_r_bk_hairB3"
    },
    {
      "bn_r_bk_hairB4"
    },
    {
      "bn_r_bk_hairB5"
    },
    {
      "dm_r_bk_hairB5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_center_hairB0"
    },
    {
      "bn_center_hairB1",
      AnimRate = L4_4
    },
    {
      "bn_center_hairB2"
    },
    {
      "bn_center_hairB3"
    },
    {
      "bn_center_hairB4"
    },
    {
      "dm_center_hairB4",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_bk_hairC0"
    },
    {
      "bn_l_bk_hairC1",
      AnimRate = L4_4
    },
    {
      "bn_l_bk_hairC2"
    },
    {
      "bn_l_bk_hairC3"
    },
    {
      "bn_l_bk_hairC4"
    },
    {
      "bn_l_bk_hairC5"
    },
    {
      "dm_l_bk_hairC5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_bk_hairB0"
    },
    {
      "bn_l_bk_hairB1",
      AnimRate = L4_4
    },
    {
      "bn_l_bk_hairB2"
    },
    {
      "bn_l_bk_hairB3"
    },
    {
      "bn_l_bk_hairB4"
    },
    {
      "bn_l_bk_hairB5"
    },
    {
      "dm_l_bk_hairB5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_bk_hairA0"
    },
    {
      "bn_l_bk_hairA1",
      AnimRate = L4_4
    },
    {
      "bn_l_bk_hairA2"
    },
    {
      "bn_l_bk_hairA3"
    },
    {
      "bn_l_bk_hairA4"
    },
    {
      "dm_l_bk_hairA4",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_bk_hairF0"
    },
    {
      "bn_l_bk_hairF1",
      AnimRate = L4_4
    },
    {
      "bn_l_bk_hairF2"
    },
    {
      "bn_l_bk_hairF3"
    },
    {
      "bn_l_bk_hairF4"
    },
    {
      "bn_l_bk_hairF5"
    },
    {
      "dm_l_bk_hairF5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_bk_hairE0"
    },
    {
      "bn_l_bk_hairE1",
      AnimRate = L4_4
    },
    {
      "bn_l_bk_hairE2"
    },
    {
      "bn_l_bk_hairE3"
    },
    {
      "bn_l_bk_hairE4"
    },
    {
      "bn_l_bk_hairE5"
    },
    {
      "bn_l_bk_hairE6"
    },
    {
      "dm_l_bk_hairE6",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_bk_hairD0"
    },
    {
      "bn_l_bk_hairD1",
      AnimRate = L4_4
    },
    {
      "bn_l_bk_hairD2"
    },
    {
      "bn_l_bk_hairD3"
    },
    {
      "bn_l_bk_hairD4"
    },
    {
      "bn_l_bk_hairD5"
    },
    {
      "bn_l_bk_hairD6"
    },
    {
      "bn_l_bk_hairD7"
    },
    {
      "dm_l_bk_hairD7",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_sd_hairA0"
    },
    {
      "bn_l_sd_hairA1",
      AnimRate = L4_4
    },
    {
      "bn_l_sd_hairA2"
    },
    {
      "bn_l_sd_hairA3"
    },
    {
      "bn_l_sd_hairA4"
    },
    {
      "bn_l_sd_hairA5"
    },
    {
      "dm_l_sd_hairA5",
      AirReg = L3_3,
      BaneSkip = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    CalLoopNum = L0_0,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_Hair,
    GrvRate = L1_1,
    AirReg = L2_2,
    AnimRate = L5_5,
    ColRad = 0.01,
    BaneSkip = L6_6,
    UneLenRate = L7_7,
    UnePow = L8_8,
    {
      "bn_l_sd_hairB0"
    },
    {
      "bn_l_sd_hairB1",
      AnimRate = L4_4
    },
    {
      "bn_l_sd_hairB2"
    },
    {
      "dm_l_sd_hairB2",
      AirReg = L3_3,
      BaneSkip = 0
    }
  }
}
