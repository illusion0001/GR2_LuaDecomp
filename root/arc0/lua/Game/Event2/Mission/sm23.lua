dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/RaceCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/pdemo.lua")
_puppet_tbl = {}
_hdl_tbl = {}
_wangan_flg = false
_next_cp = "locator2_cp_01"
_EVENT_MOTION_TBL = {
  ready = "kit01_stay_fighting_in_00",
  wait = "kit01_stay_fighting_00",
  joy = "kit01_hail_00",
  droop = "kit01_stay_heat_00"
}
_can_warp_flg = true
_cat_warp_task = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21
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
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    {
      name = "sm23_follow_bird_04",
      type = "gull01",
      node = "locator2_follow_bird_04",
      attach = false
    }
  }
  L1_1.name = "sm23_bird_sdemo"
  L1_1.type = "gull01"
  L1_1.node = "locator2_bird_sdemo"
  L1_1.use_gravity = false
  L1_1.not_mob = true
  L2_2.name = "sm23_bird_race"
  L2_2.type = "gull01"
  L2_2.node = "locator2_bird_race"
  L2_2.use_gravity = false
  L2_2.attach = false
  L3_3.name = "sm23_second_son"
  L3_3.type = "chi13"
  L3_3.node = "locator2_second_son"
  L3_3.color_variation = 1
  L3_3.not_mob = true
  L4_4 = {}
  L4_4.name = "sm23_second_son_bird"
  L4_4.type = "gull01"
  L4_4.node = "locator2_second_son_bird"
  L4_4.not_mob = true
  L5_5 = {}
  L5_5.name = "sm23_third_son"
  L5_5.type = "chi13"
  L5_5.node = "locator2_third_son"
  L5_5.color_variation = 0
  L5_5.not_mob = true
  L6_6 = {}
  L6_6.name = "sm23_third_son_bird"
  L6_6.type = "gull01"
  L6_6.node = "locator2_third_son_bird"
  L6_6.not_mob = true
  L7_7 = {}
  L7_7.name = "sm23_dusty"
  L7_7.type = "dus01"
  L7_7.node = "locator2_dusty_02"
  L7_7.active = false
  L8_8 = {}
  L8_8.name = "sm23_esayari_ojisan"
  L8_8.type = "man37"
  L8_8.node = "locator2_esayari_ojisan"
  L8_8.attach = false
  L9_9 = {}
  L9_9.name = "sm23_eat_bird_01"
  L9_9.type = "gull01"
  L9_9.node = "locator2_eat_bird_01"
  L9_9.attach = false
  L10_10.name = "sm23_eat_bird_02"
  L10_10.type = "gull01"
  L10_10.node = "locator2_eat_bird_02"
  L10_10.attach = false
  L11_11.name = "sm23_eat_bird_03"
  L11_11.type = "gull01"
  L11_11.node = "locator2_eat_bird_03"
  L11_11.attach = false
  L12_12.name = "sm23_eat_bird_04"
  L12_12.type = "gull01"
  L12_12.node = "locator2_eat_bird_04"
  L12_12.attach = false
  L13_13.name = "sm23_eat_bird_05"
  L13_13.type = "gull01"
  L13_13.node = "locator2_eat_bird_05"
  L13_13.attach = false
  L14_14 = {}
  L14_14.name = "sm23_swarm_bird_01"
  L14_14.type = "gull01"
  L14_14.node = "locator2_swarm_bird_01"
  L14_14.attach = false
  L14_14.use_gravity = false
  L15_15 = {}
  L15_15.name = "sm23_swarm_bird_02"
  L15_15.type = "gull01"
  L15_15.node = "locator2_swarm_bird_02"
  L15_15.attach = false
  L15_15.use_gravity = false
  L16_16.name = "sm23_swarm_bird_03"
  L16_16.type = "gull01"
  L16_16.node = "locator2_swarm_bird_03"
  L16_16.attach = false
  L16_16.use_gravity = false
  L17_17.name = "sm23_swarm_bird_04"
  L17_17.type = "gull01"
  L17_17.node = "locator2_swarm_bird_04"
  L17_17.attach = false
  L17_17.use_gravity = false
  L18_18.name = "sm23_swarm_bird_05"
  L18_18.type = "gull01"
  L18_18.node = "locator2_swarm_bird_05"
  L18_18.attach = false
  L18_18.use_gravity = false
  L19_19 = {}
  L19_19.name = "sm23_follow_bird_01"
  L19_19.type = "gull01"
  L19_19.node = "locator2_follow_bird_01"
  L19_19.attach = false
  L20_20 = {}
  L20_20.name = "sm23_follow_bird_02"
  L20_20.type = "gull01"
  L20_20.node = "locator2_follow_bird_02"
  L20_20.attach = false
  L21_21 = {}
  L21_21.name = "sm23_follow_bird_03"
  L21_21.type = "gull01"
  L21_21.node = "locator2_follow_bird_03"
  L21_21.attach = false
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = _puppet_tbl
    L7_7 = L5_5.name
    L8_8 = Fn_findNpcPuppet
    L9_9 = L5_5.name
    L8_8 = L8_8(L9_9)
    L6_6[L7_7] = L8_8
    L6_6 = _hdl_tbl
    L7_7 = L5_5.name
    L8_8 = Fn_findNpc
    L9_9 = L5_5.name
    L8_8 = L8_8(L9_9)
    L6_6[L7_7] = L8_8
  end
  L1_1.sm23_client = L2_2
  L1_1.sm23_client = L2_2
  _sdemo_cut01 = L1_1
  _sdemo_cut02 = L1_1
  L4_4 = "up_a_00"
  L4_4 = {}
  L4_4.camera = true
  L4_4.scene_param = false
  _pdemo_cut01 = L1_1
  L4_4 = "up_a_00"
  L4_4 = {}
  L4_4.camera = true
  L4_4.scene_param = false
  _pdemo_cut02 = L1_1
  L4_4 = table
  L4_4 = L4_4.insert
  L5_5 = L3_3
  L6_6 = Fn_createRaceArrow
  L7_7 = "locator2_arrow_01"
  L21_21 = L6_6(L7_7)
  L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L6_6(L7_7))
  function L4_4()
    _next_cp = "locator2_cp_" .. string.format("%02d", L1_1)
    L1_1 = L1_1 + 1
  end
  function L5_5()
    local L0_22
    L0_22 = L4_4
    L0_22()
    L0_22 = Fn_createRaceArrow
    L0_22 = L0_22("locator2_arrow_" .. string.format("%02d", L2_2))
    table.insert(L3_3, L0_22)
    L2_2 = L2_2 + 1
  end
  function L6_6()
    L4_4()
    for _FORV_3_, _FORV_4_ in ipairs(L3_3) do
      if _FORV_4_ then
        _FORV_4_:try_term()
      end
    end
    L3_3 = {}
  end
  function L7_7()
    L4_4()
    Fn_setBgmPoint("event", "race_climax")
    _wangan_flg = true
  end
  L8_8 = {
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18,
    L19_19,
    L20_20,
    L21_21,
    {
      name = "locator2_cp_14",
      opt = {func = L4_4}
    },
    {
      name = "locator2_cp_15",
      opt = {func = L7_7}
    },
    {
      name = "locator2_cp_16",
      opt = {func = L5_5}
    },
    {
      name = "locator2_cp_17",
      opt = {func = L4_4}
    },
    {
      name = "locator2_cp_18",
      opt = {func = L4_4}
    },
    {
      name = "locator2_cp_19",
      opt = {func = L4_4}
    },
    {
      name = "locator2_cp_20",
      opt = {func = L4_4}
    },
    {
      name = "locator2_cp_21",
      opt = {marker = "goal"}
    }
  }
  L9_9 = {}
  L9_9.name = "locator2_cp_01"
  L10_10.func = L4_4
  L9_9.opt = L10_10
  L10_10.name = "locator2_cp_02"
  L11_11.func = L4_4
  L10_10.opt = L11_11
  L11_11.name = "locator2_cp_03"
  L12_12.func = L6_6
  L11_11.opt = L12_12
  L12_12.name = "locator2_cp_04"
  L13_13.func = L5_5
  L12_12.opt = L13_13
  L13_13.name = "locator2_cp_05"
  L14_14 = {}
  L14_14.func = L5_5
  L13_13.opt = L14_14
  L14_14 = {}
  L14_14.name = "locator2_cp_06"
  L15_15 = {}
  L15_15.func = L4_4
  L14_14.opt = L15_15
  L15_15 = {}
  L15_15.name = "locator2_cp_07"
  L16_16.func = L6_6
  L15_15.opt = L16_16
  L16_16.name = "locator2_cp_08"
  L17_17.func = L4_4
  L16_16.opt = L17_17
  L17_17.name = "locator2_cp_09"
  L18_18.func = L5_5
  L17_17.opt = L18_18
  L18_18.name = "locator2_cp_10"
  L19_19 = {}
  L19_19.func = L4_4
  L18_18.opt = L19_19
  L19_19 = {}
  L19_19.name = "locator2_cp_11"
  L20_20 = {}
  L20_20.func = L4_4
  L19_19.opt = L20_20
  L20_20 = {}
  L20_20.name = "locator2_cp_12"
  L21_21 = {}
  L21_21.func = L6_6
  L20_20.opt = L21_21
  L21_21 = {}
  L21_21.name = "locator2_cp_13"
  L21_21.opt = {func = L5_5}
  L9_9 = Fn_setCheckPointTable
  L14_14 = 3
  L15_15 = 3
  L11_11.size = L12_12
  L11_11.marker = "air"
  L9_9(L10_10, L11_11)
  L9_9 = {}
  L9_9.vctrl2_cp_00 = L10_10
  L9_9.vctrl2_cp_01 = L10_10
  L9_9.vctrl2_cp_02 = L10_10
  L9_9.vctrl2_cp_03 = L10_10
  L9_9.vctrl2_cp_04 = L10_10
  L9_9.vctrl2_cp_05 = L10_10
  L9_9.vctrl2_cp_06 = L10_10
  L9_9.vctrl2_cp_07 = L10_10
  L9_9.vctrl2_cp_08 = L10_10
  L9_9.vctrl2_cp_09 = L10_10
  L9_9.vctrl2_cp_10 = L10_10
  L9_9.vctrl2_cp_11 = L10_10
  L9_9.vctrl2_cp_12 = L10_10
  L9_9.vctrl2_cp_13 = L10_10
  L9_9.vctrl2_cp_14 = L10_10
  L9_9.vctrl2_cp_15 = L10_10
  L9_9.vctrl2_cp_16 = L10_10
  L9_9.vctrl2_cp_17 = L10_10
  L9_9.vctrl2_cp_18 = L10_10
  L9_9.vctrl2_cp_19 = L10_10
  L9_9.vctrl2_cp_20 = L10_10
  for L13_13, L14_14 in L10_10(L11_11) do
    L15_15 = findGameObject2
    L15_15 = L15_15(L16_16, L17_17)
    if L15_15 ~= nil then
      L16_16(L17_17, L18_18)
    end
  end
  L14_14 = "locator2_follow_bird_formation_v_03"
  L15_15 = "locator2_follow_bird_formation_v_04"
  L10_10.formation_v = L11_11
  for L14_14, L15_15 in L11_11(L12_12) do
    for L19_19, L20_20 in L16_16(L17_17) do
      L21_21 = findGameObject2
      L21_21 = L21_21("Node", L20_20)
      _puppet_tbl.sm23_bird_race:appendChild(L21_21, true)
    end
  end
  L14_14 = "Node"
  L15_15 = "locator2_ef_pos"
  L14_14 = true
  L11_11(L12_12, L13_13, L14_14)
  for L14_14 = 2, 9 do
    L15_15 = Fn_pcSensorOff
    L19_19 = L14_14
    L15_15(L16_16)
  end
  L11_11(L12_12)
  L12_12.max = L13_13
  L11_11.counter = L12_12
  L12_12(L13_13)
  L12_12()
  L12_12()
