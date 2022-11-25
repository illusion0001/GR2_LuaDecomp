dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm30_common.lua")
_staff_bg_tbl = {}
_is_in_sensor = false
_is_out_of_jump_sensor_01 = false
_is_out_of_jump_sensor_02 = false
_is_out_of_jump_sensor_03 = false
_is_out_of_range = false
_staff_car_move_task = nil
_staffShipWork = {}
enmgen2_scene4_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki04",
      locator = "locator_01",
      name = "scene4_enemy_01",
      variation = "man79_aa"
    },
    {
      type = "gorotuki05",
      locator = "locator_02",
      name = "scene4_enemy_02",
      variation = "man80_cc",
      hair = true
    },
    {
      type = "gorotuki04",
      locator = "locator_03",
      name = "scene4_enemy_03",
      variation = "man79_bb"
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
    _is_out_of_range = true
  end
}
enmgen2_scene4_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gorotuki05",
      locator = "locator_01",
      name = "enemy_02_01",
      variation = "man80_aa",
      hair = true
    },
    {
      type = "gorotuki04",
      locator = "locator_02",
      name = "enemy_02_02",
      variation = "man79_cc"
    },
    {
      type = "gorotuki05",
      locator = "locator_04",
      name = "enemy_02_04",
      variation = "man80_bb"
    },
    {
      type = "gorotuki04",
      locator = "locator_05",
      name = "enemy_02_05",
      variation = "man79_dd",
      hair = true
    }
  },
  onUpdate = function(A0_10)
    local L1_11
  end,
  onEnter = function(A0_12)
    local L1_13
  end,
  onLeave = function(A0_14)
    local L1_15
  end,
  onObjectDead = function(A0_16, A1_17)
  end,
  onObjectAsh = function(A0_18, A1_19)
    _is_out_of_range = true
  end
}
function Initialize()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26
  L0_20 = {
    L1_21,
    L2_22,
    L3_23
  }
  L1_21 = {}
  L1_21.name = "sm30_director_01"
  L1_21.type = "man18"
  L1_21.node = "locator2_director_01"
  L1_21.active = false
  L2_22.name = "sm30_assistant_01"
  L2_22.type = "man17"
  L2_22.node = "locator2_assistant_01"
  L2_22.active = false
  L3_23.name = "sm30_assi_wom_01"
  L3_23.type = "wom01"
  L3_23.node = "locator2_assi_wom_01"
  L3_23.active = false
  L1_21 = Fn_setupNpc
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = Fn_pcSensorOff
  L1_21(L2_22)
  L1_21 = {
    L2_22,
    L3_23,
    L4_24,
    L5_25,
    L6_26,
    "bg2_scene2_chair_01",
    "bg2_scene3_chair_01",
    "bg2_scene4_chair_01",
    "bg2_scene5_chair_01"
  }
  L5_25 = "bg2_scene4_parasol_01"
  L6_26 = "bg2_scene1_chair_01"
  for L5_25, L6_26 in L2_22(L3_23) do
    if findGameObject2("GimmickBg", L6_26) ~= nil then
      findGameObject2("GimmickBg", L6_26):setVisiblePermission(false)
      _staff_bg_tbl[L6_26] = findGameObject2("GimmickBg", L6_26)
    end
  end
  L2_22(L3_23)
  L2_22(L3_23)
end
function Ingame()
  Fn_userCtrlOff()
  Fn_disableCostumeChange(true)
  LoadPlayerCommonMotionTable()
  scene4Main()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if _staff_car_move_task ~= nil then
    _staff_car_move_task:abort()
    _staff_car_move_task = nil
  end
  ReleaseShipWork(_staffShipWork)
  Fn_disableCostumeChange(false)
