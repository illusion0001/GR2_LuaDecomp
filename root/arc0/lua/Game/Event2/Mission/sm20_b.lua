dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm20_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_puppet_tbl = {}
_event_sensor_in = nil
_warning_area_on = false
_guide_area_on = false
_next_phase = false
_dog_call = false
_navi_on = false
_gesture_icon_on = false
_gesture_task_through = false
_mnavi_hdl = nil
_mnavi_task = nil
_skip_num = nil
DOG_CALL_DIST = 30
_event_tbl = {
  {
    node = "locator2_event_01",
    happen = false,
    gimmick = true
  },
  {
    node = "locator2_event_02",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_03",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_04",
    happen = false,
    gimmick = true
  },
  {
    node = "locator2_event_05",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_06",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_07",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_08",
    happen = false,
    gimmick = true
  }
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_chi_search_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_girl_02")
  L0_0 = {
    {
      name = "girl01",
      type = "chi16",
      node = "locator2_girl_pos_01b",
      active = false,
      color_variation = 1
    },
    {
      name = "gimmick_01",
      type = "man49",
      node = "locator2_event_01"
    },
    {
      name = "gimmick_02",
      type = "wom27",
      node = "locator2_event_02"
    },
    {
      name = "gimmick_04",
      type = "chi15",
      node = "locator2_event_04"
    },
    {
      name = "gimmick_05",
      type = "duck01",
      node = "locator2_event_05"
    },
    {
      name = "gimmick_06",
      type = "man57",
      node = "locator2_event_06"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _dog_npc = Fn_findNpc("sm20_dog_01")
  _dog_puppet = Fn_findNpcPuppet("sm20_dog_01")
  Fn_loadPlayerMotion({
    "kit01_shout_00"
  })
  _sdemo_cut01 = SDemo.create("sm20_b_cut01")
  _sdemo_cut02 = SDemo.create("sm20_b_cut02")
  Mob:restrict_sm20_00(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_resetPcPos
  L0_1(L1_2)
  L0_1 = Fn_warpNpc
  L0_1(L1_2, L2_3)
  L0_1 = {}
  for L4_5 = 1, 3 do
    L7_8 = string
    L7_8 = L7_8.format
    L8_9 = "%02d"
    L9_10 = L4_5
    L7_8 = L7_8(L8_9, L9_10)
    L7_8 = "event_barrel_"
    L8_9 = string
    L8_9 = L8_9.format
    L9_10 = "%02d"
    L10_11 = L4_5
    L8_9 = L8_9(L9_10, L10_11)
    L7_8 = L7_8 .. L8_9
    L8_9 = "barrel_kk_01"
    L9_10 = true
    L10_11 = "box_ms_02_event_01"
    L0_1[L4_5] = L5_6
    L7_8 = 0
    L5_6(L6_7, L7_8)
  end
  for L6_7 = 1, L2_3 do
    if L6_7 < 26 then
      L7_8 = Fn_createGimmickBg
      L8_9 = "locator2_box"
      L9_10 = string
      L9_10 = L9_10.format
      L10_11 = "%02d"
      L11_12 = L6_7
      L9_10 = L9_10(L10_11, L11_12)
      L8_9 = L8_9 .. L9_10
      L9_10 = "box_"
      L10_11 = string
      L10_11 = L10_11.format
      L11_12 = "%02d"
      L12_13 = L6_7
      L10_11 = L10_11(L11_12, L12_13)
      L9_10 = L9_10 .. L10_11
      L10_11 = "woodbox_kk_02"
      L11_12 = true
      L12_13 = "box_ms_02_event_01"
      L7_8 = L7_8(L8_9, L9_10, L10_11, L11_12, L12_13)
      L1_2[L6_7] = L7_8
    else
      L7_8 = Fn_createGimmickBg
      L8_9 = "locator2_box"
      L9_10 = string
      L9_10 = L9_10.format
      L10_11 = "%02d"
      L11_12 = L6_7
      L9_10 = L9_10(L10_11, L11_12)
      L8_9 = L8_9 .. L9_10
      L9_10 = "box_"
      L10_11 = string
      L10_11 = L10_11.format
      L11_12 = "%02d"
      L12_13 = L6_7
      L10_11 = L10_11(L11_12, L12_13)
      L9_10 = L9_10 .. L10_11
      L10_11 = "woodbox_sk_02"
      L11_12 = true
      L12_13 = "box_ms_02_event_01"
      L7_8 = L7_8(L8_9, L9_10, L10_11, L11_12, L12_13)
      L1_2[L6_7] = L7_8
    end
    L7_8 = L1_2[L6_7]
    L8_9 = L7_8
    L7_8 = L7_8.setMoveThreshold
    L9_10 = 0
    L7_8(L8_9, L9_10)
    L7_8 = L1_2[L6_7]
    L8_9 = L7_8
    L7_8 = L7_8.setIgnoreGrab
    L9_10 = true
    L7_8(L8_9, L9_10)
  end
  L7_8 = "barrel_kk_01"
  L8_9 = true
  L9_10 = "box_ms_02_event_01"
  L3_4[1] = L4_5
  L7_8 = "barrel_kk_01"
  L8_9 = true
  L9_10 = "box_ms_02_event_01"
  L3_4[2] = L4_5
  L7_8 = "barrel_kk_01"
  L8_9 = true
  L9_10 = "box_ms_02_event_01"
  L3_4[3] = L4_5
  L7_8 = "barrel_kk_01"
  L8_9 = true
  L9_10 = "box_ms_02_event_01"
  L3_4[4] = L4_5
  for L7_8 = 1, 4 do
    L8_9 = L3_4[L7_8]
    L9_10 = L8_9
    L8_9 = L8_9.setMoveThreshold
    L10_11 = 0
    L8_9(L9_10, L10_11)
    L8_9 = L3_4[L7_8]
    L9_10 = L8_9
    L8_9 = L8_9.setIgnoreGrab
    L10_11 = true
    L8_9(L9_10, L10_11)
    L8_9 = L3_4[L7_8]
    L9_10 = L8_9
    L8_9 = L8_9.setAttributeName
    L10_11 = "box_ms_02_event_01"
    L8_9(L9_10, L10_11)
  end
  L7_8 = false
  L4_5(L5_6, L6_7, L7_8)
  L7_8 = false
  L4_5(L5_6, L6_7, L7_8)
  L7_8 = false
  L4_5(L5_6, L6_7, L7_8)
  L7_8 = false
  L4_5(L5_6, L6_7, L7_8)
  L7_8 = false
  L4_5(L5_6, L6_7, L7_8)
  L7_8 = "locator2_sdemo_view_aim_01"
  L8_9 = false
  L4_5(L5_6, L6_7, L7_8, L8_9)
  L4_5(L5_6)
  L4_5()
  L5_6.pos = "locator2_sdemo_view_aim_02"
  L5_6.time = 1.5
  L7_8 = nil
  L8_9 = L4_5
  L5_6(L6_7, L7_8, L8_9)
  while true do
    if L5_6 then
      L5_6()
    end
  end
  L5_6(L6_7)
  L7_8 = 2
  L5_6(L6_7, L7_8)
  L5_6(L6_7)
  L5_6(L6_7)
  L5_6(L6_7)
  L5_6()
  L5_6(L6_7)
  L5_6(L6_7)
  L5_6.runLength = 6
  L5_6.arrivedLength = 3
  L5_6.navimesh = true
  L5_6.recast = true
  L6_7.runLength = 3
  L6_7.arrivedLength = 3
  L6_7.navimesh = true
  L6_7.recast = true
  L7_8 = {}
  L7_8.runLength = 1000
  L8_9 = DOG_CALL_DIST
  L7_8.arrivedLength = L8_9
  L7_8.navimesh = true
  L7_8.recast = true
  L8_9 = HUD
  L9_10 = L8_9
  L8_9 = L8_9.mnaviNew
  L10_11 = {}
  L10_11.name = "dog_navi"
  L10_11.PochFadeLen0 = 5
  L10_11.PochFadeLen100 = 20
  L8_9 = L8_9(L9_10, L10_11)
  _mnavi_hdl = L8_9
  L8_9 = createGameObject2
  L9_10 = "Node"
  L8_9 = L8_9(L9_10)
  L10_11 = L8_9
  L9_10 = L8_9.setPos
  L11_12 = Vector
  L12_13 = 0
  L13_14 = 0.3
  L14_15 = 0
  L19_20 = L11_12(L12_13, L13_14, L14_15)
  L9_10(L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L11_12(L12_13, L13_14, L14_15))
  L9_10 = _dog_puppet
  L10_11 = L9_10
  L9_10 = L9_10.appendChild
  L11_12 = L8_9
  L9_10(L10_11, L11_12)
  L9_10 = _mnavi_hdl
  L10_11 = L9_10
  L9_10 = L9_10.setTarget
  L11_12 = L8_9
  L9_10(L10_11, L11_12)
  L9_10 = start_game_obj
  L9_10()
  L9_10 = nil
  L10_11 = false
  L11_12 = nil
  L12_13 = false
  L13_14 = nil
  L14_15 = false
  L15_16 = 0
  while true do
    if not L16_17 then
      if not L17_18 then
        L17_18()
        _gesture_icon_on = true
      end
      while true do
        if not L17_18 then
          if L17_18 ~= L18_19 then
            if L17_18 ~= L18_19 then
              if L18_19 then
                L18_19()
                _gesture_icon_on = false
              end
            end
          end
          if L17_18 ~= L18_19 then
          elseif L17_18 == L18_19 then
            if not L18_19 then
              if not L18_19 then
                if not L18_19 then
                  L18_19()
                  _gesture_icon_on = true
                end
              end
            end
          end
          L18_19()
        end
      end
      if L9_10 ~= nil then
        L19_20 = false
        L17_18(L18_19, L19_20)
      end
      if L17_18 then
        L17_18()
        _gesture_icon_on = false
        break
      end
    end
    if L17_18 ~= nil then
      _skip_num = L17_18
      L17_18.happen = false
      _skip_num = nil
    end
    L11_12 = L17_18
    L17_18()
    L19_20 = "sm20_dog_01"
    if L14_15 then
      L19_20 = Mv_safeTaskAbort
      L19_20 = L19_20(L13_14)
      L13_14 = L19_20
      L19_20 = invokeTask
      L19_20(function()
        if L15_16 == "01" then
          Fn_playMotionNpc("gimmick_01", "lookaround_01", false, {animBlendDuration = 1})
          waitSeconds(1)
          Fn_turnNpc("gimmick_01", "locator2_event_01_view")
          Fn_playMotionNpc("gimmick_01", "lookaround_01", false)
        elseif L15_16 == "04" then
          Fn_playMotionNpc("gimmick_04", "stay_01", false, {animBlendDuration = 1})
          waitSeconds(1)
          Fn_turnNpc("gimmick_04", "locator2_event_04_view")
          Fn_playMotionNpc("gimmick_04", "stay_01", false)
        end
        L14_15 = false
      end)
    end
    while true do
      L19_20 = L18_19.isRunning
      L19_20 = L19_20(L18_19)
      if L19_20 then
        L19_20 = wait
        L19_20()
      end
    end
    L12_13 = true
    L19_20 = Sound
    L19_20 = L19_20.pulse
    L19_20(L19_20, "dog_bark")
    L19_20 = invokeTask
    L19_20(function()
      Fn_playMotionNpc("sm20_dog_01", "bark", false)
      waitSeconds(0.7)
      Fn_playMotionNpc("sm20_dog_01", "stay", false)
      waitSeconds(2.8)
      L12_13 = false
    end)
    _dog_call = false
    L19_20 = wait
    L19_20()
  end
  L16_17()
  _mnavi_task = L16_17
  if L16_17 then
    L16_17(L17_18, L18_19)
  end
  L16_17()
  L19_20 = "locator2_hide_aim_01"
  L16_17(L17_18, L18_19, L19_20, false)
  L16_17(L17_18)
  L16_17(L17_18, L18_19)
  L16_17(L17_18)
  for L19_20 = 1, L2_3 do
    L1_2[L19_20]:requestRestoreForce()
  end
  for L19_20 = 1, 4 do
    L3_4[L19_20]:requestRestoreForce()
  end
  L19_20 = "Node"
  L19_20 = L18_19
  L19_20 = L18_19(L19_20)
  L16_17(L17_18, L18_19, L19_20, L18_19(L19_20))
  L16_17(L17_18)
  L19_20 = "Node"
  L19_20 = L18_19
  L19_20 = L18_19(L19_20)
  L16_17(L17_18, L18_19, L19_20, L18_19(L19_20))
  L16_17(L17_18)
  L16_17(L17_18, L18_19)
  L19_20 = true
  L16_17(L17_18, L18_19, L19_20)
  L16_17()
  L16_17(L17_18)
  L19_20 = true
  L16_17(L17_18, L18_19, L19_20)
  L16_17(L17_18)
  L19_20 = false
  L16_17(L17_18, L18_19, L19_20)
  L16_17()
  for L19_20 = 1, 7 do
    if L19_20 ~= 3 then
      Fn_disappearNpc("gimmick_" .. string.format("%02d", L19_20))
    end
  end
  L16_17(L17_18)
  L16_17()
  L16_17()
  L16_17()
  L16_17()
end
function Finalize()
  Mob:restrict_sm20_00(false)
end
function event_sensor_OnEnter()
  local L0_21, L1_22
  _event_sensor_in = true
end
function pccubesensor2_chi_guide_range_01_OnEnter()
  _guide_area_on = false
  if not _navi_on then
    Fn_naviKill()
  end
end
function pccubesensor2_chi_guide_range_01_OnLeave()
  _guide_area_on = true
  if not _navi_on then
    Fn_naviSet(findGameObject2("Node", "locator2_guide"))
  end
  Fn_captionView("sm20_01009")
end
function pccubesensor2_chi_search_area_01_OnLeave()
  _warning_area_on = true
  Fn_gestureActionCancel()
  _gesture_icon_on = false
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  Fn_captionView("sm20_01010")
end
function pccubesensor2_chi_search_area_01_OnEnter()
  local L0_23, L1_24
  _warning_area_on = false
end
function pccubesensor2_chi_nekowarp_area_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function entryGestureAction()
  local L0_25, L1_26
  function L0_25()
    local L0_27, L1_28, L2_29
    L0_27 = Fn_userCtrlOff
    L0_27()
    _gesture_task_through = true
    _gesture_icon_on = false
    L0_27 = Fn_playerTurn
    L1_28 = _dog_puppet
    L0_27(L1_28)
    L0_27 = waitSeconds
    L1_28 = 1
    L0_27(L1_28)
    L0_27 = {L1_28, L2_29}
    L1_28 = "sm20_01011"
    L2_29 = "sm20_01012"
    L1_28 = RandI
    L2_29 = 1
    L1_28 = L1_28(L2_29, 2)
    L2_29 = invokeTask
    L2_29(function()
      waitSeconds(0.5)
      Fn_captionView(L0_27[L1_28])
      Sound:pulse("kit029")
    end)
    L2_29 = Fn_playPlayerMotionWait
    L2_29("kit01_shout_00", 0, 0.3, true)
    L2_29 = Fn_playerTurnEnd
    L2_29()
    L2_29 = Mv_safeTaskAbort
    L2_29 = L2_29(_mnavi_task)
    _mnavi_task = L2_29
    L2_29 = _mnavi_hdl
    L2_29 = L2_29.setActive
    L2_29(L2_29, true)
    L2_29 = invokeTask
    L2_29 = L2_29(function()
      waitSeconds(10)
      _mnavi_hdl:setActive(false)
    end)
    _mnavi_task = L2_29
    L2_29 = Fn_getDistanceToPlayer
    L2_29 = L2_29(_dog_puppet)
    print("\231\138\172\227\129\168\227\129\174\232\183\157\233\155\162\227\129\175" .. L2_29)
    if L2_29 <= DOG_CALL_DIST and Fn_isInSightTarget(_dog_puppet, 1) then
      _dog_call = true
      Fn_naviKill()
      _navi_on = false
    else
      invokeTask(function()
        waitSeconds(1.5)
        if not _gesture_task_through and not _next_phase then
          Fn_captionView("sm20_09001")
        end
      end)
    end
    _gesture_task_through = false
    Fn_userCtrlOn()
  end
  L1_26 = {}
  L1_26.RL = {id = "sm20_00118", func = L0_25}
  Fn_gestureAction(L1_26)
end
