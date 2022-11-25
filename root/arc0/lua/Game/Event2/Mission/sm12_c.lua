dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm12_common.lua")
WRITER_RAY_DIST_NEAR = 10
WRITER_RAY_DIST_FIND = 30
WRITER_RAY_DIST_FAR = 50
WRITER_RAY_DIST01 = 30
WRITER_RAY_DIST02 = 10
PAN_SPPED_DOOR = 1.3
PAN_SPPED01 = 5.3
PAN_SPPED02 = 2.5
CAM_END_TIME = 1
_puppet_tbl = {}
_npc_tbl = {}
_talk_ing = false
_esayari_task = {}
_esayari_flag = false
_atari_gull_num = 6
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_hazure_writer_flag = {}
_npc_miss_count = 0
_induction_flag = true
FIND_OFF = 0
FIND_ON = 1
FIND_LEAVE = 2
_HAZURE_TBL = {
  {
    name = "hazure_c_01",
    motion = {"stay_01", "lookaround"},
    turn = "locator2_hazure_c_turn_01",
    anim = "stay",
    partner = nil,
    type = "man"
  },
  {
    name = "hazure_c_02",
    motion = {"talk_01", "talk_02"},
    turn = "locator2_hazure_c_turn_02",
    anim = "talk",
    partner = "mob_c_03",
    type = "man"
  },
  {
    name = "hazure_c_03",
    motion = {
      "stay",
      "stay_01",
      "stay_01",
      "talk_00"
    },
    turn = "locator2_hazure_c_turn_03",
    anim = "talk",
    partner = nil,
    type = "man"
  },
  {
    name = "hazure_c_04",
    motion = {
      "man01_talk_laugh_00",
      "man01_talk_laugh_03"
    },
    turn = "locator2_mob_c_01",
    anim = "stay",
    partner = "mob_c_01",
    type = "man"
  },
  {
    name = "hazure_c_05",
    motion = {
      "sit_00",
      "man01_gaming_00",
      "man01_gaming_00"
    },
    turn = nil,
    anim = "sit",
    partner = nil,
    type = "man"
  },
  {
    name = "hazure_c_06",
    motion = {"talk_03", "stay_01"},
    turn = "locator2_mob_c_05",
    anim = "talk",
    partner = "mob_c_05",
    type = "man"
  },
  {
    name = "hazure_c_07",
    motion = {
      "feeding_pigeon_00",
      "feeding_pigeon_00"
    },
    turn = "locator2_hazure_c_turn_07",
    anim = "esa",
    partner = nil,
    type = "man"
  },
  {
    name = "mob_c_01",
    motion = {
      "wom01_talk_agree_00",
      "wom01_talk_laugh_00"
    },
    turn = "locator2_hazure_c_04",
    anim = "stay",
    partner = "hazure_c_04",
    type = "wom"
  },
  {
    name = "mob_c_02",
    motion = {"stay_02", "lookaround"},
    turn = "locator2_mob_c_turn_02",
    anim = "stay",
    type = "chi"
  },
  {
    name = "mob_c_03",
    motion = {"talk_01", "talk_01"},
    turn = "locator2_hazure_c_03",
    anim = "stay",
    partner = "hazure_c_02",
    type = "wom"
  },
  {
    name = "mob_c_04",
    motion = {
      "sit_floor_00",
      "sit_floor_00"
    },
    turn = nil,
    anim = "sit",
    partner = nil,
    type = "chi"
  },
  {
    name = "mob_c_05",
    motion = {"stay", "talk_01"},
    turn = "locator2_hazure_c_06",
    anim = "talk",
    partner = "hazure_c_06",
    type = "man"
  }
}
_HAZURE_POSE = {
  apo = "man01_appointment_00",
  sit_02 = "man01_sit_02",
  sit_03 = "man01_sit_03",
  sit_talk = "man01_sit_talk_00",
  sit_t01 = "man01_sit_talk_agree_00",
  sit_t02 = "man01_sit_talk_laugh_00",
  sit_t03 = "man01_sit_talk_love_00",
  gaming = "man01_gaming_00",
  stretch = "man01_stretch_00",
  love = "man01_talk_love_00",
  lag00 = "man01_talk_laugh_00",
  lag03 = "man01_talk_laugh_03"
}
_MOB_WOM_POSE = {
  talk_nomal = "wom01_talk_00",
  talk_agree = "wom01_talk_agree_00",
  talk_laugh = "wom01_talk_laugh_00",
  talk_love = "wom01_talk_love_00",
  sit_ship = "wom01_sit_ship_00",
  sit_ship02 = "wom01_sit_ship_01"
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "atari_c",
      type = "man48",
      node = "locator2_atari_c_01",
      color_variation = 3
    },
    {
      name = "gull_01",
      type = "brd01",
      node = "locator2_gull_c_01",
      use_gravity = false
    },
    {
      name = "gull_02",
      type = "brd01",
      node = "locator2_gull_c_02"
    },
    {
      name = "gull_03",
      type = "brd01",
      node = "locator2_gull_c_03"
    },
    {
      name = "gull_04",
      type = "brd01",
      node = "locator2_gull_c_04"
    },
    {
      name = "gull_05",
      type = "brd01",
      node = "locator2_gull_c_05"
    },
    {
      name = "gull_06",
      type = "brd01",
      node = "locator2_gull_c_06"
    },
    {
      name = "hazure_c_01",
      type = "man48",
      node = "locator2_hazure_c_01",
      color_variation = 0,
      hair_variation = 0,
      face_tex_name = "man48_face_d"
    },
    {
      name = "hazure_c_02",
      type = "man48",
      node = "locator2_hazure_c_02",
      color_variation = 3,
      hair_variation = 0,
      face_tex_name = "man48_face_c"
    },
    {
      name = "hazure_c_03",
      type = "man48",
      node = "locator2_hazure_c_03",
      color_variation = 1,
      hair_variation = 0,
      face_tex_name = "man48_face_a"
    },
    {
      name = "hazure_c_04",
      type = "man48",
      node = "locator2_hazure_c_04",
      color_variation = 4,
      hair_variation = 0,
      face_tex_name = "man48_face_b",
      use_gravity = false
    },
    {
      name = "hazure_c_05",
      type = "man48",
      node = "locator2_hazure_c_05",
      color_variation = 3,
      hair_variation = 1,
      face_tex_name = "man48_face_b",
      use_gravity = false
    },
    {
      name = "hazure_c_06",
      type = "man48",
      node = "locator2_hazure_c_06",
      color_variation = 2,
      hair_variation = 1,
      face_tex_name = "man48_face_a"
    },
    {
      name = "hazure_c_07",
      type = "man48",
      node = "locator2_hazure_c_07",
      color_variation = 3,
      hair_variation = 1,
      face_tex_name = "man48_face_d"
    },
    {
      name = "mob_c_01",
      type = "wom27",
      node = "locator2_mob_c_01",
      color_variation = 1,
      hair_variation = 0,
      use_gravity = false
    },
    {
      name = "mob_c_02",
      type = "chi16",
      node = "locator2_mob_c_02",
      color_variation = 3,
      hair_variation = 0
    },
    {
      name = "mob_c_03",
      type = "wom28",
      node = "locator2_mob_c_03",
      color_variation = 2,
      hair_variation = 1
    },
    {
      name = "mob_c_04",
      type = "chi15",
      node = "locator2_mob_c_04",
      color_variation = 2,
      hair_variation = 0
    },
    {
      name = "mob_c_05",
      type = "man49",
      node = "locator2_mob_c_05",
      color_variation = 0,
      hair_variation = 0
    },
    {
      name = "dog_01",
      type = "dog03",
      node = "locator2_dog_c_01"
    },
    {
      name = "brd_01",
      type = "brd01",
      node = "locator2_brd_c_01"
    },
    {
      name = "brd_02",
      type = "brd01",
      node = "locator2_brd_c_02"
    },
    {
      name = "brd_03",
      type = "brd01",
      node = "locator2_brd_c_03"
    },
    {
      name = "ve02_02",
      type = "ve02",
      node = "locator2_ve02_02",
      use_gravity = false,
      reset = false
    },
    {
      name = "writer",
      type = "man68",
      node = "locator2_writer_move_01",
      active = false,
      reset = false
    },
    {
      name = "ve02",
      type = "ve02",
      node = "locator2_ve02_01",
      use_gravity = false,
      reset = false
    },
    {
      name = "dummy",
      type = "man48",
      node = "locator2_dummy_01",
      active = false,
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm12_c_01")
  _sdemo_cut01:setCameraParam(nil, 0.1, nil)
  Fn_pcSensorOff("pccubesensor2_induction_01")
  Fn_pcSensorOff("pccubesensor2_gesture_area_03")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_03")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_03")
  Fn_loadNpcEventMotion("hazure_c_01", {
    apo = "man01_appointment_00"
  })