end
function Ingame()
  local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L9_32, L10_33, L11_34, L12_35, L13_36, L14_37, L15_38, L16_39, L17_40, L18_41
  L0_23(L1_24, L2_25)
  L0_23(L1_24, L2_25)
  for L3_26 = 1, 4 do
    L4_27 = _puppet_tbl
    L5_28 = "sm23_follow_bird_"
    L6_29 = string
    L6_29 = L6_29.format
    L7_30 = "%02d"
    L8_31 = L3_26
    L6_29 = L6_29(L7_30, L8_31)
    L5_28 = L5_28 .. L6_29
    L4_27 = L4_27[L5_28]
    L5_28 = L4_27
    L4_27 = L4_27.setCollidable
    L6_29 = false
    L4_27(L5_28, L6_29)
    L4_27 = _puppet_tbl
    L5_28 = "sm23_follow_bird_"
    L6_29 = string
    L6_29 = L6_29.format
    L7_30 = "%02d"
    L8_31 = L3_26
    L6_29 = L6_29(L7_30, L8_31)
    L5_28 = L5_28 .. L6_29
    L4_27 = L4_27[L5_28]
    L5_28 = L4_27
    L4_27 = L4_27.setDetectable
    L6_29 = false
    L4_27(L5_28, L6_29)
  end
  L0_23(L1_24)
  _cat_warp_task = L0_23
  L3_26 = 16
  L4_27 = 20
  L5_28 = Fn_loadPlayerMotion
  L6_29 = _EVENT_MOTION_TBL
  L5_28(L6_29)
  L5_28 = false
  function L6_29()
    local L0_42, L1_43, L2_44, L3_45, L4_46, L5_47, L6_48
    L0_42 = Fn_findNpcPuppet
    L1_43 = "sm23_bird_sdemo"
    L0_42 = L0_42(L1_43)
    L1_43 = L0_42
    L0_42 = L0_42.leaveFromParent
    L0_42(L1_43)
    L0_42 = Fn_warpNpc
    L1_43 = "sm23_bird_sdemo"
    L2_44 = "locator2_bird_sdemo_warp"
    L0_42(L1_43, L2_44)
    L0_42 = Quat
    L1_43 = 0
    L2_44 = -0.75
    L0_42 = L0_42(L1_43, L2_44, L3_45, L4_46)
    L1_43 = _puppet_tbl
    L1_43 = L1_43.sm23_bird_sdemo
    L2_44 = L1_43
    L1_43 = L1_43.setWorldRot
    L1_43(L2_44, L3_45)
    L1_43 = {}
    L1_43.isStop = true
    L2_44 = nil
    L3_45(L4_46)
    L3_45(L4_46)
    for L6_48 = 1, 10 do
      invokeTask(function()
        waitSeconds(RandI(3))
        Fn_playMotionNpc("sm23_eat_bird_" .. string.format("%02d", L6_48), "eat", false)
      end)
      break
    end
    L6_48 = false
    L3_45(L4_46, L5_47, L6_48)
    L3_45(L4_46)
    L6_48 = "Node"
    L6_48 = L5_47
    L6_48 = 0
    L3_45(L4_46, L5_47, L6_48, 0)
  end
  function L7_30()
    local L0_49, L1_50, L2_51, L3_52
    L0_49 = {}
    L1_50 = GameDatabase
    L2_51 = L1_50
    L1_50 = L1_50.get
    L3_52 = ggd
    L3_52 = L3_52.EventFlags__sm23__flag01
    L1_50 = L1_50(L2_51, L3_52)
    if L1_50 ~= 1 then
      L1_50 = Fn_findNpc
      L2_51 = "sm23_client"
      L1_50 = L1_50(L2_51)
      L2_51 = L1_50
      L1_50 = L1_50.setPilots
      L3_52 = {
        {
          pilot = _puppet_tbl.sm23_bird_sdemo,
          attach = "loc_r_hand"
        }
      }
      L1_50(L2_51, L3_52)
      L1_50 = Fn_repeatPlayMotion
      L2_51 = "sm23_second_son"
      L3_52 = "idle_ep13_00"
      L1_50 = L1_50(L2_51, L3_52, {
        "idle_ep13_00"
      })
      L0_49[1] = L1_50
      L1_50 = {}
      L1_50.mot = "chi01_cheer_00"
      L2_51 = Fn_loadNpcEventMotion
      L3_52 = "sm23_third_son"
      L2_51(L3_52, L1_50)
      L2_51 = Fn_repeatPlayMotion
      L3_52 = "sm23_third_son"
      L2_51 = L2_51(L3_52, L1_50.mot, {
        L1_50.mot
      })
      L0_49[2] = L2_51
      L2_51 = Fn_playMotionNpc
      L3_52 = "sm23_client"
      L2_51(L3_52, "idle_ep23_00", false)
      L2_51 = GameDatabase
      L3_52 = L2_51
      L2_51 = L2_51.set
      L2_51(L3_52, ggd.EventFlags__sm23__flag01, 1)
    end
    L1_50 = {L2_51, L3_52}
    L2_51 = {}
    L2_51.pos = "locator2_cam_client_02"
    L2_51.time = 4
    L2_51.hashfunc = "EaseIn"
    L3_52 = {}
    L3_52.pos = "locator2_cam_client_03"
    L3_52.time = 2
    L3_52.hashfunc = "EaseOut"
    L2_51 = {L3_52}
    L3_52 = {}
    L3_52.pos = "locator2_aim_client_01"
    L3_52.time = 4
    L3_52 = _sdemo_cut01
    L3_52 = L3_52.set
    L3_52(L3_52, "locator2_cam_client_01", "locator2_aim_client_01", false)
    L3_52 = _sdemo_cut01
    L3_52 = L3_52.play
    L3_52(L3_52, L1_50, L2_51)
    L3_52 = Fn_missionStart
    L3_52()
    L3_52 = waitSeconds
    L3_52(1)
    while true do
      L3_52 = _sdemo_cut01
      L3_52 = L3_52.isPlay
      L3_52 = L3_52(L3_52)
      if L3_52 then
        L3_52 = wait
        L3_52()
      end
    end
    L3_52 = waitSeconds
    L3_52(0.5)
    L3_52 = {
      {
        pos = "locator2_cam_client_04",
        time = 2
      }
    }
    L1_50 = L3_52
    L3_52 = {
      {
        pos = "locator2_aim_client_02",
        time = 2
      }
    }
    L2_51 = L3_52
    L3_52 = _sdemo_cut01
    L3_52 = L3_52.play
    L3_52(L3_52, L1_50, L2_51)
    while true do
      L3_52 = _sdemo_cut01
      L3_52 = L3_52.isPlay
      L3_52 = L3_52(L3_52)
      if L3_52 then
        L3_52 = wait
        L3_52()
      end
    end
    L3_52 = waitSeconds
    L3_52(1)
    L3_52 = Fn_kaiwaDemoView
    L3_52("sm23_00100k")
    function L3_52()
      _sdemo_cut01:stop(0)
      if L0_49 ~= 0 then
        for _FORV_3_ = 1, #L0_49 do
          if L0_49[_FORV_3_] ~= nil then
            L0_49[_FORV_3_]:abort()
          end
          L0_49[_FORV_3_] = nil
        end
      end
      if _FOR_ ~= nil then
        L0_23:abort()
      end
      L0_23 = nil
      Fn_setNpcActive("sm23_client", false)
      Fn_setNpcActive("sm23_bird_sdemo", false)
      Fn_setNpcActive("sm23_second_son", false)
      Fn_setNpcActive("sm23_second_son_bird", false)
      Fn_setNpcActive("sm23_third_son", false)
      Fn_setNpcActive("sm23_third_son_bird", false)
      L6_29()
    end
    Fn_sceneConversion("locator2_pc_race_start_pos", L3_52)
    Fn_userCtrlOff()
    Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
    waitSeconds(1)
    wait()
  end
  L8_31 = Fn_skipMissionRetryAtProcessing
  L9_32 = L7_30
  L8_31 = L8_31(L9_32)
  if not L8_31 then
    L8_31 = Fn_setNpcActive
    L9_32 = "sm23_client"
    L10_33 = false
    L8_31(L9_32, L10_33)
    L8_31 = Fn_setNpcActive
    L9_32 = "sm23_bird_sdemo"
    L10_33 = false
    L8_31(L9_32, L10_33)
    L8_31 = Fn_setNpcActive
    L9_32 = "sm23_second_son"
    L10_33 = false
    L8_31(L9_32, L10_33)
    L8_31 = Fn_setNpcActive
    L9_32 = "sm23_second_son_bird"
    L10_33 = false
    L8_31(L9_32, L10_33)
    L8_31 = Fn_setNpcActive
    L9_32 = "sm23_third_son"
    L10_33 = false
    L8_31(L9_32, L10_33)
    L8_31 = Fn_setNpcActive
    L9_32 = "sm23_third_son_bird"
    L10_33 = false
    L8_31(L9_32, L10_33)
    L8_31 = L6_29
    L8_31()
    L8_31 = Fn_missionStart
    L8_31()
    L8_31 = waitSeconds
    L9_32 = 0.5
    L8_31(L9_32)
  end
  L8_31 = false
  L9_32 = invokeTask
  function L10_33()
    Fn_runCheckPoint()
    L8_31 = true
  end
  L9_32(L10_33)
  L9_32 = Fn_setBgmPoint
  L10_33 = "event"
  L11_34 = "race_pri"
  L9_32(L10_33, L11_34)
  L9_32 = Mv_gravityCatWarpInit
  L10_33 = _sdemo_cut02
  L11_34 = "sm23_bird_race"
  L12_35 = "stay_01"
  L13_36 = _EVENT_MOTION_TBL
  L13_36 = L13_36.ready
  L9_32(L10_33, L11_34, L12_35, L13_36, L14_37)
  L9_32 = Mv_countDownSdemoFunc
  L9_32()
  L9_32 = Fn_timerStart
  L9_32()
  L9_32 = Fn_userCtrlOn
  L9_32()
  L9_32 = Camera
  L10_33 = L9_32
  L9_32 = L9_32.setControl
  L11_34 = Camera
  L11_34 = L11_34.kPlayer
  L12_35 = Camera
  L12_35 = L12_35.kControl_All
  L13_36 = true
  L9_32(L10_33, L11_34, L12_35, L13_36)
  L9_32 = HUD
  L10_33 = L9_32
  L9_32 = L9_32.mnaviNew
  L11_34 = {}
  L11_34.name = "bird_navi"
  L11_34.PochFadeLen0 = 20
  L11_34.PochFadeLen100 = 30
  L9_32 = L9_32(L10_33, L11_34)
  L11_34 = L9_32
  L10_33 = L9_32.setTarget
  L12_35 = _puppet_tbl
  L12_35 = L12_35.sm23_bird_race
  L10_33(L11_34, L12_35)
  L11_34 = L9_32
  L10_33 = L9_32.setActive
  L12_35 = true
  L10_33(L11_34, L12_35)
  L10_33 = Fn_setCatWarpCheckPoint
  L11_34 = "locator2_pc_race_start_pos"
  L10_33(L11_34)
  L10_33 = Fn_setBgmPoint
  L11_34 = "event"
  L12_35 = "race_start"
  L10_33(L11_34, L12_35)
  L10_33 = false
  L11_34 = false
  L12_35 = {}
  L13_36 = {
    L14_37,
    L15_38,
    L16_39,
    L17_40,
    L18_41,
    {
      pos = "locator2_bird_path_03_over",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_04",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_04_over",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_05",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_05_over",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_06",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_06_over",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_07",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_07_over",
      attr = "fly"
    }
  }
  L14_37.pos = "locator2_bird_path_01"
  L14_37.attr = "takeoff"
  L15_38.pos = "locator2_bird_path_01_over"
  L15_38.attr = "fly"
  L16_39.pos = "locator2_bird_path_02"
  L16_39.attr = "fly"
  L17_40 = {}
  L17_40.pos = "locator2_bird_path_02_over"
  L17_40.attr = "fly"
  L18_41 = {}
  L18_41.pos = "locator2_bird_path_03"
  L18_41.attr = "fly"
  L12_35.start = L13_36
  L13_36 = {
    L14_37,
    L15_38,
    L16_39,
    L17_40,
    L18_41,
    {
      pos = "locator2_bird_path_10_over",
      attr = "fly"
    }
  }
  L14_37.pos = "locator2_bird_path_08"
  L14_37.attr = "fly"
  L15_38.pos = "locator2_bird_path_08_over"
  L15_38.attr = "fly"
  L16_39.pos = "locator2_bird_path_09"
  L16_39.attr = "fly"
  L17_40 = {}
  L17_40.pos = "locator2_bird_path_09_over"
  L17_40.attr = "fly"
  L18_41 = {}
  L18_41.pos = "locator2_bird_path_10"
  L18_41.attr = "fly"
  L12_35.esayari = L13_36
  L13_36 = {
    L14_37,
    L15_38,
    L16_39,
    L17_40,
    L18_41,
    {
      pos = "locator2_bird_path_13_over",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_14",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_14_over",
      attr = "fly"
    }
  }
  L14_37.pos = "locator2_bird_path_11"
  L14_37.attr = "fly"
  L15_38.pos = "locator2_bird_path_11_over"
  L15_38.attr = "fly"
  L16_39.pos = "locator2_bird_path_12"
  L16_39.attr = "fly"
  L17_40 = {}
  L17_40.pos = "locator2_bird_path_12_over"
  L17_40.attr = "fly"
  L18_41 = {}
  L18_41.pos = "locator2_bird_path_13"
  L18_41.attr = "fly"
  L12_35.race = L13_36
  L13_36 = {
    L14_37,
    L15_38,
    L16_39,
    L17_40,
    L18_41,
    {
      pos = "locator2_bird_path_17_over",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_18",
      attr = "fly"
    },
    {
      pos = "locator2_bird_path_18_over",
      attr = "fly"
    }
  }
  L14_37.pos = "locator2_bird_path_15"
  L14_37.attr = "fly"
  L15_38.pos = "locator2_bird_path_15_over"
  L15_38.attr = "fly"
  L16_39.pos = "locator2_bird_path_16"
  L16_39.attr = "fly"
  L17_40 = {}
  L17_40.pos = "locator2_bird_path_16_over"
  L17_40.attr = "fly"
  L18_41 = {}
  L18_41.pos = "locator2_bird_path_17"
  L18_41.attr = "fly"
  L12_35.wangan = L13_36
  L13_36 = {
    L14_37,
    L15_38,
    L16_39,
    L17_40,
    L18_41
  }
  L14_37.pos = "locator2_bird_path_19"
  L14_37.attr = "fly"
  L15_38.pos = "locator2_bird_path_19_over"
  L15_38.attr = "fly"
  L16_39.pos = "locator2_bird_path_20"
  L16_39.attr = "fly"
  L17_40 = {}
  L17_40.pos = "locator2_bird_path_20_over"
  L17_40.attr = "fly"
  L18_41 = {}
  L18_41.pos = "locator2_bird_path_21"
  L18_41.attr = "fly"
  L12_35.goal = L13_36
  L13_36 = {L14_37}
  L14_37.pos = "locator2_bird_path_land"
  L14_37.attr = "land"
  L12_35.land = L13_36
  L13_36 = nil
  L14_37(L15_38)
  L14_37(L15_38)
  L14_37(L15_38)
  L14_37(L15_38)
  while true do
    if L8_31 then
      L11_34 = true
      L14_37(L15_38)
      L14_37(L15_38, L16_39)
      break
    end
    if L10_33 then
      L11_34 = false
      break
    end
    L14_37()
  end
  L14_37(L15_38, L16_39)
  L14_37()
  L14_37()
  _can_warp_flg = false
  repeat
    L14_37()
  until L14_37 == false
  L14_37()
  for L17_40 = 1, 4 do
    L18_41 = L1_24[L17_40]
    if L18_41 ~= nil then
      L18_41 = Sound
      L18_41 = L18_41.stopSEHandle
      L18_41(L18_41, L1_24[L17_40])
    end
  end
  if L13_36 ~= nil then
    L14_37(L15_38, L16_39)
  end
  for L17_40 = 1, 9 do
    L18_41 = Fn_pcSensorOff
    L18_41("pccubesensor2_outrange_" .. string.format("%02d", L17_40))
  end
  if not L11_34 then
    if L14_37 < 19 then
      L14_37(L15_38)
    else
      L14_37(L15_38)
    end
  end
  if L11_34 then
  else
  end
  L17_40 = Fn_blackout
  L17_40()
  L17_40 = Fn_resetPcPos
  L18_41 = L14_37
  L17_40(L18_41)
  L17_40 = Fn_setBgmPoint
  L18_41 = "event"
  L17_40(L18_41, "race_end")
  L17_40 = {}
  L17_40.timer = false
  L17_40.counter = false
  L18_41 = Fn_counterView
  L18_41(L17_40)
  L18_41 = HUD
  L18_41 = L18_41.mnaviFind
  L18_41 = L18_41(L18_41, "bird_navi")
  L18_41 = L18_41.del
  L18_41(L18_41, false)
  L18_41 = Fn_getPlayer
  L18_41 = L18_41()
  L18_41 = L18_41.setCollidable
  L18_41(L18_41, false)
  L18_41 = Fn_setKittenActive
  L18_41(false)
  L18_41 = Fn_setCatActive
  L18_41(false)
  if L11_34 then
    while true do
      L18_41 = _pdemo_cut01
      L18_41 = L18_41.isLoading
      L18_41 = L18_41(L18_41)
      if L18_41 == false then
        L18_41 = wait
        L18_41()
      end
    end
    L18_41 = _pdemo_cut01
    L18_41 = L18_41.play
    L18_41(L18_41)
    L18_41 = Fn_fadein
    L18_41(2)
  end
  L18_41 = waitSeconds
  L18_41(1)
  if L11_34 then
    L18_41 = invokeTask
    L18_41(function()
      Sound:pulse("clear_jingle")
      Sound:playSE("kit052c", 1, "")
    end)
    L18_41 = Fn_captionViewWait
    L18_41("sm23_00109", 2)
    function L18_41()
      _pdemo_cut01:stop(0)
      _pdemo_cut01:try_term()
      Fn_getPlayer():setCollidable(true)
      Fn_setKittenActive(true)
      Fn_setCatActive(true)
      Camera:lookTo(findGameObject2("Node", "locator2_end_lookto_node_01"):getWorldPos(), 0, 0)
      Fn_setNpcActive("sm23_client", true)
      Fn_setNpcActive("sm23_bird_sdemo", true)
      Fn_setNpcActive("sm23_second_son", true)
      Fn_setNpcActive("sm23_second_son_bird", true)
      Fn_setNpcActive("sm23_third_son", true)
      Fn_setNpcActive("sm23_third_son_bird", true)
      Fn_playMotionNpc("sm23_client", "idle_ep13_00", false)
      Fn_playMotionNpc("sm23_bird_sdemo", "stay_00", false)
      Fn_playMotionNpc("sm23_second_son", "cry_00", false)
      Fn_playMotionNpc("sm23_second_son_bird", "stay_00", false)
      Fn_playMotionNpc("sm23_third_son", "regret_00", false)
      Fn_playMotionNpc("sm23_third_son_bird", "stay_00", false)
    end
    Fn_kaiwaDemoView2("sm23_00200k", L18_41)
    waitSeconds(0.1)
  else
    L18_41 = Fn_getPlayer
    L18_41 = L18_41()
    L18_41 = L18_41.setCollidable
    L18_41(L18_41, true)
    L18_41 = Fn_setKittenActive
    L18_41(true)
    L18_41 = Fn_setCatActive
    L18_41(true)
    L18_41 = Fn_missionRetry
    L18_41()
  end
  L18_41 = Fn_userCtrlOn
  L18_41()
  L18_41 = Player
  L18_41 = L18_41.setStay
  L18_41(L18_41, false)
  L18_41 = _cat_warp_task
  if L18_41 then
    L18_41 = _cat_warp_task
    L18_41 = L18_41.abort
    L18_41(L18_41)
  end
  _cat_warp_task = nil
  L18_41 = Fn_setKeepPlayerPos
  L18_41()
  L18_41 = Fn_setNextMissionFlag
  L18_41()
  L18_41 = Fn_nextMission
  L18_41()
  L18_41 = Fn_exitSandbox
  L18_41()
end
function Finalize()
  if _cat_warp_task then
    _cat_warp_task:abort()
  end
  _cat_warp_task = nil
end
function raceOutrange_OnLeave()
  if _can_warp_flg then
    Mv_setGravityCatWarpLeaveArea(true)
    HUD:courseOutStart()
  end
end
