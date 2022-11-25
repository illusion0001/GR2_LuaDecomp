import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/perceivable_npc.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_next_phase = false
_puppet_tbl = {}
_hdl_tbl = {}
_is_found_sensor_enter = false
_is_house_sensor_enter = false
_is_area_distant = false
_sneak_step = 1
_client_sneak_task = nil
_client_move_task = nil
_customer_move_task = nil
_is_suspect_move_end = false
_is_coution_cap = false
_has_been_seen = false
_move_option = {
  anim_walk_speed = 1,
  runLength = 1000,
  arrivedLength = 0,
  navimesh = true,
  noTurn = true,
  recast = true,
  loop = false
}
_kit_insight = true
_sneak = {
  perceivable_npc = nil,
  move_index = -1,
  remain_move_index = -1,
  retry_found = false,
  retry_lost = false
}
_script_ship = {
  ship = nil,
  pos_route_tbl = nil,
  route_object = nil
}
_cap_count = 0
_mnavi = nil
_is_navi_view = false
function Initialize()
  local L0_0, L1_1
  L0_0 = {
    L1_1,
    {
      name = "sm36_regular",
      type = "thief",
      node = "locator2_regular_b",
      attach = false,
      reset = false
    },
    {
      name = "sm36_customer",
      type = "man25",
      node = "locator2_customer_b",
      attach = false,
      reset = false
    },
    {
      name = "sm36_sales_person",
      type = "wom45",
      node = "locator2_sales_person_b",
      reset = false
    },
    {
      name = "sm36_run_down_child",
      type = "chi19",
      node = "locator2_run_down_child_b_start_01",
      active = false,
      color_variation = 3
    },
    {
      name = "sm36_run_child_01",
      type = "chi19",
      node = "locator2_run_child_01_b_start_01",
      active = false,
      color_variation = 2
    },
    {
      name = "sm36_run_child_02",
      type = "chi20",
      node = "locator2_run_child_02_b_start_01",
      active = false,
      color_variation = 1
    },
    {
      name = "sm36_suspect",
      type = "man26",
      node = "locator2_suspect_b",
      active = false
    }
  }
  L1_1.name = "sm36_regular"
  L1_1.type = "man02"
  L1_1.node = "locator2_regular_b"
  L1_1.attach = false
  L1_1.reset = false
  L1_1(L0_0)
  for _FORV_4_, _FORV_5_ in L1_1(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _hdl_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _sdemo_cut01 = L1_1
  _puppet_tbl.sm36_regular:appendChild(L1_1, true)
  Fn_pcSensorOff("pccubesensor2_regular_lookaround_b")
  Fn_pcSensorOff("pccubesensor2_near_listen_01")
  Fn_pcSensorOff("pccubesensor2_near_listen_02")
  Fn_pcSensorOff("pccubesensor2_house_01")
  Fn_pcSensorOff("pccubesensor2_house_02")
  Fn_pcSensorOff("pccubesensor2_found_01")
  Fn_pcSensorOff("pccubesensor2_found_02")
  Fn_pcSensorOff("pccubesensor2_area_distant_b_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_b_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_b_02")
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "ScriptDebugDraw"
  }, true)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16
  L0_2 = Fn_warpNpc
  L1_3 = "sm36_client"
  L2_4 = "locator2_client_b"
  L0_2(L1_3, L2_4)
  L0_2 = {
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  }
  L1_3 = Vector
  L2_4 = 0
  L3_5 = 0
  L1_3 = L1_3(L2_4, L3_5, L4_6)
  L2_4 = Vector
  L3_5 = 1
  L12_14 = L2_4(L3_5, L4_6, L5_7)
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[2] = L2_4
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[3] = L3_5
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[4] = L4_6
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[5] = L5_7
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[6] = L6_8
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[7] = L7_9
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[8] = L8_10
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[9] = L9_11
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[10] = L10_12
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[11] = L11_13
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[12] = L12_14
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[13] = L13_15
  ;({
    L1_3,
    [15] = L2_4(L3_5, L4_6, L5_7)
  })[14] = L14_16
  L1_3 = Fn_sendEventComSb
  L2_4 = "requestCreateShip"
  L3_5 = "locator2_ship_com_b"
  L1_3(L2_4, L3_5)
  L1_3 = nil
  repeat
    L2_4 = Fn_sendEventComSb
    L3_5 = "getShipHandle"
    L2_4 = L2_4(L3_5)
    L1_3 = L2_4
    L2_4 = wait
    L2_4()
  until L1_3 ~= nil
  L2_4 = Fn_missionStart
  L2_4()
  L2_4 = Fn_sendEventComSb
  L3_5 = "isCreatedBox"
  L2_4 = L2_4(L3_5)
  if not L2_4 then
    L2_4 = Fn_sendEventComSb
    L3_5 = "requestBoxSpawn"
    L2_4(L3_5)
  end
  L2_4 = Fn_userCtrlOn
  L2_4()
  L2_4 = Fn_missionView
  L3_5 = "sm36_01000"
  L2_4(L3_5)
  L2_4 = Fn_pcSensorOn
  L3_5 = "pccubesensor2_regular_lookaround_b"
  L2_4(L3_5)
  L2_4 = Fn_pcSensorOn
  L3_5 = "pccubesensor2_house_01"
  L2_4(L3_5)
  L2_4 = Fn_pcSensorOn
  L3_5 = "pccubesensor2_house_02"
  L2_4(L3_5)
  suspect_move_task = nil
  L2_4 = {
    L3_5,
    L4_6,
    L5_7,
    L6_8,
    L7_9,
    L8_10
  }
  L3_5 = "locator2_customer_path_b_01"
  L7_9 = "locator2_customer_path_b_05"
  L8_10 = "locator2_customer_path_b_06"
  customer_path_tbl = L2_4
  L2_4 = Fn_moveNpc
  L3_5 = "sm36_customer"
  L5_7.anim_walk_speed = 1.2
  L5_7.anim_speed_over = true
  L5_7.runLength = 1000
  L5_7.recast = true
  L2_4 = L2_4(L3_5, L4_6, L5_7)
  customer_move_task = L2_4
  regular_move_task = nil
  L2_4 = createSneakTarget
  L2_4()
  L2_4 = CautionLevel
  L2_4 = L2_4.setLabel
  L3_5 = "sm36_01020"
  L2_4(L3_5)
  L2_4 = CautionLevel
  L2_4 = L2_4.drawTask
  L2_4()
  L2_4 = false
  _thread_sneak_task = nil
  client_sneak_task = nil
  L3_5 = {}
  motion_task_tbl = L3_5
  run_down_child_pop_num = -1
  is_regular_move_end = false
  L3_5 = HUD
  L3_5 = L3_5.mnaviNew
  L5_7.name = "regular_navi"
  L5_7.PochFadeLen0 = 0
  L5_7.PochFadeLen100 = -1
  L3_5 = L3_5(L4_6, L5_7)
  _mnavi = L3_5
  L3_5 = _mnavi
  L3_5 = L3_5.setTarget
  L3_5(L4_6, L5_7)
  L3_5 = _mnavi
  L3_5 = L3_5.setActive
  L3_5(L4_6, L5_7)
  L3_5 = invokeTask
  L3_5(L4_6)
  L3_5 = start_game_obj
  L3_5()
  L3_5 = invokeTask
  L3_5 = L3_5(L4_6)
  while not L2_4 do
    if L4_6 then
      if not L4_6 then
        if L4_6 then
          if not L4_6 then
            L2_4 = true
            break
          end
        end
      end
    end
    if L4_6 == nil then
      _thread_sneak_task = L4_6
    end
    if not L4_6 then
    elseif L4_6 then
      L4_6(L5_7)
      if not L4_6 then
      else
        if L4_6 == L5_7 then
          L4_6(L5_7, L6_8)
      end
      elseif L4_6 ~= L5_7 then
      elseif L4_6 == L5_7 then
        L4_6()
      end
      _thread_sneak_task = L4_6
      L4_6(L5_7, L6_8)
      for L7_9 = 1, #L5_7 do
        L8_10 = Mv_safeTaskAbort
        L9_11 = motion_task_tbl
        L9_11 = L9_11[L7_9]
        L8_10(L9_11)
      end
      if L4_6 then
        L4_6(L5_7)
        L4_6()
        L5_7(L6_8)
        L5_7(L6_8)
        L7_9 = "surprise"
        L8_10 = true
        L5_7(L6_8, L7_9, L8_10)
        L7_9 = "talk_angry_00"
        L8_10 = false
        L5_7(L6_8, L7_9, L8_10)
        L7_9 = "m31_914a"
        L8_10 = 0.5
        L9_11 = ""
        L10_12 = _puppet_tbl
        L10_12 = L10_12.sm36_regular
        L5_7(L6_8, L7_9, L8_10, L9_11, L10_12)
        repeat
          L5_7()
        until not L5_7
        L5_7(L6_8)
      elseif L4_6 then
        L4_6(L5_7)
        L4_6(L5_7)
      end
      L4_6()
      L4_6(L5_7, L6_8)
      L4_6(L5_7, L6_8)
    end
    L4_6()
  end
  L4_6(L5_7)
  L4_6(L5_7, L6_8)
  L4_6(L5_7)
  L4_6()
  if L3_5 ~= nil then
    L4_6(L5_7)
    L3_5 = nil
  end
  _thread_sneak_task = L4_6
  L4_6(L5_7)
  L4_6(L5_7)
  L4_6(L5_7)
  L4_6(L5_7, L6_8)
  L7_9 = false
  L4_6(L5_7, L6_8, L7_9)
  L4_6(L5_7, L6_8)
  L4_6(L5_7)
  L4_6(L5_7)
  L4_6(L5_7)
  L7_9 = L5_7
  L8_10 = "suspect_face"
  L6_8(L7_9, L8_10)
  L7_9 = L5_7
  L8_10 = Vector
  L9_11 = -1
  L10_12 = 1.5
  L11_13 = 0
  L8_10 = L8_10(L9_11, L10_12, L11_13)
  L8_10 = L4_6 + L8_10
  L6_8(L7_9, L8_10)
  L7_9 = L5_7
  L6_8(L7_9)
  L7_9 = L5_7
  L6_8(L7_9)
  L7_9 = L5_7
  L6_8(L7_9)
  L7_9 = L5_7
  L6_8(L7_9)
  L8_10 = L6_8
  L7_9 = L6_8.setCollidable
  L9_11 = false
  L7_9(L8_10, L9_11)
  L8_10 = L6_8
  L7_9 = L6_8.setVisible
  L9_11 = false
  L7_9(L8_10, L9_11)
  L7_9 = Fn_setCatActive
  L8_10 = false
  L7_9(L8_10)
  L7_9 = "locator2_find_demo_cam_01"
  L8_10 = "locator2_pc_reset_pos_b_listen_01"
  L9_11 = Fn_getDistanceToPlayer
  L10_12 = "locator2_pc_reset_pos_b_listen_01"
  L9_11 = L9_11(L10_12)
  L10_12 = Fn_getDistanceToPlayer
  L11_13 = "locator2_pc_reset_pos_b_listen_02"
  L10_12 = L10_12(L11_13)
  if L9_11 > L10_12 then
    L8_10 = "locator2_pc_reset_pos_b_listen_02"
    L7_9 = "locator2_find_demo_cam_02"
  end
  L10_12 = _sdemo_cut01
  L11_13 = L10_12
  L10_12 = L10_12.set
  L12_14 = L7_9
  L10_12(L11_13, L12_14, L13_15, L14_16)
  L10_12 = _sdemo_cut01
  L11_13 = L10_12
  L10_12 = L10_12.play
  L10_12(L11_13)
  L10_12 = _sdemo_cut01
  L11_13 = L10_12
  L10_12 = L10_12.zoomIn
  L12_14 = 1
  L13_15.deg = 15
  L10_12(L11_13, L12_14, L13_15, L14_16)
  L10_12 = Player
  L11_13 = L10_12
  L10_12 = L10_12.setStay
  L12_14 = true
  L10_12(L11_13, L12_14)
  L10_12 = Fn_resetPcPos
  L11_13 = L8_10
  L10_12(L11_13)
  L10_12 = {L11_13, L12_14}
  L11_13 = {}
  L11_13.name = "sm36_suspect"
  L11_13.node = "locator2_suspect_reset_pos_b"
  L11_13.motion = "talk_02"
  L12_14 = {}
  L12_14.name = "sm36_regular"
  L12_14.node = "locator2_regular_reset_pos_b"
  L12_14.motion = "talk_01"
  L11_13 = waitSeconds
  L12_14 = 2
  L11_13(L12_14)
  L11_13 = Fn_kaiwaDemoView
  L12_14 = "sm36_01000k"
  L11_13(L12_14)
  L12_14 = L6_8
  L11_13 = L6_8.setCollidable
  L11_13(L12_14, L13_15)
  L12_14 = L6_8
  L11_13 = L6_8.setVisible
  L11_13(L12_14, L13_15)
  L11_13 = Fn_setCatActive
  L12_14 = true
  L11_13(L12_14)
  L11_13 = Player
  L12_14 = L11_13
  L11_13 = L11_13.setStay
  L11_13(L12_14, L13_15)
  L11_13 = Camera
  L12_14 = L11_13
  L11_13 = L11_13.lookTo
  L11_13(L12_14, L13_15, L14_16, 0)
  L11_13 = _sdemo_cut01
  L12_14 = L11_13
  L11_13 = L11_13.stop
  L11_13(L12_14, L13_15)
  L11_13 = Fn_pcSensorOn
  L12_14 = "pccubesensor2_near_listen_01"
  L11_13(L12_14)
  L11_13 = Fn_pcSensorOn
  L12_14 = "pccubesensor2_near_listen_02"
  L11_13(L12_14)
  L11_13 = Fn_pcSensorOn
  L12_14 = "pccubesensor2_found_01"
  L11_13(L12_14)
  L11_13 = Fn_pcSensorOn
  L12_14 = "pccubesensor2_found_02"
  L11_13(L12_14)
  L11_13 = Fn_pcSensorOn
  L12_14 = "pccubesensor2_area_distant_b_01"
  L11_13(L12_14)
  L11_13 = Fn_pcSensorOn
  L12_14 = "pccubesensor2_catwarp_b_01"
  L11_13(L12_14)
  L11_13 = Fn_pcSensorOn
  L12_14 = "pccubesensor2_catwarp_b_02"
  L11_13(L12_14)
  L11_13 = Fn_setCatWarpCheckPoint
  L12_14 = L8_10
  L11_13(L12_14)
  L11_13 = warningAreaDistant
  L12_14 = "sm36_01016"
  L11_13 = L11_13(L12_14, L13_15)
  L2_4 = false
  is_retry = false
  L12_14 = false
  L13_15(L14_16)
  while not L2_4 do
    if L12_14 == false then
      L12_14 = true
      L13_15(L14_16)
      L13_15(L14_16)
    end
    if L13_15 then
      if L13_15 <= 10 then
        L13_15()
        _is_navi_view = false
      end
    end
    if L13_15 then
      L13_15(L14_16)
      L2_4 = true
      while true do
        if L13_15 then
          L2_4 = false
          L13_15()
        end
      end
    end
    L13_15()
  end
  L13_15(L14_16)
  L13_15(L14_16, true)
  L13_15(L14_16)
  L13_15(L14_16)
  L13_15(L14_16)
  L13_15(L14_16)
  L13_15(L14_16)
  L13_15(L14_16)
  L13_15(L14_16)
  for _FORV_16_, _FORV_17_ in L13_15(L14_16) do
    Mv_safeTaskAbort(motion_task_tbl[_FORV_16_])
    Fn_playMotionNpc(_FORV_17_.name, "stay", false)
  end
  regular_move_task = L14_16
  L14_16(1)
  suspect_move_task = Fn_moveNpc("sm36_suspect", L14_16, {
    runLength = -1,
    recast = false,
    navimesh = false
  })
  while suspect_move_task:isRunning() do
    wait()
  end
  Fn_turnNpc("sm36_suspect", "locator2_suspect_ride_path_b_turn")
  Fn_kaiwaDemoView("sm36_01200k")
  Fn_userCtrlOff()
  Player:setStay(false)
  Mv_viewObj(findGameObject2("Node", "locator2_ship_b"))
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_17, L1_18
end
function sneakRetry()
  local L0_19
  L0_19 = print
  L0_19("\227\131\170\227\131\136\227\131\169\227\130\164  _sneak_step:", _sneak_step)
  function L0_19()
    Fn_setNpcActive("sm36_run_down_child", false)
    Mv_safeTaskAbort(run_down_child_move_task)
    Mv_safeTaskAbort(run_down_child_motion_task)
    Fn_setNpcActive("sm36_run_child_01", false)
    Mv_safeTaskAbort(child_01_move_task)
    Mv_safeTaskAbort(child_01_motion_task)
    Fn_setNpcActive("sm36_run_child_02", false)
    Mv_safeTaskAbort(child_02_move_task)
    Mv_safeTaskAbort(child_02_motion_task)
    Mv_safeTaskAbort(child_run_down_task)
    createSneakTarget()
    print("_sneak_setting", _sneak_setting[_sneak_setting[_sneak_step].retry_target_step].retry_regular_reset_pos)
    Fn_warpNpc("sm36_regular", _sneak_setting[_sneak_setting[_sneak_step].retry_target_step].retry_regular_reset_pos)
    Fn_playMotionNpc("sm36_regular", "stay", false)
    Fn_sendEventComSb("requestResetBox")
    if _sneak_setting[_sneak_step].retry_target_step <= 1 then
      Mv_safeTaskAbort(customer_move_task)
      Fn_playMotionNpc("sm36_customer", "stay", false)
      Mv_safeTaskAbort(client_move_task)
      Fn_playMotionNpc("sm36_client", "stay", false)
      Mv_safeTaskAbort(suspect_move_task)
      Fn_setNpcActive("sm36_suspect", false)
      wait()
      Fn_setNpcActive("sm36_customer", true)
      Fn_setNpcActive("sm36_client", true)
      Fn_warpNpc("sm36_customer", "locator2_customer_b")
      Fn_warpNpc("sm36_client", "locator2_client_b")
    end
    if _sneak_step >= #_sneak_setting then
      Fn_setNpcActive("sm36_suspect", true)
      Fn_warpNpc("sm36_suspect", "locator2_suspect_b")
      _is_suspect_move_end = true
    else
      _is_suspect_move_end = false
    end
    Fn_captionViewEnd()
  end
  print("step", _sneak_setting[_sneak_step].retry_target_step)
  _sneak_step = _sneak_setting[_sneak_step].retry_target_step
  print("retry_pc_reset_pos", _sneak_setting[_sneak_step].retry_pc_reset_pos)
  Fn_sceneConversion(_sneak_setting[_sneak_step].retry_pc_reset_pos, L0_19)
  Player:setStay(false)
  Fn_userCtrlOn()
  for _FORV_4_ = 1, #motion_task_tbl do
    Mv_safeTaskAbort(motion_task_tbl[_FORV_4_])
  end
  customer_move_task = Fn_moveNpc("sm36_customer", customer_path_tbl, {
    anim_walk_speed = 1.2,
    anim_speed_over = true,
    runLength = 1000,
    recast = true
  })
  Mv_safeTaskAbort(client_sneak_task)
  _thread_sneak_task = nil
  run_down_child_pop_num = -1
  _cap_count = 0
  is_regular_move_end = false
  _has_been_seen = false
  _sneak.retry_found = false
  _sneak.retry_lost = false
