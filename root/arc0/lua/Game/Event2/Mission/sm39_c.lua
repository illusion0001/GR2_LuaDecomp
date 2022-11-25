dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Event2/Mission/sm39_common.lua")
import("Vehicle")
SCENE3_POISON_DAMAGE_RATE = 0.025
_player_motion_table = {
  dead_00 = "kit01_dead_00",
  glad_in_01 = "kit01_glad_in_01",
  glad_01 = "kit01_glad_01"
}
_extra_woman_motion_table = {
  scared_nevy_00 = "wom01_scared_nevy_00",
  groggy_01 = "wom01_groggy_01"
}
_extra_man_motion_table = {
  scared_00 = "man01_scared_00"
}
_staff_bg_tbl = {}
_is_in_sensor = false
_is_out_of_range = false
_sdemo = nil
_scene2_create_poison_task = {}
_scene2_poison_damage_task = nil
_scene2_poison_dmg_task_ref_count = 0
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6
  }
  L1_1 = {}
  L1_1.name = "sm39_director_01"
  L1_1.type = "man18"
  L1_1.node = "locator2_director_01"
  L1_1.active = false
  L2_2.name = "sm39_assistant_01"
  L2_2.type = "man17"
  L2_2.node = "locator2_assistant_01"
  L2_2.active = false
  L3_3.name = "sm39_assi_wom_01"
  L3_3.type = "wom01"
  L3_3.node = "locator2_assi_wom_01"
  L3_3.active = false
  L4_4.name = "sm39_extra_01"
  L4_4.type = "man10"
  L4_4.node = "locator2_extra_01"
  L4_4.active = true
  L5_5 = {}
  L5_5.name = "sm39_extra_02"
  L5_5.type = "wom03"
  L5_5.node = "locator2_extra_02"
  L5_5.active = true
  L6_6 = {}
  L6_6.name = "sm39_extra_03"
  L6_6.type = "wom04"
  L6_6.node = "locator2_extra_03"
  L6_6.active = true
  L1_1 = Fn_setupNpc
  L1_1(L2_2)
  L1_1 = Fn_loadNpcEventMotion
  L1_1(L2_2, L3_3)
  L1_1 = Fn_loadNpcEventMotion
  L1_1(L2_2, L3_3)
  L1_1 = Fn_loadNpcEventMotion
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L1_1(L2_2)
  L1_1 = {L2_2, L3_3}
  for L5_5, L6_6 in L2_2(L3_3) do
    if findGameObject2("GimmickBg", L6_6) ~= nil then
      findGameObject2("GimmickBg", L6_6):setVisiblePermission(false)
      _staff_bg_tbl[L6_6] = findGameObject2("GimmickBg", L6_6)
    end
  end
  _sdemo = L2_2
  L2_2(L3_3)
  L2_2(L3_3)
  L2_2(L3_3, L4_4)
  L5_5 = Player
  L6_6 = L5_5
  L5_5 = L5_5.getEnergyMax
  L6_6 = L5_5(L6_6, Player.kEnergy_Life)
  L2_2(L3_3, L4_4, L5_5, L6_6, L5_5(L6_6, Player.kEnergy_Life))
end
function Ingame()
  Fn_userCtrlOff()
  Fn_disableCostumeChange(true)
  while Player:getPuppet():isLoading() do
    wait()
  end
  Fn_loadPlayerMotion(_player_motion_table)
  while Player:getPuppet():isLoading() do
    wait()
  end
  Fn_playMotionNpc("sm39_extra_01", _extra_man_motion_table.scared_00, false, {isRepeat = true})
  Fn_playMotionNpc("sm39_extra_02", _extra_woman_motion_table.scared_nevy_00, false, {isRepeat = true})
  Fn_playMotionNpc("sm39_extra_03", _extra_woman_motion_table.groggy_01, false, {isRepeat = true})
  scene2Main()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
