dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_006"
_floor_num = 6
_enegen_list = nil
_startArea = nil
_goalArea = nil
_enemySpawn_task = nil
_mission_start = false
_mission_clear = false
_mission_faled = false
_MissionTarget_DamageType = {}
enmgen2_MissionTarget_wa_a_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_01",
      name = "MT_wa_a_03_stalker_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_02",
      name = "MT_wa_a_03_runner_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_03",
      name = "MT_wa_a_03_runner_2"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_04",
      name = "MT_wa_a_03_stalker_2"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_05",
      name = "MT_wa_a_03_stalker_3"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_06",
      name = "MT_wa_a_03_stalker_4"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_07",
      name = "MT_wa_a_03_stalker_5"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_08",
      name = "MT_wa_a_03_stalker_6"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_09",
      name = "MT_wa_a_03_stalker_7"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_10",
      name = "MT_wa_a_03_stalker_8"
    }
  },
  enemyDeadNum = 0,
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
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
    if _MissionTarget_DamageType[A1_9:getName()] == "SliderBodyAttack" or _MissionTarget_DamageType[A1_9:getName()] == "SliderKick" then
      print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\233\135\141\229\138\155\227\130\185\227\131\169\227\130\164\227\131\128\227\131\188 or \227\130\185\227\131\169\227\130\164\227\131\128\227\131\188\227\130\173\227\131\131\227\130\175\227\129\167\229\128\146\227\129\149\227\130\140\227\129\159")
      HUD:counter999SubNum()
      print("\233\135\141\229\138\155\227\130\185\227\131\169\227\130\164\227\131\128\227\131\188 or \227\130\185\227\131\169\227\130\164\227\131\128\227\131\188\227\130\173\227\131\131\227\130\175\227\129\167\229\128\146\227\129\153\230\174\139\227\130\138\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154" .. HUD:counter999GetNum() .. "\228\189\147")
    else
      print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\233\135\141\229\138\155\227\130\185\227\131\169\227\130\164\227\131\128\227\131\188\228\187\165\229\164\150\227\129\167\229\128\146\227\129\149\227\130\140\227\129\159")
      _mission_faled = true
    end
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = 0
    A0_10:setEventListener("DamageEnemyReport", function(A0_12)
      print("\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\229\143\151\227\129\145\227\129\159\230\148\187\230\146\131\227\130\191\227\130\164\227\131\151\227\130\146\230\160\188\231\180\141")
      _MissionTarget_DamageType[A0_12.name] = A0_12.damageType
    end)
  end,
  onSetupGem = function(A0_13, A1_14)
    Fn_enemyPopGemSetup(A0_13, {
      "MT_wa_a_03_stalker_1",
      "MT_wa_a_03_stalker_2",
      "MT_wa_a_03_stalker_3",
      "MT_wa_a_03_stalker_4",
      "MT_wa_a_03_stalker_5",
      "MT_wa_a_03_stalker_6",
      "MT_wa_a_03_stalker_7",
      "MT_wa_a_03_stalker_8",
      "MT_wa_a_03_stalker_9",
      "MT_wa_a_03_stalker_10"
    }, 4, GEM_VITAL)
  end,
  onPopGem = function(A0_15, A1_16)
    Fn_enemyAshPopGem(A0_15, A1_16)
  end,
  getEnemyMax = function(A0_17)
    return #A0_17.spawnSet
  end,
  getEnemyDeadNum = function(A0_18)
    local L1_19
    L1_19 = A0_18.enemyDeadNum
    return L1_19
  end
}
enmgen2_MissionTarget_wa_a_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_01",
      name = "MT_wa_a_04_stalker_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_02",
      name = "MT_wa_a_04_runner_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_03",
      name = "MT_wa_a_04_runner_2"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_04",
      name = "MT_wa_a_04_stalker_2"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_05",
      name = "MT_wa_a_04_stalker_3"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_06",
      name = "MT_wa_a_04_stalker_4"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_07",
      name = "MT_wa_a_04_stalker_5"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_08",
      name = "MT_wa_a_04_stalker_6"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_09",
      name = "MT_wa_a_04_stalker_7"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_MT_wa_a_04_enemy_10",
      name = "MT_wa_a_04_stalker_8"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_20)
    local L1_21
  end,
  onEnter = function(A0_22)
    local L1_23
  end,
  onLeave = function(A0_24)
    local L1_25
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onObjectAsh = function(A0_28, A1_29)
    A0_28:getSpecTable().enemyDeadNum = A0_28:getSpecTable().enemyDeadNum + 1
    if _MissionTarget_DamageType[A1_29:getName()] == "SliderBodyAttack" or _MissionTarget_DamageType[A1_29:getName()] == "SliderKick" then
      print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\233\135\141\229\138\155\227\130\185\227\131\169\227\130\164\227\131\128\227\131\188 or \227\130\185\227\131\169\227\130\164\227\131\128\227\131\188\227\130\173\227\131\131\227\130\175\227\129\167\229\128\146\227\129\149\227\130\140\227\129\159")
      HUD:counter999SubNum()
      print("\233\135\141\229\138\155\227\130\185\227\131\169\227\130\164\227\131\128\227\131\188 or \227\130\185\227\131\169\227\130\164\227\131\128\227\131\188\227\130\173\227\131\131\227\130\175\227\129\167\229\128\146\227\129\153\230\174\139\227\130\138\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154" .. HUD:counter999GetNum() .. "\228\189\147")
    else
      print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\233\135\141\229\138\155\227\130\185\227\131\169\227\130\164\227\131\128\227\131\188\228\187\165\229\164\150\227\129\167\229\128\146\227\129\149\227\130\140\227\129\159")
      _mission_faled = true
    end
  end,
  onSpawn = function(A0_30, A1_31)
    A0_30:getSpecTable().enemyDeadNum = 0
    A0_30:setEventListener("DamageEnemyReport", function(A0_32)
      print("\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\229\143\151\227\129\145\227\129\159\230\148\187\230\146\131\227\130\191\227\130\164\227\131\151\227\130\146\230\160\188\231\180\141")
      _MissionTarget_DamageType[A0_32.name] = A0_32.damageType
    end)
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "MT_wa_a_04_stalker_1",
      "MT_wa_a_04_stalker_2",
      "MT_wa_a_04_stalker_3",
      "MT_wa_a_04_stalker_4",
      "MT_wa_a_04_stalker_5",
      "MT_wa_a_04_stalker_6",
      "MT_wa_a_04_stalker_7",
      "MT_wa_a_04_stalker_8",
      "MT_wa_a_04_stalker_9",
      "MT_wa_a_04_stalker_10"
    }, 4, GEM_VITAL)
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36)
  end,
  getEnemyMax = function(A0_37)
    return #A0_37.spawnSet
  end,
  getEnemyDeadNum = function(A0_38)
    local L1_39
    L1_39 = A0_38.enemyDeadNum
    return L1_39
  end
}
enmgen2_wa_a_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "runner_mine_01",
      locator = "locator2_wa_a_03_enemy_01",
      name = "wa_a_03_runner_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_wa_a_03_enemy_02",
      name = "wa_a_03_runner_2"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_wa_a_03_enemy_03",
      name = "wa_a_03_runner_3"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_03_enemy_04",
      name = "wa_a_03_stalker_1"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_03_enemy_05",
      name = "wa_a_03_stalker_2"
    }
  },
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onObjectDead = function(A0_46, A1_47)
  end,
  onPopGem = function(A0_48, A1_49)
    EnemeyDropGem(A0_48, A1_49)
  end
}
enmgen2_wa_a_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "defender_mine_01",
      locator = "locator2_wa_a_04_enemy_01",
      name = "wa_a_04_defender_1"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_04_enemy_02",
      name = "wa_a_04_guardcore_1"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_04_enemy_03",
      name = "wa_a_04_stalker_1"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_04_enemy_04",
      name = "wa_a_04_stalker_2"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_04_enemy_05",
      name = "wa_a_04_stalker_3"
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
  onObjectDead = function(A0_56, A1_57)
  end,
  onPopGem = function(A0_58, A1_59)
    EnemeyDropGem(A0_58, A1_59)
  end
}
enmgen2_wa_a_05_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_05_01_enemy_01",
      name = "wa_a_05_guardcore_1"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_05_01_enemy_02",
      name = "wa_a_05_guardcore_2"
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
  onObjectDead = function(A0_66, A1_67)
  end,
  onPopGem = function(A0_68, A1_69)
    EnemeyDropGem(A0_68, A1_69)
  end
}
enmgen2_wa_a_05_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_05_02_enemy_01",
      name = "wa_a_05_imp_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_05_02_enemy_02",
      name = "wa_a_05_imp_2"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_05_02_enemy_03",
      name = "wa_a_05_imp_3"
    }
  },
  onUpdate = function(A0_70)
    local L1_71
  end,
  onEnter = function(A0_72)
    local L1_73
  end,
  onLeave = function(A0_74)
    local L1_75
  end,
  onObjectDead = function(A0_76, A1_77)
  end,
  onPopGem = function(A0_78, A1_79)
    EnemeyDropGem(A0_78, A1_79)
  end
}
enmgen2_wa_a_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_08_enemy_01",
      name = "wa_a_08_imp_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_08_enemy_02",
      name = "wa_a_08_imp_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_08_enemy_03",
      name = "wa_a_08_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_08_enemy_04",
      name = "wa_a_08_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_08_enemy_05",
      name = "wa_a_08_gellyfish_3"
    }
  },
  onUpdate = function(A0_80)
    local L1_81
  end,
  onEnter = function(A0_82)
    local L1_83
  end,
  onLeave = function(A0_84)
    local L1_85
  end,
  onObjectDead = function(A0_86, A1_87)
  end,
  onPopGem = function(A0_88, A1_89)
    EnemeyDropGem(A0_88, A1_89)
  end
}
enmgen2_wa_a_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_09_enemy_01",
      name = "wa_a_09_jammer_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_09_enemy_02",
      name = "wa_a_09_jammer_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_09_enemy_03",
      name = "wa_a_09_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_09_enemy_04",
      name = "wa_a_09_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_09_enemy_05",
      name = "wa_a_09_gellyfish_3"
    }
  },
  onUpdate = function(A0_90)
    local L1_91
  end,
  onEnter = function(A0_92)
    local L1_93
  end,
  onLeave = function(A0_94)
    local L1_95
  end,
  onObjectDead = function(A0_96, A1_97)
  end,
  onPopGem = function(A0_98, A1_99)
    EnemeyDropGem(A0_98, A1_99)
  end
}
function InitializeBody()
  local L0_100
  L0_100 = print
  L0_100(string.format("mine99_%03d InitializeBody", _floor_num))
  L0_100 = {}
  L0_100.mineOreEvdName = "mine05_ore"
  L0_100.instance_flg = true
  L0_100.manager_name = g_own:getName()
  L0_100.deploy_areas = getElectedAreaNames()
  L0_100.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_100
