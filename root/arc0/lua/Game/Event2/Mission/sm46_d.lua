dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm46_common.lua")
FA01_DIST01 = 6
AUDIENCE_MAX = 9
VIEW_ANGLE = 180
POSE_TIME_MIN = 10
POSE_TIME_MAX = 20
MC_STREET_DIST = 15
MC_STREET_RAY_DIST = 35
NEAR_OLD_DIST01 = 40
NEAR_OLD_DIST02 = NEAR_OLD_DIST01 + 15
CAPTION_PHASE00 = 0
CAPTION_PHASE01 = 1
CAPTION_PHASE02 = 2
CAPTION_PHASE03 = 3
VOICE_FA01 = 2
VOICE_KIT = 1
VOICE_JOY = 1
VOICE_ANGER = 2
VOICE_SAD = 3
GUIDE_LEAVE_DIST01 = 60
GUIDE_NEAR_DIST01 = 5
_FA01_MOTION = {
  sm46_pose = "man01_listen_sm46_00"
}
_wom_listen_Pose = {
  watch = "wom01_watching_soft_00",
  listen = "wom01_listen_00"
}
_puppet_tbl = {}
_mc_street_flag = {
  sensor_cap = false,
  find_sensor = false,
  event_cap_flag = false
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_d_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_mc_street_out_upside_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_mc_street_out_underside_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_mc_street_find_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_mc_street_goal_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_04")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_04")
  L0_0 = {
    {
      name = "fa01",
      type = "man07",
      node = "locator2_fa_start_d_01",
      reset = false
    },
    {
      name = "son01",
      type = "man83",
      node = "locator2_son_start_d_01",
      active = false,
      reset = false
    },
    {
      name = "no_wom45",
      type = "wom45",
      node = "locator2_no_wom45d_01",
      reset = false
    },
    {
      name = "no_man08",
      type = "man08",
      node = "locator2_no_man08d_01",
      reset = false
    },
    {
      name = "yes_wom03",
      type = "wom03",
      node = "locator2_yes_wom03d_01",
      reset = false
    },
    {
      name = "accordion01",
      type = "ciaccordion01",
      node = "locator2_ciaccordion_01"
    },
    {
      name = "musician01",
      type = "man64",
      node = "locator2_musician_01"
    },
    {
      name = "audience01",
      type = "wom01",
      node = "locator2_audience_01"
    },
    {
      name = "audience02",
      type = "man71",
      node = "locator2_audience_02"
    },
    {
      name = "audience03",
      type = "wom04",
      node = "locator2_audience_03"
    },
    {
      name = "audience04",
      type = "man82",
      node = "locator2_audience_04"
    },
    {
      name = "audience05",
      type = "wom46",
      node = "locator2_audience_05"
    },
    {
      name = "audience06",
      type = "man18",
      node = "locator2_audience_06"
    },
    {
      name = "audience07",
      type = "wom38",
      node = "locator2_audience_07"
    },
    {
      name = "audience08",
      type = "wom40",
      node = "locator2_audience_08"
    },
    {
      name = "audience09",
      type = "man70",
      node = "locator2_audience_09"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_5_, _FORV_6_ in pairs(L0_0) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  _sdemo_cut01 = SDemo.create("sm46_d_cut01")
  _sdemo_cut02 = SDemo.create("sm46_d_cut02")
  _polydemo = PDemo.create("sm46_a_c01", Fn_findAreaHandle("cc_a_root"), {scene_param = false, no_se = true})
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  setCatWarpPhase(CATWARP_PHASE01)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16
  L0_1 = Fn_repeatPlayMotion
  L1_2 = "fa01"
  L2_3 = "lookaround_01"
  L3_4 = {L4_5}
  L4_5 = "lookaround_01"
  L0_1 = L0_1(L1_2, L2_3, L3_4)
  L1_2 = Fn_findNpc
  L2_3 = "musician01"
  L1_2 = L1_2(L2_3)
  L2_3 = L1_2
  L1_2 = L1_2.setPilots
  L3_4 = {L4_5}
  L4_5 = {}
  L5_6 = _puppet_tbl
  L5_6 = L5_6.accordion01
  L4_5.pilot = L5_6
  L4_5.attach = "bn_spine1"
  L1_2(L2_3, L3_4)
  L1_2 = {}
  L2_3 = {
    L3_4,
    L4_5,
    L5_6,
    L6_7,
    L7_8,
    L8_9,
    L9_10,
    L10_11,
    L11_12
  }
  L3_4 = {L4_5}
  L4_5 = "talk_03"
  L4_5 = {L5_6}
  L5_6 = "handclap"
  L5_6 = {L6_7}
  L6_7 = "talk_01"
  L6_7 = {L7_8, L8_9}
  L7_8 = "photo_00"
  L8_9 = "photo_02"
  L7_8 = {L8_9}
  L8_9 = "handclap"
  L8_9 = {L9_10, L10_11}
  L9_10 = "stay_02"
  L10_11 = "stay_01"
  L9_10 = {L10_11}
  L10_11 = "photo_03"
  L10_11 = {L11_12}
  L11_12 = "photo_01"
  L11_12 = {L12_13, L13_14}
  L3_4 = Fn_repeatPlayMotion
  L4_5 = "musician01"
  L5_6 = "accordion_00"
  L6_7 = {L7_8}
  L7_8 = "accordion_00"
  L3_4 = L3_4(L4_5, L5_6, L6_7)
  L4_5 = invokeTask
  function L5_6()
    local L0_17, L1_18, L2_19, L3_20
    for L3_20 = 1, AUDIENCE_MAX do
      L1_2[L3_20] = Fn_repeatPlayMotion("audience" .. string.format("%02d", L3_20), "talk_03", L2_3[L3_20], POSE_TIME_MIN, POSE_TIME_MAX)
      waitSeconds(0.2 * (L3_20 % 3 + 1))
    end
  end
  L4_5(L5_6)
  L4_5 = Fn_playMotionNpc
  L5_6 = "no_wom45"
  L6_7 = "sit_00"
  L7_8 = false
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = Fn_playMotionNpc
  L5_6 = "no_man08"
  L6_7 = "stay_02"
  L4_5(L5_6, L6_7)
  L4_5 = Fn_playMotionNpc
  L5_6 = "yes_wom03"
  L6_7 = "stay_02"
  L4_5(L5_6, L6_7)
  L4_5 = benchNoGrab
  L5_6 = "no_wom45"
  L6_7 = "g1_base_cc_b1_road"
  L7_8 = "g1_bench_iy_01_02"
  L4_5 = L4_5(L5_6, L6_7, L7_8)
  L5_6 = Fn_missionStart
  L5_6()
  L5_6 = Fn_sendEventComSb
  L6_7 = "playAccordion"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_catwarp_warning_04"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_catwarp_area_04"
  L5_6(L6_7)
  L5_6 = invokeTask
  function L6_7()
    Fn_userCtrlOn()
    Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
    Fn_missionView("sm46_03007")
    waitSeconds(NAVI_WAIT_TIME)
    comSetNavi(_puppet_tbl.fa01)
    while true do
      wait()
    end
  end
  L5_6 = L5_6(L6_7)
  L6_7 = invokeTask
  function L7_8()
    while true do
      if Fn_getDistanceToPlayer(_puppet_tbl.fa01) < FA01_DIST01 then
        Mv_gotoNextPhase()
        break
      end
      wait()
    end
  end
  L6_7 = L6_7(L7_8)
  L7_8 = Mv_waitPhase
  L7_8()
  L7_8 = comKillNavi
  L7_8()
  L7_8 = Mv_safeTaskAbort
  L8_9 = L5_6
  L7_8 = L7_8(L8_9)
  L5_6 = L7_8
  L7_8 = Mv_safeTaskAbort
  L8_9 = L6_7
  L7_8 = L7_8(L8_9)
  L6_7 = L7_8
  L7_8 = Fn_missionViewEnd
  L7_8()
  L7_8 = Fn_missionInfoEnd
  L7_8()
  L7_8 = Fn_findNpc
  L8_9 = "fa01"
  L7_8 = L7_8(L8_9)
  L8_9 = Fn_turnNpc
  L9_10 = "fa01"
  L8_9(L9_10)
  L8_9 = Fn_kaiwaDemoView
  L9_10 = "sm46_01600k"
  L8_9(L9_10)
  L8_9 = Mv_safeTaskAbort
  L9_10 = L0_1
  L8_9 = L8_9(L9_10)
  L0_1 = L8_9
  L8_9 = Fn_setGrabNpc
  L9_10 = "fa01"
  L10_11 = false
  L11_12 = false
  L8_9(L9_10, L10_11, L11_12)
  L8_9 = Mv_createNpcGrabSensor
  L9_10 = "fa01"
  L8_9 = L8_9(L9_10)
  L10_11 = L8_9
  L9_10 = L8_9.setActive
  L11_12 = true
  L9_10(L10_11, L11_12)
  L9_10 = clientGrabWait
  L10_11 = "fa01"
  L9_10(L10_11)
  L10_11 = L8_9
  L9_10 = L8_9.setActive
  L11_12 = false
  L9_10(L10_11, L11_12)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_guide_d_01"
  L9_10(L10_11)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_mc_street_out_upside_01"
  L9_10(L10_11)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_mc_street_out_underside_01"
  L9_10(L10_11)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensormulti2_mc_street_find_01"
  L9_10(L10_11)
  L9_10 = Fn_setCatWarpCheckPoint
  L10_11 = "locator2_pc_resetpos_grabwait_01"
  L9_10(L10_11)
  L9_10 = setCatWarpPhase
  L10_11 = CATWARP_PHASE02
  L9_10(L10_11)
  L9_10 = invokeTask
  function L10_11()
    Fn_missionViewWait("sm46_03008")
    waitSeconds(0.8)
    Fn_captionView("sm46_03009")
  end
  L9_10(L10_11)
  L9_10 = invokeTask
  function L10_11()
    local L0_21, L1_22
    L0_21 = 0
    L1_22 = false
    while true do
      if getWarningFlag() == true then
        wait()
      else
        waitEventCaptionFlag()
        waitSeconds(1)
        if L1_22 == false and Fn_getDistanceToPlayer("locator2_musician_01") > MUSIC_PLAY_DIST then
          Fn_captionViewEnd()
          L1_22 = true
          setEventCaptionFlag(true)
          VoicePlay(VOICE_KIT, VOICE_SAD)
          Fn_captionViewWait("sm46_03000")
          while getWarningFlag() == true do
            wait()
          end
          comStopViewConCap("locator2_musician_01", 0.2, "sm46_03001")
          setEventCaptionFlag(false)
          L0_21 = 0
        end
        if L0_21 >= ADVICE_TIME01 then
          if L1_22 == true then
            L1_22 = false
          else
            if Fn_getDistanceToPlayer("locator2_musician_01") > MUSIC_PLAY_DIST then
              comStopViewConCap("locator2_musician_01", 0.2, "sm46_03011")
            else
              VoicePlay(VOICE_KIT, VOICE_JOY)
              comStopViewConCap("locator2_musician_01", 0.2, "sm46_03010")
            end
            L0_21 = 0
          end
        end
        L0_21 = L0_21 + 1
        wait()
      end
    end
  end
  L9_10 = L9_10(L10_11)
  L10_11 = invokeTask
  function L11_12()
    local L0_23
    L0_23 = {
      findGameObject2("Node", "locator2_mc_street_target_st_01"),
      findGameObject2("Node", "locator2_mc_street_target_01"),
      findGameObject2("Node", "locator2_mc_street_target_02"),
      findGameObject2("Node", "locator2_mc_street_target_03"),
      findGameObject2("Node", "locator2_mc_street_target_04")
    }
    while true do
      if _mc_street_flag.find_sensor == true then
        if arrayRaycastCheck(L0_23, MC_STREET_RAY_DIST) == true then
          Mv_gotoNextPhase()
        elseif Fn_getDistanceToPlayer(L0_23[1]) < MC_STREET_DIST then
          Mv_gotoNextPhase()
        elseif CAPTION_PHASE00 ~= CAPTION_PHASE01 and Fn_getDistanceToPlayer(L0_23[1]) < NEAR_OLD_DIST01 then
          setEventCaptionFlag(true)
          Fn_captionViewEnd()
          VoicePlay(VOICE_KIT, VOICE_JOY)
          Fn_captionViewWait("sm46_03002")
          waitSeconds(0.2)
          VoicePlay(VOICE_FA01, VOICE_JOY)
          Fn_captionView("sm46_03003")
          waitSeconds(0.2)
          setEventCaptionFlag(false)
        end
      elseif true == true and Fn_getDistanceToPlayer(target_obj) > NEAR_OLD_DIST02 then
        setEventCaptionFlag(true)
        Fn_captionViewEnd()
        waitSeconds(1)
        VoicePlay(VOICE_FA01, VOICE_SAD)
        Fn_captionViewWait("sm46_03005")
        setEventCaptionFlag(false)
      end
      wait()
    end
  end
  L10_11 = L10_11(L11_12)
  L11_12 = Mv_waitPhase
  L11_12()
  L11_12 = clearStopFlag
  L11_12()
  L11_12 = Fn_userCtrlOn
  L11_12()
  L11_12 = Fn_pcSensorOff
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L11_12(L12_13)
  L11_12 = Mv_safeTaskAbort
  L11_12 = L11_12(L12_13)
  L9_10 = L11_12
  L11_12 = Mv_safeTaskAbort
  L11_12 = L11_12(L12_13)
  L10_11 = L11_12
  L11_12 = Fn_disappearNpc
  L11_12(L12_13)
  L11_12 = Fn_disappearNpc
  L11_12(L12_13)
  L11_12 = Fn_disappearNpc
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOn
  L11_12(L12_13)
  L11_12 = invokeTask
  L11_12 = L11_12(L12_13)
  L10_11 = L11_12
  L11_12 = Mv_waitPhase
  L11_12()
  L11_12 = Fn_pcSensorOff
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L11_12(L12_13)
  L11_12 = Fn_pcSensorOff
  L11_12(L12_13)
  L11_12 = comKillNavi
  L11_12()
  L11_12 = Mv_safeTaskAbort
  L11_12 = L11_12(L12_13)
  L4_5 = L11_12
  L11_12 = Mv_safeTaskAbort
  L11_12 = L11_12(L12_13)
  view_task = L11_12
  L11_12 = Mv_safeTaskAbort
  L11_12 = L11_12(L12_13)
  L10_11 = L11_12
  L11_12 = Fn_blackout
  L11_12()
  L11_12 = Fn_userCtrlOff
  L11_12()
  L11_12 = Fn_setGrabReleaseNpc
  L11_12(L12_13)
  L11_12 = Player
  L11_12 = L11_12.setGrabExceptionalObject
  L11_12(L12_13, L13_14)
  L11_12 = Fn_loadNpcEventMotion
  L11_12(L12_13, L13_14)
  L11_12 = Fn_warpNpc
  L11_12(L12_13, L13_14)
  L11_12 = Fn_warpNpc
  L11_12(L12_13, L13_14)
  L11_12 = Fn_resetPcPos
  L11_12(L12_13)
  L11_12 = waitSeconds
  L11_12(L12_13)
  L11_12 = Fn_playMotionNpc
  L11_12(L12_13, L13_14, L14_15)
  L11_12 = _sdemo_cut01
  L11_12 = L11_12.set
  L15_16 = false
  L11_12(L12_13, L13_14, L14_15, L15_16)
  L11_12 = _sdemo_cut01
  L11_12 = L11_12.play
  L11_12(L12_13)
  L11_12 = Fn_fadein
  L11_12(L12_13)
  L11_12 = waitSeconds
  L11_12(L12_13)
  L11_12 = Fn_kaiwaDemoView
  L11_12(L12_13)
  L11_12 = Fn_blackout
  L11_12()
  L11_12 = waitSeconds
  L11_12(L12_13)
  L11_12 = Fn_setKittenAndCatActive
  L11_12(L12_13)
  L11_12 = Fn_setNpcVisible
  L11_12(L12_13, L13_14)
  L11_12 = Fn_setNpcVisible
  L11_12(L12_13, L13_14)
  L11_12 = Fn_sendEventComSb
  L11_12(L12_13)
  while true do
    L11_12 = _polydemo
    L11_12 = L11_12.isLoading
    L11_12 = L11_12(L12_13)
    if L11_12 == false then
      L11_12 = wait
      L11_12()
    end
  end
  L11_12 = Sound
  L11_12 = L11_12.playSEHandle
  L11_12 = L11_12(L12_13, L13_14, L14_15)
  L12_13(L13_14)
  L15_16 = 0
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14, L14_15)
  L12_13()
  while true do
    if L12_13 == false then
      L12_13()
    end
  end
  L12_13()
  L12_13(L13_14, L14_15)
  L12_13(L13_14)
  L12_13(L13_14)
  L12_13(L13_14)
  L12_13(L13_14)
  L12_13(L13_14, L14_15)
  L12_13(L13_14, L14_15)
  for L15_16 = 1, AUDIENCE_MAX do
    L1_2[L15_16] = Mv_safeTaskAbort(L1_2[L15_16])
  end
  L12_13(L13_14)
  L12_13(L13_14)
  L12_13(L13_14)
  L15_16 = false
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14)
  L12_13(L13_14)
  L12_13()
  L12_13(L13_14)
  L12_13(L13_14, L14_15)
  L15_16 = "locator2_sdemo02d_aim_01"
  L12_13(L13_14, L14_15, L15_16, false)
  L12_13(L13_14)
  L12_13(L13_14, L14_15)
  L15_16 = {"stay"}
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14)
  L12_13(L13_14)
  L3_4 = L12_13
  for L15_16 = 1, AUDIENCE_MAX do
    L1_2[L15_16] = Mv_safeTaskAbort(L1_2[L15_16])
  end
  L12_13(L13_14)
  for L15_16 = 1, AUDIENCE_MAX do
    Fn_disappearNpc("audience" .. string.format("%02d", L15_16))
  end
  L12_13(L13_14)
  L12_13(L13_14)
  L12_13(L13_14)
  L15_16 = L12_13
  function L15_16()
    waitSeconds(1.4)
    Fn_turnNpc("son01", "locator2_sdemo02d_son_turn_01")
  end
  L14_15(L15_16)
  L15_16 = 2.7
  L14_15(L15_16)
  L15_16 = "sm46_02000k"
  L14_15(L15_16)
  L14_15()
  L15_16 = L14_15
  L14_15(L15_16)
  L15_16 = "locator2_pc_yumemi_d_01"
  L14_15(L15_16)
  L14_15()
  L14_15()
  L14_15()
  L14_15()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensor2_mc_street_out_upside_01_OnEnter()
  if _mc_street_flag.sensor_cap == false then
    invokeTask(function()
      _mc_street_flag.sensor_cap = true
      Fn_lookAtTargetInput("locator2_musician_01")
      VoicePlay(VOICE_KIT, VOICE_JOY)
      Fn_captionViewWait("sm46_03014")
      _mc_street_flag.sensor_cap = false
    end)
  end
