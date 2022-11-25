L0_0 = {
  {
    Type = kYm_Type_KitScarf,
    InvalidRateGp = {"ym_ir_deco", "ym_ir_all"},
    CalLoopNum = 5,
    IsFitLen = true,
    BeneChijimi = 1,
    BeneNobi = 1,
    BeneChijimiStep = 1,
    BeneNobiStep = 0.2,
    IsMatNoramlise = true,
    Width = 0.12,
    GrvRate = 1,
    AirRegV = 0.1,
    AirRegP = 0.1,
    AnimRate = 0,
    ColRad = 0.03,
    BeneHasu = 1,
    {"bn_bag0", Width = 0.05},
    {
      "bn_bag1",
      Width = 0.12,
      AnimRate = 0.3
    },
    {
      "bn_bag2",
      Width = 0.12,
      AnimRate = 0
    }
  }
}
L0_0.Dbg_IsDispBody = true
L0_0.Dbg_DispNodeA = {
  Size = 0.05,
  {"bn_bag0"},
  {"bn_bag1"},
  {"bn_bag2"}
}
Ym_Cibag04 = L0_0
