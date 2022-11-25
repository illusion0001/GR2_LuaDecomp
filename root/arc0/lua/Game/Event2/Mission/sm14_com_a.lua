import("GravityOre")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Mission/sm14_common.lua")
RETRY_ORE_GAP = 10
SPAWN_ENEMY_MAX = 16
_area_num = nil
_enmgen = nil
_is_enemy_spawn_settled = false
_is_enemy_spawn_request = false
_reinforceenemy_spawn_request = {
  false,
  false,
  false
}
_is_enemy_idle = false
_enemy_cnt = 0
_enemy_max = 5
_enemy_name_list = {}
_giant_name = "sm14_enemy_16"
_first_enemy_prepare_check = false
_first_enemy_prepare = false
_last_attacker = ""
_last_count = 0
_each_last_count = {0, 0}
_puppet_crow = nil
_brain_crow = nil
_is_crow_idle = false
_is_crow_spawn_request = false
_is_crow_spawn_settled = false
_set_mine_objects_request = false
_crow_end_mine_request = false
_is_crow_fix_request = false
mine_name = "sm14_mine"
_reset_all_count_flag_request = false
_ore_max = {}
_ore_max[1] = 114
_ore_max[2] = 110
_ore_max[3] = 102
_ore_hdl_b = {}
_ore_hdl_c1 = {}
_ore_hdl_c2 = {}
_ore_majority = {}
_ore_caption_active = true
_total_gravity_ore_broken_count = 0
_kit_gravity_ore_broken_count = 0
_crow_gravity_ore_broken_count = 0
_crow_continuity_cnt = 0
_kit_broke = false
_crow_majority = false
_kitun_voice_tbl = {}
_crow_voice_tbl = {}
_kitun_voice_index = 0
_crow_voice_index = 0
_dist = nil
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = false,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
enmgen2_com_a_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_enemy_01",
      type = "stalker",
      locator = "locator_enemy_01"
    },
    {
      name = "sm14_enemy_02",
      type = "stalker",
      locator = "locator_enemy_02"
    },
    {
      name = "sm14_enemy_03",
      type = "stalker",
      locator = "locator_enemy_03"
    },
    {
      name = "sm14_enemy_04",
      type = "guardcore",
      locator = "locator_enemy_04"
    },
    {
      name = "sm14_enemy_05",
      type = "guardcore",
      locator = "locator_enemy_05"
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
    _enemy_cnt = _enemy_cnt + 1
    removeEnemyNameFromList(A1_9:getName())
  end,
  onSetupGem = function(A0_10, A1_11)
    Fn_enemyPopGemSetup(A0_10, {
      "sm14_enemy_01",
      "sm14_enemy_02",
      "sm14_enemy_03",
      "sm14_enemy_04",
      "sm14_enemy_05"
    }, 2, GEM_ENERGY)
  end,
  onPopGem = function(A0_12, A1_13)
    Fn_enemyAshPopGem(A0_12, A1_13)
  end
}
enmgen2_com_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_enemy_06",
      type = "imp",
      locator = "locator_enemy_06"
    },
    {
      name = "sm14_enemy_07",
      type = "imp",
      locator = "locator_enemy_07"
    },
    {
      name = "sm14_enemy_08",
      type = "gellyfish",
      locator = "locator_enemy_08"
    },
    {
      name = "sm14_enemy_09",
      type = "gellyfish",
      locator = "locator_enemy_09"
    },
    {
      name = "sm14_enemy_10",
      type = "gellyfish",
      locator = "locator_enemy_10"
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
    _enemy_cnt = _enemy_cnt + 1
    removeEnemyNameFromList(A1_23:getName())
  end,
  onSetupGem = function(A0_24, A1_25)
    Fn_enemyPopGemSetup(A0_24, {
      "sm14_enemy_06",
      "sm14_enemy_07",
      "sm14_enemy_08",
      "sm14_enemy_09",
      "sm14_enemy_10"
    }, 2, GEM_ENERGY)
  end,
  onPopGem = function(A0_26, A1_27)
    Fn_enemyAshPopGem(A0_26, A1_27)
  end
}
enmgen2_com_a_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_enemy_11",
      type = "stalker",
      locator = "locator_enemy_11"
    },
    {
      name = "sm14_enemy_12",
      type = "stalker",
      locator = "locator_enemy_12"
    },
    {
      name = "sm14_enemy_13",
      type = "imp",
      locator = "locator_enemy_13"
    },
    {
      name = "sm14_enemy_14",
      type = "imp",
      locator = "locator_enemy_14"
    },
    {
      name = "sm14_enemy_15",
      type = "imp",
      locator = "locator_enemy_15"
    }
  },
  onUpdate = function(A0_28)
    local L1_29
  end,
  onEnter = function(A0_30)
    local L1_31
  end,
  onLeave = function(A0_32)
    local L1_33
  end,
  onObjectDead = function(A0_34, A1_35)
  end,
  onObjectAsh = function(A0_36, A1_37)
    _enemy_cnt = _enemy_cnt + 1
    removeEnemyNameFromList(A1_37:getName())
  end,
  onSetupGem = function(A0_38, A1_39)
    Fn_enemyPopGemSetup(A0_38, {
      "sm11_enemy_11",
      "sm14_enemy_12",
      "sm14_enemy_13",
      "sm14_enemy_14",
      "sm14_enemy_15"
    }, 2, GEM_SPECIAL)
  end,
  onPopGem = function(A0_40, A1_41)
    Fn_enemyAshPopGem(A0_40, A1_41)
  end
}
enmgen2_com_a_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_enemy_16",
      name = _giant_name
    }
  },
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onObjectDead = function(A0_48, A1_49)
  end,
  onObjectAsh = function(A0_50, A1_51)
    _enemy_cnt = _enemy_cnt + 1
    removeEnemyNameFromList(A1_51:getName())
  end
}
enmgen2_pi_a_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_pi_a_01_01",
      type = "stalker",
      locator = "locator_pi_a_01_01"
    },
    {
      name = "sm14_pi_a_01_02",
      type = "stalker",
      locator = "locator_pi_a_01_02"
    }
  }
}
enmgen2_pi_a_03_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_pi_a_03_04_01",
      type = "imp",
      locator = "locator_pi_a_03_04_01"
    }
  }
}
enmgen2_pi_a_06_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_pi_a_06_01_01",
      type = "runner",
      locator = "locator_pi_a_06_01_01"
    },
    {
      name = "sm14_pi_a_06_01_02",
      type = "gellyfish",
      locator = "locator_pi_a_06_01_02"
    },
    {
      name = "sm14_pi_a_06_01_03",
      type = "gellyfish",
      locator = "locator_pi_a_06_01_03"
    },
    {
      name = "sm14_pi_a_06_01_04",
      type = "gellyfish",
      locator = "locator_pi_a_06_01_04"
    }
  }
}
enmgen2_pi_a_11 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_pi_a_11_01",
      type = "runner",
      locator = "locator_pi_a_11_01"
    },
    {
      name = "sm14_pi_a_11_02",
      type = "gellyfish",
      locator = "locator_pi_a_11_02"
    },
    {
      name = "sm14_pi_a_11_03",
      type = "gellyfish",
      locator = "locator_pi_a_11_03"
    }
  }
}
enmgen2_pi_a_25 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_pi_a_25_01",
      type = "guardcore",
      locator = "locator_pi_a_25_01"
    },
    {
      name = "sm14_pi_a_25_02",
      type = "guardcore",
      locator = "locator_pi_a_25_02"
    },
    {
      name = "sm14_pi_a_25_03",
      type = "imp",
      locator = "locator_pi_a_25_03"
    },
    {
      name = "sm14_pi_a_25_04",
      type = "imp",
      locator = "locator_pi_a_25_04"
    }
  }
}
function Initialize()
  Fn_sendSetOtherPreciousGemCount(9999, 0)
