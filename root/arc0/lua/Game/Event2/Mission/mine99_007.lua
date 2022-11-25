dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_007"
_floor_num = 7
_enegen_list = nil
_startArea = nil
_goalArea = nil
_enemySpawn_task = nil
_mission_start = false
_mission_clear = false
_mission_faled = false
_gem_obj = {}
enmgen2_MissionTarget_wa_a_01_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "treecannon_mine_01",
      locator = "locator2_MT_wa_a_01_01_enemy_01",
      name = "MT_wa_a_01_treecannon_1"
    },
    {
      type = "treecannon_mine_01",
      locator = "locator2_MT_wa_a_01_01_enemy_02",
      name = "MT_wa_a_01_treecannon_2"
    },
    {
      type = "treecannon_mine_01",
      locator = "locator2_MT_wa_a_01_01_enemy_03",
      name = "MT_wa_a_01_treecannon_3"
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
    HUD:counter999SubNum()
    print("\227\131\132\227\131\170\227\131\188\227\130\173\227\131\163\227\131\142\227\131\179\239\188\154\230\174\139\227\130\138" .. A0_8:getSpecTable():getEnemyMax() - A0_8:getSpecTable():getEnemyDeadNum() .. "\228\189\147")
  end,
  onSpawn = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = 0
  end,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end
}
enmgen2_MissionTarget_wa_a_01_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "defender_mine_01",
      locator = "locator2_MT_wa_a_01_02_enemy_01",
      name = "MT_wa_a_01_defender_1"
    },
    {
      type = "defender_mine_01",
      locator = "locator2_MT_wa_a_01_02_enemy_02",
      name = "MT_wa_a_01_defender_2"
    },
    {
      type = "defender_mine_01",
      locator = "locator2_MT_wa_a_01_02_enemy_03",
      name = "MT_wa_a_01_defender_3"
    }
  },
  enemyDeadNum = 0,
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
    A0_23:getSpecTable().enemyDeadNum = A0_23:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
    print("\229\156\176\228\184\138\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\230\174\139\227\130\138" .. A0_23:getSpecTable():getEnemyMax() - A0_23:getSpecTable():getEnemyDeadNum() .. "\228\189\147")
  end,
  onSpawn = function(A0_25, A1_26)
    A0_25:getSpecTable().enemyDeadNum = 0
  end,
  getEnemyMax = function(A0_27)
    return #A0_27.spawnSet
  end,
  getEnemyDeadNum = function(A0_28)
    local L1_29
    L1_29 = A0_28.enemyDeadNum
    return L1_29
  end
}
enmgen2_MissionTarget_wa_a_01_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator2_MT_wa_a_01_03_enemy_01",
      name = "MT_wa_a_01_lunafishowner_1",
      ai_spawn_option = "LunaFishOwner/owner_mine99_07"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_01_03_enemy_02",
      name = "MT_wa_a_01_jammer_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_01_03_enemy_03",
      name = "MT_wa_a_01_jammer_2"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_MT_wa_a_01_03_enemy_04",
      name = "MT_wa_a_01_jammer_3"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish_mine_01",
      locator = "locator2_MT_wa_a_01_03_enemy_01",
      name = "MT_wa_a_01_lunafish_1"
    }
  },
  enemyDeadNum = 0,
  onUpdate = function(A0_30)
    local L1_31
  end,
  onEnter = function(A0_32)
    local L1_33
  end,
  onLeave = function(A0_34)
    local L1_35
  end,
  onObjectDead = function(A0_36, A1_37)
  end,
  onObjectAsh = function(A0_38, A1_39)
    if A1_39:getName() == "MT_wa_a_01_lunafishowner_1" then
      print("\227\131\171\227\131\188\227\131\138\227\131\149\227\130\163\227\131\131\227\130\183\227\131\165\227\129\140\229\133\168\230\187\133\227\129\151\227\129\166\227\128\129\227\130\170\227\131\188\227\131\138\227\131\188\227\129\140\230\182\136\230\187\133\227\129\151\227\129\159")
    else
      A0_38:getSpecTable().enemyDeadNum = A0_38:getSpecTable().enemyDeadNum + 1
      HUD:counter999SubNum()
      print("\231\169\186\228\184\173\227\130\168\227\131\141\227\131\159\227\131\188\239\188\154\230\174\139\227\130\138" .. A0_38:getSpecTable():getEnemyMax() - A0_38:getSpecTable():getEnemyDeadNum() .. "\228\189\147")
    end
  end,
  onSpawn = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyDeadNum = 0
  end,
  getEnemyMax = function(A0_42)
    local L1_43
    L1_43 = A0_42.spawnSet
    L1_43 = #L1_43
    L1_43 = L1_43 + 5
    return L1_43
  end,
  getEnemyDeadNum = function(A0_44)
    local L1_45
    L1_45 = A0_44.enemyDeadNum
    return L1_45
  end
}
enmgen2_wa_a_01_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_01_01_enemy_01",
      name = "wa_a_01_guardcore_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_wa_a_01_01_enemy_02",
      name = "wa_a_01_runner_1"
    },
    {
      type = "runner_mine_01",
      locator = "locator2_wa_a_01_01_enemy_03",
      name = "wa_a_01_runner_2"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_01_01_enemy_04",
      name = "wa_a_01_stalker_1"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_01_01_enemy_05",
      name = "wa_a_01_stalker_2"
    },
    {
      type = "stalker_mine_01",
      locator = "locator2_wa_a_01_01_enemy_06",
      name = "wa_a_01_stalker_3"
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
enmgen2_wa_a_01_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "defender_mine_01",
      locator = "locator2_wa_a_01_02_enemy_01",
      name = "wa_a_01_defender_1"
    },
    {
      type = "defender_mine_01",
      locator = "locator2_wa_a_01_02_enemy_02",
      name = "wa_a_01_defender_2"
    },
    {
      type = "defender_mine_01",
      locator = "locator2_wa_a_01_02_enemy_03",
      name = "wa_a_01_defender_3"
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
enmgen2_wa_a_01_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_01_03_enemy_01",
      name = "wa_a_01_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_01_03_enemy_02",
      name = "wa_a_01_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_01_03_enemy_03",
      name = "wa_a_01_gellyfish_3"
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
enmgen2_wa_a_01_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_01_04_enemy_01",
      name = "wa_a_01_guardcore_1"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_01_04_enemy_02",
      name = "wa_a_01_guardcore_2"
    },
    {
      type = "guardcore_mine_01",
      locator = "locator2_wa_a_01_04_enemy_03",
      name = "wa_a_01_guardcore_3"
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
  onObjectDead = function(A0_82, A1_83)
  end,
  onPopGem = function(A0_84, A1_85)
    EnemeyDropGem(A0_84, A1_85)
  end
}
enmgen2_wa_a_01_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_01_05_enemy_01",
      name = "wa_a_01_imp_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_01_05_enemy_02",
      name = "wa_a_01_imp_2"
    }
  },
  onUpdate = function(A0_86)
    local L1_87
  end,
  onEnter = function(A0_88)
    local L1_89
  end,
  onLeave = function(A0_90)
    local L1_91
  end,
  onObjectDead = function(A0_92, A1_93)
  end,
  onPopGem = function(A0_94, A1_95)
    EnemeyDropGem(A0_94, A1_95)
  end
}
enmgen2_wa_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_02_enemy_01",
      name = "wa_a_02_jammer_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_02_enemy_02",
      name = "wa_a_02_jammer_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_02_enemy_03",
      name = "wa_a_02_gellyfish_1"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_02_enemy_04",
      name = "wa_a_02_gellyfish_2"
    },
    {
      type = "gellyfish_mine_01",
      locator = "locator2_wa_a_02_enemy_05",
      name = "wa_a_02_gellyfish_3"
    }
  },
  onUpdate = function(A0_96)
    local L1_97
  end,
  onEnter = function(A0_98)
    local L1_99
  end,
  onLeave = function(A0_100)
    local L1_101
  end,
  onObjectDead = function(A0_102, A1_103)
  end,
  onPopGem = function(A0_104, A1_105)
    EnemeyDropGem(A0_104, A1_105)
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
  onUpdate = function(A0_106)
    local L1_107
  end,
  onEnter = function(A0_108)
    local L1_109
  end,
  onLeave = function(A0_110)
    local L1_111
  end,
  onObjectDead = function(A0_112, A1_113)
  end,
  onPopGem = function(A0_114, A1_115)
    EnemeyDropGem(A0_114, A1_115)
  end
}
enmgen2_wa_a_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_07_enemy_01",
      name = "wa_a_07_jammer_1"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_07_enemy_02",
      name = "wa_a_07_jammer_2"
    },
    {
      type = "jammer_mine_01",
      locator = "locator2_wa_a_07_enemy_03",
      name = "wa_a_07_jammer_3"
    }
  },
  onUpdate = function(A0_116)
    local L1_117
  end,
  onEnter = function(A0_118)
    local L1_119
  end,
  onLeave = function(A0_120)
    local L1_121
  end,
  onObjectDead = function(A0_122, A1_123)
  end,
  onPopGem = function(A0_124, A1_125)
    EnemeyDropGem(A0_124, A1_125)
  end
}
enmgen2_wa_a_09 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_09_enemy_01",
      name = "wa_a_09_imp_1"
    },
    {
      type = "imp_mine_01",
      locator = "locator2_wa_a_09_enemy_02",
      name = "wa_a_09_imp_2"
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
  onUpdate = function(A0_126)
    local L1_127
  end,
  onEnter = function(A0_128)
    local L1_129
  end,
  onLeave = function(A0_130)
    local L1_131
  end,
  onObjectDead = function(A0_132, A1_133)
  end,
  onPopGem = function(A0_134, A1_135)
    EnemeyDropGem(A0_134, A1_135)
  end
}
function InitializeBody()
  local L0_136
  L0_136 = print
  L0_136(string.format("mine99_%03d InitializeBody", _floor_num))
  L0_136 = {}
  L0_136.mineOreEvdName = "mine05_ore"
  L0_136.instance_flg = true
  L0_136.manager_name = g_own:getName()
  L0_136.deploy_areas = getElectedAreaNames()
  L0_136.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_136
