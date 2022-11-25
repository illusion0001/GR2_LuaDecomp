dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm12_common.lua")
GUIDE_DIST = 80
EVENT_WAIT_NAVI = 1.3
EVENT_WAIT_CAP = 2.5
WAIT_NPC_NUM = 3
MOB_NPC_MAX = 4
HAZURE_NPC_MAX = 5
KAIWA_NPC_MAX = 9
SDEMO_NPC_MAX = 3
ONLY_DEMO_NPC_MAX = 8
SDEMO_POSE = {
  req = "man01_reaction_goo_00",
  que = "man01_question_00",
  line = "man01_stay_line_00"
}
_puppet_tbl = {}
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_searching = false
_EVENT_WRITER_TBL = {
  betimid = "man01_betimid_sm12_00",
  point_in_01 = "man01_inform_in_00",
  point_01 = "man01_inform_00",
  point_out_01 = "man01_inform_out_00",
  point_in_02 = "man01_inform_ex_in_00",
  point_02 = "man01_inform_ex_00",
  point_out_02 = "man01_inform_ex_out_00"
}
_EVENT_NPC_POSE = {
  hit_01 = "man01_hit_b_r_00",
  hit_02 = "man01_hit_f_00",
  idle = "man01_idle_lo_01",
  laugh03 = "man01_talk_laugh_00",
  laugh03 = "man01_talk_laugh_03"
}
_HAZURE_TBL = {
  {
    name = "hazure_a_01",
    motion = {"stay_01", "stay_01"},
    turn = "locator2_hazure_turn_01"
  },
  {
    name = "hazure_a_02",
    motion = {"talk_00", "talk_01"},
    turn = "locator2_hazure_turn_02"
  },
  {
    name = "hazure_a_03",
    motion = {
      "talk_00",
      "talk_01",
      "man01_talk_laugh_03"
    },
    turn = "locator2_hazure_turn_03"
  },
  {
    name = "hazure_a_04",
    motion = {"talk_03", "talk_03"},
    turn = "locator2_hazure_turn_04"
  },
  {
    name = "hazure_a_05",
    motion = {
      "man01_idle_lo_01",
      "sit_floor_01"
    },
    turn = "locator2_hazure_turn_05"
  },
  {
    name = "mob_a_01",
    motion = {"talk_03", "talk_03"},
    turn = "locator2_mob_turn_01"
  },
  {
    name = "mob_a_02",
    motion = {"stay_01", "talk_03"},
    turn = "locator2_mob_turn_02"
  },
  {
    name = "mob_a_03",
    motion = {"stay_01", "talk_03"},
    turn = "locator2_mob_turn_03"
  },
  {
    name = "mob_a_04",
    motion = {"talk_01", "talk_01"},
    turn = "locator2_mob_turn_04"
  }
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_ajito_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_ajito_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_ajito_03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_gesture_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_01")
  L0_0 = {
    {
      name = "ship_01",
      type = "ve01",
      node = "locator2_ship_01",
      use_gravity = false
    },
    {
      name = "atari_a",
      type = "man44",
      attach = false,
      node = "locator2_atari_01"
    },
    {
      name = "sdemo_stand_01",
      type = "thug08",
      attach = false,
      node = "locator2_sdemo_a_stand_01",
      active = false
    },
    {
      name = "sdemo_stand_02",
      type = "thug06",
      attach = false,
      node = "locator2_sdemo_a_stand_02",
      active = false
    },
    {
      name = "sdemo_stand_03",
      type = "thug07",
      attach = false,
      node = "locator2_sdemo_a_stand_03",
      active = false
    },
    {
      name = "hazure_a_01",
      type = "man44",
      attach = false,
      node = "locator2_hazure_01",
      hair_variation = 1
    },
    {
      name = "hazure_a_02",
      type = "man44",
      attach = false,
      node = "locator2_hazure_02",
      color_variation = 1
    },
    {
      name = "hazure_a_03",
      type = "man44",
      attach = false,
      node = "locator2_hazure_03",
      hair_variation = 1,
      color_variation = 1
    },
    {
      name = "hazure_a_04",
      type = "man44",
      attach = false,
      node = "locator2_hazure_04",
      color_variation = 2
    },
    {
      name = "hazure_a_05",
      type = "man44",
      attach = false,
      node = "locator2_hazure_05",
      hair_variation = 0,
      color_variation = 3
    },
    {
      name = "mob_a_01",
      type = "man43",
      attach = false,
      node = "locator2_mob_01"
    },
    {
      name = "mob_a_02",
      type = "man43",
      attach = false,
      node = "locator2_mob_02",
      color_variation = 1
    },
    {
      name = "mob_a_03",
      type = "man42",
      attach = false,
      node = "locator2_mob_03"
    },
    {
      name = "mob_a_04",
      type = "man43",
      attach = false,
      node = "locator2_mob_04",
      color_variation = 2
    },
    {
      name = "demo_01",
      type = "thug07",
      attach = false,
      node = "locator2_demo01_01",
      active = false
    },
    {
      name = "demo_02",
      type = "man44",
      attach = false,
      node = "locator2_demo02_01",
      active = false
    },
    {
      name = "demo_03",
      type = "man43",
      attach = false,
      node = "locator2_demo03_01",
      active = false,
      color_variation = 1,
      hair_variation = 1
    },
    {
      name = "demo_04",
      type = "man44",
      attach = false,
      node = "locator2_demo04_01",
      active = false,
      color_variation = 1
    },
    {
      name = "demo_05",
      type = "man44",
      attach = false,
      node = "locator2_demo05_01",
      active = false,
      color_variation = 2
    },
    {
      name = "demo_06",
      type = "thug06",
      attach = false,
      node = "locator2_demo06_01",
      active = false
    },
    {
      name = "demo_07",
      type = "man43",
      attach = false,
      node = "locator2_demo07_01",
      active = false,
      color_variation = 2,
      hair_variation = 1
    },
    {
      name = "demo_08",
      type = "thug06",
      attach = false,
      node = "locator2_demo08_01",
      active = false,
      color_variation = 2,
      hair_variation = 1
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadNpcEventMotion("atari_a", _EVENT_WRITER_TBL)
  Fn_loadNpcEventMotion("demo_02", _EVENT_NPC_POSE)
  _sdemo_cut01 = SDemo.create("sm12_a_02")
  _sdemo_cut01:setCameraParam(nil, 0.1, nil)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = {
    L1_2,
    L2_3,
    L3_4,
    L4_5,
    L5_6,
    L6_7
  }
  L1_2 = "sm12_00113"
  L2_3 = "sm12_00114"
  L3_4 = "sm12_00115"
  L4_5 = "sm12_00116"
  L5_6 = "sm12_00117"
  L6_7 = "sm12_00118"
  pc_caption_tbl = L0_1
  L0_1 = {}
  L1_2 = {}
  L2_3 = {}
  L3_4 = pc_caption_tbl
  L4_5 = RandI
  L5_6 = 4
  L6_7 = 6
  L4_5 = L4_5(L5_6, L6_7)
  L3_4 = L3_4[L4_5]
  L2_3.text = L3_4
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L3_4 = pc_caption_tbl
  L4_5 = RandI
  L5_6 = 4
  L6_7 = 6
  L4_5 = L4_5(L5_6, L6_7)
  L3_4 = L3_4[L4_5]
  L2_3.text = L3_4
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.thief = L1_2
  L1_2 = {L2_3}
  L2_3 = {}
  L3_4 = {}
  L4_5 = pc_caption_tbl
  L5_6 = RandI
  L6_7 = 1
  L7_8 = 3
  L5_6 = L5_6(L6_7, L7_8)
  L4_5 = L4_5[L5_6]
  L3_4.text = L4_5
  L3_4.time = 2
  L2_3.reply_yes = L3_4
  L3_4 = {}
  L4_5 = pc_caption_tbl
  L5_6 = RandI
  L6_7 = 1
  L7_8 = 3
  L5_6 = L5_6(L6_7, L7_8)
  L4_5 = L4_5[L5_6]
  L3_4.text = L4_5
  L3_4.time = 2
  L2_3.reply_no = L3_4
  L0_1.other = L1_2
  L1_2 = GestureEvent
  L1_2 = L1_2.create
  L2_3 = "ui_event_guide_02"
  L3_4 = gestureCancelFunc
  L4_5 = gestureBreakFunc
  L5_6 = gestureNpcActionCallback
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6)
  _gesture = L1_2
  L1_2 = _gesture
  L2_3 = L1_2
  L1_2 = L1_2.setAsking
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = _gesture
  L2_3 = L1_2
  L1_2 = L1_2.setNpc
  L3_4 = {
    L4_5,
    L5_6,
    L6_7,
    L7_8,
    L8_9,
    L9_10,
    L10_11,
    L11_12,
    L12_13,
    L13_14
  }
  L4_5 = _puppet_tbl
  L4_5 = L4_5.atari_a
  L5_6 = _puppet_tbl
  L5_6 = L5_6.hazure_a_01
  L6_7 = _puppet_tbl
  L6_7 = L6_7.hazure_a_02
  L7_8 = _puppet_tbl
  L7_8 = L7_8.hazure_a_03
  L8_9 = _puppet_tbl
  L8_9 = L8_9.hazure_a_04
  L9_10 = _puppet_tbl
  L9_10 = L9_10.hazure_a_05
  L1_2(L2_3, L3_4)
  L1_2 = _gesture
  L2_3 = L1_2
  L1_2 = L1_2.setMobText
  L3_4 = L0_1
  L1_2(L2_3, L3_4)
  L1_2 = _gesture
  L2_3 = L1_2
  L1_2 = L1_2.setNaviTarget
  L3_4, L4_5 = nil, nil
  L5_6 = {}
  L5_6.pointing = false
  L5_6.classGroup = "yy_lo_all_00"
  L5_6.positiveRate = 0
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_catwarp_warning_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_catwarp_area_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_guide_area_01"
  L1_2(L2_3)
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = Fn_setCatWarpCheckPoint
  L2_3 = "locator2_pc_start_pos"
  L1_2(L2_3)
  L1_2 = Fn_turnNpc
  L2_3 = "sm12_client"
  L1_2(L2_3)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm12_00100k"
  L1_2(L2_3)
  L1_2 = Fn_captionView
  L2_3 = "sm12_00100"
  L3_4 = 0
  L1_2(L2_3, L3_4)
  L1_2 = {
    L2_3,
    L3_4,
    L4_5,
    L5_6
  }
  L2_3 = "locator2_client_bye_01"
  L3_4 = "locator2_client_bye_02"
  L4_5 = "locator2_client_bye_03"
  L5_6 = "locator2_client_bye_04"
  L2_3 = Fn_moveNpc
  L3_4 = "sm12_client"
  L4_5 = L1_2
  L5_6 = {}
  L5_6.avoidance = true
  L5_6.runLength = -1
  L2_3 = L2_3(L3_4, L4_5, L5_6)
  L3_4 = createGameObject2
  L4_5 = "Node"
  L3_4 = L3_4(L4_5)
  L5_6 = L3_4
  L4_5 = L3_4.try_init
  L4_5(L5_6)
  L5_6 = L3_4
  L4_5 = L3_4.waitForReady
  L4_5(L5_6)
  L5_6 = L3_4
  L4_5 = L3_4.try_start
  L4_5(L5_6)
  L4_5 = Fn_appendToPlayer
  L5_6 = L3_4
  L4_5(L5_6)
  L5_6 = L3_4
  L4_5 = L3_4.setPos
  L6_7 = Vector
  L7_8 = 3
  L8_9 = 1.5
  L9_10 = -4
  L18_19 = L6_7(L7_8, L8_9, L9_10)
  L4_5(L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L6_7(L7_8, L8_9, L9_10))
  L4_5 = Mv_viewObj
  L5_6 = L3_4
  L6_7 = 0.1
  L4_5 = L4_5(L5_6, L6_7)
  L5_6 = waitSeconds
  L6_7 = 3
  L5_6(L6_7)
  L5_6 = Mv_safeTaskAbort
  L6_7 = L4_5
  L5_6 = L5_6(L6_7)
  L4_5 = L5_6
  L5_6 = Fn_captionViewEnd
  L5_6()
  L5_6 = Fn_kaiwaDemoView
  L6_7 = "sm12_00200k"
  L5_6(L6_7)
  L5_6 = invokeTask
  function L6_7()
    local L0_20, L1_21, L2_22, L3_23
    while true do
      if L0_20 then
        L0_20()
      end
    end
    L2_3 = L0_20
    L0_20(L1_21)
    L0_20(L1_21, L2_22)
    L0_20(L1_21, L2_22)
    for L3_23, _FORV_4_ in L0_20(L1_21) do
      Fn_loadNpcEventMotion(_FORV_4_.name, _EVENT_NPC_POSE)
      waitSeconds(0.1)
      comPlayMotion(_FORV_4_.name, _FORV_4_.motion)
    end
    L3_23 = false
    L0_20(L1_21, L2_22, L3_23)
    for L3_23 = 1, HAZURE_NPC_MAX do
      Fn_loadNpcEventMotion("hazure_a_0" .. L3_23, SDEMO_POSE)
    end
    for L3_23 = 1, MOB_NPC_MAX do
      Fn_loadNpcEventMotion("mob_a_0" .. L3_23, SDEMO_POSE)
    end
    for L3_23 = 1, SDEMO_NPC_MAX do
      Fn_loadNpcEventMotion("sdemo_stand_" .. string.format("%02d", L3_23), SDEMO_POSE)
    end
  end
  L5_6(L6_7)
  L5_6 = Player
  L6_7 = L5_6
  L5_6 = L5_6.setLookAtIk
  L7_8 = true
  L8_9 = 1
  L9_10 = findGameObject2
  L9_10 = L9_10(L10_11, L11_12)
  L9_10 = L9_10.getWorldPos
  L18_19 = L9_10(L10_11)
  L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L9_10(L10_11))
  L5_6 = Mv_viewObj
  L6_7 = "locator2_navi_ajito_01"
  L7_8 = 0.1
  L5_6 = L5_6(L6_7, L7_8)
  L6_7 = waitSeconds
  L7_8 = 1
  L6_7(L7_8)
  L6_7 = Mv_safeTaskAbort
  L7_8 = L5_6
  L6_7 = L6_7(L7_8)
  L5_6 = L6_7
  L6_7 = Player
  L7_8 = L6_7
  L6_7 = L6_7.setLookAtIk
  L8_9 = false
  L9_10 = 1
  L18_19 = L10_11(L11_12, L12_13, L13_14)
  L6_7(L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L10_11(L11_12, L12_13, L13_14))
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_ajito_01"
  L6_7(L7_8)
  L6_7 = Fn_userCtrlOn
  L6_7()
  L6_7 = Camera
  L7_8 = L6_7
  L6_7 = L6_7.setControl
  L8_9 = Camera
  L8_9 = L8_9.kPlayer
  L9_10 = Camera
  L9_10 = L9_10.kControl_All
  L6_7(L7_8, L8_9, L9_10, L10_11)
  L6_7 = Fn_missionView
  L7_8 = "sm12_00101"
  L6_7(L7_8)
  L6_7 = waitSeconds
  L7_8 = EVENT_WAIT_NAVI
  L6_7(L7_8)
  L6_7 = comSetNavi
  L7_8 = findGameObject2
  L8_9 = "Node"
  L9_10 = "locator2_navi_ajito_01"
  L18_19 = L7_8(L8_9, L9_10)
  L6_7(L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L7_8(L8_9, L9_10))
  L6_7 = Mv_waitPhase
  L6_7()
  L6_7 = comKillNavi
  L6_7()
  L6_7 = comSetNavi
  L7_8 = findGameObject2
  L8_9 = "Node"
  L9_10 = "locator2_ajito_view"
  L18_19 = L7_8(L8_9, L9_10)
  L6_7(L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L7_8(L8_9, L9_10))
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_ajito_02"
  L6_7(L7_8)
  L6_7 = Fn_missionViewEnd
  L6_7()
  L6_7 = Fn_missionInfoEnd
  L6_7()
  L6_7 = waitSeconds
  L7_8 = EVENT_WAIT_CAP
  L6_7(L7_8)
  L6_7 = Fn_captionView
  L7_8 = "sm12_00119"
  L6_7(L7_8)
  L6_7 = Mv_waitPhase
  L6_7()
  L6_7 = comKillNavi
  L6_7()
  L6_7 = Fn_pcSensorOff
  L7_8 = "pccubesensor2_guide_area_01"
  L6_7(L7_8)
  L6_7 = Player
  L7_8 = L6_7
  L6_7 = L6_7.setStay
  L8_9 = true
  L6_7(L7_8, L8_9)
  L6_7 = Mv_viewObj
  L7_8 = "locator2_ajito_view"
  L8_9 = 0.2
  L6_7 = L6_7(L7_8, L8_9)
  L7_8 = waitSeconds
  L8_9 = 1
  L7_8(L8_9)
  L7_8 = Mv_safeTaskAbort
  L8_9 = L6_7
  L7_8 = L7_8(L8_9)
  L6_7 = L7_8
  L7_8 = Player
  L8_9 = L7_8
  L7_8 = L7_8.setStay
  L9_10 = false
  L7_8(L8_9, L9_10)
  L7_8 = Fn_setCatWarpCheckPoint
  L8_9 = "locator2_catwarp_ajito_pc_01"
  L7_8(L8_9)
  L7_8 = Fn_kaiwaDemoView
  L8_9 = "sm12_00300k"
  L7_8(L8_9)
  L7_8 = Fn_pcSensorOn
  L8_9 = "pccubesensor2_gesture_area_01"
  L7_8(L8_9)
  L7_8 = Fn_pcSensorOn
  L8_9 = "pccubesensor2_ajito_03"
  L7_8(L8_9)
  L7_8 = Fn_missionView
  L8_9 = "sm12_00109"
  L7_8(L8_9)
  L7_8 = waitSeconds
  L8_9 = 1
  L7_8(L8_9)
  L7_8 = {}
  L8_9 = {}
  L8_9.in_game_preview = "k_photo_sm1201"
  L7_8.view = L8_9
  L8_9 = Fn_gamePreviewView
  L9_10 = L7_8
  L8_9(L9_10)
  L8_9 = start_game_obj
  L8_9()
  _searching = true
  L8_9 = {
    L9_10,
    L10_11,
    L11_12
  }
  L9_10 = "sm12_00106"
  L9_10 = playAdviceTask
  L9_10()
  L9_10 = invokeAdviceTask
  L9_10 = L9_10(L10_11)
  L10_11()
  L9_10 = L10_11
  L10_11()
  L18_19 = L14_15(L15_16)
  L10_11(L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L14_15(L15_16))
  L6_7 = L10_11
  L10_11(L11_12)
  L10_11(L11_12)
  for L13_14, L14_15 in L10_11(L11_12) do
    L16_17 = L14_15.name
    L15_16(L16_17)
  end
  L10_11.forceTarget = true
  L11_12(L12_13, L13_14)
  for L14_15 = 1, HAZURE_NPC_MAX do
    L16_17 = "hazure_a_0"
    L17_18 = L14_15
    L16_17 = L16_17 .. L17_18
    L17_18 = false
    L15_16(L16_17, L17_18)
  end
  for L14_15 = 1, SDEMO_NPC_MAX do
    L16_17 = "sdemo_stand_"
    L17_18 = string
    L17_18 = L17_18.format
    L18_19 = "%02d"
    L17_18 = L17_18(L18_19, L14_15)
    L16_17 = L16_17 .. L17_18
    L17_18 = false
    L15_16(L16_17, L17_18)
  end
  for L14_15 = 1, ONLY_DEMO_NPC_MAX do
    L16_17 = "demo_"
    L17_18 = string
    L17_18 = L17_18.format
    L18_19 = "%02d"
    L17_18 = L17_18(L18_19, L14_15)
    L16_17 = L16_17 .. L17_18
    L17_18 = true
    L15_16(L16_17, L17_18)
    L16_17 = "demo_"
    L17_18 = string
    L17_18 = L17_18.format
    L18_19 = "%02d"
    L17_18 = L17_18(L18_19, L14_15)
    L16_17 = L16_17 .. L17_18
    L17_18 = false
    L15_16(L16_17, L17_18)
  end
  L11_12(L12_13, L13_14, L14_15)
  L11_12(L12_13, L13_14, L14_15)
  L11_12(L12_13)
  L6_7 = L11_12
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14)
  for L16_17 = 3, ONLY_DEMO_NPC_MAX do
    L17_18 = Fn_moveNpc
    L18_19 = "demo_"
    L18_19 = L18_19 .. string.format("%02d", L16_17)
    L17_18 = L17_18(L18_19, {
      "locator2_demo" .. string.format("%02d", L16_17) .. "_move_01"
    }, {arrivedLength = 0})
    L12_13[L16_17] = L17_18
  end
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14()
  L16_17 = false
  L13_14(L14_15, L15_16, L16_17)
  L13_14(L14_15)
  L13_14(L14_15)
  L14_15.pos = "locator2_cam_escape_a_01_test"
  L14_15.time = 2.5
  L15_16.pos = "locator2_aim_escape_a_02_a"
  L15_16.time = 1.25
  L16_17 = {}
  L16_17.pos = "locator2_aim_escape_a_02"
  L16_17.time = 1.25
  L16_17 = L15_16
  L17_18 = L13_14
  L18_19 = L14_15
  L15_16(L16_17, L17_18, L18_19)
  L16_17 = "demo_02"
  L17_18 = {L18_19}
  L18_19 = "locator2_demo02_move_01"
  L12_13[2] = L15_16
  function L16_17()
    while Mv_isSafeTaskRunning(L12_13[2]) do
      wait()
    end
    L12_13[2] = Mv_safeTaskAbort(L12_13[2])
    wait()
    Fn_playMotionNpc("demo_02", "stay_01", false)
  end
  L15_16(L16_17)
  L16_17 = 0.3
  L15_16(L16_17)
  L16_17 = "sm12_00111"
  L15_16(L16_17)
  while true do
    L16_17 = L15_16
    if L15_16 then
      L15_16()
    end
  end
  L16_17 = "demo_08"
  L17_18 = "locator2_demo08_02"
  L15_16(L16_17, L17_18)
  L16_17 = "demo_08"
  L17_18 = "fighting"
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L16_17 = 0.4
  L15_16(L16_17)
  L16_17 = L15_16
  L17_18 = "m12_914a"
  L18_19 = 1
  L15_16(L16_17, L17_18, L18_19, "")
  L16_17 = {L17_18}
  L17_18 = {}
  L17_18.pos = "locator2_cam_escape_a_02"
  L17_18.time = L15_16
  L17_18 = {L18_19}
  L18_19 = {}
  L18_19.pos = "locator2_aim_escape_a_03"
  L18_19.time = L15_16
  L18_19 = _sdemo_cut01
  L18_19 = L18_19.play
  L18_19(L18_19, L16_17, L17_18)
  L18_19 = nil
  invokeTask(function()
    local L0_24
    L0_24 = waitSeconds
    L0_24(0.2)
    L0_24 = {
      "locator2_writer_escape_01",
      "locator2_writer_escape_02",
      "locator2_writer_escape_03"
    }
    L18_19 = Fn_moveNpc("atari_a", L0_24, {runLength = -1, arrivedLength = 0})
  end)
  invokeTask(function()
    while not (Fn_get_distance(_puppet_tbl.atari_a:getWorldPos(), _puppet_tbl.demo_02:getWorldPos()) < 1.2) do
      wait()
    end
    invokeTask(function()
      waitSeconds(0.2)
      Fn_playMotionNpc("demo_04", "surprise_01", false)
      print("\227\129\138\227\129\169\227\130\141\227\129\132\227\129\159")
    end)
    Sound:playSE("m11_932a", 1, "")
    print("\227\129\182\227\129\164\227\129\139\227\129\163\227\129\159\239\188\129\239\188\129\239\188\129")
    Fn_playMotionNpc("demo_02", "man01_hit_b_r_00", false)
    waitSeconds(1.5)
    Fn_turnNpc("demo_02", _puppet_tbl.atari_a)
  end)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  Fn_resetCoercionPose()
  Fn_captionView("sm12_00120")
  Sound:playSE("kit020a", 1, "")
  invokeTask(function()
    waitSeconds(1.5)
    Fn_turnNpc("demo_03", _puppet_tbl.atari_a)
  end)
  waitSeconds(3.5)
  Fn_kaiwaDemoView("sm12_00500k")
  Fn_blackout()
  _sdemo_cut01:stop()
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_01")
  Fn_pcSensorOff("pccubesensor2_gesture_area_01")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    _gesture:stop()
  end
  clearNpcMissCount()
