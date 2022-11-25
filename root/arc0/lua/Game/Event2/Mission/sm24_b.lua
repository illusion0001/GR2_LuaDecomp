dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Misc/photo.lua")
dofile("/Game/Event2/Mission/sm24_common.lua")
eavesdropping_range = 10
near_insight_range = 6
eavesdropping_far_navi_range = 30
man_soliloque_range = 15
take_pic_hint_second = 15
take_pic_hint_invisible_cap_interval = 20
npc_moving = 1
npc_moved = 2
man_lost_caption_range = 10
_tailing_end = false
talk_out_caution_cap_interval = 240
MAN_MOTION = {
  inform = "man01_inform_00",
  stay = "stay",
  damaged = "man01_damage_small_b_00",
  wavehand = "man01_wavehand_far_00"
}
WOM_MOTION = {
  stay_02 = "wom01_trouble_00",
  stay_03 = "wom01_stay_03",
  yes = "wom01_reply_yes_00",
  wavehand = "wom01_wavehand_far_00"
}
puppet_tbl = {}
is_in_sensor = false
is_in_sensor_pup = false
photo_success = false
tailing_phase = 1
npc_move_state = npc_moving
saw_by_man = false
restart_talk_index = nil
man_back_eye_pos_node = nil
info_showed_flag_tbl = {}
_check_man_back_flag = nil
is_retry_comeback = false
man_move_restart_index = 0
check_dist_with_man_task = nil
lost_man_caption_timer_task = nil
man_navi_enable = false
talk_npc_move_a_delay_sec = 0
talk_npc_move_a_task = nil
talk_npc_move_b_task = nil
alertness_add_wait_task = nil
is_talk_npc_move_end = false
is_man_move_end = false
take_picture_task = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5
  }
  L1_1.name = "sm24_talk_npc01"
  L1_1.type = "wom44"
  L1_1.node = "locator2_talk_npc_01"
  L1_1.active = false
  L1_1.color_variation = 1
  L1_1.hair_variation = 0
  L2_2.name = "sm24_talk_npc02"
  L2_2.type = "wom01"
  L2_2.node = "locator2_talk_npc_02"
  L2_2.active = false
  L2_2.color_variation = 1
  L2_2.hair_variation = 0
  L3_3.name = "sm24_talk_npc03"
  L3_3.type = "wom47"
  L3_3.node = "locator2_talk_npc_03"
  L3_3.active = false
  L3_3.color_variation = 2
  L3_3.hair_variation = 0
  L4_4.name = "sm24_talk_npc04"
  L4_4.type = "wom05"
  L4_4.node = "locator2_talk_npc_04"
  L4_4.active = false
  L4_4.color_variation = 3
  L4_4.hair_variation = 0
  L5_5 = {}
  L5_5.name = "sm24_talk_npc05"
  L5_5.type = "wom03"
  L5_5.node = "locator2_talk_npc_05_move_a_01"
  L5_5.active = false
  L5_5.color_variation = 3
  L5_5.hair_variation = 0
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = puppet_tbl
    L7_7 = L5_5.name
    L6_6[L7_7] = Fn_findNpcPuppet(L5_5.name)
    L6_6 = Fn_loadNpcEventMotion
    L7_7 = L5_5.name
    L6_6(L7_7, WOM_MOTION)
  end
  L1_1.sm24_talk_npc04 = L2_2
  L1_1.sm24_tourist01 = L2_2
  L1_1.sm24_tourist02 = L2_2
  L1_1.sm24_man01 = L2_2
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L5_5 = "cubesensor2_turn_c_01"
  L6_6 = "cubesensor2_soliloque_d_01"
  L7_7 = "cubesensor2_turn_d_01"
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7 = findGameObject2
    L7_7 = L7_7("Sensor", L6_6)
    L7_7:setFilterName("sm24_man01")
    Fn_sensorOff(L7_7)
  end
  L5_5 = 0.6
  L6_6 = 0
  L5_5 = 5
  L6_6 = 2
  L7_7 = 5
  L5_5 = "pccubesensor2_man_caution_sensor_OnEnter"
  L6_6 = "pccubesensor2_man_caution_sensor_OnLeave"
  L7_7 = puppet_tbl
  L7_7 = L7_7.sm24_man01
  L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2)
  sdemo = L1_1
end
function Ingame()
  local L0_8, L1_9, L2_10, L3_11
  L0_8(L1_9)
  L0_8()
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9)
  L0_8()
  L0_8(L1_9)
  L0_8()
  L3_11 = true
  L0_8(L1_9, L2_10, L3_11)
  L0_8(L1_9)
  L0_8()
  L0_8(L1_9)
  if L0_8 then
    tailing_phase = 5
  else
    tailing_phase = 1
  end
  for L3_11, _FORV_4_ in L0_8(L1_9) do
    if _FORV_4_.talk_npc_name ~= nil then
      Fn_setNpcActive(_FORV_4_.talk_npc_name, true)
    end
  end
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L3_11 = false
  L0_8(L1_9, L2_10, L3_11, {isRepeat = true, animBlendDuration = 0.3})
  L3_11 = false
  L0_8(L1_9, L2_10, L3_11, {isRepeat = true, animBlendDuration = 0.3})
  L3_11 = tailing_phase
  L1_9(L2_10)
  while true do
    if L1_9 >= L2_10 then
      L3_11 = tailing_phase
      talk_npc_move_a_delay_sec = L2_10
      while true do
        if L2_10 == false then
        end
      end
      tailing_phase = L2_10
      L3_11 = "tailing_phase..."
      L3_11 = L3_11 .. tailing_phase
      L2_10(L3_11)
      is_retry_comeback = false
      man_move_restart_index = 0
    end
  end
  L1_9(L2_10)
  man_navi_enable = false
  if L1_9 ~= nil then
    L1_9(L2_10)
    check_dist_with_man_task = nil
  end
  if L1_9 ~= nil then
    L1_9(L2_10)
    lost_man_caption_timer_task = nil
  end
  if L1_9 ~= nil then
    L1_9(L2_10)
    alertness_add_wait_task = nil
  end
  L1_9(L2_10)
  L1_9()
  L3_11 = L1_9
  L3_11 = nil
  if L2_10 then
    L3_11 = Fn_getPlayer()
  else
    L3_11 = "locator2_pc_warp_end_01"
  end
  while invokeTask(Fn_turnNpc, "sm24_tourist01", L3_11):isRunning() or invokeTask(Fn_turnNpc, "sm24_tourist02", L3_11):isRunning() do
    wait()
  end
  invokeTask(Fn_turnNpc, "sm24_tourist01", L3_11):abort()
  invokeTask(Fn_turnNpc, "sm24_tourist02", L3_11):abort()
  Fn_sendEventComSb("setLostCheckEnable", false)
  Fn_playMotionNpc("sm24_tourist01", MAN_MOTION.wavehand, false, {animBlendDuration = 0.3})
  Fn_playMotionNpc("sm24_tourist02", WOM_MOTION.wavehand, false, {animBlendDuration = 0.3})
  Sound:playSE("m36_901b", 1, "", puppet_tbl.sm24_tourist01)
  Fn_captionViewWait("sm24_01008")
  sdemo:reset()
  sdemo:set("locator2_sdemo_06_cam_01", "locator2_sdemo_06_aim_01")
  sdemo:switchCamera(true, 2)
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
  Sound:playSE("w19_901b", 1, "", puppet_tbl.sm24_tourist02)
  Fn_captionViewWait("sm24_01009")
  if L2_10 == false then
    Fn_resetPcPos("locator2_pc_warp_end_01")
  end
  Sound:playSE("kit020b", 1)
  Fn_captionView("sm24_01010")
  waitSeconds(1)
  sdemo:stop(2)
  Fn_missionView("sm24_01011")
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  Fn_userCtrlOn()
  Player:setStay(false)
  Fn_sendEventComSb("setForceAlertnessRide", true)
  while true do
    if approachTouristLoop() == false then
    end
  end
  Fn_userCtrlOff()
  Fn_blackout()
  Fn_resetPcPos("locator2_pc_photo_warp")
  Fn_warpNpc("sm24_tourist01", "warppoint2_tourist_01_01")
  Fn_warpNpc("sm24_tourist02", "warppoint2_tourist_02_01")
  Fn_sendEventComSb("setForceAlertnessRide", false)
  Fn_sendEventComSb("endDispAlertness")
  Fn_fadein()
  waitSeconds(1)
  Fn_kaiwaDemoView("sm24_00500k")
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8()
  L0_8()
  L0_8()
  L0_8()
end
function Finalize()
  if man_back_eye_pos_node ~= nil then
    if man_back_eye_pos_node:getParent() ~= nil then
      man_back_eye_pos_node:leaveFromParent()
    end
    man_back_eye_pos_node:try_term()
    man_back_eye_pos_node = nil
  end
  if lost_man_caption_timer_task ~= nil then
    lost_man_caption_timer_task:abort()
    lost_man_caption_timer_task = nil
  end
end
function sdemoLookAtMan()
  sdemo:reset()
  sdemo:set("locator2_sdemo_02_cam_01", "locator2_sdemo_02_aim_01")
  sdemo:play()
  Fn_missionStart()
  Fn_kaiwaDemoView("sm24_00300k")
  Fn_playMotionNpc("sm24_man01", "greeting", false)
  Sound:playSE("m33_915b", 1, "", puppet_tbl.sm24_man01)
  Fn_captionView("sm24_01014")
  while Fn_findNpc("sm24_man01"):isMotionEnd() == false do
    wait()
  end
  waitSeconds(3)
  Sound:playSE("kit033c", 1)
  Fn_captionView("sm24_01015")
  waitSeconds(1)
  RAC_invokeMoveCharaTask("sm24_man01", "locator2_sdemo_02_man_move_", {
    arrivedLength = 0.5,
    anim_walk_speed = man_param_data.walk_speed,
    runLength = 1000000,
    recast = true
  }):abort()
  sdemo:stop(1)
end
function invokeManSoliloqueTask()
  local L0_12, L1_13, L2_14
  L0_12 = {
    L1_13,
    L2_14,
    {
      {
        sensor_name = "cubesensor2_turn_c_01",
        turn_to_loc_name = "locator2_turn_look_c_01",
        caption = "sm24_01019",
        se = "m33_903c"
      },
      {
        sensor_name = "cubesensor2_soliloque_c_01",
        turn_to_loc_name = nil,
        caption = "sm24_01020",
        se = nil
      }
    },
    {
      {
        sensor_name = "cubesensor2_turn_d_01",
        turn_to_loc_name = "locator2_turn_look_d_01",
        caption = "sm24_01021",
        se = "m33_920a"
      },
      {
        sensor_name = "cubesensor2_soliloque_d_01",
        turn_to_loc_name = nil,
        caption = "sm24_01022",
        se = nil
      }
    },
    {}
  }
  L1_13 = {}
  L2_14 = {
    {
      sensor_name = "cubesensor2_turn_b_01",
      turn_to_loc_name = "locator2_turn_look_b_01",
      caption = "sm24_01017",
      se = "m33_932b"
    },
    {
      sensor_name = "cubesensor2_soliloque_b_01",
      turn_to_loc_name = nil,
      caption = "sm24_01018",
      se = nil
    }
  }
  L1_13 = nil
  L2_14 = false
  function update()
    local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20
    for L3_18, L4_19 in L0_15(L1_16) do
      is_in_sensor_pup = false
      L5_20 = L4_19.sensor_name
      L1_13 = L5_20
      L5_20 = Fn_sensorOn
      L5_20(L1_13)
      while true do
        L5_20 = is_in_sensor_pup
        if L5_20 == false then
          L5_20 = wait
          L5_20()
        end
      end
      L5_20 = Fn_sensorOff
      L5_20(L1_13)
      L5_20 = nil
      L1_13 = L5_20
      is_in_sensor_pup = false
      L5_20 = L4_19.caption
      if L5_20 ~= nil then
        L5_20 = Fn_getDistanceToPlayer
        L5_20 = L5_20(puppet_tbl.sm24_man01)
        if L5_20 <= man_soliloque_range then
          L5_20 = Fn_captionView
          L5_20(L4_19.caption)
        end
      end
      L5_20 = L4_19.se
      if L5_20 ~= nil then
        L5_20 = Sound
        L5_20 = L5_20.playSE
        L5_20(L5_20, L4_19.se, 1, "", puppet_tbl.sm24_man01)
      end
      L5_20 = L4_19.turn_to_loc_name
      if L5_20 ~= nil then
        L5_20 = waitSeconds
        L5_20(0.5)
        L5_20 = Fn_findNpc
        L5_20 = L5_20("sm24_man01")
        L5_20:pauseMove(true)
        L2_14 = true
        Fn_turnNpc(L5_20, L4_19.turn_to_loc_name)
        while Fn_sendEventComSb("getIsAlertnessUp") == true do
          wait()
        end
        waitSeconds(2)
        L5_20:pauseMove(false)
        L2_14 = false
      end
    end
  end
  function destractor()
    if L1_13 ~= nil then
      Fn_sensorOff(L1_13)
      is_in_sensor_pup = false
      L1_13 = nil
    end
    if L2_14 == true and Fn_sendEventComSb("getIsAlertnessUp") == false then
      Fn_findNpc("sm24_man01"):pauseMove(false)
      L2_14 = false
    end
  end
  return RAC_InvokeTaskWithDestractor(update, destractor)
