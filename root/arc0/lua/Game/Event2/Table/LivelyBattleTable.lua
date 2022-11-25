LIVELY_BATTLE_FT_ON = 1
LIVELY_BATTLE_TABLE = 2
LIVELY_BATTLE_RATIO = 100
LIBELY_RATIO_FT = 1
LIBELY_RATIO_EVE = 2
LIBELY_RATIO_HEX = 3
LIBELY_RATIO_JIL = 4
L0_0 = {
  {
    0,
    0,
    0
  },
  {
    0,
    0,
    0
  },
  {
    0,
    0,
    0
  },
  {
    LIVELY_BATTLE_RATIO,
    0,
    100
  },
  {
    LIVELY_BATTLE_RATIO,
    0,
    100
  },
  {
    LIVELY_BATTLE_RATIO,
    0,
    100
  },
  {
    LIVELY_BATTLE_RATIO,
    0,
    100
  },
  {
    LIVELY_BATTLE_RATIO,
    0,
    100
  },
  {
    LIVELY_BATTLE_RATIO,
    0,
    100
  },
  {
    LIVELY_BATTLE_RATIO,
    0,
    100
  },
  {
    LIVELY_BATTLE_RATIO,
    100,
    0
  },
  {
    LIVELY_BATTLE_RATIO,
    100,
    0
  },
  {
    LIVELY_BATTLE_RATIO,
    100,
    0
  },
  {
    LIVELY_BATTLE_RATIO,
    100,
    0
  },
  {
    LIVELY_BATTLE_RATIO,
    100,
    0
  }
}
lively_Battle_Ratio_Set = L0_0
__battle_end = false
__pcOutRange = false
__nowBattlePlace = ""
__requestPanic = false
__requestNotice = false
__Initialized = false
__AreaInCount = 0
L0_0 = {
  {
    {
      name = "ene_01_01",
      type = "stalker",
      locator = ""
    },
    {
      name = "ene_01_02",
      type = "stalker",
      locator = ""
    },
    {
      name = "ene_01_03",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_04",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_05",
      type = "imp",
      locator = ""
    }
  },
  {
    {
      name = "ene_01_01",
      type = "runner",
      locator = ""
    },
    {
      name = "ene_01_02",
      type = "runner",
      locator = ""
    },
    {
      name = "ene_01_03",
      type = "imp",
      locator = ""
    },
    {
      name = "ene_01_04",
      type = "imp",
      locator = ""
    }
  },
  {
    {
      name = "ene_01_01",
      type = "stalker",
      locator = ""
    },
    {
      name = "ene_01_02",
      type = "stalker",
      locator = ""
    },
    {
      name = "ene_01_03",
      type = "stalker",
      locator = ""
    },
    {
      name = "ene_01_04",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_05",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_06",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_07",
      type = "gellyfish",
      locator = ""
    }
  },
  {
    {
      name = "ene_01_01",
      type = "stalker",
      locator = ""
    },
    {
      name = "ene_01_02",
      type = "stalker",
      locator = ""
    },
    {
      name = "ene_01_03",
      type = "runner",
      locator = ""
    },
    {
      name = "ene_01_04",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_05",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_06",
      type = "imp",
      locator = ""
    }
  },
  {
    {
      name = "ene_01_01",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_02",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_03",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_04",
      type = "gellyfish",
      locator = ""
    },
    {
      name = "ene_01_05",
      type = "imp",
      locator = ""
    },
    {
      name = "ene_01_06",
      type = "imp",
      locator = ""
    }
  }
}
le10battleTable = L0_0
L0_0 = {}
L0_0.enemyTableName = "enmgen2_le10_01"
L0_0.spawnOnStart = false
L0_0.autoPrepare = false
L0_0.spawnSet = {}
function L0_0.onEnter(A0_1)
  if A0_1:getUid() == __nowBattlePlace and __gravitystrom_event then
    print(A0_1:getName() .. " ENTER")
    __pcOutRange = false
  end
end
function L0_0.onLeave(A0_2)
  if A0_2:getUid() == __nowBattlePlace and __gravitystrom_event then
    print(A0_2:getName() .. " LEAVE")
    __pcOutRange = true
  end
end
function L0_0.onSpawn(A0_3, A1_4)
  if __Initialized == false then
    __pcOutRange = false
    __requestPanic = true
    __requestNotice = true
    A0_3:getSpecTable().enemyDeadNum = 0
    __Initialized = true
  end
end
L0_0.enemyDeadNum = 0
function L0_0.onObjectAsh(A0_5, A1_6)
  A0_5:getSpecTable().enemyDeadNum = A0_5:getSpecTable().enemyDeadNum + 1
  if A0_5:getSpecTable().enemyDeadNum >= #A0_5:getSpecTable().spawnSet then
    print("EXIT")
    A0_5:getSpecTable().enemyDeadNum = 0
    __Initialized = false
    __battle_end = true
  end