end
function gestureCancelFunc()
  local L0_25, L1_26
  _decide_flag = true
  L0_25 = _cancel_flag
  return L0_25
end
function gestureBreakFunc()
  local L0_27, L1_28
  L0_27 = _break_flag
  return L0_27
end
_npc_kaiwa_table = {
  atari_a = {
    cnt = 0,
    kaiwa = "",
    answer = true
  },
  hazure_a_01 = {cnt = 0, kaiwa = ""},
  hazure_a_02 = {cnt = 0, kaiwa = ""},
  hazure_a_03 = {cnt = 0, kaiwa = ""},
  hazure_a_04 = {cnt = 0, kaiwa = ""},
  hazure_a_05 = {cnt = 0, kaiwa = ""},
  mob_a_01 = {cnt = 0, kaiwa = ""},
  mob_a_02 = {cnt = 0, kaiwa = ""},
  mob_a_03 = {cnt = 0, kaiwa = ""},
  mob_a_04 = {cnt = 0, kaiwa = ""}
}
function gestureNpcActionCallback(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38
  L1_30 = {
    L2_31,
    L3_32,
    L4_33
  }
  L2_31 = "sm12_00102"
  L3_32 = "sm12_00103"
  L4_33 = "sm12_00104"
  L2_31 = {L3_32}
  L3_32 = "sm12_00105"
  if A0_29 then
    L4_33 = A0_29
    L3_32 = A0_29.getName
    L3_32 = L3_32(L4_33)
    L4_33 = Fn_userCtrlOff
    L4_33()
    L4_33 = A0_29.getWorldPos
    L4_33 = L4_33(L5_34)
    L8_37 = 0
    L4_33 = L4_33 + L5_34
    L8_37 = 1
    L9_38 = L4_33
    L5_34(L6_35, L7_36, L8_37, L9_38)
    for L8_37, L9_38 in L5_34(L6_35) do
      if L3_32 == L9_38.name then
        _gesture:stop()
        invokeTask(function()
          if L3_32 == "hazure_a_05" then
            comStopMotion("hazure_a_05")
            Fn_playMotionNpc("hazure_a_05", "sit_floor_01", false)
          else
            comStopMotion(L9_38.name)
            if L3_32 == "hazure_a_03" then
              Fn_playMotionNpc("mob_a_01", "stay_01", false)
              Fn_playMotionNpc("mob_a_02", "talk_sad_00", false)
            elseif L3_32 == "hazure_a_02" then
              Fn_playMotionNpc("mob_a_03", "stay_01", false)
            elseif L3_32 == "mob_a_03" then
              Fn_playMotionNpc("hazure_a_02", "stay_01", false)
            end
            Fn_turnNpc(L3_32)
          end
          if L3_32 ~= "atari_a" then
            if L3_32 ~= "hazure_a_05" then
              Fn_playMotionNpc(L3_32, "reply_no", false)
            end
            Fn_captionViewWait(L1_30[RandI(1, #L1_30)])
            waitSeconds(2)
            _gesture:run()
            _npc_kaiwa_table[L3_32].cnt = 1
            incNpcMissCount()
            if Fn_isCaptionView() == false then
              if string.sub(L3_32, 1, 3) == "haz" then
                Fn_captionView(pc_caption_tbl[RandI(4, #pc_caption_tbl)])
              else
                Fn_captionView(pc_caption_tbl[RandI(1, 3)])
              end
            end
          end
          if L3_32 ~= "hazure_a_05" then
            waitSeconds(1)
            Fn_turnNpc(L3_32, L9_38.turn)
            comPlayMotion(L9_38.name, L9_38.motion)
          end
        end)
        break
      else
      end
    end
    L5_34(L6_35)
    L8_37 = 1
    L9_38 = L4_33
    L5_34(L6_35, L7_36, L8_37, L9_38)
    L5_34()
    if L5_34 == true then
      L5_34(L6_35)
      L5_34(L6_35)
      L5_34()
    end
  else
  end
end
function pccubesensor2_guide_area_01_OnEnter()
  local L0_39, L1_40
end
function pccubesensor2_guide_area_01_OnLeave()
  Fn_captionView("sm12_00121")
end
function pccubesensor2_catwarp_warning_01_OnEnter()
  killWarningNavi()
end
function pccubesensor2_ajito_01_OnEnter(A0_41)
  Mv_gotoNextPhase()
  Fn_pcSensorOff(A0_41)
end
function pccubesensor2_ajito_02_OnEnter(A0_42)
  Mv_gotoNextPhase()
  Fn_pcSensorOff(A0_42)
end
function pccubesensor2_catwarp_warning_01_OnLeave()
  local L0_43, L1_44
  L0_43 = comCatWarpWarning
  L1_44 = "sm12_00122"
  L0_43(L1_44, findGameObject2("Node", "locator2_catwarp_warning_navi_01"))
end
function pccubesensor2_catwarp_area_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    killWarningNavi()
  end)
end
function pccubesensor2_ajito_03_OnEnter()
  comKillNavi()
end
function pccubesensor2_gesture_area_01_OnEnter()
  if _gesture ~= nil then
    _gesture:run()
  end
  killWarningNavi()
end
function pccubesensor2_gesture_area_01_OnLeave()
  if _gesture ~= nil then
    _gesture:stop()
  end
  comGuideFunc("sm12_00123", findGameObject2("Node", "locator2_catwarp_ajito_pc_01"))
end