end
function scene4Main()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33
  L0_27 = Fn_warpNpc
  L1_28 = "sm30_director_01"
  L2_29 = "warppoint2_scene4_director_01"
  L0_27(L1_28, L2_29)
  L0_27 = Fn_warpNpc
  L1_28 = "sm30_assistant_01"
  L2_29 = "warppoint2_scene4_assistant_01"
  L0_27(L1_28, L2_29)
  L0_27 = Fn_warpNpc
  L1_28 = "sm30_assi_wom_01"
  L2_29 = "warppoint2_scene4_assi_wom_01"
  L0_27(L1_28, L2_29)
  L0_27 = Fn_setNpcActive
  L1_28 = "sm30_assistant_01"
  L2_29 = true
  L0_27(L1_28, L2_29)
  L0_27 = Fn_setNpcActive
  L1_28 = "sm30_assi_wom_01"
  L2_29 = true
  L0_27(L1_28, L2_29)
  L0_27 = Fn_setNpcActive
  L1_28 = "sm30_director_01"
  L2_29 = true
  L0_27(L1_28, L2_29)
  L0_27 = _staff_bg_tbl
  L0_27 = L0_27.bg2_scene4_parasol_01
  L1_28 = L0_27
  L0_27 = L0_27.setVisiblePermission
  L2_29 = true
  L0_27(L1_28, L2_29)
  L0_27 = _staff_bg_tbl
  L0_27 = L0_27.bg2_scene4_chair_01
  L1_28 = L0_27
  L0_27 = L0_27.setVisiblePermission
  L2_29 = true
  L0_27(L1_28, L2_29)
  L0_27 = Fn_playMotionNpc
  L1_28 = "sm30_director_01"
  L2_29 = "sit_00"
  L0_27(L1_28, L2_29, L3_30)
  L0_27 = Fn_playMotionNpc
  L1_28 = "sm30_assistant_01"
  L2_29 = "talk_03"
  L0_27(L1_28, L2_29, L3_30)
  L0_27 = Fn_playMotionNpc
  L1_28 = "sm30_assi_wom_01"
  L2_29 = "photo_03"
  L0_27(L1_28, L2_29, L3_30)
  L0_27 = Fn_userCtrlOn
  L0_27()
  L0_27 = Fn_userCtrlGravityOff
  L0_27()
  L0_27 = Player
  L1_28 = L0_27
  L0_27 = L0_27.setStay
  L2_29 = true
  L0_27(L1_28, L2_29)
  L0_27 = {
    L1_28,
    L2_29,
    L3_30
  }
  L1_28 = {}
  L1_28.jump_point_sensor = "pccubesensor2_scene4_jump_point_01"
  function L2_29()
    local L0_34, L1_35
    L0_34 = _is_out_of_jump_sensor_01
    return L0_34
  end
  L1_28.jump_check_fnc = L2_29
  L2_29 = {}
  L2_29.node = "locator2_land_range_marker_01"
  L6_33 = 9.5
  L2_29.scale = L3_30
  L1_28.land_range_marker = L2_29
  L1_28.land_navi = "locator2_navi_scene4_land_01"
  L1_28.land_sensor = "pccubesensor2_scene4_land_01"
  L1_28.out_sensor = "pccubesensormulti2_scene4_out_01"
  L1_28.induce_move = nil
  L1_28.enmgen = nil
  L1_28.land_range_marker_hdl = nil
  L2_29 = {}
  L2_29.jump_point_sensor = "pccubesensor2_scene4_jump_point_02"
  L2_29.jump_check_fnc = L3_30
  L3_30.node = "locator2_land_range_marker_02"
  L6_33 = 1
  L3_30.scale = L4_31
  L2_29.land_range_marker = L3_30
  L2_29.land_navi = "locator2_navi_scene4_land_02"
  L2_29.land_sensor = "pccubesensor2_scene4_land_02"
  L2_29.out_sensor = "pccubesensormulti2_scene4_out_02"
  L4_31.navi = "locator2_navi_scene4_move_01"
  L4_31.navi_sensor = "pccubesensor2_scene4_move_01"
  L4_31.out_sensor = "pccubesensor2_scene4_move_out_01"
  L4_31.caption = "sm30_00120"
  L2_29.induce_move = L3_30
  L2_29.enmgen = nil
  L2_29.land_range_marker_hdl = nil
  L3_30.jump_point_sensor = "pccubesensor2_scene4_jump_point_03"
  L3_30.jump_check_fnc = L4_31
  L4_31.node = "locator2_land_range_marker_03"
  L6_33 = 10.5
  L4_31.scale = L5_32
  L3_30.land_range_marker = L4_31
  L3_30.land_navi = "locator2_navi_scene4_land_03"
  L3_30.land_sensor = "pccubesensor2_scene4_land_03"
  L3_30.out_sensor = "pccubesensormulti2_scene4_out_03"
  L5_32.navi = "locator2_navi_scene4_move_02"
  L5_32.navi_sensor = "pccubesensor2_scene4_move_02"
  L5_32.out_sensor = "pccubesensormulti2_scene4_move_out_01"
  L5_32.caption = nil
  L6_33 = {}
  L6_33.navi = "locator2_navi_scene4_move_03"
  L6_33.navi_sensor = "pccubesensor2_scene4_move_03"
  L6_33.out_sensor = "pccubesensormulti2_scene4_move_out_01"
  L6_33.caption = nil
  L3_30.induce_move = L4_31
  L3_30.enmgen = nil
  L3_30.land_range_marker_hdl = nil
  L1_28 = {L2_29, L3_30}
  L2_29 = {}
  L2_29.phase = 1
  L3_30.phase = 3
  L2_29 = nil
  for L6_33 = 1, #L0_27 do
    if findGameObject2("EnemyGenerator", "enmgen2_scene4_" .. string.format("%02d", L6_33)) ~= nil then
      L0_27[L6_33].enmgen = findGameObject2("EnemyGenerator", "enmgen2_scene4_" .. string.format("%02d", L6_33))
      if L6_33 == 1 then
        L0_27[L6_33].enmgen:requestIdlingEnemy(true)
      else
        L0_27[L6_33].enmgen:requestPrepare()
      end
    else
      break
    end
  end
  for L6_33 = 2, #L0_27 do
    if L0_27[L6_33].enmgen ~= nil then
      while L0_27[L6_33].enmgen:isPrepared() == false do
        wait()
      end
    end
  end
  L6_33 = Player
  L6_33 = L6_33.getEnergyMax
  L6_33 = L6_33(L6_33, Player.kEnergy_Life)
  L3_30(L4_31, L5_32, L6_33, L6_33(L6_33, Player.kEnergy_Life))
  L6_33 = "warppoint2_scene4_staff_car_01"
  _staffShipWork = L3_30
  for L6_33, _FORV_7_ in L3_30(L4_31) do
    L0_27[L6_33].land_range_marker_hdl = createRangeMarker(_FORV_7_.land_range_marker.node, _FORV_7_.land_range_marker.scale)
    Fn_pcSensorOn(_FORV_7_.jump_point_sensor)
  end
  L3_30()
  L3_30()
  L3_30(L4_31)
  function L6_33()
    RAC_infoView("sm30_info_04")
    RAC_missionNaviCaption("sm30_00103", findGameObject2("Node", L0_27[1].land_navi))
    RAC_countDownVoice()
    Fn_setBgmPoint("event", "cut4_start")
    Player:setStay(false)
    for _FORV_6_, _FORV_7_ in ipairs(L0_27) do
      for _FORV_11_ = 1, #L1_28 do
        if _FORV_6_ == L1_28[_FORV_11_].phase then
          if _FORV_11_ == 1 then
            _staff_car_move_task = StartShipWorkInvokeTask(_staffShipWork)
          else
            _staffShipWork = ChangeRoute(_staffShipWork, {
              findGameObject2("Node", "locator2_scene4_staff_car_movepoint_01"):getWorldPos(),
              findGameObject2("Node", "locator2_scene4_staff_car_movepoint_02"):getWorldPos()
            })
            _staff_car_move_task = StartShipWorkInvokeTask(_staffShipWork)
          end
        end
      end
      if _FOR_ ~= nil then
        for _FORV_11_, _FORV_12_ in ipairs(_FORV_7_.induce_move) do
          _is_out_of_range = false
          Fn_pcSensorOn(_FORV_12_.out_sensor)
          if _FORV_12_.caption ~= nil then
            Fn_captionView(_FORV_12_.caption)
          end
          Fn_naviSet(findGameObject2("Node", _FORV_12_.navi))
          _is_in_sensor = false
          Fn_pcSensorOn(_FORV_12_.navi_sensor)
          while _is_in_sensor == false and _is_out_of_range ~= true do
            if Player:getEnergy(Player.kEnergy_Life) ~= L3_30 then
              break
            end
            wait()
          end
          Fn_pcSensorOff(_FORV_12_.navi_sensor)
          _is_in_sensor = false
          Fn_naviKill()
          Fn_pcSensorOff(_FORV_12_.out_sensor)
          if _is_out_of_range ~= true and true ~= true then
          end
        end
        if _is_out_of_range == true or true == true then
          Fn_pcSensorOff(_FORV_7_.out_sensor)
          break
        end
      end
      _is_out_of_range = false
      Fn_pcSensorOn(_FORV_7_.out_sensor)
      Fn_captionView("sm30_00104", 0)
      L0_27[_FORV_6_].land_range_marker_hdl:setActive(true)
      L0_27[_FORV_6_].land_range_marker_hdl:playIn()
      if _FORV_6_ ~= 1 then
        Fn_missionView("sm30_00103")
        Fn_naviSet(findGameObject2("Node", _FORV_7_.land_navi))
      end
      while _FORV_7_.jump_check_fnc() == false and _is_out_of_range ~= true do
        if Player:getEnergy(Player.kEnergy_Life) ~= L3_30 then
          break
        end
        wait()
      end
      invokeLookAtObjectWaitTask(findGameObject2("Node", _FORV_7_.land_navi), 0, 1):abort()
      if _is_out_of_range == true or true == true then
        Fn_captionViewEnd()
        Fn_pcSensorOff(_FORV_7_.out_sensor)
        break
      end
      while Player:getUnderfootObject() ~= nil and _is_out_of_range ~= true do
        if Player:getEnergy(Player.kEnergy_Life) ~= L3_30 then
          break
        end
        wait()
      end
      if _is_out_of_range == true or true == true then
        Fn_captionViewEnd()
        Fn_pcSensorOff(_FORV_7_.out_sensor)
        break
      end
      if L0_27[_FORV_6_].enmgen ~= nil then
        L0_27[_FORV_6_].enmgen:requestIdlingEnemy(false)
      end
      _is_in_sensor = false
      Fn_pcSensorOn(_FORV_7_.land_sensor)
      while Player:getUnderfootObject() == nil and _is_out_of_range ~= true do
        if Player:getEnergy(Player.kEnergy_Life) ~= L3_30 then
          break
        end
        wait()
      end
      Fn_pcSensorOff(_FORV_7_.land_sensor)
      Fn_naviKill()
      Fn_captionViewEnd()
      if _is_out_of_range == true or true == true then
        Fn_pcSensorOff(_FORV_7_.out_sensor)
        break
      end
      if _is_in_sensor == true and Player.getAction() == Player.kAction_Breakfall then
        if _FORV_6_ > 1 and L0_27[_FORV_6_ - 1].enmgen ~= nil then
          L0_27[_FORV_6_ - 1].enmgen:requestAllEnemyKill()
        end
        if _FORV_6_ < L4_31 and L0_27[_FORV_6_ + 1].enmgen ~= nil then
          L0_27[_FORV_6_ + 1].enmgen:requestSpawn()
          L0_27[_FORV_6_ + 1].enmgen:requestIdlingEnemy(true)
        end
      else
      end
      while invokeTask(function()
        waitSeconds(1)
      end):isRunning() and _is_out_of_range ~= true do
        wait()
      end
      invokeTask(function()
        waitSeconds(1)
      end):abort()
      if false == false or _is_out_of_range == true then
        Fn_pcSensorOff(_FORV_7_.out_sensor)
        break
      end
      L0_27[_FORV_6_].land_range_marker_hdl:playOut()
      Fn_pcSensorOff(_FORV_7_.out_sensor)
      _is_out_of_range = false
    end
    if true == true then
      _is_out_of_range = false
      L5_32(0.5)
      return false
    elseif false == false or _is_out_of_range == true then
      _is_out_of_range = false
      L5_32()
      return false
    end
    return true
  end
  while true do
    if L6_33() == false then
    end
  end
  for _FORV_10_, _FORV_11_ in ipairs(L0_27) do
    L0_27[_FORV_10_].land_range_marker_hdl:try_term()
    L0_27[_FORV_10_].land_range_marker_hdl = nil
    Fn_pcSensorOff(_FORV_11_.jump_point_sensor)
  end
  for _FORV_10_, _FORV_11_ in ipairs(L0_27) do
    if _FORV_11_.enmgen ~= nil then
      _FORV_11_.enmgen:requestAllEnemyKill()
    end
  end
  Fn_userCtrlOff()
  Fn_setBgmPoint("event", "cut4_end")
  PcAppeal()
  Fn_kaiwaDemoView("sm30_01300k")
  Fn_blackout()
  _staff_bg_tbl.bg2_scene4_parasol_01:setVisiblePermission(false)
  _staff_bg_tbl.bg2_scene4_chair_01:setVisiblePermission(false)
