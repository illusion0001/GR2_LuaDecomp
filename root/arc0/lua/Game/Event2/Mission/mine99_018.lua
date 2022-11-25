dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_018"
_floor_num = 18
_MAX_ENEMY = 39
_LIMIT_TIME = 120
_total_enemy_count = 0
_isSuccess = false
_isTimerRunning = false
function InitializeBody()
  local L0_0
  L0_0 = {}
  L0_0.mineOreEvdName = "mine02_ore"
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
  _total_enemy_count = 0
  _isSuccess = false
  _isTimerRunning = false
  L0_1 = {
    L1_2,
    L2_3,
    L3_4,
    L4_5,
    L5_6,
    "pi2_a_15",
    "pi2_a_17"
  }
  L4_5 = "pi2_a_13"
  L5_6 = "pi2_a_14"
  L1_2()
  L1_2()
  L1_2()
  L1_2(L2_3)
  if L1_2 then
    L1_2(L2_3)
    L1_2(L2_3)
  else
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3)
    repeat
      L1_2()
    until L1_2
    L4_5 = nil
    L5_6 = true
    L1_2(L2_3, L3_4, L4_5, L5_6)
    L1_2()
    for L4_5, L5_6 in L1_2(L2_3) do
      requestEnemyKill(L5_6)
    end
    _isSuccess = false
    _total_enemy_count = L1_2
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L4_5 = _LIMIT_TIME
    L5_6 = judge
    _isTimerRunning = true
    while true do
      if L2_3 <= 0 then
        _isSuccess = true
        break
      end
      if L2_3 then
        _isSuccess = false
        break
      end
      L2_3()
    end
    L2_3()
    L2_3(L3_4)
    L4_5 = false
    L2_3(L3_4, L4_5)
    L4_5 = false
    L2_3(L3_4, L4_5)
    L2_3()
    if L2_3 then
      L2_3()
      repeat
        L2_3()
      until L2_3
      L2_3()
      L2_3()
      L2_3(L3_4)
    else
      L2_3(L3_4)
    end
  end
end
function FinalizeBody()
  HUD:timerSetVisible(false)
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
function judge()
  if _isSuccess or Fn_getCageStatus() then
    return
  end
  if _total_enemy_count <= 0 then
    waitSeconds(2)
    missionComplete()
    repeat
      wait()
    until isSecondHalfProcessWait()
    setSecondHalfProcessEnd()
    _isSuccess = true
  else
    print(string.format("%d \228\189\147\230\174\139\227\130\138\227\129\190\227\129\151\227\129\159\227\128\130", _total_enemy_count))
    missionFailure()
    repeat
      wait()
    until isFailureProcessEnd()
    abortTimerTask()
    Fn_blackout()
    Fn_retryMine99()
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
function abortTimerTask()
  if _timerTask ~= nil then
    _timerTask:abort()
    _timerTask = nil
  end
  HUD:timerStop()
