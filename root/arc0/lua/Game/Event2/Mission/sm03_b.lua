import("Debug")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm03_common.lua")
WALKING_MAX = 3
_puppet_tbl = {}
_cid_talk_task = nil
_cid_talk_flg = false
_event_motion_table = {
  label01 = "kit01_hail_00",
  label02 = "kit01_salute_00",
  label03 = "kit01_hand_00",
  label04 = "kit01_greeting_00",
  label05 = "kit01_stay_00"
}
_kaiwa_02_end = false
_kaiwa_03_end = false
_is_right_boatman = false
GESTURE_CAPTION = {
  REPLY_YES_01 = "sm03_01023",
  REPLY_NO_01 = "sm03_01029",
  REPLY_NO_02 = "sm03_01031"
}
_mob_txt_01 = {
  man33 = {
    known_kaiwa = "sm03_00760k",
    reply_caption_skip = false,
    reply_yes = {
      text = GESTURE_CAPTION.REPLY_YES_01,
      time = 2
    },
    reply_no = {text = nil, time = nil}
  },
  man40 = {
    unknown_kaiwa = "sm03_00730k",
    reply_caption_skip = false,
    reply_yes = {text = nil, time = nil},
    reply_no = {
      text = GESTURE_CAPTION.REPLY_NO_01,
      time = 2
    }
  },
  other = {
    {
      reply_yes = {text = nil, time = nil},
      reply_no = {
        text = GESTURE_CAPTION.REPLY_NO_01,
        time = 2
      }
    },
    {
      reply_yes = {text = nil, time = nil},
      reply_no = {
        text = GESTURE_CAPTION.REPLY_NO_02,
        time = 2
      }
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_po_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_kikikomi_warp")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_cid_talk_area_b")
  L0_0 = {
    {
      name = "wom_cidtalk_01",
      type = "wom17",
      node = "locator2_wom_cidtalk_01"
    },
    {
      name = "wom_cidtalk_02",
      type = "wom18",
      node = "locator2_wom_cidtalk_02",
      color_variation = 0
    },
    {
      name = "miz01",
      type = "miz01",
      node = "locator2_miz_01",
      attach = false
    },
    {
      name = "gaw_01",
      type = "man34",
      node = "locator2_gaw_yatai_front_01",
      active = false
    },
    {
      name = "boatman_01",
      type = "man41",
      node = "locator2_boatman_01_b",
      reset = false
    },
    {
      name = "boatman_02",
      type = "man33",
      node = "locator2_boatman_02_b",
      reset = false
    },
    {
      name = "boatman_03",
      type = "man40",
      node = "locator2_boatman_03_b",
      reset = false
    },
    {
      name = "boatman_04",
      type = "man39",
      node = "locator2_boatman_04_b",
      reset = false
    },
    {
      name = "boatmantalk",
      type = "man40",
      node = "locator2_boatmantalk_01"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _customer_table = {
    {
      name = "walk_01",
      type = "man_jil",
      node = "locator2_npc_yatai_01",
      active = false
    },
    {
      name = "walk_02",
      type = "man_jil",
      node = "locator2_npc_yatai_02",
      active = false
    },
    {
      name = "walk_03",
      type = "man_jil",
      node = "locator2_npc_yatai_03",
      active = false
    },
    {
      name = "walk_04",
      type = "man_jil",
      node = "locator2_npc_yatai_06",
      active = false
    },
    {
      name = "walk_05",
      type = "man_jil",
      node = "locator2_npc_yatai_07",
      active = false
    },
    {
      name = "walk_06",
      type = "man_jil",
      node = "locator2_npc_yatai_09",
      active = false
    },
    {
      name = "walk_07",
      type = "wom_jil_po",
      node = "locator2_npc_yatai_04",
      active = false
    },
    {
      name = "walk_08",
      type = "wom_jil_po",
      node = "locator2_npc_yatai_05",
      active = false
    },
    {
      name = "walk_09",
      type = "wom_jil_po",
      node = "locator2_npc_yatai_08",
      active = false
    },
    {
      name = "walk_10",
      type = "wom_jil_po",
      node = "locator2_npc_yatai_10",
      active = false
    },
    {
      name = "walk_11",
      type = "wom_jil_po",
      node = "locator2_npc_yatai_11",
      active = false
    },
    {
      name = "walk_12",
      type = "wom_jil_po",
      node = "locator2_npc_yatai_12",
      active = false
    }
  }
  Fn_setupNpc(_customer_table)
  for _FORV_4_, _FORV_5_ in pairs(_customer_table) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _CUSTOMER_MAN_MAX = 6
  _cid_puppet = Fn_findNpcPuppet("sm03_client")
  _sdemo_cut02 = SDemo.create("sm03_b_cut02")
  _sdemo_cut02:set("locator2_sdemo_cam_b_yatai_01", "locator2_sdemo_aim_b_yatai_01")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31
  L0_1 = Fn_sendEventComSb
  L1_2 = "isOnceCameraSet"
  L0_1 = L0_1(L1_2)
  if L0_1 == false then
    L0_1 = Fn_sendEventComSb
    L1_2 = "requestCameraSet"
    L2_3 = true
    L0_1(L1_2, L2_3)
  end
  L0_1 = Fn_loadPlayerMotion
  L1_2 = _event_motion_table
  L0_1(L1_2)
  L0_1 = Fn_playPlayerMotion
  L1_2 = _event_motion_table
  L1_2 = L1_2.label05
  L2_3 = 0
  L3_4 = 0.1
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = HUD
  L1_2 = L0_1
  L0_1 = L0_1.info
  L2_3 = "sm03_info_01"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = wait
  L0_1()
  L0_1 = Fn_missionView
  L1_2 = "sm03_01000"
  L0_1(L1_2)
  L0_1 = waitSeconds
  L1_2 = 1.3
  L0_1(L1_2)
  L0_1 = {}
  L1_2 = {}
  L2_3 = {}
  L3_4 = {}
  L4_5 = {}
  L5_6 = {}
  L6_7 = {}
  L7_8 = false
  L8_9 = 0
  L9_10 = {
    L10_11,
    L11_12,
    L12_13,
    L13_14,
    L14_15,
    L15_16,
    L16_17
  }
  for L13_14, L14_15 in L10_11(L11_12) do
    L4_5[L13_14] = false
    L5_6[L13_14] = false
    L19_20 = "%02d"
    L20_21 = L13_14
    L1_2[L13_14] = L15_16
  end
  for L14_15 = 1, WALKING_MAX do
    L15_16(L16_17)
    while true do
      L30_31 = L17_18(L18_19)
      if not L15_16 then
        L6_7[L14_15] = L10_11
        L5_6[L10_11] = true
        L15_16(L16_17)
        L19_20 = "%02d"
        L20_21 = L14_15
        L19_20 = "_start"
        L15_16(L16_17, L17_18)
        L15_16(L16_17, L17_18)
        L19_20 = L14_15
        L0_1[L14_15] = L15_16
        L18_19.runLength = 1000
        L2_3[L14_15] = L15_16
        break
      end
    end
    L15_16(L16_17)
  end
  while true do
    L13_14.btn = L14_15
    L13_14.text = "sm03_01032"
    L14_15.btn = L15_16
    L14_15.text = "sm03_01033"
    L15_16.btn = L16_17
    L15_16.text = "sm03_01034"
    L16_17.btn = L17_18
    L16_17.text = "sm03_01035"
    while true do
      if not L7_8 then
        L13_14(L14_15, L15_16)
        break
      else
        L13_14()
      end
    end
    while true do
      if L13_14 == L15_16 then
        L15_16(L16_17, L17_18, L18_19)
        L15_16(L16_17, L17_18, L18_19)
        btn = L15_16
        if L15_16 == L16_17 then
          L15_16(L16_17, L17_18, L18_19)
        elseif L15_16 == L16_17 then
          L19_20 = true
          L15_16(L16_17, L17_18, L18_19, L19_20)
        elseif L15_16 == L16_17 then
          L19_20 = true
          L15_16(L16_17, L17_18, L18_19, L19_20)
        elseif L15_16 == L16_17 then
          L19_20 = true
          L15_16(L16_17, L17_18, L18_19, L19_20)
        end
        L19_20 = "sm03_01004"
        L17_18(L18_19)
        L19_20 = "kit_573"
        L19_20 = 1
        L20_21 = #L17_18
        L19_20 = Sound
        L20_21 = L19_20
        L19_20 = L19_20.playSE
        L21_22 = L17_18[L18_19]
        L22_23 = 1
        L23_24 = ""
        L19_20(L20_21, L21_22, L22_23, L23_24)
        L19_20 = waitSeconds
        L20_21 = 1
        L19_20(L20_21)
        break
      else
      end
      if L13_14 ~= L15_16 then
        L15_16()
      end
    end
    for L18_19 = 1, WALKING_MAX do
      L19_20 = Fn_getDistanceToPlayer
      L20_21 = _puppet_tbl
      L21_22 = "walk_"
      L22_23 = string
      L22_23 = L22_23.format
      L23_24 = "%02d"
      L24_25 = L6_7[L18_19]
      L22_23 = L22_23(L23_24, L24_25)
      L21_22 = L21_22 .. L22_23
      L20_21 = L20_21[L21_22]
      L19_20 = L19_20(L20_21)
      if L19_20 < 5 then
        L20_21 = L6_7[L18_19]
        L20_21 = L4_5[L20_21]
        if not L20_21 then
          L3_4[L18_19] = true
          L20_21 = Fn_findNpcPuppet
          L21_22 = _customer_table
          L22_23 = L6_7[L18_19]
          L21_22 = L21_22[L22_23]
          L21_22 = L21_22.name
          L20_21 = L20_21(L21_22)
          L22_23 = L20_21
          L21_22 = L20_21.getWorldPos
          L21_22 = L21_22(L22_23)
          L22_23 = L6_7[L18_19]
          L4_5[L22_23] = true
          L22_23 = Fn_turnNpc
          L23_24 = _customer_table
          L24_25 = L6_7[L18_19]
          L23_24 = L23_24[L24_25]
          L23_24 = L23_24.name
          L22_23(L23_24)
          L22_23 = waitSeconds
          L23_24 = 0.6
          L22_23(L23_24)
          L22_23 = {
            L23_24,
            L24_25,
            L25_26,
            L26_27,
            L27_28
          }
          L23_24 = "sm03_01005"
          L24_25 = "sm03_01006"
          L25_26 = "sm03_01007"
          L26_27 = "sm03_01008"
          L27_28 = "sm03_01009"
          L23_24 = {
            L24_25,
            L25_26,
            L26_27,
            L27_28,
            L28_29
          }
          L24_25 = "sm03_01010"
          L25_26 = "sm03_01011"
          L26_27 = "sm03_01012"
          L27_28 = "sm03_01013"
          L28_29 = "sm03_01014"
          L24_25 = RandI
          L25_26 = 1
          L26_27 = 5
          L24_25 = L24_25(L25_26, L26_27)
          L25_26 = L6_7[L18_19]
          L26_27 = _CUSTOMER_MAN_MAX
          if L25_26 <= L26_27 then
            L25_26 = Fn_captionView
            L26_27 = L22_23[L24_25]
            L25_26(L26_27)
          else
            L25_26 = Fn_captionView
            L26_27 = L23_24[L24_25]
            L25_26(L26_27)
          end
          L8_9 = L8_9 + 1
          L25_26 = Fn_moveNpc
          L26_27 = _customer_table
          L27_28 = L6_7[L18_19]
          L26_27 = L26_27[L27_28]
          L26_27 = L26_27.name
          L27_28 = L1_2[L8_9]
          L28_29 = {}
          L28_29.runLength = 1000
          L28_29.navimesh = false
          L25_26 = L25_26(L26_27, L27_28, L28_29)
          L2_3[L18_19] = L25_26
          L7_8 = true
          L3_4[L18_19] = false
        end
      end
      L20_21 = waitSeconds
      L21_22 = 0.2
      L20_21(L21_22)
    end
    L15_16(L16_17)
    for L19_20, L20_21 in L16_17(L17_18) do
      L21_22 = L4_5[L19_20]
      if L21_22 then
      end
    end
    if not (L15_16 >= 5) then
      L19_20 = true
      L16_17(L17_18, L18_19, L19_20)
      L19_20 = true
      L16_17(L17_18, L18_19, L19_20)
    end
  end
  L12_13(L13_14)
  L12_13()
  L12_13()
  L12_13(L13_14, L14_15)
  L12_13(L13_14)
  for L15_16 = 1, WALKING_MAX do
    L2_3[L15_16] = L16_17
    L16_17()
    L19_20 = false
    L16_17(L17_18, L18_19, L19_20)
    L16_17(L17_18, L18_19)
  end
  for L15_16, L16_17 in L12_13(L13_14) do
    L19_20 = "locator2_npc_yatai_"
    L20_21 = string
    L20_21 = L20_21.format
    L21_22 = "%02d"
    L22_23 = L15_16
    L20_21 = L20_21(L21_22, L22_23)
    L19_20 = L19_20 .. L20_21
    L17_18(L18_19, L19_20)
    L19_20 = "stay"
    L20_21 = false
    L17_18(L18_19, L19_20, L20_21)
    L19_20 = true
    L17_18(L18_19, L19_20)
  end
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14, L14_15, L15_16)
  L12_13[1] = L13_14
  L12_13[2] = L13_14
  L12_13[3] = L13_14
  L12_13[4] = L13_14
  L12_13[5] = L13_14
  L12_13[6] = L13_14
  L12_13[7] = L13_14
  L13_14(L14_15, L15_16)
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14()
  L13_14(L14_15, L15_16)
  while true do
    if L15_16 then
      L15_16()
    end
  end
  L15_16()
  L15_16(L16_17, L17_18, L18_19)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16()
  L15_16(L16_17, L17_18)
  L15_16(L16_17, L17_18)
  for L18_19, L19_20 in L15_16(L16_17) do
    L20_21 = Mv_safeTaskAbort
    L21_22 = L19_20
    L20_21 = L20_21(L21_22)
    L19_20 = L20_21
  end
  L15_16()
  for L18_19, L19_20 in L15_16(L16_17) do
    L20_21 = Fn_disappearNpc
    L21_22 = L19_20.name
    L20_21(L21_22)
  end
  L15_16(L16_17)
  L15_16(L16_17, L17_18)
  L19_20 = "ciguitar01_base"
  L20_21 = "loc_l_hand"
  L16_17(L17_18, L18_19, L19_20, L20_21)
  L19_20 = "play_guitar_01"
  L20_21 = "talk_guitar_00"
  L19_20 = 5
  L20_21 = 10
  L19_20 = "listen_00"
  L20_21 = {L21_22}
  L21_22 = "listen_00"
  L21_22 = 5
  L22_23 = 5
  L19_20 = "wom_cidtalk_02"
  L20_21 = "listen_00"
  L21_22 = {L22_23}
  L22_23 = "handclap"
  L22_23 = 3
  L23_24 = 3
  L19_20 = Fn_fadein
  L19_20()
  L19_20 = Sound
  L20_21 = L19_20
  L19_20 = L19_20.playSE
  L21_22 = "sm03_guitar"
  L22_23 = 1
  L23_24 = ""
  L24_25 = _cid_puppet
  L19_20(L20_21, L21_22, L22_23, L23_24, L24_25)
  L19_20 = waitSeconds
  L20_21 = 2
  L19_20(L20_21)
  L19_20 = Fn_kaiwaDemoView
  L20_21 = "sm03_00600k"
  L19_20(L20_21)
  L19_20 = Fn_userCtrlOn
  L19_20()
  L19_20 = Fn_pcSensorOn
  L20_21 = "pccubesensor2_po_area"
  L19_20(L20_21)
  L19_20 = Fn_pcSensorOn
  L20_21 = "pccubesensor2_cid_talk_area_b"
  L19_20(L20_21)
  L19_20 = Fn_setCatWarpCheckPoint
  L20_21 = "locator2_pc_restart_pos"
  L19_20(L20_21)
  L19_20 = Mv_invokeMissionViewNaviCaption
  L20_21 = "sm03_01016"
  L21_22 = "locator2_po_navi_01"
  L22_23 = "sm03_01015"
  L19_20 = L19_20(L20_21, L21_22, L22_23)
  function L20_21()
    Fn_setGestureAction(_puppet_tbl.miz01, false)
    Fn_turnNpc("miz01")
    Fn_kaiwaDemoView("sm03_00700k")
  end
  L21_22 = Fn_setupGestureAction
  L22_23 = {}
  L23_24 = _puppet_tbl
  L23_24 = L23_24.miz01
  L22_23.target = L23_24
  L23_24 = {}
  L24_25 = {}
  L24_25.id = "ui_event_guide_02"
  L24_25.func = L20_21
  L23_24.RL = L24_25
  L24_25, L25_26 = nil, nil
  L26_27 = false
  L21_22(L22_23, L23_24, L24_25, L25_26, L26_27)
  L21_22 = start_game_obj
  L21_22()
  L21_22 = {
    L22_23,
    L23_24,
    L24_25,
    L25_26,
    L26_27
  }
  L22_23 = _puppet_tbl
  L22_23 = L22_23.boatman_01
  L23_24 = _puppet_tbl
  L23_24 = L23_24.boatman_02
  L24_25 = _puppet_tbl
  L24_25 = L24_25.boatman_03
  L25_26 = _puppet_tbl
  L25_26 = L25_26.boatman_04
  L26_27 = _puppet_tbl
  L26_27 = L26_27.boatmantalk
  L22_23 = GestureEvent
  L22_23 = L22_23.create
  L23_24 = "ui_event_guide_02"
  L24_25, L25_26 = nil, nil
  L26_27 = gestureNpcActionCallback
  L22_23 = L22_23(L23_24, L24_25, L25_26, L26_27)
  _gesture = L22_23
  L22_23 = _gesture
  L23_24 = L22_23
  L22_23 = L22_23.setNaviTarget
  L24_25 = _puppet_tbl
  L24_25 = L24_25.boatman_01
  L25_26 = nil
  L26_27 = {}
  L26_27.classGroup = "yy_navi_sm03"
  L26_27.classpositiveRate = 1
  L22_23(L23_24, L24_25, L25_26, L26_27)
  L22_23 = _gesture
  L23_24 = L22_23
  L22_23 = L22_23.setNpc
  L24_25 = L21_22
  L22_23(L23_24, L24_25)
  L22_23 = _gesture
  L23_24 = L22_23
  L22_23 = L22_23.setMobText
  L24_25 = _mob_txt_01
  L22_23(L23_24, L24_25)
  L22_23 = _gesture
  L23_24 = L22_23
  L22_23 = L22_23.setAsking
  L24_25 = false
  L22_23(L23_24, L24_25)
  L22_23 = invokeTask
  function L23_24()
    repeat
      if _gesture:getInteractionMobType() ~= nil then
        if _gesture:getInteractionMobType() == "man33" then
          _kaiwa_02_end = true
        elseif _gesture:getInteractionMobType() == "man40" then
          _kaiwa_03_end = true
        end
      end
      wait()
    until false
  end
  L22_23 = L22_23(L23_24)
  L23_24 = createGameObject2
  L24_25 = "GimmickBg"
  L23_24 = L23_24(L24_25)
  L24_25 = holdObject
  L25_26 = L23_24
  L26_27 = _puppet_tbl
  L26_27 = L26_27.boatman_03
  L27_28 = "cimemo01_base"
  L28_29 = "loc_l_hand"
  L24_25(L25_26, L26_27, L27_28, L28_29)
  L24_25 = Fn_repeatPlayMotion
  L25_26 = "boatman_01"
  L26_27 = "talk_03"
  L27_28 = {L28_29}
  L28_29 = "talk_03"
  L24_25 = L24_25(L25_26, L26_27, L27_28)
  L25_26 = Fn_repeatPlayMotion
  L26_27 = "boatmantalk"
  L27_28 = "talk_02"
  L28_29 = {L29_30}
  L29_30 = "talk_02"
  L25_26 = L25_26(L26_27, L27_28, L28_29)
  L26_27 = Fn_playMotionNpc
  L27_28 = "boatman_02"
  L28_29 = "check_00"
  L29_30 = false
  L26_27(L27_28, L28_29, L29_30)
  L26_27 = Fn_playMotionNpc
  L27_28 = "boatman_03"
  L28_29 = "count_00"
  L29_30 = false
  L26_27(L27_28, L28_29, L29_30)
  L26_27 = Fn_playMotionNpc
  L27_28 = "boatman_04"
  L28_29 = "sit_floor_01"
  L29_30 = false
  L26_27(L27_28, L28_29, L29_30)
  L26_27 = 1
  L27_28 = {
    L28_29,
    L29_30,
    L30_31
  }
  L28_29 = "w06_005"
  L29_30 = "w07_009"
  L30_31 = "w08_007"
  L28_29 = invokeTask
  function L29_30()
    local L0_32
    while true do
      L0_32 = Mv_isWaitPhase
      L0_32 = L0_32()
      if L0_32 then
        while true do
          L0_32 = Mv_isSafeTaskRunning
          L0_32 = L0_32(L19_20)
          if L0_32 then
            L0_32 = wait
            L0_32()
          end
        end
        L0_32 = _cid_talk_flg
        if L0_32 then
          L0_32 = L26_27
          if L0_32 == 1 then
            L0_32 = L26_27
            L0_32 = L0_32 + 1
            L26_27 = L0_32
            L0_32 = Sound
            L0_32 = L0_32.playSE
            L0_32(L0_32, "sm03_guitar", 1, "", _cid_puppet)
          else
            L0_32 = L26_27
            if L0_32 == 2 then
              L0_32 = RandI
              L0_32 = L0_32(1, #L27_28)
              Sound:playSE(L27_28[L0_32], 1, "", _puppet_tbl.wom_cidtalk_01)
              table.remove(L27_28, L0_32)
              L26_27 = L26_27 + 1
              Fn_captionViewWait("sm03_01018")
            else
              L0_32 = L26_27
              if L0_32 == 3 then
                L0_32 = L26_27
                L0_32 = L0_32 + 1
                L26_27 = L0_32
                L0_32 = Sound
                L0_32 = L0_32.playSE
                L0_32(L0_32, "sm03_guitar", 1, "", _cid_puppet)
              else
                L0_32 = L26_27
                if L0_32 == 4 then
                  L0_32 = L26_27
                  L0_32 = L0_32 + 1
                  L26_27 = L0_32
                  L0_32 = RandI
                  L0_32 = L0_32(1, #L27_28)
                  Sound:playSE(L27_28[L0_32], 1, "", _puppet_tbl.wom_cidtalk_02)
                  Fn_captionViewWait("sm03_01020")
                end
              end
            end
          end
          L0_32 = waitSeconds
          L0_32(1.2)
        end
        L0_32 = wait
        L0_32()
      end
    end
  end
  L28_29 = L28_29(L29_30)
  _cid_talk_task = L28_29
  L28_29 = invokeTask
  function L29_30()
    while not (Fn_getDistanceToPlayer("locator2_po_navi_01") < 300) do
      wait()
    end
    Fn_captionViewWait("sm03_01021")
    waitSeconds(3)
    Fn_captionView("sm03_01022")
  end
  L28_29 = L28_29(L29_30)
  L29_30 = Mv_waitPhase
  L29_30()
  L29_30 = Fn_pcSensorOff
  L30_31 = "pccubesensor2_cid_talk_area_b"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOff
  L30_31 = "pccubesensor2_far_b"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOff
  L30_31 = "pccubesensor2_warning_b"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOff
  L30_31 = "pccubesensor2_warp_b"
  L29_30(L30_31)
  L29_30 = Mv_safeTaskAbort
  L30_31 = L28_29
  L29_30 = L29_30(L30_31)
  L28_29 = L29_30
  L29_30 = Fn_captionViewEnd
  L29_30()
  L29_30 = Fn_pcSensorOn
  L30_31 = "pccubesensor2_kikikomi_warp"
  L29_30(L30_31)
  L29_30 = Fn_setCatWarpCheckPoint
  L30_31 = "locator2_kikikomi_reset"
  L29_30(L30_31)
  L29_30 = Fn_missionView
  L30_31 = "sm03_01025"
  L29_30(L30_31)
  L29_30 = waitSeconds
  L30_31 = 3.8
  L29_30(L30_31)
  L29_30 = Fn_captionView
  L30_31 = "sm03_01024"
  L29_30(L30_31)
  while true do
    L29_30 = _is_right_boatman
    if L29_30 == false then
      L29_30 = wait
      L29_30()
    end
  end
  L29_30 = Fn_setGestureAction
  L30_31 = _puppet_tbl
  L30_31 = L30_31.miz01
  L29_30(L30_31, true)
  L29_30 = Mv_safeTaskAbort
  L30_31 = L22_23
  L29_30 = L29_30(L30_31)
  L22_23 = L29_30
  L29_30 = _gesture
  L30_31 = L29_30
  L29_30 = L29_30.stop
  L29_30(L30_31)
  _gesture = nil
  L29_30 = Fn_pcSensorOff
  L30_31 = "pccubesensor2_po_area"
  L29_30(L30_31)
  L29_30 = Fn_pcSensorOff
  L30_31 = "pccubesensor2_kikikomi_warp"
  L29_30(L30_31)
  L29_30 = Mv_safeTaskAbort
  L30_31 = L24_25
  L29_30 = L29_30(L30_31)
  L24_25 = L29_30
  L29_30 = Mv_safeTaskAbort
  L30_31 = L25_26
  L29_30 = L29_30(L30_31)
  L25_26 = L29_30
  L29_30 = Fn_playMotionNpc
  L30_31 = "boatman_01"
  L29_30(L30_31, "stay_01", false)
  L29_30 = Fn_playMotionNpc
  L30_31 = "boatmantalk"
  L29_30(L30_31, "stay_01", false)
  L29_30 = Mv_safeTaskAbort
  L30_31 = _cid_talk_task
  L29_30 = L29_30(L30_31)
  _cid_talk_task = L29_30
  L29_30 = Mv_safeTaskAbort
  L30_31 = L16_17
  L29_30 = L29_30(L30_31)
  L29_30 = Mv_safeTaskAbort
  L30_31 = L17_18
  L29_30 = L29_30(L30_31)
  L29_30 = Mv_safeTaskAbort
  L30_31 = L18_19
  L29_30 = L29_30(L30_31)
  L29_30 = Fn_userCtrlAllOff
  L29_30()
  L29_30 = waitSeconds
  L30_31 = 0.5
  L29_30(L30_31)
  L29_30 = Fn_sendEventComSb
  L30_31 = "requestShipSpeedUp"
  L29_30(L30_31, false)
  L29_30 = Fn_turnNpc
  L30_31 = "boatman_01"
  L29_30(L30_31, "locator2_boatman01_turn_ship_01")
  L29_30 = invokeTask
  function L30_31()
    wait()
    Fn_turnNpc("boatmantalk", "locator2_boatman01_turn_ship_01")
    Fn_playMotionNpc("boatmantalk", "lookaround", false)
  end
  L29_30(L30_31)
  L29_30 = wait
  L29_30()
  L29_30 = Sound
  L30_31 = L29_30
  L29_30 = L29_30.playSE
  L29_30(L30_31, "m02_933c", 1, "", Fn_findNpcPuppet("boatman_01"))
  L29_30 = Fn_playMotionNpc
  L30_31 = "boatman_01"
  L29_30(L30_31, "surprise", false)
  L29_30 = waitSeconds
  L30_31 = 1.8
  L29_30(L30_31)
  L29_30 = Fn_moveNpc
  L30_31 = "boatman_01"
  L29_30 = L29_30(L30_31, {
    "locator2_boatman_dash"
  }, {runLength = -1})
  L30_31 = waitSeconds
  L30_31(0.6)
  L30_31 = Player
  L30_31 = L30_31.setLookAtIk
  L30_31(L30_31, true, 1, (findGameObject2("Node", "locator2_ship_move_b"):getWorldPos()))
  L30_31 = Mv_viewObjWait
  L30_31 = L30_31(_puppet_tbl.boatman_01, 0.5, 1.5)
  while Mv_isSafeTaskRunning(L29_30) do
    wait()
  end
  L29_30 = Mv_safeTaskAbort(L29_30)
  Fn_playMotionNpc("boatman_01", "talk_angry_00", false)
  waitSeconds(4)
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  L30_31 = Mv_safeTaskAbort(L30_31)
  Fn_kaiwaDemoView("sm03_00830k")
  Fn_userCtrlOn()
  Fn_playMotionNpc("boatman_01", "stay", false)
  Fn_disappearNpc("wom_cidtalk_01")
  Fn_disappearNpc("wom_cidtalk_02")
  waitSeconds(1)
  L15_16:try_term()
  L23_24:try_term()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_33, L1_34
end
function pccubesensor2_far_b_OnLeave()
  Fn_captionView("sm03_01038")
end
function pccubesensor2_warning_b_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm03_01026")
  Player:setStay(false, false)
end
function pccubesensor2_warp_b_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_po_area_OnEnter()
  Fn_naviKill()
  Mv_gotoNextPhase()
  _gesture:run()
end
function pccubesensor2_po_area_OnLeave()
  Fn_captionView("sm03_01038")
  Fn_naviSet("locator2_po_navi_01")
end
function pccubesensor2_warning_kikikomi_OnLeave()
  Player:setStay(true, false)
  Fn_captionView("sm03_01026")
  Player:setStay(false, false)
end
function pccubesensor2_kikikomi_warp_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_cid_talk_area_b_OnEnter()
  local L1_35
  L1_35 = _cid_talk_flg
  if not L1_35 then
    _cid_talk_flg = true
  end
end
function pccubesensor2_cid_talk_area_b_OnLeave()
  local L0_36, L1_37
  _cid_talk_flg = false
end
function gestureNpcActionCallback(A0_38)
  local L1_39, L2_40
  if A0_38 then
    L2_40 = A0_38
    L1_39 = A0_38.getName
    L1_39 = L1_39(L2_40)
    L2_40 = Fn_userCtrlOff
    L2_40()
    L2_40 = A0_38.getWorldPos
    L2_40 = L2_40(A0_38)
    L2_40 = L2_40 + Vector(0, 1.2, 0)
    Player:setLookAtIk(true, 1, L2_40)
    if L1_39 == "boatman_02" then
      Fn_playMotionNpc("boatman_02", "check_out_00", true)
    end
    if L1_39 == "boatman_01" or L1_39 == "boatman_02" or L1_39 == "boatman_03" then
      Fn_turnNpc(L1_39)
    end
    if L1_39 == "boatman_01" or L1_39 == "boatmantalk" then
      Fn_kaiwaDemoView("sm03_00800k")
      _is_right_boatman = true
    elseif L1_39 == "boatman_02" then
      if _kaiwa_02_end == false then
        Fn_kaiwaDemoView("sm03_00760k")
        Fn_turnNpc("boatman_02", "locator2_boatman_01_b")
        Fn_playMotionNpc("boatman_02", "inform_lp", false)
        Mv_viewObj(_puppet_tbl.boatman_01, 0.3)
        _kaiwa_02_end = true
        waitSeconds(1)
        Fn_turnNpc("boatman_02", "locator2_boatman_02_direction")
        Fn_playMotionNpc("boatman_02", "check_in_00", true)
        Fn_playMotionNpc("boatman_02", "check_00", false)
      else
        Fn_turnNpc("boatman_02", "locator2_boatman_01_b")
        Fn_playMotionNpc("boatman_02", "inform_lp", false)
        Fn_captionView(GESTURE_CAPTION.REPLY_YES_01)
        Mv_viewObj(_puppet_tbl.boatman_01, 0.3)
        waitSeconds(1)
        Fn_turnNpc("boatman_02", "locator2_boatman_02_direction")
        Fn_playMotionNpc("boatman_02", "check_in_00", true)
        Fn_playMotionNpc("boatman_02", "check_00", false)
      end
    elseif L1_39 == "boatman_03" then
      if _kaiwa_03_end == false then
        Fn_kaiwaDemoView("sm03_00730k")
        _kaiwa_03_end = true
        waitSeconds(1)
        Fn_turnNpc("boatman_03", "locator2_boatman_03_direction")
        Fn_playMotionNpc("boatman_03", "count_00", false)
      else
        Fn_playMotionNpc("boatman_03", "reply_no", false)
        Fn_captionView(GESTURE_CAPTION.REPLY_NO_01)
        Fn_turnNpc("boatman_03", "locator2_boatman_03_direction")
        Fn_playMotionNpc("boatman_03", "count_00", false)
      end
    else
      Fn_captionView(GESTURE_CAPTION.REPLY_NO_02)
    end
    Player:setLookAtIk(false, 1, L2_40)
    Fn_userCtrlOn()
  end
end
