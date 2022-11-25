dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
_puppet_tbl = {}
_arrow_hdls = {}
_eve01_flg = false
_eve02_flg = false
_is_player_goal = false
_bird_speed = 10
_next_cp = "locator2_cp_01"
_can_warp_flg = true
_cat_warp_task = nil
_EVENT_MOTION_TBL = {
  ready = "kit01_stay_fighting_in_00",
  wait = "kit01_stay_fighting_00",
  joy = "kit01_hail_00"
}
_esayari_task = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    {
      name = "ass_bird_04",
      type = "gull01",
      node = "locator2_ass_bird_04"
    },
    {
      name = "ass_bird_05",
      type = "gull01",
      node = "locator2_ass_bird_05"
    },
    {
      name = "fly_bird_01",
      type = "gull01",
      node = "locator2_ass_pre_bird_01"
    },
    {
      name = "fly_bird_02",
      type = "gull01",
      node = "locator2_ass_pre_bird_02"
    },
    {
      name = "fly_bird_03",
      type = "gull01",
      node = "locator2_ass_pre_bird_03"
    }
  }
  L1_1.name = "sm10_dove"
  L1_1.type = "gull01"
  L1_1.node = "locator2_dove"
  L1_1.use_gravity = false
  L1_1.not_mob = true
  L2_2.name = "sm10_dove_race"
  L2_2.type = "gull01"
  L2_2.node = "locator2_dove_race_start"
  L3_3.name = "sm10_dusty"
  L3_3.type = "dus01"
  L3_3.node = "locator2_dusty"
  L3_3.active = false
  L4_4 = {}
  L4_4.name = "sm10_esayari_ojisan"
  L4_4.type = "man37"
  L4_4.node = "locator2_esayari_ojisann"
  L5_5 = {}
  L5_5.name = "sm10_eat_dove_01"
  L5_5.type = "gull01"
  L5_5.node = "locator2_eat_dove_01"
  L6_6 = {}
  L6_6.name = "sm10_eat_dove_02"
  L6_6.type = "gull01"
  L6_6.node = "locator2_eat_dove_02"
  L7_7 = {}
  L7_7.name = "sm10_eat_dove_03"
  L7_7.type = "gull01"
  L7_7.node = "locator2_eat_dove_03"
  L8_8 = {}
  L8_8.name = "ass_bird_01"
  L8_8.type = "gull01"
  L8_8.node = "locator2_ass_bird_01"
  L9_9 = {}
  L9_9.name = "ass_bird_02"
  L9_9.type = "gull01"
  L9_9.node = "locator2_ass_bird_02"
  L10_10 = {}
  L10_10.name = "ass_bird_03"
  L10_10.type = "gull01"
  L10_10.node = "locator2_ass_bird_03"
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = _puppet_tbl
    L7_7 = L5_5.name
    L8_8 = Fn_findNpcPuppet
    L9_9 = L5_5.name
    L8_8 = L8_8(L9_9)
    L6_6[L7_7] = L8_8
  end
  _arrow_cnt = 2
  function L4_4()
    for _FORV_3_, _FORV_4_ in ipairs(_arrow_hdls) do
      if _FORV_4_ then
        _FORV_4_:try_term()
      end
    end
    _arrow_hdls = {}
  end
  function L5_5()
    L4_4()
    L3_3()
  end
  function L6_6()
    _eve01_flg = true
    L2_2()
  end
  function L7_7()
    _eve02_flg = true
    L4_4()
    L2_2()
  end
  function L8_8()
    Fn_setBgmPoint("event", "race_climax")
    L2_2()
  end
  L9_9 = {
    L10_10,
    {
      name = "locator2_cp_02",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_03",
      opt = {func = L5_5}
    },
    {
      name = "locator2_cp_04",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_05",
      opt = {func = L3_3}
    },
    {
      name = "locator2_cp_06",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_07",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_08",
      opt = {func = L3_3}
    },
    {
      name = "locator2_cp_09",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_10",
      opt = {func = L3_3}
    },
    {
      name = "locator2_cp_11",
      opt = {func = L3_3}
    },
    {
      name = "locator2_cp_12",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_13",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_14",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_15",
      opt = {func = L8_8}
    },
    {
      name = "locator2_cp_16",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_17",
      opt = {func = L2_2}
    },
    {
      name = "locator2_cp_18",
      opt = {func = L6_6}
    },
    {
      name = "locator2_cp_19",
      opt = {func = L7_7}
    },
    {
      name = "locator2_cp_20",
      opt = {marker = "goal"}
    }
  }
  L10_10 = {}
  L10_10.name = "locator2_cp_01"
  L10_10.opt = {func = L2_2}
  L10_10 = Fn_setCheckPointTable
  L10_10(L9_9, {
    size = Vector(3, 3, 3),
    marker = "air"
  })
  L10_10 = Fn_userCtrlAllOff
  L10_10()
  L10_10 = Camera
  L10_10 = L10_10.setControl
  L10_10(L10_10, Camera.kPlayer, Camera.kControl_All, false)
  L10_10 = SDemo
  L10_10 = L10_10.create
  L10_10 = L10_10("sm10_cut01")
  _sdemo_cut01 = L10_10
  L10_10 = SDemo
  L10_10 = L10_10.create
  L10_10 = L10_10("sm10_cut02")
  _sdemo_cut02 = L10_10
  L10_10 = SDemo
  L10_10 = L10_10.create
  L10_10 = L10_10("sm10_cut03")
  _sdemo_cut03 = L10_10
  L10_10 = SDemo
  L10_10 = L10_10.create
  L10_10 = L10_10("sm10_cut04")
  _sdemo_cut04 = L10_10
  L10_10 = PDemo
  L10_10 = L10_10.create
  L10_10 = L10_10("sm10_a_c01", Fn_findAreaHandle("mi_a_05"), {camera = true, scene_param = false})
  _pdemo_cut01 = L10_10
  L10_10 = GameDatabase
  L10_10 = L10_10.set
  L10_10(L10_10, ggd.GlobalSystemFlags__AreaDrift, false)
  L10_10 = {}
  L10_10.counter = {
    max = #L9_9
  }
  Fn_counterInit(L10_10)
  Fn_timerStandby()
  Fn_loadPlayerMotion(_EVENT_MOTION_TBL)
  Mob:restrictNavFor_sm10(true)
