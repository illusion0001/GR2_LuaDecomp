import("Wind")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
STORY_FLAG_MAX = 20
TIME_LIMIT = 75
XRO_FOUND_DISTANCE01 = 16
XRO_FOUND_DISTANCE02 = 9
FOUND_DISTANCE = 6
SUSPEND_TALKING_TIME = 7
JIJU_GREET_DIST = 3.5
WATCHER_EYE_ANGLE = 70
WATCHER_EYE_RANGE = 4.5
OBJ_NUM = {
  NIL = nil,
  BOOK01 = 1,
  BOOK02 = 2,
  BOOK03 = 3,
  DESK = 4,
  DIARY = 5,
  MUSIC_BOX = 6,
  DOOR = 7
}
_puppet_tbl = {}
_night = false
_switch = {}
_cap_flag = false
_crate_cap_wait = TIME_LIMIT
_mes_count = 0
_secret_cap_end = false
_crate_cap_wait2 = 0
_mes_count2 = 0
_talk_end = false
_npc_mes_count = 0
_talk_permission = true
_once_shill_react = false
_shill_talk_permission = true
_sdemo = nil
_time_cnt = 0
_sel_stop = 0
_sel_interval = 8
_day_cnt = 1
_floor_in = false
_enter_crossroads = false
_during_xer_event = false
_prison_out = false
_prison_door = false
_in_secret_talk_area = true
_in_stop_secret_talk_area = false
_obj_check_number = OBJ_NUM.NIL
_story_flag = {}
_open_window_next_night = false
_is_window_open = false
_once_prison_call_happened = false
_kai_flag = false
_xero_flag = true
_jiju_talk = nil
_xero_event = nil
_kai_event = nil
_xero_jiju_talk_task = nil
_day3_sentinel_talk_task = nil
_sensor_leave_task = nil
_sentinel_secret_talk_task = nil
_sentinel_sensor_leave_task = nil
_shill_day2_talk_task = nil
_shill_day3_talk_task = nil
_shill_day4_talk_task = nil
_shill_sensor_leave_task = nil
_dialog_cap_task = nil
_key_eff_hdl = nil
_voice_hdl = nil
_chair = nil
_day_one_task = nil
_door_view = nil
_xero_move_locator = "locator2_xero_move_left_01"
_xer_motion = nil
_kai_motion = nil
_jiju_motion = nil
_jijuday2_motion = nil
_sentinel01_motion = nil
_sentinel02_motion = nil
_shill01_motion = nil
_shill02_motion = nil
_event_motion_table = {
  label01 = "kit04_sit_00",
  label02 = "kit04_stay_00"
}
_jiju_mot_list = {
  open_door = "ep22_a_c01_wom_c01",
  greet = "wom33_greet_00"
}
_man66_mot_list = {
  stay_gate = "man66_stay_gate_00",
  greet = "man66_greet_00",
  talk_to_l = "man66_talk_l_00",
  talk_to_r = "man66_talk_r_00"
}
_audience_mot_list = {
  greet = "man66_greet_00",
  aud_sit = "man66_anaudience_in_00",
  aud_sitstay = "man66_anaudience_stay_00"
}
function Initialize()
  local L0_0
  L0_0 = Fn_disableCostumeChange
  L0_0(true)
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_bed_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_mirror_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_window_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_door_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_open_audience_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_Audience_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_enter_crossroads_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_xer_jiju_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_day3_sentinel_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_sentinel_secret_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_stop_sentinel_secret_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shill_move_day2_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shill_move_day4_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shill_day2_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shill_day3_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shill_day4_talk_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_throne_greeting_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_door_view_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_door_view_02")
  L0_0 = {
    {
      name = "jiju_01",
      type = "wom33",
      node = "locator2_jiju_01_00"
    },
    {
      name = "jiju_day2",
      type = "wom33",
      node = "locator2_jiju_day2_01",
      color_variation = 2,
      hair_variation = 1,
      active = false
    },
    {
      name = "jiju_02",
      type = "man66",
      node = "locator2_jiju_02",
      color_variation = 2,
      hair_variation = 1
    },
    {
      name = "sentinel_01",
      type = "man66",
      node = "locator2_sentinel_01"
    },
    {
      name = "sentinel_02",
      type = "man66",
      node = "locator2_sentinel_02",
      color_variation = 1
    },
    {
      name = "kai_01",
      type = "kai01",
      node = "locator2_kai_01",
      active = false
    },
    {
      name = "xer_01",
      type = "xer01",
      node = "locator2_xero_01",
      active = false
    },
    {
      name = "people_01",
      type = "man67",
      node = "locator2_people_pos_01",
      active = false
    },
    {
      name = "throne_wom01",
      type = "wom33",
      node = "locator2_throne_maid_01",
      color_variation = 4,
      face_tex_name = "wom33_face_d",
      active = false
    },
    {
      name = "throne_wom02",
      type = "wom33",
      node = "locator2_throne_maid_02",
      color_variation = 1,
      hair_variation = 1,
      face_tex_name = "wom33_face_c",
      active = false
    },
    {
      name = "throne_man01",
      type = "man66",
      node = "locator2_throne_dayone_man_01",
      color_variation = 2,
      face_tex_name = "man66_face_d",
      active = false
    },
    {
      name = "throne_man02",
      type = "man66",
      node = "locator2_throne_dayone_man_02",
      color_variation = 3,
      hair_variation = 1,
      face_tex_name = "man66_face_c",
      active = false
    },
    {
      name = "shill_day2_01",
      type = "man66",
      node = "locator2_shill_day2_01",
      color_variation = 1,
      hair_variation = 1,
      active = false
    },
    {
      name = "shill_day2_02",
      type = "man66",
      node = "locator2_shill_day2_02",
      color_variation = 3,
      active = false
    },
    {
      name = "shill_day3_01",
      type = "wom33",
      node = "locator2_shill_day3_01",
      color_variation = 1,
      active = false
    },
    {
      name = "shill_day3_02",
      type = "wom33",
      node = "locator2_shill_day3_02",
      hair_variation = 1,
      active = false
    },
    {
      name = "shill_day4_01",
      type = "wom33",
      node = "locator2_shill_day4_01",
      color_variation = 3,
      hair_variation = 1,
      active = false
    },
    {
      name = "shill_day4_02",
      type = "wom33",
      node = "locator2_shill_day4_02",
      color_variation = 2,
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _xer_npc = Fn_findNpc("xer_01")
  _jiju01_npc = Fn_findNpc("jiju_01")
  _kai_npc = Fn_findNpc("kai_01")
  _jijuday2_npc = Fn_findNpc("jiju_day2")
  for _FORV_4_ = 0, STORY_FLAG_MAX do
    _story_flag[_FORV_4_] = false
  end
  _sdemo = _FOR_.create("ep22_a")
  _sdemo:set("locator2_cam_01", "locator2_aim_01")
  _sdemo:setCameraParam(nil, nil, {deg = 25})
  Fn_loadPlayerMotion(_event_motion_table)
  Fn_loadNpcEventMotion("jiju_01", _jiju_mot_list)
  Fn_loadNpcEventMotion("shill_day3_01", _jiju_mot_list)
  Fn_loadNpcEventMotion("shill_day4_01", _jiju_mot_list)
  Fn_loadNpcEventMotion("throne_wom01", _jiju_mot_list)
  Fn_loadNpcEventMotion("throne_wom02", _jiju_mot_list)
  Fn_loadNpcEventMotion("jiju_02", _man66_mot_list)
  Fn_loadNpcEventMotion("sentinel_01", _man66_mot_list)
  Fn_loadNpcEventMotion("sentinel_02", _man66_mot_list)
  Fn_loadNpcEventMotion("shill_day2_01", _man66_mot_list)
  Fn_loadNpcEventMotion("throne_man01", _man66_mot_list)
  Fn_loadNpcEventMotion("throne_man02", _man66_mot_list)
  Fn_loadNpcEventMotion("people_01", _audience_mot_list)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = Fn_setCatActive
  L1_2 = false
  L0_1(L1_2)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setAbility
  L2_3 = Player
  L2_3 = L2_3.kAbility_TalismanEffect
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = GameDatabase
  L1_2 = L0_1
  L0_1 = L0_1.set
  L2_3 = ggd
  L2_3 = L2_3.Savedata__Menu__MenuUnlock__TopMenuTalisman
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1, L1_2 = nil, nil
  L2_3 = Wind
  L3_4 = L2_3
  L2_3 = L2_3.setIntensity
  L4_5 = 0
  L2_3(L3_4, L4_5)
  L2_3 = Fn_findAreaHandle
  L3_4 = "et2_a_root"
  L2_3 = L2_3(L3_4)
  while true do
    while true do
      L4_5 = L2_3
      L3_4 = L2_3.findChildNode
      L5_6 = "musicbox_md_01"
      L6_7 = true
      L3_4 = L3_4(L4_5, L5_6, L6_7)
      _musicbox_01 = L3_4
      L3_4 = _musicbox_01
      if L3_4 == nil then
        L3_4 = wait
        L3_4()
      end
    end
  end
  while true do
    L4_5 = L2_3
    L3_4 = L2_3.findChildNode
    L5_6 = "musicbox_md_01b"
    L6_7 = true
    L3_4 = L3_4(L4_5, L5_6, L6_7)
    _musicbox_01b = L3_4
    L3_4 = _musicbox_01b
    if L3_4 == nil then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = _musicbox_01
  L4_5 = L3_4
  L3_4 = L3_4.setVisible
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = _musicbox_01b
  L4_5 = L3_4
  L3_4 = L3_4.setVisible
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = Fn_findAreaHandle
  L4_5 = "et2_a_root"
  L3_4 = L3_4(L4_5)
  while true do
    while true do
      L5_6 = L3_4
      L4_5 = L3_4.findChildNode
      L6_7 = "et2_window_oc_03_02"
      L7_8 = true
      L4_5 = L4_5(L5_6, L6_7, L7_8)
      _win_l = L4_5
      L4_5 = _win_l
      if L4_5 == nil then
        L4_5 = wait
        L4_5()
      end
    end
  end
  while true do
    L5_6 = L3_4
    L4_5 = L3_4.findChildNode
    L6_7 = "et2_window_oc_04_02"
    L7_8 = true
    L4_5 = L4_5(L5_6, L6_7, L7_8)
    _win_r = L4_5
    L4_5 = _win_r
    if L4_5 == nil then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = _win_l
  L5_6 = L4_5
  L4_5 = L4_5.setRot
  L6_7 = XYZRotQuaternionEular
  L7_8 = 0
  L8_9 = -90
  L9_10 = 0
  L9_10 = L6_7(L7_8, L8_9, L9_10)
  L4_5(L5_6, L6_7, L7_8, L8_9, L9_10, L6_7(L7_8, L8_9, L9_10))
  L4_5 = _win_r
  L5_6 = L4_5
  L4_5 = L4_5.setRot
  L6_7 = XYZRotQuaternionEular
  L7_8 = 0
  L8_9 = -90
  L9_10 = 0
  L9_10 = L6_7(L7_8, L8_9, L9_10)
  L4_5(L5_6, L6_7, L7_8, L8_9, L9_10, L6_7(L7_8, L8_9, L9_10))
  L4_5 = _win_l
  L5_6 = L4_5
  L4_5 = L4_5.setForceMove
  L4_5(L5_6)
  L4_5 = _win_r
  L5_6 = L4_5
  L4_5 = L4_5.setForceMove
  L4_5(L5_6)
  L4_5, L5_6 = nil, nil
  while true do
    while true do
      L7_8 = L3_4
      L6_7 = L3_4.findChildNode
      L8_9 = "et2_door_oc_03_02"
      L9_10 = true
      L6_7 = L6_7(L7_8, L8_9, L9_10)
      L4_5 = L6_7
      if L4_5 == nil then
        L6_7 = wait
        L6_7()
      end
    end
  end
  while true do
    L7_8 = L3_4
    L6_7 = L3_4.findChildNode
    L8_9 = "et2_door_oc_04_02"
    L9_10 = true
    L6_7 = L6_7(L7_8, L8_9, L9_10)
    L5_6 = L6_7
    if L5_6 == nil then
      L6_7 = wait
      L6_7()
    end
  end
  L7_8 = L4_5
  L6_7 = L4_5.setRot
  L8_9 = XYZRotQuaternionEular
  L9_10 = 0
  L9_10 = L8_9(L9_10, -90, 0)
  L6_7(L7_8, L8_9, L9_10, L8_9(L9_10, -90, 0))
  L7_8 = L5_6
  L6_7 = L5_6.setRot
  L8_9 = XYZRotQuaternionEular
  L9_10 = 0
  L9_10 = L8_9(L9_10, -90, 0)
  L6_7(L7_8, L8_9, L9_10, L8_9(L9_10, -90, 0))
  L6_7 = invokeTask
  function L7_8()
    _door1_move_permission = false
    _door1_switch_l = false
    _door1_rot_l = 90
    _door1_switch_r = false
    _door1_rot_r = 90
    while true do
      if _door1_move_permission then
        if _door1_switch_l == false then
          _door1_rot_l = _door1_rot_l + 1
          if _door1_rot_l > 220 then
            _door1_rot_l = 220
          end
        else
          _door1_rot_l = _door1_rot_l - 1
          if _door1_rot_l < 90 then
            _door1_rot_l = 90
          end
        end
        if _door1_switch_r == false then
          _door1_rot_r = _door1_rot_r - 1
          if _door1_rot_r < -40 then
            _door1_rot_r = -40
          end
        else
          _door1_rot_r = _door1_rot_r + 1
          if 90 < _door1_rot_r then
            _door1_rot_r = 90
          end
        end
      end
      L4_5:setRot(XYZRotQuaternionEular(0, _door1_rot_l, 0))
      L5_6:setRot(XYZRotQuaternionEular(0, _door1_rot_r, 0))
      L4_5:setForceMove()
      L5_6:setForceMove()
      wait()
    end
  end
  L6_7(L7_8)
  L6_7, L7_8 = nil, nil
  while true do
    while true do
      L9_10 = L3_4
      L8_9 = L3_4.findChildNode
      L8_9 = L8_9(L9_10, "et2_door_oc_01_01", true)
      L6_7 = L8_9
      if L6_7 == nil then
        L8_9 = wait
        L8_9()
      end
    end
  end
  while true do
    L9_10 = L3_4
    L8_9 = L3_4.findChildNode
    L8_9 = L8_9(L9_10, "et2_door_oc_02_01", true)
    L7_8 = L8_9
    if L7_8 == nil then
      L8_9 = wait
      L8_9()
    end
  end
  L8_9 = invokeTask
  function L9_10()
    _door2_move_permission = false
    _door2_switch_l = false
    _door2_rot_l = 0
    _door2_switch_r = false
    _door2_rot_r = 0
    while true do
      if _door2_move_permission then
        if _door2_switch_l == false then
          _door2_rot_l = _door2_rot_l + 1
          if _door2_rot_l > 120 then
            _door2_rot_l = 120
          end
        else
          _door2_rot_l = _door2_rot_l - 1
          if _door2_rot_l < 0 then
            _door2_rot_l = 0
          end
        end
        if _door2_switch_r == false then
          _door2_rot_r = _door2_rot_r - 1
          if _door2_rot_r < -120 then
            _door2_rot_r = -120
          end
        else
          _door2_rot_r = _door2_rot_r + 1
          if 0 < _door2_rot_r then
            _door2_rot_r = 0
          end
        end
      end
      L6_7:setRot(XYZRotQuaternionEular(0, _door2_rot_l, 0))
      L7_8:setRot(XYZRotQuaternionEular(0, _door2_rot_r, 0))
      L6_7:setForceMove()
      L7_8:setForceMove()
      wait()
    end
  end
  L8_9(L9_10)
  while true do
    L9_10 = L3_4
    L8_9 = L3_4.findChildNode
    L8_9 = L8_9(L9_10, "et2_chair_oc_03", true)
    _chair = L8_9
    L8_9 = _chair
    if L8_9 == nil then
      L8_9 = wait
      L8_9()
    end
  end
  L8_9 = _chair
  L9_10 = L8_9
  L8_9 = L8_9.setCollidablePermission
  L8_9(L9_10, false)
  L8_9 = waitSeconds
  L9_10 = 1
  L8_9(L9_10)
  L8_9 = Fn_playPlayerMotion
  L9_10 = "kit04_stay_00"
  L8_9(L9_10, 0)
  L8_9 = Fn_missionStart
  L8_9()
  L8_9 = xero_talking
  L8_9()
  L8_9 = Fn_setNpcActive
  L9_10 = "kai_01"
  L8_9(L9_10, _kai_flag)
  L8_9 = Fn_setNpcActive
  L9_10 = "xer_01"
  L8_9(L9_10, false)
  L8_9 = Fn_pcSensorOn
  L9_10 = "pccubesensormulti2_sentinel_secret_talk_area_01"
  L8_9(L9_10)
  L8_9 = Fn_pcSensorOn
  L9_10 = "pccubesensor2_stop_sentinel_secret_talk_area_01"
  L8_9(L9_10)
  L8_9 = Fn_repeatPlayMotion
  L9_10 = "sentinel_01"
  L8_9 = L8_9(L9_10, _man66_mot_list.talk_to_r, {
    _man66_mot_list.talk_to_r
  })
  _sentinel01_motion = L8_9
  L8_9 = Fn_repeatPlayMotion
  L9_10 = "sentinel_02"
  L8_9 = L8_9(L9_10, _man66_mot_list.talk_to_l, {
    _man66_mot_list.talk_to_l
  })
  _sentinel02_motion = L8_9
  repeat
    L8_9 = Fn_pcSensorOn
    L9_10 = "pccubesensor2_hully_01"
    L8_9(L9_10)
    L8_9 = Fn_pcSensorOff
    L9_10 = "pccubesensor2_door_01"
    L8_9(L9_10)
    L8_9 = Fn_playMotionNpc
    L9_10 = "jiju_02"
    L8_9(L9_10, _man66_mot_list.stay_gate, false)
    L8_9 = Fn_playMotionNpc
    L9_10 = "sentinel_01"
    L8_9(L9_10, _man66_mot_list.stay_gate, false)
    L8_9 = Fn_playMotionNpc
    L9_10 = "sentinel_02"
    L8_9(L9_10, _man66_mot_list.stay_gate, false)
    L8_9 = Fn_switchDayAndNight
    L9_10 = true
    L8_9(L9_10)
    L8_9 = print
    L9_10 = "\230\156\157\227\129\171\227\129\151\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129"
    L8_9(L9_10)
    L8_9 = _day_cnt
    if L8_9 ~= 1 then
      L8_9 = Fn_fadein
      L9_10 = 2
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "jiju_01"
      L8_9(L9_10, _jiju_mot_list.greet, false)
      L8_9 = waitSeconds
      L9_10 = 2
      L8_9(L9_10)
    end
    L8_9 = waitSeconds
    L9_10 = 1
    L8_9(L9_10)
    L8_9 = _day_cnt
    if L8_9 == 1 then
      L8_9 = Fn_kaiwaDemoView
      L9_10 = "ep22_00210k"
      L8_9(L9_10)
      L8_9 = Fn_moveNpc
      L9_10 = "jiju_01"
      L8_9 = L8_9(L9_10, {
        "locator2_center_of_room_for_day01",
        "locator2_front_of_door_01"
      }, {arrivedLength = 0})
      _jiju_move_task = L8_9
    else
      L8_9 = _story_flag
      L8_9 = L8_9[5]
      if L8_9 then
        L8_9 = _story_flag
        L8_9 = L8_9[6]
        if L8_9 == false then
          L8_9 = Fn_kaiwaDemoView
          L9_10 = "ep22_00270k"
          L8_9(L9_10)
          L8_9 = _story_flag
          L8_9[6] = true
        end
      else
        L8_9 = Fn_kaiwaDemoView
        L9_10 = "ep22_00220k"
        L8_9(L9_10)
      end
    end
    L8_9 = _day_cnt
    if L8_9 == 3 then
      L8_9 = Fn_pcSensorOn
      L9_10 = "pccubesensor2_door_view_01"
      L8_9(L9_10)
      L8_9 = Fn_pcSensorOn
      L9_10 = "pccubesensor2_door_view_02"
      L8_9(L9_10)
      L8_9 = prison_accident
      L8_9()
    else
      L8_9 = _day_cnt
      if L8_9 == 4 then
        L8_9 = Fn_setNpcActive
        L9_10 = "shill_day4_01"
        L8_9(L9_10, true)
        L8_9 = Fn_setNpcActive
        L9_10 = "shill_day4_02"
        L8_9(L9_10, true)
        L8_9 = Fn_pcSensorOn
        L9_10 = "pccubesensor2_shill_move_day4_01"
        L8_9(L9_10)
      end
    end
    L8_9 = invokeTask
    function L9_10()
      waitSeconds(1)
      Fn_userCtrlOn()
      Fn_pcSensorOn("pccubesensor2_open_audience_01")
    end
    L8_9(L9_10)
    L8_9 = _day_cnt
    if L8_9 ~= 1 then
      L8_9 = waitSeconds
      L9_10 = 2.5
      L8_9(L9_10)
      L8_9 = _day_cnt
      if L8_9 == 2 then
        L8_9 = Fn_moveNpc
        L9_10 = "jiju_01"
        L8_9 = L8_9(L9_10, {
          "locator2_jiju_01_left_01"
        }, {arrivedLength = 0})
        _jiju_move_task = L8_9
      else
        L8_9 = _day_cnt
        if L8_9 ~= 2 then
          L8_9 = Fn_moveNpc
          L9_10 = "jiju_01"
          L8_9 = L8_9(L9_10, {
            "locator2_center_of_room_01",
            "locator2_front_of_door_01"
          }, {arrivedLength = 0})
          _jiju_move_task = L8_9
        end
      end
    end
    while true do
      L8_9 = _jiju_move_task
      L9_10 = L8_9
      L8_9 = L8_9.isRunning
      L8_9 = L8_9(L9_10)
      if L8_9 then
        L8_9 = wait
        L8_9()
      end
    end
    L8_9 = Mv_safeTaskAbort
    L9_10 = _jiju_move_task
    L8_9(L9_10)
    L8_9 = wait
    L8_9()
    L8_9 = _day_cnt
    if L8_9 == 2 then
      L8_9 = Fn_turnNpc
      L9_10 = "jiju_01"
      L8_9(L9_10, "locator2_jiju_01_left_turn")
      L8_9 = Fn_playMotionNpc
      L9_10 = "jiju_01"
      L8_9(L9_10, "stay", false)
    else
      L8_9 = _day_cnt
      if L8_9 ~= 2 then
        L8_9 = Fn_turnNpc
        L9_10 = "jiju_01"
        L8_9(L9_10, "pccubesensor2_door_01")
        L8_9 = Sound
        L9_10 = L8_9
        L8_9 = L8_9.playSEHandle
        L8_9 = L8_9(L9_10, "ep22_office_open", 1, "", findGameObject2("Node", "pccubesensor2_door_01"))
        L0_1 = L8_9
        _door1_switch_l = false
        _door1_switch_r = false
        _door1_move_permission = true
        L8_9 = invokeTask
        function L9_10()
          while true do
            if _door1_rot_l == 220 then
              Sound:stopSEHandle(L0_1)
              print("\229\159\183\229\139\153\229\174\164\230\137\137\233\150\139\227\129\141\233\159\179\239\188\154\229\129\156\230\173\162\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
              break
            end
            wait()
          end
        end
        L8_9(L9_10)
        L8_9 = Fn_playMotionNpc
        L9_10 = "jiju_01"
        L8_9(L9_10, _jiju_mot_list.open_door, true)
        L8_9 = Fn_playMotionNpc
        L9_10 = "jiju_01"
        L8_9(L9_10, "stay", false)
      end
    end
    L8_9 = Mv_waitPhase
    L8_9()
    L8_9 = Mv_safeTaskAbort
    L9_10 = _jiju_talk
    L8_9(L9_10)
    L8_9 = invokeTask
    function L9_10()
      Sound:playSE("m41_003", 1, "", _puppet_tbl.jiju_02)
      Fn_captionView("ep22_00145")
      Fn_playMotionNpc("jiju_02", "call_00", true)
      Fn_playMotionNpc("jiju_02", _man66_mot_list.stay_gate, false, {animBlendDuration = 0.8})
    end
    L8_9(L9_10)
    L8_9 = Sound
    L9_10 = L8_9
    L8_9 = L8_9.playSEHandle
    L8_9 = L8_9(L9_10, "ep22_chamber_open", 1, "", findGameObject2("Node", "locator2_audience_door_sound_01"))
    L1_2 = L8_9
    _door2_switch_l = false
    _door2_switch_r = false
    _door2_move_permission = true
    L8_9 = invokeTask
    function L9_10()
      while true do
        if _door2_rot_l == 120 then
          Sound:stopSEHandle(L1_2)
          print("\232\172\129\232\166\139\229\174\164\230\137\137\233\150\139\227\129\141\233\159\179\239\188\154\229\129\156\230\173\162\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
          break
        end
        wait()
      end
    end
    L8_9(L9_10)
    L8_9 = waitSeconds
    L9_10 = 1
    L8_9(L9_10)
    L8_9 = Fn_pcSensorOn
    L9_10 = "pccubesensor2_Audience_01"
    L8_9(L9_10)
    L8_9 = Mv_waitPhase
    L8_9()
    L8_9 = Fn_blackout
    L9_10 = 1
    L8_9(L9_10)
    L8_9 = Fn_loadPlayerMotion
    L9_10 = _event_motion_table
    L8_9(L9_10)
    L8_9 = Fn_userCtrlOff
    L8_9()
    L8_9 = waitSeconds
    L9_10 = 2
    L8_9(L9_10)
    L8_9 = Fn_setNpcActive
    L9_10 = "throne_wom01"
    L8_9(L9_10, false)
    L8_9 = Fn_setNpcActive
    L9_10 = "throne_wom02"
    L8_9(L9_10, false)
    _door2_move_permission = false
    _door2_rot_l = 0
    _door2_rot_r = 0
    L8_9 = _day_cnt
    if L8_9 == 1 then
      L8_9 = _chair
      L9_10 = L8_9
      L8_9 = L8_9.setCollidablePermission
      L8_9(L9_10, false)
    end
    L8_9 = Mv_safeTaskAbort
    L9_10 = _kai_motion
    L8_9(L9_10)
    L8_9 = Mv_safeTaskAbort
    L9_10 = _jijuday2_motion
    L8_9(L9_10)
    L8_9 = Mv_safeTaskAbort
    L9_10 = _sentinel01_motion
    L8_9 = L8_9(L9_10)
    _sentinel01_motion = L8_9
    L8_9 = Mv_safeTaskAbort
    L9_10 = _sentinel02_motion
    L8_9 = L8_9(L9_10)
    _sentinel02_motion = L8_9
    L8_9 = Fn_pcSensorOff
    L9_10 = "pccubesensor2_talk_area_01"
    L8_9(L9_10)
    L8_9 = Fn_setNpcActive
    L9_10 = "jiju_day2"
    L8_9(L9_10, false)
    L8_9 = Fn_setNpcActive
    L9_10 = "people_01"
    L8_9(L9_10, true)
    L8_9 = Fn_resetPcPos
    L9_10 = "locator2_throne_01"
    L8_9(L9_10)
    L8_9 = waitSeconds
    L9_10 = 0.5
    L8_9(L9_10)
    L8_9 = Fn_playPlayerMotion
    L9_10 = "kit04_sit_00"
    L8_9(L9_10, 0)
    L8_9 = Fn_playMotionNpc
    L9_10 = "people_01"
    L8_9(L9_10, "stay", false)
    L8_9 = waitSeconds
    L9_10 = 1
    L8_9(L9_10)
    L8_9 = _sdemo
    L9_10 = L8_9
    L8_9 = L8_9.play
    L8_9(L9_10)
    L8_9 = Fn_playMotionNpc
    L9_10 = "people_01"
    L8_9(L9_10, _audience_mot_list.greet, false)
    L8_9 = Fn_fadein
    L8_9()
    L8_9 = _day_cnt
    if L8_9 == 1 then
      L8_9 = Fn_disappearNpc
      L9_10 = "throne_man01"
      L8_9(L9_10)
      L8_9 = Fn_disappearNpc
      L9_10 = "throne_man02"
      L8_9(L9_10)
      L8_9 = waitSeconds
      L9_10 = 2
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
      L8_9 = Fn_kaiwaDemoView
      L9_10 = "ep22_00212k"
      L8_9(L9_10)
      L8_9 = waitSeconds
      L9_10 = 0.5
      L8_9(L9_10)
      L8_9 = Fn_blackout
      L9_10 = 2
      L8_9(L9_10)
      L8_9 = waitSeconds
      L9_10 = 1
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, "stay", false)
      L8_9 = waitSeconds
      L9_10 = 1
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.greet, false)
      L8_9 = Fn_fadein
      L8_9()
      L8_9 = waitSeconds
      L9_10 = 2
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
      L8_9 = Fn_kaiwaDemoView
      L9_10 = "ep22_00213k"
      L8_9(L9_10)
      L8_9 = waitSeconds
      L9_10 = 0.5
      L8_9(L9_10)
      L8_9 = Fn_blackout
      L9_10 = 2
      L8_9(L9_10)
      L8_9 = waitSeconds
      L9_10 = 1
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, "stay", false)
      L8_9 = waitSeconds
      L9_10 = 1
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.greet, false)
      L8_9 = Fn_fadein
      L8_9()
      L8_9 = waitSeconds
      L9_10 = 2
      L8_9(L9_10)
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
      L8_9 = Fn_playMotionNpc
      L9_10 = "people_01"
      L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
      L8_9 = Fn_kaiwaDemoView
      L9_10 = "ep22_00214k"
      L8_9(L9_10)
      L8_9 = waitSeconds
      L9_10 = 0.5
      L8_9(L9_10)
      L8_9 = Fn_pcSensorOn
      L9_10 = "pccubesensor2_mirror_01"
      L8_9(L9_10)
    else
      L8_9 = _day_cnt
      if L8_9 == 2 then
        L8_9 = waitSeconds
        L9_10 = 2
        L8_9(L9_10)
        L8_9 = Fn_playMotionNpc
        L9_10 = "people_01"
        L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
        L8_9 = Fn_playMotionNpc
        L9_10 = "people_01"
        L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
        L8_9 = Fn_kaiwaDemoView
        L9_10 = "ep22_00222k"
        L8_9(L9_10)
        L8_9 = waitSeconds
        L9_10 = 0.5
        L8_9(L9_10)
        L8_9 = Fn_blackout
        L9_10 = 2
        L8_9(L9_10)
        L8_9 = waitSeconds
        L9_10 = 1
        L8_9(L9_10)
        L8_9 = Fn_playMotionNpc
        L9_10 = "people_01"
        L8_9(L9_10, "stay", false)
        L8_9 = waitSeconds
        L9_10 = 1
        L8_9(L9_10)
        L8_9 = Fn_playMotionNpc
        L9_10 = "people_01"
        L8_9(L9_10, _audience_mot_list.greet, false)
        L8_9 = Fn_fadein
        L8_9()
        L8_9 = waitSeconds
        L9_10 = 2
        L8_9(L9_10)
        L8_9 = Fn_playMotionNpc
        L9_10 = "people_01"
        L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
        L8_9 = Fn_playMotionNpc
        L9_10 = "people_01"
        L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
        L8_9 = Fn_kaiwaDemoView
        L9_10 = "ep22_00223k"
        L8_9(L9_10)
        L8_9 = waitSeconds
        L9_10 = 0.5
        L8_9(L9_10)
        L8_9 = Fn_blackout
        L9_10 = 2
        L8_9(L9_10)
        L8_9 = Fn_setNpcActive
        L9_10 = "people_01"
        L8_9(L9_10, false)
        L8_9 = Fn_warpNpc
        L9_10 = "xer_01"
        L8_9(L9_10, "locator2_people_pos_01")
        L8_9 = Fn_setNpcActive
        L9_10 = "xer_01"
        L8_9(L9_10, true)
        L8_9 = waitSeconds
        L9_10 = 2
        L8_9(L9_10)
        L8_9 = Fn_playMotionNpc
        L9_10 = "people_01"
        L8_9(L9_10, "stay", false)
        L8_9 = Fn_fadein
        L8_9()
        L8_9 = Fn_playMotionNpc
        L9_10 = "xer_01"
        L8_9(L9_10, "greeting", false, {animBlendDuration = 0.4})
        L8_9 = waitSeconds
        L9_10 = 3.7
        L8_9(L9_10)
        L8_9 = Fn_kaiwaDemoView
        L9_10 = "ep22_00224k"
        L8_9(L9_10)
        L8_9 = Fn_playMotionNpc
        L9_10 = "xer_01"
        L8_9(L9_10, "stay", false, {animBlendDuration = 0.8})
      else
        L8_9 = _day_cnt
        if L8_9 == 3 then
          L8_9 = waitSeconds
          L9_10 = 2
          L8_9(L9_10)
          L8_9 = Fn_playMotionNpc
          L9_10 = "people_01"
          L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
          L8_9 = Fn_playMotionNpc
          L9_10 = "people_01"
          L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
          L8_9 = Fn_kaiwaDemoView
          L9_10 = "ep22_00230k"
          L8_9(L9_10)
          L8_9 = waitSeconds
          L9_10 = 0.5
          L8_9(L9_10)
          L8_9 = Fn_blackout
          L9_10 = 2
          L8_9(L9_10)
          L8_9 = waitSeconds
          L9_10 = 1
          L8_9(L9_10)
          L8_9 = Fn_playMotionNpc
          L9_10 = "people_01"
          L8_9(L9_10, "stay", false)
          L8_9 = waitSeconds
          L9_10 = 1
          L8_9(L9_10)
          L8_9 = Fn_playMotionNpc
          L9_10 = "people_01"
          L8_9(L9_10, _audience_mot_list.greet, false)
          L8_9 = Fn_fadein
          L8_9()
          L8_9 = waitSeconds
          L9_10 = 2
          L8_9(L9_10)
          L8_9 = Fn_playMotionNpc
          L9_10 = "people_01"
          L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
          L8_9 = Fn_playMotionNpc
          L9_10 = "people_01"
          L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
          L8_9 = Fn_kaiwaDemoView
          L9_10 = "ep22_00231k"
          L8_9(L9_10)
          L8_9 = waitSeconds
          L9_10 = 0.5
          L8_9(L9_10)
          L8_9 = Fn_blackout
          L9_10 = 2
          L8_9(L9_10)
          L8_9 = Fn_setNpcActive
          L9_10 = "people_01"
          L8_9(L9_10, false)
          L8_9 = Fn_warpNpc
          L9_10 = "kai_01"
          L8_9(L9_10, "locator2_people_pos_01")
          L8_9 = Fn_setNpcActive
          L9_10 = "kai_01"
          L8_9(L9_10, true)
          L8_9 = waitSeconds
          L9_10 = 2
          L8_9(L9_10)
          L8_9 = Fn_playMotionNpc
          L9_10 = "people_01"
          L8_9(L9_10, "stay", false)
          L8_9 = Fn_fadein
          L8_9()
          L8_9 = wait
          L8_9()
          L8_9 = Fn_playMotionNpc
          L9_10 = "kai_01"
          L8_9(L9_10, "greeting", true)
          L8_9 = waitSeconds
          L9_10 = 0.5
          L8_9(L9_10)
          L8_9 = Fn_kaiwaDemoView
          L9_10 = "ep22_00232k"
          L8_9(L9_10)
        else
          L8_9 = _day_cnt
          if L8_9 == 4 then
            L8_9 = waitSeconds
            L9_10 = 2
            L8_9(L9_10)
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
            L8_9 = Fn_kaiwaDemoView
            L9_10 = "ep22_00240k"
            L8_9(L9_10)
            L8_9 = waitSeconds
            L9_10 = 0.5
            L8_9(L9_10)
            L8_9 = Fn_blackout
            L9_10 = 2
            L8_9(L9_10)
            L8_9 = waitSeconds
            L9_10 = 1
            L8_9(L9_10)
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, "stay", false)
            L8_9 = waitSeconds
            L9_10 = 1
            L8_9(L9_10)
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.greet, false)
            L8_9 = Fn_fadein
            L8_9()
            L8_9 = waitSeconds
            L9_10 = 2
            L8_9(L9_10)
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
            L8_9 = Fn_kaiwaDemoView
            L9_10 = "ep22_00241k"
            L8_9(L9_10)
            L8_9 = waitSeconds
            L9_10 = 0.5
            L8_9(L9_10)
            L8_9 = Fn_blackout
            L9_10 = 2
            L8_9(L9_10)
            L8_9 = waitSeconds
            L9_10 = 1
            L8_9(L9_10)
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, "stay", false)
            L8_9 = waitSeconds
            L9_10 = 1
            L8_9(L9_10)
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.greet, false)
            L8_9 = Fn_fadein
            L8_9()
            L8_9 = waitSeconds
            L9_10 = 2
            L8_9(L9_10)
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
            L8_9 = Fn_playMotionNpc
            L9_10 = "people_01"
            L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
            L8_9 = Fn_kaiwaDemoView
            L9_10 = "ep22_00242k"
            L8_9(L9_10)
            L8_9 = waitSeconds
            L9_10 = 0.5
            L8_9(L9_10)
          else
            L8_9 = _day_cnt
            if L8_9 == 5 then
              L8_9 = waitSeconds
              L9_10 = 2
              L8_9(L9_10)
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
              L8_9 = Fn_kaiwaDemoView
              L9_10 = "ep22_00250k"
              L8_9(L9_10)
              L8_9 = waitSeconds
              L9_10 = 0.5
              L8_9(L9_10)
              L8_9 = Fn_blackout
              L9_10 = 2
              L8_9(L9_10)
              L8_9 = waitSeconds
              L9_10 = 1
              L8_9(L9_10)
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, "stay", false)
              L8_9 = waitSeconds
              L9_10 = 1
              L8_9(L9_10)
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.greet, false)
              L8_9 = Fn_fadein
              L8_9()
              L8_9 = waitSeconds
              L9_10 = 2
              L8_9(L9_10)
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
              L8_9 = Fn_kaiwaDemoView
              L9_10 = "ep22_00251k"
              L8_9(L9_10)
              L8_9 = waitSeconds
              L9_10 = 0.5
              L8_9(L9_10)
              L8_9 = Fn_blackout
              L9_10 = 2
              L8_9(L9_10)
              L8_9 = waitSeconds
              L9_10 = 1
              L8_9(L9_10)
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, "stay", false)
              L8_9 = waitSeconds
              L9_10 = 1
              L8_9(L9_10)
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.greet, false)
              L8_9 = Fn_fadein
              L8_9()
              L8_9 = waitSeconds
              L9_10 = 2
              L8_9(L9_10)
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
              L8_9 = Fn_playMotionNpc
              L9_10 = "people_01"
              L8_9(L9_10, _audience_mot_list.aud_sitstay, false)
              L8_9 = Fn_kaiwaDemoView
              L9_10 = "ep22_00252k"
              L8_9(L9_10)
              L8_9 = waitSeconds
              L9_10 = 1
              L8_9(L9_10)
            else
              L8_9 = Fn_get_shuffle_teble
              L9_10 = {
                "ep22_00216k",
                "ep22_00217k",
                "ep22_00225k",
                "ep22_00226k",
                "ep22_00233k",
                "ep22_00234k",
                "ep22_00243k",
                "ep22_00244k",
                "ep22_00245k",
                "ep22_00253k",
                "ep22_00254k",
                "ep22_00255k"
              }
              L8_9 = L8_9(L9_10)
              L9_10 = waitSeconds
              L9_10(2)
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.aud_sitstay, false)
              L9_10 = Fn_kaiwaDemoView
              L9_10(L8_9[1])
              L9_10 = Fn_blackout
              L9_10(2)
              L9_10 = waitSeconds
              L9_10(1)
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", "stay", false)
              L9_10 = waitSeconds
              L9_10(1)
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.greet, false)
              L9_10 = Fn_fadein
              L9_10()
              L9_10 = waitSeconds
              L9_10(2)
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.aud_sitstay, false)
              L9_10 = Fn_kaiwaDemoView
              L9_10(L8_9[2])
              L9_10 = waitSeconds
              L9_10(0.5)
              L9_10 = Fn_blackout
              L9_10(2)
              L9_10 = waitSeconds
              L9_10(1)
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", "stay", false)
              L9_10 = waitSeconds
              L9_10(1)
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.greet, false)
              L9_10 = Fn_fadein
              L9_10()
              L9_10 = waitSeconds
              L9_10(2)
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.aud_sit, true, {animBlendDuration = 0.4})
              L9_10 = Fn_playMotionNpc
              L9_10("people_01", _audience_mot_list.aud_sitstay, false)
              L9_10 = Fn_kaiwaDemoView
              L9_10(L8_9[3])
              L9_10 = waitSeconds
              L9_10(0.5)
            end
          end
        end
      end
    end
    L8_9 = Fn_blackout
    L9_10 = 2
    L8_9(L9_10)
    _night = true
    L8_9 = Fn_setNpcActive
    L9_10 = "people_01"
    L8_9(L9_10, false)
    L8_9 = Fn_setNpcActive
    L9_10 = "xer_01"
    L8_9(L9_10, false)
    L8_9 = Fn_setNpcActive
    L9_10 = "kai_01"
    L8_9(L9_10, false)
    L8_9 = Fn_warpNpc
    L9_10 = "jiju_01"
    L8_9(L9_10, "locator2_jiju_wait")
    L8_9 = waitSeconds
    L9_10 = 1
    L8_9(L9_10)
    L8_9 = Fn_playMotionNpc
    L9_10 = "people_01"
    L8_9(L9_10, "stay", false)
    L8_9 = Fn_moveNpc
    L9_10 = "jiju_01"
    L8_9 = L8_9(L9_10, {
      "locator2_people_pos_01"
    }, {runLength = 100, arrivedLength = 0})
    L9_10 = Fn_pcSensorOff
    L9_10("pccubesensor2_hully_01")
    L9_10 = Fn_fadein
    L9_10()
    while true do
      L9_10 = L8_9.isRunning
      L9_10 = L9_10(L8_9)
      if L9_10 then
        L9_10 = wait
        L9_10()
      end
    end
    L9_10 = wait
    L9_10()
    L9_10 = Fn_playMotionNpc
    L9_10("jiju_01", _jiju_mot_list.greet, false)
    L9_10 = waitSeconds
    L9_10(2.8)
    L9_10 = Fn_kaiwaDemoView
    L9_10("ep22_00215k")
    L9_10 = waitSeconds
    L9_10(0.5)
    L9_10 = Fn_blackout
    L9_10(2)
    L9_10 = _sdemo
    L9_10 = L9_10.stop
    L9_10(L9_10, 0)
    L9_10 = Fn_resetPcPos
    L9_10("locator2_back_to_room_01")
    L9_10 = Fn_setNpcActive
    L9_10("kai_01", false)
    L9_10 = Fn_setNpcActive
    L9_10("xer_01", false)
    L9_10 = Fn_setNpcActive
    L9_10("sentinel_01", false)
    L9_10 = Fn_setNpcActive
    L9_10("sentinel_02", false)
    L9_10 = Fn_setNpcActive
    L9_10("jiju_01", false)
    L9_10 = Fn_setNpcActive
    L9_10("jiju_02", false)
    L9_10 = Fn_pcSensorOn
    L9_10("pccubesensor2_bed_01")
    L9_10 = Fn_pcSensorOn
    L9_10("pccubesensor2_door_01")
    L9_10 = Fn_pcSensorOff
    L9_10("pccubesensormulti2_sentinel_secret_talk_area_01")
    L9_10 = Fn_pcSensorOff
    L9_10("pccubesensor2_stop_sentinel_secret_talk_area_01")
    _door1_move_permission = false
    _door1_rot_l = 90
    _door1_rot_r = 90
    L9_10 = _open_window_next_night
    if L9_10 then
      L9_10 = _story_flag
      L9_10 = L9_10[5]
      if L9_10 == false then
        L9_10 = Fn_pcSensorOn
        L9_10("pccubesensor2_window_01")
        L9_10 = _win_l
        L9_10 = L9_10.setRot
        L9_10(L9_10, XYZRotQuaternionEular(0, -80, 0))
        L9_10 = _win_r
        L9_10 = L9_10.setRot
        L9_10(L9_10, XYZRotQuaternionEular(0, -120, 0))
        L9_10 = _win_l
        L9_10 = L9_10.setForceMove
        L9_10(L9_10)
        L9_10 = _win_r
        L9_10 = L9_10.setForceMove
        L9_10(L9_10)
        L9_10 = Wind
        L9_10 = L9_10.setWind
        L9_10(L9_10)
        L9_10 = Fn_createEffect
        L9_10 = L9_10("ef_ev_lgtpar_03", "ef_ev_lgtpar_03", "locator2_key_01", true)
        _key_eff_hdl = L9_10
        L9_10 = print
        L9_10("\226\152\133\231\170\147\233\150\139\227\129\143\239\188\134\233\141\181\231\153\187\229\160\180\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
        _is_window_open = true
        _open_window_next_night = false
      end
    end
    L9_10 = _day_cnt
    if L9_10 >= 4 then
      L9_10 = _story_flag
      L9_10 = L9_10[5]
      if L9_10 == false then
        L9_10 = Fn_pcSensorOn
        L9_10("pccubesensor2_window_01")
        L9_10 = _win_l
        L9_10 = L9_10.setRot
        L9_10(L9_10, XYZRotQuaternionEular(0, -80, 0))
        L9_10 = _win_r
        L9_10 = L9_10.setRot
        L9_10(L9_10, XYZRotQuaternionEular(0, -120, 0))
        L9_10 = _win_l
        L9_10 = L9_10.setForceMove
        L9_10(L9_10)
        L9_10 = _win_r
        L9_10 = L9_10.setForceMove
        L9_10(L9_10)
        L9_10 = Wind
        L9_10 = L9_10.setWind
        L9_10(L9_10)
        L9_10 = _key_eff_hdl
        if L9_10 == nil then
          L9_10 = Fn_createEffect
          L9_10 = L9_10("ef_ev_lgtpar_03", "ef_ev_lgtpar_03", "locator2_key_01", true)
          _key_eff_hdl = L9_10
        end
        L9_10 = _story_flag
        L9_10[4] = true
        _is_window_open = true
      end
    end
    L9_10 = Mv_safeTaskAbort
    L9_10 = L9_10(_kai_event)
    _kai_event = L9_10
    L9_10 = Mv_safeTaskAbort
    L9_10 = L9_10(_xero_event)
    _xero_event = L9_10
    L9_10 = Mv_safeTaskAbort
    L9_10(_sill_event)
    L9_10 = Mv_safeTaskAbort
    L9_10(_sentinel_secret_talk_task)
    L9_10 = Mv_safeTaskAbort
    L9_10(_sentinel_sensor_leave_task)
    L9_10 = Mv_safeTaskAbort
    L9_10(_sentinel01_motion)
    L9_10 = Mv_safeTaskAbort
    L9_10(_sentinel02_motion)
    L9_10 = Fn_playMotionNpc
    L9_10("sentinel_01", "stay", false)
    L9_10 = Fn_playMotionNpc
    L9_10("sentinel_02", "stay", false)
    L9_10 = Fn_switchDayAndNight
    L9_10(false)
    L9_10 = print
    L9_10("\229\164\156\227\129\171\227\129\151\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
    L9_10 = waitSeconds
    L9_10(2)
    L9_10 = Fn_fadein
    L9_10(2)
    L9_10 = Fn_userCtrlOn
    L9_10()
    L9_10 = waitSeconds
    L9_10(1)
    L9_10 = _day_cnt
    if L9_10 == 1 then
      L9_10 = Fn_captionView
      L9_10("ep22_00166")
      L9_10 = waitSeconds
      L9_10(1)
      L9_10 = Mv_viewObj
      L9_10 = L9_10("pccubesensor2_bed_01")
      waitSeconds(2)
      L9_10 = Mv_safeTaskAbort(L9_10)
    end
    L9_10 = _story_flag
    L9_10 = L9_10[4]
    if L9_10 then
      L9_10 = _story_flag
      L9_10 = L9_10[5]
      if L9_10 == false then
        L9_10 = _open_window_next_night
        if L9_10 == false then
          L9_10 = Sound
          L9_10 = L9_10.playSE
          L9_10(L9_10, "ala_020")
          L9_10 = Fn_captionView
          L9_10("ep22_00100")
        end
      end
    end
    L9_10 = Mv_waitPhase
    L9_10()
    L9_10 = Fn_pcSensorOff
    L9_10("pccubesensor2_bed_01")
    L9_10 = Fn_userCtrlOff
    L9_10()
    L9_10 = Fn_blackout
    L9_10()
    L9_10 = {}
    L9_10[1] = "ep22_00146"
    L9_10[2] = "ep22_00103"
    L9_10[3] = "ep22_00104"
    L9_10[4] = "ep22_00105"
    L9_10[5] = "ep22_00106"
    L9_10[6] = "ep22_00107"
    L9_10[7] = "ep22_00108"
    if not _story_flag[8] then
      if _day_cnt == 1 then
        Sound:pulse("ala_017")
        Fn_captionViewWait(L9_10[1], 3, 3, Font.kLayerFront)
      elseif _day_cnt == 2 then
        if not _story_flag[4] and not _story_flag[5] then
          Sound:pulse("ala_018")
          if _story_flag[4] then
            Fn_captionViewWait(L9_10[3], 3, 3, Font.kLayerFront)
          else
            Fn_captionViewWait(L9_10[2], 3, 3, Font.kLayerFront)
          end
        elseif not _story_flag[5] then
          Sound:pulse("ala_017")
          Fn_captionViewWait(L9_10[3], 3, 3, Font.kLayerFront)
        else
          Sound:pulse("ala_018")
          Fn_captionViewWait(L9_10[4], 3, 3, Font.kLayerFront)
        end
      elseif _day_cnt >= 3 then
        if not _story_flag[4] and not _story_flag[5] then
          Sound:pulse("ala_018")
          if _story_flag[4] then
            Fn_captionViewWait(L9_10[3], 3, 3, Font.kLayerFront)
          else
            Fn_captionViewWait(L9_10[2], 3, 3, Font.kLayerFront)
          end
        elseif not _story_flag[5] then
          Sound:pulse("ala_017")
          if _story_flag[10] == true then
            Fn_captionViewWait(L9_10[3], 3, 3, Font.kLayerFront)
          else
            Fn_captionViewWait(L9_10[2], 3, 3, Font.kLayerFront)
          end
        elseif not _story_flag[6] then
          Sound:pulse("ala_018")
          Fn_captionViewWait(L9_10[4], 3, 3, Font.kLayerFront)
        elseif not _story_flag[3] then
          Sound:pulse("ala_018")
          Fn_captionViewWait(L9_10[5], 3, 3, Font.kLayerFront)
        elseif not _story_flag[7] then
          Sound:pulse("ala_019")
          Fn_captionViewWait(L9_10[6], 3, 3, Font.kLayerFront)
        elseif not _story_flag[8] then
          Sound:pulse("ala_019")
          Fn_captionViewWait(L9_10[7], 3, 3, Font.kLayerFront)
        end
      end
    end
    _night = false
    _day_cnt = _day_cnt + 1
    _time_cnt = 0
    _sel_stop = 0
    _crate_cap_wait = TIME_LIMIT
    _crate_cap_wait2 = 0
    _mes_count = 0
    _mes_count2 = 0
    _npc_mes_count = 0
    _talk_end = false
    _in_secret_talk_area = false
    _secret_cap_end = false
    _once_shill_react = false
    _shill_talk_permission = true
    if _story_flag[8] == false then
      Fn_setNpcActive("jiju_01", true)
      Fn_setNpcActive("jiju_02", true)
      Fn_resetPcPos("locator2_pc_restart")
      Fn_warpNpc("jiju_01", "locator2_jiju_01_01")
      Fn_warpNpc("jiju_02", "locator2_jiju_02")
      Fn_warpNpc("sentinel_01", "locator2_sentinel_01")
      Fn_warpNpc("sentinel_02", "locator2_sentinel_02")
      Fn_setNpcActive("sentinel_01", true)
      Fn_setNpcActive("sentinel_02", true)
    end
    if _day_cnt == 2 then
      _kai_flag = true
      _xero_flag = false
      Fn_setNpcActive("jiju_day2", true)
      Fn_setNpcActive("shill_day2_01", true)
      Fn_setNpcActive("shill_day2_02", true)
      kai_talking()
      Fn_turnNpc("kai_01", _puppet_tbl.jiju_day2)
      _kai_motion = Fn_playLoopMotionRand("kai_01", {"talk_00", "talk_01"}, 4, 8)
      _jijuday2_motion = Fn_playLoopMotionRand("jiju_day2", {"talk_01", "talk_02"}, 5, 7)
      Fn_pcSensorOn("pccubesensor2_shill_move_day2_01")
      _door1_move_permission = false
      _door1_rot_l = 220
      _door1_rot_r = -40
    elseif _day_cnt == 3 then
      _kai_flag = false
      _xero_flag = false
      Fn_setNpcActive("shill_day3_01", true)
      Fn_setNpcActive("shill_day3_02", true)
      Fn_pcSensorOn("pccubesensor2_enter_crossroads_01")
      Fn_warpNpc("sentinel_01", "locator2_sentinel_out_01")
      Fn_warpNpc("sentinel_02", "locator2_sentinel_02_out_01")
    end
    if _day_cnt ~= 3 then
      Fn_pcSensorOn("pccubesensormulti2_sentinel_secret_talk_area_01")
      Fn_pcSensorOn("pccubesensor2_stop_sentinel_secret_talk_area_01")
      _sentinel01_motion = Fn_repeatPlayMotion("sentinel_01", _man66_mot_list.talk_to_r, {
        _man66_mot_list.talk_to_r
      })
      _sentinel02_motion = Fn_repeatPlayMotion("sentinel_02", _man66_mot_list.talk_to_l, {
        _man66_mot_list.talk_to_l
      })
      print("3\230\151\165\231\155\174\228\187\165\229\164\150\227\129\170\227\129\174\227\129\167\227\128\129\232\166\139\229\188\181\227\130\138\229\134\133\231\183\146\232\169\177\227\130\187\227\131\179\227\130\181\227\131\188\239\188\134\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179ON\239\188\129\239\188\129")
    end
    if _is_window_open and _story_flag[5] then
      _win_l:setRot(XYZRotQuaternionEular(0, -90, 0))
      _win_r:setRot(XYZRotQuaternionEular(0, -90, 0))
      _win_l:setForceMove()
      _win_r:setForceMove()
      print("\229\175\157\227\129\166\227\129\132\227\130\139\233\150\147\227\129\171\231\170\147\227\130\146\233\150\137\227\129\152\227\129\190\227\129\151\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
      _is_window_open = false
      Wind:setIntensity(0)
    end
    Fn_setNpcActive("kai_01", _kai_flag)
    Fn_setNpcActive("xer_01", _xero_flag)
    print("Fn_setNpcActive\229\174\159\232\161\140\239\188\154\227\130\171\227\130\164")
    waitSeconds(1)
  until _story_flag[8] == true
  L8_9 = _story_flag
  L9_10 = 9
  L8_9[L9_10] = true
  L8_9 = Mv_safeTaskAbort
  L9_10 = _sentinel01_motion
  L8_9 = L8_9(L9_10)
  _sentinel01_motion = L8_9
  L8_9 = Mv_safeTaskAbort
  L9_10 = _sentinel02_motion
  L8_9 = L8_9(L9_10)
  _sentinel02_motion = L8_9
  L8_9 = Fn_setNpcActive
  L9_10 = "kai_01"
  L8_9(L9_10, false)
  L8_9 = Fn_setNpcActive
  L9_10 = "xer_01"
  L8_9(L9_10, false)
  L8_9 = Fn_setNpcActive
  L9_10 = "jiju_01"
  L8_9(L9_10, false)
  L8_9 = Fn_setNpcActive
  L9_10 = "shill_day4_01"
  L8_9(L9_10, false)
  L8_9 = Fn_setNpcActive
  L9_10 = "shill_day4_02"
  L8_9(L9_10, false)
  L8_9 = _musicbox_01
  L9_10 = L8_9
  L8_9 = L8_9.setVisible
  L8_9(L9_10, false)
  L8_9 = nil
  _musicbox_01 = L8_9
  L8_9 = _chair
  L9_10 = L8_9
  L8_9 = L8_9.setCollidablePermission
  L8_9(L9_10, true)
  L8_9 = "Fn_setKeepPlayerPos"
  L8_9 = _ENV[L8_9]
  L8_9()
  L8_9 = "Fn_setNextMissionFlag"
  L8_9 = _ENV[L8_9]
  L8_9()
  L8_9 = "Fn_nextMission"
  L8_9 = _ENV[L8_9]
  L8_9()
  L8_9 = "Fn_exitSandbox"
  L8_9 = _ENV[L8_9]
  L8_9()
end
function Finalize()
  Wind:setWind()
  Fn_disappearNpc("throne_wom01")
  Fn_disappearNpc("throne_wom02")
  Fn_disableCostumeChange(false)
  if Fn_getPlayer() then
    Player:setAbility(Player.kAbility_TalismanEffect, true)
    Player:setAbility(Player.kAbility_FirstPersonView, true)
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
  HUD:enablePhotoMode(true)
end
function pccubesensor2_bookshelf_01_OnEnter()
  local L0_11
  L0_11 = {}
  L0_11.RL = {
    id = "ui_event_guide_05",
    func = yes_func_book_01
  }
  Fn_gestureAction(L0_11)
  _obj_check_number = OBJ_NUM.BOOK01
end
function pccubesensor2_bookshelf_02_OnEnter()
  local L0_12
  L0_12 = print
  L0_12("\230\156\172\230\163\154ON")
  L0_12 = {}
  L0_12.RL = {
    id = "ui_event_guide_05",
    func = yes_func_book_02
  }
  Fn_gestureAction(L0_12)
  _obj_check_number = OBJ_NUM.BOOK02
end
function pccubesensor2_bookshelf_03_OnEnter()
  local L0_13
  L0_13 = {}
  L0_13.RL = {
    id = "ui_event_guide_05",
    func = yes_func_book_03
  }
  Fn_gestureAction(L0_13)
  _obj_check_number = OBJ_NUM.BOOK03
end
function pccubesensor2_bookshelf_01_OnLeave()
  Mv_safeTaskAbort(_dialog_cap_task)
  Fn_gestureActionCancel()
  _obj_check_number = OBJ_NUM.NIL
end
function pccubesensor2_bookshelf_02_OnLeave()
  print("\230\156\172\230\163\154OFFFF")
  Fn_gestureActionCancel()
  _obj_check_number = OBJ_NUM.NIL
end
function pccubesensor2_bookshelf_03_OnLeave()
  Fn_gestureActionCancel()
  _obj_check_number = OBJ_NUM.NIL
end
function yes_func_book_01()
  if _day_cnt == 1 then
    _dialog_cap_task = invokeTask(function()
      Fn_gestureActionCancel()
      Fn_captionView("ep22_00147")
      waitSeconds(3)
      if _obj_check_number == OBJ_NUM.BOOK01 then
        pccubesensor2_bookshelf_01_OnEnter()
      end
    end)
  elseif _day_cnt > 1 then
    Fn_kaiwaDemoView("ep22_00268k")
    if _story_flag[4] == false then
      Fn_pcSensorOn("pccubesensor2_window_01")
      _open_window_next_night = true
      print("\226\152\133_open_window_next_night = true!!!!!!")
      _story_flag[4] = true
    end
    Fn_gestureActionCancel()
    if _obj_check_number == OBJ_NUM.BOOK01 then
      pccubesensor2_bookshelf_01_OnEnter()
    end
  end
end
function yes_func_book_02()
  print("\230\156\172\230\163\154")
  if _day_cnt < 3 then
    Fn_kaiwaDemoView("ep22_00264k")
  else
    Fn_kaiwaDemoView("ep22_00265k")
    _story_flag[11] = true
  end
  Fn_gestureActionCancel()
  if _obj_check_number == OBJ_NUM.BOOK02 then
    pccubesensor2_bookshelf_02_OnEnter()
  end
end
function yes_func_book_03()
  if _story_flag[8] then
    Fn_kaiwaDemoView("ep22_00272k")
  elseif _story_flag[3] and _story_flag[6] then
    Fn_kaiwaDemoView("ep22_00267k")
    _story_flag[7] = true
  else
    Fn_kaiwaDemoView("ep22_00266k")
    _story_flag[3] = true
  end
  Fn_gestureActionCancel()
  if _obj_check_number == OBJ_NUM.BOOK03 then
    pccubesensor2_bookshelf_03_OnEnter()
  end
end
function pccubesensor2_mirror_OnEnter()
  local L0_14
  L0_14 = {}
  L0_14.RL = {
    id = "ui_event_guide_06",
    func = yes_func_mirror
  }
  Fn_gestureAction(L0_14)
end
function pccubesensor2_mirror_OnLeave()
  Fn_gestureActionCancel()
end
function yes_func_mirror()
  Fn_kaiwaDemoView("ep22_00269k")
  Fn_pcSensorOff("pccubesensor2_mirror_01")
end
function pccubesensor2_window_01_OnEnter()
  local L0_15
  L0_15 = {}
  L0_15.RL = {
    id = "ui_event_guide_07",
    func = yes_func_w
  }
  Fn_gestureAction(L0_15)
  _obj_check_number = OBJ_NUM.WINDOW
end
function pccubesensor2_window_01_OnLeave()
  Fn_gestureActionCancel()
  _obj_check_number = OBJ_NUM.NIL
end
function yes_func_w()
  Fn_gestureActionCancel()
  if not _night then
    Fn_kaiwaDemoView("ep22_00260k")
    _story_flag[10] = true
    if _obj_check_number == OBJ_NUM.WINDOW then
      pccubesensor2_window_01_OnEnter()
    end
  elseif _night and _is_window_open == false then
    Fn_kaiwaDemoView("ep22_00273k")
    _story_flag[10] = true
    if _obj_check_number == OBJ_NUM.WINDOW then
      pccubesensor2_window_01_OnEnter()
    end
  elseif _night and _is_window_open then
    Fn_kaiwaDemoView("ep22_00261k")
    Fn_pcSensorOff("pccubesensor2_window_01")
    _key_eff_hdl = Mv_safeObjectKill(_key_eff_hdl)
    _story_flag[5] = true
  end
end
function pccubesensor2_desk_01_OnEnter()
  local L0_16, L1_17, L2_18
  L0_16, L1_17 = nil, nil
  L2_18 = _story_flag
  L2_18 = L2_18[7]
  if L2_18 then
    L2_18 = _story_flag
    L2_18 = L2_18[8]
    if L2_18 == false then
      L0_16 = "ui_event_guide_16"
      L1_17 = yes_func_desk
    end
  else
    L2_18 = _story_flag
    L2_18 = L2_18[8]
    if L2_18 then
      L0_16 = "ui_event_guide_14"
      L1_17 = yes_func_music
    else
      L0_16 = "ui_event_guide_15"
      L1_17 = yes_func_diary
    end
  end
  L2_18 = {}
  L2_18.RL = {id = L0_16, func = L1_17}
  Fn_gestureAction(L2_18)
  _obj_check_number = OBJ_NUM.DESK
end
function pccubesensor2_desk_01_OnLeave()
  Fn_gestureActionCancel()
  _obj_check_number = OBJ_NUM.NIL
end
function yes_func_diary()
  if _day_cnt == 1 then
    Fn_kaiwaDemoView("ep22_00290k")
  elseif _day_cnt == 2 then
    Fn_kaiwaDemoView("ep22_00291k")
  elseif _day_cnt == 3 then
    Fn_kaiwaDemoView("ep22_00292k")
  elseif _day_cnt == 4 then
    Fn_kaiwaDemoView("ep22_00293k")
  elseif _day_cnt == 5 then
    Fn_kaiwaDemoView("ep22_00294k")
  elseif _day_cnt == 6 then
    Fn_kaiwaDemoView("ep22_00295k")
  elseif _day_cnt == 7 then
    Fn_kaiwaDemoView("ep22_00296k")
  else
    Fn_kaiwaDemoView("ep22_00297k")
  end
  Fn_gestureActionCancel()
  if _obj_check_number == OBJ_NUM.DESK then
    pccubesensor2_desk_01_OnEnter()
  end
end
function yes_func_desk()
  invokeTask(function()
    Fn_kaiwaDemoView("ep22_00262k")
    _story_flag[8] = true
    Fn_gestureActionCancel()
    Fn_userCtrlOff()
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    Fn_blackout()
    _musicbox_01:setVisible(true)
    print("\227\130\170\227\131\171\227\130\180\227\131\188\227\131\171\232\161\168\231\164\186\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
    Fn_fadein()
    Fn_userCtrlOn()
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
    if _obj_check_number == OBJ_NUM.DESK then
      pccubesensor2_desk_01_OnEnter()
    end
  end)
end
function yes_func_music()
  Fn_kaiwaDemoView("ep22_00263k")
  Fn_gestureActionCancel()
  if _obj_check_number == OBJ_NUM.DESK then
    pccubesensor2_desk_01_OnEnter()
  end
end
function pccubesensor2_bed_01_OnEnter()
  local L0_19
  L0_19 = {}
  L0_19.RL = {
    id = "ui_event_guide_08",
    func = yes_func_e
  }
  Fn_gestureAction(L0_19)
end
function pccubesensor2_bed_01_OnLeave()
  Fn_gestureActionCancel()
end
function yes_func_e()
  Mv_gotoNextPhase()
  Fn_gestureActionCancel()
end
function pccubesensor2_door_01_OnEnter()
  local L0_20
  L0_20 = {}
  L0_20.RL = {
    id = "ui_event_guide_09",
    func = yes_func_door
  }
  Fn_gestureAction(L0_20)
  _obj_check_number = OBJ_NUM.DOOR
end
function pccubesensor2_door_01_OnLeave()
  Mv_safeTaskAbort(_dialog_cap_task)
  Fn_gestureActionCancel()
  _obj_check_number = OBJ_NUM.NIL
end
function yes_func_door()
  _dialog_cap_task = invokeTask(function()
    Fn_gestureActionCancel()
    if _story_flag[5] and _story_flag[8] == false then
      Fn_captionView("ep22_00109")
    else
      Fn_captionView("ep22_00110")
    end
    waitSeconds(3)
    if _obj_check_number == OBJ_NUM.DOOR then
      pccubesensor2_door_01_OnEnter()
    end
  end)
end
function pccubesensor2_hully_01_OnEnter()
  _cap_flag = false
  jiju_Hurry()
end
function pccubesensor2_hully_01_OnLeave()
  _cap_flag = true
  Mv_safeTaskAbort(_jiju_talk)
  print("\228\190\141\229\190\147\227\129\174\227\129\155\227\129\139\227\129\151\227\130\191\227\130\185\227\130\175\231\181\130\228\186\134")
end
function pccubesensor2_sentinel_01_OnEnter()
  _cap_flag = false
  if _day_cnt == 3 and _prison_door == false and _once_prison_call_happened == false then
    invokeTask(function()
      local L0_21, L1_22
      _once_prison_call_happened = true
      L0_21 = Fn_isInSightTarget
      L1_22 = "locator2_prison_01"
      L0_21 = L0_21(L1_22, 0.5)
      if L0_21 then
      else
        L0_21 = waitSeconds
        L1_22 = 0.5
        L0_21(L1_22)
        while true do
          L0_21 = Fn_isInSightTarget
          L1_22 = "locator2_prison_01"
          L0_21 = L0_21(L1_22, 0.5)
          if not L0_21 then
            L0_21 = wait
            L0_21()
            L0_21 = HUD
            L1_22 = L0_21
            L0_21 = L0_21.setPhotoMode
            L0_21(L1_22, false)
            L0_21 = Player
            L1_22 = L0_21
            L0_21 = L0_21.setAbility
            L0_21(L1_22, Player.kAbility_FirstPersonView, false)
            L0_21 = Fn_userCtrlAllOff
            L0_21()
            L0_21 = Camera
            L1_22 = L0_21
            L0_21 = L0_21.lookTo
            L0_21(L1_22, findGameObject2("Node", "locator2_prison_01"):getWorldPos(), 2, 1)
            L0_21 = waitSeconds
            L1_22 = 1
            L0_21(L1_22)
          end
        end
      end
      L0_21 = Fn_warpNpc
      L1_22 = "sentinel_01"
      L0_21(L1_22, "locator2_sentinel_out_move_end_01")
      L0_21 = Fn_findNpc
      L1_22 = "sentinel_01"
      L0_21 = L0_21(L1_22)
      L1_22 = L0_21
      L0_21 = L0_21.pauseMove
      L0_21(L1_22, true)
      L0_21 = print
      L1_22 = "\227\130\171\227\131\161\227\131\169\227\129\171\229\133\165\227\130\139"
      L0_21(L1_22)
      L0_21 = Fn_userCtrlAllOff
      L0_21()
      L0_21 = Camera
      L1_22 = L0_21
      L0_21 = L0_21.setControl
      L0_21(L1_22, Camera.kPlayer, Camera.kControl_All, false)
      L0_21 = Fn_setNpcActive
      L1_22 = "sentinel_01"
      L0_21(L1_22, true)
      L0_21 = wait
      L0_21()
      L0_21 = Fn_playMotionNpc
      L1_22 = "sentinel_01"
      L0_21(L1_22, "talk_00", false)
      L0_21 = Sound
      L1_22 = L0_21
      L0_21 = L0_21.playSE
      L0_21(L1_22, "m41_004", 1, "", _puppet_tbl.sentinel_01)
      L0_21 = Fn_captionView
      L1_22 = "ep22_00111"
      L0_21(L1_22)
      L0_21 = Mv_safeTaskAbort
      L1_22 = _door_view
      L0_21 = L0_21(L1_22)
      _door_view = L0_21
      L0_21 = Fn_pcSensorOff
      L1_22 = "pccubesensor2_door_view_01"
      L0_21(L1_22)
      L0_21 = Fn_pcSensorOff
      L1_22 = "pccubesensor2_door_view_02"
      L0_21(L1_22)
      L0_21 = waitSeconds
      L1_22 = 1
      L0_21(L1_22)
      L0_21 = Fn_findNpc
      L1_22 = "sentinel_01"
      L0_21 = L0_21(L1_22)
      L1_22 = L0_21
      L0_21 = L0_21.pauseMove
      L0_21(L1_22, true)
      L0_21 = findGameObject2
      L1_22 = "Node"
      L0_21 = L0_21(L1_22, "locator2_sentinel_out_05")
      L1_22 = Player
      L1_22 = L1_22.setLookAtIk
      L1_22(L1_22, true, 1, L0_21:getWorldPos())
      L1_22 = waitSeconds
      L1_22(1)
      L1_22 = Player
      L1_22 = L1_22.setLookAtIk
      L1_22(L1_22, false, 1, L0_21:getWorldPos())
      L1_22 = Mv_viewObjWait
      L1_22 = L1_22(_puppet_tbl.sentinel_01, 0.6, 0.6)
      L1_22 = Mv_safeTaskAbort(L1_22)
      waitSeconds(1)
      waitSeconds(1)
      Fn_kaiwaDemoView("ep22_00271k")
      Fn_userCtrlOn()
      HUD:enablePhotoMode(true)
      Player:setAbility(Player.kAbility_FirstPersonView, true)
      Fn_findNpc("sentinel_01"):pauseMove(false)
      while Fn_moveNpc("sentinel_01", {
        "locator2_sentinel_day3_move_01",
        "locator2_sentinel_day3_move_02",
        "locator2_sentinel_day3_move_03",
        "locator2_sentinel_01"
      }, {runLength = 1000, arrivedLength = 0}):isRunning() do
        wait()
      end
      wait()
      Fn_turnNpc("sentinel_01", "pccubesensor2_enter_crossroads_01")
      Fn_playMotionNpc("sentinel_01", _man66_mot_list.stay_gate, true)
      waitSeconds(1)
      _prison_door = true
    end)
  elseif _day_cnt == 3 and _prison_door then
    invokeTask(function()
      Sound:playSE("m41_005", 1, "", _puppet_tbl.sentinel_01)
      Fn_captionView("ep22_00112")
    end)
  else
    sentinel_talk = invokeTask(function()
      repeat
        waitSeconds(1)
        _crate_cap_wait2 = _crate_cap_wait2 - 1
        if _crate_cap_wait2 <= 0 then
          _switch[0] = function()
            Sound:playSE("m41_005", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00113")
          end
          _switch[1] = function()
            Sound:playSE("m41_005", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00114")
          end
          _switch[2] = function()
            Fn_captionView("ep22_00148")
            _mes_count2 = -1
          end
          _switch[_mes_count2]()
          _mes_count2 = _mes_count2 + 1
          _crate_cap_wait2 = 30
        end
      until _cap_flag == true
    end)
  end
end
function pccubesensor2_sentinel_01_OnLeave()
  _cap_flag = true
  Mv_safeTaskAbort(sentinel_talk)
end
function pccubesensor2_open_audience_01_OnEnter()
  Fn_setNpcActive("throne_wom01", true)
  Fn_setNpcActive("throne_wom02", true)
  Fn_pcSensorOff("pccubesensor2_open_audience_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_Audience_01_OnEnter()
  if _day_cnt == 1 then
    if _day_one_task == nil then
      _day_one_task = invokeTask(function()
        local L0_23
        L0_23 = Fn_pcSensorOn
        L0_23("pccubesensor2_throne_greeting_01")
        L0_23 = Fn_setNpcActive
        L0_23("throne_man01", true)
        L0_23 = Fn_setNpcActive
        L0_23("throne_man02", true)
        L0_23 = Fn_playMotionNpc
        L0_23("throne_man01", _man66_mot_list.stay_gate, false)
        L0_23 = Fn_playMotionNpc
        L0_23("throne_man02", _man66_mot_list.stay_gate, false)
        L0_23 = _chair
        L0_23 = L0_23.setCollidablePermission
        L0_23(L0_23, true)
        L0_23 = invokeTask
        L0_23 = L0_23(function()
          local L0_24
          L0_24 = 0
          while Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_throne_dayone_navi_01"):getWorldPos()) > 2.5 do
            print(L0_24)
            if L0_24 == 45 then
              if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_throne_dayone_navi_01"):getWorldPos()) > 2.5 then
                Fn_naviSet(findGameObject2("Node", "locator2_throne_dayone_navi_01"))
              end
              break
            end
            waitSeconds(1)
            L0_24 = L0_24 + 1
          end
        end)
        while Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_throne_dayone_navi_01"):getWorldPos()) > 2.5 do
          wait()
        end
        L0_23 = Mv_safeTaskAbort(L0_23)
        Fn_naviKill()
        Mv_gotoNextPhase()
      end)
    end
  else
    Mv_gotoNextPhase()
  end
end
function pccubesensor2_throne_greeting_01_OnEnter(A0_25)
  local L1_26
  L1_26 = {}
  L1_26.animBlendDuration = 0.5
  L1_26.isStop = true
  Fn_pcSensorOff(A0_25)
  invokeTask(function()
    Fn_turnNpc("throne_wom01")
    Fn_playMotionNpc("throne_wom01", "wom33_greet_00", true, L1_26)
    Fn_turnNpc("throne_wom01", "locator2_throne_maid_turn_01")
    Fn_playMotionNpc("throne_wom01", "stay", false)
  end)
  invokeTask(function()
    waitSeconds(0.1)
    Fn_turnNpc("throne_wom02")
    waitSeconds(0.3)
    Fn_playMotionNpc("throne_wom02", "wom33_greet_00", true, L1_26)
    Fn_turnNpc("throne_wom02", "locator2_throne_maid_turn_02")
    Fn_playMotionNpc("throne_wom02", "stay", false)
  end)
end
function kai_talking()
  _kai_event = invokeTask(function()
    local L0_27
    while true do
      L0_27 = Fn_getDistanceToPlayer
      L0_27 = L0_27(_puppet_tbl.kai_01)
      if L0_27 <= FOUND_DISTANCE then
        L0_27 = _story_flag
        L0_27 = L0_27[1]
        if L0_27 == false then
          L0_27 = _kai_flag
          if L0_27 == true then
            L0_27 = _story_flag
            L0_27[1] = true
            L0_27 = Fn_userCtrlAllOff
            L0_27()
            L0_27 = Mv_viewObjWait
            L0_27 = L0_27(_puppet_tbl.kai_01, 0.5, 1.3)
            waitSeconds(0.5)
            Fn_kaiwaDemoView("ep22_00221k")
            L0_27 = Mv_safeTaskAbort(L0_27)
            Fn_pcSensorOn("pccubesensor2_talk_area_01")
            Fn_userCtrlOn()
          end
        end
      end
      L0_27 = _night
      if L0_27 then
        L0_27 = Mv_safeTaskAbort
        L0_27 = L0_27(_kai_jiju_talk_task)
        _kai_jiju_talk_task = L0_27
        L0_27 = Mv_safeTaskAbort
        L0_27(_sensor_leave_task)
        L0_27 = print
        L0_27("\229\164\156\227\129\170\227\129\174\227\129\167\227\128\128_kai_jiju_talk_task: abort, nil")
        L0_27 = Fn_pcSensorOff
        L0_27("pccubesensor2_talk_area_01")
        L0_27 = Mv_safeTaskAbort
        L0_27(_kai_motion)
        L0_27 = Mv_safeTaskAbort
        L0_27(_jijuday2_motion)
        L0_27 = Fn_playMotionNpc
        L0_27("kai_01", "stay", true)
        L0_27 = Fn_playMotionNpc
        L0_27("jiju_day2", "stay", true)
        L0_27 = print
        L0_27("_kai_event: break!!!!")
        break
      end
      L0_27 = wait
      L0_27()
    end
  end)
end
function pccubesensor2_talk_area_01_OnEnter()
  kaiWithJiju()
end
function pccubesensor2_talk_area_01_OnLeave()
  _talk_permission = true
  _sensor_leave_task = invokeTask(function()
    Sound:stopSEHandle(_voice_hdl)
    Fn_captionViewEnd()
    while _kai_npc:isTurnEnd() == false or _jijuday2_npc:isTurnEnd() == false do
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\226\128\187\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\229\190\133\227\129\161")
      wait()
    end
    Mv_safeTaskAbort(_kai_jiju_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\230\184\136\227\129\160\227\129\139\227\130\137_kai_jiju_talk_task: abort")
    if Mv_isSafeTaskRunning(_kai_motion) == false then
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
      Fn_turnNpc("kai_01", _puppet_tbl.jiju_day2)
      Fn_turnNpc("jiju_day2", _puppet_tbl.kai_01)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
      _kai_motion = Fn_repeatPlayMotion("kai_01", "talk_00", {"talk_00"})
      _jijuday2_motion = Fn_repeatPlayMotion("jiju_day2", "talk_01", {"talk_01"})
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
    end
  end)
end
function kaiWithJiju()
  local L0_28, L1_29, L2_30
  L0_28 = 0
  L1_29 = {}
  L2_30 = false
  if Mv_isSafeTaskRunning(_sensor_leave_task) then
    Mv_safeTaskAbort(_sensor_leave_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_sensor_leave_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_sensor_leave_task:abort!!!!")
  end
  if Mv_isSafeTaskRunning(_kai_jiju_talk_task) then
    Mv_safeTaskAbort(_kai_jiju_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_kai_jiju_talk_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_kai_jiju_talk_task:abort!!!!")
  end
  _kai_jiju_talk_task = invokeTask(function()
    print("_kai_jiju_talk_task: \233\150\139\229\167\139")
    while true do
      if L0_28 == SUSPEND_TALKING_TIME then
        L0_28 = 0
        Fn_captionViewEnd()
        Sound:stopSEHandle(_voice_hdl)
        Mv_safeTaskAbort(_kai_motion)
        Mv_safeTaskAbort(_jijuday2_motion)
        print("\230\179\168\230\132\143\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179abort")
        print("\230\179\168\230\132\143\239\188\154stay")
        Fn_playMotionNpc("kai_01", "stay", false, {animBlendDuration = 0.8})
        Fn_playMotionNpc("jiju_day2", "stay", false, {animBlendDuration = 0.8})
        waitSeconds(1)
        print("\230\179\168\230\132\143\239\188\154stay1\231\167\146\231\181\140\233\129\142")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("kai_01")
        Fn_turnNpc("jiju_day2")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
        _voice_hdl = Sound:playSEHandle("kai_801a", 1, "", _puppet_tbl.kai_01)
        Fn_captionViewWait("ep22_00149")
        Sound:stopSEHandle(_voice_hdl)
        _talk_permission = false
        waitSeconds(1)
      end
      if _talk_permission then
        L1_29[0] = function()
          _voice_hdl = Sound:playSEHandle("kai_901a", 1, "", _puppet_tbl.kai_01)
          Fn_captionViewWait("ep22_00115")
        end
        L1_29[1] = function()
          _voice_hdl = Sound:playSEHandle("w24_006", 1, "", _puppet_tbl.jiju_day2)
          Fn_captionViewWait("ep22_00116")
        end
        L1_29[2] = function()
          _voice_hdl = Sound:playSEHandle("kai_908b", 1, "", _puppet_tbl.kai_01)
          Fn_captionViewWait("ep22_00117")
        end
        L1_29[3] = function()
          _voice_hdl = Sound:playSEHandle("w24_006", 1, "", _puppet_tbl.jiju_day2)
          Fn_captionViewWait("ep22_00118")
          _talk_end = true
        end
        if Mv_isSafeTaskRunning(_kai_motion) == false then
          print("\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
          Fn_turnNpc("kai_01", _puppet_tbl.jiju_day2)
          Fn_turnNpc("jiju_day2", _puppet_tbl.kai_01)
          _kai_motion = Fn_repeatPlayMotion("kai_01", "talk_00", {"talk_00"})
          _jijuday2_motion = Fn_repeatPlayMotion("jiju_day2", "talk_01", {"talk_01"})
        end
        if L2_30 == false and _talk_end == false then
          L2_30 = true
          invokeTask(function()
            Sound:stopSEHandle(_voice_hdl)
            L1_29[_npc_mes_count]()
            L2_30 = false
            _npc_mes_count = _npc_mes_count + 1
          end)
        end
      end
      waitSeconds(1)
      if _talk_permission then
        L0_28 = L0_28 + 1
      end
    end
  end)
end
function pccubesensor2_floor_01_OnEnter()
  local L0_31, L1_32, L2_33
  L0_31 = 0
  L1_32 = findGameObject2
  L2_33 = "Node"
  L1_32 = L1_32(L2_33, "locator2_xero_ray_right_01")
  L2_33 = findGameObject2
  L2_33 = L2_33("Node", "locator2_xero_ray_left_01")
  if Fn_isInSightTarget(L1_32, 2) == false then
    L0_31 = 1
  end
  if Fn_isInSightTarget(L2_33, 2) == false then
    L0_31 = L0_31 + 3
  end
  if L0_31 == 1 then
    _xero_move_locator = "locator2_xero_move_right_01"
  elseif L0_31 == 3 then
    Fn_warpNpc("xer_01", "locator2_xero_left_01")
    _xero_move_locator = "locator2_xero_move_left_01"
  elseif Fn_getDistanceToPlayer(L1_32:getWorldPos()) > Fn_getDistanceToPlayer(L2_33:getWorldPos()) then
    Fn_warpNpc("xer_01", "locator2_xero_left_01")
    _xero_move_locator = "locator2_xero_move_left_01"
  else
    _xero_move_locator = "locator2_xero_move_right_01"
  end
  Fn_setNpcActive("xer_01", true)
  _floor_in = true
  Fn_pcSensorOff("pccubesensor2_floor_01")
end
function pccubesensor2_enter_crossroads_01_OnEnter()
  _enter_crossroads = true
  Fn_pcSensorOff("pccubesensor2_enter_crossroads_01")
end
function prison_accident()
  prison_task = invokeTask(function()
    local L0_34, L1_35, L2_36
    L0_34 = _day_cnt
    if L0_34 == 3 then
      L0_34 = _prison_out
      if L0_34 == false then
        while true do
          L0_34 = _enter_crossroads
          if not L0_34 then
            L0_34 = wait
            L0_34()
          end
        end
        L0_34 = print
        L1_35 = "\229\141\129\229\173\151\232\183\175\227\129\171\229\135\186\227\129\159\227\131\129\227\130\167\227\131\131\227\130\175"
        L0_34(L1_35)
        L0_34 = {
          L1_35,
          L2_36,
          "locator2_sentinel_out_04"
        }
        L1_35 = "locator2_sentinel_out_02"
        L2_36 = "locator2_sentinel_out_03"
        L1_35 = Fn_moveNpc
        L2_36 = "sentinel_01"
        L1_35 = L1_35(L2_36, L0_34, {runLength = 1000, navimesh = false})
        L2_36 = waitSeconds
        L2_36(2)
        L2_36 = Fn_userCtrlAllOff
        L2_36()
        L2_36 = HUD
        L2_36 = L2_36.enablePhotoMode
        L2_36(L2_36, false)
        L2_36 = Player
        L2_36 = L2_36.setAbility
        L2_36(L2_36, Player.kAbility_FirstPersonView, false)
        L2_36 = Fn_lookAtObject
        L2_36 = L2_36("pccubesensor2_sentinel_01")
        while not Fn_isInSightTarget("pccubesensor2_sentinel_01", 0.3) do
          wait()
        end
        L2_36 = Mv_safeTaskAbort(L2_36)
        Fn_captionView("ep22_00119")
        _prison_out = true
        waitSeconds(3)
        Fn_setNpcActive("shill_day3_01", true)
        ShillDay3Move()
        Fn_userCtrlOn()
        HUD:enablePhotoMode(true)
        Player:setAbility(Player.kAbility_FirstPersonView, true)
        invokeTask(function()
          while true do
            if Fn_isInSightTarget(_puppet_tbl.sentinel_01, 1.1) == false and Fn_getDistanceToPlayer(_puppet_tbl.sentinel_01) >= 15 then
              Fn_findNpc("sentinel_01"):pauseMove(true)
              L1_35 = Mv_safeTaskAbort(L1_35)
              _day3_sentinel_talk_task = Mv_safeTaskAbort(_day3_sentinel_talk_task)
              Mv_safeTaskAbort(_sensor_leave_task)
              Mv_safeTaskAbort(_sentinel01_motion)
              Mv_safeTaskAbort(_sentinel02_motion)
              Fn_pcSensorOff("pccubesensor2_day3_sentinel_talk_area_01")
              Fn_setNpcActive("sentinel_01", false)
              Fn_setNpcActive("sentinel_02", false)
              print("sentinel_01\227\129\140\227\130\171\227\131\161\227\131\169\229\164\150\239\188\134\233\129\160\227\129\132\227\129\174\227\129\167\227\128\129sentinel\233\129\148\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\229\129\156\230\173\162\239\188\134\233\157\158\232\161\168\231\164\186\239\188\134_day3_sentinel_talk_task: abort, nil\239\188\129\239\188\129")
              Fn_playMotionNpc("sentinel_01", _man66_mot_list.stay_gate, false)
              Fn_playMotionNpc("sentinel_02", _man66_mot_list.stay_gate, false)
              break
            end
            wait()
          end
        end)
        if L1_35 ~= nil then
          while L1_35 ~= nil do
            if 2 >= Fn_get_distance(_puppet_tbl.sentinel_01:getWorldPos(), _puppet_tbl.sentinel_02:getWorldPos()) then
              L1_35 = Mv_safeTaskAbort(L1_35)
              wait()
              Fn_turnNpc("sentinel_01", _puppet_tbl.sentinel_02)
              Fn_turnNpc("sentinel_02", _puppet_tbl.sentinel_01)
              Mv_safeTaskAbort(_sentinel01_motion)
              Mv_safeTaskAbort(_sentinel02_motion)
              _sentinel01_motion = Fn_repeatPlayMotion("sentinel_01", "talk_00", {"talk_00"})
              _sentinel02_motion = Fn_repeatPlayMotion("sentinel_02", "talk_01", {"talk_01"})
              Fn_pcSensorOn("pccubesensor2_day3_sentinel_talk_area_01")
              print("3\230\151\165\231\155\174\233\150\128\231\149\170\228\188\154\232\169\177\231\175\132\229\155\178\227\130\187\227\131\179\227\130\181\227\131\188ON")
            else
              wait()
            end
          end
        end
      else
      end
    else
    end
  end)
end
function pccubesensor2_day3_sentinel_talk_area_01_OnEnter()
  day3SentinelTalk()
end
function pccubesensor2_day3_sentinel_talk_area_01_OnLeave()
  _talk_permission = true
  _sensor_leave_task = invokeTask(function()
    Sound:stopSEHandle(_voice_hdl)
    Fn_captionViewEnd()
    while Fn_findNpc("sentinel_01"):isTurnEnd() == false or Fn_findNpc("sentinel_02"):isTurnEnd() == false do
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\226\128\187\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\229\190\133\227\129\161")
      wait()
    end
    Mv_safeTaskAbort(_day3_sentinel_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\230\184\136\227\129\160\227\129\139\227\130\137_day3_sentinel_talk_task: abort")
    if Mv_isSafeTaskRunning(_sentinel01_motion) == false then
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
      Fn_turnNpc("sentinel_01", _puppet_tbl.sentinel_02)
      Fn_turnNpc("sentinel_02", _puppet_tbl.sentinel_01)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
      _sentinel01_motion = Fn_repeatPlayMotion("sentinel_01", "talk_00", {"talk_00"})
      _sentinel02_motion = Fn_repeatPlayMotion("sentinel_02", "talk_01", {"talk_01"})
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
    end
  end)
end
function day3SentinelTalk()
  local L0_37, L1_38, L2_39
  L0_37 = print
  L1_38 = "_day3_sentinel_talk_task: \233\150\139\229\167\139"
  L0_37(L1_38)
  L0_37 = 0
  L1_38 = {}
  L2_39 = false
  if Mv_isSafeTaskRunning(_sensor_leave_task) then
    Mv_safeTaskAbort(_sensor_leave_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_sensor_leave_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_sensor_leave_task:abort!!!!")
  end
  if Mv_isSafeTaskRunning(_day3_sentinel_talk_task) then
    Mv_safeTaskAbort(_day3_sentinel_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_day3_sentinel_talk_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_day3_sentinel_talk_task:abort!!!!")
  end
  _day3_sentinel_talk_task = invokeTask(function()
    while true do
      if L0_37 == SUSPEND_TALKING_TIME then
        L0_37 = 0
        Fn_captionViewEnd()
        Sound:stopSEHandle(_voice_hdl)
        Mv_safeTaskAbort(_sentinel01_motion)
        Mv_safeTaskAbort(_sentinel02_motion)
        print("\230\179\168\230\132\143\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179abort")
        print("\230\179\168\230\132\143\239\188\154stay")
        Fn_playMotionNpc("sentinel_01", "stay", false, {animBlendDuration = 0.8})
        Fn_playMotionNpc("sentinel_02", "stay", false, {animBlendDuration = 0.8})
        waitSeconds(1)
        print("\230\179\168\230\132\143\239\188\154stay1\231\167\146\231\181\140\233\129\142")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("sentinel_01")
        Fn_turnNpc("sentinel_02")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
        _voice_hdl = Sound:playSEHandle("m41_801b", 1, "", _puppet_tbl.sentinel_01)
        Fn_captionViewWait("ep22_00150")
        Sound:stopSEHandle(_voice_hdl)
        _talk_permission = false
        waitSeconds(1)
      end
      if _talk_permission then
        L1_38[0] = function()
          _voice_hdl = Sound:playSEHandle("m41_001", 1, "", _puppet_tbl.sentinel_01)
          Fn_captionViewWait("ep22_00151")
        end
        L1_38[1] = function()
          _voice_hdl = Sound:playSEHandle("m42_001", 1, "", _puppet_tbl.sentinel_02)
          Fn_captionViewWait("ep22_00152")
        end
        L1_38[2] = function()
          _voice_hdl = Sound:playSEHandle("m41_002", 1, "", _puppet_tbl.sentinel_01)
          Fn_captionViewWait("ep22_00153")
        end
        L1_38[3] = function()
          _voice_hdl = Sound:playSEHandle("m42_001", 1, "", _puppet_tbl.sentinel_02)
          Fn_captionViewWait("ep22_00154")
          _talk_end = true
        end
        if Mv_isSafeTaskRunning(_sentinel01_motion) == false then
          print("\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
          Fn_turnNpc("sentinel_01", _puppet_tbl.sentinel_02)
          Fn_turnNpc("sentinel_02", _puppet_tbl.sentinel_01)
          _sentinel01_motion = Fn_repeatPlayMotion("sentinel_01", "talk_00", {"talk_00"})
          _sentinel02_motion = Fn_repeatPlayMotion("sentinel_02", "talk_01", {"talk_01"})
        end
        if L2_39 == false and _talk_end == false then
          L2_39 = true
          invokeTask(function()
            Sound:stopSEHandle(_voice_hdl)
            L1_38[_npc_mes_count]()
            L2_39 = false
            _npc_mes_count = _npc_mes_count + 1
          end)
        end
      end
      waitSeconds(1)
      if _talk_permission then
        L0_37 = L0_37 + 1
      end
    end
  end)
end
function xero_talking()
  _xero_event = invokeTask(function()
    local L0_40, L1_41, L2_42, L3_43, L4_44, L5_45
    L0_40 = _xero_flag
    if L0_40 == true then
      L0_40 = _story_flag
      L0_40 = L0_40[2]
      if L0_40 == false then
        while true do
          L0_40 = _floor_in
          if not L0_40 then
            L0_40 = wait
            L0_40()
          end
        end
        _during_xer_event = true
        L0_40 = createGameObject2
        L1_41 = "Node"
        L0_40 = L0_40(L1_41)
        L2_42 = L0_40
        L1_41 = L0_40.setName
        L3_43 = "xero_walk"
        L1_41(L2_42, L3_43)
        L1_41 = Fn_appendToPlayer
        L2_42 = L0_40
        L1_41(L2_42)
        L2_42 = L0_40
        L1_41 = L0_40.setPos
        L3_43 = Vector
        L4_44 = 0
        L5_45 = 0
        L5_45 = L3_43(L4_44, L5_45, 0)
        L1_41(L2_42, L3_43, L4_44, L5_45, L3_43(L4_44, L5_45, 0))
        L2_42 = L0_40
        L1_41 = L0_40.setForceMove
        L1_41(L2_42)
        L1_41 = start_game_obj
        L1_41()
        L1_41 = nil
        L2_42 = Fn_moveNpc
        L3_43 = "xer_01"
        L4_44 = {L5_45, "xero_walk"}
        L5_45 = _xero_move_locator
        L5_45 = {}
        L5_45.arrivedLength = 2
        L2_42 = L2_42(L3_43, L4_44, L5_45)
        L1_41 = L2_42
        L2_42 = print
        L3_43 = "\227\130\173\227\130\187\227\131\173\239\188\154PC\227\129\171\229\144\145\227\129\139\227\129\163\227\129\166\231\167\187\229\139\149\233\150\139\229\167\139"
        L2_42(L3_43)
        L2_42 = nil
        while true do
          L3_43 = _puppet_tbl
          L3_43 = L3_43.xer_01
          L4_44 = L3_43
          L3_43 = L3_43.getWorldPos
          L3_43 = L3_43(L4_44)
          L4_44 = L3_43.y
          L4_44 = L4_44 + 1.5
          L3_43.y = L4_44
          L4_44 = Fn_getPcPosRot
          L5_45 = L4_44()
          L4_44.y = L4_44.y + 1.5
          Query:setEyeSightTransform(L4_44, L5_45)
          Query:setEyeSightAngle(Deg2Rad(60))
          Query:setEyeSightRange(5)
          if not Query:raycastEyeSight(L3_43) and Fn_getDistanceToPlayer(_puppet_tbl.xer_01) < XRO_FOUND_DISTANCE01 then
            waitSeconds(1)
            Camera:lookTo(_puppet_tbl.xer_01:getWorldPos(), 2, 1)
            Fn_userCtrlAllOff()
            break
          end
          wait()
        end
        L3_43 = wait
        L3_43()
        _floor_in = false
        while true do
          L3_43 = Fn_getDistanceToPlayer
          L4_44 = _puppet_tbl
          L4_44 = L4_44.xer_01
          L3_43 = L3_43(L4_44)
          L4_44 = XRO_FOUND_DISTANCE02
          if L3_43 < L4_44 then
            L3_43 = Mv_safeTaskAbort
            L4_44 = L1_41
            L3_43 = L3_43(L4_44)
            L1_41 = L3_43
            break
          end
          L3_43 = wait
          L3_43()
        end
        L3_43 = waitSeconds
        L4_44 = 0.3
        L3_43(L4_44)
        L3_43 = Fn_findNpc
        L4_44 = "xer_01"
        L3_43 = L3_43(L4_44)
        L4_44 = L3_43
        L3_43 = L3_43.turn
        L5_45 = Player
        L5_45 = L5_45.getPuppet
        L5_45 = L5_45(L5_45)
        L3_43(L4_44, L5_45, L5_45(L5_45))
        L3_43 = Sound
        L4_44 = L3_43
        L3_43 = L3_43.playSEHandle
        L5_45 = "xeo_801a"
        L3_43 = L3_43(L4_44, L5_45, 1, "", _puppet_tbl.xer_01)
        _voice_hdl = L3_43
        L3_43 = Player
        L4_44 = L3_43
        L3_43 = L3_43.setLookAtIk
        L5_45 = true
        L3_43(L4_44, L5_45, 1, _puppet_tbl.xer_01:getWorldPos())
        L3_43 = Mv_safeTaskAbort
        L4_44 = L2_42
        L3_43 = L3_43(L4_44)
        L2_42 = L3_43
        L3_43 = Mv_viewObjWait
        L4_44 = _puppet_tbl
        L4_44 = L4_44.xer_01
        L5_45 = 0.6
        L3_43 = L3_43(L4_44, L5_45, 1.5)
        L2_42 = L3_43
        L3_43 = waitSeconds
        L4_44 = 2
        L3_43(L4_44)
        L3_43 = Fn_playMotionNpc
        L4_44 = "xer_01"
        L5_45 = "greeting"
        L3_43(L4_44, L5_45, false)
        L3_43 = waitSeconds
        L4_44 = 3.7
        L3_43(L4_44)
        L3_43 = Fn_kaiwaDemoView
        L4_44 = "ep22_00211k"
        L3_43(L4_44)
        _voice_hdl = nil
        L3_43 = _story_flag
        L3_43[2] = true
        _during_xer_event = false
        L3_43 = Mv_safeTaskAbort
        L4_44 = L2_42
        L3_43 = L3_43(L4_44)
        L2_42 = L3_43
        L3_43 = Player
        L4_44 = L3_43
        L3_43 = L3_43.setLookAtIk
        L5_45 = false
        L3_43(L4_44, L5_45, 1, _puppet_tbl.xer_01:getWorldPos())
        L3_43 = waitSeconds
        L4_44 = 2
        L3_43(L4_44)
        L3_43 = Fn_userCtrlOn
        L3_43()
        L3_43 = Fn_pcSensorOff
        L4_44 = "pccubesensor2_hully_01"
        L3_43(L4_44)
        L3_43 = Fn_playMotionNpc
        L4_44 = "xer_01"
        L5_45 = "greeting"
        L3_43(L4_44, L5_45, false, {animBlendDuration = 0.4})
        L3_43 = waitSeconds
        L4_44 = 4
        L3_43(L4_44)
        L3_43 = Fn_moveNpc
        L4_44 = "xer_01"
        L5_45 = {
          "locator2_xero_move_02",
          "locator2_xero_move_01"
        }
        L3_43 = L3_43(L4_44, L5_45, {
          runLength = 1000,
          navimesh = false,
          arrivedLength = 0
        })
        while true do
          L5_45 = L3_43
          L4_44 = L3_43.isRunning
          L4_44 = L4_44(L5_45)
          if L4_44 then
            L4_44 = wait
            L4_44()
          end
        end
        L4_44 = wait
        L4_44()
        L4_44 = Fn_turnNpc
        L5_45 = "xer_01"
        L4_44(L5_45, _puppet_tbl.jiju_01)
        L4_44 = Fn_turnNpc
        L5_45 = "jiju_01"
        L4_44(L5_45, _puppet_tbl.xer_01)
        L4_44 = Fn_repeatPlayMotion
        L5_45 = "xer_01"
        L4_44 = L4_44(L5_45, "talk_00", {"talk_00"})
        _xer_motion = L4_44
        L4_44 = Fn_repeatPlayMotion
        L5_45 = "jiju_01"
        L4_44 = L4_44(L5_45, "talk_01", {"talk_01"})
        _jiju_motion = L4_44
        L4_44 = Fn_pcSensorOn
        L5_45 = "pccubesensormulti2_xer_jiju_talk_area_01"
        L4_44(L5_45)
        L4_44 = print
        L5_45 = "\227\130\173\227\130\187\227\131\173\239\188\134\228\190\141\229\190\147\228\188\154\232\169\177\227\130\187\227\131\179\227\130\181\227\131\188ON"
        L4_44(L5_45)
        L4_44 = invokeTask
        function L5_45()
          while true do
            if _night then
              _xero_jiju_talk_task = Mv_safeTaskAbort(_xero_jiju_talk_task)
              Mv_safeTaskAbort(_sensor_leave_task)
              print("\229\164\156\227\129\170\227\129\174\227\129\167\227\128\128_xero_jiju_talk_task: abort, nil")
              Mv_safeTaskAbort(_xer_motion)
              Mv_safeTaskAbort(_jiju_motion)
              Fn_pcSensorOff("pccubesensormulti2_xer_jiju_talk_area_01")
              Fn_playMotionNpc("xer_01", "stay", true)
              Fn_playMotionNpc("jiju_01", "stay", true)
              break
            end
            wait()
          end
        end
        L4_44(L5_45)
      end
    end
  end)
end
function pccubesensormulti2_xer_jiju_talk_area_01_OnEnter()
  xeroJijuTalk()
end
function pccubesensormulti2_xer_jiju_talk_area_01_OnLeave()
  _talk_permission = true
  _sensor_leave_task = invokeTask(function()
    Sound:stopSEHandle(_voice_hdl)
    Fn_captionViewEnd()
    while _xer_npc:isTurnEnd() == false or _jiju01_npc:isTurnEnd() == false do
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\226\128\187\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\229\190\133\227\129\161")
      wait()
    end
    Mv_safeTaskAbort(_xero_jiju_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\230\184\136\227\129\160\227\129\139\227\130\137_xero_jiju_talk_task: abort")
    if Mv_isSafeTaskRunning(_xer_motion) == false then
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
      Fn_turnNpc("xer_01", _puppet_tbl.jiju_01)
      Fn_turnNpc("jiju_01", _puppet_tbl.xer_01)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
      _xer_motion = Fn_repeatPlayMotion("xer_01", "talk_00", {"talk_00"})
      _jiju_motion = Fn_repeatPlayMotion("jiju_01", "talk_01", {"talk_01"})
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
    end
  end)
end
function xeroJijuTalk()
  local L0_46, L1_47, L2_48
  L0_46 = 0
  L1_47 = {}
  L2_48 = false
  if Mv_isSafeTaskRunning(_sensor_leave_task) then
    Mv_safeTaskAbort(_sensor_leave_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_sensor_leave_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_sensor_leave_task:abort!!!!")
  end
  if Mv_isSafeTaskRunning(_xero_jiju_talk_task) then
    Mv_safeTaskAbort(_xero_jiju_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_xero_jiju_talk_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_xero_jiju_talk_task:abort!!!!")
  end
  _xero_jiju_talk_task = invokeTask(function()
    print("_xero_jiju_talk_task: \233\150\139\229\167\139")
    while true do
      if L0_46 == SUSPEND_TALKING_TIME then
        L0_46 = 0
        Fn_captionViewEnd()
        Sound:stopSEHandle(_voice_hdl)
        Mv_safeTaskAbort(_xer_motion)
        Mv_safeTaskAbort(_jiju_motion)
        print("\230\179\168\230\132\143\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179abort")
        print("\230\179\168\230\132\143\239\188\154stay")
        Fn_playMotionNpc("xer_01", "stay", false, {animBlendDuration = 0.8})
        Fn_playMotionNpc("jiju_01", "stay", false, {animBlendDuration = 0.8})
        waitSeconds(1)
        print("\230\179\168\230\132\143\239\188\154stay1\231\167\146\231\181\140\233\129\142")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("xer_01")
        Fn_turnNpc("jiju_01")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
        _voice_hdl = Sound:playSEHandle("xeo_801b", 1, "", _puppet_tbl.xer_01)
        Fn_captionViewWait("ep22_00155")
        Sound:stopSEHandle(_voice_hdl)
        _talk_permission = false
        waitSeconds(1)
      end
      if _talk_permission then
        L1_47[0] = function()
          _voice_hdl = Sound:playSEHandle("xeo_901c", 1, "", _puppet_tbl.xer_01)
          Fn_captionViewWait("ep22_00156")
        end
        L1_47[1] = function()
          _voice_hdl = Sound:playSEHandle("w24_005", 1, "", _puppet_tbl.jiju_01)
          Fn_captionViewWait("ep22_00157")
        end
        L1_47[2] = function()
          _voice_hdl = Sound:playSEHandle("xeo_908a", 1, "", _puppet_tbl.xer_01)
          Fn_captionViewWait("ep22_00158")
        end
        L1_47[3] = function()
          _voice_hdl = Sound:playSEHandle("w24_006", 1, "", _puppet_tbl.jiju_01)
          Fn_captionViewWait("ep22_00159")
          _talk_end = true
        end
        if Mv_isSafeTaskRunning(_xer_motion) == false then
          print("\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
          Fn_turnNpc("xer_01", _puppet_tbl.jiju_01)
          Fn_turnNpc("jiju_01", _puppet_tbl.xer_01)
          _xer_motion = Fn_repeatPlayMotion("xer_01", "talk_00", {"talk_00"})
          _jiju_motion = Fn_repeatPlayMotion("jiju_01", "talk_01", {"talk_01"})
        end
        if L2_48 == false and _talk_end == false then
          L2_48 = true
          invokeTask(function()
            Sound:stopSEHandle(_voice_hdl)
            L1_47[_npc_mes_count]()
            L2_48 = false
            _npc_mes_count = _npc_mes_count + 1
          end)
        end
      end
      waitSeconds(1)
      if _talk_permission then
        L0_46 = L0_46 + 1
      end
    end
  end)
end
function jiju_Hurry()
  local L0_49
  L0_49 = nil
  _jiju_talk = invokeTask(function()
    print("\228\190\141\229\190\147\239\188\145\227\129\174\227\129\155\227\129\139\227\129\151\227\130\191\227\130\185\227\130\175\233\150\139\229\167\139\239\188\129\239\188\129")
    repeat
      while (_day_cnt ~= 1 or not _story_flag[2]) and _day_cnt ~= 2 do
        waitSeconds(1)
        _crate_cap_wait = _crate_cap_wait - 1
        if _crate_cap_wait < 0 then
          _crate_cap_wait = 0
        end
        if _crate_cap_wait == 0 then
          _switch[0] = function()
            L0_49 = Sound:playSEHandle("w24_004", 1, "", _puppet_tbl.jiju_01)
            Fn_captionViewWait("ep22_00120")
          end
          _switch[1] = function()
            Fn_captionViewWait("ep22_00121")
          end
          _switch[2] = function()
            Fn_captionViewWait("ep22_00122")
            _mes_count = -1
          end
          print("\227\130\162\227\131\171\227\131\143\227\130\146\227\129\155\227\129\139\227\129\153\239\188\129\239\188\129\239\188\129")
          Fn_turnNpc("jiju_01")
          _mes_count = _mes_count + 1
          _crate_cap_wait = 20
          Sound:stopSEHandle(L0_49)
          _switch[_mes_count]()
        end
      end
    until _cap_flag == true
  end)
end
function pccubesensormulti2_sentinel_secret_talk_area_01_OnEnter()
  _in_secret_talk_area = true
  sentinelSecretTalk()
end
function pccubesensormulti2_sentinel_secret_talk_area_01_OnLeave()
  _in_secret_talk_area = false
  _sentinel_sensor_leave_task = invokeTask(function()
    Sound:stopSEHandle(_voice_hdl)
    Fn_captionViewEnd()
    Mv_safeTaskAbort(_sentinel_secret_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154_sentinel_secret_talk_task: abort")
    if _in_stop_secret_talk_area then
      Mv_safeTaskAbort(_sentinel01_motion)
      Mv_safeTaskAbort(_sentinel02_motion)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179abort")
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154stay\233\150\139\229\167\139")
      Fn_playMotionNpc("sentinel_01", _man66_mot_list.stay_gate, false, {animBlendDuration = 0.8})
      Fn_playMotionNpc("sentinel_02", _man66_mot_list.stay_gate, false, {animBlendDuration = 0.8})
      waitSeconds(1)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154stay\231\181\130\228\186\134")
    end
  end)
end
function pccubesensor2_stop_sentinel_secret_talk_area_01_OnEnter()
  local L0_50, L1_51
  _in_stop_secret_talk_area = true
end
function pccubesensor2_stop_sentinel_secret_talk_area_01_OnLeave()
  local L0_52, L1_53
  _in_stop_secret_talk_area = false
end
function sentinelSecretTalk()
  local L0_54, L1_55
  L0_54 = nil
  L1_55 = {}
  if Mv_isSafeTaskRunning(_sentinel_sensor_leave_task) then
    Mv_safeTaskAbort(_sentinel_sensor_leave_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_sentinel_sensor_leave_task\227\129\140Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_sentinel_sensor_leave_task:abort!!!!")
  end
  _sentinel_secret_talk_task = invokeTask(function()
    while true do
      if Mv_isSafeTaskRunning(_sentinel01_motion) == false then
        print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\229\134\133\231\183\146\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
        Fn_playMotionNpc("sentinel_01", _man66_mot_list.talk_to_r, false, {animBlendDuration = 0.8})
        Fn_playMotionNpc("sentinel_02", _man66_mot_list.talk_to_l, false, {animBlendDuration = 0.8})
        waitSeconds(0.8)
        _sentinel01_motion = Fn_repeatPlayMotion("sentinel_01", _man66_mot_list.talk_to_r, {
          _man66_mot_list.talk_to_r
        })
        _sentinel02_motion = Fn_repeatPlayMotion("sentinel_02", _man66_mot_list.talk_to_l, {
          _man66_mot_list.talk_to_l
        })
      end
      waitSeconds(1)
      if _sel_stop <= 0 and _during_xer_event == false and _secret_cap_end == false then
        if _day_cnt % 5 == 1 then
          L1_55[0] = function()
            _voice_hdl = Sound:playSE("m41_001", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00123", _sel_interval)
          end
          L1_55[1] = function()
            _voice_hdl = Sound:playSE("m42_001", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00124", _sel_interval)
          end
          L1_55[2] = function()
            _voice_hdl = Sound:playSE("m42_002", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00125", _sel_interval)
          end
          L1_55[3] = function()
            _voice_hdl = Sound:playSE("m41_002", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00126", _sel_interval)
            _secret_cap_end = true
          end
        elseif _day_cnt % 5 == 2 then
          L1_55[0] = function()
            _voice_hdl = Sound:playSE("m41_001", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00127", _sel_interval)
          end
          L1_55[1] = function()
            _voice_hdl = Sound:playSE("m41_002", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00128", _sel_interval)
          end
          L1_55[2] = function()
            _voice_hdl = Sound:playSE("m42_001", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00129", _sel_interval)
          end
          L1_55[3] = function()
            _voice_hdl = Sound:playSE("m42_002", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00130", _sel_interval)
            _secret_cap_end = true
          end
        elseif _day_cnt % 5 == 3 then
          L1_55[0] = function()
            _voice_hdl = Sound:playSE("m41_001", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00131", _sel_interval)
          end
          L1_55[1] = function()
            _voice_hdl = Sound:playSE("m41_002", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00132", _sel_interval)
          end
          L1_55[2] = function()
            _voice_hdl = Sound:playSE("m42_001", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00133", _sel_interval)
          end
          L1_55[3] = function()
            _voice_hdl = Sound:playSE("m42_002", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00134", _sel_interval)
            _secret_cap_end = true
          end
        elseif _day_cnt % 5 == 4 then
          L1_55[0] = function()
            _voice_hdl = Sound:playSE("m41_001", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00135", _sel_interval)
          end
          L1_55[1] = function()
            _voice_hdl = Sound:playSE("m41_002", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00136", _sel_interval)
          end
          L1_55[2] = function()
            _voice_hdl = Sound:playSE("m42_001", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00137", _sel_interval)
          end
          L1_55[3] = function()
            _voice_hdl = Sound:playSE("m41_001", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00138", _sel_interval)
          end
          L1_55[4] = function()
            _voice_hdl = Sound:playSE("m42_002", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00139", _sel_interval)
            _secret_cap_end = true
          end
        elseif _day_cnt % 5 == 0 then
          L1_55[0] = function()
            _voice_hdl = Sound:playSE("m41_001", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00140", _sel_interval)
          end
          L1_55[1] = function()
            _voice_hdl = Sound:playSE("m42_001", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00141", _sel_interval)
          end
          L1_55[2] = function()
            _voice_hdl = Sound:playSE("m41_002", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00142", _sel_interval)
          end
          L1_55[3] = function()
            _voice_hdl = Sound:playSE("m41_001", 1, "", _puppet_tbl.sentinel_01)
            Fn_captionView("ep22_00143", _sel_interval)
          end
          L1_55[4] = function()
            _voice_hdl = Sound:playSE("m42_002", 1, "", _puppet_tbl.sentinel_02)
            Fn_captionView("ep22_00144", _sel_interval)
            _secret_cap_end = true
          end
        end
        if L1_55[L0_54] ~= nil then
          Sound:stopSEHandle(_voice_hdl)
          L1_55[L0_54]()
          _sel_stop = _sel_interval - _time_cnt % _sel_interval
        end
      end
      if _during_xer_event == false then
        _time_cnt = _time_cnt + 1
        _sel_stop = _sel_stop - 1
        print(_time_cnt)
        L0_54 = math.floor(_time_cnt / _sel_interval)
      end
    end
  end)
end
function pccubesensor2_shill_move_day2_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_shill_move_day2_01")
  ShillDay2Move()
end
function ShillDay2Move()
  local L0_56
  L0_56 = nil
  _sill_event = invokeTask(function()
    local L0_57, L1_58, L2_59, L3_60
    L0_57 = Fn_moveNpc
    L1_58 = "shill_day2_01"
    L2_59 = {L3_60}
    L3_60 = "locator2_shill_day2_01_move_01"
    L3_60 = {}
    L3_60.arrivedLength = 0
    L0_57 = L0_57(L1_58, L2_59, L3_60)
    while true do
      L1_58 = waitSeconds
      L2_59 = 0.25
      L1_58(L2_59)
      L1_58 = Mv_isSafeTaskRunning
      L2_59 = L0_57
      L1_58 = L1_58(L2_59)
      if L1_58 == false then
        L1_58 = Mv_safeTaskAbort
        L2_59 = L0_57
        L1_58 = L1_58(L2_59)
        L0_57 = L1_58
        L1_58 = wait
        L1_58()
        break
      end
      L1_58 = _puppet_tbl
      L1_58 = L1_58.shill_day2_01
      L2_59 = L1_58
      L1_58 = L1_58.getWorldPos
      L1_58 = L1_58(L2_59)
      L2_59 = _puppet_tbl
      L2_59 = L2_59.shill_day2_01
      L3_60 = L2_59
      L2_59 = L2_59.getWorldRot
      L2_59 = L2_59(L3_60)
      L3_60 = L1_58.y
      L3_60 = L3_60 + 1.5
      L1_58.y = L3_60
      L3_60 = Fn_getPlayerWorldPos
      L3_60 = L3_60()
      Query:setEyeSightTransform(L1_58, L2_59)
      Query:setEyeSightAngle(Deg2Rad(WATCHER_EYE_ANGLE))
      Query:setEyeSightRange(WATCHER_EYE_RANGE)
      Query:debugDrawEyeSight({
        r = 1,
        g = 1,
        b = 1
      })
      if not Query:raycastEyeSight(L3_60) then
        DebugDraw:setColor(0, 1, 0)
        shyahei_ok = true
      else
        DebugDraw:setColor(1, 0, 0)
        shyahei_ok = false
      end
      DebugDraw:drawLines({L1_58, L3_60})
      if Query:checkEyeSightSphere(L3_60, 1) and shyahei_ok and _once_shill_react == false then
        _once_shill_react = true
        Mv_safeTaskAbort(L0_57)
        wait()
        Fn_turnNpc("shill_day2_01")
        if _in_secret_talk_area == false then
          L0_56 = Sound:playSEHandle("m41_801a", 1, "", _puppet_tbl.shill_day2_01)
          Fn_captionView("ep22_00160")
        end
        Fn_playMotionNpc("shill_day2_01", _man66_mot_list.greet, true)
        L0_57 = Fn_moveNpc("shill_day2_01", {
          "locator2_shill_day2_01_move_01"
        }, {arrivedLength = 0})
      end
    end
    L1_58 = Fn_turnNpc
    L2_59 = "shill_day2_01"
    L3_60 = _puppet_tbl
    L3_60 = L3_60.shill_day2_02
    L1_58(L2_59, L3_60)
    L1_58 = Fn_turnNpc
    L2_59 = "shill_day2_02"
    L3_60 = _puppet_tbl
    L3_60 = L3_60.shill_day2_01
    L1_58(L2_59, L3_60)
    L1_58 = Fn_repeatPlayMotion
    L2_59 = "shill_day2_01"
    L3_60 = "talk_00"
    L1_58 = L1_58(L2_59, L3_60, {"talk_00"})
    _shill01_motion = L1_58
    L1_58 = Fn_repeatPlayMotion
    L2_59 = "shill_day2_02"
    L3_60 = "talk_01"
    L1_58 = L1_58(L2_59, L3_60, {"talk_01"})
    _shill02_motion = L1_58
    L1_58 = Fn_pcSensorOn
    L2_59 = "pccubesensor2_shill_day2_talk_area_01"
    L1_58(L2_59)
    L1_58 = invokeTask
    function L2_59()
      while true do
        if _night then
          _shill_day2_talk_task = Mv_safeTaskAbort(_shill_day2_talk_task)
          Mv_safeTaskAbort(_shill_sensor_leave_task)
          print("\229\164\156\227\129\170\227\129\174\227\129\167\227\128\128_shill_day2_talk_task: abort, nil")
          Mv_safeTaskAbort(_shill01_motion)
          Mv_safeTaskAbort(_shill02_motion)
          Fn_pcSensorOff("pccubesensor2_shill_day2_talk_area_01")
          Fn_playMotionNpc("shill_day2_01", "stay", false)
          Fn_playMotionNpc("shill_day2_02", "stay", false)
          Fn_setNpcActive("shill_day2_01", false)
          Fn_setNpcActive("shill_day2_02", false)
          break
        end
        wait()
      end
    end
    L1_58(L2_59)
  end)
end
function pccubesensor2_shill_day2_talk_area_01_OnEnter()
  ShillDay2Talk()
end
function pccubesensor2_shill_day2_talk_area_01_OnLeave()
  _shill_talk_permission = true
  _shill_sensor_leave_task = invokeTask(function()
    Fn_captionViewEnd()
    while Fn_findNpc("shill_day2_01"):isTurnEnd() == false or Fn_findNpc("shill_day2_02"):isTurnEnd() == false do
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\226\128\187\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\229\190\133\227\129\161")
      wait()
    end
    Mv_safeTaskAbort(_shill_day2_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\230\184\136\227\129\160\227\129\139\227\130\137_shill_day2_talk_task: abort")
    if Mv_isSafeTaskRunning(_shill01_motion) == false then
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
      Fn_turnNpc("shill_day2_01", _puppet_tbl.shill_day2_02)
      Fn_turnNpc("shill_day2_02", _puppet_tbl.shill_day2_01)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
      _shill01_motion = Fn_repeatPlayMotion("shill_day2_01", "talk_00", {"talk_00"})
      _shill02_motion = Fn_repeatPlayMotion("shill_day2_02", "talk_01", {"talk_01"})
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
    end
  end)
end
function ShillDay2Talk()
  local L0_61, L1_62, L2_63
  L0_61 = 0
  L1_62 = {}
  L2_63 = false
  if Mv_isSafeTaskRunning(_shill_sensor_leave_task) then
    Mv_safeTaskAbort(_shill_sensor_leave_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_shill_sensor_leave_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_shill_sensor_leave_task:abort!!!!")
  end
  if Mv_isSafeTaskRunning(_shill_day2_talk_task) then
    Mv_safeTaskAbort(_shill_day2_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_shill_day2_talk_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_shill_day2_talk_task:abort!!!!")
  end
  _shill_day2_talk_task = invokeTask(function()
    print("_shill_day2_talk_task: \233\150\139\229\167\139")
    while true do
      if L0_61 == SUSPEND_TALKING_TIME then
        L0_61 = 0
        Fn_captionViewEnd()
        Mv_safeTaskAbort(_shill01_motion)
        Mv_safeTaskAbort(_shill02_motion)
        print("\230\179\168\230\132\143\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179abort")
        print("\230\179\168\230\132\143\239\188\154stay")
        Fn_playMotionNpc("shill_day2_01", "stay", false, {animBlendDuration = 0.8})
        Fn_playMotionNpc("shill_day2_02", "stay", false, {animBlendDuration = 0.8})
        waitSeconds(1)
        print("\230\179\168\230\132\143\239\188\154stay1\231\167\146\231\181\140\233\129\142")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("shill_day2_01")
        Fn_turnNpc("shill_day2_02")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
        Fn_captionViewWait("ep22_00161")
        _shill_talk_permission = false
        waitSeconds(1)
      end
      if _shill_talk_permission and Mv_isSafeTaskRunning(_shill01_motion) == false then
        print("\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("shill_day2_01", _puppet_tbl.shill_day2_02)
        Fn_turnNpc("shill_day2_02", _puppet_tbl.shill_day2_01)
        _shill01_motion = Fn_repeatPlayMotion("shill_day2_01", "talk_00", {"talk_00"})
        _shill02_motion = Fn_repeatPlayMotion("shill_day2_02", "talk_01", {"talk_01"})
      end
      waitSeconds(1)
      if _shill_talk_permission then
        L0_61 = L0_61 + 1
      end
    end
  end)
end
function ShillDay3Move()
  local L0_64
  L0_64 = nil
  _sill_event = invokeTask(function()
    local L0_65, L1_66, L2_67, L3_68
    L0_65 = Fn_moveNpc
    L1_66 = "shill_day3_01"
    L2_67 = {L3_68}
    L3_68 = "locator2_shill_day3_01_move_01"
    L3_68 = {}
    L3_68.arrivedLength = 0
    L0_65 = L0_65(L1_66, L2_67, L3_68)
    while true do
      L1_66 = waitSeconds
      L2_67 = 0.25
      L1_66(L2_67)
      L1_66 = Mv_isSafeTaskRunning
      L2_67 = L0_65
      L1_66 = L1_66(L2_67)
      if L1_66 == false then
        L1_66 = Mv_safeTaskAbort
        L2_67 = L0_65
        L1_66 = L1_66(L2_67)
        L0_65 = L1_66
        L1_66 = wait
        L1_66()
        break
      end
      L1_66 = _puppet_tbl
      L1_66 = L1_66.shill_day3_01
      L2_67 = L1_66
      L1_66 = L1_66.getWorldPos
      L1_66 = L1_66(L2_67)
      L2_67 = _puppet_tbl
      L2_67 = L2_67.shill_day3_01
      L3_68 = L2_67
      L2_67 = L2_67.getWorldRot
      L2_67 = L2_67(L3_68)
      L3_68 = L1_66.y
      L3_68 = L3_68 + 1.5
      L1_66.y = L3_68
      L3_68 = Fn_getPlayerWorldPos
      L3_68 = L3_68()
      Query:setEyeSightTransform(L1_66, L2_67)
      Query:setEyeSightAngle(Deg2Rad(WATCHER_EYE_ANGLE))
      Query:setEyeSightRange(WATCHER_EYE_RANGE)
      Query:debugDrawEyeSight({
        r = 1,
        g = 1,
        b = 1
      })
      if not Query:raycastEyeSight(L3_68) then
        DebugDraw:setColor(0, 1, 0)
        shyahei_ok = true
      else
        DebugDraw:setColor(1, 0, 0)
        shyahei_ok = false
      end
      DebugDraw:drawLines({L1_66, L3_68})
      if Query:checkEyeSightSphere(L3_68, 1) and shyahei_ok and _once_shill_react == false then
        _once_shill_react = true
        Mv_safeTaskAbort(L0_65)
        wait()
        Fn_turnNpc("shill_day3_01")
        L0_64 = Sound:playSEHandle("w24_002", 1, "", _puppet_tbl.shill_day3_01)
        Fn_captionView("ep22_00162")
        Fn_playMotionNpc("shill_day3_01", _jiju_mot_list.greet, true)
        L0_65 = Fn_moveNpc("shill_day3_01", {
          "locator2_shill_day3_01_move_01"
        }, {arrivedLength = 0})
      end
    end
    L1_66 = Fn_turnNpc
    L2_67 = "shill_day3_01"
    L3_68 = _puppet_tbl
    L3_68 = L3_68.shill_day3_02
    L1_66(L2_67, L3_68)
    L1_66 = Fn_turnNpc
    L2_67 = "shill_day3_02"
    L3_68 = _puppet_tbl
    L3_68 = L3_68.shill_day3_01
    L1_66(L2_67, L3_68)
    L1_66 = Fn_repeatPlayMotion
    L2_67 = "shill_day3_01"
    L3_68 = "talk_00"
    L1_66 = L1_66(L2_67, L3_68, {"talk_00"})
    _shill01_motion = L1_66
    L1_66 = Fn_repeatPlayMotion
    L2_67 = "shill_day3_02"
    L3_68 = "talk_01"
    L1_66 = L1_66(L2_67, L3_68, {"talk_01"})
    _shill02_motion = L1_66
    L1_66 = Fn_pcSensorOn
    L2_67 = "pccubesensor2_shill_day3_talk_area_01"
    L1_66(L2_67)
    L1_66 = invokeTask
    function L2_67()
      while true do
        if _night then
          _shill_day3_talk_task = Mv_safeTaskAbort(_shill_day3_talk_task)
          Mv_safeTaskAbort(_shill_sensor_leave_task)
          print("\229\164\156\227\129\170\227\129\174\227\129\167\227\128\128_shill_day3_talk_task: abort, nil")
          Mv_safeTaskAbort(_shill01_motion)
          Mv_safeTaskAbort(_shill02_motion)
          Fn_pcSensorOff("pccubesensor2_shill_day3_talk_area_01")
          Fn_playMotionNpc("shill_day3_01", "stay", false)
          Fn_playMotionNpc("shill_day3_02", "stay", false)
          Fn_setNpcActive("shill_day3_01", false)
          Fn_setNpcActive("shill_day3_02", false)
          print("3\230\151\165\231\155\174\227\130\181\227\130\175\227\131\169\239\188\154\233\157\158\232\161\168\231\164\186\239\188\129\239\188\129\239\188\129\239\188\129")
          break
        end
        wait()
      end
    end
    L1_66(L2_67)
  end)
end
function pccubesensor2_shill_day3_talk_area_01_OnEnter()
  ShillDay3Talk()
end
function pccubesensor2_shill_day3_talk_area_01_OnLeave()
  _shill_talk_permission = true
  _shill_sensor_leave_task = invokeTask(function()
    Fn_captionViewEnd()
    while Fn_findNpc("shill_day3_01"):isTurnEnd() == false or Fn_findNpc("shill_day3_02"):isTurnEnd() == false do
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\226\128\187\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\229\190\133\227\129\161")
      wait()
    end
    Mv_safeTaskAbort(_shill_day3_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\230\184\136\227\129\160\227\129\139\227\130\137_shill_day3_talk_task: abort")
    if Mv_isSafeTaskRunning(_shill01_motion) == false then
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
      Fn_turnNpc("shill_day3_01", _puppet_tbl.shill_day3_02)
      Fn_turnNpc("shill_day3_02", _puppet_tbl.shill_day3_01)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
      _shill01_motion = Fn_repeatPlayMotion("shill_day3_01", "talk_00", {"talk_00"})
      _shill02_motion = Fn_repeatPlayMotion("shill_day3_02", "talk_01", {"talk_01"})
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
    end
  end)
end
function ShillDay3Talk()
  local L0_69, L1_70, L2_71
  L0_69 = 0
  L1_70 = {}
  L2_71 = false
  if Mv_isSafeTaskRunning(_shill_sensor_leave_task) then
    Mv_safeTaskAbort(_shill_sensor_leave_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_shill_sensor_leave_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_shill_sensor_leave_task:abort!!!!")
  end
  if Mv_isSafeTaskRunning(_shill_day3_talk_task) then
    Mv_safeTaskAbort(_shill_day3_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_shill_day3_talk_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_shill_day3_talk_task:abort!!!!")
  end
  _shill_day3_talk_task = invokeTask(function()
    print("_shill_day3_talk_task: \233\150\139\229\167\139")
    while true do
      if L0_69 == SUSPEND_TALKING_TIME then
        L0_69 = 0
        Fn_captionViewEnd()
        Sound:stopSEHandle(_voice_hdl)
        Mv_safeTaskAbort(_shill01_motion)
        Mv_safeTaskAbort(_shill02_motion)
        print("\230\179\168\230\132\143\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179abort")
        print("\230\179\168\230\132\143\239\188\154stay")
        Fn_playMotionNpc("shill_day3_01", "stay", false)
        Fn_playMotionNpc("shill_day3_02", "stay", false)
        waitSeconds(1)
        print("\230\179\168\230\132\143\239\188\154stay1\231\167\146\231\181\140\233\129\142")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("shill_day3_01")
        Fn_turnNpc("shill_day3_02")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
        Fn_captionViewWait("ep22_00163")
        _shill_talk_permission = false
        waitSeconds(1)
      end
      if _shill_talk_permission and Mv_isSafeTaskRunning(_shill01_motion) == false then
        print("\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("shill_day3_01", _puppet_tbl.shill_day3_02)
        Fn_turnNpc("shill_day3_02", _puppet_tbl.shill_day3_01)
        _shill01_motion = Fn_repeatPlayMotion("shill_day3_01", "talk_00", {"talk_00"})
        _shill02_motion = Fn_repeatPlayMotion("shill_day3_02", "talk_01", {"talk_01"})
      end
      waitSeconds(1)
      if _shill_talk_permission then
        L0_69 = L0_69 + 1
      end
    end
  end)
end
function pccubesensor2_shill_move_day4_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_shill_move_day4_01")
  ShillDay4Move()
end
function ShillDay4Move()
  local L0_72
  L0_72 = nil
  _sill_event = invokeTask(function()
    local L0_73, L1_74, L2_75, L3_76
    L0_73 = Fn_moveNpc
    L1_74 = "shill_day4_01"
    L2_75 = {L3_76}
    L3_76 = "locator2_shill_day4_01_move_01"
    L3_76 = {}
    L3_76.arrivedLength = 0
    L0_73 = L0_73(L1_74, L2_75, L3_76)
    while true do
      L1_74 = waitSeconds
      L2_75 = 0.25
      L1_74(L2_75)
      L1_74 = Mv_isSafeTaskRunning
      L2_75 = L0_73
      L1_74 = L1_74(L2_75)
      if L1_74 == false then
        L1_74 = Mv_safeTaskAbort
        L2_75 = L0_73
        L1_74 = L1_74(L2_75)
        L0_73 = L1_74
        L1_74 = wait
        L1_74()
        break
      end
      L1_74 = _puppet_tbl
      L1_74 = L1_74.shill_day4_01
      L2_75 = L1_74
      L1_74 = L1_74.getWorldPos
      L1_74 = L1_74(L2_75)
      L2_75 = _puppet_tbl
      L2_75 = L2_75.shill_day4_01
      L3_76 = L2_75
      L2_75 = L2_75.getWorldRot
      L2_75 = L2_75(L3_76)
      L3_76 = L1_74.y
      L3_76 = L3_76 + 1.5
      L1_74.y = L3_76
      L3_76 = Fn_getPlayerWorldPos
      L3_76 = L3_76()
      Query:setEyeSightTransform(L1_74, L2_75)
      Query:setEyeSightAngle(Deg2Rad(WATCHER_EYE_ANGLE))
      Query:setEyeSightRange(WATCHER_EYE_RANGE)
      Query:debugDrawEyeSight({
        r = 1,
        g = 1,
        b = 1
      })
      if not Query:raycastEyeSight(L3_76) then
        DebugDraw:setColor(0, 1, 0)
        shyahei_ok = true
      else
        DebugDraw:setColor(1, 0, 0)
        shyahei_ok = false
      end
      DebugDraw:drawLines({L1_74, L3_76})
      if Query:checkEyeSightSphere(L3_76, 1) and shyahei_ok and _once_shill_react == false then
        _once_shill_react = true
        Mv_safeTaskAbort(L0_73)
        wait()
        Fn_turnNpc("shill_day4_01")
        if _in_secret_talk_area == false then
          L0_72 = Sound:playSEHandle("w24_002", 1, "", _puppet_tbl.shill_day4_01)
          Fn_captionView("ep22_00164")
        end
        Fn_playMotionNpc("shill_day4_01", _jiju_mot_list.greet, true)
        L0_73 = Fn_moveNpc("shill_day4_01", {
          "locator2_shill_day4_01_move_01"
        }, {arrivedLength = 0})
      end
    end
    L1_74 = Fn_turnNpc
    L2_75 = "shill_day4_01"
    L3_76 = _puppet_tbl
    L3_76 = L3_76.shill_day4_02
    L1_74(L2_75, L3_76)
    L1_74 = Fn_turnNpc
    L2_75 = "shill_day4_02"
    L3_76 = _puppet_tbl
    L3_76 = L3_76.shill_day4_01
    L1_74(L2_75, L3_76)
    L1_74 = Fn_repeatPlayMotion
    L2_75 = "shill_day4_01"
    L3_76 = "talk_00"
    L1_74 = L1_74(L2_75, L3_76, {"talk_00"})
    _shill01_motion = L1_74
    L1_74 = Fn_repeatPlayMotion
    L2_75 = "shill_day4_02"
    L3_76 = "talk_01"
    L1_74 = L1_74(L2_75, L3_76, {"talk_01"})
    _shill02_motion = L1_74
    L1_74 = Fn_pcSensorOn
    L2_75 = "pccubesensor2_shill_day4_talk_area_01"
    L1_74(L2_75)
    L1_74 = invokeTask
    function L2_75()
      while true do
        if _night then
          _shill_day4_talk_task = Mv_safeTaskAbort(_shill_day4_talk_task)
          Mv_safeTaskAbort(_shill_sensor_leave_task)
          print("\229\164\156\227\129\170\227\129\174\227\129\167\227\128\128_shill_day4_talk_task: abort, nil")
          Mv_safeTaskAbort(_shill01_motion)
          Mv_safeTaskAbort(_shill02_motion)
          Fn_pcSensorOff("pccubesensor2_shill_day4_talk_area_01")
          Fn_playMotionNpc("shill_day4_01", "stay", false)
          Fn_playMotionNpc("shill_day4_02", "stay", false)
          Fn_setNpcActive("shill_day4_01", false)
          Fn_setNpcActive("shill_day4_02", false)
          print("4\230\151\165\231\155\174\227\130\181\227\130\175\227\131\169\239\188\154\233\157\158\232\161\168\231\164\186\239\188\129\239\188\129\239\188\129\239\188\129")
          break
        end
        wait()
      end
    end
    L1_74(L2_75)
  end)
end
function pccubesensor2_shill_day4_talk_area_01_OnEnter()
  ShillDay4Talk()
end
function pccubesensor2_shill_day4_talk_area_01_OnLeave()
  _shill_talk_permission = true
  _shill_sensor_leave_task = invokeTask(function()
    Fn_captionViewEnd()
    while Fn_findNpc("shill_day4_01"):isTurnEnd() == false or Fn_findNpc("shill_day4_02"):isTurnEnd() == false do
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\226\128\187\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\229\190\133\227\129\161")
      wait()
    end
    Mv_safeTaskAbort(_shill_day4_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\229\174\140\228\186\134\230\184\136\227\129\160\227\129\139\227\130\137_shill_day4_talk_task: abort")
    if Mv_isSafeTaskRunning(_shill01_motion) == false then
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
      Fn_turnNpc("shill_day4_01", _puppet_tbl.shill_day4_02)
      Fn_turnNpc("shill_day4_02", _puppet_tbl.shill_day4_01)
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
      _shill01_motion = Fn_repeatPlayMotion("shill_day4_01", "talk_00", {"talk_00"})
      _shill02_motion = Fn_repeatPlayMotion("shill_day4_02", "talk_01", {"talk_01"})
      print("\227\130\187\227\131\179\227\130\181\227\131\188\229\164\150\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
    end
  end)
end
function ShillDay4Talk()
  local L0_77, L1_78, L2_79
  L0_77 = 0
  L1_78 = {}
  L2_79 = false
  if Mv_isSafeTaskRunning(_shill_sensor_leave_task) then
    Mv_safeTaskAbort(_shill_sensor_leave_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_shill_sensor_leave_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_shill_sensor_leave_task:abort!!!!")
  end
  if Mv_isSafeTaskRunning(_shill_day4_talk_task) then
    Mv_safeTaskAbort(_shill_day4_talk_task)
    print("\227\130\187\227\131\179\227\130\181\227\131\188\229\134\133\239\188\154\226\128\187_shill_day4_talk_task\227\129\140\230\151\162\227\129\171Running\227\129\151\227\129\166\227\129\132\227\129\159\227\129\174\227\129\167_shill_day4_talk_task:abort!!!!")
  end
  _shill_day4_talk_task = invokeTask(function()
    print("_shill_day4_talk_task: \233\150\139\229\167\139")
    while true do
      if L0_77 == SUSPEND_TALKING_TIME then
        L0_77 = 0
        Fn_captionViewEnd()
        Mv_safeTaskAbort(_shill01_motion)
        Mv_safeTaskAbort(_shill02_motion)
        print("\230\179\168\230\132\143\239\188\154\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179abort")
        print("\230\179\168\230\132\143\239\188\154stay")
        Fn_playMotionNpc("shill_day4_01", "stay", false)
        Fn_playMotionNpc("shill_day4_02", "stay", false)
        waitSeconds(1)
        print("\230\179\168\230\132\143\239\188\154stay1\231\167\146\231\181\140\233\129\142")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("shill_day4_01")
        Fn_turnNpc("shill_day4_02")
        print("\230\179\168\230\132\143\239\188\154\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
        Fn_captionViewWait("ep22_00165")
        _shill_talk_permission = false
        waitSeconds(1)
      end
      if _shill_talk_permission and Mv_isSafeTaskRunning(_shill01_motion) == false then
        print("\228\188\154\232\169\177\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\233\150\139\229\167\139")
        Fn_turnNpc("shill_day4_01", _puppet_tbl.shill_day4_02)
        Fn_turnNpc("shill_day4_02", _puppet_tbl.shill_day4_01)
        _shill01_motion = Fn_repeatPlayMotion("shill_day4_01", "talk_00", {"talk_00"})
        _shill02_motion = Fn_repeatPlayMotion("shill_day4_02", "talk_01", {"talk_01"})
      end
      waitSeconds(1)
      if _shill_talk_permission then
        L0_77 = L0_77 + 1
      end
    end
  end)
end
function pccubesensor2_door_view_01_OnEnter()
  if _door_view == nil then
    _door_view = Mv_viewObj(findGameObject2("Node", "locator2_prison_01"), 0.6, 0.6)
  end
end
function pccubesensor2_door_view_01_OnLeave()
  _door_view = Mv_safeTaskAbort(_door_view)
end
function pccubesensor2_door_view_02_OnEnter()
  _door_view = Mv_safeTaskAbort(_door_view)
  if _door_view == nil then
    _door_view = Mv_viewObj(findGameObject2("Node", "locator2_prison_01"), 0.6, 0.6)
  end
end
function pccubesensor2_door_view_02_OnLeave()
  _door_view = Mv_safeTaskAbort(_door_view)
end
