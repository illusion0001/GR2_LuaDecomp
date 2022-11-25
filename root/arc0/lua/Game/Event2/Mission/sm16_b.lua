dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
MOTHER_NOTICED_DISTANCE = 2.5
FOLLOW_GOAL_DISTANCE = 12
FOLLOW_LOST_DISTANCE = 100
PHOTO_NEAR = 5
PHOTO_FAR = 20
RETRY_STATE = {
  NONE = 0,
  LOST = 1,
  FOUND = 2,
  FRONT = 3,
  CAMERA = 4
}
PHOTO_PHASE = {
  SETUP = 0,
  PARRENT = 1,
  BUILDING = 2,
  EXIT = 3
}
_puppet_tbl = {}
_npc_tbl = {}
_photo = nil
_photo_area = true
_phase = 0
_mnavi = nil
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_photo_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_b_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_b_phase01")
  L0_0 = {
    {
      name = "sm16_mother",
      type = "wom20",
      node = "locator2_mother_b",
      reset = false
    },
    {
      name = "sm16_talk_man",
      type = "man33",
      node = "locator2_talk_man_b",
      reset = false
    },
    {
      name = "sm16_talk_wom",
      type = "wom17",
      node = "locator2_talk_wom"
    },
    {
      name = "sm16_girl",
      type = "chi12",
      node = "locator2_girl_talk_01",
      active = false,
      disable_collision = true
    },
    {
      name = "sm16_boy",
      type = "chi15",
      node = "locator2_boy_greeting",
      active = false,
      disable_collision = true
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _sdemo_cut_01 = SDemo.create("sm16_b_sdemo_cut_01")
  _sdemo_cut_01:setCameraParam(nil, 0.1, nil)
  _sdemo_cut_02 = SDemo.create("sm16_b_sdemo_cut_02")
  _sdemo_cut_02:setCameraParam(nil, 0.1, nil)
  _sdemo_cut_03 = SDemo.create("sm16_b_sdemo_cut_03")
  _sdemo_cut_03:setCameraParam(nil, 0.1, nil)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34
  L0_1 = Fn_setNpcActive
  L1_2 = "sm16_client"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_resetPcPos
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_playMotionNpc
  L1_2 = "sm16_talk_wom"
  L2_3 = "lookaround"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playLoopMotionInsert
  L1_2 = "sm16_mother"
  L2_3 = "talk_03"
  L3_4 = {L4_5}
  L4_5 = "talk_02"
  L4_5 = 3
  L5_6 = 3
  L0_1 = L0_1(L1_2, L2_3, L3_4, L4_5, L5_6)
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "sm16_talk_man"
  L3_4 = "talk_03"
  L4_5 = {L5_6, L6_7}
  L5_6 = "talk_03"
  L6_7 = "stay"
  L5_6 = 5
  L6_7 = 5
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L2_3 = Fn_userCtrlAllOff
  L2_3()
  L2_3 = Camera
  L3_4 = L2_3
  L2_3 = L2_3.setControl
  L4_5 = Camera
  L4_5 = L4_5.kPlayer
  L5_6 = Camera
  L5_6 = L5_6.kControl_All
  L6_7 = false
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3 = _sdemo_cut_01
  L3_4 = L2_3
  L2_3 = L2_3.set
  L4_5 = "locator2_cam_discover_01"
  L5_6 = "locator2_aim_discover_01"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = _sdemo_cut_01
  L3_4 = L2_3
  L2_3 = L2_3.play
  L2_3(L3_4)
  L2_3 = Fn_missionStart
  L2_3()
  L2_3 = waitSeconds
  L3_4 = 1.5
  L2_3(L3_4)
  L2_3 = 1.5
  L3_4 = {L4_5}
  L4_5 = {}
  L4_5.pos = "locator2_cam_discover_02"
  L4_5.time = L2_3
  L4_5 = _sdemo_cut_01
  L5_6 = L4_5
  L4_5 = L4_5.play
  L6_7 = L3_4
  L7_8 = nil
  L4_5(L5_6, L6_7, L7_8)
  while true do
    L4_5 = _sdemo_cut_01
    L5_6 = L4_5
    L4_5 = L4_5.isPlay
    L4_5 = L4_5(L5_6)
    if L4_5 then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = waitSeconds
  L5_6 = 1
  L4_5(L5_6)
  L4_5 = Fn_kaiwaDemoView
  L5_6 = "sm16_00400k"
  L4_5(L5_6)
  L4_5 = {
    L5_6,
    L6_7,
    L7_8,
    L8_9,
    L9_10,
    L10_11,
    L11_12,
    L12_13
  }
  L5_6 = "locator2_mother_sneak_path_01"
  L6_7 = "locator2_mother_sneak_path_02"
  L7_8 = "locator2_mother_sneak_path_03"
  L8_9 = "locator2_mother_sneak_path_04"
  L9_10 = "locator2_mother_sneak_path_05"
  L10_11 = "locator2_mother_sneak_path_06"
  L11_12 = "locator2_mother_sneak_path_07"
  L12_13 = "locator2_mother_sneak_path_08"
  L5_6 = {L6_7}
  L6_7 = "locator2_mother_talk_pos_b"
  L6_7 = Mv_safeTaskAbort
  L7_8 = L0_1
  L6_7 = L6_7(L7_8)
  L0_1 = L6_7
  L6_7 = Mv_safeTaskAbort
  L7_8 = L1_2
  L6_7 = L6_7(L7_8)
  L1_2 = L6_7
  L6_7 = Fn_playMotionNpc
  L7_8 = "sm16_mother"
  L8_9 = "stay"
  L9_10 = false
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = Fn_playMotionNpc
  L7_8 = "sm16_talk_man"
  L8_9 = "reply_yes"
  L9_10 = true
  L6_7(L7_8, L8_9, L9_10)
  L6_7 = Fn_moveNpc
  L7_8 = "sm16_mother"
  L8_9 = L4_5
  L9_10 = {}
  L9_10.runLength = 1000
  L9_10.recast = true
  L6_7 = L6_7(L7_8, L8_9, L9_10)
  L7_8 = invokeTask
  function L8_9()
    waitSeconds(1)
    Fn_turnNpc("sm16_talk_man", _puppet_tbl.sm16_mother)
    Fn_changeNpcToMob("sm16_talk_man")
  end
  L7_8(L8_9)
  L7_8 = Fn_captionViewWait
  L8_9 = "sm16_01000"
  L7_8(L8_9)
  L7_8 = Fn_kaiwaDemoView
  L8_9 = "sm16_00420k"
  L7_8(L8_9)
  L7_8 = _sdemo_cut_01
  L8_9 = L7_8
  L7_8 = L7_8.stop
  L9_10 = 1
  L7_8(L8_9, L9_10)
  L7_8 = Fn_userCtrlOn
  L7_8()
  L7_8 = Camera
  L8_9 = L7_8
  L7_8 = L7_8.setControl
  L9_10 = Camera
  L9_10 = L9_10.kPlayer
  L10_11 = Camera
  L10_11 = L10_11.kControl_All
  L11_12 = true
  L7_8(L8_9, L9_10, L10_11, L11_12)
  L7_8 = invokeTask
  function L8_9()
    Fn_missionView("sm16_01001")
    waitSeconds(1.3)
    _mnavi = HUD:mnaviNew({
      name = "mom_navi",
      PochFadeLen0 = 0,
      PochFadeLen100 = -1
    })
    _mnavi:setTarget(_puppet_tbl.sm16_mother)
    _mnavi:setActive(true, true)
    waitSeconds(2.5)
    Fn_captionView("sm16_01002")
  end
  L7_8 = L7_8(L8_9)
  L8_9 = false
  L9_10 = false
  L10_11 = false
  L11_12 = RETRY_STATE
  L11_12 = L11_12.NONE
  L12_13, L13_14, L14_15, L15_16, L16_17, L17_18 = nil, nil, nil, nil, nil, nil
  while true do
    if L6_7 ~= nil then
      L18_19 = Mv_isSafeTaskRunning
      L19_20 = L6_7
      L18_19 = L18_19(L19_20)
      if L18_19 == false then
        L6_7 = nil
        L18_19 = wait
        L18_19()
        L18_19 = Fn_turnNpc
        L19_20 = "sm16_talk_wom"
        L20_21 = _puppet_tbl
        L20_21 = L20_21.sm16_mother
        L18_19(L19_20, L20_21)
        L18_19 = invokeTask
        function L19_20()
          Fn_playMotionNpc("sm16_talk_wom", "greeting", true)
          L15_16 = Fn_moveNpc("sm16_talk_wom", {
            "locator2_talk_wom_path_01"
          })
        end
        L18_19 = L18_19(L19_20)
        L17_18 = L18_19
        L18_19 = Fn_turnNpc
        L19_20 = "sm16_mother"
        L20_21 = _puppet_tbl
        L20_21 = L20_21.sm16_talk_wom
        L18_19(L19_20, L20_21)
        L18_19 = invokeTask
        function L19_20()
          Fn_playMotionNpc("sm16_mother", "greeting", true)
          L14_15 = Fn_moveNpc("sm16_mother", L5_6, {recast = true, arrivedLength = 0})
          print("\231\167\187\229\139\149\228\186\140\229\155\158\231\155\174\233\150\139\229\167\139")
        end
        L18_19 = L18_19(L19_20)
        L16_17 = L18_19
      end
    elseif L14_15 ~= nil then
      L18_19 = Mv_isSafeTaskRunning
      L19_20 = L14_15
      L18_19 = L18_19(L19_20)
      if L18_19 == false then
        if L8_9 == false then
          L8_9 = true
          L18_19 = wait
          L18_19()
          L18_19 = Fn_turnNpc
          L19_20 = "sm16_mother"
          L20_21 = _puppet_tbl
          L20_21 = L20_21.sm16_talk_wom
          L18_19(L19_20, L20_21)
          L18_19 = Fn_playLoopMotionInsert
          L19_20 = "sm16_mother"
          L20_21 = "talk_03"
          L21_22 = {L22_23}
          L22_23 = "talk_02"
          L22_23 = 3
          L23_24 = 3
          L18_19 = L18_19(L19_20, L20_21, L21_22, L22_23, L23_24)
          L12_13 = L18_19
        end
        if L15_16 ~= nil then
          L18_19 = Mv_isSafeTaskRunning
          L19_20 = L15_16
          L18_19 = L18_19(L19_20)
          if L18_19 == false then
            L15_16 = nil
            L18_19 = Fn_turnNpc
            L19_20 = "sm16_talk_wom"
            L20_21 = _puppet_tbl
            L20_21 = L20_21.sm16_mother
            L18_19(L19_20, L20_21)
            L18_19 = Fn_playLoopMotionInsert
            L19_20 = "sm16_talk_wom"
            L20_21 = "talk_01"
            L21_22 = {L22_23, L23_24}
            L22_23 = "talk_01"
            L23_24 = "talk_02"
            L22_23 = 5
            L23_24 = 5
            L18_19 = L18_19(L19_20, L20_21, L21_22, L22_23, L23_24)
            L13_14 = L18_19
            L9_10 = true
          end
        end
        L18_19 = Fn_getDistanceToPlayer
        L19_20 = findGameObject2
        L20_21 = "Node"
        L21_22 = "locator2_mother_talk_pos_b"
        L33_34 = L19_20(L20_21, L21_22)
        L18_19 = L18_19(L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L19_20(L20_21, L21_22))
        if L9_10 and not L10_11 then
          L19_20 = FOLLOW_GOAL_DISTANCE
          if L18_19 > L19_20 and L18_19 <= 20 then
            L19_20 = Fn_captionView
            L20_21 = "sm16_01028"
            L19_20(L20_21)
            L10_11 = true
          end
        end
        L19_20 = FOLLOW_GOAL_DISTANCE
        if L18_19 <= L19_20 then
          L19_20 = HUD
          L20_21 = L19_20
          L19_20 = L19_20.captionGetTextId
          L19_20 = L19_20(L20_21)
        end
      end
    end
    if L19_20 ~= nil then
      L18_19 = _puppet_tbl
      L18_19 = L18_19.sm16_mother
      L19_20 = L18_19
      L18_19 = L18_19.getWorldPos
      L18_19 = L18_19(L19_20)
      L19_20 = Fn_getPlayerWorldPos
      L19_20 = L19_20()
      L20_21 = L18_19.y
      L21_22 = L19_20.y
      L20_21 = L20_21 - L21_22
      if L20_21 > -1 and L20_21 < 1 then
        L21_22 = Mv_isEyesight
        L22_23 = _puppet_tbl
        L22_23 = L22_23.sm16_mother
        L23_24 = Fn_getPlayer
        L23_24 = L23_24()
        L24_25 = 45
        L25_26 = 8
        L26_27 = Vector
        L27_28 = 0
        L28_29 = 1
        L29_30 = 0
        L33_34 = L26_27(L27_28, L28_29, L29_30)
        L21_22 = L21_22(L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L26_27(L27_28, L28_29, L29_30))
        if L21_22 then
          L21_22 = RETRY_STATE
          L11_12 = L21_22.FOUND
          L21_22 = Fn_captionViewEnd
          L21_22()
          L21_22 = Mv_safeTaskAbort
          L22_23 = L7_8
          L21_22 = L21_22(L22_23)
          L7_8 = L21_22
          L21_22 = Fn_missionViewEnd
          L21_22()
          L21_22 = _mnavi
          if L21_22 ~= nil then
            L21_22 = _mnavi
            L22_23 = L21_22
            L21_22 = L21_22.setActive
            L23_24 = false
            L24_25 = true
            L21_22(L22_23, L23_24, L24_25)
            L21_22 = _mnavi
            L22_23 = L21_22
            L21_22 = L21_22.del
            L21_22(L22_23)
            _mnavi = nil
          end
          L21_22 = Fn_userCtrlOff
          L21_22()
          L21_22 = Fn_turnNpc
          L22_23 = "sm16_mother"
          L21_22(L22_23)
          L21_22 = Mv_safeTaskAbort
          L22_23 = L17_18
          L21_22 = L21_22(L22_23)
          L17_18 = L21_22
          L21_22 = invokeTask
          function L22_23()
            Fn_playMotionNpc("sm16_mother", "talk_angry_00", false)
          end
          L21_22(L22_23)
          L21_22 = waitSeconds
          L22_23 = 2
          L21_22(L22_23)
          L21_22 = _npc_tbl
          L21_22 = L21_22.sm16_mother
          L22_23 = L21_22
          L21_22 = L21_22.pauseMove
          L23_24 = true
          L21_22(L22_23, L23_24)
          L21_22 = Fn_kaiwaDemoView
          L22_23 = "sm16_00440k"
          L21_22(L22_23)
        end
      else
        L21_22 = Fn_getDistanceToPlayer
        L22_23 = _puppet_tbl
        L22_23 = L22_23.sm16_mother
        L21_22 = L21_22(L22_23)
        L22_23 = FOLLOW_LOST_DISTANCE
        if L21_22 >= L22_23 then
          L21_22 = RETRY_STATE
          L11_12 = L21_22.LOST
          L21_22 = Fn_captionViewEnd
          L21_22()
          L21_22 = Mv_safeTaskAbort
          L22_23 = L7_8
          L21_22 = L21_22(L22_23)
          L7_8 = L21_22
          L21_22 = Fn_missionViewEnd
          L21_22()
          L21_22 = _mnavi
          if L21_22 ~= nil then
            L21_22 = _mnavi
            L22_23 = L21_22
            L21_22 = L21_22.setActive
            L23_24 = false
            L24_25 = true
            L21_22(L22_23, L23_24, L24_25)
            L21_22 = _mnavi
            L22_23 = L21_22
            L21_22 = L21_22.del
            L21_22(L22_23)
            _mnavi = nil
          end
          L21_22 = _npc_tbl
          L21_22 = L21_22.sm16_mother
          L22_23 = L21_22
          L21_22 = L21_22.pauseMove
          L23_24 = true
          L21_22(L22_23, L23_24)
          L21_22 = Fn_userCtrlOff
          L21_22()
          L21_22 = Fn_captionViewWait
          L22_23 = "sm16_01003"
          L21_22(L22_23)
        end
      end
      L21_22 = RETRY_STATE
      L21_22 = L21_22.NONE
      if L11_12 ~= L21_22 then
        L21_22 = Mv_sceneSwitchFade
        function L22_23()
          L6_7 = Mv_safeTaskAbort(L6_7)
          L14_15 = Mv_safeTaskAbort(L14_15)
          L16_17 = Mv_safeTaskAbort(L16_17)
          L15_16 = Mv_safeTaskAbort(L15_16)
          L12_13 = Mv_safeTaskAbort(L12_13)
          L13_14 = Mv_safeTaskAbort(L13_14)
          Fn_warpNpc("sm16_mother", "locator2_mother_b")
          Fn_warpNpc("sm16_talk_wom", "locator2_talk_wom")
          Fn_resetPcPos("locator2_pc_start_pos")
          waitSeconds(1)
        end
        L21_22(L22_23)
        L21_22 = _npc_tbl
        L21_22 = L21_22.sm16_mother
        L22_23 = L21_22
        L21_22 = L21_22.pauseMove
        L23_24 = false
        L21_22(L22_23, L23_24)
        L21_22 = Fn_moveNpc
        L22_23 = "sm16_mother"
        L23_24 = L4_5
        L24_25 = {}
        L24_25.runLength = 1000
        L24_25.recast = true
        L21_22 = L21_22(L22_23, L23_24, L24_25)
        L6_7 = L21_22
        L21_22 = HUD
        L22_23 = L21_22
        L21_22 = L21_22.mnaviNew
        L23_24 = {}
        L23_24.name = "mom_navi"
        L23_24.PochFadeLen0 = 0
        L23_24.PochFadeLen100 = -1
        L21_22 = L21_22(L22_23, L23_24)
        _mnavi = L21_22
        L21_22 = _mnavi
        L22_23 = L21_22
        L21_22 = L21_22.setTarget
        L23_24 = _puppet_tbl
        L23_24 = L23_24.sm16_mother
        L21_22(L22_23, L23_24)
        L21_22 = _mnavi
        L22_23 = L21_22
        L21_22 = L21_22.setActive
        L23_24 = true
        L24_25 = true
        L21_22(L22_23, L23_24, L24_25)
        L21_22 = waitSeconds
        L22_23 = 1.3
        L21_22(L22_23)
        L21_22 = RETRY_STATE
        L21_22 = L21_22.FOUND
        if L11_12 == L21_22 then
          L21_22 = Fn_captionView
          L22_23 = "sm16_01004"
          L21_22(L22_23)
        else
          L21_22 = RETRY_STATE
          L21_22 = L21_22.LOST
          if L11_12 == L21_22 then
            L21_22 = Fn_captionView
            L22_23 = "sm16_01005"
            L21_22(L22_23)
          end
        end
        L21_22 = RETRY_STATE
        L11_12 = L21_22.NONE
        L8_9 = false
        L9_10 = false
        L10_11 = false
        L21_22 = Fn_userCtrlOn
        L21_22()
      end
      L21_22 = wait
      L21_22()
    end
  end
  L18_19 = Camera
  L19_20 = L18_19
  L18_19 = L18_19.setControl
  L20_21 = Camera
  L20_21 = L20_21.kPlayer
  L21_22 = Camera
  L21_22 = L21_22.kControl_All
  L22_23 = false
  L18_19(L19_20, L20_21, L21_22, L22_23)
  L18_19 = Fn_userCtrlAllOff
  L18_19()
  L18_19 = _mnavi
  if L18_19 ~= nil then
    L18_19 = _mnavi
    L19_20 = L18_19
    L18_19 = L18_19.setActive
    L20_21 = false
    L21_22 = true
    L18_19(L19_20, L20_21, L21_22)
    L18_19 = _mnavi
    L19_20 = L18_19
    L18_19 = L18_19.del
    L18_19(L19_20)
    _mnavi = nil
  end
  L18_19 = Mv_sceneSwitchFade
  function L19_20()
    Fn_resetPcPos("locator2_pc_reset_pos")
    findGameObject2("Node", "bg2_ship_b"):setActive(false)
    _sdemo_cut_02:set("locator2_cam_talk_01", "locator2_aim_talk_01")
    _sdemo_cut_02:play()
  end
  L18_19(L19_20)
  L18_19 = waitSeconds
  L19_20 = 1.5
  L18_19(L19_20)
  L18_19 = Mv_safeTaskAbort
  L19_20 = L12_13
  L18_19 = L18_19(L19_20)
  L12_13 = L18_19
  L18_19 = Mv_safeTaskAbort
  L19_20 = L13_14
  L18_19 = L18_19(L19_20)
  L13_14 = L18_19
  L18_19 = Fn_playMotionNpc
  L19_20 = "sm16_mother"
  L20_21 = "reply_yes"
  L21_22 = false
  L18_19(L19_20, L20_21, L21_22)
  L18_19 = Fn_playMotionNpc
  L19_20 = "sm16_talk_wom"
  L20_21 = "greeting"
  L21_22 = true
  L18_19(L19_20, L20_21, L21_22)
  L18_19 = Fn_playMotionNpc
  L19_20 = "sm16_mother"
  L20_21 = "stay"
  L21_22 = false
  L18_19(L19_20, L20_21, L21_22)
  L18_19 = Fn_moveNpc
  L19_20 = "sm16_talk_wom"
  L20_21 = {L21_22}
  L21_22 = "locator2_talk_wom_path_02"
  L18_19 = L18_19(L19_20, L20_21)
  L19_20 = {L20_21}
  L20_21 = {}
  L20_21.pos = "locator2_cam_talk_02"
  L20_21.time = 4
  L20_21.hashfunc = "Linear"
  L20_21 = {L21_22}
  L21_22 = {}
  L21_22.pos = "locator2_aim_talk_02"
  L21_22.time = 5
  L21_22.hashfunc = "Linear"
  L21_22 = _sdemo_cut_02
  L22_23 = L21_22
  L21_22 = L21_22.play
  L23_24 = L19_20
  L24_25 = L20_21
  L21_22(L22_23, L23_24, L24_25)
  L21_22 = waitSeconds
  L22_23 = 1
  L21_22(L22_23)
  L21_22 = Fn_captionView
  L22_23 = "sm16_01006"
  L21_22(L22_23)
  L21_22 = waitSeconds
  L22_23 = 2
  L21_22(L22_23)
  L21_22 = invokeTask
  function L22_23()
    Fn_turnNpc("sm16_mother", _puppet_tbl.sm16_girl)
  end
  L21_22(L22_23)
  L21_22 = waitSeconds
  L22_23 = 2
  L21_22(L22_23)
  L21_22 = Fn_setNpcActive
  L22_23 = "sm16_girl"
  L23_24 = true
  L21_22(L22_23, L23_24)
  L21_22 = Fn_turnNpc
  L22_23 = "sm16_mother"
  L23_24 = _puppet_tbl
  L23_24 = L23_24.sm16_girl
  L21_22(L22_23, L23_24)
  L21_22 = Fn_turnNpc
  L22_23 = "sm16_girl"
  L23_24 = _puppet_tbl
  L23_24 = L23_24.sm16_mother
  L21_22(L22_23, L23_24)
  L21_22 = Fn_playLoopMotionInsert
  L22_23 = "sm16_mother"
  L23_24 = "talk_03"
  L24_25 = {L25_26}
  L25_26 = "talk_02"
  L25_26 = 3
  L26_27 = 3
  L21_22 = L21_22(L22_23, L23_24, L24_25, L25_26, L26_27)
  L22_23 = Fn_playLoopMotionInsert
  L23_24 = "sm16_girl"
  L24_25 = "talk_01"
  L25_26 = {L26_27}
  L26_27 = "talk_00"
  L26_27 = 3
  L27_28 = 3
  L22_23 = L22_23(L23_24, L24_25, L25_26, L26_27, L27_28)
  L23_24 = {L24_25}
  L24_25 = {}
  L24_25.pos = "locator2_cam_talk_03"
  L24_25.time = 1.5
  L19_20 = L23_24
  L23_24 = {L24_25}
  L24_25 = {}
  L24_25.pos = "locator2_aim_talk_03"
  L24_25.time = 1.5
  L20_21 = L23_24
  L23_24 = _sdemo_cut_02
  L24_25 = L23_24
  L23_24 = L23_24.play
  L25_26 = L19_20
  L26_27 = L20_21
  L23_24(L24_25, L25_26, L26_27)
  L23_24 = waitSeconds
  L24_25 = 2
  L23_24(L24_25)
  L23_24 = Fn_captionViewWait
  L24_25 = "sm16_01007"
  L23_24(L24_25)
  L23_24 = Fn_setNpcActive
  L24_25 = "sm16_talk_wom"
  L25_26 = false
  L23_24(L24_25, L25_26)
  L23_24 = Fn_kaiwaDemoView
  L24_25 = "sm16_00500k"
  L23_24(L24_25)
  L23_24 = _sdemo_cut_02
  L24_25 = L23_24
  L23_24 = L23_24.stop
  L25_26 = 2
  L23_24(L24_25, L25_26)
  L23_24 = Fn_setCatWarpCheckPoint
  L24_25 = "locator2_pc_reset_pos"
  L23_24(L24_25)
  L23_24 = Fn_userCtrlOn
  L23_24()
  L23_24 = Camera
  L24_25 = L23_24
  L23_24 = L23_24.setControl
  L25_26 = Camera
  L25_26 = L25_26.kPlayer
  L26_27 = Camera
  L26_27 = L26_27.kControl_All
  L27_28 = true
  L23_24(L24_25, L25_26, L26_27, L27_28)
  _phase = 1
  L23_24 = Fn_pcSensorOn
  L24_25 = "pccubesensor2_photo_area"
  L23_24(L24_25)
  L23_24 = Fn_pcSensorOn
  L24_25 = "pccubesensor2_catwarning_b_phase01"
  L23_24(L24_25)
  L23_24 = Fn_pcSensorOn
  L24_25 = "pccubesensor2_catwarp_b_phase01"
  L23_24(L24_25)
  L23_24 = Fn_missionView
  L24_25 = "sm16_01008"
  L23_24(L24_25)
  L23_24 = waitSeconds
  L24_25 = 1.3
  L23_24(L24_25)
  L23_24 = RETRY_STATE
  L23_24 = L23_24.NONE
  L24_25 = PHOTO_PHASE
  L24_25 = L24_25.PARRENT
  L25_26 = nil
  L26_27 = Photo
  L26_27 = L26_27.create
  L27_28 = kPHOTO_CAPTION_ON
  L28_29 = kPHOTO_TYPE_ALL
  L29_30 = true
  L30_31.near = L31_32
  L30_31.far = L31_32
  L26_27 = L26_27(L27_28, L28_29, L29_30, L30_31)
  L25_26 = L26_27
  L27_28 = L25_26
  L26_27 = L25_26.set
  L28_29 = _puppet_tbl
  L28_29 = L28_29.sm16_mother
  L26_27(L27_28, L28_29)
  L27_28 = L25_26
  L26_27 = L25_26.set
  L28_29 = _puppet_tbl
  L28_29 = L28_29.sm16_girl
  L26_27(L27_28, L28_29)
  L26_27 = false
  L27_28 = invokeTask
  function L28_29()
    while L24_25 < PHOTO_PHASE.EXIT do
      if Mv_isEyesight(Fn_findNpcPuppet("sm16_mother"), Fn_getPlayer(), 45, 15, Vector(0, 1.5, 0)) then
        L23_24 = RETRY_STATE.FRONT
      elseif Fn_getDistanceToPlayer(_puppet_tbl.sm16_mother) <= MOTHER_NOTICED_DISTANCE and HUD:isPhotoMode() then
        L23_24 = RETRY_STATE.CAMERA
      end
      if L23_24 ~= RETRY_STATE.NONE then
        L21_22:abort()
        L22_23:abort()
        Player:setStay(true)
        Fn_turnNpc("sm16_mother")
        Fn_playMotionNpc("sm16_mother", "talk_angry_00", false)
        if L23_24 == RETRY_STATE.FRONT then
          Fn_captionViewWait("sm16_01009")
        elseif L23_24 == RETRY_STATE.CAMERA then
          Fn_captionViewWait("sm16_01010")
        end
        L25_26 = Mv_safeObjectKill(L25_26)
        Fn_captionViewEnd()
        Fn_captionViewWait("sm16_01011")
        Mv_sceneSwitchFade(function()
          Fn_turnNpc("sm16_mother", _puppet_tbl.sm16_girl)
          if HUD:isPhotoMode() then
            HUD:setPhotoMode(false)
          end
          Fn_resetPcPos("locator2_pc_reset_pos")
          L21_22 = Fn_playLoopMotionInsert("sm16_mother", "talk_03", {"talk_02"}, 3, 3)
          L22_23 = Fn_playLoopMotionInsert("sm16_girl", "talk_01", {"talk_00"}, 3, 3)
        end)
        Player:setStay(false)
        Fn_missionViewWait("sm16_01008")
        L23_24 = RETRY_STATE.NONE
        L26_27 = false
        L24_25 = PHOTO_PHASE.PARRENT
      end
      wait()
    end
  end
  L27_28 = L27_28(L28_29)
  repeat
    L28_29 = PHOTO_PHASE
    L28_29 = L28_29.PARRENT
    if L24_25 == L28_29 then
      L28_29 = Fn_captionViewWait
      L29_30 = "sm16_01013"
      L28_29(L29_30)
      L28_29 = Photo
      L28_29 = L28_29.create
      L29_30 = kPHOTO_CAPTION_ON
      L32_33.near = 5
      L32_33.far = 10
      L28_29 = L28_29(L29_30, L30_31, L31_32, L32_33)
      L25_26 = L28_29
      L29_30 = L25_26
      L28_29 = L25_26.set
      L28_29(L29_30, L30_31)
      L29_30 = L25_26
      L28_29 = L25_26.set
      L28_29(L29_30, L30_31)
      while not L26_27 do
        L28_29 = _photo_area
        if L28_29 then
          L29_30 = L25_26
          L28_29 = L25_26.run
          L28_29(L29_30)
          repeat
            L28_29 = wait
            L28_29()
            L28_29 = _photo_area
            if L28_29 ~= false then
              L29_30 = L25_26
              L28_29 = L25_26.isRunning
              L28_29 = L28_29(L29_30)
              if L28_29 then
                L28_29 = RETRY_STATE
                L28_29 = L28_29.NONE
              end
            end
          until L23_24 ~= L28_29
          L28_29 = print
          L29_30 = "phase:1"
          L28_29(L29_30)
          L28_29 = _photo_area
          if L28_29 == true then
            L29_30 = L25_26
            L28_29 = L25_26.getPhotoState
            L28_29 = L28_29(L29_30)
            L29_30 = nil
            if L28_29 ~= nil then
              if L30_31 ~= "table" then
                L31_32.state = L28_29
                L28_29 = L30_31
              end
              for L33_34, _FORV_34_ in L30_31(L31_32) do
                if _FORV_34_.state == kPHOTO_OK or _FORV_34_.state == kPHOTO_ANGLE or _FORV_34_.state == kPHOTO_BACK or _FORV_34_.state == kPHOTO_NEAR then
                  L29_30 = 0
                elseif _FORV_34_.state == kPHOTO_FAR then
                  L29_30 = 1
                  break
                elseif _FORV_34_.state == kPHOTO_OUT then
                  L29_30 = 2
                  break
                end
              end
            end
            if L23_24 == L30_31 then
              if L29_30 == 0 then
                L30_31(L31_32, L32_33)
                L30_31(L31_32)
                L26_27 = true
                L24_25 = L30_31.BUILDING
                _phase = 2
              elseif L29_30 == 1 then
                L30_31(L31_32)
              elseif L29_30 == 2 then
                L30_31(L31_32)
              end
            else
              L24_25 = L30_31.SETUP
              break
            end
          end
        end
        L28_29 = wait
        L28_29()
      end
      L28_29 = RETRY_STATE
      L28_29 = L28_29.NONE
      if L23_24 == L28_29 then
        L28_29 = Mv_safeObjectKill
        L29_30 = L25_26
        L28_29 = L28_29(L29_30)
        L25_26 = L28_29
        L26_27 = false
      end
    else
      L28_29 = PHOTO_PHASE
      L28_29 = L28_29.BUILDING
      if L24_25 == L28_29 then
        L28_29 = Fn_captionViewWait
        L29_30 = "sm16_01017"
        L28_29(L29_30)
        L28_29 = Photo
        L28_29 = L28_29.create
        L29_30 = kPHOTO_CAPTION_ON
        L32_33.near = 6.5
        L32_33.far = 12
        L28_29 = L28_29(L29_30, L30_31, L31_32, L32_33)
        L25_26 = L28_29
        L29_30 = L25_26
        L28_29 = L25_26.set
        L28_29(L29_30, L30_31)
        while not L26_27 do
          L28_29 = _photo_area
          if L28_29 then
            L29_30 = L25_26
            L28_29 = L25_26.run
            L28_29(L29_30)
            L28_29 = print
            L29_30 = "phase:2"
            L28_29(L29_30)
            repeat
              L28_29 = wait
              L28_29()
              L28_29 = _photo_area
              if L28_29 ~= false then
                L29_30 = L25_26
                L28_29 = L25_26.isRunning
                L28_29 = L28_29(L29_30)
                if L28_29 then
                  L28_29 = RETRY_STATE
                  L28_29 = L28_29.NONE
                end
              end
            until L23_24 ~= L28_29
            L28_29 = _photo_area
            if L28_29 == true then
              L28_29 = RETRY_STATE
              L28_29 = L28_29.NONE
              if L23_24 == L28_29 then
                L29_30 = L25_26
                L28_29 = L25_26.getPhotoState
                L28_29 = L28_29(L29_30)
                L29_30 = kPHOTO_OK
                if L28_29 ~= L29_30 then
                  L29_30 = kPHOTO_FAR
                else
                  if L28_29 == L29_30 then
                    L29_30 = Mv_safeTaskAbort
                    L29_30 = L29_30(L30_31)
                    L27_28 = L29_30
                    L29_30 = Player
                    L29_30 = L29_30.setStay
                    L29_30(L30_31, L31_32)
                    L29_30 = Fn_userCtrlAllOff
                    L29_30()
                    L29_30 = Camera
                    L29_30 = L29_30.setControl
                    L33_34 = false
                    L29_30(L30_31, L31_32, L32_33, L33_34)
                    L29_30 = Sound
                    L29_30 = L29_30.pulse
                    L29_30(L30_31, L31_32)
                    L29_30 = Fn_pcSensorOff
                    L29_30(L30_31)
                    L29_30 = Fn_pcSensorOff
                    L29_30(L30_31)
                    L29_30 = Fn_pcSensorOff
                    L29_30(L30_31)
                    L29_30 = Fn_captionViewWait
                    L29_30(L30_31)
                    L26_27 = true
                    L29_30 = PHOTO_PHASE
                    L24_25 = L29_30.EXIT
                end
                else
                  L29_30 = kPHOTO_OUT
                  if L28_29 == L29_30 then
                    L29_30 = Fn_captionView
                    L29_30(L30_31)
                  else
                    L29_30 = kPHOTO_ANGLE
                    if L28_29 == L29_30 then
                      L29_30 = Fn_captionView
                      L29_30(L30_31)
                    else
                      L29_30 = kPHOTO_NEAR
                      if L28_29 == L29_30 then
                        L29_30 = Fn_captionView
                        L29_30(L30_31)
                      else
                        L29_30 = kPHOTO_BACK
                        if L28_29 == L29_30 then
                          L29_30 = Fn_captionView
                          L29_30(L30_31)
                        end
                      end
                    end
                  end
                end
              else
                L28_29 = PHOTO_PHASE
                L24_25 = L28_29.SETUP
                break
              end
            end
          end
          L28_29 = wait
          L28_29()
        end
      end
    end
    L28_29 = wait
    L28_29()
    L28_29 = PHOTO_PHASE
    L28_29 = L28_29.EXIT
  until L24_25 == L28_29
  L28_29 = Mv_safeObjectKill
  L29_30 = L25_26
  L28_29 = L28_29(L29_30)
  L25_26 = L28_29
  L28_29 = Fn_naviKill
  L28_29()
  L28_29 = {}
  L28_29.inform_ex_00 = "man01_question_00"
  L29_30 = nil
  L30_31(L31_32)
  L30_31(L31_32)
  L31_32.pos = "locator2_boy_greeting"
  L31_32.time = 1.5
  L33_34 = nil
  L31_32(L32_33, L33_34, L30_31)
  L31_32(L32_33)
  L31_32(L32_33)
  L33_34 = true
  L31_32(L32_33, L33_34)
  L33_34 = "locator2_client_start"
  L31_32(L32_33, L33_34)
  L33_34 = "locator2_client_start"
  L31_32(L32_33, L33_34)
  L31_32(L32_33)
  L31_32(L32_33)
  L31_32(L32_33)
  L31_32(L32_33)
  L31_32(L32_33)
  L31_32(L32_33)
  L33_34 = {}
  L33_34.pos = "locator2_aim_boy_02"
  L33_34.time = L31_32
  L33_34 = _sdemo_cut_03
  L33_34 = L33_34.play
  L33_34(L33_34, nil, L32_33)
  L33_34 = Fn_moveNpc
  L33_34 = L33_34("sm16_client", {
    "locator2_client_move"
  }, {runLength = -1, anim_run_speed = 1})
  while Mv_isSafeTaskRunning(L33_34) do
    wait()
  end
  L33_34 = nil
  wait()
  Fn_playNpcEventMotion("sm16_client", L28_29.inform_ex_00, 1, 0.1, false)
  Fn_kaiwaDemoView("sm16_00600k")
  Mv_sceneSwitchFade(function()
    _sdemo_cut_03:stop()
    L29_30 = Mv_safeTaskAbort(L29_30)
    L22_23 = Mv_safeTaskAbort(L22_23)
    Fn_playMotionNpc("sm16_girl", "stay", false)
    Fn_playMotionNpc("sm16_boy", "stay", false)
    Fn_resetPcPos("locator2_pc_reset_pos_02")
    Fn_warpNpc("sm16_mother", "locator2_mother_reset_pos")
    Fn_warpNpc("sm16_girl", "locator2_girl_reset_pos")
    Fn_warpNpc("sm16_boy", "locator2_boy_reset_pos")
    Fn_warpNpc("sm16_client", "locator2_client_reset_pos")
    Fn_playMotionNpc("sm16_client", "stay_02", false)
    Fn_playMotionNpc("sm16_mother", "stay_02", false)
    Fn_playMotionNpc("sm16_girl", "lookaround", false)
    Fn_playMotionNpc("sm16_boy", "photo_00", false)
    waitSeconds(2)
  end)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm16_00700k")
  Mv_sceneSwitchFade(function()
    Fn_resetPcPos("locator2_pc_return_pos")
    Fn_appendNpcArea("sm16_client", "locator2_client_return_pos")
    Fn_warpNpc("sm16_client", "locator2_client_return_pos")
    Fn_disappearNpc("sm16_mother")
    Fn_disappearNpc("sm16_girl")
    Fn_disappearNpc("sm16_boy")
    waitSeconds(1)
  end)
  waitSeconds(1)
  Fn_kaiwaDemoView("sm16_00800k")
  Player:setStay(false)
  Fn_userCtrlOn()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_35, L1_36
end
function pccubesensor2_photo_area_OnLeave()
  print("\232\170\152\229\176\142\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\227\129\167\227\129\159\239\188\129\239\188\129")
  if _phase == 1 then
    Fn_naviSet(findGameObject2("Node", "locator2_between_targets"))
  elseif _phase == 2 then
    Fn_naviSet(findGameObject2("Node", "locator2_mother_home"))
  end
  _photo_area = false
  Fn_captionView("sm16_01027")
end
function pccubesensor2_photo_area_OnEnter()
  print("\232\170\152\229\176\142\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159\239\188\129\239\188\129")
  Fn_naviKill()
  _photo_area = true
  if _photo ~= nil then
    invokeTask(function()
      _photo:resetCaption()
      print("\227\131\149\227\130\169\227\131\136\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\131\170\227\130\187\227\131\131\227\131\136\239\188\129")
    end)
  end
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
    if _photo ~= nil then
      invokeTask(function()
        _photo:resetCaption()
        print("\227\131\149\227\130\169\227\131\136\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\131\170\227\130\187\227\131\131\227\131\136\239\188\129")
      end)
    end
  end)
end
