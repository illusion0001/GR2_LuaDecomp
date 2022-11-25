dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm46_common.lua")
FA01_DIST01 = 8
FA01_CAPTIME = 12
SON_DIST = 5
SON_CHECK_DIST = 25
VIEW_ANGLE = 45
FACTORY_RAY_DIST = 80
WORKER01_BOX = 8
WORKER_APPEND_START = 7
WORKER_STARTER = 6
SON_GUIDE_LEAVE_DIST01 = 50
SON_GUIDE_LEAVE_DIST02 = 60
SON_GUIDE_NEAR_DIST01 = 40
SON_GUIDE_NEAR_DIST02 = 30
_puppet_tbl = {}
_target_find_flag = nil
_photo_retry = false
_photo_area = false
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "fa01",
      type = "man07",
      node = "locator2_fa_start_b_01",
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "son01",
      type = "man83",
      node = "locator2_son_start_b_01",
      active = true
    },
    {
      name = "couple01",
      type = "man81",
      node = "locator2_couple_b_01",
      reset = false
    },
    {
      name = "couple02",
      type = "wom41",
      node = "locator2_couple_b_02",
      reset = false
    },
    {
      name = "worker01",
      type = "man10",
      node = "locator2_worker01_b_01",
      reset = false
    },
    {
      name = "worker02",
      type = "man25",
      node = "locator2_worker02_b_01",
      reset = false
    },
    {
      name = "worker03",
      type = "man26",
      node = "locator2_worker03_b_01",
      reset = false
    },
    {
      name = "worker04",
      type = "man08",
      node = "locator2_worker04_b_01",
      reset = false
    },
    {
      name = "worker05",
      type = "man02",
      node = "locator2_worker05_b_01",
      reset = false,
      hair_variation = 1,
      color_variation = 1
    },
    {
      name = "worker06",
      type = "man09",
      node = "locator2_worker06_b_01",
      reset = false,
      hair_variation = 1,
      color_variation = 1
    },
    {
      name = "worker07",
      type = "man10",
      node = "locator2_worker07_b_01",
      reset = false,
      hair_variation = 1,
      color_variation = 1
    },
    {
      name = "worker08",
      type = "man25",
      node = "locator2_worker08_b_01",
      reset = false,
      hair_variation = 1,
      color_variation = 1
    }
  }
  Fn_setupNpc(L0_0)
  Fn_pcSensorOff("pccubesensor2_guide_b_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_02")
  Fn_pcSensorOff("pccubesensor2_factory_view_01")
  Fn_pcSensorOff("pccubesensor2_arrive_factory_01")
  Fn_pcSensorOff("pccubesensor2_photo_area_01")
  Fn_pcSensorOff("pccubesensor2_son_warning_area_01")
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  son_hdl = Fn_findNpc("son01")
  _sdemo_cut01 = SDemo.create("sm46_b_cut01")
  _sdemo_cut02 = SDemo.create("sm46_b_cut02")
  _sdemo_cut03 = SDemo.create("sm46_b_cut03")
  setCatWarpPhase(CATWARP_PHASE01)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L34_35, L35_36
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = invokeTask
  function L1_2()
    if Fn_findNpc("couple01") == nil then
      Fn_playMotionNpc("couple01", "photo_couple_00", false)
      Fn_playMotionNpc("couple02", "photo_couple_00", false)
    end
    Fn_playMotionNpc("worker02", "stay_01", false)
    Fn_playMotionNpc("worker03", "stay_02", false)
    Fn_playMotionNpc("worker04", "stay_02", false)
    Fn_playMotionNpc("worker05", "stay_01", false)
    Fn_playMotionNpc("worker06", "stay", false)
  end
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_warning_02"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_area_02"
  L0_1(L1_2)
  L0_1 = Fn_setGrabNpc
  L1_2 = "fa01"
  L2_3 = false
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Mv_createNpcGrabSensor
  L1_2 = "fa01"
  L0_1 = L0_1(L1_2)
  L2_3 = L0_1
  L1_2 = L0_1.setActive
  L3_4 = true
  L1_2(L2_3, L3_4)
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Fn_setCatWarpCheckPoint
  L2_3 = "locator2_pc_start_pos"
  L1_2(L2_3)
  L1_2 = clientGrabWait
  L2_3 = "fa01"
  L1_2(L2_3)
  L2_3 = L0_1
  L1_2 = L0_1.setActive
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = waitSeconds
  L2_3 = GRAB_VIEW_WAIT
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_factory_view_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_guide_b_01"
  L1_2(L2_3)
  L1_2 = setCatWarpPhase
  L2_3 = CATWARP_PHASE02
  L1_2(L2_3)
  L1_2 = comStopViewCap
  L2_3 = "locator2_navi_arrive_factory_01"
  L3_4 = 0.3
  L4_5 = "sm46_01001"
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Fn_missionView
  L2_3 = "sm46_01000"
  L1_2(L2_3)
  L1_2 = invokeTask
  function L2_3()
    local L0_37
    L0_37 = 0
    while true do
      if getWarningFlag() == true then
        wait()
      else
        if L0_37 == ADVICE_TIME01 then
          Fn_captionView("sm46_01002")
        elseif L0_37 == ADVICE_TIME02 then
          comStopViewConCap("locator2_navi_arrive_factory_01", 0.3, "sm46_01003")
          L0_37 = ADVICE_TIME01
        end
        waitSeconds(1)
        L0_37 = L0_37 + 1
      end
    end
  end
  L1_2 = L1_2(L2_3)
  L2_3 = invokeTask
  function L3_4()
    local L0_38
    L0_38 = {
      findGameObject2("Node", "locator2_factory_ray_01"),
      findGameObject2("Node", "locator2_factory_ray_02"),
      findGameObject2("Node", "locator2_factory_ray_03"),
      findGameObject2("Node", "locator2_factory_ray_04"),
      findGameObject2("Node", "locator2_factory_ray_05"),
      findGameObject2("Node", "locator2_factory_ray_center_01")
    }
    while true do
      if arrayRaycastCheck(L0_38, FACTORY_RAY_DIST) == true and _target_find_flag ~= true then
        _target_find_flag = true
        Fn_pcSensorOff("pccubesensor2_factory_view_01")
        Mv_gotoNextPhase()
      end
      wait()
    end
  end
  L2_3 = L2_3(L3_4)
  L3_4 = Mv_waitPhase
  L3_4()
  L3_4 = Mv_safeTaskAbort
  L4_5 = L1_2
  L3_4 = L3_4(L4_5)
  L1_2 = L3_4
  L3_4 = Fn_disappearNpc
  L4_5 = "couple01"
  L3_4(L4_5)
  L3_4 = Fn_disappearNpc
  L4_5 = "couple02"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_factory_area_01"
  L3_4(L4_5)
  L3_4 = invokeFindTargetControl
  L4_5 = "locator2_factory_ray_center_01"
  L5_6 = "locator2_navi_arrive_factory_01"
  L6_7 = "sm46_01004"
  L3_4 = L3_4(L4_5, L5_6, L6_7)
  L1_2 = L3_4
  L3_4 = Mv_waitPhase
  L3_4()
  L3_4 = Mv_safeTaskAbort
  L4_5 = L1_2
  L3_4 = L3_4(L4_5)
  L1_2 = L3_4
  L3_4 = Mv_safeTaskAbort
  L4_5 = view_task
  L3_4 = L3_4(L4_5)
  view_task = L3_4
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_guide_b_01"
  L3_4(L4_5)
  L3_4 = Fn_blackout
  L3_4()
  L3_4 = Fn_userCtrlAllOff
  L3_4()
  L3_4 = Fn_setGrabReleaseNpc
  L4_5 = "fa01"
  L3_4(L4_5)
  L3_4 = Player
  L4_5 = L3_4
  L3_4 = L3_4.setGrabExceptionalObject
  L5_6 = {}
  L3_4(L4_5, L5_6)
  L3_4 = Fn_warpNpc
  L4_5 = "fa01"
  L5_6 = "locator2_fa_resetpos_factory_01"
  L3_4(L4_5, L5_6)
  L3_4 = Fn_resetPcPos
  L4_5 = "locator2_pc_resetpos_factory_01"
  L3_4(L4_5)
  L3_4 = Fn_loadNpcEventMotion
  L4_5 = "fa01"
  L5_6 = _MOTION_LIST
  L3_4(L4_5, L5_6)
  L3_4 = waitSeconds
  L4_5 = 1
  L3_4(L4_5)
  L3_4 = {}
  L3_4.degree_h = 90
  L3_4.degree_v = 90
  L3_4.in_length = 100
  L3_4.out_length = 100
  L3_4.valid = true
  L4_5 = findGameObject2
  L5_6 = "Node"
  L6_7 = "locator2_chimney_view_01"
  L4_5 = L4_5(L5_6, L6_7)
  L3_4.target = L4_5
  L3_4.watchTarget = true
  L4_5 = _sdemo_cut01
  L5_6 = L4_5
  L4_5 = L4_5.set
  L6_7 = "locator2_sdemo01b_cam_01"
  L7_8 = "locator2_sdemo01b_aim_01"
  L8_9 = false
  L4_5(L5_6, L6_7, L7_8, L8_9)
  L4_5 = _sdemo_cut01
  L5_6 = L4_5
  L4_5 = L4_5.play
  L4_5(L5_6)
  L4_5 = Fn_fadein
  L4_5()
  L4_5 = benchNoGrab
  L5_6 = "fa01"
  L6_7 = "g1_base_cc_d1_road"
  L7_8 = "g1_bench_iy_01_01"
  L4_5 = L4_5(L5_6, L6_7, L7_8)
  L5_6 = waitSeconds
  L6_7 = 1
  L5_6(L6_7)
  L5_6 = Fn_playMotionNpc
  L6_7 = "fa01"
  L7_8 = "stay_01"
  L8_9 = false
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_findNpc
  L6_7 = "fa01"
  L5_6 = L5_6(L6_7)
  L6_7 = L5_6
  L5_6 = L5_6.setSightParam
  L7_8 = L3_4
  L5_6(L6_7, L7_8)
  L5_6 = findGameObject2
  L6_7 = "Node"
  L7_8 = "locator2_chimney_view_01"
  L5_6 = L5_6(L6_7, L7_8)
  L6_7 = L5_6
  L5_6 = L5_6.getWorldPos
  L5_6 = L5_6(L6_7)
  L6_7 = Player
  L7_8 = L6_7
  L6_7 = L6_7.setLookAtIk
  L8_9 = true
  L9_10 = 1
  L6_7(L7_8, L8_9, L9_10, L10_11)
  L6_7 = 4
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_sdemo01b_cam_02"
  L8_9.time = L6_7
  L8_9 = {L9_10}
  L9_10 = {}
  L9_10.pos = "locator2_sdemo01b_aim_02"
  L9_10.time = L6_7
  L9_10 = _sdemo_cut01
  L9_10 = L9_10.play
  L9_10(L10_11, L11_12, L12_13)
  while true do
    L9_10 = _sdemo_cut01
    L9_10 = L9_10.isPlay
    L9_10 = L9_10(L10_11)
    if L9_10 then
      L9_10 = wait
      L9_10()
    end
  end
  L9_10 = waitSeconds
  L9_10(L10_11)
  L9_10 = Fn_kaiwaDemoView
  L9_10(L10_11)
  L9_10 = Fn_findNpc
  L9_10 = L9_10(L10_11)
  L9_10 = L9_10.resetSightParam
  L9_10(L10_11)
  L9_10 = Player
  L9_10 = L9_10.setLookAtIk
  L13_14 = Vector
  L14_15 = 0
  L15_16 = 0
  L16_17 = 0
  L35_36 = L13_14(L14_15, L15_16, L16_17)
  L9_10(L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L34_35, L35_36, L13_14(L14_15, L15_16, L16_17))
  L9_10 = _sdemo_cut01
  L9_10 = L9_10.stop
  L9_10(L10_11, L11_12)
  L9_10 = waitSeconds
  L9_10(L10_11)
  L9_10 = {}
  for L13_14 = 1, BOX_MAX do
    L14_15 = findGameObject2
    L15_16 = "Node"
    L16_17 = "bg2_box_"
    L17_18 = string
    L17_18 = L17_18.format
    L18_19 = "%02d"
    L17_18 = L17_18(L18_19, L19_20)
    L16_17 = L16_17 .. L17_18
    L14_15 = L14_15(L15_16, L16_17)
    L9_10[L13_14] = L14_15
    L14_15 = L9_10[L13_14]
    L15_16 = L14_15
    L14_15 = L14_15.setIgnoreGrab
    L16_17 = true
    L14_15(L15_16, L16_17)
    L14_15 = L9_10[L13_14]
    L15_16 = L14_15
    L14_15 = L14_15.setCollidable
    L16_17 = false
    L14_15(L15_16, L16_17)
  end
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12, L12_13)
  L10_11(L11_12)
  L10_11(L11_12, L12_13)
  for L13_14 = 2, WORKER_MAX do
    L14_15 = playNpcMotion
    L15_16 = _worker_motion
    L16_17 = "worker0"
    L17_18 = L13_14
    L16_17 = L16_17 .. L17_18
    L14_15(L15_16, L16_17)
  end
  L13_14 = {L14_15}
  L14_15 = "talk_00"
  loop_motion_worker01 = L10_11
  L10_11()
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12)
  L13_14 = L10_11
  L14_15 = {}
  L14_15.runLength = 1000
  L14_15.recast = true
  function L13_14()
    while L11_12:isRunning() do
      wait()
    end
    Fn_turnNpc("fa01", "locator2_fa_sit_turn_01")
    Fn_playMotionNpc("fa01", "sit_in_00", true)
    Fn_playMotionNpc("fa01", "sit_00", true)
    while true do
      if Fn_getDistanceToPlayer(_puppet_tbl.fa01) < FA01_DIST01 then
        while _photo_retry == true do
          wait()
        end
        if 0 >= FA01_CAPTIME then
          Fn_playMotionNpc("fa01", "sit_out_00", true)
          Fn_turnNpc("fa01")
          Fn_captionViewWait("sm46_01006")
          Fn_turnNpc("fa01", "locator2_fa_sit_turn_01")
          Fn_playMotionNpc("fa01", "sit_in_00", true)
          Fn_playMotionNpc("fa01", "sit_00", true)
        end
        waitSeconds(1)
      end
      wait()
    end
  end
  function L13_14()
    local L0_39, L1_40, L2_41, L3_42
    for L3_42 = 1, BOX_MAX do
      if L9_10[L3_42]:isBroken() or L9_10[L3_42]:isGrabbed() then
        return true
      end
    end
    return L0_39
  end
  L14_15 = invokeTask
  function L15_16()
    local L0_43, L1_44, L2_45
    L0_43 = Vector
    L1_44 = 0
    L2_45 = 0
    L0_43 = L0_43(L1_44, L2_45, 0)
    L1_44 = Vector
    L2_45 = 0
    L1_44 = L1_44(L2_45, 0.5, 0)
    while true do
      L2_45 = Mv_isEyesight
      L2_45 = L2_45(_puppet_tbl.son01, Fn_getPlayer(), VIEW_ANGLE, SON_CHECK_DIST)
      if not L2_45 then
        L2_45 = Fn_getDistanceToPlayer
        L2_45 = L2_45(_puppet_tbl.son01)
        if not (L2_45 < SON_DIST) then
          L2_45 = L13_14
          L2_45 = L2_45()
        end
      else
        if L2_45 == true then
          L2_45 = Fn_pcSensorOff
          L2_45("pccubesensor2_catwarp_warning_02")
          L2_45 = Fn_pcSensorOff
          L2_45("pccubesensor2_catwarp_area_02")
          L2_45 = Player
          L2_45 = L2_45.setStay
          L2_45(L2_45, true, false)
          L2_45 = son_hdl
          L2_45 = L2_45.pauseMove
          L2_45(L2_45, true)
          L2_45 = Fn_turnNpc
          L2_45("son01")
          L2_45 = Fn_playMotionNpc
          L2_45("son01", "talk_00", false)
          L2_45 = Fn_captionViewWait
          L2_45("sm46_01007")
          L2_45 = Fn_repeatPlayMotion
          L2_45 = L2_45("son01", "stay", {"stay"})
          Fn_captionViewWait("sm46_01008")
          Fn_blackout()
          Fn_resetPcPos("locator2_pc_resetpos_photo_01")
          Fn_warpNpc("son01", "locator2_son_start_b_01")
          L2_45 = Mv_safeTaskAbort(L2_45)
          Area:requestRestore()
          Fn_fadein(3)
          son_hdl:pauseMove(false)
          Player:setStay(false, false)
          Fn_captionViewEnd()
          Fn_captionViewWait("sm46_01009", 3, 0.5)
          Fn_pcSensorOn("pccubesensor2_catwarp_warning_02")
          Fn_pcSensorOn("pccubesensor2_catwarp_area_02")
      end
      else
        L2_45 = Mv_isEyesight
        L2_45 = L2_45(Fn_getPlayer(), _puppet_tbl.son01, VIEW_ANGLE, SON_CHECK_DIST, L0_43, L1_44)
        if L2_45 then
          L2_45 = Mv_gotoNextPhase
          L2_45()
          break
        end
      end
      L2_45 = wait
      L2_45()
    end
  end
  L14_15 = L14_15(L15_16)
  L15_16 = guideNaviWait
  L16_17 = "son01"
  L17_18 = "sm46_01022"
  L18_19 = false
  L15_16 = L15_16(L16_17, L17_18, L18_19, L19_20, L20_21)
  L16_17 = Mv_waitPhase
  L16_17()
  L16_17 = Mv_safeTaskAbort
  L17_18 = L14_15
  L16_17 = L16_17(L17_18)
  L14_15 = L16_17
  L16_17 = Mv_safeTaskAbort
  L17_18 = L15_16
  L16_17 = L16_17(L17_18)
  L15_16 = L16_17
  L16_17 = comKillNavi
  L16_17()
  L16_17 = Player
  L17_18 = L16_17
  L16_17 = L16_17.setStay
  L18_19 = true
  L16_17(L17_18, L18_19, L19_20)
  L16_17 = Fn_getPlayer
  L16_17 = L16_17()
  L17_18 = L16_17
  L16_17 = L16_17.getWorldPos
  L16_17 = L16_17(L17_18)
  L17_18 = createGameObject2
  L18_19 = "Node"
  L17_18 = L17_18(L18_19)
  L18_19 = L17_18.setName
  L18_19(L19_20, L20_21)
  L18_19 = L17_18.setPos
  L18_19(L19_20)
  L18_19 = L17_18.setWorldPos
  L22_23 = 1.5
  L23_24 = 0
  L18_19(L19_20, L20_21)
  L18_19 = L17_18.setForceMove
  L18_19(L19_20)
  L18_19 = start_game_obj
  L18_19()
  L18_19 = _sdemo_cut02
  L18_19 = L18_19.set
  L22_23 = true
  L23_24 = Vector
  L24_25 = 0
  L25_26 = 1.5
  L26_27 = 0
  L35_36 = L23_24(L24_25, L25_26, L26_27)
  L18_19(L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L34_35, L35_36, L23_24(L24_25, L25_26, L26_27))
  L18_19 = _sdemo_cut02
  L18_19 = L18_19.play
  L18_19(L19_20)
  L18_19 = waitSeconds
  L18_19(L19_20)
  L18_19 = _sdemo_cut02
  L18_19 = L18_19.zoomIn
  L21_22.deg = 15
  L22_23 = "easeOut"
  L18_19(L19_20, L20_21, L21_22, L22_23)
  L18_19 = waitSeconds
  L18_19(L19_20)
  L18_19 = Mv_safeTaskAbort
  L18_19 = L18_19(L19_20)
  loop_motion_worker01 = L18_19
  L18_19 = Fn_moveNpc
  L21_22.runLength = 1000
  L21_22.recast = true
  L18_19 = L18_19(L19_20, L20_21, L21_22)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21, L21_22)
  L19_20(L20_21)
  for L22_23 = 1, BOX_MAX do
    L23_24 = L9_10[L22_23]
    L24_25 = L23_24
    L23_24 = L23_24.setIgnoreGrab
    L25_26 = false
    L23_24(L24_25, L25_26)
    L23_24 = L9_10[L22_23]
    L24_25 = L23_24
    L23_24 = L23_24.setCollidable
    L25_26 = true
    L23_24(L24_25, L25_26)
  end
  L19_20(L20_21)
  L19_20(L20_21)
  L19_20(L20_21)
  L22_23 = true
  L23_24 = SON_GUIDE_LEAVE_DIST02
  L24_25 = SON_GUIDE_NEAR_DIST02
  photo_success = false
  L22_23 = kPHOTO_TYPE_ONCE
  L23_24 = true
  L24_25 = {}
  L24_25.near = 1
  L24_25.far = 10
  L25_26 = {}
  L25_26.left = -1
  L25_26.right = 1
  L25_26.top = -1
  L25_26.bottom = 1
  L26_27 = "sm46_user_photo"
  _photo = L20_21
  L22_23 = "locator2_photo_son_01"
  L20_21(L21_22, L22_23)
  while true do
    if L21_22 == false then
      if L21_22 == true then
        L22_23 = L21_22
        L21_22(L22_23)
        repeat
          L21_22()
          if L21_22 ~= false then
            L22_23 = L21_22
          end
        until not L21_22
        if L21_22 == true then
          L22_23 = L21_22
          L22_23 = kPHOTO_NEAR
          if L21_22 == L22_23 then
            L22_23 = Fn_captionView
            L23_24 = "sm46_01015"
            L22_23(L23_24)
          else
            L22_23 = kPHOTO_FAR
            if L21_22 == L22_23 then
              L22_23 = Fn_captionView
              L23_24 = "sm46_01016"
              L22_23(L23_24)
            else
              L22_23 = kPHOTO_OUT
              if L21_22 == L22_23 then
                L22_23 = Fn_captionView
                L23_24 = "sm46_01017"
                L22_23(L23_24)
              else
                L22_23 = _photo_retry
                if L22_23 == false then
                  L22_23 = Sound
                  L23_24 = L22_23
                  L22_23 = L22_23.pulse
                  L24_25 = "success"
                  L22_23(L23_24, L24_25)
                  photo_success = true
                  L22_23 = Fn_pcSensorOff
                  L23_24 = "pccubesensor2_photo_area_01"
                  L22_23(L23_24)
                  L22_23 = Fn_pcSensorOff
                  L23_24 = "pccubesensor2_son_warning_area_01"
                  L22_23(L23_24)
                  L22_23 = Mv_safeTaskAbort
                  L23_24 = L20_21
                  L22_23 = L22_23(L23_24)
                  L22_23 = Fn_missionViewEnd
                  L22_23()
                  L22_23 = Fn_missionInfoEnd
                  L22_23()
                  L22_23 = Mv_safeTaskAbort
                  L23_24 = L12_13
                  L22_23 = L22_23(L23_24)
                  L22_23 = Mv_safeTaskAbort
                  L23_24 = L19_20
                  L22_23 = L22_23(L23_24)
                  L22_23 = Fn_userCtrlAllOff
                  L22_23()
                  L22_23 = Fn_captionViewWait
                  L23_24 = "sm46_01018"
                  L22_23(L23_24)
                  break
                end
              end
            end
          end
        end
      end
    end
    L21_22()
  end
  L22_23 = L21_22
  L23_24 = false
  L21_22(L22_23, L23_24)
  _photo = nil
  L21_22()
  L21_22()
  L22_23 = "locator2_sdemo_pc_start_01"
  L21_22(L22_23)
  L22_23 = _worker_motion
  L23_24 = nil
  L21_22(L22_23, L23_24)
  function L22_23()
    local L0_46, L1_47, L2_48, L3_49
    L0_46(L1_47, L2_48)
    for L3_49 = 1, WORKER_MAX do
      Fn_warpNpc("worker" .. string.format("%02d", L3_49), "locator2_sdemo03b_worker_st_" .. string.format("%02d", L3_49))
    end
  end
  L21_22(L22_23)
  L22_23 = "fa01"
  L23_24 = "sit_00"
  L24_25 = false
  L21_22(L22_23, L23_24, L24_25)
  L22_23 = L21_22
  L23_24 = "locator2_sdemo_battle_cam_01"
  L24_25 = "locator2_sdemo_battle_aim_01"
  L25_26 = false
  L21_22(L22_23, L23_24, L24_25, L25_26)
  L22_23 = L21_22
  L21_22(L22_23)
  L22_23 = 2
  L21_22(L22_23)
  L21_22()
  function L22_23()
    local L0_50, L1_51, L2_52, L3_53
    for L3_53 = 1, WORKER_MAX do
      Fn_loadNpcEventMotion("worker" .. string.format("%02d", L3_53), _MOTION_LIST)
    end
    L0_50(L1_51, L2_52)
  end
  L21_22(L22_23)
  L22_23 = "fa01"
  L23_24 = "sit_out_00"
  L24_25 = true
  L21_22(L22_23, L23_24, L24_25)
  L22_23 = "fa01"
  L23_24 = "stay_01"
  L24_25 = false
  L21_22(L22_23, L23_24, L24_25)
  L22_23 = 0.3
  L21_22(L22_23)
  L22_23 = "sm46_00900k"
  L21_22(L22_23)
  L22_23 = 0.6
  L21_22(L22_23)
  L22_23 = "Node"
  L23_24 = "locator2_sdemo_kit_turn_01"
  L22_23 = Fn_sendEventComSb
  L23_24 = "requestEnemyMarkerOn"
  L24_25 = "enmgen2_01"
  L25_26 = false
  L22_23(L23_24, L24_25, L25_26)
  L22_23 = Fn_sendEventComSb
  L23_24 = "requestEnemyAiStop"
  L24_25 = "enmgen2_01"
  L25_26 = false
  L22_23(L23_24, L24_25, L25_26)
  L22_23 = Fn_sendEventComSb
  L23_24 = "requestSpawnEnemy"
  L24_25 = "enmgen2_01"
  L22_23(L23_24, L24_25)
  while true do
    L22_23 = Fn_sendEventComSb
    L23_24 = "isSpawnHandEnd"
    L22_23 = L22_23(L23_24)
    if L22_23 == false then
      L22_23 = wait
      L22_23()
    end
  end
  L22_23 = Fn_sendEventComSb
  L23_24 = "requestEnemyMarkerOn"
  L24_25 = "enmgen2_zako_01"
  L25_26 = false
  L22_23(L23_24, L24_25, L25_26)
  L22_23 = Fn_sendEventComSb
  L23_24 = "requestEnemyAiStop"
  L24_25 = "enmgen2_zako_01"
  L25_26 = false
  L22_23(L23_24, L24_25, L25_26)
  L22_23 = Fn_sendEventComSb
  L23_24 = "requestSpawnEnemy"
  L24_25 = "enmgen2_zako_01"
  L22_23(L23_24, L24_25)
  L22_23 = invokeTask
  function L23_24()
    Fn_coercionPoseNomal()
    Player:setLookAtIk(true, 1, L21_22:getWorldPos())
    Fn_findNpc("fa01"):turn(-45)
    repeat
      wait()
    until Fn_findNpc("fa01"):isTurnEnd()
    Fn_playMotionNpc("fa01", "man01_scared_04", false, {isStop = true, animBlendDuration = 0.5})
    waitSeconds(0.3)
    Player:setLookAtIk(false, 1, L21_22:getWorldPos())
    Fn_resetCoercionPose()
  end
  L22_23(L23_24)
  L22_23 = waitSeconds
  L23_24 = 0.5
  L22_23(L23_24)
  L22_23 = Fn_sendEventComSb
  L23_24 = "requestEnemyMarkerOn"
  L24_25 = "enmgen2_01"
  L25_26 = false
  L22_23(L23_24, L24_25, L25_26)
  L22_23 = 4.5
  L23_24 = {L24_25}
  L24_25 = {}
  L24_25.pos = "locator2_sdemo_battle_cam_02"
  L24_25.time = L22_23
  L24_25.hashfunc = "Cosine"
  L24_25 = {L25_26}
  L25_26 = {}
  L25_26.pos = "locator2_sdemo_battle_aim_02"
  L25_26.time = L22_23
  L25_26.hashfunc = "Cosine"
  L25_26 = _sdemo_cut03
  L26_27 = L25_26
  L25_26 = L25_26.play
  L27_28 = L23_24
  L28_29 = L24_25
  L25_26(L26_27, L27_28, L28_29)
  while true do
    L25_26 = _sdemo_cut03
    L26_27 = L25_26
    L25_26 = L25_26.isPlay
    L25_26 = L25_26(L26_27)
    if L25_26 then
      L25_26 = wait
      L25_26()
    end
  end
  L25_26 = waitSeconds
  L26_27 = 0.8
  L25_26(L26_27)
  L25_26 = Fn_kaiwaDemoView
  L26_27 = "sm46_01000k"
  L25_26(L26_27)
  L25_26 = Player
  L26_27 = L25_26
  L25_26 = L25_26.setLookAtIk
  L27_28 = false
  L28_29 = 1
  L30_31 = L21_22
  L29_30 = L21_22.getWorldPos
  L35_36 = L29_30(L30_31)
  L25_26(L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L34_35, L35_36, L29_30(L30_31))
  L25_26 = Mob
  L26_27 = L25_26
  L25_26 = L25_26.makeSituationPanic
  L27_28 = true
  L25_26(L26_27, L27_28)
  L25_26 = Fn_moveNpc
  L26_27 = "fa01"
  L27_28 = {L28_29, L29_30}
  L28_29 = "locator2_fa_escape_01"
  L29_30 = "locator2_fa_escape_02"
  L28_29 = {}
  L28_29.runLength = -1
  L28_29.recast = true
  L25_26 = L25_26(L26_27, L27_28, L28_29)
  L26_27 = invokeTask
  function L27_28()
    while L25_26:isRunning() do
      wait()
    end
  end
  L26_27(L27_28)
  L26_27 = Fn_resetPcPos
  L27_28 = "locator2_pc_battle_pos_01"
  L26_27(L27_28)
  L26_27 = {}
  L27_28 = {}
  L28_29 = {}
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_01"
  L28_29[1] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_02"
  L28_29[2] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_01"
  L28_29[3] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_02"
  L28_29[4] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_01"
  L28_29[5] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_02"
  L28_29[6] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_01"
  L28_29[7] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33
  }
  L30_31 = "locator2_worker_relay_02"
  L28_29[8] = L29_30
  L29_30 = {
    L30_31,
    L31_32,
    L32_33,
    L33_34,
    L34_35
  }
  L30_31 = "m29_936"
  L30_31 = {}
  for L34_35 = 1, WORKER_MAX do
    L35_36 = invokeTask
    L35_36(function()
      local L0_54
      L0_54 = L34_35
      L0_54 = L0_54 % 2
      if L0_54 then
        L0_54 = L34_35
        L30_31[L0_54] = Fn_moveNpc("worker" .. string.format("%02d", L34_35), L28_29[L34_35], {
          runLength = -1,
          recast = true,
          anim_run = _MOTION_LIST.run_afraid_00
        })
      else
        L0_54 = L34_35
        L30_31[L0_54] = Fn_moveNpc("worker" .. string.format("%02d", L34_35), L28_29[L34_35], {
          runLength = -1,
          recast = true,
          anim_run = _MOTION_LIST.run_afraid_01
        })
      end
    end)
    L35_36 = invokeTask
    L35_36(function()
      if L34_35 % 2 then
        waitSeconds((L34_35 % 4 + 1) * 0.6)
        print("\233\159\179\229\163\176\229\155\158\230\149\176" .. L34_35)
        Sound:playSE(L29_30[L34_35 % 4 + 1], 1, "", _puppet_tbl["worker" .. string.format("%02d", L34_35)])
      end
    end)
    break
  end
  L35_36 = false
  L31_32(L32_33, L33_34, L34_35, L35_36)
  L31_32(L32_33)
  L31_32(L32_33, L33_34, L34_35)
  L31_32(L32_33, L33_34)
  L31_32(L32_33)
  L31_32(L32_33, L33_34, L34_35)
  L31_32(L32_33, L33_34, L34_35)
  L31_32(L32_33)
  L31_32(L32_33)
  L31_32()
  L31_32(L32_33, L33_34)
  L31_32(L32_33)
  for L35_36 = 1, WORKER_MAX do
    L30_31[L35_36] = Mv_safeTaskAbort(L30_31[L35_36])
    if L35_36 % 2 then
      L30_31[L35_36] = Fn_moveNpc("worker" .. string.format("%02d", L35_36), L28_29[L35_36], {runLength = -1, recast = true})
    else
      L30_31[L35_36] = Fn_moveNpc("worker" .. string.format("%02d", L35_36), L28_29[L35_36], {runLength = -1, recast = true})
    end
  end
  L35_36 = true
  L32_33(L33_34, L34_35, L35_36)
  L35_36 = false
  L32_33(L33_34, L34_35, L35_36)
  while true do
    if L32_33 ~= false then
    end
    if L32_33 == false then
      L32_33()
    end
  end
  L35_36 = true
  L32_33(L33_34, L34_35, L35_36)
  L35_36 = false
  L32_33(L33_34, L34_35, L35_36)
  L4_5 = L32_33
  L32_33()
  L32_33()
  L32_33()
  L32_33()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensor2_factory_view_01_OnEnter(A0_55)
  if _target_find_flag ~= true then
    _target_find_flag = true
    Mv_gotoNextPhase()
  end
  Fn_pcSensorOff(A0_55)
