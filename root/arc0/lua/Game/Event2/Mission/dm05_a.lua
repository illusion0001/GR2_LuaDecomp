dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
MEMORIES_NUM = 5
ENEMY_KILL_RATE = 0.5
RESPAWN_ATTACK_DELAY = 60
ENEMY_STATUS_IDLE = 1
ENEMY_STATUS_KILL = 2
ENEMY_STATUS_WAIT = 4
ENEMY_STATUS_SPANWN = 5
ENEMY_TYPE_LUMINO = 1
ENEMY_TYPE_TENEBRIA = 2
_enemyWork = {
  {
    name = "lumino",
    gauge_text = "ui_boss_hp_09"
  },
  {
    name = "tenebria",
    gauge_text = "ui_boss_hp_10"
  }
}
_enemyKillCount = 0
_isExistLumino = false
_isExistTenebria = false
_isDownedLumino = false
_isDownedTenebria = false
_memoriesCollected = 0
_areaWork = {}
_currentCheckpoint = "locator2_pc_start_pos"
_currentArea = 2
_trophyUnlock = true
_captionWait = false
dm05func = {}
function dm05func.onSpawn(A0_0, A1_1, A2_2)
  print("dm05func:onSpawn.." .. A2_2:getName())
  if string.match(A2_2:getName(), _enemyWork[ENEMY_TYPE_LUMINO].name) ~= nil then
    _enemyWork[ENEMY_TYPE_LUMINO].effect = RAC_createEffect({
      eff_name = "ef_ev_lmn_in",
      world_pos = findGameObject2("Puppet", A2_2:getName()):getWorldTransform()
    })
    _isExistLumino = true
  elseif string.match(A2_2:getName(), _enemyWork[ENEMY_TYPE_TENEBRIA].name) ~= nil then
    _enemyWork[ENEMY_TYPE_TENEBRIA].effect = RAC_createEffect({
      eff_name = "ef_ev_tnb_in",
      world_pos = findGameObject2("Puppet", A2_2:getName()):getWorldTransform()
    })
    _isExistTenebria = true
  end
end
function dm05func.onObjectAsh(A0_3, A1_4)
  local L2_5
  L2_5 = print
  L2_5("dm05func:onObjectAsh.." .. A1_4:getName())
  L2_5 = string
  L2_5 = L2_5.match
  L2_5 = L2_5(A1_4:getName(), _enemyWork[ENEMY_TYPE_LUMINO].name)
  if L2_5 ~= nil then
    L2_5 = findGameObject2
    L2_5 = L2_5("Puppet", A1_4:getName())
    _enemyWork[ENEMY_TYPE_LUMINO].effect = RAC_createEffect({
      eff_name = "ef_ev_lmn_out",
      world_pos = L2_5:getWorldTransform()
    })
    if _enemyWork[ENEMY_TYPE_LUMINO].kill_flag == true and _enemyWork[ENEMY_TYPE_LUMINO].lost_flag == false then
      if _isDownedLumino == false and _isExistTenebria == true then
        Fn_kaiwaDemoView("dm05_00150k")
        _isDownedLumino = true
      end
      if dm05func:getNearestMemory(L2_5) ~= nil then
        dm_createTrailEffect("ef_ev_trl_01", L2_5:getWorldPos(), dm05func:getNearestMemory(L2_5):getWorldPos())
      end
      RAC_createGemBase(A1_4:getName() .. "_Gem", GEM_VITAL, L2_5)
      _enemyWork[ENEMY_TYPE_TENEBRIA].lost_flag = true
    end
    _isExistLumino = false
  else
    L2_5 = string
    L2_5 = L2_5.match
    L2_5 = L2_5(A1_4:getName(), _enemyWork[ENEMY_TYPE_TENEBRIA].name)
    if L2_5 ~= nil then
      L2_5 = findGameObject2
      L2_5 = L2_5("Puppet", A1_4:getName())
      _enemyWork[ENEMY_TYPE_TENEBRIA].effect = RAC_createEffect({
        eff_name = "ef_ev_tnb_out",
        world_pos = L2_5:getWorldTransform()
      })
      if _enemyWork[ENEMY_TYPE_TENEBRIA].kill_flag == true and _enemyWork[ENEMY_TYPE_TENEBRIA].lost_flag == false then
        if _isDownedTenebria == false and _isExistLumino == true then
          Fn_kaiwaDemoView("dm05_00160k")
          _isDownedTenebria = true
        end
        if dm05func:getNearestMemory(L2_5) ~= nil then
          dm_createTrailEffect("ef_ev_trl_01", L2_5:getWorldPos(), dm05func:getNearestMemory(L2_5):getWorldPos())
        end
        RAC_createGemBase(A1_4:getName() .. "_Gem", GEM_VITAL, L2_5)
        _enemyWork[ENEMY_TYPE_LUMINO].lost_flag = true
      end
      _isExistTenebria = false
    end
  end
