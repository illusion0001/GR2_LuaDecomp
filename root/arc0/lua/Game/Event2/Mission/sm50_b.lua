dofile("/Game/Event2/Common/EventCommon.lua")
_key_word = {
  {
    idx = 1,
    word = {"sm50_01000"}
  },
  {
    idx = 1,
    word = {
      "sm50_01001",
      "sm50_01002",
      "sm50_01003"
    }
  },
  {
    idx = 1,
    word = {
      "sm50_01004",
      "sm50_01005",
      "sm50_01006",
      "sm50_01007"
    }
  },
  {
    idx = 1,
    word = {"sm50_01008"}
  }
}
ADD_MOTIVATION = 10
SUB_MOTIVATION = 25
_bul_motivation = 70
_clear_point = -1
_bul_cap_first = true
_bul_cap_stop = false
_bul_task = nil
_time_cnt = 0
_time_limit = 20
_clear_flag = false
_evidence_weapon = false
_evidence_suspicion = false
_final_word = false
_new_word = true
_new_bul = false
_sensor_hdl = {}
_circle_func = {}
_cross_func = {}
_square_func = {}
_triangle_func = {}
_mot_task = {}
_kaj_event_mot_list = {
  repair = "kaj01_stay_01"
}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_loadEventData
  L0_0("evx/sm50_common", "evarea2_dt_a_root", true)
  L0_0 = {
    {
      name = "npcgen2_man82_01",
      type = "man82",
      node = "locator2_man82_01",
      anim_name = "stay_02"
    },
    {
      name = "npcgen2_man31_01",
      type = "man31",
      node = "locator2_man31_01",
      anim_name = "stay_01"
    },
    {
      name = "npcgen2_man81_01",
      type = "man81",
      node = "locator2_man81_01",
      anim_name = "stay_00"
    },
    {
      name = "bul01",
      type = "bul01",
      node = "locator2_bul01_01"
    }
  }
  Fn_setupNpc(L0_0)
  Fn_loadPlayerMotion({
    "kit01_greeting_00",
    "kit01_point_00"
  })
  _sdemo = SDemo.create("sm50_b")
  Fn_loadNpcEventMotion("sm50_client", _kaj_event_mot_list)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = Fn_warpNpc
  L1_2 = "sm50_client"
  L2_3 = "locator2_kaj01_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_playNpcEventMotion
  L1_2 = "sm50_client"
  L2_3 = _kaj_event_mot_list
  L2_3 = L2_3.repair
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6)
  L0_1 = _sdemo
  L1_2 = L0_1
  L0_1 = L0_1.set
  L2_3 = "locator2_cam_01"
  L0_1(L1_2, L2_3, L3_4, L4_5)
  L0_1 = _sdemo
  L1_2 = L0_1
  L0_1 = L0_1.switchCamera
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = waitSeconds
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = {
    L1_2,
    L2_3,
    L3_4
  }
  L1_2 = {}
  L1_2.pos = "locator2_cam_02"
  L1_2.time = 2
  L1_2.hashfunc = "EaseInOut"
  L2_3 = {}
  L2_3.pos = "locator2_cam_03"
  L2_3.time = 2
  L2_3.hashfunc = "EaseIn"
  L3_4.pos = "locator2_cam_04"
  L3_4.time = 2
  L3_4.hashfunc = "EaseOut"
  L1_2 = {
    L2_3,
    L3_4,
    L4_5
  }
  L2_3 = {}
  L2_3.pos = "locator2_aim_02"
  L2_3.time = 2
  L2_3.hashfunc = "EaseInOut"
  L3_4.pos = "locator2_aim_03"
  L3_4.time = 2
  L3_4.hashfunc = "EaseIn"
  L4_5.pos = "locator2_aim_04"
  L4_5.time = 3
  L4_5.hashfunc = "EaseOut"
  L2_3 = _sdemo
  L2_3 = L2_3.play
  L2_3(L3_4, L4_5, L5_6)
  while true do
    L2_3 = _sdemo
    L2_3 = L2_3.isPlay
    L2_3 = L2_3(L3_4)
    if L2_3 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Fn_kaiwaDemoView
  L2_3(L3_4)
  L2_3 = _sdemo
  L2_3 = L2_3.stop
  L2_3(L3_4, L4_5)
  L2_3 = waitSeconds
  L2_3(L3_4)
  L2_3 = _mot_task
  L6_7 = "stay_00"
  L7_8 = "stay_01"
  L8_9 = "stay_02"
  L6_7 = 5
  L7_8 = 10
  L2_3.npcgen2_man82_01 = L3_4
  L2_3 = _mot_task
  L6_7 = "stay_00"
  L7_8 = "stay_01"
  L8_9 = "stay_02"
  L6_7 = 5
  L7_8 = 10
  L2_3.npcgen2_man31_01 = L3_4
  L2_3 = _mot_task
  L6_7 = "stay_00"
  L7_8 = "stay_01"
  L8_9 = "stay_02"
  L6_7 = 5
  L7_8 = 10
  L2_3.npcgen2_man81_01 = L3_4
  L2_3 = Fn_userCtrlOn
  L2_3()
  L2_3 = _mot_task
  L6_7 = "stay_00"
  L7_8 = "stay_01"
  L8_9 = "stay_02"
  L6_7 = 5
  L7_8 = 10
  L2_3.sm50_client = L3_4
  L2_3 = HUD
  L2_3 = L2_3.info
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = wait
  L2_3()
  L2_3 = Fn_missionView
  L2_3(L3_4)
  L2_3 = waitSeconds
  L2_3(L3_4)
  L2_3 = {}
  L3_4.target = L4_5
  L6_7 = 1.2
  L7_8 = 1.2
  L3_4.size = L4_5
  L2_3.npcgen2_man82_01 = L3_4
  L3_4.target = L4_5
  L6_7 = 1.2
  L7_8 = 1.2
  L3_4.size = L4_5
  L2_3.npcgen2_man31_01 = L3_4
  L3_4.target = L4_5
  L6_7 = 1.2
  L7_8 = 1.2
  L3_4.size = L4_5
  L2_3.npcgen2_man81_01 = L3_4
  L3_4.target = L4_5
  L6_7 = 1.2
  L7_8 = 1.2
  L3_4.size = L4_5
  L2_3.sm50_client = L3_4
  _bul_task = L3_4
  while true do
    if L3_4 > 0 then
      if L3_4 == true then
        _new_word = false
        _clear_point = L3_4
        for L6_7, L7_8 in L3_4(L4_5) do
          L8_9 = L7_8.setActive
          L8_9(L7_8, false)
        end
        for L6_7, L7_8 in L3_4(L4_5) do
          L8_9 = {}
          L8_9.RR = {
            id = _key_word[1].word[_key_word[1].idx],
            func = _circle_func[L6_7]
          }
          L8_9.RD = {
            id = _key_word[2].word[_key_word[2].idx],
            func = _cross_func[L6_7]
          }
          L8_9.RL = {
            id = _key_word[3].word[_key_word[3].idx],
            func = _square_func[L6_7]
          }
          L8_9.RU = {
            id = _key_word[4].word[_key_word[4].idx],
            func = _triangle_func[L6_7]
          }
          _sensor_hdl[L6_7] = Fn_setupGestureAction(L7_8, L8_9, nil, true, true)
        end
        L3_4()
      end
      L3_4()
    end
  end
  if L3_4 ~= nil then
    if L3_4 then
      L3_4(L4_5)
    end
  end
  _bul_task = nil
  for L6_7, L7_8 in L3_4(L4_5) do
    L8_9 = _sensor_hdl
    L8_9 = L8_9[L6_7]
    L8_9 = L8_9.setActive
    L8_9(L8_9, false)
  end
  if L3_4 > 0 then
    _bul_cap_stop = true
    L3_4()
    L3_4(L4_5)
    L3_4()
    L3_4(L4_5)
  else
    L3_4()
    for L6_7, L7_8 in L3_4(L4_5) do
      L8_9 = Fn_setGestureAction
      L8_9(L6_7, false)
    end
    L3_4(L4_5)
    L3_4(L4_5, L5_6)
    L3_4(L4_5)
    L3_4(L4_5)
    L3_4()
  end
  for L6_7, L7_8 in L3_4(L4_5) do
    if L7_8 ~= nil then
      L8_9 = L7_8.isRunning
      L8_9 = L8_9(L7_8)
      if L8_9 then
        L8_9 = L7_8.abort
        L8_9(L7_8)
      end
    end
    L8_9 = _mot_task
    L8_9[L6_7] = nil
  end
  L3_4()
  L3_4()
