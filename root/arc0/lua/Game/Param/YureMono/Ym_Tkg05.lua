L0_0 = {
  {
    Type = kYm_ColType_Sphere,
    Node = "bn_spine0",
    Pos = {
      0,
      0,
      0.24
    },
    Rad = 0.415
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_r_arm",
    Pos0 = {
      0,
      0,
      0.265
    },
    Node1 = "bn_r_forearm",
    Pos1 = {
      0,
      0,
      0.43
    },
    Rad = 0.125
  },
  {
    Type = kYm_ColType_Cupsle,
    Node0 = "bn_pelvis_end",
    Pos0 = {
      -0.05,
      0.02,
      0
    },
    Node1 = "bn_r_thigh",
    Pos1 = {
      0.11,
      0,
      0.47
    },
    Rad = 0.24
  }
}
L0_0.Dbg_IsDisp = true
Ym_Tkg05_Col = L0_0
L0_0 = {
  {
    Type = kYm_Type_Himo,
    CalLoopNum = 4,
    IsAnimPowerful = true,
    IsFitLen = false,
    InvalidRateGp = {"ym_ir_all"},
    Collision = Ym_Tkg05_Col,
    GrvRate = 1,
    AirReg = 0.1,
    AnimRate = 0,
    ColRad = 0.05,
    StraightPow = 0.7,
    {"bn_tube00"},
    {"bn_tube01", AnimRate = 1},
    {"bn_tube02"},
    {"bn_tube03"},
    {"bn_tube04"},
    {"bn_tube05"},
    {"bn_tube06"},
    {"bn_tube07"},
    {"bn_tube08"},
    {"bn_tube09"},
    {"bn_tube10"},
    {
      "bn_tube11",
      AnimRate = 1,
      RefNode = "loc_attach_point_00"
    }
  }
}
L0_0.Dbg_DispUserChannel = {
  "ym_ir__master_value",
  "ym_ir__master_rate",
  "ym_ir_all"
}
Ym_Tkg05 = L0_0
