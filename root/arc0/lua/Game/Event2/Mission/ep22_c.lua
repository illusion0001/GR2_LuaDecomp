import("Wind")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
ALI_GOAL_DIST = 0.2
_puppet_tbl = {}
_ali_move = nil
_talk = nil
_time_cnt = 0
_ground_search_area = false
_sel_distance = 17
_sel_stop = 0
_sel_interval = 8.3
_voice_hdl = nil
_xer_motion = nil
_xer_mot_list = {
  walk_talk = "xer01_walk_talk_00"
}
_ali_mot_list = {
  walk_talk = "ali01_walk_talk_00"
}
_energy_gem_tbl = {
  "gem2_energy_c_01",
  "gem2_energy_c_02",
  "gem2_energy_c_03",
  "gem2_energy_c_04",
  "gem2_energy_c_05"
}
_gem = {}
_restore_gem = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = {L1_1, L2_2}
  L1_1.name = "ali_01"
  L1_1.type = "ali01"
  L1_1.node = "locator2_ali_01"
  L1_1.active = false
  L2_2.name = "xer_01"
  L2_2.type = "xer01"
  L2_2.node = "locator2_xero_01"
  L2_2.active = false
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    _puppet_tbl[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
  end
  sdemo = L1_1
  sdemo02 = L1_1
  L4_4 = "locator2_hear_aim_01"
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = _puppet_tbl
  L4_4 = L4_4.xer_01
  L5_5 = true
  L1_1(L2_2, L3_3, L4_4, L5_5)
  L4_4 = 0
  L5_5 = 0
  L4_4 = Vector
  L5_5 = 0
  L5_5 = L4_4(L5_5, 0.8, 0)
  L1_1(L2_2, L3_3, L4_4, L5_5, L4_4(L5_5, 0.8, 0))
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  for L4_4, L5_5 in L1_1(L2_2) do
    _gem[L4_4] = findGameObject2("Gem", L5_5)
    _restore_gem[L4_4] = findGameObject2("Gem", L5_5)
  end
end
function Ingame()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15
  L0_6 = print
  L1_7 = "C\227\131\145\227\131\188\227\131\136\233\150\139\229\167\139++++++++++++++++++++++++++++++++++++++++++"
  L0_6(L1_7)
  L0_6 = Wind
  L1_7 = L0_6
  L0_6 = L0_6.setIntensity
  L2_8 = 0
  L0_6(L1_7, L2_8)
  L0_6 = Fn_setCatActive
  L1_7 = true
  L0_6(L1_7)
  L0_6 = Fn_findAreaHandle
  L1_7 = "et2_a_root"
  L0_6 = L0_6(L1_7)
  L2_8 = L0_6
  L1_7 = L0_6.findChildNode
  L3_9 = "et2_door_oc_01_01"
  L4_10 = true
  L1_7 = L1_7(L2_8, L3_9, L4_10)
  L3_9 = L0_6
  L2_8 = L0_6.findChildNode
  L4_10 = "et2_door_oc_02_01"
  L5_11 = true
  L2_8 = L2_8(L3_9, L4_10, L5_11)
  L4_10 = L1_7
  L3_9 = L1_7.setRot
  L5_11 = XYZRotQuaternionEular
  L6_12 = 0
  L7_13 = 120
  L8_14 = 0
  L9_15 = L5_11(L6_12, L7_13, L8_14)
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L5_11(L6_12, L7_13, L8_14))
  L4_10 = L2_8
  L3_9 = L2_8.setRot
  L5_11 = XYZRotQuaternionEular
  L6_12 = 0
  L7_13 = -120
  L8_14 = 0
  L9_15 = L5_11(L6_12, L7_13, L8_14)
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L5_11(L6_12, L7_13, L8_14))
  L3_9 = createGameObject2
  L4_10 = "PlayerSensor"
  L3_9 = L3_9(L4_10)
  _ali_sensor = L3_9
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.setDetectBehavior
  L5_11 = 1
  L3_9(L4_10, L5_11)
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.addBox
  L5_11 = Vector
  L6_12 = 8.2
  L7_13 = 3
  L8_14 = 8.8
  L9_15 = L5_11(L6_12, L7_13, L8_14)
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L5_11(L6_12, L7_13, L8_14))
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.setPos
  L5_11 = Vector
  L6_12 = 0
  L7_13 = 0.7
  L8_14 = 0
  L9_15 = L5_11(L6_12, L7_13, L8_14)
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L5_11(L6_12, L7_13, L8_14))
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.setOnEnter
  L5_11 = "_ali_sensorOnEnter"
  L3_9(L4_10, L5_11)
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.setOnLeave
  L5_11 = "_ali_sensorOnLeave"
  L3_9(L4_10, L5_11)
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.setActive
  L5_11 = false
  L3_9(L4_10, L5_11)
  L3_9 = _puppet_tbl
  L3_9 = L3_9.ali_01
  L4_10 = L3_9
  L3_9 = L3_9.appendChild
  L5_11 = _ali_sensor
  L3_9(L4_10, L5_11)
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.try_init
  L3_9(L4_10)
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.waitForReady
  L3_9(L4_10)
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.try_start
  L3_9(L4_10)
  L3_9 = Fn_resetPcPos
  L4_10 = "locator2_pc_start_pos"
  L3_9(L4_10)
  L3_9 = Fn_switchDayAndNight
  L4_10 = false
  L3_9(L4_10)
  L3_9 = print
  L4_10 = "\229\164\156\227\129\171\227\129\151\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129"
  L3_9(L4_10)
  L3_9 = Fn_missionStart
  L3_9()
  L3_9 = Fn_kaiwaDemoView
  L4_10 = "ep22_00310k"
  L3_9(L4_10)
  L3_9 = Fn_userCtrlOn
  L3_9()
  L3_9 = Mv_waitPhase
  L3_9()
  L3_9 = Player
  L4_10 = L3_9
  L3_9 = L3_9.getAttrTune
  L3_9 = L3_9(L4_10)
  L4_10 = Player
  L4_10 = L4_10.kAttrTune_Normal
  if L3_9 ~= L4_10 then
    L3_9 = Player
    L4_10 = L3_9
    L3_9 = L3_9.setAttrTune
    L5_11 = Player
    L5_11 = L5_11.kAttrTune_Normal
    L6_12 = false
    L3_9(L4_10, L5_11, L6_12)
  end
  L3_9 = Player
  L4_10 = L3_9
  L3_9 = L3_9.isGravityControlMode
  L3_9 = L3_9(L4_10)
  if L3_9 then
    L3_9 = Fn_coercionGravityRevert
    L3_9()
    L3_9 = Player
    L4_10 = L3_9
    L3_9 = L3_9.setStay
    L5_11 = true
    L3_9(L4_10, L5_11)
  else
    L3_9 = Fn_userCtrlOff
    L3_9()
  end
  L3_9 = Camera
  L4_10 = L3_9
  L3_9 = L3_9.setControl
  L5_11 = Camera
  L5_11 = L5_11.kPlayer
  L6_12 = Camera
  L6_12 = L6_12.kControl_All
  L7_13 = false
  L3_9(L4_10, L5_11, L6_12, L7_13)
  L3_9 = Sound
  L4_10 = L3_9
  L3_9 = L3_9.playSE
  L5_11 = "xeo_006"
  L6_12 = 0.5
  L7_13 = ""
  L8_14 = nil
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14)
  L3_9 = waitSeconds
  L4_10 = 0.5
  L3_9(L4_10)
  L3_9 = Fn_captionViewWait
  L4_10 = "ep22_02000"
  L3_9(L4_10)
  L3_9 = waitSeconds
  L4_10 = 0.8
  L3_9(L4_10)
  L3_9 = Fn_blackout
  L3_9()
  L3_9 = Fn_resetPcPos
  L4_10 = "locator2_sdemo_pos_02"
  L3_9(L4_10)
  L3_9 = Fn_setNpcActive
  L4_10 = "xer_01"
  L5_11 = true
  L3_9(L4_10, L5_11)
  L3_9 = Fn_setNpcActive
  L4_10 = "ali_01"
  L5_11 = true
  L3_9(L4_10, L5_11)
  L3_9 = sdemo
  L4_10 = L3_9
  L3_9 = L3_9.set
  L5_11 = "locator2_hear_cam_02"
  L6_12 = "locator2_hear_aim_02"
  L3_9(L4_10, L5_11, L6_12)
  L3_9 = sdemo
  L4_10 = L3_9
  L3_9 = L3_9.setCameraParam
  L5_11 = nil
  L6_12 = 0.1
  L7_13 = nil
  L3_9(L4_10, L5_11, L6_12, L7_13)
  L3_9 = sdemo
  L4_10 = L3_9
  L3_9 = L3_9.play
  L3_9(L4_10)
  L3_9 = Fn_fadein
  L3_9()
  L3_9 = wait
  L4_10 = 5
  L3_9(L4_10)
  L3_9 = Sound
  L4_10 = L3_9
  L3_9 = L3_9.playSE
  L5_11 = "ali_010"
  L6_12 = 0.5
  L7_13 = ""
  L8_14 = nil
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14)
  L3_9 = waitSeconds
  L4_10 = 1
  L3_9(L4_10)
  L3_9 = Fn_captionViewWait
  L4_10 = "ep22_02001"
  L3_9(L4_10)
  L3_9 = alixeroMove
  L3_9()
  L3_9 = waitSeconds
  L4_10 = 0.4
  L3_9(L4_10)
  L3_9 = sdemo02
  L4_10 = L3_9
  L3_9 = L3_9.play
  L3_9(L4_10)
  sdemo = nil
  L3_9 = Fn_resetPcPos
  L4_10 = "locator2_sdemo_pos_03"
  L3_9(L4_10)
  L3_9 = waitSeconds
  L4_10 = 2
  L3_9(L4_10)
  L3_9 = Fn_captionViewWait
  L4_10 = "ep22_02002"
  L3_9(L4_10)
  L3_9 = Fn_kaiwaDemoView
  L4_10 = "ep22_00320k"
  L3_9(L4_10)
  L3_9 = sdemo02
  L4_10 = L3_9
  L3_9 = L3_9.stop
  L5_11 = 2
  L3_9(L4_10, L5_11)
  L3_9 = Player
  L4_10 = L3_9
  L3_9 = L3_9.setStay
  L5_11 = false
  L3_9(L4_10, L5_11)
  L3_9 = Fn_userCtrlOn
  L3_9()
  L3_9 = Camera
  L4_10 = L3_9
  L3_9 = L3_9.setControl
  L5_11 = Camera
  L5_11 = L5_11.kPlayer
  L6_12 = Camera
  L6_12 = L6_12.kControl_All
  L7_13 = true
  L3_9(L4_10, L5_11, L6_12, L7_13)
  L3_9 = _ali_sensor
  L4_10 = L3_9
  L3_9 = L3_9.setActive
  L5_11 = true
  L3_9(L4_10, L5_11)
  L3_9 = Fn_missionView
  L4_10 = "ep22_02003"
  L3_9(L4_10)
  L3_9 = 25
  L4_10 = 35
  L5_11 = 0
  L6_12 = false
  L7_13 = false
  L8_14 = nil
  L9_15 = invokeTask
  L9_15 = L9_15(function()
    local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24
    while true do
      L0_16 = _puppet_tbl
      L0_16 = L0_16.ali_01
      L1_17 = L0_16
      L0_16 = L0_16.getWorldPos
      L0_16 = L0_16(L1_17)
      L5_11 = L0_16
      L0_16 = L5_11.y
      L0_16 = L0_16 + 1
      L5_11.y = L0_16
      L0_16 = L5_11.z
      L0_16 = L0_16 - 2
      L5_11.z = L0_16
      L0_16 = Fn_getDistanceToPlayer
      L1_17 = L5_11
      L0_16 = L0_16(L1_17)
      L1_17 = _ground_search_area
      if L1_17 then
        L1_17 = Fn_getPcPosRot
        L2_18 = L1_17()
        L3_19 = L1_17.y
        L3_19 = L3_19 + 0.7
        L1_17.y = L3_19
        L3_19 = _puppet_tbl
        L3_19 = L3_19.xer_01
        L4_20 = L3_19
        L3_19 = L3_19.getWorldPos
        L3_19 = L3_19(L4_20)
        L4_20 = L3_19.y
        L4_20 = L4_20 + 1.5
        L3_19.y = L4_20
        L4_20 = Query
        L5_21 = L4_20
        L4_20 = L4_20.setEyeSightTransform
        L6_22 = L1_17
        L7_23 = L2_18
        L4_20(L5_21, L6_22, L7_23)
        L4_20 = Query
        L5_21 = L4_20
        L4_20 = L4_20.setEyeSightAngle
        L6_22 = Deg2Rad
        L7_23 = 60
        L8_24 = L6_22(L7_23)
        L4_20(L5_21, L6_22, L7_23, L8_24, L6_22(L7_23))
        L4_20 = Query
        L5_21 = L4_20
        L4_20 = L4_20.setEyeSightRange
        L6_22 = 30
        L4_20(L5_21, L6_22)
        L4_20 = Query
        L5_21 = L4_20
        L4_20 = L4_20.debugDrawEyeSight
        L6_22 = {}
        L6_22.r = 1
        L6_22.g = 1
        L6_22.b = 1
        L4_20(L5_21, L6_22)
        L4_20 = Query
        L5_21 = L4_20
        L4_20 = L4_20.raycastEyeSight
        L6_22 = L3_19
        L4_20 = L4_20(L5_21, L6_22)
        L5_21 = false
        if not L4_20 then
          L6_22 = DebugDraw
          L7_23 = L6_22
          L6_22 = L6_22.setColor
          L8_24 = 0
          L6_22(L7_23, L8_24, 1, 0)
          L5_21 = true
        else
          L6_22 = DebugDraw
          L7_23 = L6_22
          L6_22 = L6_22.setColor
          L8_24 = 1
          L6_22(L7_23, L8_24, 0, 0)
          L5_21 = false
        end
        L6_22 = DebugDraw
        L7_23 = L6_22
        L6_22 = L6_22.drawLines
        L8_24 = {L1_17, L3_19}
        L6_22(L7_23, L8_24)
        if L5_21 then
          _time_cnt = 0
          L6_22 = Mv_safeTaskAbort
          L7_23 = _ali_move
          L6_22(L7_23)
          L6_22 = Mv_safeTaskAbort
          L7_23 = _talk
          L6_22(L7_23)
          L6_22 = Fn_playMotionNpc
          L7_23 = "xer_01"
          L8_24 = "stay"
          L6_22(L7_23, L8_24, false)
          L6_22 = Fn_playMotionNpc
          L7_23 = "ali_01"
          L8_24 = "stay"
          L6_22(L7_23, L8_24, false)
          L6_22 = Mv_safeTaskAbort
          L7_23 = L8_14
          L6_22 = L6_22(L7_23)
          L8_14 = L6_22
          L6_22 = Sound
          L7_23 = L6_22
          L6_22 = L6_22.stopSEHandle
          L8_24 = _voice_hdl
          L6_22(L7_23, L8_24)
          L6_22 = print
          L7_23 = "\227\131\156\227\130\164\227\130\185\229\129\156\230\173\162\239\188\129"
          L6_22(L7_23)
          L6_22 = wait
          L6_22()
          L6_22 = RandI
          L7_23 = 1
          L8_24 = 2
          L6_22 = L6_22(L7_23, L8_24)
          L7_23 = print
          L8_24 = "rand_num ="
          L7_23(L8_24, L6_22)
          L7_23 = nil
          if L6_22 == 1 then
            L7_23 = "xeo_801a"
          elseif L6_22 == 2 then
            L7_23 = "xeo_801b"
          end
          L8_24 = Sound
          L8_24 = L8_24.playSEHandle
          L8_24 = L8_24(L8_24, L7_23, 1, "", _puppet_tbl.xer_01)
          _voice_hdl = L8_24
          L8_24 = Fn_captionView
          L8_24("ep22_02004")
          L8_24 = invokeTask
          L8_24(function()
            Fn_turnNpc("xer_01")
            Fn_turnNpc("ali_01")
          end)
          L8_24 = Mv_viewObj
          L8_24 = L8_24(_puppet_tbl.xer_01)
          Player:setStay(true)
          Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
          waitSeconds(2)
          Fn_captionViewEnd()
          L8_24 = Mv_safeTaskAbort(L8_24)
          Fn_blackout(1)
          Sound:stopSEHandle(_voice_hdl)
          Fn_resetPcPos("locator2_resetpos_retry_01")
          Fn_warpNpc("ali_01", "locator2_ali_01")
          Fn_warpNpc("xer_01", "locator2_xero_01")
          gemRestore()
          _ground_search_area = false
          L7_13 = false
          L6_12 = false
          L3_9 = 25
          L4_10 = 35
          _sel_distance = 17
          _time_cnt = 0
          Fn_fadein(1)
          waitSeconds(1)
          Player:setStay(false)
          Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
          alixeroMove()
          alixeroTalk()
        end
      end
      L1_17 = Fn_get_distance
      L2_18 = _puppet_tbl
      L2_18 = L2_18.xer_01
      L3_19 = L2_18
      L2_18 = L2_18.getWorldPos
      L2_18 = L2_18(L3_19)
      L3_19 = findGameObject2
      L4_20 = "Node"
      L5_21 = "locator2_in_audience_01"
      L3_19 = L3_19(L4_20, L5_21)
      L4_20 = L3_19
      L3_19 = L3_19.getWorldPos
      L8_24 = L3_19(L4_20)
      L1_17 = L1_17(L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L3_19(L4_20))
      if L1_17 < 2 then
        L1_17 = L6_12
        if L1_17 == false then
          L1_17 = 34
          L3_9 = L1_17
          L1_17 = 44
          L4_10 = L1_17
          _sel_distance = 24
          L1_17 = true
          L6_12 = L1_17
          L1_17 = print
          L2_18 = "\232\166\139\229\164\177\227\129\134\232\183\157\233\155\162\228\188\184\227\129\176\227\129\151\227\129\159\239\188\129\239\188\129\239\188\129"
          L1_17(L2_18)
        end
      end
      L1_17 = wait
      L1_17()
    end
  end)
  alixeroTalk()
  Mv_waitPhase()
  L9_15 = Mv_safeTaskAbort(L9_15)
  _talk = Mv_safeTaskAbort(_talk)
  Sound:stopSEHandle(_voice_hdl)
  _voice_hdl = nil
  Fn_captionViewEnd()
  wait()
  Fn_findNpc("xer_01"):turn(_puppet_tbl.ali_01)
  Fn_findNpc("ali_01"):turn(_puppet_tbl.xer_01)
  repeat
    wait()
  until Fn_findNpc("ali_01"):isTurnEnd()
  repeat
    wait()
  until Fn_findNpc("xer_01"):isTurnEnd()
  _xer_motion = Fn_playLoopMotionInsert("xer_01", "talk_00", {"talk_00"}, 3, 5)
  Fn_playMotionNpc("ali_01", "stay", false)
  Fn_pcSensorOn("pccubesensor2_near_throne_01")
  Mv_waitPhase()
  Fn_pcSensorOff("pccubesensor2_near_throne_01")
  _xer_motion = Mv_safeTaskAbort(_xer_motion)
  Fn_playMotionNpc("xer_01", "stay", false)
  Fn_kaiwaDemoView("ep22_00350k")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Wind:setWind()
