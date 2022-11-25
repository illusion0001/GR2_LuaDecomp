dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
_event_file_name = "floor_014"
_floor_num = 14
_eneList = nil
_startAreaName = nil
_goalAreaName = nil
_nextEvent = false
_eventEnd = false
_eventBattleNum = {0, 0}
_cageMoveEnd = false
_isInEvent = false
_eventCount = 3
_gasTask = nil
enmgen2_floor14_main_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor14_ene_01",
      type = "imp_mine_11",
      locator = "locator_01"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyMaxNum = #A0_0:getSpecTable().spawnSet
    A0_0:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_2, A1_3)
    _eventCount = _eventCount - 1
    A0_2:getSpecTable().enemydeadNum = A0_2:getSpecTable().enemydeadNum + 1
    if A0_2:getSpecTable().enemydeadNum >= A0_2:getSpecTable().enemyMaxNum then
      _nextEvent = true
    end
  end,
  onObjectDead = function(A0_4, A1_5)
  end
}
enmgen2_floor14_main_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      name = "floor14_ene_01",
      type = "imp_mine_11",
      locator = "locator_01"
    },
    {
      name = "floor14_ene_02",
      type = "imp_mine_11",
      locator = "locator_02"
    }
  },
  enemyMaxNum = 0,
  enemydeadNum = 0,
  onSpawn = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyMaxNum = #A0_6:getSpecTable().spawnSet
    A0_6:getSpecTable().enemydeadNum = 0
  end,
  onObjectAsh = function(A0_8, A1_9)
    _eventCount = _eventCount - 1
    A0_8:getSpecTable().enemydeadNum = A0_8:getSpecTable().enemydeadNum + 1
    if A0_8:getSpecTable().enemydeadNum >= A0_8:getSpecTable().enemyMaxNum then
      _eventEnd = true
    end
  end,
  onObjectDead = function(A0_10, A1_11)
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
  onSpawn = function(A0_12, A1_13)
  end,
  onObjectDead = function(A0_14, A1_15)
  end,
  onPopGem = function(A0_16, A1_17)
    EnemeyDropGem(A0_16, A1_17)
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
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  onPopGem = function(A0_22, A1_23)
    EnemeyDropGem(A0_22, A1_23)
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
  onSpawn = function(A0_24, A1_25)
  end,
  onObjectDead = function(A0_26, A1_27)
  end,
  onPopGem = function(A0_28, A1_29)
    EnemeyDropGem(A0_28, A1_29)
  end
}
function InitializeBody()
  print(string.format("mine99_%03d_body InitializeBody", _floor_num))
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
  local L0_30, L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42
  L0_30 = print
  L1_31 = string
  L1_31 = L1_31.format
  L2_32 = "mine99_%03d_body IngameBody"
  L12_42 = L1_31(L2_32, L3_33)
  L0_30(L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42, L1_31(L2_32, L3_33))
  L0_30 = Fn_getEneGenNameTable
  L0_30 = L0_30()
  L1_31 = {}
  L2_32 = 1
  _startAreaName = L3_33
  _goalAreaName = L3_33
  for L6_36, L7_37 in L3_33(L4_34) do
    for L11_41, L12_42 in L8_38(L9_39) do
      L1_31[L2_32] = findGameObject2("EnemyGenerator", L12_42)
      L2_32 = L2_32 + 1
    end
  end
  _eneList = L1_31
  for L8_38, L9_39 in L5_35(L6_36) do
    L11_41 = L9_39
    L11_41 = string
    L11_41 = L11_41.match
    L12_42 = L10_40
    L11_41 = L11_41(L12_42, "floor14")
    if L11_41 ~= nil then
      L11_41 = string
      L11_41 = L11_41.format
      L12_42 = "_%02d"
      L11_41 = L11_41(L12_42, L3_33)
      L12_42 = string
      L12_42 = L12_42.match
      L12_42 = L12_42(L10_40, _goalAreaName .. L11_41)
      if L12_42 ~= nil then
        L12_42 = _eventBattleNum
        L12_42[L3_33] = L8_38
      end
    else
      L11_41 = string
      L11_41 = L11_41.match
      L12_42 = L9_39.getName
      L12_42 = L12_42(L9_39)
      L11_41 = L11_41(L12_42, _startAreaName)
      if L11_41 ~= nil then
      else
        L12_42 = L9_39
        L11_41 = L9_39.requestSpawn
        L11_41(L12_42)
      end
    end
  end
  L5_35()
  L5_35()
  L5_35()
  _isInEvent = false
  L5_35(L6_36)
  if not L5_35 then
    L5_35(L6_36)
    repeat
      L5_35()
    until L5_35
    L5_35(L6_36, L7_37, L8_38, L9_39)
    L5_35()
    L11_41 = Player
    L11_41 = L11_41.kAbility_SliderKick
    L12_42 = Player
    L12_42 = L12_42.kAbility_Grab
    for L9_39, L10_40 in L6_36(L7_37) do
      L11_41 = _eventBattleNum
      L11_41 = L11_41[1]
      if L9_39 == L11_41 then
        L12_42 = L10_40
        L11_41 = L10_40.requestSpawn
        L11_41(L12_42)
      else
        L12_42 = L10_40
        L11_41 = L10_40.requestAllEnemyKill
        L11_41(L12_42)
      end
    end
    _eventCount = 3
    _isInEvent = true
    L6_36(L7_37, L8_38)
    L6_36(L7_37, L8_38)
    L6_36(L7_37, L8_38)
    L6_36(L7_37, L8_38)
    L6_36(L7_37, L8_38)
    L6_36(L7_37)
    L6_36(L7_37)
    while true do
      L6_36(L7_37, L8_38)
      if L6_36 == true then
        L6_36(L7_37)
        _nextEvent = false
      end
      if L6_36 == true then
        L6_36()
        L6_36()
        L6_36()
        repeat
          L6_36()
        until L6_36
        L6_36()
        break
      end
      L6_36()
    end
    L6_36(L7_37, L8_38)
    _isInEvent = false
    L6_36(L7_37)
  else
    L5_35(L6_36)
  end
  L5_35(L6_36)