end
function invokeLookAtObjectWaitTask(A0_36, A1_37, A2_38)
  local L3_39, L4_40
  L3_39 = A0_36
  L4_40 = type
  L4_40 = L4_40(A0_36)
  if L4_40 == "string" then
    L4_40 = findGameObject2
    L4_40 = L4_40("Node", A0_36)
    L3_39 = L4_40
  end
  L4_40 = {}
  L4_40.look_task = Fn_lookAtObject(A0_36, A1_37)
  L4_40.timer_task = invokeTask(function()
    waitSeconds(4)
  end)
  function L4_40.update(A0_41)
    while L4_40.timer_task:isRunning() and not Fn_isInSightTarget(L3_39, A2_38) do
      wait()
    end
  end
  function L4_40.destractor(A0_42)
    L4_40.look_task:abort()
    L4_40.look_task = nil
    L4_40.timer_task:abort()
    L4_40.timer_task = nil
  end
  return RAC_InvokeTaskWithDestractor(L4_40.update, L4_40.destractor, L4_40)
end
function createRangeMarker(A0_43, A1_44)
  local L2_45, L3_46, L4_47
  L2_45 = findGameObject2
  L3_46 = "Node"
  L4_47 = A0_43
  L2_45 = L2_45(L3_46, L4_47)
  L4_47 = L2_45
  L3_46 = L2_45.getWorldTransform
  L4_47 = L3_46(L4_47)
  RAC_createGameObject2("range_maker", "MapMarker", L3_46, L4_47):setAssetName("gui_marker_30")
  RAC_createGameObject2("range_maker", "MapMarker", L3_46, L4_47):setupPattern("C", A1_44)
  return (RAC_createGameObject2("range_maker", "MapMarker", L3_46, L4_47))
