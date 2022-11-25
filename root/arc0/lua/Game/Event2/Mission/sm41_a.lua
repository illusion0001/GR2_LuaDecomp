dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
aiming_offset_y = 1.5
eye_offset_y = 1.5
cargo_location_max = 14
cargo_location_baggage_max = 10
survey_cargo_phase_01 = 2
survey_cargo_phase_02 = 4
survey_cargo_phase_03 = 6
cargo_find_sight_range_normal = 50
cargo_find_sight_range_relief = 60
survey_cargo_talk = {
  "sm41_00100",
  "sm41_00101",
  "sm41_00102"
}
vogobox_01_max = 9
npc_search_talk = {
  "sm41_00103",
  "sm41_00104",
  "sm41_00105"
}
npc_search_max = 3
npc_move_a_is_run_npcrace = true
npc_move_a_speed_npcrace = 1.2
high_pos_scensor = {}
low_pos_scensor = {}
_box_hint_flag = false
obj_cargo = {}
survey_cargo_box_sensor = {}
survey_cargo_box_navi = {}
survery_cargo_group1 = {
  "locator2_boxcheck_02",
  "locator2_boxcheck_07",
  "locator2_boxcheck_08"
}
survery_cargo_group2 = {
  "locator2_boxcheck_06",
  "locator2_boxcheck_09",
  "locator2_boxcheck_11",
  "locator2_boxcheck_13"
}
survery_cargo_group1_check = false
survery_cargo_group2_check = false
survery_cargo_group1_scensor = false
survery_cargo_group2_scensor = false
_progress_caption_flag = false
_progress_caption_data = {
  {caption = "sm41_00139", timer = 900},
  {caption = "sm41_00140", timer = 900},
  {caption = "sm41_00141", timer = 900}
}
cargo_not_find_timer = 0
cargo_not_find_timer_max = 2700
cargo_not_find_navi = false
vogo_box_broken = false
survey_cargo_examine = false
survey_cargo_box_end = {}
_survey_cargo_vogo_check_end = false
_survey_cargo_vogo_sensor = false
_survey_cargo_vogo_task = nil
survey_cargo_box_last = 0
survey_cargo_box_find = {}
_survey_cargo_box_timertask = {}
_survey_cargo_box_timercheck = {}
survey_cargo_box_dialog = false
survey_cargo_box_task = nil
survey_cargo_num = 0
cargo_find_sight_range = 50
box_node2 = {}
enemy_gen = {}
puppets = {}
sdemo = nil
is_cat_warp_navi = true
move_task = nil
escape_task = nil
view_task = nil
is_in_sensor = false
gorotsuki_navi = nil
PHASE01_PLAYER_MOTION = {
  stay = "kit01_stay_00",
  touch = "kit01_touch_00",
  surprise = "wom01_surprise_00"
}
NPC_MOTION = {
  talk_00 = "man01_threat_01",
  talk_01 = "man01_talk_03"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_loadPlayerMotion
  L1_1 = PHASE01_PLAYER_MOTION
  L0_0(L1_1)
  L0_0 = {L1_1}
  L1_1 = "evarea2_id_a_root"
  L1_1 = Fn_loadEventData
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = {L2_2}
  L2_2.name = "npc_homeless"
  L2_2.type = "man05"
  L2_2.node = "locator2_gorotsuki_01"
  L2_2.active = false
  L2_2(L3_3)
  for L5_5, _FORV_6_ in L2_2(L3_3) do
    puppets[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  while true do
    if L2_2 == nil then
      L2_2()
      L2_2.npc_criminal = L3_3
    end
  end
  L2_2(L3_3, L4_4)
  for L5_5 = 1, cargo_location_max do
    survey_cargo_box_end[L5_5] = false
    survey_cargo_box_sensor[L5_5] = false
    survey_cargo_box_navi[L5_5] = false
    survey_cargo_box_find[L5_5] = false
  end
  for L5_5 = 1, cargo_location_max do
    Fn_pcSensorOff("pccubesensor2_box_examine_" .. string.format("%02d", L5_5))
  end
  L2_2(L3_3)
  for L5_5 = 1, vogobox_01_max do
    findGameObject2("GimmickBg", "bg2_vogo_boxset_01" .. string.format("%02d", L5_5)):setActive(false)
  end
  while true do
    L5_5 = "pccubesensor2_high_pos"
    L5_5 = L5_5 .. string.format("%02d", L2_2)
    if L3_3 ~= nil then
      L5_5 = L3_3.getName
      L5_5 = L5_5(L3_3)
      L4_4(L5_5, L5_5(L3_3))
      L5_5 = L3_3.getName
      L5_5 = L5_5(L3_3)
      L4_4[L5_5] = false
    end
  end
  while true do
    L5_5 = "pccubesensor2_low_pos"
    L5_5 = L5_5 .. string.format("%02d", L2_2)
    if L3_3 ~= nil then
      L5_5 = L3_3.getName
      L5_5 = L5_5(L3_3)
      L4_4(L5_5, L5_5(L3_3))
      L5_5 = L3_3.getName
      L5_5 = L5_5(L3_3)
      L4_4[L5_5] = false
    end
  end
  while true do
    L5_5 = print
    L5_5("obj : bg2_boxset_" .. string.format("%02d", L2_2) .. string.format("%02d", L3_3))
    L5_5 = findGameObject2
    L5_5 = L5_5("GimmickBg", "bg2_boxset_" .. string.format("%02d", L2_2) .. string.format("%02d", L3_3))
    if L4_4 ~= nil then
      L5_5 = L4_4.setIgnoreGrab
      L5_5(L4_4, true)
      L5_5 = L4_4.setMoveThreshold
      L5_5(L4_4, 0)
    end
  end
  sdemo = L2_2
  L2_2(L3_3)
end
function Ingame()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21
  L0_6()
  L0_6()
  cargo_find_sight_range = L0_6
  for L3_9 = 1, cargo_location_max do
    L4_10 = Fn_pcSensorOn
    L5_11 = "pccubesensor2_box_examine_"
    L5_11 = L5_11 .. L6_12
    L4_10(L5_11)
  end
  L0_6(L1_7)
  L0_6(L1_7)
  L3_9 = {}
  L3_9.animBlendDuration = 0.5
  L0_6(L1_7, L2_8, L3_9)
  L3_9 = "pccubesensor2_out_of_range_01m"
  L4_10 = "pccubesensor2_out_of_range_01l"
  L5_11 = "locator2_pc_start_pos"
  L0_6(L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18)
  box_node2 = L2_8
  L3_9 = true
  L4_10, L5_11 = nil, nil
  for L11_17 = 1, cargo_location_max do
    L1_7[L11_17] = L12_18
    L12_18[L11_17] = L13_19
  end
  L8_14()
  L8_14()
  L8_14(L9_15, L10_16)
  L8_14(L9_15)
  L8_14(L9_15)
  L8_14(L9_15)
  not_find_catpion_task = L8_14
  while true do
    if L8_14 < L9_15 then
      if L0_6 ~= nil then
        if L8_14 then
          L8_14(L9_15)
        end
      end
      if L8_14 then
        _progress_caption_flag = true
        cargo_not_find_timer = 0
      else
        cargo_not_find_timer = L8_14
        for L11_17 = 1, cargo_location_max do
          distance = L12_18
          if L12_18 then
            if L12_18 then
              if L12_18 < L13_19 then
                if L12_18 == false then
                  if L12_18 == false then
                    if L12_18 == false then
                      if L12_18 then
                        L12_18()
                        cargo_not_find_navi = false
                      end
                      if not L12_18 then
                      elseif L12_18 then
                        if L0_6 ~= nil then
                          L12_18(L13_19)
                        end
                        L12_18(L13_19)
                        L12_18[L11_17] = true
                      end
                      if L6_12 == false then
                        L5_11 = L12_18
                      end
                      L12_18(L13_19)
                      L12_18[L11_17] = true
                      _progress_caption_flag = true
                      L12_18(L13_19)
                    end
                  end
                end
              end
            end
          elseif L12_18 then
            _progress_caption_flag = false
            cargo_not_find_timer = 0
            cargo_not_find_navi = false
          end
          if L12_18 == false then
            if L12_18 == true then
              cargo_not_find_timer = 0
            end
          end
        end
        if L8_14 >= L9_15 then
          if not L8_14 then
            if not L8_14 then
              if not L8_14 then
                if L8_14 == false then
                  L8_14(L9_15)
                  L8_14(L9_15)
                  if L10_16 > L11_17 then
                    for _FORV_18_ = 1, #survery_cargo_group2 do
                      if survey_cargo_box_end[RAC_getTailNumber(survery_cargo_group2[_FORV_18_], 2)] == true then
                        if L12_18 < L13_19 then
                          break
                        end
                      end
                    end
                    if L14_20 then
                      L15_21("sm41_00113")
                      if vogo_box_broken == false then
                        Fn_naviSet(L15_21)
                        survery_cargo_group1_check = false
                        survery_cargo_group2_check = true
                      end
                    else
                      L15_21("sm41_00113")
                      if vogo_box_broken == false then
                        Fn_naviSet(L15_21)
                        survery_cargo_group1_check = true
                        survery_cargo_group2_check = false
                      end
                    end
                  else
                    L12_18(L13_19)
                    if L13_19 == false then
                      L13_19(L14_20)
                      survery_cargo_group1_check = true
                      survery_cargo_group2_check = false
                    end
                  end
                  if L12_18 < L13_19 then
                    survey_cargo_num = L12_18
                    survey_cargo_phase_03 = L12_18
                  end
                  if L12_18 >= L13_19 then
                    survey_cargo_num = L12_18
                  end
                end
              end
            end
          end
          cargo_not_find_navi = true
        end
        if not L8_14 then
        elseif L8_14 then
          cargo_not_find_timer = 0
        end
        if L2_8 >= L8_14 then
          _progress_caption_flag = false
        end
      end
      L8_14()
    end
  end
  L8_14()
  L8_14()
  if L0_6 ~= nil then
    L8_14(L9_15)
  end
  if L8_14 ~= nil then
    L8_14(L9_15)
    not_find_catpion_task = nil
  end
  L8_14(L9_15)
  do break end
  L3_9 = "sm41_00117"
  L4_10 = "sm41_00118"
  L5_11 = nil
  L0_6(L1_7, L2_8, L3_9, L4_10, L5_11, L6_12)
  L0_6()
  for L3_9 = 1, cargo_location_max do
    L4_10 = Fn_pcSensorOff
    L5_11 = "pccubesensor2_box_examine_"
    L5_11 = L5_11 .. L6_12
    L4_10(L5_11)
  end
  L0_6()
  L0_6()
  L0_6()
  L3_9 = "locator2_right_center"
  L3_9 = nil
  L4_10 = Fn_setNpcActive
  L5_11 = "npc_criminal"
  L4_10(L5_11, L6_12)
  L4_10 = Fn_setNpcActive
  L5_11 = "npc_homeless"
  L4_10(L5_11, L6_12)
  L4_10 = puppets
  L4_10 = L4_10.npc_criminal
  L5_11 = L4_10
  L4_10 = L4_10.getWorldTransform
  L5_11 = L4_10(L5_11)
  L4_10.y = L6_12
  gorotsuki_navi = L6_12
  L6_12()
  move_task = L6_12
  view_task = L6_12
  L6_12(L7_13, L8_14)
  L6_12(L7_13)
  while L6_12 < 15 do
    L9_15.y = L10_16
    if L11_17 >= L12_18 then
      L12_18(L13_19, L14_20)
      L12_18(L13_19, L14_20, L15_21)
      L7_13 = L12_18 == nil
    end
    if L7_13 then
    else
    end
    L12_18()
  end
  L7_13(L8_14)
  move_task = nil
  L7_13(L8_14)
  L7_13(L8_14, L9_15)
  L7_13(L8_14)
  view_task = nil
  L7_13(L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L9_15(L10_16))
  L7_13(L8_14)
  L7_13(L8_14)
  L7_13()
  L7_13(L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21)
  L7_13(L8_14)
  L7_13(L8_14)
  L7_13(L8_14)
  L3_9 = L7_13
  _progress_caption_flag = false
  while true do
    if L7_13 > 4 then
      L7_13()
    end
  end
  _progress_caption_flag = true
  L7_13()
  L7_13(L8_14)
  gorotsuki_navi = nil
  L7_13()
  L7_13(L8_14)
  L7_13(L8_14)
  L7_13(L8_14)
  _progress_caption_flag = false
  while true do
    while true do
      if L11_17 ~= nil then
        L12_18(L13_19)
        L7_13[L10_16] = L11_17
        if L12_18 then
          if L12_18 then
            L12_18(L13_19)
          end
        end
      end
    end
  end
  while true do
    if L9_15 < L11_17 then
      if not L2_8 and L11_17 < 10 then
        if L12_18 > L13_19 then
          L12_18()
          _progress_caption_flag = true
          L12_18(L13_19)
          break
        end
      end
    end
    for L15_21 = 1, #L7_13 do
      if Fn_isInSightTarget(L7_13[L15_21], 1) and RAC_RaycastEyeSight(L7_13[L15_21], 40) and L8_14 ~= L15_21 then
        print("SEARCH.." .. L7_13[L15_21]:getName())
        _progress_caption_flag = true
        Fn_captionViewWait(npc_search_talk[L9_15 % #npc_search_talk + 1])
        _progress_caption_flag = false
      end
    end
    L12_18()
  end
  if L3_9 ~= nil then
    L5_11 = L3_9
    L4_10 = L3_9.abort
    L4_10(L5_11)
    L3_9 = nil
  end
  L4_10 = nil
  L5_11 = sm41_loop_cation_task
  L5_11 = L5_11(L6_12, L7_13)
  L4_10 = L5_11
  is_in_sensor = false
  L5_11 = is_in_sensor
  if not L5_11 then
    if not L2_8 then
      L5_11 = Fn_captionViewWait
      L5_11(L6_12)
      L5_11 = Player
      L5_11 = L5_11.setStay
      L5_11(L6_12, L7_13)
      L5_11 = Fn_userCtrlOn
      L5_11()
      _progress_caption_flag = false
    end
    if not L2_8 then
      L5_11 = 0
      for L9_15, L10_16 in L6_12(L7_13) do
        L11_17(L12_18)
      end
      for L10_16, L11_17 in L7_13(L8_14) do
        L12_18(L13_19)
      end
      while true do
        while true do
          if L9_15 ~= nil then
            if L10_16 then
              if L10_16 then
                break
              end
            end
          end
        end
        if L7_13 == nil then
          for L13_19, L14_20 in L10_16(L11_17) do
            if L15_21 == true then
              if L5_11 == 0 then
                if L15_21 == Player.kAction_Idle then
                  _progress_caption_flag = true
                  L15_21("sm41_00149")
                  _progress_caption_flag = false
                  L5_11 = 45
                end
              end
              break
            end
          end
          if L9_15 == nil then
            L5_11 = L10_16
          end
          for L14_20, L15_21 in L11_17(L12_18) do
            if low_pos_scensor[L14_20] == true then
              if L6_12 == 0 and Player:getAction() == Player.kAction_Idle then
                _progress_caption_flag = true
                Fn_captionViewWait("sm41_00150")
                _progress_caption_flag = false
              end
              break
            end
          end
          if L10_16 == nil then
          end
          L9_15()
        end
      end
      _progress_caption_flag = true
      L7_13(L8_14, L9_15)
      L7_13()
      L7_13(L8_14, L9_15)
      L7_13(L8_14)
      L7_13(L8_14, L9_15, L10_16)
      L7_13(L8_14)
      L7_13(L8_14)
      L7_13(L8_14, L9_15)
      L7_13()
      while true do
        if not L2_8 then
          if L7_13 < 10 then
            if L8_14 > L9_15 then
              L8_14()
              L8_14(L9_15)
            end
          end
        elseif L7_13 > 30 then
          L8_14(L9_15)
          L8_14(L9_15)
        elseif L8_14 then
          if L8_14 then
            L8_14()
            break
          end
        end
        L8_14()
      end
    end
    if L4_10 ~= nil then
      L5_11 = L4_10.abort
      L5_11(L6_12)
      L4_10 = nil
    end
    L5_11 = RAC_endCatWarpControl
    L5_11(L6_12)
    L5_11 = Player
    L5_11 = L5_11.setStay
    L5_11(L6_12, L7_13)
    L5_11 = Fn_userCtrlAllOff
    L5_11()
    L5_11 = Fn_setNpcActive
    L5_11(L6_12, L7_13)
    L5_11 = Fn_playMotionNpc
    L5_11(L6_12, L7_13, L8_14)
    L5_11 = Fn_warpNpc
    L5_11(L6_12, L7_13)
    L5_11 = invokeTask
    L5_11 = L5_11(L6_12)
    move_task = L5_11
    L5_11 = Fn_lookAtObject
    L5_11 = L5_11(L6_12, L7_13, L8_14)
    while true do
      if L7_13 == false then
      end
      if L7_13 then
        L7_13()
      end
    end
    L7_13(L8_14, L9_15)
    L7_13(L8_14)
    L7_13(L8_14)
    L5_11 = nil
    L7_13(L8_14)
    L7_13(L8_14)
    L7_13(L8_14)
    L7_13(L8_14, L9_15, L10_16)
    L7_13(L8_14, L9_15, L10_16)
    L7_13(L8_14)
    L10_16.pos = "locator2_Gorotsuki_route_b_cam_01"
    L10_16.time = 2
    L10_16.hashfunc = "EaseIn"
    L7_13(L8_14, L9_15, L10_16)
    L7_13(L8_14)
    L7_13(L8_14)
    L7_13(L8_14)
    for L10_16 = 1, vogobox_01_max do
      obj = L11_17
      L11_17(L12_18, L13_19)
    end
    L7_13(L8_14)
    L7_13(L8_14)
    L7_13(L8_14)
    L10_16.pos = "locator2_Gorotsuki_route_b_cam_02"
    L10_16.time = 2
    L10_16.hashfunc = "EaseOut"
    L7_13(L8_14, L9_15, L10_16)
    L7_13(L8_14)
    L7_13(L8_14, L9_15)
    L5_11 = RAC_startCatWarpControl
    L5_11(L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19)
    L5_11 = Player
    L5_11 = L5_11.setStay
    L5_11(L6_12, L7_13)
    L5_11 = Fn_userCtrlOn
    L5_11()
    L5_11 = Fn_naviSet
    L5_11(L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19, L14_20, L15_21, L6_12(L7_13, L8_14))
    L5_11 = findGameObject2
    L5_11 = L5_11(L6_12, L7_13)
    while true do
      if not L6_12 then
        L6_12()
      end
    end
    L5_11 = move_task
    if L5_11 ~= nil then
      L5_11 = move_task
      L5_11 = L5_11.abort
      L5_11(L6_12)
      move_task = nil
    end
    L5_11 = escape_task
    if L5_11 ~= nil then
      L5_11 = escape_task
      L5_11 = L5_11.abort
      L5_11(L6_12)
      escape_task = nil
      L5_11 = RAC_stopNpcMoveTask
      L5_11(L6_12)
    end
  end
  L5_11 = Fn_naviKill
  L5_11()
  L5_11 = Fn_userCtrlAllOff
  L5_11()
  L5_11 = Player
  L5_11 = L5_11.setStay
  L5_11(L6_12, L7_13)
  L5_11 = Fn_blackout
  L5_11()
  L5_11 = RAC_endCatWarpControl
  L5_11(L6_12)
  L5_11 = Fn_pcSensorOff
  L5_11(L6_12)
  L5_11 = Fn_setNextMissionFlag
  L5_11()
  L5_11 = Fn_nextMission
  L5_11()
  L5_11 = Fn_exitSandbox
  L5_11()
end
function Finalize()
  local L0_22, L1_23
end
function invokeMoveCharaTask(A0_24, A1_25, A2_26, A3_27)
  local L4_28
  if A2_26 == nil then
    A2_26 = false
  end
  if A3_27 == nil then
    A3_27 = 4
  end
  L4_28 = {}
  L4_28.arrivedLength = 0
  L4_28.runLength = A2_26 and -1 or 1000000
  L4_28.anim_run_speed = A3_27
  L4_28.anim_walk_speed = A3_27
  L4_28.anim_speed_over = true
  return RAC_invokeMoveCharaTask(A0_24, A1_25, L4_28)
end
function vogo_crate_broken_demo()
  local L0_29, L1_30, L2_31
  L0_29 = Fn_findNpc
  L1_30 = "sm41_client"
  L0_29 = L0_29(L1_30)
  L2_31 = L0_29
  L1_30 = L0_29.getPuppet
  L1_30 = L1_30(L2_31)
  L2_31 = 1
  while findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_31)) ~= nil do
    findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_31)):setEventListener("broken", function(A0_32)
      if Fn_get_distance(L1_30:getWorldPos(), Fn_getPcPosRot()) < 20 then
        vogo_box_broken = true
      end
    end)
    L2_31 = L2_31 + 1
  end
  invokeTask(function()
    local L0_33, L1_34, L2_35
    while true do
      L0_33 = vogo_box_broken
      if L0_33 == true then
        L0_33 = Fn_userCtrlAllOff
        L0_33()
        L0_33 = Player
        L1_34 = L0_33
        L0_33 = L0_33.setStay
        L2_35 = true
        L0_33(L1_34, L2_35)
        L0_33 = false
        L1_34 = invokeTask
        function L2_35()
          Fn_turnNpc(L0_29)
          L0_33 = true
        end
        L1_34(L2_35)
        L1_34 = RAC_LookAtObject
        L2_35 = L1_30
        L1_34 = L1_34(L2_35, 1)
        while L0_33 == false do
          L2_35 = wait
          L2_35()
        end
        L2_35 = Fn_playMotionNpc
        L2_35("sm41_client", "angry_00", false)
        while L1_34 ~= nil do
          L2_35 = L1_34.isRunning
          L2_35 = L2_35(L1_34)
          if L2_35 then
            L2_35 = Fn_isInSightTarget
            L2_35 = L2_35(L1_30, 0.5)
          end
          if not L2_35 then
            L2_35 = wait
            L2_35()
          end
        end
        L2_35 = L1_34.abort
        L2_35(L1_34)
        L2_35 = Sound
        L2_35 = L2_35.playSE
        L2_35(L2_35, "vog020a", 1, "", L1_30)
        L2_35 = Fn_captionViewWait
        L2_35("sm41_00135")
        L2_35 = Fn_blackout
        L2_35()
        L2_35 = Fn_resetPcPos
        L2_35(findGameObject2("Node", "locator2_pc_start_pos"))
        L2_35 = Fn_warpNpc
        L2_35(L0_29, "locator2_client_reset")
        L2_35 = 1
        while findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_35)) ~= nil do
          findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_35)):requestRestoreForce()
          L2_35 = L2_35 + 1
        end
        waitSeconds(1)
        Fn_gestureActionCancel()
        Player:setStay(false)
        Fn_fadein()
        Fn_userCtrlOn()
        vogo_box_broken = false
      else
      end
      L0_33 = wait
      L0_33()
    end
  end)
