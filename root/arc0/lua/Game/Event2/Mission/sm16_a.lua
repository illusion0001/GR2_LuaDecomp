dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/gesture.lua")
JUDGE_DISTANCE_ARRIVAL_DOCK = 100
BOX_MAX = 29
_puppet_tbl = {}
_npc_tbl = {}
_mother_ship_hdl = nil
_sdemo = nil
_gesture_find_boy = nil
_event_motion_table = {
  kit_motion_look = "kit01_touch_00",
  kit_motion_stay = "kit01_stay_00"
}
_more_important_navi_view = false
_cat_navi_view = false
_phase = 1
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Camera
  L0_0 = L0_0.setControl
  L0_0(L0_0, Camera.kPlayer, Camera.kControl_All, false)
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_dock")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_locator2_dock_answer_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_client_near_distant")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_a_phase02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_dock_distant")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_a_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_a_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_a_phase02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_a_phase02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_a_phase03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_a_phase03")
  L0_0 = {
    {
      name = "sm16_mother",
      type = "wom20",
      node = "locator2_mother",
      active = false
    },
    {
      name = "sm16_driver",
      type = "man49",
      node = "locator2_driver",
      active = false
    },
    {
      name = "sm16_dock_answer",
      type = "man45",
      node = "locator2_dock_answer"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _puppet_tbl.sm16_client = Fn_findNpcPuppet("sm16_client")
  Fn_loadPlayerMotion(_event_motion_table)
  _sdemo = SDemo.create("sm16_a_sdemo")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L0_1 = initializeGestureEvent
  L0_1()
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm16_client"
  L2_3 = "stay"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = waitSeconds
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm16_dock_answer"
  L2_3 = "stay_01"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_turnNpc
  L1_2 = "sm16_client"
  L0_1(L1_2)
  L0_1 = Mob
  L1_2 = L0_1
  L0_1 = L0_1.topUpHatchery
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "sm16_00100k"
  L0_1(L1_2)
  L0_1 = waitSeconds
  L1_2 = 0.5
  L0_1(L1_2)
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm16_client"
  L2_3 = "wavehand_near_00"
  L3_4 = true
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = waitSeconds
  L1_2 = 0.5
  L0_1(L1_2)
  L0_1 = invokeTask
  function L1_2()
    while Fn_moveNpc("sm16_client", {
      "locator2_write_run_point_01"
    }, {runLength = -1}):isRunning() == true do
      wait()
    end
    Fn_disappearNpc("sm16_client")
  end
  L0_1(L1_2)
  L0_1 = nil
  L1_2 = Mv_viewObj
  L2_3 = "locator2_player_aim_point_01"
  L3_4 = 0.25
  L1_2 = L1_2(L2_3, L3_4)
  L0_1 = L1_2
  L1_2 = Fn_playerTurn
  L2_3 = findGameObject2
  L3_4 = "Node"
  L4_5 = "locator2_player_aim_point_01"
  L2_3 = L2_3(L3_4, L4_5)
  L3_4 = 0
  L4_5 = 1
  L1_2(L2_3, L3_4, L4_5)
  repeat
    L2_3 = L0_1
    L1_2 = L0_1.isRunning
    L1_2 = L1_2(L2_3)
    if L1_2 then
      L1_2 = wait
      L1_2()
      L1_2 = false
    end
  until L1_2
  L1_2 = waitSeconds
  L2_3 = 1
  L1_2(L2_3)
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Camera
  L2_3 = L1_2
  L1_2 = L1_2.setControl
  L3_4 = Camera
  L3_4 = L3_4.kPlayer
  L4_5 = Camera
  L4_5 = L4_5.kControl_All
  L5_6 = true
  L1_2(L2_3, L3_4, L4_5, L5_6)
  _phase = 1
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_client_near_distant"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_catwarning_a_phase01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_catwarp_a_phase01"
  L1_2(L2_3)
  L1_2 = Fn_setCatWarpCheckPoint
  L2_3 = "locator2_resetpos_start_01"
  L1_2(L2_3)
  L1_2 = Fn_missionView
  L2_3 = "sm16_00100"
  L1_2(L2_3)
  L1_2 = waitSeconds
  L2_3 = 2.5
  L1_2(L2_3)
  L1_2 = Fn_captionView
  L2_3 = "sm16_00101"
  L1_2(L2_3)
  L1_2 = _gesture_find_boy
  L2_3 = L1_2
  L1_2 = L1_2.run
  L1_2(L2_3)
  L1_2 = {}
  L2_3 = {}
  L2_3.in_game_preview = "k_photo_sm1601"
  L1_2.view = L2_3
  L2_3 = Fn_gamePreviewView
  L3_4 = L1_2
  L2_3(L3_4)
  L2_3 = false
  repeat
    L3_4 = _gesture_find_boy
    L4_5 = L3_4
    L3_4 = L3_4.isInform
    L3_4 = L3_4(L4_5)
    if L3_4 and not L2_3 then
      L3_4 = Fn_captionView
      L4_5 = "sm16_00102"
      L3_4(L4_5)
      L2_3 = true
    end
    L3_4 = _gesture_find_boy
    L4_5 = L3_4
    L3_4 = L3_4.getKnownKaiwaDemoCount
    L3_4 = L3_4(L4_5)
    if L3_4 >= 1 then
      L3_4 = _gesture_find_boy
      L4_5 = L3_4
      L3_4 = L3_4.isInteraction
      L3_4 = L3_4(L4_5)
    end
    if L3_4 then
      L3_4 = wait
      L3_4()
      L3_4 = false
    end
  until L3_4
  L3_4 = _gesture_find_boy
  L4_5 = L3_4
  L3_4 = L3_4.stop
  L3_4(L4_5)
  _gesture_find_boy = nil
  L3_4 = HUD
  L4_5 = L3_4
  L3_4 = L3_4.inGamePreviewExit
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_client_near_distant"
  L3_4(L4_5)
  L3_4 = Fn_naviSet
  L4_5 = findGameObject2
  L5_6 = "Node"
  L6_7 = "locator2_navi_dock"
  L8_9 = L4_5(L5_6, L6_7)
  L3_4(L4_5, L5_6, L6_7, L7_8, L8_9, L4_5(L5_6, L6_7))
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_dock"
  L3_4(L4_5)
  _more_important_navi_view = true
  _phase = 2
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_catwarning_a_phase01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOff
  L4_5 = "pccubesensor2_catwarp_a_phase01"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_guide_a_phase02"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_catwarning_a_phase02"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_catwarp_a_phase02"
  L3_4(L4_5)
  L3_4 = Fn_setCatWarpCheckPoint
  L4_5 = "locator2_resetpos_start_01"
  L3_4(L4_5)
  L3_4 = waitSeconds
  L4_5 = 1.5
  L3_4(L4_5)
  L3_4 = Fn_kaiwaDemoView
  L4_5 = "sm16_00290k"
  L3_4(L4_5)
  L3_4 = waitSeconds
  L4_5 = 0.5
  L3_4(L4_5)
  L3_4 = Fn_missionView
  L4_5 = "sm16_00103"
  L3_4(L4_5)
  L3_4 = false
  while true do
    L4_5 = Fn_isInSightTarget
    L5_6 = findGameObject2
    L6_7 = "Node"
    L7_8 = "locator2_navi_dock"
    L8_9 = L5_6(L6_7, L7_8)
    L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9, L5_6(L6_7, L7_8))
    if L4_5 then
      L4_5 = Fn_getDistanceToPlayer
      L5_6 = findGameObject2
      L6_7 = "Node"
      L7_8 = "locator2_navi_dock"
      L8_9 = L5_6(L6_7, L7_8)
      L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9, L5_6(L6_7, L7_8))
      L5_6 = JUDGE_DISTANCE_ARRIVAL_DOCK
      if L4_5 < L5_6 then
        L4_5 = findGameObject2
        L5_6 = "Node"
        L6_7 = "locator2_navi_dock"
        L4_5 = L4_5(L5_6, L6_7)
        L5_6 = L4_5
        L4_5 = L4_5.getWorldPos
        L4_5 = L4_5(L5_6)
        L5_6 = L4_5.y
        L5_6 = L5_6 + 1.5
        L4_5.y = L5_6
        L5_6 = Fn_getPcPosRot
        L6_7 = L5_6()
        L7_8 = L5_6.y
        L7_8 = L7_8 + 1.5
        L5_6.y = L7_8
        L7_8 = Query
        L8_9 = L7_8
        L7_8 = L7_8.setEyeSightTransform
        L7_8(L8_9, L5_6, L6_7)
        L7_8 = Query
        L8_9 = L7_8
        L7_8 = L7_8.setEyeSightAngle
        L7_8(L8_9, Deg2Rad(45))
        L7_8 = Query
        L8_9 = L7_8
        L7_8 = L7_8.setEyeSightRange
        L7_8(L8_9, 3)
        L7_8 = Query
        L8_9 = L7_8
        L7_8 = L7_8.raycastEyeSight
        L7_8 = L7_8(L8_9, L4_5)
        if not L7_8 then
          L8_9 = DebugDraw
          L8_9 = L8_9.setColor
          L8_9(L8_9, 0, 1, 0)
          L3_4 = true
        else
          L8_9 = DebugDraw
          L8_9 = L8_9.setColor
          L8_9(L8_9, 1, 0, 0)
          L3_4 = false
        end
        L8_9 = DebugDraw
        L8_9 = L8_9.drawLines
        L8_9(L8_9, {L5_6, L4_5})
      end
    end
    if not L3_4 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = Fn_captionView
  L5_6 = "sm16_00104"
  L4_5(L5_6)
  L4_5 = Mv_waitPhase
  L4_5()
  L4_5 = Fn_userCtrlAllOff
  L4_5()
  L4_5 = Camera
  L5_6 = L4_5
  L4_5 = L4_5.setControl
  L6_7 = Camera
  L6_7 = L6_7.kPlayer
  L7_8 = Camera
  L7_8 = L7_8.kControl_All
  L8_9 = false
  L4_5(L5_6, L6_7, L7_8, L8_9)
  L4_5 = nil
  L5_6 = Mv_viewObj
  L6_7 = _puppet_tbl
  L6_7 = L6_7.sm16_dock_answer
  L7_8 = 0.5
  L5_6 = L5_6(L6_7, L7_8)
  L4_5 = L5_6
  repeat
    L6_7 = L4_5
    L5_6 = L4_5.isRunning
    L5_6 = L5_6(L6_7)
    if L5_6 then
      L5_6 = wait
      L5_6()
      L5_6 = false
    end
  until L5_6
  L5_6 = Fn_naviSet
  L6_7 = _puppet_tbl
  L6_7 = L6_7.sm16_dock_answer
  L5_6(L6_7)
  _more_important_navi_view = true
  L5_6 = waitSeconds
  L6_7 = 1
  L5_6(L6_7)
  L5_6 = Fn_userCtrlOn
  L5_6()
  L5_6 = Camera
  L6_7 = L5_6
  L5_6 = L5_6.setControl
  L7_8 = Camera
  L7_8 = L7_8.kPlayer
  L8_9 = Camera
  L8_9 = L8_9.kControl_All
  L5_6(L6_7, L7_8, L8_9, true)
  _phase = 3
  L5_6 = Fn_pcSensorOff
  L6_7 = "pccubesensor2_catwarning_a_phase02"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOff
  L6_7 = "pccubesensor2_catwarp_a_phase02"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_dock_distant"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_catwarning_a_phase03"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_catwarp_a_phase03"
  L5_6(L6_7)
  L5_6 = Fn_setCatWarpCheckPoint
  L6_7 = "locator2_resetpos_dock_center_01"
  L5_6(L6_7)
  L5_6 = Fn_captionView
  L6_7 = "sm16_00105"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOn
  L6_7 = "pccubesensor2_locator2_dock_answer_01"
  L5_6(L6_7)
  while true do
    L5_6 = Mv_isWaitPhase
    L5_6 = L5_6()
    if not L5_6 then
      L5_6 = Player
      L6_7 = L5_6
      L5_6 = L5_6.getAction
      L5_6 = L5_6(L6_7)
      L6_7 = Player
      L6_7 = L6_7.kAction_Idle
    end
    if L5_6 ~= L6_7 then
      L5_6 = wait
      L5_6()
    end
  end
  L5_6 = Mv_resetWaitPhase
  L5_6()
  L5_6 = Fn_naviKill
  L5_6()
  _more_important_navi_view = false
  L5_6 = Fn_pcSensorOff
  L6_7 = "pccubesensor2_locator2_dock_answer_01"
  L5_6(L6_7)
  L5_6 = Fn_userCtrlAllOff
  L5_6()
  L5_6 = Camera
  L6_7 = L5_6
  L5_6 = L5_6.setControl
  L7_8 = Camera
  L7_8 = L7_8.kPlayer
  L8_9 = Camera
  L8_9 = L8_9.kControl_All
  L5_6(L6_7, L7_8, L8_9, false)
  L5_6 = Fn_turnNpc
  L6_7 = "sm16_dock_answer"
  L5_6(L6_7)
  L5_6 = Fn_kaiwaDemoView
  L6_7 = "sm16_00300k"
  L5_6(L6_7)
  L5_6 = Fn_pcSensorOff
  L6_7 = "pccubesensor2_dock_distant"
  L5_6(L6_7)
  L5_6 = Fn_setNpcActive
  L6_7 = "sm16_mother"
  L7_8 = true
  L5_6(L6_7, L7_8)
  L5_6 = Fn_setNpcActive
  L6_7 = "sm16_driver"
  L7_8 = true
  L5_6(L6_7, L7_8)
  L5_6 = Fn_sendEventComSb
  L6_7 = "motherShipSetActive"
  L7_8 = true
  L5_6(L6_7, L7_8)
  L5_6 = Fn_playPlayerMotion
  L6_7 = _event_motion_table
  L6_7 = L6_7.kit_motion_look
  L7_8 = 0
  L8_9 = 0.2
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_captionViewWait
  L6_7 = "sm16_00107"
  L5_6(L6_7)
  L5_6 = {L6_7}
  L6_7 = "locator2_mother_path_01"
  L6_7 = Fn_moveNpc
  L7_8 = "sm16_mother"
  L8_9 = L5_6
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = _sdemo
  L8_9 = L7_8
  L7_8 = L7_8.set
  L7_8(L8_9, "locator2_cam_dock", _puppet_tbl.sm16_mother, kSDEMO_APPEND_ALL, Vector(0, 1.5, 0))
  L7_8 = _sdemo
  L8_9 = L7_8
  L7_8 = L7_8.play
  L7_8(L8_9)
  while true do
    L7_8 = Mv_isSafeTaskRunning
    L8_9 = L6_7
    L7_8 = L7_8(L8_9)
    if L7_8 then
      L7_8 = wait
      L7_8()
    end
  end
  L7_8 = Mv_safeTaskAbort
  L8_9 = L6_7
  L7_8 = L7_8(L8_9)
  L6_7 = L7_8
  L7_8 = Fn_captionView
  L8_9 = "sm16_00108"
  L7_8(L8_9)
  L7_8 = Fn_resetPcPos
  L8_9 = "locator2_pc_dockdemo_end_pos"
  L7_8(L8_9)
  L7_8 = wait
  L7_8()
  L7_8 = Fn_turnNpc
  L8_9 = "sm16_mother"
  L7_8(L8_9, _puppet_tbl.sm16_driver)
  L7_8 = Fn_playLoopMotionInsert
  L8_9 = "sm16_mother"
  L7_8 = L7_8(L8_9, "talk_03", {"talk_02"}, 3, 3)
  L8_9 = Fn_playLoopMotionInsert
  L8_9 = L8_9("sm16_driver", "talk_03", {"stay"}, 2, 2)
  waitSeconds(1)
  _sdemo:stop(1.5)
  waitSeconds(2)
  Fn_kaiwaDemoView("sm16_00310k")
  L7_8 = Mv_safeTaskAbort(L7_8)
  L8_9 = Mv_safeTaskAbort(L8_9)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_10, L1_11
