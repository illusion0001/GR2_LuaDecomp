dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_puppet_tbl = {}
_area_num = 0
_serverd_newsp_count = 0
_target_max = {
  5,
  15,
  19,
  25
}
_in_sensor = false
_view_task = nil
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_cap_area_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_area_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_away_from_marcket_02")
  L0_0 = {
    {
      name = "target_01",
      type = "man37",
      node = "locator2_target_01"
    },
    {
      name = "target_02",
      type = "wom21",
      node = "locator2_target_02"
    },
    {
      name = "target_03",
      type = "man38",
      node = "locator2_target_03"
    },
    {
      name = "target_04",
      type = "wom22",
      node = "locator2_target_04"
    },
    {
      name = "target_05",
      type = "man39",
      node = "locator2_target_05"
    },
    {
      name = "target_06",
      type = "wom23",
      node = "locator2_target_06"
    },
    {
      name = "target_07",
      type = "man40",
      node = "locator2_target_07",
      active = false
    },
    {
      name = "target_08",
      type = "wom24",
      node = "locator2_target_08",
      active = false
    },
    {
      name = "target_09",
      type = "man41",
      node = "locator2_target_09",
      active = false
    },
    {
      name = "target_10",
      type = "wom25",
      node = "locator2_target_10",
      active = false
    },
    {
      name = "target_11",
      type = "man76",
      node = "locator2_target_11",
      active = false
    },
    {
      name = "target_12",
      type = "wom26",
      node = "locator2_target_12",
      active = false
    },
    {
      name = "target_13",
      type = "man78",
      node = "locator2_target_13",
      active = false
    },
    {
      name = "target_14",
      type = "wom30",
      node = "locator2_target_14",
      active = false
    },
    {
      name = "target_15",
      type = "man37",
      node = "locator2_target_15",
      color_variation = 1,
      active = false
    },
    {
      name = "target_16",
      type = "wom21",
      node = "locator2_target_16",
      color_variation = 1,
      active = false
    },
    {
      name = "target_17",
      type = "man38",
      node = "locator2_target_17",
      color_variation = 1,
      active = false
    },
    {
      name = "target_18",
      type = "wom22",
      node = "locator2_target_18",
      color_variation = 1,
      active = false
    },
    {
      name = "target_19",
      type = "man39",
      node = "locator2_target_19",
      color_variation = 1,
      active = false
    },
    {
      name = "target_20",
      type = "wom23",
      node = "locator2_target_20",
      color_variation = 1,
      active = false
    },
    {
      name = "target_21",
      type = "man40",
      node = "locator2_target_21",
      color_variation = 1,
      active = false
    },
    {
      name = "target_22",
      type = "wom24",
      node = "locator2_target_22",
      color_variation = 1,
      active = false
    },
    {
      name = "target_23",
      type = "man41",
      node = "locator2_target_23",
      color_variation = 1,
      active = false
    },
    {
      name = "target_24",
      type = "wom25",
      node = "locator2_target_24",
      color_variation = 1,
      active = false
    },
    {
      name = "target_25",
      type = "man76",
      node = "locator2_target_25",
      color_variation = 1,
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_area_arrive_01")
  Fn_pcSensorOff("pccubesensor2_area_arrive_02")
  Fn_pcSensorOff("pccubesensor2_area_arrive_03")
  Fn_pcSensorOff("pccubesensor2_area_arrive_04")
  Player:dropGrabObject()
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1(L1_2)
  L0_1()
  for L3_4 = 1, L1_2[4], 2 do
    L7_8 = "%02d"
    L7_8 = "lookaround_01"
    L7_8 = false
    L4_5(L5_6, L6_7, L7_8, {isRandom = true, isRepeat = true})
  end
  for L3_4 = 2, L1_2[4], 2 do
    L7_8 = "%02d"
    L7_8 = "lookaround"
    L7_8 = false
    L4_5(L5_6, L6_7, L7_8, {isRandom = true, isRepeat = true})
  end
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2)
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1()
  L0_1(L1_2)
  _area_num = 1
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2, L2_3)
  L3_4 = 0
  L0_1(L1_2, L2_3)
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1()
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1()
  L0_1(L1_2)
  while true do
    L0_1(L1_2, L2_3)
    if L0_1 ~= L1_2 then
      L0_1()
    end
  end
  for L3_4 = 2, #L1_2 do
    _area_num = L3_4
    for L7_8 = L4_5 + 1, L5_6[L3_4] do
      Fn_setNpcActive("target_" .. string.format("%02d", L7_8), true)
    end
    L7_8 = "%02d"
    L4_5(L5_6)
    L7_8 = "locator2_gem2_energy_marcket_"
    L7_8 = L7_8 .. string.format("%02d", L3_4)
    L7_8 = L5_6(L6_7, L7_8)
    L4_5(L5_6, L6_7, L7_8, L5_6(L6_7, L7_8))
    L7_8 = "%02d"
    _view_task = L4_5
    L4_5()
    L4_5()
    if L4_5 == 1 then
      L4_5(L5_6, L6_7)
    else
      L4_5(L5_6, L6_7)
    end
    if L3_4 == 2 then
      L7_8 = L5_6(L6_7)
      if L4_5 <= 30 then
        L4_5(L5_6)
      else
        L4_5(L5_6)
      end
    elseif L3_4 == 3 then
      L7_8 = L5_6(L6_7)
      if L4_5 <= 80 then
        L4_5(L5_6)
      else
        L4_5(L5_6)
      end
    else
      L7_8 = L5_6(L6_7)
      if L4_5 <= 110 then
        L4_5(L5_6)
      else
        L4_5(L5_6)
      end
    end
    if L4_5 ~= nil then
      L4_5(L5_6)
      _view_task = nil
    end
    L7_8 = "%02d"
    L4_5(L5_6)
    while true do
      L4_5(L5_6, L6_7)
      if L4_5 ~= L5_6 then
        L4_5()
      end
    end
  end
  L0_1()
  L0_1()
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1()
  L0_1()
  L7_8 = L1_2(L2_3)
  if L0_1 <= 150 then
    L0_1(L1_2)
  else
    L7_8 = L1_2(L2_3)
    if L0_1 > 150 then
      L7_8 = L1_2(L2_3)
      if L0_1 <= 180 then
        L0_1(L1_2)
      end
    else
      L0_1(L1_2)
    end
  end
  L0_1()
  L0_1()
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  for L3_4 = 1, L1_2[4] do
    L7_8 = "%02d"
    L4_5(L5_6)
  end
  L0_1(L1_2)
  L0_1()
  L0_1()
  L0_1()
  L0_1()