end
function dm05func.getNearestMemory(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14
  L2_8 = nil
  L3_9 = 0
  L4_10 = 0
  for L8_14, _FORV_9_ in L5_11(L6_12) do
    if _areaWork[L8_14].getMemory == false and (L2_8 == nil or L3_9 > Fn_get_distance(A1_7:getWorldPos(), findGameObject2("Node", "locator2_memory_effect_" .. string.format("%02d", L8_14)):getWorldPos())) then
      L3_9, L2_8 = Fn_get_distance(A1_7:getWorldPos(), findGameObject2("Node", "locator2_memory_effect_" .. string.format("%02d", L8_14)):getWorldPos()), findGameObject2("Node", "locator2_memory_effect_" .. string.format("%02d", L8_14))
      L4_10 = L8_14
    end
  end
  L5_11(L6_12)
  return L2_8
end
enmgen2_lumino_00 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lumino_dm05",
      locator = "locator2_lumino_00",
      name = "lumino_00",
      ai_spawn_option = "Lumino/dm05_a"
    }
  },
  onSpawn = function(A0_15, A1_16)
    dm05func:onSpawn(A0_15, A1_16)
  end
}
enmgen2_tenebria_00 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "tenebria_dm05",
      locator = "locator2_tenebria_00",
      name = "tenebria_00",
      ai_spawn_option = "Tenebria/dm05_a"
    }
  },
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_00",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_00",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_00",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_00",
      name = "call_tenebria_04"
    }
  },
  onSpawn = function(A0_17, A1_18)
    dm05func:onSpawn(A0_17, A1_18)
  end
}
enmgen2_lumino_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lumino_dm05",
      locator = "locator2_lumino_01",
      name = "lumino_01",
      ai_spawn_option = "Lumino/dm05_a"
    }
  },
  onSpawn = function(A0_19, A1_20)
    dm05func:onSpawn(A0_19, A1_20)
  end
}
enmgen2_tenebria_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "tenebria_dm05",
      locator = "locator2_tenebria_01",
      name = "tenebria_01",
      ai_spawn_option = "Tenebria/dm05_a"
    }
  },
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_01",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_01",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_01",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_01",
      name = "call_tenebria_04"
    }
  },
  onSpawn = function(A0_21, A1_22)
    dm05func:onSpawn(A0_21, A1_22)
  end
}
enmgen2_lumino_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lumino_dm05",
      locator = "locator2_lumino_02",
      name = "lumino_02",
      ai_spawn_option = "Lumino/dm05_a"
    }
  },
  onSpawn = function(A0_23, A1_24)
    dm05func:onSpawn(A0_23, A1_24)
  end
}
enmgen2_tenebria_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "tenebria_dm05",
      locator = "locator2_tenebria_02",
      name = "tenebria_02",
      ai_spawn_option = "Tenebria/dm05_a"
    }
  },
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_02",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_02",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_02",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_02",
      name = "call_tenebria_04"
    }
  },
  onSpawn = function(A0_25, A1_26)
    dm05func:onSpawn(A0_25, A1_26)
  end
}
enmgen2_lumino_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lumino_dm05",
      locator = "locator2_lumino_03",
      name = "lumino_03",
      ai_spawn_option = "Lumino/dm05_a"
    }
  },
  onSpawn = function(A0_27, A1_28)
    dm05func:onSpawn(A0_27, A1_28)
  end
}
enmgen2_tenebria_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "tenebria_dm05",
      locator = "locator2_tenebria_03",
      name = "tenebria_03",
      ai_spawn_option = "Tenebria/dm05_a"
    }
  },
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_03",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_03",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_03",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_03",
      name = "call_tenebria_04"
    }
  },
  onSpawn = function(A0_29, A1_30)
    dm05func:onSpawn(A0_29, A1_30)
  end
}
enmgen2_lumino_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lumino_dm05",
      locator = "locator2_lumino_04",
      name = "lumino_04",
      ai_spawn_option = "Lumino/dm05_a"
    }
  },
  onSpawn = function(A0_31, A1_32)
    dm05func:onSpawn(A0_31, A1_32)
  end
}
enmgen2_tenebria_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "tenebria_dm05",
      locator = "locator2_tenebria_04",
      name = "tenebria_04",
      ai_spawn_option = "Tenebria/dm05_a"
    }
  },
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_04",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_04",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_04",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_04",
      name = "call_tenebria_04"
    }
  },
  onSpawn = function(A0_33, A1_34)
    dm05func:onSpawn(A0_33, A1_34)
  end
}
enmgen2_lumino_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lumino_dm05",
      locator = "locator2_lumino_05",
      name = "lumino_05",
      ai_spawn_option = "Lumino/dm05_a"
    }
  },
  onSpawn = function(A0_35, A1_36)
    dm05func:onSpawn(A0_35, A1_36)
  end
}
enmgen2_tenebria_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "tenebria_dm05",
      locator = "locator2_tenebria_05",
      name = "tenebria_05",
      ai_spawn_option = "Tenebria/dm05_a"
    }
  },
  addTenebriaSpawnSetName = "spawnSetTenebria",
  spawnSetTenebria = {
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_05",
      name = "call_tenebria_01"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_05",
      name = "call_tenebria_02"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_05",
      name = "call_tenebria_03"
    },
    {
      type = "tenebria_replica_dm05",
      locator = "locator2_tenebria_05",
      name = "call_tenebria_04"
    }
  },
  onSpawn = function(A0_37, A1_38)
    dm05func:onSpawn(A0_37, A1_38)
  end
}
function Initialize()
  local L0_39, L1_40, L2_41, L3_42, L4_43
  L0_39 = {
    L1_40,
    L2_41,
    L3_42
  }
  L1_40.name = "bit_01"
  L1_40.type = "bit02"
  L1_40.node = "locator2_bit_01"
  L2_41.name = "gade_01"
  L2_41.type = "gad01"
  L2_41.node = "locator2_gad01_01"
  L3_42.name = "cyanea_02"
  L3_42.type = "cya02"
  L3_42.node = "locator2_cya02_01"
  L1_40(L2_41)
  sdemo = L1_40
  L4_43 = "locator2_aim_01"
  L1_40(L2_41, L3_42, L4_43, false)
  L1_40(L2_41)
  _enemyKillCount = 0
  for L4_43, _FORV_5_ in L1_40(L2_41) do
    _enemyWork[L4_43].status = ENEMY_STATUS_IDLE
    _enemyWork[L4_43].kill_flag = false
    _enemyWork[L4_43].lost_flag = false
    _enemyWork[L4_43].enm_gen = findGameObject2("EnemyGenerator", "enmgen2_" .. _enemyWork[L4_43].name .. "_00")
    _enemyWork[L4_43].brain = nil
    _enemyWork[L4_43].puppet = nil
  end
  for L4_43 = 1, MEMORIES_NUM do
    _areaWork[L4_43] = {}
    _areaWork[L4_43].memoryItem = RAC_createMemoryEffect(findGameObject2("Node", "locator2_memory_effect_" .. string.format("%02d", L4_43)))
    _areaWork[L4_43].getMemory = false
  end
