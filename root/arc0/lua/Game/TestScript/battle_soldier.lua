import("Font")
import("Player")
import("Debug")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
enmgen2_area_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_01_09",
      name = "area_01_09"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_10",
      name = "area_01_10"
    },
    {
      type = "officer_rifle",
      locator = "locator_01_11",
      name = "area_01_11"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_12",
      name = "area_01_12"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_11",
      name = "area_01_13"
    }
  },
  addSpawnSetName = "spawnSetSoldier",
  spawnSetSoldier = {
    {
      type = "soldier_rifle",
      locator = "locator_01_09",
      name = "area_01_14"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_10",
      name = "area_01_15"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_11",
      name = "area_01_16"
    },
    {
      type = "soldier_rifle",
      locator = "locator_01_12",
      name = "area_01_17"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    enmgen2_area_01.enemyDeadNum = enmgen2_area_01.enemyDeadNum + 1
    if enmgen2_area_01.getEnemyDeadNum() == enmgen2_area_01.getEnemyMax() then
      enemy_gen = findGameObject2("EnemyGenerator", "enmgen2_area_04")
      enemy_gen:requestSpawn()
    end
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_10, L1_11
    L0_10 = enmgen2_area_01
    L0_10 = L0_10.spawnSet
    L0_10 = #L0_10
    return L0_10
  end,
  getEnemyDeadNum = function()
    local L1_12
    L1_12 = enmgen2_area_01
    L1_12 = L1_12.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13)
    local L1_14
    L1_14 = enmgen2_area_01
    L1_14 = L1_14.spawnSet
    L1_14 = L1_14[A0_13]
    L1_14 = L1_14.name
    return L1_14
  end
}
enmgen2_area_02 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_02_04",
      name = "area_02_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_02_06",
      name = "area_02_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_02_07",
      name = "area_02_07"
    },
    {
      type = "officer_launcher",
      locator = "locator_02_10",
      name = "area_02_10"
    }
  },
  onUpdate = function(A0_15)
    local L1_16
  end,
  onEnter = function(A0_17)
    local L1_18
  end,
  onLeave = function(A0_19)
    local L1_20
  end,
  onObjectDead = function(A0_21, A1_22)
  end,
  onObjectAsh = function(A0_23, A1_24)
    local L3_25
    L3_25 = enmgen2_area_02
    L3_25.enemyDeadNum = enmgen2_area_02.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_26, L1_27
    L0_26 = enmgen2_area_02
    L0_26 = L0_26.spawnSet
    L0_26 = #L0_26
    return L0_26
  end,
  getEnemyDeadNum = function()
    local L1_28
    L1_28 = enmgen2_area_02
    L1_28 = L1_28.enemyDeadNum
    return L1_28
  end,
  getEnemyName = function(A0_29)
    local L1_30
    L1_30 = enmgen2_area_02
    L1_30 = L1_30.spawnSet
    L1_30 = L1_30[A0_29]
    L1_30 = L1_30.name
    return L1_30
  end
}
enmgen2_area_03 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_03_01",
      name = "area_03_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_03_02",
      name = "area_03_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_03_03",
      name = "area_03_03"
    },
    {
      type = "soldier_rifle",
      locator = "locator_03_04",
      name = "area_03_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_03_05",
      name = "area_03_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_03_06",
      name = "area_03_06"
    }
  },
  onUpdate = function(A0_31)
    local L1_32
  end,
  onEnter = function(A0_33)
    local L1_34
  end,
  onLeave = function(A0_35)
    local L1_36
  end,
  onObjectDead = function(A0_37, A1_38)
  end,
  onObjectAsh = function(A0_39, A1_40)
    local L3_41
    L3_41 = enmgen2_area_03
    L3_41.enemyDeadNum = enmgen2_area_03.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_42, L1_43
    L0_42 = enmgen2_area_03
    L0_42 = L0_42.spawnSet
    L0_42 = #L0_42
    return L0_42
  end,
  getEnemyDeadNum = function()
    local L1_44
    L1_44 = enmgen2_area_03
    L1_44 = L1_44.enemyDeadNum
    return L1_44
  end,
  getEnemyName = function(A0_45)
    local L1_46
    L1_46 = enmgen2_area_03
    L1_46 = L1_46.spawnSet
    L1_46 = L1_46[A0_45]
    L1_46 = L1_46.name
    return L1_46
  end
}
enmgen2_area_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_04_01",
      name = "area_04_01"
    },
    {
      type = "mechsmall",
      locator = "locator_04_02",
      name = "area_04_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_04_01",
      name = "area_04_04",
      target_vehicle = "area_04_01"
    },
    {
      type = "officer_rifle",
      locator = "locator_04_02",
      name = "area_04_05",
      target_vehicle = "area_04_02"
    }
  },
  onUpdate = function(A0_47)
    local L1_48
  end,
  onEnter = function(A0_49)
    local L1_50
  end,
  onLeave = function(A0_51)
    local L1_52
  end,
  onObjectDead = function(A0_53, A1_54)
  end,
  onObjectAsh = function(A0_55, A1_56)
    local L3_57
    L3_57 = enmgen2_area_04
    L3_57.enemyDeadNum = enmgen2_area_04.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_58, L1_59
    L0_58 = enmgen2_area_04
    L0_58 = L0_58.spawnSet
    L0_58 = #L0_58
    return L0_58
  end,
  getEnemyDeadNum = function()
    local L1_60
    L1_60 = enmgen2_area_04
    L1_60 = L1_60.enemyDeadNum
    return L1_60
  end,
  getEnemyName = function(A0_61)
    local L1_62
    L1_62 = enmgen2_area_04
    L1_62 = L1_62.spawnSet
    L1_62 = L1_62[A0_61]
    L1_62 = L1_62.name
    return L1_62
  end
}
enmgen2_area_05 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_05_01",
      name = "area_05_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_05_02",
      name = "area_05_02"
    },
    {
      type = "officer_rifle",
      locator = "locator_05_03",
      name = "area_05_03"
    },
    {
      type = "mechsmall",
      locator = "locator_05_08",
      name = "area_05_08"
    },
    {
      type = "mechsmall",
      locator = "locator_05_09",
      name = "area_05_09"
    },
    {
      type = "mechsmall",
      locator = "locator_05_10",
      name = "area_05_10"
    },
    {
      type = "mechsmall",
      locator = "locator_05_11",
      name = "area_05_11"
    },
    {
      type = "soldier_launcher",
      locator = "locator_05_12",
      name = "area_05_12"
    },
    {
      type = "officer_rifle",
      locator = "locator_05_08",
      name = "area_05_13",
      target_vehicle = "area_05_08"
    },
    {
      type = "officer_rifle",
      locator = "locator_05_09",
      name = "area_05_14",
      target_vehicle = "area_05_09"
    },
    {
      type = "officer_rifle",
      locator = "locator_05_10",
      name = "area_05_15",
      target_vehicle = "area_05_10"
    },
    {
      type = "officer_rifle",
      locator = "locator_05_11",
      name = "area_05_16",
      target_vehicle = "area_05_11"
    }
  },
  addSpawnSetName = "spawnSetSoldier",
  spawnSetSoldier = {
    {
      type = "soldier_rifle",
      locator = "locator_05_04",
      name = "area_05_04"
    },
    {
      type = "soldier_rifle",
      locator = "locator_05_05",
      name = "area_05_05"
    },
    {
      type = "soldier_rifle",
      locator = "locator_05_06",
      name = "area_05_06"
    },
    {
      type = "soldier_rifle",
      locator = "locator_05_07",
      name = "area_05_07"
    }
  },
  onUpdate = function(A0_63)
    local L1_64
  end,
  onEnter = function(A0_65)
    local L1_66
  end,
  onLeave = function(A0_67)
    local L1_68
  end,
  onObjectDead = function(A0_69, A1_70)
  end,
  onObjectAsh = function(A0_71, A1_72)
    local L3_73
    L3_73 = enmgen2_area_05
    L3_73.enemyDeadNum = enmgen2_area_05.enemyDeadNum + 1
  end,
  onObjectAsh = function(A0_74, A1_75)
    local L3_76
    L3_76 = enmgen2_area_01
    L3_76.enemyDeadNum = enmgen2_area_01.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_77, L1_78
    L0_77 = enmgen2_area_05
    L0_77 = L0_77.spawnSet
    L0_77 = #L0_77
    return L0_77
  end,
  getEnemyDeadNum = function()
    local L1_79
    L1_79 = enmgen2_area_05
    L1_79 = L1_79.enemyDeadNum
    return L1_79
  end,
  getEnemyName = function(A0_80)
    local L1_81
    L1_81 = enmgen2_area_05
    L1_81 = L1_81.spawnSet
    L1_81 = L1_81[A0_80]
    L1_81 = L1_81.name
    return L1_81
  end
}
enmgen2_area_06 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "thug",
      locator = "locator_06_01",
      name = "area_06_01"
    },
    {
      type = "thug",
      locator = "locator_06_03",
      name = "area_06_03"
    },
    {
      type = "thug",
      locator = "locator_06_05",
      name = "area_06_05"
    }
  },
  onUpdate = function(A0_82)
    local L1_83
  end,
  onEnter = function(A0_84)
    local L1_85
  end,
  onLeave = function(A0_86)
    local L1_87
  end,
  onObjectDead = function(A0_88, A1_89)
  end,
  onObjectAsh = function(A0_90, A1_91)
    local L3_92
    L3_92 = enmgen2_area_06
    L3_92.enemyDeadNum = enmgen2_area_06.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_93, L1_94
    L0_93 = enmgen2_area_06
    L0_93 = L0_93.spawnSet
    L0_93 = #L0_93
    return L0_93
  end,
  getEnemyDeadNum = function()
    local L1_95
    L1_95 = enmgen2_area_06
    L1_95 = L1_95.enemyDeadNum
    return L1_95
  end,
  getEnemyName = function(A0_96)
    local L1_97
    L1_97 = enmgen2_area_06
    L1_97 = L1_97.spawnSet
    L1_97 = L1_97[A0_96]
    L1_97 = L1_97.name
    return L1_97
  end
}
function create_boxset(A0_98, A1_99, A2_100)
  local L3_101, L4_102
  L3_101 = A2_100
  L4_102 = createGameObject2
  L4_102 = L4_102("GimmickBg")
  L4_102:setName(L3_101)
  L4_102:setDrawModelName(L3_101)
  L4_102:setCollisionName(L3_101)
  L4_102:setAttributeName(L3_101)
  L4_102:setPos(Vector(0, 0, 0))
  L4_102:setForceMove()
  L4_102:try_init()
  L4_102:waitForReady()
  L4_102:try_start()
  findGameObject2("Node", A1_99):appendChild(L4_102)
  return L4_102
