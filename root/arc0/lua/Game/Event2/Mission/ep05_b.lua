dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep05_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/gesture.lua")
REQIRED_UNKNOWN_CNT = 4
ADD_REQUIRED_UNKNOWN_CNT = 2
PATTERN_NODE_MAX = 7
SHOP_MAX = 6
_cat_navi_view = false
_more_important_navi_view = false
_view_pos = nil
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_now_in_hiroba = false
_thief_name = "npcgen2_thief_01"
_guide_name = "npcgen2_wom17_01"
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_b_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_hiroba_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_arrive_hiroba_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_hiroba_area_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_b_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_b_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_b_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_b_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_navi_kill_b_02")
  L0_0 = {
    {
      name = "npcgen2_man40_01",
      type = "man40",
      node = "locator2_man40_b_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_wom21_01",
      type = "wom21",
      node = "locator2_wom21_b_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_wom37_01",
      type = "wom37",
      node = "locator2_wom37_b_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_wom22_01",
      type = "wom22",
      node = "locator2_wom22_b_01",
      attach = true,
      reset = false
    },
    {
      name = "npcgen2_man37_01",
      type = "man37",
      node = "locator2_man37_b_01",
      attach = true,
      reset = false
    },
    {
      name = "opposite_bar",
      type = "wom30",
      node = "locator2_opposite_bar_b_01",
      attach = true,
      reset = false
    },
    {
      name = "ryz01",
      type = "ryz01",
      node = "locator2_ryz_b_01",
      attach = true,
      reset = false
    },
    {
      name = "ep05_follower01",
      type = "man50",
      node = "locator2_follower01_b_01",
      attach = true
    },
    {
      name = "ep05_follower02",
      type = "man51",
      node = "locator2_follower02_b_01",
      attach = true
    },
    {
      name = _guide_name,
      type = "wom17",
      node = "locator2_wom17_01",
      attach = true,
      reset = false,
      active = false
    },
    {
      name = _thief_name,
      type = "thief",
      node = "locator2_thief_01",
      attach = true
    }
  }
  Fn_setupNpc(L0_0)
  Fn_setNpcActive("npcgen2_chi12_01", false)
  Fn_setNpcActive(_thief_name, false)
  _gesture = GestureEvent.create(nil, gestureCancelFunc, gestureBreakFunc, gestureNpcActionCallback)
  _gesture:setNaviTarget(findGameObject2("Node", "locator2_hiroba_01"), nil, {positiveRate = 1})
  _gesture:setMobText(gestureMobText(0))
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
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
  L0_1 = Fn_setBgmPoint
  L1_2 = "event"
  L2_3 = "bgmpoint1"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_playMotionNpc
  L1_2 = "ep05_follower01"
  L2_3 = "count_00"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_playMotionNpc
  L1_2 = "ep05_follower02"
  L2_3 = "lookaround_02"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = {}
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "npcgen2_man40_01"
  L3_4 = "call_00"
  L4_5 = {L5_6}
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[1] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "npcgen2_wom21_01"
  L3_4 = "lookaround"
  L4_5 = {L5_6}
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[2] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "npcgen2_wom37_01"
  L3_4 = "call_00"
  L4_5 = {L5_6}
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[3] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "npcgen2_wom22_01"
  L3_4 = "lookaround"
  L4_5 = {L5_6}
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[4] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "npcgen2_man37_01"
  L3_4 = "stay"
  L4_5 = {L5_6}
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[5] = L1_2
  L1_2 = Fn_playLoopMotionInsert
  L2_3 = "opposite_bar"
  L3_4 = "call_00"
  L4_5 = {L5_6}
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1[6] = L1_2
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = findGameObject2
  L2_3 = "PlayerSensor"
  L3_4 = "pccubesensor2_b_01"
  L1_2 = L1_2(L2_3, L3_4)
  L2_3 = invokeTask
  function L3_4()
    Fn_missionView("ep05_01004")
    waitSeconds(1.3)
    Fn_naviSet(L1_2)
    waitSeconds(2.5)
    Fn_captionView("ep05_01003")
  end
  L2_3(L3_4)
  L2_3 = Mv_waitPhase
  L2_3()
  L2_3 = Fn_pcSensorOff
  L3_4 = "pccubesensor2_b_01"
  L2_3(L3_4)
  L2_3 = Fn_naviKill
  L2_3()
  L2_3 = Fn_pcSensorOff
  L3_4 = "pccubesensor2_catwarp_warning_b_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOff
  L3_4 = "pccubesensor2_catwarp_area_b_01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_catwarp_warning_b_02"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_catwarp_area_b_02"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_catwarp_navi_kill_b_02"
  L2_3(L3_4)
  L2_3 = Fn_setCatWarpCheckPoint
  L3_4 = "locator2_pc_catwarp_pos_b_02"
  L2_3(L3_4)
  L2_3 = Mv_viewObj
  L3_4 = L1_2
  L2_3 = L2_3(L3_4)
  L3_4 = Fn_setBgmPoint
  L4_5 = "event"
  L3_4(L4_5, L5_6)
  L3_4 = Fn_captionViewWait
  L4_5 = "ep05_01005"
  L3_4(L4_5)
  L3_4 = Fn_captionViewWait
  L4_5 = "ep05_01006"
  L3_4(L4_5)
  L3_4 = Mv_safeTaskAbort
  L4_5 = L2_3
  L3_4 = L3_4(L4_5)
  L2_3 = L3_4
  L3_4 = Fn_captionViewWait
  L4_5 = "ep05_01007"
  L3_4(L4_5)
  L3_4 = Fn_missionView
  L4_5 = "ep05_01008"
  L3_4(L4_5)
  L3_4 = Fn_pcSensorOn
  L4_5 = "pccubesensor2_hiroba_area_01"
  L3_4(L4_5)
  L3_4 = {}
  L4_5 = {}
  L4_5.in_game_preview = "k_photo_ep0501"
  L3_4.view = L4_5
  L4_5 = Fn_gamePreviewView
  L4_5(L5_6)
  L4_5 = _gesture
  L4_5 = L4_5.run
  L4_5(L5_6)
  L4_5 = print
  L4_5(L5_6)
  while true do
    while true do
      L4_5 = _gesture
      L4_5 = L4_5.getUnknownCount
      L4_5 = L4_5(L5_6)
      if L4_5 < L5_6 then
        L4_5 = _gesture
        L4_5 = L4_5.getKnownCount
        L4_5 = L4_5(L5_6)
        if L4_5 > 0 then
          L4_5 = _now_in_hiroba
          if L4_5 then
            L4_5 = _gesture
            L4_5 = L4_5.stop
            L4_5(L5_6)
            L4_5 = print
            L4_5(L5_6)
            L4_5 = Fn_pcSensorOff
            L4_5(L5_6)
            L4_5 = Fn_setCatWarpCheckPoint
            L4_5(L5_6)
            L4_5 = Fn_pcSensorOff
            L4_5(L5_6)
            L4_5 = Fn_naviKill
            L4_5()
            _cat_navi_view = false
            L4_5 = Mv_viewObjWait
            L4_5 = L4_5(L5_6)
            L5_6(L6_7)
            L4_5 = L5_6
            L9_10 = {}
            L9_10.positiveRate = 0
            L5_6(L6_7, L7_8, L8_9, L9_10)
            L5_6(L6_7)
            L5_6(L6_7)
            L5_6(L6_7)
            L5_6(L6_7)
            repeat
              L6_7()
            until L6_7 == L7_8
            break
          end
        end
      end
      L4_5 = wait
      L4_5()
    end
  end
  repeat
    L4_5 = wait
    L4_5()
    L4_5 = _gesture
    L4_5 = L4_5.isInteraction
    L4_5 = L4_5(L5_6)
  until L4_5 == false
  L4_5 = _gesture
  L4_5 = L4_5.stop
  L4_5(L5_6)
  _gesture = nil
  L4_5 = print
  L4_5(L5_6)
  L4_5 = HUD
  L4_5 = L4_5.inGamePreviewExit
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L4_5(L5_6)
  L4_5 = Fn_pcSensorOff
  L4_5(L5_6)
  L4_5 = waitSeconds
  L4_5(L5_6)
  L4_5 = Fn_captionViewWait
  L4_5(L5_6)
  L4_5 = {}
  for L8_9 = 1, PATTERN_NODE_MAX do
    L9_10 = "locator2_girl_pattern_"
    L10_11 = string
    L10_11 = L10_11.format
    L11_12 = "%02d"
    L12_13 = L8_9
    L10_11 = L10_11(L11_12, L12_13)
    L9_10 = L9_10 .. L10_11
    L10_11 = findGameObject2
    L11_12 = "Node"
    L12_13 = L9_10
    L10_11 = L10_11(L11_12, L12_13)
    if L10_11 ~= nil then
      L11_12 = {}
      L4_5[L8_9] = L11_12
      L11_12 = L4_5[L8_9]
      L11_12.node_name = L9_10
      L11_12 = L4_5[L8_9]
      L11_12.hdl = L10_11
      L11_12 = L4_5[L8_9]
      L12_13 = Fn_getDistanceToPlayer
      L12_13 = L12_13(L10_11)
      L11_12.dist = L12_13
    else
      break
    end
  end
  L5_6(L6_7, L7_8)
  for L9_10 = 2, PATTERN_NODE_MAX do
    L10_11 = Fn_isInSightTarget
    L11_12 = L4_5[L9_10]
    L11_12 = L11_12.hdl
    L12_13 = 1
    L10_11 = L10_11(L11_12, L12_13)
    if L10_11 == false then
      L10_11 = L4_5[L9_10]
      break
    end
  end
  L9_10 = L5_6
  L6_7(L7_8)
  L6_7(L7_8, L8_9)
  L6_7(L7_8, L8_9)
  L6_7(L7_8, L8_9)
  L6_7()
  L6_7(L7_8)
  L9_10 = 1.5
  L9_10 = 0
  L10_11 = 1
  L11_12 = 0
  L9_10 = L8_9
  L10_11 = true
  L11_12 = 1
  L12_13 = L7_8
  L8_9(L9_10, L10_11, L11_12, L12_13)
  L9_10 = "ep05_01011"
  L8_9(L9_10)
  L9_10 = _guide_name
  L10_11 = true
  L8_9(L9_10, L10_11)
  function L9_10()
    Fn_turnNpc("npcgen2_chi12_01")
    Fn_playMotionNpc("npcgen2_chi12_01", "greeting", false)
    L6_7 = Mv_safeTaskAbort(L6_7)
  end
  L8_9(L9_10)
  L9_10 = L8_9
  L10_11 = false
  L11_12 = 1
  L12_13 = L7_8
  L8_9(L9_10, L10_11, L11_12, L12_13)
  L8_9()
  L9_10 = L8_9
  L10_11 = 0
  L8_9(L9_10, L10_11)
  L9_10 = L8_9
  L10_11 = -1
  L8_9(L9_10, L10_11)
  L9_10 = "MultiNaviSet"
  L10_11 = Fn_findNpcPuppet
  L11_12 = "npcgen2_chi12_01"
  L12_13 = L10_11(L11_12)
  L8_9(L9_10, L10_11, L11_12, L12_13, L10_11(L11_12))
  _more_important_navi_view = true
  L9_10 = L8_9
  L10_11 = false
  L8_9(L9_10, L10_11)
  L8_9()
  while true do
    L9_10 = Fn_findNpcPuppet
    L10_11 = "npcgen2_chi12_01"
    L12_13 = L9_10(L10_11)
    if not (L8_9 < 2.5) then
      L9_10 = wait
      L9_10()
    end
  end
  L9_10 = "MultiNaviKill"
  L8_9(L9_10)
  _more_important_navi_view = false
  L9_10 = L8_9
  L10_11 = true
  L8_9(L9_10, L10_11)
  L8_9()
  L9_10 = "npcgen2_chi12_01"
  L8_9(L9_10)
  L9_10 = "ep05_00130k"
  L8_9(L9_10)
  L9_10 = "Node"
  L10_11 = "locator2_wom17_01"
  L9_10 = HUD
  L10_11 = L9_10
  L9_10 = L9_10.naviSetPochiDistanceDensity0
  L11_12 = 0
  L9_10(L10_11, L11_12)
  L9_10 = HUD
  L10_11 = L9_10
  L9_10 = L9_10.naviSetPochiDistanceDensity100
  L11_12 = -1
  L9_10(L10_11, L11_12)
  L9_10 = Fn_sendEventComSb
  L10_11 = "MultiNaviSet"
  L11_12 = Fn_findNpcPuppet
  L12_13 = "npcgen2_wom17_01"
  L12_13 = L11_12(L12_13)
  L9_10(L10_11, L11_12, L12_13, L11_12(L12_13))
  _more_important_navi_view = true
  L9_10 = Mv_viewObj
  L10_11 = "locator2_wom17_01"
  L11_12 = 0.5
  L12_13 = 1.5
  L9_10 = L9_10(L10_11, L11_12, L12_13)
  L10_11 = Fn_findNpcPuppet
  L11_12 = _guide_name
  L10_11 = L10_11(L11_12)
  L11_12 = L10_11
  L10_11 = L10_11.getWorldPos
  L10_11 = L10_11(L11_12)
  L11_12 = Vector
  L12_13 = 0
  L11_12 = L11_12(L12_13, 1.5, 0)
  L10_11 = L10_11 + L11_12
  L11_12 = Player
  L12_13 = L11_12
  L11_12 = L11_12.setLookAtIk
  L11_12(L12_13, true, 1, L10_11)
  L11_12 = Fn_turnNpc
  L12_13 = "npcgen2_chi12_01"
  L11_12(L12_13, "locator2_wom17_01")
  L11_12 = Fn_playMotionNpc
  L12_13 = "npcgen2_chi12_01"
  L11_12(L12_13, "inform_lp", false)
  L11_12 = Fn_captionViewWait
  L12_13 = "ep05_01012"
  L11_12(L12_13)
  L11_12 = Mv_safeTaskAbort
  L12_13 = L9_10
  L11_12 = L11_12(L12_13)
  L9_10 = L11_12
  L11_12 = Fn_playMotionNpc
  L12_13 = "npcgen2_chi12_01"
  L11_12(L12_13, "stay", false)
  L11_12 = Player
  L12_13 = L11_12
  L11_12 = L11_12.setLookAtIk
  L11_12(L12_13, false, 1, L10_11)
  L11_12 = wait
  L12_13 = 1
  L11_12(L12_13)
  L11_12 = Player
  L12_13 = L11_12
  L11_12 = L11_12.setLookAtIk
  L11_12(L12_13, true, 1, L7_8)
  L11_12 = Fn_captionView
  L12_13 = "ep05_01013"
  L11_12(L12_13)
  L11_12 = Player
  L12_13 = L11_12
  L11_12 = L11_12.setLookAtIk
  L11_12(L12_13, false, 1, L7_8)
  L11_12 = Player
  L12_13 = L11_12
  L11_12 = L11_12.setStay
  L11_12(L12_13, false)
  L11_12 = Fn_userCtrlOn
  L11_12()
  L11_12 = Fn_setCatWarpCheckPoint
  L12_13 = "locator2_pcpos_hiroba_02"
  L11_12(L12_13)
  function L11_12()
    local L0_14, L1_15, L2_16, L3_17, L4_18
    L0_14 = Fn_setGestureAction
    L1_15 = Fn_findNpcPuppet
    L2_16 = _guide_name
    L1_15 = L1_15(L2_16)
    L2_16 = false
    L0_14(L1_15, L2_16)
    L0_14 = Fn_sendEventComSb
    L1_15 = "vogoBoxTaskAbort"
    L0_14(L1_15)
    L0_14 = Fn_findNpcPuppet
    L1_15 = _guide_name
    L0_14 = L0_14(L1_15)
    L1_15 = L0_14
    L0_14 = L0_14.getWorldPos
    L0_14 = L0_14(L1_15)
    L1_15 = Vector
    L2_16 = 0
    L3_17 = 1.5
    L4_18 = 0
    L1_15 = L1_15(L2_16, L3_17, L4_18)
    L0_14 = L0_14 + L1_15
    L1_15 = Player
    L2_16 = L1_15
    L1_15 = L1_15.setLookAtIk
    L3_17 = true
    L4_18 = 1
    L1_15(L2_16, L3_17, L4_18, L0_14)
    L1_15 = Fn_sendEventComSb
    L2_16 = "MultiNaviKill"
    L1_15(L2_16)
    L1_15 = Fn_userCtrlAllOff
    L1_15()
    L1_15 = Fn_setNpcActive
    L2_16 = _thief_name
    L3_17 = true
    L1_15(L2_16, L3_17)
    L1_15 = Fn_turnNpc
    L2_16 = _guide_name
    L1_15(L2_16)
    L1_15 = Fn_captionViewWait
    L2_16 = "ep05_01000"
    L1_15(L2_16)
    L1_15 = {}
    L1_15.anim_in = "inform_in"
    L1_15.anim_lp = "inform_lp"
    L1_15.anim_out = "inform_ed"
    L1_15.anim_stay = "stay"
    L2_16 = Mv_informNpc
    L3_17 = _guide_name
    L4_18 = "locator2_thief_01"
    L2_16(L3_17, L4_18, L1_15)
    L2_16 = Player
    L3_17 = L2_16
    L2_16 = L2_16.setLookAtIk
    L4_18 = false
    L2_16(L3_17, L4_18, 1, L0_14)
    L2_16 = Fn_findNpcPuppet
    L3_17 = _thief_name
    L2_16 = L2_16(L3_17)
    L3_17 = L2_16
    L2_16 = L2_16.getWorldPos
    L2_16 = L2_16(L3_17)
    L3_17 = Vector
    L4_18 = 0
    L3_17 = L3_17(L4_18, 1.7, 0)
    L2_16 = L2_16 + L3_17
    L3_17 = Player
    L4_18 = L3_17
    L3_17 = L3_17.setLookAtIk
    L3_17(L4_18, true, 1, L2_16)
    L3_17 = Mv_viewObjWait
    L4_18 = "locator2_thief_01"
    L3_17 = L3_17(L4_18, 0.3, 1.5)
    L4_18 = HUD
    L4_18 = L4_18.naviSetPochiDistanceDensity0
    L4_18(L4_18, 0)
    L4_18 = HUD
    L4_18 = L4_18.naviSetPochiDistanceDensity100
    L4_18(L4_18, -1)
    L4_18 = Fn_sendEventComSb
    L4_18("MultiNaviSet", Fn_findNpcPuppet("npcgen2_thief_01"))
    L4_18 = Fn_captionViewWait
    L4_18("ep05_01001")
    L4_18 = nil
    invokeTask(function()
      waitSeconds(1.5)
      L4_18 = Fn_moveNpc(_thief_name, {
        "locator2_thief_move_pos_02_a"
      }, {runLength = 100, arrivedLength = 0})
    end)
    Fn_captionViewWait("ep05_01002")
    L3_17 = Mv_safeTaskAbort(L3_17)
    Fn_findNpc(_guide_name):informEnd()
    Player:setLookAtIk(false, 1, L2_16)
    Fn_userCtrlOn()
    if Mv_isSafeTaskRunning(L4_18) then
      L4_18 = Mv_safeTaskAbort(L4_18)
    end
    for _FORV_8_ = 1, SHOP_MAX do
      L0_1[_FORV_8_] = Mv_safeTaskAbort(L0_1[_FORV_8_])
    end
    _FOR_()
  end
  L12_13 = {}
  L12_13.RL = {
    id = "ui_event_guide_02",
    func = L11_12
  }
  Fn_setupGestureAction({
    target = Fn_findNpcPuppet(_guide_name)
  }, L12_13, nil, nil, true)
  start_game_obj()
  Mv_waitPhase()
  Fn_disappearNpc("npcgen2_man40_01")
  Fn_disappearNpc("npcgen2_wom21_01")
  Fn_disappearNpc("npcgen2_wom37_01")
  Fn_disappearNpc("npcgen2_wom22_01")
  Fn_disappearNpc("npcgen2_man37_01")
  Fn_disappearNpc("opposite_bar")
  Fn_disappearNpc("ryz01")
  Fn_disappearNpc("ep05_follower01")
  Fn_disappearNpc("ep05_follower02")
  Fn_disappearNpc("ep05_vogo_01")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_19, L1_20
