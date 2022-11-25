dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Mission/mine04_common.lua")
_event_file_name = "floor_024"
_floor_num = 24
_litho_theme = nil
_enemy_count_max = 0
_enemy_destroy_num = 0
_correct_answer_tbl = {
  "stalker01",
  "gellyfish01",
  "runner01",
  "lasercannon01",
  "guardcore01",
  "imp01",
  "giant01"
}
_litho_wait_task = nil
enmgen2_a_20_mine99_024 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "stalker_mine_12",
      locator = "locator_mine99_024_01",
      name = "stalker01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_mine99_024_02",
      name = "gellyfish01"
    },
    {
      type = "runner_mine_12",
      locator = "locator_mine99_024_03",
      name = "runner01"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_mine99_024_04",
      name = "lasercannon01"
    },
    {
      type = "guardcore_mine_12",
      locator = "locator_mine99_024_05",
      name = "guardcore01"
    },
    {
      type = "imp_mine_12",
      locator = "locator_mine99_024_06",
      name = "imp01"
    },
    {
      type = "giant_mine_12",
      locator = "locator_mine99_024_07",
      name = "giant01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    _enemy_destroy_num = _enemy_destroy_num + 1
    HUD:counter999SubNum()
  end,
  onObjectDead = function(A0_10, A1_11)
  end
}
enmgen2_a_16_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "defender_mine_02",
      locator = "locator_a_16_01",
      name = "defender01"
    },
    {
      type = "defender_mine_02",
      locator = "locator_a_16_02",
      name = "defender02"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_16_03",
      name = "runner01"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_16_04",
      name = "lasercannon01"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_16_05",
      name = "lasercannon02"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectAsh = function(A0_20, A1_21)
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onPopGem = function(A0_24, A1_25)
    EnemeyDropGem(A0_24, A1_25)
  end
}
enmgen2_a_17_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "jammer_mine_02",
      locator = "locator_a_17_01",
      name = "jammer01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_17_02",
      name = "gellyfish01"
    },
    {
      type = "gellyfish_mine_12",
      locator = "locator_a_17_03",
      name = "gellyfish02"
    },
    {
      type = "defender_mine_02",
      locator = "locator_a_17_04",
      name = "defender01"
    },
    {
      type = "guardcore_mine_12",
      locator = "locator_a_17_05",
      name = "guardcore01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_26)
    local L1_27
  end,
  onEnter = function(A0_28)
    local L1_29
  end,
  onLeave = function(A0_30)
    local L1_31
  end,
  onSpawn = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
  end,
  onObjectDead = function(A0_36, A1_37)
  end,
  onPopGem = function(A0_38, A1_39)
    EnemeyDropGem(A0_38, A1_39)
  end
}
enmgen2_a_18_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "runner_mine_12",
      locator = "locator_a_18_01",
      name = "runner01"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_18_02",
      name = "runner02"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_18_03",
      name = "runner03"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_18_04",
      name = "runner04"
    },
    {
      type = "runner_mine_12",
      locator = "locator_a_18_05",
      name = "runner05"
    },
    {
      type = "lasercannon_mine_02",
      locator = "locator_a_18_06",
      name = "lasercannon01"
    }
  },
  deadEnemies = 0,
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onSpawn = function(A0_46, A1_47)
  end,
  onObjectAsh = function(A0_48, A1_49)
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onPopGem = function(A0_52, A1_53)
    EnemeyDropGem(A0_52, A1_53)
  end
}
function InitializeBody()
  local L0_54
  L0_54 = {}
  L0_54.mineOreEvdName = "mine04_ore"
  L0_54.instance_flg = true
  L0_54.manager_name = g_own:getName()
  L0_54.deploy_areas = getElectedAreaNames()
  L0_54.exclusion_areas = {
    _param_mine99_base.goal_area_name
  }
  _gravityOre = L0_54