end
function pccubesensor2_factory_area_01_OnEnter(A0_56)
  Mv_gotoNextPhase()
  Fn_pcSensorOff(A0_56)
  comKillNavi()
end
function pccubesensor2_photo_area_01_OnEnter()
  comKillNavi()
  _photo_area = true
  invokeTask(function()
    if _photo ~= nil then
      _photo:resetCaption()
    end
  end)
end
function pccubesensor2_photo_area_01_OnLeave()
  local L0_57, L1_58
  _photo_area = false
end
function pccubesensor2_son_warning_area_01_OnEnter()
  invokePhotoRetry(true)
end
function pccubesensor2_catwarp_warning_02_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_catwarp_warning_02_OnLeave()
  local L0_59, L1_60
end
function pccubesensor2_catwarp_warning_02_OnEnter()
  killWarningNavi()
end
function pccubesensor2_catwarp_warning_02_OnLeave()
  comCatWarpWarning("sm46_01023", "locator2_warning_navi_02")
end
function pccubesensor2_catwarp_area_02_OnLeave()
  catwarpFunc("fa01", "locator2_fa_start_b_01")
end
function pccubesensor2_son_guide_area_01_OnEnter()
  local L0_61, L1_62
end
function pccubesensor2_son_guide_area_01_OnLeave()
  local L0_63, L1_64
