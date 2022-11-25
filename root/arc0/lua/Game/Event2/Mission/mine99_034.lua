dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_034"
_floor_num = 34
enmgen_floor_034_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_floor_034_01_01",
      name = "floor_034_01_01"
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
enmgen_floor_034_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_floor_034_02_01",
      name = "floor_034_02_01"
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
function InitializeBody()
  local L0_34, L1_35
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
      Fn_missionView("ic_pi_monument_obj_00340", 0, nil, true)
      HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
      HUD:counter999SetTextID("\230\149\181\227\129\174\230\149\176")
      HUD:counter999SetNum(_enemy_max)
      HUD:counter999SetVisible(true)
    end)
    _pc_dmg = invokeTask(function()
      repeat
        wait()
      until Player:getLastFrameDamagePoint() > 0
      _litho_theme = false
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
    HUD:counter999SetVisible(false)
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
  print("*** floor_034:litho_theme ***")
  _litho_theme = nil
  _count_dead = 0
  _enm_floor_034_01_h = findGameObject2("EnemyGenerator", "enmgen2_floor_034_01")
  _enm_floor_034_02_h = findGameObject2("EnemyGenerator", "enmgen2_floor_034_02")
  _enemy_max = enmgen_floor_034_01:getEnemyMax() + enmgen_floor_034_02:getEnemyMax()
  _enemy_spawn_task = invokeTask(prog_manage)
end
function prog_manage()
  print("*** floor_034:prog_manage ***")
  if _enm_floor_034_01_h ~= nil then
    _enm_floor_034_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_floor_034_01:isEnemyAllDead()
  if _enm_floor_034_02_h ~= nil then
    _enm_floor_034_02_h:requestSpawn()
  end
end
function restart_litho()
  print("*** floor_034:restart_litho ***")
  if _enm_floor_034_01_h ~= nil then
    _enm_floor_034_01_h:requestIdlingEnemy(false)
  end
  if _enm_floor_034_02_h ~= nil then
    _enm_floor_034_02_h:requestIdlingEnemy(false)
  end
  task_all_abort()
  Fn_userCtrlAllOff()
  Player:setStay(true)
  HUD:counter999SetVisible(false)
  missionFailure()
  repeat
    wait()
  until isFailureProcessEnd()
  Fn_blackout()
  if _enm_floor_034_01_h ~= nil then
    _enm_floor_034_01_h:requestAllEnemyKill()
  end
  if _enm_floor_034_02_h ~= nil then
    _enm_floor_034_02_h:requestAllEnemyKill()
  end
  Fn_retryMine99()
end
function task_all_abort()
  if _ui_desp_task ~= nil then
    _ui_desp_task:abort()
  end
  if _pc_dmg ~= nil then
    _pc_dmg:abort()
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
  task_all_abort()
end
