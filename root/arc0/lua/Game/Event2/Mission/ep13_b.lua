dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
import("Vehicle")
GES_END_KNOWN_CNT = 4
GEM_MAX = 6
GEM_ACTIVE_DIST_A = 5
DIST_WHEN_SPEED_UP = 3
FAST_SPEED = 8
SLOW_SPEED = 4
_puppet_tbl = {}
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_navi_view = false
_npc_known_cnt = 0
_mobgri_kaiwa_happend = false
_npcgri_kaiwa_happend = false
_gri_gesture_check = nil
_now_catwarp = false
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_far_from_ges_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_ges_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shop_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_arrive_gull_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_b_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_b_01")
  L0_0 = {
    {
      name = "chi20",
      type = "chi20",
      node = "locator2_13_info_child_01",
      use_gravity = false,
      anim_name = "sit_00"
    },
    {
      name = "chi19",
      type = "chi19",
      node = "locator2_13_info_child_02",
      anim_name = "idle_ep13_00"
    },
    {
      name = "dog01",
      type = "dog01",
      node = "locator2_13_info_dog_01"
    },
    {
      name = "gri01",
      type = "mcgri",
      node = "locator2_13_info_gri_01"
    },
    {
      name = "shop01",
      type = "man09",
      node = "locator2_shop_01"
    },
    {
      name = "gull01",
      type = "gull01",
      node = "locator2_gull_01",
      use_gravity = false,
      active = false
    },
    {
      name = "runaway_npc01",
      type = "wom01",
      node = "locator2_runaway_npc_01",
      active = false
    },
    {
      name = "runaway_npc02",
      type = "man01",
      node = "locator2_runaway_npc_02",
      active = false
    },
    {
      name = "runaway_npc03",
      type = "kid01",
      node = "locator2_runaway_npc_03",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _gull_npc = Fn_findNpc("gull01")
  _sdemo_cut01 = SDemo.create("ep13_b_cut01")
  _sdemo_cut02 = SDemo.create("ep13_b_cut02")
  _pdemo = PDemo.create("ep13_c_c01", Fn_findAreaHandle("cc_a_root"), {camera = true, scene_param = false})
  Mob:topUpHatchery()
  Mob:restrict_ep13_00(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14
  L0_1 = print
  L1_2 = "***********B\227\131\145\227\131\188\227\131\136\233\150\139\229\167\139*****************"
  L0_1(L1_2)
  L0_1 = Fn_setCatWarp
  L1_2 = false
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_warning_b_01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_area_b_01"
  L0_1(L1_2)
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "startAttrTuneCheck"
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "gemActive"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = {}
  L1_2 = {}
  L1_2.known_kaiwa = "ep13_00131k"
  L1_2.reply_caption_skip = true
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.man01 = L1_2
  L1_2 = {}
  L1_2.known_kaiwa = "ep13_00132k"
  L1_2.reply_caption_skip = true
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.wom01 = L1_2
  L1_2 = {}
  L1_2.unknown_kaiwa = "ep13_00134k"
  L1_2.reply_caption_skip = true
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.gri01 = L1_2
  L1_2 = {}
  L1_2.known_kaiwa = "ep13_00135k"
  L1_2.reply_caption_skip = true
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.wom45 = L1_2
  L1_2 = {}
  L1_2.known_kaiwa = "ep13_00136k"
  L1_2.reply_caption_skip = true
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.wom46 = L1_2
  L1_2 = {}
  L1_2.known_kaiwa = "ep13_00137k"
  L1_2.reply_caption_skip = true
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.man07 = L1_2
  L1_2 = {}
  L1_2.known_kaiwa = "ep13_00138k"
  L1_2.reply_caption_skip = true
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_yes = L2_3
  L2_3 = {}
  L2_3.text = "ep13_01007"
  L2_3.time = 2
  L1_2.reply_no = L2_3
  L0_1.man02 = L1_2
  L1_2 = {L2_3}
  L2_3 = {}
  L3_4 = {}
  L3_4.text = "ep13_01007"
  L3_4.time = 2
  L2_3.reply_yes = L3_4
  L3_4 = {}
  L3_4.text = "ep13_01007"
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
  L1_2 = L1_2.setNaviTarget
  L3_4, L4_5 = nil, nil
  L5_6 = {}
  L5_6.classGroup = "yy_navi_ep13"
  L5_6.positiveRate = 0
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = _gesture
  L2_3 = L1_2
  L1_2 = L1_2.setNpc
  L3_4 = {L4_5, L5_6}
  L4_5 = _puppet_tbl
  L4_5 = L4_5.chi20
  L5_6 = _puppet_tbl
  L5_6 = L5_6.gri01
  L1_2(L2_3, L3_4)
  L1_2 = _gesture
  L2_3 = L1_2
  L1_2 = L1_2.setAsking
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = _gesture
  L2_3 = L1_2
  L1_2 = L1_2.setMobText
  L3_4 = L0_1
  L1_2(L2_3, L3_4)
  function L1_2(A0_15)
    if A0_15.className == "gri01" and _npcgri_kaiwa_happend and _mobgri_kaiwa_happend == false then
      print("\229\133\136\227\129\171NPC\227\129\168\227\129\151\227\129\166\232\169\177\227\129\151\227\129\159\239\188\154\227\130\170\227\131\188\227\131\144\227\131\188\227\131\169\227\130\164\227\131\137\227\129\174\228\184\173\232\186\171")
      return true
    end
    return false
  end
  L2_3 = _gesture
  L3_4 = L2_3
  L2_3 = L2_3.setOverrideYesFunc
  L4_5 = L1_2
  L2_3(L3_4, L4_5)
  L2_3 = Fn_findNpc
  L3_4 = "dog01"
  L2_3 = L2_3(L3_4)
  L4_5 = L2_3
  L3_4 = L2_3.playMotion
  L5_6 = {L6_7, L7_8}
  L6_7.isRepeat = true
  L6_7.isRandom = true
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = createGameObject2
  L4_5 = "GimmickBg"
  L3_4 = L3_4(L4_5)
  L5_6 = L3_4
  L4_5 = L3_4.setDrawModelName
  L4_5(L5_6, L6_7)
  L5_6 = L3_4
  L4_5 = L3_4.setName
  L4_5(L5_6, L6_7)
  L5_6 = L3_4
  L4_5 = L3_4.setActive
  L4_5(L5_6, L6_7)
  L5_6 = L3_4
  L4_5 = L3_4.try_init
  L4_5(L5_6)
  L5_6 = L3_4
  L4_5 = L3_4.waitForReady
  L4_5(L5_6)
  L5_6 = L3_4
  L4_5 = L3_4.try_start
  L4_5(L5_6)
  L4_5 = createGameObject2
  L5_6 = "SimpleModel"
  L4_5 = L4_5(L5_6)
  L5_6 = L4_5.setModelName
  L5_6(L6_7, L7_8)
  L5_6 = L4_5.setName
  L5_6(L6_7, L7_8)
  L5_6 = L4_5.setActive
  L5_6(L6_7, L7_8)
  L5_6 = findGameObject2
  L5_6 = L5_6(L6_7, L7_8)
  L6_7(L7_8, L8_9)
  L6_7(L7_8)
  L6_7(L7_8)
  L6_7(L7_8)
  for L9_10 = 1, GEM_MAX do
    L13_14 = string
    L13_14 = L13_14.format
    L13_14 = L13_14("%02d", L9_10)
    L10_11(L11_12, L12_13)
  end
  while true do
    if L6_7 == false then
      L6_7()
    end
  end
  L6_7()
  L6_7()
  while true do
    if L6_7 == 1 then
      L7_8(L8_9)
      L7_8(L8_9)
      L7_8(L8_9)
      L7_8(L8_9)
      L7_8(L8_9)
      L7_8(L8_9)
      L9_10 = "ep13_info_01"
      L7_8(L8_9, L9_10)
      L7_8(L8_9)
      L7_8(L8_9)
      _gri_gesture_check = L7_8
      while true do
        if L7_8 ~= L8_9 then
          L7_8()
        end
      end
      L7_8(L8_9)
      _gesture = nil
      _navi_view = nil
      _gri_gesture_check = L7_8
      L7_8(L8_9)
      L7_8(L8_9)
      L7_8(L8_9)
      L7_8(L8_9)
    elseif L6_7 == 2 then
      L7_8(L8_9)
      L7_8(L8_9)
      L7_8(L8_9)
      while true do
        if L7_8 ~= L8_9 then
          L7_8()
        end
      end
      _mv_is_goto_next_phase = false
      L7_8()
      L7_8(L8_9)
    elseif L6_7 == 3 then
      L9_10 = "ep13_00151k"
      L8_9(L9_10, L10_11, L11_12)
      L8_9()
      L9_10 = false
      L8_9(L9_10)
      L9_10 = L8_9
      L8_9(L9_10)
      L8_9()
      L9_10 = "locator2_resetpos_shop_01"
      L8_9(L9_10)
      repeat
        L8_9()
        L9_10 = L8_9
      until L8_9
      L9_10 = L8_9
      L8_9(L9_10, L10_11)
      L9_10 = L8_9
      L8_9(L9_10)
      L9_10 = "shop01"
      L8_9(L9_10, L10_11)
      L8_9()
      L9_10 = true
      L8_9(L9_10)
    elseif L6_7 == 4 then
      L7_8(L8_9)
      L9_10 = true
      L7_8(L8_9, L9_10)
      L9_10 = true
      L7_8(L8_9, L9_10)
      L9_10 = _puppet_tbl
      L9_10 = L9_10.gull01
      L7_8(L8_9, L9_10, L10_11)
      L9_10 = 0
      L7_8(L8_9, L9_10)
      L9_10 = -1
      L7_8(L8_9, L9_10)
      L7_8(L8_9)
      L8_9.pos = "locator2_gull01_escape_a_07"
      L8_9.attr = "fly"
      L9_10 = {}
      L9_10.pos = "locator2_gull01_escape_a_08"
      L9_10.attr = "fly"
      L10_11.pos = "locator2_gull01_escape_a_09"
      L10_11.attr = "fly"
      L11_12.pos = "locator2_gull01_escape_a_10"
      L11_12.attr = "fly"
      L12_13.pos = "locator2_gull01_escape_a_11"
      L12_13.attr = "fly"
      L13_14 = {}
      L13_14.pos = "locator2_gull01_escape_a_12"
      L13_14.attr = "fly"
      function L9_10()
        Fn_fly("gull01", L7_8, {
          moveSpeed = SLOW_SPEED
        })
      end
      L8_9(L9_10)
      L9_10 = {}
      for L13_14 = 1, GEM_MAX do
        L9_10[L13_14] = {}
        L9_10[L13_14].hdl = findGameObject2("Gem", "gem2_energy_race_a_" .. string.format("%02d", L13_14))
        L9_10[L13_14].active = false
      end
      L13_14 = _puppet_tbl
      L13_14 = L13_14.gull01
      L13_14 = invokeTask
      L13_14(function()
        waitSeconds(3)
        L12_13 = Mv_safeTaskAbort(L12_13)
      end)
      L13_14 = Fn_missionView
      L13_14("ep13_01016")
      L13_14 = waitSeconds
      L13_14(6.8)
      L13_14 = Fn_captionViewWait
      L13_14("ep13_01015")
      while true do
        L13_14 = _gull_npc
        L13_14 = L13_14.isFlyEnd
        L13_14 = L13_14(L13_14)
        if not L13_14 then
          L13_14 = wait
          L13_14()
        end
      end
      L13_14 = print
      L13_14("\230\185\190\229\178\184\233\179\165\239\188\154\233\163\155\232\161\140\231\181\130\228\186\134")
      L13_14 = Mv_safeTaskAbort
      L13_14 = L13_14(L8_9)
      L13_14 = Mv_safeTaskAbort
      L13_14 = L13_14(L11_12)
      L9_10 = nil
      GEM_MAX = nil
      L13_14 = Fn_pcSensorOn
      L13_14("pccubesensor2_arrive_gull_01")
      L13_14 = Mv_waitPhase
      L13_14()
      L13_14 = Fn_naviKill
      L13_14()
      break
    else
      if L6_7 == 5 then
        L7_8()
        L7_8()
        L7_8(L8_9)
        L9_10 = false
        L7_8(L8_9, L9_10)
        L9_10 = false
        L7_8(L8_9, L9_10)
        L9_10 = false
        L7_8(L8_9, L9_10)
        L9_10 = false
        L7_8(L8_9, L9_10)
        L9_10 = false
        L7_8(L8_9, L9_10)
        L9_10 = true
        L7_8(L8_9, L9_10)
        L7_8(L8_9)
        L9_10 = "locator2_gull01_escape_a_27"
        L7_8(L8_9, L9_10)
        L7_8(L8_9)
        L9_10 = true
        L7_8(L8_9, L9_10)
        L9_10 = true
        L7_8(L8_9, L9_10)
        L9_10 = true
        L7_8(L8_9, L9_10)
        L7_8(L8_9)
        L9_10 = "eat"
        L7_8(L8_9, L9_10, L10_11)
        L9_10 = "locator2_demo_lost_camera_01"
        L13_14 = 0
        L13_14 = L12_13(L13_14, 0.5, 0)
        L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L12_13(L13_14, 0.5, 0))
        L9_10 = {L10_11}
        L10_11.time = 4
        L10_11.pos = "locator2_demo_lost_camera_02"
        L7_8(L8_9, L9_10)
        L7_8()
        L7_8(L8_9)
        L7_8(L8_9)
        L9_10 = "kit051c"
        L7_8(L8_9, L9_10)
        L7_8(L8_9)
        L7_8(L8_9)
        L8_9.pos = "locator2_gull01_lost_01"
        L8_9.attr = "takeoff"
        L9_10 = {}
        L9_10.pos = "locator2_gull01_lost_02"
        L9_10.attr = "fly"
        L10_11.pos = "locator2_gull01_lost_03"
        L10_11.attr = "fly"
        L9_10 = invokeTask
        L9_10(L10_11)
        while true do
          L9_10 = _sdemo_cut01
          L9_10 = L9_10.isPlay
          L9_10 = L9_10(L10_11)
          if L9_10 then
            L9_10 = wait
            L9_10()
          end
        end
        L9_10 = _sdemo_cut01
        L9_10 = L9_10.play
        L12_13.time = 4
        L12_13.pos = "locator2_demo_lost_camera_03"
        L9_10(L10_11, L11_12)
        L9_10 = waitSeconds
        L9_10(L10_11)
        L9_10 = Fn_sendEventComSb
        L9_10(L10_11, L11_12)
        L9_10 = Fn_sendEventComSb
        L9_10(L10_11, L11_12)
        L9_10 = invokeTask
        L9_10(L10_11)
        while true do
          L9_10 = _sdemo_cut01
          L9_10 = L9_10.isPlay
          L9_10 = L9_10(L10_11)
          if L9_10 then
            L9_10 = wait
            L9_10()
          end
        end
        L9_10 = waitSeconds
        L9_10(L10_11)
        L9_10 = _sdemo_cut01
        L9_10 = L9_10.set
        L13_14 = false
        L9_10(L10_11, L11_12, L12_13, L13_14, Vector(0, 0.5, 0))
        L9_10 = {L10_11}
        L10_11.pos = "locator2_gull01_lost_04"
        L10_11.attr = "fly"
        L10_11(L11_12)
        L10_11(L11_12)
        L10_11(L11_12)
        L10_11(L11_12, L12_13)
        L10_11(L11_12)
        break
      else
      end
    end
    L7_8()
  end
  L7_8()
  L7_8()
  L7_8()
  L7_8()
end
function Finalize()
  Mob:makeSituationPanic(false)
  Vehicle:SetPanic(false)
  Mob:restrict_ep13_00(false)
end
function pccubesensor2_shop_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_shop_01_OnLeave()
  local L0_16, L1_17
  _mv_is_goto_next_phase = false
end
function pccubesensor2_arrive_gull_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_arrive_gull_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_far_from_ges_area_01_OnLeave()
  if _gesture ~= nil then
    _gesture:stop()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\228\184\128\230\153\130\229\129\156\230\173\162")
    Fn_naviSet(findGameObject2("Node", "locator2_ges_area_center"))
    _navi_view = true
    Fn_captionView("ep13_01018")
  end
end
function pccubesensor2_ges_area_01_OnEnter()
  if _gesture ~= nil and _navi_view then
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\229\134\141\233\150\139")
    Fn_naviKill()
    _navi_view = false
    if not _now_catwarp then
      Fn_captionView("ep13_01019")
      print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\168\227\131\170\227\130\162\229\134\133\227\129\171\229\133\165\227\129\163\227\129\159\227\129\174\227\129\167\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179")
    end
  end
end
function pccubesensor2_catwarp_warning_b_01_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep13_01020")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_area_b_01_OnLeave()
  invokeTask(function()
    _now_catwarp = true
    print("\227\131\175\227\131\188\227\131\151\231\153\186\229\139\149\239\188\129\239\188\129\239\188\129")
    Fn_catWarp()
    print("\227\131\175\227\131\188\227\131\151\229\174\140\228\186\134\239\188\129\239\188\129\239\188\129")
    _now_catwarp = false
  end)
end
function gestureCancelFunc()
  print("CanselFunc!!!!!!")
  _decide_flag = true
  return _cancel_flag
end
function gestureBreakFunc()
  print("BreakFunc!!!!!!")
  return _break_flag
end
_npc_kaiwa_table = {
  chi20 = {
    cnt = 0,
    kaiwa = "ep13_00133k"
  },
  gri01 = {
    cnt = 0,
    kaiwa = "ep13_00134k"
  }
}
function gestureNpcActionCallback(A0_18)
  local L1_19, L2_20
  if A0_18 then
    L2_20 = A0_18
    L1_19 = A0_18.getName
    L1_19 = L1_19(L2_20)
    L2_20 = Fn_userCtrlOff
    L2_20()
    L2_20 = A0_18.getWorldPos
    L2_20 = L2_20(A0_18)
    L2_20 = L2_20 + Vector(0, 1.2, 0)
    Player:setLookAtIk(true, 1, L2_20)
    waitSeconds(1)
    if _npc_kaiwa_table[L1_19].cnt == 0 then
      if L1_19 == "chi20" or L1_19 == "gri01" and _mobgri_kaiwa_happend == false then
        Fn_kaiwaDemoView(_npc_kaiwa_table[L1_19].kaiwa)
        _npc_known_cnt = _npc_known_cnt + 1
        print("_npc_known_cnt = ", _npc_known_cnt)
        print("getKnownCount = ", _gesture:getKnownCount())
        if L1_19 == "gri01" then
          _gri_gesture_check = Mv_safeTaskAbort(_gri_gesture_check)
          _npcgri_kaiwa_happend = true
        end
      end
    else
      print("2\229\155\158\231\155\174\228\187\165\233\153\141\227\129\175\231\132\161\229\143\141\229\191\156")
    end
    Player:setLookAtIk(false, 1, L2_20)
    Fn_userCtrlOn()
    _npc_kaiwa_table[L1_19].cnt = 1
  end
end
function startBirdSpeedChangeTask()
  return invokeTask(function()
    while true do
      if Fn_getDistanceToPlayer(_puppet_tbl.gull01) <= DIST_WHEN_SPEED_UP then
        _gull_npc:setFlyMoveSpeed(FAST_SPEED)
      else
        _gull_npc:setFlyMoveSpeed(SLOW_SPEED)
      end
      wait()
    end
    print("startBirdSpeedChangeTask\227\131\171\227\131\188\227\131\151\227\130\146\230\138\156\227\129\145\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  end)
end
function runawayNpcAction()
  invokeTask(function()
    local L0_21
    L0_21 = {
      "locator2_course01_middle",
      "locator2_course01_goal"
    }
    while Fn_moveNpc("runaway_npc01", L0_21, {runLength = -1}):isRunning() do
      wait()
    end
    while true do
      if Fn_isInSightTarget(_puppet_tbl.runaway_npc01, 1) == false then
        Fn_disappearNpc("runaway_npc01")
        print("runaway_npc01\230\182\136\229\142\187")
        break
      end
      wait()
    end
  end)
  invokeTask(function()
    local L0_22
    L0_22 = Fn_playMotionNpc
    L0_22("runaway_npc02", "surprise", false)
    L0_22 = wait
    L0_22(90)
    L0_22 = {
      "locator2_course02_middle",
      "locator2_course02_goal"
    }
    while Fn_moveNpc("runaway_npc02", L0_22, {
      runLength = -1,
      anim_run_speed = 1.5,
      anim_speed_over = true
    }):isRunning() do
      wait()
    end
    while true do
      if Fn_isInSightTarget(_puppet_tbl.runaway_npc02, 1) == false then
        Fn_disappearNpc("runaway_npc02")
        print("runaway_npc02\230\182\136\229\142\187")
        break
      end
      wait()
    end
  end)
  invokeTask(function()
    local L0_23
    L0_23 = {
      "locator2_course03_middle",
      "locator2_course03_goal"
    }
    while Fn_moveNpc("runaway_npc03", L0_23, {runLength = -1, arrivedLength = 2}):isRunning() do
      wait()
    end
    while true do
      if Fn_isInSightTarget(_puppet_tbl.runaway_npc03, 1) == false then
        Fn_disappearNpc("runaway_npc03")
        print("runaway_npc03\230\182\136\229\142\187")
        break
      end
      wait()
    end
  end)
end