end
function Ingame()
  local L0_44, L1_45, L2_46, L3_47
  L0_44()
  for L3_47, _FORV_4_ in L0_44(L1_45) do
    _FORV_4_.memoryItem:requestActive()
  end
  L0_44()
  L0_44(L1_45)
  L0_44(L1_45)
  L0_44(L1_45)
  L0_44(L1_45)
  L3_47 = 1.5
  L0_44(L1_45, L2_46, L3_47)
  L0_44(L1_45)
  for L3_47, _FORV_4_ in L0_44(L1_45) do
    _enemyWork[L3_47].enm_gen:requestSpawn()
    RequestIdlingEnemy(L3_47, true)
  end
  L0_44(L1_45)
  L3_47 = 0.2
  L0_44(L1_45, L2_46, L3_47)
  L0_44(L1_45)
  L3_47 = "locator2_aim_02"
  L0_44(L1_45, L2_46, L3_47, false)
  L0_44(L1_45)
  L0_44(L1_45)
  L3_47 = 1
  L0_44(L1_45, L2_46, L3_47, "")
  L0_44(L1_45)
  L0_44(L1_45, L2_46)
  L0_44(L1_45)
  L0_44(L1_45)
  L0_44(L1_45)
  L0_44(L1_45)
  L3_47 = "dm05_00103"
  L0_44(L1_45, L2_46, L3_47, nil, nil, nil, "cro_264")
  for L3_47, _FORV_4_ in L0_44(L1_45) do
    StartMarker(L3_47, true)
    RequestIdlingEnemy(L3_47, false)
    _enemyWork[L3_47].respawn_task = EnemyRespawnControl(L3_47)
  end
  L0_44()
  L0_44(L1_45, L2_46)
  L0_44(L1_45, L2_46)
  L0_44(L1_45, L2_46)
  L0_44(L1_45, L2_46)
  while true do
    if L0_44 < L1_45 then
      L0_44(L1_45, L2_46)
      L0_44()
    end
  end
  L0_44()
  L0_44(L1_45, L2_46)
  if L0_44 == true then
    L0_44(L1_45)
    L0_44(L1_45, L2_46)
  end
  while true do
    if L0_44 == true then
      L0_44()
    end
  end
  L3_47 = 1
  L0_44(L1_45, L2_46, L3_47, "")
  L0_44(L1_45)
  L0_44()
  L0_44()
  L0_44()
  L0_44()
