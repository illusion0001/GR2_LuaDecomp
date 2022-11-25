dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm30_common.lua")
SCENE5_BOX_FORCE_BREAK_RANGE = 2.5
SCENE5_GAME_TIME = 30
SCENE5_BOMBING_NUM = 8
_staff_bg_tbl = {}
_is_in_sensor = false
_is_out_of_range = false
_is_hited_by_bomb = false
_is_in_box_sensor = false
_always_bomb = false
_escape_bomb_start = false
_sdemo = nil
_pc_box_warp = false
_restart = false
_event_motion_table = {
  dead_00 = "kit01_dead_00",
  down_roll_00 = "kit01_down_roll_00",
  down_b_01 = "kit01_down_b_01",
  glad_in_01 = "kit01_glad_in_01",
  glad_01 = "kit01_glad_01"
}
enmgen2_scene5_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  dead_count = 0,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "scene4_enemy_01",
      variation = "man80_aa",
      hair = true
    },
    {
      type = "gorotuki04",
      locator = "locator_02",
      name = "scene4_enemy_02",
      variation = "man79_aa"
    },
    {
      type = "gorotuki05",
      locator = "locator_03",
      name = "scene4_enemy_03",
      variation = "man80_bb"
    },
    {
      type = "gorotuki04",
      locator = "locator_04",
      name = "scene4_enemy_04",
      variation = "man79_bb",
      hair = true
    },
    {
      type = "gorotuki05",
      locator = "locator_05",
      name = "scene4_enemy_05",
      variation = "man80_cc"
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
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().dead_count = A0_8:getSpecTable().dead_count + 1
  end
}
function Initialize()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16
  L0_10 = {
    L1_11,
    L2_12,
    L3_13
  }
  L1_11.name = "sm30_director_01"
  L1_11.type = "man18"
  L1_11.node = "locator2_director_01"
  L1_11.active = false
  L1_11.not_mob = true
  L2_12.name = "sm30_assistant_01"
  L2_12.type = "man17"
  L2_12.node = "locator2_assistant_01"
  L2_12.active = false
  L2_12.not_mob = true
  L3_13.name = "sm30_assi_wom_01"
  L3_13.type = "wom01"
  L3_13.node = "locator2_assi_wom_01"
  L3_13.active = false
  L1_11(L2_12)
  L1_11(L2_12)
  L1_11(L2_12)
  L1_11(L2_12)
  L1_11(L2_12)
  for L4_14 = 1, SCENE5_BOMBING_NUM do
    L5_15 = Fn_pcSensorOff
    L6_16 = "pcspheresensor2_scene5_bombing_"
    L6_16 = L6_16 .. string.format("%02d", L4_14)
    L5_15(L6_16)
  end
  for L5_15, L6_16 in L2_12(L3_13) do
    if findGameObject2("GimmickBg", L6_16) ~= nil then
      findGameObject2("GimmickBg", L6_16):setVisiblePermission(false)
      _staff_bg_tbl[L6_16] = findGameObject2("GimmickBg", L6_16)
    end
  end
  _sdemo = L2_12
  if L2_12 ~= nil then
    L3_13(L4_14)
    if L3_13 ~= nil then
      L5_15 = L3_13
      L6_16 = L2_12
      L4_14(L5_15, L6_16)
    end
  end
  L3_13(L4_14)
  L3_13(L4_14)
end
function Ingame()
  Fn_disableCostumeChange(true)
  Fn_userCtrlAllOff()
  while Player:getPuppet():isLoading() do
    wait()
  end
  Fn_loadPlayerMotion(_event_motion_table)
  while Player:getPuppet():isLoading() do
    wait()
  end
  scene5Main()
  Fn_resetPcPos(findGameObject2("Node", "warppoint2_epilogue_pc_01"))
  Fn_warpNpc("sm30_director_01", "warppoint2_epilogue_director_01")
  Fn_warpNpc("sm30_assistant_01", "warppoint2_epilogue_assistant_01")
  Fn_warpNpc("sm30_client", "warppoint2_epilogue_client_01")
  Fn_playMotionNpc("sm30_client", "idle_00", false)
  Fn_setNpcActive("sm30_assistant_01", true)
  Fn_setNpcActive("sm30_assi_wom_01", true)
  Fn_setNpcActive("sm30_director_01", true)
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  Fn_setNpcActive("sm30_director_01", true)
  Fn_setCatActive(true)
  Fn_fadein()
  Fn_kaiwaDemoView("sm30_01800k")
  Player:setStay(false)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