end
function get_new_word()
  _bul_motivation = _bul_motivation + ADD_MOTIVATION
  _new_word = true
  _new_bul = true
end
function bul_motivation_sub()
  _bul_motivation = _bul_motivation - SUB_MOTIVATION
end
function bul_cap()
  return invokeTask(function()
    local L0_10
    L0_10 = false
    repeat
      if _bul_cap_stop == false and Fn_isCaptionView() == false then
        if _bul_cap_first == true then
          Fn_captionViewWait("sm50_01010")
        elseif _evidence_weapon == true and _evidence_suspicion == true then
          if L0_10 == false then
            Fn_captionViewWait("sm50_01036")
            L0_10 = true
          else
            Fn_captionViewWait("sm50_01011")
            L0_10 = false
          end
        elseif _evidence_weapon == true and _bul_motivation > 50 then
          if L0_10 == false then
            Fn_captionViewWait("sm50_01037")
            L0_10 = true
          else
            Fn_captionViewWait("sm50_01038")
            L0_10 = false
          end
        elseif _new_bul == true then
          _new_bul = false
          Fn_captionViewWait("sm50_01029")
        elseif _clear_point < 3 then
          if _bul_motivation <= 20 then
            Fn_captionViewWait("sm50_01030")
          elseif _bul_motivation <= 40 then
            Fn_captionViewWait("sm50_01031")
          elseif _bul_motivation <= 60 then
            Fn_captionViewWait("sm50_01032")
          elseif _bul_motivation <= 80 then
            Fn_captionViewWait("sm50_01033")
          else
            Fn_captionViewWait("sm50_01034")
          end
        elseif _bul_motivation <= 20 then
          Fn_captionViewWait("sm50_01012")
        elseif _bul_motivation <= 40 then
          Fn_captionViewWait("sm50_01013")
        elseif _bul_motivation <= 60 then
          Fn_captionViewWait("sm50_01014")
        elseif _bul_motivation <= 80 then
          Fn_captionViewWait("sm50_01015")
        else
          Fn_captionViewWait("sm50_01016")
        end
      end
      _time_cnt = 0
      _time_limit = RandF(10, 20)
      repeat
        _time_cnt = _time_cnt + 1
        waitSeconds(1)
      until _time_limit < _time_cnt
    until false
  end)