end
function pccubesensor2_guide_b_01_OnEnter()
  local L0_65, L1_66
end
function pccubesensor2_guide_b_01_OnLeave()
  Fn_captionView("sm46_01024")
end
function invokePhotoRetry(A0_67)
  if _photo_retry == true then
    return false
  end
  return invokeTask(function()
    _photo_retry = true
    Fn_pcSensorOff("pccubesensor2_photo_area_01")
    Fn_pcSensorOff("pccubesensor2_catwarp_warning_02")
    Fn_pcSensorOff("pccubesensor2_catwarp_area_02")
    _photo_area = false
    stopNpcMotion(_worker_motion, "son01")
    Fn_playMotionNpc("son01", "stay", false)
    son_hdl:pauseMove(true)
    Player:setStay(true, false)
    Fn_turnNpc("son01")
    if A0_67 == true then
      Fn_playMotionNpc("son01", "talk_00", false)
      Fn_captionViewWait("sm46_01011")
    elseif A0_67 == false then
      Fn_playMotionNpc("son01", "talk_angry_00", false)
      Fn_captionViewWait("sm46_01012")
    end
    Fn_captionViewWait("sm46_01013")
    Fn_blackout()
    Fn_playMotionNpc("worker01", "talk_00", false)
    Fn_loadNpcEventMotion("son01", _WORK_MOTION)
    Fn_resetPcPos("locator2_pc_resetpos_photo_01")
    Fn_warpNpc("son01", "locator2_son_reset_01")
    Fn_warpNpc("worker01", "locator2_sdemo02b_worker01_move_01")
    Area:requestRestore()
    Fn_captionViewEnd()
    playNpcMotion(_worker_motion, "worker01")
    playNpcMotion(_worker_motion, "son01")
    Fn_fadein(3)
    son_hdl:pauseMove(false)
    Player:setStay(false, false)
    Fn_captionViewWait("sm46_01014", 3, 0.5)
    Fn_pcSensorOn("pccubesensor2_photo_area_01")
    Fn_pcSensorOn("pccubesensor2_catwarp_warning_02")
    Fn_pcSensorOn("pccubesensor2_catwarp_area_02")
    _photo_retry = false
    _photo_area = true
  end)
end
