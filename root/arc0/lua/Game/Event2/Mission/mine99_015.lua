dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_015"
_floor_num = 15
TIMEER = 60
_gasTask = nil
_eneList = nil
_startAreaName = nil
_goalAreaName = nil
_eventEnd = false
_breakPoint = 3
_breakEnemy = nil
_target = nil
_endRange = false
_moveTask = {}
_refill = false
_bother = false
_floor15EneNum = {
  0,
  0,
  0
}
_enemyMoveEndCnt = {
  floor15_ene_01 = 0,
  floor15_ene_02 = 0,
  floor15_ene_03 = 0
}
_firstPart = {
  "floor15_ene_01",
  "floor15_ene_02",
  "floor15_ene_03"
}
enmgen2_floor15_az_a_07_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor15_ene_01",
      type = "stalker_mine_11",
      locator = "locator_01"
    },
    {
      name = "floor15_ene_02",
      type = "stalker_mine_11",
      locator = "locator_02"
    },
    {
      name = "floor15_ene_03",
      type = "stalker_mine_11",
      locator = "locator_03"
    }
  },
  enemyMaxNum = 0,
  enemyDeadNum = 0,
  onEnter = function(A0_0)
    local L1_1
  end,
  onLeave = function(A0_2)
    local L1_3
    _endRange = true
  end,
  onSpawn = function(A0_4, A1_5)
    A0_4:getSpecTable().enemyMaxNum = #A0_4:getSpecTable().spawnSet
    A0_4:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_6, A1_7)
    _moveTask[A1_7:getName()]:abort()
    _moveTask[A1_7:getName()] = nil
    _enemyMoveEndCnt[A1_7:getName()] = 1
    for _FORV_7_, _FORV_8_ in pairs(_enemyMoveEndCnt) do
    end
    A0_6:getSpecTable().enemydeadNum = A0_6:getSpecTable().enemydeadNum + 1
    if A0_6:getSpecTable().enemydeadNum >= A0_6:getSpecTable().enemyMaxNum or 0 + _FORV_8_ >= 3 then
      _refill = true
    end
  end
}
enmgen2_floor15_az_a_07_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor15_ene_04",
      type = "imp_mine_11",
      locator = "locator_01"
    },
    {
      name = "floor15_ene_05",
      type = "imp_mine_11",
      locator = "locator_02"
    },
    {
      name = "floor15_ene_06",
      type = "imp_mine_11",
      locator = "locator_03"
    }
  },
  enemyMaxNum = 0,
  enemyDeadNum = 0,
  onEnter = function(A0_8)
    local L1_9
  end,
  onLeave = function(A0_10)
    local L1_11
    _endRange = true
  end,
  onSpawn = function(A0_12, A1_13)
    A0_12:getSpecTable().enemyMaxNum = #A0_12:getSpecTable().spawnSet
    A0_12:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:getSpecTable().enemydeadNum = A0_14:getSpecTable().enemydeadNum + 1
    if A0_14:getSpecTable().enemydeadNum >= A0_14:getSpecTable().enemyMaxNum then
      _bother = true
    end
  end
}
enmgen2_floor15_az_a_07_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor15_ene_08",
      type = "runner_mine_11",
      locator = "locator_01"
    },
    {
      name = "floor15_ene_09",
      type = "runner_mine_11",
      locator = "locator_02"
    },
    {
      name = "floor15_ene_10",
      type = "guardcore_mine_11",
      locator = "locator_03"
    },
    {
      name = "floor15_ene_11",
      type = "gellyfish_mine_11",
      locator = "locator_04"
    },
    {
      name = "floor15_ene_12",
      type = "gellyfish_mine_11",
      locator = "locator_05"
    },
    {
      name = "floor15_ene_13",
      type = "lasercannon_mine_11",
      locator = "locator_06",
      ai_spawn_option = "LaserCannon/lasercannon_simple"
    }
  },
  enemyMaxNum = 0,
  enemyDeadNum = 0,
  onEnter = function(A0_16)
    local L1_17
  end,
  onLeave = function(A0_18)
    local L1_19
    _endRange = true
  end,
  onSpawn = function(A0_20, A1_21)
    A0_20:getSpecTable().enemyMaxNum = #A0_20:getSpecTable().spawnSet
    A0_20:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_22, A1_23)
    A0_22:getSpecTable().enemydeadNum = A0_22:getSpecTable().enemydeadNum + 1
    if A0_22:getSpecTable().enemydeadNum >= A0_22:getSpecTable().enemyMaxNum then
    end
  end
}
enmgen2_az_a_02_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "runner_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "imp_mine_11",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "guardcore_mine_11",
      locator = "locator_03"
    },
    {
      name = "ene_02_04",
      type = "imp_mine_11",
      locator = "locator_04"
    },
    {
      name = "ene_02_05",
      type = "lasercannon_mine_11",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_24, A1_25)
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onPopGem = function(A0_28, A1_29)
    EnemeyDropGem(A0_28, A1_29)
  end
}
enmgen2_az_a_03_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "treecannon_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "imp_mine_11",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "imp_mine_11",
      locator = "locator_03"
    },
    {
      name = "ene_02_04",
      type = "imp_mine_11",
      locator = "locator_04"
    },
    {
      name = "ene_02_05",
      type = "lasercannon_mine_11",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_30, A1_31)
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onPopGem = function(A0_34, A1_35)
    EnemeyDropGem(A0_34, A1_35)
  end
}
enmgen2_az_a_04_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "runner_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "guardcore_mine_11",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "imp_mine_11",
      locator = "locator_03"
    },
    {
      name = "ene_02_04",
      type = "imp_mine_11",
      locator = "locator_04"
    },
    {
      name = "ene_02_05",
      type = "lasercannon_mine_11",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_36, A1_37)
  end,
  onObjectDead = function(A0_38, A1_39)
  end,
  onPopGem = function(A0_40, A1_41)
    EnemeyDropGem(A0_40, A1_41)
  end
}
enmgen2_az_a_05_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "runner_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "guardcore_mine_11",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "runner_mine_11",
      locator = "locator_03"
    },
    {
      name = "ene_02_04",
      type = "guardcore_mine_11",
      locator = "locator_04"
    },
    {
      name = "ene_02_05",
      type = "runner_mine_11",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_42, A1_43)
  end,
  onObjectDead = function(A0_44, A1_45)
  end,
  onPopGem = function(A0_46, A1_47)
    EnemeyDropGem(A0_46, A1_47)
  end
}
enmgen2_az_a_07_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      name = "ene_02_01",
      type = "runner_mine_11",
      locator = "locator_01"
    },
    {
      name = "ene_02_02",
      type = "guardcore_mine_11",
      locator = "locator_02"
    },
    {
      name = "ene_02_03",
      type = "runner_mine_11",
      locator = "locator_03"
    },
    {
      name = "ene_02_04",
      type = "imp_mine_11",
      locator = "locator_04"
    },
    {
      name = "ene_02_05",
      type = "imp_mine_11",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_48, A1_49)
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onPopGem = function(A0_52, A1_53)
    EnemeyDropGem(A0_52, A1_53)
  end
}
function InitializeBody()
  print(string.format("mine99_%03d InitializeBody", _floor_num))
  _gravityOre = {
    mineOreEvdName = "mine03_ore",
    instance_flg = true,
    manager_name = g_own:getName(),
    deploy_areas = getElectedAreaNames(),
    exclusion_areas = {
      _param_mine99_base.goal_area_name
    }
  }
  if _gasTask == nil then
    _gasTask = poison_observation()
  end