end
function getObjectPosition(A0_20, A1_21)
  if A1_21 == "handle" then
    return A0_20:getWorldPos()
  elseif A1_21 == "npc" then
    return Fn_findNpcPuppet(A0_20):getWorldPos()
  elseif A1_21 == "Node" then
    return findGameObject2("Node", A0_20):getWorldPos()
  else
    return nil
  end
end
function isNearTwoPosition(A0_22, A1_23, A2_24, A3_25, A4_26)
  local L5_27, L6_28
  L5_27 = getObjectPosition
  L6_28 = A0_22
  L5_27 = L5_27(L6_28, A1_23)
  L6_28 = getObjectPosition
  L6_28 = L6_28(A2_24, A3_25)
  if L5_27 ~= nil and L6_28 ~= nil then
    if A4_26 > Fn_get_distance(L5_27, L6_28) then
      return true
    else
      return false
    end
  else
    return false
  end
end
function isInsightObject(A0_29, A1_30)
  local L2_31
  if A1_30 == nil then
    L2_31 = Vector
    L2_31 = L2_31(0, 0, 0)
    A1_30 = L2_31
  end
  L2_31 = Camera
  L2_31 = L2_31.getEyePos
  L2_31 = L2_31(L2_31)
  L2_31.y = L2_31.y + 1
  Query:setEyeSightTransform(L2_31)
  Query:setEyeSightAngle(Deg2Rad(360))
  Query:setEyeSightRange(30)
  return true