end
function pccubesensor2_b_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_b_01_OnLeave()
  local L0_21, L1_22
end
function pccubesensor2_hiroba_area_01_OnEnter()
  _now_in_hiroba = true
  if _gesture ~= nil then
    _gesture:setNaviTarget(nil, nil, {positiveRate = 0})
  end
  print("\229\186\131\229\160\180\227\129\171\229\136\176\233\129\148\239\188\154\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\232\168\173\229\174\154\229\136\135\230\155\191")
end
function pccubesensor2_hiroba_area_01_OnLeave()
  _now_in_hiroba = false
  if _gesture ~= nil then
    _gesture:setNaviTarget(nil, nil, {positiveRate = 1})
  end
  print("\229\186\131\229\160\180\227\129\139\227\130\137\233\155\162\227\130\140\227\129\159\239\188\154\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\232\168\173\229\174\154\229\136\135\230\155\191")
end
function pccubesensor2_arrive_hiroba_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_arrive_hiroba_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_hiroba_area_02_OnEnter()
  Fn_naviKill()
  _more_important_navi_view = false
  Fn_captionViewEnd()
  _gesture:run()
  print("\229\186\131\229\160\180\227\129\171\229\136\176\233\129\148\239\188\154\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188ON")
end
function pccubesensor2_hiroba_area_02_OnLeave()
  _gesture:stop()
  print("\229\186\131\229\160\180\227\129\139\227\130\137\233\155\162\227\130\140\227\129\159\239\188\154\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\228\184\128\230\153\130\229\129\156\230\173\162")
  Fn_naviSet(findGameObject2("Node", "locator2_hiroba_01"))
  _more_important_navi_view = true
  Fn_captionView("ep05_01026")
