local L1_1
L0_0 = dofile
L1_1 = "/Game/Event2/Common/HeaderCommon.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Game/Event2/Mission/rac_common.lua"
L0_0(L1_1)
PHASE_MAIN_A_INIT = 0
PHASE_MAIN_A_INIT_END = 1
PHASE_MAIN_A_RESTART = 2
PHASE_MAIN_A_RESTART_END = 3
PHASE_MAIN_A = 4
PHASE_MAIN_A_END = 5
PHASE_MAIN_B_INIT = 6
PHASE_MAIN_B_INIT_END = 7
PHASE_MAIN_B = 8
DUCK_SE_WAIT_SECONDS_MIN = 3
DUCK_SE_WAIT_SECONDS_MAX = 5
enable_hint_frame_length = 2700
duck_caption_interval = 600
enable_hint_navi_frame_length = 4000
enable_hint_2nd_frame_length = 1800
phase = 0
L0_0 = {}
puppet_tbl = L0_0
hint_2nd_timer = 0
duck_move_task_a = nil
req_capture_duck_a_restart = false
captured_duck_idx = 0
captured_duck_count = 0
L0_0 = {}
duck_idle_task_tbl = L0_0
L0_0 = {}
duck_se_task_tbl = L0_0
L0_0 = {}
is_in_duck_caption_sensor = L0_0
L0_0 = {}
duck_caption_wait_frame = L0_0
L0_0 = {}
req_play_duck_se = L0_0
_duckSeControlTask = nil
L0_0 = {
  L1_1,
  {
    npc_name = "sm02_duck_03",
    capture_sensor_name = nil,
    caption_sensor_name = nil,
    hint_first_kaiwa_id = "sm02_01300k",
    hint_kaiwa_id = "sm02_01400k",
    hint_kaiwa_id_f = "sm02_01400k",
    hint_look_pt = "locator2_duck_hint_look_pt_07",
    warp_pos_name = "warppoint2_duck_07_01",
    reset_pos_name = "locator2_duck_07",
    walk_around_a_node_prefix = "locator2_duck_walk_around_a_07_",
    walk_around_b_node_prefix = "locator2_duck_walk_around_b_07_",
    idle_motion_tbl = nil,
    navi_obj = nil,
    captured_flag = false,
    into_cage = false,
    final_hint_flag = false,
    angel_name = "bg2_angel_07"
  },
  {
    npc_name = "sm02_duck_04",
    capture_sensor_name = nil,
    caption_sensor_name = nil,
    hint_first_kaiwa_id = "sm02_00500k",
    hint_kaiwa_id = "sm02_00600k",
    hint_kaiwa_id_f = "sm02_00600k",
    hint_look_pt = "locator2_duck_hint_look_pt_03",
    warp_pos_name = "warppoint2_duck_03_01",
    reset_pos_name = "locator2_duck_03",
    walk_around_a_node_prefix = "locator2_duck_walk_around_a_03_",
    walk_around_b_node_prefix = "locator2_duck_walk_around_b_03_",
    idle_motion_tbl = nil,
    navi_obj = nil,
    captured_flag = false,
    into_cage = false,
    final_hint_flag = false,
    angel_name = "bg2_angel_03"
  },
  {
    npc_name = "sm02_duck_05",
    capture_sensor_name = nil,
    caption_sensor_name = nil,
    hint_first_kaiwa_id = "sm02_00300k",
    hint_kaiwa_id = "sm02_00400k",
    hint_kaiwa_id_f = "sm02_00410k",
    hint_look_pt = "locator2_duck_hint_look_pt_02",
    warp_pos_name = "warppoint2_duck_02_01",
    reset_pos_name = "locator2_duck_02",
    walk_around_a_node_prefix = "locator2_duck_walk_around_a_02_",
    walk_around_b_node_prefix = "locator2_duck_walk_around_b_02_",
    idle_motion_tbl = nil,
    navi_obj = nil,
    captured_flag = false,
    into_cage = false,
    final_hint_flag = false,
    angel_name = "bg2_angel_02"
  },
  {
    npc_name = "sm02_duck_06",
    capture_sensor_name = nil,
    caption_sensor_name = nil,
    hint_first_kaiwa_id = "sm02_00700k",
    hint_kaiwa_id = "sm02_00800k",
    hint_kaiwa_id_f = "sm02_00810k",
    hint_look_pt = "locator2_duck_hint_look_pt_04",
    warp_pos_name = "warppoint2_duck_04_01",
    reset_pos_name = "locator2_duck_04",
    walk_around_a_node_prefix = "locator2_duck_walk_around_a_04_",
    walk_around_b_node_prefix = "locator2_duck_walk_around_b_04_",
    idle_motion_tbl = nil,
    navi_obj = nil,
    captured_flag = false,
    into_cage = false,
    final_hint_flag = false,
    angel_name = "bg2_angel_04"
  },
  {
    npc_name = "sm02_duck_07",
    capture_sensor_name = nil,
    caption_sensor_name = nil,
    hint_first_kaiwa_id = "sm02_00900k",
    hint_kaiwa_id = "sm02_01000k",
    hint_kaiwa_id_f = "sm02_01010k",
    hint_look_pt = "locator2_duck_hint_look_pt_05",
    warp_pos_name = "warppoint2_duck_05_01",
    reset_pos_name = "locator2_duck_05",
    walk_around_a_node_prefix = "locator2_duck_walk_around_a_05_",
    walk_around_b_node_prefix = "locator2_duck_walk_around_b_05_",
    idle_motion_tbl = nil,
    navi_obj = nil,
    captured_flag = false,
    into_cage = false,
    final_hint_flag = false,
    angel_name = "bg2_angel_05"
  }
}
L1_1 = {}
L1_1.npc_name = "sm02_duck_02"
L1_1.capture_sensor_name = nil
L1_1.caption_sensor_name = nil
L1_1.hint_first_kaiwa_id = "sm02_01100k"
L1_1.hint_kaiwa_id = "sm02_01200k"
L1_1.hint_kaiwa_id_f = "sm02_01200k"
L1_1.hint_look_pt = "locator2_duck_hint_look_pt_06"
L1_1.warp_pos_name = "warppoint2_duck_06_01"
L1_1.reset_pos_name = "locator2_duck_06"
L1_1.walk_around_a_node_prefix = "locator2_duck_walk_around_a_06_"
L1_1.walk_around_b_node_prefix = "locator2_duck_walk_around_b_06_"
L1_1.idle_motion_tbl = nil
L1_1.navi_obj = nil
L1_1.captured_flag = false
L1_1.into_cage = false
L1_1.final_hint_flag = false
L1_1.angel_name = "bg2_angel_06"
L1_1 = {}
L1_1.run_01 = "duck01_run_01"
L1_1.surprise_00 = "duck01_surprise_00"
L1_1.fly_00 = "duck01_fly_00"
L1_1.jump_sm02_00 = "duck01_jump_sm02_00"
function Initialize()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7
  L0_2 = {
    L1_3,
    L2_4,
    L3_5,
    L4_6,
    L5_7,
    {
      name = "sm02_duck_06",
      type = "duck01",
      node = "locator2_duck_06",
      active = false
    },
    {
      name = "sm02_duck_07",
      type = "duck01",
      node = "locator2_duck_07",
      active = false
    }
  }
  L1_3 = {}
  L1_3.name = "sm02_duck_01"
  L1_3.type = "duck01"
  L1_3.node = "locator2_duck_01"
  L1_3.active = true
  L2_4.name = "sm02_duck_02"
  L2_4.type = "duck01"
  L2_4.node = "locator2_duck_02"
  L2_4.active = false
  L3_5.name = "sm02_duck_03"
  L3_5.type = "duck01"
  L3_5.node = "locator2_duck_03"
  L3_5.active = false
  L4_6.name = "sm02_duck_04"
  L4_6.type = "duck01"
  L4_6.node = "locator2_duck_04"
  L4_6.active = false
  L5_7 = {}
  L5_7.name = "sm02_duck_05"
  L5_7.type = "duck01"
  L5_7.node = "locator2_duck_05"
  L5_7.active = false
  L1_3 = Fn_setupNpc
  L1_3(L2_4)
  L1_3 = 2
  while true do
    L5_7 = L1_3
    L5_7 = "%02d"
    L5_7 = "Node"
    if L4_6 ~= nil then
      L5_7 = L3_5
      L5_7 = L4_6.setIgnoreGrab
      L5_7(L4_6, false)
      L5_7 = L4_6.setActive
      L5_7(L4_6, false)
      L5_7 = L4_6.setRot
      L5_7(L4_6, XYZRotQuaternionEular(285, 0, 0))
      L5_7 = L4_6.getPos
      L5_7 = L5_7(L4_6)
      L5_7.y = L5_7.y - 0.08
      L4_6:setPos(L5_7)
      L1_3 = L1_3 + 1
    end
  end
  for L5_7, _FORV_6_ in L2_4(L3_5) do
    puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  L2_4.sm02_client = L3_5
  L5_7 = nil
  L2_4(L3_5, L4_6, L5_7, nil, "gui_marker_07", nil, nil, "sm02_00300k")
  L2_4(L3_5)
  if L2_4 == "sm02_a" then
    phase = L3_5
  elseif L2_4 == "sm02_b" then
    phase = L3_5
  else
    L5_7 = L2_4
    L3_5(L4_6)
  end