end
function popNpcOutSight(A0_32, A1_33, A2_34, A3_35)
  local L4_36, L5_37, L6_38, L7_39, L8_40, L9_41
  L4_36 = -1
  L5_37(L6_38, L7_39)
  for L8_40 = 1, A2_34 do
    L9_41 = string
    L9_41 = L9_41.format
    L9_41 = L9_41("%s%02d", A1_33, L8_40)
    print("locator_num", string.format("%s%02d", A1_33, L8_40))
    print("\232\183\157\233\155\162", Fn_getDistanceToPlayer(L9_41))
    if A3_35 < Fn_getDistanceToPlayer(L9_41) then
      print("\232\166\139\227\129\136\227\129\166\227\129\132\227\130\139\227\129\139", isInsightObject(findGameObject2("Node", L9_41)))
      if isInsightObject(findGameObject2("Node", L9_41)) == false then
        L4_36 = L8_40
        Fn_warpNpc(A0_32, L9_41)
        print("NPC\229\135\186\231\143\190:" .. A0_32, "\227\131\173\227\130\177\227\131\188\227\130\191\227\131\188:" .. L9_41)
        break
      end
    end
  end
  if L4_36 == -1 then
    L5_37(L6_38, L7_39)
  end
  return L4_36
end
function warningAreaDistant(A0_42, A1_43)
  task = invokeTask(function()
    while true do
      if _is_area_distant then
        if A1_43 ~= nil then
          if type(A1_43) == "string" then
            Fn_naviSet(findGameObject2("Node", A1_43))
          else
            Fn_naviSet(A1_43)
          end
          _is_navi_view = true
        end
        if is_enable_navi_set then
          Fn_naviSet(target_view_obj)
          _is_navi_view = true
        end
        Fn_captionViewWait(A0_42)
        while _is_area_distant do
          wait()
        end
      end
      wait()
    end
  end)
  return task