function scene2Main()
  local L0_7, L1_8, L2_9, L3_10, L4_11
  L0_7 = Fn_setNpcActive
  L1_8 = "sm39_director_01"
  L2_9 = true
  L0_7(L1_8, L2_9)
  L0_7 = Fn_setNpcActive
  L1_8 = "sm39_assistant_01"
  L2_9 = true
  L0_7(L1_8, L2_9)
  L0_7 = Fn_setNpcActive
  L1_8 = "sm39_assi_wom_01"
  L2_9 = true
  L0_7(L1_8, L2_9)
  L0_7 = _staff_bg_tbl
  L0_7 = L0_7.bg2_scene2_parasol_01
  L1_8 = L0_7
  L0_7 = L0_7.setVisiblePermission
  L2_9 = true
  L0_7(L1_8, L2_9)
  L0_7 = _staff_bg_tbl
  L0_7 = L0_7.bg2_scene2_chair_01
  L1_8 = L0_7
  L0_7 = L0_7.setVisiblePermission
  L2_9 = true
  L0_7(L1_8, L2_9)
  L0_7 = Fn_playMotionNpc
  L1_8 = "sm39_director_01"
  L2_9 = "sit_00"
  L3_10 = false
  L0_7(L1_8, L2_9, L3_10)
  L0_7 = Fn_playMotionNpc
  L1_8 = "sm39_assistant_01"
  L2_9 = "talk_03"
  L3_10 = false
  L0_7(L1_8, L2_9, L3_10)
  L0_7 = Fn_playMotionNpc
  L1_8 = "sm39_assi_wom_01"
  L2_9 = "photo_03"
  L3_10 = false
  L0_7(L1_8, L2_9, L3_10)
  L0_7 = InitializeShipWork
  L1_8 = "ForSm32_39Ship"
  L2_9 = "staffShip"
  L3_10 = "locator2_staff_car_01"
  L0_7 = L0_7(L1_8, L2_9, L3_10)
  L1_8 = Player
  L2_9 = L1_8
  L1_8 = L1_8.setEnergy
  L3_10 = Player
  L3_10 = L3_10.kEnergy_Life
  L4_11 = Player
  L4_11 = L4_11.getEnergyMax
  L4_11 = L4_11(L4_11, Player.kEnergy_Life)
  L1_8(L2_9, L3_10, L4_11, L4_11(L4_11, Player.kEnergy_Life))
  L1_8 = initPoisonFog
  L1_8()
  L1_8 = Fn_missionStart
  L1_8()
  L1_8 = Fn_kaiwaDemoView
  L2_9 = "sm39_00600k"
  L1_8(L2_9)
  L1_8 = 1
  L2_9 = {
    L3_10,
    L4_11,
    {
      navi_name = "locator2_navi_scene2_03",
      sensor_name = "pccubesensor2_scene2_03"
    },
    {
      navi_name = "locator2_navi_scene2_04",
      sensor_name = "pccubesensor2_scene2_04"
    },
    {
      navi_name = "locator2_navi_scene2_05",
      sensor_name = "pccubesensor2_scene2_05"
    },
    {
      navi_name = "locator2_navi_scene2_06",
      sensor_name = "pccubesensor2_scene2_06"
    },
    {
      navi_name = "locator2_navi_scene2_07",
      sensor_name = "pccubesensor2_scene2_07"
    },
    {
      navi_name = "locator2_navi_scene2_08",
      sensor_name = "pccubesensor2_scene2_08"
    },
    {
      navi_name = "locator2_navi_scene2_09",
      sensor_name = "pccubesensor2_scene2_09"
    },
    {
      navi_name = "locator2_navi_scene2_10",
      sensor_name = "pccubesensor2_scene2_10"
    },
    {
      navi_name = "locator2_navi_scene2_11",
      sensor_name = "pccubesensor2_scene2_11"
    },
    {
      navi_name = "locator2_navi_scene2_12",
      sensor_name = "pccubesensor2_scene2_12"
    },
    {
      navi_name = "locator2_navi_scene2_13",
      sensor_name = "pccubesensor2_scene2_13"
    },
    {
      navi_name = "locator2_navi_scene2_14",
      sensor_name = "pccubesensor2_scene2_14"
    },
    {
      navi_name = "locator2_navi_scene2_15",
      sensor_name = "pccubesensor2_scene2_15"
    },
    {
      navi_name = "locator2_navi_scene2_16",
      sensor_name = "pccubesensor2_scene2_16"
    }
  }
  L3_10 = {}
  L3_10.navi_name = "locator2_navi_scene2_01"
  L3_10.sensor_name = "pccubesensor2_scene2_01"
  L4_11 = {}
  L4_11.navi_name = "locator2_navi_scene2_02"
  L4_11.sensor_name = "pccubesensor2_scene2_02"
  function L3_10()
    Player:setStay(true)
    deletePoisonFog(true)
    PlaySeFailure()
    Fn_kaiwaDemoView("sm39_00800k")
    Fn_blackout()
    deletePoisonFog()
    if L1_8 == 1 then
      Fn_resetPcPos("locator2_pc_start_pos")
    else
      Fn_resetPcPos("locator2_pc_halfway_pos")
    end
    initPoisonFog()
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
    Fn_fadein()
  end
  function L4_11()
    local L0_12
    L0_12 = RAC_infoView
    L0_12("sm39_info_02")
    L0_12 = Fn_missionView
    L0_12("sm39_02000")
    L0_12 = RAC_countDownVoice
    L0_12()
    L0_12 = L1_8
    if L0_12 == 1 then
      L0_12 = Fn_captionView
      L0_12("sm39_02003")
    else
      L0_12 = Fn_captionView
      L0_12("sm39_02004")
    end
    L0_12 = HUD
    L0_12 = L0_12.hpgDispReq_FadeIn
    L0_12(L0_12)
    L0_12 = HUD
    L0_12 = L0_12.setGaugeFourceVisible
    L0_12(L0_12, true)
    L0_12 = Player
    L0_12 = L0_12.setStay
    L0_12(L0_12, false)
    L0_12 = Fn_userCtrlOn
    L0_12()
    _is_out_of_range = false
    L0_12 = Fn_pcSensorOn
    L0_12("pccubesensormulti2_scene2_out_01")
    L0_12 = L2_9
    L0_12 = #L0_12
    for _FORV_4_ = L1_8, L0_12 do
      if _FORV_4_ >= 8 then
        L1_8 = 8
      end
      Fn_naviSet(findGameObject2("Node", L2_9[_FORV_4_].navi_name))
      _is_in_sensor = false
      Fn_pcSensorOn(L2_9[_FORV_4_].sensor_name)
      while 0 < 5 and _is_out_of_range == false do
        if _FORV_4_ == L0_12 then
          if _is_in_sensor == true and (Player:getAction() ~= Player.kAction_Idle or Player:getAction() ~= Player.kAction_Run) then
          else
          end
        else
        end
        if _is_in_sensor ~= true then
          wait()
        end
      end
      Fn_pcSensorOff(L2_9[_FORV_4_].sensor_name)
      _is_in_sensor = false
      if _is_out_of_range ~= true then
        if _FORV_4_ ~= L0_12 then
          RAC_NaviKill(false)
        end
      end
    end
    _FOR_()
    Fn_setBgmPoint("event", "battle_end")
    Fn_pcSensorOff("pccubesensormulti2_scene2_out_01")
    if _is_out_of_range == true then
      L3_10()
      return false
    end
    _is_out_of_range = false
    return true
  end
  while true do
    if L4_11() == false then
    end
  end
  Fn_userCtrlOff()
  PcAppeal(_player_motion_table.glad_in_01, _player_motion_table.glad_01)
  Fn_kaiwaDemoView("sm39_00700k")
  Fn_blackout()
  deletePoisonFog()
  _staff_bg_tbl.bg2_scene2_parasol_01:setVisiblePermission(false)
  _staff_bg_tbl.bg2_scene2_chair_01:setVisiblePermission(false)
  ReleaseShipWork(L0_7)
