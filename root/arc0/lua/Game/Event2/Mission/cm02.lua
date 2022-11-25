dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ChallengeCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
PHASE0 = 0
PHASE1 = 1
PHASE2 = 2
PHASE3 = 3
PHASE4 = 4
PHASE5 = 5
PHASE6 = 6
PHASE1_DIST = 25
PHASE2_DIST = 40
PHASE3_DIST = 25
PHASE4_DIST = 45
MAX_AREA = 6
_chara_table = {}
_puppet_tbl = {}
_target_area_max = {
  5,
  10,
  15,
  20,
  25,
  36
}
_serverd_newsp_count = 0
_in_sensor = false
_in_area_num = PHASE0
_view_task = nil
_sensor_on = {}
_warikomi_flag = {}
_end_flag = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L1_1.name = "hum_01"
  L1_1.type = "man_jil_up"
  L1_1.node = "locator2_target_01"
  L1_1.active = true
  L1_1.anim_name = "stay_01"
  L1_1.motion = "talk_02"
  L1_1.turn = "locator2_target_02"
  L1_1.mokuteki = "locator2_target_02"
  L2_2.name = "hum_02"
  L2_2.type = "man_jil_up"
  L2_2.node = "locator2_target_02"
  L2_2.active = true
  L2_2.anim_name = "stay_01"
  L2_2.motion = "talk_03"
  L2_2.turn = "locator2_target_01_pos_01"
  L2_2.mokuteki = nil
  L3_3.name = "hum_03"
  L3_3.type = "man_jil_up"
  L3_3.node = "locator2_target_03"
  L3_3.active = true
  L3_3.anim_name = "stay_01"
  L3_3.motion = "talk_00"
  L3_3.turn = "locator2_target_04"
  L4_4 = {}
  L4_4.name = "hum_04"
  L4_4.type = "wom_jil_up"
  L4_4.node = "locator2_target_04"
  L4_4.active = true
  L4_4.anim_name = "stay_01"
  L4_4.motion = "talk_01"
  L4_4.turn = "locator2_target_05"
  _chara_table = L0_0
  L0_0(L1_1)
  for L3_3, L4_4 in L0_0(L1_1) do
    _puppet_tbl[L4_4.name] = Fn_findNpcPuppet(L4_4.name)
    _warikomi_flag[L4_4.name] = false
  end
  L1_1.text = "sm05_01000"
  L1_1.max = L2_2
  L0_0.counter = L1_1
  L1_1.start = 0
  L0_0.score = L1_1
  L1_1(L2_2)
  for L4_4 = 2, MAX_AREA do
    Fn_pcSensorOff("pccubesensor2_in_area_" .. string.format("%02d", L4_4))
    Fn_pcSensorOff("pccubesensor2_outrange_" .. string.format("%02d", L4_4))
  end
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  __cm02_sort = true
  __cm02_cp_max = L1_1
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17
  L0_5 = {}
  L1_6 = {}
  for L5_10 = 1, MAX_AREA do
    L1_6[L5_10] = false
  end
  L0_5[1] = L2_7
  L2_7()
  _end_flag = false
  for L7_12, L8_13 in L4_9(L5_10) do
    for L12_17, _FORV_13_ in L9_14(L10_15) do
    end
    if L3_8 then
      L12_17 = 3
      if L9_14 == "man" then
        if L9_14 == false then
          L12_17 = "lookaround_01"
          L12_17 = false
          L9_14(L10_15, L11_16, L12_17, {isRandom = true, isRepeat = true})
        end
      else
        L12_17 = 3
        if L9_14 == "wom" then
          if L9_14 == false then
            L12_17 = "lookaround"
            L12_17 = false
            L9_14(L10_15, L11_16, L12_17, {isRandom = true, isRepeat = true})
          end
        else
          L12_17 = 3
          if L9_14 == "chi" then
            L12_17 = "lookaround"
            L12_17 = false
            L9_14(L10_15, L11_16, L12_17, {isRandom = true, isRepeat = true})
          else
            L12_17 = 3
            if L9_14 == "dog" then
              L12_17 = "stay"
              L12_17 = false
              L9_14(L10_15, L11_16, L12_17, {isRandom = true, isRepeat = true})
            end
          end
        end
      end
    end
  end
  L4_9()
  for L7_12, L8_13 in L4_9(L5_10) do
    L12_17 = false
    L9_14(L10_15, L11_16, L12_17)
  end
  for L7_12, L8_13 in L4_9(L5_10) do
    if L9_14 ~= "dog_09" then
      if L9_14 == "dog_35" then
      else
        L9_14(L10_15, L11_16)
      end
    end
  end
  L4_9(L5_10, L6_11, L7_12)
  L4_9()
  L4_9()
  L4_9.timer = true
  L4_9.counter = true
  L8_13 = true
  L5_10(L6_11, L7_12, L8_13)
  L5_10(L6_11)
  _in_area_num = L5_10
  L5_10()
  L8_13 = "locator2_energy_01"
  L12_17 = L6_11(L7_12, L8_13)
  L5_10(L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L6_11(L7_12, L8_13))
  L1_6[1] = true
  _mv_navi_view_flg = true
  L5_10()
  L5_10()
  L5_10(L6_11)
  while true do
    L5_10(L6_11, L7_12)
    if L5_10 >= L6_11 then
      L5_10(L6_11)
      L5_10(L6_11)
      break
    end
    for L8_13 = 1, L6_11 - 1 do
      if L9_14 == L10_15 then
        if not L9_14 then
          for L12_17 = L9_14 + 1, L10_15[L11_16] do
            Fn_setNpcActive("hum_" .. string.format("%02d", L12_17), true)
            if "hum_" .. string.format("%02d", L12_17) == "hum_09" then
              Fn_setNpcActive("dog_09", true)
            elseif "hum_" .. string.format("%02d", L12_17) == "hum_35" then
              Fn_setNpcActive("dog_35", true)
            end
          end
          L12_17 = "Node"
          L12_17 = 4
          L0_5[L9_14] = L10_15
          L12_17 = "locator2_energy_"
          L12_17 = L12_17 .. string.format("%02d", L8_13 + 1)
          _view_task = L9_14
          L12_17 = "locator2_energy_"
          L12_17 = L12_17 .. string.format("%02d", L8_13 + 1)
          L12_17 = L10_15(L11_16, L12_17)
          L9_14(L10_15, L11_16, L12_17, L10_15(L11_16, L12_17))
          L1_6[L9_14] = true
          _mv_navi_view_flg = true
          L9_14()
          L12_17 = "%02d"
          L9_14(L10_15)
          L9_14()
          if L9_14 == L10_15 then
          end
        end
      end
      if L9_14 >= L10_15 then
        if L9_14 < L10_15 then
          if L9_14 then
            if L9_14 then
              L12_17 = "%02d"
              if L9_14 > 100 then
                L12_17 = true
                L10_15(L11_16, L12_17)
                L10_15(L11_16)
                L10_15()
              end
            end
          end
        end
      end
    end
    L5_10()
  end
  _end_flag = true
  run01_task = L5_10
  run02_task = L5_10
  L5_10()
  L5_10()
  L5_10()
  L5_10()
  for L8_13 = 1, L6_11[6] do
    L12_17 = "%02d"
    L9_14(L10_15)
  end
  L5_10(L6_11)
  L5_10(L6_11)
