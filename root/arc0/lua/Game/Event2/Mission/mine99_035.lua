dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_035"
_floor_num = 35
_MAX_ENEMY = 10
_total_enemy_count = _MAX_ENEMY
function InitializeBody()
  local L0_0
  L0_0 = {}
  L0_0.mineOreEvdName = "mine01_ore"
  L0_0.instance_flg = true
  L0_0.manager_name = g_own:getName()
  L0_0.deploy_areas = getElectedAreaNames()
  L0_0.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_0
end
function IngameBody()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = {
    L1_2,
    L2_3,
    L3_4,
    L4_5,
    L5_6
  }
  L4_5 = "pi_a_19"
  L5_6 = "pi_a_20"
  L1_2()
  L1_2()
  L1_2()
  L1_2(L2_3)
  if L1_2 then
    L1_2(L2_3)
  else
    L1_2(L2_3)
    repeat
      L1_2()
    until L1_2
    L1_2()
    L4_5 = nil
    L5_6 = true
    L1_2(L2_3, L3_4, L4_5, L5_6)
    for L4_5, L5_6 in L1_2(L2_3) do
      requestEnemyKill(L5_6)
    end
    L4_5 = 1
    L5_6 = 0
    L1_2(L2_3, L3_4, L4_5, L5_6, 99999)
    L1_2(L2_3, L3_4)
    L2_3(L3_4)
    _total_enemy_count = L2_3
    L4_5 = "ic_pi_mine99_002"
    L2_3(L3_4, L4_5)
    L4_5 = HUD
    L4_5 = L4_5.kCount99_99IconType_Stone
    L2_3(L3_4, L4_5)
    L4_5 = _total_enemy_count
    L2_3(L3_4, L4_5)
    L4_5 = true
    L2_3(L3_4, L4_5)
    L2_3(L3_4)
    repeat
      L2_3()
    until L2_3 <= 0
    L2_3(L3_4)
    L2_3(L3_4)
    L4_5 = Player
    L4_5 = L4_5.kParam_GravPowConsumFactor
    L5_6 = 1
    L2_3(L3_4, L4_5, L5_6, 1, 0)
    L4_5 = false
    L2_3(L3_4, L4_5)
    L2_3()
    L2_3()
    repeat
      L2_3()
    until L2_3
    L2_3()
    L2_3()
  end
  L1_2(L2_3)
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
function requestEnemySpawn(A0_7)
  local L1_8
  L1_8 = Fn_findAreaHandle
  L1_8 = L1_8(A0_7)
  if L1_8 ~= nil then
    L1_8 = "enmgen2_"
    L1_8 = L1_8 .. A0_7
    if findGameObject2("EnemyGenerator", L1_8) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\135\186\231\143\190\227\129\149\227\129\155\227\129\190\227\129\153\227\128\130", L1_8))
      findGameObject2("EnemyGenerator", L1_8):requestSpawn()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_8))
    end
  else
    L1_8 = print
    L1_8(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_7))
  end
end
function requestEnemyKill(A0_9)
  local L1_10
  L1_10 = Fn_findAreaHandle
  L1_10 = L1_10(A0_9)
  if L1_10 ~= nil then
    L1_10 = "enmgen2_"
    L1_10 = L1_10 .. A0_9
    if findGameObject2("EnemyGenerator", L1_10) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L1_10))
      findGameObject2("EnemyGenerator", L1_10):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_10))
    end
  else
    L1_10 = print
    L1_10(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_9))
  end