end
function pccubesensor2_scene4_jump_point_01_OnEnter()
  local L0_48, L1_49
  _is_out_of_jump_sensor_01 = false
end
function pccubesensor2_scene4_jump_point_01_OnLeave()
  local L0_50, L1_51
  _is_out_of_jump_sensor_01 = true
end
function pccubesensor2_scene4_jump_point_02_OnEnter()
  local L0_52, L1_53
  _is_out_of_jump_sensor_02 = false
end
function pccubesensor2_scene4_jump_point_02_OnLeave()
  local L0_54, L1_55
  _is_out_of_jump_sensor_02 = true
end
function pccubesensor2_scene4_jump_point_03_OnEnter()
  local L0_56, L1_57
  _is_out_of_jump_sensor_03 = false
end
function pccubesensor2_scene4_jump_point_03_OnLeave()
  local L0_58, L1_59
  _is_out_of_jump_sensor_03 = true
end
function pccubesensor2_scene4_land_01_OnEnter()
  print("pccubesensor2_scene4_land_01_OnEnter")
  _is_in_sensor = true
end
function pccubesensor2_scene4_land_01_OnLeave()
  print("pccubesensor2_scene4_land_01_OnLeave")
  _is_in_sensor = false
end
function pccubesensor2_scene4_land_02_OnEnter()
  local L0_60, L1_61
  _is_in_sensor = true