end
function pccubesensor2_house_OnEnter()
  local L0_44, L1_45
  _is_house_sensor_enter = true
end
function pccubesensor2_house_OnLeave()
  local L0_46, L1_47
  _is_house_sensor_enter = false
end
function warningCatWarp(A0_48, A1_49)
  invokeTask(function()
    print("================\232\173\166\229\145\138\227\130\168\227\131\170\227\130\162\231\170\129\231\160\180================")
    Player:setStay(true)
    if A0_48 ~= nil then
      Fn_naviSet(findGameObject2("Node", A0_48))
    end
    if A1_49 ~= nil then
      Fn_captionViewLock(A1_49)
    else
      Fn_captionViewLock("sm36_01025")
    end
    Player:setStay(false)
  end)
end
function pccubesensor2_found_OnEnter()
  local L0_50, L1_51
  _is_found_sensor_enter = true
end
function pccubesensor2_found_OnLeave()
  local L0_52, L1_53
  _is_found_sensor_enter = false
end
function pccubesensor2_near_listen_OnEnter()
  local L0_54, L1_55
  _next_phase = true
end
function pccubesensor2_near_listen_OnLeave()
  local L0_56, L1_57
  _next_phase = false
end
function pccubesensor2_area_distant_OnEnter()
  local L0_58, L1_59
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  local L0_60, L1_61
  _is_area_distant = true
end
function pccubesensor2_catwarp_b_01_OnEnter()
  local L0_62, L1_63
end
function pccubesensor2_catwarp_b_01_OnLeave()
  warningCatWarp("locator2_navi_near_listen")
end
function pccubesensor2_catwarp_b_02_OnEnter()
  local L0_64, L1_65