end
function invokeCreatePoisonFogTask(A0_13, A1_14)
  local L2_15, L3_16
  function L2_15(A0_17, A1_18, A2_19)
    local L3_20
    L3_20 = {}
    L3_20.start_effect_hdl = nil
    L3_20.timer_task = nil
    L3_20.loop_effect_hdl = nil
    L3_20.main_task = invokeTask(function()
      local L0_21
      L0_21 = L3_20
      L0_21.start_effect_hdl = createGameObject2("Effect")
      L0_21.start_effect_hdl:setName(string.format("sm39_scene2_eff_poison_%02d_%02d", A1_18, A2_19))
      L0_21.start_effect_hdl:setModelName("ef_ev_piz_02st")
      L0_21.start_effect_hdl:setWorldTransform(A0_17:getWorldTransform())
      L0_21.start_effect_hdl:play()
      L0_21.loop_effect_hdl = createGameObject2("Effect")
      L0_21.loop_effect_hdl:setName(string.format("sm39_scene2_eff_poison_%02d_%02d", A1_18, A2_19))
      L0_21.loop_effect_hdl:setModelName("ef_ev_piz_02")
      L0_21.loop_effect_hdl:setWorldTransform(A0_17:getWorldTransform())
      L0_21.loop_effect_hdl:play()
      start_game_obj()
      L0_21.timer_task = invokeTask(waitSeconds, 3)
      while L0_21.start_effect_hdl:isPlaying() and L0_21.timer_task:isRunning() do
        wait()
      end
      L0_21.start_effect_hdl:try_term()
      L0_21.start_effect_hdl = nil
      L0_21.timer_task:abort()
      L0_21.timer_task = nil
      while true do
        wait()
      end
    end)
    function L3_20.abort(A0_22)
      if A0_22.start_effect_hdl ~= nil then
        A0_22.start_effect_hdl:try_term()
        A0_22.start_effect_hdl = nil
      end
      if A0_22.timer_task ~= nil then
        A0_22.timer_task:abort()
        A0_22.timer_task = nil
      end
      if A0_22.loop_effect_hdl ~= nil then
        A0_22.loop_effect_hdl:try_term()
        A0_22.loop_effect_hdl = nil
      end
      if A0_22.main_task ~= nil then
        A0_22.main_task:abort()
        A0_22.main_task = nil
      end
    end
    return L3_20
  end
  L3_16 = {}
  L3_16.marker = nil
  L3_16.sensor_enable = false
  L3_16.effect_task_tbl = {}
  L3_16.main_task = invokeTask(function()
    local L0_23, L1_24, L2_25
    L0_23 = L3_16
    L1_24 = A1_14
    if L1_24 ~= nil then
      L1_24 = 1
      L2_25 = findGameObject2
      L2_25 = L2_25("Node", A1_14)
      L2_25 = L2_25.getWorldPos
      L2_25 = L2_25(L2_25)
      L2_25.y = L2_25.y + 0.2
      L0_23.maker_eff_task = RAC_createEffect({
        eff_name = "ef_ev_lgt_01m",
        world_pos = L2_25,
        time = L1_24
      })
      waitSeconds(L1_24)
    end
    L1_24 = 1
    while true do
      L2_25 = findGameObject2
      L2_25 = L2_25("Node", string.format("locator2_scene2_poison_%02d_%02d", A0_13, L1_24))
      if L2_25 ~= nil then
        table.insert(L0_23.effect_task_tbl, L2_15(L2_25, A0_13, L1_24))
      else
        break
      end
      L1_24 = L1_24 + 1
    end
    L1_24 = 1
    while true do
      L2_25 = findGameObject2
      L2_25 = L2_25("PlayerSensor", string.format("pccubesensor2_scene2_poison_hit_%02d_%02d", A0_13, L1_24))
      if L2_25 ~= nil then
        Fn_pcSensorOn(L2_25)
      else
        break
      end
      L1_24 = L1_24 + 1
    end
    L0_23.sensor_enable = true
    while true do
      L2_25 = wait
      L2_25()
    end
  end)
  function L3_16.deactiveSensor(A0_26)
    local L1_27, L2_28
    L1_27 = A0_26.sensor_enable
    if L1_27 == true then
      L1_27 = 1
      while true do
        L2_28 = findGameObject2
        L2_28 = L2_28("PlayerSensor", string.format("pccubesensor2_scene2_poison_hit_%02d_%02d", A0_13, L1_27))
        if L2_28 ~= nil then
          Fn_pcSensorOff(L2_28)
        else
          break
        end
        L1_27 = L1_27 + 1
      end
      A0_26.sensor_enable = false
    end
  end
  function L3_16.abort(A0_29)
    if A0_29.marker ~= nil then
      A0_29.marker:try_term()
      A0_29.marker = nil
    end
    for _FORV_4_, _FORV_5_ in ipairs(A0_29.effect_task_tbl) do
      A0_29.effect_task_tbl[_FORV_4_]:abort()
      A0_29.effect_task_tbl[_FORV_4_] = nil
    end
    A0_29.effect_task_tbl = {}
    A0_29:deactiveSensor()
    if A0_29.main_task ~= nil then
      A0_29.main_task:abort()
      A0_29.main_task = nil
    end
  end
  table.insert(_scene2_create_poison_task, L3_16)
  return _scene2_create_poison_task[table.maxn(_scene2_create_poison_task)]
