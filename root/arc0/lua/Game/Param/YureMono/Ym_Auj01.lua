L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      0.045,
      0.065,
      0.05
    },
    Rad = 0.135
  },
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      -0.045,
      0.065,
      0.05
    },
    Rad = 0.135
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.065,
      0.035,
      0
    },
    Pos1 = {
      0.065,
      0.035,
      -0.005
    },
    Rad = 0.14
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_l_thigh",
    Pos0 = {
      0.075,
      0,
      0.02
    },
    Pos1 = {
      -0.025,
      0.035,
      0.16
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Node1 = "bn_r_thigh",
    Pos0 = {
      -0.075,
      0,
      0.02
    },
    Pos1 = {
      0.025,
      0.035,
      0.16
    },
    Rad = 0.105
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Node1 = "bn_l_thigh",
    Pos0 = {
      -0.01,
      0.06,
      -0.055
    },
    Pos1 = {
      -0.005,
      0.06,
      0.055
    },
    Rad = 0.095
  }
}
L0_0.Dbg_IsDisp = true
Col_Suso = L0_0
L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_pelvis_end",
    Pos = {
      -0.125,
      0.1,
      -0.155
    },
    Rad = 0.39
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_l_thigh",
    Node1 = "bn_l_thigh",
    Pos0 = {
      -0.025,
      0.025,
      0.01
    },
    Pos1 = {
      -0.055,
      0.025,
      0.405
    },
    Rad = 0.115
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_thigh",
    Node1 = "bn_r_thigh",
    Pos0 = {
      0.025,
      0.025,
      0.01
    },
    Pos1 = {
      0.055,
      0.025,
      0.405
    },
    Rad = 0.115
  }
}
Col_KoshiHimo = L0_0
L0_0 = 0.3
Ym_Auj01 = {
  Dbg_IsDispBody = true,
  {
    Type = kYm_Type_Cloth,
    Collision = Col_Suso,
    IsTube = false,
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimiZ = 1,
    BeneNobiZ = 0.3,
    BeneChijimiX = 0.8,
    BeneNobiX = 0.1,
    ColPowXHalf = 0.2,
    Width = 0.1,
    GrvRate = 1,
    AirReg = 0.3,
    AnimRate = 0.01,
    ColRad = 0.01,
    StraightPowZ = 0.2,
    {
      {
        "bn_l_Jacket_fr_a0_au01"
      },
      {
        "bn_l_Jacket_fr_a1_au01",
        AnimRate = L0_0
      },
      {
        "dm_l_Jacket_fr_a2_au01"
      }
    },
    {
      {
        "bn_l_Jacket_fr_b0_au01"
      },
      {
        "bn_l_Jacket_fr_b1_au01",
        AnimRate = L0_0
      },
      {
        "dm_l_Jacket_fr_b2_au01"
      }
    },
    {
      {
        "bn_l_Jacket_si_a0_au01"
      },
      {
        "bn_l_Jacket_si_a1_au01",
        AnimRate = L0_0
      },
      {
        "dm_l_Jacket_si_a2_au01"
      }
    },
    {
      {
        "bn_l_Jacket_si_b0_au01"
      },
      {
        "bn_l_Jacket_si_b1_au01",
        AnimRate = L0_0
      },
      {
        "dm_l_Jacket_si_b2_au01"
      }
    },
    {
      {
        "bn_b_Jacket0_au01"
      },
      {
        "bn_b_Jacket1_au01",
        AnimRate = L0_0
      },
      {
        "dm_b_Jacket2_au01"
      }
    },
    {
      {
        "bn_r_Jacket_si_b0_au01"
      },
      {
        "bn_r_Jacket_si_b1_au01",
        AnimRate = L0_0
      },
      {
        "dm_r_Jacket_si_b2_au01"
      }
    },
    {
      {
        "bn_r_Jacket_si_a0_au01"
      },
      {
        "bn_r_Jacket_si_a1_au01",
        AnimRate = L0_0
      },
      {
        "dm_r_Jacket_si_a2_au01"
      }
    },
    {
      {
        "bn_r_Jacket_fr_b0_au01"
      },
      {
        "bn_r_Jacket_fr_b1_au01",
        AnimRate = L0_0
      },
      {
        "dm_r_Jacket_fr_b2_au01"
      }
    },
    {
      {
        "bn_r_Jacket_fr_a0_au01"
      },
      {
        "bn_r_Jacket_fr_a1_au01",
        AnimRate = L0_0
      },
      {
        "dm_r_Jacket_fr_a2_au01"
      }
    }
  },
  {
    Type = kYm_Type_KitScarf,
    Collision = Col_KoshiHimo,
    Width = 0.01,
    GrvRate = 1,
    AirRegV = 0.1,
    AirRegP = 0.01,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_band_a0_au01"
    },
    {
      "bn_band_a1_au01"
    },
    {
      "bn_band_a2_au01"
    },
    {
      "bn_band_a3_au01"
    },
    {
      "dm_band_a4_au01"
    }
  },
  {
    Type = kYm_Type_KitScarf,
    Collision = Col_KoshiHimo,
    Width = 0.01,
    GrvRate = 1,
    AirRegV = 0.1,
    AirRegP = 0.01,
    AnimRate = 0,
    ColRad = 0.01,
    {
      "bn_band_b0_au01"
    },
    {
      "bn_band_b1_au01"
    },
    {
      "bn_band_b2_au01"
    },
    {
      "bn_band_b3_au01"
    },
    {
      "dm_band_b4_au01"
    }
  }
}
