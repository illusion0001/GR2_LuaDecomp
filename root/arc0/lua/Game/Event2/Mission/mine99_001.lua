dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_001"
_floor_num = 1
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
  L4_5 = "pi_a_23"
  L5_6 = "pi_a_25"
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
    _total_enemy_count = L1_2
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    repeat
      L1_2()
    until L1_2 <= 0
    L1_2(L2_3)
    L1_2(L2_3, L3_4)
    L1_2()
    L1_2()
    repeat
      L1_2()
    until L1_2
    L1_2()
    L1_2()
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
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_8))
    end
  else
    L1_8 = print
    L1_8(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_7))
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
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L1_10))
    end
  else
    L1_10 = print
    L1_10(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_9))
  end
end
function requestEnemyRandomSpawn(A0_11, A1_12)
  local L2_13
  L2_13 = RandI
  L2_13 = L2_13(1, A1_12)
  if findGameObject2("EnemyGenerator", A0_11) ~= nil and findGameObject2("EnemyGenerator", A0_11):getSpecTable() ~= nil and findGameObject2("EnemyGenerator", A0_11):getSpecTable().setData ~= nil then
    if L2_13 > table.maxn(findGameObject2("EnemyGenerator", A0_11):getSpecTable().setData) then
      L2_13 = table.maxn(findGameObject2("EnemyGenerator", A0_11):getSpecTable().setData)
    end
    if findGameObject2("EnemyGenerator", A0_11):getSpecTable().setData[L2_13] ~= nil then
      findGameObject2("EnemyGenerator", A0_11):getSpecTable().spawnSet = findGameObject2("EnemyGenerator", A0_11):getSpecTable().setData[L2_13]
      findGameObject2("EnemyGenerator", A0_11):requestSpawn()
    end
  else
    print("\230\149\181\233\133\141\231\189\174\227\131\134\227\131\188\227\131\150\227\131\171\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147")
  end
  return L2_13
end
enmgen2_pi_a_22 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "runner_strong",
        locator = "locator_pi_a_22_01",
        name = "ene001"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_22_02",
        name = "ene002"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_03",
        name = "ene003"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_22_04",
        name = "ene004"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_05",
        name = "ene005"
      },
      {
        type = "runner_strong",
        locator = "locator_pi_a_22_06",
        name = "ene006"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_22_07",
        name = "ene007"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_22_08",
        name = "ene008"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_22_09",
        name = "ene009"
      },
      {
        type = "guardcore_strong",
        locator = "locator_pi_a_22_10",
        name = "ene010"
      }
    },
    {
      {
        type = "runner_strong",
        locator = "locator_pi_a_22_01",
        name = "ene001"
      },
      {
        type = "imp_strong",
        locator = "locator_pi_a_22_02",
        name = "ene002"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_03",
        name = "ene003"
      },
      {
        type = "imp_strong",
        locator = "locator_pi_a_22_04",
        name = "ene004"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_05",
        name = "ene005"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_06",
        name = "ene006"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_22_07",
        name = "ene007"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_22_08",
        name = "ene008"
      },
      {
        type = "imp_strong",
        locator = "locator_pi_a_22_09",
        name = "ene009"
      },
      {
        type = "runner_strong",
        locator = "locator_pi_a_22_10",
        name = "ene010"
      }
    },
    {
      {
        type = "runner_strong",
        locator = "locator_pi_a_22_01",
        name = "ene001"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_22_02",
        name = "ene002"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_03",
        name = "ene003"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_22_04",
        name = "ene004"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_05",
        name = "ene005"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_22_06",
        name = "ene006"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_22_07",
        name = "ene007"
      },
      {
        type = "treecannon_strong",
        locator = "locator_pi_a_22_08",
        name = "ene008"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_22_09",
        name = "ene009"
      },
      {
        type = "giant_weak",
        locator = "locator_pi_a_22_10",
        name = "ene010"
      }
    }
  },
  onUpdate = function(A0_14)
    local L1_15
  end,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  onObjectAsh = function(A0_22, A1_23)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end
}
enmgen2_pi_a_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_03_01",
      name = "ene_pi_a_03_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_03_02",
      name = "ene_pi_a_03_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_03_03",
      name = "ene_pi_a_03_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_03_04",
      name = "ene_pi_a_03_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_03_05",
      name = "ene_pi_a_03_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_03_06",
      name = "ene_pi_a_03_06"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onPopGem = function(A0_30, A1_31)
    EnemeyDropGem(A0_30, A1_31)
  end,
  onObjectAsh = function(A0_32, A1_33)
  end,
  onObjectDead = function(A0_34, A1_35)
  end
}
enmgen2_pi_a_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_06_01",
      name = "ene_pi_a_06_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_06_02",
      name = "ene_pi_a_06_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_06_03",
      name = "ene_pi_a_06_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_06_04",
      name = "ene_pi_a_06_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_06_05",
      name = "ene_pi_a_06_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_06_06",
      name = "ene_pi_a_06_06"
    }
  },
  onUpdate = function(A0_36)
    local L1_37
  end,
  onEnter = function(A0_38)
    local L1_39
  end,
  onLeave = function(A0_40)
    local L1_41
  end,
  onPopGem = function(A0_42, A1_43)
    EnemeyDropGem(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
  end,
  onObjectDead = function(A0_46, A1_47)
  end
}
enmgen2_pi_a_16 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_16_01",
      name = "ene_pi_a_16_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_16_02",
      name = "ene_pi_a_16_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_16_03",
      name = "ene_pi_a_16_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_16_04",
      name = "ene_pi_a_16_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_16_05",
      name = "ene_pi_a_16_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_16_06",
      name = "ene_pi_a_16_06"
    }
  },
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onPopGem = function(A0_54, A1_55)
    EnemeyDropGem(A0_54, A1_55)
  end,
  onObjectAsh = function(A0_56, A1_57)
  end,
  onObjectDead = function(A0_58, A1_59)
  end
}
enmgen2_pi_a_23 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_23_01",
      name = "ene_pi_a_23_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_23_02",
      name = "ene_pi_a_23_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_23_03",
      name = "ene_pi_a_23_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_23_04",
      name = "ene_pi_a_23_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_23_05",
      name = "ene_pi_a_23_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_23_06",
      name = "ene_pi_a_23_06"
    }
  },
  onUpdate = function(A0_60)
    local L1_61
  end,
  onEnter = function(A0_62)
    local L1_63
  end,
  onLeave = function(A0_64)
    local L1_65
  end,
  onPopGem = function(A0_66, A1_67)
    EnemeyDropGem(A0_66, A1_67)
  end,
  onObjectAsh = function(A0_68, A1_69)
  end,
  onObjectDead = function(A0_70, A1_71)
  end
}
enmgen2_pi_a_25 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_25_01",
      name = "ene_pi_a_25_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_25_02",
      name = "ene_pi_a_25_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_25_03",
      name = "ene_pi_a_25_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_25_04",
      name = "ene_pi_a_25_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_25_05",
      name = "ene_pi_a_25_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_25_06",
      name = "ene_pi_a_25_06"
    }
  },
  onUpdate = function(A0_72)
    local L1_73
  end,
  onEnter = function(A0_74)
    local L1_75
  end,
  onLeave = function(A0_76)
    local L1_77
  end,
  onPopGem = function(A0_78, A1_79)
    EnemeyDropGem(A0_78, A1_79)
  end,
  onObjectAsh = function(A0_80, A1_81)
  end,
  onObjectDead = function(A0_82, A1_83)
  end
}