end
function Finalize()
  Player:setForcedNormalGrab(false)
end
function pccubesensor2_guide_cap_area_02_OnLeave()
  Fn_captionView("sm05_01026")
end
function pccubesensor2_warning_area_02_OnLeave()
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  Fn_captionView("sm05_01027")
end
function pccubesensor2_away_from_marcket_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_area_arrive_01_OnEnter()
  local L0_9, L1_10, L2_11, L3_12
  L0_9()
  L0_9(L1_10)
  for L3_12 = 1, L1_10[1] do
    setupPost({
      target = _puppet_tbl["target_" .. string.format("%02d", L3_12)],
      size = Vector(1.8, 1.7, 3),
      pos = Vector(0, 1.5, 1)
    }, string.format("%02d", L3_12))
  end
  L0_9(L1_10)
end
function pccubesensor2_area_arrive_02_OnEnter()
  local L0_13, L1_14, L2_15, L3_16
  L0_13()
  L0_13(L1_14)
  for L3_16 = L0_13 + 1, L1_14[2] do
    setupPost({
      target = _puppet_tbl["target_" .. string.format("%02d", L3_16)],
      size = Vector(1.8, 1.7, 3),
      pos = Vector(0, 1.5, 1)
    }, string.format("%02d", L3_16))
  end
  L0_13(L1_14)
end
function pccubesensor2_area_arrive_03_OnEnter()
  local L0_17, L1_18, L2_19, L3_20
  L0_17()
  L0_17(L1_18)
  for L3_20 = L0_17 + 1, L1_18[3] do
    setupPost({
      target = _puppet_tbl["target_" .. string.format("%02d", L3_20)],
      size = Vector(1.8, 1.7, 3),
      pos = Vector(0, 1.5, 1)
    }, string.format("%02d", L3_20))
  end
  L0_17(L1_18)
