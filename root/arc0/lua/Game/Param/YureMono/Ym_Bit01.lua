Col_Skirt = {
  Dbg_IsDisp = true,
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_ball",
    Pos = {
      0,
      0,
      0
    },
    Rad = 0.3
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      0,
      0.12,
      0
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      0.04,
      0.035,
      -0.01
    },
    Rad = 0.08
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      -0.04,
      0.035,
      -0.01
    },
    Rad = 0.08
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      0.04,
      -0.02,
      0
    },
    Node1 = "bn_l_thigh",
    Pos1 = {
      0.01,
      -0.005,
      0.205
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.04,
      -0.02,
      0
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      -0.01,
      -0.005,
      0.205
    },
    Rad = 0.07
  }
}
Ym_Bit01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    Collision = Col_Skirt,
    IsTube = true,
    CalLoopNum = 3,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.01,
    BeneChijimiX = 0.1,
    BeneNobiX = 0.002,
    ColPowXHalf = 0.4,
    GrvRate = 1,
    AirRegV = 0.7,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0,
    BaiLenX = {
      1,
      1.3,
      2.5
    },
    {
      {
        "bn_l_front_cloth0"
      },
      {
        "bn_l_front_cloth1",
        AnimRate = 0.1
      },
      {
        "dm_l_front_cloth1",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_l_side_cloth0"
      },
      {
        "bn_l_side_cloth1",
        AnimRate = 0.1
      },
      {
        "dm_l_side_cloth1",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_l_back_cloth0"
      },
      {
        "bn_l_back_cloth1",
        AnimRate = 0.1
      },
      {
        "dm_l_back_cloth1",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_r_back_cloth0"
      },
      {
        "bn_r_back_cloth1",
        AnimRate = 0.1
      },
      {
        "dm_r_back_cloth1",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_r_side_cloth0"
      },
      {
        "bn_r_side_cloth1",
        AnimRate = 0.1
      },
      {
        "dm_r_side_cloth1",
        AnimRate = 0.2
      }
    },
    {
      {
        "bn_r_front_cloth0"
      },
      {
        "bn_r_front_cloth1",
        AnimRate = 0.1
      },
      {
        "dm_r_front_cloth1",
        AnimRate = 0.2
      }
    }
  }
}
