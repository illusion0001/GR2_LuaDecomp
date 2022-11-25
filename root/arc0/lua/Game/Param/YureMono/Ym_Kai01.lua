L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.07,
      0.195
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head",
    Node1 = "bn_head",
    Pos0 = {
      0,
      -0.03,
      0.3
    },
    Pos1 = {
      0,
      -0.02,
      0.045
    },
    Rad = 0.085
  }
}
Col_HairF = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.02,
      0.105
    },
    Rad = 0.13
  }
}
L0_0.Dbg_IsDisp = true
Col_HairB = L0_0
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
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.04,
      0.04,
      0.02
    },
    Pos1 = {
      -0.015,
      0.005,
      0.05
    },
    Rad = 0.1
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.04,
      0.04,
      0.02
    },
    Pos1 = {
      0.015,
      0.005,
      0.05
    },
    Rad = 0.1
  }
}
Col_SusoB = L0_0
L0_0 = 0.5
Ym_Kai01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairC0"},
    {"bn_hairC1", AnimRate = 0.7},
    {"dm_hairC1", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairB0"},
    {"dm_hairB0", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairA0"},
    {"bn_hairA1", AnimRate = 0.7},
    {"dm_hairA1", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairH0"},
    {"bn_hairH1", AnimRate = 0.7},
    {"bn_hairH2", AnimRate = 0.3},
    {"bn_hairH3", AnimRate = 0.1},
    {"dm_hairH3", AnimRate = 0.01}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairF,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairD0"},
    {"bn_hairD1", AnimRate = 0.7},
    {"bn_hairD2", AnimRate = 0.3},
    {"bn_hairD3", AnimRate = 0.1},
    {"dm_hairD3", AnimRate = 0.01}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairG"},
    {"dm_hairG", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairF"},
    {"dm_hairF", AnimRate = 0.3}
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Himo,
    Collision = Col_HairB,
    GrvRate = L0_0,
    AirReg = 0.1,
    ColRad = 0.01,
    {"bn_hairE"},
    {"dm_hairE", AnimRate = 0.3}
  }
}