end
function Ingame()
  while true do
    if phase == PHASE_MAIN_A_INIT then
      sm02_a_init()
      phase = PHASE_MAIN_A_INIT_END
    elseif phase == PHASE_MAIN_A_INIT_END then
    elseif phase == PHASE_MAIN_A then
      phase = PHASE_MAIN_A_END
    elseif phase == PHASE_MAIN_A_END then
      if Fn_getMissionPart() == "sm02_b" then
        phase = PHASE_MAIN_B_INIT
      end
    elseif phase == PHASE_MAIN_B_INIT then
      sm02_b_init()
      phase = PHASE_MAIN_B_INIT_END
    elseif phase == PHASE_MAIN_B_INIT_END then
    elseif phase == PHASE_MAIN_B then
      sm02_b_main()
      break
    end
    wait()
  end
end
function Finalize()
  for _FORV_3_, _FORV_4_ in pairs(duck_idle_task_tbl) do
    duck_idle_task_tbl[_FORV_3_]:abort()
    duck_idle_task_tbl[_FORV_3_] = nil
  end
  for _FORV_3_, _FORV_4_ in pairs(duck_se_task_tbl) do
    req_play_duck_se[_FORV_3_] = false
    duck_se_task_tbl[_FORV_3_]:abort()
    duck_se_task_tbl[_FORV_3_] = nil
  end
  AbortDuckSeControlTask()