end
function IngameBody()
  local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65, L12_66
  L0_54 = print
  L1_55 = string
  L1_55 = L1_55.format
  L2_56 = "mine99_%03d IngameBody"
  L12_66 = L1_55(L2_56, L3_57)
  L0_54(L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65, L12_66, L1_55(L2_56, L3_57))
  _endRange = false
  L0_54 = Fn_getEneGenNameTable
  L0_54 = L0_54()
  L1_55 = {}
  L2_56 = 1
  _startAreaName = L3_57
  _goalAreaName = L3_57
  for L6_60, L7_61 in L3_57(L4_58) do
    for L11_65, L12_66 in L8_62(L9_63) do
      L1_55[L2_56] = findGameObject2("EnemyGenerator", L12_66)
      L2_56 = L2_56 + 1
    end
  end
  _eneList = L1_55
  for L9_63, L10_64 in L6_60(L7_61) do
    L12_66 = L10_64
    L11_65 = L10_64.getName
    L11_65 = L11_65(L12_66)
    L12_66 = string
    L12_66 = L12_66.match
    L12_66 = L12_66(L11_65, "floor15")
    if L12_66 ~= nil then
      L12_66 = string
      L12_66 = L12_66.match
      L12_66 = L12_66(L11_65, _goalAreaName)
      if L12_66 ~= nil then
        L12_66 = _floor15EneNum
        L12_66[L5_59] = L9_63
      end
    else
      L12_66 = string
      L12_66 = L12_66.match
      L12_66 = L12_66(L10_64:getName(), _startAreaName)
      if L12_66 ~= nil then
      else
        L12_66 = L10_64.requestSpawn
        L12_66(L10_64)
      end
    end
  end
  L11_65 = nil
  _target = L6_60
  L6_60(L7_61, L8_62)
  L6_60(L7_61, L8_62)
  L6_60(L7_61, L8_62, L9_63)
  L6_60(L7_61, L8_62)
  L6_60()
  L6_60()
  L6_60()
  if L4_58 ~= 0 then
    L6_60(L7_61)
  end
  if not L6_60 then
    L6_60(L7_61)
    repeat
      L6_60()
    until L6_60
    _endRange = false
    L6_60()
    for L9_63, L10_64 in L6_60(L7_61) do
      L11_65 = _floor15EneNum
      L11_65 = L11_65[1]
      if L9_63 ~= L11_65 then
        L11_65 = _floor15EneNum
        L11_65 = L11_65[2]
        if L9_63 ~= L11_65 then
          L11_65 = _floor15EneNum
          L11_65 = L11_65[3]
          if L9_63 == L11_65 then
          else
            L12_66 = L10_64
            L11_65 = L10_64.requestAllEnemyKill
            L11_65(L12_66)
          end
        end
      end
    end
    L6_60(L7_61, L8_62)
    L6_60(L7_61, L8_62, L9_63, L10_64)
    L6_60(L7_61)
    L6_60(L7_61, L8_62)
    L6_60(L7_61, L8_62)
    L6_60(L7_61)
    L6_60(L7_61, L8_62)
    L6_60(L7_61, L8_62)
    L6_60(L7_61, L8_62)
    L6_60(L7_61, L8_62)
    _refill = true
    _bother = true
    while true do
      L8_62(L9_63, L10_64)
      if L8_62 == true then
        L8_62(L9_63)
        _refill = false
      end
      if L8_62 == true then
        L8_62(L9_63)
        _bother = false
      end
      if L8_62 ~= true then
        if L7_61 <= 30 and L6_60 == false then
          L9_63(L10_64)
        end
        L9_63()
      end
    end
    L7_61()
  else
    L6_60(L7_61)
  end
  L6_60(L7_61)
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  HUD:timerSetVisible(false)
  HUD:counter999SetVisible(false)
  if _gasTask ~= nil then
    _gasTask:abort()
    _gasTask = nil
  end