end
function pccubesensor2_mc_street_out_underside_01_OnEnter()
  if _mc_street_flag.sensor_cap == false then
    invokeTask(function()
      _mc_street_flag.sensor_cap = true
      Fn_lookAtTargetInput("locator2_musician_01")
      VoicePlay(VOICE_KIT, VOICE_JOY)
      Fn_captionViewWait("sm46_03010")
      _mc_street_flag.sensor_cap = false
    end)
  end
end
function pccubesensor2_mc_street_out_underside_01_OnLeave()
  local L0_24, L1_25
end
function pccubesensormulti2_mc_street_find_01_OnEnter()
  local L1_26
  L1_26 = _mc_street_flag
  L1_26.find_sensor = true
end
function pccubesensormulti2_mc_street_find_01_OnLeave()
  local L1_27
  L1_27 = _mc_street_flag
  L1_27.find_sensor = false
end
function pccubesensor2_mc_street_goal_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_catwarp_warning_04_OnEnter()
  killWarningNavi()
end
function pccubesensor2_catwarp_warning_04_OnLeave()
  comCatWarpWarning("sm46_03015", "locator2_warning_navi_04")
end
function pccubesensor2_catwarp_area_04_OnLeave()
  catwarpFunc("fa01", "locator2_fa_start_d_01")