end
caution_flag = false
function invokeCheckDistWithMan()
  return invokeTask(function()
    while true do
      wait()
      if Fn_getDistanceToPlayer(puppet_tbl.sm24_man01) >= eavesdropping_far_navi_range and caution_flag == false then
        Fn_captionView("sm24_01023")
        caution_flag = true
      end
      if Fn_getDistanceToPlayer(puppet_tbl.sm24_man01) < eavesdropping_far_navi_range then
        caution_flag = false
      end
    end
  end)
end
function invokeLostManCaptionTimer()
  _tailing_end = false
  return invokeTask(function()
    local L0_21
    L0_21 = 0
    while _tailing_end == false do
      wait()
      if Fn_getDistanceToPlayer(puppet_tbl.sm24_man01) > man_lost_caption_range and Fn_isInSightTarget(puppet_tbl.sm24_man01, 1) == false and caution_flag == false then
        L0_21 = L0_21 + 1
        if L0_21 >= talk_out_caution_cap_interval then
          Fn_captionView("sm24_01024")
          L0_21 = 0
        end
      else
        L0_21 = 0
      end
    end
  end)
end
function invokeTalkGreetingTask(A0_22, A1_23, A2_24, A3_25)
  local L4_26
  if A0_22 == 1 then
    L4_26 = invokeTask
    return L4_26(function()
      invokeTask(function()
        Fn_turnNpc("sm24_man01", puppet_tbl[A1_23])
      end)
      Fn_turnNpc(A1_23, puppet_tbl.sm24_man01)
      Sound:playSE(A2_24, 1, "", puppet_tbl.sm24_man01)
      Fn_playMotionNpc("sm24_man01", "greeting", false)
      wait(10)
      Sound:playSE(A3_25, 1, "", puppet_tbl[A1_23])
      Fn_playMotionNpc(A1_23, "greeting", true)
    end)
  elseif A0_22 == 2 then
    L4_26 = invokeTask
    return L4_26(function()
      Fn_turnNpc(A1_23, puppet_tbl.sm24_man01)
      Sound:playSE(A3_25, 1, "", puppet_tbl[A1_23])
      Fn_playMotionNpc(A1_23, "greeting", false)
      wait(10)
      Fn_turnNpc("sm24_man01", puppet_tbl[A1_23])
      Sound:playSE(A2_24, 1, "", puppet_tbl.sm24_man01)
      Fn_playMotionNpc("sm24_man01", "greeting", true)
    end)
  else
    L4_26 = {}
    L4_26.man_turn_task = nil
    L4_26.talk_npc_turn_task = nil
    L4_26.main_task = invokeTask(function()
      local L0_27
      L0_27 = L4_26
      L0_27.man_turn_task = invokeTask(Fn_turnNpc, "sm24_man01", puppet_tbl[A1_23])
      L0_27.talk_npc_turn_task = invokeTask(Fn_turnNpc, A1_23, puppet_tbl.sm24_man01)
      while L0_27.man_turn_task:isRunning() or L0_27.talk_npc_turn_task:isRunning() do
        wait()
      end
      L0_27.man_turn_task:abort()
      L0_27.man_turn_task = nil
      L0_27.talk_npc_turn_task:abort()
      L0_27.talk_npc_turn_task = nil
    end)
    function L4_26.isRunning(A0_28)
      if A0_28.main_task == nil then
        return false
      end
      return A0_28.main_task:isRunning()
    end
    function L4_26.abort(A0_29)
      if A0_29.man_turn_task ~= nil then
        A0_29.man_turn_task:abort()
        A0_29.man_turn_task = nil
      end
      if A0_29.talk_npc_turn_task ~= nil then
        A0_29.talk_npc_turn_task:abort()
        A0_29.talk_npc_turn_task = nil
      end
      if A0_29.main_task ~= nil then
        A0_29.main_task:abort()
        A0_29.main_task = nil
      end
    end
    break
  end