end
function pccubesensor2_scene4_land_02_OnLeave()
  local L0_62, L1_63
  _is_in_sensor = false
end
function pccubesensor2_scene4_land_03_OnEnter()
  local L0_64, L1_65
  _is_in_sensor = true
end
function pccubesensor2_scene4_land_03_OnLeave()
  local L0_66, L1_67
  _is_in_sensor = false
end
function pccubesensor2_scene4_move_01_OnEnter()
  print("pccubesensor2_scene4_move_01_OnEnter")
  _is_in_sensor = true
end
function pccubesensor2_scene4_move_01_OnLeave()
  print("pccubesensor2_scene4_move_01_OnLeave")
  _is_in_sensor = false
end
function pccubesensor2_scene4_move_02_OnEnter()
  _is_in_sensor = true
  Fn_captionView("sm30_00121")
end
function pccubesensor2_scene4_move_02_OnLeave()
  local L0_68, L1_69
  _is_in_sensor = false
end
function pccubesensor2_scene4_move_03_OnEnter()
  local L0_70, L1_71
  _is_in_sensor = true
end
function pccubesensor2_scene4_move_03_OnLeave()
  local L0_72, L1_73
  _is_in_sensor = false
end
function pccubesensor2_scene4_move_out_01_OnEnter()
  local L0_74, L1_75
  _is_out_of_range = false
end
function pccubesensor2_scene4_move_out_01_OnLeave()
  local L0_76, L1_77
  _is_out_of_range = true
end
function pccubesensormulti2_scene4_move_out_01_OnEnter()
  local L0_78, L1_79
  _is_out_of_range = false
end
function pccubesensormulti2_scene4_move_out_01_OnLeave()
  local L0_80, L1_81
  _is_out_of_range = true
end
function pccubesensormulti2_scene4_out_01_OnEnter()
  local L0_82, L1_83
  _is_out_of_range = false
end
function pccubesensormulti2_scene4_out_01_OnLeave()
  local L0_84, L1_85
  _is_out_of_range = true
end
function pccubesensormulti2_scene4_out_02_OnEnter()
  local L0_86, L1_87
  _is_out_of_range = false
end
function pccubesensormulti2_scene4_out_02_OnLeave()
  local L0_88, L1_89
  _is_out_of_range = true
end
function pccubesensormulti2_scene4_out_03_OnEnter()
  local L0_90, L1_91
  _is_out_of_range = false
end
function pccubesensormulti2_scene4_out_03_OnLeave()
  local L0_92, L1_93
  _is_out_of_range = true
end