end
function IngameBody()
  local L0_137, L1_138, L2_139, L3_140, L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147
  L0_137 = print
  L10_147 = L1_138(L2_139, L3_140)
  L0_137(L1_138, L2_139, L3_140, L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147, L1_138(L2_139, L3_140))
  L0_137 = Fn_getEneGenNameTable
  L0_137 = L0_137()
  _enegen_list = L0_137
  L0_137 = Fn_getStartAreaName
  L0_137 = L0_137()
  _startArea = L0_137
  L0_137 = Fn_getGoalAreaName
  L0_137 = L0_137()
  _goalArea = L0_137
  L0_137 = Fn_missionStart
  L0_137()
  L0_137 = Fn_showMineName
  L0_137()
  L0_137 = Fn_userCtrlOn
  L0_137()
  L0_137 = invokeTask
  L0_137 = L0_137(L1_138)
  _enemySpawn_task = L0_137
  L0_137 = Fn_getMine99FloorClear
  L0_137 = L0_137()
  if not L0_137 then
    L0_137 = missionTextVisible
    L0_137(L1_138)
    repeat
      L0_137 = wait
      L0_137()
      L0_137 = isLithographStart
      L0_137 = L0_137()
    until L0_137
    L0_137 = setFirstHalfProcessEnd
    L0_137()
    L0_137 = Fn_missionView
    L4_141 = true
    L0_137(L1_138, L2_139, L3_140, L4_141)
    L0_137 = _enemySpawn_task
    if L0_137 ~= nil then
      L0_137 = _enemySpawn_task
      L0_137 = L0_137.abort
      L0_137(L1_138)
      _enemySpawn_task = nil
    end
    L0_137 = 0
    for L4_141, L5_142 in L1_138(L2_139) do
      L6_143(L7_144)
      L6_143(L7_144)
      for L9_146, L10_147 in L6_143(L7_144) do
        if string.match(L10_147, "MissionTarget") ~= nil then
          if string.match(L10_147, _goalArea) ~= nil then
            print("-// \228\184\139\232\168\152\227\129\174\227\130\168\227\131\141\227\131\159\227\131\188\227\130\176\227\131\171\227\131\188\227\131\151\227\130\146\233\133\141\231\189\174 //-")
            print(L10_147)
            findGameObject2("EnemyGenerator", L10_147):requestSpawn()
            if L10_147 == "enmgen2_MissionTarget_wa_a_01_01" then
              L0_137 = L0_137 + enmgen2_MissionTarget_wa_a_01_01:getEnemyMax()
            elseif L10_147 == "enmgen2_MissionTarget_wa_a_01_02" then
              L0_137 = L0_137 + enmgen2_MissionTarget_wa_a_01_02:getEnemyMax()
            elseif L10_147 == "enmgen2_MissionTarget_wa_a_01_03" then
              L0_137 = L0_137 + enmgen2_MissionTarget_wa_a_01_03:getEnemyMax()
            end
          end
        else
          findGameObject2("EnemyGenerator", L10_147):requestAllEnemyKill()
        end
      end
    end
    for L4_141 = 1, 3 do
      L5_142 = invokeSystemTask
      L5_142(L6_143)
      break
    end
    L1_138(L2_139, L3_140)
    L1_138(L2_139, L3_140)
    L1_138(L2_139, L3_140)
    L1_138(L2_139, L3_140)
    L1_138(L2_139)
    _mission_start = true
    while true do
      if true ~= L1_138 then
        if L1_138 == 0 then
          L1_138(L2_139)
          _mission_clear = true
        elseif L1_138 == L2_139 then
          if L1_138 ~= L2_139 then
            L1_138(L2_139)
            _mission_faled = true
          end
        end
        if L1_138 == true then
          _mission_start = false
          _mission_clear = false
          L1_138(L2_139, L3_140)
          L1_138()
          L1_138()
          repeat
            L1_138()
          until L1_138
          L1_138()
          L1_138()
          L1_138(L2_139)
          break
        elseif L1_138 == true then
          _mission_start = false
          _mission_faled = false
          for L4_141 = 1, 3 do
            L5_142 = _gem_obj
            L5_142 = L5_142[L4_141]
            if L5_142 ~= nil then
              L5_142 = _gem_obj
              L5_142 = L5_142[L4_141]
              L5_142 = L5_142.try_term
              L5_142(L6_143)
              L5_142 = _gem_obj
              L5_142[L4_141] = nil
            end
          end
          L1_138(L2_139, L3_140)
          L1_138()
          repeat
            L1_138()
          until L1_138
          L1_138()
          L1_138()
        end
      end
      L1_138()
    end
    for L4_141, L5_142 in L1_138(L2_139) do
      for L9_146, L10_147 in L6_143(L7_144) do
        findGameObject2("EnemyGenerator", L10_147):requestAllEnemyKill()
      end
    end
  else
    L0_137 = print
    L0_137(L1_138)
    L0_137 = Fn_setGravityGateActive
    L0_137(L1_138)
  end
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  if HUD:counter999IsVisible() then
    HUD:counter999SetVisible(false)
  end
end
function pcspheresensor2_MissionArea_OnLeave()
  if _mission_start == true then
    print("\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\228\184\173\227\129\171\229\179\182\227\130\146\233\155\162\227\130\140\227\129\166\227\129\151\227\129\190\227\129\163\227\129\159")
    _mission_faled = true
  end
end
