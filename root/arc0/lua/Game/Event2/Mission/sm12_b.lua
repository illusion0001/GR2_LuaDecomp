dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm12_common.lua")
PDEMO_WAIT01 = 2.4
PDEMO_WAIT02 = 3.2
PDEMO_WAIT03 = 3.2
PDEMO_WAIT04 = 3.2
PDEMO_WAIT05 = 3
BOX01_MAX = 16
BOX02_MAX = 12
HAZURE_MOVE_NUM01 = 6
HAZURE_MOVE_NUM02 = 7
HAZURE_MOVE_NUM03 = 7
HAZURE_MOVE_NUM04 = 7
_puppet_tbl = {}
_npc_tbl = {}
_talk_ing = false
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_searching = false
_npc_miss_count = 0
_HAZURE_NUM = 6
_BOX_HAZURE_NUM = 4
_MOB_NUM = 1
_HAZURE_TBL = {
  {
    name = "hazure_b_01",
    motion = nil,
    turn = nil
  },
  {
    name = "hazure_b_02",
    motion = nil,
    turn = nil
  },
  {
    name = "hazure_b_03",
    motion = nil,
    turn = nil
  },
  {
    name = "hazure_b_04",
    motion = nil,
    turn = nil
  },
  {
    name = "hazure_b_05",
    motion = {"stay_02", "stay_01"},
    turn = "locator2_hazure_b_turn_05"
  },
  {
    name = "hazure_b_06",
    motion = {"talk_00", "talk_03"},
    turn = "locator2_hazure_b_turn_06"
  },
  {
    name = "mob_b_01",
    motion = {"talk_01", "talk_01"},
    turn = "locator2_mob_b_turn_01"
  }
}
_hazure_motion = {}
_pc_caption_tbl = {
  "sm12_00113",
  "sm12_00114",
  "sm12_00115",
  "sm12_00116",
  "sm12_00117",
  "sm12_00118"
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "atari_b",
      type = "man38",
      attach = false,
      node = "locator2_atari_b_01"
    },
    {
      name = "hazure_b_01",
      type = "man38",
      attach = false,
      node = "locator2_hazure_b_01",
      color_variation = 1,
      hair_variation = 0
    },
    {
      name = "hazure_b_02",
      type = "man38",
      attach = false,
      node = "locator2_hazure_b_02",
      color_variation = 1,
      hair_variation = 0
    },
    {
      name = "hazure_b_03",
      type = "man38",
      attach = false,
      node = "locator2_hazure_b_03",
      color_variation = 2,
      hair_variation = 0
    },
    {
      name = "hazure_b_04",
      type = "man38",
      attach = false,
      node = "locator2_hazure_b_04",
      color_variation = 2,
      hair_variation = 0
    },
    {
      name = "hazure_b_05",
      type = "man38",
      attach = false,
      node = "locator2_hazure_b_05",
      color_variation = 3,
      hair_variation = 0
    },
    {
      name = "hazure_b_06",
      type = "man38",
      attach = false,
      node = "locator2_hazure_b_06",
      color_variation = 3,
      hair_variation = 0
    },
    {
      name = "hazure_b_06",
      type = "man38",
      attach = false,
      node = "locator2_hazure_b_06",
      color_variation = 3,
      hair_variation = 0
    },
    {
      name = "mob_b_01",
      type = "man41",
      attach = false,
      node = "locator2_mob_b_01",
      color_variation = 3,
      hair_variation = 0
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _polydemo = PDemo.create("sm12_a_c01", Fn_findAreaHandle("po_a_04"), {scene_param = false})
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1 = Fn_setNpcActive
  L1_2 = "sm12_client"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = {}
  L1_2 = {}
  L2_3 = {}
  L3_4 = _pc_caption_tbl
  L4_5 = RandI
  L4_5 = L4_5(L5_6, L6_7)
  L3_4 = L3_4[L4_5]
  L2_3.text = L3_4
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L3_4 = _pc_caption_tbl
  L4_5 = RandI
  L4_5 = L4_5(L5_6, L6_7)
  L3_4 = L3_4[L4_5]
  L2_3.text = L3_4
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.man38 = L1_2
  L1_2 = {L2_3}
  L2_3 = {}
  L3_4 = {}
  L4_5 = _pc_caption_tbl
  L4_5 = L4_5[L5_6]
  L3_4.text = L4_5
  L3_4.time = 2
  L2_3.reply_yes = L3_4
  L3_4 = {}
  L4_5 = _pc_caption_tbl
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
    L11_12
  }
  L4_5 = _puppet_tbl
  L4_5 = L4_5.atari_b
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
  L5_6.pointing = false
  L5_6.positiveRate = 0
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = Fn_findNpc
  L2_3 = "atari_b"
  L1_2 = L1_2(L2_3)
  L2_3 = false
  L3_4 = false
  L4_5 = invokeTask
  L4_5 = L4_5(L5_6)
  L5_6()
  for L8_9, L9_10 in L5_6(L6_7) do
    if L10_11 ~= nil then
      L10_11(L11_12, L12_13)
    end
  end
  for L10_11 = 1, _BOX_HAZURE_NUM do
    L6_7[L10_11] = L11_12
    for L14_15 = 1, L5_6[L10_11] do
      L6_7[L10_11][L14_15] = string.format("locator2_hazure_b_%02d_move_%02d", L10_11, L14_15)
    end
  end
  L7_8.anim_walk = "porter_walk"
  L7_8.runLength = 1000
  L7_8.noTurn = true
  L7_8.loop = true
  for L13_14 = 1, _BOX_HAZURE_NUM do
    L8_9[L13_14] = L14_15
    L14_15(L14_15, true)
    L14_15(L14_15, false)
    L14_15(L8_9[L13_14], _puppet_tbl[string.format("hazure_b_%02d", L13_14)], "loc_ci00")
    L14_15(L14_15, Vector(0, -0.01, 0.03))
    L9_10[L13_14] = L14_15
  end
  L10_11()
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11()
  _searching = true
  L10_11(L11_12)
  L11_12.in_game_preview = "k_photo_sm1202"
  L10_11.view = L11_12
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12()
  L12_13()
  L13_14()
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14()
  L13_14()
  L13_14(L14_15, Camera.kPlayer, Camera.kControl_All, false)
  L13_14(L14_15, true, 1, Fn_findNpc("atari_b"):getWorldPos())
  L2_3 = true
  while L3_4 == false do
    L13_14()
  end
  L4_5 = L13_14
  L13_14(L14_15)
  L13_14(L14_15, false, 1, Vector(0, 0, 0))
  L13_14(L14_15)
  L13_14(L14_15)
  L13_14(L14_15, false)
  L13_14(L14_15, false)
  L13_14(L14_15, false)
  while true do
    if L13_14 == false then
      L13_14()
    end
  end
  L13_14(L14_15)
  L14_15.cap = "sm12_01008"
  L14_15.wait = PDEMO_WAIT01
  L14_15(function()
    for _FORV_3_, _FORV_4_ in pairs(L13_14) do
      Fn_captionViewWait(_FORV_4_.cap, _FORV_4_.wait)
    end
  end)
  while true do
    if L14_15 == false then
      L14_15()
    end
  end
  L14_15("sm12_00800k")
  L14_15()
  L14_15(L14_15)
  L14_15(L14_15, true)
  L14_15(true)
  L14_15(L14_15, true)
  for _FORV_17_ = 1, _BOX_HAZURE_NUM do
    if L9_10[_FORV_17_] ~= nil then
      L9_10[_FORV_17_]:abort()
    end
  end
  L14_15()
  L14_15()
  L14_15()
