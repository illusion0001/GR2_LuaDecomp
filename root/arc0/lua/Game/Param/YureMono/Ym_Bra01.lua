L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.01,
      0.055
    },
    Rad = 0.135
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_l_clavicle",
    Pos = {
      0,
      0,
      0.035
    },
    Rad = 0.15
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_r_clavicle",
    Pos = {
      0,
      0,
      0.035
    },
    Rad = 0.15
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine1",
    Pos0 = {
      0,
      -0.03,
      0.04
    },
    Node1 = "bn_spine0",
    Pos1 = {
      0,
      -0.01,
      -0.075
    },
    Rad = 0.18
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      -0.03,
      -0.025,
      0.02
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.065,
      -0.01,
      0.365
    },
    Rad = 0.175
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Pos0 = {
      0.03,
      -0.025,
      0.02
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.065,
      -0.01,
      0.365
    },
    Rad = 0.175
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_leg",
    Pos0 = {
      -0.02,
      0,
      0
    },
    Node1 = "bn_l_leg",
    Pos1 = {
      -0.015,
      0,
      0.42
    },
    Rad = 0.125
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_leg",
    Pos0 = {
      0.02,
      0,
      0
    },
    Node1 = "bn_r_leg",
    Pos1 = {
      0.015,
      0,
      0.42
    },
    Rad = 0.125
  }
}
Col_Wing = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine0",
    Pos = {
      0,
      0.01,
      0.055
    },
    Rad = 0.255
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_root",
    Pos = {
      0,
      -0.15,
      -0.175
    },
    Rad = 0.325
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      -0.03,
      -0.025,
      0.02
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.065,
      -0.01,
      0.365
    },
    Rad = 0.165
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Pos0 = {
      0.03,
      -0.025,
      0.02
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.065,
      -0.01,
      0.365
    },
    Rad = 0.165
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_leg",
    Pos0 = {
      -0.02,
      0,
      0
    },
    Node1 = "bn_l_leg",
    Pos1 = {
      -0.015,
      0,
      0.42
    },
    Rad = 0.15
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_leg",
    Pos0 = {
      0.02,
      0,
      0
    },
    Node1 = "bn_r_leg",
    Pos1 = {
      0.015,
      0,
      0.42
    },
    Rad = 0.15
  }
}
L0_0.Dbg_IsDisp = true
Col_Tail = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.08,
      0.095
    },
    Rad = 0.205
  }
}
Col_CollarBack = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      -0.14,
      0.025,
      0.105
    },
    Rad = 0.24
  }
}
Col_CollarL = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.14,
      0.025,
      0.105
    },
    Rad = 0.24
  }
}
Col_CollarR = L0_0
L0_0 = {
  {
    Spd = 0,
    SpdAir = 0.222,
    Pow = 0,
    PowAir = 0.3
  },
  {
    Spd = 0,
    SpdAir = 0.1,
    Pow = 0,
    PowAir = 0.2
  },
  {
    Spd = 0,
    SpdAir = 0.131,
    Pow = 0,
    PowAir = 0.2
  }
}
L0_0.TrgNode = 1
Ym_Bra01 = {
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Wing,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 0.3,
    BeneNobiStep = 0.3,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    BeneHasu = 0.2,
    {
      "bn_jacket_l_wing_1"
    },
    {
      "bn_jacket_l_wing_2"
    },
    {
      "bn_jacket_l_wing_3"
    },
    {
      "bn_jacket_l_wing_4"
    },
    {
      "bn_jacket_l_wing_5"
    },
    {
      "bn_jacket_l_wing_6"
    },
    {
      "bn_jacket_l_wing_7"
    },
    {
      "bn_jacket_l_wing_8"
    },
    {
      "bn_jacket_l_wing_9"
    },
    {
      "dm_jacket_l_wing_10"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Wing,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 0.3,
    BeneNobiStep = 0.3,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    BeneHasu = 0.2,
    {
      "bn_jacket_r_wing_1"
    },
    {
      "bn_jacket_r_wing_2"
    },
    {
      "bn_jacket_r_wing_3"
    },
    {
      "bn_jacket_r_wing_4"
    },
    {
      "bn_jacket_r_wing_5"
    },
    {
      "bn_jacket_r_wing_6"
    },
    {
      "bn_jacket_r_wing_7"
    },
    {
      "bn_jacket_r_wing_8"
    },
    {
      "bn_jacket_r_wing_9"
    },
    {
      "dm_jacket_r_wing_10"
    }
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_CollarBack,
    GrvRate = 0,
    AnimRate = 1,
    ColRad = 0,
    {
      "bn_collar_bk"
    },
    {
      "dm_collar_bk"
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_CollarL,
    GrvRate = 0,
    AnimRate = 1,
    ColRad = 0,
    {
      "bn_collar_l"
    },
    {
      "bn_collar_l_side"
    },
    {
      "dm_collar_l"
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Col_CollarR,
    GrvRate = 0,
    AnimRate = 1,
    ColRad = 0,
    {
      "bn_collar_r"
    },
    {
      "bn_collar_r_side"
    },
    {
      "dm_collar_r"
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Tail,
    CalLoopNum = 5,
    IsFitLen = true,
    IsAntiCross = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 0.3,
    BeneNobiStep = 0.3,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.3,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    BeneHasu = 0.2,
    {
      "bn_jacket_tail_1",
      Width = 0.3
    },
    {
      "bn_jacket_tail_2",
      Width = 0.3,
      AnimRate = 1
    },
    {
      "bn_jacket_tail_3",
      Width = 0.3,
      AnimRate = 1
    },
    {
      "bn_jacket_tail_4",
      Width = 0.3,
      AnimRate = 0.56
    },
    {
      "bn_jacket_tail_5",
      Width = 0.25,
      AnimRate = 0.3
    },
    {
      "bn_jacket_tail_6",
      Width = 0.15,
      AnimRate = 0.11
    },
    {
      "dm_jacket_tail_7",
      Width = 0.05,
      AnimRate = 0.04
    }
  }
}
