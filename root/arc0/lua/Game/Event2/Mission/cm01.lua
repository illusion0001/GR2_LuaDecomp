dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_target_area_max = {
  7,
  17,
  27,
  46
}
_serverd_newsp_count = 0
_in_sensor = false
_mv_navi_view_flg = false
_mv_timer_count = 0
_view_task = nil
_area_num = 1
_sensor_on = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = {}
  L1_1.text = "sm05_01000"
  L1_1.max = L2_2
  L0_0.counter = L1_1
  L1_1.start = 0
  L0_0.score = L1_1
  L1_1(L2_2)
  for L4_4 = 2, #L2_2 do
    Fn_pcSensorOff("pccubesensor2_area_" .. string.format("%02d", L4_4))
    Fn_pcSensorOff("pccubesensor2_outrange_" .. string.format("%02d", L4_4))
  end
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18
  L0_5 = {}
  L1_6 = 0
  L2_7 = {}
  for L6_11 = 1, 5 do
    L2_7[L6_11] = false
  end
  while true do
    L9_14 = L3_8
    if L4_9 ~= nil then
      L5_10(L6_11, L7_12)
    else
      break
    end
    L5_10()
  end
  L4_9()
  L4_9.timer = true
  L4_9.counter = true
  for L8_13 = 1, L6_11[1] do
    L9_14 = setupPost
    L13_18 = "%02d"
    L10_15.target = L11_16
    L10_15.sensor_num = L8_13
    L9_14(L10_15, L11_16)
  end
  L5_10()
  L9_14 = "locator2_target_01"
  L9_14 = 0
  L5_10(L6_11, L7_12, L8_13, L9_14)
  L5_10(L6_11, L7_12, L8_13)
  L5_10()
  L5_10()
  L6_11(L7_12)
  while true do
    L6_11(L7_12, L8_13)
    if L6_11 >= L7_12 then
      L6_11()
      _mv_navi_view_flg = false
      L6_11(L7_12)
      L6_11(L7_12)
      L6_11(L7_12)
      break
    end
    for L9_14 = 1, L7_12 - 1 do
      if L10_15 == L11_16 then
        if not L10_15 then
          L13_18 = "locator2_energy_"
          L13_18 = L13_18 .. string.format("%02d", L9_14)
          L0_5[L9_14] = L10_15
          L13_18 = "locator2_energy_"
          L13_18 = L13_18 .. string.format("%02d", L9_14)
          _view_task = L10_15
          L13_18 = "locator2_energy_"
          L13_18 = L13_18 .. string.format("%02d", L9_14)
          L13_18 = L11_16(L12_17, L13_18)
          L10_15(L11_16, L12_17, L13_18, L11_16(L12_17, L13_18))
          L2_7[L9_14] = true
          _mv_navi_view_flg = true
          _area_num = L10_15
          L10_15()
          L13_18 = "%02d"
          L10_15(L11_16)
          L13_18 = "%02d"
          L10_15(L11_16)
          L13_18 = "%02d"
          L10_15(L11_16)
          for L13_18 = L10_15 + 1, L11_16[L12_17] do
            if _area_num == 2 then
              setupPost({
                target = "locator2_target_" .. string.format("%02d", L13_18),
                size = Vector(1, 1.6, 0.8),
                marker_size = Vector(2, 1.5, 3.5),
                sensor_num = L13_18
              }, 2)
            elseif _area_num == 3 then
              setupPost({
                target = "locator2_target_" .. string.format("%02d", L13_18),
                size = Vector(1.3, 0.8, 0.8),
                marker_size = Vector(2.7, 1.5, 1.7),
                sensor_num = L13_18
              }, 2)
            else
              setupPost({
                target = "locator2_target_" .. string.format("%02d", L13_18),
                sensor_num = L13_18
              }, 2)
            end
          end
          L10_15()
        end
      end
      if L10_15 >= L11_16 then
        if L10_15 < L11_16 then
          if L10_15 then
            if L10_15 then
              L13_18 = "%02d"
              if L10_15 > 150 then
                L13_18 = true
                L11_16(L12_17, L13_18)
                L11_16(L12_17)
                L11_16()
              end
            end
          end
        end
      end
    end
    L6_11()
  end
  L6_11()
  L6_11()
  L6_11()
end
function Finalize()
  Fn_challengeFinalize()
  Player:setForcedNormalGrab(false)
end
function pccubesensor2_area_02_OnEnter()
  Fn_naviKill()
  _mv_navi_view_flg = false
  Fn_setCatWarpCheckPoint("locator2_pc_reset_area_02")
end
function pccubesensor2_area_03_OnEnter()
  Fn_naviKill()
  _mv_navi_view_flg = false
  Fn_setCatWarpCheckPoint("locator2_pc_reset_area_03")
end
function pccubesensor2_area_04_OnEnter()
  Fn_naviKill()
  _mv_navi_view_flg = false
  Fn_setCatWarpCheckPoint("locator2_pc_reset_area_04")
end
function pccubesensor2_area_01_OnLeave()
  local L0_19, L1_20
end
function pccubesensor2_area_02_OnLeave()
  local L0_21, L1_22
end
function pccubesensor2_area_03_OnLeave()
  local L0_23, L1_24
end
function pccubesensor2_area_04_OnLeave()
  local L0_25, L1_26