end
function Finalize()
  Fn_challengeFinalize()
  Player:setForcedNormalGrab(false)
end
function pccubesensor2_in_area_01_OnEnter()
  _in_area_num = PHASE1
  inAreaFunc()
end
function pccubesensor2_in_area_02_OnEnter()
  _in_area_num = PHASE2
  inAreaFunc()
end
function pccubesensor2_in_area_03_OnEnter()
  _in_area_num = PHASE3
  inAreaFunc()
end
function pccubesensor2_in_area_04_OnEnter()
  _in_area_num = PHASE4
  inAreaFunc()
end
function pccubesensor2_in_area_05_OnEnter()
  _in_area_num = PHASE5
  inAreaFunc()
end
function pccubesensor2_in_area_06_OnEnter()
  _in_area_num = PHASE6
  inAreaFunc()
end
function inAreaFunc()
  if _mv_navi_view_flg then
    Fn_naviKill()
    _mv_navi_view_flg = false
    _mv_timer_count = 0
    Fn_pcSensorOff("pccubesensor2_in_area_" .. string.format("%02d", _in_area_num))
    Fn_pcSensorOn("pccubesensor2_outrange_" .. string.format("%02d", _in_area_num))
    if _in_area_num > 1 then
      Fn_setCatWarpCheckPoint("locator2_pc_reset_area_" .. string.format("%02d", _in_area_num))
      invokeTask(function()
        local L0_18, L1_19, L2_20, L3_21
        for L3_21 = L0_18 + 1, L1_19[L2_20] do
          setupPost({
            target = "locator2_target_" .. string.format("%02d", L3_21),
            sensor_num = L3_21,
            lively_pos = Vector(0, -2.3, 0)
          }, string.format("%02d", L3_21))
        end
        L0_18()
      end)
    else
      invokeTask(function()
        local L0_22, L1_23, L2_24, L3_25
        for L3_25 = 1, L1_23[1] do
          setupPost({
            target = "locator2_target_" .. string.format("%02d", L3_25),
            sensor_num = L3_25,
            lively_pos = Vector(0, -2.3, 0)
          }, string.format("%02d", L3_25))
        end
        L0_22()
      end)
    end
  end