end
enmgen2_pi_a_25 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_mine_12",
      locator = "locator_pi_a_25_01",
      name = "ene001"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_pi_a_25_02",
      name = "ene002"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_pi_a_25_03",
      name = "ene003"
    },
    {
      type = "stalker_mine_12",
      locator = "locator_pi_a_25_04",
      name = "ene004"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_25_05",
      name = "ene005"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_25_06",
      name = "ene006"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_25_07",
      name = "ene007"
    },
    {
      type = "lasercannon_mine_12",
      locator = "locator_pi_a_25_08",
      name = "ene008"
    },
    {
      type = "defender_mine_12",
      locator = "locator_pi_a_25_09",
      name = "ene009"
    },
    {
      type = "treecannon_mine_12",
      locator = "locator_pi_a_25_10",
      name = "ene010"
    }
  },
  onUpdate = function(A0_11)
    local L1_12
  end,
  onEnter = function(A0_13)
    local L1_14
  end,
  onLeave = function(A0_15)
    local L1_16
  end,
  onObjectDead = function(A0_17, A1_18)
  end,
  onObjectAsh = function(A0_19, A1_20)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end
}
enmgen2_pi_a_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_mine_12",
      locator = "locator_pi_a_06_01",
      name = "ene_pi_a_06_01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_06_02",
      name = "ene_pi_a_06_02"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_06_03",
      name = "ene_pi_a_06_03"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_06_04",
      name = "ene_pi_a_06_04"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_06_05",
      name = "ene_pi_a_06_05"
    }
  },
  onUpdate = function(A0_21)
    local L1_22
  end,
  onEnter = function(A0_23)
    local L1_24
  end,
  onLeave = function(A0_25)
    local L1_26
  end,
  onPopGem = function(A0_27, A1_28)
    EnemeyDropGem(A0_27, A1_28)
  end,
  onObjectAsh = function(A0_29, A1_30)
  end,
  onObjectDead = function(A0_31, A1_32)
  end
}
enmgen2_pi_a_16 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant_mine_12",
      locator = "locator_pi_a_16_01",
      name = "ene_pi_a_16_01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_16_02",
      name = "ene_pi_a_16_02"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_16_03",
      name = "ene_pi_a_16_03"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_16_04",
      name = "ene_pi_a_16_04"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_16_05",
      name = "ene_pi_a_16_05"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_16_06",
      name = "ene_pi_a_16_06"
    }
  },
  onUpdate = function(A0_33)
    local L1_34
  end,
  onEnter = function(A0_35)
    local L1_36
  end,
  onLeave = function(A0_37)
    local L1_38
  end,
  onPopGem = function(A0_39, A1_40)
    EnemeyDropGem(A0_39, A1_40)
  end,
  onObjectAsh = function(A0_41, A1_42)
  end,
  onObjectDead = function(A0_43, A1_44)
  end
}
enmgen2_pi_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_02_01",
      name = "ene_pi_a_02_01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_02_02",
      name = "ene_pi_a_02_02"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_02_03",
      name = "ene_pi_a_02_03"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_02_04",
      name = "ene_pi_a_02_04"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_02_05",
      name = "ene_pi_a_02_05"
    }
  },
  onUpdate = function(A0_45)
    local L1_46
  end,
  onEnter = function(A0_47)
    local L1_48
  end,
  onLeave = function(A0_49)
    local L1_50
  end,
  onPopGem = function(A0_51, A1_52)
    EnemeyDropGem(A0_51, A1_52)
  end,
  onObjectAsh = function(A0_53, A1_54)
  end,
  onObjectDead = function(A0_55, A1_56)
  end
}
enmgen2_pi_a_19 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_19_01",
      name = "ene_pi_a_19_01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_19_02",
      name = "ene_pi_a_19_02"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_19_03",
      name = "ene_pi_a_19_03"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_19_04",
      name = "ene_pi_a_19_04"
    }
  },
  onUpdate = function(A0_57)
    local L1_58
  end,
  onEnter = function(A0_59)
    local L1_60
  end,
  onLeave = function(A0_61)
    local L1_62
  end,
  onPopGem = function(A0_63, A1_64)
    EnemeyDropGem(A0_63, A1_64)
  end,
  onObjectAsh = function(A0_65, A1_66)
  end,
  onObjectDead = function(A0_67, A1_68)
  end
}
enmgen2_pi_a_20 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_01",
      name = "ene_pi_a_20_01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_02",
      name = "ene_pi_a_20_02"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_03",
      name = "ene_pi_a_20_03"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_04",
      name = "ene_pi_a_20_04"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_05",
      name = "ene_pi_a_20_05"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_06",
      name = "ene_pi_a_20_06"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_07",
      name = "ene_pi_a_20_07"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_08",
      name = "ene_pi_a_20_08"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_pi_a_20_09",
      name = "ene_pi_a_20_09"
    }
  },
  onUpdate = function(A0_69)
    local L1_70
  end,
  onEnter = function(A0_71)
    local L1_72
  end,
  onLeave = function(A0_73)
    local L1_74
  end,
  onPopGem = function(A0_75, A1_76)
    EnemeyDropGem(A0_75, A1_76)
  end,
  onObjectAsh = function(A0_77, A1_78)
  end,
  onObjectDead = function(A0_79, A1_80)
  end
}