end
function initPoisonFog()
  local L0_30, L1_31
  L0_30 = invokeCreatePoisonFogTask
  L1_31 = 1
  L0_30(L1_31)
  L0_30 = 2
  while true do
    L1_31 = findGameObject2
    L1_31 = L1_31("PlayerSensor", string.format("pccubesensor2_scene2_poison_start_%02d", L0_30))
    if L1_31 ~= nil then
      Fn_pcSensorOn(L1_31)
    else
      break
    end
    L0_30 = L0_30 + 1
  end
end
function deletePoisonFog(A0_32)
  local L1_33, L2_34
  if A0_32 == true then
    for _FORV_4_, _FORV_5_ in L1_33(L2_34) do
      _scene2_create_poison_task[_FORV_4_]:deactiveSensor()
    end
  else
    for _FORV_4_, _FORV_5_ in L1_33(L2_34) do
      _scene2_create_poison_task[_FORV_4_]:abort()
      _scene2_create_poison_task[_FORV_4_] = nil
    end
    _scene2_create_poison_task = L1_33
  end
  while true do
    if L2_34 ~= nil then
      Fn_pcSensorOff(L2_34)
    else
      break
    end
  end
  L2_34(true)
end
function createMarker(A0_35, A1_36, A2_37, A3_38)
  local L4_39
  L4_39 = A2_37.getWorldPos
  L4_39 = L4_39(A2_37)
  createGameObject2("MapMarker"):setName(A0_35)
  createGameObject2("MapMarker"):setAssetName(A1_36)
  createGameObject2("MapMarker"):setupPattern("C", A3_38)
  createGameObject2("MapMarker"):setPos(L4_39)
  start_game_obj()
  return (createGameObject2("MapMarker"))
