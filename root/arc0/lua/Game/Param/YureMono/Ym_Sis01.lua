local L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = 0
L1_1 = 0.1
L2_2 = 0.7
L3_3 = 0.1
L4_4 = 0.03
L5_5 = {}
Ym_Sis01_Col_Non = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.01,
      -0.005,
      0.05
    },
    Rad = 0.065
  }
}
Ym_Sis01_Col_HeadFront = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0.005,
      0,
      0.045
    },
    Rad = 0.065
  }
}
Ym_Sis01_Col_Head = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.045,
      0.045
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_neck",
    Pos0 = {
      0,
      -0.005,
      -0.02
    },
    Node1 = "bn_neck",
    Pos1 = {
      0,
      0.005,
      0.175
    },
    Rad = 0.04
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_neck",
    Pos = {
      0,
      -0.04,
      -0.06
    },
    Rad = 0.1
  }
}
Ym_Sis01_Col_HeadBack = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head",
    Pos = {
      0,
      0.065,
      0.06
    },
    Rad = 0.105
  }
}
L5_5.Dbg_IsDisp = true
Ym_Sis01_Col_HeadForBandage = L5_5
L5_5 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      0,
      0.095,
      -0.37
    },
    Rad = 0.5
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Pos0 = {
      0.005,
      -0.015,
      0.055
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      0.01,
      0.025,
      0.405
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Pos0 = {
      -0.005,
      -0.015,
      0.055
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      -0.01,
      0.025,
      0.405
    },
    Rad = 0.115
  }
}
Ym_Sis01_Col_Leg = L5_5
L5_5 = {
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_fr_hairA0",
      AnimRate = L2_2
    },
    {
      "bn_l_fr_hairA1",
      AnimRate = L2_2
    },
    {
      "bn_l_fr_hairA2"
    },
    {
      "dm_l_fr_hairA3"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_fr_hairA0",
      AnimRate = L2_2
    },
    {
      "bn_fr_hairA1",
      AnimRate = L2_2
    },
    {
      "bn_fr_hairA2"
    },
    {
      "dm_fr_hairA3"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_HeadFront,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_c_fr_hair0",
      AnimRate = L2_2
    },
    {
      "bn_c_fr_hair1",
      AnimRate = L2_2
    },
    {
      "dm_c_fr_hair2"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_HeadFront,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_fr_hairB0",
      AnimRate = L2_2
    },
    {
      "bn_r_fr_hairB1",
      AnimRate = L2_2
    },
    {
      "dm_r_fr_hairB2"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_fr_hairC0",
      AnimRate = L2_2
    },
    {
      "bn_r_fr_hairC1",
      AnimRate = L2_2
    },
    {
      "bn_r_fr_hairC2"
    },
    {
      "dm_r_fr_hairC3"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_fr_hairD0",
      AnimRate = L2_2
    },
    {
      "bn_r_fr_hairD1",
      AnimRate = L2_2
    },
    {
      "bn_r_fr_hairD2"
    },
    {
      "dm_r_fr_hairD3"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_HeadBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_bk_hair1",
      AnimRate = L2_2
    },
    {
      "bn_l_bk_hair2",
      AnimRate = L2_2
    },
    {
      "bn_l_bk_hair3"
    },
    {
      "bn_l_bk_hair4"
    },
    {
      "bn_l_bk_hair5"
    },
    {
      "bn_l_bk_hair6"
    },
    {
      "bn_l_bk_hair7"
    },
    {
      "bn_l_bk_hair8",
      AnimRate = L4_4
    },
    {
      "dm_l_bk_hair9",
      AnimRate = L4_4
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_HeadBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_up_hair1",
      AnimRate = L2_2
    },
    {
      "bn_l_up_hair2",
      AnimRate = L2_2
    },
    {
      "bn_l_up_hair3"
    },
    {
      "bn_l_up_hair4"
    },
    {
      "bn_l_up_hair5"
    },
    {
      "bn_l_up_hair6"
    },
    {
      "bn_l_up_hair7"
    },
    {
      "bn_l_up_hair8",
      AnimRate = L4_4
    },
    {
      "dm_l_up_hair9",
      AnimRate = L4_4
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_HeadBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_r_up_hair1",
      AnimRate = L2_2
    },
    {
      "bn_r_up_hair2",
      AnimRate = L2_2
    },
    {
      "bn_r_up_hair3"
    },
    {
      "bn_r_up_hair4"
    },
    {
      "bn_r_up_hair5"
    },
    {
      "bn_r_up_hair6"
    },
    {
      "bn_r_up_hair8"
    },
    {
      "bn_r_up_hair9",
      AnimRate = L4_4
    },
    {
      "dm_r_up_hair10",
      AnimRate = L4_4
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_HeadBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_center_hair1",
      AnimRate = L2_2
    },
    {
      "bn_center_hair2",
      AnimRate = L2_2
    },
    {
      "bn_center_hair3"
    },
    {
      "bn_center_hair4"
    },
    {
      "bn_center_hair5"
    },
    {
      "bn_center_hair6"
    },
    {
      "bn_center_hair7"
    },
    {
      "bn_center_hair8",
      AnimRate = L4_4
    },
    {
      "dm_center_hair9",
      AnimRate = L4_4
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Ym_Sis01_Col_HeadBack,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    {
      "bn_l_bk_hair10",
      AnimRate = L2_2
    },
    {
      "bn_l_bk_hair11",
      AnimRate = L2_2
    },
    {
      "bn_l_bk_hair12"
    },
    {
      "bn_l_bk_hair13"
    },
    {
      "bn_l_bk_hair14"
    },
    {
      "bn_l_bk_hair15"
    },
    {
      "bn_l_bk_hair16"
    },
    {
      "bn_l_bk_hair17",
      AnimRate = L4_4
    },
    {
      "dm_l_bk_hair18",
      AnimRate = L4_4
    }
  },
  {
    Type = kYm_Type_KitScarf,
    Collision = Ym_Sis01_Col_Leg,
    Width = 0.01,
    GrvRate = 1,
    AirRegV = 0.1,
    AirRegP = 0.01,
    AnimRate = 0,
    ColRad = 0.01,
    {"bn_l_belt0"},
    {"bn_l_belt1"},
    {"bn_l_belt2"},
    {"bn_l_belt3"},
    {"bn_l_belt4"},
    {"bn_l_belt5"},
    {"dm_l_belt6"}
  },
  {
    Type = kYm_Type_KitScarf,
    Collision = Ym_Sis01_Col_Leg,
    Width = 0.01,
    GrvRate = 1,
    AirRegV = 0.1,
    AirRegP = 0.01,
    AnimRate = 0,
    ColRad = 0.01,
    {"bn_r_belt0"},
    {"bn_r_belt1"},
    {"bn_r_belt2"},
    {"bn_r_belt3"},
    {"bn_r_belt4"},
    {"bn_r_belt5"},
    {"dm_r_belt6"}
  },
  {
    Type = kYm_Type_KitScarf,
    Collision = Ym_Sis01_Col_HeadForBandage,
    Width = 0.01,
    GrvRate = 0,
    AirRegV = 0.6,
    AirRegP = 0.01,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_scarf0",
      Width = 0.16,
      AnimRate = 1
    },
    {
      "bn_scarf1",
      Width = 0.1,
      AnimRate = 0.1
    },
    {
      "dm_scarf2",
      Width = 0.02,
      AnimRate = 0.02,
      AirRegV = 0.2
    }
  }
}
L5_5.Dbg_IsDispBody = true
L5_5.Dbg_DispNodeA = {
  Size = 0.03,
  {"bn_scarf0"},
  {"bn_scarf1"},
  {"dm_scarf2"}
}
Ym_Sis01 = L5_5
