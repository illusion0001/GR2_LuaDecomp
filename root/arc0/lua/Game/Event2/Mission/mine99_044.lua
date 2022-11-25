dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_044"
_floor_num = 44
enmgen_floor_044_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator_floor_044_01_01",
      name = "floor_044_laser_01",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_01_02",
      name = "floor_044_laser_02",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_01_03",
      name = "floor_044_laser_03",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_01_04",
      name = "floor_044_laser_04",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_01_05",
      name = "floor_044_laser_05",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
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
  onSpawn = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
    _count_dead = _count_dead + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_12)
    return #A0_12.spawnSet
  end,
  getEnemyDeadNum = function(A0_13)
    local L1_14
    L1_14 = A0_13.enemyDeadNum
    return L1_14
  end,
  isEnemyAllDead = function(A0_15)
    local L2_16
    L2_16 = A0_15.enemyDeadNum
    L2_16 = L2_16 >= #A0_15.spawnSet
    return L2_16
  end
}
enmgen_floor_044_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator_floor_044_02_01",
      name = "floor_044_laser_06",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_02_02",
      name = "floor_044_laser_07",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_02_03",
      name = "floor_044_laser_08",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_02_04",
      name = "floor_044_laser_09",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_02_05",
      name = "floor_044_laser_10",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    }
  },
  onUpdate = function(A0_17)
    local L1_18
  end,
  onEnter = function(A0_19)
    local L1_20
  end,
  onLeave = function(A0_21)
    local L1_22
  end,
  onSpawn = function(A0_23, A1_24)
    A0_23:getSpecTable().enemyDeadNum = A0_23:getSpecTable().enemyDeadNum - 1
    if A0_23:getSpecTable().enemyDeadNum < 0 then
      A0_23:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_25, A1_26)
  end,
  onObjectAsh = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
    _count_dead = _count_dead + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_29)
    return #A0_29.spawnSet
  end,
  getEnemyDeadNum = function(A0_30)
    local L1_31
    L1_31 = A0_30.enemyDeadNum
    return L1_31
  end,
  isEnemyAllDead = function(A0_32)
    local L2_33
    L2_33 = A0_32.enemyDeadNum
    L2_33 = L2_33 >= #A0_32.spawnSet
    return L2_33
  end
}
enmgen_floor_044_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "lasercannon",
      locator = "locator_floor_044_03_01",
      name = "floor_044_laser_11",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_03_02",
      name = "floor_044_laser_12",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_03_03",
      name = "floor_044_laser_13",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    },
    {
      type = "lasercannon",
      locator = "locator_floor_044_03_04",
      name = "floor_044_laser_14",
      ai_spawn_option = "LaserCannon/LaserCannon_Fix"
    }
  },
  onUpdate = function(A0_34)
    local L1_35
  end,
  onEnter = function(A0_36)
    local L1_37
  end,
  onLeave = function(A0_38)
    local L1_39
  end,
  onSpawn = function(A0_40, A1_41)
    A0_40:getSpecTable().enemyDeadNum = A0_40:getSpecTable().enemyDeadNum - 1
    if A0_40:getSpecTable().enemyDeadNum < 0 then
      A0_40:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_42, A1_43)
  end,
  onObjectAsh = function(A0_44, A1_45)
    A0_44:getSpecTable().enemyDeadNum = A0_44:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
    _count_dead = _count_dead + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_46)
    return #A0_46.spawnSet
  end,
  getEnemyDeadNum = function(A0_47)
    local L1_48
    L1_48 = A0_47.enemyDeadNum
    return L1_48
  end,
  isEnemyAllDead = function(A0_49)
    local L2_50
    L2_50 = A0_49.enemyDeadNum
    L2_50 = L2_50 >= #A0_49.spawnSet
    return L2_50
  end
}
enmgen_floor_044_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_floor_044_04_01",
      name = "floor_044_giant_15"
    }
  },
  onUpdate = function(A0_51)
    local L1_52
  end,
  onEnter = function(A0_53)
    local L1_54
  end,
  onLeave = function(A0_55)
    local L1_56
  end,
  onSpawn = function(A0_57, A1_58)
    A0_57:getSpecTable().enemyDeadNum = A0_57:getSpecTable().enemyDeadNum - 1
    if A0_57:getSpecTable().enemyDeadNum < 0 then
      A0_57:getSpecTable().enemyDeadNum = 0
    end
  end,
  onObjectDead = function(A0_59, A1_60)
  end,
  onObjectAsh = function(A0_61, A1_62)
    A0_61:getSpecTable().enemyDeadNum = A0_61:getSpecTable().enemyDeadNum + 1
    HUD:counter999SubNum()
    _count_dead = _count_dead + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_63)
    return #A0_63.spawnSet
  end,
  getEnemyDeadNum = function(A0_64)
    local L1_65
    L1_65 = A0_64.enemyDeadNum
    return L1_65
  end,
  isEnemyAllDead = function(A0_66)
    local L2_67
    L2_67 = A0_66.enemyDeadNum
    L2_67 = L2_67 >= #A0_66.spawnSet
    return L2_67
  end
}
function InitializeBody()
  _clear_time = {
    0,
    3,
    59,
    99
  }
  Fn_setExtraWarpPoint("locator2_litho_pc_pos_03")