end
function sm02_a_init()
  CreateDuckSeControlTask()
  Fn_loadNpcEventMotion("sm02_duck_01", L1_1)
  for _FORV_3_, _FORV_4_ in ipairs(L0_0) do
    Fn_setNpcActive(_FORV_4_.npc_name, true)
    req_play_duck_se[_FORV_4_.npc_name] = true
    duck_se_task_tbl[_FORV_4_.npc_name] = invokeDuckSeTask(_FORV_4_.npc_name)
    if _FORV_4_.walk_around_a_node_prefix ~= nil then
      duck_idle_task_tbl[_FORV_4_.npc_name] = invokeDuckWalkAroundTask(_FORV_4_.npc_name, _FORV_4_.walk_around_a_node_prefix, nil)
    else
      duck_idle_task_tbl[_FORV_4_.npc_name] = invokeTask(duckPlayIdleQuackMotion, _FORV_4_.npc_name, nil, -1)
    end
  end
end
function sm02_b_init()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14
  L0_8()
  for L3_11, L4_12 in L0_8(L1_9) do
    L5_13 = duck_idle_task_tbl
    L5_13 = L5_13[L3_11]
    L6_14 = L5_13
    L5_13 = L5_13.abort
    L5_13(L6_14)
    L5_13 = duck_idle_task_tbl
    L5_13[L3_11] = nil
  end
  L3_11 = true
  L1_9(L2_10, L3_11)
  L3_11 = "warppoint2_duck_01_02"
  L1_9(L2_10, L3_11)
  L3_11 = L0_8
  L4_12 = "locator2_duck_walk_around_a_01_"
  L5_13 = nil
  L1_9[L0_8] = L2_10
  L1_9[L0_8] = false
  L3_11 = L0_8
  L1_9[L0_8] = L2_10
  for L3_11, L4_12 in L0_8(L1_9) do
    L5_13 = Fn_setNpcActive
    L6_14 = L4_12.npc_name
    L5_13(L6_14, true)
    L5_13 = Fn_warpNpc
    L6_14 = L4_12.npc_name
    L5_13(L6_14, L4_12.warp_pos_name)
    L5_13 = is_in_duck_caption_sensor
    L6_14 = L4_12.npc_name
    L5_13[L6_14] = false
    L5_13 = duck_caption_wait_frame
    L6_14 = L4_12.npc_name
    L5_13[L6_14] = 0
    L5_13 = "pccubesensor2_duck_capture_"
    L6_14 = string
    L6_14 = L6_14.format
    L6_14 = L6_14("%02d", L3_11)
    L5_13 = L5_13 .. L6_14
    L4_12.capture_sensor_name = L5_13
    L5_13 = createGameObject2
    L6_14 = "PlayerSensor"
    L5_13 = L5_13(L6_14)
    L6_14 = L5_13.setName
    L6_14(L5_13, L4_12.capture_sensor_name)
    L6_14 = L5_13.setDetectBehavior
    L6_14(L5_13, 1)
    L6_14 = L5_13.addBox
    L6_14(L5_13, Vector(0.6, 0.6, 0.6))
    L6_14 = L5_13.setPos
    L6_14(L5_13, Vector(0, 0.3, 0))
    L6_14 = L5_13.setOnEnter
    L6_14(L5_13, L4_12.capture_sensor_name .. "_OnEnter")
    L6_14 = L5_13.setOnLeave
    L6_14(L5_13, L4_12.capture_sensor_name .. "_OnLeave")
    L6_14 = L5_13.try_init
    L6_14(L5_13)
    L6_14 = L5_13.waitForReady
    L6_14(L5_13)
    L6_14 = L5_13.try_start
    L6_14(L5_13)
    L6_14 = puppet_tbl
    L6_14 = L6_14[L4_12.npc_name]
    L6_14 = L6_14.appendChild
    L6_14(L6_14, L5_13)
    L6_14 = "pccubesensor2_duck_caption_"
    L6_14 = L6_14 .. string.format("%02d", L3_11)
    L4_12.caption_sensor_name = L6_14
    L6_14 = createGameObject2
    L6_14 = L6_14("PlayerSensor")
    L6_14:setName(L4_12.caption_sensor_name)
    L6_14:setDetectBehavior(1)
    L6_14:addBox(Vector(13, 13, 13))
    L6_14:setPos(Vector(0, 0.3, 0))
    L6_14:setOnEnter(L4_12.caption_sensor_name .. "_OnEnter")
    L6_14:setOnLeave(L4_12.caption_sensor_name .. "_OnLeave")
    L6_14:try_init()
    L6_14:waitForReady()
    L6_14:try_start()
    puppet_tbl[L4_12.npc_name]:appendChild(L6_14)
    if L4_12.walk_around_b_node_prefix ~= nil then
      duck_idle_task_tbl[L4_12.npc_name] = invokeDuckWalkAroundTask(L4_12.npc_name, L4_12.walk_around_b_node_prefix, L4_12.idle_motion_tbl)
    else
      duck_idle_task_tbl[L4_12.npc_name] = invokeTask(duckPlayIdleQuackMotion, L4_12.npc_name, L4_12.idle_motion_tbl, -1)
    end
    req_play_duck_se[L4_12.npc_name] = false
    duck_se_task_tbl[L4_12.npc_name] = invokeDuckSeTask(L4_12.npc_name)
    Fn_loadNpcEventMotion(L4_12.npc_name, L1_1)
  end