end
function Finalize()
  local L0_48, L1_49
end
function pccubesensor2_area_OnEnter(A0_50)
  _currentArea = RAC_getTailNumber(A0_50:getName(), 2)
  _currentCheckpoint = "locator2_pc_area_" .. string.format("%02d", _currentArea)
  print("pccubesensor2_area_OnEnter " .. _currentCheckpoint)
end
function WaitEnemySpawn(A0_51, A1_52)
  local L2_53
  L2_53 = _enemyWork
  L2_53 = L2_53[A0_51]
  L2_53.puppet = nil
  L2_53 = _enemyWork
  L2_53 = L2_53[A0_51]
  L2_53.brain = nil
  while true do
    L2_53 = _enemyWork
    L2_53 = L2_53[A0_51]
    L2_53 = L2_53.enm_gen
    L2_53 = L2_53.getEnemyCount
    L2_53 = L2_53(L2_53)
    if L2_53 > 0 then
      L2_53 = _enemyWork
      L2_53 = L2_53[A0_51]
      L2_53 = L2_53.name
      L2_53 = L2_53 .. "_" .. string.format("%02d", A1_52)
      if findGameObject2("Puppet", L2_53) ~= nil and findGameObject2("EnemyBrain", L2_53) ~= nil and findGameObject2("EnemyBrain", L2_53):isReadyEnemy() == true then
        _enemyWork[A0_51].puppet = findGameObject2("Puppet", L2_53)
        _enemyWork[A0_51].brain = findGameObject2("EnemyBrain", L2_53)
        _enemyWork[A0_51].brain:setVisibleBossMarker(false)
        _enemyWork[A0_51].brain:setVisibleEnemyMarker(false)
        break
      end
    end
    L2_53 = wait
    L2_53()
  end
end
function StartMarker(A0_54, A1_55)
  if _enemyWork[A0_54].brain ~= nil then
    _enemyWork[A0_54].brain:setVisibleBossMarker(A1_55)
    _enemyWork[A0_54].brain:setVisibleEnemyMarker(A1_55)
  end
end
function RequestIdlingEnemy(A0_56, A1_57)
  _enemyWork[A0_56].idling_flag = A1_57
  _enemyWork[A0_56].enm_gen:requestIdlingEnemy(_enemyWork[A0_56].idling_flag)
end
function StopRespawnEnemy()
  for _FORV_3_, _FORV_4_ in ipairs(_enemyWork) do
    if _enemyWork[_FORV_3_].respawn_task ~= nil then
      _enemyWork[_FORV_3_].respawn_task:abort()
      _enemyWork[_FORV_3_].respawn_task = nil
    end
  end