end
function viewControlCancel()
  invokeTask(function()
    local L0_26
    L0_26 = 0
    while _view_task:isRunning() do
      if Pad:getStick(Pad.kStick_Camera) ~= 0 or Pad:getStick(Pad.kStick_Camera) ~= 0 then
        L0_26 = L0_26 + 1
        if L0_26 > 10 then
          _view_task:abort()
          break
        end
      end
      wait()
    end
  end)
end
function setupPost(A0_27, A1_28)
  local L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40
  L2_29 = {}
  L2_29.hdl = nil
  L2_29.name = nil
  L3_30 = {}
  L3_30.hdl = nil
  L3_30.name = nil
  L4_31 = {}
  L4_31.hdl = nil
  L4_31.name = nil
  L5_32 = {}
  L5_32.hdl = nil
  L5_32.name = nil
  L6_33 = {}
  L6_33.hdl = nil
  L6_33.name = nil
  L7_34 = findNodeHandleAndGetName
  L8_35 = A0_27.target
  L9_36 = A0_27.find_type
  L8_35 = L7_34(L8_35, L9_36)
  L2_29.name = L8_35
  L2_29.hdl = L7_34
  L7_34 = _sensor_on
  L8_35 = A0_27.sensor_num
  L7_34[L8_35] = true
  L7_34 = L2_29.hdl
  if L7_34 ~= nil then
    L7_34 = replaceSensorName
    L8_35 = L2_29.name
    L7_34 = L7_34(L8_35)
    L3_30.name = L7_34
    L7_34 = replaceSensorName
    L8_35 = L2_29.name
    L7_34 = L7_34(L8_35)
    L8_35 = "_pc"
    L7_34 = L7_34 .. L8_35
    L4_31.name = L7_34
    L7_34 = replaceMarkerName
    L8_35 = L2_29.name
    L7_34 = L7_34(L8_35)
    L5_32.name = L7_34
    L7_34 = replaceMarkerName
    L8_35 = L2_29.name
    L7_34 = L7_34(L8_35)
    L6_33.name = L7_34
    function L7_34()
      if _in_sensor == false then
        _in_sensor = true
        L3_30.hdl:kill()
        L4_31.hdl:kill()
        L5_32.hdl:setActive(false)
        L5_32.hdl:del()
        L3_30.hdl = nil
        L4_31.hdl = nil
        L5_32.hdl = nil
        L6_33.hdl:setLockonPermission(false)
        _serverd_newsp_count = _serverd_newsp_count + 1
        Sound:pulse("sm34_flyer")
        Sound:pulse("success")
        _sensor_on[A0_27.sensor_num] = false
        invokeAfterMotion("hum_" .. string.format("%02d", A1_28))
        _mv_timer_count = 0
        _in_sensor = false
      end
    end
    L8_35 = "pccubesensor2_"
    L9_36 = L2_29.name
    L10_37 = "_OnEnter"
    L8_35 = L8_35 .. L9_36 .. L10_37
    L9_36 = "pccubesensor2_"
    L10_37 = L2_29.name
    L11_38 = "_OnLeave"
    L9_36 = L9_36 .. L10_37 .. L11_38
    L10_37 = _G
    function L11_38()
      if L3_30.hdl ~= nil then
        L7_34()
      end
    end
    L10_37[L8_35] = L11_38
    L10_37 = "pccubesensor2_pc_"
    L11_38 = L2_29.name
    L12_39 = "_OnEnter"
    L10_37 = L10_37 .. L11_38 .. L12_39
    L11_38 = "pccubesensor2_pc_"
    L12_39 = L2_29.name
    L13_40 = "_OnLeave"
    L11_38 = L11_38 .. L12_39 .. L13_40
    L12_39 = _G
    function L13_40()
      if L4_31.hdl ~= nil then
        L7_34()
      end
    end
    L12_39[L10_37] = L13_40
    L12_39 = createGameObject2
    L13_40 = "Sensor"
    L12_39 = L12_39(L13_40)
    L3_30.hdl = L12_39
    L12_39 = L3_30.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setName
    L12_39(L13_40, L3_30.name)
    L12_39 = L3_30.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setDetectBehavior
    L12_39(L13_40, 0)
    L12_39 = L3_30.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setBBoxOffset
    L12_39(L13_40, Vector(100000, 100000, 100000))
    L12_39 = L3_30.hdl
    L13_40 = L12_39
    L12_39 = L12_39.addBox
    L12_39(L13_40, A0_27.size or Vector(1, 1.7, 1))
    L12_39 = L3_30.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setPos
    L12_39(L13_40, A0_27.pos or Vector(0, 0, 0))
    L12_39 = L3_30.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setOnEnter
    L12_39(L13_40, L8_35)
    L12_39 = L3_30.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setOnLeave
    L12_39(L13_40, L9_36)
    L12_39 = _puppet_tbl
    L13_40 = "hum_"
    L13_40 = L13_40 .. A1_28
    L12_39 = L12_39[L13_40]
    L13_40 = L12_39
    L12_39 = L12_39.appendChild
    L12_39(L13_40, L3_30.hdl)
    L12_39 = createGameObject2
    L13_40 = "PlayerSensor"
    L12_39 = L12_39(L13_40)
    L4_31.hdl = L12_39
    L12_39 = L4_31.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setName
    L12_39(L13_40, L4_31.name)
    L12_39 = L4_31.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setDetectBehavior
    L12_39(L13_40, 1)
    L12_39 = L4_31.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setBBoxOffset
    L12_39(L13_40, Vector(100000, 100000, 100000))
    L12_39 = L4_31.hdl
    L13_40 = L12_39
    L12_39 = L12_39.addBox
    L12_39(L13_40, A0_27.size or Vector(1, 1.7, 1))
    L12_39 = L4_31.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setPos
    L12_39(L13_40, A0_27.pos or Vector(0, 0, 0))
    L12_39 = L4_31.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setOnEnter
    L12_39(L13_40, L10_37)
    L12_39 = L4_31.hdl
    L13_40 = L12_39
    L12_39 = L12_39.setOnLeave
    L12_39(L13_40, L11_38)
    L12_39 = _puppet_tbl
    L13_40 = "hum_"
    L13_40 = L13_40 .. A1_28
    L12_39 = L12_39[L13_40]
    L13_40 = L12_39
    L12_39 = L12_39.appendChild
    L12_39(L13_40, L4_31.hdl)
    L12_39 = 1.2
    L13_40 = string
    L13_40 = L13_40.find
    L13_40 = L13_40(_chara_table[A0_27.sensor_num].type, "chi")
    if L13_40 ~= nil then
      L12_39 = 0.6
    end
    L13_40 = HUD
    L13_40 = L13_40.mnaviNew
    L13_40 = L13_40(L13_40, {
      name = L5_32.name,
      PochFadeLen0 = 5,
      PochFadeLen100 = 20
    })
    L5_32.hdl = L13_40
    L13_40 = createGameObject2
    L13_40 = L13_40("Node")
    L13_40:setPos(Vector(0, L12_39, 0))
    _puppet_tbl["hum_" .. A1_28]:appendChild(L13_40)
    L5_32.hdl:setTarget(L13_40)
    L5_32.hdl:setActive(true)
    L6_33.hdl = createGameObject2("GimmickBg")
    L6_33.hdl:setName("dummy.name")
    L6_33.hdl:setPos(Vector(0, L12_39, 0))
    _puppet_tbl["hum_" .. A1_28]:appendChild(L6_33.hdl)
    L6_33.hdl:setLockonPermission(true)
  else
  end