end
function Ingame()
  local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57, L6_58
  L0_52(L1_53, L2_54, L3_55)
  L0_52(L1_53)
  repeat
    L0_52()
  until L0_52
  L0_52(L1_53)
  for L3_55 = 1, L1_53[1] do
    L5_57 = Fn_getGravityOre2
    L6_58 = "gravityore_b_"
    L6_58 = L6_58 .. string.format("%03d", L3_55)
    L5_57 = L5_57(L6_58)
    L4_56[L3_55] = L5_57
  end
  for L3_55 = 1, L1_53[2] do
    L5_57 = Fn_getGravityOre2
    L6_58 = "gravityore_c1_"
    L6_58 = L6_58 .. string.format("%03d", L3_55)
    L5_57 = L5_57(L6_58)
    L4_56[L3_55] = L5_57
  end
  for L3_55 = 1, L1_53[3] do
    L5_57 = Fn_getGravityOre2
    L6_58 = "gravityore_c2_"
    L6_58 = L6_58 .. string.format("%03d", L3_55)
    L5_57 = L5_57(L6_58)
    L4_56[L3_55] = L5_57
  end
  for L3_55 = 1, 3 do
    if L4_56 == 0 then
      L5_57 = _ore_max
      L5_57 = L5_57[L3_55]
      L5_57 = L5_57 / 2
      L5_57 = L5_57 + 1
      L4_56[L3_55] = L5_57
    else
      L5_57 = _ore_max
      L5_57 = L5_57[L3_55]
      L5_57 = L5_57 + 1
      L5_57 = L5_57 / 2
      L4_56[L3_55] = L5_57
    end
  end
  for L3_55 = 1, SPAWN_ENEMY_MAX do
    L5_57 = _enemy_name_list
    L6_58 = "sm14_enemy_"
    L6_58 = L6_58 .. string.format("%02d", L3_55)
    L4_56(L5_57, L6_58)
  end
  while true do
    if L1_53 then
      for L5_57, L6_58 in L2_54(L3_55) do
        if findGameObject2("EnemyGenerator", L6_58) ~= nil then
          findGameObject2("EnemyGenerator", L6_58):requestSpawn()
          while not findGameObject2("EnemyGenerator", L6_58):isPrepared() do
            wait()
          end
          findGameObject2("EnemyGenerator", L6_58):setEventListener("DestroyEnemyReport", L0_52)
          print("\227\130\168\227\131\141\227\131\159\227\131\188\227\129\174\227\130\164\227\131\153\227\131\179\227\131\136\232\168\173\229\174\154")
        end
      end
      _is_enemy_spawn_request = false
    end
    for L4_56 = 1, 3 do
      L5_57 = _reinforceenemy_spawn_request
      L5_57 = L5_57[L4_56]
      if L5_57 then
        L5_57 = findGameObject2
        L6_58 = "EnemyGenerator"
        L5_57 = L5_57(L6_58, "enmgen2_com_a_0" .. L4_56 + 1)
        L6_58 = L5_57.requestSpawn
        L6_58(L5_57)
        while true do
          L6_58 = L5_57.isPrepared
          L6_58 = L6_58(L5_57)
          if not L6_58 then
            L6_58 = wait
            L6_58()
          end
        end
        if L4_56 ~= 3 then
          L6_58 = _enemy_max
          L6_58 = L6_58 + 5
          _enemy_max = L6_58
        else
          L6_58 = _enemy_max
          L6_58 = L6_58 + 1
          _enemy_max = L6_58
        end
        L6_58 = L5_57.setEventListener
        L6_58(L5_57, "DestroyEnemyReport", L0_52)
        L6_58 = _reinforceenemy_spawn_request
        L6_58[L4_56] = false
      end
    end
    if L1_53 then
      _puppet_crow = L1_53
      _brain_crow = L1_53
      if L1_53 then
        L1_53(L2_54)
        _is_crow_fix_request = false
      end
      _is_crow_spawn_request = false
    end
    if L1_53 then
      if L1_53 == 1 then
        L1_53(L2_54, L3_55)
      elseif L1_53 == 2 then
        L1_53(L2_54, L3_55)
      elseif L1_53 == 3 then
        L1_53(L2_54, L3_55)
      end
      _set_mine_objects_request = false
    end
    if L1_53 then
      L1_53(L2_54)
      L1_53(L2_54)
      while true do
        if L1_53 == false then
          L1_53()
        end
      end
      L1_53(L2_54)
      L1_53(L2_54)
      _crow_end_mine_request = false
    end
    if L1_53 then
      _total_gravity_ore_broken_count = 0
      _kit_gravity_ore_broken_count = 0
      _crow_gravity_ore_broken_count = 0
      _crow_continuity_cnt = 0
      _kit_broke = false
      _crow_majority = false
      _kitun_voice_index = 0
      _crow_voice_index = 0
      _reset_all_count_flag_request = false
    end
    L1_53()
  end