end
function IsHealthRateLowering(A0_58)
  if A0_58 == nil then
    return true
  end
  if A0_58:getHealth() / A0_58:getMaxHealth() < ENEMY_KILL_RATE then
    return true
  else
    return false
  end
end
function IsLuminoTenebriaKillAndSpawn(A0_59)
  if _enemyWork[A0_59].lost_flag == true then
    return true
  end
  if IsHealthRateLowering(_enemyWork[A0_59].brain) or _enemyWork[A0_59].enm_gen:getEnemyCount() == 0 then
    _enemyWork[A0_59].kill_flag = true
    return true
  end
  return false
end
function EnemyGaugeControl(A0_60)
  local L1_61
  L1_61 = {}
  function L1_61.update(A0_62)
    while _enemyWork[A0_60].puppet == nil do
      wait()
    end
    _enemyWork[A0_60].gauge_hdl = HUD:createBossHpGauge({
      obj = _enemyWork[A0_60].puppet,
      text = _enemyWork[A0_60].gauge_text
    })
    _enemyWork[A0_60].gauge_hdl:setActive(true)
    while _enemyWork[A0_60].puppet ~= nil and _enemyWork[A0_60].puppet:isRunning() do
      _enemyWork[A0_60].gauge_hdl:setHp(_enemyWork[A0_60].brain:getHealth() / _enemyWork[A0_60].brain:getMaxHealth())
      wait()
    end
  end
  function L1_61.destructor(A0_63)
    if _enemyWork[A0_60].gauge_hdl ~= nil then
      _enemyWork[A0_60].gauge_hdl:setActive(false)
      _enemyWork[A0_60].gauge_hdl = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L1_61.update, L1_61.destructor, L1_61)
