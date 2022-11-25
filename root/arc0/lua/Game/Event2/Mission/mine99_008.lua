dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_008"
_floor_num = 8
_enegen_list = nil
_startArea = nil
_goalArea = nil
_enemySpawn_task = nil
_mission_start = false
_mission_clear = false
_mission_faled = false
_MissionTarget_DamageType = {}
_enemydead_judge = false
enmgen2_MissionTarget_wa_a_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_01",
      name = "MT_wa_a_03_jammer_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_02",
      name = "MT_wa_a_03_jammer_2"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_03",
      name = "MT_wa_a_03_jammer_3"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_04",
      name = "MT_wa_a_03_jammer_4"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_05",
      name = "MT_wa_a_03_jammer_5"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_06",
      name = "MT_wa_a_03_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_07",
      name = "MT_wa_a_03_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_08",
      name = "MT_wa_a_03_gellyfish_3"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_09",
      name = "MT_wa_a_03_gellyfish_4"
    },
    {
      type = "treecannon_mine_01",
      locator = "locator2_MT_wa_a_03_enemy_10",
      name = "MT_wa_a_03_treecannon_1"
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
    if _MissionTarget_DamageType[A1_9:getName()] == "GravityThrow" or _MissionTarget_DamageType[A1_9:getName()] == "DebriBullet" or _MissionTarget_DamageType[A1_9:getName()] == "Penetrate" then
      print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\233\135\141\229\138\155\227\130\185\227\131\173\227\131\188 or \227\131\135\227\131\150\227\131\170\229\188\190 or \227\131\154\227\131\141\227\131\136\227\131\172\227\130\164\227\131\136\229\188\190\227\129\167\229\128\146\227\129\149\227\130\140\227\129\159")
      HUD:counter999SubNum()
      print("\233\135\141\229\138\155\227\130\185\227\131\173\227\131\188 or \227\131\135\227\131\150\227\131\170\229\188\190 or \227\131\154\227\131\141\227\131\136\227\131\172\227\130\164\227\131\136\229\188\190\227\129\167\229\128\146\227\129\153\230\174\139\227\130\138\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154" .. HUD:counter999GetNum() .. "\228\189\147")
    end
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = 0
    A0_10:setEventListener("DamageEnemyReport", function(A0_12)
      print("\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\229\143\151\227\129\145\227\129\159\230\148\187\230\146\131\227\130\191\227\130\164\227\131\151\227\130\146\230\160\188\231\180\141")
      _MissionTarget_DamageType[A0_12.name] = A0_12.damageType
    end)
  end,
  getEnemyMax = function(A0_13)
    return #A0_13.spawnSet
  end,
  getEnemyDeadNum = function(A0_14)
    local L1_15
    L1_15 = A0_14.enemyDeadNum
    return L1_15
  end
}
enmgen2_wa_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_02_enemy_01",
      name = "wa_a_02_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_02_enemy_02",
      name = "wa_a_02_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_02_enemy_03",
      name = "wa_a_02_gellyfish_3"
    },
    {
      type = "lasercannon_mine_01",
      locator = "locator2_wa_a_02_enemy_04",
      name = "wa_a_02_lasercannon_1"
    },
    {
      type = "lasercannon_mine_01",
      locator = "locator2_wa_a_02_enemy_05",
      name = "wa_a_02_lasercannon_2"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onPopGem = function(A0_24, A1_25)
    EnemeyDropGem(A0_24, A1_25)
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
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onPopGem = function(A0_34, A1_35)
    EnemeyDropGem(A0_34, A1_35)
  end
}
enmgen2_wa_a_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_06_enemy_01",
      name = "wa_a_06_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_06_enemy_02",
      name = "wa_a_06_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_06_enemy_03",
      name = "wa_a_06_gellyfish_3"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_06_enemy_04",
      name = "wa_a_06_gellyfish_4"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_06_enemy_05",
      name = "wa_a_06_gellyfish_5"
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
  onObjectDead = function(A0_42, A1_43)
  end,
  onPopGem = function(A0_44, A1_45)
    EnemeyDropGem(A0_44, A1_45)
  end
}
enmgen2_wa_a_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_08_enemy_01",
      name = "wa_a_08_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_08_enemy_02",
      name = "wa_a_08_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_08_enemy_03",
      name = "wa_a_08_gellyfish_3"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_08_enemy_04",
      name = "wa_a_08_jammer_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_08_enemy_05",
      name = "wa_a_08_jammer_2"
    }
  },
  onUpdate = function(A0_46)
    local L1_47
  end,
  onEnter = function(A0_48)
    local L1_49
  end,
  onLeave = function(A0_50)
    local L1_51
  end,
  onObjectDead = function(A0_52, A1_53)
  end,
  onPopGem = function(A0_54, A1_55)
    EnemeyDropGem(A0_54, A1_55)
  end
}
enmgen2_wa_a_10 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_10_enemy_01",
      name = "wa_a_10_imp_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_10_enemy_02",
      name = "wa_a_10_imp_2"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_10_enemy_03",
      name = "wa_a_10_imp_3"
    }
  },
  onUpdate = function(A0_56)
    local L1_57
  end,
  onEnter = function(A0_58)
    local L1_59
  end,
  onLeave = function(A0_60)
    local L1_61
  end,
  onObjectDead = function(A0_62, A1_63)
  end,
  onPopGem = function(A0_64, A1_65)
    EnemeyDropGem(A0_64, A1_65)
  end
}
enmgen2_wa_a_11 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_11_enemy_01",
      name = "wa_a_11_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_11_enemy_02",
      name = "wa_a_11_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_11_enemy_03",
      name = "wa_a_11_gellyfish_3"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_11_enemy_04",
      name = "wa_a_11_imp_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_11_enemy_05",
      name = "wa_a_11_imp_2"
    }
  },
  onUpdate = function(A0_66)
    local L1_67
  end,
  onEnter = function(A0_68)
    local L1_69
  end,
  onLeave = function(A0_70)
    local L1_71
  end,
  onObjectDead = function(A0_72, A1_73)
  end,
  onPopGem = function(A0_74, A1_75)
    EnemeyDropGem(A0_74, A1_75)
  end
}
function InitializeBody()
  local L0_76
  L0_76 = print
  L0_76(string.format("mine99_%03d InitializeBody", _floor_num))
  L0_76 = {}
  L0_76.mineOreEvdName = "mine05_ore"
  L0_76.instance_flg = true
  L0_76.manager_name = g_own:getName()
  L0_76.deploy_areas = getElectedAreaNames()
  L0_76.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_76