end
function IngameBody()
  Fn_missionStart()
  Fn_showMineName()
  Fn_userCtrlOn()
  if Fn_getMine99FloorClear() then
    print("\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153")
  else
    missionTextVisible(true)
    repeat
      wait()
    until isLithographStart()
    litho_theme()
    setFirstHalfProcessEnd()
    _ui_desp_task = invokeTask(function()
      Fn_missionView("ic_pi_monument_obj_00440", 0, nil, true)
      HUD:counter999SetIcon(HUD.kCount999IconType_Stone)
      HUD:counter999SetTextID("\230\149\181\227\129\174\230\149\176")
      HUD:counter999SetNum(_enemy_max)
      HUD:counter999SetVisible(true)
      _litho_timer_task = invokeTask(litho_timer, _clear_time)
    end)
    _flag_check = invokeTask(function()
      repeat
        repeat
          wait()
        until _count_dead >= _enemy_max
        if _litho_theme == nil then
          _litho_theme = true
        end
        wait()
      until _litho_theme
    end)
    repeat
      if _litho_theme == false then
        restart_litho()
      end
      wait()
    until _litho_theme
    for _FORV_3_, _FORV_4_ in ipairs(_laser_tesk) do
      if _FORV_4_ ~= nil then
        _FORV_4_:abort()
      end
    end
    HUD:counter999SetVisible(false)
    HUD:timerStop()
    HUD:timerSetVisible(false)
    Fn_missionInfoEnd()
    task_all_abort()
    missionComplete()
    repeat
      wait()
    until isSecondHalfProcessWait()
    setSecondHalfProcessEnd()
    Fn_setMine99FloorClear()
  end
  Fn_setGravityGateActive(true)
end
function litho_theme()
  print("*** floor_044:litho_theme ***")
  _litho_theme = nil
  _laser_tesk = {}
  _litho_timer_task = nil
  _count_dead = 0
  _enm_floor_044_01_h = findGameObject2("EnemyGenerator", "enmgen2_floor_044_01")
  _enm_floor_044_02_h = findGameObject2("EnemyGenerator", "enmgen2_floor_044_02")
  _enm_floor_044_03_h = findGameObject2("EnemyGenerator", "enmgen2_floor_044_03")
  _enm_floor_044_04_h = findGameObject2("EnemyGenerator", "enmgen2_floor_044_04")
  _enemy_max = enmgen_floor_044_01:getEnemyMax() + enmgen_floor_044_02:getEnemyMax() + enmgen_floor_044_03:getEnemyMax() + enmgen_floor_044_04:getEnemyMax()
  _enemy_spawn_task = invokeTask(prog_manage)