end
function pccubesensor2_hear_OnEnter()
  Fn_pcSensorOff("pccubesensor2_hear")
  Mv_gotoNextPhase()
end
function _ali_sensorOnEnter(A0_25)
  local L1_26
  _ground_search_area = true
end
function _ali_sensorOnLeave(A0_27)
  local L1_28
  _ground_search_area = false
end
function alixeroMove()
  _ali_move = invokeTask(function()
    Fn_playMotionNpc("xer_01", _xer_mot_list.walk_talk, false)
    wait(10)
    Fn_playMotionNpc("ali_01", _ali_mot_list.walk_talk, false)
    while true do
      while true do
        if Fn_get_distance(_puppet_tbl.xer_01:getWorldPos(), findGameObject2("Node", "locator2_xero_02"):getWorldPos()) < ALI_GOAL_DIST then
          Fn_playMotionNpc("xer_01", "stay", false)
          Mv_safeTaskAbort(_talk)
          break
        end
        wait()
      end
    end
    while true do
      if Fn_get_distance(_puppet_tbl.ali_01:getWorldPos(), findGameObject2("Node", "locator2_ali_02"):getWorldPos()) < ALI_GOAL_DIST then
        Fn_playMotionNpc("ali_01", "stay", false)
        break
      end
      wait()
    end
    Mv_gotoNextPhase()
  end)