end
function invokeNpcPose()
  print([[






_in_area_num

]] .. _in_area_num)
  invokeTask(function()
    local L0_41, L1_42
    L0_41 = print
    L1_42 = [[






___test

]]
    L1_42 = L1_42 .. _in_area_num
    L0_41(L1_42)
    L0_41, L1_42 = nil, nil
    if _in_area_num == PHASE0 then
      print("\n\n\n\n\n\n_\233\150\139\229\185\149\231\167\187\229\139\149\233\150\139\229\167\139\n\n" .. _in_area_num)
      L0_41 = Fn_moveNpc("hum_01", {
        "locator2_target_01_pos_01",
        "locator2_target_02"
      }, {arrivedLength = 2, recast = true})
      while Fn_get_distance(_puppet_tbl.hum_01:getWorldPos(), _puppet_tbl.hum_02:getWorldPos()) > 4 do
        wait()
      end
      Fn_findNpc("hum_02"):turn(_puppet_tbl.hum_01)
      repeat
        wait()
      until Fn_findNpc("hum_02"):isTurnEnd()
      Fn_playMotionNpc("hum_02", "greeting", false)
      while L0_41:isRunning() do
        while _warikomi_flag.hum_01 == true do
          wait()
        end
        wait()
      end
      L0_41 = Mv_safeTaskAbort(L0_41)
      Fn_playMotionNpc("hum_01", {
        "talk_00",
        "talk_01",
        "talk_02"
      }, false)
      Fn_playMotionNpc("hum_02", {
        "talk_01",
        "talk_03",
        "talk_03"
      }, false)
      print("\n\n\n\n\n\n_\233\150\139\229\185\149\231\167\187\229\139\149\231\181\130\228\186\134\n\n" .. _in_area_num)
    elseif _in_area_num == PHASE1 then
      while Fn_getDistanceToPlayer(_puppet_tbl.hum_06:getWorldPos()) > PHASE1_DIST do
        wait()
      end
      L0_41 = Mv_safeTaskAbort(L0_41)
      L0_41 = Fn_moveNpc("hum_06", {
        "locator2_target_09"
      }, {arrivedLength = 2, recast = true})
      while Fn_get_distance(_puppet_tbl.hum_06:getWorldPos(), _puppet_tbl.hum_09:getWorldPos()) > 5 do
        wait()
      end
      Fn_findNpc("hum_09"):turn(_puppet_tbl.hum_09)
      repeat
        wait()
      until Fn_findNpc("hum_09"):isTurnEnd()
      Fn_playMotionNpc("hum_09", "greeting", false)
      while L0_41:isRunning() do
        while _warikomi_flag.hum_06 == true do
          wait()
        end
        wait()
      end
      L0_41 = Mv_safeTaskAbort(L0_41)
      Fn_playMotionNpc("hum_09", {
        "talk_00",
        "talk_01",
        "talk_02"
      }, false)
      Fn_playMotionNpc("hum_06", {
        "talk_01",
        "talk_03",
        "talk_03"
      }, false)
      Fn_playMotionNpc("dog_09", {
        "stay",
        "stay",
        "stay"
      }, false)
      print("\n\n\n\n\n\n_PHASE02\228\188\154\232\169\177\231\181\130\228\186\134\n\n" .. _in_area_num)
    elseif _in_area_num == PHASE2 then
      while Fn_getDistanceToPlayer(_puppet_tbl.hum_11:getWorldPos()) > PHASE2_DIST do
        wait()
      end
      L0_41 = Fn_moveNpc("hum_11", {
        "locator2_target_11_pos_01"
      }, {arrivedLength = 0.1, recast = true})
      L1_42 = Fn_moveNpc("hum_12", {
        "locator2_target_12_pos_01"
      }, {arrivedLength = 0.1, recast = true})
      while L1_42:isRunning() do
        while _warikomi_flag.hum_12 == true do
          wait()
        end
        wait()
      end
      Fn_findNpc("hum_12"):turn(_puppet_tbl.hum_11)
      repeat
        wait()
      until Fn_findNpc("hum_12"):isTurnEnd()
      L0_41 = Mv_safeTaskAbort(L0_41)
      L1_42 = Mv_safeTaskAbort(L1_42)
      Fn_findNpc("hum_11"):turn(_puppet_tbl.hum_12)
      repeat
        wait()
      until Fn_findNpc("hum_11"):isTurnEnd()
      Fn_playMotionNpc("hum_11", {
        "talk_00",
        "talk_01",
        "talk_02"
      }, false)
      Fn_playMotionNpc("hum_12", {
        "talk_01",
        "talk_03",
        "talk_03"
      }, false)
      print("\n\n\n\n\n\n_PHASE03\228\188\154\232\169\177\231\181\130\228\186\134\n\n" .. _in_area_num)
    elseif _in_area_num == PHASE3 then
      while Fn_getDistanceToPlayer(_puppet_tbl.hum_20:getWorldPos()) > PHASE3_DIST do
        wait()
      end
      L0_41 = Fn_moveNpc("hum_20", {
        "locator2_target_20_pos_01"
      }, {
        runLength = -1,
        arrivedLength = 1,
        recast = true
      })
      while Fn_get_distance(_puppet_tbl.hum_20:getWorldPos(), _puppet_tbl.hum_19:getWorldPos()) > 3 do
        wait()
      end
      Fn_findNpc("hum_19"):turn(_puppet_tbl.hum_20)
      repeat
        wait()
      until Fn_findNpc("hum_19"):isTurnEnd()
      Fn_playMotionNpc("hum_19", "greeting", false)
      Fn_findNpc("hum_18"):turn(_puppet_tbl.hum_18)
      repeat
        wait()
      until Fn_findNpc("hum_18"):isTurnEnd()
      Fn_playMotionNpc("hum_18", "greeting", false)
      while L0_41:isRunning() do
        wait()
      end
      L0_41 = Mv_safeTaskAbort(L0_41)
      Fn_playMotionNpc("hum_20", "greeting", false)
      Fn_findNpc("hum_19"):turn(_puppet_tbl.hum_20)
      repeat
        wait()
      until Fn_findNpc("hum_19"):isTurnEnd()
      Fn_playMotionNpc("hum_18", {
        "talk_00",
        "talk_02",
        "talk_03"
      }, false)
      Fn_playMotionNpc("hum_19", {
        "talk_01",
        "talk_00",
        "talk_02"
      }, false)
      Fn_playMotionNpc("hum_20", {
        "talk_02",
        "talk_01",
        "talk_00"
      }, false)
      print("\n\n\n\n\n\n_PHASE04\228\188\154\232\169\177\231\181\130\228\186\134\n\n" .. _in_area_num)
    elseif _in_area_num == PHASE4 then
      while Fn_getDistanceToPlayer(_puppet_tbl.hum_23:getWorldPos()) > PHASE4_DIST do
        wait()
      end
      print("\n\227\131\149\227\130\167\227\131\188\227\130\18604\227\129\174\231\167\187\229\139\149\233\150\139\229\167\139\n")
      L0_41 = Fn_moveNpc("hum_23", {
        "locator2_target_23_pos_01"
      }, {arrivedLength = 0.2, recast = true})
      while L0_41:isRunning() do
        while _warikomi_flag.hum_23 == true do
          wait()
        end
        wait()
      end
      L0_41 = Mv_safeTaskAbort(L0_41)
      Fn_playMotionNpc("hum_23", {
        "lookaround",
        "lookaround",
        "lookaround"
      }, false)
      print("\n\n\n\n\n\n_PHASE05\228\188\154\232\169\177\231\181\130\228\186\134\n\n" .. _in_area_num)
    elseif _in_area_num == PHASE5 then
    end
  end)
