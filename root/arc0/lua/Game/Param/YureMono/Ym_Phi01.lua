local L1_1, L2_2, L3_3, L4_4
L0_0 = 0.2
L1_1 = 0.1
L2_2 = 0.7
L3_3 = 0.1
L4_4 = {}
Ym_Phi01_Col_Non = L4_4
L4_4 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.07,
      0.09
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_jaw",
    Pos = {
      0,
      0.02,
      0
    },
    Rad = 0.055
  },
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
      0.025,
      0
    },
    Node1 = "bn_neck",
    Pos1 = {
      0,
      -0.015,
      0.175
    },
    Rad = 0.065
  }
}
Ym_Phi01_Col_Head = L4_4
L4_4 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.03,
      0.095
    },
    Rad = 0.125
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_neck",
    Pos0 = {
      0,
      0.025,
      0
    },
    Node1 = "bn_neck",
    Pos1 = {
      0,
      -0.015,
      0.175
    },
    Rad = 0.065
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      0.005,
      -0.05
    },
    Rad = 0.09
  }
}
L4_4.Dbg_IsDisp = true
Ym_Phi01_Col_HeadBack = L4_4
L4_4 = {
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Phi01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairC0", AnimRate = L2_2},
    {"bn_hairC1", AnimRate = L2_2},
    {"dm_hairC"}
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Phi01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairA0", AnimRate = L2_2},
    {"bn_hairA1", AnimRate = L2_2},
    {"dm_hairA"}
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Phi01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairD0", AnimRate = L2_2},
    {"bn_hairD1", AnimRate = L2_2},
    {"dm_hairD"}
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Phi01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {"bn_hairB0", AnimRate = L2_2},
    {"bn_hairB1", AnimRate = L2_2},
    {"dm_hairB"}
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Phi01_Col_HeadBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = 0.3,
    ColRad = 0.01,
    {"bn_hairE0"},
    {"bn_hairE1"}
  }
}
L4_4.Dbg_IsDispBody = true
Ym_Phi01 = L4_4