function scene5Main()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24
  L0_17 = false
  L1_18 = findGameObject2
  L2_19 = "Node"
  L3_20 = "locator2_scene5_navi_goal_01"
  L1_18 = L1_18(L2_19, L3_20)
  L2_19 = {}
  L3_20 = 1
  while true do
    L4_21 = findGameObject2
    L5_22 = "GimmickBg"
    L6_23 = "bg2_scene5_break_box_"
    L7_24 = string
    L7_24 = L7_24.format
    L7_24 = L7_24("%02d", L3_20)
    L6_23 = L6_23 .. L7_24
    L4_21 = L4_21(L5_22, L6_23)
    if L4_21 ~= nil then
      L6_23 = L4_21
      L5_22 = L4_21.setActive
      L7_24 = true
      L5_22(L6_23, L7_24)
      L5_22 = table
      L5_22 = L5_22.insert
      L6_23 = L2_19
      L7_24 = L4_21
      L5_22(L6_23, L7_24)
    else
      break
    end
    L3_20 = L3_20 + 1
  end
  L4_21 = Fn_setNpcActive
  L5_22 = "sm30_director_01"
  L6_23 = true
  L4_21(L5_22, L6_23)
  L4_21 = Fn_setNpcActive
  L5_22 = "sm30_assistant_01"
  L6_23 = true
  L4_21(L5_22, L6_23)
  L4_21 = Fn_setNpcActive
  L5_22 = "sm30_assi_wom_01"
  L6_23 = true
  L4_21(L5_22, L6_23)
  L4_21 = _staff_bg_tbl
  L4_21 = L4_21.bg2_scene5_parasol_01
  L5_22 = L4_21
  L4_21 = L4_21.setVisiblePermission
  L6_23 = true
  L4_21(L5_22, L6_23)
  L4_21 = _staff_bg_tbl
  L4_21 = L4_21.bg2_scene5_chair_01
  L5_22 = L4_21
  L4_21 = L4_21.setVisiblePermission
  L6_23 = true
  L4_21(L5_22, L6_23)
  L4_21 = Fn_playMotionNpc
  L5_22 = "sm30_director_01"
  L6_23 = "sit_00"
  L7_24 = false
  L4_21(L5_22, L6_23, L7_24)
  L4_21 = Fn_playMotionNpc
  L5_22 = "sm30_assistant_01"
  L6_23 = "talk_03"
  L7_24 = false
  L4_21(L5_22, L6_23, L7_24)
  L4_21 = Fn_playMotionNpc
  L5_22 = "sm30_assi_wom_01"
  L6_23 = "photo_03"
  L7_24 = false
  L4_21(L5_22, L6_23, L7_24)
  L4_21 = findGameObject2
  L5_22 = "EnemyGenerator"
  L6_23 = "enmgen2_scene5_01"
  L4_21 = L4_21(L5_22, L6_23)
  L6_23 = L4_21
  L5_22 = L4_21.requestIdlingEnemy
  L7_24 = true
  L5_22(L6_23, L7_24)
  L5_22 = Player
  L6_23 = L5_22
  L5_22 = L5_22.setEnergy
  L7_24 = Player
  L7_24 = L7_24.kEnergy_Life
  L5_22(L6_23, L7_24, Player:getEnergyMax(Player.kEnergy_Life))
  L5_22 = InitializeShipWork
  L6_23 = "ForSm32_39Ship"
  L7_24 = "sm30_staff_car_01"
  L5_22 = L5_22(L6_23, L7_24, "locator2_staff_car_01")
  L6_23 = Fn_missionStart
  L6_23()
  L6_23 = Fn_kaiwaDemoView
  L7_24 = "sm30_01500k"
  L6_23(L7_24)
  function L6_23()
    _restart = true
    Fn_userCtrlAllOff()
    Player:setStay(true)
    HUD:timerStop()
    HUD:timerSetVisible(false)
    PlaySeFailure()
    Fn_kaiwaDemoView("sm30_01700k")
    Fn_blackout()
    Fn_resetPcPos(findGameObject2("Node", "locator2_pc_start_pos"))
    L4_21:requestAllEnemyKill()
    L4_21:getSpecTable().dead_count = 0
    L4_21:requestSpawn()
    L4_21:requestIdlingEnemy(true)
    for _FORV_3_ = 1, #L2_19 do
      L2_19[_FORV_3_]:requestRestoreForce()
    end
    _FOR_:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Fn_fadein()
  end
  function L7_24()
    local L0_25, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35, L11_36, L12_37
    L0_25 = RAC_infoView
    L1_26 = "sm30_info_05"
    L0_25(L1_26)
    L0_25 = Fn_missionView
    L1_26 = "sm30_01000"
    L0_25(L1_26)
    L0_25 = _restart
    if L0_25 == false then
      L0_25 = Fn_setBgmPoint
      L1_26 = "event"
      L2_27 = "pristart"
      L0_25(L1_26, L2_27)
    end
    L0_25 = RAC_countDownVoice
    L1_26 = true
    L0_25(L1_26)
    L0_25 = _restart
    if L0_25 == false then
      L0_25 = Fn_setBgmPoint
      L1_26 = "event"
      L2_27 = "cut5_start"
      L0_25(L1_26, L2_27)
    else
      L0_25 = Fn_setBgmPoint
      L1_26 = "event"
      L2_27 = "cut5_restart"
      L0_25(L1_26, L2_27)
    end
    L0_25 = Fn_captionView
    L1_26 = "sm30_01002"
    L0_25(L1_26)
    L0_25 = HUD
    L1_26 = L0_25
    L0_25 = L0_25.timerSetSecond
    L2_27 = SCENE5_GAME_TIME
    L0_25(L1_26, L2_27)
    L0_25 = HUD
    L1_26 = L0_25
    L0_25 = L0_25.timerStart
    L0_25(L1_26)
    L0_25 = L4_21
    L1_26 = L0_25
    L0_25 = L0_25.requestIdlingEnemy
    L2_27 = false
    L0_25(L1_26, L2_27)
    L0_25 = Player
    L1_26 = L0_25
    L0_25 = L0_25.setStay
    L2_27 = false
    L0_25(L1_26, L2_27)
    L0_25 = Fn_userCtrlOn
    L0_25()
    L0_25 = Fn_userCtrlGravityOff
    L0_25()
    L0_25 = Fn_unLockPlayerAbility
    L1_26 = Player
    L1_26 = L1_26.kAbility_KickCombo
    L0_25(L1_26)
    _is_out_of_range = false
    _is_hited_by_bomb = false
    _escape_bomb_start = false
    _always_bomb = false
    L0_25 = Fn_pcSensorOn
    L1_26 = "pccubesensor2_scene5_out_01"
    L0_25(L1_26)
    L0_25 = false
    L1_26 = HUD
    L2_27 = L1_26
    L1_26 = L1_26.timerGetSecond
    L1_26 = L1_26(L2_27)
    L2_27 = L4_21
    L3_28 = L2_27
    L2_27 = L2_27.getSpecTable
    L2_27 = L2_27(L3_28)
    L3_28 = L2_27.spawnSet
    L3_28 = #L3_28
    L4_29 = -1
    L5_30 = invokeTask
    L5_30 = L5_30(L6_31)
    while true do
      if L3_28 <= L6_31 then
        L6_31()
        break
      end
      L4_29 = L2_27.dead_count
      if L6_31 == true then
        L6_31(L7_32)
        L6_31()
        if L5_30 ~= nil then
          if L6_31 then
            L6_31(L7_32)
            L5_30 = nil
          end
        end
        return L6_31
      elseif L6_31 == true then
        L6_31()
        if L5_30 ~= nil then
          if L6_31 then
            L6_31(L7_32)
            L5_30 = nil
          end
        end
        return L6_31
      end
      L6_31()
    end
    L6_31(L7_32)
    L6_31(L7_32)
    L6_31(L7_32, L8_33, L9_34)
    _always_bomb = true
    _is_in_sensor = false
    _is_out_of_range = false
    _is_hited_by_bomb = false
    L6_31(L7_32)
    L6_31(L7_32)
    L6_31(L7_32)
    L6_31(L7_32)
    while true do
      if L6_31 ~= false then
      end
      if L6_31 == L7_32 then
        L6_31()
        if L0_25 then
          L10_35 = 3
          L6_31(L7_32, L8_33, L9_34, L10_35)
        end
        if L6_31 == true then
          L6_31()
          L6_31(L7_32, L8_33)
          L6_31(L7_32)
          _pc_box_warp = false
          L0_25 = true
        end
        if L6_31 == true then
          if L6_31 == true then
            L0_17 = L6_31
            for L10_35, L11_36 in L7_32(L8_33) do
              L12_37 = L2_19[L10_35]
              L12_37 = L12_37.isBroken
              L12_37 = L12_37(L12_37)
              if L12_37 == false then
                L12_37 = L2_19[L10_35]
                L12_37 = L12_37.getWorldPos
                L12_37 = L12_37(L12_37)
                if Fn_getDistanceToPlayer(L12_37) < 1.5 then
                  L2_19[L10_35]:requestBreak(L6_31, 1)
                end
              end
            end
          end
        end
        if L6_31 == true then
          L6_31(L7_32)
          L6_31()
          if L5_30 ~= nil then
            if L6_31 then
              L6_31(L7_32)
              L5_30 = nil
            end
          end
          return L6_31
        end
      end
      if L6_31 ~= true then
      end
    end
    L6_31(L7_32)
    L6_31(L7_32, L8_33)
    if L5_30 ~= nil then
      if L6_31 then
        L6_31(L7_32)
        L5_30 = nil
      end
    end
    L6_31()
    L6_31(L7_32)
    for L9_34 = 1, SCENE5_BOMBING_NUM do
      L10_35 = Fn_pcSensorOff
      L11_36 = "pcspheresensor2_scene5_bombing_"
      L12_37 = string
      L12_37 = L12_37.format
      L12_37 = L12_37("%02d", L9_34)
      L11_36 = L11_36 .. L12_37
      L10_35(L11_36)
    end
    if L6_31 == true then
      L6_31(L7_32)
      _is_in_sensor = false
      L6_31(L7_32)
      L6_31()
      return L6_31
    end
    while L7_32 < 30 do
      L8_33()
      if L7_32 == 1 then
      end
      if L8_33 ~= true then
      end
    end
    L8_33(L9_34)
    _is_in_sensor = false
    L8_33(L9_34)
    if L8_33 == true or L6_31 == false then
      L8_33()
      return L8_33
    end
    _is_out_of_range = false
    return L8_33
  end
  while true do
    if L7_24() == false then
    end
  end
  Fn_userCtrlOff()
  Fn_setBgmPoint("event", "cut5_end")
  PcAppeal(_event_motion_table.glad_in_01, _event_motion_table.glad_01)
  Fn_kaiwaDemoView("sm30_01600k")
  Fn_blackout()
  for _FORV_11_ = 1, #L2_19 do
    L2_19[_FORV_11_]:setActive(false)
    L2_19[_FORV_11_] = nil
  end
  L2_19 = _FOR_
  Fn_setNpcActive("sm30_assi_wom_01", false)
  _staff_bg_tbl.bg2_scene5_parasol_01:setVisiblePermission(false)
  _staff_bg_tbl.bg2_scene5_chair_01:setVisiblePermission(false)
  ReleaseShipWork(L5_22)