end
function pccubesensor2_catwarp_warning_b_01_OnLeave()
  invokeTask(function()
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    Fn_captionViewWait("ep05_09000")
  end)
end
function pccubesensor2_catwarp_area_b_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_warning_b_02_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    if _more_important_navi_view == false then
      Fn_naviSet(findGameObject2("Node", "pccubesensor2_catwarp_warning_b_02"))
      _cat_navi_view = true
    end
    Fn_captionViewWait("ep05_09000")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_area_b_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_navi_kill_b_02_OnEnter()
  if _cat_navi_view then
    Fn_naviKill()
    _cat_navi_view = false
  end
end
function gestureCancelFunc()
  _decide_flag = true
  print("cansel_func\229\134\133")
  return _cancel_flag
end
function gestureBreakFunc()
  print("break_func\229\134\133")
  return _break_flag
end
function gestureMobText(A0_23)
  local L1_24, L2_25, L3_26
  L1_24 = {}
  if A0_23 == 0 then
    L2_25 = {}
    L3_26 = {
      {
        reply_yes = {text = "ep05_01023", time = 2},
        reply_no = {text = "ep05_01022", time = 2}
      }
    }
    L2_25.other = L3_26
    L1_24 = L2_25
  elseif A0_23 == 1 then
    L2_25 = {}
    L3_26 = {
      {
        reply_yes = {text = "ep05_01021", time = 2},
        reply_no = {text = "ep05_01022", time = 2}
      }
    }
    L2_25.other = L3_26
    L1_24 = L2_25
  end
  return L1_24
end