end
function invokePoisonDamageTask()
  local L0_40
  L0_40 = _scene2_poison_dmg_task_ref_count
  if L0_40 <= 0 then
    L0_40 = {}
    if _scene2_poison_damage_task == nil then
      L0_40.caption_task = nil
      L0_40.main_task = invokeTask(function()
        local L0_41
        L0_41 = HUD
        L0_41 = L0_41.setGaugeFourceVisible
        L0_41(L0_41, true)
        L0_41 = Player
        L0_41 = L0_41.getEnergyMax
        L0_41 = L0_41(L0_41, Player.kEnergy_Life)
        L0_41 = L0_41 * SCENE3_POISON_DAMAGE_RATE
        Player:applyPoisonDamage(L0_41, 999)
        while Player:getEnergy(Player.kEnergy_Life) > 1 do
          if L0_40.caption_task == nil then
            L0_40.caption_task = invokeTask(function()
              waitSeconds(2)
              Fn_captionView("sm39_02015")
            end)
          end
          wait()
        end
        RAC_setBulletShockwave(Fn_getPlayerWorldPos(), 1, 3, nil, "environmental", 0)
      end)
      function L0_40.abort(A0_42)
        HUD:setGaugeFourceVisible(false)
        if A0_42.caption_task ~= nil then
          A0_42.caption_task:abort()
          A0_42.caption_task = nil
        end
        if A0_42.main_task ~= nil then
          A0_42.main_task:abort()
          A0_42.main_task = nil
        end
      end
      _scene2_poison_damage_task = L0_40
    end
    _scene2_poison_dmg_task_ref_count = 1
    break
  else
    L0_40 = _scene2_poison_dmg_task_ref_count
    L0_40 = L0_40 + 1
    _scene2_poison_dmg_task_ref_count = L0_40
  end
end
function abortPoisonDamageTask(A0_43)
  if A0_43 == true then
    Player:applyPoisonDamage(0, 0.01)
    if _scene2_poison_damage_task ~= nil then
      _scene2_poison_damage_task:abort()
      _scene2_poison_damage_task = nil
    end
    _scene2_poison_dmg_task_ref_count = 0
  elseif 0 < _scene2_poison_dmg_task_ref_count then
    _scene2_poison_dmg_task_ref_count = _scene2_poison_dmg_task_ref_count - 1
    if 0 >= _scene2_poison_dmg_task_ref_count then
      if _scene2_poison_damage_task ~= nil then
        Player:applyPoisonDamage(0, 0.01)
        _scene2_poison_damage_task:abort()
        _scene2_poison_damage_task = nil
      end
      _scene2_poison_dmg_task_ref_count = 0
    end
  end
end
function pccubesensor2_scene2_01_OnEnter()
  local L0_44, L1_45
  _is_in_sensor = true
end
function pccubesensor2_scene2_01_OnLeave()
  local L0_46, L1_47
  _is_in_sensor = false