end
function survey_box()
  local L0_36, L1_37, L2_38, L3_39, L4_40
  for L3_39 = 1, cargo_location_max do
    L4_40 = survey_cargo_box_sensor
    L4_40 = L4_40[L3_39]
    if L4_40 == true then
      survey_cargo_examine = true
      L4_40 = Fn_naviKill
      L4_40()
      L4_40 = survey_cargo_box_task
      if L4_40 ~= nil then
        L4_40 = survey_cargo_box_task
        L4_40 = L4_40.abort
        L4_40(L4_40)
        survey_cargo_box_task = nil
      end
      L4_40 = survey_cargo_box_sensor
      L4_40[L3_39] = false
      L4_40 = survey_cargo_box_end
      L4_40[L3_39] = true
      L4_40 = RAC_MultiNaviDel
      L4_40(findGameObject2("Node", "pccubesensor2_box_examine_" .. string.format("%02d", L3_39)))
      survey_cargo_box_last = L3_39
      L4_40 = print
      L4_40("FLAG " .. L3_39)
      L4_40 = print
      L4_40("LAST POINT " .. survey_cargo_box_last)
      L4_40 = survey_cargo_num
      L4_40 = L4_40 + 1
      survey_cargo_num = L4_40
      L4_40 = print
      L4_40("SURVERY CARGO : " .. survey_cargo_num)
      L4_40 = survey_cargo_num
      if L4_40 < survey_cargo_phase_03 then
        L4_40 = survey_cargo_num
        if L4_40 == 1 then
          L4_40 = Fn_kaiwaDemoView
          L4_40("sm41_00150k")
          _box_hint_flag = true
          L4_40 = print
          L4_40("\227\131\146\227\131\179\227\131\136\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146ON")
        else
          L4_40 = survey_cargo_num
          if L4_40 == survey_cargo_phase_01 then
            L4_40 = Fn_kaiwaDemoView
            L4_40("sm41_00200k")
          else
            L4_40 = survey_cargo_num
            if L4_40 == survey_cargo_phase_02 then
              L4_40 = talk_with_NPC
              L4_40("npc_homeless", "sm41_00250k", "sm41_00136", "sm41_00137", "sm41_00138", "m29_908a")
              L4_40 = checkNpcDisappearTask
              L4_40("npc_homeless")
            else
              L4_40 = math
              L4_40 = L4_40.random
              L4_40 = L4_40(1, #survey_cargo_talk)
              Fn_captionView(survey_cargo_talk[L4_40])
            end
          end
        end
        L4_40 = _survey_cargo_box_timertask
        L4_40[L3_39] = survey_cargo_box_timer_check(0, L3_39)
      end
      survey_cargo_examine = false
      survey_cargo_box_dialog = false
      L4_40 = 1
      print("obj : bg2_boxset_" .. string.format("%02d", L3_39) .. string.format("%02d", L4_40))
      obj = findGameObject2("GimmickBg", "bg2_boxset_" .. string.format("%02d", L3_39) .. string.format("%02d", L4_40))
      obj:setIgnoreGrab(false)
      obj:setMoveThreshold(-1)
      break
    end
  end
end
function release_box()
  local L0_41, L1_42, L2_43
  L0_41 = 1
  L1_42 = 1
  L2_43 = nil
  while true do
    print("obj : bg2_boxset_" .. string.format("%02d", L0_41) .. string.format("%02d", L1_42))
    L2_43 = findGameObject2("GimmickBg", "bg2_boxset_" .. string.format("%02d", L0_41) .. string.format("%02d", L1_42))
    if L2_43 ~= nil then
      L2_43:setIgnoreGrab(false)
      L2_43:setMoveThreshold(-1)
      L0_41 = L0_41 + 1
    end
  end
end
function survey_vogo_box()
  if survey_cargo_vogo_task ~= nil then
    survey_cargo_vogo_task:abort()
    survey_cargo_vogo_task = nil
  end
  Fn_kaiwaDemoView("sm41_00125k")
end
function talk_with_NPC(A0_44, A1_45, A2_46, A3_47, A4_48, A5_49)
  local L6_50, L7_51, L8_52, L9_53
  L6_50 = {}
  for _FORV_10_ = 1, #L8_52 do
    if survey_cargo_box_navi[_FORV_10_] == true and survey_cargo_box_end[_FORV_10_] == false then
      table.insert(L6_50, box_node2[_FORV_10_])
      RAC_MultiNaviDel(box_node2[_FORV_10_])
    end
  end
  L8_52(L9_53, true)
  L8_52()
  L8_52()
  L8_52(L9_53, findGameObject2("Node", "locator2_GC_pc_start_pos" .. string.format("%02d", survey_cargo_box_last)):getWorldPos(), 0.3)
  L8_52(L9_53)
  L8_52(L9_53, "locator2_gorotsuki_" .. string.format("%02d", survey_cargo_box_last))
  L8_52(L9_53, true)
  L8_52()
  L8_52(L9_53)
  if A2_46 ~= nil and A2_46 ~= "" then
    L8_52(L9_53)
    L8_52(L9_53)
  end
  if A3_47 ~= nil and A3_47 ~= "" then
    L8_52(L9_53, A5_49, 1, "", Fn_findNpcPuppet(A0_44))
    L8_52(L9_53)
  end
  L8_52(L9_53, nil, 0.3)
  if A4_48 ~= nil and A4_48 ~= "" then
    L8_52(L9_53)
  end
  L9_53(function()
    while L8_52 == true do
      Player:setLookAtIk(true, 1, puppets[A0_44]:getWorldPos() + Vector(0, 1.5, 0))
      wait()
    end
    Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  end)
  invokeTask(function()
    Fn_turnNpc(A0_44)
    L9_53 = true
  end)
  while L9_53 == false do
    wait()
  end
  if A4_48 == nil then
    Fn_playMotionNpc("npc_criminal", NPC_MOTION.talk_01, false)
  end
  while RAC_LookAtObject(puppets[A0_44], 1) ~= nil and RAC_LookAtObject(puppets[A0_44], 1):isRunning() do
    wait()
  end
  if RAC_LookAtObject(puppets[A0_44], 1) ~= nil then
    RAC_LookAtObject(puppets[A0_44], 1):abort()
  end
  waitSeconds(1)
  Fn_kaiwaDemoView(A1_45)
  Player:setStay(false)
  Fn_userCtrlOn()
  for _FORV_14_ = 1, #L6_50 do
    RAC_MultiNaviAdd(L6_50[_FORV_14_])
  end
end
function pccubesensor2_box_examine_OnEnter(A0_54)
  local L1_55
  L1_55 = RAC_getTailNumber
  L1_55 = L1_55(A0_54:getName(), 2)
  if survey_cargo_box_end[L1_55] == false then
    print("BOX\227\131\129\227\130\167\227\131\131\227\130\175\230\156\170\229\135\166\231\144\134")
    survey_cargo_box_sensor[L1_55] = true
    survey_cargo_box_task = invokeTask(function()
      while true do
        if survey_cargo_box_dialog == false and (Player:getAction() == Player.kAction_Idle or Player:getAction() == Player.kAction_Run) then
          print("dialog " .. L1_55)
          Fn_gestureAction({
            RL = {
              id = "ui_event_guide_03",
              func = survey_box
            }
          })
          RAC_MultiNaviDel(findGameObject2("Node", "pccubesensor2_box_examine_" .. string.format("%02d", L1_55)))
          survey_cargo_box_dialog = true
        end
        if survey_cargo_box_dialog == true and Player:getAction() ~= Player.kAction_Idle and Player:getAction() ~= Player.kAction_Run then
          print("Cancel " .. L1_55)
          Fn_gestureActionCancel()
          RAC_MultiNaviAdd(findGameObject2("Node", "pccubesensor2_box_examine_" .. string.format("%02d", L1_55)))
          survey_cargo_box_dialog = false
        end
        wait()
      end
    end)
  else
    print("BOX\227\131\129\227\130\167\227\131\131\227\130\175\230\184\136\227\129\191\229\135\166\231\144\134")
    if _box_hint_flag == true and _survey_cargo_box_timercheck[L1_55] == false then
      _survey_cargo_box_timertask[L1_55] = survey_cargo_box_timer_check(1, L1_55)
    end
  end
end
function pccubesensor2_box_examine_OnLeave(A0_56)
  local L1_57
  L1_57 = RAC_getTailNumber
  L1_57 = L1_57(A0_56:getName(), 2)
  if survey_cargo_box_end[L1_57] == false then
    survey_cargo_box_sensor[L1_57] = false
    if survey_cargo_box_task ~= nil then
      survey_cargo_box_task:abort()
      survey_cargo_box_task = nil
    end
    if survey_cargo_box_dialog == true then
      Fn_gestureActionCancel()
      RAC_MultiNaviAdd(findGameObject2("Node", "pccubesensor2_box_examine_" .. string.format("%02d", L1_57)))
      survey_cargo_box_dialog = false
    end
  end
end
function pccubesensor2_box_examine_vogo_OnEnter()
  if _survey_cargo_vogo_sensor == false then
    print("\227\131\180\227\130\169\227\130\180\227\131\129\227\130\167\227\131\131\227\130\175\230\156\170\229\135\166\231\144\134")
    _survey_cargo_vogo_sensor = true
    _survey_cargo_vogo_task = invokeTask(function()
      while true do
        if (Player:getAction() == Player.kAction_Idle or Player:getAction() == Player.kAction_Run) and Fn_getGestureActionVisible() == false and vogo_box_broken == false then
          Fn_gestureAction({
            RL = {
              id = "ui_event_guide_02",
              func = survey_vogo_box
            }
          })
        end
        wait()
      end
    end)
  end
end
function pccubesensor2_box_examine_vogo_OnLeave()
  _survey_cargo_vogo_sensor = false
  if _survey_cargo_vogo_task ~= nil then
    _survey_cargo_vogo_task:abort()
    _survey_cargo_vogo_task = nil
  end
  Fn_gestureActionCancel()
  print("Sensor out")
end
function cat_warp_callback_for_navi_in()
  if is_cat_warp_navi == true then
    Fn_naviKill()
  end
end
function cat_warp_callback_for_navi_out()
  is_cat_warp_navi = true
  for _FORV_3_ = 1, #survey_cargo_box_navi do
    if survey_cargo_box_navi[_FORV_3_] == true and survey_cargo_box_end[_FORV_3_] == false then
      is_cat_warp_navi = false
      break
    end
  end
  if _FOR_ == true then
    Fn_naviSet(findGameObject2("Node", "locator2_back_to_range_01"))
    waitSeconds(RAC_CAPTION_DELAY_DEFAULT)
  end
end
function survey_cargo_box_timer_check(A0_58, A1_59)
  return invokeTask(function()
    local L0_60, L1_61
    L0_60 = _survey_cargo_box_timercheck
    L1_61 = A1_59
    L0_60[L1_61] = true
    L0_60 = A0_58
    if L0_60 == 1 then
      L0_60 = print
      L1_61 = A1_59
      L1_61 = L1_61 .. "\227\129\174\232\170\191\230\159\187\230\184\136\227\129\191\227\130\191\227\130\185\227\130\175\233\150\139\229\167\139(\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133)"
      L0_60(L1_61)
    else
      L0_60 = print
      L1_61 = A1_59
      L1_61 = L1_61 .. "\227\129\174\232\170\191\230\159\187\230\184\136\227\129\191\227\130\191\227\130\185\227\130\175\233\150\139\229\167\139(\227\130\164\227\131\153\227\131\179\227\131\136\229\190\140)"
      L0_60(L1_61)
      L0_60 = waitSeconds
      L1_61 = 10
      L0_60(L1_61)
    end
    L0_60 = findGameObject2
    L1_61 = "Node"
    L0_60 = L0_60(L1_61, "locator2_boxcheck_" .. string.format("%02d", A1_59))
    L1_61 = Fn_getDistanceToPlayer
    L1_61 = L1_61(L0_60)
    print("DIST RESULT : " .. L1_61)
    if L1_61 < 4 then
      Fn_captionViewWait("sm41_00154")
    else
      print("\232\183\157\233\155\162\227\129\140\228\184\128\229\174\154\228\187\165\228\184\138\233\155\162\227\130\140\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167\227\130\164\227\131\153\227\131\179\227\131\136\227\129\175\231\153\186\231\148\159\227\129\151\227\129\170\227\129\139\227\129\163\227\129\159\227\128\130")
    end
    if A0_58 == 1 then
      waitSeconds(10)
      print(A1_59 .. "\227\129\174\232\170\191\230\159\187\230\184\136\227\129\191\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134(\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133)")
    else
      print(A1_59 .. "\227\129\174\232\170\191\230\159\187\230\184\136\227\129\191\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134(\227\130\164\227\131\153\227\131\179\227\131\136\229\190\140)")
    end
    _survey_cargo_box_timercheck[A1_59] = false
  end)
end
function sm41_loop_cation_task(A0_62, A1_63)
  return invokeTask(function()
    local L0_64, L1_65
    L0_64 = 0
    L1_65 = nil
    while true do
      if _progress_caption_flag == false and vogo_box_broken == false then
        L0_64 = L0_64 + 1
        if L0_64 > A1_63 then
          Fn_captionViewWait(A0_62)
          L0_64 = 0
        end
      else
        L0_64 = 0
      end
      wait()
    end
  end)
end
function checkNpcDisappearTask(A0_66)
  invokeTask(function()
    local L0_67
    L0_67 = puppets
    L0_67 = L0_67[A0_66]
    while true do
      wait()
      if Fn_getDistanceToPlayer(L0_67) >= 20 and Fn_isInSightTarget(L0_67, 1) == false then
        Fn_setNpcActive(A0_66, false)
        break
      end
    end
  end)
end
function pccubesensor2_Gorotsuki_chase_goal_01_OnEnter()
  local L0_68, L1_69
  is_in_sensor = true
end
function pccubesensor2_Gorotsuki_chase_goal_01_OnLeave()
  local L0_70, L1_71
  is_in_sensor = false
end
function pccubesensor2_not_find_navi_01_OnEnter()
  survery_cargo_group1_scensor = true
  cargo_find_sight_range = cargo_find_sight_range_relief
  invokeTask(function()
    Player:setStay(true)
    Fn_naviKill()
    Fn_captionViewWait("sm41_00116")
    Player:setStay(false)
  end)
end
function pccubesensor2_not_find_navi_01_OnLeave()
  survery_cargo_group1_scensor = false
  cargo_find_sight_range = cargo_find_sight_range_normal
  Fn_pcSensorOff("pccubesensor2_not_find_navi_01")
  cargo_not_find_navi = false
end
function pccubesensor2_not_find_navi_02_OnEnter()
  survery_cargo_group2_scensor = true
  cargo_find_sight_range = cargo_find_sight_range_relief
  invokeTask(function()
    Player:setStay(true)
    Fn_naviKill()
    Fn_captionViewWait("sm41_00116")
    Player:setStay(false)
  end)
end
function pccubesensor2_not_find_navi_02_OnLeave()
  survery_cargo_group2_scensor = false
  cargo_find_sight_range = cargo_find_sight_range_normal
  Fn_pcSensorOff("pccubesensor2_not_find_navi_02")
  cargo_not_find_navi = false
end
function pccubesensor2_high_pos_OnEnter(A0_72)
  high_pos_scensor[A0_72:getName()] = true
end
function pccubesensor2_high_pos_OnLeave(A0_73)
  high_pos_scensor[A0_73:getName()] = false
end
function pccubesensor2_low_pos_OnEnter(A0_74)
  low_pos_scensor[A0_74:getName()] = true
end
function pccubesensor2_low_pos_OnLeave(A0_75)
  low_pos_scensor[A0_75:getName()] = false
end
function judge_callback(A0_76, A1_77, A2_78, A3_79)
  print("judge:" .. A1_77 .. "=" .. A2_78)
  if A3_79:getName() ~= nil then
    print("  sender:" .. A3_79:getName())
  else
    print("  sender: not named")
  end
  return 0
end
function damage_callback(A0_80, A1_81)
  print("judge:" .. A1_81)
end
function sm41_GimmickBrokenDeny(A0_82)
  local L1_83, L2_84, L3_85
  L1_83, L2_84, L3_85 = nil, nil, nil
  return invokeTask(function()
    while true do
      L2_84 = A0_82
      L1_83 = 1
      while true do
        L3_85 = findGameObject2("GimmickBg", "bg2_boxset_" .. string.format("%02d", L2_84) .. string.format("%02d", L1_83))
        if L3_85 ~= nil then
          L3_85:setEventListener("judge", judge_callback)
          L3_85:setEventListener("damage", damage_callback)
          L3_85:setEventListener("dynamic", function(A0_86)
            A0_86:getDynamicObject():setEventListener("judge", judege_callback)
          end)
          L3_85:setEventListener("broken", function(A0_87)
            print("object broken = " .. A0_87:getName())
          end)
          L1_83 = L1_83 + 1
        end
      end
      L1_83 = 1
      wait()
    end
  end)
end