end
function catWarpFunc()
  invokeTask(function()
    Fn_catWarp()
    _mv_timer_count = 0
  end)
end
function viewControlCancel()
  invokeTask(function()
    local L0_27
    L0_27 = 0
    while _view_task:isRunning() do
      if Pad:getStick(Pad.kStick_Camera) ~= 0 or Pad:getStick(Pad.kStick_Camera) ~= 0 then
        L0_27 = L0_27 + 1
        if L0_27 > 10 then
          _view_task:abort()
          break
        end
      end
      wait()
    end
  end)
end
function setupPost(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36
  L1_29 = {}
  L1_29.hdl = nil
  L1_29.name = nil
  L2_30 = {}
  L2_30.hdl = nil
  L2_30.name = nil
  L3_31 = {}
  L3_31.hdl = nil
  L3_31.name = nil
  L4_32 = {}
  L4_32.hdl = nil
  L4_32.name = nil
  L5_33 = {}
  L5_33.hdl = nil
  L5_33.name = nil
  L6_34 = findNodeHandleAndGetName
  L7_35 = A0_28.target
  L8_36 = A0_28.find_type
  L7_35 = L6_34(L7_35, L8_36)
  L1_29.name = L7_35
  L1_29.hdl = L6_34
  L6_34 = _sensor_on
  L7_35 = A0_28.sensor_num
  L6_34[L7_35] = true
  L6_34 = L1_29.hdl
  if L6_34 ~= nil then
    L6_34 = replaceSensorName
    L7_35 = L1_29.name
    L6_34 = L6_34(L7_35)
    L2_30.name = L6_34
    L6_34 = replaceSensorName
    L7_35 = L1_29.name
    L6_34 = L6_34(L7_35)
    L7_35 = "_pc"
    L6_34 = L6_34 .. L7_35
    L3_31.name = L6_34
    L6_34 = replaceMarkerName
    L7_35 = L1_29.name
    L6_34 = L6_34(L7_35)
    L4_32.name = L6_34
    L6_34 = replaceMarkerName
    L7_35 = L1_29.name
    L6_34 = L6_34(L7_35)
    L5_33.name = L6_34
    function L6_34()
      if _in_sensor == false then
        _in_sensor = true
        invokeTask(function()
          L4_32.hdl:playOut()
          while not L4_32.hdl:isOutEnd() do
            wait()
          end
          L2_30.hdl:kill()
          L3_31.hdl:kill()
          L4_32.hdl:kill()
          L2_30.hdl = nil
          L3_31.hdl = nil
          L4_32.hdl = nil
          L5_33.hdl:setLockonPermission(false)
          _serverd_newsp_count = _serverd_newsp_count + 1
          print("_serverd_newsp_count = " .. _serverd_newsp_count)
          Sound:pulse("sm34_flyer")
          Sound:pulse("success")
          Fn_naviKill()
          _mv_navi_view_flg = false
          _sensor_on[A0_28.sensor_num] = false
          _mv_timer_count = 0
          _in_sensor = false
        end)
      end
    end
    L7_35 = "pccubesensor2_"
    L8_36 = L1_29.name
    L7_35 = L7_35 .. L8_36 .. "_OnEnter"
    L8_36 = _G
    L8_36[L7_35] = function()
      if L2_30.hdl ~= nil then
        L6_34()
      end
    end
    L8_36 = "pccubesensor2_pc_"
    L8_36 = L8_36 .. L1_29.name .. "_OnEnter"
    _G[L8_36] = function()
      if L3_31.hdl ~= nil then
        L6_34()
      end
    end
    L2_30.hdl = createGameObject2("Sensor")
    L2_30.hdl:setName(L2_30.name)
    L2_30.hdl:setDetectBehavior(0)
    L2_30.hdl:setBBoxOffset(Vector(100000, 100000, 100000))
    L2_30.hdl:addBox(A0_28.size or Vector(1.5, 1, 0.8))
    L2_30.hdl:setPos(A0_28.pos or Vector(0, 0, 1))
    L2_30.hdl:setOnEnter(L7_35)
    L1_29.hdl:appendChild(L2_30.hdl)
    L3_31.hdl = createGameObject2("PlayerSensor")
    L3_31.hdl:setName(L3_31.name)
    L3_31.hdl:setDetectBehavior(1)
    L3_31.hdl:setBBoxOffset(Vector(100000, 100000, 100000))
    L3_31.hdl:addBox(A0_28.size or Vector(1.5, 1, 0.8))
    L3_31.hdl:setPos(A0_28.pos or Vector(0, 0, 1))
    L3_31.hdl:setOnEnter(L8_36)
    L1_29.hdl:appendChild(L3_31.hdl)
    L4_32.hdl = createGameObject2("MapMarker")
    L4_32.hdl:setAssetName("gui_marker_30")
    L4_32.hdl:setPos(Vector(0, 0, 0))
    L4_32.hdl:setRot(XYZRotQuaternionEular(90, 0, 0))
    L4_32.hdl:setupPattern("C", A0_28.marker_size or Vector(3, 1.5, 2))
    L4_32.hdl:setActive(true)
    L1_29.hdl:appendChild(L4_32.hdl)
    L5_33.hdl = createGameObject2("GimmickBg")
    L5_33.hdl:setName("dummy.name")
    L1_29.hdl:appendChild(L5_33.hdl)
    L5_33.hdl:setLockonPermission(true)
  else
  end
end