end
function setEventCaptionFlag(A0_28)
  local L1_29
  if A0_28 == true then
    L1_29 = _mc_street_flag
    L1_29.event_cap_flag = true
  else
    L1_29 = _mc_street_flag
    L1_29.event_cap_flag = false
  end
end
function getEventCaptionFlag()
  local L1_30
  L1_30 = _mc_street_flag
  L1_30 = L1_30.event_cap_flag
  return L1_30
end
function waitEventCaptionFlag()
  while _mc_street_flag.event_cap_flag do
    wait()
  end
  return true
end
function arrayRaycastCheck(A0_31, A1_32)
  for _FORV_5_, _FORV_6_ in pairs(A0_31) do
    if Mv_raycastCameraSight(A0_31[_FORV_5_], A1_32) == true then
      return true
    end
  end
  return false
end
function VoicePlay(A0_33, A1_34)
  if A0_33 == VOICE_FA01 then
    if A1_34 == VOICE_JOY then
      print("\232\128\129\228\186\186\227\129\174\229\150\156\227\129\179\227\131\156\227\130\164\227\130\185")
      Sound:playSE("m29_006a", 1, "", _puppet_tbl.fa01)
    elseif A1_34 == VOICE_ANGER then
      Sound:playSE("m29_914a", 1, "", _puppet_tbl.fa01)
    elseif A1_34 == VOICE_SAD then
      Sound:playSE("m29_916a", 1, "", _puppet_tbl.fa01)
    end
  elseif A1_34 == VOICE_JOY then
    Sound:playSE("kit_610", 1, "", Player:getPuppet())
  elseif A1_34 == VOICE_ANGER then
  elseif A1_34 == VOICE_SAD then
    Sound:playSE("kit_611", 1, "", Player:getPuppet())
  elseif A1_34 == VOICE_HAPPY then
  end
end
function pccubesensor2_guide_d_01_OnEnter()
  local L0_35, L1_36
end
function pccubesensor2_guide_d_01_OnLeave()
  Fn_captionView("sm46_03016")
end
