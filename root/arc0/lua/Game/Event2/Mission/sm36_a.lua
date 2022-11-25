dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/gesture.lua")
_next_phase = false
_puppet_tbl = {}
_hdl_tbl = {}
_talk_npc_num = 0
_is_area_distant = false
_is_area_alert_distant = false
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_is_kaji_ready = false
_is_npc_ready = {
  sm36_info_chara_01 = {ready = true},
  sm36_info_chara_02 = {ready = true},
  sm36_info_chara_03 = {ready = true},
  sm36_info_chara_04 = {ready = true},
  sm36_info_chara_05 = {ready = true},
  sm36_info_chara_06 = {ready = true},
  sm36_info_chara_07 = {ready = true},
  sm36_info_chara_08 = {ready = true}
}
_motion_task_tbl = {}
_already_gesture_tbl = {
  {
    type = "man01",
    gesture = false,
    npc_name = "sm36_info_chara_01_06",
    npc = "sm36_info_chara_01",
    talked = false,
    sit_out = false,
    turn_target = "locator2_info_chara_01_turn"
  },
  {
    type = "wom01",
    gesture = false,
    npc_name = "sm36_info_chara_02_08",
    npc = "sm36_info_chara_02",
    talked = false,
    sit_out = false,
    turn_target = ""
  },
  {
    type = "man83",
    gesture = false,
    npc_name = "sm36_info_chara_03_07",
    npc = "sm36_info_chara_03",
    talked = false,
    sit_out = false,
    turn_target = "locator2_info_chara_03_turn"
  },
  {
    type = "man07",
    gesture = false,
    npc_name = "sm36_info_chara_04_05",
    npc = "sm36_info_chara_04",
    talked = false,
    sit_out = false,
    turn_target = "locator2_info_chara_04_turn"
  },
  {
    type = "man09",
    gesture = false,
    npc_name = "sm36_info_chara_04_05",
    npc = "sm36_info_chara_05",
    talked = false,
    sit_out = false,
    turn_target = "locator2_info_chara_05_turn"
  },
  {
    type = "man70",
    gesture = false,
    npc_name = "sm36_info_chara_01_06",
    npc = "sm36_info_chara_06",
    talked = false,
    sit_out = false,
    turn_target = ""
  },
  {
    type = "man71",
    gesture = false,
    npc_name = "sm36_info_chara_03_07",
    npc = "sm36_info_chara_07",
    talked = false,
    sit_out = false,
    turn_target = ""
  },
  {
    type = "man64",
    gesture = false,
    npc_name = "sm36_info_chara_02_08",
    npc = "sm36_info_chara_08",
    talked = false,
    sit_out = false,
    turn_target = ""
  }
}
_npc_kaiwa_table = {
  sm36_info_chara_01_06 = {cnt = 0},
  sm36_info_chara_02_08 = {cnt = 0},
  sm36_info_chara_03_07 = {cnt = 0},
  sm36_info_chara_04_05 = {cnt = 0}
}
_info_count = 0
_INFO_MAX = 4
_investigation_task = nil
_client_motion_task = nil
_shield_hdl_tbl = {}
_npc_kaiwa_cnt = 0
_mob_kaiwa_cnt = 0
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm36_client_talk_man_01",
      type = "man05",
      node = "locator2_client_talk_man_01"
    },
    {
      name = "sm36_info_chara_01",
      type = "man01",
      node = "locator2_info_chara_01"
    },
    {
      name = "sm36_info_chara_02",
      type = "wom01",
      node = "locator2_info_chara_02"
    },
    {
      name = "sm36_info_chara_03",
      type = "man83",
      node = "locator2_info_chara_03"
    },
    {
      name = "sm36_info_chara_04",
      type = "man07",
      node = "locator2_info_chara_04"
    },
    {
      name = "sm36_info_chara_05",
      type = "man09",
      node = "locator2_info_chara_05"
    },
    {
      name = "sm36_info_chara_06",
      type = "man70",
      node = "locator2_info_chara_06"
    },
    {
      name = "sm36_info_chara_07",
      type = "man71",
      node = "locator2_info_chara_07"
    },
    {
      name = "sm36_info_chara_08",
      type = "man64",
      node = "locator2_info_chara_08"
    },
    {
      name = "sm36_child",
      type = "chi20",
      node = "locator2_child",
      anim_name = "talk_00"
    },
    {
      name = "sm36_sales_person",
      type = "wom45",
      node = "locator2_sales_person_a"
    },
    {
      name = "sm36_regular",
      type = "man02",
      node = "locator2_regular_a",
      active = false
    },
    {
      name = "sm36_customer",
      type = "man25",
      node = "locator2_customer_a",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _hdl_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm36_a_cut01")
  Fn_pcSensorOff("pccubesensor2_area_distant_a_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_a_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_a_02")
  Fn_pcSensorOff("pccubesensor2_store")
  Fn_userCtrlAllOff()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "sm36_00100k"
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestBoxSpawn"
  L0_1(L1_2)
  L0_1 = Fn_blackout
  L0_1()
  L0_1 = Fn_resetPcPos
  L1_2 = "locator2_pc_warp_pos_a_01"
  L0_1(L1_2)
  L0_1 = Fn_warpNpc
  L1_2 = "sm36_client"
  L2_3 = "locator2_client_warp_pos_a_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm36_client_talk_man_01"
  L2_3 = "sit_floor_01"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm36_info_chara_01"
  L2_3 = "sit_00"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = _motion_task_tbl
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "sm36_info_chara_02"
  L3_4 = "talk_01"
  L4_5 = {L5_6}
  L5_6 = "talk_01"
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L0_1[1] = L1_2
  L0_1 = _motion_task_tbl
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "sm36_child"
  L3_4 = "talk_00"
  L4_5 = {L5_6}
  L5_6 = "talk_00"
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L0_1[2] = L1_2
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm36_info_chara_03"
  L2_3 = "sit_01"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm36_info_chara_04"
  L2_3 = "sit_00"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm36_info_chara_05"
  L2_3 = "sit_00"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = _motion_task_tbl
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "sm36_info_chara_06"
  L3_4 = "talk_01"
  L4_5 = {L5_6}
  L5_6 = "talk_01"
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L0_1[3] = L1_2
  L0_1 = wait
  L1_2 = 15
  L0_1(L1_2)
  L0_1 = _motion_task_tbl
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "sm36_info_chara_07"
  L3_4 = "talk_01"
  L4_5 = {L5_6}
  L5_6 = "talk_00"
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L0_1[4] = L1_2
  L0_1 = _motion_task_tbl
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "sm36_info_chara_08"
  L3_4 = "stay_02"
  L4_5 = {L5_6}
  L5_6 = "stay_01"
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L0_1[5] = L1_2
  L0_1 = waitSeconds
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = Fn_fadein
  L1_2 = 2
  L0_1(L1_2)
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = waitSeconds
  L1_2 = 2
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "sm36_00200k"
  L0_1(L1_2)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Camera
  L1_2 = L0_1
  L0_1 = L0_1.setControl
  L2_3 = Camera
  L2_3 = L2_3.kPlayer
  L3_4 = Camera
  L3_4 = L3_4.kControl_All
  L4_5 = true
  L0_1(L1_2, L2_3, L3_4, L4_5)
  L0_1 = {
    L1_2,
    L2_3,
    L3_4,
    L4_5
  }
  L1_2 = {}
  L1_2.npc = "sm36_info_chara_01"
  L1_2.name = "bench_kk_02_1"
  L1_2.area = "g1_base_dt_g1_road_02"
  L1_2.hdl = nil
  L2_3 = {}
  L2_3.npc = "sm36_info_chara_04"
  L2_3.name = "bench_kk_02_7"
  L2_3.area = "g1_base_dt_g1_road_02"
  L2_3.hdl = nil
  L3_4 = {}
  L3_4.npc = "sm36_info_chara_05"
  L3_4.name = "bench_kk_02_9"
  L3_4.area = "g1_base_dt_g1_road_02"
  L3_4.hdl = nil
  L4_5 = {}
  L4_5.npc = "sm36_info_chara_03"
  L4_5.name = "g1_bench_iy_01_03"
  L4_5.area = "g1_base_dt_k1_road_03"
  L4_5.hdl = nil
  function L1_2(A0_11, A1_12, A2_13)
    local L3_14
    L3_14 = 1
    return L3_14
  end
  L2_3 = invokeTask
  function L3_4()
    repeat
      for _FORV_3_, _FORV_4_ in pairs(L0_1) do
        if Fn_getDistanceToPlayer(_puppet_tbl[_FORV_4_.npc]) <= 60 then
          if _FORV_4_.hdl == nil then
            _FORV_4_.hdl = Fn_findAreaHandle(_FORV_4_.area)
          end
          while true do
            if _FORV_4_.hdl:findChildNode(_FORV_4_.name, true) ~= nil then
              _FORV_4_.hdl:findChildNode(_FORV_4_.name, true):setIgnoreGrab(true)
              _FORV_4_.hdl:findChildNode(_FORV_4_.name, true):setDetectable(false)
              _FORV_4_.hdl:findChildNode(_FORV_4_.name, true):setEventListener("judge", L1_2)
              break
            end
            wait()
          end
        end
      end
      wait()
    until false
  end
  L2_3(L3_4)
  L2_3 = print
  L3_4 = "\227\130\171\227\130\184\231\167\187\229\139\149"
  L2_3(L3_4)
  L2_3 = Fn_moveNpc
  L3_4 = "sm36_client"
  L4_5 = {L5_6}
  L5_6 = "locator2_client_move_pos_01"
  L5_6 = {}
  L5_6.arrivedLength = 0
  L2_3 = L2_3(L3_4, L4_5, L5_6)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_area_distant_a_01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_catwarp_a_01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_catwarp_a_02"
  L3_4(L4_5)
  L3_4 = Fn_setCatWarpCheckPoint
  L4_5 = "locator2_pc_warp_pos_a_01"
  L3_4(L4_5)
  L3_4 = warningAreaDistant
  L4_5 = "sm36_00104"
  L5_6 = "locator2_navi_survey"
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = invokeTask
  function L5_6()
    while L2_3 ~= nil do
      if L2_3 ~= nil and L2_3:isRunning() == false then
        L2_3 = nil
        print("client_move_task_01", L2_3)
        Fn_turnNpc("sm36_client", _puppet_tbl.sm36_client_talk_man_01)
        Fn_playMotionNpc("sm36_client", "sit_floor_in_00", true)
        Fn_playMotionNpc("sm36_client", "sit_floor_00", true)
        _is_kaji_ready = true
      end
      wait()
    end
  end
  L4_5(L5_6)
  _pc_caption_tbl = "sm36_00105"
  L4_5 = {}
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00310k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.man01 = L5_6
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00320k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.wom01 = L5_6
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00330k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.man83 = L5_6
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00350k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.man07 = L5_6
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00360k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.man09 = L5_6
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00370k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.man70 = L5_6
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00380k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.man71 = L5_6
  L5_6 = {}
  L5_6.known_kaiwa = "sm36_00390k"
  L5_6.reply_caption_skip = true
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_yes = L6_7
  L6_7 = {}
  L7_8 = _pc_caption_tbl
  L6_7.text = L7_8
  L6_7.time = 2
  L5_6.reply_no = L6_7
  L4_5.man64 = L5_6
  L5_6 = {L6_7}
  L6_7 = {}
  L7_8 = {}
  L8_9 = _pc_caption_tbl
  L7_8.text = L8_9
  L7_8.time = 2
  L6_7.reply_yes = L7_8
  L7_8 = {}
  L8_9 = _pc_caption_tbl
  L7_8.text = L8_9
  L7_8.time = 2
  L6_7.reply_no = L7_8
  L4_5.other = L5_6
  mob_txt = L4_5
  L4_5 = GestureEvent
  L4_5 = L4_5.create
  L5_6 = "ui_event_guide_02"
  L6_7 = gestureCancelFunc
  L7_8 = gestureBreakFunc
  L8_9 = gestureNpcActionCallback
  L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9)
  _gesture = L4_5
  L4_5 = _gesture
  L5_6 = L4_5
  L4_5 = L4_5.setNpc
  L6_7 = {
    L7_8,
    L8_9,
    L9_10,
    _puppet_tbl.sm36_info_chara_04,
    _puppet_tbl.sm36_info_chara_05,
    _puppet_tbl.sm36_info_chara_06,
    _puppet_tbl.sm36_info_chara_07,
    _puppet_tbl.sm36_info_chara_08,
    _puppet_tbl.sm36_client,
    _puppet_tbl.sm36_client_talk_man_01
  }
  L7_8 = _puppet_tbl
  L7_8 = L7_8.sm36_info_chara_01
  L8_9 = _puppet_tbl
  L8_9 = L8_9.sm36_info_chara_02
  L9_10 = _puppet_tbl
  L9_10 = L9_10.sm36_info_chara_03
  L4_5(L5_6, L6_7)
  L4_5 = _gesture
  L5_6 = L4_5
  L4_5 = L4_5.setMobText
  L6_7 = mob_txt
  L4_5(L5_6, L6_7)
  L4_5 = _gesture
  L5_6 = L4_5
  L4_5 = L4_5.setNaviTarget
  L6_7, L7_8 = nil, nil
  L8_9 = {}
  L8_9.pointing = false
  L8_9.classGroup = "yy_navi_sm36_all"
  L8_9.positiveRate = 0
  L4_5(L5_6, L6_7, L7_8, L8_9)
  L4_5 = {}
  L5_6 = {}
  L5_6.in_game_preview = "k_photo_sm3601"
  L4_5.view = L5_6
  L5_6 = Fn_gamePreviewView
  L6_7 = L4_5
  L5_6(L6_7)
  function L5_6(A0_15)
    print("yes_func\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
    print("args[stdAppearance]", A0_15.stdAppearance)
    print("args[\"className\"]", A0_15.className)
    if (A0_15.className == "man01" or A0_15.className == "man70") and _npc_kaiwa_table.sm36_info_chara_01_06.cnt == 1 then
      if A0_15.stdAppearance then
        return true
      end
    elseif (A0_15.className == "wom01" or A0_15.className == "man64") and _npc_kaiwa_table.sm36_info_chara_02_08.cnt == 1 then
      if A0_15.stdAppearance == true then
        return true
      end
    elseif (A0_15.className == "man83" or A0_15.className == "man71") and _npc_kaiwa_table.sm36_info_chara_03_07.cnt == 1 then
      if A0_15.stdAppearance == true then
        return true
      end
    elseif (A0_15.className == "man07" or A0_15.className == "man09") and _npc_kaiwa_table.sm36_info_chara_04_05.cnt == 1 and A0_15.stdAppearance == true then
      return true
    end
    if A0_15.className == "man01" or A0_15.className == "man70" then
      if not A0_15.stdAppearance then
        return true
      end
    elseif A0_15.className == "wom01" or A0_15.className == "man64" then
      if not A0_15.stdAppearance then
        return true
      end
    elseif A0_15.className == "man83" or A0_15.className == "man71" then
      if not A0_15.stdAppearance then
        return true
      end
    elseif (A0_15.className == "man07" or A0_15.className == "man09") and not A0_15.stdAppearance then
      return true
    end
    if A0_15.className == "man81" or A0_15.className == "man82" then
      return true
    end
    return false
  end
  L6_7 = _gesture
  L7_8 = L6_7
  L6_7 = L6_7.setOverrideNoFunc
  L8_9 = L5_6
  L6_7(L7_8, L8_9)
  L6_7 = _gesture
  L7_8 = L6_7
  L6_7 = L6_7.run
  L6_7(L7_8)
  L6_7 = Fn_missionViewWait
  L7_8 = "sm36_00100"
  L6_7(L7_8)
  L6_7 = invokeTask
  function L7_8()
    while true do
      _info_count = 0
      for _FORV_3_, _FORV_4_ in pairs(_already_gesture_tbl) do
        _info_count = _info_count + _npc_kaiwa_table[_FORV_4_.npc_name].cnt
      end
      if _npc_kaiwa_cnt + _gesture:getKnownKaiwaDemoCount() >= _INFO_MAX then
        while _gesture:isInteraction() and not (0 + 1 > 60) do
          wait()
        end
        Mv_gotoNextPhase()
      end
      if _mob_kaiwa_cnt < _gesture:getKnownKaiwaDemoCount() then
        for _FORV_3_, _FORV_4_ in pairs(_already_gesture_tbl) do
          if _gesture:getInteractionMobType() == _FORV_4_.type then
            _npc_kaiwa_table[_FORV_4_.npc_name].cnt = 1
            _mob_kaiwa_cnt = _gesture:getKnownKaiwaDemoCount()
          end
        end
      end
      wait()
    end
  end
  L6_7 = L6_7(L7_8)
  _investigation_task = L6_7
  L6_7 = Mv_waitPhase
  L6_7()
  L6_7 = Mv_safeTaskAbort
  L7_8 = _investigation_task
  L6_7 = L6_7(L7_8)
  _investigation_task = L6_7
  L6_7 = HUD
  L7_8 = L6_7
  L6_7 = L6_7.inGamePreviewFadeOut
  L6_7(L7_8)
  L6_7 = _gesture
  L7_8 = L6_7
  L6_7 = L6_7.stop
  L6_7(L7_8)
  L6_7 = Mv_safeTaskAbort
  L7_8 = L3_4
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 1
  L6_7(L7_8)
  L6_7 = Fn_kaiwaDemoView
  L7_8 = "sm36_00400k"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_store"
  L6_7(L7_8)
  L6_7 = Fn_missionView
  L7_8 = "sm36_00102"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 1.3
  L6_7(L7_8)
  L6_7 = Fn_naviSet
  L7_8 = findGameObject2
  L8_9 = "Node"
  L9_10 = "locator2_navi_store"
  L9_10 = L7_8(L8_9, L9_10)
  L6_7(L7_8, L8_9, L9_10, L7_8(L8_9, L9_10))
  L6_7 = warningAreaDistant
  L7_8 = "sm36_00103"
  L8_9 = "locator2_navi_store"
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = Mv_waitPhase
  L7_8()
  L7_8 = Mv_safeTaskAbort
  L8_9 = L6_7
  L7_8(L8_9)
  L7_8 = Fn_pcSensorOff
  L8_9 = "pccubesensor2_area_distant_a_01"
  L7_8(L8_9)
  L7_8 = Fn_pcSensorOff
  L8_9 = "pccubesensor2_catwarp_a_01"
  L7_8(L8_9)
  L7_8 = Fn_missionViewEnd
  L7_8()
  L7_8 = waitSeconds
  L8_9 = 0.5
  L7_8(L8_9)
  L7_8 = Fn_kaiwaDemoView
  L8_9 = "sm36_00450k"
  L7_8(L8_9)
  function L7_8()
    Mv_safeTaskAbort(_client_motion_task)
    Fn_warpNpc("sm36_client", "locator2_client_warp_pos_a_02")
    Fn_playMotionNpc("sm36_client", "stay_02", false)
    Fn_watchNpc("sm36_client", true)
    Fn_sendEventComSb("requestResetBox")
    for _FORV_3_ = 1, #_motion_task_tbl do
      Mv_safeTaskAbort(_motion_task_tbl[_FORV_3_])
    end
    Fn_disappearNpc("sm36_info_chara_01")
    Fn_disappearNpc("sm36_info_chara_02")
    Fn_disappearNpc("sm36_info_chara_03")
    Fn_disappearNpc("sm36_info_chara_04")
    Fn_disappearNpc("sm36_info_chara_05")
    Fn_disappearNpc("sm36_info_chara_06")
    Fn_disappearNpc("sm36_info_chara_07")
    Fn_disappearNpc("sm36_info_chara_08")
    Fn_disappearNpc("sm36_child")
    Fn_disappearNpc("sm36_client_talk_man_01")
    Fn_setNpcActive("sm36_regular", true)
    Fn_setNpcActive("sm36_customer", true)
    _sdemo_cut01:set("locator2_cam_a_01", "locator2_aim_a_01", false)
    _sdemo_cut01:play()
  end
  warp_func = L7_8
  L7_8 = Fn_sceneConversion
  L8_9 = "locator2_pc_warp_pos_a_02"
  L9_10 = warp_func
  L7_8(L8_9, L9_10)
  L7_8 = Fn_userCtrlAllOff
  L7_8()
  L7_8 = waitSeconds
  L8_9 = 1.2
  L7_8(L8_9)
  L7_8 = Fn_kaiwaDemoView
  L8_9 = "sm36_00500k"
  L7_8(L8_9)
  L7_8 = invokeTask
  function L8_9()
    Fn_playMotionNpc("sm36_regular", "talk_03", false)
    Fn_playMotionNpc("sm36_customer", "talk_02", false)
    Fn_playMotionNpc("sm36_sales_person", "talk_00", false)
  end
  L7_8(L8_9)
  L7_8 = findGameObject2
  L8_9 = "Node"
  L9_10 = "locator2_aim_a_02"
  L7_8 = L7_8(L8_9, L9_10)
  L8_9 = L7_8
  L7_8 = L7_8.getWorldPos
  L7_8 = L7_8(L8_9)
  L8_9 = Player
  L9_10 = L8_9
  L8_9 = L8_9.setLookAtIk
  L8_9(L9_10, true, 1, L7_8)
  L8_9 = waitSeconds
  L9_10 = 0.5
  L8_9(L9_10)
  L8_9 = {L9_10}
  L9_10 = {}
  L9_10.pos = "locator2_cam_a_01"
  L9_10.time = 1.5
  L9_10 = {
    {
      pos = "locator2_aim_a_02",
      time = 1.5
    }
  }
  _sdemo_cut01:play(L8_9, L9_10)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  _sdemo_cut01:zoomIn(1, {deg = 10}, "easeOut")
  Fn_playMotionNpc("sm36_regular", "talk_03", false)
  Fn_playMotionNpc("sm36_customer", "talk_02", false)
  wait(90)
  Fn_resetPcPos("locator2_pc_reset_pos_a")
  Fn_playMotionNpc("sm36_client", "stay_00", false)
  Fn_warpNpc("sm36_client", "locator2_client_warp_pos_a_03")
  Fn_kaiwaDemoView("sm36_00700k")
  invokeTask(function()
    Fn_turnNpc("sm36_regular", _puppet_tbl.sm36_customer)
  end)
  waitSeconds(0.1)
  Fn_turnNpc("sm36_customer", _puppet_tbl.sm36_regular)
  Fn_playMotionNpc("sm36_sales_person", "stay", false)
  invokeTask(function()
    Fn_playMotionNpc("sm36_regular", "greeting", true)
    Fn_findNpc("sm36_regular"):turn("locator2_regular_path_a_01_00")
    Fn_moveNpc("sm36_regular", {
      "locator2_regular_path_a_01_00",
      "locator2_regular_path_a_01_01"
    }, {
      anim_walk_speed = 1.3,
      anim_speed_over = true,
      runLength = 1000,
      recast = false
    })
  end)
  Fn_playMotionNpc("sm36_customer", "bye", true)
  Fn_moveNpc("sm36_customer", {
    "locator2_customer_path_a_01_01"
  }, {
    anim_run_speed = 0.8,
    anim_speed_over = true,
    anim_walk_speed = 1.2,
    anim_speed_over = true,
    runLength = 1000,
    recast = false
  })
  L8_9 = {
    {
      pos = "locator2_cam_a_01",
      time = 1.5
    }
  }
  L9_10 = {
    {
      pos = "locator2_aim_a_02",
      time = 1.5
    }
  }
  _sdemo_cut01:play(L8_9, L9_10)
  waitSeconds(2)
  Fn_kaiwaDemoView("sm36_00800k")
  Camera:lookTo(findGameObject2("Node", "locator2_aim_a_02"):getWorldPos(), 0, 0)
  Fn_watchNpc("sm36_client", false)
  Fn_userCtrlOn()
  _sdemo_cut01:stop(1)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_16, L1_17
end
function gestureCancelFunc()
  local L0_18, L1_19
  _decide_flag = true
  L0_18 = _cancel_flag
  return L0_18
end
function gestureBreakFunc()
  local L0_20, L1_21
  L0_20 = _break_flag
  return L0_20
end
function gestureNpcActionCallback(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27
  if A0_22 then
    L2_24 = A0_22
    L1_23 = A0_22.getName
    L1_23 = L1_23(L2_24)
    L3_25 = A0_22
    L2_24 = A0_22.getTypeName
    L2_24 = L2_24(L3_25)
    L3_25 = ""
    L4_26 = "sm36_00106"
    L5_27 = A0_22.getWorldPos
    L5_27 = L5_27(A0_22)
    L5_27 = L5_27 + Vector(0, 1.6, 0)
    Player:setLookAtIk(true, 1, L5_27)
    Fn_userCtrlOff()
    if L1_23 == "sm36_info_chara_01" and _is_npc_ready.sm36_info_chara_01.ready then
      _is_npc_ready.sm36_info_chara_01.ready = false
      if _npc_kaiwa_table.sm36_info_chara_01_06.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
            _FORV_10_.sit_out = true
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00310k")
        _npc_kaiwa_table.sm36_info_chara_01_06.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_userCtrlOn()
        wait(10)
        invokeTask(function()
          Fn_turnNpc(L1_23, "locator2_info_chara_01_turn")
          Fn_playMotionNpc(L1_23, "sit_in_00")
          _is_npc_ready.sm36_info_chara_01.ready = true
        end)
      else
        for _FORV_11_, _FORV_12_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_12_.npc and _FORV_12_.talked then
            print("npc_name", _FORV_12_.npc_name)
            break
          else
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        Fn_playMotionNpc(L1_23, "reply_no")
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        Fn_userCtrlOn()
        wait(10)
        invokeTask(function()
          Fn_turnNpc(L1_23, "locator2_info_chara_01_turn")
          Fn_playMotionNpc(L1_23, "sit_in_00")
          _is_npc_ready.sm36_info_chara_01.ready = true
        end)
      end
    elseif L1_23 == "sm36_info_chara_02" then
      if _npc_kaiwa_table.sm36_info_chara_02_08.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
          end
        end
        Mv_safeTaskAbort(_motion_task_tbl[1])
        Mv_safeTaskAbort(_motion_task_tbl[2])
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00320k")
        _npc_kaiwa_table.sm36_info_chara_02_08.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_turnNpc(L1_23, "locator2_child")
        _motion_task_tbl[1] = Fn_repeatPlayMotion("sm36_info_chara_02", "talk_01", {"talk_01"})
        wait(15)
        _motion_task_tbl[2] = Fn_repeatPlayMotion("sm36_child", "talk_00", {"talk_00"})
      else
        Mv_safeTaskAbort(_motion_task_tbl[1])
        Mv_safeTaskAbort(_motion_task_tbl[2])
        Fn_turnNpc(L1_23)
        Fn_playMotionNpc(L1_23, "reply_no")
        for _FORV_10_, _FORV_11_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_11_.npc and _FORV_11_.talked then
            print("npc_name", _FORV_11_.npc_name)
            break
          else
          end
        end
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        Fn_turnNpc(L1_23, "locator2_child")
        _motion_task_tbl[1] = Fn_repeatPlayMotion("sm36_info_chara_02", "talk_01", {"talk_01"})
        wait(15)
        _motion_task_tbl[2] = Fn_repeatPlayMotion("sm36_child", "talk_00", {"talk_00"})
      end
    elseif L1_23 == "sm36_info_chara_03" and _is_npc_ready.sm36_info_chara_03.ready then
      _is_npc_ready.sm36_info_chara_03.ready = false
      if _npc_kaiwa_table.sm36_info_chara_03_07.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00330k")
        _npc_kaiwa_table.sm36_info_chara_03_07.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_userCtrlOn()
        wait(10)
        invokeTask(function()
          Fn_turnNpc(L1_23, "locator2_info_chara_03_turn")
          Fn_playMotionNpc(L1_23, "sit_in_00")
          _is_npc_ready.sm36_info_chara_03.ready = true
        end)
      else
        for _FORV_10_, _FORV_11_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_11_.npc and _FORV_11_.talked then
            print("npc_name", _FORV_11_.npc_name)
            break
          else
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        Fn_playMotionNpc(L1_23, "reply_no")
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        Fn_userCtrlOn()
        wait(10)
        invokeTask(function()
          Fn_turnNpc(L1_23, "locator2_info_chara_03_turn")
          Fn_playMotionNpc(L1_23, "sit_in_00")
          _is_npc_ready.sm36_info_chara_03.ready = false
        end)
      end
    elseif L1_23 == "sm36_info_chara_04" and _is_npc_ready.sm36_info_chara_04.ready then
      _is_npc_ready.sm36_info_chara_04.ready = false
      if _npc_kaiwa_table.sm36_info_chara_04_05.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00350k")
        _npc_kaiwa_table.sm36_info_chara_04_05.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_userCtrlOn()
        wait(10)
        invokeTask(function()
          Fn_turnNpc(L1_23, "locator2_info_chara_04_turn")
          Fn_playMotionNpc(L1_23, "sit_in_00")
          _is_npc_ready.sm36_info_chara_04.ready = true
        end)
      else
        for _FORV_10_, _FORV_11_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_11_.npc and _FORV_11_.talked then
            print("npc_name", _FORV_11_.npc_name)
            break
          else
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        Fn_playMotionNpc(L1_23, "reply_no")
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        Fn_userCtrlOn()
        wait(10)
        invokeTask(function()
          Fn_turnNpc(L1_23, "locator2_info_chara_04_turn")
          Fn_playMotionNpc(L1_23, "sit_in_00")
          _is_npc_ready.sm36_info_chara_04.ready = true
        end)
      end
    elseif L1_23 == "sm36_info_chara_05" and _is_npc_ready.sm36_info_chara_05.ready then
      _is_npc_ready.sm36_info_chara_05.ready = false
      if _npc_kaiwa_table.sm36_info_chara_04_05.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00360k")
        _npc_kaiwa_table.sm36_info_chara_04_05.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_userCtrlOn()
        wait(10)
        invokeTask(function()
          Fn_turnNpc(L1_23, "locator2_info_chara_05_turn")
          Fn_playMotionNpc(L1_23, "sit_in_00")
          _is_npc_ready.sm36_info_chara_05.ready = true
        end)
      else
        for _FORV_10_, _FORV_11_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_11_.npc and _FORV_11_.talked then
            print("npc_name", _FORV_11_.npc_name)
            sit_out = _FORV_11_.sit_out
            break
          else
          end
        end
        Fn_playMotionNpc(L1_23, "sit_out_00")
        wait(10)
        Fn_turnNpc(L1_23)
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        wait(10)
        Fn_turnNpc(L1_23, "locator2_info_chara_05_turn")
        Fn_playMotionNpc(L1_23, "sit_in_00")
      end
    elseif L1_23 == "sm36_info_chara_06" then
      if _npc_kaiwa_table.sm36_info_chara_01_06.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
          end
        end
        Mv_safeTaskAbort(_motion_task_tbl[3])
        Mv_safeTaskAbort(_motion_task_tbl[4])
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00370k")
        _npc_kaiwa_table.sm36_info_chara_01_06.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_turnNpc(L1_23, "locator2_info_chara_07")
        _motion_task_tbl[3] = Fn_repeatPlayMotion("sm36_info_chara_06", "talk_01", {"talk_01"})
        wait(15)
        _motion_task_tbl[4] = Fn_repeatPlayMotion("sm36_info_chara_07", "talk_01", {"talk_00"})
      else
        Mv_safeTaskAbort(_motion_task_tbl[3])
        Mv_safeTaskAbort(_motion_task_tbl[4])
        Fn_turnNpc(L1_23)
        Fn_playMotionNpc(L1_23, "reply_no")
        for _FORV_10_, _FORV_11_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_11_.npc and _FORV_11_.talked then
            print("npc_name", _FORV_11_.npc_name)
            break
          else
          end
        end
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        Fn_turnNpc(L1_23, "locator2_info_chara_07")
        _motion_task_tbl[3] = Fn_repeatPlayMotion("sm36_info_chara_06", "talk_01", {"talk_01"})
        wait(15)
        _motion_task_tbl[4] = Fn_repeatPlayMotion("sm36_info_chara_07", "talk_01", {"talk_00"})
      end
    elseif L1_23 == "sm36_info_chara_07" then
      if _npc_kaiwa_table.sm36_info_chara_03_07.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
          end
        end
        Mv_safeTaskAbort(_motion_task_tbl[4])
        Mv_safeTaskAbort(_motion_task_tbl[3])
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00380k")
        _npc_kaiwa_table.sm36_info_chara_03_07.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_turnNpc(L1_23, "locator2_info_chara_06")
        _motion_task_tbl[4] = Fn_repeatPlayMotion("sm36_info_chara_07", "talk_01", {"talk_00"})
        wait(15)
        _motion_task_tbl[3] = Fn_repeatPlayMotion("sm36_info_chara_06", "talk_01", {"talk_01"})
      else
        Mv_safeTaskAbort(_motion_task_tbl[4])
        Mv_safeTaskAbort(_motion_task_tbl[3])
        Fn_turnNpc(L1_23)
        Fn_playMotionNpc(L1_23, "reply_no")
        for _FORV_10_, _FORV_11_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_11_.npc and _FORV_11_.talked then
            print("npc_name", _FORV_11_.npc_name)
            break
          else
          end
        end
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        Fn_turnNpc(L1_23, "locator2_info_chara_06")
        _motion_task_tbl[4] = Fn_repeatPlayMotion("sm36_info_chara_07", "talk_01", {"talk_00"})
        wait(15)
        _motion_task_tbl[3] = Fn_repeatPlayMotion("sm36_info_chara_06", "talk_01", {"talk_01"})
      end
    elseif L1_23 == "sm36_info_chara_08" then
      if _npc_kaiwa_table.sm36_info_chara_02_08.cnt == 0 then
        for _FORV_9_, _FORV_10_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_10_.npc then
            _FORV_10_.talked = true
          end
        end
        Mv_safeTaskAbort(_motion_task_tbl[5])
        Fn_turnNpc(L1_23)
        Fn_kaiwaDemoView("sm36_00390k")
        _npc_kaiwa_table.sm36_info_chara_02_08.cnt = 1
        _npc_kaiwa_cnt = _npc_kaiwa_cnt + 1
        Fn_turnNpc(L1_23, "locator2_info_chara_08_turn")
        _motion_task_tbl[5] = Fn_repeatPlayMotion("sm36_info_chara_08", "stay_02", {"stay_01"})
      else
        Mv_safeTaskAbort(_motion_task_tbl[5])
        Fn_turnNpc(L1_23)
        Fn_playMotionNpc(L1_23, "reply_no")
        for _FORV_10_, _FORV_11_ in pairs(_already_gesture_tbl) do
          if L1_23 == _FORV_11_.npc and _FORV_11_.talked then
            print("npc_name", _FORV_11_.npc_name)
            break
          else
          end
        end
        if false then
          Fn_captionView(L4_26)
        else
          Fn_captionView(_pc_caption_tbl)
        end
        Fn_turnNpc(L1_23, "locator2_info_chara_08_turn")
        _motion_task_tbl[5] = Fn_repeatPlayMotion("sm36_info_chara_08", "stay_02", {"stay_01"})
      end
    elseif (L1_23 == "sm36_client" or L1_23 == "sm36_client_talk_man_01") and Fn_findNpc("sm36_client"):isMoveEnd() and _is_kaji_ready then
      _is_kaji_ready = false
      Fn_killNpcTask("sm36_client")
      _client_motion_task = Mv_safeTaskAbort(_client_motion_task)
      Fn_playMotionNpc("sm36_client", "sit_floor_out_00", true)
      Fn_turnNpc("sm36_client")
      Fn_captionViewWait("sm36_00108")
      invokeTask(function()
        Fn_turnNpc("sm36_client", _puppet_tbl.sm36_client_talk_man_01)
        Fn_playMotionNpc("sm36_client", "sit_floor_in_00", true)
        Fn_playMotionNpc("sm36_client", "sit_floor_00", true)
        repeat
          wait()
        until Fn_findNpc("sm36_client"):isMotionEnd()
        _is_kaji_ready = true
      end)
    end
    Fn_userCtrlOn()
  else
  end
end
function warningAreaDistant(A0_28, A1_29)
  task = invokeTask(function()
    while true do
      if _is_area_distant then
        if _gesture ~= nil and _gesture:isRunning() then
          _gesture:stop()
        end
        if A1_29 ~= nil then
          if type(A1_29) == "string" then
            Fn_naviSet(findGameObject2("Node", A1_29))
          else
            Fn_naviSet(A1_29)
          end
        end
        if is_enable_navi_set then
          Fn_naviSet(target_view_obj)
        end
        Fn_captionViewWait(A0_28)
        while _is_area_distant do
          wait()
        end
        if _investigation_task ~= nil then
          _gesture:run()
        end
        if A1_29 ~= nil and _investigation_task ~= nil then
          Fn_naviKill()
        end
      end
      wait()
    end
  end)
  return task
end
function warningCatWarp(A0_30, A1_31)
  invokeTask(function()
    print("================\232\173\166\229\145\138\227\130\168\227\131\170\227\130\162\231\170\129\231\160\180================")
    Player:setStay(true)
    if A0_30 ~= nil then
      Fn_naviSet(findGameObject2("Node", A0_30))
    end
    if A1_31 ~= nil then
      Fn_captionViewLock(A1_31)
    else
      Fn_captionViewLock("sm36_00107")
    end
    Player:setStay(false)
  end)
end
function pccubesensor2_area_distant_OnEnter()
  local L0_32, L1_33
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  local L0_34, L1_35
  _is_area_distant = true
end
function pccubesensor2_catwarp_a_01_OnEnter()
  local L0_36, L1_37
end
function pccubesensor2_catwarp_a_01_OnLeave()
  if _investigation_task ~= nil then
    warningCatWarp("locator2_navi_survey")
  else
    warningCatWarp("locator2_navi_store")
  end
end
function pccubesensor2_catwarp_a_02_OnEnter()
  local L0_38, L1_39
end
function pccubesensor2_catwarp_a_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_store_OnEnter()
  Fn_pcSensorOff("pccubesensor2_store")
  Fn_naviKill()
  Mv_gotoNextPhase()
end