end
_pc_caption_tbl = {
  "sm12_00113",
  "sm12_00114",
  "sm12_00115",
  "sm12_00116",
  "sm12_00117",
  "sm12_00118"
}
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24
  L0_1 = Fn_setNpcActive
  L1_2 = "sm12_client"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = 0
  L1_2 = 3
  L2_3 = {}
  L6_7 = RandI
  L7_8 = 4
  L8_9 = 6
  L6_7 = L6_7(L7_8, L8_9)
  L4_5.text = L5_6
  L4_5.time = 2
  L3_4.reply_yes = L4_5
  L6_7 = RandI
  L7_8 = 4
  L8_9 = 6
  L6_7 = L6_7(L7_8, L8_9)
  L4_5.text = L5_6
  L4_5.time = 2
  L3_4.reply_no = L4_5
  L2_3.man48 = L3_4
  L6_7 = _pc_caption_tbl
  L7_8 = RandI
  L8_9 = 1
  L9_10 = 3
  L7_8 = L7_8(L8_9, L9_10)
  L6_7 = L6_7[L7_8]
  L5_6.text = L6_7
  L5_6.time = 2
  L4_5.reply_yes = L5_6
  L6_7 = _pc_caption_tbl
  L7_8 = RandI
  L8_9 = 1
  L9_10 = 3
  L7_8 = L7_8(L8_9, L9_10)
  L6_7 = L6_7[L7_8]
  L5_6.text = L6_7
  L5_6.time = 2
  L4_5.reply_no = L5_6
  L2_3.other = L3_4
  L6_7 = gestureBreakFunc
  L7_8 = gestureNpcActionCallback
  _gesture = L3_4
  L3_4(L4_5, L5_6)
  L6_7 = _puppet_tbl
  L6_7 = L6_7.atari_c
  L7_8 = _puppet_tbl
  L7_8 = L7_8.hazure_c_01
  L8_9 = _puppet_tbl
  L8_9 = L8_9.hazure_c_02
  L9_10 = _puppet_tbl
  L9_10 = L9_10.hazure_c_03
  L10_11 = _puppet_tbl
  L10_11 = L10_11.hazure_c_04
  L14_15 = _puppet_tbl
  L14_15 = L14_15.mob_c_01
  L15_16 = _puppet_tbl
  L15_16 = L15_16.mob_c_02
  L16_17 = _puppet_tbl
  L16_17 = L16_17.mob_c_03
  L17_18 = _puppet_tbl
  L17_18 = L17_18.mob_c_04
  L18_19 = _puppet_tbl
  L18_19 = L18_19.mob_c_05
  L3_4(L4_5, L5_6)
  L3_4(L4_5, L5_6)
  L6_7 = nil
  L7_8 = {}
  L7_8.pointing = false
  L7_8.classGroup = "yy_po_all_00"
  L7_8.positiveRate = 0
  L3_4(L4_5, L5_6, L6_7, L7_8)
  for L6_7, L7_8 in L3_4(L4_5) do
    L8_9 = L7_8.type
    if L8_9 == "man" then
      L8_9 = Fn_loadNpcEventMotion
      L9_10 = L7_8.name
      L10_11 = _HAZURE_POSE
      L8_9(L9_10, L10_11)
    else
      L8_9 = L7_8.type
      if L8_9 == "wom" then
        L8_9 = Fn_loadNpcEventMotion
        L9_10 = L7_8.name
        L10_11 = _MOB_WOM_POSE
        L8_9(L9_10, L10_11)
      end
    end
    L8_9 = L7_8.anim
    if L8_9 == "sit" then
      L8_9 = comPlayMotion
      L9_10 = L7_8.name
      L10_11 = L7_8.motion
      L8_9(L9_10, L10_11, L11_12)
    else
      L8_9 = comPlayMotion
      L9_10 = L7_8.name
      L10_11 = L7_8.motion
      L8_9(L9_10, L10_11, L11_12)
    end
  end
  L3_4()
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5, L5_6)
  L6_7 = false
  L3_4(L4_5, L5_6, L6_7)
  L6_7 = "loc_head"
  L3_4(L4_5, L5_6, L6_7)
  L6_7 = 0.09
  L7_8 = -0.27
  L8_9 = 0
  L23_24 = L5_6(L6_7, L7_8, L8_9)
  L3_4(L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L5_6(L6_7, L7_8, L8_9))
  L6_7 = "stay_00"
  L7_8 = {L8_9, L9_10}
  L8_9 = "stay_01"
  L9_10 = "stay_01"
  L8_9 = 5
  L9_10 = 10
  L3_4[1] = L4_5
  L6_7 = "stay_00"
  L7_8 = {L8_9, L9_10}
  L8_9 = "stay_01"
  L9_10 = "stay_01"
  L8_9 = 2
  L9_10 = 5
  L3_4[2] = L4_5
  L6_7 = "stay_01"
  L7_8 = {L8_9, L9_10}
  L8_9 = "stay_00"
  L9_10 = "stay_00"
  L8_9 = 2
  L9_10 = 5
  L3_4[3] = L4_5
  L6_7 = "stay_00"
  L7_8 = {L8_9, L9_10}
  L8_9 = "stay_01"
  L9_10 = "stay_01"
  L8_9 = 2
  L9_10 = 5
  L3_4[4] = L4_5
  L6_7 = "stay_01"
  L7_8 = {L8_9, L9_10}
  L8_9 = "stay_00"
  L9_10 = "stay_00"
  L8_9 = 2
  L9_10 = 5
  L3_4[5] = L4_5
  L6_7 = "stay_00"
  L7_8 = {L8_9, L9_10}
  L8_9 = "stay_01"
  L9_10 = "stay_01"
  L8_9 = 2
  L9_10 = 5
  L3_4[6] = L4_5
  L6_7 = "sit"
  L7_8 = {L8_9, L9_10}
  L8_9 = "sit"
  L9_10 = "sit1"
  L8_9 = 2
  L9_10 = 2
  L6_7 = Fn_playLoopMotionInsert
  L7_8 = "brd_01"
  L8_9 = "eat"
  L9_10 = {L10_11}
  L10_11 = "stay_00"
  L10_11 = 2
  L6_7 = L6_7(L7_8, L8_9, L9_10, L10_11, L11_12)
  L5_6[1] = L6_7
  L6_7 = Fn_playLoopMotionInsert
  L7_8 = "brd_02"
  L8_9 = "eat"
  L9_10 = {L10_11}
  L10_11 = "stay_00"
  L10_11 = 2
  L6_7 = L6_7(L7_8, L8_9, L9_10, L10_11, L11_12)
  L5_6[2] = L6_7
  L6_7 = Fn_playLoopMotionInsert
  L7_8 = "brd_03"
  L8_9 = "eat"
  L9_10 = {L10_11}
  L10_11 = "stay_00"
  L10_11 = 4
  L6_7 = L6_7(L7_8, L8_9, L9_10, L10_11, L11_12)
  L5_6[3] = L6_7
  L6_7 = Fn_resetPcPos
  L7_8 = "locator2_debug_01"
  L6_7(L7_8)
  L6_7 = Fn_missionStart
  L6_7()
  L6_7 = waitSeconds
  L7_8 = 1
  L6_7(L7_8)
  L6_7 = Fn_kaiwaDemoView
  L7_8 = "sm12_00900k"
  L6_7(L7_8)
  L6_7 = Mv_viewObj
  L7_8 = "locator2_first_target"
  L8_9 = 0.5
  L6_7(L7_8, L8_9)
  L6_7 = Fn_captionViewWait
  L7_8 = "sm12_02013"
  L6_7(L7_8)
  L6_7 = Fn_userCtrlOn
  L6_7()
  L6_7 = Fn_setCatWarpCheckPoint
  L7_8 = "locator2_pc_start_pos"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_catwarp_warning_03"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_catwarp_area_03"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_gesture_area_03"
  L6_7(L7_8)
  L6_7 = Fn_pcSensorOn
  L7_8 = "pccubesensor2_induction_01"
  L6_7(L7_8)
  L6_7 = Fn_missionView
  L7_8 = "sm12_00109"
  L6_7(L7_8)
  L6_7 = invokeRayCheckWriter
  L6_7 = L6_7()
  L7_8 = {}
  L8_9 = {}
  L8_9.in_game_preview = "k_photo_sm1203"
  L7_8.view = L8_9
  L8_9 = Fn_gamePreviewView
  L9_10 = L7_8
  L8_9(L9_10)
  L8_9 = waitSeconds
  L9_10 = 1
  L8_9(L9_10)
  L8_9 = start_game_obj
  L8_9()
  L8_9 = {
    L9_10,
    L10_11,
    L11_12
  }
  L9_10 = "sm12_02004"
  L10_11 = "sm12_02005"
  L9_10 = playAdviceTask
  L9_10()
  L9_10 = invokeAdviceTask
  L10_11 = L8_9
  L9_10 = L9_10(L10_11)
  L10_11 = invokeTask
  L10_11 = L10_11(L11_12)
  L11_12()
  L6_7 = L11_12
  L9_10 = L11_12
  L10_11 = L11_12
  L11_12(L12_13)
  L11_12()
  L14_15 = Camera
  L14_15 = L14_15.kControl_All
  L15_16 = false
  L11_12(L12_13, L13_14, L14_15, L15_16)
  for L14_15 = 2, _atari_gull_num do
    L15_16 = L3_4[L14_15]
    L16_17 = L15_16
    L15_16 = L15_16.abort
    L15_16(L16_17)
  end
  for L14_15 = 2, _atari_gull_num do
    L15_16 = invokeTask
    function L16_17()
      local L0_25
      L0_25 = {
        {
          pos = string.format("locator2_gull_c_%02d_fly_01", L14_15),
          attr = "takeoff"
        },
        {
          pos = string.format("locator2_gull_c_%02d_fly_02", L14_15),
          attr = "fly"
        }
      }
      Fn_fly(string.format("gull_%02d", L14_15), L0_25, {moveSpeed = 10})
    end
    L15_16(L16_17)
    break
  end
  for L14_15 = 2, _atari_gull_num do
    L15_16 = Sound
    L16_17 = L15_16
    L15_16 = L15_16.playSE
    L17_18 = "bird_flyaway"
    L15_16(L16_17, L17_18)
    L15_16 = waitSeconds
    L16_17 = 0.1
    L15_16(L16_17)
  end
  L11_12(L12_13)
  L11_12()
  L11_12(L12_13)
  L11_12(L12_13)
  L14_15 = "locator2_aim_kit_01"
  L11_12(L12_13, L13_14, L14_15)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  for L14_15 = 1, _atari_gull_num do
    L15_16 = Fn_disappearNpc
    L16_17 = string
    L16_17 = L16_17.format
    L17_18 = "gull_%02d"
    L18_19 = L14_15
    L23_24 = L16_17(L17_18, L18_19)
    L15_16(L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L16_17(L17_18, L18_19))
  end
  L11_12(L12_13, L13_14)
  L11_12(L12_13, L13_14)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13, L13_14)
  L11_12(L12_13)
  L11_12(L12_13)
  L14_15 = "locator2_look_point_02"
  L14_15 = L11_12
  L13_14(L14_15)
  L14_15 = 0.5
  L13_14(L14_15)
  L14_15 = L13_14
  L13_14(L14_15)
  L14_15 = {}
  L14_15.pos = "locator2_cam_01"
  L15_16 = PAN_SPPED_DOOR
  L14_15.time = L15_16
  L14_15 = {L15_16}
  L15_16 = {}
  L15_16.pos = "locator2_aim_door_01"
  L16_17 = PAN_SPPED_DOOR
  L15_16.time = L16_17
  L15_16 = _sdemo_cut01
  L16_17 = L15_16
  L15_16 = L15_16.play
  L17_18 = L13_14
  L18_19 = L14_15
  L15_16(L16_17, L17_18, L18_19)
  while true do
    L15_16 = _sdemo_cut01
    L16_17 = L15_16
    L15_16 = L15_16.isPlay
    L15_16 = L15_16(L16_17)
    if L15_16 then
      L15_16 = wait
      L15_16()
    end
  end
  L15_16 = waitSeconds
  L16_17 = 0.3
  L15_16(L16_17)
  L15_16 = _sdemo_cut01
  L16_17 = L15_16
  L15_16 = L15_16.play
  L15_16(L16_17)
  L15_16 = {L16_17}
  L16_17 = {}
  L16_17.pos = "locator2_cam_01"
  L17_18 = PAN_SPPED01
  L16_17.time = L17_18
  L16_17 = {L17_18}
  L17_18 = {}
  L17_18.pos = "locator2_aim_kit_01"
  L18_19 = PAN_SPPED01
  L17_18.time = L18_19
  L17_18 = Fn_moveNpc
  L18_19 = "writer"
  L19_20 = {
    L20_21,
    L21_22,
    L22_23
  }
  L20_21 = "locator2_writer_move_02"
  L21_22 = "locator2_writer_move_03"
  L22_23 = "locator2_writer_move_04"
  L20_21 = {}
  L20_21.runLength = 1000
  L20_21.recast = true
  L17_18 = L17_18(L18_19, L19_20, L20_21)
  L18_19 = _sdemo_cut01
  L19_20 = L18_19
  L18_19 = L18_19.play
  L20_21 = L15_16
  L21_22 = L16_17
  L18_19(L19_20, L20_21, L21_22)
  L18_19 = waitSeconds
  L19_20 = 1.5
  L18_19(L19_20)
  L18_19 = Fn_captionView
  L19_20 = "sm12_02010"
  L18_19(L19_20)
  L18_19 = Sound
  L19_20 = L18_19
  L18_19 = L18_19.pulse
  L20_21 = "kit049"
  L18_19(L19_20, L20_21)
  L18_19 = waitSeconds
  L19_20 = 2.5
  L18_19(L19_20)
  L18_19 = playerTurn
  L19_20 = L12_13
  L18_19(L19_20)
  L18_19 = waitSeconds
  L19_20 = 1
  L18_19(L19_20)
  L18_19 = Sound
  L19_20 = L18_19
  L18_19 = L18_19.playSE
  L20_21 = "m04_905c"
  L21_22 = 1
  L22_23 = ""
  L23_24 = Fn_findNpcPuppet
  L23_24 = L23_24("writer")
  L18_19(L19_20, L20_21, L21_22, L22_23, L23_24, L23_24("writer"))
  L18_19 = Fn_captionView
  L19_20 = "sm12_02011"
  L18_19(L19_20)
  L18_19 = {L19_20}
  L19_20 = {}
  L19_20.pos = "locator2_cam_01"
  L20_21 = PAN_SPPED02
  L19_20.time = L20_21
  L19_20 = {L20_21}
  L20_21 = {}
  L20_21.pos = "locator2_aim_writer_01"
  L21_22 = PAN_SPPED02
  L20_21.time = L21_22
  L20_21 = _sdemo_cut01
  L21_22 = L20_21
  L20_21 = L20_21.set
  L22_23 = "locator2_cam_01"
  L23_24 = "locator2_aim_escape_c_03"
  L20_21(L21_22, L22_23, L23_24)
  L20_21 = _sdemo_cut01
  L21_22 = L20_21
  L20_21 = L20_21.play
  L22_23 = L18_19
  L23_24 = L19_20
  L20_21(L21_22, L22_23, L23_24)
  L20_21 = Fn_setNpcActive
  L21_22 = "dummy"
  L22_23 = true
  L20_21(L21_22, L22_23)
  L20_21 = waitSeconds
  L21_22 = 2
  L20_21(L21_22)
  L20_21 = Sound
  L21_22 = L20_21
  L20_21 = L20_21.pulse
  L22_23 = "door_wood_close"
  L20_21(L21_22, L22_23)
  L20_21 = waitSeconds
  L21_22 = 1
  L20_21(L21_22)
  L20_21 = playerTurn
  L21_22 = L11_12
  L20_21(L21_22)
  L20_21 = waitSeconds
  L21_22 = 1
  L20_21(L21_22)
  L20_21 = {L21_22}
  L21_22 = {}
  L21_22.pos = "locator2_cam_01"
  L22_23 = PAN_SPPED_DOOR
  L21_22.time = L22_23
  L21_22 = {L22_23}
  L22_23 = {}
  L22_23.pos = "locator2_aim_door_01"
  L23_24 = PAN_SPPED_DOOR
  L22_23.time = L23_24
  L22_23 = _sdemo_cut01
  L23_24 = L22_23
  L22_23 = L22_23.play
  L22_23(L23_24, L20_21, L21_22)
  L22_23 = Fn_watchNpc
  L23_24 = "writer"
  L22_23(L23_24, false)
  L23_24 = L17_18
  L22_23 = L17_18.abort
  L22_23(L23_24)
  L22_23 = Fn_setNpcActive
  L23_24 = "ve02"
  L22_23(L23_24, false)
  L22_23 = waitSeconds
  L23_24 = 2
  L22_23(L23_24)
  L22_23 = Fn_kaiwaDemoView
  L23_24 = "sm12_01200k"
  L22_23(L23_24)
  L22_23 = Fn_warpNpc
  L23_24 = "writer"
  L22_23(L23_24, "locator2_writer_move_04")
  L22_23 = findGameObject2
  L23_24 = "Node"
  L22_23 = L22_23(L23_24, "locator2_aim_end_01")
  L22_23 = playerTurn
  L23_24 = L11_12
  L22_23(L23_24)
  L22_23 = {L23_24}
  L23_24 = {}
  L23_24.pos = "locator2_cam_end_01"
  L23_24.time = CAM_END_TIME
  L23_24 = {
    {
      pos = "locator2_aim_end_01",
      time = CAM_END_TIME
    }
  }
  _sdemo_cut01:play(L22_23, L23_24)
  while _sdemo_cut01:isPlay() do
    wait()
  end
  Camera:lookTo(L11_12:getWorldPos(), 0, 0)
  _sdemo_cut01:stop(0.5)
  waitSeconds(0.5)
  Fn_pcSensorOff("pccubesensor2_gesture_area_03")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_03")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_03")
  Fn_setKeepPlayerPos()
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
  local L0_26, L1_27
  _decide_flag = true
  L0_26 = _cancel_flag
  return L0_26
