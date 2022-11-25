HairG = 0.8
HairAR = 0.2
SusoAnimRate0 = 0.7
SusoAnimRate1 = 0.15
SusoAnimRate2 = 0.02
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_spine0",
    Node1 = "bn_spine0",
    Pos0 = {
      0,
      0.15,
      0.25
    },
    Pos1 = {
      0,
      0.1,
      0.05
    },
    Rad = 0.3
  }
}
L0_0.Dbg_IsDisp = true
Col_Hige = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_leg",
    Node1 = "bn_l_leg",
    Pos0 = {
      -0.025,
      -0.045,
      0.3
    },
    Pos1 = {
      0,
      -0.02,
      0
    },
    Rad = 0.09
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_leg",
    Node1 = "bn_r_leg",
    Pos0 = {
      0.025,
      -0.045,
      0.3
    },
    Pos1 = {
      0,
      -0.02,
      0
    },
    Rad = 0.09
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_leg",
    Node1 = "bn_l_leg",
    Pos0 = {
      -0.05,
      -0.05,
      0.5
    },
    Pos1 = {
      0,
      0,
      0
    },
    Rad = 0.07
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_leg",
    Node1 = "bn_r_leg",
    Pos0 = {
      0.05,
      -0.05,
      0.5
    },
    Pos1 = {
      0,
      0,
      0
    },
    Rad = 0.07
  }
}
L0_0.Dbg_IsDisp = true
Col_Suso = L0_0
L0_0 = {
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.05,
    ColRad = 0.01,
    {
      "bn_l_beard_a0_xe01"
    },
    {
      "bn_l_beard_a1_xe01",
      ColRad = 0.015
    },
    {
      "bn_l_beard_a2_xe01",
      ColRad = 0.015
    },
    {
      "bn_l_beard_a3_xe01",
      ColRad = 0.015
    },
    {
      "bn_l_beard_a4_xe01"
    },
    {
      "dm_l_beard_a5_xe01"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.05,
    ColRad = 0.01,
    {
      "bn_r_beard_a0_xe01"
    },
    {
      "bn_r_beard_a1_xe01",
      ColRad = 0.015
    },
    {
      "bn_r_beard_a2_xe01",
      ColRad = 0.015
    },
    {
      "bn_r_beard_a3_xe01",
      ColRad = 0.015
    },
    {
      "bn_r_beard_a4_xe01"
    },
    {
      "dm_r_beard_a5_xe01"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.01,
    ColRad = 0.01,
    {
      "bn_l_beard_d0_xe01"
    },
    {
      "bn_l_beard_d1_xe01",
      AnimRate = 0.2
    },
    {
      "bn_l_beard_d2_xe01",
      AnimRate = 0.1
    },
    {
      "dm_l_beard_d3_xe01"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.05,
    ColRad = 0.01,
    {
      "bn_r_beard_d0_xe01"
    },
    {
      "bn_r_beard_d1_xe01",
      AnimRate = 0.2
    },
    {
      "bn_r_beard_d2_xe01",
      AnimRate = 0.1
    },
    {
      "dm_r_beard_d3_xe01"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.1,
    ColRad = 0.01,
    {
      "bn_l_beard_c0_xe01"
    },
    {
      "bn_l_beard_c1_xe01"
    },
    {
      "dm_l_beard_c2_xe01"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.1,
    ColRad = 0.01,
    {
      "bn_l_beard_b0_xe01"
    },
    {
      "bn_l_beard_b1_xe01"
    },
    {
      "dm_l_beard_b2_xe01"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.1,
    ColRad = 0.01,
    {
      "bn_r_beard_b0_xe01"
    },
    {
      "bn_r_beard_b1_xe01"
    },
    {
      "dm_r_beard_b2_xe01"
    }
  },
  {
    Type = kYm_Type_Himo,
    Collision = Col_Hige,
    GrvRate = HairG,
    AirReg = HairAR,
    AnimRate = 0.1,
    ColRad = 0.01,
    {
      "bn_r_beard_c0_xe01"
    },
    {
      "bn_r_beard_c1_xe01"
    },
    {
      "dm_r_beard_c2_xe01"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    Width = 0.01,
    GrvRate = 0,
    AirRegV = 0.4,
    AirRegP = 0.2,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_robe_head",
      Width = 0.16,
      AnimRate = 1
    },
    {
      "dm_robe_head",
      Width = 0.03,
      AnimRate = 0.5
    }
  },
  {
    Dbg_IsDispBody = true,
    Type = kYm_Type_Cloth,
    Collision = Col_Suso,
    IsTube = true,
    CalLoopNum = 4,
    IsFitLen = true,
    IsLastCol = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.5,
    BeneChijimiX = 0.2,
    BeneNobiX = 1.0E-4,
    ColPowXHalf = 0.2,
    Width = 0.1,
    GrvRate = 0.2,
    AirRegV = 0.6,
    AirRegP = 0.2,
    AnimRate = 0.03,
    ColRad = 0,
    StraightPowZ = 0.2,
    {
      {
        "bn_l_robe_fr_a0_xe01"
      },
      {
        "bn_l_robe_fr_a1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_l_robe_fr_a2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_l_robe_fr_a3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_l_robe_fr_b0_xe01"
      },
      {
        "bn_l_robe_fr_b1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_l_robe_fr_b2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_l_robe_fr_b3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_l_robe_si_a0_xe01"
      },
      {
        "bn_l_robe_si_a1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_l_robe_si_a2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_l_robe_si_a3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_l_robe_si_b0_xe01"
      },
      {
        "bn_l_robe_si_b1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_l_robe_si_b2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_l_robe_si_b3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_l_robe_ba_a0_xe01"
      },
      {
        "bn_l_robe_ba_a1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_l_robe_ba_a2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_l_robe_ba_a3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_r_robe_ba_a0_xe01"
      },
      {
        "bn_r_robe_ba_a1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_r_robe_ba_a2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_r_robe_ba_a3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_r_robe_si_b0_xe01"
      },
      {
        "bn_r_robe_si_b1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_r_robe_si_b2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_r_robe_si_b3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_r_robe_si_a0_xe01"
      },
      {
        "bn_r_robe_si_a1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_r_robe_si_a2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_r_robe_si_a3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_r_robe_fr_b0_xe01"
      },
      {
        "bn_r_robe_fr_b1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_r_robe_fr_b2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_r_robe_fr_b3_xe01",
        AnimRate = SusoAnimRate2
      }
    },
    {
      {
        "bn_r_robe_fr_a0_xe01"
      },
      {
        "bn_r_robe_fr_a1_xe01",
        AnimRate = SusoAnimRate0
      },
      {
        "bn_r_robe_fr_a2_xe01",
        AnimRate = SusoAnimRate1
      },
      {
        "dm_r_robe_fr_a3_xe01",
        AnimRate = SusoAnimRate2
      }
    }
  }
}
L0_0.Dbg_IsDispBody = true
Ym_Xer01 = L0_0