end
function invokeBombingTask(A0_38)
  local L1_39
  L1_39 = {}
  L1_39.marker = nil
  L1_39.bomb_eff = nil
  L1_39.timer_task = nil
  L1_39.sensor_name = nil
  function L1_39.update(A0_40)
    local L1_41
    L1_41 = findGameObject2
    L1_41 = L1_41("Node", "locator2_bomb_" .. string.format("%02d", A0_38))
    A0_40.bomb_eff = createEffect("bomb_eff_" .. string.format("%02d", A0_38), "ef_com_exp_01", L1_41)
    A0_40.sensor_name = "pcspheresensor2_scene5_bombing_" .. string.format("%02d", A0_38)
    Fn_pcSensorOn(A0_40.sensor_name)
    waitSeconds(1)
    Fn_pcSensorOff(A0_40.sensor_name)
    A0_40.sensor_name = nil
    A0_40.timer_task = invokeTask(function()
      waitSeconds(10)
    end)
    while A0_40.bomb_eff:isPlaying() and A0_40.timer_task:isRunning() do
      wait()
    end
    A0_40.bomb_eff:try_term()
    A0_40.bomb_eff = nil
    A0_40.timer_task:abort()
    A0_40.timer_task = nil
  end
  function L1_39.destractor(A0_42)
    if A0_42.bomb_eff ~= nil then
      A0_42.bomb_eff:try_term()
      A0_42.bomb_eff = nil
    end
    if A0_42.timer_task ~= nil then
      A0_42.timer_task:abort()
      A0_42.timer_task = nil
    end
    if A0_42.sensor_name ~= nil then
      Fn_pcSensorOff(A0_42.sensor_name)
      A0_42.sensor_name = nil
    end
  end
  return RAC_InvokeTaskWithDestractor(L1_39.update, L1_39.destractor, L1_39)
