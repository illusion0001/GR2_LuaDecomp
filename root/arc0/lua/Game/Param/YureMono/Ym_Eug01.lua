L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0,
      -0.025,
      0.135
    },
    Pos1 = {
      0,
      -0.02,
      0.045
    },
    Rad = 0.075
  }
}
L0_0.Dbg_IsDisp = true
Col_HairFC = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine1",
    Pos = {
      0,
      -0.395,
      0.125
    },
    Rad = 0.48
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.01,
      0.1
    },
    Rad = 0.165
  },
  {
    Type = kYm_ColType_Surface,
    Node = "bn_spine1",
    Pos = {
      0,
      0.02,
      0.265
    },
    Vec = {
      0,
      0.325713,
      -0.05047
    }
  }
}
Col_Food = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_pelvis_end",
    Pos0 = {
      0.045,
      0.01,
      0.01
    },
    Pos1 = {
      -0.045,
      0.01,
      0.01
    },
    Rad = 0.075
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.045,
      0.04,
      0.005
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.015,
      -0.005,
      0.13
    },
    Rad = 0.09
  }
}
Col_Belt = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine1",
    Pos0 = {
      0,
      -0.025,
      -0.02
    },
    Pos1 = {
      0,
      -0.025,
      0.015
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.045,
      0.04,
      0.005
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      -0.015,
      -0.005,
      0.13
    },
    Rad = 0.09
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.045,
      0.04,
      0.005
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.015,
      -0.005,
      0.13
    },
    Rad = 0.09
  }
}
Col_Suso = L0_0
L0_0 = 0.5
Ym_Eug01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFC,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairA0"},
    {"bn_hairA1", AnimRate = 0.7},
    {"dm_hair", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFC,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0,
    {"bn_hairD0"},
    {"dm_hairD", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFC,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0,
    {"bn_hairB0"},
    {"dm_hairB", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFC,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairC0"},
    {"dm_hairC", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFC,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0,
    {"bn_hairE0"},
    {"dm_hairE", AnimRate = 0.3}
  },
  {
    Type = kYm_Type_Himo,
    IsFitLen = false,
    Collision = Col_Food,
    BeneChijimi = 0.2,
    BeneNobi = 0.2,
    GrvRate = 0.25,
    AirReg = 0.3,
    ColRad = 0.02,
    {"bn_food0"},
    {"dm_food", AnimRate = 0.025},
    VibParam = HairVibParam0
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Belt,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.02,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.2,
    ColRad = 0.005,
    {"bn_l_belt0"},
    {
      "bn_l_belt1",
      AnimRate = 1,
      ColRad = 0
    },
    {"bn_l_belt2", AnimRate = 0.5},
    {"bn_l_belt3", AnimRate = 0.2},
    {"dm_l_belt", AnimRate = 0}
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Belt,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 0.03,
    Width = 0.02,
    GrvRate = 1,
    AirRegV = 0.5,
    AirRegP = 0.2,
    ColRad = 0.005,
    {"bn_r_belt0"},
    {
      "bn_r_belt1",
      AnimRate = 1,
      ColRad = 0
    },
    {"bn_r_belt2", AnimRate = 0.5},
    {"bn_r_belt3", AnimRate = 0.2},
    {"dm_r_belt", AnimRate = 0}
  },
  {
    Type = kYm_Type_Cloth,
    Collision = Col_Suso,
    IsTube = false,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.3,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    Width = 0.1,
    GrvRate = 1,
    AirRegV = 0.7,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    StraightPowZ = 0.2,
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
        AnimRate = 0.1
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
        AnimRate = 0.1
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
        AnimRate = 0.1
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
        AnimRate = 0.1
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
        AnimRate = 0.1
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
        AnimRate = 0.1
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
        AnimRate = 0.1
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
        AnimRate = 0.1
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
        AnimRate = 0.1
      }
    }
  }
}