end
function L0_0.onSetupGem(A0_7, A1_8)
  Fn_enemyPopGemSetup(A0_7, {
    "ene_01_01",
    "ene_01_02",
    "ene_01_03",
    "ene_01_04",
    "ene_01_05"
  }, 5, GEM_VITAL)
end
function L0_0.onPopGem(A0_9, A1_10)
  Fn_enemyAshPopGem(A0_9, A1_10)
end
enmgen2_le10_battle_01 = L0_0
L0_0 = {
  {
    {
      "ft10",
      lively_Battle_Ratio_Set[9][1],
      lively_Battle_Ratio_Set[9][2],
      lively_Battle_Ratio_Set[9][3]
    },
    {
      "enmgen2_le10_po_a_01_01",
      "enmgen2_le10_po_a_02_01",
      "enmgen2_le10_lo_a_05_01",
      "enmgen2_le10_up_a_00_01",
      "enmgen2_le10_up_a_00_02",
      "enmgen2_le10_up_a_00_03",
      "enmgen2_le10_po_a_04_01",
      "enmgen2_le10_po_a_01_02",
      "enmgen2_le10_mi_a_04_01",
      "enmgen2_le10_up_a_00_04",
      "enmgen2_le10_po_a_01_03",
      "enmgen2_le10_po_a_02_02",
      "enmgen2_le10_po_a_02_03",
      "enmgen2_le10_po_a_01_04",
      "enmgen2_le10_po_a_04_02",
      "enmgen2_le10_po_a_15_01",
      "enmgen2_le10_po_a_03_01",
      "enmgen2_le10_po_a_03_02",
      "enmgen2_le10_lo_a_01_01",
      "enmgen2_le10_up_a_00_05",
      "enmgen2_le10_mi_a_21_05_01",
      "enmgen2_le10_mi_a_05_01",
      "enmgen2_le10_mi_a_17_01",
      "enmgen2_le10_mi_a_21_02_01",
      "enmgen2_le10_mi_a_02_01",
      "enmgen2_le10_mi_a_12_01",
      "enmgen2_le10_mi_a_22_03_01",
      "enmgen2_le10_up_a_02_01_01",
      "enmgen2_le10_up_a_04_01_01",
      "enmgen2_le10_up_a_04_02_01",
      "enmgen2_le10_up_a_05_01",
      "enmgen2_le10_up_a_01_01",
      "enmgen2_le10_up_a_02_02_01",
      "enmgen2_le10_up_a_04_03_01"
    }
  },
  {
    {
      "ft11",
      lively_Battle_Ratio_Set[10][1],
      lively_Battle_Ratio_Set[10][2],
      lively_Battle_Ratio_Set[10][3]
    },
    {
      "enmgen2_le10_po_a_01_01",
      "enmgen2_le10_po_a_02_01",
      "enmgen2_le10_lo_a_05_01",
      "enmgen2_le10_up_a_00_01",
      "enmgen2_le10_up_a_00_02",
      "enmgen2_le10_up_a_00_03",
      "enmgen2_le10_po_a_04_01",
      "enmgen2_le10_po_a_01_02",
      "enmgen2_le10_mi_a_04_01",
      "enmgen2_le10_up_a_00_04",
      "enmgen2_le10_po_a_01_03",
      "enmgen2_le10_po_a_02_02",
      "enmgen2_le10_po_a_02_03",
      "enmgen2_le10_po_a_01_04",
      "enmgen2_le10_po_a_04_02",
      "enmgen2_le10_po_a_15_01",
      "enmgen2_le10_po_a_03_01",
      "enmgen2_le10_po_a_03_02",
      "enmgen2_le10_lo_a_01_01",
      "enmgen2_le10_up_a_00_05",
      "enmgen2_le10_mi_a_21_05_01",
      "enmgen2_le10_mi_a_05_01",
      "enmgen2_le10_mi_a_17_01",
      "enmgen2_le10_mi_a_21_02_01",
      "enmgen2_le10_mi_a_02_01",
      "enmgen2_le10_mi_a_12_01",
      "enmgen2_le10_mi_a_22_03_01",
      "enmgen2_le10_up_a_02_01_01",
      "enmgen2_le10_up_a_04_01_01",
      "enmgen2_le10_up_a_04_02_01",
      "enmgen2_le10_up_a_05_01",
      "enmgen2_le10_up_a_01_01",
      "enmgen2_le10_up_a_02_02_01",
      "enmgen2_le10_up_a_04_03_01"
    }
  }
}
setLivelyBattle = L0_0
