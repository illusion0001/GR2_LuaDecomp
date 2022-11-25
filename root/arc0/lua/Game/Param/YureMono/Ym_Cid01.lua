local L1_1, L2_2, L3_3, L4_4
L0_0 = 0
L1_1 = 0.1
L2_2 = 1
L3_3 = 0.3
L4_4 = {}
Ym_Cid01_Col_Non = L4_4
L4_4 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Pos0 = {
      0,
      -0.07,
      0.08
    },
    Node1 = "bn_head",
    Pos1 = {
      0,
      0.005,
      0.08
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_neck",
    Pos0 = {
      0,
      0,
      0
    },
    Node1 = "bn_neck",
    Pos1 = {
      0,
      0,
      0.05
    },
    Rad = 0.05
  }
}
L4_4.Dbg_IsDisp = true
Ym_Cid01_Col_Head = L4_4
L4_4 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis",
    Node1 = "bn_pelvis",
    Pos0 = {
      -0.105,
      -0.02,
      -0.19
    },
    Pos1 = {
      -0.11,
      -0.06,
      -0.145
    },
    Rad = 0.381
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Node1 = "bn_l_thigh",
    Pos0 = {
      -0.064,
      0.002,
      0.057
    },
    Pos1 = {
      -0.055,
      0,
      0.3
    },
    Rad = 0.176
  }
}
L4_4.Dbg_IsDisp = true
Ym_Cid01_Col_forBag = L4_4
L4_4 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_neck",
    Pos0 = {
      0,
      -0.07,
      -0.02
    },
    Node1 = "bn_neck",
    Pos1 = {
      0,
      -0.1,
      0.05
    },
    Rad = 0.16
  }
}
Ym_Cid01_Col_Back = L4_4
L4_4 = {
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cid01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairG0", AnimRate = L2_2},
    {"bn_hairG1", AnimRate = L2_2},
    {"dm_hairG1"}
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cid01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairF0", AnimRate = L2_2},
    {"bn_hairF1", AnimRate = L2_2},
    {"dm_hairF1"}
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cid01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairA0", AnimRate = L2_2},
    {"bn_hairA1", AnimRate = L2_2},
    {"dm_hairA1"}
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cid01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairB0", AnimRate = L2_2},
    {"bn_hairB1", AnimRate = L2_2},
    {"bn_hairB2"},
    {"dm_hairB2"}
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cid01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairC0", AnimRate = L2_2},
    {"bn_hairC1", AnimRate = L2_2},
    {"dm_hairC1"}
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cid01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairD0", AnimRate = L2_2},
    {"bn_hairD1", AnimRate = L2_2},
    {"dm_hairD1"}
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Cid01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairE0", AnimRate = L2_2},
    {"bn_hairE1", AnimRate = L2_2},
    {"dm_hairE1"}
  },
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Ym_Cid01_Col_forBag,
    CalLoopNum = 8,
    IsFitLen = false,
    BeneChijimi = 0.5,
    BeneNobi = 0.1,
    IsMatNoramlise = true,
    Width = 0.1,
    AirRegV = 0.1,
    AirRegP = 0.01,
    AnimRate = 0.4,
    ColRad = 0,
    BeneHasu = 0,
    {
      "bn_bag01",
      AnimRate = 1,
      Width = 0.03
    },
    {
      "bn_bag02",
      AnimRate = 0.1,
      ColRad = 0,
      BeneHasu = 1
    },
    {"dm_bag02", AnimRate = 0.1}
  }
}
L4_4.Dbg_IsDispBody = true
Ym_Cid01 = L4_4