end
function IngameBody()
  local L0_101, L1_102, L2_103, L3_104, L4_105, L5_106, L6_107, L7_108, L8_109, L9_110, L10_111
  _mission_faled = false
  L0_101 = print
  L10_111 = L1_102(L2_103, L3_104)
  L0_101(L1_102, L2_103, L3_104, L4_105, L5_106, L6_107, L7_108, L8_109, L9_110, L10_111, L1_102(L2_103, L3_104))
  L0_101 = Fn_getEneGenNameTable
  L0_101 = L0_101()
  _enegen_list = L0_101
  L0_101 = Fn_getStartAreaName
  L0_101 = L0_101()
  _startArea = L0_101
  L0_101 = Fn_getGoalAreaName
  L0_101 = L0_101()
  _goalArea = L0_101
  L0_101 = Fn_missionStart
  L0_101()
  L0_101 = Fn_showMineName
  L0_101()
  L0_101 = Fn_userCtrlOn
  L0_101()
  L0_101 = invokeTask
  L0_101 = L0_101(L1_102)
  _enemySpawn_task = L0_101
  L0_101 = Fn_getMine99FloorClear
  L0_101 = L0_101()
  if not L0_101 then
    L0_101 = missionTextVisible
    L0_101(L1_102)
    repeat
      L0_101 = wait
      L0_101()
      L0_101 = isLithographStart
      L0_101 = L0_101()
    until L0_101
    L0_101 = setFirstHalfProcessEnd
    L0_101()
    L0_101 = Fn_missionView
    L4_105 = true
    L0_101(L1_102, L2_103, L3_104, L4_105)
    L0_101 = _enemySpawn_task
    if L0_101 ~= nil then
      L0_101 = _enemySpawn_task
      L0_101 = L0_101.abort
      L0_101(L1_102)
      _enemySpawn_task = nil
    end
    L0_101 = 0
    for L4_105, L5_106 in L1_102(L2_103) do
      L6_107(L7_108)
      L6_107(L7_108)
      for L9_110, L10_111 in L6_107(L7_108) do
        if string.match(L10_111, "MissionTarget") ~= nil then
          if string.match(L10_111, _goalArea) ~= nil then
            print("-// \228\184\139\232\168\152\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\227\130\176\227\131\171\227\131\188\227\131\151\227\130\146\233\133\141\231\189\174 //-")
            print(L10_111)
            findGameObject2("EnemyGenerator", L10_111):requestSpawn()
            if L10_111 == "enmgen2_MissionTarget_wa_a_03" then
              L0_101 = enmgen2_MissionTarget_wa_a_03:getEnemyMax()
            elseif L10_111 == "enmgen2_MissionTarget_wa_a_04" then
              L0_101 = enmgen2_MissionTarget_wa_a_04:getEnemyMax()
            end
          end
        else
          findGameObject2("EnemyGenerator", L10_111):requestAllEnemyKill()
        end
      end
    end
    L1_102(L2_103, L3_104)
    L1_102(L2_103, L3_104)
    L1_102(L2_103, L3_104)
    L1_102(L2_103, L3_104)
    L1_102(L2_103)
    _mission_start = true
    while true do
      if L1_102 == 0 then
        L1_102(L2_103)
        _mission_clear = true
      end
      if L1_102 == true then
        _mission_start = false
        _mission_clear = false
        L1_102(L2_103, L3_104)
        L1_102()
        L1_102()
        repeat
          L1_102()
        until L1_102
        L1_102()
        L1_102()
        L1_102(L2_103)
        break
      elseif L1_102 == true then
        _mission_start = false
        _mission_faled = false
        L1_102(L2_103, L3_104)
        L1_102()
        repeat
          L1_102()
        until L1_102
        L1_102()
        L1_102()
      end
      L1_102()
    end
    for L4_105, L5_106 in L1_102(L2_103) do
      for L9_110, L10_111 in L6_107(L7_108) do
        findGameObject2("EnemyGenerator", L10_111):requestAllEnemyKill()
      end
    end
  else
    L0_101 = print
    L0_101(L1_102)
    L0_101 = Fn_setGravityGateActive
    L0_101(L1_102)
  end
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  if HUD:counter999IsVisible() then
    HUD:counter999SetVisible(false)
  end
end