end
function Initialize()
  local L0_103, L1_104
  L0_103 = Fn_getPlayer
  L0_103 = L0_103()
  L1_104 = Player
  L1_104 = L1_104.setEnergy
  L1_104(L1_104, Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  L1_104 = Player
  L1_104 = L1_104.setEnergy
  L1_104(L1_104, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  L1_104 = Player
  L1_104 = L1_104.setEnergy
  L1_104(L1_104, Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  L1_104 = {
    {
      name = "gorotuki_01",
      type = "man27",
      node = "locator2_66_01",
      emeny = true
    },
    {
      name = "gorotuki_03",
      type = "man27",
      node = "locator2_66_03",
      emeny = true
    },
    {
      name = "gorotuki_05",
      type = "man27",
      node = "locator2_66_05",
      emeny = true
    }
  }
  Fn_setupChara(L1_104)
  for _FORV_7_ = 1, #L1_104 do
    ;({})[_FORV_7_] = Fn_findChara(L1_104[_FORV_7_].name)
    ;({})[_FORV_7_] = ({})[_FORV_7_]:getPuppet()
    ;({})[_FORV_7_]:changeEnemy()
  end
  create_boxset("po_a_01", "locator2_test_01", "cisteelpipe01_base")
  create_boxset("po_a_01", "locator2_test_02", "cisteelpipe01_base")
  create_boxset("po_a_01", "locator2_test_03", "cisteelpipe01_base")
  create_boxset("po_a_01", "locator2_test_04", "cisteelpipe01_base")
  create_boxset("po_a_01", "locator2_test_05", "cisteelpipe01_base")
  create_boxset("po_a_01", "locator2_test_06", "cisteelpipe01_base")
end
function Ingame()
  local L0_105
  L0_105 = nil
  Fn_missionStart()
  L0_105 = findGameObject2("EnemyGenerator", "enmgen2_area_01")
  L0_105:requestSpawn()
end
function Finalize()
  local L0_106, L1_107
end