end
function pccubesensor2_catwarp_b_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function createSneakTarget()
  if _sneak.perceivable_npc ~= nil then
    _sneak.perceivable_npc:taskAbort()
    _sneak.perceivable_npc = nil
  end
  _sneak.perceivable_npc = PerceivableNpc.new("sm36_regular")
  _sneak.perceivable_npc:setMoveOption(_move_option)
  _sneak.perceivable_npc:setChangeRouteImmediately(false)
  _sneak.perceivable_npc:setDismissMotion("reply_no")
  _sneak.perceivable_npc:setSightParam(60, 12)
  _sneak.perceivable_npc:setCautionCoefficient(1, 1)
  _sneak.perceivable_npc:setOnChangeState(sneakTargetCallback)
  _sneak.perceivable_npc:setCombatReady(false)
  _sneak.perceivable_npc:setChaseMode(false)
  _sneak.perceivable_npc:setLoop(false)
  _sneak.perceivable_npc:setStayMotion("stay")
  _sneak.perceivable_npc:setIndicationRange(5)
  _sneak.perceivable_npc:setIndicationCoefficient(1, 1)
  _sneak.perceivable_npc:setTerminate(true)
  _sneak.perceivable_npc:setDamageType(0)
  _sneak.perceivable_npc:setIndicationEnable(true)
  _sneak.perceivable_npc:setAlertRange(0.5)
  _sneak.perceivable_npc:action()
  CautionLevel.setNpc({
    _sneak.perceivable_npc
  })
