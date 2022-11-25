dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm46_common.lua")
KAIWA_TIME01 = 10
KAIWA_TIME02 = 20
KAIWA_TIME03 = 30
ADVICE_TIME01 = KAIWA_TIME03 + 45
ADVICE_TIME02 = ADVICE_TIME01 + 30
CHURCH_RAY_DIST = 90
_puppet_tbl = {}
_target_find_flag = false
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_church_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_arrive_church_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_a_01")
  L0_0 = {
    {
      name = "fa01",
      type = "man07",
      node = "locator2_fa_01",
      active = false
    },
    {
      name = "son01",
      type = "man83",
      node = "locator2_son_01",
      active = false
    },
    {
      name = "couple01",
      type = "man81",
      node = "locator2_couple_01"
    },
    {
      name = "couple02",
      type = "wom41",
      node = "locator2_couple_02"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_setCatWarp(true)
  Fn_setCatWarpCheckPoint("locator2_son_01")
  _sdemo_cut01 = SDemo.create("sm46_a_cut01")
  _sdemo_cut02 = SDemo.create("sm46_a_cut02")
  setCatWarpPhase(CATWARP_PHASE01)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = Fn_missionStart
  L0_1()
  function L0_1()
    local L0_10
    L0_10 = findGameObject2
    L0_10 = L0_10("Node", "locator2_yumemi_view_01")
    L0_10 = L0_10.getWorldPos
    L0_10 = L0_10(L0_10)
    waitSeconds(0.5)
    Fn_resetPcPos("locator2_resetpos_yumemi_01")
    Fn_setNpcActive("son01", true)
    Fn_setNpcActive("fa01", true)
    Camera:lookTo(L0_10, 0, 0)
  end
  L1_2 = Fn_kaiwaDemoView2
  L2_3 = "sm46_00100k"
  L3_4 = L0_1
  L1_2(L2_3, L3_4)
  L1_2 = waitSeconds
  L2_3 = 0.5
  L1_2(L2_3)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm46_00150k"
  L1_2(L2_3)
  L1_2 = Fn_blackout
  L1_2()
  L1_2 = Fn_resetPcPos
  L2_3 = "locator2_resetpos_01"
  L1_2(L2_3)
  L1_2 = _sdemo_cut01
  L2_3 = L1_2
  L1_2 = L1_2.set
  L3_4 = "locator2_a_demo1_camera_01"
  L4_5 = "locator2_a_demo1_aim_01"
  L5_6 = false
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = _sdemo_cut01
  L2_3 = L1_2
  L1_2 = L1_2.play
  L1_2(L2_3)
  L1_2 = Fn_userCtrlAllOff
  L1_2()
  L1_2 = Fn_fadein
  L2_3 = 3
  L1_2(L2_3)
  L1_2 = waitSeconds
  L2_3 = 1
  L1_2(L2_3)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm46_00200k"
  L1_2(L2_3)
  L1_2 = Fn_moveNpc
  L2_3 = "son01"
  L3_4 = {L4_5}
  L4_5 = "locator2_son_go_work_01"
  L4_5 = {}
  L4_5.runLength = 1000
  L4_5.recast = true
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L2_3 = invokeTask
  function L3_4()
    Fn_turnNpc("fa01", "locator2_a_fa_turn_01")
    Fn_playMotionNpc("fa01", "stay_01", false)
  end
  L2_3(L3_4)
  while true do
    L3_4 = L1_2
    L2_3 = L1_2.isRunning
    L2_3 = L2_3(L3_4)
    if L2_3 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Mv_safeTaskAbort
  L3_4 = L1_2
  L2_3 = L2_3(L3_4)
  L1_2 = L2_3
  L2_3 = Fn_setNpcActive
  L3_4 = "son01"
  L4_5 = false
  L2_3(L3_4, L4_5)
  L2_3 = Fn_kaiwaDemoView
  L3_4 = "sm46_00300k"
  L2_3(L3_4)
  L2_3 = _sdemo_cut01
  L3_4 = L2_3
  L2_3 = L2_3.stop
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_catwarp_warning_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_catwarp_area_01"
  L2_3(L3_4)
  L2_3 = Fn_setGrabNpc
  L3_4 = "fa01"
  L4_5 = false
  L5_6 = false
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Mv_createNpcGrabSensor
  L3_4 = "fa01"
  L2_3 = L2_3(L3_4)
  L4_5 = L2_3
  L3_4 = L2_3.setActive
  L5_6 = true
  L3_4(L4_5, L5_6)
  L3_4 = Fn_setCatWarpCheckPoint
  L4_5 = "locator2_son_01"
  L3_4(L4_5)
  L3_4 = Fn_userCtrlOn
  L3_4()
  L3_4 = Fn_missionView
  L4_5 = "sm46_00100"
  L3_4(L4_5)
  L3_4 = clientGrabWait
  L4_5 = "fa01"
  L3_4(L4_5)
  L3_4 = Sound
  L4_5 = L3_4
  L3_4 = L3_4.playSE
  L5_6 = "m29_930c"
  L6_7 = 1
  L7_8 = ""
  L8_9 = _puppet_tbl
  L8_9 = L8_9.fa01
  L3_4(L4_5, L5_6, L6_7, L7_8, L8_9)
  L4_5 = L2_3
  L3_4 = L2_3.setActive
  L5_6 = false
  L3_4(L4_5, L5_6)
  L3_4 = waitSeconds
  L4_5 = GRAB_VIEW_WAIT
  L3_4(L4_5)
  L3_4 = Fn_findNpc
  L4_5 = "fa01"
  L3_4 = L3_4(L4_5)
  L4_5 = setCatWarpPhase
  L5_6 = CATWARP_PHASE02
  L4_5(L5_6)
  L4_5 = Fn_missionViewEnd
  L4_5()
  L4_5 = Fn_missionInfoEnd
  L4_5()
  L4_5 = Fn_kaiwaDemoView
  L5_6 = "sm46_00400k"
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOn
  L5_6 = "pccubesensor2_church_01"
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOn
  L5_6 = "pccubesensor2_guide_a_01"
  L4_5(L5_6)
  L4_5 = comStopViewCap
  L5_6 = "locator2_navi_church_01"
  L6_7 = 0.3
  L7_8 = "sm46_00101"
  L4_5(L5_6, L6_7, L7_8)
  L4_5 = Fn_missionView
  L5_6 = "sm46_00102"
  L4_5(L5_6)
  L4_5 = invokeTask
  function L5_6()
    local L0_11
    L0_11 = 0
    while true do
      if getWarningFlag() == true then
        wait()
      else
        if L0_11 == KAIWA_TIME01 then
          Fn_captionView("sm46_00103")
        elseif L0_11 == KAIWA_TIME02 then
          Fn_captionView("sm46_00104")
        elseif L0_11 == KAIWA_TIME03 then
          Fn_captionView("sm46_00105")
        elseif L0_11 == ADVICE_TIME01 then
          Fn_captionView("sm46_00106")
        else
          if L0_11 == ADVICE_TIME02 then
            comStopViewConCap("locator2_navi_church_01", 0.3, "sm46_00107")
            L0_11 = ADVICE_TIME01
          else
          end
        end
        waitSeconds(1)
        L0_11 = L0_11 + 1
      end
    end
  end
  L4_5 = L4_5(L5_6)
  L5_6 = invokeTask
  function L6_7()
    local L0_12
    L0_12 = {
      findGameObject2("Node", "locator2_church_ray_01"),
      findGameObject2("Node", "locator2_church_ray_02"),
      findGameObject2("Node", "locator2_church_ray_03"),
      findGameObject2("Node", "locator2_church_ray_04"),
      findGameObject2("Node", "locator2_church_ray_05"),
      findGameObject2("Node", "locator2_church_ray_center_01")
    }
    while true do
      if arrayRaycastCheck(L0_12, CHURCH_RAY_DIST) == true and _target_find_flag ~= true then
        _target_find_flag = true
        Fn_pcSensorOff("pccubesensor2_church_01")
        Mv_gotoNextPhase()
      end
      wait()
    end
  end
  L5_6 = L5_6(L6_7)
  L6_7 = Fn_playMotionNpc
  L7_8 = "couple01"
  L8_9 = "photo_couple_00"
  L6_7(L7_8, L8_9, false)
  L6_7 = Fn_playMotionNpc
  L7_8 = "couple02"
  L8_9 = "photo_couple_00"
  L6_7(L7_8, L8_9, false)
  L6_7 = Mv_waitPhase
  L6_7()
  L6_7 = Mv_safeTaskAbort
  L7_8 = L4_5
  L6_7 = L6_7(L7_8)
  L4_5 = L6_7
  L6_7 = Mv_safeTaskAbort
  L7_8 = L5_6
  L6_7 = L6_7(L7_8)
  L5_6 = L6_7
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_arrive_church_01"
  L6_7(L7_8)
  L6_7 = setCatWarpPhase
  L7_8 = CATWARP_PHASE03
  L6_7(L7_8)
  L6_7 = invokeFindTargetControl
  L7_8 = "locator2_church_ray_center_01"
  L8_9 = "locator2_navi_church_01"
  L6_7 = L6_7(L7_8, L8_9, "sm46_00108")
  L4_5 = L6_7
  L6_7 = Mv_waitPhase
  L6_7()
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_guide_a_01"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_catwarp_warning_01"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_catwarp_area_01"
  L6_7(L7_8)
  L6_7 = Mv_safeTaskAbort
  L7_8 = L4_5
  L6_7 = L6_7(L7_8)
  L4_5 = L6_7
  L6_7 = Fn_blackout
  L6_7()
  L6_7 = Fn_userCtrlOff
  L6_7()
  L6_7 = Fn_setGrabReleaseNpc
  L7_8 = "fa01"
  L6_7(L7_8)
  L6_7 = Fn_warpNpc
  L7_8 = "fa01"
  L8_9 = "locator2_fa_church_01"
  L6_7(L7_8, L8_9)
  L6_7 = Fn_resetPcPos
  L7_8 = "locator2_resetpos_church_01"
  L6_7(L7_8)
  L6_7 = _sdemo_cut02
  L7_8 = L6_7
  L6_7 = L6_7.set
  L8_9 = "locator2_a_demo2_camera_01"
  L6_7(L7_8, L8_9, "locator2_a_demo2_aim_01", false)
  L6_7 = _sdemo_cut02
  L7_8 = L6_7
  L6_7 = L6_7.play
  L6_7(L7_8)
  L6_7 = Fn_fadein
  L7_8 = 3
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 1
  L6_7(L7_8)
  L6_7 = Fn_kaiwaDemoView
  L7_8 = "sm46_00500k"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 0.5
  L6_7(L7_8)
  L6_7 = invokeTask
  function L7_8()
    Player:setLookAtIk(true, 1, _puppet_tbl.couple01:getWorldPos())
    waitSeconds(1.5)
    Player:setLookAtIk(false, 1, _puppet_tbl.couple01:getWorldPos())
  end
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = 0.2
  L6_7(L7_8)
  L6_7 = invokeTask
  function L7_8()
    Fn_turnNpc("fa01", _puppet_tbl.couple01)
  end
  L6_7(L7_8)
  L6_7 = 2.5
  L7_8 = {L8_9}
  L8_9 = {}
  L8_9.pos = "locator2_a_demo2_camera_01"
  L8_9.time = L6_7
  L8_9.hashfunc = "Cosine"
  L8_9 = {
    {
      pos = "locator2_a_demo2_aim_02",
      time = L6_7,
      hashfunc = "Cosine"
    }
  }
  _sdemo_cut02:play(L7_8, L8_9)
  while _sdemo_cut02:isPlay() do
    wait()
  end
  waitSeconds(1)
  _sdemo_cut02:stop(2)
  Fn_kaiwaDemoView("sm46_00600k")
  Fn_userCtrlOn()
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
function pccubesensor2_church_01_OnEnter(A0_13)
  Fn_pcSensorOff(A0_13)
  if _target_find_flag ~= true then
    _target_find_flag = true
    Mv_gotoNextPhase()
  end
end
function pccubesensor2_arrive_church_01_OnEnter(A0_14)
  Mv_gotoNextPhase()
  Fn_pcSensorOff(A0_14)
  comKillNavi()
end
function pccubesensor2_catwarp_warning_01_OnEnter()
  killWarningNavi()
end
function pccubesensor2_catwarp_warning_01_OnLeave()
  comCatWarpWarning("sm46_00111", "locator2_warning_navi_01")
end
function pccubesensor2_catwarp_area_01_OnLeave()
  catwarpFunc("fa01", "locator2_fa_01")
end
function pccubesensor2_guide_a_01_OnEnter()
  local L0_15, L1_16
end
function pccubesensor2_guide_a_01_OnLeave()
  Fn_captionView("sm46_00112")
end