end
function EnemyRespawnControl(A0_64)
  local L1_65
  L1_65 = {}
  _enemyWork[A0_64].gauge_task = EnemyGaugeControl(A0_64)
  function L1_65.update(A0_66)
    local L1_67, L2_68
    while true do
      L1_67 = _memoriesCollected
      L2_68 = MEMORIES_NUM
      if L1_67 < L2_68 then
        L1_67 = _enemyWork
        L2_68 = A0_64
        L1_67 = L1_67[L2_68]
        L1_67 = L1_67.idling_flag
        if L1_67 == false then
          L1_67 = _enemyWork
          L2_68 = A0_64
          L1_67 = L1_67[L2_68]
          L1_67 = L1_67.status
          L2_68 = ENEMY_STATUS_IDLE
          if L1_67 == L2_68 then
            L1_67 = print
            L2_68 = "EnemyRespawnControl ENEMY_STATUS_IDLE"
            L1_67(L2_68)
            while true do
              L1_67 = IsLuminoTenebriaKillAndSpawn
              L2_68 = A0_64
              L1_67 = L1_67(L2_68)
              if not L1_67 then
                L1_67 = wait
                L1_67()
              end
            end
            L1_67 = _enemyWork
            L2_68 = A0_64
            L1_67 = L1_67[L2_68]
            L1_67 = L1_67.gauge_task
            if L1_67 ~= nil then
              L1_67 = _enemyWork
              L2_68 = A0_64
              L1_67 = L1_67[L2_68]
              L1_67 = L1_67.gauge_task
              L2_68 = L1_67
              L1_67 = L1_67.abort
              L1_67(L2_68)
              L1_67 = _enemyWork
              L2_68 = A0_64
              L1_67 = L1_67[L2_68]
              L1_67.gauge_task = nil
            end
            L1_67 = _enemyWork
            L2_68 = A0_64
            L1_67 = L1_67[L2_68]
            L2_68 = ENEMY_STATUS_KILL
            L1_67.status = L2_68
          else
            L1_67 = _enemyWork
            L2_68 = A0_64
            L1_67 = L1_67[L2_68]
            L1_67 = L1_67.status
            L2_68 = ENEMY_STATUS_KILL
            if L1_67 == L2_68 then
              L1_67 = print
              L2_68 = "EnemyRespawnControl ENEMY_STATUS_KILL"
              L1_67(L2_68)
              L1_67 = dm05func
              L2_68 = L1_67
              L1_67 = L1_67.onObjectAsh
              L1_67(L2_68, _enemyWork[A0_64].brain)
              L1_67 = _enemyWork
              L2_68 = A0_64
              L1_67 = L1_67[L2_68]
              L1_67 = L1_67.enm_gen
              L2_68 = L1_67
              L1_67 = L1_67.requestAllEnemyKill
              L1_67(L2_68)
              L1_67 = _enemyWork
              L2_68 = A0_64
              L1_67 = L1_67[L2_68]
              L2_68 = ENEMY_STATUS_WAIT
              L1_67.status = L2_68
            else
              L1_67 = _enemyWork
              L2_68 = A0_64
              L1_67 = L1_67[L2_68]
              L1_67 = L1_67.status
              L2_68 = ENEMY_STATUS_WAIT
              if L1_67 == L2_68 then
                L1_67 = print
                L2_68 = "EnemyRespawnControl ENEMY_STATUS_WAIT"
                L1_67(L2_68)
                L1_67 = _memoriesCollected
                L2_68 = 0
                if _enemyWork[A0_64].kill_flag == true and _enemyWork[A0_64].lost_flag == false then
                  _enemyKillCount = _enemyKillCount + 1
                  if _enemyKillCount >= 2 then
                    Sound:playSE("cro_266a", 1, "")
                    Fn_captionView(({
                      "dm05_00119",
                      "dm05_00120",
                      "dm05_00121"
                    })[math.random(#{
                      "dm05_00119",
                      "dm05_00120",
                      "dm05_00121"
                    })])
                  end
                end
                while L2_68 < RESPAWN_ATTACK_DELAY * 30 do
                  if _enemyWork[A0_64].idling_flag == false then
                    L2_68 = L2_68 + 1
                  end
                  wait()
                end
                _enemyWork[A0_64].kill_flag = false
                _enemyWork[A0_64].lost_flag = false
                _enemyWork[A0_64].status = ENEMY_STATUS_SPANWN
              else
                L1_67 = _enemyWork
                L2_68 = A0_64
                L1_67 = L1_67[L2_68]
                L1_67 = L1_67.status
                L2_68 = ENEMY_STATUS_SPANWN
                if L1_67 == L2_68 then
                  L1_67 = print
                  L2_68 = "EnemyRespawnControl ENEMY_STATUS_SPANWN"
                  L1_67(L2_68)
                  L1_67 = _currentArea
                  L2_68 = _enemyWork
                  L2_68 = L2_68[A0_64]
                  L2_68 = L2_68.name
                  L2_68 = L2_68 .. "_" .. string.format("%02d", L1_67)
                  print(L2_68 .. " Spawning")
                  _enemyWork[A0_64].enm_gen = findGameObject2("EnemyGenerator", "enmgen2_" .. L2_68)
                  _enemyWork[A0_64].enm_gen:requestSpawn()
                  WaitEnemySpawn(A0_64, L1_67)
                  StartMarker(A0_64, true)
                  _enemyWork[A0_64].gauge_task = EnemyGaugeControl(A0_64)
                  _enemyWork[A0_64].status = ENEMY_STATUS_IDLE
                end
              end
            end
          end
        end
        L1_67 = wait
        L1_67()
      end
    end
  end
  function L1_65.destructor(A0_69)
    if _enemyWork[A0_64].gauge_task ~= nil then
      _enemyWork[A0_64].gauge_task:abort()
      _enemyWork[A0_64].gauge_task = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L1_65.update, L1_65.destructor, L1_65)