end
function kit_cap(A0_11)
  invokeTask(function()
    _bul_cap_stop = true
    Fn_captionViewWait(A0_11)
    waitSeconds(1)
    _bul_cap_stop = false
  end)
end
function new_word_hint(A0_12, A1_13)
  if A1_13 ~= nil then
    _bul_cap_stop = true
    Fn_lookAtTargetInput(Fn_findNpcPuppet("bul01"), 1)
    Fn_turnNpc("bul01")
    waitSeconds(0.5)
    Fn_kaiwaDemoView(A1_13)
    waitSeconds(0.5)
    _bul_cap_stop = false
  end
  Sound:pulse("success")
  kit_cap(A0_12)
end
function final_word_hint(A0_14)
  if _final_word == false and _evidence_weapon == true and _evidence_suspicion == true then
    _bul_cap_stop = true
    Fn_lookAtTargetInput(Fn_findNpcPuppet("bul01"), 1)
    Fn_turnNpc("bul01")
    waitSeconds(0.5)
    Fn_kaiwaDemoView("sm50_00595k")
    waitSeconds(0.5)
    _bul_cap_stop = false
    _final_word = true
  else
    Sound:pulse("success")
    kit_cap(A0_14)
  end
end
function start_gesture_kaiwa(A0_15, A1_16, A2_17, A3_18)
  _bul_cap_stop = true
  _new_bul = false
  Fn_gestureActionCancel()
  Fn_userCtrlOff()
  Fn_captionViewEnd()
  _bul_cap_first = false
  Player:setLookAtIk(true, 1, Fn_findNpcPuppet(A0_15):getWorldPos())
  Fn_turnNpc(A0_15, nil, A3_18)
  Fn_playPlayerMotion(A2_17, 0, 0.3)
  waitSeconds(0.5)
  if A2_17 == "kit01_point_00" then
    Sound:playSE("kit_802", 1)
  else
    Sound:playSE(({
      "kit026",
      "kit026",
      "kit026_1",
      "kit028"
    })[RandI(1, #{
      "kit026",
      "kit026",
      "kit026_1",
      "kit028"
    })], 1)
  end
  invokeTask(function()
    Fn_playMotionNpc(A0_15, A1_16, true)
  end)
  waitSeconds(1)
