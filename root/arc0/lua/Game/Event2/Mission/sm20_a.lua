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
_mnavi_task = nil
_mnavi_hdl = nil
_skip_num = nil
_dog_call_area_flag = false
DOG_CALL_DIST = 20
_event_tbl = {
  {
    node = "locator2_event_01",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_02",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_03",
    happen = false,
    gimmick = true
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
    gimmick = true
  },
  {
    node = "locator2_event_07",
    happen = false,
    gimmick = true
  },
  {
    node = "locator2_event_08",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_09",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_10",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_11",
    happen = false,
    gimmick = false
  },
  {
    node = "locator2_event_12",
    happen = false,
    gimmick = true
  },
  {
    node = "locator2_event_13",
    happen = false,
    gimmick = true
  }
}
function Initialize()
  local L0_0, L1_1
  L0_0 = loadFileAsset
  L1_1 = "nvm"
  L0_0 = L0_0(L1_1, "up_a_00_custom01")
  if L0_0 ~= nil then
    L1_1 = print
    L1_1("\227\131\138\227\131\147\227\131\161\227\131\131\227\130\183\227\131\165\227\129\130\227\130\138")
    L1_1 = L0_0.wait
    L1_1(L0_0)
    L1_1 = Fn_findAreaHandle
    L1_1 = L1_1("up_a_00")
    if L1_1 ~= nil then
      print("nil\227\129\167\227\129\170\227\129\132")
      L1_1:addNaviMeshAsset(L0_0)
    end
  else
    L1_1 = print
    L1_1("\227\131\138\227\131\147\227\131\161\227\131\131\227\130\183\227\131\165\227\129\170\227\129\151")
  end
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_guide_range_01")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_course_area_01")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_nekowarp_range")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensormulti2_dog_call_01")
  L1_1 = {
    {
      name = "girl01",
      type = "chi16",
      node = "locator2_girl_pos_01",
      active = false,
      color_variation = 1
    },
    {
      name = "girl02",
      type = "chi16",
      node = "locator2_girl_escape_reset_pos_01",
      active = false,
      color_variation = 1
    },
    {
      name = "gimmick_01",
      type = "dog03",
      node = "locator2_event_01"
    },
    {
      name = "gimmick_02",
      type = "chi15",
      node = "locator2_event_02"
    },
    {
      name = "gimmick_03",
      type = "wom27",
      node = "locator2_event_03"
    },
    {
      name = "gimmick_04",
      type = "gull01",
      node = "locator2_event_bird_01",
      active = false
    },
    {
      name = "gimmick_05",
      type = "duck01",
      node = "locator2_event_05"
    },
    {
      name = "gimmick_06",
      type = "gull01",
      node = "locator2_event_bird_02",
      active = false
    },
    {
      name = "gimmick_06_a",
      type = "gull01",
      node = "locator2_event_bird_03",
      active = false
    },
    {
      name = "gimmick_06_b",
      type = "gull01",
      node = "locator2_event_bird_04",
      active = false
    },
    {
      name = "gimmick_07",
      type = "dog03",
      node = "locator2_event_dog_01",
      active = false
    },
    {
      name = "gimmick_08",
      type = "man49",
      node = "locator2_event_08"
    },
    {
      name = "gimmick_12",
      type = "man48",
      node = "locator2_event_12"
    },
    {
      name = "gimmick_13",
      type = "man46",
      node = "locator2_event_13"
    }
  }
  Fn_setupNpc(L1_1)
  for _FORV_5_, _FORV_6_ in pairs(L1_1) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  _dog_puppet = Fn_findNpcPuppet("sm20_dog_01")
  Fn_loadPlayerMotion({
    "kit01_shout_00"
  })
  _sdemo_cut01 = SDemo.create("sm20_a_cut01")
  _sdemo_cut02 = SDemo.create("sm21_a_cut02")
  _sdemo_cut03 = SDemo.create("sm21_a_cut03")
  _sdemo_cut04 = SDemo.create("sm21_a_cut04")
  Mob:restrict_sm20_00(true)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21
  L0_2 = Fn_userCtrlAllOff
  L0_2()
  L0_2 = {}
  L0_2.idle = "chi01_idle_up_00"
  L1_3 = Fn_loadNpcEventMotion
  L1_3(L2_4, L3_5)
  L1_3 = Fn_playMotionNpc
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Fn_playMotionNpc
  L1_3(L2_4, L3_5, L4_6)
  L1_3 = Fn_missionStart
  L1_3()
  L1_3 = Fn_turnNpc
  L19_21 = L3_5()
  L1_3(L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L3_5())
  L1_3 = Fn_kaiwaDemoView
  L1_3(L2_4)
  L1_3 = Fn_blackout
  L1_3()
  L1_3 = Fn_pcSensorOn
  L1_3(L2_4)
  L1_3 = {}
  for L5_7 = 1, 3 do
    L6_8 = Fn_createGimmickBg
    L7_9 = "locator2_event_barrel_"
    L8_10 = string
    L8_10 = L8_10.format
    L9_11 = "%02d"
    L10_12 = L5_7
    L8_10 = L8_10(L9_11, L10_12)
    L7_9 = L7_9 .. L8_10
    L8_10 = "barrel_"
    L9_11 = string
    L9_11 = L9_11.format
    L10_12 = "%02d"
    L11_13 = L5_7
    L9_11 = L9_11(L10_12, L11_13)
    L8_10 = L8_10 .. L9_11
    L9_11 = "barrel_kk_01"
    L10_12 = true
    L11_13 = "box_ms_02_event_01"
    L6_8 = L6_8(L7_9, L8_10, L9_11, L10_12, L11_13)
    L1_3[L5_7] = L6_8
    L6_8 = L1_3[L5_7]
    L7_9 = L6_8
    L6_8 = L6_8.setMoveThreshold
    L8_10 = 0
    L6_8(L7_9, L8_10)
  end
  L5_7 = false
  L2_4(L3_5, L4_6, L5_7)
  L2_4(L3_5, L4_6)
  L2_4(L3_5, L4_6)
  L2_4(L3_5)
  L5_7 = "locator2_sdemo_view_aim_01"
  L6_8 = false
  L2_4(L3_5, L4_6, L5_7, L6_8)
  L2_4(L3_5)
  L2_4()
  L3_5.pos = "locator2_sdemo_view_aim_02"
  L3_5.time = 4.5
  L5_7 = cam_point
  L6_8 = L2_4
  L3_5(L4_6, L5_7, L6_8)
  while true do
    if L3_5 then
      L3_5()
    end
  end
  L3_5(L4_6)
  L5_7 = 2
  L3_5(L4_6, L5_7)
  L3_5(L4_6)
  L3_5(L4_6)
  L5_7 = "dog_bark"
  L3_5(L4_6, L5_7)
  L3_5(L4_6)
  L3_5(L4_6)
  L5_7 = "sm20_info_01"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L3_5()
  L3_5(L4_6)
  L3_5()
  L5_7 = "sit"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L5_7 = "stay_01"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L5_7 = "photo_03"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L5_7 = "stay_01"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L5_7 = "lookaround_01"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L5_7 = "stay_02"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L5_7 = "lookaround_02"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L5_7 = "stay_01"
  L6_8 = false
  L3_5(L4_6, L5_7, L6_8)
  L3_5(L4_6)
  L3_5(L4_6)
  L3_5(L4_6)
  L3_5(L4_6)
  L3_5(L4_6)
  L3_5.runLength = 6
  L3_5.arrivedLength = 3
  L3_5.navimesh = "up_a_00_custom01"
  L3_5.recast = false
  L4_6.runLength = 3
  L4_6.arrivedLength = 3
  L4_6.navimesh = "up_a_00_custom01"
  L4_6.recast = false
  L5_7 = {}
  L5_7.runLength = 1000
  L6_8 = DOG_CALL_DIST
  L5_7.arrivedLength = L6_8
  L5_7.navimesh = "up_a_00_custom01"
  L5_7.recast = false
  L6_8 = HUD
  L7_9 = L6_8
  L6_8 = L6_8.mnaviNew
  L8_10 = {}
  L8_10.name = "dog_navi"
  L8_10.PochFadeLen0 = 5
  L8_10.PochFadeLen100 = 20
  L6_8 = L6_8(L7_9, L8_10)
  _mnavi_hdl = L6_8
  L6_8 = createGameObject2
  L7_9 = "Node"
  L6_8 = L6_8(L7_9)
  L8_10 = L6_8
  L7_9 = L6_8.setPos
  L9_11 = Vector
  L10_12 = 0
  L11_13 = 0.3
  L12_14 = 0
  L19_21 = L9_11(L10_12, L11_13, L12_14)
  L7_9(L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16, L15_17, L16_18, L17_19, L18_20, L19_21, L9_11(L10_12, L11_13, L12_14))
  L7_9 = _dog_puppet
  L8_10 = L7_9
  L7_9 = L7_9.appendChild
  L9_11 = L6_8
  L7_9(L8_10, L9_11)
  L7_9 = _mnavi_hdl
  L8_10 = L7_9
  L7_9 = L7_9.setTarget
  L9_11 = L6_8
  L7_9(L8_10, L9_11)
  L7_9 = start_game_obj
  L7_9()
  L7_9 = nil
  L8_10 = false
  L9_11 = nil
  L10_12 = false
  L11_13 = nil
  L12_14 = false
  L13_15 = 0
  while true do
    L14_16 = _next_phase
    if not L14_16 then
      L14_16 = invokeTask
      function L15_17()
        local L0_22, L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34
        while true do
          while true do
            L0_22 = _next_phase
            if not L0_22 then
              while true do
                L0_22 = L10_12
                if L0_22 then
                  L0_22 = wait
                  L0_22()
                end
              end
              L0_22 = findNearEventNode
              L1_23 = _event_tbl
              L2_24 = _dog_puppet
              L1_23 = L0_22(L1_23, L2_24)
              L2_24 = string
              L2_24 = L2_24.sub
              L3_25 = L0_22
              L4_26 = 16
              L2_24 = L2_24(L3_25, L4_26)
              L13_15 = L2_24
              L2_24 = _skip_num
              if L2_24 ~= nil then
                L2_24 = tonumber
                L3_25 = _skip_num
                L2_24 = L2_24(L3_25)
                _skip_num = L2_24
                L2_24 = _event_tbl
                L3_25 = _skip_num
                L2_24 = L2_24[L3_25]
                L2_24.happen = false
                _skip_num = nil
              end
              L2_24 = nil
              L3_25 = Fn_getDistanceToPlayer
              L4_26 = L0_22
              L3_25 = L3_25(L4_26)
              L4_26 = DOG_CALL_DIST
              if L3_25 > L4_26 then
                L3_25 = Fn_moveNpc
                L4_26 = "sm20_dog_01"
                L5_27 = {L6_28}
                L3_25 = L3_25(L4_26, L5_27, L6_28)
                L2_24 = L3_25
                while true do
                  L4_26 = L2_24
                  L3_25 = L2_24.isRunning
                  L3_25 = L3_25(L4_26)
                  if L3_25 then
                    L3_25 = wait
                    L3_25()
                  end
                end
              end
              L3_25 = Fn_moveNpc
              L4_26 = "sm20_dog_01"
              L5_27 = {L6_28}
              L3_25 = L3_25(L4_26, L5_27, L6_28)
              L2_24 = L3_25
              while true do
                L4_26 = L2_24
                L3_25 = L2_24.isRunning
                L3_25 = L3_25(L4_26)
                if L3_25 then
                  L3_25 = wait
                  L3_25()
                end
              end
              L3_25 = Fn_playMotionNpc
              L4_26 = "sm20_dog_01"
              L5_27 = "sniff_00"
              L3_25(L4_26, L5_27, L6_28)
              L3_25 = Fn_turnNpc
              L4_26 = "sm20_dog_01"
              L5_27 = L0_22
              L3_25(L4_26, L5_27)
              if L1_23 then
                L3_25 = barkStart
                L3_25()
                L3_25 = invokeTask
                function L4_26()
                  L12_14 = true
                  if L13_15 == "03" then
                    Fn_turnNpc("gimmick_03", _dog_puppet)
                    Fn_playMotionNpc("gimmick_03", {
                      "reaction_sq_goo_00"
                    }, false, {
                      isRandom = true,
                      isRepeat = true,
                      animBlendDuration = 0.8
                    })
                  elseif L13_15 == "12" then
                    Fn_turnNpc("gimmick_12", _dog_puppet)
                    Fn_playMotionNpc("gimmick_12", "surprise", true)
                    Fn_playMotionNpc("gimmick_12", "check", false, {
                      isRandom = true,
                      isRepeat = true,
                      animBlendDuration = 0.8
                    })
                  elseif L13_15 == "13" then
                    Fn_turnNpc("gimmick_13", _dog_puppet)
                    Fn_playMotionNpc("gimmick_13", "surprise", true)
                    Fn_playMotionNpc("gimmick_13", "check", false, {
                      isRandom = true,
                      isRepeat = true,
                      animBlendDuration = 0.8
                    })
                  elseif L13_15 == "14" then
                    Fn_turnNpc("girl01", _dog_puppet)
                    Fn_playMotionNpc("girl01", "surprise_00", true)
                    Fn_playMotionNpc("girl01", "stay_02", false, {
                      isRandom = true,
                      isRepeat = true,
                      animBlendDuration = 0.8
                    })
                  end
                end
                L3_25 = L3_25(L4_26)
                L11_13 = L3_25
                L3_25 = Fn_captionViewWait
                L4_26 = "sm20_00103"
                L3_25(L4_26)
                L3_25 = Fn_getDistanceToPlayer
                L4_26 = L0_22
                L3_25 = L3_25(L4_26)
                if L3_25 >= 2.3 then
                  L3_25 = Fn_naviSet
                  L4_26 = findGameObject2
                  L5_27 = "Node"
                  L12_34 = L4_26(L5_27, L6_28)
                  L3_25(L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L4_26(L5_27, L6_28))
                  _navi_on = true
                end
              end
              L3_25 = createDummySensor
              L4_26 = "event_sensor"
              L5_27 = L0_22
              L3_25 = L3_25(L4_26, L5_27)
              L7_9 = L3_25
              L3_25 = start_game_obj
              L3_25()
              L3_25 = L7_9
              L4_26 = L3_25
              L3_25 = L3_25.setActive
              L5_27 = true
              L3_25(L4_26, L5_27)
              L3_25 = 0
              L4_26 = false
              L8_10 = L4_26
              L4_26 = invokeTask
              function L5_27()
                while not _event_sensor_in or not L8_10 do
                  waitSeconds(1)
                  L3_25 = L3_25 + 1
                  if L3_25 % 5 == 0 then
                    print(L3_25 .. "\231\167\146\231\181\140\233\129\142")
                  end
                  if L3_25 % 11 == 0 then
                    if L0_22 == "locator2_event_13" then
                      Fn_captionView("sm20_00104")
                    elseif L0_22 == "locator2_event_14" then
                      Fn_captionView("sm20_00105")
                    end
                  end
                end
              end
              L4_26 = L4_26(L5_27)
              L9_11 = L4_26
              L4_26 = nil
              if L1_23 then
                L4_26 = DOG_WAIT_TIME_MAX_TRUE
              else
                L4_26 = DOG_WAIT_TIME_MAX_FALSE
              end
              L5_27 = 0
              for L9_31, L10_32 in L6_28(L7_29) do
                L11_33 = L10_32.happen
                if not L11_33 then
                  L5_27 = L5_27 + 1
                end
              end
              while true do
                if not L6_28 then
                  if L3_25 > L4_26 and L5_27 > 1 then
                    L8_10 = L6_28
                    _skip_num = L6_28
                    L11_13 = L6_28
                    L6_28(L7_29)
                    break
                  end
                end
                L6_28()
              end
              L6_28(L7_29, L8_30)
              _event_sensor_in = false
              L6_28()
              L9_11 = L6_28
              L11_13 = L6_28
              L12_14 = L6_28
              for L9_31, L10_32 in L6_28(L7_29) do
                L11_33 = L10_32.node
                if L11_33 == L0_22 then
                  L10_32.happen = true
                  L11_33 = Fn_naviKill
                  L11_33()
                  _navi_on = false
                  L11_33 = _guide_area_on
                  if L11_33 then
                    L11_33 = Fn_naviSet
                    L12_34 = findGameObject2
                    L12_34 = L12_34("Node", "locator2_guide")
                    L11_33(L12_34, L12_34("Node", "locator2_guide"))
                  end
                  L11_33 = L8_10
                  if not L11_33 then
                    L11_33 = L10_32.gimmick
                    if not L11_33 then
                      L11_33 = Sound
                      L12_34 = L11_33
                      L11_33 = L11_33.pulse
                      L11_33(L12_34, "dog_sad")
                    end
                    L11_33 = L10_32.node
                    if L11_33 == "locator2_event_01" then
                      L11_33 = Fn_captionViewWait
                      L12_34 = "sm20_00106"
                      L11_33(L12_34)
                    else
                      L11_33 = L10_32.node
                      if L11_33 == "locator2_event_02" then
                        L11_33 = Fn_captionViewWait
                        L12_34 = "sm20_00107"
                        L11_33(L12_34)
                      else
                        L11_33 = L10_32.node
                        if L11_33 == "locator2_event_03" then
                          L11_33 = Fn_kaiwaDemoView
                          L12_34 = "sm20_00330k"
                          L11_33(L12_34)
                          L11_33 = Fn_playMotionNpc
                          L12_34 = "gimmick_03"
                          L11_33(L12_34, "stay", false, {animBlendDuration = 0.8})
                          L11_33 = waitSeconds
                          L12_34 = 0.5
                          L11_33(L12_34)
                          L11_33 = Fn_turnNpc
                          L12_34 = "gimmick_03"
                          L11_33(L12_34, "locator2_event_03_view")
                          L11_33 = Fn_playMotionNpc
                          L12_34 = "gimmick_03"
                          L11_33(L12_34, "stay_03", false)
                        else
                          L11_33 = L10_32.node
                          if L11_33 == "locator2_event_04" then
                            L11_33 = {L12_34}
                            L12_34 = {}
                            L12_34.name = "gimmick_04"
                            L12_34.locator = {
                              "locator2_fly_01_01",
                              "locator2_fly_01_02"
                            }
                            L12_34.puppet = _puppet_tbl.gimmick_04
                            L12_34 = eventBird
                            L12_34(L11_33)
                            L12_34 = waitSeconds
                            L12_34(1)
                          else
                            L11_33 = L10_32.node
                            if L11_33 == "locator2_event_05" then
                              L11_33 = Fn_captionViewWait
                              L12_34 = "sm20_00108"
                              L11_33(L12_34)
                            else
                              L11_33 = L10_32.node
                              if L11_33 == "locator2_event_06" then
                                L11_33 = {
                                  L12_34,
                                  {
                                    name = "gimmick_06_a",
                                    locator = {
                                      "locator2_fly_03"
                                    },
                                    puppet = _puppet_tbl.gimmick_06_a
                                  },
                                  {
                                    name = "gimmick_06_b",
                                    locator = {
                                      "locator2_fly_04"
                                    },
                                    puppet = _puppet_tbl.gimmick_06_b
                                  }
                                }
                                L12_34 = {}
                                L12_34.name = "gimmick_06"
                                L12_34.locator = {
                                  "locator2_fly_02"
                                }
                                L12_34.puppet = _puppet_tbl.gimmick_06
                                L12_34 = eventBird
                                L12_34(L11_33)
                                L12_34 = waitSeconds
                                L12_34(1)
                              else
                                L11_33 = L10_32.node
                                if L11_33 == "locator2_event_07" then
                                  L11_33 = Fn_setNpcActive
                                  L12_34 = "gimmick_07"
                                  L11_33(L12_34, true)
                                  L11_33 = {}
                                  L11_33.runLength = 1
                                  L11_33.arrivedLength = 0.5
                                  L11_33.navimesh = false
                                  L11_33.recast = true
                                  L12_34 = Fn_moveNpc
                                  L12_34("gimmick_07", {
                                    "locator2_event_dog_move_01"
                                  }, L11_33)
                                  L12_34 = Mv_viewObjWait
                                  L12_34 = L12_34(_puppet_tbl.gimmick_07, 0.5)
                                  invokeTask(function()
                                    waitSeconds(1)
                                    Fn_captionViewWait("sm20_00109")
                                    L12_34 = Mv_safeTaskAbort(L12_34)
                                    while Fn_moveNpc("gimmick_07", {
                                      "locator2_event_dog_move_02",
                                      "locator2_event_dog_move_03"
                                    }, L11_33):isRunning() do
                                      wait()
                                    end
                                    while true do
                                      if not Fn_isInSightTarget(_puppet_tbl.gimmick_07, 1.2) then
                                        Fn_setNpcActive("gimmick_07", false)
                                        print("\231\138\172\230\182\136\227\129\151\227\129\159")
                                        break
                                      end
                                      wait()
                                    end
                                  end)
                                  waitSeconds(1)
                                  break
                                else
                                  L11_33 = L10_32.node
                                  if L11_33 == "locator2_event_08" then
                                    L11_33 = Fn_captionViewWait
                                    L12_34 = "sm20_00110"
                                    L11_33(L12_34)
                                  else
                                    L11_33 = L10_32.node
                                    if L11_33 == "locator2_event_09" then
                                      L11_33 = Fn_captionViewWait
                                      L12_34 = "sm20_00111"
                                      L11_33(L12_34)
                                    else
                                      L11_33 = L10_32.node
                                      if L11_33 == "locator2_event_10" then
                                        L11_33 = Fn_captionViewWait
                                        L12_34 = "sm20_00112"
                                        L11_33(L12_34)
                                      else
                                        L11_33 = L10_32.node
                                        if L11_33 == "locator2_event_11" then
                                          L11_33 = Fn_captionViewWait
                                          L12_34 = "sm20_00113"
                                          L11_33(L12_34)
                                        else
                                          L11_33 = L10_32.node
                                          if L11_33 == "locator2_event_12" then
                                            L11_33 = Fn_kaiwaDemoView
                                            L12_34 = "sm20_00300k"
                                            L11_33(L12_34)
                                            L11_33 = Fn_playMotionNpc
                                            L12_34 = "gimmick_12"
                                            L11_33(L12_34, "stay", false, {animBlendDuration = 0.8})
                                            L11_33 = waitSeconds
                                            L12_34 = 0.5
                                            L11_33(L12_34)
                                            L11_33 = Fn_turnNpc
                                            L12_34 = "gimmick_12"
                                            L11_33(L12_34, "locator2_event_12_view")
                                            L11_33 = Fn_playMotionNpc
                                            L12_34 = "gimmick_12"
                                            L11_33(L12_34, "stay_02", false, {animBlendDuration = 0.8})
                                          else
                                            L11_33 = L10_32.node
                                            if L11_33 == "locator2_event_13" then
                                              L11_33 = Fn_kaiwaDemoView
                                              L12_34 = "sm20_00310k"
                                              L11_33(L12_34)
                                              L11_33 = wait
                                              L11_33()
                                              L11_33 = Fn_setNpcActive
                                              L12_34 = "girl01"
                                              L11_33(L12_34, true)
                                              L11_33 = table
                                              L11_33 = L11_33.insert
                                              L12_34 = _event_tbl
                                              L11_33(L12_34, 14, {
                                                node = "locator2_event_14",
                                                happen = false,
                                                gimmick = true
                                              })
                                              L11_33 = Fn_playMotionNpc
                                              L12_34 = "gimmick_13"
                                              L11_33(L12_34, "stay", false, {animBlendDuration = 0.8})
                                              L11_33 = waitSeconds
                                              L12_34 = 0.5
                                              L11_33(L12_34)
                                              L11_33 = Fn_turnNpc
                                              L12_34 = "gimmick_13"
                                              L11_33(L12_34, "locator2_event_13_view")
                                              L11_33 = Fn_playMotionNpc
                                              L12_34 = "gimmick_13"
                                              L11_33(L12_34, "lookaround_02", false, {animBlendDuration = 0.8})
                                            else
                                              L11_33 = L10_32.node
                                              if L11_33 == "locator2_event_14" then
                                                _next_phase = true
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              L6_28(L7_29)
            end
          end
        end
      end
      L14_16 = L14_16(L15_17)
      L15_17 = _gesture_icon_on
      if not L15_17 then
        L15_17 = _dog_call_area_flag
        if L15_17 then
          L15_17 = entryGestureAction
          L15_17()
          _gesture_icon_on = true
        end
      end
      while true do
        L15_17 = _dog_call
        L15_17 = L15_17 or _next_phase
        if not L15_17 then
          L15_17 = Player
          L15_17 = L15_17.getAction
          L15_17 = L15_17(L16_18)
          if L15_17 ~= L16_18 then
          else
            if L15_17 == L16_18 then
          end
          elseif not L16_18 then
            if L16_18 then
              L16_18()
              _gesture_icon_on = false
            end
          end
          if L15_17 ~= L16_18 then
          elseif L15_17 == L16_18 then
            if not L16_18 then
              if not L16_18 then
                if not L16_18 then
                  if L16_18 then
                    L16_18()
                    _gesture_icon_on = true
                  end
                end
              end
            end
          end
          L16_18()
        end
      end
      if L7_9 ~= nil then
        L15_17 = L7_9.setActive
        L15_17(L16_18, L17_19)
      end
      L15_17 = _next_phase
      if L15_17 then
        L15_17 = Fn_gestureActionCancel
        L15_17()
        _gesture_icon_on = false
        break
      end
    end
    L15_17 = _skip_num
    if L15_17 ~= nil then
      L15_17 = tonumber
      L15_17 = L15_17(L16_18)
      _skip_num = L15_17
      L15_17 = _event_tbl
      L15_17 = L15_17[L16_18]
      L15_17.happen = false
      _skip_num = nil
    end
    L15_17 = Mv_safeTaskAbort
    L15_17 = L15_17(L16_18)
    L14_16 = L15_17
    L15_17 = Mv_safeTaskAbort
    L15_17 = L15_17(L16_18)
    L9_11 = L15_17
    L15_17 = barkEnd
    L15_17()
    L15_17 = Fn_getPlayerWorldPos
    L15_17 = L15_17()
    L19_21 = L15_17
    L19_21 = L4_6
    if L12_14 then
      L11_13 = L17_19
      L17_19(L18_20)
    end
    while true do
      if L17_19 then
        L17_19()
      end
    end
    L10_12 = true
    L19_21 = "dog_bark"
    L17_19(L18_20, L19_21)
    L17_19(L18_20)
    _dog_call = false
    L17_19()
  end
  L14_16 = Fn_blackout
  L14_16()
  L14_16 = Fn_pcSensorOff
  L15_17 = "pccubesensormulti2_dog_call_01"
  L14_16(L15_17)
  L14_16 = Mv_safeTaskAbort
  L15_17 = _mnavi_task
  L14_16 = L14_16(L15_17)
  _mnavi_task = L14_16
  L14_16 = _mnavi_hdl
  L15_17 = L14_16
  L14_16 = L14_16.getActive
  L14_16 = L14_16(L15_17)
  if L14_16 then
    L14_16 = _mnavi_hdl
    L15_17 = L14_16
    L14_16 = L14_16.setActive
    L14_16(L15_17, L16_18)
  end
  L14_16 = Fn_resetPcPos
  L15_17 = "locator2_pc_resetpos_arrive_girl_01"
  L14_16(L15_17)
  L14_16 = waitSeconds
  L15_17 = 0.5
  L14_16(L15_17)
  L14_16 = Fn_warpNpc
  L15_17 = "sm20_dog_01"
  L14_16(L15_17, L16_18)
  L14_16 = Fn_playMotionNpc
  L15_17 = "girl01"
  L14_16(L15_17, L16_18, L17_19)
  L14_16 = Fn_turnNpc
  L15_17 = "girl01"
  L14_16(L15_17, L16_18)
  L14_16 = Fn_userCtrlAllOff
  L14_16()
  L14_16 = waitSeconds
  L15_17 = 1.5
  L14_16(L15_17)
  L14_16 = _sdemo_cut02
  L15_17 = L14_16
  L14_16 = L14_16.set
  L14_16(L15_17, L16_18, L17_19, L18_20)
  L14_16 = _sdemo_cut02
  L15_17 = L14_16
  L14_16 = L14_16.play
  L14_16(L15_17)
  L14_16 = Fn_fadein
  L14_16()
  L14_16 = waitSeconds
  L15_17 = 1
  L14_16(L15_17)
  L14_16 = Fn_kaiwaDemoView
  L15_17 = "sm20_00400k"
  L14_16(L15_17)
  L14_16 = Fn_moveNpc
  L15_17 = "girl01"
  L17_19.runLength = -1
  L17_19.anim_speed_over = true
  L17_19.anim_run_speed = 1
  L14_16 = L14_16(L15_17, L16_18, L17_19)
  L15_17 = findGameObject2
  L15_17 = L15_17(L16_18, L17_19)
  L16_18(L17_19)
  L17_19.pos = "locator2_escape_aim_02"
  L17_19.time = 3.5
  L19_21 = L2_4
  L16_18(L17_19, L18_20, L19_21)
  while true do
    if L16_18 then
      L16_18()
    end
  end
  L16_18(L17_19, L18_20)
  L16_18(L17_19)
  L16_18()
  L14_16 = L16_18
  L19_21 = "locator2_girl_escape_03"
  L19_21 = {}
  L19_21.runLength = -1
  L19_21.anim_speed_over = true
  L19_21.anim_run_speed = 1
  L14_16 = L16_18
  L19_21 = "locator2_escape_aim_03"
  L16_18(L17_19, L18_20, L19_21, false)
  L16_18(L17_19)
  L16_18(L17_19)
  L17_19.pos = "locator2_escape_aim_04"
  L17_19.time = 3.5
  L19_21 = L2_4
  L16_18(L17_19, L18_20, L19_21)
  while true do
    if L16_18 then
      L16_18()
    end
  end
  L16_18(L17_19, L18_20)
  L16_18(L17_19)
  L16_18(L17_19)
  L19_21 = "locator2_escape_aim_05"
  L16_18(L17_19, L18_20, L19_21, false)
  L19_21 = 0.1
  L16_18(L17_19, L18_20, L19_21, nil)
  L16_18(L17_19)
  L16_18(L17_19)
  L16_18(L17_19)
  L16_18()
  L16_18(L17_19)
  L14_16 = L16_18
  for L19_21 = 1, 13 do
    if L19_21 ~= 10 or L19_21 ~= 11 then
      Fn_disappearNpc("gimmick_" .. string.format("%02d", L19_21))
    end
  end
  L16_18(L17_19)
  L16_18()
  L16_18()
  L16_18()
  L16_18()
