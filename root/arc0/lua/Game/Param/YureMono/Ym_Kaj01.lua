Col_SusoB = {
  Dbg_IsDisp = true,
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Pos0 = {
      0,
      -0.02,
      0.03
    },
    Node1 = "bn_spine1",
    Pos1 = {
      0,
      -0.025,
      0.015
    },
    Rad = 0.145
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_pelvis_end",
    Pos0 = {
      0.06,
      0,
      0.01
    },
    Pos1 = {
      -0.06,
      0,
      0.01
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.08,
      0.01,
      0.03
    },
    Pos1 = {
      -0.025,
      0.025,
      0.16
    },
    Rad = 0.09
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.08,
      0.01,
      0.03
    },
    Pos1 = {
      0.025,
      0.025,
      0.16
    },
    Rad = 0.09
  }
}
Ym_Kaj01 = {
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    Collision = Col_SusoB,
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
        "bn_l_suit_front_a1"
      },
      {
        "bn_l_suit_front_a2",
        AnimRate = 0.5
      },
      {
        "dm_l_suit_front_a2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_l_suit_front_b1"
      },
      {
        "bn_l_suit_front_b2",
        AnimRate = 0.5
      },
      {
        "dm_l_suit_front_b2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_l_suit_front_c1"
      },
      {
        "bn_l_suit_front_c2",
        AnimRate = 0.5
      },
      {
        "dm_l_suit_front_c2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_l_suit_back1"
      },
      {
        "bn_l_suit_back2",
        AnimRate = 0.5
      },
      {
        "dm_l_suit_back2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_r_suit_back1"
      },
      {
        "bn_r_suit_back2",
        AnimRate = 0.5
      },
      {
        "dm_r_suit_back2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_r_suit_front_c1"
      },
      {
        "bn_r_suit_front_c2",
        AnimRate = 0.5
      },
      {
        "dm_r_suit_front_c2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_r_suit_front_b1"
      },
      {
        "bn_r_suit_front_b2",
        AnimRate = 0.5
      },
      {
        "dm_r_suit_front_b2",
        AnimRate = 0.1
      }
    },
    {
      {
        "bn_r_suit_front_a1"
      },
      {
        "bn_r_suit_front_a2",
        AnimRate = 0.5
      },
      {
        "dm_r_suit_front_a2",
        AnimRate = 0.1
      }
    }
  }
}
