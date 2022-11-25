dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm33_common.lua")
DUSTY_MOTION = {
  STAY_TO_SIT = "dus01_stay2sit_00",
  SIT = "dus01_sit_00"
}
_puppet_tbl = {}
_tv1_bad_condition_task = nil
_tv2_bad_condition_task = nil
_mission_view_task_tv_01 = nil
_tv_01_kick_sensor_enter_task = nil
_tv_01_kick_sensor_leave_task = nil
_gesture_phase = 0
PHASE00 = 0
PHASE01 = 1
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_over_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_school_warning_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_school_over_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_tv_01_kick")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_tv_02_kick")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_near_stairs_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_in_stairs_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_school_statue_01")
  L0_0 = {
    {
      name = "sm33_waiting",
      type = "man25",
      node = "locator2_waiting",
      color_variation = 1,
      hair_variation = 0
    },
    {
      name = "man_tv_01",
      type = "man09",
      node = "locator2_man_tv_01",
      active = false
    },
    {
      name = "man_police_01",
      type = "man31",
      node = "locator2_man_police_01",
      active = false
    },
    {
      name = "dusty_01",
      type = "dus01",
      node = "locator2_dusty_01",
      active = false,
      attach = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm33_b_cut01")
  _sdemo_cut01:setCameraParam(nil, 0.1, nil)
  _sdemo_cut02 = SDemo.create("sm33_b_cut02")
  _sdemo_cut03 = SDemo.create("sm33_b_cut03")
  _sdemo_cut04 = SDemo.create("sm33_b_cut03")
  Fn_loadNpcEventMotion("dusty_01", DUSTY_MOTION)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24
  L0_1 = Fn_setCostume
  L1_2 = "kit18"
  L0_1(L1_2)
  L0_1 = Fn_disableCostumeChange
  L1_2 = true
  L0_1(L1_2)
  L0_1 = Fn_loadPlayerMotion
  L1_2 = {L2_3}
  L2_3 = "kit01_stay_00"
  L0_1(L1_2)
  L0_1 = Fn_playPlayerMotion
  L1_2 = "kit01_stay_00"
  L2_3 = 0
  L0_1(L1_2, L2_3)
  L0_1 = Fn_findNpcPuppet
  L1_2 = "sm33_client"
  L0_1 = L0_1(L1_2)
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Fn_warpNpc
  L2_3 = "sm33_client"
  L3_4 = "locator2_newt_01b"
  L1_2(L2_3, L3_4)
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = invokeTask
  function L2_3()
    while true do
      if Fn_getDistanceToPlayer("locator2_school_camera_01") <= 200 and Fn_sendEventComSb("isRetryPhaseFlag") == false then
        closeSchoolGates()
      end
      wait()
    end
  end
  L1_2(L2_3)
  L1_2 = invokeTask
  function L2_3()
    local L0_25, L1_26
    L0_25 = Fn_playMotionNpc
    L1_26 = "sm33_client"
    L0_25(L1_26, "greeting", true)
    L0_25 = {
      L1_26,
      "locator2_newt_move_02"
    }
    L1_26 = "locator2_newt_move_01"
    L1_26 = Fn_moveNpc
    L1_26 = L1_26("sm33_client", L0_25)
    waitSeconds(8)
    invokeTask(function()
      while L1_26:isRunning() do
        wait()
      end
      if Fn_findNpc("sm33_client") ~= nil and Fn_findNpc("sm33_waiting") ~= nil then
        Fn_playMotionNpc("sm33_client", "greeting", false)
        waitSeconds(0.5)
        Fn_turnNpc("sm33_waiting", "locator2_newt_move_02")
        Fn_playLoopMotionRand("sm33_client", {"talk_00", "talk_03"}, 5, 10)
        Fn_playLoopMotionRand("sm33_waiting", {"talk_01", "talk_00"}, 5, 10)
      end
    end)
    while Fn_isInSightTarget(L0_1, 1.5) ~= false or not (Fn_getDistanceToPlayer(L0_1) > 23) or Fn_isInSightTarget(_puppet_tbl.sm33_waiting, 1.5) ~= false or not (Fn_getDistanceToPlayer(_puppet_tbl.sm33_waiting) > 23) do
      wait()
    end
    Fn_setNpcActive("sm33_client", false)
    Fn_disappearNpc("sm33_waiting")
  end
  L1_2(L2_3)
  L1_2 = Mv_invokeMissionViewNaviCaption
  L2_3 = "sm33_01000"
  L3_4 = nil
  L4_5 = "sm33_01022"
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L2_3 = PHASE00
  _gesture_phase = L2_3
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_warning_area_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_over_area_01"
  L2_3(L3_4)
  L2_3 = Fn_setCatWarpCheckPoint
  L3_4 = "locator2_pc_start_pos"
  L2_3(L3_4)
  L2_3 = createTvBadConditionTask
  L3_4 = "g1_tv6_ed_01"
  L2_3 = L2_3(L3_4)
  _tv1_bad_condition_task = L2_3
  L2_3 = createTvBadConditionTask
  L3_4 = "g1_tv2_ed_01"
  L2_3 = L2_3(L3_4)
  _tv2_bad_condition_task = L2_3
  L2_3 = 0
  L3_4 = invokeTask
  function L4_5()
    while true do
      L2_3 = L2_3 + 1
      if L2_3 == 30 then
        Fn_captionViewWait("sm33_01001")
      elseif L2_3 == 70 then
        Fn_captionViewWait("sm33_01002")
      elseif L2_3 == 100 then
        Mv_viewObjCancelByCameraInput("locator2_navi_eleph_head_01", 0.2)
        Fn_captionViewWait("sm33_01003")
        L2_3 = 0
      end
      waitSeconds(1)
    end
  end
  L3_4 = L3_4(L4_5)
  L4_5 = findGameObject2
  L5_6 = "Node"
  L6_7 = "locator2_navi_eleph_head_01"
  L4_5 = L4_5(L5_6, L6_7)
  while true do
    L5_6 = Fn_isInSightTarget
    L6_7 = L4_5
    L7_8 = 1
    L5_6 = L5_6(L6_7, L7_8)
    if L5_6 == true then
      L5_6 = Fn_getDistanceToPlayer
      L6_7 = L4_5
      L5_6 = L5_6(L6_7)
    end
    if not (L5_6 <= 25) then
      L5_6 = wait
      L5_6()
    end
  end
  L6_7 = L3_4
  L5_6 = L3_4.abort
  L5_6(L6_7)
  L5_6 = Fn_lookAtObject
  L6_7 = "locator2_navi_eleph_head_01"
  L7_8 = -1
  L5_6 = L5_6(L6_7, L7_8)
  L6_7 = Player
  L7_8 = L6_7
  L6_7 = L6_7.setStay
  L8_9 = true
  L9_10 = false
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = Fn_captionViewWait
  L7_8 = "sm33_01004"
  L6_7(L7_8)
  L6_7 = Mv_safeTaskAbort
  L7_8 = L5_6
  L6_7 = L6_7(L7_8)
  L5_6 = L6_7
  L6_7 = Fn_blackout
  L6_7()
  L6_7 = Fn_resetPcPos
  L7_8 = "locator2_resetpos_arrive_eleph_01"
  L6_7(L7_8)
  L6_7 = Fn_setCatActive
  L7_8 = false
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 3
  L6_7(L7_8)
  L6_7 = _sdemo_cut01
  L7_8 = L6_7
  L6_7 = L6_7.set
  L8_9 = "locator2_eleph_camera_01"
  L9_10 = "locator2_eleph_aim_01"
  L10_11 = false
  L6_7(L7_8, L8_9, L9_10, L10_11)
  L6_7 = _sdemo_cut01
  L7_8 = L6_7
  L6_7 = L6_7.play
  L6_7(L7_8)
  L6_7 = Fn_fadein
  L6_7()
  L6_7 = waitSeconds
  L7_8 = 0.5
  L6_7(L7_8)
  L6_7 = Fn_captionView
  L7_8 = "sm33_01005"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 2.2
  L6_7(L7_8)
  L6_7 = 2
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_eleph_camera_02"
  L8_9.time = L6_7
  L8_9 = {L9_10}
  L9_10 = {}
  L9_10.pos = "locator2_eleph_aim_02"
  L9_10.time = L6_7
  L9_10 = _sdemo_cut01
  L10_11 = L9_10
  L9_10 = L9_10.play
  L11_12 = L7_8
  L12_13 = L8_9
  L9_10(L10_11, L11_12, L12_13)
  L9_10 = waitSeconds
  L10_11 = 1
  L9_10(L10_11)
  L9_10 = Fn_captionView
  L10_11 = "sm33_01006"
  L9_10(L10_11)
  while true do
    L9_10 = _sdemo_cut01
    L10_11 = L9_10
    L9_10 = L9_10.isPlay
    L9_10 = L9_10(L10_11)
    if L9_10 then
      L9_10 = wait
      L9_10()
    end
  end
  L9_10 = waitSeconds
  L10_11 = 1
  L9_10(L10_11)
  L9_10 = Fn_setNpcActive
  L10_11 = "man_tv_01"
  L11_12 = true
  L9_10(L10_11, L11_12)
  L9_10 = Sound
  L10_11 = L9_10
  L9_10 = L9_10.playSE
  L11_12 = "m29_005"
  L9_10(L10_11, L11_12)
  L9_10 = Fn_captionView
  L10_11 = "sm33_01007"
  L9_10(L10_11)
  L9_10 = waitSeconds
  L10_11 = 2
  L9_10(L10_11)
  L9_10 = nil
  L10_11 = invokeTask
  function L11_12()
    L9_10 = createNpcWatchNode("man_tv_01", Vector(0, 2.5, 2))
    Fn_playMotionNpc("man_tv_01", "inform_ex_in_00", true)
    Fn_playMotionNpc("man_tv_01", "inform_ex_00", true)
    Fn_playMotionNpc("man_tv_01", "inform_ex_out_00", true)
    Fn_playMotionNpc("man_tv_01", "talk_angry_02", false)
  end
  L10_11(L11_12)
  L10_11 = Sound
  L11_12 = L10_11
  L10_11 = L10_11.playSE
  L12_13 = "pc1_018"
  L10_11(L11_12, L12_13)
  L10_11 = Fn_captionView
  L11_12 = "sm33_01008"
  L10_11(L11_12)
  L10_11 = waitSeconds
  L11_12 = 1
  L10_11(L11_12)
  L10_11 = 0.7
  L11_12 = {L12_13}
  L12_13 = {}
  L12_13.pos = "locator2_eleph_camera_02"
  L12_13.time = L10_11
  L12_13 = {L13_14}
  L13_14 = {}
  L13_14.pos = "locator2_eleph_aim_03"
  L13_14.time = L10_11
  L13_14 = _sdemo_cut01
  L14_15 = L13_14
  L13_14 = L13_14.setCameraParam
  L15_16 = nil
  L16_17 = 0.1
  L17_18 = {}
  L17_18.deg = 20
  L13_14(L14_15, L15_16, L16_17, L17_18)
  L13_14 = _sdemo_cut01
  L14_15 = L13_14
  L13_14 = L13_14.play
  L15_16 = L11_12
  L16_17 = L12_13
  L13_14(L14_15, L15_16, L16_17)
  L13_14 = waitSeconds
  L14_15 = 2
  L13_14(L14_15)
  L13_14 = Fn_resetPcPos
  L14_15 = "locator2_resetpos_arrive_eleph_02"
  L13_14(L14_15)
  L13_14 = Fn_setCatWarpCheckPoint
  L14_15 = "locator2_catwarp_tv_01"
  L13_14(L14_15)
  L13_14 = Fn_kaiwaDemoView
  L14_15 = "sm33_00600k"
  L13_14(L14_15)
  L13_14 = Fn_setCatActive
  L14_15 = true
  L13_14(L14_15)
  L13_14 = _sdemo_cut01
  L14_15 = L13_14
  L13_14 = L13_14.stop
  L13_14(L14_15)
  L13_14 = PHASE01
  _gesture_phase = L13_14
  L13_14 = Player
  L14_15 = L13_14
  L13_14 = L13_14.setStay
  L15_16 = false
  L13_14(L14_15, L15_16)
  L13_14 = Fn_playMotionNpc
  L14_15 = "man_tv_01"
  L15_16 = "stay_01"
  L16_17 = false
  L13_14(L14_15, L15_16, L16_17)
  L13_14 = Fn_findNpc
  L14_15 = "man_tv_01"
  L13_14 = L13_14(L14_15)
  L14_15 = L13_14
  L13_14 = L13_14.resetSightParam
  L13_14(L14_15)
  L13_14 = Mv_invokeMissionViewNaviCaption
  L14_15 = "sm33_01009"
  L15_16 = "locator2_navi_tv_01"
  L16_17 = "sm33_01010"
  L13_14 = L13_14(L14_15, L15_16, L16_17)
  _mission_view_task_tv_01 = L13_14
  L13_14 = Fn_pcSensorOn
  L14_15 = "pccubesensor2_tv_01_kick"
  L13_14(L14_15)
  L13_14 = waitTvNotShowNoise
  L14_15 = "g1_tv6_ed_01"
  L13_14(L14_15)
  L13_14 = Mv_safeTaskAbort
  L14_15 = _tv1_bad_condition_task
  L13_14 = L13_14(L14_15)
  _tv1_bad_condition_task = L13_14
  L13_14 = Mv_safeTaskAbort
  L14_15 = _tv_01_kick_sensor_enter_task
  L13_14 = L13_14(L14_15)
  _tv_01_kick_sensor_enter_task = L13_14
  L13_14 = Mv_safeTaskAbort
  L14_15 = _tv_01_kick_sensor_leave_task
  L13_14 = L13_14(L14_15)
  _tv_01_kick_sensor_leave_task = L13_14
  L13_14 = Fn_pcSensorOff
  L14_15 = "pccubesensor2_tv_01_kick"
  L13_14(L14_15)
  L13_14 = Fn_tutorialCaptionKill
  L13_14()
  L13_14 = Fn_naviKill
  L13_14()
  L13_14 = Fn_userCtrlAllOff
  L13_14()
  L13_14 = Player
  L14_15 = L13_14
  L13_14 = L13_14.setStay
  L15_16 = true
  L16_17 = false
  L13_14(L14_15, L15_16, L16_17)
  L13_14 = Mv_viewObj
  L14_15 = "locator2_navi_tv_01"
  L15_16 = 0.3
  L13_14(L14_15, L15_16)
  L13_14 = waitSeconds
  L14_15 = 1.5
  L13_14(L14_15)
  L13_14 = Fn_captionViewWait
  L14_15 = "sm33_01024"
  L13_14(L14_15)
  L13_14 = Fn_blackout
  L13_14()
  L13_14 = Fn_resetPcPos
  L14_15 = "locator2_resetpos_tv_01"
  L13_14(L14_15)
  L13_14 = Fn_warpNpc
  L14_15 = "man_tv_01"
  L15_16 = "locator2_man_tv_02"
  L13_14(L14_15, L15_16)
  L13_14 = waitSeconds
  L14_15 = 2
  L13_14(L14_15)
  L13_14 = Fn_fadein
  L13_14()
  L13_14 = waitSeconds
  L14_15 = 1
  L13_14(L14_15)
  L13_14 = Fn_kaiwaDemoView
  L14_15 = "sm33_00650k"
  L13_14(L14_15)
  L13_14 = Mv_informNpc
  L14_15 = "man_tv_01"
  L15_16 = "locator2_navi_stairs_01"
  L16_17 = {}
  L16_17.anim_in = "inform_in"
  L16_17.anim_lp = "inform_lp"
  L16_17.anim_out = "inform_ed"
  L16_17.anim_stay = "stay"
  L13_14(L14_15, L15_16, L16_17)
  L13_14 = waitSeconds
  L14_15 = 1
  L13_14(L14_15)
  L13_14 = Mv_viewObj
  L14_15 = "locator2_stairs"
  L15_16 = 0.3
  L13_14(L14_15, L15_16)
  L13_14 = waitSeconds
  L14_15 = 2.5
  L13_14(L14_15)
  L13_14 = Fn_kaiwaDemoView
  L14_15 = "sm33_00700k"
  L13_14(L14_15)
  L13_14 = invokeTask
  function L14_15()
    Fn_findNpc("man_tv_01"):informEnd()
    repeat
      wait()
    until Fn_findNpc("man_tv_01"):isInformEnd()
    waitSeconds(0.5)
    Fn_findNpc("man_tv_01"):setSightParam({
      valid = true,
      target = L9_10,
      watchTarget = true
    })
    Fn_playMotionNpc("man_tv_01", "stay_02", true)
  end
  L13_14(L14_15)
  L13_14 = waitSeconds
  L14_15 = 0.5
  L13_14(L14_15)
  L13_14 = Fn_captionView
  L14_15 = "sm33_01011"
  L13_14(L14_15)
  L13_14 = Fn_pcSensorOn
  L14_15 = "pccubesensor2_near_stairs_01"
  L13_14(L14_15)
  L13_14 = Fn_pcSensorOn
  L14_15 = "pccubesensor2_in_stairs_01"
  L13_14(L14_15)
  L13_14 = Player
  L14_15 = L13_14
  L13_14 = L13_14.setStay
  L15_16 = false
  L13_14(L14_15, L15_16)
  L13_14 = Fn_userCtrlOn
  L13_14()
  _is_tv2_navi_on = false
  repeat
    L13_14 = wait
    L13_14()
    L13_14 = Mv_raycastCameraSight
    L14_15 = findGameObject2
    L15_16 = "Node"
    L16_17 = "locator2_navi_look_tv_02"
    L14_15 = L14_15(L15_16, L16_17)
    L15_16 = 25
    L13_14 = L13_14(L14_15, L15_16)
  until L13_14
  L13_14 = Fn_pcSensorOff
  L14_15 = "pccubesensor2_near_stairs_01"
  L13_14(L14_15)
  L13_14 = Fn_pcSensorOff
  L14_15 = "pccubesensor2_in_stairs_01"
  L13_14(L14_15)
  L13_14 = Fn_disappearNpc
  L14_15 = "man_tv_01"
  L13_14(L14_15)
  L13_14 = Mv_viewObjCancelByCameraInput
  L14_15 = "locator2_navi_tv_02"
  L15_16 = 0.2
  L13_14(L14_15, L15_16)
  L13_14 = invokeTask
  function L14_15()
    _is_tv2_navi_on = true
    Fn_naviSet(findGameObject2("Node", "locator2_navi_tv_02"))
    Fn_captionViewWait("sm33_01012")
    Fn_setCatWarpCheckPoint("locator2_catwarp_tv_02")
    if Fn_findAreaHandle("ed_a_root"):findChildNode("g1_tv2_ed_01", true):isShowNoise() then
      Fn_pcSensorOn("pccubesensor2_tv_02_kick")
    end
  end
  L13_14(L14_15)
  L13_14 = waitTvNotShowNoise
  L14_15 = "g1_tv2_ed_01"
  L13_14(L14_15)
  L13_14 = Mv_safeTaskAbort
  L14_15 = _tv2_bad_condition_task
  L13_14 = L13_14(L14_15)
  _tv2_bad_condition_task = L13_14
  L13_14 = Fn_pcSensorOff
  L14_15 = "pccubesensor2_warning_area_01"
  L13_14(L14_15)
  L13_14 = Fn_pcSensorOff
  L14_15 = "pccubesensor2_over_area_01"
  L13_14(L14_15)
  L13_14 = Fn_pcSensorOff
  L14_15 = "pccubesensor2_tv_02_kick"
  L13_14(L14_15)
  L13_14 = Fn_naviKill
  L13_14()
  L13_14 = Fn_tutorialCaptionKill
  L13_14()
  L13_14 = Player
  L14_15 = L13_14
  L13_14 = L13_14.setStay
  L15_16 = true
  L16_17 = false
  L13_14(L14_15, L15_16, L16_17)
  L13_14 = waitSeconds
  L14_15 = 1
  L13_14(L14_15)
  L13_14 = _sdemo_cut02
  L14_15 = L13_14
  L13_14 = L13_14.set
  L15_16 = "locator2_tv_camera_01"
  L16_17 = "locator2_tv_aim_01"
  L17_18 = false
  L13_14(L14_15, L15_16, L16_17, L17_18)
  L13_14 = Fn_setKittenAndCatActive
  L14_15 = false
  L13_14(L14_15)
  L13_14 = _sdemo_cut02
  L14_15 = L13_14
  L13_14 = L13_14.play
  L13_14(L14_15)
  L13_14 = Fn_resetPcPos
  L14_15 = "locator2_resetpos_tv_02"
  L13_14(L14_15)
  L13_14 = Fn_userCtrlAllOff
  L13_14()
  L13_14 = waitSeconds
  L14_15 = 0.5
  L13_14(L14_15)
  L13_14 = Fn_setKittenAndCatActive
  L14_15 = true
  L13_14(L14_15)
  L13_14 = waitSeconds
  L14_15 = 1
  L13_14(L14_15)
  L13_14 = 2
  L14_15 = {L15_16}
  L15_16 = {}
  L15_16.pos = "locator2_tv_camera_02"
  L15_16.time = L13_14
  L15_16 = {L16_17}
  L16_17 = {}
  L16_17.pos = "locator2_tv_aim_02"
  L16_17.time = L13_14
  L16_17 = _sdemo_cut02
  L17_18 = L16_17
  L16_17 = L16_17.play
  L18_19 = L14_15
  L19_20 = L15_16
  L16_17(L17_18, L18_19, L19_20)
  L16_17 = waitSeconds
  L17_18 = 1
  L16_17(L17_18)
  L16_17 = Fn_captionView
  L17_18 = "sm33_01013"
  L16_17(L17_18)
  L16_17 = waitSeconds
  L17_18 = 1.5
  L16_17(L17_18)
  L16_17 = _sdemo_cut02
  L17_18 = L16_17
  L16_17 = L16_17.stop
  L16_17(L17_18)
  L16_17 = waitSeconds
  L17_18 = 1.5
  L16_17(L17_18)
  L16_17 = Fn_setNpcActive
  L17_18 = "man_police_01"
  L18_19 = true
  L16_17(L17_18, L18_19)
  L16_17 = Sound
  L17_18 = L16_17
  L16_17 = L16_17.playSE
  L18_19 = "m32_018"
  L16_17(L17_18, L18_19)
  L16_17 = Fn_captionView
  L17_18 = "sm33_01014"
  L16_17(L17_18)
  L16_17 = waitSeconds
  L17_18 = 1
  L16_17(L17_18)
  L16_17 = Fn_lookAtObject
  L17_18 = _puppet_tbl
  L17_18 = L17_18.man_police_01
  L18_19 = 1.5
  L16_17 = L16_17(L17_18, L18_19)
  L17_18 = {L18_19}
  L18_19 = "locator2_man_police_move_01"
  L18_19 = Fn_moveNpc
  L19_20 = "man_police_01"
  L20_21 = L17_18
  L21_22 = {}
  L21_22.runLength = -1
  L21_22.arrivedLength = 0
  L18_19 = L18_19(L19_20, L20_21, L21_22)
  L19_20 = waitSeconds
  L20_21 = 1
  L19_20(L20_21)
  L19_20 = Player
  L20_21 = L19_20
  L19_20 = L19_20.setLookAtIk
  L21_22 = true
  L22_23 = 1
  L23_24 = findGameObject2
  L23_24 = L23_24("Node", "locator2_man_police_move_01")
  L23_24 = L23_24.getWorldPos
  L23_24 = L23_24(L23_24)
  L19_20(L20_21, L21_22, L22_23, L23_24, L23_24(L23_24))
  L19_20 = Fn_captionView
  L20_21 = "sm33_01015"
  L19_20(L20_21)
  L19_20 = waitSeconds
  L20_21 = 1
  L19_20(L20_21)
  L19_20 = invokeTask
  function L20_21()
    while L18_19:isRunning() do
      wait()
    end
    L18_19:abort()
    L18_19 = nil
    Fn_findNpc("man_police_01"):inform(Fn_getPlayer(), {
      anim_in = "inform_ex_in_00",
      anim_lp = "inform_ex_00",
      anim_out = "inform_ex_out_00",
      anim_stay = "talk_angry_00"
    })
    Fn_findNpc("man_police_01"):informEnd()
    repeat
      wait()
    until Fn_findNpc("man_police_01"):isInformEnd()
  end
  L19_20(L20_21)
  L19_20 = waitSeconds
  L20_21 = 2.5
  L19_20(L20_21)
  L19_20 = Mv_safeTaskAbort
  L20_21 = L16_17
  L19_20 = L19_20(L20_21)
  L16_17 = L19_20
  L19_20 = Fn_kaiwaDemoView
  L20_21 = "sm33_00800k"
  L19_20(L20_21)
  L19_20 = Player
  L20_21 = L19_20
  L19_20 = L19_20.setLookAtIk
  L21_22 = false
  L22_23 = 1
  L23_24 = findGameObject2
  L23_24 = L23_24("Node", "locator2_man_police_move_01")
  L23_24 = L23_24.getWorldPos
  L23_24 = L23_24(L23_24)
  L19_20(L20_21, L21_22, L22_23, L23_24, L23_24(L23_24))
  L19_20 = Fn_pcSensorOn
  L20_21 = "pccubesensor2_school_warning_area_01"
  L19_20(L20_21)
  L19_20 = Fn_pcSensorOn
  L20_21 = "pccubesensor2_school_over_area_01"
  L19_20(L20_21)
  L19_20 = Player
  L20_21 = L19_20
  L19_20 = L19_20.setStay
  L21_22 = false
  L19_20(L20_21, L21_22)
  L19_20 = Fn_userCtrlOn
  L19_20()
  L19_20 = Fn_changeNpcToMob
  L20_21 = "man_police_01"
  L19_20(L20_21)
  L19_20 = Mv_invokeMissionViewNaviCaption
  L20_21 = "sm33_01016"
  L21_22 = "locator2_navi_school_01"
  L22_23 = nil
  L19_20 = L19_20(L20_21, L21_22, L22_23)
  L20_21 = Mv_viewObjCancelByCameraInput
  L21_22 = findGameObject2
  L22_23 = "Node"
  L23_24 = "locator2_navi_school_01"
  L23_24 = L21_22(L22_23, L23_24)
  L20_21(L21_22, L22_23, L23_24, L21_22(L22_23, L23_24))
  L20_21 = waitSeconds
  L21_22 = 2
  L20_21(L21_22)
  L20_21 = Fn_captionViewWait
  L21_22 = "sm33_01017"
  L20_21(L21_22)
  L20_21 = Fn_pcSensorOn
  L21_22 = "pccubesensor2_school_statue_01"
  L20_21(L21_22)
  L20_21 = Mv_waitPhase
  L20_21()
  L20_21 = Fn_naviKill
  L20_21()
  L20_21 = Fn_pcSensorOff
  L21_22 = "pccubesensor2_school_warning_area_01"
  L20_21(L21_22)
  L20_21 = Fn_pcSensorOff
  L21_22 = "pccubesensor2_school_over_area_01"
  L20_21(L21_22)
  L20_21 = Fn_pcSensorOff
  L21_22 = "pccubesensor2_school_statue_01"
  L20_21(L21_22)
  L20_21 = Fn_setKittenActive
  L21_22 = false
  L20_21(L21_22)
  L20_21 = Fn_setCatActive
  L21_22 = false
  L20_21(L21_22)
  L20_21 = Fn_userCtrlOff
  L20_21()
  L20_21 = _sdemo_cut03
  L21_22 = L20_21
  L20_21 = L20_21.set
  L22_23 = "locator2_school_camera_01"
  L23_24 = "locator2_school_aim_01"
  L20_21(L21_22, L22_23, L23_24, false)
  L20_21 = _sdemo_cut03
  L21_22 = L20_21
  L20_21 = L20_21.play
  L20_21(L21_22)
  L20_21 = Fn_resetPcPos
  L21_22 = "locator2_resetpos_school"
  L20_21(L21_22)
  L20_21 = Fn_findAreaHandle
  L21_22 = "ed_a_root"
  L20_21 = L20_21(L21_22)
  L22_23 = L20_21
  L21_22 = L20_21.findChildNode
  L23_24 = "g1_monument_yo_01_01"
  L21_22 = L21_22(L22_23, L23_24, true)
  if L21_22 ~= nil then
    L23_24 = L21_22
    L22_23 = L21_22.isBroken
    L22_23 = L22_23(L23_24)
    if L22_23 then
      L23_24 = L21_22
      L22_23 = L21_22.requestRestoreForce
      L22_23(L23_24)
    end
  end
  L22_23 = waitSeconds
  L23_24 = 0.5
  L22_23(L23_24)
  L22_23 = Fn_captionView
  L23_24 = "sm33_01027"
  L22_23(L23_24)
  L22_23 = {
    L23_24,
    {
      pos = "locator2_school_aim_03",
      time = 2,
      hashfunc = "EaseOut"
    }
  }
  L23_24 = {}
  L23_24.pos = "locator2_school_aim_02"
  L23_24.time = 2
  L23_24.hashfunc = "EaseIn"
  L23_24 = _sdemo_cut03
  L23_24 = L23_24.play
  L23_24(L23_24, nil, L22_23)
  while true do
    L23_24 = _sdemo_cut03
    L23_24 = L23_24.isPlay
    L23_24 = L23_24(L23_24)
    if L23_24 then
      L23_24 = wait
      L23_24()
    end
  end
  L23_24 = waitSeconds
  L23_24(1)
  L23_24 = Fn_kaiwaDemoView
  L23_24("sm33_00900k")
  L23_24 = Fn_setKittenActive
  L23_24(true)
  L23_24 = Fn_setNpcActive
  L23_24("dusty_01", true)
  L23_24 = Fn_moveNpc
  L23_24 = L23_24("dusty_01", {
    "locator2_dusty_02"
  }, {arrivedLength = 0})
  waitSeconds(0.2)
  Sound:playSE("cat_call_1")
  _sdemo_cut04:set("locator2_school_camera_02", "locator2_school_aim_04")
  _sdemo_cut03:stop()
  _sdemo_cut04:play()
  waitSeconds(1)
  Fn_captionView("sm33_01028")
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_statue_01"):getWorldPos())
  _sdemo_cut04:play(nil, {
    {
      pos = "locator2_school_aim_05",
      time = 1,
      hashfunc = "EaseInOut"
    }
  })
  invokeTask(function()
    while L23_24:isRunning() do
      wait()
    end
    Fn_playMotionNpc("dusty_01", DUSTY_MOTION.STAY_TO_SIT, true)
    Fn_playMotionNpc("dusty_01", DUSTY_MOTION.SIT, true)
  end)
  waitSeconds(3)
  Fn_kaiwaDemoView("sm33_00905k")
  Player:setLookAtIk(false, 1, findGameObject2("Node", "locator2_statue_01"):getWorldPos())
  _sdemo_cut04:stop()
  Fn_disappearNpc("dusty_01")
  Fn_setCatActive(true)
  Fn_findAreaHandle("ed_a_root"):findChildNode("g1_tv6_ed_01", true):setOverwriteDefaultTvScheduleName(nil)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
function pccubesensor2_warning_area_01_OnLeave()
  Player:setStay(true, false)
  if _gesture_phase == PHASE00 then
    Fn_captionView("sm33_01018")
    Fn_naviSet(findGameObject2("Node", "locator2_resetpos_tv_01"))
  else
    Fn_captionView("sm33_01023")
  end
  Player:setStay(false)
end
function pccubesensor2_warning_area_01_OnEnter()
  if _gesture_phase == PHASE00 then
    Fn_naviKill()
  end
end
function pccubesensor2_over_area_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_school_warning_area_01_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm33_01026")
  Player:setStay(false)
end
function pccubesensor2_school_over_area_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_tv_01_kick_OnEnter()
  _tv_01_kick_sensor_enter_task = Mv_safeTaskAbort(_tv_01_kick_sensor_enter_task)
  _tv_01_kick_sensor_enter_task = invokeTask(function()
    repeat
      wait()
    until not Mv_isSafeTaskRunning(_mission_view_task_tv_01)
    repeat
      wait()
    until not Fn_isCaptionView()
    if findGameObject2("PlayerSensor", "pccubesensor2_tv_01_kick"):getCount() > 0 then
      Fn_tutorialCaption("gravitykick_ep01")
    end
  end)
end
function pccubesensor2_tv_01_kick_OnLeave()
  _tv_01_kick_sensor_leave_task = Mv_safeTaskAbort(_tv_01_kick_sensor_leave_task)
  _tv_01_kick_sensor_leave_task = invokeTask(function()
    repeat
      wait()
    until not Mv_isSafeTaskRunning(_mission_view_task_tv_01)
    if findGameObject2("PlayerSensor", "pccubesensor2_tv_01_kick"):getCount() <= 0 then
      Fn_tutorialCaptionKill()
      wait()
      Fn_captionView("sm33_01019")
      Fn_playMotionNpc("man_tv_01", "stay", false, {animBlendDuration = 0.1})
      waitSeconds(0.1)
      Fn_turnNpc("man_tv_01")
      Fn_playMotionNpc("man_tv_01", "talk_angry_02", false)
    end
  end)
end
function pccubesensor2_near_stairs_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_near_stairs_01_OnLeave()
  if findGameObject2("PlayerSensor", "pccubesensor2_in_stairs_01"):getCount() <= 0 then
    Fn_naviSet(findGameObject2("Node", "locator2_navi_stairs_01"))
    Fn_captionView("sm33_01020")
  end
end
function pccubesensor2_tv_02_kick_OnEnter()
  Fn_tutorialCaption("gravitykick_ep01")
end
function pccubesensor2_tv_02_kick_OnLeave()
  Fn_tutorialCaptionKill()
  Fn_captionView("sm33_01021")
end
function pccubesensor2_school_statue_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_school_statue_01_OnLeave()
  Mv_resetWaitPhase()
end
function waitTvNotShowNoise(A0_27)
  local L1_28, L2_29, L3_30
  L1_28 = Fn_findAreaHandle
  L2_29 = "ed_a_root"
  L1_28 = L1_28(L2_29)
  L3_30 = L1_28
  L2_29 = L1_28.findChildNode
  L2_29 = L2_29(L3_30, A0_27, true)
  L3_30 = L2_29
  repeat
    L2_29 = L1_28:findChildNode(A0_27, true)
    if L2_29 == nil or L2_29:isShowNoise() then
      wait()
    end
  until false
end
function createTvBadConditionTask(A0_31)
  return (invokeTask(function()
    local L0_32, L1_33
    L0_32 = Fn_findAreaHandle
    L1_33 = "ed_a_root"
    L0_32 = L0_32(L1_33)
    L1_33 = nil
    repeat
      if L0_32:findChildNode(A0_31, true) ~= nil and L0_32:findChildNode(A0_31, true) ~= L1_33 then
        L0_32:findChildNode(A0_31, true):setBadCondition(true)
        L0_32:findChildNode(A0_31, true):setOverwriteDefaultTvScheduleName("hx_ep15")
        L1_33 = L0_32:findChildNode(A0_31, true)
      end
      wait()
    until false
  end))
end
