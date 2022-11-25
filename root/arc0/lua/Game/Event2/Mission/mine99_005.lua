dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_005"
_floor_num = 5
_MAX_ENEMY = 20
_TIME_LIMIT = 70
_total_enemy_count = 0
_isSuccess = false
_isFailure = false
_isTimerRunning = false
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
    L4_5
  }
  L4_5 = "pi_a_20"
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
    L1_2()
    L4_5 = nil
    L5_6 = true
    L1_2(L2_3, L3_4, L4_5, L5_6)
    for L4_5, L5_6 in L1_2(L2_3) do
      requestEnemyKill(L5_6)
    end
    _isSuccess = false
    _isFailure = false
    _isTimerRunning = false
    _total_enemy_count = L1_2
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L1_2(L2_3, L3_4)
    L4_5 = _TIME_LIMIT
    L5_6 = judge
    _isTimerRunning = true
    while true do
      if not L2_3 then
        if L2_3 <= 0 then
          _isSuccess = true
          break
        end
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
      repeat
        L2_3()
      until L2_3
      L2_3(L3_4)
      if L2_3 then
        L2_3(L3_4)
      end
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
    _isSuccess = true
  else
    _isFailure = true
    print(string.format("%d \228\189\147\230\174\139\227\130\138\227\129\190\227\129\151\227\129\159\227\128\130", _total_enemy_count))
    missionFailure()
    repeat
      wait()
    until isFailureProcessEnd()
    HUD:timerSetVisible(false)
    HUD:counter999SetVisible(false)
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
enmgen2_pi_a_10_a = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_01",
        name = "ene001"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_02",
        name = "ene002"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_03",
        name = "ene003"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_04",
        name = "ene004"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_05",
        name = "ene005"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_06",
        name = "ene006"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_07",
        name = "ene007"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_08",
        name = "ene008"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_09",
        name = "ene009"
      },
      {
        type = "stalker_strong",
        locator = "locator_pi_a_10_a_10",
        name = "ene010"
      }
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
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end,
  onObjectDead = function(A0_24, A1_25)
  end
}
enmgen2_pi_a_10_b = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {},
  setData = {
    {
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_01",
        name = "ene011"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_02",
        name = "ene012"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_03",
        name = "ene013"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_04",
        name = "ene014"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_05",
        name = "ene015"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_06",
        name = "ene016"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_07",
        name = "ene017"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_08",
        name = "ene018"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_09",
        name = "ene019"
      },
      {
        type = "gellyfish_strong",
        locator = "locator_pi_a_10_b_10",
        name = "ene020"
      }
    }
  },
  onSpawn = function(A0_26, A1_27)
  end,
  onUpdate = function(A0_28)
    local L1_29
  end,
  onEnter = function(A0_30)
    local L1_31
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onObjectAsh = function(A0_34, A1_35)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end,
  onObjectDead = function(A0_36, A1_37)
  end
}
enmgen2_pi_a_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker_strong",
      locator = "locator_pi_a_01_01",
      name = "ene_pi_a_01_01"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_01_02",
      name = "ene_pi_a_01_02"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_01_03",
      name = "ene_pi_a_01_03"
    },
    {
      type = "stalker_strong",
      locator = "locator_pi_a_01_04",
      name = "ene_pi_a_01_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_01_05",
      name = "ene_pi_a_01_05"
    },
    {
      type = "imp_strong",
      locator = "locator_pi_a_01_06",
      name = "ene_pi_a_01_06"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_01_07",
      name = "ene_pi_a_01_07"
    }
  },
  onUpdate = function(A0_38)
    local L1_39
  end,
  onEnter = function(A0_40)
    local L1_41
  end,
  onLeave = function(A0_42)
    local L1_43
  end,
  onPopGem = function(A0_44, A1_45)
    EnemeyDropGem(A0_44, A1_45)
  end,
  onObjectAsh = function(A0_46, A1_47)
  end,
  onObjectDead = function(A0_48, A1_49)
  end
}
enmgen2_pi_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_02_01",
      name = "ene_pi_a_02_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_02_02",
      name = "ene_pi_a_02_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_02_03",
      name = "ene_pi_a_02_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_02_04",
      name = "ene_pi_a_02_04"
    }
  },
  onUpdate = function(A0_50)
    local L1_51
  end,
  onEnter = function(A0_52)
    local L1_53
  end,
  onLeave = function(A0_54)
    local L1_55
  end,
  onPopGem = function(A0_56, A1_57)
    EnemeyDropGem(A0_56, A1_57)
  end,
  onObjectAsh = function(A0_58, A1_59)
  end,
  onObjectDead = function(A0_60, A1_61)
  end
}
enmgen2_pi_a_19 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_19_01",
      name = "ene_pi_a_19_01"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_19_02",
      name = "ene_pi_a_19_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_19_03",
      name = "ene_pi_a_19_03"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_19_04",
      name = "ene_pi_a_19_04"
    }
  },
  onUpdate = function(A0_62)
    local L1_63
  end,
  onEnter = function(A0_64)
    local L1_65
  end,
  onLeave = function(A0_66)
    local L1_67
  end,
  onPopGem = function(A0_68, A1_69)
    EnemeyDropGem(A0_68, A1_69)
  end,
  onObjectAsh = function(A0_70, A1_71)
  end,
  onObjectDead = function(A0_72, A1_73)
  end
}
enmgen2_pi_a_20 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_20_01",
      name = "ene_pi_a_20_01"
    },
    {
      type = "imp_strong",
      locator = "locator_pi_a_20_02",
      name = "ene_pi_a_20_02"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_20_03",
      name = "ene_pi_a_20_03"
    },
    {
      type = "imp_strong",
      locator = "locator_pi_a_20_04",
      name = "ene_pi_a_20_04"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_20_05",
      name = "ene_pi_a_20_05"
    },
    {
      type = "gellyfish_strong",
      locator = "locator_pi_a_20_06",
      name = "ene_pi_a_20_06"
    }
  },
  onUpdate = function(A0_74)
    local L1_75
  end,
  onEnter = function(A0_76)
    local L1_77
  end,
  onLeave = function(A0_78)
    local L1_79
  end,
  onPopGem = function(A0_80, A1_81)
    EnemeyDropGem(A0_80, A1_81)
  end,
  onObjectAsh = function(A0_82, A1_83)
  end,
  onObjectDead = function(A0_84, A1_85)
  end
}