end
function judge_callback(A0_67, A1_68, A2_69, A3_70)
  if _breakPoint <= 0 then
    return 3
  else
    return 1
  end
end
function moveToEnemy(A0_71, A1_72)
  local L2_73, L3_74, L4_75, L5_76, L6_77
  L2_73 = {}
  L2_73.invincible = false
  repeat
    L3_74()
  until L3_74
  for L6_77 = 1, 4 do
    A0_71:move({
      string.format("locator2_floor15_ene%02d_point%02d", A1_72, L6_77)
    }, L2_73)
    repeat
      wait()
    until A0_71:isMoveEnd()
    if L6_77 ~= 4 then
      waitSeconds(6)
    end
  end
  L3_74(L4_75, L5_76)
  repeat
    L3_74()
  until L3_74
  _breakPoint = L3_74
  if L3_74 <= 0 then
    _breakEnemy = L3_74
  end
  L3_74(L4_75)
  L3_74[L4_75] = 1
  for _FORV_7_, _FORV_8_ in L4_75(L5_76) do
  end
  if L3_74 >= 3 then
    _refill = true
  end
end
function endEventConditions(A0_78)
  if A0_78 <= 0 then
    HUD:timerStop()
    HUD:timerSetVisible(false)
    HUD:counter999SetVisible(false)
    Fn_missionInfoEnd()
    missionComplete()
    _target:setVisiblePermission(false)
    repeat
      wait()
    until isSecondHalfProcessWait()
    setSecondHalfProcessEnd()
    Fn_setMine99FloorClear()
    repeat
      wait()
    until isSecondHalfProcessEnd()
    for _FORV_4_, _FORV_5_ in pairs(_eneList) do
      _FORV_5_:requestAllEnemyKill()
    end
    waitSeconds(2)
    if Fn_rewardMineBoss("boss08") then
      print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
    end
    return true
  end
  if 0 >= _breakPoint then
    _target:requestBreak(_breakEnemy:getWorldPos(), 1000)
    HUD:timerStop()
    HUD:timerSetVisible(false)
    HUD:counter999SetVisible(false)
    missionFailure()
    repeat
      wait()
    until isFailureProcessEnd()
    Fn_blackout()
    setRetryState()
    Fn_retryMine99()
    return false
  end
  if _endRange == true and GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeLock) ~= true then
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\233\150\139\229\167\139")
    Fn_catWarp()
    waitSeconds(_catwarp_wait)
    Fn_userCtrlOn()
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\231\181\130\228\186\134")
    _endRange = false
  end
  return false
