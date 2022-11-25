dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_012"
_floor_num = 12
REQUEST_SPAWN_TIME = 1800
_eneList = nil
_startAreaName = nil
_goalAreaName = nil
_gasTask = nil
_eventEnd = false
_eventFaled = false
_spownRequest = false
_requestPhase = 0
_fieldIn = false
_lastAttacker = nil
_nowBattlePlace = nil
_eventCount = 1
_eventEneGen = {
  main = 0,
  set01 = 0,
  set02 = 0,
  set03 = 0
}
enmgen2_floor12_main = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor12_ene_01",
      type = "giant_mine_11",
      locator = "locator_01_gaiant"
    }
  },
  enemyMaxNum = 0,
  onEnter = function(A0_0)
    if A0_0:getUid() == _nowBattlePlace then
      print(A0_0:getName() .. " ENTER")
      _fieldIn = true
    end
  end,
  onLeave = function(A0_1)
    if A0_1:getUid() == __nowBattlePlace then
      print(A0_1:getName() .. " LEAVE")
      _fieldIn = false
    end
  end,
  onSpawn = function(A0_2, A1_3)
    A0_2:setEventListener("DamageEnemyReport", function(A0_4)
      print("\230\148\187\230\146\131\227\129\149\227\130\140\227\129\159\227\130\168\227\131\141\227\131\159\227\131\188\227\129\140\229\143\151\227\129\145\227\129\159\230\148\187\230\146\131\227\130\191\227\130\164\227\131\151\227\130\146\230\160\188\231\180\141")
      _lastAttacker = A0_4.attacker
    end)
  end,
  onObjectAsh = function(A0_5, A1_6)
    if A1_6:getName() == "floor12_ene_01" then
      if _lastAttacker == "player" then
        _eventCount = _eventCount - 1
        _eventEnd = true
      else
        _eventFaled = true
      end
    end
  end
}
enmgen2_floor12_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor12_ene_02_01",
      type = "lasercannon_mine_11",
      locator = "locator_01"
    },
    {
      name = "floor12_ene_02_02",
      type = "imp_mine_11",
      locator = "locator_02"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_7, A1_8)
    A0_7:getSpecTable().enemyMaxNum = #A0_7:getSpecTable().spawnSet
    A0_7:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_9, A1_10)
    A0_9:setEventListener("DestroyEnemyReport", function(A0_11)
      if A0_11.attacker == "player" then
        _eventFaled = true
      end
    end)
    A0_9:getSpecTable().enemydeadNum = A0_9:getSpecTable().enemydeadNum + 1
    if A0_9:getSpecTable().enemydeadNum >= A0_9:getSpecTable().enemyMaxNum then
      _requestPhase = _requestPhase + 1
      _spownRequest = true
    end
  end
}
enmgen2_floor12_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor12_ene_02_01",
      type = "runner_mine_11",
      locator = "locator_01"
    },
    {
      name = "floor12_ene_02_02",
      type = "imp_mine_11",
      locator = "locator_02"
    },
    {
      name = "floor12_ene_02_03",
      type = "lasercannon_mine_11",
      locator = "locator_03"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_12, A1_13)
    A0_12:getSpecTable().enemyMaxNum = #A0_12:getSpecTable().spawnSet
    A0_12:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_14, A1_15)
    A0_14:setEventListener("DestroyEnemyReport", function(A0_16)
      if A0_16.attacker == "player" then
        _eventFaled = true
      end
    end)
    A0_14:getSpecTable().enemydeadNum = A0_14:getSpecTable().enemydeadNum + 1
    if A0_14:getSpecTable().enemydeadNum >= A0_14:getSpecTable().enemyMaxNum then
      _requestPhase = _requestPhase + 1
      _spownRequest = true
    end
  end
}
enmgen2_floor12_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor12_ene_03_01",
      type = "guardcore_mine_11",
      locator = "locator_01"
    },
    {
      name = "floor12_ene_03_02",
      type = "gellyfish_mine_11",
      locator = "locator_02"
    },
    {
      name = "floor12_ene_03_03",
      type = "lasercannon_mine_11",
      locator = "locator_03"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_17, A1_18)
    A0_17:getSpecTable().enemyMaxNum = #A0_17:getSpecTable().spawnSet
    A0_17:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_19, A1_20)
    A0_19:setEventListener("DestroyEnemyReport", function(A0_21)
      if A0_21.attacker == "player" then
        _eventFaled = true
      end
    end)
    A0_19:getSpecTable().enemydeadNum = A0_19:getSpecTable().enemydeadNum + 1
    if A0_19:getSpecTable().enemydeadNum >= A0_19:getSpecTable().enemyMaxNum then
      _requestPhase = _requestPhase + 1
      _spownRequest = true
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
  onSpawn = function(A0_22, A1_23)
  end,
  onObjectDead = function(A0_24, A1_25)
  end,
  onPopGem = function(A0_26, A1_27)
    EnemeyDropGem(A0_26, A1_27)
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
  onSpawn = function(A0_28, A1_29)
  end,
  onObjectDead = function(A0_30, A1_31)
  end,
  onPopGem = function(A0_32, A1_33)
    EnemeyDropGem(A0_32, A1_33)
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
  onSpawn = function(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
  end,
  onPopGem = function(A0_38, A1_39)
    EnemeyDropGem(A0_38, A1_39)
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
  onSpawn = function(A0_40, A1_41)
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onPopGem = function(A0_44, A1_45)
    EnemeyDropGem(A0_44, A1_45)
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
  onSpawn = function(A0_46, A1_47)
  end,
  onObjectDead = function(A0_48, A1_49)
  end,
  onPopGem = function(A0_50, A1_51)
    EnemeyDropGem(A0_50, A1_51)
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
  local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63, L12_64
  L0_52 = print
  L1_53 = string
  L1_53 = L1_53.format
  L2_54 = "mine99_%03d IngameBody"
  L12_64 = L1_53(L2_54, L3_55)
  L0_52(L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63, L12_64, L1_53(L2_54, L3_55))
  L0_52 = Fn_getEneGenNameTable
  L0_52 = L0_52()
  L1_53 = {}
  L2_54 = 1
  _startAreaName = L3_55
  _goalAreaName = L3_55
  for L6_58, L7_59 in L3_55(L4_56) do
    for L11_63, L12_64 in L8_60(L9_61) do
      L1_53[L2_54] = findGameObject2("EnemyGenerator", L12_64)
      L2_54 = L2_54 + 1
    end
  end
  _eneList = L1_53
  for L8_60, L9_61 in L5_57(L6_58) do
    L11_63 = L9_61
    L11_63 = string
    L11_63 = L11_63.match
    L12_64 = L10_62
    L11_63 = L11_63(L12_64, "floor12")
    if L11_63 ~= nil then
      L11_63 = string
      L11_63 = L11_63.match
      L12_64 = L10_62
      L11_63 = L11_63(L12_64, _goalAreaName)
      if L11_63 ~= nil then
        L11_63 = string
        L11_63 = L11_63.match
        L12_64 = L10_62
        L11_63 = L11_63(L12_64, "main")
        if L11_63 ~= nil then
          L11_63 = _eventEneGen
          L11_63.main = L8_60
        else
          L11_63 = string
          L11_63 = L11_63.match
          L12_64 = L10_62
          L11_63 = L11_63(L12_64, "set01")
          if L11_63 ~= nil then
            L11_63 = _eventEneGen
            L11_63.set01 = L8_60
          else
            L11_63 = string
            L11_63 = L11_63.match
            L12_64 = L10_62
            L11_63 = L11_63(L12_64, "set02")
            if L11_63 ~= nil then
              L11_63 = _eventEneGen
              L11_63.set02 = L8_60
            else
              L11_63 = string
              L11_63 = L11_63.match
              L12_64 = L10_62
              L11_63 = L11_63(L12_64, "set03")
              if L11_63 ~= nil then
                L11_63 = _eventEneGen
                L11_63.set03 = L8_60
              end
            end
          end
        end
      end
    else
      L11_63 = string
      L11_63 = L11_63.match
      L12_64 = L9_61.getName
      L12_64 = L12_64(L9_61)
      L11_63 = L11_63(L12_64, _startAreaName)
      if L11_63 ~= nil then
      else
        L12_64 = L9_61
        L11_63 = L9_61.requestSpawn
        L11_63(L12_64)
      end
    end
  end
  L5_57()
  L5_57()
  L5_57()
  L5_57(L6_58)
  if not L5_57 then
    L5_57(L6_58)
    repeat
      L5_57()
    until L5_57
    L5_57(L6_58, L7_59, L8_60, L9_61)
    L5_57()
    _eventEnd = false
    _eventFaled = false
    _requestPhase = 1
    _spownRequest = true
    _eventCount = 1
    L5_57(L6_58, L7_59)
    L5_57(L6_58, L7_59)
    L5_57(L6_58, L7_59)
    L5_57(L6_58, L7_59)
    for L8_60, L9_61 in L5_57(L6_58) do
      if L8_60 ~= L10_62 then
        if L8_60 ~= L10_62 then
          if L8_60 ~= L10_62 then
            if L8_60 == L10_62 then
            else
              L11_63 = L9_61
              L10_62(L11_63)
            end
          end
        end
      end
    end
    L5_57(L6_58)
    L5_57(L6_58)
    _nowBattlePlace = L5_57
    while true do
      L6_58(L7_59, L8_60)
      if L6_58 then
        if L6_58 == 1 then
          L6_58(L7_59)
        elseif L6_58 == 2 then
          L6_58(L7_59)
        else
          L6_58(L7_59)
          _requestPhase = 1
        end
        _spownRequest = false
      end
      if L6_58 == true then
        if L5_57 >= L6_58 then
          if L6_58 == false then
            _requestPhase = L6_58
            _spownRequest = true
          end
        end
      end
      if L6_58 == true then
        L6_58(L7_59, L8_60)
        L6_58()
        repeat
          L6_58()
        until L6_58
        L6_58()
        L6_58()
      elseif L6_58 == true then
        L6_58(L7_59)
        L6_58()
        L6_58()
        L6_58()
        repeat
          L6_58()
        until L6_58
        L6_58()
        break
      end
      L6_58()
    end
    L6_58(L7_59, L8_60)
    for L9_61, L10_62 in L6_58(L7_59) do
      L12_64 = L10_62
      L11_63 = L10_62.requestAllEnemyKill
      L11_63(L12_64)
    end
  else
    L5_57(L6_58)
  end
  L5_57(L6_58)
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  HUD:counter999SetVisible(false)
  if _gasTask ~= nil then
    _gasTask:abort()
    _gasTask = nil
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
    local L0_65, L1_66, L2_67
    L0_65, L1_66 = nil, nil
    repeat
      L2_67 = Fn_getPcPosRot
      L2_67 = L2_67()
      L0_65 = L2_67
      L2_67 = Query
      L2_67 = L2_67.setGfxObservationPoint
      L2_67(L2_67, L0_65)
      L2_67 = Query
      L2_67 = L2_67.getGfxObservationDensity
      L2_67 = L2_67(L2_67)
      L1_66 = L2_67
      L2_67 = debugDispPrint
      L2_67("PC POS : " .. tostring(L0_65))
      L2_67 = debugDispPrint
      L2_67("depth  : " .. tostring(L1_66))
      L2_67 = wait
      L2_67()
      L2_67 = Query
      L2_67 = L2_67.getGfxObservationDensity
      L2_67 = L2_67(L2_67)
    until L2_67 < _POISON_START
    L1_66 = 0
    repeat
      L2_67 = Fn_getPcPosRot
      L2_67 = L2_67()
      L0_65 = L2_67
      L2_67 = Query
      L2_67 = L2_67.setGfxObservationPoint
      L2_67(L2_67, L0_65)
      L2_67 = Query
      L2_67 = L2_67.getGfxObservationDensity
      L2_67 = L2_67(L2_67)
      L1_66 = L2_67
      L2_67 = _POISON_START
      if L1_66 < L2_67 then
        L2_67 = _poison_gas
        if L2_67 == true then
          L2_67 = print
          L2_67("****** poison out ******")
          _poison_gas = false
          L2_67 = Player
          L2_67 = L2_67.applyPoisonDamage
          L2_67(L2_67, 0, 0.01)
          L2_67 = _catwarp
          if L2_67 == false then
            L2_67 = _poison_se
            if L2_67 ~= nil then
              L2_67 = Sound
              L2_67 = L2_67.stopSEHandle
              L2_67(L2_67, _poison_se)
              _poison_se = nil
            end
            L2_67 = _poison_timer_task
            if L2_67 ~= nil then
              L2_67 = _poison_timer_task
              L2_67 = L2_67.abort
              L2_67(L2_67)
              _poison_timer_task = nil
            end
          end
        end
      else
        L2_67 = _POISON_START
        if L1_66 >= L2_67 then
          L2_67 = _poison_gas
          if L2_67 == false then
            L2_67 = print
            L2_67("****** poison [" .. L1_66 .. "] ****** PC POS [" .. tostring(L0_65) .. "] ******")
            L2_67 = invokeTask
            L2_67(poison_erea_in)
            L2_67 = _poison_timer_task
            if L2_67 == nil then
              L2_67 = print
              L2_67("****** poison catwarp count start ******")
              function L2_67()
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
              _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, L2_67)
            end
          end
        end
      end
      L2_67 = wait
      L2_67()
      L2_67 = false
    until L2_67
  end)
end
function poison_erea_in()
  print("************ poison erea in ************")
  _poison_gas = true
  Player:applyPoisonDamage(3, 999)
  Sound:playSE("pc1_poisoned", 1, Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
