local L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = 0
L1_1 = 0.1
L2_2 = 0.7
L3_3 = 0.1
L4_4 = 0.03
L5_5 = {}
Ym_Miz01_Col_Non = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.005,
      -0.065,
      0.105
    },
    Rad = 0.085
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_jaw",
    Pos = {
      0.02,
      0.04,
      -0.015
    },
    Rad = 0.09
  }
}
Ym_Miz01_Col_Head = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      -0.8,
      0.555
    },
    Rad = 1
  }
}
Ym_Miz01_Col_HeadBack = L5_5
L5_5 = {
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Miz01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_topA0",
      AnimRate = L2_2
    },
    {
      "bn_hair_topA1",
      AnimRate = L2_2
    },
    {
      "bn_hair_topA2"
    },
    {
      "dm_hair_topA"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Miz01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_topA0",
      AnimRate = L2_2
    },
    {
      "bn_hair_topA1",
      AnimRate = L2_2
    },
    {
      "bn_hair_topA2"
    },
    {
      "dm_hair_topA"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Miz01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_topB0",
      AnimRate = L2_2
    },
    {
      "bn_hair_topB1",
      AnimRate = L2_2
    },
    {
      "bn_hair_topB2"
    },
    {
      "dm_hair_topB"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Miz01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_topC0",
      AnimRate = L2_2
    },
    {
      "bn_hair_topC1",
      AnimRate = L2_2
    },
    {
      "bn_hair_topC2"
    },
    {
      "dm_hair_topC"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Miz01_Col_HeadBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_hair_topD"
    },
    {
      "dm_hair_topD"
    }
  }
}
L5_5.Dbg_IsDispBody = true
L5_5.Dbg_DispNodeA = {Size = 0.03}
Ym_Miz01 = L5_5