end
function invokeCheatingManTalkTask(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42, L13_43, L14_44, L15_45
  L1_31 = 1
  L2_32 = 2
  L3_33 = 3
  L4_34 = 4
  L5_35 = 5
  L6_36 = 6
  L7_37 = 7
  L8_38 = 8
  L9_39 = 1
  L10_40 = 2
  L11_41 = 3
  L12_42 = {
    L13_43,
    L14_44,
    L15_45,
    {
      {
        condition = L2_32,
        pc_wait = true,
        sec_fixed = false,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01049",
        se = "kit043a",
        se_target = L9_39,
        mission = "sm24_01059",
        is_restart_point = false,
        out_caution_type = nil
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01050",
        se = "m33_909",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01051",
        se = "w16_909",
        se_target = L11_41,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01052",
        se = "m33_909",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = false,
        man_faint_move_prefix = "locator2_man_move_e_faint_",
        talk_npc_faint_move_prefix = "locator2_talk_npc_04_move_b_",
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01053",
        se = "m33_903a",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01054",
        se = "m33_909",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = WOM_MOTION.yes,
        info = nil,
        caption = "sm24_01055",
        se = "w16_909",
        se_target = L11_41,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01056",
        se = "m33_909",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      }
    },
    {
      {
        condition = L2_32,
        pc_wait = true,
        sec_fixed = false,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01057",
        se = "kit035b_1",
        se_target = L9_39,
        mission = "sm24_01059",
        is_restart_point = false,
        out_caution_type = nil
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01058",
        se = "w17_928a",
        se_target = L11_41,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = "locator2_talk_npc_05_move_b_",
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01096",
        se = "m33_924",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01060",
        se = "m33_909",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 1
      },
      {
        condition = L1_31,
        pc_wait = true,
        sec_fixed = false,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01061",
        se = nil,
        se_target = nil,
        mission = nil,
        is_restart_point = false,
        out_caution_type = nil
      },
      {
        condition = L7_37,
        pc_wait = false,
        sec_fixed = false,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01062",
        se = nil,
        se_target = nil,
        mission = nil,
        is_restart_point = true,
        out_caution_type = nil
      },
      {
        condition = L1_31,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = nil,
        se = nil,
        se_target = nil,
        mission = "sm24_01063",
        is_restart_point = false,
        out_caution_type = nil
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01064",
        se = "w17_909",
        se_target = L11_41,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 2
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01065",
        se = "m33_909",
        se_target = L10_40,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 2
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01066",
        se = "w17_909",
        se_target = L11_41,
        mission = nil,
        is_restart_point = false,
        out_caution_type = 2
      },
      {
        condition = L3_33,
        pc_wait = true,
        sec_fixed = true,
        man_faint_move_prefix = nil,
        talk_npc_faint_move_prefix = nil,
        man_motion = nil,
        talk_npc_motion = nil,
        info = nil,
        caption = "sm24_01067",
        se = nil,
        se_target = nil,
        mission = nil,
        is_restart_point = true,
        out_caution_type = 2
      }
    }
  }
  L13_43 = {
    L14_44,
    L15_45,
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01027",
      se = "m33_909",
      se_target = L10_40,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01028",
      se = "w17_909",
      se_target = L11_41,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01029",
      se = "m33_909",
      se_target = L10_40,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    }
  }
  L14_44 = {}
  L14_44.condition = L2_32
  L14_44.pc_wait = true
  L14_44.sec_fixed = false
  L14_44.man_faint_move_prefix = nil
  L14_44.talk_npc_faint_move_prefix = nil
  L14_44.man_motion = nil
  L14_44.talk_npc_motion = nil
  L14_44.info = nil
  L14_44.caption = "sm24_01025"
  L14_44.se = "kit020a"
  L14_44.se_target = L9_39
  L14_44.mission = nil
  L14_44.is_restart_point = false
  L14_44.out_caution_type = nil
  L15_45 = {}
  L15_45.condition = L1_31
  L15_45.pc_wait = true
  L15_45.sec_fixed = false
  L15_45.man_faint_move_prefix = nil
  L15_45.talk_npc_faint_move_prefix = nil
  L15_45.man_motion = nil
  L15_45.talk_npc_motion = nil
  L15_45.info = nil
  L15_45.caption = "sm24_01026"
  L15_45.se = nil
  L15_45.se_target = nil
  L15_45.mission = "sm24_01059"
  L15_45.is_restart_point = false
  L15_45.out_caution_type = nil
  L14_44 = {
    L15_45,
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01031",
      se = "w16_909",
      se_target = L11_41,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01032",
      se = "m33_909",
      se_target = L10_40,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    },
    {
      condition = L1_31,
      pc_wait = true,
      sec_fixed = false,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01033",
      se = nil,
      se_target = nil,
      mission = nil,
      is_restart_point = false,
      out_caution_type = nil
    },
    {
      condition = L7_37,
      pc_wait = false,
      sec_fixed = false,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01034",
      se = nil,
      se_target = nil,
      mission = nil,
      is_restart_point = true,
      out_caution_type = nil
    },
    {
      condition = L1_31,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = "sm24_info_02",
      caption = nil,
      se = nil,
      se_target = nil,
      mission = "sm24_01063",
      is_restart_point = false,
      out_caution_type = 2
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01035",
      se = "m33_909",
      se_target = L10_40,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 2
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01036",
      se = "w16_909",
      se_target = L11_41,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 2
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01037",
      se = "m33_909",
      se_target = L10_40,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 2
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01038",
      se = "w16_909",
      se_target = L11_41,
      mission = nil,
      is_restart_point = true,
      out_caution_type = 2
    }
  }
  L15_45 = {}
  L15_45.condition = L2_32
  L15_45.pc_wait = true
  L15_45.sec_fixed = false
  L15_45.man_faint_move_prefix = nil
  L15_45.talk_npc_faint_move_prefix = nil
  L15_45.man_motion = nil
  L15_45.talk_npc_motion = nil
  L15_45.info = nil
  L15_45.caption = "sm24_01030"
  L15_45.se = nil
  L15_45.se_target = nil
  L15_45.mission = "sm24_01059"
  L15_45.is_restart_point = false
  L15_45.out_caution_type = nil
  L15_45 = {
    {
      condition = L2_32,
      pc_wait = true,
      sec_fixed = false,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01039",
      se = "kit020a",
      se_target = L9_39,
      mission = "sm24_01059",
      is_restart_point = false,
      out_caution_type = nil
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01040",
      se = "w18_909",
      se_target = L11_41,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01041",
      se = "m33_909",
      se_target = L10_40,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01042",
      se = "w18_909",
      se_target = L11_41,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 1
    },
    {
      condition = L1_31,
      pc_wait = true,
      sec_fixed = false,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01043",
      se = nil,
      se_target = nil,
      mission = nil,
      is_restart_point = false,
      out_caution_type = nil
    },
    {
      condition = L7_37,
      pc_wait = false,
      sec_fixed = false,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01044",
      se = nil,
      se_target = nil,
      mission = nil,
      is_restart_point = true,
      out_caution_type = nil
    },
    {
      condition = L1_31,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = nil,
      se = nil,
      se_target = nil,
      mission = "sm24_01063",
      is_restart_point = false,
      out_caution_type = nil
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01046",
      se = "w18_909",
      se_target = L11_41,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 2
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01047",
      se = "m33_909",
      se_target = L10_40,
      mission = nil,
      is_restart_point = false,
      out_caution_type = 2
    },
    {
      condition = L3_33,
      pc_wait = true,
      sec_fixed = true,
      man_faint_move_prefix = nil,
      talk_npc_faint_move_prefix = nil,
      man_motion = nil,
      talk_npc_motion = nil,
      info = nil,
      caption = "sm24_01048",
      se = "w18_911b",
      se_target = L11_41,
      mission = nil,
      is_restart_point = true,
      out_caution_type = 2
    }
  }
  function L13_43(A0_46, A1_47)
    local L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55
    if A1_47 == nil then
      A1_47 = 1
    end
    L2_48 = false
    L3_49 = nil
    L4_50 = false
    L5_51 = L1_31
    if A0_46 == L5_51 then
      L2_48 = true
    else
      L5_51 = L2_32
      if A0_46 == L5_51 then
        L4_50 = true
      else
        L5_51 = L7_37
        if A0_46 == L5_51 then
          L5_51 = photo_success
          if L5_51 == false then
            L2_48 = true
          end
        else
          L5_51 = L8_38
          if A0_46 == L5_51 then
            L5_51 = photo_success
            if L5_51 == true then
              L2_48 = true
            end
          else
            L5_51 = L3_33
            if A0_46 == L5_51 then
              L5_51 = Fn_getDistanceToPlayer
              L6_52 = puppet_tbl
              L6_52 = L6_52.sm24_man01
              L5_51 = L5_51(L6_52)
              if A1_47 == 1 then
                L6_52 = eavesdropping_range
              else
                if not (L5_51 < L6_52) then
                  if A1_47 == 2 then
                    L6_52 = eavesdropping_far_navi_range
                  end
              end
              elseif L5_51 < L6_52 then
                L2_48 = true
              end
            else
              L5_51 = L4_34
              if A0_46 == L5_51 then
                L5_51 = Fn_getDistanceToPlayer
                L6_52 = puppet_tbl
                L6_52 = L6_52.sm24_man01
                L5_51 = L5_51(L6_52)
                L6_52 = near_insight_range
                if L5_51 < L6_52 then
                  L4_50 = true
                end
              else
                L5_51 = L5_35
                if A0_46 ~= L5_51 then
                  L5_51 = L6_36
                elseif A0_46 == L5_51 then
                  L5_51 = Fn_getDistanceToPlayer
                  L6_52 = puppet_tbl
                  L6_52 = L6_52.sm24_man01
                  L5_51 = L5_51(L6_52)
                  L6_52 = eavesdropping_range
                  if L5_51 >= L6_52 then
                    L6_52 = L5_35
                    if A0_46 == L6_52 then
                      L2_48 = true
                    else
                      L6_52 = L6_36
                      if A0_46 == L6_52 then
                        L4_50 = true
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if L4_50 == true then
      L5_51 = Fn_getDistanceToPlayer
      L6_52 = A0_30
      L5_51 = L5_51(L6_52)
      L6_52 = false
      L7_53 = Camera
      L8_54 = L7_53
      L7_53 = L7_53.getEyePos
      L7_53 = L7_53(L8_54)
      L8_54 = Query
      L9_55 = L8_54
      L8_54 = L8_54.setEyeSightRange
      L8_54(L9_55, L5_51 + 1)
      L8_54 = A0_30
      L9_55 = L8_54
      L8_54 = L8_54.getWorldTransform
      L9_55 = L8_54(L9_55)
      L8_54.y = L8_54.y + 1.5
      Query:setEyeSightTransform(L8_54, L9_55)
      if Query:raycastEyeSight(L7_53) == nil and Fn_isInSightTarget(A0_30, 1) == true then
        L6_52 = true
      end
      if L6_52 == true then
        L2_48 = true
      end
    end
    return L2_48
  end
  function L14_44(A0_56, A1_57)
    local L2_58
    L2_58 = {
      {
        "sm24_01068",
        "sm24_01069",
        "sm24_01070"
      },
      {
        "sm24_01071",
        "sm24_01072",
        "sm24_01073"
      },
      {"sm24_01074"}
    }
    return invokeTask(function()
      if A1_57 ~= nil then
        if A1_57 == 1 then
        elseif A1_57 == 2 then
          if photo_success == false then
          else
          end
        end
        Fn_captionView(L2_58[3][RandI(1, #L2_58[3])])
      end
    end)
  end
  L15_45 = {}
  L15_45.caution_task = nil
  L15_45.check_man_back_task = nil
  L15_45.main_task = invokeTask(function()
    local L0_59, L1_60, L2_61, L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68, L10_69, L11_70
    L0_59 = L15_45
    L1_60, L2_61 = nil, nil
    if L3_62 ~= nil then
    else
    end
    for L6_65 = L3_62 or 1, #L4_63 do
      L7_66 = tailing_phase
      L7_66 = L12_42[L7_66]
      L7_66 = L7_66[L6_65]
      L8_67 = L7_66.is_restart_point
      if L8_67 == true then
        restart_talk_index = L6_65
        L8_67 = tailing_phase
        L8_67 = L12_42[L8_67]
        L9_68 = L6_65 + 1
        L8_67 = L8_67[L9_68]
        if L8_67 == nil then
          L8_67 = L6_65 + 1
          restart_talk_index = L8_67
        end
      end
      if L1_60 ~= nil then
        L8_67 = L7_66.condition
        if L1_60 == L8_67 then
          L8_67 = L7_66.out_caution_type
        end
      elseif L2_61 ~= L8_67 then
        L8_67 = L0_59.caution_task
        if L8_67 ~= nil then
          L8_67 = L0_59.caution_task
          L9_68 = L8_67
          L8_67 = L8_67.abort
          L8_67(L9_68)
          L0_59.caution_task = nil
        end
        L1_60 = L7_66.condition
        L2_61 = L7_66.out_caution_type
      end
      L8_67 = false
      while true do
        L9_68 = wait
        L9_68()
        L9_68 = L13_43
        L10_69 = L7_66.condition
        L9_68 = L9_68(L10_69)
        L8_67 = L9_68
        if L8_67 ~= true then
          L9_68 = L7_66.pc_wait
        end
        if L9_68 ~= false then
          if L8_67 == false then
            L9_68 = L0_59.caution_task
            if L9_68 == nil then
              L9_68 = L14_44
              L10_69 = L7_66.condition
              L11_70 = L7_66.out_caution_type
              L9_68 = L9_68(L10_69, L11_70)
              L0_59.caution_task = L9_68
            end
          end
        end
      end
      if L8_67 == true then
        L9_68 = L0_59.caution_task
        if L9_68 ~= nil then
          L9_68 = L0_59.caution_task
          L10_69 = L9_68
          L9_68 = L9_68.abort
          L9_68(L10_69)
          L0_59.caution_task = nil
        end
      end
      L9_68 = tailing_data_tbl
      L10_69 = tailing_phase
      L9_68 = L9_68[L10_69]
      L10_69 = L7_66.man_faint_move_prefix
      if L10_69 == nil then
        L10_69 = L7_66.talk_npc_faint_move_prefix
      else
        if L10_69 ~= nil then
          L10_69 = tailing_phase
          if L10_69 <= 4 then
            L10_69 = invokeTalkGreetingTask
            L11_70 = L9_68.talk_end_greeting_type
            L10_69 = L10_69(L11_70, L9_68.talk_npc_name, man_param_data.bye_se, L9_68.talk_npc_bye_se)
            while true do
              L11_70 = L10_69.isRunning
              L11_70 = L11_70(L10_69)
              if L11_70 then
                L11_70 = wait
                L11_70()
              end
            end
            L11_70 = L10_69.abort
            L11_70(L10_69)
            L10_69 = nil
          end
          L10_69 = nil
          L11_70 = tailing_phase
          if L11_70 >= 5 then
            L11_70 = RAC_invokeMoveCharaTask
            L11_70 = L11_70(L9_68.talk_npc_name, L7_66.talk_npc_faint_move_prefix, {
              arrivedLength = 0.5,
              runLength = 1000000,
              recast = true
            })
            L10_69 = L11_70
            while true do
              L11_70 = L10_69.isRunning
              L11_70 = L11_70(L10_69)
              if L11_70 then
                L11_70 = wait
                L11_70()
              end
            end
            L11_70 = L10_69.abort
            L11_70(L10_69)
            L10_69 = nil
            L11_70 = Fn_playMotionNpc
            L11_70(L9_68.talk_npc_name, "walk_b", false)
            L11_70 = waitSeconds
            L11_70(0.3)
            L11_70 = Fn_playMotionNpc
            L11_70(L9_68.talk_npc_name, tailing_data_tbl[tailing_phase].talk_npc_talk_motion_tbl, false, {animBlendDuration = 0.3})
          else
            L11_70 = RAC_invokeMoveCharaTask
            L11_70 = L11_70(L9_68.talk_npc_name, L7_66.talk_npc_faint_move_prefix, {
              arrivedLength = 0.5,
              runLength = 1000000,
              recast = true
            })
            L10_69 = L11_70
          end
          L11_70 = L7_66.man_faint_move_prefix
          if L11_70 ~= nil then
            L11_70 = RAC_invokeMoveCharaTask
            L11_70 = L11_70("sm24_man01", L7_66.man_faint_move_prefix, {
              arrivedLength = 0.5,
              anim_walk_speed = man_param_data.walk_speed,
              runLength = 1000000,
              recast = true
            })
            while L11_70:isRunning() do
              wait()
            end
            RAC_stopNpcMoveTask("sm24_man01")
            wait()
          end
          L11_70 = L7_66.info
          if L11_70 ~= nil then
            L11_70 = Fn_captionViewEnd
            L11_70()
            L11_70 = showInfo
            L11_70(L7_66.info, 0, true)
          end
          L11_70 = L7_66.se
          if L11_70 ~= nil then
            if L8_67 ~= true then
              L11_70 = L7_66.sec_fixed
            elseif L11_70 == true then
              while true do
                L11_70 = Fn_isCaptionView
                L11_70 = L11_70()
                if L11_70 then
                  L11_70 = wait
                  L11_70()
                end
              end
              L11_70 = nil
              if L7_66.se_target == L9_39 then
                L11_70 = nil
              elseif L7_66.se_target == L10_40 then
                L11_70 = puppet_tbl.sm24_man01
              elseif L7_66.se_target == L11_41 then
                L11_70 = puppet_tbl[L9_68.talk_npc_name]
              end
              Sound:playSE(L7_66.se, 0.8, "", L11_70)
            end
          end
          L11_70 = L7_66.caption
          if L11_70 ~= nil then
            if L8_67 == true then
              while true do
                L11_70 = Fn_isCaptionView
                L11_70 = L11_70()
                if L11_70 then
                  L11_70 = wait
                  L11_70()
                end
              end
              L11_70 = Fn_captionView
              L11_70(L7_66.caption)
              L11_70 = invokeTask
              L11_70 = L11_70(waitSeconds, 0.5)
              wait_task = L11_70
            else
              L11_70 = L7_66.sec_fixed
              if L11_70 == true then
                L11_70 = invokeTask
                L11_70 = L11_70(waitSeconds, 0.5)
                wait_task = L11_70
              end
            end
          end
          L11_70 = wait_task
          if L11_70 ~= nil then
            while true do
              L11_70 = wait_task
              L11_70 = L11_70.isRunning
              L11_70 = L11_70(L11_70)
              if L11_70 then
                L11_70 = wait
                L11_70()
              end
            end
            L11_70 = wait_task
            L11_70 = L11_70.abort
            L11_70(L11_70)
            wait_task = nil
          end
          saw_by_man = false
          L11_70 = invokeTask
          L11_70(function()
            Fn_turnNpc("sm24_man01", puppet_tbl[L9_68.talk_npc_name])
            if RAC_RaycastEyeSightBase(puppet_tbl.sm24_man01, Fn_getPlayer(), Fn_getDistanceToPlayer(puppet_tbl.sm24_man01) + 1, 90, 1.5, 1.5) == true then
              saw_by_man = true
            end
            if L7_66.man_motion ~= nil then
              Fn_playMotionNpc("sm24_man01", L7_66.man_motion, false, {animBlendDuration = 0.3})
            end
          end)
          L11_70 = tailing_phase
          if L11_70 <= 4 then
            L11_70 = RAC_stopNpcMoveTask
            L11_70(L9_68.talk_npc_name)
          end
          L11_70 = waitSeconds
          L11_70(0.5)
          L11_70 = Fn_turnNpc
          L11_70(L9_68.talk_npc_name, puppet_tbl.sm24_man01)
          L11_70 = L7_66.talk_npc_motion
          if L11_70 ~= nil then
            L11_70 = Fn_playMotionNpc
            L11_70(L9_68.talk_npc_name, L7_66.talk_npc_motion, false, {isStop = true, animBlendDuration = 0.3})
          end
      end
      else
        L10_69 = L7_66.info
        if L10_69 ~= nil then
          L10_69 = Fn_captionViewEnd
          L10_69()
          L10_69 = showInfo
          L11_70 = L7_66.info
          L10_69(L11_70, 0, true)
        end
        L10_69 = L7_66.man_motion
        if L10_69 ~= nil then
          L10_69 = Fn_playMotionNpc
          L11_70 = "sm24_man01"
          L10_69(L11_70, L7_66.man_motion, false, {animBlendDuration = 0.3})
        end
        L10_69 = L7_66.talk_npc_motion
        if L10_69 ~= nil then
          L10_69 = Fn_playMotionNpc
          L11_70 = L9_68.talk_npc_name
          L10_69(L11_70, L7_66.talk_npc_motion, false, {isStop = true, animBlendDuration = 0.3})
        end
        L10_69 = L7_66.se
        if L10_69 ~= nil then
          if L8_67 ~= true then
            L10_69 = L7_66.sec_fixed
          elseif L10_69 == true then
            while true do
              L10_69 = Fn_isCaptionView
              L10_69 = L10_69()
              if L10_69 then
                L10_69 = wait
                L10_69()
              end
            end
            L10_69 = nil
            L11_70 = L7_66.se_target
            if L11_70 == L9_39 then
              L10_69 = nil
            else
              L11_70 = L7_66.se_target
              if L11_70 == L10_40 then
                L11_70 = puppet_tbl
                L10_69 = L11_70.sm24_man01
              else
                L11_70 = L7_66.se_target
                if L11_70 == L11_41 then
                  L11_70 = puppet_tbl
                  L10_69 = L11_70[L9_68.talk_npc_name]
                end
              end
            end
            L11_70 = Sound
            L11_70 = L11_70.playSE
            L11_70(L11_70, L7_66.se, 0.8, "", L10_69)
          end
        end
        L10_69 = L7_66.caption
        if L10_69 ~= nil then
          if L8_67 == true then
            while true do
              L10_69 = Fn_isCaptionView
              L10_69 = L10_69()
              if L10_69 then
                L10_69 = wait
                L10_69()
              end
            end
            L10_69 = Fn_captionViewWait
            L11_70 = L7_66.caption
            L10_69(L11_70)
          else
            L10_69 = L7_66.sec_fixed
            if L10_69 == true then
              L10_69 = waitSeconds
              L11_70 = 3
              L10_69(L11_70)
            end
          end
        end
      end
      L10_69 = L7_66.man_motion
      if L10_69 ~= nil then
        L10_69 = Fn_findNpc
        L11_70 = "sm24_man01"
        L10_69 = L10_69(L11_70)
        while true do
          L11_70 = L10_69.isMotionEnd
          L11_70 = L11_70(L10_69)
          if L11_70 == false then
            L11_70 = wait
            L11_70()
          end
        end
        L11_70 = Fn_playMotionNpc
        L11_70("sm24_man01", man_param_data.talk_motion_tbl, false, {
          isRepeat = true,
          isRandom = true,
          animBlendDuration = 0.3
        })
      end
      L10_69 = L7_66.talk_npc_motion
      if L10_69 ~= nil then
        L10_69 = Fn_findNpc
        L11_70 = L9_68.talk_npc_name
        L10_69 = L10_69(L11_70)
        while true do
          L11_70 = L10_69.isMotionEnd
          L11_70 = L11_70(L10_69)
          if L11_70 == false then
            L11_70 = wait
            L11_70()
          end
        end
        L11_70 = Fn_playMotionNpc
        L11_70(tailing_data_tbl[tailing_phase].talk_npc_name, tailing_data_tbl[tailing_phase].talk_npc_talk_motion_tbl, false, {
          isRepeat = true,
          isRandom = true,
          animBlendDuration = 0.3
        })
      end
      L10_69 = invokeCheckManBackTask
      L11_70 = puppet_tbl
      L11_70 = L11_70[tailing_data_tbl[tailing_phase].talk_npc_name]
      L10_69 = L10_69(L11_70, man_param_data.talk_motion_tbl)
      L0_59.check_man_back_task = L10_69
      while true do
        L10_69 = L0_59.check_man_back_task
        L11_70 = L10_69
        L10_69 = L10_69.isRunning
        L10_69 = L10_69(L11_70)
        if L10_69 then
          L10_69 = wait
          L10_69()
        end
      end
      L10_69 = L0_59.check_man_back_task
      L11_70 = L10_69
      L10_69 = L10_69.abort
      L10_69(L11_70)
      L0_59.check_man_back_task = nil
      L10_69 = L7_66.mission
      if L10_69 ~= nil then
        L10_69 = string
        L10_69 = L10_69.match
        L11_70 = L7_66.mission
        L10_69 = L10_69(L11_70, "sm24_01063")
        if L10_69 ~= nil then
          L10_69 = invokeTakePictureTask
          L11_70 = kPHOTO_CAPTION_OFF
          L10_69 = L10_69(L11_70)
          take_picture_task = L10_69
        end
        L10_69 = Fn_missionView
        L11_70 = L7_66.mission
        L10_69(L11_70)
      end
      L10_69 = invokeCheckManBackTask
      L11_70 = puppet_tbl
      L11_70 = L11_70[tailing_data_tbl[tailing_phase].talk_npc_name]
      L10_69 = L10_69(L11_70, man_param_data.talk_motion_tbl)
      L0_59.check_man_back_task = L10_69
      while true do
        L10_69 = L0_59.check_man_back_task
        L11_70 = L10_69
        L10_69 = L10_69.isRunning
        L10_69 = L10_69(L11_70)
        if L10_69 then
          L10_69 = wait
          L10_69()
        end
      end
      L10_69 = L0_59.check_man_back_task
      L11_70 = L10_69
      L10_69 = L10_69.abort
      L10_69(L11_70)
      L0_59.check_man_back_task = nil
      break
    end
    if L3_62 ~= nil then
      L3_62(L4_63)
      L0_59.caution_task = nil
    end
  end)
  function L15_45.isRunning(A0_71)
    if A0_71.main_task == nil then
      return false
    end
    return A0_71.main_task:isRunning()
  end
  function L15_45.abort(A0_72)
    if A0_72.caution_task ~= nil then
      A0_72.caution_task:abort()
      A0_72.caution_task = nil
    end
    if A0_72.check_man_back_task ~= nil then
      A0_72.check_man_back_task:abort()
      A0_72.check_man_back_task = nil
    end
    if A0_72.main_task ~= nil then
      A0_72.main_task:abort()
      A0_72.main_task = nil
    end
  end
  return L15_45
end
function invokeStartMoveCaptionTask()
  local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84
  L0_73 = 1
  L1_74 = 2
  L2_75 = 3
  L3_76 = 4
  L4_77 = 5
  L5_78 = 6
  L6_79 = 7
  L7_80 = 8
  L8_81 = 1
  L9_82 = 2
  L10_83 = 3
  L11_84 = {
    {
      {
        condition = L0_73,
        caption = "sm24_01075",
        se = nil
      }
    },
    {
      {
        condition = L0_73,
        caption = "sm24_01076",
        se = "kit032c",
        se_target = L8_81
      },
      {
        condition = L0_73,
        caption = "sm24_01077",
        se = nil,
        se_target = nil
      }
    },
    {
      {
        condition = L2_75,
        caption = "sm24_01078",
        se = nil,
        se_target = nil
      },
      {
        condition = L0_73,
        caption = "sm24_01079",
        se = nil,
        se_target = nil
      },
      {
        condition = L0_73,
        caption = "sm24_01080",
        se = nil,
        se_target = nil
      }
    },
    {
      {
        condition = L6_79,
        caption = "sm24_01081",
        se = nil,
        se_target = nil
      },
      {
        condition = L7_80,
        caption = "sm24_01082",
        se = nil,
        se_target = nil
      },
      {
        condition = L0_73,
        caption = "sm24_01083",
        se = "kit033c",
        se_target = L8_81
      }
    },
    {
      {
        condition = L0_73,
        caption = "sm24_01084",
        se = nil,
        se_target = nil
      }
    }
  }
  return invokeTask(function()
    local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90, L6_91
    if L0_85 ~= nil then
      for L3_88, L4_89 in L0_85(L1_86) do
        L5_90 = false
        L6_91 = nil
        if L4_89.condition == L0_73 then
          L5_90 = true
        elseif L4_89.condition == L1_74 then
          L6_91 = Fn_getDistanceToPlayer(puppet_tbl.sm24_man01)
        elseif L4_89.condition == L6_79 then
          if saw_by_man == true then
            L5_90 = true
          end
        elseif L4_89.condition == L7_80 then
          if saw_by_man == false then
            L5_90 = true
          end
        elseif L4_89.condition == L2_75 or L4_89.condition == L3_76 then
          if Fn_getDistanceToPlayer(puppet_tbl.sm24_man01) < eavesdropping_range then
            if L4_89.condition == L2_75 then
              L5_90 = true
            elseif L4_89.condition == L3_76 then
              L6_91 = Fn_getDistanceToPlayer(puppet_tbl.sm24_man01)
            end
          end
        elseif (L4_89.condition == L4_77 or L4_89.condition == L5_78) and Fn_getDistanceToPlayer(puppet_tbl.sm24_man01) >= eavesdropping_range then
          if L4_89.condition == L4_77 then
            L5_90 = true
          elseif L4_89.condition == L5_78 then
            L6_91 = Fn_getDistanceToPlayer(puppet_tbl.sm24_man01)
          end
        end
        if L6_91 ~= nil and Fn_isInSightTarget(puppet_tbl.sm24_man01, 1) == true and RAC_RaycastEyeSight(puppet_tbl.sm24_man01, L6_91, 90, 1.5, 1.5) == true then
          L5_90 = true
        end
        if L5_90 == true then
          L6_91 = L4_89.se
          if L6_91 ~= nil then
            L6_91 = nil
            if L4_89.se_target == L8_81 then
              L6_91 = nil
            elseif L4_89.se_target == L9_82 then
              L6_91 = puppet_tbl.sm24_man01
            elseif L4_89.se_target == L10_83 then
              L6_91 = puppet_tbl[tailing_data_tbl[tailing_phase].talk_npc_name]
            end
            Sound:playSE(L4_89.se, 1, "", L6_91)
          end
          L6_91 = Fn_captionViewWait
          L6_91(L4_89.caption)
        end
      end
    end
  end)
end
function invokeTakePictureTask(A0_92, A1_93)
  local L2_94
  L2_94 = {}
  L2_94.photo = nil
  L2_94.hint_task = nil
  L2_94.main_task = invokeTask(function()
    local L0_95, L1_96
    L0_95 = L2_94
    L1_96 = Photo
    L1_96 = L1_96.create
    L1_96 = L1_96(A0_92, kPHOTO_TYPE_ALL, true, {near = 1.5, far = 18}, {
      left = -0.95,
      right = 0.95,
      top = -0.95,
      bottom = 0.95
    })
    L0_95.photo = L1_96
    L1_96 = L0_95.photo
    L1_96 = L1_96.set
    L1_96(L1_96, puppet_tbl.sm24_man01)
    L1_96 = L0_95.photo
    L1_96 = L1_96.set
    L1_96(L1_96, puppet_tbl[tailing_data_tbl[tailing_phase].talk_npc_name])
    L1_96 = invokeTask
    L1_96 = L1_96(waitSeconds, take_pic_hint_second)
    L0_95.timer_task = L1_96
    while true do
      L1_96 = L0_95.photo
      L1_96 = L1_96.run
      L1_96(L1_96)
      repeat
        L1_96 = wait
        L1_96()
        L1_96 = A1_93
        if L1_96 ~= nil then
          L1_96 = L0_95.timer_task
          L1_96 = L1_96.isRunning
          L1_96 = L1_96(L1_96)
          if L1_96 == false then
            L1_96 = L0_95.hint_task
            if L1_96 == nil then
              L1_96 = invokePhotoPosHintTask
              L1_96 = L1_96(A1_93)
              L0_95.hint_task = L1_96
              L1_96 = print
              L1_96("HINT\232\181\183\229\139\149!!!!!!!!!!!!!!!")
            end
          end
        end
        L1_96 = Fn_sendEventComSb
        L1_96 = L1_96("getTailingRestartType")
        if L1_96 ~= 0 then
          L1_96 = L0_95.photo
          L1_96 = L1_96.kill
          L1_96(L1_96)
        end
        L1_96 = L0_95.photo
        L1_96 = L1_96.isRunning
        L1_96 = L1_96(L1_96)
      until not L1_96
      L1_96 = L0_95.photo
      L1_96 = L1_96.getPhotoState
      L1_96 = L1_96(L1_96)
      if L1_96 ~= nil then
        if type(L1_96) ~= "table" then
          L1_96 = {
            {state = L1_96}
          }
        end
        for _FORV_6_, _FORV_7_ in ipairs(L1_96) do
          if _FORV_7_.state == kPHOTO_OK then
          elseif _FORV_7_.state == kPHOTO_BACK then
            if _FORV_7_.target ~= nil and _FORV_7_.target == puppet_tbl[tailing_data_tbl[tailing_phase].talk_npc_name] then
              break
            else
            end
          elseif _FORV_7_.state == kPHOTO_ANGLE then
            break
          elseif _FORV_7_.state == kPHOTO_NEAR then
            break
          elseif _FORV_7_.state == kPHOTO_FAR then
            break
          elseif _FORV_7_.state == kPHOTO_OUT then
            break
          else
            print("\227\129\147\227\129\147\227\129\171\227\129\175\227\129\147\227\129\170\227\129\132\227\129\175\227\129\154")
            break
          end
        end
      end
      Fn_captionViewEnd()
      print("\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\229\137\138\233\153\164")
      if nil == 0 then
        if L0_95.hint_task ~= nil then
          L0_95.hint_task:abort()
          L0_95.hint_task = nil
        end
        photo_success = true
        Sound:playSE("kit_825", 1)
        Fn_missionViewEnd()
        Fn_captionViewWait("sm24_01085")
        break
      elseif nil == 1 then
        Sound:playSE("kit_823", 1)
        Fn_captionViewWait("sm24_01086")
      elseif nil == 2 then
        Sound:playSE("kit_821", 1)
        Fn_captionViewWait("sm24_01087")
      elseif nil == 3 then
        Sound:playSE("kit_822", 1)
        Fn_captionViewWait("sm24_01088")
      elseif nil == 4 then
        Sound:playSE("kit_823", 1)
        Fn_captionViewWait("sm24_01089")
      elseif nil == 5 then
        Sound:playSE("kit_823", 1)
        Fn_captionViewWait("sm24_01090")
      else
        print("\229\134\153\231\156\159\229\136\164\229\174\154\228\184\173\230\150\173")
        break
      end
    end
    L1_96 = L0_95.timer_task
    L1_96 = L1_96.abort
    L1_96(L1_96)
    L0_95.timer_task = nil
    L1_96 = L0_95.hint_task
    if L1_96 ~= nil then
      L1_96 = L0_95.hint_task
      L1_96 = L1_96.abort
      L1_96(L1_96)
      L0_95.hint_task = nil
    end
    L0_95.photo = nil
  end)
  function L2_94.isRunning(A0_97)
    if A0_97.main_task == nil then
      return false
    end
    return A0_97.main_task:isRunning()
  end
  function L2_94.abort(A0_98)
    if A0_98.photo ~= nil then
      A0_98.photo:kill()
      A0_98.photo = nil
    end
    if A0_98.timer_task ~= nil then
      A0_98.timer_task:abort()
      A0_98.timer_task = nil
    end
    if A0_98.hint_task ~= nil then
      A0_98.hint_task:abort()
      A0_98.hint_task = nil
    end
    if A0_98.main_task ~= nil then
      A0_98.main_task:abort()
      A0_98.main_task = nil
    end
  end
  return L2_94
end
function invokePhotoPosHintTask(A0_99)
  local L1_100
  L1_100 = {}
  L1_100.timer_task = nil
  L1_100.timer_task2 = nil
  L1_100.navi_flag = false
  L1_100.sensor_flag = false
  L1_100.main_task = invokeTask(function()
    local L0_101, L1_102, L2_103
    L0_101 = L1_100
    is_in_sensor = false
    L1_102 = Fn_pcSensorOn
    L2_103 = A0_99.sensor_name
    L1_102(L2_103)
    L0_101.sensor_flag = true
    L1_102 = invokeTask
    L2_103 = waitSeconds
    L1_102 = L1_102(L2_103, 1)
    L0_101.timer_task2 = L1_102
    L1_102 = findGameObject2
    L2_103 = "Node"
    L1_102 = L1_102(L2_103, A0_99.ray_chk_node_name)
    while true do
      L2_103 = RAC_RaycastEyeSight
      L2_103 = L2_103(L1_102, Fn_getDistanceToPlayer(L1_102) + 1, 180, 1.5, 0)
      if L2_103 == false then
        L2_103 = L0_101.timer_task
        if L2_103 ~= nil then
          L2_103 = L0_101.timer_task
          L2_103 = L2_103.isRunning
          L2_103 = L2_103(L2_103)
        elseif L2_103 == false then
          L2_103 = Fn_captionView
          L2_103("sm24_01091")
          L2_103 = invokeTask
          L2_103 = L2_103(waitSeconds, take_pic_hint_invisible_cap_interval)
          L0_101.timer_task = L2_103
        end
        L2_103 = wait
        L2_103()
      end
    end
    L2_103 = L0_101.timer_task
    if L2_103 ~= nil then
      L2_103 = L0_101.timer_task
      L2_103 = L2_103.abort
      L2_103(L2_103)
      L0_101.timer_task = nil
    end
    while true do
      L2_103 = L0_101.timer_task2
      L2_103 = L2_103.isRunning
      L2_103 = L2_103(L2_103)
      if L2_103 then
        L2_103 = wait
        L2_103()
      end
    end
    L2_103 = L0_101.timer_task2
    L2_103 = L2_103.abort
    L2_103(L2_103)
    L0_101.timer_task2 = nil
    L2_103 = findGameObject2
    L2_103 = L2_103("Node", A0_99.navi_node_name)
    while true do
      repeat
        if is_in_sensor == false then
          Fn_captionView("sm24_01092")
          RAC_MultiNaviAdd(L2_103)
          L0_101.navi_flag = true
          while is_in_sensor == false do
            wait()
          end
          RAC_MultiNaviDel(L2_103)
          L0_101.navi_flag = false
        end
        Fn_captionView("sm24_01093")
        while true do
          if is_in_sensor == false then
          else
          end
          wait()
        end
      until 0 < 30
    end
  end)
  function L1_100.abort(A0_104)
    if A0_104.timer_task ~= nil then
      A0_104.timer_task:abort()
      A0_104.timer_task = nil
    end
    if A0_104.timer_task2 ~= nil then
      A0_104.timer_task2:abort()
      A0_104.timer_task2 = nil
    end
    if A0_104.navi_flag == true then
      RAC_MultiNaviDel(findGameObject2("Node", A0_99.navi_node_name))
      A0_104.navi_flag = false
    end
    if A0_104.sensor_flag == true then
      Fn_pcSensorOff(A0_99.sensor_name)
      is_in_sensor = false
      A0_104.sensor_flag = false
    end
    if A0_104.main_task ~= nil then
      A0_104.main_task:abort()
      A0_104.main_task = nil
    end
  end
  return L1_100
end
function invokeCheckManBackTask(A0_105, A1_106)
  local L2_107
  L2_107 = {}
  L2_107.caption_timer_task = nil
  L2_107.main_task = invokeTask(function()
    local L0_108, L1_109, L2_110, L3_111, L4_112
    L0_108 = L2_107
    L1_109 = man_back_eye_pos_node
    if L1_109 == nil then
      L1_109 = createGameObject2
      L2_110 = "Node"
      L1_109 = L1_109(L2_110)
      man_back_eye_pos_node = L1_109
      L1_109 = man_back_eye_pos_node
      L2_110 = L1_109
      L1_109 = L1_109.setName
      L3_111 = "man_back_eye_pos"
      L1_109(L2_110, L3_111)
      L1_109 = puppet_tbl
      L1_109 = L1_109.sm24_man01
      if L1_109 ~= nil then
        L1_109 = puppet_tbl
        L1_109 = L1_109.sm24_man01
        L2_110 = L1_109
        L1_109 = L1_109.appendChild
        L3_111 = man_back_eye_pos_node
        L1_109(L2_110, L3_111)
      end
      L1_109 = man_back_eye_pos_node
      L2_110 = L1_109
      L1_109 = L1_109.setPos
      L3_111 = Vector
      L4_112 = 0
      L4_112 = L3_111(L4_112, 0, 0)
      L1_109(L2_110, L3_111, L4_112, L3_111(L4_112, 0, 0))
      L1_109 = man_back_eye_pos_node
      L2_110 = L1_109
      L1_109 = L1_109.setRot
      L3_111 = YRotQuat
      L4_112 = Deg2Rad
      L4_112 = L4_112(180)
      L4_112 = L3_111(L4_112, L4_112(180))
      L1_109(L2_110, L3_111, L4_112, L3_111(L4_112, L4_112(180)))
    end
    L1_109 = Fn_getPlayer
    L1_109 = L1_109()
    L2_110 = 0
    L3_111 = _check_man_back_flag
    if L3_111 then
      while true do
        L3_111 = RAC_RaycastEyeSightBase
        L4_112 = man_back_eye_pos_node
        L3_111 = L3_111(L4_112, L1_109, 6, 90, 1.5)
        if L3_111 == true then
          L3_111 = print
          L4_112 = "\232\131\140\229\190\140\227\131\129\227\130\167\227\131\131\227\130\175\233\128\178\232\161\140\228\184\173"
          L3_111(L4_112)
          L2_110 = L2_110 + 1
          if L2_110 >= 30 then
            L3_111 = Fn_captionView
            L4_112 = "sm24_01094"
            L3_111(L4_112)
            L3_111 = Fn_turnNpc
            L4_112 = "sm24_man01"
            L3_111(L4_112)
            L3_111 = Fn_playMotionNpc
            L4_112 = "sm24_man01"
            L3_111(L4_112, "lookaround", false, {animBlendDuration = 0.3})
            L3_111 = waitSeconds
            L4_112 = 2
            L3_111(L4_112)
            L3_111 = 0
            while L3_111 < 60 do
              L4_112 = Fn_sendEventComSb
              L4_112 = L4_112("getIsAlertnessUp")
              if L4_112 == false then
                L3_111 = L3_111 + 1
              else
                L3_111 = 0
              end
              L4_112 = wait
              L4_112()
            end
            L4_112 = Fn_captionView
            L4_112 = L4_112("sm24_01095")
            L0_108.caption_timer_task = invokeTask(waitSeconds, L4_112)
            Fn_turnNpc("sm24_man01", A0_105)
            Fn_playMotionNpc("sm24_man01", A1_106, false, {
              isRepeat = true,
              isRandom = true,
              animBlendDuration = 0.5
            })
            while L0_108.caption_timer_task:isRunning() do
              wait()
            end
          end
          L3_111 = wait
          L3_111()
        end
      end
      L3_111 = print
      L4_112 = "\232\131\140\229\190\140\227\131\129\227\130\167\227\131\131\227\130\175\229\174\140\228\186\134"
      L3_111(L4_112)
    end
  end)
  function L2_107.isRunning(A0_113)
    if A0_113.main_task == nil then
      return false
    end
    return A0_113.main_task:isRunning()
  end
  function L2_107.abort(A0_114)
    if A0_114.caption_timer_task ~= nil then
      A0_114.caption_timer_task:abort()
      A0_114.caption_timer_task = nil
      Fn_captionViewEnd()
    end
    if A0_114.main_task ~= nil then
      A0_114.main_task:abort()
      A0_114.main_task = nil
    end
  end
  return L2_107
end
function showInfo(A0_115, A1_116, A2_117)
  local L3_118
  if A2_117 ~= false then
    L3_118 = info_showed_flag_tbl
    L3_118 = L3_118[A0_115]
  elseif L3_118 ~= true then
    L3_118 = A1_116 ~= 0
    HUD:info(A0_115, L3_118, A1_116)
    info_showed_flag_tbl[A0_115] = true
    waitSeconds(0.3)
  end
end
function tailingRestart(A0_119)
  local L1_120, L2_121, L3_122, L4_123, L5_124
  if A0_119 == 4 then
    L1_120 = Fn_playMotionNpc
    L2_121 = "sm24_man01"
    L3_122 = MAN_MOTION
    L3_122 = L3_122.damaged
    L4_123 = true
    L5_124 = {}
    L5_124.isRepeat = false
    L5_124.isStop = true
    L5_124.animBlendDuration = 0.1
    L1_120(L2_121, L3_122, L4_123, L5_124)
  end
  L1_120 = RAC_MultiNaviDel
  L2_121 = puppet_tbl
  L2_121 = L2_121.sm24_man01
  L1_120(L2_121)
  man_navi_enable = false
  L1_120 = Player
  L2_121 = L1_120
  L1_120 = L1_120.setStay
  L3_122 = true
  L1_120(L2_121, L3_122)
  L1_120 = Fn_userCtrlAllOff
  L1_120()
  if A0_119 == 1 or A0_119 == 4 then
    L1_120 = Camera
    L2_121 = L1_120
    L1_120 = L1_120.setControl
    L3_122 = Camera
    L3_122 = L3_122.kPlayer
    L4_123 = Camera
    L4_123 = L4_123.kControl_All
    L5_124 = false
    L1_120(L2_121, L3_122, L4_123, L5_124)
    L1_120 = invokeTask
    L2_121 = Fn_turnNpc
    L3_122 = "sm24_man01"
    L1_120 = L1_120(L2_121, L3_122)
    L2_121 = Fn_lookAtObject
    L3_122 = puppet_tbl
    L3_122 = L3_122.sm24_man01
    L4_123 = 1
    L2_121 = L2_121(L3_122, L4_123)
    L3_122 = invokeTask
    L4_123 = waitSeconds
    L5_124 = 3
    L3_122 = L3_122(L4_123, L5_124)
    repeat
      repeat
        L4_123 = wait
        L4_123()
        L5_124 = L1_120
        L4_123 = L1_120.isRunning
        L4_123 = L4_123(L5_124)
      until L4_123 == false
      L4_123 = Fn_isInSightTarget
      L5_124 = puppet_tbl
      L5_124 = L5_124.sm24_man01
      L4_123 = L4_123(L5_124, 1)
      if not L4_123 then
        L5_124 = L3_122
        L4_123 = L3_122.isRunning
        L4_123 = L4_123(L5_124)
      end
    until L4_123 == false
    L5_124 = L2_121
    L4_123 = L2_121.abort
    L4_123(L5_124)
    L2_121 = nil
    L5_124 = L3_122
    L4_123 = L3_122.abort
    L4_123(L5_124)
    L3_122 = nil
    L4_123 = Fn_findNpc
    L5_124 = "sm24_man01"
    L4_123 = L4_123(L5_124)
    L5_124 = L4_123.inform
    L5_124(L4_123, Fn_getPlayer():getPos(), {
      anim_in = "inform_in",
      anim_out = "inform_ed",
      anim_stay = "stay",
      aimPlayer = true
    })
    L5_124 = Sound
    L5_124 = L5_124.playSE
    L5_124(L5_124, "m33_903c", 1, "", puppet_tbl.sm24_man01)
    L5_124 = Fn_captionView
    L5_124("sm24_01000")
    L5_124 = waitSeconds
    L5_124(1)
    L5_124 = Fn_blackout
    L5_124()
    L5_124 = L4_123.informEnd
    L5_124(L4_123)
    L5_124 = Sound
    L5_124 = L5_124.playSE
    L5_124(L5_124, "sm24_pc1_079", 1)
    L5_124 = Fn_captionViewWait
    L5_124("sm24_01001", nil, nil, Font.kLayerFront)
    repeat
      L5_124 = wait
      L5_124()
      L5_124 = L4_123.isInformEnd
      L5_124 = L5_124(L4_123)
    until L5_124
  elseif A0_119 == 2 then
    L1_120 = Fn_setNpcActive
    L2_121 = "sm24_man01"
    L3_122 = false
    L1_120(L2_121, L3_122)
    L1_120 = Fn_captionViewWait
    L2_121 = "sm24_01002"
    L1_120(L2_121)
    L1_120 = Fn_blackout
    L1_120()
  elseif A0_119 == 3 then
    L1_120 = Fn_captionViewWait
    L2_121 = "sm24_01003"
    L1_120(L2_121)
    L1_120 = Fn_captionViewWait
    L2_121 = "sm24_01004"
    L1_120(L2_121)
    L1_120 = Fn_blackout
    L1_120()
  end
  L1_120 = tailing_phase
  if L1_120 >= 2 then
    L1_120 = talk_npc_move_b_task
    if L1_120 ~= nil then
      L1_120 = talk_npc_move_b_task
      L2_121 = L1_120
      L1_120 = L1_120.abort
      L1_120(L2_121)
      talk_npc_move_b_task = nil
    end
    L1_120 = tailing_phase
    L2_121 = tailing_data_tbl
    L2_121 = #L2_121
    if L1_120 ~= L2_121 then
      L1_120 = Fn_setNpcActive
      L2_121 = tailing_data_tbl
      L3_122 = tailing_phase
      L3_122 = L3_122 - 1
      L2_121 = L2_121[L3_122]
      L2_121 = L2_121.talk_npc_name
      L3_122 = false
      L1_120(L2_121, L3_122)
    end
  end
  L1_120 = talk_npc_move_a_task
  if L1_120 ~= nil then
    L1_120 = RAC_stopNpcMoveTask
    L2_121 = tailing_data_tbl
    L3_122 = tailing_phase
    L2_121 = L2_121[L3_122]
    L2_121 = L2_121.talk_npc_name
    L1_120(L2_121)
  end
  L1_120 = Fn_setNpcActive
  L2_121 = "sm24_man01"
  L3_122 = true
  L1_120(L2_121, L3_122)
  function L1_120()
    local L0_125, L1_126, L2_127, L3_128
    L0_125 = nil
    L1_126 = Fn_getPlayerWorldPos
    L1_126 = L1_126()
    L2_127 = nil
    L3_128 = 1
    while findGameObject2("Node", tailing_data_tbl[tailing_phase].restart_pc_pos_name[npc_move_state] .. string.format("%02d", L3_128)) ~= nil do
      if L0_125 == nil or L2_127 > L1_126:DistanceTo(findGameObject2("Node", tailing_data_tbl[tailing_phase].restart_pc_pos_name[npc_move_state] .. string.format("%02d", L3_128)):getWorldPos()) then
        L2_127, L0_125 = L1_126:DistanceTo(findGameObject2("Node", tailing_data_tbl[tailing_phase].restart_pc_pos_name[npc_move_state] .. string.format("%02d", L3_128)):getWorldPos()), L3_128
        do break end
        break
      end
      L3_128 = L3_128 + 1
    end
    if tailing_phase == 2 and L2_127 >= 6 then
      L0_125 = 2
    end
    return L0_125
  end
  L2_121, L3_122, L4_123 = nil, nil, nil
  L5_124 = tailing_phase
  if L5_124 == #tailing_data_tbl then
    L5_124 = L1_120
    L5_124 = L5_124()
    pc_restart_pos_index = L5_124
    L5_124 = tailing_data_tbl
    L5_124 = L5_124[tailing_phase]
    L5_124 = L5_124.restart_pc_pos_name
    L5_124 = L5_124[1]
    L2_121 = L5_124 .. string.format("%02d", pc_restart_pos_index)
    L5_124 = tailing_data_tbl
    L5_124 = L5_124[tailing_phase]
    L5_124 = L5_124.restart_man_pos_name
    L3_122 = L5_124[1]
    L5_124 = tailing_data_tbl
    L5_124 = L5_124[tailing_phase]
    L5_124 = L5_124.restart_talk_npc_pos_name
    L4_123 = L5_124[1]
  else
    L5_124 = npc_move_state
    if L5_124 == npc_moving then
      L5_124 = tailing_data_tbl
      L5_124 = L5_124[tailing_phase]
      L5_124 = L5_124.restart_index
      if L5_124 ~= nil then
        L5_124 = tailing_data_tbl
        L5_124 = L5_124[tailing_phase]
        L5_124 = L5_124.restart_index
        if L5_124 <= man_move_restart_index then
          talk_npc_move_a_delay_sec = 0
          L5_124 = tailing_data_tbl
          L5_124 = L5_124[tailing_phase]
          L5_124 = L5_124.restart_pc_pos_name
          L5_124 = L5_124[1]
          L2_121 = L5_124 .. "02"
          L5_124 = tailing_data_tbl
          L5_124 = L5_124[tailing_phase]
          L5_124 = L5_124.restart_index
          man_move_restart_index = L5_124
          L5_124 = tailing_data_tbl
          L5_124 = L5_124[tailing_phase]
          L5_124 = L5_124.man_move_prefix
          L3_122 = L5_124 .. string.format("%02d", man_move_restart_index - 1)
          L5_124 = tailing_data_tbl
          L5_124 = L5_124[tailing_phase]
          L5_124 = L5_124.restart_talk_npc_pos_name
          L4_123 = L5_124[2]
        end
      else
        L5_124 = tailing_phase
        if L5_124 == 1 then
          L5_124 = tailing_data_tbl
          L5_124 = L5_124[1]
          L5_124 = L5_124.talk_npc_move_a_delay_sec
          L5_124 = L5_124 + 2.5
          talk_npc_move_a_delay_sec = L5_124
        end
        L5_124 = tailing_data_tbl
        L5_124 = L5_124[tailing_phase]
        L5_124 = L5_124.restart_pc_pos_name
        L5_124 = L5_124[1]
        L2_121 = L5_124 .. "01"
        man_move_restart_index = 0
        L5_124 = tailing_data_tbl
        L5_124 = L5_124[tailing_phase]
        L5_124 = L5_124.restart_man_pos_name
        L3_122 = L5_124[1]
        L5_124 = tailing_data_tbl
        L5_124 = L5_124[tailing_phase]
        L5_124 = L5_124.restart_talk_npc_pos_name
        L4_123 = L5_124[1]
        L5_124 = is_talk_npc_move_end
        if L5_124 == false then
          L5_124 = is_man_move_end
          if L5_124 == true then
            L5_124 = tailing_data_tbl
            L5_124 = L5_124[tailing_phase]
            L5_124 = L5_124.restart_pc_pos_name
            L5_124 = L5_124[1]
            L2_121 = L5_124 .. "02"
            L5_124 = tailing_data_tbl
            L5_124 = L5_124[tailing_phase]
            L5_124 = L5_124.restart_index
            man_move_restart_index = L5_124
            L5_124 = tailing_data_tbl
            L5_124 = L5_124[tailing_phase]
            L5_124 = L5_124.man_move_prefix
            L3_122 = L5_124 .. string.format("%02d", man_move_restart_index - 1)
            L5_124 = tailing_data_tbl
            L5_124 = L5_124[tailing_phase]
            L5_124 = L5_124.restart_talk_npc_pos_name
            L4_123 = L5_124[2]
          end
        end
      end
    else
      L5_124 = L1_120
      L5_124 = L5_124()
      L2_121 = tailing_data_tbl[tailing_phase].restart_pc_pos_name[2] .. string.format("%02d", L5_124)
      L3_122 = tailing_data_tbl[tailing_phase].restart_man_pos_name[2]
      L4_123 = tailing_data_tbl[tailing_phase].restart_talk_npc_pos_name[3]
    end
  end
  L5_124 = Fn_resetPcPos
  L5_124(L2_121)
  L5_124 = Fn_warpNpc
  L5_124("sm24_man01", L3_122)
  if L4_123 ~= nil then
    L5_124 = Fn_warpNpc
    L5_124(tailing_data_tbl[tailing_phase].talk_npc_name, L4_123)
  end
  L5_124 = Fn_sendEventComSb
  L5_124("resetAlertnessRate")
  L5_124 = Fn_fadein
  L5_124()
  if A0_119 == 1 then
    L5_124 = Sound
    L5_124 = L5_124.playSE
    L5_124(L5_124, "pc1_057", 1)
    L5_124 = Fn_lookAtObject
    L5_124 = L5_124(puppet_tbl.sm24_man01, 1.5)
    waitSeconds(2)
    L5_124:abort()
    L5_124 = nil
    Player:setStay(false)
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  else
    L5_124 = Player
    L5_124 = L5_124.setStay
    L5_124(L5_124, false)
  end
  L5_124 = Fn_userCtrlOn
  L5_124()
  L5_124 = setAlertnessAddWaitSeconds
  L5_124(tailing_data_tbl[tailing_phase].restart_delay_sec)
  L5_124 = Fn_sendEventComSb
  L5_124("resetTailingRestartType")
  is_retry_comeback = true
  _tailing_end = false
end
function tailingLoop()
  local L0_129, L1_130, L2_131, L3_132, L4_133, L5_134
  L0_129 = 0
  L1_130 = nil
  L2_131 = is_retry_comeback
  if L2_131 == false then
    L2_131 = invokeStartMoveCaptionTask
    L2_131 = L2_131()
    L1_130 = L2_131
  end
  L2_131 = invokeCheckDistWithMan
  L2_131 = L2_131()
  check_dist_with_man_task = L2_131
  L2_131 = invokeLostManCaptionTimer
  L2_131 = L2_131()
  lost_man_caption_timer_task = L2_131
  L2_131 = tailing_phase
  if L2_131 >= 2 then
    L2_131 = tailing_data_tbl
    L3_132 = tailing_phase
    L3_132 = L3_132 - 1
    L2_131 = L2_131[L3_132]
    L3_132 = Fn_findNpc
    L4_133 = L2_131.talk_npc_name
    L3_132 = L3_132(L4_133)
    L5_134 = L3_132
    L4_133 = L3_132.getActive
    L4_133 = L4_133(L5_134)
    if L4_133 == true then
      L4_133 = invokeTalkGreetingTask
      L5_134 = L2_131.talk_end_greeting_type
      L4_133 = L4_133(L5_134, L2_131.talk_npc_name, man_param_data.bye_se, L2_131.talk_npc_bye_se)
      while true do
        L5_134 = L4_133.isRunning
        L5_134 = L5_134(L4_133)
        if L5_134 then
          L5_134 = wait
          L5_134()
          L5_134 = Fn_sendEventComSb
          L5_134 = L5_134("getTailingRestartType")
          L0_129 = L5_134
        end
        if L0_129 == 0 then
        end
      end
      L5_134 = L4_133.abort
      L5_134(L4_133)
      L4_133 = nil
      if L0_129 ~= 0 then
        L5_134 = tailingRestart
        L5_134(L0_129)
        L5_134 = false
        return L5_134
      end
      L5_134 = L2_131.talk_npc_move_b_prefix
      if L5_134 ~= nil then
        L5_134 = invokeMoveDeactiveTask
        L5_134 = L5_134(L2_131.talk_npc_name, L2_131.talk_npc_move_b_prefix, 20, L2_131.talk_npc_move_b_delay_sec)
        talk_npc_move_b_task = L5_134
      else
        L5_134 = tailing_phase
        L5_134 = L5_134 - 1
        if L5_134 == 2 then
          L5_134 = true
          invokeTask(function()
            while L5_134 do
              Fn_turnNpc(L2_131.talk_npc_name, puppet_tbl.sm24_man01)
              wait()
            end
            Fn_playMotionNpc(L2_131.talk_npc_name, WOM_MOTION["stay_" .. string.format("%02d", tailing_phase - 1)], false, {animBlendDuration = 0.5})
          end)
          invokeTask(function()
            local L0_135
            L0_135 = 0
            while true do
              L0_135 = L0_135 + 1
              if L0_135 >= 150 then
                L5_134 = false
                break
              end
              wait()
            end
          end)
          checkWomenDisappearTask(L2_131.talk_npc_name)
          break
        else
          L5_134 = Fn_playMotionNpc
          L5_134(L2_131.talk_npc_name, WOM_MOTION["stay_" .. string.format("%02d", tailing_phase - 1)], false, {animBlendDuration = 0.5})
        end
      end
      L5_134 = wait
      L5_134(10)
    end
  else
  end
  L2_131 = npc_move_state
  L3_132 = npc_moving
  if L2_131 == L3_132 then
    L2_131 = RAC_invokeMoveCharaTask
    L3_132 = "sm24_man01"
    L4_133 = tailing_data_tbl
    L5_134 = tailing_phase
    L4_133 = L4_133[L5_134]
    L4_133 = L4_133.man_move_prefix
    L5_134 = {}
    L5_134.arrivedLength = 0.5
    L5_134.anim_walk_speed = man_param_data.walk_speed
    L5_134.runLength = 1000000
    L5_134.recast = true
    L2_131 = L2_131(L3_132, L4_133, L5_134, {
      startIndex = math.max(1, man_move_restart_index)
    })
    L3_132 = invokeManSoliloqueTask
    L3_132 = L3_132()
    L4_133 = tailing_data_tbl
    L5_134 = tailing_phase
    L4_133 = L4_133[L5_134]
    L4_133 = L4_133.talk_npc_move_a_prefix
    if L4_133 ~= nil then
      L4_133 = invokeTask
      function L5_134()
        if talk_npc_move_a_delay_sec ~= nil and talk_npc_move_a_delay_sec > 0 then
          waitSeconds(talk_npc_move_a_delay_sec)
        end
        talk_npc_move_a_task = RAC_invokeMoveCharaTask(tailing_data_tbl[tailing_phase].talk_npc_name, tailing_data_tbl[tailing_phase].talk_npc_move_a_prefix, {
          arrivedLength = 1,
          runLength = 1000000,
          recast = true
        })
      end
      L4_133 = L4_133(L5_134)
      talk_npc_move_a_task = L4_133
    end
    L4_133 = start_walk_caption_task
    if L4_133 ~= nil then
      while true do
        L5_134 = L1_130
        L4_133 = L1_130.isRunning
        L4_133 = L4_133(L5_134)
        if L4_133 then
          L4_133 = wait
          L4_133()
          L4_133 = Fn_sendEventComSb
          L5_134 = "getTailingRestartType"
          L4_133 = L4_133(L5_134)
          L0_129 = L4_133
        end
        if L0_129 == 0 then
        end
      end
      L5_134 = L1_130
      L4_133 = L1_130.abort
      L4_133(L5_134)
      L1_130 = nil
    else
      L4_133 = 0
      while L4_133 < 20 do
        L5_134 = wait
        L5_134()
        L5_134 = Fn_sendEventComSb
        L5_134 = L5_134("getTailingRestartType")
        L0_129 = L5_134
        if L0_129 == 0 then
          L4_133 = L4_133 + 1
        end
      end
    end
    if L0_129 ~= 0 then
      L4_133 = man_move_restart_index
      L5_134 = Fn_findNpc
      L5_134 = L5_134("sm24_man01")
      L5_134 = L5_134.getMoveCurrentIndex
      L5_134 = L5_134(L5_134)
      L4_133 = L4_133 + L5_134
      man_move_restart_index = L4_133
      L4_133 = print
      L5_134 = "man_move_restart_index......."
      L5_134 = L5_134 .. man_move_restart_index
      L4_133(L5_134)
      L4_133 = RAC_stopNpcMoveTask
      L5_134 = "sm24_man01"
      L4_133(L5_134)
      L5_134 = L3_132
      L4_133 = L3_132.abort
      L4_133(L5_134)
      L3_132 = nil
      L4_133 = tailingRestart
      L5_134 = L0_129
      L4_133(L5_134)
      L4_133 = false
      return L4_133
    end
    L4_133 = Fn_missionView
    L5_134 = "sm24_01006"
    L4_133(L5_134)
    L4_133 = man_navi_enable
    if L4_133 == false then
      L4_133 = waitSeconds
      L5_134 = 1.3
      L4_133(L5_134)
      L4_133 = RAC_MultiNaviAdd
      L5_134 = puppet_tbl
      L5_134 = L5_134.sm24_man01
      L4_133(L5_134, nil, 0, -1)
      man_navi_enable = true
    end
    while true do
      L5_134 = L2_131
      L4_133 = L2_131.isRunning
      L4_133 = L4_133(L5_134)
      if L4_133 then
        L4_133 = wait
        L4_133()
        L4_133 = Fn_sendEventComSb
        L5_134 = "getTailingRestartType"
        L4_133 = L4_133(L5_134)
        L0_129 = L4_133
        is_man_move_end = false
      end
      if L0_129 == 0 then
      end
    end
    if L0_129 == 0 then
      is_man_move_end = true
    end
    L4_133 = man_move_restart_index
    L5_134 = Fn_findNpc
    L5_134 = L5_134("sm24_man01")
    L5_134 = L5_134.getMoveCurrentIndex
    L5_134 = L5_134(L5_134)
    L4_133 = L4_133 + L5_134
    man_move_restart_index = L4_133
    L4_133 = print
    L5_134 = "man_move_restart_index......."
    L5_134 = L5_134 .. man_move_restart_index
    L4_133(L5_134)
    L4_133 = RAC_stopNpcMoveTask
    L5_134 = "sm24_man01"
    L4_133(L5_134)
    L4_133 = talk_npc_move_a_task
    if L4_133 ~= nil then
      L4_133 = tailing_data_tbl
      L5_134 = tailing_phase
      L4_133 = L4_133[L5_134]
      L4_133 = L4_133.talk_start_greeting_type
      while true do
        if L4_133 == 2 then
          L4_133 = talk_npc_move_a_task
          L5_134 = L4_133
          L4_133 = L4_133.isRunning
          L4_133 = L4_133(L5_134)
          if L4_133 then
            is_talk_npc_move_end = false
            L4_133 = Fn_sendEventComSb
            L5_134 = "getTailingRestartType"
            L4_133 = L4_133(L5_134)
          end
        end
        if L4_133 == 0 then
          L4_133 = wait
          L4_133()
        end
      end
      L4_133 = RAC_stopNpcMoveTask
      L5_134 = tailing_data_tbl
      L5_134 = L5_134[tailing_phase]
      L5_134 = L5_134.talk_npc_name
      L4_133(L5_134)
    end
    L5_134 = L3_132
    L4_133 = L3_132.abort
    L4_133(L5_134)
    L3_132 = nil
    L4_133 = Fn_sendEventComSb
    L5_134 = "getTailingRestartType"
    L4_133 = L4_133(L5_134)
    if L4_133 ~= 0 then
      L4_133 = tailingRestart
      L5_134 = Fn_sendEventComSb
      L5_134 = L5_134("getTailingRestartType")
      L4_133(L5_134, L5_134("getTailingRestartType"))
      L4_133 = false
      return L4_133
    end
    is_talk_npc_move_end = true
    L4_133 = npc_moved
    npc_move_state = L4_133
    L4_133 = print
    L5_134 = "npc_move_state........."
    L5_134 = L5_134 .. npc_move_state
    L4_133(L5_134)
    _tailing_end = true
    L4_133 = invokeTalkGreetingTask
    L5_134 = tailing_data_tbl
    L5_134 = L5_134[tailing_phase]
    L5_134 = L5_134.talk_start_greeting_type
    L4_133 = L4_133(L5_134, tailing_data_tbl[tailing_phase].talk_npc_name, man_param_data.greeting_se, tailing_data_tbl[tailing_phase].talk_npc_greeting_se)
    while true do
      L5_134 = L4_133.isRunning
      L5_134 = L5_134(L4_133)
      if L5_134 then
        L5_134 = wait
        L5_134()
        L5_134 = Fn_sendEventComSb
        L5_134 = L5_134("getTailingRestartType")
        L0_129 = L5_134
      end
      if L0_129 == 0 then
      end
    end
    L5_134 = L4_133.abort
    L5_134(L4_133)
    L4_133 = nil
    if L0_129 ~= 0 then
      L4_133 = tailingRestart
      L5_134 = L0_129
      L4_133(L5_134)
      L4_133 = false
      return L4_133
    end
  end
  L2_131 = Fn_playMotionNpc
  L3_132 = "sm24_man01"
  L4_133 = man_param_data
  L4_133 = L4_133.talk_motion_tbl
  L5_134 = false
  L2_131(L3_132, L4_133, L5_134, {
    isRepeat = true,
    isRandom = true,
    animBlendDuration = 0.3
  })
  L2_131 = Fn_playMotionNpc
  L3_132 = tailing_data_tbl
  L4_133 = tailing_phase
  L3_132 = L3_132[L4_133]
  L3_132 = L3_132.talk_npc_name
  L4_133 = tailing_data_tbl
  L5_134 = tailing_phase
  L4_133 = L4_133[L5_134]
  L4_133 = L4_133.talk_npc_talk_motion_tbl
  L5_134 = false
  L2_131(L3_132, L4_133, L5_134, {
    isRepeat = true,
    isRandom = true,
    animBlendDuration = 0.3
  })
  L2_131 = tailing_data_tbl
  L3_132 = tailing_phase
  L2_131 = L2_131[L3_132]
  L2_131 = L2_131.focus_talk_npc
  if L2_131 == true then
    L2_131 = puppet_tbl
    L3_132 = tailing_data_tbl
    L4_133 = tailing_phase
    L3_132 = L3_132[L4_133]
    L3_132 = L3_132.talk_npc_name
    L2_131 = L2_131[L3_132]
    L3_132 = RAC_RaycastEyeSight
    L4_133 = L2_131
    L5_134 = Fn_getDistanceToPlayer
    L5_134 = L5_134(L2_131)
    L5_134 = L5_134 + 1
    L3_132 = L3_132(L4_133, L5_134, 180, 1.5, 1.5)
    if L3_132 == true then
      L3_132 = Camera
      L4_133 = L3_132
      L3_132 = L3_132.setControl
      L5_134 = Camera
      L5_134 = L5_134.kPlayer
      L3_132(L4_133, L5_134, Camera.kControl_All, false)
      L3_132 = Fn_lookAtObject
      L4_133 = L2_131
      L5_134 = 1.5
      L3_132 = L3_132(L4_133, L5_134)
      while true do
        L4_133 = Fn_isInSightTarget
        L5_134 = L2_131
        L4_133 = L4_133(L5_134, 0.7)
        if L4_133 == false then
          L4_133 = wait
          L4_133()
          L4_133 = Fn_sendEventComSb
          L5_134 = "getTailingRestartType"
          L4_133 = L4_133(L5_134)
          L0_129 = L4_133
        end
        if L0_129 == 0 then
        end
      end
      L5_134 = L3_132
      L4_133 = L3_132.abort
      L4_133(L5_134)
      L3_132 = nil
      L4_133 = Camera
      L5_134 = L4_133
      L4_133 = L4_133.setControl
      L4_133(L5_134, Camera.kPlayer, Camera.kControl_All, true)
      if L0_129 ~= 0 then
        L4_133 = tailingRestart
        L5_134 = L0_129
        L4_133(L5_134)
        L4_133 = false
        return L4_133
      end
    end
  end
  L2_131 = invokeCheatingManTalkTask
  L3_132 = puppet_tbl
  L4_133 = tailing_data_tbl
  L5_134 = tailing_phase
  L4_133 = L4_133[L5_134]
  L4_133 = L4_133.talk_npc_name
  L3_132 = L3_132[L4_133]
  L2_131 = L2_131(L3_132)
  while true do
    L4_133 = L2_131
    L3_132 = L2_131.isRunning
    L3_132 = L3_132(L4_133)
    if L3_132 then
      L3_132 = wait
      L3_132()
      L3_132 = Fn_sendEventComSb
      L4_133 = "getTailingRestartType"
      L3_132 = L3_132(L4_133)
      L0_129 = L3_132
    end
    if L0_129 == 0 then
    end
  end
  L4_133 = L2_131
  L3_132 = L2_131.abort
  L3_132(L4_133)
  L2_131 = nil
  if L0_129 ~= 0 then
    L3_132 = Fn_playMotionNpc
    L4_133 = "sm24_man01"
    L5_134 = "stay"
    L3_132(L4_133, L5_134, false, {animBlendDuration = 0.3})
    L3_132 = Fn_playMotionNpc
    L4_133 = tailing_data_tbl
    L5_134 = tailing_phase
    L4_133 = L4_133[L5_134]
    L4_133 = L4_133.talk_npc_name
    L5_134 = "stay"
    L3_132(L4_133, L5_134, false, {animBlendDuration = 0.3})
    L3_132 = tailingRestart
    L4_133 = L0_129
    L3_132(L4_133)
    L3_132 = false
    return L3_132
  end
  L3_132 = photo_success
  if L3_132 == false then
    L3_132 = tailing_data_tbl
    L4_133 = tailing_phase
    L3_132 = L3_132[L4_133]
    L3_132 = L3_132.take_picture_type
    if L3_132 == 1 then
      L3_132 = Fn_captionViewWait
      L4_133 = "sm24_01007"
      L3_132(L4_133)
      L3_132 = invokeTask
      function L4_133()
        while true do
          Sound:playSE(tailing_data_tbl[tailing_phase].talk_npc_talk_se_pic_wait, 0.6, "", puppet_tbl[tailing_data_tbl[tailing_phase].talk_npc_name])
          waitSeconds(3)
          Sound:playSE(man_param_data.talk_se_pic_wait, 0.6, "", puppet_tbl.sm24_man01)
          waitSeconds(3)
        end
      end
      L3_132 = L3_132(L4_133)
      L4_133 = take_picture_task
      if L4_133 ~= nil then
        while true do
          L4_133 = take_picture_task
          L5_134 = L4_133
          L4_133 = L4_133.isRunning
          L4_133 = L4_133(L5_134)
          if L4_133 then
            L4_133 = wait
            L4_133()
          end
        end
        L4_133 = Fn_missionViewEnd
        L4_133()
        L4_133 = take_picture_task
        L5_134 = L4_133
        L4_133 = L4_133.abort
        L4_133(L5_134)
        take_picture_task = nil
      end
      L4_133 = photo_success
      if L4_133 == false then
        L4_133 = invokeTakePictureTask
        L5_134 = kPHOTO_CAPTION_ON
        L4_133 = L4_133(L5_134, tailing_data_tbl[tailing_phase].picture_hint_data)
        take_picture_task = L4_133
        L4_133 = nil
        while true do
          L5_134 = take_picture_task
          L5_134 = L5_134.isRunning
          L5_134 = L5_134(L5_134)
          if L5_134 then
            L5_134 = Fn_sendEventComSb
            L5_134 = L5_134("getTailingRestartType")
          end
          if L5_134 == 0 then
            if L4_133 ~= nil then
              L5_134 = L4_133.isRunning
              L5_134 = L5_134(L4_133)
            elseif L5_134 == false then
              L5_134 = invokeCheckManBackTask
              L5_134 = L5_134(puppet_tbl[tailing_data_tbl[tailing_phase].talk_npc_name], man_param_data.talk_motion_tbl)
              L4_133 = L5_134
            end
            L5_134 = wait
            L5_134()
          end
        end
        L5_134 = take_picture_task
        L5_134 = L5_134.abort
        L5_134(L5_134)
        take_picture_task = nil
        if L4_133 ~= nil then
          L5_134 = L4_133.abort
          L5_134(L4_133)
        end
        L4_133 = nil
      end
      L5_134 = L3_132
      L4_133 = L3_132.abort
      L4_133(L5_134)
      L3_132 = nil
      L4_133 = Fn_sendEventComSb
      L5_134 = "getTailingRestartType"
      L4_133 = L4_133(L5_134)
      if L4_133 ~= 0 then
        L4_133 = Fn_playMotionNpc
        L5_134 = "sm24_man01"
        L4_133(L5_134, "stay", false, {animBlendDuration = 0.3})
        L4_133 = Fn_playMotionNpc
        L5_134 = tailing_data_tbl
        L5_134 = L5_134[tailing_phase]
        L5_134 = L5_134.talk_npc_name
        L4_133(L5_134, "stay", false, {animBlendDuration = 0.3})
        L4_133 = tailingRestart
        L5_134 = Fn_sendEventComSb
        L5_134 = L5_134("getTailingRestartType")
        L4_133(L5_134, L5_134("getTailingRestartType"))
        L4_133 = false
        return L4_133
      end
    end
  end
  L3_132 = Fn_playMotionNpc
  L4_133 = "sm24_man01"
  L5_134 = "stay"
  L3_132(L4_133, L5_134, false, {animBlendDuration = 0.3})
  L3_132 = Fn_playMotionNpc
  L4_133 = tailing_data_tbl
  L5_134 = tailing_phase
  L4_133 = L4_133[L5_134]
  L4_133 = L4_133.talk_npc_name
  L5_134 = "stay"
  L3_132(L4_133, L5_134, false, {animBlendDuration = 0.3})
  restart_talk_index = nil
  photo_success = false
  L3_132 = npc_moving
  npc_move_state = L3_132
  L3_132 = print
  L4_133 = "npc_move_state........."
  L5_134 = npc_move_state
  L4_133 = L4_133 .. L5_134
  L3_132(L4_133)
  L3_132 = tailing_data_tbl
  L4_133 = tailing_phase
  L3_132 = L3_132[L4_133]
  L3_132 = L3_132.take_picture_type
  if L3_132 == 1 then
    photo_hint_enable = false
  end
  L3_132 = true
  return L3_132
end
function approachTouristLoop()
  local L0_136, L1_137
  L0_136 = Fn_playMotionNpc
  L1_137 = "sm24_man01"
  L0_136(L1_137, man_param_data.talk_motion_tbl, false, {
    isRepeat = true,
    isRandom = true,
    animBlendDuration = 0.3
  })
  L0_136 = Fn_playMotionNpc
  L1_137 = tailing_data_tbl
  L1_137 = L1_137[tailing_phase - 1]
  L1_137 = L1_137.talk_npc_name
  L0_136(L1_137, tailing_data_tbl[tailing_phase - 1].talk_npc_talk_motion_tbl, false, {
    isRepeat = true,
    isRandom = true,
    animBlendDuration = 0.3
  })
  L0_136 = invokeTask
  function L1_137()
    while true do
      while invokeTask(Fn_turnNpc, "sm24_tourist01"):isRunning() or invokeTask(Fn_turnNpc, "sm24_tourist02"):isRunning() do
        wait()
      end
      invokeTask(Fn_turnNpc, "sm24_tourist01"):abort()
      invokeTask(Fn_turnNpc, "sm24_tourist02"):abort()
      Fn_playMotionNpc("sm24_tourist01", MAN_MOTION.wavehand, false, {animBlendDuration = 0.3})
      Sound:playSE("m36_901b", 1, "", puppet_tbl.sm24_tourist01)
      Fn_captionView("sm24_01012")
      waitSeconds(1)
      Fn_playMotionNpc("sm24_tourist02", WOM_MOTION.wavehand, false, {animBlendDuration = 0.3})
      Sound:playSE("w19_901b", 1, "", puppet_tbl.sm24_tourist02)
      Fn_captionView("sm24_01013")
      waitSeconds(1)
    end
  end
  L0_136 = L0_136(L1_137)
  L1_137 = 0
  is_in_sensor = false
  Fn_pcSensorOn("pccubesensor2_tourist_01")
  Fn_naviSet(findGameObject2("Node", "locator2_navi_tourist_01"))
  while is_in_sensor == false do
    wait()
    L1_137 = Fn_sendEventComSb("getTailingRestartType")
    if L1_137 == 0 then
    end
  end
  Fn_missionViewEnd()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_tourist_01")
  is_in_sensor = false
  L0_136:abort()
  L0_136 = nil
  Fn_playMotionNpc("sm24_tourist01", "stay", false, {animBlendDuration = 0.3})
  Fn_playMotionNpc("sm24_man01", "stay", false, {animBlendDuration = 0.3})
  Fn_playMotionNpc(tailing_data_tbl[tailing_phase].talk_npc_name, "stay", false, {animBlendDuration = 0.3})
  if L1_137 ~= 0 then
    tailingRestart(L1_137)
    return false
  end
  return true
end
function setAlertnessAddWaitSeconds(A0_138)
  Fn_sendEventComSb("setAlertnessAddWait", true)
  if alertness_add_wait_task ~= nil then
    alertness_add_wait_task:abort()
  end
  alertness_add_wait_task = invokeTask(function()
    waitSeconds(tailing_data_tbl[tailing_phase].restart_delay_sec)
    Fn_sendEventComSb("setAlertnessAddWait", false)
  end)
end
function createPcCubeSensor(A0_139, A1_140, A2_141, A3_142, A4_143, A5_144)
  local L6_145
  L6_145 = createGameObject2
  L6_145 = L6_145("PlayerSensor")
  L6_145:setName(A0_139)
  L6_145:setDetectBehavior(1)
  L6_145:addBox(A2_141)
  L6_145:setPos(A1_140)
  L6_145:setOnEnter(A3_142 ~= nil and A3_142 or A0_139 .. "_OnEnter")
  L6_145:setOnLeave(A4_143 ~= nil and A4_143 or A0_139 .. "_OnLeave")
  L6_145:try_init()
  L6_145:waitForReady()
  L6_145:try_start()
  if A5_144 ~= nil then
    A5_144:appendChild(L6_145)
  end
  return L6_145
end
function pccubesensor2_man_caution_sensor_OnEnter(A0_146)
  local L1_147
  _check_man_back_flag = true
end
function pccubesensor2_man_caution_sensor_OnLeave(A0_148)
  local L1_149
  _check_man_back_flag = false
end
function cubesensor2_soliloque_b_01_OnEnter()
  local L0_150, L1_151
  is_in_sensor_pup = true
end
function cubesensor2_soliloque_b_01_OnLeave()
  local L0_152, L1_153
  is_in_sensor_pup = false
end
function cubesensor2_turn_b_01_OnEnter()
  local L0_154, L1_155
  is_in_sensor_pup = true
end
function cubesensor2_turn_b_01_OnLeave()
  local L0_156, L1_157
  is_in_sensor_pup = false
end
function cubesensor2_soliloque_c_01_OnEnter()
  local L0_158, L1_159
  is_in_sensor_pup = true
end
function cubesensor2_soliloque_c_01_OnLeave()
  local L0_160, L1_161
  is_in_sensor_pup = false
end
function cubesensor2_turn_c_01_OnEnter()
  local L0_162, L1_163
  is_in_sensor_pup = true
end
function cubesensor2_turn_c_01_OnLeave()
  local L0_164, L1_165
  is_in_sensor_pup = false
end
function cubesensor2_soliloque_d_01_OnEnter()
  local L0_166, L1_167
  is_in_sensor_pup = true
end
function cubesensor2_soliloque_d_01_OnLeave()
  local L0_168, L1_169
  is_in_sensor_pup = false
end
function cubesensor2_turn_d_01_OnEnter()
  local L0_170, L1_171
  is_in_sensor_pup = true
end
function cubesensor2_turn_d_01_OnLeave()
  local L0_172, L1_173
  is_in_sensor_pup = false
end
function pccubesensor2_pic_hint_02_OnEnter()
  local L0_174, L1_175
  is_in_sensor = true
end
function pccubesensor2_pic_hint_02_OnLeave()
  local L0_176, L1_177
  is_in_sensor = false
end
function pccubesensor2_pic_hint_03_OnEnter()
  local L0_178, L1_179
  is_in_sensor = true
end
function pccubesensor2_pic_hint_03_OnLeave()
  local L0_180, L1_181
  is_in_sensor = false
end
function pccubesensor2_pic_hint_05_OnEnter()
  local L0_182, L1_183
  is_in_sensor = true
end
function pccubesensor2_pic_hint_05_OnLeave()
  local L0_184, L1_185
  is_in_sensor = false
end
function pccubesensor2_tourist_01_OnEnter()
  local L0_186, L1_187
  is_in_sensor = true
end
function pccubesensor2_tourist_01_OnLeave()
  local L0_188, L1_189
  is_in_sensor = false
end