end
function pccubesensor2_memory_OnEnter(A0_70)
  local L1_71
  L1_71 = RAC_getTailNumber
  L1_71 = L1_71(A0_70:getName(), 2)
  if _areaWork[L1_71].getMemory == false then
    invokeTask(function()
      _captionWait = true
      _memoriesCollected = _memoriesCollected + 1
      _areaWork[L1_71].memoryItem:requestGet()
      _areaWork[L1_71].getMemory = true
      if _enemyWork[ENEMY_TYPE_LUMINO].status == ENEMY_STATUS_IDLE or _enemyWork[ENEMY_TYPE_TENEBRIA].status == ENEMY_STATUS_IDLE then
        print("\227\131\171\227\131\159\227\131\142\227\129\168\227\131\134\227\131\141\227\131\150\227\131\170\227\130\162\227\129\174\229\135\186\231\143\190\228\184\173\227\129\171\229\143\150\229\190\151\227\129\151\227\129\159\227\129\174\227\129\167\227\131\136\227\131\173\227\131\149\227\130\163\227\131\188\229\143\150\229\190\151\229\164\177\230\149\151")
        _trophyUnlock = false
      end
      Player:setStay(true)
      Fn_userCtrlAllOff()
      BossRequestIdling(true)
      Fn_blackout()
      BossReposition(_currentArea)
      Fn_captionViewWait(({
        "dm05_00109",
        "dm05_00110",
        "dm05_00111",
        "dm05_00112",
        "dm05_00113"
      })[_memoriesCollected], nil, nil, Font.kLayerFront)
      Fn_fadein()
      if _memoriesCollected < MEMORIES_NUM then
        if _memoriesCollected == 1 then
          Fn_kaiwaDemoView("dm05_00120k")
        end
        Player:setStay(false)
        Fn_userCtrlOn()
        BossRequestIdling(false)
        BossRequestMarker(true)
      end
      _captionWait = false
    end)
  end
end
function pccubesensormulti2_outrange_01_OnLeave()
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setStay(true)
    Fn_captionView("dm05_00108")
    RAC_LookAtObject(_findObjectHandle("locator2_pc_start_pos"), 0, 0.2)
    Player:setStay(false)
    Fn_userCtrlOn()
  end)
end
function pccubesensormulti2_outrange_02_OnLeave()
  invokeTask(function()
    StageReset()
  end)
end
function StageReset()
  local L0_72, L1_73
  L0_72 = _currentArea
  L1_73 = _currentCheckpoint
  Fn_userCtrlAllOff()
  Fn_catWarpIn()
  BossRequestIdling(true)
  Fn_setCatWarpCheckPoint(L1_73)
  Fn_catWarpCheckPoint()
  BossReposition(L0_72)
  Fn_catWarpOut()
  while not HUD:faderStability() do
    wait()
  end
  wait(15)
  Fn_userCtrlOn()
  BossRequestIdling(false)
  BossRequestMarker(true)
end
function BossReposition(A0_74)
  local L1_75, L2_76, L3_77, L4_78, L5_79, L6_80, L7_81, L8_82
  for L4_78, L5_79 in L1_75(L2_76) do
    L6_80 = _enemyWork
    L6_80 = L6_80[L4_78]
    L6_80 = L6_80.status
    L7_81 = ENEMY_STATUS_IDLE
    if L6_80 == L7_81 then
      L6_80 = _enemyWork
      L6_80 = L6_80[L4_78]
      L6_80 = L6_80.brain
      if L6_80 ~= nil then
        L6_80 = _enemyWork
        L6_80 = L6_80[L4_78]
        L6_80 = L6_80.name
        L7_81 = "_"
        L8_82 = string
        L8_82 = L8_82.format
        L8_82 = L8_82("%02d", A0_74)
        L6_80 = L6_80 .. L7_81 .. L8_82
        L7_81 = findGameObject2
        L8_82 = "Node"
        L7_81 = L7_81(L8_82, "locator2_" .. L6_80)
        L8_82 = L7_81
        L7_81 = L7_81.getWorldTransform
        L8_82 = L7_81(L8_82)
        _enemyWork[L4_78].brain:reset(L7_81, L8_82)
        StartMarker(L4_78, false)
      end
    end
  end
end
function BossRequestIdling(A0_83)
  local L1_84, L2_85, L3_86, L4_87
  for L4_87, _FORV_5_ in L1_84(L2_85) do
    RequestIdlingEnemy(L4_87, A0_83)
  end
end
function BossRequestMarker(A0_88)
  local L1_89, L2_90, L3_91, L4_92
  for L4_92, _FORV_5_ in L1_89(L2_90) do
    StartMarker(L4_92, A0_88)
  end
end
function BossWaitSpawn(A0_93)
  local L1_94, L2_95, L3_96, L4_97
  for L4_97, _FORV_5_ in L1_94(L2_95) do
    WaitEnemySpawn(L4_97, A0_93)
  end
end