end
function pccubesensor2_dock_OnEnter()
  Fn_pcSensorOff("pccubesensor2_dock")
  Fn_naviKill()
  _more_important_navi_view = false
  Mv_gotoNextPhase()
end
function pccubesensor2_locator2_dock_answer_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_locator2_dock_answer_01_OnLeave()
  Mv_resetWaitPhase()
end
function initializeGestureEvent()
  local L0_12
  L0_12 = {}
  L0_12.wom28 = {
    unknown_kaiwa = "sm16_00200k",
    reply_caption_skip = true,
    reply_yes = {text = nil, time = nil},
    reply_no = {text = "sm16_00133", time = 2}
  }
  L0_12.man48 = {
    known_kaiwa = "sm16_00250k",
    reply_caption_skip = true,
    reply_yes = {text = nil, time = nil},
    reply_no = {text = nil, time = nil}
  }
  L0_12.other = {
    {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm16_00133", time = 2}
    }
  }
  _gesture_find_boy = GestureEvent.create("ui_event_guide_02", nil, nil, nil)
  _gesture_find_boy:setNaviTarget(findGameObject2("Node", "locator2_navi_dock"), Vector(0, 0, 0), {
    classGroup = "yy_navi_sm16_man48",
    positiveRate = 0
  })
  _gesture_find_boy:setMobText(L0_12)