end
function Finalize()
  GravityOre.setLockonDistance(1)
  Fn_sendStopOtherPreciousGemCount()
end
function sm14_oreBroken(A0_59)
  _total_gravity_ore_broken_count = _total_gravity_ore_broken_count + 1
  print("=============================================")
  if A0_59:getName() ~= nil then
    print("\231\160\180\229\163\138\233\137\177\231\159\179\229\144\141.." .. A0_59:getName())
  end
  print("\228\186\140\228\186\186\227\129\174\229\144\136\232\168\136\231\160\180\229\163\138\230\149\176\239\188\154" .. _total_gravity_ore_broken_count)
  if A0_59:isBrokenFromCrow() then
    _crow_gravity_ore_broken_count = _crow_gravity_ore_broken_count + 1
    _crow_continuity_cnt = _crow_continuity_cnt + 1
    _kit_broke = false
    print("\227\130\175\227\131\173\227\130\166\233\137\177\231\159\179\231\160\180\229\163\138\230\149\176 = " .. _crow_gravity_ore_broken_count)
    if _crow_continuity_cnt == _ore_majority[_area_num] then
      _brain_crow:setIdling(true)
      _crow_majority = true
      print("\227\130\175\227\131\173\227\130\166\239\188\154\227\130\162\227\130\164\227\131\137\227\131\171\231\138\182\230\133\139")
    end
  elseif A0_59:isBrokenFromCrow() == false then
    _kit_gravity_ore_broken_count = _kit_gravity_ore_broken_count + 1
    print("\227\130\173\227\131\136\227\130\165\227\131\179\233\137\177\231\159\179\231\160\180\229\163\138\230\149\176 = " .. _kit_gravity_ore_broken_count)
    _kit_broke = true
    _crow_continuity_cnt = 0
    if _crow_majority then
      _brain_crow:setIdling(false)
      _crow_majority = false
      print("\227\130\175\227\131\173\227\130\166\239\188\154\227\130\162\227\130\164\227\131\137\227\131\171\231\138\182\230\133\139\232\167\163\233\153\164")
    end
  end
  _kitun_voice_tbl[1] = {
    "sm14_09000",
    "sm14_09001",
    "sm14_09002",
    "sm14_09003"
  }
  _kitun_voice_tbl[2] = {
    "sm14_09004",
    "sm14_09005",
    "sm14_09006",
    "sm14_09007"
  }
  _kitun_voice_tbl[3] = {
    "sm14_09008",
    "sm14_09009",
    "sm14_09010",
    "sm14_09011"
  }
  _crow_voice_tbl[1] = {
    "sm14_09012",
    "sm14_09013",
    "sm14_09014",
    "sm14_09015"
  }
  _crow_voice_tbl[2] = {
    "sm14_09016",
    "sm14_09017",
    "sm14_09018",
    "sm14_09019"
  }
  _crow_voice_tbl[3] = {
    "sm14_09020",
    "sm14_09021",
    "sm14_09022",
    "sm14_09023"
  }
  if _total_gravity_ore_broken_count ~= _ore_max[_area_num] and _ore_caption_active then
    if _kit_broke and not Fn_isCaptionView() then
      _kitun_voice_index = _kitun_voice_index % #_kitun_voice_tbl[_area_num] + 1
      _kit_voice_task = invokeTask(function()
        Fn_captionView(_kitun_voice_tbl[_area_num][_kitun_voice_index])
      end)
    elseif _kit_broke == false and _crow_gravity_ore_broken_count - _kit_gravity_ore_broken_count < RETRY_ORE_GAP and not Fn_isCaptionView() then
      _dist = Fn_getDistanceToPlayer(_puppet_crow)
      if Mv_raycastCameraSight(_puppet_crow) or _dist < 15 then
        _crow_voice_index = _crow_voice_index % #_crow_voice_tbl[_area_num] + 1
        _crow_voice_task = invokeTask(function()
          Fn_captionView(_crow_voice_tbl[_area_num][_crow_voice_index])
        end)
      end
    end
  end