end
function IngameBody()
  local L0_77, L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86
  L3_80 = _floor_num
  L9_86 = L1_78(L2_79, L3_80)
  L0_77(L1_78, L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86, L1_78(L2_79, L3_80))
  _enegen_list = L0_77
  _startArea = L0_77
  _goalArea = L0_77
  L0_77()
  L0_77()
  L0_77()
  _enemySpawn_task = L0_77
  if not L0_77 then
    L0_77(L1_78)
    repeat
      L0_77()
    until L0_77
    L0_77()
    L3_80 = nil
    L4_81 = true
    L0_77(L1_78, L2_79, L3_80, L4_81)
    if L0_77 ~= nil then
      L0_77(L1_78)
      _enemySpawn_task = nil
    end
    for L3_80, L4_81 in L0_77(L1_78) do
      L5_82(L6_83)
      L5_82(L6_83)
      for L8_85, L9_86 in L5_82(L6_83) do
        if string.match(L9_86, "MissionTarget") ~= nil then
          if string.match(L9_86, _goalArea) ~= nil then
            print("-// \228\184\139\232\168\152\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\227\130\176\227\131\171\227\131\188\227\131\151\227\130\146\233\133\141\231\189\174 //-")
            print(L9_86)
            findGameObject2("EnemyGenerator", L9_86):requestSpawn()
          end
        else
          findGameObject2("EnemyGenerator", L9_86):requestAllEnemyKill()
        end
      end
    end
    L0_77(L1_78, L2_79)
    L0_77(L1_78, L2_79)
    L0_77(L1_78, L2_79)
    L0_77(L1_78, L2_79)
    L0_77(L1_78)
    _mission_start = true
    while true do
      if L0_77 == 0 then
        if L0_77 == true then
          while L0_77 ~= 0 do
            if L1_78 >= 1 then
              L1_78(L2_79)
              _mission_faled = true
              break
            end
            L1_78()
          end
          if L1_78 == false then
            if L1_78 <= 0 then
              L1_78(L2_79)
              _mission_clear = true
            else
              L1_78(L2_79)
              _mission_faled = true
            end
          end
        elseif L0_77 >= 6 then
          L0_77(L1_78)
          _mission_faled = true
        end
      elseif L0_77 == 1 then
        _enemydead_judge = true
      elseif L0_77 >= 2 then
        L0_77(L1_78)
        _mission_faled = true
      end
      if L0_77 == true then
        _mission_start = false
        _mission_clear = false
        _enemydead_judge = false
        L0_77(L1_78, L2_79)
        L0_77()
        L0_77()
        repeat
          L0_77()
        until L0_77
        L0_77()
        L0_77()
        L0_77(L1_78)
        break
      elseif L0_77 == true then
        _mission_start = false
        _mission_faled = false
        _enemydead_judge = false
        L0_77(L1_78, L2_79)
        L0_77()
        repeat
          L0_77()
        until L0_77
        L0_77()
        L0_77()
      end
      L0_77()
    end
    for L3_80, L4_81 in L0_77(L1_78) do
      for L8_85, L9_86 in L5_82(L6_83) do
        findGameObject2("EnemyGenerator", L9_86):requestAllEnemyKill()
      end
    end
  else
    L0_77(L1_78)
    L0_77(L1_78)
  end
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  if HUD:counter999IsVisible() then
    HUD:counter999SetVisible(false)
  end
end