end
function FinalizeBody()
  local L0_43
  L0_43 = print
  L0_43(string.format("mine99_%03d_body FinalizeBody", _floor_num))
  L0_43 = HUD
  L0_43 = L0_43.counter999SetVisible
  L0_43(L0_43, false)
  L0_43 = _gasTask
  if L0_43 ~= nil then
    L0_43 = _gasTask
    L0_43 = L0_43.abort
    L0_43(L0_43)
    _gasTask = nil
  end
  L0_43 = {
    Player.kAbility_GravityShift,
    Player.kAbility_GravityRevert,
    Player.kAbility_GravityBoost,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_SliderKick,
    Player.kAbility_Grab,
    Player.kAbility_ExGrab,
    Player.kAbility_Throw,
    Player.kAbility_SpAttack,
    Player.kAbility_SpTornado,
    Player.kAbility_SpTyphoon,
    Player.kAbility_SpBlackHole,
    Player.kAbility_FelineStart,
    Player.kAbility_FelineEnd
  }
  Fn_unLockPlayerAbility(L0_43)
end
function pccubesensor2_over_warp_OnEnter()
  local L0_44, L1_45
end
function pccubesensor2_over_warp_OnLeave(A0_46)
  if _isInEvent == true and string.match(A0_46:getName(), _goalAreaName) ~= nil and GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeLock) ~= true then
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
    local L0_47, L1_48, L2_49
    L0_47, L1_48 = nil, nil
    repeat
      L2_49 = Fn_getPcPosRot
      L2_49 = L2_49()
      L0_47 = L2_49
      L2_49 = Query
      L2_49 = L2_49.setGfxObservationPoint
      L2_49(L2_49, L0_47)
      L2_49 = Query
      L2_49 = L2_49.getGfxObservationDensity
      L2_49 = L2_49(L2_49)
      L1_48 = L2_49
      L2_49 = debugDispPrint
      L2_49("PC POS : " .. tostring(L0_47))
      L2_49 = debugDispPrint
      L2_49("depth  : " .. tostring(L1_48))
      L2_49 = wait
      L2_49()
      L2_49 = Query
      L2_49 = L2_49.getGfxObservationDensity
      L2_49 = L2_49(L2_49)
    until L2_49 < _POISON_START
    L1_48 = 0
    repeat
      L2_49 = Fn_getPcPosRot
      L2_49 = L2_49()
      L0_47 = L2_49
      L2_49 = Query
      L2_49 = L2_49.setGfxObservationPoint
      L2_49(L2_49, L0_47)
      L2_49 = Query
      L2_49 = L2_49.getGfxObservationDensity
      L2_49 = L2_49(L2_49)
      L1_48 = L2_49
      L2_49 = _POISON_START
      if L1_48 < L2_49 then
        L2_49 = _poison_gas
        if L2_49 == true then
          L2_49 = print
          L2_49("****** poison out ******")
          _poison_gas = false
          L2_49 = Player
          L2_49 = L2_49.applyPoisonDamage
          L2_49(L2_49, 0, 0.01)
          L2_49 = _catwarp
          if L2_49 == false then
            L2_49 = _poison_se
            if L2_49 ~= nil then
              L2_49 = Sound
              L2_49 = L2_49.stopSEHandle
              L2_49(L2_49, _poison_se)
              _poison_se = nil
            end
            L2_49 = _poison_timer_task
            if L2_49 ~= nil then
              L2_49 = _poison_timer_task
              L2_49 = L2_49.abort
              L2_49(L2_49)
              _poison_timer_task = nil
            end
          end
        end
      else
        L2_49 = _POISON_START
        if L1_48 >= L2_49 then
          L2_49 = _poison_gas
          if L2_49 == false then
            L2_49 = print
            L2_49("****** poison [" .. L1_48 .. "] ****** PC POS [" .. tostring(L0_47) .. "] ******")
            L2_49 = invokeTask
            L2_49(poison_erea_in)
            L2_49 = _poison_timer_task
            if L2_49 == nil then
              L2_49 = print
              L2_49("****** poison catwarp count start ******")
              function L2_49()
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
              _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, L2_49)
            end
          end
        end
      end
      L2_49 = wait
      L2_49()
      L2_49 = false
    until L2_49
  end)
end
function poison_erea_in()
  print("************ poison erea in ************")
  _poison_gas = true
  Player:applyPoisonDamage(3, 999)
  Sound:playSE("pc1_poisoned", 1, Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
