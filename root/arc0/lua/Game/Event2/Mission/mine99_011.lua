import("Player")
dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_011"
_floor_num = 11
_gasTask = nil
_floor11Enemy = {
  {
    eneGenName = nil,
    battleEnd = false,
    spownEnd = false,
    handName = nil,
    brain = nil,
    setEnd = false
  }
}
_untuneCount = 0
_jupitortuneCount = 0
_lunatuneCount = 0
_eneList = nil
_startAreaName = nil
_goalAreaName = nil
enmgen2_floor11_az_a_07_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor11_ene_07_01",
      type = "hand",
      locator = "locator_01_hand",
      ai_spawn_option = "Hand/gravitystorm_lively"
    }
  },
  addHandSpawnSetName0 = "spawnSethand0",
  addHandSpawnSetName1 = "spawnSethand1",
  addHandSpawnSetName2 = "spawnSethand2",
  addHandSpawnSetName3 = "spawnSethand3",
  addHandSpawnSetName4 = "spawnSethand4",
  spawnSethand0 = {
    {
      name = "floor11_ene_07_02",
      type = "runner_mine_11",
      locator = "locator_02"
    }
  },
  spawnSethand1 = {
    {
      name = "floor11_ene_07_03",
      type = "runner_mine_11",
      locator = "locator_03"
    }
  },
  spawnSethand2 = {
    {
      name = "floor11_ene_07_04",
      type = "defender_mine_11",
      locator = "locator_04"
    }
  },
  spawnSethand3 = {
    {
      name = "floor11_ene_07_05",
      type = "imp_mine_11",
      locator = "locator_05"
    }
  },
  spawnSethand4 = {
    {
      name = "floor11_ene_07_06",
      type = "imp_mine_11",
      locator = "locator_06"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_0, A1_1)
    for _FORV_5_, _FORV_6_ in pairs(_floor11Enemy) do
      if _FORV_6_.eneGenName == A0_0:getName() then
        _FORV_6_.spownEnd = true
        _FORV_6_.handName = "floor11_ene_07_01"
      end
    end
  end,
  onObjectAsh = function(A0_2, A1_3)
    local L2_4
    L2_4 = Player
    L2_4 = L2_4.getAttrTune
    L2_4 = L2_4(L2_4)
    print(A1_3:getName() .. " >>> \227\131\141\227\131\180\227\130\163\227\130\146\229\128\146\227\129\151\227\129\159\227\129\168\227\129\141\227\129\174\227\131\129\227\131\165\227\131\188\227\131\179\239\188\136\239\188\144\239\188\154\227\130\162\227\131\179\227\131\129\227\131\165\227\131\188\227\131\179\227\128\129\239\188\145\239\188\154\227\131\171\227\131\188\227\131\138\227\131\129\227\131\165\227\131\188\227\131\179\227\128\129\239\188\146\239\188\154\227\131\166\227\131\148\227\131\136\227\131\188\227\131\171\227\131\129\227\131\165\227\131\188\227\131\179\239\188\137 : " .. tostring(L2_4))
    A0_2:setEventListener("DestroyEnemyReport", function(A0_5)
      if A0_5.attacker == "player" then
        tuneCount(L2_4)
      end
    end)
    if A1_3:getName() == "floor11_ene_07_01" then
      for _FORV_7_, _FORV_8_ in pairs(_floor11Enemy) do
        if _FORV_8_.eneGenName == A0_2:getName() then
          _FORV_8_.battleEnd = true
        end
      end
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
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onPopGem = function(A0_10, A1_11)
    EnemeyDropGem(A0_10, A1_11)
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
  onSpawn = function(A0_12, A1_13)
  end,
  onObjectDead = function(A0_14, A1_15)
  end,
  onPopGem = function(A0_16, A1_17)
    EnemeyDropGem(A0_16, A1_17)
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
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  onPopGem = function(A0_22, A1_23)
    EnemeyDropGem(A0_22, A1_23)
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
  onSpawn = function(A0_24, A1_25)
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onPopGem = function(A0_28, A1_29)
    EnemeyDropGem(A0_28, A1_29)
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
  onSpawn = function(A0_30, A1_31)
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onPopGem = function(A0_34, A1_35)
    EnemeyDropGem(A0_34, A1_35)
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
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48
  L0_36 = print
  L1_37 = string
  L1_37 = L1_37.format
  L2_38 = "mine99_%03d IngameBody"
  L12_48 = L1_37(L2_38, L3_39)
  L0_36(L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48, L1_37(L2_38, L3_39))
  L0_36 = Fn_getEneGenNameTable
  L0_36 = L0_36()
  L1_37 = {}
  L2_38 = 1
  _startAreaName = L3_39
  _goalAreaName = L3_39
  for L6_42, L7_43 in L3_39(L4_40) do
    for L11_47, L12_48 in L8_44(L9_45) do
      L1_37[L2_38] = findGameObject2("EnemyGenerator", L12_48)
      L2_38 = L2_38 + 1
    end
  end
  _eneList = L1_37
  for L8_44, L9_45 in L5_41(L6_42) do
    L12_48 = L9_45
    L11_47 = L9_45.getName
    L11_47 = L11_47(L12_48)
    L12_48 = "floor11"
    if L10_46 ~= nil then
      if L3_39 < 4 then
        L12_48 = L9_45
        L11_47 = L9_45.getName
        L11_47 = L11_47(L12_48)
        L10_46.eneGenName = L11_47
      end
    else
      L12_48 = L9_45
      L11_47 = L9_45.getName
      L11_47 = L11_47(L12_48)
      L12_48 = _startAreaName
      if L10_46 ~= nil then
      else
        L11_47 = L9_45
        L10_46(L11_47)
      end
    end
  end
  L5_41()
  L5_41()
  L5_41()
  if L4_40 ~= 0 then
    L5_41(L6_42)
  end
  if not L5_41 then
    L5_41(L6_42)
    repeat
      L5_41()
    until L5_41
    L5_41(L6_42, L7_43, L8_44, L9_45)
    L5_41()
    for L8_44, L9_45 in L5_41(L6_42) do
      L9_45.battleEnd = false
      L9_45.spownEnd = false
      L9_45.handName = nil
      L9_45.brain = nil
      L9_45.setEnd = false
    end
    _untuneCount = 0
    _jupitortuneCount = 0
    _lunatuneCount = 0
    for L8_44, L9_45 in L5_41(L6_42) do
      L11_47 = L9_45
      L11_47 = _floor11Enemy
      L11_47 = L11_47[1]
      L11_47 = L11_47.eneGenName
      if L10_46 == L11_47 then
        L11_47 = L9_45
        L10_46(L11_47)
      else
        L11_47 = L9_45
        L10_46(L11_47)
      end
    end
    L5_41(L6_42, L7_43)
    L6_42(L7_43)
    L6_42(L7_43)
    while true do
      for L9_45, L10_46 in L6_42(L7_43) do
        L11_47 = L10_46.spownEnd
        if L11_47 == true then
          L11_47 = findGameObject2
          L12_48 = "EnemyBrain"
          L11_47 = L11_47(L12_48, L10_46.handName)
          L10_46.brain = L11_47
          L10_46.spownEnd = false
        end
        L11_47 = L10_46.setEnd
        if L11_47 == false then
          L11_47 = L10_46.brain
          if L11_47 ~= nil then
            L11_47 = L10_46.brain
            L12_48 = L11_47
            L11_47 = L11_47.isReadyEnemy
            L11_47 = L11_47(L12_48)
            if L11_47 then
              L11_47 = L10_46.brain
              L12_48 = L11_47
              L11_47 = L11_47.eventMessage
              L11_47(L12_48, "SetNumToGenerate", 5)
              L10_46.setEnd = true
            end
          end
        end
      end
      if L6_42 then
        L6_42()
        repeat
          L6_42()
        until L6_42
        L6_42()
        L6_42()
      elseif L6_42 == 5 then
        if L6_42 == 5 then
          if L6_42 == 5 then
            L6_42()
            L6_42()
            L6_42()
            repeat
              L6_42()
            until L6_42
            L6_42()
            break
          end
        end
      elseif not (L6_42 > 5) then
      elseif L6_42 > 5 then
        L6_42()
        repeat
          L6_42()
        until L6_42
        L6_42()
        L6_42()
      end
      L6_42()
    end
    L6_42(L7_43)
    for L9_45, L10_46 in L6_42(L7_43) do
      L12_48 = L10_46
      L11_47 = L10_46.requestAllEnemyKill
      L11_47(L12_48)
    end
  else
    L5_41(L6_42)
  end
  L5_41(L6_42)
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  if _gasTask ~= nil then
    _gasTask:abort()
    _gasTask = nil
  end
end
function tuneCount(A0_49)
  print("\230\184\161\227\129\149\227\130\140\227\129\159\227\131\129\227\131\165\227\131\188\227\131\179\239\188\136\239\188\144\239\188\154\227\130\162\227\131\179\227\131\129\227\131\165\227\131\188\227\131\179\227\128\129\239\188\145\239\188\154\227\131\171\227\131\188\227\131\138\227\131\129\227\131\165\227\131\188\227\131\179\227\128\129\239\188\146\239\188\154\227\131\166\227\131\148\227\131\136\227\131\188\227\131\171\227\131\129\227\131\165\227\131\188\227\131\179\239\188\137 : " .. tostring(A0_49))
  if A0_49 == Player.kAttrTune_Normal then
    _untuneCount = _untuneCount + 1
    if _untuneCount <= 5 then
      Sound:pulse("success")
      print("\227\130\162\227\131\179\227\131\129\227\131\165\227\131\188\227\131\179\227\129\167\227\130\171\227\130\166\227\131\179\227\131\136")
    end
  elseif A0_49 == Player.kAttrTune_Mars then
    _lunatuneCount = _lunatuneCount + 1
    if 5 >= _lunatuneCount then
      Sound:pulse("success")
      print("\227\131\171\227\131\188\227\131\138\227\131\129\227\131\165\227\131\188\227\131\179\227\129\167\227\130\171\227\130\166\227\131\179\227\131\136")
    end
  elseif A0_49 == Player.kAttrTune_Jupiter then
    _jupitortuneCount = _jupitortuneCount + 1
    if 5 >= _jupitortuneCount then
      Sound:pulse("success")
      print("\227\131\166\227\131\148\227\131\136\227\131\188\227\131\171\227\131\129\227\131\165\227\131\188\227\131\179\227\129\167\227\130\171\227\130\166\227\131\179\227\131\136")
    end
  end
  print(string.format("untune:%02d lunatune:%02d jupitortune:%02d", _untuneCount, _lunatuneCount, _jupitortuneCount))
end
_POISON_START = 0.058
_catwarp_wait = 2
_poison_gas = false
_catwarp = false
_poison_se = nil
function poison_observation()
  print("**** poison_observation : start ****")
  return invokeTask(function()
    local L0_50, L1_51, L2_52
    L0_50, L1_51 = nil, nil
    repeat
      L2_52 = Fn_getPcPosRot
      L2_52 = L2_52()
      L0_50 = L2_52
      L2_52 = Query
      L2_52 = L2_52.setGfxObservationPoint
      L2_52(L2_52, L0_50)
      L2_52 = Query
      L2_52 = L2_52.getGfxObservationDensity
      L2_52 = L2_52(L2_52)
      L1_51 = L2_52
      L2_52 = debugDispPrint
      L2_52("PC POS : " .. tostring(L0_50))
      L2_52 = debugDispPrint
      L2_52("depth  : " .. tostring(L1_51))
      L2_52 = wait
      L2_52()
      L2_52 = Query
      L2_52 = L2_52.getGfxObservationDensity
      L2_52 = L2_52(L2_52)
    until L2_52 < _POISON_START
    L1_51 = 0
    repeat
      L2_52 = Fn_getPcPosRot
      L2_52 = L2_52()
      L0_50 = L2_52
      L2_52 = Query
      L2_52 = L2_52.setGfxObservationPoint
      L2_52(L2_52, L0_50)
      L2_52 = Query
      L2_52 = L2_52.getGfxObservationDensity
      L2_52 = L2_52(L2_52)
      L1_51 = L2_52
      L2_52 = _POISON_START
      if L1_51 < L2_52 then
        L2_52 = _poison_gas
        if L2_52 == true then
          L2_52 = print
          L2_52("****** poison out ******")
          _poison_gas = false
          L2_52 = Player
          L2_52 = L2_52.applyPoisonDamage
          L2_52(L2_52, 0, 0.01)
          L2_52 = _catwarp
          if L2_52 == false then
            L2_52 = _poison_se
            if L2_52 ~= nil then
              L2_52 = Sound
              L2_52 = L2_52.stopSEHandle
              L2_52(L2_52, _poison_se)
              _poison_se = nil
            end
            L2_52 = _poison_timer_task
            if L2_52 ~= nil then
              L2_52 = _poison_timer_task
              L2_52 = L2_52.abort
              L2_52(L2_52)
              _poison_timer_task = nil
            end
          end
        end
      else
        L2_52 = _POISON_START
        if L1_51 >= L2_52 then
          L2_52 = _poison_gas
          if L2_52 == false then
            L2_52 = print
            L2_52("****** poison [" .. L1_51 .. "] ****** PC POS [" .. tostring(L0_50) .. "] ******")
            L2_52 = invokeTask
            L2_52(poison_erea_in)
            L2_52 = _poison_timer_task
            if L2_52 == nil then
              L2_52 = print
              L2_52("****** poison catwarp count start ******")
              function L2_52()
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
              _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, L2_52)
            end
          end
        end
      end
      L2_52 = wait
      L2_52()
      L2_52 = false
    until L2_52
  end)
end
function poison_erea_in()
  print("************ poison erea in ************")
  _poison_gas = true
  Player:applyPoisonDamage(3, 999)
  _poison_se = Sound:playSEHandle("pc1_poisoned", 1, Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