end
function isAnyBroken(A0_43)
  local L1_44, L2_45, L3_46, L4_47
  L1_44 = #A0_43
  if L1_44 == 0 then
    return L2_45
  end
  for _FORV_5_ = 1, L1_44 do
    if A0_43[_FORV_5_]:isBroken() == true then
      return true
    end
  end
  return L2_45
end
function createEffect(A0_48, A1_49, A2_50)
  local L3_51
  L3_51 = A2_50.getWorldPos
  L3_51 = L3_51(A2_50)
  createGameObject2("Effect"):setName(A0_48)
  createGameObject2("Effect"):setModelName(A1_49)
  createGameObject2("Effect"):setPos(L3_51)
  createGameObject2("Effect"):play()
  start_game_obj()
  return (createGameObject2("Effect"))
end
function playerRequestDamage()
  Fn_userCtrlOff()
  invokeTask(function()
    Fn_playPlayerMotionWait(_event_motion_table.down_roll_00)
  end)
end
function pccubesensor2_scene5_goal_01_OnEnter()
  local L0_52, L1_53
  _is_in_sensor = true
end
function pccubesensor2_scene5_goal_01_OnLeave()
  local L0_54, L1_55
  _is_in_sensor = false
end
function pccubesensor2_scene5_out_01_OnEnter()
  local L1_56
  L1_56 = _always_bomb
  if L1_56 == false then
    _is_out_of_range = false
  end
