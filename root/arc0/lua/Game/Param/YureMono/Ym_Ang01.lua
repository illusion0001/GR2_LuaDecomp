L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.075,
      0.045
    },
    Rad = 0.13
  }
}
Col_HairFront = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.045,
      0.045,
      0.05
    },
    Rad = 0.13
  }
}
Col_HairMomiLF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.045,
      0.045,
      0.05
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.08,
      0.035
    },
    Rad = 0.12
  }
}
Col_HairMomiLB = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.045,
      0.045,
      0.05
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.08,
      0.035
    },
    Rad = 0.12
  }
}
Col_HairMomiR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.025,
      0.03,
      0.055
    },
    Rad = 0.11
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.03,
      0.08,
      0.035
    },
    Rad = 0.11
  }
}
Col_HairSideL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.025,
      0.03,
      0.055
    },
    Rad = 0.11
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.03,
      0.08,
      0.035
    },
    Rad = 0.11
  }
}
Col_HairSideR = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.06,
      0.05
    },
    Rad = 0.105
  }
}
Col_HairBU = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.03,
      0.065
    },
    Rad = 0.11
  }
}
Col_HairB = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis",
    Pos = {
      0,
      0,
      -0.15
    },
    Rad = 0.3
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0,
      0,
      0
    },
    Node1 = "bn_spine1",
    Pos1 = {
      0,
      -0.025,
      0.015
    },
    Rad = 0.125
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.05,
      0.01,
      -0.025
    },
    Pos1 = {
      -0.025,
      -0.03,
      0.03
    },
    Rad = 0.12
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.05,
      0.01,
      -0.025
    },
    Pos1 = {
      0.025,
      -0.03,
      0.03
    },
    Rad = 0.12
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.085,
      0.01,
      0.005
    },
    Pos1 = {
      -0.03,
      0,
      0.36
    },
    Rad = 0.075
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.085,
      0.01,
      0.005
    },
    Pos1 = {
      0.03,
      0,
      0.36
    },
    Rad = 0.075
  }
}
L0_0.Dbg_IsDisp = true
Col_Skirt = L0_0
L0_0 = {
  {
    Spd = 0,
    SpdAir = -0.3,
    Pow = 0,
    PowAir = 0.13
  },
  {
    Spd = 0,
    SpdAir = 1.1,
    Pow = 0,
    PowAir = 0.2
  }
}
Ym_Ang01 = {
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_c2_fr_hair0"
    },
    {
      "dm_c2_fr_hair",
      AnimRate = 0.2
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_c_fr_hair0"
    },
    {
      "bn_c_fr_hair1",
      AnimRate = 0.3
    },
    {
      "dm_c_fr_hair",
      AnimRate = 0.17
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairFront,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_r_fr_hairB0a"
    },
    {
      "dm_r_fr_hairB",
      AnimRate = 0.2
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairMomiLF,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_fr_hairA0"
    },
    {
      "bn_fr_hairA1",
      AnimRate = 0.6
    },
    {
      "bn_fr_hairA2",
      AnimRate = 0.3
    },
    {
      "dm_fr_hairA",
      AnimRate = 0.1,
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairMomiLB,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_l_fr_hairA0"
    },
    {
      "bn_l_fr_hairA1",
      AnimRate = 0.6
    },
    {
      "bn_l_fr_hairA2",
      AnimRate = 0.3
    },
    {
      "dm_l_fr_hairA",
      AnimRate = 0.1,
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairMomiR,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_r_fr_hairC0"
    },
    {
      "bn_r_fr_hairC1",
      AnimRate = 0.6
    },
    {
      "bn_r_fr_hairC2",
      AnimRate = 0.3
    },
    {
      "dm_r_fr_hairC",
      AnimRate = 0.1,
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideL,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_l_sd_hair0"
    },
    {
      "bn_l_sd_hair1",
      AnimRate = 0.6
    },
    {
      "bn_l_sd_hair2",
      AnimRate = 0.3
    },
    {
      "bn_l_sd_hair3",
      AnimRate = 0.1,
      ColRad = 0
    },
    {
      "dm_l_sd_hair4",
      AnimRate = 0.1,
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairSideR,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_r_sd_hair0"
    },
    {
      "bn_r_sd_hair1",
      AnimRate = 0.6
    },
    {
      "bn_r_sd_hair2",
      AnimRate = 0.3
    },
    {
      "bn_r_sd_hair3",
      AnimRate = 0.1,
      ColRad = 0
    },
    {
      "dm_r_sd_hair4",
      AnimRate = 0.1,
      ColRad = 0
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBU,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_l_bt_hair0"
    },
    {
      "bn_l_bt_hair1",
      AnimRate = 0.6
    },
    {
      "bn_l_bt_hair2",
      AnimRate = 0.3
    },
    {
      "bn_l_bt_hair3",
      AnimRate = 0.2
    },
    {
      "bn_l_bt_hair4",
      AnimRate = 0.13
    },
    {
      "dm_l_bt_hair5",
      AnimRate = 0.1
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairBU,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_r_bt_hair0"
    },
    {
      "bn_r_bt_hair1",
      AnimRate = 0.6
    },
    {
      "bn_r_bt_hair2",
      AnimRate = 0.3
    },
    {
      "bn_r_bt_hair3",
      AnimRate = 0.2
    },
    {
      "bn_r_bt_hair4",
      AnimRate = 0.13
    },
    {
      "dm_r_bt_hair5",
      AnimRate = 0.1
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairB,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_l_bk_hair0"
    },
    {
      "bn_l_bk_hair1",
      AnimRate = 0.6
    },
    {
      "bn_l_bk_hair2",
      AnimRate = 0.3,
      ColRad = 0.025
    },
    {
      "bn_l_bk_hair3",
      AnimRate = 0.2,
      ColRad = 0.025
    },
    {
      "bn_l_bk_hair4",
      AnimRate = 0.13,
      ColRad = 0.02
    },
    {
      "dm_l_bk_hair5",
      AnimRate = 0.1
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairB,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_center_hair0"
    },
    {
      "bn_center_hair1",
      AnimRate = 0.6
    },
    {
      "bn_center_hair2",
      AnimRate = 0.3,
      ColRad = 0.025
    },
    {
      "bn_center_hair3",
      AnimRate = 0.2,
      ColRad = 0.025
    },
    {
      "bn_center_hair4",
      AnimRate = 0.13,
      ColRad = 0.02
    },
    {
      "dm_center_hair5",
      AnimRate = 0.1
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_HairB,
    IsFitLen = IsFit,
    BeneChijimi = BC,
    BeneNobi = BN,
    VibParam = L0_0,
    GrvRate = 0.5,
    AirReg = HairARg,
    AnimRate = HairARt,
    ColRad = 0.01,
    BaneSkip = HairBaneS,
    CalLoopNum = nCalLoop,
    {
      "bn_r_bk_hair0"
    },
    {
      "bn_r_bk_hair1",
      AnimRate = 0.6
    },
    {
      "bn_r_bk_hair2",
      AnimRate = 0.3,
      ColRad = 0.025
    },
    {
      "bn_r_bk_hair3",
      AnimRate = 0.2,
      ColRad = 0.025
    },
    {
      "bn_r_bk_hair4",
      AnimRate = 0.13,
      ColRad = 0.02
    },
    {
      "dm_r_bk_hair5",
      AnimRate = 0.1
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Skirt,
    IsTube = true,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.1,
    BeneChijimiX = 0.7,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    IsLastCol = true,
    Width = 0.1,
    GrvRate = 0.2,
    AirRegV = 0.7,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.2,
    {
      {
        "bn_front_skirt0"
      },
      {
        "bn_front_skirt1",
        AnimRate = 0.5
      },
      {
        "dm_front_skirt",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_l_skirtA0"
      },
      {
        "bn_l_skirtA1",
        AnimRate = 0.5
      },
      {
        "dm_l_skirtA",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_l_skirtB0"
      },
      {
        "bn_l_skirtB1",
        AnimRate = 0.5
      },
      {
        "dm_l_skirtB",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_l_skirtC0"
      },
      {
        "bn_l_skirtC1",
        AnimRate = 0.5
      },
      {
        "dm_l_skirtC",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_l_skirtD0"
      },
      {
        "bn_l_skirtD1",
        AnimRate = 0.5
      },
      {
        "dm_l_skirtD",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_l_skirtE0"
      },
      {
        "bn_l_skirtE1",
        AnimRate = 0.5
      },
      {
        "dm_l_skirtE",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_l_skirtF0"
      },
      {
        "bn_l_skirtF1",
        AnimRate = 0.5
      },
      {
        "dm_l_skirtF",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_l_skirtG0"
      },
      {
        "bn_l_skirtG1",
        AnimRate = 0.5
      },
      {
        "dm_l_skirtG",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_back_skirt0"
      },
      {
        "bn_back_skirt1",
        AnimRate = 0.5
      },
      {
        "dm_back_skirt",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_r_skirtG0"
      },
      {
        "bn_r_skirtG1",
        AnimRate = 0.5
      },
      {
        "dm_r_skirtG",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_r_skirtF0"
      },
      {
        "bn_r_skirtF1",
        AnimRate = 0.5
      },
      {
        "dm_r_skirtF",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_r_skirtE0"
      },
      {
        "bn_r_skirtE1",
        AnimRate = 0.5
      },
      {
        "dm_r_skirtE",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_r_skirtD0"
      },
      {
        "bn_r_skirtD1",
        AnimRate = 0.5
      },
      {
        "dm_r_skirtD",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_r_skirtC0"
      },
      {
        "bn_r_skirtC1",
        AnimRate = 0.5
      },
      {
        "dm_r_skirtC",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_r_skirtB0"
      },
      {
        "bn_r_skirtB1",
        AnimRate = 0.5
      },
      {
        "dm_r_skirtB",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    {
      {
        "bn_r_skirtA0"
      },
      {
        "bn_r_skirtA1",
        AnimRate = 0.5
      },
      {
        "dm_r_skirtA",
        AnimRate = 0.01,
        AirRegV = 0.6
      }
    },
    VibParam = {
      AirBottom = 0.01,
      {
        Spd = 0,
        SpdAir = -1.3,
        Pow = 0,
        PowAir = 0.13
      },
      {
        Spd = 0,
        SpdAir = 1.43,
        Pow = 0,
        PowAir = 0.2
      }
    }
  }
}
