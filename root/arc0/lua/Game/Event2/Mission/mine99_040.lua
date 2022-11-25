dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Misc/area_controller.lua")
_event_file_name = "floor_040"
_floor_num = 40
_POISON_START = 0.058
_POISON_LITHO = 1.0E-4
_poison_damage = 6
_catwarp_wait = 2
enmgen_floor_040_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "defender",
      locator = "locator_floor_040_01_01",
      name = "floor_040_01"
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
enmgen_floor_040_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "defender",
      locator = "locator_floor_040_02_01",
      name = "floor_040_02"
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
  Fn_pcSensorOff("pccubesensormulti2_litho_catwarp_warning")
  Fn_pcSensorOff("pccubesensormulti2_litho_catwarp")
  _poison_gas = false
  _poison_limit = false
  _poison_se = nil
  _poison_density = _POISON_START
  _observation = poison_observation()
  _litho_start = false
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
      Fn_missionView("ic_pi_monument_obj_00400", 0, nil, true)
      HUD:counter999SetIcon(HUD.kCount99_99IconType_Stone)
      HUD:counter999SetTextID("\230\149\181\227\129\174\230\149\176")
      HUD:counter999SetNum(_enemy_max)
      HUD:counter999SetVisible(true)
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
    _poison_density = _POISON_START
    _litho_start = false
    Fn_pcSensorOff("pccubesensormulti2_litho_catwarp_warning")
    Fn_pcSensorOff("pccubesensormulti2_litho_catwarp")
    island_move("az_a_05", "locator2_az_a_05_set_01", 5, 1.5, 8)
    Fn_setMine99FloorClear()
  end
  Fn_setGravityGateActive(true)
end
function poison_observation()
  print("**** poison_observation : start ****")
  return invokeTask(function()
    local L0_36, L1_37
    L0_36, L1_37 = nil, nil
    repeat
      L0_36 = Fn_getPcPosRot()
      Query:setGfxObservationPoint(L0_36)
      L1_37 = Query:getGfxObservationDensity()
      wait()
    until Query:getGfxObservationDensity() < _poison_density
    L1_37 = 0
    repeat
      L0_36 = Fn_getPcPosRot()
      Query:setGfxObservationPoint(L0_36)
      L1_37 = Query:getGfxObservationDensity()
      if L1_37 < _poison_density then
        if _poison_gas == true then
          print("****** poison end ******")
          invokeTask(poison_area_out)
        end
      elseif L1_37 >= _poison_density and _poison_gas == false then
        print("****** poison [" .. L1_37 .. "] ****** PC POS [" .. tostring(L0_36) .. "] ******")
        invokeTask(poison_erea_in)
        if _poison_timer_task == nil and not _litho_start then
          print("****** poison catwarp count start ******")
          _poison_timer_task = EventHelper:timerCallback("poison_catwarp", 5, function()
            _poison_limit = true
            _poison_timer_task = nil
            Fn_catWarp()
            waitSeconds(_catwarp_wait)
          end)
        end
      end
      wait()
    until false
  end)
end
function poison_erea_in()
  print("************ poison in ************")
  _poison_gas = true
  _poison_limit = false
  Player:applyPoisonDamage(_poison_damage, 999)
  _poison_se = Sound:playSEHandle("pc1_poisoned", 1, "", Fn_getPlayer())
  Fn_captionView("ep03_09010")
end
function poison_area_out()
  print("************ poison out ************")
  _poison_gas = false
  _poison_limit = false
  if _poison_se ~= nil then
    Sound:stopSEHandle(_poison_se)
    _poison_se = nil
  end
  Player:applyPoisonDamage(0, 0.01)
  if _poison_timer_task ~= nil then
    _poison_timer_task:abort()
    _poison_timer_task = nil
  end
  if _poison_first_timer ~= nil then
    _poison_first_timer:abort()
  end
end
function isPoisonAreaIN()
  local L0_38, L1_39
  L0_38 = _poison_gas
  return L0_38