end
function pccubesensor2_client_near_distant_OnLeave()
  if _gesture_find_boy ~= nil then
    _gesture_find_boy:stop()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\228\184\128\230\153\130\229\129\156\230\173\162")
  end
  if not _more_important_navi_view then
    Fn_naviSet(findGameObject2("Node", "pccubesensor2_client_near_distant"))
    _cat_navi_view = true
  end
  Fn_captionView("sm16_00128")
end
function pccubesensor2_client_near_distant_OnEnter()
  if _gesture_find_boy ~= nil then
    _gesture_find_boy:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\229\134\141\233\150\139")
  end
  if _cat_navi_view then
    Fn_naviKill()
    _cat_navi_view = false
  end
end
function pccubesensor2_guide_OnLeave()
  local L0_13
  L0_13 = _more_important_navi_view
  if not L0_13 then
    L0_13 = nil
    if _phase == 2 then
      L0_13 = "pccubesensor2_guide_a_phase02"
    end
    if L0_13 ~= nil then
      Fn_naviSet(findGameObject2("Node", L0_13))
      _cat_navi_view = true
    end
  end
  L0_13 = _phase
  if L0_13 == 2 then
    L0_13 = Fn_captionView
    L0_13("sm16_00134")
  end
end
function pccubesensor2_guide_OnEnter()
  if _cat_navi_view then
    Fn_naviKill()
    _cat_navi_view = false
  end
end
function pccubesensor2_dock_distant_OnLeave()
  Fn_captionView("sm16_00129")
end
function pccubesensor2_dock_distant_OnEnter()
  local L0_14, L1_15
end
function pccubesensor2_catwarning_OnLeave()
  print("\232\173\166\229\145\138\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\229\135\186\227\129\159\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    if Player:isGravityControlMode() or Player:getAction() == Player.kAction_Jump then
      Player:setStay(true)
    end
    if _more_important_navi_view == false then
    end
    Fn_captionViewWait("sm16_09000")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_OnLeave()
  print("\227\131\175\227\131\188\227\131\151\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\229\135\186\227\129\159\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    Fn_catWarp()
  end)
end
