dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep08_common.lua")
SDEMO_NORMAL_DEG = 50
SDEMO_ZOOM_DEG2 = 30
SDEMO_ZOOM_DEG = 25
LYRICS_SELECT_MAX = 4
_sdemo_cut = nil
_buzz_task = nil
_hum_se_handle = nil
_lyrics_select_phase = 0
_select_lyrics_num = {
  0,
  0,
  0,
  0
}
_correct_answer_tbl = {
  {
    text = "ep08_02904",
    btn = Pad.kButton_RU,
    num = 4
  },
  {
    text = "ep08_02902",
    btn = Pad.kButton_RR,
    num = 2
  },
  {
    text = "ep08_02901",
    btn = Pad.kButton_RD,
    num = 1
  },
  {
    text = "ep08_02903",
    btn = Pad.kButton_RL,
    num = 3
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = SDemo
  L0_0 = L0_0.create
  L1_1 = "cut01"
  L0_0 = L0_0(L1_1)
  _sdemo_cut = L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    L1_1,
    L2_2,
    L3_3
  }
  L1_1 = {}
  L1_1.name = "bass"
  L1_1.type = "man65"
  L1_1.color_variation = 3
  L1_1.hair_variation = 1
  L1_1.face_tex_name = "man65_face_b"
  L1_1.node = "locator2_bandman_bass"
  L1_1.anim_name = "play_base_00"
  L1_1.attach = false
  L1_1.use_gravity = false
  L1_1.disable_collision = true
  L2_2 = {}
  L2_2.name = "piano"
  L2_2.type = "man65"
  L2_2.color_variation = 0
  L2_2.hair_variation = 1
  L2_2.face_tex_name = "man65_face_d"
  L2_2.node = "locator2_bandman_piano"
  L2_2.anim_name = "play_piano_00"
  L2_2.attach = false
  L2_2.use_gravity = false
  L2_2.disable_collision = true
  L3_3 = {}
  L3_3.name = "sax"
  L3_3.type = "man65"
  L3_3.node = "locator2_bandman_sax"
  L3_3.anim_name = "play_sax_00"
  L3_3.attach = false
  L3_3.use_gravity = false
  L3_3.disable_collision = true
  L1_1 = Fn_setupNpc
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = Fn_setCatActive
  L2_2 = false
  L1_1(L2_2)
  L1_1 = createBandObject
  L2_2 = "cicontrabass01_base"
  L1_1 = L1_1(L2_2)
  L2_2 = findGameObject2
  L3_3 = "Node"
  L2_2 = L2_2(L3_3, "locator2_contrabass")
  L3_3 = L1_1.setWorldTransform
  L3_3(L1_1, L2_2:getWorldTransform())
  L3_3 = createBandObject
  L3_3 = L3_3("cisaxophone01_base")
  Fn_attachJoint(L3_3, Fn_findNpc("sax"):getPuppet(), "loc_l_hand")
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11
  L0_4 = setArStage
  L0_4()
  L0_4 = Fn_coercionPoseNomal
  L0_4()
  L0_4 = {
    L1_5,
    L2_6,
    L3_7
  }
  L1_5 = "kit01_ep08_cw001_00"
  L2_6 = "kit01_ep08_cw002_00"
  L3_7 = "kit01_ep08_hint_00"
  L1_5 = Fn_resetPcPos
  L2_6 = "locator2_pc_start_pos"
  L1_5(L2_6)
  L1_5 = Fn_loadPlayerMotion
  L2_6 = L0_4
  L1_5(L2_6)
  L1_5 = Fn_playPlayerMotion
  L2_6 = L0_4[1]
  L3_7 = -1
  L1_5(L2_6, L3_7)
  L1_5 = findGameObject2
  L2_6 = "Node"
  L3_7 = "locator2_cam_node_01"
  L1_5 = L1_5(L2_6, L3_7)
  L2_6 = findGameObject2
  L3_7 = "Node"
  L4_8 = "locator2_cam_node_02"
  L2_6 = L2_6(L3_7, L4_8)
  L3_7 = findGameObject2
  L4_8 = "Node"
  L5_9 = "locator2_cam_node_03"
  L3_7 = L3_7(L4_8, L5_9)
  L4_8 = findGameObject2
  L5_9 = "Node"
  L6_10 = "locator2_cam_node_04"
  L4_8 = L4_8(L5_9, L6_10)
  L5_9 = findGameObject2
  L6_10 = "Node"
  L7_11 = "locator2_kitten_node_01"
  L5_9 = L5_9(L6_10, L7_11)
  L6_10 = findGameObject2
  L7_11 = "Node"
  L6_10 = L6_10(L7_11, "locator2_kitten_node_02")
  L7_11 = _sdemo_cut
  L7_11 = L7_11.set
  L7_11(L7_11, L1_5, L5_9)
  L7_11 = _sdemo_cut
  L7_11 = L7_11.play
  L7_11(L7_11)
  L7_11 = playBuzzSE
  L7_11()
  L7_11 = playBuzzSETask
  L7_11 = L7_11(8.5)
  _buzz_task = L7_11
  L7_11 = Fn_missionStart
  L7_11()
  L7_11 = 0
  waitSeconds(3)
  while true do
    _sdemo_cut:setCameraParam(nil, nil, {
      deg = SDEMO_ZOOM_DEG2
    })
    _sdemo_cut:set(L2_6, L6_10)
    _sdemo_cut:play()
    HUD:menuSetCallback(HUD.kCallback_LyricsSelectPressBtn, lyricsSelectPressBtn)
    HUD:lyricsSelectOpen()
    Fn_captionViewEnd()
    waitSeconds(0.3)
    Fn_captionView(({
      {caption = "ep08_09020", voice = "kit_619"},
      {caption = "ep08_09021", voice = "kit_620"},
      {caption = "ep08_09022", voice = "kit_621"}
    })[1].caption)
    Sound:playSE(({
      {caption = "ep08_09020", voice = "kit_619"},
      {caption = "ep08_09021", voice = "kit_620"},
      {caption = "ep08_09022", voice = "kit_621"}
    })[1].voice, 1)
    waitSeconds(2.7)
    while _lyrics_select_phase < LYRICS_SELECT_MAX do
      wait()
    end
    HUD:lyricsSelectClose()
    waitSeconds(0.2)
    print("\231\173\148\227\129\136\229\144\136\227\130\143\227\129\155\227\129\184")
    for _FORV_14_ = 1, LYRICS_SELECT_MAX do
      if _correct_answer_tbl[_FORV_14_].num == _select_lyrics_num[_FORV_14_] then
        L7_11 = L7_11 + 1
      end
    end
    if L7_11 == _FOR_ then
      print("\230\173\163\232\167\163\239\188\154\230\173\140\232\169\158\233\129\184\230\138\158\231\181\130\228\186\134")
      _sdemo_cut:set(L4_8, L5_9)
      Fn_playPlayerMotion(L0_4[3])
      waitSeconds(4)
      wait()
      _sdemo_cut:play()
      Fn_captionViewEnd()
      break
    else
      print("\228\184\141\230\173\163\232\167\163 : \230\173\140\232\169\158\233\129\184\230\138\158\227\129\171\230\136\187\227\130\139 / \230\173\163\232\167\163\230\149\176 : " .. L7_11)
      _sdemo_cut:setCameraParam(nil, nil, {
        deg = SDEMO_NORMAL_DEG
      })
      _sdemo_cut:set(L3_7, L5_9)
      Fn_playPlayerMotion(L0_4[2])
      wait()
      _sdemo_cut:play()
      waitSeconds(1.6)
      Fn_captionViewEnd()
      waitSeconds(4.2)
      Fn_playPlayerMotion(L0_4[1], -1)
      _lyrics_select_phase = 0
      L7_11 = 0
      for _FORV_14_ = 1, LYRICS_SELECT_MAX do
        _select_lyrics_num[_FORV_14_] = 0
      end
      if 0 + 1 == 3 then
        print("3\229\155\158\229\164\177\230\149\151\227\129\151\227\129\159\227\129\159\227\130\129\229\188\183\229\136\182\231\154\132\227\129\171\233\128\178\232\161\140")
        _sdemo_cut:setCameraParam(nil, nil, {
          deg = SDEMO_ZOOM_DEG
        })
        _sdemo_cut:set(L4_8, L5_9)
        _sdemo_cut:play()
        Fn_playPlayerMotion(L0_4[3])
        Fn_captionViewEnd()
        waitSeconds(0.2)
        Fn_captionView("ep08_84213")
        waitSeconds(3)
        break
      end
    end
  end
  _sdemo_cut:stop()
  Fn_captionViewEnd()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_setCatActive(true)
  if _buzz_task ~= nil then
    _buzz_task:abort()
    _buzz_task = nil
  end
  HUD:lyricsSelectClose()
  if _hum_se_handle then
    Sound:stopSEHandle(_hum_se_handle)
    _hum_se_handle = nil
  end
end
function createBandObject(A0_12)
  createGameObject2("GimmickBg"):setDrawModelName(A0_12)
  createGameObject2("GimmickBg"):setForceMove()
  return (createGameObject2("GimmickBg"))
end
function lyricsSelectPressBtn(A0_13)
  local L1_14
  L1_14 = ""
  _lyrics_select_phase = _lyrics_select_phase + 1
  for _FORV_5_ = 1, #_correct_answer_tbl do
    if _correct_answer_tbl[_FORV_5_].btn == A0_13 then
      _select_lyrics_num[_lyrics_select_phase] = _correct_answer_tbl[_FORV_5_].num
    end
  end
  L1_14 = "ep08_8"
  for _FORV_5_ = 1, LYRICS_SELECT_MAX do
    L1_14 = L1_14 .. _select_lyrics_num[_FORV_5_]
  end
  Fn_captionView(L1_14, 0)
end
function playBuzzSE()
  _hum_se_handle = Sound:playSEHandle("ep08_hum", 1)
end
function playBuzzSETask(A0_15)
  return (invokeTask(function()
    local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21
    L0_16 = waitSeconds
    L1_17 = A0_15
    L0_16(L1_17)
    while true do
      L0_16 = {
        L1_17,
        L2_18,
        L3_19,
        L4_20
      }
      L1_17 = "m26_009"
      L2_18 = "m27_010"
      L3_19 = "m28_009"
      L4_20 = ""
      L1_17 = math
      L1_17 = L1_17.random
      L2_18 = #L0_16
      L1_17 = L1_17(L2_18)
      L2_18 = {
        L3_19,
        L4_20,
        L5_21
      }
      L3_19 = "locator2_pc_start_pos"
      L4_20 = "locator2_bandman_bass"
      L5_21 = "locator2_bandman_piano"
      L3_19 = math
      L3_19 = L3_19.random
      L4_20 = #L2_18
      L3_19 = L3_19(L4_20)
      L3_19 = L2_18[L3_19]
      L4_20 = findGameObject2
      L5_21 = "Node"
      L4_20 = L4_20(L5_21, L3_19)
      L5_21 = math
      L5_21 = L5_21.random
      L5_21 = L5_21(4)
      Sound:playSE(L0_16[L1_17], 0.2, "", L4_20)
      L5_21 = math.random(5)
      waitSeconds(L5_21)
    end
  end))
end