end
function IngameBody()
  local L0_55
  L0_55 = {
    "az2_a_16",
    "az2_a_17",
    "az2_a_18"
  }
  if _create_fire_effect == false then
    putCandleFireEffect("az2_a_03", _candle_fire_max_az2_a_03, true)
    putCandleFireEffect("az2_a_16", _candle_fire_max_az2_a_16, true)
    putCandleFireEffect("az2_a_17", _candle_fire_max_az2_a_17, true)
    putCandleFireEffect("az2_a_18", _candle_fire_max_az2_a_18, true)
    putCandleFireEffect("az2_a_20", _candle_fire_max_az2_a_20, true)
    putCandleFireEffect("az2_a_21", _candle_fire_max_az2_a_21, true)
    _create_fire_effect = true
  end
  Fn_missionStart()
  Fn_showMineName()
  Fn_userCtrlOn()
  if Fn_getMine99FloorClear() then
    Fn_setGravityGateActive(true)
  else
    lithoThemeInit()
    missionTextVisible(true)
    repeat
      wait()
    until isLithographStart()
    setFirstHalfProcessEnd()
    Fn_missionView("ic_pi_monument_obj_00240", 0, nil, true)
    for _FORV_5_ = 1, #L0_55 do
      requestEnemyKill(L0_55[_FORV_5_], ({
        "a_16_01",
        "a_17_01",
        "a_18_01"
      })[_FORV_5_])
    end
    waitSeconds(2)
    if findGameObject2("EnemyGenerator", "enmgen2_a_20_mine99_024") ~= nil then
      findGameObject2("EnemyGenerator", "enmgen2_a_20_mine99_024"):requestSpawn()
      _enemy_count_max = #findGameObject2("EnemyGenerator", "enmgen2_a_20_mine99_024"):getSpecTable().spawnSet
    end
    findGameObject2("EnemyGenerator", "enmgen2_a_20_mine99_024"):setEventListener("DestroyEnemyReport", Fn_destroyEnemyReport)
    HUD:counter999SetTextID("ic_pi_mine99_002")
    HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
    HUD:counter999SetNum(_enemy_count_max)
    HUD:counter999SetVisible(true)
    _litho_wait_task = invokeTask(function()
      while _litho_theme == nil do
        wait()
      end
      HUD:counter999SetVisible(false)
      Fn_missionInfoEnd()
      if _litho_theme == true then
        missionComplete()
        repeat
          wait()
        until isSecondHalfProcessWait()
        setSecondHalfProcessEnd()
        Fn_setMine99FloorClear()
        lithoThemeInit()
        Fn_setGravityGateActive(true)
      elseif _litho_theme == false then
        missionFailure()
        repeat
          wait()
        until isFailureProcessEnd()
        Fn_blackout()
        Fn_retryMine99()
      end
    end)
  end
end
function Fn_destroyEnemyReport(A0_56)
  local L1_57, L2_58
  L1_57 = A0_56.name
  L2_58 = A0_56.attacker
  if L1_57 == _correct_answer_tbl[_enemy_destroy_num] then
    Sound:playSE("success")
    if _enemy_destroy_num == _enemy_count_max then
      _litho_theme = true
    end
  else
    _litho_theme = false
  end
  print("destroyEnemyName:" .. L1_57)
  print("attackerType:" .. L2_58)
end
function lithoThemeInit()
  _litho_theme = nil
  _enemy_count_max = 0
  _enemy_destroy_num = 0
  if _litho_wait_task ~= nil then
    _litho_wait_task:abort()
    _litho_wait_task = nil
  end
end
function requestEnemyKill(A0_59, A1_60)
  local L2_61
  L2_61 = Fn_findAreaHandle
  L2_61 = L2_61(A0_59)
  if L2_61 ~= nil then
    L2_61 = "enmgen2_"
    L2_61 = L2_61 .. A1_60
    if findGameObject2("EnemyGenerator", L2_61) then
      print(string.format("EnemyGenerator:%s \227\129\174\230\149\181\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153\227\128\130", L2_61))
      findGameObject2("EnemyGenerator", L2_61):requestAllEnemyKill()
    else
      print(string.format("EnemyGenerator:%s \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", L2_61))
    end
  else
    L2_61 = print
    L2_61(string.format("%s \227\130\168\227\131\170\227\130\162\227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130", A0_59))
  end
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