end
function setOreCaptionActive(A0_60)
  local L1_61
  _ore_caption_active = A0_60
end
function requestSpawnEnemy()
  local L1_62
  L1_62 = _is_enemy_spawn_settled
  if not L1_62 then
    _is_enemy_spawn_request = true
    _is_enemy_spawn_settled = true
  end
end
function requestSpawnReinforceEnemy(A0_63)
  _reinforceenemy_spawn_request[A0_63] = true
end
function requestIdleEnemy(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69, L6_70
  L1_65 = {
    L2_66,
    L3_67,
    L4_68,
    L5_69,
    L6_70,
    "enmgen2_pi_a_06_01",
    "enmgen2_pi_a_11",
    "enmgen2_pi_a_16_01",
    "enmgen2_pi_a_25"
  }
  L5_69 = "enmgen2_pi_a_01"
  L6_70 = "enmgen2_pi_a_03_04"
  for L5_69, L6_70 in L2_66(L3_67) do
    if findGameObject2("EnemyGenerator", L6_70) ~= nil then
      findGameObject2("EnemyGenerator", L6_70):requestIdlingEnemy(A0_64)
    end
  end
  if A0_64 then
    _is_enemy_idle = true
  else
    _is_enemy_idle = false
  end
end
function requestChangeEnemyMarker(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76, L6_77
  L1_72 = {
    L2_73,
    L3_74,
    L4_75,
    L5_76,
    L6_77,
    "enmgen2_pi_a_06_01",
    "enmgen2_pi_a_11",
    "enmgen2_pi_a_16_01",
    "enmgen2_pi_a_25"
  }
  L5_76 = "enmgen2_pi_a_01"
  L6_77 = "enmgen2_pi_a_03_04"
  for L5_76, L6_77 in L2_73(L3_74) do
    if findGameObject2("EnemyGenerator", L6_77) ~= nil then
      findGameObject2("EnemyGenerator", L6_77):setEnemyMarker(A0_71)
      print("\227\130\168\227\131\141\227\131\159\227\131\188\227\131\158\227\131\188\227\130\171\227\131\188\229\136\135\230\155\191")
    end
  end
end
function requestDestroyEnemy()
  local L0_78, L1_79, L2_80, L3_81, L4_82, L5_83
  L0_78 = {
    L1_79,
    L2_80,
    L3_81,
    L4_82,
    L5_83,
    "enmgen2_pi_a_25"
  }
  L4_82 = "enmgen2_pi_a_11"
  L5_83 = "enmgen2_pi_a_16_01"
  for L4_82, L5_83 in L1_79(L2_80) do
    if findGameObject2("EnemyGenerator", L5_83) ~= nil then
      findGameObject2("EnemyGenerator", L5_83):requestAllEnemyKill()
    end
  end
end
function isSpawnEnemy()
  local L0_84, L1_85
  L0_84 = _is_enemy_spawn_settled
  return L0_84
end
function isIdleEnemy()
  local L0_86, L1_87
  L0_86 = _is_enemy_idle
  return L0_86
end
function isBattleEnd()
  return _enemy_cnt >= _enemy_max
end
function requestDeadEnemyNum()
  local L0_88, L1_89
  L0_88 = _enemy_cnt
  return L0_88
end
function requestEnemyMax()
  local L0_90, L1_91
  L0_90 = _enemy_max
  return L0_90
end
function getLastEnemyHandle()
  if table.maxn(_enemy_name_list) ~= 1 then
    return nil
  end
  return findGameObject2("Node", _enemy_name_list[1])
end
function getGiantHandle()
  return findGameObject2("Node", _giant_name)
end
function removeEnemyNameFromList(A0_92)
  local L1_93, L2_94, L3_95, L4_96
  for L4_96 = 1, L2_94(L3_95) do
    if _enemy_name_list[L4_96] == A0_92 then
      table.remove(_enemy_name_list, L4_96)
      print("\233\153\164\229\144\141\229\174\140\228\186\134 \226\134\146 " .. A0_92)
    end
  end
  L4_96 = _enemy_name_list
  L4_96 = "\228\189\147"
  L1_93(L2_94)
end
function requestSpawnCrow(A0_97)
  if not _is_crow_spawn_settled then
    _is_crow_spawn_request = true
    _is_crow_spawn_settled = true
    _is_crow_fix_request = A0_97
  end
end
function isSpawnCrow()
  local L0_98, L1_99
  L0_98 = _is_crow_spawn_settled
  return L0_98
end
function crowPuppetHandle()
  local L0_100, L1_101
  L0_100 = _puppet_crow
  return L0_100
end
function crowBrainHandle()
  local L0_102, L1_103
  L0_102 = _brain_crow
  return L0_102
end
function crowSetMineObjects()
  local L0_104, L1_105
  _set_mine_objects_request = true
end
function crowEndMine()
  local L0_106, L1_107
  _crow_end_mine_request = true
end
function changeAreaNum(A0_108)
  _area_num = A0_108
  print("\227\130\168\227\131\170\227\130\162\231\149\170\229\143\183\239\188\154" .. _area_num)
end
function kitOreBrokenCount()
  local L0_109, L1_110
  L0_109 = _kit_gravity_ore_broken_count
  return L0_109
end
function crowOreBrokenCount()
  local L0_111, L1_112
  L0_111 = _crow_gravity_ore_broken_count
  return L0_111
end
function totalOreBrokenCount()
  local L0_113, L1_114
  L0_113 = _total_gravity_ore_broken_count
  return L0_113
end
function getLastAttacker()
  local L0_115, L1_116
  L0_115 = _last_attacker
  return L0_115
end
function getLastCount()
  local L0_117, L1_118
  L0_117 = _last_count
  return L0_117
end
function getLastEachCount()
  local L0_119, L1_120
  L0_119 = _last_attacker
  if L0_119 == "player" then
    L0_119 = _each_last_count
    L0_119 = L0_119[1]
    return L0_119
  else
    L0_119 = _each_last_count
    L0_119 = L0_119[2]
    return L0_119
  end
end
function resetAllCountFlag()
  local L0_121, L1_122
  _reset_all_count_flag_request = true
end
function resetAllOre()
  local L0_123, L1_124, L2_125, L3_126, L4_127
  for L3_126 = 1, L1_124[1] do
    L4_127 = _ore_hdl_b
    L4_127 = L4_127[L3_126]
    if L4_127:isBroken() then
      L4_127:requestRestoreForce()
    end
  end
  for L3_126 = 1, L1_124[2] do
    L4_127 = _ore_hdl_c1
    L4_127 = L4_127[L3_126]
    if L4_127:isBroken() then
      L4_127:requestRestoreForce()
    end
  end
  for L3_126 = 1, L1_124[3] do
    L4_127 = _ore_hdl_c2
    L4_127 = L4_127[L3_126]
    if L4_127:isBroken() then
      L4_127:requestRestoreForce()
    end
  end
end
