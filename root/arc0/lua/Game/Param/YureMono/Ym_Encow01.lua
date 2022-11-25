local L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = 0
L1_1 = 0.01
L2_2 = 0.02
L3_3 = 1.0E-4
L4_4 = 0.001
L5_5 = {
  {
    AirBottom = 0,
    Spd = 0.107,
    SpdAir = 0.01,
    Pow = 0.001,
    PowAir = 0.01
  },
  {
    AirBottom = 0,
    Spd = 0.01333,
    SpdAir = 0.01,
    Pow = 0.003,
    PowAir = 0.01
  },
  {
    AirBottom = 0,
    Spd = -0.02333,
    SpdAir = -0.0131,
    Pow = 0.003,
    PowAir = 0.01
  },
  {
    AirBottom = 0,
    Spd = -0.0143,
    SpdAir = -0.01,
    Pow = 0.00211,
    PowAir = 0.01
  }
}
Ym_Encow01_Col_Head = {
  {
    Dbg_IsDisp = false,
    Type = kYm_ColType_Sphere,
    Node = "bn_root",
    Pos = {
      13.250032,
      8.600006,
      -18.649994
    },
    Rad = 4.349998
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_root",
    Pos = {
      10.884955,
      0,
      -10.650022
    },
    Rad = 13.500013
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head_a",
    Node1 = "bn_head_a",
    Pos0 = {
      0,
      3.259997,
      0.1
    },
    Pos1 = {
      0,
      0.999999,
      1.219999
    },
    Rad = 3
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_root",
    Node1 = "bn_root",
    Pos0 = {
      16.900028,
      21.799934,
      -28.799847
    },
    Pos1 = {
      16.900028,
      5.400002,
      -28.799847
    },
    Rad = 6
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_root",
    Pos = {
      16.900028,
      5.400002,
      -28.799847
    },
    Rad = 8.549994
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_root",
    Node1 = "bn_root",
    Pos0 = {
      8.900015,
      11.150004,
      -21.399837
    },
    Pos1 = {
      24.049919,
      11.150023,
      -21.399837
    },
    Rad = 1.9
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_root",
    Node1 = "bn_root",
    Pos0 = {
      24.049919,
      22.149929,
      -14.549913
    },
    Pos1 = {
      24.049919,
      5.400002,
      -14.549913
    },
    Rad = 3.599998
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_root",
    Node1 = "bn_root",
    Pos0 = {
      16.750031,
      12.55001,
      -5.849814
    },
    Pos1 = {
      16.750031,
      5.400002,
      -5.849813
    },
    Rad = 1.5
  }
}
Ym_Encow01_Col_HeadL = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head_f",
    Node1 = "bn_head_f",
    Pos0 = {
      0,
      3.914996,
      -0.539999
    },
    Pos1 = {
      0.599999,
      0.959999,
      0
    },
    Rad = 4.960021,
    Pow = 1
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_root",
    Pos = {
      23.159958,
      0.539999,
      -3.419997
    },
    Rad = 6.980066,
    Pow = 1
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_head_f",
    Node1 = "bn_root",
    Pos0 = {
      -2.719997,
      5.419994,
      -1.679998
    },
    Pos1 = {
      28.06007,
      2.359998,
      -0.04
    },
    Rad = 2.899999,
    Pow = 1
  }
}
Ym_Encow01_Col_HeadD = {
  Dbg_IsDisp = true,
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_head_e",
    Pos = {
      -1.039999,
      3.419997,
      -0.22
    },
    Rad = 5.059998,
    Pow = 1
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_root",
    Pos = {
      8.439981,
      -18.079842,
      -2.539997
    },
    Rad = 6.119999,
    Pow = 1
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_root",
    Pos = {
      8.439981,
      -3.439996,
      -9.439957
    },
    Rad = 13.059974,
    Pow = 1
  }
}
Ym_Encow01 = {
  Dbg_IsDispBody = true,
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_a",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_r_hair1_a",
      ColRad = 0.895,
      AnimRate = L2_2
    },
    {
      "dm_r_hair2_a",
      ColRad = 0.635
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_c",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_r_hair1_c",
      ColRad = 1.265,
      AnimRate = L2_2
    },
    {
      "dm_r_hair2_c",
      ColRad = 1.035
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_d",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_r_hair1_d",
      ColRad = 2.735,
      AnimRate = L2_2
    },
    {
      "bn_r_hair2_d",
      ColRad = 2.27
    },
    {
      "dm_r_hair3_d",
      ColRad = 1.7
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_b",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_r_hair1_b",
      ColRad = 2.13,
      AnimRate = L2_2
    },
    {
      "dm_r_hair2_b",
      ColRad = 1.39
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_c_hair0_a",
      ColRad = 2.31,
      AnimRate = L2_2
    },
    {
      "bn_c_hair1_a",
      ColRad = 2.24,
      AnimRate = L2_2
    },
    {
      "dm_c_hair2_a",
      ColRad = 2.075
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_e",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_r_hair1_e",
      ColRad = 2.66,
      AnimRate = L2_2
    },
    {
      "bn_r_hair2_e",
      ColRad = 2.49
    },
    {
      "dm_r_hair3_e",
      ColRad = 2.13
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_f",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_r_hair1_f",
      ColRad = 3.23,
      AnimRate = L2_2
    },
    {
      "dm_r_hair2_f",
      ColRad = 3.15
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_l_hair0_d",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_l_hair1_d",
      ColRad = 3.165014,
      AnimRate = L2_2
    },
    {
      "dm_l_hair2_d",
      ColRad = 2.465009
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_l_hair0_b",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_l_hair1_b",
      ColRad = 1.41,
      AnimRate = L2_2
    },
    {
      "dm_l_hair2_b",
      ColRad = 1.435
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_l_hair0_c",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_l_hair1_c",
      ColRad = 2.245,
      AnimRate = L2_2
    },
    {
      "bn_l_hair2_c",
      ColRad = 1.645
    },
    {
      "dm_l_hair03_c",
      ColRad = 0.87
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_Head,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_l_hair0_a",
      ColRad = 0.01,
      AnimRate = L2_2
    },
    {
      "bn_l_hair1_a",
      ColRad = 1.925,
      AnimRate = L2_2
    },
    {
      "bn_l_hair2_a",
      ColRad = 2.33
    },
    {
      "dm_l_hair3_a",
      ColRad = 1.645
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_HeadL,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_g"
    },
    {
      "bn_r_hair1_g",
      ColRad = 0.9,
      AnimRate = L2_2
    },
    {
      "bn_r_hair2_g",
      ColRad = 0.81
    },
    {
      "dm_r_hair3_g",
      ColRad = 0.4
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_HeadL,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_l_hair0_e"
    },
    {
      "bn_l_hair1_e",
      ColRad = 0.945,
      AnimRate = L2_2
    },
    {
      "bn_l_hair2_e",
      ColRad = 0.705
    },
    {
      "dm_l_hair3_e",
      ColRad = 0.415
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_HeadD,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_h"
    },
    {
      "bn_r_hair1_h",
      ColRad = 0.34,
      AnimRate = L2_2
    },
    {
      "bn_r_hair2_h",
      ColRad = 0.36
    },
    {
      "dm_r_hair3_h",
      ColRad = 0.12
    },
    VibParam = L5_5
  },
  {
    Type = kYm_Type_Himo,
    InvalidRateGp = {"ym_ir_hair", "ym_ir_all"},
    Collision = Ym_Encow01_Col_HeadD,
    GrvRate = L0_0,
    AirReg = L1_1,
    AnimRate = L3_3,
    ColRad = 0.01,
    StraightPow = L4_4,
    {
      "bn_r_hair0_i"
    },
    {
      "bn_r_hair1_i",
      ColRad = 0.78,
      AnimRate = L2_2
    },
    {
      "bn_r_hair2_i",
      ColRad = 0.46
    },
    {
      "dm_r_hair3_i",
      ColRad = 0.34
    },
    VibParam = L5_5
  }
}