end
function pccubesensor2_scene5_out_01_OnLeave()
  if _always_bomb == false then
    _is_out_of_range = true
  else
    _escape_bomb_start = true
    HUD:timerSetVisible(false)
  end
end
function pccubesensor2_scene5_out_02_OnEnter()
  local L0_57, L1_58
  _is_out_of_range = false
end
function pccubesensor2_scene5_out_02_OnLeave()
  local L0_59, L1_60
  _is_out_of_range = true
end
function pcspheresensor2_scene5_bombing_01_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_01_OnLeave()
  local L0_61, L1_62
end
function pcspheresensor2_scene5_bombing_02_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_02_OnLeave()
  local L0_63, L1_64
end
function pcspheresensor2_scene5_bombing_03_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_03_OnLeave()
  local L0_65, L1_66
end
function pcspheresensor2_scene5_bombing_04_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_04_OnLeave()
  local L0_67, L1_68
end
function pcspheresensor2_scene5_bombing_05_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_05_OnLeave()
  local L0_69, L1_70
end
function pcspheresensor2_scene5_bombing_06_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_06_OnLeave()
  local L0_71, L1_72
end
function pcspheresensor2_scene5_bombing_07_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_07_OnLeave()
  local L0_73, L1_74
end
function pcspheresensor2_scene5_bombing_08_OnEnter()
  playerRequestDamage()
  _is_hited_by_bomb = true
end
function pcspheresensor2_scene5_bombing_08_OnLeave()
  local L0_75, L1_76
end
function pccubesensor2_box_break_sensor_OnEnter()
  local L0_77, L1_78
  _is_in_box_sensor = true
end
function pccubesensor2_box_break_sensor_OnLeave()
  local L0_79, L1_80
  _is_in_box_sensor = false
end
function pccubesensormulti2_outrange_01_OnEnter()
  local L0_81, L1_82
  _is_out_of_range = true
end
function pccubesensormulti2_outrange_01_OnLeave()
  local L0_83, L1_84
  _is_out_of_range = false
end
function pccubesensor2_bombwarp_01_OnEnter()
  local L0_85, L1_86
  _pc_box_warp = true
end
function pccubesensor2_bombwarp_01_OnLeave()
  local L0_87, L1_88
  _pc_box_warp = false
end
function cubesensor2_enm_kill_OnEnter(A0_89, A1_90)
  if A1_90:getBrain():getHealth() > 0 then
    findGameObject2("EnemyGenerator", "enmgen2_scene5_01"):getSpecTable().dead_count = findGameObject2("EnemyGenerator", "enmgen2_scene5_01"):getSpecTable().dead_count + 1
    findGameObject2("EnemyGenerator", "enmgen2_scene5_01"):requestEnemyKill(A1_90:getBrain())
  end
end
