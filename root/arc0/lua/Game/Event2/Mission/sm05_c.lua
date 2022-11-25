dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_serverd_newsp_count = 0
_target_area_max = {
  10,
  14,
  20,
  25,
  30,
  55
}
_area_num = 1
_in_sensor = false
_sensor_on = {}
_near_target = nil
_next_phase = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  for L3_3 = 1, 6 do
    Fn_pcSensorOff("pccubesensor2_away_from_office_" .. string.format("%02d", L3_3))
    Fn_pcSensorOff("pccubesensor2_warning_area_" .. string.format("%02d", L3_3))
  end
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L1_1.name = "postman_01"
  L1_1.type = "man63"
  L1_1.node = "locator2_postman_c_end"
  L1_1.not_mob = true
  L1_1(L2_2)
  for _FORV_5_, _FORV_6_ in L2_2(L3_3) do
    L1_1[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  L2_2(L3_3)
  L2_2(L3_3, true)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13
  L0_4()
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4()
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4(L1_5)
  for L3_7 = 1, L1_5[1] do
    L5_9 = {}
    L9_13 = L3_7
    L5_9.target = L6_10
    L9_13 = 0
    L5_9.lively_pos = L6_10
    L9_13 = 0.7
    L5_9.size = L6_10
    L9_13 = 4
    L5_9.marker_size = L6_10
    L5_9.sensor_num = L3_7
    L4_8(L5_9)
  end
  L0_4()
  L1_5(L2_6)
  if L1_5 then
    L1_5(L2_6)
  end
  L5_9 = 0
  L1_5(L2_6, L3_7)
  L1_5(L2_6, L3_7)
  L1_5()
  L1_5(L2_6)
  L1_5(L2_6)
  L1_5(L2_6)
  L1_5()
  L1_5()
  L1_5(L2_6, L3_7)
  L1_5(L2_6, L3_7, L4_8)
  L1_5(L2_6, L3_7)
  L1_5(L2_6, L3_7)
  L1_5(L2_6, L3_7)
  L1_5(L2_6, L3_7)
  L1_5(L2_6, L3_7)
  L1_5()
  L2_6(L3_7)
  while true do
    L2_6(L3_7, L4_8)
    if L2_6 ~= L3_7 then
      L2_6()
    end
  end
  _next_phase = true
  L2_6()
  L2_6()
  for L5_9 = 2, 5 do
    _area_num = L5_9
    L9_13 = "%02d"
    L6_10(L7_11)
    for L9_13 = L6_10 + 1, L7_11[L5_9] do
      setupPost({
        target = "locator2_target_" .. string.format("%02d", L9_13),
        lively_pos = Vector(0, -0.3, 0),
        sensor_num = L9_13
      })
    end
    L6_10()
    L9_13 = "locator2_gem2_energy_under_"
    L9_13 = L9_13 .. string.format("%02d", L5_9 - 1)
    L9_13 = L7_11(L8_12, L9_13)
    L6_10(L7_11, L8_12, L9_13, L7_11(L8_12, L9_13))
    _mv_navi_view_flg = true
    L9_13 = "%02d"
    L7_11(L8_12)
    L9_13 = 2
    if L7_11 == 1 then
      L9_13 = "kit_574"
      L7_11(L8_12, L9_13)
    else
      L9_13 = "kit_575"
      L7_11(L8_12, L9_13)
    end
    if L7_11 == 2 then
      L9_13 = L8_12
      L9_13 = L8_12(L9_13)
      if L7_11 <= 20 then
        L7_11(L8_12)
      else
        L7_11(L8_12)
      end
    elseif L7_11 == 3 then
      L9_13 = L8_12
      L9_13 = L8_12(L9_13)
      if L7_11 <= 50 then
        L7_11(L8_12)
      else
        L7_11(L8_12)
      end
    elseif L7_11 == 4 then
      L9_13 = L8_12
      L9_13 = L8_12(L9_13)
      if L7_11 <= 100 then
        L7_11(L8_12)
      else
        L7_11(L8_12)
      end
    elseif L7_11 == 5 then
      L9_13 = L8_12
      L9_13 = L8_12(L9_13)
      if L7_11 <= 130 then
        L7_11(L8_12)
      else
        L7_11(L8_12)
      end
    end
    if L6_10 ~= nil then
      L7_11(L8_12)
    end
    while true do
      L9_13 = L8_12
      L8_12(L9_13, _serverd_newsp_count)
      L9_13 = _target_area_max
      L9_13 = L9_13[L5_9]
      if L8_12 == L9_13 then
        if L7_11 ~= nil then
          L9_13 = L7_11
          L8_12(L9_13)
        end
        break
      end
      L8_12()
    end
    _next_phase = true
    do break end
    break
  end
  _area_num = 6
  L2_6()
  L2_6(L3_7, L4_8)
  L2_6(L3_7, L4_8)
  L2_6(L3_7)
  for L5_9 = L2_6 + 1, L3_7[6] do
    L9_13 = string
    L9_13 = L9_13.format
    L9_13 = L9_13("%02d", L5_9)
    L7_11.target = L8_12
    L9_13 = 0
    L7_11.lively_pos = L8_12
    L7_11.sensor_num = L5_9
    L6_10(L7_11)
  end
  L2_6()
  L5_9 = "locator2_gem2_energy_hotel_01"
  L9_13 = L3_7(L4_8, L5_9)
  L2_6(L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L3_7(L4_8, L5_9))
  _mv_navi_view_flg = true
  L3_7(L4_8)
  L5_9 = 2
  if L3_7 == 1 then
    L5_9 = "kit_574"
    L3_7(L4_8, L5_9)
  else
    L5_9 = "kit_575"
    L3_7(L4_8, L5_9)
  end
  L5_9 = L4_8
  L9_13 = L4_8(L5_9)
  if L3_7 <= 180 then
    L3_7(L4_8)
  else
    L3_7(L4_8)
  end
  L3_7(L4_8)
  if L2_6 ~= nil then
    L3_7(L4_8)
  end
  while true do
    L5_9 = L4_8
    L4_8(L5_9, L6_10)
    L5_9 = _target_area_max
    L5_9 = L5_9[6]
    if L4_8 ~= L5_9 then
      L4_8()
    end
  end
  L5_9 = L3_7
  L4_8(L5_9)
  L4_8()
  _mv_navi_view_flg = false
  L4_8()
  L4_8()
  L4_8()
  L5_9 = "pccubesensor2_guide_cap_area"
  L4_8(L5_9)
  L5_9 = "pccubesensor2_warning_area"
  L4_8(L5_9)
  L5_9 = "pccubesensor2_away_from_office"
  L4_8(L5_9)
  L5_9 = L4_8
  L4_8(L5_9)
  L4_8()
  L4_8()
  L4_8()
  L5_9 = HUD
  L5_9 = L5_9.timerGetSecond
  L9_13 = L5_9(L6_10)
  if L4_8 <= 180 then
    L5_9 = "sm05_02025"
    L4_8(L5_9)
  else
    L5_9 = HUD
    L5_9 = L5_9.timerGetSecond
    L9_13 = L5_9(L6_10)
    if L4_8 > 180 then
      L5_9 = HUD
      L5_9 = L5_9.timerGetSecond
      L9_13 = L5_9(L6_10)
      if L4_8 <= 210 then
        L5_9 = "sm05_02026"
        L4_8(L5_9)
      end
    else
      L5_9 = "sm05_02027"
      L4_8(L5_9)
    end
  end
  L4_8()
  L4_8()
  L4_8()
  L5_9 = "postman_01"
  L4_8(L5_9, L6_10)
  L5_9 = "locator2_resetpos_end"
  L4_8(L5_9)
  L5_9 = "postman_01"
  L4_8(L5_9, L6_10)
  L5_9 = L4_8
  L4_8(L5_9, L6_10)
  L5_9 = L4_8
  L4_8(L5_9, L6_10)
  L5_9 = 3.5
  L4_8(L5_9)
  L4_8()
  L5_9 = 1
  L4_8(L5_9)
  L5_9 = "sm05_00400k"
  L4_8(L5_9)
  L4_8()
  L4_8()
  L4_8()
  L4_8()
  L4_8()
end
function Finalize()
  Player:setForcedNormalGrab(false)
end
function pccubesensor2_guide_cap_area_OnLeave()
  invokeTask(function()
    if _area_num == 1 or _area_num == 6 then
      Fn_tutorialCaptionKill()
      wait()
    end
    Fn_captionView("sm05_02038")
  end)
end
function pccubesensor2_guide_cap_area_OnEnter()
  if _area_num == 1 or _area_num == 6 then
    Fn_captionViewEnd()
    Fn_tutorialCaption("slider")
  end
end
function pccubesensor2_warning_area_OnLeave()
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  Fn_captionView("sm05_02039")
end
function pccubesensor2_away_from_office_OnLeave()
  catWarpFunc()
end
function catWarpFunc()
  invokeTask(function()
    Fn_catWarp()
    if _area_num == 1 then
      Fn_tutorialCaption("slider")
      _near_target = Mv_getTargetNearPlayer(_target_area_max[1], _area_num, _sensor_on, nil)
      Fn_naviSet(findGameObject2("Node", _near_target))
      Mv_viewObj(_near_target)
    elseif _area_num == 6 then
      Fn_tutorialCaption("slider")
      _near_target = Mv_getTargetNearPlayer(_target_area_max[6] - _target_area_max[5], _area_num, _sensor_on, _target_area_max[_area_num - 1])
      Fn_naviSet(findGameObject2("Node", _near_target))
      Mv_viewObj(_near_target)
    else
      Fn_naviSet(findGameObject2("Node", "locator2_gem2_energy_under_" .. string.format("%02d", _area_num - 1)))
      Mv_viewObj("locator2_gem2_energy_under_" .. string.format("%02d", _area_num - 1))
    end
    _mv_timer_count = 0
    _mv_navi_view_flg = true
  end)
end
function setupPost(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22
  L1_15 = {}
  L1_15.hdl = nil
  L1_15.name = nil
  L2_16 = {}
  L2_16.hdl = nil
  L2_16.name = nil
  L3_17 = {}
  L3_17.hdl = nil
  L3_17.name = nil
  L4_18 = {}
  L4_18.hdl = nil
  L4_18.name = nil
  L5_19 = {}
  L5_19.hdl = nil
  L5_19.name = nil
  L6_20 = findNodeHandleAndGetName
  L7_21 = A0_14.target
  L8_22 = A0_14.find_type
  L7_21 = L6_20(L7_21, L8_22)
  L1_15.name = L7_21
  L1_15.hdl = L6_20
  L6_20 = _sensor_on
  L7_21 = A0_14.sensor_num
  L6_20[L7_21] = true
  L6_20 = L1_15.hdl
  if L6_20 ~= nil then
    L6_20 = replaceSensorName
    L7_21 = L1_15.name
    L6_20 = L6_20(L7_21)
    L2_16.name = L6_20
    L6_20 = replaceSensorName
    L7_21 = L1_15.name
    L6_20 = L6_20(L7_21)
    L7_21 = "_pc"
    L6_20 = L6_20 .. L7_21
    L3_17.name = L6_20
    L6_20 = replaceMarkerName
    L7_21 = L1_15.name
    L6_20 = L6_20(L7_21)
    L4_18.name = L6_20
    L6_20 = "dummy_"
    L7_21 = L1_15.name
    L6_20 = L6_20 .. L7_21
    L5_19.name = L6_20
    function L6_20()
      if _in_sensor == false then
        _in_sensor = true
        invokeTask(function()
          L4_18.hdl:playOut()
          while not L4_18.hdl:isOutEnd() do
            wait()
          end
          L2_16.hdl:kill()
          L3_17.hdl:kill()
          L4_18.hdl:kill()
          L2_16.hdl = nil
          L3_17.hdl = nil
          L4_18.hdl = nil
          Fn_naviKill()
          _near_target = nil
          _mv_navi_view_flg = false
          _sensor_on[A0_14.sensor_num] = false
          L5_19.hdl:setLockonPermission(false)
          _serverd_newsp_count = _serverd_newsp_count + 1
          print("serverd_newsp_count = " .. _serverd_newsp_count)
          Sound:pulse("sm34_flyer")
          Sound:pulse("success")
          invokeTask(function()
            captionPosting()
          end)
          _mv_timer_count = 0
          _in_sensor = false
        end)
      end
    end
    L7_21 = "pccuebsensor2_"
    L8_22 = L1_15.name
    L7_21 = L7_21 .. L8_22 .. "_OnEnter"
    L8_22 = _G
    L8_22[L7_21] = function()
      if L2_16.hdl ~= nil then
        L6_20()
      end
    end
    L8_22 = "pccubesensor2_pc_"
    L8_22 = L8_22 .. L1_15.name .. "_OnEnter"
    _G[L8_22] = function()
      if L3_17.hdl ~= nil then
        L6_20()
      end
    end
    L2_16.hdl = createGameObject2("Sensor")
    L2_16.hdl:setName(L2_16.name)
    L2_16.hdl:setDetectBehavior(0)
    L2_16.hdl:setBBoxOffset(Vector(100000, 100000, 100000))
    L2_16.hdl:addBox(A0_14.size or Vector(1.5, 1, 0.7))
    L2_16.hdl:setPos(A0_14.pos or Vector(0, 0, 1))
    L2_16.hdl:setOnEnter(L7_21)
    L1_15.hdl:appendChild(L2_16.hdl)
    L3_17.hdl = createGameObject2("PlayerSensor")
    L3_17.hdl:setName(L3_17.name)
    L3_17.hdl:setDetectBehavior(1)
    L3_17.hdl:setBBoxOffset(Vector(100000, 100000, 100000))
    L3_17.hdl:addBox(A0_14.size or Vector(1.5, 1, 0.7))
    L3_17.hdl:setPos(A0_14.pos or Vector(0, 0, 1))
    L3_17.hdl:setOnEnter(L8_22)
    L1_15.hdl:appendChild(L3_17.hdl)
    L4_18.hdl = createGameObject2("MapMarker")
    L4_18.hdl:setAssetName("gui_marker_30")
    L4_18.hdl:setPos(Vector(0, 0, 0))
    L4_18.hdl:setRot(XYZRotQuaternionEular(90, 0, 0))
    L4_18.hdl:setupPattern("C", A0_14.marker_size or Vector(3, 1.5, 2))
    L4_18.hdl:setActive(true)
    L1_15.hdl:appendChild(L4_18.hdl)
    L5_19.hdl = createGameObject2("GimmickBg")
    L5_19.hdl:setName("dummy.name")
    L1_15.hdl:appendChild(L5_19.hdl)
    L5_19.hdl:setLockonPermission(true)
  else
  end
end
function captionPosting()
  local L0_23
  L0_23 = 0
  if _area_num == 1 then
    if _serverd_newsp_count == 2 then
      Fn_tutorialCaptionKill()
      wait()
      Sound:playSE(({"kit_574", "kit_575"})[RandI(1, 2)])
      Fn_captionViewWait("sm05_02008")
      Fn_tutorialCaption("slider")
    end
  elseif _area_num == 6 then
    if _serverd_newsp_count % 5 == 0 and _serverd_newsp_count ~= 0 and _serverd_newsp_count < _target_area_max[6] then
      L0_23 = RandI(1, 5)
      Fn_tutorialCaptionKill()
      wait()
      Sound:playSE(({"kit_574", "kit_575"})[RandI(1, 2)])
      Fn_captionViewWait(({
        "sm05_02028",
        "sm05_02029",
        "sm05_02030",
        "sm05_02031",
        "sm05_02032"
      })[L0_23])
      if _serverd_newsp_count < _target_area_max[6] then
        Fn_tutorialCaption("slider")
      end
    end
  elseif _serverd_newsp_count ~= _target_area_max[2] and _serverd_newsp_count ~= _target_area_max[3] and _serverd_newsp_count ~= _target_area_max[4] and _serverd_newsp_count ~= _target_area_max[5] then
    L0_23 = RandI(1, 10)
    if L0_23 <= 5 then
      L0_23 = RandI(1, 5)
      Sound:playSE(({"kit_574", "kit_575"})[RandI(1, 2)])
      Fn_captionViewWait(({
        "sm05_02033",
        "sm05_02034",
        "sm05_02035",
        "sm05_02036",
        "sm05_02037"
      })[L0_23])
    end
  end
end
