dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Misc/area_controller.lua")
_event_file_name = "floor_013"
_floor_num = 13
SET_ORE_MAX = 20
_eneList = nil
_startAreaName = nil
_goalAreaName = nil
_gasTask = nil
_oreHdl = nil
_oreCount = 0
_isInEvent = false
_cageMoveEnd = false
enmgen2_az_a_03_01 = {
  spawnOnStart = true,
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
      type = "lasercannon",
      locator = "locator_05"
    }
  },
  enemyMaxNum = 0,
  onSpawn = function(A0_0, A1_1)
  end,
  onObjectDead = function(A0_2, A1_3)
  end,
  onPopGem = function(A0_4, A1_5)
    EnemeyDropGem(A0_4, A1_5)
  end
}
enmgen2_az_a_04_01 = {
  spawnOnStart = true,
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
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onPopGem = function(A0_10, A1_11)
    EnemeyDropGem(A0_10, A1_11)
  end
}
enmgen2_az_a_05_01 = {
  spawnOnStart = true,
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
  onSpawn = function(A0_12, A1_13)
  end,
  onObjectDead = function(A0_14, A1_15)
  end,
  onPopGem = function(A0_16, A1_17)
    EnemeyDropGem(A0_16, A1_17)
  end
}
enmgen2_az_a_07_01 = {
  spawnOnStart = true,
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
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  onPopGem = function(A0_22, A1_23)
    EnemeyDropGem(A0_22, A1_23)
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
  _onBreak_callFuncName = "setBreakCount"
  if _gasTask == nil then
    _gasTask = poison_observation()
  end
end
function IngameBody()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36
  L0_24 = print
  L1_25 = string
  L1_25 = L1_25.format
  L2_26 = "mine99_%03d IngameBody"
  L12_36 = L1_25(L2_26, L3_27)
  L0_24(L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L1_25(L2_26, L3_27))
  L0_24 = Fn_getEneGenNameTable
  L0_24 = L0_24()
  L1_25 = {}
  L2_26 = 1
  _startAreaName = L3_27
  _goalAreaName = L3_27
  for L6_30, L7_31 in L3_27(L4_28) do
    for L11_35, L12_36 in L8_32(L9_33) do
      L1_25[L2_26] = findGameObject2("EnemyGenerator", L12_36)
      L2_26 = L2_26 + 1
    end
  end
  _eneList = L1_25
  for L8_32, L9_33 in L5_29(L6_30) do
    L11_35 = L9_33
    L11_35 = string
    L11_35 = L11_35.match
    L12_36 = L10_34
    L11_35 = L11_35(L12_36, "floor13")
    if L11_35 ~= nil then
      L11_35 = string
      L11_35 = L11_35.match
      L12_36 = L10_34
      L11_35 = L11_35(L12_36, _goalAreaName)
      if L11_35 ~= nil then
      end
    else
      L11_35 = string
      L11_35 = L11_35.match
      L12_36 = L9_33.getName
      L12_36 = L12_36(L9_33)
      L11_35 = L11_35(L12_36, _startAreaName)
      if L11_35 ~= nil then
      else
        L12_36 = L9_33
        L11_35 = L9_33.requestSpawn
        L11_35(L12_36)
      end
    end
  end
  L5_29()
  L5_29()
  L5_29()
  _isInEvent = false
  if not L5_29 then
    L5_29(L6_30)
    repeat
      L5_29()
    until L5_29
    L5_29(L6_30, L7_31, L8_32, L9_33)
    L5_29()
    L6_30.mineOreEvdName = "floor_013_ore"
    L6_30.instance_flg = false
    L6_30.manager_name = "floor_013_ore"
    L6_30.deploy_areas = L7_31
    L6_30.exclusion_areas = nil
    L5_29(L6_30)
    L5_29()
    repeat
      L5_29()
    until L5_29
    L5_29()
    _isInEvent = true
    L5_29(L6_30)
    _oreCount = 0
    L5_29(L6_30, L7_31)
    L5_29(L6_30, L7_31)
    L5_29(L6_30, L7_31)
    L5_29(L6_30, L7_31)
    L5_29(L6_30, L7_31)
    for L8_32, L9_33 in L5_29(L6_30) do
      function L11_35()
        L9_33:requestAllEnemyKill()
        waitSeconds(1)
        L9_33:requestSpawn()
      end
      L10_34(L11_35)
      break
    end
    L5_29(L6_30)
    while true do
      L5_29(L6_30, L7_31)
      if L5_29 >= L6_30 then
        L5_29()
        L5_29()
        L5_29()
        repeat
          L5_29()
        until L5_29
        L5_29()
        L5_29()
        break
      end
      L5_29()
    end
    L5_29(L6_30)
    L5_29(L6_30, L7_31)
    _isInEvent = false
    for L8_32, L9_33 in L5_29(L6_30) do
      L11_35 = L9_33
      L10_34(L11_35)
    end
  else
    L5_29(L6_30)
  end
  L5_29(L6_30)
end
function FinalizeBody()
  print(string.format("mine99_%03d FinalizeBody", _floor_num))
  HUD:counter99_99SetVisible(false)
  if _gasTask ~= nil then
    _gasTask:abort()
    _gasTask = nil
  end
end
function startMoveIsland()
  _area_ctrl = AreaController.create("az_a_04")
  _moveTask = invokeTask(function()
    local L0_37, L1_38, L2_39, L3_40
    L0_37 = {}
    L0_37.velocity = 5
    L0_37.move_type = 1
    L1_38 = "locator2_floor13_az_a_04_down"
    L2_39 = "locator2_floor13_az_a_04_up"
    L3_40 = L1_38
    _area_ctrl:setMoveParam(L0_37)
    while true do
      _area_ctrl:move(L3_40)
      repeat
        wait()
      until _area_ctrl:isMoveEnd()
      if 1 == 1 then
        L3_40 = L2_39
      else
        L3_40 = L1_38
      end
    end
  end)
end
function endMoveIsland()
  _area_ctrl:stop()
  _moveTask:abort()
  _moveTask = nil
  invokeTask(function()
    local L0_41, L1_42, L2_43
    L0_41 = {}
    L0_41.velocity = 5
    L0_41.move_type = 1
    L1_42 = "locator2_floor13_az_a_04_up"
    L2_43 = 1
    _area_ctrl:setMoveParam(L0_41)
    while true do
      _area_ctrl:move(L1_42)
      repeat
        wait()
      until _area_ctrl:isMoveEnd()
      break
    end
    _area_ctrl = nil
  end)
end
function setBreakCount()
  local L1_44
  L1_44 = _oreCount
  L1_44 = L1_44 + 1
  _oreCount = L1_44
end
_POISON_START = 0.058
_catwarp_wait = 2
_poison_gas = false
_catwarp = false
_poison_se = nil
function poison_observation()
  print("**** poison_observation : start ****")
  return invokeTask(function()
    local L0_45, L1_46, L2_47
    L0_45, L1_46 = nil, nil
    repeat
      L2_47 = Fn_getPcPosRot
      L2_47 = L2_47()
      L0_45 = L2_47
      L2_47 = Query
      L2_47 = L2_47.setGfxObservationPoint
      L2_47(L2_47, L0_45)
      L2_47 = Query
      L2_47 = L2_47.getGfxObservationDensity
      L2_47 = L2_47(L2_47)
      L1_46 = L2_47
      L2_47 = wait
      L2_47()
      L2_47 = Query
      L2_47 = L2_47.getGfxObservationDensity
      L2_47 = L2_47(L2_47)
    until L2_47 < _POISON_START
    L1_46 = 0
    repeat
      L2_47 = Fn_getPcPosRot
      L2_47 = L2_47()
      L0_45 = L2_47
      L2_47 = Query
      L2_47 = L2_47.setGfxObservationPoint
      L2_47(L2_47, L0_45)
      L2_47 = Query
      L2_47 = L2_47.getGfxObservationDensity
      L2_47 = L2_47(L2_47)
      L1_46 = L2_47
      L2_47 = debugDispPrint
      L2_47("PC POS : " .. tostring(L0_45))
      L2_47 = debugDispPrint
      L2_47("depth  : " .. tostring(L1_46))
      L2_47 = _POISON_START
      if L1_46 < L2_47 then
        L2_47 = _poison_gas
        if L2_47 == true then
          L2_47 = print
          L2_47("****** poison out ******")
          _poison_gas = false
          L2_47 = Player
          L2_47 = L2_47.applyPoisonDamage
          L2_47(L2_47, 0, 0.01)
          L2_47 = _catwarp
          if L2_47 == false then
            L2_47 = _poison_se
            if L2_47 ~= nil then
              L2_47 = Sound
              L2_47 = L2_47.stopSEHandle
              L2_47(L2_47, _poison_se)
              _poison_se = nil
            end
            L2_47 = _poison_timer_task
            if L2_47 ~= nil then
              L2_47 = _poison_timer_task
              L2_47 = L2_47.abort
              L2_47(L2_47)
              _poison_timer_task = nil
            end
          end
        end
      else
        L2_47 = _POISON_START
        if L1_46 >= L2_47 then
          L2_47 = _poison_gas
          if L2_47 == false then
            L2_47 = print
            L2_47("****** poison [" .. L1_46 .. "] ****** PC POS [" .. tostring(L0_45) .. "] ******")
            L2_47 = invokeTask
            L2_47(poison_erea_in)
            L2_47 = _poison_timer_task
            if L2_47 == nil then
              L2_47 = print
              L2_47("****** poison catwarp count start ******")
              function L2_47()
                if _catwarp == false then
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
              end
              _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, L2_47)
            end
          end
        end
      end
      L2_47 = wait
      L2_47()
      L2_47 = false
    until L2_47
  end)
end
function poison_erea_in()
  print("************ poison erea in ************")
  _poison_gas = true
  Player:applyPoisonDamage(3, 999)
  Sound:playSE("pc1_poisoned", 1, Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
function pccubesensor2_floor13_01_OnEnter()
  local L0_48, L1_49
end
function pccubesensor2_floor13_01_OnLeave()
  if _isInEvent == true and GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeLock) ~= true then
  end
end
