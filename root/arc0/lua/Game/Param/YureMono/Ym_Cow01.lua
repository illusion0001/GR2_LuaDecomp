L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head_end",
    Pos = {
      0,
      -0.015,
      0
    },
    Rad = 0.13
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_clavicle",
    Pos0 = {
      -0.03,
      0,
      0.07
    },
    Node1 = "bn_l_clavicle",
    Pos1 = {
      0.03,
      0,
      0.07
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_b_backpack1",
    Pos = {
      0,
      0,
      0.06
    },
    Rad = 0.14
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_wing0",
    Pos0 = {
      -0.075,
      0.09,
      0
    },
    Node1 = "bn_l_wing0",
    Pos1 = {
      -0.27,
      0.15,
      0
    },
    Rad = 0.05
  },
  {
    Dbg_IsDisp = true,
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_wing0",
    Pos0 = {
      0.075,
      0.09,
      0
    },
    Node1 = "bn_r_wing0",
    Pos1 = {
      0.27,
      0.15,
      0
    },
    Rad = 0.05
  }
}
L0_0.Dbg_IsDisp = true
Col_HairBack = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.05,
      0.05
    },
    Rad = 0.08
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      0.05,
      0.07
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      -0.1,
      0
    },
    Rad = 0.04
  }
}
Col_HairFront = L0_0
L0_0 = {
  {
    Spd = 0,
    SpdAir = -1,
    Pow = 0,
    PowAir = 0.2
  },
  {
    Spd = 0,
    SpdAir = 1.71,
    Pow = 0,
    PowAir = 0.2
  },
  {
    Spd = 0,
    SpdAir = 1.1,
    Pow = 0,
    PowAir = 0.2
  },
  {
    AirBottom = 0.1,
    Spd = 0,
    SpdAir = 0.603,
    Pow = 0,
    PowAir = 0.4
  }
}
L0_0.TrgNode = 4
L0_0.AirBottom = 0.005
L0_0.StdLen = 0.4
Ym_Cow01 = {
  Dbg_IsDispBody = true,
  Dbg_DispNodeA = {
    Size = 0.1,
    {
      "bn_r_backpack0"
    },
    {"bn_l_wing0"},
    {"bn_r_wing0"},
    {
      "bn_l_breastphy_SHB"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_center_hair0"
    },
    {
      "bn_center_hair1",
      AnimRate = 1
    },
    {
      "bn_center_hair2"
    },
    {
      "bn_center_hair3",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_center_hair4",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_center_hair5",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    {
      "bn_center_hair6",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_l_bk_hair0"
    },
    {
      "bn_l_bk_hair1",
      AnimRate = 1
    },
    {
      "bn_l_bk_hair2"
    },
    {
      "bn_l_bk_hair3",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_l_bk_hair4",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_l_bk_hair5",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    {
      "bn_l_bk_hair6",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_r_bk_hair0"
    },
    {
      "bn_r_bk_hair1",
      AnimRate = 1
    },
    {
      "bn_r_bk_hair2"
    },
    {
      "bn_r_bk_hair3",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_r_bk_hair4",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_r_bk_hair5",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    {
      "bn_r_bk_hair6",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_l_bt_hair0"
    },
    {
      "bn_l_bt_hair1",
      AnimRate = 1
    },
    {
      "bn_l_bt_hair2"
    },
    {
      "bn_l_bt_hair3",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_l_bt_hair4",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_l_bt_hair5",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    {
      "bn_l_bt_hair6",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_r_bt_hair0"
    },
    {
      "bn_r_bt_hair1",
      AnimRate = 1
    },
    {
      "bn_r_bt_hair2"
    },
    {
      "bn_r_bt_hair3",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_r_bt_hair4",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_r_bt_hair5",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    {
      "bn_r_bt_hair6",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_l_sd_hair0"
    },
    {
      "bn_l_sd_hair1",
      AnimRate = 1
    },
    {
      "bn_l_sd_hair2"
    },
    {
      "bn_l_sd_hair3",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_l_sd_hair4",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_HairBack,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_r_sd_hair0"
    },
    {
      "bn_r_sd_hair1",
      AnimRate = 1
    },
    {
      "bn_r_sd_hair2"
    },
    {
      "bn_r_sd_hair3",
      AnimRate = 0.04,
      GrvRate = 0.4
    },
    {
      "bn_r_sd_hair4",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_fr_hairA0"
    },
    {
      "bn_fr_hairA1",
      AnimRate = 1
    },
    {
      "bn_fr_hairA2"
    },
    {
      "bn_fr_hairA3",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_l_fr_hairA0"
    },
    {
      "bn_l_fr_hairA1",
      AnimRate = 1
    },
    {
      "bn_l_fr_hairA2",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_r_fr_hairB0"
    },
    {
      "bn_r_fr_hairB1",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairB2",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairFront,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    GrvRate = 0.5,
    AirReg = 0.3,
    AnimRate = 0.2,
    ColRad = 0.01,
    BaneSkip = 0.1,
    CalLoopNum = nCalLoop,
    {
      "bn_r_fr_hairC0"
    },
    {
      "bn_r_fr_hairC1",
      AnimRate = 1
    },
    {
      "bn_r_fr_hairC2",
      AnimRate = 0.01,
      GrvRate = 0.2
    },
    AirBottom = 0.02,
    VibParam = L0_0
  }
}
