dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_038"
_floor_num = 38
_MAX_ENEMY = 30
_TIME_LIMIT = 180
_total_enemy_count = 0
_isSuccess = false
_isFailure = false
_isTimerRunning = false
_enmgen_tbl = {
  {hdl = nil, name = "enmgen2_01"},
  {hdl = nil, name = "enmgen2_02"},
  {hdl = nil, name = "enmgen2_03"},
  {hdl = nil, name = "enmgen2_04"}
}
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      name = "enmgen2_01_01",
      type = "treecannon_mine_01",
      locator = "locator_01"
    },
    {
      name = "enmgen2_01_02",
      type = "treecannon_mine_01",
      locator = "locator_02"
    },
    {
      name = "enmgen2_01_03",
      type = "treecannon_mine_01",
      locator = "locator_03"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_0, A1_1)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end
}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      name = "enmgen2_02_01",
      type = "lasercannon_mine_01",
      locator = "locator_01"
    },
    {
      name = "enmgen2_02_02",
      type = "lasercannon_mine_01",
      locator = "locator_02"
    },
    {
      name = "enmgen2_02_03",
      type = "lasercannon_mine_01",
      locator = "locator_03"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_2, A1_3)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end
}
enmgen2_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      name = "enmgen3_02_01",
      type = "gellyfish_mine_01",
      locator = "locator_01"
    },
    {
      name = "enmgen3_02_02",
      type = "gellyfish_mine_01",
      locator = "locator_02"
    },
    {
      name = "enmgen3_02_03",
      type = "gellyfish_mine_01",
      locator = "locator_03"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_4, A1_5)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end
}
enmgen2_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = true,
  autoRebirthIntervalTime = 0.1,
  spawnSet = {
    {
      name = "enmgen4_02_01",
      type = "imp_mine_01",
      locator = "locator_01"
    },
    {
      name = "enmgen4_02_02",
      type = "imp_mine_01",
      locator = "locator_02"
    },
    {
      name = "enmgen4_02_03",
      type = "imp_mine_01",
      locator = "locator_03"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_6, A1_7)
    _total_enemy_count = _total_enemy_count - 1
    HUD:counter999SubNum()
  end
}
function InitializeBody()
  local L0_8, L1_9
end
function IngameBody()
  Fn_missionStart()
  Fn_showMineName()
  Fn_userCtrlOn()
  if Fn_getMine99FloorClear() then
    print("\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153")
  else
    HUD:timerSetVisible(false)
    HUD:counter999SetVisible(false)
    missionTextVisible(true)
    repeat
      wait()
    until isLithographStart()
    setFirstHalfProcessEnd()
    Fn_missionView("ic_pi_monument_obj_00380", 0, nil, true)
    _isSuccess = false
    _isFailure = false
    _isTimerRunning = false
    _total_enemy_count = _MAX_ENEMY
    for _FORV_3_ = 1, #_enmgen_tbl do
      _enmgen_tbl[_FORV_3_].hdl = findGameObject2("EnemyGenerator", _enmgen_tbl[_FORV_3_].name)
      _enmgen_tbl[_FORV_3_].hdl:requestSpawn()
    end
    _FOR_:timerSetTextID("ui_hud_counter_timer_01")
    HUD:timerSetSecond(_TIME_LIMIT)
    HUD:timerStart()
    HUD:timerSetVisible(true)
    HUD:counter999SetTextID("ic_pi_mine99_02_013")
    HUD:counter999SetIcon(HUD.kCount999IconType_Stone)
    HUD:counter999SetNum(_total_enemy_count)
    HUD:counter999SetVisible(true)
    _isTimerRunning = true
    while true do
      if not _isFailure and 0 >= _total_enemy_count then
        _isSuccess = true
        break
      end
      if Fn_getCageStatus() then
        _isSuccess = false
        break
      end
      wait()
    end
    for _FORV_4_ = 1, #_enmgen_tbl do
      _enmgen_tbl[_FORV_4_].hdl:setAutoRevirthSwitch(false)
    end
    _FOR_()
    for _FORV_4_ = 1, #_enmgen_tbl do
      _enmgen_tbl[_FORV_4_].hdl:requestAllEnemyKill()
    end
    waitSeconds(2)
    HUD:timerSetVisible(false)
    HUD:counter999SetVisible(false)
    Fn_missionInfoEnd()
    missionComplete()
    repeat
      wait()
    until isSecondHalfProcessWait()
    setSecondHalfProcessEnd()
    Fn_setMine99FloorClear()
  end
  Fn_setGravityGateActive(true)
end
function FinalizeBody()
  HUD:timerSetVisible(false)
  HUD:counter999SetVisible(false)
end
function judge()
  if _isSuccess or Fn_getCageStatus() then
    return
  end
  if _total_enemy_count <= 0 then
    _isSuccess = true
  else
    _isFailure = true
    print(string.format("%d \228\189\147\230\174\139\227\130\138\227\129\190\227\129\151\227\129\159\227\128\130", _total_enemy_count))
    missionFailure()
    repeat
      wait()
    until isFailureProcessEnd()
    HUD:timerSetVisible(false)
    HUD:counter999SetVisible(false)
    Fn_blackout()
    Fn_retryMine99()
  end
end