end
function pccubesensor2_scene2_02_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm39_02005")
end
function pccubesensor2_scene2_02_OnLeave()
  local L0_48, L1_49
  _is_in_sensor = false
end
function pccubesensor2_scene2_03_OnEnter()
  local L0_50, L1_51
  _is_in_sensor = true
end
function pccubesensor2_scene2_03_OnLeave()
  local L0_52, L1_53
  _is_in_sensor = false
end
function pccubesensor2_scene2_04_OnEnter()
  local L0_54, L1_55
  _is_in_sensor = true
end
function pccubesensor2_scene2_04_OnLeave()
  local L0_56, L1_57
  _is_in_sensor = false
end
function pccubesensor2_scene2_05_OnEnter()
  local L0_58, L1_59
  _is_in_sensor = true
end
function pccubesensor2_scene2_05_OnLeave()
  local L0_60, L1_61
  _is_in_sensor = false
end
function pccubesensor2_scene2_06_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm39_02006")
end
function pccubesensor2_scene2_06_OnLeave()
  local L0_62, L1_63
  _is_in_sensor = false
end
function pccubesensor2_scene2_07_OnEnter()
  local L0_64, L1_65
  _is_in_sensor = true
end
function pccubesensor2_scene2_07_OnLeave()
  local L0_66, L1_67
  _is_in_sensor = false
end
function pccubesensor2_scene2_08_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm39_02007")
end
function pccubesensor2_scene2_08_OnLeave()
  local L0_68, L1_69
  _is_in_sensor = false
end
function pccubesensor2_scene2_09_OnEnter()
  local L0_70, L1_71
  _is_in_sensor = true
end
function pccubesensor2_scene2_09_OnLeave()
  local L0_72, L1_73
  _is_in_sensor = false
end
function pccubesensor2_scene2_10_OnEnter()
  local L0_74, L1_75
  _is_in_sensor = true
end
function pccubesensor2_scene2_10_OnLeave()
  local L0_76, L1_77
  _is_in_sensor = false
end
function pccubesensor2_scene2_11_OnEnter()
  local L0_78, L1_79
  _is_in_sensor = true
end
function pccubesensor2_scene2_11_OnLeave()
  local L0_80, L1_81
  _is_in_sensor = false
end
function pccubesensor2_scene2_12_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm39_02008")
end
function pccubesensor2_scene2_12_OnLeave()
  local L0_82, L1_83
  _is_in_sensor = false
end
function pccubesensor2_scene2_13_OnEnter()
  local L0_84, L1_85
  _is_in_sensor = true
end
function pccubesensor2_scene2_13_OnLeave()
  local L0_86, L1_87
  _is_in_sensor = false
end
function pccubesensor2_scene2_14_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm39_02009")
end
function pccubesensor2_scene2_14_OnLeave()
  local L0_88, L1_89
  _is_in_sensor = false
end
function pccubesensor2_scene2_15_OnEnter()
  local L0_90, L1_91
  _is_in_sensor = true
end
function pccubesensor2_scene2_15_OnLeave()
  local L0_92, L1_93
  _is_in_sensor = false
end
function pccubesensor2_scene2_16_OnEnter()
  local L0_94, L1_95
  _is_in_sensor = true
end
function pccubesensor2_scene2_16_OnLeave()
  local L0_96, L1_97
  _is_in_sensor = false
end
function pccubesensor2_scene2_poison_start_02_OnEnter(A0_98)
  Fn_pcSensorOff(A0_98:getName())
  invokeCreatePoisonFogTask(2, "locator2_scene2_poison_marker_02")
end
function pccubesensor2_scene2_poison_start_02_OnLeave()
  local L0_99, L1_100
end
function pccubesensor2_scene2_poison_start_03_OnEnter(A0_101)
  Fn_pcSensorOff(A0_101:getName())
  invokeCreatePoisonFogTask(3, "locator2_scene2_poison_marker_03")
end
function pccubesensor2_scene2_poison_start_03_OnLeave()
  local L0_102, L1_103
end
function pccubesensor2_scene2_poison_start_04_OnEnter(A0_104)
  Fn_pcSensorOff(A0_104:getName())
  invokeCreatePoisonFogTask(4, "locator2_scene2_poison_marker_04")
end
function pccubesensor2_scene2_poison_start_04_OnLeave()
  local L0_105, L1_106