end
function pccubesensor2_area_arrive_04_OnEnter()
  local L0_21, L1_22, L2_23, L3_24
  L0_21()
  L0_21(L1_22)
  for L3_24 = L0_21 + 1, L1_22[4] do
    setupPost({
      target = _puppet_tbl["target_" .. string.format("%02d", L3_24)],
      size = Vector(1.8, 1.7, 3),
      pos = Vector(0, 1.5, 1)
    }, string.format("%02d", L3_24))
  end
  L0_21(L1_22)
end
function viewControlCancel()
  invokeTask(function()
    local L0_25
    L0_25 = 0
    while _view_task ~= nil do
      if Pad:getStick(Pad.kStick_Camera) ~= 0 or Pad:getStick(Pad.kStick_Camera) ~= 0 then
        L0_25 = L0_25 + 1
        if L0_25 > 10 then
          _view_task:abort()
          _view_task = nil
          break
        end
      end
      wait()
    end
  end)
end
function setupPost(A0_26, A1_27)
  local L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36
  L2_28 = {}
  L2_28.hdl = nil
  L2_28.name = nil
  L3_29 = {}
  L3_29.hdl = nil
  L3_29.name = nil
  L4_30 = {}
  L4_30.hdl = nil
  L4_30.name = nil
  L5_31 = {}
  L5_31.hdl = nil
  L5_31.name = nil
  L6_32 = {}
  L6_32.hdl = nil
  L6_32.name = nil
  L7_33 = findNodeHandleAndGetName
  L8_34 = A0_26.target
  L9_35 = A0_26.find_type
  L8_34 = L7_33(L8_34, L9_35)
  L2_28.name = L8_34
  L2_28.hdl = L7_33
  L7_33 = L2_28.hdl
  if L7_33 ~= nil then
    L7_33 = replaceSensorName
    L8_34 = L2_28.name
    L7_33 = L7_33(L8_34)
    L3_29.name = L7_33
    L7_33 = replaceSensorName
    L8_34 = L2_28.name
    L7_33 = L7_33(L8_34)
    L8_34 = "_pc"
    L7_33 = L7_33 .. L8_34
    L4_30.name = L7_33
    L7_33 = replaceMarkerName
    L8_34 = L2_28.name
    L7_33 = L7_33(L8_34)
    L5_31.name = L7_33
    L7_33 = replaceMarkerName
    L8_34 = L2_28.name
    L7_33 = L7_33(L8_34)
    L6_32.name = L7_33
    function L7_33()
      if _in_sensor == false then
        _in_sensor = true
        L3_29.hdl:kill()
        L4_30.hdl:kill()
        L5_31.hdl:setActive(false)
        L5_31.hdl:del()
        L3_29.hdl = nil
        L4_30.hdl = nil
        L5_31.hdl = nil
        L6_32.hdl:setLockonPermission(false)
        _serverd_newsp_count = _serverd_newsp_count + 1
        print("serverd_newsp_count = " .. _serverd_newsp_count)
        Sound:pulse("sm34_flyer")
        Sound:pulse("success")
        invokeTask(function()
          captionPosting(A1_27)
        end)
        invokeTask(function()
          Fn_playMotionNpc("target_" .. string.format("%02d", A1_27), "greeting", true)
          Fn_playMotionNpc("target_" .. string.format("%02d", A1_27), "stay", false)
        end)
        _in_sensor = false
      end
    end
    L8_34 = "pccubesensor2_"
    L9_35 = L2_28.name
    L10_36 = "_OnEnter"
    L8_34 = L8_34 .. L9_35 .. L10_36
    L9_35 = _G
    function L10_36()
      if L3_29.hdl ~= nil then
        L7_33()
      end
    end
    L9_35[L8_34] = L10_36
    L9_35 = "pccubesensor2_pc_"
    L10_36 = L2_28.name
    L9_35 = L9_35 .. L10_36 .. "_OnEnter"
    L10_36 = _G
    L10_36[L9_35] = function()
      if L4_30.hdl ~= nil then
        L7_33()
      end
    end
    L10_36 = createGameObject2
    L10_36 = L10_36("Sensor")
    L3_29.hdl = L10_36
    L10_36 = L3_29.hdl
    L10_36 = L10_36.setName
    L10_36(L10_36, L3_29.name)
    L10_36 = L3_29.hdl
    L10_36 = L10_36.setDetectBehavior
    L10_36(L10_36, 0)
    L10_36 = L3_29.hdl
    L10_36 = L10_36.setBBoxOffset
    L10_36(L10_36, Vector(100000, 100000, 100000))
    L10_36 = L3_29.hdl
    L10_36 = L10_36.addBox
    L10_36(L10_36, Vector(1.2, 1.2, 1.7))
    L10_36 = L3_29.hdl
    L10_36 = L10_36.setPos
    L10_36(L10_36, A0_26.pos or Vector(0, 0, 0))
    L10_36 = L3_29.hdl
    L10_36 = L10_36.setOnEnter
    L10_36(L10_36, L8_34)
    L10_36 = A0_26.target
    L10_36 = L10_36.appendChild
    L10_36(L10_36, L3_29.hdl)
    L10_36 = createGameObject2
    L10_36 = L10_36("PlayerSensor")
    L4_30.hdl = L10_36
    L10_36 = L4_30.hdl
    L10_36 = L10_36.setName
    L10_36(L10_36, L4_30.name)
    L10_36 = L4_30.hdl
    L10_36 = L10_36.setDetectBehavior
    L10_36(L10_36, 1)
    L10_36 = L4_30.hdl
    L10_36 = L10_36.setBBoxOffset
    L10_36(L10_36, Vector(100000, 100000, 100000))
    L10_36 = L4_30.hdl
    L10_36 = L10_36.addBox
    L10_36(L10_36, Vector(1.2, 1.2, 1.7))
    L10_36 = L4_30.hdl
    L10_36 = L10_36.setPos
    L10_36(L10_36, A0_26.pos or Vector(0, 0, 0))
    L10_36 = L4_30.hdl
    L10_36 = L10_36.setOnEnter
    L10_36(L10_36, L9_35)
    L10_36 = L2_28.hdl
    L10_36 = L10_36.appendChild
    L10_36(L10_36, L4_30.hdl)
    L10_36 = HUD
    L10_36 = L10_36.mnaviNew
    L10_36 = L10_36(L10_36, {
      name = L5_31.name,
      PochFadeLen0 = 5,
      PochFadeLen100 = 20
    })
    L5_31.hdl = L10_36
    L10_36 = createGameObject2
    L10_36 = L10_36("Node")
    L10_36:setPos(Vector(0, 1.2, 0))
    _puppet_tbl["target_" .. A1_27]:appendChild(L10_36)
    L5_31.hdl:setTarget(L10_36)
    L5_31.hdl:setActive(true)
    L6_32.hdl = createGameObject2("GimmickBg")
    L6_32.hdl:setName("dummy.name")
    L6_32.hdl:setPos(A0_26.dummy_pos or Vector(0, 1.2, 0))
    A0_26.target:appendChild(L6_32.hdl)
    L6_32.hdl:setLockonPermission(true)
  else
  end
end
function captionPosting(A0_37)
  local L1_38, L2_39, L3_40
  L1_38 = {
    L2_39,
    L3_40,
    "sm05_01009",
    "sm05_01022",
    "sm05_01023"
  }
  L2_39 = "sm05_01007"
  L3_40 = "sm05_01008"
  L2_39 = {
    L3_40,
    "sm05_01011",
    "sm05_01012",
    "sm05_01024",
    "sm05_01025"
  }
  L3_40 = "sm05_01010"
  L3_40 = _serverd_newsp_count
  if L3_40 ~= _target_max[1] then
    L3_40 = _serverd_newsp_count
    if L3_40 ~= _target_max[2] then
      L3_40 = _serverd_newsp_count
      if L3_40 ~= _target_max[3] then
        L3_40 = _serverd_newsp_count
        if L3_40 ~= _target_max[4] then
          L3_40 = RandI
          L3_40 = L3_40(1, 10)
          if L3_40 <= 8 then
            L3_40 = RandI(1, 5)
            if A0_37 % 2 == 1 then
              Fn_captionViewWait(L1_38[L3_40])
            else
              Fn_captionViewWait(L2_39[L3_40])
            end
          end
        end
      end
    end
  end
end