end
function sneakTargetCallback(A0_66, A1_67)
  print("sneakTargetCallback reason:", A1_67)
  print("_sneak.perceivable_npc.status:", _sneak.perceivable_npc.status)
  if A1_67 == CALLBACK_REASON.IS_INSIGHT then
    print("\232\166\150\231\149\140\227\129\171\230\141\137\227\129\136\227\129\159")
    Fn_captionView("sm36_01021")
    _has_been_seen = true
  elseif A1_67 == CALLBACK_REASON.LISTENED then
    print("\231\137\169\233\159\179\227\130\146\232\129\158\227\129\132\227\129\159")
  elseif A1_67 == CALLBACK_REASON.FEEL_INDICATION then
    print("\230\176\151\233\133\141\227\130\146\230\132\159\227\129\152\227\129\159")
  elseif A1_67 == CALLBACK_REASON.DAMAGED then
    print("\230\148\187\230\146\131\227\130\146\229\143\151\227\129\145\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  elseif A1_67 == CALLBACK_REASON.INDICATION_OVERFLOW then
    print("\230\176\151\233\133\141\229\186\166\227\129\140MAX\227\129\171\227\129\170\227\129\163\227\129\159")
  elseif A1_67 == CALLBACK_REASON.NO_INDICATION then
    print("\230\176\151\233\133\141\229\186\166\227\129\1400\227\129\171\227\129\170\227\129\163\227\129\159")
  elseif A1_67 == CALLBACK_REASON.CAUTION_OVERFLOW then
    print("\232\173\166\230\136\146\229\186\166\227\129\140MAX\227\129\171\227\129\170\227\129\163\227\129\159")
    _sneak.retry_found = true
  elseif A1_67 == CALLBACK_REASON.TARET_CAPTURE then
    print("\232\135\179\232\191\145\232\183\157\233\155\162\227\129\171\229\133\165\227\129\163\227\129\159")
  elseif A1_67 == CALLBACK_REASON.NO_CAUTION then
    print("\232\173\166\230\136\146\229\186\166\227\129\1400\227\129\171\227\129\170\227\129\163\227\129\159")
    Fn_captionView("sm36_01022")
    _has_been_seen = false
  elseif A1_67 == CALLBACK_REASON.LOST_TARGET then
    print("NPC\227\129\140\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\232\166\139\229\164\177\227\129\163\227\129\159")
  end
end
_sneak_setting = {
  {
    target_move_path = {
      {
        pos = "locator2_regular_path_b_01",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_02",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_03",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_04",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_05",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_06",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_07",
        opt = nil
      }
    },
    move_end_action = "lookaround",
    move_end_motion = "lookaround_01",
    retry_target_step = 1,
    retry_pc_reset_pos = "locator2_pc_start_pos",
    retry_regular_reset_pos = "locator2_regular_b"
  },
  {
    target_move_path = {
      {
        pos = "locator2_regular_path_b_08",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_09",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_10",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_11",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_12",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_13",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_14",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_15",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_16",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_17",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_18",
        opt = nil
      }
    },
    move_end_action = "child_run_down",
    move_end_motion = "stay",
    retry_target_step = 2,
    retry_pc_reset_pos = "locator2_pc_reset_pos_b_01",
    retry_regular_reset_pos = "locator2_regular_path_b_07"
  },
  {
    target_move_path = {
      {
        pos = "locator2_regular_path_b_18",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_19",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_20",
        opt = nil
      }
    },
    move_end_action = "lookaround",
    move_end_motion = "lookaround_01",
    retry_target_step = 3,
    retry_pc_reset_pos = "locator2_pc_reset_pos_b_02",
    retry_regular_reset_pos = "locator2_regular_path_b_17"
  },
  {
    target_move_path = {
      {
        pos = "locator2_regular_path_b_21",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_22",
        opt = nil
      },
      {
        pos = "locator2_regular_path_b_23",
        opt = nil
      }
    },
    move_end_action = "suspect",
    move_end_motion = "stay",
    retry_target_step = 4,
    retry_pc_reset_pos = "locator2_pc_reset_pos_b_04",
    retry_regular_reset_pos = "locator2_regular_path_b_21"
  }
}
function regularMove(A0_68)
  local L1_69
  L1_69 = print
  L1_69("\231\167\187\229\139\149\229\135\166\231\144\134", _sneak_setting[A0_68].move_end_action)
  L1_69 = _sneak
  L1_69 = L1_69.perceivable_npc
  L1_69 = L1_69.setPosList
  L1_69(L1_69, _sneak_setting[A0_68].target_move_path)
  L1_69 = _sneak
  L1_69 = L1_69.perceivable_npc
  L1_69 = L1_69.setStayMotion
  L1_69(L1_69, _sneak_setting[A0_68].move_end_motion)
  L1_69 = _sneak_setting
  L1_69 = L1_69[A0_68]
  L1_69 = L1_69.retry_pc_reset_pos
  if L1_69 == "locator2_pc_start_pos" then
    L1_69 = invokeTask
    L1_69(function()
      clientSneak()
    end)
  end
  L1_69 = _sneak_setting
  L1_69 = L1_69[A0_68]
  L1_69 = L1_69.move_end_action
  if L1_69 == nil then
    repeat
      L1_69 = wait
      L1_69()
      L1_69 = isRegularMoveEnd
      L1_69 = L1_69(A0_68)
    until L1_69
  else
    L1_69 = _sneak_setting
    L1_69 = L1_69[A0_68]
    L1_69 = L1_69.move_end_action
    if L1_69 == "lookaround" then
      L1_69 = regularLookAround
      L1_69(A0_68)
    else
      L1_69 = _sneak_setting
      L1_69 = L1_69[A0_68]
      L1_69 = L1_69.move_end_action
      if L1_69 == "child_run_down" then
        L1_69 = Fn_get_distance
        L1_69 = L1_69(_puppet_tbl.sm36_regular:getWorldPos(), findGameObject2("Node", "locator2_regular_path_b_15"):getWorldPos())
        while L1_69 >= 2 do
          if not _has_been_seen and A0_68 == 2 then
            if 0 + 1 == 180 then
              if not _is_coution_cap then
                Fn_captionView("sm36_01027")
              end
            elseif 0 + 1 == 900 then
              if not _is_coution_cap then
                Fn_captionView("sm36_01028")
              end
            elseif 0 + 1 == 1700 and not _is_coution_cap then
              Fn_captionView("sm36_01029")
            end
          end
          L1_69 = Fn_get_distance(_puppet_tbl.sm36_regular:getWorldPos(), findGameObject2("Node", "locator2_regular_path_b_15"):getWorldPos())
          wait()
        end
        childRunDown(A0_68)
      else
        L1_69 = _sneak_setting
        L1_69 = L1_69[A0_68]
        L1_69 = L1_69.move_end_action
        if L1_69 == "suspect" then
          L1_69 = suspectAppear
          L1_69(A0_68)
        end
      end
    end
  end
end
function clientSneak()
  local L0_70, L1_71, L2_72
  L0_70 = {L1_71, L2_72}
  L1_71 = "locator2_client_path_b_01"
  L2_72 = "locator2_client_path_b_02"
  L1_71 = {L2_72}
  L2_72 = "locator2_client_path_b_03"
  L2_72 = {
    {
      "locator2_client_path_b_04"
    },
    {
      "locator2_client_path_b_05"
    },
    {
      "locator2_client_path_b_06"
    },
    {
      "locator2_client_path_b_07"
    },
    {
      "locator2_client_path_b_08"
    }
  }
  Mv_safeTaskAbort(_client_sneak_task)
  _client_sneak_task = invokeTask(function()
    Fn_moveNpc("sm36_client", L0_70, {
      runLength = -1,
      recast = true,
      noTurn = false
    })
    repeat
      wait()
    until Fn_findNpc("sm36_client"):isMoveEnd()
    for _FORV_3_ = 1, 5 do
      wait(20)
      Fn_turnNpc("sm36_client", _puppet_tbl.sm36_customer)
    end
    Fn_moveNpc("sm36_client", L1_71, {runLength = -1, recast = true})
    repeat
      wait()
    until Fn_findNpc("sm36_client"):isMoveEnd()
    for _FORV_3_ = 1, 5 do
      wait(20)
      Fn_turnNpc("sm36_client", _puppet_tbl.sm36_customer)
    end
    for _FORV_3_, _FORV_4_ in pairs(L2_72) do
      client_move_task = Fn_moveNpc("sm36_client", L2_72[_FORV_3_], {runLength = -1, recast = true})
      while not Fn_findNpc("sm36_client"):isMoveEnd() do
        wait()
      end
      wait(10)
      Fn_turnNpc("sm36_client", _puppet_tbl.sm36_customer)
      waitSeconds(5)
    end
    while not _hdl_tbl.sm36_customer:isMoveEnd() do
      wait()
    end
    Mv_safeTaskAbort(_customer_move_task)
    Mv_safeTaskAbort(_client_move_task)
    Fn_setNpcActive("sm36_customer", false)
    Fn_setNpcActive("sm36_client", false)
  end)
end
function regularLookAround(A0_73)
  local L1_74, L2_75, L3_76, L4_77, L5_78
  L1_74 = print
  L2_75 = "\229\184\184\233\128\163\227\129\174\227\129\181\227\130\138\227\130\128\227\129\141\229\135\166\231\144\134"
  L1_74(L2_75)
  L1_74 = 360
  L2_75 = 900
  L3_76 = 0
  repeat
    L3_76 = L3_76 + 1
    L4_77 = _has_been_seen
    if not L4_77 then
      if A0_73 == 1 then
        if L3_76 == L1_74 then
          L4_77 = _is_coution_cap
          if not L4_77 then
            L4_77 = Fn_captionView
            L5_78 = "sm36_01030"
            L4_77(L5_78)
          end
        elseif L3_76 == L2_75 then
          L4_77 = _is_coution_cap
          if not L4_77 then
            L4_77 = Fn_captionView
            L5_78 = "sm36_01031"
            L4_77(L5_78)
          end
        end
      elseif A0_73 == 3 and L3_76 == 600 then
        L4_77 = _is_coution_cap
        if not L4_77 then
          L4_77 = Fn_captionView
          L5_78 = "sm36_01032"
          L4_77(L5_78)
        end
      end
    end
    L4_77 = wait
    L4_77()
    L4_77 = isRegularMoveEnd
    L5_78 = A0_73
    L4_77 = L4_77(L5_78)
  until L4_77
  L4_77 = print
  L5_78 = "\231\167\187\229\139\149\231\181\130\228\186\134"
  L4_77(L5_78)
  L4_77 = findGameObject2
  L5_78 = "PlayerSensor"
  L4_77 = L4_77(L5_78, "pccubesensor2_regular_lookaround_b")
  L5_78 = L4_77
  L4_77 = L4_77.getCount
  L4_77 = L4_77(L5_78)
  if L4_77 > 0 then
    L4_77 = {}
    L5_78 = {"sm36_01007", "sm36_01008"}
    L4_77.caption_01 = L5_78
    L5_78 = {
      "sm36_01009",
      "sm36_01010",
      "sm36_01011"
    }
    L4_77.caption_02 = L5_78
    L5_78 = {
      "sm36_01002",
      "sm36_01003",
      "sm36_01004"
    }
    Sound:playSE("m31_903a", 0.5, "", _puppet_tbl.sm36_regular)
    if not _has_been_seen then
      Fn_captionView(L4_77.caption_01[RandI(1, #L4_77.caption_01)])
      waitSeconds(1)
    end
    _sneak.perceivable_npc:setSightParam(80, 14)
    Fn_turnNpc("sm36_regular", 180)
    _sneak.perceivable_npc:setSightParam(60, 12)
    invokeTask(function()
      Sound:playSE("m31_921", 0.5, "", _puppet_tbl.sm36_regular)
      if not _has_been_seen then
        Fn_captionViewWait(L4_77.caption_02[RandI(1, #L4_77.caption_02)])
        if not _sneak.retry_found and not _sneak.retry_lost then
          waitSeconds(0.5)
          Fn_captionView(L5_78[RandI(1, #L5_78)])
        end
      end
    end)
    waitSeconds(2)
    break
  else
    L4_77 = print
    L5_78 = "\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\140\232\191\145\227\129\143\227\129\171\227\129\132\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\129\181\227\130\138\227\130\128\227\129\141\231\132\161\227\129\151"
    L4_77(L5_78)
  end
end
function childRunDown(A0_79)
  print("\229\173\144\228\190\155\227\129\140\232\181\176\227\129\163\227\129\166\227\129\141\227\129\166\232\187\162\227\129\182\229\135\166\231\144\134")
  _child_run_down = false
  child_run_down_task = invokeTask(childAction)
  repeat
    wait()
  until _child_run_down or isRegularMoveEnd(A0_79)
  regular_move_task = nil
  if findGameObject2("PlayerSensor", "pccubesensor2_regular_lookaround_b"):getCount() > 0 then
    if _child_run_down then
      Fn_playMotionNpc("sm36_regular", "stay", false)
      Sound:playSE("m31_903a", 0.5, "", _puppet_tbl.sm36_regular)
      if not _has_been_seen then
        Fn_captionView("sm36_01005")
      end
      _sneak.perceivable_npc:setSightParam(80, 14)
      waitSeconds(2)
      Fn_turnNpc("sm36_regular", Fn_findNpcPuppet("sm36_run_down_child"))
      waitSeconds(2)
      _sneak.perceivable_npc:setSightParam(60, 12)
      invokeTask(function()
        if not _has_been_seen then
          Fn_captionViewWait("sm36_01006")
          if not _sneak.retry_found and not _sneak.retry_lost then
            Fn_captionView("sm36_01023")
          end
        end
      end)
    else
      print("\229\173\144\228\190\155\227\129\140\232\187\162\227\129\176\227\129\170\227\129\139\227\129\163\227\129\159")
    end
  else
    print("\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\140\232\191\145\227\129\143\227\129\171\227\129\132\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\129\181\227\130\138\227\130\128\227\129\141\231\132\161\227\129\151")
  end
end
function childAction()
  local L0_80, L1_81, L2_82, L3_83
  L0_80 = print
  L1_81 = "\229\173\144\228\190\155\227\129\174\230\188\148\230\138\128"
  L0_80(L1_81)
  while true do
    L0_80 = _sneak_step
    if L0_80 == 2 then
      L0_80 = run_down_child_pop_num
    end
    if L0_80 == -1 then
      L0_80 = popNpcOutSight
      L1_81 = "sm36_run_down_child"
      L2_82 = "locator2_run_down_child_b_start_"
      L3_83 = 3
      L0_80 = L0_80(L1_81, L2_82, L3_83, 5)
      run_down_child_pop_num = L0_80
      L0_80 = wait
      L0_80()
    end
  end
  L0_80 = run_down_child_pop_num
  if L0_80 ~= -1 then
    L0_80 = Fn_setNpcActive
    L1_81 = "sm36_run_child_01"
    L2_82 = true
    L0_80(L1_81, L2_82)
    L0_80 = Fn_setNpcActive
    L1_81 = "sm36_run_child_02"
    L2_82 = true
    L0_80(L1_81, L2_82)
    L0_80 = Fn_warpNpc
    L1_81 = "sm36_run_child_01"
    L2_82 = string
    L2_82 = L2_82.format
    L3_83 = "%s%02d"
    L3_83 = L2_82(L3_83, "locator2_run_child_01_b_start_", run_down_child_pop_num)
    L0_80(L1_81, L2_82, L3_83, L2_82(L3_83, "locator2_run_child_01_b_start_", run_down_child_pop_num))
    L0_80 = Fn_warpNpc
    L1_81 = "sm36_run_child_02"
    L2_82 = string
    L2_82 = L2_82.format
    L3_83 = "%s%02d"
    L3_83 = L2_82(L3_83, "locator2_run_child_02_b_start_", run_down_child_pop_num)
    L0_80(L1_81, L2_82, L3_83, L2_82(L3_83, "locator2_run_child_02_b_start_", run_down_child_pop_num))
    L0_80 = Fn_findNpcPuppet
    L1_81 = "sm36_regular"
    L0_80 = L0_80(L1_81)
    L1_81 = Fn_findNpcPuppet
    L2_82 = "sm36_run_down_child"
    L1_81 = L1_81(L2_82)
    L3_83 = L0_80
    L2_82 = L0_80.getWorldPos
    L2_82 = L2_82(L3_83)
    L3_83 = Vector
    L3_83 = L3_83(6, 0, 0)
    L2_82 = L2_82 + L3_83
    L3_83 = "locator2_run_child_b_move_01"
    if run_down_child_pop_num == 3 then
      L3_83 = "locator2_run_child_b_move_02"
    end
    child_01_move_task = Fn_moveNpc("sm36_run_child_01", {
      "locator2_run_child_b_move_02",
      L2_82,
      L3_83
    }, {anim_run = "run", runLength = -1})
    child_02_move_task = Fn_moveNpc("sm36_run_child_02", {
      "locator2_run_child_b_move_02",
      L2_82,
      L3_83
    }, {anim_run = "run1", runLength = -1})
    run_down_child_move_task = Fn_moveNpc("sm36_run_down_child", {
      "locator2_run_child_b_move_02",
      L2_82
    }, {
      anim_run = "run1",
      runLength = -1,
      avoidance = true
    })
    repeat
      wait()
      if Fn_get_distance(L2_82, L1_81:getWorldPos()) < 1 then
        print("\229\173\144\228\190\155\227\129\174\231\167\187\229\139\149\231\181\130\228\186\134\239\188\154\230\140\135\229\174\154\228\189\141\231\189\174\227\129\171\230\142\165\232\191\145")
      elseif run_down_child_move_task ~= nil and run_down_child_move_task:isRunning() == false then
        print("\229\173\144\228\190\155\227\129\174\231\167\187\229\139\149\231\181\130\228\186\134\239\188\154\231\167\187\229\139\149\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134")
        wait()
      end
      if true then
        run_down_child_move_task:abort()
        run_down_child_move_task = nil
      end
    until not run_down_child_move_task
    _child_run_down = true
    run_down_child_motion_task = Fn_playMotionNpc("sm36_run_down_child", "run_down", false)
    Sound:playSE("mmd016c", 0.5, "", _puppet_tbl.sm36_run_down_child)
    Sound:playSE("m37_917c", 0.5, "", _puppet_tbl.sm36_run_down_child)
    invokeTask(function()
      waitSeconds(1.2)
      Fn_turnNpc("sm36_run_child_01", _puppet_tbl.sm36_run_down_child)
      child_01_move_task = Fn_moveNpc("sm36_run_child_01", {
        L1_81:getWorldPos() + Vector(-0.5, 0, -0.5)
      }, {arrivedLength = 1, runLength = -1})
      while child_01_move_task ~= nil do
        if child_01_move_task ~= nil and child_01_move_task:isRunning() == false then
          child_01_move_task = Mv_safeTaskAbort(child_01_move_task)
          Fn_turnNpc("sm36_run_child_01", _puppet_tbl.sm36_run_down_child)
          child_01_motion_task = Fn_playLoopMotionInsert("sm36_run_child_01", "talk_00", {"talk_01"}, 6, 10)
        end
        wait()
      end
    end)
    invokeTask(function()
      waitSeconds(0.7)
      Fn_turnNpc("sm36_run_child_02", _puppet_tbl.sm36_run_down_child)
      child_02_move_task = Fn_moveNpc("sm36_run_child_02", {
        L1_81:getWorldPos() + Vector(-0.2, 0, 0.2)
      }, {arrivedLength = 1, runLength = -1})
      while child_02_move_task ~= nil do
        if child_02_move_task ~= nil and child_02_move_task:isRunning() == false then
          child_02_move_task = Mv_safeTaskAbort(child_02_move_task)
          Fn_turnNpc("sm36_run_child_02", _puppet_tbl.sm36_run_down_child)
          child_02_motion_task = Fn_playLoopMotionInsert("sm36_run_child_02", "talk_00", {"talk_01"}, 3, 8)
        end
        wait()
      end
    end)
    while not Fn_findNpc("sm36_run_down_child"):isMotionEnd() do
      wait()
    end
    run_down_child_motion_task = Fn_playMotionNpc("sm36_run_down_child", "cry_out_00", true)
    run_down_child_motion_task = Fn_playMotionNpc("sm36_run_down_child", "cry_00", false)
    while Fn_getDistanceToPlayer(L1_81) < 20 or Fn_isInSightTarget(L1_81, 1) do
      wait()
    end
    print("\229\173\144\228\190\155\233\157\158\227\130\162\227\130\175\227\131\134\227\130\163\227\131\150")
    Fn_setNpcActive("sm36_run_down_child", false)
    Fn_setNpcActive("sm36_run_child_01", false)
    Fn_setNpcActive("sm36_run_child_02", false)
  else
  end
end
function suspectAppear(A0_84)
  print("\229\174\185\231\150\145\232\128\133\229\135\186\231\143\190\227\129\151\227\129\166\232\169\177\227\129\153\229\135\166\231\144\134")
  _is_suspect_move_end = false
  if not _is_suspect_move_end then
    invokeTask(function()
      local L0_85
      L0_85 = Fn_setNpcActive
      L0_85("sm36_suspect", true)
      L0_85 = -1
      while L0_85 == -1 do
        L0_85 = popNpcOutSight("sm36_suspect", "locator2_suspect_pop_b_", 3, 10)
        wait()
      end
      if L0_85 == 1 then
        suspect_move_task = nil
      elseif L0_85 == 2 then
        suspect_move_task = Fn_moveNpc("sm36_suspect", {
          "locator2_suspect_move_b_02",
          "locator2_suspect_b"
        }, {
          runLength = 1000,
          arrivedLength = 0,
          navimesh = false
        })
      elseif L0_85 == 3 then
        suspect_move_task = Fn_moveNpc("sm36_suspect", {
          "locator2_suspect_move_b_03",
          "locator2_suspect_b"
        }, {
          runLength = 1000,
          arrivedLength = 0,
          navimesh = false
        })
      end
      while suspect_move_task ~= nil and suspect_move_task:isRunning() do
        wait()
      end
      Fn_turnNpc("sm36_suspect", "locator2_regular_reset_pos_b")
      motion_task_tbl[1] = Fn_repeatPlayMotion("sm36_suspect", "stay_01", {"stay_01"})
      _is_suspect_move_end = true
    end)
  end
  while not isRegularMoveEnd(A0_84) or not _is_suspect_move_end do
    if Fn_get_distance(_puppet_tbl.sm36_suspect:getWorldPos(), _puppet_tbl.sm36_regular:getWorldPos()) < 3 then
      Mv_safeTaskAbort(motion_task_tbl[1])
      Fn_playMotionNpc("sm36_suspect", "stay", false)
    elseif Fn_get_distance(_puppet_tbl.sm36_suspect:getWorldPos(), _puppet_tbl.sm36_regular:getWorldPos()) < 8 and true then
      Fn_captionView("sm36_01033")
    end
    wait()
  end
  regular_move_task = nil
  suspect_move_task = nil
end
function isRegularMoveEnd(A0_86)
  local L1_87
  L1_87 = _sneak_setting
  L1_87 = L1_87[A0_86]
  L1_87 = L1_87.target_move_path
  L1_87 = L1_87[#_sneak_setting[A0_86].target_move_path]
  L1_87 = L1_87.pos
  if _hdl_tbl.sm36_regular:isMoveEnd() == true and isNearTwoPosition("sm36_regular", "npc", L1_87, "Node", 2) then
    return true
  end
  return false
end