end
enmgen2_pi2_a_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "lunafishowner",
        locator = "locator_pi2_a_01_01",
        name = "owner001",
        ai_spawn_option = "LunaFishOwner/owner_mine99_18"
      }
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish_mine_11",
      locator = "locator_pi2_a_01_01",
      name = "ene011"
    }
  },
  onSpawn = function(A0_14, A1_15)
  end,
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectAsh = function(A0_22, A1_23)
    local L2_24
    L2_24 = A1_23.getName
    L2_24 = L2_24(A1_23)
    if string.find(L2_24, "owner") == nil then
      HUD:counter999SubNum()
      _total_enemy_count = _total_enemy_count - 1
    end
  end,
  onObjectDead = function(A0_25, A1_26)
  end
}
enmgen2_pi2_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "lunafishowner",
        locator = "locator_pi2_a_01_02",
        name = "owner001",
        ai_spawn_option = "LunaFishOwner/owner_mine99_18"
      }
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish_mine_11",
      locator = "locator_pi2_a_01_02",
      name = "ene012"
    }
  },
  onSpawn = function(A0_27, A1_28)
  end,
  onUpdate = function(A0_29)
    local L1_30
  end,
  onEnter = function(A0_31)
    local L1_32
  end,
  onLeave = function(A0_33)
    local L1_34
  end,
  onObjectAsh = function(A0_35, A1_36)
    local L2_37
    L2_37 = A1_36.getName
    L2_37 = L2_37(A1_36)
    if string.find(L2_37, "owner") == nil then
      HUD:counter999SubNum()
      _total_enemy_count = _total_enemy_count - 1
    end
  end,
  onObjectDead = function(A0_38, A1_39)
  end
}
enmgen2_pi2_a_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "giant_mine_11",
        locator = "locator_pi2_a_01_03",
        name = "ene003"
      },
      {
        type = "defender_mine_11",
        locator = "locator_pi2_a_01_04",
        name = "ene004"
      },
      {
        type = "defender_mine_11",
        locator = "locator_pi2_a_01_05",
        name = "ene005"
      },
      {
        type = "defender_mine_11",
        locator = "locator_pi2_a_01_06",
        name = "ene006"
      },
      {
        type = "lasercannon_mine_11",
        locator = "locator_pi2_a_01_07",
        name = "ene007"
      },
      {
        type = "lasercannon_mine_11",
        locator = "locator_pi2_a_01_08",
        name = "ene008"
      },
      {
        type = "lasercannon_mine_11",
        locator = "locator_pi2_a_01_09",
        name = "ene009"
      }
    }
  },
  onSpawn = function(A0_40, A1_41)
  end,
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onObjectAsh = function(A0_48, A1_49)
    HUD:counter999SubNum()
    _total_enemy_count = _total_enemy_count - 1
  end,
  onObjectDead = function(A0_50, A1_51)
  end
}
enmgen2_pi2_a_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_01",
      name = "ene_pi2_a_09_01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_02",
      name = "ene_pi2_a_09_02"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_03",
      name = "ene_pi2_a_09_03"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_04",
      name = "ene_pi2_a_09_04"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_05",
      name = "ene_pi2_a_09_05"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_06",
      name = "ene_pi2_a_09_06"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_07",
      name = "ene_pi2_a_09_07"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_08",
      name = "ene_pi2_a_09_08"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_09",
      name = "ene_pi2_a_09_09"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_09_10",
      name = "ene_pi2_a_09_10"
    }
  },
  onUpdate = function(A0_52)
    local L1_53
  end,
  onEnter = function(A0_54)
    local L1_55
  end,
  onLeave = function(A0_56)
    local L1_57
  end,
  onPopGem = function(A0_58, A1_59)
    EnemeyDropGem(A0_58, A1_59)
  end,
  onObjectAsh = function(A0_60, A1_61)
  end,
  onObjectDead = function(A0_62, A1_63)
  end
}
enmgen2_pi2_a_10 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_01",
      name = "ene_pi2_a_10_01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_02",
      name = "ene_pi2_a_10_02"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_03",
      name = "ene_pi2_a_10_03"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_04",
      name = "ene_pi2_a_10_04"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_05",
      name = "ene_pi2_a_10_05"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_06",
      name = "ene_pi2_a_10_06"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_07",
      name = "ene_pi2_a_10_07"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_10_08",
      name = "ene_pi2_a_10_08"
    }
  },
  onUpdate = function(A0_64)
    local L1_65
  end,
  onEnter = function(A0_66)
    local L1_67
  end,
  onLeave = function(A0_68)
    local L1_69
  end,
  onPopGem = function(A0_70, A1_71)
    EnemeyDropGem(A0_70, A1_71)
  end,
  onObjectAsh = function(A0_72, A1_73)
  end,
  onObjectDead = function(A0_74, A1_75)
  end
}
enmgen2_pi2_a_12 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_12_01",
      name = "ene_pi2_a_12_01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_12_02",
      name = "ene_pi2_a_12_02"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_12_03",
      name = "ene_pi2_a_12_03"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_12_04",
      name = "ene_pi2_a_12_04"
    }
  },
  onUpdate = function(A0_76)
    local L1_77
  end,
  onEnter = function(A0_78)
    local L1_79
  end,
  onLeave = function(A0_80)
    local L1_81
  end,
  onPopGem = function(A0_82, A1_83)
    EnemeyDropGem(A0_82, A1_83)
  end,
  onObjectAsh = function(A0_84, A1_85)
  end,
  onObjectDead = function(A0_86, A1_87)
  end
}
enmgen2_pi2_a_13 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_13_01",
      name = "ene_pi2_a_13_01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_13_02",
      name = "ene_pi2_a_13_02"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_13_03",
      name = "ene_pi2_a_13_03"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_13_04",
      name = "ene_pi2_a_13_04"
    }
  },
  onUpdate = function(A0_88)
    local L1_89
  end,
  onEnter = function(A0_90)
    local L1_91
  end,
  onLeave = function(A0_92)
    local L1_93
  end,
  onPopGem = function(A0_94, A1_95)
    EnemeyDropGem(A0_94, A1_95)
  end,
  onObjectAsh = function(A0_96, A1_97)
  end,
  onObjectDead = function(A0_98, A1_99)
  end
}
enmgen2_pi2_a_14 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_14_01",
      name = "ene_pi2_a_14_01"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_14_02",
      name = "ene_pi2_a_14_02"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_14_03",
      name = "ene_pi2_a_14_03"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_14_04",
      name = "ene_pi2_a_14_04"
    },
    {
      type = "gellyfish_mine_02",
      locator = "locator_pi2_a_14_05",
      name = "ene_pi2_a_14_05"
    }
  },
  onUpdate = function(A0_100)
    local L1_101
  end,
  onEnter = function(A0_102)
    local L1_103
  end,
  onLeave = function(A0_104)
    local L1_105
  end,
  onPopGem = function(A0_106, A1_107)
    EnemeyDropGem(A0_106, A1_107)
  end,
  onObjectAsh = function(A0_108, A1_109)
  end,
  onObjectDead = function(A0_110, A1_111)
  end
}
enmgen2_pi2_a_15 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_mine_02",
      locator = "locator_pi2_a_15_01",
      name = "ene_pi2_a_15_01"
    }
  },
  onUpdate = function(A0_112)
    local L1_113
  end,
  onEnter = function(A0_114)
    local L1_115
  end,
  onLeave = function(A0_116)
    local L1_117
  end,
  onPopGem = function(A0_118, A1_119)
    EnemeyDropGem(A0_118, A1_119)
  end,
  onObjectAsh = function(A0_120, A1_121)
  end,
  onObjectDead = function(A0_122, A1_123)
  end
}
enmgen2_pi2_a_17 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_mine_02",
      locator = "locator_pi2_a_17_01",
      name = "ene_pi2_a_17_01"
    },
    {
      type = "imp_mine_02",
      locator = "locator_pi2_a_17_02",
      name = "ene_pi2_a_17_02"
    }
  },
  onUpdate = function(A0_124)
    local L1_125
  end,
  onEnter = function(A0_126)
    local L1_127
  end,
  onLeave = function(A0_128)
    local L1_129
  end,
  onPopGem = function(A0_130, A1_131)
    EnemeyDropGem(A0_130, A1_131)
  end,
  onObjectAsh = function(A0_132, A1_133)
  end,
  onObjectDead = function(A0_134, A1_135)
  end
}