end
function end_gesture_kaiwa(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = _sensor_hdl
  L2_21 = L2_21[A1_20]
  L3_22 = L2_21
  L2_21 = L2_21.getPos
  L2_21 = L2_21(L3_22)
  L3_22 = _sensor_hdl
  L3_22 = L3_22[A1_20]
  L3_22 = L3_22.setPos
  L3_22(L3_22, Vector(0, -15, 0))
  L3_22 = _sensor_hdl
  L3_22 = L3_22[A1_20]
  L3_22 = L3_22.setForceMove
  L3_22(L3_22)
  L3_22 = wait
  L3_22()
  L3_22 = _sensor_hdl
  L3_22 = L3_22[A1_20]
  L3_22 = L3_22.setPos
  L3_22(L3_22, L2_21)
  L3_22 = _sensor_hdl
  L3_22 = L3_22[A1_20]
  L3_22 = L3_22.setForceMove
  L3_22(L3_22)
  L3_22 = Fn_userCtrlOn
  L3_22()
  L3_22 = "locator2_cam_01"
  Player:setLookAtIk(false, 1, Fn_findNpcPuppet(A1_20):getWorldPos())
  Fn_turnNpc(A1_20, L3_22)
  _bul_cap_stop = false
  _time_cnt = _time_limit
end
function _circle_func.npcgen2_man82_01()
  start_gesture_kaiwa("npcgen2_man82_01", "reply_yes", "kit01_greeting_00")
  if _evidence_weapon == true then
    Fn_kaiwaDemoView("sm50_00210k")
  else
    Fn_kaiwaDemoView("sm50_00200k")
  end
  end_gesture_kaiwa("_man82_01_sensor", "npcgen2_man82_01")
end
function _circle_func.npcgen2_man31_01()
  start_gesture_kaiwa("npcgen2_man31_01", "reply_yes", "kit01_greeting_00")
  Fn_kaiwaDemoView("sm50_00400k")
  end_gesture_kaiwa("_man31_01_sensor", "npcgen2_man31_01")
end
function _circle_func.npcgen2_man81_01()
  start_gesture_kaiwa("npcgen2_man81_01", "reply_yes", "kit01_greeting_00")
  Fn_kaiwaDemoView("sm50_00300k")
  end_gesture_kaiwa("_man81_01_sensor", "npcgen2_man81_01")
end
function _circle_func.sm50_client()
  start_gesture_kaiwa("sm50_client", "reply_yes", "kit01_greeting_00")
  if _evidence_weapon == true then
    Fn_kaiwaDemoView("sm50_00510k")
  else
    Fn_kaiwaDemoView("sm50_00500k")
  end
  end_gesture_kaiwa("sm50_client_sensor", "sm50_client")
end
function _cross_func.npcgen2_man82_01()
  start_gesture_kaiwa("npcgen2_man82_01", "reply_yes", "kit01_greeting_00")
  if _key_word[2].idx == 1 then
    Fn_kaiwaDemoView("sm50_00220k")
  elseif _key_word[2].idx == 2 then
    Fn_kaiwaDemoView("sm50_00230k")
  else
    Fn_kaiwaDemoView("sm50_00240k")
    if _evidence_suspicion == false then
      _evidence_suspicion = true
      _bul_motivation = _bul_motivation + ADD_MOTIVATION
      final_word_hint("sm50_01017")
    end
  end
  end_gesture_kaiwa("_man82_01_sensor", "npcgen2_man82_01")
end
function _cross_func.npcgen2_man31_01()
  start_gesture_kaiwa("npcgen2_man31_01", "reply_yes", "kit01_greeting_00")
  if _key_word[2].idx == 1 then
    Fn_kaiwaDemoView("sm50_00420k")
    new_word_hint("sm50_01018", "sm50_00425k")
    get_new_word()
    _key_word[2].idx = 2
  elseif _key_word[2].idx == 2 then
    Fn_kaiwaDemoView("sm50_00430k")
  else
    Fn_kaiwaDemoView("sm50_00440k")
    if _evidence_suspicion == false then
      _evidence_suspicion = true
      _bul_motivation = _bul_motivation + ADD_MOTIVATION
      final_word_hint("sm50_01019")
    end
  end
  end_gesture_kaiwa("_man31_01_sensor", "npcgen2_man31_01")
end
function _cross_func.npcgen2_man81_01()
  start_gesture_kaiwa("npcgen2_man81_01", "reply_yes", "kit01_greeting_00")
  if _key_word[2].idx == 1 then
    Fn_kaiwaDemoView("sm50_00320k")
  elseif _key_word[2].idx == 2 then
    Fn_kaiwaDemoView("sm50_00330k")
    new_word_hint("sm50_01020", "sm50_00335k")
    get_new_word()
    _key_word[2].idx = 3
  else
    Fn_kaiwaDemoView("sm50_00340k")
  end
  end_gesture_kaiwa("_man81_01_sensor", "npcgen2_man81_01")
end
function _cross_func.sm50_client()
  start_gesture_kaiwa("sm50_client", "reply_yes", "kit01_greeting_00")
  if _key_word[2].idx == 1 then
    Fn_kaiwaDemoView("sm50_00520k")
  elseif _key_word[2].idx == 2 then
    Fn_kaiwaDemoView("sm50_00530k")
  else
    Fn_kaiwaDemoView("sm50_00540k")
  end
  end_gesture_kaiwa("sm50_client_sensor", "sm50_client")
end
function _square_func.npcgen2_man82_01()
  start_gesture_kaiwa("npcgen2_man82_01", "reply_yes", "kit01_greeting_00")
  if _key_word[3].idx == 1 then
    Fn_kaiwaDemoView("sm50_00250k")
    new_word_hint("sm50_01021", "sm50_00255k")
    get_new_word()
    _key_word[3].idx = 2
  elseif _key_word[3].idx == 2 then
    Fn_kaiwaDemoView("sm50_00260k")
  elseif _key_word[3].idx == 3 then
    Fn_kaiwaDemoView("sm50_00270k")
    new_word_hint("sm50_01022", "sm50_00275k")
    get_new_word()
    _key_word[3].idx = 4
  elseif _key_word[3].idx == 4 then
    if _key_word[2].idx == 1 then
      Fn_kaiwaDemoView("sm50_00280k")
    elseif _evidence_weapon == false then
      _evidence_weapon = true
      Fn_kaiwaDemoView("sm50_00285k")
      final_word_hint("sm50_01023")
      _bul_motivation = _bul_motivation + ADD_MOTIVATION
    else
      Fn_kaiwaDemoView("sm50_00290k")
    end
  end
  end_gesture_kaiwa("_man82_01_sensor", "npcgen2_man82_01")
end
function _square_func.npcgen2_man31_01()
  start_gesture_kaiwa("npcgen2_man31_01", "reply_yes", "kit01_greeting_00")
  if _key_word[3].idx == 1 then
    Fn_kaiwaDemoView("sm50_00450k")
  elseif _key_word[3].idx == 2 then
    Fn_kaiwaDemoView("sm50_00460k")
    new_word_hint("sm50_01024", "sm50_00465k")
    get_new_word()
    _key_word[3].idx = 3
  elseif _key_word[3].idx == 3 then
    Fn_kaiwaDemoView("sm50_00470k")
  elseif _key_word[3].idx == 4 then
    if _key_word[2].idx == 1 then
      Fn_kaiwaDemoView("sm50_00480k")
    elseif _evidence_weapon == false then
      _evidence_weapon = true
      Fn_kaiwaDemoView("sm50_00485k")
      final_word_hint("sm50_01025")
      _bul_motivation = _bul_motivation + ADD_MOTIVATION
    else
      Fn_kaiwaDemoView("sm50_00490k")
    end
  end
  end_gesture_kaiwa("_man31_01_sensor", "npcgen2_man31_01")
end
function _square_func.npcgen2_man81_01()
  start_gesture_kaiwa("npcgen2_man81_01", "reply_yes", "kit01_greeting_00")
  if _key_word[3].idx == 1 then
    Fn_kaiwaDemoView("sm50_00350k")
    new_word_hint("sm50_01021", "sm50_00255k")
    get_new_word()
    _key_word[3].idx = 2
  elseif _key_word[3].idx == 2 then
    Fn_kaiwaDemoView("sm50_00360k")
  elseif _key_word[3].idx == 3 then
    Fn_kaiwaDemoView("sm50_00370k")
  elseif _key_word[3].idx == 4 then
    if _evidence_weapon == false then
      Fn_kaiwaDemoView("sm50_00380k")
    else
      Fn_kaiwaDemoView("sm50_00390k")
    end
  end
  end_gesture_kaiwa("_man81_01_sensor", "npcgen2_man81_01")
end
function _square_func.sm50_client()
  start_gesture_kaiwa("sm50_client", "reply_yes", "kit01_greeting_00")
  if _key_word[3].idx == 1 then
    Fn_kaiwaDemoView("sm50_00550k")
  elseif _key_word[3].idx == 2 then
    Fn_kaiwaDemoView("sm50_00560k")
    new_word_hint("sm50_01024", "sm50_00465k")
    get_new_word()
    _key_word[3].idx = 3
  elseif _key_word[3].idx == 3 then
    Fn_kaiwaDemoView("sm50_00570k")
    new_word_hint("sm50_01022", "sm50_00275k")
    get_new_word()
    _key_word[3].idx = 4
  elseif _key_word[3].idx == 4 then
    if _evidence_weapon == false then
      Fn_kaiwaDemoView("sm50_00580k")
    else
      Fn_kaiwaDemoView("sm50_00590k")
    end
  end
  end_gesture_kaiwa("sm50_client_sensor", "sm50_client")
end
function _triangle_func.npcgen2_man82_01()
  if _evidence_suspicion == true and _evidence_weapon == true then
    if _clear_flag == false then
      _clear_flag = true
      _bul_motivation = _bul_motivation + ADD_MOTIVATION
    end
  else
    start_gesture_kaiwa("npcgen2_man82_01", {
      "shock_in_00",
      "shock_00"
    }, "kit01_point_00")
    if _evidence_suspicion == true and _evidence_weapon == false then
      Fn_kaiwaDemoView("sm50_00600k")
    else
      Fn_kaiwaDemoView("sm50_00610k")
    end
    bul_motivation_sub()
    Fn_playMotionNpc("npcgen2_man82_01", "shock_out_00", true)
    end_gesture_kaiwa("_man82_01_sensor", "npcgen2_man82_01")
  end
end
function _triangle_func.npcgen2_man31_01()
  start_gesture_kaiwa("npcgen2_man31_01", {
    "shock_in_00",
    "shock_00"
  }, "kit01_point_00")
  if (_key_word[2].idx == 2 or _key_word[2].idx == 3) and (_key_word[3].idx == 2 or _key_word[3].idx == 3 or _key_word[3].idx == 4) and _evidence_weapon == false then
    Fn_kaiwaDemoView("sm50_00650k")
  else
    Fn_kaiwaDemoView("sm50_00660k")
  end
  bul_motivation_sub()
  Fn_playMotionNpc("npcgen2_man31_01", "shock_out_00", true)
  end_gesture_kaiwa("_man31_01_sensor", "npcgen2_man31_01")
end
function _triangle_func.npcgen2_man81_01()
  start_gesture_kaiwa("npcgen2_man81_01", {
    "shock_in_00",
    "shock_00"
  }, "kit01_point_00")
  if _key_word[2].idx == 3 and (_key_word[3].idx == 1 or _key_word[3].idx == 2) then
    Fn_kaiwaDemoView("sm50_00620k")
  elseif _key_word[2].idx == 3 and (_key_word[3].idx == 3 or _key_word[3].idx == 4) and _evidence_weapon == false then
    Fn_kaiwaDemoView("sm50_00630k")
  else
    Fn_kaiwaDemoView("sm50_00640k")
  end
  bul_motivation_sub()
  Fn_playMotionNpc("npcgen2_man81_01", "shock_out_00", true)
  end_gesture_kaiwa("_man81_01_sensor", "npcgen2_man81_01")
end
function _triangle_func.sm50_client()
  start_gesture_kaiwa("sm50_client", {
    "shock_in_00",
    "shock_00"
  }, "kit01_point_00")
  Fn_kaiwaDemoView("sm50_00670k")
  bul_motivation_sub()
  Fn_playMotionNpc("sm50_client", "shock_out_00", true)
  end_gesture_kaiwa("sm50_client_sensor", "sm50_client")
end
function Finalize()
  local L0_23, L1_24
end
function pccubesensor2_outrange_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_outrange_02_OnLeave(A0_25)
  A0_25:setActive(false)
  Fn_pcSensorOn("pccubesensor2_outrange_03")
  cap_on = invokeTask(function()
    repeat
      Fn_captionViewWait("sm50_01035")
      waitSeconds(RandF(10, 20))
    until false
  end)
end
function pccubesensor2_outrange_03_OnEnter(A0_26)
  A0_26:setActive(false)
  Fn_pcSensorOn("pccubesensor2_outrange_02")
  if cap_on ~= nil then
    cap_on:abort()
    cap_pn = nil
  end
end