end
function pccubesensor2_near_throne_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_near_throne_01_OnLeave()
  Mv_resetWaitPhase()
end
function alixeroTalk()
  local L0_29, L1_30, L2_31, L3_32, L4_33
  L0_29 = false
  L1_30 = 0
  L2_31 = 0
  L3_32 = {}
  L4_33 = false
  _talk = invokeTask(function()
    while true do
      waitSeconds(1)
      _time_cnt = _time_cnt + 1
      _sel_stop = _sel_stop - 1
      print(_time_cnt)
      L2_31 = _puppet_tbl.ali_01:getWorldPos()
      L2_31.y = L2_31.y + 4
      L2_31.z = L2_31.z - 1
      L1_30 = math.floor(_time_cnt / _sel_interval)
      if L1_30 >= 6 then
        print("mes_count\227\129\1406\228\187\165\228\184\138\227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167alixeroTalk\227\130\146break\239\188\129\239\188\129\239\188\129")
        break
      end
      if Fn_getDistanceToPlayer(L2_31) <= _sel_distance and _sel_stop <= 0 then
        L3_32[0] = function()
          _voice_hdl = Sound:playSEHandle("xeo_006", 1, "", _puppet_tbl.xer_01)
          Fn_captionView("ep22_02007", _sel_interval)
        end
        L3_32[1] = function()
          _voice_hdl = Sound:playSEHandle("ali_010", 1, "", _puppet_tbl.ali_01)
          Fn_captionView("ep22_02008", _sel_interval)
        end
        L3_32[2] = function()
          _voice_hdl = Sound:playSEHandle("xeo_007", 1, "", _puppet_tbl.xer_01)
          Fn_captionView("ep22_02009", _sel_interval)
        end
        L3_32[3] = function()
          _voice_hdl = Sound:playSEHandle("ali_011", 1, "", _puppet_tbl.ali_01)
          Fn_captionView("ep22_02010", _sel_interval)
        end
        L3_32[4] = function()
          _voice_hdl = Sound:playSEHandle("xeo_008", 1, "", _puppet_tbl.xer_01)
          Fn_captionView("ep22_02011", _sel_interval)
        end
        L3_32[5] = function()
          _voice_hdl = Sound:playSEHandle("ali_012", 1, "", _puppet_tbl.ali_01)
          Fn_captionView("ep22_02012", _sel_interval)
          L4_33 = true
        end
        if not L4_33 then
          Sound:stopSEHandle(_voice_hdl)
          L3_32[L1_30]()
          waitSeconds(3)
          _sel_stop = _sel_interval - _time_cnt % _sel_interval
          print("sel" .. _sel_stop)
          if Fn_getDistanceToPlayer(L2_31) <= _sel_distance + 3 and _sel_stop <= 0 then
            L3_32[0] = function()
              _voice_hdl = Sound:playSEHandle("xeo_006", 1, "", _puppet_tbl.xer_01)
              Fn_captionView("ep22_02015", _sel_interval)
            end
            L3_32[1] = function()
              _voice_hdl = Sound:playSEHandle("ali_010", 1, "", _puppet_tbl.ali_01)
              Fn_captionView("ep22_02016", _sel_interval)
            end
            L3_32[2] = function()
              _voice_hdl = Sound:playSEHandle("xeo_007", 1, "", _puppet_tbl.xer_01)
              Fn_captionView("ep22_02017", _sel_interval)
            end
            L3_32[3] = function()
              _voice_hdl = Sound:playSEHandle("ali_011", 1, "", _puppet_tbl.ali_01)
              Fn_captionView("ep22_02018", _sel_interval)
            end
            L3_32[4] = function()
              _voice_hdl = Sound:playSEHandle("xeo_008", 1, "", _puppet_tbl.xer_01)
              Fn_captionView("ep22_02019", _sel_interval)
            end
            L3_32[5] = function()
              _voice_hdl = Sound:playSEHandle("ali_012", 1, "", _puppet_tbl.ali_01)
              Fn_captionView("ep22_02020", _sel_interval)
              L4_33 = true
            end
            if not L4_33 then
              Sound:stopSEHandle(_voice_hdl)
              L3_32[L1_30]()
              waitSeconds(3)
              _sel_stop = _sel_interval - _time_cnt % _sel_interval
              print("sel" .. _sel_stop)
            end
          end
        end
      end
    end
  end)
end
function createGem(A0_34, A1_35)
  local L2_36, L3_37, L4_38
  L3_37 = A0_34
  L2_36 = A0_34.getName
  L2_36 = L2_36(L3_37)
  L3_37 = createGameObject2
  L4_38 = "Gem"
  L3_37 = L3_37(L4_38)
  L4_38 = L3_37.setGemModelNo
  L4_38(L3_37, A1_35)
  L4_38 = A0_34.getWorldPos
  L4_38 = L4_38(A0_34)
  L4_38 = L4_38 + Vector(0, 0, 0)
  L3_37:setWorldPos(L4_38)
  L3_37:setForceMove()
  L3_37:setVisible(true)
  L3_37:try_init()
  L3_37:setVisibleBlockHalfSize(150)
  L3_37:waitForReadyAsync(function()
    L3_37:try_start()
  end)
  return L3_37
end
function gemRestore()
  for _FORV_3_, _FORV_4_ in pairs(_energy_gem_tbl) do
    if _gem[_FORV_3_] ~= nil then
      _gem[_FORV_3_]:kill()
      _gem[_FORV_3_] = nil
      _gem[_FORV_3_] = createGem(_restore_gem[_FORV_3_], 4)
    end
  end
end
