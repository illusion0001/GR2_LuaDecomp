dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm27_common.lua")
photography_answer = false
photography_correct_mode = false
photography_end = false
surveyor_talk = {
  {
    5,
    "sm27_01000",
    "m32_013"
  },
  {
    5,
    "sm27_01001",
    "m32_013"
  },
  {
    5,
    "sm27_01002",
    "m32_921b"
  },
  {
    20,
    "sm27_01003",
    "m32_931"
  },
  {
    10,
    "sm27_01004",
    "m32_931"
  }
}
_becon_effect_list = {
  "ef_ev_glw_red",
  "ef_ev_glw_blue",
  "ef_ev_glw_yellow"
}
in_lighthouse_sensor_flag = false
surveyor_distance_talk = false
camera_wrong_sensor_flag = false
camera_wrong_catwarp_change = false
_beacon_objs = {}
_becon_effects = {}
sdemo = nil
sm27_surveyor_motion_table = {
  repair_00 = "man01_repair_00",
  scared_high_00 = "man01_scared_high_00"
}
_beaconObjHdl = {}
_hitCaptionCnt = 0
HINT_CAPTION_WAIT = 30
PHOTOGRAPHY_WAIT = 900
_photo = nil
_photoCaption = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  L0_0()
  L0_0(L1_1, L2_2)
  L3_3 = "beacon_setup_01"
  L3_3 = L2_2(L3_3, "beacon_md_01", "locator2_beacon_setup_01", true, false, nil, false, "beacon_md_01_sm27")
  L0_0(L1_1, L2_2, L3_3, L2_2(L3_3, "beacon_md_01", "locator2_beacon_setup_01", true, false, nil, false, "beacon_md_01_sm27"))
  L3_3 = "beacon_setup_02"
  L3_3 = L2_2(L3_3, "beacon_md_01", "locator2_beacon_setup_02", true, false, nil, false, "beacon_md_01_sm27")
  L0_0(L1_1, L2_2, L3_3, L2_2(L3_3, "beacon_md_01", "locator2_beacon_setup_02", true, false, nil, false, "beacon_md_01_sm27"))
  L3_3 = "beacon_setup_03"
  L3_3 = L2_2(L3_3, "beacon_md_01", "locator2_beacon_setup_03", true, false, nil, false, "beacon_md_01_sm27")
  L0_0(L1_1, L2_2, L3_3, L2_2(L3_3, "beacon_md_01", "locator2_beacon_setup_03", true, false, nil, false, "beacon_md_01_sm27"))
  for L3_3 = 1, #L1_1 do
    findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", L3_3)):getWorldTransform().y = findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", L3_3)):getWorldTransform().y + 1.5
    _becon_effects[L3_3] = RAC_createEffect({
      eff_name = _becon_effect_list[L3_3],
      world_pos = findGameObject2("Node", "locator2_beacon_setup_" .. string.format("%02d", L3_3)):getWorldTransform()
    })
  end
  L0_0(L1_1)
  sdemo = L0_0
  _hitCaptionCnt = 0
  _beaconObjHdl = L0_0
  for L3_3 = 1, #L1_1 do
    _beaconObjHdl[L3_3] = findGameObject2("Node", "locator2_beacon_dummy_" .. string.format("%02d", L3_3))
  end
  _photo = nil
  _photoCaption = nil
  L0_0(L1_1, L2_2)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26
  L0_4 = Fn_userCtrlAllOff
  L0_4()
  L0_4 = Fn_warpNpc
  L1_5 = "sm27_client"
  L2_6 = "locator2_beacon_surveyor_03"
  L0_4(L1_5, L2_6)
  L0_4 = Fn_playNpcEventMotion
  L1_5 = "sm27_client"
  L2_6 = sm27_surveyor_motion_table
  L2_6 = L2_6.scared_high_00
  L3_7 = -1
  L4_8 = 0
  L5_9 = false
  L0_4(L1_5, L2_6, L3_7, L4_8, L5_9)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.reset
  L0_4(L1_5)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.set
  L2_6 = "locator2_sdemo_beacon03_cam_03"
  L3_7 = "beacon_setup_03"
  L4_8 = false
  L5_9 = Vector
  L6_10 = 0
  L7_11 = 1.5
  L8_12 = 0
  L21_25 = L5_9(L6_10, L7_11, L8_12)
  L0_4(L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L5_9(L6_10, L7_11, L8_12))
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.play
  L0_4(L1_5)
  L0_4 = Fn_missionStart
  L0_4()
  L0_4 = waitSeconds
  L1_5 = 2
  L0_4(L1_5)
  L0_4 = Fn_kaiwaDemoView
  L1_5 = "sm27_00600k"
  L0_4(L1_5)
  L0_4 = sdemo
  L1_5 = L0_4
  L0_4 = L0_4.stop
  L0_4(L1_5)
  L0_4 = Fn_userCtrlOn
  L0_4()
  L0_4 = Fn_findNpcPuppet
  L1_5 = "sm27_client"
  L0_4 = L0_4(L1_5)
  L1_5 = Player
  L2_6 = L1_5
  L1_5 = L1_5.setGrabExceptionalObject
  L3_7 = {
    [20] = L4_8(L5_9)
  }
  L5_9 = L0_4
  L4_8 = L0_4.getName
  L21_25 = L4_8(L5_9)
  ;({
    [20] = L4_8(L5_9)
  })[1] = L4_8
  ;({
    [20] = L4_8(L5_9)
  })[2] = L5_9
  ;({
    [20] = L4_8(L5_9)
  })[3] = L6_10
  ;({
    [20] = L4_8(L5_9)
  })[4] = L7_11
  ;({
    [20] = L4_8(L5_9)
  })[5] = L8_12
  ;({
    [20] = L4_8(L5_9)
  })[6] = L9_13
  ;({
    [20] = L4_8(L5_9)
  })[7] = L10_14
  ;({
    [20] = L4_8(L5_9)
  })[8] = L11_15
  ;({
    [20] = L4_8(L5_9)
  })[9] = L12_16
  ;({
    [20] = L4_8(L5_9)
  })[10] = L13_17
  ;({
    [20] = L4_8(L5_9)
  })[11] = L14_18
  ;({
    [20] = L4_8(L5_9)
  })[12] = L15_19
  ;({
    [20] = L4_8(L5_9)
  })[13] = L16_20
  ;({
    [20] = L4_8(L5_9)
  })[14] = L17_21
  ;({
    [20] = L4_8(L5_9)
  })[15] = L18_22
  ;({
    [20] = L4_8(L5_9)
  })[16] = L19_23
  ;({
    [20] = L4_8(L5_9)
  })[17] = L20_24
  ;({
    [20] = L4_8(L5_9)
  })[18] = L21_25
  ;({
    [20] = L4_8(L5_9)
  })[19] = L22_26
  L1_5(L2_6, L3_7)
  L1_5 = RAC_startCatWarpControl
  L2_6 = "sm27_outrange_warp"
  L3_7 = nil
  L4_8 = "pccubesensor2_out_of_range_01"
  L5_9 = "pccubesensor2_out_of_range_02"
  L6_10 = "locator2_pc_start_pos"
  L7_11, L8_12 = nil, nil
  L9_13 = "sm27_00121"
  L10_14, L11_15 = nil, nil
  L1_5(L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15)
  L1_5 = Fn_missionView
  L2_6 = "sm27_01005"
  L1_5(L2_6)
  L1_5 = Fn_setGrabNpc
  L2_6 = "sm27_client"
  L3_7 = false
  L4_8 = false
  L1_5(L2_6, L3_7, L4_8)
  L1_5 = WaitSecondsGrab
  L2_6 = "sm27_client"
  L3_7 = RAC_OPERATION_TUTORIAL_DELAY_DEFAULT
  L1_5(L2_6, L3_7)
  L1_5 = invokeTask
  function L2_6()
    while true do
      if true then
        if Fn_getDistanceToPlayer(L0_4) >= 10 then
          Fn_captionViewWait("sm27_01006")
        end
      else
      end
      wait()
    end
  end
  L1_5 = L1_5(L2_6)
  L2_6 = RAC_grabNpcCaptionWait
  L3_7 = "sm27_client"
  L4_8 = {L5_9, L6_10}
  L5_9 = {}
  L5_9.caption = "ic_tutorial_00410"
  L5_9.range = 3
  L5_9.time = 0
  L6_10 = {}
  L6_10.caption = nil
  L6_10.range = 10
  L2_6(L3_7, L4_8)
  L3_7 = L1_5
  L2_6 = L1_5.abort
  L2_6(L3_7)
  L1_5 = nil
  L2_6 = waitSeconds
  L3_7 = 1
  L2_6(L3_7)
  L2_6 = HUD
  L3_7 = L2_6
  L2_6 = L2_6.info
  L4_8 = "sm27_info_01"
  L5_9 = false
  L2_6(L3_7, L4_8, L5_9)
  L2_6 = RAC_startCatWarpControl
  L3_7 = "sm27_outrange_warp"
  L4_8 = nil
  L5_9 = "pccubesensor2_out_of_range_01"
  L6_10 = "pccubesensor2_out_of_range_02"
  L7_11 = "locator2_pc_start_pos"
  L8_12, L9_13 = nil, nil
  L10_14 = "sm27_01020"
  L11_15 = sm27_outrange_before
  L12_16 = sm27_outrange_after
  L2_6(L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16)
  L2_6 = Player
  L3_7 = L2_6
  L2_6 = L2_6.setGrabExceptionalObject
  L4_8 = {}
  L2_6(L3_7, L4_8)
  L2_6 = Fn_captionViewWait
  L3_7 = "sm27_01007"
  L2_6(L3_7)
  L2_6, L3_7 = nil, nil
  L4_8 = false
  L5_9 = invokeTask
  function L6_10()
    local L0_27, L1_28, L2_29, L3_30, L4_31
    for L3_30 = 1, #L1_28 do
      L4_31 = 0
      repeat
        waitSeconds(1)
        if (Player:getAction() == Player.kAction_Float or Player:getAction() == Player.kAction_Jump) and surveyor_distance_talk == false and RAC_isBusyCatWarp("sm27_outrange_warp") == false then
          L4_31 = L4_31 + 1
          print("TALK COUNT UP :" .. L4_31)
        end
      until L4_31 > surveyor_talk[L3_30][1]
      if surveyor_distance_talk == false and RAC_isBusyCatWarp("sm27_outrange_warp") == false then
        Sound:playSE(surveyor_talk[L3_30][3])
        L4_8 = true
        Fn_captionViewWait(surveyor_talk[L3_30][2])
        L4_8 = false
      end
    end
  end
  L5_9 = L5_9(L6_10)
  L6_10 = invokeTask
  function L7_11()
    repeat
      Photo.create(kPHOTO_CAPTION_OFF, kPHOTO_TYPE_ALL, false, {near = 0.5, far = 200}, {
        left = -0.5,
        right = 0.5,
        top = -0.5,
        bottom = 0.5
      }):run()
      repeat
        wait()
      until not Photo.create(kPHOTO_CAPTION_OFF, kPHOTO_TYPE_ALL, false, {near = 0.5, far = 200}, {
        left = -0.5,
        right = 0.5,
        top = -0.5,
        bottom = 0.5
      }):isRunning()
      if Player:getAction() == Player.kAction_Float then
        Fn_captionViewLock("sm27_01018")
      end
      wait()
    until photography_correct_mode
  end
  L6_10 = L6_10(L7_11)
  L7_11 = 0
  L8_12 = false
  L9_13, L10_14 = nil, nil
  while true do
    while true do
      L11_15 = photography_end
      if not L11_15 then
        L11_15 = Fn_userCtrlOn
        L11_15()
        L11_15 = kPHOTO_CAPTION_ON
        _photoCaption = true
        if L10_14 then
          L11_15 = kPHOTO_CAPTION_OFF
          _photoCaption = false
          L12_16 = print
          L13_17 = "_photo\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\230\182\136\227\129\153"
          L12_16(L13_17)
        end
        L12_16 = Photo
        L12_16 = L12_16.create
        L13_17 = L11_15
        L14_18 = kPHOTO_TYPE_ALL
        L15_19 = true
        L16_20 = {}
        L16_20.near = 0.5
        L16_20.far = 200
        L17_21 = {}
        L17_21.left = -0.5
        L17_21.right = 0.5
        L17_21.top = -0.5
        L17_21.bottom = 0.5
        L12_16 = L12_16(L13_17, L14_18, L15_19, L16_20, L17_21, L18_22)
        _photo = L12_16
        L12_16 = _photo
        L13_17 = L12_16
        L12_16 = L12_16.set
        L14_18 = findGameObject2
        L15_19 = "Node"
        L16_20 = "locator2_beacon_dummy_01"
        L21_25 = L14_18(L15_19, L16_20)
        L12_16(L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L14_18(L15_19, L16_20))
        L12_16 = _photo
        L13_17 = L12_16
        L12_16 = L12_16.set
        L14_18 = findGameObject2
        L15_19 = "Node"
        L16_20 = "locator2_beacon_dummy_02"
        L21_25 = L14_18(L15_19, L16_20)
        L12_16(L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L14_18(L15_19, L16_20))
        L12_16 = _photo
        L13_17 = L12_16
        L12_16 = L12_16.set
        L14_18 = findGameObject2
        L15_19 = "Node"
        L16_20 = "locator2_beacon_dummy_03"
        L21_25 = L14_18(L15_19, L16_20)
        L12_16(L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L14_18(L15_19, L16_20))
        L12_16 = Event_distance_beacon_task
        L12_16 = L12_16()
        L3_7 = L12_16
        L12_16 = false
        function L13_17()
          _photo:run()
          wait()
          invokeTask(function()
            local L0_32
            repeat
              L0_32 = wait
              L0_32()
              L0_32 = _photo
              L0_32 = L0_32.getPhotoState
              L0_32 = L0_32(L0_32)
              if L0_32 and type(L0_32) == "table" then
                for _FORV_5_, _FORV_6_ in ipairs(L0_32) do
                end
                if RESULT_NG == RESULT_OK then
                  Fn_missionViewEnd()
                end
              end
            until not _photo:isRunning()
            L0_32 = true
            L12_16 = L0_32
          end)
        end
        if L8_12 then
          L14_18 = L13_17
          L14_18()
        end
        L14_18 = false
        L15_19 = findGameObject2
        L16_20 = "Node"
        L17_21 = "locator2_answerpoint_camera_check"
        L15_19 = L15_19(L16_20, L17_21)
        while not L12_16 do
          L16_20 = photography_correct_mode
          if L16_20 == false then
            L16_20 = camera_wrong_catwarp_change
            if L16_20 == true then
              L16_20 = camera_wrong_sensor_flag
              if L16_20 == true then
                L16_20 = RAC_endCatWarpControl
                L17_21 = "sm27_outrange_warp"
                L16_20(L17_21)
                L16_20 = RAC_startCatWarpControl
                L17_21 = "sm27_outrange_warp"
                L21_25 = "locator2_pc_start_pos"
                L16_20(L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, nil, "sm27_01021", sm27_outrange_before, sm27_outrange_after)
              else
                L16_20 = RAC_endCatWarpControl
                L17_21 = "sm27_outrange_warp"
                L16_20(L17_21)
                L16_20 = RAC_startCatWarpControl
                L17_21 = "sm27_outrange_warp"
                L21_25 = "locator2_pc_start_pos"
                L16_20(L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, nil, "sm27_01020", sm27_outrange_before, sm27_outrange_after)
              end
              camera_wrong_catwarp_change = false
            end
            L16_20 = in_lighthouse_sensor_flag
            if L16_20 == true and not L4_8 and L14_18 == false then
              L16_20 = Fn_captionViewWait
              L17_21 = "sm27_01008"
              L16_20(L17_21)
              L16_20 = Fn_captionView
              L17_21 = "sm27_01009"
              L16_20(L17_21)
              L14_18 = true
            end
            L16_20 = photography_answer
            if L16_20 == true then
              L16_20 = Fn_isInSightTarget
              L17_21 = L15_19
              L16_20 = L16_20(L17_21, L18_22)
              if L16_20 then
                L16_20 = print
                L17_21 = "ANSWERPOINT PHOTOGRAPHY START"
                L16_20(L17_21)
                L16_20 = Fn_userCtrlAllOff
                L16_20()
                L16_20 = Player
                L17_21 = L16_20
                L16_20 = L16_20.setStay
                L16_20(L17_21, L18_22)
                if L5_9 ~= nil then
                  L17_21 = L5_9
                  L16_20 = L5_9.isRunning
                  L16_20 = L16_20(L17_21)
                  if L16_20 then
                    L17_21 = L5_9
                    L16_20 = L5_9.abort
                    L16_20(L17_21)
                    L5_9 = nil
                  end
                end
                L16_20 = Fn_captionView
                L17_21 = "sm27_01010"
                L16_20(L17_21)
                L16_20 = RAC_LookAtObjectWait
                L17_21 = "locator2_beacon_setup_02"
                L16_20(L17_21, L18_22, L19_23)
                repeat
                  L16_20 = wait
                  L16_20()
                  L16_20 = Fn_isCaptionView
                  L16_20 = L16_20()
                until not L16_20
                L16_20 = waitSeconds
                L17_21 = 0.5
                L16_20(L17_21)
                L16_20 = Fn_blackout
                L16_20()
                photography_correct_mode = true
                L16_20 = Player
                L17_21 = L16_20
                L16_20 = L16_20.dropGrabObject
                L16_20(L17_21)
                L16_20 = Fn_setGrabNpc
                L17_21 = "sm27_client"
                L16_20(L17_21, L18_22, L19_23)
                L16_20 = sdemo
                L17_21 = L16_20
                L16_20 = L16_20.reset
                L16_20(L17_21)
                L16_20 = sdemo
                L17_21 = L16_20
                L16_20 = L16_20.set
                L21_25 = Vector
                L21_25 = L21_25(L22_26, 1.5, 0)
                L16_20(L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L21_25(L22_26, 1.5, 0))
                L16_20 = sdemo
                L17_21 = L16_20
                L16_20 = L16_20.play
                L16_20(L17_21)
                L16_20 = Fn_resetPcPos
                L17_21 = "locator2_answerpoint_pc_start"
                L16_20(L17_21)
                L16_20 = Fn_warpNpc
                L17_21 = "sm27_client"
                L16_20(L17_21, L18_22)
                L16_20 = Fn_playNpcEventMotion
                L17_21 = "sm27_client"
                L21_25 = false
                L16_20(L17_21, L18_22, L19_23, L20_24, L21_25)
                L16_20 = Fn_fadein
                L16_20()
                L16_20 = waitSeconds
                L17_21 = 2
                L16_20(L17_21)
                L16_20 = sdemo
                L17_21 = L16_20
                L16_20 = L16_20.play
                L19_23.pos = "locator2_answerpoint_cam_02"
                L19_23.time = 2
                L19_23.hashfunc = "EaseInOut"
                L20_24.pos = "locator2_answerpoint_camera_check"
                L20_24.time = 2
                L20_24.hashfunc = "EaseInOut"
                L16_20(L17_21, L18_22, L19_23)
                L16_20 = waitSeconds
                L17_21 = 2
                L16_20(L17_21)
                L16_20 = sdemo
                L17_21 = L16_20
                L16_20 = L16_20.zoomIn
                L19_23.deg = 30
                L16_20(L17_21, L18_22, L19_23, L20_24)
                L16_20 = Fn_captionViewWait
                L17_21 = "sm27_01011"
                L16_20(L17_21)
                L16_20 = Fn_captionView
                L17_21 = "sm27_01013"
                L16_20(L17_21)
                L16_20 = waitSeconds
                L17_21 = 1
                L16_20(L17_21)
                L16_20 = sdemo
                L17_21 = L16_20
                L16_20 = L16_20.stop
                L16_20(L17_21)
                L16_20 = Fn_userCtrlOn
                L16_20()
                L16_20 = Player
                L17_21 = L16_20
                L16_20 = L16_20.setStay
                L16_20(L17_21, L18_22)
                L16_20 = Fn_missionView
                L17_21 = "sm27_01012"
                L16_20(L17_21)
                L16_20 = waitSeconds
                L17_21 = RAC_OPERATION_TUTORIAL_DELAY_DEFAULT
                L16_20(L17_21)
                L16_20 = L13_17
                L16_20()
                L16_20 = RAC_startCatWarpControl
                L17_21 = "sm27_outrange_warp"
                L21_25 = "locator2_answerpoint_pc_start"
                L16_20(L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, nil, "sm27_01020", nil, nil)
                if L9_13 == nil then
                  L16_20 = invokeTask
                  function L17_21()
                    while true do
                      if L10_14 then
                        if _photo and _photo:isRunning() and _photoCaption then
                          _photo:coercionCaption(false)
                          _photoCaption = false
                          print("_photo\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179OFF")
                        end
                      elseif _photo and _photo:isRunning() and not _photoCaption then
                        _photo:coercionCaption(true)
                        _photoCaption = true
                        print("_photo\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179ON")
                      end
                      if Fn_getDistanceToPlayer(L0_4) < 8 then
                        RAC_MultiNaviClear()
                        L10_14 = nil
                      elseif Fn_getDistanceToPlayer(L0_4) >= 10 and L10_14 == nil then
                        L10_14 = RAC_MultiNaviAdd("locator2_answerpoint_surveyor")
                      end
                      if true then
                        if Fn_getDistanceToPlayer(L0_4) >= 10 then
                          Fn_captionViewWait("sm27_01006")
                        end
                      else
                      end
                      wait()
                    end
                  end
                  L16_20 = L16_20(L17_21)
                  L9_13 = L16_20
                end
              end
            else
              L16_20 = math
              L16_20 = L16_20.max
              L17_21 = L7_11 - 1
              L16_20 = L16_20(L17_21, L18_22)
              L7_11 = L16_20
              L16_20 = Player
              L17_21 = L16_20
              L16_20 = L16_20.getAction
              L16_20 = L16_20(L17_21)
              L17_21 = Player
              L17_21 = L17_21.kAction_Idle
              if L16_20 == L17_21 and L7_11 == 0 then
                L16_20 = false
                L17_21 = false
                for L21_25, L22_26 in L18_22(L19_23) do
                  if Fn_isInSightTarget(L22_26, 1) then
                    L16_20 = true
                  end
                  if RAC_RaycastEyeSight(L22_26, 1000, 60, 1.5) then
                    L17_21 = true
                  end
                  if not L16_20 or not L17_21 then
                  end
                end
                if L17_21 then
                  _hitCaptionCnt = L18_22
                else
                  _hitCaptionCnt = 0
                end
                if not L4_8 and L16_20 then
                  if L17_21 then
                    if L18_22 > L19_23 then
                      if L19_23 > 10 then
                        L19_23(L20_24)
                      elseif L19_23 < -10 then
                        L19_23(L20_24)
                      else
                        L19_23(L20_24)
                      end
                      L7_11 = PHOTOGRAPHY_WAIT
                    end
                  else
                    L18_22(L19_23)
                    L7_11 = PHOTOGRAPHY_WAIT
                  end
                end
              end
            end
          elseif L2_6 == nil then
            L16_20 = invokeTask
            function L17_21()
              while true do
                waitSeconds(20)
                repeat
                  wait()
                until L10_14 == nil
                Sound:playSE("m32_905")
                Fn_captionViewWait("sm27_01013")
                _photo:resetCaption()
                print("_photo\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179ON")
              end
            end
            L16_20 = L16_20(L17_21)
            L2_6 = L16_20
          end
          L16_20 = wait
          L16_20()
        end
        if L2_6 ~= nil then
          L17_21 = L2_6
          L16_20 = L2_6.abort
          L16_20(L17_21)
          L2_6 = nil
        end
        if L3_7 ~= nil then
          L17_21 = L3_7
          L16_20 = L3_7.abort
          L16_20(L17_21)
          L3_7 = nil
        end
        L16_20 = 1
        L17_21 = 2
        if L10_14 then
        else
          L21_25 = Player
          L21_25 = L21_25.getAction
          L21_25 = L21_25(L22_26)
          if L21_25 ~= L22_26 then
            L21_25 = Player
            L21_25 = L21_25.getAction
            L21_25 = L21_25(L22_26)
          else
            if L21_25 == L22_26 then
          end
          else
            L21_25 = _photo
            L21_25 = L21_25.getPhotoState
            L21_25 = L21_25(L22_26)
            if L21_25 then
              if L22_26 == "table" then
                for _FORV_25_, _FORV_26_ in L22_26(L21_25) do
                end
              end
            end
          end
        end
        _photo = nil
        L21_25 = Fn_userCtrlAllOff
        L21_25()
        L21_25 = wait
        L21_25()
        L21_25 = Fn_userCtrlOn
        L21_25()
        L21_25 = waitSeconds
        L21_25(L22_26)
        if L20_24 ~= L19_23 then
          if L20_24 == L18_22 then
            L21_25 = Sound
            L21_25 = L21_25.playSE
            L21_25(L22_26, "m32_905")
            L21_25 = Fn_captionViewWait
            L21_25(L22_26)
          elseif L20_24 == L16_20 then
            L21_25 = photography_answer
            if L21_25 then
              photography_end = true
            end
          else
            L21_25 = Sound
            L21_25 = L21_25.playSE
            L21_25(L22_26, "m32_905")
            L21_25 = Fn_captionViewWait
            L21_25(L22_26)
          end
        end
        L21_25 = photography_end
        if not L21_25 then
          L8_12 = true
        end
        L21_25 = wait
        L21_25()
      end
    end
  end
  if L6_10 then
    L12_16 = L6_10
    L11_15 = L6_10.abort
    L11_15(L12_16)
    L6_10 = nil
  end
  L12_16 = L9_13
  L11_15 = L9_13.abort
  L11_15(L12_16)
  L9_13 = nil
  L11_15 = Fn_missionViewEnd
  L11_15()
  L11_15 = RAC_endCatWarpControl
  L12_16 = "sm27_outrange_warp"
  L11_15(L12_16)
  L11_15 = Fn_kaiwaDemoView
  L12_16 = "sm27_00700k"
  L11_15(L12_16)
  L11_15 = waitSeconds
  L12_16 = 2
  L11_15(L12_16)
  L11_15 = Fn_blackout
  L11_15()
  L11_15 = Fn_userCtrlAllOff
  L11_15()
  L11_15 = Fn_resetPcPos
  L12_16 = "locator2_pc_end_pos"
  L11_15(L12_16)
  L11_15 = Fn_warpNpc
  L12_16 = "sm27_client"
  L13_17 = "locator2_npc_end_pos"
  L11_15(L12_16, L13_17)
  L11_15 = sdemo
  L12_16 = L11_15
  L11_15 = L11_15.reset
  L11_15(L12_16)
  L11_15 = sdemo
  L12_16 = L11_15
  L11_15 = L11_15.set
  L13_17 = "locator2_sdemo_end_cam_01"
  L14_18 = "locator2_sdemo_end_aim_01"
  L15_19 = false
  L11_15(L12_16, L13_17, L14_18, L15_19)
  L11_15 = sdemo
  L12_16 = L11_15
  L11_15 = L11_15.play
  L11_15(L12_16)
  L11_15 = Fn_fadein
  L11_15()
  L11_15 = Fn_kaiwaDemoView
  L12_16 = "sm27_00800k"
  L11_15(L12_16)
  L11_15 = sdemo
  L12_16 = L11_15
  L11_15 = L11_15.stop
  L13_17 = 1
  L11_15(L12_16, L13_17)
  L11_15 = Fn_userCtrlOn
  L11_15()
  L11_15 = Fn_setKeepPlayerPos
  L11_15()
  L11_15 = Fn_setNextMissionFlag
  L11_15()
  L11_15 = Fn_nextMission
  L11_15()
  L11_15 = Fn_exitSandbox
  L11_15()
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Player:setForcedNormalGrab(false)
end
function Event_distance_beacon_task()
  return invokeTask(function()
    local L0_33, L1_34, L2_35, L3_36, L4_37, L5_38, L6_39
    L0_33 = print
    L0_33(L1_34)
    while true do
      L0_33 = 0
      if L1_34 == false then
        for L5_38 = 1, 3 do
          L6_39 = findGameObject2
          L6_39 = L6_39("Node", "beacon_setup_" .. string.format("%02d", L5_38))
          if Fn_getDistanceToPlayer(L6_39) > 200 then
            break
          end
        end
        if L1_34 == true then
          L2_35(L3_36, L4_37)
          surveyor_distance_talk = true
        end
      elseif not L1_34 then
        for L4_37 = 1, 3 do
          L5_38 = findGameObject2
          L6_39 = "Node"
          L5_38 = L5_38(L6_39, "beacon_setup_" .. string.format("%02d", L4_37))
          L6_39 = Fn_getDistanceToPlayer
          L6_39 = L6_39(L5_38)
          if L6_39 < 200 then
            L0_33 = L0_33 + 1
          end
        end
        if L0_33 == 3 then
          surveyor_distance_talk = false
        end
      end
      L1_34(L2_35)
    end
  end)
end
function pccubesensor2_camera_answer_OnEnter()
  local L0_40, L1_41
  photography_answer = true
end
function pccubesensor2_camera_answer_OnLeave()
  local L0_42, L1_43
  photography_answer = false
end
function pccubesensor2_lighthouse_sensor_01_OnEnter()
  local L0_44, L1_45
  in_lighthouse_sensor_flag = true
end
function pccubesensor2_lighthouse_sensor_01_OnLeave()
  local L0_46, L1_47
  in_lighthouse_sensor_flag = false
end
function pccubesensor2_camera_wrong_01_OnEnter()
  local L0_48, L1_49
  camera_wrong_sensor_flag = true
  camera_wrong_catwarp_change = true
end
function pccubesensor2_camera_wrong_01_OnLeave()
  local L0_50, L1_51
  camera_wrong_sensor_flag = false
  camera_wrong_catwarp_change = true
end
function sm27_outrange_before()
  Player:dropGrabObject()
end
function sm27_outrange_after()
  Fn_warpNpc("sm27_client", "locator2_beacon_surveyor_03")
  wait()
  Player:setGrabObject(Fn_findNpcPuppet("sm27_client"))
end