end
function Ingame()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, L12_23, L13_24, L14_25, L15_26, L16_27, L17_28, L18_29, L19_30, L20_31, L21_32, L22_33, L23_34, L24_35, L25_36, L26_37, L27_38, L28_39, L29_40, L30_41, L31_42, L32_43, L33_44, L34_45, L35_46, L36_47, L37_48, L38_49, L39_50, L40_51, L41_52, L42_53, L43_54, L44_55, L45_56, L46_57, L47_58, L48_59
  L0_11 = _puppet_tbl
  L0_11 = L0_11.sm10_dove_race
  L1_12 = L0_11
  L0_11 = L0_11.setCollidable
  L2_13 = false
  L0_11(L1_12, L2_13)
  L0_11 = _puppet_tbl
  L0_11 = L0_11.sm10_dove_race
  L1_12 = L0_11
  L0_11 = L0_11.setDetectable
  L2_13 = false
  L0_11(L1_12, L2_13)
  L0_11 = Fn_setCatWarp
  L1_12 = true
  L0_11(L1_12)
  L0_11 = GameDatabase
  L1_12 = L0_11
  L0_11 = L0_11.get
  L2_13 = ggd
  L2_13 = L2_13.EventFlags__sm10__flag01
  L0_11 = L0_11(L1_12, L2_13)
  if L0_11 ~= 1 then
    L0_11 = {}
    L0_11.idle_ep10_00 = "gull01_idle_ep10_00"
    L1_12 = Fn_loadNpcEventMotion
    L2_13 = "sm10_dove"
    L1_12(L2_13, L3_14)
    L1_12 = Fn_findNpc
    L2_13 = "sm10_client"
    L1_12 = L1_12(L2_13)
    L2_13 = L1_12
    L1_12 = L1_12.setPilots
    L4_15.pilot = L5_16
    L4_15.attach = "loc_head"
    L1_12(L2_13, L3_14)
    L1_12 = Fn_playMotionNpc
    L2_13 = "sm10_client"
    L1_12(L2_13, L3_14, L4_15)
    L1_12 = Fn_playMotionNpc
    L2_13 = "sm10_dove"
    L1_12(L2_13, L3_14, L4_15)
    L1_12 = GameDatabase
    L2_13 = L1_12
    L1_12 = L1_12.set
    L1_12(L2_13, L3_14, L4_15)
  end
  L0_11 = _sdemo_cut01
  L1_12 = L0_11
  L0_11 = L0_11.set
  L2_13 = "locator2_cam_thirdSon_01"
  L0_11(L1_12, L2_13, L3_14, L4_15)
  L0_11 = _sdemo_cut01
  L1_12 = L0_11
  L0_11 = L0_11.switchCamera
  L2_13 = true
  L0_11(L1_12, L2_13)
  L0_11 = Fn_missionStart
  L0_11()
  L0_11 = 2
  L1_12 = {L2_13, L3_14}
  L2_13 = {}
  L2_13.pos = "locator2_cam_thirdSon_02"
  L2_13.time = L0_11
  L2_13.hashfunc = "EaseIn"
  L3_14.pos = "locator2_cam_thirdSon_03"
  L3_14.time = L0_11
  L3_14.hashfunc = "EaseOut"
  L2_13 = {L3_14}
  L3_14.pos = "locator2_aim_thirdSon_01"
  L3_14.time = L0_11
  L6_17 = L2_13
  L3_14(L4_15, L5_16, L6_17)
  while true do
    if L3_14 then
      L3_14()
    end
  end
  L3_14(L4_15)
  L4_15.pos = "locator2_cam_thirdSon_04"
  L4_15.time = 1
  L1_12 = L3_14
  L4_15.pos = "locator2_aim_thirdSon_01"
  L4_15.time = 1
  L2_13 = L3_14
  L6_17 = L2_13
  L3_14(L4_15, L5_16, L6_17)
  while true do
    if L3_14 then
      L3_14()
    end
  end
  L3_14(L4_15)
  L3_14(L4_15)
  L3_14()
  L3_14(L4_15, L5_16)
  for L6_17 = 2, 5 do
    L7_18 = Fn_pcSensorOff
    L8_19 = "pccubesensor2_outrange_"
    L9_20 = string
    L9_20 = L9_20.format
    L10_21 = "%02d"
    L11_22 = L6_17
    L9_20 = L9_20(L10_21, L11_22)
    L8_19 = L8_19 .. L9_20
    L7_18(L8_19)
  end
  L3_14(L4_15, L5_16)
  L3_14(L4_15)
  L6_17 = "Node"
  L7_18 = "locator2_cp_01"
  L6_17 = L5_16
  L6_17 = 0
  L7_18 = 0
  L3_14(L4_15, L5_16, L6_17, L7_18)
  L3_14(L4_15)
  L3_14(L4_15)
  L3_14(L4_15, L5_16)
  L3_14(L4_15, L5_16)
  L3_14(L4_15, L5_16)
  L3_14()
  L3_14(L4_15)
  L3_14(L4_15)
  L3_14(L4_15)
  L3_14(L4_15)
  L3_14(L4_15, L5_16)
  L6_17 = "stay_01"
  L7_18 = _EVENT_MOTION_TBL
  L7_18 = L7_18.ready
  L8_19 = _EVENT_MOTION_TBL
  L8_19 = L8_19.wait
  L3_14(L4_15, L5_16, L6_17, L7_18, L8_19)
  L3_14()
  arrow_hdl = L3_14
  L3_14(L4_15, L5_16)
  L3_14()
  _cat_warp_task = L3_14
  L3_14(L4_15)
  L6_17 = false
  L4_15(L5_16, L6_17)
  L4_15()
  L6_17 = Camera
  L6_17 = L6_17.kPlayer
  L7_18 = Camera
  L7_18 = L7_18.kControl_All
  L8_19 = true
  L4_15(L5_16, L6_17, L7_18, L8_19)
  L6_17 = 3
  L7_18 = {}
  L8_19 = false
  L9_20 = false
  L10_21 = false
  L11_22 = {}
  for L15_26 = 1, L6_17 do
    L16_27 = Fn_findNpc
    L20_31 = L15_26
    L16_27 = L16_27(L17_28)
    L11_22[L15_26] = L16_27
  end
  function L15_26()
    local L0_60, L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70
    while true do
      if not L0_60 then
        if L0_60 then
          if not L0_60 then
            L9_20 = L0_60
            L3_63 = "Node"
            L3_63 = L2_62
            L10_70 = L2_62(L3_63)
            L3_63 = findGameObject2
            L3_63 = L3_63(L4_64, L5_65)
            L3_63 = L3_63.getWorldPos
            L10_70 = L3_63(L4_64)
            L3_63 = Fn_getDistanceToPlayer
            L10_70 = L4_64(L5_65)
            L3_63 = L3_63(L4_64, L5_65, L6_66, L7_67, L8_68, L9_69, L10_70, L4_64(L5_65))
            L7_67 = "locator2_ass_pre_bird_01_fly_01_C"
            L10_70 = L5_65(L6_66)
            L7_67 = "Node"
            L8_68 = "locator2_ass_pre_bird_01_fly_01_L"
            L7_67 = L6_66
            L10_70 = L6_66(L7_67)
            if L4_64 > L5_65 then
            else
              L7_67 = "locator2_ass_pre_bird_01_fly_01_L"
              L10_70 = L5_65(L6_66)
              L7_67 = "Node"
              L8_68 = "locator2_ass_pre_bird_01_fly_01_R"
              L7_67 = L6_66
              L10_70 = L6_66(L7_67)
              if L4_64 > L5_65 then
              else
                L7_67 = "locator2_ass_pre_bird_01_fly_01_R"
                L10_70 = L5_65(L6_66)
                L7_67 = "Node"
                L8_68 = "locator2_ass_pre_bird_01_fly_01_C"
                L7_67 = L6_66
                L10_70 = L6_66(L7_67)
              end
            end
            for L7_67 = 1, L6_17 do
              L8_68 = {}
              L9_69 = {
                L10_70,
                {
                  pos = "locator2_ass_pre_bird_" .. string.format("%02d", L7_67) .. "_fly_02_" .. L0_60,
                  attr = "fly"
                },
                {
                  pos = "locator2_ass_pre_bird_" .. string.format("%02d", L7_67) .. "_fly_03_" .. L0_60,
                  attr = "fly"
                },
                {
                  pos = "locator2_ass_pre_bird_" .. string.format("%02d", L7_67) .. "_fly_04_" .. L0_60,
                  attr = "fly"
                },
                {
                  pos = "locator2_ass_pre_bird_" .. string.format("%02d", L7_67) .. "_fly_05",
                  attr = "fly"
                },
                {
                  pos = "locator2_ass_pre_bird_" .. string.format("%02d", L7_67) .. "_fly_06",
                  attr = "land"
                }
              }
              L10_70 = {}
              L10_70.pos = "locator2_ass_pre_bird_" .. string.format("%02d", L7_67) .. "_fly_01_" .. L0_60
              L10_70.attr = "takeoff"
              L8_68[L7_67] = L9_69
              L9_69 = waitSeconds
              L10_70 = 0.1
              L9_69(L10_70)
              L9_69 = Fn_findNpc
              L10_70 = "fly_bird_"
              L10_70 = L10_70 .. string.format("%02d", L7_67)
              L9_69 = L9_69(L10_70)
              L10_70 = nil
              if L7_67 == 1 then
                L10_70 = RandI(12, 16)
                L9_69:fly(L8_68[L7_67], {moveSpeed = L10_70, escape = true})
              elseif L7_67 == 2 then
                L10_70 = RandI(20, 25)
                L9_69:fly(L8_68[L7_67], {moveSpeed = L10_70, escape = true})
              elseif L7_67 == 3 then
                L10_70 = RandI(3, 4)
                L9_69:fly(L8_68[L7_67], {moveSpeed = L10_70, escape = true})
              end
            end
            L13_24 = L4_64
            L4_64(L5_65)
          end
          _eve01_flg = false
        elseif L0_60 then
          L0_60(L1_61)
          if not L0_60 then
            L0_60(L1_61)
            L3_63 = 1
            L0_60(L1_61, L2_62, L3_63, L4_64)
            for L3_63 = 1, L5_16 do
              L7_67 = "locator2_ass_"
              L8_68 = string
              L8_68 = L8_68.format
              L9_69 = "%02d"
              L10_70 = L3_63
              L8_68 = L8_68(L9_69, L10_70)
              L9_69 = "_fly_01"
              L7_67 = L7_67 .. L8_68 .. L9_69
              L6_66.pos = L7_67
              L6_66.attr = "fly"
              L7_67 = {}
              L8_68 = "locator2_ass_"
              L9_69 = string
              L9_69 = L9_69.format
              L10_70 = "%02d"
              L9_69 = L9_69(L10_70, L3_63)
              L10_70 = "_fly_02"
              L8_68 = L8_68 .. L9_69 .. L10_70
              L7_67.pos = L8_68
              L7_67.attr = "land"
              L4_64[L3_63] = L5_65
              L5_65(L6_66)
              L7_67 = string
              L7_67 = L7_67.format
              L8_68 = "%02d"
              L9_69 = L3_63
              L7_67 = L7_67(L8_68, L9_69)
              L7_67 = 10
              L8_68 = 20
              L8_68 = L5_65
              L7_67 = L5_65.fly
              L9_69 = L4_64[L3_63]
              L10_70 = {}
              L10_70.moveSpeed = L6_66
              L7_67(L8_68, L9_69, L10_70)
            end
            L8_19 = L0_60
            L0_60(L1_61)
            L0_60(L1_61)
            L10_21 = L0_60
          end
          _eve02_flg = false
        elseif L0_60 then
        end
        L0_60()
      end
    end
  end
  L14_25(L15_26)
  L15_26 = invokeTask
  function L16_27()
    while not _is_player_goal do
      if L8_19 == true then
        if L11_22[1]:isFlyEnd() and false == false then
          Fn_playMotionNpc("fly_bird_01", "eat", false)
          Sound:stopSEHandle(L12_23[1])
        end
        if L11_22[2]:isFlyEnd() and false == false then
          Fn_playMotionNpc("fly_bird_02", "eat", false)
          Sound:stopSEHandle(L12_23[2])
        end
        if L11_22[3]:isFlyEnd() and false == false then
          Fn_playMotionNpc("fly_bird_03", "eat", false)
          Sound:stopSEHandle(L12_23[3])
        end
      end
      wait()
    end
  end
  L15_26(L16_27)
  L15_26 = HUD
  L16_27 = L15_26
  L15_26 = L15_26.mnaviNew
  L17_28.name = "dove_navi"
  L17_28.PochFadeLen0 = 20
  L17_28.PochFadeLen100 = 30
  L15_26 = L15_26(L16_27, L17_28)
  L16_27 = L15_26.setTarget
  L16_27(L17_28, L18_29)
  L16_27 = L15_26.setActive
  L16_27(L17_28, L18_29)
  L16_27 = Fn_setBgmPoint
  L16_27(L17_28, L18_29)
  L16_27 = {}
  L16_27.vctrl2_cp_01 = L17_28
  L16_27.vctrl2_cp_02 = L17_28
  L16_27.vctrl2_cp_03 = L17_28
  L16_27.vctrl2_cp_04 = L17_28
  L16_27.vctrl2_cp_05 = L17_28
  L16_27.vctrl2_cp_06 = L17_28
  L16_27.vctrl2_cp_07 = L17_28
  L16_27.vctrl2_cp_08 = L17_28
  L16_27.vctrl2_cp_09 = L17_28
  L16_27.vctrl2_cp_11 = L17_28
  L16_27.vctrl2_cp_12 = L17_28
  L16_27.vctrl2_cp_13 = L17_28
  L16_27.vctrl2_cp_14 = L17_28
  L16_27.vctrl2_cp_15 = L17_28
  L16_27.vctrl2_cp_16 = L17_28
  L16_27.vctrl2_cp_17 = L17_28
  L16_27.vctrl2_cp_18 = L17_28
  L16_27.vctrl2_cp_19 = L17_28
  for L20_31, L21_32 in L17_28(L18_29) do
    L22_33 = findGameObject2
    L23_34 = "ViewControl"
    L24_35 = L20_31
    L22_33 = L22_33(L23_34, L24_35)
    if L22_33 ~= nil then
      L24_35 = L22_33
      L23_34 = L22_33.setAimTarget
      L25_36 = L21_32
      L23_34(L24_35, L25_36)
    end
  end
  L19_30.pos = "locator2_cp_01"
  L19_30.attr = "takeoff"
  L20_31 = {}
  L20_31.pos = "locator2_cp_01_over"
  L20_31.attr = "fly"
  L21_32 = {}
  L21_32.pos = "locator2_cp_02"
  L21_32.attr = "fly"
  L22_33 = {}
  L22_33.pos = "locator2_cp_02_over"
  L22_33.attr = "fly"
  L23_34 = {}
  L23_34.pos = "locator2_cp_03"
  L23_34.attr = "fly"
  L24_35 = {}
  L24_35.pos = "locator2_cp_03_over"
  L24_35.attr = "fly"
  L25_36 = {}
  L25_36.pos = "locator2_cp_04"
  L25_36.attr = "fly"
  L26_37 = {}
  L26_37.pos = "locator2_cp_04_over"
  L26_37.attr = "fly"
  L27_38 = {}
  L27_38.pos = "locator2_cp_05"
  L27_38.attr = "fly"
  L28_39 = {}
  L28_39.pos = "locator2_cp_05_over"
  L28_39.attr = "fly"
  L29_40.pos = "locator2_cp_06"
  L29_40.attr = "fly"
  L30_41.pos = "locator2_cp_06_over"
  L30_41.attr = "fly"
  L31_42.pos = "locator2_cp_07"
  L31_42.attr = "fly"
  L32_43 = {}
  L32_43.pos = "locator2_cp_07_over"
  L32_43.attr = "fly"
  L33_44 = {}
  L33_44.pos = "locator2_cp_08"
  L33_44.attr = "fly"
  L34_45 = {}
  L34_45.pos = "locator2_cp_08_over"
  L34_45.attr = "fly"
  L35_46 = {}
  L35_46.pos = "locator2_cp_09"
  L35_46.attr = "fly"
  L36_47 = {}
  L36_47.pos = "locator2_cp_09_over"
  L36_47.attr = "fly"
  L37_48 = {}
  L37_48.pos = "locator2_cp_10"
  L37_48.attr = "fly"
  L38_49 = {}
  L38_49.pos = "locator2_cp_10_over"
  L38_49.attr = "fly"
  L39_50 = {}
  L39_50.pos = "locator2_cp_11"
  L39_50.attr = "fly"
  L40_51 = {}
  L40_51.pos = "locator2_cp_11_over"
  L40_51.attr = "fly"
  L41_52 = {}
  L41_52.pos = "locator2_cp_12"
  L41_52.attr = "fly"
  L42_53 = {}
  L42_53.pos = "locator2_cp_12_over"
  L42_53.attr = "fly"
  L43_54 = {}
  L43_54.pos = "locator2_cp_13"
  L43_54.attr = "fly"
  L17_28.race = L18_29
  L19_30.pos = "locator2_cp_14"
  L19_30.attr = "fly"
  L20_31 = {}
  L20_31.pos = "locator2_cp_14_over"
  L20_31.attr = "fly"
  L21_32 = {}
  L21_32.pos = "locator2_cp_15"
  L21_32.attr = "fly"
  L22_33 = {}
  L22_33.pos = "locator2_cp_15_over"
  L22_33.attr = "fly"
  L23_34 = {}
  L23_34.pos = "locator2_cp_16"
  L23_34.attr = "fly"
  L24_35 = {}
  L24_35.pos = "locator2_cp_16_over"
  L24_35.attr = "fly"
  L25_36 = {}
  L25_36.pos = "locator2_cp_17"
  L25_36.attr = "fly"
  L26_37 = {}
  L26_37.pos = "locator2_cp_17_over"
  L26_37.attr = "fly"
  L27_38 = {}
  L27_38.pos = "locator2_cp_18"
  L27_38.attr = "fly"
  L28_39 = {}
  L28_39.pos = "locator2_dove_path_19"
  L28_39.attr = "fly"
  L29_40.pos = "locator2_cp_19"
  L29_40.attr = "fly"
  L30_41.pos = "locator2_dove_path_20"
  L30_41.attr = "fly"
  L31_42.pos = "locator2_dove_path_24"
  L31_42.attr = "land"
  L17_28.esayari = L18_29
  L19_30.pos = "locator2_dove_path_25"
  L19_30.attr = "fly"
  L20_31 = {}
  L20_31.pos = "locator2_dove_path_26"
  L20_31.attr = "land"
  L20_31 = false
  L21_32 = 100
  L22_33 = 0
  L23_34 = 0
  L24_35 = {}
  L25_36 = _bird_speed
  L24_35.moveSpeed = L25_36
  L24_35.escape = false
  L25_36 = 0
  L26_37, L27_38 = nil, nil
  L28_39 = Fn_findNpc
  L28_39 = L28_39(L29_40)
  L29_40(L30_41)
  L29_40(L30_41)
  trap_task = L29_40
  while true do
    if L29_40 then
      L20_31 = true
      break
    end
    L29_40()
  end
  L29_40(L30_41, L31_42)
  L29_40(L30_41, L31_42)
  if L29_40 then
    L29_40(L30_41, L31_42)
    L29_40(L30_41)
  end
  L29_40()
  for L32_43 = 1, 3 do
    L33_44 = L12_23[L32_43]
    if L33_44 ~= nil then
      L33_44 = Sound
      L34_45 = L33_44
      L33_44 = L33_44.stopSEHandle
      L35_46 = L12_23[L32_43]
      L33_44(L34_45, L35_46)
    end
  end
  L29_40(L30_41)
  L32_43 = false
  L29_40(L30_41, L31_42, L32_43)
  L29_40(L30_41)
  L29_40()
  L29_40.timer = false
  L29_40.counter = false
  L30_41(L31_42)
  repeat
    L30_41()
    L32_43 = ggd
    L32_43 = L32_43.GlobalSystemFlags__CatWarpRunning
  until L30_41 == false
  L30_41()
  L30_41()
  _can_warp_flg = false
  if L30_41 then
    L20_31 = true
  end
  L30_41(L31_42)
  L32_43 = false
  L30_41(L31_42, L32_43)
  L32_43 = 0
  L33_44 = 0
  L32_43 = L31_42 + L30_41
  aim_pos = L32_43
  L32_43 = findGameObject2
  L33_44 = "Node"
  L34_45 = "locator2_dove_path_24"
  L32_43 = L32_43(L33_44, L34_45)
  L33_44 = L32_43
  L32_43 = L32_43.getWorldPos
  L32_43 = L32_43(L33_44)
  L33_44 = L31_42 - L32_43
  L34_45 = Vector
  L35_46 = L31_42.x
  L36_47 = L33_44.x
  L36_47 = L36_47 * 0.99
  L35_46 = L35_46 - L36_47
  L36_47 = L31_42.y
  L36_47 = L36_47 + 1
  L37_48 = L31_42.z
  L38_49 = L33_44.z
  L38_49 = L38_49 * 0.99
  L37_48 = L37_48 - L38_49
  L34_45 = L34_45(L35_46, L36_47, L37_48)
  L35_46 = Vector
  L36_47 = L32_43.x
  L37_48 = L33_44.x
  L37_48 = L37_48 * 0.12
  L36_47 = L36_47 - L37_48
  L36_47 = L36_47 + 0.08
  L37_48 = L32_43.y
  L37_48 = L37_48 - 0.25
  L38_49 = L32_43.z
  L39_50 = L33_44.z
  L39_50 = L39_50 * 0.35
  L38_49 = L38_49 - L39_50
  L35_46 = L35_46(L36_47, L37_48, L38_49)
  L36_47 = createGameObject2
  L37_48 = "Node"
  L36_47 = L36_47(L37_48)
  L38_49 = L36_47
  L37_48 = L36_47.setName
  L39_50 = "locator2_last_aim_01"
  L37_48(L38_49, L39_50)
  L38_49 = L36_47
  L37_48 = L36_47.setForceMove
  L37_48(L38_49)
  L38_49 = L36_47
  L37_48 = L36_47.try_init
  L37_48(L38_49)
  L38_49 = L36_47
  L37_48 = L36_47.waitForReady
  L37_48(L38_49)
  L38_49 = L36_47
  L37_48 = L36_47.try_start
  L37_48(L38_49)
  L38_49 = L36_47
  L37_48 = L36_47.setPos
  L39_50 = Fn_getPlayerWorldPos
  L39_50 = L39_50()
  L40_51 = Vector
  L41_52 = 0
  L42_53 = 1.5
  L43_54 = 0
  L40_51 = L40_51(L41_52, L42_53, L43_54)
  L39_50 = L39_50 + L40_51
  L37_48(L38_49, L39_50)
  L37_48 = createGameObject2
  L38_49 = "Node"
  L37_48 = L37_48(L38_49)
  L39_50 = L37_48
  L38_49 = L37_48.setName
  L40_51 = "locator2_last_aim_02"
  L38_49(L39_50, L40_51)
  L39_50 = L37_48
  L38_49 = L37_48.try_init
  L38_49(L39_50)
  L39_50 = L37_48
  L38_49 = L37_48.waitForReady
  L38_49(L39_50)
  L39_50 = L37_48
  L38_49 = L37_48.try_start
  L38_49(L39_50)
  L39_50 = L37_48
  L38_49 = L37_48.setPos
  L40_51 = aim_pos
  L38_49(L39_50, L40_51)
  L38_49 = createGameObject2
  L39_50 = "Node"
  L38_49 = L38_49(L39_50)
  L40_51 = L38_49
  L39_50 = L38_49.setName
  L41_52 = "locator2_last_cam_01"
  L39_50(L40_51, L41_52)
  L40_51 = L38_49
  L39_50 = L38_49.try_init
  L39_50(L40_51)
  L40_51 = L38_49
  L39_50 = L38_49.waitForReady
  L39_50(L40_51)
  L40_51 = L38_49
  L39_50 = L38_49.try_start
  L39_50(L40_51)
  L40_51 = L38_49
  L39_50 = L38_49.setPos
  L41_52 = L34_45
  L39_50(L40_51, L41_52)
  L39_50 = createGameObject2
  L40_51 = "Node"
  L39_50 = L39_50(L40_51)
  L41_52 = L39_50
  L40_51 = L39_50.setName
  L42_53 = "locator2_last_cam_02"
  L40_51(L41_52, L42_53)
  L41_52 = L39_50
  L40_51 = L39_50.try_init
  L40_51(L41_52)
  L41_52 = L39_50
  L40_51 = L39_50.waitForReady
  L40_51(L41_52)
  L41_52 = L39_50
  L40_51 = L39_50.try_start
  L40_51(L41_52)
  L41_52 = L39_50
  L40_51 = L39_50.setPos
  L42_53 = L35_46
  L40_51(L41_52, L42_53)
  L40_51 = 2
  L41_52 = {L42_53}
  L42_53 = {}
  L42_53.pos = "locator2_cam_pc_dove_pose_02"
  L42_53.time = L40_51
  L42_53 = {L43_54}
  L43_54 = {}
  L43_54.pos = "locator2_last_aim_01"
  L43_54.time = L40_51
  L43_54 = _sdemo_cut03
  L44_55 = L43_54
  L43_54 = L43_54.setCameraParam
  L47_58.deg = 50
  L43_54(L44_55, L45_56, L46_57, L47_58)
  L43_54 = _sdemo_cut03
  L44_55 = L43_54
  L43_54 = L43_54.set
  L43_54(L44_55, L45_56, L46_57)
  L43_54 = _sdemo_cut03
  L44_55 = L43_54
  L43_54 = L43_54.play
  L43_54(L44_55, L45_56, L46_57)
  L43_54 = Fn_fadein
  L43_54()
  L43_54 = waitSeconds
  L44_55 = 5
  L43_54(L44_55)
  L43_54 = findGameObject2
  L44_55 = "Node"
  L43_54 = L43_54(L44_55, L45_56)
  L44_55 = L43_54
  L43_54 = L43_54.getWorldPos
  L43_54 = L43_54(L44_55)
  L44_55 = Player
  L44_55 = L44_55.setLookAtIk
  L48_59 = L43_54
  L44_55(L45_56, L46_57, L47_58, L48_59)
  L44_55 = waitSeconds
  L44_55(L45_56)
  L44_55 = Fn_blackout
  L44_55()
  L44_55 = Fn_disappearNpc
  L44_55(L45_56)
  L44_55 = _sdemo_cut03
  L44_55 = L44_55.stop
  L44_55(L45_56, L46_57)
  L44_55 = Fn_setBgmPoint
  L44_55(L45_56, L46_57)
  L44_55 = Fn_resetPcPos
  L44_55(L45_56)
  L44_55 = Fn_endCheckPoint
  L44_55()
  while true do
    L44_55 = _pdemo_cut01
    L44_55 = L44_55.isLoading
    L44_55 = L44_55(L45_56)
    if L44_55 == false then
      L44_55 = wait
      L44_55()
    end
  end
  L44_55 = _pdemo_cut01
  L44_55 = L44_55.play
  L44_55(L45_56)
  L44_55 = Fn_setKittenAndCatActive
  L44_55(L45_56)
  L44_55 = Fn_fadein
  L44_55()
  L44_55 = invokeTask
  L44_55(L45_56)
  while true do
    L44_55 = _pdemo_cut01
    L44_55 = L44_55.isEnd
    L44_55 = L44_55(L45_56)
    if L44_55 == false then
      L44_55 = wait
      L44_55()
    end
  end
  function L44_55()
    _pdemo_cut01:stop(0)
    _pdemo_cut01:try_term()
    Fn_setKittenAndCatActive(true)
    Camera:lookTo(findGameObject2("Node", "locator2_end_lookto_node_02"):getWorldPos(), 0, 0)
    Fn_warpNpc("sm10_client", "locator2_client_result")
    Fn_warpNpc("sm10_dove", "locator2_dove_result")
    Fn_setNpcActive("sm10_client", true)
    Fn_repeatPlayMotion("sm10_client", "regret_00", {"regret_00"})
    Fn_setNpcActive("sm10_dove", true)
    Fn_repeatPlayMotion("sm10_dove", "quack_00", {"quack_00"})
  end
  L45_56(L46_57, L47_58)
  L45_56(L46_57)
  L45_56()
  L45_56(L46_57, L47_58)
  L45_56(L46_57)
  L45_56(L46_57)
  L45_56(L46_57)
  for L48_59 = 1, 3 do
    Fn_disappearNpc("sm10_eat_dove_0" .. L48_59)
  end
  if L45_56 then
    L45_56(L46_57)
  end
  _cat_warp_task = nil
  L45_56()
  L45_56()
  L45_56()
  L45_56()
end
function Finalize()
  if _cat_warp_task then
    _cat_warp_task:abort()
  end
  _cat_warp_task = nil
  Mob:restrictNavFor_sm10(false)
  Area:setAnimMoveDriftEnable(true, true, true)
  GameDatabase:set(ggd.GlobalSystemFlags__AreaDrift, true)
  GameDatabase:set(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, true)
end
function raceOutrangeOnLeave()
  if _can_warp_flg then
    HUD:courseOutStart()
    Mv_setGravityCatWarpLeaveArea(true)
  end
end
function gemUnacquired(A0_71)
  if A0_71 ~= nil then
    A0_71:setActive(false)
  end
end