end
function HumActingCheck(A0_43)
  local L1_44
  L1_44 = {
    "hum_01",
    "hum_02",
    "hum_06",
    "hum_09",
    "hum_11",
    "hum_12",
    "hum_18",
    "hum_19",
    "hum_20",
    "hum_23",
    "hum_35"
  }
  for _FORV_5_ = 1, #L1_44 do
    if A0_43 == L1_44[_FORV_5_] then
      return true
    end
  end
  return _FOR_
end
function invokeAfterMotion(A0_45)
  invokeTask(function()
    local L0_46, L1_47, L2_48, L3_49, L4_50, L5_51
    L0_46[L1_47] = true
    if L0_46 == "hum_35" then
      L0_46.dog_35 = true
    end
    L0_46(L1_47)
    L3_49 = true
    L0_46(L1_47, L2_48, L3_49)
    if L0_46 == false then
      for L3_49, L4_50 in L0_46(L1_47) do
        L5_51 = A0_45
        if L5_51 == L4_50.name then
          L5_51 = Fn_findNpc
          L5_51 = L5_51(A0_45)
          L5_51 = L5_51.turn
          L5_51(L5_51, L4_50.turn)
        end
      end
    else
      for L3_49, L4_50 in L0_46(L1_47) do
        L5_51 = A0_45
        if L5_51 == L4_50.name then
          L5_51 = L4_50.mokuteki
          if L5_51 ~= nil then
            L5_51 = waitSeconds
            L5_51(1.5)
            L5_51 = Fn_get_distance
            L5_51 = L5_51(_puppet_tbl[A0_45]:getWorldPos(), findGameObject2("Node", L4_50.mokuteki):getWorldPos())
            if L5_51 > 1.8 then
              L5_51 = nil
              if A0_45 == "hum_35" then
              elseif A0_45 ~= "hum_20" then
                L5_51 = Fn_moveNpc(A0_45, {
                  L4_50.mokuteki
                }, {arrivedLength = 1.3, recast = true})
              else
                L5_51 = Fn_moveNpc(A0_45, {
                  L4_50.mokuteki
                }, {
                  runLength = -1,
                  arrivedLength = 1,
                  recast = true
                })
              end
              while L5_51:isRunning() do
                wait()
              end
            end
          end
          L5_51 = Fn_turnNpc
          L5_51(L4_50.name, L4_50.turn)
        end
      end
    end
    repeat
      L0_46()
    until L0_46
    for L3_49, L4_50 in L0_46(L1_47) do
      L5_51 = L4_50.name
      if L5_51 == A0_45 then
        L5_51 = Fn_playMotionNpc
        L5_51(L4_50.name, L4_50.motion, false)
      end
    end
    L0_46[L1_47] = false
    if L0_46 == "hum_35" then
      L0_46.dog_35 = false
    end
  end)