end
function setRetryState()
  _eventEnd = false
  _breakPoint = 3
  _breakEnemy = nil
  _endRange = false
  _target:try_term()
  _target = nil
  for _FORV_3_, _FORV_4_ in pairs(_moveTask) do
    _FORV_4_:abort()
    _FORV_4_ = nil
  end
end
_POISON_START = 0.058
_catwarp_wait = 2
_poison_gas = false
_catwarp = false
_poison_se = nil
function poison_observation()
  print("**** poison_observation : start ****")
  return invokeTask(function()
    local L0_79, L1_80, L2_81
    L0_79, L1_80 = nil, nil
    repeat
      L2_81 = Fn_getPcPosRot
      L2_81 = L2_81()
      L0_79 = L2_81
      L2_81 = Query
      L2_81 = L2_81.setGfxObservationPoint
      L2_81(L2_81, L0_79)
      L2_81 = Query
      L2_81 = L2_81.getGfxObservationDensity
      L2_81 = L2_81(L2_81)
      L1_80 = L2_81
      L2_81 = debugDispPrint
      L2_81("PC POS : " .. tostring(L0_79))
      L2_81 = debugDispPrint
      L2_81("depth  : " .. tostring(L1_80))
      L2_81 = wait
      L2_81()
      L2_81 = Query
      L2_81 = L2_81.getGfxObservationDensity
      L2_81 = L2_81(L2_81)
    until L2_81 < _POISON_START
    L1_80 = 0
    repeat
      L2_81 = Fn_getPcPosRot
      L2_81 = L2_81()
      L0_79 = L2_81
      L2_81 = Query
      L2_81 = L2_81.setGfxObservationPoint
      L2_81(L2_81, L0_79)
      L2_81 = Query
      L2_81 = L2_81.getGfxObservationDensity
      L2_81 = L2_81(L2_81)
      L1_80 = L2_81
      L2_81 = _POISON_START
      if L1_80 < L2_81 then
        L2_81 = _poison_gas
        if L2_81 == true then
          L2_81 = print
          L2_81("****** poison out ******")
          _poison_gas = false
          L2_81 = Player
          L2_81 = L2_81.applyPoisonDamage
          L2_81(L2_81, 0, 0.01)
          L2_81 = _catwarp
          if L2_81 == false then
            L2_81 = _poison_se
            if L2_81 ~= nil then
              L2_81 = Sound
              L2_81 = L2_81.stopSEHandle
              L2_81(L2_81, _poison_se)
              _poison_se = nil
            end
            L2_81 = _poison_timer_task
            if L2_81 ~= nil then
              L2_81 = _poison_timer_task
              L2_81 = L2_81.abort
              L2_81(L2_81)
              _poison_timer_task = nil
            end
          end
        end
      else
        L2_81 = _POISON_START
        if L1_80 >= L2_81 then
          L2_81 = _poison_gas
          if L2_81 == false then
            L2_81 = print
            L2_81("****** poison [" .. L1_80 .. "] ****** PC POS [" .. tostring(L0_79) .. "] ******")
            L2_81 = invokeTask
            L2_81(poison_erea_in)
            L2_81 = _poison_timer_task
            if L2_81 == nil then
              L2_81 = print
              L2_81("****** poison catwarp count start ******")
              function L2_81()
                _catwarp = true
                Fn_catWarp()
                if _poison_se ~= nil then
                  Sound:stopSEHandle(_poison_se)
                  _poison_se = nil
                end
                waitSeconds(_catwarp_wait)
                Fn_userCtrlOn()
                _catwarp = false
                if _poison_timer_task ~= nil then
                  _poison_timer_task:abort()
                  _poison_timer_task = nil
                end
              end
              _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, L2_81)
            end
          end
        end
      end
      L2_81 = wait
      L2_81()
      L2_81 = false
    until L2_81
  end)
end
function poison_erea_in()
  print("************ poison erea in ************")
  _poison_gas = true
  Player:applyPoisonDamage(3, 999)
  Sound:playSE("pc1_poisoned", 1, Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