end
function sm02_b_main()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28, L14_29
  L0_15 = L0_0
  L0_15 = #L0_15
  captured_duck_idx = 0
  captured_duck_count = 0
  L1_16 = 0
  L2_17 = false
  L3_18 = 0
  L4_19 = true
  L5_20 = 0
  L6_21 = 0
  L7_22 = nil
  L8_23 = false
  L9_24 = {
    L10_25,
    L11_26,
    L12_27
  }
  L10_25 = "sm02_00260k"
  L11_26 = "sm02_00270k"
  L12_27 = "sm02_00280k"
  L10_25 = false
  L11_26 = false
  function L12_27()
    getMarkerHandle(puppet_tbl.sm02_client):playOut()
    repeat
      wait()
    until getMarkerHandle(puppet_tbl.sm02_client):isOutEnd()
  end
  function L13_28(A0_30, A1_31, A2_32, A3_33, A4_34)
    local L5_35, L6_36
    function L5_35()
      L4_19 = false
      if hint_2nd_timer <= 0 then
        hint_2nd_timer = enable_hint_2nd_frame_length
      end
      invokeTask(function()
        L13_28(A0_30, L4_19, A2_32, A3_33, A4_34)
      end)
      L11_26 = true
      getMarkerHandle(puppet_tbl.sm02_client):playIn()
    end
    L6_36 = false
    L10_25 = L6_36
    if A2_32 ~= A3_33 then
      L6_36 = true
      L10_25 = L6_36
    end
    L6_36 = nil
    if L4_19 == true then
      L6_36 = A1_31
    elseif L0_0[A4_34].final_hint_flag == true then
      L6_36 = A3_33
    else
      L6_36 = A2_32
    end
    wait()
    Fn_changeKaiwaDemo(puppet_tbl.sm02_client, L6_36, L5_35, false, "sm02_00300k", nil, L12_27)
  end
  function L14_29()
    local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44
    for L3_40, L4_41 in L0_37(L1_38) do
      L5_42[L3_40] = 0
    end
    while true do
      if L0_37 > 0 then
        if L1_38 == 1 then
          L2_39(L3_40, L4_41)
        elseif L1_38 == 2 then
          L2_39(L3_40, L4_41)
        else
          L2_39(L3_40, L4_41)
        end
        L2_39(L3_40)
        L0_37.captured_flag = true
        captured_duck_count = L2_39
        if L2_39 ~= nil then
          L2_39(L3_40)
          L2_39[L3_40] = nil
        end
        L2_39(L3_40)
        L2_39(L3_40)
        L2_39[L3_40] = false
        L2_39[L3_40] = false
        if L2_39 ~= nil then
          L2_39(L3_40, L4_41)
          L8_23 = L2_39
        end
        L2_39(L3_40)
        captured_duck_idx = 0
        if L2_39 == L3_40 then
          for L6_43, L7_44 in L3_40(L4_41) do
            if L7_44.captured_flag == false then
              findGameObject2("GimmickBg", L7_44.angel_name):setActive(true)
              break
            end
          end
        end
        if L2_39 <= L3_40 then
          repeat
            L3_40()
            for L6_43, L7_44 in L3_40(L4_41) do
              if L7_44.into_cage == false then
                break
              end
            end
          until L2_39 == true
          L3_40(L4_41)
          break
        elseif L2_39 == true then
          L5_20 = L2_39
          if L2_39 ~= 0 then
            hint_2nd_timer = 0
            L2_39(L3_40, L4_41, L5_42, L6_43, L7_44)
          else
            L2_39(L3_40)
          end
        else
          L1_16 = L2_39
        end
      else
      end
      if L0_37 == false then
        if L0_37 == 0 then
          L1_16 = L0_37
          L3_18 = L0_37
          if L0_37 <= L1_38 then
            if L0_37 <= 0 then
              L5_20 = L0_37
              if L0_37 ~= 0 then
                L0_37(L1_38)
                L2_17 = L0_37
                hint_2nd_timer = 0
                L0_37(L1_38, L2_39, L3_40, L4_41, L5_42)
                L0_37(L1_38)
              end
            end
          end
        end
      elseif L0_37 > 0 then
        if L0_37 == 0 then
          hint_2nd_timer = L0_37
          if L0_37 <= 0 then
            if L0_37 == false then
              if L0_37 == true then
                if L0_37 == false then
                  L1_38(L2_39)
                end
              end
              L0_37.final_hint_flag = true
              L0_37(L1_38, L2_39, L3_40, L4_41, L5_42)
            end
          end
        end
      end
      for L3_40, L4_41 in L0_37(L1_38) do
        L5_42[L3_40] = L6_43
      end
      for L3_40, L4_41 in L0_37(L1_38) do
        if L4_41 == true then
          if L5_42 <= 0 then
            for _FORV_9_, _FORV_10_ in L6_43(L7_44) do
              if _FORV_10_.npc_name == L3_40 then
                break
              end
            end
            if L5_42 > 0 then
              if L6_43 == nil then
                L6_43[L3_40] = L7_44
                L7_44(L6_43[RandI(1, #L6_43)])
                L3_18 = L7_44
                break
              end
            end
          end
        end
      end
      L6_21 = L0_37
      if L0_37 then
        for L3_40, L4_41 in L0_37(L1_38) do
          if L4_41 == true then
            if L5_42 == nil then
              for _FORV_9_, _FORV_10_ in L6_43(L7_44) do
                if _FORV_10_.npc_name == L3_40 then
                  break
                end
              end
              if L5_42 > 0 then
                if L6_43 == nil then
                  if L6_43 == true then
                    if L6_43 ~= nil then
                      L6_43(L7_44)
                      L7_22 = L6_43
                    end
                    L7_44(L6_43, puppet_tbl[L3_40])
                    L7_44(L6_43, false)
                    L7_44.navi_obj = L6_43
                    L7_44.look_task = nil
                    L7_44.look_check_task = nil
                    function L7_44.update(A0_45)
                      Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
                      A0_45.look_task = Fn_lookAtObject(puppet_tbl[L3_40])
                      A0_45.look_check_task = invokeTask(function()
                        while true do
                          if Fn_getDistanceToPlayer(puppet_tbl[L3_40]) <= 5 and A0_45.look_task then
                            A0_45.look_task:abort()
                            A0_45.look_task = nil
                            break
                          end
                          wait()
                        end
                      end)
                      Fn_captionViewWait("sm02_09004")
                    end
                    function L7_44.destractor(A0_46)
                      if A0_46.look_task ~= nil then
                        A0_46.look_task:abort()
                        A0_46.look_task = nil
                      end
                      if A0_46.look_check_task ~= nil then
                        A0_46.look_check_task:abort()
                        A0_46.look_check_task = nil
                      end
                      Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
                      if L0_0[L5_42].captured_flag == false then
                        L6_43:setActive(true)
                        L8_23 = true
                      end
                    end
                    L7_22 = RAC_InvokeTaskWithDestractor(L7_44.update, L7_44.destractor, L7_44)
                    break
                  end
                end
              else
              end
            else
            end
          else
          end
        end
      end
      L0_37()
    end
    for L3_40 = 1, #L1_38 do
      if L4_41 ~= nil then
        L4_41(L5_42, L6_43)
        L4_41(L5_42)
        L4_41.navi_obj = nil
      end
    end
    return L0_37
  end
  while true do
    if L14_29() == false then
    end
  end
  for _FORV_18_, _FORV_19_ in ipairs(L0_0) do
    req_play_duck_se[_FORV_19_.npc_name] = true
  end
end
function invokeDuckWalkAroundTask(A0_47, A1_48, A2_49)
  local L3_50
  L3_50 = {}
  L3_50.move_task = nil
  function L3_50.update(A0_51)
    local L1_52, L2_53, L3_54, L4_55, L5_56, L6_57
    L1_52 = 1
    L2_53 = {}
    while true do
      L3_54 = findGameObject2
      L4_55 = "Node"
      L5_56 = A1_48
      L6_57 = string
      L6_57 = L6_57.format
      L6_57 = L6_57("%02d", L1_52)
      L5_56 = L5_56 .. L6_57
      L3_54 = L3_54(L4_55, L5_56)
      if L3_54 ~= nil then
        L5_56 = L3_54
        L4_55 = L3_54.getName
        L4_55 = L4_55(L5_56)
        L2_53[L1_52] = L4_55
      else
        break
      end
      L1_52 = L1_52 + 1
    end
    L3_54 = #L2_53
    if L3_54 <= 0 then
      return
    end
    L4_55 = 0
    while true do
      L5_56 = 0
      if L4_55 >= 1 then
        L6_57 = L2_53[L4_55]
        table.remove(L2_53, L4_55)
        table.insert(L2_53, L6_57)
        L5_56 = RandI(1, L3_54 - 1)
      else
        L6_57 = RandI
        L6_57 = L6_57(1, L3_54)
        L5_56 = L6_57
      end
      L6_57 = Fn_moveNpc
      L6_57 = L6_57(A0_47, {
        L2_53[L5_56]
      }, {arrivedLength = 0.5})
      A0_51.move_task = L6_57
      while true do
        L6_57 = A0_51.move_task
        L6_57 = L6_57.isRunning
        L6_57 = L6_57(L6_57)
        if L6_57 then
          L6_57 = wait
          L6_57()
        end
      end
      L6_57 = A0_51.move_task
      L6_57 = L6_57.abort
      L6_57(L6_57)
      A0_51.move_task = nil
      L6_57 = RAC_stopNpcMoveTask
      L6_57(A0_47)
      L6_57 = RandI
      L6_57 = L6_57(0, 2)
      if L6_57 > 0 then
        duckPlayIdleQuackMotion(A0_47, A2_49, L6_57)
      else
        waitSeconds(0.5)
      end
      L4_55 = L5_56
    end
  end
  function L3_50.destractor(A0_58)
    if A0_58.move_task ~= nil then
      A0_58.move_task:abort()
      A0_58.move_task = nil
    end
    RAC_stopNpcMoveTask(A0_47)
  end
  return RAC_InvokeTaskWithDestractor(L3_50.update, L3_50.destractor, L3_50)
end
function duckPlayIdleQuackMotion(A0_59, A1_60, A2_61)
  if 0 ~= A2_61 then
    A1_60 = A1_60 or {"quack_00", "stay_01"}
    while true do
      Fn_playMotionNpc(A0_59, A1_60[RandI(1, #A1_60)])
      Fn_playMotionNpc(A0_59, "stay", false)
      waitSeconds(RandF(0.3, 0.8))
      if A2_61 > 0 then
        A2_61 = A2_61 - 1
      end
      if not (A2_61 <= 0) then
      end
    end
  end
end
function invokeDuckSeTask(A0_62)
  return invokeTask(function()
    local L0_63
    L0_63 = waitSeconds
    L0_63(RandF(0, 1))
    L0_63 = puppet_tbl
    L0_63 = L0_63[A0_62]
    while true do
      if req_play_duck_se[A0_62] == true then
        Sound:playSE("duck_quack", 1, "", L0_63)
        waitSeconds(RandF(DUCK_SE_WAIT_SECONDS_MIN, DUCK_SE_WAIT_SECONDS_MAX))
      else
        wait()
      end
    end
  end)
end
function moveObject(A0_64, A1_65, A2_66)
  return invokeTask(function()
    local L0_67, L1_68, L2_69, L3_70, L4_71, L5_72, L6_73, L7_74, L8_75, L9_76, L10_77, L11_78, L12_79, L13_80, L14_81, L15_82, L16_83, L17_84
    L0_67 = A0_64
    if L0_67 ~= nil then
      L0_67 = A2_66
      if L0_67 ~= nil then
        L0_67 = A2_66
        L0_67 = L0_67 / 30
        L1_68 = A0_64
        L2_69 = L1_68
        L1_68 = L1_68.getWorldTransform
        L2_69 = L1_68(L2_69)
        for L6_73, L7_74 in L3_70(L4_71) do
          L8_75 = findGameObject2
          L9_76 = "Node"
          L10_77 = L7_74
          L8_75 = L8_75(L9_76, L10_77)
          if L8_75 ~= nil then
            L10_77 = L8_75
            L9_76 = L8_75.getWorldTransform
            L10_77 = L9_76(L10_77)
            L11_78 = Fn_get_distance
            L12_79 = L1_68
            L11_78 = L11_78(L12_79, L13_80)
            if L11_78 ~= 0 then
              L12_79 = L11_78 / L0_67
              for L16_83 = 1, L12_79 do
                L17_84 = L16_83 / L12_79
                A0_64:setWorldTransform(LerpVector(L17_84, L1_68, L9_76), SlerpQuat(L17_84, L2_69, L10_77))
                wait()
              end
            end
            L1_68 = L9_76
            L2_69 = L10_77
          end
        end
      end
    end
  end)
end
function duckCaptionSensorEnter(A0_85)
  local L1_86
  L1_86 = L0_0[A0_85]
  L1_86 = L1_86.npc_name
  is_in_duck_caption_sensor[L1_86] = true
end
function duckCaptionSensorLeave(A0_87)
  local L1_88
  L1_88 = L0_0[A0_87]
  L1_88 = L1_88.npc_name
  is_in_duck_caption_sensor[L1_88] = false
end
function pccubesensor2_duck_capture_01_OnEnter()
  local L0_89, L1_90
  captured_duck_idx = 1
end
function pccubesensor2_duck_capture_01_OnLeave()
  local L0_91, L1_92
end
function pccubesensor2_duck_capture_02_OnEnter()
  local L0_93, L1_94
  captured_duck_idx = 2
end
function pccubesensor2_duck_capture_02_OnLeave()
  local L0_95, L1_96
end
function pccubesensor2_duck_capture_03_OnEnter()
  local L0_97, L1_98
  captured_duck_idx = 3
end
function pccubesensor2_duck_capture_03_OnLeave()
  local L0_99, L1_100
end
function pccubesensor2_duck_capture_04_OnEnter()
  local L0_101, L1_102
  captured_duck_idx = 4
end
function pccubesensor2_duck_capture_04_OnLeave()
  local L0_103, L1_104
end
function pccubesensor2_duck_capture_05_OnEnter()
  local L0_105, L1_106
  captured_duck_idx = 5
end
function pccubesensor2_duck_capture_05_OnLeave()
  local L0_107, L1_108
end
function pccubesensor2_duck_capture_06_OnEnter()
  local L0_109, L1_110
  captured_duck_idx = 6
end
function pccubesensor2_duck_capture_06_OnLeave()
  local L0_111, L1_112
end
function pccubesensor2_duck_caption_01_OnEnter()
  duckCaptionSensorEnter(1)
end
function pccubesensor2_duck_caption_01_OnLeave()
  duckCaptionSensorLeave(1)
end
function pccubesensor2_duck_caption_02_OnEnter()
  duckCaptionSensorEnter(2)
end
function pccubesensor2_duck_caption_02_OnLeave()
  duckCaptionSensorLeave(2)
end
function pccubesensor2_duck_caption_03_OnEnter()
  duckCaptionSensorEnter(3)
end
function pccubesensor2_duck_caption_03_OnLeave()
  duckCaptionSensorLeave(3)
end
function pccubesensor2_duck_caption_04_OnEnter()
  duckCaptionSensorEnter(4)
end
function pccubesensor2_duck_caption_04_OnLeave()
  duckCaptionSensorLeave(4)
end
function pccubesensor2_duck_caption_05_OnEnter()
  duckCaptionSensorEnter(5)
end
function pccubesensor2_duck_caption_05_OnLeave()
  duckCaptionSensorLeave(5)
end
function pccubesensor2_duck_caption_06_OnEnter()
  duckCaptionSensorEnter(6)
end
function pccubesensor2_duck_caption_06_OnLeave()
  duckCaptionSensorLeave(6)
end
function missionPartInitIsEnd()
  local L0_113, L1_114
  L0_113 = phase
  L1_114 = PHASE_MAIN_A_INIT_END
  L0_113 = L0_113 == L1_114 or L0_113 == L1_114
  return L0_113
end
function missionPartMainStart()
  local L0_115, L1_116
  L0_115 = phase
  L1_116 = PHASE_MAIN_A_INIT_END
  if L0_115 == L1_116 then
    L0_115 = PHASE_MAIN_A
    phase = L0_115
  else
    L0_115 = phase
    L1_116 = PHASE_MAIN_B_INIT_END
    if L0_115 == L1_116 then
      L0_115 = PHASE_MAIN_B
      phase = L0_115
    end
  end
end
function requestCaptureDuckARestart()
  local L0_117, L1_118
  req_capture_duck_a_restart = true
end
function setNpcActive(A0_119, A1_120)
  Fn_setNpcActive(A0_119, A1_120)
end
function moveDuckA(A0_121)
  invokeTask(function()
    duck_move_task_a = RAC_invokeMoveCharaTask("sm02_duck_01", A0_121)
  end)
end
function moveDuckAIsRunning()
  return duck_move_task_a ~= nil and duck_move_task_a:isRunning()
end
function moveAbortDuckA()
  if duck_move_task_a ~= nil then
    duck_move_task_a:abort()
    duck_move_task_a = nil
    Fn_findNpc("sm02_duck_01"):reset()
  end
end
function flyDuckA(A0_122, A1_123, A2_124)
  local L3_125, L4_126
  L3_125 = A2_124 ~= nil and A2_124 or 1
  L4_126 = {}
  while true do
    if findGameObject2("Node", A0_122 .. string.format("%02d", L3_125)) ~= nil then
      table.insert(L4_126, findGameObject2("Node", A0_122 .. string.format("%02d", L3_125)):getName())
      L3_125 = L3_125 + 1
      break
    end
  end
  duck_move_task_a = moveObject(puppet_tbl.sm02_duck_01, L4_126, A1_123)
end
function flyAbortDuckA()
  if duck_move_task_a ~= nil then
    duck_move_task_a:abort()
    duck_move_task_a = nil
    Fn_findNpc("sm02_duck_01"):reset()
  end
end
function warpDuckA(A0_127)
  Fn_warpNpc("sm02_duck_01", A0_127)
end
function playMotionJumpDuckA(A0_128)
  invokeTask(function()
    Fn_playMotionNpc("sm02_duck_01", L1_1.jump_sm02_00, true, {isStop = true})
    Fn_warpNpc("sm02_duck_01", "warppoint2_duck_01_capture_restart_01")
    Fn_playMotionNpc("sm02_duck_01", L1_1.fly_00, false)
    flyDuckA("locator2_duck_move_b_", A0_128, 2)
  end)
end
function playMotionFallingDuckA()
  invokeTask(function()
    Fn_playMotionNpc("sm02_duck_01", L1_1.fly_00, false)
  end)
end
function setGrabDuckA(A0_129, A1_130)
  Fn_setGrabNpc("sm02_duck_01", A0_129, A1_130)
end
function setGrabReleaseDuckA()
  Fn_setGrabReleaseNpc("sm02_duck_01")
end
function getCaptureDuckMaxCount()
  local L1_131
  L1_131 = L0_0
  L1_131 = #L1_131
  return L1_131
end
function getCapturedDuckCount()
  local L0_132, L1_133
  L0_132 = captured_duck_count
  return L0_132
end
function CreateDuckSeControlTask()
  local L0_134
  function L0_134(A0_135)
    if A0_135 == "sm02_duck_01" then
      return true
    end
    for _FORV_4_, _FORV_5_ in ipairs(L0_0) do
      if A0_135 == _FORV_5_.npc_name and _FORV_5_.captured_flag then
        return true
      end
    end
    return false
  end
  AbortDuckSeControlTask()
  _duckSeControlTask = invokeTask(function()
    local L0_136, L1_137, L2_138, L3_139, L4_140
    L0_136 = {
      L1_137,
      L2_138,
      L3_139,
      L4_140,
      {
        name = "sm02_duck_05"
      },
      {
        name = "sm02_duck_06"
      },
      {
        name = "sm02_duck_07"
      }
    }
    L1_137.name = "sm02_duck_01"
    L2_138.name = "sm02_duck_02"
    L3_139.name = "sm02_duck_03"
    L4_140 = {}
    L4_140.name = "sm02_duck_04"
    while true do
      for L4_140, _FORV_5_ in L1_137(L2_138) do
        _FORV_5_.distance = Fn_getDistanceToPlayer(puppet_tbl[_FORV_5_.name])
      end
      L1_137(L2_138, L3_139)
      if not L1_137 then
      else
        if L1_137 == "sm02_a" then
          for L4_140, _FORV_5_ in L1_137(L2_138) do
            if L0_134(L4_140) or Fn_getMissionPart() == "sm02_a" then
              req_play_duck_se[L4_140] = true
            else
              req_play_duck_se[L4_140] = false
            end
          end
      end
      else
        for L4_140, _FORV_5_ in L1_137(L2_138) do
          req_play_duck_se[L4_140] = false
        end
        L4_140 = 1
        L1_137(L2_138, L3_139, L4_140, "", puppet_tbl[L0_136[1].name])
      end
      L4_140 = DUCK_SE_WAIT_SECONDS_MAX
      L4_140 = L2_138(L3_139, L4_140)
      L1_137(L2_138, L3_139, L4_140, L2_138(L3_139, L4_140))
    end
  end)
end
function AbortDuckSeControlTask()
  if _duckSeControlTask then
    _duckSeControlTask:abort()
    _duckSeControlTask = nil
  end
end
function playMotionRun01DuckA()
  invokeTask(function()
    Fn_playMotionNpc("sm02_duck_01", L1_1.run_01, false)
  end)
end
function getNextDuck()
  for _FORV_3_, _FORV_4_ in ipairs(L0_0) do
    if _FORV_4_.captured_flag == false then
      return _FORV_3_
    end
  end
  return 0
end
function getRaycastInSightDuck()
  local L0_141
  L0_141 = 0
  for _FORV_4_, _FORV_5_ in ipairs(L0_0) do
    if _FORV_5_.captured_flag == false and RAC_RaycastEyeSight(puppet_tbl[_FORV_5_.npc_name], 5) == true and Fn_isInSightTarget(puppet_tbl[_FORV_5_.npc_name], 0.9) then
      return _FORV_4_
    end
  end
  return 0
end