end
function pccubesensor2_scene2_poison_start_05_OnEnter(A0_107)
  Fn_pcSensorOff(A0_107:getName())
  invokeCreatePoisonFogTask(5, "locator2_scene2_poison_marker_05")
end
function pccubesensor2_scene2_poison_start_05_OnLeave()
  local L0_108, L1_109
end
function pccubesensor2_scene2_poison_start_06_OnEnter(A0_110)
  Fn_pcSensorOff(A0_110:getName())
  invokeCreatePoisonFogTask(6, "locator2_scene2_poison_marker_06")
end
function pccubesensor2_scene2_poison_start_06_OnLeave()
  local L0_111, L1_112
end
function pccubesensor2_scene2_poison_start_07_OnEnter(A0_113)
  Fn_pcSensorOff(A0_113:getName())
  invokeCreatePoisonFogTask(7, "locator2_scene2_poison_marker_07")
end
function pccubesensor2_scene2_poison_start_07_OnLeave()
  local L0_114, L1_115
end
function pccubesensor2_scene2_poison_start_08_OnEnter(A0_116)
  Fn_pcSensorOff(A0_116:getName())
  invokeCreatePoisonFogTask(8, "locator2_scene2_poison_marker_08")
end
function pccubesensor2_scene2_poison_start_08_OnLeave()
  local L0_117, L1_118
end
function pccubesensor2_scene2_poison_start_09_OnEnter(A0_119)
  Fn_pcSensorOff(A0_119:getName())
  invokeCreatePoisonFogTask(9, "locator2_scene2_poison_marker_09")
end
function pccubesensor2_scene2_poison_start_09_OnLeave()
  local L0_120, L1_121
end
function pccubesensor2_scene2_poison_start_10_OnEnter(A0_122)
  Fn_pcSensorOff(A0_122:getName())
  invokeCreatePoisonFogTask(10, "locator2_scene2_poison_marker_10")
end
function pccubesensor2_scene2_poison_start_10_OnLeave()
  local L0_123, L1_124
end
function pccubesensor2_scene2_poison_start_11_OnEnter(A0_125)
  Fn_pcSensorOff(A0_125:getName())
  invokeCreatePoisonFogTask(11, "locator2_scene2_poison_marker_11")
end
function pccubesensor2_scene2_poison_start_11_OnLeave()
  local L0_126, L1_127
end
function pccubesensor2_scene2_poison_start_12_OnEnter(A0_128)
  Fn_pcSensorOff(A0_128:getName())
  invokeCreatePoisonFogTask(12, "locator2_scene2_poison_marker_12")
end
function pccubesensor2_scene2_poison_start_12_OnLeave()
  local L0_129, L1_130
end
function pccubesensor2_scene2_poison_start_13_OnEnter(A0_131)
  Fn_pcSensorOff(A0_131:getName())
  invokeCreatePoisonFogTask(13, "locator2_scene2_poison_marker_13")
end
function pccubesensor2_scene2_poison_start_13_OnLeave()
  local L0_132, L1_133
end
function pccubesensor2_scene2_poison_start_14_OnEnter(A0_134)
  Fn_pcSensorOff(A0_134:getName())
  invokeCreatePoisonFogTask(14, "locator2_scene2_poison_marker_14")
end
function pccubesensor2_scene2_poison_start_14_OnLeave()
  local L0_135, L1_136
end
function pccubesensor2_scene2_poison_hit_01_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_02_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_02_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_03_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_03_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_04_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_04_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_05_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_05_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_06_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_06_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_07_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_07_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_08_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_08_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_09_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_09_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_10_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_10_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_11_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_11_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_12_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_12_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_13_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_13_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_14_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_14_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_15_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_15_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_16_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_01_16_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_02_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_02_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_03_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_03_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_04_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_04_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_05_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_05_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_06_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_06_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_07_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_07_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_08_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_08_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_09_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_09_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_10_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_10_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_11_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_11_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_12_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_12_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_13_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_13_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_14_01_OnEnter()
  invokePoisonDamageTask()
end
function pccubesensor2_scene2_poison_hit_14_01_OnLeave()
  abortPoisonDamageTask()
end
function pccubesensormulti2_scene2_out_01_OnEnter()
  local L0_137, L1_138
  _is_out_of_range = false
end
function pccubesensormulti2_scene2_out_01_OnLeave()
  local L0_139, L1_140
  _is_out_of_range = true
end