end
function Finalize()
  Mob:restrict_sm20_00(false)
end
function event_sensor_OnEnter()
  local L0_35, L1_36
  _event_sensor_in = true
end
function pccubesensor2_guide_range_01_OnEnter()
  _guide_area_on = false
  if not _navi_on then
    Fn_naviKill()
  end
end
function pccubesensor2_guide_range_01_OnLeave()
  _guide_area_on = true
  if not _navi_on then
    Fn_naviSet(findGameObject2("Node", "locator2_guide"))
  end
  Fn_captionView("sm20_00114")
end
function pccubesensor2_course_area_01_OnLeave()
  _warning_area_on = true
  Fn_gestureActionCancel()
  _gesture_icon_on = false
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  Fn_captionView("sm20_00115")
end
function pccubesensor2_course_area_01_OnEnter()
  local L0_37, L1_38
  _warning_area_on = false
end
function pccubesensor2_nekowarp_range_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function entryGestureAction()
  local L0_39, L1_40
  function L0_39()
    local L0_41, L1_42, L2_43
    L0_41 = Fn_userCtrlOff
    L0_41()
    _gesture_task_through = true
    _gesture_icon_on = false
    L0_41 = Fn_playerTurn
    L1_42 = _dog_puppet
    L0_41(L1_42)
    L0_41 = waitSeconds
    L1_42 = 1
    L0_41(L1_42)
    L0_41 = {L1_42, L2_43}
    L1_42 = "sm20_00116"
    L2_43 = "sm20_00117"
    L1_42 = RandI
    L2_43 = 1
    L1_42 = L1_42(L2_43, 2)
    L2_43 = invokeTask
    L2_43(function()
      waitSeconds(0.5)
      Fn_captionView(L0_41[L1_42])
      Sound:pulse("kit029")
    end)
    L2_43 = Fn_playPlayerMotionWait
    L2_43("kit01_shout_00", 0, 0.3, true)
    L2_43 = Fn_playerTurnEnd
    L2_43()
    L2_43 = Mv_safeTaskAbort
    L2_43 = L2_43(_mnavi_task)
    _mnavi_task = L2_43
    L2_43 = _mnavi_hdl
    L2_43 = L2_43.setActive
    L2_43(L2_43, true)
    L2_43 = invokeTask
    L2_43 = L2_43(function()
      waitSeconds(10)
      _mnavi_hdl:setActive(false)
    end)
    _mnavi_task = L2_43
    L2_43 = Fn_getDistanceToPlayer
    L2_43 = L2_43(_dog_puppet)
    print("\231\138\172\227\129\168\227\129\174\232\183\157\233\155\162\227\129\175" .. L2_43)
    if L2_43 <= DOG_CALL_DIST and Fn_isInSightTarget(_dog_puppet, 1) then
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
  L1_40 = {}
  L1_40.RL = {id = "sm20_00118", func = L0_39}
  Fn_gestureAction(L1_40)
end
function pccubesensormulti2_dog_call_01_OnEnter()
  print("\n\231\138\172\229\145\188\227\129\185\227\130\139\231\175\132\229\155\178")
  _dog_call_area_flag = true
end
function pccubesensormulti2_dog_call_01_OnLeave()
  print("\n\231\138\172\229\145\188\227\129\185\227\129\170\227\129\132\231\175\132\229\155\178")
  _dog_call_area_flag = false
end
