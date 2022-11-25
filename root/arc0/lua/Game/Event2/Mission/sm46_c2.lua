import("Area")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm46_common.lua")
WORKER_PART_MAX = 5
WORKER_BT_TALK_CHARA = 6
WORKER_END_TALK_CHARA = 4
VGEM_MAX = 5
FOUNTAIN_RAY_DIST = 70
GESTURE_TIME = 2
_puppet_tbl = {}
_gesture = nil
_target_find_flag = false
_decide_flag = false
_cancel_flag = false
_break_flag = false
_npc_atari_flag = false
_npc_se_hdl = nil
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_c2_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_fountain_find_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_fountain_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_gesture_area_01")
  L0_0 = {
    {
      name = "fa01",
      type = "man07",
      node = "locator2_fa_start_c2_01",
      reset = false
    },
    {
      name = "son01",
      type = "man83",
      node = "locator2_son_start_c2_01"
    },
    {
      name = "no_wom45",
      type = "wom45",
      node = "locator2_no_wom45_01",
      active = false
    },
    {
      name = "no_man08",
      type = "man08",
      node = "locator2_no_man08_01",
      active = false
    },
    {
      name = "yes_wom03",
      type = "wom03",
      node = "locator2_yes_wom03_01",
      active = false
    },
    {
      name = "worker01",
      type = "man10",
      node = "locator2_worker_c2_01",
      reset = false
    },
    {
      name = "worker02",
      type = "man25",
      node = "locator2_worker_c2_02",
      reset = false
    },
    {
      name = "worker03",
      type = "man26",
      node = "locator2_worker_c2_03",
      reset = false
    },
    {
      name = "worker04",
      type = "man08",
      node = "locator2_worker_c2_04",
      reset = false
    },
    {
      name = "worker05",
      type = "man02",
      node = "locator2_worker_c2_05",
      reset = false
    },
    {
      name = "worker06",
      type = "man09",
      node = "locator2_worker_c2_06",
      reset = false
    },
    {
      name = "worker07",
      type = "man10",
      node = "locator2_worker_c2_07",
      reset = false
    },
    {
      name = "worker08",
      type = "man25",
      node = "locator2_worker_c2_08",
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_5_, _FORV_6_ in pairs(L0_0) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  fa_npc = Fn_findNpc("fa01")
  son_npc = Fn_findNpc("son01")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  _sdemo_cut01 = SDemo.create("sm46_c_cut01")
  setCatWarpPhase(CATWARP_PHASE01)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = Fn_loadNpcEventMotion
  L1_2 = "son01"
  L2_3 = _WORK_MOTION
  L0_1(L1_2, L2_3)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = set_npc_memo
  L1_2 = "son01"
  L0_1(L1_2)
  L0_1 = playNpcMotion
  L1_2 = _worker_motion
  L2_3 = nil
  L0_1(L1_2, L2_3)
  L0_1 = Fn_playMotionNpc
  L1_2 = "fa01"
  L2_3 = "stay_01"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = waitSeconds
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "sm46_01300k"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_fountain_find_01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_warning_03"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_area_03"
  L0_1(L1_2)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_setGrabNpc
  L1_2 = "fa01"
  L2_3 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Mv_createNpcGrabSensor
  L1_2 = "fa01"
  L0_1 = L0_1(L1_2)
  L2_3 = L0_1
  L1_2 = L0_1.setActive
  L1_2(L2_3, L3_4)
  L1_2 = clientGrabWait
  L2_3 = "fa01"
  L1_2(L2_3)
  L2_3 = L0_1
  L1_2 = L0_1.setActive
  L1_2(L2_3, L3_4)
  L1_2 = waitSeconds
  L2_3 = GRAB_VIEW_WAIT
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_guide_c2_01"
  L1_2(L2_3)
  L1_2 = comStopViewCap
  L2_3 = "locator2_navi_fountain_01"
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Fn_missionViewWait
  L2_3 = "sm46_02002"
  L1_2(L2_3)
  L1_2 = invokeTask
  function L2_3()
    local L0_9
    L0_9 = 0
    while true do
      if getWarningFlag() == true then
        wait()
      else
        if L0_9 == ADVICE_TIME01 then
          Fn_captionView("sm46_02004")
        elseif L0_9 == ADVICE_TIME02 then
          comStopViewCap("locator2_navi_fountain_01", 0.3, "sm46_02005")
          L0_9 = ADVICE_TIME01
        end
        waitSeconds(1)
        L0_9 = L0_9 + 1
      end
    end
  end
  L1_2 = L1_2(L2_3)
  L2_3 = invokeTask
  L2_3 = L2_3(L3_4)
  L3_4()
  L1_2 = L3_4
  L3_4(L4_5, L5_6)
  L3_4(L4_5, L5_6)
  for L6_7 = 1, WORKER_MAX do
    L7_8 = Fn_disappearNpc
    L7_8("worker" .. string.format("%02d", L6_7))
  end
  L3_4(L4_5)
  L6_7 = "sm46_02006"
  L1_2 = L3_4
  L3_4()
  L6_7 = "g1_bench_iy_01_02"
  L4_5(L5_6)
  L1_2 = L4_5
  view_task = L4_5
  L4_5(L5_6)
  L4_5()
  L4_5()
  L4_5(L5_6)
  L4_5(L5_6)
  L6_7 = {}
  L4_5(L5_6, L6_7)
  L6_7 = "locator2_fa_pos_fountain_01"
  L4_5(L5_6, L6_7)
  L4_5(L5_6)
  L4_5(L5_6)
  L6_7 = "lookaround_01"
  L7_8 = {
    "lookaround_01"
  }
  L6_7 = L5_6
  L7_8 = "locator2_sdemo01c_cam_01"
  L5_6(L6_7, L7_8, "locator2_sdemo01c_aim_01", false)
  L6_7 = L5_6
  L5_6(L6_7)
  L6_7 = 3
  L5_6(L6_7)
  L6_7 = 0.5
  L5_6(L6_7)
  L6_7 = {L7_8}
  L7_8 = {}
  L7_8.pos = "locator2_sdemo01c_cam_02"
  L7_8.time = L5_6
  L7_8.hashfunc = "Cosine"
  L7_8 = {
    {
      pos = "locator2_sdemo01c_aim_02",
      time = L5_6,
      hashfunc = "Cosine"
    }
  }
  _sdemo_cut01:play(L6_7, L7_8)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  waitSeconds(0.5)
  _sdemo_cut01:stop()
  Fn_pcSensorOn("pccubesensor2_gesture_area_01")
  Fn_kaiwaDemoView("sm46_01400k")
  Fn_userCtrlOn()
  Fn_missionView("sm46_02007")
  _gesture:run()
  _gesture:resetCount()
  Mv_waitPhase()
  Fn_sendEventComSb("playAccordion")
  _gesture:stop()
  Fn_pcSensorOff("pccubesensor2_gesture_area_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_03")
  Fn_pcSensorOn("pccubesensor2_catwarp_area_03")
  Fn_captionView("sm46_02014")
  playerCoerctionStop(PT_BRAKE, CTRL_ON, false, 1)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensor2_catwarp_warning_03_OnEnter()
  killWarningNavi()
end
function pccubesensor2_catwarp_warning_03_OnLeave()
  if getCatWarpPhase == CATWARP_PHASE1 then
    comCatWarpWarning("sm46_02010", "locator2_warning_navi_03")
  else
    comCatWarpWarning("sm46_02015", "locator2_warning_navi_03")
  end
end
function pccubesensor2_catwarp_area_03_OnLeave()
  catwarpFunc("fa01", "locator2_fa_start_c2_01")
end
function pccubesensor2_fountain_find_01_OnEnter(A0_10)
  Fn_pcSensorOff(A0_10)
  if _target_find_flag ~= true then
    _target_find_flag = true
    Mv_gotoNextPhase()
  end
end
function pccubesensor2_fountain_area_01_OnEnter(A0_11)
  comKillNavi()
  Fn_pcSensorOff(A0_11)
  Mv_gotoNextPhase()
end
function pccubesensor2_gesture_area_01_OnLeave()
  comGuideFunc("sm46_02011", "locator2_navi_fountain_01")
  if _gesture ~= nil then
    _gesture:stop()
  end
end
function pccubesensor2_gesture_area_01_OnEnter()
  if _gesture ~= nil then
    _gesture:run()
  end
  killWarningNavi()
end
_mob_txt = {
  wom03 = {
    known_kaiwa = "sm46_01520k",
    reply_caption_skip = true,
    reply_yes = {text = nil, time = nil},
    reply_no = {
      text = "sm46_02013",
      time = GESTURE_TIME
    }
  },
  wom45 = {
    unknown_kaiwa = "sm46_01500k",
    reply_caption_skip = true,
    reply_yes = {text = nil, time = nil},
    reply_no = {
      text = "sm46_02013",
      time = GESTURE_TIME
    }
  },
  man08 = {
    unknown_kaiwa = "sm46_01510k",
    reply_caption_skip = true,
    reply_yes = {text = nil, time = nil},
    reply_no = {
      text = "sm46_02013",
      time = GESTURE_TIME
    }
  },
  other = {
    {
      reply_yes = {
        text = "sm46_02013",
        time = GESTURE_TIME
      },
      reply_no = {
        text = "sm46_02013",
        time = GESTURE_TIME
      }
    }
  }
}
_npc_kaiwa_table = {
  fa01 = {
    cnt = 0,
    kaiwa = "",
    answer = true
  },
  no_wom45 = {
    cnt = 0,
    kaiwa = "sm46_01500k",
    answer = false
  },
  no_man08 = {
    cnt = 0,
    kaiwa = "sm46_01510k",
    answer = false
  },
  yes_wom03 = {
    cnt = 0,
    kaiwa = "sm46_01520k",
    answer = true
  },
  other = {reply_no = "sm46_02013"}
}
function gestureStandby()
  local L0_12, L1_13
  L0_12 = GestureEvent
  L0_12 = L0_12.create
  L1_13 = "ui_event_guide_02"
  L0_12 = L0_12(L1_13, gestureCancelFunc, gestureBreakFunc, gestureNpcActionCallback)
  _gesture = L0_12
  L0_12 = {}
  L1_13 = _gesture
  L1_13 = L1_13.setNaviTarget
  L1_13(L1_13, nil, nil, {
    classGroup = "yy_navi_sm46_all",
    pointing = false,
    positiveRate = 0
  })
  L1_13 = _gesture
  L1_13 = L1_13.setAsking
  L1_13(L1_13, false)
  L1_13 = _gesture
  L1_13 = L1_13.setNpc
  L1_13(L1_13, {
    _puppet_tbl.fa01,
    _puppet_tbl.no_wom45,
    _puppet_tbl.no_man08,
    _puppet_tbl.yes_wom03
  })
  L1_13 = _gesture
  L1_13 = L1_13.setMobText
  L1_13(L1_13, _mob_txt)
  function L1_13(A0_14)
    if A0_14.className == "wom45" and A0_14.stdAppearance == true then
      if _npc_kaiwa_table.no_wom45.cnt == 0 then
        _npc_kaiwa_table.no_wom45.cnt = 1
      else
        print("\228\184\128\229\186\166NPC\227\129\168\227\129\151\227\129\166\232\169\177\227\129\151\227\129\159")
        return true
      end
    elseif A0_14.className == "man08" and A0_14.stdAppearance == true then
      if _npc_kaiwa_table.no_man08.cnt == 0 then
        _npc_kaiwa_table.no_man08.cnt = 1
      else
        print("\228\184\128\229\186\166NPC\227\129\168\227\129\151\227\129\166\232\169\177\227\129\151\227\129\159")
        return true
      end
    elseif A0_14.className == "wom03" and A0_14.stdAppearance == false then
      print("\232\166\139\227\129\159\231\155\174\227\129\140\233\129\149\227\129\134")
      return true
    end
    return false
  end
  _gesture:setOverrideNoFunc(L1_13)
end
function gestureCancelFunc()
  print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\173\227\131\163\227\131\179\227\130\187\227\131\171")
  _decide_flag = true
  return _cancel_flag
end
function gestureBreakFunc()
  print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\129\174\231\160\180\229\163\138")
  return _break_flag
end
function gestureNpcActionCallback(A0_15)
  local L1_16, L2_17, L3_18
  if A0_15 then
    L2_17 = A0_15
    L1_16 = A0_15.getName
    L1_16 = L1_16(L2_17)
    L3_18 = A0_15
    L2_17 = A0_15.getTypeName
    L2_17 = L2_17(L3_18)
    L3_18 = print
    L3_18("\227\129\170\227\129\190\227\129\136:" .. tostring(L1_16) .. ":" .. tostring(L2_17))
    L3_18 = Fn_userCtrlOff
    L3_18()
    L3_18 = A0_15.getWorldPos
    L3_18 = L3_18(A0_15)
    L3_18 = L3_18 + Vector(0, 1.6, 0)
    Player:setLookAtIk(true, 1, L3_18)
    if L1_16 == "no_wom45" and _npc_kaiwa_table.no_wom45.cnt == 0 then
      Fn_playMotionNpc("no_wom45", "sit_out_00", true)
      waitSeconds(1)
    end
    Fn_turnNpc(L1_16)
    waitSeconds(0.5)
    if _npc_kaiwa_table[L1_16].cnt == 0 then
      _npc_kaiwa_table[L1_16].cnt = 1
      if L1_16 == "fa01" then
        Fn_captionView("sm46_02016")
        Fn_playMotionNpc(L1_16, "reply_no", false)
      elseif _npc_kaiwa_table[L1_16].answer == true then
        Fn_kaiwaDemoView(_npc_kaiwa_table[L1_16].kaiwa)
        _npc_atari_flag = true
      else
        Fn_kaiwaDemoView(_npc_kaiwa_table[L1_16].kaiwa)
        Fn_playMotionNpc(L1_16, "reply_no", false)
      end
      Player:setLookAtIk(false, 1, L3_18)
    else
      Fn_playMotionNpc(L1_16, "reply_no", false)
      Fn_captionView("sm46_02013")
    end
    Fn_userCtrlOn()
  end
end
function pccubesensor2_guide_c2_01_OnEnter()
  local L0_19, L1_20
end
function pccubesensor2_guide_c2_01_OnLeave()
  Fn_captionView("sm46_02017")
end