end
function gestureBreakFunc()
  local L0_28, L1_29
  L0_28 = _break_flag
  return L0_28
end
_npc_kaiwa_table = {
  atari_c = {
    cnt = 0,
    kaiwa = "",
    answer = true
  },
  hazure_c_01 = {cnt = 0, kaiwa = ""},
  hazure_c_02 = {cnt = 0, kaiwa = ""},
  hazure_c_03 = {cnt = 0, kaiwa = ""},
  hazure_c_04 = {cnt = 0, kaiwa = ""},
  hazure_c_05 = {cnt = 0, kaiwa = ""},
  hazure_c_06 = {cnt = 0, kaiwa = ""},
  hazure_c_07 = {cnt = 0, kaiwa = ""},
  mob_c_01 = {cnt = 0, kaiwa = ""},
  mob_c_02 = {cnt = 0, kaiwa = ""},
  mob_c_03 = {cnt = 0, kaiwa = ""},
  mob_c_04 = {cnt = 0, kaiwa = ""},
  mob_c_05 = {cnt = 0, kaiwa = ""}
}
function gestureNpcActionCallback(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38
  L1_31 = {
    L2_32,
    L3_33,
    L4_34
  }
  L2_32 = "sm12_02000"
  L3_33 = "sm12_02001"
  if A0_30 then
    L3_33 = A0_30
    L2_32 = A0_30.getName
    L2_32 = L2_32(L3_33)
    L3_33 = Fn_userCtrlOff
    L3_33()
    L3_33 = A0_30.getWorldPos
    L3_33 = L3_33(L4_34)
    L7_37 = 0
    L3_33 = L3_33 + L4_34
    L7_37 = 1
    L8_38 = L3_33
    L4_34(L5_35, L6_36, L7_37, L8_38)
    for L7_37, L8_38 in L4_34(L5_35) do
      if L2_32 == L8_38.name then
        invokeTask(function()
          _gesture:stop()
          _npc_kaiwa_table[L2_32].cnt = 1
          if L8_38.anim ~= "sit" then
            if L8_38.partner ~= nil then
              comStopMotion(L8_38.partner)
              Fn_playMotionNpc(L8_38.partner, "stay_01", false)
            end
            if L2_32 == "hazure_c_07" then
              deleteEsayari()
            else
              comStopMotion(L8_38.name)
            end
            Fn_turnNpc(L2_32)
            Fn_playMotionNpc(L2_32, "reply_no", false)
          end
          if string.sub(L2_32, 1, 3) == "haz" then
            Fn_captionView(L1_31[RandI(1, #L1_31)])
          end
          if L2_32 == "hazure_c_07" then
            Fn_playMotionNpc(L2_32, "stay", false)
            waitSeconds(0.5)
            Fn_playMotionNpc(L2_32, "stay", false)
            waitSeconds(0.3)
            Fn_turnNpc(L2_32, L8_38.turn)
            createEsayari()
          elseif L8_38.turn ~= nil then
            waitSeconds(1)
            Fn_turnNpc(L2_32, L8_38.turn)
            comPlayMotion(L8_38.name, L8_38.motion)
          elseif L8_38.anim == "sit" then
            waitSeconds(3)
          end
          if L8_38.partner ~= nil then
            for _FORV_3_, _FORV_4_ in pairs(_HAZURE_TBL) do
              if _FORV_4_.name == L8_38.partner then
                comPlayMotion(L8_38.partner, _FORV_4_.motion)
              end
            end
          end
          waitSeconds(2)
          _gesture:run()
          incNpcMissCount()
          print("\232\169\177\227\129\139\227\129\145\227\129\159\227\130\171\227\130\166\227\131\179\227\131\136" .. _npc_kaiwa_table[L2_32].cnt)
          if Fn_isCaptionView() == false then
            if string.sub(L2_32, 1, 3) == "haz" then
              Fn_captionView(_pc_caption_tbl[RandI(4, #_pc_caption_tbl)])
            else
              Fn_captionView(_pc_caption_tbl[RandI(1, 3)])
            end
          end
        end)
        break
      else
      end
    end
    L4_34(L5_35)
    L7_37 = 1
    L8_38 = L3_33
    L4_34(L5_35, L6_36, L7_37, L8_38)
    L4_34()
    if L4_34 == true then
      L4_34()
      L4_34(L5_35)
      L4_34(L5_35)
      L4_34()
    end
  else
  end
end
function pccubesensor2_gesture_area_03_OnEnter()
  killWarningNavi()
  if _gesture ~= nil then
    _gesture:run()
  end
end
function pccubesensor2_gesture_area_03_OnLeave()
  comGuideFunc("sm12_02012", findGameObject2("Node", "locator2_pc_start_pos"))
  if _gesture ~= nil then
    _gesture:stop()
  end
end
function pccubesensor2_catwarp_warning_03_OnEnter()
  killWarningNavi()
end
function pccubesensor2_catwarp_warning_03_OnLeave()
  local L0_39, L1_40
  L0_39 = comCatWarpWarning
  L1_40 = "sm12_01015"
  L0_39(L1_40, findGameObject2("Node", "locator2_pc_start_pos"))
end
function pccubesensor2_catwarp_area_03_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    killWarningNavi()
  end)
end
function pccubesensor2_induction_01_OnEnter()
  stopAdviceTask()
  _induction_flag = true
end
function pccubesensor2_induction_01_OnLeave()
  playAdviceTask()
  _induction_flag = false
end
function createEsayari()
  local L0_41
  L0_41 = Fn_findNpc
  L0_41 = L0_41("hazure_c_07")
  _esayari_flag = true
  Fn_playMotionNpc("hazure_c_07", "man01_stretch_00", false, {isStop = true, animBlendDuration = 0.25})
  waitSeconds(1.5)
  if _esayari_task[1] == nil then
    _esayari_task[1] = invokeTask(function()
      while _esayari_flag == true do
        if L0_41:isMotionEnd() then
          print("\227\130\168\227\130\181\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\231\181\130\227\130\143\227\129\163\227\129\159\227\130\137\227\129\151\227\129\132")
          if _esayari_flag ~= false then
            _esayari_task[2] = Fn_createEffect("esa", "ef_ev_par_01m", "locator2_hazure_c_07", false)
            print("\227\130\168\227\130\181\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179")
            Fn_playMotionNpc("hazure_c_07", "feeding_pigeon_00", false, {isStop = true, animBlendDuration = 0.25})
            print("\227\130\168\227\130\181\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136")
            print("\227\130\168\227\130\181\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136\231\181\130\228\186\134")
            wait()
          end
        end
      end
    end)
  end
end
function deleteEsayari()
  _esayari_flag = false
  if _esayari_task[2] ~= nil then
    Fn_finishedTremEffect(_esayari_task[2], 0)
    _esayari_task[2] = nil
  end
  Fn_killNpcTask("hazure_c_07")
  _esayari_task[1] = Mv_safeTaskAbort(_esayari_task[1])
end
function playerTurn(A0_42)
  invokeTask(function()
    Fn_playerTurn(A0_42)
    waitSeconds(1.2)
    Fn_playerTurnEnd()
  end)
end
function invokeRayCheckWriter()
  return invokeTask(function()
    local L0_43, L1_44, L2_45, L3_46, L4_47
    L0_43 = {
      L1_44,
      L2_45,
      L3_46,
      L4_47,
      _puppet_tbl.hazure_c_04,
      _puppet_tbl.hazure_c_05,
      _puppet_tbl.hazure_c_06,
      _puppet_tbl.hazure_c_07
    }
    L1_44 = _puppet_tbl
    L1_44 = L1_44.atari_c
    L2_45 = _puppet_tbl
    L2_45 = L2_45.hazure_c_01
    L3_46 = _puppet_tbl
    L3_46 = L3_46.hazure_c_02
    L4_47 = _puppet_tbl
    L4_47 = L4_47.hazure_c_03
    L1_44 = {
      L2_45,
      L3_46,
      L4_47,
      "hazure_c_03",
      "hazure_c_04",
      "hazure_c_05",
      "hazure_c_06",
      "hazure_c_07"
    }
    L2_45 = "atari_c"
    L3_46 = "hazure_c_01"
    L4_47 = "hazure_c_02"
    L2_45 = 0
    function L3_46(A0_48)
      if Fn_getDistanceToPlayer(A0_48) < WRITER_RAY_DIST_NEAR or Fn_getDistanceToPlayer(A0_48) > WRITER_RAY_DIST_FAR then
        return true
      end
      return false
    end
    L4_47 = nil
    while true do
      L2_45 = arrayRaycastCheckVerB(L0_43, WRITER_RAY_DIST_FIND)
      if L2_45 ~= 0 and _npc_kaiwa_table[L1_44[L2_45]].cnt == 0 and Fn_getDistanceToPlayer(_puppet_tbl[L1_44[L2_45]]) > WRITER_RAY_DIST_NEAR then
        print("\227\129\157\227\130\140\227\129\163\227\129\189\227\129\132\228\186\186\227\130\146\231\153\186\232\166\139" .. _npc_kaiwa_table[L1_44[L2_45]].cnt)
        Player:setStay(true)
        Player:setStay(false)
        Fn_captionView("sm12_02015")
        L4_47 = Mv_viewObj(L0_43[L2_45], 0.5)
        waitSeconds(1.5)
        L4_47 = Mv_safeTaskAbort(L4_47)
        comSetNavi(L0_43[L2_45])
        while L3_46(L0_43[L2_45]) == false do
          wait()
        end
        comKillNavi()
        while Fn_getDistanceToPlayer(L0_43[L2_45]) < WRITER_RAY_DIST_FAR do
          wait()
        end
      end
      wait()
    end
  end)
end