end
function RunningNpc()
  local L0_52, L1_53, L2_54, L3_55, L4_56, L5_57
  L0_52 = 2
  L1_53 = {}
  L1_53.runLength = -1
  L1_53.recast = true
  L1_53.loop = false
  L1_53.arrivedLength = 1
  L2_54 = {
    L3_55,
    L4_56,
    L5_57,
    "locator2_npc_move_04",
    "locator2_npc_move_05",
    "locator2_npc_move_06",
    "locator2_npc_move_07",
    "locator2_npc_move_08"
  }
  L3_55 = "locator2_npc_move_01"
  L4_56 = "locator2_npc_move_02"
  L5_57 = "locator2_npc_move_03"
  L3_55 = nil
  L4_56 = invokeTask
  function L5_57()
    while _end_flag == false do
      if L0_52 >= 8 then
        L0_52 = 1
      end
      if Fn_findNpc("hum_35") ~= nil then
        L3_55 = Fn_moveNpc("hum_35", L2_54[L0_52], L1_53)
        do break end
        do break end
        print("\n\227\131\169\227\131\179\227\131\139\227\131\179\227\130\176\233\150\139\229\167\139" .. tostring(L3_55:isRunning()))
        while L3_55:isRunning() do
          if _warikomi_flag.hum_35 == true then
            while _warikomi_flag.hum_35 == true do
              wait()
            end
            L3_55 = Mv_safeTaskAbort(L3_55)
            L3_55 = Fn_moveNpc("hum_35", L2_54[L0_52], L1_53)
          end
          wait()
        end
        L3_55 = Mv_safeTaskAbort(L3_55)
        print("\n\227\131\169\227\131\179\227\131\139\227\131\179\227\130\176\231\181\130\228\186\134")
        L0_52 = L0_52 + 1
      end
      if Fn_findNpc("hum_35") ~= nil then
        Fn_playMotionNpc("hum_35", "breath_in_00", true)
        Fn_playMotionNpc("hum_35", "breath_00", true)
        Fn_playMotionNpc("hum_35", "breath_out_00", true)
        print("\n\227\131\169\227\131\179\227\131\139\227\131\179\227\130\176\229\190\140\227\129\174\230\129\175\229\136\135\227\130\140")
      end
    end
  end
  L4_56 = L4_56(L5_57)
  L5_57 = invokeTask
  L5_57 = L5_57(function()
    local L0_58, L1_59, L2_60
    L0_58 = {
      L1_59,
      L2_60,
      "locator2_dog_move_03",
      "locator2_dog_move_04",
      "locator2_dog_move_05",
      "locator2_dog_move_06",
      "locator2_dog_move_07",
      "locator2_dog_move_08"
    }
    L1_59 = "locator2_dog_move_01"
    L2_60 = "locator2_dog_move_02"
    L1_59 = {}
    L1_59.runLength = -1
    L1_59.recast = true
    L1_59.loop = false
    L1_59.arrivedLength = 0.3
    L2_60 = nil
    while _end_flag == false do
      while L3_55 == nil do
        wait()
      end
      waitSeconds(0.5)
      if Fn_findNpc("dog_35") ~= nil then
        L2_60 = Fn_moveNpc("dog_35", L0_58[L0_52], L1_53)
        do break end
        do break end
        while L2_60:isRunning() do
          if _warikomi_flag.hum_35 == true then
            Fn_moveNpc("dog_35", {
              _puppet_tbl.dog_35:getWorldPos()
            }, L1_53)
            while _warikomi_flag.hum_35 == true do
              wait()
            end
            L2_60 = Mv_safeTaskAbort(L2_60)
            while Fn_get_distance(_puppet_tbl.dog_35:getWorldPos(), _puppet_tbl.hum_35:getWorldPos()) < 1.8 do
              wait()
            end
            L2_60 = Fn_moveNpc("dog_35", L0_58[L0_52], L1_53)
          end
          wait()
        end
        if Fn_findNpc("dog_35") ~= nil then
          Fn_moveNpc("dog_35", {
            _puppet_tbl.dog_35:getWorldPos()
          }, L1_53)
          L2_60 = Mv_safeTaskAbort(L2_60)
        end
      end
      if Fn_findNpc("dog_35") ~= nil then
        Fn_playMotionNpc("dog_35", "stay", true)
        waitSeconds(1)
      end
    end
  end)
  return L4_56, L5_57
end