end
function prog_manage()
  local L0_68, L1_69, L2_70, L3_71
  L0_68(L1_69)
  if L0_68 ~= nil then
    L0_68(L1_69)
  end
  if L0_68 ~= nil then
    L0_68(L1_69)
  end
  if L0_68 ~= nil then
    L0_68(L1_69)
  end
  if L0_68 ~= nil then
    L0_68(L1_69)
  end
  for L3_71 = 1, 14 do
    Fn_pcSensorOn(string.format("pccubesensor2_laser_%02d", L3_71))
  end
  L0_68(L1_69, L2_70)
  L0_68(L1_69, L2_70)
  L0_68(L1_69, L2_70)
  L0_68(L1_69, L2_70)
end
function litho_timer(A0_72)
  while _litho_theme ~= true do
    if _litho_theme == nil then
      HUD:timerSetSecond(A0_72)
      HUD:timerSetVisible(true)
      HUD:timerStart()
      _timer_se = Sound:playSEHandle("sys_countdown", 1)
      while HUD:timerGetSecond() > 0 do
        wait()
      end
      _litho_theme = false
      HUD:timerStop()
      if _timer_se ~= nil then
        Sound:stopSEHandle(_timer_se)
      end
    end
    wait()
  end
end
function attack_laser(A0_73)
  local L1_74
  repeat
    L1_74 = findGameObject2
    L1_74 = L1_74("EnemyBrain", string.format("floor_044_laser_%02d", A0_73))
    if L1_74 ~= nil then
      L1_74:eventMessage("Laser")
      waitSeconds(10)
    end
    wait()
  until _litho_theme ~= nil
end
function pccubesensor2_laser_OnEnter(A0_75, A1_76)
  local L2_77, L3_78
  L3_78 = A0_75
  L2_77 = A0_75.getName
  L2_77 = L2_77(L3_78)
  L3_78 = print
  L3_78("lasercannon sensor:" .. L2_77)
  L3_78 = Fn_pcSensorOff
  L3_78(L2_77)
  L3_78 = string
  L3_78 = L3_78.sub
  L3_78 = L3_78(L2_77, -2)
  _laser_tesk[tonumber(L3_78)] = invokeTask(attack_laser, L3_78)
end
function restart_litho()
  print("*** floor_044:restart_litho ***")
  if _enm_floor_044_01_h ~= nil then
    _enm_floor_044_01_h:requestIdlingEnemy(false)
  end
  if _enm_floor_044_02_h ~= nil then
    _enm_floor_044_02_h:requestIdlingEnemy(false)
  end
  if _enm_floor_044_03_h ~= nil then
    _enm_floor_044_03_h:requestIdlingEnemy(false)
  end
  if _enm_floor_044_04_h ~= nil then
    _enm_floor_044_04_h:requestIdlingEnemy(false)
  end
  task_all_abort()
  Fn_userCtrlAllOff()
  Player:setStay(true)
  HUD:counter999SetVisible(false)
  HUD:timerSetVisible(false)
  missionFailure()
  repeat
    wait()
  until isFailureProcessEnd()
  Fn_blackout()
  if _enm_floor_044_01_h ~= nil then
    _enm_floor_044_01_h:requestAllEnemyKill()
  end
  if _enm_floor_044_02_h ~= nil then
    _enm_floor_044_02_h:requestAllEnemyKill()
  end
  if _enm_floor_044_03_h ~= nil then
    _enm_floor_044_03_h:requestAllEnemyKill()
  end
  if _enm_floor_044_04_h ~= nil then
    _enm_floor_044_04_h:requestAllEnemyKill()
  end
  Fn_retryMine99()
end
function task_all_abort()
  if _ui_desp_task ~= nil then
    _ui_desp_task:abort()
  end
  if _timer_se ~= nil then
    Sound:stopSEHandle(_timer_se)
  end
  if _litho_timer_task ~= nil then
    _litho_timer_task:abort()
  end
  if _flag_check ~= nil then
    _flag_check:abort()
  end
  if _enemy_spawn_task ~= nil then
    _enemy_spawn_task:abort()
  end
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
  HUD:timerSetVisible(false)
  task_all_abort()
end