end
function Finalize()
  if Fn_getPlayer() then
    _gesture:stop()
  end
  clearNpcMissCount()
end
function gestureCancelFunc()
  local L0_16, L1_17
  _decide_flag = true
  L0_16 = _cancel_flag
  return L0_16
end
function gestureBreakFunc()
  local L0_18, L1_19
  L0_18 = _break_flag
  return L0_18
end
_npc_kaiwa_table = {
  atari_b = {
    cnt = 0,
    kaiwa = "",
    answer = true
  },
  hazure_b_01 = {cnt = 0, kaiwa = ""},
  hazure_b_02 = {cnt = 0, kaiwa = ""},
  hazure_b_03 = {cnt = 0, kaiwa = ""},
  hazure_b_04 = {cnt = 0, kaiwa = ""},
  hazure_b_05 = {cnt = 0, kaiwa = ""},
  hazure_b_06 = {cnt = 0, kaiwa = ""},
  mob_b_01 = {cnt = 0, kaiwa = ""}
}
function gestureNpcActionCallback(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29
  L1_21 = {
    L2_22,
    L3_23,
    L4_24
  }
  L2_22 = "sm12_01000"
  L3_23 = "sm12_01001"
  L4_24 = "sm12_01002"
  L2_22 = {L3_23}
  L3_23 = "sm12_01003"
  if A0_20 then
    L4_24 = A0_20
    L3_23 = A0_20.getName
    L3_23 = L3_23(L4_24)
    L4_24 = Fn_userCtrlOff
    L4_24()
    L4_24 = A0_20.getWorldPos
    L4_24 = L4_24(L5_25)
    L8_28 = 0
    L4_24 = L4_24 + L5_25
    L8_28 = 1
    L9_29 = L4_24
    L5_25(L6_26, L7_27, L8_28, L9_29)
    for L8_28, L9_29 in L5_25(L6_26) do
      if L3_23 == L9_29.name then
        invokeTask(function()
          _gesture:stop()
          if L9_29.turn ~= nil or string.sub(L3_23, 1, 3) == "mob" then
            if L3_23 == "mob_b_01" then
              Fn_playMotionNpc("hazure_b_06", "stay_01", false)
            elseif L3_23 == "hazure_b_06" then
              Fn_playMotionNpc("mob_b_01", "stay_01", false)
            end
            Fn_turnNpc(L3_23)
          else
          end
          if L9_29.motion ~= nil then
            comStopMotion(L9_29.name)
          end
          if L3_23 ~= "atari_b" then
            if L9_29.motion ~= nil then
              Fn_playMotionNpc(L3_23, "reply_no", false)
            end
            Fn_captionViewWait(L1_21[RandI(1, #L1_21)])
            waitSeconds(2)
            _gesture:run()
            _npc_kaiwa_table[L3_23].cnt = 1
            incNpcMissCount()
            if Fn_isCaptionView() == false then
              if string.sub(L3_23, 1, 3) == "haz" then
                Fn_captionView(_pc_caption_tbl[RandI(4, #_pc_caption_tbl)])
              else
                Fn_captionView(_pc_caption_tbl[RandI(1, 3)])
              end
            end
            if L9_29.turn ~= nil then
              waitSeconds(1)
              Fn_turnNpc(L3_23, L9_29.turn)
              if L9_29.motion ~= nil then
                comPlayMotion(L9_29.name, L9_29.motion)
              end
            end
          end
        end)
        break
      else
      end
    end
    L5_25(L6_26)
    L8_28 = 1
    L9_29 = L4_24
    L5_25(L6_26, L7_27, L8_28, L9_29)
    L5_25()
    if L5_25 == true then
      L5_25(L6_26)
      L5_25(L6_26)
      L5_25()
      L5_25()
    end
  else
  end
end
function pccubesensor2_gesture_area_02_OnEnter()
  killWarningNavi()
end
function pccubesensor2_gesture_area_02_OnLeave()
  local L0_30, L1_31
  L0_30 = comGuideFunc
  L1_31 = "sm12_01014"
  L0_30(L1_31, findGameObject2("Node", "locator2_catwarp_warning_navi_02"))
end
function pccubesensor2_catwarp_warning_02_OnEnter()
  if _gesture ~= nil and _searching then
    _gesture:run()
  end
  killWarningNavi()
end
function pccubesensor2_catwarp_warning_02_OnLeave()
  if _gesture ~= nil then
    _gesture:stop()
  end
  comCatWarpWarning("sm12_01015", findGameObject2("Node", "locator2_catwarp_warning_navi_02"))
end
function pccubesensor2_catwarp_area_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    killWarningNavi()
  end)
end
function pccubesensor2_ajito_03_OnEnter()
  comKillNavi()
end
function set_writer_prop()
  local L0_32
  L0_32 = createGameObject2
  L0_32 = L0_32("GimmickBg")
  L0_32:setDrawModelName("cimemo01_base")
  L0_32:setCollidablePermission(false)
  L0_32:try_init()
  L0_32:waitForReady()
  L0_32:try_start()
  Fn_attachJoint(L0_32, Fn_findNpcPuppet("atari_b"), "loc_l_hand")
end