end
function isPoisonLimit()
  local L0_40, L1_41
  L0_40 = _poison_limit
  return L0_40
end
function litho_theme()
  print("*** floor_040:litho_theme ***")
  litho_init()
  island_move("az_a_05", "locator2_az_a_05_set_02", 5, 1.5, 8)
  _enm_floor_040_01_h = findGameObject2("EnemyGenerator", "enmgen2_floor_040_01")
  _enm_floor_040_02_h = findGameObject2("EnemyGenerator", "enmgen2_floor_040_02")
  _enemy_max = enmgen_floor_040_01:getEnemyMax() + enmgen_floor_040_02:getEnemyMax()
  _enemy_spawn_task = invokeTask(prog_manage)
end
function litho_init()
  _litho_theme = nil
  _litho_start = true
  _count_dead = 0
  _poison_density = _POISON_LITHO
  _poison_timer_task = nil
  _ui_desp_task = nil
  _flag_check = nil
  _enemy_spawn_task = nil
  _island_se_stop = nil
  Fn_pcSensorOn("pccubesensormulti2_litho_catwarp_warning")
  Fn_pcSensorOn("pccubesensormulti2_litho_catwarp")
end
function island_move(A0_42, A1_43, A2_44, A3_45, A4_46, A5_47)
  _area_ctrl = AreaController.create(A0_42)
  _area_ctrl:setMoveParam({
    {
      velocity = A2_44,
      move_type = A3_45,
      move_atime = A4_46,
      move_bdist = A5_47
    }
  })
  _area_ctrl:move(A1_43)
  _area_hdl = Fn_findAreaHandle(A0_42)
  _area_bdist = A5_47
  _island_se_hdl = Sound:playSEHandle("ep03_island_rise_l", 1, "", _area_hdl)
  _island_se_stop = invokeTask(function()
    waitSeconds(3)
    Sound:stopSEHandle(_island_se_hdl)
  end)
end
function prog_manage()
  print("*** floor_040:prog_manage ***")
  if _enm_floor_040_01_h ~= nil then
    _enm_floor_040_01_h:requestSpawn()
  end
  repeat
    wait()
  until enmgen_floor_040_01:isEnemyAllDead()
  if _enm_floor_040_02_h ~= nil then
    _enm_floor_040_02_h:requestSpawn()
  end
end
function pccubesensormulti2_litho_catwarp_warning_OnEnter()
  local L0_48, L1_49
end
function pccubesensormulti2_litho_catwarp_warning_OnLeave()
  local L0_50, L1_51
end
function pccubesensormulti2_litho_catwarp_OnEnter()
  local L0_52, L1_53
end
function pccubesensormulti2_litho_catwarp_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function restart_litho()
  print("*** floor_040:restart_litho ***")
  task_all_abort()
  Fn_userCtrlAllOff()
  Player:setStay(true)
  HUD:counter999SetVisible(false)
  missionFailure()
  repeat
    wait()
  until isFailureProcessEnd()
  Fn_blackout()
  Fn_retryMine99()
end
function task_all_abort()
  if _ui_desp_task ~= nil then
    _ui_desp_task:abort()
    _ui_desp_task = nil
  end
  if _flag_check ~= nil then
    _flag_check:abort()
    _flag_check = nil
  end
  if _enemy_spawn_task ~= nil then
    _enemy_spawn_task:abort()
    _enemy_spawn_task = nil
  end
  if _observation ~= nil then
    _observation:abort()
    _observation = nil
  end
  if _island_se_stop ~= nil then
    _island_se_stop:abort()
    _island_se_stop = nil
  end
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
  task_all_abort()
  if Fn_getPlayer() then
    Player:applyPoisonDamage(0, 0.01)
  end
  if _poison_se ~= nil then
    Sound:stopSEHandle(_poison_se)
    _poison_se = nil
  end
  if _island_se_hdl ~= nil then
    Sound:stopSEHandle(_island_se_hdl)
    _island_se_hdl = nil
  end
end
